#import "../lib.typ": *

#let theme = "sgk-modern"

#show: book-theme.with(
  theme: theme,
  title: "CHUYÊN ĐỀ HÀM SỐ",
  subtitle: "Mẫu sách/chuyên đề dùng các macro của sang-math",
  author: "Giáo viên biên soạn",
  institution: "Tổ Toán",
  subject: "Toán",
  grade: "Lớp 12",
  year: "2026-2027",
  cover-note: [File mẫu này minh họa chương, bài, mục và các hộp sư phạm.],
)

#book-chapter([Ứng dụng đạo hàm], number: "01", theme: theme)
#book-lesson([Tính đơn điệu của hàm số], number: "1", theme: theme)

#goal-box(theme: theme)[
  - Biết tìm tập xác định và đạo hàm.
  - Biết lập bảng xét dấu của đạo hàm.
  - Kết luận đúng khoảng đồng biến, nghịch biến.
]

#warmup-box(theme: theme)[
  Cho $s(t)=t^3-3t$. Khi nào vật chuyển động theo chiều dương?
]

#book-section([Kiến thức cần nhớ], number: "1.1", theme: theme)

#definition-box(theme: theme)[
  Hàm số $f$ đồng biến trên khoảng $I$ nếu với mọi $x_1 < x_2$ thuộc $I$ thì $f(x_1) <= f(x_2)$.
]

#theorem-box(theme: theme)[
  Nếu $f'(x)>0$ trên khoảng $I$ thì $f$ đồng biến trên $I$.
  Nếu $f'(x)<0$ trên khoảng $I$ thì $f$ nghịch biến trên $I$.
]

#method-box(theme: theme)[
  Quy trình xét đơn điệu:
  1. Tìm tập xác định.
  2. Tính $f'(x)$.
  3. Tìm nghiệm của $f'(x)=0$ và điểm không xác định.
  4. Lập bảng xét dấu.
  5. Kết luận theo từng khoảng.
]

#book-section([Ví dụ mẫu], number: "1.2", theme: theme)

#example-box(title: [Ví dụ 1], theme: theme)[
  Xét tính đơn điệu của $y=x^3-3x+1$.

  Ta có $y'=3x^2-3=3(x-1)(x+1)$.

  #bbbt(
    x-vals: ($-oo$, $-1$, $1$, $+oo$),
    d-signs: ("+", 0, "-", 0, "+"),
    v-vals: ($-oo$, $3$, $-1$, $+oo$),
  )

  Vậy hàm số đồng biến trên $(-oo;-1)$ và $(1;+oo)$, nghịch biến trên $(-1;1)$.
]

#warning-box(theme: theme)[
  Không được gộp hai khoảng qua một điểm mà hàm số không xác định.
]

#practice-box(theme: theme)[
  Xét tính đơn điệu của:
  - $y=x^3-6x^2+9x$.
  - $y=(x+1)/(x-2)$.
]

#exercise-box(theme: theme, lines: 6)[
  Tìm khoảng đồng biến, nghịch biến của hàm số $y=(x^2+1)/(x-1)$.
]

#summary-box(theme: theme)[
  - Dấu của đạo hàm quyết định chiều biến thiên.
  - Luôn xét trên từng khoảng thuộc tập xác định.
]
