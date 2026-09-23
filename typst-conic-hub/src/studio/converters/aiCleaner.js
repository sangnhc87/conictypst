/**
 * aiCleaner.js
 * Làm sạch và chuẩn hoá văn bản kết quả từ AI (ChatGPT, NotebookLM, DeepSeek, Claude)
 * về định dạng chuẩn Typst @preview/sang-math:1.0.5
 */

import { convertLatexMathToTypst } from './latexToTypst.js'

export function cleanAiOutputToTypst(rawAiText, options = {}) {
  const {
    title = 'ĐỀ KIỂM TRA TOÁN',
    school = 'TRƯỜNG THPT ................................',
    subject = 'TOÁN 12'
  } = options

  let text = String(rawAiText || '').trim()

  // 1. Loại bỏ các khối code block markdown ```typst ... ``` hoặc ```latex ... ```
  text = text.replace(/^```(?:typst|latex|tex|markdown)?\s*\n?/i, '')
    .replace(/\n?```\s*$/i, '')
    .trim()

  // 2. Chuyển đổi công thức LaTeX dạng \( ... \) hoặc \[ ... \] sang $ ... $
  text = text.replace(/\\\[([\s\S]*?)\\\]/g, (_, m) => `\n$ ${convertLatexMathToTypst(m)} $\n`)
  text = text.replace(/\\\(([\s\S]*?)\\\)/g, (_, m) => `$${convertLatexMathToTypst(m)}$`)

  // 3. Nếu văn bản đã có sẵn khung `#import "@preview/sang-math`, chỉ cần đảm bảo phiên bản 1.0.5
  if (text.includes('sang-math')) {
    text = text.replace(/@preview\/sang-math:[0-9.]+/g, '@preview/sang-math:1.0.5')
    return text
  }

  // 4. Nếu là đoạn Typst thuần chứa các hàm #tn, #ds, #tln, #tl nhưng thiếu header
  const hasQuestionCalls = /#(?:tn|ds|tln|tl)\s*\(/g.test(text)

  const header = [
    '// ĐỀ THI TẠO TỪ AI - CHUẨN SANG-MATH:1.0.5',
    '#import "@preview/sang-math:1.0.5": *',
    '',
    '#let profile = sys.inputs.at("profile", default: "dethi")',
    '#let preset = exam-preset(theme: "teal-pro", profile: profile)',
    '#let (tn, ds, tln, tl) = exam-mode(..preset.question)',
    '',
    '#show: sang-setup.with(math-color: black)',
    '#show: exam-theme.with(',
    '  theme: preset.theme,',
    `  school: "${school.replace(/"/g, '\\"')}",`,
    `  exam-title: "${title.replace(/"/g, '\\"')}",`,
    `  subject: "${subject.replace(/"/g, '\\"')}",`,
    '  duration: "90 phút",',
    '  code: "101",',
    '  watermark: none, // Chữ in chìm: đổi thành [TÊN TRƯỜNG] hoặc "ĐỀ THI THỬ", hoặc để none nếu không dùng',
    '  watermark-opacity: 0.05, // Độ mờ chữ in chìm (0.01 đến 0.2)',
    '  ..preset.template,',
    ')',
    ''
  ].join('\n')

  if (hasQuestionCalls) {
    if (!text.includes('#het')) text += '\n\n#het'
    return `${header}\n${text}`
  }

  // 5. Nếu là văn bản tự do chưa có cấu trúc #tn, #ds:
  // Thử tự động phát hiện các câu
  const lines = text.split('\n')
  const formattedQuestions = []
  let currentStem = []
  let qCount = 1

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim()
    if (!line) continue

    // Kiểm tra đầu câu: Câu 1, Câu 2...
    if (/^(?:Câu|Bài)\s*\d+[:.]/i.test(line)) {
      if (currentStem.length > 0) {
        formattedQuestions.push(`#tl([\n  ${currentStem.join('\n  ')}\n], id: "TL${String(qCount++).padStart(2, '0')}")\n`)
        currentStem = []
      }
      currentStem.push(line.replace(/^(?:Câu|Bài)\s*\d+[:.]\s*/i, ''))
    } else {
      currentStem.push(line)
    }
  }

  if (currentStem.length > 0) {
    formattedQuestions.push(`#tl([\n  ${currentStem.join('\n  ')}\n], id: "TL${String(qCount++).padStart(2, '0')}")\n`)
  }

  if (formattedQuestions.length > 0) {
    return `${header}\n#exam-part([CÁC CÂU HỎI TỰ LUẬN], count: ${formattedQuestions.length})\n\n${formattedQuestions.join('\n')}\n#het`
  }

  // Fallback: bọc toàn bộ vào tài liệu Typst
  return `${header}\n${text}\n\n#het`
}
