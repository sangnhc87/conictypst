#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("ea580c")

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH",
  exam-title: "CHỦ ĐỀ 2H: THUÊ TÀI CHÍNH VS MUA ĐỨT & ĐIỂM HÒA VỐN (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "518",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một doanh nghiệp đầu tư một hệ thống máy móc sản xuất trị giá $1$ tỷ đồng ($1000$ triệu đồng). Tài sản được trích khấu hao theo phương pháp đường thẳng trong $5$ năm, giá trị thanh lý ước tính khi hết hạn sử dụng bằng $0$. Biết thuế suất thuế thu nhập doanh nghiệp (TNDN) là $20\%$. Khoản khấu hao hàng năm đóng vai trò là "Lá chắn thuế" (Depreciation Tax Shield), giúp giảm số tiền thuế TNDN phải nộp mỗi năm. Với chi phí sử dụng vốn là $10\%$/năm, tổng giá trị hiện tại của chuỗi các khoản tiết kiệm thuế từ khấu hao trong $5$ năm xấp xỉ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    // Các mũi tên lá chắn thuế 40 tr mỗi năm
    line((1.0, 0), (1.0, 1.1), mark: (start: "stealth"), stroke: 1.2pt + rgb("ea580c"))
    content((1.0, -0.35), text(size: 8pt)[$1$])
    content((1.0, 1.3), text(size: 7.5pt, fill: rgb("ea580c"))[$40$ tr])

    line((2.0, 0), (2.0, 1.1), mark: (start: "stealth"), stroke: 1.2pt + rgb("ea580c"))
    content((2.0, -0.35), text(size: 8pt)[$2$])
    content((2.0, 1.3), text(size: 7.5pt, fill: rgb("ea580c"))[$40$ tr])

    content((3.2, 0.5), text(size: 8pt, fill: rgb("ea580c"))[$dots$])

    line((5.0, 0), (5.0, 1.1), mark: (start: "stealth"), stroke: 1.2pt + rgb("ea580c"))
    content((5.0, -0.35), text(size: 8pt)[$5$])
    content((5.0, 1.3), text(size: 7.5pt, fill: rgb("ea580c"))[$40$ tr])

    content((3.0, 2.0), text(size: 8pt, fill: rgb("ea580c"), weight: "bold")[$"PV"_"Lá chắn thuế" approx 151","63$ triệu đồng])
  })
]
],
    (
        True([Khoảng $151","63$ triệu đồng.]),
        [Khoảng $200","00$ triệu đồng.],
        [Khoảng $125","40$ triệu đồng.],
        [Khoảng $180","25$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Mức trích khấu hao hàng năm theo phương pháp đường thẳng:
        $ D = ("Nguyên giá" - "Giá trị thanh lý") / n = 1000 / 5 = 200 " (triệu đồng/năm)" $
        - Số tiền thuế TNDN tiết kiệm được mỗi năm (Lá chắn thuế):
        $ "Tax Shield" = D dot T_c = 200 dot 20\% = 40 " (triệu đồng/năm)" $
        - Giá trị hiện tại của chuỗi 5 khoản lá chắn thuế với lãi suất chiết khấu $r = 10\%$:
        $ "PV" = "Tax Shield" dot (1 - (1 + r)^(-n)) / r $

        #step([Lời giải chi tiết])
        Thay số vào công thức:
        $ "PV" = 40 dot (1 - (1 + 0","10)^(-5)) / (0","10) $
        $ (1","10)^(-5) approx 0","620921 ==> 1 - 0","620921 = 0","379079 $
        $ "PV" = 40 dot (0","379079) / (0","10) = 40 dot 3","79079 approx 151","63 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $151","63$ triệu đồng.
    ]
)

// TN 2
#tn([Một doanh nghiệp thuê một xe chở hàng chuyên dụng phục vụ phân phối sản phẩm với tiền thuê cố định là $120$ triệu đồng mỗi năm, thanh toán vào cuối mỗi năm. Biết toàn bộ tiền thuê xe được tính vào chi phí sản xuất kinh doanh hợp lý khi xác định thu nhập chịu thuế TNDN, và thuế suất thuế TNDN là $20\%$. Dòng tiền chi trả thực tế sau thuế (After-tax cash outflow) của doanh nghiệp cho tiền thuê xe mỗi năm là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Thanh phân bổ tiền thuê 120 tr
    rect((0.8, 0), (4.8, 1.8), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((0.8, 0), (4.0, 1.8), fill: rgb("ffedd5"), stroke: 1.2pt + rgb("ea580c"))
    rect((4.0, 0), (4.8, 1.8), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))

    content((2.4, 0.9), text(size: 8pt, fill: rgb("9a3412"), weight: "bold")[Thực chi sau thuế $80\%$\ $96$ triệu đồng\ ])
    content((4.4, 0.9), text(size: 7pt, fill: rgb("166534"), weight: "bold")[Tiết kiệm thuế $20\%$\ $24$ tr\ ])
    content((2.8, -0.4), text(size: 8.5pt, weight: "bold")[Tiền thuê danh nghĩa: $120$ triệu đồng/năm])
  })
]
],
    (
        True([$96$ triệu đồng/năm.]),
        [$120$ triệu đồng/năm.],
        [$100$ triệu đồng/năm.],
        [$84$ triệu đồng/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Vì tiền thuê được coi là chi phí hợp lý được trừ, nó tạo ra một khoản tiết kiệm thuế TNDN bằng:
        $ "Tiết kiệm thuế" = L dot T_c $
        Do đó, dòng tiền ròng thực tế mà doanh nghiệp phải chi ra sau thuế là:
        $ "CF"_"sau thuế" = L - L dot T_c = L dot (1 - T_c) $

        #step([Lời giải chi tiết])
        Với tiền thuê $L = 120$ triệu đồng và $T_c = 20\% = 0","20$:
        $ "CF"_"sau thuế" = 120 dot (1 - 0","20) = 120 dot 0","80 = 96 " (triệu đồng/năm)" $
    ]
)

// TN 3
#tn([Khi phân tích quyết định tài chính "Thuê hay Mua" (Lease-versus-Buy Decision), dòng tiền phát sinh từ hợp đồng thuê tài sản có mức độ rủi ro tương đương với dòng tiền trả nợ vay ngân hàng (do cam kết trả tiền thuê có tính chất pháp lý bắt buộc như nghĩa vụ trả nợ). Nếu lãi suất vay vốn ngân hàng trước thuế của doanh nghiệp là $r_d = 10\%$/năm và thuế suất thuế TNDN là $T_c = 20\%$, thì mức lãi suất chiết khấu sau thuế thích hợp để chiết khấu dòng tiền trong bài toán Thuê hay Mua là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.6), fill: rgb("ffedd5"), stroke: 1.2pt + rgb("ea580c"))
    content((2.8, 0.8), text(size: 8.5pt, fill: rgb("9a3412"), weight: "bold")[Chi phí nợ sau thuế:\ $r_d^* = r_d dot (1 - T_c) = 10\% dot (1 - 0","20) = 8\%$/năm\ ])
  })
]
],
    (
        True([$8","0\%$/năm.]),
        [$10","0\%$/năm.],
        [$12","0\%$/năm.],
        [$2","0\%$/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo lý thuyết tài chính doanh nghiệp hiện đại:
        Quyết định thuê tài chính thực chất là một hình thức tài trợ bằng nợ thay thế cho việc đi vay ngân hàng để mua tài sản.
        Vì chi phí lãi vay ngân hàng được khấu trừ thuế TNDN, nên chi phí sử dụng nợ sau thuế của doanh nghiệp là:
        $ r_d^* = r_d dot (1 - T_c) $
        Đây chính là lãi suất chiết khấu phi rủi ro phù hợp để chiết khấu các dòng tiền sau thuế của phương án thuê và phương án mua.

        #step([Lời giải chi tiết])
        Với $r_d = 10\%$ và $T_c = 20\%$:
        $ r_d^* = 10\% dot (1 - 0","20) = 8","0\%$/năm
    ]
)

// TN 4
#tn([Một doanh nghiệp cần một máy móc công nghiệp trị giá $500$ triệu đồng phục vụ dự án trong $3$ năm. Doanh nghiệp đang cân nhắc giữa hai phương án:
- Phương án Mua: Bỏ vốn mua đứt ban đầu $500$ triệu đồng, trích khấu hao đường thẳng $166","67$ triệu đồng/năm trong $3$ năm, tạo lá chắn thuế $33","33$ triệu đồng/năm.
- Phương án Thuê tài chính: Tiền thuê $190$ triệu đồng/năm trả vào cuối mỗi năm trong $3$ năm (chi phí thuê sau thuế là $152$ triệu đồng/năm).
Lãi suất chiết khấu sau thuế áp dụng là $8\%$/năm. Lợi thế ròng của việc thuê (NAL - Net Advantage to Leasing) được xác định bằng:
$ "NAL" = "PV"("Chi phí Mua") - "PV"("Chi phí Thuê") $
Giá trị của $"NAL"$ và quyết định tài chính hợp lý của doanh nghiệp là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // So sánh PV chi phí Mua vs Thuê
    rect((0.8, 0), (2.5, 2.5), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((1.65, 1.25), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Chi phí Mua\ $"PV" approx 414","1$ tr\ ])
    content((1.65, -0.4), text(size: 8pt)[Mua đứt])

    rect((3.3, 0), (5.0, 2.2), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((4.15, 1.1), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Chi phí Thuê\ $"PV" approx 391","7$ tr\ ])
    content((4.15, -0.4), text(size: 8pt, fill: rgb("16a34a"), weight: "bold")[Thuê (Tiết kiệm $22","4$ tr)])
  })
]
],
    (
        True([$"NAL" approx +22","38$ triệu đồng, doanh nghiệp nên chọn phương án Thuê tài chính.]),
        [$"NAL" approx -22","38$ triệu đồng, doanh nghiệp nên chọn phương án Mua đứt.],
        [$"NAL" = 0$, hai phương án có hiệu quả tài chính hoàn toàn ngang nhau.],
        [$"NAL" approx +45","10$ triệu đồng, doanh nghiệp nên chọn phương án Mua đứt.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Chi phí hiện tại ròng của phương án Mua:
        $ "PV"_"Mua" = "Vốn mua ban đầu" - "PV"("Lá chắn thuế khấu hao") $
        - Chi phí hiện tại ròng của phương án Thuê:
        $ "PV"_"Thuê" = "PV"("Dòng tiền thuê sau thuế") $
        - Lợi thế ròng của việc thuê:
        $ "NAL" = "PV"_"Mua" - "PV"_"Thuê" $
        Nếu $"NAL" > 0$ thì chi phí đi thuê rẻ hơn mua đứt, doanh nghiệp nên chọn Thuê.

        #step([Lời giải chi tiết])
        Với lãi suất chiết khấu $r^* = 8\% = 0","08$, hệ số chiết khấu niên kim 3 năm:
        $ (1 - (1","08)^(-3)) / (0","08) approx (1 - 0","793832) / (0","08) = (0","206168) / (0","08) approx 2","577097 $

        1. Tính chi phí phương án Mua:
        - $"PV"("Lá chắn thuế") = 33","333 dot 2","577097 approx 85","90$ (triệu đồng).
        - $"PV"_"Mua" = 500 - 85","90 = 414","10$ (triệu đồng).

        2. Tính chi phí phương án Thuê:
        - $"PV"_"Thuê" = 152 dot 2","577097 approx 391","72$ (triệu đồng).

        3. Tính $"NAL"$:
        $ "NAL" = 414","10 - 391","72 = +22","38 " (triệu đồng)" $

        Vì $"NAL" > 0$, phương án Thuê tài chính giúp doanh nghiệp tiết kiệm được khoảng $22","38$ triệu đồng chi phí hiện tại, do đó doanh nghiệp nên chọn Thuê.
    ]
)

// TN 5
#tn([Một doanh nghiệp sản xuất bánh ngọt có các số liệu tài chính sau:
- Giá bán sản phẩm: $P = 50$ nghìn đồng/hộp.
- Chi phí biến đổi (nguyên liệu, đóng gói, hoa hồng): $V = 30$ nghìn đồng/hộp.
- Tổng chi phí cố định hàng năm (tiền thuê xưởng, khấu hao, quản lý): $F = 400$ triệu đồng/năm.
Sản lượng hòa vốn kế toán (Accounting Break-even Point) của doanh nghiệp là bao nhiêu hộp bánh mỗi năm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Sản lượng $Q$])
    content((-0.4, 3.2), text(size: 8pt)[Doanh thu/Chi phí])

    // Đường chi phí cố định F
    line((0, 1.0), (5.0, 1.0), stroke: (dash: "densely-dashed", paint: rgb("94a3b8")))
    content((-0.5, 1.0), text(size: 7.5pt)[$F = 400$])

    // Đường Tổng chi phí TC = F + V*Q
    line((0, 1.0), (5.0, 2.8), stroke: 1.2pt + rgb("e11d48"))
    content((5.0, 3.0), text(size: 7.5pt, fill: rgb("e11d48"))[$T C$])

    // Đường Tổng doanh thu TR = P*Q
    line((0, 0), (5.0, 3.0), stroke: 1.5pt + rgb("047857"))
    content((5.0, 2.6), text(size: 7.5pt, fill: rgb("047857"))[$T R$])

    // Điểm cắt hòa vốn tại Q = 20000
    circle((2.5, 1.5), radius: 0.08, fill: rgb("ea580c"))
    line((2.5, 0), (2.5, 1.5), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    content((2.5, -0.35), text(size: 8pt, fill: rgb("ea580c"), weight: "bold")[$Q_"BEP" = 20000$])
  })
]
],
    (
        True([$20000$ hộp/năm.]),
        [$15000$ hộp/năm.],
        [$25000$ hộp/năm.],
        [$13333$ hộp/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Số dư đảm phí trên mỗi đơn vị sản phẩm (Contribution Margin per unit):
        $ C M = P - V $
        - Sản lượng hòa vốn kế toán là sản lượng mà tại đó Tổng doanh thu bằng Tổng chi phí (Lợi nhuận $"EBIT" = 0$):
        $ Q_"BEP" = F / (P - V) $

        #step([Lời giải chi tiết])
        Với $F = 400$ triệu đồng $= 400000$ nghìn đồng, $P = 50$ nghìn đồng, $V = 30$ nghìn đồng:
        $ P - V = 50 - 30 = 20 " (nghìn đồng/hộp)" $
        $ Q_"BEP" = (400000) / (20) = 20000 " (hộp)" $

        Vậy doanh nghiệp cần bán được ít nhất $20000$ hộp bánh mỗi năm để đạt điểm hòa vốn.
    ]
)

// TN 6
#tn([Tại mức sản lượng tiêu thụ hiện tại là $Q = 25000$ sản phẩm/năm, doanh nghiệp đạt doanh thu $1250$ triệu đồng, tổng chi phí biến đổi là $750$ triệu đồng (số dư đảm phí là $500$ triệu đồng), chi phí cố định là $400$ triệu đồng và lợi nhuận trước lãi vay và thuế là $"EBIT" = 100$ triệu đồng. Độ bẩy hoạt động (Degree of Operating Leverage - DOL) tại mức sản lượng này bằng bao nhiêu và có ý nghĩa kinh tế gì?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ khuếch đại DOL
    rect((0.5, 0), (2.2, 1.6), fill: rgb("dbeafe"), stroke: 1pt + rgb("2563eb"))
    content((1.35, 0.8), text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[Doanh thu\ Tăng $+10\%$\ ])

    line((2.2, 0.8), (3.6, 0.8), mark: (end: "stealth"), stroke: 1.5pt + rgb("64748b"))
    content((2.9, 1.1), text(size: 7.5pt)[$times "DOL" = 5$])

    rect((3.6, 0), (5.5, 1.6), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("16a34a"))
    content((4.55, 0.8), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[Lợi nhuận $"EBIT"$\ Tăng vọt $+50\%$\ ])
  })
]
],
    (
        True([$"DOL" = 5$, nghĩa là khi doanh thu tăng $10\%$ thì lợi nhuận hoạt động $"EBIT"$ sẽ tăng tới $50\%$.]),
        [$"DOL" = 2","5$, nghĩa là khi doanh thu tăng $10\%$ thì lợi nhuận hoạt động tăng $25\%$.],
        [$"DOL" = 0","2$, nghĩa là độ rủi ro hoạt động của doanh nghiệp rất thấp.],
        [$"DOL" = 4$, nghĩa là chi phí cố định gấp 4 lần lợi nhuận ròng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Độ bẩy hoạt động (DOL) đo lường mức độ nhạy cảm của lợi nhuận hoạt động $"EBIT"$ đối với sự thay đổi của sản lượng tiêu thụ hoặc doanh thu:
        $ "DOL" = ("Số dư đảm phí") / "EBIT" = (Q(P - V)) / (Q(P - V) - F) $

        #step([Lời giải chi tiết])
        Với số dư đảm phí là $500$ triệu đồng và $"EBIT" = 100$ triệu đồng:
        $ "DOL" = (500) / (100) = 5 $

        Ý nghĩa: Với $"DOL" = 5$, bất kỳ sự gia tăng nào về doanh thu (ví dụ tăng $10\%$) cũng sẽ được khuếch đại lên gấp $5$ lần, mang lại mức tăng trưởng lợi nhuận trước thuế và lãi là $10\% dot 5 = 50\%$. (Tuy nhiên nếu doanh thu giảm $10\%$ thì lợi nhuận cũng sụt giảm tương ứng $50\%$).
    ]
)

// TN 7
#tn([So sánh giữa Điểm hòa vốn kế toán (Accounting Break-even) và Điểm hòa vốn tài chính (Financial Break-even) của một dự án đầu tư vốn, nhận định nào sau đây là chính xác?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Sản lượng $Q$])

    circle((2.0, 0), radius: 0.08, fill: rgb("64748b"))
    content((2.0, 0.4), text(size: 7.5pt, fill: rgb("334155"), weight: "bold")[$Q_"Kế toán"$])
    content((2.0, -0.35), text(size: 7pt)[$"EBIT" = 0$])

    circle((4.2, 0), radius: 0.08, fill: rgb("ea580c"))
    content((4.2, 0.4), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold")[$Q_"Tài chính"$])
    content((4.2, -0.35), text(size: 7pt)[$"NPV" = 0$])

    line((2.0, 0.8), (4.2, 0.8), mark: (end: "stealth"), stroke: 1pt + rgb("0f766e"))
    content((3.1, 1.1), text(size: 7.5pt, fill: rgb("0f766e"))[$Q_"Tài chính" > Q_"Kế toán"$])
  })
]
],
    (
        True([Điểm hòa vốn tài chính luôn lớn hơn điểm hòa vốn kế toán vì nó đòi hỏi dự án không chỉ bù đắp chi phí mà còn phải hoàn trả vốn đầu tư ban đầu cùng chi phí cơ hội của vốn ($"NPV" = 0$).]),
        [Điểm hòa vốn kế toán luôn lớn hơn điểm hòa vốn tài chính vì nó tính cả chi phí lãi vay ngân hàng.],
        [Hai điểm hòa vốn này hoàn toàn trùng nhau nếu dự án không chịu thuế thu nhập doanh nghiệp.],
        [Điểm hòa vốn tài chính chỉ xảy ra khi doanh nghiệp thanh lý toàn bộ tài sản cố định.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Điểm hòa vốn kế toán chỉ yêu cầu lợi nhuận kế toán bằng 0 ($"Net Income" = 0$ hoặc $"EBIT" = 0$). Tại điểm này, doanh nghiệp chỉ thu hồi được chi phí danh nghĩa, tỷ suất sinh lời thực tế của nhà đầu tư bằng $0\%$ (thực chất là bị lỗ do chi phí cơ hội của vốn).
        - Điểm hòa vốn tài chính đòi hỏi giá trị hiện tại ròng của dự án phải bằng 0 ($"NPV" = 0$). Tại mức sản lượng này, dự án hoàn trả đầy đủ số vốn gốc ban đầu và đạt tỷ suất hoàn vốn đúng bằng chi phí sử dụng vốn WACC đòi hỏi.
        Do đó, sản lượng hòa vốn tài chính bắt buộc phải lớn hơn sản lượng hòa vốn kế toán.
    ]
)

// TN 8
#tn([Một tài sản cố định sau $5$ năm hoạt động đã hết thời gian trích khấu hao và có giá trị ghi sổ bằng $0$ ($"Book Value" = 0$). Doanh nghiệp tiến hành bán thanh lý tài sản này và thu được số tiền $50$ triệu đồng. Biết thuế suất thuế TNDN là $20\%$. Dòng tiền ròng thực nhận sau thuế (After-tax Salvage Value) từ việc thanh lý tài sản này là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cột phân bổ thanh lý 50 tr
    rect((1.0, 0), (4.5, 1.8), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((1.0, 0), (3.8, 1.8), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("16a34a"))
    rect((3.8, 0), (4.5, 1.8), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))

    content((2.4, 0.9), text(size: 8pt, fill: rgb("166534"), weight: "bold")[Thực thu sau thuế\ $40$ triệu đồng\ ])
    content((4.15, 0.9), text(size: 7pt, fill: rgb("991b1b"), weight: "bold")[Thuế $20\%$\ $10$ tr\ ])
    content((2.75, -0.4), text(size: 8.5pt, weight: "bold")[Giá bán thanh lý: $50$ triệu đồng])
  })
]
],
    (
        True([$40$ triệu đồng.]),
        [$50$ triệu đồng.],
        [$10$ triệu đồng.],
        [$35$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Công thức tính dòng tiền thu hồi sau thuế từ thanh lý tài sản:
        $ "CF"_"thanh lý" = "Giá bán" - ("Giá bán" - "Giá trị ghi sổ") dot T_c $
        Vì giá trị ghi sổ bằng $0$, toàn bộ số tiền thanh lý được coi là thu nhập khác chịu thuế TNDN:
        $ "Thuế phải nộp" = "Giá bán" dot T_c $
        $ "CF"_"thanh lý" = "Giá bán" dot (1 - T_c) $

        #step([Lời giải chi tiết])
        Với giá bán là $50$ triệu đồng và $T_c = 20\% = 0","20$:
        $ "CF"_"thanh lý" = 50 dot (1 - 0","20) = 50 dot 0","80 = 40 " (triệu đồng)" $
    ]
)

// TN 9
#tn([Khi so sánh giữa Phương pháp Khấu hao nhanh (Accelerated Depreciation) và Phương pháp Khấu hao đường thẳng (Straight-line Depreciation) cho cùng một tài sản cố định có cùng nguyên giá và thời gian sử dụng, nhận định nào sau đây là đúng về mặt giá trị thời gian của tiền?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // 2 đồ thị khấu hao
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 2.8), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])
    content((-0.4, 2.8), text(size: 8pt)[Lá chắn])

    // Khấu hao đường thẳng (ngang)
    line((0.5, 1.4), (5.0, 1.4), stroke: 1.2pt + rgb("64748b"))
    content((4.8, 1.65), text(size: 7.5pt, fill: rgb("64748b"))[Đường thẳng])

    // Khấu hao nhanh (dốc xuống)
    bezier((0.5, 2.5), (5.0, 0.5), (2.5, 1.0), stroke: 1.5pt + rgb("ea580c"))
    content((2.5, 2.2), text(size: 8pt, fill: rgb("ea580c"), weight: "bold")[Khấu hao nhanh: Nhận tiền sớm ==> $"PV"$ cao hơn])
  })
]
],
    (
        True([Tổng tiền thuế tiết kiệm được là như nhau nhưng Khấu hao nhanh có giá trị hiện tại $"PV"$ của lá chắn thuế lớn hơn do nhận được tiền tiết kiệm thuế sớm hơn ở những năm đầu.]),
        [Khấu hao nhanh giúp doanh nghiệp giảm được tổng số tiền thuế phải nộp nhiều hơn trong toàn bộ vòng đời tài sản.],
        [Khấu hao đường thẳng luôn tối ưu hơn vì phân bổ chi phí đều đặn giúp ổn định dòng tiền.],
        [Hai phương pháp mang lại giá trị hiện tại của lá chắn thuế hoàn toàn bằng nhau vì tổng mức khấu hao bằng đúng nguyên giá.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Tổng mức khấu hao trong toàn bộ thời gian sử dụng của cả hai phương pháp đều bằng đúng nguyên giá tài sản, do đó tổng số tiền thuế TNDN tiết kiệm được về mặt danh nghĩa là hoàn toàn bằng nhau.
        - Tuy nhiên, phương pháp Khấu hao nhanh dồn tỷ trọng khấu hao lớn vào những năm đầu tiên, giúp doanh nghiệp nộp thuế ít hơn ở giai đoạn đầu và hoãn phần nộp thuế sang các năm sau.
        - Theo nguyên lý giá trị thời gian của tiền (một đồng nhận được hôm nay có giá trị hơn một đồng trong tương lai), việc nhận tiền tiết kiệm thuế sớm hơn làm tăng giá trị hiện tại ròng ($"PV"$) của lá chắn thuế, mang lại lợi ích tài chính thực sự cho doanh nghiệp.
    ]
)

// TN 10
#tn([Một dự án đầu tư có vốn đầu tư ban đầu là $300$ triệu đồng. Dự án mang lại dòng tiền ròng đều đặn là $120$ triệu đồng vào cuối mỗi năm liên tục trong $4$ năm. Biết chi phí sử dụng vốn của dự án là $10\%$/năm. Dòng tiền chiết khấu từng năm lần lượt là: Năm 1: $109","09$ triệu; Năm 2: $99","17$ triệu; Năm 3: $90","16$ triệu; Năm 4: $81","96$ triệu. Thời gian hoàn vốn có chiết khấu (Discounted Payback Period - DPP) của dự án xấp xỉ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])
    content((-0.4, 3), text(size: 8pt)[Thu hồi vốn])

    // Đường tích lũy chiết khấu cắt mốc 300 tr
    line((0, 2.5), (5.0, 2.5), stroke: (dash: "densely-dashed", paint: rgb("94a3b8")))
    content((-0.6, 2.5), text(size: 7.5pt)[$300$ tr])

    bezier((0, 0), (4.5, 3.0), (2.5, 1.8), stroke: 1.5pt + rgb("047857"))
    circle((3.4, 2.5), radius: 0.08, fill: rgb("ea580c"))
    line((3.4, 0), (3.4, 2.5), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    content((3.4, -0.35), text(size: 8pt, fill: rgb("ea580c"), weight: "bold")[$"DPP" approx 3","02$ năm])
  })
]
],
    (
        True([Khoảng $3","02$ năm.]),
        [Khoảng $2","50$ năm.],
        [Khoảng $3","45$ năm.],
        [Khoảng $2","80$ năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Thời gian hoàn vốn có chiết khấu (DPP) là thời gian cần thiết để tổng giá trị hiện tại của các dòng tiền thu về bù đắp đúng số vốn đầu tư ban đầu:
        - Tính dòng tiền tích lũy chiết khấu qua từng năm cho đến khi tiệm cận số vốn ban đầu $I_0 = 300$ triệu đồng.
        - Ngoại suy tuyến tính trong năm cuối cùng để xác định phần lẻ của năm.

        #step([Lời giải chi tiết])
        Tổng dòng tiền chiết khấu thu được qua từng năm:
        - Hết Năm 1: $109","09$ triệu đồng. Còn thiếu: $300 - 109","09 = 190","91$ triệu.
        - Hết Năm 2: $109","09 + 99","17 = 208","26$ triệu đồng. Còn thiếu: $300 - 208","26 = 91","74$ triệu.
        - Hết Năm 3: $208","26 + 90","16 = 298","42$ triệu đồng. Còn thiếu: $300 - 298","42 = 1","58$ triệu.
        - Năm 4 tạo ra dòng tiền chiết khấu là $81","96$ triệu đồng.

        Thời gian hoàn vốn có chiết khấu:
        $ "DPP" = 3 + (1","58) / (81","96) approx 3 + 0","0193 approx 3","02 " (năm)" $

        Làm tròn kết quả là khoảng $3","02$ năm.
        (Lưu ý: Thời gian hoàn vốn giản đơn không chiết khấu là $300 / 120 = 2","5$ năm, ngắn hơn nhiều so với DPP).
    ]
)

// TN 11
#tn([Theo chuẩn mực kế toán và các quy tắc tài chính doanh nghiệp, một hợp đồng thuê tài sản được xếp vào loại "Thuê tài chính" (Finance Lease / Capital Lease) thay vì "Thuê hoạt động" (Operating Lease) khi thỏa mãn điều kiện nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ tiêu chí thuê tài chính
    rect((0.8, 0), (4.8, 1.8), fill: rgb("ffedd5"), stroke: 1.2pt + rgb("ea580c"))
    content((2.8, 0.9), text(size: 8pt, fill: rgb("9a3412"), weight: "bold")[Thuê tài chính (Finance Lease):\ Chuyển giao phần lớn rủi ro và lợi ích\ gắn liền với quyền sở hữu tài sản\ ])
  })
]
],
    (
        True([Bên đi thuê gánh chịu phần lớn rủi ro và được hưởng phần lớn lợi ích kinh tế gắn liền với quyền sở hữu tài sản (như thời hạn thuê chiếm phần lớn tuổi thọ kinh tế hoặc có quyền mua lại tài sản với giá danh nghĩa).]),
        [Hợp đồng thuê có thể hủy ngang bất kỳ lúc nào mà bên đi thuê không phải bồi thường.],
        [Bên cho thuê chịu toàn bộ chi phí bảo trì, bảo dưỡng và bảo hiểm tài sản.],
        [Thời hạn thuê rất ngắn, chỉ chiếm dưới $20\%$ vòng đời hữu ích của thiết bị.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Thuê tài chính thực chất là một hình thức mua tài sản trả chậm được tài trợ bằng nợ của công ty cho thuê tài chính:
        - Chuyển giao phần lớn rủi ro và lợi ích kinh tế cho bên đi thuê.
        - Thời hạn thuê chiếm phần lớn thời gian sử dụng hữu ích của tài sản ($>= 75\%$).
        - Giá trị hiện tại của các khoản tiền thuê tối thiểu chiếm gần hết giá trị thị trường của tài sản ($>= 90\%$).
        - Bên đi thuê có quyền chọn mua lại tài sản với giá tượng trưng khi hết hạn hợp đồng.
    ]
)

// TN 12
#tn([Khi một doanh nghiệp tiến hành tự động hóa dây chuyền sản xuất bằng robot, chi phí biến đổi trên mỗi sản phẩm $V$ giảm xuống nhưng chi phí cố định $F$ (tiền khấu hao máy móc) tăng vọt. Sự thay đổi cơ cấu chi phí này sẽ tác động như thế nào đến Điểm hòa vốn sản lượng $Q_"BEP"$ và Độ bẩy hoạt động $"DOL"$ của doanh nghiệp?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ chuyển dịch tự động hóa
    rect((0.5, 0), (2.5, 1.8), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((1.5, 0.9), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Tự động hóa\ Chi phí cố định $F$ tăng vọt\ Biến phí $V$ giảm mạnh\ ])

    line((2.5, 0.9), (3.3, 0.9), mark: (end: "stealth"), stroke: 1.5pt + rgb("64748b"))

    rect((3.3, 0), (5.5, 1.8), fill: rgb("ffedd5"), stroke: 1.2pt + rgb("ea580c"))
    content((4.4, 0.9), text(size: 7.5pt, fill: rgb("9a3412"), weight: "bold")[Hòa vốn $Q_"BEP"$ tăng\ Độ bẩy $"DOL"$ tăng cao\ (Rủi ro & Đột phá)\ ])
  })
]
],
    (
        True([Điểm hòa vốn sản lượng $Q_"BEP"$ tăng lên và Độ bẩy hoạt động $"DOL"$ tăng cao, khiến lợi nhuận biến động rất mạnh theo doanh thu.]),
        [Điểm hòa vốn giảm xuống và Độ bẩy hoạt động giảm theo, giúp hoạt động an toàn hơn.],
        [Điểm hòa vốn không đổi vì mức tăng chi phí cố định triệt tiêu mức giảm chi phí biến đổi.],
        [Độ bẩy hoạt động chuyển sang giá trị âm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Khi chi phí cố định $F$ tăng mạnh, doanh nghiệp phải bán được nhiều sản phẩm hơn để trang trải chi phí cố định, do đó điểm hòa vốn $Q_"BEP" = F / (P - V)$ tăng lên.
        - Tỷ trọng chi phí cố định cao làm tăng độ bẩy hoạt động $"DOL"$: Khi doanh thu vượt điểm hòa vốn, lợi nhuận sẽ bùng nổ cực nhanh; nhưng nếu doanh thu giảm sụt, doanh nghiệp sẽ rơi vào tình trạng thua lỗ nặng nề rất nhanh.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 13 đến câu 16. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một doanh nghiệp sản xuất linh kiện điện tử cần đầu tư một dây chuyền tự động hóa trị giá $1$ tỷ đồng ($1000$ triệu đồng), thời gian sử dụng $4$ năm, giá trị thanh lý ước tính sau 4 năm bằng $0$. Doanh nghiệp đang cân nhắc giữa hai phương án tài trợ:
- Phương án Mua đứt: Mua ngay với số tiền $1000$ triệu đồng, trích khấu hao đường thẳng $250$ triệu đồng/năm trong $4$ năm.
- Phương án Thuê tài chính: Thuê trong $4$ năm, tiền thuê mỗi năm là $320$ triệu đồng thanh toán vào cuối mỗi năm.
Biết thuế suất thuế TNDN là $20\%$ và lãi suất vay ngân hàng trước thuế của doanh nghiệp là $10\%$/năm (lãi suất chiết khấu sau thuế áp dụng cho bài toán là $8\%$/năm).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cột so sánh chi phí PV
    rect((0.8, 0), (2.5, 2.5), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0f766e"))
    content((1.65, 1.25), text(size: 7.5pt, fill: rgb("115e59"), weight: "bold")[Phương án Mua\ $"PV" approx 834","4$ tr\ (Nên chọn)\ ])
    content((1.65, -0.4), text(size: 8pt, weight: "bold")[Mua đứt])

    rect((3.3, 0), (5.0, 2.6), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((4.15, 1.3), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Phương án Thuê\ $"PV" approx 847","9$ tr\ (Đắt hơn)\ ])
    content((4.15, -0.4), text(size: 8pt)[Thuê tài chính])
  })
]
],
    (
        True([Giá trị hiện tại của chuỗi lá chắn thuế từ khấu hao khi chọn phương án Mua đứt là khoảng $165","6$ triệu đồng.]),
        True([Chi phí hiện tại ròng của phương án Mua đứt là khoảng $834","4$ triệu đồng.]),
        True([Chi phí hiện tại ròng của phương án Thuê tài chính là khoảng $847","9$ triệu đồng.]),
        True([Lợi thế ròng của việc thuê $"NAL" = -13","5$ triệu đồng, do đó doanh nghiệp nên chọn phương án Mua đứt thay vì Thuê tài chính.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Mức khấu hao mỗi năm: $250$ triệu đồng.
        Lá chắn thuế mỗi năm:
        $ "Tax Shield" = 250 dot 20\% = 50 " (triệu đồng/năm)" $
        Giá trị hiện tại của lá chắn thuế với $r^* = 8\% = 0","08$, $n = 4$:
        $ "PV"_"Lá chắn thuế" = 50 dot (1 - (1","08)^(-4)) / (0","08) $
        $ (1","08)^(-4) approx 0","735030 ==> 1 - 0","735030 = 0","264970 $
        $ "PV"_"Lá chắn thuế" = 50 dot (0","264970) / (0","08) = 50 dot 3","312127 approx 165","61 " (triệu đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Chi phí hiện tại ròng của phương án Mua:
        $ "PV"_"Mua" = 1000 - 165","61 = 834","39 " (triệu đồng)" approx 834","4 " triệu đồng" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Tiền thuê sau thuế hàng năm:
        $ 320 dot (1 - 0","20) = 256 " (triệu đồng/năm)" $
        Chi phí hiện tại ròng của phương án Thuê:
        $ "PV"_"Thuê" = 256 dot (1 - (1","08)^(-4)) / (0","08) = 256 dot 3","312127 approx 847","90 " (triệu đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Lợi thế ròng của việc thuê:
        $ "NAL" = "PV"_"Mua" - "PV"_"Thuê" = 834","39 - 847","90 = -13","51 " (triệu đồng)" $
        Vì $"NAL" < 0$, chi phí mua đứt thấp hơn chi phí đi thuê khoảng $13","5$ triệu đồng, doanh nghiệp nên ưu tiên Mua đứt.
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 2
#ds([Một doanh nghiệp xem xét dự án mở rộng xưởng sản xuất:
- Giá bán sản phẩm: $P = 100$ nghìn đồng/sản phẩm.
- Chi phí biến đổi: $V = 60$ nghìn đồng/sản phẩm.
- Chi phí cố định bằng tiền mặt (chưa gồm khấu hao): $F_"tiền mặt" = 600$ triệu đồng/năm.
- Chi phí khấu hao tài sản cố định: $D = 200$ triệu đồng/năm.
Tổng chi phí cố định kế toán là $F = F_"tiền mặt" + D = 800$ triệu đồng/năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Sản lượng $Q$])

    circle((2.0, 0), radius: 0.08, fill: rgb("2563eb"))
    content((2.0, 0.4), text(size: 7.5pt, fill: rgb("1d4ed8"), weight: "bold")[$Q_"Tiền mặt"$])
    content((2.0, -0.35), text(size: 7.5pt)[$15000$])

    circle((3.8, 0), radius: 0.08, fill: rgb("ea580c"))
    content((3.8, 0.4), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold")[$Q_"Kế toán"$])
    content((3.8, -0.35), text(size: 7.5pt)[$20000$])
  })
]
],
    (
        True([Điểm hòa vốn tiền mặt (Cash Break-even) của doanh nghiệp là $15000$ sản phẩm/năm.]),
        True([Điểm hòa vốn kế toán (Accounting Break-even) của doanh nghiệp là $20000$ sản phẩm/năm.]),
        True([Tại mức sản lượng $Q = 25000$ sản phẩm/năm, độ bẩy hoạt động của doanh nghiệp là $"DOL" = 5$.]),
        False([Doanh nghiệp có tỷ lệ chi phí cố định trong cơ cấu chi phí càng cao thì độ bẩy hoạt động $"DOL"$ càng thấp.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Số dư đảm phí mỗi đơn vị: $P - V = 100 - 60 = 40$ nghìn đồng.
        Điểm hòa vốn tiền mặt (chỉ bù đắp chi phí tiền mặt):
        $ Q_"tiền mặt" = (600000) / (40) = 15000 " (sản phẩm)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Điểm hòa vốn kế toán (bù đắp cả chi phí tiền mặt và khấu hao):
        $ Q_"kế toán" = (800000) / (40) = 20000 " (sản phẩm)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Tại $Q = 25000$ sản phẩm:
        - Số dư đảm phí: $25000 dot 40 = 1000$ triệu đồng.
        - $"EBIT" = 1000 - 800 = 200$ triệu đồng.
        - Độ bẩy hoạt động:
        $ "DOL" = (1000) / (200) = 5 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Chi phí cố định càng lớn thì khoảng cách từ sản lượng hiện tại đến điểm hòa vốn càng hẹp, mẫu số $"EBIT"$ càng nhỏ, làm cho độ bẩy hoạt động $"DOL"$ càng cao (chứ không phải càng thấp).
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#ds([Một công ty đầu tư thiết bị công nghệ nguyên giá $1","2$ tỷ đồng ($1200$ triệu đồng) thời hạn sử dụng $3$ năm, giá trị thanh lý bằng $0$, thuế suất thuế TNDN là $20\%$, chi phí vốn là $10\%$/năm. Công ty so sánh hai phương pháp khấu hao:
- Phương pháp 1 (Khấu hao đường thẳng): Mỗi năm trích khấu hao đều $400$ triệu đồng.
- Phương pháp 2 (Khấu hao nhanh theo tỷ lệ $50\% - 30\% - 20\%$): Năm 1 trích $600$ triệu; Năm 2 trích $360$ triệu; Năm 3 trích $240$ triệu đồng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // So sánh PV lá chắn thuế
    rect((0.8, 0), (2.5, 2.2), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((1.65, 1.1), text(size: 7.5pt, fill: rgb("334155"), weight: "bold")[Đường thẳng\ $"PV" approx 198","95$ tr\ ])
    content((1.65, -0.4), text(size: 8pt)[Phương pháp 1])

    rect((3.3, 0), (5.0, 2.5), fill: rgb("ffedd5"), stroke: 1.2pt + rgb("ea580c"))
    content((4.15, 1.25), text(size: 7.5pt, fill: rgb("9a3412"), weight: "bold")[Khấu hao nhanh\ $"PV" approx 204","66$ tr\ (Tăng $5","71$ tr)\ ])
    content((4.15, -0.4), text(size: 8pt, fill: rgb("ea580c"), weight: "bold")[Phương pháp 2])
  })
]
],
    (
        True([Tổng số tiền thuế TNDN tiết kiệm được trong cả $3$ năm ở hai phương pháp là hoàn toàn bằng nhau ($240$ triệu đồng).]),
        True([Giá trị hiện tại của chuỗi lá chắn thuế theo Phương pháp Khấu hao đường thẳng xấp xỉ $198","95$ triệu đồng.]),
        True([Giá trị hiện tại của chuỗi lá chắn thuế theo Phương pháp Khấu hao nhanh xấp xỉ $204","66$ triệu đồng.]),
        True([Phương pháp Khấu hao nhanh giúp doanh nghiệp gia tăng thêm giá trị tài chính khoảng $5","71$ triệu đồng nhờ nhận được tiền tiết kiệm thuế sớm hơn.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Tổng mức khấu hao cả 3 năm ở cả 2 phương pháp đều bằng $1200$ triệu.
        Tổng tiền thuế tiết kiệm được:
        $ 1200 dot 20\% = 240 " (triệu đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Với Khấu hao đường thẳng, mỗi năm lá chắn thuế là $400 dot 20\% = 80$ triệu đồng.
        $ "PV"_"Đường thẳng" = 80 dot (1 - (1","10)^(-3)) / (0","10) = 80 dot 2","486852 approx 198","95 " (triệu đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Với Khấu hao nhanh, lá chắn thuế từng năm là:
        - Năm 1: $600 dot 20\% = 120$ triệu đồng.
        - Năm 2: $360 dot 20\% = 72$ triệu đồng.
        - Năm 3: $240 dot 20\% = 48$ triệu đồng.
        Giá trị hiện tại chiết khấu với $r = 10\%$:
        $ "PV"_"Nhanh" = (120) / (1","1) + (72) / (1","1^2) + (48) / (1","1^3) $
        $ (120) / (1","1) approx 109","091 $
        $ (72) / (1","21) approx 59","504 $
        $ (48) / (1","331) approx 36","063 $
        $ "PV"_"Nhanh" = 109","091 + 59","504 + 36","063 approx 204","658 " (triệu đồng)" approx 204","66 " triệu đồng" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Lợi ích ròng gia tăng từ việc khấu hao nhanh:
        $ 204","66 - 198","95 = 5","71 " (triệu đồng)" $
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 4
#ds([Một dự án đầu tư nhà máy chế biến nông sản có vốn đầu tư ban đầu là $800$ triệu đồng. Dòng tiền ròng tự do dự kiến thu về trong $4$ năm hoạt động lần lượt là: Năm 1: $300$ triệu; Năm 2: $350$ triệu; Năm 3: $300$ triệu; Năm 4: $200$ triệu đồng. Chi phí sử dụng vốn của dự án là $12\%$/năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Năm])

    // Cột đầu tư ban đầu
    line((0.8, 0), (0.8, -1.3), mark: (end: "stealth"), stroke: 1.5pt + rgb("e11d48"))
    content((0.8, 0.35), text(size: 8pt)[$0$])
    content((0.8, -1.55), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$-800$ tr])

    // Dòng tiền thu về
    line((1.8, 0), (1.8, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((1.8, -0.35), text(size: 8pt)[$1$])
    content((1.8, 1.3), text(size: 7.5pt)[$300$])

    line((2.8, 0), (2.8, 1.3), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((2.8, -0.35), text(size: 8pt)[$2$])
    content((2.8, 1.5), text(size: 7.5pt)[$350$])

    line((3.8, 0), (3.8, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((3.8, -0.35), text(size: 8pt)[$3$])
    content((3.8, 1.3), text(size: 7.5pt)[$300$])

    line((4.8, 0), (4.8, 0.8), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((4.8, -0.35), text(size: 8pt)[$4$])
    content((4.8, 1.0), text(size: 7.5pt)[$200$])
  })
]
],
    (
        True([Thời gian hoàn vốn giản đơn (không tính chi phí sử dụng vốn) của dự án là đúng $2","5$ năm.]),
        True([Thời gian hoàn vốn có chiết khấu (DPP) của dự án dài hơn thời gian hoàn vốn giản đơn.]),
        True([Giá trị hiện tại ròng $"NPV"$ của dự án đạt giá trị dương (khoảng $87","5$ triệu đồng), chứng tỏ dự án khả thi về mặt tài chính.]),
        False([Nếu tiêu chuẩn hoàn vốn tối đa mà hội đồng quản trị đặt ra cho dự án là $2$ năm thì dự án này sẽ được thông qua.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Dòng tiền thu về chưa chiết khấu:
        - Sau 2 năm thu được: $300 + 350 = 650$ triệu đồng.
        - Số tiền còn thiếu để đủ $800$ triệu là: $800 - 650 = 150$ triệu đồng.
        - Ở năm 3, thu được $300$ triệu đồng, thời gian cần thêm: $150 / 300 = 0","5$ năm.
        Vậy thời gian hoàn vốn giản đơn là $2 + 0","5 = 2","5$ năm.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Vì các dòng tiền tương lai khi bị chiết khấu về hiện tại sẽ có giá trị nhỏ hơn giá trị danh nghĩa, nên dòng tiền tích lũy chiết khấu luôn tăng chậm hơn, dẫn tới thời gian hoàn vốn có chiết khấu (DPP) luôn dài hơn thời gian hoàn vốn giản đơn.
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Dòng tiền chiết khấu với $r = 12\% = 0","12$:
        - Năm 1: $300 / 1","12 approx 267","86$ triệu.
        - Năm 2: $350 / (1","12^2) approx 279","02$ triệu.
        - Năm 3: $300 / (1","12^3) approx 213","53$ triệu.
        - Năm 4: $200 / (1","12^4) approx 127","10$ triệu.
        Tổng giá trị hiện tại dòng thu:
        $ "PV" = 267","86 + 279","02 + 213","53 + 127","10 = 887","51 " (triệu đồng)" $
        Giá trị hiện tại ròng:
        $ "NPV" = 887","51 - 800 = +87","51 " (triệu đồng)" > 0 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Thời gian hoàn vốn giản đơn đã là $2","5$ năm ($> 2$ năm), thời gian hoàn vốn chiết khấu còn dài hơn nữa ($approx 3","18$ năm). Nếu tiêu chuẩn đặt ra là $2$ năm thì dự án sẽ bị bác bỏ.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1
#tln([Một xưởng may áo sơ mi có chi phí cố định hàng năm là $300$ triệu đồng. Giá bán mỗi chiếc áo là $40$ nghìn đồng và chi phí biến đổi để may mỗi chiếc áo là $25$ nghìn đồng. Sản lượng hòa vốn của xưởng may là bao nhiêu nghìn sản phẩm mỗi năm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("ffedd5"), stroke: 1.2pt + rgb("ea580c"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("9a3412"), weight: "bold")[Sản lượng hòa vốn: $Q_"BEP" = F / (P - V)$\ $= (300) / (40 - 25) = (300) / (15) = 20$ nghìn sản phẩm\ ])
  })
]
],
    [20],
    loigiai: [
        #step([Lời giải chi tiết])
        Số dư đảm phí trên mỗi chiếc áo:
        $ P - V = 40 - 25 = 15 " (nghìn đồng/áo)" $

        Sản lượng hòa vốn:
        $ Q_"BEP" = (300000) / (15) = 20000 " (sản phẩm)" = 20 " (nghìn sản phẩm)" $

        Điền đáp số: *20*.
    ]
)

// TLN 2
#tln([Một doanh nghiệp mua một máy in công nghiệp trị giá $600$ triệu đồng và thực hiện trích khấu hao đường thẳng trong thời gian $5$ năm, giá trị thanh lý ước tính bằng $0$. Biết thuế suất thuế TNDN là $20\%$. Khoản tiền tiết kiệm thuế (Lá chắn thuế từ khấu hao) mà máy in này mang lại cho doanh nghiệp trong mỗi năm là bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0f766e"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("115e59"), weight: "bold")[Lá chắn thuế: $D dot T_c = (600 / 5) dot 20\%$\ $= 120 dot 20\% = 24$ triệu đồng/năm\ ])
  })
]
],
    [24],
    loigiai: [
        #step([Lời giải chi tiết])
        Mức khấu hao hàng năm:
        $ D = 600 / 5 = 120 " (triệu đồng/năm)" $

        Số tiền thuế tiết kiệm được từ khấu hao mỗi năm:
        $ "Lá chắn thuế" = 120 dot 20\% = 24 " (triệu đồng/năm)" $

        Điền đáp số: *24*.
    ]
)

// TLN 3
#tln([Một công ty thuê văn phòng làm việc với chi phí tiền thuê là $200$ triệu đồng mỗi năm. Tiền thuê văn phòng được trừ toàn bộ vào thu nhập chịu thuế khi tính thuế TNDN với thuế suất $20\%$. Dòng tiền chi trả thực tế sau thuế của công ty cho khoản tiền thuê này mỗi năm là bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("dbeafe"), stroke: 1.2pt + rgb("2563eb"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("1e40af"), weight: "bold")[Thực chi sau thuế: $L dot (1 - T_c)$\ $= 200 dot (1 - 0","20) = 160$ triệu đồng\ ])
  })
]
],
    [160],
    loigiai: [
        #step([Lời giải chi tiết])
        Dòng tiền thực chi sau thuế:
        $ "CF"_"sau thuế" = 200 dot (1 - 0","20) = 200 dot 0","80 = 160 " (triệu đồng)" $

        Điền đáp số: *160*.
    ]
)

// TLN 4
#tln([Một doanh nghiệp vay nợ ngân hàng với mức lãi suất vay trước thuế là $12\%$/năm. Biết chi phí lãi vay được tính vào chi phí hợp lý khi tính thuế TNDN và thuế suất thuế TNDN là $20\%$. Chi phí sử dụng nợ sau thuế của doanh nghiệp là bao nhiêu phần trăm mỗi năm? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("ffedd5"), stroke: 1.2pt + rgb("ea580c"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("9a3412"), weight: "bold")[Chi phí nợ sau thuế: $r_d^* = 12\% dot (1 - 0","20)$\ $= 12\% dot 0","80 = 9","6\%$/năm\ ])
  })
]
],
    [9.6],
    loigiai: [
        #step([Lời giải chi tiết])
        Chi phí sử dụng nợ sau thuế:
        $ r_d^* = r_d dot (1 - T_c) = 12\% dot (1 - 0","20) = 9","6\% $

        Điền đáp số: *9.6*.
    ]
)

// TLN 5
#tln([Tại mức sản lượng tiêu thụ hiện tại, một công ty có tổng số dư đảm phí là $400$ triệu đồng, tổng chi phí cố định là $300$ triệu đồng (lợi nhuận trước lãi và thuế $"EBIT" = 400 - 300 = 100$ triệu đồng). Hệ số độ bẩy hoạt động (DOL) của công ty tại mức sản lượng này bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("16a34a"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("166534"), weight: "bold")[Độ bẩy hoạt động: $"DOL" = ("Số dư đảm phí") / "EBIT"$\ $= (400) / (100) = 4$\ ])
  })
]
],
    [4],
    loigiai: [
        #step([Lời giải chi tiết])
        Độ bẩy hoạt động:
        $ "DOL" = ("Số dư đảm phí") / "EBIT" = (400) / (100) = 4 $

        Điền đáp số: *4*.
    ]
)

// TLN 6
#tln([Một thiết bị cơ khí đã trích khấu hao hết về giá trị sổ sách bằng $0$. Doanh nghiệp bán thanh lý thiết bị này được số tiền $80$ triệu đồng. Biết thuế suất thuế TNDN là $20\%$. Số tiền ròng sau thuế thực tế mà doanh nghiệp thu về từ việc bán thanh lý thiết bị là bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("dc2626"))
    content((2.8, 0.75), text(size: 8pt, fill: rgb("991b1b"), weight: "bold")[Thu hồi thanh lý sau thuế: $80 dot (1 - 0","20)$\ $= 80 dot 0","80 = 64$ triệu đồng\ ])
  })
]
],
    [64],
    loigiai: [
        #step([Lời giải chi tiết])
        Vì giá trị ghi sổ bằng 0, thuế TNDN phải nộp khi thanh lý là:
        $ "Thuế" = 80 dot 20\% = 16 " (triệu đồng)" $

        Số tiền ròng thực nhận sau thuế:
        $ 80 - 16 = 64 " (triệu đồng)" $

        Điền đáp số: *64*.
    ]
)

]

#make-questions()
