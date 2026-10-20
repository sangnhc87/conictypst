import { showView, registerExam } from './tabs.js'
import { mountStyleOptions } from './examStyle.js'
// Thẻ "Đề thi" trong app Mac: kéo đề vào, phân tích cấu trúc, làm đẹp, trộn đề, thư viện đề, hồ sơ đầu đề nhớ sẵn.
// Bộ máy xử lý chạy ở tiến trình chính (Python), giao diện này chỉ gọi qua window.examBridge.
const $ = id => document.getElementById(id)
const eb = () => window.examBridge

let styleCtl = null
const HEADER_FIELDS = ['so_giao_duc', 'truong', 'ten_ky_thi', 'mon_thi', 'thoi_gian']
const PART_LABEL = { num_questions_part1: 'Phần I (trắc nghiệm)', num_questions_part2: 'Phần II (đúng/sai)', num_questions_part3: 'Phần III (trả lời ngắn)', num_questions_part4: 'Phần IV (tự luận)' }

let settings = null
let current = null // kết quả phân tích của đề đang chọn
let busy = false

function status(text, error = false) {
  const el = $('examStatus')
  el.textContent = text || ''
  el.classList.toggle('err', error)
}

function setBusy(on, label) {
  busy = on
  for (const id of ['runBeautify', 'runShuffle']) $(id).disabled = on || !current
  if (label) status(label)
}

// ---------- hồ sơ đầu đề ----------
function fillProfileSelect() {
  const sel = $('profile')
  sel.replaceChildren(...settings.profiles.map((p, i) => { const o = document.createElement('option'); o.value = i; o.textContent = p.ten || `Hồ sơ ${i + 1}`; return o }))
  sel.value = String(Math.min(settings.last.profile ?? 0, settings.profiles.length - 1))
}

function applyProfile(i) {
  const p = settings.profiles[i] || {}
  for (const f of HEADER_FIELDS) $(f).value = p[f] ?? settings.last[f] ?? ''
  // tên kỳ thi / môn / thời gian đã nhập lần trước ưu tiên hơn giá trị mặc định của hồ sơ
  for (const f of ['ten_ky_thi', 'mon_thi', 'thoi_gian']) if (settings.last[f]) $(f).value = settings.last[f]
}

function readForm() {
  const o = { ...(styleCtl ? styleCtl.read() : {}), save_dir: $('saveDir').value.trim(), madelist: $('madelist').value.trim(), keep_original: $('keep_original').checked }
  for (const f of HEADER_FIELDS) o[f] = $(f).value.trim()
  return o
}

async function saveLast() {
  const form = readForm()
  const style = { ...form }; for (const k of [...HEADER_FIELDS, 'madelist', 'keep_original', 'save_dir']) delete style[k]
  settings.last = { ...settings.last, ...form, style, save_dir: form.save_dir, profile: Number($('profile').value) }
  await eb().setSettings(settings)
}

// Electron không có prompt(): dùng ô nhập ngay tại chỗ
function openProfileName() {
  $('profileSaveRow').hidden = false
  $('profileName').value = $('truong').value
  $('profileName').focus()
}

async function saveProfile() {
  const name = $('profileName').value.trim()
  if (!name) return
  const profile = { ten: name }
  for (const f of HEADER_FIELDS) profile[f] = $(f).value.trim()
  const i = settings.profiles.findIndex(p => p.ten === name)
  if (i >= 0) settings.profiles[i] = profile; else settings.profiles.push(profile)
  settings.last.profile = i >= 0 ? i : settings.profiles.length - 1
  await eb().setSettings(settings)
  fillProfileSelect()
  $('profileSaveRow').hidden = true
  status(`Đã lưu hồ sơ "${name}".`)
}

// ---------- phân tích đề ----------
function renderAnalysis(a) {
  $('examFile').hidden = false
  $('examName').textContent = a.name
  const counts = $('examCounts'), warn = $('examWarn')
  counts.replaceChildren(); warn.replaceChildren()
  const c = a.count || {}
  if (c.error) {
    const li = document.createElement('li'); li.className = 'bad'; li.textContent = c.error; counts.append(li)
  } else {
    for (const [key, label] of Object.entries(PART_LABEL)) {
      if (c[key] > 0 || key !== 'num_questions_part4') {
        const li = document.createElement('li'); li.textContent = `${label}: ${c[key] ?? 0} câu`; counts.append(li)
      }
    }
    for (const e of [...(c.part1_errors || []), ...(c.part2_errors || []), ...(c.part3_errors || [])]) {
      const li = document.createElement('li'); li.textContent = e; warn.append(li)
    }
  }
  renderAnswers(a, warn)
}

// Đáp án đã đánh dấu sẵn trong đề (gạch chân chữ cái, Đ/S, đáp án ngắn), đọc bằng chính bộ trộn đề
function renderAnswers(a, warn) {
  const box = $('examAnswers')
  box.replaceChildren()
  if (a.answerError) { const li = document.createElement('li'); li.textContent = `Chưa đọc được đáp án: ${a.answerError}`; warn.append(li); return }
  if (!a.answers) return
  const parts = [['Phần I (trắc nghiệm)', a.answers.mc], ['Phần II (đúng/sai)', a.answers.tf], ['Phần III (trả lời ngắn)', a.answers.sa]]
  for (const [label, list] of parts) {
    if (!list.length) continue
    const got = list.filter(x => String(x).trim()).length
    const row = document.createElement('div'); row.className = 'ans-row'
    const b = document.createElement('b'); b.textContent = label
    const span = document.createElement('span'); span.textContent = `${got}/${list.length} câu có đáp án: ${list.map(x => String(x).trim() || '?').join('  ')}`
    if (got < list.length) span.classList.add('miss')
    row.append(b, span); box.append(row)
    if (got < list.length) {
      const miss = list.map((x, i) => (String(x).trim() ? 0 : i + 1)).filter(Boolean)
      const li = document.createElement('li'); li.textContent = `${label}: thiếu đáp án ở câu ${miss.join(', ')} (gạch chân chữ cái đúng, tô đỏ phương án đúng, hoặc thêm dòng "Đáp án:").`; warn.append(li)
    }
  }
}

async function loadFile(file) {
  if (!file || !/\.docx$/i.test(file)) { status('Chỉ nhận file Word .docx.', true); return }
  setBusy(true, 'Đang phân tích đề…')
  try {
    current = await eb().analyze(file)
    renderAnalysis(current)
    status('Đã phân tích. Chọn Làm đẹp hoặc Trộn đề.')
  } catch (err) {
    current = null
    status(`Không phân tích được: ${err.message || err}`, true)
  } finally {
    setBusy(false)
    $('runShuffle').disabled = !current
    $('runBeautify').disabled = !current
  }
}

// ---------- chạy ----------
async function run(action) {
  if (!current || busy) return
  if (action === 'shuffle' && !$('madelist').value.trim()) { status('Hãy nhập danh sách mã đề (ví dụ 101,102,103).', true); return }
  setBusy(true, action === 'shuffle' ? 'Đang trộn đề…' : 'Đang làm đẹp…')
  try {
    await saveLast()
    const form = readForm()
    // "Làm đẹp" = định dạng lại đề và xuất đáp án nhưng không đảo câu: chạy bộ trộn ở chế độ giữ nguyên thứ tự
    const options = action === 'shuffle' ? form : { ...form, keep_original: true, lam_dep: true, madelist: '1' }
    const result = await eb().run({ action: 'shuffle', source: current.file, options, label: action })
    status(`Xong trong ${result.seconds.toFixed(1)} giây: ${result.files.length} tệp. Đã lưu trong thư viện.`)
    await eb().reveal(`${result.outDir}/${result.files[0]}`)
    await renderHistory()
  } catch (err) {
    status(`Lỗi: ${err.message || err}`, true)
  } finally {
    setBusy(false)
  }
}

// ---------- thư viện đề ----------
const ACTION_LABEL = { shuffle: 'Trộn đề', beautify: 'Làm đẹp' }
const when = iso => new Date(iso).toLocaleString('vi-VN', { dateStyle: 'short', timeStyle: 'short' })

function rerun(run) {
  if (run.action !== 'shuffle') return
  for (const f of HEADER_FIELDS) if (run.options[f] != null) $(f).value = run.options[f]
  $('madelist').value = run.options.madelist || ''
  $('keep_original').checked = !!run.options.keep_original
  if (styleCtl) styleCtl.write(run.options)
  status('Đã nạp lại cấu hình của lần trộn trước. Chọn đề rồi bấm Trộn đề.')
}

async function renderHistory() {
  const exams = await eb().history()
  const box = $('history')
  if (!exams.length) { box.innerHTML = '<p class="muted">Chưa có đề nào. Kéo một file .docx vào để bắt đầu.</p>'; return }
  box.replaceChildren(...exams.map(ex => {
    const wrap = document.createElement('div'); wrap.className = 'hist-exam'
    const title = document.createElement('b'); title.textContent = ex.name
    wrap.append(title)
    for (const run of ex.runs.slice(0, 6)) {
      const row = document.createElement('div'); row.className = 'hist-run'
      const what = document.createElement('span'); what.className = 'what'
      const pretty = run.options && run.options.keep_original && String(run.options.madelist || '').split(',').length === 1
      what.textContent = pretty ? `Làm đẹp (mã ${run.options.madelist})` : `${ACTION_LABEL[run.action] || run.action}${run.action === 'shuffle' && run.options.madelist ? ` (${run.options.madelist})` : ''}`
      const time = document.createElement('span'); time.textContent = `${when(run.createdAt)} · ${run.files.length} tệp`
      const open = document.createElement('button'); open.type = 'button'; open.className = 'link'; open.textContent = 'Mở thư mục'
      open.addEventListener('click', () => eb().reveal(`${run.dir}/ket-qua/${run.files[0]}`))
      row.append(what, time, open)
      if (run.action === 'shuffle') {
        const again = document.createElement('button'); again.type = 'button'; again.className = 'link'; again.textContent = 'Dùng lại cấu hình'
        again.addEventListener('click', () => rerun(run))
        row.append(again)
      }
      wrap.append(row)
    }
    return wrap
  }))
}

// ---------- khởi tạo ----------
const showTab = name => showView(name)

export async function initExam() {
  if (!eb()) return
  registerExam('examView')
  $('tabExam').addEventListener('click', () => { showTab('exam'); renderHistory() })
  $('tabBeautify').addEventListener('click', () => { showTab('beautify'); renderHistory() })

  const env = await eb().env()
  $('libPath').textContent = `Thư mục: ${env.library}`
  if (!env.ok) { const box = $('examEnv'); box.hidden = false; box.textContent = env.problem }

  settings = await eb().getSettings()
  fillProfileSelect()
  applyProfile(Number($('profile').value))
  $('madelist').value = settings.last.madelist || ''
  $('keep_original').checked = !!settings.last.keep_original
  styleCtl = mountStyleOptions($('styleMount'), () => { clearTimeout(styleCtl.t); styleCtl.t = setTimeout(() => saveLast().catch(() => {}), 400) })
  styleCtl.write(settings.last.style || {})
  $('saveDir').value = settings.last.save_dir || ''
  $('saveDirPick').addEventListener('click', async () => { const d = await eb().pickDir(); if (d) { $('saveDir').value = d; saveLast().catch(() => {}) } })
  $('saveDirClear').addEventListener('click', () => { $('saveDir').value = ''; saveLast().catch(() => {}) })
  $('profile').addEventListener('change', () => { settings.last.ten_ky_thi = ''; applyProfile(Number($('profile').value)) })
  $('profileSave').addEventListener('click', openProfileName)
  $('profileOk').addEventListener('click', saveProfile)
  $('profileName').addEventListener('keydown', e => { if (e.key === 'Enter') saveProfile() })
  $('mdMake').addEventListener('click', () => {
    const n = Math.min(40, Math.max(1, Number($('mdCount').value) || 4))
    $('madelist').value = Array.from({ length: n }, (_, i) => 101 + i).join(',')
  })

  const drop = $('drop')
  drop.addEventListener('click', async () => { const f = await eb().pick(); if (f) loadFile(f) })
  drop.addEventListener('keydown', e => { if (e.key === 'Enter' || e.key === ' ') drop.click() })
  for (const ev of ['dragenter', 'dragover']) drop.addEventListener(ev, e => { e.preventDefault(); drop.classList.add('over') })
  for (const ev of ['dragleave', 'drop']) drop.addEventListener(ev, () => drop.classList.remove('over'))
  drop.addEventListener('drop', e => { e.preventDefault(); const f = e.dataTransfer.files[0]; if (f) loadFile(eb().pathForFile(f)) })
  // thả nhầm ra ngoài vùng thì không để cửa sổ chuyển sang hiển thị file
  window.addEventListener('dragover', e => e.preventDefault())
  window.addEventListener('drop', e => e.preventDefault())

  $('runBeautify').addEventListener('click', () => run('beautify'))
  $('runShuffle').addEventListener('click', () => run('shuffle'))
  $('examOpenWord').addEventListener('click', () => current && eb().open(current.file))
  $('examReveal').addEventListener('click', () => current && eb().reveal(current.file))
  setBusy(false)
}

// Chỉ để kiểm thử: mở với ?debug
if (location.search.includes('debug')) window.__exam = { loadFile, run: a => run(a), showTab }
