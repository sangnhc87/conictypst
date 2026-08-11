import assert from 'node:assert/strict'
import test from 'node:test'
import {
  SANG_MATH_IMPORT,
  SANG_MATH_PACKAGE,
  SANG_MATH_VERSION,
  inspectSangMathProject,
  migrateProjectToUniverse,
} from '../typst-conic-hub/src/studio/packagePolicy.js'

function projectWith(source) {
  return {
    id: 'test',
    files: { '/project/main.typ': { kind: 'text', content: source } },
  }
}

test('mẫu public dùng import chính thức', () => {
  const health = inspectSangMathProject(projectWith(`${SANG_MATH_IMPORT}\n#tn([Câu hỏi], ())`).files)
  assert.equal(health.mode, 'official')
  assert.equal(health.officialImports, 1)
  assert.equal(health.currentImports, 1)
  assert.equal(health.outdatedImports, 0)
  assert.equal(health.legacyImports, 0)
})

test('dự án Universe 1.0.0 và 1.0.1 vẫn là official nhưng được đánh dấu cần nâng cấp', () => {
  const health = inspectSangMathProject(projectWith('#import "@preview/sang-math:1.0.0": *\n#import "@preview/sang-math:1.0.1": *').files)

  assert.equal(health.mode, 'official')
  assert.equal(health.officialImports, 2)
  assert.equal(health.currentImports, 0)
  assert.equal(health.outdatedImports, 2)
  assert.deepEqual(health.officialVersions, ['1.0.0', '1.0.1'])
})

test('chỉ nâng cấp dòng import cũ, không sửa comment, chuỗi hay phiên bản tương lai', () => {
  const source = `#import "@preview/sang-math:1.0.0": *
// Nhắc trong tài liệu: @preview/sang-math:1.0.0
#let package-note = "@preview/sang-math:1.0.0"
#import "@preview/sang-math:2.0.0": geometry`
  const migrated = migrateProjectToUniverse(projectWith(source))
  const content = migrated.project.files['/project/main.typ'].content

  assert.equal(migrated.changedFiles, 1)
  assert.match(content, new RegExp(`#import "${SANG_MATH_PACKAGE.replaceAll('.', '\\.')}"`))
  assert.match(content, /\/\/ Nhắc trong tài liệu: @preview\/sang-math:1\.0\.0/)
  assert.match(content, /#let package-note = "@preview\/sang-math:1\.0\.0"/)
  assert.match(content, /#import "@preview\/sang-math:2\.0\.0": geometry/)
  assert.equal(SANG_MATH_VERSION, '1.0.2')
})

test('nâng cấp nhiều module cũ thành một import Universe', () => {
  const legacy = projectWith(`#import "/packages/sang-math/sang-exam.typ": *
#import "/packages/sang-math/exam-templates.typ": *

#let preset = exam-preset()`)
  const migrated = migrateProjectToUniverse(legacy)
  const content = migrated.project.files['/project/main.typ'].content

  assert.equal(migrated.changedFiles, 1)
  assert.equal(content.split(SANG_MATH_IMPORT).length - 1, 1)
  assert.doesNotMatch(content, /\/packages\/sang-math/)
  assert.match(content, /#let preset = exam-preset/)
})

test('Beamer cũ chuyển sang namespace extension riêng', () => {
  const legacy = projectWith(`#import "/packages/sang-math/sang-beamer.typ": *
#import "/packages/sang-math/sang-beamer-themes.typ": get-beamer-theme`)
  const migrated = migrateProjectToUniverse(legacy)
  const content = migrated.project.files['/project/main.typ'].content

  assert.match(content, /\/extensions\/sang-beamer\/sang-beamer\.typ/)
  assert.match(content, /\/extensions\/sang-beamer\/themes\.typ/)
  assert.doesNotMatch(content, /\/packages\/sang-math/)
})

test('không thay đổi dự án đã chuẩn hóa', () => {
  const official = projectWith(`${SANG_MATH_IMPORT}\n= Tài liệu`)
  const migrated = migrateProjectToUniverse(official)
  assert.equal(migrated.changedFiles, 0)
  assert.equal(migrated.project, official)
})
