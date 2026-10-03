#import "@preview/cetz:0.5.2"

// --- CẤU HÌNH TRANG VÀ ĐỊNH DẠNG ---
#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 2.0cm, right: 2.0cm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num > 1 [
      #grid(
        columns: (1fr, auto),
        align(left)[#text(size: 8.5pt, fill: rgb("475569"), style: "italic")[Bài Giảng: Hệ Bất Phương Trình Bậc Nhất Hai Ẩn]],
        align(right)[#text(size: 8.5pt, fill: rgb("475569"), weight: "bold")[Trang #page-num]]
      )
      #v(-0.3em)
      #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
    ]
  },
  footer: context {
    let page-num = counter(page).get().first()
    if page-num == 1 [
      #align(center)[#text(size: 8.5pt, fill: rgb("94A3B8"))[Tài liệu Sư phạm Toán 10]]
    ]
  }
)

#set text(font: "Times New Roman", size: 12pt, lang: "vi", region: "vn")
#set par(justify: true, leading: 0.8em, first-line-indent: 1cm)

// --- CÁC HÀM TRANG TRÍ SƯ PHẠM ---
#let title-box(title) = {
  v(1em)
  align(center)[
    #block(
      fill: rgb("EFF6FF"),
      stroke: (left: 4pt + rgb("1D4ED8"), right: 4pt + rgb("1D4ED8")),
      inset: 15pt,
      radius: 5pt,
      width: 100%,
      [
        #text(size: 18pt, weight: "bold", fill: rgb("1E3A8A"))[#title]
      ]
    )
  ]
  v(1em)
}

#let section-heading(num, title, color: rgb("0F172A")) = {
  v(1.5em)
  text(size: 15pt, weight: "bold", fill: color)[#num. #title]
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + color)
  v(0.5em)
}

#let def-box(body) = {
  block(
    fill: rgb("F0FDF4"), // green 50
    stroke: (left: 4pt + rgb("16A34A")), // green 600
    inset: 12pt,
    width: 100%,
    [
      #text(weight: "bold", fill: rgb("16A34A"))[Định nghĩa:] #body
    ]
  )
}

#let warning-box(title, body) = {
  block(
    fill: rgb("FFF7ED"), // orange 50
    stroke: (left: 4pt + rgb("EA580C")), // orange 600
    inset: 12pt,
    width: 100%,
    [
      #text(weight: "bold", fill: rgb("EA580C"))[#title] #body
    ]
  )
}

#let step-box(num, body) = {
  grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    align: (center + horizon, left + horizon),
    block(fill: rgb("1D4ED8"), inset: 8pt, radius: 50%)[#text(fill: white, weight: "bold")[#num]],
    block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("E2E8F0"), inset: 10pt, width: 100%, radius: 5pt)[#body]
  )
  v(0.3em)
}

#let example-box(title, body) = {
  block(
    fill: rgb("F8FAFC"),
    stroke: 1pt + rgb("CBD5E1"),
    inset: 12pt,
    width: 100%,
    radius: 5pt,
    [
      #text(weight: "bold", fill: rgb("334155"))[#title]
      #v(0.5em)
      #body
    ]
  )
}

// ======================================================================
// BẮT ĐẦU NỘI DUNG TÀI LIỆU
// ======================================================================

#title-box[BÀI GIẢNG: HỆ BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN]

#section-heading("1", "TÌNH HUỐNG MỞ ĐẦU (ĐẶT VẤN ĐỀ)", color: rgb("1D4ED8"))

#text(style: "italic")[Trong thực tế kinh tế và sản xuất, chúng ta thường xuyên đối mặt với bài toán tối ưu nguồn lực. Hãy xem xét tình huống sau:]

Một xưởng mộc sản xuất hai loại bàn: *Bàn làm việc* và *Bàn ăn*. Để sản xuất, xưởng cần trải qua hai công đoạn: Cưa và Đánh bóng.
- Mỗi chiếc *Bàn làm việc* cần 2 giờ cưa và 1 giờ đánh bóng, đem lại mức lãi 500 nghìn đồng.
- Mỗi chiếc *Bàn ăn* cần 1 giờ cưa và 2 giờ đánh bóng, đem lại mức lãi 400 nghìn đồng.

Mỗi ngày, xưởng chỉ có thể huy động tối đa *10 giờ* cho công đoạn cưa và *8 giờ* cho công đoạn đánh bóng. 
*Câu hỏi đặt ra:* Cần sản xuất bao nhiêu chiếc bàn mỗi loại để tiền lãi thu được là *lớn nhất*?

Nếu gọi $x$ và $y$ lần lượt là số lượng Bàn làm việc và Bàn ăn cần sản xuất trong một ngày, ta có các điều kiện sau:
- Thời gian cưa: $2x + y <= 10$
- Thời gian đánh bóng: $x + 2y <= 8$
- Số lượng bàn không thể âm: $x >= 0, y >= 0$

Tập hợp tất cả các bất phương trình trên tạo thành một *Hệ bất phương trình bậc nhất hai ẩn*. Bài toán kinh tế trên chính là đi tìm giá trị lớn nhất của hàm lợi nhuận $F(x, y) = 500x + 400y$ thỏa mãn hệ bất phương trình đó.


#section-heading("2", "ĐỊNH NGHĨA HỆ BẤT PHƯƠNG TRÌNH VÀ MIỀN NGHIỆM", color: rgb("1D4ED8"))

#def-box[
  - *Hệ bất phương trình bậc nhất hai ẩn* $x, y$ là một hệ gồm hai hay nhiều bất phương trình bậc nhất hai ẩn.
  - *Nghiệm của hệ:* Là cặp số $(x_0; y_0)$ đồng thời là nghiệm của *tất cả* các bất phương trình trong hệ.
  - *Miền nghiệm của hệ:* Là tập hợp tất cả các điểm $M(x_0; y_0)$ trên mặt phẳng tọa độ $O x y$ sao cho $(x_0; y_0)$ là nghiệm của hệ bất phương trình.
]

*Chú ý:* Miền nghiệm của hệ bất phương trình chính là *phần giao* của các miền nghiệm của từng bất phương trình có trong hệ. Nó thường là một miền đa giác (có thể khép kín hoặc không khép kín).

#section-heading("3", "CÁC BƯỚC BIỂU DIỄN MIỀN NGHIỆM CỦA HỆ", color: rgb("1D4ED8"))

Để biểu diễn miền nghiệm của hệ bất phương trình bậc nhất hai ẩn trên mặt phẳng tọa độ, ta thực hiện tuần tự các bước sau:

#step-box("1", [Vẽ các đường thẳng là bờ của các nửa mặt phẳng tương ứng với từng bất phương trình trong hệ.])
#step-box("2", [Đối với từng bất phương trình, chọn một điểm thử $M(x_0; y_0)$ không nằm trên bờ (thường chọn gốc tọa độ $O(0;0)$ nếu bờ không đi qua $O$).])
#step-box("3", [Tính giá trị biểu thức tại điểm thử và xác định miền nghiệm của bất phương trình đó. *Gạch bỏ* phần nửa mặt phẳng không chứa miền nghiệm.])
#step-box("4", [Phần mặt phẳng *không bị gạch* (kể cả bờ hoặc không kể bờ) sau khi thực hiện cho tất cả các bất phương trình chính là miền nghiệm của hệ cần tìm.])

#warning-box("Lưu ý về biên (bờ):", [Nếu bất phương trình có chứa dấu "=" (tức là $<=$ hoặc $>=$) thì miền nghiệm sẽ chứa cả đường biên (thường vẽ nét liền). Nếu bất phương trình là ngoặc nhọn nghiêm ngặt ($<$ hoặc $>$), miền nghiệm không chứa đường biên (thường vẽ bằng nét đứt).])

#pagebreak()
#section-heading("4", "VÍ DỤ BIỂU DIỄN MIỀN NGHIỆM", color: rgb("1D4ED8"))

#example-box("Ví dụ 1:", [Biểu diễn miền nghiệm của hệ bất phương trình sau:
$ cases(
  x - y > 0 quad (1),
  x - 3y <= -3 quad (2),
  x + y > 5 quad (3)
) $
])

*Giải:*
- *Vẽ đường thẳng $d_1: x - y = 0$:* Đi qua $O(0;0)$ và $A(1;1)$. Lấy điểm thử $M(1;0) => 1 - 0 = 1 > 0$ (Đúng). Miền nghiệm chứa $M(1;0)$. Ta gạch bỏ phần nửa mặt phẳng không chứa $M(1;0)$. (Đường $d_1$ vẽ nét đứt).
- *Vẽ đường thẳng $d_2: x - 3y = -3$:* Đi qua $(-3;0)$ và $(0;1)$. Lấy điểm $O(0;0) => 0 - 0 = 0 <= -3$ (Sai). Miền nghiệm không chứa $O$. Gạch phần chứa $O$.
- *Vẽ đường thẳng $d_3: x + y = 5$:* Đi qua $(5;0)$ và $(0;5)$. Lấy điểm $O(0;0) => 0 + 0 = 0 > 5$ (Sai). Gạch phần chứa $O$.

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Grid và Trục tọa độ
    grid((-2, -1), (6, 5), stroke: (paint: gray.lighten(70%), thickness: 0.5pt))
    line((-2.5, 0), (6.5, 0), mark: (end: ">")) // Ox
    content((6.5, -0.3), [$x$])
    line((0, -1.5), (0, 5.5), mark: (end: ">")) // Oy
    content((-0.3, 5.5), [$y$])
    content((-0.3, -0.3), [$O$])
    
    // Đường d1: x - y = 0 => y = x
    line((-1, -1), (5, 5), stroke: (dash: "dashed", paint: red))
    content((5.5, 5), text(fill: red)[$d_1: x - y = 0$])
    
    // Đường d2: x - 3y = -3 => y = (x+3)/3
    line((-2, 1/3), (6, 3), stroke: blue)
    content((6.2, 3.2), text(fill: blue)[$d_2: x - 3y = -3$])
    
    // Đường d3: x + y = 5 => y = -x + 5
    line((0.5, 4.5), (5.5, -0.5), stroke: (dash: "dashed", paint: green))
    content((4, -0.8), text(fill: green)[$d_3: x + y = 5$])

    // Đánh dấu giao điểm tạo thành miền nghiệm
    // Giao d2 và d3: x - 3y = -3, x + y = 5 => x = 3, y = 2
    circle((3, 2), radius: 0.05, fill: black)
    content((3, 2.3), [$A(3;2)$])
    
    // Giao d1 và d2: x - y = 0, x - 3y = -3 => x = 3/2, y = 3/2
    circle((1.5, 1.5), radius: 0.05, fill: black)
    content((1.3, 1.7), [$B(3/2;3/2)$])
    
    // Giao d1 và d3: x - y = 0, x + y = 5 => x = 5/2, y = 5/2
    circle((2.5, 2.5), radius: 0.05, fill: black)
    content((2.5, 2.8), [$C(5/2;5/2)$])

    // Miền nghiệm là tam giác ABC
    line((3, 2), (1.5, 1.5), (2.5, 2.5), close: true, fill: rgb("0000FF11"), stroke: none)
    content((2.3, 2.0), text(fill: rgb("0000FF"), weight: "bold")[Miền\nnghiệm])
  })
]

*Kết luận:* Phần mặt phẳng tô màu (miền đa giác $A B C$) giới hạn bởi ba đường thẳng chính là miền nghiệm của hệ (không bao gồm hai biên nét đứt $A B$ và $A C$).

#section-heading("5", "ỨNG DỤNG VÀO BÀI TOÁN TỐI ƯU THỰC TẾ", color: rgb("1D4ED8"))

#def-box[
  *Định lí:* Cho một miền đa giác (khép kín hoặc không). Biểu thức $F(x, y) = a x + b y$ luôn đạt giá trị lớn nhất và nhỏ nhất tại một trong *các đỉnh của đa giác* đó.
]

Để giải quyết bài toán tối ưu (tìm GTLN, GTNN) trong thực tế:
1. *Lập hệ điều kiện:* Đặt ẩn (gọi $x, y$), thiết lập hệ bất phương trình ràng buộc dựa trên giả thiết và thiết lập hàm mục tiêu $F(x, y) = a x + b y$.
2. *Tìm miền nghiệm:* Vẽ và xác định miền đa giác nghiệm của hệ.
3. *Tìm tọa độ các đỉnh:* Giải các hệ phương trình tọa độ giao điểm của các biên để tìm tọa độ các đỉnh của đa giác.
4. *Kết luận:* Thay tọa độ các đỉnh vào hàm mục tiêu $F(x, y)$. Đỉnh nào cho giá trị lớn nhất/nhỏ nhất chính là kết quả bài toán.

#pagebreak()
#section-heading("6", "HỆ THỐNG BÀI TẬP PHÂN LOẠI 4 DẠNG", color: rgb("1D4ED8"))

#example-box("Dạng 1: Kiểm tra một điểm có thuộc miền nghiệm của hệ BPT hay không", [
*Câu 1:* Điểm $M(1; -1)$ là nghiệm của hệ bất phương trình nào sau đây?
- *A.* $cases(x + y >= 0, x - y > 1)$
- *B.* $cases(2x - y < 0, x + 3y > -2)$
- *C.* $cases(x - y > 0, 2x + y <= 1)$
- *D.* $cases(x > 0, y > 0)$
])

*Hướng dẫn:* Thay tọa độ điểm $x = 1, y = -1$ vào lần lượt các hệ. 
Xét hệ A: $1 + (-1) = 0 >= 0$ (Đúng), $1 - (-1) = 2 > 1$ (Đúng). Vậy A là đáp án.

#example-box("Dạng 2: Biểu diễn miền nghiệm của hệ BPT", [
*Câu 2:* Phần mặt phẳng không bị gạch chéo trong hình vẽ (kể cả bờ) là biểu diễn hình học miền nghiệm của hệ bất phương trình nào?
*(Dành cho học sinh quan sát đồ thị và nhận diện đường biên - Học sinh tự luyện)*
])

#example-box("Dạng 3: Bài toán ngược – Tìm hệ BPT từ miền nghiệm", [
*Câu 3:* Cho miền đa giác $O A B C$. Tìm hệ bất phương trình bậc nhất hai ẩn có miền nghiệm chính là đa giác đó (kể cả bờ).
*(Phương pháp: Tìm phương trình của các đường thẳng đi qua các cạnh của đa giác, sau đó thử tọa độ một điểm nằm trong đa giác để xác định chiều của bất đẳng thức).*
])

#example-box("Dạng 4: Tối ưu hóa (Bài toán kinh tế - thực tế)", [
*Câu 4:* Giải quyết bài toán Xưởng mộc ở Tình huống mở đầu.
*Hướng dẫn giải:*
- Hệ BPT điều kiện:
$ cases(
  2x + y <= 10,
  x + 2y <= 8,
  x >= 0,
  y >= 0
) $
- Biểu diễn hệ lên trục tọa độ, ta thu được tứ giác $O A B C$ với các đỉnh:
$O(0;0), A(5;0), B(4;2), C(0;4)$ (Đỉnh $B$ là giao của 2 đường $2x+y=10$ và $x+2y=8$).
- Hàm lợi nhuận (nghìn đồng): $F(x,y) = 500x + 400y$.
- Tính giá trị tại các đỉnh:
  - $F(O) = 0$
  - $F(A) = 500(5) + 0 = 2500$
  - $F(B) = 500(4) + 400(2) = 2800$ (Lớn nhất)
  - $F(C) = 0 + 400(4) = 1600$
- Vậy xưởng cần sản xuất 4 Bàn làm việc và 2 Bàn ăn mỗi ngày để có lãi lớn nhất là 2.800.000 đồng.
])

#align(center)[--- HẾT ---]
