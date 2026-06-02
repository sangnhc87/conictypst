#import "_config.typ": *

#align(center)[
  #text(size: 13pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 06 - PHƯƠNG TRÌNH MẶT CẦU]
]

#resetexamstate()
#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình chính tắc của mặt cầu $(S)$ có tâm $I(1; -2; 3)$ và bán kính $R = 4$.],
  (
    [$(x + 1)^2 + (y - 2)^2 + (z + 3)^2 = 16$],
    True([$(x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 16$]),
    [$(x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 4$],
    [$(x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 8$],
  ),
  
  loigiai: [
    #step[
      - Phương trình chính tắc của mặt cầu tâm $I(a; b; c)$ bán kính $R$ là:
        $(x - a)^2 + (y - b)^2 + (z - c)^2 = R^2$.
    ]
    #step[
      - Thế tọa độ tâm $I(1; -2; 3)$ và bán kính $R = 4$ vào ta được:
        $(x - 1)^2 + (y - (-2))^2 + (z - 3)^2 = 4^2$.
    ]
    #step[
      - Thu gọn biểu thức:
        $(x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 16$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, xác định tọa độ tâm $I$ và bán kính $R$ của mặt cầu có phương trình: $x^2 + y^2 + z^2 - 2x + 4y - 6z - 2 = 0$.],
  (
    [$I(-1; 2; -3)$ và $R = 4$],
    [$I(1; -2; 3)$ và $R = sqrt(12)$],
    True([$I(1; -2; 3)$ và $R = 4$]),
    [$I(1; -2; 3)$ và $R = 16$],
  ),
  
  loigiai: [
    #step[
      - Đồng nhất hệ số của phương trình với dạng tổng quát: $-2a = -2 => a = 1$; $-2b = 4 => b = -2$; $-2c = -6 => c = 3$ và $d = -2$.
    ]
    #step[
      - Tọa độ tâm mặt cầu là $I(1; -2; 3)$.
    ]
    #step[
      - Tính bán kính $R$ theo công thức:
        $R = sqrt(a^2 + b^2 + c^2 - d) = sqrt(1^2 + (-2)^2 + 3^2 - (-2)) = sqrt(1 + 4 + 9 + 2) = sqrt(16) = 4$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình mặt cầu $(S)$ có tâm $I(1; 1; 1)$ và tiếp xúc với mặt phẳng $(P): x + 2y - 2z + 5 = 0$.],
  (
    [$(x - 1)^2 + (y - 1)^2 + (z - 1)^2 = 2$],
    [$(x - 1)^2 + (y - 1)^2 + (z - 1)^2 = 9$],
    True([$(x - 1)^2 + (y - 1)^2 + (z - 1)^2 = 4$]),
    [$(x - 1)^2 + (y - 1)^2 + (z - 1)^2 = 6$],
  ),
  
  loigiai: [
    #step[
      - Vì mặt cầu $(S)$ tiếp xúc với mặt phẳng $(P)$ nên bán kính $R$ của mặt cầu đúng bằng khoảng cách từ tâm $I$ đến mặt phẳng $(P)$.
    ]
    #step[
      - Tính khoảng cách:
        $R = d(I, (P)) = frac(|1 + 2(1) - 2(1) + 5|, sqrt(1^2 + 2^2 + (-2)^2)) = frac(|6|, sqrt(9)) = frac(6, 3) = 2$.
    ]
    #step[
      - Phương trình mặt cầu là:
        $(x - 1)^2 + (y - 1)^2 + (z - 1)^2 = 2^2 = 4$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai điểm $A(1; 0; 0)$ và $B(3; 2; 2)$. Viết phương trình mặt cầu nhận đoạn thẳng $A B$ làm đường kính.],
  (
    [$(x - 2)^2 + (y - 1)^2 + (z - 1)^2 = 12$],
    True([$(x - 2)^2 + (y - 1)^2 + (z - 1)^2 = 3$]),
    [$(x - 2)^2 + (y - 1)^2 + (z - 1)^2 = 9$],
    [$(x + 2)^2 + (y + 1)^2 + (z + 1)^2 = 3$],
  ),
  
  loigiai: [
    #step[
      - Mặt cầu đường kính $A B$ nhận trung điểm $I$ của đoạn thẳng $A B$ làm tâm và bán kính $R = A B / 2$.
    ]
    #step[
      - Tính tọa độ tâm $I$:
        $x_I = frac(1 + 3, 2) = 2; y_I = frac(0 + 2, 2) = 1; z_I = frac(0 + 2, 2) = 1 => I(2; 1; 1)$.
    ]
    #step[
      - Tính độ dài đoạn $A B$:
        $A B = sqrt((3 - 1)^2 + (2 - 0)^2 + (2 - 0)^2) = sqrt(12) = 2sqrt(3)$.
        Bán kính $R = A B / 2 = sqrt(3)$.
    ]
    #step[
      - Vậy phương trình mặt cầu là $(x - 2)^2 + (y - 1)^2 + (z - 1)^2 = 3$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tìm tất cả các giá trị của tham số $m$ để phương trình $x^2 + y^2 + z^2 - 2x + 4y - 6z + m = 0$ là phương trình của một mặt cầu.],
  (
    [$m <= 14$],
    [$m > 14$],
    True([$m < 14$]),
    [$m < 13$],
  ),
  
  loigiai: [
    #step[
      - Xác định các hệ số $a, b, c$ và hệ số tự do $d$:
        $a = 1, b = -2, c = 3, d = m$.
    ]
    #step[
      - Điều kiện để phương trình là phương trình mặt cầu:
        $a^2 + b^2 + c^2 - d > 0$.
    ]
    #step[
      - Thay số vào bất phương trình:
        $1^2 + (-2)^2 + 3^2 - m > 0 <=> 1 + 4 + 9 - m > 0 <=> 14 - m > 0 <=> m < 14$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho mặt cầu $(S)$ có tâm $I(1; 2; 3)$ và cắt trục $O x$ tại hai điểm $A, B$ sao cho $A B = 6$. Tính bán kính $R$ của mặt cầu $(S)$.],
  (
    [$R = 5$],
    True([$R = sqrt(22)$]),
    [$R = sqrt(13)$],
    [$R = 4$],
  ),
  
  loigiai: [
    #step[
      - Gọi $H$ là hình chiếu vuông góc của tâm $I(1; 2; 3)$ trên trục hoành $O x$. Tọa độ của $H$ là $H(1; 0; 0)$.
    ]
    #step[
      - Tính khoảng cách từ tâm $I$ đến trục $O x$:
        $I H = sqrt((1-1)^2 + (2-0)^2 + (3-0)^2) = sqrt(0 + 4 + 9) = sqrt(13)$.
    ]
    #step[
      - Vì $H$ là hình chiếu vuông góc nên $H$ là trung điểm của dây cung $A B$, suy ra:
        $A H = frac(A B, 2) = frac(6, 2) = 3$.
    ]
    #step[
      - Áp dụng định lý Pythagore trong tam giác vuông $I H A$:
        $R = sqrt(I H^2 + A H^2) = sqrt(13 + 3^2) = sqrt(22)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình mặt cầu $(S)$ đi qua điểm $A(1; 1; 2)$ và có tâm là gốc tọa độ $O(0; 0; 0)$.],
  (
    [$x^2 + y^2 + z^2 = 4$],
    True([$x^2 + y^2 + z^2 = 6$]),
    [$x^2 + y^2 + z^2 = 36$],
    [$x^2 + y^2 + z^2 = sqrt(6)$],
  ),
  
  loigiai: [
    #step[
      - Vì mặt cầu $(S)$ có tâm $O(0; 0; 0)$ và đi qua $A(1; 1; 2)$ nên bán kính $R$ chính là khoảng cách $O A$:
        $R = O A = sqrt(1^2 + 1^2 + 2^2) = sqrt(6)$.
    ]
    #step[
      - Phương trình mặt cầu $(S)$ có tâm tại gốc tọa độ và bán kính $R = sqrt(6)$ là:
        $x^2 + y^2 + z^2 = R^2 <=> x^2 + y^2 + z^2 = 6$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + (y-1)^2 + (z+2)^2 = 9$ và đường thẳng $d: frac(x-1, 1) = frac(y-2, 2) = frac(z, -1)$. Xác định số điểm chung của đường thẳng $d$ và mặt cầu $(S)$.],
  (
    [$0$],
    [$1$],
    True([$2$]),
    [Vô số],
  ),
  
  loigiai: [
    #step[
      - Tâm của mặt cầu $(S)$ là $I(0; 1; -2)$, bán kính $R = 3$.
    ]
    #step[
      - Đường thẳng $d$ đi qua điểm $M_0(1; 2; 0)$ và nhận vectơ chỉ phương $vec(u) = (1; 2; -1)$ có độ dài $|vec(u)| = sqrt(6)$.
    ]
    #step[
      - Tính khoảng cách từ tâm $I$ đến đường thẳng $d$:
        - Vectơ $vec(M_0 I) = (0-1; 1-2; -2-0) = (-1; -1; -2)$.
        - Tích có hướng $[vec(M_0 I), vec(u)] = (5; -3; -1)$.
        - Khoảng cách $d(I, d) = frac(|[vec(M_0 I), vec(u)]|, |vec(u)|) = frac(sqrt(25 + 9 + 1), sqrt(6)) = sqrt(frac(35, 6)) approx 2.41$.
    ]
    #step[
      - Vì $d(I, d) approx 2.41 < R = 3$, nên đường thẳng $d$ cắt mặt cầu $(S)$ tại 2 điểm phân biệt.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình mặt cầu $(S)$ có tâm $I(1; 2; -3)$ và đi qua điểm $A(1; 0; -1)$.],
  (
    [$(x-1)^2 + (y-2)^2 + (z+3)^2 = 64$],
    True([$(x-1)^2 + (y-2)^2 + (z+3)^2 = 8$]),
    [$(x-1)^2 + (y-2)^2 + (z+3)^2 = 2sqrt(2)$],
    [$(x+1)^2 + (y+2)^2 + (z-3)^2 = 8$],
  ),
  
  loigiai: [
    #step[
      - Bán kính $R$ của mặt cầu là khoảng cách từ tâm $I$ đến điểm $A$ nằm trên mặt cầu:
        $R = I A = sqrt((1 - 1)^2 + (0 - 2)^2 + (-1 - (-3))^2) = sqrt(0 + 4 + 4) = sqrt(8)$.
    ]
    #step[
      - Phương trình chính tắc của mặt cầu $(S)$ là:
        $(x-1)^2 + (y-2)^2 + (z+3)^2 = 8$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho mặt cầu $(S): (x-1)^2 + (y-2)^2 + (z-3)^2 = 16$. Mặt phẳng nào sau đây tiếp xúc với mặt cầu $(S)$?],
  (
    True([$z + 1 = 0$]),
    [$x - 1 = 0$],
    [$y - 2 = 0$],
    [$z - 3 = 0$],
  ),
  
  loigiai: [
    #step[
      - Mặt cầu $(S)$ có tâm $I(1; 2; 3)$ và bán kính $R = 4$.
    ]
    #step[
      - Tính khoảng cách từ tâm $I(1; 2; 3)$ đến mặt phẳng $(P): z + 1 = 0$:
        $d(I, (P)) = frac(|3 + 1|, sqrt(0^2 + 0^2 + 1^2)) = 4$.
    ]
    #step[
      - Vì $d(I, (P)) = R = 4$ nên mặt phẳng $z + 1 = 0$ tiếp xúc với mặt cầu $(S)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho tâm $I(2; 1; -1)$. Viết phương trình mặt cầu $(S)$ có tâm $I$ và tiếp xúc với mặt phẳng tọa độ $(O y z)$.],
  (
    [$(x-2)^2 + (y-1)^2 + (z+1)^2 = 1$],
    True([$(x-2)^2 + (y-1)^2 + (z+1)^2 = 4$]),
    [$(x-2)^2 + (y-1)^2 + (z+1)^2 = 2$],
    [$(x+2)^2 + (y+1)^2 + (z-1)^2 = 4$],
  ),
  
  loigiai: [
    #step[
      - Mặt phẳng tọa độ $(O y z)$ có phương trình là $x = 0$.
    ]
    #step[
      - Bán kính $R$ của mặt cầu tiếp xúc với $(O y z)$ bằng khoảng cách từ tâm $I(2; 1; -1)$ đến mặt phẳng $x = 0$:
        $R = |x_I| = 2$.
    ]
    #step[
      - Phương trình mặt cầu $(S)$ cần tìm là:
        $(x-2)^2 + (y-1)^2 + (z+1)^2 = 4$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Hình vẽ dưới đây biểu diễn một mặt cầu $(S)$ tâm $I$ tiếp xúc với mặt phẳng $(P)$ tại tiếp điểm $H$:
    #align(center)[
      #canvas(length: 1.2cm, {
        import draw: *
        // Vẽ mặt phẳng (P)
        let P_A = (-2.2, -0.6)
        let P_B = (2.2, -0.6)
        let P_C = (3.2, 0.8)
        let P_D = (-1.2, 0.8)
        line(P_A, P_B, P_C, P_D, close: true, fill: rgb("#f8fafc"), stroke: 0.6pt + gray)
        content((2.8, 0.5), $(P)$)
        
        // Điểm H trên mặt phẳng
        let H_pt = (0.5, 0.0)
        circle(H_pt, radius: 0.04, fill: black)
        content((0.5, -0.35), $H$)
        
        // Tâm I của mặt cầu
        let I_pt = (0.5, 1.8)
        circle(I_pt, radius: 0.04, fill: black)
        content((0.5, 2.1), $I$)
        
        // Đoạn IH nối tâm đến tiếp điểm
        line(I_pt, H_pt, stroke: (paint: rgb("#b91c1c"), thickness: 1.0pt, dash: "dashed"))
        content((0.8, 0.9), $R$)
        
        // Vẽ đường tròn lớn của mặt cầu (mặt cắt phẳng)
        circle(I_pt, radius: 1.8, stroke: 1.2pt + rgb("#0e7490"))
        
        // Ký hiệu góc vuông tại H
        line((0.3, 0.0), (0.3, 0.2), (0.5, 0.2), stroke: 0.5pt)
      })
    ]
    Mối quan hệ đúng giữa khoảng cách từ tâm $I$ đến mặt phẳng $(P)$ và bán kính $R$ của mặt cầu là gì?],
  (
    [$d(I, (P)) < R$],
    [$d(I, (P)) > R$],
    True([$d(I, (P)) = R$]),
    [$d(I, (P)) = 0$],
  ),
  
  loigiai: [
    #step[
      - Mặt cầu $(S)$ tâm $I$ tiếp xúc với mặt phẳng $(P)$ khi và chỉ khi mặt phẳng chỉ có duy nhất một điểm chung với mặt cầu.
    ]
    #step[
      - Khi đó, hình chiếu vuông góc $H$ của tâm $I$ trên mặt phẳng $(P)$ nằm trên mặt cầu, dẫn đến độ dài đoạn $I H$ chính bằng bán kính $R$ của mặt cầu.
    ]
    #step[
      - Vậy điều kiện tiếp xúc là $d(I, (P)) = R$.
    ]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 - 4x + 2y - 2z - 3 = 0$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tâm của mặt cầu $(S)$ là $I(2; -1; 1)$.]),
    True([Bán kính của mặt cầu $(S)$ bằng $3$.]),
    True([Điểm $O(0; 0; 0)$ nằm phía bên trong của mặt cầu $(S)$.]),
    [Mặt phẳng $(O x y)$ cắt mặt cầu $(S)$ theo một đường tròn có bán kính bằng $2$.],
  ),
  
  loigiai: [
    - a) *Đúng*: Tâm mặt cầu là $I(2; -1; 1)$ từ việc lấy hệ số trước $x, y, z$ chia cho $-2$.
    - b) *Đúng*: Bán kính $R = sqrt(2^2 + (-1)^2 + 1^2 - (-3)) = sqrt(4 + 1 + 1 + 3) = sqrt(9) = 3$.
    - c) *Đúng*: Tọa độ $O(0; 0; 0)$ thế vào phương trình mặt cầu cho giá trị vế trái bằng $-3 < 0$, điều này chứng tỏ $O I < R$ (khoảng cách $O I = sqrt(6) < 3$). Do đó điểm $O$ nằm bên trong mặt cầu.
    - d) *Sai*: Mặt phẳng $(O x y)$ có phương trình $z = 0$. Khoảng cách từ tâm $I$ đến $(O x y)$ là $d = |z_I| = 1$. Đường tròn giao tuyến có bán kính $r = sqrt(R^2 - d^2) = sqrt(9 - 1) = sqrt(8) = 2sqrt(2) != 2$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho mặt cầu $(S): (x - 1)^2 + (y + 1)^2 + (z - 2)^2 = 9$ và mặt phẳng $(P): 2x - 2y + z + m = 0$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Với $m = 3$ thì khoảng cách từ tâm $I$ của mặt cầu $(S)$ đến mặt phẳng $(P)$ bằng $3$.]),
    True([Với $m = 3$ thì mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S)$.]),
    True([Với $m = -15$ thì mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S)$.]),
    [Để mặt phẳng $(P)$ cắt mặt cầu $(S)$ theo một đường tròn có bán kính $r = 2sqrt(2)$ thì $m = 3$ hoặc $m = -15$.],
  ),
  
  loigiai: [
    - a) *Đúng*: Tâm $I(1; -1; 2)$, bán kính $R = 3$. Với $m = 3$, $d(I, (P)) = frac(|2(1) - 2(-1) + 2 + 3|, sqrt(4 + 4 + 1)) = frac(|9|, 3) = 3$.
    - b) *Đúng*: Do khoảng cách từ tâm $I$ đến mặt phẳng bằng bán kính $R = 3$.
    - c) *Đúng*: Với $m = -15$, ta có $d(I, (P)) = frac(|2(1) - 2(-1) + 2 - 15|, 3) = frac(|-9|, 3) = 3 = R$. Do đó mặt phẳng vẫn tiếp xúc với mặt cầu.
    - d) *Sai*: Bán kính giao tuyến $r = sqrt(R^2 - d^2) = 2sqrt(2) <=> R^2 - d^2 = 8 <=> 9 - d^2 = 8 <=> d = 1$.
      Giải $d(I, (P)) = 1 <=> frac(|m + 6|, 3) = 1 <=> |m + 6| = 3 <=> m = -3$ hoặc $m = -9$. Do đó $m = 3$ hoặc $m = -15$ ở mệnh đề d là Sai.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một vụ nổ tạo ra một sóng xung kích hình cầu $(S)$ lan tỏa trong không gian $O x y z$. Các máy cảm biến ghi nhận chớp sóng đi qua các trạm đo đạc đặt tại $O(0; 0; 0)$, $A(2; 0; 0)$, $B(0; 4; 0)$ và $C(0; 0; 6)$ (đơn vị đo là km). Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tâm phát nổ của sóng xung kích có tọa độ là $I(1; 2; 3)$.]),
    True([Bán kính của vùng sóng xung kích tại thời điểm chớp sóng đi qua cả bốn trạm bằng $sqrt(14)$ km.]),
    True([Phương trình mô tả sóng xung kích hình cầu $(S)$ tại thời điểm đó là $x^2 + y^2 + z^2 - 2x - 4y - 6z = 0$.]),
    [Một boong-ke chỉ huy đặt tại điểm $M(1; 1; 1)$ nằm an toàn bên ngoài vùng quét của sóng xung kích này.],
  ),
  
  loigiai: [
    - a) *Đúng*: Vì bốn trạm tạo thành một tứ diện vuông tại $O(0; 0; 0)$, tâm mặt cầu ngoại tiếp tứ diện (tâm phát nổ) có tọa độ là $I(a/2; b/2; c/2)$ với $a = 2, b = 4, c = 6$. Vậy $I(1; 2; 3)$.
    - b) *Đúng*: Bán kính vùng sóng xung kích bằng khoảng cách từ tâm phát nổ $I$ đến trạm đo $O$: $R = O I = sqrt(1^2 + 2^2 + 3^2) = sqrt(14)$ km.
    - c) *Đúng*: Phương trình tổng quát của mặt cầu sóng xung kích $(S)$ là:
      $(x-1)^2 + (y-2)^2 + (z-3)^2 = 14 <=> x^2 + y^2 + z^2 - 2x - 4y - 6z = 0$.
    - d) *Sai*: Thế tọa độ boong-ke $M(1; 1; 1)$ vào phương trình tổng quát mặt cầu $(S)$ ta được: $1^2 + 1^2 + 1^2 - 2(1) - 4(1) - 6(1) = -9 < 0$. Điều này chứng tỏ boong-ke nằm bên trong mặt cầu, do đó không an toàn bên ngoài vùng quét.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho mặt cầu $(S): (x-1)^2 + y^2 + (z+1)^2 = 16$ và đường thẳng $d: frac(x-1, 1) = frac(y-2, m) = frac(z+1, 1)$ (với $m$ là tham số thực). Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Mặt cầu $(S)$ có tâm $I(1; 0; -1)$ và bán kính $R = 4$.]),
    True([Đường thẳng $d$ luôn đi qua điểm cố định $M(1; 2; -1)$ với mọi $m$.]),
    True([Khoảng cách từ tâm $I$ của mặt cầu $(S)$ đến đường thẳng $d$ bằng $2$ khi $m = 0$.]),
    [Đường thẳng $d$ tiếp xúc với mặt cầu $(S)$ khi $m = 0$.],
  ),
  
  loigiai: [
    - a) *Đúng*: Phương trình chính tắc cho thấy tâm $I(1; 0; -1)$ và bán kính $R = sqrt(16) = 4$.
    - b) *Đúng*: Với mọi $m$, khi thay tọa độ điểm $M(1; 2; -1)$ vào phương trình đường thẳng $d$, các tử số đều bằng $0$ nên phương trình luôn được thỏa mãn.
    - c) *Đúng*: Khi $m = 0$, đường thẳng có phương trình tham số $x = 1 + t, y = 2, z = -1 + t$.
      - Vectơ chỉ phương $vec(u) = (1; 0; 1)$. Khoảng cách từ $I(1; 0; -1)$ đến đường thẳng qua $M(1; 2; -1)$ là:
        $d(I, d) = frac(|[vec(M I), vec(u)]|, |vec(u)|) = frac(|(2; 0; -2)|, sqrt(2)) = frac(sqrt(8), sqrt(2)) = 2$.
    - d) *Sai*: Vì với $m = 0$, khoảng cách $d(I, d) = 2 < R = 4$, do đó đường thẳng cắt mặt cầu tại hai điểm phân biệt chứ không tiếp xúc.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho mặt cầu $(S): (x - 1)^2 + (y - 2)^2 + (z - 3)^2 = 25$ và mặt phẳng $(P): 2x + 2y - z + 6 = 0$. Biết rằng mặt phẳng $(P)$ cắt mặt cầu $(S)$ theo giao tuyến là một đường tròn. Tính bán kính $r$ của đường tròn giao tuyến đó.],
  [$4$],
  
  loigiai: [
    #step[
      - Xác định tâm và bán kính của mặt cầu $(S)$: Tâm $I(1; 2; 3)$ và bán kính $R = 5$.
    ]
    #step[
      - Tính khoảng cách từ tâm $I$ đến mặt phẳng $(P)$:
        $d(I, (P)) = frac(|2(1) + 2(2) - 3 + 6|, sqrt(2^2 + 2^2 + (-1)^2)) = frac(9, 3) = 3$.
    ]
    #step[
      - Tính bán kính $r$ của đường tròn giao tuyến theo định lý Pythagore:
        $r = sqrt(R^2 - d^2) = sqrt(5^2 - 3^2) = sqrt(25 - 9) = 4$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 2; 1)$, $B(3; 2; 3)$ và $C(1; 4; 3)$. Gọi $I(x_I; y_I; 0)$ là tâm của mặt cầu $(S)$ đi qua ba điểm $A, B, C$ và có tâm nằm trên mặt phẳng tọa độ $(O x y)$. Tính bình phương bán kính $R^2$ của mặt cầu $(S)$ đó.],
  [$19$],
  
  loigiai: [
    #step[
      - Vì tâm $I$ thuộc mặt phẳng $(O x y)$ nên $I(x; y; 0)$. Mặt cầu đi qua $A, B, C$ nên ta có hệ thức:
        $I A^2 = I B^2 = I C^2 = R^2$.
    ]
    #step[
      - Tính các độ dài bình phương:
        - $I A^2 = (x - 1)^2 + (y - 2)^2 + 1$.
        - $I B^2 = (x - 3)^2 + (y - 2)^2 + 9$.
        - $I C^2 = (x - 1)^2 + (y - 4)^2 + 9$.
    ]
    #step[
      - Giải hệ $I A^2 = I B^2$ ta được:
        $(x - 1)^2 + 1 = (x - 3)^2 + 9 <=> 4x = 16 <=> x = 4$.
    ]
    #step[
      - Giải hệ $I A^2 = I C^2$ ta được:
        $(y - 2)^2 + 1 = (y - 4)^2 + 9 <=> 4y = 20 <=> y = 5$.
    ]
    #step[
      - Tọa độ tâm là $I(4; 5; 0)$. Bình phương bán kính:
        $R^2 = I A^2 = (4 - 1)^2 + (5 - 2)^2 + 1 = 9 + 9 + 1 = 19$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Hai vệ tinh viễn thông dạng cầu $(S_1)$ và $(S_2)$ đang hoạt động trong không gian $O x y z$. Vùng phủ sóng của vệ tinh $(S_1)$ có phương trình $(x-1)^2 + (y-2)^2 + (z-3)^2 = 9$. Vùng phủ sóng của vệ tinh $(S_2)$ có phương trình $(x-4)^2 + (y-2)^2 + (z-7)^2 = R^2$ (với $R > 0$ và đơn vị tọa độ tính bằng km). Để hai vùng phủ sóng tiếp xúc ngoài với nhau (giúp chuyển tiếp tín hiệu tối ưu mà không bị chồng lấn sóng), bán kính phát sóng $R$ của vệ tinh $(S_2)$ phải bằng bao nhiêu km?],
  [$2$],
  
  loigiai: [
    #step[
      - Tâm và bán kính vùng phủ sóng của hai vệ tinh lần lượt là:
        - Tâm $I_1(1; 2; 3)$, bán kính $R_1 = 3$.
        - Tâm $I_2(4; 2; 7)$, bán kính $R_2 = R > 0$.
    ]
    #step[
      - Tính khoảng cách giữa hai tâm vệ tinh:
        $I_1 I_2 = sqrt((4 - 1)^2 + (2 - 2)^2 + (7 - 3)^2) = sqrt(9 + 0 + 16) = 5$ km.
    ]
    #step[
      - Hai vùng phủ sóng hình cầu tiếp xúc ngoài khi khoảng cách giữa hai tâm bằng tổng hai bán kính phát sóng:
        $I_1 I_2 = R_1 + R_2 <=> 5 = 3 + R <=> R = 2$ km.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một lá chắn năng lượng bảo vệ dạng hình cầu có phương trình $(S): x^2 + y^2 + z^2 - 2x - 4y - 6z - 11 = 0$. Một chùm tia laser tấn công dạng phẳng của đối phương được mô tả bởi phương trình mặt phẳng $(P): 2x + 2y - z + m = 0$ (với $m$ là tham số thực dương). Tìm giá trị của $m$ để chùm tia laser chỉ tiếp xúc trực tiếp (sượt qua) bề mặt lá chắn bảo vệ hình cầu $(S)$.],
  [$12$],
  
  loigiai: [
    #step[
      - Tìm tâm $I$ và bán kính $R$ của lá chắn bảo vệ hình cầu $(S)$:
        - Tâm $I(1; 2; 3)$.
        - Bán kính $R = sqrt(1^2 + 2^2 + 3^2 - (-11)) = sqrt(25) = 5$.
    ]
    #step[
      - Điều kiện để mặt phẳng chùm laser $(P)$ tiếp xúc với lá chắn hình cầu $(S)$ là khoảng cách từ tâm $I$ đến $(P)$ bằng bán kính lá chắn $R$:
        $d(I, (P)) = R <=> frac(|2(1) + 2(2) - 3 + m|, sqrt(2^2 + 2^2 + (-1)^2)) = 5$.
    ]
    #step[
      - Giải phương trình khoảng cách:
        $frac(|m + 3|, 3) = 5 <=> |m + 3| = 15$.
        - Trường hợp 1: $m + 3 = 15 => m = 12$ (thỏa mãn yêu cầu nguyên dương).
        - Trường hợp 2: $m + 3 = -15 => m = -18$ (loại).
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 - 2x + 2y - 4z - 3 = 0$ và điểm $A(1; 1; 0)$. Một cát tuyến bất kỳ đi qua $A$ cắt mặt cầu tại hai điểm $M$ và $N$. Tính giá trị của biểu thức tích vô hướng $P = vec(A M) dot.c vec(A N)$.],
  [$-1$],
  
  loigiai: [
    #step[
      - Xác định tâm $I$ và bán kính $R$ của mặt cầu $(S)$:
        - Tâm $I(1; -1; 2)$.
        - Bán kính $R = sqrt(1^2 + (-1)^2 + 2^2 - (-3)) = sqrt(9) = 3$.
    ]
    #step[
      - Theo tính chất phương tích của điểm $A$ đối với mặt cầu $(S)$, tích vô hướng $vec(A M) dot.c vec(A N)$ không phụ thuộc vào hướng cát tuyến và luôn bằng:
        $vec(A M) dot.c vec(A N) = I A^2 - R^2$.
    ]
    #step[
      - Tính độ dài bình phương khoảng cách $I A^2$:
        $I A^2 = (1 - 1)^2 + (1 - (-1))^2 + (0 - 2)^2 = 0 + 4 + 4 = 8$.
    ]
    #step[
      - Tính giá trị biểu thức:
        $P = I A^2 - R^2 = 8 - 9 = -1$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho mặt cầu $(S)$ đi qua bốn điểm $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$ và đi qua gốc tọa độ $O(0; 0; 0)$. Tìm tọa độ tâm $I(x_I; y_I; z_I)$ của mặt cầu $(S)$ đó. Tính tổng $S = 4x_I + 2y_I + 2z_I$.],
  [$7$],
  
  loigiai: [
    #step[
      - Phương trình tổng quát của mặt cầu đi qua gốc tọa độ $O(0; 0; 0)$ có dạng:
        $x^2 + y^2 + z^2 - 2a x - 2b y - 2c z = 0$ (với tâm $I(a; b; c)$).
    ]
    #step[
      - Thế tọa độ của ba điểm $A, B, C$ vào phương trình mặt cầu ta thu được:
        - Thế $A(1; 0; 0)$: $1^2 - 2a(1) = 0 <=> 2a = 1 <=> a = 1/2$.
        - Thế $B(0; 2; 0)$: $2^2 - 2b(2) = 0 <=> 4b = 4 <=> b = 1$.
        - Thế $C(0; 0; 3)$: $3^2 - 2c(3) = 0 <=> 6c = 9 <=> c = 3/2$.
    ]
    #step[
      - Tọa độ tâm mặt cầu là $I(1/2; 1; 3/2)$.
    ]
    #step[
      - Tính tổng theo yêu cầu:
        $S = 4x_I + 2y_I + 2z_I = 4(1/2) + 2(1) + 2(3/2) = 2 + 2 + 3 = 7$.
    ]
  ],
))
