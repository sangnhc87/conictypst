export const SANG_MATH_PACKAGE = '@preview/sang-math:1.0.0'
export const SANG_MATH_IMPORT = `#import "${SANG_MATH_PACKAGE}": *`
export const SANG_MATH_UNIVERSE_URL = 'https://typst.app/universe/package/sang-math'

const LEGACY_PREFIX = '/packages/sang-math/'
const LEGACY_BEAMER_IMPORTS = new Map([
  ['/packages/sang-math/sang-beamer.typ', '/extensions/sang-beamer/sang-beamer.typ'],
  ['/packages/sang-math/sang-beamer-themes.typ', '/extensions/sang-beamer/themes.typ'],
])

const PUBLIC_MODULES = new Set([
  'lib.typ',
  'bbt.typ',
  'book-templates.typ',
  'exam-templates.typ',
  'geometry.typ',
  'math-sym.typ',
  'sang-exam.typ',
  'core/colors.typ',
  'core/math-utils.typ',
  'geometry-2d/conics.typ',
  'geometry-3d/curves-3d.typ',
  'geometry-3d/revolution.typ',
])

function textFiles(files = {}) {
  return Object.entries(files).filter(([, file]) => file?.kind === 'text')
}

export function inspectSangMathProject(files = {}) {
  let officialImports = 0
  let legacyImports = 0
  let studioExtensions = 0

  for (const [, file] of textFiles(files)) {
    const source = String(file.content || '')
    officialImports += source.split(SANG_MATH_PACKAGE).length - 1
    legacyImports += source.split(LEGACY_PREFIX).length - 1
    studioExtensions += source.split('/extensions/sang-beamer/').length - 1
  }

  return {
    officialImports,
    legacyImports,
    studioExtensions,
    mode: legacyImports ? 'legacy' : officialImports ? 'official' : studioExtensions ? 'extension' : 'none',
  }
}

function migrateSource(source) {
  let changed = false
  let needsOfficialImport = false
  const output = []

  for (const originalLine of String(source || '').split('\n')) {
    let line = originalLine
    for (const [legacy, replacement] of LEGACY_BEAMER_IMPORTS) {
      if (line.includes(legacy)) {
        line = line.replaceAll(legacy, replacement)
        changed = true
      }
    }

    const match = line.match(/^\s*#import\s+"\/packages\/sang-math\/(.+?)"(?:\s*:\s*.*)?\s*$/)
    if (match && PUBLIC_MODULES.has(match[1])) {
      needsOfficialImport = true
      changed = true
      continue
    }
    output.push(line)
  }

  if (needsOfficialImport && !output.some(line => line.includes(SANG_MATH_PACKAGE))) {
    const firstContent = output.findIndex(line => line.trim() && !line.trim().startsWith('//'))
    output.splice(firstContent < 0 ? 0 : firstContent, 0, SANG_MATH_IMPORT)
  }

  return { content: output.join('\n'), changed }
}

export function migrateProjectToUniverse(project) {
  let changedFiles = 0
  const files = Object.fromEntries(Object.entries(project?.files || {}).map(([path, file]) => {
    if (file?.kind !== 'text') return [path, file]
    const migrated = migrateSource(file.content)
    if (migrated.changed) changedFiles += 1
    return [path, migrated.changed ? { ...file, content: migrated.content } : file]
  }))

  return {
    project: changedFiles ? { ...project, files } : project,
    changedFiles,
  }
}
