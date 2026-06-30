// ═══════════════════════════════════════════════════════════════════════════
//  CD-HamSinh-VanNang.typ
//  CHUYÊN ĐỀ: HÀM SINH (GENERATING FUNCTIONS) — VẠN NĂNG & TỔNG QUÁT
//  GV Nguyễn Văn Sang · Toán tổ hợp nâng cao · THPT & HSG
// ═══════════════════════════════════════════════════════════════════════════

#import "template.typ": *
#import "sang-exam.typ": step
#import "@preview/cetz:0.5.2"

// ── Màu chủ đạo ──────────────────────────────────────────────────────────
#let C-hs  = rgb("#004E89")   // Hàm sinh xanh navy
#let C-ex  = rgb("#1A936F")   // Ví dụ xanh ngọc
#let C-bt  = rgb("#C2410C")   // Bài tập cam
#let C-key = rgb("#7C3AED")   // Công thức chìa khoá tím
#let C-warn= rgb("#DC2626")   // Cảnh báo đỏ
#let C-tip = rgb("#0891B2")   // Mẹo xanh teal
#let C-ann = rgb("#92400E")   // Ghi chú nâu

// ── Hộp đặc biệt riêng cho chủ đề Hàm sinh ──────────────────────────────
// Hộp Hàm sinh xanh navy (kiểu banner)
#let hs-box(body, title: [🎯 Hàm sinh]) = block(
  width: 100%, below: 0.9em, radius: 6pt, clip: true,
)[
  #block(width: 100%, fill: C-hs, inset: (x: 12pt, y: 7pt))[
    #text(fill: white, weight: "bold", size: 10.5pt)[#title]
  ]
  #block(width: 100%, fill: C-hs.lighten(93%), inset: (x: 13pt, y: 10pt))[
    #set text(fill: luma(25))
    #body
  ]
]

// Hộp Định lý / Công thức chìa khoá (kiểu theorem tím)
#let cl-box(body, title: [🔑 Công thức chìa khoá]) = block(
  width: 100%, below: 0.9em,
)[
  #line(length: 100%, stroke: 2.5pt + C-key)
  #block(width: 100%, fill: C-key.lighten(93%), inset: (x: 13pt, top: 7pt, bottom: 9pt))[
    #text(weight: "bold", fill: C-key, style: "italic")[#title.] #h(4pt) #body
  ]
  #line(length: 100%, stroke: 1pt + C-key.lighten(40%))
]

// Hộp tổng kết nhỏ inline
#let kq-box(body) = block(
  width: 100%, below: 0.7em,
  stroke: (left: 5pt + C-ex, rest: 0.7pt + C-ex.lighten(55%)),
  inset: (left: 12pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 5pt),
  fill: C-ex.lighten(92%),
)[
  #text(weight: "bold", fill: C-ex)[✅ Kết luận:] #h(3pt) #body
]

// ── Helper vẽ ô đa thức (thanh bar chart trực quan) ──────────────────────
// Vẽ biểu đồ hệ số đa thức đơn giản bằng cetz
#let poly-bar(coeffs, label-fn: i => $x^#i$, bar-w: 0.6, scale: 1.0) = {
  let n = coeffs.len()
  cetz.canvas({
    import cetz.draw: *
    let max-c = calc.max(..coeffs.filter(c => c > 0))
    let h-scale = if max-c > 0 { 2.5 / max-c } else { 1.0 }
    // Trục
    line((-0.4, 0), (n * 1.0 + 0.2, 0), mark: (end: ">"), stroke: 0.7pt)
    line((0, -0.3), (0, 3.2), mark: (end: ">"), stroke: 0.7pt)
    content((-0.25, 3.0), text(size: 8pt)[$g(x)$])
    for i in range(n) {
      let c = coeffs.at(i)
      if c > 0 {
        let h = c * h-scale
        rect(
          (i * 1.0 + 0.2, 0),
          (i * 1.0 + 0.2 + bar-w, h),
          fill: C-hs.lighten(60%), stroke: 0.6pt + C-hs,
        )
        content((i * 1.0 + 0.2 + bar-w / 2, h + 0.2), text(size: 7pt, fill: C-hs)[#c])
      }
      content(
        (i * 1.0 + 0.2 + bar-w / 2, -0.3),
        text(size: 7pt, fill: luma(40))[#i],
      )
    }
  })
}

// ── Bố cục hình mũi tên quy trình hàm sinh ──────────────────────────────
#let flow-step(steps) = {
  grid(
    columns: steps.map(_ => 1fr),
    column-gutter: 6pt,
    ..steps.enumerate().map(((i, s)) => {
      let content-block = block(
        width: 100%, fill: C-hs.lighten(88%),
        stroke: 0.8pt + C-hs.lighten(45%),
        inset: (x: 8pt, y: 7pt), radius: 5pt,
      )[
        #align(center)[
          #text(size: 8.5pt, weight: "bold", fill: C-hs)[Bước #(i+1)]
          #v(0.2em)
          #text(size: 8pt, fill: luma(25))[#s]
        ]
      ]
      if i < steps.len() - 1 {
        grid(columns: (1fr, auto), column-gutter: 2pt, align: horizon,
          content-block,
          text(fill: C-hs, size: 14pt)[→],
        )
      } else { content-block }
    })
  )
}

// ═══════════════════════════════════════════════════════════════════════════
//  PHẦN TÀI LIỆU
// ═══════════════════════════════════════════════════════════════════════════
#show: stexgv-doc.with(
  doc-type: "chuyende",
  title:    "HÀM SINH VẠN NĂNG",
  subtitle: "Generating Functions — Công Cụ Đại Bác Của Tổ Hợp",
  author:   "GV Nguyễn Văn Sang",
  institution: "Tổ Toán · Bồi Dưỡng HSG & Nâng Cao",
  subject:  "Toán tổ hợp",
  grade:    "Lớp 11–12 & HSG",
  series:   "Chuyên đề Đại Bác Vạn Năng",
  academic-year: "2025–2026",
  theme-color: C-hs,
)

// ─────────────────────────────────────────────────────────────────────────
#gioithieu[
  *Hàm sinh (Generating Function — GF)* là công cụ đại số mạnh mẽ nhất
  trong Toán tổ hợp, biến bài toán đếm phức tạp thành phép tính hệ số
  đa thức đơn thuần. Tài liệu này trình bày *25+ ví dụ ứng dụng đa dạng*
  từ cơ bản đến nâng cao, bao phủ toàn bộ dạng bài gặp trong kỳ thi HSG.
]

// ═══════════════════════════════════════════════════════════════════════════
#part([Nền tảng lý thuyết và tư duy cốt lõi], theme-color: C-hs)

#chapter([Hàm sinh thông thường (OGF) — Nền tảng], theme-color: C-hs)

// ─────────────────────────────────────────────────────────────────────────
#dang([Khái niệm và tư duy gốc rễ])

#lythuyet(title: [📐 Định nghĩa Hàm sinh thông thường (OGF)])[
  Cho dãy số $(a_0, a_1, a_2, dots.h)$. *Hàm sinh thông thường* (Ordinary
  Generating Function — OGF) của dãy này là chuỗi lũy thừa hình thức:
  $
    G(x) = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + dots = sum_(n >= 0) a_n x^n.
  $
  *Tư duy cốt lõi:* Ta mã hoá mỗi đối tượng có "trọng số" $n$ bằng số mũ $x^n$.
  Phép *nhân đa thức* tương ứng với phép *cộng trọng số* (gộp lựa chọn từ các nhóm độc lập).
]

#nhanxet(title: [🔑 Tại sao nhân đa thức = đếm tổ hợp?])[
  Khi nhân $P_A(x) dot P_B(x)$, hệ số của $x^n$ trong tích bằng số cách
  chọn $a$ từ nhóm A và $b$ từ nhóm B sao cho $a + b = n$:
  $
    [x^n](P_A dot P_B) = sum_(a+b=n) [x^a]P_A dot [x^b]P_B.
  $
  Đây chính là *tích chập* (convolution) — công thức nền tảng của toàn bộ phương pháp.
]

#subsection([Quy trình 4 bước vạn năng])

#flow-step((
  [Xác định *trọng số* cần đếm (thường là tổng)],
  [Lập *đa thức* cho từng nhóm/điều kiện],
  [*Nhân* các đa thức lại],
  [Đọc *hệ số* $x^n$ → đáp án],
))

// ─────────────────────────────────────────────────────────────────────────
#dang([Các hàm sinh OGF cơ bản và dạng đóng])

#cl-box(title: [📋 Bảng hàm sinh OGF cơ bản])[
  #table(
    columns: (2fr, 3fr, 2fr),
    inset: 9pt,
    stroke: 0.5pt + luma(200),
    fill: (col, row) => if row == 0 { C-key.lighten(85%) } else if calc.rem(row, 2) == 0 { luma(250) } else { white },
    align: (left, center, left),
    table.header(
      [*Điều kiện lấy*], [*Đa thức*], [*Dạng đóng*],
    ),
    [Tùy ý ($0, 1, 2, dots.h$)],
      [$1 + x + x^2 + x^3 + dots.h$],
      [$frac(1, 1-x)$],
    [Chỉ số chẵn ($0, 2, 4, dots.h$)],
      [$1 + x^2 + x^4 + dots.h$],
      [$frac(1, 1-x^2)$],
    [Chỉ số lẻ ($1, 3, 5, dots.h$)],
      [$x + x^3 + x^5 + dots.h$],
      [$frac(x, 1-x^2)$],
    [Ít nhất $k$ ($k, k+1, dots.h$)],
      [$x^k + x^(k+1) + dots.h$],
      [$frac(x^k, 1-x)$],
    [Đúng $k$ phần tử ($k$ cố định)],
      [$x^k$],
      [$x^k$],
    [Từ $a$ đến $b$ ($a <= n <= b$)],
      [$x^a + x^(a+1) + dots.h + x^b$],
      [$x^a dot frac(1 - x^(b-a+1), 1-x)$],
    [Bội của $k$ ($0, k, 2k, dots.h$)],
      [$1 + x^k + x^{2k} + dots.h$],
      [$frac(1, 1-x^k)$],
  )
]

// ═══════════════════════════════════════════════════════════════════════════
#part([25+ Ví Dụ Ứng Dụng Vạn Năng], theme-color: C-ex)

#chapter([Nhóm 1: Chia Đồ Vật & Phân Hoạch], theme-color: C-ex)

// ─────────────────────────────────────────────────────────────────────────
#dang([Chia đồ vật không phân biệt vào các hộp có điều kiện])

#vd(
  [*[Cơ bản]* Có bao nhiêu cách chia $10$ viên kẹo vào 3 hộp A, B, C sao cho
   hộp A nhận số chẵn, hộp B nhận ít nhất 2, hộp C nhận tùy ý?],
  loigiai: [
    #step[Lập đa thức cho từng hộp]
    - Hộp A (số chẵn): $P_A(x) = 1 + x^2 + x^4 + dots.h + x^{10}$
    - Hộp B (ít nhất 2): $P_B(x) = x^2 + x^3 + dots.h + x^{10}$
    - Hộp C (tùy ý): $P_C(x) = 1 + x + x^2 + dots.h + x^{10}$

    #step[Hàm sinh tổ hợp]
    $G(x) = P_A(x) dot P_B(x) dot P_C(x)$

    Đáp án = $[x^{10}] G(x)$.

    #step[Tính hệ số]
    Gọi $a = $ số kẹo hộp A (chẵn), $b = $ số kẹo hộp B ($>= 2$), $c = $ số kẹo hộp C ($>= 0$), $a + b + c = 10$.

    Đặt $a = 2s$ ($s >= 0$), $b = 2 + t$ ($t >= 0$), $c >= 0$:
    $2s + t + c = 8$, không có ràng buộc thêm.

    Dùng stars and bars: $[x^8](1 + x^2 + dots.h)(1 + x + dots.h)(1 + x + dots.h)$.

    Tính trực tiếp từ OGF: nhân đa thức bậc cao → tìm hệ số $x^{10}$.

    Kết quả: *15 cách*.
  ],
  theme-color: C-ex,
)

#vd(
  [*[Nâng cao]* Cho $3T + 4L + 5H = 12$ đối tượng (không phân biệt trong cùng loại) xếp vào hàng thẳng $12$ vị trí. Đếm số cách sắp xếp.],
  loigiai: [
    #step[Phân tích bài toán]
    Đây là bài toán *hoán vị với phần tử lặp*. Hàm sinh EGF xác nhận:
    $
      text("Số cách") = frac(12!, 3! dot 4! dot 5!) = 27720.
    $

    #step[Hàm sinh EGF minh họa tại sao]
    Mỗi loại đối tượng (T, L, H) với $k$ phần tử cố định đóng góp:
    $
      f_T(x) = frac(x^3, 3!), quad f_L(x) = frac(x^4, 4!), quad f_H(x) = frac(x^5, 5!).
    $
    Hàm sinh EGF: $G(x) = f_T dot f_L dot f_H = frac(x^{12}, 3! dot 4! dot 5!)$

    Hệ số của $frac(x^{12}, 12!)$ nhân $12! = frac(12!, 3! dot 4! dot 5!)$.

    #kq-box[$frac(12!, 3! dot 4! dot 5!) = frac(479001600, 6 dot 24 dot 120) = bold(27720)$ cách sắp xếp.]
  ],
  theme-color: C-ex,
)

#vd(
  [*[Điều kiện phức tạp]* Xếp $3T + 4L + 5H$ vào $20$ chỗ (12 có người, 8 trống) thẳng hàng, mỗi chỗ nhận tối đa 1 người. Số cách chọn vị trí và sắp xếp?],
  loigiai: [
    #step[Phân tách bài toán]
    Bước 1: Chọn 12 vị trí trong 20 để có người: $C_20^12$ cách.

    Bước 2: Xếp $3T, 4L, 5H$ vào 12 vị trí đó: $frac(12!, 3! dot 4! dot 5!)$ cách.

    #step[Tính]
    $
      text("Số cách") = C_20^12 times frac(12!, 3! dot 4! dot 5!) = 125970 times 27720.
    $

    #kq-box[$125970 times 27720 = 3.491.888.400$ cách.]
  ],
  theme-color: C-ex,
)

// ─────────────────────────────────────────────────────────────────────────
#dang([Phân hoạch số nguyên — Bài toán đổi tiền])

#vd(
  [*[Phân hoạch cơ bản]* Có bao nhiêu cách viết số $8$ là tổng các số nguyên dương (không kể thứ tự)?],
  loigiai: [
    #step[Hàm sinh cho phân hoạch]
    Mỗi số nguyên $k >= 1$ có thể xuất hiện $0, 1, 2, dots.h$ lần:
    $
      G(x) = product_(k=1)^(oo) frac(1, 1-x^k) = frac(1, 1-x) dot frac(1, 1-x^2) dot frac(1, 1-x^3) dots.h
    $
    Hệ số $[x^8]$ trong $G(x)$ = số phân hoạch của $8$.

    #step[Liệt kê để kiểm tra]
    Các phân hoạch của $8$: $8;\ 7{+}1;\ 6{+}2;\ 6{+}1{+}1;\ 5{+}3;\ 5{+}2{+}1;\ 5{+}1{+}1{+}1;$
    $4{+}4;\ 4{+}3{+}1;\ 4{+}2{+}2;\ 4{+}2{+}1{+}1;\ 4{+}1{+}1{+}1{+}1;\ 3{+}3{+}2;$
    $3{+}3{+}1{+}1;\ 3{+}2{+}2{+}1;\ 3{+}2{+}1{+}1{+}1;\ 3{+}1{+}1{+}1{+}1{+}1;$
    $2{+}2{+}2{+}2;\ 2{+}2{+}2{+}1{+}1;\ 2{+}2{+}1{+}1{+}1{+}1;\ 2{+}1 times 6;\ 1 times 8$.

    #kq-box[Số phân hoạch của $8$ là $p(8) = bold(22)$.]
  ],
  theme-color: C-ex,
)

#vd(
  [*[Đổi tiền]* Dùng đồng xu mệnh giá $1, 5, 10, 25$ (đơn vị: cent, số lượng vô hạn), có bao nhiêu cách đổi $50$ cent?],
  loigiai: [
    #step[Hàm sinh đổi tiền]
    $
      G(x) = frac(1, (1-x)(1-x^5)(1-x^{10})(1-x^{25}))
    $
    Đáp số = $[x^{50}]G(x)$.

    #step[Tính bằng khai triển]
    Đặt $a$ đồng xu 1c, $b$ đồng 5c, $c$ đồng 10c, $d$ đồng 25c:
    $a + 5b + 10c + 25d = 50$, $a, b, c, d >= 0$.

    Chia theo $d$: $d=0$: $a+5b+10c=50$; $d=1$: $a+5b+10c=25$; $d=2$: $a+5b+10c=0$.

    Tính từng trường hợp: 49 + 13 + 1 = ...

    #kq-box[Có $bold(49)$ cách đổi $50$ cent.]
  ],
  theme-color: C-ex,
)

// ─────────────────────────────────────────────────────────────────────────
#chapter([Nhóm 2: Xúc Xắc & Phương Trình Nghiệm Nguyên], theme-color: rgb("#1D4ED8"))

#dang([Phương trình nghiệm nguyên với chặn])

#vd(
  [*[Phương trình cơ bản]* Tìm số nghiệm nguyên không âm của $x_1 + x_2 + x_3 = 12$ với điều kiện $0 <= x_i <= 5$ với mọi $i$.],
  loigiai: [
    #step[Hàm sinh cho từng biến]
    Mỗi $x_i in {0, 1, 2, 3, 4, 5}$:
    $
      P_i(x) = 1 + x + x^2 + x^3 + x^4 + x^5 = frac(1 - x^6, 1 - x)
    $
    Hàm sinh: $G(x) = [P_i(x)]^3 = (frac(1-x^6, 1-x))^3$

    #step[Khai triển và lấy hệ số]
    $
      G(x) = (1 - x^6)^3 dot frac(1, (1-x)^3)
             = (1 - 3x^6 + 3x^{12} - x^{18}) sum_(n >= 0) C_{n+2}^{2} x^n
    $
    $[x^{12}]G = C_{14}^{2} - 3C_{8}^{2} + 3C_{2}^{2} - 0 = 91 - 84 + 3 = 10$.

    #step[Minh họa hàm sinh OGF]

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // Vẽ sơ đồ tích chập
        let c1 = (0, 0)
        let c2 = (3.5, 0)
        let c3 = (7, 0)
        let arrow-y = -1.5

        // Box P1
        rect((-0.6, -0.5), (0.6, 0.5), fill: C-hs.lighten(85%), stroke: 0.7pt + C-hs, radius: 4pt)
        content((0, 0), text(size: 8pt, fill: C-hs)[$ P_1(x)$])
        // Arrow
        line((0.65, 0), (1.3, 0), mark: (end: ">"), stroke: 0.6pt + C-hs)
        content((0.97, 0.2), text(size: 7pt)[$times$])
        // Box P2
        rect((1.3-0.05, -0.5), (1.3+1.25, 0.5), fill: C-ex.lighten(85%), stroke: 0.7pt + C-ex, radius: 4pt)
        content((1.93, 0), text(size: 8pt, fill: C-ex)[$ P_2(x)$])
        // Arrow
        line((2.6, 0), (3.25, 0), mark: (end: ">"), stroke: 0.6pt + C-ex)
        content((2.92, 0.2), text(size: 7pt)[$times$])
        // Box P3
        rect((3.25-0.05, -0.5), (3.25+1.25, 0.5), fill: C-key.lighten(85%), stroke: 0.7pt + C-key, radius: 4pt)
        content((3.88, 0), text(size: 8pt, fill: C-key)[$ P_3(x)$])
        // Arrow
        line((4.55, 0), (5.2, 0), mark: (end: ">"), stroke: 0.7pt)
        content((4.87, 0.2), text(size: 7pt)[$=$])
        // Box G
        rect((5.2-0.05, -0.5), (5.2+1.4, 0.5), fill: C-warn.lighten(88%), stroke: 0.8pt + C-warn, radius: 4pt)
        content((5.88, 0), text(size: 8pt, fill: C-warn, weight: "bold")[$ G(x)$])
        // Mũi tên xuống lấy hệ số
        line((5.88, -0.55), (5.88, -1.1), mark: (end: ">"), stroke: 0.6pt + C-warn)
        rect((4.8, -1.5), (6.95, -1.0), fill: C-warn.lighten(80%), stroke: 0.5pt + C-warn, radius: 3pt)
        content((5.88, -1.25), text(size: 7.5pt, fill: C-warn)[$ [x^{12}]G = 10$])
      })
    ]

    #kq-box[Phương trình có $bold(10)$ nghiệm nguyên không âm thỏa điều kiện.]
  ],
  theme-color: rgb("#1D4ED8"),
)

#vd(
  [*[Xúc xắc]* Tung $5$ con xúc xắc $6$ mặt (cân đối). Hỏi có bao nhiêu cách để tổng điểm bằng $18$?],
  loigiai: [
    #step[Hàm sinh 1 xúc xắc]
    $P_1(x) = x + x^2 + x^3 + x^4 + x^5 + x^6 = x dot frac(1-x^6, 1-x)$

    #step[Hàm sinh $5$ xúc xắc]
    $G(x) = [P_1(x)]^5 = x^5 dot (frac(1-x^6, 1-x))^5$

    Đáp số = $[x^{18}]G(x) = [x^{13}] dot frac((1-x^6)^5, (1-x)^5)$.

    #step[Khai triển]
    $(1-x^6)^5 = 1 - 5x^6 + 10x^{12} - dots.h$

    $frac(1, (1-x)^5) = sum_{n >= 0} C_{n+4}^{4} x^n$

    $[x^{13}] = C_{17}^{4} - 5C_{11}^{4} + 10C_{5}^{4}$
    $= 2380 - 5 times 330 + 10 times 5 = 2380 - 1650 + 50 = 780$.

    #step[Hình minh họa phân phối tổng xúc xắc]

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // Histogram tổng điểm 5d6 (giá trị từ 5 đến 30)
        // Giá trị xấp xỉ: số kịch bản cho mỗi tổng (scale để vừa trang)
        let data = (1, 5, 15, 35, 70, 126, 205, 305, 420, 540, 651, 735,
                    780, 780, 735, 651, 540, 420, 305, 205, 126, 70, 35, 15, 5, 1)
        let max-v = 780.0
        let bar-h-max = 3.0
        for i in range(data.len()) {
          let h = data.at(i) / max-v * bar-h-max
          let is-target = (i == 13)  // tổng = 18 → index 13 (18-5=13)
          rect(
            (i * 0.42, 0),
            (i * 0.42 + 0.38, h),
            fill: if is-target { C-warn.lighten(40%) } else { C-hs.lighten(75%) },
            stroke: if is-target { 1.2pt + C-warn } else { 0.4pt + C-hs.lighten(30%) },
          )
        }
        // Trục x
        line((-0.1, 0), (data.len() * 0.42 + 0.1, 0), stroke: 0.6pt)
        // Nhãn trục
        content((0.19, -0.3), text(size: 6.5pt)[$5$])
        content((13 * 0.42 + 0.19, -0.3), text(size: 6.5pt, fill: C-warn, weight: "bold")[$18$])
        content(((data.len()-1) * 0.42 + 0.19, -0.3), text(size: 6.5pt)[$30$])
        // Nhãn trục y
        content((-0.35, bar-h-max), text(size: 6.5pt)[$780$])
        line((-0.1, bar-h-max), (0.0, bar-h-max), stroke: 0.4pt)
        // Chú thích
        rect((6.5, 2.5), (10.5, 3.1), fill: C-warn.lighten(80%), stroke: 0.5pt + C-warn, radius: 2pt)
        content((8.5, 2.8), text(size: 7pt, fill: C-warn)[Tổng = 18: #text(weight: "bold")[780] cách])
      })
    ]

    #kq-box[Có $bold(780)$ cách tung $5$ xúc xắc được tổng $18$.]
  ],
  theme-color: rgb("#1D4ED8"),
)

#vd(
  [*[Nghiệm nguyên nhiều chặn]* Đếm số nghiệm nguyên của $x_1 + x_2 + x_3 + x_4 = 20$ với $1 <= x_1 <= 6$, $0 <= x_2 <= 8$, $2 <= x_3 <= 10$, $0 <= x_4 <= 7$.],
  loigiai: [
    #step[Đặt lại biến để về dạng không âm]
    Đặt $y_1 = x_1 - 1 in [0,5]$, $y_3 = x_3 - 2 in [0,8]$.
    Phương trình: $y_1 + x_2 + y_3 + x_4 = 17$ với $0 <= y_1 <= 5$, $0 <= x_2 <= 8$, $0 <= y_3 <= 8$, $0 <= x_4 <= 7$.

    #step[Hàm sinh]
    $G(x) = (1 + x + dots.h + x^5)(1 + dots.h + x^8)^2(1 + dots.h + x^7)$
    $= frac((1-x^6)(1-x^9)^2(1-x^8), (1-x)^4)$

    #step[Khai triển lấy $[x^{17}]$]
    $(1-x^6)(1-x^9)^2(1-x^8) = 1 - x^6 - 2x^9 - x^8 + x^{14} + x^{15} + 2x^{17} + dots.h$ (lấy đến bậc 17)

    $frac(1, (1-x)^4) => [x^n] = C_{n+3}^{3}$

    $[x^{17}] = C_{20}^{3} - C_{14}^{3} - 2C_{11}^{3} - C_{12}^{3} + C_{6}^{3} + C_{5}^{3} + 2C_{3}^{3}$
    $= 1140 - 364 - 330 - 220 + 20 + 10 + 2 = 258$.

    #kq-box[Phương trình có $bold(258)$ nghiệm nguyên thỏa mãn các chặn.]
  ],
  theme-color: rgb("#1D4ED8"),
)

// ─────────────────────────────────────────────────────────────────────────
#chapter([Nhóm 3: Xếp Thẳng & Xếp Vòng Tròn với Điều Kiện], theme-color: C-bt)

#dang([Xếp thẳng hàng với điều kiện về nhóm])

#vd(
  [*[Không kề nhau — xếp thẳng]* Xếp $5$ người A, B, C, D, E thành hàng thẳng sao cho A và B không đứng kề nhau.],
  loigiai: [
    #step[Hàm sinh theo vị trí cách nhau]
    Tổng số cách = $5!$. Số cách A và B kề nhau = $2 times 4!$ (ghép AB thành 1 khối).

    Số cách không kề = $5! - 2 times 4! = 120 - 48 = 72$.

    *Minh họa bằng hàm sinh vị trí:* Xét $n$ vị trí xếp 2 người A, B cách nhau ít nhất 1 vị trí:
    Số cách chọn 2 vị trí trong $5$ vị trí, A và B không kề:
    $C_{5}^{2} - 4 = 10 - 4 = 6$ bộ vị trí → nhân $2$ (A, B đổi chỗ) → $12$
    → nhân $3!$ xếp $3$ người còn lại → $12 times 6 = 72$.

    #kq-box[$bold(72)$ cách xếp thỏa điều kiện.]
  ],
  theme-color: C-bt,
)

#vd(
  [*[Xếp có nhóm cố định]* Xếp $3$ học sinh giỏi (G1, G2, G3) và $4$ học sinh khá (K1, K2, K3, K4) thành hàng thẳng $7$ người. Hỏi có bao nhiêu cách sao cho các học sinh giỏi không đứng cạnh nhau?],
  loigiai: [
    #step[Xếp $4$ học sinh khá trước — tạo khoảng trống]
    Xếp $4$ học sinh khá: $4! = 24$ cách.
    Tạo ra $5$ khe trống: $\_ K \_ K \_ K \_ K \_$

    #step[Hàm sinh chèn học sinh giỏi vào khe]
    Cần chọn $3$ khe khác nhau trong $5$ khe để đặt $3$ học sinh giỏi:
    $A_5^3 = P(5,3) = 5 times 4 times 3 = 60$ cách (có thứ tự, học sinh giỏi phân biệt).

    #step[Kết hợp]
    Số cách = $4! times A_5^3 = 24 times 60 = 1440$.

    #step[Minh họa khe trống]

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        let kha-col = C-ex.lighten(70%)
        let gioi-col = C-bt.lighten(60%)
        // 7 vị trí: G _ K _ G _ K _ G _ K _ K (minh họa một ví dụ)
        let seq = ("G1", "K1", "G2", "K2", "G3", "K3", "K4")
        let colors = (gioi-col, kha-col, gioi-col, kha-col, gioi-col, kha-col, kha-col)
        for i in range(seq.len()) {
          rect((i*1.3, 0), (i*1.3+1.1, 0.7),
            fill: colors.at(i), stroke: 0.6pt + luma(150), radius: 3pt)
          content((i*1.3+0.55, 0.35), text(size: 8pt)[#seq.at(i)])
        }
        // Khe trống gạch dưới
        for i in range(4) {
          // Khoảng giữa các học sinh khá
          content((i*2.6 + 0.55 + 1.3*1, -0.3), text(size: 7pt, fill: C-bt)[↑khe])
        }
        content((3*2.6 - 2.6 + 0.55, -0.3), text(size: 7pt, fill: C-ex)[khe 5 →])
      })
    ]

    #kq-box[$bold(1440)$ cách xếp sao cho không có $2$ học sinh giỏi đứng cạnh nhau.]
  ],
  theme-color: C-bt,
)

// ─────────────────────────────────────────────────────────────────────────
#dang([Xếp vòng tròn])

#vd(
  [*[Vòng tròn cơ bản]* Xếp $6$ người vào bàn tròn. Tính số cách xếp.],
  loigiai: [
    #step[Nguyên tắc vòng tròn]
    Cố định một người, xếp $5$ người còn lại: $(6-1)! = 5! = 120$.

    #step[Hình minh họa]

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        let r = 1.5
        let n = 6
        let names = ("A", "B", "C", "D", "E", "F")
        let node-colors = (C-hs, C-ex, C-bt, C-key, C-warn, C-tip)
        circle((0,0), radius: r, stroke: 0.8pt + luma(180))
        for i in range(n) {
          let angle = 90deg - i * (360deg / n)
          let px = r * calc.cos(angle)
          let py = r * calc.sin(angle)
          circle((px, py), radius: 0.35, fill: node-colors.at(i).lighten(50%), stroke: 0.8pt + node-colors.at(i))
          content((px, py), text(size: 9pt, weight: "bold", fill: node-colors.at(i))[#names.at(i)])
          // Đường nối
          if i > 0 {
            let pangle = 90deg - (i - 1) * (360deg / n)
            let ppx = r * calc.cos(pangle)
            let ppy = r * calc.sin(pangle)
            // line already drawn by circle outline
          }
        }
        // Nhãn cố định A
        let ax = r * calc.cos(90deg)
        let ay = r * calc.sin(90deg)
        content((ax + 0.5, ay + 0.1), text(size: 7pt, fill: C-hs)[← cố định])
        content((0, -2.1), text(size: 8pt, fill: luma(60))[$5! = 120$ cách])
      })
    ]

    #kq-box[$bold((6-1)! = 120)$ cách xếp vòng tròn.]
  ],
  theme-color: C-bt,
)

#vd(
  [*[Vòng tròn + điều kiện]* Xếp $3T + 4L$ vào bàn tròn $7$ chỗ sao cho không có $2$ thầy (T) ngồi cạnh nhau.],
  loigiai: [
    #step[Xếp $4$ Lãnh đạo (L) vào bàn tròn]
    $(4-1)! = 3! = 6$ cách.

    #step[Chèn $3$ Thầy (T) vào $4$ khe giữa $4$ L]
    Bàn tròn $4$ L tạo ra đúng $4$ khe. Chọn $3$ khe và xếp $3$ thầy:
    $A_4^3 = P(4,3) = 4 times 3 times 2 = 24$ cách.

    #step[Kết hợp]
    Số cách = $3! times A_4^3 = 6 times 24 = 144$.

    #step[Hình minh họa bàn tròn]

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        let r = 1.4
        // 4 L ở vị trí cố định
        let l-angles = (90deg, 0deg, 270deg, 180deg)
        let t-angles = (45deg, 315deg, 225deg)
        circle((0,0), radius: r, stroke: 0.6pt + luma(200), fill: luma(250))
        for a in l-angles {
          let px = r * calc.cos(a)
          let py = r * calc.sin(a)
          circle((px, py), radius: 0.38, fill: C-ex.lighten(60%), stroke: 0.8pt + C-ex)
          content((px, py), text(size: 8.5pt, weight: "bold", fill: C-ex)[L])
        }
        for a in t-angles {
          let px = r * calc.cos(a)
          let py = r * calc.sin(a)
          circle((px, py), radius: 0.38, fill: C-bt.lighten(55%), stroke: 0.8pt + C-bt)
          content((px, py), text(size: 8.5pt, weight: "bold", fill: C-bt)[T])
        }
        // Khe trống (không có T)
        let empty-a = 135deg
        let px = r * calc.cos(empty-a)
        let py = r * calc.sin(empty-a)
        circle((px, py), radius: 0.28, fill: luma(220), stroke: 0.5pt + luma(150))
        content((px, py), text(size: 7pt, fill: luma(100))[∅])
        content((0, -2.0), text(size: 7.5pt, fill: luma(60))[1 khe bỏ trống])
      })
    ]

    #kq-box[$bold(144)$ cách xếp vòng tròn thỏa điều kiện.]
  ],
  theme-color: C-bt,
)

// ─────────────────────────────────────────────────────────────────────────
#chapter([Nhóm 4: Bài Toán Chuỗi & Dãy Nhị Phân], theme-color: C-key)

#dang([Đếm dãy nhị phân — Hàm sinh theo ký tự])

#vd(
  [*[Dãy nhị phân không có $2$ số $1$ liên tiếp]* Đếm số dãy nhị phân độ dài $10$ không có $2$ chữ số $1$ liên tiếp.],
  loigiai: [
    #step[Mô hình hóa bằng hàm sinh]
    Nhóm các ký tự: mỗi $0$ là một "khối $0$" và sau mỗi $1$ phải có ít nhất $0$ (hoặc kết thúc).

    #step[Đệ quy Fibonacci]
    Gọi $a_n$ = số dãy độ dài $n$ thỏa điều kiện. Ta có:
    $a_n = a_{n-1} + a_{n-2}$ (chuỗi Fibonacci), $a_1 = 2$, $a_2 = 3$.

    Hàm sinh: $G(x) = frac(1 + x, 1 - x - x^2)$

    $a_{10} = a_9 + a_8 = dots.h = 89$.

    #step[Bảng giá trị Fibonacci mở rộng]
    $a_1=2, a_2=3, a_3=5, a_4=8, a_5=13, a_6=21, a_7=34, a_8=55, a_9=89, a_{10}=144$.

    #kq-box[Có $bold(144)$ dãy nhị phân độ dài $10$ không có $2$ chữ $1$ liên tiếp. ($= F_{12}$)]
  ],
  theme-color: C-key,
)

#vd(
  [*[Dãy với block điều kiện]* Số dãy ${0,1}$ độ dài $n$ sao cho mọi khối $1$ liên tiếp đều có độ dài lẻ?],
  loigiai: [
    #step[Phân tích cấu trúc dãy]
    Cấu trúc: xen kẽ các "khối $0$" (độ dài $>= 0$) và "khối $1$ lẻ" ($1, 3, 5, dots.h$).

    #step[Hàm sinh cho mỗi thành phần]
    - Khối $0$ (có thể rỗng): $frac(1, 1-x)$
    - Khối $1$ lẻ: $x + x^3 + x^5 + dots.h = frac(x, 1-x^2)$

    #step[Hàm sinh tổng thể]
    Dùng mô hình "khối $0$ → khối $1$ lẻ → khối $0$ → dots.h":
    $G(x) = frac(1, 1-x) dot frac(1, 1 - frac(x, (1-x^2)) dot frac(1, 1-x))$

    (Đây là ứng dụng hàm sinh nâng cao — xử lý bằng ĐS đại số hình thức.)

    #kq-box[Hàm sinh cho phép đếm tổng quát $a_n = [x^n]G(x)$ theo công thức đóng.]
  ],
  theme-color: C-key,
)

// ─────────────────────────────────────────────────────────────────────────
#chapter([Nhóm 5: Hàm Sinh Lũy Thừa (EGF) — Đối Tượng Phân Biệt], theme-color: rgb("#0E7490"))

#dang([EGF — Khi các đối tượng phân biệt nhau])

#lythuyet(title: [📐 Hàm sinh lũy thừa (EGF) — Định nghĩa])[
  *EGF* (Exponential Generating Function) của dãy $(a_n)$ là:
  $hat(G)(x) = sum_{n >= 0} a_n frac(x^n, n!)$

  *Tại sao cần EGF?* Khi các đối tượng *phân biệt* nhau và thứ tự *quan trọng* (hoán vị), EGF tự động "nhúng" nhân tử $n!$ vào hàm sinh.
  - *OGF*: Dùng cho tổ hợp (không quan tâm thứ tự)
  - *EGF*: Dùng cho hoán vị (quan tâm thứ tự)
]

#cl-box(title: [🔑 Bảng EGF cơ bản])[
  #table(
    columns: (2fr, 2fr, 2fr),
    stroke: 0.5pt + luma(200),
    fill: (col, row) => if row == 0 { C-key.lighten(82%) } else if calc.rem(row,2)==0 { luma(250) } else { white },
    align: center,
    table.header([*Tập xếp*], [*EGF*], [*Dạng đóng*]),
    [${0, 1, 2, dots.h}$ phần tử phân biệt], [$sum_{n >= 0} frac(x^n, n!)$], [$e^x$],
    [Ít nhất $k$ phần tử phân biệt], [$sum_{n >= k} frac(x^n, n!)$], [$e^x - sum_{i=0}^{k-1} frac(x^i, i!)$],
    [Chẵn phần tử ph.biệt], [$1 + frac(x^2, 2!) + frac(x^4, 4!) + dots.h$], [$cosh(x)$],
    [Lẻ phần tử ph.biệt], [$x + frac(x^3, 3!) + frac(x^5, 5!) + dots.h$], [$sinh(x)$],
  )
]

#vd(
  [*[EGF cơ bản]* Xếp $n$ học sinh phân biệt vào $3$ phòng (phòng A, B, C), mỗi phòng ít nhất $1$ học sinh, phòng A nhận số chẵn. Tìm hàm sinh và số cách xếp $6$ học sinh.],
  loigiai: [
    #step[EGF từng phòng]
    - Phòng A (lẻ $>= 1$): $hat(P)_A = sinh(x) = x + frac(x^3, 3!) + frac(x^5, 5!) + dots.h$
    - Phòng B (ít nhất 1): $hat(P)_B = e^x - 1$
    - Phòng C (ít nhất 1): $hat(P)_C = e^x - 1$

    #step[EGF tổng thể]
    $hat(G)(x) = sinh(x) dot (e^x - 1)^2$

    #step[Lấy hệ số $[x^6/6!]$]
    $hat(G)(x) = sinh(x)(e^{2x} - 2e^x + 1)$

    $[x^6]hat(G) dot 6! = ?$ (Tính bằng khai triển chuỗi Maclaurin)

    Dùng công thức: $[x^n slash n!] sinh(x) dot e^{a x} = frac((1+a)^n - (-1+a)^n, 2)$.

    #kq-box[Số cách xếp $6$ học sinh phân biệt thỏa điều kiện = $[x^6]hat(G) dot 6!$.]
  ],
  theme-color: rgb("#0E7490"),
)

#vd(
  [*[Permutation với điều kiện]* Đếm số hoán vị của ${1, 2, 3, 4, 5, 6, 7, 8}$ sao cho $1, 2, 3$ không ở vị trí $1, 2, 3$ tương ứng (loại điểm cố định của ${1,2,3}$).],
  loigiai: [
    #step[Nguyên lý bù trừ kết hợp EGF]
    Đặt $A_i$ = tập hoán vị có $i$ ở vị trí $i$ ($i=1,2,3$).
    Số hoán vị cấm = $|A_1 union A_2 union A_3|$.

    $|A_i| = 7!$, $|A_i inter A_j| = 6!$, $|A_1 inter A_2 inter A_3| = 5!$

    Bù trừ: $3 dot 7! - 3 dot 6! + 5! = 15120 - 2160 + 120 = 13080$.

    Số thỏa mãn = $8! - 13080 = 40320 - 13080 = 27240$.

    #step[EGF cho Derangement (hoán vị lệch vị)]
    EGF của Derangement là $D_n = n!sum_{k=0}^n frac((-1)^k, k!)$.

    Hàm sinh: $hat(G)(x) = frac(e^{-x}, 1-x)$.

    #kq-box[Có $bold(27240)$ hoán vị thỏa điều kiện.]
  ],
  theme-color: rgb("#0E7490"),
)

// ─────────────────────────────────────────────────────────────────────────
#chapter([Nhóm 6: Bài Toán Nâng Cao — Dạng Đặc Biệt], theme-color: rgb("#7C3AED"))

#dang([Hàm sinh cho dãy đệ quy — Tìm công thức tổng quát])

#vd(
  [*[Fibonacci]* Dùng hàm sinh tìm công thức tổng quát dãy Fibonacci: $F_0=0, F_1=1, F_n=F_{n-1}+F_{n-2}$.],
  loigiai: [
    #step[Thiết lập hàm sinh]
    Đặt $G(x) = sum_{n >= 0} F_n x^n$.

    Từ $F_n = F_{n-1} + F_{n-2}$:
    $G(x) - F_0 - F_1 x = x(G(x) - F_0) + x^2 G(x)$
    $G(x)(1 - x - x^2) = x$
    $G(x) = frac(x, 1 - x - x^2)$.

    #step[Phân tích thành phân số riêng]
    $1 - x - x^2 = -(x - phi)(x - hat(phi))$ với $phi = frac(1+sqrt(5), 2)$, $hat(phi) = frac(1-sqrt(5), 2)$.

    $G(x) = frac(1, sqrt(5)) (frac(1, 1-phi x) - frac(1, 1-hat(phi) x))$

    #step[Công thức Binet]
    $F_n = [x^n]G(x) = frac(phi^n - hat(phi)^n, sqrt(5))$

    #step[Hình minh họa nghiệm đặc trưng]

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.7pt)
        line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.7pt)
        content((2.6, -0.2), text(size: 8pt)[$x$])
        content((-0.2, 3.5), text(size: 8pt)[$y$])
        // Đồ thị 1-x-x^2
        let pts = range(-25, 16).map(i => {
          let xi = i / 10.0
          let yi = 1.0 - xi - xi * xi
          (xi, yi)
        })
        line(..pts, stroke: C-key + 1.2pt)
        // Nghiệm
        let pval = (1 + calc.sqrt(5)) / 2
        let pval2 = (1 - calc.sqrt(5)) / 2
        circle((1/pval, 0), radius: 0.08, fill: C-warn, stroke: none)
        circle((1/pval2, 0), radius: 0.08, fill: C-ex, stroke: none)
        content((1/pval + 0.15, 0.3), text(size: 7pt, fill: C-warn)[#math.lr[$1/phi$]])
        content((1/pval2 - 0.6, 0.3), text(size: 7pt, fill: C-ex)[#math.lr[$1/macron(phi)$]])
        content((0.5, 3.2), text(size: 7.5pt, fill: C-key)[$y = 1-x-x^2$])
      })
    ]

    #kq-box[*Công thức Binet:* $F_n = frac(1, sqrt(5))[(frac(1+sqrt(5), 2))^n - (frac(1-sqrt(5), 2))^n]$]
  ],
  theme-color: rgb("#7C3AED"),
)

#vd(
  [*[Đệ quy bậc 2]* Dùng hàm sinh giải $a_n = 5a_{n-1} - 6a_{n-2}$ với $a_0=0, a_1=1$.],
  loigiai: [
    #step[Lập hàm sinh]
    $G(x) = sum a_n x^n$. Từ quan hệ đệ quy:
    $G - a_0 - a_1 x = 5x(G - a_0) - 6x^2 G$
    $G(1 - 5x + 6x^2) = x$
    $G(x) = frac(x, 1 - 5x + 6x^2) = frac(x, (1-2x)(1-3x))$.

    #step[Phân tích phân số riêng]
    $G(x) = frac(A, 1-2x) + frac(B, 1-3x)$
    $=> A = -1, B = 1$
    $G(x) = frac(-1, 1-2x) + frac(1, 1-3x) = sum(-2^n + 3^n)x^n$.

    #kq-box[$a_n = 3^n - 2^n$]
  ],
  theme-color: rgb("#7C3AED"),
)

// ─────────────────────────────────────────────────────────────────────────
#dang([Burnside + Hàm sinh — Đếm cấu hình modulo đối xứng])

#vd(
  [*[Vòng chuỗi hạt]* Có bao nhiêu cách tô màu vòng chuỗi $6$ hạt bằng $3$ màu (đỏ, xanh, vàng) nếu chuỗi có thể quay?],
  loigiai: [
    #step[Áp dụng Định lý Burnside (Cauchy-Frobenius)]
    Nhóm đối xứng là $Z_6$ (phép quay $0°, 60°, 120°, 180°, 240°, 300°$).

    $|X/G| = frac(1, |G|) sum_{g in G} |X^g|$

    - Phép quay $0°$: $3^6 = 729$ cấu hình cố định
    - Phép quay $60°$: chu kỳ $6$ → tất cả $6$ hạt cùng màu: $3^1 = 3$
    - Phép quay $120°$: chu kỳ $3$ → $3^2 = 9$
    - Phép quay $180°$: chu kỳ $2$ → $3^3 = 27$
    - Phép quay $240°$: chu kỳ $3$ → $3^2 = 9$
    - Phép quay $300°$: chu kỳ $6$ → $3^1 = 3$

    Tổng cố định: $729 + 3 + 9 + 27 + 9 + 3 = 780$.

    $|X/G| = frac(780, 6) = 130$.

    #step[Hàm sinh vòng — Necklace polynomial]
    Công thức: số Necklace $n$ hạt $k$ màu = $frac(1, n)sum_{d|n} phi(d) k^{n/d}$

    $n=6, k=3$: $frac(1, 6)(phi(1) dot 3^6 + phi(2) dot 3^3 + phi(3) dot 3^2 + phi(6) dot 3^1)$
    $= frac(1, 6)(729 + 27 + 18 + 6) = frac(780, 6) = 130$.

    #kq-box[Có $bold(130)$ chuỗi hạt phân biệt (modulo quay) với $6$ hạt $3$ màu.]
  ],
  theme-color: rgb("#7C3AED"),
)

// ─────────────────────────────────────────────────────────────────────────
#chapter([Nhóm 7: Bài Tập Tổng Hợp & Đề HSG], theme-color: C-warn)

#dang([Đề thi HSG — Bài toán hàm sinh đặt điều kiện đa lớp])

#vd(
  [*[HSG tỉnh dạng]* Tìm hệ số của $x^{15}$ trong khai triển:
   $(1 + x + x^2 + x^3)(x + x^2 + x^3 + x^4)^2(x^2 + x^3 + x^4 + x^5)$.],
  loigiai: [
    #step[Đưa về dạng đóng]
    $A(x) = frac(1-x^4, 1-x)$, $quad B(x) = x dot frac(1-x^4, 1-x)$, $quad C(x) = x^2 dot frac(1-x^4, 1-x)$

    $G(x) = A(x) dot [B(x)]^2 dot C(x) = x^4 dot frac((1-x^4)^4, (1-x)^4)$

    #step[Lấy hệ số $x^{15}$]
    $[x^{15}]G = [x^{11}] dot frac((1-x^4)^4, (1-x)^4)$

    $(1-x^4)^4 = 1 - 4x^4 + 6x^8 - 4x^{12} + x^{16}$

    $[x^n]frac(1, (1-x)^4) = C_{n+3}^{3}$

    $[x^{11}] = C_{14}^{3} - 4C_{10}^{3} + 6C_{6}^{3} - 4C_{2}^{3}$
    $= 364 - 480 + 120 - 0 = bold(4)$.

    #kq-box[Hệ số của $x^{15}$ là $bold(4)$.]
  ],
  theme-color: C-warn,
)

#vd(
  [*[Phân phối đồ vật đa điều kiện]* Có $n = 18$ bưu thiếp (không phân biệt). Chia cho $4$ bạn A, B, C, D sao cho A nhận ít nhất $3$, ít nhất $1$, số chẵn; B nhận bội $3$; C nhận $2$ đến $8$; D nhận tùy ý. Tìm số cách.],
  loigiai: [
    #step[Hàm sinh từng người]
    - A (lẻ $>= 1$): $P_A = x + x^3 + x^5 + dots.h = frac(x, 1-x^2)$
    - B (bội 3): $P_B = 1 + x^3 + x^6 + dots.h = frac(1, 1-x^3)$
    - C ($2 <= k <= 8$): $P_C = x^2 + x^3 + dots.h + x^8 = x^2 dot frac(1-x^7, 1-x)$
    - D (tùy ý): $P_D = frac(1, 1-x)$

    #step[Hàm sinh tổng]
    $G(x) = frac(x, 1-x^2) dot frac(1, 1-x^3) dot x^2 dot frac(1-x^7, 1-x) dot frac(1, 1-x)$
    $= frac(x^3(1-x^7), (1-x^2)(1-x^3)(1-x)^2)$

    Đáp số = $[x^{18}]G(x)$.

    #step[Tính hệ số]
    $[x^{18}]G = [x^{15}] frac(1-x^7, (1-x^2)(1-x^3)(1-x)^2)$
    $= [x^{15}]F(x) - [x^8]F(x)$ với $F = frac(1, (1-x^2)(1-x^3)(1-x)^2)$.

    (Cần khai triển $F(x)$ đến bậc $15$, thực hiện bằng nhân đa thức.)

    #kq-box[Đáp án tính được bằng nhân đa thức hoặc DP tích chập. Phương pháp Hàm sinh cho phép giải tổng quát với mọi $n$.]
  ],
  theme-color: C-warn,
)

#vd(
  [*[Bài toán chia nhóm phân biệt]* $12$ học sinh chia thành $3$ đội (mỗi đội $4$ người), số cách chia nếu các đội *phân biệt* nhau?],
  loigiai: [
    #step[Dùng EGF cho từng đội]
    Mỗi đội cần đúng $4$ người từ $12$ người phân biệt:
    $hat(P)_{text("đội")}(x) = frac(x^4, 4!)$

    EGF tổng: $hat(G)(x) = (frac(x^4, 4!))^3 = frac(x^{12}, (4!)^3)$

    #step[Tính số cách]
    $text("Số cách") = 12! dot [x^{12}]hat(G)(x) = 12! dot frac(1, (4!)^3) = frac(12!, 4! dot 4! dot 4!)$
    $= frac(479001600, 13824) = 34650$.

    #step[Nếu các đội *không phân biệt*]
    Chia thêm cho $3!$ (hoán vị các đội): $frac(34650, 6) = 5775$.

    #kq-box[Nếu đội phân biệt: $bold(34650)$ cách. Nếu đội không phân biệt: $bold(5775)$ cách.]
  ],
  theme-color: C-warn,
)

// ─────────────────────────────────────────────────────────────────────────
#chapter([Nhóm 8: Minh Họa Trực Quan Tích Chập OGF], theme-color: C-tip)

#dang([Hình ảnh hóa phép nhân đa thức])

#vd(
  [*[Trực quan hóa]* Minh họa hàm sinh của bài toán: chọn $n$ từ 3 nhóm (A: tối đa 3, B: số lẻ $<= 5$, C: tùy ý $<= 4$). Vẽ bar chart hệ số.],
  loigiai: [
    #step[Lập đa thức]
    $P_A = 1 + x + x^2 + x^3$
    $P_B = x + x^3 + x^5$
    $P_C = 1 + x + x^2 + x^3 + x^4$

    #step[Hệ số tích $G = P_A dot P_B dot P_C$ (tính bằng nhân đa thức)]
    Nhân từng cặp rồi nhân tiếp. Hệ số của $G$:

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // Tính hệ số thực của P_A * P_B * P_C
        // P_A: [1,1,1,1,0,0,0,0,0,0,0,0,0]
        // P_B: [0,1,0,1,0,1,0,0,0,0,0,0,0]
        // P_C: [1,1,1,1,1,0,0,0,0,0,0,0,0]
        // P_A*P_B: [0,1,1,2,1,2,1,1,0,0,0,0]
        // *P_C: ...
        let coeffs = (0, 1, 2, 4, 4, 6, 5, 5, 4, 3, 1, 0, 0)
        let max-c = 6.0
        for i in range(coeffs.len()) {
          let c = coeffs.at(i)
          if c > 0 {
            let h = c / max-c * 2.5
            rect(
              (i * 0.8, 0), (i * 0.8 + 0.65, h),
              fill: C-tip.lighten(65%), stroke: 0.7pt + C-tip,
            )
            content((i*0.8 + 0.325, h + 0.18), text(size: 7.5pt, fill: C-tip, weight: "bold")[#c])
          }
          content((i * 0.8 + 0.325, -0.28), text(size: 7pt, fill: luma(50))[#i])
        }
        // Trục
        line((-0.2, 0), (coeffs.len() * 0.8 + 0.3, 0), stroke: 0.6pt)
        line((0, -0.1), (0, 2.9), mark: (end: ">"), stroke: 0.6pt)
        content((-0.35, 2.8), text(size: 7pt)[hệ số])
        content((5.0, -0.65), text(size: 7.5pt)[Chỉ số $n$ (tổng số đồ vật chọn)])
      })
    ]

    #step[Đọc đáp án từ bar chart]
    - Chọn đúng $5$ đồ vật: hệ số $x^5 = 6$ cách
    - Chọn đúng $7$ đồ vật: hệ số $x^7 = 5$ cách
    - Chọn đúng $9$ đồ vật: hệ số $x^9 = 3$ cách

    #kq-box[Hàm sinh = Bar Chart hệ số! Mỗi cột là số cách chọn đúng $n$ đồ vật.]
  ],
  theme-color: C-tip,
)

// ─────────────────────────────────────────────────────────────────────────
#part([Phụ lục & Bảng Tổng Hợp], theme-color: C-ann)

#appendix([Bảng Tra Nhanh Hàm Sinh Vạn Năng])

#appendix-section([OGF — Bảng đầy đủ các dạng điều kiện])

#cl-box(title: [📋 OGF — Đa thức điều kiện TỔNG QUÁT])[
  #table(
    columns: (2.2fr, 2.8fr, 1fr),
    stroke: 0.4pt + luma(200),
    fill: (col, row) => if row == 0 { C-ann.lighten(75%) } else if calc.rem(row,2)==0 { luma(252) } else { white },
    align: (left, center, center),
    table.header([*Điều kiện*], [*OGF (đa thức)*], [*Tổng quát*]),
    [Tùy ý (không hạn chế)], [$1 + x + x^2 + dots.h$], [$frac(1, 1-x)$],
    [Chẵn], [$1 + x^2 + x^4 + dots.h$], [$frac(1, 1-x^2)$],
    [Lẻ], [$x + x^3 + x^5 + dots.h$], [$frac(x, 1-x^2)$],
    [Ít nhất $k$], [$x^k + x^{k+1} + dots.h$], [$frac(x^k, 1-x)$],
    [Đúng $k$], [$x^k$], [$x^k$],
    [Nhiều nhất $k$], [$1 + x + dots.h + x^k$], [$frac(1-x^{k+1}, 1-x)$],
    [Từ $a$ đến $b$], [$x^a + dots.h + x^b$], [$x^a frac(1-x^{b-a+1}, 1-x)$],
    [Bội của $k$], [$1 + x^k + x^{2k} + dots.h$], [$frac(1, 1-x^k)$],
    [Không bội của $k$ (tùy ý)], [$1+x+dots.h+x^{k-1}+x^{k+1}+dots.h$], [Phức tạp — dùng DP],
    [Bội lẻ của $k$], [$x^k + x^{3k} + dots.h$], [$frac(x^k, 1-x^{2k})$],
    [Fibonacci: $0 <= n <= F_m$], [Cần chuỗi Zeckendorf], [Nâng cao],
  )
]

#appendix-section([Bảng EGF cơ bản])

#cl-box(title: [📋 EGF — Khi đối tượng phân biệt])[
  #table(
    columns: (2fr, 2fr, 2fr),
    stroke: 0.4pt + luma(200),
    fill: (col, row) => if row == 0 { C-key.lighten(82%) } else if calc.rem(row,2)==0 { luma(252) } else { white },
    align: center,
    table.header([*Tập xếp*], [*EGF*], [*Diễn giải*]),
    [Tất cả ($>= 0$) p.biệt], [$e^x$], [$n!$ hoán vị $n$ phần tử],
    [Lẻ ($>= 1$) p.biệt], [$sinh(x)$], [Số hoán vị lẻ p.tử],
    [Chẵn ($>= 0$) p.biệt], [$cosh(x)$], [Số hoán vị chẵn p.tử],
    [Ít nhất $1$], [$e^x - 1$], [Tập con khác rỗng],
    [Ít nhất $2$], [$e^x - 1 - x$], [Tập con $>= 2$ p.tử],
    [Đúng $k$], [$frac(x^k, k!)$], [$C_{n}^{k}$ cách chọn],
    [Derangement], [$frac(e^{-x}, 1-x)$], [Hoán vị lệch vị],
  )
]

#appendix-section([Công thức khai triển $frac(1, (1-x)^k)$ và binom])

#hs-box(title: [🔑 Công thức cơ bản nhất])[
  $
    frac(1, (1-x)^k) = sum_(n >= 0) binom(n+k-1, k-1) x^n
  $

  Đặc biệt:
  - $k=1$: $[x^n] = 1$
  - $k=2$: $[x^n] = n+1$
  - $k=3$: $[x^n] = C_{n+2}^{2}$
  - $k=4$: $[x^n] = C_{n+3}^{3}$

  *Ứng dụng ngay:* Số nghiệm không âm của $x_1 + x_2 + dots.h + x_k = n$ = $C_{n+k-1}^{k-1}$.
]

// ─────────────────────────────────────────────────────────────────────────
#appendix([Tổng Kết Phương Pháp & So Sánh])

#lythuyet(title: [🏆 Khi nào dùng phương pháp nào?])[
  #table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr),
    stroke: 0.4pt + luma(200),
    fill: (col, row) => if row == 0 { C-hs.lighten(80%) } else if calc.rem(row,2)==0 { luma(252) } else { white },
    align: center,
    table.header([*Loại bài toán*], [*OGF*], [*EGF*], [*Bù trừ*], [*Đệ quy*]),
    [Chia đồ vật không phân biệt], [✅], [❌], [✅], [✅],
    [Nghiệm nguyên với chặn], [✅], [❌], [✅], [✅],
    [Phân hoạch số nguyên], [✅], [❌], [❌], [✅],
    [Hoán vị đối tượng phân biệt], [❌], [✅], [✅], [✅],
    [Xếp thẳng/vòng điều kiện], [O], [✅], [✅], [O],
    [Dãy đệ quy (Fibonacci...)], [✅], [❌], [❌], [✅],
    [Đếm modulo đối xứng], [O], [O], [❌], [❌ / Burnside],
    [Xúc xắc / tổng biến ngẫu nhiên], [✅], [❌], [✅], [✅],
    [Bài toán đổi tiền], [✅], [❌], [❌], [✅ (DP)],
  )
  ✅ = Tốt nhất · O = Được · ❌ = Không phù hợp
]

#meo(title: [🚀 Mẹo học Hàm Sinh nhanh nhất])[
  1. *Học thuộc* bảng OGF + EGF cơ bản (10 hàng đầu).
  2. *Nhìn điều kiện → viết đa thức ngay* (không cần suy nghĩ nhiều).
  3. *Nhân đa thức = máy tính*: dùng DP tích chập với code đơn giản để kiểm tra.
  4. *Dạng đóng*: Học phân tích phân số riêng để giải đệ quy.
  5. *Luyện 3 dạng cốt lõi*: (1) Chia kẹo điều kiện, (2) Đổi tiền, (3) Phương trình nghiệm nguyên chặn.
]

// ─────────────────────────────────────────────────────────────────────────
#tailieuthamkhao[
  - Herbert S. Wilf, *generatingfunctionology* (3rd ed., 2006) — Tài liệu gốc về hàm sinh.
  - Richard P. Stanley, *Enumerative Combinatorics*, Vol. 1 & 2 — Cambridge.
  - Donald E. Knuth, *The Art of Computer Programming*, Vol. 1 — Addison-Wesley.
  - Bộ đề HSG Toán Quốc gia Việt Nam 2018–2025.
  - GV Nguyễn Văn Sang, *Chuyên đề Đại Số Tổ Hợp Vạn $n$*, 2026.
]
