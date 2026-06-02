#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== 11. Khoảng Cách, Góc Và Đường Vuông Góc Chung

#why-box[
  Với nhiều học sinh, phần góc và khoảng cách trong 3D là nơi đáng sợ nhất vì cảm giác ngập chìm trong các công thức lượng giác và tọa độ. 
  
  Tuy nhiên, bản chất của mọi phép đo góc và khoảng cách trong không gian đều quay về cùng một nguyên lý tối giản: tìm cách chiếu hoặc kéo các đối tượng chéo nhau, lơ lửng về các cấu hình vuông góc phẳng mà bộ não kiểm soát nổi.
]

#vd-box("10", "Góc giữa đường thẳng và mặt phẳng được xác định như thế nào?")[
  #grid(
    columns: (1.25fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      Cho mặt phẳng $(P)$ và đường thẳng $d$ cắt $(P)$ tại giao điểm $M$. 
      
      Để xác định góc giữa đường thẳng $d$ và mặt phẳng $(P)$, ta thực hiện quy trình gióng bóng hình chiếu:
      - Lấy một điểm $A$ bất kỳ trên đường thẳng $d$ (khác $M$).
      - Chiếu vuông góc điểm $A$ xuống mặt phẳng $(P)$, thu được hình chiếu $A'$.
      - Nối $M$ với $A'$ để thu được hình chiếu $d'$ của đường thẳng $d$ trên mặt phẳng $(P)$.
      
      Góc $alpha$ giữa đường thẳng $d$ và mặt phẳng $(P)$ chính là góc giữa đường thẳng $d$ và hình chiếu $d'$ của nó:
      $ alpha = angle(d, (P)) = angle A M A' $
    ],
    [
      #align(center)[
        #canvas(length: 1.1cm, {
          import draw: *
          let sx = -0.4
          let sy = -0.3
          let proj(x, y, z) = (x + y * sx, z + y * sy)
          
          // Vẽ mặt phẳng (P)
          let p1 = proj(0, 0, 0)
          let p2 = proj(4.5, 0, 0)
          let p3 = proj(4.5, 3.5, 0)
          let p4 = proj(0, 3.5, 0)
          line(p1, p2, p3, p4, close: true, fill: rgb("#0F766E0d"), stroke: 1pt + rgb("#0F766E"))
          content(proj(0.4, 0.4, 0), $(P)$, fill: rgb("#0F766E"), size: 9pt)
          
          // Giao điểm M, điểm A và hình chiếu A'
          let M = proj(1.2, 1.8, 0)
          let A = proj(3.0, 1.8, 1.62)
          let Ap = proj(3.0, 1.8, 0)
          
          // Đường thẳng d (dưới mặt phẳng vẽ nét đứt, trên vẽ nét liền)
          line(proj(0.6, 1.8, -0.54), M, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
          line(M, proj(3.6, 1.8, 2.16), stroke: 1.2pt + black)
          content(proj(3.6, 1.8, 2.26), $d$, size: 9pt)
          
          // Đường thẳng hình chiếu d'
          line(M, proj(3.8, 1.8, 0), stroke: 1pt + rgb("#0F766E"))
          content(proj(3.8, 1.8, -0.15), $d'$, fill: rgb("#0F766E"), size: 9pt)
          
          // Đường vuông góc AA'
          line(A, Ap, stroke: (paint: rgb("#1D4E89"), thickness: 1.2pt, dash: "dashed"))
          
          // Điểm và nhãn
          circle(M, radius: 1.8pt, fill: black); content((M.at(0) - 0.25, M.at(1) - 0.15), $M$, size: 9pt)
          circle(A, radius: 1.8pt, fill: black); content((A.at(0), A.at(1) + 0.25), $A$, size: 9pt)
          circle(Ap, radius: 1.8pt, fill: black); content((Ap.at(0) + 0.25, Ap.at(1) - 0.1), $A'$, size: 9pt)
          
          // Ký hiệu góc vuông AA' vuông góc d'
          line(proj(3.0 - 0.25, 1.8, 0), proj(3.0 - 0.25, 1.8, 0.25), proj(3.0, 1.8, 0.25), stroke: 0.6pt + gray)
          
          // Vẽ cung góc alpha tại M
          // Các điểm của cung góc
          let arc-p1 = proj(1.2 + 0.4, 1.8, 0)
          let arc-p2 = proj(1.2 + 0.38, 1.8, 0.15)
          let arc-p3 = proj(1.2 + 0.34, 1.8, 0.28)
          line(arc-p1, arc-p2, arc-p3, stroke: 0.8pt + rgb("#B45309"))
          content(proj(1.2 + 0.65, 1.8, 0.16), text(fill: rgb("#B45309"), size: 8.5pt)[$alpha$])
        })
      ]
    ]
  )
]

#essay-box("Khai mở tư duy: Góc của một đường thẳng với mặt phẳng là góc với chính chiếc bóng của nó")[
  Hãy tưởng tượng một ngày nắng rực rỡ, một chiếc máy bay đang cất cánh lao lên bầu trời xanh với một góc nghiêng không đổi. Chiếc bóng của máy bay in trên mặt đất sa mạc phẳng lặng, lướt đi cùng hướng. 
  
  Góc cất cánh của máy bay so với mặt đất chính là góc giữa đường bay thực tế và đường đi của chiếc bóng của nó.
  
  Khi giải toán, đừng coi mặt phẳng $(P)$ là một tấm gương phản chiếu phức tạp. Hãy xem nó như một mặt đất chứa "cái bóng" hình chiếu $d'$ của đường thẳng $d$. Phép chiếu vuông góc bóp góc nghiêng của đường thẳng với mọi đường thẳng khác trong mặt phẳng, và góc với chiếc bóng $d'$ chính là *góc nhỏ nhất khả dĩ* giữa đường thẳng $d$ và bất kỳ đường thẳng nào nằm trong mặt phẳng $(P)$.
]

#history-box("Thales và Kim tự tháp Giza: Phép đo không gian đầu tiên bằng bóng phẳng")[
  Vào thế kỷ thứ 6 trước Công nguyên, nhà triết học và toán học Hy Lạp cổ đại Thales thành Miletus du hành tới Ai Cập. Khi đứng trước Kim tự tháp Giza khổng lồ, ông được hoàng đế thách thức đo chiều cao của công trình vĩ đại này mà không được leo lên đỉnh.
  
  Thales đã không dùng bất kỳ dụng cụ đo đạc tinh vi nào. Ông cắm một cây gậy thẳng đứng xuống cát sa mạc ngay bên cạnh Kim tự tháp. Ông kiên nhẫn đợi cho đến khi chiều dài chiếc bóng của cây gậy trên cát bằng đúng chiều cao của chính cây gậy đó. 
  
  Tại khoảnh khắc kỳ diệu ấy, ông tuyên bố chiều cao của Kim tự tháp chính bằng độ dài chiếc bóng của nó (tính từ tâm đáy kim tự tháp đến đỉnh bóng) trên cát. 
  
  Phát kiến của Thales dựa trên một trực giác không gian cực mạnh: tia sáng Mặt Trời chiếu song song tạo ra các tam giác đồng dạng. Việc đo chiều cao 3D lơ lửng khó khăn đã được Thales chuyển dịch thành việc đo chiếc bóng phẳng 2D trên cát. Đây được coi là cột mốc lịch sử đầu tiên chứng minh sức mạnh của phép chiếu song song và tỷ lệ hình học trong việc đo đạc thế giới ba chiều.
]

=== Định lý Gauss-Bonnet rời rạc: Khi độ cong đo bằng độ thiếu hụt góc

Trong hình học vi phân nâng cao, độ cong của các mặt cong được mô tả bằng định lý Gauss-Bonnet nổi tiếng. Một điều kỳ diệu là định lý này có một phiên bản rời rạc vô cùng đơn giản dành cho các khối đa diện 3D (như khối lập phương, tứ diện, hay đa diện lồi bất kỳ). Nó liên kết trực tiếp giữa các góc đo cục bộ tại các đỉnh với hình dạng cấu trúc tổng thể (tô-pô) của đa diện.

#tech-box[
  *Định nghĩa Độ thiếu hụt góc (Angle Defect):*
  
  Giả sử tại một đỉnh $v$ của đa diện lồi, có $k$ mặt bên hội tụ về. Gọi các góc phẳng ở đỉnh của các mặt này lần lượt là $theta_1, theta_2, ..., theta_k$. 
  
  *Độ thiếu hụt góc* tại đỉnh $v$, ký hiệu là $K(v)$, là hiệu số giữa một góc tròn ($2\pi$ hoặc $360^degree$) và tổng các góc phẳng ở đỉnh đó:
  $ K(v) = 2\pi - sum_(i=1)^k theta_i $
  
  *Ý nghĩa trực giác:* Nếu ta "cắt" dọc theo một cạnh của đa diện và trải phẳng các mặt chung đỉnh $v$ ra mặt bàn, ta sẽ thấy một khoảng trống bị thiếu hụt. Khoảng trống này chính là số đo cho thấy đỉnh đa diện "nhọn" và "cong" nhiều như thế nào trong không gian 3D. Đỉnh càng nhọn, độ thiếu hụt góc càng lớn.
]

#vd-box("11b", "Định lý Descartes về tổng độ thiếu hụt góc")[
  *Định lý (Gauss-Bonnet rời rạc):* Đối với bất kỳ đa diện lồi nào (tô-pô tương đương mặt cầu, tức là có đặc trưng Euler $chi = V - E + F = 2$), tổng độ thiếu hụt góc tại tất cả các đỉnh $v$ luôn bằng một hằng số tuyệt đối:
  $ sum_(v) K(v) = 2\pi (V - E + F) = 4\pi = 720^degree $
  
  *Minh chứng cụ thể:*
  - *Khối lập phương:* Có $V = 8$ đỉnh. Tại mỗi đỉnh có 3 mặt vuông hội tụ, mỗi góc phẳng bằng $90^degree$ ($\pi/2$ rad).
    - Độ thiếu hụt góc tại mỗi đỉnh: $K(v) = 360^degree - (3 times 90^degree) = 90^degree$.
    - Tổng độ thiếu hụt góc: $sum_(v) K(v) = 8 times 90^degree = 720^degree$ (chính xác bằng $4\pi$).
  - *Khối tứ diện đều:* Có $V = 4$ đỉnh. Tại mỗi đỉnh có 3 mặt tam giác đều hội tụ, mỗi góc phẳng bằng $60^degree$ ($\pi/3$ rad).
    - Độ thiếu hụt góc tại mỗi đỉnh: $K(v) = 360^degree - (3 times 60^degree) = 180^degree$.
    - Tổng độ thiếu hụt góc: $sum_(v) K(v) = 4 times 180^degree = 720^degree$ (chính xác bằng $4\pi$).
]

#meta-box[
  Định lý Gauss-Bonnet rời rạc cho thấy một quy luật bảo toàn vô cùng đẹp đẽ của vũ trụ 3D: Dù ta có nhào nặn, kéo dãn hay bóp méo khối đa diện lồi thế nào đi nữa (biến khối lập phương thành một khối đa diện méo mó bất kỳ), miễn là không làm rách hay khoan thủng nó, thì tổng tất cả các độ "nhọn" (độ thiếu hụt góc) ở các đỉnh của nó luôn được khóa chặt ở giá trị $720^degree$ ($4\pi$).
]

