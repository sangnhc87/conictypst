// Thẻ "Công cụ soạn" trong app Mac: dựng AppleScript từ danh sách thao tác (cùng định dạng với src/tools/plans.js).
// Đọc đoạn văn đi từng đoạn bằng vùng co lại (nhanh: ~5 ms/đoạn; truy cập "paragraph i" trực tiếp chậm hơn 20 lần).
// Vị trí là số ký tự tuyệt đối của Word. Thứ tự áp: định dạng → đổi nhãn → chèn (mỗi nhóm từ cuối lên đầu để vị trí không lệch);
// thao tác ngược theo thứ tự: gỡ khối chèn → đổi nhãn ngược → khôi phục định dạng, nên mỗi bước đều dùng tọa độ còn đúng.

const q = s => `"${String(s).replace(/\\/g, '\\\\').replace(/"/g, '\\"').replace(/\n/g, '" & linefeed & "')}"`
const num = n => String(Math.round(Number(n) * 1000) / 1000)

export function readScript(scope) {
  return `
on stripEnd(c)
  repeat while (length of c) > 0
    set k to id of (last character of c)
    if k is 13 or k is 7 then
      if (length of c) is 1 then
        set c to ""
      else
        set c to text 1 thru -2 of c
      end if
    else
      exit repeat
    end if
  end repeat
  return c
end stripEnd

tell application "Microsoft Word"
  if (count of documents) is 0 then error "Chưa mở tài liệu nào trong Word."
  set d to active document
  ${scope === 'sel'
    ? `set a to start of content of selection
  set z to end of content of selection
  if z is a then return "EMPTY"`
    : `set a to 0
  set z to end of content of text object of d`}
  set pos to a
  set out to ""
  repeat while pos < z
    set r to create range d start pos end pos
    set pr to text object of paragraph 1 of r
    set s to start of content of pr
    set e to end of content of pr
    set c to content of pr
    if e is less than or equal to pos then set e to pos + 1
    set out to out & s & tab & e & tab & (my stripEnd(c)) & linefeed
    set pos to e
  end repeat
  return out
end tell`
}

/** stdout của readScript → { paras, layout: { starts, ends } } */
export function parseRead(stdout) {
  const text = String(stdout).replace(/\r\n?/g, '\n')
  if (text.trim() === 'EMPTY') return { paras: [], layout: { starts: [], ends: [] } }
  const paras = [], starts = [], ends = []
  for (const line of text.split('\n')) {
    if (!line) continue
    const i1 = line.indexOf('\t'), i2 = line.indexOf('\t', i1 + 1)
    if (i1 < 0 || i2 < 0) continue
    starts.push(Number(line.slice(0, i1))); ends.push(Number(line.slice(i1 + 1, i2))); paras.push(line.slice(i2 + 1))
  }
  return { paras, layout: { starts, ends } }
}

// ---------- định dạng ----------
const rgb = hex => {
  const m = /^#?([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2})$/i.exec(hex)
  return m ? [1, 2, 3].map(i => parseInt(m[i], 16) * 257) : [0, 0, 0]
}
const ALIGN = { left: 'align paragraph left', center: 'align paragraph center', right: 'align paragraph right', justify: 'align paragraph justify' }
const RULE = { single: 'line space single', multiple: 'line space multiple', exactly: 'line space exactly', atleast: 'line space at least', double: 'line space double', '1.5': 'line space1 pt5' }
const FO = 'font object of rg', PF = 'paragraph format of rg'

// get: biểu thức AppleScript trả chuỗi; set: câu lệnh; parse: chuỗi → giá trị JS (undefined = bỏ qua, không khôi phục)
const bool = s => (s === 'true' ? true : s === 'false' ? false : undefined)
const real = s => { const n = Number(String(s).replace(',', '.')); return Number.isFinite(n) ? n : undefined }
export const FMT = {
  font: { get: `name of ${FO}`, set: v => `set name of ${FO} to ${q(v)}`, parse: s => s || undefined },
  size: { get: `font size of ${FO}`, set: v => `set font size of ${FO} to ${num(v)}`, parse: real },
  bold: { get: `bold of ${FO}`, set: v => `set bold of ${FO} to ${v}`, parse: bool },
  italic: { get: `italic of ${FO}`, set: v => `set italic of ${FO} to ${v}`, parse: bool },
  hidden: { get: `hidden of ${FO}`, set: v => `set hidden of ${FO} to ${v}`, parse: bool },
  underline: { get: `my ulText(underline of ${FO})`, set: v => `set underline of ${FO} to ${v ? 'underline single' : 'underline none'}`, parse: s => (s === '1' ? true : s === '0' ? false : undefined) },
  color: { get: `my rgbText(color of ${FO})`, set: v => `set color of ${FO} to {${(v === 'auto' ? [0, 0, 0] : rgb(v)).join(', ')}}`,
    parse: s => { const m = /^(\d+),(\d+),(\d+)$/.exec(s); return m ? '#' + [1, 2, 3].map(i => Math.round(m[i] / 257).toString(16).padStart(2, '0')).join('') : undefined } },
  align: { get: `my alText(alignment of ${PF})`, set: v => `set alignment of ${PF} to ${ALIGN[v] || ALIGN.left}`, parse: s => (ALIGN[s] ? s : undefined) },
  lsRule: { get: `my ruleText(line spacing rule of ${PF})`, set: v => `set line spacing rule of ${PF} to ${RULE[v] || RULE.single}`, parse: s => (RULE[s] ? s : undefined) },
  lineSpacing: { get: `line spacing of ${PF}`, set: v => `set line spacing rule of ${PF} to line space multiple\n    set line spacing of ${PF} to ${num(v)}`, parse: real },
  spaceBefore: { get: `space before of ${PF}`, set: v => `set space before of ${PF} to ${num(v)}`, parse: real },
  spaceAfter: { get: `space after of ${PF}`, set: v => `set space after of ${PF} to ${num(v)}`, parse: real },
}
// lineSpacing khi khôi phục phải đặt quy tắc trước giá trị; khi đọc thì đọc cả quy tắc để trả lại đúng "Đơn / Nhiều dòng / Chính xác"
const readKeys = props => {
  const keys = Object.keys(props).filter(k => FMT[k])
  if (keys.includes('lineSpacing') && !keys.includes('lsRule')) keys.push('lsRule')
  return keys
}

const HANDLERS = `
on ulText(x)
  tell application "Microsoft Word"
    try
      if x is underline none then return "0"
      return "1"
    on error
      return ""
    end try
  end tell
end ulText
on rgbText(c)
  try
    return ((item 1 of c) as string) & "," & ((item 2 of c) as string) & "," & ((item 3 of c) as string)
  on error
    return ""
  end try
end rgbText
on alText(x)
  tell application "Microsoft Word"
    try
      if x is align paragraph left then return "left"
      if x is align paragraph center then return "center"
      if x is align paragraph right then return "right"
      if x is align paragraph justify then return "justify"
    end try
  end tell
  return ""
end alText
on ruleText(x)
  tell application "Microsoft Word"
    try
      if x is line space single then return "single"
      if x is line space multiple then return "multiple"
      if x is line space exactly then return "exactly"
      if x is line space at least then return "atleast"
      if x is line space double then return "double"
      if x is line space1 pt5 then return "1.5"
    end try
  end tell
  return ""
end ruleText`

/** Phạm vi ký tự của thao tác định dạng: đoạn nguyên (không tính dấu đoạn) hoặc span trong đoạn. */
function fmtRange(o, layout) {
  if (o.abs) return o.abs
  const s = layout.starts[o.p], e = layout.ends[o.p]
  if (s == null) return null
  if (o.span) return { s: s + o.span.off, e: s + o.span.off + o.span.len }
  return { s, e: Math.max(s, e - 1) }
}

const MAX_INSERT_LINE = '─'.repeat(64)

function insertScript(o, idx, share) {
  const L = []
  const files = []
  L.push(`-- chèn #${idx}`)
  const w = o.where
  if (w === 'end') L.push(`set vp to (end of content of text object of d) - 1`)
  else if (w === 'sel' || w === 'selEnd') {
    L.push(`set vsp to end of content of selection`, `if vsp > (start of content of selection) then set vsp to vsp - 1`,
      `set vp to end of content of text object of paragraph 1 of (create range d start vsp end vsp)`)
  } else L.push(`set vp to ${w.abs}`)
  L.push(`set vp0 to vp`)
  // cuối tài liệu: chèn trước dấu đoạn cuối, nên mở đầu bằng một dấu đoạn mới để khối đứng riêng
  if (w === 'end') L.push(`set content of (create range d start vp end vp) to return`, `set vp to vp + 1`)
  o.blocks.forEach((b, bi) => {
    // cuối tài liệu: khối cuối dùng chính dấu đoạn cuối của Word nên không thêm dấu đoạn riêng (gỡ lại mới sạch)
    const tail = w === 'end' && bi === o.blocks.length - 1 ? '' : ' & return'
    const tailN = tail ? 1 : 0
    if (b.type === 'table') {
      const cols = Math.max(...b.rows.map(r => r.length))
      L.push(`set vtb to make new table at d with properties {text object:(create range d start vp end vp), number of rows:${b.rows.length}, number of columns:${cols}}`)
      b.rows.forEach((row, r) => row.forEach((cell, c) => { if (String(cell) !== '') L.push(`set content of text object of cell ${c + 1} of row ${r + 1} of vtb to ${q(cell)}`) }))
      L.push(`set outside line style of border options of vtb to line style single`, `set inside line style of border options of vtb to line style single`)
      if (b.header !== false) L.push(`set bold of font object of text object of row 1 of vtb to true`)
      if (b.center) L.push(`set alignment of paragraph format of text object of vtb to align paragraph center`)
      L.push(`set vp to end of content of text object of vtb`)
    } else if (b.type === 'image') {
      const file = `${share}/q${Date.now().toString(36)}_${idx}_${files.length}.${b.ext || 'gif'}`
      files.push({ file, b64: b.b64 })
      L.push(`set vrg to create range d start vp end vp`, `make new inline picture at vrg with properties {file name:${q(file)}}`,
        `set vrg to create range d start vp end (vp + 1)`, `set width of inline shape 1 of vrg to ${num(b.widthPt)}`, `set height of inline shape 1 of vrg to ${num(b.heightPt)}`,
        ...(b.alt ? [`set alternative text of inline shape 1 of vrg to ${q(b.alt)}`] : []),
        ...(tail ? [`set content of (create range d start (vp + 1) end (vp + 1)) to return`] : []), `set vp to vp + ${1 + tailN}`)
    } else {
      const text = b.type === 'rule' ? MAX_INSERT_LINE : String(b.text)
      L.push(`set va0 to vp`, `set content of (create range d start vp end vp) to ${q(text)}${tail}`, `set vp to vp + ${text.length + tailN}`)
      L.push(`set rg to create range d start va0 end vp`)
      const props = b.type === 'rule' ? { bold: false, italic: false, hidden: false, size: 6, color: '#888888', align: 'center' }
        : { bold: !!b.bold, italic: !!b.italic, hidden: false, color: b.color || '#000000', align: b.align || 'left' }
      for (const [k, v] of Object.entries(props)) L.push(FMT[k].set(v))
      if (b.type !== 'rule') L.push(FMT.spaceAfter.set(3))
      if (b.boldPrefix) L.push(`set bold of font object of (create range d start va0 end (va0 + ${b.boldPrefix})) to true`)
    }
  })
  L.push(`set out to out & "I|${idx}|" & vp0 & "|" & vp & "|" & (length of ((content of (create range d start vp0 end vp)) as string)) & linefeed`)
  return { code: L.join('\n    '), files }
}

/**
 * Dựng kịch bản áp thao tác. layout: { starts, ends } của lần đọc trước. share: thư mục Word đọc được.
 * Trả về { script, files: [{file, b64}], plan } — plan dùng để dựng thao tác ngược từ kết quả (finish).
 */
export function buildApply(ops, layout, share) {
  const fmts = [], labels = [], inserts = [], removes = []
  ops.forEach((o, idx) => {
    if (o.t === 'fmt') { const r = fmtRange(o, layout); if (r) fmts.push({ o, r, idx }) }
    else if (o.t === 'label') {
      const abs = o.abs ?? (layout.starts[o.p] != null ? layout.starts[o.p] + o.off : null)
      if (abs != null) labels.push({ o, abs, idx })
    } else if (o.t === 'insert') {
      const w = o.where
      const where = w && w.after != null ? { abs: layout.ends[w.after] } : w
      inserts.push({ o: { ...o, where }, pos: typeof where === 'object' ? where.abs : null, idx })
    } else if (o.t === 'remove') removes.push({ o, idx })
  })
  if (labels.length && inserts.length) throw new Error('Không kết hợp đổi nhãn và chèn trong một lần.')
  const files = []
  const seg = { fmt: [], label: [], ins: [], rem: [] }
  // định dạng: từ cuối lên đầu
  for (const f of [...fmts].sort((a, b) => b.r.s - a.r.s)) {
    seg.fmt.push(`-- định dạng #${f.idx}`, `set rg to create range d start ${f.r.s} end ${f.r.e}`)
    for (const k of readKeys(f.o.props)) seg.fmt.push(`set out to out & "F|${f.idx}|${k}|" & (${FMT[k].get} as string) & linefeed`)
    for (const [k, v] of Object.entries(f.o.props)) if (FMT[k]) seg.fmt.push(FMT[k].set(v))
  }
  // đổi nhãn: từ cuối lên đầu
  for (const l of [...labels].sort((a, b) => b.abs - a.abs)) {
    seg.label.push(`-- nhãn #${l.idx}`, `set rg to create range d start ${l.abs} end ${l.abs + l.o.from.length}`,
      `if (content of rg) is ${q(l.o.from)} then`, `  set content of rg to ${q(l.o.to)}`, `  set out to out & "L|${l.idx}|ok" & linefeed`, `else`, `  set out to out & "L|${l.idx}|skip" & linefeed`, `end if`)
  }
  // chèn: từ cuối lên đầu (vị trí 'end' / 'sel' tính lúc chạy nên đứng đầu hàng)
  for (const ins of [...inserts].sort((a, b) => (b.pos ?? Infinity) - (a.pos ?? Infinity))) {
    const s = insertScript(ins.o, ins.idx, share)
    seg.ins.push(s.code); files.push(...s.files)
  }
  // gỡ khối đã chèn (thao tác ngược): chỉ xóa khi độ dài nội dung còn khớp
  for (const r of [...removes].sort((a, b) => b.o.start - a.o.start)) {
    seg.rem.push(`-- gỡ #${r.idx}`, `set rg to create range d start ${r.o.start} end ${r.o.end}`,
      `if (length of ((content of rg) as string)) is ${r.o.clen} then`, `  set vde to end of content of text object of d`, `  delete rg`,
      // Word đôi khi giữ lại một dấu đoạn khi xóa khối kết thúc bằng ảnh: xóa nốt phần còn thiếu
      `  set vsh to ${r.o.end - r.o.start} - (vde - (end of content of text object of d))`, `  if vsh > 0 then delete (create range d start ${r.o.start} end (${r.o.start} + vsh))`, `  set out to out & "R|${r.idx}|ok" & linefeed`, `else`, `  set out to out & "R|${r.idx}|skip" & linefeed`, `end if`)
  }
  // thao tác xuôi: định dạng → nhãn → chèn; thao tác ngược: gỡ → nhãn → định dạng (mỗi bước dùng tọa độ còn đúng)
  const inverseMode = removes.length > 0 || labels.some(l => l.o.post)
  const body = (inverseMode ? [seg.rem, seg.label, seg.fmt] : [seg.fmt, seg.label, seg.ins]).flat()
  const script = `${HANDLERS}\n\ntell application "Microsoft Word"\n  if (count of documents) is 0 then error "Chưa mở tài liệu nào trong Word."\n  set d to active document\n  set out to ""\n    ${body.join('\n    ')}\n  return out\nend tell`
  return { script, files, plan: { fmts, labels, inserts, removes } }
}

/** Từ kết quả chạy → thao tác ngược theo đúng thứ tự giai đoạn. */
export function finishApply(stdout, plan) {
  const lines = String(stdout).replace(/\r\n?/g, '\n').split('\n').filter(Boolean)
  const prior = new Map()
  const done = new Set()
  const ins = new Map()
  let missing = 0
  for (const line of lines) {
    const [kind, idx, a, b, c] = line.split('|')
    if (kind === 'F') { const key = Number(idx); if (!prior.has(key)) prior.set(key, {}); prior.get(key)[a] = line.split('|').slice(3).join('|') }
    else if (kind === 'L' || kind === 'R') { if (a === 'ok') done.add(`${kind}${idx}`); else missing++ }
    else if (kind === 'I') ins.set(Number(idx), { start: Number(a), end: Number(b), clen: Number(c) })
  }
  const inverse = []
  // 1) gỡ các khối vừa chèn: tọa độ cuối = vị trí gốc + độ dài các khối chèn ở vị trí nhỏ hơn
  const insList = plan.inserts.filter(i => ins.has(i.idx)).map(i => ({ ...i, len: ins.get(i.idx).end - ins.get(i.idx).start, start0: ins.get(i.idx).start, clen: ins.get(i.idx).clen }))
  for (const i of insList) {
    const before = insList.filter(j => j !== i && j.start0 < i.start0).reduce((n, j) => n + j.len, 0)
    inverse.push({ t: 'remove', start: i.start0 + before, end: i.start0 + before + i.len, clen: i.clen })
  }
  // 2) nhãn: tọa độ sau khi đổi = vị trí gốc + chênh lệch độ dài của các nhãn đứng trước
  const lab = plan.labels.filter(l => done.has(`L${l.idx}`)).sort((a, b) => a.abs - b.abs)
  let delta = 0
  for (const l of lab) {
    inverse.push({ t: 'label', post: true, abs: l.abs + delta, from: l.o.to, to: l.o.from })
    delta += l.o.to.length - l.o.from.length
  }
  // 3) định dạng: khôi phục giá trị cũ ở tọa độ gốc
  for (const f of plan.fmts) {
    const raw = prior.get(f.idx) || {}
    const props = {}
    for (const [k, s] of Object.entries(raw)) { const v = FMT[k].parse(s); if (v !== undefined) props[k] = v }
    // lsRule đi trước lineSpacing để quy tắc được đặt đúng
    if (props.lsRule && props.lineSpacing != null && props.lsRule !== 'multiple') { /* giữ cả hai */ }
    if (Object.keys(props).length) inverse.push({ t: 'fmt', abs: f.r, props, restore: true })
  }
  return { inverse, missing }
}
