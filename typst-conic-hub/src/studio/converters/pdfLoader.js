/**
 * pdfLoader.js
 * Tiện ích tải và xử lý tài liệu PDF trên trình duyệt cho Conic Typst Convert
 * Hỗ trợ render từng trang ra Canvas/JPEG sắc nét, tạo thumbnail và chia tách trang thông minh.
 */

let pdfjsLibPromise = null

/**
 * Đảm bảo thư viện PDF.js đã sẵn sàng
 * Ưu tiên tải từ /vendor/pdf.min.js nội bộ, dự phòng CDN nếu cần.
 */
export async function ensurePdfJs() {
  if (typeof window === 'undefined') return null
  if (window.pdfjsLib) return window.pdfjsLib

  if (pdfjsLibPromise) return pdfjsLibPromise

  pdfjsLibPromise = new Promise((resolve, reject) => {
    const script = document.createElement('script')
    script.src = '/vendor/pdf.min.js'
    script.async = true

    script.onload = () => {
      if (window.pdfjsLib) {
        window.pdfjsLib.GlobalWorkerOptions.workerSrc = '/vendor/pdf.worker.min.js'
        resolve(window.pdfjsLib)
      } else {
        fallbackToCdn(resolve, reject)
      }
    }

    script.onerror = () => {
      fallbackToCdn(resolve, reject)
    }

    document.head.appendChild(script)
  })

  return pdfjsLibPromise
}

function fallbackToCdn(resolve, reject) {
  const cdnScript = document.createElement('script')
  cdnScript.src = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js'
  cdnScript.async = true
  cdnScript.onload = () => {
    if (window.pdfjsLib) {
      window.pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js'
      resolve(window.pdfjsLib)
    } else {
      reject(new Error('Không thể khởi tạo thư viện PDF.js.'))
    }
  }
  cdnScript.onerror = () => reject(new Error('Không thể tải thư viện PDF.js từ máy chủ hoặc CDN.'))
  document.head.appendChild(cdnScript)
}

/**
 * Tải file PDF từ File hoặc ArrayBuffer
 * @param {File|Blob|ArrayBuffer} fileOrBuffer
 * @returns {Promise<{ pdfDoc: any, numPages: number, fileName: string }>}
 */
export async function loadPdfDocument(fileOrBuffer) {
  const pdfjs = await ensurePdfJs()
  if (!pdfjs) throw new Error('PDF.js không khả dụng trong môi trường hiện tại.')

  let arrayBuffer
  let fileName = 'tai-lieu.pdf'

  if (fileOrBuffer instanceof ArrayBuffer) {
    arrayBuffer = fileOrBuffer
  } else if (fileOrBuffer instanceof Blob || (typeof File !== 'undefined' && fileOrBuffer instanceof File)) {
    if (fileOrBuffer.name) fileName = fileOrBuffer.name
    arrayBuffer = await fileOrBuffer.arrayBuffer()
  } else {
    throw new Error('Đầu vào không hợp lệ để đọc PDF.')
  }

  const loadingTask = pdfjs.getDocument({ data: arrayBuffer })
  const pdfDoc = await loadingTask.promise

  return {
    pdfDoc,
    numPages: pdfDoc.numPages,
    fileName
  }
}

/**
 * Render một trang PDF sang Canvas
 * @param {any} pdfDoc 
 * @param {number} pageNum (1-indexed)
 * @param {number} scale (mặc định 1.6 cho độ nét cao phù hợp Toán học)
 * @returns {Promise<{ canvas: HTMLCanvasElement, width: number, height: number }>}
 */
export async function renderPdfPageToCanvas(pdfDoc, pageNum, scale = 1.6) {
  const page = await pdfDoc.getPage(pageNum)
  const viewport = page.getViewport({ scale })

  const canvas = document.createElement('canvas')
  canvas.width = Math.floor(viewport.width)
  canvas.height = Math.floor(viewport.height)

  const ctx = canvas.getContext('2d', { alpha: false })
  ctx.fillStyle = '#ffffff'
  ctx.fillRect(0, 0, canvas.width, canvas.height)

  await page.render({
    canvasContext: ctx,
    viewport
  }).promise

  return {
    canvas,
    width: canvas.width,
    height: canvas.height
  }
}

/**
 * Render trang PDF và trả về dạng ảnh Base64 (JPEG)
 * @param {any} pdfDoc 
 * @param {number} pageNum 
 * @param {number} scale 
 * @param {number} quality (0.0 - 1.0, mặc định 0.9)
 * @returns {Promise<{ dataUrl: string, base64: string, mimeType: string, width: number, height: number }>}
 */
export async function renderPdfPageToImage(pdfDoc, pageNum, scale = 1.6, quality = 0.9) {
  const { canvas, width, height } = await renderPdfPageToCanvas(pdfDoc, pageNum, scale)
  const mimeType = 'image/jpeg'
  const dataUrl = canvas.toDataURL(mimeType, quality)
  const base64 = dataUrl.replace(/^data:image\/jpeg;base64,/, '')

  return {
    dataUrl,
    base64,
    mimeType,
    width,
    height
  }
}

/**
 * Tạo danh sách thumbnails cho các trang PDF (tối đa maxPages trang để tối ưu bộ nhớ)
 * @param {any} pdfDoc 
 * @param {number} maxPages 
 * @param {(current: number, total: number) => void} onProgress 
 * @returns {Promise<Array<{ pageNum: number, thumbUrl: string }>>}
 */
export async function extractPdfThumbnails(pdfDoc, maxPages = 20, onProgress = null) {
  const total = Math.min(pdfDoc.numPages, maxPages)
  const thumbnails = []

  for (let i = 1; i <= total; i++) {
    const { canvas } = await renderPdfPageToCanvas(pdfDoc, i, 0.35)
    thumbnails.push({
      pageNum: i,
      thumbUrl: canvas.toDataURL('image/jpeg', 0.7)
    })
    if (onProgress) onProgress(i, total)
  }

  return thumbnails
}
