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

/**
 * Sửa lỗi dính chữ sau dấu câu: dấu phẩy, chấm phẩy, hai chấm, hỏi, than, chấm theo sau là chữ cái.
 * Giữ nguyên số thập phân (1,5 hoặc 3.14).
 */
const PUNCT_GAP_RE = /([,;:])([A-Za-zÀ-ỹ])|([?!])([A-Za-zÀ-ỹ])|([a-zà-ỹA-ZÀ-Ỹ0-9)\]]\.)([A-ZÀ-Ỹa-zà-ỹ])/g
export function planPunctGaps(paras) {
  const fixes = []
  paras.forEach((p, i) => {
    let m
    const re = new RegExp(PUNCT_GAP_RE.source, 'g')
    while ((m = re.exec(p.text)) !== null) {
      let from, to
      if (m[1]) { from = m[0]; to = `${m[1]} ${m[2]}` }
      else if (m[3]) { from = m[0]; to = `${m[3]} ${m[4]}` }
      else if (m[5]) { from = m[0]; to = `${m[5].slice(0, -1)}. ${m[6]}` }
      if (from && to && from !== to) fixes.push({ p: i, from, to })
    }
  })
  return fixes
}

/**
 * Dọn khoảng trắng thừa trong ngoặc đơn (), vuông [], nhọn {}.
 * Ví dụ: "( phương trình )" -> "(phương trình)"
 */
const BRACKET_OPEN_RE = /([(\[{])\s+([^\s)\]}])/g
const BRACKET_CLOSE_RE = /([^\s(\[{])\s+([)\]}])/g
export function planBracketSpaces(paras) {
  const fixes = []
  paras.forEach((p, i) => {
    let m
    const reOpen = new RegExp(BRACKET_OPEN_RE.source, 'g')
    while ((m = reOpen.exec(p.text)) !== null) {
      fixes.push({ p: i, from: m[0], to: `${m[1]}${m[2]}` })
    }
    const reClose = new RegExp(BRACKET_CLOSE_RE.source, 'g')
    while ((m = reClose.exec(p.text)) !== null) {
      fixes.push({ p: i, from: m[0], to: `${m[1]}${m[2]}` })
    }
  })
  return fixes
}

/**
 * Tự động viết hoa chữ cái đầu câu sau dấu kết câu (., ?, !)
 */
const CAP_FIRST_RE = /([.!?]\s+)([a-zà-ỹ])/g
export function planCapFirst(paras) {
  const fixes = []
  paras.forEach((p, i) => {
    let m
    const re = new RegExp(CAP_FIRST_RE.source, 'g')
    while ((m = re.exec(p.text)) !== null) {
      fixes.push({ p: i, from: m[0], to: `${m[1]}${m[2].toUpperCase()}` })
    }
  })
  return fixes
}

/**
 * Tìm các nhãn phương án trắc nghiệm A. B. C. D. hoặc a) b) c) d) để in đậm.
 */
const OPT_BOLD_RE = /(?:^|[\s\t])([A-D]\.|\([A-D]\)|[a-d]\))(?=\s|$)/g
export function planBoldOptions(paras) {
  const targets = []
  paras.forEach((p, i) => {
    let m
    const re = new RegExp(OPT_BOLD_RE.source, 'g')
    while ((m = re.exec(p.text)) !== null) {
      targets.push({ p: i, label: m[1] })
    }
  })
  return targets
}

/**
 * Canh thẳng hàng các phương án bằng dấu Tab khi phân cách bằng nhiều dấu cách.
 */
const OPT_ALIGN_RE = /\s{2,}([B-D]\.|\([B-D]\)|[b-d]\))(?=\s)/g
export function planAlignOptions(paras) {
  const fixes = []
  paras.forEach((p, i) => {
    let m
    const re = new RegExp(OPT_ALIGN_RE.source, 'g')
    while ((m = re.exec(p.text)) !== null) {
      fixes.push({ p: i, from: m[0], to: `\t${m[1]}` })
    }
  })
  return fixes
}

/**
 * Chống mồ côi: Tìm các đoạn là câu hỏi, bài tập, ví dụ, tiêu đề để gán keepWithNext = true.
 */
export function planKeepWithNext(paras) {
  const indices = []
  paras.forEach((p, i) => {
    if (p.heading || isHeadingText(p.text) || detectLabel(p.text)) {
      indices.push(i)
    }
  })
  return indices
}

/**
 * Bảng mã chuyển đổi TCVN3 (.VnTime, .VnTimeH...) sang Unicode chuẩn.
 */
export const TCVN3_MAP = {
  184: 'á', 181: 'à', 182: 'ả', 183: 'ã', 185: 'ạ',
  168: 'ă', 190: 'ắ', 187: 'ằ', 188: 'ẳ', 189: 'ẵ', 198: 'ặ',
  169: 'â', 202: 'ấ', 199: 'ầ', 200: 'ẩ', 201: 'ẫ', 203: 'ậ',
  208: 'é', 204: 'è', 206: 'ẻ', 207: 'ẽ', 209: 'ẹ',
  170: 'ê', 213: 'ế', 210: 'ề', 211: 'ể', 212: 'ễ', 214: 'ệ',
  221: 'í', 215: 'ì', 216: 'ỉ', 220: 'ĩ', 222: 'ị',
  227: 'ó', 223: 'ò', 225: 'ỏ', 226: 'õ', 228: 'ọ',
  171: 'ô', 233: 'ố', 229: 'ồ', 231: 'ổ', 232: 'ỗ', 234: 'ộ',
  172: 'ơ', 238: 'ớ', 235: 'ờ', 236: 'ở', 237: 'ỡ', 239: 'ợ',
  243: 'ú', 240: 'ù', 241: 'ủ', 242: 'ũ', 244: 'ụ',
  173: 'ư', 248: 'ứ', 245: 'ừ', 246: 'ử', 247: 'ữ', 249: 'ự',
  253: 'ý', 250: 'ỳ', 251: 'ỷ', 252: 'ỹ', 254: 'ỵ',
  174: 'đ',
  161: 'Ă', 162: 'Â', 163: 'Đ', 164: 'Ê', 165: 'Ô', 166: 'Ơ', 167: 'Ư'
}

export function hasTcvn3(str) {
  if (!str) return false
  for (let i = 0; i < str.length; i++) {
    if (TCVN3_MAP[str.charCodeAt(i)]) return true
  }
  return false
}

export function tcvn3ToUnicode(str) {
  if (!str) return ''
  let out = ''
  for (let i = 0; i < str.length; i++) {
    const c = str.charCodeAt(i)
    out += TCVN3_MAP[c] || str[i]
  }
  return out
}

export function planTcvn3(paras) {
  const fixes = []
  paras.forEach((p, i) => {
    if (hasTcvn3(p.text)) {
      fixes.push({ p: i, from: p.text, to: tcvn3ToUnicode(p.text) })
    }
  })
  return fixes
}

/**
 * Tách các phương án trắc nghiệm trên cùng một dòng thành các dòng riêng biệt.
 */
const OPT_SPLIT_RE = /(?:[\t]|\s{2,})([B-D]\.|\([B-D]\)|[b-d]\))(?=\s)/g
export function planSplitOptions(paras) {
  const fixes = []
  paras.forEach((p, i) => {
    let m
    const re = new RegExp(OPT_SPLIT_RE.source, 'g')
    while ((m = re.exec(p.text)) !== null) {
      fixes.push({ p: i, from: m[0], to: `\r${m[1]}` })
    }
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

async function applyFixes(ctx, items, fixes) {
  if (!fixes || !fixes.length) return
  const found = fixes.map(f => {
    const r = items[f.p].search(f.from, { matchCase: true })
    r.load('items')
    return { f, r }
  })
  await ctx.sync()
  for (const { f, r } of found) {
    if (r.items && r.items[0]) r.items[0].insertText(f.to, 'Replace')
  }
  await ctx.sync()
}

export const ZERO = {
  lists: 0, renumber: 0, tabs: 0, spaces: 0, punct: 0, punctGap: 0, brackets: 0, capFirst: 0,
  empties: 0, boldOpts: 0, alignOpts: 0, splitOpts: 0, clearMarks: 0,
  keepNext: 0, tables: 0, cantSplit: 0, softBreaks: 0, pageSetup: 0, tcvn3: 0, format: 0
}

/**
 * opts = {
 *   lists, bullet, renumber, resetHeading, tabs, spaces, punct, punctGap, brackets, capFirst,
 *   boldOpts, alignOpts, keepNext, tableCenter, softBreaks, pageSetupA4,
 *   format: {font,size,line,align,after,indent} | null, skipTables
 * }
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
        await applyFixes(ctx, items, fixes)
      }
    }

    // 2b) chuyển mã TCVN3 (.VnTime) sang Unicode
    if (opts.tcvn3) {
      onStep('Chuyển mã .VnTime → Unicode')
      const items = await loadParas(ctx, scope, 'items/font/name')
      for (const p of items) {
        const isVn = (p.font && p.font.name && p.font.name.startsWith('.Vn')) || hasTcvn3(p.text)
        if (isVn) {
          rep.tcvn3++
          if (dry) continue
          p.insertText(tcvn3ToUnicode(p.text), 'Replace')
          p.font.name = 'Times New Roman'
        }
      }
      if (!dry) await ctx.sync()
    }

    // 3) sửa lỗi dính chữ sau dấu câu
    if (opts.punctGap) {
      onStep('Thêm cách sau dấu câu dính chữ')
      const items = await loadParas(ctx, scope)
      const fixes = planPunctGaps(items.map(p => ({ text: p.text })))
      rep.punctGap = fixes.length
      if (!dry && fixes.length) {
        await applyFixes(ctx, items, fixes)
      }
    }

    // 4) dọn khoảng trắng trong ngoặc
    if (opts.brackets) {
      onStep('Dọn khoảng trắng trong ngoặc')
      const items = await loadParas(ctx, scope)
      const fixes = planBracketSpaces(items.map(p => ({ text: p.text })))
      rep.brackets = fixes.length
      if (!dry && fixes.length) {
        await applyFixes(ctx, items, fixes)
      }
    }

    // 5) viết hoa chữ đầu câu sau dấu chấm
    if (opts.capFirst) {
      onStep('Viết hoa chữ đầu câu')
      const items = await loadParas(ctx, scope)
      const fixes = planCapFirst(items.map(p => ({ text: p.text })))
      rep.capFirst = fixes.length
      if (!dry && fixes.length) {
        await applyFixes(ctx, items, fixes)
      }
    }

    // 6) canh thẳng hàng phương án bằng tab
    if (opts.alignOpts) {
      onStep('Canh tab các phương án')
      const items = await loadParas(ctx, scope)
      const fixes = planAlignOptions(items.map(p => ({ text: p.text })))
      rep.alignOpts = fixes.length
      if (!dry && fixes.length) {
        await applyFixes(ctx, items, fixes)
      }
    }

    // 6b) tách các phương án thành từng dòng riêng
    if (opts.splitOpts) {
      onStep('Tách phương án thành từng dòng')
      const items = await loadParas(ctx, scope)
      const fixes = planSplitOptions(items.map(p => ({ text: p.text })))
      rep.splitOpts = fixes.length
      if (!dry && fixes.length) {
        await applyFixes(ctx, items, fixes)
      }
    }

    // 7) in đậm nhãn phương án A. B. C. D.
    if (opts.boldOpts) {
      onStep('In đậm nhãn phương án')
      const items = await loadParas(ctx, scope)
      const targets = planBoldOptions(items.map(p => ({ text: p.text })))
      rep.boldOpts = targets.length
      if (!dry && targets.length) {
        const searchJobs = targets.map(t => {
          const r = items[t.p].search(t.label, { matchCase: true })
          r.load('items/font')
          return { t, r }
        })
        await ctx.sync()
        for (const { r } of searchJobs) {
          if (r.items && r.items[0]) r.items[0].font.bold = true
        }
        await ctx.sync()
      }
    }

    // 7b) tẩy gạch chân và màu chữ đáp án
    if (opts.clearMarks) {
      onStep('Tẩy gạch chân / màu đáp án')
      const items = await loadParas(ctx, scope)
      const optParas = items.filter(p => OPT_BOLD_RE.test(p.text))
      rep.clearMarks = optParas.length
      if (!dry && optParas.length) {
        for (const p of optParas) {
          try {
            p.font.underline = 'None'
            p.font.color = '#000000'
          } catch {}
        }
        await ctx.sync()
      }
    }

    // 8) dấu cách / tab / dấu câu
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

    // 9) ngắt dòng mềm (Shift+Enter) -> ngắt đoạn
    if (opts.softBreaks) {
      onStep('Đổi ngắt dòng mềm thành đoạn')
      const r = rng.search('^l')
      r.load('items')
      await ctx.sync()
      rep.softBreaks = r.items.length
      if (!dry && rep.softBreaks) {
        for (const x of r.items) {
          try { x.insertText('\r', 'Replace') } catch {}
        }
        await ctx.sync()
      }
    }

    // 10) đoạn trống liên tiếp
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

    // 11) chống mồ côi tiêu đề & câu hỏi
    if (opts.keepNext) {
      onStep('Chống mồ côi tiêu đề & câu hỏi')
      const items = await loadParas(ctx, scope)
      const hits = planKeepWithNext(items.map(p => ({ text: p.text, heading: SKIP_BUILTIN.test(p.styleBuiltIn || '') })))
      rep.keepNext = hits.length
      if (!dry && hits.length) {
        for (const idx of hits) {
          items[idx].keepWithNext = true
        }
        await ctx.sync()
      }
    }

    // 12) căn giữa toàn bộ bảng
    if (opts.tableCenter) {
      onStep('Căn giữa các bảng')
      const tables = scopeRange(ctx, scope).tables
      tables.load('items')
      await ctx.sync()
      rep.tables = tables.items.length
      if (!dry && rep.tables) {
        for (const tbl of tables.items) {
          try { tbl.alignment = 'Center' } catch {}
        }
        await ctx.sync()
      }
    }

    // 12b) chống xẻ đôi hàng bảng và lặp tiêu đề
    if (opts.cantSplit) {
      onStep('Chống xẻ đôi hàng bảng')
      const tables = scopeRange(ctx, scope).tables
      tables.load('items')
      await ctx.sync()
      rep.cantSplit = tables.items.length
      if (!dry && rep.cantSplit) {
        for (const tbl of tables.items) {
          try { tbl.headerRowCount = 1 } catch {}
        }
        await ctx.sync()
      }
    }

    // 13) đặt lề trang chuẩn A4 (Nghị định 30/2020)
    if (opts.pageSetupA4) {
      onStep('Đặt lề trang in chuẩn A4')
      const sections = ctx.document.sections
      sections.load('items/pageSetup')
      await ctx.sync()
      rep.pageSetup = sections.items.length
      if (!dry && rep.pageSetup) {
        for (const sec of sections.items) {
          try {
            sec.pageSetup.topMargin = 56.7    // 2.0 cm
            sec.pageSetup.bottomMargin = 56.7 // 2.0 cm
            sec.pageSetup.leftMargin = 85.05  // 3.0 cm
            sec.pageSetup.rightMargin = 42.5  // 1.5 cm
          } catch {}
        }
        await ctx.sync()
      }
    }

    // 14) định dạng đồng nhất cho đoạn thường
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
