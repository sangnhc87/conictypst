#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *
#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
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
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)

// ==========================================
// HÀM VẼ ĐA GIÁC CƠ BẢN (DÙNG CHUNG)
// ==========================================
#let draw-poly(n, r: 1.2) = {
  import cetz.draw: *
  circle((0, 0), radius: r, stroke: luma(200) + 0.5pt)
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
#show math.equation: set text(fill: math-color)
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
        Conic và Ứng Dụng Tích Phân
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        3 đường Conic ẩn
      ]
    ],
  )
]

// #exam-part(title: "TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN")

#tn(
  [Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 = 9$ và mặt phẳng $(alpha): z = 0$. Gọi $(C)$ là đường tròn giao tuyến của $(S)$ và $(alpha)$. Cho đường thẳng $d$ có phương trình $cases(x = 5, z = 0)$. Gọi $M$ là điểm chạy trên $(C)$, $N$ là điểm chạy trên $d$. Khoảng cách ngắn nhất giữa hai điểm $M$ và $N$ bằng bao nhiêu?],
  (
    True([$2$]),
    [$3$],
    [$5$],
    [$8$]
  ),
  loigiai: [
    #ppgiai[
      - Bước 1: Vì đường thẳng $d$ có phương trình $z = 0$ nên $d$ nằm trọn trong mặt phẳng $(alpha)$. 
      - Bước 2: Bài toán trở thành tìm khoảng cách từ một điểm $M$ trên đường tròn $(C)$ đến đường thẳng $d$ trong cùng mặt phẳng. $min M N = max(0, d(H, d) - r)$.
    ]
    Mặt cầu $(S)$ có tâm $O(0; 0; 0)$ và bán kính $R = 3$. 
    Vì $(alpha): z = 0$ đi qua tâm $O$ nên đường tròn $(C)$ có tâm $H equiv O(0; 0; 0)$ và bán kính $r = R = 3$.
    
    Đường thẳng $d$ nằm trong $(alpha)$ và có phương trình $x - 5 = 0$.
    Khoảng cách từ tâm $H$ đến đường thẳng $d$ là $p = d(H, d) = |0 - 5| = 5$.
    
    Vì $p > r$ ($5 > 3$), đường thẳng $d$ nằm ngoài đường tròn $(C)$.
    Vậy khoảng cách ngắn nhất là $min M N = p - r = 5 - 3 = 2$.
    
    #nhanxet[
      Đây là trường hợp cơ bản nhất (Trường hợp A) khi đường thẳng nằm trọn trong mặt phẳng chứa đường tròn. Ta chỉ cần dùng kiến thức hình học phẳng để giải quyết.
    ]
  ]
)

// #exam-part(title: "TRẮC NGHIỆM ĐÚNG SAI")

#ds(
  [Cho đường tròn $(C)$ có tâm $H$, bán kính $r$ nằm trong mặt phẳng $(alpha)$ và đường thẳng $d$ không đi qua $H$. Gọi $M$ là điểm chạy trên $(C)$, $N$ là điểm chạy trên $d$. Xét tính đúng sai của các mệnh đề sau liên quan đến việc tìm khoảng cách nhỏ nhất giữa $M$ và $N$ ($min M N$):],
  (
    True([Nếu $d$ nằm trong $(alpha)$ và khoảng cách từ $H$ đến $d$ nhỏ hơn $r$, thì $min M N = 0$.]),
    [Nếu $d$ song song với $(alpha)$, thì tại vị trí $M, N$ cho khoảng cách ngắn nhất, đường thẳng $M N$ luôn đi qua tâm $H$.],
    True([Tại vị trí $M, N$ cho khoảng cách ngắn nhất, vectơ $arrow(M N)$ luôn vuông góc với vectơ chỉ phương của đường thẳng $d$.]),
    [Khi đoạn $M N$ đạt giá trị nhỏ nhất thì $M N$ luôn nằm trọn trong mặt phẳng $(alpha)$.]
  ),
  loigiai: [
    #ppgiai[
      Vận dụng lý thuyết cực trị hình học không gian giữa đường thẳng và đường tròn. Điểm tối ưu đòi hỏi đoạn nối $M N$ phải vuông góc với các phương chuyển động ("hướng trượt") tại các điểm mút.
    ]
    - *Ý a Đúng*: Khi $d subset (alpha)$ và $d(H, d) < r$, đường thẳng cắt đường tròn tại hai điểm phân biệt. Chọn $M equiv N$ tại một trong hai giao điểm đó thì khoảng cách bằng $0$.
    - *Ý b Sai*: Khi $d parallel (alpha)$, gọi $K$ là hình chiếu của $N$ lên $(alpha)$, điểm $M$ nằm trên đoạn $H K$. Đường thẳng $M N$ vuông góc với $(alpha)$, trong khi $H$ nằm trong $(alpha)$ và cách $M N$ một đoạn bằng $H M = r > 0$. Do đó $M N$ không đi qua $H$.
    - *Ý c Đúng*: Để $M N$ nhỏ nhất, $N$ phải là hình chiếu vuông góc của $M$ lên $d$. Suy ra $M N perp d$, tức là vectơ $arrow(M N)$ vuông góc với vectơ chỉ phương của $d$.
    - *Ý d Sai*: Trong trường hợp $d parallel (alpha)$ và không nằm trong $(alpha)$, đoạn $M N$ vuông góc với $(alpha)$ hoặc tạo với $(alpha)$ một góc khác $0$. $M N$ không thể nằm trọn trong $(alpha)$ vì $N in d$ và $d subset (alpha) = emptyset$.
    
    #nhanxet[
      Nắm vững các điều kiện cực trị hình học: $M N perp d$ và $M N perp$ tiếp tuyến tại $M$ của $(C)$ là "kim chỉ nam" để biện luận mọi tình huống.
    ]
  ]
)

#tln(
  mode: "solcolor",
  [Trong không gian $O x y z$, cho đường tròn $(C)$ là giao tuyến của mặt cầu $(S): x^2 + y^2 + z^2 = 25$ và mặt phẳng $(alpha): z = 0$. Cho đường thẳng $d$ có phương trình $cases(x = 8, y = t, z = 4)$. Tìm giá trị nhỏ nhất của đoạn $M N$ với $M in (C)$ và $N in d$.],
  [$5$],
  loigiai: [
    #ppgiai[
      - Nhận xét đường thẳng $d$ song song với mặt phẳng $(alpha)$.
      - Gọi $h$ là khoảng cách từ $d$ đến $(alpha)$, $d'$ là hình chiếu của $d$ lên $(alpha)$.
      - Khoảng cách ngắn nhất $min M N = sqrt(h^2 + (max(0, p - r))^2)$, với $p = d(H, d')$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        // Mặt phẳng (alpha)
        line((-2, -1.5), (4, -1.5), (5, 1.5), (-1, 1.5), close: true, stroke: 0.5pt + gray, fill: rgb("f0f0f080"))
        content((-1.5, -1), $(alpha)$)
        
        // Đường tròn (C)
        circle((0,0), radius: (1.5, 0.6), stroke: 1pt + blue, fill: rgb("e6f2ff80"))
        content((-0.8, 0.5), $(C)$, fill: blue)
        
        // Tâm H
        circle((0,0), radius: 1.5pt, fill: black)
        content((0, -0.2), $H$, anchor: "top")
        
        // Đường thẳng d'
        line((3, -1), (3, 2), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
        content((3, -1.3), $d'$)
        
        // Điểm N' trên d'
        let Np = (3, 0)
        circle(Np, radius: 1.5pt, fill: black)
        content((3.2, 0), $N'$, anchor: "west")
        
        // Đường thẳng d
        line((3, 1), (3, 4), stroke: (paint: red, thickness: 1.2pt))
        content((3, 4.2), $d$, fill: red)
        
        // Điểm N trên d
        let N = (3, 2.5)
        circle(N, radius: 1.5pt, fill: black)
        content((3.2, 2.5), $N$, anchor: "west")
        
        // Điểm M trên (C)
        let M = (1.5, 0)
        circle(M, radius: 1.5pt, fill: black)
        content((1.3, -0.2), $M$, anchor: "top")
        
        // Các đoạn nối
        line((0,0), M, stroke: (dash: "dotted", paint: gray))
        content((0.75, 0.2), $r$, anchor: "bottom", fill: gray)
        
        line(M, Np, stroke: (dash: "dashed", paint: orange))
        content((2.25, -0.2), $p-r$, anchor: "top", fill: orange)
        
        line(N, Np, stroke: (dash: "dashed", paint: orange))
        content((2.8, 1.25), $h$, anchor: "east", fill: orange)
        
        line(M, N, stroke: (paint: green, thickness: 1.5pt))
        content((2.1, 1.5), $min M N$, anchor: "south-east", fill: green)
        
        // Góc vuông
        line((2.8, 0), (2.8, 0.2), (3, 0.2), stroke: 0.5pt)
      })
    ]

    Đường tròn $(C)$ nằm trong mặt phẳng $O x y$ ($z=0$), có tâm $H(0; 0; 0)$ và bán kính $r = 5$.
    
    Đường thẳng $d$ có vectơ chỉ phương $vect(u) = (0; 1; 0)$ và đi qua $A(8; 0; 4)$. 
    Vì $vect(u) perp vect(k)$ và $A in.not (alpha)$ nên $d parallel (alpha)$.
    Khoảng cách từ $d$ đến $(alpha)$ là $h = d(A, (alpha)) = 4$.
    
    Hình chiếu vuông góc của $d$ lên $(alpha)$ là đường thẳng $d'$ có phương trình: $cases(x = 8, y = t, z = 0)$.
    Trong mặt phẳng $(alpha)$, khoảng cách từ tâm $H$ đến $d'$ là $p = d(H, d') = 8$.
    
    Vì $p > r$ ($8 > 5$), khoảng cách ngắn nhất từ $M in (C)$ đến $d'$ là $p - r = 8 - 5 = 3$.
    
    Khoảng cách ngắn nhất trong không gian từ $M$ đến $N$ là:
    $ min M N = sqrt(h^2 + 3^2) = sqrt(4^2 + 3^2) = 5. $
    
    #meo[
      Khi gặp đường thẳng song song với mặt phẳng chứa đường tròn (Trường hợp B), hãy tách bài toán thành 2 thành phần vuông góc: "độ cao" $h$ không đổi và "bài toán phẳng" trên mặt phẳng hình chiếu. Sử dụng định lý Pythagore để tính kết quả cuối cùng.
    ]
  ]
)
// #exam-part(title: "TRẮC NGHIỆM TRẢ LỜI NGẮN")



#let hinh-minh-hoa = cetz.canvas({
  import cetz.draw: *

  // chiếu 3D -> 2D
  let prj(x, y, z) = (x - 0.6*y, 0.35*y + z)

  let H = prj(0, 0, 0)
  let N = prj(8, 0, 4)
  let Hprime = prj(8, 0, 0)
  let M = prj(5, 0, 0)

  // Khung mặt phẳng Oxy (chỉ vẽ viền để khỏi dính polygon/fill)
  let A = prj(-6, -6, 0)
  let B = prj(10, -6, 0)
  let C = prj(10,  6, 0)
  let D = prj(-6,  6, 0)
  line(A, B, stroke: 0.5pt + luma(210))
  line(B, C, stroke: 0.5pt + luma(210))
  line(C, D, stroke: 0.5pt + luma(210))
  line(D, A, stroke: 0.5pt + luma(210))
  content(prj(-5.7, 5.7, 0), text(fill: luma(120))[$(O x y)$], anchor: "north-west", padding: 2pt)

  // Trục
  line(prj(-6,0,0), prj(10,0,0), stroke: (dash: "dashed", paint: luma(140)), mark: (end: ">"))
  content(prj(10.7,0,0), [$x$], anchor: "west", padding: 2pt)

  line(prj(0,-6,0), prj(0,6,0), stroke: (dash: "dashed", paint: luma(140)), mark: (end: ">"))
  content(prj(0,6.7,0), [$y$], anchor: "south", padding: 2pt)

  line(prj(0,0,0), prj(0,0,6), stroke: (dash: "dashed", paint: luma(140)), mark: (end: ">"))
  content(prj(0,0,6.7), [$z$], anchor: "south", padding: 2pt)

  // (C): vẽ bằng quét góc
  let circle-points = range(0, 360, step: 3).map(deg => {
    let rad = deg * 1deg
    prj(5 * calc.cos(rad), 5 * calc.sin(rad), 0)
  })
  line(..circle-points, close: true, stroke: 1.2pt + rgb("#0057b8"))
  content(prj(-3.2, 3.6, 0), text(fill: rgb("#0057b8"))[$(C)$], anchor: "south", padding: 2pt)

  // d' và d
  line(prj(8, -6, 0), prj(8, 6, 0), stroke: 1pt + luma(110))
  content(prj(8, 6.6, 0), [$d'$], anchor: "south", padding: 2pt)

  line(prj(8, -6, 4), prj(8, 6, 4), stroke: 1.4pt + rgb("#1a7a2e"))
  content(prj(8, 6.6, 4), text(fill: rgb("#1a7a2e"))[$d$], anchor: "south", padding: 2pt)

  // các đoạn minh hoạ
  line(H, M, stroke: (dash: "dotted", paint: rgb("#0057b8")))
  content(prj(2.5, 0, 0), [$r=5$], anchor: "south", padding: 2pt)

  line(M, Hprime, stroke: (dash: "dotted", paint: luma(80)))
  content(prj(6.5, 0, 0), [$3$], anchor: "south", padding: 2pt)

  line(Hprime, N, stroke: (dash: "dotted", paint: luma(80)))
  content(prj(8, 0, 2), [$h=4$], anchor: "west", padding: 2pt)

  line(M, N, stroke: 1.6pt + rgb("#cc2200"))
  content(prj(6.6, 0, 2), text(fill: rgb("#cc2200"), weight: "bold")[$M N=5$], anchor: "south-west", padding: 2pt)

  // điểm
  circle(H, radius: 1.6pt, fill: black)
  content(H, [$H$], anchor: "north-east", padding: 2pt)

  circle(M, radius: 1.6pt, fill: black)
  content(M, [$M$], anchor: "north", padding: 2pt)

  circle(Hprime, radius: 1.6pt, fill: black)
  content(Hprime, [$H'$], anchor: "north", padding: 2pt)

  circle(N, radius: 1.6pt, fill: black)
  content(N, [$N$], anchor: "south-west", padding: 2pt)
})


#tln(
  [Trong không gian $O x y z$, cho đường tròn $(C)$ là giao tuyến của mặt cầu $(S): x^2 + y^2 + z^2 = 25$ và mặt phẳng $(alpha): z = 0$. Cho đường thẳng $d$ có phương trình $cases(x = 8, y = t, z = 4)$. Tìm giá trị nhỏ nhất của đoạn $M N$ với $M in (C)$ và $N in d$.],
  [$5$],
  fig: hinh-minh-hoa,
  fig-pos: "center",
  fig-width: 100%,
  loigiai: [
    #ppgiai[
      - Nhận xét đường thẳng $d$ song song với mặt phẳng $(alpha)$.
      - Gọi $h$ là khoảng cách từ $d$ đến $(alpha)$, $d'$ là hình chiếu của $d$ lên $(alpha)$.
      - Khoảng cách ngắn nhất $min M N = sqrt(h^2 + (max(0, p - r))^2)$, với $p = d(H, d')$.
    ]
    Đường tròn $(C)$ nằm trong mặt phẳng $O x y$ ($z=0$), có tâm $H(0; 0; 0)$ và bán kính $r = 5$.
    
    Đường thẳng $d$ có vectơ chỉ phương $arrow(u) = (0; 1; 0)$ và đi qua $A(8; 0; 4)$. 
    Vì $arrow(u) perp arrow(k)$ và $A notin (alpha)$ nên $d parallel (alpha)$.
    Khoảng cách từ $d$ đến $(alpha)$ là $h = d(A, (alpha)) = 4$.
    
    Hình chiếu vuông góc của $d$ lên $(alpha)$ là đường thẳng $d'$ có phương trình: $cases(x = 8, y = t, z = 0)$.
    Trong mặt phẳng $(alpha)$, khoảng cách từ tâm $H$ đến $d'$ là $p = d(H, d') = 8$.
    
    Vì $p > r$ ($8 > 5$), khoảng cách ngắn nhất từ $M in (C)$ đến $d'$ là $p - r = 8 - 5 = 3$.
    
    Khoảng cách ngắn nhất trong không gian từ $M$ đến $N$ là:
    $ min M N = sqrt(h^2 + 3^2) = sqrt(4^2 + 3^2) = 5. $
    
    #meo[
      Khi gặp đường thẳng song song với mặt phẳng chứa đường tròn (Trường hợp B), hãy tách bài toán thành 2 thành phần vuông góc: "độ cao" $h$ không đổi và "bài toán phẳng" trên mặt phẳng hình chiếu. Sử dụng định lý Pythagore để tính kết quả cuối cùng.
    ]
  ]
)

