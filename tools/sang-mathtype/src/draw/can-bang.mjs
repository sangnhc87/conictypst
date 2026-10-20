// Cân bằng phương trình hoá học: phân tích công thức, giải hệ bằng khử Gauss trên phân số.
// Nhận: "C2H5OH + O2 -> CO2 + H2O", "Fe + H^+ -> Fe^2+ + H2", "CuSO4.5H2O -> CuSO4 + H2O"; ↑ ↓ sau công thức đánh dấu khí/kết tủa.

const gcd = (a, b) => (b ? gcd(b, a % b) : Math.abs(a))
const lcm = (a, b) => (a / gcd(a, b)) * b
class Fr { constructor(n, d = 1) { if (d < 0) { n = -n; d = -d } const g = gcd(n, d) || 1; this.n = n / g; this.d = d / g }
  add(o) { return new Fr(this.n * o.d + o.n * this.d, this.d * o.d) } sub(o) { return new Fr(this.n * o.d - o.n * this.d, this.d * o.d) }
  mul(o) { return new Fr(this.n * o.n, this.d * o.d) } div(o) { return new Fr(this.n * o.d, this.d * o.n) } zero() { return this.n === 0 } }

/** "Ca(OH)2", "Fe2(SO4)3", "CuSO4.5H2O", "Fe^3+", "SO4^2-" → { atoms: {Fe: 2, ...}, charge } */
export function parseFormula(raw) {
  let f = String(raw).trim().replace(/\s+/g, '')
  let charge = 0
  const cm = f.match(/\^(\d*)([+-])$/) || f.match(/([+-])(\d*)$/) && null
  if (cm) { charge = (cm[2] === '+' ? 1 : -1) * (cm[1] === '' ? 1 : Number(cm[1])); f = f.slice(0, cm.index) }
  const atoms = {}
  const add = (el, n) => { atoms[el] = (atoms[el] || 0) + n }
  const parts = f.split(/[.·*]/)
  for (const part of parts) {
    let mult = 1
    const mm = part.match(/^(\d+)(.*)$/)
    let body = part
    if (mm && parts.length > 1) { mult = Number(mm[1]); body = mm[2] }
    let i = 0
    const parseGroup = () => {
      const out = {}
      const put = (el, n) => { out[el] = (out[el] || 0) + n }
      while (i < body.length) {
        const c = body[i]
        if (c === '(' || c === '[') {
          i++
          const inner = parseGroup()
          const close = body[i]; if (close !== ')' && close !== ']') throw new Error(`thiếu dấu đóng trong "${raw}"`)
          i++
          let num = ''
          while (/\d/.test(body[i] || '')) num += body[i++]
          const k = num ? Number(num) : 1
          for (const [el, n] of Object.entries(inner)) put(el, n * k)
        } else if (c === ')' || c === ']') return out
        else if (/[A-Z]/.test(c)) {
          let el = c; i++
          if (/[a-z]/.test(body[i] || '')) el += body[i++]
          let num = ''
          while (/\d/.test(body[i] || '')) num += body[i++]
          put(el, num ? Number(num) : 1)
        } else throw new Error(`ký tự lạ "${c}" trong "${raw}"`)
      }
      return out
    }
    const g = parseGroup()
    for (const [el, n] of Object.entries(g)) add(el, n * mult)
  }
  if (!Object.keys(atoms).length) throw new Error(`công thức rỗng: "${raw}"`)
  return { atoms, charge }
}

export function parseEquation(text) {
  const t = String(text).replace(/→|⟶|=>|-->|->|==|=|⇌|<=>/g, '->')
  const sides = t.split('->')
  if (sides.length !== 2) throw new Error('Cần đúng một mũi tên (->) giữa vế trái và vế phải')
  const side = s => s.split(/\s\+\s|\+(?=\s*(?:\d*[A-Z(\[]))/).map(x => x.trim()).filter(Boolean).map(x => {
    let mark = ''
    x = x.replace(/[↑↓]$/, m => { mark = m; return '' })
    const m = x.match(/^(\d+)\s*(.+)$/)
    const hasCoef = m && /^[A-Z(\[]/.test(m[2])
    return { coef: hasCoef ? Number(m[1]) : null, f: (hasCoef ? m[2] : x).trim(), mark }
  })
  return { left: side(sides[0]), right: side(sides[1]) }
}

/** Trả về { left, right } với hệ số nguyên nhỏ nhất, hoặc ném lỗi tiếng Việt */
export function balance(text) {
  const eq = parseEquation(text)
  const sp = [...eq.left, ...eq.right]
  const parsed = sp.map(s => parseFormula(s.f))
  const els = [...new Set(parsed.flatMap(p => Object.keys(p.atoms)))]
  const rows = els.map(el => parsed.map((p, j) => new Fr((p.atoms[el] || 0) * (j < eq.left.length ? 1 : -1))))
  if (parsed.some(p => p.charge)) rows.push(parsed.map((p, j) => new Fr(p.charge * (j < eq.left.length ? 1 : -1))))
  const n = sp.length
  const A = rows.map(r => r.slice())
  const piv = []
  let r = 0
  for (let c = 0; c < n && r < A.length; c++) {
    let p = r
    while (p < A.length && A[p][c].zero()) p++
    if (p === A.length) continue
    ;[A[r], A[p]] = [A[p], A[r]]
    const pv = A[r][c]
    A[r] = A[r].map(x => x.div(pv))
    for (let i = 0; i < A.length; i++) if (i !== r && !A[i][c].zero()) { const f = A[i][c]; A[i] = A[i].map((x, k) => x.sub(f.mul(A[r][k]))) }
    piv.push(c); r++
  }
  const free = [...Array(n).keys()].filter(c => !piv.includes(c))
  if (free.length === 0) throw new Error('Không có hệ số nguyên dương nào cân bằng (kiểm tra lại công thức/sản phẩm)')
  if (free.length > 1) throw new Error('Phương trình có nhiều cách cân bằng (thiếu ràng buộc). Hãy bổ sung chất hoặc ghi sẵn một số hệ số.')
  const fcol = free[0]
  const x = new Array(n).fill(null).map(() => new Fr(0))
  x[fcol] = new Fr(1)
  piv.forEach((c, i) => { x[c] = new Fr(0).sub(A[i][fcol]) })
  const L = x.reduce((a, v) => lcm(a, v.d), 1)
  let ints = x.map(v => v.n * (L / v.d))
  if (ints.some(v => v < 0) && ints.every(v => v <= 0)) ints = ints.map(v => -v)
  if (ints.some(v => v <= 0)) throw new Error('Không có hệ số dương cân bằng (kiểm tra lại các chất)')
  const g = ints.reduce((a, v) => gcd(a, v), 0)
  ints = ints.map(v => v / g)
  const fix = (arr, off) => arr.map((s, i) => ({ coef: ints[off + i], f: s.f, mark: s.mark }))
  return { left: fix(eq.left, 0), right: fix(eq.right, eq.left.length) }
}
