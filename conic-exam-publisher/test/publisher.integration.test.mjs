import assert from 'node:assert/strict'
import fs from 'node:fs/promises'
import os from 'node:os'
import path from 'node:path'
import test from 'node:test'
import { gunzipSync } from 'node:zlib'
import { publishExam } from '../src/publisher.mjs'

const renderer = `#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)
#let tn(stem, options, loigiai: none, mode: "dethi", ..args) = [
  #stem
  #for (index, option) in options.enumerate() {
    let body = if type(option) == dictionary { option.body } else { option }
    [#(index + 1). #body ]
  }
  #if mode == "loigiai" and loigiai != none { [Lời giải: #loigiai] }
]
#let ds(stem, statements, loigiai: none, mode: "dethi", ..args) = [
  #stem
  #for statement in statements {
    let body = if type(statement) == dictionary { statement.body } else { statement }
    [#body ]
  }
  #if mode == "loigiai" and loigiai != none { [Lời giải: #loigiai] }
]
#let tln(stem, answer, loigiai: none, mode: "dethi", ..args) = [
  #stem
  #if mode == "loigiai" { [Đáp án: #answer #loigiai] }
]
#let tl(stem, loigiai: none, mode: "dethi", ..args) = [
  #stem
  #if mode == "loigiai" and loigiai != none { [Lời giải: #loigiai] }
]
#let exam-part(title, ..args) = [#title]
`

const legacy = `#import "renderer.typ": True
#let make-questions(tn: none, ds: none, tln: none, tl: none, exam-part: none) = [
  #exam-part([Phần I])
  #tn([Hai cộng hai?], ([$3$], True([$4$])), id: "TN01", loigiai: [$2+2=4$])
  #ds([Xét bốn ý], (True([a]), [b], True([c]), [d]), id: "DS01", loigiai: [Đúng, sai, đúng, sai.])
  #tln([Nhập một phần tư], [$0,25$], id: "TLN01", answer-value: "0,25", loigiai: [$1/4=0,25$])
  #tl([Trình bày lời giải], id: "TL01", points: 2, rubric: ((criterion: "Lập luận", points: 2),), loigiai: [Bài giải mẫu.])
]
`

async function fixture() {
  const root = await fs.mkdtemp(path.join(os.tmpdir(), 'conic-publisher-test-'))
  await fs.writeFile(path.join(root, 'renderer.typ'), renderer, 'utf8')
  await fs.writeFile(path.join(root, 'exam.typ'), legacy, 'utf8')
  return root
}

function options(root, source = 'exam.typ') {
  return {
    sourcePath: path.join(root, source),
    root,
    renderer: 'renderer.typ',
    outputDirectory: path.join(root, 'build'),
    title: 'Đề tích hợp',
    description: 'Publisher test',
    sourceId: 'fixture',
    version: '1',
    mode: 'auto',
    profile: 'custom',
    strict: true,
    renderReview: false,
    typstCommand: 'typst',
    fontPaths: [],
    packagePath: null,
    creationTimestamp: '0',
    timeoutMs: 30000,
  }
}

test('publish legacy module bằng Typst thật và qua backend validator', async () => {
  const root = await fixture()
  try {
    const input = options(root)
    input.renderReview = true
    const result = await publishExam(input)
    assert.equal(result.questionCount, 4)
    assert.equal(result.maximumScore, 3.75)
    assert.equal(result.packageValue.schemaVersion, 'conic-exam-package/v1')
    assert.equal(Object.keys(result.packageValue.assets).length, 4)
    assert.equal(result.packageValue.publicItems[0].sourceId, undefined)
    assert.equal(result.packageValue.answerKey[0].sourceId, 'TN01')
    assert.equal(result.packageValue.answerKey[0].answer, 'o2')
    assert.deepEqual(result.packageValue.answerKey[1].answer, [true, false, true, false])
    const backendPublic = JSON.parse(await fs.readFile(result.backendPublicFile, 'utf8'))
    assert.ok(Buffer.byteLength(JSON.stringify(backendPublic)) < 900 * 1024)
    const compressedSvg = backendPublic.publicItems[0].questionSvg
    assert.deepEqual(Object.keys(compressedSvg).sort(), ['bytes', 'data', 'encoding', 'sha256'])
    assert.equal(compressedSvg.encoding, 'gzip-base64')
    assert.match(gunzipSync(Buffer.from(compressedSvg.data, 'base64')).toString('utf8'), /^<svg/u)
    const publicProjection = JSON.parse(await fs.readFile(result.publicFile, 'utf8'))
    assert.deepEqual(publicProjection.assets, {})
  } finally {
    await fs.rm(root, { recursive: true, force: true })
  }
})

test('publish nguồn Hub qua marker adapter', async () => {
  const root = await fixture()
  try {
    const direct = `#import "renderer.typ": *
// === CONICTYPST:QUESTIONS:START ===
#tn([Câu Hub], (True([$1$]), [$2$]), id: "HUB-TN-01")
// === CONICTYPST:QUESTIONS:END ===
`
    await fs.writeFile(path.join(root, 'hub.typ'), direct, 'utf8')
    const input = options(root, 'hub.typ')
    input.outputDirectory = path.join(root, 'hub-build')
    const result = await publishExam(input)
    assert.equal(result.questionCount, 1)
    assert.equal(result.packageValue.answerKey[0].sourceId, 'HUB-TN-01')
    assert.equal(Object.keys(result.packageValue.assets).length, 0)
    assert.equal(result.packageValue.publicItems[0].questionSvg.encoding, 'gzip-base64')
  } finally {
    await fs.rm(root, { recursive: true, force: true })
  }
})
