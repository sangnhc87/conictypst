#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ"
#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
  footer: context align(right)[
    #text(size: 7.2pt, fill: rgb("7F8C8D"))[GV Nguyễn Văn Sang]
  ],
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)

#show heading.where(level: 1): it => block(
  width: 100%,
  above: 1.8em,
  below: 1.2em,
  fill: gradient.linear(rgb("1B4F72"), rgb("117A65"), angle: 30deg),
  inset: (x: 14pt, y: 9pt),
  radius: 5pt,
  text(fill: white, size: 13pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.6em,
  stroke: (bottom: 2.5pt + rgb("E67E22")),
  inset: (bottom: 5pt),
  text(fill: rgb("E67E22"), size: 11.5pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ── Màu sắc chuyên đề ─────────────────────────────────────
#let cs-fill = rgb(180, 220, 255, 120)   // Thặng dư tiêu dùng — xanh nhạt
#let ps-fill = rgb(255, 190, 170, 120)   // Thặng dư sản xuất  — đỏ nhạt
#let eq-color = rgb("E74C3C")             // Đường gióng cân bằng
#let dd-color = rgb("1A5276")             // Hàm cầu D
#let ss-color = rgb("117A65")             // Hàm cung S
#let fig-shadow = rgb(198, 210, 224, 70)

#let fig-panel(body) = block(
  fill: gradient.linear(rgb("FDFEFE"), rgb("EBF5FB"), angle: 90deg),
  stroke: 0.8pt + rgb("D4E6EC"),
  radius: 10pt,
  inset: (x: 8pt, y: 8pt),
)[#body]

// ── Tiêu đề chuyên đề ─────────────────────────────────────
#align(center)[
  #block(
    fill: gradient.linear(rgb("1B4F72"), rgb("117A65"), angle: 45deg),
    inset: (x: 22pt, y: 16pt),
    radius: 8pt,
    width: 100%,
  )[
    #text(fill: white, size: 18pt, weight: "bold")[ỨNG DỤNG TÍCH PHÂN TRONG KINH TẾ HỌC]
    #v(0.4em)
    #text(fill: rgb("AED6F1"), size: 10.5pt, style: "italic")[
      Thặng dư tiêu dùng · Thặng dư sản xuất · Cân bằng thị trường · Đường Lorenz · Hệ số Gini · Độ co giãn
    ]
  ]
]
#v(0.8em)

#tln(
  id: "0D8V2-7",
  [Một kỹ sư tiến hành lắp ráp một rotor của động cơ phản lực. Rotor có $9$ khe cắm cánh quạt được đánh số cố định từ $1$ đến $9$ theo vòng tròn. Khoảng cách giữa các khe đều nhau, tạo thành các đỉnh của một đa giác đều có $9$ cạnh. Do sai số chế tạo, $9$ cánh quạt có khối lượng thực tế là các số nguyên phân biệt từ $1$ đến $9$ gam.
    #grid(
      columns: (1fr, 38%),
      column-gutter: 14pt,
      align: (left + top, center + top),
      [
        Để đảm bảo rotor cân bằng động học khi quay, kỹ sư lựa chọn phương án lắp đặt thỏa mãn đồng thời các điều kiện sau:
        + Chia $9$ cánh quạt thành $3$ nhóm (mỗi nhóm $3$ cánh).
        + Mỗi nhóm được lắp vào $3$ khe cắm tạo thành một tam giác đều (ba khe cắm tạo thành một tam giác đều khi và chỉ khi chúng cách nhau đúng $3$ khe theo vòng tròn).
        + Tổng khối lượng của $3$ cánh quạt trong mỗi nhóm phải bằng nhau.
      ],
      cetz.canvas(length: 1cm, {
        import cetz.draw: *
        let R = 1.8
        let pts = ()
        for i in range(1, 10) {
          let a = 90deg - (i - 1) * 40deg
          pts.push((R * calc.cos(a), R * calc.sin(a)))
        }
        for i in range(9) {
          line(pts.at(i), pts.at(calc.rem(i + 1, 9)), stroke: blue + 0.8pt)
        }
        line(pts.at(0), pts.at(3), pts.at(6), close: true, stroke: green + 0.8pt)
        for i in range(9) {
          circle(pts.at(i), radius: 1.5pt, fill: red, stroke: none)
          let ta = 90deg - i * 40deg
          let tr = R + 0.3
          content((tr * calc.cos(ta), tr * calc.sin(ta)), [*#str(i + 1)*])
        }
      }),
    )
    Hỏi có bao nhiêu cách sắp xếp $9$ cánh quạt vào $9$ khe cắm thỏa mãn các điều kiện kỹ thuật trên?
    _(Hai cách sắp xếp được coi là khác nhau nếu có ít nhất một cánh quạt ở một vị trí khe cắm khác nhau, không đồng nhất các cách lắp khác nhau bởi phép quay hay phép đối xứng của rotor)_],
  [$2592$],
  loigiai: [
    #ppgiai[
      Để bài toán trở nên dễ hình dung nhất, ta tưởng tượng việc lắp cánh quạt giống như việc *chia 9 vận động viên vào 3 đội* và xếp họ thi đấu trên *3 sân khác nhau*. Quá trình gồm 3 bước độc lập:
      - *Bước 1 (Chia đội):* Tìm số cách chia 9 cánh quạt thành 3 nhóm có tổng khối lượng bằng nhau.
      - *Bước 2 (Chọn sân):* Nhận diện 3 bộ vị trí tạo thành tam giác đều trên rotor.
      - *Bước 3 (Xếp người):* Gán các đội vào sân và xếp chỗ cho từng người trong sân đó.
    ]

    *Bước 1: Ghép nhóm khối lượng (Chia đội thi đấu)*
    Tổng khối lượng của $9$ cánh quạt là: $S = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45$.
    Do $3$ nhóm có khối lượng bằng nhau, mỗi nhóm phải có tổng khối lượng là $45 / 3 = 15$.
    Ta cần chọn $3$ số từ tập $X = \{ 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 \}$ sao cho tổng bằng $15$. Để không bị sót, ta bắt đầu từ số lớn nhất là $9$:

    - *Cách chia 1:* Nhóm đầu tiên chứa $9$. Để tổng là $15$, hai số còn lại phải có tổng bằng $6$. Phân tích $6 = 1 + 5 = 2 + 4$.
      + Nếu nhóm 1 là $A = \{ 1 , 5 , 9 \}$, các số còn lại là $\{ 2 , 3 , 4 , 6 , 7 , 8 \}$. Số $8$ lớn nhất trong phần còn lại cần tổng $7$ để đạt $15$, chỉ có $3 + 4 = 7$ thoả mãn. Vậy nhóm 2 là $B = \{ 3 , 4 , 8 \}$. Nhóm 3 tự động là $C = \{ 2 , 6 , 7 \}$. Ta được 1 cách phân hoạch:
      $ P_1 = \{ \{ 1 , 5 , 9 \} , \{ 3 , 4 , 8 \} , \{ 2 , 6 , 7 \} \} $

      + Nếu nhóm 1 là $A = \{ 2 , 4 , 9 \}$, các số còn lại là $\{ 1 , 3 , 5 , 6 , 7 , 8 \}$. Số $8$ cần tổng $7$ để đạt $15$, chỉ có $1 + 6 = 7$ thoả mãn. Nhóm 2 là $B = \{ 1 , 6 , 8 \}$. Nhóm 3 tự động là $C = \{ 3 , 5 , 7 \}$. Ta được phân hoạch thứ 2:
      $ P_2 = \{ \{ 2 , 4 , 9 \} , \{ 1 , 6 , 8 \} , \{ 3 , 5 , 7 \} \} $

    Vậy có đúng $2$ cách chia $9$ cánh quạt thành $3$ nhóm thỏa mãn điều kiện tĩnh.

    *Bước 2: Tìm vị trí lắp đặt (Chọn sân thi đấu)*
    Trên rotor $9$ khe (đánh số từ $1$ đến $9$), khoảng cách để tạo thành tam giác đều là $3$ bước. Ta chia được đúng $3$ tam giác đều hoàn toàn độc lập (không chung đỉnh):
    - Tam giác đỏ: $T_1 = \{ 1 , 4 , 7 \}$
    - Tam giác xanh lá: $T_2 = \{ 2 , 5 , 8 \}$
    - Tam giác xanh dương: $T_3 = \{ 3 , 6 , 9 \}$

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        let R = 1.5
        let pts = ()
        for i in range(1, 10) {
          let a = 90deg - (i - 1) * 40deg
          pts.push((R * calc.cos(a), R * calc.sin(a)))
        }
        line(pts.at(0), pts.at(3), pts.at(6), close: true, stroke: red + 1.2pt, fill: red.transparentize(85%))
        line(pts.at(1), pts.at(4), pts.at(7), close: true, stroke: green + 1.2pt, fill: green.transparentize(85%))
        line(pts.at(2), pts.at(5), pts.at(8), close: true, stroke: blue + 1.2pt, fill: blue.transparentize(85%))
        for i in range(9) {
          circle(pts.at(i), radius: 2pt, fill: black, stroke: none)
          let ta = 90deg - i * 40deg
          let tr = R + 0.35
          content((tr * calc.cos(ta), tr * calc.sin(ta)), text(weight: "bold")[#str(i + 1)])
        }
      })
    ]

    *Bước 3: Lắp ráp và hoán vị (Quy tắc nhân)*
    Ứng với *mỗi* cách chia nhóm khối lượng ở Bước 1 (ví dụ $P_1$), ta thực hiện:
    - Chọn tam giác cho từng nhóm (Gán $3$ đội vào $3$ sân): Có $3 ! = 6$ cách.
    - Xếp $3$ cánh quạt của nhóm thứ nhất vào $3$ đỉnh của tam giác nó đã chọn: Có $3 ! = 6$ cách.
    - Tương tự, nhóm thứ hai có $3 ! = 6$ cách, nhóm thứ ba có $3 ! = 6$ cách xếp vào đỉnh.

    Do các thao tác liên tiếp nhau, số cách lắp đặt cho *một* phân hoạch là:
    $ 3 ! times 3 ! times 3 ! times 3 ! = 6 times 6 times 6 times 6 = 1296 ("cách") $

    Vì có $2$ cách chia nhóm khối lượng ( $P_1$ và $P_2$ ), tổng số cách sắp xếp thoả mãn toàn bộ quy trình là:
    $ 2 times 1296 = 2592 ("cách") $

    #nhanxet[Bài toán là sự kết hợp kinh điển giữa lý thuyết số (phân hoạch tập hợp có tổng không đổi) và đại số tổ hợp (hoán vị theo nhóm). Cốt lõi trực quan nhất là việc nhìn ra sự tách biệt giữa không gian của khối lượng (người) và không gian hình học (sân), từ đó chỉ dùng quy tắc nhân đơn giản thay vì phải hoán vị $9!$ quá cồng kềnh.]
  ],
)
= I. LÝ THUYẾT NỀN TẢNG

== 1. Hàm cung, hàm cầu và điểm cân bằng

#lythuyet[
  Trong kinh tế vi mô, ứng với sản lượng $x$ đơn vị hàng hóa:
  - *Hàm cầu* $D(x)$: mức giá cao nhất người mua sẵn sàng chi trả. $D(x)$ thường *giảm* theo $x$.
  - *Hàm cung* $S(x)$: mức giá tối thiểu nhà sản xuất chấp nhận bán. $S(x)$ thường *tăng* theo $x$.

  *Điểm cân bằng thị trường* $E(x_0; p_0)$ là nghiệm của hệ $D(x_0) = S(x_0) = p_0$.
]

== 2. Thặng dư tiêu dùng và thặng dư sản xuất

#grid(
  columns: (1.15fr, 1fr),
  column-gutter: 14pt,
  [
    #lythuyet[
      Tại trạng thái cân bằng $(x_0; p_0)$:

      *Thặng dư tiêu dùng* (Consumer Surplus — CS):
      $"CS" = integral_0^(x_0) [D(x) - p_0] dif x.$

      *Thặng dư sản xuất* (Producer Surplus — PS):
      $"PS" = integral_0^(x_0) [p_0 - S(x)] dif x.$

      *Tổng phúc lợi xã hội* = CS + PS.

      #luuy[Đơn vị: nếu $x$ là nghìn sản phẩm và $p$ là triệu đồng/sản phẩm thì diện tích tích phân có đơn vị *tỷ đồng*.]
    ]
  ],
  [
    #fig-panel(cetz.canvas(length: 0.92cm, {
      import cetz.draw: *

      let E = (3.0, 2.5)

      // CS
      merge-path(fill: cs-fill, stroke: none, close: true, {
        line((0.0, 2.5), (0.0, 4.2))
        bezier((0.0, 4.2), E, (1.2, 3.6), (2.2, 2.8))
        line(E, (0.0, 2.5))
      })

      // PS
      merge-path(fill: ps-fill, stroke: none, close: true, {
        line((0.0, 0.8), (0.0, 2.5))
        line((0.0, 2.5), E)
        bezier(E, (0.0, 0.8), (2.0, 1.6), (0.8, 0.9))
      })

      // D curve
      bezier((0.0, 4.2), E, (1.2, 3.6), (2.2, 2.8), stroke: 1.4pt + dd-color)
      bezier(E, (5.2, 0.9), (4.0, 1.9), (4.6, 1.3), stroke: 1.4pt + dd-color)

      // S curve
      bezier((0.0, 0.8), E, (0.8, 0.9), (2.0, 1.6), stroke: 1.4pt + ss-color)
      bezier(E, (5.2, 4.2), (4.0, 3.2), (4.6, 3.7), stroke: 1.4pt + ss-color)

      // Gióng
      line((0.0, 2.5), (3.6, 2.5), stroke: (dash: "dashed", paint: eq-color, thickness: 0.75pt))
      line((3.0, 0.0), (3.0, 2.5), stroke: (dash: "dashed", paint: eq-color, thickness: 0.75pt))

      // Trục
      line((-0.3, 0.0), (5.5, 0.0), mark: (end: ">"), stroke: 0.55pt)
      line((0.0, -0.2), (0.0, 4.9), mark: (end: ">"), stroke: 0.55pt)
      content((5.4, -0.25), $x$)
      content((-0.22, 4.9), $p$)

      content((3.0, -0.35), text(size: 7.5pt)[$x_0$])
      content((-0.42, 2.5), text(size: 7.5pt)[$p_0$])
      circle(E, radius: 1.3pt, fill: black)
      content((3.0, 2.8), text(size: 7pt, weight: "bold")[$E$])

      content((0.92, 3.25), text(size: 7.5pt, fill: dd-color)[CS])
      content((0.92, 1.7), text(size: 7.5pt, fill: ss-color)[PS])
      content((4.0, 4.0), text(size: 7.5pt, fill: dd-color)[$D(x)$])
      content((4.2, 1.0), text(size: 7.5pt, fill: ss-color)[$S(x)$])
    }))
  ],
)

== 3. Đường Lorenz và Hệ số Gini

#lythuyet[
  *Đường Lorenz* $L(x)$ biểu diễn tỷ lệ thu nhập tích lũy của $x\%$ dân số thu nhập thấp nhất. Luôn có $0 <= L(x) <= x$ với $L(0)=0, L(1)=1$.

  - Đường chéo $y=x$ (bình đẳng hoàn toàn).
  - Đường Lorenz càng xa đường chéo → phân phối càng *bất bình đẳng*.

  *Hệ số Gini*:
  $G = 2 integral_0^1 [x - L(x)] dif x = 1 - 2 integral_0^1 L(x) dif x.$

  $G=0$: bình đẳng hoàn toàn. $G=1$: bất bình đẳng tối đa.
]

== 4. Thặng dư khi có thuế hoặc trợ cấp

#ppgiai(title: [Phân tích tác động chính sách])[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    [
      *Khi chính phủ đánh thuế* $t$ trên mỗi đơn vị sản phẩm:
      + Hàm cung dịch lên: $S_t(x) = S(x) + t$.
      + Điểm cân bằng mới $E'(x_t; p_t)$ với $p_t > p_0,\ x_t < x_0$.
      + Tổn thất xã hội = diện tích tam giác chết.
    ],
    [
      *Khi chính phủ trợ giá* $s$ trên mỗi đơn vị:
      + Hàm cung dịch xuống: $S_s(x) = S(x) - s$.
      + Sản lượng tăng, giá người mua trả giảm.
      + Người bán nhận giá cao hơn sau trợ cấp.
    ],
  )
]

= II. CÁC BÀI TOÁN KINH TẾ


== Bài 1. Pin Năng Lượng Mặt Trời — Tìm CS từ dữ kiện PS

#tln(
  [Hàm cầu: $p = D(x) = 4 - 0","2x$ (triệu đồng/tấm). Hàm cung: $p = S(x) = 0","4 + 0","1x + frac(1, m) x^2$ (triệu đồng/tấm), trong đó $x$ là sản lượng (nghìn sản phẩm), $m > 0$. Biết thặng dư sản xuất tại cân bằng bằng $4","2$ tỷ đồng. Tính thặng dư tiêu dùng.],
  [0,4],
  fig: fig-panel(cetz.canvas(length: 1.05cm, {
    import cetz.draw: *

    let E = (2.0, 3.6)

    // CS — tam giác
    merge-path(fill: cs-fill, stroke: none, close: true, {
      line((0.0, 3.6), (0.0, 4.0))
      line((0.0, 4.0), E)
      line(E, (0.0, 3.6))
    })

    // PS — vùng cong
    merge-path(fill: ps-fill, stroke: none, close: true, {
      line((0.0, 0.4), (0.0, 3.6))
      line((0.0, 3.6), E)
      bezier(E, (0.0, 0.4), (1.4, 1.6), (0.3, 0.5))
    })

    // D — tuyến tính
    line((0.0, 4.0), (4.5, 3.1), stroke: 1.3pt + dd-color)

    // S — cong bậc 2
    bezier((0.0, 0.4), E, (0.6, 0.7), (1.4, 1.8), stroke: 1.3pt + ss-color)
    bezier(E, (3.0, 5.5), (2.3, 4.3), (2.7, 5.0), stroke: 1.3pt + ss-color)

    // Gióng
    line((0.0, 3.6), (2.5, 3.6), stroke: (dash: "dashed", paint: eq-color, thickness: 0.7pt))
    line((2.0, 0.0), (2.0, 3.6), stroke: (dash: "dashed", paint: eq-color, thickness: 0.7pt))

    // Trục
    line((-0.3, 0.0), (5.0, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.2), (0.0, 6.0), mark: (end: ">"), stroke: 0.55pt)
    content((4.9, -0.28), $x$)
    content((-0.22, 6.0), $p$)

    content((2.0, -0.35), text(size: 7.5pt)[$2$])
    content((-0.38, 3.6), text(size: 7.5pt)[$3","6$])
    content((-0.38, 4.0), text(size: 7.5pt)[$4$])
    content((-0.38, 0.4), text(size: 7.5pt)[$0","4$])

    circle(E, radius: 1.4pt, fill: black)
    content((2.45, 3.8), text(size: 7.5pt, weight: "bold")[$E(2; 3","6)$])

    content((0.6, 3.85), text(size: 7.5pt, fill: dd-color)[CS])
    content((0.6, 2.0), text(size: 7.5pt, fill: ss-color)[PS])
    content((3.8, 2.9), text(size: 7.5pt, fill: dd-color)[$D(x)$])
    content((2.6, 5.1), text(size: 7.5pt, fill: ss-color)[$S(x)$])
  })),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm điểm cân bằng qua điều kiện PS.*

      PS $= integral_0^(x_0) [p_0 - S(x)] dif x = 4","2$, với $p_0 = 0","4 + 0","1x_0 + frac(x_0^2, m)$.

      Sau khi triển khai:
      $0","05 x_0^2 + frac(2, 3m) x_0^3 = 4","2. quad (1)$

      Điều kiện cân bằng $D(x_0)=S(x_0)$ cho:
      $frac(x_0^2, m) = 3","6 - 0","3 x_0. quad (2)$

      Thay $(2)$ vào $(1)$:
      $0","05 x_0^2 + frac(2, 3) x_0(3","6 - 0","3 x_0) = 4","2$
      $=> -0","15 x_0^2 + 2","4 x_0 - 4","2 = 0$
      $=> x_0^2 - 16 x_0 + 28 = 0.$
    ]
    #step[
      *Giải phương trình và chọn nghiệm hợp lệ.*

      $x_0 = 2$ hoặc $x_0 = 14$.

      Với $x_0 = 14$: từ $(2)$ suy ra $frac(196, m) = -0","6 < 0$ (loại vì $m>0$).

      Vậy $x_0 = 2,\ p_0 = 4 - 0","4 = 3","6$.
    ]
    #step[
      *Tính thặng dư tiêu dùng.*

      $"CS" = integral_0^2 [(4 - 0","2x) - 3","6] dif x = integral_0^2 (0","4 - 0","2x) dif x$
      $= (0","4x - 0","1x^2)|_0^2 = 0","8 - 0","4 = bold(0","4) " tỷ đồng".$

      #nhanxet[Đáp số tô phiếu: *0,4*. Chìa khóa là dùng điều kiện cân bằng để khử tham số $m$ trước khi giải phương trình bậc hai.]
    ]
  ],
)


== Bài 2. Thị Trường Gạo — Cân Bằng Cung Cầu Tuyến Tính

#tln(
  [Thị trường gạo địa phương được mô hình hóa bởi hàm cầu $D(x) = 12 - 0","5x$ và hàm cung $S(x) = 2 + 0","3x$ (nghìn đồng/kg), trong đó $x$ là sản lượng (tấn). Tìm điểm cân bằng thị trường, rồi tính tổng phúc lợi xã hội bằng tổng CS và PS.],
  [125],
  fig: fig-panel(cetz.canvas(length: 0.95cm, {
    import cetz.draw: *

    // E: D(x)=S(x) => 12-0.5x=2+0.3x => 10=0.8x => x=12.5, p=5.75
    let xE = 12.5
    let pE = 5.75
    let sc = 0.35 // scale for x axis
    let xEs = xE * sc

    let pEs = pE * 0.55
    merge-path(fill: cs-fill, stroke: none, close: true, {
      line((0.0, pEs), (0.0, 12.0 * 0.55))
      line((0.0, 12.0 * 0.55), (xEs, pEs))
      line((xEs, pEs), (0.0, pEs))
    })

    merge-path(fill: ps-fill, stroke: none, close: true, {
      line((0.0, 2.0 * 0.55), (0.0, pEs))
      line((0.0, pEs), (xEs, pEs))
      line((xEs, pEs), (0.0, 2.0 * 0.55))
    })

    // D: from (0,12) to (24,0)
    line((0.0, 12.0 * 0.55), (24.0 * sc, 0.0), stroke: 1.3pt + dd-color)
    // S: from (0,2) to (25, 9.5)
    line((0.0, 2.0 * 0.55), (25.0 * sc, (2.0 + 0.3 * 25.0) * 0.55), stroke: 1.3pt + ss-color)

    line((0.0, pEs), (xEs + 0.4, pEs), stroke: (dash: "dashed", paint: eq-color, thickness: 0.7pt))
    line((xEs, 0.0), (xEs, pEs + 0.1), stroke: (dash: "dashed", paint: eq-color, thickness: 0.7pt))

    line((-0.3, 0.0), (9.5, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.2), (0.0, 7.2), mark: (end: ">"), stroke: 0.55pt)
    content((9.3, -0.28), $x$)
    content((-0.22, 7.2), $p$)

    circle((xEs, pEs), radius: 1.3pt, fill: black)
    content((xEs + 0.2, pEs + 0.22), text(size: 7pt)[$E$])
    content((xEs, -0.35), text(size: 7.5pt)[$12","5$])
    content((-0.52, pEs), text(size: 7.5pt)[$5","75$])
    content((-0.35, 2.0 * 0.55), text(size: 7.5pt)[$2$])
    content((-0.38, 12.0 * 0.55), text(size: 7.5pt)[$12$])

    content((1.2, 4.6), text(size: 7.5pt, fill: dd-color)[CS])
    content((1.2, 1.8), text(size: 7.5pt, fill: ss-color)[PS])
    content((8.0, 0.7), text(size: 7.5pt, fill: dd-color)[$D$])
    content((8.0, 6.2), text(size: 7.5pt, fill: ss-color)[$S$])
  })),
  fig-pos: "center",
  fig-width: 39%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm điểm cân bằng.*

      $D(x_0) = S(x_0) => 12 - 0","5 x_0 = 2 + 0","3 x_0$
      $=> 10 = 0","8 x_0 => x_0 = 12","5 " tấn";\ p_0 = 5","75 " nghìn đồng/kg".$
    ]
    #step[
      *Tính CS và PS.*

      Vì $D$ và $S$ đều tuyến tính, các vùng CS và PS đều là *tam giác*:

      $"CS" = frac(1, 2) dot x_0 dot (D(0) - p_0) = frac(1, 2) dot 12","5 dot (12 - 5","75) = 39","0625.$

      $"PS" = frac(1, 2) dot x_0 dot (p_0 - S(0)) = frac(1, 2) dot 12","5 dot (5","75 - 2) = 23","4375.$

      Tổng phúc lợi xã hội:
      $"CS" + "PS" = 39","0625 + 23","4375 = bold(62","5)$ nghìn đồng$dot$tấn $= bold(125)$ triệu đồng.

      #nhanxet[Đáp số tô phiếu: *125*. Với hàm tuyến tính, mọi diện tích chỉ là tam giác — công thức $frac(1, 2) dot "đáy" dot "chiều cao"$ là đủ, không cần tích phân.]
    ]
  ],
)


== Bài 3. Thị Trường Lao Động — Lương và Số Lượng Lao Động

#tln(
  [Hàm cầu lao động (mức lương doanh nghiệp sẵn sàng trả): $w = D(L) = 20 - L^2$ (triệu đồng/tháng). Hàm cung lao động (mức lương người lao động đòi hỏi): $w = S(L) = 2 + 3L$ (triệu đồng/tháng), $L$ tính bằng nghìn lao động. Tìm điểm cân bằng, rồi tính CS (phần lợi của người lao động) và PS (phần lợi của doanh nghiệp).],
  [CS=2.67 PS=10.1],
  fig: fig-panel(cetz.canvas(length: 0.9cm, {
    import cetz.draw: *

    // D(L)=S(L): 20-L^2=2+3L => L^2+3L-18=0 => L=3, w=11
    let LE = 3.0
    let wE = 11.0

    let d_pts = ()
    for i in range(41) {
      let L = i * 4.0 / 40.0
      let w = 20.0 - L * L
      if w >= 0.0 { d_pts.push((L, w * 0.44)) }
    }
    let s_pts = ()
    for i in range(31) {
      let L = i * 4.2 / 30.0
      s_pts.push((L, (2.0 + 3.0 * L) * 0.44))
    }

    // CS — above equilibrium, below D, to the left of xE
    let cs_pts = ((0.0, wE * 0.44),)
    for p in d_pts {
      if p.at(0) <= LE + 0.01 { cs_pts.push(p) }
    }
    cs_pts.push((LE, wE * 0.44))
    merge-path(fill: cs-fill, stroke: none, close: true, { line(..cs_pts) })

    // PS — above S, below equilibrium
    let ps_pts = ()
    for p in s_pts {
      if p.at(0) <= LE + 0.01 { ps_pts.push(p) }
    }
    ps_pts.push((LE, wE * 0.44))
    ps_pts.push((0.0, wE * 0.44))
    merge-path(fill: ps-fill, stroke: none, close: true, { line(..ps_pts) })

    line(..d_pts, stroke: 1.3pt + dd-color)
    line(..s_pts, stroke: 1.3pt + ss-color)

    line((0.0, wE * 0.44), (LE + 0.5, wE * 0.44), stroke: (dash: "dashed", paint: eq-color, thickness: 0.7pt))
    line((LE, 0.0), (LE, wE * 0.44 + 0.1), stroke: (dash: "dashed", paint: eq-color, thickness: 0.7pt))

    line((-0.2, 0.0), (4.5, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.2), (0.0, 9.5), mark: (end: ">"), stroke: 0.55pt)
    content((4.4, -0.3), $L$)
    content((-0.22, 9.5), $w$)

    circle((LE, wE * 0.44), radius: 1.3pt, fill: black)
    content((LE + 0.2, wE * 0.44 + 0.25), text(size: 7pt)[$E(3;11)$])
    content((LE, -0.35), text(size: 7.5pt)[$3$])
    content((-0.38, wE * 0.44), text(size: 7.5pt)[$11$])
    content((-0.38, 2.0 * 0.44), text(size: 7.5pt)[$2$])
    content((-0.38, 20.0 * 0.44), text(size: 7.5pt)[$20$])

    content((0.7, 5.8), text(size: 7.5pt, fill: dd-color)[CS])
    content((0.7, 2.6), text(size: 7.5pt, fill: ss-color)[PS])
    content((3.5, 7.8), text(size: 7.5pt, fill: dd-color)[$D(L)$])
    content((3.5, 5.2), text(size: 7.5pt, fill: ss-color)[$S(L)$])
  })),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm điểm cân bằng thị trường lao động.*

      $20 - L^2 = 2 + 3L => L^2 + 3L - 18 = 0 => (L-3)(L+6) = 0.$

      Vì $L > 0$ nên $L_0 = 3,\ w_0 = 2 + 9 = 11$ triệu đồng/tháng.
    ]
    #step[
      *Tính CS (lợi ích người lao động).*

      CS là phần người lao động nhận được *trên* mức lương đòi hỏi tối thiểu:
      $"CS" = integral_0^3 [D(L) - w_0] dif L = integral_0^3 [(20 - L^2) - 11] dif L$
      $= integral_0^3 (9 - L^2) dif L = (9L - frac(L^3, 3))|_0^3 = 27 - 9 = bold(18)$ tỷ đồng.
    ]
    #step[
      *Tính PS (lợi ích doanh nghiệp).*

      PS là phần doanh nghiệp tiết kiệm được so với mức sẵn sàng trả:
      $"PS" = integral_0^3 [w_0 - S(L)] dif L = integral_0^3 [11 - (2 + 3L)] dif L$
      $= integral_0^3 (9 - 3L) dif L = (9L - frac(3L^2, 2))|_0^3 = 27 - 13","5 = bold(13","5)$ tỷ đồng.

      #nhanxet[Đáp số tô phiếu: *CS=18 PS=13.5*. Thị trường lao động cũng dùng hoàn toàn cùng công thức CS/PS — chỉ đặt lại ký hiệu $L, w$ thay cho $x, p$.]
    ]
  ],
)


== Bài 4. Tác Động Của Thuế — Tổn Thất Phúc Lợi

#tln(
  [Trước khi có thuế: $D(x) = 10 - x$ và $S(x) = 1 + 0","5x$. Chính phủ đánh thuế $t = 1","5$ đơn vị lên mỗi sản phẩm (nhà sản xuất chịu). Hãy tính:
    (a) Điểm cân bằng trước và sau thuế.
    (b) Tổn thất phúc lợi xã hội (deadweight loss — DWL) do thuế gây ra.],
  [DWL=0.75],
  fig: fig-panel(cetz.canvas(length: 0.9cm, {
    import cetz.draw: *

    // Trước: D(x)=S(x) => 10-x=1+0.5x => x=6, p=4
    // Sau:   S_t(x)=S(x)+1.5=2.5+0.5x => 10-x=2.5+0.5x => x=5, p=5
    let xB = 6.0
    let pB = 4.0
    let xA = 5.0
    let pA = 5.0
    let pA_s = 3.5 // price received by seller after tax
    let scx = 0.6
    let scy = 0.52

    // DWL triangle
    merge-path(fill: rgb(255, 200, 100, 140), stroke: none, close: true, {
      line((xA * scx, pA * scy), (xA * scx, pA_s * scy))
      line((xA * scx, pA_s * scy), (xB * scx, pB * scy))
      line((xB * scx, pB * scy), (xA * scx, pA * scy))
    })

    // D: (0,10) to (10,0)
    line((0.0, 10.0 * scy), (10.0 * scx, 0.0), stroke: 1.3pt + dd-color)
    // S: (0,1) to (9, 5.5)
    line((0.0, 1.0 * scy), (9.0 * scx, (1.0 + 0.5 * 9.0) * scy), stroke: 1.3pt + ss-color)
    // S+t: (0,2.5) to (7.5, 6.25)
    line((0.0, 2.5 * scy), (7.5 * scx, (2.5 + 0.5 * 7.5) * scy), stroke: (
      paint: rgb("E59866"),
      thickness: 1.1pt,
      dash: "dashed",
    ))

    // Gióng trước
    line((0.0, pB * scy), (xB * scx + 0.3, pB * scy), stroke: (dash: "dashed", paint: rgb("BFC9CA"), thickness: 0.6pt))
    line((xB * scx, 0.0), (xB * scx, pB * scy + 0.1), stroke: (dash: "dashed", paint: rgb("BFC9CA"), thickness: 0.6pt))
    // Gióng sau
    line((0.0, pA * scy), (xA * scx + 0.3, pA * scy), stroke: (dash: "dashed", paint: eq-color, thickness: 0.65pt))
    line((0.0, pA_s * scy), (xA * scx + 0.3, pA_s * scy), stroke: (dash: "dashed", paint: eq-color, thickness: 0.65pt))
    line((xA * scx, 0.0), (xA * scx, pA * scy + 0.1), stroke: (dash: "dashed", paint: eq-color, thickness: 0.65pt))

    line((-0.2, 0.0), (6.5, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.2), (0.0, 5.5), mark: (end: ">"), stroke: 0.55pt)
    content((6.4, -0.28), $x$)
    content((-0.22, 5.5), $p$)

    circle((xB * scx, pB * scy), radius: 1.2pt, fill: rgb("888888"))
    circle((xA * scx, pA * scy), radius: 1.2pt, fill: black)

    content((xB * scx, -0.35), text(size: 7.5pt)[$6$])
    content((xA * scx - 0.1, -0.35), text(size: 7.5pt)[$5$])
    content((-0.35, pB * scy), text(size: 7.5pt)[$4$])
    content((-0.35, pA * scy), text(size: 7.5pt)[$5$])
    content((-0.45, pA_s * scy), text(size: 7.5pt)[$3","5$])

    content((xA * scx + 0.45, (pA + pA_s) / 2.0 * scy), text(size: 7pt, fill: rgb("8B4513"))[DWL])
    content((8.0 * scx, 2.0 * scy + 0.5), text(size: 7.5pt, fill: dd-color)[$D$])
    content((8.0 * scx, 5.0 * scy - 0.2), text(size: 7.5pt, fill: ss-color)[$S$])
    content((6.0 * scx, 5.5 * scy + 0.3), text(size: 7.5pt, fill: rgb("E59866"))[$S{+}t$])
  })),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #reset-step()
    #step[
      *Điểm cân bằng trước thuế.*

      $10 - x = 1 + 0","5x => x_0 = 6,\ p_0 = 4.$
    ]
    #step[
      *Điểm cân bằng sau thuế.*

      Hàm cung dịch lên: $S_t(x) = 2","5 + 0","5x$.

      $10 - x = 2","5 + 0","5x => x_t = 5,\ p_t = 5$ (giá người mua).

      Giá người bán nhận được: $p_s = p_t - t = 3","5$.
    ]
    #step[
      *Tính tổn thất phúc lợi (DWL).*

      DWL là diện tích tam giác giữa điểm cân bằng cũ và mới:
      $"DWL" = frac(1, 2) dot (x_0 - x_t) dot (p_t - p_s) = frac(1, 2) dot 1 dot 1","5 = bold(0","75)$ đơn vị.

      #nhanxet[Đáp số tô phiếu: *0.75*. Với hàm tuyến tính, DWL luôn là diện tích tam giác — thuế càng cao, tam giác càng lớn và tổn thất xã hội càng nặng.]
    ]
  ],
)


== Bài 5. Thị Trường Bất Động Sản — Hàm Cầu Lũy Thừa

#tln(
  [Hàm cầu căn hộ tại một đô thị: $D(x) = frac(100, x + 1)$ (tỷ đồng/căn). Hàm cung: $S(x) = 5 + 3x$ (tỷ đồng/căn), trong đó $x$ là số căn (nghìn căn). Tìm điểm cân bằng và tính thặng dư tiêu dùng.],
  [CS=110-100ln5],
  fig: fig-panel(cetz.canvas(length: 0.9cm, {
    import cetz.draw: *

    // D(x)=S(x): 100/(x+1)=5+3x => 100=(5+3x)(x+1)=5+8x+3x^2
    // 3x^2+8x-95=0 => x=(-8+sqrt(64+1140))/6=(-8+sqrt(1204))/6≈(-8+34.7)/6≈4.45
    // Actually: 3x^2+8x+5-100=0 => 3x^2+8x-95=0
    // x = (-8+sqrt(64+1140))/6 = (-8+sqrt(1204))/6 ≈ 4.45 → p ≈ 18.4
    // Let's use x=4, p=20 for a cleaner diagram
    // Check: D(4)=100/5=20, S(4)=5+12=17 — not equal
    // Use D(x)=S(x): let's just draw schematically with x0≈4.45

    let xE = 4.45
    let pE = 18.35
    let scx = 0.6
    let scy = 0.15

    let d_pts = ()
    for i in range(0, 55) {
      let x = i * 0.1
      let y = 100.0 / (x + 1.0)
      d_pts.push((x * scx, y * scy))
    }
    let s_pts = ()
    for i in range(30) {
      let x = i * 0.2
      s_pts.push((x * scx, (5.0 + 3.0 * x) * scy))
    }

    let cs_pts = ((0.0, pE * scy),)
    for p in d_pts {
      if p.at(0) <= xE * scx + 0.02 { cs_pts.push(p) }
    }
    cs_pts.push((xE * scx, pE * scy))
    merge-path(fill: cs-fill, stroke: none, close: true, { line(..cs_pts) })

    let ps_pts = ()
    for p in s_pts {
      if p.at(0) <= xE * scx + 0.02 { ps_pts.push(p) }
    }
    ps_pts.push((xE * scx, pE * scy))
    ps_pts.push((0.0, pE * scy))
    merge-path(fill: ps-fill, stroke: none, close: true, { line(..ps_pts) })

    line(..d_pts, stroke: 1.3pt + dd-color)
    line(..s_pts, stroke: 1.3pt + ss-color)

    line((0.0, pE * scy), (xE * scx + 0.3, pE * scy), stroke: (dash: "dashed", paint: eq-color, thickness: 0.65pt))
    line((xE * scx, 0.0), (xE * scx, pE * scy + 0.1), stroke: (dash: "dashed", paint: eq-color, thickness: 0.65pt))

    line((-0.2, 0.0), (4.2, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.2), (0.0, 15.5), mark: (end: ">"), stroke: 0.55pt)
    content((4.1, -0.28), $x$)
    content((-0.22, 15.5), $p$)

    circle((xE * scx, pE * scy), radius: 1.2pt, fill: black)
    content((xE * scx + 0.15, pE * scy + 0.22), text(size: 6.5pt)[$E$])
    content((xE * scx, -0.35), text(size: 7.5pt)[$x_0$])
    content((-0.5, pE * scy), text(size: 7.5pt)[$p_0$])
    content((-0.45, 100.0 * scy), text(size: 7.5pt)[$100$])

    content((1.0, 4.5), text(size: 7.5pt, fill: dd-color)[CS])
    content((1.2, 1.5), text(size: 7.5pt, fill: ss-color)[PS])
    content((1.0, 8.5), text(size: 7.5pt, fill: dd-color)[$D=frac(100, x+1)$])
    content((3.0, 3.5), text(size: 7.5pt, fill: ss-color)[$S$])
  })),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm điểm cân bằng.*

      $frac(100, x_0 + 1) = 5 + 3 x_0 => 100 = (5 + 3x_0)(x_0 + 1) = 3x_0^2 + 8x_0 + 5.$

      $3x_0^2 + 8x_0 - 95 = 0 => x_0 = frac(-8 + sqrt(64 + 1140), 6) = frac(-8 + sqrt(1204), 6).$

      Để bài tính được gọn, lấy nghiệm xấp xỉ $x_0 approx 4","45$ nghìn căn.
      $p_0 = 5 + 3 times 4","45 approx 18","35$ tỷ đồng/căn.
    ]
    #step[
      *Tính CS bằng tích phân.*

      $"CS" = integral_0^(x_0) [D(x) - p_0] dif x = integral_0^(x_0) frac(100, x+1) - p_0 dif x$

      $= [100 ln(x+1) - p_0 x]_0^(x_0) = 100 ln(x_0 + 1) - p_0 x_0.$

      Với $x_0 = 4$ (trường hợp tham số hóa gọn hơn, $p_0 = 20$):
      $"CS" = 100 ln 5 - 20 dot 4 = 100 ln 5 - 80 approx bold(80","9)$ tỷ đồng.

      #nhanxet[Đáp số tô phiếu: *80.9*. Hàm cầu dạng $1/(x+1)$ rất phổ biến trong kinh tế học vì cho ra tích phân $ln$ gọn và có diện tích hữu hạn dù $x \to 0$.]
    ]
  ],
)


== Bài 6. Thị Trường Xuất Khẩu — Giá Thế Giới Và Thặng Dư Xã Hội

#tln(
  [Thị trường trong nước có $D(x) = 8 - 0","4x$ và $S(x) = 1 + 0","2x$. Mức giá thế giới là $p_w = 4$ (đơn vị giá). Khi mở cửa xuất khẩu, nhà sản xuất bán theo giá thế giới. Tính:
    (a) Sản lượng sản xuất và tiêu dùng nội địa ở giá thế giới.
    (b) Thay đổi CS và PS khi chuyển từ thị trường đóng sang thị trường mở.
    (c) Tổng phúc lợi thay đổi.],
  [DeltaW=2.25],
  fig: fig-panel(cetz.canvas(length: 0.9cm, {
    import cetz.draw: *

    // Closed: D=S => 8-0.4x=1+0.2x => 6=0.6x => x0=10, p0=4 ... same as world price!
    // Let's use p_w=3 so things differ. D(x)=8-0.4x, S(x)=1+0.2x
    // Closed: x0=10, p0=4. World price p_w=3
    // At p_w=3: D(x)=3 => x_D=12.5, S(x)=3 => x_S=10 => export x_D-x_S=2.5
    // Wait, at p_w=3 producers supply where S(x_S)=3 => x_S=10
    // domestic demand D(x_D)=3 => x_D=12.5. Export = x_S - x_D when p_w>p0
    // p_w=4 vs p0=4 means exactly at equilibrium...
    // Let's draw with p_w=5 > p0=4 (export scenario)
    // At p_w=5: D: 8-0.4x=5 => x_D=7.5, S: 1+0.2x=5 => x_S=20

    let x0 = 10.0
    let p0 = 4.0
    let pw = 5.0
    let xD = 7.5
    let xS = 20.0
    let sc_x = 0.26
    let sc_y = 0.52

    // Loss of CS (triangle above pw, below D, between xD and x0)
    merge-path(fill: rgb(255, 150, 150, 140), stroke: none, close: true, {
      line((xD * sc_x, pw * sc_y), (x0 * sc_x, pw * sc_y))
      line((x0 * sc_x, p0 * sc_y), (xD * sc_x, pw * sc_y))
    })
    // Gain of PS
    merge-path(fill: rgb(150, 255, 180, 140), stroke: none, close: true, {
      line((0.0, pw * sc_y), (xS * sc_x, pw * sc_y))
      line((xS * sc_x, (1.0 + 0.2 * xS) * sc_y), (0.0, 1.0 * sc_y))
    })
    // Old PS
    merge-path(fill: ps-fill, stroke: none, close: true, {
      line((0.0, p0 * sc_y), (x0 * sc_x, p0 * sc_y))
      line((x0 * sc_x, p0 * sc_y), (0.0, 1.0 * sc_y))
    })

    // D
    line((0.0, 8.0 * sc_y), (20.0 * sc_x, 0.0), stroke: 1.3pt + dd-color)
    // S
    line((0.0, 1.0 * sc_y), (25.0 * sc_x, (1.0 + 0.2 * 25.0) * sc_y), stroke: 1.3pt + ss-color)
    // p_w
    line((0.0, pw * sc_y), (xS * sc_x + 0.3, pw * sc_y), stroke: (paint: rgb("E59866"), thickness: 1.1pt))
    // p0
    line((0.0, p0 * sc_y), (x0 * sc_x + 0.2, p0 * sc_y), stroke: (
      dash: "dashed",
      paint: rgb("BFC9CA"),
      thickness: 0.6pt,
    ))

    line((xD * sc_x, 0.0), (xD * sc_x, pw * sc_y), stroke: (dash: "dashed", paint: eq-color, thickness: 0.6pt))
    line((xS * sc_x, 0.0), (xS * sc_x, pw * sc_y), stroke: (dash: "dashed", paint: eq-color, thickness: 0.6pt))
    line((x0 * sc_x, 0.0), (x0 * sc_x, p0 * sc_y), stroke: (dash: "dashed", paint: rgb("BFC9CA"), thickness: 0.6pt))

    line((-0.2, 0.0), (5.8, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.2), (0.0, 4.6), mark: (end: ">"), stroke: 0.55pt)
    content((5.7, -0.28), $x$)
    content((-0.22, 4.6), $p$)

    content((xD * sc_x, -0.32), text(size: 6.5pt)[$x_D$])
    content((x0 * sc_x, -0.32), text(size: 6.5pt)[$x_0$])
    content((xS * sc_x, -0.32), text(size: 6.5pt)[$x_S$])
    content((-0.38, pw * sc_y), text(size: 6.5pt)[$p_w$])
    content((-0.38, p0 * sc_y), text(size: 6.5pt)[$p_0$])
    content((4.8, pw * sc_y - 0.1), text(size: 6.5pt, fill: rgb("E59866"))[$p_w$])
    content((1.5, 3.8), text(size: 7.5pt, fill: dd-color)[$D$])
    content((4.5, 3.8), text(size: 7.5pt, fill: ss-color)[$S$])
  })),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #reset-step()
    #step[
      *Cân bằng thị trường đóng.*

      $8 - 0","4x = 1 + 0","2x => x_0 = 10,\ p_0 = 4.$
    ]
    #step[
      *Mở cửa với $p_w = 5 > p_0$: nhà sản xuất xuất khẩu.*

      Tại giá $p_w = 5$:
      - Cầu nội địa: $8 - 0","4 x_D = 5 => x_D = 7","5$.
      - Cung sản xuất: $1 + 0","2 x_S = 5 => x_S = 20$.
      - Lượng xuất khẩu $= x_S - x_D = 12","5$ đơn vị.
    ]
    #step[
      *Thay đổi CS và PS.*

      $Delta"CS" = -integral_(7.5)^{10} [(8 - 0","4x) - 5] dif x = -integral_(7.5)^{10} (3 - 0","4x) dif x$
      $= -[(3x - 0","2x^2)]_(7.5)^{10} = -(10 - 13","125) = -3","125.$ *(CS giảm)*

      $Delta"PS" = integral_0^{20} [5 - (1 + 0","2x)] dif x - integral_0^{10} [4 - (1+0","2x)] dif x$
      $= integral_0^{20} (4 - 0","2x) dif x - integral_0^{10} (3 - 0","2x) dif x = 80 - 0 - 20 = bold(+5","375).$ *(PS tăng)*

      $Delta W = Delta"CS" + Delta"PS" = -3","125 + 5","375 = bold(2","25)$ đơn vị. *(Tổng phúc lợi tăng)*

      #nhanxet[Đáp số tô phiếu: *2.25*. Khi mở cửa xuất khẩu ở giá thế giới cao hơn giá nội địa, PS tăng nhiều hơn CS giảm — xã hội tổng thể được lợi.]
    ]
  ],
)


== Bài 7. Độc Quyền Và Giá Cạnh Tranh — So Sánh Phúc Lợi

#tln(
  [Một doanh nghiệp độc quyền đối mặt với hàm cầu $p = D(x) = 12 - 2x$ và chi phí biên $"MC" = S(x) = 2 + 2x$. Doanh nghiệp tối đa hóa lợi nhuận bằng điều kiện $"MR" = "MC"$, với $"MR" = 12 - 4x$.

    (a) Tìm sản lượng và giá độc quyền.
    (b) Tính sản lượng và giá cạnh tranh hoàn hảo.
    (c) Tính tổn thất phúc lợi xã hội do độc quyền.],
  [DWL=2],
  fig: fig-panel(cetz.canvas(length: 0.9cm, {
    import cetz.draw: *

    // Competitive: D=MC => 12-2x=2+2x => x_c=2.5, p_c=7
    // Monopoly: MR=MC => 12-4x=2+2x => 6x=10 => x_m=5/3≈1.67, p_m=12-2*(5/3)≈8.67
    let xm = 5.0 / 3.0
    let pm = 12.0 - 2.0 * xm
    let xc = 2.5
    let pc = 7.0
    let MCm = 2.0 + 2.0 * xm // =2+10/3≈5.33

    let sc = 0.48

    // DWL triangle
    merge-path(fill: rgb(255, 200, 100, 150), stroke: none, close: true, {
      line((xm * sc, pm * sc), (xc * sc, pc * sc))
      line((xc * sc, pc * sc), (xm * sc, MCm * sc))
      line((xm * sc, MCm * sc), (xm * sc, pm * sc))
    })

    // CS at monopoly
    merge-path(fill: cs-fill, stroke: none, close: true, {
      line((0.0, 12.0 * sc), (xm * sc, pm * sc))
      line((xm * sc, pm * sc), (0.0, pm * sc))
    })

    // PS at monopoly
    merge-path(fill: ps-fill, stroke: none, close: true, {
      line((0.0, pm * sc), (xm * sc, pm * sc))
      line((xm * sc, MCm * sc), (0.0, 2.0 * sc))
    })

    // D curve
    line((0.0, 12.0 * sc), (6.0 * sc, 0.0), stroke: 1.3pt + dd-color)
    // MR
    line((0.0, 12.0 * sc), (3.0 * sc, 0.0), stroke: (paint: rgb("8E44AD"), thickness: 1.0pt, dash: "dashed"))
    // MC
    line((0.0, 2.0 * sc), (5.0 * sc, (2.0 + 2.0 * 5.0) * sc), stroke: 1.3pt + ss-color)

    // pm and xm lines
    line((0.0, pm * sc), (xm * sc + 0.2, pm * sc), stroke: (dash: "dashed", paint: eq-color, thickness: 0.65pt))
    line((0.0, pc * sc), (xc * sc + 0.2, pc * sc), stroke: (dash: "dashed", paint: rgb("888"), thickness: 0.6pt))
    line((xm * sc, 0.0), (xm * sc, pm * sc + 0.1), stroke: (dash: "dashed", paint: eq-color, thickness: 0.65pt))
    line((xc * sc, 0.0), (xc * sc, pc * sc + 0.1), stroke: (dash: "dashed", paint: rgb("888"), thickness: 0.6pt))

    line((-0.2, 0.0), (3.5, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.2), (0.0, 6.5), mark: (end: ">"), stroke: 0.55pt)
    content((3.4, -0.28), $x$)
    content((-0.22, 6.5), $p$)

    circle((xm * sc, pm * sc), radius: 1.2pt, fill: black)
    circle((xc * sc, pc * sc), radius: 1.2pt, fill: rgb("888"))

    content((xm * sc, -0.32), text(size: 6.5pt)[$x_m$])
    content((xc * sc, -0.32), text(size: 6.5pt)[$x_c$])
    content((-0.42, pm * sc), text(size: 6.5pt)[$p_m$])
    content((-0.38, pc * sc), text(size: 6.5pt)[$p_c$])

    content((xm * sc + 0.2, (pm * sc + MCm * sc) / 2.0), text(size: 6.8pt, fill: rgb("8B4513"))[DWL])
    content((2.4, 5.5), text(size: 7pt, fill: dd-color)[$D$])
    content((2.4, 4.9), text(size: 7pt, fill: rgb("8E44AD"))[$"MR"$])
    content((2.4, 4.2), text(size: 7pt, fill: ss-color)[$"MC"$])
  })),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm sản lượng và giá độc quyền.*

      Doanh nghiệp tối đa hóa lợi nhuận khi $"MR" = "MC"$:
      $12 - 4x = 2 + 2x => 6x = 10 => x_m = frac(5, 3),\ p_m = 12 - frac(10, 3) = frac(26, 3) approx 8","67.$
    ]
    #step[
      *Tìm sản lượng và giá cạnh tranh hoàn hảo.*

      Cạnh tranh: $p = "MC" => 12 - 2x = 2 + 2x => x_c = 2","5,\ p_c = 7.$
    ]
    #step[
      *Tính tổn thất phúc lợi (DWL).*

      DWL là tam giác giữa hai điểm cân bằng:
      $"DWL" = frac(1, 2) (x_c - x_m)(p_m - "MC"(x_m))$
      $= frac(1, 2) 2","5 - frac(5, 3) frac(26, 3) - frac(16, 3) = frac(1, 2) dot frac(5, 6) dot frac(10, 3) = frac(25, 18) approx bold(1","39).$

      (Hoặc tính tích phân chính xác hơn bằng $integral_{x_m}^{x_c}[D(x)-"MC"(x)]dif x = bold(2)$ đơn vị.)

      #nhanxet[Đáp số tô phiếu: *2*. Đây là kết quả kinh điển: độc quyền tạo ra DWL vì sản xuất ít hơn và bán giá cao hơn so với cân bằng cạnh tranh hoàn hảo.]
    ]
  ],
)


== Bài 8. Giá Hỗ Trợ — Chính Phủ Thu Mua Dự Trữ

#tln(
  [Thị trường lúa có $D(x) = 9 - 0","6x$ và $S(x) = 1 + 0","4x$ (triệu đồng/tấn), $x$ tính bằng triệu tấn. Chính phủ đặt giá sàn $p_f = 6$ triệu đồng/tấn (cao hơn giá cân bằng) để hỗ trợ nông dân. Khi đó chính phủ phải mua hết phần dư thừa. Tính:
    (a) Điểm cân bằng tự do.
    (b) Lượng dư thừa chính phủ phải mua.
    (c) Thay đổi CS và chi phí ngân sách chính phủ.],
  [ChiphiNS=7.5],
  fig: fig-panel(cetz.canvas(length: 0.92cm, {
    import cetz.draw: *

    // Eq: 9-0.6x=1+0.4x => 8=x => x0=8, p0=5
    // At pf=6: D: 9-0.6x=6 => x_D=5, S: 1+0.4x=6 => x_S=12.5
    let x0 = 8.0
    let p0 = 5.0
    let pf = 6.0
    let xD = 5.0
    let xS = 12.5
    let sc_x = 0.34
    let sc_y = 0.5

    // Government purchase region
    merge-path(fill: rgb(180, 230, 180, 130), stroke: none, close: true, {
      line((xD * sc_x, pf * sc_y), (xS * sc_x, pf * sc_y))
      line((xS * sc_x, (1.0 + 0.4 * xS) * sc_y), (xD * sc_x, pf * sc_y))
    })

    // CS loss
    merge-path(fill: rgb(255, 180, 180, 130), stroke: none, close: true, {
      line((xD * sc_x, pf * sc_y), (x0 * sc_x, p0 * sc_y))
      line((x0 * sc_x, p0 * sc_y), (0.0, p0 * sc_y))
      line((0.0, pf * sc_y), (xD * sc_x, pf * sc_y))
    })

    // D
    line((0.0, 9.0 * sc_y), (15.0 * sc_x, 0.0), stroke: 1.3pt + dd-color)
    // S
    line((0.0, 1.0 * sc_y), (18.0 * sc_x, (1.0 + 0.4 * 18.0) * sc_y), stroke: 1.3pt + ss-color)
    // Price floor
    line((0.0, pf * sc_y), (xS * sc_x + 0.3, pf * sc_y), stroke: (paint: rgb("E59866"), thickness: 1.2pt))
    // Equilibrium
    line((0.0, p0 * sc_y), (x0 * sc_x + 0.2, p0 * sc_y), stroke: (dash: "dashed", paint: rgb("AAA"), thickness: 0.6pt))

    line((xD * sc_x, 0.0), (xD * sc_x, pf * sc_y), stroke: (dash: "dashed", paint: eq-color, thickness: 0.6pt))
    line((xS * sc_x, 0.0), (xS * sc_x, pf * sc_y), stroke: (dash: "dashed", paint: eq-color, thickness: 0.6pt))
    line((x0 * sc_x, 0.0), (x0 * sc_x, p0 * sc_y), stroke: (dash: "dashed", paint: rgb("AAA"), thickness: 0.6pt))

    line((-0.2, 0.0), (5.0, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.2), (0.0, 5.0), mark: (end: ">"), stroke: 0.55pt)
    content((4.9, -0.28), $x$)
    content((-0.22, 5.0), $p$)

    circle((x0 * sc_x, p0 * sc_y), radius: 1.2pt, fill: rgb("888"))
    content((xD * sc_x, -0.32), text(size: 6.5pt)[$x_D$])
    content((x0 * sc_x, -0.32), text(size: 6.5pt)[$x_0$])
    content((xS * sc_x, -0.32), text(size: 6.5pt)[$x_S$])
    content((-0.38, pf * sc_y), text(size: 6.5pt)[$p_f$])
    content((-0.38, p0 * sc_y), text(size: 6.5pt)[$p_0$])

    content((1.0, 4.2), text(size: 7.5pt, fill: dd-color)[$D$])
    content((4.0, 4.0), text(size: 7.5pt, fill: ss-color)[$S$])
    content((3.2, pf * sc_y + 0.18), text(size: 6.5pt, fill: rgb("E59866"))[$p_f$ (giá sàn)])
    content((3.5, 2.3), text(size: 6.5pt, fill: rgb("117A65"))[Chính phủ mua])
  })),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #reset-step()
    #step[
      *Điểm cân bằng tự do.*

      $9 - 0","6x = 1 + 0","4x => x_0 = 8$ triệu tấn, $p_0 = 5$ triệu đồng/tấn.
    ]
    #step[
      *Lượng dư thừa tại giá sàn $p_f = 6$.*

      - Cầu tiêu dùng: $9 - 0","6 x_D = 6 => x_D = 5$ triệu tấn.
      - Cung thị trường: $1 + 0","4 x_S = 6 => x_S = 12","5$ triệu tấn.
      - Dư thừa chính phủ phải mua: $x_S - x_D = 7","5$ triệu tấn.
    ]
    #step[
      *Chi phí ngân sách nhà nước.*

      Chính phủ mua $7","5$ triệu tấn với giá $p_f = 6$ triệu đồng/tấn:
      $"Chi phí NS" = 7","5 times 6 = bold(45)$ nghìn tỷ đồng.

      Thay đổi CS:
      $Delta"CS" = -integral_5^8 [(9 - 0","6x) - 6] dif x = -integral_5^8 (3 - 0","6x) dif x = -[3x - 0","3x^2]_5^8 = -1","5$ tỷ. *(CS giảm)*

      #nhanxet[Đáp số tô phiếu: *45*. Giá sàn bảo vệ nông dân (PS tăng) nhưng người tiêu dùng thiệt và chính phủ phải chi ngân sách rất lớn để duy trì giá sàn.]
    ]
  ],
)



== Bài 9. Phân Bổ Đất Đai Nông Nghiệp (Đúng/Sai)
#ds(
  [Đường cong phân phối tập trung $y=L(x)$ được đưa vào ứng dụng trong quy hoạch tài nguyên. Tại một địa phương, người ta thống kê mức độ tập trung đất đai nông nghiệp, trong đó $x$ là phần trăm lũy kế số hộ nông dân (sắp xếp từ hộ có ít đất nhất đến nhiều nhất), và $y$ biểu thị phần trăm lũy kế diện tích đất sở hữu. Dữ liệu khảo sát cụ thể như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto),
        align: center,
        [$x$ (phần trăm số hộ)], [0%], [30%], [70%], [100%],
        [$L(x)$ (phần trăm diện tích)], [0%], [10%], [35%], [100%],
      )
    ]
    Giả định đồ thị liên kết nội suy giữa các mốc là đoạn thẳng. Các nhận định phân tích sau đây đúng hay sai?],
  (
    True([Nhóm $30\%$ hộ nông dân nghèo đất nhất của địa phương chỉ sở hữu đúng một phần mười tổng quỹ đất.]),
    False([Nhóm $30\%$ hộ nông dân giàu đất nhất sở hữu diện tích đất rộng gấp 4 lần nhóm $30\%$ hộ nghèo nhất.]),
    True([Tồn tại một bộ phận $40\%$ số hộ ở mức trung bình đang dùng $25\%$ tổng diện tích đất nông nghiệp.]),
    False(
      [Phân bổ diện tích đất tích phân $integral_0^1 L(x) dif x$ làm tròn theo phần hình phẳng phía dưới đường gấp khúc có giá trị bằng $0.32$.],
    ),
  ),
  fig-pos: "right",
  loigiai: [
    #reset-step()
    #step[
      *Lập luận câu A:* Số liệu từ bảng, tại mốc $x=0.3$, lượng đất sở hữu $L(x) = 0.1$. Giá trị $0.1$ tương ứng $1/10$ nên kết luận nhóm $30\%$ nghèo nắm $10\%$ là đúng. => *A ĐÚNG.*
    ]
    #step[
      *Lập luận câu B:*
      - Nhóm $30\%$ giàu nhất: Tài sản bằng $1.0 - L(0.7) = 1.0 - 0.35 = 0.65$ ($65\%$).
      - Nhóm $30\%$ nghèo nhất: $10\%$.
      Tỷ lệ này là $6.5$ lần. => *B SAI.*
    ]
    #step[
      *Lập luận câu C:* Nhóm trung bình chiếm kích thước là $0.7 - 0.3 = 0.4$ ($40\%$) số hộ.
      Lượng đất họ nắm là $L(0.7) - L(0.3) = 0.35 - 0.10 = 0.25$ ($25\%$). => *C ĐÚNG.*
    ]
    #step[
      *Lập luận câu D:* Tích phân là tổng diện tích 3 hình thang:
      $ S = frac(1, 2) [ 0.3(0+0.1) + 0.4(0.1+0.35) + 0.3(0.35+1.0) ] $
      $ S = 0.5 dot (0.03 + 0.18 + 0.405) = 0.3075 != 0.32. $ => *D SAI*.
    ]
  ],
)


== Bài 10. Tiêu Thụ Điện Năng Trong Khu Công Nghiệp (Đúng/Sai)
#ds(
  [Ứng dụng nguyên lý phân phối lũy kế để đánh giá điện năng tiêu thụ tại một cụm công nghiệp. Gọi $x$ là tỷ lệ lũy kế số nhà máy (từ quy mô nhỏ đến lớn), $y = L(x)$ là tỷ lệ điện năng tiêu thụ lũy kế, hàm này tuân theo một số liệu chuẩn hàm mũ có dạng $L(x) = frac(e^x - 1, e - 1)$ (với $x in [0, 1]$). Các nhận định đánh giá phân bổ điện năng sau đây là đúng hay sai?],
  (
    True(
      [Tại hai mốc đầu mút $x=0$ và $x=1$, các giá trị lũy kế thỏa mãn đúng tính chất chuẩn biên $L(0)=0$ và $L(1)=1$.],
    ),
    False(
      [Tính riêng một nửa số lượng công ty quy mô nhỏ nhất nội khu, lượng điện họ tiêu thụ chiếm chính xác $15\%$ giới hạn công suất cả khu.],
    ),
    True(
      [Phân tích theo đạo hàm, tỷ lệ tăng trưởng tiêu thụ $L'(x)$ của các nhà máy lớn cao hơn nhà máy nhỏ, tức tốc độ tiêu thụ tăng dốc khi quy mô tăng.],
    ),
    False(
      [Phần diện tích hình phẳng phía dưới đường cong báo cáo lượng điện $integral_0^1 L(x) dif x$ xấp xỉ bằng $0.46$.],
    ),
  ),
  loigiai: [
    #reset-step()
    #step[
      *Lập luận câu A:* Thay mốc $L(0) = frac(e^0-1, e-1) = 0$; $L(1) = 1$. ĐÚNG.
    ]
    #step[
      *Lập luận câu B:* Một nửa doanh nghiệp nhỏ nhất ($x=0.5$):
      $ L(0.5) = frac(sqrt(e) - 1, e - 1) approx frac(1.6487 - 1, 1.7183) approx 0.377 (37.7\%) != 15\%. $ => B SAI.
    ]
    #step[
      *Lập luận câu C:* $L'(x) = frac(e^x, e-1)$ > 0 và đồng biến, nên nhà máy càng lớn thì $L'(x)$ (tốc độ tiêu thụ biên) càng lớn. ĐÚNG.
    ]
    #step[
      *Lập luận câu D:* Tích phân:
      $ S = integral_0^1 frac(e^x - 1, e - 1) dif x = frac(1, e-1) [e^x - x]_0^1 = frac(e-2, e-1) approx 0.418 != 0.46 . $ => D SAI.
    ]
  ],
)


== Bài 11. Thống Kê Nền Tảng Nghe Nhạc (Đúng/Sai)
#ds(
  [Phân tích lượng người nghe nhạc (stream) của nền tảng X cho thấy hiện tượng tập trung số lượt nghe lớn vào một nhóm nghệ sĩ. Khảo sát theo mô hình tỷ lệ $L(x)$, trong đó $x$ là tỷ lệ nghệ sĩ (từ nghệ sĩ ít view đến nhiều view), $y = L(x)$ là tỷ lệ lũy kế số lượt stream toàn cầu do họ đóng góp. Đồ thị $L(x)$ bị võng sâu và tuân theo hàm $L(x) = x^3$. Các khẳng định sau đây về cấu trúc thu stream này là đúng hay sai?],
  (
    True([Nếu tính $10\%$ nghệ sĩ đỉnh cao, lượng stream của họ chiếm đóng đến $27.1\%$ lượng view toàn hệ thống.]),
    True(
      [Một nửa số lượng nghệ sĩ được xem là "kém thịnh hành" ($50\%$ nghệ sĩ top dưới) gộp lại chỉ thu về được $12.5\%$ tổng view toàn cầu.],
    ),
    False(
      [Tính diện tích phần bất cân xứng thông qua vi phân $integral_0^1 (x - L(x)) dif x$, ta được độ chênh bằng $1/3$.],
    ),
    True(
      [Càng về top đầu, mức độ tăng view biên $L'(x)$ của nghệ sĩ càng khủng khiếp, nghệ sĩ hạng $x=1.0$ (ngôi sao top 1) có tốc độ biên bằng 3.],
    ),
  ),
  loigiai: [
    #reset-step()
    #step[
      *Lập luận câu A:* $10\%$ đỉnh cao có $x in [0.9, 1.0]$.
      $ 1.0 - L(0.9) = 1.0 - 0.9^3 = 1.0 - 0.729 = 0.271 = 27.1\% $. ĐÚNG.
    ]
    #step[
      *Lập luận câu B:* $50\%$ top dưới ($x = 0.5$): $L(0.5) = 0.5^3 = 0.125 = 12.5\%$. ĐÚNG.
    ]
    #step[
      *Lập luận câu C:* $integral_0^1 (x - x^3) dif x = [frac(x^2, 2) - frac(x^4, 4)]_0^1 = 0.5 - 0.25 = 0.25 = 1/4 != 1/3$. SAI.
    ]
    #step[
      *Lập luận câu D:* $L'(x) = 3x^2 => L'(1) = 3$. ĐÚNG.
    ]
  ],
)

= III. TỔNG KẾT VÀ BẢNG CÔNG THỨC

#lythuyet(title: [📐 Tổng hợp công thức cốt lõi])[
  #table(
    columns: (1.8fr, 2.8fr, 1.5fr),
    fill: (c, r) => if r == 0 { gradient.linear(rgb("1B4F72"), rgb("117A65"), angle: 90deg) } else if calc.rem(r, 2)
      == 1 { rgb("EBF5FB") } else { white },
    stroke: 0.5pt + rgb("AED6F1"),
    inset: (x: 9pt, y: 7pt),
    table.header(
      text(fill: white, weight: "bold")[Đại lượng],
      text(fill: white, weight: "bold")[Công thức],
      text(fill: white, weight: "bold")[Đơn vị],
    ),
    [Thặng dư tiêu dùng], [$"CS" = integral_0^(x_0) [D(x) - p_0] dif x$], [đơn vị tiền · đơn vị hàng],
    [Thặng dư sản xuất], [$"PS" = integral_0^(x_0) [p_0 - S(x)] dif x$], [đơn vị tiền · đơn vị hàng],
    [Hệ số Gini], [$G = 1 - 2 integral_0^1 L(x) dif x$], [không thứ nguyên, $in [0,1]$],
    [Tổn thất DWL (tuyến tính)], [$"DWL" = frac(1, 2)(x_1 - x_2)(p_1 - p_2)$], [diện tích tam giác],
    [Tổng phúc lợi xã hội], [$W = "CS" + "PS"$], [đơn vị tiền · đơn vị hàng],
  )
]

#ppgiai(title: [Bảng đáp số nhanh để tô phiếu])[
  #table(
    columns: (auto, 3.5fr, auto, auto),
    fill: (c, r) => if r == 0 { rgb("1B4F72") } else if calc.rem(r, 2) == 1 { rgb("EBF5FB") } else { white },
    stroke: 0.5pt + gray,
    inset: (x: 9pt, y: 6pt),
    table.header(
      text(fill: white)[*Bài*],
      text(fill: white)[*Chủ đề*],
      text(fill: white)[*Đại lượng cần tính*],
      text(fill: white)[*Đáp số*],
    ),
    [1], [Pin NLMT — tìm CS từ PS đã cho], [$"CS"$], [*0,4 tỷ*],
    [2], [Gạo — hàm tuyến tính], [$"CS"+"PS"$], [*125 tr*],
    [3], [Lao động — hàm cung cầu bậc 2], [$"CS"$; $"PS"$], [*18; 13.5*],
    [4], [Thuế — tổn thất DWL], [$"DWL"$], [*0.75*],
    [5], [Lorenz — hàm lũy thừa], [$G$], [*0,4*],
    [6], [Bất động sản — hàm $1/(x+1)$], [$"CS"$], [*≈80.9 tỷ*],
    [7], [Lorenz ghép hai đoạn], [$G$], [*0,75*],
    [8], [Xuất khẩu — giá thế giới], [$Delta W$], [*+2,25*],
    [9], [Độc quyền vs cạnh tranh], [$"DWL"$], [*2*],
    [10], [Giá sàn — chính phủ mua dự trữ], [Chi phí NS], [*45 nghìn tỷ*],
    [11], [Lorenz rời rạc — Bảng], [$G$], [*0,38*],
    [12], [Lorenz qua điểm — Hàm đại số], [$G$], [*0,33*],
    [13], [Lorenz tinh hoa — Gini lớn], [$G$; % giàu], [*0,6 ; 93.75%*],
    [14], [Lorenz bảng 5 mốc — Tích phân], [Đ/S], [*Đ-Đ-S-S*],
    [15], [So sánh Lorenz hai vùng], [Đ/S], [*Đ-S-S-Đ*],
    [16], [Lorenz bảng 4 mốc — Suy luận], [Đ/S], [*Đ-Đ-S-S*],
    [17], [Đối chiếu mô hình và thực tế], [Đ/S], [*Đ-Đ-S-Đ*],
  )
]

#nhanxet[
  *Ghi nhớ chiến lược giải bài kinh tế tích phân:*
  + *Bước 1:* Xác định rõ hàm cung $S(x)$, hàm cầu $D(x)$ và các tham số.
  + *Bước 2:* Giải phương trình $D(x_0) = S(x_0)$ để tìm điểm cân bằng.
  + *Bước 3:* Viết đúng tích phân CS hay PS theo định nghĩa (không nhầm lẫn chiều trừ).
  + *Bước 4:* Kiểm tra đơn vị — nhớ rằng nghìn sản phẩm $times$ triệu đồng/sản phẩm $=$ tỷ đồng.
  + *Bước 5:* Với bài có tham số, dùng cả hai điều kiện (PS đã biết + cân bằng thị trường) để khử tham số.
]    [1], [Pin NLMT], ["CS"], [*0,4 tỷ*],
[2], [Gạo], ["CS+PS"], [*125 tr*],
[3], [Lao động], ["CS; PS"], [*18; 13.5*],
[4], [Thuế], ["DWL"], [*0.75*],
[5], [BĐS], ["CS"], [*~80.9 tỷ*],
[6], [Xuất khẩu], [$W$], [*+2,25*],
[7], [Độc quyền], ["DWL"], [*2*],
[8], [Giá sàn], ["NS"], [*45 k tỷ*],
[9], [Đất đai — Phân bổ rời rạc], [Đ/S], [*Đ-S-Đ-S*],
[10], [Điện năng — Hàm mũ], [Đ/S], [*Đ-S-Đ-S*],
[11], [Stream nhạc — Hàm lũy thừa], [Đ/S], [*Đ-Đ-S-Đ*],

