#import "../_theme.typ": *

== 12. Khi Nào Giữ Hình, Khi Nào Vào Vectơ, Khi Nào Vào Oxyz?

#why-box[
  Học toán không phải là học thuộc lòng các phương pháp rồi áp dụng một cách mù quáng. Đỉnh cao của tư duy 3D là khả năng *dịch chuyển linh hoạt giữa các hệ ngôn ngữ*: từ hình học tổng hợp Euclide cổ điển sang đại số vectơ, rồi nén mạnh vào tọa độ Đề-các Oxyz khi cần thiết. 
  
  Mỗi ngôn ngữ là một thấu kính giúp bộ não nhìn thấy những khía cạnh cấu trúc khác nhau của cùng một bài toán.
]

=== Bảng so sánh đặc tính ba ngôn ngữ hình học 3D

#v(0.5em)
#align(center)[
  #table(
    columns: (1.1fr, 2fr, 2fr, 2fr),
    inset: 9pt,
    align: (left + horizon),
    stroke: 0.5pt + gray.lighten(40%),
    fill: (x, y) => if y == 0 { rgb("#0F766E").lighten(94%) } else { none },
    [#text(weight: "bold", fill: C-FOREST)[Tiêu chí]], 
    [#text(weight: "bold", fill: C-FOREST)[Euclide Cổ điển]], 
    [#text(weight: "bold", fill: C-FOREST)[Đại số Vectơ]], 
    [#text(weight: "bold", fill: C-FOREST)[Tọa độ Oxyz]],
    
    [*Bản chất*], 
    [Hình học tổng hợp phẳng hóa các mặt bên.], 
    [Đại số hóa hướng và phép dịch chuyển.], 
    [Số hóa toàn bộ điểm thành các bộ số.],
    
    [*Thế mạnh*], 
    [Rất nhanh nếu hình có tính đối xứng cao, dễ tìm mặt phẳng phụ.], 
    [Rất mạnh cho bài toán tỷ lệ, đồng phẳng, phi tọa độ.], 
    [Giải quyết cơ học mọi bài toán khoảng cách, góc, giao cắt phức tạp.],
    
    [*Hạn chế*], 
    [Yêu cầu trực giác cực tốt, phải dựng thêm nhiều đường phụ lắt léo.], 
    [Phải chọn hệ vectơ cơ sở khéo léo, dễ nhầm dấu.], 
    [Khối lượng tính toán số học lớn, dễ sai sót đại số nếu tọa độ lẻ.],
    
    [*Khi nào dùng?*], 
    [Khi cấu trúc song song, vuông góc trực quan đã quá rõ ràng.], 
    [Khi bài toán liên quan đến tỉ lệ đoạn thẳng, đồng phẳng hoặc hướng.], 
    [Khi bài toán có nhiều đường chéo nhau lơ lửng và hệ trục vuông góc sẵn.]
  )
]
#v(0.5em)

#vd-box("11", "Tính góc giữa hai đường chéo mặt của hình lập phương")[
  Cho hình lập phương $A B C D.A' B' C' D'$ cạnh $a$. Hãy tính góc giữa hai đường thẳng $A' B$ (nằm trên mặt đứng trái) và $B C'$ (nằm trên mặt đứng phải).
  
  #v(0.4em)
  #set enum(indent: 0.5em)
  + *Cách 1: Sử dụng ngôn ngữ Euclide cổ điển (Dựng hình tổng hợp)*
    - Ta nối điểm $A'$ với $C'$ để tạo thành tam giác $A' B C'$.
    - Nhận xét: $A' B$, $B C'$ và $C' A'$ lần lượt là các đường chéo của các mặt hình vuông của hình lập phương.
    - Do đó: $A' B = B C' = C' A' = a sqrt(2)$.
    - Suy ra tam giác $A' B C'$ là tam giác đều.
    - Vậy góc giữa $A' B$ and $B C'$ bằng góc $angle A' B C' = 60^degree$.
    - *Đánh giá:* Cực kỳ nhanh và thanh thoát nhờ phát hiện ra tam giác đều lồng trong khối lập phương.

  + *Cách 2: Sử dụng ngôn ngữ Vectơ (Đại số hóa phi tọa độ)*
    - Ta tính tích vô hướng của hai vectơ chỉ phương $vec(u) = vec(B A')$ and $vec(v) = vec(B C')$.
    - Chọn hệ ba vectơ cơ sở vuông góc từng đôi một tại đỉnh $B$: $vec(x) = vec(B A)$, $vec(y) = vec(B C)$, $vec(z) = vec(B B')$ có độ dài bằng $a$.
    - Phân tích:
      - $vec(u) = vec(B A') = vec(B A) + vec(B B') = vec(x) + vec(z)$
      - $vec(v) = vec(B C') = vec(B C) + vec(B B') = vec(y) + vec(z)$
    - Tính tích vô hướng:
      $ vec(u) dot vec(v) = (vec(x) + vec(z)) dot (vec(y) + vec(z)) = vec(x) dot vec(y) + vec(x) dot vec(z) + vec(z) dot vec(y) + |vec(z)|^2 = 0 + 0 + 0 + a^2 = a^2 $
    - Tính độ dài: $|vec(u)| = a sqrt(2)$, $|vec(v)| = a sqrt(2)$.
    - Tính cosin: $cos(vec(u), vec(v)) = a^2 / ((a sqrt(2)) dot (a sqrt(2))) = a^2 / (2 a^2) = 1/2 => angle(vec(u), vec(v)) = 60^degree$.
    - *Đánh giá:* Rất logic, không cần vẽ thêm đoạn $A' C'$, hoàn toàn tính toán bằng phân tích vectơ cơ sở.

  + *Cách 3: Sử dụng ngôn ngữ Oxyz (Tọa độ hóa Đề-các)*
    - Chọn hệ trục tọa độ Oxyz có gốc $B(0,0,0)$.
    - Trục $O x$ chứa $B A => A(a, 0, 0)$.
    - Trục $O y$ chứa $B C => C(0, a, 0)$.
    - Trục $O z$ chứa $B B' => B'(0, 0, a)$.
    - Từ đó, ta có tọa độ các đỉnh: $A'(a, 0, a)$ và $C'(0, a, a)$.
    - Xác định các vectơ:
      - $vec(B A') = (a, 0, a)$
      - $vec(B C') = (0, a, a)$
    - Tính toán góc:
      $ cos angle(vec(B A'), vec(B C')) = |a dot 0 + 0 dot a + a dot a| / (sqrt(a^2+0^2+a^2) dot sqrt(0^2+a^2+a^2)) = a^2 / (2 a^2) = 1/2 => "Góc" = 60^degree $
    - *Đánh giá:* Thuần túy tính toán số học trên tọa độ, quy trình rõ ràng và không cần bất kỳ trực giác không gian nào.
]

#core-box[
  Chiến thuật chọn ngôn ngữ khi làm bài 3D:
  
  - *Nếu đề bài cho khối lập phương, hộp chữ nhật hoặc chóp có đáy là hình vuông và đường cao đứng vuông góc đáy:* Hãy ưu tiên đặt ngay hệ trục tọa độ Oxyz. Đây là cấu hình "thánh địa" của tọa độ hóa.
  - *Nếu đề bài cho các góc, tỉ số đoạn thẳng và yêu cầu chứng minh đồng phẳng hoặc vuông góc mà không có các cạnh vuông góc trực tiếp:* Hãy ưu tiên dùng phương pháp vectơ.
  - *Nếu đề bài cho cấu hình hình chóp tam giác đều, các khối tròn xoay đơn giản:* Hãy giữ nguyên tư duy Euclide bằng cách tìm các tam giác vuông chứa các chiều cao và bán kính để tính trực tiếp.
]
