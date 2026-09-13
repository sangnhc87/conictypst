#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("065f46") // Emerald

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG",
  exam-title: "ĐỀ ÔN TẬP CHUYÊN ĐỀ 3B: KỲ VỌNG TOÁN HỌC E(X) & ỨNG DỤNG RA QUYẾT ĐỊNH THỰC TIỄN",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "522",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$0$], [$1$], [$2$], [$3$],
    [$P(X = x)$], [$0","1$], [$0","3$], [$0","4$], [$0","2$]
  )
]
Kỳ vọng toán học $E(X)$ của biến ngẫu nhiên $X$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô phỏng hình ảnh bập bênh trọng tâm cân bằng tại E(X) = 1,7
    line((-0.5, 0), (4.5, 0), stroke: 1.2pt + accent)
    // Điểm tựa tam giác tại 1.7
    line((1.7, 0), (1.5, -0.4), stroke: 1pt + accent)
    line((1.7, 0), (1.9, -0.4), stroke: 1pt + accent)
    line((1.4, -0.4), (2.0, -0.4), stroke: 1.2pt + accent)
    circle((1.7, 0), radius: 0.06, fill: rgb("ea580c"))
    content((1.7, -0.65), text(size: 8pt, fill: rgb("ea580c"), weight: "bold", [Điểm tựa: $E(X) = 1","7$]))
    
    // Các tải trọng
    let weights = ((0, 0.1, "0,1"), (1, 0.3, "0,3"), (2, 0.4, "0,4"), (3, 0.2, "0,2"))
    for (x, p, lbl) in weights {
      rect((x - 0.2, 0), (x + 0.2, p * 2.5), fill: accent.lighten(60%), stroke: 0.8pt + accent)
      content((x, p * 2.5 + 0.2), text(size: 7pt, lbl))
      content((x, 0.2), text(size: 7.5pt, weight: "bold", str(x)))
    }
  })
]
],
    (
        [$1","5$],
        True([$1","7$]),
        [$1","9$],
        [$2","0$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Kỳ vọng toán học của biến ngẫu nhiên rời rạc $X$ nhận các giá trị $x_1, x_2, ..., x_n$ với xác suất tương ứng $p_1, p_2, ..., p_n$ được tính theo công thức:
        $ E(X) = sum_(i=1)^n x_i p_i $
        Kỳ vọng phản ánh giá trị trung bình theo nghĩa xác suất của biến ngẫu nhiên khi số phép thử lặp lại rất lớn (trọng tâm của phân bố).

        #step([Lời giải chi tiết])
        Áp dụng công thức tính kỳ vọng:
        $ E(X) = 0 dot 0","1 + 1 dot 0","3 + 2 dot 0","4 + 3 dot 0","2 $
        $ E(X) = 0 + 0","3 + 0","8 + 0","6 = 1","7 $
    ]
)

// TN 2
#tn([Cho biến ngẫu nhiên rời rạc $X$ có kỳ vọng $E(X) = 2","5$. Xét biến ngẫu nhiên mới $Y = 4 X - 3$. Kỳ vọng toán học $E(Y)$ có giá trị bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai trục song song mô tả phép co giãn và tịnh tiến kỳ vọng
    line((-1, 1), (5, 1), mark: (end: "stealth"), stroke: 0.8pt + accent)
    content((-1.5, 1), text(size: 8pt, [$X$]))
    circle((2.5, 1), radius: 0.08, fill: accent)
    content((2.5, 1.35), text(size: 7.5pt, fill: accent, weight: "bold", [$E(X) = 2","5$]))
    
    line((-1, -0.5), (9, -0.5), mark: (end: "stealth"), stroke: 0.8pt + rgb("ea580c"))
    content((-1.5, -0.5), text(size: 8pt, [$Y$]))
    circle((7, -0.5), radius: 0.08, fill: rgb("ea580c"))
    content((7, -0.9), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold", [$E(Y) = 7","0$]))
    
    line((2.5, 0.9), (7, -0.4), stroke: (dash: "dashed", paint: gray), mark: (end: "stealth"))
    content((4.8, 0.4), text(size: 7.5pt, [Ánh xạ: $Y = 4X - 3$]))
  })
]
],
    (
        [$6","5$],
        True([$7","0$]),
        [$7","5$],
        [$10","0$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tính chất tuyến tính của kỳ vọng toán học: Với mọi hằng số thực $a, b$:
        $ E(a X + b) = a E(X) + b $

        #step([Lời giải chi tiết])
        Áp dụng tính chất tuyến tính với $a = 4$ và $b = -3$:
        $ E(Y) = E(4 X - 3) = 4 E(X) - 3 $
        Thay $E(X) = 2","5$ vào biểu thức:
        $ E(Y) = 4 dot 2","5 - 3 = 10 - 3 = 7 $
    ]
)

// TN 3
#tn([Một người tham gia một trò chơi may rủi bằng cách tung một đồng xu cân đối và đồng chất:
- Nếu xuất hiện mặt ngửa ($N$), người chơi nhận được $20$ nghìn đồng.
- Nếu xuất hiện mặt sấp ($S$), người chơi bị phạt mất $10$ nghìn đồng (nhận $-10$ nghìn đồng).
Gọi $X$ là số tiền nhận được của người chơi sau một lần tung (đơn vị: nghìn đồng). Số tiền kỳ vọng người chơi nhận được sau một lần chơi là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    circle((0, 1.2), radius: 0.35, fill: accent, stroke: none)
    content((0, 1.2), text(size: 7pt, fill: white, [Tung xu]))
    
    line((0, 0.85), (-1.8, 0), stroke: 0.8pt + accent, mark: (end: "stealth"))
    line((0, 0.85), (1.8, 0), stroke: 0.8pt + accent, mark: (end: "stealth"))
    
    rect((-2.8, -0.8), (-0.8, 0), fill: rgb("dcfce7"), stroke: 0.8pt + rgb("16a34a"))
    content((-1.8, -0.25), text(size: 7.5pt, weight: "bold", [Ngửa ($p = 0","5$)]))
    content((-1.8, -0.6), text(size: 7pt, fill: rgb("16a34a"), [$+20$ nghìn]))
    
    rect((0.8, -0.8), (2.8, 0), fill: rgb("fee2e2"), stroke: 0.8pt + rgb("ef4444"))
    content((1.8, -0.25), text(size: 7.5pt, weight: "bold", [Sấp ($p = 0","5$)]))
    content((1.8, -0.6), text(size: 7pt, fill: rgb("ef4444"), [$-10$ nghìn]))
  })
]
],
    (
        [$0$ nghìn đồng.],
        True([$5$ nghìn đồng.]),
        [$10$ nghìn đồng.],
        [$15$ nghìn đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Xác định tập giá trị của biến ngẫu nhiên $X$: $X in {20, -10}$ (nghìn đồng).
        - Đồng xu cân đối đồng chất nên xác suất mỗi mặt là $p = 0","5$.
        - Tính số tiền kỳ vọng: $E(X) = sum x_i p_i$.

        #step([Lời giải chi tiết])
        Bảng phân bố xác suất của $X$:
        - $P(X = 20) = 0","5$.
        - $P(X = -10) = 0","5$.

        Kỳ vọng số tiền nhận được:
        $ E(X) = 20 dot 0","5 + (-10) dot 0","5 = 10 - 5 = 5 " (nghìn đồng)" $
        Như vậy, tính trung bình mỗi ván chơi, người chơi kỳ vọng lãi $5$ nghìn đồng.
    ]
)

// TN 4
#tn([Một đợt phát hành vé số gồm $10000$ vé với giá bán $10$ nghìn đồng mỗi vé. Cơ cấu giải thưởng gồm:
- $1$ giải đặc biệt trị giá $30$ triệu đồng ($30000$ nghìn đồng).
- $5$ giải nhất, mỗi giải trị giá $2$ triệu đồng ($2000$ nghìn đồng).
- $20$ giải nhì, mỗi giải trị giá $200$ nghìn đồng.
Gọi $X$ là số tiền trúng thưởng của một tấm vé số được mua ngẫu nhiên (đơn vị: nghìn đồng). Số tiền trúng thưởng kỳ vọng của mỗi tấm vé số bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2.5, -0.8), (2.5, 0.8), stroke: 1pt + accent, fill: rgb("f8fafc"))
    content((-1.5, 0.4), text(size: 8pt, weight: "bold", fill: accent, [Vé số $10000$ vé]))
    content((-1.5, 0), text(size: 7pt, [Giá vé: $10$k]))
    
    rect((0.2, -0.6), (2.3, 0.6), fill: rgb("eff6ff"), stroke: 0.5pt + gray)
    content((1.25, 0.35), text(size: 7pt, [1 Giải ĐB: $30$ tr]))
    content((1.25, 0.05), text(size: 7pt, [5 Giải Nhất: $2$ tr]))
    content((1.25, -0.25), text(size: 7pt, [20 Giải Nhì: $200$k]))
  })
]
],
    (
        [$2","4$ nghìn đồng.],
        [$3","2$ nghìn đồng.],
        True([$4","4$ nghìn đồng.]),
        [$5","0$ nghìn đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tổng số tiền thưởng của toàn bộ $10000$ tấm vé phát hành là:
        $ "Tổng quỹ thưởng" = sum ("Số giải" dot "Giá trị mỗi giải") $
        Số tiền trúng thưởng kỳ vọng của mỗi tấm vé:
        $ E(X) = ("Tổng quỹ thưởng") / ("Tổng số vé") $

        #step([Lời giải chi tiết])
        Tổng số tiền chi thưởng (đơn vị: nghìn đồng):
        $ T = 1 dot 30000 + 5 dot 2000 + 20 dot 200 $
        $ T = 30000 + 10000 + 4000 = 44000 " (nghìn đồng)" $
        Kỳ vọng tiền thưởng của một tấm vé:
        $ E(X) = 44000 / 10000 = 4","4 " (nghìn đồng)" $
        (Lưu ý: Vì người mua phải trả $10$ nghìn đồng để mua vé nhưng giá trị kỳ vọng chỉ là $4","4$ nghìn đồng, nên lợi nhuận kỳ vọng của người chơi là $4","4 - 10 = -5","6$ nghìn đồng).
    ]
)

// TN 5
#tn([Trong lý thuyết trò chơi và toán bảo hiểm, một trò chơi may rủi được gọi là "công bằng" (Fair Game) nếu lợi nhuận ròng kỳ vọng của người chơi sau khi trừ đi chi phí mua vé tham gia bằng đúng $0$. Một trò chơi quay số có tiền thưởng kỳ vọng là $35$ nghìn đồng. Để trò chơi trở thành công bằng thì mức phí tham gia $C$ của người chơi phải bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu tượng cán cân thăng bằng
    line((-2, 0), (2, 0), stroke: 1.5pt + accent)
    line((0, 0), (0, -0.8), stroke: 1.2pt + accent)
    line((-0.4, -0.8), (0.4, -0.8), stroke: 1.5pt + accent)
    
    // Đĩa cân trái: Phí C
    circle((-1.8, 0.3), radius: 0.35, fill: rgb("fed7aa"), stroke: 0.8pt + rgb("ea580c"))
    content((-1.8, 0.3), text(size: 7.5pt, weight: "bold", [Phí $C$]))
    
    // Đĩa cân phải: E(Thưởng)
    circle((1.8, 0.3), radius: 0.35, fill: rgb("bbf7d0"), stroke: 0.8pt + rgb("16a34a"))
    content((1.8, 0.3), text(size: 7pt, weight: "bold", [$E(X) = 35$k]))
    
    content((0, 0.5), text(size: 7.5pt, fill: accent, [Cân bằng: $E("Lợi nhuận") = E(X) - C = 0$]))
  })
]
],
    (
        [$C = 0$ nghìn đồng.],
        [$C = 17","5$ nghìn đồng.],
        True([$C = 35$ nghìn đồng.]),
        [$C = 70$ nghìn đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X$ là số tiền trúng thưởng và $C$ là chi phí mua vé tham gia.
        Lợi nhuận ròng của người chơi là biến ngẫu nhiên $Y = X - C$.
        Trò chơi là công bằng khi và chỉ khi:
        $ E(Y) = 0 <==> E(X - C) = 0 <==> E(X) - C = 0 <==> C = E(X) $

        #step([Lời giải chi tiết])
        Theo giả thiết, tiền thưởng kỳ vọng là $E(X) = 35$ nghìn đồng.
        Do đó, mức phí tham gia công bằng là:
        $ C = E(X) = 35 " (nghìn đồng)" $
    ]
)

// TN 6
#tn([Gieo một con xúc xắc cân đối và đồng chất $6$ mặt. Gọi $X$ là số chấm xuất hiện ở mặt trên. Kỳ vọng toán học của biến ngẫu nhiên $X$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // 6 cột xúc xắc đều nhau cao 1/6
    line((-0.5, 0), (6.5, 0), stroke: 0.8pt + gray)
    for i in range(1, 7) {
      rect((i - 0.25, 0), (i + 0.25, 1.5), fill: accent.lighten(70%), stroke: 0.8pt + accent)
      content((i, -0.3), text(size: 8pt, str(i)))
      content((i, 1.7), text(size: 7pt, [$1/6$]))
    }
    circle((3.5, 0), radius: 0.08, fill: rgb("ef4444"))
    content((3.5, 0.75), text(size: 8pt, fill: rgb("ef4444"), weight: "bold", [Tâm đối xứng: $3","5$]))
  })
]
],
    (
        [$3","0$],
        True([$3","5$]),
        [$4","0$],
        [$3","6$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Biến ngẫu nhiên $X$ nhận các giá trị thuộc tập $\{1, 2, 3, 4, 5, 6\}$ với xác suất đồng đều $p_i = 1/6$.
        Kỳ vọng:
        $ E(X) = sum_(i=1)^6 i dot 1/6 $

        #step([Lời giải chi tiết])
        $ E(X) = 1/6 dot (1 + 2 + 3 + 4 + 5 + 6) = 1/6 dot 21 = 21 / 6 = 7 / 2 = 3","5 $
        (Do tính chất đối xứng hoàn hảo của phân bố đều rời rạc, kỳ vọng nằm chính giữa giá trị nhỏ nhất $1$ và giá trị lớn nhất $6$: $(1 + 6)/2 = 3","5$).
    ]
)

// TN 7
#tn([Một công ty bảo hiểm bán hợp đồng bảo hiểm tài sản thời hạn $1$ năm cho một chủ nhà với mức phí bảo hiểm là $2$ triệu đồng. Nếu trong năm xảy ra hỏa hoạn, công ty sẽ bồi thường toàn bộ thiệt hại cam kết là $400$ triệu đồng. Giả sử xác suất xảy ra hỏa hoạn đối với ngôi nhà trong năm đó là $0","002$. Lợi nhuận kỳ vọng của công ty bảo hiểm trên mỗi hợp đồng này là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2.5, -0.8), (2.5, 0.8), stroke: 1pt + accent, fill: rgb("f8fafc"))
    content((-1.3, 0.35), text(size: 7.5pt, weight: "bold", [Thu phí: $+2$ tr]))
    
    line((0.2, 0), (2.2, 0.4), stroke: 0.8pt + rgb("ef4444"), mark: (end: "stealth"))
    content((1.2, 0.6), text(size: 6.5pt, fill: rgb("ef4444"), [Cháy ($p = 0","002$): Chi $400$ tr]))
    
    line((0.2, 0), (2.2, -0.4), stroke: 0.8pt + rgb("16a34a"), mark: (end: "stealth"))
    content((1.2, -0.6), text(size: 6.5pt, fill: rgb("16a34a"), [An toàn ($p = 0","998$): Chi $0$ tr]))
  })
]
],
    (
        [$0","8$ triệu đồng.],
        True([$1","2$ triệu đồng.]),
        [$1","5$ triệu đồng.],
        [$2","0$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $Y$ là lợi nhuận của công ty bảo hiểm (đơn vị: triệu đồng).
        - Khi không xảy ra hỏa hoạn (xác suất $1 - 0","002 = 0","998$): Công ty nhận trọn vẹn phí $2$ triệu đồng ($Y = +2$).
        - Khi xảy ra hỏa hoạn (xác suất $0","002$): Công ty thu $2$ triệu và bồi thường $400$ triệu, do đó lỗ $Y = 2 - 400 = -398$ triệu đồng.
        Lợi nhuận kỳ vọng: $E(Y) = sum y_i p_i$.

        #step([Lời giải chi tiết])
        Cách 1: Tính theo phân bố lợi nhuận:
        $ E(Y) = 2 dot 0","998 + (-398) dot 0","002 $
        $ E(Y) = 1","996 - 0","796 = 1","2 " (triệu đồng)" $

        Cách 2: Tính theo doanh thu trừ chi phí bồi thường kỳ vọng:
        $ E("Bồi thường") = 400 dot 0","002 = 0","8 " (triệu đồng)" $
        $ E(Y) = "Phí thu" - E("Bồi thường") = 2 - 0","8 = 1","2 " (triệu đồng)" $
    ]
)

// TN 8
#tn([Một nhân viên kinh doanh bất động sản mỗi tháng tiếp cận được $4$ khách hàng tiềm năng độc lập. Xác suất để mỗi khách hàng đồng ý ký hợp đồng mua căn hộ là $0","25$. Với mỗi hợp đồng ký thành công, nhân viên được thưởng $30$ triệu đồng hoa hồng. Số tiền hoa hồng kỳ vọng mỗi tháng của nhân viên đó bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    for i in range(4) {
      rect((i * 1.5 - 2.2, -0.5), (i * 1.5 - 0.9, 0.5), stroke: 0.8pt + accent, fill: rgb("eff6ff"))
      content((i * 1.5 - 1.55, 0.1), text(size: 7.5pt, weight: "bold", [KH #(i + 1)]))
      content((i * 1.5 - 1.55, -0.25), text(size: 6.5pt, fill: rgb("16a34a"), [$p = 0","25$]))
    }
    content((0, -0.9), text(size: 7.5pt, fill: accent, [Mỗi HĐ chốt được: thưởng $30$ triệu]))
  })
]
],
    (
        [$20$ triệu đồng.],
        [$25$ triệu đồng.],
        True([$30$ triệu đồng.]),
        [$40$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X$ là số hợp đồng ký thành công trong tháng.
        Vì các khách hàng là độc lập và xác suất mỗi người mua là $p = 0","25$, nên $X$ tuân theo phân bố nhị thức $B(n, p)$ với $n = 4$ và $p = 0","25$.
        Kỳ vọng số hợp đồng bán được:
        $ E(X) = n p $
        Số tiền hoa hồng nhận được là $Y = 30 X$ (triệu đồng).
        Theo tính chất tuyến tính: $E(Y) = 30 dot E(X)$.

        #step([Lời giải chi tiết])
        Kỳ vọng số hợp đồng ký được:
        $ E(X) = 4 dot 0","25 = 1 " (hợp đồng)" $
        Kỳ vọng tiền hoa hồng hàng tháng:
        $ E(Y) = 30 dot 1 = 30 " (triệu đồng)" $
    ]
)

// TN 9
#tn([Cho biến ngẫu nhiên $X$ tuân theo phân bố nhị thức $B(20; 0","35)$. Kỳ vọng toán học $E(X)$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (6, 0), stroke: 0.8pt + gray)
    line((0, -0.2), (0, 2.2), stroke: 0.8pt + gray, mark: (end: "stealth"))
    // Vẽ phác họa chuông phân bố nhị thức đỉnh tại k = 7
    bezier((0.5, 0.1), (2.1, 1.8), (1.2, 0.3), (1.6, 1.2), stroke: 1.2pt + accent)
    bezier((2.1, 1.8), (4.5, 0.05), (2.8, 1.8), (3.6, 0.4), stroke: 1.2pt + accent)
    circle((2.1, 1.8), radius: 0.06, fill: rgb("ea580c"))
    line((2.1, 0), (2.1, 1.8), stroke: (dash: "dashed", paint: rgb("ea580c")))
    content((2.1, -0.3), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold", [$k = 7$]))
    content((3.8, 1.5), text(size: 7.5pt, fill: accent, [$E(X) = n p = 7$]))
  })
]
],
    (
        [$5","5$],
        [$6","0$],
        True([$7","0$]),
        [$7","5$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Kỳ vọng của biến ngẫu nhiên tuân theo phân bố nhị thức $B(n, p)$ được tính theo công thức:
        $ E(X) = n p $

        #step([Lời giải chi tiết])
        Với $n = 20$ và $p = 0","35$:
        $ E(X) = 20 dot 0","35 = 7 $
    ]
)

// TN 10
#tn([Một biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất chứa tham số $m$:
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$1$], [$2$], [$4$],
    [$P(X = x)$], [$0","2$], [$m$], [$0","5$]
  )
]
Biết bảng trên là bảng phân bố xác suất hợp lệ. Kỳ vọng toán học $E(X)$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (4.5, 0), stroke: 0.8pt + gray)
    let vals = ((1, 0.2 * 4, "0,2"), (2, 0.3 * 4, "m = 0,3"), (4, 0.5 * 4, "0,5"))
    for (x, h, lbl) in vals {
      rect((x - 0.25, 0), (x + 0.25, h), fill: accent.lighten(60%), stroke: 0.8pt + accent)
      content((x, h + 0.2), text(size: 7pt, lbl))
      content((x, -0.3), text(size: 7.5pt, str(x)))
    }
  })
]
],
    (
        [$2","4$],
        True([$2","8$]),
        [$3","0$],
        [$3","2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tìm tham số $m$ bằng điều kiện chuẩn hóa tổng xác suất bằng $1$:
        $ sum p_i = 1 $
        2. Sau khi tìm được $m$, áp dụng công thức tính kỳ vọng:
        $ E(X) = sum x_i p_i $

        #step([Lời giải chi tiết])
        Tổng xác suất:
        $ 0","2 + m + 0","5 = 1 ==> m = 1 - 0","7 = 0","3 $
        Tính kỳ vọng:
        $ E(X) = 1 dot 0","2 + 2 dot 0","3 + 4 dot 0","5 $
        $ E(X) = 0","2 + 0","6 + 2","0 = 2","8 $
    ]
)

// TN 11
#tn([Một doanh nghiệp đang xem xét đầu tư vào một dự án kinh doanh mới trong thời hạn $1$ năm. Đội ngũ phân tích tài chính dự báo ba kịch bản thị trường có thể xảy ra:
- Kịch bản Thuận lợi (xác suất $0","3$): Lợi nhuận đạt $600$ triệu đồng.
- Kịch bản Trung bình (xác suất $0","5$): Lợi nhuận đạt $200$ triệu đồng.
- Kịch bản Khó khăn (xác suất $0","2$): Doanh nghiệp bị thua lỗ $150$ triệu đồng (lợi nhuận $-150$ triệu đồng).
Lợi nhuận kỳ vọng của doanh nghiệp khi đầu tư vào dự án này bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.3, fill: accent, stroke: none)
    content((0, 0), text(size: 7pt, fill: white, [Dự án]))
    
    line((0.3, 0), (2.2, 0.8), stroke: 0.8pt + rgb("16a34a"), mark: (end: "stealth"))
    content((3.2, 0.8), text(size: 7pt, fill: rgb("16a34a"), [Tốt ($30\%$): $+600$ tr]))
    
    line((0.3, 0), (2.2, 0), stroke: 0.8pt + rgb("0284c7"), mark: (end: "stealth"))
    content((3.2, 0), text(size: 7pt, fill: rgb("0284c7"), [TB ($50\%$): $+200$ tr]))
    
    line((0.3, 0), (2.2, -0.8), stroke: 0.8pt + rgb("ef4444"), mark: (end: "stealth"))
    content((3.2, -0.8), text(size: 7pt, fill: rgb("ef4444"), [Xấu ($20\%$): $-150$ tr]))
  })
]
],
    (
        [$220$ triệu đồng.],
        True([$250$ triệu đồng.]),
        [$280$ triệu đồng.],
        [$300$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Lợi nhuận dự án là biến ngẫu nhiên rời rạc $X$ nhận các giá trị $\{600, 200, -150\}$ với xác suất tương ứng $\{0","3; 0","5; 0","2\}$.
        Lợi nhuận kỳ vọng: $E(X) = sum x_i p_i$.

        #step([Lời giải chi tiết])
        $ E(X) = 600 dot 0","3 + 200 dot 0","5 + (-150) dot 0","2 $
        $ E(X) = 180 + 100 - 30 = 250 " (triệu đồng)" $
    ]
)

// TN 12
#tn([Một máy móc có hai bộ phận $A$ và $B$ hoạt động độc lập với nhau. Trong một ca sản xuất, xác suất bị hỏng của bộ phận $A$ là $0","1$ và của bộ phận $B$ là $0","15$. Chi phí sửa chữa khi bộ phận $A$ bị hỏng là $400$ nghìn đồng, và khi bộ phận $B$ bị hỏng là $600$ nghìn đồng. Chi phí sửa chữa kỳ vọng của máy móc trong một ca sản xuất bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2.5, -0.7), (-0.3, 0.7), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
    content((-1.4, 0.2), text(size: 7.5pt, weight: "bold", [Bộ phận A]))
    content((-1.4, -0.2), text(size: 6.5pt, fill: rgb("ef4444"), [$p = 0","1$, phí $400$k]))
    
    rect((0.3, -0.7), (2.5, 0.7), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
    content((1.4, 0.2), text(size: 7.5pt, weight: "bold", [Bộ phận B]))
    content((1.4, -0.2), text(size: 6.5pt, fill: rgb("ef4444"), [$p = 0","15$, phí $600$k]))
    
    line((-0.3, 0), (0.3, 0), stroke: 1pt + gray)
  })
]
],
    (
        [$100$ nghìn đồng.],
        True([$130$ nghìn đồng.]),
        [$150$ nghìn đồng.],
        [$180$ nghìn đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X_A$ là chi phí sửa chữa bộ phận A, $X_B$ là chi phí sửa chữa bộ phận B.
        Tổng chi phí sửa chữa của máy móc:
        $ Y = X_A + X_B $
        Theo tính chất tuyến tính của kỳ vọng (đúng với mọi biến ngẫu nhiên, không phụ thuộc vào tính độc lập):
        $ E(Y) = E(X_A) + E(X_B) $

        #step([Lời giải chi tiết])
        - Chi phí sửa chữa kỳ vọng bộ phận A:
        $ E(X_A) = 400 dot 0","1 + 0 dot 0","9 = 40 " (nghìn đồng)" $
        - Chi phí sửa chữa kỳ vọng bộ phận B:
        $ E(X_B) = 600 dot 0","15 + 0 dot 0","85 = 90 " (nghìn đồng)" $
        Tổng chi phí sửa chữa kỳ vọng:
        $ E(Y) = 40 + 90 = 130 " (nghìn đồng)" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một cửa hàng kinh doanh đồ điện tử thống kê số lượng máy tính bảng bán được trong một ngày (ký hiệu là biến ngẫu nhiên $X$) trong suốt một năm qua và thu được bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: 6,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$0$], [$1$], [$2$], [$3$], [$4$],
    [$P(X = x)$], [$0","10$], [$0","25$], [$0","35$], [$0","20$], [$0","10$]
  )
]
Mỗi chiếc máy tính bảng bán ra đem lại lợi nhuận ròng là $1","5$ triệu đồng. Chi phí vận hành cố định mỗi ngày của cửa hàng là $2$ triệu đồng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (4.5, 0), stroke: 0.8pt + gray)
    let data = ((0, 0.1 * 4), (1, 0.25 * 4), (2, 0.35 * 4), (3, 0.2 * 4), (4, 0.1 * 4))
    for (x, h) in data {
      rect((x - 0.25, 0), (x + 0.25, h), fill: accent.lighten(60%), stroke: 0.8pt + accent)
      content((x, -0.3), text(size: 7.5pt, str(x)))
    }
    content((2, 1.8), text(size: 7.5pt, fill: accent, [Phân bố số máy bán được mỗi ngày]))
  })
]
],
    (
        True([Số lượng máy tính bảng bán được trung bình kỳ vọng mỗi ngày là $E(X) = 1","95$ máy.]),
        True([Xác suất để trong một ngày cửa hàng bán được từ $2$ máy tính bảng trở lên là $0","65$.]),
        True([Doanh thu lợi nhuận gộp từ bán máy kỳ vọng mỗi ngày là $2","925$ triệu đồng.]),
        [Lợi nhuận ròng bình quân kỳ vọng mỗi ngày của cửa hàng sau khi trừ chi phí vận hành nhỏ hơn $800$ nghìn đồng.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Số máy bán được kỳ vọng mỗi ngày:
        $ E(X) = 0 dot 0","10 + 1 dot 0","25 + 2 dot 0","35 + 3 dot 0","20 + 4 dot 0","10 $
        $ E(X) = 0 + 0","25 + 0","70 + 0","60 + 0","40 = 1","95 " (máy)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Xác suất bán từ $2$ máy trở lên ($X >= 2$):
        $ P(X >= 2) = P(X = 2) + P(X = 3) + P(X = 4) = 0","35 + 0","20 + 0","10 = 0","65 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Lợi nhuận gộp kỳ vọng từ bán máy:
        $ E("Lợi nhuận gộp") = 1","5 dot E(X) = 1","5 dot 1","95 = 2","925 " (triệu đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Lợi nhuận ròng của cửa hàng:
        $ Pi = 1","5 X - 2 " (triệu đồng)" $
        Kỳ vọng lợi nhuận ròng:
        $ E(Pi) = E("Lợi nhuận gộp") - 2 = 2","925 - 2 = 0","925 " (triệu đồng)" = 925 " nghìn đồng" $
        Vì $925 " nghìn" > 800 " nghìn"$, nên khẳng định "nhỏ hơn $800$ nghìn đồng" là SAI.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 2
#ds([Một công ty xây dựng nộp hồ sơ tham gia đấu thầu hai gói thầu dự án độc lập $A$ và $B$.
- Gói thầu $A$: Chi phí lập hồ sơ dự thầu là $50$ triệu đồng. Nếu trúng thầu (xác suất $0","4$), công ty thu về lợi nhuận gộp là $300$ triệu đồng.
- Gói thầu $B$: Chi phí lập hồ sơ dự thầu là $80$ triệu đồng. Nếu trúng thầu (xác suất $0","3$), công ty thu về lợi nhuận gộp là $500$ triệu đồng.
Nếu không trúng thầu, công ty bị mất toàn bộ chi phí lập hồ sơ.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2.5, -0.7), (-0.3, 0.7), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
    content((-1.4, 0.3), text(size: 7.5pt, weight: "bold", [Gói thầu A]))
    content((-1.4, 0), text(size: 6.5pt, [Chi phí: $50$ tr]))
    content((-1.4, -0.3), text(size: 6.5pt, fill: rgb("16a34a"), [Trúng: $40\%$, lãi $300$ tr]))
    
    rect((0.3, -0.7), (2.5, 0.7), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
    content((1.4, 0.3), text(size: 7.5pt, weight: "bold", [Gói thầu B]))
    content((1.4, 0), text(size: 6.5pt, [Chi phí: $80$ tr]))
    content((1.4, -0.3), text(size: 6.5pt, fill: rgb("16a34a"), [Trúng: $30\%$, lãi $500$ tr]))
  })
]
],
    (
        True([Lợi nhuận ròng kỳ vọng khi tham gia đấu thầu gói $A$ là $70$ triệu đồng.]),
        True([Lợi nhuận ròng kỳ vọng khi tham gia đấu thầu gói $B$ là $70$ triệu đồng.]),
        True([Kỳ vọng tổng lợi nhuận ròng của công ty khi tham gia cả hai gói thầu là $140$ triệu đồng.]),
        [Xác suất để công ty trúng thầu ít nhất một trong hai gói thầu là $0","70$.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Gọi $X_A$ là lợi nhuận ròng từ gói A (đơn vị: triệu đồng).
        - Nếu trúng thầu ($p = 0","4$): Lợi nhuận ròng là $300 - 50 = 250$ triệu.
        - Nếu trượt thầu ($p = 0","6$): Lỗ chi phí hồ sơ là $-50$ triệu.
        Kỳ vọng:
        $ E(X_A) = 250 dot 0","4 + (-50) dot 0","6 = 100 - 30 = 70 " (triệu đồng)" $
        (Hoặc tính: $E(X_A) = 300 dot 0","4 - 50 = 120 - 50 = 70$).
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Gọi $X_B$ là lợi nhuận ròng từ gói B:
        $ E(X_B) = 500 dot 0","3 - 80 = 150 - 80 = 70 " (triệu đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Kỳ vọng tổng lợi nhuận:
        $ E(X_A + X_B) = E(X_A) + E(X_B) = 70 + 70 = 140 " (triệu đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Vì hai gói thầu độc lập:
        Xác suất trượt cả hai gói là: $(1 - 0","4)(1 - 0","3) = 0","6 dot 0","7 = 0","42$.
        Xác suất trúng ít nhất một gói:
        $ P = 1 - 0","42 = 0","58 $
        Con số $0","70$ là lấy tổng hai xác suất mà quên trừ phần giao nhau.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#ds([Một phòng khám đa khoa trang bị hệ thống đặt lịch khám trực tuyến. Thống kê theo dõi thấy rằng có $20\%$ số bệnh nhân đã đặt hẹn nhưng không đến khám (tỷ lệ vắng mặt $p = 0","20$). Để tối ưu hóa công suất hoạt động, phòng khám nhận đặt lịch hẹn cho $10$ bệnh nhân trong một khung giờ buổi sáng. Gọi $X$ là số bệnh nhân thực tế đến khám đúng hẹn trong $10$ người đã đặt lịch.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2, -0.6), (2, 0.6), stroke: 1pt + accent, fill: rgb("eff6ff"))
    content((0, 0.15), text(size: 7.5pt, weight: "bold", fill: accent, [10 bệnh nhân đặt hẹn]))
    content((0, -0.2), text(size: 7pt, fill: rgb("ea580c"), [Xác suất đến: $p = 1 - 0","20 = 0","80$]))
  })
]
],
    (
        True([Biến ngẫu nhiên $X$ tuân theo phân bố nhị thức $B(10; 0","80)$.]),
        True([Kỳ vọng số bệnh nhân thực tế đến khám trong khung giờ đó là $E(X) = 8$ người.]),
        True([Xác suất để có đúng $8$ bệnh nhân đến khám là $C_10^8 dot (0","8)^8 dot (0","2)^2 approx 0","302$.]),
        [Nếu phòng khám chỉ có $8$ phòng khám phục vụ, thì xác suất xảy ra tình trạng quá tải (số người đến lớn hơn $8$) lớn hơn $40\%$.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Mỗi bệnh nhân đến khám hay không là độc lập với nhau, xác suất đến khám là $1 - 0","20 = 0","80$.
        Do đó $X sim B(10; 0","80)$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Kỳ vọng phân bố nhị thức:
        $ E(X) = n p = 10 dot 0","80 = 8 " (người)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        $ P(X = 8) = C_10^8 dot (0","8)^8 dot (0","2)^2 = 45 dot 0","167772 dot 0","04 approx 0","30199 approx 0","302 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Tình trạng quá tải xảy ra khi $X in {9, 10}$:
        $ P(X = 9) = C_10^9 dot (0","8)^9 dot 0","2 = 10 dot 0","134218 dot 0","2 = 0","2684 $
        $ P(X = 10) = (0","8)^(10) approx 0","1074 $
        Xác suất quá tải:
        $ P(X >= 9) = 0","2684 + 0","1074 = 0","3758 = 37","58\% $
        Vì $37","58\% < 40\%$, nên khẳng định "lớn hơn $40\%$" là SAI.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#ds([Cho hai biến ngẫu nhiên rời rạc $X$ và $Y$ độc lập với nhau. Biết bảng phân bố xác suất của $X$ và $Y$ lần lượt là:
#align(center)[
  #grid(
    columns: 2,
    gutter: 20pt,
    table(
      columns: 3, align: center, stroke: 0.5pt + accent,
      [$X$], [$1$], [$3$],
      [$P$], [$0","4$], [$0","6$]
    ),
    table(
      columns: 3, align: center, stroke: 0.5pt + accent,
      [$Y$], [$2$], [$5$],
      [$P$], [$0","7$], [$0","3$]
    )
  )
]
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2.5, -0.6), (-0.5, 0.6), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
    content((-1.5, 0.2), text(size: 7.5pt, weight: "bold", [Biến ngẫu nhiên $X$]))
    content((-1.5, -0.2), text(size: 7pt, [$E(X) = 2","2$]))
    
    rect((0.5, -0.6), (2.5, 0.6), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
    content((1.5, 0.2), text(size: 7.5pt, weight: "bold", [Biến ngẫu nhiên $Y$]))
    content((1.5, -0.2), text(size: 7pt, [$E(Y) = 2","9$]))
  })
]
],
    (
        True([Kỳ vọng của biến ngẫu nhiên $X$ là $E(X) = 2","2$.]),
        True([Kỳ vọng của biến ngẫu nhiên $Y$ là $E(Y) = 2","9$.]),
        True([Kỳ vọng của tổng $Z = X + Y$ bằng $E(Z) = 5","1$.]),
        [Kỳ vọng của tích $W = X dot Y$ bằng $6","16$.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        $ E(X) = 1 dot 0","4 + 3 dot 0","6 = 0","4 + 1","8 = 2","2 $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        $ E(Y) = 2 dot 0","7 + 5 dot 0","3 = 1","4 + 1","5 = 2","9 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Theo tính chất tuyến tính của kỳ vọng:
        $ E(X + Y) = E(X) + E(Y) = 2","2 + 2","9 = 5","1 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Vì $X$ và $Y$ là hai biến ngẫu nhiên độc lập:
        $ E(X dot Y) = E(X) dot E(Y) = 2","2 dot 2","9 = 6","38 $
        Đề bài đưa ra $6","16$ là sai.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Một biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: 6,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$-2$], [$-1$], [$0$], [$1$], [$2$],
    [$P(X = x)$], [$0","1$], [$0","2$], [$0","3$], [$0","3$], [$0","1$]
  )
]
Tính kỳ vọng toán học $E(X)$ (kết quả viết dưới dạng số thập phân).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-2.5, 0), (2.5, 0), stroke: 0.8pt + gray)
    let pts = ((-2, 0.1), (-1, 0.2), (0, 0.3), (1, 0.3), (2, 0.1))
    for (x, p) in pts {
      rect((x - 0.2, 0), (x + 0.2, p * 3), fill: accent.lighten(60%), stroke: 0.8pt + accent)
      content((x, -0.3), text(size: 7.5pt, str(x)))
    }
  })
]
],
    [0.1],
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng công thức tính kỳ vọng toán học:
        $ E(X) = sum_(i=1)^n x_i p_i $

        #step([Lời giải chi tiết])
        $ E(X) = (-2) dot 0","1 + (-1) dot 0","2 + 0 dot 0","3 + 1 dot 0","3 + 2 dot 0","1 $
        $ E(X) = -0","2 - 0","2 + 0 + 0","3 + 0","2 = 0","1 $

        Điền đáp số: `0.1`.
    ]
)

// TLN 2
#tln([Một hộp chứa $10$ tấm thẻ cùng kích thước được đánh số từ $1$ đến $10$. Rút ngẫu nhiên một tấm thẻ. Nếu rút được thẻ mang số chẵn thì người chơi nhận được số tiền bằng đúng số ghi trên thẻ (đơn vị: nghìn đồng). Nếu rút được thẻ mang số lẻ thì người chơi không nhận được tiền ($0$ nghìn đồng). Tính số tiền kỳ vọng người chơi nhận được sau một lần rút thẻ (đơn vị: nghìn đồng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2.5, -0.6), (2.5, 0.6), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
    content((0, 0.15), text(size: 7.5pt, weight: "bold", fill: accent, [10 thẻ: $1, 2, ..., 10$]))
    content((0, -0.2), text(size: 7pt, fill: rgb("16a34a"), [Thẻ chẵn: nhận tiền tương ứng $\{2, 4, 6, 8, 10\}$k]))
  })
]
],
    [3],
    loigiai: [
        #step([Phương pháp giải])
        - Mỗi tấm thẻ có xác suất rút trúng là $1/10 = 0","1$.
        - Có $5$ thẻ lẻ $\{1, 3, 5, 7, 9\}$ mang lại $0$ nghìn đồng.
        - Các thẻ chẵn mang lại tiền thưởng: thẻ $2$ ($2$k), thẻ $4$ ($4$k), thẻ $6$ ($6$k), thẻ $8$ ($8$k), thẻ $10$ ($10$k).

        #step([Lời giải chi tiết])
        Kỳ vọng số tiền nhận được:
        $ E(X) = 1/10 dot (2 + 4 + 6 + 8 + 10) = 30 / 10 = 3 " (nghìn đồng)" $

        Điền đáp số: `3`.
    ]
)

// TLN 3
#tln([Cho biến ngẫu nhiên $X$ có kỳ vọng $E(X) = 3","6$. Xét biến ngẫu nhiên $Y = 5 X - 8$. Tính kỳ vọng $E(Y)$ (kết quả viết dưới dạng số thập phân).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-2, 0), (2, 0), stroke: 1pt + accent)
    circle((0, 0), radius: 0.08, fill: accent)
    content((0, 0.35), text(size: 7.5pt, fill: accent, weight: "bold", [$E(5X - 8) = 5E(X) - 8$]))
  })
]
],
    [10],
    loigiai: [
        #step([Phương pháp giải])
        Sử dụng tính chất tuyến tính của kỳ vọng:
        $ E(a X + b) = a E(X) + b $

        #step([Lời giải chi tiết])
        $ E(Y) = 5 E(X) - 8 = 5 dot 3","6 - 8 = 18 - 8 = 10 $

        Điền đáp số: `10`.
    ]
)

// TLN 4
#tln([Một công ty khai khoáng tiến hành khảo sát $3$ mỏ quặng độc lập. Trữ lượng quặng ước tính nếu có của mỗi mỏ lần lượt là $100$ nghìn tấn, $150$ nghìn tấn và $200$ nghìn tấn. Xác suất tìm thấy quặng ở ba mỏ đó lần lượt là $0","3$; $0","4$ và $0","2$. Tính tổng trữ lượng quặng kỳ vọng mà công ty có thể khai thác được từ cả ba mỏ (đơn vị: nghìn tấn).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    for i in range(3) {
      let data = ((0, "Mỏ 1: 100k tấn", "p = 0,3"), (1, "Mỏ 2: 150k tấn", "p = 0,4"), (2, "Mỏ 3: 200k tấn", "p = 0,2"))
      let (idx, name, p) = data.at(i)
      rect((idx * 1.8 - 1.8, -0.5), (idx * 1.8 - 0.2, 0.5), stroke: 0.8pt + accent, fill: rgb("f8fafc"))
      content((idx * 1.8 - 1.0, 0.15), text(size: 6.5pt, weight: "bold", name))
      content((idx * 1.8 - 1.0, -0.25), text(size: 6.5pt, fill: rgb("ea580c"), p))
    }
  })
]
],
    [130],
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X_1, X_2, X_3$ là trữ lượng quặng khai thác được từ ba mỏ.
        Tổng trữ lượng quặng kỳ vọng là:
        $ E(X_1 + X_2 + X_3) = E(X_1) + E(X_2) + E(X_3) $

        #step([Lời giải chi tiết])
        - $E(X_1) = 100 dot 0","3 = 30$ (nghìn tấn).
        - $E(X_2) = 150 dot 0","4 = 60$ (nghìn tấn).
        - $E(X_3) = 200 dot 0","2 = 40$ (nghìn tấn).
        Tổng trữ lượng kỳ vọng:
        $ 30 + 60 + 40 = 130 " (nghìn tấn)" $

        Điền đáp số: `130`.
    ]
)

// TLN 5
#tln([Ban tổ chức một hội chợ triển lãm thiết kế trò chơi ném phi tiêu trúng thưởng. Cơ cấu giải thưởng cho mỗi lượt chơi gồm:
- $1$ giải Nhất trị giá $100$ nghìn đồng với xác suất trúng là $0","05$.
- $1$ giải Nhì trị giá $40$ nghìn đồng với xác suất trúng là $0","10$.
- $1$ giải Ba trị giá $20$ nghìn đồng với xác suất trúng là $0","20$.
- Còn lại là không trúng thưởng ($0$ đồng).
Để trò chơi là một trò chơi công bằng (Fair Game), Ban tổ chức cần ấn định giá vé tham gia mỗi lượt ném là bao nhiêu nghìn đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 1, stroke: 1pt + accent, fill: rgb("f8fafc"))
    circle((0, 0), radius: 0.7, stroke: 0.8pt + accent, fill: rgb("e2e8f0"))
    circle((0, 0), radius: 0.35, stroke: 0.8pt + accent, fill: rgb("cbd5e1"))
    circle((0, 0), radius: 0.1, fill: rgb("ef4444"))
    content((0, -1.3), text(size: 7.5pt, fill: accent, [Giá vé công bằng = Tiền thưởng kỳ vọng]))
  })
]
],
    [13],
    loigiai: [
        #step([Phương pháp giải])
        Giá vé tham gia công bằng bằng đúng giá trị tiền thưởng kỳ vọng của mỗi lượt chơi:
        $ C = E(X) = sum x_i p_i $

        #step([Lời giải chi tiết])
        Tính tiền thưởng kỳ vọng:
        $ E(X) = 100 dot 0","05 + 40 dot 0","10 + 20 dot 0","20 + 0 dot 0","65 $
        $ E(X) = 5 + 4 + 4 + 0 = 13 " (nghìn đồng)" $
        Do đó mức giá vé công bằng là $13$ nghìn đồng.

        Điền đáp số: `13`.
    ]
)

// TLN 6
#tln([Một kiện hàng gồm $20$ sản phẩm máy tính xách tay, trong đó có $4$ sản phẩm có lỗi nhẹ ở vỏ ngoài. Nhân viên kiểm tra chất lượng chọn ngẫu nhiên đồng thời $5$ sản phẩm từ kiện hàng đó. Gọi $X$ là số sản phẩm bị lỗi vỏ tìm thấy trong mẫu kiểm tra. Tính kỳ vọng toán học $E(X)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((-2, -0.6), (2, 0.6), stroke: 1pt + accent, fill: rgb("f8fafc"))
    content((0, 0.15), text(size: 7.5pt, weight: "bold", fill: accent, [Kiện hàng $20$ SP (4 lỗi)]))
    content((0, -0.2), text(size: 7pt, fill: rgb("ea580c"), [Lấy mẫu ngẫu nhiên $n = 5$ SP]))
  })
]
],
    [1],
    loigiai: [
        #step([Phương pháp giải])
        Trong phép chọn ngẫu nhiên không hoàn lại $n$ phần tử từ tập $N$ phần tử có chứa $M$ phần tử đặc biệt (phân bố siêu bội), kỳ vọng số phần tử đặc biệt trong mẫu bằng:
        $ E(X) = n dot M / N $
        (Nghĩa là kỳ vọng bằng tích của kích thước mẫu với tỷ lệ phần tử đặc biệt trong tổng thể).

        #step([Lời giải chi tiết])
        Tỷ lệ sản phẩm lỗi trong kiện hàng:
        $ p = M / N = 4 / 20 = 1 / 5 = 0","2 $
        Số sản phẩm chọn ra: $n = 5$.
        Kỳ vọng số sản phẩm lỗi tìm thấy:
        $ E(X) = n dot p = 5 dot 0","2 = 1 $

        Điền đáp số: `1`.
    ]
)
]

#make-questions()
