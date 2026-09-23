/**
 * geminiOcr.js
 * Tích hợp Gemini Multimodal API để nhận diện PDF/Ảnh thành mã Typst chuẩn sang-math:1.0.5
 * Kết hợp vẽ hình CeTZ bằng thư viện chuẩn sang-math-geom (sm-*)
 *
 * TÍNH NĂNG THÔNG MINH MỚI:
 * 1. Cơ chế Auto-Retry với Exponential Backoff khi gặp lỗi 503 "High Demand" / 429 Rate Limit.
 * 2. Cơ chế Fallback Model thông minh (gemini-3.8-flash -> gemini-3.7-flash -> gemini-3.1-pro).
 * 3. Hỗ trợ xử lý từng trang PDF và ghép nối (merge) thành tài liệu đề thi hoàn chỉnh.
 */

export const DEFAULT_GEMINI_MODEL = 'gemini-3.8-flash'

// Chuẩn hóa tên model để tránh dùng model không tồn tại
export function normalizeGeminiModel(model) {
  if (!model) return DEFAULT_GEMINI_MODEL
  if (model === 'gemini-3.1-pro') return 'gemini-3.1-pro-preview'
  return model
}

// Danh sách mô hình dự phòng theo thứ tự ưu tiên
const MODEL_FALLBACK_CHAINS = {
  'gemini-3.8-flash': ['gemini-3.7-flash', 'gemini-3.5-flash', 'gemini-3.1-pro-preview'],
  'gemini-3.7-flash': ['gemini-3.8-flash', 'gemini-3.5-flash', 'gemini-3.1-pro-preview'],
  'gemini-3.5-flash': ['gemini-3.8-flash', 'gemini-3.7-flash', 'gemini-3.1-pro-preview'],
  'gemini-3.1-pro-preview': ['gemini-3.8-flash', 'gemini-3.7-flash', 'gemini-3.5-flash']
}

export const GEMINI_SYSTEM_PROMPT = `Bạn là chuyên gia chuyển đổi đề thi Toán THPT Việt Nam thành mã nguồn Typst chính xác 100%.

QUY TẮC BẮT BUỘC:
1. Sử dụng gói chính thức: #import "@preview/sang-math:1.0.5": *
2. Bốn định dạng câu hỏi chuẩn Bộ Giáo Dục:
   - Trắc nghiệm 4 lựa chọn (Phần I):
     #tn([Nội dung câu hỏi], ([$A$], True([$B$]), [$C$], [$D$]), id: "TN01", loigiai: [Lời giải chi tiết])
   - Trắc nghiệm Đúng - Sai (Phần II):
     #ds([Nội dung chung], (True([Mệnh đề a đúng]), [Mệnh đề b sai], True([Mệnh đề c đúng]), [Mệnh đề d sai]), id: "DS01", loigiai: [Lời giải chi tiết])
   - Trả lời ngắn (Phần III):
     #tln([Nội dung câu hỏi], [$42$], id: "TLN01", loigiai: [Lời giải chi tiết])
   - Tự luận (Phần IV):
     #tl([Nội dung câu hỏi], id: "TL01", lines: 6, loigiai: [Lời giải chi tiết])

3. QUY TẮC VẼ HÌNH HỌC:
   - Nếu trong đề có hình vẽ hình học (hình học không gian, hình phẳng, đồ thị):
   - BẮT BUỘC ưu tiên dựng bằng CeTZ kết hợp các hàm sm-* chuẩn của sang-math-geom (như sm-khoi-chop-s-abc, sm-khoi-lang-tru, sm-doan, sm-diem, sm-ve-goc).
   - Tuyệt đối không để ảnh rỗng hoặc comment mơ hồ nếu có thể viết code CeTZ.

4. ĐỊNH DẠNG ĐẦU RA:
   - Chỉ trả về MÃ NGUỒN TYPST DUY NHẤT.
   - Không bọc trong \`\`\`typst hay bất kỳ văn bản giải thích nào khác.
`

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms))
}

/**
 * Kiểm tra xem lỗi có phải do quá tải / high demand / rate limit không
 */
function isOverloadedError(status, message = '') {
  const msg = (message || '').toLowerCase()
  return (
    status === 503 ||
    status === 429 ||
    status === 500 ||
    status === 504 ||
    msg.includes('high demand') ||
    msg.includes('temporarily unavailable') ||
    msg.includes('resource has been exhausted') ||
    msg.includes('try again later') ||
    msg.includes('overloaded') ||
    msg.includes('spikes in demand') ||
    msg.includes('deadline exceeded')
  )
}

/**
 * Gửi yêu cầu tới Gemini API với cơ chế tự động thử lại (Retry) và chuyển mô hình dự phòng (Fallback)
 */
async function callGeminiApiWithRetry(fileBase64, mimeType, apiKey, options = {}) {
  const requestedModel = options.model || DEFAULT_GEMINI_MODEL
  const primaryModel = normalizeGeminiModel(requestedModel)
  const fallbackList = MODEL_FALLBACK_CHAINS[primaryModel] || ['gemini-3.8-flash', 'gemini-3.7-flash', 'gemini-3.5-flash']
  const candidateModels = [primaryModel, ...fallbackList]

  const cleanBase64 = fileBase64.replace(/^data:[^;]+;base64,/, '')
  const maxRetriesPerModel = options.maxRetries ?? 2
  const onProgress = options.onProgress || (() => {})

  let lastError = null

  for (let modelIndex = 0; modelIndex < candidateModels.length; modelIndex++) {
    const currentModel = candidateModels[modelIndex]
    const isFallback = modelIndex > 0

    if (isFallback) {
      onProgress({
        type: 'fallback',
        model: currentModel,
        message: `Đang chuyển sang mô hình dự phòng: ${currentModel}...`
      })
    }

    const endpoint = `https://generativelanguage.googleapis.com/v1beta/models/${currentModel}:generateContent?key=${apiKey.trim()}`

    const payload = {
      contents: [
        {
          parts: [
            { text: GEMINI_SYSTEM_PROMPT },
            {
              inline_data: {
                mime_type: mimeType,
                data: cleanBase64
              }
            },
            {
              text: options.userPrompt || 'Hãy nhận diện và chuyển toàn bộ tài liệu này sang mã nguồn Typst chuẩn sang-math:1.0.5 theo đúng hợp đồng.'
            }
          ]
        }
      ],
      generationConfig: {
        temperature: 0.1,
        maxOutputTokens: 8192
      }
    }

    for (let attempt = 1; attempt <= maxRetriesPerModel; attempt++) {
      try {
        onProgress({
          type: 'request',
          model: currentModel,
          attempt,
          maxAttempts: maxRetriesPerModel,
          message: `Đang gửi yêu cầu tới ${currentModel} (Lần ${attempt}/${maxRetriesPerModel})...`
        })

        const response = await fetch(endpoint, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload)
        })

        if (!response.ok) {
          const errorData = await response.json().catch(() => ({}))
          const errorMsg = errorData.error?.message || `HTTP ${response.status}`
          const status = response.status

          // Nếu model không tồn tại (404 / Not Found) hoặc không hỗ trợ generateContent
          if (status === 404 || errorMsg.includes('not found') || errorMsg.includes('is not supported')) {
            onProgress({
              type: 'fallback',
              model: currentModel,
              message: `Mô hình ${currentModel} không tồn tại trên endpoint v1beta. Đang chuyển sang mô hình dự phòng...`
            })
            lastError = new Error(`Mô hình ${currentModel} không tồn tại: ${errorMsg}`)
            break // Bỏ qua model này, chuyển ngay sang model kế tiếp
          }

          if (isOverloadedError(status, errorMsg)) {
            // Lỗi quá tải, cần thử lại với backoff
            const delay = 1500 * Math.pow(1.8, attempt - 1) + Math.random() * 600
            onProgress({
              type: 'retry',
              model: currentModel,
              attempt,
              maxAttempts: maxRetriesPerModel,
              delayMs: Math.round(delay),
              message: `Mô hình ${currentModel} đang quá tải ("${errorMsg}"). Thử lại sau ${(delay / 1000).toFixed(1)}s...`
            })

            lastError = new Error(`Gemini ${currentModel} quá tải: ${errorMsg}`)
            if (attempt < maxRetriesPerModel) {
              await sleep(delay)
              continue
            } else {
              break
            }
          }

          // Lỗi khác (Invalid Key v.v.)
          throw new Error(errorMsg)
        }

        const result = await response.json()
        const rawText = result.candidates?.[0]?.content?.parts?.[0]?.text || ''

        // Làm sạch code fence
        const cleanCode = rawText
          .replace(/^```(?:typst)?\s*\n?/i, '')
          .replace(/\n?```\s*$/i, '')
          .trim()

        return {
          code: cleanCode,
          usedModel: currentModel
        }
      } catch (err) {
        lastError = err
        const isOverloaded = isOverloadedError(0, err.message)
        if (isOverloaded && attempt < maxRetriesPerModel) {
          const delay = 1500 * Math.pow(1.8, attempt - 1) + Math.random() * 600
          onProgress({
            type: 'retry',
            model: currentModel,
            attempt,
            maxAttempts: maxRetriesPerModel,
            delayMs: Math.round(delay),
            message: `Máy chủ bận: ${err.message}. Tự động thử lại sau ${(delay / 1000).toFixed(1)}s...`
          })
          await sleep(delay)
        } else if (!isOverloaded) {
          // Lỗi nghiêm trọng không phải quá tải, ném ra ngay
          throw err
        }
      }
    }
  }

  // Nếu duyệt qua toàn bộ fallback vẫn lỗi
  throw new Error(
    lastError?.message ||
    'Tất cả các mô hình Gemini hiện đang quá tải do lượng truy cập cao. Vui lòng thử lại sau giây lát.'
  )
}

/**
 * Nhận diện một ảnh / một trang tài liệu
 * @param {string} fileBase64 
 * @param {string} mimeType 
 * @param {string} apiKey 
 * @param {object} options 
 * @returns {Promise<string>} Mã Typst sạch
 */
export async function recognizeExamWithGemini(fileBase64, mimeType, apiKey, options = {}) {
  if (!apiKey || !apiKey.trim()) {
    throw new Error('Vui lòng cung cấp Gemini API Key để thực hiện nhận diện.')
  }

  const { code } = await callGeminiApiWithRetry(fileBase64, mimeType, apiKey, options)
  return code
}

/**
 * Nhận diện nhiều trang (PDF) theo cơ chế tuần tự thông minh
 * @param {Array<{ base64: string, pageNum: number, mimeType: string }>} pages 
 * @param {string} apiKey 
 * @param {object} options 
 * @param {(progress: { current: number, total: number, pageNum: number, status: string }) => void} onPageProgress 
 * @returns {Promise<{ fullTypstCode: string, pageResults: Array<{ pageNum: number, code: string }> }>}
 */
export async function recognizeMultiplePagesWithGemini(pages, apiKey, options = {}, onPageProgress = null) {
  const pageResults = []
  const total = pages.length

  for (let i = 0; i < total; i++) {
    const page = pages[i]
    const pageNum = page.pageNum || (i + 1)

    if (onPageProgress) {
      onPageProgress({
        current: i + 1,
        total,
        pageNum,
        status: `Đang nhận diện trang ${pageNum}/${total}...`
      })
    }

    const { code, usedModel } = await callGeminiApiWithRetry(page.base64, page.mimeType || 'image/jpeg', apiKey, {
      ...options,
      onProgress: (p) => {
        if (onPageProgress) {
          onPageProgress({
            current: i + 1,
            total,
            pageNum,
            status: `[Trang ${pageNum}/${total}] ${p.message}`
          })
        }
      }
    })

    pageResults.push({ pageNum, code, usedModel })
  }

  // Ghép nối các trang thành một tài liệu Typst hoàn chỉnh
  const fullTypstCode = mergeTypstExamPages(pageResults, {
    title: options.title || 'ĐỀ THI TOÁN THPT',
    school: options.school || 'TRƯỜNG THPT NGUYỄN HUỆ'
  })

  return {
    fullTypstCode,
    pageResults
  }
}

/**
 * Ghép các trang Typst rời rạc thành một file đề thi Typst duy nhất chuẩn sang-math:1.0.5
 * Tự động loại bỏ duplicate #import và #show, chèn watermark: none rõ ràng.
 */
export function mergeTypstExamPages(pageResults, metadata = {}) {
  const title = metadata.title || 'ĐỀ THI TOÁN THPT'
  const school = metadata.school || 'BỘ GIÁO DỤC VÀ ĐÀO TẠO'

  // Header chuẩn sang-math:1.0.5 với watermark: none tường minh
  const header = `// ================================================================
// ĐỀ THI TOÁN THPT QUỐC GIA - CHUẨN SANG-MATH:1.0.5
// Nhận diện tự động qua Conic Typst Convert (Gemini AI Vision OCR)
// ================================================================

#import "@preview/sang-math:1.0.5": *

#show: exam-theme.with(
  paper: "a4",
  cols: 2,
  theme: "ocean",
  show-header: true,
  show-footer: true,
  watermark: none, // Chữ in chìm: đổi thành [TÊN TRƯỜNG] hoặc "ĐỀ THI THỬ", hoặc để none nếu không dùng
  watermark-opacity: 0.05, // Độ mờ chữ in chìm (từ 0.01 đến 0.2)
  school: [${school}],
  title: [${title}],
  subject: [Môn: Toán - Thời gian: 90 phút],
  exam-id: "001"
)

`

  // Gom nội dung các câu hỏi từ từng trang
  const cleanedSections = pageResults.map((p) => {
    let text = p.code || ''
    // Loại bỏ header #import và #show trùng lặp trong từng trang
    text = text.replace(/#import\s+["']@preview\/sang-math:[^"']+["']:\s*\*/g, '')
    text = text.replace(/#show:\s*exam-theme\.with\([\s\S]*?\)/g, '')
    // Dọn bớt khoảng trắng dư thừa
    text = text.trim()
    return `// --- NỘI DUNG TỪ TRANG ${p.pageNum} ---\n${text}`
  })

  return header + cleanedSections.join('\n\n') + '\n'
}
