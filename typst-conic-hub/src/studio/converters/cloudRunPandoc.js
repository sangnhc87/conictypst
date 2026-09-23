/**
 * cloudRunPandoc.js
 * Client giao tiếp với Google Cloud Run Pandoc Microservice
 * Xuất tài liệu Word (.docx) chất lượng cao với công thức Equation OMML thật và nhúng ảnh
 */

export const STORAGE_KEY_CLOUDRUN_URL = 'conictypst_cloudrun_pandoc_url'
export const DEFAULT_CLOUDRUN_URL = typeof window !== 'undefined' && window.location.hostname === 'localhost'
  ? 'http://localhost:8080'
  : 'https://pandoc-docx-service-75825700870.asia-southeast1.run.app'

export function getSavedCloudRunUrl() {
  return localStorage.getItem(STORAGE_KEY_CLOUDRUN_URL) || (typeof window !== 'undefined' && window.location.hostname === 'localhost' ? 'http://localhost:8080' : '')
}

export function saveCloudRunUrl(url) {
  if (!url) {
    localStorage.removeItem(STORAGE_KEY_CLOUDRUN_URL)
  } else {
    localStorage.setItem(STORAGE_KEY_CLOUDRUN_URL, url.trim().replace(/\/+$/, ''))
  }
}

/**
 * Kiểm tra kết nối tới Cloud Run Service
 */
export async function checkCloudRunHealth(customUrl) {
  const baseUrl = (customUrl || getSavedCloudRunUrl() || DEFAULT_CLOUDRUN_URL).replace(/\/+$/, '')
  try {
    const controller = new AbortController()
    const timeoutId = setTimeout(() => controller.abort(), 8000)

    const res = await fetch(`${baseUrl}/health`, {
      method: 'GET',
      signal: controller.signal
    })
    clearTimeout(timeoutId)

    if (!res.ok) {
      throw new Error(`HTTP ${res.status}: ${res.statusText}`)
    }

    const data = await res.json()
    return {
      ok: true,
      pandocVersion: data.pandocVersion || 'Pandoc Native',
      url: baseUrl
    }
  } catch (err) {
    return {
      ok: false,
      error: err.name === 'AbortError' ? 'Quá thời gian kết nối (Timeout 8s)' : err.message,
      url: baseUrl
    }
  }
}

/**
 * Chuyển đổi file Blob sang Base64
 */
async function blobToBase64(blob) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader()
    reader.onloadend = () => resolve(reader.result)
    reader.onerror = reject
    reader.readAsDataURL(blob)
  })
}

/**
 * Gửi yêu cầu chuyển đổi Typst -> Word (.docx) sang Cloud Run
 */
export async function convertTypstToDocxCloudRun(typstCode, images = {}, options = {}) {
  const baseUrl = (options.cloudRunUrl || getSavedCloudRunUrl() || DEFAULT_CLOUDRUN_URL).replace(/\/+$/, '')

  if (!baseUrl) {
    throw new Error('Chưa thiết lập URL Google Cloud Run Pandoc service.')
  }

  // Chuyển toàn bộ ảnh sang base64
  const imagesBase64 = {}
  for (const [name, blobOrBase64] of Object.entries(images)) {
    if (blobOrBase64 instanceof Blob) {
      imagesBase64[name] = await blobToBase64(blobOrBase64)
    } else if (typeof blobOrBase64 === 'string') {
      imagesBase64[name] = blobOrBase64
    }
  }

  const payload = {
    typstCode,
    images: imagesBase64,
    format: 'docx',
    options: {
      mode: options.mode || 'dethi'
    }
  }

  const res = await fetch(`${baseUrl}/convert`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(payload)
  })

  if (!res.ok) {
    const errData = await res.json().catch(() => ({}))
    throw new Error(errData.details || errData.error || `Lỗi Cloud Run (HTTP ${res.status})`)
  }

  const docxBlob = await res.blob()
  return docxBlob
}
