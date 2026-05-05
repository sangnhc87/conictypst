#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.0"

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm)
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

// ==========================================
// THIẾT KẾ GIAO DIỆN TIÊU ĐỀ
// ==========================================
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em, 
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body)
)

#show heading.where(level: 2): it => block(
  above: 1.5em, 
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body)
)

// ==========================================
// HÀM VẼ ĐA GIÁC CƠ BẢN (DÙNG CHUNG)
// ==========================================
#let draw-poly(n, r: 1.2) = {
  import cetz.draw: *
  circle((0,0), radius: r, stroke: luma(200) + 0.5pt)
  for i in range(n) {
    circle((90deg - i * 360deg / n, r), radius: 1.2pt, fill: gray)
  }
}
// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 
// ==========================================
// NỘI DUNG TÀI LIỆU
// ==========================================

#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        TỔNG HỢP CÔNG THỨC ĐẾM HÌNH TẠO TỪ ĐA GIÁC ĐỀU
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        Xét đa giác đều (H) gồm có $n$ đỉnh nội tiếp đường tròn ($n >= 3$).
      ]
    ]
  )
]

= BẢNG TÓM TẮT CÔNG THỨC

#align(center)[
  #table(
    columns: (auto, auto, 1fr),
    align: (center + horizon, center + horizon, left + horizon),
    stroke: (x, y) => (
      bottom: if y == 0 { 1.5pt + rgb("1A5276") } else { 0.5pt + luma(220) },
      top: if y == 0 { 1.5pt + rgb("1A5276") } else { none }
    ),
    fill: (x, y) => if y == 0 { rgb("EBF5FB") } else if calc.even(y) { rgb("FAFDFF") } else { white },
    inset: (x: 12pt, y: 10pt),
    
    text(weight: "bold", fill: rgb("1A5276"))[Loại hình cần đếm],
    text(weight: "bold", fill: rgb("1A5276"))[Điều kiện của $n$],
    text(weight: "bold", fill: rgb("1A5276"))[Công thức tính số lượng],
    
    [Hình vuông], [$n$ chia hết cho $4$], [$n / 4$],
    [Hình chữ nhật], [$n$ chẵn], [$C_{n/2}^2$],
    [Tam giác vuông], [$n$ chẵn], [$n/2 dot (n - 2)$],
    [Tam giác đều], [$n$ chia hết cho $3$], [$n / 3$],
    [Tam giác tù], [$n$ bất kỳ], [$n dot C_(floor((n-1)/2))^2$],
    [Tam giác nhọn], [$n$ bất kỳ], [$C_n^3 - n("TG vuông") - n("TG tù")$],
    [Tam giác có góc $>= 120 degree$], [$n$ bất kỳ], [$n dot C_(floor(n/3))^2$],
    [Hình thang (và HT Cân)], [$n$ lẻ], [$n dot C_((n-1)/2)^2$],
    [Hình thang (và HT Cân)], [$n$ chẵn], [$n/2 dot C_((n-2)/2)^2 + (n/2 - 1) dot C_{n/2}^2$]
  )
]

= CHỨNG MINH CHI TIẾT KÈM HÌNH ẢNH

#let mục(tên, nội_dung) = block(below: 0.8em)[
  #text(weight: "bold", fill: rgb("333333"))[- #tên:] #nội_dung
]

== 1. Hình vuông và Tam giác đều
#grid(
  columns: (1fr, auto), gutter: 2em,
  [
    #mục("Hình vuông")[Đa giác chia đường tròn thành $n$ cung bằng nhau. Để tạo thành hình vuông, $4$ đỉnh phải cách đều nhau, tức là $n$ phải chia hết cho $4$. Cứ lấy $1$ đỉnh, nhảy cách $n/4$ bước ta được $1$ hình vuông. Tổng số: #strong[$n/4$] hình.]
    
    #mục("Tam giác đều")[Tương tự, $3$ đỉnh phải cách đều nhau, $n$ phải chia hết cho $3$. Nhảy cách $n/3$ bước. Tổng số: #strong[$n/3$] hình.]
    #text(style: "italic", size: 10pt)[(Hình minh họa xét $n=12$)]
  ],
  cetz.canvas({
    import cetz.draw: *
    group({
      draw-poly(12)
      line((90deg, 1.2), (0deg, 1.2), (-90deg, 1.2), (180deg, 1.2), close: true, stroke: red + 1pt)
      content((0, -1.6), text(size: 9pt)[Hình vuông])
    })
    group({
      translate(x: 3.5)
      draw-poly(12)
      line((90deg, 1.2), (-30deg, 1.2), (210deg, 1.2), close: true, stroke: blue + 1pt)
      content((0, -1.6), text(size: 9pt)[Tam giác đều])
    })
  })
)

== 2. Hình chữ nhật và Tam giác vuông
#grid(
  columns: (1fr, auto), gutter: 2em,
  [
    #mục("Hình chữ nhật")[Được tạo thành từ $2$ đường kính của đường tròn. Điều kiện là $n$ chẵn (để có đường kính đi qua đỉnh). Đa giác có $n/2$ đường kính. Chọn $2$ đường kính bất kỳ ta được $1$ HCN. Số lượng: #strong[$C_{n/2}^2$].]
    
    #mục("Tam giác vuông")[Có $1$ cạnh là đường kính. Chọn $1$ đường kính làm cạnh huyền ($n/2$ cách), chọn đỉnh góc vuông từ $n-2$ đỉnh còn lại. Số lượng: #strong[$n/2 dot (n - 2)$].]
  ],
  cetz.canvas({
    import cetz.draw: *
    group({
      draw-poly(12)
      line((90deg, 1.2), (-90deg, 1.2), stroke: (dash: "dashed", paint: gray))
      line((30deg, 1.2), (210deg, 1.2), stroke: (dash: "dashed", paint: gray))
      line((90deg, 1.2), (30deg, 1.2), (-90deg, 1.2), (210deg, 1.2), close: true, stroke: green.darken(20%) + 1pt)
      content((0, -1.6), text(size: 9pt)[Hình chữ nhật])
    })
    group({
      translate(x: 3.5)
      draw-poly(12)
      line((90deg, 1.2), (-90deg, 1.2), stroke: (dash: "dashed", paint: gray))
      line((90deg, 1.2), (150deg, 1.2), (-90deg, 1.2), close: true, stroke: orange + 1pt)
      content((0, -1.6), text(size: 9pt)[Tam giác vuông])
    })
  })
)

== 3. Tam giác tù và Tam giác có góc lớn
#grid(
  columns: (1fr, auto), gutter: 2em,
  [
    #mục("Tam giác tù")[Ba đỉnh phải nằm trọn trên $1$ nửa đường tròn. Cố định đỉnh $A$, chọn $2$ đỉnh cùng một phía trong số $k = floor((n-1)/2)$ đỉnh. Đổi vai trò cho $n$ đỉnh, ta có tổng: #strong[$n dot C_k^2$].]
    
    #mục("Tam giác có góc >= 120 degree")[Góc $A >= 120 degree <=> $ cung đối diện chứa $2$ đỉnh $B,C$ có số đo $<= 120 degree$. Số đỉnh tối đa trong cung này là $m = floor(n/3)$. Chọn $2$ đỉnh từ $m$ đỉnh này. Tổng: #strong[$n dot C_m^2$].]
  ],
  cetz.canvas({
    import cetz.draw: *
    group({
      draw-poly(12)
      line((75deg, 1.4), (-105deg, 1.4), stroke: (dash: "dashed", paint: luma(150)))
      line((60deg, 1.2), (30deg, 1.2), (-60deg, 1.2), close: true, stroke: purple + 1pt, fill: rgb("80008030"))
      content((0, -1.6), text(size: 9pt)[Tam giác tù])
    })
    group({
      translate(x: 3.5)
      draw-poly(12)
      arc((0,1.17), start: 90deg, stop: -30deg, radius: 1.2, stroke: red + 1.5pt)
      line((90deg, 1.2), (30deg, 1.2), (-30deg, 1.2), close: true, stroke: red + 1pt, fill: rgb("FF000030"))
      content((0, -1.6), text(size: 9pt)[Góc $>= 120 degree$])
    })
  })
)

== 4. Hình thang và Hình thang cân

#rect(fill: rgb("FFF7E6"), stroke: (left: 4pt + rgb("FF8C00")), inset: 10pt, width: 100%, radius: 4pt)[
  #text(weight: "bold", fill: rgb("D2691E"))[LƯU Ý:] Mọi hình thang nội tiếp đường tròn bắt buộc phải là hình thang cân. Ta đếm dựa trên số *trục đối xứng* của đa giác.
]

#v(0.5em)
#grid(
  columns: (1fr, 1fr), gutter: 2em,
  [
    #mục("Trường hợp n lẻ")[Đa giác có $n$ trục đối xứng đi qua $1$ đỉnh và trung điểm cạnh đối diện. Mỗi trục tạo ra $(n-1)/2$ cặp đỉnh đối xứng. Chọn $2$ cặp ta được $1$ hình thang. 
    $=>$ Số lượng: #strong[$n dot C_((n-1)/2)^2$].]
    
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        draw-poly(11, r: 1.5)
        // Trục đối xứng
        line((90deg, 1.7), (-90deg, 1.7), stroke: (dash: "dashed", paint: red))
        // Các đường song song
        let step = 360deg / 11
        line((90deg - step, 1.5), (90deg + step, 1.5), stroke: blue + 0.8pt)
        line((90deg - 3*step, 1.5), (90deg + 3*step, 1.5), stroke: blue + 0.8pt)
        // Hình thang
        line((90deg - step, 1.5), (90deg - 3*step, 1.5), stroke: blue + 0.8pt)
        line((90deg + step, 1.5), (90deg + 3*step, 1.5), stroke: blue + 0.8pt)
        content((0, -1.9), text(style: "italic", size: 9pt)[$n=11$ (Trục qua 1 đỉnh)])
      })
    ]
  ],
  [
    #mục("Trường hợp n chẵn")[Đa giác có $n/2$ trục qua $2$ đỉnh đối diện (chứa $(n-2)/2$ cặp) và $n/2$ trục qua trung điểm cạnh (chứa $n/2$ cặp). Bù trừ đi số Hình chữ nhật (vì bị đếm lặp 2 lần).
    $=>$ Số lượng: #strong[$n/2 dot C_((n-2)/2)^2 + (n/2 - 1) dot C_{n/2}^2$].]
    
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        draw-poly(12, r: 1.5)
        // Trục qua đỉnh
        line((90deg, 1.7), (-90deg, 1.7), stroke: (dash: "dashed", paint: red))
        // Trục qua cạnh
        line((15deg, 1.7), (195deg, 1.7), stroke: (dash: "dashed", paint: green.darken(20%)))
        // Cặp song song
        line((60deg, 1.5), (120deg, 1.5), stroke: blue + 0.8pt)
        line((30deg, 1.5), (150deg, 1.5), stroke: blue + 0.8pt)
        line((60deg, 1.5), (30deg, 1.5), stroke: blue + 0.8pt)
        line((120deg, 1.5), (150deg, 1.5), stroke: blue + 0.8pt)
        content((0, -1.9), text(style: "italic", size: 9pt)[$n=12$ (Có 2 loại trục)])
      })
    ]
  ]
)

#tln(
  [Cho đa giác đều $(H)$ có $18$ đỉnh nội tiếp trong một đường tròn. Chọn ngẫu nhiên $3$ đỉnh của $(H)$ để tạo thành một tam giác. Gọi $P$ là xác suất để tam giác được tạo thành là tam giác nhọn. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$206$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    circle((0,0), radius: 1.5pt, fill: black)
    
    let n = 18
    let step = 360deg / n
    for i in range(n) {
      circle((90deg - i * step, 2), radius: 1pt, fill: gray)
    }
    
    // Vẽ tam giác nhọn minh họa (chọn đỉnh cách nhau khoảng đều)
    let p1 = (90deg, 2)
    let p2 = (90deg - 6 * step, 2)
    let p3 = (90deg - 13 * step, 2)
    
    line(p1, p2, p3, close: true, stroke: green + 1pt, fill: rgb("00800020"))
    content(p1, $A_1$, anchor: "south", padding: 4pt)
    content(p2, $A_7$, anchor: "north-west", padding: 4pt)
    content(p3, $A_{14}$, anchor: "north-east", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Tính không gian mẫu: Chọn $3$ đỉnh bất kỳ.
      - Đếm số tam giác vuông ($n$ chẵn).
      - Đếm số tam giác tù (Chọn $1$ đỉnh lớn nhất, $2$ đỉnh còn lại cùng một phía).
      - Số tam giác nhọn = Tổng số tam giác - Số TG vuông - Số TG tù.
    ]
    
    Số phần tử của không gian mẫu (số tam giác tạo thành) là:
    $ n(Omega) = C_18^3 = 816 " (tam giác)" $
    
    Ta đi đếm các trường hợp không phải tam giác nhọn:
    *1. Số tam giác vuông:*
    Vì $n = 18$ chẵn, đa giác có $18/2 = 9$ đường kính. Chọn $1$ đường kính làm cạnh huyền ($9$ cách), chọn $1$ đỉnh góc vuông từ $16$ đỉnh còn lại. Số tam giác vuông là:
    $ n("TG vuông") = 9 dot 16 = 144 " (tam giác)" $
    
    *2. Số tam giác tù:*
    Cố định đỉnh có góc lớn nhất, $2$ đỉnh còn lại phải nằm cùng một phía trên nửa đường tròn. Số đỉnh tối đa ở một phía là $(18 - 2) / 2 = 8$ đỉnh. Chọn $2$ đỉnh từ $8$ đỉnh này và thay đổi vai trò cho $18$ đỉnh, ta có:
    $ n("TG tù") = 18 dot C_8^2 = 18 dot 28 = 504 " (tam giác)" $
    
    Vậy số tam giác nhọn được tạo thành là:
    $ n("TG nhọn") = n(Omega) - n("TG vuông") - n("TG tù") = 816 - 144 - 504 = 168 " (tam giác)" $
    
    Xác suất thu được tam giác nhọn là:
    $ P = 168 / 816 = 7 / 34 $
    
    Giá trị cần tính:
    $ 1000 P = 1000 dot 7 / 34 = 3500 / 17 approx 205.88 $
    Làm tròn đến hàng đơn vị ta được kết quả *$206$*.
  ]
)

#tln(
  [Cho đa giác đều $(H)$ có $20$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $4$ đỉnh của $(H)$ để tạo thành một tứ giác. Gọi $P$ là xác suất để tứ giác đó là hình chữ nhật nhưng không phải là hình vuông. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$8$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    let n = 20
    let step = 360deg / n
    for i in range(n) {
      circle((90deg - i * step, 2), radius: 1pt, fill: gray)
    }
    
    // Hình chữ nhật không vuông
    let p1 = (90deg - 1 * step, 2)
    let p2 = (90deg - 5 * step, 2)
    let p3 = (90deg - 11 * step, 2)
    let p4 = (90deg - 15 * step, 2)
    
    line(p1, p3, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(p2, p4, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(p1, p2, p3, p4, close: true, stroke: blue + 1pt, fill: rgb("0000FF20"))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Tính không gian mẫu: Số cách chọn $4$ đỉnh bất kỳ tạo thành tứ giác.
      - Đếm tổng số hình chữ nhật được tạo thành (chọn $2$ đường kính).
      - Đếm số hình vuông được tạo thành.
      - Lấy số hình chữ nhật trừ đi số hình vuông.
    ]
    
    Không gian mẫu là số tứ giác được tạo thành từ $20$ đỉnh:
    $ n(Omega) = C_20^4 = 4845 " (tứ giác)" $
    
    Một hình chữ nhật được tạo bởi $2$ đường kính của đa giác. Đa giác $20$ đỉnh có $20/2 = 10$ đường kính. Tổng số hình chữ nhật là:
    $ n("HCN") = C_10^2 = 45 " (hình)" $
    
    Trong số các hình chữ nhật trên, sẽ có những hình là hình vuông. Hình vuông tạo bởi $4$ đỉnh cách đều nhau. Vì $20$ chia hết cho $4$, số hình vuông là:
    $ n("Hình vuông") = 20 / 4 = 5 " (hình)" $
    
    Do đó, số tứ giác là hình chữ nhật nhưng không phải hình vuông là:
    $ n("HCN không vuông") = 45 - 5 = 40 " (hình)" $
    
    Xác suất để chọn được tứ giác thỏa mãn là:
    $ P = 40 / 4845 = 8 / 969 $
    
    Giá trị cần tính:
    $ 1000 P = 1000 dot 8 / 969 = 8000 / 969 approx 8.25 $
    Làm tròn đến hàng đơn vị ta được kết quả *$8$*.
  ]
)

#tln(
  [Cho đa giác đều $(H)$ có $15$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $4$ đỉnh của $(H)$ để tạo thành một tứ giác. Gọi $P$ là xác suất để tứ giác được tạo thành là một hình thang. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$231$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    let n = 15
    let step = 360deg / n
    for i in range(n) {
      circle((90deg - i * step, 2), radius: 1pt, fill: gray)
    }
    
    // Trục đối xứng
    let p-top = (90deg, 2)
    let p-bot = (-90deg, 2)
    // Dòng fix lỗi nằm ở đây: tách riêng paint và thickness
    line(p-top, p-bot, stroke: (dash: "dashed", paint: red, thickness: 1pt))
    
    // Hình thang
    let p1 = (90deg - 2 * step, 2)
    let p2 = (90deg - 4 * step, 2)
    let p3 = (90deg + 4 * step, 2)
    let p4 = (90deg + 2 * step, 2)
    
    line(p1, p4, stroke: purple + 1pt)
    line(p2, p3, stroke: purple + 1pt)
    line(p1, p2, p3, p4, close: true, stroke: purple + 1pt, fill: rgb("80008020"))
    content(p-top, $A_1$, anchor: "south", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Tính không gian mẫu: Số tứ giác tạo thành từ $15$ đỉnh.
      - Nhận xét: Mọi tứ giác nội tiếp nếu là hình thang thì bắt buộc phải là hình thang cân.
      - Đa giác có $n=15$ (số lẻ), trục đối xứng của đa giác đi qua $1$ đỉnh và trung điểm cạnh đối diện. Đếm số hình thang bằng cách chọn $2$ cặp đỉnh đối xứng qua trục.
    ]
    
    Không gian mẫu là số tứ giác được tạo thành:
    $ n(Omega) = C_15^4 = 1365 " (tứ giác)" $
    
    Xét đa giác $15$ đỉnh. Vì $15$ là số lẻ, đa giác có $15$ trục đối xứng. Mỗi trục đối xứng đi qua $1$ đỉnh và trung điểm của cạnh đối diện. 
    Trục này chia $14$ đỉnh còn lại thành $2$ nửa bằng nhau, tạo thành $14 / 2 = 7$ cặp đỉnh đối xứng.
    
    Một hình thang (cân) được tạo thành khi và chỉ khi ta chọn $2$ cặp đỉnh đối xứng qua cùng một trục. Số cách chọn $2$ cặp từ $7$ cặp đỉnh này là:
    $ C_7^2 = 21 " (hình thang)" $
    
    Đa giác có $15$ trục đối xứng, và với $n$ lẻ, không có hình thang nào bị đếm trùng lặp. Tổng số hình thang là:
    $ n("Hình thang") = 15 dot 21 = 315 " (hình thang)" $
    
    Xác suất để chọn được một hình thang là:
    $ P = 315 / 1365 = 3 / 13 $
    
    Giá trị cần tính:
    $ 1000 P = 1000 dot 3 / 13 approx 230.76 $
    Làm tròn đến hàng đơn vị, ta thu được kết quả *$231$*.
  ]
)




#tln(
  [Cho đa giác đều $(H)$ có $24$ đỉnh nội tiếp trong một đường tròn. Chọn ngẫu nhiên $3$ đỉnh của $(H)$ để tạo thành một tam giác. Gọi $P$ là xác suất để tam giác được tạo thành là tam giác tù. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$652$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Đường tròn và tâm
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    circle((0,0), radius: 1.5pt, fill: black)
    content((0,0), $O$, anchor: "north-west", padding: 3pt)
    
    let n = 24
    let step = 360deg / n
    
    // Vẽ mờ toàn bộ 24 đỉnh để thấy rõ hình dáng đa giác
    for i in range(n) {
      circle((90deg - i * step, 2), radius: 1pt, fill: gray)
    }
    
    // Các đỉnh đặc biệt (A_1 ở đỉnh 90 độ, A_13 ở đối diện -90 độ)
    let p1 = (90deg, 2)
    let p13 = (-90deg, 2)
    
    // Đỉnh minh họa tam giác tù (chọn A_3 và A_8 nằm cùng bên phải)
    let p3 = (90deg - 2 * step, 2)
    let p8 = (90deg - 7 * step, 2)
    
    // Vẽ đường kính A_1 - A_13 chia đôi đường tròn
    line(p1, p13, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    content(p1, $A_1$, anchor: "south", padding: 4pt)
    content(p13, $A_{13}$, anchor: "north", padding: 4pt)
    circle(p1, radius: 1.5pt, fill: red)
    circle(p13, radius: 1.5pt, fill: gray)
    
    // Vẽ tam giác tù A_1 A_3 A_8
    circle(p3, radius: 1.5pt, fill: blue)
    circle(p8, radius: 1.5pt, fill: blue)
    content(p3, $A_3$, anchor: "south-west", padding: 3pt)
    content(p8, $A_8$, anchor: "north-west", padding: 3pt)
    line(p1, p3, p8, close: true, stroke: red + 1pt, fill: rgb("FF000020"))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - *Bước 1:* Tính không gian mẫu: Số cách chọn $3$ đỉnh từ $n$ đỉnh.
      - *Bước 2:* Tam giác tù là tam giác có $3$ đỉnh nằm trọn trên một nửa đường tròn (không chứa đường kính).
      - *Bước 3:* Vì $n$ chẵn, đường thẳng đi qua $O$ và một đỉnh $A$ sẽ đi qua đỉnh đối diện. Đường thẳng này chia $n-2$ đỉnh còn lại làm $2$ nửa bằng nhau.
      - *Bước 4:* Cố định đỉnh $A$, chọn $2$ đỉnh còn lại trong số các đỉnh ở một nửa (theo một chiều quy ước để không bị lặp).
    ]
    
    Số phần tử của không gian mẫu (chọn $3$ đỉnh bất kỳ từ $24$ đỉnh) là:
    $ n(Omega) = C_24^3 = 2024 " (tam giác)" $
    
    Một tam giác là tam giác tù khi và chỉ khi 3 đỉnh của nó nằm trên cùng một nửa đường tròn. 
    Xét đường kính đi qua đỉnh $A_i$ bất kỳ. Vì $n = 24$ là số chẵn, đường kính này sẽ đi qua đỉnh đối diện của $A_i$. Đường tròn bị chia làm 2 nửa, mỗi nửa chứa đúng:
    $ (24 - 2) / 2 = 11 " (đỉnh)" $
    
    Để đếm số tam giác tù mà không bị trùng lặp, ta chọn $A_i$ làm đỉnh có góc lớn nhất của tam giác tù. Khi đó $2$ đỉnh còn lại phải được chọn cùng phía, liền kề $A_i$ (giả sử chọn theo chiều kim đồng hồ).
    Số cách chọn 2 đỉnh từ 11 đỉnh này là:
    $ C_11^2 = 55 " (cách)" $
    
    Đa giác có $24$ đỉnh, mỗi đỉnh có thể đóng vai trò làm đỉnh $A_i$ (đỉnh mốc). Do đó, tổng số tam giác tù là:
    $ n("Tam giác tù") = 24 dot 55 = 1320 " (tam giác)" $
    
    Xác suất để chọn được tam giác tù là:
    $ P = 1320 / 2024 = 15 / 23 $
    
    Tính giá trị theo yêu cầu:
    $ 1000 P = 1000 dot 15 / 23 approx 652.17 $
    Làm tròn kết quả đến hàng đơn vị, ta được *$652$*.
  ]
)

#tln(
  [Cho đa giác đều $(H)$ có $25$ đỉnh nội tiếp trong một đường tròn. Chọn ngẫu nhiên $3$ đỉnh của $(H)$ để tạo thành một tam giác. Gọi $P$ là xác suất để tam giác được tạo thành là tam giác tù. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$717$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Đường tròn và tâm
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    circle((0,0), radius: 1.5pt, fill: black)
    content((0,0), $O$, anchor: "north-west", padding: 3pt)
    
    let n = 25
    let step = 360deg / n
    
    // Vẽ mờ toàn bộ 25 đỉnh
    for i in range(n) {
      circle((90deg - i * step, 2), radius: 1pt, fill: gray)
    }
    
    let p1 = (90deg, 2)
    // Cạnh đối diện nằm giữa đỉnh 13 và 14
    let mid-opposite = (-90deg, 2) 
    
    // Đỉnh minh họa tam giác tù (chọn A_4 và A_10)
    let p4 = (90deg - 3 * step, 2)
    let p10 = (90deg - 9 * step, 2)
    
    // Trục đối xứng đi qua A_1 và trung điểm cạnh đối diện
    line(p1, mid-opposite, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    content(p1, $A_1$, anchor: "south", padding: 4pt)
    circle(p1, radius: 1.5pt, fill: red)
    
    // Đánh dấu cạnh đối diện để thấy rõ tính chất n lẻ
    let p13 = (90deg - 12 * step, 2)
    let p14 = (90deg - 13 * step, 2)
    line(p13, p14, stroke: black + 1.2pt)
    circle(p13, radius: 1pt, fill: gray)
    circle(p14, radius: 1pt, fill: gray)
    
    // Vẽ tam giác tù A_1 A_4 A_10
    circle(p4, radius: 1.5pt, fill: blue)
    circle(p10, radius: 1.5pt, fill: blue)
    content(p4, $A_4$, anchor: "south-west", padding: 3pt)
    content(p10, $A_{10}$, anchor: "north-west", padding: 3pt)
    line(p1, p4, p10, close: true, stroke: red + 1pt, fill: rgb("FF000020"))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Trái với đa giác chẵn đỉnh, với đa giác $n$ đỉnh lẻ, đường thẳng đi qua một đỉnh và tâm $O$ sẽ *không đi qua đỉnh nào khác*, mà sẽ đi qua trung điểm của cạnh đối diện.
      - Nó chia $n-1$ đỉnh còn lại thành $2$ nửa bằng nhau, mỗi nửa chứa $(n-1)/2$ đỉnh.
      - Vẫn dùng tư duy cố định $1$ đỉnh mốc và chọn $2$ đỉnh còn lại ở một phía.
    ]
    
    Số phần tử của không gian mẫu (chọn $3$ đỉnh bất kỳ từ $25$ đỉnh) là:
    $ n(Omega) = C_25^3 = 2300 " (tam giác)" $
    
    Tam giác tạo thành là tam giác tù khi $3$ đỉnh của nó nằm trên cùng một nửa đường tròn.
    Xét trục đối xứng đi qua đỉnh $A_i$ và tâm $O$. Vì $n = 25$ là số lẻ, trục này sẽ không đi qua đỉnh nào khác mà chia đôi cạnh đối diện. Trục này chia đường tròn làm 2 nửa, mỗi nửa chứa số đỉnh là:
    $ (25 - 1) / 2 = 12 " (đỉnh)" $
    
    Cố định $A_i$ làm đỉnh mốc (đỉnh có góc lớn nhất). Để tam giác là tam giác tù, $2$ đỉnh còn lại phải được chọn từ nhóm $12$ đỉnh cùng một phía so với trục đối xứng (giả sử chọn phía bên phải theo chiều kim đồng hồ để không bị đếm trùng).
    Số cách chọn $2$ đỉnh từ $12$ đỉnh này là:
    $ C_12^2 = 66 " (cách)" $
    
    Cho $A_i$ chạy khắp $25$ đỉnh của đa giác, ta thu được tổng số tam giác tù là:
    $ n("Tam giác tù") = 25 dot 66 = 1650 " (tam giác)" $
    
    Xác suất để chọn được tam giác tù là:
    $ P = 1650 / 2300 = 33 / 46 $
    
    Tính giá trị theo yêu cầu:
    $ 1000 P = 1000 dot 33 / 46 approx 717.39 $
    Làm tròn kết quả đến hàng đơn vị, ta được *$717$*.
    
    #nhanxet[
      Qua hai bài toán ta thấy: Công thức tính số tam giác tù của đa giác $n$ đỉnh phụ thuộc vào tính chẵn lẻ của $n$. Nếu $n$ chẵn, số tam giác tù là $n dot C_{(n-2)/2}^2$. Nếu $n$ lẻ, số tam giác tù là $n dot C_{(n-1)/2}^2$.
    ]
  ]
)


#tln(
  [Cho đa giác đều $(H)$ có $20$ đỉnh nội tiếp trong một đường tròn. Chọn ngẫu nhiên $3$ đỉnh của $(H)$ để tạo thành một tam giác. Biết rằng tam giác được chọn *không phải là tam giác vuông*, gọi $P$ là xác suất để tam giác đó là tam giác tù. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$750$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    
    let n = 20
    let step = 360deg / n
    for i in range(n) {
      circle((90deg - i * step, 2), radius: 1pt, fill: gray)
    }
    
    // Minh họa TG vuông (nét đứt, nền xám) - Trường hợp bị loại
    let v1 = (90deg, 2)
    let v2 = (-90deg, 2)
    let v3 = (90deg - 4 * step, 2)
    line(v1, v2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(v1, v3, v2, close: true, stroke: (dash: "dashed", paint: gray, thickness: 1pt), fill: rgb("80808020"))
    
    // Minh họa TG tù (nét liền, nền xanh) - Trường hợp cần tính
    let t1 = (90deg - 1 * step, 2)
    let t2 = (90deg - 3 * step, 2)
    let t3 = (90deg - 8 * step, 2)
    line(t1, t2, t3, close: true, stroke: blue + 1pt, fill: rgb("0000FF20"))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Đây là bài toán *Xác suất có điều kiện*: $P(B | A) = (n(A ∩ B)) / n(A)$.
      - Biến cố điều kiện $A$: "Tam giác không phải là tam giác vuông". Ta lấy Tổng số tam giác trừ đi số tam giác vuông. Đây chính là *không gian mẫu thu hẹp*.
      - Biến cố $B$: "Tam giác tù". Vì mọi tam giác tù đều không phải tam giác vuông nên $A ∩ B$ chính là tập các tam giác tù.
    ]
    
    Tổng số tam giác tạo thành từ $20$ đỉnh là: $C_20^3 = 1140$.
    
    Đa giác có $20/2 = 10$ đường kính. Số tam giác vuông tạo thành là:
    $ n("TG vuông") = 10 dot 18 = 180 " (tam giác)" $
    
    Vì tam giác được chọn *không phải tam giác vuông*, nên số phần tử của không gian mẫu thu hẹp là:
    $ n(A) = 1140 - 180 = 960 " (tam giác)" $
    
    Số tam giác tù được tạo thành (cố định $1$ đỉnh, chọn $2$ đỉnh từ $(20-2)/2 = 9$ đỉnh cùng phía) là:
    $ n("TG tù") = 20 dot C_9^2 = 20 dot 36 = 720 " (tam giác)" $
    
    Xác suất có điều kiện cần tìm là:
    $ P = (n("TG tù")) / n(A) = 720 / 960 = 3 / 4 = 0.75 $
    
    Giá trị cần tính:
    $ 1000 P = 1000 dot 0.75 = 750 $
    Kết quả là *$750$*.
  ]
)

#tln(
  [Cho đa giác đều $(H)$ có $24$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $3$ đỉnh của $(H)$ để tạo thành một tam giác. Biết rằng tam giác được chọn *chắc chắn chứa đỉnh $A_1$*, gọi $P$ là xác suất để tam giác đó là một tam giác vuông. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$130$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    let n = 24
    let step = 360deg / n
    for i in range(n) { circle((90deg - i * step, 2), radius: 1pt, fill: gray) }
    
    let a1 = (90deg, 2)
    let a13 = (-90deg, 2)
    content(a1, $A_1$, anchor: "south", padding: 4pt)
    circle(a1, radius: 2pt, fill: red)
    
    // TH1: A1 là góc nhọn (cạnh huyền đi qua A1)
    let p-th1 = (90deg - 5 * step, 2)
    line(a1, a13, stroke: red + 1pt)
    line(a1, p-th1, a13, close: true, stroke: blue + 1pt, fill: rgb("0000FF20"))
    
    // TH2: A1 là góc vuông (cạnh huyền KHÔNG đi qua A1)
    let p1-th2 = (90deg - 7 * step, 2)
    let p2-th2 = (90deg + 5 * step, 2) // Đối diện p1-th2
    line(p1-th2, p2-th2, stroke: (dash: "dashed", paint: orange, thickness: 1pt))
    line(a1, p1-th2, p2-th2, close: true, stroke: orange + 1pt, fill: rgb("FFA50020"))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Không gian mẫu thu hẹp: Số tam giác được tạo ra từ việc chọn $A_1$ và $2$ đỉnh bất kỳ trong $23$ đỉnh còn lại.
      - Đếm số tam giác vuông chứa $A_1$. Phải chia $2$ trường hợp:
        + TH1: $A_1$ là một góc nhọn $=>$ Cạnh huyền phải đi qua $A_1$ (chính là đường kính $A_1 A_{13}$).
        + TH2: $A_1$ là góc vuông $=>$ Cạnh huyền là một đường kính không đi qua $A_1$.
    ]
    
    Số tam giác luôn chứa đỉnh $A_1$ (chọn $2$ đỉnh còn lại từ $23$ đỉnh) là:
    $ n(Omega_"mới") = C_23^2 = 253 " (tam giác)" $
    
    Đếm số tam giác vuông chứa $A_1$:

    *Trường hợp 1: $A_1$ là góc nhọn.*
    Khi đó cạnh huyền của tam giác phải là đường kính đi qua $A_1$ (tức là đường kính $A_1 A_{13}$). Đỉnh thứ $3$ (đỉnh góc vuông) có thể là bất kỳ đỉnh nào trong $22$ đỉnh còn lại. 
    $=>$ Có $22$ tam giác vuông loại này.
    
    *Trường hợp 2: $A_1$ là góc vuông.*
    Khi đó cạnh huyền phải là một đường kính *không* đi qua $A_1$. Đa giác có $24/2 = 12$ đường kính, trừ đi đường kính $A_1 A_{13}$ thì còn lại $11$ đường kính. Mỗi đường kính kết hợp với góc vuông $A_1$ tạo thành $1$ tam giác vuông.
    $=>$ Có $11$ tam giác vuông loại này.
    
    Tổng số tam giác vuông chứa $A_1$ là: $22 + 11 = 33 " (tam giác)"$.
    
    Xác suất cần tìm là:
    $ P = 33 / 253 = 3 / 23 $
    
    Giá trị cần tính:
    $ 1000 P = 1000 dot 3 / 23 = 3000 / 23 approx 130.43 $
    Làm tròn đến hàng đơn vị ta được kết quả *$130$*.
  ]
)

#tln(
  [Cho đa giác đều $(H)$ có $18$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $3$ đỉnh của $(H)$ để tạo thành một tam giác. Biết rằng tam giác được chọn là một *tam giác cân*, gọi $P$ là xác suất để tam giác đó là *tam giác đều*. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$45$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    let n = 18
    let step = 360deg / n
    for i in range(n) { circle((90deg - i * step, 2), radius: 1pt, fill: gray) }
    
    // Tam giác cân thường (màu cam)
    let c1 = (90deg, 2)
    let c2 = (90deg - 2 * step, 2)
    let c3 = (90deg + 2 * step, 2)
    line(c1, (-90deg, 2), stroke: (dash: "dashed", paint: orange, thickness: 0.8pt))
    line(c1, c2, c3, close: true, stroke: orange + 1pt, fill: rgb("FFA50030"))
    
    // Tam giác đều (màu đỏ)
    let d1 = (90deg - 5 * step, 2)
    let d2 = (90deg - 11 * step, 2)
    let d3 = (90deg - 17 * step, 2)
    line(d1, d2, d3, close: true, stroke: red + 1pt, fill: rgb("FF000030"))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Số tam giác đều của đa giác $n=18$ là $18/3 = 6$.
      - Tam giác cân nội tiếp có trục đối xứng đi qua $1$ đỉnh. Nếu đếm theo trục đối xứng, tam giác cân thường đếm $1$ lần, nhưng tam giác đều sẽ bị đếm lặp $3$ lần (vì có 3 trục đối xứng).
      - Phải thiết lập phương trình để tìm ra số lượng thực sự của không gian mẫu thu hẹp (Tổng số tam giác cân phân biệt).
    ]
    
    Đa giác có $18$ đỉnh. Số tam giác đều tạo thành là: $18 / 3 = 6$ (tam giác).
    
    Bây giờ ta đếm tổng số tam giác cân. Một tam giác cân có trục đối xứng đi qua đỉnh cân. Có $18$ cách chọn đỉnh làm đỉnh cân.
    Trục đối xứng đi qua đỉnh này và tâm $O$ sẽ đi qua đỉnh đối diện (vì $n=18$ chẵn). Trục này chia $16$ đỉnh còn lại thành $8$ cặp đỉnh đối xứng nhau. 
    Chọn $1$ cặp đối xứng kết hợp với đỉnh cân, ta tạo ra $1$ tam giác cân. Vậy tổng số lần tạo ra tam giác cân theo cách này là:
    $ 18 dot 8 = 144 " (lần)" $
    
    *LƯU Ý QUAN TRỌNG:* Trong $144$ lần đếm này, các tam giác cân thường (chỉ có $1$ trục đối xứng) được đếm đúng $1$ lần. Nhưng các tam giác đều (có $3$ trục đối xứng) đã bị đếm lặp $3$ lần.
    
    Gọi $x$ là số tam giác cân thường (không đều). Ta có phương trình đếm:
    $ 1 dot x + 3 dot n("TG đều") = 144 => x + 3 dot 6 = 144 => x = 126 " (tam giác)" $
    
    Tổng số tam giác cân phân biệt (bao gồm cả cân thường và đều) là không gian mẫu thu hẹp:
    $ n("TG cân") = 126 + 6 = 132 " (tam giác)" $
    
    Xác suất để chọn được tam giác đều trong số các tam giác cân là:
    $ P = 6 / 132 = 1 / 22 $
    
    Giá trị cần tính:
    $ 1000 P = 1000 dot 1 / 22 = 500 / 11 approx 45.45 $
    Làm tròn đến hàng đơn vị, ta thu được kết quả *$45$*.
  ]
)

#tln(
  [Cho đa giác đều $(H)$ có $12$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $4$ đỉnh của $(H)$ để tạo thành một tứ giác. Biết rằng tứ giác được chọn là một *hình thang*, gọi $P$ là xác suất để tứ giác đó là một *hình chữ nhật*. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$111$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    let n = 12
    let step = 360deg / n
    for i in range(n) {
      circle((90deg - i * step, 2), radius: 1pt, fill: gray)
    }
    
    // Hình thang cân (bao ngoài) - Nét đứt, màu cam
    let t1 = (90deg - 1 * step, 2)
    let t2 = (90deg - 3 * step, 2)
    let t3 = (90deg - 9 * step, 2)
    let t4 = (90deg - 11 * step, 2)
    line(t1, t2, t3, t4, close: true, stroke: (dash: "dashed", paint: orange, thickness: 1pt), fill: rgb("FFA50020"))
    
    // Hình chữ nhật (nằm trong) - Nét liền, màu xanh dương
    let r1 = (90deg - 1 * step, 2)
    let r2 = (90deg - 5 * step, 2)
    let r3 = (90deg - 7 * step, 2)
    let r4 = (90deg - 11 * step, 2)
    line(r1, r2, r3, r4, close: true, stroke: blue + 1.2pt, fill: rgb("0000FF30"))
    
    // Trục đối xứng chung
    line((90deg, 2.3), (-90deg, 2.3), stroke: (dash: "dotted", paint: red, thickness: 1pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Gọi $A$ là biến cố: "Tứ giác là hình thang".
      - Gọi $B$ là biến cố: "Tứ giác là hình chữ nhật".
      - Bài toán yêu cầu tính xác suất có điều kiện: $P(B | A) = (n(A ∩ B)) / n(A)$.
      - Chìa khóa: Mọi hình chữ nhật nội tiếp đều có các cạnh đối song song nên nó luôn là hình thang. Do đó $B subset A$, suy ra $A ∩ B = B$.
    ]
    
    Ta đi tính số phần tử của tập $A$ (số hình thang). 
    Với $n = 12$ (chẵn), số hình thang được tính bằng công thức sử dụng $2$ loại trục đối xứng, và phải bù trừ đi số Hình chữ nhật:
    $ n(A) = 12/2 dot C_((12-2)/2)^2 + (12/2 - 1) dot C_{12/2}^2 $
    $ n(A) = 6 dot C_5^2 + 5 dot C_6^2 = 6 dot 10 + 5 dot 15 = 60 + 75 = 135 " (hình)" $
    
    Tiếp theo, tính số phần tử của $A ∩ B$. Vì hình chữ nhật là một trường hợp đặc biệt của hình thang (có $B subset A$), nên $A ∩ B = B$. Số hình chữ nhật của đa giác $12$ đỉnh là:
    $ n(A ∩ B) = n(B) = C_{12/2}^2 = C_6^2 = 15 " (hình)" $
    
    Xác suất để tứ giác là hình chữ nhật khi biết nó là hình thang là:
    $ P(B | A) = (n(A ∩ B)) / n(A) = 15 / 135 = 1 / 9 $
    
    Giá trị cần tính:
    $ 1000 P = 1000 dot 1 / 9 approx 111.11 $
    Làm tròn đến hàng đơn vị ta được kết quả *$111$*.
    
    #nhanxet[
      Việc áp dụng công thức $A ∩ B = B$ giúp bài toán trở nên vô cùng trong sáng. Hình minh họa cho thấy một Hình chữ nhật luôn mang đầy đủ tính chất của một Hình thang cân (có trục đối xứng chung).
    ]
  ]
)

#tln(
  [Cho đa giác đều $(H)$ có $16$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $3$ đỉnh của $(H)$ để tạo thành một tam giác. Gọi $A$ là biến cố "Tam giác chứa đỉnh $A_1$" và $B$ là biến cố "Tam giác là tam giác vuông". Hãy tính $1000 \cdot P(A ∩ B)$ (làm tròn kết quả đến hàng đơn vị).],
  [$38$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    let n = 16
    let step = 360deg / n
    for i in range(n) {
      circle((90deg - i * step, 2), radius: 1pt, fill: gray)
    }
    
    let a1 = (90deg, 2)
    let a9 = (-90deg, 2)
    content(a1, $A_1$, anchor: "south", padding: 4pt)
    circle(a1, radius: 2pt, fill: red)
    
    // Một TG vuông nhận A1 làm góc vuông (Cạnh huyền không qua A1)
    let v2 = (90deg - 3 * step, 2)
    let v3 = (90deg + 5 * step, 2) // Đối diện v2
    line(v2, v3, stroke: (dash: "dashed", paint: orange, thickness: 1pt))
    line(a1, v2, v3, close: true, stroke: orange + 1.2pt, fill: rgb("FFA50030"))
    
    // Một TG vuông nhận A1 làm góc nhọn (Cạnh huyền đi qua A1)
    let h2 = (90deg - 6 * step, 2)
    line(a1, a9, stroke: (dash: "dashed", paint: blue, thickness: 1pt))
    line(a1, h2, a9, close: true, stroke: blue + 1.2pt, fill: rgb("0000FF30"))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Tính không gian mẫu: Số tam giác chọn từ $16$ đỉnh.
      - Biến cố giao $A ∩ B$ là sự kiện: "Tam giác chọn ra vừa chứa đỉnh $A_1$, vừa là tam giác vuông".
      - Đếm số phần tử của $A ∩ B$ bằng cách chia $2$ trường hợp: Đỉnh $A_1$ đóng vai trò là góc vuông, hoặc đỉnh $A_1$ đóng vai trò là góc nhọn.
    ]
    
    Không gian mẫu (chọn 3 đỉnh từ 16 đỉnh): 
    $ n(Omega) = C_16^3 = 560 " (tam giác)" $
    
    Ta tính số phần tử của biến cố giao $A ∩ B$.
    *Trường hợp 1: $A_1$ là góc vuông.*
    Để góc $A_1 = 90 degree$, cạnh huyền của tam giác phải là một đường kính không đi qua $A_1$. Đa giác có $16/2 = 8$ đường kính. Loại đi đường kính qua $A_1$, ta còn $7$ đường kính.
    $=>$ Có $7$ tam giác vuông loại này.
    
    *Trường hợp 2: $A_1$ là góc nhọn.*
    Lúc này, tam giác bắt buộc phải nhận đường kính đi qua $A_1$ (tức là đoạn $A_1 A_9$) làm cạnh huyền. Đỉnh góc vuông còn lại có thể là bất kỳ đỉnh nào trong $14$ đỉnh còn lại.
    $=>$ Có $14$ tam giác vuông loại này.
    
    Số phần tử của biến cố giao là:
    $ n(A ∩ B) = 7 + 14 = 21 " (tam giác)" $
    
    Xác suất của biến cố giao:
    $ P(A ∩ B) = 21 / 560 = 3 / 80 $
    
    Tính giá trị yêu cầu:
    $ 1000 dot P(A ∩ B) = 1000 dot 3 / 80 = 37.5 $
    Làm tròn đến hàng đơn vị, ta được kết quả *$38$*.
  ]
)

#tln(
  [Cho đa giác đều $(H)$ có $14$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $3$ đỉnh của $(H)$ để tạo thành một tam giác. Biết rằng tam giác được chọn là một *tam giác cân*, gọi $P$ là xác suất để tam giác đó là *tam giác tù*. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).],
  [$500$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0,0), radius: 2, stroke: black + 0.8pt)
    let n = 14
    let step = 360deg / n
    for i in range(n) {
      circle((90deg - i * step, 2), radius: 1pt, fill: gray)
    }
    
    let a1 = (90deg, 2)
    line(a1, (-90deg, 2), stroke: (dash: "dashed", paint: red, thickness: 1pt))
    content(a1, $A_1$, anchor: "south", padding: 4pt)
    
    // Tam giác cân TÙ tại A_1 (màu đỏ)
    let t1 = (90deg - 4 * step, 2)
    let t2 = (90deg + 4 * step, 2)
    line(a1, t1, t2, close: true, stroke: red + 1.2pt, fill: rgb("FF000030"))
    
    // Tam giác cân NHỌN tại A_1 (màu xanh)
    let n1 = (90deg - 1 * step, 2)
    let n2 = (90deg + 1 * step, 2)
    line(a1, n1, n2, close: true, stroke: blue + 1.2pt, fill: rgb("0000FF20"))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Gọi $A$: "Tam giác cân"; $B$: "Tam giác tù". Cần tính $P(B | A) = (n(A ∩ B)) / n(A)$.
      - Chú ý số học: $n=14$ không chia hết cho $3$, nên đa giác này *không chứa tam giác đều*. Suy ra mỗi tam giác cân chỉ có đúng $1$ đỉnh cân (không bị đếm trùng lặp).
      - Tính chất Hình học: Góc ở đáy của tam giác cân luôn nhỏ hơn $90 degree$. Do đó, để tam giác cân là tam giác tù, thì *góc tù bắt buộc phải nằm ở đỉnh cân*.
    ]
    
    *Bước 1: Tính số phần tử của $A$ (Số tam giác cân)*
    Một tam giác cân được tạo ra khi chọn $1$ đỉnh làm đỉnh cân, trục đối xứng đi qua đỉnh đó sẽ chia $12$ đỉnh còn lại thành $6$ cặp đối xứng. Chọn $1$ cặp đối xứng, ta được $1$ tam giác cân.
    Vì đa giác không có tam giác đều, tổng số tam giác cân là:
    $ n(A) = 14 dot 6 = 84 " (tam giác)" $
    
    *Bước 2: Tính số phần tử của $A ∩ B$ (Tam giác cân VÀ tù)*
    Giả sử tam giác cân đỉnh $A_1$. Để góc $A_1$ là góc tù ($> 90 degree$), thì cung chứa cặp đỉnh đáy tương ứng phải có số đo lớn hơn $180 degree$.
    Nói cách khác, hai đỉnh đáy phải nằm kề sát về phía $A_1$. Gọi $k$ là số bước cung từ $A_1$ đến đỉnh đáy $(1 <= k <= 6)$. Số đo góc tại đỉnh cân là: 
    $ "Góc " A_1 = k dot (180 degree) / 14 = k dot (90 degree) / 7 $
    Để góc này là góc nhọn (tam giác nhọn): $k dot 90 / 7 < 90 => k < 7$, điều này luôn đúng với mọi $k$.
    *(Đoạn lập luận trên hơi ngược. Ta làm theo bản chất hình học dễ hơn)*: 
    Để tam giác tù tại $A_1$, thì $3$ đỉnh của tam giác phải nằm cùng một phía trên nửa đường tròn chứa $A_1$. 
    Trong $6$ cặp đỉnh đối xứng qua trục $A_1$, có đúng $3$ cặp nằm ở nửa đường tròn phía trên gần $A_1$, và $3$ cặp nằm ở nửa đường tròn phía dưới (cách xa $A_1$). 
    Khi chọn $3$ cặp ở nửa trên, góc ở đỉnh $A_1$ sẽ là góc tù. 
    Do đó, mỗi đỉnh cân tạo ra đúng $3$ tam giác cân tù. Tổng số tam giác cân tù là:
    $ n(A ∩ B) = 14 dot 3 = 42 " (tam giác)" $
    
    *Bước 3: Tính xác suất*
    $ P = P(B | A) = (n(A ∩ B)) / n(A) = 42 / 84 = 1 / 2 $
    
    Giá trị cần tính:
    $ 1000 P = 1000 dot 1 / 2 = 500 $
    Kết quả là *$500$*.
    
    #nhanxet[
      Một bài toán chứng minh được sự hoàn hảo của Hình học phẳng: Một nửa số tam giác cân được tạo ra là tam giác nhọn (đáy cách xa đỉnh), nửa còn lại là tam giác tù (đáy ôm sát đỉnh). Do đó xác suất chính xác bằng $1/2$.
    ]
  ]
)

#tln(
  [Trên mặt phẳng tọa độ với đơn vị dài trên mỗi trục là kilômét có một khẩu pháo đặt tại gốc tọa độ và một mục tiêu chuyển động thẳng đều ở thời điểm ban đầu có tọa độ $A(0.5; 6)$. Ở thời điểm $20$ giây khoảng cách từ mục tiêu đến $3$ radar đặt tại $O, G(0.1; 0), H(0; 0.1)$ lần lượt là $sqrt(97)/2$ km; $sqrt(2386)/10$ km; $(2 sqrt(146))/5$ km. Ngay sau đó từ khẩu pháo bắn ra một viên đạn bay với tốc độ $v_0$ m/s để đón bắt mục tiêu. Hãy tính theo đơn vị m/s giá trị nhỏ nhất $v_0$ *(làm tròn kết quả đến hàng đơn vị)*.],
  [$99$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Vẽ vùng mặt biển (bo góc)
    rect((0.2, 0.2), (5, 4.5), radius: 0.3, fill: rgb("90E0EF"), stroke: blue + 1pt)
    content((3.5, 2.2), text(weight: "bold")[Mặt biển])
    
    // Trục tọa độ
    line((-0.3, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -0.3), (0, 4.8), mark: (end: ">"), stroke: 0.8pt)
    content((5.5, -0.2), $x$, anchor: "north")
    content((-0.2, 4.8), $y$, anchor: "east")
    
    // Gốc tọa độ và các điểm radar
    circle((0,0), radius: 1.5pt, fill: black); content((-0.2, -0.2), $O$, anchor: "north-east")
    circle((0.6,0), radius: 1pt, fill: black); content((0.6, -0.2), $G$, anchor: "north")
    circle((0,0.6), radius: 1pt, fill: black); content((-0.2, 0.6), $H$, anchor: "east")
    
    // Quỹ đạo mục tiêu
    line((0.5, 4.2), (4.2, 0.5), stroke: (dash: "dashed", paint: luma(70), thickness: 0.8pt))
    circle((0.8, 3.9), radius: 1.5pt, fill: black)
    content((0.8, 3.9), $A$, anchor: "south-west", padding: 3pt)
    
    // Viên đạn pháo (Sửa lỗi vectơ chuẩn Typst)
    line((0,0), (1.5, 1.1), mark: (end: ">"), stroke: blue + 1.2pt)
    content((1.2, 1.1), text(fill: blue)[$arrow(v)_0$], anchor: "south")
    content((0, -0.6), text(size: 9pt)[Khẩu pháo], anchor: "north")
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - *Bước 1:* Lập hệ phương trình khoảng cách từ mục tiêu đến $O, G, H$ tại thời điểm $t=20$s để tìm tọa độ điểm $B$ của mục tiêu.
      - *Bước 2:* Tính vectơ vận tốc của mục tiêu $arrow(v)$. Chuyển đổi toàn bộ đơn vị về *mét* và *giây* cho khớp với yêu cầu đề bài ($v_0$ tính bằng m/s).
      - *Bước 3:* Giả sử thời gian đạn bay là $tau$. Lập phương trình khoảng cách từ khẩu pháo đến mục tiêu theo $tau$. Tốc độ đạn $v_0 = "Khoảng cách" / tau$.
      - *Bước 4:* Đưa biểu thức $v_0^2$ về dạng hàm bậc hai theo biến $X = 1 / tau$ và tìm giá trị nhỏ nhất bằng cách xét đỉnh parabol.
    ]
    
    *1. Xác định vị trí mục tiêu tại $t=20$ giây* \
    Gọi $B(x; y)$ là vị trí của mục tiêu sau $20$ giây. Ta có hệ phương trình khoảng cách (bình phương hai vế):
    $ cases(
      O B^2 = x^2 + y^2 = (sqrt(97)/2)^2 = 24.25 quad (1),
      G B^2 = (x - 0.1)^2 + y^2 = (sqrt(2386)/10)^2 = 23.86 quad (2),
      H B^2 = x^2 + (y - 0.1)^2 = (2 sqrt(146)/5)^2 = 23.36 quad (3)
    ) $
    Lấy $(1) - (2)$ ta được: $0.2x - 0.01 = 24.25 - 23.86 = 0.39 => 0.2x = 0.4 => x = 2$. \
    Lấy $(1) - (3)$ ta được: $0.2y - 0.01 = 24.25 - 23.36 = 0.89 => 0.2y = 0.9 => y = 4.5$. \
    Thử lại $x^2 + y^2 = 2^2 + 4.5^2 = 24.25$ (thỏa mãn). Vậy tại $t=20$s, mục tiêu ở vị trí $B(2; 4.5)$ km.
    
    *2. Tính vận tốc mục tiêu (Đổi về m/s)* \
    Vị trí ban đầu $A(0.5; 6)$ km, vị trí lúc sau $B(2; 4.5)$ km. Thời gian di chuyển là $20$s. \
    Vectơ vận tốc mục tiêu:
    $ arrow(v)_M = arrow(A B) / 20 = ( (2 - 0.5)/20; (4.5 - 6)/20 ) = (0.075; -0.075) " km/s" $
    Đổi đơn vị sang mét: Vị trí bắt đầu bắn là $B(2000; 4500)$ (mét) và vận tốc mục tiêu là $arrow(v)_M = (75; -75)$ (m/s).
    
    *3. Tối ưu hóa vận tốc viên đạn $v_0$* \
    Gọi $tau > 0$ (giây) là thời gian từ lúc bắn đến lúc đạn trúng mục tiêu. \
    Tọa độ mục tiêu lúc trúng đạn: $M(tau) = (2000 + 75 tau; 4500 - 75 tau)$. \
    Quãng đường viên đạn bay từ $O(0;0)$ đến $M$ là:
    $ S^2 = (2000 + 75 tau)^2 + (4500 - 75 tau)^2 $
    Vận tốc đạn pháo là $v_0$. Ta có $S = v_0 tau => v_0^2 = S^2 / tau^2$. Thay vào ta được:
    $ v_0^2 = (2000/tau + 75)^2 + (4500/tau - 75)^2 $
    Đặt $X = 1/tau > 0$, hàm số trở thành parabol theo biến $X$:
    $ v_0^2 = (2000 X + 75)^2 + (4500 X - 75)^2 $
    $ v_0^2 = 24250000 X^2 - 375000 X + 11250 $
    Hàm số bậc hai đạt giá trị nhỏ nhất tại $X = (-b)/(2a) = 375000 / (2 dot 24250000) = 3/388$. \
    Thay $X = 3/388$ vào, ta tính được giá trị nhỏ nhất của $v_0^2$:
    $ min(v_0^2) = 11250 - 375000^2 / (4 dot 24250000) = 950625 / 97 $
    Suy ra tốc độ đạn nhỏ nhất cần thiết là:
    $ v_0 = sqrt(950625/97) approx 98.996 " (m/s)" $
    Làm tròn kết quả đến hàng đơn vị, ta thu được đáp án là *$99$*.

  ]
)

#tln(
  [Tại thời điểm $t = 0$, đài kiểm soát không lưu phát hiện hai thiết bị bay không người lái (drone). Drone thứ nhất xuất phát từ điểm $A(0; 40)$ di chuyển thẳng đều với vectơ vận tốc $arrow(v)_1 = (30; -10)$ km/h. Drone thứ hai xuất phát từ điểm $B(30; 0)$ di chuyển thẳng đều với vectơ vận tốc $arrow(v)_2 = (0; 20)$ km/h. Gọi $d$ (km) là khoảng cách ngắn nhất giữa hai drone trong suốt quá trình bay. Hãy tính giá trị của $d^2$.],
  [$50$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
    content((4.5, -0.2), $x$, anchor: "north")
    content((-0.2, 4.5), $y$, anchor: "east")
    
    // Tọa độ chia 10
    let start-A = (0, 4)
    let start-B = (3, 0)
    
    circle(start-A, radius: 1.5pt, fill: blue)
    content(start-A, $A$, anchor: "east", padding: 3pt)
    circle(start-B, radius: 1.5pt, fill: red)
    content(start-B, $B$, anchor: "north", padding: 3pt)
    
    // Quỹ đạo bay (đến t = 1.5)
    line(start-A, (4.5, 2.5), mark: (end: ">"), stroke: (dash: "dashed", paint: blue, thickness: 1pt))
    content((2, 3.5), text(fill: blue)[Drone 1], anchor: "south-west")
    
    line(start-B, (3, 3), mark: (end: ">"), stroke: (dash: "dashed", paint: red, thickness: 1pt))
    content((3.1, 1.5), text(fill: red)[Drone 2], anchor: "west")
    
    // Vị trí gần nhất (khoảng t = 1.16)
    let min-A = (3.5, 2.83)
    let min-B = (3, 2.33)
    circle(min-A, radius: 1.5pt, fill: black)
    circle(min-B, radius: 1.5pt, fill: black)
    line(min-A, min-B, stroke: orange + 1.2pt)
    content((3.25, 2.58), $d_("min")$, anchor: "east", padding: 2pt)
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - *Bước 1:* Lập phương trình tham số tọa độ của hai drone $M_1(t)$ và $M_2(t)$.
      - *Bước 2:* Lập biểu thức tọa độ của vectơ $arrow(M_1 M_2)$.
      - *Bước 3:* Viết hàm số $f(t) = |arrow(M_1 M_2)|^2 = (x_2 - x_1)^2 + (y_2 - y_1)^2$.
      - *Bước 4:* Đây là một hàm bậc hai theo $t$. Tìm đỉnh của parabol (sử dụng $-b/2a$ hoặc đạo hàm) để tìm khoảng cách bình phương nhỏ nhất.
    ]
    
    Gọi $t > 0$ (giờ) là thời gian di chuyển của hai drone. 
    Tọa độ của Drone 1 tại thời điểm $t$ là:
    $ M_1(t) = (0 + 30t ; 40 - 10t) = (30t ; 40 - 10t) $
    
    Tọa độ của Drone 2 tại thời điểm $t$ là:
    $ M_2(t) = (30 + 0t ; 0 + 20t) = (30 ; 20t) $
    
    Khoảng cách bình phương giữa hai drone tại thời điểm $t$ là $d^2 = M_1 M_2^2$:
    $ d^2(t) = (x_2 - x_1)^2 + (y_2 - y_1)^2 $
    $ d^2(t) = (30 - 30t)^2 + (20t - (40 - 10t))^2 $
    $ d^2(t) = (30 - 30t)^2 + (30t - 40)^2 $
    
    Rút nhân tử chung $10^2 = 100$ ra ngoài để dễ tính toán:
    $ d^2(t) = 100 [ (3 - 3t)^2 + (3t - 4)^2 ] $
    $ d^2(t) = 100 [ (9 - 18t + 9t^2) + (9t^2 - 24t + 16) ] $
    $ d^2(t) = 100 [ 18t^2 - 42t + 25 ] $
    
    Xét hàm số bậc hai bên trong ngoặc vuông $f(t) = 18t^2 - 42t + 25$.
    Đồ thị là một parabol quay bề lõm lên trên, do đó nó đạt giá trị nhỏ nhất tại đỉnh:
    $ t = (-b)/(2a) = 42 / (2 dot 18) = 42 / 36 = 7/6 " (giờ)" $
    
    Thay $t = 7/6$ vào hàm số để tìm giá trị nhỏ nhất của $d^2$:
    $ min(d^2) = 100 [ 18 (7/6)^2 - 42(7/6) + 25 ] $
    $ min(d^2) = 100 [ 18 (49/36) - 49 + 25 ] $
    $ min(d^2) = 100 [ 49/2 - 24 ] = 100 [ 24.5 - 24 ] = 100 dot 0.5 = 50 $
    
    Khoảng cách ngắn nhất giữa hai drone là $d_("min") = sqrt(50) = 5 sqrt(2) approx 7.07$ km.
    Bài toán yêu cầu tính giá trị của $d^2$, ta thu được kết quả là *$50$*.
    
    #nhanxet[
      Bài toán tìm khoảng cách ngắn nhất giữa hai vật thể chuyển động có thể được giải cực nhanh bằng vật lý: Coi hệ quy chiếu gắn với Drone 1 (Drone 1 đứng yên). Vận tốc tương đối của Drone 2 so với Drone 1 là $arrow(v)_(21) = arrow(v)_2 - arrow(v)_1$. Khi đó quỹ đạo tương đối của Drone 2 là một đường thẳng, và khoảng cách ngắn nhất chính là *khoảng cách từ A đến đường thẳng đó*.
    ]
  ]
)

#tln(
  [Trên màn hình radar phòng không (với mặt phẳng tọa độ $O x y$, đơn vị kilômét), một UAV mục tiêu xuất hiện tại điểm $A(50; 5)$ và bay thẳng đều với vectơ vận tốc $arrow(v)_1 = (-7; 3)$ km/phút. Ngay tại thời điểm đó, từ trạm phòng không tại gốc tọa độ $O(0;0)$, một tên lửa đánh chặn được phóng đi với tốc độ không đổi $v_2 = 5$ km/phút để đón đầu UAV. Giả sử cả hai bay trên cùng một mặt phẳng, hãy tính thời gian $t$ (phút) kể từ lúc phóng đến khi tên lửa tiêu diệt được mục tiêu.],
  [$5$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Lưới tọa độ minh họa
    rect((-0.5, -0.5), (5.5, 3), stroke: luma(200) + 0.5pt, fill: rgb("F8F9FA"))
    line((-0.5, 0), (5.8, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: ">"), stroke: 0.8pt)
    content((5.8, -0.2), $x$, anchor: "north")
    content((-0.2, 3.2), $y$, anchor: "east")
    
    // Tọa độ thực chia 10 để vẽ
    let start-uav = (5, 0.5)
    let intercept-pt = (1.5, 2.0)
    
    // Trạm phòng không O
    circle((0,0), radius: 1.5pt, fill: red)
    content((-0.2, -0.2), $O$, anchor: "north-east", fill: red)
    
    // Vị trí ban đầu của UAV
    circle(start-uav, radius: 1.5pt, fill: black)
    content(start-uav, $A$, anchor: "north-west", padding: 3pt)
    
    // Quỹ đạo UAV
    line(start-uav, intercept-pt, mark: (end: ">"), stroke: (dash: "dashed", paint: black, thickness: 0.8pt))
    content((3.5, 1.5), $arrow(v)_1$, anchor: "south-west")
    
    // Quỹ đạo tên lửa
    line((0,0), intercept-pt, mark: (end: ">"), stroke: red + 1.2pt)
    content((0.7, 1.2), text(fill: red)[$v_2 = 5$], anchor: "south-east")
    
    // Điểm đánh chặn
    circle(intercept-pt, radius: 2pt, fill: rgb("FFA500"))
    content(intercept-pt, text(weight: "bold", fill: rgb("D2691E"))[Mục tiêu bị diệt], anchor: "south", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - *Bước 1:* Lập phương trình tham số tọa độ của mục tiêu (UAV) theo thời gian $t$.
      - *Bước 2:* Tính bình phương khoảng cách từ trạm $O$ đến mục tiêu $M(t)$.
      - *Bước 3:* Quãng đường tên lửa bay được trong thời gian $t$ là $S = v_2 dot t$. Bình phương quãng đường này phải bằng bình phương khoảng cách $O M^2$.
      - *Bước 4:* Giải phương trình bậc hai ẩn $t$ và chọn nghiệm dương nhỏ nhất (thời điểm va chạm đầu tiên).
    ]
    
    Gọi $t > 0$ (phút) là thời gian bay cho đến khi đánh chặn thành công.
    Tọa độ của mục tiêu UAV tại thời điểm $t$ là:
    $ M(t) = (x_A + v_(1x) t ; y_A + v_(1y) t) = (50 - 7t ; 5 + 3t) $
    
    Khoảng cách từ trạm $O(0;0)$ đến mục tiêu $M(t)$ lúc này là đoạn $O M$. Bình phương khoảng cách:
    $ O M^2 = (50 - 7t)^2 + (5 + 3t)^2 $
    $ O M^2 = (2500 - 700t + 49t^2) + (25 + 30t + 9t^2) $
    $ O M^2 = 58t^2 - 670t + 2525 quad (1) $
    
    Mặt khác, tên lửa bay từ $O$ với tốc độ không đổi $v_2 = 5$ km/phút. Quãng đường tên lửa bay được trong thời gian $t$ là $S = 5t$. 
    Để đánh chặn thành công, tên lửa phải chạm đúng vị trí $M(t)$, nghĩa là:
    $ O M^2 = S^2 => O M^2 = (5t)^2 = 25t^2 quad (2) $
    
    Từ $(1)$ và $(2)$ ta có phương trình:
    $ 58t^2 - 670t + 2525 = 25t^2 $
    $ 33t^2 - 670t + 2525 = 0 $
    
    Tính $Delta' = 335^2 - 33 dot 2525 = 112225 - 83325 = 28900$. Suy ra $sqrt(Delta') = 170$.
    Phương trình có hai nghiệm:
    $ cases(
      t_1 = (335 - 170)/33 = 165/33 = 5,
      t_2 = (335 + 170)/33 = 505/33 approx 15.3
    ) $
    
    Thời điểm đánh chặn thành công là lần gặp nhau đầu tiên, do đó ta chọn $t = 5$ (phút).
    Tại $t=5$, vị trí đánh chặn là $M(50 - 35; 5 + 15) = M(15; 20)$. Quãng đường bay của tên lửa là $sqrt(15^2 + 20^2) = 25$ km (đúng bằng $5 dot 5$).
    
    Vậy thời gian cần thiết là *$5$* phút.
  ]
)

