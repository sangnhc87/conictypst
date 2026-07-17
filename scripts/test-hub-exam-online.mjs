import puppeteer from 'puppeteer'
import { writeFile } from 'node:fs/promises'

const baseUrl = process.env.HUB_URL || 'http://127.0.0.1:8768/'
const layoutPngPath = process.env.HUB_LAYOUT_PNG || '/private/tmp/de-mau-web-page-1.png'
const layoutPage2PngPath = process.env.HUB_LAYOUT_PAGE2_PNG || '/private/tmp/de-mau-web-page-2.png'
const screenshotPath = process.env.HUB_SCREENSHOT_PATH || '/private/tmp/exam-online-after.png'
const browser = await puppeteer.launch({ headless: true })
const page = await browser.newPage()
const browserErrors = []
const blockedSangMathRequests = []

page.on('pageerror', error => browserErrors.push(`page: ${error.message}`))
page.on('console', message => {
  if (message.type() === 'error') browserErrors.push(`console: ${message.text()}`)
})
await page.setRequestInterception(true)
page.on('request', request => {
  if (/packages\.typst\.org\/preview\/sang-math-1\.0\.1\.tar\.gz/.test(request.url())) {
    blockedSangMathRequests.push(request.url())
    request.abort()
    return
  }
  request.continue()
})

try {
  await page.setViewport({ width: 1440, height: 980, deviceScaleFactor: 1 })
  await page.goto(baseUrl, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await page.waitForSelector('.hero-product')

  // Giả lập đúng edge sau deploy: tab đã có marker URL cũ và IndexedDB còn
  // project exam-online-demo v1. URL explicit phải tạo project v3 mới, không
  // ghi đè project cũ.
  await page.evaluate(async () => {
    window.localStorage.clear()
    window.sessionStorage.clear()
    await new Promise(resolve => {
      const deletion = window.indexedDB.deleteDatabase('typst-conic-hub')
      deletion.onsuccess = deletion.onerror = deletion.onblocked = () => resolve()
    })
    const db = await new Promise((resolve, reject) => {
      const request = window.indexedDB.open('typst-conic-hub', 1)
      request.onupgradeneeded = () => {
        const next = request.result
        if (!next.objectStoreNames.contains('projects')) {
          const store = next.createObjectStore('projects', { keyPath: 'id' })
          store.createIndex('updatedAt', 'updatedAt')
        }
        if (!next.objectStoreNames.contains('meta')) next.createObjectStore('meta')
      }
      request.onsuccess = () => resolve(request.result)
      request.onerror = () => reject(request.error)
    })
    await new Promise((resolve, reject) => {
      const transaction = db.transaction(['projects', 'meta'], 'readwrite')
      transaction.objectStore('projects').put({
        id: 'project-exam-online-v1',
        name: 'Đề mẫu Online v1 đã lưu',
        entryPath: '/project/de-mau-tu-do.typ',
        files: {
          '/project/de-mau-tu-do.typ': {
            kind: 'text',
            content: '#import "@preview/sang-math:1.0.0": *\n#show math.frac: math.display',
          },
        },
        createdAt: 1,
        updatedAt: 1,
        snapshots: [],
        templateId: 'exam-online-demo',
        templateVersion: 1,
      })
      transaction.objectStore('meta').put('project-exam-online-v1', 'active-project-id')
      transaction.oncomplete = resolve
      transaction.onerror = () => reject(transaction.error)
    })
    db.close()
    window.sessionStorage.setItem('template-consumed:#studio?template=exam-online-demo', '1')
    window.location.hash = 'studio?template=exam-online-demo'
  })

  await page.waitForSelector('.hub-studio', { timeout: 30000 })
  await page.waitForFunction(
    () => document.querySelector('.studio-header__project select')?.selectedOptions?.[0]?.textContent === 'Đề mẫu Online 12–4–6',
    { timeout: 30000 },
  )
  await page.waitForFunction(
    () => document.querySelector('.runtime-pill')?.textContent?.includes('Trình biên dịch sẵn sàng'),
    { timeout: 180000 },
  )
  await page.waitForFunction(
    () => {
      const state = document.querySelector('.compile-state')
      return state?.classList.contains('state-error') || state?.textContent?.trim()?.endsWith('ms')
    },
    { timeout: 180000 },
  )
  await page.waitForSelector('.preview-scale .preview-mount canvas', { timeout: 60000 })
  await page.waitForFunction(
    () => document.querySelectorAll('.preview-scale .preview-mount .typst-content-text').length > 100,
    { timeout: 60000 },
  )
  const firstCanvas = await page.$eval('.preview-scale .preview-mount canvas', canvas => ({
    dataUrl: canvas.toDataURL('image/png'),
    width: canvas.width,
    height: canvas.height,
    cssWidth: canvas.getBoundingClientRect().width,
    cssHeight: canvas.getBoundingClientRect().height,
  }))
  await writeFile(layoutPngPath, Buffer.from(firstCanvas.dataUrl.split(',')[1], 'base64'))
  const secondCanvas = await page.$$eval('.preview-scale .preview-mount canvas', canvases => {
    const canvas = canvases[1]
    return {
      dataUrl: canvas.toDataURL('image/png'),
      width: canvas.width,
      height: canvas.height,
      cssWidth: canvas.getBoundingClientRect().width,
      cssHeight: canvas.getBoundingClientRect().height,
    }
  })
  await writeFile(layoutPage2PngPath, Buffer.from(secondCanvas.dataUrl.split(',')[1], 'base64'))
  const inlineLayout = await page.$eval('.preview-scale .preview-mount .typst-page', firstPage => {
    const items = [...firstPage.querySelectorAll('.typst-content-text')]
      .map(element => {
        const rect = element.getBoundingClientRect()
        return {
          text: String(element.textContent || '').replace(/\s+/g, ' ').trim(),
          y: rect.y,
        }
      })
      .filter(item => item.text)
    const plainBeforeIndex = items.findIndex(item => item.text === 'Giá trị của biểu thức')
    const plainAfterOffset = items.slice(plainBeforeIndex + 1).findIndex(item => item.text === 'là')
    const plainAfterIndex = plainAfterOffset < 0 ? -1 : plainBeforeIndex + 1 + plainAfterOffset
    const fractionAfterIndex = items.findIndex(item => item.text === '. Hỏi điểm nào dưới đây')
    const fractionTokenIndex = fractionAfterIndex - 1
    return {
      plainFormulaNodes: plainAfterIndex - plainBeforeIndex - 1,
      plainBaselineDelta: plainBeforeIndex >= 0 && plainAfterIndex >= 0
        ? Math.abs(items[plainBeforeIndex].y - items[plainAfterIndex].y)
        : null,
      fractionBaselineDelta: fractionTokenIndex >= 0 && fractionAfterIndex >= 0
        ? Math.abs(items[fractionTokenIndex].y - items[fractionAfterIndex].y)
        : null,
      fractionLastToken: items[fractionTokenIndex]?.text || '',
    }
  })

  const result = await page.evaluate(async () => {
    const db = await new Promise((resolve, reject) => {
      const request = window.indexedDB.open('typst-conic-hub', 1)
      request.onsuccess = () => resolve(request.result)
      request.onerror = () => reject(request.error)
    })
    const projects = await new Promise((resolve, reject) => {
      const request = db.transaction('projects', 'readonly').objectStore('projects').getAll()
      request.onsuccess = () => resolve(request.result)
      request.onerror = () => reject(request.error)
    })
    const activeId = await new Promise((resolve, reject) => {
      const request = db.transaction('meta', 'readonly').objectStore('meta').get('active-project-id')
      request.onsuccess = () => resolve(request.result)
      request.onerror = () => reject(request.error)
    })
    db.close()
    const active = projects.find(project => project.id === activeId)
    return {
      activeId,
      projectIds: projects.map(project => project.id),
      templateId: active?.templateId,
      templateVersion: active?.templateVersion,
      entryPath: active?.entryPath,
      source: active?.files?.[active.entryPath]?.content || '',
      sessionKeys: Object.keys(window.sessionStorage),
      canvasCount: document.querySelectorAll('.preview-mount canvas').length,
      compile: document.querySelector('.compile-state')?.textContent?.trim(),
      problems: document.querySelector('.studio-statusbar button')?.textContent?.trim(),
      error: document.querySelector('.preview-error')?.textContent?.replace(/\s+/g, ' ').trim() || '',
    }
  })

  await page.screenshot({ path: screenshotPath, fullPage: false })

  if (result.error || !result.canvasCount || !result.problems?.includes('Không có lỗi')) {
    throw new Error(`exam-online-demo không biên dịch sạch: ${JSON.stringify(result)}`)
  }
  if (result.templateId !== 'exam-online-demo' || result.templateVersion !== 3 || result.entryPath !== '/project/de-mau-tu-do.typ') {
    throw new Error(`URL explicit chưa bootstrap đúng template v3: ${JSON.stringify(result)}`)
  }
  if (!result.source.includes('#import "@preview/sang-math:1.0.1": *') || !result.source.includes('#show math.frac: math.display')) {
    throw new Error(`Nguồn template v2 chưa giữ display fraction giống Typst.app: ${JSON.stringify(result)}`)
  }
  if (!result.projectIds.includes('project-exam-online-v1') || result.activeId === 'project-exam-online-v1') {
    throw new Error(`Project v1 không được giữ nguyên khi tạo v2: ${JSON.stringify(result)}`)
  }
  if (!result.sessionKeys.includes('template-consumed:exam-online-demo:v3:#studio?template=exam-online-demo')) {
    throw new Error(`Session marker chưa gắn template version: ${JSON.stringify(result)}`)
  }
  if (
    inlineLayout.plainFormulaNodes < 5
    || inlineLayout.plainBaselineDelta === null
    || inlineLayout.plainBaselineDelta > 1
    || inlineLayout.fractionBaselineDelta === null
    || inlineLayout.fractionBaselineDelta > 1
  ) {
    throw new Error(`Inline math bị tách khỏi dòng văn bản trong semantic layout: ${JSON.stringify(inlineLayout)}`)
  }
  if (blockedSangMathRequests.length) {
    throw new Error(`Compiler vẫn tải archive sang-math thay vì bundle nội bộ: ${blockedSangMathRequests.join(', ')}`)
  }
  if (browserErrors.length) throw new Error(`Lỗi trình duyệt:\n${browserErrors.join('\n')}`)

  const { source, ...summary } = result
  console.log(JSON.stringify({
    ...summary,
    sourceLength: source.length,
    sourceUsesSangMath101: source.includes('#import "@preview/sang-math:1.0.1": *'),
    sourceForcesDisplayFractions: source.includes('#show math.frac: math.display'),
    firstCanvas: {
      width: firstCanvas.width,
      height: firstCanvas.height,
      cssWidth: firstCanvas.cssWidth,
      cssHeight: firstCanvas.cssHeight,
      pngPath: layoutPngPath,
    },
    secondCanvas: {
      width: secondCanvas.width,
      height: secondCanvas.height,
      cssWidth: secondCanvas.cssWidth,
      cssHeight: secondCanvas.cssHeight,
      pngPath: layoutPage2PngPath,
    },
    screenshotPath,
    inlineLayout,
    sangMathArchiveRequests: blockedSangMathRequests,
  }, null, 2))
} finally {
  await browser.close()
}
