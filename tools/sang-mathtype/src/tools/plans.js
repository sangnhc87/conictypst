// Sinh thao tác cho: chuẩn hóa định dạng, bảng đáp án, khung điểm, phiếu trả lời, mã QR, xuất/nhập bảng câu hỏi.
import { parseExam, resolveAnswers, countByPart } from './parse.js'
import qrcode from '../../vendor/qrcode/qrcode.mjs'

// ---------- mẫu định dạng đề ----------
export const TEMPLATES = {
  chuan: { name: 'Chuẩn THPT (Times New Roman 12, giãn 1,15)', font: 'Times New Roman', size: 12, line: 1.15, align: 'justify', after: 3, rule: true },
  gon: { name: 'Gọn để in tiết kiệm giấy (TNR 11, giãn 1,0)', font: 'Times New Roman', size: 11, line: 1.0, align: 'justify', after: 0, rule: true },
  rong: { name: 'Dễ đọc cho học sinh (TNR 13, giãn 1,3)', font: 'Times New Roman', size: 13, line: 1.3, align: 'left', after: 4, rule: true },
  cambria: { name: 'Hiện đại (Cambria 12, giãn 1,15)', font: 'Cambria', size: 12, line: 1.15, align: 'left', after: 3, rule: false },
}

const ALIGN = { justify: 'Justified', left: 'Left', center: 'Centered', right: 'Right' }
export const alignName = a => ALIGN[a] || 'Left'

/** Chuẩn hóa định dạng: phông, cỡ, giãn dòng, canh lề, khoảng cách đoạn; tiêu đề PHẦN đậm + giữa; chữ "Câu n." đậm. */
export function planFormat(paras, f) {
  const ex = parseExam(paras)
  const ops = []
  const lineAt = f.line || 1
  ex.items.forEach((it, i) => {
    if (it.kind === 'empty') return
    const props = {}
    if (f.font) props.font = f.font
    if (f.size) props.size = f.size
    if (f.line) props.lineSpacing = Math.round(lineAt * 12 * 100) / 100
    props.spaceBefore = 0
    props.spaceAfter = f.after ?? 0
    props.align = it.kind === 'part' ? 'center' : (f.align === 'justify' && (it.kind === 'opt' || it.kind === 'sub') ? 'left' : f.align || 'left')
    if (it.kind === 'part') props.bold = true
    ops.push({ t: 'fmt', p: i, props })
    if (it.kind === 'q' && f.boldLabel !== false) ops.push({ t: 'fmt', p: i, span: it.q.span, props: { bold: true } })
  })
  if (f.rule) for (const part of ex.parts) ops.push({ t: 'insert', where: { after: part.p }, blocks: [{ type: 'rule' }] })
  return ops
}

// ---------- bảng ----------
const chunk = (arr, n) => Array.from({ length: Math.ceil(arr.length / n) }, (_, i) => arr.slice(i * n, i * n + n))
const para = (text, o = {}) => ({ type: 'para', text, ...o })
const table = (rows, o = {}) => ({ type: 'table', rows, header: true, ...o })

/** Bảng đáp án cuối đề: Phần I theo hàng 10 câu, Phần II dạng Đ/S, Phần III đáp án ngắn. */
export function planAnswerTable(paras, { engine, key, where = 'end' } = {}) {
  const ex = parseExam(paras)
  const ans = resolveAnswers(ex, { engine, key })
  const blocks = [para('BẢNG ĐÁP ÁN', { bold: true, align: 'center' })]
  if (ans.mcQs.length) {
    blocks.push(para('Phần I. Trắc nghiệm nhiều lựa chọn', { bold: true }))
    for (const g of chunk(ans.mcQs.map((q, i) => [String(q.n), ans.mc[i] || '?']), 10)) blocks.push(table([['Câu', ...g.map(x => x[0])], ['Đáp án', ...g.map(x => x[1])]]))
  }
  if (ans.tfQs.length) blocks.push(para('Phần II. Đúng / Sai', { bold: true }), table([['Câu', 'a', 'b', 'c', 'd'], ...ans.tfQs.map((q, i) => [String(q.n), ...[0, 1, 2, 3].map(k => ans.tf[i][k] || '?')])]))
  if (ans.saQs.length) blocks.push(para('Phần III. Trả lời ngắn', { bold: true }), table([['Câu', 'Đáp án'], ...ans.saQs.map((q, i) => [String(q.n), ans.sa[i] || '?'])]))
  if (blocks.length === 1) throw new Error('Không tìm thấy câu hỏi nào để lập bảng đáp án.')
  return [{ t: 'insert', where, blocks }]
}

/** Khung điểm: bảng điểm theo phần + ô họ tên / lớp / lời phê. */
export function planScoreBox(paras, { scores, where = 'sel' } = {}) {
  const ex = parseExam(paras)
  const c = countByPart(ex)
  const s = scores || { 1: c[1] * 0.25, 2: c[2] * 1, 3: c[3] * 0.5 }
  const f = n => String(Math.round(n * 100) / 100).replace('.', ',')
  const total = (s[1] || 0) + (s[2] || 0) + (s[3] || 0)
  return [{
    t: 'insert', where, blocks: [
      table([['Họ và tên:', '', 'Lớp:', '', 'Mã đề:', '']], { header: false }),
      table([['', 'Phần I', 'Phần II', 'Phần III', 'Tổng'], ['Điểm tối đa', f(s[1] || 0), f(s[2] || 0), f(s[3] || 0), f(total)], ['Điểm đạt được', '', '', '', ''], ['Giáo viên chấm', '', '', '', '']]),
      table([['Lời phê:', '']], { header: false }),
    ],
  }]
}

/** Phiếu trả lời: lưới ô chọn cho từng câu (Phần I: A B C D; Phần II: Đ S a b c d; Phần III: ô trống). */
export function planAnswerSheet(paras, { counts, where = 'end' } = {}) {
  const ex = parseExam(paras)
  const c = counts || countByPart(ex)
  const blocks = [para('PHIẾU TRẢ LỜI TRẮC NGHIỆM', { bold: true, align: 'center' }), para('Họ và tên: ................................  Lớp: ........  Mã đề: ........', {})]
  if (c[1]) {
    const per = 10
    const groups = chunk(Array.from({ length: c[1] }, (_, i) => i + 1), per)
    const cols = Math.min(groups.length, 4)
    for (const row of chunk(groups, cols)) {
      const rows = [row.flatMap(() => ['Câu', 'A', 'B', 'C', 'D'])]
      for (let r = 0; r < per; r++) rows.push(row.flatMap(g => g[r] ? [String(g[r]), '○', '○', '○', '○'] : ['', '', '', '', '']))
      blocks.push(table(rows, { center: true }))
    }
  }
  if (c[2]) blocks.push(para('Phần II. Điền Đ (đúng) hoặc S (sai) vào từng ý:', { bold: true }), table([['Câu', 'a', 'b', 'c', 'd'], ...Array.from({ length: c[2] }, (_, i) => [String(i + 1), '', '', '', ''])], { center: true }))
  if (c[3]) blocks.push(para('Phần III. Ghi đáp án (đã làm tròn theo yêu cầu):', { bold: true }), table(chunk(Array.from({ length: c[3] }, (_, i) => i + 1), 6).map(g => [['Câu', ...g.map(String)], ['Đáp án', ...g.map(() => '')]]).flat(), { center: true }))
  if (blocks.length === 2) throw new Error('Không có số câu để lập phiếu. Hãy mở đề hoặc nhập số câu từng phần.')
  return [{ t: 'insert', where, blocks }]
}

/** Chuỗi đáp án gọn để đưa vào mã QR: SM1|mã đề|1A,2B,…|5DSDS (Đ→D)|6=2,5 */
export function answerPayload(ans, ma = '') {
  const mc = ans.mc.map((a, i) => `${ans.mcQs[i].n}${a || '?'}`).join(',')
  const tf = ans.tf.map((a, i) => `${ans.tfQs[i].n}${a || '?'}`).join(',')
  const sa = ans.sa.map((a, i) => `${ans.saQs[i].n}=${a || '?'}`).join(',')
  // Mã QR chỉ chứa ASCII (Đ → D = Đúng, S = Sai) để mọi ứng dụng quét đọc đúng
  const ascii = t => t.replace(/Đ/g, 'D').replace(/đ/g, 'd').normalize('NFD').replace(/[\u0300-\u036f]/g, '')
  return ascii(`SM1|${ma}|${mc}|${tf}|${sa}`)
}

/** Mã QR chứa đáp án → ảnh GIF (Word nhận GIF; không cần bộ mã hóa PNG). */
export function qrBlock(text, sizePt = 90) {
  const qr = qrcode(0, 'M')
  qr.addData(text, 'Byte')
  qr.make()
  const url = qr.createDataURL(6, 8)
  return { type: 'image', b64: url.slice(url.indexOf(',') + 1), ext: 'gif', widthPt: sizePt, heightPt: sizePt, alt: 'Mã QR đáp án (Sang Math)' }
}

export function planQr(paras, { engine, key, ma = '', where = 'end' } = {}) {
  const ex = parseExam(paras)
  const ans = resolveAnswers(ex, { engine, key })
  if (!ans.mcQs.length && !ans.tfQs.length && !ans.saQs.length) throw new Error('Không tìm thấy câu hỏi nào để mã hóa đáp án.')
  const text = answerPayload(ans, ma)
  return { text, ops: [{ t: 'insert', where, blocks: [para('Mã QR đáp án (quét để xem đáp án):', { italic: true }), qrBlock(text)] }] }
}

// ---------- xuất / nhập danh sách câu hỏi ----------
export const EXPORT_HEAD = ['Câu', 'Phần', 'Nội dung', 'A / a)', 'B / b)', 'C / c)', 'D / d)', 'Đáp án', 'Lời giải']
const stripLabel = (text, span) => text.slice(span.off + span.len).replace(/^\s*[.:)]?\s*/, '')
const stripOpt = (t, tok) => t.slice(tok.off + tok.label.length).trim()

/** Bảng câu hỏi dạng chữ: mỗi câu một hàng. Công thức là hình thì không có chữ nên sẽ mất trong cột nội dung. */
export function exportRows(paras, { engine, key } = {}) {
  const ex = parseExam(paras)
  const ans = resolveAnswers(ex, { engine, key })
  return ex.questions.map(q => {
    const opts = q.options.length ? q.options : q.subs
    const toks = opts.flatMap(o => o.tokens.map(t => ({ ...t, p: o.p, end: nextOff(paras[o.p], t, o.tokens) })))
    const stem = [stripLabel(paras[q.p], q.span), ...q.paras.filter(p => p !== q.p && !opts.some(o => o.p === p) && !q.sol.includes(p)).map(p => paras[p])].filter(Boolean).join('\n')
    const cells = [0, 1, 2, 3].map(k => toks[k] ? paras[toks[k].p].slice(toks[k].off + toks[k].label.length, toks[k].end).trim() : '')
    const mi = ans.mcQs.indexOf(q), ti = ans.tfQs.indexOf(q), si = ans.saQs.indexOf(q)
    const answer = mi >= 0 ? ans.mc[mi] : ti >= 0 ? ans.tf[ti] : si >= 0 ? ans.sa[si] : ''
    const sol = q.sol.map(p => paras[p]).filter(Boolean).join('\n')
    return [String(q.n), String(q.part || ''), stem, ...cells, answer || '', sol]
  })
}
function nextOff(text, tok, tokens) {
  const k = tokens.indexOf(tok)
  return k >= 0 && tokens[k + 1] ? tokens[k + 1].off : text.length
}

export function planExportTable(paras, { engine, key, where = 'end' } = {}) {
  const rows = exportRows(paras, { engine, key })
  if (!rows.length) throw new Error('Không tìm thấy câu hỏi nào để xuất.')
  return { rows, ops: [{ t: 'insert', where, blocks: [para('DANH SÁCH CÂU HỎI', { bold: true, align: 'center' }), table([EXPORT_HEAD, ...rows], { widths: [30, 30, 220, 80, 80, 80, 80, 40, 140] })] }] }
}

/** Tạo các đoạn đề thi từ bảng đã có (cột như EXPORT_HEAD; hàng đầu là tiêu đề thì bỏ qua). */
export function planImportTable(rows, { where = 'end', start = 0 } = {}) {
  const data = rows.filter(r => r.some(c => String(c).trim()))
  if (data.length && /^câu$/i.test(String(data[0][0]).trim())) data.shift()
  if (!data.length) throw new Error('Bảng không có dòng câu hỏi nào.')
  const blocks = []
  let part = 0
  const roman = { 1: 'I', 2: 'II', 3: 'III' }
  data.forEach((r, i) => {
    const n = start ? start + i : (Number(String(r[0]).replace(/\D/g, '')) || i + 1)
    const p = Number(r[1]) || part || 1
    if (p !== part && roman[p]) { part = p; blocks.push(para(`PHẦN ${roman[p]}.`, { bold: true, align: 'center' })) }
    const stem = String(r[2] || '').split('\n')
    blocks.push(para(`Câu ${n}. ${stem[0]}`, { boldPrefix: `Câu ${n}.`.length }))
    for (const extra of stem.slice(1)) blocks.push(para(extra))
    const cells = [r[3], r[4], r[5], r[6]].map(c => String(c ?? '').trim())
    cells.forEach((c, k) => { if (c) blocks.push(para(`${p === 2 ? String.fromCharCode(97 + k) + ')' : String.fromCharCode(65 + k) + '.'} ${c}`)) })
    if (String(r[7] || '').trim()) blocks.push(para(`Đáp án: ${String(r[7]).trim()}`, { italic: true }))
    if (String(r[8] || '').trim()) for (const [k, line] of String(r[8]).split('\n').entries()) blocks.push(para(k ? line : `Lời giải. ${line}`))
  })
  return [{ t: 'insert', where, blocks }]
}

/** Dán bảng từ Excel / Google Sheets (TSV) → mảng hàng. */
export function parseTsv(text) {
  return String(text || '').replace(/\r/g, '').split('\n').filter(l => l.length).map(l => l.split('\t'))
}
export function toTsv(rows) {
  return rows.map(r => r.map(c => String(c).replace(/[\t\n]+/g, ' ')).join('\t')).join('\n')
}

/** Lời giải AI: đoạn chèn sau vùng chọn. */
export function planSolution(text, { where = 'selEnd' } = {}) {
  const lines = String(text).split('\n').map(s => s.trimEnd()).filter(s => s.trim())
  if (!lines.length) throw new Error('Không nhận được lời giải.')
  return [{ t: 'insert', where, blocks: lines.map((l, i) => para(i ? l : `Lời giải. ${l}`, { color: '#1a56db' })) }]
}
