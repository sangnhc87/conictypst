#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm),
)

#show: stexgv-doc.with(
  doc-type: "book",
  title: "CHUYÊN ĐỀ: ỨNG DỤNG TÍCH PHÂN TRONG BÀI TOÁN THỰC TẾ",
  author: "GV Nguyễn Văn Sang",
  theme-color: classic.blue,
)

#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// ═══════════════════════════════════════════════════════════
#v(1em)
#block(
  width: 100%,
  fill: rgb("#f4f8fc"),
  stroke: (
    left: 6pt + classic.blue,
    top: 0.5pt + rgb("#dbe4f0"),
    right: 0.5pt + rgb("#dbe4f0"),
    bottom: 0.5pt + rgb("#dbe4f0"),
  ),
  inset: 16pt,
  radius: (right: 4pt),
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: ỨNG DỤNG TÍCH PHÂN TRONG BÀI TOÁN THỰC TẾ]

  #v(0.8em)
  #text(
    style: "italic",
    size: 12pt,
    fill: rgb("#555555"),
  )[Kỹ thuật tọa độ hóa và công thức giải nhanh bài toán Parabol nội tiếp hình chữ nhật.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill: math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ═══════════════════════════════════════════════════════════
// THIẾT KẾ CHUYÊN ĐỀ MẪU: BÀI TOÁN THỰC TẾ & VẬN DỤNG CAO
// ═══════════════════════════════════════════════════════════
//

#tln(
  [Diện tích phần hình phẳng $(H)$ được tô màu vàng trong hình vẽ bên dưới bằng bao nhiêu (làm tròn kết quả đến hàng phần mười)?

    #align(center)[
      #cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        let w = 6
        let h = 12
        let h1 = 8
        let a = -(4 + 2 * calc.sqrt(3)) / 9
        let b = 4 + 4 * calc.sqrt(3) / 3

        rect((0, 0), (w, h), stroke: 0.5pt)
        line((0, 0), (w, h1), (w, 0), close: true, fill: rgb("b2d8d8"), stroke: 0.5pt)

        let pts = range(0, 61).map(i => {
          let x = i * 0.1
          (x, a * x * x + b * x)
        })

        let fill-pts = pts + ((w, h1), (0, 0))
        line(..fill-pts, fill: rgb("ffffcc"), stroke: none)
        line(..pts, stroke: 1pt)
        line((0, 0), (w, h1), stroke: 0.5pt)

        line((-0.4, 0), (-0.4, h), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((-1.0, h / 2), [$12$])
        line((0, -0.4), (w, -0.4), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((w / 2, -1.0), [$6$])
        line((w + 0.4, h1), (w + 0.4, h), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((w + 1.0, h1 + (h - h1) / 2), [$4$])
        content((9 - 3 * calc.sqrt(3), h + 0.6), [$B$])
        content((w / 2 - 0.2, h / 2 + 0.5), [$(H)$])
      })
    ]
  ],
  [$29,9$],
  loigiai: [
    #ppgiai[
      - Gắn hệ trục tọa độ $O x y$, lập phương trình parabol dạng $y = a x^2 + b x$ (do qua gốc $O$).
      - Sử dụng dữ kiện điểm đi qua $(6; 8)$ và tung độ đỉnh bằng $12$ để thiết lập hệ phương trình tìm $a, b$.
    ]

    #align(center)[
      #cetz.canvas(length: 0.45cm, {
        import cetz.draw: *
        let w = 6
        let h = 12
        let h1 = 8
        let a = -(4 + 2 * calc.sqrt(3)) / 9
        let b = 4 + 4 * calc.sqrt(3) / 3

        // Trục tọa độ
        line((-1, 0), (w + 1.5, 0), mark: (end: ">"))
        content((w + 1.5, -0.5), $x$)
        line((0, -1), (0, h + 1.5), mark: (end: ">"))
        content((-0.5, h + 1.5), $y$)
        content((-0.5, -0.5), $O$)

        let pts = range(0, 61).map(i => {
          let x = i * 0.1
          (x, a * x * x + b * x)
        })
        line(..pts, stroke: (paint: blue, thickness: 1pt))
        line((0, 0), (w, h1), stroke: (paint: red, thickness: 1pt))

        // Điểm A(6;8) và I(đỉnh)
        circle((w, h1), radius: 2pt, fill: red)
        content((w + 0.5, h1 - 0.5), $A(6;8)$)
        let xi = 9 - 3 * calc.sqrt(3)
        circle((xi, h), radius: 2pt, fill: blue)
        content((xi, h + 0.6), $I(x_I; 12)$)

        // Gióng nét đứt
        line((xi, 0), (xi, h), stroke: (dash: "dashed", paint: gray))
        line((w, 0), (w, h1), stroke: (dash: "dashed", paint: gray))
        line((0, h), (xi, h), stroke: (dash: "dashed", paint: gray))
      })
    ]

    Gọi parabol có phương trình $(P): y = a x^2 + b x$ ($a < 0$).
    Theo đồ thị, $(P)$ đi qua $A(6; 8)$ và có tung độ đỉnh $y_I = 12$. Ta có hệ phương trình:
    $
      cases(
        36a + 6b = 8,
        -(b^2) / (4a) = 12
      ) quad <=> quad cases(
        18a + 3b = 4,
        b^2 = -48a
      )
    $
    Thế $a = (4-3b)/18$ vào phương trình thứ hai, ta được $3b^2 - 24b + 32 = 0$.
    Kết hợp điều kiện hoành độ đỉnh $x_I = 24/b in (0; 6) => b > 4$, ta nhận nghiệm:
    $ b = 4 + (4sqrt(3))/3 quad => quad a = -(4 + 2sqrt(3))/9. $

    Phương trình đường thẳng $O A$ là $y = 4/3 x$. Diện tích hình phẳng $(H)$ là:
    $
      S & = limits(integral)_0^6 (a x^2 + b x - 4/3 x) dif x \
        & = lr([ (a x^3)/3 + (b x^2)/2 - (2 x^2)/3 ] |)_0^6 \
        & = 72a + 18b - 24 \
        & = 72 ( -(4 + 2sqrt(3))/9 ) + 18 ( 4 + (4sqrt(3))/3 ) - 24 \
        & = 16 + 8sqrt(3) approx 29,9.
    $

    #meo(title: [Công thức tính nhanh])[
      Với hình chữ nhật kích thước $w times h$, parabol đi qua góc dưới, đỉnh chạm mép trên và cắt mép bên tại độ cao $h_1$, diện tích phần hình phẳng kẹp giữa parabol và dây cung là:
      $ S = w/6 (2h + 2sqrt(h(h - h_1)) - h_1) $
      Thay $w=6, h=12, h_1=8$ ta được $S = 6/6 (24 + 2sqrt(12 dot 4) - 8) = 16 + 8sqrt(3) approx 29,9$.
    ]
  ],
)
// ═══════════════════════════════════════════════════════════
// CHUYÊN ĐỀ: PHÁT TRIỂN BÀI TOÁN TÍNH DIỆN TÍCH PARABOL GÓC
// ═══════════════════════════════════════════════════════════

#tln(
  [Diện tích phần hình phẳng $(H)$ được tô màu vàng trong hình vẽ bên dưới bằng bao nhiêu
    (làm tròn kết quả đến hàng phần mười)?

    #align(center)[
      #cetz.canvas(length: 0.45cm, {
        import cetz.draw: *

        // ===== THAM SỐ =====
        let w = 8
        let h = 15
        let h1 = 10

        // ===== PARABOL =====
        let b = 2 * (h + calc.sqrt(h * (h - h1))) / w
        let a = -b * b / (4 * h)

        // ===== KHUNG =====
        rect((0, 0), (w, h), stroke: 0.5pt)
        line((0, 0), (w, h1), (w, 0), close: true, fill: rgb("b2d8d8"), stroke: 0.5pt)

        // ===== ĐỒ THỊ =====
        let pts = range(0, 101).map(i => {
          let x = i * w / 100
          (x, a * x * x + b * x)
        })

        let fill-pts = pts + ((w, h1), (0, 0))
        line(..fill-pts, fill: rgb("ffffcc"), stroke: none)
        line(..pts, stroke: 1pt)
        line((0, 0), (w, h1), stroke: 0.5pt)

        // ===== KÍCH THƯỚC =====
        line((-0.4, 0), (-0.4, h), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((-1.0, h / 2), [$15$])

        line((0, -0.4), (w, -0.4), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((w / 2, -1.0), [$8$])

        line((w + 0.4, h1), (w + 0.4, h), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((w + 1.0, h1 + (h - h1) / 2), [$5$])

        content((w / 2 - 0.3, h / 2 + 1), [$(H)$])
      })
    ]
  ],
  [$49,8$],
  loigiai: [
    #ppgiai[
      - Gắn hệ trục tọa độ $O x y$, gọi parabol $(P): y=a x^2+b x$.
      - $(P)$ đi qua $O(0;0)$, có đỉnh nằm trên cạnh trên hình chữ nhật.
      - $(P)$ cắt cạnh phải tại $A(w;h_1)$.
    ]

    Với $w=8$, $h=15$, $h_1=10$, diện tích phần hình phẳng kẹp giữa parabol
    và đoạn thẳng nối hai đầu mút được tính nhanh theo công thức:

    $ S = w/6 (2h + 2sqrt(h(h-h_1)) - h_1). $

    Thay số:
    $
      S & = 8/6 (2 dot 15 + 2sqrt(15 dot 5) - 10) \
        & = 4/3 (20 + 10sqrt(3)) \
        & approx 49,8.
    $

    Vậy diện tích phần hình phẳng $(H)$ xấp xỉ $49,8$.
  ],
)
#tln(
  [Một tấm bảng hình chữ nhật có chiều rộng $6$ và chiều cao $14$.
    Phần tô màu vàng $(H)$ được giới hạn bởi một parabol và một đoạn thẳng như hình vẽ.
    Biết chi phí sơn là $12\,000$ đồng cho mỗi đơn vị diện tích.
    Hỏi số tiền cần dùng để sơn phần $(H)$ (làm tròn đến nghìn đồng)?

    #align(center)[
      #cetz.canvas(length: 0.45cm, {
        import cetz.draw: *
        let w = 6
        let h = 14
        let h1 = 5
        let b = 2 * (h + calc.sqrt(h * (h - h1))) / w
        let a = -b * b / (4 * h)

        rect((0, 0), (w, h), stroke: 0.5pt)
        line((0, 0), (w, h1), (w, 0), close: true, fill: rgb("b2d8d8"), stroke: 0.5pt)

        let pts = range(0, 61).map(i => {
          let x = i * w / 60
          (x, a * x * x + b * x)
        })

        line(..pts, stroke: 1pt)
        line(..(pts + ((w, h1), (0, 0))), fill: rgb("ffffcc"), stroke: none)
      })
    ]
  ],
  [545],
  loigiai: [
    #ppgiai[
      - Gắn hệ trục tọa độ $O x y$.
      - Tính diện tích phần hình phẳng $(H)$.
      - Nhân với chi phí sơn trên một đơn vị diện tích.
    ]

    Diện tích:
    $
      S = 6/6 (28 + 2sqrt(14 dot 9) - 5)
      = 23 + 6sqrt(14) approx 45,4.
    $

    Số tiền cần dùng:
    $45,4 dot 12 000 approx 545.000$ text{ (đồng)}.
  ],
)

// Câu 1: Mức độ Thông hiểu - Tính diện tích ra số nguyên đẹp
#tn(
  [Một nghệ nhân làm mộc cắt một tấm gỗ hình chữ nhật có kích thước chiều rộng $6$ dm và chiều dài $9$ dm để tạo thành một tấm ván trang trí. Đường cắt là một cung parabol đi qua góc dưới cùng bên trái, có đỉnh chạm vào mép trên của tấm gỗ và cắt mép phải tại điểm có độ cao $5$ dm. Phần hình phẳng $(H)$ bị kẹp giữa cung parabol và đoạn thẳng nối từ góc dưới trái đến điểm cắt mép phải được giữ lại để điêu khắc. Diện tích phần tấm ván $(H)$ bằng bao nhiêu?],
  ([$20" dm"^2$], True([$25" dm"^2$]), [$30" dm"^2$], [$28" dm"^2$]),
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    let w = 6
    let h = 9
    let h1 = 5
    let a = -25 / 36
    let b = 5

    rect((0, 0), (w, h), stroke: 0.5pt)
    line((0, 0), (w, h1), (w, 0), close: true, fill: rgb("e6f2ff"), stroke: 0.5pt)

    let pts = range(0, 61).map(i => {
      let x = i * 0.1
      (x, a * x * x + b * x)
    })

    let fill-pts = pts + ((w, h1), (0, 0))
    line(..fill-pts, fill: rgb("ffffcc"), stroke: none)
    line(..pts, stroke: 1pt)
    line((0, 0), (w, h1), stroke: 0.5pt)

    line((-0.4, 0), (-0.4, h), mark: (start: "<", end: ">"), stroke: 0.5pt)
    content((-1.0, h / 2), [$9$])
    line((0, -0.4), (w, -0.4), mark: (start: "<", end: ">"), stroke: 0.5pt)
    content((w / 2, -1.0), [$6$])
    line((w + 0.4, h1), (w + 0.4, h), mark: (start: "<", end: ">"), stroke: 0.5pt)
    content((w + 1.0, h1 + (h - h1) / 2), [$4$])
    content((w / 2 - 0.2, h / 2), [$(H)$])
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Gắn hệ trục tọa độ $O x y$, lập phương trình parabol dạng $y = a x^2 + b x$.
      - Dựa vào tung độ đỉnh $y_I = 9$ và điểm đi qua $(6; 5)$ để tìm hệ số $a, b$.
      - Tính diện tích bằng tích phân xác định $S = limits(integral)_0^6 (y_"parabol" - y_"đường thẳng") dif x$.
    ]

    #align(center)[
      #cetz.canvas(length: 0.45cm, {
        import cetz.draw: *
        let w = 6
        let h = 9
        let h1 = 5
        let a = -25 / 36
        let b = 5

        line((-1, 0), (w + 1.5, 0), mark: (end: ">"))
        content((w + 1.5, -0.5), $x$)
        line((0, -1), (0, h + 1.5), mark: (end: ">"))
        content((-0.5, h + 1.5), $y$)
        content((-0.5, -0.5), $O$)

        let pts = range(0, 61).map(i => {
          let x = i * 0.1
          (x, a * x * x + b * x)
        })
        line(..pts, stroke: (paint: blue, thickness: 1pt))
        line((0, 0), (w, h1), stroke: (paint: red, thickness: 1pt))

        circle((w, h1), radius: 2pt, fill: red)
        content((w + 0.8, h1 - 0.5), $A(6;5)$)
        let xi = 3.6
        circle((xi, h), radius: 2pt, fill: blue)
        content((xi, h + 0.6), $I(x_I; 9)$)

        line((xi, 0), (xi, h), stroke: (dash: "dashed", paint: gray))
        line((w, 0), (w, h1), stroke: (dash: "dashed", paint: gray))
        line((0, h), (xi, h), stroke: (dash: "dashed", paint: gray))
      })
    ]

    Gọi parabol có phương trình $(P): y = a x^2 + b x$ ($a < 0$).
    Theo đồ thị, $(P)$ đi qua $A(6; 5)$ và có tung độ đỉnh $y_I = 9$. Ta có hệ phương trình:
    $
      cases(
        36a + 6b = 5,
        -(b^2) / (4a) = 9
      ) quad <=> quad cases(
        36a = 5 - 6b,
        b^2 = -36a
      )
    $
    Thế $36a = 5 - 6b$ vào phương trình thứ hai, ta được $b^2 = -(5 - 6b) <=> b^2 - 6b + 5 = 0$.
    Phương trình có hai nghiệm $b = 1$ và $b = 5$.
    Lại có hoành độ đỉnh $x_I = -b/(2a) = 18/b$. Vì đỉnh parabol nằm trong khoảng hoành độ của hình chữ nhật nên $x_I in (0; 6) => 18/b < 6 => b > 3$.
    Do đó, ta chọn $b = 5 => a = -25/36$.

    Phương trình đường thẳng $O A$ là $y = 5/6 x$. Diện tích hình phẳng $(H)$ là:
    $
      S & = limits(integral)_0^6 ( -25/36 x^2 + 5x - 5/6 x ) dif x = limits(integral)_0^6 ( -25/36 x^2 + 25/6 x ) dif x \
        & = lr([ -(25 x^3)/108 + (25 x^2)/12 ] |)_0^6 = -50 + 75 = 25 " (dm"^2")."
    $
    Vậy chọn đáp án *B*.


  ],
)

// Câu 2: Mức độ Vận dụng - Đánh giá tính chất Đúng/Sai
#ds(
  [Một kỹ sư cảnh quan thiết kế một bồn hoa $(H)$ bên trong một khu đất hình chữ nhật kích thước $10" m" times 6" m"$. Bồn hoa được giới hạn bởi một đoạn thẳng và một đường cong parabol. Trục đối xứng của parabol song song với trục tung; parabol đi qua góc dưới bên trái của khu đất, đỉnh chạm vào mép trên và cắt mép phải tại độ cao $2" m"$. Gốc tọa độ $O$ được đặt tại góc dưới bên trái khu đất.],
  (
    True([Phương trình đường thẳng giới hạn bồn hoa là $y = 1/5 x$.]),
    [Hoành độ đỉnh của parabol là $x_I = 5$.],
    True([Diện tích bồn hoa là $(50 + 20sqrt(6))/3" m"^2$.]),
    True([Tỉ số diện tích phần bồn hoa $(H)$ so với diện tích toàn bộ khu đất hình chữ nhật lớn hơn $50%$.]),
  ),
  fig: cetz.canvas(length: 0.4cm, {
    import cetz.draw: *
    let w = 10
    let h = 6
    let h1 = 2
    let b = (6 + 2 * calc.sqrt(6)) / 5
    let a = -b * b / 24

    rect((0, 0), (w, h), stroke: 0.5pt)

    let pts = range(0, 101).map(i => {
      let x = i * 0.1
      (x, a * x * x + b * x)
    })

    let fill-pts = pts + ((w, h1), (0, 0))
    line(..fill-pts, fill: rgb("ffcccc"), stroke: none)
    line(..pts, stroke: (paint: rgb("cc0000"), thickness: 1pt))
    line((0, 0), (w, h1), stroke: 0.5pt)

    content((w / 2, h / 2), [$(H)$], fill: rgb("990000"))
    content((w, h1), $A$, anchor: "west")
    content((-0.5, -0.5), $O$)
    line((0, -0.5), (w, -0.5), mark: (start: "<", end: ">"), stroke: 0.5pt)
    content((w / 2, -1.2), [$10" m"$])
    line((-0.5, 0), (-0.5, h), mark: (start: "<", end: ">"), stroke: 0.5pt)
    content((-1.5, h / 2), [$6" m"$])
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Đường thẳng đi qua $O(0;0)$ và $A(w; h_1)$ có phương trình $y = h_1/w x$.
      - Hoành độ đỉnh parabol bị "lệch" (không nằm ở chính giữa hình chữ nhật) vì đường cong không kết thúc ở cùng độ cao với lúc bắt đầu.
      - Đánh giá tỉ số diện tích cần tính tổng diện tích hình chữ nhật là $w times h$.
    ]

    #align(center)[
      #cetz.canvas(length: 0.4cm, {
        import cetz.draw: *
        let w = 10
        let h = 6
        let h1 = 2
        let b = (6 + 2 * calc.sqrt(6)) / 5
        let a = -b * b / 24

        line((-1, 0), (w + 1.5, 0), mark: (end: ">"))
        content((w + 1.5, -0.5), $x$)
        line((0, -1), (0, h + 1.5), mark: (end: ">"))
        content((-0.5, h + 1.5), $y$)

        let pts = range(0, 101).map(i => {
          let x = i * 0.1
          (x, a * x * x + b * x)
        })
        line(..pts, stroke: (paint: blue, thickness: 1pt))
        line((0, 0), (w, h1), stroke: (paint: red, thickness: 1pt))

        let xi = 12 / b
        circle((xi, h), radius: 2pt, fill: blue)
        content((xi, h + 0.8), $I$)
        line((xi, 0), (xi, h), stroke: (dash: "dashed", paint: gray))
        content((xi, -0.8), $x_I$)
      })
    ]

    - *Ý a) Đúng.* Đường thẳng giới hạn bồn hoa nối $O(0;0)$ và $A(10; 2)$. Hệ số góc $k = 2/10 = 1/5$. Phương trình là $y = 1/5 x$.
    - *Ý b) Sai.* Gọi parabol là $y = a x^2 + b x$. Tung độ đỉnh $y_I = 6 => b^2 = -24a$.
      Parabol qua $A(10; 2) => 100a + 10b = 2 => 100(-b^2/24) + 10b = 2 <=> 25b^2 - 60b + 12 = 0$.
      Giải phương trình ta được $b = (6 plus.minus 2sqrt(6))/5$.
      Hoành độ đỉnh $x_I = -b/(2a) = 12/b$. Điều kiện $x_I in (0; 10) => b > 1.2$.
      Ta lấy $b = (6 + 2sqrt(6))/5 approx 2.18$.
      Khi đó $x_I = 60 / (6 + 2sqrt(6)) = 30 - 10sqrt(6) approx 5.505 != 5$.
    - *Ý c) Đúng.* Áp dụng tích phân hoặc công thức nhanh:
      $
        S = 10/6 ( 2(6) + 2sqrt(6(6 - 2)) - 2 ) = 5/3 (12 + 2sqrt(24) - 2) = 5/3 (10 + 4sqrt(6)) = (50 + 20sqrt(6))/3 " (m"^2")."
      $
    - *Ý d) Đúng.* Diện tích toàn bộ hình chữ nhật là $S_0 = 10 times 6 = 60 " m"^2$.
      Tỉ số diện tích là:
      $
        S/S_0 = ((50 + 20sqrt(6))/3) / 60 = (50 + 20sqrt(6))/180 = (5 + 2sqrt(6))/18 approx (5 + 4.899)/18 approx 54.99%.
      $
      Vì $54.99% > 50%$ nên phát biểu đúng.

    #luuy(title: [Ảo giác hình học])[
      Bằng mắt thường, đỉnh parabol trông có vẻ như nằm ở chính giữa hình chữ nhật ($x=5$). Tuy nhiên, toán học chứng minh nó bị lệch sang phải ($x approx 5.5$) do nhánh bên phải của parabol bị "cắt" ở vị trí cao hơn nhánh bên trái!
    ]
  ],
)

// Câu 3: Mức độ Vận dụng cao - Trả lời ngắn thực tế
#tln(
  [Một công ty kiến trúc thiết kế một ô cửa sổ kính hoa văn. Khung cửa có dạng hình chữ nhật kích thước $12" m" times 8" m"$. Bên trong ô cửa, một mảng kính màu $(H)$ được giới hạn bởi một đường parabol và một đường thẳng. Parabol xuất phát từ góc dưới bên trái khung cửa, đỉnh tiếp xúc với mép trên và giao với mép phải tại độ cao $5" m"$. Tính diện tích của mảng kính màu $(H)$ theo đơn vị $m^2$ (làm tròn kết quả đến hàng phần mười).],
  [$41,6$],
  loigiai: [
    #ppgiai[
      - Dạng bài hoàn toàn tương tự, ta có thể áp dụng trực tiếp kết quả tổng quát đã chứng minh:
        $ S = w/6 (2h + 2sqrt(h(h - h_1)) - h_1) $
      - Xác định đúng các thông số $w, h, h_1$ từ đề bài.
      - Chú ý kỹ năng bấm máy tính và làm tròn số ở bước cuối cùng để không sai số tích lũy.
    ]

    #align(center)[
      #cetz.canvas(length: 0.45cm, {
        import cetz.draw: *
        let w = 12
        let h = 8
        let h1 = 5
        let b = (4 + calc.sqrt(6)) / 3
        let a = -b * b / 32

        rect((0, 0), (w, h), stroke: 0.5pt)
        let pts = range(0, 121).map(i => {
          let x = i * 0.1
          (x, a * x * x + b * x)
        })
        let fill-pts = pts + ((w, h1), (0, 0))

        line(..fill-pts, fill: rgb("99ccff"), stroke: none)
        line(..pts, stroke: (paint: blue, thickness: 1pt))
        line((0, 0), (w, h1), stroke: (paint: blue, thickness: 0.5pt))

        content((w / 2, h / 2 - 0.5), [Kính màu $(H)$], fill: blue)

        line((-0.5, 0), (-0.5, h), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((-1.5, h / 2), [$8" m"$])
        line((0, -0.5), (w, -0.5), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((w / 2, -1.5), [$12" m"$])
        line((w + 0.5, 0), (w + 0.5, h1), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((w + 1.5, h1 / 2), [$5" m"$])
      })
    ]

    Gọi kích thước khung cửa lần lượt là $w = 12$ và $h = 8$.
    Độ cao của giao điểm tại mép phải là $h_1 = 5$.

    *Cách 1: Thiết lập hệ tọa độ và tính tích phân*
    Phương trình parabol $y = a x^2 + b x$. Tung độ đỉnh $y_I = 8 => b^2 = -32a$.
    Điểm giao mép phải $(12; 5) => 144a + 12b = 5 => 144(-b^2/32) + 12b = 5 <=> 9b^2 - 24b + 10 = 0$.
    Giải ra $b = (4 + sqrt(6))/3$ (do điều kiện hoành độ đỉnh).
    Tích phân diện tích:
    $ S = limits(integral)_0^12 (a x^2 + b x - 5/12 x) dif x = 288a + 72b - 30. $
    Thay $a, b$ vào ta tính được kết quả.

    *Cách 2: Áp dụng công thức tổng quát*
    Diện tích mảng kính màu $(H)$ là:
    $
      S & = w/6 (2h + 2sqrt(h(h - h_1)) - h_1) \
        & = 12/6 (2(8) + 2sqrt(8(8 - 5)) - 5) \
        & = 2 (16 + 2sqrt(24) - 5) \
        & = 2 (11 + 4sqrt(6)) = 22 + 8sqrt(6).
    $

    Sử dụng máy tính cầm tay, ta có:
    $ S = 22 + 8sqrt(6) approx 22 + 8(2,449489) = 41,59591... $
    Làm tròn kết quả đến hàng phần mười, ta thu được *$41,6$*.

    #meo(title: [Sức mạnh của đại số hóa])[
      Chỉ với một lần giải bài toán tổng quát, ta đã rút ra được "chìa khóa" cho toàn bộ họ bài tập dạng này. Đây chính là tư duy toán học chân chính: đi từ cái cụ thể để bao quát cái trừu tượng, rồi lấy cái trừu tượng để thống trị mọi cái cụ thể khác!
    ]
  ],
)

