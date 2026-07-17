import { FetchPackageRegistry } from '@myriaddreamin/typst.ts/dist/esm/main.mjs'
import { SANG_MATH_VERSION } from './packagePolicy.js'

export const SANG_MATH_PACKAGE_ROOT = `/@memory/bundled/packages/preview/sang-math/${SANG_MATH_VERSION}`

export function isBundledSangMathPackage(spec) {
  return spec?.namespace === 'preview'
    && spec?.name === 'sang-math'
    && String(spec?.version || '') === SANG_MATH_VERSION
}

export class StudioPackageRegistry {
  constructor(accessModel, bundledFiles = {}, fallback = new FetchPackageRegistry(accessModel)) {
    this.accessModel = accessModel
    this.bundledFiles = Object.entries(bundledFiles).map(([path, content]) => [
      `${SANG_MATH_PACKAGE_ROOT}/${path}`,
      new TextEncoder().encode(String(content)),
    ])
    this.fallback = fallback
    this.installBundledPackage()
  }

  installBundledPackage() {
    const modifiedAt = new Date(0)
    for (const [path, content] of this.bundledFiles) {
      this.accessModel.insertFile(path, content, modifiedAt)
    }
  }

  resolve(spec, context) {
    if (isBundledSangMathPackage(spec)) {
      this.installBundledPackage()
      return SANG_MATH_PACKAGE_ROOT
    }
    return this.fallback.resolve(spec, context)
  }
}
