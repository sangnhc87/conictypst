import { readdirSync, existsSync, mkdirSync, writeFileSync, statSync } from 'node:fs'
import path from 'node:path'
import { execFileSync } from 'node:child_process'

const root = process.cwd()
const examsDir = path.join(root, 'typst', 'exams')
const beamerDir = path.join(root, 'typst', 'beamer')
const beamerPublicPdfDir = path.join(root, 'web-app', 'public', 'pdfs')
const outFile = path.join(root, 'public', 'hdsd', 'atlas-data.json')
const githubBlobBase = 'https://github.com/sangnhc87/conictypst/blob/main/'
const githubRawBase = 'https://raw.githubusercontent.com/sangnhc87/conictypst/main/'
const beamerWebBase = 'https://beamer-gjv.pages.dev/pdfs/'

function walk(dir, predicate = () => true) {
  if (!existsSync(dir)) return []
  const out = []
  for (const name of readdirSync(dir)) {
    const full = path.join(dir, name)
    const stat = statSync(full)
    if (stat.isDirectory() && name === 'cleaned') continue
    if (stat.isDirectory()) out.push(...walk(full, predicate))
    else if (predicate(full)) out.push(full)
  }
  return out
}

function rel(file) {
  return path.relative(root, file).replaceAll(path.sep, '/')
}

function urlPath(filePath) {
  return filePath.split('/').map(part => encodeURIComponent(part)).join('/')
}

function githubBlob(filePath) {
  return `${githubBlobBase}${urlPath(filePath)}`
}

function githubRaw(filePath) {
  return `${githubRawBase}${urlPath(filePath)}`
}

function isGitTracked(filePath) {
  try {
    execFileSync('git', ['ls-files', '--error-unmatch', filePath], {
      cwd: root,
      stdio: 'ignore',
    })
    return true
  } catch {
    return false
  }
}

function beamerPdfUrl(pdfFile) {
  const name = path.basename(pdfFile)
  const publicPdf = path.join(beamerPublicPdfDir, name)
  if (existsSync(publicPdf)) return `${beamerWebBase}${encodeURIComponent(name)}`
  return githubRaw(rel(pdfFile))
}

function stripExt(file) {
  return file.replace(/\.[^.]+$/, '')
}

function titleFromId(id) {
  return id
    .replace(/^CD-/, '')
    .replace(/^beamer-\d+-/, '')
    .replaceAll('-', ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

function inferCdCluster(id) {
  const s = id.toLowerCase()
  if (/(chiphi|doanhthu|kinh-te|laisuat|lorenz|nangsuat|quyhoach)/.test(s)) return 'Kinh tế - tối ưu'
  if (/(oxyz|matcau|matphong|vecto|duongthang|khoang-cach|goc)/.test(s)) return 'Oxyz - hình học không gian'
  if (/(xacsuat|xác|tohop|xepghe|chia-keo|markov|phanphoi|bayes|fsm|tomau|đếm|dem)/.test(s)) return 'Tổ hợp - xác suất'
  if (/(tichphan|nguyenham|tiemcan|khaosat|tang-giam|hamso|parabol)/.test(s)) return 'Giải tích thực tế'
  if (/(tiepxuc|tiếp|duongcong|min|max|dtron|duongtron|hinh|conic)/.test(s)) return 'Hình học khó'
  return 'Chuyên đề tổng hợp'
}

function inferCdTags(id, cluster) {
  const tags = new Set([cluster])
  const s = id.toLowerCase()
  const pairs = [
    ['tích phân', /(tichphan|nguyenham|lorenz|gini)/],
    ['đạo hàm', /(tang-giam|khaosat|hamso|tiemcan|toiuu)/],
    ['xác suất', /(xacsuat|bayes|phanphoi|markov|sodocay)/],
    ['tổ hợp', /(tohop|xepghe|chia-keo|fsm|tomau|dem|đếm)/],
    ['Oxyz', /(oxyz|matcau|matphong|vecto|duongthang)/],
    ['kinh tế', /(chiphi|doanhthu|kinh-te|thue|laisuat|nangsuat)/],
    ['VDC', /(nang-cao|chuyensau|min|max|vdc|morong)/],
  ]
  for (const [tag, re] of pairs) if (re.test(s)) tags.add(tag)
  return [...tags]
}

function inferBeamer(file) {
  const base = path.basename(file, '.typ')
  const lower = base.toLowerCase()
  const grade = Number((base.match(/beamer-(\d+)/) || [])[1] || 12)
  const lesson = Number((base.match(/bai-(\d+)/) || [])[1] || null)
  let chapter = null
  if (lower.includes('luong-giac')) chapter = 'Lượng giác'
  else if (lower.includes('mu-')) chapter = 'Mũ - Logarit'
  else if (lower.includes('c3') || lower.includes('day-so')) chapter = 'Dãy số'
  else if (lower.includes('udh') || lower.includes('tinh-on') || lower.includes('gtln') || lower.includes('tiem-can')) chapter = 'Ứng dụng đạo hàm'
  else chapter = 'Bài giảng'
  return { grade, lesson, chapter }
}

function makeCdAssets() {
  return walk(examsDir, file => path.basename(file).startsWith('CD-') && file.endsWith('.typ'))
    .filter(file => !file.endsWith('.bak') && !file.includes(' copy'))
    .sort()
    .map(file => {
      const id = stripExt(path.basename(file))
      const pdf = stripExt(file) + '.pdf'
      const sourceTyp = rel(file)
      const pdfPath = existsSync(pdf) ? rel(pdf) : null
      const cluster = inferCdCluster(id)
      return {
        id,
        kind: 'cd',
        title: titleFromId(id),
        grade: 12,
        cluster,
        status: 'draft',
        difficulty: null,
        tags: inferCdTags(id, cluster),
        source_typ: sourceTyp,
        source_url: githubBlob(sourceTyp),
        pdf: pdfPath,
        pdf_url: pdfPath && isGitTracked(pdfPath) ? githubRaw(pdfPath) : null,
      }
    })
}

function ensureUniqueIds(assets) {
  const seen = new Map()
  return assets.map(asset => {
    const count = seen.get(asset.id) || 0
    seen.set(asset.id, count + 1)
    if (count === 0) return { ...asset, base_id: asset.id }
    const parent = path.basename(path.dirname(asset.source_typ)).replace(/[^A-Za-z0-9_-]+/g, '-')
    return {
      ...asset,
      base_id: asset.id,
      id: `${asset.id}--${parent || count + 1}`,
    }
  })
}

function makeBeamerAssets() {
  return walk(beamerDir, file => path.basename(file).startsWith('beamer-') && file.endsWith('.typ'))
    .sort()
    .map(file => {
      const id = stripExt(path.basename(file))
      const pdf = stripExt(file) + '.pdf'
      const sourceTyp = rel(file)
      const pdfPath = existsSync(pdf) ? rel(pdf) : null
      const inferred = inferBeamer(file)
      return {
        id,
        kind: 'beamer',
        title: titleFromId(id),
        grade: inferred.grade,
        chapter: inferred.chapter,
        lesson: inferred.lesson,
        status: existsSync(pdf) ? 'ready' : 'draft',
        tags: ['beamer', inferred.chapter, `Khối ${inferred.grade}`],
        source_typ: sourceTyp,
        source_url: githubBlob(sourceTyp),
        pdf: pdfPath,
        pdf_url: pdfPath ? beamerPdfUrl(pdf) : null,
      }
    })
}

const generatedAt = new Date().toISOString()
const assets = ensureUniqueIds([...makeCdAssets(), ...makeBeamerAssets()])
const payload = {
  generated_at: generatedAt,
  counts: {
    total: assets.length,
    cd: assets.filter(a => a.kind === 'cd').length,
    beamer: assets.filter(a => a.kind === 'beamer').length,
  },
  assets,
}

mkdirSync(path.dirname(outFile), { recursive: true })
writeFileSync(outFile, JSON.stringify(payload, null, 2) + '\n', 'utf8')

console.log(`Atlas inventory written: ${rel(outFile)}`)
console.log(`Total: ${payload.counts.total} | CD: ${payload.counts.cd} | Beamer: ${payload.counts.beamer}`)
