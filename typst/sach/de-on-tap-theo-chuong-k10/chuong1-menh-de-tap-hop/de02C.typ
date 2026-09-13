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
          text(size: 8.5pt, weight: "bold", fill: rgb("64748b"))[Không tham gia: #outside]
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
  exam-title: "BÀI 2 & 3: TẬP HỢP VÀ CÁC PHÉP TOÁN (ĐỀ SỐ 3)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "103",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho tập hợp $X = {x in ZZ | -3 <= x < 2}$. Hãy viết tập hợp $X$ bằng cách liệt kê các phần tử.],
    (
        [${-2; -1; 0; 1}$],
        True([${-3; -2; -1; 0; 1}$]),
        [${-3; -2; -1; 0; 1; 2}$],
        [${-2; -1; 0; 1; 2}$]
    ),
    loigiai: [
        Vì $x in ZZ$ và $-3 <= x < 2$ nên $x$ nhận các giá trị nguyên từ $-3$ đến $1$.
        Vậy $X = {-3; -2; -1; 0; 1}$.
    ]
)

// TN 2
#tn([Ký hiệu nào biểu diễn đúng tập hợp các số thực lớn hơn $2$ và nhỏ hơn $8$?],
    (
        [$[2; 8]$],
        [$(2; 8]$],
        True([$(2; 8)$]),
        [$[2; 8)$]
    ),
    loigiai: [
        Tập hợp các số thực $x$ thỏa mãn $2 < x < 8$ được ký hiệu là khoảng $(2; 8)$.
    ]
)

// TN 3
#tn([Tập hợp nào sau đây là tập hợp rỗng?],
    (
        True([${x in NN | 2x - 1 = 0}$]),
        [${x in RR | x^2 - x + 1/4 = 0}$],
        [${x in ZZ | x^2 - 1 = 0}$],
        [${emptyset}$]
    ),
    loigiai: [
        - $2x - 1 = 0 <=> x = 1/2 notin NN$. Vậy tập này rỗng.
        - $x^2 - x + 1/4 = 0 <=> x = 1/2 in RR$ (có 1 phần tử).
        - $x^2 - 1 = 0 <=> x = +-1 in ZZ$ (có 2 phần tử).
        - ${emptyset}$ là tập hợp chứa 1 phần tử (chính là phần tử rỗng), không phải là tập rỗng.
    ]
)

// TN 4
#tn([Khẳng định nào sau đây là SAI về quan hệ giữa các tập hợp số?],
    (
        [$NN subset ZZ$],
        [$ZZ subset QQ$],
        True([$RR subset QQ$]),
        [$QQ subset RR$]
    ),
    loigiai: [
        Tập số vô tỉ thuộc $RR$ nhưng không thuộc $QQ$. 
        Do đó, $RR$ không phải là tập con của $QQ$ (thực tế $QQ subset RR$). Khẳng định $RR subset QQ$ là SAI.
    ]
)

// TN 5
#tn([Hình vẽ sau đây biểu diễn tập hợp nào trên trục số?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-1, 0), (7, 0), mark: (end: ">"))
    content((7.2, -0.3), [$x$])
    // Vạch số
    content((3, -0.4), [$4$])
    // Gạch chéo
    gach_cheo(3, 6.8)
    // Ngoặc
    content((3, 0), text(size: 14pt)[$]$])
  })
]
],
    (
        [$( 4 ; +infty )$],
        [$[ 4 ; +infty )$],
        [$( -infty ; 4 )$],
        True([$( -infty ; 4 ]$])
    ),
    loigiai: [
        Phần không bị gạch chéo nằm bên trái số 4 và tại điểm 4 có dùng dấu ngoặc vuông "$]$" (nghĩa là lấy số 4).
        Vậy hình vẽ biểu diễn nửa khoảng $( -infty ; 4 ]$.
    ]
)

// TN 6
#tn([Cho hai tập hợp $C = {1; 3; 5; 7}$ và $D = {2; 3; 5; 6; 8}$. Phép toán $C cap D$ cho kết quả là:],
    (
        [${1; 2; 3; 5; 6; 7; 8}$],
        True([${3; 5}$]),
        [${1; 7}$],
        [${2; 6; 8}$]
    ),
    loigiai: [
        Tập hợp giao $C cap D$ gồm những phần tử chung của cả $C$ và $D$.
        Nhìn vào hai tập hợp, ta thấy các phần tử chung là $3$ và $5$. Vậy $C cap D = {3; 5}$.
    ]
)

// TN 7
#tn([Cho $P = [-4; 2)$ và $Q = [0; 5]$. Kết quả của phép toán $P cup Q$ là:],
    (
        True([$[-4; 5]$]),
        [$[0; 2)$],
        [$[-4; 0)$],
        [$[2; 5]$]
    ),
    loigiai: [
        Hợp của đoạn $[-4; 2)$ và $[0; 5]$ sẽ che phủ toàn bộ khoảng liên tục từ $-4$ đến $5$.
        Cả hai đầu mút $-4$ và $5$ đều lấy ngoặc vuông. Vậy $P cup Q = [-4; 5]$.
        
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Tập P
            content((-5, 1), $P$)
            line((-4, 1), (8, 1), mark: (end: ">"))
            content((-3, 0.6), [$-4$]); content((-3, 1), text(size: 14pt)[$[$])
            content((3, 0.6), [$2$]); content((3, 1), text(size: 14pt)[$)$])
            gach_cheo(-4, -3, y: 1); gach_cheo(3, 7.8, y: 1)
            
            // Tập Q
            content((-5, 0), $Q$)
            line((-4, 0), (8, 0), mark: (end: ">"))
            content((1, -0.4), [$0$]); content((1, 0), text(size: 14pt)[$[$])
            content((6, -0.4), [$5$]); content((6, 0), text(size: 14pt)[$]$])
            gach_cheo(-4, 1, y: 0); gach_cheo(6, 7.8, y: 0)
            
            // P cup Q
            content((-5, -1), $P cup Q$)
            line((-4, -1), (8, -1), mark: (end: ">"))
            content((-3, -1.4), [$-4$]); content((-3, -1), text(size: 14pt)[$[$])
            content((6, -1.4), [$5$]); content((6, -1), text(size: 14pt)[$]$])
            gach_cheo(-4, -3, y: -1); gach_cheo(6, 7.8, y: -1)
          })
        ]
    ]
)

// TN 8
#tn([Phần bù của tập hợp $K = (-infty; 0)$ trong tập số thực $RR$ là:],
    (
        [$( 0 ; +infty )$],
        True([$[ 0 ; +infty )$]),
        [$( -infty ; 0 ]$],
        [$[ 0 ; +infty ]$]
    ),
    loigiai: [
        $C_RR K = RR setminus (-infty; 0) = [0; +infty)$.
    ]
)

// TN 9
#tn([Một tập hợp $A$ có $5$ phần tử thì tập hợp $A$ có tổng cộng bao nhiêu tập hợp con?],
    (
        [5],
        [10],
        [25],
        True([32])
    ),
    loigiai: [
        Số tập hợp con của tập hợp có $n$ phần tử là $2^n$.
        Với $n=5$, số tập hợp con là $2^5 = 32$.
    ]
)

// TN 10
#tn([Một câu lạc bộ thể thao có 60 hội viên. Biết rằng có 45 người đăng ký bơi lội, 35 người đăng ký cầu lông và 10 người không đăng ký môn nào trong hai môn này. Số hội viên đăng ký CẢ HAI môn bơi lội và cầu lông là:],
    (
        [15],
        True([30]),
        [20],
        [10]
    ),
    loigiai: [
        Số hội viên đăng ký ít nhất một môn: $n(A cup B) = 60 - 10 = 50$.
        Số người đăng ký cả hai môn là $n(A cap B) = n(A) + n(B) - n(A cup B) = 45 + 35 - 50 = 30$.
        Vậy có 30 người đăng ký cả hai môn.
        
        #venn2(
          title: "CLB Thể thao: 60 hội viên",
          name-a: "BƠI LỘI (45)",
          name-b: "CẦU LÔNG (35)",
          only-a: "15",
          both: "30",
          only-b: "5",
          outside: "10",
        )
    ]
)

// TN 11
#tn([Cho $A = {1; 2; 3}$. Số các tập hợp $X$ thỏa mãn $X cup A = A$ là:],
    (
        [3],
        [4],
        [6],
        True([8])
    ),
    loigiai: [
        Điều kiện $X cup A = A$ tương đương với $X subset A$.
        Vì $A$ có $3$ phần tử, nên $A$ có $2^3 = 8$ tập hợp con.
        Vậy có 8 tập hợp $X$ thỏa mãn.
    ]
)

// TN 12
#tn([Hai tập hợp $A$ và $B$ được gọi là bằng nhau nếu:],
    (
        [$A subset B$],
        [$B subset A$],
        True([$A subset B$ và $B subset A$]),
        [$A cup B = A cap B$]
    ),
    loigiai: [
        Theo định nghĩa SGK, hai tập hợp $A$ và $B$ bằng nhau khi mọi phần tử của $A$ đều thuộc $B$ và mọi phần tử của $B$ đều thuộc $A$. Tức là $A subset B$ và $B subset A$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Cho các khoảng và đoạn sau: $A = [-3; 1)$, $B = (0; 4]$. Xét tính đúng sai của các phép toán:],
  (
    [Tập hợp $A cap B = (0; 1]$.],
    True([Tập hợp $A cup B = [-3; 4]$.]),
    True([Tập hợp $B setminus A = [1; 4]$.]),
    True([$C_RR A = (-infty; -3) cup [1; +infty)$.])
  ),
  loigiai: [
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // A
        content((-4, 1.5), $A$)
        line((-3, 1.5), (7, 1.5), mark: (end: ">"))
        content((-2, 1.1), [$-3$]); content((-2, 1.5), text(size: 14pt)[$[$])
        content((2, 1.1), [$1$]); content((2, 1.5), text(size: 14pt)[$)$])
        gach_cheo(-3, -2, y: 1.5); gach_cheo(2, 6.8, y: 1.5)
        
        // B
        content((-4, 0.5), $B$)
        line((-3, 0.5), (7, 0.5), mark: (end: ">"))
        content((1, 0.1), [$0$]); content((1, 0.5), text(size: 14pt)[$($])
        content((5, 0.1), [$4$]); content((5, 0.5), text(size: 14pt)[$]$])
        gach_cheo(-3, 1, y: 0.5); gach_cheo(5, 6.8, y: 0.5)
      })
    ]
    
    - $A cap B = (0; 1)$ (do $1 notin A$). Vậy a) Sai.
    - $A cup B = [-3; 4]$. Vậy b) Đúng.
    - $B setminus A = [1; 4]$. c) Đúng.
    - $C_RR A = RR setminus [-3; 1) = (-infty; -3) cup [1; +infty)$. d) Đúng.
  ]
)

// DS 2
#ds([Xác định tính đúng sai của các mệnh đề sau liên quan đến tập hợp $S = {n in ZZ | (2n^2 + 5n + 2)/(n + 2) in ZZ}$:],
  (
    True([Tập hợp $S$ có vô số phần tử.]),
    True([Mọi số nguyên $n$ (ngoại trừ $n = -2$) đều thuộc tập $S$.]),
    [Số phần tử của $S$ là $2$.],
    True([$S = ZZ setminus {-2}$.])
  ),
  loigiai: [
    #step([Rút gọn biểu thức])
    Phân tích tử thức thành nhân tử: $2n^2 + 5n + 2 = (2n+1)(n+2)$.
    Với $n != -2$, phân thức trở thành: $(2n^2 + 5n + 2)/(n + 2) = 2n + 1$.
    
    #step([Đánh giá tính nguyên])
    Vì $n in ZZ$ nên $2n + 1$ luôn là số nguyên với mọi $n in ZZ setminus {-2}$.
    Tức là $S = ZZ setminus {-2}$.
    
    - $S$ có vô số phần tử. Vậy a) Đúng.
    - b) Đúng.
    - c) Sai (vì $S$ vô hạn phần tử).
    - d) Đúng.
  ]
)

// DS 3
#ds([Cho các khoảng $X = (m; m+5)$ và $Y = (2; 8)$. Xét các mệnh đề sau:],
  (
    True([Điều kiện để $X cap Y != emptyset$ là $-3 < m < 8$.]),
    [Tồn tại một số nguyên dương $m$ để $Y subset X$.],
    [Để $X subset Y$ thì hệ bất phương trình tương ứng vô nghiệm.],
    True([Nếu $m = 2$ thì $X cup Y = (2; 8)$.])
  ),
  loigiai: [
    #step([Phân tích X cap Y != rỗng])
    $X cap Y = emptyset <=> m+5 <= 2$ hoặc $m >= 8 <=> m <= -3$ hoặc $m >= 8$.
    Vậy $X cap Y != emptyset <=> -3 < m < 8$. a) Đúng.
    
    #step([Phân tích Y subset X])
    Để $Y subset X$, cần $m <= 2$ và $m+5 >= 8 <=> m >= 3$. Vô nghiệm. b) Sai.
    
    #step([Phân tích X subset Y])
    Để $X subset Y$, cần $m >= 2$ và $m+5 <= 8 <=> 2 <= m <= 3$. Hệ có nghiệm $[2; 3]$. Vậy c) Sai.
    
    #step([Trường hợp m = 2])
    Nếu $m = 2$, $X = (2; 7) => X cup Y = (2; 8)$. Vậy d) Đúng.
  ]
)

// DS 4
#ds([Trong một nhóm có 50 học sinh, qua điều tra thấy:
- 35 học sinh giỏi Toán.
- 30 học sinh giỏi Văn.
- 5 học sinh không giỏi môn nào trong hai môn Toán và Văn.],
  (
    [Tổng số học sinh giỏi cả Toán và Văn là 15 học sinh.],
    [Có đúng 20 học sinh giỏi Toán nhưng không giỏi Văn.],
    True([Có đúng 10 học sinh giỏi Văn nhưng không giỏi Toán.]),
    [Tỉ lệ học sinh giỏi ĐÚNG MỘT MÔN là $60%$.]
  ),
  loigiai: [
    #step([Tính toán theo biểu đồ Venn])
    - Số học sinh giỏi ít nhất 1 môn: $50 - 5 = 45$.
    - Giỏi cả hai môn: $35 + 30 - 45 = 20$ học sinh. Vậy a) Sai.
    - Chỉ giỏi Toán: $35 - 20 = 15$ học sinh. Vậy b) Sai.
    - Chỉ giỏi Văn: $30 - 20 = 10$ học sinh. Vậy c) Đúng.
    - Giỏi đúng 1 môn: $15 + 10 = 25$ học sinh ($25/50 = 50%$). Vậy d) Sai.
    
    #venn2(
      title: "Khảo sát: 50 học sinh",
      name-a: "GIỎI TOÁN (35)",
      name-b: "GIỎI VĂN (30)",
      only-a: "15",
      both: "20",
      only-b: "10",
      outside: "5",
    )
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1
#tln([Cho $A = {1; 2; 3; 4; 5}$ và $B = {2; 4; 6; 8}$. Gọi $C = A setminus B$ và $D = B setminus A$. Hãy tính tổng các phần tử của tập hợp $C cup D$.],
    [23],
    loigiai: [
        #step([Xác định các tập hợp hiệu])
        $C = A setminus B = {1; 3; 5}$.
        $D = B setminus A = {6; 8}$.
        
        #step([Hợp 2 tập hợp và tính tổng])
        $C cup D = {1; 3; 5; 6; 8}$.
        Tổng: $S = 1 + 3 + 5 + 6 + 8 = 23$.
    ]
)

// TLN 2
#tln([Cho hai tập hợp $A = [m; m+2]$ và $B = [1; 5]$. Có bao nhiêu giá trị nguyên của tham số $m$ để $A subset B$?],
    [3],
    loigiai: [
        Để $A subset B$, cần:
        $ 1 <= m text(" và ") m+2 <= 5 <=> 1 <= m <= 3 $
        Các giá trị nguyên là $m in {1; 2; 3}$. Có $3$ giá trị.
    ]
)

// TLN 3
#tln([Lớp 10C có 40 học sinh. Trong đó có 15 bạn học thêm tiếng Hàn, 18 bạn học thêm tiếng Nhật. Có 12 bạn không học thêm ngôn ngữ nào trong hai ngôn ngữ này. Hỏi có bao nhiêu bạn học thêm CẢ HAI ngôn ngữ Hàn và Nhật?],
    [5],
    loigiai: [
        #step([Tính toán])
        Số học sinh học ít nhất một ngôn ngữ: $40 - 12 = 28$.
        Số học sinh học cả hai ngôn ngữ: $n(H cap N) = 15 + 18 - 28 = 5$.
        
        #venn2(
          title: "Lớp 10C: 40 học sinh",
          name-a: "TIẾNG HÀN (15)",
          name-b: "TIẾNG NHẬT (18)",
          only-a: "10",
          both: "5",
          only-b: "13",
          outside: "12",
        )
    ]
)

// TLN 4
#tln([Cho tập hợp $X = {x in RR | x^2 - 3x - 4 = 0}$ và $Y = ( -2; 3 ]$. Hỏi giao của hai tập hợp $X cap Y$ có bao nhiêu phần tử?],
    [1],
    loigiai: [
        #step([Giải phương trình của X])
        $x^2 - 3x - 4 = 0 <=> x = -1$ hoặc $x = 4 => X = {-1; 4}$.
        
        #step([Tìm giao với Y])
        - Điểm $-1 in (-2; 3]$ (thỏa mãn).
        - Điểm $4 notin (-2; 3]$.
        Vậy $X cap Y = {-1}$. Tập hợp có đúng 1 phần tử.
    ]
)

// TLN 5
#tln([Một nhóm 50 sinh viên thi ba môn: Toán, Lý, Hóa. Biết rằng:
- 25 người qua môn Toán, 20 người qua Lý, 15 người qua Hóa.
- 8 người qua cả Toán và Lý, 6 người qua cả Lý và Hóa, 5 người qua cả Toán và Hóa.
- 2 người qua cả ba môn.
Hỏi có bao nhiêu sinh viên KHÔNG qua môn nào trong ba môn trên?],
    [7],
    loigiai: [
        #step([Tính số người qua ít nhất 1 môn])
        $ n(T cup L cup H) = 25 + 20 + 15 - 8 - 6 - 5 + 2 = 43 $
        
        #step([Tính số người rớt cả 3 môn])
        $50 - 43 = 7$ sinh viên.
        
        #venn3(
          title: "50 sinh viên thi 3 môn",
          name-a: "Toán (25)",
          name-b: "Lý (20)",
          name-c: "Hóa (15)",
          a-only: "14",
          b-only: "8",
          c-only: "6",
          ab-only: "6",
          bc-only: "4",
          ca-only: "3",
          abc: "2",
          outside: "7",
        )
    ]
)

// TLN 6
#tln([Tìm số phần tử nguyên của tập hợp $M = (-4; 6) setminus ( -1; 3 ]$.],
    [5],
    loigiai: [
        #step([Thực hiện phép toán tập hợp])
        $M = (-4; 6) setminus (-1; 3] = (-4; -1] cup (3; 6)$.
        
        #step([Liệt kê các số nguyên])
        - Trong $(-4; -1]$: có $-3, -2, -1$ (3 phần tử).
        - Trong $(3; 6)$: có $4, 5$ (2 phần tử).
        Tổng cộng có $3 + 2 = 5$ phần tử nguyên.
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
