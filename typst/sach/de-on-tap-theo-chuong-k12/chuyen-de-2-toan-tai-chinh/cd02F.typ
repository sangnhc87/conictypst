#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("4338ca")

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH",
  exam-title: "CHỦ ĐỀ 2F: ĐỊNH GIÁ TRÁI PHIẾU & ĐỘ NHẠY LÃI SUẤT (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "516",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một trái phiếu Chính phủ có mệnh giá $F = 100$ triệu đồng, thời hạn $5$ năm, lãi suất coupon cố định là $8\%$/năm trả lãi vào cuối mỗi năm. Hiện tại, mức lợi suất đáo hạn (YTM) yêu cầu của thị trường đối với các trái phiếu có mức rủi ro tương đương là $7\%$/năm. Thị giá lý thuyết hợp lý của trái phiếu này trên thị trường là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    // Giá mua tại t = 0
    line((0.5, 0), (0.5, -1.2), mark: (end: "stealth"), stroke: 1.5pt + rgb("e11d48"))
    content((0.5, 0.35), text(size: 8pt)[$0$])
    content((0.5, -1.45), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$-P$])

    // Các khoản nhận coupon
    line((1.5, 0), (1.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("4338ca"))
    content((1.5, -0.35), text(size: 8pt)[$1$])
    content((1.5, 1.25), text(size: 7.5pt, fill: rgb("4338ca"))[$8$ tr])

    line((2.5, 0), (2.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("4338ca"))
    content((2.5, -0.35), text(size: 8pt)[$2$])
    content((2.5, 1.25), text(size: 7.5pt, fill: rgb("4338ca"))[$8$ tr])

    content((3.5, 0.5), text(size: 8pt, fill: rgb("4338ca"))[$dots$])

    line((4.8, 0), (4.8, 1.8), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((4.8, -0.35), text(size: 8pt, weight: "bold")[$5$])
    content((4.8, 2.05), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$8 + 100$ tr])
  })
]
],
    (
        True([Khoảng $104","10$ triệu đồng.]),
        [Khoảng $100","00$ triệu đồng.],
        [Khoảng $96","25$ triệu đồng.],
        [Khoảng $108","50$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị lý thuyết của trái phiếu coupon trả lãi hàng năm là tổng giá trị hiện tại của chuỗi các khoản lãi coupon định kỳ và mệnh giá khi đáo hạn:
        $ P = C dot (1 - (1 + y)^(-n)) / y + F / ((1 + y)^n) $
        - Mệnh giá: $F = 100$ triệu đồng.
        - Tiền lãi coupon hàng năm: $C = F dot c = 100 dot 8\% = 8$ triệu đồng.
        - Lợi suất đáo hạn yêu cầu: $y = 7\% = 0","07$.
        - Số năm đáo hạn: $n = 5$ năm.

        #step([Lời giải chi tiết])
        Áp dụng công thức định giá trái phiếu:
        $ P = 8 dot (1 - (1 + 0","07)^(-5)) / (0","07) + 100 / ((1 + 0","07)^5) $

        Ta tính toán các đại lượng thành phần:
        $ (1","07)^(-5) approx 0","712986 $
        $ 1 - 0","712986 = 0","287014 $
        - Giá trị hiện tại của dòng coupon:
        $ "PV"_"coupon" = 8 dot (0","287014) / (0","07) = 8 dot 4","1002 approx 32","8016 " (triệu đồng)" $
        - Giá trị hiện tại của mệnh giá hoàn vốn:
        $ "PV"_"mệnh giá" = 100 dot 0","712986 = 71","2986 " (triệu đồng)" $

        Tổng giá trị của trái phiếu:
        $ P = 32","8016 + 71","2986 = 104","1002 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $104","10$ triệu đồng (trái phiếu giao dịch thặng dư trên mệnh giá vì lãi suất coupon $8\%$ cao hơn lợi suất đòi hỏi $7\%$).
    ]
)

// TN 2
#tn([Một doanh nghiệp phát hành trái phiếu có mệnh giá $F = 1$ tỷ đồng ($1000$ triệu đồng), kỳ hạn $3$ năm, lãi suất coupon cố định $6\%$/năm trả lãi mỗi năm một lần ($C = 60$ triệu đồng/năm). Trên thị trường tài chính, các nhà đầu tư đòi hỏi mức lợi suất đáo hạn (YTM) đối với trái phiếu doanh nghiệp này là $9\%$/năm. Giá trị hợp lý mà nhà đầu tư sẵn sàng trả để mua trái phiếu này là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cột phân bổ giá trị hiện tại
    rect((0.8, 0), (2.4, 2.5), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((0.8, 0), (2.4, 1.95), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    rect((0.8, 1.95), (2.4, 2.5), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))

    content((1.6, 1.0), text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[$"PV"_"Gốc"$\ $772","18$ tr\ ])
    content((1.6, 2.22), text(size: 7.5pt, fill: rgb("5b21b6"), weight: "bold")[$"PV"_"Coupon"$\ $151","88$ tr\ ])
    content((1.6, -0.4), text(size: 8pt, weight: "bold")[Giá $P approx 924","06$ tr])

    rect((3.2, 0), (4.8, 2.7), fill: rgb("f8fafc"), stroke: (dash: "dashed", paint: rgb("64748b")))
    content((4.0, 1.35), text(size: 8pt, fill: rgb("64748b"))[Mệnh giá gốc\ $1000$ tr\ ])
    content((4.0, -0.4), text(size: 8pt)[Chiết khấu $75","9$ tr])
  })
]
],
    (
        True([Khoảng $924","06$ triệu đồng.]),
        [Khoảng $1000","00$ triệu đồng.],
        [Khoảng $885","20$ triệu đồng.],
        [Khoảng $950","00$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Vì lãi suất coupon ($c = 6\%$) thấp hơn lợi suất yêu cầu của thị trường ($y = 9\%$), nên trái phiếu phải được bán chiết khấu dưới mệnh giá ($P < F$):
        $ P = C dot (1 - (1 + y)^(-n)) / y + F / ((1 + y)^n) $

        #step([Lời giải chi tiết])
        Với $F = 1000$ triệu, $C = 60$ triệu, $y = 9\% = 0","09$, $n = 3$ năm:
        $ (1 + 0","09)^(-3) = (1","09)^(-3) approx 0","772183 $
        $ 1 - 0","772183 = 0","227817 $
        - Giá trị hiện tại của 3 khoản coupon:
        $ "PV"_"coupon" = 60 dot (0","227817) / (0","09) approx 151","878 " (triệu đồng)" $
        - Giá trị hiện tại của khoản hoàn trả mệnh giá:
        $ "PV"_"mệnh giá" = 1000 dot 0","772183 = 772","183 " (triệu đồng)" $

        Tổng giá trị trái phiếu:
        $ P = 151","878 + 772","183 = 924","061 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $924","06$ triệu đồng.
    ]
)

// TN 3
#tn([Một trái phiếu không trả lãi định kỳ (Zero-Coupon Bond) có mệnh giá $F = 100$ triệu đồng, thời hạn $5$ năm. Hiện tại trên thị trường thứ cấp, trái phiếu này đang được giao dịch với mức giá $P = 68","06$ triệu đồng. Lợi suất đáo hạn (YTM) hàng năm của trái phiếu này xấp xỉ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Năm])

    // Mua vào tại t = 0
    line((0.8, 0), (0.8, -1.2), mark: (end: "stealth"), stroke: 1.5pt + rgb("e11d48"))
    content((0.8, 0.35), text(size: 8pt)[$0$])
    content((0.8, -1.45), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$P = 68","06$ tr])

    // Không có dòng tiền coupon ở giữa
    content((2.8, 0.3), text(size: 7.5pt, fill: rgb("64748b"))[Không trả coupon định kỳ])

    // Nhận mệnh giá tại t = 5
    line((4.8, 0), (4.8, 1.5), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((4.8, -0.35), text(size: 8pt, weight: "bold")[$5$])
    content((4.8, 1.75), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$F = 100$ tr])
  })
]
],
    (
        True([$8","0\%$/năm.]),
        [$7","2\%$/năm.],
        [$9","5\%$/năm.],
        [$6","8\%$/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đối với trái phiếu zero-coupon, nhà đầu tư mua với giá chiết khấu sâu và chỉ nhận duy nhất mệnh giá $F$ tại thời điểm đáo hạn. Mối quan hệ giữa giá và lợi suất là:
        $ P = F / ((1 + y)^n) ==> (1 + y)^n = F / P ==> y = root(n, F / P) - 1 $

        #step([Lời giải chi tiết])
        Với $F = 100$ triệu, $P = 68","06$ triệu, $n = 5$ năm:
        $ (1 + y)^5 = (100) / (68","06) approx 1","469292 $
        $ 1 + y = (1","469292)^(1/5) = (1","469292)^(0","2) approx 1","08000 $
        $ y = 1","08000 - 1 = 0","0800 = 8","0\% $

        Vậy lợi suất đáo hạn của trái phiếu này là đúng $8","0\%$/năm.
    ]
)

// TN 4
#tn([Xét đường cong biểu diễn mối quan hệ giữa giá trái phiếu $P$ và lợi suất đáo hạn $y$ trên đồ thị tọa độ $(y, P)$. Đặc điểm hình học cơ bản của đường cong giá trái phiếu (Bond Price-Yield Curve) là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Lợi suất $y$])
    content((-0.4, 3.2), text(size: 8pt)[Giá $P$])

    // Đường cong lồi dốc xuống
    bezier((0.6, 2.8), (5.0, 0.4), (2.0, 0.9), stroke: 1.5pt + rgb("4338ca"))
    content((4.0, 1.3), text(size: 8pt, fill: rgb("4338ca"), weight: "bold")[Đường cong lồi\ (Convexity)\ ])

    // Tiếp tuyến tại 1 điểm
    line((1.5, 2.2), (3.8, 0.5), stroke: (dash: "densely-dashed", paint: rgb("e11d48")))
    content((3.6, 0.2), text(size: 7.5pt, fill: rgb("e11d48"))[Độ dốc: $-D^*$])
  })
]
],
    (
        True([Đường cong dốc xuống từ trái qua phải và lồi về phía gốc tọa độ ($P'(y) < 0$ và $P''(y) > 0$).]),
        [Đường thẳng dốc xuống có hệ số góc không đổi ($P'(y) < 0$ và $P''(y) = 0$).],
        [Đường cong đồng biến đi lên từ trái qua phải ($P'(y) > 0$).],
        [Đường parabol có đỉnh cực trị tại mức lợi suất trung bình.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trái phiếu là hàm giảm của lợi suất đáo hạn $y$:
        $ P(y) = sum_(t=1)^n C / ((1 + y)^t) + F / ((1 + y)^n) $
        Lấy đạo hàm bậc nhất và bậc hai theo $y$:
        - Đạo hàm cấp 1:
        $ P'(y) = - sum_(t=1)^n (t dot C) / ((1 + y)^(t+1)) - (n dot F) / ((1 + y)^(n+1)) < 0 $
        Do đó hàm số nghịch biến (khi lợi suất tăng thì giá trái phiếu giảm).
        - Đạo hàm cấp 2:
        $ P''(y) = sum_(t=1)^n (t(t+1) dot C) / ((1 + y)^(t+2)) + (n(n+1) dot F) / ((1 + y)^(n+2)) > 0 $
        Do đó đồ thị hàm số luôn lồi về phía gốc tọa độ (tính chất Convexity của trái phiếu).

        #step([Lời giải chi tiết])
        Tính chất lồi này mang lại lợi thế cho nhà đầu tư: Khi lợi suất giảm thì giá trái phiếu tăng với biên độ lớn hơn so với mức giảm giá khi lợi suất tăng cùng một lượng.
    ]
)

// TN 5
#tn([Một trái phiếu Chính phủ có mệnh giá $F = 100$ triệu đồng, thời hạn $4$ năm, lãi suất coupon $8\%$/năm nhưng được thanh toán định kỳ nửa năm một lần ($6$ tháng/lần). Mức lợi suất đáo hạn tương đương trên thị trường hiện tại là $10\%$/năm (tương ứng lợi suất $5\%$ cho mỗi kỳ $6$ tháng). Giá trị hiện tại của trái phiếu này là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Kỳ $6$ th])

    // Các mũi tên coupon nửa năm (4 tr)
    line((1.0, 0), (1.0, 0.9), mark: (start: "stealth"), stroke: 1pt + rgb("4338ca"))
    content((1.0, -0.3), text(size: 7.5pt)[$1$])
    content((1.0, 1.1), text(size: 7pt)[$4$ tr])

    line((2.0, 0), (2.0, 0.9), mark: (start: "stealth"), stroke: 1pt + rgb("4338ca"))
    content((2.0, -0.3), text(size: 7.5pt)[$2$])
    content((2.0, 1.1), text(size: 7pt)[$4$ tr])

    content((3.2, 0.4), text(size: 8pt, fill: rgb("4338ca"))[$dots$])

    line((5.0, 0), (5.0, 1.6), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((5.0, -0.3), text(size: 7.5pt, weight: "bold")[$8$])
    content((5.0, 1.8), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[$4 + 100$ tr])
  })
]
],
    (
        True([Khoảng $93","54$ triệu đồng.]),
        [Khoảng $90","20$ triệu đồng.],
        [Khoảng $96","80$ triệu đồng.],
        [Khoảng $100","00$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi trái phiếu trả lãi nửa năm một lần:
        - Số kỳ thanh toán: $n' = 4 dot 2 = 8$ kỳ.
        - Khoản coupon mỗi kỳ: $C' = (100 dot 8\%) / 2 = 4$ triệu đồng.
        - Lợi suất chiết khấu mỗi kỳ: $y' = (10\%) / 2 = 5\% = 0","05$.
        Công thức định giá:
        $ P = C' dot (1 - (1 + y')^(-n')) / y' + F / ((1 + y')^(n')) $

        #step([Lời giải chi tiết])
        Thay các số liệu:
        $ P = 4 dot (1 - (1 + 0","05)^(-8)) / (0","05) + 100 / ((1 + 0","05)^8) $
        Ta tính toán:
        $ (1","05)^(-8) approx 0","676839 $
        $ 1 - 0","676839 = 0","323161 $
        - Giá trị hiện tại của 8 kỳ coupon:
        $ "PV"_"coupon" = 4 dot (0","323161) / (0","05) = 4 dot 6","46322 approx 25","8529 " (triệu đồng)" $
        - Giá trị hiện tại của mệnh giá hoàn trả:
        $ "PV"_"mệnh giá" = 100 dot 0","676839 = 67","6839 " (triệu đồng)" $

        Tổng giá trị của trái phiếu:
        $ P = 25","8529 + 67","6839 = 93","5368 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $93","54$ triệu đồng.
    ]
)

// TN 6
#tn([Xét một trái phiếu zero-coupon có thời hạn đến lúc đáo hạn là đúng $7$ năm. Thời lượng Macaulay (Macaulay Duration) của trái phiếu này bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Đòn bẩy thời lượng
    line((0.5, 1.2), (5.5, 1.2), stroke: 1.5pt + rgb("64748b"))
    // Điểm tựa tại t = 7
    line((5.0, 0.4), (5.0, 1.2), stroke: 1.5pt + rgb("4338ca"))
    circle((5.0, 0.4), radius: 0.12, fill: rgb("4338ca"))
    content((5.0, 0.05), text(size: 8pt, fill: rgb("4338ca"), weight: "bold")[Điểm tựa: $D = 7$ năm])

    // Tải trọng dòng tiền duy nhất ở t = 7
    rect((4.4, 1.2), (5.6, 2.4), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((5.0, 1.8), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Mệnh giá $F$\ tại $t = 7$\ ])
  })
]
],
    (
        True([Đúng bằng $7$ năm.]),
        [Nhỏ hơn $7$ năm (khoảng $5","5$ năm).],
        [Lớn hơn $7$ năm (khoảng $8$ năm).],
        [Bằng $0$ năm do không có dòng tiền lãi định kỳ.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Thời lượng Macaulay biểu thị thời gian đáo hạn bình quân có trọng số của các dòng tiền từ trái phiếu:
        $ D = (sum_(t=1)^n t dot ("CF"_t) / ((1 + y)^t)) / P $
        Đối với Zero-Coupon Bond, chỉ có duy nhất một dòng tiền tại thời điểm đáo hạn $t = n$, với giá trị hiện tại chính bằng giá trái phiếu:
        $ ("CF"_n) / ((1 + y)^n) = F / ((1 + y)^n) = P $
        Do đó:
        $ D = (n dot P) / P = n $

        #step([Lời giải chi tiết])
        Vì kỳ hạn của trái phiếu là $7$ năm, nên thời lượng Macaulay của trái phiếu này bằng đúng $7$ năm.
    ]
)

// TN 7
#tn([Một trái phiếu có mệnh giá $F = 100$ triệu đồng, lãi suất coupon $10\%$/năm trả lãi hàng năm, thời hạn $3$ năm. Hiện tại trên thị trường, lợi suất đáo hạn của trái phiếu đúng bằng $10\%$/năm (trái phiếu đang được giao dịch ngang mệnh giá $P = 100$ triệu đồng). Thời lượng Macaulay của trái phiếu này là khoảng bao nhiêu năm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])

    // 3 cột dòng tiền chiết khấu
    rect((0.8, 0), (1.6, 0.91), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))
    content((1.2, -0.3), text(size: 8pt)[$1$])
    content((1.2, 1.15), text(size: 7pt)[$9","09$ tr])

    rect((2.2, 0), (3.0, 0.83), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))
    content((2.6, -0.3), text(size: 8pt)[$2$])
    content((2.6, 1.05), text(size: 7pt)[$8","26$ tr])

    rect((3.6, 0), (4.4, 2.5), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((4.0, -0.3), text(size: 8pt)[$3$])
    content((4.0, 2.7), text(size: 7pt, fill: rgb("166534"), weight: "bold")[$82","64$ tr])

    // Điểm tựa trọng tâm Macaulay
    circle((3.74, 0), radius: 0.1, fill: rgb("e11d48"))
    content((3.74, -0.6), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$D approx 2","74$ năm])
  })
]
],
    (
        True([Khoảng $2","74$ năm.]),
        [Khoảng $3","00$ năm.],
        [Khoảng $2","25$ năm.],
        [Khoảng $1","85$ năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Công thức tính thời lượng Macaulay:
        $ D = 1 / P dot [sum_(t=1)^n t dot C / ((1 + y)^t) + n dot F / ((1 + y)^n)] $

        #step([Lời giải chi tiết])
        Với $F = 100$, $C = 10$, $y = 10\% = 0","10$, $P = 100$, $n = 3$:
        - Năm 1: $1 dot (10) / (1","1) approx 9","0909$
        - Năm 2: $2 dot (10) / (1","1^2) = 2 dot (10) / (1","21) approx 16","5289$
        - Năm 3: $3 dot (10 + 100) / (1","1^3) = 3 dot (110) / (1","331) = (330) / (1","331) approx 247","9339$

        Tổng tử số:
        $ "Tử số" = 9","0909 + 16","5289 + 247","9339 = 273","5537 $

        Thời lượng Macaulay:
        $ D = (273","5537) / (100) approx 2","7355 " (năm)" approx 2","74 " năm" $

        Làm tròn kết quả là khoảng $2","74$ năm.
    ]
)

// TN 8
#tn([Một danh mục đầu tư trái phiếu có Thời lượng Macaulay là $D = 4","5$ năm. Lợi suất đáo hạn bình quân hiện tại của danh mục là $y = 8\%$/năm. Theo công thức Thời lượng điều chỉnh (Modified Duration), nếu lợi suất thị trường tăng thêm $0","5\%$ ($Delta y = +0","5\%$), thì giá trị danh mục trái phiếu sẽ biến động xấp xỉ bao nhiêu phần trăm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ đòn bẩy độ nhạy lãi suất
    rect((0.5, 0), (2.3, 1.8), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((1.4, 0.9), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Lợi suất $y$\ Tăng $+0","5\%$\ ])

    line((2.3, 0.9), (3.5, 0.9), mark: (end: "stealth"), stroke: 1.5pt + rgb("64748b"))
    content((2.9, 1.2), text(size: 7.5pt)[$times (-D^*)$])

    rect((3.5, 0), (5.5, 1.8), fill: rgb("fef2f2"), stroke: 1pt + rgb("b91c1c"))
    content((4.5, 0.9), text(size: 7.5pt, fill: rgb("b91c1c"), weight: "bold")[Giá trị danh mục\ Giảm $-2","08\%$\ ])
  })
]
],
    (
        True([Giảm khoảng $2","08\%$.]),
        [Tăng khoảng $2","08\%$.],
        [Giảm khoảng $4","50\%$.],
        [Giảm khoảng $1","25\%$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính Thời lượng điều chỉnh (Modified Duration):
        $ D^* = D / (1 + y) $
        - Bước 2: Đo lường độ nhạy phần trăm biến động của giá danh mục theo sự thay đổi lợi suất $Delta y$:
        $ (Delta P) / P approx - D^* dot Delta y $

        #step([Lời giải chi tiết])
        1. Tính $D^*$:
        $ D^* = (4","5) / (1 + 0","08) = (4","5) / (1","08) approx 4","1667 " (năm)" $

        2. Tính phần trăm thay đổi giá trị với $Delta y = +0","5\% = +0","005$:
        $ (Delta P) / P approx - 4","1667 dot (+0","005) = - 0","02083 = - 2","083\% $

        Vậy giá trị danh mục trái phiếu sẽ sụt giảm khoảng $2","08\%$.
    ]
)

// TN 9
#tn([Trong kinh tế học tài chính, hiện tượng "Đường cong lợi suất đảo ngược" (Inverted Yield Curve) xảy ra khi lợi suất trái phiếu ngắn hạn cao hơn lợi suất trái phiếu dài hạn. Hiện tượng này thường được các chuyên gia phân tích coi là dấu hiệu báo trước đáng tin cậy cho sự kiện kinh tế nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Kỳ hạn])
    content((-0.4, 3), text(size: 8pt)[Lợi suất])

    // Đường cong bình thường (dốc lên)
    bezier((0.5, 0.8), (5.0, 2.5), (2.5, 2.0), stroke: 1.2pt + rgb("047857"))
    content((4.8, 2.75), text(size: 7.5pt, fill: rgb("047857"))[Bình thường])

    // Đường cong đảo ngược (dốc xuống)
    bezier((0.5, 2.4), (5.0, 1.0), (2.5, 1.4), stroke: 1.5pt + rgb("e11d48"))
    content((4.8, 0.75), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[Đảo ngược])
  })
]
],
    (
        True([Nguy cơ suy thoái kinh tế (Recession) trong tương lai gần.]),
        [Nền kinh tế đang tăng trưởng nóng và bùng nổ tín dụng.],
        [Tỷ lệ lạm phát sắp sửa giảm về mức âm (giảm phát nghiêm trọng).],
        [Ngân hàng trung ương chuẩn bị nâng mạnh lãi suất điều hành dài hạn.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Thông thường, trái phiếu dài hạn chịu rủi ro kỳ hạn cao hơn nên có lợi suất cao hơn ngắn hạn (đường cong dốc lên).
        - Khi các nhà đầu tư dự báo kinh tế sắp bước vào suy thoái, ngân hàng trung ương sẽ phải cắt giảm lãi suất trong tương lai. Do đó, dòng tiền đổ xô mua trái phiếu dài hạn để chốt lợi suất cao, đẩy giá trái phiếu dài hạn tăng vọt và lợi suất dài hạn tụt xuống thấp hơn lợi suất ngắn hạn (đường cong bị đảo ngược).

        #step([Lời giải chi tiết])
        Lịch sử tài chính thế giới chứng minh rằng hầu hết các cuộc suy thoái kinh tế lớn đều diễn ra sau khi xuất hiện hiện tượng đường cong lợi suất đảo ngược từ $6$ đến $18$ tháng.
    ]
)

// TN 10
#tn([Một trái phiếu vĩnh cửu (Consol Bond) quy định mỗi năm chi trả một khoản coupon cố định là $12$ triệu đồng vào cuối mỗi năm cho người sở hữu mãi mãi mà không bao giờ hoàn trả nợ gốc. Nếu mức lợi suất yêu cầu của thị trường đối với trái phiếu này là $8\%$/năm, thị giá hiện tại của trái phiếu vĩnh cửu là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[$t ==> oo$])

    line((1.0, 0), (1.0, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("4338ca"))
    content((1.0, -0.3), text(size: 7.5pt)[$1$])
    content((1.0, 1.3), text(size: 7pt)[$12$ tr])

    line((2.2, 0), (2.2, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("4338ca"))
    content((2.2, -0.3), text(size: 7.5pt)[$2$])
    content((2.2, 1.3), text(size: 7pt)[$12$ tr])

    content((3.5, 0.6), text(size: 9pt, fill: rgb("4338ca"))[$dots.h$])

    rect((3.8, 1.4), (5.2, 2.5), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((4.5, 1.95), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Dòng tiền $oo$\ $P = C / y$\ ])
  })
]
],
    (
        True([$150$ triệu đồng.]),
        [$120$ triệu đồng.],
        [$96$ triệu đồng.],
        [$200$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị hiện tại của dòng niên kim vĩnh viễn (Perpetuity):
        $ P = lim_(n -> oo) [C dot (1 - (1 + y)^(-n)) / y] = C / y $

        #step([Lời giải chi tiết])
        Với $C = 12$ triệu đồng/năm, $y = 8\% = 0","08$:
        $ P = 12 / (0","08) = 150 " (triệu đồng)" $

        Vậy giá trị của trái phiếu vĩnh cửu là $150$ triệu đồng.
    ]
)

// TN 11
#tn([Khi một nhà đầu tư mua một trái phiếu coupon kỳ hạn $10$ năm với mục tiêu hưởng lợi suất đáo hạn danh nghĩa $9\%$/năm, rủi ro nào sau đây có thể làm cho tỷ suất sinh lời thực tế của nhà đầu tư sau $10$ năm bị thấp hơn mức $9\%$/năm mặc dù tổ chức phát hành không hề vỡ nợ?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ rủi ro tái đầu tư
    rect((0.5, 0), (2.3, 1.8), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))
    content((1.4, 0.9), text(size: 7.5pt, fill: rgb("5b21b6"), weight: "bold")[Nhận Coupon\ định kỳ $C$\ ])

    line((2.3, 0.9), (3.5, 0.9), mark: (end: "stealth"), stroke: 1.5pt + rgb("64748b"))

    rect((3.5, 0), (5.5, 1.8), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((4.5, 0.9), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Tái đầu tư\ với lãi suất thấp\ (Lãi suất giảm)\ ])
  })
]
],
    (
        True([Rủi ro tái đầu tư (Reinvestment Risk) khi lãi suất thị trường sụt giảm làm các khoản tiền coupon nhận được phải tái đầu tư ở mức lãi thấp hơn.]),
        [Rủi ro vỡ nợ tín dụng của tổ chức phát hành trái phiếu.],
        [Rủi ro biến động tỷ giá hối đoái của đồng nội tệ.],
        [Rủi ro thanh khoản khi không thể bán trái phiếu trên thị trường.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Khái niệm YTM giả định rằng toàn bộ các khoản tiền lãi coupon nhận được định kỳ trong suốt dòng đời của trái phiếu đều được tái đầu tư với mức lãi suất đúng bằng YTM ban đầu.
        - Nếu trong tương lai lãi suất thị trường giảm, nhà đầu tư phải tái đầu tư các khoản coupon đó ở mức lãi suất thấp hơn, khiến tổng số tiền tích lũy khi đáo hạn thấp hơn kỳ vọng ban đầu. Đây chính là "Rủi ro tái đầu tư" (Reinvestment Risk).
    ]
)

// TN 12
#tn([Một nhà quản trị quỹ muốn thực hiện chiến lược "Miễn dịch hóa" (Immunization) cho một nghĩa vụ tài chính phải thanh toán số tiền $1$ tỷ đồng sau đúng $4$ năm nữa ($t = 4$). Để danh mục đầu tư trái phiếu được bảo hiểm hoàn hảo trước mọi biến động của lãi suất thị trường trong ngắn hạn, Thời lượng Macaulay của danh mục trái phiếu được chọn phải thỏa mãn điều kiện nào?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cân bằng thời lượng
    rect((0.8, 0), (2.6, 1.8), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    content((1.7, 0.9), text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[Tài sản Trái phiếu\ $D_"tài sản" = 4$ năm\ ])

    content((3.0, 0.9), text(size: 10pt, weight: "bold")[$=$])

    rect((3.4, 0), (5.2, 1.8), fill: rgb("fef08a").lighten(50%), stroke: 1pt + rgb("ca8a04"))
    content((4.3, 0.9), text(size: 7.5pt, fill: rgb("854d0e"), weight: "bold")[Nghĩa vụ nợ chi trả\ Kỳ hạn $= 4$ năm\ ])
  })
]
],
    (
        True([Thời lượng Macaulay của danh mục trái phiếu phải bằng đúng $4$ năm ($D = 4$).]),
        [Kỳ hạn đáo hạn của mọi trái phiếu trong danh mục đều phải đúng bằng $4$ năm.],
        [Thời lượng Macaulay của danh mục phải lớn hơn $4$ năm để có biên an toàn.],
        [Thời lượng điều chỉnh phải bằng $0$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Nguyên lý miễn dịch hóa Redington (Redington's Immunization Rule):
        Để giá trị của danh mục tài sản bảo đảm bù đắp chính xác nghĩa vụ nợ khi lãi suất thị trường dịch chuyển song song, hai điều kiện tiên quyết phải thỏa mãn:
        1. Giá trị hiện tại của tài sản bằng giá trị hiện tại của nợ ($"PV"_"tài sản" = "PV"_"nợ"$).
        2. Thời lượng Macaulay của tài sản bằng Thời lượng Macaulay của nợ:
        $ D_"tài sản" = D_"nợ" $

        #step([Lời giải chi tiết])
        Vì nghĩa vụ thanh toán $1$ tỷ đồng diễn ra tại một mốc duy nhất là sau 4 năm (tương đương trái phiếu zero-coupon kỳ hạn 4 năm với $D_"nợ" = 4$ năm), nên danh mục trái phiếu bảo hiểm bắt buộc phải có thời lượng Macaulay $D_"tài sản" = 4$ năm.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 13 đến câu 16. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một trái phiếu Chính phủ có mệnh giá $F = 1$ tỷ đồng ($1000$ triệu đồng), kỳ hạn $10$ năm, lãi suất coupon cố định $8\%$/năm trả lãi hàng năm ($C = 80$ triệu đồng/năm). Xét sự biến động giá thị trường của trái phiếu này theo ba kịch bản lãi suất:
- Kịch bản 1 (Cơ sở): Lợi suất đáo hạn thị trường đúng bằng lãi suất coupon ($y_1 = 8\%$/năm).
- Kịch bản 2 (Thắt chặt tiền tệ): Ngân hàng trung ương tăng lãi suất, YTM tăng lên $y_2 = 10\%$/năm.
- Kịch bản 3 (Nới lỏng tiền tệ): Ngân hàng trung ương hạ lãi suất, YTM giảm xuống $y_3 = 6\%$/năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // 3 cột so sánh giá trái phiếu
    rect((0.5, 0), (1.8, 1.8), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((1.15, 0.9), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[YTM $10\%$\ $877$ tr\ (Giảm $12","3\%$)\ ])

    rect((2.2, 0), (3.5, 2.1), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((2.85, 1.05), text(size: 7.5pt, fill: rgb("334155"), weight: "bold")[YTM $8\%$\ $1000$ tr\ (Ngang mệnh giá)\ ])

    rect((3.9, 0), (5.2, 2.5), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((4.55, 1.25), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[YTM $6\%$\ $1147$ tr\ (Tăng $14","7\%$)\ ])

    content((2.85, -0.4), text(size: 8pt, weight: "bold")[Tính chất lồi: Tăng giá nhiều hơn giảm giá])
  })
]
],
    (
        True([Ở Kịch bản 1, giá thị trường của trái phiếu bằng đúng mệnh giá $1$ tỷ đồng.]),
        True([Ở Kịch bản 2, khi lợi suất tăng lên $10\%$/năm, giá trái phiếu giảm xuống còn khoảng $877$ triệu đồng.]),
        True([Ở Kịch bản 3, khi lợi suất giảm xuống $6\%$/năm, giá trái phiếu tăng lên khoảng $1147$ triệu đồng.]),
        True([Biên độ tăng giá trị tuyệt đối khi lợi suất giảm $2\%$ ($+147$ triệu) lớn hơn biên độ giảm giá khi lợi suất tăng $2\%$ ($-123$ triệu) do tính chất lồi (Convexity) của trái phiếu.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Khi $y = c = 8\%$:
        $ P = 80 dot (1 - (1","08)^(-10)) / (0","08) + 1000 / ((1","08)^10) = 1000 " (triệu đồng)" = 1 " tỷ đồng" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Khi $y = 10\% = 0","10$:
        $ (1","10)^(-10) approx 0","385543 ==> 1 - 0","385543 = 0","614457 $
        $ P = 80 dot (0","614457) / (0","10) + 1000 dot 0","385543 = 491","566 + 385","543 approx 877","11 " (triệu đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Khi $y = 6\% = 0","06$:
        $ (1","06)^(-10) approx 0","558395 ==> 1 - 0","558395 = 0","441605 $
        $ P = 80 dot (0","441605) / (0","06) + 1000 dot 0","558395 = 588","807 + 558","395 approx 1147","20 " (triệu đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        - Mức tăng giá khi lợi suất giảm $2\%$: $1147","2 - 1000 = +147","2$ triệu đồng ($+14","72\%$).
        - Mức giảm giá khi lợi suất tăng $2\%$: $1000 - 877","1 = 122","9$ triệu đồng ($-12","29\%$).
        Rõ ràng $|+147","2| > |-122","9|$. Đây chính là biểu hiện cốt lõi của tính chất lồi (Convexity) có lợi cho nhà đầu tư trái phiếu.
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 2
#ds([Một công ty quản lý quỹ đang so sánh hai trái phiếu trên thị trường:
- Trái phiếu A: Mệnh giá $100$ triệu đồng, kỳ hạn $3$ năm, coupon $7\%$/năm trả hàng năm.
- Trái phiếu B: Mệnh giá $100$ triệu đồng, kỳ hạn $15$ năm, coupon $7\%$/năm trả hàng năm.
Hiện tại, cả hai trái phiếu đều có cùng mức lợi suất đáo hạn thị trường là $y = 8\%$/năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // So sánh thời lượng và độ nhạy
    rect((0.8, 0), (2.6, 1.8), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))
    content((1.7, 0.9), text(size: 7.5pt, fill: rgb("5b21b6"), weight: "bold")[Trái phiếu A ($3$ năm)\ $D approx 2","8$ năm\ Biến động nhẹ\ ])

    rect((3.2, 0), (5.0, 2.5), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((4.1, 1.25), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Trái phiếu B ($15$ năm)\ $D approx 9","2$ năm\ Biến động rất mạnh\ ])
  })
]
],
    (
        True([Hiện tại, cả hai trái phiếu đều đang được giao dịch dưới mệnh giá (Discount Bond).]),
        True([Thời lượng Macaulay của Trái phiếu A nhỏ hơn đáng kể so với Trái phiếu B.]),
        True([Khi lợi suất thị trường tăng thêm $1\%$/năm, Trái phiếu B sẽ bị giảm giá với tỷ lệ phần trăm mạnh hơn nhiều so với Trái phiếu A.]),
        False([Nếu nhà quản lý quỹ dự báo rằng lãi suất thị trường sắp bước vào chu kỳ tăng mạnh, chiến lược tối ưu là dồn vốn mua Trái phiếu B.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Vì lãi suất coupon của cả hai trái phiếu ($7\%$) đều nhỏ hơn lợi suất yêu cầu ($8\%$), nên cả hai đều bán chiết khấu dưới mệnh giá $100$ triệu đồng.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Kỳ hạn càng dài thì các dòng tiền càng nằm xa trong tương lai, làm tăng thời lượng Macaulay ($D_A approx 2","8$ năm trong khi $D_B approx 9","2$ năm).
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Độ nhạy giá theo lãi suất tỷ lệ thuận với Thời lượng điều chỉnh $D^*$:
        $ (Delta P) / P approx - D^* dot Delta y $
        Vì $D_B^* > D_A^*$ nhiều lần nên Trái phiếu B sẽ giảm giá sâu hơn nhiều khi lãi suất tăng.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Khi lãi suất thị trường tăng mạnh, trái phiếu kỳ hạn dài (như Trái phiếu B) sẽ giảm giá thảm khốc nhất. Do đó, nếu dự báo lãi suất tăng, nhà quản lý quỹ phải rút ngắn thời lượng danh mục (bán Trái phiếu B, mua Trái phiếu ngắn hạn A hoặc giữ tiền mặt).
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#ds([Một quỹ hưu trí cam kết phải chi trả một khoản trợ cấp hưu trí duy nhất trị giá $2$ tỷ đồng ($2000$ triệu đồng) sau đúng $5$ năm nữa ($t = 5$). Mức lợi suất phi rủi ro trên thị trường hiện là $8\%$/năm. Quỹ dự định dùng kỹ thuật miễn dịch hóa dòng tiền (Cash flow Immunization) bằng cách đầu tư vào hai loại trái phiếu zero-coupon:
- Trái phiếu Z1: Kỳ hạn $3$ năm ($D_1 = 3$ năm).
- Trái phiếu Z2: Kỳ hạn $7$ năm ($D_2 = 7$ năm).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ cân bằng danh mục
    rect((0.5, 0), (2.2, 1.8), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    content((1.35, 0.9), text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[Trái phiếu Z1\ Kỳ hạn $3$ năm\ Tỷ trọng $50\%$\ ])

    content((2.5, 0.9), text(size: 10pt, weight: "bold")[$+$])

    rect((2.8, 0), (4.5, 1.8), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))
    content((3.65, 0.9), text(size: 7.5pt, fill: rgb("5b21b6"), weight: "bold")[Trái phiếu Z2\ Kỳ hạn $7$ năm\ Tỷ trọng $50\%$\ ])

    line((4.5, 0.9), (5.2, 0.9), mark: (end: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((5.6, 0.9), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$D = 5$])
  })
]
],
    (
        True([Giá trị hiện tại của nghĩa vụ nợ sau $5$ năm tại thời điểm hiện tại là khoảng $1361$ triệu đồng.]),
        True([Để miễn dịch hóa rủi ro lãi suất, thời lượng bình quân của danh mục trái phiếu phải bằng đúng $5$ năm.]),
        True([Để đạt được thời lượng $5$ năm, tỷ trọng phân bổ vốn đầu tư vào hai trái phiếu Z1 và Z2 phải chia đều $50\%$ - $50\%$.]),
        False([Nếu sau khi phân bổ, lãi suất thị trường đột ngột tăng mạnh lên $10\%$/năm thì giá trị tài sản tích lũy lúc đáo hạn sẽ không đủ trả nợ $2$ tỷ đồng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Giá trị hiện tại của khoản nợ:
        $ "PV"_"nợ" = 2000 / ((1 + 0","08)^5) = 2000 / (1","469328) approx 1361","17 " (triệu đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Khoản nợ trả tại mốc 5 năm có thời lượng $D_"nợ" = 5$ năm. Theo điều kiện miễn dịch hóa Redington:
        $ D_"danh mục" = D_"nợ" = 5 " năm" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Gọi $w$ là tỷ trọng đầu tư vào Z1, thì tỷ trọng vào Z2 là $1 - w$:
        $ D_"danh mục" = w dot D_1 + (1 - w) dot D_2 = 3 w + 7(1 - w) = 7 - 4 w $
        Để $D_"danh mục" = 5$:
        $ 7 - 4 w = 5 <==> 4 w = 2 <==> w = 0","5 = 50\% $
        Vậy tỷ trọng đầu tư vào mỗi trái phiếu đúng bằng $50\%$.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Chiến lược miễn dịch hóa đã khóa chặt lợi suất và triệt tiêu tác động rủi ro của lãi suất. Cho dù lãi suất tăng hay giảm, mức tăng/giảm giá tài sản sẽ được bù trừ hoàn hảo bởi mức tăng/giảm lãi tái đầu tư, đảm bảo đúng 5 năm sau quỹ tích lũy tối thiểu đạt $2$ tỷ đồng.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#ds([Một công ty niêm yết phát hành Trái phiếu chuyển đổi (Convertible Bond) với mệnh giá $F = 100$ triệu đồng, kỳ hạn $5$ năm, lãi suất coupon $5\%$/năm. Hợp đồng cho phép người sở hữu được quyền chuyển đổi mỗi trái phiếu thành $2000$ cổ phiếu phổ thông của công ty tại bất kỳ thời điểm nào trước khi đáo hạn.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ chuyển đổi
    rect((0.5, 0), (2.2, 1.8), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((1.35, 0.9), text(size: 7.5pt, fill: rgb("334155"), weight: "bold")[Trái phiếu\ $100$ triệu\ Coupon $5\%$\ ])

    line((2.2, 0.9), (3.6, 0.9), mark: (end: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((2.9, 1.2), text(size: 7.5pt, fill: rgb("047857"))[Chuyển đổi])

    rect((3.6, 0), (5.5, 1.8), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((4.55, 0.9), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[$2000$ cổ phiếu\ Giá chuyển đổi\ $50000$ đ/cp\ ])
  })
]
],
    (
        True([Giá chuyển đổi danh nghĩa của mỗi cổ phiếu theo điều khoản phát hành là $50000$ đồng/cổ phiếu.]),
        True([Khi giá cổ phiếu của công ty trên sàn chứng khoán tăng lên $60000$ đồng/cổ phiếu, giá trị chuyển đổi của trái phiếu là $120$ triệu đồng.]),
        True([Nếu giá cổ phiếu trên sàn giảm sâu xuống còn $30000$ đồng/cổ phiếu, nhà đầu tư không thực hiện chuyển đổi mà vẫn được hưởng giá sàn bảo vệ từ giá trị của trái phiếu thuần túy.]),
        False([Trái phiếu chuyển đổi có mức độ rủi ro thua lỗ vốn cao hơn so với việc đầu tư trực tiếp vào cổ phiếu thường của cùng công ty.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Giá chuyển đổi:
        $ P_"chuyển đổi" = ("Mệnh giá") / ("Tỷ lệ chuyển đổi") = (100000000) / (2000) = 50000 " (đồng/cổ phiếu)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Giá trị chuyển đổi:
        $ "Giá trị chuyển đổi" = 2000 dot 60000 = 120000000 " (đồng)" = 120 " (triệu đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Khi giá cổ phiếu thấp hơn giá chuyển đổi, người nắm giữ chỉ đơn giản giữ nguyên trái phiếu để nhận coupon $5\%$/năm và nhận lại $100$ triệu đồng mệnh giá lúc đáo hạn. Giá trị trái phiếu thuần túy này đóng vai trò như một "mặt sàn bảo hiểm rủi ro" (Bond floor).
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Trái phiếu chuyển đổi là công cụ lai ghép (Hybrid) có tính phòng thủ vượt trội: hưởng lợi vô hạn khi giá cổ phiếu tăng và được bảo vệ giá sàn khi cổ phiếu giảm. Do đó rủi ro thua lỗ vốn của nó thấp hơn nhiều so với việc nắm giữ cổ phiếu thường.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1
#tln([Một trái phiếu zero-coupon có mệnh giá $F = 100$ triệu đồng, thời hạn $3$ năm. Nếu mức lợi suất đáo hạn yêu cầu trên thị trường là $7\%$/năm, thị giá hiện tại của trái phiếu này là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])

    line((0.8, 0), (0.8, -1.1), mark: (end: "stealth"), stroke: 1.5pt + rgb("e11d48"))
    content((0.8, 0.35), text(size: 8pt)[$0$])
    content((0.8, -1.35), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$P = ?$])

    line((4.8, 0), (4.8, 1.4), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((4.8, -0.35), text(size: 8pt)[$3$])
    content((4.8, 1.65), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$100$ tr])
  })
]
],
    [81.6],
    loigiai: [
        #step([Lời giải chi tiết])
        Giá của trái phiếu zero-coupon:
        $ P = F / ((1 + y)^n) = 100 / ((1 + 0","07)^3) $

        Ta tính:
        $ (1","07)^3 = 1","225043 $
        $ P = 100 / (1","225043) approx 81","6298 " (triệu đồng)" $

        Làm tròn kết quả đến hàng phần mười: $81","6$ triệu đồng.

        Điền đáp số: *81.6*.
    ]
)

// TLN 2
#tln([Một nhà đầu tư mua một trái phiếu doanh nghiệp mệnh giá $500$ triệu đồng, thời hạn $4$ năm với lãi suất coupon cố định $8\%$/năm trả lãi vào cuối mỗi năm. Giả sử tổ chức phát hành thanh toán đầy đủ nợ gốc và lãi đúng hạn, tổng số tiền mặt (cả gốc và các đợt coupon) mà nhà đầu tư thực nhận được trong suốt $4$ năm là bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.8), fill: rgb("ede9fe"), stroke: 1.2pt + rgb("7c3aed"))
    content((2.8, 0.9), text(size: 8pt, fill: rgb("5b21b6"), weight: "bold")[Tổng tiền thu về:\ Gốc $500$ tr + $4$ lần coupon $40$ tr\ $= 660$ triệu đồng\ ])
  })
]
],
    [660],
    loigiai: [
        #step([Lời giải chi tiết])
        - Tiền lãi coupon nhận được mỗi năm:
        $ C = 500 dot 8\% = 40 " (triệu đồng/năm)" $

        - Tổng tiền coupon trong 4 năm:
        $ 40 dot 4 = 160 " (triệu đồng)" $

        - Tiền gốc nhận lại khi đáo hạn:
        $ F = 500 " (triệu đồng)" $

        - Tổng số tiền thực nhận:
        $ 160 + 500 = 660 " (triệu đồng)" $

        Điền đáp số: *660*.
    ]
)

// TLN 3
#tln([Một trái phiếu có mệnh giá $F = 100$ triệu đồng, kỳ hạn $2$ năm, lãi suất coupon $10\%$/năm trả lãi hàng năm. Biết lợi suất đáo hạn yêu cầu trên thị trường là $9\%$/năm. Giá trị thị trường hợp lý của trái phiếu này là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])

    line((2.0, 0), (2.0, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("4338ca"))
    content((2.0, -0.3), text(size: 8pt)[$1$])
    content((2.0, 1.2), text(size: 7.5pt)[$10$ tr])

    line((4.5, 0), (4.5, 1.6), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((4.5, -0.3), text(size: 8pt)[$2$])
    content((4.5, 1.8), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[$110$ tr])
  })
]
],
    [101.8],
    loigiai: [
        #step([Lời giải chi tiết])
        Giá trị trái phiếu kỳ hạn 2 năm:
        $ P = C / (1 + y) + (C + F) / ((1 + y)^2) $

        Thay số: $F = 100$, $C = 10$, $y = 9\% = 0","09$:
        $ P = 10 / (1","09) + (110) / (1","09^2) $
        $ 10 / (1","09) approx 9","1743 $
        $ 110 / (1","1881) approx 92","5848 $
        $ P = 9","1743 + 92","5848 = 101","7591 " (triệu đồng)" $

        Làm tròn kết quả đến hàng phần mười: $101","8$ triệu đồng.

        Điền đáp số: *101.8*.
    ]
)

// TLN 4
#tln([Một danh mục trái phiếu có Thời lượng điều chỉnh là $D^* = 5$ năm. Nếu lợi suất thị trường giảm bớt $0","6\%$ ($Delta y = -0","6\%$), giá trị của danh mục trái phiếu này sẽ tăng thêm bao nhiêu phần trăm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((1.0, 0), (4.5, 1.5), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("16a34a"))
    content((2.75, 0.75), text(size: 8pt, fill: rgb("166534"), weight: "bold")[Biến động giá: $(Delta P) / P approx - D^* dot Delta y$\ $= - 5 dot (-0","6\%) = +3\%$ tăng\ ])
  })
]
],
    [3],
    loigiai: [
        #step([Lời giải chi tiết])
        Theo công thức thời lượng điều chỉnh:
        $ (Delta P) / P approx - D^* dot Delta y $

        Thay số: $D^* = 5$, $Delta y = -0","6\% = -0","006$:
        $ (Delta P) / P approx - 5 dot (-0","006) = + 0","03 = + 3\% $

        Điền đáp số: *3*.
    ]
)

// TLN 5
#tln([Một trái phiếu vĩnh cửu cam kết chi trả coupon cố định $15$ triệu đồng vào cuối mỗi năm cho người sở hữu mãi mãi. Nếu lợi suất yêu cầu của thị trường đối với trái phiếu này là $7","5\%$/năm, thị giá hiện tại của trái phiếu vĩnh cửu là bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((1.0, 0), (4.5, 1.5), fill: rgb("dbeafe"), stroke: 1.2pt + rgb("2563eb"))
    content((2.75, 0.75), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Trái phiếu vĩnh cửu: $P = C / y$\ $= (15) / (0","075) = 200$ triệu đồng\ ])
  })
]
],
    [200],
    loigiai: [
        #step([Lời giải chi tiết])
        Công thức định giá trái phiếu vĩnh cửu:
        $ P = C / y $

        Thay số: $C = 15$ triệu, $y = 7","5\% = 0","075$:
        $ P = 15 / (0","075) = 200 " (triệu đồng)" $

        Điền đáp số: *200*.
    ]
)

// TLN 6
#tln([Một trái phiếu zero-coupon có mệnh giá $F = 100$ triệu đồng, thời hạn đáo hạn là đúng $2$ năm. Hiện tại trên thị trường, trái phiếu này đang được bán với giá $84$ triệu đồng. Lợi suất đáo hạn (YTM) hàng năm của trái phiếu là bao nhiêu phần trăm? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])

    line((1.0, 0), (1.0, -1.0), mark: (end: "stealth"), stroke: 1.5pt + rgb("e11d48"))
    content((1.0, 0.35), text(size: 8pt)[$0$])
    content((1.0, -1.25), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$P = 84$ tr])

    line((4.5, 0), (4.5, 1.4), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((4.5, -0.35), text(size: 8pt)[$2$])
    content((4.5, 1.65), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$100$ tr])
  })
]
],
    [9.1],
    loigiai: [
        #step([Lời giải chi tiết])
        Mối quan hệ giữa giá và lợi suất của trái phiếu zero-coupon:
        $ P = F / ((1 + y)^2) ==> (1 + y)^2 = F / P ==> y = sqrt(F / P) - 1 $

        Thay số: $F = 100$ triệu, $P = 84$ triệu:
        $ (1 + y)^2 = (100) / (84) approx 1","190476 $
        $ 1 + y = sqrt(1","190476) approx 1","091089 $
        $ y approx 0","091089 = 9","1089\% $

        Làm tròn kết quả đến hàng phần mười: $9","1\%$.

        Điền đáp số: *9.1*.
    ]
)

]

#make-questions()
