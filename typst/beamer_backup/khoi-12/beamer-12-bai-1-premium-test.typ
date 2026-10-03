// ═══════════════════════════════════════════════════════════════════════════
// BẢN THỬ NGHIỆM PREMIUM V2
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer-premium-v2.typ": *
#import "../../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#show: lecture-theme-premium.with(
  title:       "Bài 1: Tính Đơn Điệu và Cực Trị (Bản Premium V2)",
  subtitle:    "TOÁN 12 — Chương I: Ứng dụng của đạo hàm",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size:   24pt,
  math-color:  rgb("#06b6d4"), // Cyan cho đồng bộ Dark Theme
)

#lec-reset()
#lt-toc()

#lt-section("Phần I", "TÍNH ĐƠN ĐIỆU CỦA HÀM SỐ")

#slide(title: "1. Nhắc lại định nghĩa")[
  #lt-definition(title: "ĐỊNH NGHĨA")[
    Cho hàm số $y = f(x)$ xác định trên $K$.
    - Hàm số được gọi là *đồng biến* trên $K$ nếu $forall x_1, x_2 in K$, $x_1 < x_2 => f(x_1) < f(x_2)$.
    - Hàm số được gọi là *nghịch biến* trên $K$ nếu $forall x_1, x_2 in K$, $x_1 < x_2 => f(x_1) > f(x_2)$.
  ]
]

#slide(title: "2. Xét tính đơn điệu bằng Bảng Biến Thiên")[
  #lt-example(title: "Ví dụ 1")[
    Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #bbbt(
        x-vals: ($-oo$, $1$, $+oo$),
        d-signs: ($-$, $||$, $-$),
        v-vals: ($2$, ($-oo$, $+oo$), $2$),
      )
    ]
    Hàm số đồng biến hay nghịch biến trên các khoảng nào?
  ]
]

#lt-tn(de: "Đề 1", 
  [Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $0$, $2$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-1$, $3$, $-oo$),
    )
  ]
  Điểm cực tiểu của hàm số đã cho là:],
  (
    [$x = 2$],
    True([$x = 0$]),
    [$x = -1$],
    [$x = 3$],
  ),
  loigiai: [
    Từ bảng biến thiên, $f'(x)$ đổi dấu từ âm sang dương khi đi qua $x = 0$.
    Vậy điểm cực tiểu của hàm số là $x = 0$.
  ]
)
