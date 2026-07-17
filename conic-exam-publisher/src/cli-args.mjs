import path from 'node:path'

const VALUE_OPTIONS = new Set([
  '--root',
  '--renderer',
  '--out',
  '--title',
  '--description',
  '--source-id',
  '--version',
  '--mode',
  '--profile',
  '--typst',
  '--font-path',
  '--package-path',
  '--creation-timestamp',
  '--timeout-ms',
])

export function usage() {
  return `Usage:
  conic-exam-publish <source.typ> [options]

Sources:
  - Legacy/data module exporting make-questions
  - TypstConicHub source bounded by CONICTYPST:QUESTIONS markers

Options:
  --root <dir>                 Typst project root (default: source directory)
  --renderer <path|package>    Module exporting tn, ds, tln, tl
  --out <dir>                  Output directory (default: ./conic-exam-build)
  --title <text>               Exam title (default: source filename)
  --description <text>         Optional description
  --source-id <text>           Logical source identifier
  --version <text>             Release version (default: 1)
  --mode <auto|legacy|hub>     Source adapter (default: auto)
  --profile <thpt-2025|custom> Scoring/shape profile (default: thpt-2025)
  --strict                     Require explicit stable IDs and TLN answer-value
  --non-strict                 Generate draft IDs and derive simple TLN answers
  --review                     Also render private review/solution SVGs
  --no-review                  Skip review SVGs (default; compatibility flag)
  --typst <command>            Typst executable (default: typst)
  --font-path <dir>            Repeatable Typst font path
  --package-path <dir>         Offline Typst package path
  --creation-timestamp <unix>  Reproducible compilation timestamp (default: 0)
  --timeout-ms <number>        Per Typst command timeout (default: 120000)
  -h, --help                   Show this help`
}

export function parseCliArgs(argv) {
  const values = {}
  const fontPaths = []
  let source = null
  let strict = true
  let renderReview = false

  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index]
    if (token === '-h' || token === '--help') return { help: true }
    if (token === '--strict') {
      strict = true
      continue
    }
    if (token === '--non-strict') {
      strict = false
      continue
    }
    if (token === '--no-review') {
      renderReview = false
      continue
    }
    if (token === '--review') {
      renderReview = true
      continue
    }
    if (VALUE_OPTIONS.has(token)) {
      const value = argv[index + 1]
      if (value === undefined || value.startsWith('--')) throw new TypeError(`Thiếu giá trị cho ${token}.`)
      index += 1
      if (token === '--font-path') fontPaths.push(value)
      else values[token.slice(2)] = value
      continue
    }
    if (token.startsWith('-')) throw new TypeError(`Tùy chọn không hỗ trợ: ${token}`)
    if (source !== null) throw new TypeError('Chỉ được truyền một tệp nguồn Typst.')
    source = token
  }

  if (!source) throw new TypeError(`Thiếu tệp nguồn.\n\n${usage()}`)
  const sourcePath = path.resolve(source)
  const root = path.resolve(values.root || path.dirname(sourcePath))
  const mode = values.mode || 'auto'
  if (!['auto', 'legacy', 'hub'].includes(mode)) throw new TypeError('--mode chỉ nhận auto, legacy hoặc hub.')
  const profile = values.profile || 'thpt-2025'
  if (!['thpt-2025', 'custom'].includes(profile)) throw new TypeError('--profile chỉ nhận thpt-2025 hoặc custom.')

  return {
    sourcePath,
    root,
    renderer: values.renderer || null,
    outputDirectory: path.resolve(values.out || 'conic-exam-build'),
    title: values.title || path.basename(sourcePath, path.extname(sourcePath)),
    description: values.description || '',
    sourceId: values['source-id'] || path.relative(root, sourcePath).split(path.sep).join('/'),
    version: values.version || '1',
    mode,
    profile,
    strict,
    renderReview,
    typstCommand: values.typst || 'typst',
    fontPaths: fontPaths.map(item => path.resolve(item)),
    packagePath: values['package-path'] ? path.resolve(values['package-path']) : null,
    creationTimestamp: values['creation-timestamp'] || '0',
    timeoutMs: Number(values['timeout-ms'] || 120000),
  }
}
