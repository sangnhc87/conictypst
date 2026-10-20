// Equation gốc của Word (OMML) -> LaTeX, để dựng lại thành hình Sang Math. Hỗ trợ phần Equation hay gặp ở đề toán/lý/hóa;
// phần tử lạ thì lấy nội dung bên trong, không báo lỗi để cả tài liệu vẫn chuyển được.
const M = 'http://schemas.openxmlformats.org/officeDocument/2006/math'

const SYMBOL = {
  '−': '-', '·': '\\cdot ', '×': '\\times ', '÷': '\\div ', '±': '\\pm ', '∓': '\\mp ', '∘': '\\circ ', '∗': '*', '⋅': '\\cdot ',
  '≤': '\\le ', '≥': '\\ge ', '≠': '\\ne ', '≈': '\\approx ', '≡': '\\equiv ', '∼': '\\sim ', '≅': '\\cong ', '∝': '\\propto ', '≪': '\\ll ', '≫': '\\gg ',
  '∞': '\\infty ', '∂': '\\partial ', '∇': '\\nabla ', '∅': '\\emptyset ', '∈': '\\in ', '∉': '\\notin ', '∋': '\\ni ', '⊂': '\\subset ', '⊆': '\\subseteq ', '⊃': '\\supset ', '⊇': '\\supseteq ',
  '∪': '\\cup ', '∩': '\\cap ', '∖': '\\setminus ', '∀': '\\forall ', '∃': '\\exists ', '∧': '\\wedge ', '∨': '\\vee ', '¬': '\\neg ',
  '→': '\\to ', '←': '\\leftarrow ', '↔': '\\leftrightarrow ', '⇒': '\\Rightarrow ', '⇐': '\\Leftarrow ', '⇔': '\\Leftrightarrow ', '↦': '\\mapsto ', '↑': '\\uparrow ', '↓': '\\downarrow ',
  '∠': '\\angle ', '⊥': '\\perp ', '∥': '\\parallel ', '△': '\\triangle ', '°': '^\\circ ', '′': "'", '″': "''", '…': '\\ldots ', '⋯': '\\cdots ', '⋮': '\\vdots ', '⋱': '\\ddots ',
  '∴': '\\therefore ', '∵': '\\because ', 'ℝ': '\\mathbb{R}', 'ℕ': '\\mathbb{N}', 'ℤ': '\\mathbb{Z}', 'ℚ': '\\mathbb{Q}', 'ℂ': '\\mathbb{C}',
  'α': '\\alpha ', 'β': '\\beta ', 'γ': '\\gamma ', 'δ': '\\delta ', 'ε': '\\varepsilon ', 'ϵ': '\\epsilon ', 'ζ': '\\zeta ', 'η': '\\eta ', 'θ': '\\theta ', 'ϑ': '\\vartheta ', 'ι': '\\iota ', 'κ': '\\kappa ',
  'λ': '\\lambda ', 'μ': '\\mu ', 'ν': '\\nu ', 'ξ': '\\xi ', 'π': '\\pi ', 'ρ': '\\rho ', 'σ': '\\sigma ', 'τ': '\\tau ', 'υ': '\\upsilon ', 'φ': '\\varphi ', 'ϕ': '\\phi ', 'χ': '\\chi ', 'ψ': '\\psi ', 'ω': '\\omega ',
  'Γ': '\\Gamma ', 'Δ': '\\Delta ', 'Θ': '\\Theta ', 'Λ': '\\Lambda ', 'Ξ': '\\Xi ', 'Π': '\\Pi ', 'Σ': '\\Sigma ', 'Υ': '\\Upsilon ', 'Φ': '\\Phi ', 'Ψ': '\\Psi ', 'Ω': '\\Omega ',
}
const NARY = { '∑': '\\sum', '∏': '\\prod', '∐': '\\coprod', '∫': '\\int', '∬': '\\iint', '∭': '\\iiint', '∮': '\\oint', '⋃': '\\bigcup', '⋂': '\\bigcap' }
const FUNCS = new Set(['sin', 'cos', 'tan', 'cot', 'sec', 'csc', 'arcsin', 'arccos', 'arctan', 'sinh', 'cosh', 'tanh', 'coth', 'log', 'ln', 'lg', 'exp', 'lim', 'max', 'min', 'sup', 'inf', 'det', 'gcd', 'arg', 'deg', 'dim', 'ker'])
const DELIM = { '': '.', '(': '(', ')': ')', '[': '[', ']': ']', '{': '\\{', '}': '\\}', '|': '|', '‖': '\\|', '⟨': '\\langle ', '⟩': '\\rangle ', '⌊': '\\lfloor ', '⌋': '\\rfloor ', '⌈': '\\lceil ', '⌉': '\\rceil ', '〈': '\\langle ', '〉': '\\rangle ' }
const MATRIX_ENV = { '(': 'pmatrix', '[': 'bmatrix', '{': 'Bmatrix', '|': 'vmatrix', '‖': 'Vmatrix' }
const ACCENT = { '̂': 'hat', '̃': 'tilde', '̄': 'bar', '̅': 'bar', '¯': 'bar', '⃗': 'vec', '→': 'vec', '̇': 'dot', '̈': 'ddot', '̌': 'check', '́': 'acute', '̀': 'grave', '̆': 'breve', '^': 'hat', '~': 'tilde' }

const isM = (n, name) => n.nodeType === 1 && n.namespaceURI === M && n.localName === name
const kids = n => [...n.childNodes].filter(c => c.nodeType === 1)
const child = (n, name) => kids(n).find(c => isM(c, name))
const val = el => (el && (el.getAttributeNS(M, 'val') ?? el.getAttribute('m:val'))) ?? null
const truthy = v => v !== null && v !== 'off' && v !== '0' && v !== 'false'
const prop = (n, pr, name) => { const p = child(n, pr); const el = p && child(p, name); return el ? (val(el) ?? '') : null }
const group = s => `{${s}}`

// Ký tự trong m:t: đổi ký hiệu sang lệnh LaTeX, thoát ký tự đặc biệt (giữ & khi đang trong eqArr để làm điểm căn).
function text(raw, { allowAmp } = {}) {
  let out = ''
  for (const ch of raw) {
    if (SYMBOL[ch]) out += SYMBOL[ch]
    else if (ch === '&') out += allowAmp ? '&' : '\\&'
    else if ('{}_^%#$'.includes(ch)) out += `\\${ch}`
    else if (ch === '\\') out += '\\backslash '
    else if (ch === ' ' || ch === ' ') out += '\\ '
    else out += ch
  }
  return out
}

function run(n, ctx) {
  const rpr = child(n, 'rPr')
  const sty = rpr && child(rpr, 'sty') ? val(child(rpr, 'sty')) : null
  const nor = rpr && child(rpr, 'nor') && truthy(val(child(rpr, 'nor')) ?? 'on')
  const scr = rpr && child(rpr, 'scr') ? val(child(rpr, 'scr')) : null
  const raw = kids(n).filter(c => isM(c, 't')).map(c => c.textContent).join('')
  if (!raw) return ''
  if (nor) return `\\text{${raw.replaceAll('\\', '').replace(/([{}_^%#$&])/g, '\\$1')}}`
  let out = text(raw, ctx)
  if (scr === 'double-struck') return /^[A-Za-z]+$/.test(raw) ? `\\mathbb{${raw}}` : out
  if (scr === 'script') return /^[A-Za-z]+$/.test(raw) ? `\\mathcal{${raw}}` : out
  if (scr === 'fraktur') return /^[A-Za-z]+$/.test(raw) ? `\\mathfrak{${raw}}` : out
  if (sty === 'b' || sty === 'bi') return /^[A-Za-z0-9]+$/.test(raw) ? `\\mathbf{${raw}}` : out
  if (sty === 'p' && /^[A-Za-z]{2,}$/.test(raw)) return FUNCS.has(raw) ? `\\${raw} ` : `\\mathrm{${raw}}`
  if (sty === 'p' && /^[A-Za-z]$/.test(raw)) return `\\mathrm{${raw}}`
  return out
}

const arg = (n, name, ctx) => { const c = child(n, name); return c ? seq(c, ctx) : '' }

function seq(n, ctx = {}) {
  return kids(n).map(c => node(c, ctx)).join('')
}

function delim(n, ctx) {
  const beg = prop(n, 'dPr', 'begChr') ?? '('
  const end = prop(n, 'dPr', 'endChr') ?? ')'
  const sep = prop(n, 'dPr', 'sepChr') ?? '|'
  const parts = kids(n).filter(c => isM(c, 'e'))
  // một ma trận trong ngoặc -> môi trường pmatrix/bmatrix...
  if (parts.length === 1 && MATRIX_ENV[beg] && kids(parts[0]).length === 1 && isM(kids(parts[0])[0], 'm') && DELIM[end] !== undefined) {
    const env = MATRIX_ENV[beg]
    if (({ pmatrix: ')', bmatrix: ']', Bmatrix: '}', vmatrix: '|', Vmatrix: '‖' })[env] === end) return matrix(kids(parts[0])[0], ctx, env)
  }
  // nhị thức: ngoặc tròn bao một phân số không gạch -> \binom
  if (parts.length === 1 && beg === '(' && end === ')' && kids(parts[0]).length === 1 && isM(kids(parts[0])[0], 'f') && prop(kids(parts[0])[0], 'fPr', 'type') === 'noBar') return node(kids(parts[0])[0], ctx)
  // hệ phương trình viết bằng ma trận: ngoặc nhọn trái, không ngoặc phải
  if (parts.length === 1 && beg === '{' && end === '' && kids(parts[0]).length === 1 && isM(kids(parts[0])[0], 'm')) {
    const rows = kids(kids(parts[0])[0]).filter(c => isM(c, 'mr'))
    return `\\begin{cases} ${rows.map(r => kids(r).filter(c => isM(c, 'e')).map(c => seq(c, ctx)).join(' & ')).join(' \\\\ ')} \\end{cases}`
  }
  // hệ phương trình: ngoặc nhọn trái, không ngoặc phải, bên trong là eqArr
  if (parts.length === 1 && beg === '{' && end === '' && kids(parts[0]).length === 1 && isM(kids(parts[0])[0], 'eqArr')) {
    return `\\begin{cases} ${kids(kids(parts[0])[0]).filter(r => isM(r, 'e')).map(r => seq(r, { ...ctx, allowAmp: true })).join(' \\\\ ')} \\end{cases}`
  }
  const l = DELIM[beg] ?? beg
  const r = DELIM[end] ?? end
  return `\\left${l} ${parts.map(p => seq(p, ctx)).join(` ${DELIM[sep] === '|' || sep === '|' ? '\\mid' : (DELIM[sep] ?? sep)} `)} \\right${r}`
}

function matrix(n, ctx, env = 'matrix') {
  const rows = kids(n).filter(c => isM(c, 'mr'))
  const body = rows.map(r => kids(r).filter(c => isM(c, 'e')).map(c => seq(c, ctx)).join(' & ')).join(' \\\\ ')
  return `\\begin{${env}} ${body} \\end{${env}}`
}

function node(n, ctx) {
  if (n.nodeType !== 1 || n.namespaceURI !== M) return ''
  switch (n.localName) {
    case 'r': return run(n, ctx)
    case 'f': {
      const type = prop(n, 'fPr', 'type')
      const num = arg(n, 'num', ctx), den = arg(n, 'den', ctx)
      if (type === 'noBar') return `\\binom{${num}}{${den}}`
      if (type === 'skw' || type === 'lin') return `${group(num)}/${group(den)}`
      return `\\frac{${num}}{${den}}`
    }
    case 'sSup': return `${group(arg(n, 'e', ctx))}^${group(arg(n, 'sup', ctx))}`
    case 'sSub': return `${group(arg(n, 'e', ctx))}_${group(arg(n, 'sub', ctx))}`
    case 'sSubSup': return `${group(arg(n, 'e', ctx))}_${group(arg(n, 'sub', ctx))}^${group(arg(n, 'sup', ctx))}`
    case 'sPre': return `{}_${group(arg(n, 'sub', ctx))}^${group(arg(n, 'sup', ctx))}${group(arg(n, 'e', ctx))}`
    case 'rad': {
      const hide = truthy(prop(n, 'radPr', 'degHide'))
      const deg = arg(n, 'deg', ctx)
      return !hide && deg.trim() ? `\\sqrt[${deg}]{${arg(n, 'e', ctx)}}` : `\\sqrt{${arg(n, 'e', ctx)}}`
    }
    case 'nary': {
      const chr = prop(n, 'naryPr', 'chr') ?? '∫'
      const op = NARY[chr] ?? '\\int'
      const subHide = truthy(prop(n, 'naryPr', 'subHide')), supHide = truthy(prop(n, 'naryPr', 'supHide'))
      const sub = arg(n, 'sub', ctx), sup = arg(n, 'sup', ctx)
      return `${op}${!subHide && sub ? `_${group(sub)}` : ''}${!supHide && sup ? `^${group(sup)}` : ''} ${group(arg(n, 'e', ctx))}`
    }
    case 'd': return delim(n, ctx)
    case 'm': return matrix(n, ctx)
    case 'eqArr': return `\\begin{aligned} ${kids(n).filter(r => isM(r, 'e')).map(r => seq(r, { ...ctx, allowAmp: true })).join(' \\\\ ')} \\end{aligned}`
    case 'func': {
      const name = arg(n, 'fName', ctx).trim()
      const bare = name.replace(/^\\/, '').replace(/\s+$/, '')
      const head = FUNCS.has(bare) ? `\\${bare} ` : (/^\\[A-Za-z]+/.test(name) || /[_^\\{]/.test(name) ? name : `\\operatorname{${name}}`)
      return `${head} ${group(arg(n, 'e', ctx))}`
    }
    case 'limLow': {
      const e = arg(n, 'e', ctx).trim(), lim = arg(n, 'lim', ctx)
      if (/^\\(lim|max|min|sup|inf)\b/.test(e)) return `${e}_${group(lim)}`
      if (e.startsWith('\\underbrace') || e.startsWith('\\overbrace')) return `${e}_${group(lim)}`
      return `\\underset{${lim}}{${e}}`
    }
    case 'limUpp': {
      const e = arg(n, 'e', ctx).trim(), lim = arg(n, 'lim', ctx)
      if (e.startsWith('\\overbrace') || e.startsWith('\\underbrace')) return `${e}^${group(lim)}`
      return `\\overset{${lim}}{${e}}`
    }
    case 'acc': {
      const chr = prop(n, 'accPr', 'chr')
      const kind = ACCENT[chr ?? '̂'] ?? 'hat'
      const e = arg(n, 'e', ctx)
      const long = e.replace(/\\[A-Za-z]+ ?/g, 'x').replace(/[{}]/g, '').length > 1
      const wide = long ? ({ hat: 'widehat', tilde: 'widetilde', vec: 'overrightarrow' }[kind] ?? kind) : kind
      return `\\${wide}{${e}}`
    }
    case 'bar': return prop(n, 'barPr', 'pos') === 'bot' ? `\\underline{${arg(n, 'e', ctx)}}` : `\\overline{${arg(n, 'e', ctx)}}`
    case 'groupChr': {
      const chr = prop(n, 'groupChrPr', 'chr') ?? '⏟'
      return `${chr === '⏞' ? '\\overbrace' : '\\underbrace'}{${arg(n, 'e', ctx)}}`
    }
    case 'box': case 'borderBox': case 'phant': return arg(n, 'e', ctx)
    case 'oMath': case 'oMathPara': case 'e': case 'num': case 'den': case 'sup': case 'sub': case 'deg': case 'lim': case 'fName': return seq(n, ctx)
    default: return n.localName.endsWith('Pr') ? '' : seq(n, ctx) // phần tử lạ: lấy nội dung bên trong
  }
}

/** n: phần tử m:oMath. Trả về chuỗi LaTeX. */
export function ommlToLatex(n) {
  return node(n, {}).replace(/\s+/g, ' ').replace(/\{ /g, '{').replace(/ \}/g, '}').trim()
}
