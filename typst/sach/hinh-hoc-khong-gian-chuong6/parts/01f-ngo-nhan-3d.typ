#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== 10. Những Ngộ Nhận Làm 3D Trở Thành Ác Mộng

#why-box[
  Học hình học không gian (3D) thường được coi là nỗi sợ kinh hoàng của học sinh trung học. Nỗi sợ này thực chất không đến từ việc các định lý quá khó hay công thức quá dài, mà xuất phát từ việc người học cố gắng áp dụng thói quen tư duy của hình học phẳng (2D) vào thế giới 3D. 
  
  Nếu không làm sạch các ngộ nhận trực giác này ngay từ đầu, người học sẽ luôn có cảm giác mình đang làm toán trong một màn sương mù mờ ảo.
]

#vd-box("9", "Ảo giác thị giác về hai đường thẳng ‘cắt nhau’")[
  #grid(
    columns: (1.25fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      Cho hình chóp tam giác (tứ diện) $S.A B C$. Lấy điểm $P$ nằm trên cạnh $S A$, điểm $Q$ nằm trên cạnh $B C$. 
      
      Nhìn bản vẽ phối cảnh bên cạnh, ta thấy đoạn thẳng $P Q$ và cạnh $S B$ cắt nhau rõ ràng tại một điểm $X$ trên trang giấy. Nhiều học sinh sẽ lập tức suy ra trong lập luận: $X = P Q inter S B$.
      
      Nhưng đây là một *sai lầm chí mạng*. Trong không gian 3D:
      - Đường thẳng $S B$ nằm hoàn toàn trên mặt bên $(S A B)$ và $(S B C)$.
      - Điểm $P$ thuộc $S A$, điểm $Q$ thuộc $B C$. Đoạn thẳng $P Q$ đi xuyên qua lòng trong của hình chóp nối từ mặt bên này sang mặt bên kia.
      
      Chúng không cùng nằm trên bất kỳ mặt phẳng nào (không đồng phẳng), do đó chúng là *hai đường thẳng chéo nhau*. Điểm giao nhau $X$ trên trang giấy chỉ là một ảo giác hình chiếu 2D (hai bóng của chúng đè lên nhau từ góc nhìn của mắt).
    ],
    [
      #align(center)[
        #canvas(length: 1.1cm, {
          import draw: *
          let sx = -0.45
          let sy = -0.3
          let proj(x, y, z) = (y + x * sx, z + x * sy)
          
          // Đỉnh tứ diện
          let S = proj(1.8, 1.2, 3.0)
          let A = proj(0.5, 2.2, 0)
          let B = proj(3.5, 2.2, 0)
          let C = proj(2.2, 0.4, 0)
          
          // Điểm P trên SA, Q trên BC
          let P = proj(1.8 - 0.4 * 1.3, 1.2 + 0.4 * 1.0, 3.0 - 0.4 * 3.0) // P = S + 0.4*(A-S)
          let Q = proj(3.5 - 0.5 * 1.3, 2.2 - 0.5 * 1.8, 0) // Q = B + 0.5*(C-B)
          
          // Đường chéo AC khuất
          line(A, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          
          // Đường PQ (nét đứt vì chạy bên trong khối chóp)
          line(P, Q, stroke: (paint: rgb("#0891B2"), thickness: 1.2pt, dash: "dashed"))
          
          // Các cạnh ngoài tứ diện
          line(S, A, stroke: 1pt + black)
          line(S, C, stroke: 1pt + black)
          line(A, B, stroke: 1pt + black)
          line(B, C, stroke: 1pt + black)
          
          // Cạnh SB (nổi lên phía trước, nét liền đậm)
          line(S, B, stroke: 1.5pt + black)
          
          // Vẽ các điểm đầu
          circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.25), $S$, size: 9pt)
          circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.2, A.at(1) - 0.2), $A$, size: 9pt)
          circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.25, B.at(1) + 0.1), $B$, size: 9pt)
          circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.25, C.at(1) - 0.15), $C$, size: 9pt)
          
          circle(P, radius: 1.8pt, fill: rgb("#0891B2")); content((P.at(0) - 0.25, P.at(1) + 0.15), $P$, size: 9pt, fill: rgb("#0891B2"))
          circle(Q, radius: 1.8pt, fill: rgb("#0891B2")); content((Q.at(0) + 0.1, Q.at(1) - 0.25), $Q$, size: 9pt, fill: rgb("#0891B2"))
          
          // Vẽ vòng tròn cảnh báo đỏ tại điểm cắt ảo trong 2D
          // Giao điểm 2D thực tế giữa SB và PQ
          let X = (1.92, 1.1)
          circle(X, radius: 5.5pt, stroke: 1pt + rgb("#9F1239"))
          content((X.at(0) + 0.75, X.at(1) + 0.15), text(fill: rgb("#9F1239"), size: 8pt, weight: "bold")[Ảo giác cắt nhau!])
        })
      ]
    ]
  )
]

#core-box[
  Để không rơi vào cái bẫy trực giác của 3D, hãy loại bỏ ngay bốn ngộ nhận lớn sau:
  
  1. *Ngộ nhận 1: "Cắt nhau trên giấy là cắt nhau trong thực tế".* 
     - *Sự thật:* Hai đường thẳng chỉ cắt nhau khi chúng đồng phẳng. Nếu chúng không đồng phẳng, giao điểm trên giấy chỉ là sự chồng chập hình ảnh 2D.
  2. *Ngộ nhận 2: "Tọa độ hóa Oxyz càng sớm càng tốt".*
     - *Sự thật:* Việc gắn trục tọa độ vào một hình khối khi chưa hiểu rõ quan hệ vuông góc hay song song gốc sẽ biến bài toán thành một bãi lầy tính toán đại số khổng lồ với những con số lẻ kinh hoàng. Hãy dựng hình học trước khi tính số.
  3. *Ngộ nhận 3: "Luôn cố gắng giải bằng hình vẽ Euclid cổ điển".*
     - *Sự thật:* Có những bài toán khoảng cách chéo nhau cực kỳ lắt léo đòi hỏi dựng thêm rất nhiều đường phụ. Nếu ta kiên quyết từ chối vectơ hay tọa độ Oxyz, ta đang tự phế bỏ các công cụ tự động hóa cực mạnh của toán học hiện đại.
  4. *Ngộ nhận 4: "Góc giữa hai đường thẳng là góc giữa hai nét vẽ của chúng".*
     - *Sự thật:* Góc giữa hai đường thẳng chéo nhau $a$ và $b$ phải được định nghĩa bằng góc giữa hai đường thẳng cắt nhau lần lượt song song với $a$ và $b$. Việc đo trực tiếp góc trên bản vẽ phẳng luôn cho kết quả sai lệch do méo hình chiếu.
]


=== 3D Chirality (Độ bàn tay) và Toán học của Tích hỗn tạp

Trong không gian 3D, có một khái niệm hình học vô cùng sâu sắc mà hình học phẳng 2D không hề có: *Chirality (Tính bất đối xứng gương / Độ bàn tay)*. 

#history-box("Chirality và thảm họa dược phẩm Thalidomide")[
  Từ "Chirality" bắt nguồn từ tiếng Hy Lạp *kheir* (nghĩa là bàn tay). Hai bàn tay của chúng ta là ảnh phản chiếu gương của nhau, nhưng không thể nào xoay chúng trong không gian 3D để chúng hoàn toàn chồng khít lên nhau (lòng bàn tay này chồng lên mu bàn tay kia).
  
  Trong hóa dược, tính chất này cực kỳ quan trọng. Phân tử thuốc Thalidomide vào những năm 1950 có hai dạng chirality đồng phân gương: dạng quay trái ($L$-Thalidomide) giúp giảm nghén cho phụ nữ mang thai, trong khi dạng quay phải ($D$-Thalidomide) lại gây dị tật bẩm sinh nghiêm trọng ở thai nhi. Do quy trình sản xuất thời đó không lọc sạch dạng chirality nghịch, thảm họa y khoa kinh hoàng đã xảy ra. Điều này chứng minh rằng sự định hướng trong không gian 3D quyết định cả sự sống và cái chết của sinh học.
]

Để đo đạc và định cấu trúc cho tính định hướng này trong Oxyz, toán học sử dụng một đại lượng được gọi là *Tích hỗn tạp (Triple Scalar Product)* của ba vectơ $vec(a)$, $vec(b)$, và $vec(c)$:
$ V = (vec(a) times vec(b)) dot vec(c) $

#tech-box[
  *Ý nghĩa toán học và hình học của Tích hỗn tạp:*
  
  Tích hỗn tạp trả về một giá trị vô hướng (một số thực). Trị tuyệt đối $|(vec(a) times vec(b)) dot vec(c)|$ chính là thể tích của khối hộp song song được dựng từ ba vectơ này. Dấu của tích hỗn tạp quyết định *Chirality* (tính định hướng) của hệ cơ sở:
  
  - *Hệ trục thuận (Right-handed system):* Nếu $(vec(a) times vec(b)) dot vec(c) > 0$. Ba vectơ tuân theo quy tắc bàn tay phải (ngón cái chỉ $vec(a)$, ngón trỏ chỉ $vec(b)$, ngón giữa chỉ $vec(c)$). Đây là hệ tọa độ chuẩn được dùng trong toán học, vật lý (quy tắc bàn tay phải cho dòng điện) và thư viện đồ họa OpenGL.
  - *Hệ trục nghịch (Left-handed system):* Nếu $(vec(a) times vec(b)) dot vec(c) < 0$. Ba vectơ tuân theo quy tắc bàn tay trái. Hệ này được dùng trong công cụ phát triển game Unity và DirectX.
  - *Trạng thái suy biến (Coplanar):* Nếu $(vec(a) times vec(b)) dot vec(c) = 0$. Ba vectơ đồng phẳng, tức là khối hộp bị xẹp phẳng xuống không gian 2D, không còn thể tích.
]

#open-q[
  Trong quá trình học hình không gian, có khi nào em cảm thấy bất lực vì vẽ hình rất đẹp nhưng không thể chứng minh được một quan hệ hiển nhiên trên hình vẽ? Đó là vì cấu trúc hình học được quyết định bởi tính liên kết logic của giả thiết, chứ không phải độ sắc nét của nét lý thuyết trên trang giấy phẳng.
]

