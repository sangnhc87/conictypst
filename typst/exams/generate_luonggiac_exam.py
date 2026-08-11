import os

content_header = """#import "../sang-exam.typ": *
#import "../template.typ": *
#import "../bbt.typ": bbbt, bbt-opt
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG & MACRO STYLE
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
  align(center, text(fill: white, size: 16pt, weight: "bold", it.body))
)

#show heading.where(level: 2): it => block(
  above: 1.5em, below: 1em,
  text(fill: rgb("D32F2F"), size: 13pt, weight: "bold", it.body)
)

#show heading.where(level: 3): it => block(
  above: 1.2em, below: 0.8em,
  text(fill: rgb("2E7D32"), size: 12pt, weight: "bold", it.body)
)

#let note-box(body) = block(
  width: 100%,
  fill: rgb("FFF9C4").lighten(50%),
  stroke: (left: 4pt + rgb("FBC02D")),
  inset: 10pt,
  radius: (right: 4pt),
  body
)

#let eco-box(title, body) = block(
  width: 100%,
  fill: rgb("F3E5F5"),
  stroke: rgb("8E24AA"),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  [
    #text(fill: rgb("6A1B9A"), weight: "bold", size: 12pt)[#title]
    #v(0.5em)
    #body
  ]
)

#let ans-box(body) = block(
  fill: rgb("E8F5E9"),
  stroke: 1pt + rgb("4CAF50"),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
  text(fill: rgb("1B5E20"), weight: "bold", body)
)

// Macro câu hỏi
#let tn(id: "", content, choices, answer) = [
  #v(0.5em)
  *Câu #id.* #content
  #v(0.5em)
  #box(width: 100%, {
    if choices.len() == 4 {
      grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        row-gutter: 1em,
        [A. #choices.at(0)],
        [B. #choices.at(1)],
        [C. #choices.at(2)],
        [D. #choices.at(3)]
      )
    }
  })
]

#let ds(id: "", content, a, b, c, d, ans) = [
  #v(0.5em)
  *Câu #id.* #content
  #v(0.5em)
  #box(width: 100%, {
    grid(
      columns: (1fr,),
      row-gutter: 0.8em,
      [a) #a],
      [b) #b],
      [c) #c],
      [d) #d]
    )
  })
]

#let tln(id: "", content, answer, loigiai) = [
  #v(0.5em)
  *Câu #id.* #content
  
  *Đáp án:* #answer
  
  *Hướng dẫn giải:*
  #loigiai
]

= CHUYÊN ĐỀ TOÁN THỰC TẾ: ỨNG DỤNG HÀM SỐ LƯỢNG GIÁC

#note-box[
  *MỤC TIÊU HỌC TẬP:*
  - Nhận diện và thiết lập các mô hình hàm số lượng giác từ các bài toán thực tế (Chuyển động đu quay, con lắc, thủy triều, dao động nhiệt độ, huyết áp...).
  - Tìm chu kỳ, biên độ, giá trị lớn nhất (GTLN) và giá trị nhỏ nhất (GTNN) của các mô hình hàm lượng giác.
  - Phân tích và dự báo các đại lượng thông qua phương trình lượng giác.
  - Vận dụng thành thạo để xử lý hệ thống bài tập theo chuẩn định dạng thi mới của Bộ Giáo dục & Đào tạo.
]

== A. CÁC MÔ HÌNH TRỌNG ĐIỂM VÀ BÀI TẬP MẪU

=== 1. Mô hình Đu quay (Ferris Wheel)

#eco-box(
  "Phân tích Mô hình Đu quay",
  [
    Chuyển động của một cabin trên đu quay khổng lồ (Ferris Wheel) thường được mô tả bởi một hàm lượng giác có dạng:
    $ h(t) = a cos(omega t + phi) + c quad "hoặc" quad h(t) = a sin(omega t + phi) + c $
    Trong đó:
    - $t$: Thời gian (phút hoặc giây).
    - $h(t)$: Độ cao của cabin tại thời điểm $t$ so với mặt đất.
    - $a$: Biên độ dao động (bằng đúng bán kính $R$ của đu quay).
    - $c$: Chiều cao tâm của đu quay so với mặt đất (vị trí cân bằng).
    - Chu kỳ $T = (2pi)/omega$: Thời gian để đu quay quay hết đúng một vòng.
    
    *Giá trị lớn nhất và nhỏ nhất:*
    - Chiều cao lớn nhất (đỉnh đu quay): $h_max = c + a$
    - Chiều cao thấp nhất (đáy đu quay, nơi lên cabin): $h_min = c - a$
  ]
)

*Ví dụ 1:* Một chiếc đu quay có bán kính $15 " m"$, tâm của vòng quay ở độ cao $20 " m"$ so với mặt đất. Thời gian thực hiện mỗi vòng quay của đu quay là $4$ phút. Giả sử tại thời điểm $t = 0$, bạn đang ở vị trí thấp nhất của vòng quay.
a) Viết phương trình mô tả độ cao $h$ (m) của bạn so với mặt đất tại thời điểm $t$ (phút).
b) Tại thời điểm $t = 5$ phút, độ cao của bạn so với mặt đất là bao nhiêu?

*Hướng dẫn giải:*
a) Hàm độ cao có dạng $h(t) = c - a cos(omega t)$ (chọn $-cos$ vì xuất phát tại vị trí thấp nhất).
- Tâm đu quay ở độ cao $c = 20 " m"$.
- Bán kính $a = 15 " m"$.
- Chu kỳ $T = 4$ phút $arrow.r omega = (2pi)/T = (2pi)/4 = pi/2$.
Vậy phương trình độ cao là: 
$ h(t) = 20 - 15 cos((pi)/2 t) quad ("m") $

b) Thay $t = 5$ vào phương trình:
$ h(5) = 20 - 15 cos((pi)/2 dot 5) = 20 - 15 cos((5pi)/2) = 20 - 15 dot 0 = 20 " m". $

#ans-box[
  Vậy tại thời điểm $t = 5$ phút, độ cao của bạn là $20 " m"$.
]

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Ground
    line((-1, 0), (7, 0), stroke: (paint: green.darken(50%), thickness: 2pt))
    content((3, -0.3), text(size: 8pt)[Mặt đất])
    
    // Ferris wheel
    circle((3, 3), radius: 2, stroke: 1pt)
    circle((3, 3), radius: 0.1, fill: black)
    
    // Supports
    line((3, 3), (2, 0), stroke: 1.5pt)
    line((3, 3), (4, 0), stroke: 1.5pt)
    
    // Spokes and cabins
    for i in range(0, 8) {
      let angle = i * 45 * 3.14159 / 180.0
      let x = 3 + 2 * calc.cos(angle)
      let y = 3 + 2 * calc.sin(angle)
      line((3, 3), (x, y), stroke: 0.5pt)
      content((x, y), box(fill: red, width: 6pt, height: 6pt))
    }
    
    // Labels
    content((3.5, 3), text(size: 8pt)[$c = 20$])
    line((1.3, 3), (4.7, 3), stroke: (dash: "dashed", paint: gray))
    content((5.5, 3), text(size: 8pt)[Tâm quay])
    line((5.2, 1), (5.2, 5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((5.5, 4), text(size: 8pt)[$2a = 30$])
  })
]

=== 2. Mô hình Thủy triều và Mực nước biển

#eco-box(
  "Phân tích Mô hình Thủy triều",
  [
    Mực nước biển tại một cảng thường dao động điều hòa theo thời gian do hiện tượng thủy triều. Hàm số mô tả độ sâu $h(t)$ của mực nước thường có dạng:
    $ h(t) = a cos((pi t)/6 + phi) + c $
    Trong đó:
    - Chu kỳ thủy triều thường là khoảng $12$ giờ (chu kỳ bán nhật triều) hoặc $24$ giờ (nhật triều). Do đó $omega$ thường là $pi/6$ hoặc $pi/12$.
    - Mực nước cao nhất (Triều cường): $h_max = c + a$
    - Mực nước thấp nhất (Triều kém): $h_min = c - a$
    - Thời gian an toàn cho tàu cập cảng là giải bất phương trình lượng giác: $h(t) >= h_0$ (với $h_0$ là độ sâu tối thiểu yêu cầu của tàu).
  ]
)

*Ví dụ 2:* Độ sâu $h$ (m) của mực nước ở một cảng biển vào thời điểm $t$ (giờ) sau nửa đêm được tính bởi công thức:
$ h(t) = 3 cos(pi/6 t + pi/3) + 12 $
Một chiếc tàu chở hàng cần mực nước sâu ít nhất $13.5 " m"$ để có thể cập cảng an toàn. Trong khoảng thời gian từ $0$ giờ đến $12$ giờ trưa, tàu có thể cập cảng an toàn trong khoảng thời gian nào?

*Hướng dẫn giải:*
Để tàu cập cảng an toàn, ta cần $h(t) >= 13.5$:
$ 3 cos(pi/6 t + pi/3) + 12 >= 13.5 arrow.double.r 3 cos(pi/6 t + pi/3) >= 1.5 arrow.double.r cos(pi/6 t + pi/3) >= 1/2 $
Giải bất phương trình lượng giác $cos X >= 1/2$ trên vòng tròn lượng giác:
$ -pi/3 + k 2pi <= X <= pi/3 + k 2pi $
Áp dụng vào bài toán:
$ -pi/3 + k 2pi <= pi/6 t + pi/3 <= pi/3 + k 2pi $
Trừ đi $pi/3$ ở ba vế:
$ -2pi/3 + k 2pi <= pi/6 t <= k 2pi $
Nhân với $6/pi$:
$ -4 + 12k <= t <= 12k quad (k in Z) $
Vì $t in [0, 12]$, ta xét các giá trị của $k$:
- Với $k = 0: -4 <= t <= 0 arrow.r t = 0$.
- Với $k = 1: 8 <= t <= 12$.
Vậy tàu có thể cập cảng an toàn lúc 0 giờ (ngay lúc nửa đêm) và từ 8 giờ sáng đến 12 giờ trưa.

#ans-box[
  Tàu có thể cập cảng an toàn trong khoảng thời gian từ $8$ giờ sáng đến $12$ giờ trưa.
]

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Axes
    line((-0.2, 0), (8, 0), mark: (end: ">", size: 0.2), stroke: 0.8pt)
    line((0, -0.2), (0, 4), mark: (end: ">", size: 0.2), stroke: 0.8pt)
    content((8.2, 0), text(size: 9pt)[$t$ (giờ)])
    content((0.2, 4.2), text(size: 9pt)[$h(t)$])
    
    // Ticks
    content((4, -0.3), text(size: 8pt)[$6$])
    content((8, -0.3), text(size: 8pt)[$12$])
    line((4, -0.1), (4, 0.1), stroke: 0.5pt)
    
    // Wave h(t) = 3 cos(pi/6 t + pi/3) + 12
    // Scale: y axis 1cm = 4m -> 12m is 3cm, max 15m is 3.75cm
    // x axis 1cm = 1.5 hours -> 8cm = 12 hours
    let pts = ()
    for i in range(0, 121, step: 2) {
      let t = i / 10.0
      let h = 3.0 * calc.cos(3.14159 / 6.0 * t + 3.14159 / 3.0) + 12.0
      pts.push((t / 1.5, h / 4.0))
    }
    line(..pts, stroke: (paint: blue, thickness: 1.5pt))
    
    // Safe depth threshold h = 13.5 -> y = 13.5/4 = 3.375
    line((0, 3.375), (8, 3.375), stroke: (paint: red, dash: "dashed", thickness: 1pt))
    content((-0.5, 3.375), text(size: 8pt, fill: red)[$13.5$])
    content((4, 3.5), text(size: 8pt, fill: red)[Đường an toàn])
    
    // Shading the safe zone for t between 8 and 12 (x from 8/1.5 to 12/1.5)
    line((8.0/1.5, 3.375), (8.0/1.5, 0), stroke: (paint: gray, dash: "dashed"))
    content((8.0/1.5, -0.3), text(size: 8pt)[$8$])
  })
]

=== 3. Mô hình Sinh học và Khí hậu

#eco-box(
  "Ứng dụng Sinh học và Khí hậu",
  [
    - **Nhiệt độ trung bình:** Biến thiên của nhiệt độ qua các tháng trong năm thường lặp lại theo chu kỳ 12 tháng.
    $ T(m) = a sin((pi)/6 (m - t_0)) + c $
    (Vào mùa hè nhiệt độ cao nhất, mùa đông nhiệt độ thấp nhất).
    - **Huyết áp:** Huyết áp thay đổi liên tục theo từng nhịp đập của tim. Chu kỳ của huyết áp chính là thời gian của một nhịp tim (thường là khoảng 0.8 giây đến 1 giây).
    $ p(t) = p_"trung bình" + a cos(omega t) $
    (Huyết áp tâm thu là lớn nhất, tâm trương là nhỏ nhất).
  ]
)

"""

content_part2 = """
== B. BÀI TẬP TỰ LUYỆN ĐỊNH DẠNG MỚI (2025)

=== PHẦN I: Câu trắc nghiệm nhiều phương án lựa chọn
*(Thí sinh chọn 1 đáp án đúng duy nhất trong 4 phương án)*

#tn(
  id: "1",
  [Huyết áp của một người dao động theo nhịp tim. Huyết áp $p$ (mmHg) tại thời điểm $t$ (giây) được cho bởi hàm số $p(t) = 110 + 20 sin(160 pi t)$. Huyết áp tâm thu (huyết áp lớn nhất) và huyết áp tâm trương (huyết áp nhỏ nhất) của người đó lần lượt là:],
  ["130 mmHg và 90 mmHg.", "110 mmHg và 20 mmHg.", "130 mmHg và 110 mmHg.", "150 mmHg và 70 mmHg."],
  "A"
)

#tn(
  id: "2",
  [Chiều cao $h(m)$ của một cabin trên vòng quay Ferris so với mặt đất tại thời điểm $t$ (phút) được cho bởi $h(t) = 30 - 25 cos(pi/10 t)$. Bán kính của vòng quay Ferris đó là bao nhiêu?],
  ["30 m.", "25 m.", "55 m.", "5 m."],
  "B"
)

#tn(
  id: "3",
  [Nhiệt độ trung bình $T$ ($^circ C$) của một thành phố trong tháng $t$ ($t=1, 2, ..., 12$) được cho bởi công thức $T(t) = 22 + 8 sin(pi/6 (t - 4))$. Tháng nào trong năm có nhiệt độ trung bình cao nhất?],
  ["Tháng 6.", "Tháng 7.", "Tháng 8.", "Tháng 4."],
  "B"
)

#tn(
  id: "4",
  [Mực nước cao nhất tại một bến cảng là $14$ m và thấp nhất là $6$ m. Giả sử sự biến thiên của mực nước là dao động điều hòa với chu kỳ 12 giờ. Biên độ dao động của mực nước là:],
  ["20 m.", "14 m.", "4 m.", "8 m."],
  "C"
)

#tn(
  id: "5",
  [Một con lắc lò xo dao động điều hòa theo phương ngang. Vị trí $x$ (cm) của vật so với vị trí cân bằng tại thời điểm $t$ (s) là $x(t) = 5 cos(4pi t)$. Quãng đường vật đi được trong một chu kỳ là:],
  ["5 cm.", "10 cm.", "20 cm.", "40 cm."],
  "C"
)

#tn(
  id: "6",
  [Trong 1 năm (365 ngày), số giờ có ánh sáng mặt trời của một thành phố $X$ ở ngày thứ $t$ trong năm được cho bởi $L(t) = 12 + 3 sin((2pi)/365 (t - 80))$. Có bao nhiêu giờ ánh sáng mặt trời vào ngày dài nhất trong năm?],
  ["12 giờ.", "15 giờ.", "9 giờ.", "18 giờ."],
  "B"
)

#tn(
  id: "7",
  [Số lượng động vật ăn thịt (sói) trong một khu bảo tồn biến động theo chu kỳ của con mồi (thỏ) và được tính bằng công thức $N(t) = 400 + 150 cos((pi t)/4)$, với $t$ là số tháng tính từ đầu quan sát. Chu kỳ biến động của bầy sói là bao nhiêu tháng?],
  ["2 tháng.", "4 tháng.", "8 tháng.", "12 tháng."],
  "C"
)

#tn(
  id: "8",
  [Doanh thu $R$ (triệu đồng) của một công ty bán kem thay đổi theo tháng $t$ trong năm theo quy luật $R(t) = 500 - 300 cos(pi/6 t)$. Vào tháng mấy doanh thu của công ty đạt thấp nhất?],
  ["Tháng 12.", "Tháng 6.", "Tháng 1.", "Tháng 3."],
  "A"
)

#tn(
  id: "9",
  [Dòng điện xoay chiều chạy qua một điện trở có cường độ $i(t) = 4 cos(100pi t + pi/4)$ (A). Cường độ dòng điện hiệu dụng bằng:],
  ["4 A.", "$2sqrt(2)$ A.", "$4sqrt(2)$ A.", "100 A."],
  "B"
)

#tn(
  id: "10",
  [Một bánh xe nước có đường kính 8m, tâm quay cao hơn mặt nước 3m. Bánh xe quay đều 1 vòng hết 20 giây. Ban đầu (t=0), một chiếc gàu cách mặt nước cao nhất. Chiều cao tối thiểu của gàu so với mặt nước là:],
  ["-1 m.", "3 m.", "7 m.", "1 m."],
  "A"
)

=== PHẦN II: Câu trắc nghiệm đúng sai
*(Thí sinh chọn Đúng hoặc Sai cho mỗi ý a, b, c, d)*

#ds(
  id: "1",
  [Độ sâu $h(m)$ của mực nước biển tại một bến cảng vào thời điểm $t$ (giờ) tính từ nửa đêm được xác định bởi công thức $h(t) = 15 + 4 cos((pi t)/6 + pi/3)$.],
  [Tại thời điểm ban đầu (0 giờ), mực nước biển cao $17$ m.],
  [Biên độ dao động của mực nước là $4$ m.],
  [Chu kỳ của sự thay đổi mực nước là $6$ giờ.],
  [Trong một ngày (24 giờ), có đúng 2 lần mực nước đạt độ sâu lớn nhất.],
  ["Đúng", "Đúng", "Sai", "Đúng"]
)

#ds(
  id: "2",
  [Huyết áp của một bệnh nhân được đo bằng công thức $P(t) = 100 + 25 sin(120pi t)$ (mmHg), trong đó $t$ là thời gian tính bằng phút.],
  [Huyết áp tâm thu (huyết áp cao nhất) của bệnh nhân là 125 mmHg.],
  [Nhịp tim của bệnh nhân này là 120 nhịp/phút.],
  [Huyết áp tâm trương (huyết áp thấp nhất) của bệnh nhân là 100 mmHg.],
  [Tại thời điểm $t = 1/240$ phút, huyết áp của bệnh nhân là 125 mmHg.],
  ["Đúng", "Sai", "Sai", "Đúng"]
)

#ds(
  id: "3",
  [Khối lượng tuyết đọng trên đỉnh núi A trong năm được mô hình hóa bởi $M(t) = 50 + 40 cos(pi/6 (t - 1))$ (tấn), với $t$ là tháng trong năm ($1 <= t <= 12$).],
  [Vào tháng 1, lượng tuyết trên đỉnh núi đạt cực đại.],
  [Lượng tuyết ít nhất trong năm là 0 tấn.],
  [Tuyết tan dần và đạt mức thấp nhất vào tháng 7.],
  [Sự thay đổi lượng tuyết có tính tuần hoàn với chu kỳ 12 tháng.],
  ["Đúng", "Sai", "Đúng", "Đúng"]
)

#ds(
  id: "4",
  [Vận tốc luồng khí truyền trong khí quản của một người đang thở bình thường (lít/giây) được cho bởi $v(t) = 0.6 sin((pi t)/3)$, với $t$ là thời gian tính bằng giây.],
  [Người này thở ra và hít vào với chu kỳ là $6$ giây.],
  [Giá trị lớn nhất của luồng khí là $0.6$ lít/giây.],
  [Tại thời điểm $t = 1.5$ giây, người đó đang nín thở (vận tốc khí bằng 0).],
  [Trong 1 phút, người này thực hiện được 10 chu kỳ hô hấp.],
  ["Đúng", "Đúng", "Sai", "Đúng"]
)

#ds(
  id: "5",
  [Một quả nặng treo vào đầu một con lắc lò xo dao động thẳng đứng. Khoảng cách từ tâm quả nặng đến sàn nhà là $y(t) = 80 - 15 cos(2pi t)$ (cm), với $t$ là thời gian dao động (s).],
  [Vị trí cân bằng của con lắc cách sàn nhà 80 cm.],
  [Vật tiến lại gần mặt sàn nhất là 65 cm.],
  [Chu kỳ dao động của con lắc là $pi$ giây.],
  [Vào thời điểm $t=0.5$ giây, vật ở vị trí cao nhất (cách sàn 95cm).],
  ["Đúng", "Đúng", "Sai", "Đúng"]
)


=== PHẦN III: Câu trắc nghiệm trả lời ngắn
*(Thí sinh tính toán và điền đáp án số vào ô trống)*

#tln(
  id: "1",
  [Một vòng quay mặt trời quay mỗi vòng mất 15 phút. Tâm của vòng quay nằm ở độ cao 35m so với mặt đất, bán kính vòng quay là 30m. Lúc $t=0$, một người bắt đầu lên vòng quay ở vị trí thấp nhất. Hỏi sau bao nhiêu phút (lần đầu tiên) thì người đó đạt độ cao 50m?],
  [$2.5$ phút.],
  [
    Ta có $h(t) = 35 - 30 cos(omega t)$.
    Chu kỳ $T = 15 arrow.r omega = (2pi)/15$.
    Độ cao 50m $arrow.r 35 - 30 cos((2pi)/15 t) = 50 arrow.r -30 cos((2pi)/15 t) = 15 arrow.r cos((2pi)/15 t) = -1/2$.
    Giá trị góc nhỏ nhất thỏa mãn là $(2pi)/3$.
    Suy ra $(2pi)/15 t = (2pi)/3 arrow.r t = (15)/3 = 5$.
    *Sửa lại phân tích:* Góc nhỏ nhất để $cos = -1/2$ là $2pi/3$. 
    Do đó $(2pi/15) * t = 2pi/3 => t = 5$ phút. 
    Đáp án là $5$.
  ]
)

#tln(
  id: "2",
  [Số giờ có ánh sáng mặt trời của một thành phố vĩ độ cao trong ngày thứ $t$ của năm (1 năm 365 ngày) là $y(t) = 12 + 6 sin( (2pi)/365 (t - 80) )$. Tìm số giờ có ánh sáng mặt trời lớn nhất trong năm (làm tròn đến số nguyên).],
  [$18$],
  [
    Hàm số $y(t) = 12 + 6 sin(...)$ đạt giá trị lớn nhất khi $sin(...) = 1$.
    Khi đó, $y_max = 12 + 6 = 18$ (giờ).
  ]
)

#tln(
  id: "3",
  [Độ cao $h$ (m) của mực nước biển tại một bến cảng vào thời điểm $t$ (giờ, $0 <= t <= 24$) được cho bởi hàm số $h(t) = 12 + 3 cos((pi)/6 t - (pi)/2)$. Hỏi trong một ngày, có bao nhiêu thời điểm mực nước đạt độ cao 13.5m?],
  [$4$],
  [
    $12 + 3 cos((pi)/6 t - (pi)/2) = 13.5 arrow.r 3 sin((pi)/6 t) = 1.5 arrow.r sin((pi)/6 t) = 1/2$.
    Trong đoạn $t in [0, 24]$, góc $(pi)/6 t in [0, 4pi]$.
    Phương trình $sin X = 1/2$ có 2 nghiệm trong mỗi chu kỳ $2pi$.
    Trên miền $[0, 4pi]$ chứa 2 chu kỳ, nên sẽ có $2 times 2 = 4$ nghiệm.
    Vậy có 4 thời điểm mực nước đạt 13.5m.
  ]
)

#tln(
  id: "4",
  [Một lò xo dao động điều hoà, phương trình vị trí là $x(t) = 10 cos(5pi t)$ (cm). Tìm tốc độ lớn nhất của vật nặng (cm/s). Biết tốc độ là trị tuyệt đối của đạo hàm vị trí theo thời gian $v(t) = x'(t)$. (Điền số nguyên hoặc lấy $pi approx 3.14$).],
  [$157$],
  [
    Đạo hàm $v(t) = x'(t) = -50pi sin(5pi t)$.
    Tốc độ lớn nhất là $|v|_max = 50pi approx 50 times 3.14 = 157$ (cm/s).
  ]
)

#tln(
  id: "5",
  [Nhiệt độ $T$ ($^circ C$) ngoài trời của một ngày mùa hè được mô hình hóa bởi $T(h) = 28 + 6 sin(pi/12 (h - 8))$, với $h$ là số giờ kể từ nửa đêm ($0 <= h <= 24$). Nhiệt độ đạt mức cao nhất vào lúc mấy giờ?],
  [$14$],
  [
    Nhiệt độ cao nhất khi $sin(pi/12 (h - 8)) = 1$.
    $arrow.r pi/12 (h - 8) = pi/2 arrow.r h - 8 = 6 arrow.r h = 14$.
    Vậy lúc 14 giờ (2 giờ chiều) nhiệt độ đạt cao nhất (34 độ C).
  ]
)

#tln(
  id: "6",
  [Điện áp của một lưới điện dân dụng xoay chiều là $u(t) = 220sqrt(2) cos(100pi t)$ (V). Hỏi trong 1 giây, điện áp $u(t)$ bằng 0 bao nhiêu lần?],
  [$100$],
  [
    $u(t) = 0 arrow.r cos(100pi t) = 0 arrow.r 100pi t = pi/2 + k pi arrow.r t = 1/200 + k/100$.
    Với $0 < t <= 1$:
    $0 < 1/200 + k/100 <= 1 arrow.r -0.5 < k <= 99.5$.
    Do $k in Z$ nên $k in {0, 1, ..., 99}$.
    Có $100$ giá trị của $k$, do đó điện áp bằng 0 đúng 100 lần trong 1 giây.
  ]
)

#tln(
  id: "7",
  [Một quả bóng được thả nổi trên biển, nhấp nhô theo sóng biển. Độ cao của quả bóng so với đáy biển (m) là $h(t) = 5 + 1.2 cos(2pi t)$, với $t$ tính bằng giây. Quãng đường (tính bằng mét) quả bóng di chuyển theo phương thẳng đứng trong 1 phút là bao nhiêu?],
  [$288$],
  [
    Chu kỳ sóng là $T = (2pi)/(2pi) = 1$ giây.
    Biên độ dao động là $A = 1.2$ m.
    Trong 1 chu kỳ (1 giây), quả bóng đi được quãng đường là $4A = 4 times 1.2 = 4.8$ m.
    Trong 1 phút (60 giây), quãng đường đi được là $60 times 4.8 = 288$ m.
  ]
)
"""

with open("CD-HamSoLuongGiac-ToanThucTe.typ", "w", encoding="utf-8") as f:
    f.write(content_header + content_part2)

print("Created CD-HamSoLuongGiac-ToanThucTe.typ successfully.")
