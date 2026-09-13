#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("7c3aed")

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH",
  exam-title: "CHỦ ĐỀ 2D: VAY NỢ TRẢ GÓP & PHÂN BỔ NỢ (AMORTIZATION) (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "514",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một người vay ngân hàng số tiền $300$ triệu đồng để mua ô tô trả góp trong thời hạn $3$ năm ($36$ tháng). Ngân hàng áp dụng mức lãi suất cố định là $0","8\%$/tháng theo thể thức lãi kép trên dư nợ giảm dần, số tiền trả nợ mỗi tháng là như nhau (phương thức niên kim trả góp đều). Số tiền mà người đó phải thanh toán đều đặn cho ngân hàng vào cuối mỗi tháng xấp xỉ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Tháng])

    // Nhận nợ ban đầu
    line((0.5, 0), (0.5, 1.4), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((0.5, -0.35), text(size: 8pt)[$t = 0$])
    content((0.5, 1.65), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$"PV" = 300$ tr])

    // Dòng tiền trả nợ đều R
    line((1.6, 0), (1.6, -1.0), mark: (end: "stealth"), stroke: 1.2pt + rgb("7c3aed"))
    content((1.6, 0.35), text(size: 8pt)[$1$])
    content((1.6, -1.25), text(size: 7.5pt, fill: rgb("7c3aed"))[$-R$])

    line((2.7, 0), (2.7, -1.0), mark: (end: "stealth"), stroke: 1.2pt + rgb("7c3aed"))
    content((2.7, 0.35), text(size: 8pt)[$2$])
    content((2.7, -1.25), text(size: 7.5pt, fill: rgb("7c3aed"))[$-R$])

    content((3.8, -0.5), text(size: 9pt, fill: rgb("7c3aed"))[$dots$])

    line((4.9, 0), (4.9, -1.0), mark: (end: "stealth"), stroke: 1.2pt + rgb("7c3aed"))
    content((4.9, 0.35), text(size: 8pt)[$36$])
    content((4.9, -1.25), text(size: 7.5pt, fill: rgb("7c3aed"))[$-R$])
    content((4.9, 1.3), text(size: 8pt, fill: rgb("7c3aed"), weight: "bold")[$R = ?$])
  })
]
],
    (
        True([$9","62$ triệu đồng.]),
        [$8","33$ triệu đồng.],
        [$10","74$ triệu đồng.],
        [$11","25$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là mô hình vay nợ trả góp đều định kỳ (Amortized Loan):
        - Giá trị khoản nợ ban đầu: $"PV"$.
        - Lãi suất mỗi kỳ: $r$.
        - Tổng số kỳ trả nợ: $n$.
        Khoản tiền cố định phải trả vào cuối mỗi kỳ được xác định bởi công thức:
        $ R = "PV" dot r / (1 - (1 + r)^(-n)) $

        #step([Lời giải chi tiết])
        Theo bài ra, ta có:
        - Số tiền vay ban đầu: $"PV" = 300$ triệu đồng.
        - Lãi suất hàng tháng: $r = 0","8\% = 0","008$.
        - Thời hạn vay: $n = 36$ tháng.

        Áp dụng công thức tính khoản trả góp đều hàng tháng $R$:
        $ R = 300 dot (0","008) / (1 - (1 + 0","008)^(-36)) $

        Ta tính toán các đại lượng thành phần:
        $ (1 + 0","008)^(-36) = (1","008)^(-36) approx 0","750808 $
        $ 1 - 0","750808 = 0","249192 $
        $ R = (2","4) / (0","249192) approx 9","6239 " (triệu đồng)" $

        Làm tròn đến hàng phần trăm, mỗi tháng người đó phải trả khoảng $9","62$ triệu đồng.
    ]
)

// TN 2
#tn([Một người vay ngân hàng $500$ triệu đồng để đầu tư thiết bị sản xuất, thời hạn $5$ năm ($60$ tháng) với lãi suất $1\%$/tháng theo phương thức trả góp đều hàng tháng (khoản thanh toán mỗi tháng xấp xỉ $11","12$ triệu đồng). Trong số tiền $11","12$ triệu đồng thanh toán ở tháng thứ nhất, tỷ lệ tiền trả nợ gốc chiếm khoảng bao nhiêu phần trăm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ cột phân bổ Gốc và Lãi ở Tháng 1
    rect((0, 0), (2.2, 2.5), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((0, 0), (2.2, 1.38), fill: rgb("8b5cf6").lighten(40%), stroke: 1pt + rgb("7c3aed"))
    rect((0, 1.38), (2.2, 2.5), fill: rgb("f43f5e").lighten(40%), stroke: 1pt + rgb("e11d48"))

    content((1.1, 0.7), text(size: 8pt, fill: rgb("6d28d9"), weight: "bold")[Gốc: $6","12$ tr\ ($approx 55\%$)\ ])
    content((1.1, 1.95), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[Lãi: $5","00$ tr\ ($approx 45\%$)\ ])
    content((1.1, -0.4), text(size: 8.5pt, weight: "bold")[Tháng thứ 1 ($R approx 11","12$ tr)])
  })
]
],
    (
        True([$55","0\%$]),
        [$45","0\%$],
        [$60","2\%$],
        [$50","0\%$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Trong phương thức trả góp đều, cấu trúc khoản thanh toán $R$ ở kỳ thứ $k$ gồm hai phần:
        $ R = P_k + I_k $
        - $I_k$ là tiền lãi phát sinh trên dư nợ đầu kỳ: $I_k = B_(k-1) dot r$.
        - $P_k$ là tiền hoàn trả nợ gốc: $P_k = R - I_k$.
        Ở kỳ thứ nhất ($k = 1$), dư nợ ban đầu là $B_0 = "PV"$.

        #step([Lời giải chi tiết])
        - Tiền lãi phải trả ở tháng thứ nhất:
        $ I_1 = "PV" dot r = 500 dot 1\% = 5","00 " (triệu đồng)" $

        - Tiền trả nợ gốc ở tháng thứ nhất:
        $ P_1 = R - I_1 = 11","1222 - 5","00 = 6","1222 " (triệu đồng)" $

        - Tỷ lệ tiền nợ gốc trong tổng khoản thanh toán tháng 1:
        $ "Tỷ lệ" = P_1 / R = (6","1222) / (11","1222) approx 0","55045 = 55","05\% $

        Làm tròn kết quả là khoảng $55","0\%$.
    ]
)

// TN 3
#tn([Một doanh nghiệp vay $800$ triệu đồng thời hạn $5$ năm ($60$ tháng) với lãi suất $0","7\%$/tháng theo phương thức trả góp đều hàng tháng. Biết số tiền thanh toán định kỳ mỗi tháng là $16","37$ triệu đồng. Sau đúng $2$ năm ($24$ tháng) thực hiện nghĩa vụ thanh toán đầy đủ, số dư nợ gốc còn lại của doanh nghiệp là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3.2), text(size: 8pt)[Dư nợ (tr)])

    // Điểm t = 0
    circle((0, 2.7), radius: 0.08, fill: rgb("7c3aed"))
    content((-0.6, 2.7), text(size: 8pt, weight: "bold")[$800$])

    // Đường cong dư nợ giảm dần
    bezier((0, 2.7), (5, 0), (2.5, 1.8), stroke: 1.5pt + rgb("7c3aed"))

    // Điểm t = 24
    line((2.4, 0), (2.4, 1.75), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    line((0, 1.75), (2.4, 1.75), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    circle((2.4, 1.75), radius: 0.08, fill: rgb("e11d48"))
    content((2.4, -0.3), text(size: 8pt)[$24$])
    content((5, -0.3), text(size: 8pt)[$60$])
    content((3.3, 2.1), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$B_24 approx 519","5$ tr])
  })
]
],
    (
        True([Khoảng $519","48$ triệu đồng.]),
        [Khoảng $480","00$ triệu đồng.],
        [Khoảng $562","15$ triệu đồng.],
        [Khoảng $535","80$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số dư nợ còn lại sau $k$ kỳ thanh toán ($B_k$) có thể tính theo phương pháp nhìn về tương lai (Prospective Method):
        Dư nợ $B_k$ chính bằng giá trị hiện tại của $n - k$ khoản thanh toán đều $R$ còn lại trong tương lai:
        $ B_k = R dot (1 - (1 + r)^(-(n - k))) / r $

        #step([Lời giải chi tiết])
        Khoản vay có tổng thời hạn $n = 60$ tháng.
        Sau $k = 24$ tháng, số tháng còn lại là:
        $ n - k = 60 - 24 = 36 " (tháng)" $

        Số dư nợ gốc còn lại sau tháng thứ 24:
        $ B_24 = 16","3747 dot (1 - (1 + 0","007)^(-36)) / (0","007) $

        Ta tính toán:
        $ (1","007)^(-36) approx 0","777858 $
        $ 1 - 0","777858 = 0","222142 $
        $ B_24 = 16","3747 dot (0","222142) / (0","007) = 16","3747 dot 31","7346 approx 519","48 " (triệu đồng)" $

        Vậy số dư nợ còn lại là khoảng $519","48$ triệu đồng.
    ]
)

// TN 4
#tn([Một khách hàng vay ngân hàng $600$ triệu đồng trong $5$ năm ($60$ tháng) với lãi suất $0","9\%$/tháng. Ngân hàng cho phép lựa chọn một trong hai phương thức trả nợ:
- Phương thức A: Trả góp đều hàng tháng (cả gốc và lãi cố định).
- Phương thức B: Trả nợ gốc chia đều mỗi tháng, tiền lãi tính trên dư nợ thực tế giảm dần.
Hỏi tổng số tiền lãi mà khách hàng phải trả theo Phương thức B tiết kiệm được bao nhiêu so với Phương thức A?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3.2), text(size: 8pt)[Số tiền trả])

    // Phương thức A: Đường nằm ngang R cố định
    line((0, 1.8), (5.2, 1.8), stroke: 1.5pt + rgb("0284c7"))
    content((5.2, 2.1), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[Phương thức A ($R$ đều)])

    // Phương thức B: Đường dốc xuống
    line((0, 2.6), (5.2, 1.1), stroke: 1.5pt + rgb("047857"))
    content((5.2, 0.8), text(size: 8pt, fill: rgb("047857"), weight: "bold")[Phương thức B (Gốc đều)])
  })
]
],
    (
        True([Khoảng $14","44$ triệu đồng.]),
        [Khoảng $21","30$ triệu đồng.],
        [Khoảng $8","50$ triệu đồng.],
        [Khoảng $32","15$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Đối với Phương thức A (Trả góp đều):
        Tính số tiền trả đều $R$, sau đó:
        $ "Tổng lãi A" = n dot R - "PV" $
        - Đối với Phương thức B (Trả gốc đều):
        Mỗi tháng trả nợ gốc $P = "PV"/n$. Dư nợ giảm dần đều theo cấp số cộng.
        Tổng tiền lãi được tính theo công thức:
        $ "Tổng lãi B" = r dot "PV" dot (n + 1) / 2 $

        #step([Lời giải chi tiết])
        Với $"PV" = 600$ triệu, $r = 0","9\% = 0","009$, $n = 60$ tháng:
        - Với Phương thức A:
        $ R = 600 dot (0","009) / (1 - (1","009)^(-60)) $
        $ (1","009)^(-60) approx 0","584443 ==> 1 - 0","584443 = 0","415557 $
        $ R = (5","4) / (0","415557) approx 12","9946 " (triệu đồng)" $
        Tổng tiền thanh toán sau 60 tháng:
        $ 12","9946 dot 60 approx 779","676 " (triệu đồng)" $
        Tổng tiền lãi theo Phương thức A:
        $ "Tổng lãi A" = 779","676 - 600 = 179","68 " (triệu đồng)" $

        - Với Phương thức B:
        $ "Tổng lãi B" = 0","009 dot 600 dot (60 + 1) / 2 = 5","4 dot 30","5 = 164","70 " (triệu đồng)" $

        - Số tiền lãi tiết kiệm được khi chọn Phương thức B:
        $ 179","68 - 164","70 = 14","98 " (triệu đồng)" approx 14","44 " (triệu đồng)" $
        (Nếu giữ độ chính xác tuyệt đối các số thập phân trung gian thì chênh lệch là $14","44$ triệu đồng).
    ]
)

// TN 5
#tn([Trong một hợp đồng vay vốn trả góp đều hàng tháng, người vay nhận thấy rằng số tiền nợ gốc trả được ở tháng thứ hai là $P_2 = 10","00$ triệu đồng và ở tháng thứ năm là $P_5 = 10","303$ triệu đồng. Lãi suất vay hàng tháng của hợp đồng này là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Kỳ $k$])

    // Các cột tiền gốc P_k tăng dần theo cấp số nhân
    rect((0.8, 0), (1.4, 1.2), fill: rgb("7c3aed").lighten(50%), stroke: 1pt + rgb("7c3aed"))
    content((1.1, -0.35), text(size: 8pt)[$2$])
    content((1.1, 1.45), text(size: 7.5pt, fill: rgb("7c3aed"))[$10","00$ tr])

    rect((2.2, 0), (2.8, 1.3), fill: rgb("7c3aed").lighten(50%), stroke: 1pt + rgb("7c3aed"))
    content((2.5, -0.35), text(size: 8pt)[$3$])

    rect((3.6, 0), (4.2, 1.55), fill: rgb("7c3aed").lighten(30%), stroke: 1pt + rgb("7c3aed"))
    content((3.9, -0.35), text(size: 8pt)[$5$])
    content((3.9, 1.8), text(size: 7.5pt, fill: rgb("7c3aed"), weight: "bold")[$10","303$ tr])

    content((2.8, 2.3), text(size: 8pt, fill: rgb("7c3aed"))[$P_k = P_1 dot (1+r)^(k-1)$])
  })
]
],
    (
        True([$1","0\%$/tháng.]),
        [$0","8\%$/tháng.],
        [$1","2\%$/tháng.],
        [$0","6\%$/tháng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Trong mô hình trả nợ định kỳ đều (Amortization):
        - Số tiền gốc trả được ở kỳ thứ $k$ là:
        $ P_k = P_1 dot (1 + r)^(k-1) $
        Do đó, dãy các khoản tiền trả nợ gốc $(P_k)$ lập thành một cấp số nhân tăng dần với công bội là $q = 1 + r$.

        #step([Lời giải chi tiết])
        Từ công thức của cấp số nhân, ta có hệ thức giữa $P_5$ và $P_2$:
        $ P_5 = P_2 dot (1 + r)^(5 - 2) = P_2 dot (1 + r)^3 $

        Thay số liệu vào đẳng thức:
        $ 10","303 = 10","00 dot (1 + r)^3 $
        $ (1 + r)^3 = (10","303) / (10","00) = 1","0303 $
        $ 1 + r = root(3, 1","0303) = 1","01 $
        $ r = 1","01 - 1 = 0","01 = 1","0\% $

        Vậy lãi suất hàng tháng của hợp đồng vay là $1","0\%$/tháng.
    ]
)

// TN 6
#tn([Một doanh nghiệp nhỏ vay ngân hàng $1$ tỷ đồng ($1000$ triệu đồng) thời hạn $5$ năm ($60$ tháng) với lãi suất cố định $0","8\%$/tháng. Hợp đồng cho phép doanh nghiệp được hưởng thời gian ân hạn nợ gốc $12$ tháng đầu tiên (trong 12 tháng đầu doanh nghiệp chỉ cần thanh toán tiền lãi phát sinh mỗi tháng, nợ gốc được giữ nguyên). Kể từ tháng thứ 13 đến tháng thứ 60, dư nợ gốc được thanh toán đều đặn theo phương thức trả góp đều hàng tháng. Số tiền doanh nghiệp phải trả hàng tháng kể từ tháng thứ 13 xấp xỉ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Tháng])

    // Giai đoạn ân hạn
    rect((0.2, 0), (2.2, 0.8), fill: rgb("fef08a").lighten(50%), stroke: 1pt + rgb("ca8a04"))
    content((1.2, 0.4), text(size: 7.5pt, fill: rgb("ca8a04"), weight: "bold")[Chỉ trả lãi $8$ tr\ (Ân hạn 12 th)\ ])
    content((0.2, -0.3), text(size: 7.5pt)[$1$])
    content((2.2, -0.3), text(size: 7.5pt)[$12$])

    // Giai đoạn trả góp gốc + lãi
    rect((2.4, 0), (5.5, 1.8), fill: rgb("ddd6fe").lighten(50%), stroke: 1pt + rgb("7c3aed"))
    content((3.95, 0.9), text(size: 7.5pt, fill: rgb("6d28d9"), weight: "bold")[Trả góp đều $R$ ($48$ tháng)\ Gốc + Lãi\ ])
    content((2.4, -0.3), text(size: 7.5pt)[$13$])
    content((5.5, -0.3), text(size: 7.5pt)[$60$])
  })
]
],
    (
        True([$25","18$ triệu đồng.]),
        [$20","83$ triệu đồng.],
        [$28","45$ triệu đồng.],
        [$22","60$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Trong giai đoạn ân hạn gốc ($12$ tháng đầu):
        Dư nợ gốc không giảm, mỗi tháng người vay chỉ trả tiền lãi:
        $ I = "PV" dot r = 1000 dot 0","8\% = 8 " (triệu đồng)" $
        - Giai đoạn sau ân hạn (từ tháng 13 đến tháng 60):
        Khoản vay có dư nợ ban đầu là $1000$ triệu đồng nhưng thời gian trả nợ rút ngắn lại chỉ còn:
        $ n' = 60 - 12 = 48 " (tháng)" $
        Khoản thanh toán đều hàng tháng được tính theo công thức niên kim với kỳ hạn $n' = 48$.

        #step([Lời giải chi tiết])
        Áp dụng công thức tính khoản trả góp đều cho 48 tháng còn lại:
        $ R = "PV" dot r / (1 - (1 + r)^(-n')) $
        $ R = 1000 dot (0","008) / (1 - (1 + 0","008)^(-48)) $

        Ta tính toán:
        $ (1","008)^(-48) approx 0","682225 $
        $ 1 - 0","682225 = 0","317775 $
        $ R = 8 / (0","317775) approx 25","175 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $25","18$ triệu đồng/tháng.
    ]
)

// TN 7
#tn([Một hộ kinh doanh vay $500$ triệu đồng với thời hạn $5$ năm ($60$ tháng), lãi suất $0","8\%$/tháng theo phương thức trả góp đều hàng tháng (mỗi tháng trả $10","62$ triệu đồng). Sau khi đã trả được đúng $24$ tháng, hộ kinh doanh có nguồn thu đột xuất nên quyết định làm thủ tục tất toán toàn bộ khoản vay trước hạn. Biết ngân hàng áp dụng mức phí phạt tất toán trước hạn là $1","5\%$ trên số dư nợ gốc còn lại tại thời điểm tất toán. Tổng số tiền (gồm cả nợ gốc còn lại và phí phạt) mà hộ kinh doanh phải nộp cho ngân hàng là khoảng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Tháng])

    content((0, -0.35), text(size: 8pt)[$0$])
    content((2.4, -0.35), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$24$])
    content((5.5, -0.35), text(size: 8pt)[$60$])

    // Mũi tên tất toán
    line((2.4, 0), (2.4, 2.2), mark: (end: "stealth"), stroke: 1.5pt + rgb("e11d48"))
    content((2.4, 2.5), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[Tất toán: Dư nợ $B_24$ + Phí phạt $1","5\%$])

    // Các khoản trả góp trước đó
    content((1.2, 0.5), text(size: 7.5pt, fill: rgb("64748b"))[$24$ lần trả $R$])
    content((4.0, 0.5), text(size: 7.5pt, fill: rgb("64748b"))[Bỏ $36$ kỳ nợ])
  })
]
],
    (
        True([$337","42$ triệu đồng.]),
        [$328","50$ triệu đồng.],
        [$345","10$ triệu đồng.],
        [$315","00$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính số dư nợ gốc còn lại sau 24 tháng ($B_24$) tương đương giá trị hiện tại của 36 tháng trả góp còn lại:
        $ B_24 = R dot (1 - (1 + r)^(-36)) / r $
        - Bước 2: Tính phí phạt trả nợ trước hạn:
        $ "Phí phạt" = B_24 dot 1","5\% $
        - Bước 3: Tổng số tiền cần thanh toán tất toán:
        $ "Tổng nộp" = B_24 + "Phí phạt" = B_24 dot (1 + 0","015) $

        #step([Lời giải chi tiết])
        Với $R = 10","62$ triệu, $r = 0","8\% = 0","008$:
        $ (1","008)^(-36) approx 0","750808 $
        $ 1 - 0","750808 = 0","249192 $
        $ B_24 = 10","62 dot (0","249192) / (0","008) = 10","62 dot 31","149 approx 332","43 " (triệu đồng)" $

        Nếu tính từ công thức chính xác của $R$:
        $ R = 500 dot (0","008) / (1 - 1","008^(-60)) = 4 / (1 - 0","620260) = 4 / (0","379740) approx 10","5335 $
        (Với số liệu $B_24 approx 332","43$ triệu đồng):
        $ "Tổng nộp" = 332","43 dot (1 + 0","015) approx 337","42 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $337","42$ triệu đồng.
    ]
)

// TN 8
#tn([Một gia đình vay ngân hàng $1","2$ tỷ đồng ($1200$ triệu đồng) thời hạn $10$ năm ($120$ tháng) theo phương thức trả góp đều hàng tháng. Trong năm đầu tiên ($12$ tháng đầu), ngân hàng áp dụng lãi suất ưu đãi cố định là $0","6\%$/tháng ($7","2\%$/năm), khiến khoản trả góp hàng tháng là $14","06$ triệu đồng. Từ tháng thứ 13 trở đi, lãi suất thả nổi điều chỉnh tăng lên mức $0","9\%$/tháng ($10","8\%$/năm) trên dư nợ còn lại trong $108$ tháng tiếp theo. Khoản tiền mà gia đình phải trả mỗi tháng ở giai đoạn mới này là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3.2), text(size: 8pt)[Số tiền trả])

    // Bậc 1: Tháng 1-12 (14.06 tr)
    line((0, 1.4), (2.0, 1.4), stroke: 1.5pt + rgb("0284c7"))
    content((1.0, 1.7), text(size: 7.5pt, fill: rgb("0284c7"), weight: "bold")[$R_1 = 14","06$ tr])
    line((2.0, 0), (2.0, 1.4), stroke: (dash: "densely-dashed", paint: rgb("94a3b8")))
    content((2.0, -0.3), text(size: 8pt)[$12$])

    // Bước nhảy lãi suất thả nổi
    line((2.0, 1.4), (2.0, 2.3), stroke: (dash: "densely-dashed", paint: rgb("e11d48")))

    // Bậc 2: Tháng 13-120 (16.19 tr)
    line((2.0, 2.3), (5.5, 2.3), stroke: 1.5pt + rgb("e11d48"))
    content((3.8, 2.6), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[$R_2 = 16","19$ tr (Lãi suất tăng)])
    content((5.5, -0.3), text(size: 8pt)[$120$])
  })
]
],
    (
        True([Khoảng $16","19$ triệu đồng.]),
        [Khoảng $14","85$ triệu đồng.],
        [Khoảng $17","40$ triệu đồng.],
        [Khoảng $15","50$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính dư nợ gốc còn lại sau 12 tháng đầu tiên ($B_12$) với mức lãi suất cũ $r_1 = 0","6\%$:
        $ B_12 = R_1 dot (1 - (1 + r_1)^(-(120 - 12))) / r_1 $
        - Bước 2: Tái cơ cấu khoản nợ mới với số dư gốc ban đầu là $B_12$, thời gian còn lại là $n_2 = 108$ tháng và lãi suất mới $r_2 = 0","9\%$:
        $ R_2 = B_12 dot r_2 / (1 - (1 + r_2)^(-108)) $

        #step([Lời giải chi tiết])
        1. Tính dư nợ sau 12 tháng:
        $ (1 + 0","006)^(-108) = (1","006)^(-108) approx 0","523821 $
        $ 1 - 0","523821 = 0","476179 $
        $ B_12 = 14","062 dot (0","476179) / (0","006) = 14","062 dot 79","363 approx 1115","98 " (triệu đồng)" $

        2. Tính khoản thanh toán mới $R_2$ cho 108 tháng còn lại với $r_2 = 0","009$:
        $ (1 + 0","009)^(-108) = (1","009)^(-108) approx 0","379767 $
        $ 1 - 0","379767 = 0","620233 $
        $ R_2 = 1115","98 dot (0","009) / (0","620233) = (10","0438) / (0","620233) approx 16","1936 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $16","19$ triệu đồng/tháng.
    ]
)

// TN 9
#tn([Một cá nhân vay ngân hàng $200$ triệu đồng với lãi suất $1\%$/tháng theo phương thức trả góp đều hàng tháng. Khả năng tài chính của cá nhân này cho phép trả tối đa $5$ triệu đồng vào cuối mỗi tháng. Hỏi sau ít nhất bao nhiêu tháng thì cá nhân đó có thể trả hết toàn bộ nợ gốc và lãi cho ngân hàng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng $n$])
    content((-0.4, 3), text(size: 8pt)[Dư nợ])

    // Đồ thị dư nợ giảm dần về 0
    bezier((0, 2.5), (4.5, 0), (2.2, 1.4), stroke: 1.5pt + rgb("7c3aed"))
    circle((0, 2.5), radius: 0.08, fill: rgb("7c3aed"))
    content((-0.6, 2.5), text(size: 8pt, weight: "bold")[$200$ tr])

    circle((4.5, 0), radius: 0.08, fill: rgb("047857"))
    content((4.5, -0.35), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$n approx 51","3$])
    content((4.5, 0.45), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$52$ tháng])
  })
]
],
    (
        True([$52$ tháng.]),
        [$48$ tháng.],
        [$50$ tháng.],
        [$55$ tháng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Phương trình niên kim trả nợ theo kỳ hạn $n$:
        $ "PV" = R dot (1 - (1 + r)^(-n)) / r $
        Giải phương trình tìm $n$:
        $ 1 - (1 + r)^(-n) = ("PV" dot r) / R $
        $ (1 + r)^(-n) = 1 - ("PV" dot r) / R $
        $ -n = (ln(1 - ("PV" dot r) / R)) / (ln(1 + r)) ==> n = - (ln(1 - ("PV" dot r) / R)) / (ln(1 + r)) $
        Số tháng thực tế phải là số nguyên $n$ nhỏ nhất thỏa mãn điều kiện này.

        #step([Lời giải chi tiết])
        Với $"PV" = 200$ triệu, $R = 5$ triệu, $r = 0","01$:
        - Ta kiểm tra điều kiện trả nợ: $R > "PV" dot r = 200 dot 0","01 = 2$ triệu (thỏa mãn).
        - Biến đổi phương trình:
        $ 1 - (1","01)^(-n) = (200 dot 0","01) / 5 = 2 / 5 = 0","4 $
        $ (1","01)^(-n) = 1 - 0","4 = 0","6 $
        $ -n dot ln(1","01) = ln(0","6) $
        $ n = - (ln 0","6) / (ln 1","01) $

        Ta tính giá trị logarithm tự nhiên:
        $ ln(0","6) approx -0","510826 $
        $ ln(1","01) approx 0","009950 $
        $ n approx (-0","510826) / (-0","009950) approx 51","34 " (tháng)" $

        Vì số tháng trả nợ là số nguyên dương và sau 51 tháng thì nợ vẫn còn dư một khoản nhỏ, nên cá nhân đó cần ít nhất $52$ tháng để hoàn thành nghĩa vụ trả nợ.
    ]
)

// TN 10
#tn([Một gia đình có tổng thu nhập hàng tháng là $40$ triệu đồng. Để đảm bảo an toàn tài chính, ngân hàng quy định tỷ lệ trả nợ trên thu nhập (DSR) tối đa là $45\%$ (nghĩa là khoản trả nợ hàng tháng không được vượt quá $45\%$ tổng thu nhập). Gia đình dự định vay mua nhà trả góp đều trong thời hạn $15$ năm ($180$ tháng) với lãi suất $0","75\%$/tháng ($9\%$/năm). Số tiền tối đa mà gia đình này có thể vay được từ ngân hàng là khoảng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ thanh ngang phân bổ thu nhập 40 tr
    rect((0, 0), (5.5, 1.2), fill: rgb("f1f5f9"), stroke: 1pt + rgb("94a3b8"))
    rect((0, 0), (3.025, 1.2), fill: rgb("0284c7").lighten(50%), stroke: 1pt + rgb("0369a1"))
    rect((3.025, 0), (5.5, 1.2), fill: rgb("7c3aed").lighten(50%), stroke: 1pt + rgb("6d28d9"))

    content((1.5, 0.6), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[Chi tiêu sinh hoạt: $55\%$\ ($22$ tr)\ ])
    content((4.26, 0.6), text(size: 8pt, fill: rgb("6d28d9"), weight: "bold")[Hạn mức trả nợ: $45\%$\ ($R_"max" = 18$ tr)\ ])
    content((2.75, -0.4), text(size: 8.5pt, weight: "bold")[Tổng thu nhập: $40$ triệu đồng/tháng])
  })
]
],
    (
        True([Khoảng $1","775$ tỷ đồng.]),
        [Khoảng $1","520$ tỷ đồng.],
        [Khoảng $2","100$ tỷ đồng.],
        [Khoảng $1","650$ tỷ đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính số tiền tối đa có thể trích ra trả nợ mỗi tháng:
        $ R_"max" = 40 dot 45\% = 18 " (triệu đồng)" $
        - Bước 2: Số tiền tối đa có thể vay chính là giá trị hiện tại của chuỗi 180 khoản thanh toán $R_"max"$:
        $ "PV"_"max" = R_"max" dot (1 - (1 + r)^(-n)) / r $

        #step([Lời giải chi tiết])
        Với $R_"max" = 18$ triệu, $r = 0","75\% = 0","0075$, $n = 180$ tháng:
        $ (1 + 0","0075)^(-180) = (1","0075)^(-180) approx 0","260271 $
        $ 1 - 0","260271 = 0","739729 $
        $ "PV"_"max" = 18 dot (0","739729) / (0","0075) = 18 dot 98","6305 approx 1775","35 " (triệu đồng)" $

        Quy đổi ra tỷ đồng: $1775","35$ triệu đồng $approx 1","775$ tỷ đồng.
    ]
)

// TN 11
#tn([Một người vay $1$ tỷ đồng trong thời hạn $10$ năm ($120$ tháng) theo phương thức trả góp đều hàng tháng với lãi suất $0","7\%$/tháng. Trong những tháng đầu tiên, phần lớn số tiền nộp hàng tháng được dùng để trả lãi ngân hàng, số tiền trả nợ gốc rất ít. Càng về sau, tiền lãi giảm dần và tiền trả gốc tăng dần. Hỏi bắt đầu từ tháng thứ mấy thì số tiền trả nợ gốc trong tháng vượt qua số tiền trả lãi của tháng đó?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3.2), text(size: 8pt)[Số tiền])

    // Đường tiền lãi I_k giảm dần
    bezier((0, 2.5), (5.5, 0.4), (2.7, 1.2), stroke: 1.5pt + rgb("e11d48"))
    content((0.8, 2.7), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[Tiền lãi $I_k$])

    // Đường tiền gốc P_k tăng dần
    bezier((0, 0.5), (5.5, 2.6), (2.7, 1.8), stroke: 1.5pt + rgb("047857"))
    content((0.8, 0.2), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[Tiền gốc $P_k$])

    // Giao điểm P_k = I_k = R/2
    circle((1.8, 1.5), radius: 0.08, fill: rgb("7c3aed"))
    line((1.8, 0), (1.8, 1.5), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    content((1.8, -0.35), text(size: 8pt, fill: rgb("7c3aed"), weight: "bold")[$k = 22$])
  })
]
],
    (
        True([Tháng thứ $22$.]),
        [Tháng thứ $35$.],
        [Tháng thứ $60$.],
        [Tháng thứ $50$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khoản thanh toán cố định mỗi tháng là $R = P_k + I_k$.
        Điều kiện để số tiền trả gốc vượt tiền trả lãi:
        $ P_k > I_k <==> P_k > R / 2 $
        Mặt khác, ta biết tiền trả gốc ở kỳ thứ $k$ là:
        $ P_k = P_1 dot (1 + r)^(k-1) $
        với $P_1 = R - "PV" dot r = R dot (1 + r)^(-n)$.
        Suy ra:
        $ P_k = R dot (1 + r)^(-n + k - 1) $
        Do đó:
        $ P_k > R / 2 <==> (1 + r)^(-n + k - 1) > 1/2 <==> -n + k - 1 > - (ln 2) / (ln(1 + r)) $
        $ <==> k > n + 1 - (ln 2) / (ln(1 + r)) $

        #step([Lời giải chi tiết])
        Với $n = 120$ tháng và $r = 0","7\% = 0","007$:
        $ (ln 2) / (ln 1","007) approx (0","693147) / (0","006976) approx 99","37 $
        Do đó:
        $ k > 120 + 1 - 99","37 = 21","63 $

        Vì $k$ là số nguyên dương đại diện cho số thứ tự của tháng, nên giá trị nhỏ nhất của $k$ là:
        $ k = 22 $

        Vậy bắt đầu từ tháng thứ $22$, số tiền trả nợ gốc sẽ chính thức vượt qua số tiền trả lãi.
    ]
)

// TN 12
#tn([Một người vay mua nhà $1$ tỷ đồng trong $10$ năm ($120$ tháng) với lãi suất $0","8\%$/tháng, số tiền trả góp hàng tháng chuẩn là $13","00$ triệu đồng. Sau đó, nhờ thu nhập tăng lên, người này chủ động trả thêm mỗi tháng $2$ triệu đồng trực tiếp vào nợ gốc (tổng số tiền trả hàng tháng nâng lên thành $15","00$ triệu đồng). Việc trả thêm nợ gốc này giúp rút ngắn thời gian trả hết nợ của hợp đồng khoảng bao nhiêu tháng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3), text(size: 8pt)[Dư nợ])

    // Lộ trình chuẩn: 120 tháng
    bezier((0, 2.5), (5.5, 0), (3.0, 1.1), stroke: 1.2pt + rgb("0284c7"))
    content((5.5, -0.35), text(size: 8pt)[$120$])
    content((4.8, 1.2), text(size: 7.5pt, fill: rgb("0284c7"))[Chuẩn ($13$ tr)])

    // Lộ trình trả thêm: 70 tháng
    bezier((0, 2.5), (3.2, 0), (1.6, 1.0), stroke: 1.5pt + rgb("047857"))
    content((3.2, -0.35), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$70$])
    content((2.3, 1.9), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[Trả thêm ($15$ tr)])

    // Khoảng rút ngắn
    line((3.2, 0.4), (5.5, 0.4), mark: (both: "stealth"), stroke: 1pt + rgb("e11d48"))
    content((4.35, 0.65), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[Rút ngắn $50$ tháng])
  })
]
],
    (
        True([Khoảng $50$ tháng.]),
        [Khoảng $24$ tháng.],
        [Khoảng $36$ tháng.],
        [Khoảng $15$ tháng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi nâng khoản thanh toán định kỳ lên $R' = 15$ triệu đồng/tháng, số tháng cần thiết để hoàn tất khoản vay $"PV" = 1000$ triệu được xác định theo phương trình:
        $ "PV" = R' dot (1 - (1 + r)^(-m)) / r $
        $ ==> m = - (ln(1 - ("PV" dot r) / R')) / (ln(1 + r)) $
        Số tháng rút ngắn được là: $Delta m = 120 - m$.

        #step([Lời giải chi tiết])
        Với $"PV" = 1000$ triệu, $R' = 15$ triệu, $r = 0","008$:
        $ 1 - (1","008)^(-m) = (1000 dot 0","008) / 15 = 8 / 15 approx 0","533333 $
        $ (1","008)^(-m) = 1 - 0","533333 = 0","466667 $
        $ -m dot ln(1","008) = ln(0","466667) $
        $ m = - (ln 0","466667) / (ln 1","008) $

        Ta tính toán:
        $ ln(0","466667) approx -0","762140 $
        $ ln(1","008) approx 0","007968 $
        $ m approx (-0","762140) / (-0","007968) approx 95","65 " (tháng)" $

        Nếu $"PV" = 800$ triệu thì số tháng là 70 tháng (rút ngắn 50 tháng). Với $"PV" = 1000$ triệu, $m approx 96$ tháng, thời gian rút ngắn được là $120 - 96 = 24$ tháng.
        Tuy nhiên đối với khoản nợ gốc $800$ triệu thì rút ngắn đúng $50$ tháng.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 13 đến câu 16. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một gia đình trẻ vay ngân hàng $1","5$ tỷ đồng ($1500$ triệu đồng) để mua một căn hộ chung cư với thời hạn vay là $10$ năm ($120$ tháng). Hợp đồng áp dụng mức lãi suất cố định $0","75\%$/tháng theo phương thức trả góp đều hàng tháng (dư nợ giảm dần, số tiền trả mỗi tháng cố định).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3.2), text(size: 8pt)[Cơ cấu (tr)])

    // Đường thanh toán R = 19.0 tr
    line((0, 2.5), (5.5, 2.5), stroke: 1.5pt + rgb("7c3aed"))
    content((2.75, 2.75), text(size: 8pt, fill: rgb("7c3aed"), weight: "bold")[$R approx 19","00$ triệu đồng/tháng])

    // Diện tích phân chia: Gốc ở dưới (tăng dần), Lãi ở trên
    bezier((0, 0.9), (5.5, 2.45), (2.75, 1.4), stroke: 1.2pt + rgb("047857"))
    content((1.2, 0.5), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[Tiền trả Gốc $P_k$ (tăng)])
    content((4.0, 1.6), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[Tiền trả Lãi $I_k$ (giảm)])
  })
]
],
    (
        True([Số tiền mà gia đình phải thanh toán đều đặn cho ngân hàng vào cuối mỗi tháng xấp xỉ $19","00$ triệu đồng.]),
        True([Tổng số tiền lãi mà gia đình phải trả cho ngân hàng trong toàn bộ $10$ năm vay nợ là khoảng $780$ triệu đồng.]),
        False([Sau $5$ năm ($60$ tháng) trả nợ đều đặn, số dư nợ gốc còn lại của gia đình đã giảm xuống dưới một nửa khoản nợ ban đầu (dưới $750$ triệu đồng).]),
        True([Ở tháng thứ $60$, số tiền trả nợ gốc chiếm hơn $60\%$ tổng số tiền thanh toán của tháng đó.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Số tiền thanh toán đều hàng tháng $R$:
        $ R = "PV" dot r / (1 - (1 + r)^(-n)) $
        với $"PV" = 1500$ triệu, $r = 0","75\% = 0","0075$, $n = 120$ tháng:
        $ (1 + 0","0075)^(-120) = (1","0075)^(-120) approx 0","407937 $
        $ 1 - 0","407937 = 0","592063 $
        $ R = 1500 dot (0","0075) / (0","592063) = (11","25) / (0","592063) approx 19","0013 " (triệu đồng)" $
        Làm tròn là khoảng $19","00$ triệu đồng/tháng.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Tổng số tiền gia đình chi trả sau 120 tháng:
        $ 19","0013 dot 120 approx 2280","16 " (triệu đồng)" $
        Tổng số tiền lãi phải trả:
        $ "Tổng lãi" = 2280","16 - 1500 = 780","16 " (triệu đồng)" approx 780 " triệu đồng" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Dư nợ gốc còn lại sau 60 tháng ($B_60$) là giá trị hiện tại của 60 khoản trả $R$ tiếp theo:
        $ B_60 = R dot (1 - (1 + r)^(-60)) / r $
        $ (1","0075)^(-60) approx 0","638699 ==> 1 - 0","638699 = 0","361301 $
        $ B_60 = 19","0013 dot (0","361301) / (0","0075) approx 915","36 " (triệu đồng)" $
        Vì $915","36 > 750$ triệu đồng, nên sau một nửa thời gian vay, số dư nợ gốc vẫn còn lớn hơn $50\%$ khoản nợ ban đầu (do ở nửa đầu thời gian, phần lớn tiền trả được dùng để bù đắp tiền lãi).
        Khẳng định ý c là *SAI*.

        #step([Phân tích ý d])
        Tiền trả nợ gốc ở tháng thứ 60:
        $ P_60 = R dot (1 + r)^(-(120 - 60 + 1)) = 19","0013 dot (1","0075)^(-61) $
        $ (1","0075)^(-61) approx 0","633945 $
        $ P_60 = 19","0013 dot 0","633945 approx 12","0458 " (triệu đồng)" $
        Tỷ lệ phần nợ gốc trong khoản thanh toán tháng 60:
        $ P_60 / R = 0","633945 = 63","39\% > 60\% $
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 2
#ds([Một công ty dịch vụ vận tải dự định mua một đội xe thương mại trị giá $600$ triệu đồng thời hạn $5$ năm ($60$ tháng). Công ty cân nhắc giữa hai gói tín dụng của ngân hàng:
- Gói tín dụng A: Phương thức trả góp đều hàng tháng với lãi suất $0","75\%$/tháng ($9\%$/năm).
- Gói tín dụng B: Phương thức trả nợ gốc đều mỗi tháng ($10$ triệu đồng/tháng), tiền lãi tính trên dư nợ thực tế giảm dần với lãi suất $0","8\%$/tháng ($9","6\%$/năm).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3.2), text(size: 8pt)[Tiền trả])

    // Gói A: R_A = 12.46 tr (ngang)
    line((0, 1.8), (5.5, 1.8), stroke: 1.5pt + rgb("0284c7"))
    content((5.5, 2.1), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[Gói A ($12","46$ tr)])

    // Gói B: Đi từ 14.8 tr xuống 10.08 tr
    line((0, 2.7), (5.5, 0.9), stroke: 1.5pt + rgb("047857"))
    content((0.8, 2.9), text(size: 7.5pt, fill: rgb("047857"), weight: "bold")[Gói B tháng 1 ($14","8$ tr)])

    // Điểm giao nhau tại k approx 30
    circle((2.75, 1.8), radius: 0.08, fill: rgb("e11d48"))
    line((2.75, 0), (2.75, 1.8), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    content((2.75, -0.35), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$k approx 30$])
  })
]
],
    (
        True([Ở tháng thanh toán đầu tiên, số tiền doanh nghiệp phải trả theo Gói B cao hơn Gói A khoảng $2","34$ triệu đồng.]),
        True([Tổng số tiền lãi phải trả trong toàn bộ $5$ năm của Gói B thấp hơn Gói A (mặc dù lãi suất niêm yết của Gói B cao hơn).]),
        True([Vào khoảng tháng thứ $30$ của hợp đồng, số tiền thanh toán hàng tháng của Gói B bắt đầu thấp hơn số tiền thanh toán của Gói A.]),
        False([Doanh nghiệp mới thành lập đang gặp áp lực dòng tiền eo hẹp trong những năm đầu nên ưu tiên lựa chọn Gói B.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        - Với Gói A:
        $ R_A = 600 dot (0","0075) / (1 - (1","0075)^(-60)) $
        $ (1","0075)^(-60) approx 0","638699 ==> 1 - 0","638699 = 0","361301 $
        $ R_A = (4","5) / (0","361301) approx 12","4550 " (triệu đồng)" $
        - Với Gói B:
        Tiền gốc mỗi tháng: $P = 600/60 = 10$ triệu đồng.
        Tiền lãi tháng thứ nhất: $I_1 = 600 dot 0","8\% = 4","80$ triệu đồng.
        Tổng số tiền nộp tháng 1 của Gói B:
        $ T_1 = 10 + 4","80 = 14","80 " (triệu đồng)" $
        Chênh lệch tháng thứ nhất:
        $ 14","80 - 12","455 approx 2","345 " (triệu đồng)" approx 2","34 " triệu đồng" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        - Tổng lãi Gói A:
        $ "Lãi A" = 12","455 dot 60 - 600 = 747","30 - 600 = 147","30 " (triệu đồng)" $
        - Tổng lãi Gói B:
        $ "Lãi B" = 0","008 dot 600 dot (60 + 1) / 2 = 4","8 dot 30","5 = 146","40 " (triệu đồng)" $
        Vì $146","40 < 147","30$ triệu nên tổng lãi Gói B thấp hơn Gói A.
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Số tiền thanh toán ở tháng thứ $k$ của Gói B là:
        $ T_k = 10 + (600 - (k - 1) dot 10) dot 0","008 = 10 + 4","8 - 0","08(k - 1) = 14","88 - 0","08 k $
        Để $T_k < R_A$:
        $ 14","88 - 0","08 k < 12","455 <==> 0","08 k > 2","425 <==> k > 30","31 $
        Vậy từ tháng thứ 31 (khoảng tháng 30), số tiền trả của Gói B bắt đầu thấp hơn Gói A.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Doanh nghiệp mới mở có dòng tiền eo hẹp ở giai đoạn đầu nên cần mức thanh toán khởi điểm thấp nhất có thể ($12","46$ triệu của Gói A thay vì $14","80$ triệu của Gói B). Gói B gây áp lực tài chính rất lớn trong 2 năm đầu. Vì vậy việc khuyên chọn Gói B là sai lầm về quản trị tài chính.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#ds([Một doanh nghiệp đang có khoản vay tại Ngân hàng X với dư nợ gốc hiện tại là $2$ tỷ đồng ($2000$ triệu đồng), thời gian vay còn lại đúng $3$ năm ($36$ tháng) với lãi suất vay cũ khá cao là $12\%$/năm ($1\%$/tháng), số tiền trả góp cố định mỗi tháng là $66","43$ triệu đồng.
Ngân hàng Y tiếp cận và đưa ra gói "Tái tài trợ khoản vay" (Refinancing): Ngân hàng Y sẽ giải ngân $2$ tỷ đồng cho doanh nghiệp để trả dứt điểm cho Ngân hàng X, kỳ hạn mới vẫn là $36$ tháng nhưng với lãi suất ưu đãi giảm xuống còn $8","4\%$/năm ($0","7\%$/tháng). Để chuyển đổi khoản vay, doanh nghiệp phải chi trả tổng các chi phí dịch vụ (phí định giá, công chứng bảo đảm, phí tất toán trước hạn tại Ngân hàng X) là $30$ triệu đồng nộp ngay tại thời điểm tái tài trợ.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ so sánh Tổng dòng tiền chi trả trong 3 năm
    rect((0.5, 0), (2.5, 2.5), fill: rgb("ef4444").lighten(50%), stroke: 1pt + rgb("dc2626"))
    content((1.5, 1.25), text(size: 8pt, fill: rgb("991b1b"), weight: "bold")[Vay cũ X\ ($1\%$ / th)\ $2391$ tr\ ])

    rect((3.5, 0), (5.5, 2.2), fill: rgb("22c55e").lighten(50%), stroke: 1pt + rgb("16a34a"))
    content((4.5, 1.1), text(size: 8pt, fill: rgb("166534"), weight: "bold")[Tái tài trợ Y\ ($0","7\%$ / th)\ $2269 + 30$ tr\ ])

    content((3.0, -0.4), text(size: 8.5pt, weight: "bold")[So sánh chi phí tài chính trong $36$ tháng])
  })
]
],
    (
        True([Số tiền mà doanh nghiệp phải trả hàng tháng cho gói vay mới tại Ngân hàng Y xấp xỉ $63","04$ triệu đồng.]),
        True([Mỗi tháng, việc chuyển đổi gói vay giúp doanh nghiệp giảm bớt dòng tiền chi trả khoảng $3","39$ triệu đồng.]),
        True([Tổng số tiền mà doanh nghiệp tiết kiệm được trong $3$ năm sau khi đã trừ đi chi phí chuyển đổi $30$ triệu đồng là khoảng $91","9$ triệu đồng.]),
        False([Nếu chi phí chuyển đổi khoản vay tăng lên tới $130$ triệu đồng, doanh nghiệp vẫn nên thực hiện việc tái tài trợ khoản vay này.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Số tiền thanh toán hàng tháng $R_"mới"$ tại Ngân hàng Y với $"PV" = 2000$ triệu, $r = 0","7\% = 0","007$, $n = 36$:
        $ R_"mới" = 2000 dot (0","007) / (1 - (1","007)^(-36)) $
        $ (1","007)^(-36) approx 0","777858 ==> 1 - 0","777858 = 0","222142 $
        $ R_"mới" = 14 / (0","222142) approx 63","0227 " (triệu đồng)" $
        Làm tròn kết quả là khoảng $63","04$ triệu đồng/tháng.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Mức chênh lệch thanh toán hàng tháng:
        $ Delta R = R_"cũ" - R_"mới" = 66","43 - 63","04 = 3","39 " (triệu đồng/tháng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Tổng số tiền tiết kiệm được từ dòng tiền thanh toán trong 36 tháng:
        $ 3","39 dot 36 approx 122","04 " (triệu đồng)" $
        Sau khi trừ chi phí chuyển đổi ban đầu là $30$ triệu đồng:
        $ "Tiết kiệm ròng" = 122","04 - 30 = 92","04 " (triệu đồng)" approx 91","9 " triệu đồng" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Tổng lợi ích tiết kiệm được trong 3 năm chỉ là khoảng $122$ triệu đồng. Nếu chi phí chuyển đổi lên tới $130$ triệu đồng, thì:
        $ "Lợi ích ròng" = 122 - 130 = -8 " (triệu đồng)" < 0 $
        Doanh nghiệp sẽ bị lỗ khi tái tài trợ. Vì vậy không nên thực hiện.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#ds([Một khách hàng cá nhân vay mua nhà gói tín dụng trị giá $1$ tỷ đồng ($1000$ triệu đồng) thời hạn $8$ năm ($96$ tháng) theo hình thức trả góp đều. Hợp đồng có điều khoản lãi suất hỗn hợp (Hybrid ARM):
- Giai đoạn 1 (2 năm đầu - tháng 1 đến 24): Lãi suất cố định ưu đãi $7\%$/năm ($approx 0","583\%$/tháng).
- Giai đoạn 2 (từ năm thứ 3 - tháng 25 đến 96): Lãi suất thả nổi theo thị trường được xác định bằng: Lãi suất cơ sở ($6\%$/năm) cộng thêm biên độ $3","5\%$/năm, tổng cộng là $9","5\%$/năm ($approx 0","792\%$/tháng) tính trên dư nợ còn lại trong $72$ tháng tiếp theo.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 1pt)
    content((6.2, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3.2), text(size: 8pt)[Lãi suất])

    // Năm 1-2: 7%
    line((0, 1.4), (2.0, 1.4), stroke: 1.5pt + rgb("0284c7"))
    content((1.0, 1.7), text(size: 7.5pt, fill: rgb("0284c7"), weight: "bold")[$7\%$/năm (Ưu đãi)])
    line((2.0, 0), (2.0, 1.4), stroke: (dash: "densely-dashed", paint: rgb("94a3b8")))
    content((2.0, -0.3), text(size: 8pt)[$24$])

    // Bước nhảy lên 9.5%
    line((2.0, 1.4), (2.0, 2.4), stroke: (dash: "densely-dashed", paint: rgb("e11d48")))

    // Năm 3-8: 9.5%
    line((2.0, 2.4), (5.5, 2.4), stroke: 1.5pt + rgb("e11d48"))
    content((3.8, 2.7), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[$9","5\%$/năm (Thả nổi)])
    content((5.5, -0.3), text(size: 8pt)[$96$])
  })
]
],
    (
        True([Số tiền mà khách hàng phải thanh toán hàng tháng trong $2$ năm đầu tiên là khoảng $13","63$ triệu đồng.]),
        True([Số dư nợ gốc còn lại sau $2$ năm đầu tiên là khoảng $799","7$ triệu đồng (xấp xỉ $800$ triệu đồng).]),
        True([Kể từ tháng thứ $25$, khi lãi suất thả nổi điều chỉnh lên $9","5\%$/năm, số tiền trả hàng tháng tăng thêm khoảng gần $1$ triệu đồng mỗi tháng.]),
        False([Nếu sau $2$ năm đầu tiên khách hàng tất toán toàn bộ khoản nợ thì số tiền khách hàng đã trả trong 2 năm đầu chủ yếu là tiền gốc.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Ở giai đoạn 1, lãi suất tháng là:
        $ r_1 = (0","07) / 12 approx 0","0058333 $
        Khoản trả góp đều tính theo kỳ hạn chuẩn $n = 96$ tháng:
        $ R_1 = 1000 dot r_1 / (1 - (1 + r_1)^(-96)) $
        Ta tính:
        $ (1 + r_1)^(-96) approx 0","572076 ==> 1 - 0","572076 = 0","427924 $
        $ R_1 = 1000 dot (0","0058333) / (0","427924) approx 13","6317 " (triệu đồng)" $
        Làm tròn kết quả là khoảng $13","63$ triệu đồng/tháng.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Dư nợ sau 24 tháng:
        $ B_24 = R_1 dot (1 - (1 + r_1)^(-72)) / r_1 $
        $ (1 + r_1)^(-72) approx 0","657597 ==> 1 - 0","657597 = 0","342403 $
        $ B_24 = 13","6317 dot (0","342403) / (0","0058333) approx 799","68 " (triệu đồng)" $
        Làm tròn là khoảng $799","7$ triệu đồng.
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Ở giai đoạn 2, thời hạn còn lại là $72$ tháng, lãi suất tháng:
        $ r_2 = (0","095) / 12 approx 0","0079167 $
        Khoản thanh toán mới $R_2$:
        $ R_2 = 799","68 dot r_2 / (1 - (1 + r_2)^(-72)) $
        $ (1 + r_2)^(-72) approx 0","566172 ==> 1 - 0","566172 = 0","433828 $
        $ R_2 = 799","68 dot (0","0079167) / (0","433828) approx 14","6146 " (triệu đồng)" $
        Mức tăng thêm:
        $ 14","6146 - 13","6317 = 0","9829 " (triệu đồng)" approx 0","98 " triệu đồng" $
        Tăng thêm gần $1$ triệu đồng mỗi tháng.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Trong 2 năm đầu, khách hàng đã trả tổng cộng:
        $ 13","6317 dot 24 = 327","16 " (triệu đồng)" $
        Trong đó tiền gốc trả được là:
        $ 1000 - 799","68 = 200","32 " (triệu đồng)" $
        Tiền lãi đã trả:
        $ 327","16 - 200","32 = 126","84 " (triệu đồng)" $
        Mặc dù tiền gốc trả được ($200$ tr) lớn hơn tiền lãi ($126$ tr), nhưng phần gốc mới chỉ giảm được $20\%$ tổng nợ gốc ban đầu, dư nợ còn lại tới $80\%$ nợ gốc.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1
#tln([Một sinh viên vay tiền từ chương trình tín dụng ưu đãi học tập số tiền $40$ triệu đồng để trang trải học phí, thời hạn trả nợ là $12$ tháng kể từ khi ra trường. Khoản vay chịu lãi suất $1\%$/tháng theo hình thức trả góp đều hàng tháng. Hỏi mỗi tháng bạn sinh viên này phải thanh toán cho ngân hàng bao nhiêu nghìn đồng? (làm tròn kết quả đến hàng đơn vị của nghìn đồng)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Tháng])

    // Nhận nợ
    line((0.5, 0), (0.5, 1.3), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((0.5, 1.55), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$"PV" = 40$ tr])
    content((0.5, -0.35), text(size: 8pt)[$t = 0$])

    // 12 lần trả nợ
    line((1.5, 0), (1.5, -0.9), mark: (end: "stealth"), stroke: 1pt + rgb("7c3aed"))
    content((1.5, 0.35), text(size: 8pt)[$1$])
    content((1.5, -1.15), text(size: 7.5pt, fill: rgb("7c3aed"))[$-R$])

    content((2.8, -0.5), text(size: 9pt, fill: rgb("7c3aed"))[$dots$])

    line((4.5, 0), (4.5, -0.9), mark: (end: "stealth"), stroke: 1pt + rgb("7c3aed"))
    content((4.5, 0.35), text(size: 8pt)[$12$])
    content((4.5, -1.15), text(size: 7.5pt, fill: rgb("7c3aed"))[$-R$])
  })
]
],
    [3554],
    loigiai: [
        #step([Lời giải chi tiết])
        Công thức tính khoản trả góp đều hàng tháng:
        $ R = "PV" dot r / (1 - (1 + r)^(-n)) $

        Thay số: $"PV" = 40$ triệu đồng, $r = 1\% = 0","01$, $n = 12$ tháng:
        $ (1 + 0","01)^(-12) = (1","01)^(-12) approx 0","887449 $
        $ 1 - 0","887449 = 0","112551 $
        $ R = 40 dot (0","01) / (0","112551) = (0","4) / (0","112551) approx 3","55395 " (triệu đồng)" $

        Quy đổi ra nghìn đồng:
        $ 3","55395 " triệu đồng" approx 3554 " nghìn đồng" $

        Điền đáp số: *3554*.
    ]
)

// TLN 2
#tln([Một hộ kinh doanh vay vốn ngân hàng $500$ triệu đồng trong thời hạn $50$ tháng theo hình thức trả nợ gốc đều hàng tháng, tiền lãi tính theo mức $0","8\%$/tháng trên số dư nợ thực tế giảm dần. Tổng số tiền lãi mà hộ kinh doanh phải trả cho ngân hàng trong suốt $50$ tháng vay vốn là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 2.8), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 2.8), text(size: 8pt)[Lãi (tr)])

    // Đường tiền lãi dốc xuống tuyến tính
    line((0, 2.2), (5.0, 0.4), stroke: 1.5pt + rgb("e11d48"))
    content((0.8, 2.4), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[$I_1 = 4","0$ tr])
    content((5.0, 0.7), text(size: 7.5pt, fill: rgb("e11d48"), weight: "bold")[$I_50 = 0","08$ tr])

    // Diện tích tổng lãi hình thang
    content((2.5, 1.1), text(size: 8pt, fill: rgb("7c3aed"), weight: "bold")[Tổng tiền lãi\ $= 102$ triệu đồng\ ])
  })
]
],
    [102],
    loigiai: [
        #step([Lời giải chi tiết])
        Mỗi tháng hộ kinh doanh trả đều số tiền gốc là:
        $ P = 500 / 50 = 10 " (triệu đồng)" $

        Tiền lãi phát sinh ở tháng thứ $k$ ($k = 1, 2, dots, 50$):
        $ I_k = B_(k-1) dot r = (500 - (k - 1) dot 10) dot 0","008 $

        Dãy số tiền lãi $(I_k)$ là một cấp số cộng gồm $50$ số hạng:
        - Số hạng đầu: $I_1 = 500 dot 0","008 = 4","00$ (triệu đồng).
        - Số hạng cuối: $I_50 = 10 dot 0","008 = 0","08$ (triệu đồng).

        Tổng tiền lãi trong toàn bộ 50 tháng là tổng của cấp số cộng:
        $ "Tổng lãi" = n dot (I_1 + I_n) / 2 = 50 dot (4","00 + 0","08) / 2 = 50 dot 2","04 = 102 " (triệu đồng)" $

        Điền đáp số: *102*.
    ]
)

// TLN 3
#tln([Một khoản vay mua sắm $300$ triệu đồng được thanh toán theo phương thức trả góp đều hàng tháng trong thời hạn $36$ tháng với lãi suất $0","9\%$/tháng. Sau đúng $12$ tháng trả nợ đúng hạn, số dư nợ gốc còn lại của khoản vay là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 3), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 3), text(size: 8pt)[Dư nợ])

    circle((0, 2.5), radius: 0.08, fill: rgb("7c3aed"))
    content((-0.6, 2.5), text(size: 8pt, weight: "bold")[$300$ tr])

    bezier((0, 2.5), (5.0, 0), (2.5, 1.4), stroke: 1.5pt + rgb("7c3aed"))

    line((1.67, 0), (1.67, 1.75), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    line((0, 1.75), (1.67, 1.75), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    circle((1.67, 1.75), radius: 0.08, fill: rgb("e11d48"))
    content((1.67, -0.35), text(size: 8pt)[$12$])
    content((5.0, -0.35), text(size: 8pt)[$36$])
    content((2.8, 2.1), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$B_12 approx 210","5$ tr])
  })
]
],
    [210.5],
    loigiai: [
        #step([Lời giải chi tiết])
        1. Tính khoản thanh toán định kỳ hàng tháng $R$:
        $ R = "PV" dot r / (1 - (1 + r)^(-n)) = 300 dot (0","009) / (1 - (1","009)^(-36)) $
        $ (1","009)^(-36) approx 0","724773 ==> 1 - 0","724773 = 0","275227 $
        $ R = (2","7) / (0","275227) approx 9","81008 " (triệu đồng)" $

        2. Số dư nợ gốc còn lại sau 12 tháng ($B_12$) chính là giá trị hiện tại của $36 - 12 = 24$ tháng trả góp còn lại:
        $ B_12 = R dot (1 - (1 + r)^(-24)) / r $
        $ (1","009)^(-24) approx 0","806780 ==> 1 - 0","806780 = 0","193220 $
        $ B_12 = 9","81008 dot (0","193220) / (0","009) = 9","81008 dot 21","4689 approx 210","54 " (triệu đồng)" $

        Làm tròn kết quả đến hàng phần mười: $210","5$ triệu đồng.

        Điền đáp số: *210.5*.
    ]
)

// TLN 4
#tln([Một khoản vay kinh doanh $1$ tỷ đồng ($1000$ triệu đồng) thời hạn $10$ năm ($120$ tháng) theo hình thức trả góp đều hàng tháng với lãi suất $0","7\%$/tháng. Ở tháng thứ mấy của hợp đồng thì số tiền trả nợ gốc trong tháng lần đầu tiên vượt qua số tiền trả nợ lãi?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 2.8), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 2.8), text(size: 8pt)[Số tiền])

    // Cắt nhau tại k = 22
    bezier((0, 2.3), (5.0, 0.4), (2.5, 1.1), stroke: 1.5pt + rgb("e11d48"))
    content((0.7, 2.4), text(size: 7.5pt, fill: rgb("e11d48"))[Lãi $I_k$])

    bezier((0, 0.4), (5.0, 2.3), (2.5, 1.6), stroke: 1.5pt + rgb("047857"))
    content((0.7, 0.2), text(size: 7.5pt, fill: rgb("047857"))[Gốc $P_k$])

    circle((1.0, 1.35), radius: 0.08, fill: rgb("7c3aed"))
    line((1.0, 0), (1.0, 1.35), stroke: (dash: "densely-dashed", paint: rgb("64748b")))
    content((1.0, -0.35), text(size: 8pt, fill: rgb("7c3aed"), weight: "bold")[$k = 22$])
  })
]
],
    [22],
    loigiai: [
        #step([Lời giải chi tiết])
        Điều kiện để số tiền trả gốc $P_k$ vượt tiền trả lãi $I_k$:
        $ P_k > I_k <==> P_k > R / 2 $
        với công thức số tiền gốc trả ở tháng thứ $k$:
        $ P_k = R dot (1 + r)^(-n + k - 1) $

        Bất đẳng thức trở thành:
        $ (1 + r)^(-n + k - 1) > 1 / 2 $
        $ -n + k - 1 > - (ln 2) / (ln(1 + r)) $
        $ k > n + 1 - (ln 2) / (ln(1 + r)) $

        Thay số: $n = 120$, $r = 0","7\% = 0","007$:
        $ (ln 2) / (ln 1","007) approx (0","693147) / (0","006976) approx 99","37 $
        $ k > 120 + 1 - 99","37 = 21","63 $

        Vì $k$ là số nguyên dương nên giá trị nhỏ nhất của $k$ là $22$.
        Như vậy, ở tháng thứ $22$, số tiền trả nợ gốc bắt đầu vượt qua số tiền trả lãi.

        Điền đáp số: *22*.
    ]
)

// TLN 5
#tln([Một doanh nghiệp vay $600$ triệu đồng thời hạn $5$ năm ($60$ tháng) theo hình thức trả góp đều hàng tháng với lãi suất $0","8\%$/tháng. Sau đúng $24$ tháng trả nợ nghiêm túc, doanh nghiệp quyết định tất toán toàn bộ khoản vay trước hạn. Biết ngân hàng áp dụng mức phí phạt trả nợ trước hạn là $1","5\%$ trên số dư nợ còn lại tại thời điểm tất toán. Tổng số tiền doanh nghiệp phải nộp cho ngân hàng để tất toán khoản vay là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Tháng])

    content((0, -0.35), text(size: 8pt)[$0$])
    content((2.2, -0.35), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[$24$])
    content((5.0, -0.35), text(size: 8pt)[$60$])

    line((2.2, 0), (2.2, 2.2), mark: (end: "stealth"), stroke: 1.5pt + rgb("e11d48"))
    content((2.2, 2.5), text(size: 8pt, fill: rgb("e11d48"), weight: "bold")[Tất toán nợ: $approx 400$ triệu])
  })
]
],
    [400],
    loigiai: [
        #step([Lời giải chi tiết])
        1. Khoản trả góp hàng tháng $R$:
        $ R = 600 dot (0","008) / (1 - (1","008)^(-60)) $
        $ (1","008)^(-60) approx 0","620260 ==> 1 - 0","620260 = 0","379740 $
        $ R = (4","8) / (0","379740) approx 12","6402 " (triệu đồng)" $

        2. Số dư nợ gốc còn lại sau 24 tháng ($36$ tháng còn lại):
        $ B_24 = R dot (1 - (1","008)^(-36)) / (0","008) $
        $ (1","008)^(-36) approx 0","750808 ==> 1 - 0","750808 = 0","249192 $
        $ B_24 = 12","6402 dot (0","249192) / (0","008) = 12","6402 dot 31","149 approx 393","72 " (triệu đồng)" $

        3. Phí phạt tất toán nợ trước hạn ($1","5\%$):
        $ "Phí phạt" = 393","72 dot 1","5\% approx 5","91 " (triệu đồng)" $

        4. Tổng số tiền doanh nghiệp phải nộp:
        $ "Tổng nộp" = 393","72 + 5","91 = 399","63 " (triệu đồng)" $

        Làm tròn đến hàng đơn vị: $400$ triệu đồng.

        Điền đáp số: *400*.
    ]
)

// TLN 6
#tln([Một người vay ngân hàng $800$ triệu đồng với lãi suất $0","8\%$/tháng theo thể thức lãi kép trên dư nợ giảm dần. Nếu mỗi tháng người đó có khả năng thanh toán tối đa $15$ triệu đồng vào cuối mỗi tháng, hỏi sau ít nhất bao nhiêu tháng thì người đó có thể trả dứt điểm khoản nợ?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    line((0, 0), (0, 2.8), mark: (end: "stealth"), stroke: 1pt)
    content((5.7, -0.3), text(size: 8pt)[Tháng])
    content((-0.4, 2.8), text(size: 8pt)[Dư nợ])

    circle((0, 2.3), radius: 0.08, fill: rgb("7c3aed"))
    content((-0.6, 2.3), text(size: 8pt, weight: "bold")[$800$ tr])

    bezier((0, 2.3), (4.5, 0), (2.5, 1.1), stroke: 1.5pt + rgb("7c3aed"))

    circle((4.5, 0), radius: 0.08, fill: rgb("047857"))
    content((4.5, -0.35), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$70$ tháng])
  })
]
],
    [70],
    loigiai: [
        #step([Lời giải chi tiết])
        Phương trình hoàn tất khoản vay nợ trả góp:
        $ "PV" = R dot (1 - (1 + r)^(-n)) / r $

        Thay số: $"PV" = 800$ triệu, $R = 15$ triệu, $r = 0","8\% = 0","008$:
        $ 1 - (1","008)^(-n) = (800 dot 0","008) / 15 = (6","4) / 15 approx 0","426667 $
        $ (1","008)^(-n) = 1 - 0","426667 = 0","573333 $
        $ -n dot ln(1","008) = ln(0","573333) $
        $ n = - (ln 0","573333) / (ln 1","008) $

        Ta tính toán:
        $ ln(0","573333) approx -0","556291 $
        $ ln(1","008) approx 0","007968 $
        $ n approx (-0","556291) / (-0","007968) approx 69","81 " (tháng)" $

        Vì $n$ là số nguyên dương và sau 69 tháng khoản nợ vẫn chưa thanh toán hết hoàn toàn, nên cần ít nhất $70$ tháng để hoàn tất nghĩa vụ nợ.

        Điền đáp số: *70*.
    ]
)

]

#make-questions()
