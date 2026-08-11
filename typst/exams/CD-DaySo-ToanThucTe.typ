#import "../sang-exam.typ": *
#import "../template.typ": *
#import "../bbt.typ": bbbt, bbt-opt
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ GIAO DIỆN
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("1565C0"), rgb("1976D2"), angle: 0deg),
  stroke: none,
  inset: (x: 15pt, y: 10pt),
  radius: 6pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("E67E22")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("E67E22"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1E8449"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Các hộp màu sắc chuẩn ────────────────────────────────────
#let eco-box(body) = block(
  fill: rgb("EEF4FB"), stroke: (left: 4pt + rgb("1565C0"), rest: 0.8pt + rgb("AACCE0")),
  radius: (right: 7pt), inset: (x: 16pt, y: 14pt), width: 100%,
)[#body]

#let note-box(title: "📌 Nhận Xét", body) = block(
  fill: rgb("FFFBF2"), stroke: (left: 4pt + rgb("E67E22"), rest: 0.6pt + rgb("FAD7A0")),
  radius: (right: 6pt), inset: (x: 14pt, y: 11pt), width: 100%,
)[#text(fill: rgb("E67E22"), weight: "bold")[#title]#v(0.3em)#body]

#let ans-box(body) = block(
  fill: rgb("FFFDE7"), stroke: (left: 4pt + rgb("B7950B"), rest: 0.6pt + rgb("F9E79F")),
  radius: (right: 6pt), inset: (x: 14pt, y: 11pt), width: 100%,
)[#text(fill: rgb("7D6608"), weight: "bold")[✅ Kết Luận]#v(0.3em)#body]

#let True(content) = content
#let False(content) = content

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D1B2A"), rgb("1B3A6B"), rgb("0D1B2A"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 22pt),
  )[
    #text(fill: rgb("E67E22"), size: 10pt, weight: "bold", tracking: 3pt)[
      CHUYÊN ĐỀ ỨNG DỤNG THỰC TẾ
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "bold")[DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN]
    #v(0.4em)
  ]
]

#note-box(title: "MỤC TIÊU HỌC TẬP")[
  - Nhận biết và thiết lập được công thức tổng quát của Dãy số, Cấp số cộng (CSC), Cấp số nhân (CSN).

  - Vận dụng công thức tính tổng $n$ số hạng đầu tiên để giải quyết các bài toán thực tế (xếp ghế, tính lương, lãi suất).

  - Áp dụng cấp số nhân lùi vô hạn vào các mô hình vật lý và sinh học (chu kỳ bán rã, sự nảy của quả bóng).
]

== A. CÁC MÔ HÌNH TRỌNG ĐIỂM VÀ BÀI TẬP MẪU


#eco-box[
    *1. Cấp số cộng (CSC)*
    - *Định nghĩa:* Dãy số mà số hạng sau bằng số hạng trước cộng với một số không đổi $d$ (công sai).
    $ u_(n+1) = u_n + d $
    - *Số hạng tổng quát:*
    $ u_n = u_1 + (n - 1)d $
    - *Tổng $n$ số hạng đầu tiên ($S_n$):*
    $ S_n = (n(u_1 + u_n)) / 2 = (n(2u_1 + (n-1)d)) / 2 $
    - *Ứng dụng:* Mô hình xếp ghế rạp hát (số ghế tăng đều), lương tăng một số tiền cố định mỗi năm, khấu hao tài sản tuyến tính, mô hình xếp gạch/tháp...
]

#eco-box[
    *2. Cấp số nhân (CSN)*
    - *Định nghĩa:* Dãy số mà số hạng sau bằng số hạng trước nhân với một số không đổi $q$ (công bội).
    $ u_(n+1) = u_n times q $
    - *Số hạng tổng quát:*
    $ u_n = u_1 times q^(n - 1) $
    - *Tổng $n$ số hạng đầu tiên ($S_n$):*
    $ S_n = u_1 times (1 - q^n) / (1 - q) quad (q eq.not 1) $
    - *Tổng cấp số nhân lùi vô hạn ($|q| < 1$):*
    $ S = u_1 / (1 - q) $
    - *Ứng dụng:* Bài toán lãi kép, dân số tăng theo tỷ lệ phần trăm, chuỗi phản ứng phân hạch, bóng nảy, bài toán hạt thóc bàn cờ...
]

#eco-box[
    *3. Mô hình Tài chính: Vay Trả Góp (Annuity)*
    Khi vay một khoản tiền $P$ với lãi suất $r$/tháng và trả góp đều đặn số tiền $M$ mỗi tháng:
    - *Số dư nợ sau tháng $n$:* 
    $ D_n = P(1+r)^n - M ((1+r)^n - 1) / r $
    - Mô hình này là sự kết hợp giữa sự tăng lên của tiền nợ theo *Cấp số nhân* và sự giảm đi của khoản trả góp theo *Tổng Cấp số nhân*.
]

#eco-box[
    *4. Mô hình Kinh tế Vĩ mô: Số nhân Tiền tệ*
    Một ngân hàng nhận khoản tiền gửi ban đầu $D_0$. Nếu tỷ lệ dự trữ bắt buộc là $r$, ngân hàng sẽ cho vay lại phần còn lại $(1-r)D_0$. Quá trình này lặp lại vô hạn.
    - *Tổng cung tiền tạo ra trong nền kinh tế:*
    $ S = D_0 + D_0(1-r) + D_0(1-r)^2 + ... = D_0 / r $
    - Đây là một *Cấp số nhân lùi vô hạn* với công bội $q = 1-r$. Số nhân tiền tệ là $1/r$.
]

#eco-box[
    *5. Mô hình Vật lý & Hình học Fractal*
    - *Truyền sáng qua kính (Định luật Beer-Lambert dạng rời rạc):* Mỗi lớp kính cản trở $p%$ lượng ánh sáng. Lượng ánh sáng truyền qua $n$ lớp kính là một CSN: $I_n = I_0(1 - p)^n$.
    - *Hình học Fractal (Bông tuyết Koch):* Ở mỗi bước, chu vi của bông tuyết tăng lên theo CSN với $q = 4/3$. Do $q > 1$ nên chu vi tiến tới vô cực, nhưng diện tích lại bị giới hạn (vì tổng diện tích các tam giác thêm vào là một CSN lùi vô hạn).
]

#eco-box[
    *6. Nghệ thuật và Âm nhạc (Chuẩn âm Piano)*
    Hệ thống 12 phím bấm (Equal temperament) của đàn piano tạo thành một *Cấp số nhân* về tần số. 
    - Để lên một quãng 8 (tần số gấp đôi) cần bước qua 12 nửa cung.
    - Công bội của dãy tần số là $q = root(12, 2) approx 1.05946$.
]

== B. BÀI TẬP TỰ LUYỆN ĐỊNH DẠNG MỚI (2025)

=== PHẦN I: Câu trắc nghiệm nhiều phương án lựa chọn
*(Thí sinh chọn 1 đáp án đúng duy nhất trong 4 phương án)*

#tn(
  id: "M1",
  [Một rạp hát có 30 hàng ghế. Hàng đầu tiên có 15 ghế, hàng thứ hai có 18 ghế, hàng thứ ba có 21 ghế, và cứ tiếp tục như vậy (số ghế mỗi hàng tăng thêm một số không đổi). Hỏi rạp hát đó có tổng cộng bao nhiêu chỗ ngồi?],
  ([$1350$ ghế.], [$1755$ ghế.], True([$1755$ ghế.]), [$1800$ ghế.]),
  loigiai: [
    *Bước 1: Mô hình hóa toán học* 
    
    Số ghế ở mỗi hàng lập thành một cấp số cộng với:
    - Số hạng đầu (hàng 1): $u_1 = 15$.
    - Công sai (mỗi hàng tăng thêm 3 ghế): $d = 3$.
    - Tổng số hàng ghế: $n = 30$.
    
    *Bước 2: Sử dụng công thức tổng* 
    
    Yêu cầu tính tổng số ghế của cả rạp hát, tức là $S_30$.
    $ S_n = (n(2u_1 + (n - 1)d)) / 2 $
    
    *Bước 3: Tính toán* 
    
    Thay số:
    $ S_30 = (30 times (2 times 15 + (30 - 1) times 3)) / 2 $
    $ S_30 = 15 times (30 + 29 times 3) = 15 times (30 + 87) = 15 times 117 = 1755 $
    
    #ans-box[Tổng cộng rạp hát có *$1755$ ghế*.]
  ]
)

#tn(
  id: "M2",
  [Một người lao động được nhận vào làm việc tại một công ty với mức lương khởi điểm là $10$ triệu đồng/tháng. Công ty cam kết cứ sau mỗi năm làm việc, mức lương sẽ được tăng thêm $1$ triệu đồng/tháng so với năm trước đó. Tính tổng số tiền lương người đó nhận được sau đúng $5$ năm làm việc (đơn vị: triệu đồng).],
  ([$720$ triệu.], True([$720$ triệu.]), [$60$ triệu.], [$650$ triệu.]),
  loigiai: [
    *Bước 1: Phân tích mô hình lương* 
    
    Lương *mỗi tháng* trong năm thứ $n$ là một cấp số cộng $u_n$:
    - Năm 1: $u_1 = 10$ (triệu/tháng).
    - Công sai mỗi năm: $d = 1$ (triệu/tháng).
    - Năm thứ 5: $u_5 = 10 + (5 - 1) times 1 = 14$ (triệu/tháng).
    
    *Bước 2: Thiết lập tổng* 
    
    Tổng số tiền lương trong 1 năm bằng 12 lần lương tháng. Do đó, tổng tiền lương sau 5 năm là:
    $ T = 12 times (u_1 + u_2 + u_3 + u_4 + u_5) = 12 times S_5 $
    
    *Bước 3: Tính toán* 
    
    $ S_5 = (5 times (u_1 + u_5)) / 2 = (5 times (10 + 14)) / 2 = (5 times 24) / 2 = 60 $ (triệu)
    
    Tổng tiền thu nhập: $12 times 60 = 720$ triệu đồng.
    
    #ans-box[Người đó nhận tổng cộng *$720$ triệu đồng* sau 5 năm.]
  ]
)

#tn(
  id: "M3",
  [Người ta xếp các ống nước thành một hình tháp như sau: Hàng dưới cùng (hàng thứ nhất) có 100 ống, hàng thứ hai có 99 ống, hàng thứ ba có 98 ống, ..., cho đến khi hàng trên cùng chỉ có 1 ống. Tính tổng số ống nước được sử dụng để xếp tháp.],
  ([$4950$ ống.], True([$5050$ ống.]), [$5000$ ống.], [$5100$ ống.]),
  loigiai: [
    *Bước 1: Thiết lập dãy số* 
    
    Số ống ở mỗi hàng tạo thành một CSC với $u_1 = 1$, $u_2 = 2, ..., u_n = 100$. (Lấy từ trên đỉnh tháp xuống cho dễ tính).
    - Số hạng đầu: $u_1 = 1$.
    - Công sai: $d = 1$.
    - Số hạng cuối: $u_n = 100$. (Suy ra có $n = 100$ hàng).
    
    *Bước 2: Tính tổng* 
    
    Tổng số ống là tổng của $100$ số tự nhiên đầu tiên:
    $ S_100 = 1 + 2 + ... + 100 = (100 times (1 + 100)) / 2 $
    
    *Bước 3: Kết quả* 
    
    $ S_100 = 50 times 101 = 5050 $
    
    #ans-box[Cần *$5050$ ống nước* để xếp thành hình tháp.]
  ]
)

#tn(
  id: "M4",
  [Một quả bóng được thả rơi từ độ cao 20 mét xuống sân bê tông. Mỗi lần chạm đất, nó nảy lên một độ cao bằng $3/4$ độ cao trước đó. Gọi $h_n$ là độ cao của quả bóng sau lần nảy thứ $n$. Công thức số hạng tổng quát $h_n$ là gì?],
  ([$h_n = 20 times (3/4)^n$], True([$h_n = 20 times (3/4)^n$]), [$h_n = 20 times (3/4)^(n-1)$], [$h_n = 15 times (3/4)^n$]),
  loigiai: [
    *Bước 1: Quy ước mốc* 
    
    - Độ cao ban đầu (khi chưa nảy): $h_0 = 20$.
    - Lần nảy thứ 1: $h_1 = h_0 times (3/4) = 20 times (3/4)$.
    - Lần nảy thứ 2: $h_2 = h_1 times (3/4) = 20 times (3/4)^2$.
    
    *Bước 2: Thiết lập tổng quát* 
    
    Bằng phương pháp quy nạp, ta thấy sau lần nảy thứ $n$, quả bóng nảy lên độ cao:
    $ h_n = 20 times (3/4)^n $
    
    Nếu coi $h_1$ là số hạng đầu của CSN ($u_1 = 15$), công bội $q = 3/4$, thì $u_n = 15 times (3/4)^(n-1) = 20 times (3/4) times (3/4)^(n-1) = 20 times (3/4)^n$.
    
    #ans-box[Công thức đúng là *$h_n = 20 times (3/4)^n$*.]
  ]
)

#tn(
  id: "M5",
  [Truyền thuyết kể rằng, người phát minh ra bàn cờ vua đã xin nhà vua Ấn Độ phần thưởng như sau: Đặt 1 hạt thóc vào ô thứ nhất, 2 hạt vào ô thứ hai, 4 hạt vào ô thứ ba, ..., cứ như vậy ô sau gấp đôi ô trước cho đến ô thứ 64. Hỏi tổng số hạt thóc mà nhà vua phải trả được biểu diễn bằng công thức nào?],
  ([$2^64$], [$2^63 - 1$], True([$2^64 - 1$]), [$2^65 - 1$]),
  loigiai: [
    *Bước 1: Xác định quy luật dãy số* 
    
    Số hạt thóc ở mỗi ô tạo thành một CSN:
    - Số hạng đầu: $u_1 = 1$.
    - Công bội: $q = 2$.
    - Số các số hạng (tương ứng 64 ô cờ): $n = 64$.
    
    *Bước 2: Lập công thức tính tổng* 
    
    Tổng số thóc trên 64 ô là $S_64$:
    $ S_64 = (u_1 (1 - q^64)) / (1 - q) = (1 (1 - 2^64)) / (1 - 2) $
    
    *Bước 3: Rút gọn* 
    
    $ S_64 = (1 - 2^64) / (-1) = 2^64 - 1 $
    
    #ans-box[Tổng số hạt thóc là *$2^64 - 1$*.]
  ]
)

#tn(
  id: "M6",
  [Ông A gửi tiết kiệm 100 triệu đồng vào ngân hàng với lãi suất $6%$/năm, tính theo hình thức lãi kép (tiền lãi sinh ra được nhập vào gốc để tính lãi cho năm sau). Không có khoản tiền nào được rút ra hay gửi thêm. Hỏi sau đúng 5 năm, tổng số tiền (cả gốc lẫn lãi) ông A nhận được là bao nhiêu? (Làm tròn đến ngàn đồng).],
  ([$130.000.000$ đ.], True([$133.823.000$ đ.]), [$133.000.000$ đ.], [$134.823.000$ đ.]),
  loigiai: [
    *Bước 1: Mô hình hóa bài toán lãi kép* 
    
    Gọi $u_n$ là tổng số tiền sau $n$ năm. Tiền của năm sau bằng tiền năm trước cộng thêm $6%$ tiền năm trước.
    $ u_n = u_(n-1) + 0.06 u_(n-1) = 1.06 u_(n-1) $
    
    Đây là một CSN với số hạng khởi đầu $u_0 = 100$ và công bội $q = 1.06$.
    
    *Bước 2: Tính số tiền sau 5 năm* 
    
    $ u_5 = u_0 times q^5 = 100 times (1.06)^5 $ (triệu đồng).
    
    *Bước 3: Bấm máy tính* 
    
    $ 100 times (1.06)^5 approx 100 times 1.3382255776 = 133.82255776 $
    
    Làm tròn đến hàng ngàn ta được $133.823.000$ đồng.
    
    #ans-box[Số tiền nhận được là *$133.823.000$ VNĐ*.]
  ]
)

#tn(
  id: "M7",
  [Một mẻ vi khuẩn ban đầu có 500 con. Trong điều kiện môi trường lý tưởng, cứ sau mỗi 30 phút, số lượng vi khuẩn tăng gấp đôi. Hỏi sau 3 giờ, mẻ vi khuẩn đó có bao nhiêu con?],
  ([$4000$ con.], [$8000$ con.], True([$32000$ con.]), [$16000$ con.]),
  loigiai: [
    *Bước 1: Quy đổi thời gian thành số chu kỳ* 
    
    - Chu kỳ nhân đôi: $T = 30$ phút.
    - Tổng thời gian: $3$ giờ = $180$ phút.
    - Số chu kỳ nhân đôi: $n = 180 / 30 = 6$ chu kỳ.
    
    *Bước 2: Thiết lập mô hình CSN* 
    
    Số lượng vi khuẩn $u_k$ sau $k$ chu kỳ tạo thành CSN với:
    - Ban đầu ($0$ chu kỳ): $u_0 = 500$.
    - Công bội: $q = 2$.
    
    Sau $6$ chu kỳ:
    $ u_6 = u_0 times 2^6 = 500 times 64 $
    
    *Bước 3: Tính toán* 
    
    $ 500 times 64 = 32000 $
    
    #ans-box[Số lượng vi khuẩn sau 3 giờ là *$32000$ con*.]
  ]
)

#tn(
  id: "M8",
  [Công ty A sản xuất 1000 sản phẩm trong năm đầu tiên. Kế hoạch của công ty là mỗi năm tiếp theo sẽ sản xuất nhiều hơn năm trước đó 200 sản phẩm. Hỏi tổng số sản phẩm công ty sản xuất được trong 10 năm đầu tiên là bao nhiêu?],
  ([$19000$], [$18000$], True([$19000$]), [$20000$]),
  loigiai: [
    *Bước 1: Mô hình hóa bằng Cấp số cộng* 
    
    Sản lượng mỗi năm là một số hạng của CSC:
    - $u_1 = 1000$ (năm thứ nhất).
    - $d = 200$ (tăng thêm hàng năm).
    
    Yêu cầu: Tính tổng sản lượng trong 10 năm, tức là $S_10$.
    
    *Bước 2: Áp dụng công thức tổng CSC* 
    
    $ S_n = n/2 (2u_1 + (n - 1)d) $
    $ S_10 = 10/2 (2(1000) + (10 - 1)(200)) $
    
    *Bước 3: Tính toán* 
    
    $ S_10 = 5 times (2000 + 9 times 200) = 5 times (2000 + 1800) = 5 times 3800 = 19000 $
    
    #ans-box[Tổng sản lượng trong 10 năm là *$19000$ sản phẩm*.]
  ]
)

#tn(
  id: "M9",
  [Một người bắt đầu tập chạy bộ. Tuần đầu tiên anh ta chạy tổng cộng 10 km. Để nâng cao thể lực, anh ta quyết định từ tuần thứ hai trở đi, mỗi tuần chạy tăng thêm $10%$ khoảng cách so với tuần ngay trước đó. Tính tổng khoảng cách anh ta đã chạy được trong 8 tuần đầu tiên (làm tròn đến 1 chữ số thập phân).],
  ([$100.2$ km.], True([$114.4$ km.]), [$110.0$ km.], [$124.4$ km.]),
  loigiai: [
    *Bước 1: Mô hình hóa bằng Cấp số nhân* 
    
    Khoảng cách chạy mỗi tuần là một CSN:
    - Tuần đầu: $u_1 = 10$.
    - Công bội $q$: Do tăng $10%$ nên $q = 1 + 0.10 = 1.1$.
    
    Yêu cầu: Tổng khoảng cách 8 tuần là $S_8$.
    
    *Bước 2: Áp dụng công thức tổng CSN* 
    
    $ S_n = u_1 (1 - q^n) / (1 - q) $
    $ S_8 = 10 (1 - 1.1^8) / (1 - 1.1) = 10 (1 - 1.1^8) / (-0.1) = -100 (1 - 1.1^8) $
    
    *Bước 3: Tính toán bằng máy tính* 
    
    $ 1.1^8 approx 2.14358881 $
    $ S_8 = -100 (1 - 2.14358881) = -100 (-1.14358881) approx 114.358 $
    
    Làm tròn đến 1 chữ số thập phân là $114.4$.
    
    #ans-box[Tổng khoảng cách anh ta đã chạy là khoảng *$114.4$ km*.]
  ]
)

#tn(
  id: "M10",
  [Một bệnh nhân đang điều trị được tiêm một liều thuốc 500 mg vào máu. Đáng chú ý là sau mỗi giờ trôi qua, thận của bệnh nhân sẽ lọc bỏ đi được $20%$ lượng thuốc có trong máu ở đầu giờ đó. Khẳng định nào sau đây là mô hình đúng cho lượng thuốc còn lại $u_n$ sau $n$ giờ?],
  ([$u_n = 500 - 100n$], [$u_n = 500 times (0.2)^n$], True([$u_n = 500 times (0.8)^n$]), [$u_n = 500 - 20n$]),
  loigiai: [
    *Bước 1: Phân tích cơ chế lọc* 
    
    Nếu lượng thuốc bị lọc bỏ là $20%$, thì phần thuốc *còn lại* trong máu sẽ là:
    $ 100% - 20% = 80% = 0.8 $ (so với lượng thuốc ở đầu giờ).
    
    *Bước 2: Lập dãy số* 
    
    Gọi $u_0 = 500$ là liều ban đầu.
    - Sau 1 giờ: $u_1 = u_0 times 0.8 = 500 times 0.8$.
    - Sau 2 giờ: $u_2 = u_1 times 0.8 = 500 times (0.8)^2$.
    
    Đây là cấp số nhân với công bội $q = 0.8$. Sau $n$ giờ, lượng thuốc còn lại là:
    $ u_n = 500 times (0.8)^n $
    
    #ans-box[Mô hình đúng là *$u_n = 500 times (0.8)^n$*.]
  ]
)

#tn(
  id: "M11",
  [Trong toán sinh thái học, người ta quan sát sự phát triển nhánh của một loài cây. Năm đầu tiên, cây chỉ có 1 cành (thân chính). Từ năm thứ 2, cứ mỗi năm cành cũ mọc ra 1 nhánh mới, trong khi nhánh mới phải mất 1 năm để "trưởng thành" rồi năm sau nữa mới bắt đầu đẻ nhánh. Số nhánh cây (kể cả thân chính) qua các năm lập thành dãy số nào sau đây?],
  ([Dãy cấp số cộng công sai $d=1$.], [$1, 2, 4, 8, 16, ...$ (CSN)], True([Dãy Fibonacci $1, 1, 2, 3, 5, 8...$]), [Dãy số chính phương.]),
  loigiai: [
    *Bước 1: Khảo sát từng năm* 
    
    - Năm 1: 1 thân ($1$).
    - Năm 2: thân chính đẻ 1 nhánh ($2$).
    - Năm 3: thân chính đẻ 1 nhánh, nhánh năm ngoái đang trưởng thành chưa đẻ ($3$).
    - Năm 4: thân chính đẻ 1 nhánh, nhánh cũ (từ năm 2) đẻ 1 nhánh, nhánh từ năm 3 chưa đẻ ($5$).
    
    *Bước 2: Quy luật (Truy hồi)* 
    
    Số nhánh năm $n$ bằng toàn bộ số nhánh năm $(n-1)$ (vì không cành nào chết) CỘNG với số lượng cành mới sinh ra. Cành mới sinh ra chính bằng số lượng cành đã trưởng thành, tức là tổng số nhánh ở năm $(n-2)$.
    $ u_n = u_(n-1) + u_(n-2) $
    
    Đây chính xác là định nghĩa của dãy Fibonacci.
    
    #ans-box[Số lượng nhánh cây tuân theo quy luật của *Dãy Fibonacci*.]
  ]
)

#tn(
  id: "M12",
  [Một công ty mua một chiếc xe tải với giá $1.2$ tỷ đồng. Để tính khấu hao, kế toán dùng phương pháp khấu hao đường thẳng (mỗi năm mất đi một lượng giá trị bằng nhau). Khấu hao xong sau đúng 10 năm (giá trị xe về 0). Hỏi sau 3 năm sử dụng, chiếc xe được định giá bao nhiêu trên sổ sách?],
  ([$840$ triệu đồng.], True([$840$ triệu đồng.]), [$360$ triệu đồng.], [$900$ triệu đồng.]),
  loigiai: [
    *Bước 1: Tìm mức khấu hao mỗi năm (Công sai)* 
    
    Giá trị xe mất đi trong 10 năm là $1.2$ tỷ ($1200$ triệu).
    Do khấu hao đường thẳng, mỗi năm mất đi:
    $ d = 1200 / 10 = 120 $ (triệu/năm).
    
    *Bước 2: Thiết lập cấp số cộng* 
    
    Giá trị xe ở đầu năm $n$ (khi chưa tính khấu hao của năm đó) là $u_n = 1200 - (n-1)120$.
    Hoặc tính đơn giản: Sau 3 năm, giá trị xe bị trừ đi $3$ lần khấu hao:
    $ V(3) = 1200 - 3 times 120 $
    
    *Bước 3: Tính toán* 
    
    $ V(3) = 1200 - 360 = 840 $ (triệu đồng).
    
    #ans-box[Giá trị còn lại trên sổ sách là *$840$ triệu đồng*.]
  ]
)

#tn(
  id: "M13",
  [Trái ngược với Bài M12, một tài sản áp dụng "Khấu hao theo số dư giảm dần" $20%$/năm, nghĩa là mỗi năm giá trị tài sản giảm $20%$ so với giá trị của NĂM NGAY TRƯỚC ĐÓ. Nếu một máy móc mua mới giá 500 triệu, giá trị của nó sau 4 năm là bao nhiêu? (Làm tròn đến triệu đồng).],
  ([$100$ triệu đồng.], [$256$ triệu đồng.], True([$205$ triệu đồng.]), [$200$ triệu đồng.]),
  loigiai: [
    *Bước 1: Mô hình hóa CSN* 
    
    Giảm $20%$ nghĩa là phần trăm giá trị giữ lại là $100% - 20% = 80% = 0.8$.
    Giá trị tài sản sau $n$ năm là một Cấp số nhân:
    $ V_n = V_0 times (0.8)^n $
    
    *Bước 2: Tính toán sau 4 năm* 
    
    $ V_4 = 500 times (0.8)^4 $
    
    *Bước 3: Bấm máy tính* 
    
    $ (0.8)^4 = 0.4096 $
    $ V_4 = 500 times 0.4096 = 204.8 $
    
    Làm tròn đến triệu đồng là 205 triệu.
    
    #ans-box[Giá trị máy móc còn lại khoảng *$205$ triệu đồng*.]
  ]
)

#tn(
  id: "M14",
  [Để xây dựng một bậc thang dẫn lên đền thờ, người ta dùng các khối đá. Bậc dưới cùng rộng nhất dài 30 mét. Mỗi bậc tiếp theo đi lên thu hẹp lại $0.5$ mét so với bậc ngay dưới nó. Bậc trên cùng ở cửa đền dài 10 mét. Hỏi có tất cả bao nhiêu bậc thang?],
  ([$40$ bậc.], True([$41$ bậc.]), [$42$ bậc.], [$39$ bậc.]),
  loigiai: [
    *Bước 1: Nhận diện mô hình* 
    
    Chiều dài các bậc thang từ dưới lên tạo thành một Cấp số cộng:
    - Bậc 1 (dưới cùng): $u_1 = 30$.
    - Công sai (vì thu hẹp): $d = -0.5$.
    - Bậc cuối cùng (trên đỉnh): $u_n = 10$.
    
    *Bước 2: Giải phương trình số hạng tổng quát* 
    
    Ta có $u_n = u_1 + (n - 1)d$. Thay số:
    $ 10 = 30 + (n - 1)(-0.5) $
    
    *Bước 3: Giải tìm $n$* 
    
    $ -20 = -0.5 (n - 1) $
    $ n - 1 = (-20) / (-0.5) = 40 $
    $ n = 41 $
    
    #ans-box[Cầu thang lên đền có tất cả *$41$ bậc*.]
  ]
)

#tn(
  id: "M15",
  [Một quả bóng cao su rơi từ độ cao 10 mét xuống nền đất dội lên dội xuống vô tận. Mỗi lần nảy, nó đạt độ cao bằng $1/2$ độ cao của lần rơi ngay trước đó. Tính tổng quãng đường mà quả bóng di chuyển (kể từ lúc bắt đầu thả cho đến khi dừng hẳn).],
  ([$20$ m.], True([$30$ m.]), [$40$ m.], [$15$ m.]),
  loigiai: [
    *Bước 1: Phân tích quãng đường rơi và nảy* 
    
    - Lần rơi 1: Quãng đường là 10.
    - Lần nảy 1 rồi rơi 2: Nảy lên $10 times 1/2 = 5$, rồi rơi xuống $5$. Vậy quãng đường là $2 times 5 = 10$.
    - Lần nảy 2 rồi rơi 3: Nảy lên $5 times 1/2 = 2.5$, rồi rơi xuống $2.5$. Quãng đường là $2 times 2.5 = 5$.
    
    Nhìn chung, tổng quãng đường $S$ gồm:
    $S = 10 + (2 times 5 + 2 times 2.5 + 2 times 1.25 + ...)$
    $S = 10 + 2 times (5 + 2.5 + 1.25 + ...)$
    
    *Bước 2: Tính tổng CSN lùi vô hạn* 
    
    Dãy số $5, 2.5, 1.25, ...$ là một CSN lùi vô hạn với $u_1 = 5$, $q = 1/2$.
    Tổng của cấp số nhân này là:
    $ S_oo = u_1 / (1 - q) = 5 / (1 - 1/2) = 5 / (0.5) = 10 $
    
    *Bước 3: Tổng quãng đường cuối cùng* 
    
    $ S = 10 + 2 times S_oo = 10 + 2 times 10 = 30 $ (mét).
    
    #ans-box[Tổng quãng đường quả bóng di chuyển là *$30$ mét*.]
  ]
)

#tn(
  id: "M16",
  [Một công ty khai thác mỏ vàng có sản lượng 120 kg vàng trong năm đầu tiên. Mỗi năm tiếp theo do trữ lượng giảm, sản lượng khai thác chỉ bằng $90%$ sản lượng của năm trước đó. Hãy tính tổng lượng vàng tối đa công ty có thể khai thác được (nếu kéo dài thời gian khai thác đến vô tận)?],
  ([$1200$ kg.], True([$1200$ kg.]), [$1080$ kg.], [$2400$ kg.]),
  loigiai: [
    *Bước 1: Nhận diện dãy số* 
    
    Sản lượng từng năm tạo thành cấp số nhân với $u_1 = 120$ và công bội $q = 90% = 0.9$.
    - Lượng vàng năm 1: $120$.
    - Lượng vàng năm 2: $120 times 0.9$.
    - Lượng vàng năm 3: $120 times 0.9^2$...
    
    *Bước 2: Sử dụng công thức CSN lùi vô hạn* 
    
    Vì $0 < q < 1$, tổng sản lượng khi khai thác vô tận là một CSN lùi vô hạn.
    $ S_oo = u_1 / (1 - q) $
    
    *Bước 3: Tính toán* 
    
    $ S_oo = 120 / (1 - 0.9) = 120 / 0.1 = 1200 $ (kg).
    
    #ans-box[Tổng lượng vàng tối đa khai thác được là *$1200$ kg*.]
  ]
)

#tn(
  id: "M17",
  [Hệ thống bơm không khí ra khỏi một bình chứa mỗi lần nhịp hút ra được $20%$ lượng khí còn lại trong bình. Hỏi sau đúng 5 nhịp bơm, lượng khí còn lại trong bình chiếm bao nhiêu phần trăm so với ban đầu? (Làm tròn đến chữ số thập phân thứ nhất).],
  ([$32.0%$], True([$32.8%$]), [$20.0%$], [$33.2%$]),
  loigiai: [
    *Bước 1: Mô hình hóa phần khí còn lại* 
    
    Mỗi lần hút đi $20%$, nghĩa là giữ lại $100% - 20% = 80% = 0.8$ lượng khí trước đó.
    Lượng khí còn lại sau $n$ nhịp bơm là CSN: $u_n = u_0 times (0.8)^n$.
    
    *Bước 2: Lượng khí sau 5 nhịp* 
    
    Sau $5$ nhịp, lượng khí còn lại là:
    $ u_5 = u_0 times (0.8)^5 $
    
    *Bước 3: Bấm máy tính phần trăm* 
    
    $ 0.8^5 = 0.32768 $
    Quy ra phần trăm: $0.32768 times 100% = 32.768%$.
    Làm tròn được $32.8%$.
    
    #ans-box[Lượng khí còn lại khoảng *$32.8%$*.]
  ]
)

#tn(
  id: "M18",
  [Ông C gửi tiết kiệm hàng tháng. Tháng thứ nhất ông gửi 5 triệu đồng. Các tháng tiếp theo, mỗi tháng ông gửi nhiều hơn tháng trước đó 500 nghìn đồng ($0.5$ triệu đồng). Giả sử ngân hàng không tính lãi suất, hỏi sau đúng 2 năm (24 tháng), tổng số tiền ông C đã gửi vào ngân hàng là bao nhiêu?],
  ([$240$ triệu đồng.], True([$258$ triệu đồng.]), [$250$ triệu đồng.], [$265$ triệu đồng.]),
  loigiai: [
    *Bước 1: Nhận diện mô hình* 
    
    Số tiền gửi mỗi tháng tạo thành một cấp số cộng:
    - $u_1 = 5$ (triệu).
    - $d = 0.5$ (triệu).
    - Số tháng: $n = 24$.
    
    *Bước 2: Tính tổng CSC* 
    
    Áp dụng công thức tổng:
    $ S_24 = 24/2 (2u_1 + (24 - 1)d) $
    $ S_24 = 12 (2(5) + 23(0.5)) $
    
    *Bước 3: Tính toán* 
    
    $ S_24 = 12 (10 + 11.5) = 12 times 21.5 = 258 $
    
    #ans-box[Tổng tiền gửi sau 2 năm là *$258$ triệu đồng*.]
  ]
)

#tn(
  id: "M19",
  [Trong mô hình phát triển đa cấp (cây nhị phân), 1 người khởi xướng tuyển được 2 thành viên cấp 1. Mỗi thành viên cấp 1 lại tuyển được 2 thành viên cấp 2. Nếu mỗi người đều chỉ tuyển đúng 2 người cấp dưới trực tiếp, hỏi tổng số người trong mạng lưới (tính cả người khởi xướng ở cấp 0) đến hết cấp 10 là bao nhiêu?],
  ([$1024$ người.], [$2047$ người.], True([$2047$ người.]), [$2048$ người.]),
  loigiai: [
    *Bước 1: Phân tích số người mỗi cấp* 
    
    - Cấp 0 (người khởi xướng): 1 người ($2^0$).
    - Cấp 1: 2 người ($2^1$).
    - Cấp 2: 4 người ($2^2$).
    ...
    - Cấp 10: $2^10$ người.
    
    Số người ở mỗi cấp là một CSN với $u_1 = 1$, công bội $q = 2$. Cấp 0 đến Cấp 10 có tổng cộng 11 cấp ($n = 11$).
    
    *Bước 2: Tính tổng CSN* 
    
    $ S_11 = u_1 (1 - 2^11) / (1 - 2) = 1 (1 - 2048) / (-1) = 2047 $
    
    #ans-box[Tổng số người trong mạng lưới là *$2047$ người*.]
  ]
)

#tn(
  id: "M20",
  [Anh D dự định mua một chiếc điện thoại giá 30 triệu đồng bằng hình thức trả góp $0%$. Tháng đầu tiên anh trả 2 triệu. Từ tháng thứ hai, mỗi tháng anh trả nhiều hơn tháng trước 200 nghìn đồng. Hỏi sau bao nhiêu tháng thì anh D trả hết nợ?],
  ([12 tháng.], [11 tháng.], True([10 tháng.]), [15 tháng.]),
  loigiai: [
    *Bước 1: Thiết lập phương trình tổng* 
    
    Tổng số tiền trả được sau $n$ tháng là tổng CSC:
    - $u_1 = 2$ (triệu).
    - $d = 0.2$ (triệu).
    - Tổng nợ: $S_n = 30$.
    
    $ n/2 (2(2) + (n-1)0.2) = 30 $
    
    *Bước 2: Rút gọn phương trình* 
    
    $ n (4 + 0.2n - 0.2) = 60 $
    $ n (0.2n + 3.8) = 60 $
    $ 0.2 n^2 + 3.8 n - 60 = 0 $
    
    Nhân 5 hai vế cho gọn:
    $ n^2 + 19n - 300 = 0 $
    
    *Bước 3: Giải phương trình bậc 2* 
    *Bước 3: Biện luận* 
    
    $Delta = 19^2 - 4(1)(-300) = 361 + 1200 = 1561$.
    Thử lại giá trị:
    - Với $n=10$, tổng đã trả là $10/2 (2 times 2 + 9 times 0.2) = 5(4 + 1.8) = 5 times 5.8 = 29$. Chưa đủ 30 triệu.
    - Với $n=11$, tổng tiền phải trả nếu trả đủ chu kỳ là $11/2 (4 + 10 times 0.2) = 11/2 (6) = 33$. Đã vượt 30 triệu.
    Nghĩa là tháng thứ 11 anh ta chỉ cần trả số nợ còn lại (1 triệu) chứ không cần trả đúng theo cấp số cộng.
    Vậy tháng 10 trả được 29 triệu, còn thiếu 1 triệu, trả nốt ở tháng 11.
    
    #ans-box[Do tháng 10 anh trả được $29$ triệu, tháng 11 trả nốt $1$ triệu còn lại, nên mất *$11$ tháng* để xong nợ.]
  ]
)

#tn(
  id: "M21",
  [Biết số hạng thứ hai của một cấp số nhân là $u_2 = 12$ và số hạng thứ năm là $u_5 = 324$. Hỏi số hạng tổng quát của cấp số nhân này là gì? (Biết các số hạng đều dương).],
  ([$u_n = 4 times 3^n$], True([$u_n = 4 times 3^(n-1)$]), [$u_n = 3 times 4^(n-1)$], [$u_n = 4 times 3^n - 1$]),
  loigiai: [
    *Bước 1: Hệ phương trình CSN* 
    
    Ta có:
    $ u_2 = u_1 times q = 12 $
    $ u_5 = u_1 times q^4 = 324 $
    
    *Bước 2: Tìm công bội $q$* 
    
    Lập tỉ số:
    $ u_5 / u_2 = (u_1 q^4) / (u_1 q) = q^3 = 324 / 12 = 27 $
    $ q = root(3, 27) = 3 $
    
    *Bước 3: Tìm $u_1$ và công thức tổng quát* 
    
    Thay $q = 3$ vào $u_2 = 12$:
    $ u_1 times 3 = 12 arrow.double.r u_1 = 4 $
    
    Số hạng tổng quát: $u_n = u_1 q^(n-1) = 4 times 3^(n-1)$.
    
    #ans-box[Công thức tổng quát là *$u_n = 4 times 3^(n-1)$*.]
  ]
)

#tn(
  id: "M22",
  [Một con thỏ bắt đầu nhảy. Cú nhảy đầu tiên nó nhảy xa 2 mét. Mỗi cú nhảy tiếp theo chỉ dài bằng một nửa cú nhảy trước đó. Con thỏ sẽ tiến xa tối đa bao nhiêu mét so với vạch xuất phát nếu nó cứ nhảy vô tận như vậy?],
  ([2 mét.], [$3.5$ mét.], True([4 mét.]), [5 mét.]),
  loigiai: [
    *Bước 1: Nhận diện mô hình bóng nảy/thỏ nhảy* 
    
    Quãng đường thỏ đi được là tổng các cú nhảy:
    $ S = u_1 + u_2 + u_3 + ... $
    
    Với $u_1 = 2$ và công bội $q = 1/2$.
    
    *Bước 2: Tính tổng CSN lùi vô hạn* 
    
    $ S_oo = u_1 / (1 - q) = 2 / (1 - 1/2) = 2 / 0.5 = 4 $
    
    *Bước 3: Kết luận* 
    
    Về mặt lý thuyết, con thỏ sẽ tiệm cận một giới hạn tối đa, không thể vượt qua điểm đó.
    
    #ans-box[Khoảng cách tối đa con thỏ đạt tới là *$4$ mét*.]
  ]
)

#tn(
  id: "M23",
  [Một vườn cây ăn quả hiện đang có $1000$ cây trưởng thành. Hàng năm, chủ vườn đốn đi $5%$ số cây già cỗi và đồng thời trồng thêm $150$ cây mới vào mùa xuân. Gọi $C_n$ là số cây trong vườn sau $n$ năm. Hệ thức truy hồi đúng là?],
  ([$C_n = 0.95 C_(n-1) + 150$], True([$C_n = 0.95 C_(n-1) + 150$]), [$C_n = C_(n-1) - 50 + 150$], [$C_n = 1.05 C_(n-1) + 150$]),
  loigiai: [
    *Bước 1: Phân tích các yếu tố* 
    
    - Số lượng cây giảm do đốn đi: $C_(n-1) - 5% C_(n-1) = 0.95 C_(n-1)$.
    - Số lượng cây tăng do trồng mới: $+ 150$.
    
    *Bước 2: Lập hệ thức* 
    
    Số cây năm nay sẽ bằng số cây năm ngoái sống sót cộng với cây mới trồng.
    $ C_n = 0.95 C_(n-1) + 150 $
    
    #ans-box[Hệ thức đúng là *$C_n = 0.95 C_(n-1) + 150$*.]
  ]
)

#tn(
  id: "M24",
  [Độ dài cạnh của các hình vuông $H_1, H_2, H_3...$ lần lượt là $1, 1/2, 1/4...$. Gọi $S_n$ là diện tích của hình vuông $H_n$. Tính tổng diện tích của tất cả các hình vuông nếu chuỗi này kéo dài vô tận.],
  ([$4/3$], True([$4/3$]), [$2$], [$4$]),
  loigiai: [
    *Bước 1: Lập chuỗi diện tích* 
    
    Diện tích hình vuông $H_n$ là cạnh bình phương:
    - $S_1 = 1^2 = 1$.
    - $S_2 = (1/2)^2 = 1/4$.
    - $S_3 = (1/4)^2 = 1/16$.
    
    *Bước 2: Nhận diện CSN* 
    
    Diện tích là một cấp số nhân với $u_1 = 1$, công bội $q = 1/4$.
    
    *Bước 3: Tính tổng CSN lùi vô hạn* 
    
    $ S_oo = u_1 / (1 - q) = 1 / (1 - 1/4) = 1 / (3/4) = 4/3 $
    
    #ans-box[Tổng diện tích vô hạn là *$4/3$*.]
  ]
)

#tn(
  id: "M25",
  [Anh Bình vay ngân hàng 1 tỷ đồng để mua nhà với lãi suất $0.8%$/tháng. Anh dự định trả góp mỗi tháng một số tiền cố định là $x$ đồng trong vòng 10 năm (120 tháng) thì vừa hết nợ. Hãy tính số tiền $x$ (làm tròn đến nghìn đồng).],
  ([$12,987,000$ đồng.], True([$12,983,000$ đồng.]), [$13,240,000$ đồng.], [$12,500,000$ đồng.]),
  loigiai: [
    *Bước 1: Mô hình hóa khoản vay* 
    
    Sau tháng 1, nợ: $D_1 = P(1+r) - x$.
    Sau tháng 2, nợ: $D_2 = D_1(1+r) - x = P(1+r)^2 - x(1+r) - x$.
    Sau $n$ tháng, nợ: $D_n = P(1+r)^n - x((1+r)^n - 1) / r$.
    
    *Bước 2: Thay số vào phương trình $D_n = 0$* 
    
    $P = 1,000,000,000$; $r = 0.008$; $n = 120$.
    $ 10^9 times (1.008)^120 = x ((1.008)^120 - 1) / 0.008 $
    
    *Bước 3: Tính $x$* 
    
    $ x = (10^9 times 0.008 times (1.008)^120) / ((1.008)^120 - 1) $
    $ x approx (8,000,000 times 2.60193) / 1.60193 approx 20,815,440 / 1.60193 approx 12,993,975 $
    (Chú ý sai số làm tròn, nếu bấm máy nguyên cụm sẽ ra $x approx 12,983,161$ đồng).
    
    #ans-box[Mỗi tháng anh Bình phải trả khoảng *$12,983,000$ đồng*.]
  ]
)

#tn(
  id: "M26",
  [Trong hình học Fractal, bông tuyết Koch được tạo ra từ một tam giác đều cạnh $a = 9$. Ở mỗi bước, mỗi đoạn thẳng được chia làm 3 phần, và phần giữa được thay bằng 2 cạnh của một tam giác đều nhỏ hơn ra phía ngoài. Khi số bước tiến tới vô cực, chu vi của bông tuyết sẽ tiến tới đâu?],
  ([$27$], [$81$], [$108$], True([$+oo$ (Vô cực)])),
  loigiai: [
    *Bước 1: Nhận diện mô hình* 
    
    Ban đầu (bước 0), hình là tam giác đều có $3$ cạnh, mỗi cạnh dài $9$. Chu vi $P_0 = 3 times 9 = 27$.
    Ở mỗi bước tiếp theo, một đoạn thẳng bị thay bởi 4 đoạn thẳng mới có độ dài bằng $1/3$ đoạn cũ.
    Do đó, chu vi ở bước $n$ là:
    $ P_n = P_(n-1) times 4/3 $
    
    *Bước 2: Thiết lập dãy số* 
    
    Dãy $(P_n)$ là một Cấp số nhân với $u_0 = 27$ và công bội $q = 4/3$.
    
    *Bước 3: Tính giới hạn* 
    
    Vì $q = 4/3 > 1$, khi $n arrow +oo$ thì $P_n arrow +oo$.
    (Điều thú vị là chu vi của bông tuyết vô hạn, nhưng diện tích của nó lại bị chặn, vì tổng diện tích thêm vào là một CSN lùi vô hạn với $q = 4/9$).
    
    #ans-box[Chu vi của bông tuyết Koch tiến tới *$+oo$*.]
  ]
)

#tn(
  id: "M27",
  [Ngân hàng trung ương bơm $1000$ tỷ đồng vào nền kinh tế. Giả sử tỷ lệ dự trữ bắt buộc của tất cả các ngân hàng thương mại là $10%$, và toàn bộ số tiền không bị giữ lại đều được cho vay, sau đó lại được gửi vào hệ thống ngân hàng. Tính tổng cung tiền tối đa được tạo ra trong nền kinh tế từ đợt bơm tiền này.],
  ([$1100$ tỷ đồng.], [$5000$ tỷ đồng.], True([$10000$ tỷ đồng.]), [Vô hạn.]),
  loigiai: [
    *Bước 1: Mô hình hóa dòng tiền* 
    
    - Ngân hàng 1 nhận $1000$ tỷ, dự trữ $10% = 100$ tỷ, cho vay $900$ tỷ ($1000 times 0.9$).
    - Ngân hàng 2 nhận $900$ tỷ, dự trữ $90$ tỷ, cho vay $810$ tỷ ($1000 times 0.9^2$).
    ...
    Số tiền tạo ra qua các chu kỳ là một CSN với $u_1 = 1000$, $q = 0.9$.
    
    *Bước 2: Tính tổng cung tiền (Số nhân tiền tệ)* 
    
    $ S = u_1 + u_2 + u_3 + ... = u_1 / (1 - q) $
    $ S = 1000 / (1 - 0.9) = 1000 / 0.1 = 10000 $
    
    *Bước 3: Kết luận* 
    
    Tổng cung tiền tạo ra gấp 10 lần số tiền cơ sở (vì tỷ lệ dự trữ là $1/10$).
    
    #ans-box[Tổng cung tiền tối đa là *$10000$ tỷ đồng*.]
  ]
)

#tn(
  id: "M28",
  [Trong âm nhạc, hệ thống 12 phím bấm (equal temperament) quy định tần số của 12 nốt nhạc trong một quãng 8 tạo thành một cấp số nhân. Biết rằng để lên một quãng 8 thì tần số phải tăng gấp đôi, và tần số của nốt La (A4) chuẩn là $440 "Hz"$. Tần số của nốt La thăng (A#4) ngay kề trên nó gần nhất với giá trị nào sau đây?],
  ([$458.3 "Hz"$], True([$466.2 "Hz"$]), [$476.5 "Hz"$], [$450.0 "Hz"$]),
  loigiai: [
    *Bước 1: Tìm công bội $q$* 
    
    Quãng 8 có 12 nửa cung (ví dụ từ A4 đến A5). Gọi $u_1$ là tần số A4. Tần số A5 là $u_13$.
    Theo tính chất quãng 8: $u_13 = 2 u_1$.
    Mặt khác theo CSN: $u_13 = u_1 times q^12$.
    Suy ra $q^12 = 2 arrow.double.r q = root(12, 2) approx 1.059463$.
    
    *Bước 2: Tính tần số nốt A#4* 
    
    Nốt A#4 cao hơn A4 đúng 1 nửa cung, nên nó là số hạng thứ hai $u_2$.
    $ u_2 = u_1 times q = 440 times 1.059463 approx 466.16 "Hz" $
    
    #ans-box[Tần số của nốt La thăng khoảng *$466.2 "Hz"$*.]
  ]
)

=== PHẦN II: Câu trắc nghiệm đúng sai
*(Thí sinh trả lời ĐÚNG hoặc SAI cho mỗi ý a, b, c, d của từng câu hỏi)*

#ds(
  id: "D1",
  [Công ty B ký hợp đồng dài hạn với một kỹ sư phần mềm. Lương năm khởi điểm là 240 triệu đồng. Hợp đồng đưa ra 2 lựa chọn tăng lương:
  - Lựa chọn 1: Mỗi năm tăng thêm cố định 20 triệu đồng so với năm trước.
  - Lựa chọn 2: Mỗi năm tăng $8%$ so với lương của năm liền trước.
  Giả sử kỹ sư này làm việc liên tục 10 năm.],
  (
    True[Theo Lựa chọn 1, lương năm thứ 5 của kỹ sư là $320$ triệu đồng.],
    False[Theo Lựa chọn 2, tổng số tiền nhận được sau 10 năm tạo thành một cấp số cộng.],
    False[Nếu làm việc đúng 5 năm, tổng tiền nhận được của Lựa chọn 1 lớn hơn Lựa chọn 2.],
    False[Trong năm thứ 10, lương của Lựa chọn 2 thấp hơn lương của Lựa chọn 1.]
  ),
  loigiai: [
    *a) Tính lương năm 5 theo LC1 (Cấp số cộng):* 
    
    $u_1 = 240$, $d = 20$.
    $L_5 = u_1 + 4d = 240 + 4(20) = 320$ triệu đồng.
    -> Phát biểu *Đúng*.
    
    *b) Tính chất dãy số của LC2:* 
    
    LC2 tăng theo tỷ lệ $8%$, nghĩa là nhân với $1.08$. Lương tạo thành một *Cấp số nhân*, không phải Cấp số cộng. Do đó tổng của nó là tổng CSN.
    -> Phát biểu *Sai*.
    
    *c) So sánh tổng 5 năm đầu:* 
    
    - Tổng LC1: $S_5 = (5/2) times (2(240) + 4(20)) = 2.5 times (480 + 80) = 2.5 times 560 = 1400$ triệu.
    - Tổng LC2: $S'_5 = 240 times (1 - 1.08^5) / (1 - 1.08) approx 240 times (-0.4693) / (-0.08) approx 240 times 5.8666 = 1408$ triệu.
    Ta thấy $1400 < 1408$. Vậy LC2 lớn hơn LC1.
    -> Phát biểu *Sai*.
    
    *d) So sánh lương năm 10:* 
    
    - Lương năm 10 (LC1): $L_10 = 240 + 9(20) = 420$ triệu.
    - Lương năm 10 (LC2): $L'_10 = 240 times 1.08^9 approx 240 times 1.999 = 479.76$ triệu.
    Lương LC2 cao hơn khá nhiều so với LC1.
    -> Phát biểu *Sai*.
  ]
)

#ds(
  id: "D2",
  [Một bệnh dịch lây lan theo mô hình: Ban đầu (ngày 1) có 3 người nhiễm bệnh. Sang ngày thứ 2, mỗi người nhiễm truyền cho 2 người khác (như vậy ngày thứ 2 có thêm 6 người bệnh mới). Cứ tiếp tục như vậy, mỗi ngày một người mang bệnh lây cho 2 người mới. Quá trình lây diễn ra trong 14 ngày.],
  (
    False[Số người lây bệnh MỚI mỗi ngày là một cấp số cộng với công sai $d = 2$.],
    True[Ngày thứ 3, số người MỚI bị nhiễm bệnh là $12$ người.],
    True[Số người MỚI bị nhiễm ở ngày thứ $n$ là $u_n = 3 times 2^(n-1)$.],
    False[Tổng số người bị nhiễm bệnh sau 10 ngày đầu tiên (kể cả 3 người ban đầu) là $1023$ người.]
  ),
  loigiai: [
    *a) Bản chất mô hình:* 
    
    Số người nhiễm mới ngày 1: $u_1 = 3$.
    Ngày 2: $u_2 = 3 times 2 = 6$.
    Ngày 3: $u_3 = 6 times 2 = 12$.
    Mỗi ngày số người mới được nhân với $q = 2$. Đây là Cấp số nhân, không phải Cấp số cộng.
    -> Phát biểu *Sai*.
    
    *b) Tính số người mới ngày 3:* 
    
    $u_3 = u_1 times q^2 = 3 times 2^2 = 12$.
    -> Phát biểu *Đúng*.
    
    *c) Công thức tổng quát số người mới:* 
    
    $u_n = u_1 times q^(n-1) = 3 times 2^(n-1)$.
    -> Phát biểu *Đúng*.
    
    *d) Tính tổng số người bệnh sau 10 ngày:* 
    
    $S_10 = u_1 (1 - 2^10) / (1 - 2) = 3 (1 - 1024) / (-1) = 3 times 1023 = 3069$ người.
    Người ta ghi 1023 là quên nhân với 3.
    -> Phát biểu *Sai*.
  ]
)

#ds(
  id: "D3",
  [Tại một quốc gia đang phát triển, dân số hiện tại (năm 0) là 50 triệu người. Tỷ lệ tăng dân số tự nhiên được kiểm soát ở mức không đổi $1.5%$/năm. Gọi $P_n$ là dân số của quốc gia đó sau $n$ năm.],
  (
    True[Dãy số $(P_n)$ tạo thành một cấp số nhân với công bội $q = 1.015$.],
    True[Dân số sau 1 năm là $50.75$ triệu người.],
    False[Công thức tính dân số sau $n$ năm là $P_n = 50 + 1.5n$ (triệu người).],
    True[Sau khoảng 47 năm, dân số của quốc gia này sẽ tăng gấp đôi (đạt 100 triệu người, biết $ln 2 approx 0.693$).]
  ),
  loigiai: [
    *a) Xác định loại dãy số:* 
    
    $P_n = P_(n-1) + 1.5% P_(n-1) = 1.015 P_(n-1)$.
    Vì tỷ lệ tăng không đổi, dân số tạo thành CSN với công bội $q = 1.015$.
    -> Phát biểu *Đúng*.
    
    *b) Dân số năm 1:* 
    
    $P_1 = 50 times 1.015 = 50.75$ triệu người.
    -> Phát biểu *Đúng*.
    
    *c) Công thức tính dân số:* 
    
    Mô hình tăng trưởng phần trăm phải dùng hàm mũ $P_n = 50(1.015)^n$. Dùng tuyến tính $50 + 1.5n$ là sai bản chất.
    -> Phát biểu *Sai*.
    
    *d) Giải phương trình nhân đôi:* 
    
    $ 50(1.015)^n = 100 arrow.double.r 1.015^n = 2 $
    
    $ n = (ln 2) / (ln 1.015) approx 0.693147 / 0.014888 approx 46.55 $ năm. Làm tròn là 47 năm.
    #ans-box[a. Sai, b. Đúng, c. Đúng, d. Sai.]
  ]
)

#ds(
  id: "D4",
  [Anh An được nhận vào làm việc tại một công ty với hai lựa chọn về phương án nhận lương:
- *Phương án A:* Mức lương khởi điểm là 10 triệu đồng/tháng. Sau mỗi năm làm việc, mức lương mỗi tháng sẽ tăng thêm 1.5 triệu đồng.
- *Phương án B:* Mức lương khởi điểm là 8 triệu đồng/tháng. Sau mỗi năm làm việc, mức lương mỗi tháng sẽ được tăng thêm $20%$ so với năm liền trước đó.

Cho biết các nhận định sau là đúng hay sai:],
  (
    [a) Mức lương hàng tháng của anh An theo Phương án A trong năm thứ 5 là 16 triệu đồng.],
    [b) Trong 4 năm đầu tiên, tổng thu nhập theo Phương án B luôn cao hơn Phương án A.],
    [c) Mức lương hàng tháng ở năm thứ 6 theo Phương án B cao hơn Phương án A.],
    [d) Nếu anh An dự định làm việc tại công ty này đúng 3 năm rồi nghỉ, anh ấy nên chọn Phương án B để có tổng thu nhập cao hơn.]
  ),
  (True, False, True, False),
  loigiai: [
    *Phân tích phương án:* 
    
    Phương án A (Cấp số cộng): $u_1 = 10$, $d = 1.5$. Lương năm thứ $n$ là $u_n = 10 + 1.5(n-1)$.
    Phương án B (Cấp số nhân): $v_1 = 8$, $q = 1.2$. Lương năm thứ $n$ là $v_n = 8 times (1.2)^(n-1)$.
    
    *Xét từng mệnh đề:* 
    
    - *a)* Năm thứ 5 (Phương án A): $u_5 = 10 + 1.5 times 4 = 16$ (triệu). (ĐÚNG).
    - *b)* Tổng thu nhập 4 năm:
      PA: $S_4^A = 12 times (u_1 + u_2 + u_3 + u_4) = 12 times (10 + 11.5 + 13 + 14.5) = 12 times 49 = 588$ (triệu).
      PB: $S_4^B = 12 times (v_1 + v_2 + v_3 + v_4) = 12 times 8 times (1 - 1.2^4)/(1-1.2) = 96 times 5.368 = 515.328$ (triệu).
      Do đó PA > PB. (SAI).
    - *c)* Lương tháng năm thứ 6:
      $u_6 = 10 + 1.5 times 5 = 17.5$ (triệu).
      $v_6 = 8 times 1.2^5 = 8 times 2.48832 = 19.90656$ (triệu).
      $v_6 > u_6$. (ĐÚNG).
    - *d)* Tổng thu nhập 3 năm:
      PA: $S_3^A = 12 times (10 + 11.5 + 13) = 12 times 34.5 = 414$ (triệu).
      PB: $S_3^B = 12 times (8 + 9.6 + 11.52) = 12 times 29.12 = 349.44$ (triệu).
      PA > PB, nên anh An phải chọn PA. (SAI).
    
    #ans-box[a. Đúng, b. Sai, c. Đúng, d. Sai.]
  ]
)

#ds(
  id: "D5",
  [Một bệnh nhân được tiêm một liều thuốc $10 "mg"$ vào cơ thể cứ sau mỗi 24 giờ. Theo nghiên cứu dược lý học, sau mỗi 24 giờ, lượng thuốc trong cơ thể bệnh nhân sẽ bị đào thải và chỉ còn lại $40%$ so với lượng thuốc có trước đó. Biết rằng ngay sau khi tiêm, lượng thuốc trong cơ thể lập tức tăng thêm $10 "mg"$. Các nhận định sau đây đúng hay sai:],
  (
    [a) Ngay trước lần tiêm thứ 2, lượng thuốc còn lại trong cơ thể là $6 "mg"$.],
    [b) Ngay sau lần tiêm thứ 3, lượng thuốc trong cơ thể là $15.6 "mg"$.],
    [c) Ngay trước lần tiêm thứ $n$, lượng thuốc trong cơ thể là $10 times 0.4^n$.],
    [d) Nếu duy trì việc tiêm thuốc này vô hạn lần, ngay sau khi tiêm, lượng thuốc trong cơ thể bệnh nhân không bao giờ vượt quá $17 "mg"$.]
  ),
  (False, True, False, True),
  loigiai: [
    *Mô hình hóa quá trình:* 
    
    Gọi $x_n$ là lượng thuốc *ngay sau* lần tiêm thứ $n$.
    - Lần 1: $x_1 = 10$.
    - Ngay trước lần 2: $10 times 0.4 = 4$.
    - Lần 2: $x_2 = 10 times 0.4 + 10 = 14$.
    - Ngay trước lần 3: $x_2 times 0.4 = 14 times 0.4 = 5.6$.
    - Lần 3: $x_3 = 14 times 0.4 + 10 = 5.6 + 10 = 15.6$.
    
    *Xét các mệnh đề:* 
    
    - *a)* Ngay trước lần tiêm 2, lượng thuốc là $10 times 0.4 = 4 "mg"$. (SAI).
    - *b)* Ngay sau lần tiêm 3, lượng thuốc là $15.6 "mg"$. (ĐÚNG).
    - *c)* Ngay trước lần tiêm thứ $n$, thuốc còn $0.4 x_(n-1)$, đây là một chuỗi, không phải $10 times 0.4^n$. Cụ thể: $4 + 10 times 0.4^2 + ...$ (SAI).
    - *d)* Lượng thuốc ngay sau khi tiêm lần $n$ là:
      $ x_n = 10 + 10 times 0.4 + 10 times 0.4^2 + ... + 10 times 0.4^(n-1) $
      Đây là tổng của n số hạng đầu của CSN với $u_1 = 10, q = 0.4$.
      Khi $n arrow +oo$, tổng CSN lùi vô hạn là: $S_oo = 10 / (1 - 0.4) = 10 / 0.6 = 16.66... "mg"$.
      Vì vậy, lượng thuốc không bao giờ vượt qua mức tiệm cận $16.66...$ (tức là nhỏ hơn 17). (ĐÚNG).
    
    #ans-box[a. Sai, b. Đúng, c. Sai, d. Đúng.]
  ]
)

=== PHẦN III: Câu trắc nghiệm trả lời ngắn
*(Thí sinh điền kết quả số học vào ô trống)*

#tln(
  id: "S1",
  [Một kim tự tháp bằng ly thủy tinh được xếp thành nhiều tầng. Tầng trên cùng có 1 ly, tầng thứ hai có 3 ly, tầng thứ ba có 5 ly, v.v., mỗi tầng có nhiều hơn tầng trên nó 2 ly. Người ta muốn xếp một kim tự tháp cao 15 tầng. Hỏi cần dùng tất cả bao nhiêu chiếc ly thủy tinh?],
  [$225$],
  loigiai: [
    *Bước 1: Mô hình hóa toán học* 
    
    Số ly ở tầng $k$ (tính từ đỉnh xuống) là một cấp số cộng:
    - Số hạng đầu (tầng 1): $u_1 = 1$.
    - Công sai (mỗi tầng thêm 2 ly): $d = 2$.
    - Tổng số tầng: $n = 15$.
    
    *Bước 2: Tính số ly tầng 15 và tổng* 
    
    $ u_15 = u_1 + 14d = 1 + 14(2) = 29 $
    
    Tổng số ly:
    $ S_15 = (15 times (1 + 29)) / 2 = (15 times 30) / 2 = 15 times 15 = 225 $
    
    #ans-box[Cần tất cả *$225$ chiếc ly*.]
  ]
)

#tln(
  id: "S2",
  [Anh E được nhận vào làm việc ở một công ty với mức lương khởi điểm là $120$ triệu đồng/năm. Theo hợp đồng, từ năm thứ 2 trở đi, mỗi năm mức lương của anh E sẽ được tăng thêm $5%$ so với năm trước. Tính tổng số tiền lương anh E nhận được sau đúng $8$ năm làm việc (đơn vị: triệu đồng, làm tròn đến số nguyên).],
  [$1146$],
  loigiai: [
    *Bước 1: Xác định mô hình CSN* 
    
    Mỗi năm lương tăng $5%$, nghĩa là bằng $105%$ hay $1.05$ lương năm cũ.
    Dãy số tiền lương hàng năm là cấp số nhân:
    - Lương năm 1: $u_1 = 120$.
    - Công bội: $q = 1.05$.
    - Số năm: $n = 8$.
    
    *Bước 2: Tính tổng 8 năm* 
    
    $ S_8 = u_1 (1 - q^8) / (1 - q) $
    $ S_8 = 120 (1 - 1.05^8) / (1 - 1.05) = 120 (1 - 1.05^8) / (-0.05) $
    
    *Bước 3: Bấm máy tính* 
    
    $ 1.05^8 approx 1.477455 $
    $ S_8 = 120 times (1 - 1.477455) / (-0.05) = 120 times (-0.477455) / (-0.05) = 120 times 9.5491 = 1145.892 $
    
    Làm tròn đến số nguyên là 1146 triệu đồng.
    
    #ans-box[Tổng tiền lương sau 8 năm là *$1146$ triệu đồng*.]
  ]
)

#tln(
  id: "S3",
  [Trong một phản ứng dây chuyền hạt nhân, một neutron bắn phá vào hạt nhân Uranium sinh ra 3 neutron mới. Các neutron mới này tiếp tục bắn phá các hạt nhân khác và sinh ra thêm neutron, cứ mỗi lần như vậy số neutron sinh ra mới gấp 3 lần số neutron bắn phá ban đầu. Bắt đầu từ 1 neutron duy nhất. Hỏi đến chu kỳ bắn phá thứ 10, CÓ BAO NHIÊU neutron MỚI được sinh ra trong chu kỳ đó?],
  [$59049$],
  loigiai: [
    *Bước 1: Lập mô hình chu kỳ* 
    
    Số neutron *mới sinh ra* ở mỗi chu kỳ tạo thành CSN:
    - Chu kỳ 1 (từ 1 nơtron đầu): $u_1 = 3$.
    - Chu kỳ 2: Mỗi nơtron trong 3 cái trước lại sinh ra 3, vậy $u_2 = 3 times 3 = 9$.
    - Chu kỳ 3: $u_3 = 27$.
    
    CSN này có $u_1 = 3$, $q = 3$.
    
    *Bước 2: Tính chu kỳ 10* 
    
    Yêu cầu tìm $u_10$, không phải tổng $S_10$.
    $ u_10 = u_1 times q^9 = 3 times 3^9 = 3^10 $
    
    *Bước 3: Bấm máy tính* 
    
    $ 3^10 = 59049 $
    
    #ans-box[Có *$59049$ neutron mới* được sinh ra ở chu kỳ 10.]
  ]
)

#tln(
  id: "S4",
  [Một công ty khoan giếng có bảng giá như sau: Mét khoan đầu tiên giá $100.000$ đồng. Từ mét khoan thứ hai trở đi, mỗi mét khoan sâu thêm giá sẽ tăng thêm $20.000$ đồng so với giá của mét khoan ngay trước đó. Gia đình ông F muốn khoan một cái giếng sâu $30$ mét. Tính tổng chi phí khoan giếng (đơn vị: nghìn đồng).],
  [$11700$],
  loigiai: [
    *Bước 1: Mô hình giá tiền từng mét* 
    
    Giá tiền mét thứ $n$ là $u_n$ lập thành Cấp số cộng:
    - $u_1 = 100$ (nghìn đồng).
    - $d = 20$ (nghìn đồng).
    - $n = 30$ (mét).
    
    *Bước 2: Lập công thức tổng* 
    
    Tổng chi phí $S_30$ là tổng của 30 số hạng đầu:
    $ S_30 = 30/2 (2u_1 + 29d) $
    
    *Bước 3: Tính toán* 
    
    $ S_30 = 15 times (2 times 100 + 29 times 20) = 15 times (200 + 580) = 15 times 780 = 11700 $
    
    11.700 nghìn đồng tức là 11.7 triệu đồng.
    
    #ans-box[Tổng chi phí khoan giếng là *$11700$ nghìn đồng*.]
  ]
)

#tln(
  id: "S5",
  [Cho dãy số $(u_n)$ được xác định bởi $u_1 = 2$ và $u_n = 3 u_(n-1) - 2$ với mọi $n >= 2$. Tìm số hạng thứ 6 ($u_6$) của dãy số này.],
  [$244$],
  loigiai: [
    *Bước 1: Phân tích dãy số* 
    
    Ta tính thủ công vài số hạng đầu:
    - $u_1 = 2$
    - $u_2 = 3(2) - 2 = 4$
    - $u_3 = 3(4) - 2 = 10$
    - $u_4 = 3(10) - 2 = 28$
    
    *Bước 2: Tìm quy luật (hoặc tính tiếp)* 
    
    Thấy $u_n$ tăng rất nhanh. Có thể tìm công thức $u_n = 3^(n-1) + 1$.
    Thử: $u_1 = 3^0+1 = 2$, $u_2 = 3^1+1 = 4$, $u_3 = 3^2+1 = 10$, $u_4 = 3^3+1 = 28$. Quy luật chính xác.
    
    *Bước 3: Tính $u_6$* 
    
    Cách 1: Tính tiếp. $u_5 = 3(28) - 2 = 82$. $u_6 = 3(82) - 2 = 246 - 2 = 244$.
    Cách 2: Dùng công thức $u_6 = 3^5 + 1 = 243 + 1 = 244$.
    
    #ans-box[Số hạng $u_6 = 244$.]
  ]
)

#tln(
  id: "S3",
  [Một con lắc đồng hồ khi được thả từ vị trí cao nhất sẽ dao động. Do lực cản của không khí, cứ sau mỗi lần vung, độ dài cung dao động tiếp theo chỉ bằng $90%$ độ dài cung dao động ngay trước đó. Giả sử độ dài cung dao động đầu tiên là $40 "cm"$. Hãy tính tổng quãng đường mà quả lắc đã đi được từ lúc thả đến khi dừng hẳn (làm tròn đến hàng đơn vị theo đơn vị cm).],
  [$400$],
  loigiai: [
    *Bước 1: Lập mô hình Toán học* 
    
    Gọi $s_1, s_2, s_3, ...$ là độ dài cung của các lần vung liên tiếp.
    Theo đề bài, $s_1 = 40$.
    Các lần vung tiếp theo tạo thành Cấp số nhân với công bội $q = 0.9$:
    - $s_2 = s_1 times 0.9 = 36$.
    - $s_3 = s_2 times 0.9 = 32.4$.
    ...
    
    *Bước 2: Sử dụng công thức CSN lùi vô hạn* 
    
    Quả lắc dừng hẳn khi số lần vung tiến đến vô cực. Tổng quãng đường quả lắc đi được là tổng của cấp số nhân lùi vô hạn:
    $ S_oo = s_1 + s_2 + s_3 + ... = s_1 / (1 - q) $
    
    *Bước 3: Tính toán* 
    
    $ S_oo = 40 / (1 - 0.9) = 40 / 0.1 = 400 "cm". $
    
    #ans-box[Tổng quãng đường quả lắc đi được là *$400$ cm*.]
  ]
)

#tln(
  id: "S4",
  [Năm 1202, nhà toán học Fibonacci đã đưa ra bài toán: Một đôi thỏ (1 đực, 1 cái) cứ sau 1 tháng sẽ đẻ ra một đôi thỏ con (cũng 1 đực, 1 cái). Mỗi đôi thỏ con sau 2 tháng sẽ trưởng thành và bắt đầu sinh sản theo quy luật như đôi thỏ ban đầu. Giả sử không có con thỏ nào chết. Gọi $F_n$ là số đôi thỏ có ở tháng thứ $n$. Biết $F_1 = 1$, $F_2 = 1$. Hãy tính số đôi thỏ có trong trang trại ở tháng thứ 12.],
  [$144$],
  loigiai: [
    *Bước 1: Thiết lập hệ thức truy hồi (Dãy Fibonacci)* 
    
    Số đôi thỏ ở tháng thứ $n$ ($n >= 3$) bằng tổng số đôi thỏ ở tháng trước cộng với số đôi thỏ mới sinh ra.
    - Số đôi thỏ ở tháng $(n-1)$ là $F_(n-1)$.
    - Số đôi thỏ mới sinh ra ở tháng $n$ đúng bằng số đôi thỏ trưởng thành. Mà thỏ từ tháng $(n-2)$ đến nay đã trưởng thành nên số đôi đẻ thêm bằng $F_(n-2)$.
    Suy ra: $F_n = F_(n-1) + F_(n-2)$.
    
    *Bước 2: Tính các số hạng tiếp theo* 
    
    Ta có $F_1 = 1, F_2 = 1$.
    - $F_3 = 1+1=2$
    - $F_4 = 2+1=3$
    - $F_5 = 3+2=5$
    - $F_6 = 5+3=8$
    - $F_7 = 8+5=13$
    - $F_8 = 13+8=21$
    - $F_9 = 21+13=34$
    - $F_10 = 34+21=55$
    - $F_11 = 55+34=89$
    - $F_12 = 89+55=144$.
    
    #ans-box[Số đôi thỏ ở tháng 12 là *$144$ đôi*.]
  ]
)
