// Bộ ký hiệu / mẫu công thức: Toán, Lý, Hóa. Mỗi mục: { name, typst, latex?, kw? }.
// ⟦...⟧ đánh dấu chỗ trống đầu tiên: sau khi chèn, vùng đó được bôi đen để gõ đè lên.
// latex vắng = mục chỉ dùng được ở chế độ Typst (nút mờ khi đang ở LaTeX).

const T = (name, typst, latex, kw = '') => ({ name, typst, latex, kw })
const cat = (group, id, name, icon, items) => ({ group, id, name, icon, items })

// ---------- sinh bảng từ đặc tả gọn ----------
const GREEK_LOW = [
  ['alpha', 'Alpha'], ['beta', 'Beta'], ['gamma', 'Gamma'], ['delta', 'Delta'], ['epsilon', 'Epsilon'], ['epsilon.alt', 'Epsilon (dạng ϵ)', '\\varepsilon'],
  ['zeta', 'Zeta'], ['eta', 'Eta'], ['theta', 'Theta'], ['theta.alt', 'Theta (dạng ϑ)', '\\vartheta'], ['iota', 'Iota'], ['kappa', 'Kappa'], ['lambda', 'Lambda'],
  ['mu', 'Muy'], ['nu', 'Nuy'], ['xi', 'Xi'], ['pi', 'Pi'], ['rho', 'Rô'], ['sigma', 'Sigma'], ['tau', 'Tau'], ['upsilon', 'Upsilon'],
  ['phi', 'Phi'], ['phi.alt', 'Phi (dạng φ)', '\\varphi'], ['chi', 'Khi'], ['psi', 'Psi'], ['omega', 'Omega'],
]
const GREEK_UP = ['Gamma', 'Delta', 'Theta', 'Lambda', 'Xi', 'Pi', 'Sigma', 'Upsilon', 'Phi', 'Psi', 'Omega']

const greekLow = GREEK_LOW.map(([n, vi, tex]) => T(`${vi}`, n, tex || `\\${n}`, `hy lap ${n}`))
const greekUp = GREEK_UP.map(n => T(`${n} hoa`, n, `\\${n}`, `hy lap ${n} in hoa`))

// Công thức hóa học từ chuỗi gọn: "H2SO4", "Ca(OH)2", "SO4^2-", "Fe^3+"
function chemParts(spec) {
  const m = /^(.*?)(?:\^(\d*[+-]))?$/.exec(spec)
  const body = m[1]
  const charge = m[2]
  const tokens = []
  let cur = ''
  const flush = () => { if (cur) tokens.push({ s: cur }); cur = '' }
  for (let i = 0; i < body.length; i++) {
    const c = body[i]
    if (/\d/.test(c) && !(i === 0)) { // số sau ký hiệu là chỉ số dưới
      let num = c
      while (/\d/.test(body[i + 1] || '')) num += body[++i]
      flush(); tokens.push({ sub: num })
    } else if (/\d/.test(c)) { cur += c } else cur += c
  }
  flush()
  return { tokens, charge }
}
function chemTypst(spec) {
  const { tokens, charge } = chemParts(spec)
  let out = ''
  for (const t of tokens) out += t.sub ? `_${t.sub}` : `${out ? ' ' : ''}${[...t.s].join(' ')}`
  if (charge) out += `^(${charge})`
  return `upright(${out})`
}
function chemLatex(spec) {
  const { tokens, charge } = chemParts(spec)
  let out = ''
  for (const t of tokens) out += t.sub ? `_{${t.sub}}` : t.s
  if (charge) out += `^{${charge}}`
  return `\\mathrm{${out}}`
}
function rxn(spec) {
  const typst = [], latex = []
  for (const tok of spec.split(/\s+/)) {
    const arrow = /^(->|<->)(?:\[(.*)\])?$/.exec(tok)
    if (arrow) {
      const eq = arrow[1] === '<->'
      const cond = arrow[2] && arrow[2].replaceAll('_', ' ')
      typst.push(eq ? 'harpoons.rtlb' : cond ? `stretch(->)^("${cond}")` : 'arrow.r')
      latex.push(eq ? '\\rightleftharpoons' : cond ? `\\xrightarrow{\\text{${cond}}}` : '\\to')
    } else if (tok === '+') { typst.push('+'); latex.push('+') }
    else if (tok === '(v)') { typst.push('arrow.b'); latex.push('\\downarrow') }
    else if (tok === '(^)') { typst.push('arrow.t'); latex.push('\\uparrow') }
    else {
      const m = /^(\d*)(.+)$/.exec(tok)
      if (m[1]) { typst.push(m[1]); latex.push(m[1]) }
      typst.push(chemTypst(m[2])); latex.push(chemLatex(m[2]))
    }
  }
  return [typst.join(' '), latex.join(' ')]
}
const chem = (name, spec, kw = '') => T(name, chemTypst(spec), chemLatex(spec), `${spec} ${kw}`)

// Đơn vị: "m/s^2" -> chữ đứng + mũ
function unit(name, spec, kw = '') {
  const [base, pow] = spec.split('^')
  return T(name, pow ? `"${base}"^(${pow})` : `"${base}"`, pow ? `\\mathrm{${base}}^{${pow}}` : `\\mathrm{${base}}`, `${spec} ${kw}`)
}

// ---------- TOÁN ----------
const MATH = [
  cat('Toán', 'rel', 'Quan hệ', '≤', [
    T('Bằng', '=', '='), T('Khác (không bằng)', 'eq.not', '\\ne'), T('Nhỏ hơn', '<', '<'), T('Lớn hơn', '>', '>'),
    T('Nhỏ hơn hoặc bằng', 'lt.eq', '\\le'), T('Lớn hơn hoặc bằng', 'gt.eq', '\\ge'), T('Nhỏ hơn hẳn', 'lt.double', '\\ll'), T('Lớn hơn hẳn', 'gt.double', '\\gg'),
    T('Xấp xỉ', 'approx', '\\approx'), T('Đồng nhất, đồng dư', 'equiv', '\\equiv'), T('Tương đương (~)', 'tilde.op', '\\sim'), T('Bằng nhau (hai tam giác)', 'tilde.equiv', '\\cong'),
    T('Tỉ lệ với', 'prop', '\\propto'), T('Vuông góc', 'perp', '\\perp'), T('Song song', 'parallel', '\\parallel'), T('Không song song', 'parallel.not', '\\nparallel'),
    T('Định nghĩa là', 'colon.eq', ':='), T('Không nhỏ hơn', 'lt.not', '\\nless'), T('Không lớn hơn', 'gt.not', '\\ngtr'), T('Gần bằng (≃)', 'tilde.eq', '\\simeq'),
  ]),
  cat('Toán', 'op', 'Phép toán', '±', [
    T('Cộng', '+', '+'), T('Trừ', '-', '-'), T('Nhân (×)', 'times', '\\times'), T('Nhân (chấm)', 'dot.op', '\\cdot'), T('Chia (÷)', 'div', '\\div'),
    T('Cộng trừ', 'plus.minus', '\\pm'), T('Trừ cộng', 'minus.plus', '\\mp'), T('Dấu sao', 'ast', '\\ast'), T('Hợp hàm', 'compose', '\\circ'),
    T('Cộng vòng tròn', 'plus.o', '\\oplus'), T('Nhân vòng tròn', 'times.o', '\\otimes'), T('Chấm vòng tròn', 'dot.o', '\\odot'),
    T('Và', 'and', '\\wedge'), T('Hoặc', 'or', '\\vee'), T('Phủ định', 'not', '\\neg'), T('Hợp', 'union', '\\cup'), T('Giao', 'inter', '\\cap'), T('Hiệu tập hợp', 'without', '\\setminus'),
    T('Chia hết', 'divides', '\\mid'), T('Không chia hết', 'divides.not', '\\nmid'), T('Giai thừa', '⟦n⟧!', '⟦n⟧!'), T('Chia lấy dư', '⟦a⟧ "mod" b', '⟦a⟧ \\bmod b'), T('Phần trăm', '%', '\\%'),
  ]),
  cat('Toán', 'arrow', 'Mũi tên', '→', [
    T('Mũi tên phải', 'arrow.r', '\\to'), T('Mũi tên trái', 'arrow.l', '\\leftarrow'), T('Mũi tên lên', 'arrow.t', '\\uparrow'), T('Mũi tên xuống', 'arrow.b', '\\downarrow'),
    T('Hai chiều', 'arrow.l.r', '\\leftrightarrow'), T('Suy ra', 'arrow.r.double', '\\Rightarrow'), T('Được suy ra từ', 'arrow.l.double', '\\Leftarrow'), T('Tương đương', 'arrow.l.r.double', '\\Leftrightarrow'),
    T('Suy ra (dài)', 'arrow.r.long.double', '\\implies'), T('Tương đương (dài)', 'arrow.l.r.long.double', '\\iff'), T('Mũi tên dài phải', 'arrow.r.long', '\\longrightarrow'), T('Ánh xạ tới', 'arrow.r.bar', '\\mapsto'),
    T('Mũi tên móc', 'arrow.r.hook', '\\hookrightarrow'), T('Chéo lên phải', 'arrow.tr', '\\nearrow'), T('Chéo xuống phải', 'arrow.br', '\\searrow'), T('Chéo lên trái', 'arrow.tl', '\\nwarrow'), T('Chéo xuống trái', 'arrow.bl', '\\swarrow'),
    T('Cân bằng (⇌)', 'harpoons.rtlb', '\\rightleftharpoons'), T('Lưỡi câu phải', 'harpoon.rt', '\\rightharpoonup'), T('Uốn lượn', 'arrow.r.squiggly', '\\leadsto'),
  ]),
  cat('Toán', 'set', 'Tập hợp & logic', '∈', [
    T('Thuộc', 'in', '\\in'), T('Không thuộc', 'in.not', '\\notin'), T('Chứa phần tử', 'in.rev', '\\ni'), T('Tập con', 'subset', '\\subset'), T('Tập con hoặc bằng', 'subset.eq', '\\subseteq'),
    T('Không là tập con', 'subset.not', '\\not\\subset'), T('Chứa', 'supset', '\\supset'), T('Chứa hoặc bằng', 'supset.eq', '\\supseteq'), T('Hợp', 'union', '\\cup'), T('Giao', 'inter', '\\cap'),
    T('Tập rỗng', 'emptyset', '\\emptyset'), T('Hiệu', 'without', '\\setminus'), T('Với mọi', 'forall', '\\forall'), T('Tồn tại', 'exists', '\\exists'), T('Không tồn tại', 'exists.not', '\\nexists'),
    T('Suy ra (logic)', 'tack.r', '\\vdash'), T('Do đó', 'therefore', '\\therefore'), T('Vì', 'because', '\\because'),
    T('Số tự nhiên ℕ', 'NN', '\\mathbb{N}'), T('Số nguyên ℤ', 'ZZ', '\\mathbb{Z}'), T('Số hữu tỉ ℚ', 'QQ', '\\mathbb{Q}'), T('Số thực ℝ', 'RR', '\\mathbb{R}'), T('Số phức ℂ', 'CC', '\\mathbb{C}'),
    T('Tập nghiệm', 'S = {⟦x⟧ in RR | x^2 - 3x + 2 <= 0}', 'S = \\{⟦x⟧ \\in \\mathbb{R} \\mid x^2-3x+2 \\le 0\\}'), T('Số phần tử', '|⟦A⟧|', '|⟦A⟧|'),
  ]),
  cat('Toán', 'greek', 'Chữ Hy Lạp', 'α', [...greekLow, ...greekUp]),
  cat('Toán', 'misc', 'Ký hiệu khác', '∞', [
    T('Vô cực', 'oo', '\\infty'), T('Đạo hàm riêng ∂', 'partial', '\\partial'), T('Nabla ∇', 'nabla', '\\nabla'), T('Độ (°)', 'degree', '^\\circ'), T('Phút (′)', 'prime', "'"), T('Giây (″)', 'prime.double', "''"),
    T('Góc', 'angle', '\\angle'), T('Góc vuông', 'angle.right', '\\measuredangle'), T('Tam giác', 'triangle.stroked.t', '\\triangle'), T('Hình vuông', 'square.stroked', '\\square'), T('Đường kính', 'diameter', '\\varnothing'),
    T('Ba chấm ngang', 'dots.h', '\\ldots'), T('Ba chấm giữa', 'dots.h.c', '\\cdots'), T('Ba chấm dọc', 'dots.v', '\\vdots'), T('Ba chấm chéo', 'dots.down', '\\ddots'),
    T('Đánh dấu ✓', 'checkmark', '\\checkmark'), T('Chữ ℓ', 'ell', '\\ell'), T('Aleph', 'aleph', '\\aleph'), T('Gạch dọc', 'bar.v', '|'), T('Gạch dọc đôi', 'bar.v.double', '\\|'), T('Kết thúc chứng minh', 'qed', '\\blacksquare'),
    T('Euro', 'euro', '\\euro'), T('Chữ ħ (Planck rút gọn)', '"ħ"', '\\hbar'),
  ]),
  cat('Toán', 'text', 'Chữ & khoảng cách', 'T', [
    T('Chữ thường (văn bản)', '"⟦nếu⟧"', '\\text{⟦nếu⟧}'), T('Chữ đậm', 'bold(⟦x⟧)', '\\mathbf{⟦x⟧}'), T('Chữ nghiêng', 'italic(⟦x⟧)', '\\mathit{⟦x⟧}'), T('Chữ đứng', 'upright(⟦x⟧)', '\\mathrm{⟦x⟧}'),
    T('Chữ rỗng (ℝ)', 'bb(⟦R⟧)', '\\mathbb{⟦R⟧}'), T('Chữ thư pháp', 'cal(⟦A⟧)', '\\mathcal{⟦A⟧}'), T('Chữ Gô-tích', 'frak(⟦g⟧)', '\\mathfrak{⟦g⟧}'), T('Chữ không chân', 'sans(⟦x⟧)', '\\mathsf{⟦x⟧}'), T('Chữ đánh máy', 'mono(⟦x⟧)', '\\mathtt{⟦x⟧}'),
    T('Cách nhỏ', 'thin', '\\,'), T('Cách vừa', 'med', '\\:'), T('Cách rộng', 'thick', '\\;'), T('Cách 1 chữ M', 'quad', '\\quad'), T('Cách 2 chữ M', 'wide', '\\qquad'),
  ]),
  cat('Toán', 'frac', 'Phân số & căn', '½', [
    T('Phân số', '(⟦a⟧)/(b)', '\\frac{⟦a⟧}{b}'), T('Phân số nghiêng', '⟦a⟧ slash b', '⟦a⟧/b'), T('Căn bậc hai', 'sqrt(⟦x⟧)', '\\sqrt{⟦x⟧}'), T('Căn bậc n', 'root(⟦n⟧, x)', '\\sqrt[⟦n⟧]{x}'),
    T('Căn bậc ba', 'root(3, ⟦x⟧)', '\\sqrt[3]{⟦x⟧}'), T('Hỗn số', '⟦2⟧ 1/2', '⟦2⟧\\frac12'), T('Phân số liên tiếp', '1 + 1/(1 + 1/⟦x⟧)', '1+\\cfrac{1}{1+\\cfrac{1}{⟦x⟧}}'),
    T('Tổ hợp nhị thức', 'binom(⟦n⟧, k)', '\\binom{⟦n⟧}{k}'), T('Tổ hợp Cₙᵏ', 'C_⟦n⟧^k', 'C_{⟦n⟧}^{k}'), T('Chỉnh hợp Aₙᵏ', 'A_⟦n⟧^k', 'A_{⟦n⟧}^{k}'), T('Hoán vị Pₙ', 'P_⟦n⟧', 'P_{⟦n⟧}'),
    T('Đạo hàm dy/dx', '(dif ⟦y⟧)/(dif x)', '\\frac{\\mathrm{d}⟦y⟧}{\\mathrm{d}x}'), T('Đạo hàm riêng', '(partial ⟦f⟧)/(partial x)', '\\frac{\\partial ⟦f⟧}{\\partial x}'), T('Đạo hàm cấp hai', '(dif^2 ⟦y⟧)/(dif x^2)', '\\frac{\\mathrm{d}^2 ⟦y⟧}{\\mathrm{d}x^2}'),
    T('Nghiệm bậc hai', 'x = (-b plus.minus sqrt(b^2 - 4a c))/(2a)', 'x=\\frac{-b\\pm\\sqrt{b^2-4ac}}{2a}'), T('Phân số ba tầng', '(⟦a⟧)/(b)/(c)', '\\frac{\\frac{⟦a⟧}{b}}{c}'),
  ]),
  cat('Toán', 'sup', 'Mũ & chỉ số', 'x²', [
    T('Số mũ', '⟦x⟧^n', '⟦x⟧^{n}'), T('Chỉ số dưới', '⟦x⟧_n', '⟦x⟧_{n}'), T('Mũ và chỉ số', '⟦x⟧_i^n', '⟦x⟧_{i}^{n}'), T('Bình phương', '⟦x⟧^2', '⟦x⟧^2'), T('Lập phương', '⟦x⟧^3', '⟦x⟧^3'),
    T('Nghịch đảo (mũ −1)', '⟦x⟧^(-1)', '⟦x⟧^{-1}'), T('Lũy thừa của e', 'e^(⟦x⟧)', 'e^{⟦x⟧}'), T('Lũy thừa của 10', '10^(⟦n⟧)', '10^{⟦n⟧}'), T('Chỉ số n+1', 'a_(⟦n⟧+1)', 'a_{⟦n⟧+1}'),
    T('Chỉ số hai chiều', 'x_(⟦1⟧,2)', 'x_{⟦1⟧,2}'), T('Mũ chồng', 'a^(b^⟦c⟧)', 'a^{b^{⟦c⟧}}'), T('Hai dấu phẩy (đạo hàm)', "⟦f⟧''(x)", "⟦f⟧''(x)"), T('Dấu sao trên', '⟦z⟧^ast', '⟦z⟧^{*}'),
    T('Mũ trái, chỉ số trái', 'attach(⟦X⟧, tl: A, bl: Z)', '{}^{A}_{Z}⟦X⟧'), T('Chỉ số phải trên-dưới', 'attach(⟦x⟧, tr: a, br: b)', '⟦x⟧^{a}_{b}'),
  ]),
  cat('Toán', 'brk', 'Ngoặc & khoảng', '( )', [
    T('Ngoặc tròn', '(⟦x⟧)', '\\left(⟦x⟧\\right)'), T('Ngoặc vuông', '[⟦x⟧]', '\\left[⟦x⟧\\right]'), T('Ngoặc nhọn', '{⟦x⟧}', '\\left\\{⟦x⟧\\right\\}'),
    T('Giá trị tuyệt đối', 'abs(⟦x⟧)', '\\left|⟦x⟧\\right|'), T('Chuẩn', 'norm(⟦x⟧)', '\\left\\|⟦x⟧\\right\\|'), T('Phần nguyên (sàn)', 'floor(⟦x⟧)', '\\lfloor ⟦x⟧\\rfloor'), T('Trần', 'ceil(⟦x⟧)', '\\lceil ⟦x⟧\\rceil'),
    T('Ngoặc góc', 'chevron.l ⟦x⟧ chevron.r', '\\langle ⟦x⟧\\rangle'), T('Khoảng mở (a; b)', '(⟦a⟧; b)', '(⟦a⟧;b)'), T('Đoạn [a; b]', '[⟦a⟧; b]', '[⟦a⟧;b]'),
    T('Nửa khoảng [a; b)', '[⟦a⟧; b)', '[⟦a⟧;b)'), T('Nửa khoảng (a; b]', '(⟦a⟧; b]', '(⟦a⟧;b]'), T('Khoảng (−∞; +∞)', '(-oo; +oo)', '(-\\infty;+\\infty)'), T('Hợp các khoảng', '(-oo; ⟦a⟧] union [b; +oo)', '(-\\infty;⟦a⟧]\\cup[b;+\\infty)'),
    T('Tập hợp mô tả', '{⟦x⟧ in RR | x > 0}', '\\{⟦x⟧\\in\\mathbb{R}\\mid x>0\\}'), T('Ngoặc lớn bao phân số', '((⟦a⟧)/(b))^n', '\\left(\\frac{⟦a⟧}{b}\\right)^n'),
  ]),
  cat('Toán', 'acc', 'Dấu trên chữ', 'â', [
    T('Véc-tơ (mũi tên)', 'arrow(⟦A B⟧)', '\\overrightarrow{⟦AB⟧}'), T('Mũ (^)', 'hat(⟦A⟧)', '\\hat{⟦A⟧}'), T('Mũ rộng', 'hat(⟦A B C⟧)', '\\widehat{⟦ABC⟧}'), T('Ngã (~)', 'tilde(⟦x⟧)', '\\tilde{⟦x⟧}'),
    T('Gạch ngang trên', 'overline(⟦A B⟧)', '\\overline{⟦AB⟧}'), T('Gạch ngang dưới', 'underline(⟦x⟧)', '\\underline{⟦x⟧}'), T('Chấm trên', 'dot(⟦x⟧)', '\\dot{⟦x⟧}'), T('Hai chấm trên', 'dot.double(⟦x⟧)', '\\ddot{⟦x⟧}'),
    T('Dấu sắc', 'acute(⟦x⟧)', "\\acute{⟦x⟧}"), T('Dấu huyền', 'grave(⟦x⟧)', '\\grave{⟦x⟧}'), T('Dấu breve', 'breve(⟦x⟧)', '\\breve{⟦x⟧}'), T('Dấu caron', 'caron(⟦x⟧)', '\\check{⟦x⟧}'),
    T('Ngoặc nhọn dưới', 'underbrace(⟦a + b⟧, "chú thích")', '\\underbrace{⟦a+b⟧}_{\\text{chú thích}}'), T('Ngoặc nhọn trên', 'overbrace(⟦a + b⟧, "chú thích")', '\\overbrace{⟦a+b⟧}^{\\text{chú thích}}'),
    T('Cung AB', 'overparen(⟦A B⟧)', '\\overset{\\frown}{⟦AB⟧}'), T('Mũi tên hai chiều trên', 'accent(⟦A B⟧, arrow.l.r)', '\\overleftrightarrow{⟦AB⟧}'),
  ]),
  cat('Toán', 'sum', 'Tổng, tích, giới hạn', 'Σ', [
    T('Tổng Σ', 'sum_(⟦k=1⟧)^n a_k', '\\sum_{⟦k=1⟧}^{n} a_k'), T('Tích Π', 'product_(⟦k=1⟧)^n a_k', '\\prod_{⟦k=1⟧}^{n} a_k'), T('Tổng kép', 'sum_(⟦i=1⟧)^n sum_(j=1)^m a_(i j)', '\\sum_{⟦i=1⟧}^{n}\\sum_{j=1}^{m} a_{ij}'),
    T('Tổng theo tập', 'sum_(⟦i in I⟧) a_i', '\\sum_{⟦i\\in I⟧} a_i'), T('Hợp nhiều tập', 'union.big_(⟦i=1⟧)^n A_i', '\\bigcup_{⟦i=1⟧}^{n} A_i'), T('Giao nhiều tập', 'inter.big_(⟦i=1⟧)^n A_i', '\\bigcap_{⟦i=1⟧}^{n} A_i'),
    T('Giới hạn x→a', 'lim_(x -> ⟦a⟧) f(x)', '\\lim_{x\\to ⟦a⟧} f(x)'), T('Giới hạn x→+∞', 'lim_(x -> +oo) ⟦f(x)⟧', '\\lim_{x\\to+\\infty} ⟦f(x)⟧'), T('Giới hạn x→−∞', 'lim_(x -> -oo) ⟦f(x)⟧', '\\lim_{x\\to-\\infty} ⟦f(x)⟧'),
    T('Giới hạn bên phải', 'lim_(x -> ⟦a⟧^+) f(x)', '\\lim_{x\\to ⟦a⟧^{+}} f(x)'), T('Giới hạn bên trái', 'lim_(x -> ⟦a⟧^-) f(x)', '\\lim_{x\\to ⟦a⟧^{-}} f(x)'), T('Giới hạn dãy số', 'lim_(n -> oo) ⟦u_n⟧', '\\lim_{n\\to\\infty} ⟦u_n⟧'),
    T('Giá trị lớn nhất', 'max_(⟦x in D⟧) f(x)', '\\max_{⟦x\\in D⟧} f(x)'), T('Giá trị nhỏ nhất', 'min_(⟦x in D⟧) f(x)', '\\min_{⟦x\\in D⟧} f(x)'), T('Cận trên đúng', 'sup_(⟦x in D⟧) f(x)', '\\sup_{⟦x\\in D⟧} f(x)'), T('Cận dưới đúng', 'inf_(⟦x in D⟧) f(x)', '\\inf_{⟦x\\in D⟧} f(x)'),
  ]),
  cat('Toán', 'int', 'Tích phân', '∫', [
    T('Nguyên hàm', 'integral ⟦f(x)⟧ dif x', '\\int ⟦f(x)⟧\\,dx'), T('Tích phân xác định', 'integral_⟦a⟧^b f(x) dif x', '\\int_{⟦a⟧}^{b} f(x)\\,dx'), T('Tích phân từ −∞ đến +∞', 'integral_(-oo)^(+oo) ⟦f(x)⟧ dif x', '\\int_{-\\infty}^{+\\infty} ⟦f(x)⟧\\,dx'),
    T('Tích phân kép', 'integral.double_⟦D⟧ f(x, y) dif x dif y', '\\iint_{⟦D⟧} f(x,y)\\,dx\\,dy'), T('Tích phân bội ba', 'integral.triple_⟦V⟧ f dif V', '\\iiint_{⟦V⟧} f\\,dV'), T('Tích phân đường kín', 'integral.cont_⟦C⟧ ⟦f⟧ dif s', '\\oint_{⟦C⟧} f\\,ds'),
    T('Cận thế (F(x) từ a đến b)', 'attach(lr([⟦F(x)⟧]), br: a, tr: b)', '\\left[⟦F(x)⟧\\right]_{a}^{b}'), T('Thể tích tròn xoay', 'V = pi integral_⟦a⟧^b [f(x)]^2 dif x', 'V=\\pi\\int_{⟦a⟧}^{b}[f(x)]^2\\,dx'),
    T('Diện tích hình phẳng', 'S = integral_⟦a⟧^b abs(f(x) - g(x)) dif x', 'S=\\int_{⟦a⟧}^{b}|f(x)-g(x)|\\,dx'), T('Vi phân dx', 'dif ⟦x⟧', '\\mathrm{d}⟦x⟧'), T('Đạo hàm f′(x)', "⟦f⟧'(x)", "⟦f⟧'(x)"),
  ]),
  cat('Toán', 'mat', 'Hệ & ma trận', '{', [
    T('Hệ 2 phương trình', 'cases(⟦x + y = 1⟧, x - y = 0)', '\\begin{cases} ⟦x+y=1⟧ \\\\ x-y=0 \\end{cases}'), T('Hệ 3 phương trình', 'cases(⟦x + y + z = 1⟧, x - y = 0, y + z = 2)', '\\begin{cases} ⟦x+y+z=1⟧ \\\\ x-y=0 \\\\ y+z=2 \\end{cases}'),
    T('Hàm nhiều nhánh', 'f(x) = cases(⟦x^2⟧ & "nếu" x >= 0, -x & "nếu" x < 0)', 'f(x)=\\begin{cases} ⟦x^2⟧ & x\\ge0 \\\\ -x & x<0 \\end{cases}'),
    T('Ma trận 2×2', 'mat(⟦a⟧, b; c, d)', '\\begin{pmatrix} ⟦a⟧ & b \\\\ c & d \\end{pmatrix}'), T('Ma trận 3×3', 'mat(⟦a_11⟧, a_12, a_13; a_21, a_22, a_23; a_31, a_32, a_33)', '\\begin{pmatrix} ⟦a_{11}⟧ & a_{12} & a_{13} \\\\ a_{21} & a_{22} & a_{23} \\\\ a_{31} & a_{32} & a_{33} \\end{pmatrix}'),
    T('Ma trận 2×3', 'mat(⟦a⟧, b, c; d, e, f)', '\\begin{pmatrix} ⟦a⟧ & b & c \\\\ d & e & f \\end{pmatrix}'), T('Ma trận ngoặc vuông', 'mat(delim: "[", ⟦a⟧, b; c, d)', '\\begin{bmatrix} ⟦a⟧ & b \\\\ c & d \\end{bmatrix}'),
    T('Định thức 2×2', 'mat(delim: "|", ⟦a⟧, b; c, d)', '\\begin{vmatrix} ⟦a⟧ & b \\\\ c & d \\end{vmatrix}'), T('Định thức 3×3', 'mat(delim: "|", ⟦a⟧, b, c; d, e, f; g, h, i)', '\\begin{vmatrix} ⟦a⟧ & b & c \\\\ d & e & f \\\\ g & h & i \\end{vmatrix}'),
    T('Véc-tơ cột 2', 'vec(⟦x⟧, y)', '\\begin{pmatrix} ⟦x⟧ \\\\ y \\end{pmatrix}'), T('Véc-tơ cột 3', 'vec(⟦x⟧, y, z)', '\\begin{pmatrix} ⟦x⟧ \\\\ y \\\\ z \\end{pmatrix}'),
    T('Ma trận đơn vị', 'mat(1, 0; 0, 1)', '\\begin{pmatrix} 1 & 0 \\\\ 0 & 1 \\end{pmatrix}'), T('Ma trận chuyển vị', '⟦A⟧^T', '⟦A⟧^{T}'), T('Ma trận nghịch đảo', '⟦A⟧^(-1)', '⟦A⟧^{-1}'),
    T('Nhiều dòng căn theo dấu =', '⟦a⟧ &= b + c \\ d &= e', '\\begin{aligned} ⟦a⟧ &= b+c \\\\ d &= e \\end{aligned}'),
  ]),
  cat('Toán', 'fn', 'Hàm số', 'f(x)', [
    ...['sin', 'cos', 'tan', 'cot', 'arcsin', 'arccos', 'arctan', 'sinh', 'cosh', 'tanh', 'ln', 'lg', 'exp'].map(f => T(f === 'lg' ? 'lg (logarit thập phân)' : f === 'ln' ? 'ln (logarit tự nhiên)' : f, `${f} ⟦x⟧`, `\\${f === 'lg' ? 'lg' : f} ⟦x⟧`)),
    T('Logarit cơ số a', 'log_⟦a⟧ x', '\\log_{⟦a⟧} x'), T('sec', 'sec ⟦x⟧', '\\sec ⟦x⟧'), T('csc', 'csc ⟦x⟧', '\\csc ⟦x⟧'),
    T('Hàm f(x)', 'f(⟦x⟧)', 'f(⟦x⟧)'), T('Hàm ngược', 'f^(-1)(⟦x⟧)', 'f^{-1}(⟦x⟧)'), T('Hàm hợp', 'f compose g', 'f \\circ g'), T('Ánh xạ f: ℝ→ℝ', 'f: RR -> RR', 'f:\\mathbb{R}\\to\\mathbb{R}'), T('Ánh xạ x ↦ f(x)', '⟦x⟧ |-> f(x)', '⟦x⟧\\mapsto f(x)'),
    T('Min', 'min(⟦a⟧, b)', '\\min(⟦a⟧,b)'), T('Max', 'max(⟦a⟧, b)', '\\max(⟦a⟧,b)'), T('Ước chung lớn nhất', 'gcd(⟦a⟧, b)', '\\gcd(⟦a⟧,b)'), T('Bội chung nhỏ nhất', 'lcm(⟦a⟧, b)', '\\operatorname{lcm}(⟦a⟧,b)'), T('Dấu hàm sgn', 'op("sgn")(⟦x⟧)', '\\operatorname{sgn}(⟦x⟧)'),
    T('Phần thực', 'Re(⟦z⟧)', '\\operatorname{Re}(⟦z⟧)'), T('Phần ảo', 'Im(⟦z⟧)', '\\operatorname{Im}(⟦z⟧)'), T('Đạo hàm', "⟦y⟧' = f'(x)", "⟦y⟧'=f'(x)"),
  ]),
  cat('Toán', 'geo', 'Hình học', '△', [
    T('Góc ABC', 'angle ⟦A B C⟧', '\\angle ⟦ABC⟧'), T('Số đo góc', 'hat(⟦A⟧) = 60 degree', '\\widehat{⟦A⟧}=60^\\circ'), T('Góc vuông', 'angle ⟦A B C⟧ = 90 degree', '\\angle ⟦ABC⟧=90^\\circ'), T('Tam giác ABC', 'triangle.stroked.t ⟦A B C⟧', '\\triangle ⟦ABC⟧'),
    T('Song song', '⟦A B⟧ parallel C D', '⟦AB⟧\\parallel CD'), T('Vuông góc', '⟦A B⟧ perp C D', '⟦AB⟧\\perp CD'), T('Đồng dạng', 'triangle.stroked.t ⟦A B C⟧ tilde.op triangle.stroked.t D E F', '\\triangle ⟦ABC⟧\\sim\\triangle DEF'), T('Bằng nhau (tam giác)', 'triangle.stroked.t ⟦A B C⟧ tilde.equiv triangle.stroked.t D E F', '\\triangle ⟦ABC⟧\\cong\\triangle DEF'),
    T('Véc-tơ AB', 'arrow(⟦A B⟧)', '\\overrightarrow{⟦AB⟧}'), T('Độ dài véc-tơ', 'abs(arrow(⟦A B⟧))', '\\left|\\overrightarrow{⟦AB⟧}\\right|'), T('Tích vô hướng', 'arrow(⟦u⟧) dot arrow(v) = abs(arrow(u)) abs(arrow(v)) cos alpha', '\\vec{⟦u⟧}\\cdot\\vec{v}=|\\vec{u}||\\vec{v}|\\cos\\alpha'),
    T('Tích có hướng', 'arrow(⟦u⟧) times arrow(v)', '\\vec{⟦u⟧}\\times\\vec{v}'), T('Tọa độ véc-tơ', 'arrow(⟦u⟧) = (x; y; z)', '\\vec{⟦u⟧}=(x;y;z)'), T('Tọa độ điểm', 'M(⟦x_0⟧; y_0; z_0)', 'M(⟦x_0⟧;y_0;z_0)'),
    T('Khoảng cách điểm - đường thẳng', 'd(M, Delta) = abs(a x_0 + b y_0 + c)/sqrt(a^2 + b^2)', 'd(M,\\Delta)=\\frac{|ax_0+by_0+c|}{\\sqrt{a^2+b^2}}'), T('Phương trình đường tròn', '(x - ⟦a⟧)^2 + (y - b)^2 = R^2', '(x-⟦a⟧)^2+(y-b)^2=R^2'),
    T('Phương trình elip', 'x^2/⟦a⟧^2 + y^2/b^2 = 1', '\\frac{x^2}{⟦a⟧^2}+\\frac{y^2}{b^2}=1'), T('Phương trình hypebol', 'x^2/⟦a⟧^2 - y^2/b^2 = 1', '\\frac{x^2}{⟦a⟧^2}-\\frac{y^2}{b^2}=1'), T('Parabol', 'y^2 = 2⟦p⟧ x', 'y^2=2⟦p⟧x'),
    T('Đường thẳng tham số', 'cases(x = ⟦x_0⟧ + a t, y = y_0 + b t, z = z_0 + c t)', '\\begin{cases} x=⟦x_0⟧+at \\\\ y=y_0+bt \\\\ z=z_0+ct \\end{cases}'), T('Mặt phẳng', '⟦A⟧ x + B y + C z + D = 0', '⟦A⟧x+By+Cz+D=0'),
    T('Định lý Pytago', '⟦A B⟧^2 = A C^2 + B C^2', '⟦AB⟧^2=AC^2+BC^2'), T('Định lý sin', 'a/(sin ⟦A⟧) = b/(sin B) = c/(sin C) = 2R', '\\frac{a}{\\sin ⟦A⟧}=\\frac{b}{\\sin B}=\\frac{c}{\\sin C}=2R'), T('Định lý cos', 'a^2 = b^2 + c^2 - 2 b c cos ⟦A⟧', 'a^2=b^2+c^2-2bc\\cos ⟦A⟧'),
    T('Diện tích tam giác', 'S = 1/2 ⟦a⟧ b sin C', 'S=\\frac12 ⟦a⟧ b\\sin C'), T('Thể tích khối chóp', 'V = 1/3 S_"đáy" dot ⟦h⟧', 'V=\\frac13 S_{\\text{đáy}}\\cdot ⟦h⟧'), T('Thể tích khối cầu', 'V = 4/3 pi ⟦r⟧^3', 'V=\\frac43\\pi ⟦r⟧^3'),
    T('Diện tích xung quanh trụ', 'S_"xq" = 2 pi ⟦r⟧ h', 'S_{xq}=2\\pi ⟦r⟧ h'), T('Diện tích mặt cầu', 'S = 4 pi ⟦r⟧^2', 'S=4\\pi ⟦r⟧^2'), T('Cung AB', 'overparen(⟦A B⟧)', '\\overset{\\frown}{⟦AB⟧}'),
  ]),
  cat('Toán', 'prob', 'Xác suất & thống kê', 'P', [
    T('Xác suất P(A)', 'P(⟦A⟧)', 'P(⟦A⟧)'), T('Xác suất có điều kiện', 'P(⟦A⟧ | B) = (P(A inter B))/P(B)', 'P(⟦A⟧\\mid B)=\\frac{P(A\\cap B)}{P(B)}'), T('Xác suất cổ điển', 'P(⟦A⟧) = n(A)/n(Omega)', 'P(⟦A⟧)=\\frac{n(A)}{n(\\Omega)}'),
    T('Biến cố đối', 'P(overline(⟦A⟧)) = 1 - P(A)', 'P(\\overline{⟦A⟧})=1-P(A)'), T('Cộng xác suất', 'P(⟦A⟧ union B) = P(A) + P(B) - P(A inter B)', 'P(⟦A⟧\\cup B)=P(A)+P(B)-P(A\\cap B)'), T('Nhân xác suất', 'P(⟦A⟧ inter B) = P(A) P(B)', 'P(⟦A⟧\\cap B)=P(A)P(B)'),
    T('Bernoulli', 'C_⟦n⟧^k p^k (1 - p)^(n - k)', 'C_{⟦n⟧}^{k}p^k(1-p)^{n-k}'), T('Kì vọng', 'E(⟦X⟧) = sum x_i p_i', 'E(⟦X⟧)=\\sum x_i p_i'), T('Phương sai', 'V(⟦X⟧) = E(X^2) - (E(X))^2', 'V(⟦X⟧)=E(X^2)-(E(X))^2'), T('Độ lệch chuẩn', 'sigma(⟦X⟧) = sqrt(V(X))', '\\sigma(⟦X⟧)=\\sqrt{V(X)}'),
    T('Số trung bình', 'overline(x) = (sum_(i=1)^n ⟦x_i⟧)/n', '\\overline{x}=\\frac{\\sum_{i=1}^{n} ⟦x_i⟧}{n}'), T('Phương sai mẫu', 's^2 = 1/n sum_(i=1)^n (⟦x_i⟧ - overline(x))^2', 's^2=\\frac1n\\sum_{i=1}^{n}(⟦x_i⟧-\\overline{x})^2'), T('Số phần tử n(A)', 'n(⟦A⟧)', 'n(⟦A⟧)'),
    T('Biến cố hợp', '⟦A⟧ union B', '⟦A⟧\\cup B'), T('Biến cố giao', '⟦A⟧ inter B', '⟦A⟧\\cap B'),
  ]),
  cat('Toán', 'cplx', 'Số phức & dãy số', 'i', [
    T('Số phức dạng đại số', 'z = ⟦a⟧ + b i', 'z=⟦a⟧+bi'), T('Mô-đun', 'abs(⟦z⟧) = sqrt(a^2 + b^2)', '|⟦z⟧|=\\sqrt{a^2+b^2}'), T('Số phức liên hợp', 'overline(⟦z⟧) = a - b i', '\\overline{⟦z⟧}=a-bi'), T('Dạng lượng giác', 'z = r (cos ⟦phi⟧ + i sin phi)', 'z=r(\\cos ⟦\\varphi⟧+i\\sin\\varphi)'),
    T('Công thức Moivre', '(cos ⟦phi⟧ + i sin phi)^n = cos n phi + i sin n phi', '(\\cos ⟦\\varphi⟧+i\\sin\\varphi)^n=\\cos n\\varphi+i\\sin n\\varphi'), T('Công thức Euler', 'e^(i ⟦phi⟧) = cos phi + i sin phi', 'e^{i ⟦\\varphi⟧}=\\cos\\varphi+i\\sin\\varphi'),
    T('Cấp số cộng (số hạng tổng quát)', 'u_n = u_1 + (⟦n⟧ - 1) d', 'u_n=u_1+(⟦n⟧-1)d'), T('Cấp số cộng (tổng)', 'S_n = (⟦n⟧(u_1 + u_n))/2', 'S_n=\\frac{⟦n⟧(u_1+u_n)}{2}'), T('Cấp số nhân (số hạng)', 'u_n = u_1 q^(⟦n⟧ - 1)', 'u_n=u_1q^{⟦n⟧-1}'), T('Cấp số nhân (tổng)', 'S_n = u_1 (1 - q^⟦n⟧)/(1 - q)', 'S_n=u_1\\frac{1-q^{⟦n⟧}}{1-q}'),
    T('Tổng cấp số nhân lùi vô hạn', 'S = u_1/(1 - ⟦q⟧)', 'S=\\frac{u_1}{1-⟦q⟧}'), T('Hằng đẳng thức hiệu hai bình phương', '⟦a⟧^2 - b^2 = (a - b)(a + b)', '⟦a⟧^2-b^2=(a-b)(a+b)'), T('Lập phương của tổng', '(⟦a⟧ + b)^3 = a^3 + 3a^2 b + 3a b^2 + b^3', '(⟦a⟧+b)^3=a^3+3a^2b+3ab^2+b^3'),
    T('Nhị thức Newton', '(⟦a⟧ + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k', '(⟦a⟧+b)^n=\\sum_{k=0}^{n}C_n^ka^{n-k}b^k'), T('Delta của bậc hai', 'Delta = b^2 - 4⟦a⟧ c', '\\Delta=b^2-4⟦a⟧c'), T('Định lý Viète', 'x_1 + x_2 = -b/⟦a⟧, quad x_1 x_2 = c/a', 'x_1+x_2=-\\frac{b}{⟦a⟧},\\quad x_1x_2=\\frac{c}{a}'),
  ]),
]

// ---------- LÝ ----------
const PHYS = [
  cat('Lý', 'punit', 'Đơn vị', 'm/s', [
    unit('mét', 'm'), unit('ki-lô-mét', 'km'), unit('xen-ti-mét', 'cm'), unit('mi-li-mét', 'mm'), unit('micro-mét', 'μm'), unit('na-nô-mét', 'nm'),
    unit('giây', 's'), unit('mili-giây', 'ms'), unit('giờ', 'h'), unit('ki-lô-gam', 'kg'), unit('gam', 'g'), unit('mi-li-gam', 'mg'),
    unit('niu-tơn', 'N'), unit('jun', 'J'), unit('ki-lô-jun', 'kJ'), unit('oát', 'W'), unit('ki-lô-oát giờ', 'kW.h'), unit('pa-xcan', 'Pa'), unit('héc', 'Hz'),
    unit('vôn', 'V'), unit('am-pe', 'A'), unit('ôm', 'Ω'), unit('fara', 'F'), unit('henry', 'H'), unit('tesla', 'T'), unit('vê-be', 'Wb'), unit('cu-lông', 'C'),
    unit('ken-vin', 'K'), unit('độ C', '°C'), unit('mol', 'mol'), unit('cơ-ăng-đê-la', 'cd'), unit('lumen', 'lm'), unit('lux', 'lx'), unit('electron-vôn', 'eV'), unit('MeV', 'MeV'), unit('u (đơn vị khối lượng nguyên tử)', 'u'),
    unit('mét trên giây', 'm/s'), unit('mét trên giây bình phương', 'm/s^2'), unit('ki-lô-mét trên giờ', 'km/h'), unit('niu-tơn trên mét', 'N/m'), unit('ki-lô-gam trên mét khối', 'kg/m^3'), unit('jun trên ki-lô-gam', 'J/kg'),
    unit('oát trên mét vuông', 'W/m^2'), unit('niu-tơn mét', 'N.m'), unit('mét vuông', 'm^2'), unit('mét khối', 'm^3'), unit('lít', 'L'), unit('ampe trên mét', 'A/m'), unit('vôn trên mét', 'V/m'),
    unit('ki-lô-gam mét trên giây', 'kg.m/s'), unit('rađian trên giây', 'rad/s'), unit('rađian', 'rad'), unit('atm', 'atm'), unit('calo', 'cal'), unit('bar', 'bar'),
  ]),
  cat('Lý', 'psym', 'Đại lượng & hằng số', 'ε₀', [
    T('Delta t (biến thiên)', 'Delta ⟦t⟧', '\\Delta ⟦t⟧'), T('Epsilon không (hằng số điện)', 'epsilon_0', '\\varepsilon_0'), T('Muy không (hằng số từ)', 'mu_0', '\\mu_0'), T('Hằng số Planck', 'h = 6.63 times 10^(-34) "J.s"', 'h=6.63\\times10^{-34}\\,\\mathrm{J.s}'),
    T('Hằng số Planck rút gọn', '"ħ"', '\\hbar'), T('Hằng số Boltzmann', 'k_B', 'k_B'), T('Số Avogadro', 'N_A = 6.02 times 10^23 "mol"^(-1)', 'N_A=6.02\\times10^{23}\\,\\mathrm{mol}^{-1}'),
    T('Tốc độ ánh sáng', 'c = 3 times 10^8 "m/s"', 'c=3\\times10^{8}\\,\\mathrm{m/s}'), T('Gia tốc trọng trường', 'g = 9.8 "m/s"^2', 'g=9.8\\,\\mathrm{m/s}^2'), T('Hằng số hấp dẫn', 'G = 6.67 times 10^(-11)', 'G=6.67\\times10^{-11}'),
    T('Điện tích nguyên tố', 'e = 1.6 times 10^(-19) "C"', 'e=1.6\\times10^{-19}\\,\\mathrm{C}'), T('Khối lượng electron', 'm_e', 'm_e'), T('Khối lượng proton', 'm_p', 'm_p'), T('Hằng số khí R', 'R = 8.31 "J/(mol.K)"', 'R=8.31\\,\\mathrm{J/(mol.K)}'),
    T('Lực (véc-tơ)', 'arrow(⟦F⟧)', '\\vec{⟦F⟧}'), T('Vận tốc (véc-tơ)', 'arrow(⟦v⟧)', '\\vec{⟦v⟧}'), T('Gia tốc (véc-tơ)', 'arrow(⟦a⟧)', '\\vec{⟦a⟧}'), T('Điện trường (véc-tơ)', 'arrow(⟦E⟧)', '\\vec{⟦E⟧}'), T('Từ trường (véc-tơ)', 'arrow(⟦B⟧)', '\\vec{⟦B⟧}'),
    T('Vận tốc đầu v₀', 'v_0', 'v_0'), T('Vị trí đầu x₀', 'x_0', 'x_0'), T('Bước sóng λ', 'lambda', '\\lambda'), T('Tần số f', 'f', 'f'), T('Tần số góc ω', 'omega', '\\omega'), T('Pha ban đầu φ', 'phi', '\\varphi'),
    T('Điện trở suất ρ', 'rho', '\\rho'), T('Hệ số ma sát μ', 'mu', '\\mu'), T('Hiệu suất η', 'eta', '\\eta'), T('Nhiệt độ T', 'T', 'T'), T('Nhiệt dung riêng c', 'c', 'c'), T('Biên độ A', 'A', 'A'),
  ]),
  cat('Lý', 'pmech', 'Động học & lực', 'F=ma', [
    T('Vận tốc trung bình', 'v = s/t', 'v=\\frac{s}{t}'), T('Vận tốc nhanh dần đều', 'v = v_0 + ⟦a⟧ t', 'v=v_0+⟦a⟧t'), T('Quãng đường', 's = v_0 t + 1/2 ⟦a⟧ t^2', 's=v_0t+\\frac12 ⟦a⟧t^2'), T('Hệ thức độc lập', 'v^2 - v_0^2 = 2 ⟦a⟧ s', 'v^2-v_0^2=2⟦a⟧s'),
    T('Rơi tự do', 'h = 1/2 g t^2', 'h=\\frac12gt^2'), T('Định luật II Niu-tơn', 'arrow(F) = m arrow(a)', '\\vec{F}=m\\vec{a}'), T('Trọng lực', 'P = m g', 'P=mg'), T('Lực ma sát', 'F_"ms" = mu N', 'F_{ms}=\\mu N'),
    T('Lực hướng tâm', 'F_"ht" = (m v^2)/r = m omega^2 r', 'F_{ht}=\\frac{mv^2}{r}=m\\omega^2r'), T('Lực hấp dẫn', 'F = G (m_1 m_2)/r^2', 'F=G\\frac{m_1m_2}{r^2}'), T('Lực đàn hồi', 'F = k abs(Delta l)', 'F=k|\\Delta l|'),
      ]),
  cat('Lý', 'pener', 'Công, năng lượng, động lượng', 'W_đ', [
    T('Công cơ học', 'A = F s cos alpha', 'A=Fs\\cos\\alpha'), T('Công suất', 'P = A/t', 'P=\\frac{A}{t}'), T('Động năng', 'W_d = 1/2 m v^2', 'W_d=\\frac12mv^2'), T('Thế năng trọng trường', 'W_t = m g h', 'W_t=mgh'), T('Thế năng đàn hồi', 'W_t = 1/2 k (Delta l)^2', 'W_t=\\frac12k(\\Delta l)^2'),
    T('Cơ năng', 'W = W_d + W_t', 'W=W_d+W_t'), T('Động lượng', 'arrow(p) = m arrow(v)', '\\vec{p}=m\\vec{v}'), T('Xung của lực', 'arrow(F) Delta t = Delta arrow(p)', '\\vec{F}\\Delta t=\\Delta\\vec{p}'), T('Mô-men lực', 'M = F d', 'M=Fd'), T('Áp suất', 'p = F/S', 'p=\\frac{F}{S}'), T('Lực đẩy Ác-si-mét', 'F_A = rho g V', 'F_A=\\rho gV'),
    T('Hiệu suất', 'H = A_"ci"/A_"tp" times 100%', 'H=\\frac{A_{ci}}{A_{tp}}\\times100\\%'), T('Chuyển động ném ngang (tầm bay xa)', 'L = v_0 sqrt((2h)/g)', 'L=v_0\\sqrt{\\frac{2h}{g}}'),
  ]),
  cat('Lý', 'posc', 'Dao động & sóng', '∿', [
    T('Phương trình dao động điều hòa', 'x = A cos(omega t + ⟦phi⟧)', 'x=A\\cos(\\omega t+⟦\\varphi⟧)'), T('Vận tốc dao động', 'v = -omega A sin(omega t + ⟦phi⟧)', 'v=-\\omega A\\sin(\\omega t+⟦\\varphi⟧)'), T('Gia tốc dao động', 'a = -omega^2 x', 'a=-\\omega^2x'),
    T('Tần số góc', 'omega = 2 pi f = (2 pi)/T', '\\omega=2\\pi f=\\frac{2\\pi}{T}'), T('Chu kì con lắc lò xo', 'T = 2 pi sqrt(m/k)', 'T=2\\pi\\sqrt{\\frac{m}{k}}'), T('Chu kì con lắc đơn', 'T = 2 pi sqrt(l/g)', 'T=2\\pi\\sqrt{\\frac{l}{g}}'),
    T('Cơ năng dao động', 'W = 1/2 k A^2 = 1/2 m omega^2 A^2', 'W=\\frac12kA^2=\\frac12m\\omega^2A^2'), T('Bước sóng', 'lambda = v/f = v T', '\\lambda=\\frac{v}{f}=vT'), T('Phương trình sóng', 'u = A cos(omega t - (2 pi d)/lambda)', 'u=A\\cos\\left(\\omega t-\\frac{2\\pi d}{\\lambda}\\right)'),
    T('Giao thoa (cực đại)', 'd_2 - d_1 = k lambda', 'd_2-d_1=k\\lambda'), T('Sóng dừng', 'l = k lambda/2', 'l=k\\frac{\\lambda}{2}'), T('Mức cường độ âm', 'L = 10 lg I/I_0', 'L=10\\lg\\frac{I}{I_0}'), T('Hiệu ứng Đốp-ple', "f' = f (v plus.minus v_M)/(v minus.plus v_S)", "f'=f\\frac{v\\pm v_M}{v\\mp v_S}"),
  ]),
  cat('Lý', 'pele', 'Điện học', 'I=U/R', [
    T('Định luật Ôm', 'I = U/R', 'I=\\frac{U}{R}'), T('Định luật Ôm toàn mạch', 'I = E/(R + r)', 'I=\\frac{E}{R+r}'), T('Điện trở dây dẫn', 'R = rho l/S', 'R=\\rho\\frac{l}{S}'), T('Công suất điện', 'P = U I', 'P=UI'), T('Nhiệt lượng tỏa ra', 'Q = I^2 R t', 'Q=I^2Rt'),
    T('Điện trở nối tiếp', 'R = R_1 + R_2', 'R=R_1+R_2'), T('Điện trở song song', '1/R = 1/R_1 + 1/R_2', '\\frac1R=\\frac1{R_1}+\\frac1{R_2}'), T('Định luật Cu-lông', 'F = k (abs(q_1 q_2))/(epsilon r^2)', 'F=k\\frac{|q_1q_2|}{\\varepsilon r^2}'),
    T('Cường độ điện trường', 'E = F/q = k abs(Q)/(epsilon r^2)', 'E=\\frac{F}{q}=k\\frac{|Q|}{\\varepsilon r^2}'), T('Hiệu điện thế', 'U = E d', 'U=Ed'), T('Điện dung', 'C = Q/U', 'C=\\frac{Q}{U}'), T('Năng lượng tụ điện', 'W = 1/2 C U^2', 'W=\\frac12CU^2'),
      ]),
  cat('Lý', 'pmag', 'Từ trường & điện xoay chiều', 'B', [
    T('Lực Lo-ren-xơ', 'F = abs(q) v B sin alpha', 'F=|q|vB\\sin\\alpha'), T('Lực từ', 'F = B I l sin alpha', 'F=BIl\\sin\\alpha'), T('Từ thông', 'Phi = B S cos alpha', '\\Phi=BS\\cos\\alpha'), T('Suất điện động cảm ứng', 'e = -(Delta Phi)/(Delta t)', 'e=-\\frac{\\Delta\\Phi}{\\Delta t}'),
    T('Cảm kháng', 'Z_L = omega L', 'Z_L=\\omega L'), T('Dung kháng', 'Z_C = 1/(omega C)', 'Z_C=\\frac{1}{\\omega C}'), T('Tổng trở', 'Z = sqrt(R^2 + (Z_L - Z_C)^2)', 'Z=\\sqrt{R^2+(Z_L-Z_C)^2}'), T('Độ lệch pha', 'tan phi = (Z_L - Z_C)/R', '\\tan\\varphi=\\frac{Z_L-Z_C}{R}'),
    T('Công suất mạch RLC', 'P = U I cos phi', 'P=UI\\cos\\varphi'), T('Chu kì mạch dao động LC', 'T = 2 pi sqrt(L C)', 'T=2\\pi\\sqrt{LC}'), T('Máy biến áp', 'U_1/U_2 = N_1/N_2', '\\frac{U_1}{U_2}=\\frac{N_1}{N_2}'), T('Điện áp xoay chiều', 'u = U_0 cos(omega t + ⟦phi⟧)', 'u=U_0\\cos(\\omega t+⟦\\varphi⟧)'),
  ]),
  cat('Lý', 'popt', 'Quang học & lượng tử', 'hν', [
    T('Công thức thấu kính', '1/f = 1/d + 1/(d\')', "\\frac1f=\\frac1d+\\frac1{d'}"), T('Số phóng đại', 'k = -(d\')/d = (A\'B\')/(A B)', "k=-\\frac{d'}{d}=\\frac{A'B'}{AB}"), T('Định luật khúc xạ', 'n_1 sin ⟦i⟧ = n_2 sin r', 'n_1\\sin ⟦i⟧=n_2\\sin r'), T('Góc giới hạn', 'sin i_"gh" = n_2/n_1', '\\sin i_{gh}=\\frac{n_2}{n_1}'),
    T('Khoảng vân', 'i = (lambda D)/a', 'i=\\frac{\\lambda D}{a}'), T('Năng lượng phô-tôn', 'epsilon = h f = (h c)/lambda', '\\varepsilon=hf=\\frac{hc}{\\lambda}'), T('Phương trình Anh-xtanh', 'h f = A + W_"đ"', 'hf=A+W_{đ}'), T('Bước sóng de Broglie', 'lambda = h/(m v)', '\\lambda=\\frac{h}{mv}'),
      ]),
  cat('Lý', 'pthm', 'Nhiệt học & chất khí', 'pV=nRT', [
    T('Nhiệt lượng', 'Q = m c Delta t', 'Q=mc\\Delta t'), T('Phương trình khí lí tưởng', 'p V = n R T', 'pV=nRT'), T('Quá trình đẳng nhiệt', 'p_1 V_1 = p_2 V_2', 'p_1V_1=p_2V_2'), T('Phương trình trạng thái', '(p_1 V_1)/T_1 = (p_2 V_2)/T_2', '\\frac{p_1V_1}{T_1}=\\frac{p_2V_2}{T_2}'),
    T('Nguyên lí I nhiệt động lực học', 'Delta U = A + Q', '\\Delta U=A+Q'), T('Nhiệt nóng chảy', 'Q = lambda m', 'Q=\\lambda m'),   ]),
  cat('Lý', 'pnuc', 'Hạt nhân & phóng xạ', '☢', [
    T('Hạt nhân nguyên tử', 'attach(⟦"X"⟧, tl: A, bl: Z)', '{}^{A}_{Z}\\mathrm{⟦X⟧}'), T('Định luật phóng xạ', 'N = N_0 e^(-lambda t) = N_0 2^(-t/T)', 'N=N_0e^{-\\lambda t}=N_02^{-t/T}'),
    T('Hằng số phóng xạ', 'lambda = (ln 2)/T', '\\lambda=\\frac{\\ln 2}{T}'), T('Năng lượng liên kết', 'W_"lk" = Delta m c^2', 'W_{lk}=\\Delta mc^2'), T('Độ hụt khối', 'Delta m = Z m_p + (A - Z) m_n - m_X', '\\Delta m=Zm_p+(A-Z)m_n-m_X'), T('Hệ thức Anh-xtanh', 'E = m c^2', 'E=mc^2'),
    T('Phản ứng phân rã α', 'attach("X", tl: A, bl: Z) -> attach("Y", tl: A-4, bl: Z-2) + attach("He", tl: 4, bl: 2)', '{}^{A}_{Z}X\\to{}^{A-4}_{Z-2}Y+{}^{4}_{2}He'),
  ]),
]

// ---------- HÓA ----------
const ELEMENTS = [
  ['H', 'Hiđro'], ['He', 'Heli'], ['Li', 'Liti'], ['Be', 'Beri'], ['B', 'Bo'], ['C', 'Cacbon'], ['N', 'Nitơ'], ['O', 'Oxi'], ['F', 'Flo'], ['Ne', 'Neon'],
  ['Na', 'Natri'], ['Mg', 'Magie'], ['Al', 'Nhôm'], ['Si', 'Silic'], ['P', 'Photpho'], ['S', 'Lưu huỳnh'], ['Cl', 'Clo'], ['Ar', 'Agon'], ['K', 'Kali'], ['Ca', 'Canxi'],
  ['Sc', 'Scanđi'], ['Ti', 'Titan'], ['V', 'Vanađi'], ['Cr', 'Crom'], ['Mn', 'Mangan'], ['Fe', 'Sắt'], ['Co', 'Coban'], ['Ni', 'Niken'], ['Cu', 'Đồng'], ['Zn', 'Kẽm'],
  ['Ga', 'Gali'], ['Ge', 'Gecmani'], ['As', 'Asen'], ['Br', 'Brom'], ['Kr', 'Kripton'], ['Rb', 'Rubiđi'], ['Sr', 'Stronti'], ['Ag', 'Bạc'], ['Sn', 'Thiếc'], ['I', 'Iot'],
  ['Ba', 'Bari'], ['W', 'Vonfram'], ['Pt', 'Bạch kim'], ['Au', 'Vàng'], ['Hg', 'Thủy ngân'], ['Pb', 'Chì'], ['Ra', 'Radi'], ['U', 'Urani'],
].map(([s, n]) => T(`${n} (${s})`, `"${s}"`, `\\mathrm{${s}}`, `nguyen to ${s}`))

const CHEM = [
  cat('Hóa', 'cel', 'Nguyên tố', 'Fe', ELEMENTS),
  cat('Hóa', 'cfor', 'Công thức chất', 'H₂O', [
    chem('Nước', 'H2O'), chem('Hiđro', 'H2'), chem('Oxi', 'O2'), chem('Nitơ', 'N2'), chem('Clo', 'Cl2'), chem('Ozon', 'O3'), chem('Cacbon đioxit', 'CO2'), chem('Cacbon oxit', 'CO'), chem('Lưu huỳnh đioxit', 'SO2'), chem('Lưu huỳnh trioxit', 'SO3'),
    chem('Axit clohiđric', 'HCl'), chem('Axit sunfuric', 'H2SO4'), chem('Axit nitric', 'HNO3'), chem('Axit photphoric', 'H3PO4'), chem('Axit axetic', 'CH3COOH'), chem('Axit cacbonic', 'H2CO3'), chem('Axit sunfuhiđric', 'H2S'),
    chem('Natri hiđroxit', 'NaOH'), chem('Kali hiđroxit', 'KOH'), chem('Canxi hiđroxit', 'Ca(OH)2'), chem('Bari hiđroxit', 'Ba(OH)2'), chem('Amoniac', 'NH3'), chem('Natri clorua', 'NaCl'), chem('Canxi cacbonat', 'CaCO3'),
    chem('Natri cacbonat', 'Na2CO3'), chem('Natri hiđrocacbonat', 'NaHCO3'), chem('Đồng(II) sunfat', 'CuSO4'), chem('Bạc nitrat', 'AgNO3'), chem('Sắt(III) oxit', 'Fe2O3'), chem('Sắt từ oxit', 'Fe3O4'), chem('Nhôm oxit', 'Al2O3'),
    chem('Kali pemanganat', 'KMnO4'), chem('Kali đicromat', 'K2Cr2O7'), chem('Hiđro peoxit', 'H2O2'), chem('Magie oxit', 'MgO'), chem('Canxi oxit', 'CaO'), chem('Kẽm oxit', 'ZnO'), chem('Amoni clorua', 'NH4Cl'), chem('Natri sunfat', 'Na2SO4'),
    chem('Bari sunfat', 'BaSO4'), chem('Sắt(III) clorua', 'FeCl3'), chem('Nhôm sunfat', 'Al2(SO4)3'), chem('Phèn chua', 'KAl(SO4)2'),
  ]),
  cat('Hóa', 'cion', 'Ion & nguyên tử', 'Na⁺', [
    chem('Ion natri', 'Na^+'), chem('Ion kali', 'K^+'), chem('Ion hiđro', 'H^+'), chem('Ion hiđroni', 'H3O^+'), chem('Ion amoni', 'NH4^+'), chem('Ion clorua', 'Cl^-'), chem('Ion hiđroxit', 'OH^-'), chem('Ion nitrat', 'NO3^-'),
    chem('Ion sunfat', 'SO4^2-'), chem('Ion cacbonat', 'CO3^2-'), chem('Ion photphat', 'PO4^3-'), chem('Ion hiđrocacbonat', 'HCO3^-'), chem('Ion canxi', 'Ca^2+'), chem('Ion magie', 'Mg^2+'), chem('Ion bari', 'Ba^2+'),
    chem('Ion đồng(II)', 'Cu^2+'), chem('Ion sắt(II)', 'Fe^2+'), chem('Ion sắt(III)', 'Fe^3+'), chem('Ion nhôm', 'Al^3+'), chem('Ion kẽm', 'Zn^2+'), chem('Ion bạc', 'Ag^+'), chem('Ion pemanganat', 'MnO4^-'),
    T('Electron', 'e^-', 'e^{-}'), T('Proton', 'p^+', 'p^{+}'), T('Nơtron', 'n', 'n'), T('Ký hiệu nguyên tử (A, Z)', 'attach(⟦"X"⟧, tl: A, bl: Z)', '{}^{A}_{Z}\\mathrm{⟦X⟧}'), T('Cấu hình electron', '1s^2 2s^2 2p^6 ⟦3s^1⟧', '1s^2 2s^2 2p^6 ⟦3s^1⟧'),
    T('Đồng vị cacbon-12', 'attach("C", tl: 12, bl: 6)', '{}^{12}_{6}\\mathrm{C}'), T('Hiđro nặng', 'attach("H", tl: 2, bl: 1)', '{}^{2}_{1}\\mathrm{H}'),
  ]),
  cat('Hóa', 'crx', 'Phản ứng', '⇌', [
    T('Mũi tên phản ứng', 'arrow.r', '\\to'), T('Phản ứng thuận nghịch', 'harpoons.rtlb', '\\rightleftharpoons'), T('Khí bay lên ↑', 'arrow.t', '\\uparrow'), T('Kết tủa ↓', 'arrow.b', '\\downarrow'),
    T('Điều kiện phản ứng (nhiệt độ)', 'stretch(->)^(t^degree)', '\\xrightarrow{t^\\circ}'), T('Điều kiện (xúc tác)', 'stretch(->)^("xt, ⟦t⟧°")', '\\xrightarrow{\\text{xt}, ⟦t⟧^\\circ}'), T('Điều kiện (điện phân)', 'stretch(->)^("điện phân")', '\\xrightarrow{\\text{điện phân}}'),
    T('Trạng thái rắn', '("r")', '(\\mathrm{r})'), T('Trạng thái lỏng', '("l")', '(\\mathrm{l})'), T('Trạng thái khí', '("k")', '(\\mathrm{k})'), T('Dung dịch', '("dd")', '(\\mathrm{dd})'),
    T('Biến thiên enthalpy', 'Delta H', '\\Delta H'), T('Nhiệt tỏa ra', 'Delta H < 0', '\\Delta H<0'), T('Nhiệt thu vào', 'Delta H > 0', '\\Delta H>0'),
    ...[
      ['Phản ứng tạo nước', '2H2 + O2 ->[t°] 2H2O'], ['Fe tác dụng CuSO₄', 'Fe + CuSO4 -> FeSO4 + Cu (v)'], ['Trung hòa', 'HCl + NaOH -> NaCl + H2O'],
      ['Phân hủy CaCO₃', 'CaCO3 ->[t°] CaO + CO2 (^)'], ['Tổng hợp NH₃ (thuận nghịch)', 'N2 + 3H2 <-> 2NH3'], ['Tạo kết tủa AgCl', 'Ag^+ + Cl^- -> AgCl (v)'],
      ['Oxi hóa Fe (cho e)', 'Fe -> Fe^3+ + 3e^-'], ['Khử Cu²⁺ (nhận e)', 'Cu^2+ + 2e^- -> Cu'], ['Đốt cháy metan', 'CH4 + 2O2 ->[t°] CO2 + 2H2O'], ['Nhiệt phân KMnO₄', '2KMnO4 ->[t°] K2MnO4 + MnO2 + O2 (^)'],
      ['Điện phân nước', '2H2O ->[điện_phân] 2H2 (^) + O2 (^)'], ['Zn tác dụng HCl', 'Zn + 2HCl -> ZnCl2 + H2 (^)'],
    ].map(([n, sp]) => { const [t, x] = rxn(sp); return T(n, t, x) }),
  ]),
  cat('Hóa', 'cqty', 'Đại lượng & công thức', 'pH', [
    T('Số mol theo khối lượng', 'n = m/M', 'n=\\frac{m}{M}'), T('Số mol theo thể tích khí', 'n = V/22.4', 'n=\\frac{V}{22{,}4}'), T('Nồng độ mol', 'C_M = n/V', 'C_M=\\frac{n}{V}'), T('Nồng độ phần trăm', 'C% = m_"ct"/m_"dd" times 100%', 'C\\%=\\frac{m_{ct}}{m_{dd}}\\times100\\%'),
    T('Khối lượng riêng', 'D = m/V', 'D=\\frac{m}{V}'), T('pH', '"pH" = -lg[⟦"H"^+⟧]', '\\mathrm{pH}=-\\lg[⟦\\mathrm{H^+}⟧]'), T('Nồng độ H⁺ từ pH', '[⟦"H"^+⟧] = 10^(-"pH")', '[⟦\\mathrm{H^+}⟧]=10^{-\\mathrm{pH}}'), T('Hằng số cân bằng', 'K_c = ([C]^c [D]^d)/([A]^a [B]^b)', 'K_c=\\frac{[C]^c[D]^d}{[A]^a[B]^b}'),
    T('Hằng số phân li axit', 'K_a = ([H^+][A^-])/([H A])', 'K_a=\\frac{[H^+][A^-]}{[HA]}'), T('Hiệu suất phản ứng', 'H = m_"tt"/m_"lt" times 100%', 'H=\\frac{m_{tt}}{m_{lt}}\\times100\\%'), T('Số Avogadro', 'N_A = 6.02 times 10^23 "mol"^(-1)', 'N_A=6.02\\times10^{23}\\,\\mathrm{mol^{-1}}'), T('Phương trình khí', 'p V = n R T', 'pV=nRT'),
    T('Tốc độ phản ứng', 'v = (Delta C)/(Delta t)', 'v=\\frac{\\Delta C}{\\Delta t}'), T('Định luật bảo toàn khối lượng', 'm_"A" + m_"B" = m_"C" + m_"D"', 'm_A+m_B=m_C+m_D'), T('Phân tử khối', 'M = ⟦m⟧/n', 'M=\\frac{⟦m⟧}{n}'),
    T('Đơn vị g/mol', '"g/mol"', '\\mathrm{g/mol}'), T('Đơn vị mol/L', '"mol/L"', '\\mathrm{mol/L}'), T('Đơn vị dm³', '"dm"^3', '\\mathrm{dm}^3'), T('Đơn vị ml', '"ml"', '\\mathrm{ml}'), T('Nồng độ [X]', '[⟦"X"⟧]', '[⟦\\mathrm{X}⟧]'),
    T('Thế điện cực chuẩn', 'E^degree_("Cu"^(2+)"/Cu")', 'E^\\circ_{\\mathrm{Cu^{2+}/Cu}}'), T('Suất điện động pin', 'E_"pin"^degree = E_"(+)"^degree - E_"(-)"^degree', 'E^\\circ_{pin}=E^\\circ_{(+)}-E^\\circ_{(-)}'),
  ]),
  cat('Hóa', 'corg', 'Hữu cơ', '⌬', [
    chem('Metan', 'CH4'), chem('Etan', 'C2H6'), chem('Propan', 'C3H8'), chem('Butan', 'C4H10'), chem('Etilen', 'C2H4'), chem('Axetilen', 'C2H2'), chem('Benzen', 'C6H6'), chem('Etanol', 'C2H5OH'), chem('Metanol', 'CH3OH'),
    chem('Axit fomic', 'HCOOH'), chem('Anđehit axetic', 'CH3CHO'), chem('Glucozơ', 'C6H12O6'), chem('Saccarozơ', 'C12H22O11'), chem('Tinh bột / xenlulozơ', '(C6H10O5)n'), chem('Glixerol', 'C3H5(OH)3'), chem('Phenol', 'C6H5OH'), chem('Anilin', 'C6H5NH2'),
    chem('Etyl axetat', 'CH3COOC2H5'), chem('Glyxin', 'H2NCH2COOH'), chem('Ure', '(NH2)2CO'),
    T('Ankan', 'upright(C_n H_(2n+2))', '\\mathrm{C_nH_{2n+2}}'), T('Anken', 'upright(C_n H_(2n))', '\\mathrm{C_nH_{2n}}'), T('Ankin', 'upright(C_n H_(2n-2))', '\\mathrm{C_nH_{2n-2}}'), T('Ancol no đơn chức', 'upright(C_n H_(2n+1) O H)', '\\mathrm{C_nH_{2n+1}OH}'),
    T('Axit no đơn chức', 'upright(C_n H_(2n+1) C O O H)', '\\mathrm{C_nH_{2n+1}COOH}'), T('Este', '"RCOOR"\'', "\\mathrm{RCOOR'}"), T('Nhóm hiđroxyl', '"-OH"', '\\mathrm{-OH}'), T('Nhóm cacboxyl', '"-COOH"', '\\mathrm{-COOH}'), T('Nhóm amino', 'upright(- N H_2)', '\\mathrm{-NH_2}'), T('Nhóm anđehit', '"-CHO"', '\\mathrm{-CHO}'),
    T('Liên kết đôi', '=', '='), T('Liên kết ba', 'eq.triple', '\\equiv'), T('Liên kết đơn', '"-"', '-'), T('Công thức cấu tạo thu gọn', 'upright(C H_3 - C H_2 - O H)', '\\mathrm{CH_3-CH_2-OH}'),
    T('Phản ứng cháy ankan', 'upright(C_n H_(2n+2)) + (3n+1)/2 upright(O_2) -> n upright(C O_2) + (n+1) upright(H_2 O)', '\\mathrm{C_nH_{2n+2}}+\\frac{3n+1}{2}\\mathrm{O_2}\\to n\\mathrm{CO_2}+(n+1)\\mathrm{H_2O}'),
  ]),
]

export const CATEGORIES = [...MATH, ...PHYS, ...CHEM]

// ---------- BỔ SUNG CÔNG THỨC Lý / Hóa ----------
const addTo = (id, items) => { CATEGORIES.find(c => c.id === id).items.push(...items) }
const _pre = (typ, tex) => ({ typst: typ, latex: tex })
addTo('pmech', [
  T('Tốc độ góc', 'omega = v/r = (2 pi)/T', '\\omega=\\frac{v}{r}=\\frac{2\\pi}{T}'), T('Gia tốc hướng tâm', 'a_"ht" = v^2/r = omega^2 r', 'a_{ht}=\\frac{v^2}{r}=\\omega^2r'),
  T('Định luật Húc', 'F_"đh" = k abs(Delta l)', 'F_{đh}=k|\\Delta l|'), T('Định luật I Niu-tơn', 'sum arrow(F) = 0', '\\sum\\vec{F}=\\vec0'), T('Định luật III Niu-tơn', 'arrow(F)_(A B) = -arrow(F)_(B A)', '\\vec{F}_{AB}=-\\vec{F}_{BA}'),
  T('Tầm bay xa (ném xiên)', 'L = (v_0^2 sin 2 alpha)/g', 'L=\\frac{v_0^2\\sin2\\alpha}{g}'), T('Độ cao cực đại (ném xiên)', 'H = (v_0^2 sin^2 alpha)/(2 g)', 'H=\\frac{v_0^2\\sin^2\\alpha}{2g}'),
  T('Phương trình chuyển động', 'x = x_0 + v_0 t + 1/2 a t^2', 'x=x_0+v_0t+\\frac12at^2'), T('Vận tốc tương đối', 'arrow(v)_(13) = arrow(v)_(12) + arrow(v)_(23)', '\\vec{v}_{13}=\\vec{v}_{12}+\\vec{v}_{23}'),
])
addTo('pener', [
  T('Định lí động năng', 'A = W_(d 2) - W_(d 1)', 'A=W_{d2}-W_{d1}'), T('Bảo toàn động lượng', 'm_1 arrow(v)_1 + m_2 arrow(v)_2 = m_1 arrow(v)_1\' + m_2 arrow(v)_2\'', "m_1\\vec{v}_1+m_2\\vec{v}_2=m_1\\vec{v}_1'+m_2\\vec{v}_2'"),
  T('Công suất tức thời', 'P = F v', 'P=Fv'), T('Quy tắc mô-men', 'F_1 d_1 = F_2 d_2', 'F_1d_1=F_2d_2'),
])
addTo('posc', [
  T('Biên độ tổng hợp', 'A^2 = A_1^2 + A_2^2 + 2 A_1 A_2 cos(Delta phi)', 'A^2=A_1^2+A_2^2+2A_1A_2\\cos(\\Delta\\varphi)'), T('Động năng dao động', 'W_d = 1/2 m v^2', 'W_d=\\frac12mv^2'), T('Thế năng dao động', 'W_t = 1/2 k x^2', 'W_t=\\frac12kx^2'),
  T('Độ lệch pha hai điểm', 'Delta phi = (2 pi d)/lambda', '\\Delta\\varphi=\\frac{2\\pi d}{\\lambda}'), T('Cường độ âm', 'I = P/(4 pi r^2)', 'I=\\frac{P}{4\\pi r^2}'),
])
addTo('pele', [
  T('Cường độ dòng điện', 'I = q/t', 'I=\\frac{q}{t}'), T('Điện thế', 'V_M = A_(M infinity)/q', 'V_M=\\frac{A_{M\\infty}}{q}'), T('Công của lực điện', 'A = q E d = q U', 'A=qEd=qU'),
  T('Tụ nối tiếp', '1/C = 1/C_1 + 1/C_2', '\\frac1C=\\frac1{C_1}+\\frac1{C_2}'), T('Tụ song song', 'C = C_1 + C_2', 'C=C_1+C_2'), T('Suất điện động nguồn', 'E = A/q', 'E=\\frac{A}{q}'),
  T('Định luật Jun-Len-xơ', 'Q = R I^2 t', 'Q=RI^2t'), T('Điện năng tiêu thụ', 'A = U I t', 'A=UIt'),
])
addTo('pmag', [
  T('Cảm ứng từ dây thẳng', 'B = 2 times 10^(-7) I/r', 'B=2\\times10^{-7}\\frac{I}{r}'), T('Cảm ứng từ ống dây', 'B = 4 pi times 10^(-7) (N/l) I', 'B=4\\pi\\times10^{-7}\\frac{N}{l}I'),
  T('Cảm ứng từ vòng dây', 'B = 2 pi times 10^(-7) I/R', 'B=2\\pi\\times10^{-7}\\frac{I}{R}'), T('Suất điện động xoay chiều', 'e = E_0 cos(omega t)', 'e=E_0\\cos(\\omega t)'),
  T('Giá trị hiệu dụng', 'I = I_0/sqrt(2)', 'I=\\frac{I_0}{\\sqrt2}'), T('Hệ số công suất', 'cos phi = R/Z', '\\cos\\varphi=\\frac{R}{Z}'), T('Độ tự cảm ống dây', 'L = 4 pi times 10^(-7) (N^2/l) S', 'L=4\\pi\\times10^{-7}\\frac{N^2}{l}S'),
  T('Suất điện động tự cảm', 'e = -L (Delta i)/(Delta t)', 'e=-L\\frac{\\Delta i}{\\Delta t}'), T('Năng lượng từ trường', 'W = 1/2 L I^2', 'W=\\frac12LI^2'),
])
addTo('popt', [
  T('Độ tụ', 'D = 1/f', 'D=\\frac1f'), T('Cực đại giao thoa ánh sáng', 'x = k (lambda D)/a', 'x=k\\frac{\\lambda D}{a}'), T('Cực tiểu giao thoa', 'x = (k + 1/2) (lambda D)/a', 'x=\\left(k+\\frac12\\right)\\frac{\\lambda D}{a}'),
  T('Số bội giác kính lúp', 'G_infinity = Đ/f', 'G_\\infty=\\frac{Đ}{f}'), T('Động năng cực đại quang electron', 'W_(d max) = e U_h', 'W_{d\\max}=eU_h'), T('Giới hạn quang điện', 'lambda_0 = (h c)/A', '\\lambda_0=\\frac{hc}{A}'),
  T('Chiết suất', 'n = c/v', 'n=\\frac{c}{v}'), T('Năng lượng mức Bo', 'E_n = -13.6/n^2 "eV"', 'E_n=-\\frac{13{,}6}{n^2}\\,\\mathrm{eV}'),
])
addTo('pthm', [
  T('Định luật Sác-lơ', 'p_1/T_1 = p_2/T_2', '\\frac{p_1}{T_1}=\\frac{p_2}{T_2}'), T('Định luật Gay-Luy-xác', 'V_1/T_1 = V_2/T_2', '\\frac{V_1}{T_1}=\\frac{V_2}{T_2}'), T('Đổi độ C sang Ken-vin', 'T = t + 273', 'T=t+273'),
  T('Công của chất khí', 'A = -p Delta V', 'A=-p\\Delta V'), T('Phương trình Cla-pê-rông', 'p V = (m/M) R T', 'pV=\\frac{m}{M}RT'), T('Động năng tịnh tiến phân tử', 'W_d = 3/2 k T', 'W_d=\\frac32kT'),
  T('Hiệu suất động cơ nhiệt', 'H = (Q_1 - Q_2)/Q_1', 'H=\\frac{Q_1-Q_2}{Q_1}'), T('Nhiệt hóa hơi', 'Q = L m', 'Q=Lm'), T('Cân bằng nhiệt', 'Q_"tỏa" = Q_"thu"', 'Q_{tỏa}=Q_{thu}'), T('Sự nở dài', 'l = l_0 (1 + alpha Delta t)', 'l=l_0(1+\\alpha\\Delta t)'),
])
addTo('pnuc', [
  T('Độ phóng xạ', 'H = lambda N = H_0 2^(-t/T)', 'H=\\lambda N=H_02^{-t/T}'), T('Năng lượng phản ứng hạt nhân', 'Delta E = (m_t - m_s) c^2', '\\Delta E=(m_t-m_s)c^2'), T('Số hạt nhân đã phân rã', 'Delta N = N_0 (1 - 2^(-t/T))', '\\Delta N=N_0(1-2^{-t/T})'),
  T('Năng lượng liên kết riêng', 'epsilon = W_"lk"/A', '\\varepsilon=\\frac{W_{lk}}{A}'), T('Bán kính hạt nhân', 'R = 1.2 times 10^(-15) A^(1/3)', 'R=1.2\\times10^{-15}A^{1/3}'),
])

export const GROUPS = ['Toán', 'Lý', 'Hóa']

// Thanh nhanh (mặc định như bảng MathType): tên mục theo "danh mục:tên"
export const QUICK = [
  ['greek', 'Pi'], ['misc', 'Vô cực'], ['set', 'Thuộc'], ['set', 'Không thuộc'], ['set', 'Tập con'], ['set', 'Tập rỗng'], ['arrow', 'Mũi tên phải'], ['arrow', 'Suy ra'], ['arrow', 'Tương đương'],
  ['rel', 'Nhỏ hơn hoặc bằng'], ['rel', 'Lớn hơn hoặc bằng'], ['rel', 'Khác (không bằng)'], ['op', 'Cộng trừ'], ['rel', 'Xấp xỉ'], ['misc', 'Độ (°)'], ['greek', 'Delta hoa'], ['greek', 'Alpha'],
  ['frac', 'Phân số'], ['frac', 'Căn bậc hai'], ['frac', 'Căn bậc n'], ['sup', 'Số mũ'], ['sup', 'Chỉ số dưới'], ['brk', 'Ngoặc tròn'], ['brk', 'Giá trị tuyệt đối'], ['mat', 'Hệ 2 phương trình'], ['mat', 'Ma trận 2×2'],
  ['acc', 'Véc-tơ (mũi tên)'], ['acc', 'Gạch ngang trên'], ['int', 'Tích phân xác định'], ['sum', 'Giới hạn x→a'], ['fn', 'Logarit cơ số a'], ['frac', 'Tổ hợp Cₙᵏ'], ['sum', 'Tổng Σ'],
]

export const normalize = s => s.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/đ/g, 'd')

// Danh mục toàn công thức dài: hiện ô rộng kèm tên; các danh mục ký hiệu/đơn vị để ô nhỏ gọn
export const WIDE = new Set(['psym', 'pmech', 'pener', 'posc', 'pele', 'pmag', 'popt', 'pthm', 'pnuc', 'crx', 'cqty', 'corg'])
