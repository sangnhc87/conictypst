#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== 6. Hình Chiếu: Cách Giữ Không Gian Trên Một Trang Giấy

#why-box[
  Cái khó lớn đầu tiên của hình học không gian (3D) là: ta bắt buộc phải nghiên cứu và giải quyết các bài toán ba chiều thông qua các bản vẽ phẳng hai chiều trên trang giấy hoặc màn hình máy tính. Phối cảnh phẳng luôn bóp méo góc và độ dài, tạo ra những ảo giác thị giác tai hại. 

  Hình chiếu chính là "thiết bị hiệu chuẩn" tối tân giúp bộ não giải mã và phục hồi chính xác cấu trúc 3D thực tế từ những nét vẽ phẳng xiên xẹo.
]

#vd-box("5", "Khoảng cách từ điểm tới mặt phẳng được hiểu như thế nào?")[
  #grid(
    columns: (1.25fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      Khi tìm khoảng cách từ điểm $A$ tới mặt phẳng $(P)$, nhiều học sinh cố gắng tìm kiếm các công thức tọa độ phức tạp hoặc vẽ bừa một đoạn thẳng chéo từ $A$ xuống mặt phẳng. 
      
      Nhưng bản chất hình học của khoảng cách này vô cùng đơn giản: đó là độ dài của đoạn vuông góc $A A'$ nối từ điểm $A$ đến hình chiếu vuông góc $A'$ của nó trên mặt phẳng $(P)$:
      $ d(A, (P)) = A A' $
      
      Nếu ta chưa định hình được vị trí hình chiếu $A'$ (bằng cách dựng một đường thẳng vuông góc với hai đường thẳng cắt nhau trong $(P)$), mọi công thức đại số sau đó chỉ là các ký tự vô nghĩa được ráp vào một cấu trúc mơ hồ.
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
          
          // Điểm A và hình chiếu A'
          let A = proj(2.0, 1.5, 2.5)
          let Ap = proj(2.0, 1.5, 0)
          
          // Đường thẳng vuông góc AA'
          line(A, Ap, stroke: 1.5pt + rgb("#1D4E89"))
          
          // Điểm và nhãn
          circle(A, radius: 1.8pt, fill: black)
          content((A.at(0), A.at(1) + 0.25), $A$, size: 9pt)
          
          circle(Ap, radius: 1.8pt, fill: black)
          content((Ap.at(0) - 0.2, Ap.at(1) - 0.2), $A'$, size: 9pt)
          
          // Ký hiệu góc vuông dọc theo trục x
          line(proj(2.0 + 0.35, 1.5, 0), proj(2.0 + 0.35, 1.5, 0.35), proj(2.0, 1.5, 0.35), stroke: 0.6pt + gray)
          // Ký hiệu góc vuông dọc theo trục y
          line(proj(2.0, 1.5 + 0.35, 0), proj(2.0, 1.5 + 0.35, 0.35), proj(2.0, 1.5, 0.35), stroke: 0.6pt + gray)
          
          // Nhãn khoảng cách
          content(proj(2.0, 1.0, 1.25), text(fill: rgb("#1D4E89"), size: 8.5pt)[$d(A, (P))$])
        })
      ]
    ]
  )
]

#essay-box("Khai mở tư duy: Hình chiếu là thuật toán giảm chiều dữ liệu")[
  Trong khoa học máy tính hiện đại, khi đối mặt với một tập dữ liệu khổng lồ có hàng ngàn chiều (high-dimensional data), các kỹ sư thường dùng một kỹ thuật gọi là *Giảm chiều dữ liệu (Dimensionality Reduction)*. Họ chiếu các điểm dữ liệu đa chiều xuống một không gian ít chiều hơn (2D hoặc 3D) để phân tích và tìm kiếm cấu trúc dễ dàng hơn mà không làm mất đi các thông tin cốt lõi.
  
  Phép chiếu vuông góc trong hình học không gian làm đúng nhiệm vụ đó. Khi ta chiếu một đường thẳng hay một đa diện xuống một mặt phẳng thích hợp, ta đang "phẳng hóa" bài toán 3D phức tạp thành một bài toán 2D quen thuộc. 
  
  Mấu chốt của một tư duy hình học xuất sắc là: *Hãy chọn mặt phẳng chiếu sao cho các quan hệ vuông góc và song song được bảo toàn nhiều nhất.* Lúc đó, bài toán không gian khó nhất cũng lập tức co về các định lý phẳng của Euclide.
]

#history-box("Gaspard Monge và cuộc Cách mạng Pháp: Sự ra đời của Hình học mô tả")[
  Vào những năm cuối thế kỷ 18, nước Pháp chìm trong khói lửa của cuộc Cách mạng. Quân đội Pháp cần thiết kế các công sự quân sự kiên cố bằng đất đá và pháo đài phức tạp đòi hỏi các bản vẽ cắt đá cực kỳ chính xác trong không gian 3D. Vào thời điểm đó, các kỹ sư quân sự phải dùng các phép tính số học thủ công dài dặc hàng tuần liền để xác định các mặt cắt.
  
  Nhà toán học trẻ tuổi *Gaspard Monge* đã thay đổi toàn bộ lịch sử đó bằng việc phát minh ra *Hình học mô tả (Descriptive Geometry)*. Ông nhận ra rằng thay vì tính toán đại số mệt mỏi, ta có thể chiếu vật thể 3D lên hai mặt phẳng trực giao (mặt chiếu đứng và mặt chiếu bằng) rồi xoay chúng phẳng ra trên cùng một tờ giấy. Phương pháp của ông cho phép giải quyết các bài toán thiết kế pháo đài chỉ trong vài giờ bằng bút và thước kẻ.
  
  Phát kiến này mạnh và chính xác đến mức quân đội Pháp đã phân loại Hình học mô tả thành *Bí mật quân sự quốc gia hàng đầu*. Monge bị cấm giảng dạy hoặc xuất bản phương pháp này bên ngoài giới quân sự Pháp trong suốt hơn 30 năm. Ngày nay, mọi bản vẽ kỹ thuật CAD, kiến trúc và thiết kế công nghiệp hiện đại đều đang hoạt động dựa trên chính nguyên lý chiếu của Gaspard Monge.
]

#core-box[
  Khi đối mặt với một bài toán khoảng cách hoặc hình chiếu, hãy luôn giữ ba câu hỏi định hướng sau:
  
  - Điểm hay đường thẳng nào là chìa khóa cần tìm hình chiếu?
  - Mặt phẳng nào chứa nhiều đường thẳng vuông góc nhất để ta chọn làm mặt phẳng chiếu đáy?
  - Sau khi chiếu, quan hệ phẳng nào (ví dụ tam giác đồng dạng, định lý Pythagore) sẽ giúp ta tính ngược lại độ dài ban đầu?
]
