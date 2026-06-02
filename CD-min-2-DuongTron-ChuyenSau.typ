#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *

#set page(
  paper: "a4",
  margin: (x: 1cm, y: 1.5cm),
)
#set text(font: "New Computer Modern", size: 10pt, lang: "vi")
#set par(justify: true, leading: 0.75em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.2em,
  below: 0.6em,
  text(fill: rgb("900C3F"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        CHUYÊN ĐỀ CHUYÊN SÂU: CỰC TRỊ KHOẢNG CÁCH 2 ĐƯỜNG TRÒN TRONG 3D
      ]
      #v(0.3em)
      #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
        Hệ thống toàn diện 12 Cấu hình hình học & Mô hình thực tế phân loại cao
      ]
    ],
  )
]

== A. LÝ THUYẾT NỀN TẢNG & PHƯƠNG PHÁP TƯ DUY

Để giải quyết bài toán cực trị khoảng cách giữa điểm $M$ di động trên đường tròn $(C_1)$ và điểm $N$ di động trên đường tròn $(C_2)$ trong không gian $O x y z$, ta cần nắm vững ba phương pháp tư duy hình học và mô hình toán học cốt lõi sau:

1. *Phương pháp chiếu song song và phân rã phẳng (Cho trường hợp hai mặt phẳng song song):*
   Khi $(C_1)$ nằm trên mặt phẳng $(P_1)$ và $(C_2)$ nằm trên mặt phẳng $(P_2)$ song song với nhau cách nhau một khoảng bằng $h$:
   - Chiếu vuông góc điểm $M$ của $(C_1)$ lên mặt phẳng $(P_2)$ chứa $(C_2)$, ta được hình chiếu $M'$. Khi đó $M'$ chạy trên một đường tròn hình chiếu $(C_1')$ có cùng bán kính với $(C_1)$.
   - Khoảng cách không gian $M N$ được tính bằng định lý Pytago đứng:
     $ M N = sqrt(M' N^2 + h^2) $

     #align(center)[
       #block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 85%)[
         #text(weight: "bold", fill: rgb("1A5276"))[Mô hình không gian 3D - Phép chiếu song song lên mặt phẳng $(P_2)$:] \
         #v(0.5em)
         #cetz.canvas(length: 2.1cm, {
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
         })
       ]
     ]

   - Do chiều cao đứng $h$ là hằng số, $M N$ đạt cực trị khi và chỉ khi khoảng cách phẳng $M' N$ giữa hai đường tròn đồng phẳng $(C_1')$ và $(C_2)$ trên mặt phẳng $(P_2)$ đạt cực trị. Ta xét 3 vị trí tương đối phẳng của hai hình chiếu này:
     - *Rời nhau:* Khoảng cách nối hai tâm chiếu $d = J_1' J_2 > R_1 + R_2$. Khi đó $M' N_(min) = d - R_1 - R_2$:
       $ M N_(min) = sqrt(h^2 + (d - R_1 - R_2)^2) $
     - *Lồng nhau:* Khoảng cách nối hai tâm chiếu $d < |R_1 - R_2|$. Khi đó $M' N_(min) = |R_1 - R_2| - d$:
       $ M N_(min) = sqrt(h^2 + (|R_1 - R_2| - d)^2) $
     - *Cắt nhau hoặc tiếp xúc:* Hai đường tròn chiếu $(C_1')$ và $(C_2)$ có giao điểm hoặc điểm tiếp xúc chung (tại đó khoảng cách phẳng cực tiểu bằng $0$). Khi đó cực tiểu không gian chính là chiều cao đứng thẳng:
       $ M N_(min) = h $

     #align(center)[
       #block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 95%)[
         #text(weight: "bold", fill: rgb("1A5276"))[Ba vị trí tương đối phẳng trên mặt chiếu $(P_2)$:] \
         #v(0.5em)
         #grid(
           columns: (1fr, 1fr, 1fr),
           gutter: 12pt,
           [
             #block(stroke: 0.3pt + gray, inset: 8pt, radius: 4pt, width: 100%)[
               #text(size: 8pt, weight: "bold")[a) Rời nhau ($d > R_1 + R_2$)] \
               #v(0.3em)
               #cetz.canvas(length: 0.4cm, {
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
             #block(stroke: 0.3pt + gray, inset: 8pt, radius: 4pt, width: 100%)[
               #text(size: 8pt, weight: "bold")[b) Lồng nhau ($d < |R_1 - R_2|$)] \
               #v(0.3em)
               #cetz.canvas(length: 0.4cm, {
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
             #block(stroke: 0.3pt + gray, inset: 8pt, radius: 4pt, width: 100%)[
               #text(size: 8pt, weight: "bold")[c) Cắt nhau ($M'N_(min) = 0$)] \
               #v(0.3em)
               #cetz.canvas(length: 0.4cm, {
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
     ]

2. *Phương pháp chiếu vuông góc và phân rã Pytago (Cho trường hợp hai đường tròn chéo nhau, nằm trên hai mặt phẳng cắt nhau hoặc vuông góc):*
   Khi hai mặt phẳng chứa hai đường tròn cắt nhau (góc giữa hai mặt phẳng bằng $alpha$):
   - Ta lấy điểm $M$ thuộc đường tròn $(C_1)$ trên mặt phẳng $(P_1)$, và chiếu vuông góc $M$ xuống mặt phẳng $(P_2)$ chứa $(C_2)$ được hình chiếu $M_p$.
   - Khi đó, tam giác $M M_p N$ vuông tại $M_p$ với mọi $N in (C_2)$ trên mặt phẳng $(P_2)$. Theo định lý Pytago không gian:
     $ M N = sqrt(M M_p^2 + M_p N^2) $
   - Trong đó, $M M_p = d(M, P_2)$ là khoảng cách từ $M$ đến mặt phẳng $(P_2)$ (chỉ phụ thuộc vào vị trí của $M$).
   - Với điểm $M$ cố định, khoảng cách $M N$ nhỏ nhất khi và chỉ khi khoảng cách phẳng $M_p N$ nhỏ nhất. Mà $N$ chạy trên đường tròn $(C_2)$ có tâm $J_2$, bán kính $R_2$ trong mặt phẳng $(P_2)$, nên khoảng cách phẳng nhỏ nhất là:
     $ M_p N_(min) = |M_p J_2 - R_2| $
   - Do đó, khoảng cách ngắn nhất từ điểm $M$ đến đường tròn $(C_2)$ được xác định bởi công thức Pytago phân rã chính xác:
     $ d(M, (C_2)) = sqrt(d(M, P_2)^2 + (M_p J_2 - R_2)^2) $

     #align(center)[
       #block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 85%)[
         #text(weight: "bold", fill: rgb("1A5276"))[Mô hình không gian 3D - Hai mặt phẳng vuông góc/cắt nhau:] \
         #v(0.5em)
         #cetz.canvas(length: 2.1cm, {
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
         })
       ]
     ]

   - *Kỹ thuật quy giản thi cử về tâm (Đánh giá chặn dưới):* Trong thực tế làm bài thi trắc nghiệm, do biểu thức Pytago chính xác có dạng vô tỷ kép rất phức tạp để giải bằng tay, ta sử dụng đánh giá xấp xỉ hình học thông qua tâm đường tròn:
     $ M N >= M J_2 - R_2 $
     Đoạn $M N$ ngắn nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2$ là nhỏ nhất. Điều này đưa bài toán về dạng cơ bản hơn là tìm cực trị khoảng cách từ một điểm trên đường tròn $(C_1)$ đến một điểm cố định $J_2$.

     #align(center)[
       #block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 85%)[
         #text(weight: "bold", fill: rgb("1A5276"))[Đánh giá chặn dưới về tâm đường tròn $J_2$:] \
         #v(0.4em)
         Với mọi điểm $N$ thuộc $(C_2)$, trong tam giác không gian $M N J_2$, ta luôn có:
         $ M N + N J_2 >= M J_2 $
         Mà $N J_2 = R_2$ (bán kính), do đó:
         $ M N + R_2 >= M J_2 \ => M N >= M J_2 - R_2 $
         Dấu "=" xảy ra khi và chỉ khi ba điểm $M, N, J_2$ thẳng hàng theo thứ tự đó (điểm $N$ nằm trên đoạn nối $M J_2$).
         
         #v(0.8em)
         #cetz.canvas(length: 0.85cm, {
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
      #block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 95%)[
        #text(weight: "bold", fill: rgb("1A5276"))[Chứng minh hình học sư phạm của Công thức vạn năng:] \
        #v(0.5em)
        Gọi $M_p$ là hình chiếu vuông góc của điểm $M$ xuống mặt phẳng $(P_2)$ chứa đường tròn $(C_2)$. 
        Do đó, đường thẳng $M M_p$ vuông góc với mặt phẳng $(P_2)$, dẫn tới $M M_p perp M_p J_2$ và $M M_p perp M_p N$. Ta có hai tam giác vuông không gian tại $M_p$:

        1. *Trong tam giác vuông $triangle M M_p J_2$ tại $M_p$:*
           $ M_p J_2^2 = M J_2^2 - M M_p^2 = M J_2^2 - d(M, P_2)^2 \ => M_p J_2 = sqrt(M J_2^2 - d(M, P_2)^2) $
           Đây chính là khoảng cách phẳng từ hình chiếu $M_p$ đến tâm đường tròn $J_2$.

        2. *Trên mặt phẳng $(P_2)$ chứa đường tròn $(C_2)$:*
           Điểm $N$ thuộc đường tròn $(C_2)$ (bán kính $R_2$) gần $M_p$ nhất nằm trên đoạn thẳng nối $M_p$ và tâm $J_2$. Khi đó khoảng cách phẳng ngắn nhất là:
           $ M_p N = |M_p J_2 - R_2| $

        3. *Trong tam giác vuông không gian $triangle M M_p N$ tại $M_p$:*
           Bình phương khoảng cách không gian từ $M$ đến đường tròn $(C_2)$ là:
           $ d(M, (C_2))^2 = M N^2 = M M_p^2 + M_p N^2 = d(M, P_2)^2 + (M_p J_2 - R_2)^2 $
           Thế công thức $M_p J_2$ từ bước 1 vào:
           $ M N^2 = d(M, P_2)^2 + (sqrt(M J_2^2 - d(M, P_2)^2) - R_2)^2 $
           $ = d(M, P_2)^2 + (M J_2^2 - d(M, P_2)^2) + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
           $ = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
           
           Nhờ sự triệt tiêu tuyệt vời của chiều cao $d(M, P_2)^2$, ta thu được *Công thức vạn năng*:
           $ d(M, (C_2)) = sqrt(M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2)) $

        #v(1em)
        #cetz.canvas(length: 0.90cm, {
          import cetz.draw: *
          let prj(x, y, z) = { (y - 0.5 * x, z + 0.35 * x) }
          
          let Mp = (0, 0, 0)
          let J2 = (0, 4.5, 0)
          let N = (0, 3.0, 0)
          let M = (0, 0, 3.5)
          
          let pA = prj(-2.5, -1.5, 0)
          let pB = prj(-2.5, 7.0, 0)
          let pC = prj(2.5, 7.0, 0)
          let pD = prj(2.5, -1.5, 0)
          
          // Draw plane P2
          line(pA, pB, pC, pD, close: true, fill: rgb("fef08a15"), stroke: 0.5pt + rgb("#ca8a04"))
          content(prj(2.5, 6.2, 0), [$(P_2)$], anchor: "south-east", padding: 2pt)
          
          // Draw circle C2 as ellipse
          let pts = range(0, 365, step: 5).map(theta => prj(1.5 * calc.cos(theta * 1deg), 4.5 + 1.5 * calc.sin(theta * 1deg), 0))
          line(..pts, stroke: 1.2pt + rgb("#dc2626"))
          
          // Center J2
          circle(prj(0, 4.5, 0), radius: 1.5pt, fill: black)
          content(prj(0, 4.5, 0), [$J_2$], anchor: "north", padding: 4pt)
          
          // Projection Mp
          circle(prj(0, 0, 0), radius: 1.5pt, fill: black)
          content(prj(0, 0, 0), [$M_p$], anchor: "south-east", padding: 3pt)
          
          // Space point M
          circle(prj(0, 0, 3.5), radius: 1.8pt, fill: rgb("#16a34a"))
          content(prj(0, 0, 3.5), [$M$], anchor: "south", padding: 3pt)
          
          // Boundary point N
          circle(prj(0, 3.0, 0), radius: 1.8pt, fill: rgb("#dc2626"))
          content(prj(0, 3.0, 0), [$N$], anchor: "north-west", padding: 2pt)
          
          // Height line (height of M)
          line(prj(0, 0, 3.5), prj(0, 0, 0), stroke: (dash: "dashed", paint: rgb("#6366f1")), name: "height")
          content("height.mid", [$d(M, P_2)$], anchor: "east", padding: 3pt)
          
          // Base line MpJ2
          line(prj(0, 0, 0), prj(0, 4.5, 0), stroke: (dash: "dashed", paint: rgb("#6366f1")), name: "base")
          
          // Line MJ2
          line(prj(0, 0, 3.5), prj(0, 4.5, 0), stroke: (dash: "dotted", paint: gray), name: "hypot")
          content("hypot.mid", [$M J_2$], anchor: "south-west", padding: 4pt)
          
          // Space distance MN
          line(prj(0, 0, 3.5), prj(0, 3.0, 0), stroke: 2pt + rgb("#ea580c"), name: "dist")
          content("dist.mid", [$d(M, (C_2))$], anchor: "south-east", padding: 4pt)
          
          // Flat distance MpN
          line(prj(0, 0, 0), prj(0, 3.0, 0), stroke: (dash: "dashed", paint: rgb("#ea580c")), name: "base_n")
          
          // Radius R2
          content(prj(0, 3.75, 0), [$R_2$], anchor: "north", padding: 4pt)
          
          // 3D Right angle symbol at Mp
          let sq = 0.22
          line(prj(0, sq, 0), prj(0, sq, sq), prj(0, 0, sq), stroke: 0.5pt + gray)
          line(prj(sq, 0, 0), prj(sq, 0, sq), prj(0, 0, sq), stroke: 0.5pt + gray)
        })
      ]
    ]


   - *Quy trình giải tổng quát bằng đạo hàm một biến:*
     - *Bước 1:* Tham số hóa tọa độ điểm $M(t)$ di động trên đường tròn $(C_1)$ theo góc lượng giác $t in [0; 2 pi)$.
     - *Bước 2:* Tính khoảng cách bình phương từ $M(t)$ đến tâm cố định $J_2$: $g(t) = M J_2^2$, và khoảng cách từ $M(t)$ đến mặt phẳng $(P_2)$ chứa đường tròn $(C_2)$: $h(t) = d(M(t), P_2)$.
     - *Bước 3:* Thiết lập hàm số khoảng cách bình phương toàn phần $F(t) = d(M(t), (C_2))^2$:
       $ F(t) = g(t) + R_2^2 - 2 R_2 sqrt(g(t) - h(t)^2) $
     - *Bước 4:* Khảo sát đạo hàm $F'(t) = 0$ để tìm cực trị, hoặc sử dụng chức năng lập bảng giá trị (Table) trên máy tính Casio để tìm giá trị nhỏ nhất của $F(t)$ trên đoạn $[0; 2 pi]$ một cách cực kỳ nhanh chóng và chính xác.

#v(1.2em)
=== Minh họa trực quan — 6 cấu hình hình học cơ bản

// ══════════════════════════════════════════════════
// CẤU HÌNH 1.1 — Đồng phẳng, đồng tâm
// ══════════════════════════════════════════════════
#v(0.6em)
#block(
  stroke: (left: 3pt + rgb("1A5276")),
  inset: (left: 10pt, top: 4pt, bottom: 4pt, right: 0pt),
  below: 0.5em,
)[#text(weight: "bold", fill: rgb("1A5276"))[Cấu hình 1.1 — Đồng phẳng, đồng tâm]]
#block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 100%)[
  *Bài toán:* Hai đường tròn đồng phẳng trên $(P)$, cùng tâm $J$, bán kính $R_1 > R_2$.

  *Ý tưởng giải:* Khi $M$ và $N$ cùng nằm trên bán kính chung từ $J$, khoảng cách $M N = R_1 - R_2$ là nhỏ nhất (cùng phía). Khi đối phía, $M N = R_1 + R_2$ là lớn nhất.

  $ M N_(min) = R_1 - R_2, quad M N_(max) = R_1 + R_2 $

  #v(0.8em)
  #align(center)[
    #block(stroke: 0.5pt + rgb("cccccc"), radius: 4pt, inset: 10pt, fill: rgb("fafafa"), width: auto)[
      #cetz.canvas(length: 0.95cm, {
        import cetz.draw: *
        line((-5.5,-3.5),(5.5,-3.5),(5.5,3.5),(-5.5,3.5), close: true,
          fill: rgb("e0f2fe55"), stroke: 0.8pt + rgb("#0284c7"))
        content((4.8,3.1), [$(P)$], anchor: "north-east", padding: 2pt)
        circle((0,0), radius: 4.5, stroke: 2pt + rgb("#16a34a"), fill: none)
        content((4.5,0.3), [$(C_1)$], anchor: "west", padding: 3pt)
        circle((0,0), radius: 2.5, stroke: 2pt + rgb("#dc2626"), fill: none)
        content((2.5,0.3), [$(C_2)$], anchor: "west", padding: 3pt)
        circle((0,0), radius: 0.1, fill: black)
        content((0,0), [$J$], anchor: "north-east", padding: 4pt)
        let M = (4.5,0)
        let N = (2.5,0)
        circle(M, radius: 0.13, fill: rgb("#16a34a"))
        content(M, [$M$], anchor: "west", padding: 4pt)
        circle(N, radius: 0.13, fill: rgb("#dc2626"))
        content(N, [$N$], anchor: "east", padding: 4pt)
        line(M, N, stroke: 2.5pt + rgb("#d97706"))
        content((3.5,0.4), [$M N_(min)$], anchor: "south", padding: 1pt)
        line((0,0),(0,4.5), stroke: (dash:"dashed",paint:rgb("#16a34a"),thickness:0.7pt))
        content((-0.2,2.25), [$R_1$], anchor: "east", padding: 2pt)
        line((0,0),(0,-2.5), stroke: (dash:"dashed",paint:rgb("#dc2626"),thickness:0.7pt))
        content((0.2,-1.25), [$R_2$], anchor: "west", padding: 2pt)
      })
    ]
  ]
]

// ══════════════════════════════════════════════════
// CẤU HÌNH 1.2 — Đồng phẳng, lệch tâm
// ══════════════════════════════════════════════════
#v(0.8em)
#block(
  stroke: (left: 3pt + rgb("1A5276")),
  inset: (left: 10pt, top: 4pt, bottom: 4pt, right: 0pt),
  below: 0.5em,
)[#text(weight: "bold", fill: rgb("1A5276"))[Cấu hình 1.2 — Đồng phẳng, lệch tâm (rời nhau)]]
#block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 100%)[
  *Bài toán:* Hai đường tròn đồng phẳng trên $(P)$, tâm lệch nhau $d = J_1 J_2$, hai vòng *rời nhau* ($d > R_1 + R_2$).

  *Ý tưởng giải:* Khoảng cách giữa hai điểm bất kỳ:
  $ M N >= J_1 J_2 - R_1 - R_2 $
  Dấu $=$ xảy ra khi $M$, $N$ cùng nằm trên đoạn $J_1 J_2$, hai điểm "quay mặt vào nhau".

  $ M N_(min) = d - R_1 - R_2 $

  _(Nếu lồng nhau: $M N_(min) = |R_1 - R_2| - d$)_

  #v(0.8em)
  #align(center)[
    #block(stroke: 0.5pt + rgb("cccccc"), radius: 4pt, inset: 10pt, fill: rgb("fafafa"), width: auto)[
      #cetz.canvas(length: 0.80cm, {
        import cetz.draw: *
        line((-5.5,-4.5),(9.5,-4.5),(9.5,5.5),(-5.5,5.5), close: true,
          fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
        content((8.8,5.0), [$(P)$], anchor: "north-east", padding: 2pt)
        circle((0,0), radius: 3.5, stroke: 2pt + rgb("#16a34a"), fill: none)
        content((3.8,0.3), [$(C_1)$], anchor: "west", padding: 3pt)
        circle((0,0), radius: 0.1, fill: black)
        content((0,0), [$J_1$], anchor: "north-east", padding: 3pt)
        circle((7,2), radius: 2.0, stroke: 2pt + rgb("#dc2626"), fill: none)
        content((9.3,2.3), [$(C_2)$], anchor: "west", padding: 3pt)
        circle((7,2), radius: 0.1, fill: black)
        content((7,2), [$J_2$], anchor: "north-east", padding: 3pt)
        line((0,0),(7,2), stroke: (dash:"dashed",paint:gray,thickness:1pt))
        content((3.5,1.5), [$d = J_1 J_2$], anchor: "south", padding: 2pt)
        let len = calc.sqrt(53)
        let dx = 7/len
        let dy = 2/len
        let Mx = 3.5*dx
        let My = 3.5*dy
        let Nx = 7 - 2.0*dx
        let Ny = 2 - 2.0*dy
        circle((Mx,My), radius: 0.13, fill: rgb("#16a34a"))
        content((Mx,My), [$M$], anchor: "north-east", padding: 4pt)
        circle((Nx,Ny), radius: 0.13, fill: rgb("#dc2626"))
        content((Nx,Ny), [$N$], anchor: "south-west", padding: 4pt)
        line((Mx,My),(Nx,Ny), stroke: 2.5pt + rgb("#d97706"))
        content(((Mx+Nx)/2, (My+Ny)/2 + 0.4), [$M N_(min)$], anchor: "south", padding: 1pt)
        line((0,0),(0,3.5), stroke: (dash:"dashed",paint:rgb("#16a34a"),thickness:0.6pt))
        content((-0.2,1.75), [$R_1$], anchor: "east", padding: 2pt)
        line((7,2),(7,4), stroke: (dash:"dashed",paint:rgb("#dc2626"),thickness:0.6pt))
        content((7.2,3), [$R_2$], anchor: "west", padding: 2pt)
      })
    ]
  ]
]

// ══════════════════════════════════════════════════
// CẤU HÌNH 2.1 — Song song, đồng trục
// ══════════════════════════════════════════════════
#v(0.8em)
#block(
  stroke: (left: 3pt + rgb("900C3F")),
  inset: (left: 10pt, top: 4pt, bottom: 4pt, right: 0pt),
  below: 0.5em,
)[#text(weight: "bold", fill: rgb("900C3F"))[Cấu hình 2.1 — Hai mặt phẳng song song, đồng trục]]
#block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 100%)[
  *Bài toán:* $(C_1)$ trên $(P_1)$, $(C_2)$ trên $(P_2)$ song song, *hai tâm thẳng hàng theo phương pháp tuyến* (đồng trục). Khoảng cách hai mặt phẳng là $h$.

  *Ý tưởng giải — Phân rã Pytago:*

  Chiếu $M$ lên $(P_2)$ được $M'$. Tam giác $M M' N$ *vuông tại $M'$*:
  $ M N^2 = underbrace(M M'^2, h^2) + underbrace(M' N^2, "phẳng") $

  $h$ cố định $Rightarrow$ tối thiểu $M N$ khi $M' N$ nhỏ nhất. Khi đồng trục: $M'$ chạy trên $(C_1')$ đồng tâm $J_2$, bán kính $R_1$.

  - *$R_1 > R_2$ (lồng nhau):* $M N_(min) = sqrt(h^2 + (R_1 - R_2)^2)$
  - *$R_1 = R_2$:* $M'$ trùng $N$ được $Rightarrow M N_(min) = h$

  #v(0.8em)
  #align(center)[
    #block(stroke: 0.5pt + rgb("cccccc"), radius: 4pt, inset: 10pt, fill: rgb("fafafa"), width: auto)[
      #cetz.canvas(length: 0.85cm, {
        import cetz.draw: *
        let prj(x, y, z) = { (y - 0.55*x, z - 0.35*x) }
        // P1 (dưới)
        line(prj(-4,-4,0),prj(4,-4,0),prj(4,4,0),prj(-4,4,0), close: true,
          fill: rgb("e0f2fe45"), stroke: 0.8pt + rgb("#0284c7"))
        content(prj(3.2,3.2,0), [$(P_1)$], anchor: "north-east", padding: 2pt)
        // C1 trên P1
        let pts1 = range(0,25).map(i => { let a = i*calc.pi*2/24; prj(3*calc.cos(a),3*calc.sin(a),0) })
        line(..pts1, stroke: 2pt + rgb("#16a34a"), close: true)
        circle(prj(0,0,0), radius: 0.12, fill: black)
        content(prj(0,0,0), [$J_1$], anchor: "north-east", padding: 3pt)
        content(prj(3.5,0,0), [$(C_1)$], anchor: "west", padding: 3pt)
        // Trục J1J2
        line(prj(0,0,0),prj(0,0,4.5), stroke: (dash:"dashed",paint:gray,thickness:1pt))
        content(prj(0.3,-0.5,2.25), [$h$], anchor: "west", padding: 2pt)
        // P2 (trên)
        line(prj(-4,-4,4.5),prj(4,-4,4.5),prj(4,4,4.5),prj(-4,4,4.5), close: true,
          fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
        content(prj(3.2,3.2,4.5), [$(P_2)$], anchor: "north-east", padding: 2pt)
        // C2 trên P2
        let pts2 = range(0,25).map(i => { let a = i*calc.pi*2/24; prj(2*calc.cos(a),2*calc.sin(a),4.5) })
        line(..pts2, stroke: 2pt + rgb("#dc2626"), close: true)
        circle(prj(0,0,4.5), radius: 0.12, fill: black)
        content(prj(0,0,4.5), [$J_2$], anchor: "south-east", padding: 3pt)
        content(prj(2.5,0,4.5), [$(C_2)$], anchor: "west", padding: 3pt)
        // M, N, M' (điểm ngắn nhất)
        let Mpt = prj(3,0,0)
        let Npt = prj(2,0,4.5)
        let Mppt = prj(3,0,4.5)
        circle(Mpt, radius: 0.14, fill: rgb("#16a34a"))
        content(Mpt, [$M$], anchor: "west", padding: 4pt)
        circle(Npt, radius: 0.14, fill: rgb("#dc2626"))
        content(Npt, [$N$], anchor: "west", padding: 4pt)
        line(Mpt, Npt, stroke: 2.5pt + rgb("#d97706"))
        circle(Mppt, radius: 0.1, fill: rgb("#6366f1"))
        content(Mppt, [$M'$], anchor: "east", padding: 4pt)
        line(Mpt, Mppt, stroke: (dash:"dashed",paint:rgb("#6366f1"),thickness:0.8pt))
        line(Mppt, Npt, stroke: (dash:"dashed",paint:rgb("#6366f1"),thickness:1pt))
        content(((Mppt.at(0)+Npt.at(0))/2-0.5,(Mppt.at(1)+Npt.at(1))/2), [$M'N$], anchor:"east", padding:2pt)
      })
    ]
  ]
]

// ══════════════════════════════════════════════════
// CẤU HÌNH 2.2 — Song song, lệch trục
// ══════════════════════════════════════════════════
#v(0.8em)
#block(
  stroke: (left: 3pt + rgb("900C3F")),
  inset: (left: 10pt, top: 4pt, bottom: 4pt, right: 0pt),
  below: 0.5em,
)[#text(weight: "bold", fill: rgb("900C3F"))[Cấu hình 2.2 — Hai mặt phẳng song song, lệch trục]]
#block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 100%)[
  *Bài toán:* $(C_1)$ và $(C_2)$ trên hai mặt phẳng song song, nhưng hình chiếu $J_1'$ của $J_1$ lên $(P_2)$ *không trùng* $J_2$. Khoảng cách tâm chiếu: $d = J_1' J_2$.

  *Ý tưởng giải:*

  Chiếu $M$ lên $(P_2)$ được $M'$. Điểm $M'$ chạy trên $(C_1')$: tâm $J_1'$, bán kính $R_1$ — đường tròn nét đứt tím.

  Quy về tìm $M' N_(min)$ giữa hai đường tròn đồng phẳng $(C_1')$ và $(C_2)$:
  - Rời nhau ($d > R_1+R_2$): $M'N_(min) = d - R_1 - R_2$
  - Lồng nhau ($d < |R_1-R_2|$): $M'N_(min) = |R_1-R_2| - d$
  - Cắt/tiếp xúc: $M'N_(min) = 0$

  *Kết quả:* $M N_(min) = sqrt(h^2 + (M'N_(min))^2)$

  #v(0.8em)
  #align(center)[
    #block(stroke: 0.5pt + rgb("cccccc"), radius: 4pt, inset: 10pt, fill: rgb("fafafa"), width: auto)[
      #cetz.canvas(length: 0.85cm, {
        import cetz.draw: *
        let prj(x, y, z) = { (y - 0.55*x, z - 0.35*x) }
        // P1
        line(prj(-5,-4,0),prj(6,-4,0),prj(6,6,0),prj(-5,6,0), close: true,
          fill: rgb("e0f2fe45"), stroke: 0.8pt + rgb("#0284c7"))
        content(prj(4.5,5,0), [$(P_1)$], anchor: "north-east", padding: 2pt)
        let pts1 = range(0,25).map(i => { let a = i*calc.pi*2/24; prj(3*calc.cos(a),3*calc.sin(a),0) })
        line(..pts1, stroke: 2pt + rgb("#16a34a"), close: true)
        circle(prj(0,0,0), radius: 0.12, fill: black)
        content(prj(0,0,0), [$J_1$], anchor: "north-east", padding: 3pt)
        content(prj(3.5,0,0), [$(C_1)$], anchor: "west", padding: 3pt)
        // P2
        line(prj(-5,-4,4.5),prj(6,-4,4.5),prj(6,6,4.5),prj(-5,6,4.5), close: true,
          fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
        content(prj(4.5,5,4.5), [$(P_2)$], anchor: "north-east", padding: 2pt)
        // C2 lệch tâm
        let pts2 = range(0,25).map(i => { let a = i*calc.pi*2/24; prj(4+1.8*calc.cos(a),3+1.8*calc.sin(a),4.5) })
        line(..pts2, stroke: 2pt + rgb("#dc2626"), close: true)
        circle(prj(4,3,4.5), radius: 0.12, fill: black)
        content(prj(4,3,4.5), [$J_2$], anchor: "north-east", padding: 3pt)
        content(prj(6,3,4.5), [$(C_2)$], anchor: "west", padding: 3pt)
        // J1' (hình chiếu J1 lên P2)
        circle(prj(0,0,4.5), radius: 0.1, fill: rgb("#6366f1"))
        content(prj(0,0,4.5), [$J_1'$], anchor: "south-east", padding: 4pt)
        // C1' nét đứt tím
        let pts1p = range(0,25).map(i => { let a = i*calc.pi*2/24; prj(3*calc.cos(a),3*calc.sin(a),4.5) })
        line(..pts1p, stroke: (dash:"dashed",paint:rgb("#6366f1"),thickness:1.2pt), close: true)
        content(prj(-4,0,4.5), [$(C_1')$], anchor: "east", padding: 4pt)
        // Trục h
        line(prj(0,0,0),prj(0,0,4.5), stroke: (dash:"dashed",paint:gray,thickness:0.8pt))
        content(prj(0.3,-0.3,2.25), [$h$], anchor: "west", padding: 2pt)
        // d = J1'J2
        line(prj(0,0,4.5),prj(4,3,4.5), stroke: (dash:"dashed",paint:gray,thickness:0.8pt))
        content(prj(2,1.5,4.5), [$d$], anchor: "south", padding: 2pt)
        // M, N
        let len43 = calc.sqrt(25)
        let Mpt = prj(3,0,0)
        let Npt = prj(4-1.8*4/5, 3-1.8*3/5, 4.5)
        circle(Mpt, radius: 0.14, fill: rgb("#16a34a"))
        content(Mpt, [$M$], anchor: "west", padding: 4pt)
        circle(Npt, radius: 0.14, fill: rgb("#dc2626"))
        content(Npt, [$N$], anchor: "east", padding: 4pt)
        line(Mpt, Npt, stroke: 2.5pt + rgb("#d97706"))
      })
    ]
  ]
]

// ══════════════════════════════════════════════════
// CẤU HÌNH 3.1 — Hai mặt phẳng vuông góc
// ══════════════════════════════════════════════════
#v(0.8em)
#block(
  stroke: (left: 3pt + rgb("117A65")),
  inset: (left: 10pt, top: 4pt, bottom: 4pt, right: 0pt),
  below: 0.5em,
)[#text(weight: "bold", fill: rgb("117A65"))[Cấu hình 3.1 — Hai mặt phẳng vuông góc nhau]]
#block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 100%)[
  *Bài toán:* $(C_1)$ trên $(P_1)$, $(C_2)$ trên $(P_2)$, với $(P_1) perp (P_2)$. Giao tuyến là đường thẳng $ell$.

  *Ý tưởng giải — chiếu $M$ lên $(P_2)$:*

  Với $M in (C_1)$, chiếu vuông góc $M$ lên $(P_2)$ được $M_p$.

  Vì $(P_1) perp (P_2)$, ta có $M M_p perp (P_2)$. Tam giác $M M_p N$ *vuông tại $M_p$*:
  $ M N^2 = M M_p^2 + M_p N^2 $

  Với M cố định: $M M_p = d(M, P_2)$ đã biết. $N$ chạy trên $(C_2)$ nên:
  $ M N_(min text("(N thay đổi)")) = sqrt(M M_p^2 + (M_p J_2 - R_2)^2) $

  *Tìm $M N_(min)$ toàn cục:* Tham số hóa $M(t)$ rồi tối ưu hóa.

  #v(0.8em)
  #align(center)[
    #block(stroke: 0.5pt + rgb("cccccc"), radius: 4pt, inset: 10pt, fill: rgb("fafafa"), width: auto)[
      #cetz.canvas(length: 0.85cm, {
        import cetz.draw: *
        let prj(x, y, z) = { (y - 0.55*x, z - 0.35*x) }
        // P1 nằm ngang (Oxy)
        line(prj(-4,-5,0),prj(4,-5,0),prj(4,8,0),prj(-4,8,0), close: true,
          fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
        content(prj(-3.5,7,0), [$(P_1)$], anchor: "north-west", padding: 2pt)
        // C1 trên P1
        let pts1 = range(0,25).map(i => { let a = i*calc.pi*2/24; prj(3*calc.cos(a),3*calc.sin(a),0) })
        line(..pts1, stroke: 2pt + rgb("#16a34a"), close: true)
        circle(prj(0,0,0), radius: 0.12, fill: black)
        content(prj(0,0,0), [$J_1$], anchor: "north-east", padding: 3pt)
        content(prj(4,0,0), [$(C_1)$], anchor: "west", padding: 3pt)
        // Giao tuyến
        line(prj(0,-5,0),prj(0,8,0), stroke: 1pt + gray)
        content(prj(0,7.8,0), [$ell$], anchor: "north", padding: 2pt)
        // P2 đứng (Oyz)
        line(prj(0,-5,0),prj(0,8,0),prj(0,8,7),prj(0,-5,7), close: true,
          fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
        content(prj(0,7,6), [$(P_2)$], anchor: "north", padding: 2pt)
        // C2 trên P2
        let pts2 = range(0,25).map(i => { let a = i*calc.pi*2/24; prj(0,4+2*calc.cos(a),4+2*calc.sin(a)) })
        line(..pts2, stroke: 2pt + rgb("#dc2626"), close: true)
        circle(prj(0,4,4), radius: 0.12, fill: black)
        content(prj(0,4,4), [$J_2$], anchor: "east", padding: 4pt)
        content(prj(0,6.5,4), [$(C_2)$], anchor: "west", padding: 3pt)
        // M trên C1
        let sq5 = calc.sqrt(5)
        let Mpt = prj(2, sq5, 0)
        circle(Mpt, radius: 0.14, fill: rgb("#16a34a"))
        content(Mpt, [$M$], anchor: "south-west", padding: 4pt)
        // Mp = hình chiếu M lên P2 (x=0)
        let Mppt = prj(0, sq5, 0)
        circle(Mppt, radius: 0.11, fill: rgb("#6366f1"))
        content(Mppt, [$M_p$], anchor: "east", padding: 4pt)
        line(Mpt, Mppt, stroke: (dash:"dashed",paint:rgb("#6366f1"),thickness:1pt))
        // N trên C2
        let Npt = prj(0,4-2,4)
        circle(Npt, radius: 0.14, fill: rgb("#dc2626"))
        content(Npt, [$N$], anchor: "east", padding: 4pt)
        // MN
        line(Mpt, Npt, stroke: 2.5pt + rgb("#d97706"))
        // MpN
        line(Mppt, Npt, stroke: (dash:"dashed",paint:rgb("#6366f1"),thickness:1pt))
        // Ký hiệu vuông
        let sq = 0.25
        line(prj(sq,sq5,0), prj(sq,sq5,sq), prj(0,sq5,sq), stroke: 0.6pt+gray)
      })
    ]
  ]
]

// ══════════════════════════════════════════════════
// CẤU HÌNH 3.2 — Hai mặt phẳng song song đứng
// ══════════════════════════════════════════════════
#v(0.8em)
#block(
  stroke: (left: 3pt + rgb("117A65")),
  inset: (left: 10pt, top: 4pt, bottom: 4pt, right: 0pt),
  below: 0.5em,
)[#text(weight: "bold", fill: rgb("117A65"))[Cấu hình 3.2 — Hai mặt phẳng song song thẳng đứng (đoạn vuông góc chung)]]
#block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 100%)[
  *Bài toán:* $(C_1)$ trên $(P_1)$, $(C_2)$ trên $(P_2)$, hai mặt phẳng song song (đứng), cách nhau $h$. Đoạn $J_1 J_2$ là đoạn vuông góc chung.

  *Ý tưởng giải:*

  Chiếu $M in (C_1)$ theo phương pháp tuyến $(P_1)$ lên $(P_2)$ được $M'$. Luôn có $M M' = h$ (hằng số).

  Tam giác $M M' N$ *vuông tại $M'$*:
  $ M N^2 = h^2 + M' N^2 $

  $M'$ chạy trên hình chiếu $(C_1')$ của $(C_1)$ lên $(P_2)$.

  Quy về bài toán phẳng trên $(P_2)$: tìm $M' N_(min)$ giữa $(C_1')$ và $(C_2)$.

  $ M N_(min) = sqrt(h^2 + (M'N)_(min)^2) $

  #v(0.8em)
  #align(center)[
    #block(stroke: 0.5pt + rgb("cccccc"), radius: 4pt, inset: 10pt, fill: rgb("fafafa"), width: auto)[
      #cetz.canvas(length: 0.85cm, {
        import cetz.draw: *
        let prj(x, y, z) = { (y - 0.55*x, z - 0.35*x) }
        // P1 (y=0)
        line(prj(-3,0,0),prj(3,0,0),prj(3,0,8),prj(-3,0,8), close: true,
          fill: rgb("e0f2fe45"), stroke: 0.8pt + rgb("#0284c7"))
        content(prj(-2.5,0,7.5), [$(P_1): y=0$], anchor: "north", padding: 2pt)
        // C1 trên P1, tâm J1=(0,0,4)
        let pts1 = range(0,25).map(i => { let a = i*calc.pi*2/24; prj(2.2*calc.cos(a),0,4+2.2*calc.sin(a)) })
        line(..pts1, stroke: 2pt + rgb("#16a34a"), close: true)
        circle(prj(0,0,4), radius: 0.12, fill: black)
        content(prj(0,0,4), [$J_1$], anchor: "east", padding: 4pt)
        content(prj(0,0,7), [$(C_1)$], anchor: "west", padding: 3pt)
        // P2 (y=5)
        line(prj(-3,5,0),prj(3,5,0),prj(3,5,8),prj(-3,5,8), close: true,
          fill: rgb("fef08a45"), stroke: 0.8pt + rgb("#ca8a04"))
        content(prj(2.5,5,7.5), [$(P_2): y=5$], anchor: "north", padding: 2pt)
        // C2 trên P2, tâm J2=(0,5,4)
        let pts2 = range(0,25).map(i => { let a = i*calc.pi*2/24; prj(1.5*calc.cos(a),5,4+1.5*calc.sin(a)) })
        line(..pts2, stroke: 2pt + rgb("#dc2626"), close: true)
        circle(prj(0,5,4), radius: 0.12, fill: black)
        content(prj(0,5,4), [$J_2$], anchor: "west", padding: 4pt)
        content(prj(0,5,6.5), [$(C_2)$], anchor: "east", padding: 3pt)
        // Đoạn vuông góc chung J1J2
        line(prj(0,0,4),prj(0,5,4), stroke: 2pt + rgb("#ea580c"))
        content(prj(0,2.5,4), [$h$], anchor: "north", padding: 3pt)
        // M, M', N
        let Mpt = prj(2.2,0,4)
        let Mppt = prj(2.2,5,4)
        let Npt = prj(-1.5,5,4)
        circle(Mpt, radius: 0.14, fill: rgb("#16a34a"))
        content(Mpt, [$M$], anchor: "south", padding: 4pt)
        circle(Mppt, radius: 0.11, fill: rgb("#6366f1"))
        content(Mppt, [$M'$], anchor: "south", padding: 4pt)
        line(Mpt, Mppt, stroke: (dash:"dashed",paint:rgb("#6366f1"),thickness:1pt))
        circle(Npt, radius: 0.14, fill: rgb("#dc2626"))
        content(Npt, [$N$], anchor: "east", padding: 4pt)
        line(Mpt, Npt, stroke: 2.5pt + rgb("#d97706"))
        line(Mppt, Npt, stroke: (dash:"dashed",paint:rgb("#6366f1"),thickness:0.8pt))
      })
    ]
  ]
]
#chapter([Hệ thống bài tập phân loại 12 Cấu hình])

#tln(
  [(Cấu hình 1.1 - Đồng phẳng, đồng tâm) Trong thiết kế của một sân vận động điền kinh phẳng ngang $(O x y): z=0$, đường chạy vòng ngoài $(C_1)$ và đường chạy vòng trong $(C_2)$ là hai đường tròn đồng phẳng, có cùng tâm tại gốc tọa độ $O(0;0;0)$. Đường chạy ngoài $(C_1)$ có phương trình $x^2 + y^2 = 100$, đường chạy trong $(C_2)$ có phương trình $x^2 + y^2 = 36$. Tìm khoảng cách ngắn nhất giữa một điểm $M$ chạy trên $(C_1)$ và một điểm $N$ chạy trên $(C_2)$?],
  [4],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(0, 0, 0)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 16.0
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(10.0, 0.0, 0.0), prj(9.961946980917455, 0.8715574274765816, 0.0), prj(9.84807753012208, 1.7364817766693033, 0.0), prj(9.659258262890683, 2.5881904510252074, 0.0), prj(9.396926207859085, 3.420201433256687, 0.0), prj(9.063077870366499, 4.2261826174069945, 0.0), prj(8.660254037844387, 4.999999999999999, 0.0), prj(8.191520442889917, 5.7357643635104605, 0.0), prj(7.66044443118978, 6.4278760968653925, 0.0), prj(7.0710678118654755, 7.071067811865475, 0.0), prj(6.427876096865393, 7.66044443118978, 0.0), prj(5.735764363510461, 8.191520442889917, 0.0), prj(5.000000000000001, 8.660254037844386, 0.0), prj(4.2261826174069945, 9.063077870366499, 0.0), prj(3.4202014332566884, 9.396926207859083, 0.0), prj(2.5881904510252074, 9.659258262890683, 0.0), prj(1.7364817766693041, 9.84807753012208, 0.0), prj(0.8715574274765813, 9.961946980917455, 0.0), prj(6.123233995736766e-16, 10.0, 0.0), prj(-0.8715574274765824, 9.961946980917455, 0.0), prj(-1.736481776669303, 9.84807753012208, 0.0), prj(-2.5881904510252083, 9.659258262890683, 0.0), prj(-3.420201433256687, 9.396926207859085, 0.0), prj(-4.226182617406994, 9.0630778703665, 0.0), prj(-4.999999999999998, 8.660254037844389, 0.0), prj(-5.735764363510461, 8.191520442889917, 0.0), prj(-6.4278760968653925, 7.66044443118978, 0.0), prj(-7.071067811865475, 7.0710678118654755, 0.0), prj(-7.660444431189779, 6.427876096865395, 0.0), prj(-8.191520442889919, 5.73576436351046, 0.0), prj(-8.660254037844387, 4.999999999999999, 0.0), prj(-9.063077870366499, 4.2261826174069945, 0.0), prj(-9.396926207859083, 3.420201433256689, 0.0), prj(-9.659258262890681, 2.58819045102521, 0.0), prj(-9.84807753012208, 1.7364817766693026, 0.0), prj(-9.961946980917455, 0.8715574274765819, 0.0), prj(-10.0, 1.2246467991473533e-15, 0.0), prj(-9.961946980917455, -0.8715574274765794, 0.0), prj(-9.84807753012208, -1.7364817766693048, 0.0), prj(-9.659258262890683, -2.588190451025208, 0.0), prj(-9.396926207859085, -3.4202014332566866, 0.0), prj(-9.0630778703665, -4.226182617406993, 0.0), prj(-8.660254037844386, -5.000000000000001, 0.0), prj(-8.191520442889917, -5.735764363510461, 0.0), prj(-7.66044443118978, -6.4278760968653925, 0.0), prj(-7.071067811865477, -7.071067811865474, 0.0), prj(-6.427876096865396, -7.660444431189779, 0.0), prj(-5.735764363510464, -8.191520442889916, 0.0), prj(-5.000000000000004, -8.660254037844384, 0.0), prj(-4.226182617406991, -9.063077870366502, 0.0), prj(-3.420201433256685, -9.396926207859085, 0.0), prj(-2.5881904510252065, -9.659258262890683, 0.0), prj(-1.7364817766693033, -9.84807753012208, 0.0), prj(-0.8715574274765825, -9.961946980917455, 0.0), prj(-1.8369701987210296e-15, -10.0, 0.0), prj(0.8715574274765789, -9.961946980917455, 0.0), prj(1.7364817766692997, -9.848077530122081, 0.0), prj(2.588190451025203, -9.659258262890685, 0.0), prj(3.4202014332566906, -9.396926207859083, 0.0), prj(4.226182617406996, -9.063077870366499, 0.0), prj(5.0, -8.660254037844386, 0.0), prj(5.7357643635104605, -8.191520442889917, 0.0), prj(6.4278760968653925, -7.660444431189781, 0.0), prj(7.071067811865474, -7.071067811865477, 0.0), prj(7.660444431189779, -6.427876096865396, 0.0), prj(8.191520442889916, -5.735764363510464, 0.0), prj(8.660254037844384, -5.000000000000004, 0.0), prj(9.0630778703665, -4.226182617406992, 0.0), prj(9.396926207859085, -3.4202014332566852, 0.0), prj(9.659258262890683, -2.588190451025207, 0.0), prj(9.84807753012208, -1.736481776669304, 0.0), prj(9.961946980917455, -0.8715574274765832, 0.0), prj(10.0, -2.4492935982947065e-15, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if false {
      let pw2 = 9.600000000000001
      let p2_1 = prj(0 - pw2*1.0 - pw2*0.0, 0 - pw2*0.0 - pw2*1.0, 0 - pw2*0.0 - pw2*0.0)
      let p2_2 = prj(0 + pw2*1.0 - pw2*0.0, 0 + pw2*0.0 - pw2*1.0, 0 + pw2*0.0 - pw2*0.0)
      let p2_3 = prj(0 + pw2*1.0 + pw2*0.0, 0 + pw2*0.0 + pw2*1.0, 0 + pw2*0.0 + pw2*0.0)
      let p2_4 = prj(0 - pw2*1.0 + pw2*0.0, 0 - pw2*0.0 + pw2*1.0, 0 - pw2*0.0 + pw2*0.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(6.0, 0.0, 0.0), prj(5.977168188550474, 0.522934456485949, 0.0), prj(5.908846518073248, 1.041889066001582, 0.0), prj(5.79555495773441, 1.5529142706151244, 0.0), prj(5.638155724715451, 2.0521208599540124, 0.0), prj(5.437846722219899, 2.5357095704441965, 0.0), prj(5.196152422706632, 2.9999999999999996, 0.0), prj(4.914912265733951, 3.4414586181062763, 0.0), prj(4.596266658713868, 3.8567256581192355, 0.0), prj(4.242640687119286, 4.242640687119285, 0.0), prj(3.8567256581192364, 4.596266658713868, 0.0), prj(3.441458618106277, 4.914912265733951, 0.0), prj(3.000000000000001, 5.196152422706632, 0.0), prj(2.5357095704441965, 5.437846722219899, 0.0), prj(2.052120859954013, 5.63815572471545, 0.0), prj(1.5529142706151244, 5.79555495773441, 0.0), prj(1.0418890660015825, 5.908846518073248, 0.0), prj(0.5229344564859487, 5.977168188550474, 0.0), prj(3.6739403974420594e-16, 6.0, 0.0), prj(-0.5229344564859494, 5.977168188550474, 0.0), prj(-1.0418890660015818, 5.908846518073248, 0.0), prj(-1.552914270615125, 5.79555495773441, 0.0), prj(-2.0521208599540124, 5.638155724715451, 0.0), prj(-2.535709570444196, 5.4378467222199, 0.0), prj(-2.9999999999999987, 5.196152422706633, 0.0), prj(-3.441458618106277, 4.914912265733951, 0.0), prj(-3.8567256581192355, 4.596266658713868, 0.0), prj(-4.242640687119285, 4.242640687119286, 0.0), prj(-4.596266658713867, 3.856725658119237, 0.0), prj(-4.9149122657339515, 3.4414586181062754, 0.0), prj(-5.196152422706632, 2.9999999999999996, 0.0), prj(-5.437846722219899, 2.535709570444197, 0.0), prj(-5.63815572471545, 2.0521208599540133, 0.0), prj(-5.795554957734409, 1.5529142706151262, 0.0), prj(-5.908846518073248, 1.0418890660015814, 0.0), prj(-5.977168188550474, 0.5229344564859492, 0.0), prj(-6.0, 7.347880794884119e-16, 0.0), prj(-5.977168188550474, -0.5229344564859477, 0.0), prj(-5.908846518073248, -1.0418890660015827, 0.0), prj(-5.79555495773441, -1.5529142706151249, 0.0), prj(-5.638155724715451, -2.052120859954012, 0.0), prj(-5.4378467222199, -2.5357095704441956, 0.0), prj(-5.196152422706632, -3.000000000000001, 0.0), prj(-4.914912265733951, -3.441458618106277, 0.0), prj(-4.596266658713868, -3.8567256581192355, 0.0), prj(-4.242640687119286, -4.242640687119284, 0.0), prj(-3.8567256581192373, -4.596266658713867, 0.0), prj(-3.441458618106278, -4.91491226573395, 0.0), prj(-3.0000000000000027, -5.19615242270663, 0.0), prj(-2.5357095704441948, -5.437846722219901, 0.0), prj(-2.052120859954011, -5.638155724715451, 0.0), prj(-1.5529142706151238, -5.79555495773441, 0.0), prj(-1.041889066001582, -5.908846518073248, 0.0), prj(-0.5229344564859495, -5.977168188550474, 0.0), prj(-1.102182119232618e-15, -6.0, 0.0), prj(0.5229344564859473, -5.977168188550474, 0.0), prj(1.0418890660015798, -5.908846518073249, 0.0), prj(1.5529142706151218, -5.79555495773441, 0.0), prj(2.052120859954014, -5.63815572471545, 0.0), prj(2.5357095704441974, -5.4378467222198985, 0.0), prj(3.0, -5.196152422706632, 0.0), prj(3.4414586181062763, -4.914912265733951, 0.0), prj(3.8567256581192355, -4.596266658713869, 0.0), prj(4.242640687119284, -4.242640687119286, 0.0), prj(4.596266658713867, -3.8567256581192373, 0.0), prj(4.91491226573395, -3.441458618106278, 0.0), prj(5.19615242270663, -3.0000000000000027, 0.0), prj(5.4378467222199, -2.5357095704441948, 0.0), prj(5.638155724715451, -2.0521208599540115, 0.0), prj(5.79555495773441, -1.552914270615124, 0.0), prj(5.908846518073248, -1.0418890660015823, 0.0), prj(5.977168188550474, -0.5229344564859499, 0.0), prj(6.0, -1.4695761589768238e-15, 0.0))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(10, 0, 0)
    let N = prj(6, 0, 0)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ tâm $J_1(0; 0; 0)$, bán kính $R_1 = 10$, mặt phẳng $z=0$.
  - $(C_2)$ tâm $J_2(0; 0; 0)$, bán kính $R_2 = 6$, mặt phẳng $z=0$.
]
#note[
  *Lưu ý sư phạm:* Với hai đường tròn đồng tâm nằm trên cùng một mặt phẳng, khoảng cách từ mọi điểm trên đường chạy này đến điểm gần nhất trên đường chạy kia là không đổi và bằng hiệu hai bán kính.
]
*Bước 1:* Do hai đường tròn hoàn toàn đồng phẳng và đồng tâm tại gốc tọa độ $O$.
Khoảng cách cực tiểu là:
$ M N_(min) = |R_1 - R_2| = |10 - 6| = 4. $
  ]
)

#tln(
  [(Cấu hình 1.2 - Đồng phẳng, lệch tâm rời nhau) Hai thiết bị tưới nước tự động xoay tròn tạo ra hai vùng làm ướt $(C_1)$ và $(C_2)$ trên mặt đất phẳng $z=0$. Vùng thứ nhất $(C_1)$ có tâm $J_1(0;0;0)$, bán kính $R_1=4$. Vùng thứ hai $(C_2)$ có tâm $J_2(9;12;0)$, bán kính $R_2=6$. Một sợi cáp thẳng nối một điểm trên viền $(C_1)$ với một điểm trên viền $(C_2)$. Tìm độ dài ngắn nhất của sợi cáp?],
  [5],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(9, 12, 0)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 6.4
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(4.0, 0.0, 0.0), prj(3.984778792366982, 0.34862297099063266, 0.0), prj(3.939231012048832, 0.6945927106677213, 0.0), prj(3.8637033051562732, 1.035276180410083, 0.0), prj(3.7587704831436337, 1.3680805733026749, 0.0), prj(3.6252311481465997, 1.6904730469627978, 0.0), prj(3.464101615137755, 1.9999999999999998, 0.0), prj(3.276608177155967, 2.294305745404184, 0.0), prj(3.064177772475912, 2.571150438746157, 0.0), prj(2.8284271247461903, 2.82842712474619, 0.0), prj(2.5711504387461575, 3.064177772475912, 0.0), prj(2.2943057454041846, 3.276608177155967, 0.0), prj(2.0000000000000004, 3.4641016151377544, 0.0), prj(1.6904730469627978, 3.6252311481465997, 0.0), prj(1.3680805733026753, 3.7587704831436333, 0.0), prj(1.035276180410083, 3.8637033051562732, 0.0), prj(0.6945927106677217, 3.939231012048832, 0.0), prj(0.3486229709906325, 3.984778792366982, 0.0), prj(2.4492935982947064e-16, 4.0, 0.0), prj(-0.34862297099063294, 3.984778792366982, 0.0), prj(-0.6945927106677212, 3.939231012048832, 0.0), prj(-1.0352761804100834, 3.8637033051562732, 0.0), prj(-1.3680805733026749, 3.7587704831436337, 0.0), prj(-1.6904730469627973, 3.6252311481466, 0.0), prj(-1.9999999999999991, 3.4641016151377553, 0.0), prj(-2.2943057454041846, 3.276608177155967, 0.0), prj(-2.571150438746157, 3.064177772475912, 0.0), prj(-2.82842712474619, 2.8284271247461903, 0.0), prj(-3.0641777724759116, 2.571150438746158, 0.0), prj(-3.2766081771559676, 2.2943057454041837, 0.0), prj(-3.464101615137755, 1.9999999999999998, 0.0), prj(-3.6252311481465997, 1.690473046962798, 0.0), prj(-3.7587704831436333, 1.3680805733026755, 0.0), prj(-3.863703305156273, 1.035276180410084, 0.0), prj(-3.939231012048832, 0.694592710667721, 0.0), prj(-3.984778792366982, 0.3486229709906328, 0.0), prj(-4.0, 4.898587196589413e-16, 0.0), prj(-3.984778792366982, -0.3486229709906318, 0.0), prj(-3.939231012048832, -0.6945927106677219, 0.0), prj(-3.8637033051562732, -1.0352761804100832, 0.0), prj(-3.7587704831436337, -1.3680805733026746, 0.0), prj(-3.6252311481466, -1.690473046962797, 0.0), prj(-3.4641016151377544, -2.0000000000000004, 0.0), prj(-3.276608177155967, -2.2943057454041846, 0.0), prj(-3.064177772475912, -2.571150438746157, 0.0), prj(-2.8284271247461907, -2.8284271247461894, 0.0), prj(-2.5711504387461583, -3.0641777724759116, 0.0), prj(-2.2943057454041855, -3.2766081771559663, 0.0), prj(-2.0000000000000018, -3.4641016151377535, 0.0), prj(-1.6904730469627964, -3.6252311481466006, 0.0), prj(-1.368080573302674, -3.7587704831436337, 0.0), prj(-1.0352761804100825, -3.8637033051562732, 0.0), prj(-0.6945927106677213, -3.939231012048832, 0.0), prj(-0.348622970990633, -3.984778792366982, 0.0), prj(-7.347880794884119e-16, -4.0, 0.0), prj(0.34862297099063155, -3.984778792366982, 0.0), prj(0.6945927106677199, -3.9392310120488325, 0.0), prj(1.0352761804100812, -3.8637033051562737, 0.0), prj(1.3680805733026762, -3.7587704831436333, 0.0), prj(1.6904730469627984, -3.6252311481465993, 0.0), prj(2.0, -3.4641016151377544, 0.0), prj(2.294305745404184, -3.276608177155967, 0.0), prj(2.571150438746157, -3.0641777724759125, 0.0), prj(2.8284271247461894, -2.8284271247461907, 0.0), prj(3.0641777724759116, -2.5711504387461583, 0.0), prj(3.2766081771559663, -2.2943057454041855, 0.0), prj(3.4641016151377535, -2.0000000000000018, 0.0), prj(3.6252311481466, -1.6904730469627967, 0.0), prj(3.7587704831436337, -1.3680805733026742, 0.0), prj(3.8637033051562732, -1.0352761804100827, 0.0), prj(3.939231012048832, -0.6945927106677215, 0.0), prj(3.984778792366982, -0.3486229709906333, 0.0), prj(4.0, -9.797174393178826e-16, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if false {
      let pw2 = 9.600000000000001
      let p2_1 = prj(9 - pw2*1.0 - pw2*0.0, 12 - pw2*0.0 - pw2*1.0, 0 - pw2*0.0 - pw2*0.0)
      let p2_2 = prj(9 + pw2*1.0 - pw2*0.0, 12 + pw2*0.0 - pw2*1.0, 0 + pw2*0.0 - pw2*0.0)
      let p2_3 = prj(9 + pw2*1.0 + pw2*0.0, 12 + pw2*0.0 + pw2*1.0, 0 + pw2*0.0 + pw2*0.0)
      let p2_4 = prj(9 - pw2*1.0 + pw2*0.0, 12 - pw2*0.0 + pw2*1.0, 0 - pw2*0.0 + pw2*0.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(15.0, 12.0, 0.0), prj(14.977168188550474, 12.522934456485949, 0.0), prj(14.908846518073247, 13.041889066001582, 0.0), prj(14.79555495773441, 13.552914270615124, 0.0), prj(14.63815572471545, 14.052120859954012, 0.0), prj(14.437846722219899, 14.535709570444197, 0.0), prj(14.196152422706632, 15.0, 0.0), prj(13.91491226573395, 15.441458618106276, 0.0), prj(13.59626665871387, 15.856725658119235, 0.0), prj(13.242640687119286, 16.242640687119284, 0.0), prj(12.856725658119236, 16.59626665871387, 0.0), prj(12.441458618106278, 16.91491226573395, 0.0), prj(12.0, 17.196152422706632, 0.0), prj(11.535709570444197, 17.4378467222199, 0.0), prj(11.052120859954012, 17.63815572471545, 0.0), prj(10.552914270615124, 17.79555495773441, 0.0), prj(10.041889066001582, 17.908846518073247, 0.0), prj(9.522934456485949, 17.977168188550472, 0.0), prj(9.0, 18.0, 0.0), prj(8.477065543514051, 17.977168188550472, 0.0), prj(7.958110933998418, 17.908846518073247, 0.0), prj(7.447085729384875, 17.79555495773441, 0.0), prj(6.947879140045988, 17.63815572471545, 0.0), prj(6.464290429555804, 17.437846722219902, 0.0), prj(6.000000000000002, 17.196152422706632, 0.0), prj(5.558541381893723, 16.91491226573395, 0.0), prj(5.1432743418807645, 16.59626665871387, 0.0), prj(4.757359312880715, 16.242640687119284, 0.0), prj(4.403733341286133, 15.856725658119236, 0.0), prj(4.0850877342660485, 15.441458618106275, 0.0), prj(3.803847577293368, 15.0, 0.0), prj(3.5621532777801006, 14.535709570444197, 0.0), prj(3.3618442752845503, 14.052120859954012, 0.0), prj(3.204445042265591, 13.552914270615126, 0.0), prj(3.091153481926752, 13.04188906600158, 0.0), prj(3.0228318114495263, 12.522934456485949, 0.0), prj(3.0, 12.0, 0.0), prj(3.0228318114495263, 11.477065543514053, 0.0), prj(3.091153481926752, 10.958110933998418, 0.0), prj(3.20444504226559, 10.447085729384876, 0.0), prj(3.3618442752845494, 9.947879140045988, 0.0), prj(3.5621532777800997, 9.464290429555804, 0.0), prj(3.803847577293368, 9.0, 0.0), prj(4.085087734266049, 8.558541381893722, 0.0), prj(4.403733341286132, 8.143274341880765, 0.0), prj(4.757359312880714, 7.757359312880716, 0.0), prj(5.143274341880763, 7.403733341286133, 0.0), prj(5.558541381893722, 7.08508773426605, 0.0), prj(5.999999999999997, 6.80384757729337, 0.0), prj(6.464290429555805, 6.562153277780099, 0.0), prj(6.947879140045989, 6.361844275284549, 0.0), prj(7.4470857293848765, 6.20444504226559, 0.0), prj(7.958110933998418, 6.091153481926752, 0.0), prj(8.477065543514051, 6.022831811449526, 0.0), prj(8.999999999999998, 6.0, 0.0), prj(9.522934456485947, 6.022831811449526, 0.0), prj(10.04188906600158, 6.091153481926751, 0.0), prj(10.552914270615123, 6.20444504226559, 0.0), prj(11.052120859954014, 6.36184427528455, 0.0), prj(11.535709570444197, 6.5621532777801015, 0.0), prj(12.0, 6.803847577293368, 0.0), prj(12.441458618106276, 7.085087734266049, 0.0), prj(12.856725658119235, 7.403733341286131, 0.0), prj(13.242640687119284, 7.757359312880714, 0.0), prj(13.596266658713867, 8.143274341880762, 0.0), prj(13.91491226573395, 8.558541381893722, 0.0), prj(14.19615242270663, 8.999999999999996, 0.0), prj(14.4378467222199, 9.464290429555806, 0.0), prj(14.63815572471545, 9.947879140045988, 0.0), prj(14.79555495773441, 10.447085729384876, 0.0), prj(14.908846518073247, 10.958110933998418, 0.0), prj(14.977168188550474, 11.47706554351405, 0.0), prj(15.0, 11.999999999999998, 0.0))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(2.4, 3.2, 0)
    let N = prj(5.4, 7.199999999999999, 0)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ có tâm $J_1(0; 0; 0)$, bán kính $R_1 = 4$, nằm trên $z=0$.
  - $(C_2)$ có tâm $J_2(9; 12; 0)$, bán kính $R_2 = 6$, nằm trên $z=0$.
]
#note[
  *Lưu ý sư phạm:* Khi hai đường tròn đồng phẳng và không lồng nhau, khoảng cách ngắn nhất nằm trên đường nối hai tâm và bằng khoảng cách nối tâm trừ đi tổng hai bán kính.
]
*Bước 1:* Tính khoảng cách giữa hai tâm:
$ J_1 J_2 = sqrt(9^2 + 12^2) = 15. $
*Bước 2:* So sánh khoảng cách tâm với tổng bán kính:
$ J_1 J_2 = 15 > R_1 + R_2 = 10. $
Do đó, hai vùng tròn làm ướt nằm rời ngoài nhau.
*Bước 3:* Độ dài ngắn nhất của sợi cáp đạt được khi $M, N$ nằm trên đoạn thẳng nối tâm $J_1 J_2$:
$ M N_(min) = J_1 J_2 - R_1 - R_2 = 15 - 4 - 6 = 5. $
  ]
)

#tln(
  [(Cấu hình 1.3 - Đồng phẳng, lệch tâm cắt nhau) Hai vòng trang trí tròn được đặt trên một bức tường phẳng $z=0$. Vòng tròn thứ nhất $(C_1)$ có tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vòng tròn thứ hai $(C_2)$ có tâm $J_2(6;8;0)$, bán kính $R_2=7$. Tìm khoảng cách lớn nhất giữa một điểm $M$ trên $(C_1)$ và một điểm $N$ trên $(C_2)$?],
  [22],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(6, 8, 0)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 8.0
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(5.0, 0.0, 0.0), prj(4.9809734904587275, 0.4357787137382908, 0.0), prj(4.92403876506104, 0.8682408883346516, 0.0), prj(4.8296291314453415, 1.2940952255126037, 0.0), prj(4.698463103929543, 1.7101007166283435, 0.0), prj(4.531538935183249, 2.1130913087034973, 0.0), prj(4.330127018922194, 2.4999999999999996, 0.0), prj(4.095760221444959, 2.8678821817552302, 0.0), prj(3.83022221559489, 3.2139380484326963, 0.0), prj(3.5355339059327378, 3.5355339059327373, 0.0), prj(3.2139380484326967, 3.83022221559489, 0.0), prj(2.8678821817552307, 4.095760221444959, 0.0), prj(2.5000000000000004, 4.330127018922193, 0.0), prj(2.1130913087034973, 4.531538935183249, 0.0), prj(1.7101007166283442, 4.698463103929542, 0.0), prj(1.2940952255126037, 4.8296291314453415, 0.0), prj(0.8682408883346521, 4.92403876506104, 0.0), prj(0.43577871373829064, 4.9809734904587275, 0.0), prj(3.061616997868383e-16, 5.0, 0.0), prj(-0.4357787137382912, 4.9809734904587275, 0.0), prj(-0.8682408883346515, 4.92403876506104, 0.0), prj(-1.2940952255126041, 4.8296291314453415, 0.0), prj(-1.7101007166283435, 4.698463103929543, 0.0), prj(-2.113091308703497, 4.53153893518325, 0.0), prj(-2.499999999999999, 4.3301270189221945, 0.0), prj(-2.8678821817552307, 4.095760221444959, 0.0), prj(-3.2139380484326963, 3.83022221559489, 0.0), prj(-3.5355339059327373, 3.5355339059327378, 0.0), prj(-3.8302222155948895, 3.2139380484326976, 0.0), prj(-4.0957602214449595, 2.86788218175523, 0.0), prj(-4.330127018922194, 2.4999999999999996, 0.0), prj(-4.531538935183249, 2.1130913087034973, 0.0), prj(-4.698463103929542, 1.7101007166283444, 0.0), prj(-4.829629131445341, 1.294095225512605, 0.0), prj(-4.92403876506104, 0.8682408883346513, 0.0), prj(-4.9809734904587275, 0.43577871373829097, 0.0), prj(-5.0, 6.123233995736766e-16, 0.0), prj(-4.9809734904587275, -0.4357787137382897, 0.0), prj(-4.92403876506104, -0.8682408883346524, 0.0), prj(-4.8296291314453415, -1.294095225512604, 0.0), prj(-4.698463103929543, -1.7101007166283433, 0.0), prj(-4.53153893518325, -2.1130913087034964, 0.0), prj(-4.330127018922193, -2.5000000000000004, 0.0), prj(-4.095760221444959, -2.8678821817552307, 0.0), prj(-3.83022221559489, -3.2139380484326963, 0.0), prj(-3.5355339059327386, -3.535533905932737, 0.0), prj(-3.213938048432698, -3.8302222155948895, 0.0), prj(-2.867882181755232, -4.095760221444958, 0.0), prj(-2.500000000000002, -4.330127018922192, 0.0), prj(-2.1130913087034955, -4.531538935183251, 0.0), prj(-1.7101007166283424, -4.698463103929543, 0.0), prj(-1.2940952255126033, -4.8296291314453415, 0.0), prj(-0.8682408883346516, -4.92403876506104, 0.0), prj(-0.43577871373829125, -4.9809734904587275, 0.0), prj(-9.184850993605148e-16, -5.0, 0.0), prj(0.43577871373828947, -4.9809734904587275, 0.0), prj(0.8682408883346499, -4.924038765061041, 0.0), prj(1.2940952255126015, -4.829629131445342, 0.0), prj(1.7101007166283453, -4.698463103929542, 0.0), prj(2.113091308703498, -4.531538935183249, 0.0), prj(2.5, -4.330127018922193, 0.0), prj(2.8678821817552302, -4.095760221444959, 0.0), prj(3.2139380484326963, -3.8302222155948904, 0.0), prj(3.535533905932737, -3.5355339059327386, 0.0), prj(3.8302222155948895, -3.213938048432698, 0.0), prj(4.095760221444958, -2.867882181755232, 0.0), prj(4.330127018922192, -2.500000000000002, 0.0), prj(4.53153893518325, -2.113091308703496, 0.0), prj(4.698463103929543, -1.7101007166283426, 0.0), prj(4.8296291314453415, -1.2940952255126035, 0.0), prj(4.92403876506104, -0.868240888334652, 0.0), prj(4.9809734904587275, -0.4357787137382916, 0.0), prj(5.0, -1.2246467991473533e-15, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if false {
      let pw2 = 11.200000000000001
      let p2_1 = prj(6 - pw2*1.0 - pw2*0.0, 8 - pw2*0.0 - pw2*1.0, 0 - pw2*0.0 - pw2*0.0)
      let p2_2 = prj(6 + pw2*1.0 - pw2*0.0, 8 + pw2*0.0 - pw2*1.0, 0 + pw2*0.0 - pw2*0.0)
      let p2_3 = prj(6 + pw2*1.0 + pw2*0.0, 8 + pw2*0.0 + pw2*1.0, 0 + pw2*0.0 + pw2*0.0)
      let p2_4 = prj(6 - pw2*1.0 + pw2*0.0, 8 - pw2*0.0 + pw2*1.0, 0 - pw2*0.0 + pw2*0.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(13.0, 8.0, 0.0), prj(12.973362886642219, 8.610090199233607, 0.0), prj(12.893654271085456, 9.215537243668512, 0.0), prj(12.761480784023478, 9.811733315717646, 0.0), prj(12.577848345501359, 10.394141003279682, 0.0), prj(12.34415450925655, 10.958327832184896, 0.0), prj(12.062177826491071, 11.5, 0.0), prj(11.734064310022942, 12.015035054457321, 0.0), prj(11.362311101832846, 12.499513267805774, 0.0), prj(10.949747468305834, 12.949747468305832, 0.0), prj(10.499513267805774, 13.362311101832846, 0.0), prj(10.015035054457323, 13.734064310022942, 0.0), prj(9.5, 14.06217782649107, 0.0), prj(8.958327832184896, 14.34415450925655, 0.0), prj(8.394141003279682, 14.577848345501359, 0.0), prj(7.811733315717645, 14.761480784023478, 0.0), prj(7.215537243668512, 14.893654271085456, 0.0), prj(6.610090199233607, 14.973362886642219, 0.0), prj(6.0, 15.0, 0.0), prj(5.389909800766392, 14.973362886642219, 0.0), prj(4.784462756331488, 14.893654271085456, 0.0), prj(4.188266684282354, 14.761480784023478, 0.0), prj(3.605858996720319, 14.577848345501359, 0.0), prj(3.0416721678151046, 14.344154509256551, 0.0), prj(2.5000000000000018, 14.062177826491071, 0.0), prj(1.9849649455426768, 13.734064310022942, 0.0), prj(1.5004867321942257, 13.362311101832846, 0.0), prj(1.0502525316941682, 12.949747468305834, 0.0), prj(0.6376888981671547, 12.499513267805776, 0.0), prj(0.26593568997705663, 12.015035054457321, 0.0), prj(-0.062177826491071286, 11.5, 0.0), prj(-0.34415450925654945, 10.958327832184896, 0.0), prj(-0.5778483455013586, 10.394141003279682, 0.0), prj(-0.7614807840234779, 9.811733315717648, 0.0), prj(-0.893654271085456, 9.215537243668512, 0.0), prj(-0.973362886642219, 8.610090199233607, 0.0), prj(-1.0, 8.0, 0.0), prj(-0.973362886642219, 7.389909800766395, 0.0), prj(-0.893654271085456, 6.784462756331487, 0.0), prj(-0.7614807840234779, 6.188266684282354, 0.0), prj(-0.5778483455013586, 5.605858996720319, 0.0), prj(-0.34415450925655033, 5.041672167815105, 0.0), prj(-0.0621778264910704, 4.499999999999999, 0.0), prj(0.2659356899770575, 3.9849649455426768, 0.0), prj(0.6376888981671538, 3.5004867321942257, 0.0), prj(1.0502525316941664, 3.050252531694168, 0.0), prj(1.500486732194223, 2.6376888981671547, 0.0), prj(1.984964945542675, 2.2659356899770593, 0.0), prj(2.499999999999997, 1.9378221735089314, 0.0), prj(3.0416721678151064, 1.6558454907434488, 0.0), prj(3.6058589967203205, 1.4221516544986414, 0.0), prj(4.188266684282356, 1.2385192159765221, 0.0), prj(4.784462756331488, 1.106345728914544, 0.0), prj(5.389909800766392, 1.026637113357781, 0.0), prj(5.999999999999999, 1.0, 0.0), prj(6.610090199233605, 1.026637113357781, 0.0), prj(7.21553724366851, 1.106345728914543, 0.0), prj(7.8117333157176425, 1.2385192159765213, 0.0), prj(8.394141003279683, 1.4221516544986414, 0.0), prj(8.958327832184898, 1.6558454907434514, 0.0), prj(9.5, 1.9378221735089296, 0.0), prj(10.015035054457321, 2.2659356899770575, 0.0), prj(10.499513267805774, 2.637688898167153, 0.0), prj(10.949747468305832, 3.0502525316941664, 0.0), prj(11.362311101832844, 3.500486732194223, 0.0), prj(11.73406431002294, 3.984964945542675, 0.0), prj(12.06217782649107, 4.4999999999999964, 0.0), prj(12.344154509256551, 5.041672167815106, 0.0), prj(12.577848345501359, 5.60585899672032, 0.0), prj(12.761480784023478, 6.188266684282356, 0.0), prj(12.893654271085456, 6.784462756331488, 0.0), prj(12.973362886642219, 7.389909800766392, 0.0), prj(13.0, 7.999999999999998, 0.0))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(-3.0, -4.0, 0)
    let N = prj(10.2, 13.600000000000001, 0)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ tâm $J_1(0;0;0)$, $R_1=5$.
  - $(C_2)$ tâm $J_2(6;8;0)$, $R_2=7$.
]
#note[
  *Lưu ý sư phạm:* Hai đường tròn cắt nhau nên khoảng cách nhỏ nhất $M N_(min) = 0$ tại các giao điểm. Khoảng cách lớn nhất đạt được khi $M, N$ nằm ở hai đầu xa nhất trên đường nối tâm: $M N_(max) = J_1 J_2 + R_1 + R_2$.
]
*Bước 1:* Tính khoảng cách nối hai tâm:
$ J_1 J_2 = sqrt(6^2 + 8^2) = 10. $
*Bước 2:* So sánh điều kiện: $|R_1 - R_2| = 2 < J_1 J_2 = 10 < R_1 + R_2 = 12$. Hai đường tròn cắt nhau tại hai điểm (cực tiểu bằng 0).
*Bước 3:* Khoảng cách cực đại đạt được khi hai điểm nằm thẳng hàng với hai tâm và ở phía đối diện xa nhất:
$ M N_(max) = J_1 J_2 + R_1 + R_2 = 10 + 5 + 7 = 22. $
  ]
)

#tln(
  [(Cấu hình 2.1 - Song song, đồng trục) Một bộ truyền động cơ khí gồm hai đĩa quay tròn $(C_1)$ và $(C_2)$ song song với nhau. Đĩa $(C_1)$ nằm trên mặt đáy $z=0$, có tâm $J_1(0;0;0)$, bán kính $R_1 = 8$. Đĩa $(C_2)$ nằm trên mặt phẳng $z=12$, có tâm $J_2(0;0;12)$, bán kính $R_2 = 3$. Tìm khoảng cách ngắn nhất giữa hai điểm trên viền của hai đĩa quay?],
  [13],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(0, 0, 12)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 12.8
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(8.0, 0.0, 0.0), prj(7.969557584733964, 0.6972459419812653, 0.0), prj(7.878462024097664, 1.3891854213354426, 0.0), prj(7.7274066103125465, 2.070552360820166, 0.0), prj(7.517540966287267, 2.7361611466053497, 0.0), prj(7.2504622962931995, 3.3809460939255955, 0.0), prj(6.92820323027551, 3.9999999999999996, 0.0), prj(6.553216354311934, 4.588611490808368, 0.0), prj(6.128355544951824, 5.142300877492314, 0.0), prj(5.656854249492381, 5.65685424949238, 0.0), prj(5.142300877492315, 6.128355544951824, 0.0), prj(4.588611490808369, 6.553216354311934, 0.0), prj(4.000000000000001, 6.928203230275509, 0.0), prj(3.3809460939255955, 7.2504622962931995, 0.0), prj(2.7361611466053506, 7.5175409662872665, 0.0), prj(2.070552360820166, 7.7274066103125465, 0.0), prj(1.3891854213354433, 7.878462024097664, 0.0), prj(0.697245941981265, 7.969557584733964, 0.0), prj(4.898587196589413e-16, 8.0, 0.0), prj(-0.6972459419812659, 7.969557584733964, 0.0), prj(-1.3891854213354424, 7.878462024097664, 0.0), prj(-2.070552360820167, 7.7274066103125465, 0.0), prj(-2.7361611466053497, 7.517540966287267, 0.0), prj(-3.3809460939255946, 7.2504622962932, 0.0), prj(-3.9999999999999982, 6.9282032302755105, 0.0), prj(-4.588611490808369, 6.553216354311934, 0.0), prj(-5.142300877492314, 6.128355544951824, 0.0), prj(-5.65685424949238, 5.656854249492381, 0.0), prj(-6.128355544951823, 5.142300877492316, 0.0), prj(-6.553216354311935, 4.5886114908083675, 0.0), prj(-6.92820323027551, 3.9999999999999996, 0.0), prj(-7.2504622962931995, 3.380946093925596, 0.0), prj(-7.5175409662872665, 2.736161146605351, 0.0), prj(-7.727406610312546, 2.070552360820168, 0.0), prj(-7.878462024097664, 1.389185421335442, 0.0), prj(-7.969557584733964, 0.6972459419812655, 0.0), prj(-8.0, 9.797174393178826e-16, 0.0), prj(-7.969557584733964, -0.6972459419812636, 0.0), prj(-7.878462024097664, -1.3891854213354438, 0.0), prj(-7.7274066103125465, -2.0705523608201664, 0.0), prj(-7.517540966287267, -2.7361611466053493, 0.0), prj(-7.2504622962932, -3.380946093925594, 0.0), prj(-6.928203230275509, -4.000000000000001, 0.0), prj(-6.553216354311934, -4.588611490808369, 0.0), prj(-6.128355544951824, -5.142300877492314, 0.0), prj(-5.6568542494923815, -5.656854249492379, 0.0), prj(-5.142300877492317, -6.128355544951823, 0.0), prj(-4.588611490808371, -6.553216354311933, 0.0), prj(-4.0000000000000036, -6.928203230275507, 0.0), prj(-3.380946093925593, -7.250462296293201, 0.0), prj(-2.736161146605348, -7.517540966287267, 0.0), prj(-2.070552360820165, -7.7274066103125465, 0.0), prj(-1.3891854213354426, -7.878462024097664, 0.0), prj(-0.697245941981266, -7.969557584733964, 0.0), prj(-1.4695761589768238e-15, -8.0, 0.0), prj(0.6972459419812631, -7.969557584733964, 0.0), prj(1.3891854213354398, -7.878462024097665, 0.0), prj(2.0705523608201624, -7.727406610312547, 0.0), prj(2.7361611466053524, -7.5175409662872665, 0.0), prj(3.380946093925597, -7.250462296293199, 0.0), prj(4.0, -6.928203230275509, 0.0), prj(4.588611490808368, -6.553216354311934, 0.0), prj(5.142300877492314, -6.128355544951825, 0.0), prj(5.656854249492379, -5.6568542494923815, 0.0), prj(6.128355544951823, -5.142300877492317, 0.0), prj(6.553216354311933, -4.588611490808371, 0.0), prj(6.928203230275507, -4.0000000000000036, 0.0), prj(7.2504622962932, -3.3809460939255933, 0.0), prj(7.517540966287267, -2.7361611466053484, 0.0), prj(7.7274066103125465, -2.0705523608201655, 0.0), prj(7.878462024097664, -1.389185421335443, 0.0), prj(7.969557584733964, -0.6972459419812665, 0.0), prj(8.0, -1.959434878635765e-15, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(0 - pw2*1.0 - pw2*0.0, 0 - pw2*0.0 - pw2*1.0, 12 - pw2*0.0 - pw2*0.0)
      let p2_2 = prj(0 + pw2*1.0 - pw2*0.0, 0 + pw2*0.0 - pw2*1.0, 12 + pw2*0.0 - pw2*0.0)
      let p2_3 = prj(0 + pw2*1.0 + pw2*0.0, 0 + pw2*0.0 + pw2*1.0, 12 + pw2*0.0 + pw2*0.0)
      let p2_4 = prj(0 - pw2*1.0 + pw2*0.0, 0 - pw2*0.0 + pw2*1.0, 12 - pw2*0.0 + pw2*0.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(3.0, 0.0, 12.0), prj(2.988584094275237, 0.2614672282429745, 12.0), prj(2.954423259036624, 0.520944533000791, 12.0), prj(2.897777478867205, 0.7764571353075622, 12.0), prj(2.8190778623577253, 1.0260604299770062, 12.0), prj(2.7189233611099497, 1.2678547852220983, 12.0), prj(2.598076211353316, 1.4999999999999998, 12.0), prj(2.4574561328669753, 1.7207293090531381, 12.0), prj(2.298133329356934, 1.9283628290596178, 12.0), prj(2.121320343559643, 2.1213203435596424, 12.0), prj(1.9283628290596182, 2.298133329356934, 12.0), prj(1.7207293090531386, 2.4574561328669753, 12.0), prj(1.5000000000000004, 2.598076211353316, 12.0), prj(1.2678547852220983, 2.7189233611099497, 12.0), prj(1.0260604299770064, 2.819077862357725, 12.0), prj(0.7764571353075622, 2.897777478867205, 12.0), prj(0.5209445330007912, 2.954423259036624, 12.0), prj(0.26146722824297436, 2.988584094275237, 12.0), prj(1.8369701987210297e-16, 3.0, 12.0), prj(-0.2614672282429747, 2.988584094275237, 12.0), prj(-0.5209445330007909, 2.954423259036624, 12.0), prj(-0.7764571353075626, 2.897777478867205, 12.0), prj(-1.0260604299770062, 2.8190778623577253, 12.0), prj(-1.267854785222098, 2.71892336110995, 12.0), prj(-1.4999999999999993, 2.5980762113533165, 12.0), prj(-1.7207293090531386, 2.4574561328669753, 12.0), prj(-1.9283628290596178, 2.298133329356934, 12.0), prj(-2.1213203435596424, 2.121320343559643, 12.0), prj(-2.2981333293569337, 1.9283628290596184, 12.0), prj(-2.4574561328669757, 1.7207293090531377, 12.0), prj(-2.598076211353316, 1.4999999999999998, 12.0), prj(-2.7189233611099497, 1.2678547852220985, 12.0), prj(-2.819077862357725, 1.0260604299770066, 12.0), prj(-2.8977774788672046, 0.7764571353075631, 12.0), prj(-2.954423259036624, 0.5209445330007907, 12.0), prj(-2.988584094275237, 0.2614672282429746, 12.0), prj(-3.0, 3.6739403974420594e-16, 12.0), prj(-2.988584094275237, -0.26146722824297386, 12.0), prj(-2.954423259036624, -0.5209445330007914, 12.0), prj(-2.897777478867205, -0.7764571353075624, 12.0), prj(-2.8190778623577253, -1.026060429977006, 12.0), prj(-2.71892336110995, -1.2678547852220978, 12.0), prj(-2.598076211353316, -1.5000000000000004, 12.0), prj(-2.4574561328669753, -1.7207293090531386, 12.0), prj(-2.298133329356934, -1.9283628290596178, 12.0), prj(-2.121320343559643, -2.121320343559642, 12.0), prj(-1.9283628290596186, -2.2981333293569337, 12.0), prj(-1.720729309053139, -2.457456132866975, 12.0), prj(-1.5000000000000013, -2.598076211353315, 12.0), prj(-1.2678547852220974, -2.7189233611099506, 12.0), prj(-1.0260604299770055, -2.8190778623577253, 12.0), prj(-0.7764571353075619, -2.897777478867205, 12.0), prj(-0.520944533000791, -2.954423259036624, 12.0), prj(-0.26146722824297475, -2.988584094275237, 12.0), prj(-5.51091059616309e-16, -3.0, 12.0), prj(0.26146722824297364, -2.988584094275237, 12.0), prj(0.5209445330007899, -2.9544232590366244, 12.0), prj(0.7764571353075609, -2.897777478867205, 12.0), prj(1.026060429977007, -2.819077862357725, 12.0), prj(1.2678547852220987, -2.7189233611099493, 12.0), prj(1.5, -2.598076211353316, 12.0), prj(1.7207293090531381, -2.4574561328669753, 12.0), prj(1.9283628290596178, -2.2981333293569346, 12.0), prj(2.121320343559642, -2.121320343559643, 12.0), prj(2.2981333293569337, -1.9283628290596186, 12.0), prj(2.457456132866975, -1.720729309053139, 12.0), prj(2.598076211353315, -1.5000000000000013, 12.0), prj(2.71892336110995, -1.2678547852220974, 12.0), prj(2.8190778623577253, -1.0260604299770058, 12.0), prj(2.897777478867205, -0.776457135307562, 12.0), prj(2.954423259036624, -0.5209445330007911, 12.0), prj(2.988584094275237, -0.26146722824297497, 12.0), prj(3.0, -7.347880794884119e-16, 12.0))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(8, 0, 0)
    let N = prj(3, 0, 12)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(3.0, 0.0, 0.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ tâm $J_1(0; 0; 0)$, bán kính $R_1 = 8$, mặt phẳng $z=0$.
  - $(C_2)$ tâm $J_2(0; 0; 12)$, bán kính $R_2 = 3$, mặt phẳng $z=12$.
  - Khoảng cách thẳng đứng giữa hai mặt phẳng là $h = 12$.
]
#note[
  *Lưu ý sư phạm:* Bài toán song song được đưa về hình học phẳng bằng cách chiếu trực giao. Do hai đường tròn đồng trục, hình chiếu của tâm này trùng với tâm kia, khoảng cách ngang nhỏ nhất là $|R_1 - R_2|$.
]
*Bước 1:* Chiếu $(C_2)$ xuống mặt phẳng $z=0$ được đường tròn hình chiếu $(C_2')$ có tâm $J_1(0;0;0)$, bán kính $R_2 = 3$.
Khoảng cách ngang cực tiểu giữa $(C_1)$ và $(C_2')$ là:
$ d_("ngang") = |R_1 - R_2| = |8 - 3| = 5. $
*Bước 2:* Khoảng cách không gian cực tiểu được tính bằng Pytago với khoảng cách đứng $h = 12$:
$ M N_(min) = sqrt(h^2 + d_("ngang")^2) = sqrt(12^2 + 5^2) = 13. $
  ]
)

#tln(
  [(Cấu hình 2.2 - Song song, lệch trục chiếu ngoài) Hai Flycam bay tuần tra theo hai quỹ đạo tròn trên hai mặt phẳng nằm ngang song song. Flycam 1 bay trên mặt phẳng $z=0$ có tâm quỹ đạo $J_1(0;0;0)$, bán kính $R_1=6$. Flycam 2 bay trên mặt phẳng $z=9$ có tâm quỹ đạo $J_2(12;9;9)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa hai Flycam trong quá trình bay?],
  [$sqrt(106)$],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(12, 9, 9)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 9.600000000000001
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(6.0, 0.0, 0.0), prj(5.977168188550474, 0.522934456485949, 0.0), prj(5.908846518073248, 1.041889066001582, 0.0), prj(5.79555495773441, 1.5529142706151244, 0.0), prj(5.638155724715451, 2.0521208599540124, 0.0), prj(5.437846722219899, 2.5357095704441965, 0.0), prj(5.196152422706632, 2.9999999999999996, 0.0), prj(4.914912265733951, 3.4414586181062763, 0.0), prj(4.596266658713868, 3.8567256581192355, 0.0), prj(4.242640687119286, 4.242640687119285, 0.0), prj(3.8567256581192364, 4.596266658713868, 0.0), prj(3.441458618106277, 4.914912265733951, 0.0), prj(3.000000000000001, 5.196152422706632, 0.0), prj(2.5357095704441965, 5.437846722219899, 0.0), prj(2.052120859954013, 5.63815572471545, 0.0), prj(1.5529142706151244, 5.79555495773441, 0.0), prj(1.0418890660015825, 5.908846518073248, 0.0), prj(0.5229344564859487, 5.977168188550474, 0.0), prj(3.6739403974420594e-16, 6.0, 0.0), prj(-0.5229344564859494, 5.977168188550474, 0.0), prj(-1.0418890660015818, 5.908846518073248, 0.0), prj(-1.552914270615125, 5.79555495773441, 0.0), prj(-2.0521208599540124, 5.638155724715451, 0.0), prj(-2.535709570444196, 5.4378467222199, 0.0), prj(-2.9999999999999987, 5.196152422706633, 0.0), prj(-3.441458618106277, 4.914912265733951, 0.0), prj(-3.8567256581192355, 4.596266658713868, 0.0), prj(-4.242640687119285, 4.242640687119286, 0.0), prj(-4.596266658713867, 3.856725658119237, 0.0), prj(-4.9149122657339515, 3.4414586181062754, 0.0), prj(-5.196152422706632, 2.9999999999999996, 0.0), prj(-5.437846722219899, 2.535709570444197, 0.0), prj(-5.63815572471545, 2.0521208599540133, 0.0), prj(-5.795554957734409, 1.5529142706151262, 0.0), prj(-5.908846518073248, 1.0418890660015814, 0.0), prj(-5.977168188550474, 0.5229344564859492, 0.0), prj(-6.0, 7.347880794884119e-16, 0.0), prj(-5.977168188550474, -0.5229344564859477, 0.0), prj(-5.908846518073248, -1.0418890660015827, 0.0), prj(-5.79555495773441, -1.5529142706151249, 0.0), prj(-5.638155724715451, -2.052120859954012, 0.0), prj(-5.4378467222199, -2.5357095704441956, 0.0), prj(-5.196152422706632, -3.000000000000001, 0.0), prj(-4.914912265733951, -3.441458618106277, 0.0), prj(-4.596266658713868, -3.8567256581192355, 0.0), prj(-4.242640687119286, -4.242640687119284, 0.0), prj(-3.8567256581192373, -4.596266658713867, 0.0), prj(-3.441458618106278, -4.91491226573395, 0.0), prj(-3.0000000000000027, -5.19615242270663, 0.0), prj(-2.5357095704441948, -5.437846722219901, 0.0), prj(-2.052120859954011, -5.638155724715451, 0.0), prj(-1.5529142706151238, -5.79555495773441, 0.0), prj(-1.041889066001582, -5.908846518073248, 0.0), prj(-0.5229344564859495, -5.977168188550474, 0.0), prj(-1.102182119232618e-15, -6.0, 0.0), prj(0.5229344564859473, -5.977168188550474, 0.0), prj(1.0418890660015798, -5.908846518073249, 0.0), prj(1.5529142706151218, -5.79555495773441, 0.0), prj(2.052120859954014, -5.63815572471545, 0.0), prj(2.5357095704441974, -5.4378467222198985, 0.0), prj(3.0, -5.196152422706632, 0.0), prj(3.4414586181062763, -4.914912265733951, 0.0), prj(3.8567256581192355, -4.596266658713869, 0.0), prj(4.242640687119284, -4.242640687119286, 0.0), prj(4.596266658713867, -3.8567256581192373, 0.0), prj(4.91491226573395, -3.441458618106278, 0.0), prj(5.19615242270663, -3.0000000000000027, 0.0), prj(5.4378467222199, -2.5357095704441948, 0.0), prj(5.638155724715451, -2.0521208599540115, 0.0), prj(5.79555495773441, -1.552914270615124, 0.0), prj(5.908846518073248, -1.0418890660015823, 0.0), prj(5.977168188550474, -0.5229344564859499, 0.0), prj(6.0, -1.4695761589768238e-15, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.4
      let p2_1 = prj(12 - pw2*1.0 - pw2*0.0, 9 - pw2*0.0 - pw2*1.0, 9 - pw2*0.0 - pw2*0.0)
      let p2_2 = prj(12 + pw2*1.0 - pw2*0.0, 9 + pw2*0.0 - pw2*1.0, 9 + pw2*0.0 - pw2*0.0)
      let p2_3 = prj(12 + pw2*1.0 + pw2*0.0, 9 + pw2*0.0 + pw2*1.0, 9 + pw2*0.0 + pw2*0.0)
      let p2_4 = prj(12 - pw2*1.0 + pw2*0.0, 9 - pw2*0.0 + pw2*1.0, 9 - pw2*0.0 + pw2*0.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(16.0, 9.0, 9.0), prj(15.984778792366981, 9.348622970990633, 9.0), prj(15.939231012048833, 9.694592710667722, 9.0), prj(15.863703305156273, 10.035276180410083, 9.0), prj(15.758770483143634, 10.368080573302676, 9.0), prj(15.6252311481466, 10.690473046962797, 9.0), prj(15.464101615137755, 11.0, 9.0), prj(15.276608177155968, 11.294305745404184, 9.0), prj(15.064177772475912, 11.571150438746157, 9.0), prj(14.82842712474619, 11.82842712474619, 9.0), prj(14.571150438746157, 12.064177772475912, 9.0), prj(14.294305745404184, 12.276608177155968, 9.0), prj(14.0, 12.464101615137753, 9.0), prj(13.690473046962797, 12.6252311481466, 9.0), prj(13.368080573302676, 12.758770483143634, 9.0), prj(13.035276180410083, 12.863703305156273, 9.0), prj(12.694592710667722, 12.939231012048833, 9.0), prj(12.348622970990633, 12.984778792366981, 9.0), prj(12.0, 13.0, 9.0), prj(11.651377029009367, 12.984778792366981, 9.0), prj(11.30540728933228, 12.939231012048833, 9.0), prj(10.964723819589917, 12.863703305156273, 9.0), prj(10.631919426697324, 12.758770483143634, 9.0), prj(10.309526953037203, 12.6252311481466, 9.0), prj(10.0, 12.464101615137755, 9.0), prj(9.705694254595816, 12.276608177155968, 9.0), prj(9.428849561253843, 12.064177772475912, 9.0), prj(9.17157287525381, 11.82842712474619, 9.0), prj(8.935822227524088, 11.571150438746159, 9.0), prj(8.723391822844032, 11.294305745404184, 9.0), prj(8.535898384862245, 11.0, 9.0), prj(8.3747688518534, 10.690473046962797, 9.0), prj(8.241229516856366, 10.368080573302676, 9.0), prj(8.136296694843727, 10.035276180410085, 9.0), prj(8.060768987951167, 9.69459271066772, 9.0), prj(8.015221207633019, 9.348622970990633, 9.0), prj(8.0, 9.0, 9.0), prj(8.015221207633019, 8.651377029009367, 9.0), prj(8.060768987951167, 8.305407289332278, 9.0), prj(8.136296694843727, 7.964723819589917, 9.0), prj(8.241229516856366, 7.631919426697325, 9.0), prj(8.3747688518534, 7.309526953037203, 9.0), prj(8.535898384862247, 7.0, 9.0), prj(8.723391822844032, 6.705694254595816, 9.0), prj(8.935822227524088, 6.428849561253843, 9.0), prj(9.171572875253808, 6.17157287525381, 9.0), prj(9.428849561253841, 5.935822227524088, 9.0), prj(9.705694254595814, 5.723391822844034, 9.0), prj(9.999999999999998, 5.5358983848622465, 9.0), prj(10.309526953037203, 5.3747688518534, 9.0), prj(10.631919426697326, 5.241229516856366, 9.0), prj(10.964723819589917, 5.136296694843727, 9.0), prj(11.305407289332278, 5.0607689879511675, 9.0), prj(11.651377029009367, 5.015221207633018, 9.0), prj(12.0, 5.0, 9.0), prj(12.34862297099063, 5.015221207633018, 9.0), prj(12.69459271066772, 5.0607689879511675, 9.0), prj(13.035276180410081, 5.136296694843726, 9.0), prj(13.368080573302676, 5.241229516856366, 9.0), prj(13.690473046962799, 5.374768851853401, 9.0), prj(14.0, 5.535898384862246, 9.0), prj(14.294305745404184, 5.723391822844032, 9.0), prj(14.571150438746157, 5.9358222275240875, 9.0), prj(14.82842712474619, 6.171572875253809, 9.0), prj(15.064177772475912, 6.428849561253841, 9.0), prj(15.276608177155966, 6.705694254595814, 9.0), prj(15.464101615137753, 6.999999999999998, 9.0), prj(15.6252311481466, 7.309526953037203, 9.0), prj(15.758770483143634, 7.631919426697326, 9.0), prj(15.863703305156273, 7.964723819589917, 9.0), prj(15.939231012048833, 8.305407289332278, 9.0), prj(15.984778792366981, 8.651377029009367, 9.0), prj(16.0, 8.999999999999998, 9.0))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    // Hình chiếu của (C2) lên mặt phẳng (C1)
    let pts2_proj = (prj(16.0, 9.0, 0.0), prj(15.939231012048833, 9.694592710667722, 0.0), prj(15.758770483143634, 10.368080573302676, 0.0), prj(15.464101615137755, 11.0, 0.0), prj(15.064177772475912, 11.571150438746157, 0.0), prj(14.571150438746157, 12.064177772475912, 0.0), prj(14.0, 12.464101615137753, 0.0), prj(13.368080573302676, 12.758770483143634, 0.0), prj(12.694592710667722, 12.939231012048833, 0.0), prj(12.0, 13.0, 0.0), prj(11.30540728933228, 12.939231012048833, 0.0), prj(10.631919426697324, 12.758770483143634, 0.0), prj(10.0, 12.464101615137755, 0.0), prj(9.428849561253843, 12.064177772475912, 0.0), prj(8.935822227524088, 11.571150438746159, 0.0), prj(8.535898384862245, 11.0, 0.0), prj(8.241229516856366, 10.368080573302676, 0.0), prj(8.060768987951167, 9.69459271066772, 0.0), prj(8.0, 9.0, 0.0), prj(8.060768987951167, 8.305407289332278, 0.0), prj(8.241229516856366, 7.631919426697325, 0.0), prj(8.535898384862247, 7.0, 0.0), prj(8.935822227524088, 6.428849561253843, 0.0), prj(9.428849561253841, 5.935822227524088, 0.0), prj(9.999999999999998, 5.5358983848622465, 0.0), prj(10.631919426697326, 5.241229516856366, 0.0), prj(11.305407289332278, 5.0607689879511675, 0.0), prj(12.0, 5.0, 0.0), prj(12.69459271066772, 5.0607689879511675, 0.0), prj(13.368080573302676, 5.241229516856366, 0.0), prj(14.0, 5.535898384862246, 0.0), prj(14.571150438746157, 5.9358222275240875, 0.0), prj(15.064177772475912, 6.428849561253841, 0.0), prj(15.464101615137753, 6.999999999999998, 0.0), prj(15.758770483143634, 7.631919426697326, 0.0), prj(15.939231012048833, 8.305407289332278, 0.0), prj(16.0, 8.999999999999998, 0.0))
    line(..pts2_proj, stroke: (dash: "dashed", paint: rgb("#b45309"), thickness: 1pt))
    let J2_p = prj(12.0, 9.0, 0.0)
    circle(J2_p, radius: 1.5pt, fill: rgb("#b45309"))
    content(J2_p, [$J_2'$], anchor: "north-east", padding: 2pt)
    line(J2, J2_p, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(4.800000000000001, 3.5999999999999996, 0)
    let N = prj(8.8, 6.6, 9)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(8.8, 6.6, 0.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ tâm $J_1(0; 0; 0)$, $R_1=6$, trên $z=0$.
  - $(C_2)$ tâm $J_2(12; 9; 9)$, $R_2=4$, trên $z=9$. Khoảng cách hai mặt phẳng là $h = 9$.
]
#note[
  *Lưu ý sư phạm:* Khi hình chiếu của tâm thứ hai $J_2'$ nằm ngoài đường tròn thứ nhất và hai vùng tròn chiếu không chồng lấn lên nhau, khoảng cách ngang nhỏ nhất là $J_1 J_2' - R_1 - R_2$.
]
*Bước 1:* Hình chiếu vuông góc của tâm $J_2$ xuống mặt phẳng $z=0$ là $J_2'(12; 9; 0)$. Khoảng cách hai tâm trên mặt phẳng chiếu:
$ J_1 J_2' = sqrt(12^2 + 9^2) = 15. $
*Bước 2:* Vì $J_1 J_2' = 15 > R_1 + R_2 = 10$, hình chiếu của $(C_2)$ nằm ngoài hoàn toàn $(C_1)$. Khoảng cách ngang tối thiểu là:
$ d_("ngang") = J_1 J_2' - R_1 - R_2 = 15 - 6 - 4 = 5. $
*Bước 3:* Áp dụng công thức Pytago không gian cho khoảng cách cực tiểu:
$ M N_(min) = sqrt(h^2 + d_("ngang")^2) = sqrt(9^2 + 5^2) = sqrt(106). $
  ]
)

#tln(
  [(Cấu hình 2.3 - Song song, lệch trục chiếu cắt nhau - BẪY) Hai bộ phận cảm biến chuyển động trên hai quỹ đạo tròn song song trong một thiết bị cơ khí. Quỹ đạo $(C_1)$ nằm trên mặt phẳng $z=0$ có tâm $J_1(0;0;0)$, bán kính $R_1=5$. Quỹ đạo $(C_2)$ nằm trên mặt phẳng $z=8$ có tâm $J_2(3;0;8)$, bán kính $R_2=2$. Tính khoảng cách gần nhất giữa hai bộ phận cảm biến trong quá trình hoạt động?],
  [8],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(3, 0, 8)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 8.0
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(5.0, 0.0, 0.0), prj(4.9809734904587275, 0.4357787137382908, 0.0), prj(4.92403876506104, 0.8682408883346516, 0.0), prj(4.8296291314453415, 1.2940952255126037, 0.0), prj(4.698463103929543, 1.7101007166283435, 0.0), prj(4.531538935183249, 2.1130913087034973, 0.0), prj(4.330127018922194, 2.4999999999999996, 0.0), prj(4.095760221444959, 2.8678821817552302, 0.0), prj(3.83022221559489, 3.2139380484326963, 0.0), prj(3.5355339059327378, 3.5355339059327373, 0.0), prj(3.2139380484326967, 3.83022221559489, 0.0), prj(2.8678821817552307, 4.095760221444959, 0.0), prj(2.5000000000000004, 4.330127018922193, 0.0), prj(2.1130913087034973, 4.531538935183249, 0.0), prj(1.7101007166283442, 4.698463103929542, 0.0), prj(1.2940952255126037, 4.8296291314453415, 0.0), prj(0.8682408883346521, 4.92403876506104, 0.0), prj(0.43577871373829064, 4.9809734904587275, 0.0), prj(3.061616997868383e-16, 5.0, 0.0), prj(-0.4357787137382912, 4.9809734904587275, 0.0), prj(-0.8682408883346515, 4.92403876506104, 0.0), prj(-1.2940952255126041, 4.8296291314453415, 0.0), prj(-1.7101007166283435, 4.698463103929543, 0.0), prj(-2.113091308703497, 4.53153893518325, 0.0), prj(-2.499999999999999, 4.3301270189221945, 0.0), prj(-2.8678821817552307, 4.095760221444959, 0.0), prj(-3.2139380484326963, 3.83022221559489, 0.0), prj(-3.5355339059327373, 3.5355339059327378, 0.0), prj(-3.8302222155948895, 3.2139380484326976, 0.0), prj(-4.0957602214449595, 2.86788218175523, 0.0), prj(-4.330127018922194, 2.4999999999999996, 0.0), prj(-4.531538935183249, 2.1130913087034973, 0.0), prj(-4.698463103929542, 1.7101007166283444, 0.0), prj(-4.829629131445341, 1.294095225512605, 0.0), prj(-4.92403876506104, 0.8682408883346513, 0.0), prj(-4.9809734904587275, 0.43577871373829097, 0.0), prj(-5.0, 6.123233995736766e-16, 0.0), prj(-4.9809734904587275, -0.4357787137382897, 0.0), prj(-4.92403876506104, -0.8682408883346524, 0.0), prj(-4.8296291314453415, -1.294095225512604, 0.0), prj(-4.698463103929543, -1.7101007166283433, 0.0), prj(-4.53153893518325, -2.1130913087034964, 0.0), prj(-4.330127018922193, -2.5000000000000004, 0.0), prj(-4.095760221444959, -2.8678821817552307, 0.0), prj(-3.83022221559489, -3.2139380484326963, 0.0), prj(-3.5355339059327386, -3.535533905932737, 0.0), prj(-3.213938048432698, -3.8302222155948895, 0.0), prj(-2.867882181755232, -4.095760221444958, 0.0), prj(-2.500000000000002, -4.330127018922192, 0.0), prj(-2.1130913087034955, -4.531538935183251, 0.0), prj(-1.7101007166283424, -4.698463103929543, 0.0), prj(-1.2940952255126033, -4.8296291314453415, 0.0), prj(-0.8682408883346516, -4.92403876506104, 0.0), prj(-0.43577871373829125, -4.9809734904587275, 0.0), prj(-9.184850993605148e-16, -5.0, 0.0), prj(0.43577871373828947, -4.9809734904587275, 0.0), prj(0.8682408883346499, -4.924038765061041, 0.0), prj(1.2940952255126015, -4.829629131445342, 0.0), prj(1.7101007166283453, -4.698463103929542, 0.0), prj(2.113091308703498, -4.531538935183249, 0.0), prj(2.5, -4.330127018922193, 0.0), prj(2.8678821817552302, -4.095760221444959, 0.0), prj(3.2139380484326963, -3.8302222155948904, 0.0), prj(3.535533905932737, -3.5355339059327386, 0.0), prj(3.8302222155948895, -3.213938048432698, 0.0), prj(4.095760221444958, -2.867882181755232, 0.0), prj(4.330127018922192, -2.500000000000002, 0.0), prj(4.53153893518325, -2.113091308703496, 0.0), prj(4.698463103929543, -1.7101007166283426, 0.0), prj(4.8296291314453415, -1.2940952255126035, 0.0), prj(4.92403876506104, -0.868240888334652, 0.0), prj(4.9809734904587275, -0.4357787137382916, 0.0), prj(5.0, -1.2246467991473533e-15, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(3 - pw2*1.0 - pw2*0.0, 0 - pw2*0.0 - pw2*1.0, 8 - pw2*0.0 - pw2*0.0)
      let p2_2 = prj(3 + pw2*1.0 - pw2*0.0, 0 + pw2*0.0 - pw2*1.0, 8 + pw2*0.0 - pw2*0.0)
      let p2_3 = prj(3 + pw2*1.0 + pw2*0.0, 0 + pw2*0.0 + pw2*1.0, 8 + pw2*0.0 + pw2*0.0)
      let p2_4 = prj(3 - pw2*1.0 + pw2*0.0, 0 - pw2*0.0 + pw2*1.0, 8 - pw2*0.0 + pw2*0.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(5.0, 0.0, 8.0), prj(4.992389396183491, 0.17431148549531633, 8.0), prj(4.969615506024416, 0.34729635533386066, 8.0), prj(4.931851652578136, 0.5176380902050415, 8.0), prj(4.879385241571817, 0.6840402866513374, 8.0), prj(4.8126155740733, 0.8452365234813989, 8.0), prj(4.732050807568878, 0.9999999999999999, 8.0), prj(4.638304088577984, 1.147152872702092, 8.0), prj(4.532088886237956, 1.2855752193730785, 8.0), prj(4.414213562373095, 1.414213562373095, 8.0), prj(4.2855752193730785, 1.532088886237956, 8.0), prj(4.147152872702092, 1.6383040885779836, 8.0), prj(4.0, 1.7320508075688772, 8.0), prj(3.845236523481399, 1.8126155740732999, 8.0), prj(3.6840402866513378, 1.8793852415718166, 8.0), prj(3.5176380902050415, 1.9318516525781366, 8.0), prj(3.347296355333861, 1.969615506024416, 8.0), prj(3.1743114854953163, 1.992389396183491, 8.0), prj(3.0, 2.0, 8.0), prj(2.8256885145046837, 1.992389396183491, 8.0), prj(2.6527036446661394, 1.969615506024416, 8.0), prj(2.4823619097949585, 1.9318516525781366, 8.0), prj(2.3159597133486627, 1.8793852415718169, 8.0), prj(2.1547634765186015, 1.8126155740733, 8.0), prj(2.0000000000000004, 1.7320508075688776, 8.0), prj(1.8528471272979077, 1.6383040885779836, 8.0), prj(1.7144247806269215, 1.532088886237956, 8.0), prj(1.585786437626905, 1.4142135623730951, 8.0), prj(1.4679111137620442, 1.285575219373079, 8.0), prj(1.3616959114220162, 1.1471528727020919, 8.0), prj(1.2679491924311226, 0.9999999999999999, 8.0), prj(1.1873844259267001, 0.845236523481399, 8.0), prj(1.1206147584281834, 0.6840402866513378, 8.0), prj(1.0681483474218636, 0.517638090205042, 8.0), prj(1.030384493975584, 0.3472963553338605, 8.0), prj(1.007610603816509, 0.1743114854953164, 8.0), prj(1.0, 2.4492935982947064e-16, 8.0), prj(1.007610603816509, -0.1743114854953159, 8.0), prj(1.030384493975584, -0.34729635533386094, 8.0), prj(1.0681483474218634, -0.5176380902050416, 8.0), prj(1.1206147584281831, -0.6840402866513373, 8.0), prj(1.1873844259267, -0.8452365234813985, 8.0), prj(1.2679491924311228, -1.0000000000000002, 8.0), prj(1.3616959114220164, -1.1471528727020923, 8.0), prj(1.467911113762044, -1.2855752193730785, 8.0), prj(1.5857864376269046, -1.4142135623730947, 8.0), prj(1.7144247806269208, -1.5320888862379558, 8.0), prj(1.8528471272979072, -1.6383040885779832, 8.0), prj(1.9999999999999991, -1.7320508075688767, 8.0), prj(2.154763476518602, -1.8126155740733003, 8.0), prj(2.315959713348663, -1.8793852415718169, 8.0), prj(2.4823619097949585, -1.9318516525781366, 8.0), prj(2.6527036446661394, -1.969615506024416, 8.0), prj(2.8256885145046837, -1.992389396183491, 8.0), prj(2.9999999999999996, -2.0, 8.0), prj(3.174311485495316, -1.992389396183491, 8.0), prj(3.34729635533386, -1.9696155060244163, 8.0), prj(3.5176380902050406, -1.9318516525781368, 8.0), prj(3.684040286651338, -1.8793852415718166, 8.0), prj(3.8452365234813994, -1.8126155740732997, 8.0), prj(4.0, -1.7320508075688772, 8.0), prj(4.147152872702092, -1.6383040885779836, 8.0), prj(4.2855752193730785, -1.5320888862379562, 8.0), prj(4.414213562373095, -1.4142135623730954, 8.0), prj(4.532088886237956, -1.2855752193730792, 8.0), prj(4.638304088577983, -1.1471528727020928, 8.0), prj(4.732050807568877, -1.0000000000000009, 8.0), prj(4.8126155740733, -0.8452365234813983, 8.0), prj(4.879385241571817, -0.6840402866513371, 8.0), prj(4.931851652578136, -0.5176380902050414, 8.0), prj(4.969615506024416, -0.3472963553338608, 8.0), prj(4.992389396183491, -0.17431148549531664, 8.0), prj(5.0, -4.898587196589413e-16, 8.0))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    // Hình chiếu của (C2) lên mặt phẳng (C1)
    let pts2_proj = (prj(5.0, 0.0, 0.0), prj(4.969615506024416, 0.34729635533386066, 0.0), prj(4.879385241571817, 0.6840402866513374, 0.0), prj(4.732050807568878, 0.9999999999999999, 0.0), prj(4.532088886237956, 1.2855752193730785, 0.0), prj(4.2855752193730785, 1.532088886237956, 0.0), prj(4.0, 1.7320508075688772, 0.0), prj(3.6840402866513378, 1.8793852415718166, 0.0), prj(3.347296355333861, 1.969615506024416, 0.0), prj(3.0, 2.0, 0.0), prj(2.6527036446661394, 1.969615506024416, 0.0), prj(2.3159597133486627, 1.8793852415718169, 0.0), prj(2.0000000000000004, 1.7320508075688776, 0.0), prj(1.7144247806269215, 1.532088886237956, 0.0), prj(1.4679111137620442, 1.285575219373079, 0.0), prj(1.2679491924311226, 0.9999999999999999, 0.0), prj(1.1206147584281834, 0.6840402866513378, 0.0), prj(1.030384493975584, 0.3472963553338605, 0.0), prj(1.0, 2.4492935982947064e-16, 0.0), prj(1.030384493975584, -0.34729635533386094, 0.0), prj(1.1206147584281831, -0.6840402866513373, 0.0), prj(1.2679491924311228, -1.0000000000000002, 0.0), prj(1.467911113762044, -1.2855752193730785, 0.0), prj(1.7144247806269208, -1.5320888862379558, 0.0), prj(1.9999999999999991, -1.7320508075688767, 0.0), prj(2.315959713348663, -1.8793852415718169, 0.0), prj(2.6527036446661394, -1.969615506024416, 0.0), prj(2.9999999999999996, -2.0, 0.0), prj(3.34729635533386, -1.9696155060244163, 0.0), prj(3.684040286651338, -1.8793852415718166, 0.0), prj(4.0, -1.7320508075688772, 0.0), prj(4.2855752193730785, -1.5320888862379562, 0.0), prj(4.532088886237956, -1.2855752193730792, 0.0), prj(4.732050807568877, -1.0000000000000009, 0.0), prj(4.879385241571817, -0.6840402866513371, 0.0), prj(4.969615506024416, -0.3472963553338608, 0.0), prj(5.0, -4.898587196589413e-16, 0.0))
    line(..pts2_proj, stroke: (dash: "dashed", paint: rgb("#b45309"), thickness: 1pt))
    let J2_p = prj(3.0, 0.0, 0.0)
    circle(J2_p, radius: 1.5pt, fill: rgb("#b45309"))
    content(J2_p, [$J_2'$], anchor: "north-east", padding: 2pt)
    line(J2, J2_p, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(5, 0, 0)
    let N = prj(5, 0, 8)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(5.0, 0.0, 0.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ tâm $J_1(0;0;0)$, $R_1=5$, trên $z=0$.
  - $(C_2)$ tâm $J_2(3;0;8)$, $R_2=2$, trên $z=8$. Khoảng cách hai mặt phẳng là $h=8$.
]
#note[
  *Cảnh báo bẫy:* Học sinh rất dễ áp dụng nhầm công thức $d_("ngang") = |J_1 J_2' - R_1 - R_2| = |3 - 5 - 2| = 4$ dẫn đến $M N = sqrt(8^2 + 4^2) = 4 sqrt(5) approx 8.94$. Thực tế, do hình chiếu $(C_2')$ cắt và tiếp xúc trong với $(C_1)$, tồn tại vị trí mà hình chiếu ngang bằng $0$!
]
*Bước 1:* Chiếu $(C_2)$ xuống mặt phẳng $z=0$ được đường tròn $(C_2')$ tâm $J_2'(3;0;0)$, bán kính $R_2 = 2$.
Khoảng cách giữa hai tâm chiếu là $J_1 J_2' = 3$.
*Bước 2:* Nhận xét vị trí tương đối giữa $(C_1)$ và $(C_2')$:
Ta thấy: $J_1 J_2' = 3 = R_1 - R_2 = 5 - 2$.
Do đó, đường tròn chiếu $(C_2')$ tiếp xúc trong với đường tròn $(C_1)$ tại điểm $I(5;0;0)$.
*Bước 3:* Tại điểm tiếp xúc trong $I(5;0;0)$, khoảng cách hình chiếu ngang giữa hai đường tròn bằng $0$.
Khi đó, khoảng cách cực tiểu giữa hai điểm trong không gian đúng bằng chiều cao đứng thẳng:
$ M N_(min) = h = 8. $
(Đạt được khi $M(5;0;0)$ và $N(5;0;8)$).
  ]
)

#tln(
  [(Cấu hình 3.1 - Hai mặt phẳng vuông góc, đối xứng) Bệ đỡ nằm ngang là đường tròn $(C_1)$ nằm trên mặt phẳng $(O x y): z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Vòng quay đứng trang trí là đường tròn $(C_2)$ nằm trên mặt phẳng $(O y z): x=0$, tâm $J_2(0;6;8)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa bệ đỡ và vòng quay đứng?],
  [$sqrt(73) - 4$],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(0, 6, 8)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 6.0
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(3.0, 0.0, 0.0), prj(2.988584094275237, 0.2614672282429745, 0.0), prj(2.954423259036624, 0.520944533000791, 0.0), prj(2.897777478867205, 0.7764571353075622, 0.0), prj(2.8190778623577253, 1.0260604299770062, 0.0), prj(2.7189233611099497, 1.2678547852220983, 0.0), prj(2.598076211353316, 1.4999999999999998, 0.0), prj(2.4574561328669753, 1.7207293090531381, 0.0), prj(2.298133329356934, 1.9283628290596178, 0.0), prj(2.121320343559643, 2.1213203435596424, 0.0), prj(1.9283628290596182, 2.298133329356934, 0.0), prj(1.7207293090531386, 2.4574561328669753, 0.0), prj(1.5000000000000004, 2.598076211353316, 0.0), prj(1.2678547852220983, 2.7189233611099497, 0.0), prj(1.0260604299770064, 2.819077862357725, 0.0), prj(0.7764571353075622, 2.897777478867205, 0.0), prj(0.5209445330007912, 2.954423259036624, 0.0), prj(0.26146722824297436, 2.988584094275237, 0.0), prj(1.8369701987210297e-16, 3.0, 0.0), prj(-0.2614672282429747, 2.988584094275237, 0.0), prj(-0.5209445330007909, 2.954423259036624, 0.0), prj(-0.7764571353075626, 2.897777478867205, 0.0), prj(-1.0260604299770062, 2.8190778623577253, 0.0), prj(-1.267854785222098, 2.71892336110995, 0.0), prj(-1.4999999999999993, 2.5980762113533165, 0.0), prj(-1.7207293090531386, 2.4574561328669753, 0.0), prj(-1.9283628290596178, 2.298133329356934, 0.0), prj(-2.1213203435596424, 2.121320343559643, 0.0), prj(-2.2981333293569337, 1.9283628290596184, 0.0), prj(-2.4574561328669757, 1.7207293090531377, 0.0), prj(-2.598076211353316, 1.4999999999999998, 0.0), prj(-2.7189233611099497, 1.2678547852220985, 0.0), prj(-2.819077862357725, 1.0260604299770066, 0.0), prj(-2.8977774788672046, 0.7764571353075631, 0.0), prj(-2.954423259036624, 0.5209445330007907, 0.0), prj(-2.988584094275237, 0.2614672282429746, 0.0), prj(-3.0, 3.6739403974420594e-16, 0.0), prj(-2.988584094275237, -0.26146722824297386, 0.0), prj(-2.954423259036624, -0.5209445330007914, 0.0), prj(-2.897777478867205, -0.7764571353075624, 0.0), prj(-2.8190778623577253, -1.026060429977006, 0.0), prj(-2.71892336110995, -1.2678547852220978, 0.0), prj(-2.598076211353316, -1.5000000000000004, 0.0), prj(-2.4574561328669753, -1.7207293090531386, 0.0), prj(-2.298133329356934, -1.9283628290596178, 0.0), prj(-2.121320343559643, -2.121320343559642, 0.0), prj(-1.9283628290596186, -2.2981333293569337, 0.0), prj(-1.720729309053139, -2.457456132866975, 0.0), prj(-1.5000000000000013, -2.598076211353315, 0.0), prj(-1.2678547852220974, -2.7189233611099506, 0.0), prj(-1.0260604299770055, -2.8190778623577253, 0.0), prj(-0.7764571353075619, -2.897777478867205, 0.0), prj(-0.520944533000791, -2.954423259036624, 0.0), prj(-0.26146722824297475, -2.988584094275237, 0.0), prj(-5.51091059616309e-16, -3.0, 0.0), prj(0.26146722824297364, -2.988584094275237, 0.0), prj(0.5209445330007899, -2.9544232590366244, 0.0), prj(0.7764571353075609, -2.897777478867205, 0.0), prj(1.026060429977007, -2.819077862357725, 0.0), prj(1.2678547852220987, -2.7189233611099493, 0.0), prj(1.5, -2.598076211353316, 0.0), prj(1.7207293090531381, -2.4574561328669753, 0.0), prj(1.9283628290596178, -2.2981333293569346, 0.0), prj(2.121320343559642, -2.121320343559643, 0.0), prj(2.2981333293569337, -1.9283628290596186, 0.0), prj(2.457456132866975, -1.720729309053139, 0.0), prj(2.598076211353315, -1.5000000000000013, 0.0), prj(2.71892336110995, -1.2678547852220974, 0.0), prj(2.8190778623577253, -1.0260604299770058, 0.0), prj(2.897777478867205, -0.776457135307562, 0.0), prj(2.954423259036624, -0.5209445330007911, 0.0), prj(2.988584094275237, -0.26146722824297497, 0.0), prj(3.0, -7.347880794884119e-16, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.4
      let p2_1 = prj(0 - pw2*-0.0 - pw2*-0.0, 6 - pw2*1.0 - pw2*-0.0, 8 - pw2*0.0 - pw2*1.0)
      let p2_2 = prj(0 + pw2*-0.0 - pw2*-0.0, 6 + pw2*1.0 - pw2*-0.0, 8 + pw2*0.0 - pw2*1.0)
      let p2_3 = prj(0 + pw2*-0.0 + pw2*-0.0, 6 + pw2*1.0 + pw2*-0.0, 8 + pw2*0.0 + pw2*1.0)
      let p2_4 = prj(0 - pw2*-0.0 + pw2*-0.0, 6 - pw2*1.0 + pw2*-0.0, 8 - pw2*0.0 + pw2*1.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(0.0, 10.0, 8.0), prj(0.0, 9.984778792366981, 8.348622970990633), prj(0.0, 9.939231012048833, 8.694592710667722), prj(0.0, 9.863703305156273, 9.035276180410083), prj(0.0, 9.758770483143634, 9.368080573302676), prj(0.0, 9.6252311481466, 9.690473046962797), prj(0.0, 9.464101615137755, 10.0), prj(0.0, 9.276608177155968, 10.294305745404184), prj(0.0, 9.064177772475912, 10.571150438746157), prj(0.0, 8.82842712474619, 10.82842712474619), prj(0.0, 8.571150438746157, 11.064177772475912), prj(0.0, 8.294305745404184, 11.276608177155968), prj(0.0, 8.0, 11.464101615137753), prj(0.0, 7.690473046962798, 11.6252311481466), prj(0.0, 7.3680805733026755, 11.758770483143634), prj(0.0, 7.035276180410083, 11.863703305156273), prj(0.0, 6.694592710667722, 11.939231012048833), prj(0.0, 6.3486229709906326, 11.984778792366981), prj(0.0, 6.0, 12.0), prj(0.0, 5.6513770290093674, 11.984778792366981), prj(0.0, 5.305407289332279, 11.939231012048833), prj(0.0, 4.964723819589917, 11.863703305156273), prj(0.0, 4.631919426697325, 11.758770483143634), prj(0.0, 4.309526953037203, 11.6252311481466), prj(0.0, 4.000000000000001, 11.464101615137755), prj(0.0, 3.7056942545958154, 11.276608177155968), prj(0.0, 3.428849561253843, 11.064177772475912), prj(0.0, 3.17157287525381, 10.82842712474619), prj(0.0, 2.9358222275240884, 10.571150438746159), prj(0.0, 2.7233918228440324, 10.294305745404184), prj(0.0, 2.535898384862245, 10.0), prj(0.0, 2.3747688518534003, 9.690473046962797), prj(0.0, 2.2412295168563667, 9.368080573302676), prj(0.0, 2.136296694843727, 9.035276180410085), prj(0.0, 2.060768987951168, 8.69459271066772), prj(0.0, 2.015221207633018, 8.348622970990633), prj(0.0, 2.0, 8.0), prj(0.0, 2.015221207633018, 7.651377029009368), prj(0.0, 2.060768987951168, 7.305407289332278), prj(0.0, 2.1362966948437268, 6.964723819589917), prj(0.0, 2.2412295168563663, 6.631919426697325), prj(0.0, 2.3747688518534, 6.309526953037203), prj(0.0, 2.5358983848622456, 6.0), prj(0.0, 2.723391822844033, 5.705694254595816), prj(0.0, 2.935822227524088, 5.428849561253843), prj(0.0, 3.1715728752538093, 5.17157287525381), prj(0.0, 3.4288495612538417, 4.935822227524088), prj(0.0, 3.7056942545958145, 4.723391822844034), prj(0.0, 3.9999999999999982, 4.5358983848622465), prj(0.0, 4.309526953037204, 4.3747688518534), prj(0.0, 4.631919426697326, 4.241229516856366), prj(0.0, 4.964723819589917, 4.136296694843727), prj(0.0, 5.305407289332279, 4.0607689879511675), prj(0.0, 5.6513770290093674, 4.015221207633018), prj(0.0, 5.999999999999999, 4.0), prj(0.0, 6.348622970990632, 4.015221207633018), prj(0.0, 6.69459271066772, 4.0607689879511675), prj(0.0, 7.035276180410081, 4.136296694843726), prj(0.0, 7.368080573302676, 4.241229516856366), prj(0.0, 7.690473046962799, 4.374768851853401), prj(0.0, 8.0, 4.535898384862246), prj(0.0, 8.294305745404184, 4.723391822844032), prj(0.0, 8.571150438746157, 4.9358222275240875), prj(0.0, 8.82842712474619, 5.171572875253809), prj(0.0, 9.064177772475912, 5.428849561253841), prj(0.0, 9.276608177155966, 5.705694254595814), prj(0.0, 9.464101615137753, 5.999999999999998), prj(0.0, 9.6252311481466, 6.309526953037203), prj(0.0, 9.758770483143634, 6.631919426697326), prj(0.0, 9.863703305156273, 6.964723819589917), prj(0.0, 9.939231012048833, 7.305407289332279), prj(0.0, 9.984778792366981, 7.651377029009367), prj(0.0, 10.0, 7.999999999999999))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(0, 3, 0)
    let N = prj(0, 4.595506233646433, 4.254683289723822)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(0.0, 4.595506233646433, 0.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ nằm trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 3$.
  - $(C_2)$ nằm trên mặt phẳng $x=0$, tâm $J_2(0; 6; 8)$, bán kính $R_2 = 4$.
]
#note[
  *Phân tích sư phạm chuyên sâu về hướng chiếu (Câu hỏi cốt lõi của bài toán):*
  
  *Câu hỏi:* Tại sau phải lấy điểm $M$ của đường tròn $(C_1)$ chiếu qua mặt phẳng $(P_2): x=0$ chứa $(C_2)$ mà không làm ngược lại (chiếu $N in (C_2)$ về mặt phẳng $(P_1): z=0$ chứa $(C_1)$)?
  
  *Trả lời:*
  Về mặt toán học hình học thuần túy, cả hai hướng chiếu là hoàn toàn tương đương và luôn dẫn đến cùng một kết quả khoảng cách ngắn nhất. Tuy nhiên, về mặt biến đổi đại số và tính toán, hai hướng chiếu này có độ phức tạp chênh lệch rất lớn:
  
  - *Hướng thứ nhất (Chiếu $M in (C_1)$ sang mặt phẳng của $(C_2)$):*
    Ta tham số hóa điểm $M(3 cos t, 3 sin t, 0) in (C_1)$. Hình chiếu vuông góc của $M$ lên mặt phẳng $x=0$ là $M_p(0, 3 sin t, 0)$.
    Tọa độ của $M_p$ chỉ phụ thuộc vào duy nhất một hàm lượng giác là $sin t$. Bằng cách đặt ẩn phụ $y = 3 sin t$ (với $y in [-3; 3]$), ta có $9 cos^2 t = 9 - y^2$. Hàm số bình phương khoảng cách cần khảo sát trở thành một hàm số đa thức một biến cực kỳ sạch sẽ và đơn giản:
    $ g(y) = 125 - 12 y - 8sqrt((y-6)^2 + 64) $
    Đạo hàm và bảng biến thiên của hàm này được thiết lập một cách trơn tru, không gặp vấp váp đại số nào.
    
  - *Hướng thứ hai (Chiếu $N in (C_2)$ ngược lại sang mặt phẳng của $(C_1)$):*
    Ta tham số hóa điểm $N(0, 6 + 4 cos u, 8 + 4 sin u) in (C_2)$. Hình chiếu vuông góc của $N$ lên mặt phẳng $z=0$ là $N_p(0, 6 + 4 cos u, 0)$.
    Khoảng cách đứng là $N N_p = |8 + 4 sin u|$, khoảng cách ngang là $d(N_p, (C_1)) = ||6 + 4 cos u| - 3| = |3 + 4 cos u|$ (vì $6 + 4 cos u >= 2 > 0$).
    Bình phương khoảng cách không gian khi đó là:
    $ f(u) = N N_p^2 + d(N_p, (C_1))^2 = (8 + 4 sin u)^2 + (3 + 4 cos u)^2 $
    $ = 89 + 8(8 sin u + 3 cos u) $
    Mặc dù ta có thể tìm giá trị nhỏ nhất của $f(u)$ bằng bất đẳng thức Cauchy-Schwarz hoặc lượng giác hóa ($8 sin u + 3 cos u >= -sqrt(8^2+3^2) = -sqrt(73) => f(u) >= 89 - 8sqrt(73)$), nhưng việc xuất hiện đồng thời cả $sin u$ và $cos u$, kết hợp với việc phải phân tích dấu trị tuyệt đối kép đối với $||6 + 4 cos u| - 3|$ trong các cấu hình lệch trục tổng quát khác sẽ làm phép toán trở nên rối rắm và khó kiểm soát hơn nhiều.
    
  *Kết luận:* Do đó, ta luôn ưu tiên hướng chiếu nào giúp thu được điểm chiếu có tọa độ đơn giản nhất (chứa ít biến số lượng giác nhất), giúp việc đặt ẩn phụ chuyển hóa từ hàm lượng giác sang hàm đa thức trở nên dễ dàng nhất!
]
*Bước 1 (Tham số hóa điểm $M$):*
Lấy điểm $M(3 cos t, 3 sin t, 0) in (C_1)$ trên mặt phẳng $z=0$ với $t in [0; 2 pi)$.

*Bước 2 (Chiếu vuông góc lên mặt phẳng thứ hai):*
Chiếu vuông góc điểm $M$ lên mặt phẳng $x=0$ (chứa đường tròn $C_2$), ta thu được hình chiếu:
$ M_p(0, 3 sin t, 0) $
Khoảng cách đứng là: $M M_p = |3 cos t|$.

*Bước 3 (Phân rã khoảng cách Pytago):*
Tam giác $M M_p N$ vuông tại $M_p$ nên:
$ M N = sqrt(M M_p^2 + M_p N^2) $
Khoảng cách phẳng từ $M_p$ đến tâm $J_2(0; 6; 8)$ là:
$ M_p J_2 = sqrt((0-0)^2 + (3 sin t - 6)^2 + (0 - 8)^2) = sqrt((3 sin t - 6)^2 + 64) $
Khoảng cách $M_p N$ ngắn nhất khi $N$ nằm trên đoạn thẳng nối $M_p$ và tâm $J_2$:
$ M_p N_(min) = |M_p J_2 - R_2| = sqrt((3 sin t - 6)^2 + 64) - 4 $

*Bước 4 (Thiết lập và khảo sát hàm số một biến):*
Bình phương khoảng cách ngắn nhất từ $M$ đến đường tròn $(C_2)$ là:
$ f(t) = M M_p^2 + (M_p N_(min))^2 = 9 cos^2 t + (sqrt((3 sin t - 6)^2 + 64) - 4)^2 $
Đặt $y = 3 sin t$ với $y in [-3; 3]$, ta có $9 cos^2 t = 9 - y^2$. Hàm số theo biến $y$ là:
$ g(y) = 9 - y^2 + (sqrt((y-6)^2 + 64) - 4)^2 $
$ = 9 - y^2 + (y-6)^2 + 64 - 8sqrt((y-6)^2 + 64) + 16 $
$ = 125 - 12y - 8sqrt((y-6)^2 + 64) $

*Bước 5 (Tìm cực tiểu bằng đạo hàm):*
Khảo sát đạo hàm của $g(y)$ trên đoạn $[-3; 3]$:
$ g'(y) = -12 - 8 dot (y-6)/sqrt((y-6)^2 + 64) = -12 - (8(y-6))/sqrt((y-6)^2 + 64) $
Xét phương trình $g'(y) = 0 => 3sqrt((y-6)^2 + 64) = -2(y-6) => 9((y-6)^2 + 64) = 4(y-6)^2$ (vô nghiệm).
Do đó $g'(y)$ không đổi dấu trên $[-3; 3]$. Thử giá trị tại $y=3$:
$ g'(3) = -12 + 24/sqrt(73) < 0 $
Vì $g'(y) < 0$ với mọi $y in [-3; 3]$, hàm số $g(y)$ nghịch biến trên $[-3; 3]$.
Giá trị nhỏ nhất của $g(y)$ đạt được tại đầu mút lớn nhất $y = 3$:
$ g(3) = 125 - 12(3) - 8sqrt((3-6)^2 + 64) = 89 - 8sqrt(73) = (sqrt(73) - 4)^2 $
Vậy khoảng cách không gian ngắn nhất là:
$ M N_(min) = sqrt(g(3)) = sqrt(73) - 4 $
(Đạt được khi $y = 3 => M(0; 3; 0)$ và $N(0; 32/sqrt(73); 64/sqrt(73))$).

*Cách 2 (Giải nhanh bằng công thức khoảng cách vạn năng & Casio):*
Ta áp dụng trực tiếp công thức khoảng cách vạn năng từ điểm $M in (C_1)$ đến đường tròn $(C_2)$ nằm trên mặt phẳng $(P_2): x=0$, tâm $J_2(0; 6; 8)$, bán kính $R_2 = 4$:
$ d(M, (C_2))^2 = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
- Điểm $M(3 cos t, 3 sin t, 0) in (C_1)$. Ta có:
  $ M J_2^2 = (3 cos t - 0)^2 + (3 sin t - 6)^2 + (0 - 8)^2 = 9 cos^2 t + 9 sin^2 t - 36 sin t + 36 + 64 = 109 - 36 sin t. $
  $ d(M, P_2)^2 = d(M, x=0)^2 = 9 cos^2 t. $
- Thay vào công thức vạn năng:
  $ F(t) = 109 - 36 sin t + 16 - 8sqrt(109 - 36 sin t - 9 cos^2 t) $
  $ = 125 - 36 sin t - 8sqrt(109 - 36 sin t - 9(1 - sin^2 t)) $
  $ = 125 - 36 sin t - 8sqrt(9 sin^2 t - 36 sin t + 100) $
- Đặt $y = 3 sin t$ với $y in [-3; 3]$, ta thu được hàm số giống hệt Cách 1:
  $ G(y) = 125 - 12 y - 8sqrt((y-6)^2 + 64) $
- Sử dụng Casio quét bảng giá trị (Table) của $G(y)$ trên $[-3; 3]$ (hoặc quét $F(t)$ trên $[0; 2 pi]$), ta dễ dàng tìm được giá trị nhỏ nhất của hàm số tại $y = 3$ (ứng với $t = pi/2$):
  $ G(3) = 89 - 8sqrt(73) $
  $ => M N_(min) = sqrt(89 - 8sqrt(73)) = sqrt(73) - 4. $
  ]
)

#tln(
  [(Cấu hình 3.2 - Hai mặt phẳng vuông góc, lệch trục) Trong hệ tọa độ $O x y z$, đường tròn $(C_1)$ nằm trên mặt phẳng $z=0$, có tâm $J_1(0;0;0)$, bán kính $R_1=5$. Đường tròn $(C_2)$ nằm trên mặt phẳng thẳng đứng $x=4$, có tâm $J_2(4; 8; 6)$, bán kính $R_2=2$. Tìm khoảng cách nhỏ nhất giữa một điểm trên $(C_1)$ và một điểm trên $(C_2)$?],
  [$sqrt(141 - 40 sqrt(5)) - 2$],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(4, 8, 6)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 8.0
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(5.0, 0.0, 0.0), prj(4.9809734904587275, 0.4357787137382908, 0.0), prj(4.92403876506104, 0.8682408883346516, 0.0), prj(4.8296291314453415, 1.2940952255126037, 0.0), prj(4.698463103929543, 1.7101007166283435, 0.0), prj(4.531538935183249, 2.1130913087034973, 0.0), prj(4.330127018922194, 2.4999999999999996, 0.0), prj(4.095760221444959, 2.8678821817552302, 0.0), prj(3.83022221559489, 3.2139380484326963, 0.0), prj(3.5355339059327378, 3.5355339059327373, 0.0), prj(3.2139380484326967, 3.83022221559489, 0.0), prj(2.8678821817552307, 4.095760221444959, 0.0), prj(2.5000000000000004, 4.330127018922193, 0.0), prj(2.1130913087034973, 4.531538935183249, 0.0), prj(1.7101007166283442, 4.698463103929542, 0.0), prj(1.2940952255126037, 4.8296291314453415, 0.0), prj(0.8682408883346521, 4.92403876506104, 0.0), prj(0.43577871373829064, 4.9809734904587275, 0.0), prj(3.061616997868383e-16, 5.0, 0.0), prj(-0.4357787137382912, 4.9809734904587275, 0.0), prj(-0.8682408883346515, 4.92403876506104, 0.0), prj(-1.2940952255126041, 4.8296291314453415, 0.0), prj(-1.7101007166283435, 4.698463103929543, 0.0), prj(-2.113091308703497, 4.53153893518325, 0.0), prj(-2.499999999999999, 4.3301270189221945, 0.0), prj(-2.8678821817552307, 4.095760221444959, 0.0), prj(-3.2139380484326963, 3.83022221559489, 0.0), prj(-3.5355339059327373, 3.5355339059327378, 0.0), prj(-3.8302222155948895, 3.2139380484326976, 0.0), prj(-4.0957602214449595, 2.86788218175523, 0.0), prj(-4.330127018922194, 2.4999999999999996, 0.0), prj(-4.531538935183249, 2.1130913087034973, 0.0), prj(-4.698463103929542, 1.7101007166283444, 0.0), prj(-4.829629131445341, 1.294095225512605, 0.0), prj(-4.92403876506104, 0.8682408883346513, 0.0), prj(-4.9809734904587275, 0.43577871373829097, 0.0), prj(-5.0, 6.123233995736766e-16, 0.0), prj(-4.9809734904587275, -0.4357787137382897, 0.0), prj(-4.92403876506104, -0.8682408883346524, 0.0), prj(-4.8296291314453415, -1.294095225512604, 0.0), prj(-4.698463103929543, -1.7101007166283433, 0.0), prj(-4.53153893518325, -2.1130913087034964, 0.0), prj(-4.330127018922193, -2.5000000000000004, 0.0), prj(-4.095760221444959, -2.8678821817552307, 0.0), prj(-3.83022221559489, -3.2139380484326963, 0.0), prj(-3.5355339059327386, -3.535533905932737, 0.0), prj(-3.213938048432698, -3.8302222155948895, 0.0), prj(-2.867882181755232, -4.095760221444958, 0.0), prj(-2.500000000000002, -4.330127018922192, 0.0), prj(-2.1130913087034955, -4.531538935183251, 0.0), prj(-1.7101007166283424, -4.698463103929543, 0.0), prj(-1.2940952255126033, -4.8296291314453415, 0.0), prj(-0.8682408883346516, -4.92403876506104, 0.0), prj(-0.43577871373829125, -4.9809734904587275, 0.0), prj(-9.184850993605148e-16, -5.0, 0.0), prj(0.43577871373828947, -4.9809734904587275, 0.0), prj(0.8682408883346499, -4.924038765061041, 0.0), prj(1.2940952255126015, -4.829629131445342, 0.0), prj(1.7101007166283453, -4.698463103929542, 0.0), prj(2.113091308703498, -4.531538935183249, 0.0), prj(2.5, -4.330127018922193, 0.0), prj(2.8678821817552302, -4.095760221444959, 0.0), prj(3.2139380484326963, -3.8302222155948904, 0.0), prj(3.535533905932737, -3.5355339059327386, 0.0), prj(3.8302222155948895, -3.213938048432698, 0.0), prj(4.095760221444958, -2.867882181755232, 0.0), prj(4.330127018922192, -2.500000000000002, 0.0), prj(4.53153893518325, -2.113091308703496, 0.0), prj(4.698463103929543, -1.7101007166283426, 0.0), prj(4.8296291314453415, -1.2940952255126035, 0.0), prj(4.92403876506104, -0.868240888334652, 0.0), prj(4.9809734904587275, -0.4357787137382916, 0.0), prj(5.0, -1.2246467991473533e-15, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(4 - pw2*-0.0 - pw2*-0.0, 8 - pw2*1.0 - pw2*-0.0, 6 - pw2*0.0 - pw2*1.0)
      let p2_2 = prj(4 + pw2*-0.0 - pw2*-0.0, 8 + pw2*1.0 - pw2*-0.0, 6 + pw2*0.0 - pw2*1.0)
      let p2_3 = prj(4 + pw2*-0.0 + pw2*-0.0, 8 + pw2*1.0 + pw2*-0.0, 6 + pw2*0.0 + pw2*1.0)
      let p2_4 = prj(4 - pw2*-0.0 + pw2*-0.0, 8 - pw2*1.0 + pw2*-0.0, 6 - pw2*0.0 + pw2*1.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(4.0, 10.0, 6.0), prj(4.0, 9.99238939618349, 6.174311485495316), prj(4.0, 9.969615506024416, 6.347296355333861), prj(4.0, 9.931851652578137, 6.5176380902050415), prj(4.0, 9.879385241571818, 6.684040286651338), prj(4.0, 9.8126155740733, 6.8452365234813985), prj(4.0, 9.732050807568877, 7.0), prj(4.0, 9.638304088577984, 7.147152872702092), prj(4.0, 9.532088886237956, 7.2855752193730785), prj(4.0, 9.414213562373096, 7.414213562373095), prj(4.0, 9.28557521937308, 7.532088886237956), prj(4.0, 9.147152872702092, 7.638304088577984), prj(4.0, 9.0, 7.732050807568877), prj(4.0, 8.845236523481399, 7.8126155740733), prj(4.0, 8.684040286651337, 7.879385241571817), prj(4.0, 8.517638090205041, 7.931851652578136), prj(4.0, 8.34729635533386, 7.969615506024416), prj(4.0, 8.174311485495316, 7.992389396183491), prj(4.0, 8.0, 8.0), prj(4.0, 7.825688514504684, 7.992389396183491), prj(4.0, 7.65270364466614, 7.969615506024416), prj(4.0, 7.4823619097949585, 7.931851652578136), prj(4.0, 7.315959713348662, 7.879385241571817), prj(4.0, 7.1547634765186015, 7.8126155740733), prj(4.0, 7.0, 7.732050807568878), prj(4.0, 6.852847127297908, 7.638304088577984), prj(4.0, 6.7144247806269215, 7.532088886237956), prj(4.0, 6.585786437626905, 7.414213562373095), prj(4.0, 6.467911113762044, 7.285575219373079), prj(4.0, 6.361695911422016, 7.147152872702092), prj(4.0, 6.267949192431122, 7.0), prj(4.0, 6.1873844259267, 6.8452365234813985), prj(4.0, 6.120614758428183, 6.684040286651338), prj(4.0, 6.068148347421864, 6.517638090205042), prj(4.0, 6.030384493975584, 6.34729635533386), prj(4.0, 6.007610603816509, 6.174311485495316), prj(4.0, 6.0, 6.0), prj(4.0, 6.007610603816509, 5.825688514504684), prj(4.0, 6.030384493975584, 5.652703644666139), prj(4.0, 6.068148347421864, 5.4823619097949585), prj(4.0, 6.120614758428183, 5.315959713348663), prj(4.0, 6.1873844259267, 5.1547634765186015), prj(4.0, 6.267949192431123, 5.0), prj(4.0, 6.361695911422016, 4.852847127297908), prj(4.0, 6.467911113762044, 4.7144247806269215), prj(4.0, 6.585786437626904, 4.585786437626905), prj(4.0, 6.714424780626921, 4.467911113762044), prj(4.0, 6.852847127297907, 4.361695911422017), prj(4.0, 6.999999999999999, 4.267949192431123), prj(4.0, 7.1547634765186015, 4.1873844259267), prj(4.0, 7.315959713348663, 4.120614758428183), prj(4.0, 7.4823619097949585, 4.068148347421864), prj(4.0, 7.652703644666139, 4.030384493975584), prj(4.0, 7.825688514504684, 4.007610603816509), prj(4.0, 8.0, 4.0), prj(4.0, 8.174311485495316, 4.007610603816509), prj(4.0, 8.34729635533386, 4.030384493975584), prj(4.0, 8.51763809020504, 4.068148347421863), prj(4.0, 8.684040286651339, 4.120614758428183), prj(4.0, 8.845236523481399, 4.1873844259267), prj(4.0, 9.0, 4.267949192431123), prj(4.0, 9.147152872702092, 4.361695911422016), prj(4.0, 9.28557521937308, 4.467911113762044), prj(4.0, 9.414213562373094, 4.585786437626904), prj(4.0, 9.532088886237956, 4.714424780626921), prj(4.0, 9.638304088577984, 4.852847127297907), prj(4.0, 9.732050807568877, 4.999999999999999), prj(4.0, 9.8126155740733, 5.1547634765186015), prj(4.0, 9.879385241571818, 5.315959713348663), prj(4.0, 9.931851652578137, 5.4823619097949585), prj(4.0, 9.969615506024416, 5.652703644666139), prj(4.0, 9.99238939618349, 5.825688514504684), prj(4.0, 10.0, 5.999999999999999))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(2.23606797749979, 4.47213595499958, 0)
    let N = prj(4, 7.017354582018472, 4.328769920642317)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(4.0, 7.017354582018472, 0.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 5$.
  - $(C_2)$ trên mặt phẳng $x=4$, tâm $J_2(4; 8; 6)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm (Kỹ thuật quy giản thi cử):* Đây là cấu hình lệch trục nâng cao. Để giải bài toán khả thi bằng tay trong phòng thi, ta dùng đánh giá khoảng cách chặn dưới quy về tâm đường tròn: $M N >= M J_2 - R_2$. Bài toán quy về tìm giá trị nhỏ nhất của khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(4; 8; 6)$.
]
*Bước 1:* Lấy điểm $M(x_M, y_M, 0) in (C_1) => x_M^2 + y_M^2 = 25$.
Thiết lập biểu thức khoảng cách bình phương từ $M$ đến tâm $J_2(4; 8; 6)$:
$ M J_2^2 = (x_M - 4)^2 + (y_M - 8)^2 + (0 - 6)^2 $
$ = x_M^2 + y_M^2 + 16 - 8x_M + 64 - 16y_M + 36 $
$ = 25 + 116 - 8(x_M + 2y_M) = 141 - 8(x_M + 2y_M). $

*Bước 2:* Để khoảng cách $M J_2$ nhỏ nhất thì biểu thức bậc nhất $P = x_M + 2y_M$ phải đạt giá trị lớn nhất.
Áp dụng bất đẳng thức Cauchy-Schwarz cho hai bộ số $(1; 2)$ và $(x_M; y_M)$:
$ P = 1 dot x_M + 2 dot y_M <= sqrt((1^2 + 2^2)(x_M^2 + y_M^2)) $
$ P <= sqrt(5 dot 25) = 5 sqrt(5) $
Dấu đẳng thức xảy ra khi và chỉ khi:
$ x_M/1 = y_M/2 > 0 => x_M = sqrt(5), quad y_M = 2 sqrt(5) $

*Bước 3:* Thế giá trị cực đại $P_("max") = 5 sqrt(5)$ vào biểu thức $M J_2^2$, ta được khoảng cách nhỏ nhất từ $M$ đến tâm $J_2$:
$ M J_(2, min) = sqrt(141 - 40 sqrt(5)) $

*Bước 4:* Suy ra khoảng cách cực tiểu giữa hai đường tròn theo phương pháp quy giản là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(141 - 40 sqrt(5)) - 2 $
(Khoảng cách này xấp xỉ $3.27$ dm).
  ]
)

#tln(
  [(Ví dụ 15: Cấu hình 3.3 - Vuông góc, lệch trục bất đối xứng) Trong hệ trục tọa độ $O x y z$, hai đĩa xoay của thiết bị tự động được lắp đặt trên hai mặt đứng vuông góc là $(P_1): x=2$ và $(P_2): y=3$. Đĩa thứ nhất là đường tròn $(C_1)$ trên mặt phẳng $x=2$ có tâm $J_1(2;0;0)$ và bán kính $R_1=3$. Đĩa thứ hai là đường tròn $(C_2)$ trên mặt phẳng $y=3$ có tâm $J_2(0;3;5)$ và bán kính $R_2=2$. Hãy tìm khoảng cách ngắn nhất giữa một điểm $M$ trên viền đĩa $(C_1)$ và một điểm $N$ trên viền đĩa $(C_2)$ bằng phương pháp quy giản về tâm?],
  [$sqrt(47 - 6 sqrt(34)) - 2$],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(2, 0, 0)
    let J2 = prj(0, 3, 5)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 6.0
    let p1_1 = prj(2 - pw1*-0.0 - pw1*-0.0, 0 - pw1*1.0 - pw1*-0.0, 0 - pw1*0.0 - pw1*1.0)
    let p1_2 = prj(2 + pw1*-0.0 - pw1*-0.0, 0 + pw1*1.0 - pw1*-0.0, 0 + pw1*0.0 - pw1*1.0)
    let p1_3 = prj(2 + pw1*-0.0 + pw1*-0.0, 0 + pw1*1.0 + pw1*-0.0, 0 + pw1*0.0 + pw1*1.0)
    let p1_4 = prj(2 - pw1*-0.0 + pw1*-0.0, 0 - pw1*1.0 + pw1*-0.0, 0 - pw1*0.0 + pw1*1.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(2.0, 3.0, 0.0), prj(2.0, 2.988584094275237, 0.2614672282429745), prj(2.0, 2.954423259036624, 0.520944533000791), prj(2.0, 2.897777478867205, 0.7764571353075622), prj(2.0, 2.8190778623577253, 1.0260604299770062), prj(2.0, 2.7189233611099497, 1.2678547852220983), prj(2.0, 2.598076211353316, 1.4999999999999998), prj(2.0, 2.4574561328669753, 1.7207293090531381), prj(2.0, 2.298133329356934, 1.9283628290596178), prj(2.0, 2.121320343559643, 2.1213203435596424), prj(2.0, 1.9283628290596182, 2.298133329356934), prj(2.0, 1.7207293090531386, 2.4574561328669753), prj(2.0, 1.5000000000000004, 2.598076211353316), prj(2.0, 1.2678547852220983, 2.7189233611099497), prj(2.0, 1.0260604299770064, 2.819077862357725), prj(2.0, 0.7764571353075622, 2.897777478867205), prj(2.0, 0.5209445330007912, 2.954423259036624), prj(2.0, 0.26146722824297436, 2.988584094275237), prj(2.0, 1.8369701987210297e-16, 3.0), prj(2.0, -0.2614672282429747, 2.988584094275237), prj(2.0, -0.5209445330007909, 2.954423259036624), prj(2.0, -0.7764571353075626, 2.897777478867205), prj(2.0, -1.0260604299770062, 2.8190778623577253), prj(2.0, -1.267854785222098, 2.71892336110995), prj(2.0, -1.4999999999999993, 2.5980762113533165), prj(2.0, -1.7207293090531386, 2.4574561328669753), prj(2.0, -1.9283628290596178, 2.298133329356934), prj(2.0, -2.1213203435596424, 2.121320343559643), prj(2.0, -2.2981333293569337, 1.9283628290596184), prj(2.0, -2.4574561328669757, 1.7207293090531377), prj(2.0, -2.598076211353316, 1.4999999999999998), prj(2.0, -2.7189233611099497, 1.2678547852220985), prj(2.0, -2.819077862357725, 1.0260604299770066), prj(2.0, -2.8977774788672046, 0.7764571353075631), prj(2.0, -2.954423259036624, 0.5209445330007907), prj(2.0, -2.988584094275237, 0.2614672282429746), prj(2.0, -3.0, 3.6739403974420594e-16), prj(2.0, -2.988584094275237, -0.26146722824297386), prj(2.0, -2.954423259036624, -0.5209445330007914), prj(2.0, -2.897777478867205, -0.7764571353075624), prj(2.0, -2.8190778623577253, -1.026060429977006), prj(2.0, -2.71892336110995, -1.2678547852220978), prj(2.0, -2.598076211353316, -1.5000000000000004), prj(2.0, -2.4574561328669753, -1.7207293090531386), prj(2.0, -2.298133329356934, -1.9283628290596178), prj(2.0, -2.121320343559643, -2.121320343559642), prj(2.0, -1.9283628290596186, -2.2981333293569337), prj(2.0, -1.720729309053139, -2.457456132866975), prj(2.0, -1.5000000000000013, -2.598076211353315), prj(2.0, -1.2678547852220974, -2.7189233611099506), prj(2.0, -1.0260604299770055, -2.8190778623577253), prj(2.0, -0.7764571353075619, -2.897777478867205), prj(2.0, -0.520944533000791, -2.954423259036624), prj(2.0, -0.26146722824297475, -2.988584094275237), prj(2.0, -5.51091059616309e-16, -3.0), prj(2.0, 0.26146722824297364, -2.988584094275237), prj(2.0, 0.5209445330007899, -2.9544232590366244), prj(2.0, 0.7764571353075609, -2.897777478867205), prj(2.0, 1.026060429977007, -2.819077862357725), prj(2.0, 1.2678547852220987, -2.7189233611099493), prj(2.0, 1.5, -2.598076211353316), prj(2.0, 1.7207293090531381, -2.4574561328669753), prj(2.0, 1.9283628290596178, -2.2981333293569346), prj(2.0, 2.121320343559642, -2.121320343559643), prj(2.0, 2.2981333293569337, -1.9283628290596186), prj(2.0, 2.457456132866975, -1.720729309053139), prj(2.0, 2.598076211353315, -1.5000000000000013), prj(2.0, 2.71892336110995, -1.2678547852220974), prj(2.0, 2.8190778623577253, -1.0260604299770058), prj(2.0, 2.897777478867205, -0.776457135307562), prj(2.0, 2.954423259036624, -0.5209445330007911), prj(2.0, 2.988584094275237, -0.26146722824297497), prj(2.0, 3.0, -7.347880794884119e-16))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(0 - pw2*-1.0 - pw2*-0.0, 3 - pw2*0.0 - pw2*-0.0, 5 - pw2*0.0 - pw2*1.0)
      let p2_2 = prj(0 + pw2*-1.0 - pw2*-0.0, 3 + pw2*0.0 - pw2*-0.0, 5 + pw2*0.0 - pw2*1.0)
      let p2_3 = prj(0 + pw2*-1.0 + pw2*-0.0, 3 + pw2*0.0 + pw2*-0.0, 5 + pw2*0.0 + pw2*1.0)
      let p2_4 = prj(0 - pw2*-1.0 + pw2*-0.0, 3 - pw2*0.0 + pw2*-0.0, 5 - pw2*0.0 + pw2*1.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(-2.0, 3.0, 5.0), prj(-1.992389396183491, 3.0, 5.174311485495316), prj(-1.969615506024416, 3.0, 5.347296355333861), prj(-1.9318516525781366, 3.0, 5.5176380902050415), prj(-1.8793852415718169, 3.0, 5.684040286651338), prj(-1.8126155740732999, 3.0, 5.8452365234813985), prj(-1.7320508075688774, 3.0, 6.0), prj(-1.6383040885779836, 3.0, 6.147152872702092), prj(-1.532088886237956, 3.0, 6.2855752193730785), prj(-1.4142135623730951, 3.0, 6.414213562373095), prj(-1.2855752193730787, 3.0, 6.532088886237956), prj(-1.1471528727020923, 3.0, 6.638304088577984), prj(-1.0000000000000002, 3.0, 6.732050807568877), prj(-0.8452365234813989, 3.0, 6.8126155740733), prj(-0.6840402866513376, 3.0, 6.879385241571817), prj(-0.5176380902050415, 3.0, 6.931851652578136), prj(-0.34729635533386083, 3.0, 6.969615506024416), prj(-0.17431148549531625, 3.0, 6.992389396183491), prj(-1.2246467991473532e-16, 3.0, 7.0), prj(0.17431148549531647, 3.0, 6.992389396183491), prj(0.3472963553338606, 3.0, 6.969615506024416), prj(0.5176380902050417, 3.0, 6.931851652578136), prj(0.6840402866513374, 3.0, 6.879385241571817), prj(0.8452365234813987, 3.0, 6.8126155740733), prj(0.9999999999999996, 3.0, 6.732050807568878), prj(1.1471528727020923, 3.0, 6.638304088577984), prj(1.2855752193730785, 3.0, 6.532088886237956), prj(1.414213562373095, 3.0, 6.414213562373095), prj(1.5320888862379558, 3.0, 6.285575219373079), prj(1.6383040885779838, 3.0, 6.147152872702092), prj(1.7320508075688774, 3.0, 6.0), prj(1.8126155740732999, 3.0, 5.8452365234813985), prj(1.8793852415718166, 3.0, 5.684040286651338), prj(1.9318516525781364, 3.0, 5.517638090205042), prj(1.969615506024416, 3.0, 5.34729635533386), prj(1.992389396183491, 3.0, 5.174311485495316), prj(2.0, 3.0, 5.0), prj(1.992389396183491, 3.0, 4.825688514504684), prj(1.969615506024416, 3.0, 4.652703644666139), prj(1.9318516525781366, 3.0, 4.4823619097949585), prj(1.8793852415718169, 3.0, 4.315959713348663), prj(1.8126155740733, 3.0, 4.1547634765186015), prj(1.7320508075688772, 3.0, 4.0), prj(1.6383040885779836, 3.0, 3.852847127297908), prj(1.532088886237956, 3.0, 3.7144247806269215), prj(1.4142135623730954, 3.0, 3.585786437626905), prj(1.2855752193730792, 3.0, 3.467911113762044), prj(1.1471528727020928, 3.0, 3.361695911422017), prj(1.0000000000000009, 3.0, 3.2679491924311233), prj(0.8452365234813982, 3.0, 3.1873844259267), prj(0.684040286651337, 3.0, 3.120614758428183), prj(0.5176380902050413, 3.0, 3.0681483474218636), prj(0.34729635533386066, 3.0, 3.0303844939755837), prj(0.1743114854953165, 3.0, 3.007610603816509), prj(3.6739403974420594e-16, 3.0, 3.0), prj(-0.17431148549531578, 3.0, 3.007610603816509), prj(-0.34729635533385994, 3.0, 3.0303844939755837), prj(-0.5176380902050406, 3.0, 3.068148347421863), prj(-0.6840402866513381, 3.0, 3.120614758428183), prj(-0.8452365234813992, 3.0, 3.1873844259267003), prj(-1.0, 3.0, 3.267949192431123), prj(-1.147152872702092, 3.0, 3.361695911422016), prj(-1.2855752193730785, 3.0, 3.4679111137620438), prj(-1.4142135623730947, 3.0, 3.5857864376269046), prj(-1.5320888862379558, 3.0, 3.7144247806269206), prj(-1.6383040885779832, 3.0, 3.852847127297907), prj(-1.7320508075688767, 3.0, 3.999999999999999), prj(-1.8126155740733, 3.0, 4.1547634765186015), prj(-1.8793852415718169, 3.0, 4.315959713348663), prj(-1.9318516525781366, 3.0, 4.4823619097949585), prj(-1.969615506024416, 3.0, 4.652703644666139), prj(-1.992389396183491, 3.0, 4.825688514504684), prj(-2.0, 3.0, 4.999999999999999))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(2, 1.5434872662825794, 2.5724787771376323)
    let N = prj(0, 3, 3)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(2.0, 3.0, 3.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - Đĩa $(C_1)$ nằm trên mặt phẳng $x=2$, tâm $J_1(2; 0; 0)$, bán kính $R_1 = 3$.
  - Đĩa $(C_2)$ nằm trên mặt phẳng $y=3$, tâm $J_2(0; 3; 5)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm:* Đây là bài toán cực trị khoảng cách giữa hai đường tròn ở vị trí chéo nhau trong không gian, nằm trên hai mặt đứng vuông góc nhau. Ta áp dụng phương pháp quy giản hình học về tâm $J_2$ để tính toán nhanh gọn và chính xác.
]
*Bước 1 (Quy giản hình học về tâm):*
Theo bất đẳng thức tam giác trong không gian, ta luôn có đánh giá khoảng cách chặn dưới:
$ M N >= M J_2 - R_2 $
Do đó, khoảng cách ngắn nhất nối hai đường tròn đạt được khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(0; 3; 5)$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa lượng giác):*
Do điểm $M$ nằm trên đường tròn $(C_1)$ trong mặt phẳng đứng $x=2$, có tâm $J_1(2;0;0)$ và bán kính $R_1 = 3$. Ta tham số hóa tọa độ của $M$ theo góc $t in [0; 2 pi)$:
$ M(2, 3 cos t, 3 sin t) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(0;3;5)$:
$ M J_2^2 = (2 - 0)^2 + (3 cos t - 3)^2 + (3 sin t - 5)^2 $
$ = 4 + (9 cos^2 t - 18 cos t + 9) + (9 sin^2 t - 30 sin t + 25) $
$ = 4 + 9(cos^2 t + sin^2 t) - 18 cos t - 30 sin t + 34 $
$ = 47 - 6(3 cos t + 5 sin t). $

*Bước 4 (Áp dụng bất đẳng thức để tìm cực tiểu):*
Để $M J_2^2$ nhỏ nhất thì biểu thức lượng giác $A = 3 cos t + 5 sin t$ phải đạt giá trị lớn nhất.
Theo bất đẳng thức Cauchy-Schwarz:
$ A = 3 cos t + 5 sin t <= sqrt((3^2 + 5^2)(cos^2 t + sin^2 t)) = sqrt(34) $
Giá trị lớn nhất của $A$ là $sqrt(34)$. Thế vào ta được:
$ M J_(2, min) = sqrt(47 - 6 sqrt(34)) $

*Bước 5 (Kết luận):*
Khoảng cách ngắn nhất giữa hai đĩa xoay là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(47 - 6 sqrt(34)) - 2 $
(Khoảng cách này xấp xỉ $1.47$ dm).
  ]
)

#tln(
  [(Cấu hình 3.4 - Vuông góc, lệch trục tổng quát) Trong hệ tọa độ $O x y z$, đường tròn $(C_1)$ nằm trên mặt phẳng đứng $(P_1): y=1$, có tâm $J_1(0;1;2)$ và bán kính $R_1=4$. Đường tròn $(C_2)$ nằm trên mặt phẳng ngang $(P_2): z=5$, có tâm $J_2(3;4;5)$ và bán kính $R_2=3$. Tìm khoảng cách nhỏ nhất giữa một điểm $M$ trên đường tròn $(C_1)$ và một điểm $N$ trên đường tròn $(C_2)$ bằng phương pháp quy giản về tâm?],
  [$sqrt(43 - 24 sqrt(2)) - 3$],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 1, 2)
    let J2 = prj(3, 4, 5)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 6.4
    let p1_1 = prj(0 - pw1*-1.0 - pw1*-0.0, 1 - pw1*0.0 - pw1*-0.0, 2 - pw1*0.0 - pw1*1.0)
    let p1_2 = prj(0 + pw1*-1.0 - pw1*-0.0, 1 + pw1*0.0 - pw1*-0.0, 2 + pw1*0.0 - pw1*1.0)
    let p1_3 = prj(0 + pw1*-1.0 + pw1*-0.0, 1 + pw1*0.0 + pw1*-0.0, 2 + pw1*0.0 + pw1*1.0)
    let p1_4 = prj(0 - pw1*-1.0 + pw1*-0.0, 1 - pw1*0.0 + pw1*-0.0, 2 - pw1*0.0 + pw1*1.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(-4.0, 1.0, 2.0), prj(-3.984778792366982, 1.0, 2.3486229709906326), prj(-3.939231012048832, 1.0, 2.694592710667721), prj(-3.8637033051562732, 1.0, 3.035276180410083), prj(-3.7587704831436337, 1.0, 3.3680805733026746), prj(-3.6252311481465997, 1.0, 3.690473046962798), prj(-3.464101615137755, 1.0, 4.0), prj(-3.276608177155967, 1.0, 4.294305745404184), prj(-3.064177772475912, 1.0, 4.571150438746157), prj(-2.8284271247461903, 1.0, 4.82842712474619), prj(-2.5711504387461575, 1.0, 5.064177772475912), prj(-2.2943057454041846, 1.0, 5.276608177155968), prj(-2.0000000000000004, 1.0, 5.464101615137754), prj(-1.6904730469627978, 1.0, 5.6252311481466), prj(-1.3680805733026753, 1.0, 5.758770483143634), prj(-1.035276180410083, 1.0, 5.863703305156273), prj(-0.6945927106677217, 1.0, 5.9392310120488325), prj(-0.3486229709906325, 1.0, 5.984778792366982), prj(-2.4492935982947064e-16, 1.0, 6.0), prj(0.34862297099063294, 1.0, 5.984778792366982), prj(0.6945927106677212, 1.0, 5.9392310120488325), prj(1.0352761804100834, 1.0, 5.863703305156273), prj(1.3680805733026749, 1.0, 5.758770483143634), prj(1.6904730469627973, 1.0, 5.6252311481466), prj(1.9999999999999991, 1.0, 5.464101615137755), prj(2.2943057454041846, 1.0, 5.276608177155968), prj(2.571150438746157, 1.0, 5.064177772475912), prj(2.82842712474619, 1.0, 4.82842712474619), prj(3.0641777724759116, 1.0, 4.571150438746158), prj(3.2766081771559676, 1.0, 4.294305745404184), prj(3.464101615137755, 1.0, 4.0), prj(3.6252311481465997, 1.0, 3.690473046962798), prj(3.7587704831436333, 1.0, 3.3680805733026755), prj(3.863703305156273, 1.0, 3.035276180410084), prj(3.939231012048832, 1.0, 2.694592710667721), prj(3.984778792366982, 1.0, 2.3486229709906326), prj(4.0, 1.0, 2.0000000000000004), prj(3.984778792366982, 1.0, 1.6513770290093683), prj(3.939231012048832, 1.0, 1.3054072893322781), prj(3.8637033051562732, 1.0, 0.9647238195899168), prj(3.7587704831436337, 1.0, 0.6319194266973254), prj(3.6252311481466, 1.0, 0.3095269530372029), prj(3.4641016151377544, 1.0, -4.440892098500626e-16), prj(3.276608177155967, 1.0, -0.29430574540418464), prj(3.064177772475912, 1.0, -0.571150438746157), prj(2.8284271247461907, 1.0, -0.8284271247461894), prj(2.5711504387461583, 1.0, -1.0641777724759116), prj(2.2943057454041855, 1.0, -1.2766081771559663), prj(2.0000000000000018, 1.0, -1.4641016151377535), prj(1.6904730469627964, 1.0, -1.6252311481466006), prj(1.368080573302674, 1.0, -1.7587704831436337), prj(1.0352761804100825, 1.0, -1.8637033051562732), prj(0.6945927106677213, 1.0, -1.939231012048832), prj(0.348622970990633, 1.0, -1.9847787923669822), prj(7.347880794884119e-16, 1.0, -2.0), prj(-0.34862297099063155, 1.0, -1.9847787923669822), prj(-0.6945927106677199, 1.0, -1.9392310120488325), prj(-1.0352761804100812, 1.0, -1.8637033051562737), prj(-1.3680805733026762, 1.0, -1.7587704831436333), prj(-1.6904730469627984, 1.0, -1.6252311481465993), prj(-2.0, 1.0, -1.4641016151377544), prj(-2.294305745404184, 1.0, -1.2766081771559672), prj(-2.571150438746157, 1.0, -1.0641777724759125), prj(-2.8284271247461894, 1.0, -0.8284271247461907), prj(-3.0641777724759116, 1.0, -0.5711504387461583), prj(-3.2766081771559663, 1.0, -0.2943057454041855), prj(-3.4641016151377535, 1.0, -1.7763568394002505e-15), prj(-3.6252311481466, 1.0, 0.30952695303720335), prj(-3.7587704831436337, 1.0, 0.6319194266973258), prj(-3.8637033051562732, 1.0, 0.9647238195899173), prj(-3.939231012048832, 1.0, 1.3054072893322783), prj(-3.984778792366982, 1.0, 1.6513770290093668), prj(-4.0, 1.0, 1.9999999999999991))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(3 - pw2*1.0 - pw2*0.0, 4 - pw2*0.0 - pw2*1.0, 5 - pw2*0.0 - pw2*0.0)
      let p2_2 = prj(3 + pw2*1.0 - pw2*0.0, 4 + pw2*0.0 - pw2*1.0, 5 + pw2*0.0 - pw2*0.0)
      let p2_3 = prj(3 + pw2*1.0 + pw2*0.0, 4 + pw2*0.0 + pw2*1.0, 5 + pw2*0.0 + pw2*0.0)
      let p2_4 = prj(3 - pw2*1.0 + pw2*0.0, 4 - pw2*0.0 + pw2*1.0, 5 - pw2*0.0 + pw2*0.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(6.0, 4.0, 5.0), prj(5.988584094275237, 4.261467228242974, 5.0), prj(5.9544232590366235, 4.520944533000791, 5.0), prj(5.897777478867205, 4.776457135307562, 5.0), prj(5.819077862357725, 5.026060429977006, 5.0), prj(5.718923361109949, 5.267854785222099, 5.0), prj(5.598076211353316, 5.5, 5.0), prj(5.457456132866975, 5.720729309053138, 5.0), prj(5.298133329356935, 5.928362829059617, 5.0), prj(5.121320343559643, 6.121320343559642, 5.0), prj(4.928362829059618, 6.298133329356935, 5.0), prj(4.720729309053139, 6.457456132866975, 5.0), prj(4.5, 6.598076211353316, 5.0), prj(4.267854785222099, 6.718923361109949, 5.0), prj(4.026060429977006, 6.819077862357725, 5.0), prj(3.776457135307562, 6.897777478867205, 5.0), prj(3.520944533000791, 6.9544232590366235, 5.0), prj(3.2614672282429744, 6.988584094275237, 5.0), prj(3.0, 7.0, 5.0), prj(2.738532771757025, 6.988584094275237, 5.0), prj(2.479055466999209, 6.9544232590366235, 5.0), prj(2.2235428646924373, 6.897777478867205, 5.0), prj(1.9739395700229938, 6.819077862357725, 5.0), prj(1.732145214777902, 6.71892336110995, 5.0), prj(1.5000000000000007, 6.598076211353316, 5.0), prj(1.2792706909468614, 6.457456132866975, 5.0), prj(1.0716371709403822, 6.298133329356935, 5.0), prj(0.8786796564403576, 6.121320343559643, 5.0), prj(0.7018666706430663, 5.928362829059618, 5.0), prj(0.5425438671330243, 5.720729309053137, 5.0), prj(0.401923788646684, 5.5, 5.0), prj(0.2810766388900503, 5.267854785222099, 5.0), prj(0.18092213764227516, 5.026060429977006, 5.0), prj(0.1022225211327954, 4.776457135307563, 5.0), prj(0.04557674096337605, 4.52094453300079, 5.0), prj(0.011415905724763142, 4.261467228242974, 5.0), prj(0.0, 4.0, 5.0), prj(0.011415905724763142, 3.738532771757026, 5.0), prj(0.04557674096337605, 3.479055466999209, 5.0), prj(0.10222252113279495, 3.223542864692438, 5.0), prj(0.18092213764227472, 2.973939570022994, 5.0), prj(0.28107663889004986, 2.732145214777902, 5.0), prj(0.401923788646684, 2.4999999999999996, 5.0), prj(0.5425438671330247, 2.2792706909468614, 5.0), prj(0.7018666706430658, 2.0716371709403822, 5.0), prj(0.8786796564403572, 1.878679656440358, 5.0), prj(1.0716371709403814, 1.7018666706430663, 5.0), prj(1.279270690946861, 1.5425438671330252, 5.0), prj(1.4999999999999987, 1.4019237886466849, 5.0), prj(1.7321452147779026, 1.2810766388900494, 5.0), prj(1.9739395700229945, 1.1809221376422747, 5.0), prj(2.2235428646924382, 1.102222521132795, 5.0), prj(2.479055466999209, 1.045576740963376, 5.0), prj(2.738532771757025, 1.0114159057247631, 5.0), prj(2.9999999999999996, 1.0, 5.0), prj(3.2614672282429735, 1.0114159057247631, 5.0), prj(3.52094453300079, 1.0455767409633756, 5.0), prj(3.776457135307561, 1.102222521132795, 5.0), prj(4.026060429977007, 1.1809221376422752, 5.0), prj(4.267854785222099, 1.2810766388900507, 5.0), prj(4.5, 1.401923788646684, 5.0), prj(4.720729309053138, 1.5425438671330247, 5.0), prj(4.928362829059617, 1.7018666706430654, 5.0), prj(5.121320343559642, 1.8786796564403572, 5.0), prj(5.298133329356934, 2.0716371709403814, 5.0), prj(5.457456132866975, 2.279270690946861, 5.0), prj(5.598076211353315, 2.4999999999999987, 5.0), prj(5.71892336110995, 2.7321452147779026, 5.0), prj(5.819077862357725, 2.9739395700229942, 5.0), prj(5.897777478867205, 3.223542864692438, 5.0), prj(5.9544232590366235, 3.479055466999209, 5.0), prj(5.988584094275237, 3.738532771757025, 5.0), prj(6.0, 3.999999999999999, 5.0))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(2.8284271247461903, 1, 4.82842712474619)
    let N = prj(2.8289855679387124, 1.0097645363527783, 5)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(2.8289855679387124, 1.0, 5.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ nằm trên mặt phẳng $y=1$, tâm $J_1(0; 1; 2)$, bán kính $R_1 = 4$.
  - $(C_2)$ nằm trên mặt phẳng $z=5$, tâm $J_2(3; 4; 5)$, bán kính $R_2 = 3$.
]
#note[
  *Lưu ý sư phạm:* Đây là cấu hình hai đường tròn nằm trên hai mặt phẳng vuông góc, lệch trục (hai đường tròn ở vị trí chéo nhau trong không gian) ở dạng tổng quát. Ta áp dụng phương pháp quy giản khoảng cách về tâm $J_2$ của đường tròn $(C_2)$ để giải quyết nhanh chóng bài toán.
]
*Bước 1 (Quy giản hình học về tâm):*
Theo đánh giá khoảng cách chặn dưới hình học:
$ M N >= M J_2 - R_2 $
Đoạn thẳng $M N$ đạt độ dài nhỏ nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(3; 4; 5)$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa điểm $M$):*
Do $M$ thuộc đường tròn $(C_1)$ nằm trên mặt phẳng $y=1$, có tâm $J_1(0;1;2)$ và bán kính $R_1 = 4$. Tọa độ của $M$ được tham số hóa theo góc lượng giác $t in [0; 2 pi)$:
$ M(4 cos t, 1, 2 + 4 sin t) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(3; 4; 5)$:
$ M J_2^2 = (4 cos t - 3)^2 + (1 - 4)^2 + (2 + 4 sin t - 5)^2 $
$ = (4 cos t - 3)^2 + (-3)^2 + (4 sin t - 3)^2 $
$ = 16 cos^2 t - 24 cos t + 9 + 9 + 16 sin^2 t - 24 sin t + 9 $
$ = 16(cos^2 t + sin^2 t) + 27 - 24(cos t + sin t) $
$ = 43 - 24(cos t + sin t). $

*Bước 4 (Tìm cực tiểu của hàm số):*
Để khoảng cách $M J_2$ nhỏ nhất thì biểu thức $P = cos t + sin t$ phải đạt giá trị lớn nhất.
Áp dụng bất đẳng thức Cauchy-Schwarz hoặc công thức cộng lượng giác:
$ P = cos t + sin t <= sqrt((1^2 + 1^2)(cos^2 t + sin^2 t)) = sqrt(2) $
Giá trị lớn nhất của $P$ là $sqrt(2)$, đạt được khi $t = pi/4$.
Khi đó:
$ M J_(2, min) = sqrt(43 - 24 sqrt(2)) $

*Bước 5 (Kết luận):*
Khoảng cách nhỏ nhất giữa hai đường tròn là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(43 - 24 sqrt(2)) - 3 $
(Khoảng cách này xấp xỉ $3.01 - 3 = 0.01$ dm, tức là hai đường tròn gần như tiếp cận sát nhau trong không gian).

*Cách 2 (Giải nhanh bằng công thức khoảng cách vạn năng & Casio):*
Áp dụng công thức khoảng cách vạn năng từ điểm $M in (C_1)$ đến đường tròn $(C_2)$ nằm trên mặt phẳng $(P_2): z=5$, tâm $J_2(3; 4; 5)$, bán kính $R_2 = 3$:
$ d(M, (C_2))^2 = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
- Với $M(4 cos t, 1, 2 + 4 sin t) in (C_1)$, ta có:
  $ M J_2^2 = (4 cos t - 3)^2 + (1 - 4)^2 + (2 + 4 sin t - 5)^2 = 43 - 24(cos t + sin t). $
  $ d(M, P_2)^2 = d(M, z=5)^2 = (4 sin t - 3)^2. $
- Thay vào công thức vạn năng:
  $ F(t) = 43 - 24(cos t + sin t) + 9 - 6sqrt(43 - 24(cos t + sin t) - (4 sin t - 3)^2) $
  $ = 52 - 24(cos t + sin t) - 6sqrt(16 cos^2 t - 24 cos t + 18) $
  $ = 52 - 24(cos t + sin t) - 6sqrt((4 cos t - 3)^2 + 9) $
- Sử dụng máy tính Casio quét bảng giá trị (Table) của $F(t)$ trên $[0; 2 pi]$, ta tìm được giá trị nhỏ nhất của $F(t)$ tại $t = pi/4$ (khi đó cos(pi/4) = sin(pi/4) = 1/sqrt(2)):
  $ F(pi/4) = 52 - 24 sqrt(2) - 6sqrt((4/sqrt(2) - 3)^2 + 9) = (sqrt(43 - 24 sqrt(2)) - 3)^2 $
  $ => M N_(min) = sqrt(F(pi/4)) = sqrt(43 - 24 sqrt(2)) - 3. $
  ]
)

#tln(
  [(Cấu hình 4.1 - Hai mặt phẳng nghiêng góc $60°$) Hai vành khuyên kim loại tròn được lắp đặt trên hai mặt phẳng tạo với nhau một góc $60°$. Vành thứ nhất $(C_1)$ nằm trên mặt phẳng $(O x y): z=0$, có tâm $J_1(0;0;0)$, bán kính $R_1=4$. Vành thứ hai $(C_2)$ nằm trên mặt phẳng nghiêng $(P): z = sqrt(3)x$, có tâm $J_2(3;0;3sqrt(3))$, bán kính $R_2=2$. Tìm khoảng cách ngắn nhất giữa hai vành khuyên?],
  [$2 sqrt(7) - 2$],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(3, 0, 5.196152422706632)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 6.4
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(4.0, 0.0, 0.0), prj(3.984778792366982, 0.34862297099063266, 0.0), prj(3.939231012048832, 0.6945927106677213, 0.0), prj(3.8637033051562732, 1.035276180410083, 0.0), prj(3.7587704831436337, 1.3680805733026749, 0.0), prj(3.6252311481465997, 1.6904730469627978, 0.0), prj(3.464101615137755, 1.9999999999999998, 0.0), prj(3.276608177155967, 2.294305745404184, 0.0), prj(3.064177772475912, 2.571150438746157, 0.0), prj(2.8284271247461903, 2.82842712474619, 0.0), prj(2.5711504387461575, 3.064177772475912, 0.0), prj(2.2943057454041846, 3.276608177155967, 0.0), prj(2.0000000000000004, 3.4641016151377544, 0.0), prj(1.6904730469627978, 3.6252311481465997, 0.0), prj(1.3680805733026753, 3.7587704831436333, 0.0), prj(1.035276180410083, 3.8637033051562732, 0.0), prj(0.6945927106677217, 3.939231012048832, 0.0), prj(0.3486229709906325, 3.984778792366982, 0.0), prj(2.4492935982947064e-16, 4.0, 0.0), prj(-0.34862297099063294, 3.984778792366982, 0.0), prj(-0.6945927106677212, 3.939231012048832, 0.0), prj(-1.0352761804100834, 3.8637033051562732, 0.0), prj(-1.3680805733026749, 3.7587704831436337, 0.0), prj(-1.6904730469627973, 3.6252311481466, 0.0), prj(-1.9999999999999991, 3.4641016151377553, 0.0), prj(-2.2943057454041846, 3.276608177155967, 0.0), prj(-2.571150438746157, 3.064177772475912, 0.0), prj(-2.82842712474619, 2.8284271247461903, 0.0), prj(-3.0641777724759116, 2.571150438746158, 0.0), prj(-3.2766081771559676, 2.2943057454041837, 0.0), prj(-3.464101615137755, 1.9999999999999998, 0.0), prj(-3.6252311481465997, 1.690473046962798, 0.0), prj(-3.7587704831436333, 1.3680805733026755, 0.0), prj(-3.863703305156273, 1.035276180410084, 0.0), prj(-3.939231012048832, 0.694592710667721, 0.0), prj(-3.984778792366982, 0.3486229709906328, 0.0), prj(-4.0, 4.898587196589413e-16, 0.0), prj(-3.984778792366982, -0.3486229709906318, 0.0), prj(-3.939231012048832, -0.6945927106677219, 0.0), prj(-3.8637033051562732, -1.0352761804100832, 0.0), prj(-3.7587704831436337, -1.3680805733026746, 0.0), prj(-3.6252311481466, -1.690473046962797, 0.0), prj(-3.4641016151377544, -2.0000000000000004, 0.0), prj(-3.276608177155967, -2.2943057454041846, 0.0), prj(-3.064177772475912, -2.571150438746157, 0.0), prj(-2.8284271247461907, -2.8284271247461894, 0.0), prj(-2.5711504387461583, -3.0641777724759116, 0.0), prj(-2.2943057454041855, -3.2766081771559663, 0.0), prj(-2.0000000000000018, -3.4641016151377535, 0.0), prj(-1.6904730469627964, -3.6252311481466006, 0.0), prj(-1.368080573302674, -3.7587704831436337, 0.0), prj(-1.0352761804100825, -3.8637033051562732, 0.0), prj(-0.6945927106677213, -3.939231012048832, 0.0), prj(-0.348622970990633, -3.984778792366982, 0.0), prj(-7.347880794884119e-16, -4.0, 0.0), prj(0.34862297099063155, -3.984778792366982, 0.0), prj(0.6945927106677199, -3.9392310120488325, 0.0), prj(1.0352761804100812, -3.8637033051562737, 0.0), prj(1.3680805733026762, -3.7587704831436333, 0.0), prj(1.6904730469627984, -3.6252311481465993, 0.0), prj(2.0, -3.4641016151377544, 0.0), prj(2.294305745404184, -3.276608177155967, 0.0), prj(2.571150438746157, -3.0641777724759125, 0.0), prj(2.8284271247461894, -2.8284271247461907, 0.0), prj(3.0641777724759116, -2.5711504387461583, 0.0), prj(3.2766081771559663, -2.2943057454041855, 0.0), prj(3.4641016151377535, -2.0000000000000018, 0.0), prj(3.6252311481466, -1.6904730469627967, 0.0), prj(3.7587704831436337, -1.3680805733026742, 0.0), prj(3.8637033051562732, -1.0352761804100827, 0.0), prj(3.939231012048832, -0.6945927106677215, 0.0), prj(3.984778792366982, -0.3486229709906333, 0.0), prj(4.0, -9.797174393178826e-16, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(3 - pw2*-0.0 - pw2*0.5000000000000002, 0 - pw2*1.0 - pw2*0.0, 5.196152422706632 - pw2*0.0 - pw2*0.8660254037844386)
      let p2_2 = prj(3 + pw2*-0.0 - pw2*0.5000000000000002, 0 + pw2*1.0 - pw2*0.0, 5.196152422706632 + pw2*0.0 - pw2*0.8660254037844386)
      let p2_3 = prj(3 + pw2*-0.0 + pw2*0.5000000000000002, 0 + pw2*1.0 + pw2*0.0, 5.196152422706632 + pw2*0.0 + pw2*0.8660254037844386)
      let p2_4 = prj(3 - pw2*-0.0 + pw2*0.5000000000000002, 0 - pw2*1.0 + pw2*0.0, 5.196152422706632 - pw2*0.0 + pw2*0.8660254037844386)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(3.0, 2.0, 5.196152422706632), prj(3.087155742747658, 1.992389396183491, 5.347110597316979), prj(3.1736481776669305, 1.969615506024416, 5.496919889067502), prj(3.2588190451025207, 1.9318516525781366, 5.644440158790658), prj(3.342020143325669, 1.8793852415718169, 5.78854868815868), prj(3.4226182617406997, 1.8126155740732999, 5.928148724247966), prj(3.5, 1.7320508075688774, 6.06217782649107), prj(3.573576436351046, 1.6383040885779836, 6.18961595249094), prj(3.6427876096865397, 1.532088886237956, 6.309493221159471), prj(3.707106781186548, 1.4142135623730951, 6.420897294098221), prj(3.7660444431189783, 1.2855752193730787, 6.522980319044509), prj(3.819152044288992, 1.1471528727020923, 6.614965382539077), prj(3.866025403784439, 1.0000000000000002, 6.696152422706632), prj(3.9063077870366505, 0.8452365234813989, 6.765923557149423), prj(3.939692620785909, 0.6840402866513376, 6.823747785405379), prj(3.9659258262890686, 0.5176380902050415, 6.869185030182248), prj(3.9848077530122086, 0.34729635533386083, 6.901889486611518), prj(3.996194698091746, 0.17431148549531625, 6.921612254032274), prj(4.0, 1.2246467991473532e-16, 6.928203230275509), prj(3.996194698091746, -0.17431148549531647, 6.921612254032274), prj(3.9848077530122086, -0.3472963553338606, 6.901889486611518), prj(3.9659258262890686, -0.5176380902050417, 6.869185030182248), prj(3.939692620785909, -0.6840402866513374, 6.823747785405379), prj(3.9063077870366505, -0.8452365234813987, 6.765923557149423), prj(3.8660254037844393, -0.9999999999999996, 6.696152422706632), prj(3.819152044288992, -1.1471528727020923, 6.614965382539077), prj(3.7660444431189783, -1.2855752193730785, 6.522980319044509), prj(3.707106781186548, -1.414213562373095, 6.420897294098221), prj(3.6427876096865397, -1.5320888862379558, 6.309493221159471), prj(3.573576436351046, -1.6383040885779838, 6.18961595249094), prj(3.5, -1.7320508075688774, 6.06217782649107), prj(3.4226182617406997, -1.8126155740732999, 5.928148724247966), prj(3.342020143325669, -1.8793852415718166, 5.78854868815868), prj(3.258819045102521, -1.9318516525781364, 5.644440158790659), prj(3.1736481776669305, -1.969615506024416, 5.496919889067502), prj(3.087155742747658, -1.992389396183491, 5.347110597316979), prj(3.0, -2.0, 5.196152422706632), prj(2.912844257252342, -1.992389396183491, 5.045194248096286), prj(2.8263518223330695, -1.969615506024416, 4.895384956345762), prj(2.7411809548974793, -1.9318516525781366, 4.747864686622605), prj(2.657979856674331, -1.8793852415718169, 4.603756157254584), prj(2.5773817382593007, -1.8126155740733, 4.464156121165299), prj(2.4999999999999996, -1.7320508075688772, 4.330127018922193), prj(2.4264235636489535, -1.6383040885779836, 4.202688892922324), prj(2.3572123903134603, -1.532088886237956, 4.082811624253793), prj(2.292893218813452, -1.4142135623730954, 3.9714075513150435), prj(2.2339555568810217, -1.2855752193730792, 3.8693245263687555), prj(2.180847955711008, -1.1471528727020928, 3.7773394628741874), prj(2.133974596215561, -1.0000000000000009, 3.696152422706633), prj(2.0936922129633495, -0.8452365234813982, 3.62638128826384), prj(2.060307379214091, -0.684040286651337, 3.5685570600078846), prj(2.0340741737109314, -0.5176380902050413, 3.5231198152310164), prj(2.0151922469877914, -0.34729635533386066, 3.4904153588017457), prj(2.003805301908254, -0.1743114854953165, 3.47069259138099), prj(1.9999999999999996, -3.6739403974420594e-16, 3.464101615137755), prj(2.003805301908254, 0.17431148549531578, 3.47069259138099), prj(2.0151922469877914, 0.34729635533385994, 3.4904153588017452), prj(2.0340741737109314, 0.5176380902050406, 3.5231198152310164), prj(2.060307379214091, 0.6840402866513381, 3.568557060007885), prj(2.09369221296335, 0.8452365234813992, 3.6263812882638407), prj(2.133974596215561, 1.0, 3.696152422706632), prj(2.180847955711008, 1.147152872702092, 3.7773394628741874), prj(2.2339555568810217, 1.2855752193730785, 3.8693245263687555), prj(2.292893218813452, 1.4142135623730947, 3.9714075513150426), prj(2.3572123903134603, 1.5320888862379558, 4.082811624253793), prj(2.4264235636489535, 1.6383040885779832, 4.202688892922324), prj(2.499999999999999, 1.7320508075688767, 4.330127018922193), prj(2.5773817382593007, 1.8126155740733, 4.464156121165299), prj(2.657979856674331, 1.8793852415718169, 4.603756157254585), prj(2.7411809548974793, 1.9318516525781366, 4.747864686622606), prj(2.8263518223330695, 1.969615506024416, 4.895384956345762), prj(2.912844257252342, 1.992389396183491, 5.045194248096285), prj(2.9999999999999996, 2.0, 5.196152422706632))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(4, 0, 0)
    let N = prj(3.3779644730092273, 0, 3.2321914105827005)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(3.3779644730092273, 0.0, 0.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 4$.
  - $(C_2)$ trên mặt phẳng nghiêng $(P): z = sqrt(3)x$, tâm $J_2(3; 0; 3sqrt(3))$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm:* Với cấu hình hai mặt phẳng cắt nhau tạo thành góc $60^o$ chứa hai đường tròn chéo nhau, ta dùng phương pháp lượng giác hóa để tham số tọa độ điểm $M in (C_1)$ và áp dụng phương pháp quy giản về tâm đường tròn $J_2$ để tính khoảng cách cực tiểu dễ dàng.
]
*Bước 1 (Quy giản hình học về tâm):*
Áp dụng đánh giá khoảng cách chặn dưới: $M N >= M J_2 - R_2$. Khoảng cách giữa hai đường tròn nhỏ nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa lượng giác):*
Do điểm $M$ nằm trên đường tròn $(C_1)$ có tâm $J_1(0;0;0)$ và bán kính $R_1=4$ trên mặt phẳng $z=0$, ta biểu diễn tọa độ của $M$ theo góc $t in [0; 2 pi)$:
$ M(4 cos t, 4 sin t, 0) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(3; 0; 3sqrt(3))$:
$ M J_2^2 = (4 cos t - 3)^2 + (4 sin t - 0)^2 + (0 - 3sqrt(3))^2 $
$ = 16 cos^2 t - 24 cos t + 9 + 16 sin^2 t + 27 $
$ = 16(cos^2 t + sin^2 t) + 36 - 24 cos t = 52 - 24 cos t. $

*Bước 4 (Tìm giá trị cực tiểu):*
Để khoảng cách $M J_2$ nhỏ nhất thì $52 - 24 cos t$ phải nhỏ nhất, tương đương với $cos t$ phải đạt giá trị lớn nhất.
Ta biết giá trị lớn nhất của $cos t$ là $1$ (xảy ra khi $t = 0$, ứng với điểm $M(4; 0; 0)$).
Khi đó:
$ M J_(2, min) = sqrt(52 - 24(1)) = sqrt(28) = 2 sqrt(7) $

*Bước 5 (Kết luận):*
Độ dài ngắn nhất nối hai đường tròn chéo nhau nghiêng $60^o$ là:
$ M N_(min) = M J_(2, min) - R_2 = 2 sqrt(7) - 2 $
(Khoảng cách này xấp xỉ $3.29$ dm).
  ]
)

#tln(
  [(Ví dụ 16: Cấu hình 4.2 - Hai mặt phẳng nghiêng góc $45°$) Trong một hệ thống dẫn nhiên liệu tự động, hai vành đệm tròn $(C_1)$ và $(C_2)$ được đặt trên hai mặt phẳng nghiêng nhau một góc $45°$. Vành thứ nhất $(C_1)$ nằm trên mặt nằm ngang $z=0$, có tâm $J_1(0;0;0)$ và bán kính $R_1=5$. Vành thứ hai $(C_2)$ nằm trên mặt nghiêng $(P): y-z=0$, có tâm $J_2(0;4;4)$ và bán kính $R_2=2$. Hãy xác định khoảng cách ngắn nhất giữa hai vành đệm bằng phương pháp quy giản về tâm?],
  [$sqrt(17) - 2$],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(0, 4, 4)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 8.0
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(5.0, 0.0, 0.0), prj(4.9809734904587275, 0.4357787137382908, 0.0), prj(4.92403876506104, 0.8682408883346516, 0.0), prj(4.8296291314453415, 1.2940952255126037, 0.0), prj(4.698463103929543, 1.7101007166283435, 0.0), prj(4.531538935183249, 2.1130913087034973, 0.0), prj(4.330127018922194, 2.4999999999999996, 0.0), prj(4.095760221444959, 2.8678821817552302, 0.0), prj(3.83022221559489, 3.2139380484326963, 0.0), prj(3.5355339059327378, 3.5355339059327373, 0.0), prj(3.2139380484326967, 3.83022221559489, 0.0), prj(2.8678821817552307, 4.095760221444959, 0.0), prj(2.5000000000000004, 4.330127018922193, 0.0), prj(2.1130913087034973, 4.531538935183249, 0.0), prj(1.7101007166283442, 4.698463103929542, 0.0), prj(1.2940952255126037, 4.8296291314453415, 0.0), prj(0.8682408883346521, 4.92403876506104, 0.0), prj(0.43577871373829064, 4.9809734904587275, 0.0), prj(3.061616997868383e-16, 5.0, 0.0), prj(-0.4357787137382912, 4.9809734904587275, 0.0), prj(-0.8682408883346515, 4.92403876506104, 0.0), prj(-1.2940952255126041, 4.8296291314453415, 0.0), prj(-1.7101007166283435, 4.698463103929543, 0.0), prj(-2.113091308703497, 4.53153893518325, 0.0), prj(-2.499999999999999, 4.3301270189221945, 0.0), prj(-2.8678821817552307, 4.095760221444959, 0.0), prj(-3.2139380484326963, 3.83022221559489, 0.0), prj(-3.5355339059327373, 3.5355339059327378, 0.0), prj(-3.8302222155948895, 3.2139380484326976, 0.0), prj(-4.0957602214449595, 2.86788218175523, 0.0), prj(-4.330127018922194, 2.4999999999999996, 0.0), prj(-4.531538935183249, 2.1130913087034973, 0.0), prj(-4.698463103929542, 1.7101007166283444, 0.0), prj(-4.829629131445341, 1.294095225512605, 0.0), prj(-4.92403876506104, 0.8682408883346513, 0.0), prj(-4.9809734904587275, 0.43577871373829097, 0.0), prj(-5.0, 6.123233995736766e-16, 0.0), prj(-4.9809734904587275, -0.4357787137382897, 0.0), prj(-4.92403876506104, -0.8682408883346524, 0.0), prj(-4.8296291314453415, -1.294095225512604, 0.0), prj(-4.698463103929543, -1.7101007166283433, 0.0), prj(-4.53153893518325, -2.1130913087034964, 0.0), prj(-4.330127018922193, -2.5000000000000004, 0.0), prj(-4.095760221444959, -2.8678821817552307, 0.0), prj(-3.83022221559489, -3.2139380484326963, 0.0), prj(-3.5355339059327386, -3.535533905932737, 0.0), prj(-3.213938048432698, -3.8302222155948895, 0.0), prj(-2.867882181755232, -4.095760221444958, 0.0), prj(-2.500000000000002, -4.330127018922192, 0.0), prj(-2.1130913087034955, -4.531538935183251, 0.0), prj(-1.7101007166283424, -4.698463103929543, 0.0), prj(-1.2940952255126033, -4.8296291314453415, 0.0), prj(-0.8682408883346516, -4.92403876506104, 0.0), prj(-0.43577871373829125, -4.9809734904587275, 0.0), prj(-9.184850993605148e-16, -5.0, 0.0), prj(0.43577871373828947, -4.9809734904587275, 0.0), prj(0.8682408883346499, -4.924038765061041, 0.0), prj(1.2940952255126015, -4.829629131445342, 0.0), prj(1.7101007166283453, -4.698463103929542, 0.0), prj(2.113091308703498, -4.531538935183249, 0.0), prj(2.5, -4.330127018922193, 0.0), prj(2.8678821817552302, -4.095760221444959, 0.0), prj(3.2139380484326963, -3.8302222155948904, 0.0), prj(3.535533905932737, -3.5355339059327386, 0.0), prj(3.8302222155948895, -3.213938048432698, 0.0), prj(4.095760221444958, -2.867882181755232, 0.0), prj(4.330127018922192, -2.500000000000002, 0.0), prj(4.53153893518325, -2.113091308703496, 0.0), prj(4.698463103929543, -1.7101007166283426, 0.0), prj(4.8296291314453415, -1.2940952255126035, 0.0), prj(4.92403876506104, -0.868240888334652, 0.0), prj(4.9809734904587275, -0.4357787137382916, 0.0), prj(5.0, -1.2246467991473533e-15, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(0 - pw2*-1.0 - pw2*0.0, 4 - pw2*0.0 - pw2*0.7071067811865474, 4 - pw2*0.0 - pw2*0.7071067811865477)
      let p2_2 = prj(0 + pw2*-1.0 - pw2*0.0, 4 + pw2*0.0 - pw2*0.7071067811865474, 4 + pw2*0.0 - pw2*0.7071067811865477)
      let p2_3 = prj(0 + pw2*-1.0 + pw2*0.0, 4 + pw2*0.0 + pw2*0.7071067811865474, 4 + pw2*0.0 + pw2*0.7071067811865477)
      let p2_4 = prj(0 - pw2*-1.0 + pw2*0.0, 4 - pw2*0.0 + pw2*0.7071067811865474, 4 - pw2*0.0 + pw2*0.7071067811865477)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(-2.0, 4.0, 4.0), prj(-1.992389396183491, 4.123256833432439, 4.123256833432439), prj(-1.969615506024416, 4.245575607937946, 4.245575607937946), prj(-1.9318516525781366, 4.366025403784438, 4.366025403784438), prj(-1.8793852415718169, 4.483689525295951, 4.483689525295951), prj(-1.8126155740732999, 4.5976724774602395, 4.5976724774602395), prj(-1.7320508075688774, 4.707106781186547, 4.707106781186548), prj(-1.6383040885779836, 4.811159575345277, 4.811159575345278), prj(-1.532088886237956, 4.909038955344087, 4.909038955344087), prj(-1.4142135623730951, 5.0, 5.0), prj(-1.2855752193730787, 5.0833504408394035, 5.0833504408394035), prj(-1.1471528727020923, 5.158455930679138, 5.158455930679139), prj(-1.0000000000000002, 5.2247448713915885, 5.224744871391589), prj(-0.8452365234813989, 5.281712764111576, 5.281712764111577), prj(-0.6840402866513376, 5.328926048777349, 5.328926048777349), prj(-0.5176380902050415, 5.366025403784438, 5.366025403784439), prj(-0.34729635533386083, 5.392728480640038, 5.392728480640038), prj(-0.17431148549531625, 5.408832052805517, 5.408832052805518), prj(-1.2246467991473532e-16, 5.414213562373095, 5.414213562373096), prj(0.17431148549531647, 5.408832052805517, 5.408832052805518), prj(0.3472963553338606, 5.392728480640038, 5.392728480640038), prj(0.5176380902050417, 5.366025403784438, 5.366025403784439), prj(0.6840402866513374, 5.328926048777349, 5.328926048777349), prj(0.8452365234813987, 5.281712764111576, 5.281712764111577), prj(0.9999999999999996, 5.224744871391589, 5.224744871391589), prj(1.1471528727020923, 5.158455930679138, 5.158455930679139), prj(1.2855752193730785, 5.0833504408394035, 5.0833504408394035), prj(1.414213562373095, 5.0, 5.0), prj(1.5320888862379558, 4.909038955344087, 4.909038955344088), prj(1.6383040885779838, 4.811159575345277, 4.811159575345278), prj(1.7320508075688774, 4.707106781186547, 4.707106781186548), prj(1.8126155740732999, 4.5976724774602395, 4.5976724774602395), prj(1.8793852415718166, 4.483689525295951, 4.483689525295951), prj(1.9318516525781364, 4.366025403784439, 4.366025403784439), prj(1.969615506024416, 4.245575607937946, 4.245575607937946), prj(1.992389396183491, 4.123256833432439, 4.123256833432439), prj(2.0, 4.0, 4.0), prj(1.992389396183491, 3.876743166567562, 3.876743166567562), prj(1.969615506024416, 3.754424392062054, 3.754424392062054), prj(1.9318516525781366, 3.6339745962155616, 3.633974596215561), prj(1.8793852415718169, 3.5163104747040497, 3.5163104747040492), prj(1.8126155740733, 3.4023275225397605, 3.4023275225397605), prj(1.7320508075688772, 3.2928932188134525, 3.292893218813452), prj(1.6383040885779836, 3.1888404246547224, 3.188840424654722), prj(1.532088886237956, 3.090961044655913, 3.090961044655913), prj(1.4142135623730954, 3.0000000000000004, 3.0), prj(1.2855752193730792, 2.9166495591605965, 2.9166495591605965), prj(1.1471528727020928, 2.8415440693208622, 2.841544069320862), prj(1.0000000000000009, 2.7752551286084115, 2.775255128608411), prj(0.8452365234813982, 2.7182872358884227, 2.7182872358884222), prj(0.684040286651337, 2.6710739512226507, 2.6710739512226502), prj(0.5176380902050413, 2.6339745962155616, 2.6339745962155607), prj(0.34729635533386066, 2.6072715193599625, 2.607271519359962), prj(0.1743114854953165, 2.5911679471944833, 2.5911679471944824), prj(3.6739403974420594e-16, 2.585786437626905, 2.5857864376269046), prj(-0.17431148549531578, 2.5911679471944833, 2.5911679471944824), prj(-0.34729635533385994, 2.607271519359962, 2.6072715193599616), prj(-0.5176380902050406, 2.6339745962155616, 2.6339745962155607), prj(-0.6840402866513381, 2.671073951222651, 2.6710739512226507), prj(-0.8452365234813992, 2.7182872358884236, 2.7182872358884227), prj(-1.0, 2.7752551286084115, 2.7752551286084106), prj(-1.147152872702092, 2.841544069320862, 2.8415440693208613), prj(-1.2855752193730785, 2.9166495591605965, 2.9166495591605957), prj(-1.4142135623730947, 3.0, 2.9999999999999996), prj(-1.5320888862379558, 3.0909610446559124, 3.090961044655912), prj(-1.6383040885779832, 3.188840424654722, 3.188840424654722), prj(-1.7320508075688767, 3.292893218813452, 3.2928932188134517), prj(-1.8126155740733, 3.402327522539761, 3.4023275225397605), prj(-1.8793852415718169, 3.5163104747040497, 3.5163104747040497), prj(-1.9318516525781366, 3.6339745962155616, 3.6339745962155616), prj(-1.969615506024416, 3.754424392062054, 3.754424392062054), prj(-1.992389396183491, 3.876743166567561, 3.876743166567561), prj(-2.0, 3.9999999999999996, 3.9999999999999996))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(0, 5, 0)
    let N = prj(0, 4, 2)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(0.0, 4.0, 0.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - Vành thứ nhất $(C_1)$ trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 5$.
  - Vành thứ hai $(C_2)$ trên mặt phẳng nghiêng $y-z=0$, tâm $J_2(0; 4; 4)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm:* Hai mặt phẳng $z=0$ (pháp vectơ $arrow(n)_1 = (0;0;1)$) và $y-z=0$ (pháp vectơ $arrow(n)_2 = (0;1;-1)$) có góc giữa hai mặt phẳng được tính bởi $cos alpha = |arrow(n)_1 dot arrow(n)_2| / (1 dot sqrt(2)) = 1/sqrt(2) => alpha = 45^o$. Ta áp dụng phương pháp quy giản khoảng cách về tâm $J_2$ của đường tròn $(C_2)$.
]
*Bước 1 (Quy giản hình học về tâm):*
Ta áp dụng đánh giá khoảng cách chặn dưới: $M N >= M J_2 - R_2$. Khoảng cách giữa hai đường tròn nhỏ nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(0; 4; 4)$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa lượng giác):*
Do điểm $M$ nằm trên đường tròn $(C_1)$ có tâm $J_1(0;0;0)$ và bán kính $R_1=5$ trên mặt phẳng $z=0$, ta tham số hóa tọa độ của $M$ theo góc $t in [0; 2 pi)$:
$ M(5 cos t, 5 sin t, 0) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(0;4;4)$:
$ M J_2^2 = (5 cos t - 0)^2 + (5 sin t - 4)^2 + (0 - 4)^2 $
$ = 25 cos^2 t + (25 sin^2 t - 40 sin t + 16) + 16 $
$ = 25(cos^2 t + sin^2 t) - 40 sin t + 32 $
$ = 25 + 32 - 40 sin t = 57 - 40 sin t. $

*Bước 4 (Tìm giá trị cực tiểu):*
Để khoảng cách $M J_2$ nhỏ nhất thì $57 - 40 sin t$ phải nhỏ nhất, tương đương với $sin t$ phải đạt giá trị lớn nhất.
Ta biết giá trị lớn nhất của $sin t$ là $1$ (xảy ra khi $t = pi/2$, ứng với điểm $M(0; 5; 0)$).
Khi đó:
$ M J_(2, min) = sqrt(57 - 40(1)) = sqrt(17) $

*Bước 5 (Kết luận):*
Độ dài ngắn nhất nối hai vành đệm chéo nhau nghiêng $45^o$ là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(17) - 2 $
(Khoảng cách này xấp xỉ $2.12$ dm).
  ]
)

#tln(
  [(Cấu hình 4.3 - Hai mặt phẳng nghiêng góc $30°$) Trong hệ tọa độ $O x y z$, đường tròn $(C_1)$ nằm trên mặt nằm ngang $z=0$, có tâm $J_1(0;0;0)$ và bán kính $R_1=6$. Đường tròn $(C_2)$ nằm trên mặt phẳng nghiêng $(P): y - sqrt(3)z = 0$, có tâm $J_2(0;3sqrt(3);3)$ và bán kính $R_2=2$. Hãy xác định khoảng cách ngắn nhất giữa hai đường tròn?],
  [$3 sqrt(6) - 3 sqrt(2) - 2$],
  fig: cetz.canvas(length: 0.4cm, {
    import cetz.draw: *
    
    // Phép chiếu góc nhìn chuẩn: Nghiêng nhẹ để thấy vòng tròn, 
    // nhưng vẫn giữ trực diện để thấy rõ góc 30 độ giữa hai mặt phẳng.
    let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }
    
    // Hệ trục
    line(prj(0,-1,0), prj(0,9,0), stroke: 0.4pt + gray) // Trục y
    line(prj(0,0,-1), prj(0,0,6), stroke: 0.4pt + gray) // Trục z
    content(prj(0,9.5,0), [$y$], anchor: "west")
    content(prj(0,0,6.5), [$z$], anchor: "south")
    circle(prj(0,0,0), radius: 1pt, fill: black)
    content(prj(0,0,0), [$O$], anchor: "north-west", padding: 2pt)
    
    // Mặt phẳng (P1): z=0
    line(prj(-7,-2,0), prj(7,-2,0), prj(7,8,0), prj(-7,8,0), close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C1)
    let pts1 = (prj(6.0000, 0.0000, 0.0000), prj(5.9772, 0.5229, 0.0000), prj(5.9088, 1.0419, 0.0000), prj(5.7956, 1.5529, 0.0000), prj(5.6382, 2.0521, 0.0000), prj(5.4378, 2.5357, 0.0000), prj(5.1962, 3.0000, 0.0000), prj(4.9149, 3.4415, 0.0000), prj(4.5963, 3.8567, 0.0000), prj(4.2426, 4.2426, 0.0000), prj(3.8567, 4.5963, 0.0000), prj(3.4415, 4.9149, 0.0000), prj(3.0000, 5.1962, 0.0000), prj(2.5357, 5.4378, 0.0000), prj(2.0521, 5.6382, 0.0000), prj(1.5529, 5.7956, 0.0000), prj(1.0419, 5.9088, 0.0000), prj(0.5229, 5.9772, 0.0000), prj(0.0000, 6.0000, 0.0000), prj(-0.5229, 5.9772, 0.0000), prj(-1.0419, 5.9088, 0.0000), prj(-1.5529, 5.7956, 0.0000), prj(-2.0521, 5.6382, 0.0000), prj(-2.5357, 5.4378, 0.0000), prj(-3.0000, 5.1962, 0.0000), prj(-3.4415, 4.9149, 0.0000), prj(-3.8567, 4.5963, 0.0000), prj(-4.2426, 4.2426, 0.0000), prj(-4.5963, 3.8567, 0.0000), prj(-4.9149, 3.4415, 0.0000), prj(-5.1962, 3.0000, 0.0000), prj(-5.4378, 2.5357, 0.0000), prj(-5.6382, 2.0521, 0.0000), prj(-5.7956, 1.5529, 0.0000), prj(-5.9088, 1.0419, 0.0000), prj(-5.9772, 0.5229, 0.0000), prj(-6.0000, 0.0000, 0.0000), prj(-5.9772, -0.5229, 0.0000), prj(-5.9088, -1.0419, 0.0000), prj(-5.7956, -1.5529, 0.0000), prj(-5.6382, -2.0521, 0.0000), prj(-5.4378, -2.5357, 0.0000), prj(-5.1962, -3.0000, 0.0000), prj(-4.9149, -3.4415, 0.0000), prj(-4.5963, -3.8567, 0.0000), prj(-4.2426, -4.2426, 0.0000), prj(-3.8567, -4.5963, 0.0000), prj(-3.4415, -4.9149, 0.0000), prj(-3.0000, -5.1962, 0.0000), prj(-2.5357, -5.4378, 0.0000), prj(-2.0521, -5.6382, 0.0000), prj(-1.5529, -5.7956, 0.0000), prj(-1.0419, -5.9088, 0.0000), prj(-0.5229, -5.9772, 0.0000), prj(-0.0000, -6.0000, 0.0000), prj(0.5229, -5.9772, 0.0000), prj(1.0419, -5.9088, 0.0000), prj(1.5529, -5.7956, 0.0000), prj(2.0521, -5.6382, 0.0000), prj(2.5357, -5.4378, 0.0000), prj(3.0000, -5.1962, 0.0000), prj(3.4415, -4.9149, 0.0000), prj(3.8567, -4.5963, 0.0000), prj(4.2426, -4.2426, 0.0000), prj(4.5963, -3.8567, 0.0000), prj(4.9149, -3.4415, 0.0000), prj(5.1962, -3.0000, 0.0000), prj(5.4378, -2.5357, 0.0000), prj(5.6382, -2.0521, 0.0000), prj(5.7956, -1.5529, 0.0000), prj(5.9088, -1.0419, 0.0000), prj(5.9772, -0.5229, 0.0000), prj(6.0000, -0.0000, 0.0000))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    
    // Mặt phẳng (P2): y - sqrt(3)z = 0 (Nghiêng 30 độ so với mặt z=0)
    let p2_1 = prj(-4, -1.73, -1)
    let p2_2 = prj(4, -1.73, -1)
    let p2_3 = prj(4, 10.39, 6)
    let p2_4 = prj(-4, 10.39, 6)
    line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    
    // Đường tròn (C2)
    let pts2 = (prj(2.0000, 5.1962, 3.0000), prj(1.9924, 5.3471, 3.0872), prj(1.9696, 5.4969, 3.1736), prj(1.9319, 5.6444, 3.2588), prj(1.8794, 5.7885, 3.3420), prj(1.8126, 5.9281, 3.4226), prj(1.7321, 6.0622, 3.5000), prj(1.6383, 6.1896, 3.5736), prj(1.5321, 6.3095, 3.6428), prj(1.4142, 6.4209, 3.7071), prj(1.2856, 6.5230, 3.7660), prj(1.1472, 6.6150, 3.8192), prj(1.0000, 6.6962, 3.8660), prj(0.8452, 6.7659, 3.9063), prj(0.6840, 6.8237, 3.9397), prj(0.5176, 6.8692, 3.9659), prj(0.3473, 6.9019, 3.9848), prj(0.1743, 6.9216, 3.9962), prj(0.0000, 6.9282, 4.0000), prj(-0.1743, 6.9216, 3.9962), prj(-0.3473, 6.9019, 3.9848), prj(-0.5176, 6.8692, 3.9659), prj(-0.6840, 6.8237, 3.9397), prj(-0.8452, 6.7659, 3.9063), prj(-1.0000, 6.6962, 3.8660), prj(-1.1472, 6.6150, 3.8192), prj(-1.2856, 6.5230, 3.7660), prj(-1.4142, 6.4209, 3.7071), prj(-1.5321, 6.3095, 3.6428), prj(-1.6383, 6.1896, 3.5736), prj(-1.7321, 6.0622, 3.5000), prj(-1.8126, 5.9281, 3.4226), prj(-1.8794, 5.7885, 3.3420), prj(-1.9319, 5.6444, 3.2588), prj(-1.9696, 5.4969, 3.1736), prj(-1.9924, 5.3471, 3.0872), prj(-2.0000, 5.1962, 3.0000), prj(-1.9924, 5.0452, 2.9128), prj(-1.9696, 4.8954, 2.8264), prj(-1.9319, 4.7479, 2.7412), prj(-1.8794, 4.6038, 2.6580), prj(-1.8126, 4.4642, 2.5774), prj(-1.7321, 4.3301, 2.5000), prj(-1.6383, 4.2027, 2.4264), prj(-1.5321, 4.0828, 2.3572), prj(-1.4142, 3.9714, 2.2929), prj(-1.2856, 3.8693, 2.2340), prj(-1.1472, 3.7773, 2.1808), prj(-1.0000, 3.6962, 2.1340), prj(-0.8452, 3.6264, 2.0937), prj(-0.6840, 3.5686, 2.0603), prj(-0.5176, 3.5231, 2.0341), prj(-0.3473, 3.4904, 2.0152), prj(-0.1743, 3.4707, 2.0038), prj(-0.0000, 3.4641, 2.0000), prj(0.1743, 3.4707, 2.0038), prj(0.3473, 3.4904, 2.0152), prj(0.5176, 3.5231, 2.0341), prj(0.6840, 3.5686, 2.0603), prj(0.8452, 3.6264, 2.0937), prj(1.0000, 3.6962, 2.1340), prj(1.1472, 3.7773, 2.1808), prj(1.2856, 3.8693, 2.2340), prj(1.4142, 3.9714, 2.2929), prj(1.5321, 4.0828, 2.3572), prj(1.6383, 4.2027, 2.4264), prj(1.7321, 4.3301, 2.5000), prj(1.8126, 4.4642, 2.5774), prj(1.8794, 4.6038, 2.6580), prj(1.9319, 4.7479, 2.7412), prj(1.9696, 4.8954, 2.8264), prj(1.9924, 5.0452, 2.9128), prj(2.0000, 5.1962, 3.0000))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    
    // Tâm J2
    let J2 = prj(0, 5.1962, 3)
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south-east", padding: 2pt)
    
    // Điểm M và N (Ngắn nhất)
    let M = prj(0, 6, 0)
    
    // Điểm N trên C2 gần J2 nhất
    // Vector chỉ phương nghiêng 30 độ: (0, sqrt(3)/2, 1/2). Ta trừ R2 dọc theo vector này để về N.
    let n_dy = 2 * (calc.sqrt(3)/2)
    let n_dz = 2 * 0.5
    let N = prj(0, 5.1962 - n_dy, 3 - n_dz)
    
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    content(N, [$N$], anchor: "south", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#ea580c"))
    
    // Góc 30 độ minh họa
    arc(prj(0,0,0), radius: 1.5, start: 0deg, stop: 30deg, mode: "PIE", fill: rgb("ea580c40"), stroke: 0.5pt + rgb("#ea580c"))
    content(prj(0, 2.5, 0.6), text(size: 8pt, fill: rgb("#ea580c"))[$30°$])
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ nằm trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 6$.
  - $(C_2)$ nằm trên mặt phẳng nghiêng $y - sqrt(3)z = 0$, tâm $J_2(0; 3sqrt(3); 3)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm (Trực quan hóa cấu hình):*
  
  Khi quan sát hình chiếu vuông góc từ trên xuống dọc theo trục tung (như hình minh họa bên), ta dễ dàng nhận thấy mặt phẳng $(C_1)$ nằm ngang ngang và mặt phẳng chứa $(C_2)$ tạo với nó một góc $30^o$. Góc này có thể tính trực tiếp qua cosin góc giữa hai pháp vectơ $arrow(n)_1 = (0;0;1)$ và $arrow(n)_2 = (0;1;-sqrt(3))$:
  $ cos alpha = (|arrow(n)_1 dot arrow(n)_2|) / (|arrow(n)_1| dot |arrow(n)_2|) = sqrt(3)/2 => alpha = 30^o $.
  
  Do bài toán tìm khoảng cách ngắn nhất từ một điểm trên $(C_1)$ tới đường tròn $(C_2)$, việc thiết lập trực tiếp sẽ rất phức tạp vì $C_2$ nằm nghiêng. Giải pháp vạn năng là *Quy giản hình học về tâm $J_2$*:
  Thay vì xét $N in (C_2)$, ta đánh giá khoảng cách từ $M in (C_1)$ tới tâm cố định $J_2$:
  $ M N >= M J_2 - R_2 => M N_(min) = M J_(2, min) - R_2 $.
]
*Bước 1 (Tham số hóa điểm $M$):*
Do điểm $M$ thuộc đường tròn $(C_1)$ có tâm gốc tọa độ $O(0;0;0)$ và bán kính $R_1=6$ trên mặt phẳng ngang $z=0$, tọa độ $M$ hoàn toàn được xác định bởi một góc quay $t in [0; 2 pi)$:
$ M(6 cos t, 6 sin t, 0) $

*Bước 2 (Thiết lập hàm khoảng cách $M J_2$):*
Bình phương khoảng cách từ điểm di động $M$ đến tâm cố định $J_2(0; 3sqrt(3); 3)$ được thiết lập qua Pytago 3D:
$ M J_2^2 = (6 cos t - 0)^2 + (6 sin t - 3sqrt(3))^2 + (0 - 3)^2 $
$ = 36 cos^2 t + (36 sin^2 t - 36 sqrt(3) sin t + 27) + 9 $
Gộp $cos^2 t + sin^2 t = 1$, ta thu gọn được biểu thức cực kỳ đẹp:
$ = 36(1) - 36 sqrt(3) sin t + 36 = 72 - 36 sqrt(3) sin t. $

*Bước 3 (Tìm giá trị cực tiểu):*
Để đoạn thẳng $M J_2$ ngắn nhất, lượng bị trừ $36 sqrt(3) sin t$ phải đạt giá trị lớn nhất.
Nghĩa là $sin t$ phải lớn nhất: $sin t = 1$ (khi $t = pi/2$, ứng với điểm $M(0; 6; 0)$ hướng thẳng về $J_2$).
Khi đó:
$ M J_(2, min) = sqrt(72 - 36 sqrt(3)) = sqrt(36(2 - sqrt(3))) = 6sqrt(2-sqrt(3)) $
Sử dụng hằng đẳng thức $2 - sqrt(3) = (sqrt(3)-1)^2/2$, ta có:
$ M J_(2, min) = 6 dot (sqrt(3)-1)/sqrt(2) = 3 sqrt(2)(sqrt(3)-1) = 3 sqrt(6) - 3 sqrt(2) $

*Bước 4 (Kết luận):*
Độ dài đoạn cáp nối ngắn nhất giữa hai viền đường tròn là:
$ M N_(min) = M J_(2, min) - R_2 = 3 sqrt(6) - 3 sqrt(2) - 2 $
(Khoảng cách này xấp xỉ $1.11$ dm).

*Cách 2 (Giải siêu tốc bằng công thức Vạn năng & Máy tính Casio):*
Ta áp dụng trực tiếp công thức khoảng cách tổng quát từ điểm $M in (C_1)$ đến mặt phẳng nghiêng $(P_2): y - sqrt(3)z = 0$ chứa $(C_2)$ (tâm $J_2(0; 3sqrt(3); 3)$, $R_2 = 2$):
$ d(M, (C_2))^2 = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
- Bước 1: $M(6 cos t, 6 sin t, 0) => M J_2^2 = 72 - 36 sqrt(3) sin t.$
- Bước 2: $d(M, P_2)^2 = (|6 sin t - sqrt(3) dot 0| / sqrt(1^2 + (-sqrt(3))^2))^2 = (|6 sin t| / 2)^2 = 9 sin^2 t.$
- Bước 3: Ráp công thức:
  $ F(t) = 72 - 36 sqrt(3) sin t + 4 - 4sqrt(72 - 36 sqrt(3) sin t - 9 sin^2 t) $
  $ = 76 - 36 sqrt(3) sin t - 4sqrt(72 - 36 sqrt(3) sin t - 9 sin^2 t) $
Dùng chức năng TABLE trên Casio quét $F(t)$ với $t in [0; 2 pi]$, hàm số đạt MIN khi $sin t = 1$ ($t = pi/2$):
$ F(pi/2) = 76 - 36 sqrt(3) - 4sqrt(72 - 36 sqrt(3) - 9) = (3 sqrt(6) - 3 sqrt(2) - 2)^2 $
$ => M N_(min) = sqrt(F(pi/2)) = 3 sqrt(6) - 3 sqrt(2) - 2. $
  ]
)

#tln(
  [(Cấu hình 5.1 - Đoạn vuông góc chung) Hai quỹ đạo của thiết bị tự động được đặt trong hai mặt phẳng vuông góc. Quỹ đạo $(C_1)$ nằm trên mặt phẳng $y=0$ có tâm $J_1(0;0;6)$, bán kính $R_1=3$. Quỹ đạo $(C_2)$ nằm trên mặt phẳng $x=0$ có tâm $J_2(0;9;6)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa hai quỹ đạo?],
  [2],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 6)
    let J2 = prj(0, 9, 6)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 6.0
    let p1_1 = prj(0 - pw1*-1.0 - pw1*-0.0, 0 - pw1*0.0 - pw1*-0.0, 6 - pw1*0.0 - pw1*1.0)
    let p1_2 = prj(0 + pw1*-1.0 - pw1*-0.0, 0 + pw1*0.0 - pw1*-0.0, 6 + pw1*0.0 - pw1*1.0)
    let p1_3 = prj(0 + pw1*-1.0 + pw1*-0.0, 0 + pw1*0.0 + pw1*-0.0, 6 + pw1*0.0 + pw1*1.0)
    let p1_4 = prj(0 - pw1*-1.0 + pw1*-0.0, 0 - pw1*0.0 + pw1*-0.0, 6 - pw1*0.0 + pw1*1.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(-3.0, 0.0, 6.0), prj(-2.988584094275237, 0.0, 6.261467228242974), prj(-2.954423259036624, 0.0, 6.520944533000791), prj(-2.897777478867205, 0.0, 6.776457135307562), prj(-2.8190778623577253, 0.0, 7.026060429977006), prj(-2.7189233611099497, 0.0, 7.267854785222099), prj(-2.598076211353316, 0.0, 7.5), prj(-2.4574561328669753, 0.0, 7.720729309053138), prj(-2.298133329356934, 0.0, 7.928362829059617), prj(-2.121320343559643, 0.0, 8.121320343559642), prj(-1.9283628290596182, 0.0, 8.298133329356935), prj(-1.7207293090531386, 0.0, 8.457456132866975), prj(-1.5000000000000004, 0.0, 8.598076211353316), prj(-1.2678547852220983, 0.0, 8.71892336110995), prj(-1.0260604299770064, 0.0, 8.819077862357725), prj(-0.7764571353075622, 0.0, 8.897777478867205), prj(-0.5209445330007912, 0.0, 8.954423259036624), prj(-0.26146722824297436, 0.0, 8.988584094275236), prj(-1.8369701987210297e-16, 0.0, 9.0), prj(0.2614672282429747, 0.0, 8.988584094275236), prj(0.5209445330007909, 0.0, 8.954423259036624), prj(0.7764571353075626, 0.0, 8.897777478867205), prj(1.0260604299770062, 0.0, 8.819077862357725), prj(1.267854785222098, 0.0, 8.718923361109951), prj(1.4999999999999993, 0.0, 8.598076211353316), prj(1.7207293090531386, 0.0, 8.457456132866975), prj(1.9283628290596178, 0.0, 8.298133329356935), prj(2.1213203435596424, 0.0, 8.121320343559642), prj(2.2981333293569337, 0.0, 7.928362829059618), prj(2.4574561328669757, 0.0, 7.720729309053137), prj(2.598076211353316, 0.0, 7.5), prj(2.7189233611099497, 0.0, 7.267854785222099), prj(2.819077862357725, 0.0, 7.026060429977006), prj(2.8977774788672046, 0.0, 6.776457135307563), prj(2.954423259036624, 0.0, 6.52094453300079), prj(2.988584094275237, 0.0, 6.261467228242974), prj(3.0, 0.0, 6.0), prj(2.988584094275237, 0.0, 5.7385327717570265), prj(2.954423259036624, 0.0, 5.479055466999209), prj(2.897777478867205, 0.0, 5.223542864692438), prj(2.8190778623577253, 0.0, 4.973939570022994), prj(2.71892336110995, 0.0, 4.732145214777902), prj(2.598076211353316, 0.0, 4.5), prj(2.4574561328669753, 0.0, 4.279270690946861), prj(2.298133329356934, 0.0, 4.071637170940383), prj(2.121320343559643, 0.0, 3.878679656440358), prj(1.9283628290596186, 0.0, 3.7018666706430663), prj(1.720729309053139, 0.0, 3.542543867133025), prj(1.5000000000000013, 0.0, 3.401923788646685), prj(1.2678547852220974, 0.0, 3.2810766388900494), prj(1.0260604299770055, 0.0, 3.1809221376422747), prj(0.7764571353075619, 0.0, 3.102222521132795), prj(0.520944533000791, 0.0, 3.045576740963376), prj(0.26146722824297475, 0.0, 3.011415905724763), prj(5.51091059616309e-16, 0.0, 3.0), prj(-0.26146722824297364, 0.0, 3.011415905724763), prj(-0.5209445330007899, 0.0, 3.0455767409633756), prj(-0.7764571353075609, 0.0, 3.102222521132795), prj(-1.026060429977007, 0.0, 3.180922137642275), prj(-1.2678547852220987, 0.0, 3.2810766388900507), prj(-1.5, 0.0, 3.401923788646684), prj(-1.7207293090531381, 0.0, 3.5425438671330247), prj(-1.9283628290596178, 0.0, 3.7018666706430654), prj(-2.121320343559642, 0.0, 3.878679656440357), prj(-2.2981333293569337, 0.0, 4.071637170940381), prj(-2.457456132866975, 0.0, 4.279270690946861), prj(-2.598076211353315, 0.0, 4.499999999999998), prj(-2.71892336110995, 0.0, 4.732145214777903), prj(-2.8190778623577253, 0.0, 4.973939570022994), prj(-2.897777478867205, 0.0, 5.223542864692438), prj(-2.954423259036624, 0.0, 5.479055466999209), prj(-2.988584094275237, 0.0, 5.738532771757025), prj(-3.0, 0.0, 5.999999999999999))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.4
      let p2_1 = prj(0 - pw2*-0.0 - pw2*-0.0, 9 - pw2*1.0 - pw2*-0.0, 6 - pw2*0.0 - pw2*1.0)
      let p2_2 = prj(0 + pw2*-0.0 - pw2*-0.0, 9 + pw2*1.0 - pw2*-0.0, 6 + pw2*0.0 - pw2*1.0)
      let p2_3 = prj(0 + pw2*-0.0 + pw2*-0.0, 9 + pw2*1.0 + pw2*-0.0, 6 + pw2*0.0 + pw2*1.0)
      let p2_4 = prj(0 - pw2*-0.0 + pw2*-0.0, 9 - pw2*1.0 + pw2*-0.0, 6 - pw2*0.0 + pw2*1.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(0.0, 13.0, 6.0), prj(0.0, 12.984778792366981, 6.3486229709906326), prj(0.0, 12.939231012048833, 6.694592710667721), prj(0.0, 12.863703305156273, 7.035276180410083), prj(0.0, 12.758770483143634, 7.368080573302675), prj(0.0, 12.6252311481466, 7.690473046962798), prj(0.0, 12.464101615137755, 8.0), prj(0.0, 12.276608177155968, 8.294305745404184), prj(0.0, 12.064177772475912, 8.571150438746157), prj(0.0, 11.82842712474619, 8.82842712474619), prj(0.0, 11.571150438746157, 9.064177772475912), prj(0.0, 11.294305745404184, 9.276608177155968), prj(0.0, 11.0, 9.464101615137753), prj(0.0, 10.690473046962797, 9.6252311481466), prj(0.0, 10.368080573302676, 9.758770483143634), prj(0.0, 10.035276180410083, 9.863703305156273), prj(0.0, 9.694592710667722, 9.939231012048833), prj(0.0, 9.348622970990633, 9.984778792366981), prj(0.0, 9.0, 10.0), prj(0.0, 8.651377029009367, 9.984778792366981), prj(0.0, 8.30540728933228, 9.939231012048833), prj(0.0, 7.964723819589917, 9.863703305156273), prj(0.0, 7.631919426697325, 9.758770483143634), prj(0.0, 7.309526953037203, 9.6252311481466), prj(0.0, 7.000000000000001, 9.464101615137755), prj(0.0, 6.705694254595816, 9.276608177155968), prj(0.0, 6.428849561253843, 9.064177772475912), prj(0.0, 6.17157287525381, 8.82842712474619), prj(0.0, 5.935822227524088, 8.571150438746159), prj(0.0, 5.723391822844032, 8.294305745404184), prj(0.0, 5.535898384862245, 8.0), prj(0.0, 5.3747688518534, 7.690473046962798), prj(0.0, 5.241229516856366, 7.3680805733026755), prj(0.0, 5.136296694843727, 7.035276180410084), prj(0.0, 5.0607689879511675, 6.694592710667721), prj(0.0, 5.015221207633018, 6.3486229709906326), prj(0.0, 5.0, 6.000000000000001), prj(0.0, 5.015221207633018, 5.651377029009368), prj(0.0, 5.0607689879511675, 5.305407289332278), prj(0.0, 5.136296694843727, 4.964723819589917), prj(0.0, 5.241229516856366, 4.631919426697325), prj(0.0, 5.3747688518534, 4.309526953037203), prj(0.0, 5.535898384862246, 3.9999999999999996), prj(0.0, 5.723391822844032, 3.7056942545958154), prj(0.0, 5.935822227524088, 3.428849561253843), prj(0.0, 6.171572875253809, 3.1715728752538106), prj(0.0, 6.428849561253841, 2.9358222275240884), prj(0.0, 6.705694254595814, 2.7233918228440337), prj(0.0, 6.999999999999998, 2.5358983848622465), prj(0.0, 7.309526953037204, 2.3747688518533994), prj(0.0, 7.631919426697326, 2.2412295168563663), prj(0.0, 7.964723819589917, 2.1362966948437268), prj(0.0, 8.305407289332278, 2.060768987951168), prj(0.0, 8.651377029009367, 2.015221207633018), prj(0.0, 9.0, 2.0), prj(0.0, 9.34862297099063, 2.015221207633018), prj(0.0, 9.69459271066772, 2.0607689879511675), prj(0.0, 10.035276180410081, 2.1362966948437263), prj(0.0, 10.368080573302676, 2.2412295168563667), prj(0.0, 10.690473046962799, 2.3747688518534007), prj(0.0, 11.0, 2.5358983848622456), prj(0.0, 11.294305745404184, 2.723391822844033), prj(0.0, 11.571150438746157, 2.9358222275240875), prj(0.0, 11.82842712474619, 3.1715728752538093), prj(0.0, 12.064177772475912, 3.4288495612538417), prj(0.0, 12.276608177155966, 3.7056942545958145), prj(0.0, 12.464101615137753, 3.9999999999999982), prj(0.0, 12.6252311481466, 4.309526953037203), prj(0.0, 12.758770483143634, 4.631919426697326), prj(0.0, 12.863703305156273, 4.964723819589917), prj(0.0, 12.939231012048833, 5.305407289332279), prj(0.0, 12.984778792366981, 5.651377029009367), prj(0.0, 13.0, 5.999999999999999))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(3, 0, 6)
    let N = prj(0, 5, 6)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(0.0, 0.0, 6.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ nằm trên mặt phẳng $y=0$, tâm $J_1(0; 0; 6)$, bán kính $R_1 = 3$.
  - $(C_2)$ nằm trên mặt phẳng $x=0$, tâm $J_2(0; 9; 6)$, bán kính $R_2 = 4$.
]
#note[
  *Lưu ý sư phạm:* Trục của đường tròn thứ nhất song song với trục $O y$, trục của đường tròn thứ hai song song với trục $O x$. Đây là bài toán cực trị khoảng cách giữa hai đường tròn ở vị trí chéo nhau nằm trên hai mặt phẳng vuông góc.
]
*Bước 1 (Xác định tính chất hình học):*
- Đường tròn $(C_1)$ nằm trên mặt phẳng $y=0$ (mặt phẳng $O x z$).
- Đường tròn $(C_2)$ nằm trên mặt phẳng $x=0$ (mặt phẳng $O y z$).
Tâm của hai đường tròn là $J_1(0; 0; 6)$ và $J_2(0; 9; 6)$ có cùng cao độ $z = 6$.

*Bước 2 (Xác định đoạn vuông góc chung):*
Đường thẳng nối hai tâm $J_1 J_2$ đi qua $J_1(0;0;6)$ và $J_2(0;9;6)$ song song với trục tung $O y$.
- Đường thẳng $J_1 J_2$ vuông góc với mặt phẳng $y=0$ tại $J_1$.
- Đường thẳng $J_1 J_2$ vuông góc với mặt phẳng $x=0$ tại điểm có tọa độ $(0; 9; 6)$.
Do đó, đoạn thẳng $J_1 J_2$ chính là đoạn vuông góc chung giữa hai mặt phẳng chứa hai đường tròn. Khoảng cách giữa hai tâm là:
$ J_1 J_2 = 9 $

*Bước 3 (Tính khoảng cách cực tiểu giữa hai đường tròn):*
Vì đường nối hai tâm là đoạn vuông góc chung của hai mặt phẳng, khoảng cách ngắn nhất giữa hai điểm $M in (C_1)$ và $N in (C_2)$ đạt được khi chúng nằm trên đoạn thẳng nối hai tâm này:
$ M N_(min) = J_1 J_2 - R_1 - R_2 = 9 - 3 - 4 = 2 $
(Đạt được tại điểm $M(3; 0; 6)$ và $N(0; 5; 6)$).
  ]
)

#tln(
  [(Ứng dụng thực tế: Thiết kế khoảng cách an toàn) Hai Flycam nông nghiệp quét sóng vô tuyến trên hai quỹ đạo tròn trong không gian. Quỹ đạo của Flycam 1 là đường tròn $(C_1)$ nằm trên mặt phẳng nghiêng $(P_1): x + y + z - 6 = 0$, có tâm $J_1(2;2;2)$, bán kính $R_1 = 3$. Quỹ đạo của Flycam 2 là đường tròn $(C_2)$ nằm trên mặt phẳng song song với $(P_1)$, có phương trình $(P_2): x + y + z - 15 = 0$, có tâm $J_2(5;5;5)$, bán kính $R_2 = 2$. Tính khoảng cách gần nhau nhất giữa hai Flycam trong quá trình hoạt động?],
  [$2 sqrt(7)$],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(2, 2, 2)
    let J2 = prj(5, 5, 5)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 6.0
    let p1_1 = prj(2 - pw1*-0.7071067811865476 - pw1*-0.40824829046386313, 2 - pw1*0.7071067811865476 - pw1*-0.40824829046386313, 2 - pw1*0.0 - pw1*0.8164965809277258)
    let p1_2 = prj(2 + pw1*-0.7071067811865476 - pw1*-0.40824829046386313, 2 + pw1*0.7071067811865476 - pw1*-0.40824829046386313, 2 + pw1*0.0 - pw1*0.8164965809277258)
    let p1_3 = prj(2 + pw1*-0.7071067811865476 + pw1*-0.40824829046386313, 2 + pw1*0.7071067811865476 + pw1*-0.40824829046386313, 2 + pw1*0.0 + pw1*0.8164965809277258)
    let p1_4 = prj(2 - pw1*-0.7071067811865476 + pw1*-0.40824829046386313, 2 - pw1*0.7071067811865476 + pw1*-0.40824829046386313, 2 - pw1*0.0 + pw1*0.8164965809277258)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(-0.12132034355964283, 4.121320343559643, 2.0), prj(-0.21999162815079545, 4.006504530265757, 2.213487097885038), prj(-0.30176743598412537, 3.8764180059359883, 2.425349430048137), prj(-0.3660254037844392, 3.732050807568877, 2.633974596215561), prj(-0.41227648961675356, 3.574501656715295, 2.8377748329014576), prj(-0.44016869479071574, 3.4049695975440155, 3.035199097246699), prj(-0.44948974278317844, 3.2247448713915894, 3.2247448713915885), prj(-0.44016869479071585, 3.0351990972466996, 3.4049695975440155), prj(-0.41227648961675334, 2.837774832901458, 3.5745016567152943), prj(-0.36602540378443904, 2.633974596215561, 3.7320508075688767), prj(-0.3017674359841257, 2.425349430048137, 3.876418005935988), prj(-0.21999162815079565, 2.2134870978850376, 4.006504530265756), prj(-0.12132034355964327, 2.0, 4.121320343559642), prj(-0.006504530265757369, 1.7865129021149615, 4.219991628150794), prj(0.12358199406401105, 1.5746505699518634, 4.301767435984124), prj(0.26794919243112236, 1.3660254037844384, 4.366025403784438), prj(0.4254983432847044, 1.162225167098542, 4.412276489616753), prj(0.5950304024559838, 0.9648009027532995, 4.4401686947907155), prj(0.7752551286084104, 0.7752551286084106, 4.449489742783177), prj(0.9648009027533, 0.5950304024559836, 4.4401686947907155), prj(1.1622251670985415, 0.4254983432847048, 4.412276489616753), prj(1.3660254037844384, 0.26794919243112214, 4.366025403784438), prj(1.5746505699518627, 0.12358199406401127, 4.301767435984125), prj(1.7865129021149613, -0.006504530265757369, 4.219991628150795), prj(1.9999999999999991, -0.12132034355964283, 4.121320343559642), prj(2.2134870978850376, -0.21999162815079565, 4.006504530265756), prj(2.4253494300481364, -0.3017674359841255, 3.876418005935988), prj(2.6339745962155607, -0.36602540378443904, 3.7320508075688767), prj(2.837774832901457, -0.41227648961675334, 3.574501656715295), prj(3.0351990972467, -0.44016869479071585, 3.404969597544015), prj(3.2247448713915894, -0.44948974278317844, 3.2247448713915885), prj(3.4049695975440155, -0.44016869479071585, 3.0351990972466996), prj(3.5745016567152947, -0.4122764896167533, 2.837774832901458), prj(3.7320508075688767, -0.3660254037844391, 2.6339745962155616), prj(3.8764180059359887, -0.30176743598412525, 2.4253494300481364), prj(4.006504530265757, -0.21999162815079548, 2.213487097885038), prj(4.121320343559643, -0.12132034355964298, 2.0000000000000004), prj(4.219991628150795, -0.006504530265757605, 1.7865129021149626), prj(4.301767435984125, 0.12358199406401166, 1.5746505699518631), prj(4.366025403784439, 0.26794919243112236, 1.3660254037844388), prj(4.412276489616754, 0.4254983432847046, 1.1622251670985424), prj(4.4401686947907155, 0.5950304024559838, 0.9648009027533009), prj(4.449489742783179, 0.7752551286084111, 0.7752551286084108), prj(4.4401686947907155, 0.9648009027533004, 0.5950304024559843), prj(4.412276489616754, 1.162225167098542, 0.4254983432847055), prj(4.366025403784438, 1.3660254037844384, 0.2679491924311237), prj(4.301767435984126, 1.5746505699518627, 0.12358199406401238), prj(4.219991628150796, 1.7865129021149615, -0.006504530265756259), prj(4.121320343559644, 1.999999999999999, -0.1213203435596415), prj(4.006504530265757, 2.2134870978850394, -0.2199916281507952), prj(3.8764180059359883, 2.4253494300481377, -0.3017674359841247), prj(3.732050807568877, 2.633974596215562, -0.3660254037844384), prj(3.5745016567152956, 2.8377748329014585, -0.41227648961675234), prj(3.4049695975440164, 3.0351990972467, -0.4401686947907151), prj(3.22474487139159, 3.224744871391589, -0.44948974278317744), prj(3.035199097246701, 3.4049695975440155, -0.4401686947907151), prj(2.8377748329014594, 3.574501656715295, -0.4122764896167528), prj(2.6339745962155625, 3.7320508075688767, -0.3660254037844384), prj(2.4253494300481364, 3.8764180059359896, -0.30176743598412425), prj(2.2134870978850376, 4.006504530265757, -0.21999162815079387), prj(2.0, 4.121320343559643, -0.12132034355964194), prj(1.7865129021149622, 4.219991628150796, -0.006504530265756259), prj(1.5746505699518636, 4.301767435984125, 0.12358199406401171), prj(1.3660254037844395, 4.366025403784438, 0.26794919243112303), prj(1.1622251670985426, 4.412276489616753, 0.4254983432847048), prj(0.9648009027533011, 4.4401686947907155, 0.595030402455984), prj(0.7752551286084121, 4.449489742783179, 0.7752551286084102), prj(0.5950304024559836, 4.4401686947907155, 0.9648009027533013), prj(0.4254983432847045, 4.412276489616754, 1.1622251670985426), prj(0.2679491924311222, 4.366025403784438, 1.366025403784439), prj(0.12358199406401157, 4.301767435984125, 1.5746505699518631), prj(-0.006504530265757161, 4.219991628150795, 1.7865129021149617), prj(-0.12132034355964252, 4.121320343559643, 1.9999999999999993))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(5 - pw2*-0.7071067811865476 - pw2*-0.40824829046386313, 5 - pw2*0.7071067811865476 - pw2*-0.40824829046386313, 5 - pw2*0.0 - pw2*0.8164965809277258)
      let p2_2 = prj(5 + pw2*-0.7071067811865476 - pw2*-0.40824829046386313, 5 + pw2*0.7071067811865476 - pw2*-0.40824829046386313, 5 + pw2*0.0 - pw2*0.8164965809277258)
      let p2_3 = prj(5 + pw2*-0.7071067811865476 + pw2*-0.40824829046386313, 5 + pw2*0.7071067811865476 + pw2*-0.40824829046386313, 5 + pw2*0.0 + pw2*0.8164965809277258)
      let p2_4 = prj(5 - pw2*-0.7071067811865476 + pw2*-0.40824829046386313, 5 - pw2*0.7071067811865476 + pw2*-0.40824829046386313, 5 - pw2*0.0 + pw2*0.8164965809277258)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(3.585786437626905, 6.414213562373095, 5.0), prj(3.520005581232803, 6.337669686843838, 5.142324731923359), prj(3.4654883760105832, 6.250945337290659, 5.283566286698758), prj(3.422649730810374, 6.154700538379252, 5.422649730810374), prj(3.391815673588831, 6.04966777114353, 5.558516555267638), prj(3.3732208701395225, 5.936646398362678, 5.690132731497799), prj(3.3670068381445475, 5.816496580927726, 5.816496580927725), prj(3.373220870139523, 5.690132731497799, 5.936646398362677), prj(3.391815673588831, 5.558516555267638, 6.04966777114353), prj(3.4226497308103743, 5.422649730810374, 6.154700538379251), prj(3.4654883760105832, 5.283566286698758, 6.250945337290658), prj(3.5200055812328026, 5.142324731923359, 6.337669686843838), prj(3.585786437626904, 5.0, 6.414213562373094), prj(3.6623303131561618, 4.857675268076641, 6.4799944187671965), prj(3.749054662709341, 4.716433713301242, 6.534511623989417), prj(3.8452994616207485, 4.577350269189625, 6.577350269189625), prj(3.9503322288564697, 4.441483444732361, 6.608184326411168), prj(4.063353601637322, 4.309867268502201, 6.626779129860477), prj(4.183503419072274, 4.183503419072274, 6.632993161855452), prj(4.309867268502201, 4.063353601637322, 6.626779129860477), prj(4.441483444732361, 3.9503322288564697, 6.608184326411168), prj(4.577350269189626, 3.8452994616207476, 6.577350269189625), prj(4.716433713301242, 3.7490546627093404, 6.534511623989417), prj(4.857675268076641, 3.6623303131561618, 6.4799944187671965), prj(4.999999999999999, 3.585786437626905, 6.414213562373095), prj(5.142324731923359, 3.5200055812328026, 6.337669686843838), prj(5.283566286698758, 3.4654883760105832, 6.250945337290658), prj(5.422649730810374, 3.422649730810374, 6.1547005383792515), prj(5.558516555267638, 3.391815673588831, 6.04966777114353), prj(5.6901327314978, 3.3732208701395225, 5.936646398362677), prj(5.816496580927726, 3.3670068381445475, 5.816496580927725), prj(5.936646398362678, 3.3732208701395225, 5.690132731497799), prj(6.04966777114353, 3.391815673588831, 5.558516555267639), prj(6.154700538379251, 3.4226497308103743, 5.422649730810375), prj(6.250945337290659, 3.4654883760105832, 5.283566286698758), prj(6.337669686843838, 3.520005581232803, 5.142324731923359), prj(6.414213562373095, 3.585786437626905, 5.0), prj(6.4799944187671965, 3.6623303131561618, 4.857675268076641), prj(6.534511623989417, 3.7490546627093413, 4.716433713301242), prj(6.577350269189626, 3.8452994616207485, 4.577350269189626), prj(6.608184326411169, 3.95033222885647, 4.441483444732362), prj(6.626779129860477, 4.063353601637322, 4.309867268502201), prj(6.6329931618554525, 4.183503419072274, 4.183503419072274), prj(6.626779129860477, 4.309867268502201, 4.063353601637323), prj(6.608184326411169, 4.441483444732362, 3.95033222885647), prj(6.577350269189626, 4.577350269189626, 3.845299461620749), prj(6.534511623989418, 4.7164337133012415, 3.7490546627093417), prj(6.479994418767197, 4.857675268076641, 3.6623303131561626), prj(6.414213562373096, 5.0, 3.585786437626906), prj(6.337669686843839, 5.14232473192336, 3.5200055812328035), prj(6.250945337290658, 5.2835662866987585, 3.4654883760105832), prj(6.1547005383792515, 5.422649730810375, 3.4226497308103747), prj(6.049667771143531, 5.558516555267639, 3.391815673588832), prj(5.936646398362678, 5.690132731497799, 3.3732208701395234), prj(5.816496580927726, 5.816496580927726, 3.3670068381445484), prj(5.6901327314978, 5.936646398362677, 3.3732208701395234), prj(5.55851655526764, 6.04966777114353, 3.3918156735888316), prj(5.422649730810375, 6.1547005383792515, 3.4226497308103747), prj(5.283566286698758, 6.250945337290659, 3.4654883760105837), prj(5.142324731923359, 6.337669686843838, 3.520005581232804), prj(5.0, 6.414213562373096, 3.5857864376269055), prj(4.857675268076641, 6.479994418767197, 3.662330313156162), prj(4.716433713301242, 6.534511623989417, 3.7490546627093413), prj(4.577350269189626, 6.577350269189626, 3.8452994616207485), prj(4.441483444732362, 6.608184326411169, 3.9503322288564697), prj(4.309867268502201, 6.626779129860477, 4.063353601637322), prj(4.183503419072275, 6.632993161855452, 4.183503419072274), prj(4.063353601637322, 6.626779129860477, 4.309867268502201), prj(3.95033222885647, 6.608184326411169, 4.441483444732362), prj(3.845299461620748, 6.577350269189626, 4.577350269189626), prj(3.749054662709341, 6.534511623989417, 4.716433713301242), prj(3.6623303131561618, 6.479994418767197, 4.857675268076641), prj(3.585786437626905, 6.414213562373095, 5.0))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    // Hình chiếu của (C2) lên mặt phẳng (C1)
    let pts2_proj = (prj(0.5857864376269051, 3.414213562373095, 2.0), prj(0.46548837601058324, 3.250945337290659, 2.2835662866987576), prj(0.3918156735888312, 3.04966777114353, 2.558516555267638), prj(0.3670068381445475, 2.8164965809277263, 2.8164965809277254), prj(0.3918156735888312, 2.558516555267638, 3.04966777114353), prj(0.46548837601058324, 2.2835662866987576, 3.2509453372906583), prj(0.5857864376269046, 2.0000000000000004, 3.4142135623730945), prj(0.7490546627093408, 1.7164337133012424, 3.5345116239894168), prj(0.9503322288564702, 1.4414834447323615, 3.6081843264111684), prj(1.1835034190722737, 1.1835034190722737, 3.6329931618554516), prj(1.4414834447323615, 0.9503322288564702, 3.6081843264111684), prj(1.7164337133012424, 0.7490546627093404, 3.5345116239894168), prj(1.9999999999999991, 0.5857864376269051, 3.414213562373095), prj(2.2835662866987576, 0.46548837601058324, 3.2509453372906583), prj(2.558516555267638, 0.3918156735888312, 3.04966777114353), prj(2.8164965809277263, 0.3670068381445475, 2.8164965809277254), prj(3.04966777114353, 0.3918156735888312, 2.558516555267639), prj(3.250945337290659, 0.46548837601058324, 2.2835662866987576), prj(3.414213562373095, 0.5857864376269051, 2.0), prj(3.5345116239894168, 0.7490546627093413, 1.7164337133012424), prj(3.608184326411169, 0.9503322288564702, 1.441483444732362), prj(3.6329931618554525, 1.1835034190722737, 1.1835034190722737), prj(3.608184326411169, 1.441483444732362, 0.9503322288564702), prj(3.5345116239894177, 1.7164337133012415, 0.7490546627093417), prj(3.4142135623730954, 1.9999999999999996, 0.5857864376269055), prj(3.2509453372906583, 2.2835662866987585, 0.46548837601058324), prj(3.0496677711435303, 2.5585165552676385, 0.3918156735888316), prj(2.8164965809277263, 2.8164965809277263, 0.3670068381445484), prj(2.5585165552676394, 3.0496677711435294, 0.3918156735888312), prj(2.2835662866987576, 3.250945337290659, 0.4654883760105837), prj(1.9999999999999996, 3.4142135623730954, 0.5857864376269051), prj(1.7164337133012424, 3.5345116239894168, 0.7490546627093413), prj(1.441483444732362, 3.608184326411169, 0.9503322288564697), prj(1.1835034190722746, 3.6329931618554516, 1.1835034190722737), prj(0.9503322288564702, 3.608184326411169, 1.441483444732362), prj(0.7490546627093408, 3.5345116239894168, 1.7164337133012424), prj(0.5857864376269051, 3.414213562373095, 2.0))
    line(..pts2_proj, stroke: (dash: "dashed", paint: rgb("#b45309"), thickness: 1pt))
    let J2_p = prj(2.0, 2.0, 2.0)
    circle(J2_p, radius: 1.5pt, fill: rgb("#b45309"))
    content(J2_p, [$J_2'$], anchor: "north-east", padding: 2pt)
    line(J2, J2_p, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(-0.12132034355964283, 4.121320343559643, 2.0)
    let N = prj(3.585786437626905, 6.414213562373095, 5.0)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(0.5857864376269051, 3.414213562373095, 2.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ tâm $J_1(2; 2; 2)$, bán kính $R_1 = 3$, nằm trên mặt phẳng $(P_1): x + y + z - 6 = 0$.
  - $(C_2)$ tâm $J_2(5; 5; 5)$, bán kính $R_2 = 2$, nằm trên mặt phẳng $(P_2): x + y + z - 15 = 0$.
]
#note[
  *Lưu ý sư phạm:* Bài toán thực tế đưa ra hai phương trình mặt phẳng nghiêng nhưng song song. Bằng cách chiếu vuông góc tâm $J_2$ lên mặt phẳng $(P_1)$, ta chứng minh được hình chiếu này trùng với $J_1$, tức là cấu hình *đồng trục* trên hai mặt phẳng song song.
]
*Bước 1:* Tính khoảng cách $h$ giữa hai mặt phẳng song song $(P_1)$ và $(P_2)$:
$ h = d((P_1), (P_2)) = (|6 - 15|)/sqrt(1^2 + 1^2 + 1^2) = 9/sqrt(3) = 3sqrt(3). $
*Bước 2:* Tìm hình chiếu của tâm $J_2(5;5;5)$ lên $(P_1)$.
Đường thẳng qua $J_2$ vuông góc với $(P_1)$ có dạng: $x = 5+t, y = 5+t, z = 5+t$.
Giao điểm với $(P_1)$ là: $(5+t) + (5+t) + (5+t) - 6 = 0 => 3t + 9 = 0 => t = -3$.
Tọa độ hình chiếu là $J_2'(2, 2, 2) equiv J_1$.
Do đó, hai đường tròn đồng trục.
*Bước 3:* Khoảng cách ngang tối thiểu là:
$ d_("ngang") = |R_1 - R_2| = |3 - 2| = 1. $
*Bước 4:* Áp dụng công thức khoảng cách không gian nhỏ nhất:
$ M N_(min) = sqrt(h^2 + d_("ngang")^2) = sqrt((3sqrt(3))^2 + 1^2) = sqrt(27 + 1) = sqrt(28) = 2sqrt(7). $
  ]
)

#tln(
  [(Ứng dụng thực tế: Thiết kế cáp kết nối) Một đĩa mặt trời nhân tạo thu năng lượng là đường tròn $(C)$ có tâm $J(2; 2; 2)$, bán kính $R_C = 5$ được lắp đặt nằm trên mặt dốc $(P): 2x + 2y - z - 6 = 0$. Một quả cầu trữ năng lượng $(S): (x-11)^2 + (y-14)^2 + (z-15)^2 = 4$ bay lơ lửng bên trên. Tìm độ dài đoạn cáp ngắn nhất kết nối quả cầu với viền của đĩa mặt trời?],
  [13.67],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J = prj(2, 2, 2)
    let I = prj(11, 14, 15)
    
    // Mặt phẳng chứa đường tròn
    let pw = 8.0
    let p_1 = prj(2 - pw*-0.7071067811865476 - pw*0.23570226039551584, 2 - pw*0.7071067811865476 - pw*0.23570226039551584, 2 - pw*0.0 - pw*0.9428090415820634)
    let p_2 = prj(2 + pw*-0.7071067811865476 - pw*0.23570226039551584, 2 + pw*0.7071067811865476 - pw*0.23570226039551584, 2 + pw*0.0 - pw*0.9428090415820634)
    let p_3 = prj(2 + pw*-0.7071067811865476 + pw*0.23570226039551584, 2 + pw*0.7071067811865476 + pw*0.23570226039551584, 2 + pw*0.0 + pw*0.9428090415820634)
    let p_4 = prj(2 - pw*-0.7071067811865476 + pw*0.23570226039551584, 2 - pw*0.7071067811865476 + pw*0.23570226039551584, 2 - pw*0.0 + pw*0.9428090415820634)
    line(p_1, p_2, p_3, p_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = (prj(-1.5355339059327378, 5.535533905932738, 2.0), prj(-1.419366104153428, 5.624794159874159, 2.410856111441462), prj(-1.2771748616518064, 5.6864675415483825, 2.8185853597931523), prj(-1.1100423396407313, 5.720084679281463, 3.220084679281462), prj(-0.9192405175300822, 5.725389726356666, 3.612298417653168), prj(-0.7062215123954098, 5.702342308162476, 3.9922415915341323), prj(-0.4726065274901835, 5.651117829467763, 4.3570226039551585), prj(-0.22017351391011464, 5.5721061394855775, 4.703865251150925), prj(0.04915636068823026, 5.465908564885248, 5.030129851146958), prj(0.3333333333333328, 5.333333333333333, 5.333333333333333), prj(0.630194645672618, 5.175389422393055, 5.6111681361313455), prj(0.9374810038694206, 4.99327888059581, 5.861519768930461), prj(1.252853773193288, 4.788387679126027, 6.0824829046386295), prj(1.5739127764423815, 4.56227516374358, 6.272375880371923), prj(1.8982145607412477, 4.316662187221001, 6.429753495924498), prj(2.2232909936926024, 4.053418012614795, 6.553418012614795), prj(2.546668047355167, 3.774546087044896, 6.642428268800126), prj(2.8658846270901677, 3.4821687942523614, 6.696106842685058), prj(3.1785113019775793, 3.1785113019775793, 6.714045207910317), prj(3.4821687942523614, 2.8658846270901677, 6.696106842685058), prj(3.7745460870448957, 2.5466680473551673, 6.642428268800126), prj(4.053418012614795, 2.223290993692602, 6.553418012614795), prj(4.3166621872210005, 1.8982145607412484, 6.429753495924499), prj(4.56227516374358, 1.5739127764423821, 6.272375880371924), prj(4.788387679126026, 1.2528537731932896, 6.082482904638631), prj(4.99327888059581, 0.9374810038694206, 5.861519768930461), prj(5.175389422393055, 0.630194645672618, 5.6111681361313455), prj(5.333333333333333, 0.33333333333333337, 5.333333333333334), prj(5.465908564885249, 0.049156360688230594, 5.030129851146959), prj(5.572106139485578, -0.22017351391011564, 4.7038652511509245), prj(5.651117829467763, -0.4726065274901835, 4.3570226039551585), prj(5.702342308162476, -0.7062215123954098, 3.9922415915341323), prj(5.725389726356666, -0.9192405175300815, 3.612298417653169), prj(5.720084679281462, -1.1100423396407306, 3.220084679281463), prj(5.6864675415483825, -1.2771748616518064, 2.818585359793152), prj(5.624794159874159, -1.419366104153428, 2.4108561114414626), prj(5.535533905932738, -1.5355339059327375, 2.0000000000000004), prj(5.419366104153428, -1.6247941598741589, 1.5891438885585387), prj(5.277174861651806, -1.6864675415483827, 1.181414640206847), prj(5.1100423396407315, -1.7200846792814624, 0.7799153207185379), prj(4.919240517530082, -1.7253897263566662, 0.38770158234683194), prj(4.706221512395411, -1.7023423081624762, 0.007758408465868616), prj(4.472606527490183, -1.6511178294677622, -0.35702260395515895), prj(4.220173513910114, -1.5721061394855775, -0.7038652511509258), prj(3.950843639311769, -1.4659085648852486, -1.0301298511469574), prj(3.666666666666668, -1.333333333333334, -1.3333333333333326), prj(3.3698053543273834, -1.175389422393056, -1.611168136131345), prj(3.0625189961305805, -0.9932788805958106, -1.8615197689304601), prj(2.7471462268067137, -0.7883876791260276, -2.0824829046386286), prj(2.4260872235576167, -0.5622751637435792, -2.272375880371925), prj(2.1017854392587507, -0.31666218722100026, -2.4297534959244986), prj(1.7767090063073976, -0.053418012614795174, -2.553418012614795), prj(1.4533319526448327, 0.2254539129551043, -2.642428268800126), prj(1.1341153729098323, 0.5178312057476384, -2.696106842685058), prj(0.8214886980224212, 0.8214886980224201, -2.714045207910317), prj(0.5178312057476397, 1.1341153729098314, -2.696106842685058), prj(0.22545391295510542, 1.4533319526448312, -2.642428268800127), prj(-0.053418012614794064, 1.776709006307396, -2.553418012614796), prj(-0.31666218722100203, 2.1017854392587534, -2.4297534959244977), prj(-0.5622751637435808, 2.426087223557619, -2.272375880371923), prj(-0.7883876791260263, 2.7471462268067115, -2.0824829046386295), prj(-0.9932788805958095, 3.0625189961305788, -1.861519768930461), prj(-1.1753894223930548, 3.3698053543273816, -1.611168136131346), prj(-1.333333333333333, 3.6666666666666665, -1.3333333333333344), prj(-1.465908564885249, 3.9508436393117687, -1.0301298511469592), prj(-1.5721061394855773, 4.220173513910114, -0.7038652511509271), prj(-1.6511178294677618, 4.472606527490182, -0.3570226039551603), prj(-1.702342308162476, 4.706221512395411, 0.00775840846586906), prj(-1.725389726356666, 4.919240517530082, 0.3877015823468326), prj(-1.7200846792814624, 5.1100423396407315, 0.7799153207185381), prj(-1.6864675415483825, 5.277174861651806, 1.1814146402068475), prj(-1.6247941598741593, 5.419366104153427, 1.589143888558537), prj(-1.535533905932738, 5.535533905932738, 1.999999999999999))
    line(..pts, stroke: 1.2pt + rgb("#16a34a"))
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Mặt cầu (S) hình vẽ 3D
    circle(I, radius: 2, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    circle(I, radius: (2, 0.5), stroke: (dash: "dashed", paint: rgb("#ca8a04"), thickness: 0.5pt))
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-east", padding: 3pt)
    
    line(J, I, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(2.7370432122014896, 3.6022678526119343, 6.678622129626848)
    let N = prj(9.945562870088821, 12.673143872751858, 13.938107747156643)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))
    
    // Gióng hình chiếu I xuống mặt phẳng
    let I_p = prj(4.555555555555555, 7.555555555555555, 18.22222222222222)
    circle(I_p, radius: 1.5pt, fill: gray)
    line(I, I_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, I_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C)$ có tâm $J(2; 2; 2)$, bán kính $R_C = 5$, nằm trên mặt phẳng $(P): 2x + 2y - z - 6 = 0$.
  - $(S)$ có tâm $I(11; 14; 15)$, bán kính $R_S = 2$.
]
#note[
  *Lưu ý sư phạm (Khắc phục hình vẽ):* Đây là bài toán khoảng cách từ viền đường tròn đến mặt cầu. Ta chiếu tâm mặt cầu $I$ xuống mặt phẳng $(P)$ được điểm $I'$. Bài toán chuyển về tìm điểm gần nhất trên đường tròn đối với hình chiếu $I'$, rồi dùng định lý Pytago không gian để tính khoảng cách từ $I$ đến đường tròn, cuối cùng trừ đi bán kính mặt cầu $R_S$.
]
*Bước 1:* Tính khoảng cách đứng $h$ từ tâm mặt cầu $I(11;14;15)$ đến mặt phẳng $(P)$:
$ h = d(I, (P)) = (|2 times 11 + 2 times 14 - 15 - 6|)/sqrt(2^2 + 2^2 + (-1)^2) = (|22 + 28 - 21|)/3 = 29/3. $
*Bước 2:* Xác định tọa độ hình chiếu vuông góc $I'$ của $I$ lên $(P)$:
Đường thẳng đi qua $I$ vuông góc với $(P)$ có phương trình: $x = 11 + 2t, y = 14 + 2t, z = 15 - t$.
Thế vào phương trình $(P)$: $2(11+2t) + 2(14+2t) - (15-t) - 6 = 0 => 9t + 29 = 0 => t = -29/9$.
Tọa độ điểm $I'$ là:
$ x_(I') = 41/9, quad y_(I') = 68/9, quad z_(I') = 164/9. $
*Bước 3:* Tính khoảng cách từ tâm đĩa $J(2;2;2)$ đến hình chiếu $I'$:
$ J I'^2 = (41/9 - 2)^2 + (68/9 - 2)^2 + (164/9 - 2)^2 = (23/9)^2 + (50/9)^2 + (146/9)^2 = 24345/81. $
$ J I' = sqrt(24345)/9 approx 17.34. $
Vì $J I' > R_C = 5$, nên điểm $I'$ nằm ngoài đường tròn $(C)$.
Khoảng cách ngang ngắn nhất giữa $(C)$ và hình chiếu $I'$ là:
$ d_("ngang") = J I' - R_C = sqrt(24345)/9 - 5 approx 12.34. $
*Bước 4:* Khoảng cách từ tâm quả cầu $I$ đến viền đĩa ngắn nhất:
$ d(I, (C)) = sqrt(h^2 + d_("ngang")^2) = sqrt((29/3)^2 + (sqrt(24345)/9 - 5)^2) approx 15.67. $
*Bước 5:* Độ dài đoạn cáp ngắn nhất bằng khoảng cách cực tiểu từ viền đĩa đến quả cầu:
$ d_(min) = d(I, (C)) - R_S approx 15.67 - 2 = 13.67. $
  ]
)

#tln(
  [(Ứng dụng thực tế: Thiết bị cảm biến tuabin gió - BẪY CHIẾU CẮT NHAU) Trong một hệ thống tuabin gió, hai đĩa xoay cảm biến tròn $(C_1)$ và $(C_2)$ được đặt song song với nhau. Đĩa $(C_1)$ nằm trên mặt đáy phẳng $(P_1): z = 0$ có tâm $J_1(0; 0; 0)$ và bán kính $R_1 = 5$ dm. Đĩa cảm biến thứ hai $(C_2)$ nằm trên mặt phẳng song song $(P_2): z = 4$ có tâm lệch trục tại $J_2(3; 0; 4)$ và bán kính $R_2 = 3$ dm. Một kỹ sư cần đo khoảng cách ngắn nhất giữa một điểm $M$ chạy trên viền của đĩa $(C_1)$ và một điểm $N$ chạy trên viền của đĩa $(C_2)$. Hãy giúp kỹ sư xác định khoảng cách ngắn nhất này?],
  [4],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(3, 0, 4)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 8.0
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(5.0, 0.0, 0.0), prj(4.9809734904587275, 0.4357787137382908, 0.0), prj(4.92403876506104, 0.8682408883346516, 0.0), prj(4.8296291314453415, 1.2940952255126037, 0.0), prj(4.698463103929543, 1.7101007166283435, 0.0), prj(4.531538935183249, 2.1130913087034973, 0.0), prj(4.330127018922194, 2.4999999999999996, 0.0), prj(4.095760221444959, 2.8678821817552302, 0.0), prj(3.83022221559489, 3.2139380484326963, 0.0), prj(3.5355339059327378, 3.5355339059327373, 0.0), prj(3.2139380484326967, 3.83022221559489, 0.0), prj(2.8678821817552307, 4.095760221444959, 0.0), prj(2.5000000000000004, 4.330127018922193, 0.0), prj(2.1130913087034973, 4.531538935183249, 0.0), prj(1.7101007166283442, 4.698463103929542, 0.0), prj(1.2940952255126037, 4.8296291314453415, 0.0), prj(0.8682408883346521, 4.92403876506104, 0.0), prj(0.43577871373829064, 4.9809734904587275, 0.0), prj(3.061616997868383e-16, 5.0, 0.0), prj(-0.4357787137382912, 4.9809734904587275, 0.0), prj(-0.8682408883346515, 4.92403876506104, 0.0), prj(-1.2940952255126041, 4.8296291314453415, 0.0), prj(-1.7101007166283435, 4.698463103929543, 0.0), prj(-2.113091308703497, 4.53153893518325, 0.0), prj(-2.499999999999999, 4.3301270189221945, 0.0), prj(-2.8678821817552307, 4.095760221444959, 0.0), prj(-3.2139380484326963, 3.83022221559489, 0.0), prj(-3.5355339059327373, 3.5355339059327378, 0.0), prj(-3.8302222155948895, 3.2139380484326976, 0.0), prj(-4.0957602214449595, 2.86788218175523, 0.0), prj(-4.330127018922194, 2.4999999999999996, 0.0), prj(-4.531538935183249, 2.1130913087034973, 0.0), prj(-4.698463103929542, 1.7101007166283444, 0.0), prj(-4.829629131445341, 1.294095225512605, 0.0), prj(-4.92403876506104, 0.8682408883346513, 0.0), prj(-4.9809734904587275, 0.43577871373829097, 0.0), prj(-5.0, 6.123233995736766e-16, 0.0), prj(-4.9809734904587275, -0.4357787137382897, 0.0), prj(-4.92403876506104, -0.8682408883346524, 0.0), prj(-4.8296291314453415, -1.294095225512604, 0.0), prj(-4.698463103929543, -1.7101007166283433, 0.0), prj(-4.53153893518325, -2.1130913087034964, 0.0), prj(-4.330127018922193, -2.5000000000000004, 0.0), prj(-4.095760221444959, -2.8678821817552307, 0.0), prj(-3.83022221559489, -3.2139380484326963, 0.0), prj(-3.5355339059327386, -3.535533905932737, 0.0), prj(-3.213938048432698, -3.8302222155948895, 0.0), prj(-2.867882181755232, -4.095760221444958, 0.0), prj(-2.500000000000002, -4.330127018922192, 0.0), prj(-2.1130913087034955, -4.531538935183251, 0.0), prj(-1.7101007166283424, -4.698463103929543, 0.0), prj(-1.2940952255126033, -4.8296291314453415, 0.0), prj(-0.8682408883346516, -4.92403876506104, 0.0), prj(-0.43577871373829125, -4.9809734904587275, 0.0), prj(-9.184850993605148e-16, -5.0, 0.0), prj(0.43577871373828947, -4.9809734904587275, 0.0), prj(0.8682408883346499, -4.924038765061041, 0.0), prj(1.2940952255126015, -4.829629131445342, 0.0), prj(1.7101007166283453, -4.698463103929542, 0.0), prj(2.113091308703498, -4.531538935183249, 0.0), prj(2.5, -4.330127018922193, 0.0), prj(2.8678821817552302, -4.095760221444959, 0.0), prj(3.2139380484326963, -3.8302222155948904, 0.0), prj(3.535533905932737, -3.5355339059327386, 0.0), prj(3.8302222155948895, -3.213938048432698, 0.0), prj(4.095760221444958, -2.867882181755232, 0.0), prj(4.330127018922192, -2.500000000000002, 0.0), prj(4.53153893518325, -2.113091308703496, 0.0), prj(4.698463103929543, -1.7101007166283426, 0.0), prj(4.8296291314453415, -1.2940952255126035, 0.0), prj(4.92403876506104, -0.868240888334652, 0.0), prj(4.9809734904587275, -0.4357787137382916, 0.0), prj(5.0, -1.2246467991473533e-15, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(3 - pw2*1.0 - pw2*0.0, 0 - pw2*0.0 - pw2*1.0, 4 - pw2*0.0 - pw2*0.0)
      let p2_2 = prj(3 + pw2*1.0 - pw2*0.0, 0 + pw2*0.0 - pw2*1.0, 4 + pw2*0.0 - pw2*0.0)
      let p2_3 = prj(3 + pw2*1.0 + pw2*0.0, 0 + pw2*0.0 + pw2*1.0, 4 + pw2*0.0 + pw2*0.0)
      let p2_4 = prj(3 - pw2*1.0 + pw2*0.0, 0 - pw2*0.0 + pw2*1.0, 4 - pw2*0.0 + pw2*0.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(6.0, 0.0, 4.0), prj(5.988584094275237, 0.2614672282429745, 4.0), prj(5.9544232590366235, 0.520944533000791, 4.0), prj(5.897777478867205, 0.7764571353075622, 4.0), prj(5.819077862357725, 1.0260604299770062, 4.0), prj(5.718923361109949, 1.2678547852220983, 4.0), prj(5.598076211353316, 1.4999999999999998, 4.0), prj(5.457456132866975, 1.7207293090531381, 4.0), prj(5.298133329356935, 1.9283628290596178, 4.0), prj(5.121320343559643, 2.1213203435596424, 4.0), prj(4.928362829059618, 2.298133329356934, 4.0), prj(4.720729309053139, 2.4574561328669753, 4.0), prj(4.5, 2.598076211353316, 4.0), prj(4.267854785222099, 2.7189233611099497, 4.0), prj(4.026060429977006, 2.819077862357725, 4.0), prj(3.776457135307562, 2.897777478867205, 4.0), prj(3.520944533000791, 2.954423259036624, 4.0), prj(3.2614672282429744, 2.988584094275237, 4.0), prj(3.0, 3.0, 4.0), prj(2.738532771757025, 2.988584094275237, 4.0), prj(2.479055466999209, 2.954423259036624, 4.0), prj(2.2235428646924373, 2.897777478867205, 4.0), prj(1.9739395700229938, 2.8190778623577253, 4.0), prj(1.732145214777902, 2.71892336110995, 4.0), prj(1.5000000000000007, 2.5980762113533165, 4.0), prj(1.2792706909468614, 2.4574561328669753, 4.0), prj(1.0716371709403822, 2.298133329356934, 4.0), prj(0.8786796564403576, 2.121320343559643, 4.0), prj(0.7018666706430663, 1.9283628290596184, 4.0), prj(0.5425438671330243, 1.7207293090531377, 4.0), prj(0.401923788646684, 1.4999999999999998, 4.0), prj(0.2810766388900503, 1.2678547852220985, 4.0), prj(0.18092213764227516, 1.0260604299770066, 4.0), prj(0.1022225211327954, 0.7764571353075631, 4.0), prj(0.04557674096337605, 0.5209445330007907, 4.0), prj(0.011415905724763142, 0.2614672282429746, 4.0), prj(0.0, 3.6739403974420594e-16, 4.0), prj(0.011415905724763142, -0.26146722824297386, 4.0), prj(0.04557674096337605, -0.5209445330007914, 4.0), prj(0.10222252113279495, -0.7764571353075624, 4.0), prj(0.18092213764227472, -1.026060429977006, 4.0), prj(0.28107663889004986, -1.2678547852220978, 4.0), prj(0.401923788646684, -1.5000000000000004, 4.0), prj(0.5425438671330247, -1.7207293090531386, 4.0), prj(0.7018666706430658, -1.9283628290596178, 4.0), prj(0.8786796564403572, -2.121320343559642, 4.0), prj(1.0716371709403814, -2.2981333293569337, 4.0), prj(1.279270690946861, -2.457456132866975, 4.0), prj(1.4999999999999987, -2.598076211353315, 4.0), prj(1.7321452147779026, -2.7189233611099506, 4.0), prj(1.9739395700229945, -2.8190778623577253, 4.0), prj(2.2235428646924382, -2.897777478867205, 4.0), prj(2.479055466999209, -2.954423259036624, 4.0), prj(2.738532771757025, -2.988584094275237, 4.0), prj(2.9999999999999996, -3.0, 4.0), prj(3.2614672282429735, -2.988584094275237, 4.0), prj(3.52094453300079, -2.9544232590366244, 4.0), prj(3.776457135307561, -2.897777478867205, 4.0), prj(4.026060429977007, -2.819077862357725, 4.0), prj(4.267854785222099, -2.7189233611099493, 4.0), prj(4.5, -2.598076211353316, 4.0), prj(4.720729309053138, -2.4574561328669753, 4.0), prj(4.928362829059617, -2.2981333293569346, 4.0), prj(5.121320343559642, -2.121320343559643, 4.0), prj(5.298133329356934, -1.9283628290596186, 4.0), prj(5.457456132866975, -1.720729309053139, 4.0), prj(5.598076211353315, -1.5000000000000013, 4.0), prj(5.71892336110995, -1.2678547852220974, 4.0), prj(5.819077862357725, -1.0260604299770058, 4.0), prj(5.897777478867205, -0.776457135307562, 4.0), prj(5.9544232590366235, -0.5209445330007911, 4.0), prj(5.988584094275237, -0.26146722824297497, 4.0), prj(6.0, -7.347880794884119e-16, 4.0))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    // Hình chiếu của (C2) lên mặt phẳng (C1)
    let pts2_proj = (prj(6.0, 0.0, 0.0), prj(5.9544232590366235, 0.520944533000791, 0.0), prj(5.819077862357725, 1.0260604299770062, 0.0), prj(5.598076211353316, 1.4999999999999998, 0.0), prj(5.298133329356935, 1.9283628290596178, 0.0), prj(4.928362829059618, 2.298133329356934, 0.0), prj(4.5, 2.598076211353316, 0.0), prj(4.026060429977006, 2.819077862357725, 0.0), prj(3.520944533000791, 2.954423259036624, 0.0), prj(3.0, 3.0, 0.0), prj(2.479055466999209, 2.954423259036624, 0.0), prj(1.9739395700229938, 2.8190778623577253, 0.0), prj(1.5000000000000007, 2.5980762113533165, 0.0), prj(1.0716371709403822, 2.298133329356934, 0.0), prj(0.7018666706430663, 1.9283628290596184, 0.0), prj(0.401923788646684, 1.4999999999999998, 0.0), prj(0.18092213764227516, 1.0260604299770066, 0.0), prj(0.04557674096337605, 0.5209445330007907, 0.0), prj(0.0, 3.6739403974420594e-16, 0.0), prj(0.04557674096337605, -0.5209445330007914, 0.0), prj(0.18092213764227472, -1.026060429977006, 0.0), prj(0.401923788646684, -1.5000000000000004, 0.0), prj(0.7018666706430658, -1.9283628290596178, 0.0), prj(1.0716371709403814, -2.2981333293569337, 0.0), prj(1.4999999999999987, -2.598076211353315, 0.0), prj(1.9739395700229945, -2.8190778623577253, 0.0), prj(2.479055466999209, -2.954423259036624, 0.0), prj(2.9999999999999996, -3.0, 0.0), prj(3.52094453300079, -2.9544232590366244, 0.0), prj(4.026060429977007, -2.819077862357725, 0.0), prj(4.5, -2.598076211353316, 0.0), prj(4.928362829059617, -2.2981333293569346, 0.0), prj(5.298133329356934, -1.9283628290596186, 0.0), prj(5.598076211353315, -1.5000000000000013, 0.0), prj(5.819077862357725, -1.0260604299770058, 0.0), prj(5.9544232590366235, -0.5209445330007911, 0.0), prj(6.0, -7.347880794884119e-16, 0.0))
    line(..pts2_proj, stroke: (dash: "dashed", paint: rgb("#b45309"), thickness: 1pt))
    let J2_p = prj(3.0, 0.0, 0.0)
    circle(J2_p, radius: 1.5pt, fill: rgb("#b45309"))
    content(J2_p, [$J_2'$], anchor: "north-east", padding: 2pt)
    line(J2, J2_p, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(4.166666666666667, 2.763853991962833, 0)
    let N = prj(4.166666666666667, 2.763853991962833, 4)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(4.166666666666667, 2.763853991962833, 0.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ có tâm $J_1(0; 0; 0)$, bán kính $R_1 = 5$, nằm trên mặt phẳng $z=0$.
  - $(C_2)$ có tâm $J_2(3; 0; 4)$, bán kính $R_2 = 3$, nằm trên mặt phẳng $z=4$.
  - Khoảng cách thẳng đứng giữa hai mặt phẳng chứa hai đường tròn là $h = 4$.
]
#note[
  *Cảnh báo bẫy:* Bài toán song song lệch trục này rất dễ khiến học sinh áp dụng máy móc công thức $d_("ngang") = |J_1 J_2' - R_1 - R_2| = |3 - 5 - 3| = 5$ rồi tính ra $M N = sqrt(4^2 + 5^2) = sqrt(41) approx 6.40$. Thực tế, ta cần khảo sát vị trí tương đối của hai hình chiếu!
]
*Bước 1:* Chiếu đường tròn $(C_2)$ vuông góc xuống mặt phẳng $z=0$, ta được đường tròn hình chiếu $(C_2')$ có tâm $J_2'(3; 0; 0)$ và bán kính $R_2 = 3$.
*Bước 2:* Xét vị trí tương đối giữa đường tròn $(C_1)$ và đường tròn hình chiếu $(C_2')$ trên mặt phẳng $z=0$:
- Khoảng cách giữa hai tâm là $J_1 J_2' = 3$.
- Hiệu hai bán kính là $|R_1 - R_2| = 2$.
- Tổng hai bán kính là $R_1 + R_2 = 8$.
Vì $|R_1 - R_2| = 2 < J_1 J_2' = 3 < R_1 + R_2 = 8$, nên hai đường tròn $(C_1)$ và $(C_2')$ cắt nhau tại hai điểm chung $K_1, K_2$.
*Bước 3:* Tại các điểm giao nhau $K_1, K_2$ trên mặt phẳng chiếu, khoảng cách ngang giữa hai đường tròn bằng $0$.
Khi đó, khoảng cách ngắn nhất giữa hai điểm $M$ và $N$ trong không gian chính bằng khoảng cách đứng giữa hai mặt phẳng:
$ M N_(min) = h = 4. $
(Đạt được khi $M(x_0; y_0; 0)$ trùng với hình chiếu của $N(x_0; y_0; 4)$ tại các giao điểm $K_1, K_2$ của hai đường tròn hình chiếu).
  ]
)

#tln(
  [(Ứng dụng thực tế: Cánh tay rô-bốt hàn - HAI MẶT PHẲNG VUÔNG GÓC) Trong một dây chuyền lắp ráp ô tô tự động, hai rô-bốt hàn kỹ thuật số di chuyển đầu hàn theo hai quỹ đạo tròn $(C_1)$ và $(C_2)$ nằm trên hai mặt phẳng vuông góc với nhau. Quỹ đạo $(C_1)$ nằm trên mặt sàn nằm ngang $(P_1): z=0$, có tâm tại gốc tọa độ $J_1(0;0;0)$ và bán kính $R_1=3$ dm. Quỹ đạo $(C_2)$ nằm trên mặt tấm chắn đứng $(P_2): x=0$, có tâm $J_2(0;4;0)$ và bán kính $R_2=2$ dm. Hãy xác định khoảng cách ngắn nhất giữa đầu hàn của rô-bốt 1 (chạy trên $C_1$) và rô-bốt 2 (chạy trên $C_2$) để lập trình chế độ tránh va chạm?],
  [1],
  fig: cetz.canvas(length: 0.33cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let xp = y - 0.6 * x
      let yp = z - 0.4 * x
      (xp, yp)
    }
    
    let J1 = prj(0, 0, 0)
    let J2 = prj(0, 4, 0)
    
    // Mặt phẳng chứa (C1)
    let pw1 = 6.0
    let p1_1 = prj(0 - pw1*1.0 - pw1*0.0, 0 - pw1*0.0 - pw1*1.0, 0 - pw1*0.0 - pw1*0.0)
    let p1_2 = prj(0 + pw1*1.0 - pw1*0.0, 0 + pw1*0.0 - pw1*1.0, 0 + pw1*0.0 - pw1*0.0)
    let p1_3 = prj(0 + pw1*1.0 + pw1*0.0, 0 + pw1*0.0 + pw1*1.0, 0 + pw1*0.0 + pw1*0.0)
    let p1_4 = prj(0 - pw1*1.0 + pw1*0.0, 0 - pw1*0.0 + pw1*1.0, 0 - pw1*0.0 + pw1*0.0)
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // (C1)
    let pts1 = (prj(3.0, 0.0, 0.0), prj(2.988584094275237, 0.2614672282429745, 0.0), prj(2.954423259036624, 0.520944533000791, 0.0), prj(2.897777478867205, 0.7764571353075622, 0.0), prj(2.8190778623577253, 1.0260604299770062, 0.0), prj(2.7189233611099497, 1.2678547852220983, 0.0), prj(2.598076211353316, 1.4999999999999998, 0.0), prj(2.4574561328669753, 1.7207293090531381, 0.0), prj(2.298133329356934, 1.9283628290596178, 0.0), prj(2.121320343559643, 2.1213203435596424, 0.0), prj(1.9283628290596182, 2.298133329356934, 0.0), prj(1.7207293090531386, 2.4574561328669753, 0.0), prj(1.5000000000000004, 2.598076211353316, 0.0), prj(1.2678547852220983, 2.7189233611099497, 0.0), prj(1.0260604299770064, 2.819077862357725, 0.0), prj(0.7764571353075622, 2.897777478867205, 0.0), prj(0.5209445330007912, 2.954423259036624, 0.0), prj(0.26146722824297436, 2.988584094275237, 0.0), prj(1.8369701987210297e-16, 3.0, 0.0), prj(-0.2614672282429747, 2.988584094275237, 0.0), prj(-0.5209445330007909, 2.954423259036624, 0.0), prj(-0.7764571353075626, 2.897777478867205, 0.0), prj(-1.0260604299770062, 2.8190778623577253, 0.0), prj(-1.267854785222098, 2.71892336110995, 0.0), prj(-1.4999999999999993, 2.5980762113533165, 0.0), prj(-1.7207293090531386, 2.4574561328669753, 0.0), prj(-1.9283628290596178, 2.298133329356934, 0.0), prj(-2.1213203435596424, 2.121320343559643, 0.0), prj(-2.2981333293569337, 1.9283628290596184, 0.0), prj(-2.4574561328669757, 1.7207293090531377, 0.0), prj(-2.598076211353316, 1.4999999999999998, 0.0), prj(-2.7189233611099497, 1.2678547852220985, 0.0), prj(-2.819077862357725, 1.0260604299770066, 0.0), prj(-2.8977774788672046, 0.7764571353075631, 0.0), prj(-2.954423259036624, 0.5209445330007907, 0.0), prj(-2.988584094275237, 0.2614672282429746, 0.0), prj(-3.0, 3.6739403974420594e-16, 0.0), prj(-2.988584094275237, -0.26146722824297386, 0.0), prj(-2.954423259036624, -0.5209445330007914, 0.0), prj(-2.897777478867205, -0.7764571353075624, 0.0), prj(-2.8190778623577253, -1.026060429977006, 0.0), prj(-2.71892336110995, -1.2678547852220978, 0.0), prj(-2.598076211353316, -1.5000000000000004, 0.0), prj(-2.4574561328669753, -1.7207293090531386, 0.0), prj(-2.298133329356934, -1.9283628290596178, 0.0), prj(-2.121320343559643, -2.121320343559642, 0.0), prj(-1.9283628290596186, -2.2981333293569337, 0.0), prj(-1.720729309053139, -2.457456132866975, 0.0), prj(-1.5000000000000013, -2.598076211353315, 0.0), prj(-1.2678547852220974, -2.7189233611099506, 0.0), prj(-1.0260604299770055, -2.8190778623577253, 0.0), prj(-0.7764571353075619, -2.897777478867205, 0.0), prj(-0.520944533000791, -2.954423259036624, 0.0), prj(-0.26146722824297475, -2.988584094275237, 0.0), prj(-5.51091059616309e-16, -3.0, 0.0), prj(0.26146722824297364, -2.988584094275237, 0.0), prj(0.5209445330007899, -2.9544232590366244, 0.0), prj(0.7764571353075609, -2.897777478867205, 0.0), prj(1.026060429977007, -2.819077862357725, 0.0), prj(1.2678547852220987, -2.7189233611099493, 0.0), prj(1.5, -2.598076211353316, 0.0), prj(1.7207293090531381, -2.4574561328669753, 0.0), prj(1.9283628290596178, -2.2981333293569346, 0.0), prj(2.121320343559642, -2.121320343559643, 0.0), prj(2.2981333293569337, -1.9283628290596186, 0.0), prj(2.457456132866975, -1.720729309053139, 0.0), prj(2.598076211353315, -1.5000000000000013, 0.0), prj(2.71892336110995, -1.2678547852220974, 0.0), prj(2.8190778623577253, -1.0260604299770058, 0.0), prj(2.897777478867205, -0.776457135307562, 0.0), prj(2.954423259036624, -0.5209445330007911, 0.0), prj(2.988584094275237, -0.26146722824297497, 0.0), prj(3.0, -7.347880794884119e-16, 0.0))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // Mặt phẳng chứa (C2) nếu khác phẳng
    if true {
      let pw2 = 6.0
      let p2_1 = prj(0 - pw2*-0.0 - pw2*-0.0, 4 - pw2*1.0 - pw2*-0.0, 0 - pw2*0.0 - pw2*1.0)
      let p2_2 = prj(0 + pw2*-0.0 - pw2*-0.0, 4 + pw2*1.0 - pw2*-0.0, 0 + pw2*0.0 - pw2*1.0)
      let p2_3 = prj(0 + pw2*-0.0 + pw2*-0.0, 4 + pw2*1.0 + pw2*-0.0, 0 + pw2*0.0 + pw2*1.0)
      let p2_4 = prj(0 - pw2*-0.0 + pw2*-0.0, 4 - pw2*1.0 + pw2*-0.0, 0 - pw2*0.0 + pw2*1.0)
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }
    
    // (C2)
    let pts2 = (prj(0.0, 6.0, 0.0), prj(0.0, 5.992389396183491, 0.17431148549531633), prj(0.0, 5.969615506024416, 0.34729635533386066), prj(0.0, 5.931851652578136, 0.5176380902050415), prj(0.0, 5.879385241571817, 0.6840402866513374), prj(0.0, 5.8126155740733, 0.8452365234813989), prj(0.0, 5.732050807568878, 0.9999999999999999), prj(0.0, 5.638304088577984, 1.147152872702092), prj(0.0, 5.532088886237956, 1.2855752193730785), prj(0.0, 5.414213562373095, 1.414213562373095), prj(0.0, 5.2855752193730785, 1.532088886237956), prj(0.0, 5.147152872702092, 1.6383040885779836), prj(0.0, 5.0, 1.7320508075688772), prj(0.0, 4.8452365234813985, 1.8126155740732999), prj(0.0, 4.684040286651338, 1.8793852415718166), prj(0.0, 4.5176380902050415, 1.9318516525781366), prj(0.0, 4.347296355333861, 1.969615506024416), prj(0.0, 4.174311485495316, 1.992389396183491), prj(0.0, 4.0, 2.0), prj(0.0, 3.8256885145046837, 1.992389396183491), prj(0.0, 3.6527036446661394, 1.969615506024416), prj(0.0, 3.4823619097949585, 1.9318516525781366), prj(0.0, 3.3159597133486627, 1.8793852415718169), prj(0.0, 3.1547634765186015, 1.8126155740733), prj(0.0, 3.0000000000000004, 1.7320508075688776), prj(0.0, 2.852847127297908, 1.6383040885779836), prj(0.0, 2.7144247806269215, 1.532088886237956), prj(0.0, 2.585786437626905, 1.4142135623730951), prj(0.0, 2.467911113762044, 1.285575219373079), prj(0.0, 2.361695911422016, 1.1471528727020919), prj(0.0, 2.2679491924311224, 0.9999999999999999), prj(0.0, 2.1873844259267, 0.845236523481399), prj(0.0, 2.120614758428183, 0.6840402866513378), prj(0.0, 2.0681483474218636, 0.517638090205042), prj(0.0, 2.0303844939755837, 0.3472963553338605), prj(0.0, 2.007610603816509, 0.1743114854953164), prj(0.0, 2.0, 2.4492935982947064e-16), prj(0.0, 2.007610603816509, -0.1743114854953159), prj(0.0, 2.0303844939755837, -0.34729635533386094), prj(0.0, 2.0681483474218636, -0.5176380902050416), prj(0.0, 2.120614758428183, -0.6840402866513373), prj(0.0, 2.1873844259267, -0.8452365234813985), prj(0.0, 2.267949192431123, -1.0000000000000002), prj(0.0, 2.361695911422016, -1.1471528727020923), prj(0.0, 2.467911113762044, -1.2855752193730785), prj(0.0, 2.5857864376269046, -1.4142135623730947), prj(0.0, 2.7144247806269206, -1.5320888862379558), prj(0.0, 2.852847127297907, -1.6383040885779832), prj(0.0, 2.999999999999999, -1.7320508075688767), prj(0.0, 3.154763476518602, -1.8126155740733003), prj(0.0, 3.315959713348663, -1.8793852415718169), prj(0.0, 3.4823619097949585, -1.9318516525781366), prj(0.0, 3.6527036446661394, -1.969615506024416), prj(0.0, 3.8256885145046837, -1.992389396183491), prj(0.0, 3.9999999999999996, -2.0), prj(0.0, 4.174311485495315, -1.992389396183491), prj(0.0, 4.34729635533386, -1.9696155060244163), prj(0.0, 4.517638090205041, -1.9318516525781368), prj(0.0, 4.684040286651338, -1.8793852415718166), prj(0.0, 4.845236523481399, -1.8126155740732997), prj(0.0, 5.0, -1.7320508075688772), prj(0.0, 5.147152872702092, -1.6383040885779836), prj(0.0, 5.2855752193730785, -1.5320888862379562), prj(0.0, 5.414213562373095, -1.4142135623730954), prj(0.0, 5.532088886237956, -1.2855752193730792), prj(0.0, 5.638304088577983, -1.1471528727020928), prj(0.0, 5.732050807568877, -1.0000000000000009), prj(0.0, 5.8126155740733, -0.8452365234813983), prj(0.0, 5.879385241571817, -0.6840402866513371), prj(0.0, 5.931851652578136, -0.5176380902050414), prj(0.0, 5.969615506024416, -0.3472963553338608), prj(0.0, 5.992389396183491, -0.17431148549531664), prj(0.0, 6.0, -4.898587196589413e-16))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    let M = prj(0, 3, 0)
    let N = prj(0, 2, 0)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))

    let N_p = prj(0.0, 2.0, 0.0)
    circle(N_p, radius: 1.5pt, fill: gray)
    line(N, N_p, stroke: (dash: "dotted", paint: red, thickness: 1pt))
    line(M, N_p, stroke: (dash: "dotted", paint: blue, thickness: 1pt))
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
  - $(C_1)$ có tâm $J_1(0; 0; 0)$, bán kính $R_1 = 3$, nằm trên mặt phẳng $z=0$.
  - $(C_2)$ có tâm $J_2(0; 4; 0)$, bán kính $R_2 = 2$, nằm trên mặt phẳng $x=0$.
]
#note[
  *Lưu ý sư phạm:* Đây là bài toán cực trị khoảng cách giữa hai đường tròn nằm trên hai mặt phẳng vuông góc (mặt phẳng nằm ngang và mặt phẳng đứng qua trục tung). Ta sẽ tham số hóa tọa độ các điểm trên hai đường tròn rồi sử dụng tính chất của hàm liên kết bậc nhất để tìm giá trị nhỏ nhất của bình phương khoảng cách.
]
*Bước 1:* Biểu diễn tọa độ các điểm chạy trên hai quỹ đạo tròn:
- Điểm $M in (C_1)$ nằm trên mặt phẳng $z=0$, có tâm $J_1(0;0;0)$ và bán kính $R_1=3$ nên:
  $ M(3 cos t, 3 sin t, 0) $ với $t in [0; 2 pi)$.
- Điểm $N in (C_2)$ nằm trên mặt phẳng $x=0$, có tâm $J_2(0;4;0)$ và bán kính $R_2=2$ nên:
  $ N(0, 4 + 2 cos u, 2 sin u) $ với $u in [0; 2 pi)$.
*Bước 2:* Tính bình phương khoảng cách không gian giữa $M$ và $N$:
  $ M N^2 = (3 cos t - 0)^2 + (3 sin t - 4 - 2 cos u)^2 + (0 - 2 sin u)^2 $
  $ = 9 cos^2 t + (9 sin^2 t - 6 sin t (4 + 2 cos u) + 16 + 16 cos u + 4 cos^2 u) + 4 sin^2 u $
  $ = 9(cos^2 t + sin^2 t) + 4(cos^2 u + sin^2 u) + 16 - 24 sin t + 16 cos u - 12 sin t cos u $
  $ = 9 + 4 + 16 - 24 sin t + 16 cos u - 12 sin t cos u $
  $ = 29 - 24 sin t + 16 cos u - 12 sin t cos u. $
*Bước 3:* Đặt $X = sin t in [-1; 1]$ và $Y = cos u in [-1; 1]$. Biểu thức cần tìm giá trị nhỏ nhất trở thành hàm hai biến:
  $ f(X, Y) = 29 - 24X + 16Y - 12 X Y $ trên miền $[-1; 1] times [-1; 1]$.
*Bước 4:* Do $f(X, Y)$ là một hàm bậc nhất đối với từng biến $X$ và $Y$ (hàm song tuyến tính), nên giá trị cực trị của nó trên miền hình chữ nhật $[-1; 1] times [-1; 1]$ chỉ có thể đạt được tại các đỉnh của miền xác định:
- Tại đỉnh $(1; 1)$: $f(1, 1) = 29 - 24 + 16 - 12 = 9$.
- Tại đỉnh $(1; -1)$: $f(1, -1) = 29 - 24 - 16 + 12 = 1$.
- Tại đỉnh $(-1; 1)$: $f(-1, 1) = 29 + 24 + 16 + 12 = 81$.
- Tại đỉnh $(-1; -1)$: $f(-1, -1) = 29 + 24 - 16 - 12 = 25$.
*Bước 5:* Nhận thấy giá trị nhỏ nhất của $f(X, Y)$ là $1$ đạt được tại $X = 1$ và $Y = -1$.
Khi đó:
$ M N_(min) = sqrt(1) = 1 $ dm.
(Đạt được khi $sin t = 1 => M(0; 3; 0)$ và $cos u = -1 => N(0; 2; 0)$).
  ]
)

#v(1.5em)
== B. BÀI TẬP TỰ LUYỆN PHÂN LOẠI CÓ HƯỚNG DẪN CHI TIẾT

Dưới đây là hệ thống bài tập tự luyện có lời giải chi tiết giúp học sinh tự củng cố tư duy và phương pháp:

#tln(
  [*Bài 1 (Đồng phẳng, lồng nhau):* Cho hai đường tròn $(C_1)$ và $(C_2)$ đồng phẳng trên mặt đất $z=0$. Vòng chạy ngoài $(C_1)$ có tâm $J_1(1;1;0)$, bán kính $R_1=8$. Vòng chạy trong $(C_2)$ có tâm $J_2(2;3;0)$, bán kính $R_2=3$. Tìm khoảng cách lớn nhất và nhỏ nhất giữa hai điểm $M in (C_1)$ và $N in (C_2)$?],
  [$M N_(min) = 5 - sqrt(5), M N_(max) = 11 + sqrt(5)$],
  loigiai: [
    *Bước 1 (Tính khoảng cách nối tâm):*
    Hai đường tròn nằm trên cùng mặt phẳng $z=0$. Tâm $J_1(1;1;0)$ và $J_2(2;3;0)$.
    $ J_1 J_2 = sqrt((2-1)^2 + (3-1)^2) = sqrt(1 + 4) = sqrt(5) $
    *Bước 2 (Xác định vị trí tương đối):*
    Hiệu hai bán kính là: $|R_1 - R_2| = |8 - 3| = 5$.
    Vì $J_1 J_2 = sqrt(5) approx 2.24 < |R_1 - R_2| = 5$, nên đường tròn $(C_2)$ nằm hoàn toàn phía trong đường tròn $(C_1)$ (hai đường tròn lồng nhau).
    *Bước 3 (Tìm cực trị khoảng cách):*
    - Khoảng cách ngắn nhất đạt được khi hai điểm $M, N$ nằm trên đoạn thẳng nối hai tâm và cùng phía:
      $ M N_(min) = R_1 - R_2 - J_1 J_2 = 8 - 3 - sqrt(5) = 5 - sqrt(5). $
    - Khoảng cách lớn nhất đạt được khi $M, N$ nằm ở hai đầu xa nhất đối diện trên đường nối hai tâm:
      $ M N_(max) = R_1 + R_2 + J_1 J_2 = 8 + 3 + sqrt(5) = 11 + sqrt(5). $
  ]
)

#tln(
  [*Bài 2 (Đồng phẳng, tiếp xúc ngoài):* Hai vòng tròn nhựa được đặt tiếp xúc ngoài với nhau trên bàn phẳng $z=0$. Vòng $(C_1)$ tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vòng $(C_2)$ tâm $J_2(x_0; 0; 0)$ với $x_0 > 0$, bán kính $R_2=3$. Do hai vòng tiếp xúc ngoài nên $J_1 J_2 = R_1 + R_2 = 8$. Tìm khoảng cách lớn nhất giữa một điểm $M in (C_1)$ và một điểm $N in (C_2)$?],
  [$16$],
  loigiai: [
    *Bước 1:* Hai đường tròn đồng phẳng trên $z=0$, tiếp xúc ngoài nhau nên khoảng cách nối tâm đúng bằng tổng hai bán kính:
    $ J_1 J_2 = R_1 + R_2 = 5 + 3 = 8. $
    *Bước 2:* Với cấu hình đồng phẳng ngoài nhau hoặc tiếp xúc ngoài, khoảng cách cực đại giữa hai điểm đạt được khi hai điểm nằm thẳng hàng với hai tâm và ở phía đối diện xa nhất ngoài cùng:
    $ M N_(max) = J_1 J_2 + R_1 + R_2 = 8 + 5 + 3 = 16. $
  ]
)

#tln(
  [*Bài 3 (Song song, đồng trục):* Hai vành thép chịu lực tròn nằm trên hai mặt phẳng song song $z=2$ và $z=10$. Vành dưới $(C_1)$ có tâm $J_1(1;2;2)$, bán kính $R_1=6$. Vành trên $(C_2)$ có tâm $J_2(1;2;10)$, bán kính $R_2=2$. Một thanh nối thẳng kết nối điểm $M in (C_1)$ và $N in (C_2)$. Tìm độ dài ngắn nhất và dài nhất của thanh nối này?],
  [$M N_(min) = 4 sqrt(5), M N_(max) = 8 sqrt(2)$],
  loigiai: [
    *Bước 1 (Tính chiều cao thẳng đứng):*
    Hai mặt phẳng $z=2$ và $z=10$ song song và cách nhau một khoảng $h = 10 - 2 = 8$.
    *Bước 2 (Chiếu phẳng):*
    Do hai tâm có cùng hoành độ và tung độ $J_1(1;2)$ và $J_2(1;2)$, đây là cấu hình song song đồng trục.
    Hình chiếu của $(C_2)$ xuống mặt phẳng chứa $(C_1)$ là đường tròn chiếu $(C_2')$ đồng tâm với $(C_1)$.
    *Bước 3 (Tìm cực trị khoảng cách):*
    - Khoảng cách ngang nhỏ nhất là:
      $ d_("ngang", min) = |R_1 - R_2| = |6 - 2| = 4. $
    - Khoảng cách ngang lớn nhất là:
      $ d_("ngang", max) = R_1 + R_2 = 6 + 2 = 8. $
    *Bước 4 (Tính khoảng cách không gian):*
    - Độ dài ngắn nhất của thanh nối:
      $ M N_(min) = sqrt(h^2 + d_("ngang", min)^2) = sqrt(8^2 + 4^2) = sqrt(80) = 4 sqrt(5). $
    - Độ dài dài nhất của thanh nối:
      $ M N_(max) = sqrt(h^2 + d_("ngang", max)^2) = sqrt(8^2 + 8^2) = sqrt(128) = 8 sqrt(2). $
  ]
)

#tln(
  [*Bài 4 (Song song, lệch trục chiếu cắt nhau):* Hai đường băng tập bay của flycam nằm trên hai tầng sân thượng song song. Đường băng 1 ở tầng $z=0$ có tâm $J_1(0;0;0)$, bán kính $R_1=4$. Đường băng 2 ở tầng $z=3$ có tâm $J_2(2;0;3)$, bán kính $R_2=3$. Hai hình chiếu vuông góc của hai đường băng này xuống mặt đất cắt nhau. Tìm khoảng cách ngắn nhất giữa hai flycam khi chúng bay trên hai quỹ đạo này?],
  [$3$],
  loigiai: [
    *Bước 1 (Xác định chiều cao đứng):*
    Khoảng cách thẳng đứng giữa hai tầng sân thượng chứa hai đường băng là $h = 3$.
    *Bước 2 (Xét hình chiếu phẳng):*
    Chiếu quỹ đạo $(C_2)$ xuống mặt đáy $z=0$ ta được đường tròn hình chiếu $(C_2')$ có tâm $J_2'(2;0;0)$ và bán kính $R_2=3$.
    *Bước 3 (Xét vị trí tương đối của hình chiếu):*
    Khoảng cách giữa hai tâm chiếu là $d = J_1 J_2' = 2$.
    Hiệu hai bán kính là $|R_1 - R_2| = 1$. Tổng hai bán kính là $R_1 + R_2 = 7$.
    Vì $|R_1 - R_2| = 1 < d = 2 < R_1 + R_2 = 7$, nên hai đường tròn chiếu cắt nhau tại hai điểm.
    *Bước 4 (Kết luận):*
    Tại giao điểm của hai quỹ đạo chiếu, khoảng cách ngang bằng $0$.
    Khi đó, khoảng cách ngắn nhất không gian chính bằng khoảng cách đứng đứng giữa hai mặt phẳng:
    $ M N_(min) = h = 3. $
  ]
)

#tln(
  [*Bài 5 (Song song, lệch trục chiếu rời nhau):* Hai vòng tròn đèn LED trang trí được lắp song song. Vòng dưới $(C_1)$ nằm trên $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Vòng trên $(C_2)$ nằm trên $z=5$, tâm $J_2(6;8;5)$, bán kính $R_2=5$. Tính khoảng cách ngắn nhất giữa hai điểm bất kỳ trên hai vòng tròn đèn LED này?],
  [$sqrt(29)$],
  loigiai: [
    *Bước 1 (Xác định chiều cao đứng):*
    Khoảng cách giữa hai mặt phẳng chứa đèn LED song song là $h = 5$.
    *Bước 2 (Chiếu phẳng):*
    Chiếu vòng trên $(C_2)$ xuống mặt phẳng đáy $z=0$ ta được đường tròn hình chiếu $(C_2')$ có tâm $J_2'(6;8;0)$ và bán kính $R_2=5$.
    *Bước 3 (Tìm khoảng cách ngang ngắn nhất):*
    Khoảng cách nối hai tâm trên mặt phẳng chiếu:
    $ J_1 J_2' = sqrt(6^2 + 8^2) = 10. $
    Vì $J_1 J_2' = 10 > R_1 + R_2 = 3 + 5 = 8$, nên hai hình chiếu hoàn toàn rời ngoài nhau.
    Khoảng cách ngang ngắn nhất giữa hai viền tròn chiếu là:
    $ d_("ngang", min) = J_1 J_2' - R_1 - R_2 = 10 - 3 - 5 = 2. $
    *Bước 4 (Tính khoảng cách không gian ngắn nhất):*
    $ M N_(min) = sqrt(h^2 + d_("ngang", min)^2) = sqrt(5^2 + 2^2) = sqrt(29). $
  ]
)

#tln(
  [*Bài 6 (Vuông góc, trục cắt nhau):* Hai đường vành của bộ lọc ly tâm nằm trên hai mặt phẳng vuông góc. Vành 1 nằm trên $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vành 2 nằm trên $y=0$, tâm $J_2(8;0;6)$, bán kính $R_2=4$. Xác định khoảng cách ngắn nhất giữa hai vành tròn này?],
  [$3 sqrt(5) - 4$],
  loigiai: [
    *Bước 1 (Quy giản hình học về tâm):*
    Áp dụng đánh giá khoảng cách dưới về tâm đường tròn $J_2(8;0;6)$ của vành thứ hai:
    $ M N >= M J_2 - R_2 => M N_(min) = M J_(2, min) - R_2 $
    *Bước 2 (Tham số hóa điểm $M$):*
    Điểm $M$ thuộc đường tròn $(C_1)$ trong mặt phẳng $z=0$, tâm $J_1(0;0;0)$ và bán kính $R_1=5$ có dạng lượng giác:
    $ M(5 cos t, 5 sin t, 0) $ với $t in [0; 2 pi)$.
    *Bước 3 (Thiết lập khoảng cách và tìm cực tiểu):*
    Bình phương khoảng cách từ $M$ đến tâm cố định $J_2(8;0;6)$ là:
    $ M J_2^2 = (5 cos t - 8)^2 + (5 sin t - 0)^2 + (0 - 6)^2 $
    $ = 25 cos^2 t - 80 cos t + 64 + 25 sin^2 t + 36 $
    $ = 25(cos^2 t + sin^2 t) + 100 - 80 cos t = 125 - 80 cos t. $
    Để $M J_2$ nhỏ nhất thì $cos t$ phải lớn nhất bằng $1$ (khi $t = 0$, điểm $M(5;0;0)$).
    $ M J_(2, min) = sqrt(125 - 80(1)) = sqrt(45) = 3 sqrt(5). $
    *Bước 4 (Kết luận):*
    Khoảng cách cực tiểu giữa hai đường vành là:
    $ M N_(min) = M J_(2, min) - R_2 = 3 sqrt(5) - 4. $
  ]
)

#tln(
  [*Bài 7 (Vuông góc, lệch trục):* Trong không gian $O x y z$, đường tròn $(C_1)$ nằm trên mặt phẳng $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Đường tròn $(C_2)$ nằm trên mặt phẳng $y=3$, tâm $J_2(5;3;12)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa hai đường tròn?],
  [$sqrt(187 - 6 sqrt(34)) - 4$],
  loigiai: [
    *Bước 1 (Quy giản hình học về tâm):*
    Áp dụng đánh giá khoảng cách dưới về tâm đường tròn $J_2(5;3;12)$ của đường tròn thứ hai:
    $ M N >= M J_2 - R_2 => M N_(min) = M J_(2, min) - R_2 $
    *Bước 2 (Tham số hóa điểm $M$):*
    Điểm $M$ thuộc đường tròn $(C_1)$ trên mặt phẳng $z=0$ có bán kính $R_1 = 3$ có dạng:
    $ M(3 cos t, 3 sin t, 0) $ với $t in [0; 2 pi)$.
    *Bước 3 (Thiết lập hàm số khoảng cách):*
    Tính bình phương khoảng cách từ $M$ đến tâm $J_2(5;3;12)$:
    $ M J_2^2 = (3 cos t - 5)^2 + (3 sin t - 3)^2 + (0 - 12)^2 $
    $ = 9 cos^2 t - 30 cos t + 25 + 9 sin^2 t - 18 sin t + 9 + 144 $
    $ = 9(cos^2 t + sin^2 t) - 30 cos t - 18 sin t + 178 $
    $ = 187 - 6(5 cos t + 3 sin t). $
    *Bước 4 (Tìm cực tiểu bằng Cauchy-Schwarz):*
    Để $M J_2^2$ nhỏ nhất thì biểu thức lượng giác $A = 5 cos t + 3 sin t$ phải lớn nhất.
    Áp dụng Cauchy-Schwarz:
    $ A = 5 cos t + 3 sin t <= sqrt((5^2 + 3^2)(cos^2 t + sin^2 t)) = sqrt(34) $
    Giá trị lớn nhất của $A$ là $sqrt(34)$. Thay vào ta được:
    $ M J_(2, min) = sqrt(187 - 6 sqrt(34)) $
    *Bước 5 (Kết luận):*
    Khoảng cách cực tiểu giữa hai đường tròn là:
    $ M N_(min) = M J_(2, min) - R_2 = sqrt(187 - 6 sqrt(34)) - 4. $
  ]
)

#tln(
  [*Bài 8 (Ứng dụng thực tế - Tránh va chạm vệ tinh):* Hai vệ tinh dự báo thời tiết chuyển động tròn đều trong không gian. Quỹ đạo vệ tinh 1 là đường tròn $(C_1)$ trên mặt phẳng $(P_1): 2x - 2y + z - 4 = 0$ có tâm $J_1(1;0;2)$, bán kính $R_1=2$. Quỹ đạo vệ tinh 2 là đường tròn $(C_2)$ trên mặt phẳng song song $(P_2): 2x - 2y + z - 13 = 0$ có tâm $J_2(3;-1;5)$, bán kính $R_2=1$. Xác định khoảng cách gần nhau nhất giữa hai vệ tinh trong quá trình vận hành?],
  [$3$],
  loigiai: [
    *Bước 1 (Tính chiều cao đứng giữa hai mặt phẳng song song):*
    $ h = d((P_1), (P_2)) = (|4 - 13|)/sqrt(2^2 + (-2)^2 + 1^2) = 9/3 = 3. $
    *Bước 2 (Chiếu vuông góc tìm tâm chiếu):*
    Đường thẳng qua tâm $J_2(3;-1;5)$ vuông góc với $(P_1)$ có dạng: $x = 3+2t, y = -1-2t, z = 5+t$.
    Giao điểm với mặt phẳng $(P_1)$ là:
    $ 2(3+2t) - 2(-1-2t) + (5+t) - 4 = 0 => 9t + 9 = 0 => t = -1. $
    Tọa độ tâm hình chiếu là $J_2'(1; 1; 4)$.
    *Bước 3 (Xét vị trí tương đối trên mặt phẳng chiếu):*
    Khoảng cách nối hai tâm trên mặt phẳng chiếu là:
    $ J_1 J_2' = sqrt((1-1)^2 + (1-0)^2 + (4-2)^2) = sqrt(5) approx 2.24. $
    Xét hai đường tròn chiếu: $(C_1)$ tâm $J_1(1;0;2)$ bán kính $R_1 = 2$, và đường tròn chiếu của $(C_2)$ có tâm $J_2'(1;1;4)$ bán kính $R_2 = 1$.
    Vì $|R_1 - R_2| = 1 < J_1 J_2' = sqrt(5) < R_1 + R_2 = 3$, nên hai quỹ đạo chiếu cắt nhau.
    *Bước 4 (Kết luận):*
    Vì hình chiếu của hai quỹ đạo cắt nhau, tồn tại thời điểm khoảng cách ngang bằng $0$.
    Khi đó, khoảng cách ngắn nhất giữa hai vệ tinh bằng khoảng cách đứng:
    $ M N_(min) = h = 3. $
  ]
)
