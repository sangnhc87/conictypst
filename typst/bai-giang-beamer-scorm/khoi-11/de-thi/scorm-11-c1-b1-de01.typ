// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHƯƠNG 1. LƯỢNG GIÁC
// Lớp: Khối 11  ·  Mã đề: 101  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")

// Standalone: math đen; beamer: màu toán do sang-beamer-theme tự xử lý
#show math.equation.where(block: true): it => math.display(it.body)
// Standalone: hàm câu hỏi từ sang-exam (beamer dùng hàm được truyền vào)



// make-questions — exportable cho Beamer.typ, không cần --input beamer=1

#show: lecture-theme.with(
  title: "CHƯƠNG 1. LƯỢNG GIÁC",
  subtitle: "ÔN TẬP CHƯƠNG 1 — MÃ ĐỀ: 101",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 101]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        })
      )
    ]
  }
]

#let exam-part(title, count: none) = {
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
  count: 12,
)

// TN 1
#lt-tn(num: 1, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Số đo radian của góc $120^circ$ là],
    (
        True([$(2pi) / 3$]),
        [$(3pi) / 2$],
        [$(pi) / 3$],
        [$(4pi) / 3$]
    ),
    loigiai: [
        Ta có $120^circ = (120 dot pi) / 180 = (2pi) / 3$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Một đường tròn có bán kính $R = 10 "cm"$. Độ dài của cung tròn có số đo $pi/5$ radian là],
    (
        [$5 "cm"$],
        [$2 "cm"$],
        True([$2pi "cm"$]),
        [$5pi "cm"$]
    ),
    loigiai: [
        Độ dài cung là $l = R alpha = 10 dot pi/5 = 2pi " (cm)".$
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Tập xác định của hàm số $y = tan x$ là],
    (
        True([$RR setminus { (pi)/2 + k pi, k in ZZ}$]),
        [$RR setminus { k pi, k in ZZ}$],
        [$RR$],
        [$[-1; 1]$] 
    ),
    loigiai: [
        Hàm số $y = tan x$ xác định khi 
        $
          cos x != 0 <=> x != (pi)/2 + k pi, k in ZZ
        $
.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Tập giá trị của hàm số $y = 3 sin(2 x) - 1$ là],
    (
        True([$[-4; 2]$]),
        [$[-1; 3]$],
        [$[-3; 3]$],
        [$[-2; 4]$]
    ),
    loigiai: [
        Ta có $-1 <= sin(2 x) <= 1$.

        Suy ra 
        $
          -3 <= 3 sin(2 x) <= 3 <=> -4 <= 3 sin(2 x) - 1 <= 2
        $
.

        Vậy tập giá trị là $[-4; 2]$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho đồ thị của hàm số $y = sin x$ trên đoạn $[-pi; pi]$ như hình vẽ dưới đây.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-3.14, 0), (3.14, 0), mark: (end: ">"), name: "x")
    line((0, -1.5), (0, 1.5), mark: (end: ">"), name: "y")
    content((3.3, -0.3), [$x$])
    content((-0.3, 1.3), [$y$])
    content((-0.2, -0.2), [$O$])
    
    let pts = ()
    for i in range(0, 100) {
      let x = -3.14159 + (i/99) * 6.28318
      pts.push((x, calc.sin(x * 1rad)))
    }
    line(..pts, stroke: 1pt + blue)
    
    // marks
    content((1.57, -0.3), [$pi/2$])
    content((-1.57, -0.3), [$-pi/2$])
    content((3.14, -0.3), [$pi$])
    content((-3.14, -0.3), [$-pi$])
    
    line((1.57, 0), (1.57, 1), stroke: (dash: "dashed"))
    line((-1.57, 0), (-1.57, -1), stroke: (dash: "dashed"))
  })
]
Hàm số đồng biến trên khoảng nào dưới đây?],
    (
        True([$(-pi/2; pi/2)$]),
        [$(0; pi)$],
        [$(-pi; 0)$],
        [$(pi/2; pi)$]
    ),
    loigiai: [
        Quan sát đồ thị từ trái sang phải, ta thấy đồ thị đi lên (hàm số đồng biến) trong khoảng $x in (-pi/2; pi/2)$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Chu kì tuần hoàn của hàm số $y = sin(2 x)$ là],
    (
        True([$pi$]),
        [$2pi$],
        [$(pi)/2$],
        [$4pi$]
    ),
    loigiai: [
        Chu kì tuần hoàn của hàm số $y = sin(a x)$ là $T = (2pi) / |a|$. Vậy chu kì của $y = sin(2 x)$ là $T = (2pi) / 2 = pi$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",
    [Đồ thị của một hàm số đi qua gốc toạ độ $O(0;0)$ và đạt cực đại đầu tiên bên phải trục tung tại $x = pi/2$. Hàm số đó là hàm số nào?],
    (
        True([$y = sin x$]),
        [$y = cos x$],
        [$y = tan x$],
        [$y = cot x$]
    ),
    loigiai: [
        Đồ thị đi qua gốc toạ độ $O(0;0)$ và đạt giá trị cực đại đầu tiên phía x dương tại $x = (pi)/2$. Đây là đặc điểm của đồ thị hàm số $y = sin x$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Số nghiệm của phương trình $cos x = 1/2$ trên đoạn $[0; 2pi]$ là],
    (
        True([$2$]),
        [$1$],
        [$3$],
        [$4$]
    ),
    loigiai: [
        Phương trình 
        $
          cos x = 1/2 <=> x = (pi)/3 + k 2pi
        $
 hoặc $x = -(pi)/3 + k 2pi , (k in ZZ)$.

        Trên đoạn $[0; 2pi]$, phương trình có $2$ nghiệm là $x = (pi)/3$ và $x = (5pi)/3$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Nghiệm của phương trình $sin x = 0$ là],
    (
        True([$x = k pi, k in ZZ$]),
        [$x = (pi)/2 + k pi, k in ZZ$],
        [$x = k 2pi, k in ZZ$],
        [$x = (pi)/2 + k 2pi, k in ZZ$]
    ),
    loigiai: [
        Ta có 
        $
          sin x = 0 <=> x = k pi (k in ZZ)
        $
.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Nghiệm của phương trình $tan x = 1$ là],
    (
        True([$x = (pi)/4 + k pi, k in ZZ$]),
        [$x = (pi)/4 + k 2pi, k in ZZ$],
        [$x = -(pi)/4 + k pi, k in ZZ$],
        [$x = (pi)/2 + k pi, k in ZZ$]
    ),
    loigiai: [
        Ta có 
        $
          tan x = 1 <=> tan x = tan((pi)/4) <=> x = (pi)/4 + k pi (k in ZZ)
        $
.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Một bánh xe có $72$ răng. Số đo góc (theo radian) mà bánh xe quay được khi quay $10$ răng là],
    (
        True([$(5pi)/18$]),
        [$(5pi)/36$],
        [$50^circ$],
        [$10pi$]
    ),
    loigiai: [
        Bánh xe quay 1 vòng (72 răng) tương ứng với góc $2pi$ radian.

        Khi quay 10 răng, bánh xe quay được một góc là $(10/72) dot 2pi = (5pi)/18$ radian.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Chiều cao $h(t)$ của một con lắc lò xo so với mặt đất tại thời điểm $t$ giây được cho bởi phương trình $h(t) = 15 sin(pi t) + 30 ("cm")$. Chiều cao lớn nhất của con lắc so với mặt đất là],
    (
        True([$45 " cm"$]),
        [$30 " cm"$],
        [$15 " cm"$],
        [$60 " cm"$]
    ),
    loigiai: [
        Vì $-1 <= sin(pi t) <= 1$ nên $h(t) <= 15 dot 1 + 30 = 45$.

        Chiều cao lớn nhất là $45 " cm"$, đạt được khi $sin(pi t) = 1$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",
    [Nhiệt độ trung bình $T$ (tính bằng $circ C$) của một thành phố trong năm được mô hình hóa bởi hàm số 
$ T(t) = 15 sin(pi/6 (t - 3)) + 20 $
trong đó $t$ là tháng trong năm ($1 <= t <= 12$, $t in NN$). Biểu đồ mô phỏng nhiệt độ như hình vẽ dưới đây.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (13, 0), mark: (end: ">"), name: "t")
    line((0, 0), (0, 4), mark: (end: ">"), name: "T")
    content((12.5, -0.3), [$t$])
    content((-0.3, 3.8), [$T$])
    content((-0.2, -0.2), [$O$])
    
    let pts = ()
    for i in range(10, 120) {
      let t = i / 10
      let T = 15 * calc.sin(3.14159/6 * (t - 3) * 1rad) + 20
      pts.push((t, T/10))
    }
    line(..pts, stroke: 1pt + orange)
    for t in (3, 6, 9, 12) {
      content((t, -0.3), [#t])
      line((t, 0), (t, 0.1), stroke: 1pt)
    }
  })
]
Các mệnh đề sau đúng hay sai?],
    (
        [Nhiệt độ trung bình lớn nhất trong năm là $20^circ C$.],
        True([Nhiệt độ trung bình thấp nhất trong năm là $5^circ C$.]),
        [Tháng nóng nhất trong năm là tháng 5.],
        True([Vào tháng 12, nhiệt độ trung bình của thành phố là $5^circ C$.])
    ),
    loigiai: [
        a) Sai. Ta có $-1 <= sin(pi/6 (t - 3)) <= 1$. Nhiệt độ lớn nhất là $max T = 15(1) + 20 = 35^circ C$.
        
        b) Đúng. Nhiệt độ thấp nhất là $min T = 15(-1) + 20 = 5^circ C$.
        
        c) Sai. Nhiệt độ đạt cực đại khi 
        $
          sin(pi/6 (t - 3)) = 1 <=> pi/6 (t - 3) = pi/2 <=> t - 3 = 3 <=> t = 6
        $
. Tháng nóng nhất là tháng 6.
        
        d) Đúng. Tại $t = 12$, $T(12) = 15 sin(pi/6 (12 - 3)) + 20 = 15 sin(3pi/2) + 20 = 15(-1) + 20 = 5^circ C$.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",
    [Cho phương trình lượng giác $sin(2 x) = 1/2$. Xét tính đúng sai của các mệnh đề sau:],
    (
        [Phương trình có nghiệm là $x = pi/12 + k pi$ và $x = (5pi)/12 + k pi (k in ZZ)$.],
        True([Nghiệm âm lớn nhất của phương trình là $x = -(7pi)/12$.]),
        True([Phương trình có $2$ nghiệm thuộc khoảng $(0; pi)$.]),
        [Tổng các nghiệm của phương trình trên đoạn $[0; 2pi]$ bằng $2pi$.]
    ),
    loigiai: [
        a) đúng. 
        $
          sin(2 x) = 1/2 <=> 2x = pi/6 + k 2pi
        $
 hoặc 
        $
          2x = (5pi)/6 + k 2pi <=> x = pi/12 + k pi
        $
 hoặc $x = (5pi)/12 + k pi (k in ZZ)$.

        b) đúng. 
        Với họ $x = pi/12 + k pi$, nghiệm âm lớn nhất khi $k = -1$ là $x = -11pi/12$.
        Với họ $x = (5pi)/12 + k pi$, nghiệm âm lớn nhất khi $k = -1$ là $x = -7pi/12$.
        So sánh hai nghiệm, ta thấy $-7pi/12 > -11pi/12$.

        c) đúng.
        Trên khoảng $(0; pi)$, họ $x = pi/12 + k pi$ có nghiệm $x = pi/12$ ($k=0$).
        Họ $x = (5pi)/12 + k pi$ có nghiệm $x = (5pi)/12$ ($k=0$).
        Vậy phương trình có 2 nghiệm.

        d) sai.
        Trên đoạn $[0; 2pi]$, các nghiệm là $pi/12$, $(5pi)/12$, $13pi/12$, $17pi/12$.
        Tổng các nghiệm bằng $(36pi)/12 = 3pi$.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",
    [Cho hàm số $y = cos^2 x - 2 cos x + 3$. Xét tính đúng sai của các mệnh đề sau:],
    (
        True([Đặt $t = cos x$, điều kiện của $t$ là $t in [-1; 1]$.]),
        True([Hàm số đạt giá trị nhỏ nhất bằng $2$.]),
        [Hàm số đạt giá trị lớn nhất bằng $5$.],
        True([Đồ thị hàm số nhận trục tung làm trục đối xứng.])
    ),
    loigiai: [
        a) đúng. Do $-1 <= cos x <= 1$ với mọi $x$.

        b) đúng.
        Xét hàm $f(t) = t^2 - 2t + 3$ trên $[-1; 1]$.
        Bảng biến thiên của $f(t)$ cho thấy hàm nghịch biến trên $[-1; 1]$, đạt giá trị nhỏ nhất tại $t = 1$ với $f(1) = 2$.
        Suy ra $min y = 2$ khi $cos x = 1$.

        c) sai. Đạt giá trị lớn nhất tại $t = -1$ với $f(-1) = 6$. Vậy $max y = 6$.

        d) đúng. Do $y(-x) = cos^2(-x) - 2 cos(-x) + 3 = cos^2 x - 2 cos x + 3 = y(x)$ nên hàm số là hàm số chẵn, đồ thị nhận trục tung làm trục đối xứng.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",
    [Mực nước cao nhất tại một cảng biển là $16 " m"$ và thấp nhất là $10 " m"$. Một hàm số lượng giác dạng $h(t) = A cos(omega t) + B$ được dùng để mô hình hoá chiều cao mực nước (tính bằng mét) theo thời gian $t$ (tính bằng giờ, $0 <= t <= 24$). Biết rằng lúc $t=0$ mực nước đạt cao nhất và chu kì của thuỷ triều là $12$ giờ. Hình vẽ dưới đây mô phỏng sự lên xuống của mực nước.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (7, 0), mark: (end: ">"), name: "t")
    line((0, 0), (0, 4.5), mark: (end: ">"), name: "h")
    content((6.8, -0.3), [$t$])
    content((-0.3, 4.3), [$h$])
    content((-0.2, -0.2), [$O$])
    
    let pts = ()
    for i in range(0, 100) {
      let t = (i/99) * 24
      // Map h from [10, 16] to [2.5, 4]
      let h = 3 * calc.cos(3.14159/6 * t * 1rad) + 13
      pts.push((t / 4, h / 4))
    }
    line(..pts, stroke: 1pt + teal)
    
    for t in (6, 12, 18, 24) {
      content((t/4, -0.3), [#t])
      line((t/4, 0), (t/4, 0.1), stroke: 1pt)
    }
  })
]
Xét tính đúng sai của các mệnh đề sau:],
    (
        True([Giá trị của $A$ bằng $3$.]),
        True([Giá trị của $B$ bằng $13$.]),
        [Tần số góc $omega = pi/12$.],
        [Mực nước tại thời điểm $t = 2$ giờ là $11,5 " m"$.]
    ),
    loigiai: [
        a) Đúng, b) Đúng. Ta có $max h = A + B = 16$ và $min h = -A + B = 10$. Giải hệ phương trình ta được $A = 3$, $B = 13$. 
        
        c) Sai. Chu kì $T = 12$ giờ nên $omega = (2pi)/T = (2pi)/12 = pi/6 \ ("rad/h")$.
        
        d) Sai. Phương trình mực nước là $h(t) = 3 cos((pi)/6 t) + 13$. Tại $t = 2$, mực nước là $h(2) = 3 cos((pi)/3) + 13 = 3 (1/2) + 13 = 14,5 " m"$.
    ]
)

#exam-part(
    [
      #set text(fill: rgb("d32f2f"))
      PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)

// TLN 1
#lt-tln(num: 17, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Một chiếc quạt giấy có bán kính $25 " cm"$. Khi mở rộng tối đa, góc ở tâm của vành quạt là $140^circ$. Tính chiều dài vành quạt (làm tròn đến hàng phần mười của cm).],
    [61,1],
    loigiai: [
        Đổi $140^circ = 140 dot pi / 180 = (7pi)/9$ (rad).
        Độ dài vành quạt là $l = R alpha = 25 dot (7pi)/9 = (175pi)/9 approx 61,1 " cm"$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Có bao nhiêu giá trị nguyên của tham số $m$ để phương trình $3 sin x - m + 2 = 0$ có nghiệm?],
    [7],
    loigiai: [
        Ta có $sin x = (m - 2)/3$.

        Phương trình có nghiệm khi và chỉ khi 
        $
          -1 <= (m - 2)/3 <= 1 <=> -3 <= m - 2 <= 3 <=> -1 <= m <= 5
        $
.

        Vì $m in ZZ$ nên $m in {-1; 0; 1; 2; 3; 4; 5}$.

        Vậy có $7$ giá trị nguyên của $m$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Tìm số nghiệm của phương trình $cos(2 x) - sin x = 0$ trên khoảng $(0; 3pi)$.],
    [5],
    loigiai: [
        Phương trình tương đương với 
        $
          1 - 2 sin^2 x - sin x = 0 <=> 2 sin^2 x + sin x - 1 = 0
        $
. Giải ra ta được $sin x = 1/2$ hoặc $sin x = -1$.\
        Trường hợp 1: 
        $
          sin x = 1/2 <=> x = pi/6 + k 2pi
        $
 hoặc $x = (5pi)/6 + k 2pi (k in ZZ)$. Trên khoảng $(0; 3pi)$, ta được các nghiệm $pi/6, (13pi)/6$ và $(5pi)/6, (17pi)/6$.\
        Trường hợp 2: 
        $
          sin x = -1 <=> x = -pi/2 + k 2pi (k in ZZ)
        $
. Trên khoảng $(0; 3pi)$, ta được nghiệm $x = (3pi)/2$.
        Vậy phương trình có tất cả $5$ nghiệm trên khoảng đã cho.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = 2 sin^2 x - 4 sin x + m$. Tìm $m$ để giá trị nhỏ nhất của hàm số bằng $3$.],
    [5],
    loigiai: [
        Đặt $t = sin x$, với $t in [-1; 1]$.

        Hàm số trở thành $f(t) = 2t^2 - 4t + m$ trên đoạn $[-1; 1]$.

        Bảng biến thiên của $f(t)$ trên $[-1; 1]$ cho thấy hàm số nghịch biến trên $[-1; 1]$, vì đỉnh của parabol là $t_0 = -(-4)/4 = 1 in [-1; 1]$.

        Vậy giá trị nhỏ nhất đạt được tại $t = 1$, tức là $f(1) = 2(1)^2 - 4(1) + m = m - 2$.

        Theo bài ra, 
        $
          min y = 3 <=> m - 2 = 3 <=> m = 5
        $
.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Huyết áp của một người được đo đạc và có thể mô hình hoá bởi hàm số $p(t) = 115 + 25 sin(160pi t)$, trong đó $p(t)$ là huyết áp tính bằng mmHg và $t$ là thời gian tính bằng phút. Biết nhịp tim của người này được tính là số chu kì của hàm số trong một phút. Tính nhịp tim của người đó (nhịp/phút).],
    [80],
    loigiai: [
        Chu kì của hàm số $p(t)$ là $T = (2pi) / 160pi = 1/80$ (phút).

        Số chu kì trong một phút, tức là nhịp tim, là $1 / T = 80$ (nhịp/phút).
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Một vòng quay Mặt Trời có bán kính $20 " m"$ và quay với tốc độ $2$ vòng mỗi giờ. Điểm thấp nhất của cabin cách mặt đất $5 " m"$. Cabin bắt đầu từ vị trí thấp nhất. Khoảng thời gian ngắn nhất (tính bằng phút) để cabin đạt độ cao $15 " m"$ là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // ground
    line((-2, 0), (2, 0), stroke: 2pt)
    content((2.5, 0), [Mặt đất])
    
    // wheel
    circle((0, 2.5), radius: 2, stroke: 1pt + black)
    
    // supports
    line((-1.5, 0), (0, 2.5), stroke: 2pt + gray)
    line((1.5, 0), (0, 2.5), stroke: 2pt + gray)
    
    // cabin at bottom
    content((0, 0.2), [$5$m])
    content((-2.5, 2.5), [$25$m])
    content((0, 4.8), [$45$m])
    
    // center
    circle((0, 2.5), radius: 0.1, fill: black)
    
    // arrow for rotation
    arc((2.3, 2.5), start: 0deg, stop: 60deg, radius: 2.3, mark: (end: ">"))
    content((2, 3.5), [$omega$])
  })
]],
    [5],
    loigiai: [
        Tâm vòng quay cách mặt đất là $20 + 5 = 25 " m"$. 
        
        Chu kì quay là $60/2 = 30$ phút. 
        
        Tần số góc $omega = (2pi)/30 = pi/15 ("rad/phút")$. 
        
        Độ cao cabin được mô hình hoá bởi $h(t) = -20 cos((pi/15) t) + 25$ (do $t=0$ ở vị trí thấp nhất $h=5$). 
        
        Yêu cầu 
        $
          h(t) = 15 <=> -20 cos((pi/15) t) + 25 = 15 <=> cos((pi/15) t) = 1/2
        $
. 
        
        Thời điểm ngắn nhất tương ứng với góc nhỏ nhất dương nên 
        $
          (pi/15) t = pi/3 => t = 5
        $
 phút.
    ]
)

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG 1. LƯỢNG GIÁC!]      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
