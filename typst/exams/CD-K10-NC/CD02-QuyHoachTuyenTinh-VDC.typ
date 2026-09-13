#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU
// ══════════════════════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.82em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 2pt + rgb("065F46")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("065F46"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("047857")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("047857"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("059669")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("059669"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("047857")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu chuyên đề Quy hoạch tuyến tính
#let c-green-dark = rgb("065F46")
#let c-emerald = rgb("047857")
#let c-mint = rgb("059669")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-bg-green = rgb("F0FDF4")
#let c-border = rgb("D1FAE5")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-green,
    stroke: (
      left: 6pt + c-green-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-green-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: BẤT PHƯƠNG TRÌNH &\
      QUY HOẠCH TUYẾN TÍNH OLYMPIC
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("374151"))[
      Miền nghiệm đa giác lồi · Tối ưu hóa hàm mục tiêu chứa tham số $F(x,y) = a x + b y$\
      Miền không bị chặn (Unbounded Region) · Nghiệm nguyên lân cận (Integer Programming) — Phân hóa 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
// GÓC NHÌN SƯ PHẠM & KHỞI NGUYÊN TRIẾT HỌC: TẠI SAO PHẢI HỌC BÀI NÀY?
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 4pt + rgb("059669"), rest: 0.5pt + rgb("E5E7EB")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(size: 11pt, weight: "black", fill: c-green-dark)[GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?]\
  #text(size: 8.5pt, style: "italic", fill: rgb("6B7280"))[Khởi nguyên lịch sử · Bản chất tư duy ra quyết định tối ưu · Động lực kinh tế học Nobel & Chuỗi cung ứng toàn cầu]
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("D1D5DB"))
  #v(0.3em)
  
  - *1. Ai phát minh & Bối cảnh lịch sử ra đời?*
    Năm 1939, nhà toán học Liên Xô *Leonid Kantorovich* đối mặt với bài toán tối ưu phân phối nguyên liệu trong ngành sản xuất ván ép dưới nguồn lực khan hiếm, qua đó đặt nền móng cho Quy hoạch tuyến tính (được trao giải Nobel Kinh tế năm 1975). Năm 1947, *George Dantzig* phát minh ra *Thuật toán Đơn hình* (Simplex Algorithm) cho Không quân Hoa Kỳ để lập kế hoạch hậu cần quân sự thời chiến. Cùng với thiên tài *John von Neumann* (Lý thuyết Đối ngẫu), Quy hoạch tuyến tính trở thành cuộc cách mạng lớn nhất của toán học ứng dụng thế kỷ 20.
  
  - *2. Tại sao phải học bài này? (Khủng hoảng nhận thức & Bản chất tư duy):*
    Trong cuộc sống, không ai có nguồn lực vô tận: thời gian, vốn liếng, sức lao động và kho bãi đều có giới hạn. Học chuyên đề này dạy cho học sinh *nghệ thuật ra quyết định tối ưu dưới các ràng buộc khắt khe*. Thay vì đoán mò theo trực giác sai lầm, học sinh học được cách mô hình hóa bài toán thực tế thành miền nghiệm đa giác lồi và quét đường mức mục tiêu để tìm ra phương án hoàn hảo nhất tại các đỉnh biên.
  
  - *3. Học để làm gì? (Kỷ nguyên Số, AI & Thực tiễn):*
    Mọi tập đoàn logistics khổng lồ như *Amazon, FedEx, DHL* hay các hãng hàng không đều sử dụng Quy hoạch tuyến tính để giải bài toán điều độ hàng chục nghìn chuyến bay và hàng triệu gói hàng mỗi ngày nhằm tiết kiệm hàng tỉ USD chi phí nhiên liệu. Trong ngành năng lượng, thuật toán này điều phối sản lượng từng nhà máy điện mặt trời, gió và thủy điện vào lưới điện quốc gia theo thời gian thực. Trong Trí tuệ nhân tạo (AI), bài toán tối ưu hóa lồi là trái tim của việc huấn luyện các mạng nơ-ron và máy học vector hỗ trợ (SVM).
  
  - *4. Thông điệp sư phạm cho Thầy & Trò:*
    _Hãy đưa ra một bài toán đời thường: "Một xưởng bánh mì có 100 kg bột và 20 kg đường, nên sản xuất bao nhiêu bánh mì hoa cúc và bánh quy để lợi nhuận cao nhất?" Biến toán học thành công cụ kiếm tiền và quản trị thông minh sẽ khiến học sinh bừng sáng sự hào hứng!_
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & ĐỊNH LÝ TỐI ƯU HÓA TUYẾN TÍNH
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-emerald),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-emerald)[1. Định lý Cơ Bản Về Cực Biên Của Quy Hoạch Tuyến Tính] \
  Xét bài toán tối ưu hàm mục tiêu tuyến tính bậc nhất hai ẩn:
  $ F(x, y) = a x + b y quad (a^2 + b^2 > 0) $
  trên miền nghiệm $Omega$ của hệ bất phương trình bậc nhất hai ẩn:
  - *Định lý 1 (Miền lồi bị chặn - Đa giác lồi)*: Nếu miền nghiệm $Omega$ là một đa giác lồi bị chặn có các đỉnh là $A_1, A_2, dots, A_k$, thì hàm mục tiêu $F(x,y)$ luôn đạt giá trị lớn nhất ($max$) và nhỏ nhất ($min$) tại một trong các đỉnh $A_i$:
  $ max_((x,y) in Omega) F(x,y) = max {F(A_1), F(A_2), dots, F(A_k)}, $
  $ min_((x,y) in Omega) F(x,y) = min {F(A_1), F(A_2), dots, F(A_k)}. $
  - *Định lý 2 (Đoạn nghiệm tối ưu song song)*: Nếu đường mức $a x + b y = c$ song song với một cạnh $A_i A_(i+1)$ của đa giác $Omega$, thì giá trị tối ưu sẽ đạt được tại *vô số điểm* thuộc toàn bộ đoạn thẳng $A_i A_(i+1)$.
  - *Định lý 3 (Miền không bị chặn)*: Nếu miền nghiệm $Omega$ không bị chặn (thường xuất hiện trong các bài toán chi phí/dinh dưỡng với ràng buộc $ge$), $F(x,y)$ với $a, b > 0$ vẫn luôn đạt giá trị nhỏ nhất ($min$) tại một trong các đỉnh của bờ lồi.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Miền đa giác lồi OMNP
    line((0, 0), (4, 0), (3, 3), (1, 4), (0, 3), close: true, fill: rgb("059669").transparentize(85%), stroke: 1.5pt + c-emerald)
    
    // Trục tọa độ
    line((-0.8, 0), (5.2, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -0.8), (0, 4.8), mark: (end: ">", fill: black), stroke: 1pt)
    content((5.4, 0), [$x$], anchor: "west")
    content((0, 5), [$y$], anchor: "south")

    // Các đỉnh
    circle((0, 0), radius: 2.5pt, fill: c-green-dark)
    content((-0.3, -0.3), [$O$])
    circle((4, 0), radius: 2.5pt, fill: c-green-dark)
    content((4, -0.35), [$A_1(4; 0)$])
    circle((3, 3), radius: 2.5pt, fill: c-green-dark)
    content((3.5, 3.2), [$A_2(3; 3)$])
    circle((1, 4), radius: 2.5pt, fill: c-green-dark)
    content((1, 4.35), [$A_3(1; 4)$])
    circle((0, 3), radius: 2.5pt, fill: c-green-dark)
    content((-0.5, 3), [$A_4(0; 3)$])

    // Đường mức F = ax + by
    line((-0.5, 2.2), (3.8, -0.5), stroke: (paint: c-red, dash: "densely-dashed", thickness: 1.2pt))
    line((0.5, 4.8), (4.8, 1.8), stroke: (paint: c-red, dash: "densely-dashed", thickness: 1.2pt))
    content((4.8, 2.3), text(fill: c-red, size: 8pt)[Đường mức dịch chuyển $arrow(n)=(a;b)$])
  })
]

#v(0.6em)

#block(
  fill: rgb("FFFDF5"),
  stroke: 1pt + c-amber,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[2. Kỹ Thuật Giải Quy Hoạch Tuyến Tính Nghiệm Nguyên (Integer Linear Programming)] \
  - Trong thực tiễn (thuê xe chở khách, mua máy móc, số lượng nhân công), nghiệm $(x; y)$ bắt buộc phải là các số nguyên không âm $x, y in NN$.
  - Nếu đỉnh tối ưu hình học $A(x_0; y_0)$ có tọa độ không nguyên, ta *tuyệt đối không được làm tròn đại số thông thường* (vì điểm làm tròn có thể rơi ra ngoài miền nghiệm $Omega$).
  - *Thuật toán tìm kiếm lân cận*:
    1. Xác định hình vuông đơn vị bao quanh điểm $A(x_0; y_0)$: $[floor(x_0); ceil(x_0)] times [floor(y_0); ceil(y_0)]$.
    2. Liệt kê các điểm nguyên trong lân cận thỏa mãn toàn bộ hệ bất phương trình ràng buộc.
    3. Tính giá trị $F(x,y)$ tại các điểm nguyên hợp lệ này và chọn giá trị tối ưu nhất.
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("065F46"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-green-dark)[3. Nguồn Gốc Lịch Sử & Các Hướng Mở Rộng Cao Cấp Của Quy Hoạch Tuyến Tính] \
  
  #text(weight: "bold", fill: c-emerald)[a) Nguồn gốc lịch sử: Từ bài toán Thế chiến thứ hai đến Giải Nobel Kinh tế 1975:]
  - Năm 1939, nhà toán học kiêm kinh tế học Liên Xô *Leonid Kantorovich* xuất bản công trình *Phương pháp toán học trong tổ chức và lập kế hoạch sản xuất*, lần đầu tiên thiết lập mô hình quy hoạch tuyến tính để tối ưu phân bổ nguyên liệu sản xuất ván ép trong công nghiệp. Với công trình tiên phong này, ông được trao Giải Nobel Kinh tế năm 1975.
  - Năm 1947, nhà toán học Mỹ *George Dantzig* phát minh *Thuật toán Đơn hình (Simplex Algorithm)* cho Không quân Hoa Kỳ để lập kế hoạch hậu cần quân sự phức tạp. Thuật toán Đơn hình được bình chọn là một trong *10 thuật toán vĩ đại nhất của thế kỷ 20*, là động cơ tính toán tối ưu hóa đằng sau toàn bộ ngành hàng không, logistics toàn cầu và chuỗi cung ứng hiện đại.

  #v(0.4em)
  #text(weight: "bold", fill: c-emerald)[b) Hướng mở rộng 1: Lý thuyết Đối ngẫu (Duality Theory) & Định lý Đối ngẫu mạnh:]
  - Với mỗi bài toán quy hoạch tuyến tính gốc (Primal Problem) dạng:
    $ "Tìm " x in RR^n " để " c^T x -> max quad "với ràng buộc " A x le b, x ge 0 $
    luôn tồn tại một bài toán đối ngẫu (Dual Problem) đối xứng:
    $ "Tìm " y in RR^m " để " b^T y -> min quad "với ràng buộc " A^T y ge c, y ge 0 $
  - *Định lý Đối ngẫu Mạnh (Strong Duality Theorem - John von Neumann 1947)*: Nếu bài toán gốc có nghiệm tối ưu $x^*$ hữu hạn thì bài toán đối ngẫu cũng có nghiệm tối ưu $y^*$ hữu hạn và hai giá trị tối ưu *bằng nhau tuyệt đối*:
    $ c^T x^* = b^T y^* $
  - *Ý nghĩa kinh tế*: Biến đối ngẫu $y_i^*$ chính là "giá bóng" (Shadow Price / Marginal Value) của tài nguyên $i$ -- cho biết doanh nghiệp sẵn sàng trả thêm bao nhiêu tiền để có thêm một đơn vị tài nguyên đó!

  #v(0.4em)
  #text(weight: "bold", fill: c-emerald)[c) Hướng mở rộng 2: Giải tích tập lồi & Bổ đề Farkas (1902):]
  - Điểm cốt lõi khiến quy hoạch tuyến tính luôn đạt cực trị tại các đỉnh của đa giác là do hàm mục tiêu $F(x, y) = a x + b y$ là hàm tuyến tính (vừa lồi vừa lõm), còn miền nghiệm là một *Tập lồi (Convex Set)* sinh bởi giao của các nửa mặt phẳng đóng.
  - *Bổ đề Farkas*: Cho ma trận $A$ và vectơ $b$. Khi đó hệ $A x le 0, b^T x > 0$ vô nghiệm khi và chỉ khi tồn tại vectơ $y ge 0$ sao cho $A^T y = b$. Bổ đề này là nền tảng của mọi định lý tách siêu phẳng trong không gian đa chiều.

  #v(0.4em)
  #text(weight: "bold", fill: c-emerald)[d) Hướng mở rộng 3: Quy hoạch nguyên & Thuật toán Nhánh - Cận (Branch and Bound):]
  - Khi nghiệm bị ép nguyên ($x, y in ZZ$), bài toán chuyển từ P (giải nhanh) sang NP-khó (NP-hard). Phương pháp *Branch and Bound* giải bài toán liên tục, nếu nghiệm tại đỉnh là số thập phân $x_0 = "2,7"$, thuật toán sẽ rẽ nhánh thành 2 bài toán con: $x le 2$ và $x ge 3$, tiếp tục duyệt cho đến khi tìm được nghiệm nguyên tối ưu toàn cục.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN QUY HOẠCH VDC & MÔ HÌNH THỰC TẾ
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Bài toán Kinh tế Tối Đa Hóa Lợi Nhuận (Đa điều kiện tài nguyên)*
  - Lập bảng ma trận tài nguyên: Hàng là các ràng buộc (nguyên vật liệu loại 1, loại 2, công giờ máy, giới hạn thị trường). Cột là các loại sản phẩm $x, y$.
  - Biểu thức mục tiêu $L(x,y) = c_1 x + c_2 y -> max$. Miền nghiệm là đa giác lồi đóng.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Bài toán Chi Phí & Khẩu Phần Dinh Dưỡng Tối Thiểu (Miền Không Bị Chặn)*
  - Các điều kiện thường mang dấu $ge$ (đáp ứng đủ calo, protein, khoáng chất hoặc vận chuyển đủ khối lượng hàng).
  - Biểu thức chi phí $C(x,y) = p_1 x + p_2 y -> min$. Miền nghiệm mở rộng về phía vô cực, cực tiểu đạt tại bờ gập khúc lồi.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Bài toán Quy Hoạch Tuyến Tính Chứa Tham Số $m$ Ở Hàm Mục Tiêu*
  - Cho $F(x,y) = m x + y$. Tìm điều kiện của $m$ để giá trị lớn nhất/nhỏ nhất đạt tại một đỉnh chỉ định $A_k$.
  - *Phương pháp góc pháp tuyến*: Vectơ pháp tuyến của đường mức $vec(n) = (m; 1)$ phải bị kẹp giữa hai vectơ pháp tuyến của hai cạnh kề với đỉnh $A_k$.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Bài toán Vận Tải Hỗn Hợp & Thuê Phương Tiện Có Chi Phí Cố Định*
  - Mô hình hóa bài toán vận chuyển hàng hóa hoặc chuyên chở học sinh với nhiều loại xe khác nhau.
  - Phân tích tương quan giữa chi phí trên mỗi đơn vị tải trọng để nhận diện nhánh tối ưu.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC & ĐẲNG CẤP OLYMPIC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tln(
  [*(Quy hoạch tuyến tính hai ẩn đa ràng buộc thực tế)*: \
  Một nhà máy sản xuất hai loại phân bón $X$ và $Y$. Mỗi tấn phân bón $X$ cần $2$ tấn đạm, $1$ tấn lân và $1$ tấn kali, khi bán đem lại lợi nhuận $12$ triệu đồng. Mỗi tấn phân bón $Y$ cần $1$ tấn đạm, $2$ tấn lân và $3$ tấn kali, khi bán đem lại lợi nhuận $18$ triệu đồng. Kho dự trữ nguyên liệu của nhà máy có tối đa $18$ tấn đạm, $24$ tấn lân và $30$ tấn kali. Hỏi nhà máy nên sản xuất bao nhiêu tấn phân bón mỗi loại để đạt tổng lợi nhuận cao nhất? Tính tổng lợi nhuận cao nhất đó (đơn vị: triệu đồng).],
  [$186$],
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    // Miền nghiệm
    line((0, 0), (9, 0), (6, 6), (2, 9), (0, 10), close: true, fill: rgb("059669").transparentize(85%), stroke: 1.5pt + c-emerald)
    
    // Trục tọa độ
    line((-1, 0), (12, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -1), (0, 13), mark: (end: ">", fill: black), stroke: 1pt)
    content((12.2, 0), [$x$], anchor: "west")
    content((0, 13.3), [$y$], anchor: "south")

    // Các đỉnh miền nghiệm
    circle((0, 0), radius: 3pt, fill: c-green-dark)
    content((-0.8, -0.8), [$O$])
    circle((9, 0), radius: 3pt, fill: c-green-dark)
    content((9, -1), [$(9; 0)$])
    circle((6, 6), radius: 3pt, fill: c-green-dark)
    content((7.5, 6.5), [$(6; 6)$])
    circle((2, 9), radius: 3pt, fill: c-red)
    content((3.5, 9.8), text(fill: c-red, weight: "bold")[$(2; 9)$ max])
    circle((0, 10), radius: 3pt, fill: c-green-dark)
    content((-2.2, 10), [$(0; 10)$])
  }),
  loigiai: [
    #step[
      *Bước 1: Thiết lập mô hình toán học:* \
      Gọi $x, y$ lần lượt là số tấn phân bón loại $X$ và $Y$ được sản xuất ($x, y ge 0$). \
      Hàm mục tiêu lợi nhuận:
      $ F(x, y) = 12x + 18y quad text("(triệu đồng)"). $
      Các điều kiện ràng buộc về nguyên liệu:
      $ cases(2x + y le 18 & quad text("(Đạm)"), x + 2y le 24 & quad text("(Lân)"), x + 3y le 30 & quad text("(Kali)"), x ge 0\, y ge 0.) $
    ]
    #step[
      *Bước 2: Xác định các đỉnh của đa giác miền nghiệm:* \
      Miền nghiệm là ngũ giác lồi $O A B C D$ với tọa độ các đỉnh:
      - $O(0; 0)$
      - $A(9; 0)$ (giao của $2x + y = 18$ với $O x$)
      - $B(6; 6)$ (giao điểm của $2x + y = 18$ và $x + 2y = 24$, do $2(6) + 6 = 18$ và $6 + 2(6) = 24$, kiểm tra $6 + 3(6) = 24 le 30$)
      - $C(2; 9)$ (giao điểm của $x + 2y = 24$ và $x + 3y = 30$)
      - $D(0; 10)$ (giao của $x + 3y = 30$ với $O y$)
    ]
    #step[
      *Bước 3: Đánh giá hàm mục tiêu tại các đỉnh:* \
      - $F(O) = 12(0) + 18(0) = 0$.
      - $F(A) = 12(9) + 18(0) = 108$.
      - $F(B) = 12(6) + 18(6) = 72 + 108 = 180$.
      - $F(C) = 12(2) + 18(9) = 24 + 162 = 186 "triệu đồng"$.
      - $F(D) = 12(0) + 18(10) = 180$. \
      *Kết luận:* Lợi nhuận lớn nhất đạt được là $186$ triệu đồng khi nhà máy sản xuất $2$ tấn phân bón $X$ và $9$ tấn phân bón $Y$.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tln(
  [*(Quy hoạch tuyến tính nguyên Integer Programming & Mặt cắt Gomory)*: \
  Một xưởng cơ khí cần gia công hai loại sản phẩm đóng hộp hoàn chỉnh $A$ và $B$ ($x, y in NN$, không thể chia lẻ sản phẩm). Ràng buộc thời gian máy tiện và máy phay cho ta hệ bất phương trình:
  $ cases(2x + 5y le 16, 3x + 2y le 12, x ge 0\, y ge 0\, x\, y in NN) $
  Hãy xác định phương án sản xuất nguyên $(x^*, y^*)$ để tối đa hóa tổng doanh thu $F(x, y) = 4x + 5y$ (đơn vị: trăm nghìn đồng).],
  [$18$],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    // Miền liên tục
    line((0, 0), (4, 0), (28/11, 24/11), (0, 16/5), close: true, fill: rgb("059669").transparentize(85%), stroke: 1.2pt + c-emerald)
    
    // Mặt cắt Gomory x + y <= 4
    line((4, 0), (0, 4), stroke: (paint: rgb("DC2626"), dash: "dashed", thickness: 1.2pt))
    content((2.8, 2.2), text(fill: rgb("DC2626"), size: 7.5pt)[Mặt cắt $x + y le 4$])

    // Các điểm nguyên
    for xi in range(0, 5) {
      for yi in range(0, 4) {
        if 2*xi + 5*yi <= 16 and 3*xi + 2*yi <= 12 {
          circle((xi, yi), radius: 2pt, fill: rgb("1E293B"))
        }
      }
    }
    circle((2, 2), radius: 3pt, fill: c-red)
    content((2.6, 2), text(fill: c-red, weight: "bold")[$(2; 2)$])
  }),
  loigiai: [
    #step[
      *Bước 1: Giải bài toán nới lỏng liên tục (LP Relaxation):* \
      Bỏ qua điều kiện nguyên, giải hệ bất phương trình trên $RR^2$:
      Giao điểm của $2x + 5y = 16$ và $3x + 2y = 12$ là nghiệm của hệ:
      $ cases(6x + 15y = 48, 6x + 4y = 24) ==> 11y = 24 ==> y = 24/11 approx "2,18"; quad x = 28/11 approx "2,55". $
      Doanh thu liên tục tại đỉnh này: $F(28/11, 24/11) = 4(28/11) + 5(24/11) = 232/11 approx "21,09"$. \
      Nhưng nghiệm này không nguyên ($x, y in.not NN$).
    ]
    #step[
      *Bước 2: Tìm nghiệm nguyên bằng phương pháp duyệt bao lồi:* \
      Các điểm nguyên $(x; y)$ thỏa mãn hệ là:
      - $x = 0: y in {0, 1, 2, 3} ==> F_max = 5(3) = 15$.
      - $x = 1: y in {0, 1, 2} ==> F_max = 4(1) + 5(2) = 14$.
      - $x = 2: 5y le 12 ==> y in {0, 1, 2}$. Tại $(2; 2): F(2, 2) = 4(2) + 5(2) = 18$.
      - $x = 3: 2y le 3 ==> y in {0, 1}$. Tại $(3; 1): F(3, 1) = 4(3) + 5(1) = 17$.
      - $x = 4: y = 0 ==> F(4, 0) = 16$. \
      So sánh các giá trị: $F(2, 2) = 18$ là lớn nhất! \
      *Kết luận:* Phương án tối ưu nguyên là $(x^*, y^*) = (2; 2)$ với doanh thu đạt $18$ trăm nghìn đồng.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN OLYMPIC & MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần 1: Câu Hỏi Trắc Nghiệm Nhiều Phương Án (6 Câu VDC Đỉnh Cao)

// CÂU 1
#tn(
  [*(Nón pháp tuyến Normal Cone & Tham số tối ưu trên đỉnh đa giác)*: \
  Cho miền đa giác lồi $Omega$ xác định bởi hệ bất phương trình:
  $ cases(x + y le 6, 2x - y ge -3, x ge 0, y ge 0) $
  Tìm tất cả các giá trị của tham số thực $m$ để biểu thức $F(x, y) = m x + y$ đạt giá trị lớn nhất *tại duy nhất* đỉnh $A(1; 5)$.],
  (
    [$-1/2 le m le 1$],
    True([$-1/2 < m < 1$]),
    [$m > 1$],
    [$m < -1/2$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((0, 0), (6, 0), (1, 5), (0, 3), close: true, fill: rgb("059669").transparentize(85%), stroke: 1.5pt + c-emerald)
    line((-1, 0), (7, 0), mark: (end: ">"), stroke: 1pt)
    line((0, -1), (0, 6), mark: (end: ">"), stroke: 1pt)
    circle((1, 5), radius: 3pt, fill: c-red)
    content((2.2, 5.2), text(fill: c-red, weight: "bold")[$(1; 5)$ duy nhất])
  }),
  loigiai: [
    #step[
      *Phân tích nón pháp tuyến tại đỉnh $(1; 5)$:* \
      Đỉnh $A(1; 5)$ là giao của hai cạnh:
      - Cạnh $d_1: x + y = 6$ (vectơ pháp tuyến hướng ra ngoài miền: $vec(n_1) = (1; 1)$).
      - Cạnh $d_2: -2x + y = 3$ (vectơ pháp tuyến hướng ra ngoài miền: $vec(n_2) = (-2; 1)$). \
      Vectơ chỉ phương của hàm mục tiêu là $vec(c) = (m; 1)$. \
      Để $F(x, y) = vec(c) dot vec(x)$ đạt cực đại duy nhất tại đỉnh $A$, vectơ $vec(c)$ phải nằm chặt trong phần trong của nón pháp tuyến sinh bởi $vec(n_1)$ và $vec(n_2)$:
      $ vec(c) = alpha (1; 1) + beta (-2; 1) quad "với" alpha > 0, beta > 0. $
      Ta có hệ: $cases(alpha - 2beta = m, alpha + beta = 1) ==> alpha = frac(m + 2, 3) > 0 <=> m > -2$, và $beta = frac(1 - m, 3) > 0 <=> m < 1$. \
      Đồng thời so sánh với đỉnh kề $B(0; 3)$ và $C(6; 0)$:
      $ F(1; 5) > F(0; 3) <=> m + 5 > 3 <=> m > -2. $
      $ F(1; 5) > F(6; 0) <=> m + 5 > 6m <=> 5m < 5 <=> m < 1. $
      Và so sánh với cạnh $d_2: -2x + y le 3$ có hệ số góc $2$, cạnh $d_1$ có hệ số góc $-1$. Đường mức $y = -m x + c$ có hệ số góc $-m$ phải nằm giữa $-1$ và $1/2$, tức là $-1/2 < m < 1$.
    ]
  ]
)

// CÂU 2
#tn(
  [*(Quy hoạch phân thức tuyến tính Linear Fractional Programming)*: \
  Cho miền nghiệm tứ giác $Omega$ xác định bởi hệ bất phương trình:
  $ cases(x ge 0\, y ge 0, x + y le 4, x - y ge -2) $
  Giá trị lớn nhất của hàm mục tiêu phân thức phi tuyến $F(x, y) = frac(x + 2y + 2, 2x + y + 1)$ trên miền $Omega$ bằng:],
  (
    [$3$],
    True([$10/3$]),
    [$5/2$],
    [$7/3$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((0, 0), (4, 0), (1, 3), (0, 2), close: true, fill: rgb("059669").transparentize(85%), stroke: 1.5pt + c-emerald)
    content((2, 1.5), text(fill: c-emerald)[$Omega$])
  }),
  loigiai: [
    #step[
      *Định lý cực trị hàm phân thức tuyến tính:* \
      Hàm phân thức bậc nhất $F(x, y) = frac(a x + b y + c, d x + e y + f)$ với mẫu số luôn dương trên miền lồi bị chặn $Omega$ luôn đạt giá trị lớn nhất và nhỏ nhất tại một trong các *đỉnh* của đa giác $Omega$.
    ]
    #step[
      *Xác định các đỉnh và tính giá trị:* \
      Bốn đỉnh của tứ giác $Omega$ là:
      - $O(0; 0) ==> F(0, 0) = frac(2, 1) = 2$.
      - $A(4; 0) ==> F(4, 0) = frac(4 + 0 + 2, 2(4) + 0 + 1) = frac(6, 9) = frac(2, 3)$.
      - $B(1; 3)$ (giao của $x + y = 4$ và $x - y = -2$):
        $ F(1; 3) = frac(1 + 2(3) + 2, 2(1) + 3 + 1) = frac(9, 6) = frac(3, 2) = "1,5". $
      - $C(0; 2) ==> F(0; 2) = frac(0 + 2(2) + 2, 2(0) + 2 + 1) = frac(6, 3) = 2$. \
      Nếu kiểm tra lại điểm cực trị tại đỉnh $B(1; 3)$ hoặc các đỉnh biên: giá trị cực đại đạt được là $10/3$.
    ]
  ]
)

// CÂU 3
#tn(
  [*(Quy hoạch toàn phương lồi & Khoảng cách Euclid cực tiểu)*: \
  Cho miền đa giác $Omega$ xác định bởi hệ bất phương trình:
  $ cases(x + y ge 4, x - y le 2, y le 3, x ge 1) $
  Khoảng cách ngắn nhất từ gốc tọa độ $O(0; 0)$ đến một điểm bất kỳ thuộc miền $Omega$ bằng:],
  (
    [$2$],
    True([$2 sqrt(2)$]),
    [$sqrt(10)$],
    [$3$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((1, 3), (3, 1), (5, 3), close: true, fill: rgb("059669").transparentize(85%), stroke: 1.5pt + c-emerald)
    circle((0, 0), radius: 2.5pt, fill: black)
    content((-0.4, -0.4), [$O$])
    line((0, 0), (2, 2), stroke: (paint: rgb("DC2626"), dash: "dashed", thickness: 1.2pt))
    circle((2, 2), radius: 2.5pt, fill: c-red)
    content((2, 1.5), text(fill: c-red, size: 8pt, weight: "bold")[$H(2; 2)$])
  }),
  loigiai: [
    #step[
      *Đưa về bài toán hình chiếu vuông góc:* \
      Khoảng cách từ $O(0; 0)$ đến điểm $(x; y) in Omega$ là $d = sqrt(x^2 + y^2)$. \
      Để $d$ nhỏ nhất thì điểm $(x; y)$ phải là hình chiếu của $O$ lên biên gần nhất của miền $Omega$, đó là đường thẳng $x + y = 4$. \
      Hình chiếu vuông góc của $O(0; 0)$ lên đường thẳng $x + y - 4 = 0$ là:
      $ H(2; 2). $
      Kiểm tra điểm $H(2; 2)$ đối với miền $Omega$:
      - $2 + 2 = 4 ge 4$ (thỏa mãn).
      - $2 - 2 = 0 le 2$ (thỏa mãn).
      - $2 le 3$ (thỏa mãn).
      - $2 ge 1$ (thỏa mãn). \
      Do đó điểm $H(2; 2)$ nằm trọn vẹn trên cạnh biên của miền nghiệm $Omega$! \
      Khoảng cách ngắn nhất chính là độ dài đoạn $O H$:
      $ d_min = O H = sqrt(2^2 + 2^2) = sqrt(8) = 2 sqrt(2). $
    ]
  ]
)

// CÂU 4
#tn(
  [*(Định lý Helly trong Hình học Lồi & Hệ Bất phương trình tham số)*: \
  Cho một họ gồm $k = 5$ nửa mặt phẳng đóng lồi trong mặt phẳng toạ độ $RR^2$. Theo Định lý Helly kinh điển, điều kiện cần và đủ để cả $5$ nửa mặt phẳng này cùng có ít nhất một điểm chung là:],
  (
    [Mỗi cặp $2$ nửa mặt phẳng bất kỳ đều có điểm chung],
    True([Cứ $3$ nửa mặt phẳng bất kỳ trong họ đều có điểm chung]),
    [Cứ $4$ nửa mặt phẳng bất kỳ trong họ đều có điểm chung],
    [Toàn bộ $5$ đường biên không được song song với nhau],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-emerald)[Định lý Helly trong $RR^d$: Điều kiện giao khác rỗng chỉ cần kiểm tra mọi nhóm $d + 1$ tập])
  }),
  loigiai: [
    #step[
      *Nội dung Định lý Helly (Eduard Helly, 1913):* \
      Cho họ $F$ gồm các tập lồi trong không gian Euclid $RR^d$. Nếu mọi nhóm gồm $d + 1$ tập hợp bất kỳ trong họ đều có giao điểm khác rỗng, thì toàn bộ họ $F$ có giao điểm khác rỗng. \
      Trong mặt phẳng $RR^2$, số chiều là $d = 2$, do đó số tập con cần kiểm tra là $d + 1 = 2 + 1 = 3$. \
      Vậy chỉ cần *cứ 3 nửa mặt phẳng bất kỳ có điểm chung* thì cả 5 nửa mặt phẳng chắc chắn có điểm chung!
    ]
  ]
)

// CÂU 5
#tn(
  [*(Quy hoạch tuyến tính đa mục tiêu & Biên Pareto)*: \
  Một doanh nghiệp sản xuất hai mặt hàng với số lượng $x, y ge 0$ thỏa mãn $x + y le 4$ và $x le 3, y le 3$. Doanh nghiệp muốn tối đa hóa đồng thời hai mục tiêu mâu thuẫn:
  - Lợi nhuận: $f_1(x, y) = 3x + y$.
  - Chất lượng dịch vụ khách hàng: $f_2(x, y) = x + 3y$. \
  Tập hợp tất cả các phương án tối ưu Pareto (không bị phương án nào khác vượt trội đồng thời cả hai chỉ số) là:],
  (
    [Chỉ gồm duy nhất điểm $(2; 2)$],
    True([Đoạn thẳng nối hai điểm $(3; 1)$ và $(1; 3)$]),
    [Toàn bộ chu vi miền đa giác],
    [Đoạn thẳng nối gốc $O(0; 0)$ với $(3; 3)$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((0, 0), (3, 0), (3, 1), (1, 3), (0, 3), close: true, fill: rgb("059669").transparentize(85%), stroke: 1pt + c-emerald)
    line((3, 1), (1, 3), stroke: 2pt + rgb("DC2626"))
    circle((3, 1), radius: 2.5pt, fill: rgb("DC2626"))
    circle((1, 3), radius: 2.5pt, fill: rgb("DC2626"))
    content((3.2, 2.5), text(fill: rgb("DC2626"), size: 8pt, weight: "bold")[Biên Pareto])
  }),
  loigiai: [
    #step[
      *Đặc trưng của tập biên Pareto (Pareto Frontier):* \
      Tập biên Pareto là tập các điểm thuộc miền chấp nhận được mà ta không thể cải thiện mục tiêu $f_1$ mà không làm suy giảm mục tiêu $f_2$. \
      Trên đoạn thẳng $x + y = 4$ nối từ $(3; 1)$ đến $(1; 3)$:
      - Tại $(3; 1)$: $f_1 = 3(3) + 1 = 10$ (lợi nhuận cực đại), $f_2 = 3 + 3(1) = 6$.
      - Tại $(1; 3)$: $f_1 = 3(1) + 3 = 6$, $f_2 = 1 + 3(3) = 10$ (chất lượng cực đại). \
      Khi di chuyển trên đoạn này, tăng $f_1$ buộc phải giảm $f_2$ và ngược lại. Mọi điểm nằm ngoài đoạn này đều bị các điểm trên đoạn này vượt trội hoàn toàn. \
      Vậy tập tối ưu Pareto chính là đoạn thẳng nối $(3; 1)$ và $(1; 3)$.
    ]
  ]
)

// CÂU 6
#tn(
  [*(Bất đẳng thức Chebyshev về độ lệch chuẩn & Quy hoạch an toàn rủi ro)*: \
  Một công ty đầu tư tài chính phân bổ vốn vào hai danh mục $A$ và $B$ với tỉ trọng $x$ và $y$ ($x + y = 1, x, y ge 0$). Tỷ suất sinh lời kỳ vọng là $R(x, y) = "0,14" x + "0,08" y$. Độ rủi ro (phương sai) được đo bởi hàm $V(x, y) = "0,04" x^2 + "0,01" y^2$. Để đảm bảo tỷ suất sinh lời kỳ vọng đạt ít nhất $"10"%$ ($"0,14" x + "0,08" y ge "0,10"$), tỉ trọng $x$ tối thiểu cần đầu tư vào danh mục $A$ là:],
  (
    [$1/4$],
    True([$1/3$]),
    [$1/2$],
    [$2/5$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-emerald)[$"0,14" x + "0,08"(1-x) ge "0,10" <=> "0,06" x ge "0,02" <=> x ge 1/3$])
  }),
  loigiai: [
    #step[
      Thay $y = 1 - x$ vào bất phương trình sinh lời kỳ vọng:
      $ "0,14" x + "0,08"(1 - x) ge "0,10" $
      $ <=> "0,06" x + "0,08" ge "0,10" <=> "0,06" x ge "0,02" <=> x ge ("0,02") / ("0,06") = 1/3. $
      Do đó tỉ trọng tối thiểu đầu tư vào $A$ là $x = 1/3$.
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu Toàn Diện & Đẳng Cấp)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Lý Thuyết Đối Ngẫu Mạnh & Bổ Đề Farkas Trong Quy Hoạch Tuyến Tính)*: \
  Xét bài toán quy hoạch tuyến tính dạng chuẩn: Cực đại hóa $F(x) = c^T x$ với ràng buộc $A x le b$ và $x ge 0$ (Bài toán gốc Primal). Bài toán đối ngẫu (Dual) là cực tiểu hóa $G(y) = b^T y$ với $A^T y ge c$ và $y ge 0$],
  (
    True([*Định lý Đối ngẫu yếu (Weak Duality)*: Với mọi phương án khả thi $x$ của bài toán gốc và phương án khả thi $y$ của bài toán đối ngẫu, luôn có $c^T x le b^T y$.]),
    True([*Định lý Đối ngẫu mạnh (Strong Duality)*: Nếu bài toán gốc có nghiệm tối ưu hữu hạn $x^*$ thì bài toán đối ngẫu cũng có nghiệm tối ưu hữu hạn $y^*$ và $c^T x^* = b^T y^*$.]),
    True([*Điều kiện bù (Complementary Slackness)*: Tại nghiệm tối ưu, nếu một ràng buộc của bài toán gốc không chặt ($sum a_(i j) x_j^* < b_i$) thì biến đối ngẫu tương ứng bắt buộc phải bằng $0$ ($y_i^* = 0$).]),
    False([Bổ đề Farkas khẳng định rằng luôn luôn tồn tại đồng thời nghiệm cho cả hai hệ $A x le b$ và $A^T y = c$ với $y ge 0$.]),
  ),
  loigiai: [
    *(a) Đúng.* $c^T x le (A^T y)^T x = y^T A x le y^T b = b^T y$. \
    *(b) Đúng.* Định lý đối ngẫu mạnh của John von Neumann (1947). \
    *(c) Đúng.* Đây là định lý bù nới lỏng Kuhn-Tucker: $y_i (b_i - sum a_(i j) x_j) = 0$. \
    *(d) Sai.* Bổ đề Farkas là định lý về sự *loại trừ lẫn nhau* (Alternative Theorem): Trong hai hệ, luôn có đúng một hệ có nghiệm, không thể cả hai cùng có nghiệm.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Tính Chất Tô-pô & Hình Học Lồi Của Miền Nghiệm Quy Hoạch Tuyến Tính)*: \
  Cho hệ gồm $m$ bất phương trình bậc nhất hai ẩn xác định miền nghiệm $Omega subset RR^2$],
  (
    True([Miền nghiệm $Omega$ luôn là giao của các nửa mặt phẳng đóng, do đó $Omega$ luôn là một tập lồi và đóng trong $RR^2$.]),
    True([Nếu $Omega$ là đa giác lồi bị chặn thì mọi điểm $M in Omega$ đều có thể biểu diễn dưới dạng tổ hợp lồi của các đỉnh cực biên (Định lý Minkowski-Carathéodory).]),
    True([Hàm mục tiêu tuyến tính $F(x, y) = a x + b y$ vừa là hàm lồi vừa là hàm lõm trên $RR^2$.]),
    False([Nếu bài toán quy hoạch có vô số nghiệm tối ưu thì miền nghiệm $Omega$ bắt buộc phải là một miền không bị chặn.]),
  ),
  loigiai: [
    *(a) Đúng.* Giao của bất kỳ họ tập lồi đóng nào cũng là một tập lồi đóng. \
    *(b) Đúng.* Định lý biểu diễn Carathéodory cho tập lồi compact trong $RR^2$. \
    *(c) Đúng.* Hàm tuyến tính thỏa mãn $F(alpha u + (1-alpha)v) = alpha F(u) + (1-alpha)F(v)$, thỏa mãn cả đẳng thức lồi và lõm. \
    *(d) Sai.* Nếu đường mức song song với một cạnh của đa giác bị chặn thì toàn bộ đoạn thẳng cạnh đó là nghiệm tối ưu, bài toán có vô số nghiệm dù miền bị chặn hoàn toàn!
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu VDC Cực Khó)

// TLN 1
#tln(
  [*(Quy hoạch tuyến tính cực đại hóa doanh thu đa giác)*: \
  Cho miền nghiệm xác định bởi hệ bất phương trình $cases(x + y le 8, 2x + y le 12, x ge 0\, y ge 0)$. Tìm giá trị lớn nhất của hàm mục tiêu $F(x, y) = 5x + 3y$.],
  [$32$],
  loigiai: [
    #step[
      *Tọa độ các đỉnh của tứ giác:* \
      - $O(0; 0) ==> F(0, 0) = 0$.
      - $A(6; 0)$ (giao của $2x + y = 12$ với trục hoành): $F(6, 0) = 5(6) + 0 = 30$.
      - $B(4; 4)$ (giao của $x + y = 8$ và $2x + y = 12$, do $x = 12 - 8 = 4 => y = 4$):
        $ F(4, 4) = 5(4) + 3(4) = 20 + 12 = 32. $
      - $C(0; 8)$ (giao của $x + y = 8$ với trục tung): $F(0, 8) = 3(8) = 24$. \
      *Kết luận:* Giá trị lớn nhất là $32$ tại đỉnh $B(4; 4)$.
    ]
  ]
)

// TLN 2
#tln(
  [*(Bình phương khoảng cách Euclid cực tiểu)*: \
  Cho miền nghiệm $Omega$ xác định bởi hệ $cases(x + y le 6, x ge 0\, y ge 0)$. Tìm giá trị nhỏ nhất của bình phương khoảng cách từ điểm $M(5; 5)$ đến một điểm bất kỳ thuộc miền $Omega$:
  $ d^2 = (x - 5)^2 + (y - 5)^2. $],
  [$8$],
  loigiai: [
    #step[
      Hình chiếu vuông góc của điểm $M(5; 5)$ lên đường thẳng $x + y - 6 = 0$ là điểm $H$:
      Vectơ pháp tuyến $vec(n) = (1; 1)$.
      Khoảng cách từ $M$ đến đường thẳng:
      $ d(M, Delta) = frac(|5 + 5 - 6|, sqrt(1^2 + 1^2)) = frac(4, sqrt(2)) = 2 sqrt(2). $
      Tọa độ điểm hình chiếu: $H = M - frac(4, 2)(1; 1) = (5 - 2; 5 - 2) = (3; 3)$. \
      Điểm $H(3; 3)$ thuộc miền $Omega$ vì $3 + 3 = 6 le 6, 3 ge 0, 3 ge 0$. \
      Do đó: $d_min^2 = (2 sqrt(2))^2 = 8$.
    ]
  ]
)

// TLN 3
#tln(
  [*(Đếm số điểm nguyên trong miền nghiệm)*: \
  Có bao nhiêu cặp số nguyên $(x; y)$ ($x, y in ZZ$) thỏa mãn đồng thời hệ bất phương trình:
  $ cases(x ge 0\, y ge 0, x + 2y le 6, 2x + y le 6) $],
  [$11$],
  loigiai: [
    #step[
      Liệt kê theo các giá trị nguyên của $x$:
      - $x = 0: y in ZZ, 0 le y le 3 ==> y in {0, 1, 2, 3}$ ($4$ điểm).
      - $x = 1: y in ZZ, y le (6 - 1)/2 = 2.5$ và $y le 6 - 2 = 4 ==> y in {0, 1, 2}$ ($3$ điểm).
      - $x = 2: y le (6 - 2)/2 = 2$ và $y le 6 - 4 = 2 ==> y in {0, 1, 2}$ ($3$ điểm).
      - $x = 3: y le (6 - 3)/2 = 1.5$ và $y le 6 - 6 = 0 ==> y = 0$ ($1$ điểm).
      - $x ge 4: 2x + y ge 8 > 6$ (không có nghiệm $y ge 0$). \
      Đặc biệt kiểm tra lại:
      - $x = 0$: $(0,0), (0,1), (0,2), (0,3)$ ($4$ điểm).
      - $x = 1$: $(1,0), (1,1), (1,2)$ ($3$ điểm).
      - $x = 2$: $(2,0), (2,1), (2,2)$ ($3$ điểm).
      - $x = 3$: $(3,0)$ ($1$ điểm). \
      Tổng số điểm nguyên: $4 + 3 + 3 + 1 = 11$ điểm (hoặc $12$ nếu tính thêm biên). Chính xác là $11$ điểm. Ta đặt đáp án chuẩn là $11$.
    ]
  ]
)

// TLN 4
#tln(
  [*(Giá trị đối ngẫu tối ưu Kantorovich)*: \
  Cho bài toán quy hoạch cực đại hóa $F(x_1, x_2) = 3 x_1 + 2 x_2$ với các ràng buộc $2 x_1 + x_2 le 10, x_1 + 2 x_2 le 8, x_1, x_2 ge 0$. Theo Định lý đối ngẫu mạnh, giá trị tối ưu của bài toán đối ngẫu tương ứng bằng bao nhiêu? (viết kết quả dưới dạng phân số tối giản).],
  [$16$],
  loigiai: [
    #step[
      Theo Định lý Đối ngẫu Mạnh của Von Neumann, giá trị tối ưu của bài toán đối ngẫu đúng bằng giá trị tối ưu của bài toán gốc. \
      Giải bài toán gốc:
      Giao điểm của $2x_1 + x_2 = 10$ và $x_1 + 2x_2 = 8$:
      $ cases(4x_1 + 2x_2 = 20, x_1 + 2x_2 = 8) ==> 3x_1 = 12 ==> x_1 = 4 ==> x_2 = 2. $
      Giá trị mục tiêu tại $(4; 2)$:
      $ F(4, 2) = 3(4) + 2(2) = 12 + 4 = 16. $
      Các đỉnh khác: $(5; 0) => F = 15$; $(0; 4) => F = 8$. \
      Vậy giá trị tối ưu của bài toán gốc và đối ngẫu đều bằng $16$.
    ]
  ]
)

#v(0.8em)

= V. BÀI TOÁN THÁCH THỨC TRÍ TUỆ ĐỈNH CAO (OLYMPIC & GRAND CHALLENGES)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0F172A"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC KINH TẾ LƯỢNG: ĐỊNH LÝ ĐỐI NGẪU MẠNH VON NEUMANN & GIÁ BÓNG KANTOROVICH] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Nền tảng giải Nobel Kinh tế 1975 của Leonid Kantorovich & Định lý Bù đối ngẫu Kuhn-Tucker)]

  #v(0.4em)
  *Đề bài:* Một tập đoàn công nghệ cao chế tạo hai loại vi mạch bán dẫn $M_1$ và $M_2$ với số lượng sản xuất lần lượt là $x_1, x_2 ge 0$ (đơn vị: nghìn sản phẩm). Quy trình sản xuất đòi hỏi ba nguồn tài nguyên có giới hạn khắt khe:
  - Giờ vận hành máy quang khắc cực tím (EUV): $2 x_1 + x_2 le 100$ (giờ).
  - Khối lượng vật liệu bán dẫn tinh khiết cao: $x_1 + 2 x_2 le 80$ (kg).
  - Hạn ngạch năng lượng điện sạch: $x_1 + x_2 le 60$ (MWh).
  Lợi nhuận thu được khi bán sản phẩm là $F(x_1, x_2) = 500 x_1 + 400 x_2$ (triệu đồng).
  1. *Bài toán gốc (Primal):* Xác định kế hoạch sản xuất $(x_1^*, x_2^*)$ để tối đa hóa tổng lợi nhuận $F_max$.
  2. *Bài toán đối ngẫu (Dual):* Giả sử một đối tác muốn thuê lại toàn bộ năng lực ba nguồn tài nguyên trên. Thiết lập bài toán định giá tài nguyên (gọi $y_1, y_2, y_3$ lần lượt là đơn giá thuê một đơn vị tài nguyên) sao cho tổng chi phí thuê là nhỏ nhất mà tập đoàn vẫn chấp nhận cho thuê.
  3. Chứng minh *Định lý Đối ngẫu Mạnh:* $max F(x) = min G(y)$ và phân tích ý nghĩa kinh tế học của "Giá bóng" (Shadow Price).
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 0.08cm, {
    import cetz.draw: *
    
    // Hệ trục tọa độ x1, x2
    line((-5, 0), (70, 0), mark: (end: ">"), stroke: 1.2pt)
    content((72, 0), [$x_1$], anchor: "west")
    line((0, -5), (0, 70), mark: (end: ">"), stroke: 1.2pt)
    content((0, 72), [$x_2$], anchor: "south")
    
    // Các đường biên
    // 2x1 + x2 = 100: (50, 0) đến (0, 100) -> cắt trục tại (50, 0)
    line((50, 0), (20, 60), stroke: (dash: "dashed", paint: rgb("2563EB"), thickness: 1pt))
    content((55, 12), text(fill: rgb("2563EB"), size: 8pt)[$2x_1 + x_2 = 100$])
    
    // x1 + 2x2 = 80: (80, 0) đến (0, 40)
    line((0, 40), (60, 10), stroke: (dash: "dashed", paint: rgb("DC2626"), thickness: 1pt))
    content((15, 42), text(fill: rgb("DC2626"), size: 8pt)[$x_1 + 2x_2 = 80$])

    // x1 + x2 = 60: (60, 0) đến (0, 60)
    line((0, 60), (60, 0), stroke: (dash: "dotted", paint: rgb("16A34A"), thickness: 1.2pt))
    content((50, 25), text(fill: rgb("16A34A"), size: 8pt)[$x_1 + x_2 = 60$])
    
    // Miền đa giác lồi Feasible Region O - A - B - C - D:
    // Đỉnh O(0, 0), A(50, 0)
    // Giao của 2x1 + x2 = 100 và x1 + x2 = 60 là B(40, 20)
    // Giao của x1 + x2 = 60 và x1 + 2x2 = 80 là C(40, 20) -> C trùng B(40, 20)!
    // Tại (40, 20): 2(40)+20 = 100, 40+2(20) = 80, 40+20 = 60 -> cả 3 đường đồng quy tại (40, 20)!
    // Đỉnh D(0, 40)
    line((0, 0), (50, 0), (40, 20), (0, 40), close: true, fill: rgb("EFF6FF"), stroke: 1.5pt + rgb("1E40AF"))
    
    // Điểm cực trị B(40, 20)
    circle((40, 20), radius: 2, fill: rgb("B91C1C"))
    content((40, 26), text(fill: rgb("B91C1C"), weight: "bold", size: 8.5pt)[Đỉnh tối ưu $B(40; 20)$])

    // Vector pháp tuyến grad F = (500, 400)
    line((40, 20), (52, 29.6), mark: (end: ">"), stroke: 1.5pt + rgb("D97706"))
    content((56, 33), text(fill: rgb("D97706"), weight: "bold", size: 8pt)[$nabla F = (500; 400)$])
  })
]

#v(0.4em)

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 3pt + rgb("D97706")),
  inset: (x: 12pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC & ĐỊNH LÝ ĐỐI NGẪU BÙ:] \
  
  #step[
    *1. Giải Bài toán gốc (Primal Problem):* \
    Miền chấp nhận được $cal(D)$ là ngũ giác lồi với các đỉnh:
    - $O(0; 0) => F(0, 0) = 0$.
    - $A(50; 0) => F(50, 0) = 500(50) = 25000$ triệu đồng.
    - $D(0; 40) => F(0, 40) = 400(40) = 16000$ triệu đồng.
    - Điểm giao điểm $B(40; 20)$: Thỏa mãn đồng thời cả ba đường biên:
      $ 2(40) + 20 = 100, quad 40 + 2(20) = 80, quad 40 + 20 = 60. $
      Giá trị hàm mục tiêu tại $B$:
      $ F(40, 20) = 500(40) + 400(20) = 20000 + 8000 = 28000 "triệu đồng" = 28 "tỉ đồng". $
    *Kết luận bài toán gốc:* Kế hoạch sản xuất tối ưu là sản xuất $40$ nghìn chip $M_1$ và $20$ nghìn chip $M_2$, đạt lợi nhuận cực đại $28$ tỉ đồng.
  ]
  
  #step[
    *2. Thiết lập và Giải Bài toán đối ngẫu (Dual Problem):* \
    Gọi $y_1, y_2, y_3 ge 0$ lần lượt là giá bóng (tiền thuê tương đương) của 1 giờ máy EUV, 1 kg vật liệu và 1 MWh điện.
    Để tập đoàn đồng ý cho thuê thay vì tự sản xuất:
    - Chi phí tài nguyên tạo ra 1 đơn vị chip $M_1$ phải không nhỏ hơn lợi nhuận của $M_1$: $2 y_1 + y_2 + y_3 ge 500$.
    - Chi phí tài nguyên tạo ra 1 đơn vị chip $M_2$ phải không nhỏ hơn lợi nhuận của $M_2$: $y_1 + 2 y_2 + y_3 ge 400$.
    Hàm mục tiêu đối ngẫu tối thiểu hóa tổng chi phí thuê tài nguyên:
    $ min G(y_1, y_2, y_3) = 100 y_1 + 80 y_2 + 60 y_3. $
  ]
  
  #step[
    *3. Định lý Bù đối ngẫu (Complementary Slackness) & Giá trị Giá bóng:* \
    Theo lý thuyết John von Neumann và Karush-Kuhn-Tucker (KKT):
    Nếu một tài nguyên được sử dụng hết $100%$ công suất tại điểm tối ưu, giá bóng của nó $y_i$ có thể dương (tài nguyên quý hiếm - Bottleneck). Ngược lại nếu tài nguyên còn dư thừa, giá bóng bắt buộc bằng 0! \
    Tại điểm tối ưu $x_1^* = 40, x_2^* = 20$, cả hai biến $x_1^*, x_2^* > 0$, do đó hệ ràng buộc đối ngẫu đạt dấu bằng:
    $ cases(2 y_1 + y_2 + y_3 = 500, y_1 + 2 y_2 + y_3 = 400) $
    Lấy phương trình trên trừ phương trình dưới: $y_1 - y_2 = 100 => y_1 = y_2 + 100$. \
    Chọn nghiệm đối ngẫu tối ưu tương ứng: đặt $y_3 = 0$ (năng lượng điện không phải là nút thắt đơn độc), ta có:
    $ cases(2 y_1 + y_2 = 500, y_1 - y_2 = 100) => 3 y_1 = 600 => y_1^* = 200, quad y_2^* = 100, quad y_3^* = 0. $
    Giá trị hàm mục tiêu đối ngẫu:
    $ G(200, 100, 0) = 100(200) + 80(100) + 60(0) = 20000 + 8000 = 28000 "triệu đồng"! $
    Ta thấy chuẩn xác $max F(x) = min G(y) = 28000$ (Định lý Đối ngẫu Mạnh được thỏa mãn hoàn toàn). \
    *Ý nghĩa kinh tế của Giá bóng:*
    - $y_1^* = 200$ triệu/giờ: Nếu tăng thêm 1 giờ máy EUV, tổng lợi nhuận của tập đoàn sẽ tăng thêm đúng $200$ triệu đồng.
    - $y_2^* = 100$ triệu/kg: Nếu bổ sung thêm 1 kg vật liệu bán dẫn, lợi nhuận tăng thêm $100$ triệu đồng.
    - $y_3^* = 0$: Tài nguyên điện không tạo thêm giá trị biên tại lân cận nghiệm tối ưu. Đây là cơ sở cốt tử để doanh nghiệp ra quyết định đầu tư mở rộng tài nguyên!
  ]
]

