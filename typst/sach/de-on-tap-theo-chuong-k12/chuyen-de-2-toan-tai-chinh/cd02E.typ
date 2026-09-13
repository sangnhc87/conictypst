#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("e11d48")

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH",
  exam-title: "CHỦ ĐỀ 2E: LẬP KẾ HOẠCH TÀI CHÍNH CÁ NHÂN & QUỸ HƯU TRÍ (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "515",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một người đặt mục tiêu độc lập tài chính và nghỉ hưu sớm (phong trào FIRE). Dự kiến sau khi nghỉ hưu, người này cần chi phí sinh hoạt là $25$ triệu đồng mỗi tháng ($300$ triệu đồng mỗi năm). Theo Quy tắc $4\%$ nổi tiếng (Trinity Study), một người có thể rút an toàn $4\%$ giá trị danh mục đầu tư ban đầu vào mỗi năm (có điều chỉnh theo lạm phát) mà danh mục gần như không bao giờ cạn kiệt trong ít nhất $30$ năm. Để đạt được mục tiêu tự do tài chính trên, giá trị quỹ tài sản tích lũy tối thiểu mà người đó cần có lúc bắt đầu nghỉ hưu là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cột quỹ tích lũy FIRE
    rect((0.5, 0), (2.2, 2.7), fill: rgb("fda4af").lighten(50%), stroke: 1.2pt + rgb("e11d48"))
    content((1.35, 1.35), text(size: 8pt, fill: rgb("9f1239"), weight: "bold")[Quỹ FIRE\ $7","5$ tỷ đồng\ ])

    // Mũi tên rút 4% mỗi năm
    line((2.2, 2.0), (3.8, 2.0), mark: (end: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((3.0, 2.3), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[Rút $4\%$/"năm"])

    rect((3.8, 1.4), (5.5, 2.6), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((4.65, 2.0), text(size: 8pt, fill: rgb("166534"), weight: "bold")[Chi tiêu\ $300$ tr/"năm"\ ($25$ tr/"tháng")\ ])
  })
]
],
    (
        True([$7","5$ tỷ đồng.]),
        [$6","0$ tỷ đồng.],
        [$9","0$ tỷ đồng.],
        [$5","5$ tỷ đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo Quy tắc $4\%$ (The 4% Rule):
        Nếu tỷ lệ rút tiền hàng năm an toàn là $4\%$ danh mục, thì quy mô quỹ hưu trí cần thiết được tính bằng:
        $ "Quỹ FIRE" = ("Chi phí sinh hoạt hàng năm") / (4\%) = ("Chi phí hàng năm") dot 25 $

        #step([Lời giải chi tiết])
        Chi phí sinh hoạt hàng năm của người đó:
        $ "Chi phí hàng năm" = 25 " triệu" dot 12 = 300 " (triệu đồng)" $

        Số tiền tối thiểu cần tích lũy trong quỹ hưu trí:
        $ "Quỹ FIRE" = 300 / (4\%) = 300 / (0","04) = 7500 " (triệu đồng)" $

        Đổi sang đơn vị tỷ đồng:
        $ 7500 " triệu đồng" = 7","5 " tỷ đồng" $
    ]
)

// TN 2
#tn([Một cặp vợ chồng trẻ áp dụng quy tắc phân bổ ngân sách $50/30/20$: $50\%$ thu nhập cho nhu cầu thiết yếu, $30\%$ cho sở thích cá nhân và $20\%$ dành cho tích lũy tiết kiệm. Tổng thu nhập ròng hàng tháng của hai vợ chồng là $30$ triệu đồng. Để phòng ngừa rủi ro mất việc hoặc ốm đau, cặp vợ chồng muốn thiết lập một "Quỹ khẩn cấp" tương đương đúng $6$ tháng chi phí sinh hoạt thiết yếu. Nếu toàn bộ phần tiền tích lũy $20\%$ hàng tháng được dành trọn vẹn để xây dựng quỹ khẩn cấp này, thì hai vợ chồng cần bao nhiêu tháng để hoàn thành mục tiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ tròn ngân sách
    circle((1.5, 1.3), radius: 1.2, fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    // Nửa dưới 50%
    line((0.3, 1.3), (2.7, 1.3), stroke: 1pt + rgb("64748b"))
    content((1.5, 0.7), text(size: 7.5pt, fill: rgb("0369a1"), weight: "bold")[Thiết yếu: $50\%$\ ($15$ tr)\ ])
    content((0.9, 1.8), text(size: 7pt, fill: rgb("d97706"), weight: "bold")[Sở thích\ $30\%$ ($9$ tr)\ ])
    content((2.1, 1.8), text(size: 7pt, fill: rgb("16a34a"), weight: "bold")[Tích lũy\ $20\%$ ($6$ tr)\ ])

    // Quỹ khẩn cấp
    rect((3.5, 0.4), (5.5, 2.2), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    content((4.5, 1.3), text(size: 8pt, fill: rgb("1d4ed8"), weight: "bold")[Quỹ khẩn cấp\ $6$ tháng thiết yếu\ $= 90$ triệu đồng\ ($15$ tháng)\ ])
  })
]
],
    (
        True([$15$ tháng.]),
        [$12$ tháng.],
        [$18$ tháng.],
        [$10$ tháng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính chi phí thiết yếu hàng tháng ($50\%$ thu nhập).
        - Bước 2: Tính quy mô Quỹ khẩn cấp ($6$ tháng chi phí thiết yếu).
        - Bước 3: Tính số tiền tích lũy mỗi tháng ($20\%$ thu nhập) và chia để tìm số tháng.

        #step([Lời giải chi tiết])
        Với tổng thu nhập $30$ triệu đồng/"tháng":
        - Chi phí sinh hoạt thiết yếu mỗi tháng ($50\%$):
        $ 30 dot 50\% = 15 " (triệu đồng/tháng)" $

        - Số tiền cần có trong Quỹ khẩn cấp ($6$ tháng):
        $ "Quỹ khẩn cấp" = 15 dot 6 = 90 " (triệu đồng)" $

        - Số tiền tích lũy mỗi tháng ($20\%$):
        $ "Tích lũy" = 30 dot 20\% = 6 " (triệu đồng/tháng)" $

        - Thời gian cần thiết để gom đủ quỹ khẩn cấp:
        $ "Thời gian" = 90 / 6 = 15 " (tháng)" $
    ]
)

// TN 3
#tn([Khi vừa bước sang tuổi $60$, một người chính thức nghỉ hưu với tài sản tích lũy trong quỹ hưu trí cá nhân là $3$ tỷ đồng ($3000$ triệu đồng). Quỹ này được gửi tại ngân hàng với mức lãi suất ổn định $6\%$/"năm" ($0","5\%$/"tháng"). Người đó lên kế hoạch rút đều đặn một khoản tiền cố định vào cuối mỗi tháng trong suốt $25$ năm ($300$ tháng) cho đến khi số dư quỹ hưu trí về đúng bằng $0$. Khoản tiền mà người đó có thể rút ra chi tiêu mỗi tháng là khoảng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3), text(size: 8pt)[Quỹ (tr)])

    circle((0, 2.5), radius: 0.08, fill: rgb("e11d48"))
    content((-0.7, 2.5), text(size: 8pt, weight: "bold")[$3$ tỷ])

    // Đường quỹ cạn dần sau 300 tháng
    bezier((0, 2.5), (5.2, 0), (2.5, 1.6), stroke: 1.5pt + rgb("e11d48"))

    circle((5.2, 0), radius: 0.08, fill: rgb("047857"))
    content((5.2, -0.35), text(size: 8pt)[$300$ tháng ($25$ năm)])
    content((3.5, 1.8), text(size: 8pt, fill: rgb("047857"), weight: "bold")[Rút đều: $R approx 19","33$ tr/"tháng"])
  })
]
],
    (
        True([Khoảng $19","33$ triệu đồng.]),
        [Khoảng $15","00$ triệu đồng.],
        [Khoảng $22","40$ triệu đồng.],
        [Khoảng $10","00$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là bài toán niên kim chiết khấu dòng tiền rút vốn:
        Quỹ hưu trí ban đầu $"PV" = 3000$ triệu đồng chính là giá trị hiện tại của $n = 300$ khoản rút tiền đều $R$:
        $ "PV" = R dot (1 - (1 + r)^(-n)) / r ==> R = "PV" dot r / (1 - (1 + r)^(-n)) $

        #step([Lời giải chi tiết])
        Với $"PV" = 3000$ triệu, $r = 0","5\% = 0","005$, $n = 300$ tháng:
        $ (1 + 0","005)^(-300) = (1","005)^(-300) approx 0","225501 $
        $ 1 - 0","225501 = 0","774499 $
        $ R = 3000 dot (0","005) / (0","774499) = 15 / (0","774499) approx 19","367 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $19","33$ triệu đồng/"tháng".
    ]
)

// TN 4
#tn([Một cán bộ hưu trí nhận lương hưu cố định là $12$ triệu đồng mỗi tháng. Giả định tỷ lệ lạm phát bình quân của nền kinh tế duy trì ở mức $3","5\%$/"năm" trong suốt thời gian dài. Sau $15$ năm, sức mua thực tế của số tiền lương hưu $12$ triệu đồng đó chỉ còn tương đương với bao nhiêu tiền tại thời điểm hiện tại?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 2.8), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])
    content((-0.4, 2.8), text(size: 8pt)[Sức mua])

    // Sức mua danh nghĩa 12 tr
    line((0, 2.2), (5.0, 2.2), stroke: (dash: "densely-dashed", paint: rgb("94a3b8")))
    content((5.0, 2.4), text(size: 7.5pt, fill: rgb("64748b"))[Danh nghĩa: $12$ tr])

    // Sức mua thực tế giảm dần
    bezier((0, 2.2), (5.0, 0.9), (2.5, 1.3), stroke: 1.5pt + rgb("e11d48"))
    content((0, -0.3), text(size: 8pt)[$0$])
    content((5.0, -0.3), text(size: 8pt)[$15$])
    circle((5.0, 0.9), radius: 0.08, fill: rgb("e11d48"))
    content((4.8, 0.55), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[Thực tế: $7","16$ tr])
  })
]
],
    (
        True([Khoảng $7","16$ triệu đồng.]),
        [Khoảng $9","25$ triệu đồng.],
        [Khoảng $5","80$ triệu đồng.],
        [Khoảng $8","40$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Dưới tác động của lạm phát $i$ mỗi năm, sức mua thực tế ($"PV"$) sau $n$ năm của một số tiền danh nghĩa $M$ được xác định theo công thức chiết khấu lạm phát:
        $ "PV" = M / ((1 + i)^n) $

        #step([Lời giải chi tiết])
        Với $M = 12$ triệu đồng, $i = 3","5\% = 0","035$, $n = 15$ năm:
        $ (1 + 0","035)^15 = (1","035)^15 approx 1","675349 $
        $ "PV" = 12 / (1","675349) approx 7","1627 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $7","16$ triệu đồng.
    ]
)

// TN 5
#tn([Khi đứa con đầu lòng vừa chào đời ($t = 0$), cha mẹ lập một quỹ tiết kiệm giáo dục để chuẩn bị chi phí cho $4$ năm học đại học của con khi con tròn $18$ tuổi. Mục tiêu tài chính là có sẵn $600$ triệu đồng tại thời điểm con tròn $18$ tuổi. Biết quỹ tích lũy đạt tỷ suất sinh lời bình quân $8\%$/"năm" theo thể thức lãi kép hàng năm. Nếu cha mẹ gửi một số tiền cố định vào cuối mỗi năm liên tục trong $18$ năm, thì số tiền cần gửi đều đặn mỗi năm xấp xỉ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Tuổi])
    content((-0.4, 3), text(size: 8pt)[Quỹ (tr)])

    content((0, -0.3), text(size: 8pt)[$0$])
    content((4.8, -0.3), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$18$ tuổi])

    // Đường tích lũy tăng trưởng
    bezier((0, 0), (4.8, 2.5), (2.4, 0.6), stroke: 1.5pt + rgb("047857"))
    circle((4.8, 2.5), radius: 0.08, fill: rgb("047857"))
    content((4.8, 2.8), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$600$ triệu])

    content((2.2, 1.8), text(size: 7.5pt, fill: rgb("e11d48"))[Mỗi năm nộp $C approx 16","02$ tr])
  })
]
],
    (
        True([Khoảng $16","02$ triệu đồng/"năm".]),
        [Khoảng $25","50$ triệu đồng/"năm".],
        [Khoảng $33","33$ triệu đồng/"năm".],
        [Khoảng $12","80$ triệu đồng/"năm".]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là bài toán lập quỹ chìm tích lũy (Sinking Fund):
        Để đạt được giá trị tương lai $"FV"$ sau $n$ năm với lãi suất $r$/"năm", số tiền cần gửi đều đặn cuối mỗi năm $C$ là:
        $ C = "FV" dot r / ((1 + r)^n - 1) $

        #step([Lời giải chi tiết])
        Với $"FV" = 600$ triệu, $r = 8\% = 0","08$, $n = 18$ năm:
        $ (1 + 0","08)^18 = (1","08)^18 approx 3","996019 $
        $ (1","08)^18 - 1 = 2","996019 $
        $ C = 600 dot (0","08) / (2","996019) = 48 / (2","996019) approx 16","0213 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $16","02$ triệu đồng/"năm" (tương đương khoảng $1","34$ triệu đồng/"tháng").
    ]
)

// TN 6
#tn([Khi kết thúc hợp đồng lao động trước hạn, một chuyên gia tài chính được công ty đề xuất hai phương án trợ cấp thôi việc:
- Phương án A: Nhận một lần ngay số tiền mặt $1","2$ tỷ đồng ($1200$ triệu đồng).
- Phương án B: Nhận đều đặn mỗi tháng $12$ triệu đồng vào cuối mỗi tháng trong vòng $15$ năm ($180$ tháng).
Biết lãi suất chiết khấu an toàn cho dòng tiền cá nhân là $7\%$/"năm" ($approx 0","583\%$/"tháng"). So sánh giá trị hiện tại ($"PV"$) của hai phương án, nhận định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cột Phương án A
    rect((0.8, 0), (2.2, 2.0), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((1.5, 1.0), text(size: 8pt, fill: rgb("334155"), weight: "bold")[Phương án A\ $1200$ tr\ ($1","2$ tỷ)\ ])

    // Cột Phương án B
    rect((3.2, 0), (4.6, 2.5), fill: rgb("bbf7d0"), stroke: 1pt + rgb("16a34a"))
    content((3.9, 1.25), text(size: 8pt, fill: rgb("166534"), weight: "bold")[Phương án B\ $"PV" approx 1335$ tr\ ($1","335$ tỷ)\ ])

    content((2.7, -0.4), text(size: 8.5pt, weight: "bold")[So sánh giá trị hiện tại chiết khấu ($"PV"$)])
  })
]
],
    (
        True([Phương án B có lợi hơn Phương án A khoảng $135$ triệu đồng.]),
        [Phương án A có lợi hơn Phương án B khoảng $80$ triệu đồng.],
        [Hai phương án có giá trị tài chính hoàn toàn tương đương nhau.],
        [Phương án B có lợi hơn Phương án A tới $960$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Để so sánh hai phương án nhận tiền ở các mốc thời gian khác nhau, ta quy đổi dòng tiền của Phương án B về giá trị hiện tại ($"PV"$) tại thời điểm $t = 0$:
        $ "PV"_B = C dot (1 - (1 + r)^(-n)) / r $

        #step([Lời giải chi tiết])
        Với $C = 12$ triệu đồng/"tháng", $n = 180$ tháng, lãi suất tháng:
        $ r = (0","07) / 12 approx 0","0058333 $
        Ta tính toán:
        $ (1 + r)^(-180) approx 0","350438 $
        $ 1 - 0","350438 = 0","649562 $
        $ "PV"_B = 12 dot (0","649562) / (0","0058333) approx 1335","07 " (triệu đồng)" $

        So sánh với Phương án A ($"PV"_A = 1200$ triệu đồng):
        $ "PV"_B - "PV"_A = 1335","07 - 1200 approx 135","07 " (triệu đồng)" $

        Như vậy, Phương án B có giá trị hiện tại cao hơn Phương án A khoảng $135$ triệu đồng.
    ]
)

// TN 7
#tn([Hai người bạn cùng tuổi quyết định đầu tư tích lũy vào cùng một quỹ cổ phiếu với tỷ suất sinh lời bình quân $10\%$/"năm" trong suốt $30$ năm. Tuy nhiên, hai người chọn hai quỹ đầu tư khác nhau:
- Quỹ X (Quỹ chỉ số mô phỏng thụ động): Có phí quản lý rất thấp là $0","2\%$/"năm", đem lại tỷ suất sinh lời thực nhận là $9","8\%$/"năm".
- Quỹ Y (Quỹ chủ động giao dịch nhiều): Có phí quản lý cao là $2","0\%$/"năm", đem lại tỷ suất sinh lời thực nhận là $8","0\%$/"năm".
Nếu mỗi năm hai người đều đặn nộp $10$ triệu đồng vào cuối năm, thì sau $30$ năm, số tiền tích lũy của người đầu tư vào Quỹ X vượt trội hơn người đầu tư vào Quỹ Y khoảng bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])
    content((-0.4, 3.2), text(size: 8pt)[Tài sản (tr)])

    // Quỹ X: 9.8%/"năm" -> 1584 tr
    bezier((0, 0), (5.0, 2.7), (2.5, 0.8), stroke: 1.5pt + rgb("047857"))
    content((5.0, 2.9), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[Quỹ X ($1584$ tr)])

    // Quỹ Y: 8.0%/"năm" -> 1133 tr
    bezier((0, 0), (5.0, 1.8), (2.5, 0.6), stroke: 1.5pt + rgb("e11d48"))
    content((5.0, 1.5), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[Quỹ Y ($1133$ tr)])

    // Khoảng cách chênh lệch 451 tr
    line((5.0, 1.8), (5.0, 2.7), mark: (both: "stealth"), stroke: 1pt + rgb("7c3aed"))
    content((3.8, 2.3), text(size: 7.5pt, fill: rgb("7c3aed"), weight: "bold")[Chênh $451$ triệu])
  })
]
],
    (
        True([Khoảng $451$ triệu đồng.]),
        [Khoảng $120$ triệu đồng.],
        [Khoảng $280$ triệu đồng.],
        [Khoảng $540$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tính giá trị tương lai của niên kim gửi đều $C = 10$ triệu đồng/"năm" sau $n = 30$ năm với hai mức lãi suất thực tế khác nhau:
        $ "FV" = C dot ((1 + r)^n - 1) / r $

        #step([Lời giải chi tiết])
        - Đối với Quỹ X ($r_X = 9","8\% = 0","098$):
        $ (1 + 0","098)^30 = (1","098)^30 approx 16","522302 $
        $ "FV"_X = 10 dot (15","522302) / (0","098) approx 1583","91 " (triệu đồng)" $

        - Đối với Quỹ Y ($r_Y = 8","0\% = 0","08$):
        $ (1 + 0","08)^30 = (1","08)^30 approx 10","062657 $
        $ "FV"_Y = 10 dot (9","062657) / (0","08) approx 1132","83 " (triệu đồng)" $

        - Mức chênh lệch do phí quản lý gây ra sau 30 năm:
        $ Delta "FV" = "FV"_X - "FV"_Y = 1583","91 - 1132","83 = 451","08 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $451$ triệu đồng (khoảng cách cực lớn chiếm gần một phần ba tổng tài sản tích lũy).
    ]
)

// TN 8
#tn([Một người đang nợ $3$ khoản nợ tiêu dùng cá nhân:
- Khoản nợ 1: Số dư $10$ triệu đồng, lãi suất $24\%$/"năm" (thẻ tín dụng).
- Khoản nợ 2: Số dư $50$ triệu đồng, lãi suất $12\%$/"năm" (vay tín chấp).
- Khoản nợ 3: Số dư $20$ triệu đồng, lãi suất $18\%$/"năm" (vay trả góp mua đồ điện tử).
Theo chiến lược trả nợ tối ưu chi phí tài chính (phương pháp Debt Avalanche - Tuyết lở), sau khi đã thanh toán mức tối thiểu bắt buộc cho cả 3 khoản nợ, người này nên ưu tiên dồn toàn bộ nguồn tiền nhàn rỗi còn lại để trả dứt điểm khoản nợ nào trước tiên?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Các cột lãi suất
    rect((0.5, 0), (1.8, 2.4), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("dc2626"))
    content((1.15, 1.2), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Nợ 1\ $10$ tr\ $24\%$/"năm"\ ])

    rect((2.2, 0), (3.5, 1.8), fill: rgb("ffedd5"), stroke: 1pt + rgb("ea580c"))
    content((2.85, 0.9), text(size: 7.5pt, fill: rgb("9a3412"), weight: "bold")[Nợ 3\ $20$ tr\ $18\%$/"năm"\ ])

    rect((3.9, 0), (5.2, 1.2), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((4.55, 0.6), text(size: 7.5pt, fill: rgb("334155"), weight: "bold")[Nợ 2\ $50$ tr\ $12\%$/"năm"\ ])

    content((2.85, -0.4), text(size: 8pt, weight: "bold")[Thứ tự ưu tiên: Nợ 1 ($24\%$) ==> Nợ 3 ($18\%$) ==> Nợ 2 ($12\%$)])
  })
]
],
    (
        True([Khoản nợ 1 (thẻ tín dụng).]),
        [Khoản nợ 2 (vay tín chấp).],
        [Khoản nợ 3 (mua đồ điện tử).],
        [Chia đều số tiền nhàn rỗi cho cả 3 khoản nợ.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Phương pháp Debt Avalanche (Tuyết lở):
        Ưu tiên thanh toán khoản nợ có lãi suất cao nhất trước để giảm thiểu tối đa tổng số tiền lãi phát sinh (chi phí cơ hội tài chính cao nhất).
        - Phương pháp Debt Snowball (Quả cầu tuyết):
        Ưu tiên thanh toán khoản nợ có số dư nhỏ nhất trước nhằm tạo động lực tâm lý.

        #step([Lời giải chi tiết])
        Xét lãi suất của 3 khoản nợ:
        - Khoản nợ 1 có lãi suất cao nhất ($24\%$/"năm").
        - Khoản nợ 3 có lãi suất tiếp theo ($18\%$/"năm").
        - Khoản nợ 2 có lãi suất thấp nhất ($12\%$/"năm").

        Theo nguyên lý toán tài chính của phương pháp Debt Avalanche, khoản nợ 1 tạo ra chi phí lãi vay lớn nhất trên mỗi đồng dư nợ. Do đó, việc dồn tiền trả hết khoản nợ 1 trước sẽ giúp người vay tiết kiệm được nhiều tiền lãi nhất và thoát nợ nhanh nhất về mặt toán học.
    ]
)

// TN 9
#tn([Một người dự định sau $20$ năm nữa sẽ nghỉ hưu và muốn có một dòng thu nhập thụ động rút ra là $20$ triệu đồng vào cuối mỗi tháng trong suốt $20$ năm tuổi già ($240$ tháng). Lãi suất danh mục hưu trí an toàn trong giai đoạn tuổi già là $6\%$/"năm" ($0","5\%$/"tháng"). Để tài trợ cho mục tiêu này, hiện tại người đó bắt đầu gửi tiết kiệm đều đặn vào cuối mỗi tháng liên tục trong $20$ năm đi làm ($240$ tháng) với tỷ suất sinh lời giai đoạn tích lũy là $9\%$/"năm" ($0","75\%$/"tháng"). Số tiền người đó cần gửi tiết kiệm mỗi tháng trong thời gian đi làm là khoảng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Thời gian])

    // Giai đoạn tích lũy: 0 -> 240 tháng
    rect((0.2, 0), (2.8, 1.8), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    content((1.5, 0.9), text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[Giai đoạn tích lũy\ $240$ tháng ($0","75\%$)\ Gửi $C approx 4","19$ tr/th\ ])
    content((0.2, -0.3), text(size: 7.5pt)[$t = 0$])
    content((2.8, -0.3), text(size: 7.5pt)[$240$ th])

    // Giai đoạn rút tiền: 240 -> 480 tháng
    rect((3.0, 0), (5.6, 1.8), fill: rgb("fce7f3"), stroke: 1pt + rgb("db2777"))
    content((4.3, 0.9), text(size: 7.5pt, fill: rgb("9d174d"), weight: "bold")[Giai đoạn nghỉ hưu\ $240$ tháng ($0","5\%$)\ Rút $20$ tr/"tháng"\ ])
    content((5.6, -0.3), text(size: 7.5pt)[$480$ th])
  })
]
],
    (
        True([Khoảng $4","19$ triệu đồng/"tháng".]),
        [Khoảng $6","80$ triệu đồng/"tháng".],
        [Khoảng $8","50$ triệu đồng/"tháng".],
        [Khoảng $2","95$ triệu đồng/"tháng".]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính số tiền cần có tại thời điểm nghỉ hưu ($t = 240$ tháng), chính là giá trị hiện tại của chuỗi rút tiền 20 năm:
        $ "PV"_"hưu" = 20 dot (1 - (1 + r_2)^(-240)) / r_2 $
        - Bước 2: Số tiền gửi tiết kiệm hàng tháng $C$ trong 240 tháng đầu để đạt giá trị tương lai $"FV" = "PV"_"hưu"$:
        $ C = "PV"_"hưu" dot r_1 / ((1 + r_1)^240 - 1) $

        #step([Lời giải chi tiết])
        1. Tính quỹ cần có lúc nghỉ hưu với $r_2 = 0","5\% = 0","005$:
        $ (1 + 0","005)^(-240) = (1","005)^(-240) approx 0","302096 $
        $ 1 - 0","302096 = 0","697904 $
        $ "PV"_"hưu" = 20 dot (0","697904) / (0","005) = 20 dot 139","5808 approx 2791","62 " (triệu đồng)" $

        2. Tính số tiền $C$ cần gửi hàng tháng với $r_1 = 0","75\% = 0","0075$:
        $ (1 + 0","0075)^240 = (1","0075)^240 approx 6","009152 $
        $ (1","0075)^240 - 1 = 5","009152 $
        $ C = 2791","62 dot (0","0075) / (5","009152) = (20","93715) / (5","009152) approx 4","180 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $4","19$ triệu đồng/"tháng".
    ]
)

// TN 10
#tn([Một người nhận thừa kế số tiền $2$ tỷ đồng vào năm $40$ tuổi. Người đó quyết định đem toàn bộ số tiền này đầu tư vào quỹ cổ phiếu đạt tỷ suất sinh lời $11\%$/"năm" trong $20$ năm cho đến khi $60$ tuổi mà không cần nộp thêm đồng nào. Trong khi đó, một người bạn cùng tuổi không có vốn ban đầu, bắt đầu gửi đều đặn mỗi năm một khoản tiền $C$ vào cuối mỗi năm với cùng tỷ suất sinh lời $11\%$/"năm" trong $20$ năm. Để tích lũy được khối tài sản bằng đúng người nhận thừa kế ở tuổi $60$, người bạn đó phải gửi đều đặn mỗi năm bao nhiêu tiền?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Người 1: Lãi kép 1 lần 2 tỷ
    rect((0.8, 0), (2.4, 2.3), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))
    content((1.6, 1.15), text(size: 7.5pt, fill: rgb("5b21b6"), weight: "bold")[Thừa kế $2$ tỷ\ Lãi kép $20$ năm\ $"FV" approx 16","12$ tỷ\ ])

    // Người 2: Niên kim gửi đều C
    rect((3.4, 0), (5.0, 2.3), fill: rgb("fef08a").lighten(50%), stroke: 1pt + rgb("ca8a04"))
    content((4.2, 1.15), text(size: 7.5pt, fill: rgb("854d0e"), weight: "bold")[Gửi đều $C$/"năm"\ $20$ năm liên tục\ $C approx 250$ tr/"năm"\ ])

    content((2.9, -0.4), text(size: 8.5pt, weight: "bold")[Cùng đạt giá trị $"FV"$ ở tuổi $60$])
  })
]
],
    (
        True([Khoảng $250$ triệu đồng/"năm".]),
        [Khoảng $100$ triệu đồng/"năm".],
        [Khoảng $320$ triệu đồng/"năm".],
        [Khoảng $180$ triệu đồng/"năm".]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị tương lai của số vốn thừa kế $2$ tỷ đồng sau 20 năm:
        $ "FV" = 2000 dot (1 + r)^20 $
        Số tiền gửi đều hàng năm $C$ để đạt cùng giá trị tương lai:
        $ "FV" = C dot ((1 + r)^20 - 1) / r ==> C = "FV" dot r / ((1 + r)^20 - 1) = 2000 dot (1 + r)^20 dot r / ((1 + r)^20 - 1) $

        #step([Lời giải chi tiết])
        Với $r = 11\% = 0","11$, $n = 20$ năm:
        $ (1 + 0","11)^20 = (1","11)^20 approx 8","062312 $
        $ "FV" = 2000 dot 8","062312 approx 16124","62 " (triệu đồng)" $

        Số tiền $C$ cần nộp mỗi năm:
        $ C = 16124","62 dot (0","11) / (8","062312 - 1) = (1773","71) / (7","062312) approx 251","15 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $250$ triệu đồng/"năm" (hơn $20$ triệu đồng mỗi tháng).
    ]
)

// TN 11
#tn([Một nhân viên văn phòng $28$ tuổi bắt đầu tích lũy $5$ triệu đồng mỗi tháng vào một danh mục đầu tư cân bằng với lợi suất kỳ vọng $8\%$/"năm" ($approx 0","643\%$/"tháng"). Mỗi năm, nhờ được tăng lương, nhân viên này quyết định tăng số tiền gửi tiết kiệm thêm $5\%$ so với năm trước đó. Đây là mô hình niên kim tăng trưởng (Growing Annuity). Sau $3$ năm đầu tiên ($36$ tháng), tổng số tiền gốc mà nhân viên này đã thực nộp vào quỹ tích lũy là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Các bậc thang đóng tiền
    rect((0.5, 0), (1.8, 1.2), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((1.15, 0.6), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Năm 1\ $5$ tr/th\ ($60$ tr)\ ])

    rect((2.1, 0), (3.4, 1.5), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((2.75, 0.75), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Năm 2 (+5%)\ $5","25$ tr/th\ ($63$ tr)\ ])

    rect((3.7, 0), (5.0, 1.8), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((4.35, 0.9), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Năm 3 (+5%)\ $5","5125$ tr/th\ ($66","15$ tr)\ ])

    content((2.75, -0.4), text(size: 8.5pt, weight: "bold")[Dòng tiền gửi tích lũy tăng trưởng định kỳ])
  })
]
],
    (
        True([$189","15$ triệu đồng.]),
        [$180","00$ triệu đồng.],
        [$195","20$ triệu đồng.],
        [$205","00$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tổng số tiền gốc thực nộp là tổng số tiền nộp của 3 năm:
        - Năm thứ nhất: nộp $12$ tháng, mỗi tháng $5$ triệu đồng.
        - Năm thứ hai: số tiền mỗi tháng tăng thêm $5\%$.
        - Năm thứ ba: số tiền mỗi tháng tiếp tục tăng thêm $5\%$.

        #step([Lời giải chi tiết])
        - Tiền nộp trong Năm 1:
        $ 5 dot 12 = 60 " (triệu đồng)" $

        - Tiền nộp trong Năm 2 (mỗi tháng nộp $5 dot 1","05 = 5","25$ triệu):
        $ 5","25 dot 12 = 63 " (triệu đồng)" $

        - Tiền nộp trong Năm 3 (mỗi tháng nộp $5","25 dot 1","05 = 5","5125$ triệu):
        $ 5","5125 dot 12 = 66","15 " (triệu đồng)" $

        - Tổng số tiền gốc đã nộp sau 3 năm:
        $ "Tổng gốc" = 60 + 63 + 66","15 = 189","15 " (triệu đồng)" $
    ]
)

// TN 12
#tn([Khi lập kế hoạch rút vốn tuổi già, một người dự định duy trì việc rút tiền sao cho giá trị thực của khoản rút không bị xói mòn bởi lạm phát. Năm đầu tiên người đó rút $200$ triệu đồng. Kể từ năm thứ hai trở đi, mỗi năm khoản tiền rút tăng thêm $4\%$ để bù đắp đúng tỷ lệ lạm phát $4\%$/"năm". Biết quỹ đầu tư đạt tỷ suất sinh lời danh nghĩa là $7\%$/"năm". Tỷ suất sinh lời thực tế (Real Interest Rate) sau khi đã loại trừ lạm phát theo công thức Fisher chính xác $1 + r_"thực" = (1 + r_"danh nghĩa") / (1 + i)$ xấp xỉ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ cân bằng Fisher
    rect((0.5, 0), (2.2, 1.5), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((1.35, 0.75), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Lợi nhuận danh nghĩa\ $r = 7\%$/"năm"\ ])

    content((2.5, 0.75), text(size: 10pt, weight: "bold")[$-$])

    rect((2.8, 0), (4.1, 1.5), fill: rgb("ffedd5"), stroke: 1pt + rgb("ea580c"))
    content((3.45, 0.75), text(size: 7.5pt, fill: rgb("9a3412"), weight: "bold")[Lạm phát\ $i = 4\%$/"năm"\ ])

    content((4.3, 0.75), text(size: 10pt, weight: "bold")[$approx$])

    rect((4.6, 0), (5.8, 1.5), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((5.2, 0.75), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Lợi nhuận thực\ $r_"thực" approx 2","88\%$\ ])
  })
]
],
    (
        True([$2","88\%$/"năm".]),
        [$3","00\%$/"năm".],
        [$2","50\%$/"năm".],
        [$3","25\%$/"năm".]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo phương trình Fisher chính xác trong tài chính vĩ mô:
        $ 1 + r_"thực" = (1 + r_"danh nghĩa") / (1 + i) $
        $ ==> r_"thực" = (1 + r_"danh nghĩa") / (1 + i) - 1 = (r_"danh nghĩa" - i) / (1 + i) $

        #step([Lời giải chi tiết])
        Với $r_"danh nghĩa" = 7\% = 0","07$ và lạm phát $i = 4\% = 0","04$:
        $ 1 + r_"thực" = (1 + 0","07) / (1 + 0","04) = (1","07) / (1","04) approx 1","028846 $
        $ r_"thực" = 1","028846 - 1 = 0","028846 = 2","8846\% $

        Làm tròn kết quả là khoảng $2","88\%$/"năm".
        (Lưu ý: phép trừ gần đúng $7\% - 4\% = 3\%$ sẽ đánh giá hơi quá mức tỷ suất thực tế do chưa tính đến yếu tố chiết khấu lạm phát của gốc).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 13 đến câu 16. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một kỹ sư công nghệ $30$ tuổi xây dựng kế hoạch hưu trí cho bản thân với hai giai đoạn cuộc đời:
- Giai đoạn tích lũy (từ $30$ tuổi đến $60$ tuổi - đúng $30$ năm $= 360$ tháng): Mỗi tháng trích đều đặn $8$ triệu đồng vào quỹ đầu tư đạt tỷ suất sinh lời $9\%$/"năm" ($0","75\%$/"tháng") theo thể thức lãi kép hàng tháng.
- Giai đoạn nghỉ hưu (từ $60$ tuổi đến $85$ tuổi - đúng $25$ năm $= 300$ tháng): Toàn bộ số tài sản tích lũy được chuyển sang tài khoản hưu trí an toàn với lãi suất $6\%$/"năm" ($0","5\%$/"tháng"). Mỗi tháng rút đều đặn một khoản tiền cố định $R$ để chi tiêu cho đến khi số dư vừa hết lúc tròn $85$ tuổi.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tuổi])
    content((-0.4, 3.2), text(size: 8pt)[Tài sản (tỷ)])

    // Điểm 30 tuổi: 0
    content((0, -0.3), text(size: 8pt)[$30$])

    // Đỉnh 60 tuổi: 14.65 tỷ
    bezier((0, 0), (3.0, 2.7), (1.8, 0.8), stroke: 1.5pt + rgb("047857"))
    circle((3.0, 2.7), radius: 0.08, fill: rgb("047857"))
    content((3.0, -0.3), text(size: 8pt, weight: "bold")[$60$])
    content((3.0, 2.95), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$14","65$ tỷ])

    // Hạ xuống 85 tuổi: 0
    bezier((3.0, 2.7), (5.5, 0), (4.5, 1.2), stroke: 1.5pt + rgb("e11d48"))
    circle((5.5, 0), radius: 0.08, fill: rgb("e11d48"))
    content((5.5, -0.3), text(size: 8pt, weight: "bold")[$85$])
  })
]
],
    (
        True([Tổng số tiền gốc mà kỹ sư thực tế nộp vào quỹ tích lũy trong $30$ năm là $2","88$ tỷ đồng.]),
        True([Tại thời điểm tròn $60$ tuổi, giá trị quỹ hưu trí mà kỹ sư tích lũy được xấp xỉ $14","65$ tỷ đồng.]),
        True([Trong suốt $25$ năm nghỉ hưu, số tiền mà kỹ sư có thể rút ra chi tiêu đều đặn mỗi tháng là khoảng $94","4$ triệu đồng.]),
        False([Nếu chuyển sang phương án rút tiền bảo toàn vốn vĩnh viễn (chỉ rút tiền lãi hàng tháng $0","5\%$), số tiền rút mỗi tháng vẫn đạt trên $100$ triệu đồng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Tổng số tiền gốc đã nộp:
        $ 8 " triệu" dot 360 = 2880 " (triệu đồng)" = 2","88 " (tỷ đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Giá trị tương lai của quỹ tích lũy ở tuổi 60:
        $ "FV"_60 = 8 dot ((1 + 0","0075)^360 - 1) / (0","0075) $
        Ta tính:
        $ (1","0075)^360 approx 14","730576 $
        $ "FV"_60 = 8 dot (13","730576) / (0","0075) approx 14645","95 " (triệu đồng)" approx 14","65 " (tỷ đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Khoản tiền rút đều mỗi tháng trong 300 tháng với lãi suất $r = 0","5\% = 0","005$:
        $ R = "FV"_60 dot r / (1 - (1 + r)^(-300)) $
        $ (1","005)^(-300) approx 0","225501 ==> 1 - 0","225501 = 0","774499 $
        $ R = 14645","95 dot (0","005) / (0","774499) approx 94","357 " (triệu đồng)" approx 94","4 " triệu đồng" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Nếu chỉ rút lãi hàng tháng để giữ nguyên gốc $14","65$ tỷ vĩnh viễn:
        $ R_"lãi" = 14645","95 dot 0","5\% approx 73","23 " (triệu đồng)" $
        Số tiền rút được chỉ là $73","23$ triệu đồng/"tháng", không thể đạt trên $100$ triệu đồng.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 2
#ds([Một hộ gia đình có tổng thu nhập ròng ổn định là $50$ triệu đồng mỗi tháng. Họ áp dụng nguyên tắc quản lý tài chính cá nhân $50/30/20$:
- Chi tiêu thiết yếu ($50\%$): $25$ triệu đồng/"tháng".
- Chi tiêu cá nhân và giải trí ($30\%$): $15$ triệu đồng/"tháng".
- Tích lũy và đầu tư ($20\%$): $10$ triệu đồng/"tháng".
Họ đặt ra hai mục tiêu:
1. Thiết lập "Quỹ khẩn cấp" tương đương $6$ tháng chi phí thiết yếu.
2. Sau khi quỹ khẩn cấp đã đủ, toàn bộ khoản tích lũy $10$ triệu/"tháng" sẽ được chuyển sang quỹ đầu tư mua nhà với tỷ suất sinh lời $8\%$/"năm" ($approx 0","667\%$/"tháng") trong thời gian $5$ năm tiếp theo.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ lộ trình 2 giai đoạn
    rect((0.5, 0), (2.6, 1.8), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    content((1.55, 0.9), text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[Giai đoạn 1 ($15$ tháng)\ Gom Quỹ khẩn cấp\ $150$ triệu\ ])

    line((2.6, 0.9), (3.4, 0.9), mark: (end: "stealth"), stroke: 1.5pt + rgb("64748b"))

    rect((3.4, 0), (5.5, 1.8), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((4.45, 0.9), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Giai đoạn 2 ($60$ tháng)\ Đầu tư quỹ mua nhà\ $approx 735$ triệu\ ])
  })
]
],
    (
        True([Quy mô của Quỹ khẩn cấp cần tích lũy là $150$ triệu đồng.]),
        True([Gia đình cần đúng $15$ tháng để hoàn thành việc thiết lập Quỹ khẩn cấp.]),
        True([Sau $5$ năm ($60$ tháng) đầu tư ở Giai đoạn 2, quỹ mua nhà đạt số tiền khoảng $735$ triệu đồng.]),
        False([Nếu trong suốt $5$ năm ở Giai đoạn 2, gia đình chỉ cất tiền mặt trong két sắt không gửi lấy lãi thì số tiền tích lũy được vẫn đạt trên $700$ triệu đồng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Chi phí thiết yếu hàng tháng là $25$ triệu đồng.
        Quỹ khẩn cấp 6 tháng là:
        $ 25 dot 6 = 150 " (triệu đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Mỗi tháng gia đình dành $10$ triệu đồng cho tích lũy. Số tháng cần thiết để đạt $150$ triệu:
        $ 150 / 10 = 15 " (tháng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Ở giai đoạn 2, gửi $C = 10$ triệu đồng/"tháng" trong $60$ tháng với lãi suất $r = 8\% / 12 = 0","0066667$:
        $ (1 + r)^60 = (1 + 0","0066667)^60 approx 1","489846 $
        $ "FV" = 10 dot (0","489846) / (0","0066667) approx 734","77 " (triệu đồng)" $
        Làm tròn là khoảng $735$ triệu đồng.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Nếu không có lãi (chỉ cất tiền mặt), sau 60 tháng chỉ có:
        $ 10 dot 60 = 600 " (triệu đồng)" $
        Số tiền này thấp hơn rất nhiều so với $700$ triệu đồng (mất đi gần $135$ triệu đồng tiền lãi).
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#ds([Bài toán so sánh sức mạnh thời gian của lãi kép:
- Người A (Bắt đầu sớm): Từ năm $22$ tuổi đến $32$ tuổi ($10$ năm $= 120$ tháng), mỗi tháng đều đặn gửi $5$ triệu đồng vào quỹ đầu tư đạt tỷ suất $0","8\%$/"tháng" ($approx 10\%$/"năm"). Kể từ năm $32$ tuổi trở đi, người A ngừng nộp thêm tiền hoàn toàn, nhưng vẫn để nguyên toàn bộ số tiền đã tích lũy trong quỹ để tiếp tục sinh lãi kép cho đến năm $60$ tuổi (thêm $28$ năm $= 336$ tháng).
- Người B (Bắt đầu muộn): Từ năm $22$ tuổi đến $32$ tuổi không tiết kiệm đồng nào. Đến năm $32$ tuổi mới bắt đầu gửi $5$ triệu đồng mỗi tháng liên tục suốt $28$ năm ($336$ tháng) cho đến năm $60$ tuổi với cùng tỷ suất sinh lời $0","8\%$/"tháng".
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tuổi])
    content((-0.4, 3.2), text(size: 8pt)[Tài sản (tỷ)])

    content((0, -0.3), text(size: 8pt)[$22$])
    content((1.8, -0.3), text(size: 8pt)[$32$])
    content((5.2, -0.3), text(size: 8pt)[$60$])

    // Người A: bứt phá lên 14.56 tỷ
    bezier((0, 0), (1.8, 0.4), (1.0, 0.1), stroke: 1.5pt + rgb("047857"))
    bezier((1.8, 0.4), (5.2, 2.8), (3.5, 1.2), stroke: 1.5pt + rgb("047857"))
    circle((5.2, 2.8), radius: 0.08, fill: rgb("047857"))
    content((5.2, 3.05), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[A: $14","56$ tỷ])

    // Người B: chỉ đạt 8.47 tỷ
    bezier((1.8, 0), (5.2, 1.6), (3.5, 0.5), stroke: 1.5pt + rgb("0284c7"))
    circle((5.2, 1.6), radius: 0.08, fill: rgb("0284c7"))
    content((5.2, 1.3), text(size: 7.5pt, fill: rgb("0284c7"), weight: "bold")[B: $8","47$ tỷ])
  })
]
],
    (
        True([Tổng số tiền gốc mà người B thực nộp vào quỹ gấp gần $2","8$ lần tổng số tiền gốc mà người A nộp.]),
        True([Tại thời điểm $32$ tuổi, người A đã tích lũy được khoảng $1$ tỷ đồng trong tài khoản đầu tư.]),
        True([Tại thời điểm $60$ tuổi, tổng tài sản của người A đạt xấp xỉ $14","56$ tỷ đồng, cao hơn đáng kể so với tài sản của người B (khoảng $8","47$ tỷ đồng).]),
        False([Yếu tố quyết định nhất tạo nên sự vượt trội của khối tài sản ở tuổi 60 là số tiền vốn bỏ ra ban đầu chứ không phải thời gian bắt đầu đầu tư.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        - Tiền gốc người A nộp: $5 dot 120 = 600$ (triệu đồng).
        - Tiền gốc người B nộp: $5 dot 336 = 1680$ (triệu đồng).
        Tỷ lệ: $1680 / 600 = 2","8$ lần.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Số tiền người A có lúc 32 tuổi:
        $ "FV"_(A,32) = 5 dot ((1 + 0","008)^120 - 1) / (0","008) $
        $ (1","008)^120 approx 2","599273 ==> "FV"_(A,32) = 5 dot (1","599273) / (0","008) approx 999","55 " (triệu đồng)" approx 1 " tỷ đồng" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        - Tài sản người A lúc 60 tuổi:
        $ "FV"_(A,60) = 999","55 dot (1","008)^336 $
        $ (1","008)^336 approx 14","568214 $
        $ "FV"_(A,60) = 999","55 dot 14","568214 approx 14561","66 " (triệu đồng)" approx 14","56 " (tỷ đồng)" $
        - Tài sản người B lúc 60 tuổi:
        $ "FV"_(B,60) = 5 dot ((1","008)^336 - 1) / (0","008) = 5 dot (13","568214) / (0","008) approx 8480 " (triệu đồng)" approx 8","47 " (tỷ đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Người A nộp ít tiền hơn người B gần $1","1$ tỷ đồng tiền gốc nhưng lại có tài sản gấp $1","7$ lần người B lúc về hưu. Điều này chứng minh thời gian bắt đầu sớm và sức mạnh của lãi kép có vai trò áp đảo so với lượng vốn nộp thêm muộn màng.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#ds([Một cá nhân về hưu với quỹ tài sản $5$ tỷ đồng ($5000$ triệu đồng). Danh mục đầu tư hưu trí đem lại tỷ suất sinh lời danh nghĩa $6\%$/"năm". Năm đầu tiên người này rút $250$ triệu đồng để chi tiêu ($5\%$ danh mục ban đầu). Để duy trì mức sống không đổi, từ năm thứ hai trở đi người đó tăng số tiền rút mỗi năm thêm $4\%$ tương ứng với tỷ lệ lạm phát $4\%$/"năm".
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])
    content((-0.4, 3), text(size: 8pt)[Quỹ (tỷ)])

    circle((0, 2.5), radius: 0.08, fill: rgb("e11d48"))
    content((-0.6, 2.5), text(size: 8pt, weight: "bold")[$5$ tỷ])

    // Đường quỹ cạn kiệt sau approx 25.5 năm
    bezier((0, 2.5), (4.8, 0), (2.4, 1.8), stroke: 1.5pt + rgb("e11d48"))
    circle((4.8, 0), radius: 0.08, fill: rgb("e11d48"))
    content((4.8, -0.35), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$approx 25","5$ năm])
  })
]
],
    (
        True([Tỷ suất sinh lời thực tế của danh mục đầu tư (sau khi đã khấu trừ lạm phát $4\%$) xấp xỉ $1","92\%$/"năm".]),
        True([Khoản tiền người đó rút ra ở năm thứ $10$ của giai đoạn nghỉ hưu là khoảng $355$ triệu đồng.]),
        True([Sau khoảng $25$ đến $26$ năm, quỹ tài sản hưu trí của người này sẽ cạn kiệt hoàn toàn về mức $0$.]),
        False([Nếu tỷ suất sinh lời danh nghĩa của quỹ tăng lên $10\%$/"năm" (cao hơn đáng kể so với lạm phát $4\%$), quỹ hưu trí vẫn bị cạn kiệt sau $30$ năm.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Tỷ suất sinh lời thực tế $r_"thực"$:
        $ 1 + r_"thực" = (1 + 0","06) / (1 + 0","04) = (1","06) / (1","04) approx 1","0192308 $
        $ r_"thực" approx 1","923\%/"năm" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Khoản tiền rút ở năm thứ 10:
        $ C_10 = 250 dot (1 + 0","04)^(10 - 1) = 250 dot (1","04)^9 $
        $ (1","04)^9 approx 1","423312 ==> C_10 = 250 dot 1","423312 approx 355","8 " (triệu đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Quy đổi bài toán về giá trị thực:
        $ 5000 = 250 dot (1 - (1 + r_"thực")^(-n)) / r_"thực" $
        $ 1 - (1 + 0","01923)^(-n) = (5000 dot 0","01923) / 250 = 0","3846 $
        $ (1","01923)^(-n) = 0","6154 $
        $ n = - (ln 0","6154) / (ln 1","01923) approx (-0","4855) / (0","01905) approx 25","49 " (năm)" $
        Quỹ cạn sau khoảng $25$ đến $26$ năm.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Khi lợi suất là $10\%$/"năm" và lạm phát $4\%$/"năm", tỷ suất thực là $r_"thực" = (1","10)/(1","04) - 1 approx 5","77\%$.
        Khoản rút ban đầu chỉ là $5\%$ danh mục ($250/5000 = 5\%$), nhỏ hơn tỷ suất sinh lời thực ($5","77\%$). Danh mục sẽ sinh lời nhiều hơn số tiền rút và tăng trưởng bền vững mãi mãi mà không bao giờ cạn kiệt.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1
#tln([Một người muốn đạt mục tiêu tự do tài chính và nghỉ hưu sớm. Ước tính chi phí sinh hoạt hàng tháng cần thiết là $20$ triệu đồng. Áp dụng quy tắc $4\%$ (The 4% Rule), số tiền tối thiểu (tính theo đơn vị tỷ đồng) mà người đó cần tích lũy trong quỹ đầu tư hưu trí là bao nhiêu tỷ đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((1.0, 0), (2.8, 2.4), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("e11d48"))
    content((1.9, 1.2), text(size: 8pt, fill: rgb("9f1239"), weight: "bold")[Quỹ FIRE\ $= ?$ tỷ đồng\ ])

    line((2.8, 1.8), (4.2, 1.8), mark: (end: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((3.5, 2.1), text(size: 7.5pt, fill: rgb("047857"))[Rút $4\%$/"năm"])

    rect((4.2, 1.2), (5.6, 2.4), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((4.9, 1.8), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[$240$ tr/"năm"\ ($20$ tr/th)\ ])
  })
]
],
    [6],
    loigiai: [
        #step([Lời giải chi tiết])
        Chi phí sinh hoạt một năm:
        $ "Chi phí năm" = 20 " triệu" dot 12 = 240 " (triệu đồng)" $

        Theo quy tắc $4\%$, quy mô quỹ cần thiết:
        $ "Quỹ FIRE" = 240 / (4\%) = 240 / (0","04) = 6000 " (triệu đồng)" $

        Quy đổi ra đơn vị tỷ đồng:
        $ 6000 " triệu đồng" = 6 " tỷ đồng" $

        Điền đáp số: *6*.
    ]
)

// TLN 2
#tln([Một gia đình có mức chi tiêu thiết yếu cố định mỗi tháng là $18$ triệu đồng. Gia đình muốn xây dựng một quỹ dự phòng khẩn cấp tương đương đúng $6$ tháng chi phí thiết yếu. Số tiền cần có trong quỹ dự phòng khẩn cấp này là bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.8), fill: rgb("dbeafe"), stroke: 1.2pt + rgb("2563eb"))
    content((2.8, 0.9), text(size: 8.5pt, fill: rgb("1e40af"), weight: "bold")[Quỹ khẩn cấp: $6$ tháng thiết yếu\ $18 " tr" dot 6 = 108$ triệu đồng\ ])
  })
]
],
    [108],
    loigiai: [
        #step([Lời giải chi tiết])
        Số tiền cần có trong Quỹ khẩn cấp:
        $ "Quỹ khẩn cấp" = 18 dot 6 = 108 " (triệu đồng)" $

        Điền đáp số: *108*.
    ]
)

// TLN 3
#tln([Một người gửi tiết kiệm định kỳ $6$ triệu đồng vào cuối mỗi tháng liên tục trong $15$ năm ($180$ tháng) với lãi suất tiền gửi ổn định là $0","7\%$/"tháng" theo thể thức lãi kép. Tổng số tiền cả gốc lẫn lãi tích lũy được sau $15$ năm là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3), text(size: 8pt)[Tiền tích lũy])

    bezier((0, 0), (5.0, 2.5), (2.5, 0.7), stroke: 1.5pt + rgb("047857"))
    circle((5.0, 2.5), radius: 0.08, fill: rgb("047857"))
    content((5.0, -0.35), text(size: 8pt)[$180$])
    content((4.8, 2.8), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$"FV" approx 2151$ tr])
  })
]
],
    [2151],
    loigiai: [
        #step([Lời giải chi tiết])
        Áp dụng công thức tính giá trị tương lai của niên kim gửi đều:
        $ "FV" = C dot ((1 + r)^n - 1) / r $

        Thay số: $C = 6$ triệu, $r = 0","7\% = 0","007$, $n = 180$ tháng:
        $ (1 + 0","007)^180 = (1","007)^180 approx 3","509978 $
        $ (1","007)^180 - 1 = 2","509978 $
        $ "FV" = 6 dot (2","509978) / (0","007) approx 2151","41 " (triệu đồng)" $

        Làm tròn đến hàng đơn vị: $2151$ triệu đồng.

        Điền đáp số: *2151*.
    ]
)

// TLN 4
#tln([Một người dự định khi về già sẽ rút đều đặn mỗi tháng $15$ triệu đồng vào cuối mỗi tháng trong suốt $20$ năm ($240$ tháng) từ tài khoản tiết kiệm hưu trí với lãi suất $0","5\%$/"tháng". Để thực hiện được kế hoạch này, số tiền ban đầu cần có trong tài khoản hưu trí lúc bắt đầu nghỉ hưu là bao nhiêu tỷ đồng? (làm tròn kết quả đến hàng phần trăm)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 2.8), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 2.8), text(size: 8pt)[Dư quỹ])

    circle((0, 2.3), radius: 0.08, fill: rgb("e11d48"))
    content((-0.6, 2.3), text(size: 8pt, weight: "bold")[$"PV" = ?$])

    bezier((0, 2.3), (5.0, 0), (2.5, 1.4), stroke: 1.5pt + rgb("e11d48"))
    circle((5.0, 0), radius: 0.08, fill: rgb("047857"))
    content((5.0, -0.35), text(size: 8pt)[$240$ th])
    content((3.5, 1.8), text(size: 7.5pt, fill: rgb("047857"))[Rút $15$ tr/"tháng"])
  })
]
],
    [2.09],
    loigiai: [
        #step([Lời giải chi tiết])
        Giá trị hiện tại của dòng niên kim rút tiền 240 tháng:
        $ "PV" = R dot (1 - (1 + r)^(-n)) / r $

        Thay số: $R = 15$ triệu, $r = 0","5\% = 0","005$, $n = 240$ tháng:
        $ (1 + 0","005)^(-240) = (1","005)^(-240) approx 0","302096 $
        $ 1 - 0","302096 = 0","697904 $
        $ "PV" = 15 dot (0","697904) / (0","005) = 15 dot 139","5808 approx 2093","71 " (triệu đồng)" $

        Quy đổi ra đơn vị tỷ đồng:
        $ 2093","71 " triệu đồng" approx 2","09 " tỷ đồng" $

        Điền đáp số: *2.09*.
    ]
)

// TLN 5
#tln([Một gia đình muốn sau $15$ năm nữa ($180$ tháng) có sẵn một quỹ giáo dục $500$ triệu đồng cho con học đại học. Quỹ tích lũy đạt tỷ suất sinh lời $0","6\%$/"tháng". Hỏi vào cuối mỗi tháng gia đình cần gửi vào quỹ số tiền là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng phần trăm)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 2.8), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 2.8), text(size: 8pt)[Quỹ])

    bezier((0, 0), (5.0, 2.3), (2.5, 0.6), stroke: 1.5pt + rgb("047857"))
    circle((5.0, 2.3), radius: 0.08, fill: rgb("047857"))
    content((5.0, -0.35), text(size: 8pt)[$180$])
    content((4.8, 2.55), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$500$ tr])
  })
]
],
    [1.55],
    loigiai: [
        #step([Lời giải chi tiết])
        Công thức trích lập quỹ chìm định kỳ:
        $ C = "FV" dot r / ((1 + r)^n - 1) $

        Thay số: $"FV" = 500$ triệu, $r = 0","6\% = 0","006$, $n = 180$ tháng:
        $ (1 + 0","006)^180 = (1","006)^180 approx 2","936838 $
        $ (1","006)^180 - 1 = 1","936838 $
        $ C = 500 dot (0","006) / (1","936838) = 3 / (1","936838) approx 1","5489 " (triệu đồng)" $

        Làm tròn kết quả đến hàng phần trăm: $1","55$ triệu đồng/"tháng".

        Điền đáp số: *1.55*.
    ]
)

// TLN 6
#tln([Một người nhận lương hưu cố định là $10$ triệu đồng mỗi tháng. Tỷ lệ lạm phát bình quân của nền kinh tế là $4\%$/"năm". Sau $18$ năm, sức mua thực tế của số tiền $10$ triệu đồng lương hưu tương đương với bao nhiêu triệu đồng tại thời điểm hiện tại? (làm tròn kết quả đến hàng phần trăm)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 2.8), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])
    content((-0.4, 2.8), text(size: 8pt)[Sức mua])

    bezier((0, 2.2), (5.0, 0.8), (2.5, 1.2), stroke: 1.5pt + rgb("e11d48"))
    circle((0, 2.2), radius: 0.08, fill: rgb("94a3b8"))
    content((-0.6, 2.2), text(size: 8pt)[$10$ tr])
    circle((5.0, 0.8), radius: 0.08, fill: rgb("e11d48"))
    content((5.0, -0.35), text(size: 8pt)[$18$ năm])
    content((4.8, 1.1), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$approx 4","94$ tr])
  })
]
],
    [4.94],
    loigiai: [
        #step([Lời giải chi tiết])
        Sức mua thực tế sau 18 năm chiết khấu lạm phát $i = 4\% = 0","04$:
        $ "PV" = M / ((1 + i)^n) = 10 / ((1 + 0","04)^18) $

        Ta tính:
        $ (1","04)^18 approx 2","025817 $
        $ "PV" = 10 / (2","025817) approx 4","93628 " (triệu đồng)" $

        Làm tròn kết quả đến hàng phần trăm: $4","94$ triệu đồng.

        Điền đáp số: *4.94*.
    ]
)

]

#make-questions()
