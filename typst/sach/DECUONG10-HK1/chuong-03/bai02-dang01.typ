#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Áp dụng định lý côsin trong tam giác", mau: C3)

#bai-tap-tu-luan(mau: C3)[
  #bt-item(1, [Cho tam giác $A B C$ có $A B = 4, A C = 6, hat(A) = 120^@$. Tính độ dài cạnh $B C$.], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -2.0, xmax: 5.0, ymin: -0.8, ymax: 3.2, ctx => {
        let A = (0.0, 0.0)
        let C = (4.2, 0.0)
        let B = (-1.4, 2.42)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc(ctx, A, C, B, r: 0.45, ten: [$120^@$], mau: sm-red)
        doan(ctx, B, C, mau: sm-blue, day: 1.2pt)

        nhan(ctx, (-0.95, 1.3), text(size: 7.5pt, fill: sm-gray.darken(20%))[$c = 4$])
        nhan(ctx, (2.1, -0.38), text(size: 7.5pt, fill: sm-gray.darken(20%))[$b = 6$])
        nhan(ctx, (1.8, 1.5), text(size: 7.5pt, fill: sm-blue)[$a = 2sqrt(19)$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    Áp dụng định lý côsin trong tam giác $A B C$:
    $ B C^2 &= A B^2 + A C^2 - 2 A B dot A C dot cos A \
    &= 4^2 + 6^2 - 2 dot 4 dot 6 dot cos 120^@ \
    &= 16 + 36 - 48 dot (-1/2) = 76. $
    Suy ra $B C = sqrt(76) = 2 sqrt(19)$.
  ])

  #bt-item(2, [Cho tam giác $A B C$ có $a = 7; b = 8; c = 5$. Tính $hat(A)$.], loigiai: [
    #align(center)[
      #hinh(w: 6cm, xmin: -0.5, xmax: 4.6, ymin: -0.8, ymax: 2.8, ctx => {
        let A = (0.0, 0.0)
        let C = (4.0, 0.0)
        let B = (1.25, 2.165)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc(ctx, A, C, B, r: 0.5, ten: [$60^@$], mau: sm-red)

        nhan(ctx, (0.45, 1.2), text(size: 7.5pt, fill: sm-gray)[$c = 5$])
        nhan(ctx, (2.0, -0.38), text(size: 7.5pt, fill: sm-gray)[$b = 8$])
        nhan(ctx, (2.9, 1.25), text(size: 7.5pt, fill: sm-blue)[$a = 7$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    Áp dụng hệ quả định lý côsin trong tam giác $A B C$:
    $ cos A &= (b^2 + c^2 - a^2)/(2 b c) \
    &= (8^2 + 5^2 - 7^2)/(2 dot 8 dot 5) \
    &= (64 + 25 - 49)/80 \
    &= 40/80 = 1/2. $
    Do đó $hat(A) = 60^@$.
  ])

  #bt-item(3, [Cho tam giác $A B C$ biết độ dài ba cạnh $B C, C A, A B$ lần lượt là $a, b, c$ và thỏa mãn hệ thức:
    $ b(b^2 - a^2) = c(c^2 - a^2) quad "với" b != c. $
    Tính góc $hat(B A C)$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Biến đổi hệ thức đã cho: 
    $ b^3 - b a^2 = c^3 - c a^2 <=> (b^3 - c^3) - a^2(b - c) = 0 \
    <=> (b - c)(b^2 + b c + c^2 - a^2) = 0. $
    🔹 *Bước 2:* Vì $b != c$ nên $b - c != 0$, suy ra:
    $ b^2 + b c + c^2 - a^2 = 0 <=> b^2 + c^2 - a^2 = -b c. $
    🔹 *Bước 3:* Áp dụng hệ quả định lí côsin:
    $ cos A = (b^2 + c^2 - a^2)/(2 b c) = (-b c)/(2 b c) = -1/2. $
    Vậy $hat(B A C) = 120^@$.
  ])

  #bt-item(4, [Cho góc $hat(x O y) = 30^@$. Gọi $A, B$ là hai điểm di động lần lượt trên $O x, O y$ sao cho $A B = 2$. Độ dài lớn nhất của $O B$ bằng bao nhiêu?], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.6, xmax: 4.8, ymin: -0.6, ymax: 2.8, ctx => {
        let O = (0.0, 0.0)
        let Ox = (4.4, 0.0)
        let Oy = (4.0 * calc.cos(30deg), 4.0 * calc.sin(30deg))
        let A = (2.0 * calc.sqrt(3), 0.0)
        let B = (2.0 * calc.sqrt(3), 2.0)

        // Hai tia Ox, Oy
        mui-ten(ctx, O, Ox, mau: sm-gray, day: 0.8pt)
        mui-ten(ctx, O, (4.5 * calc.cos(30deg), 4.5 * calc.sin(30deg)), mau: sm-gray, day: 0.8pt)
        nhan(ctx, (4.3, -0.25), text(size: 7.5pt)[$x$])
        nhan(ctx, (4.1, 2.35), text(size: 7.5pt)[$y$])

        // Tam giac OAB vuong tai A
        tam-giac(ctx, O, A, B, ten: ($O$, $A$, $B$))
        goc(ctx, O, Ox, Oy, r: 0.8, ten: [$30^@$], mau: sm-red)
        goc-vuong(ctx, A, B, O, r: 0.25, mau: sm-blue)
        doan(ctx, A, B, mau: sm-blue, day: 1.2pt)
        doan(ctx, O, B, mau: sm-red, day: 1.2pt)

        nhan(ctx, (3.75, 1.0), text(size: 7.5pt, fill: sm-blue)[$A B = 2$])
        nhan(ctx, (1.6, 1.25), text(size: 7.5pt, fill: sm-red)[$O B_max = 4$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    Trong tam giác $O A B$, áp dụng định lý sin: 
    $ (A B) / (sin hat(x O y)) = (O B) / (sin hat(O A B)). $
    Suy ra:
    $ O B = (A B dot sin hat(O A B))/(sin 30^@) = (2 dot sin hat(O A B))/(1/2) = 4 sin hat(O A B). $
    Vì $sin hat(O A B) <= 1$ nên $O B <= 4$.
    Dấu bằng xảy ra khi $hat(O A B) = 90^@$. 
    Vậy độ dài lớn nhất của $O B$ là $4$.
  ])

  #bt-item(5, [Cho tam giác $A B C$ vuông cân tại $A$ và $M$ là điểm nằm trong tam giác sao cho tỉ lệ $M A : M B : M C = 1 : 2 : 3$. Tính góc $hat(A M B)$.], loigiai: [
    Đặt $M A = x > 0 => M B = 2x, M C = 3x$.
    
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.8, xmax: 4.8, ymin: -1.0, ymax: 4.8, ctx => {
        let A = (0.0, 0.0)
        let c = 4.2
        let B = (0.0, c)
        let C = (c, 0.0)
        let M = (0.35, 1.4)
        let M1 = (1.4, -0.35)

        // Tam giac ABC
        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc-vuong(ctx, A, B, C, r: 0.3, mau: sm-blue)

        // Tam giac AMM'
        doan(ctx, A, M, mau: sm-red, day: 1.2pt)
        doan(ctx, A, M1, mau: sm-red, day: 1.2pt)
        doan(ctx, M, M1, mau: sm-purple, day: 1pt, dut: true)
        goc-vuong(ctx, A, M, M1, r: 0.25, mau: sm-red)

        // Cac doan noi
        doan(ctx, B, M, mau: sm-blue, day: 1pt)
        doan(ctx, C, M, mau: sm-green.darken(20%), day: 1.1pt)
        doan(ctx, C, M1, mau: sm-blue, day: 1pt)

        // Diem
        diem(ctx, M, ten: $M$, huong: "tren-trai", mau: sm-red)
        diem(ctx, M1, ten: $M'$, huong: "duoi-phai", mau: sm-red)

        // Nhan
        nhan(ctx, (0.05, 0.7), text(size: 7.5pt, fill: sm-red)[$x$])
        nhan(ctx, (0.8, -0.1), text(size: 7.5pt, fill: sm-red)[$x$])
        nhan(ctx, (-0.2, 2.7), text(size: 7.5pt, fill: sm-blue)[$2x$])
        nhan(ctx, (3.0, -0.35), text(size: 7.5pt, fill: sm-blue)[$2x$])
        nhan(ctx, (2.1, 0.9), text(size: 7.5pt, fill: sm-green.darken(20%))[$3x$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Xét phép quay tâm $A$ góc $-90^@$ (theo chiều kim đồng hồ) biến tia $A B$ thành tia $A C$: biến $B -> C$ và biến điểm $M -> M'$.
    Khi đó $A M' = A M = x$ và $hat(M A M') = 90^@$, do đó $triangle A M M'$ vuông cân tại $A$:
    $ M M' = x sqrt(2), quad hat(A M' M) = 45^@. $
    Phép quay bảo toàn độ dài nên $C M' = B M = 2x$.
    
    🔹 *Bước 2:* Trong tam giác $M M' C$, ta có ba cạnh: $M M' = x sqrt(2), C M' = 2x, M C = 3x$. Áp dụng định lý côsin:
    $ cos hat(M M' C) &= (M M'^2 + C M'^2 - M C^2)/(2 dot M M' dot C M') \
    &= (2x^2 + 4x^2 - 9x^2)/(2 dot x sqrt(2) dot 2x) \
    &= (-3x^2)/(4 sqrt(2) x^2) = -(3 sqrt(2))/8. $
    Suy ra:
    $ sin hat(M M' C) = sqrt(1 - (-(3 sqrt(2))/8)^2) = sqrt(1 - 18/64) = sqrt(46)/8. $
    
    🔹 *Bước 3:* Vì phép quay bảo toàn góc nên $hat(A M B) = hat(A M' C) = hat(A M' M) + hat(M M' C) = 45^@ + hat(M M' C)$.
    Áp dụng công thức cộng:
    $ cos hat(A M B) &= cos(45^@ + hat(M M' C)) \
    &= cos 45^@ cos hat(M M' C) - sin 45^@ sin hat(M M' C) \
    &= sqrt(2)/2 dot (-(3 sqrt(2))/8) - sqrt(2)/2 dot sqrt(46)/8 \
    &= (-6 - 2 sqrt(23))/16 = -(3 + sqrt(23))/8 approx -0.9745. $
    Vậy $hat(A M B) = arccos(-(3 + sqrt(23))/8) approx 167^@ 2'$.
  ])

  #bt-item(6, [Khoảng cách từ $A$ đến $B$ không thể đo trực tiếp được vì phải qua một đầm lầy. Người ta xác định được một điểm $C$ mà từ đó có thể nhìn được $A$ và $B$ dưới một góc $60^@$. Biết $C A = 200" m", C B = 180" m"$. Khoảng cách $A B$ bằng bao nhiêu?], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 4.8, ymin: -0.5, ymax: 3.8, ctx => {
        let C = (0.0, 0.0)
        let A = (4.0, 0.0)
        let B = (1.8, 3.12)
        tam-giac(ctx, C, A, B, ten: ($C$, $A$, $B$))
        goc(ctx, C, A, B, r: 0.6, ten: [$60^@$], mau: sm-red)
        doan(ctx, A, B, mau: sm-red, day: 1.3pt, dut: true)
        nhan(ctx, (2.0, -0.3), text(size: 7.5pt, fill: sm-blue)[$C A = 200" m"$])
        nhan(ctx, (0.45, 1.7), text(size: 7.5pt, fill: sm-blue)[$C B = 180" m"$])
        nhan(ctx, (3.2, 1.8), text(size: 7.5pt, fill: sm-red)[$A B approx 190,8" m"$])
        nhan(ctx, (2.6, 1.2), text(size: 7pt, fill: sm-green.darken(30%))[_Khu vực đầm lầy_])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    Áp dụng định lý côsin trong tam giác $A B C$:
    $ A B^2 &= C A^2 + C B^2 - 2 C A dot C B dot cos hat(A C B) \
    &= 200^2 + 180^2 - 2 dot 200 dot 180 dot cos 60^@ \
    &= 40000 + 32400 - 72000 dot 1/2 = 36400. $
    Suy ra:
    $ A B = sqrt(36400) = 20 sqrt(91) approx 190.79" m". $
    Vậy khoảng cách giữa hai địa điểm $A$ và $B$ xấp xỉ $190.8" m".
  ])

  #bt-item(7, [Một tàu đánh cá xuất phát từ cảng $A$, đi theo hướng $S 70^@ E$ với vận tốc $70" km/h"$. Đi được 90 phút thì động cơ bị hỏng nên tàu trôi tự do theo hướng nam với vận tốc $8" km/h"$. Sau 2 giờ kể từ khi động cơ hỏng, tàu neo đậu vào một hòn đảo $B$.
    + Tính khoảng cách từ cảng $A$ tới đảo nơi tàu neo đậu.
    + Xác định hướng từ cảng $A$ tới đảo nơi tàu neo đậu.
  ], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -1.5, xmax: 4.5, ymin: -3.8, ymax: 1.0, ctx => {
        let A = (0.0, 0.0)
        let C = (3.29, -1.2)
        let B = (3.29, -2.7)

        // La ban tai A
        doan(ctx, (-0.8, 0.0), (1.2, 0.0), dut: true, mau: sm-gray, day: 0.7pt)
        doan(ctx, (0.0, 0.8), (0.0, -1.8), dut: true, mau: sm-gray, day: 0.7pt)
        nhan(ctx, (0.0, 0.95), text(size: 7pt)[Bắc (N)])
        nhan(ctx, (0.0, -1.95), text(size: 7pt)[Nam (S)])
        nhan(ctx, (1.4, 0.0), text(size: 7pt)[Đông (E)])

        // Doan duong
        doan(ctx, A, C, mau: sm-blue, day: 1.2pt)
        doan(ctx, C, B, mau: sm-green.darken(20%), day: 1.2pt)
        doan(ctx, A, B, mau: sm-red, day: 1.2pt, dut: true)

        // Cung goc
        goc(ctx, A, (0.0, -1.0), C, r: 0.65, ten: [$70^@$], mau: sm-blue)
        goc(ctx, C, A, B, r: 0.5, ten: [$110^@$], mau: sm-red)

        diem(ctx, A, ten: $A$, huong: "tren-trai")
        diem(ctx, C, ten: $C$, huong: "phai")
        diem(ctx, B, ten: $B$, huong: "duoi")

        nhan(ctx, (1.5, -0.4), text(size: 7pt, fill: sm-blue)[$105" km"$])
        nhan(ctx, (3.7, -1.95), text(size: 7pt, fill: sm-green.darken(20%))[$16" km"$])
        nhan(ctx, (1.3, -1.7), text(size: 7pt, fill: sm-red)[$A B approx 111,5" km"$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *a)* Tính khoảng cách từ cảng $A$ tới đảo nơi tàu neo đậu.
    Đổi $90" phút" = 1.5" giờ"$.
    Quãng đường tàu đi được từ cảng $A$ đến vị trí hỏng máy $C$:
    $ A C = 70 dot 1.5 = 105" km". $
    Quãng đường tàu trôi tự do theo hướng Nam đến đảo $B$:
    $ C B = 8 dot 2 = 16" km". $
    Do tàu đi theo hướng $S 70^@ E$ (lệch $70^@$ từ Nam sang Đông) rồi trôi thẳng theo hướng Nam, góc giữa hai đoạn là:
    $ hat(A C B) = 180^@ - 70^@ = 110^@. $
    Áp dụng định lý côsin trong tam giác $A B C$:
    $ A B^2 &= A C^2 + C B^2 - 2 A C dot C B dot cos hat(A C B) \
    &= 105^2 + 16^2 - 2 dot 105 dot 16 dot cos 110^@ \
    &approx 11025 + 256 - 3360 dot (-0.3420) approx 12430.2. $
    Suy ra $A B = sqrt(12430.2) approx 111.49" km"$.
    
    🔹 *b)* Xác định hướng từ cảng $A$ tới đảo nơi tàu neo đậu.
    Áp dụng định lý sin trong tam giác $A B C$ để xác định góc lệch $hat(C A B)$:
    $ (C B)/(sin hat(C A B)) = (A B)/(sin hat(A C B)) => sin hat(C A B) &= (16 dot sin 110^@)/(111.49) \
    &approx (16 dot 0.9397)/(111.49) approx 0.1349. $
    Suy ra $hat(C A B) approx 7^@ 45'$.
    Góc của $A B$ so với hướng Nam chính là:
    $ 70^@ - hat(C A B) approx 70^@ - 7^@ 45' = 62^@ 15'. $
    Vậy hướng từ cảng $A$ tới hòn đảo $B$ xấp xỉ $S 62^@ E$.
  ])
]

#bai-tap-trac-nghiem(mau: C3)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 17, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$, mệnh đề nào sau đây đúng?],
  (
    [$a^2 = b^2 + c^2 + 2 b c cos A$.],
    True([$a^2 = b^2 + c^2 - 2 b c cos A$.]),
    [$a^2 = b^2 + c^2 - 2 b c cos C$.],
    [$a^2 = b^2 + c^2 - 2 b c cos B$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý côsin trong tam giác.
    
    ✍️ *Lời giải chi tiết:* \
    Trong tam giác $A B C$, với $a, b, c$ lần lượt là độ dài các cạnh đối diện các góc $A, B, C$, định lý côsin khẳng định:
    $ a^2 = b^2 + c^2 - 2 b c cos A. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $triangle A B C$ có $b = 6, c = 8, hat(A) = 60^@$. Độ dài cạnh $a$ là:],
  (
    True([$2 sqrt(13)$.]),
    [$3 sqrt(12)$.],
    [$2 sqrt(37)$.],
    [$sqrt(20)$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý côsin tính cạnh đối diện góc xen giữa: $a^2 = b^2 + c^2 - 2 b c cos A$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Thay số vào hệ thức định lý côsin:
    $ a^2 = 6^2 + 8^2 - 2 dot 6 dot 8 dot cos 60^@ $
    $ a^2 = 36 + 64 - 96 dot 1/2 = 100 - 48 = 52. $
    🔹 *Bước 2:* Do $a > 0$, suy ra:
    $ a = sqrt(52) = 2 sqrt(13). $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $triangle A B C$ có $hat(B) = 60^@, a = 8, c = 5$. Độ dài cạnh $b$ bằng:],
  (
    True([$7$.]),
    [$sqrt(129)$.],
    [$49$.],
    [$sqrt(129)$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng định lý côsin tính cạnh $b$: $b^2 = a^2 + c^2 - 2 a c cos B$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Thay các đại lượng đã biết vào công thức:
    $ b^2 = 8^2 + 5^2 - 2 dot 8 dot 5 dot cos 60^@ $
    $ b^2 = 64 + 25 - 80 dot 1/2 = 89 - 40 = 49. $
    🔹 *Bước 2:* Do $b > 0$, suy ra:
    $ b = sqrt(49) = 7. $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ có $hat(C) = 150^@, B C = sqrt(3), A C = 2$. Tính cạnh $A B$?],
  (
    True([$sqrt(13)$.]),
    [$sqrt(3)$.],
    [$10$.],
    [$1$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý côsin cho cạnh $A B$: $A B^2 = C A^2 + C B^2 - 2 C A dot C B dot cos C$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Chú ý góc tù có giá trị lượng giác $cos 150^@ = -sqrt(3)/2$.
    🔹 *Bước 2:* Thay số tính bình phương cạnh $A B$:
    $ A B^2 = 2^2 + (sqrt(3))^2 - 2 dot 2 dot sqrt(3) dot (-sqrt(3)/2) $
    $ A B^2 = 4 + 3 + 6 = 13. $
    🔹 *Bước 3:* Do đó:
    $ A B = sqrt(13). $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ có góc $A$ nhọn, $A B = 5, A C = 8$, diện tích bằng $12$. Tính độ dài cạnh $B C$.],
  (
    [$2 sqrt(3)$.],
    [$4$.],
    True([$5$.]),
    [$3 sqrt(2)$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Kết hợp công thức diện tích $S = 1/2 b c sin A$ với hệ thức $cos^2 A + sin^2 A = 1$ và định lý côsin.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tìm $sin A$ từ diện tích tam giác:
    $ S = 1/2 dot A B dot A C dot sin A <=> 12 = 1/2 dot 5 dot 8 dot sin A <=> 20 sin A = 12 => sin A = 3/5. $
    🔹 *Bước 2:* Vì góc $A$ nhọn ($0^@ < hat(A) < 90^@$), suy ra $cos A > 0$:
    $ cos A = sqrt(1 - sin^2 A) = sqrt(1 - (3/5)^2) = 4/5. $
    🔹 *Bước 3:* Tính độ dài cạnh $B C$ theo định lý côsin:
    $ B C^2 = A B^2 + A C^2 - 2 A B dot A C dot cos A = 5^2 + 8^2 - 2 dot 5 dot 8 dot 4/5 $
    $ B C^2 = 25 + 64 - 64 = 25 => B C = 5. $
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác có ba cạnh lần lượt là $2, 3, 4$. Góc bé nhất của tam giác có sin bằng bao nhiêu?],
  (
    True([$sqrt(15)/8$.]),
    [$7/8$.],
    [$1/2$.],
    [$sqrt(14)/8$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Trong một tam giác, góc nhỏ nhất đối diện với cạnh ngắn nhất. Áp dụng hệ quả định lý côsin và công thức $sin A = sqrt(1 - cos^2 A)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Cạnh nhỏ nhất của tam giác có độ dài bằng $2$. Gọi góc đối diện cạnh này là góc $hat(A)$.
    🔹 *Bước 2:* Áp dụng hệ quả định lý côsin tính $cos A$:
    $ cos A = (3^2 + 4^2 - 2^2)/(2 dot 3 dot 4) = (9 + 16 - 4)/24 = 21/24 = 7/8. $
    🔹 *Bước 3:* Do góc trong tam giác có sin luôn dương ($0^@ < hat(A) < 180^@$):
    $ sin A = sqrt(1 - cos^2 A) = sqrt(1 - (7/8)^2) = sqrt(1 - 49/64) = sqrt(15/64) = sqrt(15)/8. $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ có $B C = 12, C A = 9, A B = 6$. Trên cạnh $B C$ lấy điểm $M$ sao cho $B M = 4$. Tính độ dài đoạn thẳng $A M$.],
  (
    [$2 sqrt(5)$.],
    [$3 sqrt(2)$.],
    [$sqrt(20)$.],
    True([$sqrt(19)$.]),
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng hệ quả định lý côsin trong $triangle A B C$ để tính $cos B$, sau đó áp dụng định lý côsin trong $triangle A B M$ để tính $A M$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Trong tam giác $A B C$, tính $cos B$:
    $ cos B = (A B^2 + B C^2 - A C^2)/(2 A B dot B C) = (6^2 + 12^2 - 9^2)/(2 dot 6 dot 12) = (36 + 144 - 81)/144 = 99/144 = 11/16. $
    🔹 *Bước 2:* Trong tam giác $A B M$, ta có $A B = 6, B M = 4$ và $cos B = 11/16$. Áp dụng định lý côsin:
    $ A M^2 = A B^2 + B M^2 - 2 A B dot B M dot cos B $
    $ A M^2 = 6^2 + 4^2 - 2 dot 6 dot 4 dot 11/16 = 36 + 16 - 33 = 19. $
    🔹 *Bước 3:* Suy ra:
    $ A M = sqrt(19). $
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $a, b, c$ là độ dài ba cạnh của $triangle A B C$. Biết $b = 7, c = 5, cos A = 4/5$. Tính độ dài của $a$.],
  (
    True([$3 sqrt(2)$.]),
    [$(7 sqrt(2))/2$.],
    [$23/8$.],
    [$6$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng công thức định lý côsin: $a^2 = b^2 + c^2 - 2 b c cos A$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Thay số vào hệ thức:
    $ a^2 = 7^2 + 5^2 - 2 dot 7 dot 5 dot 4/5 $
    $ a^2 = 49 + 25 - 56 = 18. $
    🔹 *Bước 2:* Do $a > 0$, suy ra:
    $ a = sqrt(18) = 3 sqrt(2). $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ vuông tại $A$ có $A B = A C = a$. Điểm $M$ nằm trên cạnh $B C$ sao cho $B M = (B C)/3$. Độ dài $A M$ bằng bao nhiêu?],
  (
    [$(a sqrt(17))/3$.],
    True([$(a sqrt(5))/3$.]),
    [(2 a sqrt(2))/3.],
    [(2 a)/3.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính độ dài cạnh huyền $B C$ và góc $hat(B)$, sau đó áp dụng định lý côsin trong tam giác $A B M$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tam giác $A B C$ vuông cân tại $A$ với $A B = A C = a$ nên:
    $ B C = sqrt(a^2 + a^2) = a sqrt(2), quad hat(B) = 45^@. $
    Độ dài đoạn $B M$ là:
    $ B M = (B C)/3 = (a sqrt(2))/3. $
    🔹 *Bước 2:* Áp dụng định lý côsin trong $triangle A B M$:
    $ A M^2 = A B^2 + B M^2 - 2 A B dot B M dot cos B $
    $ A M^2 = a^2 + ((a sqrt(2))/3)^2 - 2 dot a dot (a sqrt(2))/3 dot cos 45^@ $
    $ A M^2 = a^2 + (2 a^2)/9 - (2 sqrt(2) a^2)/3 dot sqrt(2)/2 = a^2 + (2 a^2)/9 - (2 a^2)/3 = (5 a^2)/9. $
    🔹 *Bước 3:* Do đó:
    $ A M = sqrt((5 a^2)/9) = (a sqrt(5))/3. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ có $cos(A + B) = -1/8, A C = 4, B C = 5$. Tính cạnh $A B$.],
  (
    [$sqrt(46)$.],
    [$11$.],
    [$5 sqrt(2)$.],
    True([$6$.]),
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng tính chất hai góc bù nhau $cos C = -cos(A + B)$, rồi áp dụng định lý côsin.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Trong tam giác $A B C$, do $A + B + C = 180^@$ nên $C = 180^@ - (A + B)$, suy ra:
    $ cos C = -cos(A + B) = -(-1/8) = 1/8. $
    🔹 *Bước 2:* Áp dụng định lý côsin tính cạnh $A B$:
    $ A B^2 = C A^2 + C B^2 - 2 C A dot C B dot cos C $
    $ A B^2 = 4^2 + 5^2 - 2 dot 4 dot 5 dot 1/8 = 16 + 25 - 5 = 36. $
    🔹 *Bước 3:* Suy ra:
    $ A B = sqrt(36) = 6. $
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ có $B C = 5, A C = 3$ và $cot C = 2$. Tính cạnh $A B$.],
  (
    [$sqrt(6)$.],
    [$2$.],
    [$9/5$.],
    True([$sqrt(34 - 12 sqrt(5))$ hoặc $2 sqrt(10)$.]),
  ),
  loigiai: [
    📌 *Phương pháp:* Dùng hệ thức lượng giác $1 + cot^2 C = 1/(sin^2 C)$ để tìm $cos C$, sau đó áp dụng định lý côsin.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Vì $cot C = 2 > 0$ nên góc $C$ là góc nhọn:
    $ 1 + cot^2 C = 1/sin^2 C => 1 + 2^2 = 1/sin^2 C => sin^2 C = 1/5. $
    Do góc $C$ nhọn nên $cos C > 0$:
    $ cos C = sqrt(1 - sin^2 C) = sqrt(1 - 1/5) = 2/sqrt(5). $
    🔹 *Bước 2:* Áp dụng định lý côsin trong tam giác $A B C$:
    $ A B^2 = C A^2 + C B^2 - 2 C A dot C B dot cos C $
    $ A B^2 = 3^2 + 5^2 - 2 dot 3 dot 5 dot 2/sqrt(5) = 9 + 25 - (30 sqrt(5))/5 = 34 - 6 sqrt(5). $
    🔹 *Bước 3:* Căn bậc hai ta được $A B = sqrt(34 - 6 sqrt(5)) approx 4,54$.
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ có $A B = 3, A C = 4$ và $tan A = -2 sqrt(2)$. Tính cạnh $B C$.],
  (
    [$3 sqrt(2)$.],
    [$4 sqrt(3)$.],
    True([$sqrt(33)$.]),
    [$7$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Dùng công thức $1 + tan^2 A = 1/(cos^2 A)$, chú ý dấu của $cos A$ khi $tan A < 0$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính $cos A$:
    $ 1 + tan^2 A = 1/cos^2 A <=> 1 + (-2 sqrt(2))^2 = 1/cos^2 A <=> 1 + 8 = 1/cos^2 A => cos^2 A = 1/9. $
    Vì $tan A = -2 sqrt(2) < 0$ nên góc $A$ là góc tù ($90^@ < hat(A) < 180^@$), suy ra:
    $ cos A = -1/3. $
    🔹 *Bước 2:* Áp dụng định lý côsin tính $B C$:
    $ B C^2 = A B^2 + A C^2 - 2 A B dot A C dot cos A $
    $ B C^2 = 3^2 + 4^2 - 2 dot 3 dot 4 dot (-1/3) = 9 + 16 + 8 = 33. $
    🔹 *Bước 3:* Suy ra:
    $ B C = sqrt(33). $
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $A B = 7, A C = 8$ và $hat(A) = 60^@$. Độ dài cạnh $B C$ là:],
  (
    [$7$.],
    [$47$.],
    True([$sqrt(57)$.]),
    [$2 sqrt(57)$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng công thức định lý côsin: $B C^2 = A B^2 + A C^2 - 2 A B dot A C dot cos A$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Thay số vào hệ thức:
    $ B C^2 = 7^2 + 8^2 - 2 dot 7 dot 8 dot cos 60^@ $
    $ B C^2 = 49 + 64 - 112 dot 1/2 = 113 - 56 = 57. $
    🔹 *Bước 2:* Do $B C > 0$, suy ra:
    $ B C = sqrt(57). $
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $A B = 4" cm", B C = 7" cm", A C = 9" cm"$. Giá trị $cos B$ là:],
  (
    [$2/7$.],
    True([$-2/7$.]),
    [$-2/3$.],
    [$1/2$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng hệ quả định lý côsin tính góc $B$: $cos B = (A B^2 + B C^2 - A C^2)/(2 A B dot B C)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Thay độ dài các cạnh vào công thức:
    $ cos B = (4^2 + 7^2 - 9^2)/(2 dot 4 dot 7) $
    🔹 *Bước 2:* Tính toán giá trị tử và mẫu:
    $ cos B = (16 + 49 - 81)/56 = -16/56 = -2/7. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác có ba cạnh lần lượt là $5, 8, 9$. Góc lớn nhất của tam giác có côsin bằng bao nhiêu?],
  (
    True([$1/10$.]),
    [$-1/10$.],
    [$2/5$.],
    [$-1/2$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Trong tam giác, góc lớn nhất là góc đối diện với cạnh có độ dài lớn nhất.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Ba cạnh có độ dài là $5, 8, 9$. Cạnh dài nhất là $9$ nên góc lớn nhất là góc đối diện cạnh này.
    🔹 *Bước 2:* Áp dụng hệ quả định lý côsin tính côsin của góc đó:
    $ cos = (5^2 + 8^2 - 9^2)/(2 dot 5 dot 8) = (25 + 64 - 81)/80 = 8/80 = 1/10. $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ có $B C = 12, C A = 9, A B = 6$. Trên cạnh $B C$ lấy $M$ sao cho $B M = 8$. Tính độ dài đoạn $A M$.],
  (
    [$34$.],
    [$17$.],
    True([$sqrt(34)$.]),
    [$sqrt(43)$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính $cos B$ trong tam giác $A B C$, sau đó áp dụng định lý côsin trong tam giác $A B M$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Trong tam giác $A B C$, tính $cos B$:
    $ cos B = (6^2 + 12^2 - 9^2)/(2 dot 6 dot 12) = (36 + 144 - 81)/144 = 99/144 = 11/16. $
    🔹 *Bước 2:* Áp dụng định lý côsin trong $triangle A B M$ với $A B = 6, B M = 8$:
    $ A M^2 = A B^2 + B M^2 - 2 A B dot B M dot cos B $
    $ A M^2 = 6^2 + 8^2 - 2 dot 6 dot 8 dot 11/16 = 36 + 64 - 66 = 34. $
    🔹 *Bước 3:* Suy ra:
    $ A M = sqrt(34). $
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $A C = 14, hat(B) = 120^@$, tổng hai cạnh còn lại là $16$. Tính độ dài $B C$ biết $B C > A B$.],
  (
    [$5$.],
    [$8$.],
    [$6$.],
    True([$10$.]),
  ),
  loigiai: [
    📌 *Phương pháp:* Đặt $a = B C, c = A B$, sử dụng hệ thức tổng $a + c = 16$ kết hợp định lý côsin để đưa về hệ phương trình tổng - tích.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Đặt $a = B C, c = A B$ với $a > c > 0$ và $a + c = 16$.
    🔹 *Bước 2:* Áp dụng định lý côsin đối với góc $B = 120^@$:
    $ A C^2 = a^2 + c^2 - 2 a c cos 120^@ $
    $ 14^2 = (a + c)^2 - 2 a c - 2 a c dot (-1/2) $
    $ 196 = 16^2 - a c = 256 - a c => a c = 256 - 196 = 60. $
    🔹 *Bước 3:* Giải hệ phương trình $cases(a + c = 16, a dot c = 60)$:
    Theo định lý Vi-ét đảo, $a$ và $c$ là nghiệm của phương trình bậc hai:
    $ t^2 - 16 t + 60 = 0 <=> (t - 10)(t - 6) = 0 => cases(t_1 = 10, t_2 = 6). $
    Do $B C > A B$ ($a > c$) nên $B C = 10$ và $A B = 6$.
    
    ✅ *Chọn đáp án D.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 4, reset-counter: true)

#ds(
  [Cho tam giác $M N P$ có $M N = 13, M P = 10, cos M = 5/13$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([$N P^2 = M N^2 + M P^2 - 2 M N dot M P dot cos M$.]),
    [Tam giác $M N P$ cân tại $M$.],
    [$cos N = 238/169$.],
    True([Tổng bình phương độ dài ba trung tuyến trong $triangle M N P$ bằng $657/2$.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) ĐÚNG:* Theo định lý côsin áp dụng cho tam giác $M N P$ tại đỉnh $M$, bình phương cạnh đối diện $N P$ thỏa mãn:
    $ N P^2 = M N^2 + M P^2 - 2 M N dot M P dot cos M. $

    🔹 *Mệnh đề b) SAI:* Tính độ dài cạnh $N P$:
    $ N P^2 = 13^2 + 10^2 - 2 dot 13 dot 10 dot 5/13 = 169 + 100 - 100 = 169 => N P = 13. $
    Do đó $M N = N P = 13 != M P = 10$, tam giác $M N P$ cân tại đỉnh $N$, không phải cân tại đỉnh $M$.

    🔹 *Mệnh đề c) SAI:* Vì với mọi góc nhọn hoặc tù của tam giác, $-1 < cos N < 1$. Giá trị $cos N = 238/169 approx 1,41 > 1$ là điều vô lý.

    🔹 *Mệnh đề d) ĐÚNG:* Áp dụng công thức tổng bình phương ba đường trung tuyến của tam giác:
    $ m_m^2 + m_n^2 + m_p^2 = 3/4 (M N^2 + N P^2 + M P^2) = 3/4 (13^2 + 13^2 + 10^2) = 3/4 (169 + 169 + 100) = 3/4 dot 438 = 657/2. $
  ]
)

#ds(
  [Cho tam giác $A B C$ có tỉ lệ độ dài các cạnh $A B : A C : B C = 3 : 4 : 5$. Bán kính đường tròn ngoại tiếp $triangle A B C$ bằng $25$. Xét tính đúng sai:],
  (
    True([$cos A = (A B^2 + A C^2 - B C^2)/(2 A B dot A C)$.]),
    True([Tam giác $A B C$ vuông tại $A$.]),
    [Độ dài cạnh $B C$ bằng $25$.],
    True([Gọi $G$ là trọng tâm của $triangle A B C$. Độ dài đoạn thẳng $B G$ bằng $(20 sqrt(13))/3$.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) ĐÚNG:* Đây là công thức chính xác theo hệ quả của định lý côsin cho góc $hat(A)$.

    🔹 *Mệnh đề b) ĐÚNG:* Đặt $A B = 3x, A C = 4x, B C = 5x$ với $x > 0$. Ta có:
    $ A B^2 + A C^2 = (3x)^2 + (4x)^2 = 25x^2 = (5x)^2 = B C^2. $
    Theo định lý Pythagore đảo, tam giác $A B C$ vuông tại $A$.

    🔹 *Mệnh đề c) SAI:* Vì tam giác vuông tại $A$, cạnh huyền là đường kính của đường tròn ngoại tiếp:
    $ B C = 2 R = 2 dot 25 = 50 != 25. $

    🔹 *Mệnh đề d) ĐÚNG:* Với $B C = 50$, ta có $5x = 50 => x = 10$, suy ra $A B = 30, A C = 40$.
    Gọi $M$ là trung điểm cạnh $A C$, ta có $A M = A C / 2 = 20$.
    Áp dụng định lý Pythagore trong tam giác vuông $A B M$:
    $ B M = sqrt(A B^2 + A M^2) = sqrt(30^2 + 20^2) = sqrt(1300) = 10 sqrt(13). $
    Vì $G$ là trọng tâm của tam giác $A B C$ nên:
    $ B G = 2/3 B M = 2/3 dot 10 sqrt(13) = (20 sqrt(13))/3. $
  ]
)

#ds(
  [Tam giác $A B C$ có $A B = 5, B C = 7, C A = 8$. Xét tính đúng sai của các khẳng định sau:],
  (
    [$A B^2 = B C^2 + A C^2 - 2 B C dot A C cos A$.],
    [Số đo góc $hat(A)$ bằng $30^@$.],
    [Độ dài đường trung tuyến từ đỉnh $A$ trong $triangle A B C$ là $129$.],
    True([Điểm $M$ thuộc đoạn $B C$ sao cho $M C = 2 M B$. Độ dài cạnh $A M$ bằng $(2 sqrt(61))/3$.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) SAI:* Định lý côsin đối với góc $hat(A)$ phải là cạnh $B C$ bình phương ở vế trái:
    $ B C^2 = A B^2 + A C^2 - 2 A B dot A C cos A. $

    🔹 *Mệnh đề b) SAI:* Áp dụng hệ quả định lý côsin tính $cos A$:
    $ cos A = (A B^2 + A C^2 - B C^2)/(2 A B dot A C) = (5^2 + 8^2 - 7^2)/(2 dot 5 dot 8) = (25 + 64 - 49)/80 = 40/80 = 1/2. $
    Do đó $hat(A) = 60^@ != 30^@$.

    🔹 *Mệnh đề c) SAI:* Công thức độ dài đường trung tuyến $m_a$ từ đỉnh $A$:
    $ m_a^2 = (2(A B^2 + A C^2) - B C^2)/4 = (2(5^2 + 8^2) - 7^2)/4 = (2(25 + 64) - 49)/4 = (178 - 49)/4 = 129/4. $
    Suy ra $m_a = sqrt(129)/2 approx 5,68 != 129$.

    🔹 *Mệnh đề d) ĐÚNG:* Vì $M C = 2 M B$ và $B C = 7$ nên:
    $ B M = 1/3 B C = 7/3. $
    Áp dụng hệ quả định lý côsin tính $cos B$:
    $ cos B = (A B^2 + B C^2 - A C^2)/(2 A B dot B C) = (5^2 + 7^2 - 8^2)/(2 dot 5 dot 7) = (25 + 49 - 64)/70 = 10/70 = 1/7. $
    Áp dụng định lý côsin trong $triangle A B M$:
    $ A M^2 = A B^2 + B M^2 - 2 A B dot B M dot cos B = 5^2 + (7/3)^2 - 2 dot 5 dot 7/3 dot 1/7 $
    $ A M^2 = 25 + 49/9 - 10/3 = 225/9 + 49/9 - 30/9 = 244/9. $
    Suy ra:
    $ A M = sqrt(244/9) = (2 sqrt(61))/3. $
  ]
)

#ds(
  [Cho tam giác $A B C$ có $M$ là trung điểm cạnh $B C$. Biết $A B = 3, B C = 8, cos hat(A M B) = (5 sqrt(13))/26$. Xét tính đúng sai:],
  (
    [Bán kính đường tròn ngoại tiếp tam giác $A B M$ là $2$.],
    [Giá trị $cos hat(A M C) = (5 sqrt(13))/26$.],
    True([Độ dài đoạn $A M$ bằng $sqrt(13)$ hoặc $(7 sqrt(13))/13$.]),
    True([Khi số đo góc $A$ nhọn và lớn nhất trong ba đỉnh thì $A C = 7$.]),
  ),
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 3.2, ctx => {
        let B = (0.0, 0.0)
        let C = (5.0, 0.0)
        let M = (2.5, 0.0)
        let A = (0.94, 2.4)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        doan(ctx, A, M, mau: sm-red, day: 1.2pt)
        goc(ctx, M, A, B, r: 0.5, ten: text(size: 6.5pt)[$hat(A M B)$], mau: sm-red)

        // Vach bang nhau BM = MC
        danh-dau(ctx, B, M, so: 1, mau: sm-blue)
        danh-dau(ctx, M, C, so: 1, mau: sm-blue)

        diem(ctx, M, ten: $M$, huong: "duoi")
        nhan(ctx, (0.3, 1.3), text(size: 7pt)[$A B = 3$])
        nhan(ctx, (1.2, -0.25), text(size: 7pt)[$B M = 4$])
        nhan(ctx, (3.7, -0.25), text(size: 7pt)[$M C = 4$])
        nhan(ctx, (1.8, 1.4), text(size: 7pt, fill: sm-red)[$A M$])
      })
    ]

    - a) *Sai:* Vì $cos hat(A M B) = (5 sqrt(13))/26 > 0$ nên:
      $ sin hat(A M B) = sqrt(1 - ((5 sqrt(13))/26)^2) = sqrt(1 - 25/52) = (3 sqrt(39))/26. $
      Bán kính đường tròn ngoại tiếp $triangle A B M$:
      $ R_(A B M) = (A B)/(2 sin hat(A M B)) = 3 / (2 dot (3 sqrt(39))/26) = 13 / sqrt(39) = sqrt(39)/3 approx 2,08 != 2. $
    - b) *Sai:* Vì $M$ thuộc đoạn $B C$ nên $hat(A M C)$ và $hat(A M B)$ là hai góc bù nhau:
      $ cos hat(A M C) = -cos hat(A M B) = -(5 sqrt(13))/26 != (5 sqrt(13))/26. $
    - c) *Đúng:* Áp dụng định lý côsin trong $triangle A B M$ với $B M = 4$:
      $ A B^2 = A M^2 + B M^2 - 2 A M dot B M dot cos hat(A M B) $
      $ <=> 9 = A M^2 + 16 - 8 A M dot (5 sqrt(13))/26 <=> A M^2 - (20 sqrt(13))/13 A M + 7 = 0. $
      Phương trình bậc hai có $Delta' = ((10 sqrt(13))/13)^2 - 7 = 100/13 - 7 = 9/13 > 0$. Suy ra:
      $ A M = (10 sqrt(13) +- 3 sqrt(13))/13 => A M = sqrt(13) quad "hoặc" quad A M = (7 sqrt(13))/13. $
    - d) *Đúng:* Khi $A M = sqrt(13)$, áp dụng định lý côsin trong $triangle A M C$ với $M C = 4, cos hat(A M C) = -(5 sqrt(13))/26$:
      $ A C^2 = A M^2 + M C^2 - 2 A M dot M C dot cos hat(A M C) = 13 + 16 - 2 dot sqrt(13) dot 4 dot (-(5 sqrt(13))/26) = 29 + 20 = 49. $
      Suy ra $A C = 7$. Khi đó ba cạnh của $triangle A B C$ là $a = 8, b = 7, c = 3$. Vì cạnh $a = 8$ lớn nhất nên góc $hat(A)$ đối diện là góc lớn nhất trong ba đỉnh.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 8, reset-counter: true)

#tln(
  dir: "ngang",
  [Để tính khoảng cách giữa hai địa điểm $A$ và $B$ bị ngăn cách bởi đầm lầy, người ta chọn điểm $C$ và đo được $A C = 1" km" = 1000" m", C B = 800" m"$ và $hat(A C B) = 105^@$. Tính khoảng cách $A B$ theo đơn vị mét (làm tròn đến hàng đơn vị).],
  [1433],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -1.6, xmax: 4.2, ymin: -0.6, ymax: 3.2, ctx => {
        let C = (0.0, 0.0)
        let A = (3.5, 0.0)
        let B = (-0.72, 2.70)

        tam-giac(ctx, C, A, B, ten: ($C$, $A$, $B$))
        goc(ctx, C, A, B, r: 0.45, ten: [$105^@$], mau: sm-red)
        doan(ctx, A, B, mau: sm-red, day: 1.2pt, dut: true)

        nhan(ctx, (1.8, -0.3), text(size: 7.5pt, fill: sm-blue)[$A C = 1000" m"$])
        nhan(ctx, (-0.8, 1.3), text(size: 7.5pt, fill: sm-blue)[$C B = 800" m"$])
        nhan(ctx, (1.8, 1.6), text(size: 7.5pt, fill: sm-red)[$A B approx 1433" m"$])
        nhan(ctx, (1.0, 0.9), text(size: 7pt, fill: sm-green.darken(30%))[_Khu vực đầm lầy_])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng định lý côsin trong tam giác $A B C$:
    $ A B^2 &= 1000^2 + 800^2 - 2 dot 1000 dot 800 dot cos 105^@ \
    &approx 1000000 + 640000 - 1600000 dot (-0.2588) approx 2054110. $
    🔹 *Bước 2:* Suy ra:
    $ A B = sqrt(2054110) approx 1433" m". $
    
    ✅ *Đáp số:* $1433$.
  ]
)

#tln(
  dir: "ngang",
  [Tại trụ cao nhất của cây cầu dây văng, khoảng cách từ đỉnh trụ $A$ tới chân trụ $H$ là $150" m"$, độ dài dây văng dài nhất $A B = 300" m"$, khoảng cách $H B = 250" m"$. Tính độ dốc của cầu qua trụ (làm tròn kết quả đến hàng phần mười theo đơn vị độ).],
  [3,8],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.8, xmax: 5.5, ymin: -0.6, ymax: 3.6, ctx => {
        let H = (0.0, 0.0)
        let A = (0.0, 3.0)
        let B = (4.8, 0.3)
        // Duong nam ngang
        doan(ctx, (-0.6, 0.0), (5.2, 0.0), mau: sm-gray, day: 0.8pt, dut: true)
        nhan(ctx, (5.0, -0.25), text(size: 7pt)[Phương ngang])
        // Tru cau dung thang dung
        doan(ctx, H, A, mau: sm-blue, day: 2pt)
        // Mat duong doc
        doan(ctx, H, B, mau: sm-gray.darken(30%), day: 1.5pt)
        // Day vang AB
        doan(ctx, A, B, mau: sm-red, day: 1.2pt)

        diem(ctx, A, ten: $A$, huong: "tren", mau: sm-blue)
        diem(ctx, H, ten: $H$, huong: "duoi-trai")
        diem(ctx, B, ten: $B$, huong: "duoi-phai")

        goc(ctx, H, (1.0, 0.0), B, r: 0.8, ten: text(size: 7pt, fill: sm-red)[$alpha$], mau: sm-red)

        nhan(ctx, (-0.6, 1.5), text(size: 7pt, fill: sm-blue)[$150" m"$])
        nhan(ctx, (2.3, 0.45), text(size: 7pt, fill: sm-gray.darken(30%))[$250" m"$])
        nhan(ctx, (2.8, 2.0), text(size: 7pt, fill: sm-red)[$300" m"$])
      })
    ]

    📌 *Phương pháp:* Trụ tháp $A H$ được dựng thẳng đứng theo phương trọng lực (vuông góc phương ngang). Độ lệch so với góc vuông ($90^@$) chính là góc dốc $alpha$ của mặt đường cầu so với phương ngang.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Xét tam giác $A H B$ có ba cạnh $A H = 150" m", H B = 250" m", A B = 300" m"$. Áp dụng hệ quả định lý côsin tính góc $hat(A H B)$:
    $ cos hat(A H B) = (A H^2 + H B^2 - A B^2)/(2 dot A H dot H B) = (150^2 + 250^2 - 300^2)/(2 dot 150 dot 250) $
    $ cos hat(A H B) = (22500 + 62500 - 90000)/75000 = -5000/75000 = -1/15 approx -0,0667. $
    🔹 *Bước 2:* Suy ra số đo góc $hat(A H B)$:
    $ hat(A H B) = arccos(-1/15) approx 93,82^@. $
    🔹 *Bước 3:* Vì trụ cầu $A H$ thẳng đứng vuông góc với phương ngang ($90^@$), nên độ dốc của mặt cầu là:
    $ alpha = 93,82^@ - 90^@ = 3,82^@ approx 3,8^@. $
    
    ✅ *Đáp số:* $3,8$.
  ]
)

#tln(
  dir: "ngang",
  [Một công viên có dạng hình tam giác với các kích thước ba cạnh là $200" m", 300" m", 400" m"$. Tính số đo của góc $hat(B)$ đối diện cạnh $300" m"$ (làm tròn đến độ).],
  [47],
  loigiai: [
    #align(center)[
      #hinh(w: 6cm, xmin: -0.5, xmax: 4.5, ymin: -0.6, ymax: 2.5, ctx => {
        let A = (0.0, 0.0)
        let C = (4.0, 0.0)
        let B = (1.45, 1.7)
        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc(ctx, B, A, C, r: 0.45, ten: text(size: 7pt, fill: sm-red)[$47^@$], mau: sm-red)
        nhan(ctx, (2.0, -0.3), text(size: 7pt, fill: sm-blue)[$b = 300" m"$])
        nhan(ctx, (0.5, 1.0), text(size: 7pt)[$c = 200" m"$])
        nhan(ctx, (3.0, 1.0), text(size: 7pt)[$a = 400" m"$])
      })
    ]

    📌 *Phương pháp:* Sử dụng hệ quả định lý côsin để tính côsin của một góc khi biết độ dài ba cạnh của tam giác: $cos B = (a^2 + c^2 - b^2)/(2 a c)$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Đặt các cạnh của tam giác là $a = 400" m", c = 200" m"$ và cạnh đối diện góc $hat(B)$ là $b = 300" m"$.
    🔹 *Bước 2:* Áp dụng hệ quả định lý côsin:
    $ cos B = (a^2 + c^2 - b^2)/(2 a c) = (400^2 + 200^2 - 300^2)/(2 dot 400 dot 200) $
    $ cos B = (160000 + 40000 - 90000)/160000 = 110000/160000 = 11/16 = 0,6875. $
    🔹 *Bước 3:* Suy ra số đo góc $hat(B)$:
    $ hat(B) = arccos(11/16) approx 46^@ 34' approx 47^@. $
    
    ✅ *Đáp số:* $47$.
  ]
)

#tln(
  dir: "ngang",
  [Hai chiếc tàu thủy cùng xuất phát từ vị trí $A$, đi thẳng theo hai hướng tạo với nhau góc $60^@$. Tàu thứ nhất chạy với tốc độ $30" km/h"$, tàu thứ hai chạy với tốc độ $40" km/h"$. Tính khoảng cách giữa hai tàu sau $2$ giờ (làm tròn đến một chữ số sau dấu phẩy).],
  [72,1],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.6, xmax: 4.2, ymin: -0.6, ymax: 3.8, ctx => {
        let A = (0.0, 0.0)
        let B = (3.0, 0.0)
        let C = (2.0, 3.46)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc(ctx, A, B, C, r: 0.6, ten: [$60^@$], mau: sm-red)
        doan(ctx, B, C, mau: sm-red, day: 1.2pt, dut: true)

        nhan(ctx, (1.5, -0.3), text(size: 7.5pt, fill: sm-blue)[$A B = 60" km"$])
        nhan(ctx, (0.7, 1.9), text(size: 7.5pt, fill: sm-blue)[$A C = 80" km"$])
        nhan(ctx, (2.8, 1.8), text(size: 7.5pt, fill: sm-red)[$B C approx 72,1" km"$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Sau $2$ giờ, quãng đường đi được:
    - Tàu thứ nhất: $A B = 30 dot 2 = 60" km"$.
    - Tàu thứ hai: $A C = 40 dot 2 = 80" km"$.
    🔹 *Bước 2:* Áp dụng định lý côsin trong tam giác $A B C$:
    $ B C^2 &= A B^2 + A C^2 - 2 A B dot A C dot cos 60^@ \
    &= 60^2 + 80^2 - 2 dot 60 dot 80 dot (1/2) = 5200. $
    🔹 *Bước 3:* Suy ra khoảng cách giữa hai tàu:
    $ B C = sqrt(5200) = 20 sqrt(13) approx 72.1" km". $
    
    ✅ *Đáp số:* $72.1$.
  ]
)

#tln(
  dir: "ngang",
  [Vịnh Vân Phong: Du khách chèo thuyền kayak từ $C$ đến $B$ với vận tốc $4" km/h"$. Biết $A B = 0,4" km", A C = 0,6" km"$ và góc giữa $A B, A C$ là $60^@$. Tính thời gian chèo thuyền (phút).],
  [8],
  loigiai: [
    #align(center)[
      #hinh(w: 6cm, xmin: -0.5, xmax: 4.5, ymin: -0.6, ymax: 3.2, ctx => {
        let A = (0.0, 0.0)
        let B = (2.8, 0.0)
        let C = (2.1, 2.6)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc(ctx, A, B, C, r: 0.5, ten: [$60^@$], mau: sm-red)
        doan(ctx, C, B, mau: sm-blue, day: 1.3pt)
        nhan(ctx, (1.4, -0.3), text(size: 7pt)[$A B = 0,4" km"$])
        nhan(ctx, (0.8, 1.5), text(size: 7pt)[$A C = 0,6" km"$])
        nhan(ctx, (2.8, 1.4), text(size: 7pt, fill: sm-blue)[$B C$])
      })
    ]

    📌 *Phương pháp:* Áp dụng định lý côsin để tính khoảng cách $B C$, sau đó dùng công thức $t = s / v$ và đổi đơn vị sang phút.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng định lý côsin trong tam giác $A B C$:
    $ B C^2 = A B^2 + A C^2 - 2 A B dot A C dot cos 60^@ $
    $ B C^2 = 0,4^2 + 0,6^2 - 2 dot 0,4 dot 0,6 dot 1/2 = 0,16 + 0,36 - 0,24 = 0,28. $
    Suy ra quãng đường chèo thuyền là:
    $ B C = sqrt(0.28) approx 0,529" km". $
    🔹 *Bước 2:* Thời gian chèo thuyền từ $C$ đến $B$ với vận tốc $4" km/h"$:
    $ t = (B C)/v = (0,529)/4 approx 0,1323" giờ". $
    🔹 *Bước 3:* Đổi ra đơn vị phút:
    $ t = 0,1323 dot 60 approx 7,94" phút" approx 8" phút". $
    
    ✅ *Đáp số:* $8$.
  ]
)

#tln(
  dir: "ngang",
  [Một ô tô muốn đi từ $A$ đến $B$ qua đỉnh núi $C$ với $A C = 15" km", B C = 20" km", hat(A C B) = 120^@$. Nếu đào hầm xuyên núi đi thẳng $A B$, xe tiết kiệm được bao nhiêu nghìn đồng tiền xăng? Biết $1" km"$ tốn $0,3$ lít xăng, giá $25.000$ đ/lít.],
  [34],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -2.5, xmax: 3.5, ymin: -0.8, ymax: 2.8, ctx => {
        let C = (0.0, 2.2)
        let A = (-1.8, 0.0)
        let B = (2.5, 0.0)

        // Dáng ngọn núi
        da-giac(ctx, (A, C, B), mau: sm-green.darken(20%), to: sm-green-light.transparentize(50%), day: 1pt)
        diem(ctx, C, ten: $C$, huong: "tren", mau: sm-green.darken(30%))
        diem(ctx, A, ten: $A$, huong: "duoi-trai")
        diem(ctx, B, ten: $B$, huong: "duoi-phai")

        // Hầm thẳng xuyên núi
        doan(ctx, A, B, mau: sm-red, day: 1.3pt, dut: true)

        // Góc tại đỉnh núi
        goc(ctx, C, A, B, r: 0.45, ten: [$120^@$], mau: sm-amber.darken(20%))

        nhan(ctx, (-1.2, 1.3), text(size: 7.5pt, fill: sm-blue)[$15" km"$])
        nhan(ctx, (1.5, 1.3), text(size: 7.5pt, fill: sm-blue)[$20" km"$])
        nhan(ctx, (0.35, -0.42), text(size: 7.5pt, fill: sm-red)[_Hầm thẳng_ $A B approx 30,41" km"$])
      })
    ]

    📌 *Phương pháp:* Tính độ dài đường hầm $A B$ theo định lý côsin, so sánh với quãng đường đi qua đỉnh núi để tìm độ dài rút ngắn, từ đó tính số tiền tiết kiệm.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Độ dài đoạn đường hầm thẳng $A B$:
    $ A B^2 = 15^2 + 20^2 - 2 dot 15 dot 20 dot cos 120^@ = 225 + 400 - 600 dot (-1/2) = 925. $
    Suy ra:
    $ A B = sqrt(925) approx 30,41" km". $
    🔹 *Bước 2:* Chiều dài đường vòng qua đỉnh $C$:
    $ s_(A C B) = A C + C B = 15 + 20 = 35" km". $
    Đoạn đường được rút ngắn nhờ hầm xuyên núi:
    $ Delta s = 35 - 30,41 = 4,59" km". $
    🔹 *Bước 3:* Số tiền xăng tiết kiệm được:
    $ 4,59 dot 0,3 dot 25 = 34,425" nghìn đồng" approx 34" nghìn đồng". $
    
    ✅ *Đáp số:* $34$.
  ]
)

#tln(
  dir: "ngang",
  [Hai tàu cùng xuất phát từ $A$, hướng hợp góc $60^@$. Tàu $B$ chạy $20$ hải lí/giờ, tàu $C$ chạy $15$ hải lí/giờ. Sau 2 giờ hai tàu cách nhau bao nhiêu hải lí?],
  [36,1],
  loigiai: [
    #align(center)[
      #hinh(w: 6cm, xmin: -0.5, xmax: 4.5, ymin: -0.6, ymax: 3.2, ctx => {
        let A = (0.0, 0.0)
        let B = (3.6, 0.0)
        let C = (1.5, 2.6)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc(ctx, A, B, C, r: 0.5, ten: [$60^@$], mau: sm-red)
        doan(ctx, B, C, mau: sm-red, day: 1.2pt, dut: true)
        nhan(ctx, (1.8, -0.3), text(size: 7pt)[$A B = 40" hải lí"$])
        nhan(ctx, (0.5, 1.4), text(size: 7pt)[$A C = 30" hải lí"$])
        nhan(ctx, (2.8, 1.5), text(size: 7pt, fill: sm-red)[$B C approx 36,1$])
      })
    ]

    📌 *Phương pháp:* Tính quãng đường mỗi tàu đi được $s = v dot t$, sau đó dùng định lý côsin tính khoảng cách giữa hai tàu.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính quãng đường mỗi tàu đi được sau $2" giờ"$:
    - Tàu thứ nhất: $A B = 20 dot 2 = 40" hải lí"$.
    - Tàu thứ hai: $A C = 15 dot 2 = 30" hải lí"$.
    🔹 *Bước 2:* Áp dụng định lý côsin trong tam giác $A B C$ với góc $hat(B A C) = 60^@$:
    $ B C^2 = A B^2 + A C^2 - 2 A B dot A C dot cos 60^@ $
    $ B C^2 = 40^2 + 30^2 - 2 dot 40 dot 30 dot 1/2 = 1600 + 900 - 1200 = 1300. $
    🔹 *Bước 3:* Khoảng cách giữa hai tàu sau $2$ giờ là:
    $ B C = sqrt(1300) = 10 sqrt(13) approx 36,06" hải lí" approx 36,1" hải lí". $
    
    ✅ *Đáp số:* $36,1$.
  ]
)

#tln(
  dir: "ngang",
  [Trên nóc một tòa nhà có một cột antenna cao $5" m"$. Từ vị trí quan sát $A$ cao $7" m"$ so với mặt đất nhìn thấy đỉnh và chân antenna dưới góc $50^@$ và $40^@$ so với phương ngang. Chiều cao của tòa nhà (làm tròn đến một chữ số thập phân) là bao nhiêu mét?],
  [18,9],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.8, xmax: 4.8, ymin: -0.6, ymax: 3.8, ctx => {
        let H = (0.0, 0.0)
        let A = (0.0, 1.05)
        let D = (3.5, 0.0)
        let C = (3.5, 2.1)
        let T = (3.5, 2.85)
        let K = (3.5, 1.05)

        // Mat dat
        doan(ctx, (-0.5, 0.0), (4.2, 0.0), mau: sm-gray, day: 1pt)
        nhan(ctx, (2.0, -0.25), text(size: 7pt)[Mặt đất])

        // Toa nha
        da-giac(ctx, ((3.1, 0.0), (3.9, 0.0), (3.9, 2.1), (3.1, 2.1)), mau: sm-gray.darken(20%), to: sm-gray-light, day: 1pt)
        // Cot anten
        doan(ctx, C, T, mau: sm-red, day: 1.6pt)
        diem(ctx, T, ten: $T$, huong: "tren", mau: sm-red)
        diem(ctx, C, ten: $C$, huong: "trai", mau: sm-blue)
        diem(ctx, D, ten: $D$, huong: "duoi", mau: sm-gray)

        // Dai quan sat A
        doan(ctx, H, A, mau: sm-blue, day: 1.2pt)
        diem(ctx, A, ten: $A$, huong: "trai", mau: sm-blue)
        diem(ctx, H, ten: $H$, huong: "duoi", mau: sm-gray)

        // Tia ngam
        doan(ctx, A, K, mau: sm-gray, day: 0.8pt, dut: true)
        doan(ctx, A, C, mau: sm-blue, day: 1pt)
        doan(ctx, A, T, mau: sm-red, day: 1pt)

        // Goc ngam
        goc(ctx, A, K, C, r: 0.9, ten: [$40^@$], mau: sm-blue)
        goc(ctx, A, K, T, r: 1.3, ten: [$50^@$], mau: sm-red)

        // Chu thich
        nhan(ctx, (-0.4, 0.5), text(size: 7pt, fill: sm-blue)[$7" m"$])
        nhan(ctx, (4.1, 2.5), text(size: 7pt, fill: sm-red)[$5" m"$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Gọi $d$ là khoảng cách theo phương ngang từ điểm quan sát $A$ tới tòa nhà.
    Chiều cao từ phương nhìn ngang $A$ lên chân cột antenna $C$ là $h_1 = d dot tan 40^@$.
    Chiều cao từ phương nhìn ngang $A$ lên đỉnh antenna $T$ là $h_2 = d dot tan 50^@$.
    🔹 *Bước 2:* Độ cao của cột antenna:
    $ h_2 - h_1 = d(tan 50^@ - tan 40^@) = 5" m" \
    => d = 5 / (tan 50^@ - tan 40^@) approx 14.183" m". $
    🔹 *Bước 3:* Độ cao chân cột $C$ so với vị trí $A$:
    $ h_1 = 14.183 dot tan 40^@ approx 11.90" m". $
    🔹 *Bước 4:* Vì điểm $A$ cao $7" m"$ so với mặt đất, chiều cao của tòa nhà là:
    $ h = 7 + 11.90 = 18.90" m" approx 18.9" m". $
    
    ✅ *Đáp số:* $18.9$.
  ]
)
