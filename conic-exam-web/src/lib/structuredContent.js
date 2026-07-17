export const STRUCTURED_CONTENT_PREFIX = 'conic-typst-katex/v1\n'

export function assetIndexes(source) {
  return [...String(source || '').matchAll(/@@CONIC_ASSET_(\d+)@@/gu)]
    .map(match => Number(match[1]))
    .filter((value, index, values) => Number.isSafeInteger(value) && values.indexOf(value) === index)
}

export function encodeStructuredContent(sources, assets = []) {
  const list = (Array.isArray(sources) ? sources : [sources]).map(String).filter(Boolean)
  const indexes = assetIndexes(list.join('\n'))
  const selectedAssets = Object.fromEntries(indexes.map(index => [index, assets[index]]).filter(([, value]) => value))
  return `${STRUCTURED_CONTENT_PREFIX}${JSON.stringify({ sources: list, assets: selectedAssets })}`
}

export function decodeStructuredContent(value) {
  if (typeof value !== 'string' || !value.startsWith(STRUCTURED_CONTENT_PREFIX)) return null
  try {
    const parsed = JSON.parse(value.slice(STRUCTURED_CONTENT_PREFIX.length))
    if (!Array.isArray(parsed?.sources) || parsed.sources.some(source => typeof source !== 'string')) return null
    return { sources: parsed.sources, assets: parsed.assets && typeof parsed.assets === 'object' ? parsed.assets : {} }
  } catch {
    return null
  }
}
