import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import test from 'node:test'
import {
  QUESTIONS_END,
  QUESTIONS_START,
  contextualSnippetText,
  extractFactoryQuestionBody,
  extractMarkedQuestionBody,
  isLegacyQuestionFactoryContext,
  markQuestionBody,
  reduceForDocxExport,
  toDirectQuestionBody,
} from '../typst-conic-hub/src/studio/questionSource.js'

const legacySource = await readFile(new URL('../public/hdsd/downloads/examples/05_data_de_thi_mau.typ', import.meta.url), 'utf8')
const bracketFactorySource = await readFile(new URL('../typst/dethi/de-mau-tu-do.typ', import.meta.url), 'utf8')

test('chuyển bộ 05 sang lệnh câu hỏi trực tiếp', () => {
  const direct = toDirectQuestionBody(legacySource)
  assert.match(direct, /^#exam-part\(/m)
  assert.match(direct, /^#tn\(/m)
  assert.match(direct, /^#ds\(/m)
  assert.match(direct, /^#tln\(/m)
  assert.match(direct, /^#tl\(/m)
  assert.doesNotMatch(direct, /make-questions/)
  assert.equal((direct.match(/^#tn\(/gm) || []).length, 12)
  assert.equal((direct.match(/^#ds\(/gm) || []).length, 4)
  assert.equal((direct.match(/^#tln\(/gm) || []).length, 6)
  assert.equal((direct.match(/^#tl\(/gm) || []).length, 4)
})

test('đánh dấu và lấy lại nguyên vẹn vùng câu hỏi', () => {
  const body = '#tn([Câu hỏi], ([$A$], True([$B$]), [$C$], [$D$]))'
  const marked = markQuestionBody(body)
  assert.ok(marked.startsWith(QUESTIONS_START))
  assert.ok(marked.endsWith(QUESTIONS_END))
  assert.equal(extractMarkedQuestionBody(marked), body)
})

test('snippet chỉ bỏ dấu # trong dự án make-questions cũ', () => {
  const legacy = '#let make-questions(tn: none) = {\n  tn([Cũ], ())\n}'
  const inside = legacy.indexOf('tn([Cũ]')
  const item = { id: 'tn', snippet: '#tn(\n  [Mới],\n)\n' }
  assert.equal(isLegacyQuestionFactoryContext(legacy, inside), true)
  assert.equal(contextualSnippetText(item, legacy, inside).startsWith('tn('), true)
  assert.equal(contextualSnippetText(item, '= Tài liệu\n', 10).startsWith('#tn('), true)
})

test('trích thân factory ngoặc vuông [ ] của de-mau-tu-do', () => {
  const body = extractFactoryQuestionBody(bracketFactorySource)
  // Không dedent nên lời gọi có thể thụt lề — regex cho phép khoảng trắng đầu dòng.
  assert.match(body, /^\s*#tn\(/m)
  assert.match(body, /^\s*#exam-part\(/m)
  // Không được kéo theo khai báo factory, lời gọi, hay cấu hình #show.
  assert.doesNotMatch(body, /make-questions/)
  assert.doesNotMatch(body, /sys\.inputs/)
  assert.doesNotMatch(body, /#show:/)
  assert.equal((body.match(/^\s*#tn\(/gm) || []).length, 12)
  assert.equal((body.match(/^\s*#ds\(/gm) || []).length, 4)
  assert.equal((body.match(/^\s*#tln\(/gm) || []).length, 6)
  assert.equal((body.match(/^\s*#exam-part\(/gm) || []).length, 3)
})

test('math span ngoặc lệch không làm cắt cụt thân factory', () => {
  // de-mau-tu-do có nhiều khoảng như $(0;3)$, $k in ZZ$; nếu bộ quét không coi
  // $…$ là đóng kín thì thân sẽ bị cắt sớm và mất các câu cuối.
  const body = extractFactoryQuestionBody(bracketFactorySource)
  const tlnCount = (body.match(/^\s*#tln\(/gm) || []).length
  assert.equal(tlnCount, 6, 'phải giữ đủ 6 #tln — câu cuối vẫn còn')
})

test('trích thân factory ngoặc nhọn { } vẫn thêm tiền tố #', () => {
  const body = extractFactoryQuestionBody(legacySource)
  assert.match(body, /^\s*#tn\(/m)
  assert.match(body, /^\s*#exam-part\(/m)
  assert.doesNotMatch(body, /make-questions/)
  assert.equal((body.match(/^\s*#tn\(/gm) || []).length, 12)
})

test('reduceForDocxExport chọn đúng chiến lược theo dạng tài liệu', () => {
  // 1) có marker → lấy đúng vùng đánh dấu
  const marked = markQuestionBody('#tn([Câu], ([$A$], True([$B$]), [$C$], [$D$]))')
  assert.equal(reduceForDocxExport(marked), extractMarkedQuestionBody(marked))
  // 2) factory [ ] → bằng extractFactoryQuestionBody
  assert.equal(reduceForDocxExport(bracketFactorySource), extractFactoryQuestionBody(bracketFactorySource))
  // 3) tài liệu tự do → giữ nguyên
  assert.equal(reduceForDocxExport('= Tài liệu\nNội dung tự do.\n'), '= Tài liệu\nNội dung tự do.\n')
})
