#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("1e3a8a") // Deep Navy

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG",
  exam-title: "ĐỀ ÔN TẬP CHUYÊN ĐỀ 3A: KHÁI NIỆM BIẾN NGẪU NHIÊN RỜI RẠC & BẢNG PHÂN BỐ XÁC SUẤT",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "521",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong các đại lượng sau đây trong thực tiễn đời sống và khoa học kỹ thuật, đại lượng nào là một ví dụ về biến ngẫu nhiên rời rạc?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-3.5, 0), (3.5, 0), mark: (end: "stealth"), stroke: 0.8pt + accent)
    content((3.5, -0.3), [$x$])
    for (i, val) in ((-2, "0"), (-1, "1"), (0, "2"), (1, "3"), (2, "4")) {
      circle((i, 0), radius: 0.12, fill: accent, stroke: white + 0.8pt)
      content((i, -0.4), text(size: 8pt, weight: "bold", val))
      line((i, 0.2), (i, 1.0), stroke: (dash: "dashed", paint: accent.lighten(40%)))
    }
    content((0, 1.3), text(size: 8.5pt, fill: accent, [Tập giá trị là các điểm cô lập rời rạc: $\{0, 1, 2, ...\}$]))
  })
]
],
    (
        [Thời gian chờ xe buýt đến trạm của một hành khách tại điểm dừng.],
        True([Số lượng phế phẩm tìm thấy khi kiểm tra ngẫu nhiên một lô hàng gồm $50$ sản phẩm.]),
        [Chiều cao của các học sinh lớp 12 đo bằng thước đo vạch chia liên tục.],
        [Nhiệt độ không khí trung bình trong ngày đo tại trạm khí tượng thủy văn.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Biến ngẫu nhiên rời rạc là biến ngẫu nhiên mà tập hợp các giá trị có thể nhận của nó là một tập hợp hữu hạn hoặc đếm được (thường là các số nguyên không âm $0, 1, 2, ...$).
        - Ngược lại, biến ngẫu nhiên liên tục nhận giá trị trên một khoảng, nửa khoảng hoặc đoạn liên tục của trục số thực (như thời gian, độ dài, khối lượng, nhiệt độ).

        #step([Lời giải chi tiết])
        - Phương án A: Thời gian chờ là đại lượng liên tục thuộc khoảng $[0; +infinity)$.
        - Phương án B: Số phế phẩm chỉ có thể nhận các giá trị nguyên rời rạc thuộc tập $\{0, 1, 2, ..., 50\}$, do đó đây là biến ngẫu nhiên rời rạc.
        - Phương án C: Chiều cao là đại lượng liên tục.
        - Phương án D: Nhiệt độ là đại lượng liên tục.
    ]
)

// TN 2
#tn([Một biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$1$], [$2$], [$3$], [$4$],
    [$P(X = x)$], [$0","15$], [$m$], [$0","40$], [$0","20$]
  )
]
Giá trị của tham số $m$ bằng bao nhiêu để bảng trên là một bảng phân bố xác suất hợp lệ?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (4.5, 0), stroke: 0.8pt + gray)
    line((0, -0.2), (0, 2.5), stroke: 0.8pt + gray, mark: (end: "stealth"))
    content((0, 2.7), text(size: 8pt, [$P(X)$]))
    
    let data = ((1, 0.15 * 5, "0,15"), (2, 0.25 * 5, "m = ?"), (3, 0.40 * 5, "0,40"), (4, 0.20 * 5, "0,20"))
    for (x, h, lbl) in data {
      rect((x - 0.3, 0), (x + 0.3, h), fill: if x == 2 { rgb("f59e0b").lighten(50%) } else { accent.lighten(70%) }, stroke: 0.8pt + accent)
      content((x, h + 0.25), text(size: 7.5pt, weight: "bold", lbl))
      content((x, -0.3), text(size: 8pt, str(x)))
    }
  })
]
],
    (
        [$m = 0","15$],
        True([$m = 0","25$]),
        [$m = 0","30$],
        [$m = 0","35$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Điều kiện chuẩn hóa của bảng phân bố xác suất biến ngẫu nhiên rời rạc:
        - $0 <= p_i <= 1$ với mọi $i$.
        - Tổng xác suất của tất cả các giá trị khả dĩ phải bằng đúng $1$:
        $ sum_(i=1)^n P(X = x_i) = 1 $

        #step([Lời giải chi tiết])
        Tổng các xác suất trong bảng:
        $ 0","15 + m + 0","40 + 0","20 = 1 $
        $ m + 0","75 = 1 ==> m = 1 - 0","75 = 0","25 $
        Vì $0 <= 0","25 <= 1$ nên giá trị $m = 0","25$ thỏa mãn.
    ]
)

// TN 3
#tn([Một trung tâm chăm sóc khách hàng thống kê số lượng cuộc gọi khiếu nại $X$ nhận được trong một khung giờ cao điểm với bảng phân bố xác suất:
#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$0$], [$1$], [$2$], [$3$],
    [$P(X = x)$], [$0","10$], [$0","35$], [$0","40$], [$0","15$]
  )
]
Xác suất để trong một khung giờ cao điểm, trung tâm nhận được ít nhất $2$ cuộc gọi khiếu nại là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (4.0, 0), stroke: 0.8pt + gray)
    let vals = ((0, 0.10 * 5, accent.lighten(80%)), (1, 0.35 * 5, accent.lighten(80%)), (2, 0.40 * 5, accent.lighten(30%)), (3, 0.15 * 5, accent.lighten(30%)))
    for (x, h, bg) in vals {
      rect((x - 0.3, 0), (x + 0.3, h), fill: bg, stroke: 0.8pt + accent)
      content((x, -0.3), text(size: 8pt, str(x)))
    }
    rect((1.5, 2.2), (3.5, 2.7), fill: rgb("eff6ff"), stroke: 0.5pt + accent)
    content((2.5, 2.45), text(size: 7.5pt, fill: accent, [Miền $X >= 2$: $P = 0","40 + 0","15$]))
  })
]
],
    (
        [$0","40$],
        True([$0","55$]),
        [$0","85$],
        [$0","90$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Biến cố "nhận được ít nhất $2$ cuộc gọi" tương ứng với $X >= 2$, bao gồm hai trường hợp rời nhau: $X = 2$ hoặc $X = 3$.
        $ P(X >= 2) = P(X = 2) + P(X = 3) $

        #step([Lời giải chi tiết])
        Tra bảng xác suất:
        $ P(X >= 2) = 0","40 + 0","15 = 0","55 $
        (Hoặc tính theo biến cố đối: $P(X >= 2) = 1 - P(X <= 1) = 1 - (0","10 + 0","35) = 1 - 0","45 = 0","55$).
    ]
)

// TN 4
#tn([Tung đồng thời $3$ đồng xu cân đối và đồng chất. Gọi $X$ là biến ngẫu nhiên chỉ số lần xuất hiện mặt ngửa ($N$). Bảng phân bố xác suất của biến ngẫu nhiên $X$ là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    circle((0, 1.5), radius: 0.2, fill: accent, stroke: none)
    content((0, 1.5), text(size: 7pt, fill: white, [Start]))
    line((0, 1.3), (-1.5, 0.7), stroke: 0.6pt + accent)
    line((0, 1.3), (1.5, 0.7), stroke: 0.6pt + accent)
    content((-1.6, 0.6), text(size: 7pt, [N]))
    content((1.6, 0.6), text(size: 7pt, [S]))
    content((0, 0), text(size: 7.5pt, fill: accent, [Tổng $2^3 = 8$ kết quả đồng khả năng]))
  })
]
],
    (
        True([$P(X = 0) = 1/8$, $P(X = 1) = 3/8$, $P(X = 2) = 3/8$, $P(X = 3) = 1/8$.]),
        [$P(X = 0) = 1/4$, $P(X = 1) = 1/4$, $P(X = 2) = 1/4$, $P(X = 3) = 1/4$.],
        [$P(X = 0) = 1/8$, $P(X = 1) = 2/8$, $P(X = 2) = 3/8$, $P(X = 3) = 2/8$.],
        [$P(X = 1) = 3/8$, $P(X = 2) = 3/8$, $P(X = 3) = 2/8$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Không gian mẫu tung $3$ đồng xu: $n(Omega) = 2^3 = 8$.
        - Biến ngẫu nhiên $X$ nhận các giá trị trong tập $\{0, 1, 2, 3\}$.
        - Số kết quả thuận lợi cho $X = k$ là $C_3^k$:
        $ P(X = k) = (C_3^k) / 8 $

        #step([Lời giải chi tiết])
        - $k = 0$ (SSS): $C_3^0 / 8 = 1/8$.
        - $k = 1$ (SSN, SNS, NSS): $C_3^1 / 8 = 3/8$.
        - $k = 2$ (SNN, NSN, NNS): $C_3^2 / 8 = 3/8$.
        - $k = 3$ (NNN): $C_3^3 / 8 = 1/8$.
        Tổng xác suất: $1/8 + 3/8 + 3/8 + 1/8 = 1$.
    ]
)

// TN 5
#tn([Một hộp chứa $5$ quả cầu màu đỏ và $3$ quả cầu màu xanh có cùng kích thước. Lấy ngẫu nhiên đồng thời $2$ quả cầu từ hộp. Gọi $X$ là số quả cầu màu đỏ lấy được. Xác suất $P(X = 1)$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2, -1), (2, 1), stroke: 1pt + accent, fill: rgb("f8fafc"))
    content((-1.2, 1.2), text(size: 8pt, weight: "bold", fill: accent, [Hộp cầu]))
    for i in range(5) {
      circle((-1.3 + i * 0.45, 0.4), radius: 0.16, fill: rgb("ef4444"), stroke: white + 0.5pt)
    }
    for i in range(3) {
      circle((-0.8 + i * 0.5, -0.4), radius: 0.16, fill: rgb("3b82f6"), stroke: white + 0.5pt)
    }
    content((0, -1.3), text(size: 8pt, [Lấy ngẫu nhiên $2$ quả: 1 Đỏ + 1 Xanh]))
  })
]
],
    (
        True([$15/28$]),
        [$10/28$],
        [$3/28$],
        [$5/14$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Tổng số quả cầu trong hộp: $5 + 3 = 8$ quả.
        - Số phần tử của không gian mẫu lấy $2$ quả từ $8$ quả: $n(Omega) = C_8^2 = 28$.
        - Biến cố $X = 1$ tương ứng với việc lấy được đúng $1$ quả đỏ (từ $5$ quả đỏ) và $1$ quả xanh (từ $3$ quả xanh).

        #step([Lời giải chi tiết])
        Số cách chọn thuận lợi:
        $ n(X = 1) = C_5^1 dot C_3^1 = 5 dot 3 = 15 $
        Xác suất tương ứng:
        $ P(X = 1) = 15 / (C_8^2) = 15 / 28 $
    ]
)

// TN 6
#tn([Hai xạ thủ A và B độc lập cùng bắn mỗi người $1$ viên đạn vào một bia mục tiêu. Xác suất bắn trúng bia của A và B lần lượt là $0","7$ và $0","8$. Gọi $X$ là tổng số viên đạn bắn trúng bia. Xác suất để $X = 1$ là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 1.2, stroke: 1pt + accent, fill: rgb("f1f5f9"))
    circle((0, 0), radius: 0.8, stroke: 0.8pt + accent, fill: rgb("e2e8f0"))
    circle((0, 0), radius: 0.4, stroke: 0.8pt + accent, fill: rgb("cbd5e1"))
    circle((0, 0), radius: 0.1, fill: rgb("ef4444"))
    content((2.2, 0.5), text(size: 7.5pt, [Xạ thủ A: $P(A) = 0","7$]))
    content((2.2, -0.5), text(size: 7.5pt, [Xạ thủ B: $P(B) = 0","8$]))
  })
]
],
    (
        [$0","26$],
        True([$0","38$]),
        [$0","56$],
        [$0","14$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Biến cố $X = 1$ là biến cố có đúng $1$ xạ thủ bắn trúng và $1$ xạ thủ bắn trượt. Gồm hai khả năng xung khắc:
        1. A trúng và B trượt: biến cố $A inter overline(B)$.
        2. A trượt và B trúng: biến cố $overline(A) inter B$.

        #step([Lời giải chi tiết])
        Vì A và B độc lập:
        $ P(X = 1) = P(A) dot P(overline(B)) + P(overline(A)) dot P(B) $
        Biết $P(overline(A)) = 1 - 0","7 = 0","3$ và $P(overline(B)) = 1 - 0","8 = 0","2$.
        Thay số:
        $ P(X = 1) = 0","7 dot 0","2 + 0","3 dot 0","8 = 0","14 + 0","24 = 0","38 $
    ]
)

// TN 7
#tn([Cho biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$0$], [$1$], [$2$], [$3$],
    [$P(X = x)$], [$0","2$], [$0","3$], [$0","4$], [$0","1$]
  )
]
Hàm phân bố xác suất tích lũy $F(x) = P(X <= x)$ tại điểm $x = 1","8$ có giá trị bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-1, 0), (4, 0), stroke: 0.8pt + gray, mark: (end: "stealth"))
    line((0, -0.2), (0, 2.5), stroke: 0.8pt + gray, mark: (end: "stealth"))
    content((4, -0.3), [$x$])
    content((-0.3, 2.5), [$F(x)$])
    
    line((-1, 0), (0, 0), stroke: 1.2pt + accent)
    line((0, 0.4), (1, 0.4), stroke: 1.2pt + accent)
    line((1, 1.0), (2, 1.0), stroke: 1.2pt + accent)
    line((2, 1.8), (3, 1.8), stroke: 1.2pt + accent)
    line((3, 2.0), (4, 2.0), stroke: 1.2pt + accent)
    
    line((1.8, 0), (1.8, 1.0), stroke: (dash: "dashed", paint: rgb("ea580c")))
    circle((1.8, 1.0), radius: 0.08, fill: rgb("ea580c"))
    content((1.8, -0.3), text(size: 7.5pt, fill: rgb("ea580c"), [$1","8$]))
    content((1.0, 1.3), text(size: 7.5pt, fill: accent, [$F(1","8) = 0","5$]))
  })
]
],
    (
        [$0","3$],
        True([$0","5$]),
        [$0","7$],
        [$0","9$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Định nghĩa hàm phân bố tích lũy:
        $ F(x) = P(X <= x) = sum_(x_i <= x) P(X = x_i) $

        #step([Lời giải chi tiết])
        Với $x = 1","8$, các giá trị của $X$ thỏa mãn $X <= 1","8$ là $X = 0$ và $X = 1$.
        Do đó:
        $ F(1","8) = P(X = 0) + P(X = 1) = 0","2 + 0","3 = 0","5 $
    ]
)

// TN 8
#tn([Biến ngẫu nhiên $X$ có bảng phân bố xác suất:
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$-1$], [$0$], [$1$],
    [$P$], [$0","3$], [$0","4$], [$0","3$]
  )
]
Xét biến ngẫu nhiên mới $Y = X^2$. Bảng phân bố xác suất của $Y$ là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2.5, -0.8), (-0.5, 0.8), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
    content((-1.5, 0.5), text(size: 8pt, weight: "bold", [Tập giá trị $X$]))
    content((-1.5, 0.1), [$-1, 0, 1$])
    
    rect((0.5, -0.8), (2.5, 0.8), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
    content((1.5, 0.5), text(size: 8pt, weight: "bold", [Tập giá trị $Y = X^2$]))
    content((1.5, 0.1), [$0, 1$])
    
    line((-0.5, 0.2), (0.5, 0.2), mark: (end: "stealth"), stroke: 1pt + accent)
    content((0, 0.45), text(size: 7.5pt, [$Y = X^2$]))
  })
]
],
    (
        True([$P(Y = 0) = 0","4$ và $P(Y = 1) = 0","6$.]),
        [$P(Y = 0) = 0","5$ và $P(Y = 1) = 0","5$.],
        [$P(Y = 0) = 0","4$, $P(Y = 1) = 0","3$, $P(Y = -1) = 0","3$.],
        [$P(Y = -1) = 0","3$ và $P(Y = 1) = 0","7$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Khi $X in {-1, 0, 1}$, đại lượng $Y = X^2$ chỉ nhận hai giá trị là:
          + $Y = 0^2 = 0$ (khi $X = 0$).
          + $Y = (-1)^2 = 1^2 = 1$ (khi $X = -1$ hoặc $X = 1$).
        - Gom nhóm các biến cố tương ứng để tính xác suất cho từng giá trị của $Y$.

        #step([Lời giải chi tiết])
        - $P(Y = 0) = P(X = 0) = 0","4$.
        - $P(Y = 1) = P(X = -1) + P(X = 1) = 0","3 + 0","3 = 0","6$.
        Tổng xác suất: $0","4 + 0","6 = 1$.
        Vậy bảng phân bố xác suất của $Y$ gồm hai giá trị $0$ (với xác suất $0","4$) và $1$ (với xác suất $0","6$).
    ]
)

// TN 9
#tn([Một nhân viên tiếp thị gọi điện chào hàng cho $3$ khách hàng độc lập. Xác suất để mỗi khách hàng đồng ý mua hàng là $0","2$. Gọi $X$ là số khách hàng đồng ý mua hàng. Xác suất để có ít nhất một khách hàng đồng ý mua hàng bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    for i in range(3) {
      rect((i * 2 - 2, -0.5), (i * 2 - 0.5, 0.5), stroke: 0.8pt + accent, fill: rgb("eff6ff"))
      content((i * 2 - 1.25, 0.1), text(size: 7.5pt, weight: "bold", [KH #(i + 1)]))
      content((i * 2 - 1.25, -0.25), text(size: 7pt, fill: rgb("16a34a"), [$p = 0","2$]))
    }
    content((0.5, -1.0), text(size: 8pt, fill: accent, [Biến cố đối: Cả 3 khách hàng đều từ chối]))
  })
]
],
    (
        True([$0","488$]),
        [$0","512$],
        [$0","600$],
        [$0","008$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng quy tắc biến cố đối:
        - Biến cố $A$: "Có ít nhất $1$ khách hàng đồng ý mua hàng" ($X >= 1$).
        - Biến cố đối $overline(A)$: "Không có khách hàng nào đồng ý mua hàng" ($X = 0$).
        $ P(X >= 1) = 1 - P(X = 0) $

        #step([Lời giải chi tiết])
        Xác suất mỗi khách hàng từ chối là $1 - 0","2 = 0","8$.
        Vì $3$ khách hàng độc lập:
        $ P(X = 0) = (0","8)^3 = 0","512 $
        Suy ra xác suất có ít nhất một khách hàng đồng ý mua:
        $ P(X >= 1) = 1 - 0","512 = 0","488 $
    ]
)

// TN 10
#tn([Một biến ngẫu nhiên rời rạc $X$ nhận các giá trị thuộc tập $\{1, 2, 3, 4\}$ với quy luật xác suất $P(X = k) = c / 2^k$ (với $c$ là một hằng số thực dương). Giá trị của $c$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (4.5, 0), stroke: 0.8pt + gray)
    line((0, -0.2), (0, 2.2), stroke: 0.8pt + gray, mark: (end: "stealth"))
    let heights = (1.6, 0.8, 0.4, 0.2)
    for (idx, h) in heights.enumerate() {
      let k = idx + 1
      rect((k - 0.25, 0), (k + 0.25, h), fill: accent.lighten(60%), stroke: 0.8pt + accent)
      content((k, h + 0.2), text(size: 7pt, [$c/2^#k$]))
      content((k, -0.3), text(size: 7.5pt, str(k)))
    }
  })
]
],
    (
        [$c = 15/16$],
        True([$c = 16/15$]),
        [$c = 8/7$],
        [$c = 7/8$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng điều kiện chuẩn hóa tổng xác suất:
        $ sum_(k=1)^4 P(X = k) = 1 $
        $ sum_(k=1)^4 c / 2^k = 1 <==> c dot sum_(k=1)^4 (1/2)^k = 1 $

        #step([Lời giải chi tiết])
        Tổng cấp số nhân lùi có $u_1 = 1/2$, công bội $q = 1/2$, số số hạng $n = 4$:
        $ S_4 = 1/2 + 1/4 + 1/8 + 1/16 = (8 + 4 + 2 + 1) / 16 = 15/16 $
        Do đó:
        $ c dot 15/16 = 1 ==> c = 16 / 15 $
    ]
)

// TN 11
#tn([Một đề kiểm tra có $4$ câu hỏi trắc nghiệm khách quan độc lập, mỗi câu có $4$ phương án lựa chọn trong đó chỉ có $1$ phương án đúng. Một học sinh không học bài nên khoanh ngẫu nhiên hoàn toàn cả $4$ câu. Gọi $X$ là số câu học sinh trả lời đúng. Xác suất để học sinh trả lời đúng đúng $2$ câu là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    for i in range(4) {
      rect((i * 1.5 - 2.2, -0.4), (i * 1.5 - 0.9, 0.4), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
      content((i * 1.5 - 1.55, 0), text(size: 7.5pt, [Câu #(i + 1)]))
    }
    content((0, -0.9), text(size: 8pt, fill: accent, [Xác suất đúng mỗi câu: $p = 1/4 = 0","25$]))
  })
]
],
    (
        True([$27/128$]),
        [$27/256$],
        [$54/256$],
        [$9/64$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số câu hỏi là $n = 4$. Với mỗi câu, xác suất trả lời đúng là $p = 1/4$, xác suất sai là $q = 1 - p = 3/4$.
        Đây là phép thử Bernoulli, biến ngẫu nhiên $X$ tuân theo phân bố nhị thức:
        $ P(X = k) = C_n^k p^k q^(n - k) $

        #step([Lời giải chi tiết])
        Với $k = 2$:
        $ P(X = 2) = C_4^2 dot (1/4)^2 dot (3/4)^(4 - 2) = 6 dot 1/16 dot 9/16 = 54 / 256 = 27 / 128 $
    ]
)

// TN 12
#tn([Gieo hai con xúc xắc cân đối và đồng chất. Gọi $X$ là giá trị lớn nhất trong hai mặt xuất hiện của hai con xúc xắc, tức là $X = max(X_1, X_2)$ với $X_1, X_2 in {1, 2, 3, 4, 5, 6}$. Xác suất $P(X = 4)$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    let s = 0.35
    for i in range(7) {
      line((-1.2 + i * s, -1.2), (-1.2 + i * s, 1.2), stroke: 0.4pt + gray)
      line((-1.2, -1.2 + i * s), (1.2, -1.2 + i * s), stroke: 0.4pt + gray)
    }
    content((0, -1.6), text(size: 7.5pt, fill: accent, [Không gian mẫu $6 times 6 = 36$ kết quả]))
    content((0, 1.5), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold", [Có đúng 7 cặp có $max(X_1, X_2) = 4$]))
  })
]
],
    (
        True([$7/36$]),
        [$4/36$],
        [$1/6$],
        [$9/36$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Tổng số kết quả có thể xảy ra khi gieo $2$ con xúc xắc là $n(Omega) = 6 dot 6 = 36$.
        - Biến cố $X = 4$ nghĩa là giá trị lớn nhất của hai con xúc xắc bằng đúng $4$.
        Điều này tương đương: cả hai con đều có số chấm $<= 4$ VÀ không được xảy ra trường hợp cả hai con đều có số chấm $<= 3$.

        #step([Lời giải chi tiết])
        - Số cặp $(X_1, X_2)$ thỏa mãn $X_1 <= 4$ và $X_2 <= 4$ là: $4 dot 4 = 16$ cặp.
        - Số cặp $(X_1, X_2)$ thỏa mãn $X_1 <= 3$ và $X_2 <= 3$ là: $3 dot 3 = 9$ cặp.
        Do đó, số cặp có $max(X_1, X_2) = 4$ là:
        $ 16 - 9 = 7 " cặp" $
        (Các cặp cụ thể là: $(4,1), (4,2), (4,3), (4,4), (1,4), (2,4), (3,4)$).
        Vậy:
        $ P(X = 4) = 7 / 36 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một hộp quà gồm $10$ phong bao lì xì bề ngoài hoàn toàn giống nhau, bên trong chứa các tờ tiền mệnh giá khác nhau:
- $4$ phong bao chứa tờ $10$ nghìn đồng.
- $3$ phong bao chứa tờ $20$ nghìn đồng.
- $2$ phong bao chứa tờ $50$ nghìn đồng.
- $1$ phong bao chứa tờ $100$ nghìn đồng.
Một người được chọn ngẫu nhiên $1$ phong bao lì xì. Gọi $X$ là mệnh giá (đơn vị: nghìn đồng) của tờ tiền trong phong bao được chọn.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    let items = ((10, 4, "10k (4 bao)"), (20, 3, "20k (3 bao)"), (50, 2, "50k (2 bao)"), (100, 1, "100k (1 bao)"))
    for (idx, (val, cnt, lbl)) in items.enumerate() {
      rect((idx * 1.8 - 2.8, -0.6), (idx * 1.8 - 1.2, 0.6), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
      content((idx * 1.8 - 2.0, 0.2), text(size: 7.5pt, weight: "bold", str(val) + "k"))
      content((idx * 1.8 - 2.0, -0.25), text(size: 7pt, fill: rgb("ea580c"), str(cnt) + "/10"))
    }
  })
]
],
    (
        True([Tập các giá trị có thể nhận của biến ngẫu nhiên $X$ là $T = {10, 20, 50, 100}$.]),
        True([Xác suất để người đó nhận được phong bao chứa mệnh giá $20$ nghìn đồng là $P(X = 20) = 0","3$.]),
        [Xác suất để người đó nhận được số tiền từ $50$ nghìn đồng trở lên là $P(X >= 50) = 0","2$.],
        True([Hàm phân bố xác suất tích lũy $F(x) = P(X <= x)$ thỏa mãn $F(40) = 0","7$.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Các mệnh giá xuất hiện trong hộp là $10, 20, 50, 100$ (nghìn đồng).
        Do đó tập giá trị của $X$ là $\{10, 20, 50, 100\}$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Có $3$ phong bao mệnh giá $20$ nghìn đồng trong tổng số $10$ phong bao:
        $ P(X = 20) = 3 / 10 = 0","3 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Biến cố nhận được từ $50$ nghìn đồng trở lên tương ứng với $X in {50, 100}$:
        $ P(X >= 50) = P(X = 50) + P(X = 100) = 2/10 + 1/10 = 3/10 = 0","3 $
        Đề bài đưa ra $0","2$ là sai.
        Khẳng định ý c là *SAI*.

        #step([Phân tích ý d])
        Theo định nghĩa hàm phân bố tích lũy:
        $ F(40) = P(X <= 40) = P(X = 10) + P(X = 20) = 0","4 + 0","3 = 0","7 $
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 2
#ds([Một hộp có chứa $4$ viên bi trắng và $6$ viên bi đen. Lấy ngẫu nhiên không hoàn lại lần lượt từng viên cho đến khi lấy được viên bi trắng thì dừng lại. Gọi $X$ là số lần lấy bi.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2.5, -0.9), (2.5, 0.9), stroke: 1pt + accent, fill: rgb("f8fafc"))
    content((-1.5, 0.6), text(size: 8pt, weight: "bold", fill: accent, [Hộp bi ban đầu]))
    for i in range(4) {
      circle((-1.8 + i * 0.4, 0.1), radius: 0.14, stroke: 1pt + gray, fill: white)
    }
    for i in range(6) {
      circle((-1.8 + (i - 3 * calc.floor(i / 3)) * 0.4, -0.4 + calc.floor(i / 3) * 0.35), radius: 0.14, fill: rgb("1e293b"), stroke: none)
    }
    content((1.2, 0), text(size: 7.5pt, [Dừng lại ngay khi\ gặp bi trắng đầu tiên]))
  })
]
],
    (
        True([Biến ngẫu nhiên $X$ có thể nhận giá trị lớn nhất bằng $7$.]),
        True([Xác suất để quá trình dừng lại ngay ở lần lấy thứ nhất là $P(X = 1) = 0","4$.]),
        True([Xác suất để quá trình dừng lại ở lần lấy thứ hai là $P(X = 2) = 4/15$.]),
        True([Xác suất để số lần lấy bi không vượt quá $2$ lần là $P(X <= 2) = 2/3$.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Trong hộp có tối đa $6$ viên bi đen. Trường hợp xấu nhất là lấy liên tiếp $6$ viên bi đen, thì ở lần lấy thứ $7$ chắc chắn sẽ là viên bi trắng (vì trong hộp lúc này chỉ còn toàn bi trắng).
        Do đó giá trị lớn nhất của $X$ là $7$ (tập giá trị của $X$ là $\{1, 2, 3, 4, 5, 6, 7\}$).
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Dừng lại ngay ở lần 1 nghĩa là lấy được bi trắng ngay lần 1:
        $ P(X = 1) = 4 / 10 = 0","4 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Dừng lại ở lần 2 nghĩa là lần 1 lấy được bi đen, lần 2 lấy được bi trắng:
        $ P(X = 2) = 6/10 dot 4/9 = 24 / 90 = 4 / 15 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Xác suất để số lần lấy bi không vượt quá $2$:
        $ P(X <= 2) = P(X = 1) + P(X = 2) = 4/10 + 4/15 = 2/5 + 4/15 = (6 + 4)/15 = 10/15 = 2/3 $
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 3
#ds([Một dây chuyền sản xuất vi mạch điện tử hoạt động tự động. Xác suất để dây chuyền tạo ra một vi mạch bị lỗi là $p = 0","05$. Để kiểm tra chất lượng định kỳ, kỹ sư lấy ngẫu nhiên độc lập $3$ vi mạch từ dây chuyền. Gọi $X$ là số vi mạch bị lỗi trong $3$ vi mạch được lấy ra.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    for i in range(3) {
      rect((i * 1.8 - 2.0, -0.6), (i * 1.8 - 0.6, 0.6), stroke: 0.8pt + accent, fill: rgb("eff6ff"))
      content((i * 1.8 - 1.3, 0.2), text(size: 7.5pt, weight: "bold", [Chip #(i + 1)]))
      content((i * 1.8 - 1.3, -0.25), text(size: 7pt, fill: rgb("ef4444"), [Lỗi: $5\%$]))
    }
  })
]
],
    (
        True([Biến ngẫu nhiên $X$ tuân theo quy luật phân bố nhị thức với các tham số $n = 3$ và $p = 0","05$.]),
        True([Xác suất để cả $3$ vi mạch đều đạt chuẩn (không có vi mạch nào bị lỗi) là $(0","95)^3 = 0","857375$.]),
        True([Xác suất để có đúng $1$ vi mạch bị lỗi trong $3$ vi mạch là $0","135375$.]),
        [Xác suất để có ít nhất $2$ vi mạch bị lỗi lớn hơn $1\%$.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Việc lấy $3$ vi mạch độc lập, mỗi vi mạch chỉ có $2$ trạng thái (lỗi với xác suất $p = 0","05$, hoặc chuẩn với xác suất $q = 0","95$) tạo thành dãy $3$ phép thử Bernoulli độc lập.
        Do đó $X$ tuân theo phân bố nhị thức $B(3; 0","05)$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Không có vi mạch nào bị lỗi tương ứng với $X = 0$:
        $ P(X = 0) = C_3^0 dot (0","05)^0 dot (0","95)^3 = (0","95)^3 = 0","857375 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Có đúng $1$ vi mạch bị lỗi tương ứng với $X = 1$:
        $ P(X = 1) = C_3^1 dot (0","05)^1 dot (0","95)^2 = 3 dot 0","05 dot 0","9025 = 0","135375 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Xác suất có ít nhất $2$ vi mạch lỗi:
        $ P(X >= 2) = P(X = 2) + P(X = 3) $
        $ P(X = 2) = C_3^2 dot (0","05)^2 dot 0","95 = 3 dot 0","0025 dot 0","95 = 0","007125 $
        $ P(X = 3) = C_3^3 dot (0","05)^3 = 0","000125 $
        $ P(X >= 2) = 0","007125 + 0","000125 = 0","00725 = 0","725\% $
        Vì $0","725\% < 1\%$ nên khẳng định "lớn hơn $1\%$" là SAI.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#ds([Cho biến ngẫu nhiên rời rạc $X$ có hàm phân bố xác suất tích lũy $F(x) = P(X <= x)$ được xác định bởi công thức:
$ F(x) = cases(
  0 & "khi" x < 1,
  0","2 & "khi" 1 <= x < 3,
  0","6 & "khi" 3 <= x < 5,
  1 & "khi" x >= 5
) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (6, 0), stroke: 0.8pt + gray, mark: (end: "stealth"))
    line((0, -0.2), (0, 2.5), stroke: 0.8pt + gray, mark: (end: "stealth"))
    content((6, -0.3), [$x$])
    content((-0.3, 2.5), [$F(x)$])
    
    line((-0.5, 0), (1, 0), stroke: 1.2pt + accent)
    circle((1, 0), radius: 0.06, fill: white, stroke: 1pt + accent)
    
    line((1, 0.4), (3, 0.4), stroke: 1.2pt + accent)
    circle((1, 0.4), radius: 0.06, fill: accent)
    circle((3, 0.4), radius: 0.06, fill: white, stroke: 1pt + accent)
    
    line((3, 1.2), (5, 1.2), stroke: 1.2pt + accent)
    circle((3, 1.2), radius: 0.06, fill: accent)
    circle((5, 1.2), radius: 0.06, fill: white, stroke: 1pt + accent)
    
    line((5, 2.0), (6, 2.0), stroke: 1.2pt + accent)
    circle((5, 2.0), radius: 0.06, fill: accent)
    
    content((1, -0.3), text(size: 7.5pt, [1]))
    content((3, -0.3), text(size: 7.5pt, [3]))
    content((5, -0.3), text(size: 7.5pt, [5]))
    content((-0.4, 0.4), text(size: 7.5pt, [$0","2$]))
    content((-0.4, 1.2), text(size: 7.5pt, [$0","6$]))
    content((-0.4, 2.0), text(size: 7.5pt, [$1$]))
  })
]
],
    (
        True([Biến ngẫu nhiên $X$ chỉ nhận ba giá trị rời rạc là $\{1, 3, 5\}$.]),
        True([Xác suất để $X = 3$ bằng độ nhảy của hàm $F(x)$ tại điểm $x = 3$, tức là $P(X = 3) = 0","4$.]),
        True([Xác suất để biến ngẫu nhiên $X$ nhận giá trị lớn hơn $2$ là $P(X > 2) = 0","8$.]),
        [Xác suất có điều kiện $P(X = 5 | X >= 3)$ bằng $0","4$.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Hàm phân bố $F(x)$ có $3$ bước nhảy gián đoạn tại các điểm $x = 1, x = 3, x = 5$. Do đó $X$ chỉ nhận $3$ giá trị rời rạc là $\{1, 3, 5\}$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Xác suất tại các điểm gián đoạn bằng bước nhảy của đồ thị:
        $ P(X = 1) = F(1) - F(1^-) = 0","2 - 0 = 0","2 $
        $ P(X = 3) = F(3) - F(3^-) = 0","6 - 0","2 = 0","4 $
        $ P(X = 5) = F(5) - F(5^-) = 1 - 0","6 = 0","4 $
        Vậy $P(X = 3) = 0","4$. Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        $ P(X > 2) = 1 - P(X <= 2) = 1 - F(2) $
        Vì $1 <= 2 < 3$ nên $F(2) = 0","2$.
        Do đó $P(X > 2) = 1 - 0","2 = 0","8$.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Áp dụng công thức xác suất có điều kiện:
        $ P(X = 5 | X >= 3) = (P(X = 5 " và " X >= 3)) / (P(X >= 3)) = (P(X = 5)) / (P(X = 3) + P(X = 5)) $
        Thay số:
        $ P(X = 5 | X >= 3) = (0","4) / (0","4 + 0","4) = (0","4) / (0","8) = 0","5 $
        Đề bài đưa ra $0","4$ là sai.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Một biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$0$], [$1$], [$2$], [$3$],
    [$P(X = x)$], [$a$], [$2a$], [$3a$], [$4a$]
  )
]
Tìm giá trị của tham số $a$ (viết kết quả dưới dạng số thập phân).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (4.5, 0), stroke: 0.8pt + gray)
    let hs = (0.3, 0.6, 0.9, 1.2)
    for (k, h) in hs.enumerate() {
      rect((k - 0.25, 0), (k + 0.25, h), fill: accent.lighten(60%), stroke: 0.8pt + accent)
      content((k, h + 0.2), text(size: 7pt, str(k + 1) + "a"))
      content((k, -0.3), text(size: 7.5pt, str(k)))
    }
    content((2, 1.8), text(size: 7.5pt, fill: accent, [$a + 2a + 3a + 4a = 1$]))
  })
]
],
    [0.1],
    loigiai: [
        #step([Phương pháp giải])
        Tổng xác suất trong bảng phân bố xác suất phải bằng $1$:
        $ sum_(i=1)^n p_i = 1 $

        #step([Lời giải chi tiết])
        $ a + 2a + 3a + 4a = 1 $
        $ 10a = 1 ==> a = 1 / 10 = 0","1 $

        Điền đáp số: `0.1`.
    ]
)

// TLN 2
#tln([Một xạ thủ bắn $3$ phát đạn độc lập vào mục tiêu. Xác suất bắn trúng mục tiêu của từng phát lần lượt là $p_1 = 0","6$; $p_2 = 0","7$ và $p_3 = 0","8$. Gọi $X$ là số viên đạn bắn trúng mục tiêu. Tính xác suất để xạ thủ bắn trúng đúng $2$ phát đạn (viết kết quả dưới dạng số thập phân).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    for i in range(3) {
      circle((i * 1.8 - 1.8, 0), radius: 0.6, stroke: 0.8pt + accent, fill: rgb("f8fafc"))
      circle((i * 1.8 - 1.8, 0), radius: 0.3, stroke: 0.6pt + accent, fill: rgb("e2e8f0"))
      circle((i * 1.8 - 1.8, 0), radius: 0.08, fill: rgb("ef4444"))
      content((i * 1.8 - 1.8, -0.8), text(size: 7pt, [Phát #(i + 1)]))
    }
  })
]
],
    [0.452],
    loigiai: [
        #step([Phương pháp giải])
        Biến cố "trúng đúng $2$ phát" gồm $3$ trường hợp xung khắc:
        1. Trúng phát 1, phát 2 và trượt phát 3.
        2. Trúng phát 1, phát 3 và trượt phát 2.
        3. Trúng phát 2, phát 3 và trượt phát 1.

        #step([Lời giải chi tiết])
        Xác suất trượt của các phát:
        $ q_1 = 1 - 0","6 = 0","4 $
        $ q_2 = 1 - 0","7 = 0","3 $
        $ q_3 = 1 - 0","8 = 0","2 $

        Do tính độc lập:
        $ P(X = 2) = p_1 p_2 q_3 + p_1 q_2 p_3 + q_1 p_2 p_3 $
        Thay số:
        $ P(X = 2) = (0","6 dot 0","7 dot 0","2) + (0","6 dot 0","3 dot 0","8) + (0","4 dot 0","7 dot 0","8) $
        $ P(X = 2) = 0","084 + 0","144 + 0","224 = 0","452 $

        Điền đáp số: `0.452`.
    ]
)

// TLN 3
#tln([Một hộp chứa $6$ quả cầu đỏ và $4$ quả cầu xanh. Lấy ngẫu nhiên đồng thời $3$ quả cầu. Gọi $X$ là số quả cầu đỏ lấy được. Xác suất để lấy được ít nhất $2$ quả cầu đỏ bằng bao nhiêu? (Viết kết quả dưới dạng phân số tối giản $a/b$, nhập vào ô đáp án giá trị của tổng $a + b$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2, -0.8), (2, 0.8), stroke: 1pt + accent, fill: rgb("f8fafc"))
    content((-1.2, 0.5), text(size: 7.5pt, weight: "bold", [6 Đỏ + 4 Xanh]))
    content((0, -0.3), text(size: 7.5pt, [Lấy $3$ quả: Cần $X >= 2$ (2 hoặc 3 đỏ)]))
  })
]
],
    [5],
    loigiai: [
        #step([Phương pháp giải])
        - Tổng số quả cầu: $10$ quả. Không gian mẫu: $n(Omega) = C_10^3 = 120$.
        - $X >= 2$ gồm hai trường hợp:
          + $X = 2$: $2$ đỏ và $1$ xanh.
          + $X = 3$: $3$ đỏ.

        #step([Lời giải chi tiết])
        - Số cách chọn $X = 2$: $C_6^2 dot C_4^1 = 15 dot 4 = 60$.
        - Số cách chọn $X = 3$: $C_6^3 = 20$.
        Tổng số kết quả thuận lợi:
        $ 60 + 20 = 80 $
        Xác suất tương ứng:
        $ P(X >= 2) = 80 / 120 = 2 / 3 $
        Phân số tối giản là $a/b = 2/3$, suy ra $a = 2, b = 3$.
        Tổng $a + b = 2 + 3 = 5$.

        Điền đáp số: `5`.
    ]
)

// TLN 4
#tln([Một biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất thỏa mãn:
$ P(X = k) = k / 15 quad "với" k in {1, 2, 3, 4, 5} $
Tính xác suất $P(2 <= X <= 4)$ (viết kết quả dưới dạng số thập phân).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (5.5, 0), stroke: 0.8pt + gray)
    for k in range(1, 6) {
      let h = k * 0.35
      rect((k - 0.25, 0), (k + 0.25, h), fill: if (k >= 2 and k <= 4) { accent.lighten(30%) } else { accent.lighten(80%) }, stroke: 0.8pt + accent)
      content((k, -0.3), text(size: 7.5pt, str(k)))
    }
    content((3, 2.0), text(size: 7.5pt, fill: accent, [Miền $2 <= X <= 4$]))
  })
]
],
    [0.6],
    loigiai: [
        #step([Phương pháp giải])
        Biến cố $2 <= X <= 4$ tương đương với $X in {2, 3, 4}$.
        $ P(2 <= X <= 4) = P(X = 2) + P(X = 3) + P(X = 4) $

        #step([Lời giải chi tiết])
        Thay công thức $P(X = k) = k / 15$:
        $ P(2 <= X <= 4) = 2/15 + 3/15 + 4/15 = (2 + 3 + 4) / 15 = 9 / 15 = 3 / 5 = 0","6 $

        Điền đáp số: `0.6`.
    ]
)

// TLN 5
#tln([Một trò chơi quay bánh xe trúng thưởng gồm $10$ ô có diện tích bằng nhau. Trên các ô có ghi số điểm như sau:
- $5$ ô ghi số $0$ điểm.
- $3$ ô ghi số $10$ điểm.
- $2$ ô ghi số $50$ điểm.
Một người chơi quay ngẫu nhiên $1$ lần. Gọi $X$ là số điểm mà người chơi nhận được. Tính xác suất để người chơi nhận được số điểm lớn hơn $0$ (viết kết quả dưới dạng số thập phân).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 1.2, stroke: 1pt + accent, fill: rgb("f8fafc"))
    for i in range(10) {
      let ang = i * 36deg
      line((0, 0), (1.2 * calc.cos(ang), 1.2 * calc.sin(ang)), stroke: 0.5pt + gray)
    }
    content((0, 0), text(size: 8pt, weight: "bold", fill: accent, [10 ô]))
  })
]
],
    [0.5],
    loigiai: [
        #step([Phương pháp giải])
        Người chơi nhận được số điểm lớn hơn $0$ tương ứng với biến cố $X > 0$, tức là quay vào ô $10$ điểm hoặc ô $50$ điểm.

        #step([Lời giải chi tiết])
        Tổng số ô có điểm $> 0$ là:
        $ 3 " (ô 10 điểm)" + 2 " (ô 50 điểm)" = 5 " ô" $
        Xác suất nhận số điểm lớn hơn $0$:
        $ P(X > 0) = 5 / 10 = 0","5 $

        Điền đáp số: `0.5`.
    ]
)

// TLN 6
#tln([Gieo đồng thời hai con xúc xắc cân đối và đồng chất. Gọi $X$ là tổng số chấm xuất hiện trên hai con xúc xắc. Tính xác suất để $X$ là một số nguyên tố (viết kết quả dưới dạng phân số tối giản $a/b$, điền vào ô đáp án giá trị của tử số $a$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2, -0.6), (2, 0.6), stroke: 0.8pt + accent, fill: rgb("eff6ff"))
    content((0, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Tổng $X in {2, 3, 4, ..., 12}$]))
    content((0, -0.2), text(size: 7.5pt, fill: rgb("ea580c"), [Các số nguyên tố: $\{2, 3, 5, 7, 11\}$]))
  })
]
],
    [5],
    loigiai: [
        #step([Phương pháp giải])
        - Tổng số chấm khi gieo $2$ con xúc xắc nằm trong tập $\{2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12\}$.
        - Các số nguyên tố trong tập này là: $\{2, 3, 5, 7, 11\}$.
        - Không gian mẫu có $6 dot 6 = 36$ phần tử.

        #step([Lời giải chi tiết])
        Đếm số cặp $(X_1, X_2)$ có tổng là số nguyên tố:
        - $X = 2$: $(1, 1)$ $==> 1$ cách.
        - $X = 3$: $(1, 2), (2, 1)$ $==> 2$ cách.
        - $X = 5$: $(1, 4), (2, 3), (3, 2), (4, 1)$ $==> 4$ cách.
        - $X = 7$: $(1, 6), (2, 5), (3, 4), (4, 3), (5, 2), (6, 1)$ $==> 6$ cách.
        - $X = 11$: $(5, 6), (6, 5)$ $==> 2$ cách.

        Tổng số kết quả thuận lợi:
        $ 1 + 2 + 4 + 6 + 2 = 15 $
        Xác suất tương ứng:
        $ P = 15 / 36 = 5 / 12 $
        Phân số tối giản là $a/b = 5/12$, suy ra tử số $a = 5$.

        Điền đáp số: `5`.
    ]
)
]

#make-questions()
