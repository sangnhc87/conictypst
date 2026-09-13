#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("334155") // Dark Slate cho Đề 6C

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON",
  exam-title: "BÀI 3: MÔ HÌNH TÀI CHÍNH, TĂNG TRƯỞNG & VDC TỔNG HỢP (ĐỀ C)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "318",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một người gửi số tiền gốc $A_0$ vào ngân hàng với lãi suất kép $r$ mỗi kỳ hạn. Sau $n$ kỳ hạn, tổng số tiền (cả gốc lẫn lãi) người đó nhận được là $A_n = A_0 (1 + r)^n$. Khi khai triển nhị thức Newton cho biểu thức $(1 + r)^n$, thành phần $A_0 times n r$ biểu diễn giá trị nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Graph comparing Simple vs Compound Interest
    line((0, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, 0), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.7, 0), [$n$ (kỳ)], anchor: "west")
    content((0, 3.4), [$A_n$], anchor: "south")

    // Simple interest: line
    line((0, 0.8), (4.8, 2.0), stroke: (paint: rgb("64748b"), dash: "dashed", thickness: 1pt))
    content((4.8, 1.8), text(size: 7pt, fill: rgb("64748b"))[Lãi đơn: $1 + n r$], anchor: "north")

    // Compound interest: curve
    bezier((0, 0.8), (4.8, 2.9), (2.0, 1.2), (3.6, 2.0), stroke: 1.5pt + rgb("334155"))
    content((4.8, 3.1), text(size: 7.5pt, weight: "bold", fill: rgb("334155"))[Lãi kép: $(1 + r)^n$], anchor: "south")

    content((0, 0.8), text(size: 7pt)[$A_0$], anchor: "east")
  })
]
],
    (
        True([Tiền lãi sinh ra theo cơ chế lãi đơn qua $n$ kỳ]),
        [Toàn bộ tiền lãi kép sau $n$ kỳ],
        [Phần chênh lệch giữa lãi kép và lãi đơn],
        [Số tiền vốn ban đầu]
    ),
    loigiai: [
        #step([Phân tích khai triển nhị thức Newton của lãi kép])
        $ A_n = A_0 (1 + r)^n = A_0 [1 + n r + C_n^2 r^2 + ... + r^n] $
        - $A_0 times 1$: Vốn gốc ban đầu.
        - $A_0 times n r$: Tiền lãi đơn tích lũy (lãi tính trên vốn gốc qua $n$ kỳ).
        - $A_0 times sum_(k=2)^n C_n^k r^k$: Phần lãi sinh ra từ lãi (lãi mẹ đẻ lãi con).
    ]
)

// TN 2
#tn([Khi tỉ lệ tăng trưởng $x$ rất nhỏ so với $1$ ($|x| << 1$), người ta thường dùng công thức xấp xỉ bậc hai của nhị thức Newton là $(1 + x)^n approx 1 + n x + (n(n - 1)) / 2 x^2$. Giá trị xấp xỉ bậc hai của $(1.01)^5$ là],
    (
        True([$1.051$]),
        [$1.050$],
        [$1.052$],
        [$1.060$]
    ),
    loigiai: [
        #step([Áp dụng xấp xỉ nhị thức Newton])
        Với $x = 0.01$ và $n = 5$:
        $ (1 + 0.01)^5 approx 1 + 5 times 0.01 + (5 times 4) / 2 times (0.01)^2 = 1 + 0.05 + 10 times 0.0001 = 1 + 0.05 + 0.001 = 1.051 $
    ]
)

// TN 3
#tn([Bất đẳng thức Bernoulli khẳng định rằng với mọi số thực $x > -1$ và số nguyên dương $n$, ta luôn có],
    (
        True([$(1 + x)^n >= 1 + n x$]),
        [$(1 + x)^n <= 1 + n x$],
        [$(1 + x)^n >= 1 + n^2 x$],
        [$(1 + x)^n > 1 + x^n$]
    ),
    loigiai: [
        #step([Bất đẳng thức Bernoulli])
        Với $x > -1$ và $n in NN^*$, bất đẳng thức $(1 + x)^n >= 1 + n x$ là một kết quả kinh điển được chứng minh bằng quy nạp toán học.
    ]
)

// TN 4
#tn([Một người gửi $100$ triệu đồng vào ngân hàng với lãi suất kép $6%$ / năm. Sau $2$ năm, số tiền lãi người đó nhận được là],
    (
        True([$12.36$ triệu đồng]),
        [$12.00$ triệu đồng],
        [$12.72$ triệu đồng],
        [$13.00$ triệu đồng]
    ),
    loigiai: [
        #step([Tính số tiền cả vốn lẫn lãi sau 2 năm])
        $ A_2 = 100 times (1 + 0.06)^2 = 100 times (1.06)^2 = 100 times 1.1236 = 112.36 $ triệu đồng.
        #step([Tính tiền lãi])
        $ "Tiền lãi" = 112.36 - 100 = 12.36 $ triệu đồng.
    ]
)

// TN 5
#tn([Trong tài chính, "Quy tắc 72" là công thức ước lượng thời gian $t$ (số năm) để số tiền đầu tư nhân đôi với lãi suất $r%$ / năm. Công thức thực nghiệm này là],
    (
        True([$t approx 72 / r$]),
        [$t approx 72 times r$],
        [$t approx 100 / r$],
        [$t approx r / 72$]
    ),
    loigiai: [
        #step([Giải thích quy tắc 72])
        Xuất phát từ phương trình nhân đôi vốn $(1 + r / 100)^t = 2 <=> t = (ln 2) / (ln(1 + r / 100)) approx (0.693) / (r / 100) = 69.3 / r$. Do $72$ có nhiều ước số nguyên hơn nên người ta chọn $t approx 72 / r$.
    ]
)

// TN 6
#tn([Một quần thể vi khuẩn ban đầu có $N_0$ cá thể, sau mỗi giờ số lượng vi khuẩn tăng gấp đôi. Sau $n$ giờ, số lượng vi khuẩn là $N_n = N_0 2^n$. Nếu ban đầu có $500$ cá thể, thì sau $4$ giờ số lượng vi khuẩn là],
    (
        True([$8000$ cá thể]),
        [$4000$ cá thể],
        [$2000$ cá thể],
        [$16000$ cá thể]
    ),
    loigiai: [
        #step([Tính số cá thể sau 4 giờ])
        $ N_4 = 500 times 2^4 = 500 times 16 = 8000 $ cá thể.
    ]
)

// TN 7
#tn([Xét dãy số $(u_n)$ với $u_n = (1 + 1 / n)^n$ ($n in NN^*$). Khi khai triển nhị thức Newton, số hạng tổng quát của khai triển là $C_n^k (1 / n)^k$. Dãy số $(u_n)$ tăng và bị chặn trên bởi hằng số toán học nổi tiếng nào sau đây?],
    (
        True([Hằng số Euler $e approx 2.71828$]),
        [Hằng số $pi approx 3.14159$]),
        [Tỉ lệ vàng $phi approx 1.61803$],
        [Số $sqrt(2) approx 1.41421$]
    ),
    loigiai: [
        #step([Định nghĩa số e qua nhị thức Newton])
        Dãy $u_n = (1 + 1 / n)^n$ là dãy tăng ngặt và hội tụ về $lim_(n -> oo) (1 + 1 / n)^n = e approx 2.71828$.
    ]
)

// TN 8
#tn([Cho $a, b > 0$ thỏa mãn $a + b = 1$. Giá trị nhỏ nhất của biểu thức $S = a^4 + b^4$ là],
    (
        True([$1 / 8$]),
        [$1 / 4$],
        [$1 / 16$],
        [$1 / 2$]
    ),
    loigiai: [
        #step([Áp dụng bất đẳng thức Cauchy-Schwarz hoặc tính lồi])
        Theo bất đẳng thức Cauchy-Schwarz:
        $ a^2 + b^2 >= (a + b)^2 / 2 = 1 / 2 $
        $ a^4 + b^4 >= (a^2 + b^2)^2 / 2 >= (1 / 2)^2 / 2 = 1 / 8 $
        Dấu bằng xảy ra khi $a = b = 1 / 2$.
    ]
)

// TN 9
#tn([Khai triển biểu thức $(1 + x + x^2)^4$ thành đa thức. Hệ số của $x^3$ trong khai triển là],
    (
        True([$16$]),
        [$12$],
        [$10$],
        [$20$]
    ),
    loigiai: [
        #step([Tìm hệ số x3 trong (1 + x + x^2)^4])
        Số hạng tổng quát trong công thức Leibniz:
        $ (4!) / (k_1! k_2! k_3!) 1^(k_1) x^(k_2) (x^2)^(k_3) $
        với $k_1 + k_2 + k_3 = 4$ và số mũ của $x$ là $k_2 + 2 k_3 = 3$.
        Vì $k_3 >= 0$ và $2 k_3 <= 3$:
        - TH1: $k_3 = 1 => k_2 = 1 => k_1 = 2$: Hệ số là $(4!) / (2! 1! 1!) = 12$.
        - TH2: $k_3 = 0 => k_2 = 3 => k_1 = 1$: Hệ số là $(4!) / (1! 3! 0!) = 4$.
        Tổng hệ số là $12 + 4 = 16$.
    ]
)

// TN 10
#tn([Một chuỗi phản ứng dây chuyền hạt nhân bắt đầu từ $1$ hạt neutron. Ở mỗi thế hệ, mỗi neutron kích thích giải phóng ra $3$ neutron mới. Sau $n$ thế hệ, tổng số neutron sinh ra ở riêng thế hệ thứ $n$ là],
    (
        True([$3^n$]),
        [$3 n$],
        [$n^3$],
        [$3^(n - 1)$]
    ),
    loigiai: [
        #step([Tăng trưởng chuỗi lũy thừa])
        - Thế hệ 0: $3^0 = 1$ hạt.
        - Thế hệ 1: $3^1 = 3$ hạt.
        - Thế hệ $n$: $3^n$ hạt.
    ]
)

// TN 11
#tn([Cho khai triển $(2 - x)^6 = a_0 + a_1 x + a_2 x^2 + ... + a_6 x^6$. Tổng $S = a_0 + a_1 + a_2 + ... + a_6$ bằng],
    (
        True([$1$]),
        [$64$],
        [$729$],
        [$0$]
    ),
    loigiai: [
        #step([Thay x = 1 vào hai vế])
        Cho $x = 1$, vế trái là $(2 - 1)^6 = 1^6 = 1$.
        Vế phải là $a_0 + a_1 + a_2 + ... + a_6 = S$.
        Vậy $S = 1$.
    ]
)

// TN 12
#tn([Với mọi số tự nhiên $n >= 2$, số hạng lớn nhất trong khai triển nhị thức $(1 + 1)^n = sum_(k=0)^n C_n^k$ đạt được khi $k$ nhận giá trị nào sau đây (trường hợp $n$ chẵn)?],
    (
        True([$k = n / 2$]),
        [$k = n$],
        [$k = 0$],
        [$k = n / 2 + 1$]
    ),
    loigiai: [
        #step([Tính chất đối xứng và cực đại của hệ số tổ hợp])
        Khi $n$ chẵn, các hệ số tổ hợp $C_n^k$ tăng dần từ $k = 0$ đến $k = n / 2$, đạt giá trị lớn nhất tại $k = n / 2$, sau đó giảm dần về $k = n$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Một nhà đầu tư gửi số tiền $100$ triệu đồng vào ngân hàng theo hình thức lãi kép với lãi suất $r = 8%$ / năm. Gọi $A_n$ là tổng số tiền thu được sau $n$ năm ($n in NN^*$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-3, -0.4), (3, 0.4), fill: rgb("f8fafc"), stroke: 1.2pt + rgb("334155"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("334155"))[Mô hình tích lũy tài chính: $A_n = 100 times (1.08)^n$])
  })
]
],
  (
    True([Sau $1$ năm, số tiền cả gốc lẫn lãi là $108$ triệu đồng.]),
    True([Số tiền lãi riêng của năm thứ hai lớn hơn số tiền lãi của năm thứ nhất.]),
    True([Sau $2$ năm, tổng số tiền nhận được là $116.64$ triệu đồng.]),
    [Sau $10$ năm, tổng số tiền nhà đầu tư nhận được vượt quá $250$ triệu đồng.]
  ),
  loigiai: [
    #step([Xét ý a])
    $ A_1 = 100 times (1 + 0.08)^1 = 108 $ triệu đồng (Ý a ĐÚNG).

    #step([Xét ý b])
    Lãi năm 1: $108 - 100 = 8$ triệu đồng.
    Lãi năm 2: $108 times 0.08 = 8.64$ triệu đồng $> 8$ triệu đồng (Ý b ĐÚNG).

    #step([Xét ý c])
    $ A_2 = 100 times (1.08)^2 = 100 times 1.1664 = 116.64 $ triệu đồng (Ý c ĐÚNG).

    #step([Xét ý d])
    $ A_(10) = 100 times (1.08)^(10) approx 100 times 2.1589 = 215.89 $ triệu đồng $< 250$ triệu đồng.
    Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Xét mô hình nuôi cấy một chủng vi khuẩn trong phòng thí nghiệm. Ban đầu tại thời điểm $t = 0$ có $1000$ cá thể. Cứ sau mỗi chu kỳ $30$ phút, số lượng cá thể vi khuẩn lại nhân đôi. Gọi $N_k$ là số vi khuẩn sau $k$ chu kỳ ($k in NN$).],
  (
    True([Sau $1$ chu kỳ ($30$ phút), số lượng vi khuẩn là $2000$ cá thể.]),
    True([Sau $2$ giờ ($4$ chu kỳ), số lượng vi khuẩn là $16000$ cá thể.]),
    True([Công thức tổng quát số lượng vi khuẩn sau $k$ chu kỳ là $N_k = 1000 times 2^k$.]),
    [Để số lượng vi khuẩn vượt quá $1$ triệu cá thể, cần thời gian tối thiểu là $6$ giờ.]
  ),
  loigiai: [
    #step([Xét ý a và c])
    $ N_0 = 1000, N_k = 1000 times 2^k $.
    $ N_1 = 1000 times 2 = 2000 $ (Ý a và c ĐÚNG).

    #step([Xét ý b])
    Sau 2 giờ là $4$ chu kỳ ($k = 4$):
    $ N_4 = 1000 times 2^4 = 16000 $ cá thể (Ý b ĐÚNG).

    #step([Xét ý d])
    Yêu cầu:
    $ N_k > 10^6 <=> 1000 times 2^k > 10^6 <=> 2^k > 1000 $
    Vì $2^9 = 512 < 1000$ và $2^(10) = 1024 > 1000$ nên $k = 10$ chu kỳ.
    Thời gian tương ứng là $10 times 30 = 300$ phút $= 5$ giờ $< 6$ giờ.
    Do đó chỉ cần 5 giờ (không phải 6 giờ), ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Xét hàm số đa thức $P(x) = (1 + x)^6$ với $x in RR$.],
  (
    True([Khai triển nhị thức Newton của $P(x)$ có đúng $7$ số hạng.]),
    True([Hệ số của số hạng chính giữa trong khai triển là $C_6^3 = 20$.]),
    True([Giá trị xấp xỉ tuyến tính của $P(0.01)$ là $1 + 6 times 0.01 = 1.06$.]),
    [Giá trị thực tế của $(1.01)^6$ nhỏ hơn giá trị xấp xỉ tuyến tính $1.06$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    Khai triển $(1 + x)^6$ có $6 + 1 = 7$ số hạng. Số hạng chính giữa ứng với $k = 3$ có hệ số $C_6^3 = 20$ (Ý a và b ĐÚNG).

    #step([Xét ý c])
    Xấp xỉ tuyến tính là $1 + 6 x$. Với $x = 0.01$, xấp xỉ là $1 + 0.06 = 1.06$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Theo BĐT Bernoulli hoặc khai triển nhị thức với các số hạng dương:
    $ (1.01)^6 = 1 + 6 times 0.01 + C_6^2 (0.01)^2 + ... > 1.06 $.
    Giá trị thực tế lớn hơn $1.06$. Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Cho khai triển nhị thức $(1 + 2 x)^n = a_0 + a_1 x + a_2 x^2 + ... + a_n x^n$ với $n in NN^*$.],
  (
    True([$a_0 = 1$.]),
    True([$a_1 = 2 n$.]),
    True([Tổng các hệ số $a_0 + a_1 + a_2 + ... + a_n = 3^n$.]),
    [Nếu $a_2 = 112$ thì $n = 7$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    $ a_0 = C_n^0 2^0 = 1 $ (Ý a ĐÚNG).
    $ a_1 = C_n^1 2^1 = 2 n $ (Ý b ĐÚNG).

    #step([Xét ý c])
    Cho $x = 1$:
    $ sum_(k=0)^n a_k = (1 + 2 times 1)^n = 3^n $ (Ý c ĐÚNG).

    #step([Xét ý d])
    $ a_2 = C_n^2 2^2 = (n(n - 1)) / 2 times 4 = 2 n(n - 1) $.
    Nếu $a_2 = 112$:
    $ 2 n(n - 1) = 112 <=> n(n - 1) = 56 <=> n^2 - n - 56 = 0 <=> (n - 8)(n + 7) = 0 $
    Do $n in NN^*$ nên $n = 8$, không phải $7$. Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Một người gửi tiết kiệm $50$ triệu đồng vào ngân hàng với lãi suất kép $7%$ / năm. Tính tổng số tiền (cả vốn lẫn lãi) người đó nhận được sau $3$ năm (làm tròn kết quả đến hàng phần mười của triệu đồng, ví dụ: 61.3).],
    [61.3],
    loigiai: [
        #step([Áp dụng công thức lãi kép])
        $ A_3 = 50 times (1 + 0.07)^3 = 50 times (1.07)^3 = 50 times 1.225043 = 61.25215 $ triệu đồng.
        Làm tròn đến hàng phần mười ta được $61.3$ triệu đồng.
    ]
)

// TLN 2 (Câu 18)
#tln([Một tế bào phân chia (phân đôi) liên tiếp. Cần ít nhất bao nhiêu lần phân chia liên tiếp để từ một tế bào ban đầu tạo ra hơn $1000$ tế bào con?],
    [10],
    loigiai: [
        #step([Thiết lập bất phương trình lũy thừa])
        Số tế bào con sau $n$ lần phân chia là $2^n$.
        Yêu cầu:
        $ 2^n > 1000 $
        Vì $2^9 = 512 < 1000$ và $2^(10) = 1024 > 1000$, nên $n$ nhỏ nhất bằng $10$.
    ]
)

// TLN 3 (Câu 19)
#tln([Theo "Quy tắc 72", một khoản đầu tư với mức lãi suất kép $8%$ / năm sẽ cần ước tính bao nhiêu năm để tăng gấp đôi giá trị ban đầu?],
    [9],
    loigiai: [
        #step([Áp dụng quy tắc 72])
        $ t approx 72 / r = 72 / 8 = 9 $ năm.
    ]
)

// TLN 4 (Câu 20)
#tln([Tính giá trị xấp xỉ của biểu thức $(1.02)^5$ bằng cách lấy tổng của $3$ số hạng đầu tiên trong khai triển nhị thức Newton $(1 + 0.02)^5$ (kết quả dưới dạng số thập phân có $3$ chữ số sau dấu phẩy).],
    [1.104],
    loigiai: [
        #step([Khai triển 3 số hạng đầu])
        $ (1 + 0.02)^5 approx C_5^0 + C_5^1 (0.02) + C_5^2 (0.02)^2 $
        $ = 1 + 5 times 0.02 + 10 times 0.0004 = 1 + 0.10 + 0.004 = 1.104 $
    ]
)

// TLN 5 (Câu 21)
#tln([Trong khai triển $(1 + 2 x)^8 = a_0 + a_1 x + a_2 x^2 + ... + a_8 x^8$, tìm chỉ số $k$ ($0 <= k <= 8$) sao cho hệ số $a_k$ đạt giá trị lớn nhất.],
    [5],
    loigiai: [
        #step([Thiết lập bất phương trình cho hệ số ak])
        Hệ số của $x^k$ là $a_k = C_8^k 2^k$.
        Xét tỉ số giữa hai hệ số liên tiếp:
        $ a_(k+1) / a_k = (C_8^(k+1) 2^(k+1)) / (C_8^k 2^k) = (8 - k) / (k + 1) times 2 $
        Yêu cầu $a_(k+1) >= a_k <=> 2(8 - k) >= k + 1 <=> 16 - 2 k >= k + 1 <=> 3 k <= 15 <=> k <= 5$.
        Do đó:
        $ a_0 < a_1 < a_2 < a_3 < a_4 < a_5 "và" a_5 > a_6 > a_7 > a_8 $.
        Vậy hệ số đạt cực đại tại $k = 5$ (với $a_5 = C_8^5 2^5 = 56 times 32 = 1792$).
    ]
)

// TLN 6 (Câu 22)
#tln([Tìm số tự nhiên $n$ thỏa mãn phương trình tổng hệ số tổ hợp: $C_n^0 + C_n^1 + C_n^2 + ... + C_n^n = 512$.],
    [9],
    loigiai: [
        #step([Thu gọn tổng nhị thức])
        Ta có công thức:
        $ sum_(k=0)^n C_n^k = 2^n $
        Phương trình trở thành:
        $ 2^n = 512 <=> 2^n = 2^9 <=> n = 9 $
    ]
)

] // end make-questions

#make-questions()
