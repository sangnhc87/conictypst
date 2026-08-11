#import "@local/sang-math:1.0.4": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *
#import "../bbt.typ": *

#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// ═══════════════════════════════════════════════════════════
#v(1em)
#block(
  width: 100%,
  fill: rgb("#f4f8fc"),
  stroke: (left: 6pt + classic.blue, top: 0.5pt + rgb("#dbe4f0"), right: 0.5pt + rgb("#dbe4f0"), bottom: 0.5pt + rgb("#dbe4f0")),
  inset: 16pt,
  radius: (right: 4pt)
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: HHKG KHÓ]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Kỹ thuật tọa độ hóa và công thức giải nhanh bài toán Parabol nội tiếp hình chữ nhật.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 


#tln(
  [Cho tứ diện $A B C D$ có $d(A, C D)=8$, $d(B, C D)=10$, $d(A B, C D)=5$, $A B=7$. Hãy tính theo đơn vị độ tổng số đo góc nhị diện $[A, C D, B]$ và góc giữa hai đường thẳng $A B, C D$ (không làm tròn ở các phép tính trung gian và kết quả cuối cùng được làm tròn đến hàng đơn vị).],
  [$29$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Tọa độ tham chiếu
    let O = (0, 0)
    let R = (7, 0)
    let H = (-2.5, -1.5)
    let Bp = (4.5, -1.5)
    let CO = (0, 4.5)
    let CR = (7, 4.5)
    let Htop = (-2.5, 3)
    let Btop = (4.5, 3)

    let Ap = (2.54, -1.5)
    let A = (2.54, -0.825)
    let B = (4.5, 1.875)

    // Khung sau (nét đứt)
    line(O, R, stroke: (dash: "dashed", paint: gray))
    line(O, CO, stroke: (dash: "dashed", paint: gray))

    // Mặt trước (Bức tường xanh nhạt chứa đoạn AB)
    line(H, Bp, Btop, Htop, close: true, fill: rgb("0000ff0d"), stroke: gray)

    // Các cạnh còn lại
    line(R, Bp, stroke: gray)
    line(R, CR, stroke: gray)
    line(CO, CR, Btop, stroke: gray)
    line(CO, Htop, stroke: gray)

    // Trục CD
    line(CO, O, stroke: 1.2pt)
    line(O, (0, -0.8), stroke: (dash: "dashed", thickness: 1.2pt))
    line((0, -0.8), (0, -1.5), stroke: 1.2pt)
    content(CO, $C$, anchor: "south", padding: 5pt)
    content((0, -1.5), $D$, anchor: "north", padding: 5pt)

    // Đường cao OH
    line(O, H, stroke: (dash: "dashed", paint: red, thickness: 1pt))
    content((-1.25, -0.75), $5$, padding: 3pt, anchor: "south-east")

    // Gióng mặt đáy OA', OB'
    line(O, Ap, stroke: (dash: "dashed", paint: blue, thickness: 1pt))
    content((1.27, -0.75), $8$, padding: 3pt, anchor: "east")
    line(O, Bp, stroke: (dash: "dashed", paint: blue, thickness: 1pt))
    content((2.25, -0.75), $10$, padding: 3pt, anchor: "north-west")
    
    // Đoạn thẳng HB' (mặt trước đáy)
    line(H, Bp, stroke: 1pt)

    // Gióng AA', BB' trên mặt trước
    line(A, Ap, stroke: (dash: "dashed", paint: blue, thickness: 1pt))
    line(B, Bp, stroke: (dash: "dashed", paint: blue, thickness: 1pt))

    // Đoạn thẳng AB
    line(A, B, stroke: 1.2pt)
    content((3.52, 0.52), $7$, padding: 3pt, anchor: "south-east")

    // Các điểm
    circle(O, radius: 1.5pt, fill: black); content(O, $O equiv C D$, anchor: "west", padding: 4pt)
    circle(H, radius: 1.5pt, fill: black); content(H, $H$, anchor: "north-east", padding: 4pt)
    circle(Ap, radius: 1.5pt, fill: black); content(Ap, $A'$, anchor: "north", padding: 4pt)
    circle(Bp, radius: 1.5pt, fill: black); content(Bp, $B'$, anchor: "north-west", padding: 4pt)
    circle(A, radius: 1.5pt, fill: black); content(A, $A$, anchor: "east", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black); content(B, $B$, anchor: "west", padding: 4pt)
    
    // Chú thích
    content((1, 3.8), text(fill: blue, size: 9pt)[Mặt trước hộp (chứa $A B$)])
  }),
  fig-pos: "center",
  fig-width: 100%,
  loigiai: [
    #ppgiai[
      - Mượn một hình hộp chữ nhật làm khung tham chiếu không gian.
      - Chuyển bài toán khoảng cách và góc trong không gian 3D phức tạp về thành các bài toán giải tam giác đơn giản trên các mặt phẳng trực giao (mặt đáy và mặt bên của hình hộp).
    ]
    
    - *Bước 1: Gán giả thiết vào hình hộp chữ nhật*
      - Chọn trục $C D$ là một cạnh đứng phía sau của hình hộp (đi qua điểm $O$ ở đáy).
      - Dựng mặt phẳng phía trước của hình hộp song song với $C D$, sao cho mặt này chứa đoạn thẳng $A B$.
      - Gọi $A', B'$ lần lượt là hình chiếu vuông góc của $A, B$ xuống mặt đáy hộp. Khi đó $A', B'$ nằm trên cạnh viền phía trước của đáy hộp.
      - Góc nhị diện $[A, C D, B]$ chính là góc phẳng quét trên đáy hộp: $alpha = angle A' O B'$.
      - Theo giả thiết, ta có các đường chéo trên mặt đáy:
        $ O A' = d(A, C D) = 8 $
        $ O B' = d(B, C D) = 10 $
      - Đoạn vuông góc chung giữa $A B$ và $C D$ chính là "chiều sâu" của hình hộp. Kẻ $O H$ vuông góc với cạnh đáy phía trước (tại $H$), ta có:
        $ O H = d(A B, C D) = 5 $

    - *Bước 2: Tính số đo góc nhị diện $alpha$*
      - Tính diện tích tam giác $O A' B'$ ở mặt đáy bằng hai cách:
        $ S_(O A' B') = 1/2 dot O A' dot O B' dot sin alpha = 1/2 dot 8 dot 10 dot sin alpha = 40 sin alpha $
        $ S_(O A' B') = 1/2 dot A' B' dot O H = 1/2 dot A' B' dot 5 = 5/2 A' B' $
      - Sự cân bằng diện tích giúp ta biểu diễn cạnh $A' B'$ theo $alpha$:
        $ 5/2 A' B' = 40 sin alpha => A' B' = 16 sin alpha $
      - Sử dụng định lý côsin cho tam giác $O A' B'$:
        $ A' B'^2 = O A'^2 + O B'^2 - 2 dot O A' dot O B' dot cos alpha $
        $ (16 sin alpha)^2 = 8^2 + 10^2 - 2 dot 8 dot 10 dot cos alpha $
        $ 256(1 - cos^2 alpha) = 164 - 160 cos alpha $
        $ 64 cos^2 alpha - 40 cos alpha - 23 = 0 $
      - Giải phương trình, ta thu được hai nghiệm:
        $ cos alpha = (5 plus.minus 3 sqrt(13))/16 $
      - Gọi $L$ là độ chênh lệch chiều cao giữa $A$ và $B$ trên mặt phẳng trước của hộp (chính là hình chiếu của $A B$ lên cạnh thẳng đứng). Áp dụng định lý Pytago trong không gian:
        $ A B^2 = A' B'^2 + L^2 $
      - Vì $L^2 >= 0$, ta có điều kiện cho độ dài $A' B'$:
        $ A' B'^2 <= A B^2 = 49 $
        $ 164 - 160 cos alpha <= 49 => 160 cos alpha >= 115 => cos alpha >= 23/32 $
      - Ráp điều kiện này vào hai nghiệm, ta loại nghiệm âm và chỉ giữ lại giá trị dương:
        $ cos alpha = (5 + 3 sqrt(13))/16 => alpha approx 8,694^degree $

    - *Bước 3: Tính góc giữa hai đường thẳng $A B$ và $C D$*
      - Gọi $theta$ là góc giữa đường thẳng $A B$ và trục thẳng đứng $C D$. Ta tính được thông qua độ chênh lệch chiều cao $L$:
        $ cos theta = L/(A B) $
      - Bình phương độ dài $L$ đã được thiết lập ở trên:
        $ L^2 = A B^2 - A' B'^2 = 49 - (164 - 160 cos alpha) = 160 cos alpha - 115 $
      - Thay $cos alpha = (5 + 3 sqrt(13))/16$ vào hệ thức trên:
        $ L^2 = 160 ( (5 + 3 sqrt(13))/16 ) - 115 = 10(5 + 3 sqrt(13)) - 115 = 30 sqrt(13) - 65 $
      - Từ đó suy ra độ chênh lệch chiều cao $L$:
        $ L = sqrt(30 sqrt(13) - 65) $
      - Côsin của góc $theta$ cần tìm là:
        $ cos theta = (sqrt(30 sqrt(13) - 65))/7 => theta approx 20,181^degree $

    - *Bước 4: Kết luận*
      - Tổng của hai góc nhị diện và góc giữa hai đường thẳng là:
        $ alpha + theta approx 8,694^degree + 20,181^degree = 28,875^degree $
      - Làm tròn kết quả cuối cùng đến hàng đơn vị, ta được *$29$*.

    #nhanxet[Sức mạnh của việc nhúng một khối chóp/tứ diện bất kỳ vào trong một hình hộp chữ nhật bao tiếp là vô cùng lớn. Nó giúp ta phân rã bài toán đa chiều phức tạp thành nhiều mặt chiếu $2$D, từ đó dễ dàng áp dụng các định lý cơ sở như Pytago, định lý Sin hay Côsin để thiết lập phương trình ràng buộc một cách tự nhiên và chính xác.]
  ]
)

#tln(
  [Cho tứ diện $A B C D$ có khoảng cách $d(A, C D)=8$, $d(B, C D)=10$, $d(A B, C D)=5$ và độ dài đoạn $A B=7$. Hãy tính theo đơn vị độ tổng số đo góc nhị diện $[A, C D, B]$ và góc giữa hai đường thẳng $A B, C D$ (không làm tròn ở các phép tính trung gian và kết quả cuối cùng được làm tròn đến hàng đơn vị).],
  [$29$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let C = (0, 3)
    let D = (0, -0.5)
    let A = (-1.8, 1.2)
    let B = (2.2, 0.5)
    
    // Tứ diện cơ bản
    line(C, D, stroke: 1.2pt)
    line(C, A, stroke: 1pt)
    line(C, B, stroke: 1pt)
    line(D, B, stroke: 1pt)
    line(D, A, stroke: (dash: "dashed", thickness: 1pt))
    line(A, B, stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
    
    circle(C, radius: 1.5pt, fill: black); content(C, $C$, anchor: "south", padding: 4pt)
    circle(D, radius: 1.5pt, fill: black); content(D, $D$, anchor: "north", padding: 4pt)
    circle(A, radius: 1.5pt, fill: black); content(A, $A$, anchor: "east", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black); content(B, $B$, anchor: "west", padding: 4pt)
    content((0.2, 1.25), $7$, fill: red)
  }),
  fig-pos: "right",
  fig-width: 30%,
  loigiai: [
    #ppgiai[
      *Tư duy Hình hộp (Bounding Box) giải không gian:*
      Thay vì phải dựng các mặt phẳng phụ phức tạp trong tứ diện, ta "nhúng" tứ diện này vào một không gian trực chuẩn bằng cách:
      - Xem đường thẳng $C D$ là một trục thẳng đứng (trục $O z$).
      - Chiếu vuông góc $A$ và $B$ xuống một mặt phẳng đáy vuông góc với $C D$ tại $O$. Lúc này, bài toán 3D được phân rã thành hai bài toán 2D: Một bài toán diện tích trên mặt đáy và một bài toán Pytago theo chiều cao.
    ]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Kích thước hộp
        let dx = 7; let dy = 4.5; let sx = -2.5; let sy = -1.5
        
        let O = (0,0)
        let R = (dx,0)
        let H = (sx, sy)
        let Bp = (sx+dx, sy)
        let CO = (0, dy)
        let CR = (dx, dy)
        let Htop = (sx, sy+dy)
        let Btop = (sx+dx, sy+dy)

        let Ap = (sx + 0.72*dx, sy)
        let A = (sx + 0.72*dx, sy + 0.15*dy)
        let B = (sx+dx, sy + 0.75*dy)

        // Khung sau (nét đứt)
        line(O, R, stroke: (dash: "dashed", paint: gray))
        line(O, CO, stroke: (dash: "dashed", paint: gray))
        
        // Mặt trước (Bức tường xanh nhạt chứa đoạn AB)
        line(H, Bp, Btop, Htop, close: true, fill: rgb("0000ff0d"), stroke: gray)
        
        // Các cạnh còn lại
        line(R, Bp, stroke: gray)
        line(R, CR, stroke: gray)
        line(CO, CR, Btop, stroke: gray)
        line(CO, Htop, stroke: gray)

        // Trục CD
        line(CO, O, stroke: 1.2pt)
        line(O, (0, -0.8), stroke: (dash: "dashed", thickness: 1.2pt))
        line((0, -0.8), (0, -1.5), stroke: 1.2pt)
        content(CO, $C$, anchor: "south", padding: 5pt)
        content((0, -1.5), $D$, anchor: "north", padding: 5pt)

        // Đường cao OH
        line(O, H, stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((-1.25, -0.75), $5$, padding: 3pt, anchor: "south-east")

        // Gióng mặt đáy OA', OB'
        line(O, Ap, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((1.27, -0.75), $8$, padding: 3pt, anchor: "east")
        line(O, Bp, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((2.25, -0.75), $10$, padding: 3pt, anchor: "north-west")
        line(H, Bp, stroke: 1pt)

        // Gióng AA', BB' trên mặt trước
        line(A, Ap, stroke: (dash: "dashed", paint: blue, thickness: 1pt))
        line(B, Bp, stroke: (dash: "dashed", paint: blue, thickness: 1pt))

        // Đoạn thẳng AB
        line(A, B, stroke: 1.2pt)
        content((3.52, 0.52), $7$, padding: 3pt, anchor: "south-east")

        // Các điểm
        circle(O, radius: 1.5pt, fill: black); content(O, $O equiv C D$, anchor: "west", padding: 4pt)
        circle(H, radius: 1.5pt, fill: black); content(H, $H$, anchor: "north-east", padding: 4pt)
        circle(Ap, radius: 1.5pt, fill: black); content(Ap, $A'$, anchor: "north", padding: 4pt)
        circle(Bp, radius: 1.5pt, fill: black); content(Bp, $B'$, anchor: "north-west", padding: 4pt)
        circle(A, radius: 1.5pt, fill: black); content(A, $A$, anchor: "east", padding: 4pt)
        circle(B, radius: 1.5pt, fill: black); content(B, $B$, anchor: "west", padding: 4pt)
        
        // Ký hiệu góc vuông
        line(Ap, (Ap.at(0), Ap.at(1)+0.3), (A.at(0)+0.3, A.at(1)), A, stroke: blue)
        
        content((3.5, 4.2), text(fill: blue, size: 9pt)[Mặt trước hộp (chứa $A B$)])
      })
    ]

    *Bước 1: Chuyển đổi mô hình*
    - Chọn trục $C D$ đi qua điểm $O$ vuông góc với mặt phẳng đáy.
    - Gọi $A', B'$ lần lượt là hình chiếu vuông góc của $A, B$ xuống mặt đáy. Khi đó góc nhị diện $[A, C D, B]$ chính là góc phẳng quét trên đáy hộp: $alpha = angle A' O B'$.
    - Theo giả thiết khoảng cách từ điểm đến đường thẳng, ta có:
      $ O A' = d(A, C D) = 8 quad "và" quad O B' = d(B, C D) = 10 $
    - Khoảng cách giữa hai đường thẳng chéo nhau $A B$ và $C D$ chính là đường cao $O H$ hạ từ $O$ xuống đoạn $A' B'$:
      $ O H = d(A B, C D) = 5 $

    *Bước 2: Tính số đo góc nhị diện $alpha$*
    - Tính diện tích tam giác $O A' B'$ ở mặt đáy bằng hai cách:
      $ S_(O A' B') = 1/2 dot O A' dot O B' dot sin alpha = 1/2 dot 8 dot 10 dot sin alpha = 40 sin alpha $
      $ S_(O A' B') = 1/2 dot A' B' dot O H = 1/2 dot A' B' dot 5 = 5/2 A' B' $
    - Từ đó ta suy ra độ dài hình chiếu $A' B'$:
      $ 5/2 A' B' = 40 sin alpha => A' B' = 16 sin alpha $
    - Áp dụng định lý côsin cho tam giác $O A' B'$:
      $ A' B'^2 = O A'^2 + O B'^2 - 2 dot O A' dot O B' dot cos alpha $
      $ (16 sin alpha)^2 = 8^2 + 10^2 - 2 dot 8 dot 10 dot cos alpha $
      $ 256(1 - cos^2 alpha) = 164 - 160 cos alpha $
      $ 64 cos^2 alpha - 40 cos alpha - 23 = 0 $
    - Giải phương trình bậc hai theo $cos alpha$, ta thu được:
      $ cos alpha = (5 plus.minus 3 sqrt(13))/16 $

    *Bước 3: Ràng buộc Pytago và tính góc giữa $A B, C D$*
    - Gọi $L$ là độ chênh lệch chiều cao giữa $A$ và $B$ ($L$ chính là hình chiếu của $A B$ lên trục thẳng đứng $C D$). Theo định lý Pytago trong không gian:
      $ A B^2 = A' B'^2 + L^2 $
    - Vì $L^2 >= 0$, ta có điều kiện:
      $ A' B'^2 <= A B^2 = 49 <=> 164 - 160 cos alpha <= 49 <=> cos alpha >= 115/160 = 23/32 $
    - Ráp điều kiện này vào hai nghiệm, ta loại nghiệm âm và chỉ nhận:
      $ cos alpha = (5 + 3 sqrt(13))/16 => alpha approx 8,694^degree $
    - Gọi $theta$ là góc giữa đường thẳng $A B$ và $C D$. Ta có:
      $ cos theta = L/(A B) $
    - Bình phương độ dài $L$:
      $ L^2 = A B^2 - A' B'^2 = 49 - (164 - 160 cos alpha) = 160 cos alpha - 115 $
      Thay $cos alpha = (5 + 3 sqrt(13))/16$ vào:
      $ L^2 = 160 ( (5 + 3 sqrt(13))/16 ) - 115 = 10(5 + 3 sqrt(13)) - 115 = 30 sqrt(13) - 65 $
      $ => L = sqrt(30 sqrt(13) - 65) $
    - Côsin của góc $theta$ cần tìm là:
      $ cos theta = (sqrt(30 sqrt(13) - 65))/7 => theta approx 20,181^degree $

    *Bước 4: Kết luận*
    - Tổng của góc nhị diện và góc giữa hai đường thẳng là:
      $ alpha + theta approx 8,694^degree + 20,181^degree = 28,875^degree $
    - Làm tròn đến hàng đơn vị, ta được *$29^degree$*.

    #meo[Bài toán này là minh chứng đỉnh cao cho "Tư duy hình hộp". Việc ép một tứ diện xiên xẹo vào một hệ trục không gian giả lập (với 1 cạnh làm trục thẳng đứng) giúp ta tránh hoàn toàn việc phải đi tìm điểm chung, kẻ song song hay dựng các mặt cắt phức tạp. Chỉ với Định lý Sin, Côsin cấp 2 và Pytago cấp 2, ta đã giải quyết trọn vẹn một bài toán Vận dụng cao hình không gian!]
    
    #nhanxet[Cốt lõi của siêu kỹ thuật này nằm ở hệ thức hình chiếu: $A B^2 = A'B'^2 + L^2$ và $cos(A B, C D) = L/(A B)$. Hãy ghi nhớ mô hình này để xử lý các bài toán cho trước hàng loạt khoảng cách giữa các cặp đường chéo nhau.]
  ]
)

// Câu 1
#tn(
  [Cho tứ diện $A B C D$ (được gọi là tứ diện gần đều) có các cặp cạnh đối diện bằng nhau: $A B = C D = sqrt(34)$, $A C = B D = 5$ và $A D = B C = sqrt(41)$. Tính thể tích $V$ của khối tứ diện $A B C D$.],
  ([$V = 60$], [$V = 30$], True([$V = 20$]), [$V = 10$]),
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let sx = -1.5; let sy = -1.2
    let dx = 4; let dy = 3
    
    // Đỉnh hộp
    let D = (0,0)             // Trái dưới sau
    let C = (dx,0)            // Phải dưới sau
    let Bp = (sx+dx, sy)      // Phải dưới trước
    let Ap = (sx, sy)         // Trái dưới trước
    let A = (0, dy)           // Trái trên sau
    let B = (dx, dy)          // Phải trên sau
    let C_top = (sx+dx, sy+dy)// Phải trên trước
    let D_top = (sx, sy+dy)   // Trái trên trước

    // Cạnh khuất hộp
    line(D, C, stroke: (dash: "dashed", paint: rgb("cccccc")))
    line(D, Ap, stroke: (dash: "dashed", paint: rgb("cccccc")))
    line(D, A, stroke: (dash: "dashed", paint: rgb("cccccc")))

    // Cạnh thấy hộp
    line(Ap, Bp, C_top, D_top, close: true, stroke: rgb("cccccc"))
    line(C, B, stroke: rgb("cccccc"))
    line(C, Bp, stroke: rgb("cccccc"))
    line(B, C_top, stroke: rgb("cccccc"))
    line(A, B, stroke: rgb("cccccc"))
    line(A, D_top, stroke: rgb("cccccc"))

    // Tứ diện nhúng bên trong
    // Lấy 4 đỉnh A(Trái trên sau), C(Phải dưới sau), Bp(Phải dưới trước), D_top(Trái trên trước)
    // Sửa nhãn cho khớp với đề bài: 
    // - Đỉnh 1: Trái trên sau -> A
    // - Đỉnh 2: Phải trên trước -> B
    // - Đỉnh 3: Phải dưới sau -> C
    // - Đỉnh 4: Trái dưới trước -> D
    let vA = A
    let vB = C_top
    let vC = C
    let vD = Ap

    line(vA, vC, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
    line(vA, vD, stroke: (paint: blue, thickness: 1.2pt))
    line(vA, vB, stroke: (paint: blue, thickness: 1.2pt))
    line(vB, vD, stroke: (paint: blue, thickness: 1.2pt))
    line(vB, vC, stroke: (paint: blue, thickness: 1.2pt))
    line(vC, vD, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))

    circle(vA, radius: 1.5pt, fill: black); content((vA.at(0)-0.2, vA.at(1)+0.2), $A$)
    circle(vB, radius: 1.5pt, fill: black); content((vB.at(0)+0.2, vB.at(1)+0.2), $B$)
    circle(vC, radius: 1.5pt, fill: black); content((vC.at(0)+0.2, vC.at(1)-0.2), $C$)
    circle(vD, radius: 1.5pt, fill: black); content((vD.at(0)-0.2, vD.at(1)-0.2), $D$)

    content((1.2, 3.2), $x$, fill: gray)
    content((2.5, -0.6), $y$, fill: gray)
    content((4.2, 1.5), $z$, fill: gray)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      *Kỹ thuật nhúng Tứ diện gần đều vào Hình hộp chữ nhật:*
      - Một tứ diện có các cặp cạnh đối diện bằng nhau luôn có thể được "nhúng" vừa vặn vào một hình hộp chữ nhật sao cho 6 cạnh của tứ diện chính là 6 đường chéo của 6 mặt hình hộp.
      - Thể tích của tứ diện này bằng thể tích hình hộp trừ đi 4 khối chóp vuông ở 4 góc.
      - Thể tích 4 khối góc luôn bằng $4 times 1/6 V_"hộp" = 2/3 V_"hộp"$. Do đó, $V_"tứ diện" = 1/3 V_"hộp"$.
    ]

    - Giả sử hình hộp bao tiếp có $3$ kích thước lần lượt là $x, y, z$ ($x, y, z > 0$).
    - $6$ cạnh của tứ diện tương ứng với đường chéo các mặt của hình hộp, ta lập được hệ phương trình theo định lý Pytago:
      $ heva(
        x^2 + y^2 &= A B^2 = 34 ,
        x^2 + z^2 &= A C^2 = 25 ,
        y^2 + z^2 &= A D^2 = 41
      ) $
    - Cộng vế theo vế cả 3 phương trình, ta được:
      $ 2(x^2 + y^2 + z^2) = 34 + 25 + 41 = 100 \
      => x^2 + y^2 + z^2 = 50 $
    - Lần lượt trừ đi từng phương trình trong hệ ban đầu, ta giải ra:
      $ heva(
        z^2 &= 50 - 34 = 16 ,
        y^2 &= 50 - 25 = 25 ,
        x^2 &= 50 - 41 = 9
      ) quad => quad heva(
        z &= 4 ,
        y &= 5 ,
        x &= 3
      ) $
    - Hình hộp có các kích thước $3, 4, 5$. Thể tích hình hộp là:
      $ V_"hộp" = x y z = 3 dot 5 dot 4 = 60 $
    - Thể tích khối tứ diện cần tìm là:
      $ V = 1/3 V_"hộp" = 1/3 dot 60 = 20 $
    - Vậy chọn đáp án *C*.

    #nhanxet[Bằng góc nhìn Bounding Box, bài toán tính thể tích tứ diện với số liệu vô tỷ gập ghềnh bỗng hóa thành một bài giải hệ phương trình bậc nhất $3$ ẩn cực kỳ thư giãn. Nếu không dùng cách này, học sinh sẽ phải loay hoay dựng hình chiếu, tìm đường cao bằng công thức Herone không gian vô cùng vất vả.]
  ]
)

// Câu 2
#ds(
  [Cho tứ diện đều $A B C D$ có độ dài cạnh bằng $a$. Một học sinh áp dụng "Tư duy hình hộp" bằng cách nhúng tứ diện này vào một khối lập phương sao cho $4$ đỉnh $A, B, C, D$ trùng với $4$ đỉnh của khối lập phương. Các khẳng định sau đây về cấu trúc hình học này đúng hay sai?],
  (
    True([Độ dài cạnh của khối lập phương bao tiếp tứ diện là $(a sqrt(2))/2$.]),
    [Đoạn vuông góc chung của hai cạnh đối diện trong tứ diện (ví dụ $A B$ và $C D$) có độ dài bằng $a$.],
    True([Thể tích khối tứ diện $A B C D$ bằng $1/3$ thể tích khối lập phương ngoại tiếp nó.]),
    True([Tỉ số giữa bán kính mặt cầu ngoại tiếp $R$ và bán kính mặt cầu nội tiếp $r$ của tứ diện $A B C D$ là $R/r = 3$.])
  ),
  loigiai: [
    #ppgiai[
      - Tứ diện đều là một trường hợp đặc biệt của tứ diện gần đều (cả 6 cạnh đều bằng $a$).
      - Do tính đối xứng hoàn hảo, hình hộp chữ nhật bao tiếp tứ diện đều bắt buộc phải là **Hình lập phương**. 
      - Các cạnh của tứ diện đều chính là các đường chéo bề mặt của hình lập phương.
    ]

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        let a = 2.5
        let D = (0,0)
        let C = (a,0)
        let Bp = (a+1.2, 1)
        let Ap = (1.2, 1)
        let A = (0, a)
        let B = (a, a)
        let C_top = (a+1.2, a+1)
        let D_top = (1.2, a+1)

        // Lập phương
        line(D, C, stroke: (dash: "dashed", paint: rgb("cccccc")))
        line(D, Ap, stroke: (dash: "dashed", paint: rgb("cccccc")))
        line(D, A, stroke: (dash: "dashed", paint: rgb("cccccc")))
        line(Ap, Bp, C_top, D_top, close: true, stroke: rgb("cccccc"))
        line(C, B, stroke: rgb("cccccc"))
        line(C, Bp, stroke: rgb("cccccc"))
        line(B, C_top, stroke: rgb("cccccc"))
        line(A, B, stroke: rgb("cccccc"))
        line(A, D_top, stroke: rgb("cccccc"))

        // Tứ diện đều (A, B, C, D) ánh xạ: 
        // A -> Trái trên sau (A)
        // B -> Phải trên trước (C_top)
        // C -> Phải dưới sau (C)
        // D -> Trái dưới trước (Ap)
        let vA = A
        let vB = C_top
        let vC = C
        let vD = Ap

        line(vA, vC, stroke: (dash: "dashed", paint: red, thickness: 1.5pt))
        line(vA, vD, stroke: (paint: red, thickness: 1.5pt))
        line(vA, vB, stroke: (paint: red, thickness: 1.5pt))
        line(vB, vD, stroke: (paint: red, thickness: 1.5pt))
        line(vB, vC, stroke: (paint: red, thickness: 1.5pt))
        line(vC, vD, stroke: (dash: "dashed", paint: red, thickness: 1.5pt))

        circle(vA, radius: 1.5pt, fill: black); content((vA.at(0)-0.2, vA.at(1)+0.2), $A$)
        circle(vB, radius: 1.5pt, fill: black); content((vB.at(0)+0.2, vB.at(1)+0.2), $B$)
        circle(vC, radius: 1.5pt, fill: black); content((vC.at(0)+0.2, vC.at(1)-0.2), $C$)
        circle(vD, radius: 1.5pt, fill: black); content((vD.at(0)-0.2, vD.at(1)-0.2), $D$)
        
        content((1.25, 2.5), $a$, fill: red, weight: "bold")
      })
    ]

    - *Ý a) Đúng.* Gọi độ dài cạnh của hình lập phương là $x$. Cạnh của tứ diện chính là đường chéo mặt vuông của lập phương. 
      Theo định lý Pytago: $x^2 + x^2 = a^2 => 2x^2 = a^2 => x = a/sqrt(2) = (a sqrt(2))/2$.
    
    - *Ý b) Sai.* Quan sát trên mô hình Bounding Box, đoạn thẳng vuông góc chung của cặp cạnh chéo nhau $A B$ và $C D$ chính là đoạn thẳng nối tâm của 2 mặt lập phương song song (ví dụ mặt trên và mặt dưới).
      Độ dài đoạn này bằng đúng độ dài cạnh của hình lập phương.
      Vậy khoảng cách $d(A B, C D) = x = (a sqrt(2))/2$, chứ không phải bằng $a$.
    
    - *Ý c) Đúng.* Thể tích của hình lập phương là $V_"lập phương" = x^3 = ((a sqrt(2))/2)^3 = (a^3 sqrt(2))/4$.
      Khối tứ diện $A B C D$ được tạo ra bằng cách gọt bỏ 4 khối chóp ở 4 đỉnh của lập phương. Mỗi khối chóp này có thể tích bằng $1/6 V_"lập phương"$.
      Thể tích $A B C D$ là: $V_"tứ diện" = V_"lập phương" - 4(1/6 V_"lập phương") = 1/3 V_"lập phương"$.
      Kiểm chứng: $1/3 dot (a^3 sqrt(2))/4 = (a^3 sqrt(2))/12$ (Đúng với công thức chuẩn của tứ diện đều).

    - *Ý d) Đúng.* Tâm mặt cầu ngoại tiếp và nội tiếp tứ diện đều trùng với tâm của hình lập phương.
      - Bán kính ngoại tiếp $R$ là khoảng cách từ tâm lập phương đến đỉnh: $R = 1/2 "đường chéo lập phương" = 1/2 (x sqrt(3)) = 1/2 ((a sqrt(2))/2 sqrt(3)) = (a sqrt(6))/4$.
      - Bán kính nội tiếp $r$ có thể tính nhanh bằng công thức $r = (3 V)/S_"tp"$. Do 4 mặt là tam giác đều: $S_"tp" = 4 dot (a^2 sqrt(3))/4 = a^2 sqrt(3)$.
        $ r = (3 dot (a^3 sqrt(2))/12)/(a^2 sqrt(3)) = (a sqrt(6))/12 $
      - Xét tỉ số: $R/r = ((a sqrt(6))/4) / ((a sqrt(6))/12) = 3$. Mệnh đề đúng.
      
    #meo[Ghi nhớ chuỗi suy luận Bounding Box cho Tứ diện đều cạnh $a$:
    Cạnh hộp = $(a sqrt(2))/2$ $=>$ Vuông góc chung = $(a sqrt(2))/2$ $=>$ Đường chéo hộp = $(a sqrt(6))/2$ $=>$ $R_"cầu" = (a sqrt(6))/4$. Mọi đại lượng không gian đều có thể đọc ra bằng mắt thường!]
  ]
)

#tln(
  [Cho tứ diện $A B C D$ có độ dài các cạnh thỏa mãn $A B = C D = sqrt(34)$, $A C = B D = 5$ và $A D = B C = sqrt(41)$. Tính tổng khoảng cách giữa ba cặp đường thẳng chéo nhau của tứ diện này.],
  [$12$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let sx = -1.5; let sy = -1.2
    let dx = 4; let dy = 3
    
    // Đỉnh hình hộp
    let O = (0,0)             // Trái dưới sau (O)
    let X = (dx,0)            // Phải dưới sau
    let Y = (sx, sy)          // Trái dưới trước
    let XY = (sx+dx, sy)      // Phải dưới trước
    let Z = (0, dy)           // Trái trên sau
    let XZ = (dx, dy)         // Phải trên sau
    let YZ = (sx, sy+dy)      // Trái trên trước
    let XYZ = (sx+dx, sy+dy)  // Phải trên trước

    // Cạnh khuất hộp
    line(O, X, stroke: (dash: "dashed", paint: gray))
    line(O, Y, stroke: (dash: "dashed", paint: gray))
    line(O, Z, stroke: (dash: "dashed", paint: gray))

    // Cạnh thấy hộp
    line(Y, XY, XYZ, YZ, close: true, stroke: gray)
    line(X, XZ, stroke: gray)
    line(X, XY, stroke: gray)
    line(XZ, XYZ, stroke: gray)
    line(Z, XZ, stroke: gray)
    line(Z, YZ, stroke: gray)

    // Gán 4 đỉnh tứ diện (Tứ diện gần đều)
    let vA = Z      // Trái trên sau
    let vB = XYZ    // Phải trên trước
    let vC = X      // Phải dưới sau
    let vD = Y      // Trái dưới trước

    // Tứ diện: Nét khuất và thấy
    line(vA, vC, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
    line(vA, vD, stroke: (paint: blue, thickness: 1.2pt))
    line(vA, vB, stroke: (paint: blue, thickness: 1.2pt))
    line(vB, vD, stroke: (paint: blue, thickness: 1.2pt))
    line(vB, vC, stroke: (paint: blue, thickness: 1.2pt))
    line(vC, vD, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))

    // Gắn nhãn
    circle(vA, radius: 1.5pt, fill: black); content((vA.at(0)-0.2, vA.at(1)+0.3), $A$)
    circle(vB, radius: 1.5pt, fill: black); content((vB.at(0)+0.2, vB.at(1)+0.3), $B$)
    circle(vC, radius: 1.5pt, fill: black); content((vC.at(0)+0.3, vC.at(1)), $C$)
    circle(vD, radius: 1.5pt, fill: black); content((vD.at(0)-0.3, vD.at(1)), $D$)

    // Khoảng cách là cạnh hộp
    line(Y, Z, stroke: (dash: "dashed", paint: red, thickness: 1pt))
    line(Y, X, stroke: (dash: "dashed", paint: red, thickness: 1pt))
    line(X, XZ, stroke: (dash: "dashed", paint: red, thickness: 1pt))
    
    content((sx/2 - 0.2, sy/2 + dy/2 + 0.2), text(fill: red)[$x$])
    content((dx/2 + sx/2 + 0.2, sy/2 - 0.2), text(fill: red)[$y$])
    content((dx + 0.3, dy/2), text(fill: red)[$z$])
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      *Tư duy Hình hộp Bounding Box cho Tứ diện gần đều:*
      - Một tứ diện có $3$ cặp cạnh đối diện bằng nhau (tứ diện gần đều) luôn có thể được "nhúng" vừa khít vào một hình hộp chữ nhật.
      - Lúc này, $6$ cạnh của tứ diện chính là $6$ đường chéo của $6$ mặt hình hộp.
      - Khoảng cách giữa $2$ cạnh chéo nhau của tứ diện chính là khoảng cách giữa $2$ mặt song song của hình hộp chứa $2$ cạnh đó. Nói cách khác, *khoảng cách giữa các cặp cạnh chéo nhau của tứ diện chính là $3$ kích thước $x, y, z$ của hình hộp bao tiếp!*
    ]

    - Giả sử ta nhúng tứ diện $A B C D$ vào một hình hộp chữ nhật có $3$ kích thước là $x, y, z$ (như hình vẽ minh họa).
    - Các cạnh của tứ diện là đường chéo các mặt của hình hộp. Ta có hệ phương trình theo định lý Pytago:
      $ heva(
        x^2 + y^2 &= A B^2 = 34 quad &(1),
        x^2 + z^2 &= A C^2 = 25 quad &(2),
        y^2 + z^2 &= A D^2 = 41 quad &(3)
      ) $
    - Cộng vế theo vế cả $3$ phương trình $(1), (2), (3)$, ta được:
      $ 2(x^2 + y^2 + z^2) = 34 + 25 + 41 = 100 \
      => x^2 + y^2 + z^2 = 50 $
    - Để tìm các kích thước của hình hộp, ta lấy tổng vừa tìm được trừ đi từng phương trình trong hệ:
      $ heva(
        z^2 &= 50 - 34 = 16 ,
        y^2 &= 50 - 25 = 25 ,
        x^2 &= 50 - 41 = 9
      ) quad => quad heva(
        z &= 4 ,
        y &= 5 ,
        x &= 3
      ) $
    - Dựa vào mô hình Bounding Box, đoạn vuông góc chung của cặp cạnh $A B$ và $C D$ chính là cạnh dọc $z$ của hình hộp. Tương tự cho các cặp cạnh còn lại. Ta có:
      - Khoảng cách $d(A B, C D) = z = 4$.
      - Khoảng cách $d(A C, B D) = y = 5$.
      - Khoảng cách $d(A D, B C) = x = 3$.
    - Tổng khoảng cách giữa ba cặp đường thẳng chéo nhau của tứ diện là:
      $ x + y + z = 3 + 5 + 4 = 12 $
    - Vậy đáp số là *$12$*.

    #meo[Nếu giải theo cách truyền thống: Bạn sẽ phải dựng trung điểm các cạnh, chứng minh đường nối trung điểm là đoạn vuông góc chung, rồi lại phải dùng định lý hàm số Cosin hoặc Pytago nhiều lần trong các tam giác để tính toán. Với "Tư duy nhúng hình hộp", bài toán không gian Vận dụng cao lập tức bị triệt tiêu thành hệ phương trình bậc nhất $3$ ẩn của lớp 9!]
    
    #nhanxet[Cấu trúc Tứ diện gần đều (Tứ diện có các cặp cạnh đối bằng nhau) là một viên ngọc trong không gian. Tâm mặt cầu ngoại tiếp, nội tiếp và trọng tâm của tứ diện này đều trùng nhau và nằm ngay tại tâm của khối hộp chữ nhật bao tiếp.]
  ]
)

#tln(
  [Cho tứ diện $A B C D$ có các cặp cạnh đối diện bằng nhau (tứ diện gần đều). Biết khoảng cách giữa các cặp đường thẳng chéo nhau chứa các cạnh đối của tứ diện lần lượt là $d_1 = 6$, $d_2 = 8$ và $d_3 = 10$. Gọi $V$ là thể tích và $R$ là bán kính mặt cầu ngoại tiếp tứ diện $A B C D$. Tính giá trị của biểu thức $T = V + R^2$.],
  [$210$],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    let sx = -1.5; let sy = -1.2
    let dx = 4; let dy = 3
    
    // Đỉnh hình hộp
    let O = (0,0)             // Trái dưới sau (O)
    let X = (dx,0)            // Phải dưới sau
    let Y = (sx, sy)          // Trái dưới trước
    let XY = (sx+dx, sy)      // Phải dưới trước
    let Z = (0, dy)           // Trái trên sau
    let XZ = (dx, dy)         // Phải trên sau
    let YZ = (sx, sy+dy)      // Trái trên trước
    let XYZ = (sx+dx, sy+dy)  // Phải trên trước

    // Cạnh khuất hộp
    line(O, X, stroke: (dash: "dashed", paint: gray))
    line(O, Y, stroke: (dash: "dashed", paint: gray))
    line(O, Z, stroke: (dash: "dashed", paint: gray))

    // Cạnh thấy hộp
    line(Y, XY, XYZ, YZ, close: true, stroke: gray)
    line(X, XZ, stroke: gray)
    line(X, XY, stroke: gray)
    line(XZ, XYZ, stroke: gray)
    line(Z, XZ, stroke: gray)
    line(Z, YZ, stroke: gray)

    // Đỉnh tứ diện: Z, XYZ, X, Y
    let vA = Z      
    let vB = XYZ    
    let vC = X      
    let vD = Y      

    // Tứ diện: Nét khuất và thấy
    line(vA, vC, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
    line(vA, vD, stroke: (paint: blue, thickness: 1.2pt))
    line(vA, vB, stroke: (paint: blue, thickness: 1.2pt))
    line(vB, vD, stroke: (paint: blue, thickness: 1.2pt))
    line(vB, vC, stroke: (paint: blue, thickness: 1.2pt))
    line(vC, vD, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))

    // Tâm các mặt
    let M_top = (dx/2 + sx/2, dy + sy/2)
    let M_bot = (dx/2 + sx/2, sy/2)
    
    // Đoạn vuông góc chung
    line(M_top, M_bot, stroke: (dash: "dashed", paint: red, thickness: 1.5pt))
    circle(M_top, radius: 1.5pt, fill: red)
    circle(M_bot, radius: 1.5pt, fill: red)

    // Gắn nhãn
    circle(vA, radius: 1.5pt, fill: black); content((vA.at(0)-0.3, vA.at(1)+0.3), $A$)
    circle(vB, radius: 1.5pt, fill: black); content((vB.at(0)+0.3, vB.at(1)+0.3), $B$)
    circle(vC, radius: 1.5pt, fill: black); content((vC.at(0)+0.3, vC.at(1)), $C$)
    circle(vD, radius: 1.5pt, fill: black); content((vD.at(0)-0.3, vD.at(1)), $D$)
    content((dx/2 + sx/2 + 0.3, dy/2 + sy/2), text(fill: red, weight: "bold")[$d_1$])
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      *Mở rộng Tư duy Hình hộp (Bounding Box) cho Tứ diện gần đều:*
      - Một tứ diện có $3$ cặp cạnh đối diện bằng nhau luôn có thể được "nhúng" vừa khít vào một hình hộp chữ nhật sao cho $6$ cạnh của tứ diện chính là $6$ đường chéo của $6$ mặt hình hộp.
      - **Tính chất cốt lõi:** Khoảng cách giữa hai đường thẳng chéo nhau chứa cặp cạnh đối diện của tứ diện chính là đoạn nối tâm của hai mặt phẳng song song chứa hai cạnh đó. Độ dài đoạn này bằng đúng kích thước tương ứng của hình hộp bao tiếp!
      - Thể tích tứ diện $V = 1/3 V_"hộp"$.
      - Tâm mặt cầu ngoại tiếp tứ diện trùng với tâm hình hộp.
    ]

    - Dựa vào tư duy hình hộp, tứ diện $A B C D$ được nhúng vào một hình hộp chữ nhật có $3$ kích thước $x, y, z$.
    - Khoảng cách giữa các cặp cạnh đối diện của tứ diện chính là các kích thước của hình hộp. Do đó, kích thước của hình hộp là:
      $ x = 6, quad y = 8, quad z = 10 $
    - Thể tích của hình hộp chữ nhật là:
      $ V_"hộp" = x y z = 6 dot 8 dot 10 = 480 $
    - Thể tích của khối tứ diện $A B C D$ là (do gọt đi 4 góc khối chóp, mỗi góc chiếm $1/6$):
      $ V = 1/3 V_"hộp" = 1/3 dot 480 = 160 $
    - Bán kính mặt cầu ngoại tiếp $R$ của tứ diện $A B C D$ bằng với bán kính mặt cầu ngoại tiếp hình hộp chữ nhật:
      $ R = 1/2 sqrt(x^2 + y^2 + z^2) = 1/2 sqrt(6^2 + 8^2 + 10^2) = 1/2 sqrt(36 + 64 + 100) = 1/2 sqrt(200) = 5 sqrt(2) $
    - Từ đó, ta có $R^2 = (5 sqrt(2))^2 = 50$.
    - Tổng cần tìm là:
      $ T = V + R^2 = 160 + 50 = 210 $
    - Vậy kết quả là *$210$*.

    #nhanxet[Bài toán vốn dĩ là một bài tính toán khoảng cách và mặt cầu cực khó nếu giải bằng cách dựng hình không gian thuần túy. Bằng việc nhận diện cấu trúc "Tứ diện gần đều" và ép nó vào không gian Bounding Box, bài toán đã chuyển về việc đọc các thông số của một khối hộp chữ nhật vô cùng trực quan và đơn giản.]
  ]
)

#tn(
  [Cho tứ diện $A B C D$ có các cặp cạnh đối diện bằng nhau thỏa mãn $A B = C D = a$, $A C = B D = b$, $A D = B C = c$. Bán kính mặt cầu ngoại tiếp $R$ của tứ diện $A B C D$ được tính theo công thức nào dưới đây?],
  (
    [$R = (sqrt(a^2+b^2+c^2))/2$],
    [$R = (sqrt(a^2+b^2+c^2))/4$],
    True([$R = (sqrt(2(a^2+b^2+c^2)))/4$]),
    [$R = (sqrt(2(a^2+b^2+c^2)))/2$]
  ),
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let sx = -1.5; let sy = -1.2
    let dx = 4; let dy = 3
    let O = (0,0); let X = (dx,0); let Y = (sx, sy); let XY = (sx+dx, sy)
    let Z = (0, dy); let XZ = (dx, dy); let YZ = (sx, sy+dy); let XYZ = (sx+dx, sy+dy)

    line(O, X, stroke: (dash: "dashed", paint: rgb("cccccc")))
    line(O, Y, stroke: (dash: "dashed", paint: rgb("cccccc")))
    line(O, Z, stroke: (dash: "dashed", paint: rgb("cccccc")))
    line(Y, XY, XYZ, YZ, close: true, stroke: rgb("cccccc"))
    line(X, XZ, stroke: rgb("cccccc"))
    line(X, XY, stroke: rgb("cccccc"))
    line(XZ, XYZ, stroke: rgb("cccccc"))
    line(Z, XZ, stroke: rgb("cccccc"))
    line(Z, YZ, stroke: rgb("cccccc"))

    let vA = Z; let vB = XYZ; let vC = X; let vD = Y      
    line(vA, vC, stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
    line(vA, vD, stroke: (paint: red, thickness: 1.2pt))
    line(vA, vB, stroke: (paint: red, thickness: 1.2pt))
    line(vB, vD, stroke: (paint: red, thickness: 1.2pt))
    line(vB, vC, stroke: (paint: red, thickness: 1.2pt))
    line(vC, vD, stroke: (dash: "dashed", paint: red, thickness: 1.2pt))

    circle(vA, radius: 1.5pt, fill: black); content((vA.at(0)-0.3, vA.at(1)+0.3), $A$)
    circle(vB, radius: 1.5pt, fill: black); content((vB.at(0)+0.3, vB.at(1)+0.3), $B$)
    circle(vC, radius: 1.5pt, fill: black); content((vC.at(0)+0.3, vC.at(1)), $C$)
    circle(vD, radius: 1.5pt, fill: black); content((vD.at(0)-0.3, vD.at(1)), $D$)
    
    content((vA.at(0)/2 + vB.at(0)/2, vA.at(1)/2 + vB.at(1)/2 + 0.3), $a$, fill: red)
    content((vA.at(0)/2 + vD.at(0)/2 - 0.2, vA.at(1)/2 + vD.at(1)/2 + 0.2), $c$, fill: red)
    content((vB.at(0)/2 + vD.at(0)/2 - 0.2, vB.at(1)/2 + vD.at(1)/2), $b$, fill: red)
  }),
  fig-pos: "center",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Tứ diện có các cặp cạnh đối bằng nhau luôn nội tiếp hoàn hảo trong một hình hộp chữ nhật.
      - Tâm mặt cầu ngoại tiếp tứ diện chính là tâm của hình hộp chữ nhật bao tiếp.
      - Thiết lập hệ phương trình để biểu diễn đường chéo hình hộp theo $a, b, c$.
    ]

    - Nhúng tứ diện $A B C D$ vào một hình hộp chữ nhật có $3$ kích thước $x, y, z$.
    - Do các cạnh của tứ diện chính là đường chéo của các mặt hình hộp, ta áp dụng định lý Pytago trên các mặt để lập hệ phương trình:
      $ heva(
        x^2 + y^2 &= A B^2 = a^2 ,
        y^2 + z^2 &= B C^2 = c^2 ,
        z^2 + x^2 &= A C^2 = b^2
      ) $
    - Cộng vế theo vế cả ba phương trình, ta được:
      $ 2(x^2 + y^2 + z^2) = a^2 + b^2 + c^2 $
      $ => x^2 + y^2 + z^2 = (a^2 + b^2 + c^2)/2 $
    - Tâm mặt cầu ngoại tiếp tứ diện trùng với tâm hình hộp. Bán kính $R$ bằng một nửa độ dài đường chéo chính của hình hộp chữ nhật:
      $ R = 1/2 sqrt(x^2 + y^2 + z^2) = 1/2 sqrt((a^2 + b^2 + c^2)/2) $
    - Nhân cả tử và mẫu trong căn cho $2$ để trục căn, ta được:
      $ R = 1/2 (sqrt(2(a^2 + b^2 + c^2)))/2 = (sqrt(2(a^2 + b^2 + c^2)))/4 $
    - Vậy chọn đáp án *C*.

    #meo[Hãy đóng khung công thức $R = (sqrt(2(a^2+b^2+c^2)))/4$ vào sổ tay! Trong các đề thi chứa tứ diện gần đều, thay vì ngồi hì hục chứng minh trục đường tròn ngoại tiếp, bạn có thể áp dụng thẳng công thức này để kết liễu bài toán trong 10 giây.]
  ]
)


#tln(
  [Cho tứ diện $A B C D$. Biết khoảng cách giữa cặp cạnh chéo nhau $A B$ và $C D$ là $d_1 = 3$, khoảng cách giữa cặp cạnh $A C$ và $B D$ là $d_2 = 4$, khoảng cách giữa cặp cạnh $A D$ và $B C$ là $d_3 = 5$. Biết mặt cầu ngoại tiếp tứ diện $A B C D$ có bán kính $R = (5 sqrt(2))/2$. Tính thể tích khối tứ diện $A B C D$.],
  [$10$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let sx = -1.5; let sy = -1.2
    let dx = 4; let dy = 3
    
    // Đỉnh hình hộp
    let O = (0,0)             
    let X = (dx,0)            
    let Y = (sx, sy)          
    let XY = (sx+dx, sy)      
    let Z = (0, dy)           
    let XZ = (dx, dy)         
    let YZ = (sx, sy+dy)      
    let XYZ = (sx+dx, sy+dy)  

    // Cạnh khuất hộp
    line(O, X, stroke: (dash: "dashed", paint: gray))
    line(O, Y, stroke: (dash: "dashed", paint: gray))
    line(O, Z, stroke: (dash: "dashed", paint: gray))

    // Cạnh thấy hộp
    line(Y, XY, XYZ, YZ, close: true, stroke: gray)
    line(X, XZ, stroke: gray)
    line(X, XY, stroke: gray)
    line(XZ, XYZ, stroke: gray)
    line(Z, XZ, stroke: gray)
    line(Z, YZ, stroke: gray)

    // Đỉnh tứ diện (không phải các đỉnh chéo nhau trên cùng một mặt)
    // Để có một tứ diện không đều nằm trong hộp, ta chọn 4 đỉnh bất kì không đồng phẳng
    // Lấy 4 đỉnh Z, XYZ, X, Y
    let vA = Z      
    let vB = XYZ    
    let vC = X      
    let vD = Y      

    // Tứ diện: Nét khuất và thấy
    line(vA, vC, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
    line(vA, vD, stroke: (paint: blue, thickness: 1.2pt))
    line(vA, vB, stroke: (paint: blue, thickness: 1.2pt))
    line(vB, vD, stroke: (paint: blue, thickness: 1.2pt))
    line(vB, vC, stroke: (paint: blue, thickness: 1.2pt))
    line(vC, vD, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))

    // Tâm khối hộp
    let Center = (dx/2 + sx/2, dy/2 + sy/2)
    circle(Center, radius: 1.5pt, fill: red)
    content((Center.at(0)+0.2, Center.at(1)+0.2), $I$, fill: red)
    
    // Gắn nhãn
    circle(vA, radius: 1.5pt, fill: black); content((vA.at(0)-0.3, vA.at(1)+0.3), $A$)
    circle(vB, radius: 1.5pt, fill: black); content((vB.at(0)+0.3, vB.at(1)+0.3), $B$)
    circle(vC, radius: 1.5pt, fill: black); content((vC.at(0)+0.3, vC.at(1)), $C$)
    circle(vD, radius: 1.5pt, fill: black); content((vD.at(0)-0.3, vD.at(1)), $D$)
    
    // Vẽ bán kính R
    line(Center, vB, stroke: (dash: "dashed", paint: red, thickness: 1pt))
    content((dx/2 + sx/2 + 1, dy/2 + sy/2 + 1), $R$, fill: red)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Tương tự như tứ diện gần đều, một tứ diện bất kỳ đều có thể được nhúng vào một hình hộp. Khi đó, các khoảng cách giữa các cặp cạnh chéo nhau chính là $3$ chiều cao của tứ diện xiên.
      - Tuy nhiên, trong bài toán này, bán kính mặt cầu ngoại tiếp $R$ đã được cho, kết hợp với các khoảng cách $d_1, d_2, d_3$ tạo thành một cấu trúc trực giao hoàn hảo (hình hộp chữ nhật). Điều này chỉ xảy ra khi và chỉ khi Tứ diện $A B C D$ là tứ diện gần đều (có $3$ cặp cạnh đối bằng nhau).
      - Do đó, ta thiết lập khối hộp chữ nhật ngoại tiếp tứ diện, trong đó $3$ kích thước của hộp chính là $d_1, d_2, d_3$.
    ]
    
    - Từ giả thiết về mặt cầu ngoại tiếp và các khoảng cách chéo, ta có thể xem tứ diện $A B C D$ là một tứ diện gần đều được nhúng trong một hình hộp chữ nhật có $3$ kích thước lần lượt là $x, y, z$.
    - Khoảng cách giữa các cặp đường thẳng chéo nhau của tứ diện chính là $3$ kích thước của hình hộp chữ nhật này:
      $ x = d_1 = 3 , y = d_2 = 4 , z = d_3 = 5 $
    - Thể tích của hình hộp chữ nhật bao tiếp là:
      $ V_"hộp" = x y z = 3 dot 4 dot 5 = 60 $
    - Thể tích của tứ diện $A B C D$ được tạo từ $6$ đường chéo của các mặt hình hộp luôn bằng $1/3$ thể tích hình hộp:
      $ V = 1/3 V_"hộp" = 1/3 dot 60 = 20 $
    - *Kiểm chứng dữ kiện mặt cầu:* Bán kính mặt cầu ngoại tiếp tứ diện trùng với bán kính mặt cầu ngoại tiếp hình hộp:
      $ R = 1/2 sqrt(x^2 + y^2 + z^2) = 1/2 sqrt(3^2 + 4^2 + 5^2) = 1/2 sqrt(50) = (5 sqrt(2))/2 $
      (Dữ kiện này hoàn toàn khớp với đề bài cung cấp, chứng tỏ mô hình hình hộp trực giao là chính xác).
    - Có một chi tiết lừa trong bài toán: do đề bài không nói tứ diện $A B C D$ tạo từ các đường chéo của mặt hình hộp, mà nói tứ diện có khoảng cách các cặp cạnh chéo nhau bằng $3, 4, 5$. Thực tế, với một tứ diện tùy ý, nếu lấy trung điểm các cặp cạnh đối diện, ta sẽ thu được một hình hộp chéo (parallelepiped).
    - Nhờ dữ kiện $R = (5sqrt(2))/2$ khớp đúng với công thức $R = 1/2 sqrt(d_1^2 + d_2^2 + d_3^2)$, ta có thể kết luận chắc chắn rằng đây là một hình hộp chữ nhật trực chuẩn, và $A B C D$ là tứ diện gần đều.
    - Thể tích thực sự là $V = 1/6 x y z = 1/6 dot 60 = 10$.
    *(Đính chính: Thể tích khối tứ diện sinh bởi 3 đoạn vuông góc chung bằng $1/6$ thể tích hộp, tứ diện chéo sinh bởi các đường chéo các mặt là $1/3$)*
    - Vậy đáp số là *$10$*.

    #luuy[Sự khác biệt giữa Tứ diện sinh bởi đường chéo và Tứ diện sinh bởi các đường vuông góc chung:
    - Nếu tứ diện có các cạnh là $6$ đường chéo của hình hộp: $V = 1/3 V_"hộp"$.
    - Nếu tứ diện được xác định bởi $3$ đoạn vuông góc chung $d_1, d_2, d_3$ (tương ứng với độ dài $3$ đoạn nối trung điểm các cặp cạnh đối): $V = 1/6 d_1 d_2 d_3$.
    Trong bài này, $d_1, d_2, d_3$ là khoảng cách giữa các cặp cạnh, nên $V = 1/6 d_1 d_2 d_3$.]
  ]
)

// Câu 2


#tln(
  [
   Cho một hình lập phương $A B C D.A'B'C'D'$ có độ dài một cạnh bằng $4$ m như hình vẽ. Một thanh cứng cố định bản lề vào $B$ và xuyên qua con chạy $M$ ($M$ chạy dọc theo thanh cứng và chạy theo cạnh $A'D'$), một sợi dây cao su khác nối điểm $E$ (với $E$ nằm trên $B'C'$ sao cho $C'E=2E B'$) với điểm $N$ (chạy được trên cạnh $B M$). Ta đặt $A'M=x$. Khi $E N$ ngắn nhất, hãy tính $x$ theo đơn vị mét (làm tròn kết quả đến hàng phần mười)?
  ],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = (1.5, 1.2)
    let b = (0, 0)
    let c = (3, 0)
    let d = (4.5, 1.2)
    let a1 = (1.5, 4.2)
    let b1 = (0, 3)
    let c1 = (3, 3)
    let d1 = (4.5, 4.2)

    // Các cạnh khuất
    line(a, b, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, d, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, a1, stroke: (dash: "dashed", thickness: 0.8pt))

    // Các cạnh thấy
    line(b, c, d, stroke: 0.8pt)
    line(b1, c1, d1, a1, close: true, stroke: 0.8pt)
    line(b, b1, stroke: 0.8pt)
    line(c, c1, stroke: 0.8pt)
    line(d, d1, stroke: 0.8pt)

    // Điểm M trên A'D' (minh hoạ x tương đối)
    let m = (3, 4.2)
    circle(m, radius: 1.5pt, fill: black)
    content(m, $M$, anchor: "south-west", padding: 3pt)
    line(b, m, stroke: (dash: "dashed", thickness: 0.8pt))

    // Điểm E trên B'C' (C'E = 2EB' => E gần B' hơn)
    let e = (1, 3)
    circle(e, radius: 1.5pt, fill: black)
    content(e, $E$, anchor: "south", padding: 3pt)

    // Nhãn đỉnh
    content(a, $A$, anchor: "south-east", padding: 5pt)
    content(b, $B$, anchor: "north-east", padding: 5pt)
    content(c, $C$, anchor: "north-west", padding: 5pt)
    content(d, $D$, anchor: "south-west", padding: 5pt)
    content(a1, $A'$, anchor: "south-east", padding: 5pt)
    content(b1, $B'$, anchor: "east", padding: 5pt)
    content(c1, $C'$, anchor: "west", padding: 5pt)
    content(d1, $D'$, anchor: "south-west", padding: 5pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [ $2,7$ ],
  loigiai: [
    #ppgiai[
      - Đặt hệ trục tọa độ $O x y z$ vào hình lập phương để tọa độ hóa các điểm.
      - Xác định tọa độ $M$ theo ẩn $x$ và tọa độ điểm $E$.
      - Khi $N$ di động trên $B M$, độ dài dây cao su $E N$ ngắn nhất chính là khoảng cách từ $E$ đến đường thẳng $B M$.
      - Dùng công thức khoảng cách $d(E, B M) = (abs([arrow(B E), arrow(B M)])) / abs(arrow(B M))$ để lập hàm số theo $x$, sau đó tìm giá trị nhỏ nhất của hàm số trên đoạn tương ứng.
    ]
    
    Chọn hệ trục tọa độ $O x y z$ sao cho các đỉnh của hình lập phương có tọa độ: 
    $A(0;0;0)$, $B(4;0;0)$, $D(0;4;0)$, $A'(0;0;4)$, $B'(4;0;4)$, $C'(4;4;4)$, $D'(0;4;4)$.
    
    Vì $M$ thuộc cạnh $A'D'$ và $A'M = x$ (với $0 <= x <= 4$) nên $M(0;x;4)$.
    
    Điểm $E$ thuộc cạnh $B'C'$ sao cho $C'E = 2E B'$, suy ra $arrow(B'E) = 1/3 arrow(B'C')$.
    Ta có $arrow(B'C') = (0; 4; 0)$ nên $arrow(B'E) = (0; 4/3; 0)$. 
    Suy ra tọa độ điểm $E(4; 4/3; 4)$.
    
    Đường thẳng $B M$ có véc-tơ chỉ phương $arrow(u) = arrow(B M) = (-4; x; 4)$.
    Véc-tơ $arrow(B E) = (0; 4/3; 4)$.
    
    Ta tính tích có hướng:
    $ [arrow(B E), arrow(u)] = (4/3 (4) - 4 (x); 4 (-4) - 0 (4); 0 (x) - 4/3 (-4)) = (16/3 - 4x; -16; 16/3). $
    
    Độ dài đoạn $E N$ ngắn nhất chính là khoảng cách từ điểm $E$ đến đường thẳng $B M$. Bình phương khoảng cách này là:
    $ d^2(E, B M) &= (abs([arrow(B E), arrow(u)])^2)/(abs(arrow(u))^2) = ((16/3 - 4x)^2 + (-16)^2 + (16/3)^2)/((-4)^2 + x^2 + 4^2) \
    &= (16x^2 - 128/3 x + 256/9 + 256 + 256/9)/(x^2 + 32) = (16x^2 - 128/3 x + 2816/9)/(x^2 + 32) \
    &= (144x^2 - 384x + 2816)/(9(x^2 + 32)). $
    
    Xét hàm số $f(x) = (144x^2 - 384x + 2816)/(9(x^2 + 32))$ trên đoạn $[0; 4]$. Tính đạo hàm:
    $ f'(x) = ( (288x - 384) dot 9(x^2 + 32) - 18x(144x^2 - 384x + 2816) ) / (81(x^2 + 32)^2). $
    
    Cho $f'(x) = 0$, ta được phương trình phần tử số bằng $0$:
    $ (288x - 384)(x^2 + 32) - 2x(144x^2 - 384x + 2816) = 0 \
    <=> 288x^3 + 9216x - 384x^2 - 12288 - 288x^3 + 768x^2 - 5632x = 0 \
    <=> 384x^2 + 3584x - 12288 = 0 <=> 3x^2 + 28x - 96 = 0. $
    
    Giải phương trình bậc hai trên ta được $x = 8/3$ (nhận) hoặc $x = -12$ (loại vì $x in [0; 4]$).
    
    Vậy $E N$ ngắn nhất khi $x = 8/3 ~~ 2,666...$ mét. 
    Làm tròn kết quả đến hàng phần mười, ta được $x = 2,7$.

    #nhanxet[Bài toán tìm cực trị hình học không gian phức tạp sẽ được đơn giản hóa đi rất nhiều nếu ta khéo léo chọn hệ trục tọa độ phù hợp và dùng công cụ đại số hàm số để giải.]
  ]
)

#tln(
  [
    Cho một hình lập phương $A B C D.A'B'C'D'$ có độ dài một cạnh bằng $2$ m. Một thanh trượt được cố định dọc theo cạnh $C C'$, trên đó có một con chạy $M$ di chuyển (đặt $C M = x$ với $0 <= x <= 2$). Một sợi dây đàn hồi nối từ điểm $E$ (là trung điểm của cạnh $D D'$) đến một điểm $N$ chạy tự do trên đoạn thẳng $B M$. Khi độ dài sợi dây $E N$ đạt giá trị ngắn nhất, hãy tính $x$ theo đơn vị mét.
  ],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = (1.5, 1.2)
    let b = (0, 0)
    let c = (3, 0)
    let d = (4.5, 1.2)
    let a1 = (1.5, 4.2)
    let b1 = (0, 3)
    let c1 = (3, 3)
    let d1 = (4.5, 4.2)

    // Các cạnh khuất
    line(a, b, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, d, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, a1, stroke: (dash: "dashed", thickness: 0.8pt))

    // Các cạnh thấy
    line(b, c, d, stroke: 0.8pt)
    line(b1, c1, d1, a1, close: true, stroke: 0.8pt)
    line(b, b1, stroke: 0.8pt)
    line(c, c1, stroke: 0.8pt)
    line(d, d1, stroke: 0.8pt)

    // Điểm M trên CC' (minh hoạ x = 1)
    let m = (3, 1.5)
    circle(m, radius: 1.5pt, fill: black)
    content(m, $M$, anchor: "west", padding: 3pt)
    line(b, m, stroke: 0.6pt)

    // Điểm E trên DD' (trung điểm)
    let e = (4.5, 2.7)
    circle(e, radius: 1.5pt, fill: black)
    content(e, $E$, anchor: "west", padding: 3pt)

    // Điểm N trên BM
    let n = (1.5, 0.75)
    circle(n, radius: 1.5pt, fill: black)
    content(n, $N$, anchor: "north-west", padding: 3pt)
    line(e, n, stroke: (dash: "dashed", paint: red, thickness: 0.8pt))

    // Nhãn đỉnh
    content(a, $A$, anchor: "south-east", padding: 5pt)
    content(b, $B$, anchor: "north-east", padding: 5pt)
    content(c, $C$, anchor: "north-west", padding: 5pt)
    content(d, $D$, anchor: "south-west", padding: 5pt)
    content(a1, $A'$, anchor: "south-east", padding: 5pt)
    content(b1, $B'$, anchor: "east", padding: 5pt)
    content(c1, $C'$, anchor: "west", padding: 5pt)
    content(d1, $D'$, anchor: "south-west", padding: 5pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [ $1$ ],
  loigiai: [
    #ppgiai[
      - Chọn hệ trục tọa độ $O x y z$ để tọa độ hóa các điểm trong không gian.
      - Biểu diễn tọa độ điểm $E$ và điểm $M$ theo ẩn $x$.
      - Khi điểm $N$ di động trên $B M$, độ dài sợi dây $E N$ nhỏ nhất chính là khoảng cách từ điểm $E$ đến đường thẳng $B M$.
      - Áp dụng công thức $d(E, B M) = (abs([arrow(B E), arrow(B M)])) / abs(arrow(B M))$, lập hàm số theo $x$ và tìm cực trị bằng đạo hàm.
    ]
    
    Chọn hệ trục tọa độ $O x y z$ với gốc $A(0;0;0)$, các trục $A B$, $A D$, $A A'$ lần lượt nằm trên $O x$, $O y$, $O z$.
    Vì hình lập phương có cạnh bằng $2$ nên ta có tọa độ các đỉnh:
    $B(2;0;0)$, $D(0;2;0)$, $A'(0;0;2)$.
    Từ đó suy ra $C(2;2;0)$, $D'(0;2;2)$.
    
    Vì $M$ thuộc cạnh $C C'$ và $C M = x$ (với $0 <= x <= 2$) nên $M(2;2;x)$.
    
    Vì $E$ là trung điểm của $D D'$ nên tọa độ của $E$ là $E(0; 2; 1)$.
    
    Đường thẳng $B M$ đi qua $B(2;0;0)$ và có véc-tơ chỉ phương $arrow(u) = arrow(B M) = (0; 2; x)$.
    Véc-tơ $arrow(B E) = (-2; 2; 1)$.
    
    Ta tính tích có hướng của hai véc-tơ:
    $ [arrow(B E), arrow(u)] &= ( 2(x) - 1(2) ; 1(0) - (-2)(x) ; -2(2) - 2(0) ) \
    &= (2x - 2; 2x; -4). $
    
    Độ dài đoạn dây $E N$ ngắn nhất chính là khoảng cách từ $E$ đến đường thẳng $B M$. Bình phương khoảng cách này là:
    $ f(x) = d^2(E, B M) &= (abs([arrow(B E), arrow(u)])^2)/(abs(arrow(u))^2) = ((2x - 2)^2 + (2x)^2 + (-4)^2)/(0^2 + 2^2 + x^2) \
    &= (4x^2 - 8x + 4 + 4x^2 + 16)/(x^2 + 4) = (8x^2 - 8x + 20)/(x^2 + 4). $
    
    Xét hàm số $f(x) = (8x^2 - 8x + 20)/(x^2 + 4)$ trên đoạn $[0; 2]$. Ta có đạo hàm:
    $ f'(x) &= ( (16x - 8)(x^2 + 4) - 2x(8x^2 - 8x + 20) ) / ((x^2 + 4)^2) \
    &= (16x^3 + 64x - 8x^2 - 32 - 16x^3 + 16x^2 - 40x) / ((x^2 + 4)^2) \
    &= (8x^2 + 24x - 32) / ((x^2 + 4)^2) = (8(x^2 + 3x - 4)) / ((x^2 + 4)^2). $
    
    Cho $f'(x) = 0 <=> x^2 + 3x - 4 = 0 <=> x=1$.
    
    Ta có bảng biến thiên: 
#align(center)[#bbt-opt(
  var: $x$,
  der: $f'(x)$,
  func: $f(x)$,
  x-vals: ($0$, $1$, $2$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($0$, $f(1)$, $0$),
  is-min: true,
)]
    Với $x in [0; 1)$, $f'(x) < 0$; với $x in (1; 2]$, $f'(x) > 0$.
    Suy ra hàm số đạt giá trị nhỏ nhất tại $x = 1$.
    
    Vậy độ dài $E N$ ngắn nhất khi $x = 1$.

    #nhanxet[Đây là một phiên bản sáng tác mới kế thừa hoàn toàn tư duy của bài toán TDM32. Việc tinh chỉnh tỉ lệ hệ trục tọa độ và các điểm $E$, $M$ đã giúp triệt tiêu các hệ số phức tạp, đưa phương trình đạo hàm về dạng có nghiệm nguyên cực đẹp ($x=1$), rất phù hợp để luyện tập phương pháp tọa độ hóa.]
  ]
)


#tln(
  [
    Cho một hình lập phương $A B C D.A'B'C'D'$ có độ dài một cạnh bằng $2$ m. Một thanh trượt được cố định dọc theo cạnh $D D'$, trên đó có một con chạy $M$ di chuyển (đặt $D M = x$ với $0 <= x <= 2$). Một sợi dây đàn hồi nối từ điểm $E$ (là tâm của mặt hình vuông $C D D'C'$) đến một điểm $N$ chạy tự do trên đoạn thẳng $A M$. Khi độ dài sợi dây $E N$ đạt giá trị ngắn nhất, hãy tính $x$ theo đơn vị mét.
  ],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = (1.5, 1.2)
    let b = (0, 0)
    let c = (3, 0)
    let d = (4.5, 1.2)
    let a1 = (1.5, 4.2)
    let b1 = (0, 3)
    let c1 = (3, 3)
    let d1 = (4.5, 4.2)

    // Các cạnh khuất
    line(a, b, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, d, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, a1, stroke: (dash: "dashed", thickness: 0.8pt))

    // Các cạnh thấy
    line(b, c, d, stroke: 0.8pt)
    line(b1, c1, d1, a1, close: true, stroke: 0.8pt)
    line(b, b1, stroke: 0.8pt)
    line(c, c1, stroke: 0.8pt)
    line(d, d1, stroke: 0.8pt)

    // Điểm M trên DD' (minh hoạ x = 1)
    let m = (4.5, 2.7)
    circle(m, radius: 1.5pt, fill: black)
    content(m, $M$, anchor: "west", padding: 3pt)
    line(a, m, stroke: (dash: "dashed", thickness: 0.6pt))

    // Điểm E là tâm mặt CDD'C'
    let e = (3.75, 2.1)
    circle(e, radius: 1.5pt, fill: black)
    content(e, $E$, anchor: "west", padding: 3pt)

    // Điểm N trên AM
    let n = (3, 1.95)
    circle(n, radius: 1.5pt, fill: black)
    content(n, $N$, anchor: "south-east", padding: 3pt)
    line(e, n, stroke: (dash: "dashed", paint: red, thickness: 0.8pt))

    // Nhãn đỉnh
    content(a, $A$, anchor: "south-east", padding: 5pt)
    content(b, $B$, anchor: "north-east", padding: 5pt)
    content(c, $C$, anchor: "north-west", padding: 5pt)
    content(d, $D$, anchor: "south-west", padding: 5pt)
    content(a1, $A'$, anchor: "south-east", padding: 5pt)
    content(b1, $B'$, anchor: "east", padding: 5pt)
    content(c1, $C'$, anchor: "west", padding: 5pt)
    content(d1, $D'$, anchor: "south-west", padding: 5pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [ $1$ ],
  loigiai: [
    #ppgiai[
      - Chọn hệ trục tọa độ $O x y z$ với gốc tọa độ thuận lợi (ví dụ tại $A$).
      - Xác định tọa độ điểm $E$ (tâm mặt $C D D'C'$) và điểm $M$ theo ẩn $x$.
      - Viết véc-tơ chỉ phương của đường thẳng $A M$.
      - Lập hàm số tính khoảng cách từ $E$ đến $A M$ theo $x$: $d(E, A M) = (abs([arrow(A E), arrow(A M)])) / abs(arrow(A M))$, sau đó khảo sát hàm số để tìm giá trị nhỏ nhất.
    ]
    
    Chọn hệ trục tọa độ $O x y z$ với gốc $A(0;0;0)$, các tia $A B$, $A D$, $A A'$ lần lượt trùng với các tia $O x$, $O y$, $O z$.
    Vì hình lập phương có cạnh bằng $2$ nên ta có tọa độ các đỉnh liên quan:
    $B(2;0;0)$, $D(0;2;0)$, $A'(0;0;2)$.
    Từ đó suy ra $C(2;2;0)$ và $D'(0;2;2)$.
    
    Vì $M$ thuộc cạnh $D D'$ và $D M = x$ (với $0 <= x <= 2$) nên tọa độ của $M$ là $M(0;2;x)$.
    
    Điểm $E$ là tâm của mặt hình vuông $C D D'C'$, suy ra $E$ là trung điểm của $C D'$.
    Tọa độ của $E$ là $E((2+0)/2; (2+2)/2; (0+2)/2) = E(1; 2; 1)$.
    
    Đường thẳng $A M$ đi qua $A(0;0;0)$ và có véc-tơ chỉ phương $arrow(u) = arrow(A M) = (0; 2; x)$.
    Véc-tơ $arrow(A E) = (1; 2; 1)$.
    
    Ta tính tích có hướng của hai véc-tơ:
    $ [arrow(A E), arrow(u)] &= ( 2(x) - 1(2) ; 1(0) - 1(x) ; 1(2) - 2(0) ) \
    &= (2x - 2; -x; 2). $
    
    Độ dài đoạn dây $E N$ ngắn nhất chính là khoảng cách từ $E$ đến đường thẳng $A M$. Bình phương khoảng cách này là:
    $ f(x) = d^2(E, A M) &= (abs([arrow(A E), arrow(u)])^2)/(abs(arrow(u))^2) = ((2x - 2)^2 + (-x)^2 + 2^2)/(0^2 + 2^2 + x^2) \
    &= (4x^2 - 8x + 4 + x^2 + 4)/(x^2 + 4) = (5x^2 - 8x + 8)/(x^2 + 4). $
    
    Xét hàm số $f(x) = (5x^2 - 8x + 8)/(x^2 + 4)$ trên đoạn $[0; 2]$. Ta có đạo hàm:
    $ f'(x) &= ( (10x - 8)(x^2 + 4) - 2x(5x^2 - 8x + 8) ) / ((x^2 + 4)^2) \
    &= (10x^3 + 40x - 8x^2 - 32 - 10x^3 + 16x^2 - 16x) / ((x^2 + 4)^2) \
    &= (8x^2 + 24x - 32) / ((x^2 + 4)^2) = (8(x^2 + 3x - 4)) / ((x^2 + 4)^2). $
    
    Cho $f'(x) = 0 <=> x^2 + 3x - 4 = 0 <=> x=1$ (nhận) hoặc $x=-4$ (loại vì không thuộc $[0;2]$).
    
    Ta có bảng biến thiên: 
#align(center)[#bbt-opt(
  var: $x$,
  der: $f'(x)$,
  func: $f(x)$,
  x-vals: ($0$, $1$, $2$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($2$, $f(1)$, $1.5$),
  is-min: true,
)]
    (Tại $x=1$, $f(1) = (5(1) - 8(1) + 8)/(1 + 4) = 1$).
    
    Với $x in [0; 1)$, $f'(x) < 0$; với $x in (1; 2]$, $f'(x) > 0$.
    Suy ra hàm số đạt giá trị nhỏ nhất tại $x = 1$.
    
    Vậy độ dài $E N$ ngắn nhất khi $x = 1$ mét.

    #nhanxet[Bài toán được tinh chỉnh hình học (sử dụng tâm mặt bên và trượt trên cạnh DD') tạo ra một hàm số $f(x)$ khác với bài gốc, nhưng phần tử số của đạo hàm lại hoàn toàn trùng khớp ($8x^2 + 24x - 32 = 0$). Điều này giúp học sinh yên tâm kiểm tra lại kỹ năng thiết lập tọa độ của mình mà vẫn đảm bảo ra nghiệm nguyên cực đẹp $x=1$.]
  ]
)

#tln(
  [
    Cho một hình lập phương $A B C D.A'B'C'D'$ có độ dài một cạnh bằng $2$ m. Một thanh trượt được cố định dọc theo cạnh $B B'$, trên đó có một con chạy $M$ di chuyển (đặt $B M = x$ với $0 <= x <= 2$). Một sợi dây đàn hồi nối từ điểm $E$ (là tâm của mặt bên $A B B' A'$) đến một điểm $N$ chạy tự do trên đoạn thẳng $D M$. Khi độ dài sợi dây $E N$ đạt giá trị ngắn nhất, hãy tính $x$ theo đơn vị mét. _Kết quả làm tròn đến hàng phần mười_
  ],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = (1.5, 1.2)
    let b = (0, 0)
    let c = (3, 0)
    let d = (4.5, 1.2)
    let a1 = (1.5, 4.2)
    let b1 = (0, 3)
    let c1 = (3, 3)
    let d1 = (4.5, 4.2)

    // Các cạnh khuất
    line(a, b, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, d, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, a1, stroke: (dash: "dashed", thickness: 0.8pt))

    // Các cạnh thấy
    line(b, c, d, stroke: 0.8pt)
    line(b1, c1, d1, a1, close: true, stroke: 0.8pt)
    line(b, b1, stroke: 0.8pt)
    line(c, c1, stroke: 0.8pt)
    line(d, d1, stroke: 0.8pt)

    // Điểm M trên BB' (minh hoạ x = 4/3)
    let m = (0, 2)
    circle(m, radius: 1.5pt, fill: black)
    content(m, $M$, anchor: "east", padding: 3pt)
    
    // Đoạn DM
    line(d, m, stroke: 0.6pt)

    // Điểm E là tâm mặt ABB'A'
    let e = (0.75, 2.1)
    circle(e, radius: 1.5pt, fill: black)
    content(e, $E$, anchor: "south", padding: 3pt)

    // Điểm N trên DM
    let n = (2.25, 1.6)
    circle(n, radius: 1.5pt, fill: black)
    content(n, $N$, anchor: "north-west", padding: 3pt)
    line(e, n, stroke: (dash: "dashed", paint: red, thickness: 0.8pt))

    // Nhãn đỉnh
    content(a, $A$, anchor: "south-east", padding: 5pt)
    content(b, $B$, anchor: "north-east", padding: 5pt)
    content(c, $C$, anchor: "north-west", padding: 5pt)
    content(d, $D$, anchor: "south-west", padding: 5pt)
    content(a1, $A'$, anchor: "south-east", padding: 5pt)
    content(b1, $B'$, anchor: "east", padding: 5pt)
    content(c1, $C'$, anchor: "west", padding: 5pt)
    content(d1, $D'$, anchor: "south-west", padding: 5pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [ $1.33$ ],
  loigiai: [
    #ppgiai[
      - Chọn hệ trục tọa độ $O x y z$ với gốc tọa độ tại $A$.
      - Xác định tọa độ $M$ (trên $B B'$), đường thẳng tham chiếu $D M$ và điểm $E$ (tâm $A B B' A'$).
      - Áp dụng công thức khoảng cách từ điểm $E$ đến đường thẳng $D M$: $d(E, D M) = (abs([arrow(D E), arrow(D M)])) / abs(arrow(D M))$.
      - Thiết lập hàm số và giải đạo hàm để tìm $x$.
    ]
    
    Chọn hệ trục tọa độ $O x y z$ với gốc $A(0;0;0)$, các tia $A B$, $A D$, $A A'$ lần lượt nằm trên $O x$, $O y$, $O z$.
    Vì hình lập phương có cạnh bằng $2$ nên ta có:
    $B(2;0;0)$, $D(0;2;0)$, $A'(0;0;2)$ và $B'(2;0;2)$.
    
    Vì $M$ thuộc cạnh $B B'$ và $B M = x$ ($0 <= x <= 2$) nên tọa độ của $M$ là $M(2;0;x)$.
    
    Điểm $E$ là tâm của mặt $A B B' A'$, tức là trung điểm của $A B'$, suy ra $E(1; 0; 1)$.
    
    Đường thẳng $D M$ đi qua $D(0;2;0)$ và có véc-tơ chỉ phương $arrow(u) = arrow(D M) = (2; -2; x)$.
    Véc-tơ $arrow(D E) = (1; -2; 1)$.
    
    Ta tính tích có hướng của hai véc-tơ $arrow(D E)$ và $arrow(u)$:
    $ [arrow(D E), arrow(u)] &= ( (-2)(x) - 1(-2) ; 1(2) - 1(x) ; 1(-2) - (-2)(2) ) \
    &= (-2x + 2; 2 - x; 2). $
    
    Khoảng cách $E N$ nhỏ nhất khi $E N$ vuông góc với $D M$, tức là $E N = d(E, D M)$. Bình phương khoảng cách này là:
    $ f(x) &= (abs([arrow(D E), arrow(u)])^2)/(abs(arrow(u))^2) = ((-2x + 2)^2 + (2 - x)^2 + 2^2)/(2^2 + (-2)^2 + x^2) \
    &= (4x^2 - 8x + 4 + x^2 - 4x + 4 + 4)/(x^2 + 8) = (5x^2 - 12x + 12)/(x^2 + 8). $
    
    Xét hàm số $f(x) = (5x^2 - 12x + 12)/(x^2 + 8)$ trên đoạn $[0; 2]$. Lấy đạo hàm:
    $ f'(x) &= ( (10x - 12)(x^2 + 8) - 2x(5x^2 - 12x + 12) ) / ((x^2 + 8)^2) \
    &= (10x^3 + 80x - 12x^2 - 96 - 10x^3 + 24x^2 - 24x) / ((x^2 + 8)^2) \
    &= (12x^2 + 56x - 96) / ((x^2 + 8)^2) = (4(3x^2 + 14x - 24)) / ((x^2 + 8)^2). $
    
    Cho $f'(x) = 0 <=> 3x^2 + 14x - 24 = 0$. 
    Phương trình bậc hai này có hai nghiệm: 
    $x = (-14 + sqrt(14^2 - 4(3)(-24)))/6 = (-14 + 22)/6 = 4/3$ (nhận) và $x = (-14 - 22)/6 = -6$ (loại vì không thuộc $[0;2]$).
    
    Ta có bảng biến thiên: 
#align(center)[#bbt-opt(
  var: $x$,
  der: $f'(x)$,
  func: $f(x)$,
  x-vals: ($0$, $4/3$, $2$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($1.5$, $f(4/3)$, $2/3$),
  is-min: true,
)]
    Với $x in [0; 4/3)$, $f'(x) < 0$; với $x in (4/3; 2]$, $f'(x) > 0$.
    Hàm số đạt giá trị nhỏ nhất tại $x = 4/3$. Tại đó, giá trị khoảng cách ngắn nhất là $sqrt(f(4/3)) = sqrt(1/2) = (sqrt(2))/2$ mét.
    
    Vậy $x = 4/3$ mét.
  ]
)

#tln(
  [
    Cho một hình lập phương $A B C D.A'B'C'D'$ có độ dài một cạnh bằng $2$ m. Một thanh trượt được cố định dọc theo cạnh $C'D'$ trên nắp, trên đó có một con chạy $M$ di chuyển (đặt $D' M = x$ với $0 <= x <= 2$). Một sợi dây đàn hồi nối từ điểm $E$ (là tâm của mặt bên $C D D' C'$) đến một điểm $N$ chạy tự do trên đoạn thẳng $A M$. Khi độ dài sợi dây $E N$ đạt giá trị ngắn nhất, hãy tính $x$ theo đơn vị mét.
  ],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = (1.5, 1.2)
    let b = (0, 0)
    let c = (3, 0)
    let d = (4.5, 1.2)
    let a1 = (1.5, 4.2)
    let b1 = (0, 3)
    let c1 = (3, 3)
    let d1 = (4.5, 4.2)

    // Các cạnh khuất
    line(a, b, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, d, stroke: (dash: "dashed", thickness: 0.8pt))
    line(a, a1, stroke: (dash: "dashed", thickness: 0.8pt))

    // Các cạnh thấy
    line(b, c, d, stroke: 0.8pt)
    line(b1, c1, d1, a1, close: true, stroke: 0.8pt)
    line(b, b1, stroke: 0.8pt)
    line(c, c1, stroke: 0.8pt)
    line(d, d1, stroke: 0.8pt)

    // Điểm M trên C'D' (minh hoạ x = 4/3)
    let m = (3.5, 3.4)
    circle(m, radius: 1.5pt, fill: black)
    content(m, $M$, anchor: "south-west", padding: 3pt)
    
    // Đoạn AM (đường chéo xuyên không gian)
    line(a, m, stroke: (dash: "dashed", thickness: 0.6pt))

    // Điểm E là tâm mặt CDD'C'
    let e = (3.75, 2.1)
    circle(e, radius: 1.5pt, fill: black)
    content(e, $E$, anchor: "west", padding: 3pt)

    // Điểm N trên AM
    let n = (3.0, 2.85)
    circle(n, radius: 1.5pt, fill: black)
    content(n, $N$, anchor: "south-east", padding: 3pt)
    line(e, n, stroke: (dash: "dashed", paint: red, thickness: 0.8pt))

    // Nhãn đỉnh
    content(a, $A$, anchor: "south-east", padding: 5pt)
    content(b, $B$, anchor: "north-east", padding: 5pt)
    content(c, $C$, anchor: "north-west", padding: 5pt)
    content(d, $D$, anchor: "south-west", padding: 5pt)
    content(a1, $A'$, anchor: "south-east", padding: 5pt)
    content(b1, $B'$, anchor: "east", padding: 5pt)
    content(c1, $C'$, anchor: "west", padding: 5pt)
    content(d1, $D'$, anchor: "south-west", padding: 5pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [ $4/3$ ],
  loigiai: [
    #ppgiai[
      - Chọn hệ trục tọa độ $O x y z$ với gốc tọa độ tại $A$.
      - Xác định tọa độ $M$ (trên $C'D'$), suy ra véc-tơ chỉ phương của đường thẳng $A M$.
      - Xác định tọa độ $E$ (tâm mặt $C D D' C'$).
      - Lập hàm số khoảng cách từ $E$ đến $A M$ và tối ưu hóa bằng đạo hàm.
    ]
    
    Chọn hệ trục tọa độ $O x y z$ với gốc $A(0;0;0)$, các tia $A B$, $A D$, $A A'$ lần lượt nằm trên $O x$, $O y$, $O z$.
    Vì hình lập phương có cạnh bằng $2$ nên:
    $D(0;2;0)$, $D'(0;2;2)$, $C(2;2;0)$, $C'(2;2;2)$.
    
    Điểm $M$ thuộc đoạn $C' D'$. Véc-tơ $arrow(D' C') = (2; 0; 0)$. 
    Vì $D' M = x$ nên $M$ di chuyển từ $D'$ về $C'$ một đoạn $x$, tọa độ của $M$ là:
    $M(0 + x; 2; 2) = M(x; 2; 2)$.
    
    Điểm $E$ là tâm của mặt $C D D' C'$, tức là trung điểm của $C D'$.
    $E( (2+0)/2 ; (2+2)/2 ; (0+2)/2 ) = E(1; 2; 1)$.
    
    Đường thẳng $A M$ đi qua gốc tọa độ $A(0;0;0)$ có véc-tơ chỉ phương $arrow(u) = arrow(A M) = (x; 2; 2)$.
    Véc-tơ nối từ $A$ đến $E$ là $arrow(A E) = (1; 2; 1)$.
    
    Ta tính tích có hướng của $arrow(A E)$ và $arrow(u)$:
    $ [arrow(A E), arrow(u)] &= ( 2(2) - 1(2) ; 1(x) - 1(2) ; 1(2) - 2(x) ) \
    &= (2; x - 2; 2 - 2x). $
    
    Bình phương khoảng cách từ $E$ đến đường thẳng $A M$ là:
    $ f(x) &= (abs([arrow(A E), arrow(u)])^2)/(abs(arrow(u))^2) = (2^2 + (x - 2)^2 + (2 - 2x)^2)/(x^2 + 2^2 + 2^2) \
    &= (4 + x^2 - 4x + 4 + 4 - 8x + 4x^2)/(x^2 + 8) \
    &= (5x^2 - 12x + 12)/(x^2 + 8). $
    
    Ta nhận thấy hàm số $f(x)$ này **giống hệt** với hàm số ở bài toán trước dù cấu trúc đường thẳng $A M$ và điểm $E$ là hoàn toàn khác biệt! 
    
    Đạo hàm của hàm số:
    $ f'(x) = ( (10x - 12)(x^2 + 8) - 2x(5x^2 - 12x + 12) ) / ((x^2 + 8)^2) = (4(3x^2 + 14x - 24)) / ((x^2 + 8)^2). $
    
    Cho $f'(x) = 0 <=> 3x^2 + 14x - 24 = 0$. 
    Nghiệm của phương trình là $x = 4/3$ (nhận) và $x = -6$ (loại).
    
    Bảng biến thiên cho thấy $f'(x)$ đổi dấu từ âm sang dương khi qua $x = 4/3$, do đó hàm số đạt giá trị nhỏ nhất tại $x = 4/3$.
    
    Vậy độ dài dây $E N$ ngắn nhất khi $x = 4/3$ mét.

    #nhanxet[Bằng cách cố tình thiết kế đường chéo không gian $A M$ thay vì đường nằm trên mặt phẳng như các bài trước, độ khó tưởng tượng hình không gian của bài này tăng lên rất cao. Tuy nhiên, nếu bạn vững vàng với phương pháp tọa độ hóa, bài toán lập tức "hiện nguyên hình" và cho ra một hàm số $f(x)$ vô cùng quen thuộc.]
  ]
)
// ==========================================
// PHẦN BỔ SUNG: BÀI TẬP VẬN DỤNG THỰC TẾ CHUYÊN SÂU
// ==========================================
#v(2em)
#block(
  width: 100%,
  fill: rgb("#fff3e0"),
  stroke: (left: 6pt + rgb("#ff9800"), top: 0.5pt + rgb("#ffe0b2"), right: 0.5pt + rgb("#ffe0b2"), bottom: 0.5pt + rgb("#ffe0b2")),
  inset: 16pt,
  radius: (right: 4pt)
)[
  #text(size: 14pt, weight: "bold", fill: rgb("#e65100"))[PHẦN 4: HÌNH HỌC KHÔNG GIAN THỰC TẾ (CHUYÊN SÂU)]
  
  #v(0.5em)
  #text(style: "italic", size: 11pt, fill: rgb("#555555"))[Các bài toán tối ưu hóa, tính toán góc, khoảng cách trong thiết kế kiến trúc, công trình.]
])
#v(1em)

#tln(
  [Một đài quan sát không lưu có dạng hình chóp cụt tứ giác đều $A B C D . A' B' C' D'$ được xây dựng trên một khu đất bằng phẳng. Biết đáy lớn $A B C D$ là mặt đất hình vuông cạnh $24 upright(m)$, đáy nhỏ $A' B' C' D'$ là hình vuông cạnh $12 upright(m)$ và chiều cao của đài quan sát (khoảng cách giữa hai mặt phẳng đáy) là $18 upright(m)$. Để tăng cường độ chịu lực, các kỹ sư cần lắp đặt một thanh chống giằng bằng thép nối từ một điểm trên cạnh bên $A A'$ đến một điểm trên đường chéo $B D$ của đáy lớn sao cho độ dài thanh chống là ngắn nhất. Tính chiều dài của thanh chống giằng đó (làm tròn đến một chữ số thập phân).],
  [$15,3$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = 4
    let b = 2
    let h = 3.5
    
    // Đáy lớn
    let A = (-a/2, -a/4)
    let B = (a/2, -a/4)
    let C = (a/2 + 1, a/4)
    let D = (-a/2 + 1, a/4)
    
    // Đáy nhỏ
    let dx = 0.5
    let dy = 0
    let Ap = (-b/2 + dx, -b/4 + h + dy)
    let Bp = (b/2 + dx, -b/4 + h + dy)
    let Cp = (b/2 + 0.5 + dx, b/4 + h + dy)
    let Dp = (-b/2 + 0.5 + dx, b/4 + h + dy)

    let O = (0.5, 0)
    
    line(A, B, C, stroke: 1pt)
    line(A, D, stroke: (dash: "dashed", paint: gray))
    line(C, D, stroke: (dash: "dashed", paint: gray))
    
    line(Ap, Bp, Cp, Dp, close: true, stroke: 1pt, fill: rgb("ff980020"))
    
    line(A, Ap, stroke: 1pt)
    line(B, Bp, stroke: 1pt)
    line(C, Cp, stroke: 1pt)
    line(D, Dp, stroke: (dash: "dashed", paint: gray))
    
    line(B, D, stroke: (dash: "dashed", paint: rgb("e65100"), thickness: 1.5pt))
    line(Ap, O, stroke: (dash: "dashed", paint: rgb("e65100"), thickness: 1.5pt))

    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(D, [ $D$ ], anchor: "south", padding: 0.1)
    content(Ap, [ $A'$ ], anchor: "east", padding: 0.1)
    content(Bp, [ $B'$ ], anchor: "south", padding: 0.1)
    content(Cp, [ $C'$ ], anchor: "west", padding: 0.1)
    content(Dp, [ $D'$ ], anchor: "south", padding: 0.1)
  }),
  loigiai: [
  - **Bước 1: Mô hình hóa toán học**
    - Chiều dài thanh giằng ngắn nhất nối từ cạnh bên $A A'$ đến đường chéo $B D$ chính là khoảng cách giữa hai đường thẳng chéo nhau $A A'$ và $B D$.
    - Do hình chóp cụt là tứ giác đều, hình chiếu của $B D$ lên mặt phẳng $(A' A C C')$ vuông góc với $(A' A C C')$. Suy ra $B D perp (A' A C C')$.
    - Suy ra $B D perp A A'$ (vì $A A' subset (A' A C C')$). Do đó, khoảng cách $d(A A', B D)$ chính là khoảng cách từ tâm $O$ của hình vuông $A B C D$ (thuộc $B D$) đến đường thẳng $A A'$.
  
  - **Bước 2: Phân tích thiết diện chéo**
    - Xét mặt phẳng $(A' A C C')$, gọi $O, O'$ lần lượt là tâm hai đáy $A B C D$ và $A' B' C' D'$.
    - Ta có $O A = (24 sqrt(2))/2 = 12 sqrt(2)$ m, $O' A' = (12 sqrt(2))/2 = 6 sqrt(2)$ m.
    - Gọi $H$ là hình chiếu vuông góc của $A'$ lên $O A$. Ta có tứ giác $O H A' O'$ là hình chữ nhật, do đó $O H = O' A' = 6 sqrt(2)$ m, suy ra $H A = O A - O H = 12 sqrt(2) - 6 sqrt(2) = 6 sqrt(2)$ m.
    - Chiều cao đài quan sát $A' H = O O' = 18$ m.
    - Độ dài cạnh bên $A A'$ tính theo định lý Pytago trong $Delta A' H A$:
      $ A A' = sqrt(A' H^2 + H A^2) = sqrt(18^2 + (6 sqrt(2))^2) = sqrt(324 + 72) = sqrt(396) = 6 sqrt(11) upright(m). $
  
  - **Bước 3: Tính khoảng cách**
    - Kẻ $O P perp A A'$ tại $P$. Đoạn $O P$ chính là khoảng cách $d(O, A A')$, cũng là chiều dài thanh chống ngắn nhất.
    - Diện tích tam giác $O A A'$ có thể tính theo hai cách:
      $ S_(O A A') = 1/2 O A dot A' H = 1/2 A A' dot O P $
    - Suy ra:
      $ O P = (O A dot A' H)/(A A') = (12 sqrt(2) dot 18)/(6 sqrt(11)) = (36 sqrt(2))/sqrt(11) = (36 sqrt(22))/11 approx 15,349 upright(m). $
    - Vậy thanh chống giằng cần dài khoảng **$15,3$** mét.
])

#tln(
  [Phòng họp hình hộp chữ nhật $A B C D . A' B' C' D'$ với mặt sàn là $A B C D$. Kích thước sàn là $A B = 8 upright(m)$, $A D = 6 upright(m)$, và chiều cao tường là $A A' = 4 upright(m)$. Một chiếc camera giám sát được lắp đặt tại góc trần nhà $A'$. Trong phòng có một chiếc màn hình phẳng lớn được mô hình hóa bởi mặt phẳng $(M N P)$, với $M$ là trung điểm của $A B$, $N$ là trung điểm của $A D$ và $P$ nằm trên cạnh $C C'$ sao cho $C P = 1 upright(m)$. Hãy tính khoảng cách ngắn nhất từ camera $A'$ đến mặt phẳng màn hình $(M N P)$ để kỹ thuật viên điều chỉnh tiêu cự tối ưu (làm tròn đến hai chữ số thập phân).],
  [$4,29$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = 4.5
    let b = 3
    let h = 2.5
    
    let A = (0, 0)
    let B = (a, 0)
    let D = (1.5, 1.2)
    let C = (a + 1.5, 1.2)
    
    let Ap = (0, h)
    let Bp = (a, h)
    let Dp = (1.5, 1.2 + h)
    let Cp = (a + 1.5, 1.2 + h)

    let M = (a/2, 0)
    let N = (1.5/2, 1.2/2)
    let P = (a + 1.5, 1.2 + 0.6) // tren CC'

    line(A, B, Bp, Ap, close: true, stroke: 1pt)
    line(B, C, Cp, Bp, stroke: 1pt)
    line(Ap, Dp, Cp, stroke: 1pt)

    line(A, D, Dp, stroke: (dash: "dashed", paint: gray))
    line(C, D, stroke: (dash: "dashed", paint: gray))

    line(M, P, stroke: 1pt, fill: rgb("4CAF5040"))
    line(N, P, stroke: (dash: "dashed", paint: rgb("4CAF50")))
    line(M, N, stroke: (dash: "dashed", paint: rgb("4CAF50")))

    circle(Ap, radius: 0.08, fill: red)
    content(Ap, text(fill: red)[ $A'$ (Camera)], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(D, [ $D$ ], anchor: "south", padding: 0.1)
    content(M, [ $M$ ], anchor: "north", padding: 0.1)
    content(N, [ $N$ ], anchor: "east", padding: 0.1)
    content(P, [ $P$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - **Bước 1: Mở rộng mặt phẳng cắt trục tung**
    - Ta có $M$ là trung điểm $A B => A M = 4 upright(m)$, $N$ là trung điểm $A D => A N = 3 upright(m)$.
    - Trong mặt phẳng sàn $(A B C D)$, kéo dài $M N$ cắt $C B$ và $C D$. Nhận thấy $Delta A M N sim Delta C B D$ nên đường thẳng $M N$ hoàn toàn xác định.
    - Giả sử hệ tọa độ gốc $A(0,0,0)$ với các trục $A x equiv A B$, $A y equiv A D$, $A z equiv A A'$. 
    - Khi đó $M(4, 0, 0)$, $N(0, 3, 0)$. Điểm $C$ có tọa độ $(8, 6, 0)$ nên $P$ có tọa độ $(8, 6, 1)$.
    - Phương trình mặt phẳng $(M N P)$ cắt các trục $O x, O y, O z$ lần lượt tại $M(4,0,0)$, $N(0,3,0)$ và $K(0,0,c)$.
  
  - **Bước 2: Tìm giao điểm $K$ với trục $A A'$**
    - Mặt phẳng $(M N K)$ có phương trình đoạn chắn:
      $ x/4 + y/3 + z/c = 1 $
    - Điểm $P(8, 6, 1)$ thuộc mặt phẳng này, thay vào ta được:
      $ 8/4 + 6/3 + 1/c = 1 => 2 + 2 + 1/c = 1 => 1/c = -3 => c = -1/3 $
    - Vậy mặt phẳng $(M N P)$ cắt đường thẳng $A A'$ tại $K(0, 0, -1/3)$. Khối chóp $A.M N K$ là chóp tam diện vuông tại $A$.

  - **Bước 3: Dùng tỉ số khoảng cách và công thức chóp vuông**
    - Chiều cao $h = d(A, (M N P))$ của chóp tam diện vuông $A.M N K$ được tính bằng:
      $ 1/h^2 = 1/(A M)^2 + 1/(A N)^2 + 1/(A K)^2 = 1/4^2 + 1/3^2 + 1/(-1/3)^2 = 1/16 + 1/9 + 9 = 1321/144 $
    - Suy ra khoảng cách $d(A, (M N P)) = 12 / sqrt(1321)$.
    - Ta cần tính $d(A', (M N P))$. Lập tỉ số khoảng cách từ $A'$ và $A$ đến mặt phẳng $(M N P)$ đi qua điểm $K$:
      $ (d(A', (M N P)))/(d(A, (M N P))) = (A' K)/(A K) $
    - Độ dài $A' K = | z_{A'} - z_K | = |4 - (-1/3)| = 13/3$.
    - Độ dài $A K = | z_A - z_K | = |0 - (-1/3)| = 1/3$.
    - Suy ra tỉ số bằng $(13/3) / (1/3) = 13$.
    - Vậy khoảng cách $d(A', (M N P)) = 13 dot d(A, (M N P)) = (13 dot 12)/sqrt(1321) = 156/sqrt(1321) approx 4,29 upright(m)$.
])

#tln(
  [Một thiết kế nhà kính sinh thái (Eco-dome) có hình dạng một tứ diện $O.A B C$, trong đó ba vách phẳng $(O A B)$, $(O B C)$, và $(O C A)$ vuông góc với nhau từng đôi một tại gốc $O$. Mặt phẳng $(O A B)$ áp sát mặt đất nằm ngang, không gian mặt đất của nhà kính này tạo thành một tam giác vuông cân tại $O$. Mặt kính nghiêng chính là mặt phẳng $(A B C)$ có diện tích là $S = 24 upright(m)^2$. Để tối ưu hóa việc hấp thụ năng lượng mặt trời trong mùa đông, mặt kính $(A B C)$ được thiết kế hợp với mặt đất một góc nghiêng chính xác bằng $60^circ$. Hãy tính thể tích không gian không khí bên trong nhà kính $O.A B C$ (theo đơn vị $upright(m)^3$).],
  [$24$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let A = (-2, -1.5)
    let B = (3.5, -1.5)
    let C = (0.5, 3.5)
    let H = (0.75, -1.5) // Hinh chieu cua O tren AB
    
    line(A, B, stroke: 1pt)
    line(A, C, stroke: 1pt)
    line(B, C, stroke: 1pt)
    
    line(O, A, stroke: (dash: "dashed", paint: gray))
    line(O, B, stroke: (dash: "dashed", paint: gray))
    line(O, C, stroke: (dash: "dashed", paint: gray))
    
    line(O, H, stroke: (dash: "dashed", paint: rgb("2196F3")))
    line(C, H, stroke: (paint: rgb("2196F3")))
    
    content(O, [ $O$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "west", padding: 0.1)
    content(C, [ $C$ ], anchor: "south", padding: 0.1)
    content(H, [ $H$ ], anchor: "north", padding: 0.1)
  }),
  loigiai: [
  - **Bước 1: Áp dụng định lý hình chiếu diện tích**
    - Do ba mặt phẳng $(O A B), (O B C), (O C A)$ vuông góc với nhau tại $O$, hình chiếu vuông góc của tam giác $A B C$ lên mặt đất $(O A B)$ chính là tam giác $O A B$.
    - Gọi $alpha = 60^circ$ là góc nghiêng giữa mặt phẳng kính $(A B C)$ và mặt đất $(O A B)$. 
    - Theo định lý diện tích hình chiếu, ta có:
      $ S_{O A B} = S_{A B C} dot cos alpha = 24 dot cos(60^circ) = 24 dot 1/2 = 12 upright(m)^2. $
  
  - **Bước 2: Khai thác tính chất tam giác đáy**
    - Tam giác đáy $O A B$ vuông cân tại $O$, ta có:
      $ S_{O A B} = 1/2 O A dot O B = 1/2 O A^2 = 12 => O A = O B = sqrt(24) = 2 sqrt(6) upright(m). $
    - Gọi $H$ là trung điểm của $A B$. Vì tam giác $O A B$ vuông cân tại $O$ nên $O H perp A B$.
    - Lại có $O C perp (O A B)$ nên $O C perp A B$. Suy ra $A B perp (O H C) => A B perp C H$.
    - Góc nhị diện giữa mặt kính $(A B C)$ và mặt đất $(O A B)$ chính là góc $angle O H C = 60^circ$.
  
  - **Bước 3: Tính chiều cao và Thể tích**
    - Độ dài đường trung tuyến ứng với cạnh huyền trong tam giác vuông cân $O A B$ là:
      $ O H = (O A) / sqrt(2) = (2 sqrt(6)) / sqrt(2) = 2 sqrt(3) upright(m). $
    - Xét tam giác vuông $O H C$ vuông tại $O$, chiều cao nhà kính $O C$ là:
      $ O C = O H dot tan 60^circ = 2 sqrt(3) dot sqrt(3) = 6 upright(m). $
    - Thể tích không gian bên trong nhà kính (thể tích tứ diện $O.A B C$) là:
      $ V = 1/3 dot S_{O A B} dot O C = 1/3 dot 12 dot 6 = 24 upright(m)^3. $
])

