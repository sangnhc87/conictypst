// Công thức Typst (hoặc LaTeX qua mitex -> Typst) -> OMML, để Word coi là Equation thật và sửa được bằng trình soạn của Word.
// Hỗ trợ tập con hay dùng trong đề toán/lý/hóa; cú pháp lạ thì báo lỗi rõ để giữ nguyên hình.

const SYMBOLS = {
  alpha: 'α', beta: 'β', gamma: 'γ', delta: 'δ', epsilon: 'ε', 'epsilon.alt': 'ϵ', zeta: 'ζ', eta: 'η', theta: 'θ', 'theta.alt': 'ϑ',
  iota: 'ι', kappa: 'κ', lambda: 'λ', mu: 'μ', nu: 'ν', xi: 'ξ', omicron: 'ο', pi: 'π', rho: 'ρ', sigma: 'σ', 'sigma.alt': 'ς',
  tau: 'τ', upsilon: 'υ', phi: 'φ', 'phi.alt': 'ϕ', chi: 'χ', psi: 'ψ', omega: 'ω',
  Gamma: 'Γ', Delta: 'Δ', Theta: 'Θ', Lambda: 'Λ', Xi: 'Ξ', Pi: 'Π', Sigma: 'Σ', Upsilon: 'Υ', Phi: 'Φ', Psi: 'Ψ', Omega: 'Ω',
  oo: '∞', infinity: '∞', partial: '∂', nabla: '∇', emptyset: '∅', aleph: 'ℵ', ell: 'ℓ', planck: 'ℏ', hbar: 'ℏ',
  'dot.c': '⋅', 'dot.op': '⋅', dot: '⋅', times: '×', 'times.circle': '⊗', 'times.o': '⊗', 'plus.circle': '⊕', 'plus.o': '⊕', 'dot.o': '⊙', 'plus.minus': '±', 'minus.plus': '∓', div: '÷', ast: '∗', star: '⋆',
  circle: '∘', compose: '∘', bullet: '•', dots: '…', 'dots.h': '…', 'dots.h.c': '⋯', 'dots.c': '⋯', 'dots.v': '⋮', 'dots.down': '⋱',
  'lt.eq': '≤', 'gt.eq': '≥', 'eq.not': '≠', approx: '≈', 'tilde.op': '∼', 'tilde.equiv': '≅', 'tilde.eq': '≃', equiv: '≡', prop: '∝', lt: '<', gt: '>', 'lt.double': '≪', 'gt.double': '≫',
  in: '∈', 'in.not': '∉', 'in.rev': '∋', subset: '⊂', 'subset.eq': '⊆', 'subset.not': '⊄', supset: '⊃', 'supset.eq': '⊇',
  union: '∪', inter: '∩', sect: '∩', without: '∖', forall: '∀', exists: '∃', 'exists.not': '∄', not: '¬',
  and: '∧', or: '∨', angle: '∠', 'angle.l': '⟨', 'angle.r': '⟩', 'chevron.l': '⟨', 'chevron.r': '⟩', perp: '⊥', parallel: '∥', 'parallel.not': '∦', 'triangle.stroked.t': '△',
  arrow: '→', 'arrow.r': '→', 'arrow.l': '←', 'arrow.t': '↑', 'arrow.b': '↓', 'arrow.l.r': '↔', 'arrow.r.double': '⇒', 'arrow.l.double': '⇐',
  'arrow.l.r.double': '⇔', 'arrow.r.long': '⟶', 'arrow.r.long.double': '⟹', 'arrow.l.r.long.double': '⟺', 'arrow.r.bar': '↦', 'arrow.r.hook': '↪',
  'arrow.r.squiggly': '⇝', 'arrow.tr': '↗', 'arrow.br': '↘', 'arrow.tl': '↖', 'arrow.bl': '↙',
  'harpoon.rt': '⇀', 'harpoons.rtlb': '⇌', therefore: '∴', because: '∵', colon: ':', dif: ' d', Dif: 'D', degree: '°',
  prime: '′', 'prime.double': '″', 'prime.triple': '‴', quad: ' ', qquad: '  ', thin: ' ', med: ' ', thick: ' ', wide: '  ', space: ' ', zws: '',
  diameter: '⌀', dagger: '†', checkmark: '✓', euro: '€', percent: '%', hash: '#', dollar: '$',
  'bar.v': '|', 'bar.v.double': '‖', slash: '/', backslash: '\\', 'ceil.l': '⌈', 'ceil.r': '⌉', 'floor.l': '⌊', 'floor.r': '⌋',
  'eq.triple': '≡', 'colon.eq': '≔', 'eq.def': '≝', qed: '∎',
}
const NN = { NN: 'ℕ', ZZ: 'ℤ', QQ: 'ℚ', RR: 'ℝ', CC: 'ℂ', PP: 'ℙ' }
Object.assign(SYMBOLS, NN)
// Toán tử nary: tên -> ký tự
const NARY = { sum: '∑', product: '∏', 'product.co': '∐', integral: '∫', 'integral.double': '∬', 'integral.triple': '∭', 'integral.cont': '∮', 'integral.surf': '∯', 'integral.vol': '∰', 'union.big': '⋃', 'inter.big': '⋂' }
const FUNCS = new Set(['sin', 'cos', 'tan', 'cot', 'sec', 'csc', 'arcsin', 'arccos', 'arctan', 'sinh', 'cosh', 'tanh', 'coth', 'log', 'ln', 'lg', 'exp', 'det', 'dim', 'ker', 'gcd', 'lcm', 'max', 'min', 'sup', 'inf', 'lim', 'liminf', 'limsup', 'arg', 'deg', 'hom', 'mod', 'Pr', 'sgn', 'tg', 'cotg', 'cosec', 'Re', 'Im', 'rank', 'tr', 'cov', 'var'])
const LIMIT_FUNCS = new Set(['lim', 'liminf', 'limsup', 'max', 'min', 'sup', 'inf', 'gcd'])
const RELATIONS = new Set(['=', '<', '>', '≤', '≥', '≠', '≈', '≡', '∈', '∉', '⊂', '⊆', '⊃', '⊇', '→', '⇒', '⇔', '⟹', '⟺', '⟶', '∼', '∝', '∥', '⊥', '←', '↦', '≪', '≫'])
const COMBINING = { hat: '̂', circum: '̂', tilde: '̃', macron: '̄', dot: '̇', 'dot.double': '̈', ddot: '̈', dddot: '⃛', arrow: '⃗', vec: '⃗', breve: '̆', caron: '̌', acute: '́', grave: '̀', accent: '̂' }
const MATRIX_DELIM = { pmatrix: ['(', ')'], bmatrix: ['[', ']'], Bmatrix: ['{', '}'], vmatrix: ['|', '|'], Vmatrix: ['‖', '‖'], matrix: ['', ''], smallmatrix: ['', ''] }
const SPACES = { thin: ' ', med: ' ', thick: ' ', quad: ' ', qquad: '  ', space: ' ', zws: '', wide: '  ' }

const BB = { C: 'ℂ', H: 'ℍ', N: 'ℕ', P: 'ℙ', Q: 'ℚ', R: 'ℝ', Z: 'ℤ' }
const CAL = { B: 'ℬ', E: 'ℰ', F: 'ℱ', H: 'ℋ', I: 'ℐ', L: 'ℒ', M: 'ℳ', R: 'ℛ', e: 'ℯ', g: 'ℊ', o: 'ℴ' }
const FRAK = { C: 'ℭ', H: 'ℌ', I: 'ℑ', R: 'ℜ', Z: 'ℨ' }

function styled(text, kind) {
  const bases = { bb: [0x1D538, 0x1D552, BB], cal: [0x1D49C, 0x1D4B6, CAL], frak: [0x1D504, 0x1D51E, FRAK] }
  const [up, low, exc] = bases[kind]
  return [...text].map(c => {
    if (exc[c]) return exc[c]
    if (c >= 'A' && c <= 'Z') return String.fromCodePoint(up + c.charCodeAt(0) - 65)
    if (c >= 'a' && c <= 'z') return String.fromCodePoint(low + c.charCodeAt(0) - 97)
    return c
  }).join('')
}

// ---------- Tokenizer ----------
const OPS = ['<==>', '<=>', '==>', '<==', '...', '|->', '<->', '<=', '>=', '!=', '->', '<-', '=>', '==', '::', ':=']
const OP_SYMBOL = { '<==>': '⟺', '<=>': '⇔', '==>': '⟹', '<==': '⟸', '...': '…', '|->': '↦', '<->': '↔', '<=': '≤', '>=': '≥', '!=': '≠', '->': '→', '<-': '←', '=>': '⇒', '==': '＝＝', '::': '∷', ':=': '≔' }

function tokenize(src) {
  const out = []
  let i = 0
  while (i < src.length) {
    const ch = src[i]
    if (/\s/.test(ch)) { const m = /^\s+/.exec(src.slice(i))[0]; out.push({ t: 'ws', v: m }); i += m.length; continue }
    if (ch === '"') {
      let j = i + 1, s = ''
      while (j < src.length && src[j] !== '"') { if (src[j] === '\\' && j + 1 < src.length) j++; s += src[j]; j++ }
      out.push({ t: 'str', v: s }); i = j + 1; continue
    }
    if (ch === '#') {
      const m = /^#([A-Za-z][\w-]*)\[/.exec(src.slice(i))
      if (m) {
        let j = i + m[0].length, depth = 1, s = ''
        while (j < src.length && depth) { if (src[j] === '[') depth++; if (src[j] === ']') depth--; if (depth) s += src[j]; j++ }
        if (src[j] === ';') j++
        out.push({ t: 'str', v: s }); i = j; continue
      }
    }
    if (ch === '\\') {
      if (src[i + 1] && /\S/.test(src[i + 1]) && !/[A-Za-z]/.test(src[i + 1])) { out.push({ t: 'ch', v: src[i + 1] }); i += 2; continue }
      out.push({ t: 'br' }); i++; continue
    }
    const num = /^\d+(\.\d+)?/.exec(src.slice(i))
    if (num) { out.push({ t: 'num', v: num[0] }); i += num[0].length; continue }
    const id = /^[A-Za-z]+(\.[A-Za-z]+)*/.exec(src.slice(i))
    if (id) { out.push({ t: 'id', v: id[0] }); i += id[0].length; continue }
    const op = OPS.find(o => src.startsWith(o, i))
    if (op) { out.push({ t: 'ch', v: OP_SYMBOL[op], sym: true }); i += op.length; continue }
    out.push({ t: 'ch', v: ch }); i++
  }
  return out
}

const isOpen = t => t && t.t === 'ch' && !t.sym && '([{'.includes(t.v)
const isClose = t => t && t.t === 'ch' && !t.sym && ')]}'.includes(t.v)

// ---------- Parser -> IR ----------
class Parser {
  constructor(src) {
    this.toks = tokenize(src)
    this.p = 0
  }

  get cur() { return this.toks[this.p] }
  skipWs() { while (this.cur && this.cur.t === 'ws') this.p++ }
  fail(msg) { throw new Error(`Không chuyển được sang Equation: ${msg}`) }

  static of(toks) { const p = new Parser(''); p.toks = toks; return p }

  parseSeq(stops = []) {
    const items = []
    for (;;) {
      this.skipWs()
      const t = this.cur
      if (!t) break
      if (t.t === 'ch' && !t.sym && stops.includes(t.v)) break
      if (t.t === 'br' && stops.includes('\\')) break
      items.push(this.parseTerm(stops))
    }
    return this.finish(items)
  }

  finish(items) {
    const out = []
    for (let i = 0; i < items.length; i++) {
      const it = items[i]
      if (it.k === 'nary' && it.body === undefined) {
        const body = []
        const stopAddSub = it.chr === '∑' || it.chr === '∏'
        while (i + 1 < items.length && !this.isBreaker(items[i + 1], stopAddSub)) body.push(items[++i])
        it.body = { k: 'row', items: body }
      } else if (it.k === 'func' && it.body === undefined) {
        const nxt = items[i + 1]
        it.body = nxt && !this.isBreaker(nxt, true) ? items[++i] : { k: 'row', items: [] }
      }
      out.push(it)
    }
    return out.length === 1 ? out[0] : { k: 'row', items: out }
  }

  isBreaker(it, stopAddSub) {
    if (it.k !== 'run' || it.sty === 'str') return false
    if (RELATIONS.has(it.text)) return true
    return stopAddSub && (it.text === '+' || it.text === '−')
  }

  parseTerm(stops) {
    let base = this.parsePrimary(stops)
    for (;;) {
      this.skipWsBefore('^', '_', "'")
      const t = this.cur
      if (!t || t.t !== 'ch') break
      if (t.v === "'") { this.p++; base = this.attach(base, null, { k: 'run', text: '′', sty: 'p' }); continue }
      if (t.v !== '^' && t.v !== '_') break
      this.p++
      const arg = this.parseAttachArg()
      base = t.v === '^' ? this.attach(base, null, arg) : this.attach(base, arg, null)
    }
    this.skipWsInline()
    while (this.cur && this.cur.t === 'ch' && this.cur.v === '/') {
      this.p++
      this.skipWs()
      let den = this.parsePrimary(stops)
      for (;;) {
        this.skipWsBefore('^', '_')
        const t = this.cur
        if (!t || t.t !== 'ch' || (t.v !== '^' && t.v !== '_')) break
        this.p++
        const arg = this.parseAttachArg()
        den = t.v === '^' ? this.attach(den, null, arg) : this.attach(den, arg, null)
      }
      base = { k: 'frac', num: this.unparen(base), den: this.unparen(den), bar: true }
      this.skipWsInline()
    }
    return base
  }

  skipWsBefore(...chars) {
    let j = this.p
    while (this.toks[j] && this.toks[j].t === 'ws') j++
    const t = this.toks[j]
    if (j > this.p && t && t.t === 'ch' && !t.sym && chars.includes(t.v)) this.p = j
  }

  skipWsInline() { const save = this.p; this.skipWs(); if (!(this.cur && this.cur.t === 'ch' && this.cur.v === '/')) this.p = save }

  attach(base, sub, sup) {
    if (base.k === 'sup' && sub && !base.sub) { base.sub = sub; base.k = 'subsup'; return base }
    if (base.k === 'sub' && sup && !base.sup) { base.sup = sup; base.k = 'subsup'; return base }
    if (base.k === 'brace' && !base.note && (sub || sup)) { base.note = sub || sup; return base }
    if (base.k === 'nary') { if (sub) base.sub = sub; if (sup) base.sup = sup; return base }
    if (base.k === 'func' && base.isLimit && sub) { base.lim = sub; return base }
    if (base.k === 'func' && base.body === undefined) { // sin^2 x: chỉ số thuộc về tên hàm
      if (sup) base.nameSup = sup
      if (sub) base.nameSub = sub
      return base
    }
    return sub && sup ? { k: 'subsup', base, sub, sup } : sub ? { k: 'sub', base, sub } : { k: 'sup', base, sup }
  }

  parseAttachArg() {
    this.skipWs()
    const t = this.cur
    if (!t) this.fail('thiếu toán hạng sau ^ hoặc _')
    if (t.t === 'ch' && t.v === '(') return this.unparen(this.parseGroupContent('(', ')'))
    return this.parsePrimary([], true)
  }

  unparen(node) {
    if (node.k === 'delim' && node.beg === '(' && node.end === ')' && node.plain) return node.body
    return node
  }

  parseGroupContent(open, close) {
    const start = this.p
    this.p++
    const closeAt = this.findClose(start, open, close)
    if (closeAt < 0) return { k: 'run', text: open }
    const inner = this.parseSeq([close])
    if (!(this.cur && this.cur.t === 'ch' && this.cur.v === close)) this.p = closeAt
    this.p++
    return { k: 'delim', beg: open, end: close, body: inner, plain: true }
  }

  findClose(openIdx, open, close) {
    let depth = 0
    for (let i = openIdx; i < this.toks.length; i++) {
      const t = this.toks[i]
      if (t.t !== 'ch' || t.sym) continue
      if (t.v === open) depth++
      else if (t.v === close) { depth--; if (!depth) return i }
    }
    return -1
  }

  parseCallArgs() {
    const open = this.p
    const close = this.findClose(open, '(', ')')
    if (close < 0) this.fail('thiếu dấu ) đóng hàm')
    this.p++
    const named = {}
    const rows = [[]]
    let curArg = []
    let depth = 0
    const flush = () => { rows[rows.length - 1].push(Parser.of(curArg)); curArg = [] }
    for (; this.p < close; this.p++) {
      const t = this.toks[this.p]
      if (isOpen(t)) depth++
      if (isClose(t)) depth--
      if (!depth && t.t === 'ch' && !t.sym && t.v === ',') { flush(); continue }
      if (!depth && t.t === 'ch' && !t.sym && t.v === ';') { flush(); rows.push([]); continue }
      curArg.push(t)
    }
    flush()
    this.p = close + 1
    for (const row of rows) {
      for (let i = row.length - 1; i >= 0; i--) {
        const toks = row[i].toks.filter(x => x.t !== 'ws')
        if (toks[0] && toks[0].t === 'id' && toks[1] && toks[1].t === 'ch' && toks[1].v === ':' && !toks[1].sym) {
          named[toks[0].v] = toks.slice(2).map(x => x.v).join('')
          row.splice(i, 1)
        }
      }
    }
    return { rows, named }
  }

  argNode(sub) { sub.p = 0; return sub.parseSeq([]) }

  parsePrimary(stops, atomic = false) {
    this.skipWs()
    const t = this.cur
    if (!t) this.fail('biểu thức bị cụt')
    if (t.t === 'num') { this.p++; return { k: 'run', text: t.v, sty: 'p' } }
    if (t.t === 'str') { this.p++; return { k: 'run', text: t.v, sty: 'str' } }
    if (t.t === 'br') { this.p++; return { k: 'run', text: '' } }
    if (t.t === 'id') return this.parseIdent()
    this.p++
    const v = t.v
    if (t.sym) return { k: 'run', text: v, sty: 'p' }
    if (v === '(' || v === '[' || v === '{') {
      const close = { '(': ')', '[': ']', '{': '}' }[v]
      this.p--
      return this.parseGroupContent(v, close)
    }
    if (v === '|') {
      let j = this.p
      while (j < this.toks.length && !(this.toks[j].t === 'ch' && this.toks[j].v === '|' && !this.toks[j].sym)) j++
      if (j < this.toks.length && !atomic) {
        const inner = this.parseSeq(['|'])
        this.p++
        return { k: 'delim', beg: '|', end: '|', body: inner }
      }
      return { k: 'run', text: '|', sty: 'p' }
    }
    const map = { '-': '−', '*': '∗', '~': ' ', '&': '' }
    if (v in map) return { k: 'run', text: map[v], sty: 'p' }
    return { k: 'run', text: v, sty: 'p' }
  }

  parseIdent() {
    const t = this.cur
    this.p++
    let name = t.v
    const nextIsParen = this.cur && this.cur.t === 'ch' && this.cur.v === '(' && !this.cur.sym
    if (!(name in SYMBOLS) && name.includes('.')) {
      const base = name.split('.')[0]
      if (!(name in NARY) && !(name in COMBINING) && (base in SYMBOLS || base in NARY)) name = base
    }
    if (nextIsParen) return this.parseCall(name)
    if (name in NARY) return { k: 'nary', chr: NARY[name], limits: '∑∏∐⋃⋂'.includes(NARY[name]), body: undefined }
    if (FUNCS.has(name)) return LIMIT_FUNCS.has(name) ? { k: 'func', name, isLimit: true, body: undefined, lim: undefined } : { k: 'func', name, body: undefined }
    if (name in SPACES) return { k: 'run', text: SPACES[name], sty: 'p' }
    if (name in SYMBOLS) return { k: 'run', text: SYMBOLS[name], sty: 'p' }
    if (name.length === 1) return { k: 'run', text: name }
    return { k: 'run', text: name, sty: 'p' }
  }

  parseCall(name) {
    const { rows, named } = this.parseCallArgs()
    const flat = rows.flat()
    const node = i => this.argNode(flat[i])
    switch (name) {
      case 'frac': case 'dfrac': case 'tfrac': case 'cfrac':
        if (flat.length < 2) this.fail('frac cần ít nhất 2 tham số')
        // 22{,}4 (dấu phẩy thập phân) bị tách thành nhiều tham số: gộp phần còn lại làm mẫu số
        return { k: 'frac', num: node(0), den: this.argNode(Parser.of(flat.slice(1).flatMap((a, i) => [...(i ? [{ t: 'ch', v: ',' }] : []), ...a.toks]))), bar: true }
      case 'binom': return { k: 'delim', beg: '(', end: ')', body: { k: 'frac', num: node(0), den: node(1), bar: false } }
      case 'sqrt': return { k: 'rad', deg: null, body: node(0) }
      case 'mitexsqrt': {
        if (flat.length < 2) return { k: 'rad', deg: null, body: node(0) }
        const degSrc = flat[0].toks.filter(x => x.t !== 'ws').map(x => x.v).join('').replace(/^\[/, '').replace(/\]$/, '').trim()
        return { k: 'rad', deg: degSrc ? { k: 'run', text: degSrc, sty: 'p' } : null, body: node(1) }
      }
      case 'root': return { k: 'rad', deg: node(0), body: node(1) }
      case 'abs': return { k: 'delim', beg: '|', end: '|', body: node(0) }
      case 'norm': return { k: 'delim', beg: '‖', end: '‖', body: node(0) }
      case 'floor': return { k: 'delim', beg: '⌊', end: '⌋', body: node(0) }
      case 'ceil': return { k: 'delim', beg: '⌈', end: '⌉', body: node(0) }
      case 'lr': {
        const inner = flat[0].toks
        const sig = inner.filter(x => x.t !== 'ws')
        const first = sig[0] && sig[0].v, last = sig[sig.length - 1] && sig[sig.length - 1].v
        const pair = { '(': ')', '[': ']', '{': '}', '|': '|', '⌊': '⌋', '⌈': '⌉', '⟨': '⟩' }
        if (first in pair && last === pair[first]) {
          return { k: 'delim', beg: first, end: last, body: this.argNode(Parser.of(inner.slice(inner.indexOf(sig[0]) + 1, inner.lastIndexOf(sig[sig.length - 1])))) }
        }
        if (sig.length > 1 && '{[|⟨⌊⌈'.includes(first)) { // \left\{ ... \right. : chỉ có ngoặc mở
          return { k: 'delim', beg: first, end: '', body: this.argNode(Parser.of(inner.slice(inner.indexOf(sig[0]) + 1))) }
        }
        return node(0)
      }
      case 'cases':
        return { k: 'cases', rows: flat.map(arg => this.splitAmp(arg.toks).map(cell => this.argNode(cell))) }
      case 'mat': case 'pmatrix': case 'bmatrix': case 'Bmatrix': case 'vmatrix': case 'Vmatrix': case 'matrix': case 'smallmatrix': {
        const d = name === 'mat' ? this.matDelim(named.delim) : MATRIX_DELIM[name]
        return { k: 'matrix', rows: rows.map(r => r.map(c => this.argNode(c))), delim: d }
      }
      case 'vec': {
        if (flat.length > 1 || named.delim) return { k: 'matrix', rows: flat.map(c => [this.argNode(c)]), delim: this.matDelim(named.delim) }
        return { k: 'acc', chr: COMBINING.vec, body: node(0) }
      }
      case 'overline': return { k: 'bar', pos: 'top', body: node(0) }
      case 'underline': return { k: 'bar', pos: 'bot', body: node(0) }
      case 'overbrace': case 'mitexoverbrace': case 'underbrace': case 'mitexunderbrace':
      case 'overbracket': case 'mitexoverbracket': case 'underbracket': case 'mitexunderbracket': {
        const top = /over/.test(name)
        const chr = /brace/.test(name) ? (top ? '⏞' : '⏟') : (top ? '⎴' : '⎵')
        return { k: 'brace', pos: top ? 'top' : 'bot', chr, body: node(0), note: flat[1] ? node(1) : null }
      }
      case 'aligned': return this.alignedNode(flat.length === 1 ? flat[0].toks : flat.flatMap(a => a.toks))
      case 'bold': case 'mitexmathbf': case 'mitexbold': case 'upright': case 'mitexupright': case 'italic': case 'mitexitalic': case 'sans': case 'mitexsans': case 'mono': case 'mitexmono': {
        const sty = /bold|mathbf/.test(name) ? 'b' : /upright/.test(name) ? 'p' : /italic/.test(name) ? 'i' : 'p'
        return { k: 'styled', sty, body: node(0) }
      }
      case 'bb': case 'cal': case 'frak': case 'mitexcal': case 'mitexfrak':
        return { k: 'conv', kind: name.replace('mitex', ''), body: node(0) }
      case 'display': case 'inline': case 'script': case 'sscript': case 'mitexdisplay': case 'mitexinline': case 'mitexscript': case 'mitexsscript':
        return node(0)
      case 'op': return { k: 'run', text: flat[0].toks.map(x => x.v).join(''), sty: 'p' }
      case 'text': case 'textmath': return { k: 'run', text: flat[0].toks.map(x => x.v).join(''), sty: 'str' }
      case 'stretch': return node(0)
      case 'attach': {
        // attach(X, tl: A, bl: Z): chỉ số trái trên/dưới
        return { k: 'prescript', base: node(0), sup: named.tl ? this.argNode(Parser.of(tokenize(named.tl))) : null, sub: named.bl ? this.argNode(Parser.of(tokenize(named.bl))) : null }
      }
      default:
        if (name in COMBINING) return { k: 'acc', chr: COMBINING[name], body: node(0) }
        if (name in SPACES) return { k: 'run', text: SPACES[name], sty: 'p' }
        if (name in NARY) return { k: 'nary', chr: NARY[name], limits: '∑∏∐⋃⋂'.includes(NARY[name]), body: node(0) }
        if (FUNCS.has(name)) return { k: 'func', name, isLimit: LIMIT_FUNCS.has(name), body: { k: 'delim', beg: '(', end: ')', body: node(0), plain: true } }
        if (name === 'mitexarray' || name === 'mitexnot' || name === 'mitexcolor') this.fail(`cấu trúc ${name.replace('mitex', '')} chưa hỗ trợ trong Equation`)
        return { k: 'row', items: [{ k: 'run', text: name, sty: name.length > 1 ? 'p' : undefined }, { k: 'delim', beg: '(', end: ')', body: { k: 'row', items: flat.flatMap((c, i) => [i ? { k: 'run', text: ',' } : null, this.argNode(c)]).filter(Boolean) }, plain: true }] }
    }
  }

  alignedNode(toks) {
    const lines = [[]]
    let depth = 0
    for (const t of toks) {
      if (isOpen(t)) depth++
      if (isClose(t)) depth--
      if (t.t === 'br' && depth <= 0) lines.push([]); else lines[lines.length - 1].push(t)
    }
    const rows = lines.filter(l => l.some(t => t.t !== 'ws')).map(l => this.splitAmp(l).map(cell => this.argNode(cell)))
    return { k: 'eqarr', rows }
  }

  splitAmp(toks) {
    const cells = [[]]
    for (const t of toks) {
      if (t.t === 'ch' && !t.sym && t.v === '&') cells.push([])
      else cells[cells.length - 1].push(t)
    }
    return cells.map(c => Parser.of(c))
  }

  matDelim(d) {
    const map = { '(': ['(', ')'], '[': ['[', ']'], '{': ['{', '}'], '|': ['|', '|'], '||': ['‖', '‖'], '‖': ['‖', '‖'], none: ['', ''] }
    const key = d === undefined ? undefined : String(d).replace(/"/g, '')
    return map[key] || ['(', ')']
  }
}

// ---------- IR -> OMML ----------
const esc = s => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
const RPR = '<w:rPr><w:rFonts w:ascii="Cambria Math" w:hAnsi="Cambria Math"/></w:rPr>' // trong <m:r>
const CTRL = `<m:ctrlPr>${RPR}</m:ctrlPr>` // trong các phần tử *Pr

function run(text, sty) {
  if (!text) return ''
  let pr = ''
  if (sty === 'p') pr = '<m:rPr><m:sty m:val="p"/></m:rPr>'
  else if (sty === 'b') pr = '<m:rPr><m:sty m:val="b"/></m:rPr>'
  else if (sty === 'bi') pr = '<m:rPr><m:sty m:val="bi"/></m:rPr>'
  else if (sty === 'i') pr = '<m:rPr><m:sty m:val="i"/></m:rPr>'
  else if (sty === 'str') pr = '<m:rPr><m:nor/></m:rPr>'
  return `<m:r>${pr}${RPR}<m:t xml:space="preserve">${esc(text)}</m:t></m:r>`
}

const wrap = (tag, inner) => `<m:${tag}>${inner || ''}</m:${tag}>`

function emit(n, inherit) {
  switch (n.k) {
    case 'run': return run(n.sty === 'str' ? ` ${n.text} ` : n.text, inherit || n.sty)
    case 'row': return n.items.map(x => emit(x, inherit)).join('')
    case 'frac': return `<m:f><m:fPr>${n.bar ? '' : '<m:type m:val="noBar"/>'}${CTRL}</m:fPr>${wrap('num', emit(n.num, inherit))}${wrap('den', emit(n.den, inherit))}</m:f>`
    case 'sup': return `<m:sSup><m:sSupPr>${CTRL}</m:sSupPr>${wrap('e', emit(n.base, inherit))}${wrap('sup', emit(n.sup, inherit))}</m:sSup>`
    case 'sub': return `<m:sSub><m:sSubPr>${CTRL}</m:sSubPr>${wrap('e', emit(n.base, inherit))}${wrap('sub', emit(n.sub, inherit))}</m:sSub>`
    case 'subsup': return `<m:sSubSup><m:sSubSupPr>${CTRL}</m:sSubSupPr>${wrap('e', emit(n.base, inherit))}${wrap('sub', emit(n.sub, inherit))}${wrap('sup', emit(n.sup, inherit))}</m:sSubSup>`
    case 'prescript': return `<m:sPre><m:sPrePr>${CTRL}</m:sPrePr>${wrap('sub', n.sub ? emit(n.sub, inherit) : '')}${wrap('sup', n.sup ? emit(n.sup, inherit) : '')}${wrap('e', emit(n.base, inherit))}</m:sPre>`
    case 'nary': {
      const hasSub = !!n.sub, hasSup = !!n.sup
      const pr = `<m:naryPr><m:chr m:val="${n.chr}"/><m:limLoc m:val="${n.limits ? 'undOvr' : 'subSup'}"/>${hasSub ? '' : '<m:subHide m:val="1"/>'}${hasSup ? '' : '<m:supHide m:val="1"/>'}${CTRL}</m:naryPr>`
      return `<m:nary>${pr}${wrap('sub', n.sub ? emit(n.sub, inherit) : '')}${wrap('sup', n.sup ? emit(n.sup, inherit) : '')}${wrap('e', n.body ? emit(n.body, inherit) : '')}</m:nary>`
    }
    case 'func': {
      let name = run(n.name, 'p')
      if (n.nameSup && n.nameSub) name = `<m:sSubSup><m:sSubSupPr>${CTRL}</m:sSubSupPr>${wrap('e', name)}${wrap('sub', emit(n.nameSub, inherit))}${wrap('sup', emit(n.nameSup, inherit))}</m:sSubSup>`
      else if (n.nameSup) name = `<m:sSup><m:sSupPr>${CTRL}</m:sSupPr>${wrap('e', name)}${wrap('sup', emit(n.nameSup, inherit))}</m:sSup>`
      else if (n.nameSub) name = `<m:sSub><m:sSubPr>${CTRL}</m:sSubPr>${wrap('e', name)}${wrap('sub', emit(n.nameSub, inherit))}</m:sSub>`
      const fname = n.lim ? `<m:limLow><m:limLowPr>${CTRL}</m:limLowPr>${wrap('e', name)}${wrap('lim', emit(n.lim, inherit))}</m:limLow>` : name
      return `<m:func><m:funcPr>${CTRL}</m:funcPr>${wrap('fName', fname)}${wrap('e', n.body ? emit(n.body, inherit) : '')}</m:func>`
    }
    case 'rad': return `<m:rad><m:radPr>${n.deg ? '' : '<m:degHide m:val="1"/>'}${CTRL}</m:radPr>${wrap('deg', n.deg ? emit(n.deg, inherit) : '')}${wrap('e', emit(n.body, inherit))}</m:rad>`
    case 'delim': return `<m:d><m:dPr><m:begChr m:val="${esc(n.beg)}"/><m:endChr m:val="${esc(n.end)}"/>${CTRL}</m:dPr>${wrap('e', emit(n.body, inherit))}</m:d>`
    case 'matrix': {
      const cols = Math.max(...n.rows.map(r => r.length))
      const mat = `<m:m><m:mPr><m:mcs><m:mc><m:mcPr><m:count m:val="${cols}"/><m:mcJc m:val="center"/></m:mcPr></m:mc></m:mcs>${CTRL}</m:mPr>${n.rows.map(r => `<m:mr>${r.map(c => wrap('e', emit(c, inherit))).join('')}</m:mr>`).join('')}</m:m>`
      const [b, e] = n.delim
      return b || e ? `<m:d><m:dPr><m:begChr m:val="${esc(b)}"/><m:endChr m:val="${esc(e)}"/>${CTRL}</m:dPr>${wrap('e', mat)}</m:d>` : mat
    }
    case 'cases': {
      const rows = n.rows.map(r => r.map(c => emit(c, inherit)).join(run(' ', 'p')))
      return `<m:d><m:dPr><m:begChr m:val="{"/><m:endChr m:val=""/>${CTRL}</m:dPr>${wrap('e', `<m:eqArr><m:eqArrPr>${CTRL}</m:eqArrPr>${rows.map(r => wrap('e', r)).join('')}</m:eqArr>`)}</m:d>`
    }
    case 'brace': {
      const g = `<m:groupChr><m:groupChrPr><m:chr m:val="${n.chr}"/><m:pos m:val="${n.pos}"/><m:vertJc m:val="${n.pos === 'top' ? 'bot' : 'top'}"/>${CTRL}</m:groupChrPr>${wrap('e', emit(n.body, inherit))}</m:groupChr>`
      if (!n.note) return g
      return n.pos === 'top'
        ? `<m:limUpp><m:limUppPr>${CTRL}</m:limUppPr>${wrap('e', g)}${wrap('lim', emit(n.note, inherit))}</m:limUpp>`
        : `<m:limLow><m:limLowPr>${CTRL}</m:limLowPr>${wrap('e', g)}${wrap('lim', emit(n.note, inherit))}</m:limLow>`
    }
    case 'eqarr': {
      const rows = n.rows.map(cells => cells.map(c => emit(c, inherit)).join(run('&', 'p')))
      return `<m:eqArr><m:eqArrPr>${CTRL}</m:eqArrPr>${rows.map(r => wrap('e', r)).join('')}</m:eqArr>`
    }
    case 'acc': return `<m:acc><m:accPr><m:chr m:val="${n.chr}"/>${CTRL}</m:accPr>${wrap('e', emit(n.body, inherit))}</m:acc>`
    case 'bar': return `<m:bar><m:barPr><m:pos m:val="${n.pos}"/>${CTRL}</m:barPr>${wrap('e', emit(n.body, inherit))}</m:bar>`
    case 'styled': return emit(n.body, n.sty)
    case 'conv': return emit(convert(n.body, n.kind), 'p')
    default: throw new Error(`Nút không biết: ${n.k}`)
  }
}

function convert(n, kind) {
  if (n.k === 'run') return { ...n, text: styled(n.text, kind), sty: 'p' }
  if (n.k === 'row') return { ...n, items: n.items.map(x => convert(x, kind)) }
  return n
}

// ---------- API ----------
/** code: công thức Typst (phần giữa hai dấu $). Trả về <m:oMath>…</m:oMath> hoặc <m:oMathPara>. */
export function typstToOmml(code, { display = false } = {}) {
  const parser = new Parser(code)
  let depth = 0
  const multiline = parser.toks.some(t => {
    if (isOpen(t)) depth++
    if (isClose(t)) depth--
    return t.t === 'br' && depth <= 0
  })
  const node = multiline ? parser.alignedNode(parser.toks) : parser.parseSeq([])
  if (multiline ? !node.rows.length : (node.k === 'row' && !node.items.length)) throw new Error('Công thức rỗng.')
  const inner = emit(node)
  return display
    ? `<m:oMathPara><m:oMathParaPr><m:jc m:val="center"/></m:oMathParaPr><m:oMath>${inner}</m:oMath></m:oMathPara>`
    : `<m:oMath>${inner}</m:oMath>`
}
