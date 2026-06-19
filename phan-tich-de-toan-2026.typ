#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2.5cm),
  header: [
    #text(fill: rgb("4b5563"), size: 9pt)[_Phân tích Sư phạm: Cấu trúc & Định hướng đề thi Tốt nghiệp THPT môn Toán 2026_]
    #line(length: 100%, stroke: 0.5pt + rgb("e5e7eb"))
  ],
  footer: [
    #line(length: 100%, stroke: 0.5pt + rgb("e5e7eb"))
    #align(center)[#text(fill: rgb("4b5563"), size: 9pt)[Trang #context counter(page).display()]]
  ]
)

#set text(font: "Times New Roman", size: 11pt, fill: rgb("111827"), lang: "vi")
#set par(justify: true, leading: 0.75em, first-line-indent: 1.5em)

// --- Palette màu học thuật chuyên nghiệp ---
#let primary = rgb("1e3a8a")     // Navy Blue
#let secondary = rgb("0f766e")   // Teal
#let accent = rgb("b91c1c")      // Red
#let gray-bg = rgb("f8fafc")     // Slate 50
#let border-color = rgb("cbd5e1") // Slate 300

// --- Custom Headings ---
#show heading.where(level: 1): it => [
  #v(1.5em)
  #block(
    width: 100%,
    fill: gray-bg,
    stroke: (left: 4pt + primary),
    inset: (x: 10pt, y: 8pt),
    text(fill: primary, size: 13pt, weight: "bold")[#counter(heading).display() #it.body]
  )
  #v(0.5em)
]

#show heading.where(level: 2): it => [
  #v(1em)
  #text(fill: secondary, size: 12pt, weight: "bold")[
    #counter(heading).display() #it.body
  ]
  #v(0.4em)
]

#show heading.where(level: 3): it => [
  #v(0.8em)
  #text(fill: primary, size: 11pt, weight: "bold", style: "italic")[
    #it.body
  ]
  #v(0.3em)
]

// --- Hộp ghi chú sư phạm ---
#let note-box(title, body) = block(
  width: 100%,
  fill: gray-bg,
  stroke: (left: 3.5pt + secondary, rest: 0.5pt + border-color),
  inset: 12pt,
  radius: (right: 4pt),
)[
  #text(fill: secondary, weight: "bold", size: 11pt)[#title]
  #v(0.4em)
  #body
]

#let warning-box(title, body) = block(
  width: 100%,
  fill: rgb("fef2f2"),
  stroke: (left: 3.5pt + accent, rest: 0.5pt + rgb("fee2e2")),
  inset: 12pt,
  radius: (right: 4pt),
)[
  #text(fill: accent, weight: "bold", size: 11pt)[#title]
  #v(0.4em)
  #body
]

// --- Tiêu đề tài liệu ---
#align(center)[
  #text(size: 16pt, weight: "bold", fill: primary)[PHÂN TÍCH CHUYÊN MÔN DÀNH CHO HỌC SINH LỚP 12] \
  #v(0.5em)
  #text(size: 14pt, weight: "bold", fill: secondary)[GIẢI PHẪU CẤU TRÚC ĐỀ THI TỐT NGHIỆP THPT MÔN TOÁN 2026 \ THEO CHƯƠNG TRÌNH GDPT 2018 VÀ CHIẾN THUẬT PHÒNG THI]
  
  #v(1.5em)
  #text(size: 11pt, style: "normal")[
    *Biên soạn:* Tổ Chuyên môn Toán \
    *Đối tượng sử dụng:* Học sinh chuẩn bị bước vào Kỳ thi Tốt nghiệp THPT 2026 \
    *Tài liệu lưu hành:* Nội bộ học đường
  ]
]

#v(1.5em)

#block(
  width: 100%,
  fill: gray-bg,
  inset: 12pt,
  stroke: (left: 3pt + primary),
)[
  #text(weight: "bold")[Lời giới thiệu:] Kỳ thi Tốt nghiệp THPT năm 2026 là năm thứ hai chính thức áp dụng đề thi theo định dạng mới của Chương trình Giáo dục phổ thông (GDPT) 2018. Tài liệu này được biên soạn nhằm phân tích cấu trúc 3 phần thi, phân loại chi tiết các mảng kiến thức cốt lõi trong chương trình Toán 12 hiện hành, dự báo các bẫy điểm thường gặp và đề xuất chiến thuật phân bổ thời gian thực chiến giúp học sinh đạt kết quả tốt nhất.
]

= Bản chất cấu trúc 3 phần thi và Cách tính điểm của Bộ GD&ĐT

Đề thi gồm *22 câu hỏi* với tổng cộng *34 lệnh hỏi* (lệnh trả lời) làm trong thời gian *90 phút*. Cấu trúc này chia làm 3 phần với các mục tiêu đo lường khác nhau:

== 1. Phần I: Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu - 3.0 điểm)
- *Định dạng:* Chọn 1 đáp án đúng trong 4 phương án (A, B, C, D). Mỗi câu đúng được 0.25 điểm.
- *Mức độ nhận thức:* Nhận biết và Thông hiểu.
- *Định hướng:* Phần này tập trung kiểm tra kiến thức nền tảng của chương trình Toán lớp 12 (và một phần nhỏ lớp 11). Học sinh cần làm nhanh, chính xác để lấy trọn vẹn 3.0 điểm làm cơ sở.

== 2. Phần II: Câu hỏi trắc nghiệm Đúng/Sai (4 câu - 4.0 điểm)
- *Định dạng:* Mỗi câu hỏi lớn có 4 ý độc lập (a, b, c, d). Học sinh phải chọn Đúng hoặc Sai cho từng ý.
- *Mức độ nhận thức:* Thông hiểu và Vận dụng.
- *Quy tắc tính điểm phi tuyến tính:*
  - Đúng 1 ý trong một câu: được 0.1 điểm.
  - Đúng 2 ý trong một câu: được 0.25 điểm.
  - Đúng 3 ý trong một câu: được 0.5 điểm.
  - Đúng cả 4 ý trong một câu: được 1.0 điểm.
- *Phân tích sư phạm:* Định dạng này triệt tiêu hoàn toàn việc chọn bừa hoặc bấm máy tính loại trừ. Để lấy trọn vẹn 1.0 điểm của một câu hỏi lớn, học sinh phải giải quyết một chuỗi lập luận logic liên tục từ ý a đến ý d.

== 3. Phần III: Câu hỏi trắc nghiệm trả lời ngắn (6 câu - 3.0 điểm)
- *Định dạng:* Không có phương án sẵn. Học sinh tự giải quyết bài toán và tô kết quả dạng số nguyên hoặc số thập phân vào phiếu trả lời. Mỗi câu đúng được 0.5 điểm.
- *Mức độ nhận thức:* Vận dụng và Vận dụng cao.
- *Định hướng:* Đây là phần phân hóa mạnh nhất của đề thi. Học sinh phải tự lực làm bài hoàn toàn giống như thi tự luận trước đây nhưng chỉ điền kết quả cuối cùng.

#warning-box("Cảnh báo về bẫy điểm Phần II (Đúng/Sai)", [
  Cách tính điểm của Phần II cho thấy: nếu học sinh chỉ đúng 3 ý thì được 0.5 điểm, nhưng chỉ cần đúng thêm ý thứ 4 (thường là ý phân hóa cao) điểm số lập tức tăng gấp đôi lên 1.0 điểm. Do đó, các em không được nản chí bỏ cuộc ở các ý khó cuối cùng của Phần II. Học sinh cần kiên nhẫn lập luận để giải quyết trọn vẹn cả 4 ý nhằm tối ưu hóa điểm số.
])

= Phân tích chi tiết ma trận kiến thức theo Chương trình GDPT 2018

Đề thi Tốt nghiệp THPT môn Toán bám sát khung chương trình GDPT 2018 lớp 12, bao gồm 5 chương cốt lõi sau:

== 1. Ứng dụng đạo hàm để khảo sát và vẽ đồ thị hàm số (Chiếm khoảng 30 - 35%)
Đây là mảng kiến thức lớn nhất và xuất hiện ở cả 3 phần thi.
- *Trọng tâm kiến thức:*
  - Tính đơn điệu, cực trị, giá trị lớn nhất và nhỏ nhất của hàm số.
  - Các đường tiệm cận của đồ thị hàm số: Tiệm cận đứng, tiệm cận ngang và *tiệm cận xiên* (đây là phần kiến thức mới hoàn toàn của chương trình 2018).
  - Khảo sát các hàm số: Hàm bậc ba, hàm phân thức bậc nhất trên bậc nhất, và hàm phân thức bậc hai trên bậc nhất (kiến thức mới).
  - Bài toán tối ưu hóa thực tế giải bằng công cụ đạo hàm (tìm cực trị hàm chi phí, diện tích, thể tích vỏ hộp).

== 2. Nguyên hàm, tích phân và ứng dụng (Chiếm khoảng 20 - 25%)
- *Trọng tâm kiến thức:*
  - Các công thức nguyên hàm, tích phân cơ bản và tính chất của tích phân.
  - Ứng dụng tích phân: Tính diện tích hình phẳng giới hạn bởi các đường cong và tính thể tích vật thể tròn xoay quanh trục tọa độ.
  - Các bài toán ứng dụng thực tế: Tính tổng lượng tích lũy (doanh thu, quãng đường chuyển động của vật thể khi biết hàm tốc độ).

== 3. Vectơ và hệ tọa độ trong không gian Oxyz (Chiếm khoảng 25 - 30%)
- *Trọng tâm kiến thức:*
  - Toạ độ điểm, toạ độ vectơ và các phép toán vectơ trong không gian.
  - Phương trình mặt phẳng, phương trình đường thẳng, phương trình mặt cầu.
  - Các bài toán góc (giữa hai đường thẳng, đường thẳng và mặt phẳng, hai mặt phẳng) và khoảng cách (từ điểm đến mặt phẳng, khoảng cách giữa hai đường thẳng chéo nhau).
  - Ứng dụng tọa độ Oxyz để mô hình hóa không gian thực tế (định vị anten, radar, quỹ đạo bay).

== 4. Số đặc trưng đo mức độ phân tán của mẫu số liệu ghép nhóm (Chiếm khoảng 10 - 15%)
Đây là mảng kiến thức thống kê thực tế mới của chương trình 2018.
- *Trọng tâm kiến thức:*
  - Khoảng biến thiên và khoảng tứ phân vị của mẫu số liệu ghép nhóm.
  - Phương sai và độ lệch chuẩn của mẫu số liệu ghép nhóm.
  - *Ý nghĩa:* Đo lường độ đồng đều, độ phân tán của dữ liệu (điểm số, doanh thu, thời gian). Học sinh cần thuộc chính xác công thức nội suy các số đặc trưng này.

== 5. Xác suất có điều kiện (Chiếm khoảng 10 - 15%)
Mảng xác suất mới được đưa vào lớp 12 nhằm tiếp cận toán học ứng dụng hiện đại.
- *Trọng tâm kiến thức:*
  - Xác suất có điều kiện và công thức nhân xác suất.
  - Công thức xác suất toàn phần.
  - Công thức Bayes (dùng để cập nhật xác suất dựa trên thông tin mới).
  - *Ứng dụng:* Bài toán xét nghiệm y khoa, kiểm tra chất lượng sản phẩm của các nhà máy.

#align(center)[
  #table(
    columns: (2fr, 1.2fr, 2.5fr, 1fr),
    inset: 10pt,
    align: horizon,
    stroke: 0.5pt + border-color,
    fill: (x, y) => if y == 0 { primary } else if calc.rem(y, 2) == 0 { gray-bg } else { white },
    
    text(fill: white, weight: "bold")[Chương / Mảng kiến thức],
    text(fill: white, weight: "bold")[Phần I (Dễ)],
    text(fill: white, weight: "bold")[Phần II (Trung bình - Khó)],
    text(fill: white, weight: "bold")[Phần III (Vận dụng cao)],

    [*1. Hàm số & Đồ thị*],
    [Đọc BBT, cực trị, tiệm cận đứng/ngang.],
    [Biện luận tiệm cận xiên, đồ thị hàm bậc 2 trên bậc nhất, cực trị hàm ẩn.],
    [Bài toán tối ưu hóa thực tế (cực trị hình học hoặc kinh tế).],

    [*2. Nguyên hàm & Tích phân*],
    [Công thức cơ bản, tính chất tích phân.],
    [Tích phân hàm ẩn, diện tích hình phẳng lý thuyết.],
    [Thể tích vật thể tròn xoay thực tế, tính tổng lượng tích lũy.],

    [*3. Hệ toạ độ Oxyz*],
    [Tọa độ điểm, vectơ, phương trình cơ bản.],
    [Góc, khoảng cách, mặt cầu tương quan đường thẳng.],
    [Ứng dụng tọa độ Oxyz định vị vật thể chuyển động thực tế.],

    [*4. Thống kê ghép nhóm*],
    [Xác định nhóm chứa trung vị, tứ phân vị.],
    [Tính toán phương sai, độ lệch chuẩn mẫu ghép nhóm.],
    [So sánh mức độ phân tán của hai mẫu số liệu thực tế.],

    [*5. Xác suất điều kiện*],
    [Xác suất điều kiện đơn giản.],
    [Công thức xác suất toàn phần (dùng sơ đồ cây).],
    [Ứng dụng công thức Bayes giải bài toán kiểm định, y sinh.],
  )
]

= Giải phẫu các dạng toán thực tế ứng dụng trong đề thi

Triết lý chương trình 2018 thể hiện rõ qua các bài toán thực tế. Dưới đây là các dạng toán điển hình học sinh cần làm chủ:

== 1. Bài toán tối ưu hóa (Khảo sát hàm số)
Học sinh phải tự thiết lập hàm số từ giả thiết thực tế, sau đó dùng công cụ đạo hàm để tìm giá trị lớn nhất hoặc nhỏ nhất.
- *Ví dụ:* Một nhà sản xuất muốn làm một chiếc hộp hình trụ không nắp có thể tích $V = 500 " cm"^3$. Tìm bán kính đáy $r$ của chiếc hộp để tiết kiệm nguyên liệu vỏ hộp nhất (diện tích toàn phần $S_(t p)$ nhỏ nhất).
- *Phương pháp:*
  Ta có thể tích $V = pi r^2 h = 500 => h = 500 / (pi r^2)$.
  Hộp không nắp có diện tích toàn phần là:
  $ S_(t p) = pi r^2 + 2 pi r h = pi r^2 + 2 pi r (500 / (pi r^2)) = pi r^2 + 1000 / r $
  Khảo sát hàm số $f(r) = pi r^2 + 1000 / r$ với $r > 0$:
  $ f'(r) = 2 pi r - 1000 / r^2 = 0 => 2 pi r^3 = 1000 => r = root(3, 500 / pi) approx 5.42 " (cm)" $
  Bằng bảng biến thiên, ta khẳng định diện tích nhỏ nhất đạt được tại $r approx 5.42 " cm"$.

== 2. Bài toán đo mức độ phân tán mẫu số liệu ghép nhóm (Thống kê)
Yêu cầu học sinh thuộc lòng công thức tính Phương sai ($s^2$) và Độ lệch chuẩn ($s$).
- *Phương pháp:*
  - Bước 1: Tính các giá trị đại diện $x_i$ của từng nhóm (là trung điểm của khoảng ghép nhóm).
  - Bước 2: Tính số trung bình cộng $overline(x) = (1/n) sum_(i=1)^k n_i x_i$ (với $n_i$ là tần số của nhóm $i$, $n$ là tổng số số liệu).
  - Bước 3: Tính phương sai theo công thức:
    $ s^2 = 1/n sum_(i=1)^k n_i (x_i - overline(x))^2 = 1/n (sum_(i=1)^k n_i x_i^2) - (overline(x))^2 $
  - Bước 4: Tính độ lệch chuẩn $s = sqrt(s^2)$.

== 3. Xác suất toàn phần và Công thức Bayes
Bài toán thực tế thường là kiểm định y khoa hoặc tỷ lệ sản phẩm lỗi của nhà máy.
- *Công thức xác suất toàn phần:* Với nhóm biến cố đầy đủ ${A, overline(A)}$ và biến cố $B$ bất kỳ:
  $ P(B) = P(A) dot P(B | A) + P(overline(A)) dot P(B | overline(A)) $
- *Công thức Bayes:* Xác định xác suất biến cố nguyên nhân $A$ khi biết biến cố kết quả $B$ đã xảy ra:
  $ P(A | B) = (P(A) dot P(B | A)) / (P(B)) $
- *Kỹ năng:* Sử dụng sơ đồ cây để biểu diễn các nhánh xác suất một cách trực quan, giúp tránh nhầm lẫn các xác suất có điều kiện.

= Chiến thuật làm bài và Kỹ năng tránh bẫy trong phòng thi

Để đạt được điểm số cao trong kỳ thi Toán năm 2026, các em cần tuân thủ nghiêm ngặt các chiến thuật thực chiến sau:

== 1. Phân bổ thời gian theo quy tắc 25 - 35 - 30
- *25 phút đầu:* Hoàn thành 12 câu Phần I. Đây là các câu hỏi Nhận biết - Thông hiểu. Đọc kỹ đề, không được chủ quan làm ẩu để mất điểm oan ở phần này.
- *35 phút tiếp theo:* Giải quyết 4 câu Phần II (Đúng/Sai). Mỗi câu Đúng/Sai chứa 4 ý nhỏ, độ khó tăng dần. Học sinh nên làm tuần tự. Nếu gặp ý khó (thường là ý c hoặc d), hãy tạm thời bỏ qua để làm câu tiếp theo, sau đó quay lại giải quyết.
- *30 phút cuối:* Tập trung làm 6 câu Phần III (Trả lời ngắn). Viết nháp cẩn thận, rõ ràng từng bước tính toán.

== 2. Kỹ năng điền đáp số Phần III để tránh mất điểm đáng tiếc
Phần III yêu cầu tự điền kết quả vào ô trống và tô phiếu trả lời. Học sinh thường mắc các lỗi sau:
- *Lỗi làm tròn số:* Đề bài luôn quy định cụ thể cách làm tròn (ví dụ: làm tròn đến hàng phần mười, hoặc hàng phần trăm). Học sinh phải đọc thật kỹ và thực hiện làm tròn ở bước tính toán cuối cùng. Tuyệt đối không làm tròn các kết quả trung gian để tránh sai số lũy kế.
- *Lỗi đơn vị đo lường:* Các bài toán thực tế thường có bẫy đơn vị (ví dụ: tính ra diện tích là $m^2$ nhưng đề hỏi theo đơn vị $c m^2$, hoặc tính ra đơn vị thể tích là $d m^3$ nhưng đề hỏi đơn vị lít). Học sinh cần kiểm tra kỹ đơn vị đề bài yêu cầu trước khi tô đáp số.
- *Dấu âm và phân số:* Kết quả của Phần III chỉ có thể là số nguyên hoặc số thập phân. Nếu tính ra kết quả là phân số (ví dụ $1/2$), học sinh phải quy đổi ra số thập phân ($0.5$) để điền vào phiếu trả lời.

= Lời kết dành cho các sĩ tử 2026

Kỳ thi tốt nghiệp THPT năm 2026 đang đến rất gần. Các em hãy nhớ rằng, đề thi theo chương trình mới đòi hỏi sự hiểu sâu về bản chất toán học và khả năng áp dụng linh hoạt. Việc luyện tập đều đặn các dạng toán thực tế, thống kê và xác suất có điều kiện cùng với chiến thuật phân bổ thời gian hợp lý chính là chìa khóa mở cánh cửa thành công. 

Chúc các em có một tinh thần vững vàng, sức khỏe dồi dào và đạt kết quả cao nhất trong kỳ thi sắp tới!
