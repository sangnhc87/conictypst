#import "@preview/cetz:0.5.2"

== A. LÝ THUYẾT NỀN TẢNG & PHƯƠNG PHÁP TƯ DUY

Để giải quyết bài toán cực trị khoảng cách giữa điểm $M$ di động trên đường tròn $(C_1)$ và điểm $N$ di động trên đường tròn $(C_2)$ trong không gian $O x y z$, ta cần nắm vững ba phương pháp tư duy hình học và mô hình toán học cốt lõi sau:

1. *Phương pháp chiếu song song và phân rã phẳng (Cho trường hợp hai mặt phẳng song song):*
   Khi $(C_1)$ nằm trên mặt phẳng $(P_1)$ và $(C_2)$ nằm trên mặt phẳng $(P_2)$ song song với nhau cách nhau một khoảng bằng $h$:
   - Chiếu vuông góc điểm $M$ của $(C_1)$ lên mặt phẳng $(P_2)$ chứa $(C_2)$, ta được hình chiếu $M'$. Khi đó $M'$ chạy trên một đường tròn hình chiếu $(C_1')$ có cùng bán kính với $(C_1)$.
   - Khoảng cách không gian $M N$ được tính bằng định lý Pytago đứng:
     $ M N = sqrt(M' N^2 + h^2) $

     #align(center)[#cetz.canvas(length: 1.8cm, {
       import cetz.draw: *
       let prj(x, y, z) = {
         let xp = y - 0.2 * x
         let yp = z - 0.1 * x
         (xp, yp)
       }
       
       let v000 = prj(0,0,0); let v600 = prj(6,0,0); let v660 = prj(6,6,0); let v060 = prj(0,6,0)
       let v006 = prj(0,0,6); let v606 = prj(6,0,6); let v666 = prj(6,6,6); let v066 = prj(0,6,6)
       // Hidden edges of reference cube
       line(v000, v600, stroke: (dash: "dashed", paint: gray))
       line(v000, v060, stroke: (dash: "dashed", paint: gray))
       line(v000, v006, stroke: (dash: "dashed", paint: gray))
       // Solid edges of reference cube
       line(v600, v660, v060, stroke: 0.5pt + gray)
       line(v006, v606, v666, v066, close: true, stroke: 0.5pt + gray)
       line(v600, v606, stroke: 0.5pt + gray)
       line(v660, v666, stroke: 0.5pt + gray)
       line(v060, v066, stroke: 0.5pt + gray)
       
       // Planes labeling
       content(prj(6,4.5,0), [$(P_2)$], anchor: "south")
       content(prj(6,4.5,6), [$(P_1)$], anchor: "south")
       
       // C2 on P2
       let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
       line(..pts2, stroke: 1pt + rgb("#dc2626"))
       content(prj(3,0.5,0), [$(C_2)$], anchor: "west")
       
       // C1' (projection of C1) on P2
       let pts1_prime = range(0, 365, step: 5).map(d => prj(1.5 + 1.5 * calc.cos(d * 1deg), 2.5 + 1.5 * calc.sin(d * 1deg), 0))
       line(..pts1_prime, stroke: (dash: "dashed", paint: rgb("#16a34a")))
       content(prj(1.5, 1, 0), [$(C_1')$], anchor: "north")
       
       // C1 on P1
       let pts1 = range(0, 365, step: 5).map(d => prj(1.5 + 1.5 * calc.cos(d * 1deg), 2.5 + 1.5 * calc.sin(d * 1deg), 6))
       line(..pts1, stroke: 1pt + rgb("#16a34a"))
       content(prj(1.5, 1, 6), [$(C_1)$], anchor: "north")
       
       let M = prj(1.5, 4, 6)
       let M_prime = prj(1.5, 4, 0)
       let N = prj(3, 5.5, 0)
       
       circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
       content(M, [$M$], anchor: "south", padding: 3pt)
       
       circle(M_prime, radius: 1.5pt, fill: black)
       content(M_prime, [$M'$], anchor: "north", padding: 3pt)
       
       circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
       content(N, [$N$], anchor: "south-west", padding: 3pt)
       
       // Height h
       line(M, M_prime, stroke: (dash: "dashed", paint: black))
       content(prj(1.5, 4, 3), [$h$], anchor: "east")
       
       // Flat distance M'N and space distance MN
       line(M_prime, N, stroke: 0.5pt + rgb("#ea580c"))
       line(M, N, stroke: 1.5pt + rgb("#ea580c"))
     })]

   - Do chiều cao đứng $h$ là hằng số, $M N$ đạt cực trị khi và chỉ khi khoảng cách phẳng $M' N$ giữa hai đường tròn đồng phẳng $(C_1')$ và $(C_2)$ trên mặt phẳng $(P_2)$ đạt cực trị. Ta xét 3 vị trí tương đối phẳng của hai hình chiếu này:
     - *Rời nhau:* Khoảng cách nối hai tâm chiếu $d = J_1' J_2 > R_1 + R_2$. Khi đó $M' N_(min) = d - R_1 - R_2$ (hai điểm quay mặt vào nhau):
       $ M N_(min) = sqrt(h^2 + (d - R_1 - R_2)^2) $
     - *Lồng nhau:* Khoảng cách nối hai tâm chiếu $d < |R_1 - R_2|$. Khi đó $M' N_(min) = |R_1 - R_2| - d$ (hai điểm đuổi nhau về một phía):
       $ M N_(min) = sqrt(h^2 + (|R_1 - R_2| - d)^2) $
     - *Cắt nhau hoặc tiếp xúc:* Hai đường tròn chiếu $(C_1')$ và $(C_2)$ có giao điểm hoặc điểm tiếp xúc chung (tại đó khoảng cách phẳng cực tiểu bằng $0$). Khi đó cực tiểu không gian chính là chiều cao đứng thẳng:
       $ M N_(min) = h $

     #align(center)[
       #grid(
         columns: (1fr, 1fr, 1fr),
         gutter: 10pt,
         [
           #block(stroke: 0.5pt + gray, inset: 6pt, radius: 4pt, width: 100%)[
             #text(size: 8pt, weight: "bold")[a) Rời nhau ($d > R_1 + R_2$)] \
             #v(0.2em)
             #cetz.canvas(length: 0.35cm, {
               import cetz.draw: *
               rect((-3.5,-3), (6.5,3), fill: rgb("deebf730"), stroke: 0.3pt + gray)
               let J1p = (0,0)
               let J2 = (3.5,0)
               circle(J1p, radius: 2.2, stroke: (dash: "dashed", paint: rgb("#16a34a")), fill: none)
               circle(J2, radius: 1.0, stroke: 1pt + rgb("#dc2626"), fill: none)
               circle(J1p, radius: 1.5pt, fill: black)
               circle(J2, radius: 1.5pt, fill: black)
               content(J1p, [$J_1'$], anchor: "north", padding: 2pt)
               content(J2, [$J_2$], anchor: "north", padding: 2pt)
               line(J1p, J2, stroke: 0.5pt + gray)
               
               let Mp = (2.2, 0)
               let N = (2.5, 0)
               circle(Mp, radius: 1.5pt, fill: black)
               content(Mp, [$M'$], anchor: "south-east", padding: 1pt)
               circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
               content(N, [$N$], anchor: "south-west", padding: 1pt)
               line(Mp, N, stroke: 1.5pt + rgb("#ea580c"))
             })
           ]
         ],
         [
           #block(stroke: 0.5pt + gray, inset: 6pt, radius: 4pt, width: 100%)[
             #text(size: 8pt, weight: "bold")[b) Lồng nhau ($d < |R_1 - R_2|$)] \
             #v(0.2em)
             #cetz.canvas(length: 0.35cm, {
               import cetz.draw: *
               rect((-3.5,-3), (3.5,3), fill: rgb("deebf730"), stroke: 0.3pt + gray)
               let J1p = (0,0)
               let J2 = (0.8,0)
               circle(J1p, radius: 3.0, stroke: (dash: "dashed", paint: rgb("#16a34a")), fill: none)
               circle(J2, radius: 1.0, stroke: 1pt + rgb("#dc2626"), fill: none)
               circle(J1p, radius: 1.5pt, fill: black)
               circle(J2, radius: 1.5pt, fill: black)
               content(J1p, [$J_1'$], anchor: "north", padding: 2pt)
               content(J2, [$J_2$], anchor: "north", padding: 2pt)
               line(J1p, (3,0), stroke: 0.5pt + gray)
               
               let Mp = (3, 0)
               let N = (1.8, 0)
               circle(Mp, radius: 1.5pt, fill: black)
               content(Mp, [$M'$], anchor: "south-west", padding: 1pt)
               circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
               content(N, [$N$], anchor: "south-east", padding: 1pt)
               line(Mp, N, stroke: 1.5pt + rgb("#ea580c"))
             })
           ]
         ],
         [
           #block(stroke: 0.5pt + gray, inset: 6pt, radius: 4pt, width: 100%)[
             #text(size: 8pt, weight: "bold")[c) Cắt nhau ($M'N_(min) = 0$)] \
             #v(0.2em)
             #cetz.canvas(length: 0.35cm, {
               import cetz.draw: *
               rect((-3.5,-3), (3.5,3), fill: rgb("deebf730"), stroke: 0.3pt + gray)
               let J1p = (0,0)
               let J2 = (1.5,0)
               circle(J1p, radius: 2.2, stroke: (dash: "dashed", paint: rgb("#16a34a")), fill: none)
               circle(J2, radius: 1.5, stroke: 1pt + rgb("#dc2626"), fill: none)
               circle(J1p, radius: 1.5pt, fill: black)
               circle(J2, radius: 1.5pt, fill: black)
               content(J1p, [$J_1'$], anchor: "north", padding: 2pt)
               content(J2, [$J_2$], anchor: "north", padding: 2pt)
               line(J1p, J2, stroke: 0.5pt + gray)
               
               // Intersection point Mp = N
               let MpN = (1.2, 1.84)
               circle(MpN, radius: 1.5pt, fill: rgb("#ea580c"))
               content(MpN, [$M' equiv N$], anchor: "south", padding: 2pt)
             })
           ]
         ]
       )
     ]

2. *Phương pháp chiếu vuông góc và phân rã Pytago (Cho trường hợp hai mặt phẳng chéo nhau, vuông góc hoặc nghiêng):*
   Khi mặt phẳng chứa hai đường tròn cắt nhau (góc giữa hai mặt phẳng bằng $alpha$):
   - Ta lấy điểm $M$ thuộc đường tròn $(C_1)$ trên mặt phẳng $(P_1)$, và chiếu vuông góc $M$ xuống mặt phẳng $(P_2)$ chứa $(C_2)$ được hình chiếu $M_p$.
   - Khi đó, tam giác $M M_p N$ vuông tại $M_p$ với mọi $N in (C_2)$ trên mặt phẳng $(P_2)$. Theo định lý Pytago không gian:
     $ M N = sqrt(M M_p^2 + M_p N^2) $
   - Trong đó, $M M_p = d(M, P_2)$ là khoảng cách từ $M$ đến mặt phẳng $(P_2)$ (chỉ phụ thuộc vào vị trí của $M$).
   - Với điểm $M$ cố định, khoảng cách $M N$ nhỏ nhất khi và chỉ khi khoảng cách phẳng $M_p N$ nhỏ nhất. Mà $N$ chạy trên đường tròn $(C_2)$ có tâm $J_2$, bán kính $R_2$ trong mặt phẳng $(P_2)$, nên khoảng cách phẳng nhỏ nhất là:
     $ M_p N_(min) = |M_p J_2 - R_2| $
   - Do đó, khoảng cách ngắn nhất từ điểm $M$ đến đường tròn $(C_2)$ được xác định bởi công thức Pytago phân rã chính xác:
     $ d(M, (C_2)) = sqrt(d(M, P_2)^2 + (M_p J_2 - R_2)^2) $

     #align(center)[#cetz.canvas(length: 1.8cm, {
       import cetz.draw: *
       let prj(x, y, z) = {
         let xp = y - 0.2 * x
         let yp = z - 0.1 * x
         (xp, yp)
       }
       
       let v000 = prj(0,0,0); let v600 = prj(6,0,0); let v660 = prj(6,6,0); let v060 = prj(0,6,0)
       let v006 = prj(0,0,6); let v606 = prj(6,0,6); let v666 = prj(6,6,6); let v066 = prj(0,6,6)
       // Hidden edges
       line(v000, v600, stroke: (dash: "dashed", paint: gray))
       line(v000, v060, stroke: (dash: "dashed", paint: gray))
       line(v000, v006, stroke: (dash: "dashed", paint: gray))
       // Solid edges
       line(v600, v660, v060, stroke: 0.5pt + gray)
       line(v006, v606, v666, v066, close: true, stroke: 0.5pt + gray)
       line(v600, v606, stroke: 0.5pt + gray)
       line(v660, v666, stroke: 0.5pt + gray)
       line(v060, v066, stroke: 0.5pt + gray)
       
       // P1: bottom face
       content(prj(6,4,0), [$(P_1)$], anchor: "south")
       // P2: right face (y=6)
       content(prj(4,6,6), [$(P_2)$], anchor: "south")
       
       // C1 on bottom (z=0)
       let pts1 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
       line(..pts1, stroke: 1pt + rgb("#16a34a"))
       content(prj(3,0.5,0), [$(C_1)$], anchor: "west")
       
       // C2 on right (y=6)
       let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2 * calc.cos(d * 1deg), 6, 3 + 2 * calc.sin(d * 1deg)))
       line(..pts2, stroke: 1pt + rgb("#dc2626"))
       content(prj(3,6,5.5), [$(C_2)$], anchor: "east")
       
       let M = prj(1, 4.5, 0)
       let M_p = prj(1, 6, 0)
       let J2 = prj(3, 6, 3)
       
       // Choose N on C2 closest to Mp
       let N = prj(3 - 2 * 2/3.6, 6, 3 - 2 * 3/3.6)
       
       circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
       content(M, [$M$], anchor: "north", padding: 3pt)
       
       circle(M_p, radius: 1.5pt, fill: black)
       content(M_p, [$M_p$], anchor: "north-west", padding: 3pt)
       
       circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
       content(N, [$N$], anchor: "south-east", padding: 3pt)
       
       circle(J2, radius: 1.5pt, fill: black)
       content(J2, [$J_2$], anchor: "south", padding: 3pt)
       
       line(M, M_p, stroke: (dash: "dashed", paint: black))
       line(M_p, N, stroke: 0.5pt + rgb("#ea580c"))
       line(M, N, stroke: 1.2pt + rgb("#ea580c"))
       line(M_p, J2, stroke: (dash: "dashed", paint: gray))
       line(J2, N, stroke: (dash: "dashed", paint: gray))
     })]

   - *Kỹ thuật quy giản thi cử về tâm (Đánh giá chặn dưới):* Trong thực tế làm bài thi trắc nghiệm, do biểu thức Pytago chính xác có dạng vô tỷ kép rất phức tạp để giải bằng tay, ta sử dụng đánh giá xấp xỉ hình học thông qua tâm đường tròn:
     $ M N >= M J_2 - R_2 $
     Đoạn $M N$ ngắn nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2$ là nhỏ nhất. Điều này đưa bài toán về dạng cơ bản hơn là tìm cực trị khoảng cách từ một điểm trên đường tròn $(C_1)$ đến một điểm cố định $J_2$.

     #align(center)[
       #grid(
         columns: (1fr, 1.2fr),
         gutter: 12pt,
         [
           #block(stroke: 0.5pt + gray, inset: 8pt, radius: 4pt, width: 100%)[
             #text(size: 8.5pt, weight: "bold")[Đánh giá hình học về tâm $J_2$] \
             #v(0.3em)
             #cetz.canvas(length: 0.55cm, {
               import cetz.draw: *
               rect((-1,-2), (7,2), fill: rgb("deebf720"), stroke: 0.3pt + gray)
               let J2 = (4, 0)
               circle(J2, radius: 1.5, stroke: 1pt + rgb("#dc2626"), fill: none)
               circle(J2, radius: 1.5pt, fill: black)
               content(J2, [$J_2$], anchor: "north", padding: 3pt)
               content((5.5, 0), [$(C_2)$], anchor: "west")
               
               let M = (0, 1.2)
               circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
               content(M, [$M$], anchor: "south-east", padding: 3pt)
               
               line(M, J2, stroke: (dash: "dashed", paint: gray))
               
               // Intersection with circle C2
               let angle = calc.atan2(4, -1.2)
               let Nx = 4 - 1.5 * calc.cos(angle)
               let Ny = 0 - 1.5 * calc.sin(angle)
               let N_min = (Nx, Ny)
               
               circle(N_min, radius: 1.5pt, fill: rgb("#dc2626"))
               content(N_min, [$N$], anchor: "south-west", padding: 2pt)
               
               line(M, N_min, stroke: 2pt + rgb("#ea580c"))
               line(N_min, J2, stroke: 1pt + rgb("#dc2626"))
               content((3.6, -0.4), [$R_2$], anchor: "north", padding: 1pt)
             })
           ]
         ],
         [
           #block(stroke: 0.5pt + gray, inset: 8pt, radius: 4pt, width: 100%)[
             #text(size: 8.5pt, weight: "bold")[Chứng minh Bất đẳng thức tam giác] \
             #v(0.3em)
             Với mọi điểm $N$ thuộc $(C_2)$, trong tam giác không gian $M N J_2$, ta luôn có:
             $ M N + N J_2 >= M J_2 $
             Mà $N J_2 = R_2$ (bán kính), do đó:
             $ M N + R_2 >= M J_2 \ => M N >= M J_2 - R_2 $
             Dấu "=" xảy ra khi và chỉ khi ba điểm $M, N, J_2$ thẳng hàng theo thứ tự đó.
           ]
         ]
       )
     ]

     - *Lưu ý sư phạm quan trọng - Lựa chọn hướng chiếu:*
       *Câu hỏi:* Tại sao ta chiếu điểm $M in (C_1)$ lên mặt phẳng $(P_2)$ chứa $(C_2)$ mà không làm ngược lại (chiếu $N in (C_2)$ lên mặt phẳng $(P_1)$)?
       *Trả lời:*
       - *Tính đối xứng:* Về mặt toán học, hai hướng chiếu là hoàn toàn đối xứng và luôn cho cùng một kết quả khoảng cách ngắn nhất $M N$ vì vai trò của $M, N$ trong không gian là tương đương nhau.
       - *Tiêu chí lựa chọn hướng chiếu tối ưu (để tính toán đơn giản nhất):* Ta nên chọn chiếu từ điểm trên mặt phẳng/đường tròn có cấu trúc phức tạp hơn sang mặt phẳng chứa đường tròn có cấu trúc đơn giản hơn theo hai tiêu chí:
         1. *Mặt phẳng đơn giản hơn:* Ưu tiên chiếu về các mặt phẳng tọa độ ($O x y: z=0$, $O y z: x=0$, $O x z: y=0$) hoặc mặt phẳng song song với mặt tọa độ. Phương trình của các mặt phẳng này cực kỳ đơn giản, giúp cho tọa độ hình chiếu $M_p$ có nhiều thành phần bằng $0$, làm giảm số lượng biến số và phép tính căn thức.
         2. *Bán kính và tham số hóa:* Nên chọn chiếu điểm từ đường tròn có bán kính lớn hơn (hoặc dễ tham số hóa hơn) sang mặt phẳng chứa đường tròn nhỏ hơn, giúp việc lấy hiệu hai bán kính $|M_p J_2 - R_2|$ trong Pytago không bị vấp phải dấu trị tuyệt đối phức tạp khi biến đổi đạo hàm.

3. *Phương pháp đạo hàm & Công thức khoảng cách tổng quát (Giải pháp vạn năng bằng Casio/Đạo hàm):*
   Trong phòng thi trắc nghiệm, nếu không muốn dựng hình chiếu phức tạp, ta có thể thiết lập trực tiếp hàm số khoảng cách một biến số bằng cách sử dụng *Công thức khoảng cách vạn năng từ một điểm $M$ bất kỳ đến đường tròn $(C_2)$* có tâm $J_2$, bán kính $R_2$ nằm trên mặt phẳng $(P_2)$:
   - Xét tam giác vuông $M M_p J_2$ tại hình chiếu $M_p$ của $M$ trên $(P_2)$, ta có hệ thức Pytago liên kết:
     $ M J_2^2 = M M_p^2 + M_p J_2^2 = d(M, P_2)^2 + M_p J_2^2 $
     $ => M_p J_2 = sqrt(M J_2^2 - d(M, P_2)^2) $
   - Khoảng cách từ $M$ đến đường tròn $(C_2)$ trong mặt phẳng $(P_2)$ là:
     $ d(M, (C_2)) = sqrt(d(M, P_2)^2 + (M_p J_2 - R_2)^2) $
     $ = sqrt(d(M, P_2)^2 + M_p J_2^2 - 2 R_2 M_p J_2 + R_2^2) $
     Thế biểu thức $M_p J_2$ ở trên vào, ta có công thức rút gọn vạn năng:
     $ d(M, (C_2)) = sqrt(M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2)) $

   #align(center)[
     #block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 10pt, width: 100%)[
       #grid(
         columns: (1.2fr, 1fr),
         gutter: 14pt,
         align: (left + top, center + horizon),
         [
           #text(weight: "bold", fill: rgb("1A5276"))[Ý tưởng hình học của Công thức vạn năng:] \
           - Xét tam giác vuông $M M_p J_2$ tại $M_p$ (hình chiếu của $M$ lên $(P_2)$):
             $ M_p J_2 = sqrt(M J_2^2 - d(M, P_2)^2) $
           - Khoảng cách cực tiểu phẳng từ hình chiếu $M_p$ đến đường tròn $(C_2)$ là:
             $ M_p N_(min) = |M_p J_2 - R_2| $
           - Áp dụng định lý Pytago cho tam giác vuông không gian $M M_p N$ tại $M_p$:
             $ d(M, (C_2)) = sqrt(d(M, P_2)^2 + (M_p J_2 - R_2)^2) $
           Hệ thức vạn năng này giúp tính toán khoảng cách từ $M$ đến đường tròn $(C_2)$ nhanh chóng mà không cần tìm tọa độ chi tiết của hình chiếu $M_p$.
         ],
         [
           #cetz.canvas(length: 0.55cm, {
             import cetz.draw: *
             line((-2,-2), (5,-2), (6,2.5), (-1,2.5), close: true, fill: rgb("fef08a15"), stroke: 0.5pt + rgb("#ca8a04"))
             content((5, 2.2), [$(P_2)$], anchor: "east")
             
             let Mp = (0, 0)
             let J2 = (4, 0)
             let M = (0, 3)
             
             circle(J2, radius: 1.5, stroke: 1pt + rgb("#dc2626"), fill: none)
             circle(J2, radius: 1.5pt, fill: black)
             content(J2, [$J_2$], anchor: "north", padding: 3pt)
             
             circle(Mp, radius: 1.5pt, fill: black)
             content(Mp, [$M_p$], anchor: "south-east", padding: 3pt)
             
             circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
             content(M, [$M$], anchor: "south", padding: 3pt)
             
             let N = (2.5, 0)
             circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
             content(N, [$N$], anchor: "south-west", padding: 2pt)
             
             line(M, Mp, stroke: (dash: "dashed", paint: rgb("#6366f1")), name: "height")
             content("height.mid", [$d(M, P_2)$], anchor: "east", padding: 3pt)
             
             line(Mp, J2, stroke: (dash: "dashed", paint: rgb("#6366f1")), name: "base")
             line(M, J2, stroke: (dash: "dotted", paint: gray), name: "hypot")
             content("hypot.mid", [$M J_2$], anchor: "south-west", padding: 1pt)
             
             line(M, N, stroke: 1.8pt + rgb("#ea580c"), name: "dist")
             line(Mp, N, stroke: (dash: "dashed", paint: rgb("#ea580c")), name: "base_n")
             
             let sq = 0.25
             line((0, sq), (sq, sq), (sq, 0), stroke: 0.5pt + gray)
           })
         ]
       )
     ]
   ]

   - *Quy trình giải tổng quát bằng đạo hàm một biến:*
     - *Bước 1:* Tham số hóa tọa độ điểm $M(t)$ di động trên đường tròn $(C_1)$ theo góc lượng giác $t in [0; 2 pi)$.
     - *Bước 2:* Tính khoảng cách bình phương từ $M(t)$ đến tâm cố định $J_2$: $g(t) = M J_2^2$, và khoảng cách từ $M(t)$ đến mặt phẳng $(P_2)$ chứa đường tròn $(C_2)$: $h(t) = d(M(t), P_2)$.
     - *Bước 3:* Thiết lập hàm số khoảng cách bình phương toàn phần $F(t) = d(M(t), (C_2))^2$:
       $ F(t) = g(t) + R_2^2 - 2 R_2 sqrt(g(t) - h(t)^2) $
     - *Bước 4:* Khảo sát đạo hàm $F'(t) = 0$ để tìm cực trị, hoặc sử dụng chức năng lập bảng giá trị (Table) trên máy tính Casio để tìm giá trị nhỏ nhất của $F(t)$ trên đoạn $[0; 2 pi]$ một cách cực kỳ nhanh chóng và chính xác.
