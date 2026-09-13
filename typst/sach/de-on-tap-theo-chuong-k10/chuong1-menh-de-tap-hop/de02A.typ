#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
#let gach_cheo(x1, x2, y: 0, h: 0.15) = {
  import cetz.draw: *
  let step = 0.15
  let n = std.int((x2 - x1) / step)
  for i in std.range(n + 1) {
    let px = x1 + i * step
    line((px, y + h), (px - h, y - h), stroke: 0.5pt + rgb("555"))
  }
}

#let venn2(
  title: "Khảo sát",
  name-a: "TẬP A",
  name-b: "TẬP B",
  only-a: "0",
  both: "0",
  only-b: "0",
  outside: none,
  color-a: rgb("0284c7"),
  fill-a: rgb(56, 189, 248, 30%),
  color-b: rgb("e11d48"),
  fill-b: rgb(251, 113, 133, 30%),
  width: 9.2cm,
  height: 5.6cm,
) = align(center)[
  #box(
    stroke: 0.8pt + rgb("cbd5e1"),
    radius: 8pt,
    fill: rgb("f8fafc"),
    inset: 10pt,
    width: width,
    height: height,
    {
      place(top + left, rect(
        fill: rgb("e2e8f0"),
        radius: 4pt,
        inset: (x: 6pt, y: 3pt),
        text(size: 8.5pt, weight: "bold", fill: rgb("475569"))[#title]
      ))
      
      place(center + horizon, dx: -1.3cm, dy: 0.35cm, std.circle(radius: 1.45cm, fill: fill-a, stroke: 1.5pt + color-a))
      place(center + horizon, dx: 1.3cm, dy: 0.35cm, std.circle(radius: 1.45cm, fill: fill-b, stroke: 1.5pt + color-b))
      
      place(center + horizon, dx: -1.8cm, dy: -1.6cm, text(size: 10pt, weight: "bold", fill: color-a)[#name-a])
      place(center + horizon, dx: 1.8cm, dy: -1.6cm, text(size: 10pt, weight: "bold", fill: color-b)[#name-b])
      
      place(center + horizon, dx: -1.45cm, dy: 0.35cm, text(size: 13pt, weight: "bold", fill: color-a.darken(25%))[#only-a])
      place(center + horizon, dx: 0cm, dy: 0.35cm, text(size: 13pt, weight: "bold", fill: rgb("581c87"))[#both])
      place(center + horizon, dx: 1.45cm, dy: 0.35cm, text(size: 13pt, weight: "bold", fill: color-b.darken(25%))[#only-b])
      
      if outside != none [
        #place(bottom + right, rect(
          fill: rgb("f1f5f9"),
          stroke: 0.5pt + rgb("cbd5e1"),
          radius: 4pt,
          inset: (x: 5pt, y: 2.5pt),
          text(size: 8.5pt, weight: "bold", fill: rgb("64748b"))[Bên ngoài: #outside]
        ))
      ]
    }
  )
]

#let venn3(
  title: "Khảo sát 3 tập hợp",
  name-a: "Tập A",
  name-b: "Tập B",
  name-c: "Tập C",
  a-only: "0",
  b-only: "0",
  c-only: "0",
  ab-only: "0",
  bc-only: "0",
  ca-only: "0",
  abc: "0",
  outside: none,
  width: 9.6cm,
  height: 7.4cm,
) = align(center)[
  #box(
    stroke: 0.8pt + rgb("cbd5e1"),
    radius: 8pt,
    fill: rgb("f8fafc"),
    inset: 10pt,
    width: width,
    height: height,
    {
      place(top + left, rect(
        fill: rgb("e2e8f0"),
        radius: 4pt,
        inset: (x: 6pt, y: 3pt),
        text(size: 8.5pt, weight: "bold", fill: rgb("475569"))[#title]
      ))
      
      let ca = rgb("0284c7")
      let fa = rgb(56, 189, 248, 28%)
      let cb = rgb("e11d48")
      let fb = rgb(251, 113, 133, 28%)
      let cc = rgb("16a34a")
      let fc = rgb(74, 222, 128, 28%)
      
      place(center + horizon, dx: -1.15cm, dy: -0.65cm, std.circle(radius: 1.45cm, fill: fa, stroke: 1.4pt + ca))
      place(center + horizon, dx: 1.15cm, dy: -0.65cm, std.circle(radius: 1.45cm, fill: fb, stroke: 1.4pt + cb))
      place(center + horizon, dx: 0cm, dy: 1.05cm, std.circle(radius: 1.45cm, fill: fc, stroke: 1.4pt + cc))
      
      place(center + horizon, dx: -2.3cm, dy: -2.3cm, text(size: 10pt, weight: "bold", fill: ca)[#name-a])
      place(center + horizon, dx: 2.3cm, dy: -2.3cm, text(size: 10pt, weight: "bold", fill: cb)[#name-b])
      place(center + horizon, dx: 0cm, dy: 2.85cm, text(size: 10pt, weight: "bold", fill: cc)[#name-c])
      
      place(center + horizon, dx: -1.35cm, dy: -0.95cm, text(size: 11.5pt, weight: "bold", fill: ca.darken(25%))[#a-only])
      place(center + horizon, dx: 1.35cm, dy: -0.95cm, text(size: 11.5pt, weight: "bold", fill: cb.darken(25%))[#b-only])
      place(center + horizon, dx: 0cm, dy: 1.45cm, text(size: 11.5pt, weight: "bold", fill: cc.darken(25%))[#c-only])
      
      place(center + horizon, dx: 0cm, dy: -1.05cm, text(size: 10.5pt, weight: "bold", fill: rgb("7c3aed"))[#ab-only])
      place(center + horizon, dx: 0.85cm, dy: 0.35cm, text(size: 10.5pt, weight: "bold", fill: rgb("c2410c"))[#bc-only])
      place(center + horizon, dx: -0.85cm, dy: 0.35cm, text(size: 10.5pt, weight: "bold", fill: rgb("0f766e"))[#ca-only])
      
      place(center + horizon, dx: 0cm, dy: 0.05cm, text(size: 12pt, weight: "bold", fill: rgb("1e1b4b"))[#abc])
      
      if outside != none [
        #place(bottom + right, rect(
          fill: rgb("f1f5f9"),
          stroke: 0.5pt + rgb("cbd5e1"),
          radius: 4pt,
          inset: (x: 5pt, y: 2.5pt),
          text(size: 8.5pt, weight: "bold", fill: rgb("64748b"))[Bên ngoài: #outside]
        ))
      ]
    }
  )
]
// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 1",
  exam-title: "BÀI 2 & 3: TẬP HỢP VÀ CÁC PHÉP TOÁN (ĐỀ SỐ 1)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho tập hợp $A = {x in ZZ | -2 < x <= 1}$. Cách viết nào sau đây dưới dạng liệt kê các phần tử là đúng?],
    (
        [${-2; -1; 0; 1}$],
        True([${-1; 0; 1}$]),
        [${-2; -1; 0}$],
        [${0; 1}$]
    ),
    loigiai: [
        Vì $x in ZZ$ và $-2 < x <= 1$ nên $x$ có thể nhận các giá trị nguyên là $-1, 0, 1$.
        Vậy $A = {-1; 0; 1}$.
    ]
)

// TN 2
#tn([Ký hiệu nào sau đây thể hiện tập hợp các số thực lớn hơn hoặc bằng $3$ và nhỏ hơn $7$?],
    (
        [$(3; 7)$],
        True([$[3; 7)$]),
        [$(3; 7]$],
        [$[3; 7]$]
    ),
    loigiai: [
        Tập hợp các số thực $x$ thỏa mãn $3 <= x < 7$ được ký hiệu là nửa khoảng $[3; 7)$.
    ]
)

// TN 3
#tn([Trong các tập hợp sau, tập hợp nào là tập rỗng?],
    (
        [${x in ZZ | x^2 - 9 = 0}$],
        [${x in RR | x^2 + 2x + 1 = 0}$],
        True([${x in QQ | x^2 - 2 = 0}$]),
        [${0}$]
    ),
    loigiai: [
        - $x^2 - 9 = 0 <=> x = +-3 in ZZ$ (có 2 phần tử).
        - $x^2 + 2x + 1 = 0 <=> x = -1 in RR$ (có 1 phần tử).
        - $x^2 - 2 = 0 <=> x = +-sqrt(2) notin QQ$. Vậy tập hợp này không có phần tử nào (tập rỗng).
        - Tập ${0}$ có chứa đúng 1 phần tử là số $0$, không phải tập rỗng.
    ]
)

// TN 4
#tn([Cho hai tập hợp $A = {1; 2; 3}$ và $B = {1; 2; 3; 4; 5}$. Khẳng định nào sau đây là *sai*?],
    (
        [$A subset B$],
        [$A cup B = B$],
        [$A cap B = A$],
        True([$B setminus A = emptyset$])
    ),
    loigiai: [
        - Mọi phần tử của $A$ đều nằm trong $B$ nên $A subset B$ (Đúng).
        - Khi $A subset B$ thì hợp của chúng là $B$, giao của chúng là $A$ (Đúng).
        - $B setminus A = {4; 5} != emptyset$. Khẳng định này là *sai*.
    ]
)

// TN 5
#tn([Hình vẽ sau đây (phần không bị gạch chéo) biểu diễn tập hợp nào trên trục số?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-1, 0), (7, 0), mark: (end: ">"))
    content((7.2, -0.3), [$x$])
    // Vạch số
    content((1, -0.4), [$-2$])
    content((5, -0.4), [$3$])
    // Gạch chéo
    gach_cheo(-1, 1)
    gach_cheo(5, 6.8)
    // Ngoặc
    content((1, 0), text(size: 14pt)[$[$])
    content((5, 0), text(size: 14pt)[$)$])
  })
]
],
    (
        [$( -2 ; 3 ]$],
        [$[ -2 ; 3 ]$],
        True([$[ -2 ; 3 )$]),
        [$( -2 ; 3 )$]
    ),
    loigiai: [
        Phần tô đậm nằm giữa số $-2$ và $3$. Tại $-2$ dùng ngoặc vuông "$[$" biểu thị lấy dấu bằng, tại $3$ dùng ngoặc tròn "$)$" biểu thị không lấy dấu bằng.
        Vậy hình vẽ biểu diễn nửa khoảng $[ -2; 3 )$.
    ]
)

// TN 6
#tn([Cho hai tập hợp $A = {a; b; c}$ và $B = {c; d; e}$. Tìm tập hợp $A cap B$.],
    (
        [${a; b}$],
        True([${c}$]),
        [${a; b; c; d; e}$],
        [${d; e}$]
    ),
    loigiai: [
        Tập hợp giao $A cap B$ gồm các phần tử vừa thuộc $A$ vừa thuộc $B$.
        Ta thấy chỉ có phần tử $c$ là chung. Do đó $A cap B = {c}$.
    ]
)

// TN 7
#tn([Cho $A = (-infty; 5)$ và $B = [-2; +infty)$. Tìm $A cup B$.],
    (
        [$[-2; 5)$],
        [$( -infty ; -2 )$],
        [$[5 ; +infty )$],
        True([$RR$])
    ),
    loigiai: [
        - $A$ chứa tất cả các số nhỏ hơn $5$.
        - $B$ chứa tất cả các số lớn hơn hoặc bằng $-2$.
        Hợp của $A$ và $B$ sẽ che phủ toàn bộ trục số. Vậy $A cup B = RR$.
        
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Tập A
            content((-4, 1), $A$)
            line((-3, 1), (7, 1), mark: (end: ">"))
            content((5, 0.6), [$5$])
            content((5, 1), text(size: 14pt)[$)$])
            gach_cheo(5, 6.8, y: 1)
            
            // Tập B
            content((-4, 0), $B$)
            line((-3, 0), (7, 0), mark: (end: ">"))
            content((-2, -0.4), [$-2$])
            content((-2, 0), text(size: 14pt)[$[$])
            gach_cheo(-3, -2, y: 0)
            
            // A cup B
            content((-4, -1), $A cup B$)
            line((-3, -1), (7, -1), mark: (end: ">"))
          })
        ]
    ]
)

// TN 8
#tn([Gọi $C_RR A$ là phần bù của tập hợp $A$ trong $RR$. Nếu $A = [-1; 3)$ thì $C_RR A$ là tập hợp nào sau đây?],
    (
        [$( -infty ; -1 ) cup [ 3 ; +infty )$],
        [$( -infty ; -1 ] cup ( 3 ; +infty )$],
        True([$( -infty ; -1 ) cup [ 3 ; +infty )$]),
        [$( -infty ; -1 ] cup [ 3 ; +infty )$]
    ),
    loigiai: [
        Phần bù của $A$ trong $RR$ là $RR setminus A$.
        $RR setminus [-1; 3) = (-infty; -1) cup [3; +infty)$.
    ]
)

// TN 9
#tn([Cho tập hợp $X$ có đúng $3$ phần tử. Hỏi tập $X$ có tất cả bao nhiêu tập hợp con?],
    (
        [3],
        [6],
        True([8]),
        [9]
    ),
    loigiai: [
        Số tập hợp con của một tập hợp có $n$ phần tử là $2^n$.
        Với $n = 3$, số tập hợp con là $2^3 = 8$.
    ]
)

// TN 10
#tn([Lớp 10A có 25 học sinh thích môn Toán, 20 học sinh thích môn Văn. Biết rằng lớp có 15 học sinh thích cả hai môn Toán và Văn. Hỏi có bao nhiêu học sinh chỉ thích môn Toán (mà không thích Văn)?],
    (
        True([10]),
        [5],
        [15],
        [30]
    ),
    loigiai: [
        Số học sinh CHỈ thích môn Toán bằng tổng số học sinh thích môn Toán trừ đi số học sinh thích cả hai môn:
        $ n(text("Chỉ Toán")) = n(text("Toán")) - n(text("Toán và Văn")) = 25 - 15 = 10 $
        
        #venn2(
          title: "Lớp 10A (Khảo sát)",
          name-a: "TOÁN (25)",
          name-b: "VĂN (20)",
          only-a: "10",
          both: "15",
          only-b: "5",
          outside: none,
        )
    ]
)

// TN 11
#tn([Cho hai tập hợp $A = {x; y; z}$ và $B = {x; y; z; t; w}$. Có bao nhiêu tập hợp $X$ thỏa mãn điều kiện $A subset X subset B$?],
    (
        [2],
        [3],
        True([4]),
        [8]
    ),
    loigiai: [
        Vì $A subset X subset B$, tập $X$ bắt buộc phải chứa tất cả các phần tử của $A$ (tức là $x, y, z$).
        Các phần tử còn lại của $X$ được chọn từ tập $B setminus A = {t; w}$.
        Số cách chọn các phần tử thêm vào chính là số tập con của ${t; w}$.
        Vì ${t; w}$ có 2 phần tử nên có $2^2 = 4$ tập con.
    ]
)

// TN 12
#tn([Khẳng định nào sau đây là biểu diễn đúng của phép hiệu hai tập hợp $A setminus B$?],
    (
        [$A setminus B = {x | x in A text(" hoặc ") x notin B}$],
        True([$A setminus B = {x | x in A text(" và ") x notin B}$]),
        [$A setminus B = {x | x notin A text(" và ") x in B}$],
        [$A setminus B = {x | x in A text(" và ") x in B}$]
    ),
    loigiai: [
        Phép hiệu $A setminus B$ bao gồm những phần tử thuộc tập $A$ NHƯNG KHÔNG thuộc tập $B$.
        Ký hiệu toán học: $A setminus B = {x | x in A text(" và ") x notin B}$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Cho các tập hợp $A = (-3; 2]$ và $B = [0; +infty)$. Xét tính đúng sai của các phát biểu sau:],
  (
    [Tập hợp $A cap B = (0; 2]$.],
    True([Tập hợp $A cup B = (-3; +infty)$.]),
    True([Tập hợp $A setminus B = (-3; 0)$.]),
    [Số nguyên dương nhỏ nhất thuộc $B setminus A$ là số $2$.]
  ),
  loigiai: [
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // A
        content((-5, 1.5), $A$)
        line((-4, 1.5), (6, 1.5), mark: (end: ">"))
        content((-1, 1.1), [$-3$]); content((-1, 1.5), text(size: 14pt)[$($])
        content((3, 1.1), [$2$]); content((3, 1.5), text(size: 14pt)[$]$])
        gach_cheo(-4, -1, y: 1.5); gach_cheo(3, 5.8, y: 1.5)
        
        // B
        content((-5, 0.5), $B$)
        line((-4, 0.5), (6, 0.5), mark: (end: ">"))
        content((1, 0.1), [$0$]); content((1, 0.5), text(size: 14pt)[$[$])
        gach_cheo(-4, 1, y: 0.5)

        // A cap B
        content((-5, -0.5), $A cap B$)
        line((-4, -0.5), (6, -0.5), mark: (end: ">"))
        content((1, -0.9), [$0$]); content((1, -0.5), text(size: 14pt)[$[$])
        content((3, -0.9), [$2$]); content((3, -0.5), text(size: 14pt)[$]$])
        gach_cheo(-4, 1, y: -0.5); gach_cheo(3, 5.8, y: -0.5)
      })
    ]
    
    Ta có:
    - $A cap B = [-3; 2] cap [0; +infty) = [0; 2]$. Vậy a) Sai.
    - $A cup B = (-3; 2] cup [0; +infty) = (-3; +infty)$. Vậy b) Đúng.
    - $A setminus B = (-3; 0)$. c) Đúng.
    - $B setminus A = (2; +infty)$. Số nguyên dương nhỏ nhất thuộc tập này là $3$. Vậy d) Sai.
  ]
)

// DS 2
#ds([Cho hai tập hợp được xác định bởi phương trình và bất phương trình:
$X = {x in ZZ | x^2 - 4x + 3 = 0}$ 
$Y = {x in RR | 1 < x <= 4}$],
  (
    True([Tập hợp $X$ có đúng $2$ phần tử và $X = {1; 3}$.]),
    True([Tập hợp $X setminus Y = {1}$.]),
    True([Tập hợp $X cap Y$ chỉ chứa duy nhất một phần tử là số $3$.]),
    [Tất cả các phần tử của $X$ đều là phần tử của $Y$ (tức là $X subset Y$).]
  ),
  loigiai: [
    #step([Tìm các phần tử của tập X])
    Giải phương trình $x^2 - 4x + 3 = 0 <=> x = 1$ hoặc $x = 3$. 
    Vì $1, 3 in ZZ$ nên $X = {1; 3}$. Phát biểu a) Đúng.

    #step([Xét các phép toán tập hợp với Y])
    $Y = (1; 4]$. 
    - $X setminus Y = {1}$. Phát biểu b) Đúng.
    - $X cap Y = {3}$. Phát biểu c) Đúng.
    - Vì $1 notin Y$ nên $X$ không phải là tập con của $Y$. Phát biểu d) Sai.
  ]
)

// DS 3
#ds([Một khảo sát về sở thích thể thao ở một trường THPT với 100 học sinh cho kết quả như sau:
- Có 60 học sinh thích Bóng đá.
- Có 45 học sinh thích Bóng rổ.
- Có 15 học sinh không thích cả hai môn này.],
  (
    True([Có 85 học sinh thích ít nhất một trong hai môn Bóng đá hoặc Bóng rổ.]),
    [Có 15 học sinh thích cả hai môn Bóng đá và Bóng rổ.],
    True([Số học sinh CHỈ thích Bóng đá (không thích Bóng rổ) là 40 học sinh.]),
    [Số học sinh CHỈ thích Bóng rổ chiếm $25%$ tổng số học sinh được khảo sát.]
  ),
  loigiai: [
    #step([Tính số học sinh thích ít nhất 1 môn])
    $n(A cup B) = 100 - 15 = 85$. Vậy a) Đúng.
    
    #step([Tính số học sinh thích cả 2 môn])
    Áp dụng công thức: $n(A cup B) = n(A) + n(B) - n(A cap B)$.
    $85 = 60 + 45 - n(A cap B) => n(A cap B) = 105 - 85 = 20$.
    Vậy có 20 học sinh thích cả hai môn. Phát biểu b) Sai.
    
    #step([Tính số học sinh chỉ thích 1 môn])
    - Chỉ thích Bóng đá = $60 - 20 = 40$. Vậy c) Đúng.
    - Chỉ thích Bóng rổ = $45 - 20 = 25$ ($25%$ tổng số). Vậy d) Đúng.
    
    #venn2(
      title: "Khảo sát: 100 học sinh",
      name-a: "BÓNG ĐÁ (60)",
      name-b: "BÓNG RỔ (45)",
      only-a: "40",
      both: "20",
      only-b: "25",
      outside: "15",
    )
    
    #align(center)[
        #table(
            columns: 4,
            align: center,
            stroke: 0.5pt + luma(200),
            fill: (_, row) => if row == 0 { accent.lighten(80%) } else { none },
            [*Chỉ Bóng đá*], [*Cả hai môn*], [*Chỉ Bóng rổ*], [*Không thích cả 2*],
            [40], [20], [25], [15]
        )
    ]
  ]
)

// DS 4
#ds([Cho hai khoảng $A = (m; m+2)$ và $B = [3; 5)$. Xét các mệnh đề liên quan đến tham số $m$ để hai tập hợp có sự tương quan nhất định:],
  (
    [Điều kiện để $A cap B != emptyset$ là $1 < m < 5$.],
    True([Nếu $m = 3$ thì $A subset B$.]),
    True([Nếu $m = 1$ thì $A cap B = emptyset$.]),
    [Tồn tại đúng $3$ giá trị nguyên của $m$ để $A subset B$.]
  ),
  loigiai: [
    #step([Phân tích điều kiện $A cap B != emptyset$])
    $A cap B = emptyset <=> m+2 <= 3$ hoặc $m >= 5 <=> m <= 1$ hoặc $m >= 5$.
    Để $A cap B != emptyset$, ta lấy phủ định: $1 < m < 5$. Vậy a) Đúng.
    
    #step([Phân tích điều kiện $A subset B$])
    Để $A = (m; m+2) subset B = [3; 5)$, ta cần:
    $ 3 <= m text(" và ") m+2 <= 5 <=> m = 3 $
    - Với $m=3$, $A = (3; 5) subset [3; 5)$. Vậy b) Đúng.
    - Chỉ có DUY NHẤT 1 giá trị $m=3$ nguyên. Vậy d) Sai.
    
    #step([Kiểm tra trường hợp $m=1$])
    Nếu $m=1$, $A = (1; 3)$ và $B = [3; 5) => A cap B = emptyset$. c) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1
#tln([Cho các tập hợp $A = [-3; 6]$ và $B = (2; 10)$. Tập hợp $A cap B$ là khoảng $(a; b]$. Tính tổng $S = a + b$.],
    [8],
    loigiai: [
        #step([Xác định tập hợp giao])
        - Giới hạn dưới: $max(-3, 2) = 2$ (ngoặc tròn).
        - Giới hạn trên: $min(6, 10) = 6$ (ngoặc vuông).
        
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            line((-4, 0), (11, 0), mark: (end: ">"))
            content((-3, -0.4), [$-3$]); content((-3, 0), text(size: 14pt)[$[$])
            content((2, -0.4), [$2$]); content((2, 0), text(size: 14pt)[$($])
            content((6, -0.4), [$6$]); content((6, 0), text(size: 14pt)[$]$])
            content((10, -0.4), [$10$]); content((10, 0), text(size: 14pt)[$)$])
            gach_cheo(-4, -3); gach_cheo(6, 10.8)
            gach_cheo(-4, 2); gach_cheo(10, 10.8)
          })
        ]

        Vậy $A cap B = (2; 6]$.
        
        #step([Tính tổng])
        Dạng $(a; b] => a = 2, b = 6$. Tổng $S = 2 + 6 = 8$.
    ]
)

// TLN 2
#tln([Một nhà hàng tiến hành khảo sát 50 khách hàng về hai món ăn là Phở và Bún chả. Kết quả cho thấy:
- 30 người thích ăn Phở.
- 25 người thích ăn Bún chả.
- 5 người không thích cả hai món này.
Hỏi có bao nhiêu khách hàng thích ăn ĐÚNG MỘT món (chỉ Phở hoặc chỉ Bún chả)?],
    [35],
    loigiai: [
        #step([Tính số khách hàng thích ít nhất 1 món])
        $50 - 5 = 45$ người.
        
        #step([Tính số người thích cả 2 món])
        $n(P cap B) = 30 + 25 - 45 = 10$ người.
        
        #step([Tính số người thích ĐÚNG 1 món])
        - Chỉ Phở: $30 - 10 = 20$ người.
        - Chỉ Bún chả: $25 - 10 = 15$ người.
        Tổng số: $20 + 15 = 35$ người.
        
        #venn2(
          title: "Khảo sát: 50 khách hàng",
          name-a: "PHỞ (30)",
          name-b: "BÚN CHẢ (25)",
          only-a: "20",
          both: "10",
          only-b: "15",
          outside: "5",
        )
    ]
)

// TLN 3
#tln([Tìm số phần tử nguyên của tập hợp $S = (-5; 3) setminus [-2; 1]$.],
    [3],
    loigiai: [
        #step([Thực hiện phép hiệu hai tập hợp])
        $ S = (-5; -2) cup (1; 3) $
        
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            line((-6, 0), (5, 0), mark: (end: ">"))
            content((-5, -0.4), [$-5$]); content((-5, 0), text(size: 14pt)[$($])
            content((-2, -0.4), [$-2$]); content((-2, 0), text(size: 14pt)[$[$])
            content((1, -0.4), [$1$]); content((1, 0), text(size: 14pt)[$]$])
            content((3, -0.4), [$3$]); content((3, 0), text(size: 14pt)[$)$])
            gach_cheo(-6, -5); gach_cheo(3, 4.8)
            gach_cheo(-2, 1)
          })
        ]
        
        #step([Liệt kê các phần tử nguyên])
        Các số nguyên là: ${-4, -3, 2}$. Tập có $3$ phần tử.
    ]
)

// TLN 4
#tln([Cho hai tập hợp $A = (-infty; m]$ và $B = (3; +infty)$. Tìm giá trị nguyên lớn nhất của tham số $m$ để $A cap B = emptyset$.],
    [3],
    loigiai: [
        #step([Phân tích điều kiện $A cap B = emptyset$])
        Để hai tập hợp không có điểm chung, ta cần $m <= 3$.
        
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            content((-4, 1), $A$)
            line((-3, 1), (7, 1), mark: (end: ">"))
            content((2, 0.6), [$m$]); content((2, 1), text(size: 14pt)[$]$])
            gach_cheo(2, 6.8, y: 1)
            
            content((-4, 0), $B$)
            line((-3, 0), (7, 0), mark: (end: ">"))
            content((3, -0.4), [$3$]); content((3, 0), text(size: 14pt)[$($])
            gach_cheo(-3, 3, y: 0)
          })
        ]
        
        #step([Kết luận])
        Giá trị nguyên lớn nhất thỏa mãn $m <= 3$ là $m = 3$.
    ]
)

// TLN 5
#tln([Cho tập hợp $M = {x in ZZ | (2x + 3)/(x - 1) in ZZ}$. Tập hợp $M$ có bao nhiêu phần tử?],
    [4],
    loigiai: [
        #step([Biến đổi biểu thức])
        $ (2x + 3)/(x - 1) = 2 + 5/(x - 1) $
        Biểu thức nguyên $<=> x - 1 in "Ư"(5) = {1, -1, 5, -5}$.
        
        #step([Tìm x])
        Các nghiệm $x in {-4; 0; 2; 6}$. Tập $M$ có $4$ phần tử.
    ]
)

// TLN 6 (Tư duy)
#tln([Cho ba tập hợp $A, B, C$. Biết rằng mỗi tập hợp đều có $10$ phần tử. Giao của bất kỳ hai tập hợp nào cũng có đúng $4$ phần tử. Giao của cả ba tập hợp có đúng $1$ phần tử. Hỏi tập hợp hợp $A cup B cup C$ có tổng cộng bao nhiêu phần tử?],
    [19],
    loigiai: [
        #step([Sử dụng công thức biểu đồ Venn cho 3 tập hợp])
        $ n(A cup B cup C) = n(A) + n(B) + n(C) - n(A cap B) - n(B cap C) - n(C cap A) + n(A cap B cap C) $
        $ = 10 + 10 + 10 - 4 - 4 - 4 + 1 = 19 $
        
        #venn3(
          title: "Ba tập hợp A, B, C",
          name-a: "Tập A (10)",
          name-b: "Tập B (10)",
          name-c: "Tập C (10)",
          a-only: "3",
          b-only: "3",
          c-only: "3",
          ab-only: "3",
          bc-only: "3",
          ca-only: "3",
          abc: "1",
          outside: none,
        )
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
