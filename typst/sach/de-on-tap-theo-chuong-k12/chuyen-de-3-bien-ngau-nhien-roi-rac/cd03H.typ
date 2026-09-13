#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("c2410c") // Bronze Orange

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG",
  exam-title: "ĐỀ ÔN TẬP CHUYÊN ĐỀ 3H: MÔ HÌNH HÀNG ĐỢI RỜI RẠC, TIẾP NHẬN DỊCH VỤ & KIỂM SOÁT CHẤT LƯỢNG",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "528",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Số lượng khách hàng đến một quầy giao dịch bưu điện trong khoảng thời gian $15$ phút là biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Số khách $X$], [$0$], [$1$], [$2$], [$3$],
    [Xác suất], [$0","15$], [$0","40$], [$0","30$], [$0","15$]
  )
]
Xác suất để trong $15$ phút có ít nhất $2$ khách hàng đến quầy giao dịch bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu đồ cột xác suất
    let probs = (0.15, 0.40, 0.30, 0.15)
    for i in range(4) {
      let x = -1.8 + i * 1.2
      let h = probs.at(i) * 3.5
      let f_c = if i >= 2 { accent } else { accent.lighten(75%) }
      rect((x - 0.35, -0.6), (x + 0.35, -0.6 + h), fill: f_c, stroke: 0.8pt + accent)
      content((x, -0.85), text(size: 8pt, weight: "bold", [#str(i)]))
      content((x, -0.6 + h + 0.2), text(size: 7.5pt, fill: accent, [#str(probs.at(i))]))
    }
    content((0.6, 1.2), text(size: 7.5pt, weight: "bold", fill: accent, [P(X >= 2) = 0,30 + 0,15 = 0,45]))
  })
]
],
    (
        [$0","30$],
        [$0","55$],
        True([$0","45$]),
        [$0","85$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Biến cố "Có ít nhất 2 khách hàng" tương ứng với $X >= 2$, tức là $X = 2$ hoặc $X = 3$.
        Xác suất cần tính:
        $ P(X >= 2) = P(X = 2) + P(X = 3) $

        #step([Lời giải chi tiết])
        Tra bảng phân bố xác suất:
        $ P(X >= 2) = 0","30 + 0","15 = 0","45 $
    ]
)

// TN 2
#tn([Một tổng đài cứu hộ giao thông ghi nhận số cuộc gọi khẩn cấp trong ca trực đêm là biến ngẫu nhiên $X$ có bảng phân bố xác suất:
#align(center)[
  #table(
    columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Số cuộc gọi $X$], [$1$], [$2$], [$3$], [$4$],
    [Xác suất], [$0","2$], [$0","4$], [$0","3$], [$0","1$]
  )
]
Kỳ vọng số cuộc gọi khẩn cấp trong ca trực đêm bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình kỳ vọng cuộc gọi
    rect((-2.8, -0.5), (2.8, 0.5), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [E(X) = 1(0,2) + 2(0,4) + 3(0,3) + 4(0,1) = 2,3]))
  })
]
],
    (
        [$2","0$],
        [$2","5$],
        True([$2","3$]),
        [$2","8$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Kỳ vọng của biến ngẫu nhiên rời rạc $X$:
        $ E(X) = sum x_i p_i $

        #step([Lời giải chi tiết])
        Thay số:
        $ E(X) = 1 dot 0","2 + 2 dot 0","4 + 3 dot 0","3 + 4 dot 0","1 = 0","2 + 0","8 + 0","9 + 0","4 = 2","3 " (cuộc gọi)" $
    ]
)

// TN 3
#tn([Trên một bản mạch in điện tử (PCB), robot tự động hàn $n = 200$ mối hàn độc lập. Xác suất để một mối hàn bị khuyết tật (lỗi hàn lạnh hoặc cầu chì) là $p = 0","01$. Số mối hàn bị lỗi trên bản mạch $X$ tuân theo phân bố nhị thức $X ~ B(200; 0","01)$. Độ lệch chuẩn của số mối hàn bị lỗi bằng (làm tròn đến hàng phần trăm):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình bản mạch PCB
    rect((-3.0, -0.7), (3.0, 0.7), stroke: 1.2pt + accent, fill: accent.lighten(92%), radius: 0.1)
    content((-1.5, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Bản mạch PCB: 200 mối hàn]))
    content((-1.5, -0.25), text(size: 7.5pt, [Tỷ lệ lỗi p = 0,01]))
    line((0.2, -0.5), (0.2, 0.5), stroke: 0.8pt + gray)
    content((1.6, 0.2), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [V(X) = 200 . 0,01 . 0,99 = 1,98]))
    content((1.6, -0.25), text(size: 8pt, weight: "bold", fill: rgb("b91c1c"), [σ(X) = sqrt(1,98) ≈ 1,41]))
  })
]
],
    (
        [$1","98$],
        True([$1","41$]),
        [$2","00$],
        [$0","14$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Biến ngẫu nhiên $X ~ B(n, p)$ có:
        - Phương sai: $V(X) = n p (1 - p)$
        - Độ lệch chuẩn: $sigma(X) = sqrt(V(X))$

        #step([Lời giải chi tiết])
        Phương sai:
        $ V(X) = 200 dot 0","01 dot (1 - 0","01) = 2 dot 0","99 = 1","98 $
        Độ lệch chuẩn:
        $ sigma(X) = sqrt(1","98) approx 1","4071 approx 1","41 $
    ]
)

// TN 4
#tn([Một hộp linh kiện gồm $N = 30$ chiếc, trong đó có $M = 6$ linh kiện bị lỗi kỹ thuật. Người ta lấy ngẫu nhiên không hoàn lại $n = 4$ linh kiện để kiểm tra. Xác suất để trong $4$ linh kiện lấy ra không có linh kiện nào bị lỗi bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình lấy mẫu siêu bội không hoàn lại
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Lô hàng N = 30; có M = 6 lỗi; lấy n = 4]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [P(X = 0) = C(24, 4) / C(30, 4) = 10626 / 27405 ≈ 0,3877]))
  })
]
],
    (
        [$0","410$],
        [$0","520$],
        True([$0","388$]),
        [$0","325$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Phân bố siêu bội khi lấy không hoàn lại:
        Trong hộp có $24$ linh kiện tốt và $6$ linh kiện lỗi.
        Số phần tử của không gian mẫu là $C_30^4$.
        Số kết quả thuận lợi để lấy được $0$ linh kiện lỗi (cả $4$ đều tốt) là $C_24^4 dot C_6^0$.
        $ P(X = 0) = frac(C_24^4, C_30^4) $

        #step([Lời giải chi tiết])
        Tính toán các tổ hợp:
        $ C_24^4 = frac(24 dot 23 dot 22 dot 21, 24) = 10626 $
        $ C_30^4 = frac(30 dot 29 dot 28 dot 27, 24) = 27405 $
        Xác suất:
        $ P(X = 0) = frac(10626, 27405) approx 0","38774 approx 0","388 $
    ]
)

// TN 5
#tn([Khi kiểm định chất lượng lô sản phẩm có quy mô $N$ rất lớn và lấy ngẫu nhiên không hoàn lại một mẫu kích thước $n$, người ta có thể xấp xỉ phân bố siêu bội bằng phân bố nhị thức $B(n, p)$ (với $p = frac(M, N)$ là tỷ lệ phế phẩm) nếu thỏa mãn điều kiện quy chuẩn nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Khung điều kiện xấp xỉ nhị thức
    rect((-3.2, -0.7), (3.2, 0.7), stroke: 1.2pt + accent, fill: accent.lighten(94%), radius: 0.12)
    content((0, 0.25), text(size: 9pt, weight: "bold", fill: accent, [Quy tắc thực nghiệm xấp xỉ nhị thức]))
    content((0, -0.25), text(size: 9.5pt, weight: "bold", fill: rgb("15803d"), [Cỡ mẫu n không vượt quá 10% quy mô lô: n / N <= 0,10]))
  })
]
],
    (
        [$frac(n, N) >= 0","5$],
        [$frac(n, N) <= 0","01$ và $n >= 1000$],
        True([$frac(n, N) <= 0","10$ (cỡ mẫu không quá $10%$ quy mô lô)]),
        [Quy mô lô phải vô hạn và tỷ lệ lỗi $p > 0","5$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo lý thuyết thống kê và Chuyên đề Toán 12:
        Khi lấy mẫu không hoàn lại từ một tổng thể hữu hạn kích thước $N$:
        - Nếu cỡ mẫu $n$ nhỏ so với quy mô tổng thể $N$ (thường là $frac(n, N) <= 0","10$, hay không quá $10%$), việc lấy một sản phẩm ra hầu như không làm thay đổi đáng kể tỷ lệ phế phẩm của các sản phẩm còn lại.
        - Khi đó các phép thử có thể coi là xấp xỉ độc lập và phân bố siêu bội được xấp xỉ tốt bởi phân bố nhị thức $B(n, p)$.

        #step([Lời giải chi tiết])
        Điều kiện quy chuẩn là $frac(n, N) <= 0","10$.
    ]
)

// TN 6
#tn([Một quầy phục vụ khách hàng tại một chi nhánh ngân hàng có thể phục vụ tối đa $K = 4$ khách hàng trong mỗi khung giờ $30$ phút. Số lượng khách hàng đến quầy trong khung giờ đó là biến ngẫu nhiên $X$ có bảng phân bố xác suất:
#align(center)[
  #table(
    columns: (1.2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Số khách $X$], [$1$], [$2$], [$3$], [$4$], [$5$], [$6$],
    [Xác suất], [$0","10$], [$0","25$], [$0","30$], [$0","20$], [$0","10$], [$0","05$]
  )
]
Hiện tượng quá tải xảy ra khi số khách hàng đến vượt quá năng lực phục vụ tối đa của quầy ($X > 4$). Xác suất xảy ra quá tải bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình quá tải quầy phục vụ
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Năng lực: K = 4 khách]))
    content((-1.5, -0.25), text(size: 7.5pt, [P(X <= 4) = 0,85]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("b91c1c"), [Quá tải: X > 4]))
    content((1.6, -0.25), text(size: 8pt, fill: rgb("b91c1c"), [P(X > 4) = 0,10 + 0,05 = 0,15]))
  })
]
],
    (
        [$0","35$],
        [$0","20$],
        True([$0","15$]),
        [$0","05$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Biến cố quầy bị quá tải là $X > 4$, tức là $X = 5$ hoặc $X = 6$.
        $ P(X > 4) = P(X = 5) + P(X = 6) $

        #step([Lời giải chi tiết])
        Tra bảng xác suất:
        $ P(X > 4) = 0","10 + 0","05 = 0","15 $
        Vậy xác suất xảy ra hiện tượng quá tải bằng $0","15$ (tức $15%$).
    ]
)

// TN 7
#tn([Số lỗi in ấn trên mỗi trang của một bản thảo sách giáo khoa là biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất:
#align(center)[
  #table(
    columns: (1.2fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Số lỗi $X$], [$0$], [$1$], [$2$],
    [Xác suất], [$0","7$], [$0","2$], [$0","1$]
  )
]
Phương sai $V(X)$ của số lỗi in ấn trên một trang sách bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Tính phương sai số lỗi
    rect((-2.8, -0.5), (2.8, 0.5), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [E(X) = 0,4; E(X^2) = 0,6 ==> V(X) = 0,6 - 0,16 = 0,44]))
  })
]
],
    (
        [$0","16$],
        [$0","40$],
        True([$0","44$]),
        [$0","60$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Phương sai: $V(X) = E(X^2) - [E(X)]^2$.
        1. Tính $E(X) = sum x_i p_i$.
        2. Tính $E(X^2) = sum x_i^2 p_i$.

        #step([Lời giải chi tiết])
        Ta có:
        $ E(X) = 0 dot 0","7 + 1 dot 0","2 + 2 dot 0","1 = 0","4 $
        $ E(X^2) = 0^2 dot 0","7 + 1^2 dot 0","2 + 2^2 dot 0","1 = 0","2 + 0","4 = 0","6 $
        Phương sai:
        $ V(X) = 0","6 - (0","4)^2 = 0","6 - 0","16 = 0","44 $
    ]
)

// TN 8
#tn([Một trạm thu phí cao tốc có $3$ làn thu phí tự động ETC hoạt động độc lập. Xác suất để mỗi làn gặp trục trặc kỹ thuật đọc thẻ trong một giờ cao điểm đều bằng $p = 0","05$. Xác suất để trong giờ cao điểm có đúng $1$ làn gặp trục trặc kỹ thuật bằng (làm tròn đến hàng phần nghìn):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // 3 làn thu phí ETC
    for i in range(3) {
      let x = -1.8 + i * 1.8
      rect((x - 0.6, -0.5), (x + 0.6, 0.5), stroke: 1pt + accent, fill: accent.lighten(90%), radius: 0.08)
      content((x, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Làn #(i+1)]))
      content((x, -0.25), text(size: 7.5pt, [p = 0,05]))
    }
  })
]
],
    (
        [$0","143$],
        True([$0","135$]),
        [$0","045$],
        [$0","285$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X$ là số làn ETC gặp trục trặc.
        Vì 3 làn hoạt động độc lập với cùng xác suất lỗi $p = 0","05$, ta có $X ~ B(3; 0","05)$.
        Công thức xác suất nhị thức:
        $ P(X = 1) = C_3^1 p^1 (1 - p)^(3 - 1) $

        #step([Lời giải chi tiết])
        Tính toán:
        $ P(X = 1) = 3 dot 0","05 dot (0","95)^2 = 0","15 dot 0","9025 = 0","135375 approx 0","135 $
    ]
)

// TN 9
#tn([Theo quy trình kiểm tra chấp nhận lô hàng (AQL), một công ty xuất khẩu kiểm tra ngẫu nhiên một mẫu $n = 50$ sản phẩm từ một lô hàng rất lớn. Lô hàng được chấp nhận thông quan nếu trong mẫu có không quá $1$ sản phẩm lỗi ($X <= 1$). Giả sử tỷ lệ sản phẩm lỗi thực tế của lô hàng là $p = 0","02$. Xác suất để lô hàng được chấp nhận thông quan bằng (làm tròn đến hàng phần trăm):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình AQL
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Mẫu n = 50, p = 0,02]))
    content((-1.5, -0.25), text(size: 7.5pt, [Tiêu chuẩn: X <= 1]))
    line((0.1, -0.4), (0.1, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [P(X <= 1) = P(0) + P(1)]))
    content((1.6, -0.25), text(size: 7.5pt, fill: rgb("15803d"), [≈ 0,364 + 0,372 = 0,74]))
  })
]
],
    (
        [$0","50$],
        [$0","65$],
        True([$0","74$]),
        [$0","88$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số sản phẩm lỗi $X ~ B(50; 0","02)$.
        Xác suất chấp nhận lô hàng:
        $ P(X <= 1) = P(X = 0) + P(X = 1) $
        - $P(X = 0) = (1 - 0","02)^50 = (0","98)^50$
        - $P(X = 1) = C_50^1 (0","02)^1 (0","98)^49 = 50 dot 0","02 dot (0","98)^49 = (0","98)^49$

        #step([Lời giải chi tiết])
        Tính toán:
        $ (0","98)^50 approx 0","36417 $
        $ (0","98)^49 approx 0","37160 $
        Tổng xác suất:
        $ P(X <= 1) = 0","36417 + 0","37160 = 0","73577 approx 0","74 $
    ]
)

// TN 10
#tn([Một trung tâm dịch vụ khách hàng ước tính chi phí mở thêm một quầy hỗ trợ trực tiếp là $500$ nghìn đồng/ngày. Nếu không mở thêm quầy, mỗi khách hàng phải chờ đợi gây thiệt hại uy tín ước tính là $100$ nghìn đồng/người. Gọi $Y$ là số khách hàng phải chờ đợi trong ngày nếu mở thêm quầy. Biến ngẫu nhiên $Y$ có kỳ vọng $E(Y) = 2$ khách. Nếu không mở thêm quầy, số khách phải chờ là $Z$ có kỳ vọng $E(Z) = 8$ khách. Doanh nghiệp nên quyết định như thế nào để tối thiểu hóa chi phí thiệt hại kỳ vọng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // So sánh chi phí mở thêm quầy vs không mở
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Phương án mở quầy]))
    content((-1.5, -0.25), text(size: 7.5pt, [Chi phí: 500 + 100(2) = 700]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("b45309"), [Phương án không mở]))
    content((1.6, -0.25), text(size: 7.5pt, [Chi phí: 100(8) = 800]))
  })
]
],
    (
        [Không mở thêm quầy vì tiết kiệm được $500$ nghìn đồng chi phí cố định],
        True([Mở thêm quầy vì tổng chi phí kỳ vọng là $700$ nghìn đồng, thấp hơn phương án không mở ($800$ nghìn đồng)]),
        [Hai phương án có chi phí kỳ vọng hoàn toàn bằng nhau],
        [Chỉ mở quầy vào ngày cuối tuần]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tính tổng chi phí kỳ vọng của từng phương án:
        - Phương án 1 (Mở thêm quầy): $C_1 = 500 + 100 dot E(Y)$
        - Phương án 2 (Không mở quầy): $C_2 = 100 dot E(Z)$

        #step([Lời giải chi tiết])
        Ta có:
        $ C_1 = 500 + 100 dot 2 = 700 " (nghìn đồng)" $
        $ C_2 = 100 dot 8 = 800 " (nghìn đồng)" $
        Vì $C_1 = 700 < C_2 = 800$, nên doanh nghiệp nên mở thêm quầy để tiết kiệm $100$ nghìn đồng chi phí kỳ vọng mỗi ngày.
    ]
)

// TN 11
#tn([Trong một kênh truyền thông tin quang học, một chuỗi gồm $n = 1000$ gói dữ liệu được gửi đi độc lập. Xác suất để mỗi gói dữ liệu bị lỗi do nhiễu đường truyền là $p = 0","003$. Kỳ vọng số gói dữ liệu được truyền đi thành công (không bị lỗi) bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình kênh truyền dữ liệu
    rect((-2.8, -0.5), (2.8, 0.5), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [E(Thành công) = n (1 - p) = 1000(1 - 0,003) = 997 gói]))
  })
]
],
    (
        [$3$ gói],
        [$970$ gói],
        [$990$ gói],
        True([$997$ gói])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Gọi $X$ là số gói tin bị lỗi: $X ~ B(1000; 0","003)$.
        2. Số gói tin truyền thành công là $Y = 1000 - X$.
        3. Kỳ vọng số gói truyền thành công: $E(Y) = 1000 - E(X)$.

        #step([Lời giải chi tiết])
        Ta có $E(X) = n p = 1000 dot 0","003 = 3$ gói.
        Kỳ vọng số gói truyền thành công là:
        $ E(Y) = 1000 - 3 = 997 " (gói)" $
    ]
)

// TN 12
#tn([Để kiểm soát an toàn chất lượng cho một bồn khí nén công nghiệp, người ta lắp đặt $3$ cảm biến áp suất độc lập. Khi áp suất vượt ngưỡng an toàn, xác suất để mỗi cảm biến phát hiện và kích hoạt chuông báo động là $p = 0","9$. Hệ thống sẽ phát tín hiệu báo động nếu có ít nhất $1$ trong $3$ cảm biến kích hoạt. Xác suất để hệ thống phát tín hiệu báo động khi xảy ra sự cố vượt áp suất bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // 3 cảm biến áp suất mắc song song
    for i in range(3) {
      let y = 0.5 - i * 0.5
      rect((-1.2, y - 0.18), (1.2, y + 0.18), stroke: 1pt + accent, fill: accent.lighten(90%), radius: 0.05)
      content((0, y), text(size: 7.5pt, weight: "bold", [Cảm biến #(i+1): p = 0,9]))
    }
    content((0, -1.0), text(size: 7.5pt, weight: "bold", fill: rgb("15803d"), [Báo động khi ít nhất 1 cảm biến hoạt động: P = 1 - (0,1)^3 = 0,999]))
  })
]
],
    (
        [$0","729$],
        [$0","900$],
        [$0","970$],
        True([$0","999$])
    ),
    loigiai: [
        #step([Phương pháp giải])
        Sử dụng biến cố đối:
        Biến cố "Hệ thống không phát tín hiệu báo động" xảy ra khi cả 3 cảm biến đều không kích hoạt.
        Vì các cảm biến hoạt động độc lập:
        $ P("Không báo động") = (1 - p)^3 $
        Xác suất hệ thống báo động:
        $ P("Báo động") = 1 - (1 - p)^3 $

        #step([Lời giải chi tiết])
        Với $p = 0","9$, xác suất một cảm biến không kích hoạt là $1 - 0","9 = 0","1$.
        $ P("Báo động") = 1 - (0","1)^3 = 1 - 0","001 = 0","999 $
        (Hệ thống mắc song song 3 cảm biến giúp nâng độ tin cậy an toàn từ $90%$ lên $99","9%$).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Số bệnh nhân đến khám bệnh tại một phòng khám chuyên khoa tim mạch trong khung giờ cao điểm từ 8h đến 9h sáng là biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: (1.2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Số bệnh nhân $X$], [$0$], [$1$], [$2$], [$3$], [$4$],
    [Xác suất], [$0","05$], [$0","15$], [$0","40$], [$m$], [$0","10$]
  )
]
Bác sĩ trưởng phòng khám quy định phòng khám chỉ có năng lực phục vụ tối đa $3$ bệnh nhân trong khung giờ này.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Phân bố bệnh nhân và năng lực tối đa
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Tổng xác suất = 1]))
    content((-1.5, -0.25), text(size: 7.5pt, [==> m = 0,30]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [E(X) = 2,25]))
    content((1.6, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [Quá tải khi X = 4: p = 0,10]))
  })
]
],
    (
        True([Tham số xác suất chưa biết có giá trị là $m = 0","30$.]),
        True([Kỳ vọng số bệnh nhân đến khám trong khung giờ này là $E(X) = 2","25$ người.]),
        True([Phương sai của số bệnh nhân đến khám là $V(X) = 0","9875$.]),
        False([Xác suất để phòng khám tiếp nhận số bệnh nhân vượt quá năng lực phục vụ là $0","40$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính chất tổng xác suất: $sum p_i = 1$ để tìm $m$.
        2. Kỳ vọng: $E(X) = sum x_i p_i$.
        3. Phương sai: $V(X) = E(X^2) - [E(X)]^2$.
        4. Xác suất quá tải là xác suất số bệnh nhân vượt quá 3: $P(X > 3) = P(X = 4)$.

        #step([Phân tích ý a])
        $ 0","05 + 0","15 + 0","40 + m + 0","10 = 1 ==> 0","70 + m = 1 ==> m = 0","30 $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Kỳ vọng:
        $ E(X) = 0 dot 0","05 + 1 dot 0","15 + 2 dot 0","40 + 3 dot 0","30 + 4 dot 0","10 = 0 + 0","15 + 0","80 + 0","90 + 0","40 = 2","25 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Tính $E(X^2)$:
        $ E(X^2) = 0^2 dot 0","05 + 1^2 dot 0","15 + 2^2 dot 0","40 + 3^2 dot 0","30 + 4^2 dot 0","10 $
        $ E(X^2) = 0 + 0","15 + 1","60 + 2","70 + 1","60 = 6","05 $
        Phương sai:
        $ V(X) = E(X^2) - [E(X)]^2 = 6","05 - (2","25)^2 = 6","05 - 5","0625 = 0","9875 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Năng lực tối đa là 3 bệnh nhân. Số bệnh nhân vượt quá năng lực khi $X = 4$.
        Xác suất vượt quá năng lực là $P(X = 4) = 0","10$ (tức $10%$), không phải $0","40$.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 2
#ds([Một nhà máy sản xuất chip vi xử lý đóng gói các lô hàng xuất khẩu gồm $N = 2000$ chip với tỷ lệ chip bị khuyết tật là $p = 0","02$. Ban kiểm định chất lượng (QA) lấy ngẫu nhiên không hoàn lại $n = 100$ chip trong mỗi lô để kiểm tra trước khi xuất xưởng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Kiểm định chip vi mạch
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [N = 2000; n = 100]))
    content((-1.5, -0.25), text(size: 7.5pt, [n / N = 0,05 <= 0,1]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Xấp xỉ nhị thức: B(100; 0,02)]))
    content((1.6, -0.25), text(size: 7.5pt, fill: rgb("15803d"), [E = 2; V = 1,96]))
  })
]
],
    (
        True([Do tỷ lệ mẫu $frac(n, N) = frac(100, 2000) = 0","05 <= 0","10$, số chip khuyết tật trong mẫu $X$ có thể xấp xỉ tốt bằng phân bố nhị thức $B(100; 0","02)$.]),
        True([Kỳ vọng số chip khuyết tật trong mẫu kiểm tra là $E(X) = 2$ chip.]),
        True([Phương sai của số chip khuyết tật trong mẫu theo mô hình nhị thức xấp xỉ là $V(X) = 1","96$ và độ lệch chuẩn $sigma(X) = 1","4$ chip.]),
        False([Nếu quy định chấp nhận lô hàng khi mẫu không có chip lỗi nào ($X = 0$), thì xác suất lô hàng được chấp nhận xuất xưởng lớn hơn $50%$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Kiểm tra tỷ lệ lấy mẫu $frac(n, N)$ để khẳng định tính hợp lệ của xấp xỉ nhị thức.
        2. Tính $E(X) = n p$ và $V(X) = n p (1 - p)$.
        3. Tính $P(X = 0) = (1 - p)^n$.

        #step([Phân tích ý a])
        Tỷ lệ $frac(n, N) = frac(100, 2000) = 0","05 <= 0","10$, thỏa mãn điều kiện thực nghiệm để xấp xỉ phân bố siêu bội bằng phân bố nhị thức $X ~ B(100; 0","02)$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Kỳ vọng:
        $ E(X) = n p = 100 dot 0","02 = 2 " (chip)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Phương sai:
        $ V(X) = n p (1 - p) = 100 dot 0","02 dot 0","98 = 1","96 $
        Độ lệch chuẩn:
        $ sigma(X) = sqrt(1","96) = 1","4 " (chip)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Xác suất không có chip lỗi nào:
        $ P(X = 0) = (1 - 0","02)^100 = (0","98)^100 approx 0","1326 " (tức " 13","26% ")" $
        Giá trị này nhỏ hơn rất nhiều so với $50%$.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#ds([Một trạm sạc xe điện thông minh tại trạm dừng nghỉ cao tốc có $2$ trụ sạc nhanh độc lập. Trong mỗi khoảng thời gian $30$ phút, số xe điện đến có nhu cầu sạc là biến ngẫu nhiên $X$ có bảng phân bố xác suất:
#align(center)[
  #table(
    columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Số xe đến $X$], [$0$], [$1$], [$2$], [$3$],
    [Xác suất], [$0","2$], [$0","4$], [$0","3$], [$0","1$]
  )
]
Mỗi xe sạc xong mang lại lợi nhuận $50$ nghìn đồng cho trạm. Vì trạm chỉ có $2$ trụ sạc nên trong $30$ phút trạm chỉ có thể phục vụ tối đa $2$ xe. Số xe được phục vụ thực tế là $Y = min(X, 2)$, và số xe bị từ chối (hoặc phải chờ) là $Z = max(0, X - 2)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình phục vụ 2 trụ sạc
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Xe đến E(X) = 1,3]))
    content((-1.5, -0.25), text(size: 7.5pt, [Năng lực: 2 trụ]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Xe phục vụ: E(Y) = 1,2]))
    content((1.6, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [Xe phải chờ: E(Z) = 0,1]))
  })
]
],
    (
        True([Kỳ vọng số xe điện đến trạm trong $30$ phút là $E(X) = 1","3$ xe.]),
        True([Biến ngẫu nhiên số xe được phục vụ $Y$ nhận các giá trị $0, 1, 2$ với xác suất tương ứng là $0","2; 0","4; 0","4$.]),
        True([Kỳ vọng số xe được phục vụ thực tế trong $30$ phút là $E(Y) = 1","2$ xe.]),
        False([Kỳ vọng số xe bị từ chối (hoặc phải chờ) là $E(Z) = 0","3$ xe.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính $E(X) = sum x_i p_i$.
        2. Lập bảng phân bố của $Y = min(X, 2)$:
           - $X = 0 ==> Y = 0$ ($p = 0","2$)
           - $X = 1 ==> Y = 1$ ($p = 0","4$)
           - $X = 2 ==> Y = 2$ ($p = 0","3$)
           - $X = 3 ==> Y = 2$ ($p = 0","1$)
        3. Tính $E(Y)$ và $E(Z) = E(X) - E(Y)$.

        #step([Phân tích ý a])
        $ E(X) = 0 dot 0","2 + 1 dot 0","4 + 2 dot 0","3 + 3 dot 0","1 = 0 + 0","4 + 0","6 + 0","3 = 1","3 " (xe)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Phân bố của $Y$:
        - $P(Y = 0) = P(X = 0) = 0","2$
        - $P(Y = 1) = P(X = 1) = 0","4$
        - $P(Y = 2) = P(X = 2) + P(X = 3) = 0","3 + 0","1 = 0","4$
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Kỳ vọng số xe được phục vụ:
        $ E(Y) = 0 dot 0","2 + 1 dot 0","4 + 2 dot 0","4 = 0","4 + 0","8 = 1","2 " (xe)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Ta có hệ thức $X = Y + Z$ (số xe đến = số xe được phục vụ + số xe phải chờ).
        Do đó:
        $ E(Z) = E(X) - E(Y) = 1","3 - 1","2 = 0","1 " (xe)" $
        Giá trị $0","3$ xe trong đề bài là sai.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#ds([Một xưởng quang học sản xuất thấu kính máy ảnh cao cấp. Mỗi chiếc thấu kính sau khi chế tác có thể gặp hai loại lỗi độc lập nhau:
- Lỗi lớp phủ chống phản xạ (lỗi A): Xác suất xảy ra là $p_A = 0","03$.
- Lỗi trầy xước bề mặt kính (lỗi B): Xác suất xảy ra là $p_B = 0","02$.
Kiểm tra ngẫu nhiên một lô gồm $n = 100$ thấu kính (các thấu kính được kiểm tra độc lập). Gọi $X$ là số thấu kính bị lỗi A và $Y$ là số thấu kính bị lỗi B trong số $100$ chiếc được kiểm tra.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai loại lỗi độc lập trên thấu kính
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Lỗi A: B(100; 0,03)]))
    content((-1.5, -0.25), text(size: 7.5pt, [E = 3; V = 2,91]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Lỗi B: B(100; 0,02)]))
    content((1.6, -0.25), text(size: 7.5pt, [E = 2; V = 1,96]))
  })
]
],
    (
        True([Biến ngẫu nhiên $X$ tuân theo phân bố nhị thức $B(100; 0","03)$ và $Y$ tuân theo $B(100; 0","02)$.]),
        True([Kỳ vọng số thấu kính bị lỗi A là $E(X) = 3$ chiếc và kỳ vọng số thấu kính bị lỗi B là $E(Y) = 2$ chiếc.]),
        True([Kỳ vọng tổng số lỗi $S = X + Y$ phát hiện được trong lô là $E(S) = 5$ lỗi.]),
        False([Phương sai của tổng số lỗi phát hiện được trong lô là $V(S) = 0","95$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Nhận dạng phân bố nhị thức của từng loại lỗi.
        2. Tính kỳ vọng và phương sai từng biến ngẫu nhiên.
        3. Tính kỳ vọng của tổng: $E(S) = E(X) + E(Y)$.
        4. Vì lỗi A và lỗi B độc lập nên $V(S) = V(X) + V(Y)$.

        #step([Phân tích ý a])
        Do 100 thấu kính độc lập với xác suất lỗi cố định nên $X ~ B(100; 0","03)$ và $Y ~ B(100; 0","02)$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        $ E(X) = 100 dot 0","03 = 3 " (chiếc)" $
        $ E(Y) = 100 dot 0","02 = 2 " (chiếc)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Kỳ vọng tổng số lỗi:
        $ E(S) = E(X) + E(Y) = 3 + 2 = 5 " (lỗi)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Tính phương sai từng biến:
        $ V(X) = 100 dot 0","03 dot 0","97 = 2","91 $
        $ V(Y) = 100 dot 0","02 dot 0","98 = 1","96 $
        Vì hai loại lỗi độc lập nên:
        $ V(S) = V(X) + V(Y) = 2","91 + 1","96 = 4","87 $
        Giá trị $0","95$ là kết quả sai do lấy nhầm hiệu hai phương sai ($2","91 - 1","96$).
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Một phòng vé rạp chiếu phim thống kê số vé đặt trước trong khung giờ $15$ phút là biến ngẫu nhiên $X$ có bảng phân bố xác suất:
$P(X = 2) = 0","30; quad P(X = 3) = 0","40; quad P(X = 4) = 0","30$.
Tính kỳ vọng $E(X)$ của số vé đặt trước trong khung giờ này.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình kỳ vọng vé rạp
    rect((-2.8, -0.5), (2.8, 0.5), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [E(X) = 2(0,3) + 3(0,4) + 4(0,3) = 3,0]))
  })
]
],
    [3],
    loigiai: [
        #step([Phương pháp giải])
        Kỳ vọng: $E(X) = sum x_i p_i$.

        #step([Lời giải chi tiết])
        $ E(X) = 2 dot 0","30 + 3 dot 0","40 + 4 dot 0","30 = 0","6 + 1","2 + 1","2 = 3 $
        Vậy kỳ vọng số vé bán được là $3$.
    ]
)

// TLN 2
#tln([Một dây chuyền dập nắp lon bia có tỷ lệ nắp bị lỗi mép là $p = 0","008$. Người ta kiểm tra ngẫu nhiên một mẫu gồm $n = 500$ nắp lon độc lập. Tính phương sai $V(X)$ của số nắp lon bị lỗi trong mẫu.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ tính phương sai lon
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [X ~ B(500; 0,008)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [V(X) = 500 . 0,008 . 0,992 = 3,968]))
  })
]
],
    [3,968],
    loigiai: [
        #step([Phương pháp giải])
        Biến ngẫu nhiên $X ~ B(500; 0","008)$.
        Phương sai: $V(X) = n p (1 - p)$.

        #step([Lời giải chi tiết])
        Thay số:
        $ V(X) = 500 dot 0","008 dot (1 - 0","008) = 4 dot 0","992 = 3","968 $
        Vậy phương sai của số nắp lon bị lỗi bằng $3","968$.
    ]
)

// TLN 3
#tln([Một tổng đài viễn thông ghi nhận số lần nghẽn mạng trong một tuần là biến ngẫu nhiên rời rạc $X$ có $E(X) = 6$ và $V(X) = 4$. Xét biến ngẫu nhiên chi phí xử lý sự cố $Y = 3 X^2 - 5 X + 10$ (đơn vị: triệu đồng). Tính kỳ vọng $E(Y)$ của chi phí xử lý sự cố trong tuần (đơn vị: triệu đồng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ tính E(Y) từ E(X) và V(X)
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [E(X^2) = V(X) + [E(X)]^2 = 4 + 36 = 40]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [E(Y) = 3(40) - 5(6) + 10 = 120 - 30 + 10 = 100]))
  })
]
],
    [100],
    loigiai: [
        #step([Phương pháp giải])
        1. Từ $V(X) = E(X^2) - [E(X)]^2$, suy ra:
           $ E(X^2) = V(X) + [E(X)]^2 $
        2. Tính kỳ vọng tuyến tính:
           $ E(Y) = 3 E(X^2) - 5 E(X) + 10 $

        #step([Lời giải chi tiết])
        Ta có:
        $ E(X^2) = 4 + 6^2 = 4 + 36 = 40 $
        Kỳ vọng của $Y$:
        $ E(Y) = 3 dot 40 - 5 dot 6 + 10 = 120 - 30 + 10 = 100 " (triệu đồng)" $
        Vậy kỳ vọng chi phí là $100$ triệu đồng.
    ]
)

// TLN 4
#tln([Một nhà máy sản xuất bóng đèn led kiểm tra chất lượng một mẫu gồm $n = 200$ bóng đèn. Xác suất để mỗi bóng đèn bị hỏng không sáng là $p = 0","04$ (các bóng đèn độc lập nhau). Tính độ lệch chuẩn $sigma(X)$ của số bóng đèn bị hỏng trong mẫu (làm tròn kết quả đến hàng phần mười).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Độ lệch chuẩn bóng đèn
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [V(X) = 200 . 0,04 . 0,96 = 7,68]))
    content((0, -0.25), text(size: 8pt, fill: rgb("b91c1c"), [σ(X) = sqrt(7,68) ≈ 2,8]))
  })
]
],
    [2,8],
    loigiai: [
        #step([Phương pháp giải])
        Biến ngẫu nhiên $X ~ B(200; 0","04)$.
        Phương sai: $V(X) = n p (1 - p)$.
        Độ lệch chuẩn: $sigma(X) = sqrt(V(X))$.

        #step([Lời giải chi tiết])
        Phương sai:
        $ V(X) = 200 dot 0","04 dot (1 - 0","04) = 8 dot 0","96 = 7","68 $
        Độ lệch chuẩn:
        $ sigma(X) = sqrt(7","68) approx 2","77128 $
        Làm tròn đến hàng phần mười ta được kết quả là $2","8$.
    ]
)

// TLN 5
#tln([Một bộ phận dịch vụ khách hàng có $2$ nhân viên tư vấn trực điện thoại độc lập. Số yêu cầu tư vấn tiếp nhận trong ngày của nhân viên 1 là biến ngẫu nhiên $X_1$ có $E(X_1) = 20, V(X_1) = 9$. Số yêu cầu của nhân viên 2 là biến ngẫu nhiên $X_2$ có $E(X_2) = 25, V(X_2) = 16$. Tính độ lệch chuẩn của tổng số yêu cầu tư vấn mà cả hai nhân viên tiếp nhận trong ngày $sigma(X_1 + X_2)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình tổng yêu cầu tư vấn
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [V(X1 + X2) = 9 + 16 = 25]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [σ(X1 + X2) = sqrt(25) = 5 yêu cầu]))
  })
]
],
    [5],
    loigiai: [
        #step([Phương pháp giải])
        Vì hai nhân viên làm việc độc lập:
        $ V(X_1 + X_2) = V(X_1) + V(X_2) $
        Độ lệch chuẩn:
        $ sigma(X_1 + X_2) = sqrt(V(X_1 + X_2)) $

        #step([Lời giải chi tiết])
        Phương sai tổng:
        $ V(X_1 + X_2) = 9 + 16 = 25 $
        Độ lệch chuẩn:
        $ sigma(X_1 + X_2) = sqrt(25) = 5 $
        Vậy độ lệch chuẩn của tổng số yêu cầu là $5$.
    ]
)

// TLN 6
#tln([Một lô hàng gồm $N = 100$ sản phẩm trong đó có $M = 10$ phế phẩm. Người ta lấy ngẫu nhiên không hoàn lại $n = 5$ sản phẩm để kiểm định chất lượng. Xác suất để trong $5$ sản phẩm lấy ra không có phế phẩm nào bằng bao nhiêu? (Làm tròn kết quả đến hàng phần trăm, ví dụ $0","58$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình lấy không hoàn lại 5 từ 100
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [N = 100; M = 10; n = 5]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [P = C(90, 5) / C(100, 5) ≈ 0,58]))
  })
]
],
    [0,58],
    loigiai: [
        #step([Phương pháp giải])
        Lô hàng có $90$ chính phẩm và $10$ phế phẩm.
        Số cách chọn ngẫu nhiên $5$ sản phẩm từ $100$ sản phẩm là $C_100^5$.
        Số cách chọn được $5$ sản phẩm đều là chính phẩm là $C_90^5$.
        Xác suất cần tính:
        $ P = frac(C_90^5, C_100^5) = frac(90 dot 89 dot 88 dot 87 dot 86, 100 dot 99 dot 98 dot 97 dot 96) $

        #step([Lời giải chi tiết])
        Tính tỷ số:
        $ P = frac(90, 100) dot frac(89, 99) dot frac(88, 98) dot frac(87, 97) dot frac(86, 96) $
        $ P = 0","90000 dot 0","89899 dot 0","89796 dot 0","89691 dot 0","89583 approx 0","58375 $
        Làm tròn đến hàng phần trăm ta được kết quả là $0","58$.
    ]
)

]

#make-questions()
