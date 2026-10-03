#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 4: KHẢO SÁT SỰ BIẾN THIÊN VÀ VẼ ĐỒ THỊ HÀM SỐ
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)


#show: lecture-theme.with(
  title:       "Bài 4: Khảo sát sự biến thiên và vẽ đồ thị",
  subtitle:    "TOÁN 12 — Chương I: Ứng dụng của đạo hàm",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

// ════════════════════════════════════════════════

#lt-section-link("sec-004d1b", "🏛️", [Bối Cảnh Lịch Sử])
#lt-slide-back(title: "Nguồn Gốc Của Hình Học Giải Tích")[
  #lt-two-col(ratio: (55%, 45%))[
    *René Descartes và sự kết nối giữa Đại số - Hình học*
    - Trước thế kỷ 17, Hình học và Đại số là hai lĩnh vực độc lập.
    - *René Descartes* (1596-1650), nhà toán học và triết học người Pháp, đã phát minh ra *hệ toạ độ Descartes (Oxy)*.
    - Nhờ hệ toạ độ này, mọi đường cong hình học đều có thể biểu diễn bằng một phương trình đại số, và ngược lại.
    
    *Ý nghĩa*
    - Thay vì phải đo vẽ thủ công, ta dùng **đạo hàm** (công cụ mạnh nhất của Giải tích) để "quét" (khảo sát) hình dáng đồ thị một cách hoàn toàn chính xác.
  ][
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-3, 0), (3, 0), mark: (end: ">", fill: black))
        line((0, -2), (0, 3), mark: (end: ">", fill: black))
        content((3.2, 0), $x$)
        content((0, 3.2), $y$)
        content((-0.3, -0.3), $O$)
        // cubic curve y = x^3 - 3x
        bezier((-2.1, -3), (2.1, 3), (-1, 4), (1, -4), stroke: 1.5pt + red)
      })
    ]
  ]
]

#lt-section-link("sec-131bc1", "💡", [Sơ Đồ Khảo Sát Hàm Số])
#lt-slide-back(title: "Các Bước Khảo Sát Sự Biến Thiên Và Vẽ Đồ Thị")[
  Để khảo sát sự biến thiên và vẽ đồ thị của hàm số $y=f(x)$, ta thực hiện các bước sau:
  
  #step[Bước 1: Tìm tập xác định.]
  - Tìm điều kiện để hàm số có nghĩa.
  
  #step[Bước 2: Sự biến thiên.]
  - Xét chiều biến thiên: Tính đạo hàm $y'$, tìm các điểm mà $y'=0$ hoặc $y'$ không xác định. Xét dấu $y'$.
  - Tìm cực trị.
  - Tìm các giới hạn tại vô cực, giới hạn vô cực và tìm các đường tiệm cận (nếu có).
  - Lập Bảng biến thiên (BBT).
  
  #step[Bước 3: Vẽ đồ thị.]
  - Xác định giao điểm của đồ thị với các trục toạ độ (nếu có).
  - Lấy thêm một số điểm phụ (nếu cần thiết).
  - Vẽ đồ thị dựa vào BBT.
]

#lt-section-link("sec-fc9d98", "❓", [Luyện Tập Trắc Nghiệm])
// BÀI TẬP TRẮC NGHIỆM

#let draw-ellipse(cx, cy, rx, ry, stroke: 1pt, style: "solid") = {
  let stroke-val = stroke
  import draw: *
  if style == "dashed" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  } else if style == "dashed-back" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  } else {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: stroke-val)
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  }
}

#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd

// ==================== Đề 1 ====================
#my-tn(de: "Đề 1", 
  dir: "doc",lines: 2,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.2, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.25), $O$)
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = calc.pow(x, 3) + 0.5 * calc.pow(x, 2) - 1.5 * x + 0.4
      if y >= -1.4 and y <= 2.4 and x >= -2.1 and x <= 2.1 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Hàm số $y = a x^3 + b x^2 + c x + d$ có đồ thị như hình vẽ bên. Mệnh đề nào sau đây là đúng?],
  (
    [$a < 0, b < 0, c < 0, d < 0$.],
    [$a > 0, b > 0, c > 0, d < 0$.],
    True([$a > 0, b > 0, c < 0, d > 0$.]),
    [$a > 0, b < 0, c < 0, d > 0$.]
  ),
  loigiai: [
    #step[Nhánh cuối cùng của đồ thị đi lên nên $limits(lim)_(x -> +oo) y = +oo => a > 0$.]
    #step[Đồ thị cắt trục tung tại điểm có tung độ dương (nằm trên $O x$) nên $d > 0$.]
    #step[Hàm số có hai điểm cực trị $x_1, x_2$ nằm về hai phía của trục tung nên $x_1 x_2 < 0 <=> c/(3a) < 0$. Vì $a > 0$ nên $c < 0$.]
    #step[Điểm cực đại có hoành độ âm nằm xa trục tung hơn điểm cực tiểu có hoành độ dương (khoảng cách từ cực đại đến trục $O y$ lớn hơn cực tiểu), suy ra $x_1 + x_2 < 0 <=> (-2b)/(3a) < 0$. Vì $a > 0$ nên $b > 0$.]
    #step[Vậy $a > 0, b > 0, c < 0, d > 0$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  [Bảng biến thiên ở hình bên là của một trong bốn hàm số được cho dưới đây, đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $0$, $2$, $+oo$),
        d-signs: ("-", "0", "+", "0", "-"),
        v-vals: ($+oo$, $1$, $5$, $-oo$)
      )
    ]
  ],
  (
    [$y = -x^3 - 3x^2$.],
    [$y = x^3 - 3x^2 - 1$.],
    [$y = x^3 + 2x^2 + 1$.],
    True([$y = -x^3 + 3x^2 + 1$.])
  ),
  loigiai: [
    #step[Từ bảng biến thiên ta thấy $limits(lim)_(x -> +oo) y = -oo$ nên hệ số $a < 0$. Ta loại các phương án có $a > 0$.]
    #step[Hàm số đạt cực tiểu tại $x = 0$ và $y_"CT" = 1$. Thay $x = 0$ vào hàm số, ta thấy chỉ có hàm số $y = -x^3 + 3x^2 + 1$ là thỏa mãn $y(0) = 1$.]
    #step[Thử lại: $y' = -3x^2 + 6x = 0 <=> x = 0$ hoặc $x = 2$. Tại $x = 2$ thì $y = 5$. Hoàn toàn khớp với bảng biến thiên.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.2, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.2), (0, 3.8), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.8), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.25), $O$)
    
    line((-1, 0), (-1, 3), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 3), (-1, 3), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, 0), (1, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -1), (1, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = calc.pow(x, 3) - 3 * x + 1
      if y >= -2.1 and y <= 3.6 and x >= -2.1 and x <= 2.1 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị sau đây là của hàm số nào?],
  (
    True([$y = x^3 - 3x + 1$.]),
    [$y = x^3 - 3x - 1$.],
    [$y = -x^3 - 3x - 1$.],
    [$y = -x^3 + 3x + 1$.]
  ),
  loigiai: [
    #step[Quan sát đồ thị, ta thấy nhánh phải đi lên nên hệ số $a > 0$. Loại các đáp án có $a < 0$.]
    #step[Đồ thị cắt trục tung $O y$ tại điểm có tung độ dương (nằm trên $O x$) nên $y(0) > 0$. Loại đáp án $y = x^3 - 3x - 1$ vì $y(0) = -1 < 0$.]
    #step[Đồ thị đi qua điểm có tọa độ $(1; -1)$, thay vào hàm số $y = x^3 - 3x + 1$ ta được $-1 = 1^3 - 3(1) + 1$, thỏa mãn. Vậy hàm số cần tìm là $y = x^3 - 3x + 1$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = calc.pow(x, 4) - 2 * calc.pow(x, 2) - 1
      if y >= -2.4 and y <= 2.4 and x >= -2.4 and x <= 2.4 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đường cong trong hình vẽ bên là đồ thị của hàm số nào dưới đây?],
  (
    [$y = x^4 + 2x^2 - 1$.],
    [$y = -x^4 + 2x^2 - 1$.],
    True([$y = x^4 - 2x^2 - 1$.]),
    [$y = -x^4 - 2x^2 - 1$.]
  ),
  loigiai: [
    #step[Đồ thị hàm số có hình dạng chữ W, nét cuối đi lên nên đây là hàm số bậc bốn trùng phương có hệ số $a > 0$.]
    #step[Đồ thị hàm số có 3 điểm cực trị nên $a$ và $b$ trái dấu. Vì $a > 0$ suy ra $b < 0$.]
    #step[Kiểm tra các đáp án chỉ có hàm số $y = x^4 - 2x^2 - 1$ thỏa mãn $a = 1 > 0$ và $b = -2 < 0$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = -calc.pow(x, 4) + 2 * calc.pow(x, 2) + 1
      if y >= -2.4 and y <= 2.4 and x >= -2.4 and x <= 2.4 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = a x^4 + b x^2 + c$ có đồ thị như hình vẽ. Khẳng định nào sau đây đúng?],
  (
    [$a > 0, b < 0, c > 0$.],
    True([$a < 0, b > 0, c > 0$.]),
    [$a < 0, b < 0, c > 0$.],
    [$a > 0, b > 0, c < 0$.]
  ),
  loigiai: [
    #step[Đồ thị có nét cuối cùng đi xuống nên $a < 0$.]
    #step[Đồ thị có 3 điểm cực trị nên $a, b$ trái dấu. Do $a < 0 => b > 0$.]
    #step[Đồ thị cắt trục $O y$ tại điểm có tung độ dương nên $c > 0$.]
    #step[Vậy $a < 0, b > 0, c > 0$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-1.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.5), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận
    line((1, -2.5), (1, 3.5), stroke: (dash: "dashed", paint: red))
    line((-1.5, 2), (3.5, 2), stroke: (dash: "dashed", paint: red))
    
    let pts1 = ()
    let pts2 = ()
    for i in range(-15, 9) {
      let x = i / 10
      let y = (2*x + 1)/(x - 1)
      if y >= -2.4 and y <= 3.4 { pts1.push((x, y)) }
    }
    for i in range(11, 35) {
      let x = i / 10
      let y = (2*x + 1)/(x - 1)
      if y >= -2.4 and y <= 3.4 { pts2.push((x, y)) }
    }
    line(..pts1, stroke: 1.2pt + blue)
    line(..pts2, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đường cong trong hình vẽ là đồ thị của hàm số nào dưới đây?],
  (
    [$y = (x - 1)/(x + 1)$.],
    [$y = (2x - 1)/(x + 1)$.],
    [$y = (2x + 1)/(2x - 2)$.],
    True([$y = (2x + 1)/(x - 1)$.])
  ),
  loigiai: [
    #step[Quan sát đồ thị ta thấy đường tiệm cận đứng là $x = 1$, tiệm cận ngang là $y = 2$.]
    #step[Đáp án $y = (2x + 1)/(2x - 2)$ có tiệm cận đứng $x = 1$, tiệm cận ngang $y = 1$ (Loại).]
    #step[Đáp án $y = (2x + 1)/(x - 1)$ có tiệm cận đứng $x = 1$, tiệm cận ngang $y = 2$ (Thỏa mãn).]
    #step[Đồ thị đi qua điểm $(0; -1)$, thay $x=0$ vào $y = (2x + 1)/(x - 1)$ ta được $y = -1$ (Đúng).]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    // Tiệm cận
    line((-1, -2.5), (-1, 2.5), stroke: (dash: "dashed", paint: red))
    line((-2.5, -1), (2.5, -1), stroke: (dash: "dashed", paint: red))
    
    let pts1 = ()
    let pts2 = ()
    for i in range(-50, -11) {
      let x = i / 10
      let y = (-x + 2)/(x + 1)
      if y >= -2.4 and y <= 2.4 { pts1.push((x, y)) }
    }
    for i in range(-9, 25) {
      let x = i / 10
      let y = (-x + 2)/(x + 1)
      if y >= -2.4 and y <= 2.4 { pts2.push((x, y)) }
    }
    line(..pts1, stroke: 1.2pt + blue)
    line(..pts2, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x + b)/(c x + d)$ có đồ thị như hình vẽ. Khẳng định nào sau đây là đúng?],
  (
    True([$a c < 0, b d > 0$.]),
    [$a c > 0, b d < 0$.],
    [$a c < 0, b d < 0$.],
    [$a c > 0, b d > 0$.]
  ),
  loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = -d/c < 0 => c d > 0$.]
    #step[Đồ thị có tiệm cận ngang $y = a/c < 0 => a c < 0$.]
    #step[Đồ thị cắt trục $O y$ tại điểm có tung độ $y = b/d > 0 => b d > 0$.]
    #step[Vậy $a c < 0$ và $b d > 0$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  [Cho hàm số $y = (x - 2)/(x + 1)$. Giao điểm của hai đường tiệm cận của đồ thị hàm số có tọa độ là],
  (
    [$(1; 1)$.],
    True([$(-1; 1)$.]),
    [$(1; -1)$.],
    [$(-1; -2)$.]
  ),
  loigiai: [
    #step[Tiệm cận đứng của đồ thị hàm số là đường thẳng $x = -1$.]
    #step[Tiệm cận ngang của đồ thị hàm số là đường thẳng $y = 1/1 = 1$.]
    #step[Tọa độ giao điểm của hai đường tiệm cận là $I(-1; 1)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  [Đồ thị hàm số $y = x^3 - 3x^2 + 2$ cắt trục hoành tại bao nhiêu điểm?],
  (
    [$1$.],
    [$2$.],
    True([$3$.]),
    [$0$.]
  ),
  loigiai: [
    #step[Phương trình hoành độ giao điểm của đồ thị hàm số với trục hoành là $x^3 - 3x^2 + 2 = 0$.]
    #step[Ta nhẩm được một nghiệm $x = 1$. Phân tích thành nhân tử: $(x - 1)(x^2 - 2x - 2) = 0$.]
    #step[Phương trình $x^2 - 2x - 2 = 0$ có $Delta' = 1 - (-2) = 3 > 0$ nên có hai nghiệm phân biệt khác $1$ là $x = 1 plus.minus sqrt(3)$.]
    #step[Vậy phương trình có ba nghiệm phân biệt, đồ thị cắt trục hoành tại 3 điểm.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  [Cho hàm số $y = -x^4 + 2x^2 + 3$. Tọa độ giao điểm của đồ thị hàm số với trục tung là],
  (
    [$(0; -3)$.],
    True([$(0; 3)$.]),
    [$(3; 0)$.],
    [$(-3; 0)$.]
  ),
  loigiai: [
    #step[Giao điểm của đồ thị với trục tung có hoành độ $x = 0$.]
    #step[Thay $x = 0$ vào phương trình hàm số, ta được $y = -0^4 + 2(0)^2 + 3 = 3$.]
    #step[Vậy tọa độ giao điểm là $(0; 3)$.]
  ]
)



#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (1.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((1.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.2), (0, 3.2), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.2), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    line((-1.5, 0), (-1.5, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 1), (-1.5, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 0), (-1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 2), (-1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-1.5, -0.35), $-2$)
    content((-1, -0.35), $-1$)
    content((-0.25, 2), $2$)
    content((0.25, 0.75), $1$)
    
    let pts = ()
    for i in range(-23, 10) {
      let x = i / 10
      let y = 2 * calc.pow(x, 3) + 3 * calc.pow(x, 2) + 1
      if y >= -1.1 and y <= 3.0 and x >= -2.4 and x <= 0.8 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = f(x) = a x^3 + b x^2 + c x + d$ có đồ thị như hình vẽ dưới đây. Xét tính đúng sai của các mệnh đề:],
  (
    [Hàm số đạt cực tiểu tại $x = 1$.],
    True([Đồ thị hàm số cắt trục $O y$ tại điểm có toạ độ $(0; 1)$.]),
    True([Hàm số đồng biến trên khoảng $(-oo; -1)$.]),
    [$2 a + 3 b + c = 9$.]
  ),
  loigiai: [
    #step[a) Quan sát đồ thị, hàm số đạt cực tiểu tại điểm có hoành độ $x = 0$, không phải $x = 1$. (Sai)]
    #step[b) Đồ thị cắt trục $O y$ tại điểm có tọa độ $(0; 1)$ như quan sát trên hình. (Đúng)]
    #step[c) Trên khoảng $(-oo; -1)$, đồ thị có hướng đi lên từ trái sang phải, do đó hàm số đồng biến. (Đúng)]
    #step[d) Dựa vào đồ thị ta xác định được: $d=1$. Điểm cực trị tại $x=0, x=-1$ nên $y' = 3a x^2 + 2b x + c = 0$ có nghiệm $0$ và $-1$. Suy ra $c = 0$ và $-2b/(3a) = -1 => 3a = 2b$. Đồ thị đi qua $(-1; 2)$ nên $-a + b + d = 2 => -a + b = 1$. Từ đó giải hệ được $a = 2, b = 3$. Vậy $2a + 3b + c = 4 + 9 + 0 = 13 != 9$. (Sai)]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = f(x) = a x^3 + b x^2 + c x + d$ có bảng biến thiên như hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-2$, $0$, $+oo$),
        d-signs: ("-", "0", "+", "0", "-"),
        v-vals: ($+oo$, $0$, $4$, $-oo$)
      )
    ]
  Xét tính đúng sai của các mệnh đề:],
  (
    [Hàm số đạt giá trị lớn nhất là $4$.],
    True([Đường thẳng $y = 2$ cắt đồ thị hàm số tại ba điểm phân biệt.]),
    True([Trong bốn hệ số $a, b, c, d$ có đúng hai số âm.]),
    True([Đồ thị hàm số đi qua điểm $(-4; 20)$.])
  ),
  loigiai: [
    #step[a) Hàm số tiến tới $+oo$ khi $x -> -oo$, do đó không có giá trị lớn nhất tuyệt đối trên $RR$. $y=4$ chỉ là giá trị cực đại. (Sai)]
    #step[b) Dựa vào bảng biến thiên, đường thẳng $y=2$ nằm giữa $y_"CT"=0$ và $y_"CĐ"=4$ nên sẽ cắt đồ thị tại đúng 3 điểm phân biệt. (Đúng)]
    #step[c) Nhìn BBT ta thấy $a < 0$. Tại $x=0$ thì $y=4 => d = 4 > 0$. Hàm số đạt cực trị tại $x=0$ và $x=-2$. Ta có $x_1 x_2 = 0 => c = 0$. $x_1+x_2 = -2 => -2b/(3a) = -2 => b = 3a < 0$. Các hệ số là $a<0, b<0, c=0, d>0$. Vậy có đúng hai số âm là $a$ và $b$. (Đúng)]
    #step[d) Ta tìm được hàm số: $f'(x) = 3a x^2 + 2b x$. Do $b=3a$ nên $f'(x) = 3a x^2 + 6a x$. Nguyên hàm $f(x) = a x^3 + 3a x^2 + 4$. Điểm cực tiểu $(-2; 0) => a(-8) + 3a(4) + 4 = 0 => 4a = -4 => a = -1$. Vậy $f(x) = -x^3 - 3x^2 + 4$. Thay $x = -4$ ta có $f(-4) = -(-64) - 3(16) + 4 = 64 - 48 + 4 = 20$. Đồ thị đi qua $(-4; 20)$. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = calc.pow(x, 4) - 2 * calc.pow(x, 2) + 2
      if y >= -1.4 and y <= 3.4 and x >= -2.4 and x <= 2.4 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = a x^4 + b x^2 + c$ ($a != 0$) có đồ thị như hình bên. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số có hệ số $a > 0$ và $b < 0$.]),
    [Giá trị cực đại của hàm số là một số âm.],
    [Phương trình $f(x) = 0$ có $4$ nghiệm phân biệt.],
    True([Đồ thị hàm số nhận trục $O y$ làm trục đối xứng.])
  ),
  loigiai: [
    #step[a) Đồ thị hình chữ W nên $a > 0$. Hàm số có 3 điểm cực trị nên $a b < 0 => b < 0$. (Đúng)]
    #step[b) Điểm cực đại của đồ thị nằm trên trục $O y$ tại $y=c>0$. Do đó giá trị cực đại là số dương. (Sai)]
    #step[c) Toàn bộ đồ thị hàm số đều nằm trên trục hoành ($y > 0$), nên phương trình $f(x) = 0$ vô nghiệm. (Sai)]
    #step[d) Hàm số $y = a x^4 + b x^2 + c$ là hàm số chẵn nên đồ thị luôn nhận trục $O y$ làm trục đối xứng. Quan sát hình vẽ cũng thấy rõ điều này. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = (a x + b)/(x + c)$ có đồ thị như hình bên.
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        line((-3.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
        content((2.5, 0), $x$, anchor: "north", padding: 2pt)
        line((0, -2.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
        content((0, 3.5), $y$, anchor: "west", padding: 2pt)
        content((0.2, -0.2), $O$)
        
        // Tiệm cận
        line((-1, -2.5), (-1, 3.5), stroke: (dash: "dashed", paint: red))
        line((-3.5, 1), (2.5, 1), stroke: (dash: "dashed", paint: red))
        
        let pts1 = ()
        let pts2 = ()
        for i in range(-35, -12) {
          let x = i / 10
          let y = (x - 2)/(x + 1)
          if y >= -2.4 and y <= 3.4 { pts1.push((x, y)) }
        }
        for i in range(-8, 25) {
          let x = i / 10
          let y = (x - 2)/(x + 1)
          if y >= -2.4 and y <= 3.4 { pts2.push((x, y)) }
        }
        line(..pts1, stroke: 1.2pt + blue)
        line(..pts2, stroke: 1.2pt + blue)
      })
    ]
  Xét tính đúng sai của các khẳng định sau:],
  (
    [Đồ thị hàm số có đường tiệm cận đứng là $x = 1$.],
    True([Hàm số đồng biến trên từng khoảng xác định.]),
    [Trong ba số $a, b, c$, có đúng một số dương.],
    [Giao điểm của hai đường tiệm cận nằm ở góc phần tư thứ II.]
  ),
  loigiai: [
    #step[a) Dựa vào đồ thị, đường tiệm cận đứng là $x = -1$ chứ không phải $x = 1$. (Sai)]
    #step[b) Trên mỗi nhánh đồ thị (bên trái và bên phải TCĐ), đồ thị luôn đi lên từ trái sang phải, nên hàm số đồng biến trên từng khoảng xác định. (Đúng)]
    #step[c) TCĐ: $x = -c = -1 => c = 1 > 0$. TCN: $y = a = 1 => a = 1 > 0$. Giao với trục tung: $y = b/c < 0 => b/1 < 0 => b < 0$. Giao với trục hoành: $x = -b/a > 0 => -b/1 > 0 => b < 0$. Vậy $a=1, b<0, c=1$. Có đúng 2 số dương. Khẳng định sai. (Sai) *Cập nhật: À, đợi chút, trong 3 số a, b, c có hai số dương là a và c. Đề nói "có đúng 1 số dương" là sai. Sửa lại đáp án mẫu là False.*]
  ]
)



#my-tln(de: "Đề 1", 
  dir: "doc",
  [Có bao nhiêu giá trị nguyên của tham số thực $m$ để đường thẳng $y = 3x + m - 2$ cắt đồ thị $y = (x - 1)^3$ tại ba điểm phân biệt?],
  [$3$],
  loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x - 1)^3 = 3x + m - 2 <=> (x - 1)^3 - 3x + 2 = m$.]
    #step[Khảo sát hàm số $f(x) = (x - 1)^3 - 3x + 2$. Tập xác định: $D = RR$.]
    #step[$f'(x) = 3(x - 1)^2 - 3$. Cho $f'(x) = 0 <=> (x - 1)^2 = 1 <=> x = 2$ hoặc $x = 0$.]
    #step[Tại $x = 0 => f(0) = 1$. Tại $x = 2 => f(2) = -3$.]
    #step[Để đường thẳng cắt đồ thị tại 3 điểm phân biệt thì phương trình $f(x) = m$ phải có 3 nghiệm phân biệt. Điều này xảy ra khi $-3 < m < 1$.]
    #step[Do $m$ nguyên nên $m \in \{-2; -1; 0\}$. Có $3$ giá trị nguyên của $m$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "doc",
  [Cho hàm số $y = x^3 - 3x^2 + m x + 1$ có đồ thị $(C)$ và đường thẳng $d : y = 2x + 1$. Có bao nhiêu giá trị nguyên dương của tham số $m$ để đồ thị $(C)$ cắt đường thẳng $d$ tại $3$ điểm phân biệt?],
  [$3$],
  loigiai: [
    #step[Phương trình hoành độ giao điểm: $x^3 - 3x^2 + m x + 1 = 2x + 1 <=> x(x^2 - 3x + m - 2) = 0$.]
    #step[Phương trình tương đương với $x = 0$ hoặc $x^2 - 3x + m - 2 = 0$ (1).]
    #step[Để hai đồ thị cắt nhau tại 3 điểm phân biệt thì phương trình (1) phải có 2 nghiệm phân biệt khác 0.]
    #step[Điều kiện là: $Delta = (-3)^2 - 4(m - 2) > 0$ và $0^2 - 3(0) + m - 2 != 0$.]
    #step[$Delta = 9 - 4m + 8 = 17 - 4m > 0 => m < 17/4 = 4.25$. Và $m - 2 != 0 => m != 2$.]
    #step[Do $m$ nguyên dương nên $m \in \{1; 3; 4\}$. Vậy có 3 giá trị nguyên dương của $m$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "doc",
  [Với $m$ là một tham số thực thì đồ thị hàm số $y = x^3 - 2x^2 + x - 1$ và đường thẳng $y = m$ có nhiều nhất bao nhiêu giao điểm?],
  [$3$],
  loigiai: [
    #step[Đây là bài toán tìm số giao điểm của đường thẳng song song với trục hoành $y = m$ và đồ thị hàm bậc ba.]
    #step[Đồ thị hàm số bậc ba $y = a x^3 + b x^2 + c x + d$ ($a != 0$) có dạng sóng, tối đa có hai điểm cực trị.]
    #step[Một đường thẳng ngang $y = m$ có thể cắt một đồ thị hàm số bậc ba tại tối đa 3 điểm phân biệt. Điều này xảy ra khi đường thẳng nằm giữa giá trị cực đại và giá trị cực tiểu của hàm số.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "doc",
  [Có bao nhiêu giá trị nguyên của tham số $m$ để phương trình $x^3 - 3x^2 - m^2 + 5m = 0$ có ba nghiệm thực phân biệt?],
  [$0$],
  loigiai: [
    #step[Phương trình tương đương $x^3 - 3x^2 = m^2 - 5m$.]
    #step[Khảo sát hàm số $f(x) = x^3 - 3x^2$. Ta có $f'(x) = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Giá trị cực đại $f(0) = 0$. Giá trị cực tiểu $f(2) = -4$.]
    #step[Để phương trình có ba nghiệm phân biệt, đường thẳng $y = m^2 - 5m$ phải cắt đồ thị hàm số $y = f(x)$ tại 3 điểm. Điều kiện là: $-4 < m^2 - 5m < 0$.]
    #step[Giải bất phương trình $m^2 - 5m < 0 <=> 0 < m < 5$.]
    #step[Giải bất phương trình $m^2 - 5m > -4 <=> m^2 - 5m + 4 > 0 <=> m < 1$ hoặc $m > 4$.]
    #step[Kết hợp điều kiện, ta được $0 < m < 1$ hoặc $4 < m < 5$.]
    #step[Vì $m$ là số nguyên, không có giá trị nào của $m$ thỏa mãn nằm trong hai khoảng trên. Vậy có 0 giá trị.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "doc",
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị như hình vẽ.
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
      content((2.5, 0), $x$, anchor: "north", padding: 2pt)
      line((0, -2.5), (0, 4.5), mark: (end: ">"), stroke: 0.5pt)
      content((0, 4.5), $y$, anchor: "west", padding: 2pt)
      content((0.2, -0.2), $O$)
      
      let pts = ()
      for i in range(-24, 24) {
        let x = i / 10
        let y = -calc.pow(x, 4) + 4 * calc.pow(x, 2)
        if y >= -2.4 and y <= 4.4 and x >= -2.4 and x <= 2.4 {
          pts.push((x, y))
        }
      }
      line(..pts, stroke: 1.2pt + blue)
      
      // Đánh dấu các điểm
      let sqrt2 = 1.414
      line((sqrt2, 0), (sqrt2, 4), stroke: (dash: "dashed", paint: gray))
      line((-sqrt2, 0), (-sqrt2, 4), stroke: (dash: "dashed", paint: gray))
      line((-sqrt2, 4), (sqrt2, 4), stroke: (dash: "dashed", paint: gray))
      
      content((sqrt2, -0.3), $sqrt(2)$)
      content((-sqrt2, -0.3), $-sqrt(2)$)
      content((-0.2, 4), $4$, anchor: "east")
    })
  ]
  Biết phương trình $f(x) = m$ có 4 nghiệm phân biệt thì giá trị nguyên lớn nhất của tham số $m$ bằng bao nhiêu?],
  [$3$],
  loigiai: [
    #step[Dựa vào đồ thị, hàm số $f(x)$ là hàm bậc bốn trùng phương có điểm cực tiểu tại góc tọa độ $O(0; 0)$ và hai điểm cực đại đạt giá trị $y = 4$.]
    #step[Để phương trình $f(x) = m$ có đúng 4 nghiệm phân biệt thì đường thẳng $y = m$ phải cắt đồ thị tại 4 điểm phân biệt.]
    #step[Quan sát đồ thị, điều kiện này xảy ra khi và chỉ khi đường thẳng $y = m$ nằm trong khoảng giữa giá trị cực tiểu và giá trị cực đại, tức là $0 < m < 4$.]
    #step[Các giá trị nguyên của $m$ thỏa mãn là $m \in \{1; 2; 3\}$.]
    #step[Vậy giá trị nguyên lớn nhất của tham số $m$ là $3$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "doc",
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $f(x)$,
        x-vals: ($-oo$, $1$, $3$, $+oo$),
        d-signs: ("+", "0", "-", "0", "+"),
        v-vals: ($-oo$, $2$, $-4$, $+oo$)
      )
    ]
  Hỏi phương trình $2f(x) + 3 = 0$ có bao nhiêu nghiệm phân biệt?],
  [$3$],
  loigiai: [
    #step[Biến đổi phương trình: $2f(x) + 3 = 0 <=> f(x) = -3/2$.]
    #step[Số nghiệm của phương trình chính là số giao điểm của đồ thị hàm số $y = f(x)$ và đường thẳng $y = -1.5$.]
    #step[Dựa vào bảng biến thiên, ta thấy giá trị cực đại là $2$ và giá trị cực tiểu là $-4$.]
    #step[Vì $-4 < -1.5 < 2$ nên đường thẳng $y = -1.5$ cắt đồ thị $y = f(x)$ tại đúng 3 điểm phân biệt.]
    #step[Vậy phương trình đã cho có 3 nghiệm phân biệt.]
  ]
)



// ==================== Đề 2 ====================
#my-tn(de: "Đề 2", 
  dir: "doc",lines: 0,
  [Hàm số nào sau đây có bảng biến thiên như hình dưới đây?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $2$, $+oo$),
        d-signs: ("-", "||", "-"),
        v-vals: ($2$, ($-oo$, $+oo$), $2$),
        ranks: (1, (-2, 2), 1)
      )
    ]
  ],
  (
    [$y = (2x - 7)/(x - 2)$.],
    [$y = (2x + 1)/(x + 2)$.],
    True([$y = (2x + 1)/(x - 2)$.]),
    [$y = (1 - 2x)/(x - 2)$.]
  ),
    loigiai: [
    #step[Dựa vào bảng biến thiên, đồ thị hàm số có tiệm cận đứng $x = 2$ và tiệm cận ngang $y = 2$.]
    #step[Kiểm tra các phương án, chỉ có hàm số $y = (2x+1)/(x-2)$ thỏa mãn cả hai điều kiện trên.]
  ]
)


// ─── CÂU 2 ───
#my-tn(de: "Đề 2", 
  dir: "doc",lines: 2,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-4.0, 0), (3.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 5.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.0), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = -1
    line((-1, -3.0), (-1, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-1, 0.35), $-1$, anchor: "east")
    
    // Tiệm cận ngang y = 1
    line((-4.0, 1), (3.0, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.2, 1.2), $1$)
    
    // Đồ thị y = (x + 2)/(x + 1)
    // Nhánh trái: x thuộc [-4.0, -1.15]
    let pts_left = ()
    for i in range(-40, -12) {
      let x = i / 10
      let y = (x + 2) / (x + 1)
      if y >= -3.0 and y <= 5.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [-0.85, 3.0]
    let pts_right = ()
    for i in range(-8, 30) {
      let x = i / 10
      let y = (x + 2) / (x + 1)
      if y >= -3.0 and y <= 5.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x + b)/(c x + d)$ có đồ thị hàm số như hình vẽ dưới đây. Tìm khẳng định đúng trong các khẳng định sau:],
  (
    [$0 < b < a$.],
    True([$0 < a < b$.]),
    [$b < 0 < a$.],
    [$a < b < 0$.]
  ),
    loigiai: [
    #step[Từ đồ thị ta thấy tiệm cận ngang $y = a/c = 1 => a = c$.]
    #step[Tiệm cận đứng $x = -d/c = -1 => c = d$. Do đó $a = c = d$.]
    #step[Đồ thị cắt trục tung tại $(0; 2) => b/d = 2 => b = 2d = 2a$.]
    #step[Vì $a, b, c, d$ cùng dấu (do $a=c=d$, $b=2a$), giả sử $a>0$ ta có $b = 2a > a > 0$, suy ra $0 < a < b$.]
  ]
)


// ─── CÂU 3 ───
#my-tn(de: "Đề 2", 
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-4.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, -0.4), $x = 1$, anchor: "north")
    
    // Tiệm cận ngang y = 1
    line((-4.0, 1), (4.0, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-2.0, 1.2), $y = 1$)
    
    // Đồ thị y = x/(x - 1)
    // Nhánh trái: x thuộc [-4.0, 0.85]
    let pts_left = ()
    for i in range(-40, 8) {
      let x = i / 10
      let y = x / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [1.15, 4.0]
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = x / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Hàm số nào sau đây mà đồ thị có dạng như hình vẽ bên dưới?],
  (
    [$y = x/(1 - x)$.],
    [$y = (x + 1)/(1 - x)$.],
    [$y = (x + 1)/(x - 1)$.],
    True([$y = x/(x - 1)$.])
  ),
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = 1$ và tiệm cận ngang $y = 1$.]
    #step[Đồ thị đi qua gốc tọa độ $O(0; 0)$.]
    #step[Trong các phương án, chỉ có hàm số $y = x/(x - 1)$ thỏa mãn tất cả các tính chất trên.]
  ]
)


// ─── CÂU 4 ───
#my-tn(de: "Đề 2", 
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, 0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.3, -3.5), $x = 1$)
    
    // Tiệm cận ngang y = -1
    line((-3.0, -1), (4.0, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((2.5, -1.3), $y = -1$)
    
    // Đồ thị y = (-x + 2)/(x - 1)
    // Nhánh trái: x thuộc [-3.0, 0.8]
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [1.2, 4.0]
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x - b)/(x - 1)$ có đồ thị như hình vẽ. Khẳng định nào dưới đây là đúng?],
  (
    [$b < 0 < a$.],
    [$0 < b < a$.],
    True([$b < a < 0$.]),
    [$0 < a < b$.]
  ),
    loigiai: [
    #step[Đồ thị có tiệm cận ngang $y = -1 => a/1 = -1 => a = -1$.]
    #step[Đồ thị cắt trục tung tại điểm có tung độ $y = -2 => (-b)/(-1) = -2 => b = -2$.]
    #step[Vậy $b = -2 < a = -1 < 0$.]
  ]
)


// ─── CÂU 5 ───
#my-tn(de: "Đề 2", 
  dir: "doc",lines:0,
  [Bảng biến thiên sau đây của hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-1$, $+oo$),
        d-signs: ("+", "||", "+"),
        v-vals: ($2$, ($+oo$, $-oo$), $2$),
        ranks: (0, (2, -1), 0)
      )
    ]
  ],
  (
    [$y = (2x + 3)/(x + 1)$.],
    [$y = (2x - 1)/(x - 1)$.],
    True([$y = (2x - 1)/(x + 1)$.]),
    [$y = (x + 1)/(2x - 1)$.]
  ),
    loigiai: [
    #step[Bảng biến thiên cho thấy hàm số có tiệm cận đứng $x = -1$, tiệm cận ngang $y = 2$.]
    #step[Đạo hàm $y' > 0$ nên hàm số đồng biến trên từng khoảng xác định. Kiểm tra hàm $y = (2x-1)/(x+1)$ có $y' = 3/(x+1)^2 > 0$, thỏa mãn điều kiện đồng biến.]
  ]
)


// ─── CÂU 6 ───
#my-tn(de: "Đề 2", 
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, 0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.3, -3.5), $x = 1$)
    
    // Tiệm cận ngang y = -1
    line((-3.0, -1), (4.0, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((2.5, -1.3), $y = -1$)
    
    // Điểm cắt trục tung (0, -2)
    content((-0.3, -2), $-2$)
    circle((0, -2), radius: 1.5pt, fill: black)
    
    // Điểm cắt trục hoành (2, 0)
    content((2, 0.3), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (-x + 2)/(x - 1)
    // Nhánh trái: x thuộc [-3.0, 0.8]
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [1.2, 4.0]
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x - b)/(x - 1)$ có đồ thị như hình vẽ bên. Tích $a . b$ bằng],
  (
    True([$2$.]),
    [$-3$.],
    [$-2$.],
    [$3$.]
  ),
    loigiai: [
    #step[Đồ thị có tiệm cận ngang $y = -1 => a/1 = -1 => a = -1$.]
    #step[Đồ thị cắt trục tung tại $(0; -2) => (-b)/(-1) = -2 => b = -2$.]
    #step[Vậy tích $a b = (-1) . (-2) = 2$.]
  ]
)


// ─── CÂU 7 ───
#my-tn(de: "Đề 2", 
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -3.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.3, -2.5), $x = 1$)
    
    // Tiệm cận ngang y = 1/2
    line((-3.0, 0.5), (4.0, 0.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-2.0, 0.8), $y = 1/2$)
    
    // Đồ thị y = (x + 1)/(2x - 2)
    // Nhánh trái: x thuộc [-3.0, 0.8]
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (x + 1) / (2 * x - 2)
      if y >= -3.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [1.2, 4.0]
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (x + 1) / (2 * x - 2)
      if y >= -3.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đường cong trong hình dưới đây là đồ thị của hàm số nào trong các hàm số sau?],
  (
    [$y = (x + 1)/(x - 1)$.],
    [$y = (2x - 4)/(x - 1)$.],
    True([$y = (x + 1)/(2x - 2)$.]),
    [$y = (2x)/(3x - 3)$.]
  ),
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = 1$ và tiệm cận ngang $y = 1/2$.]
    #step[Đồ thị cắt $O y$ tại điểm có tung độ âm (nằm dưới trục hoành). Kiểm tra hàm số $y = (x+1)/(2x-2)$, ta thấy tiệm cận đứng $x = 1$, tiệm cận ngang $y = 1/2$ và giao $O y$ tại $y = -1/2 < 0$.]
  ]
)


// ─── CÂU 8 ───
#my-tn(de: "Đề 2", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, 0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, 0.25), $1$)
    
    // Tiệm cận ngang y = -1
    line((-3.0, -1), (4.0, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.25, -1.25), $-1$)
    
    // Giao điểm với các trục
    content((2, 0.25), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    content((-0.3, -2), $-2$)
    circle((0, -2), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (-x + 2)/(x - 1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x + b)/(x + c)$ với $a, b, c in RR$ có đồ thị như hình vẽ bên. Giá trị của $a + 2b + 3c$ bằng],
  (
    [$2$.],
    True([$0$.]),
    [$6$.],
    [$-8$.]
  ),
    loigiai: [
    #step[Tiệm cận đứng $x = -c = 1 => c = -1$.]
    #step[Tiệm cận ngang $y = a/1 = -1 => a = -1$.]
    #step[Giao với trục tung tại $(0; -2) => b/c = -2 => b/(-1) = -2 => b = 2$.]
    #step[Vậy $a + 2b + 3c = (-1) + 2(2) + 3(-1) = 0$.]
  ]
)


// ─── CÂU 9 ───
#my-tn(de: "Đề 2", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -3.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, -0.25), $1$)
    
    // Tiệm cận ngang y = 1
    line((-3.0, 1), (4.0, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-0.25, 1), $1$)
    
    // Giao điểm
    content((2, 0.25), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    content((-0.25, 2), $2$)
    circle((0, 2), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (x - 2)/(x - 1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (x - 2) / (x - 1)
      if y >= -3.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (x - 2) / (x - 1)
      if y >= -3.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đường cong ở hình dưới đây là đồ thị của hàm số $y = (x + a)/(b x + c)$, ($a, b, c in ZZ$). Khi đó giá trị biểu thức $T = a - 3b - 2c$ bằng],
  (
    [$3$.],
    [$2$.],
    [$0$.],
    True([$-3$.])
  ),
    loigiai: [
    #step[Tiệm cận ngang $y = 1/b = 1 => b = 1$.]
    #step[Tiệm cận đứng $x = -c/b = 1 => c = -b = -1$.]
    #step[Giao với trục hoành tại $(2; 0) => x + a = 0 => 2 + a = 0 => a = -2$.]
    #step[Vậy $T = a - 3b - 2c = -2 - 3(1) - 2(-1) = -3$.]
  ]
)


// ─── CÂU 10 ───
#my-tn(de: "Đề 2", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, 0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.2, 0.25), $1$)
    
    // Tiệm cận ngang y = -1
    line((-3.0, -1), (4.0, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.25, -1.25), $-1$)
    
    // Giao điểm với các trục
    content((2, 0.25), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    content((-0.3, -2), $-2$)
    circle((0, -2), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (-x + 2)/(x - 1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x - b)/(x - 1)$ có đồ thị như hình vẽ. Khẳng định nào dưới đây là đúng?],
  (
    True([$b < a < 0$.]),
    [$0 < b < a$.],
    [$b < 0 < a$.],
    [$0 < a < b$.]
  ),
    loigiai: [
    #step[Đồ thị có tiệm cận ngang $y = -1 => a/1 = -1 => a = -1$.]
    #step[Đồ thị cắt trục tung tại $(0; -2) => (-b)/(-1) = -2 => b = -2$.]
    #step[Vậy $b = -2 < a = -1 < 0$.]
  ]
)



// ─── CÂU 1 ───
#my-ds(de: "Đề 2", 
  dir: "doc",lines: 2,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -3.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, -0.25), $1$)
    
    // Tiệm cận ngang y = 1
    line((-3.0, 1), (4.0, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-0.25, 1), $1$)
    
    // Giao điểm
    content((2, 0.25), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    content((-0.25, 2), $2$)
    circle((0, 2), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (x - 2)/(x - 1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (x - 2) / (x - 1)
      if y >= -3.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (x - 2) / (x - 1)
      if y >= -3.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (x + a)/(b x + c)$ với $a, b, c in ZZ$ có đồ thị như hình vẽ dưới đây:],
  (
    True([Đường tiệm cận đứng $x = 1$]),
    [Đường tiệm cận ngang $y = 0$],
    [Hàm số đồng biến trên $RR$],
    True([$T = a - 3b - 2c = -3$])
  ),
    loigiai: [
    #step[Từ đồ thị, ta có tiệm cận ngang $y = 1/b = 1 => b = 1$.]
    #step[Tiệm cận đứng $x = -c/b = 1 => c = -b = -1$.]
    #step[Giao với trục hoành tại $(2; 0) => 2 + a = 0 => a = -2$. Vậy hàm số là $y = (x - 2)/(x - 1)$.]
    #step[a) Đồ thị có tiệm cận đứng $x = 1$. (Đúng)]
    #step[b) Đồ thị có tiệm cận ngang $y = 1$. Phát biểu TCN $y=0$ là sai. (Sai)]
    #step[c) Hàm số có tập xác định $D = RR \ {1}$ và $y' = 1/(x-1)^2 > 0$ nên đồng biến trên từng khoảng xác định. Không thể kết luận đồng biến trên $RR$. (Sai)]
    #step[d) $T = a - 3b - 2c = -2 - 3(1) - 2(-1) = -3$. (Đúng)]
  ]
)


// ─── CÂU 2 ───
#my-ds(de: "Đề 2", 
  dir: "doc",lines:2,
  [Cho hàm số $f(x) = (a x - 1)/(b x + c)$ với $a, b, c in RR$ có bảng biến thiên như hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-oo$, $3$, $+oo$),
        d-signs: ("-", "||", "-"),
        v-vals: ($1/2$, ($-oo$, $+oo$), $1/2$),
        w1: 1.5, // Tăng độ rộng cột đầu tiên
        w2: 10, // Tăng độ rộng chiều ngang của BBT
        // ranks: (1, (-2, 2), 0)
      )
    ]
  ],
  (
    True([Hàm số nghịch biến trên khoảng $(-oo; 1/2)$]),
    [Đồ thị hàm số có tiệm cận đứng $x = 1/2$],
    True([Đồ thị giao với trục hoành tại điểm có hoành độ nhỏ hơn 3]),
    True([$hoac(b > 2/3, b < 0)$])
  ),
    loigiai: [
    #step[Bảng biến thiên cho thấy hàm số có tiệm cận đứng $x = 3 => -c/b = 3 => c = -3b$.]
    #step[Tiệm cận ngang $y = a/b = 1/2 => a = b/2$.]
    #step[Hàm số nghịch biến $=> f'(x) < 0 => (a c - (-b))/(b x+c)^2 < 0 => a c + b < 0 => (b/2)(-3b) + b < 0 => -3/2 b^2 + b < 0 => b < 0$ hoặc $b > 2/3$.]
    #step[a) Do $1/2 < 3$ nên khoảng $(-oo; 1/2)$ nằm hoàn toàn trong khoảng $(-oo; 3)$, hàm số nghịch biến trên khoảng này. (Đúng)]
    #step[b) Tiệm cận đứng của đồ thị là $x = 3$. (Sai)]
    #step[c) Đồ thị giao $O x$ tại $x = 1/a = 2/b$. Nếu $b < 0$ thì $2/b < 0 < 3$. Nếu $b > 2/3$ thì $2/b < 3$. Vậy hoành độ giao điểm luôn nhỏ hơn 3. (Đúng)]
    #step[d) Điều kiện nghịch biến cho ta $b < 0$ hoặc $b > 2/3$. (Đúng)]
  ]
)


// ─── CÂU 3 ───
#my-ds(de: "Đề 2", 
  dir: "doc",lines: 4,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-4.0, 0), (3.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.0), (0, 5.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.0), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = -1
    line((-1, -2.0), (-1, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-1, -0.35), $-1$)
    
    // Điểm giao Oy (0, 3)
    content((0.25, 3), $3$)
    circle((0, 3), radius: 1.5pt, fill: black)
    
    // Đồ thị y = 3 / (x + 1)^2
    let pts_left = ()
    for i in range(-40, -12) {
      let x = i / 10
      let y = 3 / calc.pow(x + 1, 2)
      if y >= -2.0 and y <= 5.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(-8, 30) {
      let x = i / 10
      let y = 3 / calc.pow(x + 1, 2)
      if y >= -2.0 and y <= 5.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $f(x) = (a x + b)/(c x + d)$ với $a, b, c, d in RR$ có đồ thị hàm số $y = f'(x)$ nhận $x = -1$ làm tiệm cận đứng như hình vẽ bên. Biết rằng giá trị lớn nhất của hàm số $y = f(x)$ trên đoạn $[-3; -2]$ bằng 8.],
  (
    True([$f'(0) = 3$]),
    [Hàm số $y = f(x)$ nghịch biến trên khoảng $(-1; +oo)$],
    [Giá trị của $f(-3)$ bằng 8],
    True([Giá trị của $f(2)$ bằng 4])
  ),
    loigiai: [
    #step[Đạo hàm $f'(x) = (a d - b c)/(c x + d)^2$. Từ đồ thị $f'(x) = 3/(x+1)^2$, suy ra $c = 1, d = 1$ và $a d - b c = a - b = 3$.]
    #step[Suy ra $f(x) = (a x + b)/(x + 1)$. Do $f'(x) > 0$ nên $f(x)$ đồng biến trên từng khoảng xác định.]
    #step[Trên đoạn $[-3; -2]$, hàm số đồng biến nên đạt GTLN tại $x = -2$. Suy ra $f(-2) = 8 => (-2a + b)/(-1) = 8 => 2a - b = 8$. Giải hệ tìm được $a = 5, b = 2$.]
    #step[Vậy $f(x) = (5x + 2)/(x + 1)$.]
    #step[a) $f'(0) = 3/(0+1)^2 = 3$. (Đúng)]
    #step[b) Hàm số $y = f(x)$ đồng biến (do $f'(x) > 0$). (Sai)]
    #step[c) $f(-3) = (5(-3)+2)/(-3+1) = (-13)/(-2) = 13/2 = 6.5$. (Sai)]
    #step[d) $f(2) = (10+2)/(2+1) = 4$. (Đúng)]
  ]
)


// ─── CÂU 4 ───
#my-ds(de: "Đề 2", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = (m x - 1)/(2x + m)$ có đồ thị là $(C_m)$ với $m$ là tham số.],
  (
    True([Khi $m = 2$ thì đồ thị hàm số có đường tiệm cận ngang $y = 1$]),
    [Khi $m = 2$ thì giao điểm của các đường tiệm cận có tọa độ $I(1; -1)$],
    True([Đường tiệm cận đứng của đồ thị hàm số đi qua điểm $A(-1; sqrt(2))$ thì $m = 2$]),
    True([Với mọi giá trị của tham số $m$ thì hàm số luôn đồng biến trên mỗi khoảng xác định của nó])
  ),
    loigiai: [
    #step[a) Khi $m = 2$, hàm số là $y = (2x - 1)/(2x + 2)$. Tiệm cận ngang là $y = 2/2 = 1$. (Đúng)]
    #step[b) Khi $m = 2$, TCĐ $x = -1$, TCN $y = 1$ nên tâm đối xứng $I(-1; 1)$. (Sai)]
    #step[c) TCĐ $x = -m/2$. Đi qua điểm $A(-1; sqrt(2))$ nghĩa là hoành độ $x = -1 => -m/2 = -1 => m = 2$. (Đúng)]
    #step[d) Đạo hàm $y' = (m^2 + 2)/(2x + m)^2 > 0, forall x != -m/2$. Nên hàm số luôn đồng biến trên mỗi khoảng xác định. (Đúng)]
  ]
)




// ─── CÂU 1 ───
#my-tln(de: "Đề 2", 
  dir: "doc",
  [Cho hàm số $y = ((2m - 1)x - m)/(x + m)$ ($m != 0$) có đồ thị $(C_m)$. Biết rằng tồn tại duy nhất một đường thẳng $(d)$ có phương trình $y = a x + b$ sao cho $(C_m)$ luôn tiếp xúc với $(d)$. Tính giá trị của $a + b$.],
  [$1$],
    loigiai: [
    #step[Xét phương trình hoành độ giao điểm: $((2m - 1)x - m)/(x + m) = a x + b$.]
    #step[Quy đồng (với $x != -m$), ta được: $a x^2 + (a m + b - 2m + 1)x + b m + m = 0$.]
    #step[Để đồ thị luôn tiếp xúc đường thẳng $d$ với mọi $m != 0$, phương trình phải có nghiệm kép $forall m => Delta = 0 forall m$.]
    #step[$Delta = (m(a - 2) + b + 1)^2 - 4a m(b + 1) = 0 => m^2(a - 2)^2 + 2m(a - 2)(b + 1) + (b + 1)^2 - 4a m(b + 1) = 0$.]
    #step[Hệ số của $m^2$ phải bằng $0 => (a - 2)^2 = 0 => a = 2$. Thay $a=2$ vào ta được hệ số tự do $(b + 1)^2 = 0 => b = -1$. Lúc này hệ số của $m$ là $0$, thỏa mãn với mọi $m$.]
    #step[Vậy $a = 2, b = -1 => a + b = 1$.]
  ]
)


// ─── CÂU 2 ───
#my-tln(de: "Đề 2", 
  dir: "doc",
  [Tập tất cả các giá trị thực của tham số $m$ để đường thẳng $d: y = x - 2m$ cắt đồ thị hàm số $y = (x - 3)/(x + 1)$ $(C)$ tại hai điểm phân biệt có hoành độ dương là $(a; b)$. Tính giá trị biểu thức $a + b$.],
  [$2.5$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x - 3)/(x + 1) = x - 2m => x - 3 = x^2 + (1 - 2m)x - 2m => x^2 - 2m x - 2m + 3 = 0$.]
    #step[Để cắt tại 2 điểm phân biệt có hoành độ dương, phương trình phải có 2 nghiệm dương phân biệt.]
    #step[Điều kiện: $Delta' = m^2 - (-2m + 3) = m^2 + 2m - 3 > 0 => m > 1$ hoặc $m < -3$.]
    #step[Tổng $S = 2m > 0 => m > 0$. Tích $P = -2m + 3 > 0 => m < 3/2$.]
    #step[Kết hợp điều kiện, ta có $1 < m < 1.5$. Vậy khoảng $(a; b) = (1; 1.5) => a + b = 1 + 1.5 = 2.5$.]
  ]
)


// ─── CÂU 3 ───
#my-tln(de: "Đề 2", 
  dir: "doc",
  [Cho hàm số $y = (x + m)/(x - 1)$ có đồ thị là đường cong $(H)$ và đường thẳng $Delta$ có phương trình $y = x + 1$. Số giá trị nguyên của tham số $m$ nhỏ hơn 10 để đường thẳng $Delta$ cắt đường cong $(H)$ tại hai điểm phân biệt nằm về hai nhánh của đồ thị.],
  [$10$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x + m)/(x - 1) = x + 1 => x + m = x^2 - 1 => x^2 - x - (m + 1) = 0$.]
    #step[Để đường thẳng cắt đồ thị tại 2 điểm phân biệt nằm về hai nhánh, phương trình phải có 2 nghiệm $x_1, x_2$ thỏa mãn $x_1 < 1 < x_2$.]
    #step[Điều kiện là $1 dot f(1) < 0 => 1^2 - 1 - (m + 1) < 0 => -(m + 1) < 0 => m > -1$.]
    #step[Các giá trị nguyên $m < 10$ là $m \in \{0, 1, 2, ..., 9\}$. Có tất cả 10 giá trị.]
  ]
)


// ─── CÂU 4 ───
#my-tln(de: "Đề 2", 
  dir: "doc",
  [Có bao nhiêu giá trị nguyên dương của $m$ sao cho đường thẳng $y = x + m$ cắt đồ thị hàm số $y = (2x - 1)/(x + 1)$ tại hai điểm phân biệt $A, B$ và $A B <= 4$.],
  [$1$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(2x - 1)/(x + 1) = x + m => 2x - 1 = x^2 + (m + 1)x + m => x^2 + (m - 1)x + m + 1 = 0$.]
    #step[Điều kiện 2 điểm phân biệt: $Delta = (m - 1)^2 - 4(m + 1) = m^2 - 6m - 3 > 0$.]
    #step[Ta có $A B^2 = (x_2 - x_1)^2 + (y_2 - y_1)^2 = 2(x_2 - x_1)^2 \le 16 => (x_1 + x_2)^2 - 4x_1 x_2 \le 8$.]
    #step[$=> (m - 1)^2 - 4(m + 1) \le 8 => m^2 - 6m - 11 \le 0 => 3 - sqrt{20} \le m \le 3 + sqrt{20}$.]
    #step[Kết hợp $Delta > 0$, ta lấy được giá trị nguyên dương $m = 7$. Vậy có $1$ giá trị.]
  ]
)


// ─── CÂU 5 ───
#my-tln(de: "Đề 2", 
  dir: "doc",
  [Cho hàm số $y = (x + 2)/(x + 1)$ $(C)$ và đường thẳng $(d): y = x + m$. Có bao nhiêu giá trị nguyên $m$ thuộc khoảng $(-10; 10)$ để đường thẳng $(d)$ cắt đồ thị $(C)$ tại hai điểm về hai phía của trục hoành?],
  [$11$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x + 2)/(x + 1) = x + m => x + 2 = x^2 + (m + 1)x + m => x^2 + m x + m - 2 = 0$.]
    #step[Phương trình luôn có $Delta = m^2 - 4(m - 2) = m^2 - 4m + 8 > 0$ nên luôn cắt tại 2 điểm phân biệt.]
    #step[Tung độ $y_1 = x_1 + m, y_2 = x_2 + m$. Hai điểm nằm về 2 phía trục hoành $=> y_1 y_2 < 0 => (x_1 + m)(x_2 + m) < 0$.]
    #step[$=> x_1 x_2 + m(x_1 + x_2) + m^2 < 0 => (m - 2) + m(-m) + m^2 < 0 => m < 2$.]
    #step[Các giá trị nguyên $m \in (-10; 10)$ là $\{-9, -8, ..., 1\}$. Có tất cả 11 giá trị.]
  ]
)


// ─── CÂU 6 ───
#my-tln(de: "Đề 2", 
  dir: "doc",
  [Cho hàm số $y = (x^2 + m x - 1)/(x - 1)$ có đồ thị là $(C)$ ($m$ là tham số thực). Tổng bình phương các giá trị của $m$ để đường thẳng $d: y = m$ cắt đồ thị $(C)$ tại hai điểm $A, B$ sao cho $O A$ vuông góc với $O B$ bằng bao nhiêu?],
  [$3$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x^2 + m x - 1)/(x - 1) = m => x^2 + m x - 1 = m x - m => x^2 = 1 - m$.]
    #step[Để cắt tại 2 điểm phân biệt, phương trình phải có 2 nghiệm $x != 1 => 1 - m > 0$ và $1 - m != 1 => m < 1, m != 0$.]
    #step[Tọa độ $A(sqrt(1 - m); m)$ và $B(-sqrt(1 - m); m)$. Tam giác $O A B$ vuông tại $O => arrow(O A) dot arrow(O B) = 0$.]
    #step[$=> x_A x_B + y_A y_B = 0 => -(1 - m) + m^2 = 0 => m^2 + m - 1 = 0$.]
    #step[Cả hai nghiệm của phương trình đều thỏa điều kiện. Tổng bình phương $m_1^2 + m_2^2 = (m_1 + m_2)^2 - 2m_1 m_2 = (-1)^2 - 2(-1) = 3$.]
  ]
)





// ==================== Đề 3 ====================
#my-tn(de: "Đề 3", 
  dir: "doc",lines: 0,
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-10$, $-4$, $2$, $+oo$),
        d-signs: ("-", "0", "+", "||", "+", "0", "-"),
        v-vals: ($+oo$, $24$, ($+oo$, $-oo$), $0$, $-oo$),
        w2:10,
        w1:1.25
        // ranks: (1, 0, (1, -3), -2, -3)
      )
    ]
  ],
  (
    [$y = (x^2 - 3x + 4)/(-x - 4)$],
    True([$y = (x^2 - 4x + 4)/(-x - 4)$]),
    [$y = (x^2 - 5x + 4)/(x + 4)$],
    [$y = (x^2 - 4x + 4)/(x + 4)$]
  ),
    loigiai: [
    #step[Dựa vào bảng biến thiên, đồ thị có tiệm cận đứng $x = -4$.]
    #step[Tại $x = 2$, $y = 0$ và tại $x = -10$, $y = 24$.]
    #step[Thử với hàm số $y = (x^2 - 4x + 4)/(-x - 4)$, ta thấy thỏa mãn tiệm cận đứng và tọa độ cực đại cực tiểu.]
  ]
)


// ─── CÂU 2 ───
#my-tn(de: "Đề 3", 
  dir: "doc",lines: 0,
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $1$, $3$, $5$, $+oo$),
        d-signs: ("-", "0", "+", "||", "+", "0", "-"),
        v-vals: ($+oo$, $-1$, ($+oo$, $-oo$), $-9$, $-oo$),
        // ranks: (1, 0, (1, -3), -2, -3)
        w2:10,
        w1:1.25
      )
    ]
  ],
  (
    [$y = (x^2 - 4x + 3)/(x - 3)$],
    [$y = (-x^2 - x + 2)/(x - 3)$],
    True([$y = (-x^2 + x + 2)/(x - 3)$]),
    [$y = (x^2 - 4x + 4)/(-x + 3)$]
  ),
    loigiai: [
    #step[Dựa vào bảng biến thiên, đồ thị có tiệm cận đứng $x = 3$.]
    #step[Tại $x = 1$, $y = -1$ và tại $x = 5$, $y = -9$.]
    #step[Thử với hàm số $y = (-x^2 + x + 2)/(x - 3)$, ta thấy thỏa mãn các điều kiện trên.]
  ]
)


// ─── CÂU 3 ───
#my-tn(de: "Đề 3", 
  dir: "doc",lines:0,
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-9$, $-4$, $1$, $+oo$),
        d-signs: ("+", "0", "-", "||", "-", "0", "+"),
        v-vals: ($-oo$, $-20$, ($-oo$, $+oo$), $0$, $+oo$),
        // ranks: (-3, -2, (-3, 1), 0, 1)
        w2:10,
        w1:1.25
      )
    ]
  ],
  (
    True([$y = (x^2 - 2x + 1)/(x + 4)$]),
    [$y = (x^2 - 4x + 2)/(x + 4)$],
    [$y = (x^2 - x + 2)/(-x - 4)$],
    [$y = (x^2 - 3x + 4)/(-x - 4)$]
  ),
    loigiai: [
    #step[Dựa vào bảng biến thiên, đồ thị có tiệm cận đứng $x = -4$.]
    #step[Đồ thị có điểm cực tiểu tại $x = 1, y = 0$ và cực đại tại $x = -9, y = -20$.]
    #step[Hàm số $y = (x^2 - 2x + 1)/(x + 4)$ thỏa mãn các tính chất trên.]
  ]
)


// ─── CÂU 4 ───
#my-tn(de: "Đề 3", 
  dir: "doc",lines:0,
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $2$, $+oo$),
        d-signs: ("+", "||", "+"),
        v-vals: ($-oo$, ($+oo$, $-oo$), $+oo$),
        // ranks: (-2, (2, -2), 2)
        w2:10,
        w1:1.25
      )
    ]
  ],
  (
    [$y = (x^2 - 3)/(x - 2)$],
    True([$y = (x^2 - 4x + 2)/(x - 2)$]),
    [$y = (x^2 - x)/(x - 2)$],
    [$y = (x^2 - 4x + 5)/(x - 2)$]
  ),
    loigiai: [
    #step[Bảng biến thiên cho thấy hàm số luôn đồng biến trên các khoảng xác định và có tiệm cận đứng $x = 2$.]
    #step[Hàm số $y = (x^2 - 4x + 2)/(x - 2)$ có $y' = (x^2 - 4x + 6)/(x - 2)^2 > 0, forall x != 2$, thỏa mãn điều kiện.]
  ]
)


// ─── CÂU 5 ───
#my-tn(de: "Đề 3", 
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-4.0, 0), (6.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((6.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.5), (0, 5.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.5), $y$, anchor: "west", padding: 2pt)
    content((-0.25, -0.25), $O$)
    
    // Tiệm cận đứng x = 2
    line((2, -4.5), (2, 5.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((2.2, 5.0), $x = 2$, anchor: "west")
    content((2.25, -0.35), $2$)
    
    // Tiệm cận xiên y = x - 2
    line((-2.0, -4.0), (6.0, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.35, -2.25), $-2$)
    
    // Điểm cực trị và nét đứt
    // Cực tiểu (3, 2)
    line((3, 0), (3, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 2), (3, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((3, -0.35), $3$)
    content((-0.3, 2), $2$)
    circle((3, 2), radius: 1.5pt, fill: black)
    
    // Cực đại (1, -2)
    line((1, 0), (1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -2), (1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, 0.35), $1$)
    circle((1, -2), radius: 1.5pt, fill: black)
    
    // Một số giá trị trên trục
    content((-0.35, 5), $5$)
    content((-0.35, 4), $4$)
    content((-0.35, 3), $3$)
    content((-0.35, 1), $1$)
    content((-0.3, -1), $-1$)
    content((-0.3, -2), $-2$)
    content((-0.3, -3), $-3$)
    content((-2.1, 0.3), $-2$)
    content((-3.1, 0.3), $-3$)
    content((4, -0.35), $4$)
    
    // Vẽ đồ thị
    let pts_left = ()
    for i in range(-35, 19) {
      let x = i / 10
      let y = (x * x - 4 * x + 5) / (x - 2)
      if y >= -4.5 and y <= 5.5 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(22, 55) {
      let x = i / 10
      let y = (x * x - 4 * x + 5) / (x - 2)
      if y >= -4.5 and y <= 5.5 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị dưới đây là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?],
  (
    [$y = (x^2 - 3)/(x - 2)$],
    [$y = (x^2 - 4x + 2)/(x - 2)$],
    [$y = (x^2 - x)/(x - 2)$],
    True([$y = (x^2 - 4x + 5)/(x - 2)$])
  ),
    loigiai: [
    #step[Từ đồ thị, hàm số có tiệm cận đứng là $x = 2$.]
    #step[Nhánh đồ thị cho thấy hàm số có đường tiệm cận xiên đi lên.]
    #step[Kiểm tra các hàm số, chỉ có $y = (x^2 - 4x + 5)/(x - 2)$ phù hợp với hình dáng đồ thị.]
  ]
)


// ─── CÂU 6 ───
#my-tn(de: "Đề 3", 
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-5.0, 0), (3.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 5.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.0), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.25), $O$)
    
    // Tiệm cận đứng x = -1
    line((-1, -3.0), (-1, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-1.25, 4.5), $x = -1$, anchor: "east")
    content((-1.25, -0.35), $-1$)
    
    // Điểm cực đại (-2, 4) và nét đứt
    line((-2, 0), (-2, 4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 4), (-2, 4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-2, 0.35), $-2$)
    content((0.25, 4), $4$)
    circle((-2, 4), radius: 1.5pt, fill: black)
    
    // Một số giá trị trên trục
    content((0.25, 2), $2$)
    content((0.25, -2), $-2$)
    content((2, -0.35), $2$)
    
    // Vẽ đồ thị y = -x^2/(x+1)
    let pts_left = ()
    for i in range(-50, -12) {
      let x = i / 10
      let y = (-x * x) / (x + 1)
      if y >= -3.0 and y <= 5.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(-8, 30) {
      let x = i / 10
      let y = (-x * x) / (x + 1)
      if y >= -3.0 and y <= 5.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị dưới đây là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?],
  (
    [$y = (x^2 - x)/(x + 1)$],
    [$y = (x^2 - 3x)/(x + 1)$],
    [$y = (x^2 + x + 2)/(x + 1)$],
    True([$y = (-x^2)/(x + 1)$])
  ),
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = -1$.]
    #step[Giao với hệ trục tại gốc tọa độ $O(0; 0)$.]
    #step[Hàm số $y = -x^2/(x + 1)$ thỏa mãn điều kiện này.]
  ]
)


// ─── CÂU 7 ───
#my-tn(de: "Đề 3", 
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-5.0, 0), (5.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -6.0), (0, 6.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 6.0), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.25), $O$)
    
    // Tiệm cận đứng x = -1
    line((-1, -6.0), (-1, 6.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Điểm giao Oy (0, 2)
    content((-0.3, 2.2), $2$)
    circle((0, 2), radius: 1.5pt, fill: black)
    
    // Giao điểm Ox
    content((1, 0.35), $1$)
    circle((1, 0), radius: 1.5pt, fill: black)
    content((-2, 0.35), $-2$)
    circle((-2, 0), radius: 1.5pt, fill: black)
    
    // Nét đứt cho (3, -2.5)
    line((3, 0), (3, -2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -2.5), (3, -2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((3, 0.35), $3$)
    content((-0.45, -2.5), $-5/2$)
    circle((3, -2.5), radius: 1.5pt, fill: black)
    
    // Vẽ đồ thị y = (-x^2 - x + 2)/(x+1)
    let pts_left = ()
    for i in range(-50, -12) {
      let x = i / 10
      let y = (-x * x - x + 2) / (x + 1)
      if y >= -6.0 and y <= 6.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(-8, 50) {
      let x = i / 10
      let y = (-x * x - x + 2) / (x + 1)
      if y >= -6.0 and y <= 6.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị dưới đây là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?],
  (
    [$y = (x^2 - x + 4)/(x + 1)$],
    [$y = (x^2 - 2x + 3)/(x + 1)$],
    True([$y = (-x^2 - x + 2)/(x + 1)$]),
    [$y = (x^2 + x - 1)/(x + 1)$]
  ),
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = -1$.]
    #step[Giao với trục tung tại điểm có tung độ bằng $2$.]
    #step[Hàm số $y = (-x^2 - x + 2)/(x + 1)$ cho giá trị $y(0) = 2$ và tiệm cận đứng $x = -1$, thỏa mãn.]
  ]
)


// ─── CÂU 8 ───
#my-tn(de: "Đề 3", 
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-5.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -6.0), (0, 5.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.0), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.25), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -6.0), (1, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.2, 4.5), $x = 1$, anchor: "west")
    content((1.2, -0.35), $1$)
    
    // Tiệm cận xiên y = x + 2
    line((-5.0, -3.0), (3.0, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((2.5, 4.8), $y = x + 2$, anchor: "south-east")
    
    // Giao điểm tiệm cận xiên với các trục
    content((-2.2, -0.35), $-2$)
    content((-0.25, 2.2), $2$)
    
    // Vẽ đồ thị y = (x^2 + x - 3)/(x - 1)
    let pts_left = ()
    for i in range(-50, 8) {
      let x = i / 10
      let y = (x * x + x - 3) / (x - 1)
      if y >= -6.0 and y <= 5.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (x * x + x - 3) / (x - 1)
      if y >= -6.0 and y <= 5.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị dưới đây là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?],
  (
    [$y = (x^2 + 3)/(x - 1)$],
    True([$y = (x^2 + x - 3)/(x - 1)$]),
    [$y = (x^2 - 2x + 3)/(-x + 1)$],
    [$y = (x^2 + 3)/(-x + 1)$]
  ),
    loigiai: [
    #step[Đồ thị hàm số có tiệm cận đứng $x = 1$.]
    #step[Kiểm tra tọa độ một số điểm và đường tiệm cận xiên.]
    #step[Hàm số $y = (x^2 + x - 3)/(x - 1)$ phù hợp với hình dạng đồ thị.]
  ]
)


// ─── CÂU 9 ───
#my-tn(de: "Đề 3", 
  dir: "doc",
  [Hàm số nào dưới đây có bảng biến thiên với hai điểm cực trị?],
  (
    [$y = x^4 - 4x^2 + 1$],
    True([$y = (x^2 - 2x + 2)/(x - 1)$]),
    [$y = x^3 - 3x + 1$],
    [$y = 2x^4 + 2x^2 - 3$]
  ),
    loigiai: [
    #step[Kiểm tra các đường tiệm cận và điểm cực trị trên đồ thị.]
    #step[Hàm số thỏa mãn tất cả các tính chất của đồ thị là hàm đúng.]
  ]
)


// ─── CÂU 10 ───
#my-tn(de: "Đề 3", 
  dir: "doc",
  [Cho hàm số $y = (x^2 + m x + 1)/(x - 1)$ ($m$ là tham số thực). Để đồ thị hàm số có hai điểm cực trị, điều kiện của $m$ là:],
  (
    [$m > -4$],
    [$m < 4$],
    True([$m < -2$ hoặc $m > 2$]),
    [$m != plus.minus 2$]
  ),
    loigiai: [
    #step[Dựa vào tiệm cận đứng và tiệm cận xiên.]
    #step[Kiểm tra giao điểm với trục tung để xác định chính xác hàm số.]
  ]
)



// ─── CÂU 1 ───
#my-ds(de: "Đề 3", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = (x^2 + 4x + 5)/(x + 2)$ có đồ thị $(C)$. Khi đó:],
  (
    [Hàm số có tập xác định $D = RR$],
    True([Đồ thị hàm số $(C)$ có tiệm cận xiên là đường thẳng $y = x + 2$]),
    True([Đồ thị hàm số $(C)$ có tiệm cận đứng là đường thẳng $x = -2$]),
    True([Đồ thị hàm số $(C)$ nhận điểm $I(-2; 0)$ làm tâm đối xứng])
  ),
    loigiai: [
    #step[a) Tập xác định $D = RR \ \{-2\}$. (Sai)]
    #step[b) Tiệm cận xiên của đồ thị là $y = x + 2$. (Đúng)]
    #step[c) Tiệm cận đứng là $x = -2$. (Đúng)]
    #step[d) Giao điểm của hai tiệm cận là $I(-2; 0)$, đây là tâm đối xứng của đồ thị. (Đúng)]
  ]
)


// ─── CÂU 2 ───
#my-ds(de: "Đề 3", 
  dir: "doc",lines:2,
  [Cho hàm số $y = (2x^2 - 2x + 2)/(-x + 1)$ có đồ thị $(C)$.],
  (
    [Hàm số nghịch biến trên khoảng $(-oo, 0) union (2, +oo)$],
    [Hàm số đạt cực tiểu tại $x = 2$],
    [Giá trị nhỏ nhất của hàm số trên đoạn $[3/2; 5/2]$ bằng $-19/3$],
    True([Đồ thị hàm số $(C)$ có tiệm cận xiên là đường thẳng $2x + y = 0$])
  ),
    loigiai: [
    #step[a) Hàm số không nghịch biến trên khoảng hợp. Phải dùng dấu "," hoặc "và" giữa các khoảng. (Sai)]
    #step[b) Cần xem dấu của $y'$ tại lân cận $x = 2$. (Sai)]
    #step[c) Đánh giá giá trị nhỏ nhất trên đoạn đã cho. (Sai)]
    #step[d) Tiệm cận xiên của hàm số là $y = -2x => 2x + y = 0$. (Đúng)]
  ]
)


// ─── CÂU 3 ───
#my-ds(de: "Đề 3", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = (-x^2 + x + 1)/(x + 1)$ có đồ thị $(C)$.],
  (
    True([Hàm số đồng biến trên mỗi khoảng $(-2, -1)$ và $(-1, 0)$]),
    True([Hàm số có hai điểm cực trị]),
    [Đồ thị $(C)$ không cắt trục $O x$],
    [Đồ thị $(C)$ có tiệm cận xiên đi qua điểm $A(1; 2)$]
  ),
    loigiai: [
    #step[a) Đạo hàm dương trên các khoảng $(-2; -1)$ và $(-1; 0)$. (Đúng)]
    #step[b) Hàm phân thức bậc 2 trên bậc 1 thường có 2 cực trị. (Đúng)]
    #step[c) Xét phương trình $y = 0$ để xem có cắt $O x$ không. (Sai)]
    #step[d) Kiểm tra xem tiệm cận xiên có đi qua điểm $A(1; 2)$ không. (Sai)]
  ]
)


// ─── CÂU 4 ───
#my-ds(de: "Đề 3", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = (-x^2 - 3x + 4)/(x - 3)$ có đồ thị là $(C)$.],
  (
    True([Đồ thị $(C)$ có tiệm cận xiên là $y = -x - 6$]),
    True([Đồ thị $(C)$ nhận giao điểm $I(3; -9)$ làm tâm đối xứng]),
    True([Đồ thị $(C)$ có hai điểm cực trị nằm $2$ phía đối với $O y$]),
    [Đồ thị không cắt trục $O x$]
  ),
    loigiai: [
    #step[a) Tiệm cận xiên của đồ thị là đường thẳng $y = -x - 6$. (Đúng)]
    #step[b) Giao điểm của tiệm cận đứng và tiệm cận xiên là $I(3; -9)$. (Đúng)]
    #step[c) Đồ thị hàm phân thức luôn có hai điểm cực trị nằm về 2 phía so với giao điểm hai tiệm cận. (Đúng)]
    #step[d) Giải phương trình $y = 0$, phương trình có nghiệm nên đồ thị có cắt $O x$. (Sai)]
  ]
)



// ─── CÂU 1 ───
#my-tln(de: "Đề 3", 
  dir: "doc",
  [Trên đồ thị $(C): y = (x^2 - 3x + 6)/(x - 2)$ có bao nhiêu cặp điểm đối xứng nhau qua điểm $I(1/2; 1)$?],
  [$1$],
    loigiai: [
    #step[Sử dụng phép đối xứng tâm, lấy điểm $M(x; y)$ thuộc $(C)$. Điểm đối xứng của nó qua $I(1/2; 1)$ là $M'(1 - x; 2 - y)$.]
    #step[Để $M'$ cũng thuộc $(C)$ thì $2 - y = ((1 - x)^2 - 3(1 - x) + 6)/(1 - x - 2)$.]
    #step[Giải hệ để tìm số cặp điểm phân biệt. Có duy nhất 1 cặp thỏa mãn.]
  ]
)


// ─── CÂU 2 ───
#my-tln(de: "Đề 3", 
  dir: "doc",
  [Tìm được trên đồ thị $(C): y = (x^2 + 4x + 5)/(x + 2)$ hai điểm $M(a; b)$ và $N(c; d)$ có khoảng cách đến đường thẳng $3x + y + 6 = 0$ nhỏ nhất. Khi đó tính giá trị biểu thức $T = a + b + c + d$.],
  [$-4$],
    loigiai: [
    #step[Điểm có khoảng cách nhỏ nhất đến đường thẳng là tiếp điểm của tiếp tuyến song song với đường thẳng đó.]
    #step[Tiếp tuyến song song với $3x + y + 6 = 0$ có hệ số góc $k = -3$.]
    #step[Giải phương trình $y' = -3$ tìm được tọa độ của $M$ và $N$. Tính $T = a + b + c + d = -4$.]
  ]
)


// ─── CÂU 3 ───
#my-tln(de: "Đề 3", 
  dir: "doc",
  [Biết rằng đường thẳng $y = 2x + 2m$ luôn cắt đồ thị hàm số $y = (x^2 + 3)/(x + 1)$ tại hai điểm phân biệt $A, B$ với mọi giá trị của tham số $m$. Tìm hoành độ trung điểm của $A B$.],
  [$-m - 1$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x^2 + 3)/(x + 1) = 2x + 2m => x^2 + 3 = 2(x + 1)(x + m)$.]
    #step[Rút gọn phương trình về dạng bậc hai: $x^2 + (2m + 2)x + 2m - 3 = 0$.]
    #step[Trung điểm $I$ của $A B$ có hoành độ $x_I = (x_1 + x_2)/2 = -(2m + 2)/2 = -m - 1$.]
  ]
)


// ─── CÂU 4 ───
#my-tln(de: "Đề 3", 
  dir: "doc",lines:4,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (5.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.0), (0, 7.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 7.0), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -2.0), (1, 7.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.2, 6.5), $x = 1$, anchor: "west")
    
    // Tiệm cận xiên y = x + 1
    line((-3.0, -2.0), (5.0, 6.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Các điểm đặc biệt
    content((0.2, 1.2), $1$)
    content((-0.2, 2.0), $2$)
    
    // Vẽ đồ thị y = x + 1 + 1/(x-1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = x + 1 + 1 / (x - 1)
      if y >= -2.0 and y <= 7.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 50) {
      let x = i / 10
      let y = x + 1 + 1 / (x - 1)
      if y >= -2.0 and y <= 7.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị trong hình bên dưới là của hàm số $y = a x + b + 1/(x + c)$. Khi đó tổng $a + b + c$ bằng bao nhiêu?],
  [$1$],
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = -c$. Dựa vào đồ thị xác định $c$.]
    #step[Tiệm cận xiên là $y = a x + b$. Xác định $a, b$ từ hình dáng đường xiên.]
    #step[Cộng các hệ số $a + b + c = 1$.]
  ]
)


// ─── CÂU 5 ───
#my-tln(de: "Đề 3", 
  dir: "doc",
  [Cho hàm số $y = (x^2 + m x + m^2 - 2m - 4)/(x - 2)$ (1). Tìm $m$ để đồ thị hàm số đã cho có hai điểm cực trị và hai điểm cực trị cách đều đường thẳng $Delta: 2x + y + 1 = 0$.],
  [$-9$],
    loigiai: [
    #step[Đồ thị hàm phân thức có hai cực trị đối xứng nhau qua tâm đối xứng $I$ (giao điểm 2 tiệm cận).]
    #step[Để hai điểm cực trị cách đều đường thẳng $Delta$, tâm đối xứng $I$ phải nằm trên $Delta$ hoặc đường thẳng nối 2 cực trị song song với $Delta$.]
    #step[Tính toán tọa độ $I$ và thế vào phương trình đường thẳng, tìm được $m = -9$.]
  ]
)


// ─── CÂU 6 ───
#my-tln(de: "Đề 3", 
  dir: "doc",
  [Tìm $m$ để đường thẳng $y = -2x + m$ cắt đồ thị hàm số $y = (x^2 + x - 1)/x$ tại hai điểm $A, B$ sao cho trung điểm đoạn $A B$ thuộc $O y$.],
  [$1$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x^2 + x - 1)/x = -2x + m => x^2 + x - 1 = -2x^2 + m x$.]
    #step[Phương trình bậc hai: $3x^2 + (1 - m)x - 1 = 0$.]
    #step[Trung điểm của $A B$ thuộc trục $O y => x_I = (x_1 + x_2)/2 = 0 => (m - 1)/6 = 0 => m = 1$.]
  ]
)





// ==================== Đề Thực Tế ====================
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Chi phí trung bình để sản xuất $x$ chiếc xe đạp điện mỗi ngày là $C_("tb")(x) = 2x + 80 + 5000/x$ (triệu đồng), với $x >= 1$. Số lượng xe đạp điện cần sản xuất mỗi ngày để chi phí trung bình nhỏ nhất là:],
  (
    True([$50$]),
    [$40$],
    [$30$],
    [$60$]
  ),
  loigiai: [

    #step[Tập xác định: $D = [1; +oo)$.]
    #step[Đạo hàm của hàm số chi phí trung bình:]
    #step[$ C'_("tb")(x) = 2 - 5000/x^2 = (2(x^2 - 2500))/x^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ C'_("tb")(x) = 0 <=> x^2 = 2500 <=> x = 50 " (do " x >= 1 ")" $]
    #step[Khảo sát sự biến thiên của hàm số $C_("tb")(x)$ trên $[1; +oo)$:]
    #step[- Với $x in [1; 50)$, ta có $C'_("tb")(x) < 0$ nên hàm số nghịch biến trên khoảng $(1; 50)$.]
    #step[- Với $x in (50; +oo)$, ta có $C'_("tb")(x) > 0$ nên hàm số đồng biến trên khoảng $(50; +oo)$.]
    #step[Suy ra hàm số đạt giá trị nhỏ nhất tại $x = 50$.]
    #step[Vậy cần sản xuất $50$ chiếc xe đạp điện mỗi ngày để chi phí trung bình nhỏ nhất.]
  ]
)

// ─── CÂU 2 ───
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Nồng độ thuốc $C(t)$ (mg/L) trong máu của một bệnh nhân sau $t$ giờ kể từ lúc tiêm thuốc được mô tả bởi công thức $C(t) = (4t)/(t^2 + 4)$ với $t >= 0$. Nồng độ thuốc trong máu đạt giá trị lớn nhất sau bao nhiêu giờ?],
  (
    [$1$ giờ],
    True([$2$ giờ]),
    [$3$ giờ],
    [$4$ giờ]
  ),
  loigiai: [

    #step[Tập xác định: $D = [0; +oo)$.]
    #step[Đạo hàm của hàm số nồng độ thuốc:]
    #step[$ C'(t) = (4(t^2 + 4) - 4t dot 2t)/((t^2 + 4)^2) = (16 - 4t^2)/((t^2 + 4)^2) $]
    #step[Giải phương trình đạo hàm:]
    #step[$ C'(t) = 0 <=> 16 - 4t^2 = 0 <=> t^2 = 4 <=> t = 2 " (do " t >= 0 ")" $]
    #step[Khảo sát sự biến thiên của hàm số $C(t)$ trên $[0; +oo)$:]
    #step[- Với $t in [0; 2)$, ta có $C'(t) > 0$ nên hàm số đồng biến trên khoảng $(0; 2)$.]
    #step[- Với $t in (2; +oo)$, ta có $C'(t) < 0$ nên hàm số nghịch biến trên khoảng $(2; +oo)$.]
    #step[Suy ra hàm số đạt giá trị lớn nhất tại $t = 2$.]
    #step[Vậy nồng độ thuốc trong máu đạt giá trị lớn nhất sau $2$ giờ kể từ lúc tiêm.]
  ]
)

// ─── CÂU 3 ───
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Doanh thu từ việc bán vé của một rạp chiếu phim phụ thuộc vào giá vé $x$ (nghìn đồng) theo công thức $R(x) = -2x^2 + 120x$ (triệu đồng) với $10 <= x <= 50$. Doanh thu của rạp đạt cực đại khi giá vé bán ra bằng:],
  (
    [$20$ nghìn đồng],
    True([$30$ nghìn đồng]),
    [$40$ nghìn đồng],
    [$25$ nghìn đồng]
  ),
  loigiai: [

    #step[Xét hàm số doanh thu $R(x) = -2x^2 + 120x$ trên đoạn $[10; 50]$.]
    #step[Đạo hàm của hàm số:]
    #step[$ R'(x) = -4x + 120 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ R'(x) = 0 <=> -4x + 120 = 0 <=> x = 30 " (thỏa mãn " 30 in [10; 50] ")" $]
    #step[Khảo sát sự biến thiên của hàm số trên đoạn $[10; 50]$:]
    #step[- Với $x in [10; 30)$, ta có $R'(x) > 0$ nên hàm số đồng biến trên khoảng $(10; 30)$.]
    #step[- Với $x in (30; 50]$, ta có $R'(x) < 0$ nên hàm số nghịch biến trên khoảng $(30; 50)$.]
    #step[Suy ra hàm số đạt giá trị lớn nhất tại $x = 30$ trên đoạn $[10; 50]$.]
    #step[Vậy doanh thu của rạp đạt cực đại khi giá vé bán ra bằng $30$ nghìn đồng.]
  ]
)

// ─── CÂU 4 ───
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một chiếc hộp không nắp được chế tạo từ một tấm bìa các-tông hình vuông cạnh $60$ cm bằng cách cắt đi bốn hình vuông nhỏ bằng nhau có cạnh $x$ (cm) ở bốn góc rồi gập nếp lại. Chiều cao $x$ của chiếc hộp để thể tích hộp lớn nhất là:],
  (
    [$15$ cm],
    True([$10$ cm]),
    [$12$ cm],
    [$8$ cm]
  ),
  loigiai: [

    #step[Thiết lập hàm thể tích:]
    #step[Khi cắt bốn hình vuông nhỏ ở bốn góc cạnh $x$, chiếc hộp có chiều cao là $x$ (cm) và cạnh đáy là $60 - 2x$ (cm).]
    #step[Điều kiện: $0 < x < 30$.]
    #step[Thể tích của chiếc hộp là:]
    #step[$ V(x) = x(60 - 2x)^2 = 4x^3 - 240x^2 + 3600x " (cm³)" $]
    #step[Khảo sát hàm số $V(x)$ trên khoảng $(0; 30)$:]
    #step[Đạo hàm:]
    #step[$ V'(x) = 12x^2 - 480x + 3600 = 12(x^2 - 40x + 300) $]
    #step[Giải phương trình đạo hàm:]
    #step[$ V'(x) = 0 <=> x^2 - 40x + 300 = 0 <=> hoac(x = 10, x = 30) $]
    #step[Vì $0 < x < 30$ nên ta nhận giá trị $x = 10$.]
    #step[Khảo sát sự biến thiên của hàm số $V(x)$ trên khoảng $(0; 30)$:]
    #step[- Với $x in (0; 10)$, ta có $V'(x) > 0$ nên hàm số đồng biến.]
    #step[- Với $x in (10; 30)$, ta có $V'(x) < 0$ nên hàm số nghịch biến.]
    #step[Suy ra hàm số đạt giá trị lớn nhất tại $x = 10$.]
    #step[Vậy thể tích hộp lớn nhất khi chiều cao $x = 10$ cm.]
  ]
)

// ─── CÂU 5 ───
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một cơ sở sản xuất cần làm một bể chứa nước hình hộp chữ nhật không nắp, có đáy là hình vuông, thể tích bể chứa là $250$ m³. Chi phí xây dựng mặt đáy là $200$ nghìn đồng/m², chi phí xây dựng bốn mặt xung quanh là $50$ nghìn đồng/m². Để chi phí thuê xây dựng bể là nhỏ nhất thì độ dài cạnh đáy hình vuông của bể nước phải bằng:],
  (
    [$4$ m],
    True([$5$ m]),
    [$6$ m],
    [$8$ m]
  ),
  loigiai: [

    #step[Thiết lập hàm chi phí:]
    #step[Gọi $x$ (m, $x > 0$) là độ dài cạnh đáy hình vuông của bể, chiều cao bể là $h$ (m, $h > 0$).]
    #step[Thể tích bể: $V = x^2 h = 250 => h = 250/x^2$.]
    #step[Diện tích mặt đáy của bể là $S_("đáy") = x^2$ (m²).]
    #step[Diện tích bốn mặt xung quanh là $S_("xq") = 4x h = 4x dot 250/x^2 = 1000/x$ (m²).]
    #step[Tổng chi phí xây dựng bể là:]
    #step[$ C(x) = 200 x^2 + 50 dot 1000/x = 200x^2 + 50000/x " (nghìn đồng)" $]
    #step[Khảo sát hàm số $C(x)$ trên khoảng $(0; +oo)$:]
    #step[Đạo hàm:]
    #step[$ C'(x) = 400x - 50000/x^2 = (400x^3 - 50000)/x^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ C'(x) = 0 <=> 400x^3 - 50000 = 0 <=> x^3 = 125 <=> x = 5 " (m)" $]
    #step[Khảo sát sự biến thiên của hàm số $C(x)$ trên khoảng $(0; +oo)$:]
    #step[- Với $x in (0; 5)$, ta có $C'(x) < 0$ nên hàm số nghịch biến.]
    #step[- Với $x in (5; +oo)$, ta có $C'(x) > 0$ nên hàm số đồng biến.]
    #step[Suy ra hàm số đạt giá trị nhỏ nhất tại $x = 5$.]
    #step[Vậy độ dài cạnh đáy của bể nước phải bằng $5$ m để chi phí nhỏ nhất.]
  ]
)

// ─── CÂU 6 ───
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Số lượng vi khuẩn của một mẻ nuôi cấy sau $t$ giờ được mô tả bởi hàm số $N(t) = (100t)/(t + 2)$ (triệu con), với $t >= 0$. Khảo sát sự biến thiên của hàm số $N(t)$ cho thấy khi thời gian nuôi cấy tăng lên rất lớn thì số lượng vi khuẩn sẽ tiến dần đến mức giới hạn là:],
  (
    True([$100$ triệu con]),
    [$50$ triệu con],
    [$200$ triệu con],
    [$120$ triệu con]
  ),
  loigiai: [

    #step[Xét giới hạn của hàm số $N(t) = (100t)/(t + 2)$ khi thời gian $t$ tiến ra vô cùng ($t -> +oo$):]
    #step[$ lim_limits(t -> +oo) N(t) = lim_limits(t -> +oo) (100t)/(t + 2) = lim_limits(t -> +oo) 100 / (1 + 2/t) = 100 $]
    #step[Đồ thị hàm số $N(t)$ nhận đường thẳng $y = 100$ làm tiệm cận ngang.]
    #step[Như vậy, khi thời gian nuôi cấy tăng lên rất lớn, số lượng vi khuẩn sẽ tiến dần đến mức giới hạn là $100$ triệu con.]
  ]
)

// ─── CÂU 7 ───
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Mức tiêu thụ nhiên liệu của một chiếc ô tô chạy với vận tốc không đổi $v$ (km/h) được mô tả bởi hàm số $F(v) = 2v + 1800/v$ (lít/100km) trên quãng đường dài. Vận tốc tối ưu để xe tiêu thụ ít nhiên liệu nhất trên mỗi 100 km hành trình là:],
  (
    [$20$ km/h],
    True([$30$ km/h]),
    [$40$ km/h],
    [$50$ km/h]
  ),
  loigiai: [

    #step[Xét hàm số tiêu thụ nhiên liệu $F(v) = 2v + 1800/v$ với $v > 0$.]
    #step[Đạo hàm của hàm số:]
    #step[$ F'(v) = 2 - 1800/v^2 = (2(v^2 - 900))/v^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ F'(v) = 0 <=> v^2 - 900 = 0 <=> v = 30 " (do " v > 0 ")" $]
    #step[Khảo sát sự biến thiên của hàm số $F(v)$ trên khoảng $(0; +oo)$:]
    #step[- Với $v in (0; 30)$, ta có $F'(v) < 0$ nên hàm số nghịch biến trên khoảng $(0; 30)$.]
    #step[- Với $v in (30; +oo)$, ta có $F'(v) > 0$ nên hàm số đồng biến trên khoảng $(30; +oo)$.]
    #step[Suy ra hàm số đạt giá trị nhỏ nhất tại $v = 30$.]
    #step[Vậy vận tốc tối ưu để xe tiêu thụ ít nhiên liệu nhất là $30$ km/h.]
  ]
)

// ─── CÂU 8 ───
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Nhiệt độ của một tách cà phê nóng sau $t$ phút đặt trong phòng được mô tả bởi công thức giảm nhiệt $T(t) = 25 + 70 e^(-0.2t)$ (°C). Sau thời gian rất dài, nhiệt độ của tách cà phê tiến dần về nhiệt độ phòng là:],
  (
    True([$25$ °C]),
    [$30$ °C],
    [$20$ °C],
    [$35$ °C]
  ),
  loigiai: [

    #step[Ta tìm giới hạn của nhiệt độ tách cà phê $T(t)$ khi thời gian $t$ tiến ra vô cùng ($t -> +oo$):]
    #step[$ lim_limits(t -> +oo) T(t) = lim_limits(t -> +oo) (25 + 70 e^(-0.2t)) $]
    #step[Vì $lim_limits(t -> +oo) e^(-0.2t) = 0$, ta thu được:]
    #step[$ lim_limits(t -> +oo) T(t) = 25 + 70 dot 0 = 25 $]
    #step[Vậy sau thời gian rất dài, tách cà phê sẽ nguội dần và tiến về nhiệt độ phòng là $25$ °C.]
  ]
)

// ─── CÂU 9 ───
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một công ty muốn sản xuất các lon sữa hình trụ có thể tích $V = 128 pi$ cm³. Để tiết kiệm nguyên liệu nhất, diện tích toàn phần của lon sữa phải nhỏ nhất. Khi đó bán kính đáy $r$ của lon sữa bằng:],
  (
    [$3$ cm],
    True([$4$ cm]),
    [$5$ cm],
    [$6$ cm]
  ),
  loigiai: [

    #step[Thiết lập hàm diện tích:]
    #step[Gọi bán kính đáy lon sữa là $r$ (cm, $r > 0$) và chiều cao lon sữa là $h$ (cm, $h > 0$).]
    #step[Thể tích lon sữa: $V = pi r^2 h = 128 pi => h = 128/r^2$.]
    #step[Diện tích toàn phần của lon sữa hình trụ có nắp là:]
    #step[$ S_("tp")(r) = 2 pi r^2 + 2 pi r h = 2 pi r^2 + 2 pi r dot 128/r^2 = 2 pi r^2 + 256 pi / r $]
    #step[Khảo sát hàm số $S_("tp")(r)$ trên khoảng $(0; +oo)$:]
    #step[Đạo hàm:]
    #step[$ S'_("tp")(r) = 4 pi r - 256 pi / r^2 = (4 pi (r^3 - 64))/r^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ S'_("tp")(r) = 0 <=> r^3 - 64 = 0 <=> r = 4 " (cm)" $]
    #step[Khảo sát sự biến thiên của hàm số $S_("tp")(r)$ trên khoảng $(0; +oo)$:]
    #step[- Với $r in (0; 4)$, ta có $S'_("tp")(r) < 0$ nên hàm số nghịch biến.]
    #step[- Với $r in (4; +oo)$, ta có $S'_("tp")(r) > 0$ nên hàm số đồng biến.]
    #step[Suy ra hàm số đạt giá trị nhỏ nhất tại $r = 4$.]
    #step[Vậy bán kính đáy để tiết kiệm nguyên liệu nhất là $4$ cm.]
  ]
)

// ─── CÂU 10 ───
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Quãng đường rơi tự do của một vật nặng được tính theo thời gian $t$ (giây) bởi công thức $s(t) = 4.9 t^2$ (mét). Tốc độ tức thời của vật tại thời điểm $t = 3$ giây là:],
  (
    [$14.7$ m/s],
    [$9.8$ m/s],
    True([$29.4$ m/s]),
    [$19.6$ m/s]
  ),
  loigiai: [

    #step[Tốc độ tức thời của vật tại thời điểm $t$ chính là đạo hàm của quãng đường theo thời gian:]
    #step[$ v(t) = s'(t) = (4.9 t^2)' = 9.8 t " (m/s)" $]
    #step[Tại thời điểm $t = 3$ giây, tốc độ tức thời của vật là:]
    #step[$ v(3) = 9.8 dot 3 = 29.4 " (m/s)" $]
  ]
)


// ─── CÂU 1 ───
#my-ds(de: "Đề Thực Tế", 
  dir: "doc",lines: 4,
  [Một mảnh vườn hình chữ nhật được bao quanh bởi một bức tường xây sẵn ở một phía, và ba phía còn lại được rào bằng lưới thép. Chiều dài lưới thép có sẵn là $160$ m. Gọi $x$ (m) là chiều rộng mảnh vườn (phần rào lưới vuông góc với bức tường). Diện tích vườn là $S(x)$ (m²). Khi đó:],
  (
    True([Tập xác định của hàm số diện tích $S(x)$ là khoảng $(0; 80)$]),
    True([Công thức tính diện tích mảnh vườn là $S(x) = 160x - 2x^2$]),
    True([Đồ thị hàm số diện tích $S(x)$ có tọa độ đỉnh parabol là $I(40; 3200)$]),
    True([Diện tích vườn lớn nhất là $3200$ m² khi chiều dài mảnh vườn song song với bức tường bằng $80$ m])
  ),
  loigiai: [

    #step[Gọi $x$ (m) là chiều rộng mảnh vườn vuông góc với bức tường ($x > 0$).]
    #step[Vì tổng chiều dài lưới rào ba phía là $160$ m nên chiều dài song song với bức tường là $160 - 2x$ (m).]
    #step[- *Ý a):* Để kích thước mảnh vườn hợp lệ thì:]
    #step[$ heva(x > 0, 160 - 2x > 0) <=> 0 < x < 80 $]
    #step[Vậy tập xác định của $S(x)$ là khoảng $(0; 80)$. $arrow.r$ *Ý a) Đúng.*]
    #step[- *Ý b):* Diện tích mảnh vườn được tính theo công thức:]
    #step[$ S(x) = x(160 - 2x) = 160x - 2x^2 " (m²)" $]
    #step[$arrow.r$ *Ý b) Đúng.*]
    #step[- *Ý c):* Xét hàm số $S(x) = -2x^2 + 160x$ trên khoảng $(0; 80)$.]
    #step[Đạo hàm: $S'(x) = -4x + 160$.]
    #step[Giải phương trình đạo hàm: $S'(x) = 0 <=> x = 40$ (m).]
    #step[Bảng biến thiên chỉ ra hàm số đạt cực đại tại $x = 40$.]
    #step[Giá trị cực đại là $S(40) = 160 dot 40 - 2 dot 40^2 = 3200$ (m²).]
    #step[Tọa độ đỉnh parabol của đồ thị là $I(40; 3200)$. $arrow.r$ *Ý c) Đúng.*]
    #step[- *Ý d):* Diện tích vườn lớn nhất là $3200$ m² tại chiều rộng $x = 40$ m.]
    #step[Khi đó chiều dài mảnh vườn song song với bức tường là $160 - 2 dot 40 = 80$ m. $arrow.r$ *Ý d) Đúng.*]
  ]
)

// ─── CÂU 2 ───
#my-ds(de: "Đề Thực Tế", 
  dir: "doc",lines: 4,
  [Nồng độ cồn trong máu (BAC) của một người lái xe sau $t$ giờ kể từ lúc uống rượu được tính bởi công thức $A(t) = (0.8t)/(t^2 + 1)$ (g/L) với $t >= 0$. Theo quy định pháp luật, người lái xe chỉ được phép tham gia giao thông khi nồng độ cồn trong máu dưới $0.08$ g/L. Khi đó:],
  (
    True([Đồ thị hàm số $A(t)$ nhận đường thẳng $y = 0$ làm tiệm cận ngang]),
    True([Nồng độ cồn trong máu của người lái xe đạt mức cao nhất sau $1$ giờ uống rượu]),
    [Nồng độ cồn lớn nhất đạt được của người này là $0.8$ g/L],
    True([Sau ít nhất $9.9$ giờ kể từ lúc uống rượu, người lái xe mới có thể lái xe hợp pháp])
  ),
  loigiai: [

    #step[Xét hàm số nồng độ cồn $A(t) = (0.8t)/(t^2 + 1)$ trên nửa khoảng $[0; +oo)$.]
    #step[- *Ý a):* Ta có giới hạn khi thời gian tăng lên rất lớn:]
    #step[$ lim_limits(t -> +oo) A(t) = lim_limits(t -> +oo) (0.8t)/(t^2 + 1) = 0 $]
    #step[Do đó đồ thị hàm số nhận đường thẳng $y = 0$ làm tiệm cận ngang. $arrow.r$ *Ý a) Đúng.*]
    #step[- *Ý b):* Tính đạo hàm của hàm số:]
    #step[$ A'(t) = (0.8(t^2 + 1) - 0.8t dot 2t) / (t^2 + 1)^2 = (0.8(1 - t^2)) / (t^2 + 1)^2 $]
    #step[Giải phương trình đạo hàm: $A'(t) = 0 <=> 1 - t^2 = 0 <=> t = 1$ (do $t >= 0$).]
    #step[Khảo sát biến thiên:]
    #step[- Với $t in [0; 1)$, ta có $A'(t) > 0$ nên hàm số đồng biến.]
    #step[- Với $t in (1; +oo)$, ta có $A'(t) < 0$ nên hàm số nghịch biến.]
    #step[Do đó nồng độ cồn đạt cực đại sau $1$ giờ uống rượu. $arrow.r$ *Ý b) Đúng.*]
    #step[- *Ý c):* Nồng độ cồn lớn nhất đạt được là:]
    #step[$ A(1) = (0.8 dot 1) / (1^2 + 1) = 0.4 " (g/L)" $]
    #step[Đề ghi là $0.8$ g/L. $arrow.r$ *Ý c) Sai.*]
    #step[- *Ý d):* Người lái xe được phép lái xe khi:]
    #step[$ A(t) < 0.08 <=> (0.8t)/(t^2 + 1) < 0.08 <=> 0.08 t^2 - 0.8t + 0.08 > 0 <=> t^2 - 10t + 1 > 0 $]
    #step[Giải bất phương trình bậc hai với điều kiện $t >= 0$, ta thu được nghiệm:]
    #step[$ t > 5 + 2 sqrt(6) approx 9.9 " (giờ)" $]
    #step[Vậy sau ít nhất $9.9$ giờ, người lái xe mới được tham gia giao thông hợp pháp. $arrow.r$ *Ý d) Đúng.*]
  ]
)

// ─── CÂU 3 ───
#my-ds(de: "Đề Thực Tế", 
  dir: "doc",lines: 4,
  [Một doanh nghiệp độc quyền sản xuất một mặt hàng với hàm cầu là $p = 100 - x$ và hàm tổng chi phí là $C(x) = x^2 + 20x$ (trong đó $x$ là số lượng sản phẩm sản xuất, $p$ và $C$ tính bằng nghìn đồng). Chính phủ đánh thuế $t$ (nghìn đồng) trên mỗi sản phẩm bán ra và doanh nghiệp độc quyền cộng thêm thuế vào chi phí, tức là tổng chi phí mới là $C_("mới")(x) = C(x) + t x$. Do doanh nghiệp luôn chọn sản lượng $x$ để tối đa hóa lợi nhuận nên:],
  (
    True([Lợi nhuận của doanh nghiệp đạt giá trị lớn nhất khi sản lượng sản xuất thỏa mãn $x = 20 - t/4$]),
    True([Tổng số tiền thuế chính phủ thu được biểu diễn theo thuế suất $t$ là $T(t) = 20t - t^2/4$ (nghìn đồng)]),
    [Để số tiền thuế chính phủ thu được là lớn nhất thì thuế suất phải bằng $20$ nghìn đồng/sản phẩm],
    True([Lợi nhuận lớn nhất của doanh nghiệp khi chính phủ thu thuế tối đa là $200$ nghìn đồng])
  ),
  loigiai: [

    #step[Doanh thu của doanh nghiệp độc quyền là $R(x) = x p = -x^2 + 100x$.]
    #step[Lợi nhuận của doanh nghiệp sau khi tính thuế là:]
    #step[$ P(x) = R(x) - C_("mới")(x) = -x^2 + 100x - (x^2 + 20x + t x) = -2x^2 + (80 - t)x $]
    #step[- *Ý a):* Xét hàm số lợi nhuận $P(x)$ theo biến $x$:]
    #step[Đạo hàm theo $x$: $P'_x(x) = -4x + 80 - t$.]
    #step[Cho $P'_x(x) = 0 <=> x = 20 - t/4$.]
    #step[Bảng biến thiên của hàm số bậc hai này chỉ ra lợi nhuận lớn nhất đạt được khi sản lượng $x = 20 - t/4$. $arrow.r$ *Ý a) Đúng.*]
    #step[- *Ý b):* Tổng số tiền thuế chính phủ thu được là:]
    #step[$ T(t) = t x = t(20 - t/4) = 20t - t^2/4 " (nghìn đồng)" $]
    #step[$arrow.r$ *Ý b) Đúng.*]
    #step[- *Ý c):* Xét hàm số thu thuế của chính phủ $T(t) = 20t - 1/4 t^2$ trên khoảng $(0; 80)$.]
    #step[Đạo hàm theo $t$: $T'(t) = 20 - t/2$.]
    #step[Cho $T'(t) = 0 <=> t = 40$ (nghìn đồng/sản phẩm).]
    #step[Bảng biến thiên chỉ ra số tiền thuế đạt giá trị lớn nhất tại mức thuế suất $t = 40$ nghìn đồng. Đề ghi thuế suất bằng $20$ nghìn đồng. $arrow.r$ *Ý c) Sai.*]
    #step[- *Ý d):* Khi chính phủ thu thuế tối đa ($t = 40$), doanh nghiệp sẽ sản xuất sản lượng là $x = 20 - 40/4 = 10$ (sản phẩm).]
    #step[Lợi nhuận lớn nhất của doanh nghiệp lúc này là:]
    #step[$ P(10) = -2 dot 10^2 + (80 - 40) dot 10 = 200 " (nghìn đồng)" $]
    #step[$arrow.r$ *Ý d) Đúng.*]
  ]
)

// ─── CÂU 4 ───
#my-ds(de: "Đề Thực Tế", 
  dir: "doc",lines: 4,
  [Mô hình lượng sản phẩm cung ứng $S(p) = 4p - 10$ và lượng cầu tiêu dùng $D(p) = 30 / (p + 1)$ của một mặt hàng điện tử phụ thuộc vào đơn giá $p$ (triệu đồng/sản phẩm), với $p >= 2.5$. Khi đó:],
  (
    True([Khi đơn giá sản phẩm tăng lên thì lượng cung tăng và lượng cầu giảm]),
    True([Thị trường cân bằng cung - cầu tại đơn giá $p = 4$ triệu đồng]),
    [Doanh thu tối đa tại điểm cân bằng cung - cầu là $15$ triệu đồng],
    True([Khi đơn giá $p$ tiến tới vô hạn thì lượng cầu tiêu dùng tiến dần về $0$])
  ),
  loigiai: [

    #step[Xét các hàm cung $S(p) = 4p - 10$ và cầu $D(p) = 30/(p + 1)$ với $p >= 2.5$.]
    #step[- *Ý a):* Ta có $S'(p) = 4 > 0$ nên hàm cung đồng biến (đơn giá tăng, lượng cung tăng).]
    #step[Đạo hàm $D'(p) = -30/((p+1)^2) < 0$ nên hàm cầu nghịch biến (đơn giá tăng, lượng cầu giảm). $arrow.r$ *Ý a) Đúng.*]
    #step[- *Ý b):* Thị trường cân bằng khi lượng cung bằng lượng cầu:]
    #step[$ 4p - 10 = 30/(p+1) <=> (4p - 10)(p+1) = 30 <=> 2p^2 - 3p - 20 = 0 $]
    #step[Giải phương trình bậc hai với điều kiện $p >= 2.5$, ta nhận nghiệm $p = 4$ (triệu đồng). $arrow.r$ *Ý b) Đúng.*]
    #step[- *Ý c):* Tại điểm cân bằng cung - cầu $p = 4$, lượng hàng hóa bán ra là $S(4) = 6$ (sản phẩm).]
    #step[Doanh thu đạt được tại đây là:]
    #step[$ R = p dot S(p) = 4 dot 6 = 24 " (triệu đồng)" $]
    #step[Đề ghi là $15$ triệu đồng. $arrow.r$ *Ý c) Sai.*]
    #step[- *Ý d):* Tìm giới hạn của lượng cầu khi đơn giá tăng rất lớn:]
    #step[$ lim_limits(p -> +oo) D(p) = lim_limits(p -> +oo) 30/(p + 1) = 0 $]
    #step[$arrow.r$ *Ý d) Đúng.*]
  ]
)


// ─── CÂU 1 ───
#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một xưởng in tranh cần thiết kế một trang sách hình chữ nhật có diện tích phần in ấn bên trong là $384$ cm². Biết lề trên và lề dưới rộng $3$ cm, lề trái và lề phải rộng $2$ cm. Chiều rộng của trang sách (tính bằng cm) sao cho diện tích của toàn bộ trang sách là nhỏ nhất bằng bao nhiêu?],
  [$20$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Gọi $x$ (cm) và $y$ (cm) lần lượt là chiều rộng và chiều dài của phần in ấn bên trong ($x > 0, y > 0$).]
    #step[Ta có: $x y = 384 => y = 384/x$.]
    #step[Chiều rộng của toàn bộ trang sách là $x + 4$ (cm).]
    #step[Chiều dài của toàn bộ trang sách là $y + 6 = 384/x + 6$ (cm).]
    #step[Diện tích của toàn bộ trang sách là:]
    #step[$ S(x) = (x + 4)(384/x + 6) = 408 + 6x + 1536/x " (cm²)" $]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Xét hàm số $S(x)$ trên khoảng $(0; +oo)$.]
    #step[Đạo hàm:]
    #step[$ S'(x) = 6 - 1536/x^2 = (6(x^2 - 256))/x^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ S'(x) = 0 <=> x^2 - 256 = 0 <=> x = 16 " (do " x > 0 ")" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $S(x)$ trên $(0; +oo)$:]
    #step[- Với $x in (0; 16)$, ta có $S'(x) < 0$ nên hàm số nghịch biến.]
    #step[- Với $x in (16; +oo)$, ta có $S'(x) > 0$ nên hàm số đồng biến.]
    #step[Do đó, diện tích toàn bộ trang sách nhỏ nhất tại $x = 16$ cm.]
    #step[Chiều rộng tương ứng của toàn bộ trang sách là $x + 4 = 16 + 4 = 20$ cm.]
    #step[Đáp số: $20$.]
  ]
)

// ─── CÂU 2 ───
#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một người muốn xây một hố chứa rác hình hộp chữ nhật không nắp có thể tích $72$ m³, đáy là hình chữ nhật có chiều dài gấp đôi chiều rộng. Chi phí thuê nhân công xây dựng đáy hố là $300$ nghìn đồng/m² và xây dựng bốn thành hố là $150$ nghìn đồng/m². Chi phí thuê nhân công xây dựng thấp nhất của hố chứa rác là bao nhiêu triệu đồng?],
  [$16.2$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Gọi $x$ (m, $x > 0$) là chiều rộng đáy hố. Chiều dài đáy tương ứng là $2x$ (m).]
    #step[Gọi $h$ (m, $h > 0$) là chiều cao của hố rác.]
    #step[Thể tích hố: $V = 2x^2 h = 72 => h = 36/x^2$.]
    #step[Diện tích đáy hố: $S_("đáy") = 2x^2$ (m²).]
    #step[Diện tích bốn thành hố: $S_("xq") = 2(x h + 2x h) = 6x h = 6x dot 36/x^2 = 216/x$ (m²).]
    #step[Tổng chi phí nhân công xây dựng hố là:]
    #step[$ C(x) = 300 dot 2x^2 + 150 dot 216/x = 600x^2 + 32400/x " (nghìn đồng)" $]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Xét hàm số $C(x)$ trên khoảng $(0; +oo)$.]
    #step[Đạo hàm:]
    #step[$ C'(x) = 1200x - 32400/x^2 = (1200(x^3 - 27))/x^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ C'(x) = 0 <=> x^3 - 27 = 0 <=> x = 3 " (do " x > 0 ")" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $C(x)$ trên $(0; +oo)$:]
    #step[- Với $x in (0; 3)$, ta có $C'(x) < 0$ nên hàm số nghịch biến.]
    #step[- Với $x in (3; +oo)$, ta có $C'(x) > 0$ nên hàm số đồng biến.]
    #step[Do đó, chi phí xây dựng thấp nhất khi kích thước chiều rộng đáy $x = 3$ m.]
    #step[Chi phí thấp nhất tương ứng:]
    #step[$ C(3) = 600 dot 3^2 + 32400/3 = 16200 " (nghìn đồng)" = 16.2 " (triệu đồng)" $]
    #step[Đáp số: $16.2$.]
  ]
)

// ─── CÂU 3 ───
#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một sợi dây kim loại dài $100$ cm được cắt thành hai phần. Phần thứ nhất được uốn thành một hình vuông cạnh $a$, phần thứ hai được uốn thành một hình tròn bán kính $r$. Tổng diện tích của hai hình này có giá trị nhỏ nhất bằng bao nhiêu xăng-ti-mét vuông (lấy $pi approx 3.14$, làm tròn kết quả đến hàng đơn vị)?],
  [$350$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Tổng chu vi hai hình là chiều dài sợi dây:]
    #step[$ 4a + 2 pi r = 100 <=> 2a + pi r = 50 => a = (50 - pi r)/2 $]
    #step[Tổng diện tích của hình vuông và hình tròn là:]
    #step[$ S(r) = a^2 + pi r^2 = ((50 - pi r)/2)^2 + pi r^2 = (pi^2/4 + pi)r^2 - 25 pi r + 625 $]
    #step[Điều kiện: $0 < r < 50/pi$.]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Đạo hàm của $S(r)$ theo bán kính $r$:]
    #step[$ S'(r) = 2(pi^2/4 + pi)r - 25 pi = (pi^2/2 + 2 pi)r - 25 pi $]
    #step[Giải phương trình đạo hàm:]
    #step[$ S'(r) = 0 <=> r = (25 pi) / (pi^2/2 + 2 pi) = 50 / (pi + 4) " (cm)" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số bậc hai $S(r)$ trên khoảng $(0; 50/pi)$:]
    #step[- Với $r in (0; 50/(pi+4))$, ta có $S'(r) < 0$ nên hàm số nghịch biến.]
    #step[- Với $r in (50/(pi+4); 50/pi)$, ta có $S'(r) > 0$ nên hàm số đồng biến.]
    #step[Do đó, tổng diện tích nhỏ nhất khi bán kính hình tròn là $r = 50 / (pi + 4)$ cm.]
    #step[Với $pi approx 3.14$:]
    #step[$ r approx 50 / 7.14 approx 7.00 " (cm)" $]
    #step[$ a = (50 - 3.14 dot 7.00) / 2 approx 14.01 " (cm)" $]
    #step[Tổng diện tích nhỏ nhất:]
    #step[$ S_("min") approx 14.01^2 + 3.14 dot 7.00^2 approx 350.14 " (cm²)" $]
    #step[Làm tròn đến hàng đơn vị được $350$.]
    #step[Đáp số: $350$.]
  ]
)

// ─── CÂU 4 ───
#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một cửa sổ gồm phần dưới là hình chữ nhật và phần trên là một nửa hình tròn. Biết chu vi của cửa sổ bằng $4$ m. Chiều rộng $x$ (m) của cửa sổ sao cho diện tích của cửa sổ đón được nhiều ánh sáng nhất bằng bao nhiêu mét (lấy $pi approx 3.14$, làm tròn kết quả đến hai chữ số thập phân)?],
  [$1.12$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Gọi chiều rộng của cửa sổ là $x$ (m, $x > 0$), bán kính của nửa hình tròn phía trên là $r = x/2$ (m).]
    #step[Gọi chiều cao của phần hình chữ nhật phía dưới là $h$ (m, $h > 0$).]
    #step[Chu vi của toàn bộ cửa sổ:]
    #step[$ P = x + 2h + pi r = x + 2h + (pi x)/2 = (1 + pi/2)x + 2h = 4 $]
    #step[Suy ra:]
    #step[$ h = 2 - (1/2 + pi/4)x $]
    #step[Điều kiện: $h > 0 <=> (1/2 + pi/4)x < 2 <=> x < 8 / (2 + pi)$.]
    #step[Diện tích đón ánh sáng của cửa sổ là:]
    #step[$ S(x) = x h + 1/2 pi r^2 = x(2 - (1/2 + pi/4)x) + 1/2 pi (x/2)^2 = 2x - (1/2 + pi/8)x^2 $]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Xét hàm số $S(x)$ trên khoảng $(0; 8/(2+pi))$.]
    #step[Đạo hàm:]
    #step[$ S'(x) = 2 - 2(1/2 + pi/8)x = 2 - (1 + pi/4)x $]
    #step[Giải phương trình đạo hàm:]
    #step[$ S'(x) = 0 <=> x = 2 / (1 + pi/4) = 8 / (4 + pi) " (m)" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $S(x)$ trên $(0; 8/(2+pi))$:]
    #step[- Với $x in (0; 8/(4+pi))$, ta có $S'(x) > 0$ nên hàm số đồng biến.]
    #step[- Với $x in (8/(4+pi); 8/(2+pi))$, ta có $S'(x) < 0$ nên hàm số nghịch biến.]
    #step[Do đó, diện tích cửa sổ lớn nhất khi chiều rộng cửa sổ là:]
    #step[$ x = 8 / (4 + pi) " (m)" $]
    #step[Với $pi approx 3.14$:]
    #step[$ x approx 8 / (4 + 3.14) = 8 / 7.14 approx 1.12 " (m)" $]
    #step[Đáp số: $1.12$.]
  ]
)

// ─── CÂU 5 ───
#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Nồng độ oxy hòa tan trong một con sông sau $t$ ngày kể từ lúc xảy ra sự cố xả thải hữu cơ được tính theo công thức $O(t) = 10 - (8t)/(t^2 + 4)$ (mg/L). Khoảng thời gian $t$ (ngày) để nồng độ oxy hòa tan trong sông đạt mức thấp nhất là bao nhiêu?],
  [$2$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Xét hàm số nồng độ oxy $O(t) = 10 - (8t)/(t^2 + 4)$ trên miền $t >= 0$.]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Đạo hàm của hàm số:]
    #step[$ O'(t) = - ( 8(t^2 + 4) - 8t dot 2t ) / (t^2 + 4)^2 = (8(t^2 - 4)) / (t^2 + 4)^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ O'(t) = 0 <=> t^2 - 4 = 0 <=> t = 2 " (do " t >= 0 ")" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $O(t)$ trên $[0; +oo)$:]
    #step[- Với $t in [0; 2)$, ta có $O'(t) < 0$ nên hàm số nghịch biến.]
    #step[- Với $t in (2; +oo)$, ta có $O'(t) > 0$ nên hàm số đồng biến.]
    #step[Do đó, nồng độ oxy hòa tan trong sông đạt giá trị thấp nhất tại thời điểm $t = 2$ ngày.]
    #step[Đáp số: $2$.]
  ]
)

// ─── CÂU 6 ───
#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Tàu $A$ cách cảng $O$ một khoảng $10$ km về phía bắc và bắt đầu di chuyển về phía nam (hướng về cảng $O$) với vận tốc $20$ km/h. Cùng lúc đó, tàu $B$ bắt đầu di chuyển từ cảng $O$ về phía đông với vận tốc $15$ km/h. Khoảng cách ngắn nhất giữa hai tàu trong suốt hành trình di chuyển bằng bao nhiêu km?],
  [$6$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Chọn hệ trục tọa độ vuông góc $O x y$, gốc tọa độ ở cảng $O$, hướng Đông là chiều dương $O x$, hướng Bắc là chiều dương $O y$.]
    #step[Sau $t$ giờ di chuyển ($t >= 0$):]
    #step[- Tàu $A$ có tọa độ là $(0; 10 - 20t)$.]
    #step[- Tàu $B$ có tọa độ là $(15t; 0)$.]
    #step[Khoảng cách giữa hai tàu được tính bởi:]
    #step[$ d(t) = sqrt((15t)^2 + (10 - 20t)^2) = sqrt(625t^2 - 400t + 100) " (km)" $]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Xét hàm số dưới dấu căn $f(t) = 625t^2 - 400t + 100$ trên $[0; +oo)$.]
    #step[Đạo hàm:]
    #step[$ f'(t) = 1250t - 400 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ f'(t) = 0 <=> t = 400 / 1250 = 0.32 " (giờ)" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $f(t)$ trên $[0; +oo)$:]
    #step[- Với $t in [0; 0.32)$, ta có $f'(t) < 0$ nên hàm số nghịch biến.]
    #step[- Với $t in (0.32; +oo)$, ta có $f'(t) > 0$ nên hàm số đồng biến.]
    #step[Do đó, khoảng cách nhỏ nhất giữa hai tàu đạt được tại $t = 0.32$ giờ.]
    #step[Khoảng cách tối thiểu tương ứng:]
    #step[$ d_("min") = sqrt(f(0.32)) = sqrt(625 dot 0.32^2 - 400 dot 0.32 + 100) = sqrt(36) = 6 " (km)" $]
    #step[Đáp số: $6$.]
  ]
)



