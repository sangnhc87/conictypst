import re

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

header_theory = """// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 1: TÍNH ĐƠN ĐIỆU VÀ CỰC TRỊ CỦA HÀM SỐ
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)
#let palette = (ink: black, muted: rgb("#555"), border: rgb("#bbb"), accent: rgb("#0057b8"), correct: rgb("#1a7a2e"), wrong: rgb("#cc2200"), sol-bg: rgb("#f0f6ff"))

#let True(body) = body
#let step(title) = { v(0.3em); text(fill: lec-palette.navy, weight: "bold")[👉 #title]; v(0.2em) }

#show: lecture-theme.with(
  title:       "Bài 1: Tính Đơn Điệu và Cực Trị",
  subtitle:    "TOÁN 12 — Chương I: Ứng dụng của đạo hàm",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
)

#lec-reset()

#lt-toc()

// ════════════════════════════════════════════════
// SLIDE: LỘ TRÌNH & BỐI CẢNH LỊCH SỬ
// ════════════════════════════════════════════════
#lt-section-link("sec-history", "🏛️", [Bối cảnh & Lịch sử])

#lt-slide-back(title: "🏛️ Đạo hàm ra đời như thế nào?")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-history(title: "Cuộc đua thế kỷ XVII")[
        Khoảng 1665–1684, *Isaac Newton* (Anh) và *Gottfried Leibniz* (Đức) — hai thiên tài sống cách nhau hàng nghìn km — *độc lập* phát minh ra Giải tích.

        Newton gọi là _"fluxion"_ (tốc độ biến thiên), dùng để tính quỹ đạo hành tinh. Leibniz dùng ký hiệu $d y \/ d x$ mà chúng ta vẫn dùng ngày nay.
      ]
      #v(0.4em)
      #lt-note(title: "Ứng dụng thực tế")[
        Đạo hàm giúp tìm *điểm tối ưu* trong kinh doanh, kỹ thuật, khoa học: tối thiểu chi phí, tối đa lợi nhuận, tìm vận tốc cực đại.
      ]
    ],
    [
      #v(1em)
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((0,0), (0, 7), mark: (end: ">"), name: "y")
          line((0,0), (4.5, 0), mark: (end: ">"), name: "x")
          content((4.5, -0.3), [$t$ (thời gian)])
          content((-0.3, 7), [$s$ (quãng đường)])
          
          bezier((0,0.5), (4, 6), (2, 0.5), (3, 5), name: "curve")
          
          let p1 = (1.5, 1.2)
          circle(p1, radius: 0.08, fill: blue)
          line((0.8, 1.05), (2.2, 1.35), stroke: red)
          content((2.5, 1.2), text(fill: red, size: 12pt)[Vận tốc tức thời $v = s'(t)$])
        })
      ]
    ]
  )
]

#lt-slide-back(title: "⏳ Dòng thời gian phát triển")[
  #lt-timeline(
    ("1665", "Isaac Newton", "Phát triển lý thuyết 'Fluxions' (Đạo hàm) để giải quyết các bài toán vật lý về chuyển động."),
    ("1675", "Gottfried Leibniz", "Sử dụng ký hiệu $d y / d x$ và tích phân $int$. Công bố trước Newton vào năm 1684."),
    ("1696", "L'Hôpital", "Xuất bản cuốn sách giáo khoa đầu tiên về Giải tích, tổng hợp các quy tắc tính giới hạn."),
    ("1823", "Augustin-Louis Cauchy", "Đưa Giải tích trở nên chặt chẽ bằng cách định nghĩa giới hạn một cách nghiêm ngặt ($epsilon-delta$).")
  )
]

// ════════════════════════════════════════════════
// PHẦN I: TÍNH ĐƠN ĐIỆU CỦA HÀM SỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-dondieu", "📈", [I. Tính đơn điệu của hàm số])
#lt-section("📈", [I. Tính đơn điệu của hàm số])

#lt-slide-back(title: "1. Nhắc lại khái niệm")[
  #lt-definition(title: "Hàm số đồng biến, nghịch biến")[
    Cho hàm số $y = f(x)$ xác định trên $K$ (khoảng, đoạn, hoặc nửa khoảng).
    - $f(x)$ *đồng biến* (tăng) trên $K$ nếu: $forall x_1, x_2 in K, x_1 < x_2 => f(x_1) < f(x_2)$.
    - $f(x)$ *nghịch biến* (giảm) trên $K$ nếu: $forall x_1, x_2 in K, x_1 < x_2 => f(x_1) > f(x_2)$.
  ]
  #pause
  #lt-two-col(
    ratio: (1fr, 1fr),
    align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-1,0), (3,0), mark: (end: ">"))
        line((0,-1), (0,3), mark: (end: ">"))
        bezier((0,0), (2.5,2.5), (1,0), (1.5, 2.5), stroke: 1.5pt + blue)
        content((1.25, -0.5), text(fill: blue, weight: "bold")[ĐỒNG BIẾN (Đồ thị đi lên)])
      })
    ],
    align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-1,0), (3,0), mark: (end: ">"))
        line((0,-1), (0,3), mark: (end: ">"))
        bezier((0,2.5), (2.5,0), (1,2.5), (1.5, 0), stroke: 1.5pt + red)
        content((1.25, -0.5), text(fill: red, weight: "bold")[NGHỊCH BIẾN (Đồ thị đi xuống)])
      })
    ]
  )
]

#lt-slide-back(title: "2. Mối liên hệ giữa Đạo hàm và Đơn điệu")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Định lý đơn điệu")[
        Cho hàm số $f(x)$ có đạo hàm trên khoảng $K$.
        - Nếu $f'(x) > 0 quad forall x in K$ thì $f(x)$ *đồng biến* trên $K$.
        - Nếu $f'(x) < 0 quad forall x in K$ thì $f(x)$ *nghịch biến* trên $K$.
        - Nếu $f'(x) = 0 quad forall x in K$ thì $f(x)$ *không đổi* (hằng số) trên $K$.
      ]
      #pause
      #lt-note[Định lý mở rộng: Dấu "=" có thể xảy ra tại *hữu hạn điểm* trên $K$.]
    ],
    align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-1,0), (4,0), mark: (end: ">"), name: "x")
        line((0,-1), (0,4), mark: (end: ">"), name: "y")
        bezier((0.5,0.5), (3.5,3.5), (2,0.5), (2,3.5), stroke: 1.5pt + blue)
        
        let p1 = (1.2, 0.8)
        circle(p1, radius: 0.06, fill: black)
        line((0.2, 0.5), (2.2, 1.1), stroke: red)
        content((2.5, 0.9), text(fill: red)[Tiếp tuyến hướng lên\n $f'(x) > 0$])
        
        let p2 = (2.8, 3.1)
        circle(p2, radius: 0.06, fill: black)
        line((2.0, 2.0), (3.6, 4.2), stroke: red)
        content((3.8, 3.0), text(fill: red)[$f'(x) > 0$])
      })
    ]
  )
]

#lt-slide-back(title: "3. Quy tắc lập Bảng biến thiên (BBT)")[
  #step[Bước 1: Tìm Tập xác định $D$. Tính đạo hàm $f'(x)$.]
  #pause
  #step[Bước 2: Tìm các điểm $x_i in D$ mà tại đó $f'(x) = 0$ hoặc $f'(x)$ không xác định.]
  #pause
  #step[Bước 3: Sắp xếp các điểm $x_i$ theo thứ tự tăng dần. Lập bảng xét dấu $f'(x)$ và chiều biến thiên của $f(x)$ (gọi là Bảng Biến Thiên).]
  #pause
  #step[Bước 4: Căn cứ vào BBT để kết luận các khoảng đồng biến, nghịch biến.]
]

#lt-slide-back(title: "Ví dụ 1 — Hàm đa thức")[
  #lt-example[
    Xét chiều biến thiên của hàm số $f(x) = x^3 - 3x^2 + 1$.
  ]
  #pause
  #lt-solution[
    *TXĐ:* $D = RR$. \
    *Đạo hàm:* $f'(x) = 3x^2 - 6x$. Cho $f'(x) = 0 <=> x = 0$ hoặc $x = 2$.
    #pause
    
    *Bảng biến thiên:*
    #align(center)[
      #bbbt(
        x-vals: ($-oo$, $0$, $2$, $+oo$),
        d-signs: ($+$, $0$, $-$, $0$, $+$),
        v-vals: ($-oo$, $1$, $-3$, $+oo$),
      )
    ]
    #pause
    *Kết luận:* 
    - Hàm số *đồng biến* trên các khoảng $(-infinity; 0)$ và $(2; +infinity)$.
    - Hàm số *nghịch biến* trên khoảng $(0; 2)$.
  ]
]

#lt-slide-back(title: "Ví dụ 2 — Hàm phân thức")[
  #lt-example[
    Xét tính đơn điệu của hàm số $f(x) = display(frac(2x - 1, x - 1))$.
  ]
  #pause
  #lt-solution[
    *TXĐ:* $D = RR without {1}$. \
    *Đạo hàm:* $f'(x) = display(frac(2(x-1) - (2x-1) dot 1, (x-1)^2)) = display(frac(-1, (x-1)^2)) < 0 quad forall x != 1$.
    #pause
    
    *Bảng biến thiên:*
    #align(center)[
      #bbbt(
        x-vals: ($-oo$, $1$, $+oo$),
        d-signs: ($-$, $||$, $-$),
        v-vals: ($2$, $||$, $2$),
      )
    ]
    #pause
    *Kết luận:* Hàm số *nghịch biến* trên $(-infinity; 1)$ và $(1; +infinity)$. \
    #lt-note[Chú ý: Tuyệt đối không ghi nghịch biến trên $RR without {1}$ hoặc $(-infinity; 1) union (1; +infinity)$.]
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: CỰC TRỊ CỦA HÀM SỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-cuctri", "⛰️", [II. Cực trị của hàm số])
#lt-section("⛰️", [II. Cực trị của hàm số])

#lt-slide-back(title: "1. Khái niệm cực đại, cực tiểu")[
  #lt-definition(title: "Cực đại và Cực tiểu")[
    Cho $f(x)$ xác định trên $D$ và $x_0 in D$.
    - $x_0$ là *điểm cực đại* nếu tồn tại một khoảng $(a; b)$ chứa $x_0$ sao cho $f(x) < f(x_0)$ với mọi $x in (a; b) without {x_0}$. $f(x_0)$ gọi là *giá trị cực đại*.
    - $x_0$ là *điểm cực tiểu* nếu $f(x) > f(x_0)$ với mọi $x$ lân cận $x_0$.
  ]
  #pause
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-1,0), (5,0), mark: (end: ">"), name: "x")
      line((0,-1), (0,4), mark: (end: ">"), name: "y")
      bezier((0,1), (4,3), (1,4), (3,-1), stroke: 1.5pt + blue)
      
      content((1.3, 3.2), text(fill: red, weight: "bold")[Điểm Cực Đại])
      line((1, 2.5), (2, 2.5), stroke: red) // tangent 
      circle((1.5, 2.5), radius: 0.05, fill: red)
      
      content((3.5, 0.4), text(fill: emerald, weight: "bold")[Điểm Cực Tiểu])
      line((2.8, 0.7), (3.8, 0.7), stroke: emerald) // tangent 
      circle((3.3, 0.7), radius: 0.05, fill: emerald)
    })
  ]
]

#lt-slide-back(title: "2. Quy tắc 1 tìm cực trị")[
  #lt-theorem(title: "Dấu hiệu 1 (Dựa vào BBT)")[
    Giả sử $f(x)$ liên tục trên khoảng $K$ chứa $x_0$ và có đạo hàm trên $K$ hoặc $K without {x_0}$.
    - Nếu $f'(x)$ *đổi dấu từ $(+)$ sang $(-)$* khi qua $x_0$ thì hàm số đạt *cực đại* tại $x_0$.
    - Nếu $f'(x)$ *đổi dấu từ $(-)$ sang $(+)$* khi qua $x_0$ thì hàm số đạt *cực tiểu* tại $x_0$.
  ]
  #pause
  #lt-example[
    Tìm cực trị của $f(x) = 2x^3 - 3x^2 - 12x + 4$.
  ]
  #pause
  #lt-solution[
    $f'(x) = 6x^2 - 6x - 12 = 6(x-2)(x+1)$; $f'(x) = 0 <=> x = -1$ hoặc $x = 2$.
    #pause
    #align(center)[
      #bbbt(
        x-vals: ($-oo$, $-1$, $2$, $+oo$),
        d-signs: ($+$, $0$, $-$, $0$, $+$),
        v-vals: ($-oo$, $11$, $-16$, $+oo$),
      )
    ]
    #pause
    - $x = -1$: $f'$ đổi dấu $+$ → $-$ → *cực đại*, $f_("CĐ") = 11$.
    - $x = 2$: $f'$ đổi dấu $-$ → $+$ → *cực tiểu*, $f_("CT") = -16$.
  ]
]

// ════════════════════════════════════════════════
// KHO BÀI TẬP TRẮC NGHIỆM TỔNG HỢP (48 CÂU)
// ════════════════════════════════════════════════
"""

index = content.find("// KHO BÀI TẬP TRẮC NGHIỆM TỔNG HỢP (48 CÂU)")
if index == -1:
    print("Error: Could not find the split point.")
else:
    new_content = header_theory + content[index:]
    with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
        f.write(new_content)
    print("Theory section successfully rewritten!")

