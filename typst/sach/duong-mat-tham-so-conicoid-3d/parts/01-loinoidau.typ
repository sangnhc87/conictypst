#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

= PHẦN I — KHAI PHÓNG TƯ DUY THAM SỐ TRONG KHÔNG GIAN

== 1. Sự Giải Phóng Từ Ràng Buộc Tĩnh Sang Động Năng Tham Số

#why-box[
  Trong chương trình hình học không gian THPT, đặc biệt là hệ tọa độ $O x y z$ lớp 12, chúng ta thường được làm quen với các phương trình dưới dạng ràng buộc ẩn (implicit equations). Ví dụ:
  - Phương trình mặt phẳng: $A x + B y + C z + D = 0$.
  - Phương trình mặt cầu: $(x-a)^2 + (y-b)^2 + (z-c)^2 = R^2$.
  - Phương trình mặt trụ đứng: $x^2 + y^2 = R^2$.
  
  Những phương trình này có một đặc điểm chung: chúng hoạt động như một "người gác cổng" hay một chiếc lồng sắt tĩnh lặng. Nếu ta có một điểm $M(x, y, z)$ trong không gian, ta phải thế tọa độ của nó vào phương trình để kiểm tra xem nó có thỏa mãn ràng buộc hay không. Nếu có, điểm đó được phép nằm trên hình; nếu không, nó bị từ chối. 
  
  Tuy nhiên, cơ chế "người gác cổng" này có một điểm yếu chết người: nó hoàn toàn thụ động. Nó không hề dạy ta làm cách nào để *sinh ra* (kiến tạo) các điểm nằm trên bề mặt đó, hay làm thế nào để lập trình cho một vật thể (như đầu in của máy in 3D hay cánh tay robot) di chuyển dọc theo hình dạng ấy. Phép tham số hóa chính là sự giải phóng tư duy thoát khỏi chiếc lồng sắt tĩnh lặng để bước vào thế giới của chuyển động và kiến tạo.
]

=== Sự Đối Lập Giữa Phương Trình Ẩn Và Phương Trình Tham Số

Để hiểu sâu sắc bản chất và giải phóng hoàn toàn tư duy hình học, chúng ta hãy đặt hai thế giới quan này cạnh nhau để đối chiếu:

1. *Thế giới quan phương trình ẩn (Implicit Viewpoint - Trạng thái tĩnh):*
   - Định nghĩa hình học bằng hàm ràng buộc: $F(x, y, z) = 0$.
   - *Tư duy cốt lõi:* "Kiểm tra tư cách thành viên". Ta phải đi tìm các bộ số $(x, y, z)$ thỏa mãn đẳng thức.
   - *Hạn chế:* Rất khó để vẽ đồ họa máy tính (vì máy tính không thể mò ngẫu nhiên các điểm trong không gian để tìm ra điểm thỏa mãn $F(x, y, z) = 0$). Nó cũng hoàn toàn bất lực trong việc mô tả thời gian, vận tốc, hay quỹ đạo di chuyển của một vật thể vật lý.

2. *Thế giới quan phương trình tham số (Parametric Viewpoint - Trạng thái động):*
   - Định nghĩa hình học bằng ánh xạ dẫn đường. Ta dùng một hoặc nhiều biến tự do (gọi là tham số, ví dụ $t$ cho đường cong, hoặc cặp $u, v$ cho mặt cong) chạy trên một miền số thực đơn giản, từ đó tính trực tiếp ra tọa độ $(x, y, z)$ của điểm:
     $ vec(r)(t) = (x(t), y(t), z(t)) quad "hoặc" quad vec(r)(u, v) = (x(u, v), y(u, v), z(u, v)) $
   - *Tư duy cốt lõi:* "Kiến tạo và chỉ đường". Ta không cần kiểm tra, ta tự tạo ra hình học bằng cách cho tham số quét qua miền xác định.
   - *Ưu điểm:* Máy tính đồ họa cực kỳ thích phương trình tham số: chỉ cần chạy vòng lặp cho $t$ tăng dần, ta sẽ lập tức vẽ được toàn bộ đường cong mà không cần giải bất kỳ hệ phương trình nào. Nó khớp hoàn hảo với khái niệm thời gian trong vật lý, cho phép tính toán vận tốc, gia tốc, hướng đi tại mỗi thời điểm trôi qua.

#essay-box("Bài luận tư duy: Con cá sấu ẩn mình và Nét bút vẽ năng động")[
  Hãy tưởng tượng phương trình ẩn giống như một con cá sấu đang ẩn mình sâu dưới đầm lầy phẳng lặng. Ta hoàn toàn không thấy rõ hình dáng của nó cho đến khi có một chiếc lá rơi hay một con mồi chạm đúng vào vị trí của nó và làm nước bắn lên ($F(x, y, z) = 0$). Đó là một cơ chế phản ứng thụ động và thử sai liên tục.
  
  Ngược lại, phương trình tham số giống như nét bút chì của một người họa sĩ đang vẽ trên trang giấy trắng, hay vệt khói trắng kéo dài sau đuôi của một chiếc máy bay phản lực trên bầu trời xanh. Thời gian $t$ trôi qua, nét bút hoặc chiếc máy bay di chuyển đến đâu, quỹ đạo hình học được dệt nên đến đó. Mỗi giá trị $t$ tương ứng với một vị trí chính xác trong không gian 3D. 
  
  Trong kỷ nguyên số và công nghệ tự động hóa, mọi chuyển động cơ khí – từ chiếc máy cắt CNC gia công cơ khí chính xác, máy in 3D đắp từng sợi nhựa, cho đến đường bay của tên lửa hành trình – đều bắt buộc phải được lập trình bằng ngôn ngữ tham số. Robot không thể hiểu "lồng sắt" ẩn; chúng chỉ hiểu lệnh: "Tại giây thứ $t$, hãy di chuyển khớp vai đến tọa độ $x(t)$, khớp khuỷu đến $y(t)$, và bàn tay đến $z(t)$".
]

#history-box("Cuộc tranh hùng giữa Renault và Citroën")[
  Toán học đằng sau các đường cong thiết kế hiện đại không xuất phát từ các phòng thí nghiệm hàn lâm thuần túy, mà từ cuộc đua công nghiệp khốc liệt giữa hai hãng xe hơi khổng lồ của Pháp vào thập niên 1960: *Renault* và *Citroën*.
  
  Để thiết kế vỏ xe hơi bóng bẩy khí động học, thời đó các kỹ sư phải tạo ra các mô hình bằng đất sét thủ công khổng lồ, rồi đo đạc thủ công các điểm tọa độ, rất chậm và thiếu chính xác.
  
  - *Paul de Casteljau* làm việc tại Citroën đã phát hiện ra một thuật toán hình học vô cùng trực quan để xây dựng các đường cong mượt mà dựa trên phép nội suy tỉ lệ (ngày nay gọi là thuật toán de Casteljau). Vì Citroën giữ bí mật quân sự cực kỳ nghiêm ngặt, nghiên cứu của ông không được công bố ra ngoài.
  
  - Vài năm sau, *Pierre Bézier* tại Renault đã độc lập phát triển một phương pháp toán học dựa trên đa thức để định nghĩa các đường cong này thông qua các điểm kiểm soát (control points). Renault đã cho phép ông công bố rộng rãi.
  
  Ngày nay, thế giới vinh danh phát minh này là *Đường cong Bézier* (Bézier Curve) – công cụ nền tảng trong mọi phần mềm đồ họa vector (phím tắt `P` - Pen Tool trong Adobe Illustrator, Photoshop) và thiết kế công nghiệp CAD/CAM trên toàn cầu.
]

== 2. Tầm Nhìn Học Thuật Của Chuyên Đề

Cuốn sách này được thiết kế như một cuộc hành trình khai phóng tư duy hình học không gian THPT bằng cách đưa bạn đi qua 3 nấc thang học thuật từ cơ bản đến ứng dụng kỹ thuật cao:

#align(center)[
  #canvas(length: 1cm, {
    import draw: *
    
    // Nấc thang 1
    rect((0,0), (3.6,2.2), radius: 0.15, stroke: 1.2pt + C-FOREST, fill: rgb("#F0F9FF"))
    content((1.8, 1.1), align(center)[
      #text(weight: "bold", fill: C-FOREST, size: 9pt)[Bước 1: ĐƯỜNG THAM SỐ]\n
      #text(size: 7.5pt, fill: rgb("#334155"))[1 biến biến thiên $t$\nQuỹ đạo, vận tốc, độ cong]
    ])
    
    // Mũi tên 1
    line((3.6, 1.1), (4.8, 1.1), mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#94A3B8"))
    
    // Nấc thang 2
    rect((4.8,0), (8.4,2.2), radius: 0.15, stroke: 1.2pt + C-PURPLE, fill: rgb("#F5F3FF"))
    content((6.6, 1.1), align(center)[
      #text(weight: "bold", fill: C-PURPLE, size: 9pt)[Bước 2: MẶT THAM SỐ]\n
      #text(size: 7.5pt, fill: rgb("#334155"))[2 biến độc lập $u, v$\nLưới tọa độ, tiếp diện]
    ])
    
    // Mũi tên 2
    line((8.4, 1.1), (9.6, 1.1), mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#94A3B8"))
    
    // Nấc thang 3
    rect((9.6,0), (13.2,2.2), radius: 0.15, stroke: 1.2pt + C-AMBER, fill: rgb("#FFFBEB"))
    content((11.4, 1.1), align(center)[
      #text(weight: "bold", fill: C-AMBER, size: 9pt)[Bước 3: MẶT CONICOIDS]\n
      #text(size: 7.5pt, fill: rgb("#334155"))[Các mặt bậc hai 3D\nDệt mặt kẻ, Tối ưu hóa]
    ])
  })
  #v(0.4em)
  #text(size: 8.5pt, fill: rgb("#64748B"), style: "italic")[Sơ đồ tư duy 3 nấc thang khám phá toán học không gian tham số]
]

#core-box[
  *Ba nấc thang tư duy của chuyên đề:*
  
  1. *Đường tham số (1 biến tự do $t$):* Đi từ phương trình đường thẳng Oxyz quen thuộc lớp 12 lên các đường cong phi tuyến phức tạp trong không gian 3D như đường xoắn ốc lò xo (Helix) hay đường cong thiết kế đồ họa (Bézier). Học sinh sẽ học cách dùng đạo hàm và tích phân đơn biến để tính toán vận tốc chuyển động và chiều dài thực tế của sợi chỉ không gian.
  
  2. *Mặt tham số (2 biến tự do $u, v$):* Khám phá cách sử dụng hai tham số độc lập để dệt nên các bề mặt cong trong không gian. Chúng ta sẽ kết nối trực tiếp khái niệm đạo hàm riêng phần với tích có hướng của hình học lớp 12 để tìm ra pháp vectơ của mặt cong, từ đó viết phương trình mặt phẳng tiếp xúc (tiếp diện) tại một điểm cực kỳ nhanh chóng. Chúng ta cũng sẽ chiêm ngưỡng các bề mặt kỳ lạ như mặt bánh donut (Torus) hay dải Möbius một phía.
  
  3. *Mặt bậc hai Conicoids & Kỹ thuật dệt mặt kẻ:* Nghiên cứu các bề mặt bậc hai kinh điển (Ellipsoid, Hyperboloid, Paraboloid) không chỉ qua phương trình đại số tĩnh mà qua thuộc tính hình học vi phân độc đáo: nhiều mặt cong phức tạp thực chất lại được dệt nên hoàn toàn từ những đường thẳng chéo nhau (Mặt kẻ - Ruled surfaces). Điều này mở ra chiến thuật giải các bài toán cực trị không gian siêu nhanh và các ứng dụng kiến trúc mái vòm chịu lực khổng lồ.
]

#open-q[
  Nếu một điểm chuyển động tự do trên một mặt cầu $x^2 + y^2 + z^2 = R^2$, làm thế nào để ta giảm số lượng biến số từ 3 biến ràng buộc $(x, y, z)$ về chỉ còn 2 biến độc lập để tìm giá trị lớn nhất, giá trị nhỏ nhất của một biểu thức khoảng cách một cách dễ dàng nhất? Câu hỏi này sẽ dẫn dắt chúng ta bước vào Chương I để học cách tham số hóa đường đi trong không gian 3D.
]
