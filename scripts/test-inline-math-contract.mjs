import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import test from 'node:test'
import { SANG_MATH_PACKAGE } from '../typst-conic-hub/src/studio/packagePolicy.js'

const packageCopies = [
  new URL('../typst-pkg-sang-math/sang-exam.typ', import.meta.url),
  new URL('../typst-pkg-submit/sang-exam.typ', import.meta.url),
]

test('hai package copy giữ phân số lớn mà không đổi toàn bộ inline math', async () => {
  for (const sourceUrl of packageCopies) {
    const source = await readFile(sourceUrl, 'utf8')
    assert.match(source, /#let sang-setup\(body, math-color: black\) = \{/)
    assert.match(source, /show math\.frac: math\.display\s*show math\.equation: set text\(fill: math-color\)/)
    assert.match(source, /#let tfrac\(a, b\) = \{\s*show math\.frac: f => f/)
    assert.doesNotMatch(source, /show math\.equation: math\.display/)
  }
})

test('exam-online-demo giữ show rule phân số lớn giống Typst.app', async () => {
  const source = await readFile(new URL('../typst/dethi/de-mau-tu-do.typ', import.meta.url), 'utf8')

  assert.match(source, new RegExp(`^#import "${SANG_MATH_PACKAGE.replaceAll('.', '\\.')}"`, 'm'))
  assert.match(source, /#show\s+math\.frac\s*:\s*math\.display/)
})

test('Studio chỉ bật canvas compat cho vector preview, không đổi PDF', async () => {
  const worker = await readFile(new URL('../typst-conic-hub/src/studio/compiler.worker.js', import.meta.url), 'utf8')

  assert.match(worker, /message\.format !== 'pdf'/)
  assert.match(worker, /'sang-math-canvas-compat': '1'/)
})
