export const MATH_SYMBOL_CATEGORIES = [
  {
    id: 'structure',
    label: 'Cấu trúc',
    symbols: [
      { label: 'Phân số', icon: 'a/b', snippet: 'frac(${1:a}, ${2:b})', type: 'snippet' },
      { label: 'Căn bậc 2', icon: '√', snippet: 'sqrt(${1:x})', type: 'snippet' },
      { label: 'Căn bậc n', icon: 'ⁿ√', snippet: 'root(${1:n}, ${2:x})', type: 'snippet' },
      { label: 'Mũ (Lũy thừa)', icon: 'xⁿ', snippet: '^(${1:n})', type: 'snippet' },
      { label: 'Chỉ số dưới', icon: 'xₙ', snippet: '_(${1:n})', type: 'snippet' },
      { label: 'Trị tuyệt đối', icon: '|x|', snippet: 'abs(${1:x})', type: 'snippet' },
      { label: 'Tổng (Σ)', icon: 'Σ', snippet: 'sum_(${1:i=1})^(${2:n}) ', type: 'snippet' },
      { label: 'Tích phân', icon: '∫', snippet: 'integral_(${1:a})^(${2:b}) ', type: 'snippet' },
      { label: 'Đạo hàm', icon: 'd/dx', snippet: 'frac(d ${1:y}, d ${2:x})', type: 'snippet' },
      { label: 'Giới hạn', icon: 'lim', snippet: 'lim_(${1:x arrow 0}) ', type: 'snippet' },
      { label: 'Hệ PT', icon: '{x,y', snippet: 'cases(\n  ${1:x + y = 0},\n  ${2:x - y = 1}\n)', type: 'snippet' },
      { label: 'Ma trận vuông', icon: '[ ]', snippet: 'mat(\n  ${1:1}, ${2:2};\n  ${3:3}, ${4:4}\n)', type: 'snippet' },
      { label: 'Vector cột', icon: '[]', snippet: 'vec(${1:1}, ${2:2})', type: 'snippet' },
      { label: 'Đóng ngoặc lớn', icon: '( )', snippet: 'lr(( ${1:x} ))', type: 'snippet' },
      { label: 'Khoảng giá trị', icon: '[a;b)', snippet: '([${1:a}, ${2:b}))', type: 'snippet' },
    ]
  },
  {
    id: 'greek',
    label: 'Hy Lạp',
    symbols: [
      { label: 'alpha', icon: 'α', snippet: 'alpha ', type: 'text' },
      { label: 'beta', icon: 'β', snippet: 'beta ', type: 'text' },
      { label: 'gamma', icon: 'γ', snippet: 'gamma ', type: 'text' },
      { label: 'delta', icon: 'δ', snippet: 'delta ', type: 'text' },
      { label: 'Delta', icon: 'Δ', snippet: 'Delta ', type: 'text' },
      { label: 'pi', icon: 'π', snippet: 'pi ', type: 'text' },
      { label: 'theta', icon: 'θ', snippet: 'theta ', type: 'text' },
      { label: 'omega', icon: 'ω', snippet: 'omega ', type: 'text' },
      { label: 'Omega', icon: 'Ω', snippet: 'Omega ', type: 'text' },
    ]
  },
  {
    id: 'operators',
    label: 'Phép toán',
    symbols: [
      { label: 'Nhân', icon: '×', snippet: 'times ', type: 'text' },
      { label: 'Chia', icon: '÷', snippet: 'div ', type: 'text' },
      { label: 'Cộng/Trừ', icon: '±', snippet: 'pm ', type: 'text' },
      { label: 'Vô cực', icon: '∞', snippet: 'oo ', type: 'text' },
      { label: 'Giao', icon: '∩', snippet: 'sect ', type: 'text' },
      { label: 'Hợp', icon: '∪', snippet: 'union ', type: 'text' },
      { label: 'Rỗng', icon: '∅', snippet: 'emptyset ', type: 'text' },
    ]
  },
  {
    id: 'relations',
    label: 'Quan hệ',
    symbols: [
      { label: 'Khác', icon: '≠', snippet: 'eq.not ', type: 'text' },
      { label: 'Lớn hơn/Bằng', icon: '≥', snippet: 'geq ', type: 'text' },
      { label: 'Nhỏ hơn/Bằng', icon: '≤', snippet: 'leq ', type: 'text' },
      { label: 'Xấp xỉ', icon: '≈', snippet: 'approx ', type: 'text' },
      { label: 'Thuộc', icon: '∈', snippet: 'in ', type: 'text' },
      { label: 'Không thuộc', icon: '∉', snippet: 'not in ', type: 'text' },
      { label: 'Suy ra', icon: '⇒', snippet: '=> ', type: 'text' },
      { label: 'Tương đương', icon: '⇔', snippet: '<=> ', type: 'text' },
    ]
  },
  {
    id: 'geometry',
    label: 'Hình học',
    symbols: [
      { label: 'Góc', icon: '∠', snippet: 'angle ', type: 'text' },
      { label: 'Độ', icon: '°', snippet: 'degree', type: 'text' },
      { label: 'Vuông góc', icon: '⊥', snippet: 'perp ', type: 'text' },
      { label: 'Song song', icon: '∥', snippet: 'parallel ', type: 'text' },
      { label: 'Vectơ', icon: 'v⃗', snippet: 'vec(${1:A})', type: 'snippet' },
      { label: 'Vectơ tọa độ', icon: '(x,y)', snippet: 'vec(${1:x}, ${2:y})', type: 'snippet' },
    ]
  }
]
