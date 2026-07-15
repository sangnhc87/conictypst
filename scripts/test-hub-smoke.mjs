import puppeteer from 'puppeteer'

const baseUrl = process.env.HUB_URL || 'http://127.0.0.1:8767/'
const browser = await puppeteer.launch({ headless: true })
const page = await browser.newPage()
const errors = []

page.on('pageerror', error => errors.push(`page: ${error.message}`))
page.on('console', message => {
  if (message.type() === 'error') errors.push(`console: ${message.text()}`)
})

await page.setViewport({ width: 1440, height: 980, deviceScaleFactor: 1 })
await page.goto(baseUrl, { waitUntil: 'networkidle2', timeout: 60000 })
await page.waitForSelector('.hero-product')
if (new URL(baseUrl).hostname.endsWith('.pages.dev')) {
  // Lần mở production đầu tiên, Service Worker nhận quyền điều khiển rồi reload
  // đúng một lần. Chờ quá trình đó ổn định để smoke test không bám execution
  // context cũ trong lúc controllerchange.
  await page.waitForFunction(() => Boolean(navigator.serviceWorker?.controller), { timeout: 30000 })
  await page.waitForSelector('.hero-product')
}
await page.screenshot({ path: '/tmp/typst-conic-hub-home.png', fullPage: true })
const serviceWorkerResponse = await fetch(new URL(`/sw.js?smoke=${Date.now()}`, baseUrl))
if (!serviceWorkerResponse.ok) throw new Error(`Không tải được Service Worker: HTTP ${serviceWorkerResponse.status}`)
const serviceWorkerSource = await serviceWorkerResponse.text()

// Mỗi smoke run bắt đầu như một giáo viên mới, tránh dự án cũ trong IndexedDB
// làm sai lệch việc kiểm tra template mặc định.
await page.evaluate(async () => {
  window.localStorage.clear()
  window.sessionStorage.clear()
  await new Promise(resolve => {
    const request = window.indexedDB.deleteDatabase('typst-conic-hub')
    request.onsuccess = request.onerror = request.onblocked = () => resolve()
  })
})

await page.click('.button--hero')
await page.waitForSelector('.hub-studio', { timeout: 30000 })
await page.waitForFunction(
  () => document.querySelector('.runtime-pill')?.textContent?.includes('WASM sẵn sàng'),
  { timeout: 90000 },
)
await page.waitForFunction(
  () => {
    const state = document.querySelector('.compile-state')
    return state?.classList.contains('state-error') || state?.textContent?.trim()?.endsWith('ms')
  },
  { timeout: 180000 },
)
const defaultCompileState = await page.evaluate(() => ({
  state: document.querySelector('.compile-state')?.textContent?.trim(),
  error: document.querySelector('.preview-error')?.textContent?.replace(/\s+/g, ' ').trim(),
  entry: document.querySelector('.entry-card b')?.textContent?.trim(),
}))
if (defaultCompileState.error) {
  await page.screenshot({ path: '/tmp/typst-conic-hub-default-error.png' })
  throw new Error(`Mẫu mặc định lỗi: ${JSON.stringify(defaultCompileState)}`)
}
await page.waitForSelector('.preview-mount canvas', { timeout: 60000 })
const defaultCanvasCount = await page.evaluate(() => document.querySelectorAll('.preview-mount canvas').length)
await page.screenshot({ path: '/tmp/typst-conic-hub-studio.png' })

const sourceNavigation = {}
await page.evaluate(() => [...document.querySelectorAll('.typst-content-text')]
  .find(element => element.textContent?.includes('BỘ GIÁO DỤC VÀ ĐÀO TẠO'))?.click())
await page.waitForFunction(() => document.querySelector('.studio-statusbar')?.textContent?.includes('Ln 62'))
sourceNavigation.entry = await page.evaluate(() => ({
  file: document.querySelector('.breadcrumbs b')?.textContent?.trim(),
  position: [...document.querySelectorAll('.studio-statusbar span')].at(-1)?.textContent?.trim(),
}))
await page.evaluate(() => [...document.querySelectorAll('.typst-content-text')]
  .find(element => element.textContent?.includes('có bảng biến thiên như sau'))?.click())
await page.waitForFunction(() => document.querySelector('.breadcrumbs b')?.textContent?.includes('05_data_de_thi_mau.typ')
  && [...document.querySelectorAll('.studio-statusbar span')].at(-1)?.textContent?.startsWith('Ln 6,'))
sourceNavigation.data = await page.evaluate(() => ({
  file: document.querySelector('.breadcrumbs b')?.textContent?.trim(),
  position: [...document.querySelectorAll('.studio-statusbar span')].at(-1)?.textContent?.trim(),
}))

await page.evaluate(() => document.querySelector('.monaco-editor textarea')?.focus())
await page.keyboard.type('#tn')
await page.click('.snippet-suggest')
await new Promise(resolve => setTimeout(resolve, 700))
const completionResult = await page.evaluate(() => ({
  suggestion: [...document.querySelectorAll('.suggest-widget.visible .monaco-list-row')].slice(0, 8).map(row => row.textContent?.replace(/\s+/g, ' ').trim()).join(' | '),
  editorTail: document.querySelector('.view-lines')?.textContent?.replace(/\s+/g, ' ').trim().slice(-120) || '',
  activeElement: document.activeElement?.className || document.activeElement?.tagName,
}))
await page.keyboard.press('Escape')
await page.keyboard.down('Control')
await page.keyboard.press('z')
await page.keyboard.up('Control')

await page.evaluate(() => {
  const registration = { waiting: { postMessage: () => undefined } }
  window.dispatchEvent(new CustomEvent('conic-update-ready', { detail: { registration } }))
})
await page.waitForSelector('.update-notice')
await page.click('.update-notice__close')

await page.click('.studio-button--templates')
await page.waitForSelector('.project-dialog')
const templatePicker = await page.evaluate(() => ({
  count: document.querySelectorAll('.project-dialog .dialog-template').length,
  names: [...document.querySelectorAll('.project-dialog .dialog-template b')].map(item => item.textContent?.trim()),
}))
await page.click('.project-dialog header .icon-button')

await page.click('.studio-button--accent')
await page.waitForSelector('.catalog-dialog')
await page.type('.catalog-search input', 'đúng sai')
await page.waitForFunction(() => document.querySelectorAll('.catalog-item').length > 0)
const catalogResult = await page.evaluate(() => ({
  count: document.querySelectorAll('.catalog-item').length,
  first: document.querySelector('.catalog-item b')?.textContent?.trim(),
}))
await page.screenshot({ path: '/tmp/typst-conic-hub-catalog.png' })
await page.click('.catalog-dialog header .icon-button')

await page.click('.studio-button--theme')
await page.waitForSelector('.theme-dialog')
const themeCount = await page.evaluate(() => document.querySelectorAll('.theme-grid > button').length)
await page.click('.theme-grid > button:nth-child(2)')
await page.click('.theme-dialog footer .studio-button--primary')
await page.waitForFunction(() => document.querySelector('.studio-button--theme')?.textContent?.includes('emerald'))
await page.waitForFunction(() => document.querySelector('.compile-state')?.classList?.contains('state-compiling'), { timeout: 30000 })
await page.waitForFunction(() => document.querySelector('.compile-state')?.textContent?.trim()?.endsWith('ms'), { timeout: 120000 })

await page.keyboard.down('Control')
await page.keyboard.press('KeyK')
await page.keyboard.up('Control')
await page.waitForSelector('.command-palette')
await page.type('.command-search input', 'xuất pdf')
await page.waitForFunction(() => document.querySelector('.command-results b')?.textContent?.includes('PDF'))
const commandResult = await page.evaluate(() => document.querySelector('.command-results b')?.textContent?.trim())
await page.keyboard.press('Escape')

const fileCount = await page.evaluate(() => document.querySelectorAll('.file-row').length)
await page.click('.activity-rail button:nth-child(2)')
await page.type('.sidebar-search-input input', 'theme')
await page.waitForFunction(() => document.querySelectorAll('.project-search-results > button').length > 0)
const searchCount = await page.evaluate(() => document.querySelectorAll('.project-search-results > button').length)
await page.click('.activity-rail button:nth-child(3)')
await page.waitForSelector('.outline-list')
const outlineResult = await page.evaluate(() => ({
  parts: document.querySelectorAll('.outline-item--part').length,
  questions: document.querySelectorAll('.outline-item--tn, .outline-item--ds, .outline-item--tln, .outline-item--tl').length,
}))

const result = await page.evaluate(() => ({
  title: document.title,
  canvasCount: document.querySelectorAll('.preview-mount canvas').length,
  runtime: document.querySelector('.runtime-pill')?.textContent?.trim(),
  compile: document.querySelector('.compile-state')?.textContent?.trim(),
  project: document.querySelector('.studio-header__project select')?.selectedOptions?.[0]?.textContent,
}))
result.fileCount = fileCount
result.defaultCanvasCount = defaultCanvasCount

await page.setViewport({ width: 390, height: 844, deviceScaleFactor: 1 })
await page.reload({ waitUntil: 'domcontentloaded' })
await page.waitForSelector('.mobile-pane-tabs', { timeout: 30000 })
await page.waitForSelector('.monaco-editor', { timeout: 30000 })
await new Promise(resolve => setTimeout(resolve, 800))
await page.screenshot({ path: '/tmp/typst-conic-hub-mobile.png' })

await page.setViewport({ width: 1440, height: 980, deviceScaleFactor: 1 })
await page.evaluate(() => { window.location.hash = 'studio?template=exam' })
await page.waitForFunction(
  () => document.querySelector('.studio-header__project select')?.selectedOptions?.[0]?.textContent === 'Đề thi Sang Math',
  { timeout: 30000 },
)
await page.waitForFunction(
  () => document.querySelector('.compile-state')?.classList?.contains('state-compiling'),
  { timeout: 30000 },
)
await page.waitForFunction(
  () => document.querySelector('.compile-state')?.textContent?.trim()?.endsWith('ms'),
  { timeout: 120000 },
)
await page.waitForSelector('.preview-mount canvas', { timeout: 120000 })
await new Promise(resolve => setTimeout(resolve, 500))
await page.screenshot({ path: '/tmp/typst-conic-hub-exam.png' })

const examResult = await page.evaluate(() => ({
  project: document.querySelector('.studio-header__project select')?.selectedOptions?.[0]?.textContent,
  compile: document.querySelector('.compile-state')?.textContent?.trim(),
  problems: document.querySelector('.studio-statusbar button')?.textContent?.trim(),
  canvasCount: document.querySelectorAll('.preview-mount canvas').length,
  semanticText: document.querySelector('.preview-mount')?.textContent?.replace(/\s+/g, ' ').trim().slice(0, 160),
}))

await page.evaluate(() => { window.location.hash = 'studio?template=beamer' })
await page.waitForFunction(
  () => document.querySelector('.studio-header__project select')?.selectedOptions?.[0]?.textContent === 'Slide Beamer 16:9',
  { timeout: 30000 },
)
await page.waitForFunction(
  () => document.querySelector('.compile-state')?.classList?.contains('state-compiling'),
  { timeout: 30000 },
)
await page.waitForFunction(
  () => {
    const state = document.querySelector('.compile-state')
    return state?.classList.contains('state-error') || state?.textContent?.trim()?.endsWith('ms')
  },
  { timeout: 180000 },
)
const beamerResult = await page.evaluate(() => ({
  project: document.querySelector('.studio-header__project select')?.selectedOptions?.[0]?.textContent,
  compile: document.querySelector('.compile-state')?.textContent?.trim(),
  problems: document.querySelector('.studio-statusbar button')?.textContent?.trim(),
  canvasCount: document.querySelectorAll('.preview-mount canvas').length,
  error: document.querySelector('.preview-error')?.textContent?.replace(/\s+/g, ' ').trim() || '',
}))

await browser.close()

if (!result.canvasCount) throw new Error('Preview không tạo canvas')
if (result.project !== 'Đề thi đầy đủ 05' || result.fileCount !== 2) {
  throw new Error(`Mẫu mặc định không phải bộ 05 đầy đủ: ${JSON.stringify(result)}`)
}
if (result.defaultCanvasCount !== 6) throw new Error(`Mẫu 05 mặc định phải biên dịch thành 6 trang: ${JSON.stringify(result)}`)
if (defaultCompileState.entry !== '05_full_de_thi_mau.typ') throw new Error(`Entry mặc định chưa dùng đúng file 05_full: ${JSON.stringify(defaultCompileState)}`)
if (sourceNavigation.entry.file !== '05_full_de_thi_mau.typ' || !sourceNavigation.entry.position?.startsWith('Ln 62,') || sourceNavigation.data.file !== '05_data_de_thi_mau.typ' || !sourceNavigation.data.position?.startsWith('Ln 6,')) {
  throw new Error(`Click preview chưa trở về đúng source: ${JSON.stringify(sourceNavigation)}`)
}
if (!serviceWorkerSource.includes('typst-conic-hub-v3-security-bridge') || !serviceWorkerSource.includes('networkFirst(event.request')) {
  throw new Error('Service Worker chưa dùng chiến lược cập nhật v3 security bridge')
}
if (!completionResult?.suggestion?.includes('Câu trắc nghiệm') || !catalogResult.count || !catalogResult.first?.includes('đúng / sai') || !commandResult?.includes('PDF') || !searchCount || themeCount < 10 || outlineResult.parts < 4 || outlineResult.questions < 20 || templatePicker.count !== 7 || !templatePicker.names.includes('Slide Beamer 16:9')) {
  throw new Error(`Công cụ trợ giúp chưa hoạt động đúng: ${JSON.stringify({ completionResult, catalogResult, commandResult, searchCount, themeCount, outlineResult, templatePicker, errors })}`)
}
if (!examResult.canvasCount || !examResult.problems?.includes('Không có lỗi') || !examResult.semanticText?.includes('ĐỀ KIỂM TRA')) {
  throw new Error(`Mẫu sang-math không biên dịch sạch: ${JSON.stringify(examResult)}`)
}
if (beamerResult.error || beamerResult.canvasCount < 20 || !beamerResult.problems?.includes('Không có lỗi')) {
  throw new Error(`Mẫu Beamer không biên dịch sạch: ${JSON.stringify(beamerResult)}`)
}
if (errors.length) throw new Error(`Lỗi trình duyệt:\n${errors.join('\n')}`)
console.log(JSON.stringify({ fullExam: result, helpers: { sourceNavigation, completionResult, catalogResult, commandResult, searchCount, themeCount, outlineResult, templatePicker, serviceWorker: 'v3 security bridge · network-first' }, compactExam: examResult, beamer: beamerResult }, null, 2))
