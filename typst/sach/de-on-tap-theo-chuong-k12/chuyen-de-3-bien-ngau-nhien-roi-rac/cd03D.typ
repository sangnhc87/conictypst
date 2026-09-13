#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("9f1239") // Crimson Rose

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG",
  exam-title: "ĐỀ ÔN TẬP CHUYÊN ĐỀ 3D: PHÉP THỬ BERNOULLI & PHÂN BỐ XÁC SUẤT NHỊ THỨC B(n, p)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "524",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Gieo một con xúc xắc cân đối và đồng chất $5$ lần độc lập. Gọi $X$ là số lần xuất hiện mặt $6$ chấm trong $5$ lần gieo đó. Biến ngẫu nhiên $X$ tuân theo quy luật phân bố xác suất nào và xác suất để mặt $6$ chấm xuất hiện đúng $2$ lần bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình chuỗi 5 phép thử Bernoulli độc lập
    for i in range(5) {
      rect((i * 1.3 - 2.8, -0.4), (i * 1.3 - 1.8, 0.4), stroke: 1pt + accent, fill: accent.lighten(85%))
      content((i * 1.3 - 2.3, 0), text(size: 8pt, weight: "bold", fill: accent, [Lần #(i + 1)]))
      content((i * 1.3 - 2.3, -0.65), text(size: 7pt, [$p = 1/6$]))
    }
  })
]
],
    (
        [$X ~ B(5; 1/2)$ và $P(X = 2) = 5/16$],
        True([$X ~ B(5; 1/6)$ và $P(X = 2) = frac(625, 3888)$]),
        [$X ~ B(5; 1/6)$ và $P(X = 2) = frac(125, 3888)$],
        [$X ~ B(6; 1/5)$ và $P(X = 2) = frac(128, 625)$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Mỗi lần gieo xúc xắc là một phép thử Bernoulli với hai kết quả:
           - "Xuất hiện mặt $6$ chấm" với xác suất $p = frac(1, 6)$.
           - "Không xuất hiện mặt $6$ chấm" với xác suất $q = 1 - p = frac(5, 6)$.
        2. Các lần gieo hoàn toàn độc lập với nhau, do đó số lần xuất hiện mặt $6$ chấm trong $n = 5$ lần gieo là biến ngẫu nhiên tuân theo phân bố nhị thức $X ~ B(n, p) = B(5; 1/6)$.
        3. Công thức tính xác suất nhị thức:
           $ P(X = k) = C_n^k p^k (1 - p)^(n - k) $

        #step([Lời giải chi tiết])
        Với $n = 5, p = frac(1, 6), k = 2$:
        $ P(X = 2) = C_5^2 dot (frac(1, 6))^2 dot (frac(5, 6))^(5 - 2) = 10 dot frac(1, 36) dot frac(125, 216) $
        $ P(X = 2) = frac(10 dot 125, 36 dot 216) = frac(1250, 7776) = frac(625, 3888) approx 0","1608 $
    ]
)

// TN 2
#tn([Một xạ thủ bắn súng thể thao bắn độc lập $4$ phát đạn vào bia. Xác suất bắn trúng mục tiêu của xạ thủ trong mỗi phát bắn đều bằng $p = 0","7$. Xác suất để xạ thủ bắn trúng mục tiêu đúng $3$ phát bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ bia bắn súng với các vòng tròn đồng tâm
    circle((0, 0), radius: 1.5, stroke: 1.2pt + accent, fill: white)
    circle((0, 0), radius: 1.0, stroke: 0.8pt + accent, fill: accent.lighten(85%))
    circle((0, 0), radius: 0.5, stroke: 0.8pt + accent, fill: accent.lighten(60%))
    circle((0, 0), radius: 0.15, fill: rgb("ea580c"))
    content((0, -1.8), text(size: 7.5pt, weight: "bold", fill: accent, [Bia mục tiêu: n = 4 phát, p = 0,7]))
    
    // 3 phát trúng trong tâm, 1 phát lệch ngoài
    circle((-0.2, 0.2), radius: 0.05, fill: rgb("dc2626"))
    circle((0.2, -0.1), radius: 0.05, fill: rgb("dc2626"))
    circle((0.0, 0.3), radius: 0.05, fill: rgb("dc2626"))
    circle((1.2, 0.8), radius: 0.05, fill: gray)
  })
]
],
    (
        [$0","3430$],
        [$0","2401$],
        True([$0","4116$]),
        [$0","0823$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số phát bắn trúng $X$ trong $n = 4$ phát độc lập là biến ngẫu nhiên nhị thức $X ~ B(4; 0","7)$.
        Áp dụng công thức Bernoulli:
        $ P(X = k) = C_n^k p^k (1 - p)^(n - k) $

        #step([Lời giải chi tiết])
        Với $n = 4, k = 3, p = 0","7$ và $q = 1 - 0","7 = 0","3$:
        $ P(X = 3) = C_4^3 dot (0","7)^3 dot (0","3)^1 = 4 dot 0","343 dot 0","3 $
        $ P(X = 3) = 4 dot 0","1029 = 0","4116 $
    ]
)

// TN 3
#tn([Thực hiện $n = 20$ phép thử Bernoulli độc lập với xác suất thành công trong mỗi phép thử là $p = 0","35$. Giá trị tin chắc nhất (số lần thành công có xác suất xuất hiện lớn nhất) $k_0$ của biến ngẫu nhiên $X ~ B(20; 0","35)$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị cột phân bố nhị thức n=20, p=0.35 có đỉnh tại k=7
    line((-0.5, 0), (5.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((5.7, 0), text(size: 8pt, [$k$]))
    line((0, -0.2), (0, 2.5), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 2.7), text(size: 8pt, [$P(X=k)$]))
    
    // Một số cột lân cận đỉnh
    let cols = ((1.5, 0.8, "5"), (2.2, 1.4, "6"), (2.9, 1.9, "7"), (3.6, 1.5, "8"), (4.3, 0.9, "9"))
    for (x, h, lbl) in cols {
      let is_mode = (lbl == "7")
      let clr = if is_mode { rgb("dc2626") } else { accent.lighten(60%) }
      rect((x - 0.25, 0), (x + 0.25, h), fill: clr, stroke: 0.8pt + accent)
      content((x, -0.3), text(size: 7.5pt, weight: if is_mode { "bold" } else { "regular" }, lbl))
    }
    content((2.9, 2.2), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [Đỉnh Mode k_0 = 7]))
  })
]
],
    (
        [$k_0 = 6$],
        True([$k_0 = 7$]),
        [$k_0 = 8$],
        [$k_0 = 9$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị tin chắc nhất $k_0$ của biến ngẫu nhiên nhị thức $X ~ B(n, p)$ là số nguyên thỏa mãn bất đẳng thức kép:
        $ (n + 1) p - 1 <= k_0 <= (n + 1) p $
        Nếu $(n + 1) p$ không phải là số nguyên thì có duy nhất một giá trị tin chắc nhất $k_0 = floor((n + 1) p)$.

        #step([Lời giải chi tiết])
        Với $n = 20$ và $p = 0","35$:
        $ (n + 1) p = (20 + 1) dot 0","35 = 21 dot 0","35 = 7","35 $
        Áp dụng bất đẳng thức kép:
        $ 7","35 - 1 <= k_0 <= 7","35 <=> 6","35 <= k_0 <= 7","35 $
        Vì $k_0$ là số nguyên nên duy nhất $k_0 = 7$.
        Số lần thành công có xác suất xuất hiện lớn nhất là $7$.
    ]
)

// TN 4
#tn([Thực hiện $n = 19$ phép thử Bernoulli độc lập với xác suất thành công mỗi phép thử là $p = 0","4$. Khẳng định nào sau đây là đúng về các giá trị tin chắc nhất của biến ngẫu nhiên $X ~ B(19; 0","4)$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu đồ nhị thức có hai đỉnh bằng nhau tại k = 7 và k = 8
    line((-0.5, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$k$]))
    line((0, -0.2), (0, 2.2), stroke: 1pt + accent, mark: (end: "stealth"))
    
    // Hai đỉnh cao bằng nhau tại 7 và 8
    rect((1.6, 0), (2.1, 1.6), fill: rgb("dc2626"), stroke: 0.8pt + accent)
    rect((2.4, 0), (2.9, 1.6), fill: rgb("dc2626"), stroke: 0.8pt + accent)
    content((1.85, -0.3), text(size: 7.5pt, weight: "bold", [7]))
    content((2.65, -0.3), text(size: 7.5pt, weight: "bold", [8]))
    
    line((1.3, 1.6), (3.2, 1.6), stroke: (dash: "dashed", paint: rgb("dc2626"), thickness: 1pt))
    content((2.25, 1.9), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [Hai đỉnh bằng nhau: P(X=7) = P(X=8)]))
  })
]
],
    (
        [Chỉ có một giá trị tin chắc nhất duy nhất là $k_0 = 8$],
        [Chỉ có một giá trị tin chắc nhất duy nhất là $k_0 = 7$],
        True([Có hai giá trị tin chắc nhất đồng thời là $k_0 = 7$ và $k_0 = 8$ với xác suất bằng nhau]),
        [Có hai giá trị tin chắc nhất là $k_0 = 8$ và $k_0 = 9$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị tin chắc nhất $k_0$ thỏa mãn:
        $ (n + 1) p - 1 <= k_0 <= (n + 1) p $
        Khi $(n + 1) p$ là một số nguyên dương, bất đẳng thức kép có đúng hai nghiệm nguyên là $k_0 = (n + 1) p - 1$ và $k_0' = (n + 1) p$. Khi đó, xác suất tại hai giá trị này bằng nhau và cùng đạt mức cực đại: $P(X = k_0) = P(X = k_0')$.

        #step([Lời giải chi tiết])
        Với $n = 19, p = 0","4$:
        $ (n + 1) p = (19 + 1) dot 0","4 = 20 dot 0","4 = 8 " (là số nguyên)" $
        Khi đó:
        $ 8 - 1 <= k_0 <= 8 <=> 7 <= k_0 <= 8 $
        Do đó có đúng hai giá trị nguyên thỏa mãn là $k_0 = 7$ và $k_0' = 8$.
        Kiểm tra tỷ số xác suất:
        $ frac(P(X = 8), P(X = 7)) = frac(19 - 7, 7 + 1) dot frac(p, 1 - p) = frac(12, 8) dot frac(0","4, 0","6) = frac(3, 2) dot frac(2, 3) = 1 $
        Điều này chứng minh $P(X = 7) = P(X = 8)$, cả hai đều là giá trị tin chắc nhất.
    ]
)

// TN 5
#tn([Xác suất trúng thưởng của một vé số cào điện tử là $p = 0","05$ ($5%$). Một người chơi mua $n$ vé độc lập. Số lượng vé tối thiểu người đó cần mua để xác suất có ít nhất một vé trúng thưởng không nhỏ hơn $95%$ ($0","95$) bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị hàm xác suất P(n) = 1 - (0.95)^n tiến tới 1
    line((-0.2, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$n$]))
    line((0, -0.2), (0, 2.4), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 2.6), text(size: 8pt, [$P(X >= 1)$]))
    
    // Đường tiệm cận 1.0 (y = 2.0)
    line((0, 2.0), (4.2, 2.0), stroke: (dash: "dotted", paint: gray))
    content((-0.4, 2.0), text(size: 7.5pt, [1,0]))
    
    // Mức 0.95 (y = 1.9)
    line((0, 1.9), (4.2, 1.9), stroke: (dash: "dashed", paint: rgb("dc2626"), thickness: 0.8pt))
    content((-0.5, 1.9), text(size: 7.5pt, fill: rgb("dc2626"), [0,95]))
    
    // Đường cong tăng trưởng
    line((0, 0), (0.8, 0.7), (1.6, 1.25), (2.4, 1.6), (3.2, 1.9), (4.0, 1.97), stroke: 1.5pt + accent)
    circle((3.2, 1.9), radius: 0.08, fill: rgb("dc2626"))
    line((3.2, 0), (3.2, 1.9), stroke: (dash: "dashed", paint: rgb("dc2626")))
    content((3.2, -0.35), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"), [n = 59]))
  })
]
],
    (
        [$n = 20$ vé],
        [$n = 45$ vé],
        True([$n = 59$ vé]),
        [$n = 60$ vé]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Gọi $X$ là số vé trúng thưởng trong $n$ vé mua được: $X ~ B(n; 0","05)$.
        2. Biến cố "Có ít nhất một vé trúng thưởng" là biến cố đối của "Không có vé nào trúng thưởng" ($X = 0$).
        3. Xác suất:
           $ P(X >= 1) = 1 - P(X = 0) = 1 - (1 - p)^n $
        4. Thiết lập bất phương trình $1 - (1 - p)^n >= 1 - alpha$ và giải tìm số nguyên dương $n$ nhỏ nhất.

        #step([Lời giải chi tiết])
        Ta có $p = 0","05 ==> 1 - p = 0","95$.
        Xác suất không có vé nào trúng là: $P(X = 0) = (0","95)^n$.
        Yêu cầu bài toán:
        $ P(X >= 1) >= 0","95 <=> 1 - (0","95)^n >= 0","95 $
        $ <=> (0","95)^n <= 0","05 $
        Lấy logarit tự nhiên hai vế (lưu ý $ln(0","95) < 0$ nên bất đẳng thức đổi chiều):
        $ n dot ln(0","95) <= ln(0","05) <=> n >= frac(ln(0","05), ln(0","95)) $
        Tính giá trị xấp xỉ:
        $ ln(0","05) approx -2","99573 $
        $ ln(0","95) approx -0","05129 $
        $ n >= frac(-2","99573, -0","05129) approx 58","41 $
        Vì $n$ là số nguyên dương nên số vé tối thiểu cần mua là $n = 59$ vé.
    ]
)

// TN 6
#tn([Một lô linh kiện điện tử lớn có tỷ lệ sản phẩm lỗi là $p = 0","02$ ($2%$). Chọn ngẫu nhiên có hoàn lại $100$ linh kiện để kiểm tra chất lượng. Xác suất để trong mẫu kiểm tra có không quá $1$ sản phẩm lỗi xấp xỉ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Minh họa lô hàng và mẫu 100 linh kiện
    rect((-2.5, -0.8), (0.2, 0.8), stroke: 1pt + accent, fill: accent.lighten(90%))
    content((-1.15, 0.4), text(size: 7.5pt, weight: "bold", fill: accent, [Lô hàng lớn]))
    content((-1.15, -0.1), text(size: 7pt, [Tỷ lệ lỗi: p = 0,02]))
    
    line((0.3, 0), (1.2, 0), stroke: 1.2pt + accent, mark: (end: "stealth"))
    content((0.75, 0.3), text(size: 7pt, [Lấy mẫu]))
    
    rect((1.3, -0.8), (4.0, 0.8), stroke: 1pt + rgb("ea580c"), fill: rgb("ea580c").lighten(90%))
    content((2.65, 0.4), text(size: 7.5pt, weight: "bold", fill: rgb("ea580c"), [Mẫu n = 100 linh kiện]))
    content((2.65, -0.1), text(size: 7pt, [Không quá 1 lỗi: k = 0 hoặc 1]))
  })
]
],
    (
        [$0","1326$],
        [$0","2707$],
        True([$0","4033$]),
        [$0","6767$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số sản phẩm lỗi $X$ trong $100$ linh kiện tuân theo phân bố nhị thức $X ~ B(100; 0","02)$.
        Biến cố "Có không quá $1$ sản phẩm lỗi" tương đương với $X <= 1$, tức là $X = 0$ hoặc $X = 1$:
        $ P(X <= 1) = P(X = 0) + P(X = 1) $

        #step([Lời giải chi tiết])
        Tính từng xác suất:
        $ P(X = 0) = C_{100}^0 dot (0","02)^0 dot (0","98)^{100} = (0","98)^{100} approx 0","1326 $
        $ P(X = 1) = C_{100}^1 dot (0","02)^1 dot (0","98)^{99} = 100 dot 0","02 dot (0","98)^{99} = 2 dot (0","98)^{99} $
        Vì $(0","98)^{99} = frac((0","98)^{100}, 0","98) approx frac(0","1326, 0","98) approx 0","1353$, nên:
        $ P(X = 1) approx 2 dot 0","1353 = 0","2706 $
        Tổng xác suất:
        $ P(X <= 1) = P(X = 0) + P(X = 1) approx 0","1326 + 0","2706 = 0","4032 approx 0","4033 $
    ]
)

// TN 7
#tn([Trong một kênh truyền tin nhị phân đối xứng (Binary Symmetric Channel - BSC), mỗi bit dữ liệu ($0$ hoặc $1$) được truyền đi với xác suất bị lỗi (bị đảo bit từ $0 -> 1$ hoặc $1 -> 0$) là $p = 0","01$. Để truyền một bit thông tin, bên phát gửi đi chuỗi $5$ bit lặp lại (ví dụ muốn gửi bit $1$ thì phát $11111$). Bên nhận giải mã theo nguyên tắc biểu quyết đa số: nếu nhận được từ $3$ bit $1$ trở lên thì quyết định bit gửi là $1$. Xác suất truyền thành công bit $1$ qua kênh truyền có mã lặp này xấp xỉ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình kênh truyền tin BSC với biểu quyết đa số
    rect((-2.5, -0.6), (-1.2, 0.6), stroke: 1pt + accent, fill: accent.lighten(85%))
    content((-1.85, 0), text(size: 7.5pt, weight: "bold", fill: accent, [Phát: 11111]))
    
    line((-1.1, 0), (0.2, 0), stroke: 1.2pt + accent, mark: (end: "stealth"))
    content((-0.45, 0.3), text(size: 7pt, [Kênh nhiễu p = 0,01]))
    
    rect((0.3, -0.6), (2.0, 0.6), stroke: 1pt + rgb("ea580c"), fill: rgb("ea580c").lighten(85%))
    content((1.15, 0.2), text(size: 7.5pt, weight: "bold", fill: rgb("ea580c"), [Bên nhận]))
    content((1.15, -0.2), text(size: 6.5pt, [Đa số >= 3 bit '1']))
    
    line((2.1, 0), (3.2, 0), stroke: 1.2pt + rgb("16a34a"), mark: (end: "stealth"))
    content((3.8, 0), text(size: 7.5pt, weight: "bold", fill: rgb("16a34a"), [Giải mã: '1']))
  })
]
],
    (
        [$0","9510$],
        [$0","9800$],
        [$0","9900$],
        True([$0","9999$])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Gọi $X$ là số bit nhận được giá trị $1$ đúng trong số $5$ bit gửi đi.
        2. Xác suất mỗi bit không bị đảo (truyền đúng) là $p' = 1 - 0","01 = 0","99$.
        3. Do các bit truyền độc lập nên $X ~ B(5; 0","99)$.
        4. Bên nhận giải mã đúng bit $1$ khi có ít nhất $3$ bit đúng: $P(X >= 3) = P(X = 3) + P(X = 4) + P(X = 5)$.

        #step([Lời giải chi tiết])
        Tính xác suất:
        $ P(X = 5) = (0","99)^5 approx 0","95099 $
        $ P(X = 4) = C_5^4 dot (0","99)^4 dot (0","01)^1 = 5 dot 0","960596 dot 0","01 approx 0","04803 $
        $ P(X = 3) = C_5^3 dot (0","99)^3 dot (0","01)^2 = 10 dot 0","970299 dot 0","0001 approx 0","00097 $
        Tổng xác suất giải mã đúng:
        $ P(X >= 3) = 0","95099 + 0","04803 + 0","00097 = 0","99999 approx 0","9999 $
        Ý nghĩa kỹ thuật: Nhờ mã lặp $5$ bit và nguyên tắc đa số, xác suất lỗi giảm từ $10^(-2)$ ($1%$) xuống dưới $10^(-4)$ ($0","01%$).
    ]
)

// TN 8
#tn([Cho biến ngẫu nhiên nhị thức $X ~ B(n, p)$ với $0 < p < 1$ và đặt $q = 1 - p$. Với mỗi số nguyên $k$ thỏa mãn $0 <= k < n$, tỷ số giữa hai xác suất liên tiếp $frac(P(X = k + 1), P(X = k))$ được rút gọn thành:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô tả bậc thang bước nhảy giữa P(k) và P(k+1)
    line((0, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$k$]))
    line((0, 0), (0, 2.2), stroke: 1pt + accent, mark: (end: "stealth"))
    
    rect((1.0, 0), (1.6, 1.0), fill: accent.lighten(70%), stroke: 0.8pt + accent)
    content((1.3, -0.3), text(size: 7.5pt, [$k$]))
    
    rect((2.2, 0), (2.8, 1.7), fill: accent, stroke: 0.8pt + accent)
    content((2.5, -0.3), text(size: 7.5pt, [$k+1$]))
    
    line((1.3, 1.0), (2.5, 1.7), stroke: (dash: "dashed", paint: rgb("ea580c"), thickness: 1.2pt), mark: (end: "stealth"))
    content((2.2, 1.9), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold", [Tỷ số bước nhảy]))
  })
]
],
    (
        [$frac(n - k + 1, k) dot frac(p, q)$],
        True([$frac(n - k, k + 1) dot frac(p, q)$]),
        [$frac(k + 1, n - k) dot frac(p, q)$],
        [$frac(n - k, k + 1) dot frac(q, p)$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khai triển công thức Bernoulli của $P(X = k + 1)$ và $P(X = k)$:
        $ P(X = k + 1) = C_n^(k + 1) p^(k + 1) q^(n - k - 1) $
        $ P(X = k) = C_n^k p^k q^(n - k) $
        Lập tỷ số và rút gọn giai thừa: $C_n^(k + 1) = frac(n!, (k + 1)! (n - k - 1)!)$ và $C_n^k = frac(n!, k! (n - k)!)$.

        #step([Lời giải chi tiết])
        Xét tỷ số:
        $ frac(P(X = k + 1), P(X = k)) = frac(C_n^(k + 1) p^(k + 1) q^(n - k - 1), C_n^k p^k q^(n - k)) $
        Rút gọn phần lũy thừa của $p$ và $q$:
        $ frac(p^(k + 1), p^k) = p, quad frac(q^(n - k - 1), q^(n - k)) = frac(1, q) ==> frac(p^(k + 1) q^(n - k - 1), p^k q^(n - k)) = frac(p, q) $
        Rút gọn phần tổ hợp:
        $ frac(C_n^(k + 1), C_n^k) = frac(frac(n!, (k + 1)! (n - k - 1)!), frac(n!, k! (n - k)!)) = frac(k! (n - k)!, (k + 1)! (n - k - 1)!) = frac(n - k, k + 1) $
        Kết hợp lại ta được:
        $ frac(P(X = k + 1), P(X = k)) = frac(n - k, k + 1) dot frac(p, q) $
        (Hệ quả: Đây chính là cơ sở toán học để chứng minh bất đẳng thức xác định giá trị tin chắc nhất $k_0$).
    ]
)

// TN 9
#tn([Một trung tâm xử lý dữ liệu đám mây duy trì hoạt động thông qua một cụm gồm $6$ máy chủ độc lập. Xác suất để mỗi máy chủ gặp sự cố quá tải trong một ngày là $0","1$. Trung tâm được bảo đảm hoạt động an toàn nếu có ít nhất $4$ máy chủ hoạt động bình thường. Xác suất để trung tâm dữ liệu duy trì hoạt động an toàn trong ngày xấp xỉ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô phỏng cụm máy chủ 6 node
    for i in range(3) {
      for j in range(2) {
        rect((i * 1.5 - 1.8, j * 0.9 - 0.7), (i * 1.5 - 0.6, j * 0.9 - 0.1), stroke: 0.8pt + accent, fill: accent.lighten(85%))
        content((i * 1.5 - 1.2, j * 0.9 - 0.4), text(size: 6.5pt, [Server #(i * 2 + j + 1)]))
      }
    }
    content((0.2, 0.9), text(size: 7.5pt, weight: "bold", fill: accent, [Cụm 6 Node: Cần >= 4 Node hoạt động]))
  })
]
],
    (
        [$0","9000$],
        [$0","9477$],
        [$0","9815$],
        True([$0","9842$])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Gọi $Y$ là số máy chủ hoạt động bình thường trong ngày.
        2. Xác suất một máy chủ hoạt động tốt là $p' = 1 - 0","1 = 0","9$.
        3. Do $6$ máy chủ độc lập nên $Y ~ B(6; 0","9)$.
        4. Điều kiện an toàn: $Y >= 4$, tức là $Y in {4, 5, 6}$.
           $ P(Y >= 4) = P(Y = 4) + P(Y = 5) + P(Y = 6) $

        #step([Lời giải chi tiết])
        Tính các xác suất thành phần:
        $ P(Y = 6) = (0","9)^6 = 0","531441 $
        $ P(Y = 5) = C_6^5 dot (0","9)^5 dot (0","1)^1 = 6 dot 0","59049 dot 0","1 = 0","354294 $
        $ P(Y = 4) = C_6^4 dot (0","9)^4 dot (0","1)^2 = 15 dot 0","6561 dot 0","01 = 0","098415 $
        Tổng xác suất hoạt động an toàn:
        $ P(Y >= 4) = 0","531441 + 0","354294 + 0","098415 = 0","98415 approx 0","9842 $
    ]
)

// TN 10
#tn([Gieo một con xúc xắc cân đối liên tiếp nhiều lần độc lập. Trò chơi dừng lại ngay khi xuất hiện mặt $6$ chấm lần thứ hai, hoặc dừng lại sau khi đã gieo tối đa $4$ lần. Xác suất để trò chơi kết thúc ở đúng lần gieo thứ $3$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình chuỗi kết quả dừng ở lần 3
    rect((-2.5, -0.4), (-1.3, 0.4), stroke: 1pt + accent, fill: white)
    content((-1.9, 0), text(size: 7pt, [Lần 1, 2]))
    content((-1.9, -0.65), text(size: 6.5pt, [Đúng 1 lần '6']))
    
    line((-1.2, 0), (-0.2, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    
    rect((-0.1, -0.4), (1.1, 0.4), stroke: 1.2pt + rgb("dc2626"), fill: rgb("dc2626").lighten(85%))
    content((0.5, 0), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"), [Lần 3: '6']))
    content((0.5, -0.65), text(size: 6.5pt, [Lần thứ 2 ra '6']))
    
    line((1.2, 0), (2.2, 0), stroke: 1.2pt + rgb("16a34a"), mark: (end: "stealth"))
    content((3.0, 0), text(size: 7.5pt, weight: "bold", fill: rgb("16a34a"), [DỪNG]))
  })
]
],
    (
        [$frac(1, 36)$],
        True([$frac(5, 108)$]),
        [$frac(5, 216)$],
        [$frac(25, 216)$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Để trò chơi kết thúc ở đúng lần gieo thứ $3$, cần thỏa mãn đồng thời hai điều kiện độc lập:
        1. Trong $2$ lần gieo đầu tiên, mặt $6$ chấm xuất hiện đúng $1$ lần (tuân theo phân bố nhị thức $B(2; 1/6)$).
        2. Ở lần gieo thứ $3$, mặt $6$ chấm xuất hiện (đây là lần thứ hai ra mặt $6$).

        #step([Lời giải chi tiết])
        - Xác suất trong $2$ lần đầu có đúng $1$ lần ra mặt $6$:
          $ P_1 = C_2^1 dot (frac(1, 6))^1 dot (frac(5, 6))^1 = 2 dot frac(5, 36) = frac(10, 36) = frac(5, 18) $
        - Xác suất lần thứ $3$ xuất hiện mặt $6$:
          $ P_2 = frac(1, 6) $
        - Vì các lần gieo độc lập, xác suất cần tìm là:
          $ P = P_1 dot P_2 = frac(5, 18) dot frac(1, 6) = frac(5, 108) approx 0","0463 $
    ]
)

// TN 11
#tn([Cho biến ngẫu nhiên nhị thức $X ~ B(10; 0","3)$. Giá trị tin chắc nhất của biến ngẫu nhiên là $k_0 = 3$. So sánh ba xác suất $P(X = 2)$, $P(X = 3)$ và $P(X = 4)$, khẳng định nào sau đây đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị dạng chuông rời rạc với đỉnh tại 3
    line((-0.5, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$k$]))
    line((0, -0.2), (0, 2.4), stroke: 1pt + accent, mark: (end: "stealth"))
    
    // Các cột tại k = 2, 3, 4
    rect((1.0, 0), (1.5, 1.45), fill: accent.lighten(60%), stroke: 0.8pt + accent)
    content((1.25, -0.3), text(size: 7.5pt, [k = 2]))
    
    rect((1.9, 0), (2.4, 2.0), fill: rgb("dc2626"), stroke: 0.8pt + accent)
    content((2.15, -0.3), text(size: 7.5pt, weight: "bold", [k = 3]))
    content((2.15, 2.25), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [Max]))
    
    rect((2.8, 0), (3.3, 1.55), fill: accent.lighten(60%), stroke: 0.8pt + accent)
    content((3.05, -0.3), text(size: 7.5pt, [k = 4]))
  })
]
],
    (
        [$P(X = 2) > P(X = 3) > P(X = 4)$],
        [$P(X = 4) > P(X = 3) > P(X = 2)$],
        [$P(X = 3) > P(X = 2) > P(X = 4)$],
        True([$P(X = 3) > P(X = 4) > P(X = 2)$])
    ),
    loigiai: [
        #step([Phương pháp giải])
        Sử dụng công thức tính tỷ số xác suất liên tiếp:
        $ frac(P(X = k + 1), P(X = k)) = frac(n - k, k + 1) dot frac(p, q) $
        Với $n = 10, p = 0","3, q = 0","7$, ta có $frac(p, q) = frac(3, 7)$.

        #step([Lời giải chi tiết])
        - So sánh $P(X = 3)$ và $P(X = 2)$:
          $ frac(P(X = 3), P(X = 2)) = frac(10 - 2, 2 + 1) dot frac(3, 7) = frac(8, 3) dot frac(3, 7) = frac(8, 7) > 1 ==> P(X = 3) > P(X = 2) $
        - So sánh $P(X = 4)$ và $P(X = 3)$:
          $ frac(P(X = 4), P(X = 3)) = frac(10 - 3, 3 + 1) dot frac(3, 7) = frac(7, 4) dot frac(3, 7) = frac(3, 4) < 1 ==> P(X = 3) > P(X = 4) $
        - Bây giờ so sánh $P(X = 4)$ và $P(X = 2)$:
          Ta có $P(X = 4) = frac(3, 4) P(X = 3)$ và $P(X = 2) = frac(7, 8) P(X = 3) = frac(14, 16) P(X = 3)$.
          Vì $frac(3, 4) = frac(6, 8) < frac(7, 8)$, nên:
          $ P(X = 4) < P(X = 2) $ là sai hay đúng?
          Kiểm tra lại:
          $P(X = 4) = frac(3, 4) P(X = 3) = 0","75 P(X = 3)$.
          $P(X = 2) = frac(7, 8) P(X = 3) = 0","875 P(X = 3)$.
          Do đó $P(X = 3) > P(X = 2) > P(X = 4)$.
    ]
)

// TN 12
#tn([Một biến ngẫu nhiên $X$ tuân theo quy luật phân bố nhị thức $X ~ B(4, p)$ với $0 < p < 1$. Biết rằng xác suất có đúng $2$ lần thành công gấp $1","5$ lần xác suất có đúng $1$ lần thành công, tức là $P(X = 2) = 1","5 dot P(X = 1)$. Xác suất thành công $p$ trong mỗi phép thử bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị hàm f(p) = P(X=2) - 1.5 P(X=1) cắt trục hoành tại p = 0.5
    line((-0.2, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$p$]))
    line((0, -1.2), (0, 1.5), stroke: 1pt + accent, mark: (end: "stealth"))
    
    // Đường cong cắt trục hoành tại x = 2.0 (tương ứng p = 0.5)
    line((0.5, -0.8), (1.2, -0.45), (2.0, 0), (2.8, 0.45), (3.5, 0.8), stroke: 1.5pt + accent)
    circle((2.0, 0), radius: 0.08, fill: rgb("dc2626"))
    content((2.0, -0.35), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"), [$p = 0","5$]))
  })
]
],
    (
        [$p = 0","25$],
        [$p = 0","40$],
        True([$p = 0","50$]),
        [$p = 0","60$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Sử dụng công thức Bernoulli khai triển $P(X = 2)$ và $P(X = 1)$ theo tham số $p$ và $q = 1 - p$.
        Giải phương trình đại số để tìm $p$.

        #step([Lời giải chi tiết])
        Với $n = 4$:
        $ P(X = 2) = C_4^2 p^2 q^2 = 6 p^2 q^2 $
        $ P(X = 1) = C_4^1 p^1 q^3 = 4 p q^3 $
        Theo giả thiết $P(X = 2) = 1","5 dot P(X = 1)$:
        $ 6 p^2 q^2 = 1","5 dot 4 p q^3 <=> 6 p^2 q^2 = 6 p q^3 $
        Vì $0 < p < 1$ nên $p > 0$ và $q > 0$, chia cả hai vế cho $6 p q^2$:
        $ p = q $
        Mà $q = 1 - p$, do đó:
        $ p = 1 - p <=> 2 p = 1 <=> p = 0","5 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Một dây chuyền công nghệ cao sản xuất màn hình điện thoại OLED với tỷ lệ sản phẩm bị lỗi là $p = 0","05$ ($5%$). Mỗi hộp sản phẩm xuất xưởng chứa $n = 10$ màn hình được chọn ngẫu nhiên độc lập từ dây chuyền. Gọi $X$ là số màn hình lỗi trong một hộp ($X ~ B(10; 0","05)$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu đồ cột phân bố X ~ B(10, 0.05) giảm dốc mạnh
    line((0, 0), (5.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((5.7, 0), text(size: 8pt, [$k$]))
    line((0, 0), (0, 2.5), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 2.7), text(size: 8pt, [$P(X=k)$]))
    
    // Cột tại k=0 (~0.6), k=1 (~0.315), k=2 (~0.075)
    rect((0.6, 0), (1.1, 0.6 * 3.5), fill: accent, stroke: none)
    content((0.85, -0.3), text(size: 7.5pt, [k = 0]))
    content((0.85, 0.6 * 3.5 + 0.2), text(size: 7pt, [~0,60]))
    
    rect((1.8, 0), (2.3, 0.315 * 3.5), fill: accent.lighten(40%), stroke: none)
    content((2.05, -0.3), text(size: 7.5pt, [k = 1]))
    content((2.05, 0.315 * 3.5 + 0.2), text(size: 7pt, [~0,32]))
    
    rect((3.0, 0), (3.5, 0.075 * 3.5), fill: accent.lighten(70%), stroke: none)
    content((3.25, -0.3), text(size: 7.5pt, [k = 2]))
    content((3.25, 0.075 * 3.5 + 0.2), text(size: 7pt, [~0,07]))
  })
]
],
  (
    True([Xác suất để một hộp xuất xưởng hoàn hảo không có màn hình lỗi nào là $(0","95)^{10} approx 0","5987$.]),
    True([Xác suất để một hộp xuất xưởng có đúng một màn hình lỗi xấp xỉ bằng $0","3151$.]),
    False([Xác suất để một hộp có nhiều hơn 2 màn hình lỗi lớn hơn $5%$.]),
    True([Số màn hình lỗi có khả năng xuất hiện nhiều nhất trong một hộp (giá trị tin chắc nhất) là $k_0 = 0$.])
  ),
  loigiai: [
    #step([Phương pháp giải])
    Biến ngẫu nhiên $X$ tuân theo phân bố nhị thức $X ~ B(10; 0","05)$ với $p = 0","05, q = 0","95$.
    Áp dụng công thức $P(X = k) = C_{10}^k (0","05)^k (0","95)^{10 - k}$.

    #step([Phân tích ý a])
    Xác suất hộp không có màn hình lỗi ($X = 0$):
    $ P(X = 0) = C_{10}^0 (0","05)^0 (0","95)^{10} = (0","95)^{10} approx 0","5987 $
    Khẳng định ý a là *ĐÚNG*.

    #step([Phân tích ý b])
    Xác suất hộp có đúng 1 màn hình lỗi ($X = 1$):
    $ P(X = 1) = C_{10}^1 (0","05)^1 (0","95)^9 = 10 dot 0","05 dot (0","95)^9 = 0","5 dot 0","63025 = 0","3151 $
    Khẳng định ý b là *ĐÚNG*.

    #step([Phân tích ý c])
    Tính xác suất $X = 2$:
    $ P(X = 2) = C_{10}^2 (0","05)^2 (0","95)^8 = 45 dot 0","0025 dot 0","66342 approx 0","0746 $
    Xác suất có không quá 2 lỗi:
    $ P(X <= 2) = P(X = 0) + P(X = 1) + P(X = 2) approx 0","5987 + 0","3151 + 0","0746 = 0","9884 $
    Do đó xác suất có nhiều hơn 2 lỗi là:
    $ P(X > 2) = 1 - P(X <= 2) approx 1 - 0","9884 = 0","0116 = 1","16% < 5% $
    Khẳng định ý c là *SAI*.

    #step([Phân tích ý d])
    Tính giá trị tin chắc nhất:
    $ (n + 1) p = (10 + 1) dot 0","05 = 11 dot 0","05 = 0","55 $
    Bất đẳng thức: $0","55 - 1 <= k_0 <= 0","55 <=> -0","45 <= k_0 <= 0","55$.
    Vì $k_0$ là số nguyên nên duy nhất $k_0 = 0$.
    Khẳng định ý d là *ĐÚNG*.
  ]
)

// DS 2 (Câu 14)
#ds([Một gói tin truyền thông kỹ thuật số gồm $n = 8$ byte dữ liệu được truyền qua kênh sóng vô tuyến. Mỗi byte được truyền độc lập và xác suất truyền thành công một byte là $p = 0","9$ (tương ứng xác suất bị lỗi là $q = 0","1$). Gói tin bị coi là hỏng và buộc phải truyền lại nếu có từ $2$ byte trở lên bị lỗi. Gọi $Y$ là số byte bị lỗi trong gói tin ($Y ~ B(8; 0","1)$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình khung gói tin 8 byte
    for i in range(8) {
      let is_err = (i == 2)
      let clr = if is_err { rgb("dc2626") } else { accent.lighten(80%) }
      rect((i * 0.7 - 2.8, -0.35), (i * 0.7 - 2.2, 0.35), stroke: 0.8pt + accent, fill: clr)
      content((i * 0.7 - 2.5, 0), text(size: 6pt, "B" + str(i + 1)))
    }
    content((0, 0.7), text(size: 7.5pt, weight: "bold", fill: accent, [Gói tin 8 byte: Cho phép tối đa 1 byte lỗi]))
  })
]
],
  (
    True([Số byte bị lỗi trong gói tin tuân theo quy luật phân bố nhị thức $Y ~ B(8; 0","1)$.]),
    True([Xác suất để gói tin được truyền hoàn hảo không có byte nào lỗi là $(0","9)^8 approx 0","4305$.]),
    True([Xác suất để gói tin có đúng $1$ byte bị lỗi là $8 dot 0","1 dot (0","9)^7 approx 0","3826$.]),
    True([Xác suất gói tin phải truyền lại (có từ 2 byte lỗi trở lên) xấp xỉ bằng $0","1869$.])
  ),
  loigiai: [
    #step([Phương pháp giải])
    1. Xác định phân bố của số byte lỗi: $Y ~ B(8; 0","1)$.
    2. Tính xác suất $P(Y = 0)$ và $P(Y = 1)$.
    3. Xác suất truyền lại gói tin: $P(Y >= 2) = 1 - P(Y = 0) - P(Y = 1)$.

    #step([Phân tích ý a])
    Mỗi byte có 2 kết quả (lỗi hoặc không lỗi), các byte truyền độc lập với xác suất lỗi $0","1$ không đổi. Do đó $Y ~ B(8; 0","1)$.
    Khẳng định ý a là *ĐÚNG*.

    #step([Phân tích ý b])
    Xác suất không có byte nào lỗi:
    $ P(Y = 0) = C_8^0 (0","1)^0 (0","9)^8 = (0","9)^8 approx 0","430467 approx 0","4305 $
    Khẳng định ý b là *ĐÚNG*.

    #step([Phân tích ý c])
    Xác suất đúng 1 byte lỗi:
    $ P(Y = 1) = C_8^1 (0","1)^1 (0","9)^7 = 8 dot 0","1 dot 0","478297 = 0","8 dot 0","478297 approx 0","3826 $
    Khẳng định ý c là *ĐÚNG*.

    #step([Phân tích ý d])
    Xác suất gói tin được chấp nhận (không quá 1 byte lỗi):
    $ P(Y <= 1) = P(Y = 0) + P(Y = 1) approx 0","430467 + 0","382638 = 0","8131 $
    Xác suất gói tin phải truyền lại:
    $ P(Y >= 2) = 1 - P(Y <= 1) approx 1 - 0","8131 = 0","1869 $
    Khẳng định ý d là *ĐÚNG*.
  ]
)

// DS 3 (Câu 15)
#ds([Một vận động viên bắn súng thể thao bắn $n = 15$ phát đạn độc lập vào bia. Xác suất bắn trúng hồng tâm trong mỗi phát bắn là $p = 0","8$. Gọi $X$ là số phát bắn trúng hồng tâm ($X ~ B(15; 0","8)$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu đồ phân bố xác suất X ~ B(15, 0.8) lệch sang phải
    line((0, 0), (5.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((5.7, 0), text(size: 8pt, [$k$]))
    line((0, 0), (0, 2.5), stroke: 1pt + accent, mark: (end: "stealth"))
    
    // Vài cột quanh Mode = 12
    let pts = ((1.5, 0.8, "10"), (2.3, 1.4, "11"), (3.1, 2.0, "12"), (3.9, 1.6, "13"), (4.7, 0.9, "14"))
    for (x, h, lbl) in pts {
      let is_m = (lbl == "12")
      let clr = if is_m { rgb("dc2626") } else { accent.lighten(60%) }
      rect((x - 0.3, 0), (x + 0.3, h), fill: clr, stroke: 0.8pt + accent)
      content((x, -0.3), text(size: 7.5pt, weight: if is_m { "bold" } else { "regular" }, lbl))
    }
    content((3.1, 2.25), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [Mode k_0 = 12]))
  })
]
],
  (
    True([Số phát bắn trúng hồng tâm trung bình kỳ vọng là $E(X) = 12$ phát.]),
    True([Giá trị $(n + 1) p = 16 dot 0","8 = 12","8$.]),
    False([Giá trị tin chắc nhất số phát bắn trúng hồng tâm là $k_0 = 13$.]),
    True([Xác suất để vận động viên đạt được giá trị tin chắc nhất $P(X = 12)$ xấp xỉ bằng $0","2501$.])
  ),
  loigiai: [
    #step([Phương pháp giải])
    1. Kỳ vọng của phân bố nhị thức: $E(X) = n p$.
    2. Giá trị tin chắc nhất: $(n + 1) p - 1 <= k_0 <= (n + 1) p$.
    3. Tính xác suất tại giá trị tin chắc nhất bằng công thức Bernoulli.

    #step([Phân tích ý a])
    $ E(X) = n p = 15 dot 0","8 = 12 $
    Khẳng định ý a là *ĐÚNG*.

    #step([Phân tích ý b])
    $ (n + 1) p = (15 + 1) dot 0","8 = 16 dot 0","8 = 12","8 $
    Khẳng định ý b là *ĐÚNG*.

    #step([Phân tích ý c])
    Từ bất đẳng thức:
    $ 12","8 - 1 <= k_0 <= 12","8 <=> 11","8 <= k_0 <= 12","8 $
    Vì $k_0$ nguyên nên $k_0 = 12$ (không phải $13$).
    Khẳng định ý c là *SAI*.

    #step([Phân tích ý d])
    Tính xác suất tại $k_0 = 12$:
    $ P(X = 12) = C_{15}^{12} (0","8)^{12} (0","2)^3 = C_{15}^3 dot (0","8)^{12} dot (0","2)^3 $
    Ta có $C_{15}^3 = frac(15 dot 14 dot 13, 6) = 455$.
    $ (0","8)^{12} approx 0","068719, quad (0","2)^3 = 0","008 $
    $ P(X = 12) = 455 dot 0","068719 dot 0","008 approx 0","2501 $
    Khẳng định ý d là *ĐÚNG*.
  ]
)

// DS 4 (Câu 16)
#ds([Một loại thuốc kháng sinh mới được thử nghiệm lâm sàng trên $n = 12$ bệnh nhân nhiễm khuẩn nặng độc lập nhau. Xác suất một bệnh nhân được chữa khỏi hoàn toàn khi điều trị bằng loại thuốc này là $p = 0","75$. Gọi $X$ là số bệnh nhân được chữa khỏi ($X ~ B(12; 0","75)$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình 12 bệnh nhân trong thử nghiệm
    rect((-2.5, -1), (2.5, 1), stroke: 1.2pt + accent, fill: accent.lighten(92%))
    content((0, 0.65), text(size: 8pt, weight: "bold", fill: accent, [Thử nghiệm lâm sàng: n = 12 bệnh nhân]))
    content((0, 0.15), text(size: 7.5pt, [Tỷ lệ khỏi bệnh: p = 0,75 (q = 0,25)]))
    content((0, -0.4), text(size: 7.5pt, fill: rgb("16a34a"), weight: "bold", [Kỳ vọng khỏi bệnh: E(X) = 9 bệnh nhân]))
  })
]
],
  (
    True([Xác suất để cả 12 bệnh nhân đều được chữa khỏi là $(0","75)^{12} approx 0","0317$.]),
    True([Giá trị tin chắc nhất của số bệnh nhân khỏi bệnh là $k_0 = 9$.]),
    True([Xác suất có ít nhất $10$ bệnh nhân được chữa khỏi xấp xỉ bằng $0","3907$.]),
    True([Biến cố "Có không quá 2 bệnh nhân không khỏi bệnh" tương đương với biến cố "Có ít nhất 10 bệnh nhân khỏi bệnh".])
  ),
  loigiai: [
    #step([Phương pháp giải])
    Biến ngẫu nhiên $X ~ B(12; 0","75)$ với $n = 12, p = 0","75, q = 0","25$.
    Áp dụng công thức tính xác suất nhị thức và Mode.

    #step([Phân tích ý a])
    $ P(X = 12) = C_{12}^{12} (0","75)^{12} (0","25)^0 = (0","75)^{12} approx 0","031676 approx 0","0317 $
    Khẳng định ý a là *ĐÚNG*.

    #step([Phân tích ý b])
    Ta có $(n + 1) p = (12 + 1) dot 0","75 = 13 dot 0","75 = 9","75$.
    Bất đẳng thức Mode: $8","75 <= k_0 <= 9","75 ==> k_0 = 9$.
    Khẳng định ý b là *ĐÚNG*.

    #step([Phân tích ý c])
    Tính xác suất có ít nhất 10 người khỏi:
    $ P(X >= 10) = P(X = 10) + P(X = 11) + P(X = 12) $
    - $P(X = 12) approx 0","03168$.
    - $P(X = 11) = C_{12}^{11} (0","75)^{11} (0","25)^1 = 12 dot 0","042235 dot 0","25 approx 0","12670$.
    - $P(X = 10) = C_{12}^{10} (0","75)^{10} (0","25)^2 = 66 dot 0","056313 dot 0","0625 approx 0","23229$.
    Tổng: $P(X >= 10) approx 0","03168 + 0","12670 + 0","23229 = 0","39067 approx 0","3907$.
    Khẳng định ý c là *ĐÚNG*.

    #step([Phân tích ý d])
    Gọi $Y$ là số bệnh nhân không khỏi bệnh, ta có $Y = 12 - X$.
    Biến cố "Không quá 2 bệnh nhân không khỏi bệnh" là $Y <= 2 <=> 12 - X <= 2 <=> X >= 10$.
    Hai biến cố này hoàn toàn đồng nhất.
    Khẳng định ý d là *ĐÚNG*.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Một dây chuyền kiểm định chất lượng sản phẩm thực hiện kiểm tra ngẫu nhiên $n = 45$ linh kiện độc lập. Xác suất để mỗi linh kiện đạt tiêu chuẩn chất lượng là $p = 0","6$. Tìm số linh kiện đạt chuẩn có khả năng xuất hiện cao nhất (giá trị tin chắc nhất $k_0$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị xác định Mode k0 = 27
    line((-0.5, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$k$]))
    line((0, -0.2), (0, 2.2), stroke: 1pt + accent, mark: (end: "stealth"))
    
    rect((1.8, 0), (2.4, 1.8), fill: rgb("dc2626"), stroke: 0.8pt + accent)
    content((2.1, -0.3), text(size: 7.5pt, weight: "bold", [k_0 = 27]))
    content((2.1, 2.05), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [Đỉnh Mode]))
  })
]
],
    [27],
    loigiai: [
        #step([Phương pháp giải])
        Giá trị tin chắc nhất $k_0$ của biến ngẫu nhiên nhị thức $X ~ B(n, p)$ thỏa mãn:
        $ (n + 1) p - 1 <= k_0 <= (n + 1) p $

        #step([Lời giải chi tiết])
        Với $n = 45$ và $p = 0","6$:
        $ (n + 1) p = (45 + 1) dot 0","6 = 46 dot 0","6 = 27","6 $
        Thay vào bất đẳng thức:
        $ 27","6 - 1 <= k_0 <= 27","6 <=> 26","6 <= k_0 <= 27","6 $
        Vì $k_0$ là số nguyên nên $k_0 = 27$.
    ]
)

// TLN 2 (Câu 18)
#tln([Xác suất để một phần mềm an ninh phát hiện một lỗ hổng bảo mật trong một lượt quét tự động là $p = 0","2$. Cần thực hiện tối thiểu bao nhiêu lượt quét độc lập để xác suất phát hiện được lỗ hổng ít nhất một lần không nhỏ hơn $90%$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị hàm mũ (0.8)^n <= 0.1
    line((-0.2, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$n$]))
    line((0, -0.2), (0, 2.2), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 2.4), text(size: 8pt, [$P(X >= 1)$]))
    
    line((0, 1.8), (4.2, 1.8), stroke: (dash: "dashed", paint: rgb("dc2626"), thickness: 0.8pt))
    content((-0.4, 1.8), text(size: 7pt, fill: rgb("dc2626"), [0,90]))
    
    line((0, 0), (1.0, 0.8), (2.0, 1.4), (2.8, 1.8), (3.6, 1.95), stroke: 1.5pt + accent)
    circle((2.8, 1.8), radius: 0.08, fill: rgb("dc2626"))
    content((2.8, -0.3), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"), [n = 11]))
  })
]
],
    [11],
    loigiai: [
        #step([Phương pháp giải])
        Gọi $n$ là số lượt quét độc lập.
        Xác suất không phát hiện được lỗ hổng trong cả $n$ lượt quét là $(1 - 0","2)^n = (0","8)^n$.
        Yêu cầu bài toán:
        $ P(X >= 1) = 1 - (0","8)^n >= 0","90 <=> (0","8)^n <= 0","10 $

        #step([Lời giải chi tiết])
        Lấy logarit tự nhiên hai vế:
        $ n dot ln(0","8) <= ln(0","10) <=> n >= frac(ln(0","10), ln(0","8)) $
        Ta có $ln(0","10) approx -2","30259$ và $ln(0","8) approx -0","22314$.
        $ n >= frac(-2","30259, -0","22314) approx 10","32 $
        Vì $n$ là số nguyên dương nên số lượt quét tối thiểu là $n = 11$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho biến ngẫu nhiên $X ~ B(4, p)$ với $0 < p < 1$. Biết rằng xác suất có đúng $2$ lần thành công gấp $1","5$ lần xác suất có đúng $1$ lần thành công, tức $P(X = 2) = 1","5 dot P(X = 1)$. Giá trị của tham số $p$ bằng bao nhiêu? (Nhập kết quả dưới dạng số thập phân, ví dụ 0.5).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô tả tương quan P(X=2) = 1.5 P(X=1)
    rect((-1.8, -0.4), (1.8, 0.4), stroke: 1pt + accent, fill: accent.lighten(85%))
    content((0, 0), text(size: 8pt, weight: "bold", fill: accent, [6 p^2 (1-p)^2 = 6 p (1-p)^3]))
    content((0, -0.7), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [==> p = 1 - p ==> p = 0,5]))
  })
]
],
    [0.5],
    loigiai: [
        #step([Phương pháp giải])
        Khai triển $P(X = 2)$ và $P(X = 1)$ theo công thức Bernoulli của $B(4, p)$:
        $ P(X = 2) = C_4^2 p^2 (1 - p)^2 = 6 p^2 (1 - p)^2 $
        $ P(X = 1) = C_4^1 p^1 (1 - p)^3 = 4 p (1 - p)^3 $

        #step([Lời giải chi tiết])
        Thiết lập phương trình:
        $ 6 p^2 (1 - p)^2 = 1","5 dot 4 p (1 - p)^3 $
        $ 6 p^2 (1 - p)^2 = 6 p (1 - p)^3 $
        Do $0 < p < 1$ nên chia hai vế cho $6 p (1 - p)^2 > 0$:
        $ p = 1 - p <=> 2 p = 1 <=> p = 0","5 $
    ]
)

// TLN 4 (Câu 20)
#tln([Một hệ thống truyền dẫn gửi đi $n = 5$ gói tin độc lập qua mạng. Xác suất để mỗi gói tin bị thất lạc trong quá trình truyền là $p = 0","1$. Xác suất để hệ thống bị thất lạc đúng $1$ gói tin bằng bao nhiêu? (Làm tròn kết quả đến hàng phần nghìn, ví dụ 0.328).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // 5 gói tin với 1 gói bị mất (đỏ)
    for i in range(5) {
      let is_lost = (i == 1)
      let clr = if is_lost { rgb("dc2626") } else { accent.lighten(80%) }
      rect((i * 0.9 - 2.0, -0.3), (i * 0.9 - 1.3, 0.3), stroke: 0.8pt + accent, fill: clr)
      content((i * 0.9 - 1.65, 0), text(size: 6.5pt, "Pkt " + str(i + 1)))
    }
  })
]
],
    [0.328],
    loigiai: [
        #step([Phương pháp giải])
        Số gói tin bị thất lạc $X$ tuân theo phân bố nhị thức $X ~ B(5; 0","1)$.
        Áp dụng công thức Bernoulli với $k = 1$:
        $ P(X = 1) = C_5^1 (0","1)^1 (0","9)^4 $

        #step([Lời giải chi tiết])
        $ P(X = 1) = 5 dot 0","1 dot (0","9)^4 = 0","5 dot 0","6561 = 0","32805 $
        Làm tròn đến hàng phần nghìn: $0","328$.
    ]
)

// TLN 5 (Câu 21)
#tln([Một bài thi trắc nghiệm khách quan gồm $n = 23$ câu hỏi, mỗi câu hỏi có 4 phương án lựa chọn và chỉ có 1 phương án đúng. Một thí sinh không học bài nên chọn ngẫu nhiên độc lập đáp án cho toàn bộ 23 câu hỏi ($p = 0","25$). Khi đó, số câu trả lời đúng có hai giá trị tin chắc nhất đồng thời là $k_0$ và $k_0'$. Tính tổng $k_0 + k_0'$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai đỉnh bằng nhau tại k = 5 và k = 6
    line((-0.5, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$k$]))
    line((0, 0), (0, 2.0), stroke: 1pt + accent, mark: (end: "stealth"))
    
    rect((1.5, 0), (2.0, 1.5), fill: rgb("dc2626"), stroke: 0.8pt + accent)
    rect((2.3, 0), (2.8, 1.5), fill: rgb("dc2626"), stroke: 0.8pt + accent)
    content((1.75, -0.3), text(size: 7.5pt, weight: "bold", [5]))
    content((2.55, -0.3), text(size: 7.5pt, weight: "bold", [6]))
    content((2.15, 1.8), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [P(X=5) = P(X=6)]))
  })
]
],
    [11],
    loigiai: [
        #step([Phương pháp giải])
        Khi $(n + 1) p$ là số nguyên, biến ngẫu nhiên nhị thức có hai giá trị tin chắc nhất:
        $ k_0 = (n + 1) p - 1 quad "và" quad k_0' = (n + 1) p $

        #step([Lời giải chi tiết])
        Với $n = 23$ và $p = 0","25 = frac(1, 4)$:
        $ (n + 1) p = (23 + 1) dot 0","25 = 24 dot 0","25 = 6 " (là số nguyên)" $
        Hai giá trị tin chắc nhất là:
        $ k_0 = 6 - 1 = 5 quad "và" quad k_0' = 6 $
        Tổng của hai giá trị này là:
        $ k_0 + k_0' = 5 + 6 = 11 $
    ]
)

// TLN 6 (Câu 22)
#tln([Một tàu vũ trụ đổ bộ lên Mặt Trăng được trang bị cụm $4$ động cơ đẩy phản lực hoạt động hoàn toàn độc lập. Xác suất để mỗi động cơ khởi động và vận hành thành công là $p = 0","9$. Tàu đổ bộ hạ cánh an toàn nếu có ít nhất $3$ động cơ hoạt động thành công. Xác suất để tàu vũ trụ hạ cánh an toàn bằng bao nhiêu? (Nhập kết quả dưới dạng số thập phân, ví dụ 0.9477).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình tàu vũ trụ với 4 động cơ
    rect((-1.5, -0.6), (1.5, 0.6), stroke: 1.2pt + accent, fill: accent.lighten(90%))
    content((0, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Tàu vũ trụ đổ bộ]))
    content((0, -0.25), text(size: 7pt, [Cần >= 3 trong 4 động cơ]))
    // 4 động cơ phía dưới
    for i in range(4) {
      rect((i * 0.7 - 1.25, -1.0), (i * 0.7 - 0.85, -0.6), fill: rgb("ea580c"), stroke: 0.5pt)
    }
  })
]
],
    [0.9477],
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X$ là số động cơ hoạt động thành công: $X ~ B(4; 0","9)$.
        Điều kiện hạ cánh an toàn là $X >= 3$, tức là $X = 3$ hoặc $X = 4$:
        $ P(X >= 3) = P(X = 3) + P(X = 4) $

        #step([Lời giải chi tiết])
        Tính từng xác suất:
        $ P(X = 4) = C_4^4 (0","9)^4 (0","1)^0 = (0","9)^4 = 0","6561 $
        $ P(X = 3) = C_4^3 (0","9)^3 (0","1)^1 = 4 dot 0","729 dot 0","1 = 0","2916 $
        Xác suất hạ cánh an toàn:
        $ P(X >= 3) = 0","6561 + 0","2916 = 0","9477 $
    ]
)

] // end make-questions

#make-questions()
