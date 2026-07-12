#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG & ĐỊNH DẠNG CHUNG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

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
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("117A65"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ═══════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ
// ═══════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Hình Học Tối Ưu - Vận Dụng Cao\
      Nghệ Thuật Origami & Tối Ưu Thể Tích Nội Tiếp
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Gấp giấy nếp gấp Min · Hình giải tích Oxyz · Bất đẳng thức · Đạo hàm hàm phân thức
    ]
  ]
]

// ═══════════════════════════════════════════════
// LÝ THUYẾT NỀN TẢNG
// ═══════════════════════════════════════════════
= I. Phương Pháp Giải Chung

#lythuyet[
  *1. Thiết lập hàm số tối ưu hình học vô tỉ:*
  Thay vì các đa thức bậc 3 cơ bản, các bài toán Tối ưu Origami hoặc Nội tiếp không gian thường tạo ra các hàm chứa căn thức hoặc phân thức bậc cao.
  - *Nguyên tắc 1:* Luôn gắn hệ trục tọa độ (Oxy) để sử dụng công thức khoảng cách, điểm đối xứng hoặc phương trình đường trung trực.
  - *Nguyên tắc 2:* Nếu hàm $f(x)$ có chứa dấu căn dạng $L = sqrt(g(x))$, ta chỉ cần đạo hàm và tìm Min/Max của biểu thức bên trong căn $g(x)$.
  
  *2. Hình Trụ nội tiếp Mặt Cầu:*
  Khối trụ $(r, h)$ nội tiếp mặt cầu bán kính $R$. Mối liên hệ ràng buộc qua định lý Pytago cắt dọc:
  $ r^2 + (h/2)^2 = R^2 => r^2 = R^2 - h^2 / 4 $
  Thế vào hàm Thể tích $V = pi r^2 h$ để thu được phương trình một ẩn $h$ và khảo sát.
]

// ═══════════════════════════════════════════════
// PHÂN TÍCH Ý TƯỞNG & BÀI TOÁN GỐC
// ═══════════════════════════════════════════════
= II. Các Siêu Phẩm Vận Dụng Cao (VDC)

#tln(
  id: "GG-VDC-01",
  [*(Tối ưu Nếp gấp Origami - The Folding Problem)* Cho một tờ giấy hình chữ nhật $A B C D$ có kích thước chiều dài $A B = 6$ và chiều rộng $A D = 4$. Người ta gấp góc tờ giấy sao cho đỉnh $A$ vừa vặn chạm vào một điểm $M$ di động trên cạnh $C D$ (nếp gấp không vượt ra ngoài tờ giấy). Tìm vị trí của điểm $M$ cách $D$ một khoảng bao nhiêu để *chiều dài nếp gấp* là ngắn nhất? Tính chiều dài ngắn nhất đó.],
  [$D M = 2 sqrt(2)$, Chiều dài Min $= 3 sqrt(3)$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Nếp gấp thực chất là *đường trung trực* của đoạn thẳng $A M$ (vì $A$ đối xứng qua nếp gấp để trùng với $M$).
      2. Gắn hệ trục tọa độ với gốc tại $D(0,0)$. Lập phương trình đường trung trực của $A M$ và tìm giao điểm $P, Q$ của nó với các cạnh của tờ giấy.
      3. Độ dài nếp gấp chính là khoảng cách $P Q$. Xây dựng hàm số $f(x) = P Q^2$ theo ẩn $x = D M$ rồi đạo hàm.
    ]

    *Sơ đồ gắn trục tọa độ tờ giấy:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        let a = 6
        let b = 4

        // Tờ giấy
        rect((0,0), (a, b), fill: rgb("fff3e0"), stroke: 1.5pt)
        content((-0.3, -0.3), box(fill: rgb("e3f2fd"), inset: 2pt)[#text(size: 9pt)[$D(0,0)$]])
        content((a+0.3, -0.3), box(fill: rgb("e3f2fd"), inset: 2pt)[#text(size: 9pt)[$C(6,0)$]])
        content((-0.3, b+0.3), box(fill: rgb("e3f2fd"), inset: 2pt)[#text(size: 9pt)[$A(0,4)$]])
        content((a+0.3, b+0.3), box(fill: rgb("e3f2fd"), inset: 2pt)[#text(size: 9pt)[$B(6,4)$]])

        // Điểm M(x,0)
        let x = 2.828 // 2 sqrt(2) ≈ 2.828
        circle((x, 0), radius: 0.1, fill: rgb("E91E63"))
        content((x, -0.4), box(fill: rgb("fce4ec"), inset: 2pt)[#text(size: 9pt)[$M(x,0)$]])

        // Trung điểm N của AM
        let nx = x/2
        let ny = b/2
        circle((nx, ny), radius: 0.05, fill: black)

        // Đường thẳng AM
        line((0, b), (x, 0), stroke: (dash: "dotted", paint: rgb("555")))

        // Giao điểm P(0, Y) và Q(X, b)
        let y_p = (b*b - x*x) / (2*b) // (16-8)/8 = 1
        let x_q = (x*x + b*b) / (2*x) // (8+16)/(2*2.828) ≈ 4.24
        
        circle((0, y_p), radius: 0.1, fill: rgb("388E3C"))
        content((-0.4, y_p), box(fill: rgb("e8f5e9"), inset: 2pt)[#text(size: 9pt)[$P$]])

        circle((x_q, b), radius: 0.1, fill: rgb("388E3C"))
        content((x_q, b+0.4), box(fill: rgb("e8f5e9"), inset: 2pt)[#text(size: 9pt)[$Q$]])

        // Nếp gấp PQ
        line((0, y_p), (x_q, b), stroke: 2pt + rgb("4CAF50"))
        content((2.5, 3), box(fill: rgb("e8f5e9"), stroke: 1pt + rgb("4CAF50"), inset: 2pt)[#text(size: 9pt)[Nếp gấp $P Q$]])

        // Góc vuông
        line((nx + 0.2, ny - 0.1), (nx + 0.3, ny + 0.1), (nx + 0.1, ny + 0.2), stroke: 1pt + rgb("D32F2F"))
      })
    ]

    #step([Thiết lập hàm chiều dài nếp gấp])
    Gắn hệ trục toạ độ Oxy sao cho $D(0,0)$, tia $D C$ là trục $O x$, tia $D A$ là trục $O y$.
    Tọa độ các đỉnh: $A(0, 4)$ và điểm $M(x, 0)$ với $0 < x < 6$.
    - Trung điểm của $A M$ là $N( x/2, 2 )$.
    - Vectơ chỉ phương của $A M$ là $arrow(u) = arrow(A M) = (x, -4)$.
    Nếp gấp là đường trung trực của $A M$, đi qua $N$ và có vectơ pháp tuyến $arrow(n) = (x, -4)$.
    Phương trình nếp gấp: 
    $ x( X - x/2 ) - 4(Y - 2) = 0 <=> x X - 4Y - x^2 / 2 + 8 = 0. $
    Giao điểm $P$ trên cạnh $A D$ (trục Oy $=> X=0$): $-4Y = x^2 / 2 - 8 => Y_P = (16 - x^2) / 8$. Vậy $P(0, (16 - x^2) / 8)$.
    Giao điểm $Q$ trên cạnh $A B$ (đường thẳng $Y=4$): $x X - 16 - x^2 / 2 + 8 = 0 => X_Q = (x^2 + 16) / (2x)$. Vậy $Q( (x^2+16) / (2x), 4 )$.
    
    Chiều dài bình phương nếp gấp:
    $ P Q^2 = (X_Q - X_P)^2 + (Y_Q - Y_P)^2 = ( (x^2+16)/(2x) )^2 + ( 4 - (16-x^2)/8 )^2 = (x^2+16)^2 / (4x^2) + (x^2+16)^2 / 64. $
    $ P Q^2 = (x^2+16)^2 / 4 ( 1 / x^2 + 1 / 16 ) = (x^2+16)^3 / (64 x^2). $

    #step([Khảo sát đạo hàm])
    Xét hàm $f(x) = (x^2+16)^3 / x^2$.
    $ f'(x) = ( 3(x^2+16)^2 dot 2x dot x^2 - (x^2+16)^3 dot 2x ) / x^4 = ( 2x(x^2+16)^2 [3x^2 - (x^2+16)] ) / x^4. $
    $ f'(x) = 0 <=> 2x^2 - 16 = 0 <=> x^2 = 8 <=> x = 2 sqrt(2). $
    Vậy $M$ cách $D$ một khoảng $D M = 2 sqrt(2)$.

    #step([Tính chiều dài Min])
    Thế $x^2 = 8$ vào biểu thức của $P Q^2$:
    $ P Q^2 = (8+16)^3 / (64 dot 8) = 24^3 / 512 = 13824 / 512 = 27. $
    Vậy chiều dài nếp gấp Min là $P Q = sqrt(27) = 3 sqrt(3)$.
  ]
)

#tln(
  id: "GG-VDC-02",
  [*(Tối ưu Nội tiếp Không Gian)* Cho một mặt cầu có bán kính $R = 3$. Một khối trụ tròn xoay được thiết kế sao cho nội tiếp hoàn toàn trong mặt cầu. Tính bán kính đáy $r$ và chiều cao $h$ của khối trụ để thể tích của nó đạt giá trị lớn nhất. Tính thể tích lớn nhất đó.],
  [$h=2 sqrt(3), r=sqrt(6), V_"max"=12 pi sqrt(3)$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Ràng buộc không gian: Cắt mặt cầu bằng mặt phẳng chứa trục hình trụ, ta được một hình chữ nhật (mặt cắt dọc của trụ) nội tiếp trong một đường tròn lớn của mặt cầu.
      2. Đường chéo của hình chữ nhật chính là đường kính của mặt cầu. Suy ra: $(2r)^2 + h^2 = (2R)^2$.
      3. Rút $r^2$ theo $h$ và thay vào phương trình Thể tích $V = pi r^2 h$.
    ]

    #step([Thiết lập mối quan hệ nội tiếp])
    Theo định lý Pytago trên mặt cắt dọc:
    $ 4r^2 + h^2 = 4R^2 = 4(3)^2 = 36 => r^2 = 9 - h^2 / 4. $

    #step([Lập hàm Thể tích khối trụ])
    $ V = pi r^2 h = pi ( 9 - h^2 / 4 ) h = pi / 4 ( 36h - h^3 ). $

    #step([Đạo hàm tìm Max])
    Xét hàm số $f(h) = 36h - h^3$ với $0 < h < 6$.
    $ f'(h) = 36 - 3h^2 = 0 <=> h^2 = 12 <=> h = 2 sqrt(3). $
    Lập bảng biến thiên, ta thấy $f(h)$ đạt Max tại $h = 2 sqrt(3)$.
    
    Khi đó, bán kính đáy là:
    $ r^2 = 9 - 12 / 4 = 9 - 3 = 6 => r = sqrt(6). $
    
    #step([Tính Thể tích Max])
    $ V_"max" = pi r^2 h = pi dot 6 dot 2 sqrt(3) = 12 pi sqrt(3). $
  ]
)
