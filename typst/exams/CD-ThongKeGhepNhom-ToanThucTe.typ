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

#let ans-box(body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + rgb("4CAF50")),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[ *Trả lời:* #body ]

#let mode = "loigiai"

#align(center)[
  #text(size: 24pt, weight: "bold", fill: rgb("1565C0"), [CHUYÊN ĐỀ TỰ CHỌN LỚP 11]) \
  #v(10pt)
  #text(size: 20pt, weight: "bold", fill: rgb("E67E22"), [THỐNG KÊ MẪU SỐ LIỆU GHÉP NHÓM]) \
  #v(5pt)
  #text(size: 14pt, style: "italic", fill: gray, [Toán thực tế - Đánh giá rủi ro, Phân tích phong độ & Ngoại lệ])
]

#v(20pt)

= TÓM TẮT MÔ HÌNH TOÁN HỌC & CÔNG THỨC TRỌNG TÂM

#block(
  fill: rgb("F0F8FF"),
  stroke: (left: 4pt + rgb("1976D2")),
  inset: 15pt,
  radius: 4pt,
  width: 100%,
)[
  *1. Số trung bình cộng (Mean)* 
  Đại diện cho mức độ trung bình của toàn bộ mẫu.
  $ overline(x) = (n_1 c_1 + n_2 c_2 + ... + n_k c_k) / n $
  Với $c_i$ là giá trị đại diện (trung bình cộng 2 đầu mút) của nhóm thứ $i$.

  *2. Trung vị (Median - $Q_2$)* 
  Giá trị chia đôi mẫu số liệu. Không bị ảnh hưởng bởi các giá trị ngoại lệ (outliers). Rất hữu ích khi phân tích thu nhập, mức lương.
  $ M_e = u_m + (n/2 - C) / n_m times (u_{m+1} - u_m) $
  (Trong đó: nhóm $m$ chứa trung vị, $C$ là tần số tích lũy của các nhóm trước $m$, $n_m$ là tần số nhóm $m$, độ dài nhóm là $u_{m+1} - u_m$).

  *3. Tứ phân vị ($Q_1, Q_2, Q_3$)* 
  Chia dữ liệu thành 4 phần bằng nhau. Dùng để xác định *Khoảng tứ phân vị* $Delta_Q = Q_3 - Q_1$ và tìm các *giá trị ngoại lệ* (outliers) nằm ngoài đoạn:
  $ [Q_1 - 1.5 Delta_Q ; Q_3 + 1.5 Delta_Q] $

  *4. Mốt (Mode)* 
  Giá trị xuất hiện nhiều nhất (ví dụ: cỡ áo bán chạy nhất).
  $ M_o = u_m + (n_m - n_{m-1}) / ((n_m - n_{m-1}) + (n_m - n_{m+1})) times (u_{m+1} - u_m) $

  *5. Phương sai ($s^2$) & Độ lệch chuẩn ($s$)* 
  Đo lường sự phân tán của số liệu quanh mức trung bình. Phương sai càng nhỏ, dữ liệu càng đồng đều, phong độ càng ổn định, rủi ro càng thấp.
]

#v(20pt)

= PHẦN I. CÂU TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN
*(Mỗi câu hỏi có 4 phương án, chọn 1 phương án đúng nhất)* 

#tn(
  id: "M1",
  [Để điều tra về mức lương (triệu đồng/tháng) của nhân viên tại một công ty công nghệ, người ta thu được bảng phân bố tần số ghép nhóm sau:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto),
      align: center,
      [Lương (triệu VNĐ)], [ $[10; 15)$ ], [ $[15; 20)$ ], [ $[20; 25)$ ], [ $[25; 30)$ ], [ $[30; 35)$ ],
      [Số nhân viên], [15], [35], [20], [8], [2]
    )
  ]
  Giá trị đại diện cho nhóm mức lương từ $[15; 20)$ là bao nhiêu?],
  ([$15$], [$20$], True([$17.5$]), [$35$]),
  loigiai: [
    Giá trị đại diện của một nhóm bằng trung bình cộng của 2 mút giới hạn nhóm.
    Với nhóm $[15; 20)$, giá trị đại diện là: $c_2 = (15 + 20) / 2 = 17.5$.
    
    #ans-box[Giá trị đại diện là *$17.5$*.]
  ]
)

#tn(
  id: "M2",
  [Một công ty nghiên cứu thị trường cần xác định "kích cỡ giày bán chạy nhất" để lên kế hoạch nhập hàng cho quý tới. Từ bảng dữ liệu doanh số theo các nhóm kích cỡ (size), đại lượng thống kê nào sau đây là quan trọng và phù hợp nhất để đưa ra quyết định?],
  ([Số trung bình (Mean).], [Phương sai (Variance).], True([Mốt (Mode).]), [Trung vị (Median).]),
  loigiai: [
    Trong kinh doanh và bán lẻ, đặc biệt là các mặt hàng có phân loại theo kích thước (quần áo, giày dép), nhà quản lý không quan tâm đến "kích cỡ trung bình" (ví dụ size trung bình là 39.5 không có ý nghĩa nếu không ai mua size đó). 
    Điều họ cần biết là kích cỡ nào được *nhiều người mua nhất* để nhập nhiều hàng nhất. Đại lượng thể hiện tần số xuất hiện cao nhất chính là *Mốt (Mode)*.
    
    #ans-box[Đại lượng phù hợp nhất là *Mốt (Mode)*.]
  ]
)

#tn(
  id: "M3",
  [Một tổ chức tài chính đang tư vấn đầu tư vào hai quỹ mở A và B. Cả hai quỹ đều có tỷ suất lợi nhuận trung bình trong 5 năm qua là $12%$/năm. Tuy nhiên, độ lệch chuẩn của tỷ suất lợi nhuận quỹ A là $3.5%$, trong khi của quỹ B là $8.2%$. Lời khuyên đầu tư nào sau đây là chính xác nhất dựa trên dữ liệu thống kê?],
  (True([Quỹ A an toàn và ổn định hơn, phù hợp cho nhà đầu tư ngại rủi ro.]), [Quỹ B an toàn và ổn định hơn quỹ A.], [Cả hai quỹ có mức độ rủi ro hoàn toàn giống nhau vì lợi nhuận trung bình bằng nhau.], [Không thể so sánh rủi ro vì độ lệch chuẩn không có ý nghĩa trong tài chính.]),
  loigiai: [
    Độ lệch chuẩn ($s$) đo lường mức độ biến động (phân tán) của số liệu xung quanh giá trị trung bình.
    Trong tài chính, biến động càng lớn (độ lệch chuẩn cao) đồng nghĩa với *rủi ro càng cao* (có thể lãi lớn nhưng cũng có thể lỗ sâu).
    Vì $s_A = 3.5% < s_B = 8.2%$, nên lợi nhuận của quỹ A ổn định và ít dao động hơn quỹ B. Do đó quỹ A an toàn hơn.
    
    #ans-box[Quỹ A an toàn và ổn định hơn.]
  ]
)

#tn(
  id: "M4",
  [Bộ phận nhân sự thống kê thời gian hoàn thành một sản phẩm (phút) của công nhân trong xưởng như sau:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto),
      align: center,
      [Thời gian (phút)], [ $[10; 15)$ ], [ $[15; 20)$ ], [ $[20; 25)$ ], [ $[25; 30)$ ],
      [Số công nhân], [5], [12], [8], [3]
    )
  ]
  Nhóm chứa mốt của mẫu số liệu trên là nhóm nào?],
  ([ $[10; 15)$ ], True([ $[15; 20)$ ]), [ $[20; 25)$ ], [ $[25; 30)$ ]),
  loigiai: [
    Nhóm chứa mốt là nhóm có tần số lớn nhất.
    Nhìn vào bảng, ta thấy tần số lớn nhất là $12$, tương ứng với nhóm $[15; 20)$.
    
    #ans-box[Nhóm chứa mốt là *$[15; 20)$*.]
  ]
)

#tn(
  id: "M5",
  [Tiếp tục với bảng số liệu ở Câu 4. Hãy tính thời gian trung bình (Mean) hoàn thành một sản phẩm của công nhân trong xưởng (làm tròn đến 1 chữ số thập phân).],
  ([$17.5$ phút], [$18.2$ phút], True([$19.1$ phút]), [$19.3$ phút]),
  loigiai: [
    Tính các giá trị đại diện $c_i$ cho từng nhóm:
    - $[10; 15) => c_1 = 12.5$
    - $[15; 20) => c_2 = 17.5$
    - $[20; 25) => c_3 = 22.5$
    - $[25; 30) => c_4 = 27.5$
    
    Tổng số công nhân: $n = 5 + 12 + 8 + 3 = 28$.
    
    Số trung bình:
    $ overline(x) = (5 times 12.5 + 12 times 17.5 + 8 times 22.5 + 3 times 27.5) / 28 $
    $ overline(x) = (62.5 + 210 + 180 + 82.5) / 28 = 535 / 28 approx 19.1 $ phút.
    
    #ans-box[Thời gian trung bình là *$19.1$ phút*.]
  ]
)

#tn(
  id: "M6",
  [Một ứng dụng đặt xe taxi thống kê cự ly các chuyến đi (km) trong một ngày tại trung tâm thành phố:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto),
      align: center,
      [Cự ly (km)], [ $[0; 2)$ ], [ $[2; 4)$ ], [ $[4; 6)$ ], [ $[6; 8)$ ], [ $[8; 10)$ ],
      [Số chuyến], [15], [35], [25], [15], [10]
    )
  ]
  Cỡ mẫu (tổng số chuyến đi) là bao nhiêu?],
  ([$80$], [$90$], True([$100$]), [$120$]),
  loigiai: [
    Cỡ mẫu $n$ là tổng của tất cả các tần số:
    $ n = 15 + 35 + 25 + 15 + 10 = 100 $
    
    #ans-box[Cỡ mẫu là *$100$*.]
  ]
)

#tn(
  id: "M7",
  [Cho một mẫu số liệu ghép nhóm về điểm số thi môn Toán. Nếu Khoảng tứ phân vị của mẫu số liệu là $Delta_Q = 1.5$ và tứ phân vị thứ ba là $Q_3 = 7.5$. Giá trị của tứ phân vị thứ nhất ($Q_1$) là bao nhiêu?],
  ([$5.0$], [$5.5$], True([$6.0$]), [$6.5$]),
  loigiai: [
    Khoảng tứ phân vị được tính bởi công thức: $Delta_Q = Q_3 - Q_1$.
    Thay số: $1.5 = 7.5 - Q_1 => Q_1 = 7.5 - 1.5 = 6.0$.
    
    #ans-box[Giá trị $Q_1$ là *$6.0$*.]
  ]
)

#tn(
  id: "M8",
  [Trong phân tích dữ liệu, một giá trị $x$ bị coi là giá trị ngoại lệ (Outlier - giá trị bất thường) nếu nó thỏa mãn điều kiện nào sau đây? (Với $Delta_Q$ là khoảng tứ phân vị).],
  ([$x < Q_1 - Delta_Q$ hoặc $x > Q_3 + Delta_Q$], [$x < Q_1 - 2 Delta_Q$ hoặc $x > Q_3 + 2 Delta_Q$], True([$x < Q_1 - 1.5 Delta_Q$ hoặc $x > Q_3 + 1.5 Delta_Q$]), [$x < Q_2 - 1.5 Delta_Q$ hoặc $x > Q_2 + 1.5 Delta_Q$]),
  loigiai: [
    Theo quy ước thống kê chuẩn quốc tế (được dạy trong chương trình Toán 11), một giá trị được gọi là điểm ngoại lệ (Outlier) nếu nó nhỏ hơn $Q_1 - 1.5 Delta_Q$ hoặc lớn hơn $Q_3 + 1.5 Delta_Q$.
    Những điểm này trên biểu đồ hộp (Boxplot) thường được biểu diễn bằng các dấu chấm rời rạc nằm ngoài "râu".
    
    #ans-box[Điều kiện đúng là phương án C.]
  ]
)

#tn(
  id: "M9",
  [Thời gian tập luyện hàng ngày (phút) của một vận động viên bơi lội được ghi lại trong 40 ngày và phân bố như sau:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto),
      align: center,
      [Thời gian (phút)], [ $[90; 100)$ ], [ $[100; 110)$ ], [ $[110; 120)$ ], [ $[120; 130)$ ],
      [Số ngày], [5], [18], [12], [5]
    )
  ]
  Nhóm chứa trung vị của mẫu số liệu trên là nhóm nào?],
  ([ $[90; 100)$ ], True([ $[100; 110)$ ]), [ $[110; 120)$ ], [ $[120; 130)$ ]),
  loigiai: [
    Cỡ mẫu $n = 40$.
    Vị trí của trung vị là ở giá trị thứ $n/2 = 20$ và $21$.
    Tính tần số tích lũy:
    - Nhóm 1: $C_1 = 5$.
    - Nhóm 2: $C_2 = 5 + 18 = 23$.
    Vì $20$ và $21$ đều nhỏ hơn hoặc bằng $23$ và lớn hơn $5$, nên giá trị thứ $20$ và $21$ nằm trong nhóm thứ 2: $[100; 110)$.
    
    #ans-box[Nhóm chứa trung vị là *$[100; 110)$*.]
  ]
)

#tn(
  id: "M10",
  [Dựa vào bảng số liệu ở Câu M9, hãy tính giá trị gần đúng của Trung vị (Median) thời gian tập luyện của vận động viên này (làm tròn đến hàng phần mười).],
  ([$106.5$], True([$108.3$]), [$109.1$], [$110.0$]),
  loigiai: [
    Nhóm chứa trung vị là $[100; 110) => u_m = 100, u_{m+1} = 110$.
    Tần số nhóm chứa trung vị: $n_m = 18$.
    Tần số tích lũy các nhóm trước đó: $C = 5$.
    Cỡ mẫu: $n = 40$.
    
    Áp dụng công thức tính trung vị:
    $ M_e = u_m + (n/2 - C) / n_m times (u_{m+1} - u_m) $
    $ M_e = 100 + (20 - 5) / 18 times 10 = 100 + 15/18 times 10 = 100 + 150/18 approx 108.3 $ phút.
    
    #ans-box[Trung vị xấp xỉ *$108.3$*.]
  ]
)

#tn(
  id: "M11",
  [Một công ty nông sản thống kê khối lượng của những quả cam (gram) thu hoạch được trong vườn:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto),
      align: center,
      [Khối lượng (g)], [ $[150; 200)$ ], [ $[200; 250)$ ], [ $[250; 300)$ ], [ $[300; 350)$ ],
      [Tần số], [10], [45], [30], [15]
    )
  ]
  Cỡ mẫu là $n = 100$. Hãy tìm nhóm chứa tứ phân vị thứ nhất ($Q_1$).],
  ([ $[150; 200)$ ], True([ $[200; 250)$ ]), [ $[250; 300)$ ], [ $[300; 350)$ ]),
  loigiai: [
    Cỡ mẫu $n = 100$.
    Tứ phân vị thứ nhất $Q_1$ nằm ở vị trí thứ $n/4 = 25$.
    Tính tần số tích lũy:
    - Nhóm 1: $C_1 = 10$.
    - Nhóm 2: $C_2 = 10 + 45 = 55$.
    Vì $25 > 10$ và $25 <= 55$, nên $Q_1$ nằm trong nhóm thứ 2: $[200; 250)$.
    
    #ans-box[Nhóm chứa $Q_1$ là *$[200; 250)$*.]
  ]
)

#tn(
  id: "M12",
  [Tính giá trị tứ phân vị thứ ba ($Q_3$) cho mẫu số liệu quả cam ở Câu M11 (làm tròn đến chữ số thập phân thứ nhất).],
  ([$275.0$], True([$283.3$]), [$291.7$], [$295.5$]),
  loigiai: [
    Tứ phân vị thứ ba $Q_3$ nằm ở vị trí thứ $(3n)/4 = 75$.
    Tần số tích lũy:
    - Nhóm 2: $55$.
    - Nhóm 3: $55 + 30 = 85$.
    Vậy $Q_3$ nằm trong nhóm thứ 3: $[250; 300) => u_m = 250$.
    Tần số nhóm $m$: $n_m = 30$. Tần số tích lũy trước đó: $C = 55$. Độ dài nhóm: $50$.
    
    Công thức:
    $ Q_3 = u_m + ((3n)/4 - C) / n_m times (u_{m+1} - u_m) $
    $ Q_3 = 250 + (75 - 55) / 30 times 50 = 250 + 20/30 times 50 = 250 + 100/3 approx 283.3 $ gam.
    
    #ans-box[Giá trị $Q_3$ là *$283.3$*.]
  ]
)

#tn(
  id: "M13",
  [Với số liệu ở Câu M11 và M12, tính Khoảng tứ phân vị ($Delta_Q = Q_3 - Q_1$) để đánh giá độ phân tán của $50%$ số lượng quả cam ở giữa. (Biết $Q_1 = 216.7$ gam).],
  ([$33.3$], [$50.0$], True([$66.6$]), [$100.0$]),
  loigiai: [
    Khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$.
    Theo tính toán: $Q_3 = 283.3$ và $Q_1 = 216.7$.
    $ Delta_Q = 283.3 - 216.7 = 66.6 $ gam.
    
    #ans-box[Khoảng tứ phân vị là *$66.6$*.]
  ]
)

#tn(
  id: "M14",
  [Khi biểu diễn dữ liệu bằng Biểu đồ hộp (Boxplot), đường thẳng kẻ ngang bên trong hộp chữ nhật biểu thị đại lượng nào?],
  ([Số trung bình.], [Mốt.], True([Trung vị ($Q_2$).]), [Độ lệch chuẩn.]),
  loigiai: [
    Biểu đồ hộp (Boxplot) được xây dựng dựa trên 5 con số đặc trưng: 
    Giá trị nhỏ nhất ($"Min"$), Tứ phân vị thứ nhất ($Q_1$), Trung vị ($Q_2$), Tứ phân vị thứ ba ($Q_3$) và Giá trị lớn nhất ($"Max"$).
    Trong đó, hai cạnh của hộp là $Q_1$ và $Q_3$, và đường thẳng chia bên trong hộp chính là Trung vị ($Q_2$).
    
    #ans-box[Đường ngang trong hộp biểu thị *Trung vị ($Q_2$)*.]
  ]
)

#tn(
  id: "M15",
  [Một công ty bảo hiểm sử dụng độ lệch chuẩn của số liệu tai nạn giao thông theo từng độ tuổi để xây dựng mức phí bảo hiểm. Nhóm tuổi nào có độ lệch chuẩn càng lớn thì mức phí bảo hiểm đối với nhóm đó sẽ như thế nào?],
  ([Càng thấp, vì rủi ro ổn định.], True([Càng cao, vì mức độ biến động (rủi ro) càng lớn.]), [Không đổi, vì phí bảo hiểm chỉ phụ thuộc vào số trung bình.], [Được miễn phí bảo hiểm.]),
  loigiai: [
    Độ lệch chuẩn là thước đo sự biến động và rủi ro. 
    Độ lệch chuẩn càng lớn nghĩa là số vụ tai nạn phân চরম rộng (khó dự đoán, có khả năng gây thiệt hại đột biến). Do đó, rủi ro cho công ty bảo hiểm càng cao. Để bù đắp rủi ro này, mức phí bảo hiểm áp dụng cho nhóm đó phải càng cao.
    
    #ans-box[Phí bảo hiểm *càng cao* vì rủi ro lớn.]
  ]
)

#v(20pt)
= PHẦN II. CÂU TRẮC NGHIỆM ĐÚNG SAI
*(Mỗi câu hỏi có 4 ý, đánh dấu ĐÚNG hoặc SAI cho từng ý)* 

#ds(
  id: "D1",
  [Một công ty khởi nghiệp công bố mức lương (triệu VNĐ/tháng) của $50$ nhân viên như sau:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto),
      align: center,
      [Lương (triệu VNĐ)], [ $[5; 10)$ ], [ $[10; 15)$ ], [ $[15; 20)$ ], [ $[20; 25)$ ], [ $[100; 105)$ ],
      [Số nhân viên], [10], [25], [10], [4], [1]
    )
  ]
  Sinh viên K sau khi phân tích bảng dữ liệu trên đã đưa ra một số nhận định. Xét tính đúng sai của các nhận định đó:],
  (
    [a) Mức lương trung bình của toàn công ty là khoảng $14.8$ triệu đồng, do đó đa số nhân viên có cuộc sống khá thoải mái.],
    [b) Nhóm chứa trung vị là $[10; 15)$.],
    [c) Giá trị trung vị (Median) và Mốt (Mode) đo lường mức thu nhập phổ biến thực tế tốt hơn số trung bình trong trường hợp này.],
    [d) Mức lương $100$ triệu là một giá trị ngoại lệ (Outlier), làm lệch số trung bình lên cao, che giấu mức thu nhập thực sự của đa số nhân viên.]
  ),
  (False, True, True, True),
  loigiai: [
    *Phân tích dữ liệu:* 
    - *a)* Số trung bình bị kéo lệch lên rất cao bởi 1 người nhận lương $100$ triệu (ví dụ Giám đốc). Mặc dù trung bình là $14.8$ triệu, nhưng có đến 35/50 nhân viên (70%) có mức lương dưới $15$ triệu. Nhận định đa số nhân viên thoải mái dựa trên số trung bình là sai lầm phổ biến. (SAI).
    - *b)* Cỡ mẫu $n = 50$. Trung vị nằm ở vị trí $25, 26$. Nhóm 1 có 10 người, nhóm 2 có 25 người (tích lũy 35). Do đó vị trí 25, 26 nằm ở nhóm $[10; 15)$. (ĐÚNG).
    - *c)* Trung vị và Mốt không bị ảnh hưởng bởi giá trị đột biến cực lớn. Chúng nằm ở nhóm $[10; 15)$, phản ánh đúng "mặt bằng chung". (ĐÚNG).
    - *d)* Khoảng $100$ triệu nằm cách quá xa phần lớn dữ liệu, nó tạo ra sự "lệch phải" (Right-skewed) cực mạnh, chính là một ngoại lệ. (ĐÚNG).
    
    #ans-box[a. Sai, b. Đúng, c. Đúng, d. Đúng.]
  ]
)

#ds(
  id: "D2",
  [Một huấn luyện viên bóng rổ đang cân nhắc chọn cầu thủ A hoặc cầu thủ B cho vị trí ném phạt quyết định. Dữ liệu ghi bàn trong 50 trận của mỗi cầu thủ được phân bố như sau (đơn vị: điểm/trận):
  - Cầu thủ A: Mức điểm tập trung nhiều ở hai nhóm $[5; 10)$ và $[25; 30)$. Số trung bình là $15$ điểm, phương sai $s_A^2 = 72$.
  - Cầu thủ B: Mức điểm tập trung chủ yếu ở nhóm $[10; 20)$. Số trung bình là $15$ điểm, phương sai $s_B^2 = 18$.
  Hãy đánh giá các quyết định và nhận định sau:],
  (
    [a) Vì số điểm trung bình của hai cầu thủ bằng nhau ($15$ điểm), nên chọn ai cũng mang lại hiệu quả y hệt nhau.],
    [b) Cầu thủ A có độ lệch chuẩn lớn hơn cầu thủ B.],
    [c) Cầu thủ A là kiểu người "chơi bùng nổ nhưng thiếu ổn định" (rủi ro cao).],
    [d) Nếu đội đang rất cần một số điểm ổn định khoảng 15 điểm để chắc chắn vô địch, HLV nên chọn cầu thủ B.]
  ),
  (False, True, True, True),
  loigiai: [
    *Phân tích rủi ro và độ ổn định:* 
    - *a)* Số trung bình bằng nhau nhưng mức độ phân tán (phương sai) khác nhau, nên tính chất thi đấu của họ khác hẳn nhau. Không thể nói hiệu quả y hệt. (SAI).
    - *b)* Phương sai $s_A^2 = 72 > s_B^2 = 18$, suy ra độ lệch chuẩn $s_A = sqrt(72) > s_B = sqrt(18)$. (ĐÚNG).
    - *c)* Độ lệch chuẩn lớn nghĩa là số điểm mỗi trận dao động rất mạnh (lúc cực thấp, lúc cực cao). Đây là sự thiếu ổn định. (ĐÚNG).
    - *d)* Cầu thủ B có phương sai nhỏ, nghĩa là số điểm quanh quẩn sát mức trung bình $15$ điểm. Rất an toàn và đáng tin cậy khi cần sự chắc chắn. (ĐÚNG).
    
    #ans-box[a. Sai, b. Đúng, c. Đúng, d. Đúng.]
  ]
)

#ds(
  id: "D3",
  [Kiểm tra chất lượng (QC) của hai máy đóng gói đường. Trọng lượng các túi đường (gram) từ Máy 1 có độ lệch chuẩn $s_1 = 0.5$g. Máy 2 có độ lệch chuẩn $s_2 = 2.3$g. Trọng lượng chuẩn yêu cầu là $500$g. Cả hai máy đều có trọng lượng trung bình đúng bằng $500$g. Xét tính đúng sai:],
  (
    [a) Máy 2 đóng gói đồng đều và chính xác hơn Máy 1.],
    [b) Túi đường của Máy 1 hầu hết đều có trọng lượng rất sát với $500$g.],
    [c) Nếu tiêu chuẩn cho phép sai số tối đa $1$g, Máy 2 sẽ tạo ra nhiều sản phẩm lỗi hơn Máy 1.],
    [d) Độ lệch chuẩn bằng $0$ là điều không thể xảy ra trong thực tế đối với máy móc cơ khí.]
  ),
  (False, True, True, True),
  loigiai: [
    *Phân tích kiểm soát chất lượng:* 
    - *a)* Máy 2 có độ lệch chuẩn lớn ($2.3$g), nghĩa là sự sai số (phân tán) giữa các túi lớn, đóng gói kém đồng đều hơn Máy 1 ($0.5$g). (SAI).
    - *b)* Độ lệch chuẩn Máy 1 rất nhỏ ($0.5$g), chứng tỏ dữ liệu co cụm sát mức trung bình $500$g. (ĐÚNG).
    - *c)* Sự dao động của Máy 2 lớn, sẽ có rất nhiều túi vượt ngưỡng $500 \pm 1$g, dẫn đến tỷ lệ hàng lỗi cao. (ĐÚNG).
    - *d)* Máy móc thực tế luôn có sai số do rung lắc, ma sát... không thể tất cả các túi giống nhau $100\%$ đến từng nanogram ($s = 0$ chỉ khi mọi số liệu giống hệt nhau). (ĐÚNG).
    
    #ans-box[a. Sai, b. Đúng, c. Đúng, d. Đúng.]
  ]
)

#ds(
  id: "D4",
  [Cho mẫu số liệu ghép nhóm về thời gian chờ (phút) của khách hàng tại ngân hàng:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center,
      [Thời gian], [ $[0; 10)$ ], [ $[10; 20)$ ], [ $[20; 30)$ ],
      [Số người], [20], [25], [5]
    )
  ]
  Xét các mệnh đề sau tính toán thống kê:],
  (
    [a) Tổng số khách hàng (cỡ mẫu) là 50 người.],
    [b) Nhóm chứa Mốt là nhóm $[0; 10)$.],
    [c) Thời gian chờ trung bình (Mean) của một khách hàng là 12 phút.],
    [d) Giá trị đại diện của nhóm $[20; 30)$ là 25.]
  ),
  (True, False, True, True),
  loigiai: [
    *Thực hiện tính toán:* 
    - *a)* Cỡ mẫu $n = 20 + 25 + 5 = 50$. (ĐÚNG).
    - *b)* Tần số lớn nhất là $25$, thuộc nhóm $[10; 20)$. Do đó nhóm chứa Mốt là $[10; 20)$. (SAI).
    - *c)* Giá trị đại diện: $c_1 = 5, c_2 = 15, c_3 = 25$.
      Số trung bình $overline(x) = (20 times 5 + 25 times 15 + 5 times 25) / 50 = (100 + 375 + 125) / 50 = 600 / 50 = 12$. (ĐÚNG).
    - *d)* Giá trị đại diện nhóm $[20; 30)$ là $(20+30)/2 = 25$. (ĐÚNG).
    
    #ans-box[a. Đúng, b. Sai, c. Đúng, d. Đúng.]
  ]
)

#v(20pt)
= PHẦN III. CÂU TRẮC NGHIỆM TRẢ LỜI NGẮN
*(Viết trực tiếp số liệu hoặc kết quả tính toán vào ô trống)* 

#tln(
  id: "S1",
  [Một công ty chăn nuôi thu thập khối lượng (kg) của 60 con lợn xuất chuồng, phân bố theo bảng sau:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto),
      align: center,
      [Khối lượng (kg)], [ $[80; 90)$ ], [ $[90; 100)$ ], [ $[100; 110)$ ], [ $[110; 120)$ ], [ $[120; 130)$ ],
      [Tần số], [5], [10], [20], [15], [10]
    )
  ]
  Hãy tính khối lượng trung bình của một con lợn (làm tròn đến 1 chữ số thập phân).],
  [107.5],
  loigiai: [
    Cỡ mẫu $n = 60$.
    Các giá trị đại diện: $c_1 = 85, c_2 = 95, c_3 = 105, c_4 = 115, c_5 = 125$.
    Tính số trung bình:
    $ overline(x) = (5 times 85 + 10 times 95 + 20 times 105 + 15 times 115 + 10 times 125) / 60 $
    $ overline(x) = (425 + 950 + 2100 + 1725 + 1250) / 60 = 6450 / 60 = 107.5 $ (kg).
    
    #ans-box[Trung bình là *$107.5$*.]
  ]
)

#tln(
  id: "S2",
  [Từ dữ liệu khối lượng lợn ở Câu S1, nhóm chứa Trung vị là nhóm $[100; 110)$. Hãy tính giá trị chính xác của Trung vị $M_e$.],
  [107.5],
  loigiai: [
    Cỡ mẫu $n = 60$. Vị trí trung vị: $n/2 = 30$.
    Tần số tích lũy trước nhóm $[100; 110)$ là: $C = 5 + 10 = 15$.
    Tần số nhóm $[100; 110)$ là: $n_m = 20$.
    Độ dài nhóm: $h = 10$. Giới hạn dưới: $u_m = 100$.
    
    $ M_e = 100 + (30 - 15) / 20 times 10 = 100 + 15/20 times 10 = 100 + 7.5 = 107.5 $
    
    #ans-box[Trung vị là *$107.5$*.]
  ]
)

#tln(
  id: "S3",
  [Cũng từ dữ liệu khối lượng ở Câu S1, hãy tính giá trị Mốt (Mode) $M_o$ (đại diện cho mức cân nặng xuất hiện nhiều nhất). (Làm tròn đến 1 chữ số thập phân).],
  [106.7],
  loigiai: [
    Nhóm chứa Mốt là nhóm có tần số lớn nhất: $[100; 110)$ với tần số $n_m = 20$.
    Tần số nhóm trước nó: $n_{m-1} = 10$.
    Tần số nhóm sau nó: $n_{m+1} = 15$.
    
    Công thức:
    $ M_o = 100 + (20 - 10) / ((20 - 10) + (20 - 15)) times 10 $
    $ M_o = 100 + 10 / (10 + 5) times 10 = 100 + 100 / 15 = 100 + 6.666... approx 106.7 $
    
    #ans-box[Mốt là *$106.7$*.]
  ]
)

#tln(
  id: "S4",
  [Một quỹ đầu tư có phương sai lợi nhuận hàng tháng là $s^2 = 12.25$. Một nhà đầu tư yêu cầu độ lệch chuẩn lợi nhuận không được vượt quá mức $4%$ thì mới đầu tư (để đảm bảo rủi ro thấp). Quỹ này có đáp ứng được yêu cầu của nhà đầu tư không? (Trả lời: Ghi "1" nếu Có, ghi "0" nếu Không).],
  [1],
  loigiai: [
    Độ lệch chuẩn $s$ là căn bậc hai của phương sai $s^2$.
    $ s = sqrt(12.25) = 3.5 $
    Độ lệch chuẩn của quỹ là $3.5%$. Mức rủi ro này nhỏ hơn ngưỡng yêu cầu của nhà đầu tư ($4%$).
    Do đó, quỹ đáp ứng được yêu cầu. Trả lời "1".
    
    #ans-box[Kết quả là *$1$*.]
  ]
)
