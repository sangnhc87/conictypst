import puppeteer from 'puppeteer'

const baseUrl = process.env.HUB_URL || 'http://127.0.0.1:4174/'
const browser = await puppeteer.launch({ headless: true })
const page = await browser.newPage()
const errors = []

page.on('pageerror', error => errors.push(error.message))
page.on('console', message => {
  if (message.type() === 'error') errors.push(message.text())
})

async function waitForCleanCompile() {
  await page.waitForFunction(
    () => {
      const state = document.querySelector('.compile-state')
      return state?.classList.contains('state-error') || state?.textContent?.trim()?.endsWith('ms')
    },
    { timeout: 180000 },
  )
  await page.waitForSelector('.preview-scale .preview-mount canvas', { timeout: 60000 })
}

try {
  await page.goto(`${baseUrl.replace(/#.*$/, '')}#studio?template=exam-online-demo`, {
    waitUntil: 'domcontentloaded',
    timeout: 60000,
  })
  await page.waitForSelector('.hub-studio', { timeout: 30000 })
  await page.waitForFunction(
    () => document.querySelector('.runtime-pill')?.textContent?.includes('Trình biên dịch sẵn sàng'),
    { timeout: 180000 },
  )
  await waitForCleanCompile()

  await page.evaluate(async () => {
    const db = await new Promise((resolve, reject) => {
      const request = indexedDB.open('typst-conic-hub', 1)
      request.onsuccess = () => resolve(request.result)
      request.onerror = () => reject(request.error)
    })
    const activeId = await new Promise((resolve, reject) => {
      const request = db.transaction('meta').objectStore('meta').get('active-project-id')
      request.onsuccess = () => resolve(request.result)
      request.onerror = () => reject(request.error)
    })
    const project = await new Promise((resolve, reject) => {
      const request = db.transaction('projects').objectStore('projects').get(activeId)
      request.onsuccess = () => resolve(request.result)
      request.onerror = () => reject(request.error)
    })
    const entry = project.entryPath
    project.files[entry].content += `

#pagebreak()
= Kiểm thử phân số trên canvas

Dạng lớn: $dfrac(1, 2)$. Dạng nhỏ: $tfrac(1, 2)$. DFRAC_TFRAC_CANVAS_OK

#context {
  let large = measure(box[$dfrac(1, 2)$])
  let small = measure(box[$tfrac(1, 2)$])
  assert(large.height > small.height, message: "dfrac phải lớn hơn tfrac trên canvas")
}
`
    project.updatedAt = Date.now()
    await new Promise((resolve, reject) => {
      const transaction = db.transaction('projects', 'readwrite')
      transaction.objectStore('projects').put(project)
      transaction.oncomplete = resolve
      transaction.onerror = () => reject(transaction.error)
    })
    db.close()
  })
  await page.reload({ waitUntil: 'domcontentloaded', timeout: 60000 })

  await page.waitForSelector('.hub-studio', { timeout: 30000 })
  await page.waitForFunction(
    () => document.querySelector('.runtime-pill')?.textContent?.includes('Trình biên dịch sẵn sàng'),
    { timeout: 180000 },
  )
  await waitForCleanCompile()
  await page.waitForFunction(
    () => [...document.querySelectorAll('.typst-content-text')]
      .some(node => node.textContent?.includes('DFRAC_TFRAC_CANVAS_OK')),
    { timeout: 60000 },
  )

  const result = await page.evaluate(() => ({
    compile: document.querySelector('.compile-state')?.textContent?.trim() || '',
    problems: document.querySelector('.studio-statusbar button')?.textContent?.trim() || '',
    error: document.querySelector('.preview-error')?.textContent?.replace(/\s+/g, ' ').trim() || '',
    canvasCount: document.querySelectorAll('.preview-mount canvas').length,
    commandMarkerVisible: [...document.querySelectorAll('.typst-content-text')]
      .some(node => node.textContent?.includes('DFRAC_TFRAC_CANVAS_OK')),
  }))
  if (result.error || !result.problems.includes('Không có lỗi') || !result.commandMarkerVisible) {
    throw new Error(`dfrac/tfrac không biên dịch sạch trên canvas: ${JSON.stringify(result)}`)
  }
  if (errors.length) throw new Error(errors.join('\n'))
  console.log(JSON.stringify(result, null, 2))
} finally {
  await browser.close()
}
