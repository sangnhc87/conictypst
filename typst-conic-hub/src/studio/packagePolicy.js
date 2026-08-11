export const SANG_MATH_VERSION = '1.0.2'
export const SANG_MATH_PACKAGE = `@preview/sang-math:${SANG_MATH_VERSION}`
export const SANG_MATH_IMPORT = `#import "${SANG_MATH_PACKAGE}": *`
export const SANG_MATH_UNIVERSE_URL = 'https://typst.app/universe/package/sang-math'

const LEGACY_PREFIX = '/packages/sang-math/'
const OUTDATED_PUBLIC_VERSIONS = new Set(['1.0.0', '1.0.1'])
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

function officialImportVersions(source) {
  return String(source || '').split('\n').flatMap(line => {
    const match = line.match(/^\s*#import\s+"@preview\/sang-math:(\d+\.\d+\.\d+)"/)
    return match ? [match[1]] : []
  })
}

function isOfficialImportLine(line) {
  return /^\s*#import\s+"@preview\/sang-math:\d+\.\d+\.\d+"/.test(line)
}

export function inspectSangMathProject(files = {}) {
  let officialImports = 0
  let currentImports = 0
  let outdatedImports = 0
  let legacyImports = 0
  let studioExtensions = 0
  const officialVersions = []

  for (const [, file] of textFiles(files)) {
    const source = String(file.content || '')
    const versions = officialImportVersions(source)
    officialImports += versions.length
    currentImports += versions.filter(version => version === SANG_MATH_VERSION).length
    outdatedImports += versions.filter(version => OUTDATED_PUBLIC_VERSIONS.has(version)).length
    officialVersions.push(...versions)
    legacyImports += source.split(LEGACY_PREFIX).length - 1
    studioExtensions += source.split('/extensions/sang-beamer/').length - 1
  }

  return {
    officialImports,
    currentImports,
    outdatedImports,
    officialVersions: [...new Set(officialVersions)],
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
    const officialImport = line.match(/^(\s*#import\s+")@preview\/sang-math:(\d+\.\d+\.\d+)(".*)$/)
    if (officialImport && OUTDATED_PUBLIC_VERSIONS.has(officialImport[2])) {
      line = `${officialImport[1]}${SANG_MATH_PACKAGE}${officialImport[3]}`
      changed = true
    }

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

  if (needsOfficialImport && !output.some(isOfficialImportLine)) {
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
