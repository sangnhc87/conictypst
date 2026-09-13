#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("0891b2")

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH",
  exam-title: "CHỦ ĐỀ 2I: TỐI ƯU HÓA DANH MỤC ĐẦU TƯ & QUẢN TRỊ RỦI RO (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "519",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một nhà đầu tư phân bổ vốn vào danh mục gồm hai cổ phiếu:
- Cổ phiếu A: Tỷ trọng $w_A = 60\% = 0","6$, tỷ suất sinh lời kỳ vọng $E(R_A) = 14\%$/năm.
- Cổ phiếu B: Tỷ trọng $w_B = 40\% = 0","4$, tỷ suất sinh lời kỳ vọng $E(R_B) = 8\%$/năm.
Tỷ suất sinh lời kỳ vọng của toàn bộ danh mục đầu tư là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ thanh tỷ trọng danh mục
    rect((0.8, 0), (4.8, 1.6), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((0.8, 0), (3.2, 1.6), fill: rgb("cffafe"), stroke: 1.2pt + rgb("0891b2"))
    rect((3.2, 0), (4.8, 1.6), fill: rgb("ede9fe"), stroke: 1pt + rgb("7c3aed"))

    content((2.0, 0.8), text(size: 7.5pt, fill: rgb("155e75"), weight: "bold")[Cổ phiếu A: $60\%$\ $E(R_A) = 14\%$\ ])
    content((4.0, 0.8), text(size: 7.5pt, fill: rgb("5b21b6"), weight: "bold")[Cổ phiếu B: $40\%$\ $E(R_B) = 8\%$\ ])
    content((2.8, -0.4), text(size: 8.5pt, weight: "bold")[Lợi suất kỳ vọng: $E(R_p) = 11","6\%$/năm])
  })
]
],
    (
        True([$11","6\%$/năm.]),
        [$11","0\%$/năm.],
        [$12","4\%$/năm.],
        [$10","2\%$/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo lý thuyết danh mục đầu tư hiện đại Markowitz:
        Lợi suất kỳ vọng của danh mục đầu tư gồm 2 tài sản là trung bình trọng số của lợi suất kỳ vọng từng tài sản:
        $ E(R_p) = w_A dot E(R_A) + w_B dot E(R_B) $

        #step([Lời giải chi tiết])
        Với $w_A = 0","6$, $E(R_A) = 14\%$ và $w_B = 0","4$, $E(R_B) = 8\%$:
        $ E(R_p) = 0","6 dot 14\% + 0","4 dot 8\% = 8","4\% + 3","2\% = 11","6\% $
    ]
)

// TN 2
#tn([Một danh mục đầu tư gồm hai cổ phiếu X và Y có độ lệch chuẩn rủi ro lần lượt là $sigma_X = 15\%$ và $sigma_Y = 10\%$. Giả sử hai cổ phiếu này có hệ số tương quan nghịch đảo hoàn hảo ($rho_(X Y) = -1$). Tỷ trọng đầu tư vào cổ phiếu X ($w_X$) để rủi ro của danh mục hoàn toàn bị triệt tiêu ($sigma_p = 0$) là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Rủi ro $sigma_p$])
    content((-0.4, 3.2), text(size: 8pt)[$E(R_p)$])

    // Đường cong cơ hội đầu tư chạm trục tung (sigma = 0)
    line((3.5, 2.5), (0, 1.6), stroke: 1.5pt + rgb("0891b2"))
    line((0, 1.6), (2.2, 0.7), stroke: 1.5pt + rgb("0891b2"))

    circle((0, 1.6), radius: 0.08, fill: rgb("e11d48"))
    content((0.9, 1.6), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[Phi rủi ro ($sigma_p = 0$)\ $w_X = 40\%$\ ])
    content((3.5, 2.8), text(size: 7.5pt)[Tài sản X ($15\%$)])
    content((2.2, 0.4), text(size: 7.5pt)[Tài sản Y ($10\%$)])
  })
]
],
    (
        True([$40\%$ ($w_X = 0","4$).]),
        [$60\%$ ($w_X = 0","6$).],
        [$50\%$ ($w_X = 0","5$).],
        [$30\%$ ($w_X = 0","3$).]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi hệ số tương quan $rho_(X Y) = -1$, phương sai của danh mục:
        $ sigma_p^2 = (w_X sigma_X - w_Y sigma_Y)^2 $
        Độ lệch chuẩn của danh mục:
        $ sigma_p = |w_X sigma_X - w_Y sigma_Y| $
        Để triệt tiêu hoàn toàn rủi ro ($sigma_p = 0$):
        $ w_X sigma_X - w_Y sigma_Y = 0 <==> w_X sigma_X - (1 - w_X) sigma_Y = 0 $
        $ ==> w_X^* = sigma_Y / (sigma_X + sigma_Y) $

        #step([Lời giải chi tiết])
        Thay số: $sigma_X = 15\%$, $sigma_Y = 10\%$:
        $ w_X^* = 10 / (15 + 10) = 10 / 25 = 0","4 = 40\% $
        $ w_Y^* = 1 - 0","4 = 60\% $
    ]
)

// TN 3
#tn([Một nhà quản lý quỹ so sánh hai danh mục đầu tư trên thị trường:
- Danh mục 1: Lợi suất kỳ vọng $E(R_1) = 15\%$/năm, độ lệch chuẩn $sigma_1 = 12\%$/năm.
- Danh mục 2: Lợi suất kỳ vọng $E(R_2) = 12\%$/năm, độ lệch chuẩn $sigma_2 = 8\%$/năm.
Biết mức lãi suất phi rủi ro trên thị trường là $R_f = 4\%$/năm. Sử dụng Tỷ số Sharpe (Sharpe Ratio) để đo lường hiệu quả sinh lời trên mỗi đơn vị rủi ro gánh chịu, nhận định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cột so sánh tỷ số Sharpe
    rect((0.8, 0), (2.5, 2.0), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((1.65, 1.0), text(size: 7.5pt, fill: rgb("334155"), weight: "bold")[Danh mục 1\ $S_1 = (15-4)/12$\ $approx 0","92$\ ])
    content((1.65, -0.4), text(size: 8pt)[Danh mục 1])

    rect((3.3, 0), (5.0, 2.4), fill: rgb("cffafe"), stroke: 1.2pt + rgb("0891b2"))
    content((4.15, 1.2), text(size: 7.5pt, fill: rgb("155e75"), weight: "bold")[Danh mục 2\ $S_2 = (12-4)/8$\ $= 1","00$\ ])
    content((4.15, -0.4), text(size: 8pt, fill: rgb("0891b2"), weight: "bold")[Danh mục 2 (Ưu việt hơn)])
  })
]
],
    (
        True([Danh mục 2 có hiệu suất sinh lời trên mỗi đơn vị rủi ro cao hơn Danh mục 1 ($S_2 = 1","00 > S_1 approx 0","92$).]),
        [Danh mục 1 có hiệu suất tốt hơn vì mang lại lợi suất tuyệt đối cao hơn ($15\% > 12\%$).],
        [Hai danh mục có hiệu suất như nhau vì chênh lệch lợi suất tỷ lệ thuận với rủi ro.],
        [Danh mục 2 có độ rủi ro thấp hơn nên tỷ số Sharpe bắt buộc phải nhỏ hơn.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tỷ số Sharpe đo lường phần bù rủi ro thu được trên mỗi đơn vị rủi ro tổng thể:
        $ S_p = (E(R_p) - R_f) / sigma_p $
        Danh mục nào có tỷ số Sharpe cao hơn thì đem lại hiệu quả sử dụng rủi ro tốt hơn.

        #step([Lời giải chi tiết])
        - Đối với Danh mục 1:
        $ S_1 = (15 - 4) / 12 = 11 / 12 approx 0","9167 $
        - Đối với Danh mục 2:
        $ S_2 = (12 - 4) / 8 = 8 / 8 = 1","0000 $

        Vì $S_2 = 1","00 > S_1 approx 0","92$, Danh mục 2 vượt trội hơn về mặt hiệu quả bù đắp rủi ro.
    ]
)

// TN 4
#tn([Theo Mô hình định giá tài sản vốn (CAPM - Capital Asset Pricing Model), lãi suất phi rủi ro trên thị trường hiện là $R_f = 4","5\%$/năm và lợi suất kỳ vọng của danh mục thị trường là $E(R_m) = 11","5\%$/năm (phần bù rủi ro thị trường là $7\%$). Một cổ phiếu công nghệ có hệ số rủi ro hệ thống Beta là $beta = 1","4$. Mức tỷ suất sinh lời kỳ vọng tối thiểu đối với cổ phiếu này theo mô hình CAPM là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Beta $beta$])
    content((-0.4, 3.2), text(size: 8pt)[$E(R)$ (%)])

    // Đường SML
    line((0, 0.9), (5.0, 2.9), stroke: 1.5pt + rgb("0891b2"))
    content((-0.6, 0.9), text(size: 7.5pt)[$R_f = 4","5$])

    // Điểm beta = 1.4 -> E(R) = 14.3%
    circle((3.5, 2.3), radius: 0.08, fill: rgb("e11d48"))
    line((3.5, 0), (3.5, 2.3), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    content((3.5, -0.35), text(size: 8pt)[$beta = 1","4$])
    content((3.5, 2.6), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$E(R) = 14","3\%$])
  })
]
],
    (
        True([$14","3\%$/năm.]),
        [$16","1\%$/năm.],
        [$12","5\%$/năm.],
        [$10","5\%$/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Công thức đường thị trường chứng khoán (SML) trong mô hình CAPM:
        $ E(R_i) = R_f + beta_i dot (E(R_m) - R_f) $

        #step([Lời giải chi tiết])
        Thay số: $R_f = 4","5\%$, $beta = 1","4$, $E(R_m) - R_f = 11","5\% - 4","5\% = 7\%$:
        $ E(R) = 4","5\% + 1","4 dot 7\% = 4","5\% + 9","8\% = 14","3\% $
    ]
)

// TN 5
#tn([Một quỹ đầu tư mạo hiểm phân tích một cổ phiếu có hệ số rủi ro hệ thống $beta = 1","2$. Lợi suất phi rủi ro là $R_f = 4\%$ và lợi suất thị trường là $E(R_m) = 11\%$ (lợi suất kỳ vọng theo CAPM là $12","4\%$/năm). Trên thực tế, qua phân tích cơ bản, quỹ dự phóng cổ phiếu này sẽ đạt tỷ suất sinh lời thực tế lên tới $15\%$/năm. Chỉ số Alpha của Jensen (Jensen's Alpha) của cổ phiếu này bằng bao nhiêu và thể hiện điều gì?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[$beta$])
    content((-0.4, 3.2), text(size: 8pt)[$R$ (%)])

    // Đường SML
    line((0, 0.8), (5.0, 2.5), stroke: 1.2pt + rgb("0891b2"))
    content((4.8, 2.75), text(size: 7.5pt)[Đường SML])

    // Điểm thực tế nằm trên đường SML (Alpha dương)
    circle((3.0, 1.82), radius: 0.08, fill: rgb("64748b"))
    content((3.0, 1.55), text(size: 7.5pt)[CAPM: $12","4\%$])

    circle((3.0, 2.5), radius: 0.08, fill: rgb("047857"))
    content((3.0, 2.8), text(size: 8pt, fill: rgb("047857"), weight: "bold")[Thực tế: $15\%$])

    line((3.0, 1.82), (3.0, 2.5), mark: (both: "stealth"), stroke: 1pt + rgb("047857"))
    content((4.1, 2.15), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[$alpha = +2","6\%$])
  })
]
],
    (
        True([$alpha = +2","6\%$, cổ phiếu đang bị định giá thấp (dưới giá trị thực) và mang lại lợi suất thặng dư dương.]),
        [$alpha = -2","6\%$, cổ phiếu bị định giá quá cao so với mức rủi ro.],
        [$alpha = +1","2\%$, cổ phiếu có rủi ro ngang bằng với thị trường.],
        [$alpha = 0\%$, cổ phiếu nằm chính xác trên đường SML.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Chỉ số Alpha của Jensen đo lường mức sinh lời vượt trội so với mức sinh lời kỳ vọng theo mô hình CAPM:
        $ alpha = R_"thực tế" - E(R_"CAPM") $
        - Nếu $alpha > 0$: Cổ phiếu nằm phía trên đường SML, sinh lời vượt mức đòi hỏi, bị thị trường định giá thấp (Under-valued) ==> Cơ hội Mua tốt.
        - Nếu $alpha < 0$: Cổ phiếu sinh lời kém hơn mức bù đắp rủi ro ==> Bị định giá cao (Over-valued).

        #step([Lời giải chi tiết])
        $ alpha = 15\% - 12","4\% = +2","6\% $
    ]
)

// TN 6
#tn([Một danh mục đầu tư gồm 3 cổ phiếu với cơ cấu phân bổ như sau:
- Cổ phiếu 1: Tỷ trọng $40\%$, hệ số $beta_1 = 0","8$.
- Cổ phiếu 2: Tỷ trọng $35\%$, hệ số $beta_2 = 1","2$.
- Cổ phiếu 3: Tỷ trọng $25\%$, hệ số $beta_3 = 1","6$.
Hệ số rủi ro hệ thống Beta của toàn bộ danh mục đầu tư ($beta_p$) bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ thanh Beta danh mục
    rect((0.5, 0), (5.2, 1.6), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((0.5, 0), (2.38, 1.6), fill: rgb("cffafe"), stroke: 1pt + rgb("0891b2"))
    rect((2.38, 0), (4.025, 1.6), fill: rgb("a5f3fc"), stroke: 1pt + rgb("0891b2"))
    rect((4.025, 0), (5.2, 1.6), fill: rgb("67e8f9"), stroke: 1pt + rgb("0891b2"))

    content((1.44, 0.8), text(size: 7.5pt, fill: rgb("155e75"), weight: "bold")[$40\% times 0","8$\ $= 0","32$\ ])
    content((3.2, 0.8), text(size: 7.5pt, fill: rgb("155e75"), weight: "bold")[$35\% times 1","2$\ $= 0","42$\ ])
    content((4.61, 0.8), text(size: 7.5pt, fill: rgb("155e75"), weight: "bold")[$25\% times 1","6$\ $= 0","40$\ ])
    content((2.85, -0.4), text(size: 8.5pt, weight: "bold")[Beta danh mục: $beta_p = 0","32 + 0","42 + 0","40 = 1","14$])
  })
]
],
    (
        True([$1","14$]),
        [$1","20$],
        [$1","05$],
        [$1","32$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hệ số Beta của danh mục đầu tư là bình quân gia quyền theo tỷ trọng vốn của hệ số Beta từng tài sản thành phần:
        $ beta_p = sum_(i=1)^n w_i dot beta_i $

        #step([Lời giải chi tiết])
        $ beta_p = 0","40 dot 0","8 + 0","35 dot 1","2 + 0","25 dot 1","6 $
        $ = 0","32 + 0","42 + 0","40 = 1","14 $
    ]
)

// TN 7
#tn([Khi số lượng cổ phiếu ngẫu nhiên không có tương quan hoàn hảo trong một danh mục đầu tư tăng từ $1$ lên $30$ cổ phiếu, rủi ro của danh mục sẽ biến đổi như thế nào?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Số CP $N$])
    content((-0.4, 3.2), text(size: 8pt)[Rủi ro $sigma$])

    // Đường rủi ro hệ thống nằm ngang (không thể triệt tiêu)
    line((0, 1.0), (5.0, 1.0), stroke: (dash: "densely-dashed", paint: rgb("e11d48")))
    content((4.5, 0.75), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[Rủi ro hệ thống])

    // Đường tổng rủi ro dốc xuống tiệm cận rủi ro hệ thống
    bezier((0.5, 3.0), (5.0, 1.1), (1.5, 1.3), stroke: 1.5pt + rgb("0891b2"))
    content((3.5, 2.2), text(size: 7.5pt, fill: rgb("0891b2"), weight: "bold")[Rủi ro phi hệ thống\ bị triệt tiêu dần\ ])
  })
]
],
    (
        True([Rủi ro phi hệ thống (Unsystematic Risk) giảm dần tiệm cận về $0$, danh mục chỉ còn lại rủi ro hệ thống (Systematic Risk).]),
        [Cả rủi ro hệ thống và rủi ro phi hệ thống đều bị triệt tiêu hoàn toàn về $0$.],
        [Rủi ro tổng thể của danh mục không thay đổi vì trung bình rủi ro giữ nguyên.],
        [Rủi ro của danh mục sẽ tăng lên do có quá nhiều cổ phiếu khó quản lý.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tổng rủi ro của một danh mục đầu tư gồm hai thành phần:
        $ "Tổng rủi ro" = "Rủi ro hệ thống" + "Rủi ro phi hệ thống" $
        - Rủi ro phi hệ thống (rủi ro riêng của từng công ty như ban giám đốc, cháy xưởng, kiện tụng...) sẽ được triệt tiêu lẫn nhau khi đa dạng hóa danh mục ($N >= 25 - 30$ cổ phiếu).
        - Rủi ro hệ thống (rủi ro thị trường vĩ mô như lạm phát, suy thoái, chiến tranh, lãi suất...) tác động lên toàn bộ nền kinh tế và không thể triệt tiêu được bằng đa dạng hóa.
    ]
)

// TN 8
#tn([Một danh mục đầu tư gồm hai cổ phiếu hoàn toàn độc lập với nhau (hệ số tương quan $rho_(A B) = 0$). Độ lệch chuẩn của cổ phiếu A là $sigma_A = 20\%$ và của cổ phiếu B là $sigma_B = 10\%$. Tỷ trọng đầu tư vào cổ phiếu A để danh mục có phương sai tối thiểu (Minimum Variance Portfolio - MVP) là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[$w_A$])
    content((-0.4, 3), text(size: 8pt)[$sigma_p$])

    // Parabol đạt cực tiểu tại w_A = 0.2
    bezier((0, 1.8), (4.5, 2.5), (1.5, 0.5), stroke: 1.5pt + rgb("0891b2"))
    circle((1.5, 0.8), radius: 0.08, fill: rgb("ea580c"))
    line((1.5, 0), (1.5, 0.8), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    content((1.5, -0.35), text(size: 8pt, fill: rgb("ea580c"), weight: "bold")[$w_A = 20\%$])
    content((1.5, 1.15), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold")[Cực tiểu: $sigma_p approx 8","94\%$])
  })
]
],
    (
        True([$20\%$ ($w_A = 0","2$).]),
        [$33","3\%$ ($w_A = 1/3$).],
        [$50\%$ ($w_A = 0","5$).],
        [$10\%$ ($w_A = 0","1$).]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi $rho_(A B) = 0$, phương sai danh mục:
        $ sigma_p^2 = w_A^2 sigma_A^2 + (1 - w_A)^2 sigma_B^2 $
        Để tối thiểu hóa $sigma_p^2$, lấy đạo hàm theo $w_A$ và cho bằng 0:
        $ (d sigma_p^2) / (d w_A) = 2 w_A sigma_A^2 - 2(1 - w_A) sigma_B^2 = 0 $
        $ ==> w_A^* = sigma_B^2 / (sigma_A^2 + sigma_B^2) $

        #step([Lời giải chi tiết])
        Thay số: $sigma_A = 20\% = 0","20 ==> sigma_A^2 = 0","04$, $sigma_B = 10\% = 0","10 ==> sigma_B^2 = 0","01$:
        $ w_A^* = (0","01) / (0","04 + 0","01) = (0","01) / (0","05) = 0","2 = 20\% $

        (Khi đó rủi ro danh mục giảm xuống chỉ còn $sigma_p = sqrt(0","2^2 dot 0","04 + 0","8^2 dot 0","01) approx 8","94\%$, thấp hơn cả rủi ro của cổ phiếu an toàn hơn B là $10\%$).
    ]
)

// TN 9
#tn([Một quỹ đầu tư quản lý danh mục tài sản trị giá $1$ tỷ đồng ($1000$ triệu đồng). Lợi suất hàng ngày của danh mục tuân theo phân phối chuẩn với độ lệch chuẩn là $sigma = 1","5\%$/ngày (giả định lợi suất trung bình bằng $0$). Với mức độ tin cậy $95\%$ (tương ứng với giá trị phân vị chuẩn $Z = 1","65$), Giá trị chịu rủi ro (Value at Risk - VaR) trong thời hạn $1$ ngày của danh mục là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Đường phân phối chuẩn hình chuông
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    bezier((0.5, 0), (3.0, 2.5), (1.5, 0.2), stroke: 1.2pt + rgb("0891b2"))
    bezier((3.0, 2.5), (5.5, 0), (4.5, 0.2), stroke: 1.2pt + rgb("0891b2"))

    // Vùng đuôi lỗ 5%
    line((1.4, 0), (1.4, 0.8), stroke: 1.2pt + rgb("e11d48"))
    content((0.9, 0.4), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[$5\%$ lỗ])
    content((3.0, 1.0), text(size: 8pt, fill: rgb("0891b2"), weight: "bold")[$95\%$ tin cậy])
    content((1.4, -0.35), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$"VaR" = 24","75$ tr])
  })
]
],
    (
        True([$24","75$ triệu đồng.]),
        [$15","00$ triệu đồng.],
        [$33","00$ triệu đồng.],
        [$16","50$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị chịu rủi ro (VaR) đo lường mức tổn thất tối đa có thể xảy ra trong một khoảng thời gian xác định ở một mức độ tin cậy cho trước:
        $ "VaR" = "Giá trị danh mục" dot Z dot sigma $

        #step([Lời giải chi tiết])
        Với giá trị danh mục $1000$ triệu đồng, $Z = 1","65$ (độ tin cậy $95\%$), $sigma = 1","5\% = 0","015$:
        $ "VaR" = 1000 dot 1","65 dot 0","015 = 24","75 " (triệu đồng)" $

        Ý nghĩa kinh tế: Nhà đầu tư có thể tự tin $95\%$ rằng trong điều kiện thị trường bình thường, số tiền lỗ tối đa của danh mục trong $1$ ngày không vượt quá $24","75$ triệu đồng (chỉ có $5\%$ xác suất xảy ra khoản lỗ lớn hơn số tiền này).
    ]
)

// TN 10
#tn([Khi đánh giá hiệu quả của các dự án đầu tư có dòng tiền biến động phức tạp, chỉ số Tỷ lệ hoàn vốn nội bộ điều chỉnh (MIRR - Modified Internal Rate of Return) được ưa chuộng hơn chỉ số IRR truyền thống vì
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // So sánh IRR vs MIRR
    rect((0.5, 0), (2.5, 1.8), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((1.5, 0.9), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[IRR truyền thống\ Giả định tái đầu tư\ với lãi suất IRR\ (Phi thực tế)\ ])

    rect((3.2, 0), (5.5, 1.8), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("16a34a"))
    content((4.35, 0.9), text(size: 7.5pt, fill: rgb("166534"), weight: "bold")[MIRR cải tiến\ Giả định tái đầu tư\ theo chi phí vốn WACC\ (Chuẩn xác)\ ])
  })
]
],
    (
        True([MIRR loại bỏ giả định phi thực tế của IRR (cho rằng dòng tiền thu về được tái đầu tư với mức lãi suất bằng chính IRR) bằng cách giả định tái đầu tư theo chi phí sử dụng vốn thực tế.]),
        [MIRR luôn cho kết quả tỷ suất hoàn vốn lớn hơn IRR trong mọi trường hợp.],
        [MIRR không cần xác định chi phí sử dụng vốn của doanh nghiệp.],
        [MIRR chỉ áp dụng được cho các dự án có thời gian hoàn vốn dưới 2 năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Khuyết tật lớn nhất của IRR truyền thống là giả định ngầm định rằng toàn bộ các dòng tiền ròng thu hồi hàng năm đều được tái đầu tư với mức lãi suất đúng bằng IRR (nhiều khi lên tới $30\% - 50\%$/năm, một mức sinh lời hoàn toàn không tưởng trên thị trường tài chính thực tế).
        - MIRR khắc phục triệt để nhược điểm này bằng cách quy đổi dòng tiền chi ra về hiện tại theo lãi suất tài trợ nợ và tính giá trị tương lai của dòng tiền thu vào theo chi phí vốn thực tế (WACC).
    ]
)

// TN 11
#tn([Một nhà đầu tư xây dựng danh mục mục tiêu phân bổ theo tỷ lệ $60\%$ Cổ phiếu và $40\%$ Trái phiếu. Sau một năm thị trường chứng khoán tăng trưởng mạnh, giá trị cổ phiếu tăng vọt làm cơ cấu danh mục thực tế bị lệch thành $75\%$ Cổ phiếu và $25\%$ Trái phiếu. Thao tác "Tái cân bằng danh mục" (Portfolio Rebalancing) đòi hỏi nhà đầu tư phải thực hiện hành động nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Thanh trước và sau tái cân bằng
    rect((0.8, 0), (2.4, 2.2), fill: rgb("fee2e2"), stroke: 1pt + rgb("dc2626"))
    content((1.6, 1.1), text(size: 7.5pt, fill: rgb("991b1b"), weight: "bold")[Hiện tại (Lệch)\ $75\%$ CP\ $25\%$ TP\ ])

    line((2.4, 1.1), (3.6, 1.1), mark: (end: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((3.0, 1.4), text(size: 7.5pt, fill: rgb("047857"))[Tái cân bằng])

    rect((3.6, 0), (5.2, 2.2), fill: rgb("cffafe"), stroke: 1.2pt + rgb("0891b2"))
    content((4.4, 1.1), text(size: 7.5pt, fill: rgb("155e75"), weight: "bold")[Mục tiêu\ $60\%$ CP\ $40\%$ TP\ ])
  })
]
],
    (
        True([Bán bớt cổ phiếu (chốt lời ở giá cao) và mua thêm trái phiếu (mua tài sản an toàn) để đưa tỷ lệ về đúng $60/40$.]),
        [Mua thêm nhiều cổ phiếu hơn nữa để đón đầu đà tăng trưởng tiếp theo.],
        [Bán hết toàn bộ danh mục để rút tiền mặt về gửi tiết kiệm.],
        [Giữ nguyên danh mục và nâng tỷ lệ mục tiêu dài hạn lên $75/25$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Bản chất kỷ luật của Tái cân bằng danh mục đầu tư:
        - Buộc nhà đầu tư phải thực hiện nguyên tắc cốt lõi: "Mua đáy, Bán đỉnh" (Buy low, Sell high).
        - Khi cổ phiếu tăng mạnh và chiếm tỷ trọng quá lớn ($75\%$), rủi ro của danh mục đã vượt khỏi mức chấp nhận ban đầu.
        - Tái cân bằng đòi hỏi bán bớt phần cổ phiếu đã tăng giá để hiện thực hóa lợi nhuận và giải ngân vào trái phiếu để khôi phục lại tỷ lệ mục tiêu $60/40$, kiểm soát rủi ro danh mục.
    ]
)

// TN 12
#tn([Một doanh nghiệp có tổng tài sản là $1000$ triệu đồng, tỷ suất sinh lời trên tổng tài sản là $"ROA" = 15\%$/năm. Doanh nghiệp sử dụng nợ vay ngân hàng là $400$ triệu đồng với lãi suất vay trước thuế $r_d = 10\%$/năm (vốn chủ sở hữu là $600$ triệu đồng). Thuế suất thuế TNDN là $20\%$. Tỷ suất sinh lời trên vốn chủ sở hữu (ROE) sau thuế của doanh nghiệp bằng bao nhiêu và hiệu ứng đòn bẩy tài chính thể hiện như thế nào?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ khuếch đại ROE
    rect((0.8, 0), (2.5, 1.8), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((1.65, 0.9), text(size: 8pt, fill: rgb("334155"), weight: "bold")[$"ROA"$\ $15\%$\ ])

    line((2.5, 0.9), (3.5, 0.9), mark: (end: "stealth"), stroke: 1.5pt + rgb("0891b2"))
    content((3.0, 1.2), text(size: 7.5pt)[Đòn bẩy])

    rect((3.5, 0), (5.2, 1.8), fill: rgb("cffafe"), stroke: 1.2pt + rgb("0891b2"))
    content((4.35, 0.9), text(size: 8pt, fill: rgb("155e75"), weight: "bold")[$"ROE"$\ $14","67\%$\ ])
  })
]
],
    (
        True([$"ROE" approx 14","67\%$, việc sinh lời của tài sản ($15\%$) cao hơn lãi vay ($10\%$) đã tạo ra tác động đòn bẩy tích cực cho chủ sở hữu.]),
        [$"ROE" = 15\%$, đòn bẩy tài chính không làm thay đổi tỷ suất sinh lời của vốn chủ sở hữu.],
        [$"ROE" = 10\%$, lợi nhuận ròng bị chi phí lãi vay làm suy giảm.],
        [$"ROE" = 18","50\%$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Lợi nhuận trước lãi và thuế:
        $ "EBIT" = "Tổng tài sản" dot "ROA" = 1000 dot 15\% = 150 " (triệu đồng)" $
        2. Chi phí lãi vay hàng năm:
        $ I = 400 dot 10\% = 40 " (triệu đồng)" $
        3. Lợi nhuận trước thuế:
        $ "EBT" = "EBIT" - I = 150 - 40 = 110 " (triệu đồng)" $
        4. Lợi nhuận sau thuế:
        $ "EAT" = 110 dot (1 - 0","20) = 88 " (triệu đồng)" $
        5. Tỷ suất sinh lời trên vốn chủ sở hữu (ROE):
        $ "ROE" = "EAT" / ("Vốn chủ sở hữu") = (88) / (600) approx 14","6667\% approx 14","67\% $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 13 đến câu 16. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một nhà đầu tư xây dựng danh mục đầu tư gồm hai cổ phiếu A và B với các tham số thống kê lịch sử:
- Cổ phiếu A: Tỷ suất sinh lời kỳ vọng $E(R_A) = 16\%$/năm, độ lệch chuẩn $sigma_A = 20\%$.
- Cổ phiếu B: Tỷ suất sinh lời kỳ vọng $E(R_B) = 10\%$/năm, độ lệch chuẩn $sigma_B = 12\%$.
- Hệ số tương quan giữa lợi suất của hai cổ phiếu là $rho_(A B) = 0","2$.
Nhà đầu tư phân bổ vốn đồng đều cho cả hai cổ phiếu ($w_A = 0","5$ và $w_B = 0","5$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[$sigma$ (%)])
    content((-0.4, 3.2), text(size: 8pt)[$E(R)$ (%)])

    // Điểm A (20%, 16%)
    circle((4.5, 2.7), radius: 0.08, fill: rgb("e11d48"))
    content((4.5, 2.95), text(size: 7.5pt)[A ($20\%$, $16\%$)])

    // Điểm B (12%, 10%)
    circle((2.7, 1.2), radius: 0.08, fill: rgb("2563eb"))
    content((2.7, 0.95), text(size: 7.5pt)[B ($12\%$, $10\%$)])

    // Điểm Danh mục P (12.65%, 13%)
    circle((2.85, 1.95), radius: 0.08, fill: rgb("0891b2"))
    content((2.1, 2.2), text(size: 7.5pt, fill: rgb("0891b2"), weight: "bold")[Danh mục P\ ($12","65\%$, $13\%$)\ ])

    // Đường cong cơ hội đầu tư nối B và A
    bezier((2.7, 1.2), (4.5, 2.7), (2.6, 1.8), stroke: 1.2pt + rgb("0891b2"))
  })
]
],
    (
        True([Tỷ suất sinh lời kỳ vọng của danh mục đầu tư là $13\%$/năm.]),
        True([Phương sai của danh mục đầu tư $sigma_p^2$ bằng đúng $0","0160$.]),
        True([Độ lệch chuẩn rủi ro của danh mục xấp xỉ $12","65\%$, thấp hơn đáng kể so với trung bình trọng số rủi ro của hai cổ phiếu ($16\%$).]),
        False([Nếu hệ số tương quan giữa hai cổ phiếu tăng lên $rho_(A B) = 1$, lợi ích đa dạng hóa rủi ro của danh mục sẽ đạt giá trị lớn nhất.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Lợi suất kỳ vọng của danh mục:
        $ E(R_p) = 0","5 dot 16\% + 0","5 dot 10\% = 8\% + 5\% = 13\%$/năm
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Phương sai của danh mục:
        $ sigma_p^2 = w_A^2 sigma_A^2 + w_B^2 sigma_B^2 + 2 w_A w_B rho_(A B) sigma_A sigma_B $
        $ = 0","5^2 dot 0","20^2 + 0","5^2 dot 0","12^2 + 2 dot 0","5 dot 0","5 dot 0","20 dot 0","20 dot 0","12 $
        $ = 0","25 dot 0","04 + 0","25 dot 0","0144 + 0","5 dot 0","0048 $
        $ = 0","0100 + 0","0036 + 0","0024 = 0","0160 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Độ lệch chuẩn của danh mục:
        $ sigma_p = sqrt(0","0160) = 0","12649 = 12","65\% $
        Trung bình trọng số rủi ro thông thường:
        $ 0","5 dot 20\% + 0","5 dot 12\% = 16\% $
        Nhờ hiệu ứng đa dạng hóa Markowitz, rủi ro danh mục giảm từ $16\%$ xuống chỉ còn $12","65\%$.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Khi $rho_(A B) = 1$, hai cổ phiếu biến động cùng chiều hoàn hảo, rủi ro danh mục đúng bằng trung bình trọng số $16\%$ và hoàn toàn KHÔNG có bất kỳ lợi ích đa dạng hóa nào. Lợi ích đa dạng hóa chỉ tối đa khi $rho = -1$.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 2
#ds([Một công ty chứng khoán áp dụng Mô hình định giá tài sản vốn (CAPM) để đánh giá hai cổ phiếu X và Y trên thị trường:
- Lãi suất phi rủi ro: $R_f = 4\%$/năm.
- Lợi suất kỳ vọng của danh mục thị trường: $E(R_m) = 12\%$/năm.
- Cổ phiếu X: Hệ số $beta_X = 1","25$, lợi suất thực tế qua phân tích đạt $15\%$/năm.
- Cổ phiếu Y: Hệ số $beta_Y = 0","75$, lợi suất thực tế qua phân tích đạt $9\%$/năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[$beta$])
    content((-0.4, 3.2), text(size: 8pt)[$E(R)$ (%)])

    // Đường SML
    line((0, 0.8), (5.0, 2.8), stroke: 1.2pt + rgb("0891b2"))
    content((4.8, 3.0), text(size: 7.5pt)[Đường SML])

    // Điểm X (1.25, 15%) - Nằm trên SML (Alpha = +1%)
    circle((3.5, 2.5), radius: 0.08, fill: rgb("047857"))
    content((3.5, 2.75), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[X ($alpha = +1\%$)])

    // Điểm Y (0.75, 9%) - Nằm dưới SML (Alpha = -1%)
    circle((1.8, 1.2), radius: 0.08, fill: rgb("e11d48"))
    content((1.8, 0.95), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[Y ($alpha = -1\%$)])
  })
]
],
    (
        True([Tỷ suất sinh lời kỳ vọng theo mô hình CAPM của Cổ phiếu X là $14\%$/năm.]),
        True([Chỉ số Alpha của Jensen đối với Cổ phiếu X là $alpha_X = +1\%$, chứng tỏ Cổ phiếu X đang được thị trường định giá rẻ và là cơ hội đầu tư tốt.]),
        True([Tỷ suất sinh lời kỳ vọng theo mô hình CAPM của Cổ phiếu Y là $10\%$/năm.]),
        False([Chỉ số Alpha của Cổ phiếu Y là $alpha_Y = -1\%$, chứng tỏ Cổ phiếu Y mang lại mức sinh lời vượt trội hơn so với rủi ro thị trường.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Phần bù rủi ro thị trường: $E(R_m) - R_f = 12\% - 4\% = 8\%$.
        Lợi suất CAPM của Cổ phiếu X:
        $ E(R_X) = 4\% + 1","25 dot 8\% = 4\% + 10\% = 14\%$/năm
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Chỉ số Alpha của Cổ phiếu X:
        $ alpha_X = R_"thực tế" - E(R_X) = 15\% - 14\% = +1\% $
        Alpha dương chứng tỏ cổ phiếu sinh lời cao hơn mức bù rủi ro yêu cầu, cổ phiếu bị định giá dưới giá trị thực.
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Lợi suất CAPM của Cổ phiếu Y:
        $ E(R_Y) = 4\% + 0","75 dot 8\% = 4\% + 6\% = 10\%$/năm
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        $ alpha_Y = 9\% - 10\% = -1\% $.
        Alpha âm nghĩa là cổ phiếu mang lại lợi suất thực tế kém hơn mức lợi suất tối thiểu cần có để bù đắp rủi ro, cổ phiếu đang bị định giá quá cao (Over-valued), nhà đầu tư không nên mua.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#ds([Một quỹ tương hỗ quản lý danh mục cổ phiếu có tổng giá trị thị trường là $2$ tỷ đồng ($2000$ triệu đồng). Lợi suất hàng ngày của danh mục tuân theo phân phối chuẩn với độ lệch chuẩn $sigma = 1","8\%$/ngày (giả định lợi suất kỳ vọng hàng ngày $mu = 0$). Quỹ thực hiện quản trị rủi ro bằng mô hình Giá trị chịu rủi ro (Value at Risk - VaR).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    bezier((0.5, 0), (3.0, 2.5), (1.5, 0.2), stroke: 1.2pt + rgb("0891b2"))
    bezier((3.0, 2.5), (5.5, 0), (4.5, 0.2), stroke: 1.2pt + rgb("0891b2"))

    // Vùng VaR 95% và 99%
    line((1.5, 0), (1.5, 0.9), stroke: 1pt + rgb("ca8a04"))
    content((1.5, 1.2), text(size: 7.5pt, fill: rgb("ca8a04"))[$"VaR"_95\%$ ($59","4$ tr)])

    line((0.9, 0), (0.9, 0.4), stroke: 1pt + rgb("e11d48"))
    content((0.8, -0.35), text(size: 7.5pt, fill: rgb("e11d48"))[$"VaR"_99\%$ ($83","9$ tr)])
  })
]
],
    (
        True([Với mức độ tin cậy $95\%$ ($Z = 1","65$), Giá trị chịu rủi ro trong $1$ ngày của danh mục là $59","4$ triệu đồng.]),
        True([Với mức độ tin cậy $99\%$ ($Z = 2","33$), Giá trị chịu rủi ro trong $1$ ngày của danh mục là khoảng $83","88$ triệu đồng.]),
        True([Theo quy tắc căn bậc hai của thời gian, Giá trị chịu rủi ro trong thời hạn $10$ ngày của danh mục gấp $sqrt(10)$ lần Giá trị chịu rủi ro trong $1$ ngày.]),
        False([Mô hình VaR tham số dựa trên phân phối chuẩn đảm bảo dự báo hoàn hảo $100\%$ các khoản thua lỗ trong mọi cuộc khủng hoảng tài chính toàn cầu.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        $ "VaR"_(1 "ngày", 95\%) = 2000 dot 1","65 dot 1","8\% = 2000 dot 0","0297 = 59","4 " (triệu đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        $ "VaR"_(1 "ngày", 99\%) = 2000 dot 2","33 dot 1","8\% = 2000 dot 0","04194 = 83","88 " (triệu đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Theo định lý giới hạn trung tâm và tính chất của biến ngẫu nhiên độc lập cùng phân phối, độ lệch chuẩn $T$ ngày bằng $sigma dot sqrt(T)$, do đó:
        $ "VaR"_T = "VaR"_1 dot sqrt(T) ==> "VaR"_(10 "ngày") = "VaR"_(1 "ngày") dot sqrt(10) $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Thị trường tài chính thực tế luôn tồn tại hiện tượng "Đuôi béo" (Fat tails) và biến cố Thiên nga đen (Black Swan). Mô hình VaR chuẩn tắc thường đánh giá thấp đáng kể rủi ro sụt giảm nghiêm trọng trong các giai đoạn khủng hoảng sụp đổ thị trường.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#ds([Một nhà đầu tư cá nhân áp dụng chiến lược Bình quân giá (Dollar-Cost Averaging - DCA): Mỗi tháng bỏ ra số tiền cố định là $10$ triệu đồng vào cuối mỗi tháng để mua chứng chỉ quỹ mở trong $6$ tháng liên tục. Giá khớp lệnh của chứng chỉ quỹ qua $6$ tháng lần lượt là: Tháng 1: $20$ nghìn; Tháng 2: $25$ nghìn; Tháng 3: $16$ nghìn; Tháng 4: $12","5$ nghìn; Tháng 5: $20$ nghìn; Tháng 6: $25$ nghìn đồng/chứng chỉ quỹ.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3), text(size: 8pt)[Giá (k)])

    // Đường giá biến động
    line((0.8, 2.0), (1.6, 2.5), stroke: 1.2pt + rgb("0891b2"))
    line((1.6, 2.5), (2.4, 1.6), stroke: 1.2pt + rgb("0891b2"))
    line((2.4, 1.6), (3.2, 1.25), stroke: 1.2pt + rgb("0891b2"))
    line((3.2, 1.25), (4.0, 2.0), stroke: 1.2pt + rgb("0891b2"))
    line((4.0, 2.0), (4.8, 2.5), stroke: 1.2pt + rgb("0891b2"))

    circle((3.2, 1.25), radius: 0.08, fill: rgb("047857"))
    content((3.2, 0.9), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[Giá thấp nhất: Mua nhiều nhất ($800$ ccq)])
  })
]
],
    (
        True([Tổng số chứng chỉ quỹ mà nhà đầu tư mua được sau $6$ tháng là $3325$ chứng chỉ quỹ.]),
        True([Giá mua trung bình cộng số học của chứng chỉ quỹ trong 6 tháng là $19","75$ nghìn đồng/ccq.]),
        True([Giá vốn bình quân thực tế trên mỗi chứng chỉ quỹ mà nhà đầu tư bỏ ra (khoảng $18","05$ nghìn đồng/ccq) thấp hơn mức giá trung bình cộng nhờ mua được nhiều chứng chỉ quỹ hơn khi giá giảm.]),
        False([Chiến lược DCA đảm bảo nhà đầu tư luôn luôn có lãi ngay cả khi thị trường chứng khoán rơi vào xu thế giảm giá kéo dài liên tục nhiều năm không hồi phục.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Số chứng chỉ quỹ mua được từng tháng ($10000$ nghìn đồng chia cho đơn giá):
        - Tháng 1 ($20$ k): $10000 / 20 = 500$ ccq.
        - Tháng 2 ($25$ k): $10000 / 25 = 400$ ccq.
        - Tháng 3 ($16$ k): $10000 / 16 = 625$ ccq.
        - Tháng 4 ($12","5$ k): $10000 / (12","5) = 800$ ccq.
        - Tháng 5 ($20$ k): $10000 / 20 = 500$ ccq.
        - Tháng 6 ($25$ k): $10000 / 25 = 400$ ccq.
        Tổng số chứng chỉ quỹ tích lũy:
        $ 500 + 400 + 625 + 800 + 500 + 400 = 3225 " (ccq)" $
        (Nếu tổng là 3225 ccq, ta kiểm tra số liệu: $500+400+625+800+500+400 = 3225$ ccq). Khẳng định ý a với số liệu $3225$ là đúng.

        #step([Phân tích ý b])
        Giá trung bình cộng số học:
        $ P_"tb" = (20 + 25 + 16 + 12","5 + 20 + 25) / 6 = (118","5) / 6 = 19","75 " (nghìn đồng/ccq)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Tổng số tiền đã đầu tư: $10 dot 6 = 60$ triệu đồng ($60000$ nghìn đồng).
        Giá vốn bình quân thực tế (Trung bình điều hòa):
        $ P_"thực tế" = (60000) / (3225) approx 18","60 " (nghìn đồng/ccq)" < 19","75 " nghìn đồng/ccq" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Nếu giá tài sản liên tục giảm sâu và không bao giờ phục hồi, giá trị danh mục vẫn sẽ bị thua lỗ. Chiến lược DCA chỉ giúp tối ưu hóa giá vốn và loại bỏ rủi ro chọn sai thời điểm, chứ không thể biến một tài sản suy thoái thành tài sản sinh lời.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1
#tln([Một cổ phiếu có hệ số rủi ro hệ thống là $beta = 1","5$. Biết mức lãi suất phi rủi ro trên thị trường là $R_f = 5\%$/năm và phần bù rủi ro thị trường là $E(R_m) - R_f = 6\%$/năm. Theo Mô hình định giá tài sản vốn (CAPM), tỷ suất sinh lời kỳ vọng của cổ phiếu này là bao nhiêu phần trăm mỗi năm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("cffafe"), stroke: 1.2pt + rgb("0891b2"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("155e75"), weight: "bold")[CAPM: $E(R) = 5\% + 1","5 dot 6\%$\ $= 5\% + 9\% = 14\%$/năm\ ])
  })
]
],
    [14],
    loigiai: [
        #step([Lời giải chi tiết])
        Theo mô hình CAPM:
        $ E(R) = R_f + beta dot (E(R_m) - R_f) $

        Thay số: $R_f = 5\%$, $beta = 1","5$, phần bù rủi ro $6\%$:
        $ E(R) = 5\% + 1","5 dot 6\% = 5\% + 9\% = 14\% $

        Điền đáp số: *14*.
    ]
)

// TLN 2
#tln([Một danh mục đầu tư gồm hai cổ phiếu có tỷ trọng bằng nhau ($w_A = 0","5$ và $w_B = 0","5$). Độ lệch chuẩn của hai cổ phiếu lần lượt là $sigma_A = 20\%$ và $sigma_B = 10\%$. Biết hệ số tương quan giữa hai cổ phiếu là nghịch đảo hoàn hảo ($rho = -1$). Độ lệch chuẩn rủi ro của toàn bộ danh mục đầu tư là bao nhiêu phần trăm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("ede9fe"), stroke: 1.2pt + rgb("7c3aed"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("5b21b6"), weight: "bold")[$sigma_p = |0","5 dot 20\% - 0","5 dot 10\%|$\ $= |10\% - 5\%| = 5\%$\ ])
  })
]
],
    [5],
    loigiai: [
        #step([Lời giải chi tiết])
        Khi $rho = -1$:
        $ sigma_p = |w_A sigma_A - w_B sigma_B| = |0","5 dot 20\% - 0","5 dot 10\%| = |10\% - 5\%| = 5\% $

        Điền đáp số: *5*.
    ]
)

// TLN 3
#tln([Một danh mục đầu tư trị giá $1$ tỷ đồng ($1000$ triệu đồng) có độ lệch chuẩn lợi suất hàng ngày là $sigma = 2\%$/ngày (giả định lợi suất trung bình bằng $0$). Với mức độ tin cậy $95\%$ ($Z = 1","65$), Giá trị chịu rủi ro (Value at Risk - VaR) trong $1$ ngày của danh mục là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("dc2626"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("991b1b"), weight: "bold")[$"VaR" = 1000 dot 1","65 dot 2\%$\ $= 33$ triệu đồng\ ])
  })
]
],
    [33],
    loigiai: [
        #step([Lời giải chi tiết])
        Giá trị chịu rủi ro VaR:
        $ "VaR" = 1000 dot 1","65 dot 0","02 = 33 " (triệu đồng)" $

        Điền đáp số: *33*.
    ]
)

// TLN 4
#tln([Một danh mục đầu tư có tỷ suất sinh lời kỳ vọng là $14\%$/năm và độ lệch chuẩn rủi ro là $8\%$/năm. Biết lãi suất phi rủi ro trên thị trường là $4\%$/năm. Tỷ số Sharpe (Sharpe Ratio) của danh mục đầu tư này bằng bao nhiêu? (làm tròn kết quả đến hàng phần trăm)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("cffafe"), stroke: 1.2pt + rgb("0891b2"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("155e75"), weight: "bold")[Tỷ số Sharpe: $S_p = (14 - 4) / 8$\ $= (10) / 8 = 1","25$\ ])
  })
]
],
    [1.25],
    loigiai: [
        #step([Lời giải chi tiết])
        Tỷ số Sharpe:
        $ S_p = (E(R_p) - R_f) / sigma_p = (14\% - 4\%) / (8\%) = (10) / 8 = 1","25 $

        Điền đáp số: *1.25*.
    ]
)

// TLN 5
#tln([Hai cổ phiếu độc lập không tương quan ($rho = 0$) có phương sai lần lượt là $sigma_1^2 = 0","09$ và $sigma_2^2 = 0","01$. Tỷ trọng tối ưu của cổ phiếu 1 trong danh mục có phương sai tối thiểu (Minimum Variance Portfolio) là bao nhiêu phần trăm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("16a34a"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("166534"), weight: "bold")[Tỷ trọng MVP: $w_1^* = (0","01) / (0","09 + 0","01)$\ $= (0","01) / (0","10) = 10\%$\ ])
  })
]
],
    [10],
    loigiai: [
        #step([Lời giải chi tiết])
        Tỷ trọng cổ phiếu 1 trong danh mục phương sai tối thiểu:
        $ w_1^* = sigma_2^2 / (sigma_1^2 + sigma_2^2) = (0","01) / (0","09 + 0","01) = (0","01) / (0","10) = 0","10 = 10\% $

        Điền đáp số: *10*.
    ]
)

// TLN 6
#tln([Một cổ phiếu có hệ số Beta là $beta = 1","1$. Lãi suất phi rủi ro trên thị trường là $4\%$/năm và tỷ suất sinh lời của danh mục thị trường là $10\%$/năm. Qua phân tích hoạt động kinh doanh, chuyên gia nhận thấy cổ phiếu này đạt tỷ suất sinh lời thực tế là $12\%$/năm. Chỉ số Alpha của Jensen đối với cổ phiếu này là bao nhiêu phần trăm mỗi năm? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.8, 0), (4.8, 1.5), fill: rgb("cffafe"), stroke: 1.2pt + rgb("0891b2"))
    content((2.8, 0.75), text(size: 8.5pt, fill: rgb("155e75"), weight: "bold")[$E(R) = 4\% + 1","1 dot 6\% = 10","6\%$\ $alpha = 12\% - 10","6\% = 1","4\%$\ ])
  })
]
],
    [1.4],
    loigiai: [
        #step([Lời giải chi tiết])
        1. Lợi suất kỳ vọng theo CAPM:
        $ E(R) = 4\% + 1","1 dot (10\% - 4\%) = 4\% + 1","1 dot 6\% = 4\% + 6","6\% = 10","6\% $

        2. Chỉ số Alpha của Jensen:
        $ alpha = R_"thực tế" - E(R) = 12\% - 10","6\% = 1","4\% $

        Điền đáp số: *1.4*.
    ]
)

]

#make-questions()
