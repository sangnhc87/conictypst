// Làm đẹp tài liệu bất kỳ (không phải đề thi) bằng Office.js: đổi đánh số tự động thành chữ, đánh số lại mục gõ tay,
// chuẩn hóa dấu cách/tab/dấu câu/đoạn trống và định dạng đoạn. Phần phân tích thuần (testable) tách khỏi phần gọi Word.

const WORDS = ['Câu', 'Bài tập', 'Bài', 'Ví dụ', 'Mục', 'Chương', 'Phần', 'Dạng', 'Chuyên đề']
const KW = new RegExp(`^(\\s*)(${WORDS.join('|')})(\\s+)(\\d+)(\\s*[.:)])?`)
const NUM = /^(\s*)(\d+)([.)])(?=\s)/
const ALPHA = /^(\s*)\(?([a-z])\)(?=\s)/
const ROMAN = /^(\s*)([IVX]{1,5})\.(?=\s)/

const romanToInt = s => { const v = { I: 1, V: 5, X: 10 }; let t = 0; for (let i = 0; i < s.length; i++) { const a = v[s[i]], b = v[s[i + 1]] || 0; t += a < b ? -a : a } return t }
const intToRoman = n => { const m = [[10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I']]; let r = ''; for (const [v, s] of m) while (n >= v) { r += s; n -= v } return r }

/** Nhận dạng nhãn đánh số ở đầu đoạn. Trả { kind, level, label, num, build(n) } hoặc null. */
export function detectLabel(text) {
  let m = KW.exec(text)
  if (m) {
    const [label, , word, gap, num, punct = ''] = m
    return { kind: `K:${word}`, level: 0, label: label.trimStart(), num: Number(num), build: n => `${word}${gap}${n}${punct}` }
  }
  m = ROMAN.exec(text)
  if (m && romanToInt(m[2]) > 0 && intToRoman(romanToInt(m[2])) === m[2]) return { kind: 'R', level: 0, label: `${m[2]}.`, num: romanToInt(m[2]), build: n => `${intToRoman(n)}.` }
  m = NUM.exec(text)
  if (m) return { kind: 'N', level: 1, label: `${m[2]}${m[3]}`, num: Number(m[2]), build: n => `${n}${m[3]}` }
  m = ALPHA.exec(text)
  if (m) { const open = m[0].trimStart().startsWith('(') ? '(' : ''; return { kind: 'A', level: 2, label: m[0].trimStart(), num: m[2].charCodeAt(0) - 96, build: n => (n >= 1 && n <= 26 ? `${open}${String.fromCharCode(96 + n)})` : null) } }
  return null
}

const isHeadingText = t => { const s = t.trim(); return s.length > 2 && s.length < 80 && s === s.toUpperCase() && /[A-ZÀ-Ỹ]/.test(s) && !/^\d+[.)]/.test(s) }

/**
 * Tìm các nhãn cần đánh số lại. paras = [{ text, heading }]; opts = { resetHeading }.
 * Quy tắc: mục đầu tiên ở mỗi cấp giữ nguyên số đã gõ, các mục sau tăng dần; gặp mục cấp cao hơn thì cấp thấp hơn khởi lại.
 */
export function planRenumber(paras, { resetHeading = true } = {}) {
  const fixes = []
  const state = {} // kind -> số đã dùng gần nhất
  const clearBelow = lvl => { for (const k of Object.keys(state)) if (state[k].level > lvl) delete state[k] }
  paras.forEach((p, i) => {
    if (resetHeading && (p.heading || isHeadingText(p.text)) && !detectLabel(p.text)) { for (const k of Object.keys(state)) delete state[k]; return }
    const d = detectLabel(p.text)
    if (!d) return
    const prev = state[d.kind]
    const want = prev ? prev.n + 1 : d.num
    clearBelow(d.level)
    state[d.kind] = { n: want, level: d.level }
    if (want !== d.num) { const to = d.build(want); if (to) fixes.push({ p: i, from: d.label, to: p.text.startsWith(' ') ? to : to, num: d.num, want }) }
  })
  return fixes
}

/** Ký tự đầu dòng của Word (Symbol font, ô vuông...) → ký hiệu chữ thường. */
export const isBulletString = s => !!s && !/[0-9A-Za-zÀ-ỹ]/.test(s)

const BULLETS = { dot: '•', dash: '–', hyphen: '-', square: '▪' }

// ---------- phần gọi Word ----------
const scopeRange = (ctx, scope) => (scope === 'sel' ? ctx.document.getSelection() : ctx.document.body)
const SKIP_BUILTIN = /^Heading|^Title|^Subtitle|^Toc|^Header|^Footer/

async function loadParas(ctx, scope, extra = '') {
  const paras = scopeRange(ctx, scope).paragraphs
  paras.load(`items/text,items/isListItem,items/styleBuiltIn,items/tableNestingLevel${extra ? ',' + extra : ''}`)
  await ctx.sync()
  return paras.items
}

export const ZERO = { lists: 0, renumber: 0, tabs: 0, spaces: 0, punct: 0, empties: 0, format: 0 }

/**
 * opts = { lists, bullet, renumber, resetHeading, tabs, spaces, punct, empties, format: {font,size,line,align,after,indent} | null, skipTables }
 * dry = true: chỉ đếm số chỗ sẽ sửa.
 */
export async function runDocClean(opts, scope, dry = false, onStep = () => {}) {
  const rep = { ...ZERO }
  return Word.run(async ctx => {
    // 1) đánh số / gạch đầu dòng tự động → chữ
    if (opts.lists) {
      onStep('Đổi đánh số tự động thành chữ')
      const items = await loadParas(ctx, scope)
      const lst = items.map(p => (p.isListItem ? p.listItemOrNullObject : null))
      lst.forEach(l => l && l.load('listString,level,isNullObject'))
      await ctx.sync()
      for (let i = 0; i < items.length; i++) {
        const l = lst[i]
        if (!l || l.isNullObject) continue
        rep.lists++
        if (dry) continue
        let s = l.listString || ''
        if (isBulletString(s)) s = BULLETS[opts.bullet] || '•'
        items[i].insertText(`${s}\t`, 'Start')
        items[i].detachFromList()
      }
      if (!dry) await ctx.sync()
    }

    // 2) đánh số lại mục gõ tay
    if (opts.renumber) {
      onStep('Đánh số lại các mục')
      const items = await loadParas(ctx, scope)
      const fixes = planRenumber(items.map(p => ({ text: p.text, heading: SKIP_BUILTIN.test(p.styleBuiltIn || '') })), { resetHeading: opts.resetHeading !== false })
      rep.renumber = fixes.length
      if (!dry && fixes.length) {
        const found = fixes.map(f => { const r = items[f.p].search(f.from, { matchCase: true }); r.load('items'); return { f, r } })
        await ctx.sync()
        for (const { f, r } of found) if (r.items[0]) r.items[0].insertText(f.to, 'Replace')
        await ctx.sync()
      }
    }

    // 3) dấu cách / tab / dấu câu
    const rng = scopeRange(ctx, scope)
    const wild = async (pattern, label, replaceWith) => {
      const r = rng.search(pattern, { matchWildcards: true })
      r.load('items/text')
      await ctx.sync()
      rep[label] += r.items.length
      if (!dry) { for (const x of r.items) x.insertText(typeof replaceWith === 'function' ? replaceWith(x.text) : replaceWith, 'Replace'); await ctx.sync() }
    }
    if (opts.tabs) { onStep('Đổi dấu cách dài thành tab'); await wild(' {3,}', 'tabs', '\t') }
    if (opts.spaces) { onStep('Gộp dấu cách thừa'); await wild(' {2,}', 'spaces', ' ') }
    if (opts.punct) { onStep('Dọn dấu cách trước dấu câu'); await wild(' {1,}[,.;:!?\\)]', 'punct', t => t.trim()) }

    // 4) đoạn trống liên tiếp
    if (opts.empties) {
      onStep('Xóa đoạn trống thừa')
      const items = await loadParas(ctx, scope)
      const emp = items.map(p => (p.text.trim() === '' && p.tableNestingLevel === 0 ? p.inlinePictures : null))
      emp.forEach(c => c && c.load('items'))
      await ctx.sync()
      let prevEmpty = false
      const del = []
      items.forEach((p, i) => {
        const isEmpty = !!emp[i] && emp[i].items.length === 0
        if (isEmpty && prevEmpty) del.push(p)
        prevEmpty = isEmpty
      })
      rep.empties = del.length
      if (!dry) { for (const p of del) p.delete(); await ctx.sync() }
    }

    // 5) định dạng đồng nhất cho đoạn thường
    const f = opts.format
    if (f && (f.font || f.size || f.line || f.align || f.after != null || f.indent != null)) {
      onStep('Định dạng đồng nhất')
      const items = await loadParas(ctx, scope)
      for (const p of items) {
        if (SKIP_BUILTIN.test(p.styleBuiltIn || '')) continue
        if (opts.skipTables && p.tableNestingLevel > 0) continue
        if (p.text.trim() === '') continue
        rep.format++
        if (dry) continue
        if (f.font) p.font.name = f.font
        if (f.size) p.font.size = f.size
        if (f.line) p.lineSpacing = Math.round(f.line * 12 * 100) / 100
        if (f.align) p.alignment = { justify: 'Justified', left: 'Left', center: 'Centered', right: 'Right' }[f.align] || 'Left'
        if (f.after != null) p.spaceAfter = f.after
        if (f.indent != null) p.firstLineIndent = f.indent
      }
      if (!dry) await ctx.sync()
    }
    return rep
  })
}
