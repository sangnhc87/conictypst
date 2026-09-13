#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("0f766e")

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH",
  exam-title: "CHỦ ĐỀ 2G: THUẾ THU NHẬP CÁ NHÂN & TỐI ƯU HÓA THU NHẬP (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "517",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một kỹ sư có thu nhập tính thuế sau khi đã trừ đi các khoản đóng bảo hiểm bắt buộc và các khoản giảm trừ gia cảnh là $"TNTT" = 15$ triệu đồng mỗi tháng. Áp dụng Biểu thuế lũy tiến từng phần theo quy định của Luật Thuế thu nhập cá nhân hiện hành:
- Bậc 1: Thu nhập tính thuế đến $5$ triệu đồng, thuế suất $5\%$.
- Bậc 2: Thu nhập tính thuế trên $5$ triệu đến $10$ triệu đồng, thuế suất $10\%$.
- Bậc 3: Thu nhập tính thuế trên $10$ triệu đến $18$ triệu đồng, thuế suất $15\%$.
Số tiền thuế thu nhập cá nhân (TNCN) mà kỹ sư này phải nộp hàng tháng là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ bậc thang tích lũy thuế
    rect((0.5, 0), (2.0, 0.7), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0f766e"))
    content((1.25, 0.35), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Bậc 1: $5\%$\ $0","25$ tr\ ])
    content((1.25, -0.3), text(size: 7.5pt)[$5$ tr])

    rect((2.1, 0), (3.6, 1.4), fill: rgb("99f6e4"), stroke: 1pt + rgb("0f766e"))
    content((2.85, 0.7), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Bậc 2: $10\%$\ $0","50$ tr\ ])
    content((2.85, -0.3), text(size: 7.5pt)[$10$ tr])

    rect((3.7, 0), (5.2, 2.1), fill: rgb("5eead4"), stroke: 1pt + rgb("0f766e"))
    content((4.45, 1.05), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Bậc 3: $15\%$\ $0","75$ tr\ ])
    content((4.45, -0.3), text(size: 7.5pt)[$15$ tr])

    content((2.85, 2.5), text(size: 8pt, fill: rgb("0f766e"), weight: "bold")[Tổng thuế: $0","25 + 0","50 + 0","75 = 1","50$ tr])
  })
]
],
    (
        True([$1","50$ triệu đồng.]),
        [$2","25$ triệu đồng.],
        [$0","75$ triệu đồng.],
        [$1","25$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo phương pháp tính thuế lũy tiến từng phần, phần thu nhập nằm trong khung của bậc nào sẽ chịu thuế suất của bậc đó:
        - Bậc 1 ($0$ đến $5$ triệu): thuế suất $5\%$.
        - Bậc 2 (trên $5$ đến $10$ triệu, gồm $5$ triệu): thuế suất $10\%$.
        - Bậc 3 (trên $10$ đến $15$ triệu, gồm $5$ triệu): thuế suất $15\%$.
        Tổng thuế phải nộp là tổng các khoản thuế tính trên từng bậc.
        (Hoặc dùng công thức rút gọn Bậc 3: $"Thuế" = 15\% dot "TNTT" - 0","75$ triệu).

        #step([Lời giải chi tiết])
        Với $"TNTT" = 15$ triệu đồng:
        - Thuế Bậc 1:
        $ T_1 = 5 dot 5\% = 0","25 " (triệu đồng)" $
        - Thuế Bậc 2:
        $ T_2 = (10 - 5) dot 10\% = 5 dot 10\% = 0","50 " (triệu đồng)" $
        - Thuế Bậc 3:
        $ T_3 = (15 - 10) dot 15\% = 5 dot 15\% = 0","75 " (triệu đồng)" $

        Tổng số thuế TNCN phải nộp:
        $ T = T_1 + T_2 + T_3 = 0","25 + 0","50 + 0","75 = 1","50 " (triệu đồng)" $

        Hoặc áp dụng công thức rút gọn:
        $ T = 15 dot 15\% - 0","75 = 2","25 - 0","75 = 1","50 " (triệu đồng)" $
    ]
)

// TN 2
#tn([Một nhân viên văn phòng có tổng thu nhập chịu thuế hàng tháng là $25$ triệu đồng. Người này đóng các khoản bảo hiểm bắt buộc (BHXH, BHYT, BHTN) là $10","5\%$ trên mức lương đóng bảo hiểm $10$ triệu đồng ($1","05$ triệu đồng). Biết mức giảm trừ gia cảnh cho bản thân người nộp thuế là $11$ triệu đồng/tháng và người này có đăng ký giảm trừ cho $1$ người phụ thuộc là $4","4$ triệu đồng/tháng. Số tiền thuế TNCN mà nhân viên này phải nộp mỗi tháng là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ thanh ngang phân bổ thu nhập 25 tr
    rect((0, 0), (5.5, 1.2), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((0, 0), (2.42, 1.2), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0f766e"))
    rect((2.42, 0), (3.39, 1.2), fill: rgb("99f6e4"), stroke: 1pt + rgb("0f766e"))
    rect((3.39, 0), (3.62, 1.2), fill: rgb("cbd5e1"), stroke: 1pt + rgb("64748b"))
    rect((3.62, 0), (5.5, 1.2), fill: rgb("fef08a"), stroke: 1pt + rgb("ca8a04"))

    content((1.21, 0.6), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Bản thân: $11$ tr])
    content((2.9, 0.6), text(size: 7pt, fill: rgb("115e59"), weight: "bold")[Phụ thuộc:\ $4","4$ tr\ ])
    content((4.56, 0.6), text(size: 7.5pt, fill: rgb("854d0e"), weight: "bold")[$"TNTT" = 8","55$ tr\ ($"Thuế" = 605$ k)\ ])
    content((2.75, -0.35), text(size: 8pt, weight: "bold")[Tổng thu nhập chịu thuế: $25$ triệu đồng/tháng])
  })
]
],
    (
        True([$605$ nghìn đồng.]),
        [$855$ nghìn đồng.],
        [$450$ nghìn đồng.],
        [$720$ nghìn đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính thu nhập tính thuế:
        $ "TNTT" = "Tổng thu nhập chịu thuế" - "Bảo hiểm" - "Giảm trừ bản thân" - "Giảm trừ phụ thuộc" $
        - Bước 2: Xác định bậc thuế tương ứng và tính tiền thuế theo biểu lũy tiến.

        #step([Lời giải chi tiết])
        1. Tính thu nhập tính thuế $"TNTT"$:
        $ "TNTT" = 25 - 1","05 - 11 - 4","4 = 8","55 " (triệu đồng)" $

        2. Thu nhập tính thuế $8","55$ triệu đồng nằm ở Bậc 2 (từ trên $5$ đến $10$ triệu đồng):
        - Thuế Bậc 1 ($5$ triệu đầu với thuế suất $5\%$):
        $ 5 dot 5\% = 0","25 " (triệu đồng)" $
        - Thuế Bậc 2 (phần vượt trên $5$ triệu là $8","55 - 5 = 3","55$ triệu với thuế suất $10\%$):
        $ 3","55 dot 10\% = 0","355 " (triệu đồng)" $

        Tổng thuế TNCN phải nộp:
        $ T = 0","25 + 0","355 = 0","605 " (triệu đồng)" = 605 " (nghìn đồng)" $
    ]
)

// TN 3
#tn([Một chuyên gia tư vấn có thu nhập tính thuế hàng tháng là $"TNTT" = 30$ triệu đồng (thuộc Bậc 4: từ trên $18$ đến $32$ triệu đồng, thuế suất biên $20\%$). Số tiền thuế TNCN chuyên gia phải nộp là $4","35$ triệu đồng/tháng. Nếu chuyên gia này nhận thêm một công việc tư vấn ngoài giờ giúp tăng thêm đúng $2$ triệu đồng thu nhập tính thuế (lên thành $32$ triệu đồng), thì số tiền thuế TNCN phải nộp thêm là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[$"TNTT"$ (tr)])

    // Khoảng 18 - 32 tr: Bậc 4 (20%)
    rect((1.8, 0), (4.5, 1.6), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0f766e"))
    content((3.15, 0.8), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Bậc 4: Thuế suất biên $"MTR" = 20\%$\ ($18$ tr đến $32$ tr)\ ])
    content((1.8, -0.3), text(size: 7.5pt)[$18$])
    content((4.5, -0.3), text(size: 7.5pt)[$32$])

    // Mũi tên tăng thêm 2 tr
    line((3.5, 0.4), (4.3, 0.4), mark: (end: "stealth"), stroke: 1.5pt + rgb("e11d48"))
    content((3.9, 0.65), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[Tăng $2$ tr])
    content((3.9, -0.6), text(size: 7.5pt, fill: rgb("e11d48"))[Thuế tăng: $2 dot 20\% = 0","4$ tr])
  })
]
],
    (
        True([$400$ nghìn đồng ($0","4$ triệu đồng).]),
        [$290$ nghìn đồng ($0","29$ triệu đồng).]),
        [$200$ nghìn đồng ($0","2$ triệu đồng).]),
        [$500$ nghìn đồng ($0","5$ triệu đồng).]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Thuế suất biên (Marginal Tax Rate - MTR) là mức thuế suất áp dụng cho đồng thu nhập tăng thêm cuối cùng:
        $ "Thuế tăng thêm" = Delta T = "MTR" dot Delta ("TNTT") $
        - Vì mức thu nhập sau khi tăng ($30 + 2 = 32$ triệu đồng) vẫn nằm trọn vẹn trong khung Bậc 4 (không vượt quá ngưỡng $32$ triệu đồng), nên toàn bộ khoản thu nhập tăng thêm $2$ triệu đồng đều chịu thuế suất biên của Bậc 4 là $20\%$.

        #step([Lời giải chi tiết])
        Số tiền thuế phải nộp tăng thêm:
        $ Delta T = 2 " triệu" dot 20\% = 0","4 " (triệu đồng)" = 400 " (nghìn đồng)" $

        Số tiền thuế mới:
        $ T_"mới" = 4","35 + 0","4 = 4","75 " (triệu đồng)" $
    ]
)

// TN 4
#tn([Trong kinh tế học tài chính, hiện tượng "Leo bậc thuế" (Bracket Creep) do lạm phát xảy ra khi
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ Bracket Creep
    rect((0.5, 0), (2.2, 1.8), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((1.35, 0.9), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Lạm phát $10\%$\ Lương tăng $10\%$\ Sức mua danh nghĩa\ ])

    line((2.2, 0.9), (3.6, 0.9), mark: (end: "stealth"), stroke: 1.5pt + rgb("64748b"))
    content((2.9, 1.2), text(size: 7.5pt)[Đẩy bậc])

    rect((3.6, 0), (5.5, 1.8), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))
    content((4.55, 0.9), text(size: 7.5pt, fill: rgb("5b21b6"), weight: "bold")[Bị nhảy bậc thuế cao\ Thuế thực tế tăng\ Thu nhập thực giảm\ ])
  })
]
],
    (
        True([Lạm phát làm tăng thu nhập danh nghĩa của người lao động đẩy họ vào bậc thuế suất biên cao hơn dù sức mua thực tế trước thuế không hề tăng.]),
        [Nhà nước ban hành đạo luật mới nâng toàn bộ các mức thuế suất trong biểu thuế lũy tiến.],
        [Người lao động chủ động chuyển sang làm việc ở các ngành nghề có thuế suất ưu đãi.],
        [Doanh nghiệp trốn thuế bằng cách chia nhỏ các khoản chi trả thu nhập.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hiện tượng "Bracket Creep" xảy ra khi biểu thuế lũy tiến và mức giảm trừ gia cảnh được neo cố định bằng số tiền danh nghĩa trong khi nền kinh tế có lạm phát:
        - Lương của người lao động tăng tương ứng với lạm phát để giữ nguyên mức sống thực tế trước thuế.
        - Tuy nhiên, phần tăng thêm danh nghĩa này bị đẩy lên bậc thuế cao hơn và bị đánh thuế nặng hơn.
        - Kết quả là tỷ lệ thuế thực tế (Effective Tax Rate) tăng lên, làm sức mua thực tế sau thuế của người lao động bị sụt giảm.
    ]
)

// TN 5
#tn([Một doanh nghiệp xem xét hai phương án thưởng định kỳ hàng tháng cho một cán bộ quản lý đang có mức thu nhập tính thuế nằm ở Bậc 4 (thuế suất biên $20\%$):
- Phương án 1: Thưởng tiền mặt trực tiếp $2$ triệu đồng/tháng (khoản này cộng vào tiền lương chịu thuế TNCN với thuế suất $20\%$).
- Phương án 2: Chi trả bằng chế độ ăn giữa ca và phụ cấp trang phục bằng hiện vật/chứng từ hợp lệ trị giá $2$ triệu đồng/tháng (theo luật được miễn thuế TNCN trong hạn mức).
So với Phương án 1, Phương án 2 giúp cán bộ quản lý này tiết kiệm được bao nhiêu tiền thuế mỗi tháng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cột Phương án 1: Tiền mặt
    rect((0.8, 0), (2.4, 2.0), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    rect((0.8, 1.6), (2.4, 2.0), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((1.6, 1.8), text(size: 7pt, fill: rgb("991b1b"), weight: "bold")[Thuế $20\%$ ($400$ k)])
    content((1.6, 0.8), text(size: 7.5pt, fill: rgb("334155"), weight: "bold")[Tiền mặt\ Thực nhận $1","6$ tr\ ])
    content((1.6, -0.4), text(size: 8pt)[Phương án 1])

    // Cột Phương án 2: Phúc lợi
    rect((3.2, 0), (4.8, 2.0), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0f766e"))
    content((4.0, 1.0), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Phúc lợi miễn thuế\ Trọn vẹn $2","0$ tr\ ])
    content((4.0, -0.4), text(size: 8pt, fill: rgb("0f766e"), weight: "bold")[Phương án 2 (Tiết kiệm $400$ k)])
  })
]
],
    (
        True([$400$ nghìn đồng.]),
        [$200$ nghìn đồng.],
        [$100$ nghìn đồng.],
        [$600$ nghìn đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Đối với Phương án 1:
        Khoản tiền mặt $2$ triệu đồng chịu thuế suất biên $20\%$, tiền thuế phải nộp là:
        $ 2 " triệu" dot 20\% = 0","4 " (triệu đồng)" = 400 " (nghìn đồng)" $
        Người lao động chỉ thực nhận: $2 - 0","4 = 1","6$ triệu đồng.
        - Đối với Phương án 2:
        Chế độ phúc lợi hợp lý trong hạn mức luật định được miễn hoàn toàn thuế TNCN, người lao động được hưởng trọn vẹn giá trị sử dụng $2$ triệu đồng.

        Do đó, Phương án 2 giúp tiết kiệm đúng $400$ nghìn đồng tiền thuế mỗi tháng.
    ]
)

// TN 6
#tn([Khi thỏa thuận tuyển dụng, một ứng viên đề nghị mức lương thực nhận về tay sau thuế (Lương Net) là $30$ triệu đồng/tháng. Giả sử ứng viên là người độc thân (mức giảm trừ gia cảnh bản thân là $11$ triệu đồng/tháng, không có người phụ thuộc) và công ty chịu trách nhiệm đóng toàn bộ các khoản bảo hiểm bắt buộc theo luật. Bảng quy đổi thu nhập tính thuế cho biết nếu thu nhập sau thuế (Net) sau khi trừ giảm trừ gia cảnh nằm trong khoảng $15$ triệu đến $25","5$ triệu đồng, thì thu nhập tính thuế (Gross) được tính theo công thức:
$ "TNTT" = ("Thu nhập Net sau giảm trừ" - 0","75) / (0","85) $
Thu nhập tính thuế tương ứng của ứng viên này xấp xỉ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ quy đổi Net -> Gross
    rect((0.5, 0), (2.2, 1.8), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    content((1.35, 0.9), text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[Lương Net\ $30$ triệu\ ])

    line((2.2, 0.9), (3.6, 0.9), mark: (end: "stealth"), stroke: 1.5pt + rgb("64748b"))
    content((2.9, 1.2), text(size: 7.5pt)[Quy đổi])

    rect((3.6, 0), (5.5, 1.8), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0f766e"))
    content((4.55, 0.9), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[$"TNTT" approx 21","47$ tr\ (Lương Gross: $32","47$ tr)\ ])
  })
]
],
    (
        True([Khoảng $21","47$ triệu đồng.]),
        [Khoảng $19","00$ triệu đồng.],
        [Khoảng $25","50$ triệu đồng.],
        [Khoảng $23","15$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính thu nhập Net quy đổi sau khi trừ giảm trừ gia cảnh:
        $ "Net quy đổi" = 30 - 11 = 19 " (triệu đồng)" $
        Vì $15 < 19 <= 25","5$ nên mức thu nhập này tương ứng với Bậc 3 của biểu thuế.
        - Bước 2: Áp dụng công thức quy đổi từ Net sang Gross:
        $ "TNTT" = ("Net quy đổi" - 0","75) / (0","85) $

        #step([Lời giải chi tiết])
        Thay số vào công thức:
        $ "TNTT" = (19 - 0","75) / (0","85) = (18","25) / (0","85) approx 21","4706 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $21","47$ triệu đồng/tháng.
        (Tổng mức lương Gross trước thuế mà công ty phải chi trả là $21","47 + 11 = 32","47$ triệu đồng/tháng).
    ]
)

// TN 7
#tn([Theo Luật Thuế TNCN và các quy định hướng dẫn, người lao động tham gia đóng góp vào Quỹ hưu trí tự nguyện được trừ tối đa $1$ triệu đồng mỗi tháng ($12$ triệu đồng mỗi năm) vào thu nhập tính thuế. Một nhân viên quản lý cấp cao có thu nhập tính thuế nằm ở Bậc 5 (thuế suất biên $25\%$). Nếu nhân viên này trích đủ $12$ triệu đồng mỗi năm để đóng vào quỹ hưu trí tự nguyện, thì số tiền thuế TNCN thực tế mà nhân viên này tiết kiệm được trong năm là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ lá chắn thuế hưu trí tự nguyện
    rect((0.8, 0), (2.4, 2.2), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    content((1.6, 1.1), text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[Đóng quỹ hưu trí\ $12$ triệu/năm\ ])

    line((2.4, 1.1), (3.6, 1.1), mark: (end: "stealth"), stroke: 1.5pt + rgb("64748b"))
    content((3.0, 1.4), text(size: 7.5pt)[$times 25\%$])

    rect((3.6, 0), (5.2, 2.2), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("16a34a"))
    content((4.4, 1.1), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Tiết kiệm thuế\ $12 dot 25\% = 3$ tr\ (Chi phí ròng $9$ tr)\ ])
  })
]
],
    (
        True([$3","0$ triệu đồng/năm.]),
        [$1","2$ triệu đồng/năm.],
        [$2","4$ triệu đồng/năm.],
        [$4","5$ triệu đồng/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khoản đóng quỹ hưu trí tự nguyện đóng vai trò là "Lá chắn thuế" (Tax Shield), làm giảm trực tiếp phần thu nhập tính thuế ở bậc thuế suất cao nhất của người nộp thuế:
        $ "Tiết kiệm thuế" = ("Khoản đóng được trừ") dot "MTR" $

        #step([Lời giải chi tiết])
        Với khoản đóng tối đa là $12$ triệu đồng/năm và thuế suất biên $25\%$:
        $ "Tiết kiệm thuế" = 12 dot 25\% = 3","0 " (triệu đồng/năm)" $

        Điều này đồng nghĩa với việc để có $12$ triệu đồng tích lũy trong quỹ hưu trí, chi phí ròng thực tế mà nhân viên này phải bỏ ra chỉ là $12 - 3 = 9$ triệu đồng.
    ]
)

// TN 8
#tn([Một nhà đầu tư cá nhân thực hiện bán toàn bộ số cổ phiếu niêm yết trên sàn chứng khoán với tổng giá trị khớp lệnh là $500$ triệu đồng. Đồng thời, nhà đầu tư nhận được một khoản cổ tức bằng tiền mặt từ một doanh nghiệp khác với số tiền $40$ triệu đồng. Biết thuế suất thuế TNCN đối với chuyển nhượng chứng khoán là $0","1\%$ trên giá trị chuyển nhượng từng lần, và thuế suất đối với thu nhập từ đầu tư vốn (cổ tức) là $5\%$. Tổng số tiền thuế TNCN mà nhà đầu tư phải nộp cho cả hai hoạt động trên là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // 2 cột thuế đầu tư
    rect((0.8, 0), (2.5, 1.8), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))
    content((1.65, 0.9), text(size: 7.5pt, fill: rgb("5b21b6"), weight: "bold")[Bán cổ phiếu\ $500$ tr $times 0","1\%$\ $= 0","5$ triệu ($500$ k)\ ])

    rect((3.3, 0), (5.0, 1.8), fill: rgb("fef08a").lighten(50%), stroke: 1pt + rgb("ca8a04"))
    content((4.15, 0.9), text(size: 7.5pt, fill: rgb("854d0e"), weight: "bold")[Nhận cổ tức\ $40$ tr $times 5\%$\ $= 2","0$ triệu\ ])

    content((2.9, -0.4), text(size: 8.5pt, weight: "bold")[Tổng tiền thuế phải nộp: $0","5 + 2","0 = 2","5$ triệu đồng])
  })
]
],
    (
        True([$2","5$ triệu đồng.]),
        [$4","5$ triệu đồng.],
        [$1","5$ triệu đồng.],
        [$3","0$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Thuế TNCN từ chuyển nhượng chứng khoán:
        $ T_1 = ("Giá trị chuyển nhượng") dot 0","1\% $
        - Thuế TNCN từ đầu tư vốn (cổ tức):
        $ T_2 = ("Tiền cổ tức nhận được") dot 5\% $
        - Tổng thuế phải nộp: $T = T_1 + T_2$.

        #step([Lời giải chi tiết])
        1. Tiền thuế khi bán cổ phiếu:
        $ T_1 = 500 dot 0","1\% = 0","5 " (triệu đồng)" = 500 " (nghìn đồng)" $

        2. Tiền thuế từ tiền cổ tức:
        $ T_2 = 40 dot 5\% = 2","0 " (triệu đồng)" $

        Tổng số tiền thuế TNCN phải nộp:
        $ T = 0","5 + 2","0 = 2","5 " (triệu đồng)" $
    ]
)

// TN 9
#tn([Xét hàm thu nhập sau thuế $N(x) = x - T(x)$, trong đó $x$ là thu nhập tính thuế và $T(x)$ là tiền thuế TNCN tính theo biểu thuế lũy tiến từng phần với thuế suất biên $t_k in [5\%, 35\%]$. Nhận định nào sau đây là đúng về mặt toán học đối với hàm thu nhập sau thuế $N(x)$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[$x$ (Gross)])
    content((-0.4, 3.2), text(size: 8pt)[$N(x)$ (Net)])

    // Đường N(x) luôn tăng ngặt với hệ số góc 1 - t_k in [0.65, 0.95]
    line((0, 0), (2.0, 1.8), stroke: 1.5pt + rgb("0f766e"))
    line((2.0, 1.8), (4.8, 3.0), stroke: 1.5pt + rgb("0f766e"))
    content((3.5, 2.0), text(size: 8pt, fill: rgb("0f766e"), weight: "bold")[Hàm $N(x)$ luôn đồng biến ($N'(x) > 0$)])
  })
]
],
    (
        True([$N(x)$ luôn là hàm đồng biến nghiêm ngặt trên toàn bộ miền xác định, do đó tăng thu nhập trước thuế luôn làm tăng thu nhập sau thuế.]),
        [Tại các điểm ngưỡng nhảy bậc thuế, $N(x)$ bị gián đoạn và sụt giảm đột ngột.],
        [$N(x)$ đạt giá trị cực đại tại ngưỡng thuế suất $35\%$.],
        [Khi thu nhập trước thuế vượt ngưỡng $80$ triệu đồng, thu nhập sau thuế sẽ giảm dần.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Xét đạo hàm của hàm thu nhập sau thuế trên từng khoảng liên tục:
        $ N'(x) = 1 - T'(x) = 1 - "MTR" $
        Vì biểu thuế lũy tiến từng phần của Việt Nam có thuế suất biên tối đa là $35\% = 0","35$, nên:
        $ N'(x) = 1 - "MTR" >= 1 - 0","35 = 0","65 > 0 $
        Do $N'(x) > 0$ trên mọi khoảng và hàm $N(x)$ liên tục tại các điểm tiếp giáp ngưỡng, nên $N(x)$ là hàm đồng biến nghiêm ngặt trên $[0; +oo)$.

        #step([Lời giải chi tiết])
        Điều này chứng minh định lý kinh tế: Trong cơ chế thuế lũy tiến từng phần, việc được tăng lương không bao giờ làm cho thu nhập thực nhận sau thuế bị giảm đi (bác bỏ hiểu lầm dân gian về việc bị trừ hết tiền khi nhảy bậc thuế). Cứ tăng thêm $1$ đồng thu nhập trước thuế thì người lao động luôn giữ lại được ít nhất $0","65$ đồng sau thuế.
    ]
)

// TN 10
#tn([Một cá nhân chuyển nhượng một căn nhà gắn liền với quyền sử dụng đất với giá trị ghi trên hợp đồng công chứng là $3$ tỷ đồng ($3000$ triệu đồng). Theo quy định của Luật Thuế TNCN, thuế suất đối với hoạt động chuyển nhượng bất động sản là $2\%$ tính trên giá trị chuyển nhượng từng lần. Số tiền thuế TNCN mà cá nhân này phải nộp khi thực hiện chuyển nhượng bất động sản là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Thanh phân bổ giá trị chuyển nhượng
    rect((0.5, 0), (5.2, 1.6), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((0.5, 0), (5.1, 1.6), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0f766e"))
    rect((5.1, 0), (5.2, 1.6), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))

    content((2.8, 0.8), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Giá trị bất động sản: $3$ tỷ đồng\ Tiền thực nhận: $2940$ triệu đồng\ ])
    content((5.15, 2.0), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Thuế $2\%$\ ($60$ triệu)\ ])
    line((5.15, 1.7), (5.15, 1.1), mark: (end: "stealth"), stroke: 1pt + rgb("dc2626"))
  })
]
],
    (
        True([$60$ triệu đồng.]),
        [$30$ triệu đồng.],
        [$150$ triệu đồng.],
        [$15$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Thuế TNCN đối với hoạt động chuyển nhượng bất động sản của cá nhân được tính theo công thức:
        $ "Thuế TNCN" = ("Giá trị chuyển nhượng") dot 2\% $

        #step([Lời giải chi tiết])
        Với giá chuyển nhượng là $3$ tỷ đồng ($3000$ triệu đồng):
        $ "Thuế TNCN" = 3000 dot 2\% = 60 " (triệu đồng)" $

        (Trừ trường hợp cá nhân chỉ có duy nhất một nhà ở, đất ở tại Việt Nam và đáp ứng đủ các điều kiện miễn thuế theo quy định của pháp luật).
    ]
)

// TN 11
#tn([Một khách hàng may mắn trúng giải độc đắc xổ số điện toán với tổng giá trị giải thưởng là $2$ tỷ đồng ($2000$ triệu đồng). Theo Luật Thuế TNCN, thu nhập từ trúng thưởng chịu thuế suất $10\%$ tính trên phần giá trị giải thưởng vượt trên $10$ triệu đồng cho mỗi vé trúng thưởng. Số tiền thực nhận sau thuế mà khách hàng này được nhận về là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Phân bổ giải thưởng trúng số
    rect((0.5, 0), (5.5, 1.8), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((0.5, 0), (0.7, 1.8), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    rect((0.7, 0), (4.5, 1.8), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0f766e"))
    rect((4.5, 0), (5.5, 1.8), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))

    content((0.6, -0.3), text(size: 7pt)[$10$ tr])
    content((2.6, 0.9), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Thực nhận sau thuế\ $1801$ triệu đồng ($1","801$ tỷ)\ ])
    content((5.0, 0.9), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Thuế $10\%$\ $199$ tr\ ])
  })
]
],
    (
        True([$1","801$ tỷ đồng ($1801$ triệu đồng).]),
        [$1","800$ tỷ đồng ($1800$ triệu đồng).]),
        [$1","900$ tỷ đồng ($1900$ triệu đồng).]),
        [$1","990$ tỷ đồng ($1990$ triệu đồng).]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính thu nhập tính thuế từ trúng thưởng:
        $ "TNTT" = "Tổng giá trị trúng thưởng" - 10 " triệu đồng" $
        - Bước 2: Tính số thuế TNCN phải khấu trừ:
        $ "Thuế" = "TNTT" dot 10\% $
        - Bước 3: Số tiền thực nhận sau thuế:
        $ "Thực nhận" = "Tổng giải thưởng" - "Thuế" $

        #step([Lời giải chi tiết])
        1. Phần thu nhập chịu thuế:
        $ 2000 - 10 = 1990 " (triệu đồng)" $

        2. Số tiền thuế TNCN phải nộp:
        $ 1990 dot 10\% = 199 " (triệu đồng)" $

        3. Số tiền thực nhận:
        $ 2000 - 199 = 1801 " (triệu đồng)" = 1","801 " (tỷ đồng)" $
    ]
)

// TN 12
#tn([Trong một gia đình, hai vợ chồng có mức thu nhập khác nhau:
- Người chồng có thu nhập tính thuế cao, đang chịu thuế suất biên là $20\%$ (Bậc 4).
- Người vợ có thu nhập tính thuế thấp hơn, đang chịu thuế suất biên là $10\%$ (Bậc 2).
Gia đình có $1$ đứa con nhỏ đủ điều kiện đăng ký người phụ thuộc để giảm trừ gia cảnh với mức giảm trừ $4","4$ triệu đồng/tháng. Để tối ưu hóa tài chính (giảm tối đa tổng số tiền thuế TNCN mà cả gia đình phải nộp), gia đình nên đăng ký người phụ thuộc này cho ai và mỗi tháng tiết kiệm thêm được bao nhiêu tiền thuế so với phương án còn lại?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cột Chồng vs Vợ
    rect((0.8, 0), (2.5, 2.2), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0f766e"))
    content((1.65, 1.1), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Đăng ký cho Chồng\ Giảm ở Bậc $20\%$\ Tiết kiệm $880$ k/th\ ])
    content((1.65, -0.4), text(size: 8pt, weight: "bold")[Chồng ($"MTR" = 20\%$)])

    rect((3.3, 0), (5.0, 1.3), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((4.15, 0.65), text(size: 7.5pt, fill: rgb("475569"))[Đăng ký cho Vợ\ Giảm ở Bậc $10\%$\ Tiết kiệm $440$ k/th\ ])
    content((4.15, -0.4), text(size: 8pt)[Vợ ($"MTR" = 10\%$)])
  })
]
],
    (
        True([Nên đăng ký cho Chồng, tiết kiệm thêm được $440$ nghìn đồng/tháng.]),
        [Nên đăng ký cho Vợ, tiết kiệm thêm được $440$ nghìn đồng/tháng.],
        [Đăng ký cho ai cũng mang lại mức tiết kiệm thuế như nhau.],
        [Nên đăng ký cho Chồng, tiết kiệm thêm được $880$ nghìn đồng/tháng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Mức tiết kiệm tiền thuế khi giảm trừ thêm một khoản $D$ phụ thuộc trực tiếp vào mức thuế suất biên $"MTR"$ của người đăng ký:
        $ "Tiền thuế giảm" = D dot "MTR" $
        Do đó, để tối đa hóa số tiền thuế được giảm, luôn ưu tiên đăng ký người phụ thuộc cho người có mức thuế suất biên cao hơn.

        #step([Lời giải chi tiết])
        - Nếu đăng ký cho Chồng ($"MTR" = 20\%$):
        $ Delta T_"Chồng" = 4","4 " triệu" dot 20\% = 0","88 " (triệu đồng)" = 880 " (nghìn đồng)" $
        - Nếu đăng ký cho Vợ ($"MTR" = 10\%$):
        $ Delta T_"Vợ" = 4","4 " triệu" dot 10\% = 0","44 " (triệu đồng)" = 440 " (nghìn đồng)" $

        Chênh lệch tiết kiệm được:
        $ 880 - 440 = 440 " (nghìn đồng/tháng)" $

        Vậy gia đình nên đăng ký người phụ thuộc cho người Chồng để tiết kiệm thêm được $440$ nghìn đồng mỗi tháng.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 13 đến câu 16. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Xét hàm thuế thu nhập cá nhân $T(x)$ tính theo biểu thuế lũy tiến từng phần với $x >= 0$ là thu nhập tính thuế hàng tháng (đơn vị: triệu đồng). Biểu thuế quy định $7$ bậc với các ngưỡng thu nhập $5; 10; 18; 32; 52; 80$ triệu đồng và các mức thuế suất tương ứng $5\%, 10\%, 15\%, 20\%, 25\%, 30\%, 35\%$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[$x$ (tr)])
    content((-0.4, 3.2), text(size: 8pt)[$T(x)$ (tr)])

    // Đồ thị hàm thuế liên tục từng khúc với độ dốc tăng dần
    line((0, 0), (1.0, 0.25), stroke: 1.2pt + rgb("0f766e"))
    line((1.0, 0.25), (2.0, 0.75), stroke: 1.2pt + rgb("0f766e"))
    line((2.0, 0.75), (3.0, 1.45), stroke: 1.2pt + rgb("0f766e"))
    line((3.0, 1.45), (4.2, 2.3), stroke: 1.2pt + rgb("0f766e"))
    line((4.2, 2.3), (5.5, 3.0), stroke: 1.2pt + rgb("0f766e"))

    content((2.5, 2.5), text(size: 8pt, fill: rgb("0f766e"), weight: "bold")[Đồ thị liên tục từng khúc (Piecewise Linear)])
  })
]
],
    (
        True([Hàm thuế $T(x)$ là hàm số liên tục trên toàn bộ nửa khoảng $[0; +oo)$.]),
        True([Đạo hàm cấp một $T'(x)$ (thuế suất biên) là hàm bậc thang không giảm tại các điểm không thuộc tập các điểm ngưỡng.]),
        True([Thuế suất bình quân $A(x) = T(x) / x$ là hàm số đồng biến nghiêm ngặt trên khoảng $(0; +oo)$.]),
        True([Nếu một người có thu nhập tính thuế $x = 50$ triệu đồng/tháng (thuộc Bậc 5) thì số tiền thuế TNCN phải nộp là $9","25$ triệu đồng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Tại mỗi điểm ngưỡng $x_k in {5; 10; 18; 32; 52; 80}$, giới hạn bên trái và bên phải của hàm thuế $T(x)$ đều bằng nhau và bằng giá trị thuế tích lũy của bậc trước. Do đó $T(x)$ là hàm số liên tục trên $[0; +oo)$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Trên mỗi khoảng mở giữa các ngưỡng, $T'(x) = t_k$ là hằng số bằng chính thuế suất của bậc đó. Vì các thuế suất tăng dần $5\% < 10\% < 15\% < 20\% < 25\% < 30\% < 35\%$ nên $T'(x)$ là hàm bậc thang đơn điệu tăng (không giảm).
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Đạo hàm của hàm thuế suất bình quân:
        $ A'(x) = (T'(x) dot x - T(x)) / (x^2) = (x dot "MTR" - T(x)) / (x^2) $
        Trong thuế lũy tiến, thuế suất biên của đồng thu nhập cuối cùng luôn lớn hơn thuế suất bình quân của toàn bộ các đồng thu nhập trước đó:
        $ "MTR" > T(x) / x <==> x dot "MTR" - T(x) > 0 $
        Do đó $A'(x) > 0$ với mọi $x > 0$, hàm thuế suất bình quân luôn đồng biến ngặt.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Với $x = 50$ triệu đồng, áp dụng công thức tính nhanh của Bậc 5:
        $ T = 25\% dot x - 3","25 = 50 dot 0","25 - 3","25 = 12","50 - 3","25 = 9","25 " (triệu đồng)" $
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 2
#ds([Một ứng viên quản lý cấp trung được công ty mời vào làm việc với hai phương án đề xuất hợp đồng lao động:
- Phương án Lương Gross: Lương thỏa thuận là $40$ triệu đồng/tháng. Nhân viên tự trích nộp các khoản bảo hiểm bắt buộc theo tỷ lệ $10","5\%$ trên mức lương $40$ triệu ($4","2$ triệu đồng) và tự nộp thuế TNCN theo luật.
- Phương án Lương Net: Lương thỏa thuận là $32$ triệu đồng/tháng thực nhận về tài khoản ngân hàng. Toàn bộ tiền bảo hiểm bắt buộc và thuế TNCN do công ty chi trả thay toàn bộ.
Giả định nhân viên là người độc thân (mức giảm trừ bản thân là $11$ triệu đồng/tháng, không có người phụ thuộc).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cột Phương án Gross vs Net
    rect((0.8, 0), (2.5, 2.5), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0f766e"))
    content((1.65, 1.25), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Phương án Gross\ Lương: $40$ tr\ Net: $32","49$ tr\ ])
    content((1.65, -0.4), text(size: 8pt, weight: "bold")[Gross ($40$ tr)])

    rect((3.3, 0), (5.0, 2.2), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((4.15, 1.1), text(size: 7.5pt, fill: rgb("334155"), weight: "bold")[Phương án Net\ Lương cố định\ Net: $32","00$ tr\ ])
    content((4.15, -0.4), text(size: 8pt)[Net ($32$ tr)])
  })
]
],
    (
        True([Ở phương án Lương Gross, số tiền bảo hiểm bắt buộc trích nộp hàng tháng của nhân viên là $4","2$ triệu đồng.]),
        True([Thu nhập tính thuế TNCN của nhân viên ở phương án Lương Gross là $24","8$ triệu đồng/tháng.]),
        True([Số tiền thuế TNCN mà nhân viên phải nộp ở phương án Lương Gross là $3","31$ triệu đồng/tháng.]),
        True([So sánh số tiền thực nhận về tay, phương án Lương Gross có lợi hơn phương án Lương Net khoảng $490$ nghìn đồng mỗi tháng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Tiền bảo hiểm bắt buộc ($10","5\%$):
        $ 40 dot 10","5\% = 4","2 " (triệu đồng/tháng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Thu nhập tính thuế:
        $ "TNTT" = "Lương Gross" - "Bảo hiểm" - "Giảm trừ gia cảnh" = 40 - 4","2 - 11 = 24","8 " (triệu đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Với $"TNTT" = 24","8$ triệu đồng, nằm ở Bậc 4 (từ trên $18$ đến $32$ triệu đồng). Áp dụng công thức rút gọn Bậc 4:
        $ T = 20\% dot "TNTT" - 1","65 = 24","8 dot 0","20 - 1","65 = 4","96 - 1","65 = 3","31 " (triệu đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Số tiền thực nhận về tay ở phương án Lương Gross:
        $ "Net"_"Gross" = 40 - 4","2 - 3","31 = 32","49 " (triệu đồng)" $
        So với mức $32$ triệu đồng của phương án Lương Net:
        $ 32","49 - 32","00 = 0","49 " (triệu đồng)" = 490 " (nghìn đồng)" $
        Vậy phương án Gross mang lại thu nhập thực nhận cao hơn $490$ nghìn đồng/tháng.
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 3
#ds([Một doanh nghiệp thuê một chuyên gia nước ngoài sang làm việc với mức lương chịu thuế cố định là $100$ triệu đồng mỗi tháng. Ngoài tiền lương, công ty thuê cho chuyên gia một căn hộ chung cư cao cấp với chi phí thuê nhà thực tế là $20$ triệu đồng/tháng do công ty thanh toán trực tiếp cho chủ nhà.
Theo quy định hiện hành của Luật Thuế TNCN: Tiền thuê nhà do người sử dụng lao động trả thay được tính vào thu nhập chịu thuế theo số thực tế chi trả nhưng tối đa không quá $15\%$ tổng thu nhập chịu thuế phát sinh (chưa bao gồm tiền thuê nhà).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ trần tiền thuê nhà 15%
    rect((0.5, 0), (2.3, 2.2), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    content((1.4, 1.1), text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[Lương cố định\ $100$ tr/th\ ])

    rect((2.6, 0), (4.4, 2.2), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0f766e"))
    content((3.5, 1.1), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Trần tiền nhà $15\%$\ $15$ tr chịu thuế\ ])

    rect((4.7, 0), (5.7, 1.2), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((5.2, 0.6), text(size: 7pt, fill: rgb("166534"), weight: "bold")[Miễn thuế\ $5$ tr\ ])
  })
]
],
    (
        True([Khoản tiền thuê nhà tối đa bị tính vào thu nhập chịu thuế của chuyên gia là $15$ triệu đồng/tháng.]),
        True([Khoản tiền thuê nhà vượt mức $5$ triệu đồng ($20 - 15 = 5$ triệu) được miễn tính vào thu nhập chịu thuế TNCN của chuyên gia.]),
        True([Tổng thu nhập chịu thuế (gồm lương và tiền nhà tính thuế) của chuyên gia là $115$ triệu đồng/tháng.]),
        False([Nếu tiền thuê nhà thực tế tăng lên thành $25$ triệu đồng/tháng, tổng thu nhập chịu thuế của chuyên gia sẽ tăng thêm tương ứng $10$ triệu đồng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Mức trần $15\%$ được tính trên tổng thu nhập chịu thuế chưa bao gồm tiền nhà:
        $ "Trần tiền nhà tính thuế" = 100 dot 15\% = 15 " (triệu đồng/tháng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Tiền thuê nhà thực tế là $20$ triệu đồng, vượt mức trần $15$ triệu đồng. Do đó chỉ tính $15$ triệu vào thu nhập chịu thuế, phần chênh lệch $5$ triệu đồng không bị tính thuế TNCN.
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Tổng thu nhập chịu thuế hàng tháng của chuyên gia:
        $ 100 + 15 = 115 " (triệu đồng/tháng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Vì mức trần $15\%$ vẫn là $15$ triệu đồng (do lương cố định $100$ triệu không đổi), nên dù tiền thuê nhà có tăng lên $25$ triệu hay $30$ triệu đồng thì khoản tính vào thu nhập chịu thuế vẫn giữ nguyên là $15$ triệu đồng. Tổng thu nhập chịu thuế vẫn là $115$ triệu đồng chứ không hề tăng thêm.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#ds([Một kỹ sư có thu nhập tính thuế bình thường ổn định là $30$ triệu đồng/tháng (đang chịu thuế suất biên $20\%$, Bậc 4). Do yêu cầu tiến độ dự án, kỹ sư được công ty đề nghị làm thêm giờ vào các ngày nghỉ cuối tuần với tổng tiền công làm thêm giờ là $10$ triệu đồng.
Theo quy định của Bộ luật Lao động và Luật Thuế TNCN:
- Tiền lương làm việc vào ngày nghỉ cuối tuần được trả ít nhất bằng $200\%$ so với đơn giá tiền lương ngày làm việc bình thường.
- Phần tiền lương trả cao hơn do làm thêm giờ (ở đây là $100\%$ phụ trội) được miễn hoàn toàn thuế thu nhập cá nhân.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ phân bổ tiền làm thêm giờ
    rect((0.8, 0), (2.8, 1.8), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("16a34a"))
    content((1.8, 0.9), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Phần phụ trội $100\%$\ $5$ triệu đồng\ MIỄN THUẾ $100\%$\ ])

    rect((3.2, 0), (5.2, 1.8), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0f766e"))
    content((4.2, 0.9), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Phần lương cơ bản $100\%$\ $5$ triệu đồng\ CHỊU THUẾ LŨY TIẾN\ ])

    content((3.0, -0.4), text(size: 8.5pt, weight: "bold")[Phân bổ $10$ triệu đồng tiền công làm thêm giờ])
  })
]
],
    (
        False([Toàn bộ số tiền $10$ triệu đồng làm thêm giờ đều bị cộng dồn vào thu nhập tính thuế TNCN của tháng đó.]),
        True([Khoản tiền được miễn thuế TNCN từ thu nhập làm thêm giờ là $5$ triệu đồng.]),
        True([Khoản tiền làm thêm giờ chịu thuế $5$ triệu đồng sẽ làm thu nhập tính thuế của kỹ sư tăng từ $30$ triệu lên $35$ triệu đồng, khiến một phần thu nhập bị chịu thuế suất biên $25\%$ (Bậc 5).]),
        True([Tổng số tiền thuế TNCN phát sinh thêm từ khoản làm thêm giờ này là $1","15$ triệu đồng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Theo luật thuế TNCN, phần tiền lương trả thêm do làm thêm giờ (phần chênh lệch cao hơn lương ngày thường) được miễn thuế. Do đó không phải toàn bộ 10 triệu đồng đều bị đánh thuế.
        Khẳng định ý a là *SAI*.

        #step([Phân tích ý b])
        Vì tiền lương làm thêm ngày nghỉ bằng $200\%$ lương bình thường, nên trong $10$ triệu đồng này:
        - Tiền lương theo mức bình thường ($100\%$): $5$ triệu đồng (chịu thuế).
        - Tiền lương trả cao hơn do làm thêm giờ ($100\%$): $5$ triệu đồng (được miễn thuế).
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Thu nhập tính thuế tăng thêm là $5$ triệu đồng. Thu nhập ban đầu là $30$ triệu, ngưỡng trên của Bậc 4 là $32$ triệu đồng:
        - Phần từ $30$ đến $32$ triệu đồng ($2$ triệu) chịu thuế suất Bậc 4 ($20\%$).
        - Phần vượt trên $32$ triệu là từ $32$ đến $35$ triệu đồng ($3$ triệu) chịu thuế suất Bậc 5 ($25\%$).
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Số thuế TNCN phát sinh thêm từ $5$ triệu tính thuế:
        $ Delta T = 2 dot 20\% + 3 dot 25\% = 0","40 + 0","75 = 1","15 " (triệu đồng)" $
        Khẳng định ý d là *ĐÚNG*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1
#tln([Một người lao động có thu nhập tính thuế sau khi giảm trừ là $"TNTT" = 8$ triệu đồng mỗi tháng (nằm ở Bậc 2 của biểu thuế lũy tiến: $5$ triệu đầu chịu $5\%$, phần trên $5$ triệu đến $10$ triệu chịu $10\%$). Số tiền thuế TNCN mà người này phải nộp hàng tháng là bao nhiêu nghìn đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.6), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0f766e"))
    content((2.8, 0.8), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Thuế Bậc 1 ($5$ tr $times 5\%$): $250$ k\ Thuế Bậc 2 ($3$ tr $times 10\%$): $300$ k\ Tổng thuế $= 550$ nghìn đồng\ ])
  })
]
],
    [550],
    loigiai: [
        #step([Lời giải chi tiết])
        Với $"TNTT" = 8$ triệu đồng:
        - Bậc 1: $5 dot 5\% = 0","25$ (triệu đồng) $= 250$ nghìn đồng.
        - Bậc 2: $(8 - 5) dot 10\% = 3 dot 10\% = 0","30$ (triệu đồng) $= 300$ nghìn đồng.

        Tổng số tiền thuế:
        $ 250 + 300 = 550 " (nghìn đồng)" $

        Điền đáp số: *550*.
    ]
)

// TLN 2
#tln([Một cá nhân có thu nhập chịu thuế hàng tháng là $20$ triệu đồng, là người độc thân (mức giảm trừ gia cảnh bản thân $11$ triệu đồng/tháng, không có người phụ thuộc). Cá nhân đóng các khoản bảo hiểm bắt buộc theo tỷ lệ $10","5\%$ trên mức lương đóng bảo hiểm $8$ triệu đồng ($0","84$ triệu đồng). Số tiền thuế TNCN mà cá nhân này phải nộp hàng tháng là bao nhiêu nghìn đồng? (làm tròn kết quả đến hàng đơn vị của nghìn đồng)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.6), fill: rgb("f1f5f9"), stroke: 1.2pt + rgb("94a3b8"))
    content((2.8, 0.8), text(size: 8pt, fill: rgb("334155"), weight: "bold")[$"TNTT" = 20 - 11 - 0","84 = 8","16$ tr\ Thuế TNCN $= 566$ nghìn đồng\ ])
  })
]
],
    [566],
    loigiai: [
        #step([Lời giải chi tiết])
        1. Tính thu nhập tính thuế $"TNTT"$:
        $ "TNTT" = 20 - 11 - 0","84 = 8","16 " (triệu đồng)" $

        2. Thu nhập $8","16$ triệu đồng thuộc Bậc 2:
        - Bậc 1: $5 dot 5\% = 0","25$ triệu đồng.
        - Bậc 2: $(8","16 - 5) dot 10\% = 3","16 dot 10\% = 0","316$ triệu đồng.

        Tổng tiền thuế phải nộp:
        $ T = 0","25 + 0","316 = 0","566 " (triệu đồng)" = 566 " (nghìn đồng)" $

        Điền đáp số: *566*.
    ]
)

// TLN 3
#tln([Một chuyên gia có thu nhập tính thuế hàng tháng là $"TNTT" = 45$ triệu đồng. Theo Biểu thuế lũy tiến từng phần, Bậc 5 áp dụng cho phần thu nhập trên $32$ đến $52$ triệu đồng với thuế suất $25\%$ và công thức tính nhanh số thuế phải nộp là:
$ T = 25\% dot "TNTT" - 3","25 " (triệu đồng)" $
Số tiền thuế TNCN mà chuyên gia này phải nộp mỗi tháng là bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0f766e"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("115e59"), weight: "bold")[Công thức rút gọn: $T = 45 dot 25\% - 3","25$\ $= 11","25 - 3","25 = 8","00$ triệu đồng\ ])
  })
]
],
    [8],
    loigiai: [
        #step([Lời giải chi tiết])
        Áp dụng công thức tính nhanh thuế Bậc 5:
        $ T = 25\% dot 45 - 3","25 = 11","25 - 3","25 = 8","00 " (triệu đồng)" $

        Điền đáp số: *8*.
    ]
)

// TLN 4
#tln([Một cá nhân trúng thưởng giải nhất xổ số truyền thống với giá trị giải thưởng là $1","5$ tỷ đồng ($1500$ triệu đồng). Biết thuế suất thuế TNCN đối với thu nhập từ trúng thưởng là $10\%$ tính trên phần giá trị giải thưởng vượt trên $10$ triệu đồng. Số tiền thuế TNCN mà cá nhân này phải nộp là bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("dc2626"))
    content((2.8, 0.75), text(size: 8pt, fill: rgb("991b1b"), weight: "bold")[Thuế trúng thưởng: $(1500 - 10) dot 10\%$\ $= 1490 dot 10\% = 149$ triệu đồng\ ])
  })
]
],
    [149],
    loigiai: [
        #step([Lời giải chi tiết])
        Số tiền chịu thuế từ trúng thưởng:
        $ 1500 - 10 = 1490 " (triệu đồng)" $

        Số tiền thuế TNCN phải nộp:
        $ 1490 dot 10\% = 149 " (triệu đồng)" $

        Điền đáp số: *149*.
    ]
)

// TLN 5
#tln([Một người bán một lô đất với giá chuyển nhượng trên hợp đồng công chứng là $4","5$ tỷ đồng ($4500$ triệu đồng). Thuế suất thuế TNCN đối với hoạt động chuyển nhượng bất động sản là $2\%$ tính trên giá trị chuyển nhượng. Số tiền thuế TNCN người này phải nộp là bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("dbeafe"), stroke: 1.2pt + rgb("2563eb"))
    content((2.8, 0.75), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Thuế chuyển nhượng BĐS: $4500 dot 2\%$\ $= 90$ triệu đồng\ ])
  })
]
],
    [90],
    loigiai: [
        #step([Lời giải chi tiết])
        Số tiền thuế TNCN từ chuyển nhượng bất động sản:
        $ "Thuế" = 4500 dot 2\% = 90 " (triệu đồng)" $

        Điền đáp số: *90*.
    ]
)

// TLN 6
#tln([Trong Biểu thuế thu nhập cá nhân lũy tiến từng phần hiện hành của Việt Nam áp dụng đối với thu nhập từ tiền lương, tiền công, mức thuế suất biên cao nhất (ở Bậc 7 - áp dụng cho phần thu nhập tính thuế trên $80$ triệu đồng/tháng) là bao nhiêu phần trăm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((1.0, 0), (4.5, 1.5), fill: rgb("fef08a").lighten(50%), stroke: 1.2pt + rgb("ca8a04"))
    content((2.75, 0.75), text(size: 8.5pt, fill: rgb("854d0e"), weight: "bold")[Bậc 7 (Thu nhập $> 80$ tr/tháng):\ Thuế suất biên cao nhất: $35\%$\ ])
  })
]
],
    [35],
    loigiai: [
        #step([Lời giải chi tiết])
        Biểu thuế lũy tiến từng phần của Việt Nam gồm 7 bậc với các mức thuế suất:
        $5\%, 10\%, 15\%, 20\%, 25\%, 30\%, 35\%$.
        Mức thuế suất biên cao nhất là ở Bậc 7 với mức $35\%$.

        Điền đáp số: *35*.
    ]
)

]

#make-questions()
