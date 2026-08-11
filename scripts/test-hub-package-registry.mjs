import assert from 'node:assert/strict'
import test from 'node:test'
import {
  SANG_MATH_PACKAGE_ROOT,
  StudioPackageRegistry,
  isBundledSangMathPackage,
} from '../typst-conic-hub/src/studio/packageRegistry.js'
import { SANG_MATH_VERSION } from '../typst-conic-hub/src/studio/packagePolicy.js'

function createAccessModel() {
  const files = new Map()
  const insertions = []
  return {
    files,
    insertions,
    insertFile(path, content, modifiedAt) {
      files.set(path, content)
      insertions.push({ path, content, modifiedAt })
    },
  }
}

test('registry cài package hiện hành vào MemoryAccessModel và trả đúng package root', () => {
  const accessModel = createAccessModel()
  const fallbackCalls = []
  const fallback = {
    resolve(spec, context) {
      fallbackCalls.push({ spec, context })
      return '/fallback/package'
    },
  }
  const registry = new StudioPackageRegistry(accessModel, {
    'typst.toml': '[package]\nname = "sang-math"',
    'sang-exam.typ': '#let inline = box[$x$]',
  }, fallback)

  const spec = { namespace: 'preview', name: 'sang-math', version: SANG_MATH_VERSION }
  assert.equal(isBundledSangMathPackage(spec), true)
  assert.equal(registry.resolve(spec, { untar: () => undefined }), SANG_MATH_PACKAGE_ROOT)
  assert.equal(fallbackCalls.length, 0)
  assert.equal(
    new TextDecoder().decode(accessModel.files.get(`${SANG_MATH_PACKAGE_ROOT}/sang-exam.typ`)),
    '#let inline = box[$x$]',
  )
  assert.ok(accessModel.insertions.every(item => item.modifiedAt instanceof Date))
})

test('registry fallback cho sang-math cũ và mọi package khác', () => {
  const accessModel = createAccessModel()
  const fallbackCalls = []
  const fallback = {
    resolve(spec) {
      fallbackCalls.push(spec)
      return `/fallback/${spec.name}/${spec.version}`
    },
  }
  const registry = new StudioPackageRegistry(accessModel, {}, fallback)

  assert.equal(
    registry.resolve({ namespace: 'preview', name: 'sang-math', version: '1.0.1' }),
    '/fallback/sang-math/1.0.1',
  )
  assert.equal(
    registry.resolve({ namespace: 'preview', name: 'cetz', version: '0.3.4' }),
    '/fallback/cetz/0.3.4',
  )
  assert.equal(fallbackCalls.length, 2)
})

test('reset contract có thể chèn lại toàn bộ bundled package', () => {
  const accessModel = createAccessModel()
  const registry = new StudioPackageRegistry(accessModel, {
    'typst.toml': '[package]',
    'lib.typ': '#let answer = 42',
  }, { resolve: () => undefined })
  const beforeReset = accessModel.insertions.length

  registry.installBundledPackage()

  assert.equal(accessModel.insertions.length, beforeReset + 2)
  assert.equal(accessModel.files.size, 2)
})
