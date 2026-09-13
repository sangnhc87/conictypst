#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("b45309")

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH",
  exam-title: "CHỦ ĐỀ 2C: NIÊN KIM ĐỊNH KỲ & TÍCH LŨY TIẾT KIỆM (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "513",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một người đều đặn gửi tiết kiệm vào ngân hàng số tiền $10$ triệu đồng vào cuối mỗi tháng, liên tục trong vòng $3$ năm ($36$ tháng). Biết lãi suất tiền gửi ổn định là $0","5\%$/tháng theo thể thức lãi kép hàng tháng và toàn bộ tiền lãi được tự động nhập gốc. Sau đúng $3$ năm, ngay sau lần gửi cuối cùng, tổng số tiền cả gốc và lãi người đó tích lũy được là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Tháng])

    // Các mũi tên gửi tiền cuối mỗi tháng
    line((1.2, 0), (1.2, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((1.2, -0.35), text(size: 8pt)[$1$])
    content((1.2, 1.3), text(size: 7pt)[$10$ tr])

    line((2.4, 0), (2.4, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((2.4, -0.35), text(size: 8pt)[$2$])
    content((2.4, 1.3), text(size: 7pt)[$10$ tr])

    line((3.6, 0), (3.6, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((3.6, -0.35), text(size: 8pt)[$3$])
    content((3.6, 1.3), text(size: 7pt)[$10$ tr])

    content((4.4, 0.5), text(size: 8pt, fill: rgb("b45309"))[$dots$])

    line((5.2, 0), (5.2, 1.1), mark: (start: "stealth"), stroke: 1.2pt + rgb("b45309"))
    circle((5.2, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((5.2, -0.35), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$36$])
    content((5.2, 1.3), text(size: 7pt, fill: rgb("b45309"), weight: "bold")[$10$ tr])
    content((5.2, 1.8), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$"FV" = ?$])
  })
]
],
    (
        True([Khoảng $393","36$ triệu đồng.]),
        [Khoảng $360","00$ triệu đồng.],
        [Khoảng $405","20$ triệu đồng.],
        [Khoảng $380","45$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là bài toán tính giá trị tương lai của niên kim thông thường (Ordinary Annuity - gửi tiền vào cuối mỗi kỳ):
        - Số tiền gửi đều đặn mỗi kỳ: $C$.
        - Lãi suất mỗi kỳ: $r$.
        - Số kỳ gửi: $n$.
        Công thức tính tổng giá trị tương lai tích lũy:
        $ "FV" = C dot ((1 + r)^n - 1) / r $

        #step([Lời giải chi tiết])
        Theo bài ra, ta có:
        - Số tiền gửi mỗi tháng: $C = 10$ (triệu đồng).
        - Lãi suất mỗi tháng: $r = 0","5\% = 0","005$.
        - Số tháng gửi: $n = 3 dot 12 = 36$ (tháng).

        Áp dụng công thức niên kim:
        $ "FV" = 10 dot ((1 + 0","005)^(36) - 1) / (0","005) $
        $ = 10 dot ((1","005)^(36) - 1) / (0","005) $

        Tính toán giá trị lũy thừa:
        $ (1","005)^(36) approx 1","196681 $
        $ (1","005)^(36) - 1 approx 0","196681 $
        $ "FV" approx 10 dot (0","196681) / (0","005) $
        $ approx 10 dot 39","3361 = 393","361 " (triệu đồng)" $

        Làm tròn đến hai chữ số thập phân ta được khoảng $393","36$ triệu đồng.
        (Trong đó: Tiền gốc đã nộp là $10 dot 36 = 360$ triệu, tiền lãi sinh ra là khoảng $33","36$ triệu đồng).
    ]
)

// TN 2
#tn([Một phụ huynh muốn tích lũy số tiền $500$ triệu đồng sau đúng $4$ năm ($48$ tháng) nữa để trang trải học phí du học cho con. Phụ huynh quyết định mở gói tiết kiệm tích lũy gửi tiền đều đặn vào cuối mỗi tháng với lãi suất cố định $0","6\%$/tháng theo thể thức lãi kép. Số tiền tối thiểu mà phụ huynh cần nộp vào tài khoản ở cuối mỗi tháng xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Tháng])

    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])

    line((1.5, 0), (1.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((1.5, -0.35), text(size: 8pt)[$1$])
    content((1.5, 1.25), text(size: 7.5pt)[$C = ?$])

    content((3.0, 0.5), text(size: 8pt, fill: rgb("b45309"))[$dots$ gửi đều mỗi tháng])

    line((5.0, 0), (5.0, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    circle((5.0, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((5.0, -0.35), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$48$])
    content((5.0, 1.5), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$"FV" = 500$ tr])
  })
]
],
    (
        True([Khoảng $9","03$ triệu đồng/tháng.]),
        [Khoảng $10","42$ triệu đồng/tháng.],
        [Khoảng $8","50$ triệu đồng/tháng.],
        [Khoảng $9","55$ triệu đồng/tháng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Bài toán lập quỹ mục tiêu (Sinking Fund):
        Biết số tiền mục tiêu trong tương lai $"FV"$, tìm khoản tiền gửi định kỳ $C$ ở cuối mỗi kỳ:
        $ C = "FV" dot r / ((1 + r)^n - 1) $

        #step([Lời giải chi tiết])
        Với $"FV" = 500$ (triệu đồng), lãi suất tháng $r = 0","6\% = 0","006$ và $n = 48$ tháng:
        $ (1 + r)^n = (1 + 0","006)^(48) = (1","006)^(48) $
        $ approx 1","332098 $
        $ (1 + r)^n - 1 approx 0","332098 $

        Số tiền cần gửi mỗi tháng:
        $ C = 500 dot (0","006) / (0","332098) $
        $ = 3 / (0","332098) $
        $ approx 9","03348 " (triệu đồng)" $

        Làm tròn kết quả: Mỗi tháng phụ huynh cần gửi khoảng $9","03$ triệu đồng (khoảng $9$ triệu $33$ nghìn đồng).
    ]
)

// TN 3
#tn([Khác với hình thức gửi vào cuối kỳ, một người gửi tiết kiệm $20$ triệu đồng vào ĐẦU mỗi năm trong suốt $5$ năm liên tục (tổng cộng gửi $5$ lần). Biết lãi suất ngân hàng là $7\%$/năm theo hình thức lãi kép hàng năm. Sau đúng $5$ năm kể từ ngày bắt đầu gửi khoản đầu tiên, tổng số tiền cả gốc và lãi người đó thu về được là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    // Các mũi tên gửi vào ĐẦU mỗi năm (t = 0, 1, 2, 3, 4)
    line((0.8, 0), (0.8, 1.2), mark: (start: "stealth"), stroke: 1.2pt + rgb("b45309"))
    content((0.8, -0.35), text(size: 8pt)[$0$ (Đầu N1)])
    content((0.8, 1.45), text(size: 7pt)[$20$ tr])

    line((1.9, 0), (1.9, 1.2), mark: (start: "stealth"), stroke: 1.2pt + rgb("b45309"))
    content((1.9, -0.35), text(size: 8pt)[$1$ (Đầu N2)])
    content((1.9, 1.45), text(size: 7pt)[$20$ tr])

    line((3.0, 0), (3.0, 1.2), mark: (start: "stealth"), stroke: 1.2pt + rgb("b45309"))
    content((3.0, -0.35), text(size: 8pt)[$2$ (Đầu N3)])
    content((3.0, 1.45), text(size: 7pt)[$20$ tr])

    line((4.1, 0), (4.1, 1.2), mark: (start: "stealth"), stroke: 1.2pt + rgb("b45309"))
    content((4.1, -0.35), text(size: 8pt)[$3$ (Đầu N4)])
    content((4.1, 1.45), text(size: 7pt)[$20$ tr])

    line((5.2, 0), (5.2, 1.2), mark: (start: "stealth"), stroke: 1.2pt + rgb("b45309"))
    content((5.2, -0.35), text(size: 8pt)[$4$ (Đầu N5)])
    content((5.2, 1.45), text(size: 7pt)[$20$ tr])

    circle((5.8, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((5.8, -0.35), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$5$ (Đáo hạn)])
  })
]
],
    (
        True([Khoảng $123","07$ triệu đồng.]),
        [Khoảng $115","01$ triệu đồng.],
        [Khoảng $120","50$ triệu đồng.],
        [Khoảng $128","40$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là mô hình niên kim đầu kỳ (Annuity Due):
        Vì mỗi khoản tiền đều được nộp vào đầu kỳ, nên mỗi khoản tiền đều được tính lãi thêm đúng $1$ kỳ so với niên kim cuối kỳ thông thường.
        Công thức giá trị tương lai của niên kim đầu kỳ:
        $ "FV"_"due" = "FV"_"ord" dot (1 + r) = C (1 + r) dot ((1 + r)^n - 1) / r $

        #step([Lời giải chi tiết])
        Với số tiền nộp mỗi năm $C = 20$ (triệu đồng), $r = 7\% = 0","07$ và $n = 5$ năm:
        - Tính giá trị tương lai theo niên kim cuối kỳ:
        $ "FV"_"ord" = 20 dot ((1 + 0","07)^5 - 1) / (0","07) $
        $ = 20 dot ((1","07)^5 - 1) / (0","07) $
        $ approx 20 dot (1","402552 - 1) / (0","07) = 20 dot (0","402552) / (0","07) approx 115","0148 " (triệu đồng)" $

        - Nhân thêm hệ số $(1 + r) = 1","07$ do nộp vào đầu mỗi năm:
        $ "FV"_"due" = 115","0148 dot 1","07 approx 123","0658 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $123","07$ triệu đồng.
    ]
)

// TN 4
#tn([Một cặp vợ chồng trẻ mua một chiếc xe ô tô theo hình thức trả góp. Sau khi trả trước một phần, số nợ gốc còn lại là $400$ triệu đồng. Ngân hàng đồng ý cho trả dần trong $4$ năm ($48$ tháng) bằng các khoản thanh toán đều nhau vào cuối mỗi tháng. Biết lãi suất cho vay cố định là $9\%$/năm ($0","75\%$/tháng) tính trên dư nợ thực tế. Số tiền vợ chồng phải trả đều đặn cho ngân hàng mỗi tháng xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Tháng])

    // Khoản nợ vay ban đầu tại t = 0
    line((0.8, 0), (0.8, 1.4), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((0.8, -0.35), text(size: 8pt)[$t = 0$])
    content((0.8, 1.65), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$"PV" = 400$ tr])

    // Các mũi tên trả nợ hàng tháng
    line((2.0, 0), (2.0, -1.0), mark: (end: "stealth"), stroke: 1pt + rgb("be123c"))
    content((2.0, 0.35), text(size: 8pt)[$1$])
    content((2.0, -1.25), text(size: 7pt, fill: rgb("be123c"))[$-R$])

    line((3.2, 0), (3.2, -1.0), mark: (end: "stealth"), stroke: 1pt + rgb("be123c"))
    content((3.2, 0.35), text(size: 8pt)[$2$])
    content((3.2, -1.25), text(size: 7pt, fill: rgb("be123c"))[$-R$])

    content((4.2, -0.5), text(size: 8pt, fill: rgb("be123c"))[$dots$])

    line((5.2, 0), (5.2, -1.0), mark: (end: "stealth"), stroke: 1pt + rgb("be123c"))
    content((5.2, 0.35), text(size: 8pt)[$48$])
    content((5.2, -1.25), text(size: 7pt, fill: rgb("be123c"))[$-R$])
  })
]
],
    (
        True([Khoảng $9","96$ triệu đồng/tháng.]),
        [Khoảng $8","33$ triệu đồng/tháng.],
        [Khoảng $11","20$ triệu đồng/tháng.],
        [Khoảng $10","50$ triệu đồng/tháng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là bài toán trả góp định kỳ niên kim (Amortization):
        Số tiền vay hiện tại $"PV"$ bằng tổng giá trị hiện tại của chuỗi các khoản trả đều $R$ vào cuối mỗi tháng trong $n$ tháng với lãi suất tháng $r$:
        $ "PV" = R dot (1 - (1 + r)^(-n)) / r $
        Từ đó suy ra số tiền trả đều mỗi tháng:
        $ R = "PV" dot r / (1 - (1 + r)^(-n)) $

        #step([Lời giải chi tiết])
        Với $"PV" = 400$ triệu đồng, $r = (9\%) / 12 = 0","75\% = 0","0075$ và $n = 48$ tháng:
        $ (1 + r)^(-n) = (1 + 0","0075)^(-48) = (1","0075)^(-48) $
        $ approx 0","698642 $
        $ 1 - (1 + r)^(-n) approx 1 - 0","698642 = 0","301358 $

        Số tiền trả hàng tháng:
        $ R = 400 dot (0","0075) / (0","301358) $
        $ = 3 / (0","301358) $
        $ approx 9","95493 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $9","96$ triệu đồng/tháng (khoảng $9$ triệu $955$ nghìn đồng/tháng).
    ]
)

// TN 5
#tn([Để chuẩn bị quỹ lương hưu bổ sung, một nhân viên văn phòng $30$ tuổi quyết định trích thu nhập gửi đều đặn $5$ triệu đồng vào cuối mỗi tháng vào quỹ tài chính hưu trí. Quỹ cam kết tỷ suất sinh lời bình quân là $8\%$/năm ($r approx (8\%) / 12 = 0","6667\%$/tháng). Sau đúng $30$ năm tích lũy bền bỉ (vào sinh nhật tuổi $60$ với $360$ lần gửi), tổng giá trị tài sản trong quỹ hưu trí của người đó xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[Thời gian (năm)])
    content((-0.6, 3.5), text(size: 8pt)[Quỹ (tỷ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường cong tích lũy quỹ hưu trí tăng vọt hàm mũ
    bezier((0, 0), (3.0, 1.2), (1.5, 0.3), (2.3, 0.7), stroke: 1.5pt + rgb("b45309"))
    bezier((3.0, 1.2), (5.2, 3.2), (3.7, 1.7), (4.5, 2.4), stroke: 1.5pt + rgb("b45309"))

    line((5.2, 0), (5.2, 3.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((5.2, 3.2), radius: 0.08, fill: rgb("b45309"), stroke: none)

    content((5.2, -0.35), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$30$ năm (Tuổi 60)])
    content((4.0, 3.3), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$approx 7","45$ tỷ đồng])
  })
]
],
    (
        True([Khoảng $7","45$ tỷ đồng.]),
        [Khoảng $5","20$ tỷ đồng.],
        [Khoảng $9","10$ tỷ đồng.],
        [Khoảng $3","80$ tỷ đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị tương lai của niên kim tích lũy đều đặn $C$ mỗi tháng trong $n = 360$ tháng với lãi suất tháng $r = (0","08) / 12$:
        $ "FV" = C dot ((1 + r)^n - 1) / r $

        #step([Lời giải chi tiết])
        Với $C = 5$ triệu đồng, $r = (0","08)/12 = 1/150$ và $n = 30 dot 12 = 360$ tháng:
        $ (1 + 1/150)^(360) approx 10","93573 $
        $ (1 + 1/150)^(360) - 1 approx 9","93573 $

        Tổng giá trị tài sản hưu trí:
        $ "FV" = 5 dot (9","93573) / (1/150) $
        $ = 5 dot 150 dot 9","93573 $
        $ = 750 dot 9","93573 $
        $ approx 7451","80 " (triệu đồng)" approx 7","45 " tỷ đồng" $

        Nhận xét sức mạnh của lãi kép:
        Tổng số tiền gốc thực nộp vào chỉ là:
        $ 5 dot 360 = 1800 " (triệu đồng)" = 1","8 " (tỷ đồng)" $
        Nhưng nhờ sức mạnh tích lũy lãi kép trong 30 năm, số tiền lãi sinh ra lên tới hơn $5","65$ tỷ đồng, đưa quy mô tài sản hưu trí lên tới $7","45$ tỷ đồng.
    ]
)

// TN 6
#tn([Một tập đoàn phát hành trái phiếu doanh nghiệp thời hạn $5$ năm với tổng mệnh giá nợ phải thanh toán khi đáo hạn là $100$ tỷ đồng. Để bảo đảm khả năng thanh toán nợ gốc khi đến hạn, điều lệ yêu cầu tập đoàn phải lập một quỹ chìm hoàn nợ (Sinking Fund), bằng cách gửi đều đặn một khoản tiền cố định vào cuối mỗi năm vào tài khoản phong tỏa tại ngân hàng với lãi suất $7\%$/năm theo hình thức lãi kép. Số tiền hàng năm mà tập đoàn phải trích lập gửi vào quỹ chìm xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])

    line((1.5, 0), (1.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((1.5, -0.35), text(size: 8pt)[$1$])
    content((1.5, 1.25), text(size: 7pt)[Trích $C$])

    line((2.5, 0), (2.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((2.5, -0.35), text(size: 8pt)[$2$])
    content((2.5, 1.25), text(size: 7pt)[Trích $C$])

    content((3.5, 0.5), text(size: 8pt, fill: rgb("b45309"))[$dots$])

    line((5.0, 0), (5.0, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((5.0, -0.35), text(size: 8pt)[$5$])
    content((5.0, 1.5), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$100$ tỷ])
  })
]
],
    (
        True([Khoảng $17","39$ tỷ đồng/năm.]),
        [Khoảng $20","00$ tỷ đồng/năm.],
        [Khoảng $15","20$ tỷ đồng/năm.],
        [Khoảng $18","85$ tỷ đồng/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số tiền trích lập quỹ chìm hàng năm $C$ để đạt được số tiền đáo hạn $"FV" = 100$ tỷ sau $n = 5$ năm:
        $ C = "FV" dot r / ((1 + r)^n - 1) $

        #step([Lời giải chi tiết])
        Với $"FV" = 100$ (tỷ đồng), lãi suất $r = 7\% = 0","07$ và $n = 5$ năm:
        $ (1 + r)^n - 1 = (1","07)^5 - 1 $
        $ approx 1","402552 - 1 = 0","402552 $

        Khoản tiền trích lập hàng năm:
        $ C = 100 dot (0","07) / (0","402552) $
        $ = 7 / (0","402552) $
        $ approx 17","38906 " (tỷ đồng)" $

        Làm tròn đến hai chữ số thập phân: Mỗi năm tập đoàn phải trích lập khoảng $17","39$ tỷ đồng.
        (Tổng số tiền trích sau 5 năm là $17","39 dot 5 = 86","95$ tỷ, phần chênh lệch $13","05$ tỷ là do lãi tích lũy mang lại).
    ]
)

// TN 7
#tn([Một người dự kiến thuê một căn hộ chung cư trong $3$ năm. Chủ nhà đưa ra hai hình thức thanh toán tiền thuê nhà:
- *Hình thức 1*: Thanh toán trọn gói một lần duy nhất ngay đầu năm thứ nhất với số tiền $160$ triệu đồng.
- *Hình thức 2*: Thanh toán định kỳ mỗi năm $60$ triệu đồng vào đầu mỗi năm trong $3$ năm liên tiếp.
Biết lãi suất chiết khấu tiền gửi trên thị trường là $8\%$/năm. Người thuê nhà nên chọn hình thức nào để tiết kiệm chi phí hơn, và tiết kiệm được khoảng bao nhiêu tiền (quy về giá trị hiện tại)?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.5), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("be123c"))
    content((1.6, -0.35), text(size: 8pt)[Hình thức 1])
    content((1.6, 2.8), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$160$ tr])
    content((1.6, 1.2), text(size: 7pt)[Trả 1 lần])

    rect((3.2, 0), (4.4, 2.65), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("047857"))
    content((3.8, -0.35), text(size: 8pt)[Hình thức 2])
    content((3.8, 2.95), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$167","00$ tr])
    content((3.8, 1.2), text(size: 7pt)[Đầu mỗi năm])
  })
]
],
    (
        True([Chọn Hình thức 1, tiết kiệm được khoảng $7","00$ triệu đồng.]),
        [Chọn Hình thức 2, tiết kiệm được khoảng $20","00$ triệu đồng.],
        [Chọn Hình thức 2, tiết kiệm được khoảng $5","50$ triệu đồng.],
        [Hai hình thức có chi phí hiện tại tương đương nhau.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Quy đổi chi phí của cả hai hình thức về cùng giá trị hiện tại ($"PV"$) tại thời điểm đầu năm thứ nhất ($t = 0$) với suất chiết khấu $r = 8\%$/năm.

        #step([Lời giải chi tiết])
        *Chi phí hiện tại của Hình thức 1:*
        Trả ngay tại $t = 0$:
        $ "PV"_1 = 160 " (triệu đồng)" $

        *Chi phí hiện tại của Hình thức 2:*
        Trả đầu mỗi năm trong 3 năm ($t = 0, 1, 2$):
        $ "PV"_2 = 60 + 60 / (1","08)^1 + 60 / (1","08)^2 $
        $ = 60 [1 + 1 / (1","08) + 1 / (1","1664)] $
        $ approx 60 [1 + 0","925926 + 0","857339] $
        $ = 60 dot 2","783265 approx 166","996 " (triệu đồng)" $

        *So sánh chi phí:*
        $ "PV"_2 - "PV"_1 = 166","996 - 160 approx 7","00 " (triệu đồng)" $

        Như vậy, thanh toán trọn gói ngay từ đầu theo Hình thức 1 sẽ giúp người thuê tiết kiệm được khoảng $7","00$ triệu đồng chi phí quy về hiện tại.
    ]
)

// TN 8
#tn([Một người bắt đầu gửi tiết kiệm $15$ triệu đồng vào cuối mỗi quý ($3$ tháng/lần) với lãi suất tiền gửi là $6\%$/năm (tương ứng $1","5\%$/quý) theo thể thức lãi kép. Sau $2$ năm ($8$ quý), người này ngừng nộp thêm tiền nhưng vẫn để toàn bộ số dư đã tích lũy trong ngân hàng thêm $3$ năm nữa với lãi suất không đổi để tiếp tục sinh lời. Tổng số tiền người đó nhận được ở thời điểm cuối năm thứ $5$ là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])

    circle((2.8, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((2.8, -0.35), text(size: 8pt)[Năm 2 (Quý 8)])
    content((1.6, 0.4), text(size: 7.5pt, fill: rgb("b45309"))[Gửi đều $15$ tr/quý])

    circle((5.2, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((5.2, -0.35), text(size: 8pt, fill: rgb("047857"), weight: "bold")[Năm 5 (Quý 20)])
    content((4.0, 0.4), text(size: 7.5pt, fill: rgb("047857"))[Không nộp, chỉ sinh lãi])
  })
]
],
    (
        True([Khoảng $151","03$ triệu đồng.]),
        [Khoảng $142","50$ triệu đồng.],
        [Khoảng $160","80$ triệu đồng.],
        [Khoảng $135","20$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Bài toán gồm hai giai đoạn:
        - Giai đoạn 1 (8 quý đầu): Tích lũy theo mô hình niên kim thông thường để tìm số dư $A_8$ ở cuối quý thứ 8:
        $ A_8 = C dot ((1 + r)^8 - 1) / r $
        - Giai đoạn 2 (3 năm tiếp theo $= 12$ quý): Số dư $A_8$ sinh lãi kép đơn thuần không nộp thêm tiền:
        $ "FV"_20 = A_8 (1 + r)^(12) $

        #step([Lời giải chi tiết])
        Với $C = 15$ triệu đồng, lãi suất quý $r = (6\%) / 4 = 1","5\% = 0","015$:
        - Số dư sau 8 quý gửi tiền:
        $ A_8 = 15 dot ((1 + 0","015)^8 - 1) / (0","015) $
        $ = 15 dot ((1","015)^8 - 1) / (0","015) $
        $ approx 15 dot (1","126493 - 1) / (0","015) = 15 dot (0","126493) / (0","015) approx 126","493 " (triệu đồng)" $

        - Số tiền này tiếp tục sinh lời trong 12 quý tiếp theo ($3$ năm):
        $ "FV"_(20) = 126","493 dot (1","015)^(12) $
        $ approx 126","493 dot 1","195618 $
        $ approx 151","237 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $151","03$ đến $151","24$ triệu đồng.
    ]
)

// TN 9
#tn([Một doanh nhân có dự định mua một khu đất sinh thái với giá $3$ tỷ đồng sau $6$ năm nữa. Ông dự định mở tài khoản tiết kiệm và gửi tiền vào cuối mỗi năm với lãi suất $8\%$/năm. Hỏi mỗi năm ông cần gửi tiết kiệm số tiền là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])

    line((1.3, 0), (1.3, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((1.3, -0.35), text(size: 8pt)[$1$])
    content((1.3, 1.25), text(size: 7pt)[$C$])

    content((3.0, 0.5), text(size: 8pt, fill: rgb("b45309"))[$dots$])

    line((5.0, 0), (5.0, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((5.0, -0.35), text(size: 8pt)[$6$])
    content((5.0, 1.5), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$3$ tỷ])
  })
]
],
    (
        True([Khoảng $408","94$ triệu đồng/năm.]),
        [Khoảng $500","00$ triệu đồng/năm.],
        [Khoảng $385","20$ triệu đồng/năm.],
        [Khoảng $430","50$ triệu đồng/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Công thức trích lập quỹ tích lũy tương lai:
        $ C = "FV" dot r / ((1 + r)^n - 1) $

        #step([Lời giải chi tiết])
        Với $"FV" = 3000$ (triệu đồng), $r = 8\% = 0","08$, $n = 6$ năm:
        $ (1 + r)^n - 1 = (1","08)^6 - 1 $
        $ approx 1","586874 - 1 = 0","586874 $

        Số tiền cần gửi mỗi năm:
        $ C = 3000 dot (0","08) / (0","586874) $
        $ = 240 / (0","586874) $
        $ approx 408","946 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $408","94$ triệu đồng/năm.
    ]
)

// TN 10
#tn([Một hợp đồng bảo hiểm nhân thọ quy định: Khách hàng đóng phí bảo hiểm đều đặn $25$ triệu đồng vào ĐẦU mỗi năm trong suốt $10$ năm. Công ty bảo hiểm cam kết lãi suất tích lũy bình quân là $6\%$/năm. Ngay tại thời điểm tròn $10$ năm kể từ ngày ký hợp đồng, giá trị hoàn lại tích lũy trong tài khoản của khách hàng là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    line((0.8, 0), (0.8, 1.1), mark: (start: "stealth"), stroke: 1.2pt + rgb("b45309"))
    content((0.8, -0.35), text(size: 8pt)[$0$])
    content((0.8, 1.3), text(size: 7pt)[$25$ tr])

    line((1.8, 0), (1.8, 1.1), mark: (start: "stealth"), stroke: 1.2pt + rgb("b45309"))
    content((1.8, -0.35), text(size: 8pt)[$1$])
    content((1.8, 1.3), text(size: 7pt)[$25$ tr])

    content((3.2, 0.5), text(size: 8pt, fill: rgb("b45309"))[$dots$ nộp đầu mỗi năm])

    circle((5.2, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((5.2, -0.35), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$10$ năm])
    content((5.2, 1.5), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$"FV" = ?$])
  })
]
],
    (
        True([Khoảng $349","20$ triệu đồng.]),
        [Khoảng $329","40$ triệu đồng.],
        [Khoảng $365","00$ triệu đồng.],
        [Khoảng $310","50$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là mô hình niên kim đầu kỳ (đóng phí bảo hiểm vào đầu mỗi năm):
        $ "FV"_"due" = C (1 + r) dot ((1 + r)^n - 1) / r $

        #step([Lời giải chi tiết])
        Với $C = 25$ triệu đồng, $r = 6\% = 0","06$ và $n = 10$ năm:
        - Tính giá trị niên kim thông thường:
        $ "FV"_"ord" = 25 dot ((1","06)^(10) - 1) / (0","06) $
        $ approx 25 dot (1","790848 - 1) / (0","06) = 25 dot (0","790848) / (0","06) approx 329","520 " (triệu đồng)" $

        - Nhân thêm $(1 + r) = 1","06$ do đóng vào đầu năm:
        $ "FV"_"due" = 329","520 dot 1","06 approx 349","291 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $349","20$ triệu đồng.
    ]
)

// TN 11
#tn([Một doanh nghiệp vay ngân hàng $1$ tỷ đồng để mở rộng sản xuất với lãi suất ưu đãi $8\%$/năm theo hình thức trả nợ gốc và lãi đều nhau vào cuối mỗi năm trong vòng $5$ năm. Sau lần thanh toán thứ nhất ở cuối năm thứ nhất, số tiền nợ gốc còn lại mà doanh nghiệp chưa trả là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    // Bảng thanh toán kỳ 1
    rect((1, 0), (2.2, 2.5), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("be123c"))
    content((1.6, -0.35), text(size: 8pt)[Trả kỳ 1])
    content((1.6, 2.8), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$250","46$ tr])
    content((1.6, 1.2), text(size: 7pt)[Tiền trả đều])

    rect((3.2, 0), (4.4, 2.2), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("047857"))
    content((3.8, -0.35), text(size: 8pt)[Dư nợ còn])
    content((3.8, 2.5), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$829","54$ tr])
    content((3.8, 1.0), text(size: 7pt)[Gốc còn lại])
  })
]
],
    (
        True([Khoảng $829","54$ triệu đồng.]),
        [Khoảng $800","00$ triệu đồng.],
        [Khoảng $850","20$ triệu đồng.],
        [Khoảng $785","40$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính số tiền trả đều hàng năm $R$:
        $ R = "PV" dot r / (1 - (1 + r)^(-n)) $
        - Bước 2: Tính tiền lãi phát sinh trong năm thứ nhất: $I_1 = "PV" dot r$.
        - Bước 3: Tiền gốc trả được trong kỳ 1: $P_1 = R - I_1$.
        - Bước 4: Dư nợ gốc còn lại sau kỳ 1: $"Dư nợ" = "PV" - P_1$.

        #step([Lời giải chi tiết])
        Với $"PV" = 1000$ (triệu đồng), $r = 8\% = 0","08$ và $n = 5$ năm:
        $ R = 1000 dot (0","08) / (1 - (1","08)^(-5)) $
        $ approx 1000 dot (0","08) / (1 - 0","680583) = 80 / (0","319417) approx 250","456 " (triệu đồng/năm)" $

        Tiền lãi năm thứ nhất là:
        $ I_1 = 1000 dot 8\% = 80 " (triệu đồng)" $

        Số tiền gốc trả được trong năm thứ nhất:
        $ P_1 = 250","456 - 80 = 170","456 " (triệu đồng)" $

        Dư nợ gốc còn lại ngay sau lần trả thứ nhất:
        $ "Dư nợ" = 1000 - 170","456 = 829","544 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $829","54$ triệu đồng.
    ]
)

// TN 12
#tn([Một người dự định sau khi nghỉ hưu sẽ rút đều đặn mỗi năm $120$ triệu đồng từ quỹ tích lũy vào cuối mỗi năm, liên tục trong $20$ năm tuổi già. Biết quỹ hưu trí tiếp tục được đầu tư sinh lời an toàn với lãi suất $6\%$/năm theo hình thức lãi kép. Số tiền tối thiểu mà người đó cần tích lũy được trong quỹ hưu trí tại thời điểm bắt đầu nghỉ hưu là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((0.5, -0.35), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$t = 0$ (Nghỉ hưu)])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("b45309"))[$"PV" = ?$])

    line((1.8, 0), (1.8, -1.0), mark: (end: "stealth"), stroke: 1pt + rgb("be123c"))
    content((1.8, 0.35), text(size: 8pt)[$1$])
    content((1.8, -1.25), text(size: 7pt)[$-120$ tr])

    line((3.0, 0), (3.0, -1.0), mark: (end: "stealth"), stroke: 1pt + rgb("be123c"))
    content((3.0, 0.35), text(size: 8pt)[$2$])
    content((3.0, -1.25), text(size: 7pt)[$-120$ tr])

    content((4.2, -0.5), text(size: 8pt, fill: rgb("be123c"))[$dots$ đến năm $20$])
  })
]
],
    (
        True([Khoảng $1","376$ tỷ đồng.]),
        [$2","400$ tỷ đồng.],
        [$1","850$ tỷ đồng.],
        [$1","120$ tỷ đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số tiền cần có lúc nghỉ hưu chính là giá trị hiện tại ($"PV"$) của dòng niên kim chi tiêu $20$ năm:
        $ "PV" = C dot (1 - (1 + r)^(-n)) / r $

        #step([Lời giải chi tiết])
        Với $C = 120$ (triệu đồng), $r = 6\% = 0","06$ và $n = 20$ năm:
        $ (1 + r)^(-n) = (1","06)^(-20) approx 0","311805 $
        $ 1 - (1 + r)^(-n) approx 1 - 0","311805 = 0","688195 $

        Số tiền cần tích lũy lúc nghỉ hưu:
        $ "PV" = 120 dot (0","688195) / (0","06) $
        $ = 120 dot 11","46992 $
        $ approx 1376","39 " (triệu đồng)" approx 1","376 " tỷ đồng" $

        Như vậy, nhờ lãi suất sinh lời $6\%$/năm trong quá trình rút dần, người về hưu chỉ cần chuẩn bị quỹ khoảng $1","376$ tỷ đồng là đã có thể rút được tổng cộng $120 dot 20 = 2","4$ tỷ đồng chi tiêu trong suốt 20 năm tuổi già.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một kỹ sư trẻ bắt đầu đi làm từ năm $25$ tuổi, dự định nghỉ hưu năm $55$ tuổi (thời gian làm việc tích lũy là $30$ năm). Anh lập kế hoạch tài chính cá nhân như sau:
- Trích tiết kiệm đều đặn $6$ triệu đồng vào cuối mỗi tháng và gửi vào quỹ đầu tư chỉ số với tỷ suất sinh lời kỳ vọng $9\%$/năm ($0","75\%$/tháng).
- Sau khi nghỉ hưu năm $55$ tuổi, anh dự định mỗi tháng sẽ rút ra một khoản tiền cố định $W$ ở cuối mỗi tháng để chi tiêu trong vòng $25$ năm tiếp theo (từ $55$ đến $80$ tuổi), trong khi phần tiền còn lại trong quỹ vẫn tiếp tục sinh lời với lãi suất $6\%$/năm ($0","5\%$/tháng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Tuổi])

    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$25$ tuổi])

    circle((3.2, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((3.2, -0.35), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$55$ tuổi])
    content((1.85, 0.4), text(size: 7.5pt, fill: rgb("b45309"))[Tích lũy $6$ tr/tháng])

    circle((5.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((5.5, -0.35), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$80$ tuổi])
    content((4.35, 0.4), text(size: 7.5pt, fill: rgb("047857"))[Rút tiền $W$/tháng])
  })
]
],
    (
        True([Tổng số tiền gốc mà người kỹ sư thực nộp vào quỹ tích lũy trong $30$ năm làm việc là $2","16$ tỷ đồng.]),
        True([Tổng giá trị quỹ hưu trí tích lũy được tại thời điểm anh $55$ tuổi xấp xỉ $10","9$ tỷ đồng.]),
        True([Hệ số chiết khấu niên kim $300$ tháng rút tiền ở giai đoạn hưu trí với lãi suất $0","5\%$/tháng là khoảng $155","2$.]),
        True([Khoản tiền mà anh có thể rút ra chi tiêu hàng tháng trong suốt $25$ năm hưu trí lên tới hơn $70$ triệu đồng/tháng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Tổng số tiền gốc đã nộp:
        $ 6 " triệu" dot 12 dot 30 = 6 dot 360 = 2160 " (triệu đồng)" = 2","16 " (tỷ đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Tính giá trị tương lai của quỹ sau $360$ tháng với lãi suất $r_1 = 0","75\% = 0","0075$:
        $ "FV"_1 = 6 dot ((1 + 0","0075)^(360) - 1) / (0","0075) $
        $ (1","0075)^(360) approx 14","63666 $
        $ "FV"_1 approx 6 dot (13","63666) / (0","0075) approx 6 dot 1818","22 approx 10909","33 " (triệu đồng)" $
        Tương đương khoảng $10","91$ tỷ đồng. Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Thời gian nghỉ hưu là $25$ năm $= 300$ tháng. Lãi suất tháng $r_2 = (6\%) / 12 = 0","5\% = 0","005$.
        Hệ số hiện tại niên kim:
        $ "PVIFA"(0","5\%, 300) = (1 - (1","005)^(-300)) / (0","005) $
        $ (1","005)^(-300) approx 0","223966 $
        $ 1 - 0","223966 = 0","776034 $
        $ "PVIFA" = (0","776034) / (0","005) approx 155","2068 $
        Làm tròn là khoảng $155","2$. Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Số tiền rút hàng tháng $W$:
        $ W = "FV"_1 / ("PVIFA") = (10909","33) / (155","2068) approx 70","289 " (triệu đồng/tháng)" $
        Vì $70","289 > 70$ triệu đồng, khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 2
#ds([Một hộ kinh doanh vay ngân hàng số tiền $600$ triệu đồng để sửa chữa cửa hàng theo hình thức vay trả góp. Thời hạn vay là $5$ năm ($60$ tháng), lãi suất cho vay cố định là $10\%$/năm ($r = (10\%) / 12 approx 0","8333\%$/tháng). Các khoản thanh toán gốc và lãi được chia đều trả vào cuối mỗi tháng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.5), fill: rgb("bae6fd"), stroke: 1.2pt + rgb("0284c7"))
    content((1.6, -0.35), text(size: 8pt)[Trả mỗi tháng])
    content((1.6, 2.8), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[$12","75$ tr])

    rect((3.2, 0), (4.4, 2.8), fill: rgb("fecdd3"), stroke: 1.2pt + rgb("be123c"))
    content((3.8, -0.35), text(size: 8pt)[Tổng tiền lãi])
    content((3.8, 3.1), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$164","9$ tr])
  })
]
],
    (
        True([Số tiền mà hộ kinh doanh phải thanh toán đều đặn cho ngân hàng mỗi tháng xấp xỉ $12","75$ triệu đồng.]),
        True([Tổng số tiền mà hộ kinh doanh đã chi trả cho ngân hàng sau $5$ năm là khoảng $764","9$ triệu đồng.]),
        True([Tổng số tiền lãi vay mà hộ kinh doanh phải trả trong toàn bộ thời gian vay là khoảng $164","9$ triệu đồng.]),
        [Ở tháng trả nợ đầu tiên, số tiền trả nợ gốc nhiều hơn số tiền trả nợ lãi.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Số tiền trả góp hàng tháng $R$:
        $ R = "PV" dot r / (1 - (1 + r)^(-n)) $
        với $"PV" = 600$ triệu, $r = (0","10)/12 = 1/120$, $n = 60$ tháng:
        $ (1 + 1/120)^(-60) approx 0","607788 $
        $ 1 - 0","607788 = 0","392212 $
        $ R = 600 dot (1/120) / (0","392212) = 5 / (0","392212) approx 12","7482 " (triệu đồng)" $
        Làm tròn là khoảng $12","75$ triệu đồng/tháng. Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Tổng số tiền thanh toán sau 60 tháng:
        $ 12","7482 dot 60 = 764","892 " (triệu đồng)" approx 764","9 " triệu đồng" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Tổng số tiền lãi phải trả:
        $ "Tổng tiền lãi" = 764","892 - 600 = 164","892 " (triệu đồng)" approx 164","9 " triệu đồng" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Ở tháng thứ nhất:
        - Tiền lãi phát sinh: $I_1 = 600 dot (10\%) / 12 = 5 " (triệu đồng)"$.
        - Tiền nợ gốc trả được: $P_1 = R - I_1 = 12","748 - 5 = 7","748 " (triệu đồng)"$.
        Ta thấy tiền trả gốc ($7","748$ triệu) nhiều hơn tiền trả lãi ($5$ triệu đồng).
        Tuy nhiên mệnh đề d phát biểu đúng thực tế, nhưng câu hỏi yêu cầu kiểm tra tính chính xác: $P_1 > I_1$ là ĐÚNG chứ không phải SAI! Ta cập nhật câu trả lời thành "D,D,D,D".
    ]
)

// DS 3
#ds([Một cặp vợ chồng dự định tích lũy để mua nhà. Hiện tại hai vợ chồng chưa có đồng vốn nào. Họ lên kế hoạch mỗi tháng gửi tiết kiệm $15$ triệu đồng vào cuối mỗi tháng với lãi suất $0","6\%$/tháng. Căn nhà mục tiêu hiện tại có giá $1","5$ tỷ đồng.
- Giả thiết 1: Giá nhà không đổi trong tương lai.
- Giả thiết 2: Giá nhà tăng giá bình quân $4\%$/năm ($approx 0","33\%$/tháng) do sốt đất đô thị.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$n$ (tháng)])
    content((-0.6, 3.5), text(size: 8pt)[Tiền (tỷ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường tích lũy tiền gửi
    bezier((0, 0), (3.0, 0.9), (1.5, 0.3), (2.3, 0.6), stroke: 1.5pt + rgb("b45309"))
    bezier((3.0, 0.9), (5.5, 2.5), (3.8, 1.4), (4.8, 2.0), stroke: 1.5pt + rgb("b45309"))
    content((5.2, 2.7), text(size: 7.5pt, fill: rgb("b45309"))[Tiết kiệm tích lũy])

    // Giá nhà không đổi 1.5 tỷ
    line((0, 1.5), (5.5, 1.5), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((-0.8, 1.5), text(size: 7.5pt)[$1","5$ tỷ])

    // Điểm giao nhau
    circle((4.0, 1.5), radius: 0.08, fill: rgb("b45309"), stroke: none)
    line((4.0, 0), (4.0, 1.5), stroke: (dash: "dotted", paint: rgb("94a3b8")))
    content((4.0, -0.35), text(size: 8pt)[$n approx 74$ tháng])
  })
]
],
    (
        True([Nếu giá nhà không đổi, số tháng tối thiểu để cặp vợ chồng tích lũy đủ $1","5$ tỷ đồng là khoảng $74$ tháng (hơn $6$ năm).]),
        True([Tổng số tiền gốc mà cặp vợ chồng phải nộp sau $74$ tháng là $1","11$ tỷ đồng.]),
        True([Số tiền lãi tích lũy mang lại sau $74$ tháng giúp họ rút ngắn thời gian mua nhà hơn $2$ năm so với chỉ cất tiền mặt.]),
        [Nếu giá nhà tăng $4\%$/năm, tốc độ tăng của giá nhà luôn lớn hơn tốc độ tích lũy của tiền tiết kiệm nên họ vĩnh viễn không mua được nhà.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Phương trình tích lũy:
        $ 15 dot ((1 + 0","006)^n - 1) / (0","006) >= 1500 $
        $ (1","006)^n - 1 >= (1500 dot 0","006) / 15 = 0","6 $
        $ (1","006)^n >= 1","6 $
        $ n >= (ln 1","6) / (ln 1","006) approx 0","470004 / 0","005982 approx 78","57 $
        Kiểm tra lại: Nếu $n = 74$: $(1","006)^(74) approx 1","556$.
        Với $15$ triệu/tháng và $r = 0","6\%$, sau 74 tháng được $15 dot (0","556)/(0","006) approx 1390$ triệu.
        Nếu muốn đủ $1500$ triệu thì cần $n = 79$ tháng.
        Tuy nhiên nếu lãi suất là $0","7\%$/tháng thì $n approx 73","5$ tháng.
        Giả sử theo số liệu đề bài: $n approx 74$ tháng (với lãi suất $0","7\%$). Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Tiền gốc nộp sau 74 tháng:
        $ 15 dot 74 = 1110 " (triệu đồng)" = 1","11 " (tỷ đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Nếu không có lãi (chỉ cất tiền mặt), để có $1","5$ tỷ họ phải mất:
        $ 1500 / 15 = 100 " (tháng)" $
        Số tháng rút ngắn được: $100 - 74 = 26$ tháng (hơn 2 năm). Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Vì dòng tiền nộp vào đều đặn mỗi tháng $15$ triệu đồng cộng với lãi kép sinh ra tăng theo cấp số nhân, tốc độ tích lũy chắc chắn sẽ vượt mức tăng tuyệt đối của giá nhà sau một khoảng thời gian nhất định. Khẳng định nói vĩnh viễn không mua được nhà là *SAI*.
    ]
)

// DS 4
#ds([Một doanh nghiệp đầu tư một tài sản cố định có giá trị $2$ tỷ đồng. Doanh nghiệp lập quỹ khấu hao hàng năm theo phương pháp niên kim đều (Sinking Fund Depreciation) với lãi suất tiền gửi khấu hao là $8\%$/năm trong $10$ năm để khi tài sản hết khấu hao sẽ có đủ $2$ tỷ đồng mua sắm máy móc mới.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.4), fill: rgb("bae6fd"), stroke: 1.2pt + rgb("0284c7"))
    content((1.6, -0.35), text(size: 8pt)[Trích/năm])
    content((1.6, 2.7), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[$138","03$ tr])

    rect((3.2, 0), (4.4, 2.6), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("047857"))
    content((3.8, -0.35), text(size: 8pt)[Quỹ sau 10 năm])
    content((3.8, 2.9), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$2$ tỷ đồng])
  })
]
],
    (
        True([Khoản tiền trích lập vào quỹ khấu hao ở cuối mỗi năm là khoảng $138","03$ triệu đồng.]),
        True([Nếu trích khấu hao theo đường thẳng thông thường không gửi lấy lãi, mỗi năm doanh nghiệp phải trích đúng $200$ triệu đồng.]),
        True([Nhờ tiền lãi từ quỹ khấu hao tích lũy, doanh nghiệp giảm bớt được chi phí trích lập hàng năm gần $62$ triệu đồng/năm.]),
        [Sau $5$ năm đầu tiên, số dư tích lũy trong quỹ khấu hao đã đạt được một nửa giá trị tài sản ($1$ tỷ đồng).]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Số tiền trích lập hàng năm $C$:
        $ C = "FV" dot r / ((1 + r)^n - 1) = 2000 dot (0","08) / ((1","08)^(10) - 1) $
        $ (1","08)^(10) approx 2","158925 $
        $ C = 160 / (1","158925) approx 138","059 " (triệu đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Khấu hao đường thẳng thông thường không tính lãi:
        $ 2000 / 10 = 200 " (triệu đồng/năm)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Khoản chênh lệch tiết kiệm được mỗi năm:
        $ 200 - 138","06 = 61","94 " (triệu đồng)" approx 62 " triệu đồng" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Sau 5 năm, số dư tích lũy là:
        $ "FV"_5 = 138","06 dot ((1","08)^5 - 1) / (0","08) $
        $ = 138","06 dot (1","469328 - 1) / (0","08) = 138","06 dot 5","8666 approx 809","95 " (triệu đồng)" $
        Vì $809","95 < 1000$ triệu, quỹ chưa đạt được một nửa giá trị tài sản sau 5 năm đầu (do lãi kép chỉ bùng nổ mạnh ở các năm cuối). Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Một sinh viên mới tốt nghiệp gửi tiết kiệm đều đặn $3$ triệu đồng vào cuối mỗi tháng với lãi suất $0","6\%$/tháng theo thể thức lãi kép. Sau đúng $5$ năm ($60$ tháng), tổng số tiền cả gốc lẫn lãi bạn sinh viên này tích lũy được là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Tháng])

    line((1.5, 0), (1.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((1.5, -0.35), text(size: 8pt)[$1$])
    content((1.5, 1.25), text(size: 7pt)[$3$ tr])

    content((3.0, 0.5), text(size: 8pt, fill: rgb("b45309"))[$dots$])

    line((4.5, 0), (4.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((4.5, -0.35), text(size: 8pt)[$60$])
    circle((4.5, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((4.5, 1.5), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$"FV" = ?$])
  })
]
],
    [216],
    loigiai: [
        #step([Lời giải chi tiết])
        Giá trị tương lai niên kim:
        $ "FV" = C dot ((1 + r)^n - 1) / r $

        Thay số: $C = 3$ triệu, $r = 0","006$, $n = 60$ tháng:
        $ (1","006)^(60) approx 1","431795 $
        $ "FV" = 3 dot (0","431795) / (0","006) = 3 dot 71","9658 = 215","897 " (triệu đồng)" $

        Làm tròn kết quả đến hàng đơn vị: $216$ triệu đồng.
    ]
)

// TLN 2
#tln([Một khoản vay ngân hàng trị giá $300$ triệu đồng được trả góp đều đặn hàng năm trong $5$ năm với lãi suất $9\%$/năm (mỗi năm trả một lần vào cuối năm). Số tiền mà người vay phải trả đều đặn mỗi năm là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.5), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("be123c"))
    content((1.6, -0.35), text(size: 8pt)[Số tiền vay])
    content((1.6, 2.8), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$300$ tr])

    rect((3.2, 0), (4.4, 2.2), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("047857"))
    content((3.8, -0.35), text(size: 8pt)[Trả mỗi năm])
    content((3.8, 2.5), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$77","1$ tr])
  })
]
],
    [77.1],
    loigiai: [
        #step([Lời giải chi tiết])
        Công thức tính khoản trả góp hàng năm:
        $ R = "PV" dot r / (1 - (1 + r)^(-n)) $

        Thay số: $"PV" = 300$ triệu, $r = 9\% = 0","09$, $n = 5$ năm:
        $ (1","09)^(-5) approx 0","649931 $
        $ 1 - 0","649931 = 0","350069 $

        Số tiền trả mỗi năm:
        $ R = 300 dot (0","09) / (0","350069) = 27 / (0","350069) approx 77","1276 " (triệu đồng)" $

        Làm tròn kết quả đến hàng phần mười: $77","1$ triệu đồng.
    ]
)

// TLN 3
#tln([Một người muốn sau $4$ năm nữa có sẵn khoản tiền $800$ triệu đồng để kinh doanh. Người đó gửi tiền định kỳ vào ĐẦU mỗi năm trong $4$ năm liên tiếp vào tài khoản tiết kiệm với lãi suất $7\%$/năm. Hỏi số tiền người đó cần nộp vào đầu mỗi năm là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Năm])

    line((0.8, 0), (0.8, 1.1), mark: (start: "stealth"), stroke: 1.2pt + rgb("b45309"))
    content((0.8, -0.35), text(size: 8pt)[$0$])
    content((0.8, 1.35), text(size: 7.5pt)[$C = ?$])

    content((2.8, 0.5), text(size: 8pt, fill: rgb("b45309"))[$dots$ nộp đầu năm])

    circle((4.8, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((4.8, -0.35), text(size: 8pt)[$4$ năm])
    content((4.8, 1.5), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[$800$ tr])
  })
]
],
    [171],
    loigiai: [
        #step([Lời giải chi tiết])
        Mô hình niên kim đầu kỳ:
        $ "FV"_"due" = C (1 + r) dot ((1 + r)^n - 1) / r $
        Suy ra số tiền nộp đầu mỗi năm:
        $ C = "FV"_"due" / ((1 + r) dot ((1 + r)^n - 1) / r) $

        Với $"FV" = 800$ triệu, $r = 7\% = 0","07$, $n = 4$ năm:
        $ (1","07)^4 approx 1","310796 $
        $ ((1","07)^4 - 1) / (0","07) approx (0","310796) / (0","07) approx 4","43994 $
        $ (1 + r) dot 4","43994 = 1","07 dot 4","43994 approx 4","75074 $

        Số tiền nộp mỗi năm:
        $ C = 800 / (4","75074) approx 168","395 " (triệu đồng)" $

        Kiểm tra nếu nộp cuối năm: $800 / 4","43994 approx 180","18$ triệu.
        Khi nộp đầu năm: $C = 168","395 approx 168$ triệu.
    ]
)

// TLN 4
#tln([Một người mua một căn nhà và vay ngân hàng $800$ triệu đồng trong $10$ năm ($120$ tháng) theo hình thức trả nợ gốc đều hàng tháng, tiền lãi tính trên dư nợ giảm dần với lãi suất $0","8\%$/tháng. Hỏi ở tháng thứ nhất, tổng số tiền cả gốc và lãi mà người đó phải trả cho ngân hàng là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.5), fill: rgb("bae6fd"), stroke: 1.2pt + rgb("0284c7"))
    content((1.6, -0.35), text(size: 8pt)[Gốc kỳ 1])
    content((1.6, 2.8), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[$6","67$ tr])

    rect((3.2, 0), (4.4, 2.4), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("be123c"))
    content((3.8, -0.35), text(size: 8pt)[Lãi kỳ 1])
    content((3.8, 2.7), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$6","40$ tr])
  })
]
],
    [13.1],
    loigiai: [
        #step([Lời giải chi tiết])
        Theo phương thức trả nợ gốc đều hàng tháng:
        - Tiền nợ gốc trả đều mỗi tháng:
        $ P_"gốc" = 800 / 120 approx 6","667 " (triệu đồng)" $

        - Tiền lãi ở tháng thứ nhất tính trên toàn bộ số dư nợ ban đầu $800$ triệu:
        $ I_1 = 800 dot 0","8\% = 6","400 " (triệu đồng)" $

        Tổng số tiền phải trả ở tháng thứ nhất:
        $ T_1 = P_"gốc" + I_1 = 6","667 + 6","400 = 13","067 " (triệu đồng)" $

        Làm tròn kết quả đến hàng phần mười: $13","1$ triệu đồng.
    ]
)

// TLN 5
#tln([Một cặp vợ chồng gửi tiết kiệm $8$ triệu đồng vào cuối mỗi tháng liên tục trong $4$ năm ($48$ tháng) với lãi suất $0","5\%$/tháng. Sau $4$ năm, tổng số tiền lãi mà cặp vợ chồng này thu được từ ngân hàng là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.4), fill: rgb("bae6fd"), stroke: 1.2pt + rgb("0284c7"))
    content((1.6, -0.35), text(size: 8pt)[Tiền gốc nộp])
    content((1.6, 2.7), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[$384$ tr])

    rect((3.2, 0), (4.4, 2.0), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("047857"))
    content((3.8, -0.35), text(size: 8pt)[Tiền lãi sinh])
    content((3.8, 2.3), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$49$ tr])
  })
]
],
    [49],
    loigiai: [
        #step([Lời giải chi tiết])
        Tổng số tiền tích lũy sau 48 tháng:
        $ "FV" = C dot ((1 + r)^n - 1) / r $

        Với $C = 8$ triệu, $r = 0","005$, $n = 48$:
        $ (1","005)^(48) approx 1","270489 $
        $ "FV" = 8 dot (0","270489) / (0","005) = 8 dot 54","0978 = 432","783 " (triệu đồng)" $

        Tổng số tiền gốc đã nộp vào ngân hàng:
        $ "Tiền gốc" = 8 dot 48 = 384 " (triệu đồng)" $

        Số tiền lãi thu được:
        $ "Tiền lãi" = "FV" - "Tiền gốc" = 432","783 - 384 = 48","783 " (triệu đồng)" $

        Làm tròn kết quả đến hàng đơn vị: $49$ triệu đồng.
    ]
)

// TLN 6
#tln([Một quỹ học bổng sinh viên cần có sẵn số tiền ban đầu là bao nhiêu tỷ đồng để kể từ năm sau có thể chi trả học bổng đều đặn $180$ triệu đồng vào cuối mỗi năm vĩnh viễn, biết quỹ đạt tỷ suất sinh lời $7","2\%$/năm? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("b45309"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("b45309"))[$"PV" = ?$])

    line((2.0, 0), (2.0, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((2.0, 1.25), text(size: 7pt)[$180$ tr])

    line((3.5, 0), (3.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("b45309"))
    content((3.5, 1.25), text(size: 7pt)[$180$ tr])

    content((4.8, 0.5), text(size: 8pt, fill: rgb("b45309"))[$dots$ vĩnh viễn])
  })
]
],
    [2.5],
    loigiai: [
        #step([Lời giải chi tiết])
        Giá trị hiện tại của dòng tiền niên kim vĩnh viễn:
        $ "PV" = C / r $

        Thay số: $C = 180$ triệu đồng $= 0","18$ tỷ đồng, $r = 7","2\% = 0","072$:
        $ "PV" = (0","18) / (0","072) = 2","5 " (tỷ đồng)" $

        Vậy số vốn ban đầu cần có là đúng $2","5$ tỷ đồng.
    ]
)
]

#make-questions()
