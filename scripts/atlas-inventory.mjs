import {
  copyFileSync,
  existsSync,
  mkdirSync,
  readFileSync,
  readdirSync,
  rmSync,
  statSync,
  writeFileSync,
} from 'node:fs'
import path from 'node:path'

const root = process.cwd()
const examsDir = path.join(root, 'typst', 'exams')
const beamerDir = path.join(root, 'typst', 'beamer')
const lessonPlanDir = path.join(root, 'typst', 'giao-an')
const beamerPublicPdfDir = path.join(root, 'web-app', 'public', 'pdfs')
const atlasPublicPdfDir = path.join(root, 'public', 'hdsd', 'atlas-pdfs')
const outFile = path.join(root, 'public', 'hdsd', 'atlas-data.json')
const githubBlobBase = 'https://github.com/sangnhc87/conictypst/blob/main/'
const beamerWebBase = 'https://beamer-gjv.pages.dev/pdfs/'
const maxPagesFileSize = 24 * 1024 * 1024

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

function beamerPdfUrl(pdfFile) {
  const name = path.basename(pdfFile)
  const publicPdf = path.join(beamerPublicPdfDir, name)
  if (existsSync(publicPdf)) return `${beamerWebBase}${encodeURIComponent(name)}`
  return null
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

function stageAtlasPdf(pdfFile, group) {
  if (!existsSync(pdfFile) || statSync(pdfFile).size > maxPagesFileSize) return null
  const targetDir = path.join(atlasPublicPdfDir, group)
  const target = path.join(targetDir, path.basename(pdfFile))
  mkdirSync(targetDir, { recursive: true })
  copyFileSync(pdfFile, target)
  return `atlas-pdfs/${urlPath(group)}/${encodeURIComponent(path.basename(pdfFile))}`
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
  const lesson = Number((base.match(/bai-(\d+)/) || [])[1] || 0) || null
  let chapter = null
  if (lower.includes('hkii')) chapter = 'Học kỳ II · Chương IV–VI'
  else if (lower.includes('luong-giac')) chapter = 'Lượng giác'
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
      const pdfUrl = pdfPath ? stageAtlasPdf(pdf, 'chuyen-de') : null
      return {
        id,
        kind: 'cd',
        title: titleFromId(id),
        grade: 12,
        cluster,
        status: pdfUrl ? 'ready' : 'draft',
        difficulty: null,
        tags: inferCdTags(id, cluster),
        source_typ: sourceTyp,
        source_url: githubBlob(sourceTyp),
        pdf: pdfPath,
        pdf_url: pdfUrl,
      }
    })
}

function lessonPlanTitle(file) {
  const source = readFileSync(file, 'utf8')
  const match = source.match(/ten-bai:\s*"([^"]+)"/)
  if (match) return match[1].normalize('NFC')
  return titleFromId(stripExt(path.basename(file)).replace(/^giao-an-\d+-/, ''))
}

function inferLessonPlanMeta(file, grade) {
  const base = path.basename(file, '.typ')
  const lesson = Number((base.match(/-bai-(\d+)/) || [])[1] || null)
  const review = Number((base.match(/on-tap-chuong-(\d+)/) || [])[1] || null)
  const experience = Number((base.match(/hthtn-(\d+)/) || [])[1] || null)
  let chapter = 'Giáo án'
  let semester = null

  if (grade === 12) {
    if (lesson >= 11 && lesson <= 13) chapter = 'Chương IV · Nguyên hàm và tích phân'
    else if (lesson >= 14 && lesson <= 17) chapter = 'Chương V · Tọa độ trong không gian'
    else if (lesson >= 18 && lesson <= 19) chapter = 'Chương VI · Xác suất có điều kiện'
    else if (review >= 4 && review <= 6) chapter = `Ôn tập chương ${review}`
    else if (experience >= 4) chapter = 'Thực hành trải nghiệm HKII'
    else chapter = 'Giáo án HKI'
    if (lesson >= 11 || review >= 4 || experience >= 4) semester = 'HKII'
    else semester = 'HKI'
  }

  return { lesson, chapter, semester }
}

function makeLessonPlanAssets(grade) {
  const dir = path.join(lessonPlanDir, `khoi-${grade}`)
  return walk(dir, file => (
    path.basename(file).startsWith(`giao-an-${grade}-`)
    && file.endsWith('.typ')
  ))
    .sort()
    .map(file => {
      const id = stripExt(path.basename(file))
      const pdf = stripExt(file) + '.pdf'
      const sourceTyp = rel(file)
      const meta = inferLessonPlanMeta(file, grade)
      const pdfPath = existsSync(pdf) ? rel(pdf) : null
      const pdfUrl = pdfPath ? stageAtlasPdf(pdf, `giao-an-${grade}`) : null
      return {
        id,
        kind: 'lesson-plan',
        title: lessonPlanTitle(file),
        grade,
        chapter: meta.chapter,
        lesson: meta.lesson,
        semester: meta.semester,
        status: pdfUrl ? 'ready' : 'draft',
        tags: ['giáo án', `Khối ${grade}`, ...(meta.semester ? [meta.semester] : [])],
        source_typ: sourceTyp,
        source_url: githubBlob(sourceTyp),
        pdf: pdfPath,
        pdf_url: pdfUrl,
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
      const lower = id.toLowerCase()
      const publicPdf = path.join(beamerPublicPdfDir, `${id}.pdf`)
      const pdfUrl = existsSync(publicPdf) ? `${beamerWebBase}${encodeURIComponent(`${id}.pdf`)}` : null
      return {
        id,
        kind: 'beamer',
        title: lower.includes('hkii')
          ? 'Bộ bài giảng HKII: Nguyên hàm, Tọa độ, Xác suất'
          : titleFromId(id),
        grade: inferred.grade,
        chapter: inferred.chapter,
        lesson: inferred.lesson,
        status: pdfUrl ? 'ready' : 'draft',
        tags: ['beamer', inferred.chapter, `Khối ${inferred.grade}`],
        source_typ: sourceTyp,
        source_url: githubBlob(sourceTyp),
        pdf: pdfPath || (existsSync(publicPdf) ? rel(publicPdf) : null),
        pdf_url: pdfUrl,
      }
    })
}

rmSync(atlasPublicPdfDir, { recursive: true, force: true })

const generatedAt = new Date().toISOString()
const assets = ensureUniqueIds([
  ...makeCdAssets(),
  ...makeLessonPlanAssets(10),
  ...makeLessonPlanAssets(12),
  ...makeBeamerAssets(),
])
const payload = {
  generated_at: generatedAt,
  counts: {
    total: assets.length,
    cd: assets.filter(a => a.kind === 'cd').length,
    lesson_plan: assets.filter(a => a.kind === 'lesson-plan').length,
    beamer: assets.filter(a => a.kind === 'beamer').length,
  },
  assets,
}

mkdirSync(path.dirname(outFile), { recursive: true })
writeFileSync(outFile, JSON.stringify(payload, null, 2) + '\n', 'utf8')

console.log(`Atlas inventory written: ${rel(outFile)}`)
console.log(
  `Total: ${payload.counts.total}`
  + ` | CD: ${payload.counts.cd}`
  + ` | Giáo án: ${payload.counts.lesson_plan}`
  + ` | Beamer: ${payload.counts.beamer}`,
)
