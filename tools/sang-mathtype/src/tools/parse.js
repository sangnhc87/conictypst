// Phân tích cấu trúc đề từ danh sách đoạn văn (chỉ chữ): Phần, Câu, phương án A.B.C.D, ý a) b) c) d), lời giải, đáp án.
// Thuần JS, không đụng Word: kết quả là các thao tác (ops) để cầu nối Office.js / AppleScript thực thi.

const PART_RE = /^\s*PHẦN\s+(IV|III|II|I|\d)\b/i
const Q_RE = /^(\s*)((?:Câu|Bài)\s*(\d+))(\s*[.:)]?)/i
const OPT_RE = /^\s*([A-D])\s*[.)]/
const SUB_RE = /^\s*([a-d])\s*\)/
const SOL_RE = /^\s*(Lời giải|Hướng dẫn giải|Hướng dẫn|HDG|Đáp án)\b|^\s*(Giải|Chọn\s+[A-D])\s*[:.]?\s*$/i
const KEY_RE = /^\s*(BẢNG\s+ĐÁP\s+ÁN|ĐÁP\s+ÁN|HƯỚNG\s+DẪN\s+(GIẢI|CHẤM)|LỜI\s+GIẢI(\s+CHI\s+TIẾT)?)\s*[:.]?\s*$/i
const ROMAN = { I: 1, II: 2, III: 3, IV: 4 }

// Nhãn nội dòng: "A. ... B. ... C. ..." trong một đoạn. Nhãn phải đứng đầu đoạn hoặc sau khoảng trắng/tab.
function inlineTokens(text, re) {
  const out = []
  for (const m of text.matchAll(re)) out.push({ off: m.index + m[1].length, label: m[2] + m[3], letter: m[2] })
  return out
}
const UP_TOKEN = /(^|[\s ])([A-D])([.)])(?=\s|\S)/g
const LO_TOKEN = /(^|[\s ])([a-d])(\))(?=\s|\S)/g

const occOf = (text, needle, off) => {
  let n = 0
  for (let i = text.indexOf(needle); i >= 0 && i < off; i = text.indexOf(needle, i + 1)) n++
  return n
}
const span = (text, off, len) => ({ off, len, text: text.slice(off, off + len), occ: occOf(text, text.slice(off, off + len), off) })

/**
 * @param {string[]} paras  nội dung chữ từng đoạn
 * @returns {{ items: object[], questions: object[], parts: object[], keyStart: number }}
 * items[i] = { kind: 'part'|'q'|'opt'|'sub'|'sol'|'key'|'text'|'empty', ... }
 */
export function parseExam(paras) {
  const items = paras.map(text => ({ kind: text.trim() ? 'text' : 'empty', text }))
  const questions = []
  const parts = []
  let q = null
  let part = 0
  let inSol = false
  let keyStart = -1
  paras.forEach((text, i) => {
    const it = items[i]
    if (keyStart >= 0) { it.kind = it.kind === 'empty' ? 'empty' : 'key'; return }
    if (text.trim().length <= 40 && KEY_RE.test(text) && questions.length) { keyStart = i; it.kind = 'key'; q = null; return }
    const pm = PART_RE.exec(text)
    if (pm && text.trim().length <= 160) {
      part = ROMAN[pm[1].toUpperCase()] || Number(pm[1]) || part + 1
      Object.assign(it, { kind: 'part', part, span: span(text, text.indexOf(pm[0].trim()), pm[0].trim().length) })
      parts.push({ p: i, part })
      q = null; inSol = false
      return
    }
    const qm = Q_RE.exec(text)
    if (qm) {
      const off = qm[1].length
      const label = qm[2]
      q = { p: i, n: Number(qm[3]), part, label, options: [], subs: [], sol: [], paras: [i], span: span(text, off, label.length), inline: false }
      Object.assign(it, { kind: 'q', q })
      questions.push(q)
      inSol = false
      return
    }
    if (!q) return
    q.paras.push(i)
    if (inSol || (it.kind !== 'empty' && SOL_RE.test(text))) {
      inSol = true
      if (it.kind !== 'empty') { it.kind = 'sol'; q.sol.push(i) } else q.sol.push(i)
      return
    }
    const up = inlineTokens(text, UP_TOKEN)
    const lo = inlineTokens(text, LO_TOKEN)
    if (up.length && OPT_RE.test(text)) {
      Object.assign(it, { kind: 'opt', tokens: up })
      q.options.push({ p: i, tokens: up })
    } else if (lo.length && SUB_RE.test(text)) {
      Object.assign(it, { kind: 'sub', tokens: lo })
      q.subs.push({ p: i, tokens: lo })
    }
  })
  // Đoạn đã vào vùng lời giải của câu thì các đoạn trống cũng thuộc lời giải; phần key đã gán ở trên.
  return { items, questions, parts, keyStart }
}

const letter = (i, lower) => String.fromCharCode((lower ? 97 : 65) + i)

/** Đánh số lại Câu 1, 2, 3… và A.B.C.D / a) b) c) d). Chỉ sửa khi khác, giữ nguyên định dạng còn lại. */
export function planRenumber(paras, { start = 1, opts = true, restart = false } = {}) {
  const ex = parseExam(paras)
  const ops = []
  let n = start - 1
  let lastPart = 0
  for (const q of ex.questions) {
    if (restart && q.part !== lastPart) { n = start - 1; lastPart = q.part }
    n++
    const text = paras[q.p]
    const want = q.label.replace(/\d+$/, String(n))
    if (want !== q.label) ops.push({ t: 'label', p: q.p, off: q.span.off, from: q.label, to: want, occ: q.span.occ, occTo: occOf(text, want, q.span.off) })
    if (!opts) continue
    // phương án của câu: các nhãn nối tiếp nhau qua mọi đoạn option; mỗi nhóm sắp lại từ A (hoặc a)
    for (const [group, lower] of [[q.options, false], [q.subs, true]]) {
      let k = 0
      for (const g of group) {
        const t = paras[g.p]
        // nhãn nối tiếp ngay đầu mỗi đoạn: nếu đoạn có nhiều nhãn thì áp tuần tự
        const sorted = [...g.tokens].sort((a, b) => b.off - a.off) // sửa từ cuối lên để vị trí không lệch
        const base = k
        k += g.tokens.length
        sorted.forEach((tok, idx) => {
          const order = base + (g.tokens.length - 1 - idx)
          const want2 = letter(order, lower) + tok.label.slice(1)
          if (order < 4 && want2 !== tok.label) {
            ops.push({ t: 'label', p: g.p, off: tok.off, from: tok.label, to: want2, occ: occOf(t, tok.label, tok.off), occTo: occOf(t, want2, tok.off) })
          }
        })
      }
    }
  }
  return ops
}

/** Đáp án: "1A 2B 3C", "1-A, 2-B", hoặc chuỗi chữ cái "ABCDA…". Trả về { byNumber: {n: 'A'}, seq: ['A',…] }. */
export function parseKey(text) {
  const t = String(text || '').toUpperCase().replace(/Đ/g, 'Đ')
  const byNumber = {}
  for (const m of t.matchAll(/(?:CÂU\s*)?(\d+)\s*[-:.)=]?\s*([A-D])(?![A-ZÀ-Ỹ])/g)) byNumber[Number(m[1])] = m[2]
  if (Object.keys(byNumber).length) return { byNumber, seq: [] }
  const seq = (t.match(/[A-D]/g) || [])
  return { byNumber: {}, seq }
}

/** Gộp đáp án từ engine (mảng theo thứ tự câu của từng phần) hoặc từ khóa gõ tay thành {mc, tf, sa} theo câu trong tài liệu. */
export function resolveAnswers(ex, { engine, key } = {}) {
  const mcQs = ex.questions.filter(q => q.options.length)
  const tfQs = ex.questions.filter(q => q.subs.length)
  const mc = mcQs.map((q, i) => {
    if (key) { const k = parseKey(key); if (k.byNumber[q.n]) return k.byNumber[q.n]; if (k.seq[i] && !Object.keys(k.byNumber).length) return k.seq[i] }
    const e = engine && engine.mc && engine.mc[i]
    return e ? String(e).trim().toUpperCase().slice(0, 1) : ''
  })
  const tf = tfQs.map((q, i) => String((engine && engine.tf && engine.tf[i]) || '').replace(/[^ĐđDdSsTtFf]/g, '')
    .replace(/[DdTt]/g, 'Đ').replace(/[đ]/g, 'Đ').replace(/[sF]/gi, 'S'))
  const saQs = ex.questions.filter(q => q.part === 3 || (!q.options.length && !q.subs.length && q.part !== 1 && q.part !== 2))
  const sa = saQs.map((q, i) => String((engine && engine.sa && engine.sa[i]) || '').trim())
  return { mcQs, tfQs, saQs, mc, tf, sa }
}

/** Tô / in đậm / gạch chân đáp án đúng (bật), hoặc trả về mặc định (tắt). */
export function planMark(ex, ans, style, on = true) {
  const props = on
    ? { ...(style.bold ? { bold: true } : {}), ...(style.color ? { color: style.color } : {}), ...(style.underline ? { underline: true } : {}) }
    : { bold: false, color: 'auto', underline: false }
  const ops = []
  ans.mcQs.forEach((q, i) => {
    const want = ans.mc[i]
    if (!want) return
    const tokOf = q.options.flatMap(o => o.tokens.map(t => ({ ...t, p: o.p, multi: o.tokens.length > 1 }))).find((t, idx) => letter(idx, false) === want)
    if (!tokOf) return
    if (!on) { // bỏ tô: gỡ trên mọi phương án của câu
      for (const o of q.options) ops.push({ t: 'fmt', p: o.p, props })
      return
    }
    if (tokOf.multi) {
      const text = ex.items[tokOf.p].text
      ops.push({ t: 'fmt', p: tokOf.p, span: span(text, tokOf.off, tokOf.label.length), props })
    } else ops.push({ t: 'fmt', p: tokOf.p, props })
  })
  ans.tfQs.forEach((q, i) => {
    const marks = ans.tf[i]
    if (!marks) return
    const subs = q.subs.flatMap(o => o.tokens.map(t => ({ ...t, p: o.p, multi: o.tokens.length > 1 })))
    subs.slice(0, 4).forEach((s, k) => {
      if (marks[k] !== 'Đ' && on) return
      if (s.multi) {
        const text = ex.items[s.p].text
        ops.push({ t: 'fmt', p: s.p, span: span(text, s.off, s.label.length), props })
      } else ops.push({ t: 'fmt', p: s.p, props })
    })
  })
  return ops
}

/** Ẩn / hiện lời giải và bảng đáp án cuối đề (chữ ẩn của Word, không xóa nội dung). */
export function planHide(ex, hide, { solutions = true, key = true } = {}) {
  const ops = []
  ex.items.forEach((it, i) => {
    if ((solutions && it.kind === 'sol') || (key && it.kind === 'key') || (solutions && it.kind === 'empty' && ex.questions.some(q => q.sol.includes(i)))) {
      ops.push({ t: 'fmt', p: i, props: { hidden: hide } })
    }
  })
  return ops
}

export function countByPart(ex) {
  const c = { 1: 0, 2: 0, 3: 0 }
  for (const q of ex.questions) c[q.part >= 1 && q.part <= 3 ? q.part : (q.options.length ? 1 : q.subs.length ? 2 : 3)]++
  return c
}
