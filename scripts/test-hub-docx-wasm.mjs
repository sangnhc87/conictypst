import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import JSZip from 'jszip'
import { convert } from 'pandoc-wasm'
import {
  buildHeaderBlock,
  getMockMacros,
  injectLayouts,
  prepareEditableTypstForDocx,
} from '../typst-conic-hub/src/studio/docxBundle.js'
import { toDirectQuestionBody } from '../typst-conic-hub/src/studio/questionSource.js'

const strippedContent = buildHeaderBlock({ examTitle: 'Đề kiểm tra Word WASM' })
  + 'Công thức chỉnh sửa được: $ x^2 + y^2 = 1 $\n\n'
  + '#image("sample.png", width: 14%)\n'

const template = await readFile('typst-conic-hub/public/runtime/template.docx')
const filter = await readFile('typst-conic-hub/public/runtime/tabs.lua', 'utf8')
const tinyPng = Buffer.from(
  'iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAIAAAD91JpzAAAAFElEQVR42mNk+M/wn4GBgYGJAQoAHgQCAf5g1f8AAAAASUVORK5CYII=',
  'base64',
)

const result = await convert({
  from: 'typst',
  to: 'docx',
  'output-file': 'output.docx',
  'reference-doc': 'template.docx',
  filters: ['tabs.lua'],
}, getMockMacros('hocsinh') + strippedContent, {
  'template.docx': new Blob([template]),
  'tabs.lua': filter,
  'sample.png': new Blob([tinyPng], { type: 'image/png' }),
})

assert.ok(result.files['output.docx'], result.stderr || 'Pandoc WASM không tạo DOCX')
const zip = await JSZip.loadAsync(await result.files['output.docx'].arrayBuffer())
const documentXml = await zip.file('word/document.xml').async('string')
const media = Object.keys(zip.files).filter(path => path.startsWith('word/media/'))
assert.match(documentXml, /<m:oMath/)
assert.ok(media.length >= 1, 'DOCX phải chứa ít nhất một ảnh nhúng')

const fullExamData = await readFile('public/hdsd/downloads/examples/05_data_de_thi_mau.typ', 'utf8')
const editableExamSource = getMockMacros('hocsinh')
  + buildHeaderBlock({ examTitle: 'Đề kiểm tra Sang Math chỉnh sửa được' })
  + injectLayouts(prepareEditableTypstForDocx(toDirectQuestionBody(fullExamData)))
const examResult = await convert({
  from: 'typst',
  to: 'docx',
  'output-file': 'exam.docx',
  'reference-doc': 'template.docx',
  filters: ['tabs.lua'],
}, editableExamSource, {
  'template.docx': new Blob([template]),
  'tabs.lua': filter,
})

assert.ok(examResult.files['exam.docx'], examResult.stderr || 'Không tạo được đề DOCX thật')
import { writeFileSync } from 'fs'; writeFileSync('test_output.docx', Buffer.from(await examResult.files['exam.docx'].arrayBuffer())); const examZip = await JSZip.loadAsync(await examResult.files['exam.docx'].arrayBuffer())
const examXml = await examZip.file('word/document.xml').async('string')
const equationCount = (examXml.match(/<m:oMath/g) || []).length
assert.match(examXml, /Câu 1\./, 'DOCX phải chứa câu hỏi dạng văn bản')
assert.ok(equationCount >= 20, `DOCX đề thi phải có nhiều Equation, hiện chỉ có ${equationCount}`)
assert.doesNotMatch(examXml, /typst-page-1\.png/, 'Không được chụp nguyên trang Typst làm ảnh')

console.log(JSON.stringify({
  docxBytes: result.files['output.docx'].size,
  editableEquation: true,
  embeddedImages: media.length,
  fullExamDocxBytes: examResult.files['exam.docx'].size,
  fullExamEquations: equationCount,
  fullPageScreenshotFallback: false,
  warnings: result.warnings?.length || 0,
}))
