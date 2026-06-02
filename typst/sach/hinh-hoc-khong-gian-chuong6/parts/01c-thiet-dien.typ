#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== 7. Thiết Diện Và Mặt Phẳng Phụ: Cắt Khối Để Thấy Cấu Trúc

#why-box[
  Trong không gian, nhiều bài hình học bế tắc chỉ vì người học nhìn khối hộp hay hình chóp một cách quá nguyên vẹn. Cố gắng tưởng tượng và giải quyết các góc hay khoảng cách bên trong một khối đặc 3D khổng lồ thường vượt quá khả năng dựng hình của não bộ.
  
  Thiết diện (mặt cắt) chính là giải pháp chia để trị: chọn đúng một mặt phẳng cắt qua khối hình để biến bài toán không gian phức tạp thành một bài toán hình học phẳng dễ đọc hơn nhiều.
]

#vd-box("6", "Cách dựng thiết diện của một hình chóp tam giác (tứ diện)")[
  #grid(
    columns: (1.25fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      Cho hình chóp tam giác $S.A B C$. Một mặt phẳng $(alpha)$ cắt các cạnh bên $S A, S B, S C$ lần lượt tại $M, N, P$. 
      
      Thiết diện của hình chóp cắt bởi mặt phẳng $(alpha)$ chính là tam giác $M N P$. 
      
      Quy trình tìm thiết diện tổng quát không dựa vào võ đoán, mà được xây dựng chặt chẽ từ việc tìm giao tuyến của mặt phẳng cắt $(alpha)$ với các mặt biên của hình chóp theo thứ tự:
      - Xác định các điểm chung của mặt phẳng cắt với các mặt bên (ví dụ $M, N$ nằm trên mặt bên $S A B$).
      - Vẽ các đoạn giao tuyến giới hạn trên các mặt bên (đoạn $M N$, $N P$).
      - Với các mặt khuất phía sau (mặt $S A C$), giao tuyến $M P$ được vẽ bằng nét đứt.
    ],
    [
      #align(center)[
        #canvas(length: 1.1cm, {
          import draw: *
          let sx = -0.4
          let sy = -0.3
          let proj(x, y, z) = (x + y * sx, z + y * sy)
          
          // Định nghĩa tọa độ các đỉnh tứ diện S.ABC
          let A = proj(0.5, 2.2, 0)
          let B = proj(3.5, 2.2, 0)
          let C = proj(2.2, 0, 0)
          let S = proj(1.8, 1.0, 3.0)
          
          // Các giao điểm trên các cạnh: M, N, P
          // M = S + 0.5 * (A - S)
          let M = proj(1.15, 1.6, 1.5)
          // N = S + 0.45 * (B - S)
          let N = proj(2.565, 1.54, 1.65)
          // P = S + 0.7 * (C - S)
          let P = proj(2.08, 0.3, 0.9)
          
          // Vẽ màu fill cho thiết diện trước (nằm dưới các nét vẽ)
          line(M, N, P, close: true, fill: rgb("#0F766E1a"), stroke: none)
          
          // Cạnh khuất của tứ diện (AC)
          line(A, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          // Cạnh khuất của thiết diện (MP)
          line(M, P, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
          
          // Các cạnh thấy của tứ diện
          line(S, A, stroke: 1pt + black)
          line(S, B, stroke: 1pt + black)
          line(S, C, stroke: 1pt + black)
          line(A, B, stroke: 1pt + black)
          line(B, C, stroke: 1pt + black)
          
          // Các cạnh thấy của thiết diện
          line(M, N, stroke: 1.5pt + rgb("#0F766E"))
          line(N, P, stroke: 1.5pt + rgb("#0F766E"))
          
          // Vẽ các điểm
          circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.25), $S$, size: 9pt)
          circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.2, A.at(1) - 0.2), $A$, size: 9pt)
          circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.2, B.at(1) - 0.2), $B$, size: 9pt)
          circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.2, C.at(1) + 0.15), $C$, size: 9pt)
          
          circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.25, M.at(1) + 0.1), $M$, size: 9pt, fill: rgb("#0F766E"))
          circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) + 0.25, N.at(1) + 0.1), $N$, size: 9pt, fill: rgb("#0F766E"))
          circle(P, radius: 1.8pt, fill: rgb("#0F766E")); content((P.at(0) + 0.1, P.at(1) - 0.25), $P$, size: 9pt, fill: rgb("#0F766E"))
        })
      ]
    ]
  )
]

#essay-box("Khai mở tư duy: Thiết diện là chiếc máy quét CT-scan trong hình học")[
  Trong y khoa, khi bác sĩ muốn chẩn đoán cấu trúc phức tạp bên trong cơ thể người, họ không thể "nhìn xuyên thấu" trực tiếp. Thay vào đó, họ sử dụng công nghệ chụp cắt lớp vi tính (CT-scan). Máy quét chụp hàng ngàn lát cắt 2D mỏng đi qua cơ thể. Bác sĩ phân tích từng lát cắt phẳng này để hiểu chính xác tổn thương trong không gian 3D.
  
  Mặt phẳng phụ và thiết diện trong hình học không gian làm việc y hệt như chiếc máy quét CT-scan. 
  
  Khi gặp một câu hỏi cực khó về khoảng cách giữa hai đường chéo nhau, hay góc giữa hai mặt phẳng, một học sinh giỏi sẽ không nhìn chằm chằm vào khối đa diện lớn. Họ sẽ đi tìm hoặc dựng một "lát cắt" đi qua đúng các điểm mấu chốt. Lát cắt phẳng ấy chứa trọn vẹn câu trả lời dưới dạng một bài toán tam giác hoặc đường tròn cực kỳ dễ giải quyết.
]

#core-box[
  Công thức tìm thiết diện an toàn:
  
  1. *Tìm giao tuyến trực tiếp:* Xem mặt phẳng cắt có sẵn giao tuyến với mặt nào của hình chóp không.
  2. *Kéo dài để tìm điểm chung:* Nếu chưa đủ giao tuyến, kéo dài các cạnh của mặt phẳng cắt và các cạnh của hình chóp trên cùng một mặt phẳng để tạo ra các giao điểm mới.
  3. *Khép kín đa giác:* Nối các giao điểm mới lại để khép kín thành một đa giác thiết diện. Mọi đường thẳng nằm trên mặt khuất bắt buộc phải vẽ bằng nét đứt.
]
