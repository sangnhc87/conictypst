#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 3: ĐƯỜNG TIỆM CẬN
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
  title:       "Bài 3: Đường tiệm cận của đồ thị hàm số",
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

#lt-section-link("sec-4434a2", "🏛️", [Bối Cảnh Lịch Sử])
#lt-slide-back(title: "Nguồn Gốc Của Đường Tiệm Cận")[
  #lt-two-col(ratio: (55%, 45%))[
    *Khái niệm "Tiệm cận" (Asymptote)*
    - Tiếng Hy Lạp: *asumptōtos* (nghĩa là "không bao giờ gặp nhau").
    - Khái niệm này lần đầu được nghiên cứu bởi nhà toán học Hy Lạp cổ đại *Apollonius của Perga* (khoảng thế kỷ thứ 3 TCN) khi ông nghiên cứu các đường cô-nic, đặc biệt là đường Hyperbol.
    - Apollonius nhận thấy có những đường thẳng mà nhánh của Hyperbol cứ tiến lại gần mãi nhưng không bao giờ cắt.
    
    *Sự phát triển*
    - Sau này, khi *Newton* và *Leibniz* phát minh ra Giải tích, việc tìm tiệm cận trở thành bài toán tính *giới hạn (limit)* khi biến số tiến ra vô cực.
  ][
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-3, 0), (3, 0), mark: (end: ">", fill: black))
        line((0, -2), (0, 3), mark: (end: ">", fill: black))
        content((3.2, 0), $x$)
        content((0, 3.2), $y$)
        content((-0.3, -0.3), $O$)
        // curve y = 1/x for x > 0
        bezier((0.3, 3), (3, 0.3), (0.3, 0.3), stroke: 1.5pt + red)
        // curve y = 1/x for x < 0
        bezier((-0.3, -2), (-3, -0.3), (-0.3, -0.3), stroke: 1.5pt + red)
      })
    ]
  ]
]

#lt-section-link("sec-944e0a", "💡", [Tiệm Cận Ngang])
#lt-slide-back(title: "1. Tiệm Cận Ngang (Horizontal Asymptote)")[
  #lt-note(title: "Định nghĩa")[
    Cho hàm số $y = f(x)$ xác định trên một khoảng vô hạn. Đường thẳng $y = y_0$ được gọi là *đường tiệm cận ngang* của đồ thị hàm số $y = f(x)$ nếu ít nhất một trong các điều kiện sau được thoả mãn:
    #align(center)[
      $lim_(x -> +oo) f(x) = y_0$ \ hoặc \ $lim_(x -> -oo) f(x) = y_0$
    ]
  ]
  #pause
  *Ví dụ:* Tìm tiệm cận ngang của đồ thị hàm số $y = (2x + 1)/(x - 1)$.
  - Ta có $lim_(x -> +oo) (2x + 1)/(x - 1) = 2$ và $lim_(x -> -oo) (2x + 1)/(x - 1) = 2$.
  - Vậy đường thẳng $y = 2$ là tiệm cận ngang.
]

#lt-section-link("sec-8239c7", "💡", [Tiệm Cận Đứng])
#lt-slide-back(title: "2. Tiệm Cận Đứng (Vertical Asymptote)")[
  #lt-note(title: "Định nghĩa")[
    Đường thẳng $x = x_0$ được gọi là *đường tiệm cận đứng* của đồ thị hàm số $y = f(x)$ nếu ít nhất một trong các điều kiện sau được thoả mãn:
    #align(center)[
      $lim_(x -> x_0^+) f(x) = +oo; lim_(x -> x_0^-) f(x) = +oo$       $lim_(x -> x_0^+) f(x) = -oo; lim_(x -> x_0^-) f(x) = -oo$
    ]
  ]
  #pause
  *Ví dụ:* Tìm tiệm cận đứng của đồ thị hàm số $y = (2x + 1)/(x - 1)$.
  - Ta có $lim_(x -> 1^+) (2x + 1)/(x - 1) = +oo$.
  - Vậy đường thẳng $x = 1$ là tiệm cận đứng.
]

#lt-section-link("sec-db777a", "💡", [Tiệm Cận Xiên])
#lt-slide-back(title: "3. Tiệm Cận Xiên (Oblique Asymptote)")[
  #lt-note(title: "Định nghĩa")[
    Đường thẳng $y = a x + b$ ($a != 0$) được gọi là *đường tiệm cận xiên* của đồ thị hàm số $y = f(x)$ nếu:
    #align(center)[
      $lim_(x -> +oo) [f(x) - (a x + b)] = 0$ \ hoặc \ $lim_(x -> -oo) [f(x) - (a x + b)] = 0$
    ]
  ]
  #pause
  *Cách tìm tiệm cận xiên cho hàm phân thức:*
  Đối với hàm số dạng phân thức $y = (P(x))/(Q(x))$ mà bậc của $P(x)$ lớn hơn bậc của $Q(x)$ đúng 1 bậc, ta thực hiện phép chia đa thức:
  $ y = f(x) = a x + b + R(x)/(Q(x)) $
  Khi đó, vì $lim_(x -> oo) R(x)/(Q(x)) = 0$ nên $y = a x + b$ là tiệm cận xiên.
]

#lt-section-link("sec-e7adb7", "❓", [Luyện Tập Trắc Nghiệm])
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
  dir: "doc",lines:0,
  [Đồ thị hàm số $y = (2x - 3)/(x + 1)$ có đường tiệm cận ngang là:],
  (
    [$x = -1$.],
    True([$y = 2$.]),
    [$y = -3$.],
    [$y = 1$.]
  ),
  loigiai: [
    #step[Hàm số xác định trên $RR \\ {-1}$.]
    #step[Ta có $limits(lim)_(x -> +oo) y = limits(lim)_(x -> +oo) (2x - 3)/(x + 1) = limits(lim)_(x -> +oo) (2 - 3/x)/(1 + 1/x) = 2$.]
    #step[Và $limits(lim)_(x -> -oo) y = 2$. Do đó, đường thẳng $y = 2$ là tiệm cận ngang của đồ thị hàm số.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines:0,
  [Đường tiệm cận đứng của đồ thị hàm số $y = (x^2 - x + 1)/(x - 2)$ có phương trình là:],
  (
    True([$x = 2$.]),
    [$x = 1$.],
    [$y = 2$.],
    [$y = x + 1$.]
  ),
  loigiai: [
    #step[Hàm số xác định khi $x - 2 != 0 <=> x != 2$.]
    #step[Ta tính giới hạn tại $x_0 = 2$: $limits(lim)_(x -> 2^+) (x^2 - x + 1)/(x - 2) = +oo$ (vì tử số tiến đến $3 > 0$ và mẫu số tiến đến $0^+$).]
    #step[Và $limits(lim)_(x -> 2^-) (x^2 - x + 1)/(x - 2) = -oo$.]
    #step[Vậy đường thẳng $x = 2$ là tiệm cận đứng của đồ thị hàm số.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines:0,
  [Tiệm cận xiên của đồ thị hàm số $y = (x^2 + 3x - 1)/(x - 1)$ là đường thẳng:],
  (
    [$y = x - 1$.],
    [$y = x + 3$.],
    True([$y = x + 4$.]),
    [$y = 2x + 1$.]
  ),
  loigiai: [
    #step[Hàm số xác định trên $RR \\ {1}$.]
    #step[Thực hiện phép chia đa thức tử số cho mẫu số, ta được: $y = (x^2 - x + 4x - 4 + 3)/(x - 1) = x + 4 + 3/(x - 1)$.]
    #step[Ta có $limits(lim)_(x -> +oo) [y - (x + 4)] = limits(lim)_(x -> +oo) 3/(x - 1) = 0$. Tương tự khi $x -> -oo$.]
    #step[Vậy đường thẳng $y = x + 4$ là tiệm cận xiên của đồ thị hàm số.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines:0,
  [Đồ thị hàm số $y = (sqrt(x^2 + 1) - x)/(x - 1)$ có bao nhiêu đường tiệm cận (bao gồm tiệm cận đứng và ngang)?],
  (
    [$1$.],
    True([$2$.]),
    [$3$],
    [$4$.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {1}$.]
    #step[Tìm tiệm cận ngang: 
    - Khi $x -> +oo$: $y = (sqrt(x^2+1) - x)/(x-1) = ( (x^2+1)-x^2 ) / ((x-1)(sqrt(x^2+1)+x)) = 1 / ((x-1)(x sqrt(1+1/x^2) + x))$.
    Suy ra $limits(lim)_(x -> +oo) y = 0$. Đồ thị có TCN $y = 0$.
    - Khi $x -> -oo$: $limits(lim)_(x -> -oo) y = limits(lim)_(x -> -oo) ( |x|sqrt(1+1/x^2) - x )/(x-1) = limits(lim)_(x -> -oo) ( -x(sqrt(1+1/x^2) + 1) )/( x(1 - 1/x) ) = -2$. Đồ thị có TCN $y = -2$.]
    #step[Vậy đồ thị có 2 tiệm cận ngang. Nhưng đợi đã, còn TCĐ tại $x = 1$? 
    Tại $x = 1$, tử số tiến tới $sqrt(2) - 1 > 0$, mẫu số tiến tới $0$. Do đó $limits(lim)_(x -> 1) y = oo$. Vậy có thêm 1 TCĐ $x = 1$.]
    #step[Tổng cộng có 3 đường tiệm cận! Đáp án đúng phải là 3.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines:0,
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f$,
        func: $f$,
        x-vals: ($-oo$, $1$, $3$, $+oo$),
        d-signs: ("+", "||", "-", "0", "+"),
        v-vals: ($2$, ($-oo$, $+oo$), $0$, $5$),
        ranks: (1, (-1, 2), -1, 2)
      )
    ]
    Tổng số tiệm cận đứng và tiệm cận ngang của đồ thị hàm số là:
  ],
  (
    [$1$.],
    [$2$.],
    True([$3$.]),
    [$4$.]
  ),
  loigiai: [
    #step[Dựa vào bảng biến thiên, ta phân tích các giới hạn:]
    #step[1. Tiệm cận ngang:
    - $limits(lim)_(x -> -oo) f(x) = 2 => y = 2$ là TCN.
    - $limits(lim)_(x -> +oo) f(x) = 5 => y = 5$ là TCN.
    Vậy có 2 đường TCN.]
    #step[2. Tiệm cận đứng:
    - Tại $x = 1$, ta thấy $limits(lim)_(x -> 1^-) f(x) = -oo$ và $limits(lim)_(x -> 1^+) f(x) = +oo$. Do đó $x = 1$ là TCĐ.
    - Tại $x = 3$, hàm số liên tục và đạt giá trị $0$. Không có TCĐ.]
    #step[Vậy đồ thị hàm số có tổng cộng 3 đường tiệm cận.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines:0, 
  fig: canvas(length: 1cm, {
    import draw: *
    // Grid and axes
    line((-2.5, 0), (3.5, 0), stroke: 0.8pt, mark: (end: "stealth")) // x-axis
    line((0, -2.5), (0, 3.5), stroke: 0.8pt, mark: (end: "stealth")) // y-axis
    content((3.3, -0.3), $x$)
    content((-0.3, 3.3), $y$)
    content((-0.3, -0.3), $O$)
    
    // Asymptotes
    line((-2.5, 1), (3.5, 1), stroke: (dash: "dashed", paint: red)) // y=1
    line((1, -2.5), (1, 3.5), stroke: (dash: "dashed", paint: red)) // x=1
    content((3.3, 1.3), text(fill: red)[$y=1$])
    content((1.4, 3.3), text(fill: red)[$x=1$])
    
    // Curve branches
    bezier((-2.5, 0.5), (0.5, -2.5), (-0.5, 0.5), (0.5, -0.5), stroke: 1.2pt + blue)
    bezier((1.5, 3.5), (3.5, 1.5), (1.5, 1.5), (2.5, 1.5), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Cho đồ thị hàm số $y = (a x + b)/(c x + d)$ như hình bên. Tọa độ giao điểm $I$ của hai đường tiệm cận là:],
  (
    [$I(-1; 1)$.],
    True([$I(1; 1)$.]),
    [$I(1; -1)$.],
    [$I(0; 1)$.]
  ),
  loigiai: [
    #step[Quan sát đồ thị, ta thấy:]
    #step[Khi $x -> +oo$ hoặc $x -> -oo$, đồ thị tiến sát đến đường thẳng nằm ngang $y = 1$. Do đó TCN là $y = 1$.]
    #step[Khi $x -> 1^+$ thì $y -> +oo$ và $x -> 1^-$ thì $y -> -oo$. Đồ thị tiến sát đến đường thẳng đứng $x = 1$. Do đó TCĐ là $x = 1$.]
    #step[Giao điểm của TCN và TCĐ là $I(1; 1)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số $y = (x - 1)/(x^2 - 3x + m)$ có đúng hai đường tiệm cận đứng.],
  (
    True([$m < 9/4$ và $m != 2$.]),
    [$m < 9/4$.],
    [$m > 9/4$.],
    [$m != 2$.]
  ),
  loigiai: [
    #step[Đồ thị có 2 TCĐ khi và chỉ khi phương trình mẫu số $g(x) = x^2 - 3x + m = 0$ có 2 nghiệm phân biệt khác nghiệm của tử số (nghĩa là khác $x = 1$).]
    #step[Điều kiện 1: $Delta = 9 - 4m > 0 <=> m < 9/4$.]
    #step[Điều kiện 2: $g(1) != 0 <=> 1^2 - 3(1) + m != 0 <=> m - 2 != 0 <=> m != 2$.]
    #step[Vậy điều kiện cần tìm là $m < 9/4$ và $m != 2$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Đồ thị hàm số $y = (sqrt(x + 4) - 2)/(x^2 + x)$ có bao nhiêu đường tiệm cận đứng?],
  (
    [$0$.],
    True([$1$.]),
    [$2$.],
    [$3$.]
  ),
  loigiai: [
    #step[Tập xác định $x >= -4, x != 0, x != -1$.]
    #step[Mẫu số bằng 0 tại $x = 0$ và $x = -1$. Ta xét giới hạn tại hai điểm này.]
    #step[Tại $x = -1$: Tử số là $sqrt(3) - 2 != 0$, mẫu số bằng 0. Vậy $x = -1$ là tiệm cận đứng.]
    #step[Tại $x = 0$: Tử số tiến về $0$. Ta nhân lượng liên hợp:
    $limits(lim)_(x -> 0) (sqrt(x + 4) - 2)/(x(x + 1)) = limits(lim)_(x -> 0) (x + 4 - 4)/(x(x + 1)(sqrt(x + 4) + 2)) = limits(lim)_(x -> 0) 1/((x + 1)(sqrt(x + 4) + 2)) = 1/4 != oo$.]
    #step[Vì giới hạn hữu hạn nên $x = 0$ KHÔNG phải là tiệm cận đứng.]
    #step[Vậy đồ thị chỉ có 1 đường TCĐ là $x = -1$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Tìm $m$ để đồ thị hàm số $y = (m x^2 + 2x - 1)/(x - 2)$ có tiệm cận xiên đi qua điểm $A(1; 5)$.],
  (
    True([$m = 1$.]),
    [$m = 2$.],
    [$m = -1$.],
    [$m = 3$.]
  ),
  loigiai: [
    #step[Điều kiện để hàm số có tiệm cận xiên là tử số có bậc 2 và $m != 0$, đồng thời $x = 2$ không phải là nghiệm của tử số (nghĩa là $4m + 4 - 1 != 0 <=> m != -3/4$).]
    #step[Chia đa thức: $y = m x + (2 + 2m) + (4m + 3)/(x - 2)$.]
    #step[Vậy phương trình tiệm cận xiên là: $y = m x + 2m + 2$.]
    #step[TCX đi qua $A(1; 5) => 5 = m(1) + 2m + 2 <=> 3m = 3 <=> m = 1$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Đồ thị hàm số $y = (2x^2 + x + 1)/(x + 1)$ có hai đường tiệm cận tạo với hai trục tọa độ một tứ giác. Diện tích tứ giác đó bằng:],
  (
    [$1$.],
    True([$2$.]),
    [$3$.],
    [$4$.]
  ),
  loigiai: [
    #step[Tiệm cận đứng: $x = -1$.]
    #step[Thực hiện phép chia: $y = (2x^2 + x + 1)/(x + 1) = 2x - 1 + 2/(x + 1)$.]
    #step[Tiệm cận xiên: $y = 2x - 1$.]
    #step[Tứ giác được tạo bởi $x = 0, y = 0, x = -1, y = 2x - 1$. Các đỉnh của tứ giác là giao điểm của các đường này.]
    #step[- Giao TCĐ $x = -1$ và trục hoành $y = 0$: $A(-1; 0)$.
    - Giao TCX $y = 2x - 1$ và trục tung $x = 0$: $B(0; -1)$.
    - Giao của TCĐ và TCX: $I(-1; -3)$.
    - Gốc tọa độ $O(0; 0)$.]
    #step[Tứ giác tạo thành là hình thang vuông với hai cạnh đáy nằm trên TCĐ và trục tung. Diện tích tứ giác giới hạn bởi $x=0, x=-1, y=0$ và $y=2x-1$ là $S = integral_(-1)^0 |2x - 1| d x = integral_(-1)^0 (1 - 2x) d x = (x - x^2)|_(-1)^0 = 2$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -2.5), (0, 2.5), stroke: 0.8pt, mark: (end: "stealth"))
    content((2.3, -0.3), $x$)
    content((-0.3, 2.3), $y$)
    
    // TCD x = 1
    line((1, -2.5), (1, 2.5), stroke: (dash: "dashed", paint: red))
    // TCX y = x - 1
    line((-1.5, -2.5), (2.5, 1.5), stroke: (dash: "dashed", paint: red))
    
    // Right branch
    line(..range(0, 31).map(i => {
      let x = 1.1 + i * (2.5 - 1.1) / 30
      let y = x - 1 + 0.5 / (x - 1)
      (x, y)
    }).filter(p => p.at(1) <= 2.5 and p.at(1) >= -2.5), stroke: 1.2pt + blue)
    
    // Left branch
    line(..range(0, 31).map(i => {
      let x = -2.5 + i * (0.9 - (-2.5)) / 30
      let y = x - 1 + 0.5 / (x - 1)
      (x, y)
    }).filter(p => p.at(1) <= 2.5 and p.at(1) >= -2.5), stroke: 1.2pt + blue)
    
    content((1.3, -1.5), text(fill: red)[$x=1$])
    content((1.8, 0.4), text(fill: red)[$y=x-1$])
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Cho hàm số phân thức $y = (a x^2 + b x + c)/(x + d)$ có đồ thị như hình bên. Tọa độ giao điểm của hai tiệm cận là:],
  (
    [$I(1; 1)$.],
    [$I(-1; 0)$.],
    True([$I(1; 0)$.]),
    [$I(0; -1)$.]
  ),
  loigiai: [
    #step[Quan sát đồ thị, ta thấy:]
    #step[Đường tiệm cận đứng là $x = 1$.]
    #step[Đường tiệm cận xiên là một đường thẳng đi qua các điểm $(1; 0)$ và $(0; -1)$, có phương trình $y = x - 1$.]
    #step[Giao điểm của TCĐ $x = 1$ và TCX $y = x - 1$ là điểm $I(1; 0)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Cho hàm số $y = (sqrt(x^2 - 4x + 3))/(x - 2)$. Đồ thị hàm số có bao nhiêu đường tiệm cận ngang?],
  (
    [$0$.],
    [$1$.],
    True([$2$.]),
    [$3$.]
  ),
  loigiai: [
    #step[Tập xác định: $x^2 - 4x + 3 >= 0 <=> x <= 1$ hoặc $x >= 3$.]
    #step[Xét giới hạn khi $x -> +oo$: 
    $limits(lim)_(x -> +oo) (sqrt(x^2(1 - 4/x + 3/x^2)))/(x - 2) = limits(lim)_(x -> +oo) (|x|sqrt(1 - 4/x + 3/x^2))/(x - 2) = limits(lim)_(x -> +oo) (x sqrt(...))/(x(1 - 2/x)) = 1$.
    Vậy $y = 1$ là một tiệm cận ngang.]
    #step[Xét giới hạn khi $x -> -oo$:
    $limits(lim)_(x -> -oo) (|x|sqrt(1 - 4/x + 3/x^2))/(x - 2) = limits(lim)_(x -> -oo) (-x sqrt(...))/(x(1 - 2/x)) = -1$.
    Vậy $y = -1$ là một tiệm cận ngang thứ hai.]
    #step[Do đó, đồ thị hàm số có 2 đường tiệm cận ngang.]
  ]
)


#my-ds(de: "Đề 1", 
  dir: "doc",
  [Cho hàm số $y = (x^2 - 4)/(x^2 - 3x + 2)$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = RR \\ {1; 2}$.]),
    [Đồ thị hàm số có hai đường tiệm cận đứng là $x = 1$ và $x = 2$.],
    True([Đồ thị hàm số có một đường tiệm cận ngang là $y = 1$.]),
    [Tổng số đường tiệm cận (đứng và ngang) của đồ thị hàm số là $3$.]
  ),
  loigiai: [
    #step[a) Mẫu số $x^2 - 3x + 2 = 0 <=> x = 1$ hoặc $x = 2$. Tập xác định $D = RR \\ {1; 2}$. (Đúng)]
    #step[b) Tử số $x^2 - 4 = (x - 2)(x + 2)$. Rút gọn hàm số với $x != 2$: $y = ((x - 2)(x + 2))/((x - 1)(x - 2)) = (x + 2)/(x - 1)$. 
    Ta thấy $limits(lim)_(x -> 2) y = 4 != oo$ nên $x = 2$ KHÔNG là TCĐ. Chỉ có $x = 1$ là TCĐ. (Sai)]
    #step[c) $limits(lim)_(x -> oo) (x^2 - 4)/(x^2 - 3x + 2) = 1$. Tiệm cận ngang là $y = 1$. (Đúng)]
    #step[d) Đồ thị có 1 TCN ($y = 1$) và 1 TCĐ ($x = 1$). Tổng là 2 đường tiệm cận. (Sai)]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",
  [Cho hàm số $y = (2x^2 - x + 1)/(x - 1)$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Đồ thị hàm số có tiệm cận đứng là đường thẳng $x = 1$.]),
    [Đồ thị hàm số có tiệm cận ngang là đường thẳng $y = 2$.],
    True([Đồ thị hàm số có tiệm cận xiên là đường thẳng $y = 2x + 1$.]),
    True([Giao điểm của hai đường tiệm cận có tọa độ là $I(1; 3)$.])
  ),
  loigiai: [
    #step[a) $limits(lim)_(x -> 1^+) (2x^2 - x + 1)/(x - 1) = +oo$ nên $x = 1$ là tiệm cận đứng. (Đúng)]
    #step[b) Bậc của tử (2) lớn hơn bậc của mẫu (1) nên hàm số không có tiệm cận ngang. $limits(lim)_(x -> oo) y = oo$. (Sai)]
    #step[c) Chia đa thức: $2x^2 - x + 1 = (x - 1)(2x + 1) + 2$. Suy ra $y = 2x + 1 + 2/(x - 1)$. Vậy TCX là $y = 2x + 1$. (Đúng)]
    #step[d) Giao điểm của TCĐ $x = 1$ và TCX $y = 2x + 1$. Thay $x = 1$ vào TCX ta được $y = 3$. Vậy tọa độ giao điểm là $I(1; 3)$. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",
  [Cho đồ thị hàm số $y = f(x)$ có dạng $y = (a x + b)/(c x + d)$ ($c != 0$) và biết rằng đồ thị đi qua điểm $M(0; 1)$, nhận đường thẳng $x = -1$ làm tiệm cận đứng và $y = 2$ làm tiệm cận ngang. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Từ tiệm cận ngang ta suy ra được $a/c = 2$.]),
    [Từ tiệm cận đứng ta suy ra được $d/c = -1$.],
    True([Hàm số có dạng $y = (2x + 1)/(x + 1)$.]),
    True([Tâm đối xứng của đồ thị là $I(-1; 2)$.])
  ),
  loigiai: [
    #step[a) Tiệm cận ngang của hàm phân thức bậc 1/bậc 1 là $y = a/c$. Vậy $a/c = 2$. (Đúng)]
    #step[b) Tiệm cận đứng là $x = -d/c$. Giả thiết cho $x = -1$, suy ra $-d/c = -1 <=> d/c = 1$. (Sai)]
    #step[c) Ta có $a = 2c$ và $d = c$. Hàm số trở thành $y = (2c x + b)/(c x + c) = (2x + b/c)/(x + 1)$.
    Đồ thị đi qua $M(0; 1) => 1 = (0 + b/c)/(0 + 1) <=> b/c = 1$.
    Vậy $y = (2x + 1)/(x + 1)$. (Đúng)]
    #step[d) Tâm đối xứng của đồ thị hàm phân thức bậc 1/bậc 1 là giao điểm của TCĐ và TCN. TCĐ: $x = -1$, TCN: $y = 2$. Tâm đối xứng $I(-1; 2)$. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",
  [Cho hàm số $y = (sqrt(x^2 - 1) + x)/(x^2 - x)$. Xét tính đúng/sai:],
  (
    [Tập xác định của hàm số là $D = (-oo; -1] union [1; +oo)$.],
    True([Đồ thị hàm số có đúng một tiệm cận ngang $y = 0$.]),
    True([Đường thẳng $x = 0$ không phải là tiệm cận đứng.]),
    True([Đồ thị hàm số có đúng một đường tiệm cận đứng là $x = 1$.])
  ),
  loigiai: [
    #step[a) Điều kiện: $x^2 - 1 >= 0 <=> x <= -1$ hoặc $x >= 1$. 
    Đồng thời mẫu số $x^2 - x != 0 <=> x != 0$ và $x != 1$. 
    Kết hợp lại: $D = (-oo; -1] union (1; +oo)$. Mệnh đề a dùng dấu ngoặc vuông $[1; +oo)$ là Sai. (Sai)]
    #step[b) Xét TCN: 
    - Khi $x -> +oo$: $y = (x sqrt(1 - 1/x^2) + x)/(x^2(1 - 1/x)) = (x(1 + 1))/x^2 = 2/x -> 0$. TCN $y = 0$.
    - Khi $x -> -oo$: $y = (-x sqrt(1 - 1/x^2) + x)/(x^2(1 - 1/x)) = (x(-1 + 1))/x^2 = 0$. TCN $y = 0$.
    Vậy có đúng 1 TCN $y = 0$. (Đúng).]
    #step[c) Đường thẳng $x = 0$ không nằm trong các mút của tập xác định và hàm số không được định nghĩa lân cận $x = 0$ (vì từ $-1$ đến $1$ hàm số không xác định). Do đó không có giới hạn khi $x -> 0$. Vậy $x = 0$ không là TCĐ. (Đúng)]
    #step[d) Tại $x = 1$: Do tập xác định là $(1; +oo)$ (bên phải số 1), ta tính $limits(lim)_(x -> 1^+) (sqrt(x^2 - 1) + x)/(x(x - 1))$.
    Tử số tiến đến $1$. Mẫu số tiến đến $0^+$. Vậy giới hạn là $+oo$.
    Do đó $x = 1$ là TCĐ duy nhất. (Đúng)]
  ]
)


#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Tìm số tiệm cận đứng của đồ thị hàm số $y = (x - 2)/(x^2 - 5x + 6)$.],
  [$1$],
  loigiai: [
    #step[Mẫu số $x^2 - 5x + 6 = 0 <=> x = 2$ hoặc $x = 3$.]
    #step[Tử số bằng $0$ tại $x = 2$. Ta phân tích hàm số:
    $y = (x - 2)/((x - 2)(x - 3))$.]
    #step[Với $x != 2$, hàm số trở thành $y = 1/(x - 3)$.]
    #step[Ta tính giới hạn: $limits(lim)_(x -> 2) y = -1 != oo$, nên $x = 2$ không là tiệm cận đứng.]
    #step[$limits(lim)_(x -> 3) y = oo$, nên $x = 3$ là tiệm cận đứng.]
    #step[Vậy đồ thị chỉ có $1$ tiệm cận đứng.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Hàm số $y = (x^2 + 2x + 3)/(x + 1)$ có một tiệm cận xiên là $y = a x + b$. Tính giá trị biểu thức $S = 2a - b$.],
  [$1$],
  loigiai: [
    #step[Chia đa thức: $x^2 + 2x + 3 = x(x + 1) + (x + 1) + 2 = (x + 1)^2 + 2$.]
    #step[Hàm số được viết lại: $y = (x + 1) + 2/(x + 1)$.]
    #step[Khi $x -> oo$, $2/(x + 1) -> 0$. Suy ra phương trình tiệm cận xiên là $y = x + 1$.]
    #step[Đồng nhất hệ số, ta có $a = 1$ và $b = 1$.]
    #step[Giá trị biểu thức $S = 2(1) - 1 = 1$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Đồ thị hàm số $y = (sqrt(x^2 - x) - x)/(x - 1)$ có tất cả bao nhiêu đường tiệm cận?],
  [$3$],
  loigiai: [
    #step[Tập xác định: $x^2 - x >= 0 <=> x <= 0$ hoặc $x >= 1$. Kết hợp mẫu số $x != 1$, ta có $D = (-oo; 0] union (1; +oo)$.]
    #step[Tìm tiệm cận ngang:
    - Khi $x -> +oo$: 
      $y = (sqrt(x^2 - x) - x)/(x - 1) = (x^2 - x - x^2)/((x - 1)(sqrt(x^2 - x) + x)) = -x/((x - 1)(x sqrt(1 - 1/x) + x)) = -1/((1 - 1/x)(sqrt(1 - 1/x) + 1))$.
      Giới hạn là $limits(lim)_(x -> +oo) y = -1/2$. Có TCN $y = -1/2$.
    - Khi $x -> -oo$:
      $y = (|x|sqrt(1 - 1/x) - x)/(x - 1) = (-x(sqrt(1 - 1/x) + 1))/(x(1 - 1/x)) = -(sqrt(1 - 1/x) + 1)/(1 - 1/x)$.
      Giới hạn là $limits(lim)_(x -> -oo) y = -2$. Có TCN $y = -2$.]
    #step[Tìm tiệm cận đứng:
    Mẫu số bằng 0 tại $x = 1$. Ta xét giới hạn một bên khi $x -> 1^+$ (do $x > 1$):
    Tại $x = 1$, tử số tiến tới $sqrt(0) - 1 = -1 < 0$. Mẫu số tiến tới $0^+$.
    Suy ra $limits(lim)_(x -> 1^+) y = -oo$. Vậy $x = 1$ là tiệm cận đứng.]
    #step[Tổng cộng đồ thị có 3 đường tiệm cận.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Cho hàm số $y = f(x) = (2x + 1)/(x - 1)$ có đồ thị $(C)$. Gọi $M$ là một điểm tùy ý nằm trên $(C)$. Tích khoảng cách từ điểm $M$ đến hai đường tiệm cận của $(C)$ bằng bao nhiêu?],
  [$3$],
  loigiai: [
    #step[Đồ thị có tiệm cận đứng $d_1: x = 1 <=> x - 1 = 0$ và tiệm cận ngang $d_2: y = 2 <=> y - 2 = 0$.]
    #step[Lấy điểm $M(m; (2m + 1)/(m - 1))$ thuộc $(C)$ với $m != 1$.]
    #step[Khoảng cách từ $M$ đến tiệm cận đứng $d_1$ là $d(M, d_1) = |m - 1|$.]
    #step[Khoảng cách từ $M$ đến tiệm cận ngang $d_2$ là $d(M, d_2) = lr(|(2m + 1)/(m - 1) - 2|) = lr(|(2m + 1 - 2m + 2)/(m - 1)|) = lr(|3/(m - 1)|) = 3/(|m - 1|)$.]
    #step[Tích hai khoảng cách là: $d(M, d_1) times d(M, d_2) = |m - 1| times 3/(|m - 1|) = 3$.]
    #step[Đây là một kết quả hằng số, không phụ thuộc vào vị trí của điểm $M$.]
  ]
)



// ==================== Đề 2 ====================
#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Cho hàm số $y = (2x^2 - 3x - 1)/(x - 2)$. Tiệm cận xiên của đồ thị hàm số là đường thẳng:],
  (
    [$y = 2x - 1$.],
    True([$y = 2x + 1$.]),
    [$y = 2x - 3$.],
    [$y = 2x + 3$.]
  ),
  loigiai: [
    #step[Thực hiện phép chia đa thức tử cho mẫu, ta có:]
    #step[$2x^2 - 3x - 1 = 2x(x - 2) + x - 1 = 2x(x - 2) + (x - 2) + 1 = (2x + 1)(x - 2) + 1$.]
    #step[Do đó, $y = (2x^2 - 3x - 1)/(x - 2) = 2x + 1 + 1/(x - 2)$.]
    #step[Vì $limits(lim)_(x -> oo) 1/(x - 2) = 0$ nên đường thẳng $y = 2x + 1$ là tiệm cận xiên của đồ thị hàm số.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Biết đồ thị hàm số $y = (x^2 - 2x + 2)/(x - 3)$ có tiệm cận xiên là đường thẳng $y = a x + b$. Tính giá trị của $a^2 + 2b$.],
  (
    [$4$.],
    [$2$.],
    [$5$.],
    True([$3$.])
  ),
  loigiai: [
    #step[Chia tử cho mẫu: $x^2 - 2x + 2 = x(x - 3) + x + 2 = x(x - 3) + (x - 3) + 5 = (x + 1)(x - 3) + 5$.]
    #step[Hàm số được viết lại thành: $y = x + 1 + 5/(x - 3)$.]
    #step[Vậy đường tiệm cận xiên có phương trình là $y = x + 1$.]
    #step[Từ đó suy ra $a = 1$ và $b = 1$.]
    #step[Giá trị biểu thức cần tính là: $a^2 + 2b = 1^2 + 2(1) = 3$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tiệm cận xiên của đồ thị hàm số $y = (x^3 + 2)/(x^2 - 2x)$ cắt hai trục tọa độ tại hai điểm $A$ và $B$. Diện tích tam giác $O A B$ bằng:],
  (
    True([$2$.]),
    [$4$.],
    [$8$.],
    [$3$.]
  ),
  loigiai: [
    #step[Thực hiện phép chia đa thức: $x^3 + 2 = x(x^2 - 2x) + 2x^2 + 2 = x(x^2 - 2x) + 2(x^2 - 2x) + 4x + 2 = (x + 2)(x^2 - 2x) + 4x + 2$.]
    #step[Khi đó $y = x + 2 + (4x + 2)/(x^2 - 2x)$.]
    #step[Vì $limits(lim)_(x -> oo) (4x + 2)/(x^2 - 2x) = 0$, nên đường tiệm cận xiên là $y = x + 2$.]
    #step[Giao điểm của tiệm cận xiên với trục $O x$ (cho $y = 0$): $x + 2 = 0 <=> x = -2 => A(-2; 0)$.]
    #step[Giao điểm của tiệm cận xiên với trục $O y$ (cho $x = 0$): $y = 2 => B(0; 2)$.]
    #step[Diện tích tam giác vuông $O A B$ là $S = 1/2 O A dot O B = 1/2 |-2| dot |2| = 2$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Biết đồ thị hàm số $y = (x^3 + x + 1)/(x^2 - 1)$ có tiệm cận xiên là đường thẳng $d: y = a x + b$. Điểm nào dưới đây thuộc đường thẳng $d$?],
  (
    [$M(-1; 2)$.],
    True([$N(2; 2)$.]),
    [$P(2; -2)$.],
    [$Q(2; -1)$.]
  ),
  loigiai: [
    #step[Thực hiện phép chia đa thức: $x^3 + x + 1 = x(x^2 - 1) + 2x + 1$.]
    #step[Do đó $y = x + (2x + 1)/(x^2 - 1)$.]
    #step[Tiệm cận xiên của đồ thị là đường thẳng $d: y = x$.]
    #step[Thử tọa độ các điểm vào phương trình $y = x$, ta thấy chỉ có điểm $N(2; 2)$ thỏa mãn.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Đường thẳng $y = x + 1$ là tiệm cận xiên của đồ thị hàm số nào dưới đây?],
  (
    [$y = (x - 1)/(x^2 + 1)$.],
    True([$y = (x^2 + 2x + 3)/(x + 1)$.]),
    [$y = (x^2 + 1)/(x - 2)$.],
    [$y = (2x^2 + x + 1)/(2x + 1)$.]
  ),
  loigiai: [
    #step[Kiểm tra từng phương án:]
    #step[- Hàm $y = (x - 1)/(x^2 + 1)$ có TCN là $y = 0$, không có TCX.]
    #step[- Hàm $y = (x^2 + 2x + 3)/(x + 1) = ((x+1)^2 + 2)/(x+1) = x + 1 + 2/(x+1)$. Tiệm cận xiên là $y = x + 1$. Thỏa mãn!]
    #step[- Hàm $y = (x^2 + 1)/(x - 2) = x + 2 + 5/(x - 2)$. TCX là $y = x + 2$.]
    #step[- Hàm $y = (2x^2 + x + 1)/(2x + 1) = x + 1/(2x + 1)$. TCX là $y = x$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Đường tiệm cận xiên của đồ thị hàm số $f(x) = 2x - 1 - 1/(x + 1)$ có phương trình là:],
  (
    [$y = x + 1$.],
    True([$y = 2x - 1$.]),
    [$y = x - 1$.],
    [$y = 2x + 1$.]
  ),
  loigiai: [
    #step[Hàm số đã cho được viết dưới dạng $y = a x + b + R(x)$ với $R(x) = -1/(x + 1)$.]
    #step[Vì $limits(lim)_(x -> oo) R(x) = limits(lim)_(x -> oo) -1/(x + 1) = 0$ nên đường thẳng $y = 2x - 1$ chính là tiệm cận xiên của đồ thị hàm số.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Giao điểm của hai đường tiệm cận của đồ thị hàm số $y = (x^2 + 2x - 3)/(x + 1)$ nằm trên đường thẳng nào sau đây?],
  (
    True([$y = x + 1$.]),
    [$y = x - 1$.],
    [$y = 2x + 1$.],
    [$y = -x - 1$.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {-1}$.]
    #step[Tiệm cận đứng: $x = -1$ (vì $x = -1$ là nghiệm của mẫu nhưng không là nghiệm của tử).]
    #step[Chia đa thức: $x^2 + 2x - 3 = x(x + 1) + x - 3 = x(x + 1) + 1(x + 1) - 4 = (x + 1)^2 - 4$.]
    #step[Suy ra $y = x + 1 - 4/(x + 1)$. Tiệm cận xiên là đường thẳng $y = x + 1$.]
    #step[Giao điểm của TCĐ $x = -1$ và TCX $y = x + 1$ là $I(-1; 0)$.]
    #step[Kiểm tra các đáp án: điểm $I(-1; 0)$ thỏa mãn phương trình $y = x + 1$ vì $0 = -1 + 1$. Vậy $I$ nằm trên đường thẳng $y = x + 1$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm khoảng cách $d$ từ gốc tọa độ $O$ đến tiệm cận xiên của đồ thị hàm số $y = (2x^2 - x + 1)/(x - 1)$.],
  (
    [$d = 1/sqrt(2)$.],
    True([$d = 1/sqrt(5)$.]),
    [$d = 2/sqrt(5)$.],
    [$d = 3/sqrt(5)$.]
  ),
  loigiai: [
    #step[Thực hiện phép chia: $y = (2x^2 - x + 1)/(x - 1) = (2x(x - 1) + x + 1)/(x - 1) = (2x(x - 1) + (x - 1) + 2)/(x - 1) = 2x + 1 + 2/(x - 1)$.]
    #step[Tiệm cận xiên là $d: y = 2x + 1 <=> 2x - y + 1 = 0$.]
    #step[Khoảng cách từ gốc $O(0; 0)$ đến $d$ là $d(O, d) = |2(0) - 0 + 1| / sqrt(2^2 + (-1)^2) = 1/sqrt(5)$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Số đường tiệm cận của đồ thị hàm số $y = (sqrt(x + 9) - 3)/(x^2 - 2x)$ là:],
  (
    [$1$.],
    True([$2$.]),
    [$3$.],
    [$4$.]
  ),
  loigiai: [
    #step[Tập xác định: $x + 9 >= 0 <=> x >= -9$. Mẫu số khác $0 => x != 0$ và $x != 2$.]
    #step[Tiệm cận ngang: $limits(lim)_(x -> +oo) (sqrt(x + 9) - 3)/(x^2 - 2x) = 0$. Có 1 TCN là $y = 0$.]
    #step[Tiệm cận đứng:]
    #step[- Tại $x = 2$: $limits(lim)_(x -> 2) y = (sqrt(11) - 3)/0 = oo$. Vậy $x = 2$ là 1 TCĐ.]
    #step[- Tại $x = 0$: $limits(lim)_(x -> 0) (sqrt(x + 9) - 3)/(x(x - 2)) = limits(lim)_(x -> 0) (x + 9 - 9)/(x(x - 2)(sqrt(x + 9) + 3)) = limits(lim)_(x -> 0) 1/((x - 2)(sqrt(x + 9) + 3)) = 1/(-2(3 + 3)) = -1/12$. Giới hạn hữu hạn nên $x = 0$ không là TCĐ.]
    #step[Vậy đồ thị có tổng cộng 2 đường tiệm cận ($x=2$ và $y=0$).]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số $y = (x^2 - m x + 1)/(x - 1)$ có tiệm cận xiên tạo với hai trục tọa độ một tam giác có diện tích bằng $2$.],
  (
    True([$m = -1$ hoặc $m = 3$.]),
    [$m = -1$ hoặc $m = 5$.],
    [$m = 3$ hoặc $m = -5$.],
    [$m = 1$ hoặc $m = 5$.]
  ),
  loigiai: [
    #step[Chia tử cho mẫu: $x^2 - m x + 1 = x(x - 1) + (1-m)x + 1 = x(x - 1) + (1-m)(x - 1) + 2 - m$.]
    #step[Suy ra $y = x + 1 - m + (2 - m)/(x - 1)$.]
    #step[Điều kiện để có tiệm cận xiên là phần dư khác $0 <=> 2 - m != 0 <=> m != 2$.]
    #step[Khi đó TCX là $d: y = x + 1 - m$.]
    #step[Giao của $d$ với $O x$: Cho $y = 0 => x = m - 1 => A(m - 1; 0)$.]
    #step[Giao của $d$ với $O y$: Cho $x = 0 => y = 1 - m => B(0; 1 - m)$.]
    #step[Diện tích tam giác $O A B$ là $S = 1/2 O A dot O B = 1/2 |m - 1| dot |1 - m| = 1/2 (m - 1)^2$.]
    #step[Đề bài cho $S = 2 <=> 1/2 (m - 1)^2 = 2 <=> (m - 1)^2 = 4 <=> m - 1 = 2$ hoặc $m - 1 = -2$.]
    #step[Suy ra $m = 3$ hoặc $m = -1$.]
  ]
)


#my-ds(de: "Đề 2", 
  dir: "doc",
  [Cho hàm số $y = (2x^2 + x - 3)/(x - 1)$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    [Đồ thị hàm số có đường tiệm cận đứng là $x = 1$.],
    True([Đồ thị hàm số là một đường thẳng bị khuyết một điểm.]),
    [Hàm số có đường tiệm cận xiên là $y = 2x + 3$.],
    True([Giới hạn $limits(lim)_(x -> 1) y = 5$.])
  ),
  loigiai: [
    #step[a) Ta có tử số $2x^2 + x - 3 = (x - 1)(2x + 3)$. Rút gọn $y = ((x - 1)(2x + 3))/(x - 1) = 2x + 3$ (với điều kiện $x != 1$). Giới hạn tại $x = 1$ là hữu hạn nên $x = 1$ không phải là TCĐ. (Sai)]
    #step[b) Đồ thị hàm số là phần của đường thẳng $y = 2x + 3$ nhưng bỏ đi điểm $(1; 5)$ do tập xác định $x != 1$. (Đúng)]
    #step[c) Vì hàm số thực chất là đường thẳng $y = 2x + 3$ (bị thủng một lỗ), nên nó không có tiệm cận xiên. Các khái niệm tiệm cận chỉ áp dụng cho hàm số tiến ra vô cực hoặc có điểm kỳ dị mà tại đó giới hạn là vô cực. (Sai)]
    #step[d) $limits(lim)_(x -> 1) (2x^2 + x - 3)/(x - 1) = limits(lim)_(x -> 1) (2x + 3) = 5$. (Đúng)]
  ]
)

#my-ds(de: "Đề 2", 
  dir: "doc",
  [Cho hàm số $y = (x^2 - x + 2)/(x + 1)$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Đồ thị hàm số có một đường tiệm cận đứng là $x = -1$.]),
    True([Đường tiệm cận xiên của đồ thị hàm số đi qua điểm $A(2; 0)$.]),
    [Tâm đối xứng của đồ thị là điểm $I(-1; 3)$.],
    True([Khoảng cách từ điểm $M(0; 2)$ trên đồ thị đến đường tiệm cận đứng bằng $1$.])
  ),
  loigiai: [
    #step[a) Tại $x = -1$, tử số bằng $4 != 0$, mẫu số bằng $0$. Vậy $x = -1$ là tiệm cận đứng. (Đúng)]
    #step[b) Chia đa thức: $x^2 - x + 2 = x(x + 1) - 2x + 2 = x(x + 1) - 2(x + 1) + 4 = (x - 2)(x + 1) + 4$.
    Suy ra $y = x - 2 + 4/(x + 1)$. Tiệm cận xiên là $y = x - 2$. 
    Thay $x = 2$ vào TCX: $y = 2 - 2 = 0$. Vậy TCX đi qua $A(2; 0)$. (Đúng)]
    #step[c) Tâm đối xứng là giao điểm của TCĐ và TCX. Thay $x = -1$ vào TCX: $y = -1 - 2 = -3$. Tâm đối xứng là $I(-1; -3)$. (Sai)]
    #step[d) Khoảng cách từ điểm $M(0; 2)$ đến đường thẳng $x = -1$ (hay $x + 1 = 0$) là $d = |0 + 1|/1 = 1$. (Đúng)]
  ]
)

#my-ds(de: "Đề 2", 
  dir: "doc",lines: 2,
  [Cho hàm số $y = f(x)$ xác định trên $D = RR \\ {-1; 1}$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'$,
        func: $f$,
        x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
        d-signs: ("-", "||", "-", "0", "+", "||", "+"),
        v-vals: ($2$, ($-oo$, $+oo$), $3$, ($+oo$, $-oo$), $2$),
        // ranks: (1, (-1, 2), 1, (2, -1), 1)
      )
    ]
  Xét tính đúng/sai:],
  (
    [Đồ thị hàm số không có tiệm cận ngang.],
    True([Đồ thị hàm số có đúng hai đường tiệm cận đứng là $x = -1$ và $x = 1$.]),
    True([Tổng số đường tiệm cận của đồ thị hàm số là $3$.]),
    [Giá trị cực tiểu của hàm số lớn hơn giá trị của tiệm cận ngang.]
  ),
  loigiai: [
    #step[a) Từ bảng biến thiên: $limits(lim)_(x -> -oo) f(x) = 2$ và $limits(lim)_(x -> +oo) f(x) = 2$. Đồ thị có tiệm cận ngang $y = 2$. (Sai)]
    #step[b) Giới hạn tại $x = -1$: $limits(lim)_(x -> -1^-) f(x) = -oo$ và $limits(lim)_(x -> -1^+) f(x) = +oo$ nên $x = -1$ là TCĐ.
    Giới hạn tại $x = 1$: $limits(lim)_(x -> 1^-) f(x) = +oo$ và $limits(lim)_(x -> 1^+) f(x) = -oo$ nên $x = 1$ là TCĐ. (Đúng)]
    #step[c) Tổng số tiệm cận là 1 (ngang) + 2 (đứng) = 3 đường. (Đúng)]
    #step[d) Hàm số đạt cực tiểu tại $x = 0$, $y_("CT") = 3$. Giá trị tiệm cận ngang là $y = 2$. $3 > 2$. (Đúng)]
  ]
)

#my-ds(de: "Đề 2", 
  dir: "doc",lines: 4,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-3.5, 0), (2.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -2.5), (0, 2.5), stroke: 0.8pt, mark: (end: "stealth"))
    content((2.3, -0.3), $x$)
    content((-0.3, 2.3), $y$)
    content((-0.3, -0.3), $O$)
    
    // TCD x = -1
    line((-1, -2.5), (-1, 2.5), stroke: (dash: "dashed", paint: red))
    // TCX y = x + 1
    line((-3.5, -2.5), (1.5, 2.5), stroke: (dash: "dashed", paint: red))
    
    // Curves (Hàm phân thức bậc 2 / bậc 1 chuẩn: y = x + 1 + 1/(x + 1))
    // Right branch
    line(..range(0, 41).map(i => {
      let x = -0.7 + i * (2.5 - (-0.7)) / 40
      let y = x + 1 + 1.0 / (x + 1)
      (x, y)
    }).filter(p => p.at(1) <= 2.5 and p.at(1) >= -2.5), stroke: 1.2pt + blue)
    
    // Left branch
    line(..range(0, 41).map(i => {
      let x = -3.5 + i * (-1.3 - (-3.5)) / 40
      let y = x + 1 + 1.0 / (x + 1)
      (x, y)
    }).filter(p => p.at(1) <= 2.5 and p.at(1) >= -2.5), stroke: 1.2pt + blue)
    
    content((-1.6, -2.2), text(fill: red)[$x=-1$])
    content((1.2, 2.5), text(fill: red)[$y=x+1$])
    // Mark intersection (0, 2)
    circle((0, 2), radius: 0.05, fill: black)
    content((-0.3, 1.8), $2$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Cho hàm số $f(x) = (a x^2 + b x + c)/(x + n)$ (với $a, b, c, n in RR$, $a != 0$) có đồ thị như hình vẽ. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Đường tiệm cận đứng của đồ thị hàm số là $x = -1$.]),
    True([Giá trị của biểu thức $a + b + c$ bằng $5$.]),
    [Điểm cực đại của đồ thị hàm số là $M(0; 2)$.],
    True([Có đúng $3$ giá trị nguyên của tham số $m$ để phương trình $f(x) = m$ vô nghiệm.])
  ),
  loigiai: [
    #step[a) Quan sát đồ thị, ta thấy đường thẳng $x = -1$ là đường tiệm cận đứng. (Đúng)]
    #step[b) Từ TCĐ $x = -1 => n = 1$. Đồ thị có tiệm cận xiên đi qua $(-1; 0)$ và $(0; 1)$ nên phương trình TCX là $y = x + 1$. 
    Mặt khác, $f(x) = (a x^2 + b x + c)/(x + 1) = a x + b - a + (c - b + a)/(x + 1)$.
    Suy ra TCX là $y = a x + b - a$. Đồng nhất hệ số ta được $a = 1$ và $b - a = 1 => b = 2$.
    Đồ thị cắt trục tung tại điểm $(0; 2)$ nên $f(0) = 2 <=> c/1 = 2 => c = 2$.
    Vậy $a + b + c = 1 + 2 + 2 = 5$. (Đúng)]
    #step[c) Hàm số là $y = (x^2 + 2x + 2)/(x + 1) = x + 1 + 1/(x + 1)$. 
    Đạo hàm $y' = 1 - 1/(x + 1)^2$. $y' = 0 <=> (x + 1)^2 = 1 <=> x = 0$ hoặc $x = -2$.
    Quan sát đồ thị hoặc lập BBT, ta thấy $x = 0$ là điểm cực tiểu, $x = -2$ là điểm cực đại. Do đó $M(0; 2)$ là điểm cực tiểu. (Sai)]
    #step[d) Dựa vào đồ thị, giá trị cực đại là $y_("CĐ") = f(-2) = -2$, giá trị cực tiểu là $y_("CT") = f(0) = 2$.
    Phương trình $f(x) = m$ vô nghiệm khi đường thẳng $y = m$ không cắt đồ thị, tức là nằm giữa hai cực trị: $-2 < m < 2$.
    Vì $m in ZZ$ nên $m in {-1; 0; 1}$. Có đúng $3$ giá trị nguyên thỏa mãn. (Đúng)]
  ]
)


#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Tìm tọa độ tung độ $y_0$ của tâm đối xứng của đồ thị hàm số $y = (x^2 + 3x + 3)/(x + 1)$.],
  [$1$],
  loigiai: [
    #step[Tiệm cận đứng của đồ thị là $x = -1$.]
    #step[Phép chia: $x^2 + 3x + 3 = x(x + 1) + 2x + 3 = x(x + 1) + 2(x + 1) + 1 = (x + 2)(x + 1) + 1$.]
    #step[Tiệm cận xiên là đường thẳng $y = x + 2$.]
    #step[Tâm đối xứng là giao của hai tiệm cận. Thay $x = -1$ vào TCX: $y = -1 + 2 = 1$.]
    #step[Tung độ tâm đối xứng $y_0 = 1$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Cho hàm số $y = (a x^2 + b x + c)/(x + n)$ có đồ thị $(C)$ nhận đường thẳng $x = 2$ làm tiệm cận đứng và đường thẳng $y = x - 3$ làm tiệm cận xiên. Tính giá trị $b + n$.],
  [$-7$],
  loigiai: [
    #step[Vì $x = 2$ là tiệm cận đứng nên nghiệm của mẫu là $2 => 2 + n = 0 <=> n = -2$.]
    #step[Hàm số có dạng $y = (a x^2 + b x + c)/(x - 2)$.]
    #step[Chia đa thức: $a x^2 + b x + c = a x(x - 2) + (2a + b)x + c = a x(x - 2) + (2a + b)(x - 2) + 2(2a + b) + c$.]
    #step[Thương là $y = a x + 2a + b$. Đây chính là phương trình tiệm cận xiên.]
    #step[Đồng nhất hệ số với tiệm cận xiên $y = x - 3$, ta có hệ:
    $cases(
      a = 1,
      2a + b = -3
    ) => cases(
      a = 1,
      2(1) + b = -3 => b = -5
    )$]
    #step[Vậy $b + n = -5 + (-2) = -7$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Cho hàm số $y = (2x + 1)/(x - 1)$. Khoảng cách ngắn nhất giữa hai điểm bất kỳ thuộc hai nhánh của đồ thị hàm số bằng $sqrt(a)$. Tìm số nguyên $a$.],
  [$24$],
  loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = 1$ và tiệm cận ngang $y = 2$. Tâm đối xứng là $I(1; 2)$.]
    #step[Khoảng cách từ điểm $M(x; (2x + 1)/(x - 1))$ đến $I(1; 2)$ bình phương là:
    $I M^2 = (x - 1)^2 + ((2x + 1)/(x - 1) - 2)^2 = (x - 1)^2 + (3/(x - 1))^2$.]
    #step[Áp dụng bất đẳng thức AM-GM: $(x - 1)^2 + 9/(x - 1)^2 >= 2sqrt(9) = 6$.]
    #step[Suy ra $I M >= sqrt(6)$.]
    #step[Khoảng cách ngắn nhất giữa hai điểm trên hai nhánh là $2 I M_("min") = 2sqrt(6) = sqrt(24)$.]
    #step[Vậy $a = 24$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Tìm số đường tiệm cận của đồ thị hàm số $y = (x - 1)/(x^2 - 1) + sqrt(x^2 - 4)/x$.],
  [$2$],
  loigiai: [
    #step[Tập xác định: $x^2 - 4 >= 0 <=> x <= -2$ hoặc $x >= 2$. 
    Hàm phân thức $x^2 - 1 != 0 <=> x != +-1$, luôn đúng trên miền xác định.
    Vậy $D = (-oo; -2] union [2; +oo)$.]
    #step[Tiệm cận ngang: 
    - Khi $x -> +oo$: $y = (x - 1)/(x^2 - 1) + (x sqrt(1 - 4/x^2))/x = 1/(x + 1) + sqrt(1 - 4/x^2) -> 0 + 1 = 1$. TCN $y = 1$.
    - Khi $x -> -oo$: $y = (x - 1)/(x^2 - 1) + (-x sqrt(1 - 4/x^2))/x = 1/(x + 1) - sqrt(1 - 4/x^2) -> 0 - 1 = -1$. TCN $y = -1$.]
    #step[Tiệm cận đứng: Hàm số chỉ có mẫu số là $x^2 - 1$ và $x$. Các điểm làm mẫu bằng 0 ($x=1, x=-1, x=0$) đều không thuộc tập xác định và không nằm ở lân cận của tập xác định. Do đó không có tiệm cận đứng.]
    #step[Tổng số đường tiệm cận là 2.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Biết đồ thị hàm số $y = (m x^2 + 3x - 1)/(x + 2)$ có đường tiệm cận xiên $d$. Tìm $m$ để đường thẳng $d$ song song với đường thẳng $y = 2x + 1$.],
  [$2$],
  loigiai: [
    #step[Điều kiện để có TCX là tử có bậc 2 ($m != 0$) và $x = -2$ không là nghiệm tử.]
    #step[Chia đa thức: $m x^2 + 3x - 1 = m x(x + 2) + (3 - 2m)x - 1 = m x(x + 2) + (3 - 2m)(x + 2) - 2(3 - 2m) - 1$.]
    #step[Thương là $y = m x + 3 - 2m$. Đây chính là TCX $d$.]
    #step[Để $d$ song song với $y = 2x + 1$ thì hệ số góc phải bằng nhau và tung độ gốc khác nhau.]
    #step[$cases(m = 2, 3 - 2m != 1) <=> cases(m = 2, 3 - 4 != 1 " (luôn đúng)")$.]
    #step[Vậy $m = 2$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Một công ty sản xuất một loại chip điện tử. Chi phí trung bình để sản xuất $x$ con chip (đơn vị: nghìn con) được tính bởi hàm số $C(x) = 2x + 15 + 30/x$ (triệu đồng). Khi số lượng chip sản xuất ra ngày càng lớn ($x -> +oo$) thì chi phí trung bình sản xuất mỗi con chip tiệm cận tới mức biểu diễn bởi đường thẳng $y = a x + b$. Tính $a + b$.],
  [$17$],
  loigiai: [
    #step[Đường tiệm cận mà hàm chi phí hướng tới khi $x -> +oo$ chính là tiệm cận xiên của đồ thị hàm số $C(x)$.]
    #step[Ta có $C(x) = 2x + 15 + 30/x$.]
    #step[Vì $limits(lim)_(x -> +oo) 30/x = 0$, nên tiệm cận xiên của đồ thị là đường thẳng $y = 2x + 15$.]
    #step[Đồng nhất hệ số, ta có $a = 2$ và $b = 15$.]
    #step[Tổng $a + b = 2 + 15 = 17$.]
  ]
)



// ==================== Đề 3 ====================
#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Giá trị $m$ để đường tiệm cận đứng của đồ thị hàm số $y = (2x + 2m - 1)/(x + m)$ đi qua điểm $M(3; 1)$ là],
  (
    True([$m = -3$.]),
    [$m = -1$.],
    [$m = 2$.],
    [$m = 3$.]
  ),
  loigiai: [
    #step[Điều kiện để đồ thị hàm số có tiệm cận đứng là $x = -m$ không phải là nghiệm của tử số, tức là $2(-m) + 2m - 1 != 0 <=> -1 != 0$ (luôn đúng).]
    #step[Do đó, phương trình tiệm cận đứng là $x = -m$.]
    #step[Tiệm cận đứng đi qua điểm $M(3; 1)$ nên $x_M = -m <=> 3 = -m <=> m = -3$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số $y = (2x + 4)/(x - m)$ có tiệm cận đứng.],
  (
    [$m > -2$.],
    [$m = -2$.],
    [$m < -2$.],
    True([$m != -2$.])
  ),
  loigiai: [
    #step[Để đồ thị hàm phân thức bậc 1 / bậc 1 có tiệm cận đứng thì nghiệm của mẫu không được làm triệt tiêu tử số (không là nghiệm của tử).]
    #step[Nghiệm của mẫu là $x = m$.]
    #step[Thay $x = m$ vào tử số ta được: $2m + 4 != 0 <=> m != -2$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Số các giá trị nguyên của tham số $m$ thuộc $[-20; 20]$ để đồ thị hàm số $y = (2x + 4)/(x - m)$ có đường tiệm cận đứng nằm bên trái trục tung là],
  (
    [$20$.],
    True([$19$.]),
    [$21$.],
    [$18$.]
  ),
  loigiai: [
    #step[Để đồ thị có tiệm cận đứng thì $m != -2$. Khi đó tiệm cận đứng là $x = m$.]
    #step[Để tiệm cận đứng nằm bên trái trục tung thì $m < 0$.]
    #step[Kết hợp điều kiện, ta có $m < 0$ và $m != -2$.]
    #step[Vì $m in ZZ$ và $m in [-20; 20]$ nên $m in {-20, -19, ..., -3, -1}$.]
    #step[Số lượng giá trị của $m$ là $20 - 1 = 19$ giá trị.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Có bao nhiêu giá trị nguyên $m in [-10; 10]$ sao cho đồ thị hàm số $y = (x - 1)/(x^2 + 4x - m - 3)$ có đúng hai đường tiệm cận đứng?],
  (
    [$19$.],
    [$15$.],
    True([$16$.]),
    [$17$.]
  ),
  loigiai: [
    #step[Để đồ thị có đúng 2 tiệm cận đứng thì phương trình mẫu số $g(x) = x^2 + 4x - m - 3 = 0$ phải có 2 nghiệm phân biệt khác $1$.]
    #step[Điều kiện 1: $Delta' > 0 <=> 2^2 - 1(-m - 3) > 0 <=> 4 + m + 3 > 0 <=> m > -7$.]
    #step[Điều kiện 2: $g(1) != 0 <=> 1^2 + 4(1) - m - 3 != 0 <=> 2 - m != 0 <=> m != 2$.]
    #step[Vậy $m > -7$ và $m != 2$.]
    #step[Do $m in [-10; 10]$ và $m in ZZ$ nên $m in {-6, -5, ..., 1, 3, ..., 10}$.]
    #step[Số lượng giá trị là $(10 - (-6) + 1) - 1 = 17 - 1 = 16$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Biết đồ thị hàm số $y = ((2m - n)x^2 + m x + 1)/(x^2 + m x + n - 6)$ nhận trục hoành và trục tung làm hai đường tiệm cận. Giá trị $m + n$ là],
  (
    [$8$.],
    True([$9$.]),
    [$6$.],
    [$-6$.]
  ),
  loigiai: [
    #step[Trục hoành là đường thẳng $y = 0$. Để TCN là $y = 0$ thì giới hạn khi $x -> oo$ phải bằng 0. Do tử và mẫu đều có bậc tối đa là 2, hệ số của $x^2$ ở tử phải bằng 0: $2m - n = 0 <=> n = 2m$.]
    #step[Khi đó hàm số trở thành $y = (m x + 1)/(x^2 + m x + 2m - 6)$.]
    #step[Trục tung là đường thẳng $x = 0$. Để $x = 0$ là TCĐ thì $x = 0$ phải là nghiệm của mẫu số $=> 0^2 + m(0) + 2m - 6 = 0 <=> 2m - 6 = 0 <=> m = 3$.]
    #step[Từ đó $n = 2(3) = 6$.]
    #step[Thử lại với $m=3, n=6$: $y = (3x + 1)/(x^2 + 3x)$. Mẫu có nghiệm $x=0, x=-3$. Tại $x=0$ tử số bằng 1 $!=0$ nên $x=0$ đúng là TCĐ. TCN là $y=0$ đúng.]
    #step[Vậy $m + n = 3 + 6 = 9$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Số giá trị nguyên của tham số $m$ sao cho đồ thị hàm số $y = sqrt(x + 1)/(x^2 - 2x + m)$ có đúng ba đường tiệm cận là:],
  (
    [$5$.],
    [Vô số.],
    True([$4$.]),
    [$3$.]
  ),
  loigiai: [
    #step[Tập xác định: $x >= -1$ và $x^2 - 2x + m != 0$.]
    #step[Xét TCN: $limits(lim)_(x -> +oo) sqrt(x + 1)/(x^2 - 2x + m) = 0$. Luôn có 1 TCN là $y = 0$.]
    #step[Để đồ thị có đúng 3 đường tiệm cận thì cần có đúng 2 TCĐ. Tức là phương trình $g(x) = x^2 - 2x + m = 0$ phải có 2 nghiệm phân biệt thỏa mãn điều kiện $x >= -1$ (để nằm trong TXĐ) và không triệt tiêu hoàn toàn căn ở tử số.
    Chú ý: Tại $x = -1$, tử số bằng $0$. Nếu $x=-1$ là nghiệm của mẫu (tức $g(-1)=0 <=> m=-3$) thì $g(x) = x^2 - 2x - 3 = (x+1)(x-3)$. Khi đó $y = sqrt(x+1)/((x+1)(x-3)) = 1/(sqrt(x+1)(x-3))$. Lân cận $x=-1^+$, $y -> -oo$, nên $x=-1$ vẫn là TCĐ!
    Vậy chỉ cần $g(x)=0$ có 2 nghiệm phân biệt lớn hơn hoặc bằng $-1$.]
    #step[Điều kiện 1: $Delta' = 1 - m > 0 <=> m < 1$.]
    #step[Điều kiện 2: Hai nghiệm $x_1 < x_2$. Cần $x_1 >= -1 <=> cases(x_1 + x_2 > -2, (x_1 + 1)(x_2 + 1) >= 0) <=> cases(2 > -2 " (luôn đúng)", x_1 x_2 + (x_1 + x_2) + 1 >= 0) <=> m + 2 + 1 >= 0 <=> m >= -3$.]
    #step[Kết hợp điều kiện: $-3 <= m < 1$. Mà $m in ZZ$ nên $m in {-3, -2, -1, 0}$.]
    #step[Có $4$ giá trị nguyên của $m$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Có bao nhiêu giá trị nguyên dương của tham số $m$ để đồ thị hàm số $y = (x^2 - 4x + 3)/(x^2 - m x + 4)$ có đúng một đường tiệm cận đứng?],
  (
    [$1$.],
    [$3$.],
    True([$2$.]),
    [$4$.]
  ),
  loigiai: [
    #step[Tử số có nghiệm $x = 1$ và $x = 3$.]
    #step[Để đồ thị có đúng 1 TCĐ, phương trình mẫu $g(x) = x^2 - m x + 4 = 0$ (1) có thể xảy ra các trường hợp sau:]
    #step[- TH1: (1) có nghiệm kép khác nghiệm tử.
    $Delta = m^2 - 16 = 0 <=> m = 4$ hoặc $m = -4$. 
    Vì đề yêu cầu $m$ nguyên dương nên $m = 4$. Khi đó nghiệm kép là $x = 2$ (khác 1 và 3). Thỏa mãn. Có 1 TCĐ là $x=2$.]
    #step[- TH2: (1) có 2 nghiệm phân biệt, trong đó có một nghiệm trùng với nghiệm tử và bị triệt tiêu hoàn toàn, nghiệm còn lại khác nghiệm tử.
    Nếu $x = 1$ là nghiệm của (1) thì $1 - m + 4 = 0 <=> m = 5$. 
    Khi $m=5$, mẫu là $x^2 - 5x + 4 = (x-1)(x-4)$. 
    $y = ((x-1)(x-3))/((x-1)(x-4)) = (x-3)/(x-4)$ (với $x != 1$). TCĐ duy nhất là $x = 4$. Thỏa mãn $m=5$.]
    #step[- TH3: Nếu $x = 3$ là nghiệm của (1) thì $9 - 3m + 4 = 0 <=> m = 13/3$ (loại vì không nguyên).]
    #step[Vậy $m in {4, 5}$. Có $2$ giá trị nguyên dương.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Cho hàm số $y = (x - 2)/(x^2 - 2m x + m + 2)$. Biết đồ thị hàm số không có đường tiệm cận đứng khi $m in (a; b)$. Giá trị của $a b$ là],
  (
    [$-3$.],
    True([$-2$.]),
    [$2$.],
    [$0$.]
  ),
  loigiai: [
    #step[Để đồ thị hàm phân thức có bậc tử là 1, bậc mẫu là 2 không có đường tiệm cận đứng, thì phương trình mẫu số $g(x) = x^2 - 2m x + m + 2 = 0$ phải vô nghiệm hoặc có nghiệm kép $x = 2$.]
    #step[Trường hợp 1: $g(x) = 0$ vô nghiệm.
    $Delta' = m^2 - (m + 2) < 0 <=> m^2 - m - 2 < 0 <=> -1 < m < 2$.]
    #step[Trường hợp 2: $g(x) = 0$ có nghiệm kép $x = 2$.
    $g(x) = (x - 2)^2 = x^2 - 4x + 4$.
    Đồng nhất hệ số: $cases(-2m = -4 => m = 2, m + 2 = 4 => m = 2)$.
    Vậy $m = 2$ thỏa mãn. (Khi đó $y = (x - 2)/(x - 2)^2 = 1/(x - 2)$, hàm số có TCĐ $x = 2$, vậy m = 2 KHÔNG thỏa mãn yêu cầu là không có TCĐ! Tại nghiệm kép nó triệt tiêu 1 bậc và còn dư 1 bậc ở mẫu. Do đó đồ thị vẫn có TCĐ).
    Nên trường hợp 2 không thỏa mãn.]
    #step[Vậy khoảng giá trị của $m$ là $(-1; 2)$.]
    #step[Suy ra $a = -1$, $b = 2 => a b = -2$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Tìm số lượng các giá trị nguyên dương của tham số $m$ để đồ thị hàm số $y = (m x^3 + x - 1)/(x^2 + x - 2)$ có tiệm cận xiên.],
  (
    [$0$.],
    [$1$.],
    True([Vô số.]),
    [Các đáp án trên đều sai.]
  ),
  loigiai: [
    #step[Để đồ thị hàm phân thức có đường tiệm cận xiên thì bậc của tử phải lớn hơn bậc của mẫu đúng 1 bậc.]
    #step[Mẫu có bậc 2, tử số có dạng $m x^3 + x - 1$.]
    #step[Nếu $m != 0$, tử số có bậc 3. Do $3 - 2 = 1$, hàm số sẽ có tiệm cận xiên.]
    #step[Đề hỏi $m$ nguyên dương nên $m in {1, 2, 3, ...}$, tức là có vô số giá trị $m$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "ngang",
  [Biết rằng với mọi giá trị của tham số $m != 0$, đường tiệm cận xiên của đồ thị hàm số $y = (m x^2 + (m - 1)x - 2)/(x + 1)$ luôn đi qua một điểm cố định $I(x_0; y_0)$. Tính $x_0 + y_0$.],
  (
    [$-2$.],
    [$0$.],
    [$1$.],
    True([$-1$.])
  ),
  loigiai: [
    #step[Chia đa thức: $m x^2 + (m - 1)x - 2 = m x(x + 1) - x - 2 = m x(x + 1) - 1(x + 1) - 1$.]
    #step[Hàm số viết lại thành $y = m x - 1 - 1/(x + 1)$.]
    #step[Đường tiệm cận xiên là $d: y = m x - 1$.]
    #step[Để $d$ luôn đi qua điểm $I(x_0; y_0)$ cố định với mọi $m$, ta có $y_0 = m x_0 - 1 <=> m x_0 - (y_0 + 1) = 0, forall m$.]
    #step[Điều này xảy ra khi và chỉ khi $cases(x_0 = 0, y_0 + 1 = 0) <=> cases(x_0 = 0, y_0 = -1)$.]
    #step[Điểm cố định là $I(0; -1)$.]
    #step[Vậy $x_0 + y_0 = 0 + (-1) = -1$.]
  ]
)


#my-ds(de: "Đề 3", 
  dir: "doc",
  [Cho hàm số $y = (m x^2 + 2x - 1)/(x - 2)$ với $m$ là tham số. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Khi $m = 0$, đồ thị hàm số có tiệm cận xiên.],
    True([Khi $m = 1$, đường tiệm cận xiên của đồ thị có phương trình $y = x + 4$.]),
    [Mọi $m != 0$, đồ thị hàm số luôn có một đường tiệm cận đứng là $x = 2$.],
    True([Tồn tại giá trị của $m$ để tiệm cận xiên vuông góc với đường thẳng $y = x$.])
  ),
  loigiai: [
    #step[a) Khi $m = 0$, $y = (2x - 1)/(x - 2)$. Bậc tử bằng bậc mẫu, đồ thị có TCN $y = 2$, không có TCX. (Sai)]
    #step[b) Khi $m = 1$, $y = (x^2 + 2x - 1)/(x - 2) = (x(x - 2) + 4x - 1)/(x - 2) = (x(x - 2) + 4(x - 2) + 7)/(x - 2) = x + 4 + 7/(x - 2)$. Tiệm cận xiên là $y = x + 4$. (Đúng)]
    #step[c) Tại $x = 2$, tử số là $4m + 4 - 1 = 4m + 3$. Để $x = 2$ không là TCĐ thì $4m + 3 = 0 <=> m = -3/4$. Do đó với $m = -3/4 != 0$, đồ thị KHÔNG có TCĐ. (Sai)]
    #step[d) Khi $m != 0$, chia đa thức: $m x^2 + 2x - 1 = m x(x - 2) + (2m + 2)x - 1 = m x(x - 2) + (2m + 2)(x - 2) + 4m + 3$.
    Phương trình TCX là $y = m x + 2m + 2$.
    Để TCX vuông góc với $y = x$, tích hệ số góc phải bằng $-1 <=> m dot 1 = -1 <=> m = -1$. Có tồn tại. (Đúng)]
  ]
)

#my-ds(de: "Đề 3", 
  dir: "doc",
  [Cho hàm số $y = sqrt(x^2 - m x + 1) - x$. Xét tính đúng sai của các mệnh đề:],
  (
    [Khi $m = 0$, đồ thị hàm số có hai đường tiệm cận ngang.],
    True([Khi $m = 2$, đồ thị hàm số có tiệm cận ngang $y = -1$.]),
    True([Đồ thị hàm số luôn có tiệm cận xiên khi $x -> -oo$.]),
    [Đồ thị hàm số có thể có tiệm cận đứng với một số giá trị $m$.]
  ),
  loigiai: [
    #step[a) Khi $m = 0$, $y = sqrt(x^2 + 1) - x$. 
    Khi $x -> +oo$, $y = (x^2 + 1 - x^2)/(sqrt(x^2 + 1) + x) = 1/(sqrt(x^2 + 1) + x) -> 0$. TCN $y = 0$.
    Khi $x -> -oo$, $y -> +oo - (-oo) = +oo$ nên không có TCN. Chỉ có 1 TCN $y=0$. (Sai)]
    #step[b) Khi $m = 2$, $y = sqrt(x^2 - 2x + 1) - x = |x - 1| - x$.
    Khi $x -> +oo$, $x > 1 => y = x - 1 - x = -1$. TCN là $y = -1$. (Đúng)]
    #step[c) Xét khi $x -> -oo$, ta có $y = sqrt(x^2(1 - m/x + 1/x^2)) - x = |x| sqrt(1 - m/x + 1/x^2) - x$.
    Do $x < 0$, $|x| = -x$.
    $y = -x sqrt(1 - m/x + 1/x^2) - x = -x (sqrt(1 - m/x + 1/x^2) + 1)$.
    Giới hạn $y/x = - (1 + 1) = -2$.
    $limits(lim)_(x -> -oo) (y - (-2x)) = limits(lim)_(x -> -oo) (sqrt(x^2 - m x + 1) + x) = limits(lim)_(x -> -oo) (-m x + 1)/(sqrt(x^2 - m x + 1) - x) = limits(lim)_(x -> -oo) (-m + 1/x)/(-sqrt(1 - m/x + 1/x^2) - 1) = (-m)/(-2) = m/2$.
    Vậy khi $x -> -oo$, đồ thị luôn có TCX là $y = -2x + m/2$. (Đúng)]
    #step[d) Hàm số không có mẫu số chứa ẩn $x$ (hoặc nói cách khác, nó liên tục trên TXĐ), tập xác định chỉ loại bỏ khoảng nếu biểu thức trong căn âm. Tại các biên, giới hạn bằng 0 hữu hạn. Nên hàm số KHÔNG BAO GIỜ có tiệm cận đứng. (Sai)]
  ]
)

#my-ds(de: "Đề 3", 
  dir: "doc",
  [Cho đồ thị hàm số $y = (x^2 - m^2)/(x - m)$. Xét tính đúng sai:],
  (
    [Đồ thị hàm số có đường tiệm cận đứng là $x = m$.],
    True([Hàm số này có đồ thị là một đường thẳng bị khuyết một điểm.]),
    [Hàm số có cực trị khi $m != 0$.],
    [Đồ thị có tiệm cận xiên $y = x + m$.]
  ),
  loigiai: [
    #step[a) Tập xác định $x != m$. Rút gọn $y = ((x - m)(x + m))/(x - m) = x + m$.
    Giới hạn tại $x = m$ là $limits(lim)_(x -> m) y = 2m$ hữu hạn. Do đó đồ thị không có tiệm cận đứng. (Sai)]
    #step[b) Đồ thị là đường thẳng $y = x + m$ khuyết đi điểm $(m; 2m)$. (Đúng)]
    #step[c) Đạo hàm $y' = 1 > 0$ với mọi $x != m$. Hàm số đồng biến và không có cực trị. (Sai)]
    #step[d) Vì đồ thị là đường thẳng bị khuyết 1 điểm nên không có tiệm cận (xiên hay ngang). Tiệm cận chỉ dành cho sự tiệm cận tiến vô hạn. (Sai)]
  ]
)

#my-ds(de: "Đề 3", 
  dir: "doc",
  [Gọi $S$ là tập hợp các giá trị của tham số $m$ để đồ thị hàm số $y = (x^2 - m x - 2 m^2)/(x - 2)$ có đường tiệm cận xiên và đường tiệm cận xiên này cách điểm $A(1; 1)$ một khoảng bằng $1/sqrt(2)$. Xét tính đúng sai:],
  (
    [Tập $S$ có đúng hai phần tử.],
    [Tổng các phần tử của $S$ bằng $1$.],
    True([Các phần tử của $S$ đều là số nguyên.]),
    [Đường thẳng $y = x$ là một trong các tiệm cận xiên của các hàm số tương ứng.]
  ),
  loigiai: [
    #step[Điều kiện có TCX: $x = 2$ không là nghiệm của tử $=> 4 - 2m - 2m^2 != 0 <=> m^2 + m - 2 != 0 <=> m != 1$ và $m != -2$.]
    #step[Chia đa thức: $x^2 - m x - 2 m^2 = x(x - 2) + (2 - m)x - 2m^2 = x(x - 2) + (2 - m)(x - 2) + 4 - 2m - 2m^2$.
    TCX $d: y = x + 2 - m <=> x - y + 2 - m = 0$.]
    #step[Khoảng cách từ $A(1; 1)$ đến $d$: $d(A, d) = |1 - 1 + 2 - m|/sqrt(1^2 + (-1)^2) = |2 - m|/sqrt(2)$.]
    #step[Theo bài ra: $|2 - m|/sqrt(2) = 1/sqrt(2) <=> |2 - m| = 1 <=> 2 - m = 1$ hoặc $2 - m = -1 <=> m = 1$ hoặc $m = 3$.]
    #step[Đối chiếu điều kiện $m != 1$, ta nhận $m = 3$.]
    #step[Kiểm tra mệnh đề:]
    #step[a) Tập $S$ chỉ có đúng một phần tử là $m = 3$. (Sai)]
    #step[b) Tổng các phần tử là $3$. (Sai)]
    #step[c) Tập $S = {3}$, số 3 là số nguyên. (Đúng)]
    #step[d) Khi $m = 3$, TCX là $y = x + 2 - 3 = x - 1$. Không phải $y = x$. (Sai)]
  ]
)


#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Có bao nhiêu số nguyên $m in [-20; 20]$ để đồ thị hàm số $y = (m x^2 + 4x - 1)/(x + 1)$ KHÔNG CÓ tiệm cận xiên?],
  [$2$],
  loigiai: [
    #step[Điều kiện để đồ thị hàm phân thức (tử bậc tối đa 2, mẫu bậc 1) CÓ tiệm cận xiên là bậc của tử lớn hơn bậc mẫu đúng 1 bậc và tử không chia hết cho mẫu.]
    #step[Tử số có bậc 2 khi và chỉ khi $m != 0$.]
    #step[Khi $m = 0$, $y = (4x - 1)/(x + 1)$, hàm số có tiệm cận ngang $y = 4$ và không có tiệm cận xiên.]
    #step[Nếu $m != 0$, phép chia cho số dư $R = m(-1)^2 + 4(-1) - 1 = m - 5$. Để có TCX thì $m - 5 != 0 <=> m != 5$.
    Nếu $m = 5$, $y = (5x^2 + 4x - 1)/(x + 1) = ((x + 1)(5x - 1))/(x + 1) = 5x - 1$. Đồ thị là một đường thẳng thủng, KHÔNG CÓ tiệm cận xiên.]
    #step[Vậy đồ thị KHÔNG CÓ TCX khi $m = 0$ hoặc $m = 5$.]
    #step[Số nguyên $m in [-20; 20]$ không có TCX gồm ${0, 5}$, tổng cộng 2 giá trị.]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Tìm giá trị dương của tham số $m$ để đường tiệm cận đứng của đồ thị hàm số $y = (2x + 1)/(x^2 - m^2)$ đi qua điểm $A(1; -3)$.],
  [$1$],
  loigiai: [
    #step[Nghiệm của mẫu là $x^2 - m^2 = 0 <=> x = m$ hoặc $x = -m$.]
    #step[Tiệm cận đứng phải đi qua điểm $A(1; -3)$, tức là đường thẳng $x = 1$ phải là tiệm cận đứng.]
    #step[Suy ra mẫu số phải có nghiệm $x = 1 => 1^2 - m^2 = 0 <=> m = 1$ hoặc $m = -1$.]
    #step[Với $m = 1$, mẫu là $x^2 - 1 = (x-1)(x+1)$. Tại $x=1$, tử số là $3 != 0$. Nên $x=1$ đúng là TCĐ.]
    #step[Vì yêu cầu $m > 0$ nên nhận $m = 1$.]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Cho hàm số $y = (x^2 - 3x + m)/(x - 1)$. Tìm giá trị nhỏ nhất của $m$ (với $m$ là số nguyên dương) để tiệm cận xiên của đồ thị không cắt parabol $(P): y = x^2 - x + 1$.],
  [$1$],
  loigiai: [
    #step[Chia tử cho mẫu: $x^2 - 3x + m = x(x - 1) - 2x + m = x(x - 1) - 2(x - 1) + m - 2 = (x - 2)(x - 1) + m - 2$.]
    #step[Đường tiệm cận xiên là $d: y = x - 2$. (Lưu ý phải có $m != 2$ thì phần dư mới khác 0 và có TCX).]
    #step[Xét phương trình hoành độ giao điểm của $d$ và $(P)$:
    $x^2 - x + 1 = x - 2 <=> x^2 - 2x + 3 = 0$.]
    #step[Phương trình có $Delta' = 1 - 3 = -2 < 0$, nên luôn vô nghiệm với mọi $m$.
    Do đó, $d$ không cắt $(P)$ với mọi $m$ sao cho $d$ là TCX.]
    #step[Điều kiện để có TCX là $m - 2 != 0 <=> m != 2$.
    Hơn nữa, TCX luôn là $y = x - 2$ không phụ thuộc $m$.]
    #step[Số nguyên dương nhỏ nhất khác 2 là $m = 1$.]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Cho đồ thị hàm số $y = (x^2 + 2x - 3)/(x + m)$ có đường tiệm cận xiên đi qua điểm $M(1; 5)$. Tìm $m$.],
  [$-2$],
  loigiai: [
    #step[Chia đa thức: $x^2 + 2x - 3 = x(x + m) + (2 - m)x - 3 = x(x + m) + (2 - m)(x + m) - m(2 - m) - 3$.]
    #step[Tiệm cận xiên là $y = x + 2 - m$.]
    #step[Tiệm cận xiên đi qua $M(1; 5)$ nên: $5 = 1 + 2 - m <=> m = 3 - 5 = -2$.]
    #step[Vậy $m = -2$. (Kiểm tra phần dư: $-(-2)(2 - (-2)) - 3 = 8 - 3 = 5 != 0$, thỏa mãn có TCX).]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Biết đường tiệm cận xiên của hàm số $y = (a x^2 - x + 1)/(x + b)$ là $y = 3x - 7$. Tính giá trị của biểu thức $P = a^2 + b^2$.],
  [$13$],
  loigiai: [
    #step[Thực hiện phép chia: $a x^2 - x + 1 = a x(x + b) - (a b + 1)x + 1 = a x(x + b) - (a b + 1)(x + b) + b(a b + 1) + 1$.]
    #step[Tiệm cận xiên là $y = a x - (a b + 1)$.]
    #step[Đồng nhất hệ số với $y = 3x - 7$, ta có hệ:
    $cases(
      a = 3,
      -(a b + 1) = -7
    ) <=> cases(
      a = 3,
      3b + 1 = 7 => 3b = 6 => b = 2
    )$]
    #step[Giá trị biểu thức $P = a^2 + b^2 = 3^2 + 2^2 = 9 + 4 = 13$.]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Tìm số lượng giá trị nguyên của $m$ thuộc khoảng $(-10; 10)$ sao cho đồ thị hàm số $y = (|x| + 1)/(x^2 - m x + 1)$ có duy nhất 1 đường tiệm cận (kể cả đứng, ngang, xiên).],
  [$3$],
  loigiai: [
    #step[TCN: $limits(lim)_(x -> +-oo) (|x| + 1)/(x^2 - m x + 1) = 0$. Vậy hàm số luôn có chính xác 1 đường tiệm cận ngang là $y = 0$.]
    #step[Vì đã có 1 TCN, để đồ thị có DUY NHẤT 1 đường tiệm cận thì không được có tiệm cận đứng.]
    #step[Đồ thị không có TCĐ khi và chỉ khi mẫu $g(x) = x^2 - m x + 1 = 0$ vô nghiệm (vì tử số luôn dương $|x|+1>0$).]
    #step[$g(x) = 0$ vô nghiệm $<=> Delta = m^2 - 4 < 0 <=> -2 < m < 2$.]
    #step[Vì $m in ZZ$ nên $m in {-1, 0, 1}$.]
    #step[Số lượng giá trị nguyên của $m$ thỏa mãn là $3$.]
  ]
)



// ==================== Đề Thực Tế ====================
#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một nhà máy sản xuất bóng đèn có chi phí cố định hàng ngày là $8$ triệu đồng. Chi phí nguyên liệu để sản xuất mỗi bóng đèn là $20$ nghìn đồng. Hàm chi phí trung bình để sản xuất một bóng đèn khi sản lượng là $x$ bóng mỗi ngày được cho bởi $C(x) = (8000 + 20x)/x$ (nghìn đồng). Khi sản lượng $x$ tăng lên không giới hạn, chi phí trung bình để sản xuất một bóng đèn tiến về giá trị nào?
  #align(center)[
    #canvas(length: 1cm, {
      draw.line((0, 0), (6, 0), mark: (end: ">")) // Trục Ox
      draw.line((0, 0), (0, 5), mark: (end: ">")) // Trục Oy
      draw.content((6.2, 0), [$x$])
      draw.content((0, 5.2), [$C(x)$])
      
      // Tiệm cận ngang y = 20 (scale lại thành y = 2)
      draw.line((0, 2), (5.5, 2), stroke: (paint: red, dash: "dashed"))
      draw.content((-0.4, 2), [$20$])
      
      // Đồ thị hàm số C(x) = 8000/x + 20
      draw.bezier((0.5, 4.5), (5, 2.1), (1.5, 2.3), stroke: blue)
    })
  ]
  ],
  (
    [$0$ nghìn đồng.],
    [$8000$ nghìn đồng.],
    True([$20$ nghìn đồng.]),
    [$28$ nghìn đồng.]
  ),
  loigiai: [
    #step[Khi sản lượng $x$ tăng không giới hạn có nghĩa là $x -> +oo$.]
    #step[Ta cần tìm giới hạn của $C(x)$ khi $x -> +oo$:]
    #step[$limits(lim)_(x -> +oo) C(x) = limits(lim)_(x -> +oo) (8000 + 20x)/x = limits(lim)_(x -> +oo) (8000/x + 20) = 20$.]
    #step[Điều này có nghĩa là khi sản xuất càng nhiều bóng đèn, phần chi phí cố định phân bổ cho mỗi bóng càng tiến gần đến $0$, và chi phí trung bình cho mỗi bóng tiệm cận với chi phí biên là $20$ nghìn đồng. Trên đồ thị, đường cong chi phí (màu xanh) tiệm cận đường ngang $y = 20$ (nét đứt màu đỏ).]
  ]
)

#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Nồng độ của một loại thuốc trong máu bệnh nhân (mg/L) theo thời gian $t$ giờ sau khi tiêm được mô tả bởi hàm số $C(t) = (5t)/(t^2 + 4)$ ($t >= 0$). Hỏi nồng độ thuốc tiến về giá trị nào khi thời gian trôi đi rất lâu?],
  (
    [$5$ mg/L.],
    [$4$ mg/L.],
    [$1$ mg/L.],
    True([$0$ mg/L.])
  ),
  loigiai: [
    #step[Khi thời gian tiến đến vô cùng, ta cần tính $limits(lim)_(t -> +oo) C(t)$.]
    #step[$limits(lim)_(t -> +oo) (5t)/(t^2 + 4) = limits(lim)_(t -> +oo) (5/t)/(1 + 4/t^2) = 0/1 = 0$.]
    #step[Về mặt thực tế, điều này chứng tỏ thuốc sẽ bị cơ thể đào thải dần và nồng độ tiến về $0$ sau một thời gian dài. Đồ thị $C(t)$ nhận trục hoành $y = 0$ làm tiệm cận ngang.]
  ]
)

#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một mô hình học tập Ebbinghaus chỉ ra số lượng từ vựng $W$ (từ) một học sinh có thể ghi nhớ sau $t$ tháng ôn tập được tính bằng $W(t) = (1200t)/(t + 6)$. Ngưỡng bão hòa trí nhớ (số từ tối đa có thể ghi nhớ khi $t -> +oo$) là bao nhiêu từ?
  #align(center)[
    #canvas(length: 1cm, {
      draw.line((0, 0), (6, 0), mark: (end: ">")) // Trục Ox
      draw.line((0, 0), (0, 4), mark: (end: ">")) // Trục Oy
      draw.content((6.2, 0), [$t$])
      draw.content((0, 4.2), [$W(t)$])
      
      // Tiệm cận ngang y = 1200 (scale lại thành y = 3)
      draw.line((0, 3), (5.5, 3), stroke: (paint: red, dash: "dashed"))
      draw.content((-0.6, 3), [$1200$])
      
      // Đồ thị hàm số W(t) = 1200t/(t + 6)
      draw.bezier((0, 0), (5, 2.8), (2, 2.5), stroke: orange)
    })
  ]
  ],
  (
    [$6$ từ.],
    [$200$ từ.],
    True([$1200$ từ.]),
    [$1800$ từ.]
  ),
  loigiai: [
    #step[Ngưỡng bão hòa là giới hạn của số lượng từ vựng khi thời gian $t -> +oo$.]
    #step[Ta tính $limits(lim)_(t -> +oo) W(t) = limits(lim)_(t -> +oo) (1200t)/(t + 6) = limits(lim)_(t -> +oo) 1200/(1 + 6/t) = 1200$.]
    #step[Ngưỡng bão hòa là $1200$ từ. Đây chính là giá trị của đường tiệm cận ngang $W = 1200$ (đường nét đứt màu đỏ trên đồ thị).]
  ]
)

#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Theo định luật Boyle, áp suất $P$ (atm) của một lượng khí lý tưởng không đổi ở nhiệt độ nhất định tỉ lệ nghịch với thể tích $V$ (lít) theo công thức $P(V) = 10/V$. Khi thể tích khí bị ép sát về $0$, áp suất $P$ thay đổi như thế nào, và đồ thị $P(V)$ có đường tiệm cận nào?],
  (
    [$P -> 0$; TCN là $P = 0$.],
    True([$P -> +oo$; TCĐ là $V = 0$.]),
    [$P -> 10$; TCN là $P = 10$.],
    [$P -> -oo$; TCĐ là $V = 0$.]
  ),
  loigiai: [
    #step[Ta tính giới hạn của hàm $P(V)$ khi $V -> 0^+$ (thể tích nén lại gần bằng $0$).]
    #step[$limits(lim)_(V -> 0^+) 10/V = +oo$ (do $10 > 0$ và $V > 0$).]
    #step[Điều này cho thấy, khi thể tích càng nhỏ, áp suất chất khí trong bình sẽ tăng mạnh mẽ không giới hạn. Đồ thị $P(V)$ sẽ có đường tiệm cận đứng là trục tung $V = 0$.]
  ]
)

#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Doanh thu $R$ (triệu đồng) của một công ty phụ thuộc vào chi phí quảng cáo $x$ (triệu đồng) theo mô hình $R(x) = (400x)/(x + 50) + 200$ ($x >= 0$). Khi chi phí quảng cáo tăng không giới hạn, doanh thu tiến về ngưỡng giới hạn nào?],
  (
    [$400$ triệu đồng.],
    [$200$ triệu đồng.],
    True([$600$ triệu đồng.]),
    [$450$ triệu đồng.]
  ),
  loigiai: [
    #step[Khi chi phí quảng cáo tăng không giới hạn, ta xét giới hạn $x -> +oo$.]
    #step[$limits(lim)_(x -> +oo) R(x) = limits(lim)_(x -> +oo) ((400x)/(x + 50) + 200) = limits(lim)_(x -> +oo) (400/(1 + 50/x)) + 200 = 400 + 200 = 600$.]
    #step[Đồ thị hàm số có tiệm cận ngang là $R = 600$. Điều này cho thấy dung lượng thị trường bị giới hạn, dù chi bao nhiêu tiền quảng cáo thì doanh thu cũng không thể vượt quá $600$ triệu đồng.]
  ]
)

#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Trong vật lý, công suất $P$ (W) sinh ra bởi một hệ thống tua-bin gió phụ thuộc vào vận tốc gió $v$ (m/s) theo hàm số $P(v) = (500v^3)/(v^3 + 200)$ ($v >= 0$). Công suất tối đa lý thuyết mà tua-bin có thể đạt được khi có gió bão cực mạnh là bao nhiêu?],
  (
    [$200$ W.],
    [$0$ W.],
    True([$500$ W.]),
    [Vô hạn.]
  ),
  loigiai: [
    #step[Khi có gió bão cực mạnh, ta xét giới hạn của $P(v)$ khi vận tốc gió $v -> +oo$.]
    #step[$limits(lim)_(v -> +oo) P(v) = limits(lim)_(v -> +oo) (500v^3)/(v^3 + 200) = limits(lim)_(v -> +oo) 500/(1 + 200/v^3) = 500$.]
    #step[Như vậy, công suất tối đa theo thiết kế của tua-bin sẽ tiệm cận giới hạn là $500$ W. Tiệm cận ngang của đồ thị là $P = 500$.]
  ]
)

#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Số lượng cá trong một hồ nuôi (nghìn con) theo năm thứ $t$ được mô hình bởi hàm sinh trưởng Logistic $P(t) = 80/(1 + 15 e^(-0.4t))$ ($t >= 0$). Sức chứa tối đa của hồ (ngưỡng sinh thái) là bao nhiêu nghìn con?],
  (
    [$15$ nghìn con.],
    [$5$ nghìn con.],
    [$0$ nghìn con.],
    True([$80$ nghìn con.])
  ),
  loigiai: [
    #step[Ngưỡng sức chứa của môi trường chính là giá trị tiệm cận ngang của quần thể khi thời gian $t -> +oo$.]
    #step[Khi $t -> +oo$, ta có $-0.4t -> -oo$, do đó $limits(lim)_(t -> +oo) e^(-0.4t) = 0$.]
    #step[$limits(lim)_(t -> +oo) P(t) = 80/(1 + 15 dot 0) = 80/1 = 80$.]
    #step[Quần thể cá sẽ ổn định và không thể vượt quá mức sức chứa tối đa của hồ là $80$ nghìn con. Đường $P = 80$ là TCN của đồ thị.]
  ]
)

#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Một vật rơi tự do có lực cản không khí, vận tốc $v(t)$ (m/s) phụ thuộc vào thời gian $t$ (s) ($t >= 0$) theo công thức $v(t) = 50(1 - e^(-0.2t))$. Vận tốc rơi cuối (vận tốc giới hạn) của vật đó là bao nhiêu?
  #align(center)[
    #canvas(length: 1cm, {
      draw.line((0, 0), (6, 0), mark: (end: ">")) 
      draw.line((0, 0), (0, 4), mark: (end: ">")) 
      draw.content((6.2, 0), [$t$])
      draw.content((0, 4.2), [$v(t)$])
      
      // Tiệm cận ngang v = 50 (scale lại thành y = 3)
      draw.line((0, 3), (5.5, 3), stroke: (paint: red, dash: "dashed"))
      draw.content((-0.4, 3), [$50$])
      
      // Đồ thị hàm số v(t)
      draw.bezier((0, 0), (5, 2.9), (1.5, 2.5), stroke: blue)
    })
  ]
  ],
  (
    [$0$ m/s.],
    [$25$ m/s.],
    True([$50$ m/s.]),
    [Vô hạn.]
  ),
  loigiai: [
    #step[Vận tốc giới hạn đạt được khi thời gian $t$ tiến ra vô cực ($t -> +oo$).]
    #step[Ta tính giới hạn: $limits(lim)_(t -> +oo) v(t) = limits(lim)_(t -> +oo) 50(1 - e^(-0.2t))$.]
    #step[Vì $limits(lim)_(t -> +oo) e^(-0.2t) = 0$, nên $limits(lim)_(t -> +oo) v(t) = 50(1 - 0) = 50$.]
    #step[Vận tốc rơi tiệm cận $50$ m/s do lực cản không khí sẽ cân bằng với trọng lực. Đường thẳng màu đỏ $y = 50$ là tiệm cận ngang của hàm vận tốc.]
  ]
)

#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Mực nước của một con đập thủy điện vào tháng thứ $t$ được mô phỏng bởi hàm $h(t) = (10t^2 + 5t + 100)/(t^2 + 2)$ (mét). Hỏi sau rất nhiều năm, mực nước trung bình của con đập sẽ ổn định ở mức bao nhiêu mét?],
  (
    [$5$ mét.],
    [$100$ mét.],
    True([$10$ mét.]),
    [$0$ mét.]
  ),
  loigiai: [
    #step[Sau rất nhiều năm có nghĩa là $t -> +oo$.]
    #step[Ta tính giới hạn $limits(lim)_(t -> +oo) h(t) = limits(lim)_(t -> +oo) (10t^2 + 5t + 100)/(t^2 + 2) = limits(lim)_(t -> +oo) (10 + 5/t + 100/t^2)/(1 + 2/t^2) = 10$.]
    #step[Mực nước sẽ dao động và cuối cùng ổn định quanh mức $10$ mét. Đồ thị $h(t)$ nhận đường $y = 10$ làm tiệm cận ngang.]
  ]
)

#my-tn(de: "Đề Thực Tế", 
  dir: "ngang",
  [Số dân của một thành phố sau $t$ năm (kể từ năm 2000) được mô phỏng bởi hàm số $f(t) = (20t + 10)/(t + 1)$ (đơn vị: triệu người). Vào năm nào thì dân số của thành phố tiệm cận đến đúng 20 triệu người?],
  (
    [$2001$.],
    [$2020$.],
    True([Không bao giờ đạt được.]),
    [$2010$.]
  ),
  loigiai: [
    #step[Giới hạn của dân số khi thời gian tiến ra xa vô tận là $limits(lim)_(t -> +oo) f(t) = limits(lim)_(t -> +oo) (20t + 10)/(t + 1) = 20$.]
    #step[Tức là, đồ thị của $f(t)$ có tiệm cận ngang $y = 20$.]
    #step[Biến đổi $f(t) = (20(t + 1) - 10)/(t + 1) = 20 - 10/(t + 1)$. Với mọi $t >= 0$, ta có phân số $10/(t + 1) > 0$.]
    #step[Do đó $f(t) = 20 - 10/(t + 1) < 20$ với mọi $t >= 0$.]
    #step[Điều này chứng tỏ dân số thành phố luôn tăng dần và chỉ *tiến sát* tới mốc 20 triệu người chứ không bao giờ thực sự đạt được con số đúng 20 triệu.]
  ]
)


#my-ds(de: "Đề Thực Tế", 
  dir: "doc",
  [Nhiệt độ $T$ ($degree$C) của một tách cà phê sau $t$ phút kể từ khi pha được mô phỏng bởi định luật làm mát Newton có phương trình $T(t) = 25 + 65e^(-0.1t)$.
  #align(center)[
    #canvas(length: 1cm, {
      draw.line((0, 0), (6, 0), mark: (end: ">")) 
      draw.line((0, 0), (0, 4), mark: (end: ">")) 
      draw.content((6.2, 0), [$t$])
      draw.content((0, 4.2), [$T(t)$])
      
      // TCN y = 25 (tỉ lệ y=1)
      draw.line((0, 1), (5.5, 1), stroke: (paint: red, dash: "dashed"))
      draw.content((-0.4, 1), [$25$])
      
      // Nhiệt độ ban đầu y = 90 (tỉ lệ y=3.5)
      draw.content((-0.4, 3.5), [$90$])
      
      draw.bezier((0, 3.5), (5, 1.1), (1.5, 1.3), stroke: purple)
    })
  ]
  Xét tính đúng sai của các phát biểu sau:],
  (
    True([Nhiệt độ ban đầu của tách cà phê là $90degree$C.]),
    [Nhiệt độ của cà phê có thể giảm xuống dưới $25degree$C sau 30 phút.],
    True([Đồ thị hàm số $T(t)$ có một đường tiệm cận ngang là $T = 25$.]),
    [Đường tiệm cận ngang này đại diện cho nhiệt độ cực đại mà cà phê có thể đạt tới.]
  ),
  loigiai: [
    #step[a) Nhiệt độ ban đầu là lúc $t = 0$. Thay vào hàm số: $T(0) = 25 + 65e^0 = 25 + 65 = 90$ ($degree$C). Dựa vào hình vẽ, đường màu tím cũng xuất phát từ mốc 90. (Đúng)]
    #step[b) Vì $65e^(-0.1t) > 0$ với mọi $t$, nên $T(t) = 25 + 65e^(-0.1t) > 25$ với mọi $t >= 0$. Cà phê sẽ nguội dần nhưng không bao giờ giảm xuống dưới $25degree$C. (Sai)]
    #step[c) Xét khi $t -> +oo$, ta có $limits(lim)_(t -> +oo) e^(-0.1t) = 0$. Vậy $limits(lim)_(t -> +oo) T(t) = 25$. Đồ thị có tiệm cận ngang là $T = 25$ (đường đứt khúc màu đỏ). (Đúng)]
    #step[d) Tiệm cận ngang $T = 25$ đại diện cho nhiệt độ môi trường xung quanh (room temperature). Cà phê nóng hơn môi trường nên nguội dần và cân bằng với môi trường ở mức $25degree$C chứ không phải là nhiệt độ cực đại. (Sai)]
  ]
)

#my-ds(de: "Đề Thực Tế", 
  dir: "doc",
  [Một công ty tính toán rằng chi phí tổng cộng để làm sạch $p%$ lượng rác thải hóa học tại một dòng sông là $C(p) = (50000p)/(100 - p)$ (USD), với $0 <= p < 100$. Xét tính đúng sai của các nhận định:],
  (
    [Để làm sạch 50% rác thải, cần tốn đúng 25,000 USD.],
    True([Đồ thị của hàm số $C(p)$ có một đường tiệm cận đứng tại $p = 100$.]),
    [Sự xuất hiện của đường tiệm cận đứng cho thấy có thể làm sạch hoàn toàn 100% rác thải với chi phí rất rẻ.],
    True([Nếu công ty chỉ có ngân sách tối đa là 450,000 USD, họ có thể làm sạch được tối đa 90% lượng rác thải.])
  ),
  loigiai: [
    #step[a) $C(50) = (50000 dot 50)/(100 - 50) = 2500000 / 50 = 50000$ USD. (Sai, chi phí là $50,000$ chứ không phải $25,000$)]
    #step[b) Khi tỉ lệ làm sạch $p$ tiến tới $100%$, ta xét $p -> 100^-$. Mẫu số $100 - p -> 0^+$, tử số $50000p -> 5000000 > 0$. Vậy $limits(lim)_(p -> 100^-) C(p) = +oo$. Đồ thị có TCĐ $p = 100$. (Đúng)]
    #step[c) Ý nghĩa của đường tiệm cận đứng $p = 100$ là chi phí $C$ sẽ tiến tới vô cực (vô cùng tốn kém) khi tỷ lệ làm sạch tiến sát mức $100%$. Việc làm sạch triệt để là bất khả thi về mặt tài chính. Không hề rẻ. (Sai)]
    #step[d) Để tìm tỉ lệ với ngân sách 450,000 USD: $(50000p)/(100 - p) = 450000 <=> 50p = 450(100 - p) <=> 50p = 45000 - 450p <=> 500p = 45000 <=> p = 90$. Công ty chỉ làm sạch được $90%$ rác thải. (Đúng)]
  ]
)

#my-ds(de: "Đề Thực Tế", 
  dir: "doc",
  [Giá trị một chiếc ô tô hạng sang sau $t$ năm sử dụng được dự đoán bởi hàm số $V(t) = 500/(t + 2) + 50$ (triệu đồng), với $t >= 0$. Xét tính đúng sai:],
  (
    True([Lúc mới mua, giá trị ô tô là 300 triệu đồng.]),
    True([Đồ thị của hàm số giá trị xe có một tiệm cận ngang là đường $V = 50$.]),
    [Giá trị ô tô tăng dần theo thời gian sử dụng.],
    [Đường tiệm cận ngang cho biết xe sẽ hoàn toàn mất giá trị ($V = 0$) sau một thời gian dài.]
  ),
  loigiai: [
    #step[a) Khi mới mua tức lúc $t = 0$: $V(0) = 500/(0 + 2) + 50 = 250 + 50 = 300$ (triệu đồng). (Đúng)]
    #step[b) Khi $t -> +oo$, ta có $limits(lim)_(t -> +oo) V(t) = limits(lim)_(t -> +oo) (500/(t + 2) + 50) = 0 + 50 = 50$. Đồ thị có TCN là đường thẳng $V = 50$. (Đúng)]
    #step[c) Đạo hàm $V'(t) = -500/(t + 2)^2 < 0$ với mọi $t >= 0$. Hàm số nghịch biến nên giá trị xe liên tục giảm dần (khấu hao theo thời gian). (Sai)]
    #step[d) Tiệm cận ngang $V = 50$ mang ý nghĩa là sau rất nhiều năm sử dụng, chiếc xe không bao giờ rớt giá về $0$ mà sẽ còn giữ lại một "giá trị phế liệu" cố định là $50$ triệu đồng. (Sai)]
  ]
)

#my-ds(de: "Đề Thực Tế", 
  dir: "doc",
  [Dân số của một loài vi khuẩn trong phòng thí nghiệm sau $t$ giờ được đo bằng hàm số $N(t) = (100t^2 + 50t + 200)/(t^2 + 2t + 5)$ (nghìn con), với $t >= 0$. Xét tính đúng sai:],
  (
    [Dân số ban đầu là 200 nghìn con.],
    True([Hàm số sinh trưởng này không có tiệm cận đứng trên tập xác định của nó.]),
    True([Sau một khoảng thời gian vô tận, quần thể vi khuẩn duy trì ổn định ở mức 100 nghìn con.]),
    True([Dân số của loài vi khuẩn luôn nhỏ hơn 100 nghìn con tại mọi thời điểm $t >= 0$.])
  ),
  loigiai: [
    #step[a) Dân số ban đầu là khi $t = 0$, $N(0) = 200/5 = 40$ (nghìn con). (Sai)]
    #step[b) Xét phương trình mẫu số: $t^2 + 2t + 5 = 0 <=> (t + 1)^2 + 4 = 0$ (Vô nghiệm). Vì mẫu số luôn lớn hơn 0 nên đồ thị hàm số không bao giờ có tiệm cận đứng. (Đúng)]
    #step[c) Tính giới hạn bão hòa: $limits(lim)_(t -> +oo) N(t) = limits(lim)_(t -> +oo) (100 + 50/t + 200/t^2)/(1 + 2/t + 5/t^2) = 100/1 = 100$. Vậy quần thể ổn định và có đường TCN ở mức $N = 100$. (Đúng)]
    #step[d) Ta xét dấu hiệu số $N(t) - 100$:
    $N(t) - 100 = (100t^2 + 50t + 200)/(t^2 + 2t + 5) - 100 = (100t^2 + 50t + 200 - 100t^2 - 200t - 500)/(t^2 + 2t + 5) = (-150t - 300)/(t^2 + 2t + 5)$.
    Vì thời gian $t >= 0$ nên tử số $-150t - 300 < 0$, mẫu số dương. Suy ra $N(t) - 100 < 0 => N(t) < 100$ với mọi $t >= 0$. Quần thể tiệm cận lên 100 nhưng không bao giờ chạm tới. (Đúng)]
  ]
)


#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Nồng độ oxy trong một hồ nước bị ô nhiễm sau $t$ ngày được đo bằng hàm số $O(t) = (15t^2 - 20t + 10)/(3t^2 + 5)$ (mg/L). Nồng độ oxy sẽ tiệm cận đến mức nào sau một khoảng thời gian vô tận?],
  [$5$],
  loigiai: [
    #step[Ta cần tính $limits(lim)_(t -> +oo) O(t) = limits(lim)_(t -> +oo) (15t^2 - 20t + 10)/(3t^2 + 5)$.]
    #step[Chia cả tử và mẫu cho $t^2$, ta được: $limits(lim)_(t -> +oo) (15 - 20/t + 10/t^2)/(3 + 5/t^2) = 15/3 = 5$.]
    #step[Vậy nồng độ oxy của hồ tiệm cận và phục hồi ở mức cân bằng là $5$ mg/L.]
  ]
)

#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Khối lượng chất thải phóng xạ còn lại $M$ (gram) sau thời gian $t$ năm tuân theo quy luật phân rã $M(t) = 200 e^(-0.05t)$. Khi thời gian tiến đến vô cùng, khối lượng chất thải tiến đến bao nhiêu gram?],
  [$0$],
  loigiai: [
    #step[Khi thời gian tiến đến vô cực: $t -> +oo => -0.05t -> -oo$.]
    #step[Biết rằng giới hạn của hàm mũ cơ số $e$ với số mũ âm vô cùng là bằng 0: $limits(lim)_(t -> +oo) e^(-0.05t) = 0$.]
    #step[Do đó $limits(lim)_(t -> +oo) M(t) = 200 dot 0 = 0$.]
    #step[Dù quá trình rất chậm nhưng chất phóng xạ sẽ bị phân rã hoàn toàn, khối lượng tiệm cận $0$ gram. Đồ thị nhận trục hoành làm tiệm cận ngang.]
  ]
)

#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Hiệu suất sản xuất $E$ (%) của một hệ thống pin quang điện phụ thuộc vào cường độ sáng $I$ (Lux) theo mô hình $E(I) = (80I)/(I + 500)$ với $I >= 0$. Giới hạn hiệu suất tối đa (tiệm cận ngang) mà tấm pin có thể đạt được là bao nhiêu phần trăm?],
  [$80$],
  loigiai: [
    #step[Hiệu suất tối đa lý thuyết đạt được khi cường độ sáng chiếu vào vô cùng mạnh, tức $I -> +oo$.]
    #step[Ta tính $limits(lim)_(I -> +oo) E(I) = limits(lim)_(I -> +oo) (80I)/(I + 500) = limits(lim)_(I -> +oo) 80/(1 + 500/I) = 80$.]
    #step[Vậy hiệu suất lý thuyết tiệm cận đến ngưỡng $80%$. Đây là rào cản vật lý (tiệm cận ngang) không thể vượt qua.]
  ]
)

#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Lực tĩnh điện $F$ (Newton) giữa hai điện tích điểm thay đổi theo khoảng cách $d$ (mét) giữa chúng tuân theo định luật Coulomb với quy luật $F(d) = 100/d^2$. Lực tương tác sẽ tiến tới vô cực khi khoảng cách $d$ tiệm cận về giá trị nào?],
  [$0$],
  loigiai: [
    #step[Đường tiệm cận đứng của đồ thị lực $F$ biểu thị cho hiện tượng lực tiến tới vô cùng lớn.]
    #step[Ta thấy $F(d) -> +oo$ khi và chỉ khi mẫu số $d^2 -> 0 <=> d -> 0$.]
    #step[Vậy khi $d$ tiệm cận về $0$ (hai điện tích vô cùng gần nhau), lực tương tác sẽ hút hoặc đẩy lớn vô hạn.]
  ]
)

#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Lợi nhuận lũy kế $P(x)$ (tỷ đồng) của một tập đoàn bất động sản khi đầu tư số vốn $x$ (ngàn tỷ đồng) vào một đại dự án được mô hình bởi $P(x) = (2x^2 + 5x + 1)/(x - 2)$ (với $x > 2$). Biết rằng khi nguồn vốn đầu tư mở rộng vô hạn, đường cong lợi nhuận sẽ bám sát một đường tiệm cận xiên $y = a x + b$. Tính giá trị của $a + b$.],
  [$11$],
  loigiai: [
    #step[Thực hiện phép chia đa thức tử cho đa thức mẫu để tìm phần thương, chính là đường tiệm cận xiên.]
    #step[$2x^2 + 5x + 1 = 2x(x - 2) + 9x + 1 = 2x(x - 2) + 9(x - 2) + 19$.]
    #step[Hàm số được viết lại dưới dạng: $P(x) = 2x + 9 + 19/(x - 2)$.]
    #step[Khi $x -> +oo$, phần dư $19/(x - 2) -> 0$. Do đó, đường tiệm cận xiên của mô hình là đường thẳng $y = 2x + 9$.]
    #step[Từ đó suy ra $a = 2, b = 9 => a + b = 2 + 9 = 11$.]
  ]
)

#my-tln(de: "Đề Thực Tế", 
  dir: "ngang",
  [Thời gian hoàn thành một vòng đua $T$ (phút) của các tay đua trong một giải đấu F1 phụ thuộc vào số tháng $m$ họ tập luyện chuyên nghiệp trước đó theo hàm $T(m) = 120 + 200/(m^2 + 2m - 15)$ với $m > 3$. Khi tay đua có kinh nghiệm tập luyện tiến đến vô hạn ($m -> +oo$), thời gian dự kiến họ hoàn thành vòng đua tốt nhất là bao nhiêu phút?],
  [$120$],
  loigiai: [
    #step[Kinh nghiệm tập luyện tiến đến vô hạn tương ứng với việc tính giới hạn của hàm $T(m)$ khi $m -> +oo$.]
    #step[$limits(lim)_(m -> +oo) T(m) = limits(lim)_(m -> +oo) (120 + 200/(m^2 + 2m - 15))$.]
    #step[Phân thức $200/(m^2 + 2m - 15)$ có tử số là hằng số và mẫu số bậc hai tiến ra vô cực, nên giới hạn của nó bằng 0.]
    #step[Do đó $limits(lim)_(m -> +oo) T(m) = 120 + 0 = 120$.]
    #step[Một tay đua cực kì lão luyện sẽ bám sát thành tích (tiệm cận ngang) là $120$ phút.]
  ]
)


