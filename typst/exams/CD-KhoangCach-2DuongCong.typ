#import "../template.typ": *
#import "../sang-exam.typ": vect, tfrac
#import "@preview/cetz:0.5.2": canvas
#import "@preview/cetz-plot:0.1.4": plot

#let False(body) = (body: body, correct: false)

#show: stexgv-doc.with(
  doc-type: "chuyende",
  title: [Khoảng cách nhỏ nhất giữa hai đối tượng],
  subtitle: [Phương pháp Tiếp tuyến song song & Mô hình hóa Toán học],
  author: "GV Nguyễn Văn Sang",
  institution: "Tổ Toán - Tài liệu Chuyên môn sâu",
  subject: "Toán học 12",
  grade: "Lớp 12",
  series: "Chuyên đề Ôn thi Tốt nghiệp THPT",
  academic-year: "2025-2026",
  show-cover: true,
  show-outline: true,
)

#gioithieu[
  Tài liệu này hệ thống hóa phương pháp giải bài toán tìm khoảng cách ngắn nhất giữa hai đối tượng hình học không giao nhau (đường cong với đường thẳng, hoặc hai đường cong rời nhau). Đây là một chủ đề thường xuất hiện trong các câu hỏi vận dụng cao và mô hình hóa toán học thực tế của đề thi tốt nghiệp THPT mới.
]

#muctieuchung[
  - *Về kiến thức:* Hiểu rõ bản chất hình học của bài toán tối ưu khoảng cách (nguyên lý pháp tuyến chung và cặp tiếp tuyến song song).
  - *Về kỹ năng:* Biết cách lập trình mô hình hóa các bài toán thực tế thành các hàm số đại số, sử dụng đạo hàm để tìm tọa độ các điểm tối ưu.
  - *Về tư duy:* Rèn luyện kỹ năng giải toán thực tế, kiểm tra điều kiện không cắt nhau trước khi giải bài toán tối ưu.
]

#part([Cơ sở lý thuyết & Phương pháp Tiếp tuyến song song])

#chapter([Nguyên lý Pháp tuyến chung và Tiếp tuyến song song])

#lythuyet[
  Cho hai đường cong $(C_1)$ và $(C_2)$ *không cắt nhau* trên mặt phẳng tọa độ $O x y$. Khoảng cách giữa một điểm $A in (C_1)$ và một điểm $B in (C_2)$ đạt giá trị nhỏ nhất khi và chỉ khi đoạn thẳng $A B$ là *pháp tuyến chung* của cả hai đường cong. 
  
  Điều này đồng nghĩa với việc các tiếp tuyến tại $A$ và $B$ lần lượt song song với nhau và cùng vuông góc với đường thẳng $A B$.
]

#section([Trường hợp 1: Khoảng cách từ Đường cong $(C): y = f(x)$ đến Đường thẳng $d: a x - y + b = 0$])

#phuongphap[
  Để tìm khoảng cách nhỏ nhất giữa đường cong $(C)$ và đường thẳng $d$, ta thực hiện theo các bước sau:
  
  - *Bước 1:* Viết phương trình đường thẳng $d$ dưới dạng tổng quát: $d: a x - y + b = 0$ (hệ số góc $k = a$).
  - *Bước 2:* Gọi $M_0(x_0, y_0) in (C)$ là điểm trên đường cong sao cho tiếp tuyến tại $M_0$ song song với $d$. Giải phương trình đạo hàm:
    $ f'(x_0) = a => x_0 $
    Từ đó tính $y_0 = f(x_0)$ thu được tọa độ điểm $M_0$.
  - *Bước 3:* Tính khoảng cách nhỏ nhất bằng công thức khoảng cách từ điểm $M_0$ đến đường thẳng $d$:
    $ d_min = d(M_0, d) = frac(|a x_0 - y_0 + b|, sqrt(a^2 + 1)) $
]

#align(center)[
  #canvas({
    plot.plot(
      size: (4.5, 4.5),
      x-min: -2.5, x-max: 2.5,
      y-min: -2.5, y-max: 2.5,
      x-tick-step: 1, y-tick-step: 1,
      x-equal: "y",
      axis-style: "school-book",
      {
        // Đường cong y = x^2
        plot.add(domain: (-1.5, 1.5), x => x*x,
          style: (stroke: (paint: rgb("#1565C0"), thickness: 1.6pt)),
          label: [$(C)$])
        // Đường thẳng d: y = x - 2
        plot.add(domain: (-0.5, 2.5), x => x - 2,
          style: (stroke: (paint: rgb("#D84315"), thickness: 1.5pt)),
          label: [$d$])
        // Tiếp tuyến t: y = x - 0.25
        plot.add(domain: (-1.0, 2.0), x => x - 0.25,
          style: (stroke: (paint: rgb("#43A047"), thickness: 1pt, dash: "dashed")),
          label: [$t$])
        // Đoạn vuông góc nối M0(0.5, 0.25) đến H(1.375, -0.625)
        plot.add(((0.5, 0.25), (1.375, -0.625)),
          style: (stroke: (paint: rgb("#F57F17"), thickness: 1.4pt)))
        // Điểm M0
        plot.add(((0.5, 0.25),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#1565C0")), mark-size: 0.18, label: [$M_0$])
        // Điểm H
        plot.add(((1.375, -0.625),), style: (stroke: none), mark: "x",
          mark-style: (fill: rgb("#F57F17"), stroke: (paint: rgb("#F57F17"), thickness: 1pt)),
          mark-size: 0.18)
      }
    )
  })
  #v(0.3em)
  #text(size: 9.5pt, style: "italic")[Hình minh họa: Nguyên lý tiếp tuyến song song và pháp tuyến chung.]
]

#section([Trường hợp 2: Khoảng cách giữa hai Đường cong $(C_1): y = f(x)$ và $(C_2): y = g(x)$])

#phuongphap[
  Để tìm khoảng cách nhỏ nhất giữa hai đường cong rời nhau $(C_1)$ và $(C_2)$, ta thực hiện:
  
  - *Bước 1:* Gọi $A(x_A, f(x_A)) in (C_1)$ và $B(x_B, g(x_B)) in (C_2)$.
  - *Bước 2:* Ép hai tiếp điểm song song nhau:
    $ f'(x_A) = g'(x_B) $
    Bằng cách đặt hệ số góc chung $k = f'(x_A) = g'(x_B)$, ta thiết lập mối quan hệ giữa $x_A$ và $x_B$.
  - *Bước 3:* Dùng điều kiện $A B$ vuông góc với tiếp tuyến tại $A$ (và $B$):
    $ vect(A B) dot vect(u) = 0 <=> (x_B - x_A) + (g(x_B) - f(x_A)) dot f'(x_A) = 0 $
    Giải phương trình để tìm tọa độ cụ thể của $A$ và $B$.
  - *Bước 4:* Khoảng cách nhỏ nhất chính là độ dài đoạn $A B$: $d_min = |A B|$.
]

#part([Các dạng toán thực tế tiêu biểu])

#chapter([Khoảng cách từ Đường cong đến Đường thẳng])

#vd(
  [*(Quy hoạch ranh giới an toàn giữa đường cao tốc và khu bảo tồn - Quartic & Line)*
    Trong một dự án quy hoạch đô thị sinh thái, một tuyến đường cao tốc chạy thẳng được mô hình hóa bằng đường thẳng $d: y = 7x - 11$. Ranh giới hành lang xanh bao quanh hồ nước nhân tạo có dạng đồ thị hàm số bậc bốn $(C): y = frac(1, 4)x^4 - x + 5$ (đơn vị trên bản đồ tương ứng với 100 m). Hãy chứng minh tuyến đường và hồ nước không giao nhau để tránh ngập lụt, đồng thời xác định khoảng cách ngắn nhất giữa chúng để thiết kế đai rừng phòng hộ.
  ],
  loigiai: [
    *Bước 1: Kiểm tra tính không giao cắt của tuyến đường và ranh giới hồ.*
    Xét phương trình hoành độ giao điểm của $(C)$ và $d$:
    $ frac(1, 4)x^4 - x + 5 = 7x - 11 <=> frac(1, 4)x^4 - 8x + 16 = 0 <=> x^4 - 32x + 64 = 0 $
    Xét hàm số $f(x) = x^4 - 32x + 64$ trên $RR$.
    Đạo hàm: $f'(x) = 4x^3 - 32$.
    Cho $f'(x) = 0 <=> 4x^3 = 32 <=> x^3 = 8 <=> x = 2$.
    Bảng biến thiên của $f(x)$ cho thấy hàm số nghịch biến trên $(-infinity, 2)$ và đồng biến trên $(2, +infinity)$. Do đó, $f(x)$ đạt giá trị nhỏ nhất tại điểm cực tiểu $x_0 = 2$.
    Giá trị nhỏ nhất: $f(2) = 2^4 - 32 dot 2 + 64 = 16 > 0$.
    Vì giá trị nhỏ nhất của $f(x)$ lớn hơn $0$ nên phương trình $f(x) = 0$ vô nghiệm.
    Hai đối tượng hoàn toàn không cắt nhau và đường cong $(C)$ nằm hoàn toàn phía trên đường thẳng $d$.
    
    *Bước 2: Tìm tọa độ điểm gần đường thẳng nhất trên đường cong.*
    Điểm $M_0(x_0, y_0) in (C)$ có khoảng cách ngắn nhất đến $d$ khi tiếp tuyến tại $M_0$ song song với đường thẳng $d$.
    Đường thẳng $d$ có hệ số góc $a = 7$.
    Lập phương trình đạo hàm:
    $ y'(x_0) = x_0^3 - 1 = 7 <=> x_0^3 = 8 <=> x_0 = 2 $
    Thay $x_0 = 2$ vào phương trình đường cong $(C)$ ta được:
    $ y_0 = frac(1, 4) dot 2^4 - 2 + 5 = 4 - 2 + 5 = 7 $
    Vậy điểm tối ưu trên ranh giới hồ nước là $M_0(2, 7)$.
    
    *Bước 3: Tính khoảng cách nhỏ nhất.*
    Phương trình đường thẳng $d$ dưới dạng tổng quát: $7x - y - 11 = 0$.
    Khoảng cách ngắn nhất là khoảng cách từ điểm $M_0(2, 7)$ đến đường thẳng $d$:
    $ d_min = d(M_0, d) = frac(|7.2 - 7 - 11|, sqrt(7^2 + (-1)^2)) = frac(|14 - 18|, sqrt(50)) = frac(4, 5sqrt(2)) = frac(2sqrt(2), 5) text(" (đơn vị bản đồ)") $
    Vì 1 đơn vị tương ứng với 100 m, khoảng cách thực tế tối thiểu là:
    $ d_"thực" = frac(2sqrt(2), 5) dot 100 = 40sqrt(2) approx 56.57 text(" (m)") $
    
    *Kết luận:* Khoảng cách thực tế ngắn nhất là $40sqrt(2) approx 56.57$ m, trạm quan trắc hoặc điểm bắt đầu đai rừng phòng hộ đặt tại điểm có tọa độ $M_0(2, 7)$ trên ranh giới hồ nước.
  ]
)

#align(center)[
  #canvas({
    plot.plot(
      size: (4.5, 4.5),
      x-min: -1.0, x-max: 9.0,
      y-min: -1.0, y-max: 9.0,
      x-tick-step: 2, y-tick-step: 2,
      x-equal: "y",
      axis-style: "school-book",
      {
        plot.add(domain: (-0.5, 2.2), x => 1/4*x*x*x*x - x + 5,
          style: (stroke: (paint: rgb("#1565C0"), thickness: 1.6pt)),
          label: [Ranh giới $(C)$])
        plot.add(domain: (1.4, 2.8), x => 7*x - 11,
          style: (stroke: (paint: rgb("#795548"), thickness: 1.5pt)),
          label: [Đường $d$])
        plot.add(domain: (1.0, 2.2), x => 7*x - 7,
          style: (stroke: (paint: rgb("#43A047"), thickness: 1pt, dash: "dashed")),
          label: [Tiếp tuyến $t$])
        // Đoạn vuông góc nối M0(2, 7) đến H(2.56, 6.92)
        plot.add(((2.0, 7.0), (2.56, 6.92)),
          style: (stroke: (paint: rgb("#F57F17"), thickness: 1.4pt)))
        plot.add(((2.0, 7.0),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#1565C0")), mark-size: 0.18, label: [$M_0$])
        plot.add(((2.56, 6.92),), style: (stroke: none), mark: "x",
          mark-style: (fill: rgb("#F57F17"), stroke: (paint: rgb("#F57F17"), thickness: 1pt)),
          mark-size: 0.18)
      }
    )
  })
]

#vd(
  [*(Thiết kế đập ngăn mặn và tuyến luồng hành hải - Cubic có miền giới hạn)*
    Một đoạn đập ngăn nước mặn được xây dựng dọc theo bờ sông uốn khúc có hình dạng đồ thị hàm số bậc ba $(C): y = frac(1, 3)x^3 - x^2 + 2$ với miền khảo sát giới hạn $x >= 2$ (đơn vị: chục mét). Tuyến luồng chạy của tàu cao tốc chở khách du lịch được thiết lập chạy dọc theo đường thẳng thẳng đứng nghiêng $d: y = 3x - 10$ (chục mét). Hãy xác định khoảng cách ngắn nhất từ đập ngăn mặn đến tuyến luồng hành hải để đảm bảo an toàn giao thông thủy.
  ],
  loigiai: [
    *Bước 1: Chứng minh đập ngăn mặn và tuyến luồng tàu không cắt nhau trên miền khảo sát.*
    Xét phương trình hoành độ giao điểm của $(C)$ và $d$ với điều kiện $x >= 2$:
    $ frac(1, 3)x^3 - x^2 + 2 = 3x - 10 <=> x^3 - 3x^2 - 9x + 36 = 0 $
    Khảo sát hàm số $g(x) = x^3 - 3x^2 - 9x + 36$ trên nửa khoảng $[2, +infinity)$.
    Đạo hàm: $g'(x) = 3x^2 - 6x - 9$.
    Cho $g'(x) = 0 <=> 3(x^2 - 2x - 3) = 0 <=> x = 3$ (thỏa mãn $x >= 2$) hoặc $x = -1$ (loại).
    Lập bảng biến thiên trên $[2, +infinity)$:
    - Hàm số nghịch biến trên $[2, 3)$.
    - Hàm số đồng biến trên $(3, +infinity)$.
    Do đó, trên miền $x >= 2$, giá trị nhỏ nhất của $g(x)$ là:
    $ g_min = g(3) = 3^3 - 3.3^2 - 9.3 + 36 = 9 > 0 $
    Vì giá trị nhỏ nhất dương nên phương trình vô nghiệm trên miền $x >= 2$.
    Hai tuyến hoàn toàn không giao cắt và đập nằm ở phía trên tuyến luồng tàu.
    
    *Bước 2: Xác định điểm trên đập gần tuyến luồng nhất.*
    Điểm $M_0(x_0, y_0) in (C)$ có khoảng cách ngắn nhất khi đạo hàm của hàm số tại đó bằng hệ số góc của $d$ (bằng $3$):
    $ y'(x_0) = x_0^2 - 2x_0 = 3 <=> x_0^2 - 2x_0 - 3 = 0 $
    Giải phương trình bậc hai này, chọn nghiệm thỏa mãn điều kiện $x_0 >= 2$:
    $ x_0 = 3 $
    Tọa độ tung độ tương ứng:
    $ y_0 = frac(1, 3) dot 3^3 - 3^2 + 2 = 9 - 9 + 2 = 2 $
    Suy ra tọa độ điểm tối ưu trên bờ kè đập ngăn mặn là $M_0(3, 2)$.
    
    *Bước 3: Tính khoảng cách ngắn nhất.*
    Khoảng cách từ điểm $M_0(3, 2)$ đến đường thẳng $d: 3x - y - 10 = 0$ bằng:
    $ d_min = d(M_0, d) = frac(|3.3 - 2 - 10|, sqrt(3^2 + (-1)^2)) = frac(|9 - 12|, sqrt(10)) = frac(3, sqrt(10)) = frac(3sqrt(10), 10) text(" (chục mét)") $
    Khoảng cách thực tế tối thiểu là:
    $ d_"thực" = frac(3sqrt(10), 10) dot 10 = 3sqrt(10) approx 9.49 text(" (m)") $
    
    *Kết luận:* Tuyến đập ngăn mặn cách tuyến luồng tàu cao tốc một khoảng tối thiểu là $3sqrt(10) approx 9.49$ m, đạt được tại vị trí đập có tọa độ $M_0(3, 2)$.
  ]
)

#align(center)[
  #canvas({
    plot.plot(
      size: (4.5, 4.5),
      x-min: -1.0, x-max: 6.0,
      y-min: -1.0, y-max: 6.0,
      x-tick-step: 1, y-tick-step: 1,
      x-equal: "y",
      axis-style: "school-book",
      {
        plot.add(domain: (2.0, 3.7), x => 1/3*x*x*x - x*x + 2,
          style: (stroke: (paint: rgb("#1565C0"), thickness: 1.6pt)),
          label: [Bờ kè đập $(C)$])
        plot.add(domain: (2.0, 5.0), x => 3*x - 10,
          style: (stroke: (paint: rgb("#795548"), thickness: 1.5pt)),
          label: [Luồng hành hải $d$])
        plot.add(domain: (1.5, 4.3), x => 3*x - 7,
          style: (stroke: (paint: rgb("#43A047"), thickness: 1pt, dash: "dashed")),
          label: [Tiếp tuyến $t$])
        // Đoạn vuông góc nối M0(3, 2) đến H(3.9, 1.7)
        plot.add(((3.0, 2.0), (3.9, 1.7)),
          style: (stroke: (paint: rgb("#F57F17"), thickness: 1.4pt)))
        plot.add(((3.0, 2.0),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#1565C0")), mark-size: 0.18, label: [$M_0$])
        plot.add(((3.9, 1.7),), style: (stroke: none), mark: "x",
          mark-style: (fill: rgb("#F57F17"), stroke: (paint: rgb("#F57F17"), thickness: 1pt)),
          mark-size: 0.18)
      }
    )
  })
]

#v(1em)

#chapter([Khoảng cách giữa hai Đường cong rời nhau])

#vd(
  [*(Thiết kế đai giảm chấn nhiệt giữa đường ống hóa chất và cáp quang ngầm - Parabol và Hyperbol)*
    Trong một công trình ngầm hạ tầng kỹ thuật hóa chất, một tuyến ống dẫn chất lỏng nhiệt độ cao được đặt theo đường cong Parabol $(C_1): y = frac(1, 2)x^2 + frac(1, 2)$ (cho $x > 0$). Một đường dây cáp quang truyền dẫn số chạy song song bên dưới theo quỹ đạo là nhánh Hyperbol $(C_2): y = 2 - frac(4, x)$ (cho $x > 0$). Để bảo vệ sợi cáp quang không bị hư hại bởi nhiệt, hãy xác định khoảng cách ngắn nhất giữa hai đường ống để thiết kế lớp đai cách nhiệt bảo vệ phù hợp.
  ],
  loigiai: [
    *Bước 1: Chứng minh hai đường ống ngầm không giao nhau.*
    Xét phương trình hoành độ giao điểm của hai đồ thị $(C_1)$ và $(C_2)$ trên khoảng $x > 0$:
    $ frac(1, 2)x^2 + frac(1, 2) = 2 - frac(4, x) <=> x^2 + 1 = 4 - frac(8, x) <=> x^2 - 3 + frac(8, x) = 0 <=> x^3 - 3x + 8 = 0 $
    Khảo sát hàm số $h(x) = x^3 - 3x + 8$ với $x > 0$.
    Ta có $h'(x) = 3x^2 - 3 = 0 <=> x = 1$ (do $x > 0$).
    Bảng biến thiên cho thấy $h(x)$ đạt giá trị cực tiểu tại $x = 1$.
    Giá trị cực tiểu: $h_min = h(1) = 1^3 - 3.1 + 8 = 6 > 0$.
    Vì giá trị nhỏ nhất của $h(x)$ dương nên phương trình $h(x) = 0$ vô nghiệm trên khoảng $x > 0$.
    Do đó, đường ống dẫn chất lỏng $(C_1)$ và cáp quang $(C_2)$ hoàn toàn rời nhau.
    
    *Bước 2: Tìm tọa độ hai tiếp điểm có khoảng cách ngắn nhất.*
    Gọi $A(x_A, y_A) in (C_1)$ và $B(x_B, y_B) in (C_2)$ là hai điểm gần nhau nhất.
    Tiếp tuyến tại $A$ và $B$ song song với nhau:
    $ y'_1(x_A) = y'_2(x_B) <=> x_A = frac(4, x_B^2) $
    Đoạn thẳng $A B$ là pháp tuyến chung, tức là vuông góc với tiếp tuyến tại $A$ (có hệ số góc $k = x_A$, tương ứng véc-tơ chỉ phương $vect(u_A) = (1, x_A)$):
    $ vect(A B) dot vect(u_A) = 0 <=> (x_B - x_A) + (y_B - y_A) dot x_A = 0 $
    Đặt $x_B = 2$, suy ra $x_A = frac(4, 2^2) = 1$.
    Thay vào tọa độ hai điểm:
    - $A(1, frac(1, 2) dot 1^2 + frac(1, 2)) = A(1, 1)$.
    - $B(2, 2 - frac(4, 2)) = B(2, 0)$.
    Véc-tơ nối hai điểm: $vect(A B) = B - A = (2 - 1, 0 - 1) = (1, -1)$.
    Hệ số góc của tiếp tuyến tại $A(1, 1)$ là $k_A = y'_1(1) = 1$. Véc-tơ chỉ phương tiếp tuyến tại $A$ là $vect(u_A) = (1, 1)$.
    Kiểm tra tích vô hướng: $vect(A B) dot vect(u_A) = 1 dot 1 + (-1) dot 1 = 0$ (thỏa mãn vuông góc).
    Như vậy, $A(1, 1)$ và $B(2, 0)$ chính là cặp tiếp điểm tối ưu có khoảng cách ngắn nhất.
    
    *Bước 3: Tính khoảng cách nhỏ nhất.*
    $ d_min = |A B| = sqrt((2 - 1)^2 + (0 - 1)^2) = sqrt(2) text(" (m)") $
    
    *Kết luận:* Khoảng cách ngắn nhất giữa đường ống chất lỏng và cáp quang ngầm là $sqrt(2) approx 1.41$ mét, đạt được giữa điểm $A(1, 1)$ trên ống chất lỏng và điểm $B(2, 0)$ trên đường cáp quang.
  ]
)

#align(center)[
  #canvas({
    plot.plot(
      size: (4.5, 4.5),
      x-min: -2.0, x-max: 4.0,
      y-min: -2.0, y-max: 4.0,
      x-tick-step: 1, y-tick-step: 1,
      x-equal: "y",
      axis-style: "school-book",
      {
        plot.add(domain: (-1.0, 2.5), x => 0.5*x*x + 0.5,
          style: (stroke: (paint: rgb("#1565C0"), thickness: 1.6pt)),
          label: [Ống nhiệt $(C_1)$])
        plot.add(domain: (1.0, 4.0), x => 2 - 4/x,
          style: (stroke: (paint: rgb("#795548"), thickness: 1.5pt)),
          label: [Cáp quang $(C_2)$])
        plot.add(domain: (-0.5, 2.5), x => x,
          style: (stroke: (paint: rgb("#43A047"), thickness: 1pt, dash: "dashed")),
          label: [Tiếp tuyến $t_A$])
        plot.add(domain: (0.5, 3.5), x => x - 2,
          style: (stroke: (paint: rgb("#43A047"), thickness: 1pt, dash: "dashed")),
          label: [Tiếp tuyến $t_B$])
        // Đoạn vuông góc nối A(1, 1) đến B(2, 0)
        plot.add(((1.0, 1.0), (2.0, 0.0)),
          style: (stroke: (paint: rgb("#F57F17"), thickness: 1.4pt)))
        plot.add(((1.0, 1.0),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#1565C0")), mark-size: 0.18, label: [$A$])
        plot.add(((2.0, 0.0),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#795548")), mark-size: 0.18, label: [$B$])
      }
    )
  })
]

#vd(
  [*(Thiết kế vành đai bảo an đảo san hô và tuyến cáp ngầm - Parabol và Đường tròn)*
    Trong một dự án lắp đặt hạ tầng năng lượng biển, một tuyến cáp điện lực ngầm cao thế được thi công theo hướng quỹ đạo là đường Parabol $(C_1): y = x^2 + 1$. Một đảo san hô cần được bảo tồn nghiêm ngặt có vành đai bảo an thiết lập bằng đường tròn $(C_2): (x-5)^2 + y^2 = 5$. Hãy xác định khoảng cách ngắn nhất từ tuyến cáp ngầm này đến vành đai bảo an của đảo san hô để lập phương án thi công an toàn.
  ],
  loigiai: [
    *Bước 1: Quy giản bài toán về tối ưu khoảng cách tới tâm đường tròn.*
    Đường tròn $(C_2)$ có tâm $I(5, 0)$ và bán kính $R = sqrt(5)$.
    Khoảng cách từ một điểm $M(x, x^2 + 1)$ trên Parabol $(C_1)$ đến điểm $N$ trên đường tròn $(C_2)$ ngắn nhất khi và chỉ khi $M, N, I$ thẳng hàng theo thứ tự đó. Lúc này, khoảng cách ngắn nhất là:
    $ d_min = d(M_0, I) - R $
    với $M_0$ là điểm thuộc Parabol $(C_1)$ gần tâm $I$ nhất.
    
    *Bước 2: Tìm điểm cực tiểu trên Parabol.*
    Xét bình phương khoảng cách từ $M(x, x^2 + 1) in (C_1)$ đến tâm $I(5, 0)$:
    $ g(x) = M I^2 = (x - 5)^2 + (x^2 + 1 - 0)^2 = (x - 5)^2 + (x^2 + 1)^2 = x^4 + 3x^2 - 10x + 26 $
    Khảo sát hàm số $g(x)$ trên $RR$.
    Đạo hàm:
    $ g'(x) = 4x^3 + 6x - 10 = 2(x - 1)(2x^2 + 2x + 5) $
    Xét phương trình bậc hai $2x^2 + 2x + 5 = 0$ có $Delta' = 1 - 10 = -9 < 0$ (vô nghiệm).
    Do đó, phương trình đạo hàm $g'(x) = 0$ chỉ có duy nhất một nghiệm thực $x_0 = 1$.
    Bảng biến thiên cho thấy $g(x)$ đạt giá trị nhỏ nhất tại $x_0 = 1$.
    Tọa độ điểm tối ưu trên Parabol $(C_1)$ là:
    $ M_0(1, 1^2 + 1) = M_0(1, 2) $
    
    *Bước 3: Tính khoảng cách ngắn nhất.*
    Khoảng cách từ $M_0(1, 2)$ đến tâm $I(5, 0)$ là:
    $ M_0 I = sqrt((1 - 5)^2 + (2 - 0)^2) = sqrt((-4)^2 + 2^2) = sqrt(20) = 2sqrt(5) $
    Vì $M_0 I = 2sqrt(5) > R = sqrt(5)$ nên Parabol hoàn toàn nằm bên ngoài đường tròn.
    Khoảng cách ngắn nhất từ tuyến cáp đến ranh giới vành đai bảo an đảo là:
    $ d_min = M_0 I - R = 2sqrt(5) - sqrt(5) = sqrt(5) text(" (đơn vị dài)") $
    
    *Kết luận:* Khoảng cách tối thiểu từ tuyến cáp cao thế đến vành đai bảo an đảo san hô là $sqrt(5) approx 2.24$ đơn vị dài, đạt được giữa điểm $M_0(1, 2)$ trên cáp ngầm và điểm $N_0(3, 1)$ trên ranh giới vành đai.
  ]
)

#align(center)[
  #canvas({
    plot.plot(
      size: (4.5, 4.5),
      x-min: -3.0, x-max: 8.0,
      y-min: -3.0, y-max: 8.0,
      x-tick-step: 2, y-tick-step: 2,
      x-equal: "y",
      axis-style: "school-book",
      {
        plot.add(domain: (-1.8, 2.5), x => x*x + 1,
          style: (stroke: (paint: rgb("#1565C0"), thickness: 1.6pt)),
          label: [Cáp ngầm $(C_1)$])
        
        // Vẽ đường tròn (C2) bằng mảng điểm
        let circle-points = range(0, 101).map(i => {
          let t = i * 2 * calc.pi / 100;
          (5 + calc.sqrt(5) * calc.cos(t), calc.sqrt(5) * calc.sin(t))
        })
        plot.add(circle-points,
          style: (stroke: (paint: rgb("#D84315"), thickness: 1.5pt)),
          label: [Vành đai $(C_2)$])
          
        // Đoạn vuông góc nối M0(1, 2) đến tâm I(5, 0) đi qua N0(3, 1)
        plot.add(((1.0, 2.0), (5.0, 0.0)),
          style: (stroke: (paint: rgb("#F57F17"), thickness: 1.4pt)))
        plot.add(((1.0, 2.0),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#1565C0")), mark-size: 0.18, label: [$M_0$])
        plot.add(((3.0, 1.0),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#D84315")), mark-size: 0.18, label: [$N_0$])
        plot.add(((5.0, 0.0),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#D84315")), mark-size: 0.18, label: [$I$])
      }
    )
  })
]

#vd(
  [*(Hành lang an toàn giữa hai tuyến cáp treo tải điện cao thế - Hai Parabol lệch tâm)*
    Trong xây dựng lưới điện quốc gia đi qua thung lũng đồi, người ta lắp đặt hai tuyến dây cáp tải điện song song uốn cong. Tuyến cáp phía trên có thiết kế mô hình hóa bằng parabol $(C_1): y = frac(1, 2)x^2 + 3.5$ (với $x in [-1, 3]$). Tuyến cáp phía dưới có dạng parabol $(C_2): y = -frac(1, 2)x^2 + 4x - 5.5$ (với $x in [1, 5]$). Hãy xác định vị trí và khoảng cách ngắn nhất giữa hai tuyến dây cáp điện lực này để đảm bảo an toàn phóng điện giữa hai pha độc lập.
  ],
  loigiai: [
    *Bước 1: Chứng minh hai tuyến dây cáp không chạm nhau.*
    Xét phương trình hoàn#vd(
  [*(Quy hoạch tuyến cáp quang tín hiệu dự phòng và vành đai sinh thái - Hàm Mũ và Hàm Logarit đối xứng)*
    Trong một dự án xây dựng hành lang viễn thông ngầm sinh thái xuyên rừng phòng hộ, tuyến cáp quang tín hiệu chính được thiết kế theo ranh giới đồ thị hàm mũ $(C_1): y = e^{x-1} + 1$. Nhánh cáp quang tín hiệu phụ dự phòng được quy hoạch theo ranh giới đối xứng qua ranh giới hành lang tự nhiên là đường cong $(C_2): y = ln(x - 1) + 1$ (với $x > 1$). Hãy chứng minh hai ranh giới này không giao nhau và tìm khoảng cách ngắn nhất giữa hai tuyến cáp ngầm này.
  ],
  loigiai: [
    *Bước 1: Nhận xét tính chất đối xứng đồ thị.*
    Hàm số $y = ln(x - 1) + 1$ xác định trên $(1, +infinity)$ có hàm số ngược là:
    $ y - 1 = ln(x - 1) <=> x - 1 = e^(y - 1) <=> x = e^(y - 1) + 1 $
    Do đó, đồ thị của $(C_2)$ chính là hàm ngược của $(C_1): y = e^{x-1} + 1$.
    Vì thế, hai đồ thị $(C_1)$ và $(C_2)$ đối xứng nhau qua đường phân giác $Delta: y = x$.
    Xét bất đẳng thức phụ: Với mọi $u > 0$, ta luôn có $e^u > u > ln(u)$.
    Đặt $u = x - 1 > 0$, ta có:
    $ e^(x - 1) > x - 1 > ln(x - 1) $
    Cộng thêm 1 vào các vế:
    $ e^(x - 1) + 1 > x > ln(x - 1) + 1 $
    Từ đó suy ra đồ thị $(C_1)$ và $(C_2)$ không bao giờ cắt nhau. Đồ thị $(C_1)$ luôn nằm phía trên đường thẳng $y = x$, còn đồ thị $(C_2)$ luôn nằm phía dưới đường thẳng $y = x$.
    
    *Bước 2: Tìm điểm tối ưu trên đường cong.*
    Do tính chất đối xứng qua đường thẳng $Delta: y = x$, khoảng cách giữa hai đường cong đạt cực tiểu tại điểm $A(x_0, y_0) in (C_1)$ mà tại đó tiếp tuyến của $(C_1)$ song song với trục đối xứng $Delta$ (có hệ số góc $k = 1$).
    Giải phương trình đạo hàm:
    $ y'_1(x_0) = e^(x_0 - 1) = 1 <=> x_0 - 1 = 0 <=> x_0 = 1 $
    Tung độ tiếp điểm tương ứng:
    $ y_0 = e^(1 - 1) + 1 = 2 $
    Suy ra tiếp điểm trên tuyến cáp chính là $A(1, 2)$.
    Do tính đối xứng qua $Delta: y = x$, điểm tương ứng trên nhánh cáp phụ $(C_2)$ là $B(2, 1)$.
    
    *Bước 3: Tính khoảng cách ngắn nhất.*
    Khoảng cách ngắn nhất giữa hai tuyến cáp là độ dài đoạn thẳng $A B$:
    $ d_min = |A B| = sqrt((2 - 1)^2 + (1 - 2)^2) = sqrt(1^2 + (-1)^2) = sqrt(2) text(" (đơn vị dài)") $
    
    *Kết luận:* Khoảng cách ngắn nhất giữa hai tuyến cáp ngầm bằng $sqrt(2) approx 1.41$ đơn vị dài, đạt được giữa điểm $A(1, 2)$ trên tuyến cáp chính $(C_1)$ và điểm $B(2, 1)$ trên nhánh cáp phụ $(C_2)$.
  ]
)

#align(center)[
  #canvas({
    plot.plot(
      size: (4.5, 4.5),
      x-min: -1.0, x-max: 5.0,
      y-min: -1.0, y-max: 5.0,
      x-tick-step: 1, y-tick-step: 1,
      x-equal: "y",
      axis-style: "school-book",
      {
        plot.add(domain: (-1.0, 2.38), x => calc.exp(x - 1) + 1,
          style: (stroke: (paint: rgb("#1565C0"), thickness: 1.6pt)),
          label: [Cáp chính $(C_1)$])
        plot.add(domain: (1.007, 5.0), x => calc.ln(x - 1) + 1,
          style: (stroke: (paint: rgb("#D84315"), thickness: 1.6pt)),
          label: [Cáp phụ $(C_2)$])
        plot.add(domain: (-1.0, 5.0), x => x,
          style: (stroke: (paint: rgb("#9E9E9E"), thickness: 0.9pt, dash: "dashed")),
          label: [$y=x$])
        plot.add(domain: (-0.5, 2.5), x => x + 1,
          style: (stroke: (paint: rgb("#43A047"), thickness: 1pt, dash: "dashed")),
          label: [Tiếp tuyến $t_A$])
        plot.add(domain: (0.5, 3.5), x => x - 1,
          style: (stroke: (paint: rgb("#43A047"), thickness: 1pt, dash: "dashed")),
          label: [Tiếp tuyến $t_B$])
        // Đoạn vuông góc nối A(1, 2) đến B(2, 1)
        plot.add(((1.0, 2.0), (2.0, 1.0)),
          style: (stroke: (paint: rgb("#F57F17"), thickness: 1.4pt)))
        plot.add(((1.0, 2.0),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#1565C0")), mark-size: 0.18, label: [$A$])
        plot.add(((2.0, 1.0),), style: (stroke: none), mark: "o",
          mark-style: (fill: rgb("#D84315")), mark-size: 0.18, label: [$B$])
      }
    )
  })
]

#part([Bài tập tự luyện tổng hợp])

#resetexamstate()

#resetcau()

#exam-part([Trắc nghiệm Khách quan 4 lựa chọn (MCQ)], reset-counter: true)

#mcq(
  [Cho đường cong $(C): y = e^x$ và đường tròn $(S_m): (x-m)^2 + y^2 = 2$ với $m$ là tham số thực. Gọi $d(C, S_m)$ là khoảng cách giữa một điểm tùy ý trên $(C)$ và một điểm tùy ý trên $(S_m)$. Tìm tất cả các giá trị của tham số $m$ để khoảng cách nhỏ nhất $d_min = min d(C, S_m)$ bằng $sqrt(2)$.],
  (
    [$m = frac(1, 2) ln(frac(sqrt(33) - 1, 2)) + frac(sqrt(33) - 1, 2)$],
    [$m = ln(frac(sqrt(33) - 1, 2)) + frac(sqrt(33) - 1, 2)$],
    [$m = frac(1, 2) ln(frac(sqrt(33) + 1, 2)) + frac(sqrt(33) + 1, 2)$],
    [$m = ln(frac(sqrt(33) + 1, 2)) + frac(sqrt(33) - 1, 2)$],
  ),
  correct: (0,),
  loigiai: [
    *Lời giải chi tiết từng bước:*
    
    *Bước 1: Quy giản khoảng cách từ đường cong đến đường tròn về khoảng cách tới tâm.*
    Đường tròn $(S_m)$ có tâm $I(m, 0)$ và bán kính $R = sqrt(2)$.
    Với điểm $M(x, e^x) in (C)$ tùy ý và điểm $N$ tùy ý trên đường tròn $(S_m)$, theo bất đẳng thức tam giác, ta luôn có:
    $ M N >= M I - R $
    Do đó, khoảng cách ngắn nhất giữa $(C)$ và $(S_m)$ đạt được khi điểm $M_0$ trên $(C)$ gần tâm $I$ nhất và $N_0$ là giao điểm của đoạn thẳng $M_0 I$ với đường tròn $(S_m)$.
    Khi đó, khoảng cách nhỏ nhất là:
    $ d_min = M_0 I_min - R $
    Theo bài ra, ta cần $d_min = sqrt(2)$, điều này tương đương với:
    $ M_0 I_min - sqrt(2) = sqrt(2) <=> M_0 I_min = 2sqrt(2) $
    Nghĩa là giá trị nhỏ nhất của khoảng cách $M I$ từ điểm $M(x, e^x) in (C)$ đến tâm $I(m, 0)$ phải bằng $2sqrt(2)$.
    
    *Bước 2: Thiết lập hàm số khoảng cách bình phương và tìm cực trị.*
    Xét bình phương khoảng cách từ điểm $M(x, e^x) in (C)$ đến tâm $I(m, 0)$:
    $ g(x) = M I^2 = (x - m)^2 + (e^x - 0)^2 = (x - m)^2 + e^(2x) $
    Lấy đạo hàm của hàm số $g(x)$ theo biến $x$:
    $ g'(x) = 2(x - m) + 2e^(2x) $
    Hàm số $g(x)$ đạt giá trị nhỏ nhất tại điểm cực tiểu $x_0$ thỏa mãn phương trình đạo hàm bằng 0:
    $ g'(x_0) = 0 <=> 2(x_0 - m) + 2e^(2x_0) = 0 <=> m = x_0 + e^(2x_0) $
    Khảo sát hàm số đại diện cho tham số $h(x) = x + e^(2x)$, ta có $h'(x) = 1 + 2e^(2x) > 0$ với mọi $x in RR$. Do đó, với mỗi giá trị của $m$, phương trình trên luôn có duy nhất một nghiệm thực $x_0$. Lúc này, giá trị nhỏ nhất của $g(x)$ chính là:
    $ g(x_0) = (x_0 - m)^2 + e^(2x_0) $
    Thế $x_0 - m = -e^(2x_0)$ từ phương trình trên vào biểu thức giá trị nhỏ nhất, ta được:
    $ g(x_0) = (-e^(2x_0))^2 + e^(2x_0) = e^(4x_0) + e^(2x_0) $
    
    *Bước 3: Giải phương trình tìm nghiệm và xác định tham số $m$.*
    Theo yêu cầu bài toán, ta cần khoảng cách nhỏ nhất bằng $2sqrt(2)$, tức là bình phương khoảng cách nhỏ nhất bằng 8:
    $ g(x_0) = 8 <=> e^(4x_0) + e^(2x_0) = 8 $
    Đặt ẩn phụ $t = e^(2x_0)$ với điều kiện $t > 0$. Phương trình trở thành phương trình bậc hai:
    $ t^2 + t - 8 = 0 $
    Giải phương trình bậc hai này, ta được nghiệm dương duy nhất:
    $ t = frac(-1 + sqrt(33), 2) $
    Với $e^(2x_0) = frac(sqrt(33) - 1, 2)$, ta suy ra:
    $ 2x_0 = ln(frac(sqrt(33) - 1, 2)) <=> x_0 = frac(1, 2) ln(frac(sqrt(33) - 1, 2)) $
    Thế ngược lại vào biểu thức tính tham số $m$:
    $ m = x_0 + e^(2x_0) = frac(1, 2) ln(frac(sqrt(33) - 1, 2)) + frac(sqrt(33) - 1, 2) $
    Vậy chọn phương án A.
  ]
)

#mcq(
  [Cho đường cong $(C): y = x + frac(2, x - 1)$ với $x > 1$ và đường thẳng $d_m: y = -x + m$ với $m$ là tham số thực. Tìm tất cả các giá trị của tham số $m$ để khoảng cách nhỏ nhất giữa đường cong $(C)$ và đường thẳng $d_m$ bằng $2sqrt(2)$ mà hai đối tượng này không giao nhau.],
  (
    [$m = 2$],
    [$m = 10$],
    [$m = 2 \text{ hoặc } m = 10$],
    [$m = -2$],
  ),
  correct: (0,),
  loigiai: [
    *Lời giải chi tiết từng bước:*
    
    *Bước 1: Tìm tiếp điểm trên đường cong có tiếp tuyến song song với đường thẳng.*
    Đường thẳng $d_m: y = -x + m <=> x + y - m = 0$ có hệ số góc là $a = -1$.
    Gọi $M_0(x_0, y_0) in (C)$ (với $x_0 > 1$) là điểm mà tiếp tuyến tại đó song song với đường thẳng $d_m$.
    Đạo hàm của hàm số đường cong $(C)$:
    $ y' = 1 - frac(2, (x - 1)^2) $
    Giải phương trình đạo hàm bằng hệ số góc của đường thẳng $d_m$:
    $ 1 - frac(2, (x_0 - 1)^2) = -1 <=> frac(2, (x_0 - 1)^2) = 2 <=> (x_0 - 1)^2 = 1 $
    Vì điều kiện miền xác định là $x_0 > 1 => x_0 - 1 > 0$, do đó ta chọn nghiệm:
    $ x_0 - 1 = 1 <=> x_0 = 2 $
    Thay $x_0 = 2$ vào phương trình đường cong $(C)$ để tìm tung độ điểm cực trị khoảng cách:
    $ y_0 = 2 + frac(2, 2 - 1) = 4 $
    Vậy tiếp điểm tối ưu có tọa độ cố định là $M_0(2, 4)$.
    
    *Bước 2: Thiết lập phương trình khoảng cách và giải tìm tham số $m$.*
    Khoảng cách từ điểm $M_0(2, 4)$ đến đường thẳng $d_m: x + y - m = 0$ là:
    $ d(M_0, d_m) = frac(|2 + 4 - m|, sqrt(1^2 + 1^2)) = frac(|6 - m|, sqrt(2)) $
    Theo bài ra, khoảng cách nhỏ nhất này bằng $2sqrt(2)$:
    $ frac(|6 - m|, sqrt(2)) = 2sqrt(2) <=> |6 - m| = 4 <=> 6 - m = 4 \text{ hoặc } 6 - m = -4 $
    $ <=> m = 2 \text{ hoặc } m = 10 $
    
    *Bước 3: Kiểm tra điều kiện không giao nhau của hai đối tượng.*
    - *Trường hợp 1:* Với $m = 2$, đường thẳng là $d_1: y = -x + 2$.
      Xét phương trình hoành độ giao điểm của $(C)$ và $d_1$ trên khoảng $x > 1$:
      $ x + frac(2, x - 1) = -x + 2 <=> 2x - 2 + frac(2, x - 1) = 0 <=> 2(x - 1) + frac(2, x - 1) = 0 $
      Vì $x > 1 => x - 1 > 0$, vế trái của phương trình luôn dương (lớn hơn hoặc bằng 4 theo bất đẳng thức Cô-si). Do đó, phương trình vô nghiệm.
      Vậy với $m = 2$, đường cong và đường thẳng không giao nhau, khoảng cách ngắn nhất thực sự bằng $2sqrt(2)$ (nhận).
    - *Trường hợp 2:* Với $m = 10$, đường thẳng là $d_2: y = -x + 10$.
      Xét phương trình hoành độ giao điểm trên khoảng $x > 1$:
      $ x + frac(2, x - 1) = -x + 10 <=> 2x - 10 + frac(2, x - 1) = 0 <=> 2(x - 1) - 8 + frac(2, x - 1) = 0 $
      $ <=> 2(x - 1)^2 - 8(x - 1) + 2 = 0 <=> (x - 1)^2 - 4(x - 1) + 1 = 0 $
      Phương trình bậc hai theo $(x-1)$ có $Delta' = 4 - 1 = 3 > 0$, cho hai nghiệm thực dương phân biệt:
      $ x - 1 = 2 +- sqrt(3) <=> x = 3 +- sqrt(3) \text{ (cả hai nghiệm đều lớn hơn 1)} $
      Vì phương trình hoành độ giao điểm có nghiệm, nên đường thẳng $d_2$ cắt đường cong $(C)$ tại hai điểm phân biệt. Khoảng cách ngắn nhất giữa chúng bằng $0$ (loại).
      
    Vậy giá trị tham số cần tìm duy nhất là $m = 2$. Chọn phương án A.
  ]
)

#exam-part([Trắc nghiệm Đúng/Sai (True/False)], reset-counter: false)

#tf(
  [Cho hai đường cong $(C_1): y = x^2 + 3$ với $x >= 1$ và $(C_2): y = -x^2 + 2$ với $x >= 1$. Xét tính đúng/sai của các phát biểu sau đây:],
  (
    True([Hai đường cong $(C_1)$ và $(C_2)$ hoàn toàn không cắt nhau trên miền xác định $x >= 1$.]),
    True([Không tồn tại bất kỳ cặp điểm nào thuộc $(C_1)$ và $(C_2)$ trên miền $x >= 1$ có tiếp tuyến song song với nhau.]),
    True([Khoảng cách nhỏ nhất giữa hai đường cong trên miền $x >= 1$ đạt được tại hai đầu mút của miền xác định, tương ứng là $A(1, 4)$ và $B(1, 1)$.]),
    False([Giá trị nhỏ nhất của khoảng cách giữa đường cong $(C_1)$ và đường cong $(C_2)$ trên miền $x >= 1$ bằng $sqrt(10)$.]),
  ),
  loigiai: [
    *Lời giải chi tiết từng bước:*
    
    - *Phát biểu a: Đúng.*
      Xét phương trình hoành độ giao điểm của $(C_1)$ và $(C_2)$ trên miền $x >= 1$:
      $ x^2 + 3 = -x^2 + 2 <=> 2x^2 + 1 = 0 $
      Phương trình vô nghiệm thực vì vế trái luôn lớn hơn hoặc bằng 3 trên miền $x >= 1$.
      Do đó hai đường cong hoàn toàn rời nhau.
    - *Phát biểu b: Đúng.*
      Gọi $A(x_A, x_A^2 + 3)$ và $B(x_B, -x_B^2 + 2)$ với $x_A, x_B >= 1$.
      Hệ số góc của tiếp tuyến tại $A$ là $k_A = y'_1(x_A) = 2x_A$.
      Hệ số góc của tiếp tuyến tại $B$ là $k_B = y'_2(x_B) = -2x_B$.
      Để hai tiếp tuyến song song hoặc trùng nhau, ta cần:
      $ k_A = k_B <=> 2x_A = -2x_B <=> x_A + x_B = 0 $
      Vì điều kiện miền xác định là $x_A >= 1$ và $x_B >= 1$ nên ta luôn có $x_A + x_B >= 2 > 0$.
      Do đó, phương trình vô nghiệm trên miền xác định. Vậy không tồn tại cặp tiếp tuyến song song nào.
    - *Phát biểu c: Đúng.*
      Xét bình phương khoảng cách giữa hai điểm tùy ý $A(x_A, y_A) in (C_1)$ và $B(x_B, y_B) in (C_2)$ trên miền $x_A, x_B >= 1$:
      $ F(x_A, x_B) = (x_A - x_B)^2 + (y_A - y_B)^2 = (x_A - x_B)^2 + (x_A^2 + x_B^2 + 1)^2 $
      Vì $x_A >= 1 => x_A^2 >= 1$ và $x_B >= 1 => x_B^2 >= 1$, nên ta luôn có:
      $ x_A^2 + x_B^2 + 1 >= 1 + 1 + 1 = 3 => (x_A^2 + x_B^2 + 1)^2 >= 9 $
      Mặt khác, ta luôn có $(x_A - x_B)^2 >= 0$.
      Do đó:
      $ F(x_A, x_B) >= 0 + 9 = 9 $
      Đẳng thức xảy ra khi và chỉ khi đồng thời thỏa mãn điều kiện biên:
      $ cases((x_A - x_B)^2 = 0, x_A^2 + x_B^2 + 1 = 3) <=> cases(x_A = x_B, x_A = x_B = 1) <=> x_A = x_B = 1 $
      Vậy cặp điểm cho khoảng cách nhỏ nhất là đầu mút biên $A(1, 4) in (C_1)$ và $B(1, 1) in (C_2)$.
    - *Phát biểu d: Sai.*
      Khoảng cách ngắn nhất giữa hai đường cong bằng:
      $ d_min = sqrt(F_min) = sqrt(9) = 3 $
      Phát biểu d khẳng định khoảng cách bằng $sqrt(10)$ là sai.
  ]
)

#exam-part([Tự luận / Trả lời ngắn], reset-counter: false)

#bt(
  [Một thiết bị cứu hộ tự động di chuyển dọc theo thung lũng có quỹ đạo được mô hình hóa bởi đường cong $(C): y = x + frac(3, x)$ trên đoạn $[2, 3]$ (đơn vị: km). Một tuyến đường cứu trợ chạy thẳng bên ngoài thung lũng được thiết lập dọc theo đường thẳng $d: y = x - 2$. Hãy xác định khoảng cách ngắn nhất và khoảng cách dài nhất từ thiết bị cứu hộ đến tuyến đường cứu trợ để lên phương án phủ sóng liên lạc.],
  loigiai: [
    *Lời giải chi tiết từng bước:*
    
    *Bước 1: Chứng minh đường quỹ đạo và tuyến đường không giao nhau.*
    Xét phương trình hoành độ giao điểm của $(C)$ và $d$ trên đoạn $[2, 3]$:
    $ x + frac(3, x) = x - 2 <=> frac(3, x) = -2 <=> x = -frac(3, 2) $
    Nghiệm $x = -1.5$ nằm ngoài đoạn khảo sát $[2, 3]$. Hơn nữa, với mọi $x in [2, 3]$, ta có $x + frac(3, x) > x > x - 2$.
    Do đó, thiết bị cứu hộ và tuyến đường cứu trợ hoàn toàn không giao nhau và thiết bị luôn ở phía trên tuyến đường.
    
    *Bước 2: Thiết lập hàm số tính khoảng cách từ điểm di động đến đường thẳng.*
    Đường thẳng $d: x - y - 2 = 0$.
    Với một điểm $M(x, x + frac(3, x)) in (C)$ (với $x in [2, 3]$), khoảng cách từ $M$ đến đường thẳng $d$ bằng:
    $ h(x) = d(M, d) = frac(|x - (x + frac(3, x)) - 2|, sqrt(1^2 + (-1)^2)) = frac(|-frac(3, x) - 2|, sqrt(2)) = frac(frac(3, x) + 2, sqrt(2)) $
    (do $x in [2, 3] => x > 0 => frac(3, x) + 2 > 0$).
    
    *Bước 3: Khảo sát sự biến thiên của hàm số khoảng cách.*
    Xét hàm số $h(x) = frac(1, sqrt(2)) (frac(3, x) + 2)$ trên đoạn $[2, 3]$.
    Đạo hàm của hàm số:
    $ h'(x) = frac(1, sqrt(2)) dot (-frac(3, x^2)) = -frac(3, x^2 sqrt(2)) $
    Vì $x^2 > 0$ với mọi $x in [2, 3]$, ta có $h'(x) < 0$ with mọi $x in [2, 3]$.
    Do đó, hàm số $h(x)$ nghịch biến trên đoạn $[2, 3]$.
    
    *Bước 4: Xác định giá trị lớn nhất và nhỏ nhất.*
    - Khoảng cách ngắn nhất đạt được tại biên phải của đoạn $x = 3$:
      $ d_min = h(3) = frac(frac(3, 3) + 2, sqrt(2)) = frac(3, sqrt(2)) = frac(3sqrt(2), 2) text(" (km)") $
    - Khoảng cách dài nhất đạt được tại biên trái của đoạn $x = 2$:
      $ d_max = h(2) = frac(frac(3, 2) + 2, sqrt(2)) = frac(7, 2sqrt(2)) = frac(7sqrt(2), 4) text(" (km)") $
      
    *Đáp số:* Khoảng cách ngắn nhất là $frac(3sqrt(2), 2) approx 2.12$ km; khoảng cách dài nhất là $frac(7sqrt(2), 4) approx 2.47$ km.
  ]
)�o sát sự biến thiên của hàm số khoảng cách.*
    Xét hàm số $h(x) = frac(1, sqrt(2)) (frac(3, x) + 2)$ trên đoạn $[2, 3]$.
    Đạo hàm của hàm số:
    $ h'(x) = frac(1, sqrt(2)) dot (-frac(3, x^2)) = -frac(3, x^2 sqrt(2)) $
    Vì $x^2 > 0$ với mọi $x in [2, 3]$, ta có $h'(x) < 0$ với mọi $x in [2, 3]$.
    Do đó, hàm số $h(x)$ nghịch biến trên đoạn $[2, 3]$.
    
    *Bước 4: Xác định giá trị lớn nhất và nhỏ nhất.*
    - Khoảng cách ngắn nhất đạt được tại biên phải của đoạn $x = 3$:
      $ d_min = h(3) = frac(frac(3, 3) + 2, sqrt(2)) = frac(3, sqrt(2)) = frac(3sqrt(2), 2) text(" (km)") $
    - Khoảng cách dài nhất đạt được tại biên trái của đoạn $x = 2$:
      $ d_max = h(2) = frac(frac(3, 2) + 2, sqrt(2)) = frac(frac(7, 2), sqrt(2)) = frac(7, 2sqrt(2)) = frac(7sqrt(2), 4) text(" (km)") $
      
    *Đáp số:* Khoảng cách ngắn nhất là $frac(3sqrt(2), 2) approx 2.12$ km; khoảng cách dài nhất là $frac(7sqrt(2), 4) approx 2.47$ km.
  ]
)
hau:
    $ y'_1(x_A) = y'_2(x_B) <=> 2x_A = -2x_B + 8 <=> x_A + x_B = 4 <=> x_B = 4 - x_A $
    
    *Bước 2: Sử dụng điều kiện pháp tuyến chung.*
    Véc-tơ chỉ phương tiếp tuyến tại $A$ là $vect(u_A) = (1, 2x_A)$.
    Véc-tơ nối hai điểm: $vect(A B) = (x_B - x_A, y_B - y_A)$.
    Biểu diễn các giá trị theo $x_A$ (với $x_B = 4 - x_A$):
    - $x_B - x_A = 4 - 2x_A$.
    - $y_A = x_A^2 + 1$.
    - $y_B = -(4 - x_A)^2 + 8(4 - x_A) - 14 = -x_A^2 + 2$.
    - $y_B - y_A = -2x_A^2 + 1$.
    Véc-tơ $vect(A B)$ phải vuông góc với $vect(u_A)$:
    $ vect(A B) dot vect(u_A) = 0 <=> (4 - 2x_A) + (-2x_A^2 + 1) dot 2x_A = 0 $
    $ <=> 4 - 2x_A - 4x_A^3 + 2x_A = 0 <=> 4x_A^3 = 4 <=> x_A = 1 $
    Từ đó tìm ra tọa độ hai điểm:
    - $x_A = 1 => A(1, 2)$.
    - $x_B = 4 - 1 = 3 => B(3, 1)$.
    
    *Bước 3: Tính khoảng cách ngắn nhất.*
    $ d_min = |A B| = sqrt((3 - 1)^2 + (1 - 2)^2) = sqrt(4 + 1) = sqrt(5) $
    Chọn phương án A.
  ]
)

#exam-part([Trắc nghiệm Đúng/Sai (True/False)], reset-counter: false)

#tf(
  [Cho hai đường parabol $(P_1): y = x^2$ và $(P_2): y = -x^2 + 6x - 7.5$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([Hai đường parabol $(P_1)$ và $(P_2)$ không giao nhau trên tập số thực $RR$.]),
    True([Véc-tơ nối hai điểm gần nhau nhất trên $(P_1)$ và $(P_2)$ song song với véc-tơ $vect(v) = (2, -1)$.]),
    True([Khoảng cách nhỏ nhất giữa hai đường parabol bằng $frac(sqrt(5), 2)$.]),
    False([Tiếp tuyến của $(P_1)$ tại điểm gần $(P_2)$ nhất có hệ số góc bằng $1$.]),
  ),
  loigiai: [
    - Phát biểu a: Đúng. Xét phương trình hoành độ giao điểm: $x^2 = -x^2 + 6x - 7.5 <=> 2x^2 - 6x + 7.5 = 0 <=> x^2 - 3x + 3.75 = 0$ có $Delta = 9 - 15 = -6 < 0$ (phương trình vô nghiệm thực).
    - Phát biểu b: Đúng. Hai tiếp điểm tối ưu có tiếp tuyến song song: $y'_1(x_A) = y'_2(x_B) <=> 2x_A = -2(x_B - 3) <=> x_A + x_B = 3 <=> x_B = 3 - x_A$.
      Véc-tơ nối hai điểm $vect(A B) = (x_B - x_A, y_B - y_A) = (3 - 2x_A, -2x_A^2 + 1.5)$.
      Đoạn $A B$ vuông góc với tiếp tuyến tại $A$ (có véc-tơ chỉ phương $vect(u_A) = (1, 2x_A)$):
      $ (3 - 2x_A) + (-2x_A^2 + 1.5) dot 2x_A = 0 <=> 3 - 2x_A - 4x_A^3 + 3x_A = 0 $
      $ <=> 4x_A^3 - x_A - 3 = 0 <=> (x_A - 1)(4x_A^2 + 4x_A + 3) = 0 $
      Vì $4x_A^2 + 4x_A + 3 = 0$ vô nghiệm, ta thu được nghiệm thực duy nhất $x_A = 1 => x_B = 2$.
      Tọa độ hai điểm tối ưu: $A(1, 1)$ và $B(2, 0.5)$.
      Véc-tơ $vect(A B) = (2 - 1, 0.5 - 1) = (1, -0.5) = 0.5(2, -1)$, song song với $vect(v) = (2, -1)$.
    - Phát biểu c: Đúng. Khoảng cách ngắn nhất bằng $d_min = |A B| = sqrt((2-1)^2 + (0.5-1)^2) = sqrt(1 + 0.25) = sqrt(1.25) = frac(sqrt(5), 2)$.
    - Phát biểu d: Sai, vì tiếp tuyến tại $A(1, 1)$ có hệ số góc là $y'_1(1) = 2(1) = 2$, chứ không phải $1$.
  ]
)

#exam-part([Tự luận / Trả lời ngắn], reset-counter: false)

#bt(
  [Một tuyến luồng cấp phôi tự động của nhà máy sản xuất linh kiện được thiết kế dọc theo đường thẳng biên giới hạn $d: 2x - y + 1 = 0$. Để che chắn bụi và bảo vệ cơ học, một ranh giới tấm chắn an toàn được lắp đặt bao quanh có hình dạng được mô hình hóa bởi đường cong $(C): y = ln(x) + 2$ với miền giới hạn $x >= 1$ (đơn vị: mét). Tìm khoảng cách ngắn nhất từ mép tấm chắn an toàn đến tuyến cấp phôi tự động để thiết kế kích thước tấm đệm cách âm thích hợp.],
  loigiai: [
    *Giải:*
    Đường thẳng $d: 2x - y + 1 = 0 <=> y = 2x + 1$, có hệ số góc $a = 2$.
    Ranh giới tấm chắn $(C): y = ln(x) + 2$ xác định trên miền $x >= 1$.
    Khoảng cách từ một điểm bất kỳ $M(x, ln(x) + 2) in (C)$ đến đường thẳng $d$ là:
    $ d(M, d) = frac(|2x - (ln(x) + 2) + 1|, sqrt(2^2 + (-1)^2)) = frac(|2x - ln(x) - 1|, sqrt(5)) $
    Xét hàm số tử số: $f(x) = 2x - ln(x) - 1$ trên $[1, +infinity)$.
    Đạo hàm:
    $ f'(x) = 2 - frac(1, x) $
    Với mọi $x >= 1$, ta có $frac(1, x) <= 1 => 2 - frac(1, x) >= 1 > 0$.
    Do đó, $f'(x) > 0$ với mọi $x >= 1$.
    Hàm số $f(x)$ đồng biến trên $[1, +infinity)$.
    Suy ra giá trị nhỏ nhất của $f(x)$ đạt được tại điểm biên $x_0 = 1$.
    Giá trị nhỏ nhất của tử số:
    $ f(1) = 2(1) - ln(1) - 1 = 1 $
    Vì $f(1) = 1 > 0$ nên $f(x) >= 1 > 0$ với mọi $x >= 1$.
    Khoảng cách ngắn nhất là:
    $ d_min = frac(f(1), sqrt(5)) = frac(1, sqrt(5)) = frac(sqrt(5), 5) text(" (m)") $
    
    *Đáp số:* $frac(sqrt(5), 5) approx 0.45$ mét.
  ]
)
