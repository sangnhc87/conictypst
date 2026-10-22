// Giao diện thẻ "Công cụ soạn": nối nút bấm với plans.js, runner.js và cầu nối (Office.js hoặc AppleScript).
import { showView } from '../tabs.js'
import { parseExam, planRenumber, planMark, planHide, resolveAnswers } from './parse.js'
import { TEMPLATES, planFormat, planAnswerTable, planScoreBox, planAnswerSheet, planQr, planExportTable, planImportTable, planSolution, parseTsv, toTsv } from './plans.js'
import { createRunner } from './runner.js'
import { runDocClean } from './doc-clean.js'
import { PROVIDERS, loadConfig, saveConfig, clearConfig, solveQuestion } from './solve.js'

const $ = id => document.getElementById(id)
const STORE = 'sangmath.tools.settings'
const safe = op => { try { return op() } catch { return null } }

/**
 * @param host  cầu nối { read, apply, readTables }
 * @param getEngineAnswers  async () => { mc, tf, sa } đọc đáp án bằng bộ máy exam/engine (null nếu không có)
 */
export function initTools(host, getEngineAnswers) {
  const runner = createRunner(host)
  let scope = 'doc'
  let busy = false
  let engine = null // đáp án đã đọc từ đề: { mc, tf, sa }
  $('tabTools').hidden = false

  const status = (text, error = false) => { const el = $('tlStatus'); el.textContent = text || ''; el.classList.toggle('err', error) }
  const refreshUndo = () => {
    $('tlUndo').disabled = busy || runner.depth() === 0
    $('tlUndo').title = runner.peek() ? `Hoàn tác: ${runner.peek()}` : 'Chưa có thao tác nào để hoàn tác'
  }
  runner.onChange(refreshUndo)

  async function guard(label, job) {
    if (busy) return
    busy = true
    for (const b of document.querySelectorAll('#toolsView .actions button, #toolsView .tools-bar button')) b.disabled = true
    status(`${label}…`)
    try { await job() } catch (err) { status(err.message || String(err), true) } finally {
      busy = false
      for (const b of document.querySelectorAll('#toolsView .actions button, #toolsView .tools-bar button')) b.disabled = false
      refreshUndo()
    }
  }

  // ---------- làm đẹp tài liệu bất kỳ (chỉ khi chạy trong Word qua Office.js) ----------
  if (host.name === 'office') {
    $('tlDocBox').hidden = false
    const num = id => { const v = parseFloat($(id).value); return Number.isFinite(v) ? v : null }
    const docOpts = () => ({
      lists: $('dcLists').checked, bullet: $('dcBullet').value, renumber: $('dcRenum').checked, resetHeading: $('dcResetHead').checked,
      tabs: $('dcTabs').checked, spaces: $('dcSpaces').checked, punct: $('dcPunct').checked, empties: $('dcEmpty').checked,
      punctGap: $('dcPunctGap').checked, brackets: $('dcBrackets').checked, capFirst: $('dcCapFirst').checked,
      boldOpts: $('dcBoldOpts').checked, alignOpts: $('dcAlignOpts').checked,
      keepNext: $('dcKeepNext').checked, tableCenter: $('dcTableCenter').checked,
      softBreaks: $('dcSoftBreaks').checked, pageSetupA4: $('dcPageSetupA4').checked,
      skipTables: $('dcSkipTbl').checked,
      format: $('dcFmt').checked ? { font: $('dcFont').value.trim(), size: num('dcSize'), line: num('dcLine'), align: $('dcAlign').value, after: num('dcAfter'), indent: num('dcIndent') } : null,
    })
    const summary = (r, dry) => {
      const parts = []
      if (r.lists) parts.push(`${r.lists} mục danh sách → chữ`)
      if (r.renumber) parts.push(`${r.renumber} nhãn đánh số lại`)
      if (r.punctGap) parts.push(`${r.punctGap} chỗ thêm cách sau dấu câu`)
      if (r.brackets) parts.push(`${r.brackets} chỗ dọn cách trong ngoặc`)
      if (r.capFirst) parts.push(`${r.capFirst} chỗ viết hoa đầu câu`)
      if (r.boldOpts) parts.push(`${r.boldOpts} phương án in đậm`)
      if (r.alignOpts) parts.push(`${r.alignOpts} chỗ canh tab phương án`)
      if (r.tabs) parts.push(`${r.tabs} chỗ cách → tab`)
      if (r.spaces) parts.push(`${r.spaces} chỗ gộp cách`)
      if (r.punct) parts.push(`${r.punct} dấu cách trước dấu câu`)
      if (r.softBreaks) parts.push(`${r.softBreaks} ngắt dòng mềm → đoạn`)
      if (r.empties) parts.push(`${r.empties} đoạn trống`)
      if (r.keepNext) parts.push(`${r.keepNext} câu/tiêu đề chống mồ côi`)
      if (r.tables) parts.push(`${r.tables} bảng căn giữa`)
      if (r.pageSetup) parts.push(`${r.pageSetup} trang đặt lề chuẩn A4`)
      if (r.format) parts.push(`${r.format} đoạn định dạng`)
      return parts.length ? `${dry ? 'Sẽ sửa' : 'Đã sửa'} (${scopeName()}): ${parts.join(' · ')}.` : 'Không có chỗ nào cần sửa theo các lựa chọn này.'
    }
    const anyChecked = () => {
      const o = docOpts()
      return o.lists || o.renumber || o.tabs || o.spaces || o.punct || o.punctGap || o.brackets || o.capFirst ||
        o.boldOpts || o.alignOpts || o.softBreaks || o.empties || o.keepNext || o.tableCenter || o.pageSetupA4 || o.format
    }
    const runDoc = dry => guard(dry ? 'Xem trước' : 'Làm đẹp tài liệu', async () => {
      if (!anyChecked()) throw new Error('Hãy tích chọn ít nhất một việc cần làm.')
      const r = await runDocClean(docOpts(), scope, dry, t => status(`${t}…`))
      status(summary(r, dry))
    })
    $('dcPreview').addEventListener('click', () => runDoc(true))
    $('dcApply').addEventListener('click', () => runDoc(false))
  }

  // ---------- phạm vi ----------
  const setScope = s => { scope = s; $('tlScopeDoc').classList.toggle('on', s === 'doc'); $('tlScopeSel').classList.toggle('on', s === 'sel') }
  $('tlScopeDoc').addEventListener('click', () => setScope('doc'))
  $('tlScopeSel').addEventListener('click', () => setScope('sel'))
  const scopeName = () => (scope === 'sel' ? 'vùng chọn' : 'toàn tài liệu')

  const where = () => ($('tlWhereEnd').checked ? 'end' : 'selEnd')

  // ---------- đáp án ----------
  const useKey = () => $('tlSrcKey').checked
  $('tlSrcAuto').addEventListener('change', () => { $('tlKeyWrap').hidden = true })
  $('tlSrcKey').addEventListener('change', () => { $('tlKeyWrap').hidden = false })

  async function loadEngine(force = false) {
    if (engine && !force) return engine
    if (!getEngineAnswers) throw new Error('Chưa đọc được đáp án tự động ở chế độ này. Hãy chọn "Gõ đáp án".')
    status('Đang đọc đáp án từ đề (lần đầu có thể mất vài chục giây)…')
    engine = await getEngineAnswers()
    if (!engine) throw new Error('Không đọc được đáp án trong đề. Hãy chọn "Gõ đáp án".')
    return engine
  }
  // đáp án cho một lần chạy: { engine } hoặc { key }
  async function answerSource() {
    if (useKey()) {
      const key = $('tlKey').value.trim()
      if (!key) throw new Error('Hãy gõ đáp án (ví dụ 1A 2B 3C 4D).')
      return { key }
    }
    if (scope === 'sel') throw new Error('Với vùng chọn hãy dùng "Gõ đáp án" (đáp án tự đọc chỉ áp dụng cho toàn tài liệu).')
    return { engine: await loadEngine() }
  }

  $('tlReadKey').addEventListener('click', () => guard('Đọc đáp án', async () => {
    const e = await loadEngine(true)
    const { paras } = await host.read('doc')
    const ans = resolveAnswers(parseExam(paras), { engine: e })
    const got = ans.mc.filter(Boolean).length
    $('tlKeyInfo').textContent = `Phần I: ${got}/${ans.mcQs.length} câu có đáp án · Phần II: ${ans.tf.filter(Boolean).length}/${ans.tfQs.length} · Phần III: ${ans.sa.filter(Boolean).length}/${ans.saQs.length}`
    status('Đã đọc đáp án từ đề.')
  }))

  // ---------- 1. đánh số lại ----------
  $('tlRenumber').addEventListener('click', () => guard('Đánh số lại', async () => {
    const r = await runner.run(`Đánh số lại (${scopeName()})`, scope, paras => planRenumber(paras, {
      start: Math.max(1, Number($('tlStart').value) || 1), opts: $('tlOpts').checked, restart: $('tlRestart').checked,
    }))
    status(r.count ? `Đã sửa ${r.count} nhãn (${scopeName()}). Bấm Hoàn tác nếu cần.` : 'Số câu và phương án đã đúng thứ tự, không cần sửa.')
  }))

  // ---------- 2. định dạng ----------
  const tplSel = $('tlTpl')
  for (const [id, t] of Object.entries(TEMPLATES)) tplSel.append(new Option(t.name, id))
  const fillTpl = id => {
    const t = TEMPLATES[id]
    $('tlFont').value = t.font; $('tlSize').value = t.size; $('tlLine').value = t.line; $('tlAlign').value = t.align === 'justify' ? 'justify' : 'left'
    $('tlAfter').value = t.after; $('tlRule').checked = !!t.rule
  }
  tplSel.addEventListener('change', () => fillTpl(tplSel.value))
  fillTpl(tplSel.value)
  $('tlFormat').addEventListener('click', () => guard('Chuẩn hóa định dạng', async () => {
    const f = { font: $('tlFont').value.trim(), size: Number($('tlSize').value) || 0, line: Number($('tlLine').value) || 0, align: $('tlAlign').value, after: Number($('tlAfter').value) || 0, rule: $('tlRule').checked, boldLabel: $('tlBoldQ').checked }
    const r = await runner.run(`Chuẩn hóa định dạng (${scopeName()})`, scope, paras => planFormat(paras, f))
    status(r.count ? `Đã chuẩn hóa ${scopeName()}.` : 'Không có đoạn nào để chuẩn hóa.')
  }))

  // ---------- 3. đáp án đúng / lời giải ----------
  const markStyle = () => ({ bold: $('tlMkBold').checked, color: $('tlMkColorOn').checked ? $('tlMkColor').value : '', underline: $('tlMkUnder').checked })
  $('tlMark').addEventListener('click', () => guard('Tô đáp án đúng', async () => {
    const src = await answerSource()
    const style = markStyle()
    if (!style.bold && !style.color && !style.underline) throw new Error('Hãy chọn ít nhất một kiểu: in đậm, tô màu hoặc gạch chân.')
    const r = await runner.run(`Tô đáp án đúng (${scopeName()})`, scope, paras => {
      const ex = parseExam(paras)
      const ans = resolveAnswers(ex, src)
      const missing = ans.mc.filter(a => !a).length
      return { ops: planMark(ex, ans, style, true), note: missing ? ` Còn ${missing} câu chưa có đáp án.` : '' }
    })
    status(r.count ? `Đã tô ${r.count} chỗ.${r.note || ''}` : 'Không có đáp án nào để tô (kiểm tra lại đáp án).', !r.count)
  }))
  $('tlUnmark').addEventListener('click', () => guard('Bỏ tô đáp án', async () => {
    const src = await answerSource()
    const r = await runner.run(`Bỏ tô đáp án (${scopeName()})`, scope, paras => {
      const ex = parseExam(paras)
      return planMark(ex, resolveAnswers(ex, src), {}, false)
    })
    status(r.count ? `Đã bỏ tô ${r.count} chỗ.` : 'Không có gì để bỏ tô.')
  }))
  const hideJob = hide => guard(hide ? 'Ẩn lời giải' : 'Hiện lời giải', async () => {
    const r = await runner.run(`${hide ? 'Ẩn' : 'Hiện'} lời giải và bảng đáp án (${scopeName()})`, scope, paras => planHide(parseExam(paras), hide))
    status(r.count ? `Đã ${hide ? 'ẩn' : 'hiện'} ${r.count} đoạn lời giải / đáp án.` : 'Không tìm thấy đoạn lời giải hoặc bảng đáp án nào (đoạn bắt đầu bằng "Lời giải", "Hướng dẫn giải", "Đáp án"…).', !r.count)
  })
  $('tlHide').addEventListener('click', () => hideJob(true))
  $('tlShow').addEventListener('click', () => hideJob(false))

  // ---------- 4. chèn bảng đáp án / khung điểm / phiếu / QR ----------
  $('tlInsAns').addEventListener('click', () => guard('Chèn bảng đáp án', async () => {
    const src = useKey() ? { key: $('tlKey').value.trim() } : { engine: await loadEngine() }
    if (useKey() && !src.key) throw new Error('Hãy gõ đáp án (ví dụ 1A 2B 3C 4D).')
    await runner.run('Chèn bảng đáp án', 'doc', paras => planAnswerTable(paras, { ...src, where: where() }))
    status('Đã chèn bảng đáp án.')
  }))
  $('tlInsScore').addEventListener('click', () => guard('Chèn khung điểm', async () => {
    await runner.run('Chèn khung điểm', 'doc', paras => planScoreBox(paras, { where: where() }))
    status('Đã chèn khung điểm.')
  }))
  $('tlInsSheet').addEventListener('click', () => guard('Chèn phiếu trả lời', async () => {
    await runner.run('Chèn phiếu trả lời', 'doc', paras => planAnswerSheet(paras, { where: where() }))
    status('Đã chèn phiếu trả lời.')
  }))
  $('tlInsQr').addEventListener('click', () => guard('Chèn mã QR', async () => {
    const src = useKey() ? { key: $('tlKey').value.trim() } : { engine: await loadEngine() }
    if (useKey() && !src.key) throw new Error('Hãy gõ đáp án (ví dụ 1A 2B 3C 4D).')
    const r = await runner.run('Chèn mã QR đáp án', 'doc', paras => planQr(paras, { ...src, ma: $('tlMa').value.trim(), where: where() }))
    status(`Đã chèn mã QR (${r.text.length} ký tự đáp án). Quét bằng điện thoại để xem.`)
  }))

  // ---------- 5. xuất / nhập ----------
  let lastRows = null
  const sourceFor = async () => (useKey() && $('tlKey').value.trim() ? { key: $('tlKey').value.trim() } : getEngineAnswers ? { engine: await loadEngine().catch(() => null) || undefined } : {})
  $('tlExport').addEventListener('click', () => guard('Xuất danh sách câu hỏi', async () => {
    const src = await sourceFor()
    const r = await runner.run('Xuất danh sách câu hỏi ra bảng', 'doc', paras => planExportTable(paras, { ...src, where: where() }))
    lastRows = r.rows
    status(`Đã xuất ${r.rows.length} câu ra bảng. Công thức dạng hình không có chữ nên cột nội dung sẽ thiếu phần đó.`)
  }))
  $('tlCopyTsv').addEventListener('click', () => guard('Chép danh sách câu hỏi', async () => {
    const src = await sourceFor()
    const { paras } = await host.read(scope)
    const rows = planExportTable(paras, src).rows
    lastRows = rows
    await navigator.clipboard.writeText(toTsv([['Câu', 'Phần', 'Nội dung', 'A', 'B', 'C', 'D', 'Đáp án', 'Lời giải'], ...rows]))
    status(`Đã chép ${rows.length} câu. Dán vào Excel / Google Sheets.`)
  }))
  const importRows = (rows, label) => runner.run(label, 'doc', () => planImportTable(rows, { where: where() }), { read: false })
  $('tlImport').addEventListener('click', () => guard('Nhập từ bảng', async () => {
    const tables = await host.readTables(scope)
    if (!tables.length) throw new Error(scope === 'sel' ? 'Vùng chọn không có bảng. Bôi đen bảng câu hỏi trong Word.' : 'Tài liệu chưa có bảng nào.')
    const rows = tables[0]
    const data = rows.filter(x => x.some(c => String(c).trim()))
    await importRows(rows, 'Nhập câu hỏi từ bảng')
    status(`Đã nhập ${data.length - (/^câu$/i.test(String(data[0]?.[0]).trim()) ? 1 : 0)} câu từ bảng đầu tiên.`)
  }))
  $('tlImportPaste').addEventListener('click', () => guard('Nhập từ dữ liệu dán', async () => {
    const rows = parseTsv($('tlPaste').value)
    if (!rows.length) throw new Error('Hãy dán dữ liệu từ Excel vào ô trên.')
    await importRows(rows, 'Nhập câu hỏi từ dữ liệu dán')
    status('Đã nhập câu hỏi vào đề.')
  }))

  // ---------- 6. giải bằng AI ----------
  const provSel = $('tlProv')
  for (const [id, p] of Object.entries(PROVIDERS)) provSel.append(new Option(p.name, id))
  const cfg0 = loadConfig()
  const showProv = () => { const p = PROVIDERS[provSel.value]; $('tlModel').placeholder = p.model; $('tlUrl').placeholder = p.url; $('tlUrlWrap').hidden = provSel.value !== 'openai' }
  provSel.value = cfg0.provider in PROVIDERS ? cfg0.provider : 'anthropic'
  $('tlModel').value = cfg0.model || ''; $('tlApiKey').value = cfg0.key || ''; $('tlUrl').value = cfg0.url || ''
  showProv()
  provSel.addEventListener('change', showProv)
  const readCfg = () => ({ provider: provSel.value, model: $('tlModel').value.trim(), key: $('tlApiKey').value.trim(), url: provSel.value === 'openai' ? $('tlUrl').value.trim() : '' })
  $('tlKeySave').addEventListener('click', () => { status(saveConfig(readCfg()) ? 'Đã lưu khóa API trên máy này.' : 'Không lưu được (trình duyệt chặn bộ nhớ).', false) })
  $('tlKeyClear').addEventListener('click', () => { clearConfig(); $('tlApiKey').value = ''; status('Đã xóa khóa API khỏi máy này.') })
  $('tlSolve').addEventListener('click', () => guard('Đang hỏi AI', async () => {
    const cfg = readCfg()
    if (!cfg.key) { $('tlAiBox').open = true; throw new Error('Chưa nhập khóa API. Mở "Cài đặt khóa API" bên dưới rồi dán khóa.') }
    const { paras } = await host.read('sel')
    const question = paras.join('\n').trim()
    const answer = await solveQuestion(question, cfg)
    await runner.run('Chèn lời giải AI', 'doc', () => planSolution(answer, { where: 'selEnd' }), { read: false })
    status('Đã chèn lời giải sau câu hỏi. Hãy đọc lại trước khi dùng.')
  }))

  // ---------- hoàn tác ----------
  $('tlUndo').addEventListener('click', () => guard('Hoàn tác', async () => { status(`Đã hoàn tác: ${await runner.undo()}.`) }))

  // ---------- nhớ cài đặt ----------
  const FIELDS = ['tlStart', 'tlOpts', 'tlRestart', 'tlTpl', 'tlFont', 'tlSize', 'tlLine', 'tlAlign', 'tlAfter', 'tlRule', 'tlBoldQ', 'tlMkBold', 'tlMkColorOn', 'tlMkColor', 'tlMkUnder', 'tlMa']
  const saved = safe(() => JSON.parse(localStorage.getItem(STORE) || '{}')) || {}
  for (const id of FIELDS) { const el = $(id); if (id in saved) { if (el.type === 'checkbox') el.checked = saved[id]; else el.value = saved[id] } }
  for (const id of FIELDS) $(id).addEventListener('change', () => safe(() => localStorage.setItem(STORE, JSON.stringify(Object.fromEntries(FIELDS.map(f => [f, $(f).type === 'checkbox' ? $(f).checked : $(f).value]))))))

  $('tabTools').addEventListener('click', () => showView('tools'))
  refreshUndo()
  return { runner, setScope }
}
