import { readFile } from 'node:fs/promises'
import { createRequire } from 'node:module'
import puppeteer from 'puppeteer'

const require = createRequire(import.meta.url)
const { normalizePackage } = require('../../conictypst-platform/functions/lib/examValidation.js')

const url = process.env.EXAM_URL || 'http://127.0.0.1:4180/'
const sourcePath = process.env.SOURCE_PATH || '../../typst/dethi/de-mau-tu-do.typ'
const sourceName = sourcePath.split('/').pop() || 'main.typ'
const allowWarnings = process.env.ALLOW_WARNINGS === '1'
const expectedQuestions = Number(process.env.EXPECT_QUESTIONS || 22)
const expectedScore = Number(process.env.EXPECT_SCORE || 10)
const expectedTypes = process.env.EXPECT_TYPES && process.env.EXPECT_TYPES !== 'any'
  ? Object.fromEntries(process.env.EXPECT_TYPES.split(',').map(part => part.split('=').map((value, index) => index ? Number(value) : value)))
  : process.env.EXPECT_TYPES === 'any' ? null : { tn: 12, ds: 4, tln: 6 }
const source = await readFile(new URL(sourcePath, import.meta.url), 'utf8')
const browser = await puppeteer.launch({ headless: true })
const page = await browser.newPage()
const browserErrors = []
page.on('pageerror', error => browserErrors.push(error.message))
page.on('console', message => {
  if (message.type() === 'error') browserErrors.push(message.text())
})

try {
  await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 60000 })
  await page.waitForFunction(() => typeof window.__CONIC_PUBLISH_TYPST__ === 'function', { timeout: 30000 })
  const result = await page.evaluate(async ({ typstSource, sourceName }) => {
    const progress = []
    const output = await window.__CONIC_PUBLISH_TYPST__({
      name: 'Đề dự đoán cuối cùng',
      entryPath: `/project/${sourceName}`,
      files: { [`/project/${sourceName}`]: { kind: 'text', content: typstSource } },
    }, {
      title: 'Đề dự đoán cuối cùng',
      onProgress: value => progress.push({ phase: value.phase, completed: value.completed, total: value.total }),
    })
    const packageValue = output.value
    return {
      questionCount: packageValue.publicItems.length,
      answerCount: packageValue.answerKey.length,
      types: packageValue.publicItems.reduce((counts, item) => ({ ...counts, [item.type]: (counts[item.type] || 0) + 1 }), {}),
      maximumScore: packageValue.answerKey.reduce((sum, item) => sum + item.points, 0),
      warnings: output.warnings,
      textFirst: packageValue.publicItems.every(item => item.questionText?.startsWith('conic-typst-katex/v1\n')),
      structuredChoices: packageValue.publicItems.every(item => [...(item.options || []), ...(item.statements || [])]
        .every(choice => choice.content?.startsWith('conic-typst-katex/v1\n'))),
      fullQuestionSvgCount: packageValue.publicItems.filter(item => item.questionSvg || item.stemSvg).length,
      fragmentAssetCount: (JSON.stringify(packageValue.publicItems).match(/gzip-base64/gu) || []).length,
      hasTypstMathSource: packageValue.publicItems.some(item => item.questionText?.includes('$')),
      progressTail: progress.slice(-4),
      jsonBytes: new TextEncoder().encode(JSON.stringify(packageValue)).length,
      packageValue,
    }
  }, { typstSource: source, sourceName })
  if (result.questionCount !== expectedQuestions || result.answerCount !== expectedQuestions || result.maximumScore !== expectedScore) {
    throw new Error(`Gói browser không đúng cấu trúc: ${JSON.stringify(result)}`)
  }
  if (expectedTypes && Object.entries(expectedTypes).some(([type, count]) => result.types[type] !== count)) {
    throw new Error(`Sai cơ cấu mong đợi: ${JSON.stringify(result.types)}`)
  }
  if ((!allowWarnings && result.warnings.length) || !result.textFirst || !result.structuredChoices
    || result.fullQuestionSvgCount !== 0 || !result.hasTypstMathSource) {
    throw new Error(`Gói text-first chưa sẵn sàng: ${JSON.stringify(result)}`)
  }
  const backend = normalizePackage(result.packageValue)
  if (backend.questionCount !== expectedQuestions || backend.maximumScore !== expectedScore) throw new Error('Backend từ chối cấu trúc gói browser.')
  if (process.env.PREVIEW_SCREENSHOT) {
    await page.evaluate(packageValue => sessionStorage.setItem('__conicPublisherPreview', JSON.stringify(packageValue)), result.packageValue)
    const previewUrl = new URL('/__publisher-preview', url)
    previewUrl.searchParams.set('limit', process.env.PREVIEW_LIMIT || '6')
    if (process.env.PREVIEW_EDITOR === '1') previewUrl.searchParams.set('editor', '1')
    await page.goto(previewUrl.href, { waitUntil: 'networkidle0', timeout: 60000 })
    await page.setViewport({ width: 1280, height: 1100, deviceScaleFactor: 1 })
    await page.screenshot({ path: process.env.PREVIEW_SCREENSHOT, fullPage: true })
    const mathErrors = await page.$$eval('.math-error', nodes => nodes.map(node => `${node.textContent}: ${node.title}`))
    if (mathErrors.length) throw new Error(`KaTeX chưa hiểu: ${mathErrors.join(' | ')}`)
  }
  if (browserErrors.length) throw new Error(browserErrors.join('\n'))
  const { packageValue, ...summary } = result
  console.log(JSON.stringify({ ...summary, backendValidated: true }, null, 2))
} finally {
  await browser.close()
}
