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

const k10Titles = {
  'CD00-Logic-MenhDe-SuyLuan-ToanHoc-VDC': 'VDC: Logic Mệnh đề, Suy luận toán học & Câu đố Hiệp sĩ - Kẻ nói dối',
  'CD01-TapHop-ThamSo-VDC': 'VDC 10: Chuyên đề 1 — Bài tập vận dụng – vận dụng cao các phép toán tập hợp có chứa tham số',
  'CD02-ToanKinhTe-VDC': 'VDC 10: Chuyên đề 2 — Bài tập toán kinh tế (Cung Cầu, Điểm hòa vốn, Leontief & Thuế)',
  'CD03-GiaTriLuongGiacMotGoc-VDC': 'VDC 10: Chuyên đề 3 — Tuyển tập bài tập vận dụng – vận dụng cao giá trị lượng giác một góc',
  'CD04-ToanThucTe-HeThucLuong-TamGiac-VDC': 'VDC 10: Chuyên đề 4 — Bài tập toán thực tế liên quan đến hệ thức lượng trong tam giác',
  'CD05-ChungMinhDangThuc-TamGiac-VDC': 'VDC 10: Chuyên đề 5 — Bài toán chứng minh các đẳng thức trong tam giác',
  'CD06.0-Vecto-VDC': 'VDC 10: Chuyên đề 6.0 — Bài tập vận dụng – vận dụng cao chuyên đề vectơ',
  'CD06.1-TapHopDiem-VDC': 'VDC 10: Chuyên đề 6.1 — Tập hợp điểm & Quỹ tích vectơ',
  'CD07.0-HamSo-TamThucBacHai-VDC': 'VDC 10: Chuyên đề 7.0 — Bài tập vận dụng – vận dụng cao chuyên đề hàm số – hàm số bậc hai và tam thức bậc hai',
  'CD07.1-ToanThucTe-HamSoBacHai-VDC': 'VDC 10: Chuyên đề 7.1 — Toán thực tế liên quan đến hàm số bậc hai',
  'CD08-PhuongTrinhDuongThang-VDC': 'VDC 10: Chuyên đề 8 — Bài tập vận dụng – vận dụng cao chuyên đề phương trình đường thẳng',
  'CD09-PhuongTrinhDuongTron-VDC': 'VDC 10: Chuyên đề 9 — Bài tập vận dụng – vận dụng cao chuyên đề phương trình đường tròn',
  'CD10-BaDuongConic-VDC': 'VDC 10: Chuyên đề 10 — Bài tập vận dụng – vận dụng cao chuyên đề ba đường cônic',
  'CD11-HaiQuyTacPhepDem-VDC': 'VDC 10: Chuyên đề 11 — Bài tập vận dụng – vận dụng cao chuyên đề hai quy tắc phép đếm',
  'CD12-HoanVi-ChinhHop-ToHop-VDC': 'VDC 10: Chuyên đề 12 — Bài tập vận dụng – vận dụng cao hoán vị – chỉnh hợp – tổ hợp',
  'CD13-XacSuatBienCo-VDC': 'VDC 10: Chuyên đề 13 — Bài tập vận dụng – vận dụng cao chuyên đề xác suất biến cố',
  'CD14-NhiThucNewton-VDC': 'VDC 10: Chuyên đề 14 — Bài tập vận dụng – vận dụng cao chuyên đề nhị thức Niutơn',
  'CD15-ToanThucTe-HinhHocOxy-VDC': 'VDC 10: Chuyên đề 15 — Tuyển tập các bài toán thực tế hình học phẳng Oxy',
  'CD02-QuyHoachTuyenTinh-VDC': 'VDC: Bất phương trình & Quy hoạch tuyến tính thực tế',
  'CD03-HeThucLuong-NhanDang-CucTri-VDC': 'VDC: Hệ thức lượng trong tam giác & Cực trị hình học',
  'CD04-TamTiCu-CucTri-Vecto-VDC': 'VDC: Tâm tỉ cự & Cực trị biểu thức vectơ',
  'CD05-ThongKe-TuPhanVi-Outliers-VDC': 'VDC: Thống kê, Tứ phân vị & Dữ liệu bất thường (Outliers)',
  'CD06-Parabol-TamThucBacHai-VDC': 'VDC: Parabol thực tế, Tam thức bậc hai & Định lý đảo dấu',
  'CD07-Oxy-CucTri-DuongThang-DuongTron-VDC': 'VDC: Phương pháp tọa độ Oxy, Cực trị đường thẳng & đường tròn',
  'CD08-ChiaKeoEuler-FSM-ToHop-VDC': 'VDC: Chia kẹo Euler, Máy trạng thái hữu hạn FSM & Tổ hợp đếm',
  'CD09-XacSuat-ChiaNhom-TroChoi-VDC': 'VDC: Xác suất cổ điển, Chia nhóm & Lý thuyết trò chơi',
  'CD10-CDHT1-HePT-Gauss-Leontief-VDC': 'CĐHT 1: Hệ phương trình 3 ẩn, Khử Gauss & Mô hình Leontief',
  'CD11-CDHT2-QuyNap-BatDangThuc-VDC': 'CĐHT 2: Quy nạp toán học, Bất đẳng thức VDC & Nhị thức Newton',
  'CD12-CDHT3-BaDuongConic-QuangHoc-VDC': 'CĐHT 3: Ba đường Conic tổng quát, Tính chất quang học & Quỹ đạo',
  'TOAN-THU-CHUYEN-DE-VDC-TOAN-10': 'Đại Toàn Thư Chuyên Đề VDC Toán Học 10 — Nguồn Gốc & Mở Rộng',
}

function titleFromId(id) {
  if (k10Titles[id]) return k10Titles[id]
  return id
    .replace(/^CD-K10-/, '')
    .replace(/^CD-\d+-/, '')
    .replace(/^CD\d+-/, '')
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

function inferCdGrade(file, id) {
  const s = id.toLowerCase()
  const dir = path.dirname(file).toLowerCase()
  if (dir.includes('cd-k10-nc') || s.includes('k10') || /^cd(0[0-9]|1[0-2])/.test(s) || s.startsWith('toan-thu')) return 10
  if (/(nhandangtamgiac|quyhoachtuyentinh)/.test(s) && !s.includes('12')) return 10
  if (/(dayso|gioihan|luonggiac|quanhesongsong)/.test(s)) return 11
  return 12
}

function inferCdCluster(id) {
  const s = id.toLowerCase()
  if (/(chiphi|doanhthu|kinh-te|laisuat|lorenz|nangsuat|quyhoach|leontief)/.test(s)) return 'Kinh tế - tối ưu'
  if (/(oxyz|matcau|matphong)/.test(s)) return 'Oxyz - hình học không gian'
  if (/(xacsuat|xác|tohop|xepghe|chia-keo|markov|phanphoi|bayes|fsm|tomau|đếm|dem)/.test(s)) return 'Tổ hợp - xác suất'
  if (/(tichphan|nguyenham|tiemcan|khaosat|tang-giam|hamso)/.test(s)) return 'Giải tích thực tế'
  if (/(conic|quanghoc)/.test(s)) return 'Ba đường Conic'
  if (/(oxy|dtron|duongtron|tiepxuc|tiếp|duongcong|min|max|tam-giac|nhandangtamgiac|hethucluong)/.test(s)) return 'Hình học & Tọa độ Oxy'
  if (/(vecto|tamticu)/.test(s)) return 'Vectơ - Tọa độ'
  if (/(thongke|tuphanvi|outlier|ghepnhom)/.test(s)) return 'Thống kê - dữ liệu'
  if (/(logic|menhde|taphop)/.test(s)) return 'Mệnh đề - Tập hợp'
  if (/(quynap|batdangthuc|dayso)/.test(s)) return 'Dãy số - Quy nạp'
  return 'Chuyên đề tổng hợp'
}

function inferCdTags(id, cluster, grade) {
  const tags = new Set([cluster, `Khối ${grade}`, 'VDC', 'Chuyên đề'])
  const s = id.toLowerCase()
  const pairs = [
    ['tích phân', /(tichphan|nguyenham|lorenz|gini)/],
    ['đạo hàm', /(tang-giam|khaosat|hamso|tiemcan|toiuu)/],
    ['xác suất', /(xacsuat|bayes|phanphoi|markov|sodocay)/],
    ['tổ hợp', /(tohop|xepghe|chia-keo|fsm|tomau|dem|đếm)/],
    ['Oxyz', /(oxyz|matcau|matphong)/],
    ['Oxy', /(oxy\b|duongthang|duongtron|elip|hypebol|parabol|conic)/],
    ['kinh tế', /(chiphi|doanhthu|kinh-te|thue|laisuat|nangsuat|leontief)/],
    ['VDC', /(nang-cao|chuyensau|min|max|vdc|morong|chan9-10)/],
    ['quy nạp', /(quynap|newton)/],
    ['vectơ', /(vecto|tamticu)/],
    ['thống kê', /(thongke|tuphanvi|outlier)/],
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
  return walk(examsDir, file => {
    const base = path.basename(file)
    return (
      (base.startsWith('CD-') || base.startsWith('CD') || base.startsWith('TOAN-THU'))
      && file.endsWith('.typ')
    )
  })
    .filter(file => !file.endsWith('.bak') && !file.includes(' copy') && !file.includes('CD-K10-C01-TapHop-ThamSo-VDC.typ'))
    .sort()
    .map(file => {
      const id = stripExt(path.basename(file))
      const pdf = stripExt(file) + '.pdf'
      const sourceTyp = rel(file)
      const pdfPath = existsSync(pdf) ? rel(pdf) : null
      const grade = inferCdGrade(file, id)
      const cluster = inferCdCluster(id)
      const pdfUrl = pdfPath ? stageAtlasPdf(pdf, 'chuyen-de') : null
      return {
        id,
        kind: 'cd',
        title: titleFromId(id),
        grade,
        cluster,
        status: pdfUrl ? 'ready' : 'draft',
        difficulty: 'VDC',
        tags: inferCdTags(id, cluster, grade),
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

  if (grade === 10) {
    if (lesson >= 1 && lesson <= 2) chapter = 'Chương I · Mệnh đề và tập hợp'
    else if (lesson >= 3 && lesson <= 4) chapter = 'Chương II · Bất phương trình bậc nhất hai ẩn'
    else if (lesson >= 5 && lesson <= 6) chapter = 'Chương III · Hệ thức lượng trong tam giác'
    else if (lesson >= 7 && lesson <= 11) chapter = 'Chương IV · Vectơ'
    else if (lesson >= 12 && lesson <= 14) chapter = 'Chương V · Thống kê và sai số'
    else if (lesson >= 15 && lesson <= 18) chapter = 'Chương VI · Hàm số, đồ thị và ứng dụng'
    else if (lesson >= 19 && lesson <= 22) chapter = 'Chương VII · Phương pháp tọa độ trong mặt phẳng'
    else if (lesson >= 23 && lesson <= 25) chapter = 'Chương VIII · Đại số tổ hợp'
    else if (lesson >= 26 && lesson <= 27) chapter = 'Chương IX · Xác suất'
    else if (review) chapter = `Ôn tập chương ${review}`
    else if (experience) chapter = `Hoạt động trải nghiệm ${experience}`
    if (lesson !== null) semester = lesson <= 14 ? 'HKI' : 'HKII'
  } else if (grade === 11) {
    if (lesson >= 1 && lesson <= 4) chapter = 'Chương I · Hàm số lượng giác'
    else if (lesson >= 5 && lesson <= 7) chapter = 'Chương II · Dãy số. Cấp số cộng và CSN'
    else if (lesson >= 8 && lesson <= 9) chapter = 'Chương III · Thống kê mẫu số liệu ghép nhóm'
    else if (lesson >= 10 && lesson <= 14) chapter = 'Chương IV · Quan hệ song song'
    else if (lesson >= 15 && lesson <= 17) chapter = 'Chương V · Giới hạn. Hàm số liên tục'
    else if (lesson >= 18 && lesson <= 21) chapter = 'Chương VI · Hàm số mũ và logarit'
    else if (lesson >= 22 && lesson <= 27) chapter = 'Chương VII · Quan hệ vuông góc'
    else if (lesson >= 28 && lesson <= 30) chapter = 'Chương VIII · Quy tắc tính xác suất'
    else if (lesson >= 31 && lesson <= 33) chapter = 'Chương IX · Đạo hàm'
    else if (review) chapter = `Ôn tập chương ${review}`
    else if (experience) chapter = `Hoạt động trải nghiệm ${experience}`
    if (lesson !== null) semester = lesson <= 17 ? 'HKI' : 'HKII'
  } else if (grade === 12) {
    if (lesson >= 1 && lesson <= 5) chapter = 'Chương I · Ứng dụng đạo hàm khảo sát hàm số'
    else if (lesson >= 6 && lesson <= 9) chapter = 'Chương II · Vectơ và tọa độ trong không gian'
    else if (lesson >= 10 && lesson <= 11) chapter = 'Chương III · Thống kê ghép nhóm'
    else if (lesson >= 11 && lesson <= 13) chapter = 'Chương IV · Nguyên hàm và tích phân'
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
      const isCd = lower.includes('cd') || lower.includes('vdc') || lower.includes('chuyen-de')
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
        difficulty: isCd ? 'VDC' : null,
        tags: ['beamer', inferred.chapter, `Khối ${inferred.grade}`, ...(isCd ? ['VDC', 'Chuyên đề'] : [])],
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
  ...makeLessonPlanAssets(11),
  ...makeLessonPlanAssets(12),
  ...makeBeamerAssets(),
])
const payload = {
  generated_at: generatedAt,
  counts: {
    total: assets.length,
    cd: assets.filter(a => a.kind === 'cd').length,
    vdc: assets.filter(a => a.difficulty === 'VDC' || (a.tags && a.tags.includes('VDC'))).length,
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
  + ` | VDC: ${payload.counts.vdc}`
  + ` | Giáo án: ${payload.counts.lesson_plan}`
  + ` | Beamer: ${payload.counts.beamer}`,
)
