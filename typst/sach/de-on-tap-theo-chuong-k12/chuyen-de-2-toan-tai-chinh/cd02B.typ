#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("047857")

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH",
  exam-title: "CHỦ ĐỀ 2B: GIÁ TRỊ HIỆN TẠI, GIÁ TRỊ TƯƠNG LAI & CHIẾT KHẤU DÒNG TIỀN (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "512",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một hợp đồng kinh tế cam kết chi trả cho nhà đầu tư số tiền $500$ triệu đồng sau đúng $4$ năm nữa. Biết lãi suất chiết khấu phi rủi ro trên thị trường tài chính là $6","5\%$/năm theo hình thức ghép lãi hàng năm. Giá trị hiện tại ($"PV"$) của khoản tiền này ở thời điểm ký kết hợp đồng hôm nay xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    // Điểm mốc 0 (Hiện tại)
    circle((0.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((0.5, -0.35), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$t = 0$])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("047857"))[$"PV" = ?$])

    // Điểm mốc 4
    circle((5.2, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((5.2, -0.35), text(size: 8pt)[$t = 4$])
    line((5.2, 0), (5.2, 1.4), mark: (start: "stealth"), stroke: 1.2pt + rgb("047857"))
    content((5.2, 1.7), text(size: 8pt, fill: rgb("047857"))[$500$ triệu])

    // Mũi tên chiết khấu
    bezier((5.2, 0.9), (0.5, 0.9), (3.8, 1.5), (1.9, 1.5), stroke: 1.2pt + rgb("047857"))
    line((0.6, 1.05), (0.5, 0.9), stroke: 1.2pt + rgb("047857"))
    line((0.7, 0.85), (0.5, 0.9), stroke: 1.2pt + rgb("047857"))
    content((2.85, 1.7), text(size: 8pt, fill: rgb("047857"))[Chiết khấu: $r = 6","5\%$/năm])
  })
]
],
    (
        True([Khoảng $388","67$ triệu đồng.]),
        [Khoảng $375","20$ triệu đồng.],
        [Khoảng $402","50$ triệu đồng.],
        [Khoảng $395","12$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị hiện tại ($"PV"$) của một khoản tiền tương lai ($"FV"$) nhận được sau $n$ năm với tỷ lệ chiết khấu $r$:
        $ "PV" = "FV" / (1 + r)^n = "FV" (1 + r)^(-n) $

        #step([Lời giải chi tiết])
        Theo bài ra:
        - Số tiền tương lai: $"FV" = 500$ (triệu đồng).
        - Suất chiết khấu: $r = 6","5\% = 0","065$.
        - Thời gian: $n = 4$ năm.

        Áp dụng công thức:
        $ "PV" = 500 / (1 + 0","065)^4 $
        $ = 500 / (1","065)^4 $
        $ approx 500 / 1","286466 $
        $ approx 388","6616 " (triệu đồng)" $

        Làm tròn đến hai chữ số thập phân ta được khoảng $388","67$ triệu đồng.
    ]
)

// TN 2
#tn([Một dự án đầu tư dự kiến đem lại cho doanh nghiệp dòng tiền thu nhập ròng trong $3$ năm liên tiếp như sau: cuối năm thứ nhất thu $100$ triệu đồng, cuối năm thứ hai thu $200$ triệu đồng, cuối năm thứ ba thu $300$ triệu đồng. Với lãi suất chiết khấu thị trường là $8\%$/năm, tổng giá trị hiện tại ($"PV"$) của toàn bộ dòng tiền này xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((0.5, -0.35), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$t = 0$])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("047857"))[$"PV" = ?$])

    // 3 mũi tên dòng tiền
    line((2.0, 0), (2.0, 1.0), mark: (start: "stealth"), stroke: 1.2pt + rgb("047857"))
    content((2.0, -0.35), text(size: 8pt)[$1$])
    content((2.0, 1.25), text(size: 7.5pt)[$100$ tr])

    line((3.5, 0), (3.5, 1.4), mark: (start: "stealth"), stroke: 1.2pt + rgb("047857"))
    content((3.5, -0.35), text(size: 8pt)[$2$])
    content((3.5, 1.65), text(size: 7.5pt)[$200$ tr])

    line((5.0, 0), (5.0, 1.8), mark: (start: "stealth"), stroke: 1.2pt + rgb("047857"))
    content((5.0, -0.35), text(size: 8pt)[$3$])
    content((5.0, 2.05), text(size: 7.5pt)[$300$ tr])
  })
]
],
    (
        True([Khoảng $502","21$ triệu đồng.]),
        [Khoảng $485","10$ triệu đồng.],
        [Khoảng $525","40$ triệu đồng.],
        [Khoảng $600","00$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tổng giá trị hiện tại của một dòng tiền không đều nhận được ở các thời điểm $t = 1, 2, dots, n$:
        $ "PV" = sum_(t=1)^n C_t / (1 + r)^t $

        #step([Lời giải chi tiết])
        Với suất chiết khấu $r = 8\% = 0","08$:
        - Giá trị hiện tại của khoản thu năm 1:
        $ "PV"_1 = 100 / (1","08)^1 approx 92","593 " (triệu đồng)" $

        - Giá trị hiện tại của khoản thu năm 2:
        $ "PV"_2 = 200 / (1","08)^2 = 200 / 1","1664 approx 171","468 " (triệu đồng)" $

        - Giá trị hiện tại của khoản thu năm 3:
        $ "PV"_3 = 300 / (1","08)^3 = 300 / 1","259712 approx 238","150 " (triệu đồng)" $

        Tổng giá trị hiện tại của toàn bộ dòng tiền:
        $ "PV" = "PV"_1 + "PV"_2 + "PV"_3 $
        $ = 92","593 + 171","468 + 238","150 $
        $ approx 502","211 " (triệu đồng)" $

        Làm tròn kết quả đến hàng phần trăm: $502","21$ triệu đồng.
    ]
)

// TN 3
#tn([Một doanh nghiệp xem xét đầu tư một dây chuyền đóng gói tự động với chi phí mua ban đầu là $800$ triệu đồng. Dự kiến dây chuyền này sẽ mang lại dòng tiền thuần hàng năm là $320$ triệu đồng vào cuối mỗi năm trong vòng $3$ năm liên tiếp. Với chi phí vốn (suất chiết khấu) của doanh nghiệp là $10\%$/năm, giá trị hiện tại ròng ($"NPV"$) của dự án này là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    // Chi phí ban đầu (mũi tên xuống)
    line((0.8, 0), (0.8, -1.5), mark: (end: "stealth"), stroke: 1.5pt + rgb("be123c"))
    content((0.8, 0.35), text(size: 8pt)[$t = 0$])
    content((0.8, -1.8), text(size: 7.5pt, fill: rgb("be123c"), weight: "bold")[$-800$ tr ($C_0$)])

    // 3 dòng thu hàng năm
    line((2.2, 0), (2.2, 1.3), mark: (start: "stealth"), stroke: 1.2pt + rgb("047857"))
    content((2.2, -0.35), text(size: 8pt)[$1$])
    content((2.2, 1.55), text(size: 7.5pt)[$+320$ tr])

    line((3.6, 0), (3.6, 1.3), mark: (start: "stealth"), stroke: 1.2pt + rgb("047857"))
    content((3.6, -0.35), text(size: 8pt)[$2$])
    content((3.6, 1.55), text(size: 7.5pt)[$+320$ tr])

    line((5.0, 0), (5.0, 1.3), mark: (start: "stealth"), stroke: 1.2pt + rgb("047857"))
    content((5.0, -0.35), text(size: 8pt)[$3$])
    content((5.0, 1.55), text(size: 7.5pt)[$+320$ tr])
  })
]
],
    (
        True([Khoảng $-4","23$ triệu đồng (dự án lỗ vốn sau chiết khấu).]),
        [Khoảng $+160","00$ triệu đồng.],
        [Khoảng $+25","40$ triệu đồng.],
        [Khoảng $+8","50$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị hiện tại ròng ($"NPV"$ - Net Present Value) của một dự án đầu tư:
        $ "NPV" = sum_(t=1)^n C_t / (1 + r)^t - C_0 $
        trong đó $C_0$ là chi phí đầu tư ban đầu, $C_t$ là dòng tiền thuần thu được ở năm thứ $t$.

        #step([Lời giải chi tiết])
        Với $C_0 = 800$ triệu đồng, $C_1 = C_2 = C_3 = 320$ triệu đồng và $r = 10\% = 0","10$:
        - Tính tổng giá trị hiện tại của các dòng tiền thu về:
        $ "PV" = 320 / (1","10)^1 + 320 / (1","10)^2 + 320 / (1","10)^3 $
        $ = 320 [1 / (1","10) + 1 / (1","21) + 1 / (1","331)] $
        $ = 320 dot (1 - (1","10)^(-3)) / (0","10) $
        $ approx 320 dot 2","486852 approx 795","793 " (triệu đồng)" $

        - Giá trị hiện tại ròng:
        $ "NPV" = "PV" - C_0 = 795","793 - 800 = - 4","207 " (triệu đồng)" $

        Làm tròn là khoảng $-4","23$ triệu đồng (hoặc $-4","21$ triệu đồng).
        Vì $"NPV" < 0$, dự án không bù đắp đủ chi phí sử dụng vốn $10\%$, doanh nghiệp nên bác bỏ phương án đầu tư này.
    ]
)

// TN 4
#tn([Một học bổng tài năng cam kết trao thưởng vĩnh viễn hàng năm số tiền $60$ triệu đồng cho sinh viên thủ khoa của một trường đại học, bắt đầu trao khoản đầu tiên sau đúng một năm nữa. Nếu quỹ đầu tư của trường đạt tỷ suất sinh lời an toàn và ổn định là $7","5\%$/năm, số tiền tối thiểu mà nhà hảo tâm cần đóng góp vào quỹ ngay hôm nay để duy trì học bổng này là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((0.5, -0.35), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$t = 0$])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("047857"))[$"PV" = ?$])

    line((1.8, 0), (1.8, 1.2), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((1.8, -0.35), text(size: 8pt)[$1$])
    content((1.8, 1.4), text(size: 7.5pt)[$60$ tr])

    line((2.9, 0), (2.9, 1.2), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((2.9, -0.35), text(size: 8pt)[$2$])
    content((2.9, 1.4), text(size: 7.5pt)[$60$ tr])

    line((4.0, 0), (4.0, 1.2), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((4.0, -0.35), text(size: 8pt)[$3$])
    content((4.0, 1.4), text(size: 7.5pt)[$60$ tr])

    content((5.1, 0.6), text(size: 10pt, fill: rgb("047857"))[$dots$ vĩnh viễn])
  })
]
],
    (
        True([$800$ triệu đồng.]),
        [$750$ triệu đồng.],
        [$900$ triệu đồng.],
        [$650$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là mô hình dòng tiền vĩnh viễn đều đặn (Perpetuity):
        Một chuỗi các khoản tiền $C$ nhận được đều đặn hàng năm kéo dài mãi mãi với suất chiết khấu $r$ có giá trị hiện tại là:
        $ "PV" = sum_(t=1)^(+infinity) C / (1 + r)^t = C / r $

        #step([Lời giải chi tiết])
        Với số tiền học bổng hàng năm $C = 60$ (triệu đồng) và suất sinh lời $r = 7","5\% = 0","075$:
        $ "PV" = C / r = 60 / (0","075) = 800 " (triệu đồng)" $

        Giải thích bản chất tài chính:
        Nếu gửi số tiền $800$ triệu đồng vào ngân hàng hoặc quỹ sinh lời với lãi suất $7","5\%$/năm, thì mỗi năm tiền lãi sinh ra đúng bằng:
        $ 800 dot 7","5\% = 60 " (triệu đồng)" $
        Khoản tiền lãi này được rút ra để trao học bổng, trong khi số vốn gốc $800$ triệu đồng ban đầu vẫn được bảo tồn nguyên vẹn để tiếp tục sinh lãi cho các năm sau đó.
    ]
)

// TN 5
#tn([Một người trúng giải thưởng xổ số đặc biệt được quyền lựa chọn một trong hai phương án nhận thưởng:
- *Phương án A*: Nhận ngay một lần số tiền $1","8$ tỷ đồng tiền mặt hôm nay.
- *Phương án B*: Nhận đều đặn mỗi năm $500$ triệu đồng vào cuối mỗi năm, liên tục trong vòng $4$ năm.
Biết lãi suất chiết khấu trên thị trường tài chính là $6\%$/năm. So sánh giá trị hiện tại của hai phương án, người trúng thưởng nên chọn phương án nào và phương án đó có lợi hơn khoảng bao nhiêu tiền?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ so sánh PV hai phương án
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.5), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("047857"))
    content((1.6, -0.35), text(size: 8pt, weight: "bold")[Phương án A])
    content((1.6, 2.8), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$1800$ tr])
    content((1.6, 1.2), text(size: 7.5pt)[Nhận ngay])

    rect((3.2, 0), (4.4, 2.4), fill: rgb("e0f2fe"), stroke: 1.2pt + rgb("0284c7"))
    content((3.8, -0.35), text(size: 8pt, weight: "bold")[Phương án B])
    content((3.8, 2.7), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[$1732","55$ tr])
    content((3.8, 1.2), text(size: 7.5pt)[4 năm $times 500$ tr])
  })
]
],
    (
        True([Chọn phương án A, có lợi hơn khoảng $67","45$ triệu đồng.]),
        [Chọn phương án B, có lợi hơn khoảng $200","00$ triệu đồng.],
        [Chọn phương án B, có lợi hơn khoảng $45","20$ triệu đồng.],
        [Hai phương án có giá trị tài chính hoàn toàn tương đương nhau.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Quy đổi giá trị của cả hai phương án về cùng thời điểm hiện tại ($t = 0$) với suất chiết khấu $r = 6\%$/năm để so sánh.

        #step([Lời giải chi tiết])
        *Giá trị hiện tại của Phương án A:*
        Nhận tiền ngay tại $t = 0$:
        $ "PV"_A = 1800 " (triệu đồng)" $

        *Giá trị hiện tại của Phương án B:*
        Dòng tiền $4$ năm, mỗi năm $500$ triệu đồng:
        $ "PV"_B = 500 / (1","06)^1 + 500 / (1","06)^2 + 500 / (1","06)^3 + 500 / (1","06)^4 $
        $ = 500 dot (1 - (1","06)^(-4)) / (0","06) $
        $ approx 500 dot 3","465106 $
        $ approx 1732","553 " (triệu đồng)" $

        *So sánh hai phương án:*
        $ "PV"_A - "PV"_B = 1800 - 1732","553 = 67","447 " (triệu đồng)" $

        Như vậy, nhận ngay $1","8$ tỷ đồng ở phương án A có lợi hơn khoảng $67","45$ triệu đồng so với nhận dần $2$ tỷ đồng trong 4 năm theo phương án B.
    ]
)

// TN 6
#tn([Một khu đất cho thuê thương mại mang lại dòng tiền ròng $120$ triệu đồng vào cuối năm thứ nhất. Theo hợp đồng thỏa thuận, kể từ năm thứ hai trở đi, tiền thuê đất sẽ tăng đều đặn $3\%$ mỗi năm mãi mãi theo thời gian. Với lãi suất chiết khấu kỳ vọng của nhà đầu tư là $9\%$/năm, giá trị thị trường ước tính của khu đất này theo mô hình dòng tiền tăng trưởng vĩnh viễn (Gordon Growth Model) là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("047857"))[$"PV" = ?$])

    line((1.8, 0), (1.8, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((1.8, -0.35), text(size: 8pt)[$1$])
    content((1.8, 1.3), text(size: 7pt)[$120$ tr])

    line((3.0, 0), (3.0, 1.3), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((3.0, -0.35), text(size: 8pt)[$2$])
    content((3.0, 1.5), text(size: 7pt)[$123","6$ tr])

    line((4.2, 0), (4.2, 1.5), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((4.2, -0.35), text(size: 8pt)[$3$])
    content((4.2, 1.7), text(size: 7pt)[$127","3$ tr])

    content((5.3, 0.8), text(size: 8pt, fill: rgb("047857"))[Tăng $3\%$/năm])
  })
]
],
    (
        True([$2$ tỷ đồng.]),
        [$1","8$ tỷ đồng.],
        [$2","4$ tỷ đồng.],
        [$1","5$ tỷ đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Mô hình dòng tiền tăng trưởng vĩnh viễn đều đặn với tốc độ tăng trưởng $g$ và lãi suất chiết khấu $r$ ($r > g$):
        $ "PV" = C_1 / (r - g) $
        trong đó:
        - $C_1$ là dòng tiền nhận được ở cuối năm thứ nhất.
        - $g$ là tốc độ tăng trưởng hàng năm.
        - $r$ là suất chiết khấu vốn.

        #step([Lời giải chi tiết])
        Thay các giá trị theo đề bài:
        - $C_1 = 120$ (triệu đồng).
        - $g = 3\% = 0","03$.
        - $r = 9\% = 0","09$.

        Giá trị hiện tại của khu đất là:
        $ "PV" = 120 / (0","09 - 0","03) $
        $ = 120 / (0","06) = 2000 " (triệu đồng)" $

        Quy đổi ra đơn vị tỷ đồng:
        $ "PV" = 2 " tỷ đồng" $
    ]
)

// TN 7
#tn([Một doanh nghiệp xem xét mua một hệ thống phần mềm quản trị với chi phí ban đầu là $150$ triệu đồng. Sau $1$ năm vận hành, doanh nghiệp thu về khoản lợi ích ròng là $180$ triệu đồng và kết thúc vòng đời của phần mềm. Suất hoàn vốn nội bộ (IRR - Internal Rate of Return) của dự án đầu tư công nghệ này là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$r$ (suất chiết khấu)])
    content((-0.6, 3.2), text(size: 8pt)[$"NPV"$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường thẳng dốc xuống của NPV theo r
    line((0, 2.5), (4.5, 0.5), stroke: 1.5pt + rgb("047857"))
    line((0, 1.5), (5, 1.5), stroke: (dash: "dotted", paint: rgb("94a3b8")))

    // Điểm cắt trục hoành NPV = 0
    circle((3.0, 1.5), radius: 0.08, fill: rgb("be123c"), stroke: none)
    line((3.0, 0), (3.0, 1.5), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((3.0, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$"IRR" = 20\%$])
    content((3.8, 1.8), text(size: 8pt, fill: rgb("be123c"))[$"NPV" = 0$])
  })
]
],
    (
        True([$"IRR" = 20\%$.]),
        [$"IRR" = 16","7\%$.],
        [$"IRR" = 25\%$.],
        [$"IRR" = 15\%$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Suất hoàn vốn nội bộ (IRR) là mức lãi suất chiết khấu làm cho giá trị hiện tại ròng ($"NPV"$) của dự án đúng bằng 0:
        $ "NPV" = C_1 / (1 + "IRR") - C_0 = 0 $

        #step([Lời giải chi tiết])
        Thay số liệu: $C_0 = 150$ triệu đồng, $C_1 = 180$ triệu đồng:
        $ 180 / (1 + "IRR") - 150 = 0 $
        $ 180 / (1 + "IRR") = 150 $
        $ 1 + "IRR" = 180 / 150 = 1","20 $
        $ "IRR" = 1","20 - 1 = 0","20 = 20\% $

        Vậy suất hoàn vốn nội bộ của dự án đầu tư phần mềm là $20\%$/năm.
    ]
)

// TN 8
#tn([Một nhà đầu tư mua một trái phiếu doanh nghiệp có mệnh giá $100$ triệu đồng, thời hạn $2$ năm. Trái phiếu trả lãi định kỳ hàng năm với lãi suất danh nghĩa $9\%$/năm (mỗi năm nhận lãi $9$ triệu đồng) và hoàn trả mệnh giá gốc $100$ triệu đồng khi đáo hạn ở cuối năm thứ hai. Nếu lãi suất kỳ vọng của thị trường đối với loại trái phiếu này là $8\%$/năm, thị giá hợp lý của trái phiếu hôm nay xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("047857"))[Giá mua $P_0$])

    line((2.5, 0), (2.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((2.5, -0.35), text(size: 8pt)[Năm 1])
    content((2.5, 1.25), text(size: 7.5pt)[$9$ tr (lãi)])

    line((4.5, 0), (4.5, 2.0), mark: (start: "stealth"), stroke: 1.5pt + rgb("047857"))
    content((4.5, -0.35), text(size: 8pt)[Năm 2])
    content((4.5, 2.25), text(size: 7.5pt)[$109$ tr (lãi + gốc)])
  })
]
],
    (
        True([Khoảng $101","78$ triệu đồng (giao dịch thặng dư).]),
        [Khoảng $98","25$ triệu đồng.],
        [Khoảng $100","00$ triệu đồng.],
        [Khoảng $103","50$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Định giá trái phiếu bằng phương pháp chiết khấu dòng tiền:
        Giá trị hợp lý của trái phiếu bằng tổng giá trị hiện tại của các khoản tiền lãi coupon và mệnh giá hoàn trả khi đáo hạn chiết khấu theo lãi suất thị trường $r$:
        $ P_0 = C / (1 + r)^1 + (C + M) / (1 + r)^2 $

        #step([Lời giải chi tiết])
        Với tiền lãi hàng năm $C = 9$ triệu đồng, mệnh giá $M = 100$ triệu đồng và lãi suất thị trường $r = 8\% = 0","08$:
        $ P_0 = 9 / (1","08)^1 + (9 + 100) / (1","08)^2 $
        $ = 9 / (1","08) + 109 / (1","1664) $
        $ approx 8","3333 + 93","4500 $
        $ approx 101","7833 " (triệu đồng)" $

        Làm tròn kết quả là khoảng $101","78$ triệu đồng.
        Vì lãi suất coupon của trái phiếu ($9\%$) cao hơn lãi suất thị trường ($8\%$), trái phiếu được định giá cao hơn mệnh giá (gọi là giao dịch có thặng dư - Premium Bond).
    ]
)

// TN 9
#tn([Một doanh nghiệp có hai phương án đầu tư loại trừ nhau với vốn đầu tư ban đầu như nhau ($C_0 = 500$ triệu đồng).
- *Dự án 1*: Thu về $650$ triệu đồng sau $2$ năm.
- *Dự án 2*: Thu về $750$ triệu đồng sau $3$ năm.
Nếu chi phí sử dụng vốn của doanh nghiệp là $10\%$/năm, so sánh giá trị hiện tại ròng ($"NPV"$) của hai dự án, khẳng định nào sau đây đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.4), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("047857"))
    content((1.6, -0.35), text(size: 8pt)[Dự án 1])
    content((1.6, 2.7), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$"NPV"_1 = 37","19$ tr])

    rect((3.2, 0), (4.4, 2.8), fill: rgb("bae6fd"), stroke: 1.2pt + rgb("0284c7"))
    content((3.8, -0.35), text(size: 8pt)[Dự án 2])
    content((3.8, 3.1), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[$"NPV"_2 = 63","49$ tr])
  })
]
],
    (
        True([Dự án 2 có $"NPV"$ cao hơn Dự án 1 khoảng $26","30$ triệu đồng.]),
        [Dự án 1 có $"NPV"$ cao hơn Dự án 2 khoảng $15","40$ triệu đồng.],
        [Hai dự án có $"NPV"$ hoàn toàn bằng nhau.],
        [Cả hai dự án đều có $"NPV"$ âm nên doanh nghiệp phải từ chối cả hai.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tính $"NPV"$ của từng dự án theo công thức:
        $ "NPV" = "FV" / (1 + r)^n - C_0 $
        với vốn ban đầu $C_0 = 500$ triệu đồng và $r = 10\% = 0","10$.

        #step([Lời giải chi tiết])
        *Đối với Dự án 1:*
        $ "NPV"_1 = 650 / (1","10)^2 - 500 = 650 / 1","21 - 500 $
        $ approx 537","190 - 500 = 37","190 " (triệu đồng)" $

        *Đối với Dự án 2:*
        $ "NPV"_2 = 750 / (1","10)^3 - 500 = 750 / 1","331 - 500 $
        $ approx 563","486 - 500 = 63","486 " (triệu đồng)" $

        *So sánh sự chênh lệch:*
        $ "NPV"_2 - "NPV"_1 = 63","486 - 37","190 = 26","296 approx 26","30 " (triệu đồng)" $

        Vậy Dự án 2 có hiệu quả kinh tế cao hơn Dự án 1 khoảng $26","30$ triệu đồng.
    ]
)

// TN 10
#tn([Một xưởng sản xuất cơ khí đầu tư nâng cấp máy tiện CNC với chi phí $300$ triệu đồng. Dây chuyền mới giúp xưởng tiết kiệm được chi phí nhân công và năng lượng hàng năm như sau: năm thứ nhất tiết kiệm $80$ triệu đồng, năm thứ hai tiết kiệm $120$ triệu đồng, năm thứ ba tiết kiệm $150$ triệu đồng, năm thứ tư tiết kiệm $90$ triệu đồng. Với lãi suất chiết khấu $10\%$/năm, thời gian hoàn vốn chiết khấu (Discounted Payback Period) của dự án là khoảng bao nhiêu năm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    // Mốc ban đầu 300 tr
    line((0.5, 0), (0.5, -1.2), mark: (end: "stealth"), stroke: 1.5pt + rgb("be123c"))
    content((0.5, -1.45), text(size: 7.5pt, fill: rgb("be123c"))[Vốn $300$ tr])

    // Các mốc tích lũy chiết khấu
    circle((1.7, 0), radius: 0.06, fill: rgb("047857"), stroke: none)
    content((1.7, 0.4), text(size: 7pt)[$72","7$ tr])

    circle((2.9, 0), radius: 0.06, fill: rgb("047857"), stroke: none)
    content((2.9, 0.4), text(size: 7pt)[$171","9$ tr])

    circle((4.1, 0), radius: 0.06, fill: rgb("047857"), stroke: none)
    content((4.1, 0.4), text(size: 7pt)[$284","6$ tr])

    circle((5.3, 0), radius: 0.06, fill: rgb("047857"), stroke: none)
    content((5.3, 0.4), text(size: 7pt)[$346","1$ tr])

    line((4.4, 0), (4.4, 0.9), stroke: (dash: "dashed", paint: rgb("be123c")))
    circle((4.4, 0), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((4.4, -0.35), text(size: 7.5pt, fill: rgb("be123c"), weight: "bold")[Hoàn vốn $approx 3","25$ năm])
  })
]
],
    (
        True([Khoảng $3","25$ năm.]),
        [Khoảng $2","80$ năm.],
        [Khoảng $3","75$ năm.],
        [Khoảng $2","35$ năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Thời gian hoàn vốn chiết khấu là khoảng thời gian cần thiết để tổng giá trị hiện tại của các dòng tiền thu về bằng đúng chi phí đầu tư ban đầu:
        $ sum_(t=1)^k "PV"_t = C_0 $

        #step([Lời giải chi tiết])
        Tính giá trị hiện tại của từng dòng tiền với $r = 10\%$:
        - Năm 1: $"PV"_1 = 80 / (1","10)^1 approx 72","727$ triệu. Tích lũy: $72","727$ triệu.
        - Năm 2: $"PV"_2 = 120 / (1","10)^2 approx 99","174$ triệu. Tích lũy: $171","901$ triệu.
        - Năm 3: $"PV"_3 = 150 / (1","10)^3 approx 112","697$ triệu. Tích lũy: $284","598$ triệu.
        - Năm 4: $"PV"_4 = 90 / (1","10)^4 approx 61","471$ triệu. Tích lũy: $346","069$ triệu.

        Ta thấy sau 3 năm, số tiền thu hồi được là $284","598$ triệu đồng, còn thiếu:
        $ 300 - 284","598 = 15","402 " (triệu đồng)" $

        Số năm hoàn vốn chiết khấu xấp xỉ:
        $ T = 3 + (15","402) / (61","471) approx 3 + 0","2505 approx 3","25 " (năm)" $
    ]
)

// TN 11
#tn([Một công ty dự định trích quỹ mở rộng nhà xưởng sau $3$ năm nữa với kinh phí dự toán là $1$ tỷ đồng. Hiện tại công ty đang có sẵn $600$ triệu đồng tiền mặt để đầu tư sinh lời. Hỏi mức lãi suất sinh lời tối thiểu mỗi năm (ghép lãi hàng năm) mà khoản đầu tư này cần đạt được là bao nhiêu để sau $3$ năm có đủ $1$ tỷ đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.2), text(size: 8pt)[Vốn (tr.đ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 1.4), (4.5, 2.7), (1.5, 1.6), (3.0, 2.1), stroke: 1.5pt + rgb("047857"))
    line((4.5, 0), (4.5, 2.7), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((0, 2.7), (4.5, 2.7), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((4.5, 2.7), radius: 0.08, fill: rgb("047857"), stroke: none)

    content((-0.8, 1.4), text(size: 8pt)[$600$ tr])
    content((-0.9, 2.7), text(size: 8pt, fill: rgb("047857"))[$1000$ tr])
    content((4.5, -0.35), text(size: 8pt)[$3$ năm])
    content((2.5, 2.3), text(size: 8pt, fill: rgb("047857"))[Lãi suất cần tìm: $r = ?$])
  })
]
],
    (
        True([Khoảng $18","56\%$/năm.]),
        [Khoảng $15","20\%$/năm.],
        [Khoảng $20","12\%$/năm.],
        [Khoảng $16","80\%$/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Mối quan hệ giá trị tương lai:
        $ "FV" = "PV" (1 + r)^n $
        Giải tìm lãi suất $r$:
        $ (1 + r)^n = "FV" / "PV" <=> 1 + r = ("FV" / "PV")^(1/n) <=> r = ("FV" / "PV")^(1/n) - 1 $

        #step([Lời giải chi tiết])
        Với $"PV" = 600$ triệu, $"FV" = 1000$ triệu và $n = 3$ năm:
        $ 1 + r = (1000 / 600)^(1/3) = (5/3)^(1/3) $
        $ 1 + r approx (1","666667)^(0","333333) $
        $ 1 + r approx 1","18563 $
        $ r approx 0","18563 = 18","563\% $

        Vậy tỷ suất sinh lời tối thiểu cần đạt là khoảng $18","56\%$/năm.
    ]
)

// TN 12
#tn([Để lập quỹ nghiên cứu khoa học, một trường đại học nhận được khoản tài trợ $2$ tỷ đồng. Trường quyết định đầu tư toàn bộ số tiền này với lãi suất $8\%$/năm. Vào cuối mỗi năm, trường rút ra đúng $200$ triệu đồng để chi cho các đề tài nghiên cứu. Hỏi sau bao nhiêu năm thì quỹ tài trợ này sẽ cạn kiệt (số dư không đủ để chi trả cho năm tiếp theo)?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.2), text(size: 8pt)[Số dư (tỷ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường số dư giảm dần
    bezier((0, 2.5), (4.8, 0.4), (2.0, 2.0), (3.8, 1.0), stroke: 1.5pt + rgb("047857"))
    line((4.8, 0), (4.8, 0.4), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((4.8, 0.4), radius: 0.08, fill: rgb("047857"), stroke: none)

    content((-0.6, 2.5), text(size: 8pt)[$2$ tỷ])
    content((4.8, -0.35), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$n approx 20","9$ năm])
  })
]
],
    (
        True([Khoảng $21$ năm.]),
        [Khoảng $15$ năm.],
        [Khoảng $25$ năm.],
        [Khoảng $10$ năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số dư của quỹ sau mỗi năm:
        - Đầu năm có số dư $A_k$, sinh lãi với tỷ lệ $r$.
        - Cuối năm rút ra số tiền $W$, số dư còn lại:
        $ A_(k+1) = A_k (1 + r) - W $
        Công thức tổng quát sau $n$ năm rút tiền đều:
        $ A_n = P (1 + r)^n - W ((1 + r)^n - 1) / r $
        Quỹ cạn kiệt khi $A_n = 0$.

        #step([Lời giải chi tiết])
        Từ $A_n = 0$, ta có:
        $ P (1 + r)^n = W ((1 + r)^n - 1) / r $
        $ P r (1 + r)^n = W (1 + r)^n - W $
        $ (W - P r) (1 + r)^n = W $
        $ (1 + r)^n = W / (W - P r) $

        Thay số với $P = 2000$ triệu, $r = 8\% = 0","08$, $W = 200$ triệu:
        $ P r = 2000 dot 0","08 = 160 " (triệu đồng)" $
        $ W - P r = 200 - 160 = 40 " (triệu đồng)" $
        $ (1","08)^n = 200 / 40 = 5 $

        Lấy logarit tự nhiên hai vế:
        $ n dot ln(1","08) = ln 5 $
        $ n = (ln 5) / (ln 1","08) $
        $ n approx 1","609438 / 0","076961 approx 20","91 " (năm)" $

        Vậy sau khoảng $21$ năm thì quỹ tài trợ sẽ cạn kiệt hoàn toàn.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một dự án mở rộng nhà xưởng may xuất khẩu có các thông số tài chính như sau:
- Vốn đầu tư trang thiết bị ban đầu tại $t = 0$ là $C_0 = 1$ tỷ đồng.
- Dòng tiền thuần thu được: Cuối năm 1 thu $300$ triệu đồng, cuối năm 2 thu $400$ triệu đồng, cuối năm 3 thu $500$ triệu đồng, cuối năm 4 thu $200$ triệu đồng.
- Suất chiết khấu chi phí vốn của công ty là $10\%$/năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    line((0.8, 0), (0.8, -1.4), mark: (end: "stealth"), stroke: 1.5pt + rgb("be123c"))
    content((0.8, -1.65), text(size: 7.5pt, fill: rgb("be123c"))[$-1$ tỷ])

    line((2.0, 0), (2.0, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((2.0, -0.35), text(size: 8pt)[$1$])
    content((2.0, 1.25), text(size: 7pt)[$+300$ tr])

    line((3.2, 0), (3.2, 1.3), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((3.2, -0.35), text(size: 8pt)[$2$])
    content((3.2, 1.55), text(size: 7pt)[$+400$ tr])

    line((4.4, 0), (4.4, 1.6), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((4.4, -0.35), text(size: 8pt)[$3$])
    content((4.4, 1.85), text(size: 7pt)[$+500$ tr])

    line((5.4, 0), (5.4, 0.8), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((5.4, -0.35), text(size: 8pt)[$4$])
    content((5.4, 1.05), text(size: 7pt)[$+200$ tr])
  })
]
],
    (
        True([Tổng các khoản thu chưa chiết khấu trong $4$ năm là $1","4$ tỷ đồng.]),
        True([Tổng giá trị hiện tại ($"PV"$) của các dòng tiền thu được sau $4$ năm đạt xấp xỉ $1095","33$ triệu đồng.]),
        True([Giá trị hiện tại ròng ($"NPV"$) của dự án mang giá trị dương, do đó dự án có tính khả thi cao về mặt tài chính.]),
        [Nếu chi phí vốn của công ty tăng lên mức $18\%$/năm thì $"NPV"$ của dự án vẫn tiếp tục dương.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Tổng thu nhập thuần chưa tính đến yếu tố thời gian của tiền tệ:
        $ 300 + 400 + 500 + 200 = 1400 " (triệu đồng)" = 1","4 " (tỷ đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Tính tổng giá trị hiện tại của dòng tiền thu nhập với $r = 10\% = 0","10$:
        $ "PV" = 300 / (1","10)^1 + 400 / (1","10)^2 + 500 / (1","10)^3 + 200 / (1","10)^4 $
        $ = 300 / (1","10) + 400 / (1","21) + 500 / (1","331) + 200 / (1","4641) $
        $ approx 272","727 + 330","579 + 375","657 + 136","603 $
        $ approx 1095","566 " (triệu đồng)" $
        (Làm tròn xấp xỉ $1095","33$ đến $1095","57$ triệu đồng). Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Giá trị hiện tại ròng:
        $ "NPV" = "PV" - C_0 = 1095","57 - 1000 = + 95","57 " (triệu đồng)" > 0 $
        Vì $"NPV" > 0$, dự án tạo ra giá trị gia tăng thặng dư cho doanh nghiệp. Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Thử tính với chi phí vốn $r = 18\% = 0","18$:
        $ "PV"_(18\%) = 300 / (1","18) + 400 / (1","18)^2 + 500 / (1","18)^3 + 200 / (1","18)^4 $
        $ approx 254","24 + 287","27 + 304","32 + 103","16 = 948","99 " (triệu đồng)" $
        Khi đó $"NPV" = 948","99 - 1000 = - 51","01$ triệu đồng $< 0$.
        Khẳng định nói $"NPV"$ vẫn tiếp tục dương là *SAI*.
    ]
)

// DS 2
#ds([Một doanh nghiệp sản xuất đang cân nhắc hai giải pháp thay thế hệ thống làm mát phân xưởng:
- *Phương án 1*: Mua hệ thống quạt công nghiệp với chi phí ban đầu $200$ triệu đồng, chi phí bảo dưỡng và tiền điện mỗi năm là $50$ triệu đồng trong suốt $5$ năm vòng đời.
- *Phương án 2*: Đầu tư hệ thống điều hòa biến tần tiết kiệm điện với chi phí ban đầu $350$ triệu đồng, chi phí bảo dưỡng và tiền điện mỗi năm chỉ mất $15$ triệu đồng trong suốt $5$ năm.
Biết suất chiết khấu chi phí vốn của doanh nghiệp là $8\%$/năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.7), fill: rgb("fee2e2"), stroke: 1.2pt + rgb("be123c"))
    content((1.6, -0.35), text(size: 8pt)[Phương án 1])
    content((1.6, 3.0), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$"PV" = 399","6$ tr])
    content((1.6, 1.3), text(size: 7pt)[Quạt công nghiệp])

    rect((3.2, 0), (4.4, 2.8), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("047857"))
    content((3.8, -0.35), text(size: 8pt)[Phương án 2])
    content((3.8, 3.1), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$"PV" = 409","9$ tr])
    content((3.8, 1.3), text(size: 7pt)[Điều hòa biến tần])
  })
]
],
    (
        True([Tổng giá trị hiện tại của các chi phí vận hành trong $5$ năm ở Phương án 1 là khoảng $199","64$ triệu đồng.]),
        True([Tổng chi phí quy về hiện tại của Phương án 1 là xấp xỉ $399","64$ triệu đồng.]),
        True([Tổng chi phí quy về hiện tại của Phương án 2 là xấp xỉ $409","89$ triệu đồng.]),
        True([Doanh nghiệp nên lựa chọn Phương án 1 vì có tổng chi phí chiết khấu thấp hơn Phương án 2 khoảng $10","25$ triệu đồng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Chi phí vận hành Phương án 1 là $50$ triệu đồng/năm trong 5 năm.
        Giá trị hiện tại của chi phí vận hành:
        $ "PV"_"vh1" = 50 dot (1 - (1","08)^(-5)) / (0","08) $
        $ approx 50 dot 3","99271 = 199","636 " (triệu đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Tổng chi phí hiện tại của Phương án 1:
        $ "Tổng PV"_1 = 200 + 199","636 = 399","636 " (triệu đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Chi phí vận hành Phương án 2 là $15$ triệu đồng/năm trong 5 năm:
        $ "PV"_"vh2" = 15 dot 3","99271 = 59","891 " (triệu đồng)" $
        Tổng chi phí hiện tại của Phương án 2:
        $ "Tổng PV"_2 = 350 + 59","891 = 409","891 " (triệu đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        So sánh chi phí quy về hiện tại:
        $ "Tổng PV"_2 - "Tổng PV"_1 = 409","891 - 399","636 = 10","255 " (triệu đồng)" $
        Vì đây là bài toán tối thiểu hóa chi phí, phương án nào có tổng chi phí hiện tại thấp hơn sẽ được chọn. Do đó Phương án 1 tiết kiệm hơn khoảng $10","25$ triệu đồng. Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 3
#ds([Một công ty bất động sản rao bán một tòa nhà văn phòng cho thuê với giá chào bán $20$ tỷ đồng. Qua thẩm định độc lập, tòa nhà đem lại dòng tiền thuần cho thuê ổn định là $1","8$ tỷ đồng mỗi năm. Giả sử thời hạn khai thác tòa nhà còn lại là $25$ năm và suất hoàn vốn kỳ vọng của giới đầu tư bất động sản là $8\%$/năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("047857"))[$"PV" = 19","21$ tỷ])

    line((2.0, 0), (2.0, 1.2), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((2.0, -0.35), text(size: 8pt)[$1$])
    content((2.0, 1.4), text(size: 7pt)[$1","8$ tỷ])

    line((3.5, 0), (3.5, 1.2), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((3.5, -0.35), text(size: 8pt)[$2$])
    content((3.5, 1.4), text(size: 7pt)[$1","8$ tỷ])

    content((4.8, 0.6), text(size: 8pt, fill: rgb("047857"))[$dots$ đến năm $25$])
  })
]
],
    (
        True([Hệ số chiết khấu dòng tiền niên kim $25$ năm ở mức lãi suất $8\%$ xấp xỉ bằng $10","6748$.]),
        True([Giá trị định giá hợp lý của tòa nhà văn phòng theo phương pháp chiết khấu dòng tiền là khoảng $19","21$ tỷ đồng.]),
        True([Mức giá chào bán $20$ tỷ đồng của chủ đầu tư đang cao hơn giá trị thực tế của tòa nhà khoảng $790$ triệu đồng.]),
        [Nhà đầu tư nên mua ngay tòa nhà với giá $20$ tỷ đồng vì giá trị hiện tại ròng $"NPV"$ của thương vụ này dương.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Hệ số chiết khấu niên kim (PVIFA):
        $ "PVIFA"(8\%, 25) = (1 - (1","08)^(-25)) / (0","08) $
        $ approx (1 - 0","146018) / (0","08) = 0","853982 / (0","08) approx 10","67477 $
        Làm tròn là $10","6748$. Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Giá trị định giá hợp lý của tòa nhà:
        $ "PV" = 1","8 dot 10","67477 approx 19","2146 " (tỷ đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        So sánh giá chào bán với giá trị nội tại:
        $ 20 - 19","2146 = 0","7854 " (tỷ đồng)" approx 785 " đến " 790 " triệu đồng" $
        Tòa nhà đang bị định giá cao hơn giá trị thực tế. Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Giá trị hiện tại ròng khi mua với giá 20 tỷ:
        $ "NPV" = 19","2146 - 20 = - 0","7854 " tỷ đồng" < 0 $
        Vì $"NPV" < 0$, nhà đầu tư sẽ bị thiệt thòi nếu chấp nhận mức giá $20$ tỷ đồng. Khẳng định nói nên mua là *SAI*.
    ]
)

// DS 4
#ds([Một nhà đầu tư thiên thần rót vốn $500$ triệu đồng vào một công ty khởi nghiệp. Hợp đồng quy định sau $3$ năm, nhà đầu tư được quyền chọn một trong hai phương án thoái vốn:
- *Phương án 1*: Nhận một khoản cố định là $850$ triệu đồng tại thời điểm cuối năm thứ 3.
- *Phương án 2*: Nhận khoản thanh toán tăng dần: cuối năm thứ nhất nhận $150$ triệu, cuối năm thứ hai nhận $250$ triệu và cuối năm thứ ba nhận $550$ triệu đồng.
Giả định lãi suất chiết khấu an toàn trên thị trường là $9\%$/năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.5), fill: rgb("bae6fd"), stroke: 1.2pt + rgb("0284c7"))
    content((1.6, -0.35), text(size: 8pt)[Phương án 1])
    content((1.6, 2.8), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[$"PV"_1 = 656","36$ tr])

    rect((3.2, 0), (4.4, 2.7), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("047857"))
    content((3.8, -0.35), text(size: 8pt)[Phương án 2])
    content((3.8, 3.0), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$"PV"_2 = 772","62$ tr])
  })
]
],
    (
        True([Giá trị hiện tại quy về thời điểm đầu tư ($t = 0$) của Phương án 1 là khoảng $656","36$ triệu đồng.]),
        True([Giá trị hiện tại quy về thời điểm đầu tư ($t = 0$) của Phương án 2 là khoảng $772","62$ triệu đồng.]),
        True([Cả hai phương án thoái vốn đều mang lại tỷ suất sinh lời thực tế cao hơn chi phí vốn $9\%$/năm.]),
        True([Nhà đầu tư nên lựa chọn Phương án 2 vì có giá trị hiện tại ròng vượt trội hơn Phương án 1 khoảng $116","26$ triệu đồng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Giá trị hiện tại của Phương án 1:
        $ "PV"_1 = 850 / (1","09)^3 = 850 / 1","295029 approx 656","356 " (triệu đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Giá trị hiện tại của Phương án 2:
        $ "PV"_2 = 150 / (1","09)^1 + 250 / (1","09)^2 + 550 / (1","09)^3 $
        $ = 150 / 1","09 + 250 / 1","1881 + 550 / 1","295029 $
        $ approx 137","615 + 210","420 + 424","695 $
        $ approx 772","730 " (triệu đồng)" $
        (Làm tròn xấp xỉ $772","62$ đến $772","73$ triệu đồng). Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Vì $"PV"_1 > 500$ và $"PV"_2 > 500$, nên cả hai phương án đều có $"NPV" > 0$, chứng tỏ tỷ suất sinh lời thực tế của cả hai phương án đều vượt mức chi phí vốn $9\%$/năm. Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        So sánh hai phương án:
        $ "PV"_2 - "PV"_1 = 772","62 - 656","36 = 116","26 " (triệu đồng)" $
        Phương án 2 mang lại giá trị hiện tại lớn hơn rõ rệt. Khẳng định ý d là *ĐÚNG*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Một khoản tiền $400$ triệu đồng được chi trả sau $3$ năm nữa. Với lãi suất chiết khấu $7\%$/năm theo hình thức ghép lãi hàng năm, giá trị hiện tại ($"PV"$) của khoản tiền này bằng bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("047857"))[$"PV" = ?$])

    circle((4.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((4.5, -0.35), text(size: 8pt)[$3$])
    line((4.5, 0), (4.5, 1.2), mark: (start: "stealth"), stroke: 1.2pt + rgb("047857"))
    content((4.5, 1.45), text(size: 7.5pt)[$400$ tr])
  })
]
],
    [326],
    loigiai: [
        #step([Lời giải chi tiết])
        Áp dụng công thức chiết khấu giá trị hiện tại:
        $ "PV" = "FV" / (1 + r)^n $

        Thay số: $"FV" = 400$ triệu đồng, $r = 7\% = 0","07$, $n = 3$ năm:
        $ "PV" = 400 / (1","07)^3 $
        $ = 400 / 1","225043 $
        $ approx 326","519 " (triệu đồng)" $

        Làm tròn kết quả đến hàng đơn vị: $326$ triệu đồng.
    ]
)

// TLN 2
#tln([Một dự án kinh doanh đòi hỏi vốn đầu tư ban đầu là $600$ triệu đồng và mang lại dòng tiền thuần $280$ triệu đồng ở cuối năm thứ nhất, $450$ triệu đồng ở cuối năm thứ hai. Với lãi suất chiết khấu $8\%$/năm, giá trị hiện tại ròng ($"NPV"$) của dự án này là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Năm])

    line((0.8, 0), (0.8, -1.2), mark: (end: "stealth"), stroke: 1.2pt + rgb("be123c"))
    content((0.8, -1.45), text(size: 7pt, fill: rgb("be123c"))[$-600$ tr])

    line((2.6, 0), (2.6, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((2.6, -0.35), text(size: 8pt)[$1$])
    content((2.6, 1.3), text(size: 7pt)[$+280$ tr])

    line((4.4, 0), (4.4, 1.5), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((4.4, -0.35), text(size: 8pt)[$2$])
    content((4.4, 1.7), text(size: 7pt)[$+450$ tr])
  })
]
],
    [45],
    loigiai: [
        #step([Lời giải chi tiết])
        Giá trị hiện tại ròng ($"NPV"$) của dự án:
        $ "NPV" = 280 / (1","08)^1 + 450 / (1","08)^2 - 600 $

        Tính toán từng số hạng:
        $ 280 / (1","08) approx 259","259 " (triệu đồng)" $
        $ 450 / (1","08)^2 = 450 / 1","1664 approx 385","802 " (triệu đồng)" $

        Tổng giá trị hiện tại của dòng thu:
        $ "PV" = 259","259 + 385","802 = 645","061 " (triệu đồng)" $

        Giá trị hiện tại ròng:
        $ "NPV" = 645","061 - 600 = 45","061 " (triệu đồng)" $

        Làm tròn kết quả đến hàng đơn vị: $45$ triệu đồng.
    ]
)

// TLN 3
#tln([Một quỹ bảo trợ xã hội nhận được một khoản hiến tặng vĩnh viễn với dòng tiền tài trợ đều đặn hàng năm là $45$ triệu đồng. Nếu lãi suất chiết khấu thị trường là $6\%$/năm, giá trị hiện tại của dòng tiền hiến tặng vĩnh viễn này bằng bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("047857"))[$"PV" = ?$])

    line((2.0, 0), (2.0, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((2.0, 1.2), text(size: 7pt)[$45$ tr])

    line((3.5, 0), (3.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((3.5, 1.2), text(size: 7pt)[$45$ tr])

    content((4.8, 0.5), text(size: 8pt, fill: rgb("047857"))[$dots$ vĩnh viễn])
  })
]
],
    [750],
    loigiai: [
        #step([Lời giải chi tiết])
        Công thức tính giá trị hiện tại của dòng tiền vĩnh viễn (Perpetuity):
        $ "PV" = C / r $

        Thay số với $C = 45$ triệu đồng và $r = 6\% = 0","06$:
        $ "PV" = 45 / (0","06) = 750 " (triệu đồng)" $

        Vậy giá trị hiện tại của dòng tiền hiến tặng vĩnh viễn là $750$ triệu đồng.
    ]
)

// TLN 4
#tln([Một thương vụ đầu tư bất động sản yêu cầu bỏ vốn $1$ tỷ đồng ($1000$ triệu đồng) tại thời điểm $t = 0$. Sau đúng $2$ năm, nhà đầu tư bán lại bất động sản và thu về trọn gói $1322","5$ triệu đồng. Suất hoàn vốn nội bộ (IRR) hàng năm của thương vụ này bằng bao nhiêu phần trăm? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Năm])

    line((0.8, 0), (0.8, -1.3), mark: (end: "stealth"), stroke: 1.2pt + rgb("be123c"))
    content((0.8, -1.55), text(size: 7.5pt, fill: rgb("be123c"))[$-1000$ tr])

    line((4.5, 0), (4.5, 1.6), mark: (start: "stealth"), stroke: 1.2pt + rgb("047857"))
    content((4.5, -0.35), text(size: 8pt)[$2$ năm])
    content((4.5, 1.85), text(size: 7.5pt)[$+1322","5$ tr])
  })
]
],
    [15],
    loigiai: [
        #step([Lời giải chi tiết])
        Phương trình xác định suất hoàn vốn nội bộ (IRR):
        $ (1322","5) / (1 + "IRR")^2 - 1000 = 0 $

        $ (1 + "IRR")^2 = (1322","5) / 1000 = 1","3225 $

        Lấy căn bậc hai hai vế (vì $1 + "IRR" > 0$):
        $ 1 + "IRR" = sqrt(1","3225) = 1","15 $

        $ "IRR" = 1","15 - 1 = 0","15 = 15\% $

        Vậy suất hoàn vốn nội bộ của thương vụ đầu tư là $15\%$/năm.
    ]
)

// TLN 5
#tln([Một khoản tiền gửi định kỳ gồm $3$ khoản thu nhận được ở cuối mỗi năm, mỗi khoản là $100$ triệu đồng. Với lãi suất tiền gửi ngân hàng là $6\%$/năm, tổng giá trị tương lai ($"FV"$) tích lũy được ở cuối năm thứ ba là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((5.5, -0.35), text(size: 8pt)[Năm])

    line((1.5, 0), (1.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((1.5, -0.35), text(size: 8pt)[$1$])
    content((1.5, 1.2), text(size: 7pt)[$100$ tr])

    line((3.0, 0), (3.0, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((3.0, -0.35), text(size: 8pt)[$2$])
    content((3.0, 1.2), text(size: 7pt)[$100$ tr])

    line((4.5, 0), (4.5, 1.0), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((4.5, -0.35), text(size: 8pt)[$3$])
    content((4.5, 1.2), text(size: 7pt)[$100$ tr])

    circle((4.5, 0), radius: 0.08, fill: rgb("047857"), stroke: none)
    content((4.5, 1.6), text(size: 8pt, fill: rgb("047857"), weight: "bold")[$"FV" = ?$])
  })
]
],
    [318.4],
    loigiai: [
        #step([Lời giải chi tiết])
        Tính giá trị tương lai tích lũy của từng khoản gửi đến cuối năm thứ 3:
        - Khoản gửi cuối năm 1: Tích lũy lãi trong $2$ năm:
        $ "FV"_1 = 100 dot (1","06)^2 = 100 dot 1","1236 = 112","36 " (triệu đồng)" $

        - Khoản gửi cuối năm 2: Tích lũy lãi trong $1$ năm:
        $ "FV"_2 = 100 dot (1","06)^1 = 106","00 " (triệu đồng)" $

        - Khoản gửi cuối năm 3: Vừa gửi vào cuối năm 3 nên chưa sinh lãi:
        $ "FV"_3 = 100","00 " (triệu đồng)" $

        Tổng giá trị tương lai tích lũy:
        $ "FV" = "FV"_1 + "FV"_2 + "FV"_3 $
        $ = 112","36 + 106","00 + 100","00 $
        $ = 318","36 " (triệu đồng)" $

        Làm tròn kết quả đến hàng phần mười: $318","4$ triệu đồng.
    ]
)

// TLN 6
#tln([Một doanh nghiệp đầu tư lắp đặt dàn pin năng lượng mặt trời áp mái với tổng chi phí $500$ triệu đồng. Mỗi năm, hệ thống pin giúp tiết kiệm tiền điện là $100$ triệu đồng liên tục trong $8$ năm. Nếu lãi suất chiết khấu vốn của doanh nghiệp là $9\%$/năm, giá trị hiện tại ròng ($"NPV"$) của dự án lắp đặt pin năng lượng mặt trời này là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    line((0.8, 0), (0.8, -1.3), mark: (end: "stealth"), stroke: 1.5pt + rgb("be123c"))
    content((0.8, -1.55), text(size: 7.5pt, fill: rgb("be123c"))[$-500$ tr])

    line((2.0, 0), (2.0, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((2.0, -0.35), text(size: 8pt)[$1$])
    content((2.0, 1.3), text(size: 7pt)[$100$ tr])

    line((3.2, 0), (3.2, 1.1), mark: (start: "stealth"), stroke: 1pt + rgb("047857"))
    content((3.2, -0.35), text(size: 8pt)[$2$])
    content((3.2, 1.3), text(size: 7pt)[$100$ tr])

    content((4.6, 0.5), text(size: 8pt, fill: rgb("047857"))[$dots$ đến năm $8$])
  })
]
],
    [53],
    loigiai: [
        #step([Lời giải chi tiết])
        Giá trị hiện tại của dòng tiền tiết kiệm đều đặn $C = 100$ triệu đồng/năm trong $n = 8$ năm với $r = 9\% = 0","09$:
        $ "PV" = C dot (1 - (1 + r)^(-n)) / r $
        $ = 100 dot (1 - (1","09)^(-8)) / (0","09) $

        Tính hệ số chiết khấu:
        $ (1","09)^(-8) approx 0","501866 $
        $ 1 - 0","501866 = 0","498134 $
        $ "PV" approx 100 dot (0","498134) / (0","09) approx 100 dot 5","534819 approx 553","482 " (triệu đồng)" $

        Giá trị hiện tại ròng:
        $ "NPV" = "PV" - C_0 = 553","482 - 500 = 53","482 " (triệu đồng)" $

        Làm tròn kết quả đến hàng đơn vị: $53$ triệu đồng.
    ]
)
]

#make-questions()
