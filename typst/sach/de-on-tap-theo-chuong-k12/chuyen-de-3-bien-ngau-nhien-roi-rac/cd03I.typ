#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai"
#let accent = rgb("3730a3") // Royal Indigo

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG",
  exam-title: "ĐỀ ÔN TẬP CHUYÊN ĐỀ 3I: TỔNG HỢP VD - VDC: MÔ HÌNH NGẪU NHIÊN TRONG Y HỌC, KỸ THUẬT & KHOA HỌC DỮ LIỆU",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "529",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một hệ thống điều khiển tự động trên tàu ngầm nghiên cứu gồm $3$ khối linh kiện điện tử $L_1, L_2, L_3$ mắc nối tiếp nhau. Hệ thống chỉ hoạt động bình thường khi cả $3$ khối linh kiện đều hoạt động tốt. Cho biết xác suất hoạt động tốt độc lập của các khối lần lượt là $P(L_1) = 0","90; P(L_2) = 0","95; P(L_3) = 0","90$. Xác suất để toàn bộ hệ thống điều khiển hoạt động bình thường bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // 3 khối linh kiện mắc nối tiếp
    for i in range(3) {
      let x = -2.0 + i * 2.0
      rect((x - 0.7, -0.4), (x + 0.7, 0.4), stroke: 1pt + accent, fill: accent.lighten(90%), radius: 0.08)
      content((x, 0), text(size: 8pt, weight: "bold", fill: accent, [$L_#(i+1)$]))
      if i < 2 {
        line((x + 0.7, 0), (x + 1.3, 0), stroke: 1.2pt + accent)
      }
    }
    content((0, -0.8), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [P = 0,90 . 0,95 . 0,90 = 0,7695]))
  })
]
],
    (
        [$0","9000$],
        [$0","8100$],
        True([$0","7695$]),
        [$0","7250$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hệ thống mắc nối tiếp hoạt động khi và chỉ khi tất cả các khối thành phần đều hoạt động tốt.
        Vì các khối hoạt động độc lập:
        $ P("Hệ thống") = P(L_1) dot P(L_2) dot P(L_3) $

        #step([Lời giải chi tiết])
        Thay số:
        $ P("Hệ thống") = 0","90 dot 0","95 dot 0","90 = 0","7695 $
    ]
)

// TN 2
#tn([Để cấp điện liên tục cho một trạm viễn thông trên hải đảo, người ta lắp đặt $3$ tổ máy phát điện độc lập mắc song song. Trạm duy trì hoạt động nếu có ít nhất $1$ trong $3$ máy phát điện hoạt động tốt. Xác suất để mỗi máy phát điện hoạt động ổn định đều bằng $p = 0","85$. Xác suất để trạm viễn thông duy trì hoạt động cấp điện bằng (làm tròn đến hàng phần nghìn):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // 3 máy phát điện mắc song song
    for i in range(3) {
      let y = 0.6 - i * 0.6
      rect((-1.2, y - 0.2), (1.2, y + 0.2), stroke: 1pt + accent, fill: accent.lighten(92%), radius: 0.06)
      content((0, y), text(size: 7.5pt, weight: "bold", [Máy phát #(i+1): p = 0,85]))
    }
    content((0, -1.0), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Song song: P = 1 - (0,15)^3 ≈ 0,997]))
  })
]
],
    (
        [$0","614$],
        [$0","850$],
        [$0","955$],
        True([$0","997$])
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hệ thống mắc song song ngừng hoạt động khi và chỉ khi cả 3 máy phát điện đều hỏng.
        Xác suất một máy hỏng: $q = 1 - p = 1 - 0","85 = 0","15$.
        Xác suất cả 3 máy cùng hỏng: $q^3 = (0","15)^3$.
        Xác suất hệ thống duy trì hoạt động:
        $ P = 1 - (0","15)^3 $

        #step([Lời giải chi tiết])
        Tính toán:
        $ (0","15)^3 = 0","003375 $
        $ P = 1 - 0","003375 = 0","996625 approx 0","997 $
    ]
)

// TN 3
#tn([Một máy bay vận tải cỡ lớn có $4$ động cơ phản lực hoạt động độc lập nhau. Chuyến bay được đảm bảo an toàn nếu có ít nhất $2$ trong số $4$ động cơ hoạt động bình thường. Biết rằng xác suất xảy ra sự cố hỏng hóc trong một chuyến bay của mỗi động cơ là $q = 0","01$ (xác suất hoạt động tốt là $p = 0","99$). Xác suất để chuyến bay an toàn bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Máy bay 4 động cơ
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Hệ thống 2-out-of-4: An toàn khi k >= 2 động cơ tốt]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [P(An toàn) = 1 - P(0 tốt) - P(1 tốt) = 1 - q^4 - 4 p q^3 ≈ 0,999996]))
  })
]
],
    (
        [$0","9606$],
        [$0","9899$],
        [$0","9996$],
        True([$0","999996$])
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X$ là số động cơ hoạt động tốt: $X ~ B(4; 0","99)$.
        Chuyến bay an toàn khi $X >= 2$.
        Sử dụng biến cố đối: Chuyến bay mất an toàn khi $X = 0$ hoặc $X = 1$:
        $ P(X < 2) = P(X = 0) + P(X = 1) $
        - $P(X = 0) = q^4 = (0","01)^4 = 10^(-8)$
        - $P(X = 1) = C_4^1 p^1 q^3 = 4 dot 0","99 dot (0","01)^3 = 3","96 dot 10^(-6) = 0","00000396$

        #step([Lời giải chi tiết])
        Tổng xác suất mất an toàn:
        $ P(X < 2) = 0","00000396 + 0","00000001 = 0","00000397 $
        Xác suất chuyến bay an toàn:
        $ P(X >= 2) = 1 - 0","00000397 = 0","99999603 approx 0","999996 $
    ]
)

// TN 4
#tn([Trong dịch tễ học, phương pháp xét nghiệm gộp mẫu (Pooled Testing) được sử dụng để tiết kiệm sinh phẩm. Người ta gộp mẫu dịch mũi họng của $k = 5$ cá nhân vào một ống nghiệm duy nhất. Biết rằng xác suất mỗi cá nhân nhiễm virus là $p = 0","02$ và tình trạng nhiễm của các cá nhân là độc lập nhau. Ống mẫu gộp có kết quả dương tính nếu có ít nhất một cá nhân nhiễm virus. Xác suất để ống mẫu gộp có kết quả dương tính bằng (làm tròn đến hàng phần nghìn):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình xét nghiệm mẫu gộp 5 người
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [5 cá nhân: p = 0,02]))
    content((-1.5, -0.25), text(size: 7.5pt, [Âm tính khi cả 5 âm]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [P(Âm) = (0,98)^5 ≈ 0,9039]))
    content((1.6, -0.25), text(size: 8pt, weight: "bold", fill: rgb("b91c1c"), [P(Dương) = 1 - P(Âm) ≈ 0,096]))
  })
]
],
    (
        [$0","100$],
        True([$0","096$]),
        [$0","020$],
        [$0","082$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Mẫu gộp âm tính khi và chỉ khi cả 5 cá nhân đều không nhiễm virus:
        $ P("Âm tính") = (1 - p)^5 = (0","98)^5 $
        Xác suất mẫu gộp dương tính:
        $ P("Dương tính") = 1 - (0","98)^5 $

        #step([Lời giải chi tiết])
        Tính toán:
        $ (0","98)^5 approx 0","90392 $
        $ P("Dương tính") = 1 - 0","90392 = 0","09608 approx 0","096 $
    ]
)

// TN 5
#tn([Trong phương pháp xét nghiệm gộp của Dorfman: Nếu mẫu gộp $k = 5$ người có kết quả âm tính, chỉ cần $1$ xét nghiệm cho cả nhóm. Nếu mẫu gộp dương tính, người ta phải xét nghiệm đơn lẻ lại cho từng người trong nhóm (tổng cộng tốn $1 + 5 = 6$ xét nghiệm cho nhóm đó). Với tỷ lệ nhiễm $p = 0","02$, kỳ vọng số lượt xét nghiệm cần thực hiện cho một nhóm $5$ người bằng (làm tròn đến hàng phần trăm):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình kỳ vọng số xét nghiệm Dorfman
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [E(T) = 1 . P(Âm) + 6 . P(Dương) = 1 + 5 P(Dương)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [E(T) = 1 + 5(0,09608) ≈ 1,48 xét nghiệm (tiết kiệm 70%)]))
  })
]
],
    (
        [$5","00$],
        [$2","50$],
        True([$1","48$]),
        [$1","10$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $T$ là số xét nghiệm cần dùng cho một nhóm:
        - $T = 1$ nếu mẫu gộp âm tính (xác suất $P_0 = (0","98)^5 approx 0","90392$).
        - $T = 6$ nếu mẫu gộp dương tính (xác suất $P_1 = 1 - P_0 approx 0","09608$).
        Kỳ vọng:
        $ E(T) = 1 dot P_0 + 6 dot P_1 = 1 dot (1 - P_1) + 6 P_1 = 1 + 5 P_1 $

        #step([Lời giải chi tiết])
        Thay số:
        $ E(T) = 1 + 5 dot 0","09608 = 1 + 0","4804 = 1","4804 approx 1","48 " (xét nghiệm)" $
        (Xét nghiệm gộp 5 người chỉ tốn trung bình $1","48$ xét nghiệm thay vì $5$ xét nghiệm, giúp tiết kiệm hơn $70%$ chi phí).
    ]
)

// TN 6
#tn([Một thuật toán ngẫu nhiên kiểm tra tính nguyên tố (như thuật toán Miller-Rabin) có xác suất kết luận nhầm một hợp số là số nguyên tố trong một lượt kiểm tra tối đa là $p = frac(1, 4) = 0","25$. Các lượt kiểm tra là độc lập nhau. Cần thực hiện tối thiểu bao nhiêu lượt kiểm tra độc lập để xác suất thuật toán kết luận nhầm liên tiếp trong tất cả các lượt không vượt quá $10^(-6)$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị hàm mũ xác suất sai số Monte Carlo
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [(1/4)^k <= 10^(-6) <=> 4^k >= 10^6]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [k >= 6 / log10(4) ≈ 6 / 0,60206 ≈ 9,96 ==> k = 10]))
  })
]
],
    (
        [$8$ lượt],
        [$9$ lượt],
        True([$10$ lượt]),
        [$12$ lượt]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Xác suất kết luận nhầm trong cả $k$ lượt độc lập là:
        $ P("Sai") <= (frac(1, 4))^k $
        Yêu cầu bài toán:
        $ (frac(1, 4))^k <= 10^(-6) <=> 4^k >= 10^6 $

        #step([Lời giải chi tiết])
        Lấy logarit cơ số 10 hai vế:
        $ k dot log_10(4) >= 6 <=> k >= frac(6, log_10(4)) $
        Ta có $log_10(4) = 2 log_10(2) approx 2 dot 0","30103 = 0","60206$.
        $ k >= frac(6, 0","60206) approx 9","9658 $
        Vì $k$ là số nguyên dương nên số lượt kiểm tra tối thiểu là $k = 10$.
    ]
)

// TN 7
#tn([Theo Luật số lớn (Luật yếu), xét dãy biến ngẫu nhiên độc lập cùng phân bố có phương sai $sigma^2 = 36$. Biến ngẫu nhiên trung bình mẫu là $bar(X)_n = frac(1, n) sum_(i=1)^n X_i$. Cỡ mẫu $n$ tối thiểu bằng bao nhiêu để độ lệch chuẩn của trung bình mẫu $sigma(bar(X)_n)$ không vượt quá $0","3$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình độ lệch chuẩn trung bình mẫu
    rect((-2.8, -0.5), (2.8, 0.5), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [σ(X_tb) = σ / sqrt(n) <= 0,3 <=> sqrt(n) >= 6 / 0,3 = 20 <=> n >= 400]))
  })
]
],
    (
        [$120$],
        [$200$],
        True([$400$]),
        [$600$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Phương sai của trung bình mẫu gồm $n$ biến ngẫu nhiên độc lập:
        $ V(bar(X)_n) = frac(sigma^2, n) ==> sigma(bar(X)_n) = frac(sigma, sqrt(n)) $
        Yêu cầu bài toán:
        $ frac(sigma, sqrt(n)) <= 0","3 $

        #step([Lời giải chi tiết])
        Với $sigma = sqrt(36) = 6$:
        $ frac(6, sqrt(n)) <= 0","3 <=> sqrt(n) >= frac(6, 0","3) = 20 <=> n >= 20^2 = 400 $
        Vậy cỡ mẫu tối thiểu là $n = 400$.
    ]
)

// TN 8
#tn([Trong khoa học dữ liệu, một bộ phân loại tự động (Classifier) kiểm tra $n = 600$ giao dịch tài chính hợp lệ. Xác suất để bộ phân loại bị cảnh báo nhầm là giao dịch gian lận (báo động giả - False Positive) là $p = 0","015$. Số lượng cảnh báo nhầm $X$ tuân theo phân bố nhị thức $X ~ B(600; 0","015)$. Kỳ vọng $E(X)$ và phương sai $V(X)$ của số cảnh báo nhầm lần lượt là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Phân bố cảnh báo nhầm
    rect((-2.8, -0.5), (2.8, 0.5), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [E(X) = 600 . 0,015 = 9; V(X) = 9 . 0,985 = 8,865]))
  })
]
],
    (
        [$E(X) = 6$ và $V(X) = 5","91$],
        True([$E(X) = 9$ và $V(X) = 8","865$]),
        [$E(X) = 9$ và $V(X) = 9$],
        [$E(X) = 15$ và $V(X) = 14","775$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Với $X ~ B(n, p)$:
        - $E(X) = n p$
        - $V(X) = n p (1 - p)$

        #step([Lời giải chi tiết])
        $ E(X) = 600 dot 0","015 = 9 $
        $ V(X) = 9 dot (1 - 0","015) = 9 dot 0","985 = 8","865 $
    ]
)

// TN 9
#tn([Để tiêu diệt một mục tiêu bay của đối phương, một tổ hợp tên lửa phòng không phóng độc lập các quả tên lửa. Xác suất tiêu diệt mục tiêu của mỗi quả tên lửa là $p = 0","75$. Cần phóng tối thiểu bao nhiêu quả tên lửa để xác suất tiêu diệt được mục tiêu đạt từ $99%$ trở lên?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình bắn chặn tên lửa
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [1 - (0,25)^n >= 0,99 <=> (0,25)^n <= 0,01]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [4^n >= 100 ==> n >= 4 (vì 4^3 = 64, 4^4 = 256)]))
  })
]
],
    (
        [$2$ quả],
        [$3$ quả],
        True([$4$ quả]),
        [$5$ quả]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $n$ là số quả tên lửa được phóng.
        Xác suất cả $n$ quả đều bắn trượt là $(1 - 0","75)^n = (0","25)^n = (frac(1, 4))^n$.
        Xác suất tiêu diệt được mục tiêu:
        $ P = 1 - (frac(1, 4))^n >= 0","99 <=> (frac(1, 4))^n <= 0","01 <=> 4^n >= 100 $

        #step([Lời giải chi tiết])
        Ta kiểm tra các lũy thừa của 4:
        - $4^1 = 4 < 100$
        - $4^2 = 16 < 100$
        - $4^3 = 64 < 100$
        - $4^4 = 256 >= 100$
        Vậy cần phóng tối thiểu $n = 4$ quả tên lửa.
    ]
)

// TN 10
#tn([Một kho dữ liệu đám mây lưu trữ dữ liệu trên hai cụm máy chủ độc lập $C_1$ và $C_2$. Số lượng truy vấn đọc dữ liệu xử lý trong một giây của cụm $C_1$ là $X$ có $E(X) = 1200, sigma(X) = 30$. Số lượng truy vấn của cụm $C_2$ là $Y$ có $E(Y) = 1600, sigma(Y) = 40$. Độ lệch chuẩn của tổng số truy vấn mà hệ thống đám mây xử lý trong một giây $sigma(X + Y)$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai cụm máy chủ đám mây
    rect((-2.8, -0.5), (2.8, 0.5), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [V(X + Y) = 30^2 + 40^2 = 2500 ==> σ(X + Y) = 50]))
  })
]
],
    (
        [$70$ truy vấn],
        True([$50$ truy vấn]),
        [$2500$ truy vấn],
        [$35$ truy vấn]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Vì hai cụm máy chủ hoạt động độc lập:
        $ V(X + Y) = V(X) + V(Y) = sigma(X)^2 + sigma(Y)^2 $
        Độ lệch chuẩn:
        $ sigma(X + Y) = sqrt(sigma(X)^2 + sigma(Y)^2) $

        #step([Lời giải chi tiết])
        Thay số:
        $ sigma(X + Y) = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50 " (truy vấn)" $
    ]
)

// TN 11
#tn([Trong kỹ thuật truyền tin số, để giảm thiểu lỗi do nhiễu kênh truyền nhị phối đối xứng có xác suất lỗi bit $p = 0","05$, người ta sử dụng mã lặp $3$ lần (mỗi bit $0$ gửi thành $000$, bit $1$ gửi thành $111$) và giải mã theo nguyên tắc đa số (ít nhất 2 trong 3 bit đúng). Xác suất để bit nhận được sau giải mã bị sai bằng (làm tròn đến hàng phần nghìn):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình mã lặp 3 bit
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Mã lặp 3 bit (TMR): Lỗi khi có 2 hoặc 3 bit sai]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [P(Lỗi) = C(3, 2) p^2 (1 - p) + p^3 = 3(0,05)^2(0,95) + (0,05)^3 ≈ 0,007]))
  })
]
],
    (
        [$0","050$],
        [$0","015$],
        True([$0","007$]),
        [$0","001$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X$ là số bit bị đảo (bị lỗi) trong $3$ bit truyền đi: $X ~ B(3; 0","05)$.
        Giải mã theo nguyên tắc đa số sẽ bị sai khi có ít nhất $2$ bit bị lỗi ($X >= 2$):
        $ P("Sai") = P(X = 2) + P(X = 3) = C_3^2 p^2 (1 - p) + C_3^3 p^3 $

        #step([Lời giải chi tiết])
        Thay $p = 0","05$:
        $ P(X = 2) = 3 dot (0","05)^2 dot 0","95 = 3 dot 0","0025 dot 0","95 = 0","007125 $
        $ P(X = 3) = (0","05)^3 = 0","000125 $
        Tổng xác suất sai:
        $ P("Sai") = 0","007125 + 0","000125 = 0","00725 approx 0","007 $
        (Xác suất lỗi bit giảm từ $5%$ xuống còn $0","7%$).
    ]
)

// TN 12
#tn([Theo Bất đẳng thức Chebyshev, với một biến ngẫu nhiên $X$ bất kỳ có kỳ vọng $mu$ và độ lệch chuẩn $sigma$, xác suất để giá trị của $X$ lệch khỏi kỳ vọng từ $2","5 sigma$ trở lên thỏa mãn bất đẳng thức:
$ P(|X - mu| >= 2","5 sigma) <= frac(1, (2","5)^2) = frac(1, 6","25) = 0","16 $
Xác suất để giá trị của $X$ nằm trong khoảng an toàn $[mu - 2","5 sigma; mu + 2","5 sigma]$ được đảm bảo đạt ít nhất bằng bao nhiêu phần trăm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu diễn bất đẳng thức Chebyshev
    line((-3.0, 0), (3.0, 0), stroke: 1pt + gray)
    rect((-1.8, -0.2), (1.8, 0.2), fill: accent.lighten(85%), stroke: 1pt + accent, radius: 0.05)
    line((0, -0.35), (0, 0.35), stroke: 1.2pt + rgb("15803d"))
    content((0, 0.5), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [μ]))
    content((-1.8, -0.45), text(size: 7.5pt, [μ - 2,5σ]))
    content((1.8, -0.45), text(size: 7.5pt, [μ + 2,5σ]))
    content((0, -0.85), text(size: 8pt, weight: "bold", fill: accent, [P(|X - μ| < 2,5σ) >= 1 - 0,16 = 84%]))
  })
]
],
    (
        [$68%$],
        [$75%$],
        True([$84%$]),
        [$95%$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng bất đẳng thức Chebyshev đối với biến cố đối:
        $ P(|X - mu| < k sigma) >= 1 - frac(1, k^2) $

        #step([Lời giải chi tiết])
        Với $k = 2","5$:
        $ P(|X - mu| < 2","5 sigma) >= 1 - frac(1, (2","5)^2) = 1 - frac(1, 6","25) = 1 - 0","16 = 0","84 " (tức " 84% ")" $
        Vậy xác suất đạt ít nhất là $84%$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Trong một chiến dịch tầm soát một biến thể cúm mùa trong cộng đồng dân cư gồm $N = 1000$ người, người ta áp dụng kỹ thuật xét nghiệm mẫu gộp của Dorfman. Tỷ lệ người nhiễm biến thể cúm trong cộng đồng này là $p = 0","01$ (các cá nhân nhiễm bệnh độc lập nhau). Toàn bộ $1000$ người được chia thành $100$ nhóm, mỗi nhóm gồm $k = 10$ người.
- Trong mỗi nhóm, mẫu bệnh phẩm của $10$ người được gộp lại xét nghiệm lần đầu.
- Nếu mẫu gộp âm tính, nhóm đó được kết luận an toàn và không cần xét nghiệm thêm (tốn $1$ xét nghiệm cho nhóm).
- Nếu mẫu gộp dương tính, cả $10$ cá nhân trong nhóm đều được xét nghiệm đơn lẻ lại (tốn $1 + 10 = 11$ xét nghiệm cho nhóm).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ xét nghiệm mẫu gộp Dorfman k = 10
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [100 nhóm, k = 10, p = 0,01]))
    content((-1.5, -0.25), text(size: 7.5pt, [P(Âm) = (0,99)^10 ≈ 0,9044]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [E(T_nhóm) = 1 + 10(0,0956) ≈ 1,96]))
    content((1.6, -0.25), text(size: 8pt, fill: rgb("15803d"), [Tổng E(T) ≈ 196 xét nghiệm]))
  })
]
],
    (
        True([Xác suất để một nhóm có kết quả xét nghiệm mẫu gộp âm tính là $(0","99)^10 approx 0","9044$.]),
        True([Xác suất để một nhóm có kết quả mẫu gộp dương tính và phải xét nghiệm lại từng cá nhân là khoảng $0","0956$.]),
        True([Kỳ vọng số lượt xét nghiệm cho một nhóm $10$ người là $E(T) approx 1","956$ xét nghiệm.]),
        False([Kỳ vọng tổng số lượt xét nghiệm cần thực hiện cho cả $1000$ người là $450$ xét nghiệm.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Một nhóm âm tính khi cả 10 người đều âm tính: $P_0 = (1 - p)^10$.
        2. Nhóm dương tính khi có ít nhất 1 người dương tính: $P_1 = 1 - P_0$.
        3. Số xét nghiệm của 1 nhóm $T$: nhận giá trị $1$ (xác suất $P_0$) và $11$ (xác suất $P_1$).
           $E(T) = 1 dot P_0 + 11 dot P_1 = 1 + 10 P_1$.
        4. Tổng số xét nghiệm cho $100$ nhóm: $E(S) = 100 dot E(T)$.

        #step([Phân tích ý a])
        $ P_0 = (1 - 0","01)^10 = (0","99)^10 approx 0","90438 approx 0","9044 $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        $ P_1 = 1 - P_0 = 1 - 0","90438 = 0","09562 approx 0","0956 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Kỳ vọng số xét nghiệm cho một nhóm:
        $ E(T) = 1 + 10 dot P_1 = 1 + 10 dot 0","09562 = 1 + 0","9562 = 1","9562 approx 1","956 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Kỳ vọng tổng số xét nghiệm cho 100 nhóm:
        $ E(S) = 100 dot E(T) = 100 dot 1","9562 = 195","62 approx 196 " (xét nghiệm)" $
        Giá trị $450$ xét nghiệm trong đề bài là hoàn toàn sai (tiết kiệm thực tế lên tới hơn $80%$ so với $1000$ xét nghiệm).
        Khẳng định ý d là *SAI*.
    ]
)

// DS 2
#ds([Một hệ thống cụm máy chủ trung tâm dữ liệu được thiết kế gồm hai trung tâm dự phòng độc lập: Trung tâm A và Trung tâm B.
- Trung tâm A gồm $2$ máy chủ $A_1, A_2$ hoạt động song song.
- Trung tâm B gồm $2$ máy chủ $B_1, B_2$ hoạt động song song.
Cả $4$ máy chủ hoạt động độc lập và xác suất gặp sự cố hỏng hóc trong một năm của mỗi máy chủ đều bằng $q = 0","1$ (xác suất hoạt động tốt là $p = 0","9$). Hệ thống trung tâm dữ liệu duy trì hoạt động liên tục nếu có ít nhất một trong hai trung tâm A hoặc B hoạt động. Một trung tâm hoạt động nếu có ít nhất một máy chủ của trung tâm đó hoạt động tốt.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình hệ thống đa tầng
    rect((-2.5, 0.2), (-0.5, 0.9), stroke: 1pt + accent, fill: accent.lighten(90%))
    content((-1.5, 0.55), text(size: 7pt, [Trung tâm A]))
    rect((-2.5, -0.9), (-0.5, -0.2), stroke: 1pt + accent, fill: accent.lighten(90%))
    content((-1.5, -0.55), text(size: 7pt, [Trung tâm B]))
    
    line((-0.5, 0.55), (0.8, 0), stroke: 1pt + rgb("15803d"))
    line((-0.5, -0.55), (0.8, 0), stroke: 1pt + rgb("15803d"))
    
    circle((1.2, 0), radius: 0.4, stroke: 1.2pt + rgb("15803d"), fill: rgb("dcfce7"))
    content((1.2, 0), text(size: 7pt, weight: "bold", [Hệ thống]))
  })
]
],
    (
        True([Xác suất để Trung tâm A hoạt động tốt là $0","99$.]),
        True([Xác suất để Trung tâm B hoạt động tốt là $0","99$.]),
        True([Xác suất để cả hai trung tâm A và B cùng bị sự cố ngừng hoạt động là $0","0001$.]),
        False([Độ tin cậy hoạt động liên tục của toàn bộ hệ thống trung tâm dữ liệu trong năm là $0","9990$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính độ tin cậy của Trung tâm A: Gồm 2 máy chủ song song, ngưng hoạt động khi cả 2 máy hỏng:
           $ P(A "hỏng") = q^2 = (0","1)^2 = 0","01 ==> P(A "tốt") = 1 - 0","01 = 0","99 $
        2. Tương tự cho Trung tâm B: $P(B "tốt") = 0","99$.
        3. Hệ thống bị sập khi cả A và B cùng hỏng: $P("Sập") = P(A "hỏng") dot P(B "hỏng")$.
        4. Độ tin cậy hệ thống: $P("Tốt") = 1 - P("Sập")$.

        #step([Phân tích ý a])
        $ P(A "tốt") = 1 - (0","1)^2 = 1 - 0","01 = 0","99 $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        $ P(B "tốt") = 1 - (0","1)^2 = 1 - 0","01 = 0","99 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Vì A và B độc lập:
        $ P("Cả A và B cùng hỏng") = 0","01 dot 0","01 = 0","0001 " (tức " 10^(-4) ")" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Độ tin cậy của toàn hệ thống là:
        $ P("Hệ thống tốt") = 1 - 0","0001 = 0","9999 " (tức " 99","99% ")" $
        Giá trị $0","9990$ trong đề bài là sai (thiếu một chữ số 9, tương đương cấp độ "bốn số 9" chuẩn Datacenter Tier 3/4).
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#ds([Một hãng hàng không thương mại quản lý đội bay khai thác $n = 1000$ chuyến bay trong một tháng. Thống kê lịch sử cho thấy xác suất một chuyến bay cần thay thế lốp máy bay khẩn cấp sau khi hạ cánh là $p = 0","005$ (các chuyến bay độc lập nhau). Gọi $X$ là số lốp máy bay cần thay thế khẩn cấp trong tháng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình dự phòng lốp máy bay
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [n = 1000 chuyến, p = 0,005]))
    content((-1.5, -0.25), text(size: 7.5pt, [E(X) = 5; V(X) = 4,975]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [σ(X) ≈ 2,23]))
    content((1.6, -0.25), text(size: 7.5pt, fill: rgb("15803d"), [E + 3σ ≈ 11,7 ==> Dự trữ 12 lốp]))
  })
]
],
    (
        True([Biến ngẫu nhiên $X$ tuân theo phân bố nhị thức $B(1000; 0","005)$.]),
        True([Kỳ vọng số lốp máy bay cần thay khẩn cấp trong tháng là $E(X) = 5$ chiếc.]),
        True([Phương sai của $X$ là $V(X) = 4","975$ và độ lệch chuẩn $sigma(X) approx 2","23$ chiếc.]),
        False([Theo quy tắc kinh nghiệm $3 sigma$, hãng chỉ cần dự trữ $8$ chiếc lốp là đủ đảm bảo an toàn không bị thiếu hụt lốp với độ tin cậy trên $99%$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Nhận dạng phân bố nhị thức: $X ~ B(1000; 0","005)$.
        2. Tính $E(X) = n p$, $V(X) = n p (1 - p)$, $sigma(X) = sqrt(V(X))$.
        3. Quy tắc an toàn $3 sigma$: Mức dự trữ an toàn là $E(X) + 3 sigma(X)$.

        #step([Phân tích ý a])
        $X ~ B(1000; 0","005)$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        $ E(X) = 1000 dot 0","005 = 5 " (chiếc)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        $ V(X) = 1000 dot 0","005 dot 0","995 = 5 dot 0","995 = 4","975 $
        $ sigma(X) = sqrt(4","975) approx 2","23047 approx 2","23 " (chiếc)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Theo quy tắc $3 sigma$, mức dự trữ trần an toàn cần đạt:
        $ E(X) + 3 sigma(X) = 5 + 3 dot 2","23 = 5 + 6","69 = 11","69 $
        Vì vậy hãng cần dự trữ tối thiểu $12$ chiếc lốp. Mức $8$ chiếc lốp chỉ mới đạt khoảng $E(X) + 1","35 sigma(X)$, nguy cơ thiếu hụt vẫn còn đáng kể.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#ds([Một thuật toán ngẫu nhiên kiểm tra tính nguyên tố kiểm tra một hợp số lẻ lớn $n$. Trong mỗi lượt kiểm tra độc lập, thuật toán có xác suất kết luận nhầm "$n$ là số nguyên tố" tối đa là $p = 0","25$. Thuật toán được lặp lại $k$ lượt độc lập, và thuật toán chỉ kết luận nhầm nếu *tất cả* $k$ lượt thử đều kết luận nhầm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình sai số thuật toán Monte Carlo
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Mỗi lượt sai: p <= 0,25]))
    content((-1.5, -0.25), text(size: 7.5pt, [k lượt độc lập]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Xác suất sai toàn cục]))
    content((1.6, -0.25), text(size: 8pt, fill: rgb("15803d"), [P_sai <= (0,25)^k = 4^(-k)]))
  })
]
],
    (
        True([Xác suất để thuật toán kết luận nhầm sau $k$ lượt thử độc lập không vượt quá $(frac(1, 4))^k$.]),
        True([Với $k = 10$, xác suất kết luận nhầm của thuật toán nhỏ hơn $10^(-6)$.]),
        True([Với $k = 20$, xác suất kết luận nhầm của thuật toán nhỏ hơn $10^(-12)$.]),
        False([Để xác suất kết luận nhầm nhỏ hơn $10^(-3)$, chỉ cần thực hiện đúng $k = 3$ lượt thử.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Xác suất sai toàn cục: $P_("sai") <= (0","25)^k = 4^(-k)$.
        2. Tính toán cụ thể cho các giá trị $k = 10, 20, 3$.

        #step([Phân tích ý a])
        Vì các lượt kiểm tra là độc lập và thuật toán chỉ sai khi cả $k$ lượt cùng sai, xác suất sai không vượt quá $(frac(1, 4))^k$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Với $k = 10$:
        $ 4^10 = 1048576 > 10^6 ==> (frac(1, 4))^10 = frac(1, 1048576) < 10^(-6) $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Với $k = 20$:
        $ 4^20 = (4^10)^2 = (1048576)^2 > (10^6)^2 = 10^12 ==> (frac(1, 4))^20 < 10^(-12) $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Với $k = 3$:
        $ 4^3 = 64 ==> (frac(1, 4))^3 = frac(1, 64) approx 0","015625 = 1","5625% > 10^(-3) = 0","1% $
        Do đó $k = 3$ chưa đủ để xác suất sai nhỏ hơn $10^(-3)$ (cần tối thiểu $k = 5$ vì $4^5 = 1024 > 1000$).
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Một vệ tinh nhân tạo sử dụng $4$ tấm pin quang điện độc lập để cấp điện. Xác suất để mỗi tấm pin hoạt động bình thường sau $5$ năm trong không gian là $p = 0","95$. Vệ tinh duy trì được chức năng nếu có ít nhất $3$ tấm pin hoạt động tốt. Tính xác suất để vệ tinh duy trì hoạt động tốt sau $5$ năm (làm tròn kết quả đến hàng phần nghìn).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // 4 tấm pin vệ tinh
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Vệ tinh 3-out-of-4: P(X >= 3)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [P(3) + P(4) = 4(0,95)^3(0,05) + (0,95)^4 ≈ 0,1715 + 0,8145 = 0,986]))
  })
]
],
    [0,986],
    loigiai: [
        #step([Phương pháp giải])
        Số tấm pin hoạt động tốt $X ~ B(4; 0","95)$.
        Xác suất vệ tinh hoạt động tốt:
        $ P(X >= 3) = P(X = 3) + P(X = 4) $

        #step([Lời giải chi tiết])
        - $P(X = 4) = (0","95)^4 approx 0","814506$
        - $P(X = 3) = C_4^3 (0","95)^3 (0","05)^1 = 4 dot 0","857375 dot 0","05 = 0","171475$
        Tổng xác suất:
        $ P(X >= 3) = 0","814506 + 0","171475 = 0","985981 approx 0","986 $
        Vậy xác suất vệ tinh hoạt động tốt là $0","986$.
    ]
)

// TLN 2
#tln([Trong xét nghiệm tầm soát y tế gộp nhóm gồm $k = 8$ cá nhân độc lập với tỷ lệ nhiễm bệnh là $p = 0","015$. Tính xác suất để một mẫu gộp của nhóm đó có kết quả âm tính (làm tròn kết quả đến hàng phần trăm, ví dụ $0","89$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mẫu gộp 8 người
    rect((-2.5, -0.5), (2.5, 0.5), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [P(Âm) = (1 - 0,015)^8 = (0,985)^8 ≈ 0,89]))
  })
]
],
    [0,89],
    loigiai: [
        #step([Phương pháp giải])
        Mẫu gộp âm tính khi cả $8$ cá nhân đều âm tính:
        $ P = (1 - p)^8 = (0","985)^8 $

        #step([Lời giải chi tiết])
        Tính toán:
        $ P = (0","985)^8 approx 0","88588 $
        Làm tròn đến hàng phần trăm ta được kết quả là $0","89$.
    ]
)

// TLN 3
#tln([Một hệ thống ngân hàng số sử dụng mô hình học máy (Machine Learning) để phát hiện giao dịch gian lận. Tỷ lệ cảnh báo nhầm đối với các giao dịch hợp lệ là $p = 0","02$. Trong một ca làm việc có $n = 1500$ giao dịch hợp lệ độc lập được xử lý. Tính phương sai $V(X)$ của số giao dịch bị cảnh báo nhầm trong ca làm việc đó.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình cảnh báo nhầm ML
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [X ~ B(1500; 0,02)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [V(X) = 1500 . 0,02 . 0,98 = 29,4]))
  })
]
],
    [29,4],
    loigiai: [
        #step([Phương pháp giải])
        Biến ngẫu nhiên $X ~ B(1500; 0","02)$.
        Phương sai: $V(X) = n p (1 - p)$.

        #step([Lời giải chi tiết])
        Thay số:
        $ V(X) = 1500 dot 0","02 dot (1 - 0","02) = 30 dot 0","98 = 29","4 $
        Vậy phương sai của số giao dịch cảnh báo nhầm là $29","4$.
    ]
)

// TLN 4
#tln([Một hệ thống phòng thủ ven biển bố trí các bệ phóng tên lửa tự động bắn độc lập vào một tàu đổ bộ xâm nhập. Xác suất tiêu diệt mục tiêu của mỗi quả tên lửa là $p = 0","60$. Cần bắn tối thiểu bao nhiêu quả tên lửa để xác suất tiêu diệt mục tiêu đạt ít nhất $99%$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Bắn chặn phòng thủ biển
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [1 - (0,4)^n >= 0,99 <=> (0,4)^n <= 0,01]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [n >= ln(0,01) / ln(0,4) ≈ -4,605 / -0,9163 ≈ 5,02 ==> n = 6]))
  })
]
],
    [6],
    loigiai: [
        #step([Phương pháp giải])
        Gọi $n$ là số tên lửa cần bắn.
        Xác suất cả $n$ quả đều trượt là $(1 - 0","6)^n = (0","4)^n$.
        Xác suất trúng ít nhất một quả:
        $ 1 - (0","4)^n >= 0","99 <=> (0","4)^n <= 0","01 $

        #step([Lời giải chi tiết])
        Lấy logarit tự nhiên:
        $ n dot ln(0","4) <= ln(0","01) <=> n >= frac(ln(0","01), ln(0","4)) $
        Ta có $ln(0","01) approx -4","60517$ và $ln(0","4) approx -0","91629$.
        $ n >= frac(-4","60517, -0","91629) approx 5","0259 $
        Vì $n$ là số nguyên dương nên số quả tên lửa tối thiểu cần bắn là $n = 6$.
    ]
)

// TLN 5
#tln([Cho biến ngẫu nhiên $X$ có kỳ vọng $E(X) = 50$ và phương sai $V(X) = 25$. Theo Bất đẳng thức Chebyshev, cận trên của xác suất để $X$ lệch khỏi kỳ vọng từ $15$ đơn vị trở lên: $P(|X - 50| >= 15) <= frac(1, k^2)$. Giá trị của cận trên $frac(1, k^2)$ đó bằng bao nhiêu? (Làm tròn kết quả đến hàng phần trăm, ví dụ $0","11$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ Chebyshev k = 3
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [σ = sqrt(25) = 5; Độ lệch 15 = 3σ ==> k = 3]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [Cận trên = 1 / 3^2 = 1 / 9 ≈ 0,11]))
  })
]
],
    [0,11],
    loigiai: [
        #step([Phương pháp giải])
        Bất đẳng thức Chebyshev:
        $ P(|X - mu| >= k sigma) <= frac(1, k^2) $
        1. Tìm độ lệch chuẩn $sigma = sqrt(V(X))$.
        2. Biểu diễn độ lệch $15$ theo số lần độ lệch chuẩn: $15 = k sigma$.
        3. Tính cận trên $frac(1, k^2)$.

        #step([Lời giải chi tiết])
        Độ lệch chuẩn:
        $ sigma = sqrt(25) = 5 $
        Độ lệch $15 = k dot 5 ==> k = 3$.
        Cận trên xác suất:
        $ frac(1, k^2) = frac(1, 3^2) = frac(1, 9) approx 0","1111 $
        Làm tròn đến hàng phần trăm ta được $0","11$.
    ]
)

// TLN 6
#tln([Một mạng lưới cảm biến môi trường IoT trong thành phố thông minh gồm $n = 800$ nốt cảm biến hoạt động độc lập. Xác suất để mỗi nốt cảm biến bị mất kết nối truyền tín hiệu trong một ngày là $p = 0","02$. Gọi $X$ là số nốt cảm biến bị mất kết nối trong ngày. Tính độ lệch chuẩn $sigma(X)$ của $X$ (làm tròn kết quả đến hàng phần mười).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mạng cảm biến IoT
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [X ~ B(800; 0,02)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [V(X) = 800 . 0,02 . 0,98 = 15,68 ==> σ(X) = sqrt(15,68) ≈ 4,0]))
  })
]
],
    [4,0],
    loigiai: [
        #step([Phương pháp giải])
        Biến ngẫu nhiên $X ~ B(800; 0","02)$.
        Phương sai: $V(X) = n p (1 - p)$.
        Độ lệch chuẩn: $sigma(X) = sqrt(V(X))$.

        #step([Lời giải chi tiết])
        Phương sai:
        $ V(X) = 800 dot 0","02 dot (1 - 0","02) = 16 dot 0","98 = 15","68 $
        Độ lệch chuẩn:
        $ sigma(X) = sqrt(15","68) approx 3","95979 $
        Làm tròn đến hàng phần mười ta được kết quả là $4","0$.
    ]
)

]

#make-questions()
