#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("15803d") // Forest Green cho Đề 6B

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON",
  exam-title: "BÀI 3: ỨNG DỤNG NHỊ THỨC NEWTON TRONG XÁC SUẤT (ĐỀ B - BERNOULLI & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "317",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một phép thử Bernoulli được thực hiện $n$ lần độc lập, xác suất thành công của mỗi lần là $p$ ($0 < p < 1$), đặt $q = 1 - p$. Xác suất để có đúng $k$ lần thành công ($0 <= k <= n$) được xác định bởi công thức nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-3, -0.4), (3, 0.4), fill: rgb("f0fdf4"), stroke: 1.2pt + rgb("15803d"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("15803d"))[Công thức Bernoulli: $P_n (k) = C_n^k p^k q^(n - k)$])
  })
]
],
    (
        True([$P_n (k) = C_n^k p^k q^(n - k)$]),
        [$P_n (k) = A_n^k p^k q^(n - k)$],
        [$P_n (k) = C_n^k p^(n - k) q^k$],
        [$P_n (k) = p^k q^(n - k)$]
    ),
    loigiai: [
        #step([Công thức Bernoulli])
        Theo lý thuyết xác suất và khai triển nhị thức Newton:
        $ P_n (k) = C_n^k p^k q^(n - k) $
        với $C_n^k$ là số cách chọn $k$ lần thành công trong $n$ lần thử độc lập.
    ]
)

// TN 2
#tn([Tổng tất cả các xác suất $sum_(k=0)^n P_n (k)$ trong một chuỗi $n$ phép thử Bernoulli độc lập luôn bằng bao nhiêu?],
    (
        True([$1$]),
        [$0$],
        [$p$],
        [$n$]
    ),
    loigiai: [
        #step([Mối liên hệ với nhị thức Newton])
        Tổng tất cả các xác suất là:
        $ sum_(k=0)^n C_n^k p^k q^(n - k) = (p + q)^n $
        Vì $p + q = 1$ nên $(p + q)^n = 1^n = 1$.
    ]
)

// TN 3
#tn([Gieo một đồng xu cân đối và đồng chất $5$ lần độc lập. Xác suất để xuất hiện đúng $3$ lần mặt sấp là],
    (
        True([$5 / 16$]),
        [$1 / 4$],
        [$10 / 32$],
        [$5 / 32$]
    ),
    loigiai: [
        #step([Áp dụng công thức Bernoulli])
        Ở mỗi lần gieo, xác suất ra mặt sấp là $p = 1 / 2$, mặt ngửa là $q = 1 / 2$.
        Xác suất xuất hiện đúng $3$ lần mặt sấp trong $5$ lần gieo là:
        $ P_5 (3) = C_5^3 (1 / 2)^3 (1 / 2)^(5 - 3) = 10 times (1 / 32) = 10 / 32 = 5 / 16 $
    ]
)

// TN 4
#tn([Một xạ thủ bắn $4$ viên đạn vào bia một cách độc lập. Xác suất trúng đích của mỗi viên đạn là $0.8$. Xác suất để xạ thủ bắn trúng cả $4$ viên là],
    (
        True([$0.4096$]),
        [$0.2048$],
        [$0.5120$],
        [$0.8000$]
    ),
    loigiai: [
        #step([Tính xác suất 4 lần đều trúng])
        $ P_4 (4) = C_4^4 (0.8)^4 (0.2)^0 = 1 times 0.4096 times 1 = 0.4096 $
    ]
)

// TN 5
#tn([Một xạ thủ bắn $4$ phát đạn độc lập với xác suất trúng mỗi phát là $0.7$. Xác suất để xạ thủ không trúng phát nào là],
    (
        True([$0.0081$]),
        [$0.0016$],
        [$0.0243$],
        [$0.2401$]
    ),
    loigiai: [
        #step([Tính xác suất không trúng phát nào])
        Xác suất trượt mỗi phát là $q = 1 - 0.7 = 0.3$.
        $ P_4 (0) = C_4^0 (0.7)^0 (0.3)^4 = 1 times 1 times 0.0081 = 0.0081 $
    ]
)

// TN 6
#tn([Một bài thi trắc nghiệm gồm $5$ câu hỏi, mỗi câu có $4$ phương án lựa chọn và chỉ có $1$ phương án đúng. Một học sinh đánh ngẫu nhiên hoàn toàn cả $5$ câu. Xác suất để học sinh đó trả lời đúng ít nhất $1$ câu là],
    (
        True([$1 - (3 / 4)^5$]),
        [$(1 / 4)^5$],
        [$1 - (1 / 4)^5$],
        [$(3 / 4)^5$]
    ),
    loigiai: [
        #step([Sử dụng biến cố đối])
        Biến cố đối của "đúng ít nhất $1$ câu" là "không trả lời đúng câu nào" ($k = 0$).
        Xác suất đúng mỗi câu ngẫu nhiên là $p = 1 / 4$, sai là $q = 3 / 4$.
        $ P("đúng ít nhất 1 câu") = 1 - P_5 (0) = 1 - C_5^0 (1 / 4)^0 (3 / 4)^5 = 1 - (3 / 4)^5 $
    ]
)

// TN 7
#tn([Một lô sản phẩm có tỉ lệ phế phẩm là $5%$. Người ta lấy ngẫu nhiên ra $6$ sản phẩm để kiểm tra độc lập. Biểu thức tính xác suất để trong $6$ sản phẩm lấy ra có đúng $1$ phế phẩm là],
    (
        True([$C_6^1 (0.05)^1 (0.95)^5$]),
        [$C_6^1 (0.05)^5 (0.95)^1$],
        [$(0.05)^1 (0.95)^5$],
        [$C_6^0 (0.05)^1 (0.95)^5$]
    ),
    loigiai: [
        #step([Công thức Bernoulli kiểm định chất lượng])
        Với $n = 6, p = 0.05, q = 0.95, k = 1$:
        $ P_6 (1) = C_6^1 (0.05)^1 (0.95)^5 $
    ]
)

// TN 8
#tn([Gieo một con xúc xắc cân đối $6$ mặt $6$ lần độc lập. Xác suất để mặt $6$ chấm xuất hiện đúng $2$ lần là],
    (
        True([$C_6^2 (1 / 6)^2 (5 / 6)^4$]),
        [$C_6^2 (1 / 6)^4 (5 / 6)^2$],
        [$(1 / 6)^2 (5 / 6)^4$],
        [$6 times (1 / 6)^2$]
    ),
    loigiai: [
        #step([Xác suất gieo xúc xắc])
        Mỗi lần gieo, xác suất ra mặt 6 chấm là $p = 1 / 6$, không ra mặt 6 là $q = 5 / 6$.
        $ P_6 (2) = C_6^2 (1 / 6)^2 (5 / 6)^4 $
    ]
)

// TN 9
#tn([Trong một chuỗi $n$ phép thử Bernoulli với xác suất thành công mỗi lần là $p$, số lần thành công có xác suất lớn nhất $k_0$ (giá trị có khả năng nhất) thỏa mãn hệ bất đẳng thức nào sau đây?],
    (
        True([$n p - q <= k_0 <= n p + p$]),
        [$k_0 = n p$],
        [$0 <= k_0 <= n$],
        [$k_0 = (n + 1) / 2$]
    ),
    loigiai: [
        #step([Số có khả năng nhất trong phân phối nhị thức])
        Giá trị $k_0$ đạt cực đại khi $P_n (k_0) >= P_n (k_0 + 1)$ và $P_n (k_0) >= P_n (k_0 - 1)$.
        Giải hai bất phương trình này ta được:
        $ (n + 1)p - 1 <= k_0 <= (n + 1)p $
        hay tương đương $n p - q <= k_0 <= n p + p$.
    ]
)

// TN 10
#tn([Gieo $10$ đồng xu cân đối độc lập. Số lần xuất hiện mặt sấp có khả năng xảy ra cao nhất là],
    (
        True([$5$]),
        [$4$],
        [$6$],
        [$5$ và $6$]
    ),
    loigiai: [
        #step([Tính k0 với p = 0.5, n = 10])
        Ta có $(n + 1)p = (10 + 1) times 0.5 = 5.5$.
        Do đó $5.5 - 1 <= k_0 <= 5.5 <=> 4.5 <= k_0 <= 5.5$.
        Vì $k_0 in ZZ$ nên $k_0 = 5$.
    ]
)

// TN 11
#tn([Khai triển nhị thức Newton của biểu thức $(0.3 + 0.7)^5$ tạo thành các số hạng. Số hạng lớn nhất trong khai triển này tương ứng với lũy thừa nào của $0.7$?],
    (
        True([$(0.7)^4$]),
        [$(0.7)^3$],
        [$(0.7)^2$],
        [$(0.7)^5$]
    ),
    loigiai: [
        #step([Tìm số hạng lớn nhất])
        Xem $(0.3 + 0.7)^5 = sum_(k=0)^5 C_5^k (0.3)^(5-k) (0.7)^k$.
        Giá trị $k_0$ thỏa mãn:
        $ (5 + 1) times 0.7 - 1 <= k_0 <= (5 + 1) times 0.7 <=> 4.2 - 1 <= k_0 <= 4.2 <=> 3.2 <= k_0 <= 4.2 $
        Vì $k_0$ nguyên nên $k_0 = 4$. Lũy thừa của $0.7$ là $(0.7)^4$.
    ]
)

// TN 12
#tn([Một hệ thống máy tính có $4$ bộ xử lý hoạt động độc lập. Xác suất để mỗi bộ xử lý hoạt động bình thường là $0.9$. Hệ thống duy trì hoạt động nếu có ít nhất $2$ bộ xử lý bình thường. Xác suất để hệ thống duy trì hoạt động là],
    (
        True([$0.9963$]),
        [$0.9477$],
        [$0.6561$],
        [$0.9850$]
    ),
    loigiai: [
        #step([Tính xác suất hệ thống hoạt động])
        Hệ thống ngừng hoạt động khi có $0$ hoặc $1$ bộ xử lý bình thường:
        - $P_4 (0) = C_4^0 (0.9)^0 (0.1)^4 = 1 times 0.0001 = 0.0001$.
        - $P_4 (1) = C_4^1 (0.9)^1 (0.1)^3 = 4 times 0.9 times 0.001 = 0.0036$.
        Xác suất hỏng là $P_4 (0) + P_4 (1) = 0.0037$.
        Vậy xác suất hệ thống hoạt động là:
        $ P = 1 - 0.0037 = 0.9963 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Một công ty sản xuất bóng đèn LED với tỉ lệ sản phẩm đạt tiêu chuẩn chất lượng cao là $p = 0.8$. Một khách hàng kiểm tra ngẫu nhiên một mẫu gồm $5$ bóng đèn độc lập.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Mini bar chart
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.2), (0, 2.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.7, 0), [$k$], anchor: "west")
    content((0, 2.7), [$P(k)$], anchor: "south")
    let b = ((0, 0.05), (1, 0.2), (2, 0.5), (3, 1.2), (4, 2.0), (5, 1.6))
    for (k, h) in b {
      rect((k + 0.2, 0), (k + 0.8, h), fill: rgb("bbf7d0"), stroke: 0.8pt + rgb("15803d"))
      content((k + 0.5, -0.25), text(size: 7pt)[#k])
    }
  })
]
],
  (
    True([Xác suất để cả $5$ bóng đèn đều đạt chuẩn là $(0.8)^5 = 0.32768$.]),
    True([Xác suất để có đúng $4$ bóng đèn đạt chuẩn là $0.4096$.]),
    True([Xác suất để có ít nhất $1$ bóng đèn không đạt chuẩn là $0.67232$.]),
    [Xác suất để có tối đa $1$ bóng đèn đạt chuẩn nhỏ hơn $0.005$.]
  ),
  loigiai: [
    #step([Xét ý a])
    Xác suất cả $5$ bóng đạt chuẩn là:
    $ P_5 (5) = C_5^5 (0.8)^5 (0.2)^0 = (0.8)^5 = 0.32768 $
    Do đó ý a ĐÚNG.

    #step([Xét ý b])
    Xác suất có đúng $4$ bóng đạt chuẩn:
    $ P_5 (4) = C_5^4 (0.8)^4 (0.2)^1 = 5 times 0.4096 times 0.2 = 0.4096 $
    Do đó ý b ĐÚNG.

    #step([Xét ý c])
    Biến cố "có ít nhất $1$ bóng không đạt chuẩn" đối lập với "cả $5$ bóng đều đạt chuẩn":
    $ 1 - P_5 (5) = 1 - 0.32768 = 0.67232 $
    Do đó ý c ĐÚNG.

    #step([Xét ý d])
    Xác suất có tối đa $1$ bóng đạt chuẩn là $P_5 (0) + P_5 (1)$:
    - $P_5 (0) = C_5^0 (0.8)^0 (0.2)^5 = 0.00032$.
    - $P_5 (1) = C_5^1 (0.8)^1 (0.2)^4 = 5 times 0.8 times 0.0016 = 0.0064$.
    Tổng là $0.00032 + 0.0064 = 0.00672 > 0.005$.
    Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Một người ném bóng rổ $6$ lần vào rổ một cách độc lập. Xác suất ném trúng mỗi lần là $p = 0.5$.],
  (
    True([Số kết quả có thể xảy ra của $6$ lần ném là $2^6 = 64$.]),
    True([Xác suất để ném trúng đúng $3$ lần là $5 / 16$.]),
    True([Xác suất ném trúng số lần chẵn ($0, 2, 4, 6$ lần) bằng xác suất ném trúng số lần lẻ ($1, 3, 5$ lần).]),
    True([Xác suất để ném trúng ít nhất $5$ lần là $7 / 64$.])
  ),
  loigiai: [
    #step([Xét ý a])
    Mỗi lần có 2 khả năng (trúng hoặc trượt), $6$ lần có $2^6 = 64$ kết quả (đồng khả năng vì $p = 0.5$).
    Do đó ý a ĐÚNG.

    #step([Xét ý b])
    $ P_6 (3) = C_6^3 (1 / 2)^3 (1 / 2)^3 = 20 / 64 = 5 / 16 $
    Do đó ý b ĐÚNG.

    #step([Xét ý c])
    Tổng xác suất chẵn là $1 / 2^6 sum_(k "chẵn") C_6^k$.
    Tổng xác suất lẻ là $1 / 2^6 sum_(k "lẻ") C_6^k$.
    Theo tính chất nhị thức Newton: $sum_(k "chẵn") C_6^k = sum_(k "lẻ") C_6^k = 2^(6 - 1) = 32$.
    Do đó hai xác suất này đều bằng $32 / 64 = 1 / 2$.
    Do đó ý c ĐÚNG.

    #step([Xét ý d])
    Xác suất ném trúng ít nhất $5$ lần là $P_6 (5) + P_6 (6)$:
    $ P_6 (5) + P_6 (6) = (C_6^5 + C_6^6) / 64 = (6 + 1) / 64 = 7 / 64 $
    Do đó ý d ĐÚNG.
  ]
)

// DS 3 (Câu 15)
#ds([Một xét nghiệm y khoa phát hiện một loại virus có độ chính xác $90%$ (tức xác suất cho kết quả đúng là $p = 0.9$, xác suất sai là $q = 0.1$). Người ta tiến hành xét nghiệm độc lập $3$ lần trên mẫu bệnh phẩm của cùng một bệnh nhân nhiễm virus.],
  (
    True([Xác suất để cả $3$ lần xét nghiệm đều cho kết quả dương tính là $0.729$.]),
    True([Xác suất để có ít nhất một lần xét nghiệm cho kết quả âm tính giả là $0.271$.]),
    True([Xác suất để có đúng $2$ lần cho kết quả dương tính là $0.243$.]),
    [Quy tắc y khoa kết luận người này nhiễm virus nếu có ít nhất $2$ trong $3$ lần dương tính. Xác suất kết luận đúng của quy trình này là $0.950$.]
  ),
  loigiai: [
    #step([Xét ý a])
    $ P_3 (3) = C_3^3 (0.9)^3 = 0.729 $.
    Do đó ý a ĐÚNG.

    #step([Xét ý b])
    Biến cố đối của "cả 3 lần đều dương tính" là "ít nhất 1 lần âm tính":
    $ 1 - P_3 (3) = 1 - 0.729 = 0.271 $.
    Do đó ý b ĐÚNG.

    #step([Xét ý c])
    $ P_3 (2) = C_3^2 (0.9)^2 (0.1)^1 = 3 times 0.81 times 0.1 = 0.243 $.
    Do đó ý c ĐÚNG.

    #step([Xét ý d])
    Xác suất có ít nhất $2$ lần dương tính là:
    $ P_3 (2) + P_3 (3) = 0.243 + 0.729 = 0.972 $.
    Con số $0.972 != 0.950$.
    Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Một thí sinh tham gia thi trắc nghiệm gồm $10$ câu hỏi độc lập. Mỗi câu có $4$ phương án, chỉ có $1$ phương án đúng. Thí sinh này chọn hoàn toàn ngẫu nhiên.],
  (
    True([Xác suất để thí sinh làm đúng toàn bộ $10$ câu là $(1 / 4)^(10) approx 9.54 times 10^(-7)$.]),
    [Số câu đúng có khả năng xảy ra cao nhất là $2$ hoặc $3$ câu.],
    [Xác suất để thí sinh trả lời đúng đúng $5$ câu lớn hơn $0.1$.],
    [Để xác suất trả lời đúng ít nhất $1$ câu lớn hơn $99%$, bài thi cần có tối thiểu $16$ câu hỏi.]
  ),
  loigiai: [
    #step([Xét ý a])
    $ P_(10) (10) = (1 / 4)^(10) approx 9.5367 times 10^(-7) $.
    Do đó ý a ĐÚNG.

    #step([Xét ý b])
    Tìm số câu đúng có khả năng cao nhất $k_0$:
    $ (n + 1)p - 1 <= k_0 <= (n + 1)p $
    Với $n = 10, p = 0.25$: $(10 + 1) times 0.25 = 2.75$.
    Suy ra $1.75 <= k_0 <= 2.75 => k_0 = 2$.
    Giá trị khả dĩ duy nhất là $k_0 = 2$, không phải $3$.
    Do đó ý b SAI.

    #step([Xét ý c])
    Tính xác suất đúng $5$ câu:
    $ P_(10) (5) = C_(10)^5 (1 / 4)^5 (3 / 4)^5 = 252 times (243 / 4^(10)) = 61236 / 1048576 approx 0.0584 < 0.1 $.
    Do đó ý c SAI.

    #step([Xét ý d])
    Xác suất đúng ít nhất 1 câu trong $n$ câu là $1 - (3 / 4)^n$.
    Yêu cầu:
    $ 1 - (3 / 4)^n > 0.99 <=> (3 / 4)^n < 0.01 <=> n > (ln(0.01)) / (ln(0.75)) approx (-4.605) / (-0.2877) approx 16.01 $
    Vì $n$ là số nguyên dương nên $n >= 17$. Do đó cần ít nhất $17$ câu hỏi, không phải $16$.
    Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Một xạ thủ bắn $5$ phát súng độc lập vào bia, xác suất trúng đích mỗi phát là $0.6$. Gọi $k_0$ là số phát trúng đích có xác suất xảy ra lớn nhất. Tìm giá trị của $k_0$.],
    [3],
    loigiai: [
        #step([Áp dụng công thức tìm k0])
        Với $n = 5, p = 0.6$:
        $ (n + 1)p = (5 + 1) times 0.6 = 3.6 $
        Hệ điều kiện cho $k_0$:
        $ 3.6 - 1 <= k_0 <= 3.6 <=> 2.6 <= k_0 <= 3.6 $
        Do $k_0 in NN$ nên $k_0 = 3$.
    ]
)

// TLN 2 (Câu 18)
#tln([Một bài kiểm tra gồm $4$ câu hỏi độc lập, mỗi câu có $2$ lựa chọn Đúng hoặc Sai. Một học sinh chọn ngẫu nhiên. Tính số kết quả thuận lợi cho biến cố học sinh trả lời đúng ít nhất $3$ câu.],
    [5],
    loigiai: [
        #step([Đếm số cách chọn])
        Học sinh đúng ít nhất 3 câu gồm 2 trường hợp:
        - Đúng cả 4 câu: có $C_4^4 = 1$ cách.
        - Đúng đúng 3 câu (và sai 1 câu): có $C_4^3 = 4$ cách.
        Tổng số kết quả thuận lợi là:
        $ 1 + 4 = 5 $ cách.
    ]
)

// TLN 3 (Câu 19)
#tln([Một hộp linh kiện điện tử có tỉ lệ hỏng là $10%$. Một kỹ sư lấy ngẫu nhiên ra $3$ linh kiện để kiểm tra. Tính xác suất để trong $3$ linh kiện lấy ra có đúng $2$ linh kiện hoạt động tốt (viết kết quả dưới dạng số thập phân).],
    [0.243],
    loigiai: [
        #step([Áp dụng công thức Bernoulli])
        Xác suất linh kiện tốt là $p = 1 - 0.1 = 0.9$, hỏng là $q = 0.1$.
        Xác suất có đúng $2$ linh kiện tốt trong $3$ linh kiện là:
        $ P_3 (2) = C_3^2 (0.9)^2 (0.1)^1 = 3 times 0.81 times 0.1 = 0.243 $
    ]
)

// TLN 4 (Câu 20)
#tln([Tỉ lệ sinh con trai là $0.51$, sinh con gái là $0.49$. Một cặp vợ chồng dự định sinh $4$ người con độc lập. Tính xác suất để gia đình đó sinh được cả con trai lẫn con gái (kết quả làm tròn đến hàng phần mười nghìn).],
    [0.8747],
    loigiai: [
        #step([Sử dụng biến cố đối])
        Biến cố đối của "có cả con trai lẫn con gái" là:
        - Toàn con trai: xác suất $(0.51)^4 approx 0.067652$.
        - Toàn con gái: xác suất $(0.49)^4 approx 0.057648$.
        Tổng xác suất của biến cố đối là:
        $ (0.51)^4 + (0.49)^4 = 0.067652 + 0.057648 = 0.125300 $
        Vậy xác suất cần tìm là:
        $ P = 1 - 0.125300 = 0.8747 $
    ]
)

// TLN 5 (Câu 21)
#tln([Một thiết bị thu phát sóng radar phát đi $n$ tín hiệu độc lập. Xác suất để máy thu nhận được mỗi tín hiệu là $0.4$. Để xác suất máy thu nhận được ít nhất $1$ tín hiệu đạt từ $95%$ trở lên, số tín hiệu tối thiểu cần phát là bao nhiêu?],
    [6],
    loigiai: [
        #step([Thiết lập bất phương trình biến cố đối])
        Xác suất không nhận được tín hiệu nào trong $n$ tín hiệu là $(1 - 0.4)^n = (0.6)^n$.
        Yêu cầu:
        $ 1 - (0.6)^n >= 0.95 <=> (0.6)^n <= 0.05 $
        #step([Lấy logarit tự nhiên])
        $ n ln(0.6) <= ln(0.05) <=> n >= (ln(0.05)) / (ln(0.6)) approx (-2.9957) / (-0.5108) approx 5.865 $
        Do $n in NN^*$ nên $n$ tối thiểu bằng $6$.
    ]
)

// TLN 6 (Câu 22)
#tln([Trong một giải đấu cờ vua, hai kỳ thủ $A$ và $B$ thi đấu tối đa $5$ ván (không có hòa). Kỳ thủ $A$ có xác suất thắng mỗi ván là $0.6$. Ai thắng trước $3$ ván sẽ giành chức vô địch. Tính xác suất để kỳ thủ $A$ thắng giải sau đúng $4$ ván (kết quả dưới dạng số thập phân làm tròn đến hàng phần nghìn).],
    [0.259],
    loigiai: [
        #step([Phân tích điều kiện sau đúng 4 ván])
        Kỳ thủ $A$ thắng ở ván thứ 4 khi và chỉ khi:
        - Trong $3$ ván đầu tiên, kỳ thủ $A$ thắng đúng $2$ ván và thua $1$ ván.
        - Ở ván thứ $4$, kỳ thủ $A$ thắng.
        #step([Tính xác suất])
        Xác suất trong 3 ván đầu thắng đúng 2 ván:
        $ P_3 (2) = C_3^2 (0.6)^2 (0.4)^1 = 3 times 0.36 times 0.4 = 0.432 $
        Xác suất thắng ván thứ 4 là $0.6$.
        Vì các ván độc lập, xác suất kỳ thủ $A$ thắng sau đúng 4 ván là:
        $ P = 0.432 times 0.6 = 0.2592 approx 0.259 $
    ]
)

] // end make-questions

#make-questions()
