#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Tính diện tích và một số yếu tố khác của tam giác", mau: C3)

#bai-tap-tu-luan(mau: C3)[
  #bt-item(1, [Cho $triangle A B C$ có $S = 84, a = 13, b = 14, c = 15$. Tính bán kính đường tròn ngoại tiếp $R$ của tam giác $A B C$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng công thức tính diện tích:
    $ S &= (a b c)/(4 R) \
    => R &= (a b c)/(4 S) = (13 dot 14 dot 15)/(4 dot 84) = 2730/336 = 65/8 = 8.125. $
  ])

  #bt-item(2, [Cho $triangle A B C$ có $S = 10 sqrt(3)$ và nửa chu vi $p = 10$. Tính bán kính đường tròn nội tiếp $r$ của tam giác $A B C$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng công thức tính diện tích:
    $ S &= p r \
    => r &= S/p = (10 sqrt(3))/10 = sqrt(3). $
  ])

  #bt-item(3, [Cho hình chữ nhật $A B C D$ có $A B = 4, B C = 6, M$ là trung điểm $B C, N$ trên $C D$ sao cho $N D = 3 N C$. Tính bán kính đường tròn ngoại tiếp tam giác $A M N$.], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.6, xmax: 6.8, ymin: -0.6, ymax: 4.8, ctx => {
        let D = (0.0, 0.0)
        let C = (6.0, 0.0)
        let B = (6.0, 4.0)
        let A = (0.0, 4.0)
        let M = (6.0, 2.0)
        let N = (4.5, 0.0)

        da-giac(ctx, (A, B, C, D), mau: sm-gray, day: 1pt)
        sm-thiet-dien(ctx, (A, M, N), mau: sm-purple, to: sm-purple-light)

        doan(ctx, A, M, mau: sm-purple, day: 1.3pt)
        doan(ctx, M, N, mau: sm-purple, day: 1.3pt)
        doan(ctx, A, N, mau: sm-purple, day: 1.3pt)

        diem(ctx, A, ten: $A$, huong: "tren-trai")
        diem(ctx, B, ten: $B$, huong: "tren-phai")
        diem(ctx, C, ten: $C$, huong: "duoi-phai")
        diem(ctx, D, ten: $D$, huong: "duoi-trai")
        diem(ctx, M, ten: $M$, huong: "phai")
        diem(ctx, N, ten: $N$, huong: "duoi")

        nhan(ctx, (3.0, 4.35), text(size: 7pt, fill: sm-blue)[$A D = B C = 6$])
        nhan(ctx, (-0.45, 2.0), text(size: 7pt, fill: sm-blue)[$A B = 4$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính các đoạn thẳng trên cạnh:
    Vì $M$ là trung điểm $B C$ nên $B M = M C = 3$.
    Vì $N in C D$ và $N D = 3 N C$, với $C D = A B = 4$, ta có $N C = 1$ và $N D = 3$.
    
    🔹 *Bước 2:* Áp dụng định lý Pythagoras cho các tam giác vuông để tính độ dài các cạnh của $triangle A M N$:
    $ A M &= sqrt(A B^2 + B M^2) = sqrt(4^2 + 3^2) = 5. $
    $ M N &= sqrt(M C^2 + N C^2) = sqrt(3^2 + 1^2) = sqrt(10). $
    $ A N &= sqrt(A D^2 + D N^2) = sqrt(6^2 + 3^2) = sqrt(45) = 3 sqrt(5). $
    
    🔹 *Bước 3:* Diện tích tam giác $A M N$:
    $ S_{A M N} &= S_{A B C D} - (S_{A B M} + S_{M C N} + S_{A D N}) \
    &= 4 dot 6 - (1/2(4 dot 3) + 1/2(3 dot 1) + 1/2(6 dot 3)) \
    &= 24 - (6 + 1.5 + 9) = 24 - 16.5 = 7.5. $
    
    🔹 *Bước 4:* Bán kính đường tròn ngoại tiếp tam giác $A M N$:
    $ R &= (A M dot M N dot A N)/(4 S_{A M N}) \
    &= (5 dot sqrt(10) dot 3 sqrt(5))/(4 dot 7.5) = (75 sqrt(2))/30 = (5 sqrt(2))/2. $
  ])

  #bt-item(4, [Cho tam giác $A B C$ nội tiếp đường tròn bán kính bằng $3$, biết $hat(A) = 30^@, hat(B) = 45^@$. Tính độ dài trung tuyến kẻ từ $A$ và bán kính đường tròn nội tiếp.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng định lý sin để tính các cạnh:
    $ a &= 2 R sin A = 2 dot 3 dot sin 30^@ = 3. $
    $ b &= 2 R sin B = 2 dot 3 dot sin 45^@ = 3 sqrt(2). $
    $ hat(C) &= 180^@ - (30^@ + 45^@) = 105^@ \
    => c &= 2 R sin 105^@ = 6 dot (sqrt(6) + sqrt(2))/4 = (3(sqrt(6) + sqrt(2)))/2. $
    
    🔹 *Bước 2:* Tính độ dài đường trung tuyến $m_a$:
    $ m_a^2 &= (2(b^2 + c^2) - a^2)/4. $
    Với $b^2 = 18, c^2 = 9(2 + sqrt(3)) = 18 + 9 sqrt(3)$ và $a^2 = 9$, suy ra:
    $ m_a = sqrt((2(36 + 9 sqrt(3)) - 9)/4) = sqrt((63 + 18 sqrt(3))/4) approx 4.85. $
    
    🔹 *Bước 3:* Tính bán kính đường tròn nội tiếp:
    Diện tích:
    $ S = (a b c)/(4 R) = (3 dot 3 sqrt(2) dot (3(sqrt(6)+sqrt(2)))/2)/(12) = (9(sqrt(3) + 1))/4. $
    Nửa chu vi:
    $ p = (a + b + c)/2 = (3 + 3 sqrt(2) + (3 sqrt(6) + 3 sqrt(2))/2)/2. $
    Bán kính đường tròn nội tiếp:
    $ r = S/p approx 0.88. $
  ])

  #bt-item(5, [Cho tam giác đều $A B C$. Gọi $D$ là điểm thỏa mãn $vec(D C) = 2 vec(B D)$. Gọi $R$ và $r$ lần lượt là bán kính đường tròn ngoại tiếp và nội tiếp tam giác $A D C$. Tính tỉ số $R / r$.], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.6, ymax: 4.8, ctx => {
        let B = (0.0, 0.0)
        let C = (4.5, 0.0)
        let A = (2.25, 3.9)
        let D = (1.5, 0.0)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        sm-thiet-dien(ctx, (A, D, C), mau: sm-amber, to: sm-amber-light)

        doan(ctx, A, D, mau: sm-red, day: 1.3pt)
        diem(ctx, D, ten: $D$, huong: "duoi")

        nhan(ctx, (0.75, -0.3), text(size: 7pt, fill: sm-blue)[$a/3$])
        nhan(ctx, (3.0, -0.3), text(size: 7pt, fill: sm-blue)[$(2 a)/3$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính các cạnh trong $triangle A B D$:
    Đặt độ dài cạnh tam giác đều $A B C$ là $a$.
    Từ $vec(D C) = 2 vec(B D)$ suy ra $D$ nằm trên đoạn $B C$ và $B D = a/3, C D = (2 a)/3$.
    Áp dụng định lý côsin trong $triangle A B D$:
    $ A D^2 &= A B^2 + B D^2 - 2 A B dot B D dot cos 60^@ \
    &= a^2 + a^2/9 - 2 a (a/3) dot 1/2 = (7 a^2)/9 \
    => A D &= (a sqrt(7))/3. $
    
    🔹 *Bước 2:* Tính diện tích tam giác $A D C$:
    $ S_{A D C} &= 2/3 S_{A B C} = 2/3 dot (a^2 sqrt(3))/4 = (a^2 sqrt(3))/6. $
    
    🔹 *Bước 3:* Tính bán kính đường tròn ngoại tiếp $R$ của $triangle A D C$:
    $ R &= (A C dot C D dot A D)/(4 S_{A D C}) \
    &= (a dot (2 a)/3 dot (a sqrt(7))/3)/(4 dot (a^2 sqrt(3))/6) = (sqrt(21))/9 a. $
    
    🔹 *Bước 4:* Tính bán kính đường tròn nội tiếp $r$ của $triangle A D C$:
    Nửa chu vi của $triangle A D C$:
    $ p &= (a + (2 a)/3 + (a sqrt(7))/3)/2 = (5 + sqrt(7))/6 a. $
    Suy ra:
    $ r &= S/p = ((a^2 sqrt(3))/6)/(((5 + sqrt(7))/6) a) \
    &= (sqrt(3))/(5 + sqrt(7)) a = (sqrt(3)(5 - sqrt(7)))/18 a. $
    
    🔹 *Bước 5:* Tính tỉ số $R / r$:
    $ R / r = ((sqrt(21))/9 a) / ((sqrt(3)(5 - sqrt(7)))/18 a) = (2 sqrt(7))/(5 - sqrt(7)) = (5 sqrt(7) + 7)/9. $
  ])

  #bt-item(6, [Cho tam giác $A B C$ có $A B = 4" m", B C = 6" m", A C = 2 sqrt(7)" m"$. Điểm $M$ thuộc đoạn $B C$ sao cho $M C = 2 M B$. Tính diện tích tam giác $A B C$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính nửa chu vi tam giác $A B C$:
    $ p = (4 + 6 + 2 sqrt(7))/2 = 5 + sqrt(7). $
    🔹 *Bước 2:* Áp dụng công thức Heron tính diện tích:
    $ S &= sqrt(p(p - a)(p - b)(p - c)) \
    &= sqrt((5 + sqrt(7))(sqrt(7) - 1)(sqrt(7) + 1)(5 - sqrt(7))) \
    &= sqrt((25 - 7)(7 - 1)) = sqrt(18 dot 6) = sqrt(108) = 6 sqrt(3)" m"^2. $
  ])

  #bt-item(7, [Cho tam giác $A B C$ có $M$ là trung điểm của $B C$. Biết $A B = 3, B C = 8$ và $cos hat(A M B) = (5 sqrt(13))/26$. Tính diện tích của tam giác $A B C$.], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.6, ymax: 4.2, ctx => {
        let B = (0.0, 0.0)
        let C = (4.8, 0.0)
        let M = (2.4, 0.0)
        let A = (1.5, 3.2)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        doan(ctx, A, M, mau: sm-red, day: 1.2pt)
        goc(ctx, M, B, A, r: 0.6, ten: text(size: 6.5pt, fill: sm-red)[$hat(M)$], mau: sm-red)

        diem(ctx, M, ten: $M$, huong: "duoi")
        nhan(ctx, (1.2, -0.3), text(size: 7pt, fill: sm-blue)[$4$])
        nhan(ctx, (3.6, -0.3), text(size: 7pt, fill: sm-blue)[$4$])
        nhan(ctx, (0.5, 1.8), text(size: 7pt, fill: sm-blue)[$A B = 3$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính $B M$:
    Vì $M$ là trung điểm $B C$ nên $B M = M C = 4$.
    🔹 *Bước 2:* Áp dụng định lý côsin trong tam giác $A B M$:
    $ A B^2 &= A M^2 + B M^2 - 2 A M dot B M dot cos hat(A M B) \
    <=> 9 &= A M^2 + 16 - 2 dot A M dot 4 dot (5 sqrt(13))/26 \
    <=> A M^2 &- (20 sqrt(13))/13 A M + 7 = 0. $
    Giải phương trình bậc hai ta được $A M = sqrt(13)$ hoặc $A M = (7 sqrt(13))/13$.
    🔹 *Bước 3:* Với $A M = sqrt(13)$, tính $\sin \widehat{A M B}$:
    $ sin hat(A M B) &= sqrt(1 - cos^2 hat(A M B)) \
    &= sqrt(1 - (25 dot 13)/676) = (3 sqrt(39))/26. $
    🔹 *Bước 4:* Tính diện tích tam giác $A B M$ và $A B C$:
    $ S_{A B M} &= 1/2 A M dot B M dot sin hat(A M B) \
    &= 1/2 dot sqrt(13) dot 4 dot (3 sqrt(39))/26 = 3 sqrt(3). $
    Vì $M$ là trung điểm $B C$ nên:
    $ S_{A B C} = 2 S_{A B M} = 6 sqrt(3). $
  ])

  #bt-item(8, [Một người ngồi trên tàu hỏa đi từ ga $A$ đến ga $B$. Khi ở ga $A$ nhìn thấy tháp $C$ góc $60^@$ so với hướng đi của tàu. Khi đến ga $B$ nhìn lại thấy tháp $C$ góc $45^@$ so với hướng ngược lại. Biết đoạn đường tàu nối thẳng ga $A$ với $B$ dài $8" km"$. Tính khoảng cách từ ga $A$ đến tháp $C$ và khoảng cách từ tháp đến đường tàu.], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.6, ymax: 4.2, ctx => {
        let A = (0.0, 0.0)
        let B = (4.8, 0.0)
        let C = (2.0, 3.46)
        let H = (2.0, 0.0)

        doan(ctx, (-0.4, 0.0), (5.2, 0.0), mau: sm-gray, day: 1.2pt)
        doan(ctx, A, C, mau: sm-blue, day: 1.3pt)
        doan(ctx, B, C, mau: sm-green.darken(20%), day: 1.3pt)
        doan(ctx, C, H, mau: sm-red, day: 1pt, dut: true)

        goc-vuong(ctx, H, C, A, r: 0.25, mau: sm-red)
        goc(ctx, A, B, C, r: 0.6, ten: text(size: 7pt, fill: sm-blue)[$60^@$], mau: sm-blue)
        goc(ctx, B, C, A, r: 0.6, ten: text(size: 7pt, fill: sm-green.darken(20%))[$45^@$], mau: sm-green.darken(20%))

        diem(ctx, A, ten: $A$, huong: "duoi-trai")
        diem(ctx, B, ten: $B$, huong: "duoi-phai")
        diem(ctx, C, ten: $C$, huong: "tren")
        diem(ctx, H, ten: $H$, huong: "duoi")

        nhan(ctx, (3.6, -0.35), text(size: 7pt, fill: sm-blue)[$A B = 8" km"$])
        nhan(ctx, (0.7, 1.9), text(size: 7pt, fill: sm-blue)[$A C$])
        nhan(ctx, (2.25, 1.7), text(size: 7pt, fill: sm-red)[$h$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính góc $C$ trong tam giác $A B C$:
    $ hat(A C B) = 180^@ - (60^@ + 45^@) = 75^@. $
    🔹 *Bước 2:* Theo định lý sin, tính khoảng cách từ ga $A$ đến tháp $C$:
    $ (A C)/(sin 45^@) &= (A B)/(sin 75^@) \
    => A C &= (8 dot sin 45^@)/(sin 75^@) = (8 dot sqrt(2)/2)/((sqrt(6) + sqrt(2))/4) \
    &= 8(sqrt(3) - 1) approx 5.86" km". $
    🔹 *Bước 3:* Khoảng cách từ tháp $C$ đến đường tàu $A B$:
    $ h &= C H = A C dot sin 60^@ \
    &= 8(sqrt(3) - 1) dot sqrt(3)/2 = 4(3 - sqrt(3)) approx 5.07" km". $
  ])

  #bt-item(9, [Một tòa tháp đổ nát được rào lại vì lý do an toàn. Để tìm chiều cao của tháp $C T$ (với $C$ là chân tháp trên mặt đất), người đo đứng tại điểm $A$ và đo góc $hat(C A T) = 18^@$. Sau đó người đo đi thẳng $20" m"$ về phía chân tháp đến điểm $B$ và đo được góc $hat(C B T) = 31^@$. Tính chiều cao của tháp (làm tròn đến hai chữ số thập phân).], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 4.2, ctx => {
        let C = (0.0, 0.0)
        let T = (0.0, 3.4)
        let B = (2.2, 0.0)
        let A = (4.6, 0.0)

        doan(ctx, (-0.4, 0.0), (5.0, 0.0), mau: sm-gray, day: 0.8pt)
        doan(ctx, C, T, mau: sm-red, day: 2.2pt)
        doan(ctx, B, T, mau: sm-blue, day: 1.1pt)
        doan(ctx, A, T, mau: sm-green.darken(20%), day: 1.1pt)

        goc-vuong(ctx, C, T, B, r: 0.25, mau: sm-gray)
        goc(ctx, B, T, C, r: 0.5, ten: text(size: 6.5pt, fill: sm-blue)[$31^@$], mau: sm-blue)
        goc(ctx, A, T, C, r: 0.7, ten: text(size: 6.5pt, fill: sm-green.darken(20%))[$18^@$], mau: sm-green.darken(20%))

        diem(ctx, C, ten: $C$, huong: "duoi-trai")
        diem(ctx, T, ten: $T$, huong: "tren")
        diem(ctx, B, ten: $B$, huong: "duoi")
        diem(ctx, A, ten: $A$, huong: "duoi")

        nhan(ctx, (-0.35, 1.7), text(size: 7.5pt, fill: sm-red)[$C T$])
        nhan(ctx, (3.4, -0.3), text(size: 7pt, fill: sm-blue)[$20" m"$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Trong tam giác $A B T$, góc ngoài tại $B$ là $hat(C B T) = 31^@$:
    $ hat(A T B) = hat(C B T) - hat(C A T) = 31^@ - 18^@ = 13^@. $
    🔹 *Bước 2:* Theo định lý sin trong tam giác $A B T$:
    $ (B T)/(sin hat(T A B)) &= (A B)/(sin hat(A T B)) \
    => B T &= (20 dot sin 18^@)/(sin 13^@) approx 27.47" m". $
    🔹 *Bước 3:* Trong tam giác vuông $B C T$ (vuông tại $C$):
    $ C T &= B T dot sin 31^@ approx 27.47 dot sin 31^@ approx 14.15" m". $
    Vậy chiều cao của tháp xấp xỉ $14.15" m".
  ])

  #bt-item(10, [Một học sinh tập sút bóng sệt vào khung thành trống có bề rộng đo giữa hai mép trong của cột là $B C = 7,3" m"$. Biết khoảng cách từ quả bóng (điểm $A$) đến chân các mép cột $B, C$ lần lượt là $A B = 10" m"$ và $A C = 14" m"$. Tính góc sút tối đa để học sinh đó có thể sút được bóng vào lưới.], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 4.8, ctx => {
        let A = (2.0, 0.0)
        let B = (0.5, 4.0)
        let C = (4.5, 4.0)

        doan(ctx, B, C, mau: sm-gray, day: 2.5pt)
        doan(ctx, A, B, mau: sm-blue, day: 1.2pt)
        doan(ctx, A, C, mau: sm-blue, day: 1.2pt)

        goc(ctx, A, B, C, r: 0.7, ten: text(size: 7pt, fill: sm-red)[$alpha$], mau: sm-red)

        diem(ctx, A, ten: $A$, huong: "duoi")
        diem(ctx, B, ten: $B$, huong: "tren-trai")
        diem(ctx, C, ten: $C$, huong: "tren-phai")

        nhan(ctx, (2.5, 4.3), text(size: 7pt, fill: sm-gray)[Khung thành $B C = 7,3" m"$])
        nhan(ctx, (0.9, 2.0), text(size: 7pt, fill: sm-blue)[$10" m"$])
        nhan(ctx, (3.5, 2.0), text(size: 7pt, fill: sm-blue)[$14" m"$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Góc sút tối đa tương ứng với góc nhìn $hat(B A C)$ từ vị trí quả bóng $A$ tới hai cột dọc $B, C$.
    🔹 *Bước 2:* Áp dụng định lý côsin trong tam giác $A B C$:
    $ cos hat(B A C) &= (A B^2 + A C^2 - B C^2)/(2 A B dot A C) = (10^2 + 14^2 - 7.3^2)/(2 dot 10 dot 14) \
    &= (100 + 196 - 53.29)/280 = 242.71/280 approx 0.8668. $
    🔹 *Bước 3:* Suy ra:
    $ hat(B A C) = arccos(0.8668) approx 29^@ 54' approx 29.9^@. $
    Vậy góc sút tối đa để bóng có thể vào lưới là xấp xỉ $29^@ 54'$ (gần $30^@$).
  ])
]

#bai-tap-trac-nghiem(mau: C3)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 24, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $A B = 3, A C = 5, B C = 6$. Tính bán kính đường tròn ngoại tiếp tam giác $A B C$.],
  (
    True([$(45 sqrt(14))/56$.]),
    [$(45 sqrt(14))/14$.],
    [$(4 sqrt(14))/45$.],
    [$(45 sqrt(14))/28$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính diện tích tam giác theo công thức Heron, sau đó tính bán kính đường tròn ngoại tiếp theo công thức $R = (a b c)/(4 S)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính nửa chu vi tam giác:
    $ p = (a + b + c)/2 = (6 + 5 + 3)/2 = 7. $
    🔹 *Bước 2:* Tính diện tích tam giác theo công thức Heron:
    $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(7(7 - 6)(7 - 5)(7 - 3)) = sqrt(7 dot 1 dot 2 dot 4) = sqrt(56) = 2 sqrt(14). $
    🔹 *Bước 3:* Bán kính đường tròn ngoại tiếp là:
    $ R = (a b c)/(4 S) = (6 dot 5 dot 3)/(4 dot 2 sqrt(14)) = 90 / (8 sqrt(14)) = 45 / (4 sqrt(14)) = (45 sqrt(14))/56. $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $c = 3, b = 5, a = 6$. Tính $sin A$.],
  (
    [$(2 sqrt(14))/15$.],
    True([$(4 sqrt(14))/15$.]),
    [$sqrt(14)/15$.],
    [$(15 sqrt(14))/56$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính diện tích tam giác theo công thức Heron, sau đó rút $sin A$ từ công thức $S = 1/2 b c sin A$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính nửa chu vi của tam giác:
    $ p = (a + b + c)/2 = (6 + 5 + 3)/2 = 7. $
    🔹 *Bước 2:* Áp dụng công thức Heron tính diện tích:
    $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(7(7 - 6)(7 - 5)(7 - 3)) = sqrt(7 dot 1 dot 2 dot 4) = sqrt(56) = 2 sqrt(14). $
    🔹 *Bước 3:* Từ công thức diện tích $S = 1/2 b c sin A$, suy ra:
    $ sin A = (2 S)/(b c) = (2 dot 2 sqrt(14))/(5 dot 3) = (4 sqrt(14))/15. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $A C = 30, B C = 50$ và $hat(C) = 75^@$. Tính đường cao $C H$.],
  (
    [$28,1$.],
    True([$28,2$.]),
    [$28,3$.],
    [$28,4$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính diện tích tam giác $S = 1/2 a b sin C$ và độ dài cạnh đối diện $c = A B$ bằng định lý côsin, sau đó suy ra đường cao $h_c = (2 S)/c$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng định lý côsin tính cạnh $A B$:
    $ A B^2 = C A^2 + C B^2 - 2 C A dot C B dot cos 75^@ $
    $ A B^2 = 30^2 + 50^2 - 2 dot 30 dot 50 dot cos 75^@ = 900 + 2500 - 3000 dot 0,2588 approx 2623,55. $
    Suy ra:
    $ c = A B approx sqrt(2623.55) approx 51,22. $
    🔹 *Bước 2:* Tính diện tích tam giác:
    $ S = 1/2 A C dot B C dot sin 75^@ = 1/2 dot 30 dot 50 dot sin 75^@ approx 750 dot 0,9659 = 724,44. $
    🔹 *Bước 3:* Độ dài đường cao $C H$:
    $ C H = (2 S)/(A B) approx (2 dot 724,44)/(51,22) approx 28,2. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $hat(B) = 45^@, hat(C) = 75^@$ và $a = 50$. Bán kính đường tròn nội tiếp tam giác $A B C$ bằng:],
  (
    [$13,1$.],
    [$13,2$.],
    True([$13,3$.]),
    [$13,4$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính góc $hat(A)$, tính độ dài các cạnh $b, c$ theo định lý sin, rồi áp dụng công thức $r = S/p$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính số đo góc $hat(A)$:
    $ hat(A) = 180^@ - (45^@ + 75^@) = 60^@. $
    🔹 *Bước 2:* Áp dụng định lý sin tính độ dài các cạnh $b, c$:
    $ b = (a dot sin B)/(sin A) = (50 dot sin 45^@)/(sin 60^@) = (50 dot sqrt(2)/2)/(sqrt(3)/2) = (50 sqrt(2))/sqrt(3) approx 40,82. $
    $ c = (a dot sin C)/(sin A) = (50 dot sin 75^@)/(sin 60^@) approx (50 dot 0,9659)/(0,8660) approx 55,76. $
    🔹 *Bước 3:* Tính nửa chu vi $p$ và diện tích $S$:
    $ p = (a + b + c)/2 approx (50 + 40,82 + 55,76)/2 = 73,29. $
    $ S = 1/2 a b sin C = 1/2 dot 50 dot 40,82 dot sin 75^@ approx 985,8. $
    🔹 *Bước 4:* Bán kính đường tròn nội tiếp là:
    $ r = S/p approx 985,8 / 73,29 approx 13,3. $
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác đều nội tiếp đường tròn bán kính $R$ có diện tích là:],
  (
    [$2 R^2 cos^3 A$.],
    True([$(3 sqrt(3))/4 R^2$ hoặc dạng lượng giác.]),
    [$R^2 sin^3 A$.],
    [$2 R^3 sin^3 A$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tam giác đều có ba góc bằng $60^@$, độ dài mỗi cạnh theo bán kính ngoại tiếp là $a = 2 R sin 60^@ = R sqrt(3)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Độ dài cạnh của tam giác đều nội tiếp đường tròn bán kính $R$:
    $ a = 2 R sin 60^@ = 2 R dot sqrt(3)/2 = R sqrt(3). $
    🔹 *Bước 2:* Diện tích của tam giác đều cạnh $a$:
    $ S = (a^2 sqrt(3))/4 = ((R sqrt(3))^2 sqrt(3))/4 = (3 sqrt(3))/4 R^2. $
    🔹 *Bước 3:* Dưới dạng lượng giác, với $A = 60^@$, ta có:
    $ S = 2 R^2 sin A sin B sin C = 2 R^2 sin^3 60^@ = 2 R^2 (sqrt(3)/2)^3 = (3 sqrt(3))/4 R^2. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác với ba cạnh là $a, b, c$. Bán kính đường tròn nội tiếp tam giác đó bằng:],
  (
    [$(sqrt(p(p - a)(p - b)(p - c)))/p$.],
    True([$sqrt(((p - a)(p - b)(p - c))/p)$.]),
    [$(sqrt(p(p - a)(p - b)(p - c)))/(a + b + c)$.],
    [$(2 sqrt(p(p - a)(p - b)(p - c)))/p$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức $S = p r => r = S/p$ kết hợp công thức Heron tính diện tích $S = sqrt(p(p - a)(p - b)(p - c))$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Bán kính đường tròn nội tiếp là:
    $ r = S/p. $
    🔹 *Bước 2:* Thay công thức Heron vào biểu thức trên:
    $ r = (sqrt(p(p - a)(p - b)(p - c)))/p = sqrt((p(p - a)(p - b)(p - c))/p^2) = sqrt(((p - a)(p - b)(p - c))/p). $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $c = A B, b = A C, hat(A) = 60^@$. Chiều cao $h_a$ của tam giác $A B C$ là:],
  (
    [$(b c sqrt(3))/(2 sqrt(b^2 + c^2 + b c))$.],
    True([$(b c sqrt(3))/(2 sqrt(b^2 + c^2 - b c))$.]),
    [$(b c)/(2 sqrt(b^2 + c^2 - b c))$.],
    [$(b c)/(sqrt(b^2 + c^2 - b c))$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính độ dài cạnh $a$ bằng định lý côsin và diện tích $S = 1/2 b c sin A$, sau đó dùng hệ thức $h_a = (2 S)/a$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính cạnh $a$ theo định lý côsin với $hat(A) = 60^@$:
    $ a^2 = b^2 + c^2 - 2 b c cos 60^@ = b^2 + c^2 - b c => a = sqrt(b^2 + c^2 - b c). $
    🔹 *Bước 2:* Diện tích tam giác là:
    $ S = 1/2 b c sin 60^@ = 1/2 b c dot sqrt(3)/2 = (b c sqrt(3))/4. $
    🔹 *Bước 3:* Chiều cao kẻ từ đỉnh $A$:
    $ h_a = (2 S)/a = (2 dot (b c sqrt(3))/4)/sqrt(b^2 + c^2 - b c) = (b c sqrt(3))/(2 sqrt(b^2 + c^2 - b c)). $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Mảnh vườn hình tam giác có độ dài các cạnh $M N = 20" m", N P = 28" m", M P = 32" m"$. Diện tích mảnh vườn là bao nhiêu $m^2$ (làm tròn đến hàng phần mười)?],
  (
    [$316,7" m"^2$.],
    [$320" m"^2$.],
    True([$277,1" m"^2$.]),
    [$280" m"^2$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng công thức Heron để tính diện tích tam giác khi biết độ dài cả ba cạnh.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính nửa chu vi của mảnh vườn:
    $ p = (20 + 28 + 32)/2 = 80/2 = 40" m". $
    🔹 *Bước 2:* Áp dụng công thức Heron:
    $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(40(40 - 20)(40 - 28)(40 - 32)) $
    $ S = sqrt(40 dot 20 dot 12 dot 8) = sqrt(76800) = 160 sqrt(3)" m"^2. $
    🔹 *Bước 3:* Làm tròn đến hàng phần mười:
    $ S approx 160 dot 1,73205 = 277,13" m"^2 approx 277,1" m"^2. $
    
    ✅ *Chọn đáp án C.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 4, reset-counter: true)

#ds(
  [Cho tam giác $A B C$ có $cos A = 1/3, B C = 9$ và $A C = 6, M$ là trung điểm $B C$. Xét tính đúng sai:],
  (
    True([Độ dài cạnh $A B = 9$ hoặc $7$.]),
    [Diện tích hình tròn ngoại tiếp tam giác $A B C$ là $9 pi$.],
    True([Giá trị $cos hat(A M B)$ tính được từ hệ thức trung tuyến.]),
    True([Bán kính đường tròn nội tiếp thỏa mãn $S = p r$.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) ĐÚNG:* Áp dụng định lý côsin trong $triangle A B C$ đối với góc $A$:
    $ B C^2 = A B^2 + A C^2 - 2 A B dot A C dot cos A $
    $ 9^2 = A B^2 + 6^2 - 2 dot A B dot 6 dot 1/3 <=> 81 = A B^2 + 36 - 4 A B $
    $ <=> A B^2 - 4 A B - 45 = 0 <=> (A B - 9)(A B + 5) = 0 => A B = 9. $

    🔹 *Mệnh đề b) SAI:* Tính bán kính $R$:
    $ sin A = sqrt(1 - (1/3)^2) = (2 sqrt(2))/3. $
    $ R = (B C)/(2 sin A) = 9 / (2 dot (2 sqrt(2))/3) = 27 / (4 sqrt(2)). $
    Diện tích hình tròn $S_((C)) = pi R^2 = pi dot 729/32 != 9 pi$.

    🔹 *Mệnh đề c) ĐÚNG:* Áp dụng công thức đường trung tuyến $A M$ và định lý côsin trong tam giác $A B M$, ta hoàn toàn xác định được giá trị $cos hat(A M B)$.

    🔹 *Mệnh đề d) ĐÚNG:* Đây là công thức hình học chuẩn mực $S = p r$ liên hệ giữa diện tích, nửa chu vi và bán kính nội tiếp.
  ]
)

#ds(
  [Cho tam giác $A B C$ có độ dài ba trung tuyến bằng $15, 18, 27$. Xét tính đúng sai:],
  (
    [Có $B C^2 = A B^2 + A C^2 - 2 A B dot A C cos B$.],
    True([Ba trung tuyến tạo thành một tam giác có diện tích bằng $3/4 S_{A B C}$.]),
    True([Diện tích tam giác $A B C$ tính được theo công thức trung tuyến.]),
    True([Điểm đối xứng và trọng tâm chia diện tích tam giác thành các phần bằng nhau.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) SAI:* Công thức định lý côsin sai đỉnh của góc: vế phải là $-2 A B dot A C cos B$ trong khi hai cạnh là $A B$ và $A C$ thì góc xen giữa phải là góc $hat(A)$, tức là phải viết $cos A$.

    🔹 *Mệnh đề b) ĐÚNG:* Định lý quen thuộc về diện tích tạo bởi ba đường trung tuyến: Một tam giác có độ dài các cạnh bằng độ dài ba đường trung tuyến của tam giác ban đầu sẽ có diện tích bằng $3/4$ diện tích tam giác ban đầu ($S_m = 3/4 S$).

    🔹 *Mệnh đề c) ĐÚNG:* Từ diện tích tam giác trung tuyến $S_m$ tính bằng công thức Heron, ta suy ra ngay diện tích $S_{A B C} = 4/3 S_m$.

    🔹 *Mệnh đề d) ĐÚNG:* Trọng tâm tam giác chia tam giác thành 3 tam giác nhỏ có diện tích bằng nhau và 6 tam giác nhỏ hơn có diện tích bằng nhau.
  ]
)

#ds(
  [Cho tam giác $A B C$ có $hat(B A C) = 60^@, A C = 20, A B = 25$. Xét tính đúng sai:],
  (
    [$B C^2 = A B^2 + A C^2 - 2 A B dot A C cos C$.],
    True([Độ dài cạnh $B C = 5 sqrt(21)$.]),
    True([Diện tích tam giác $A B C$ là $S = 125 sqrt(3)$.]),
    [Bán kính đường tròn ngoại tiếp là $R = 5 sqrt(6)$.],
  ),
  loigiai: [
    🔹 *Mệnh đề a) SAI:* Công thức góc sai: cạnh đối diện là $B C$ thì góc xen giữa hai cạnh $A B, A C$ phải là góc $hat(A)$, công thức đúng phải là $-2 A B dot A C cos A$.

    🔹 *Mệnh đề b) ĐÚNG:* Áp dụng định lý côsin tính $B C$:
    $ B C^2 = 25^2 + 20^2 - 2 dot 25 dot 20 dot cos 60^@ = 625 + 400 - 500 = 525. $
    Suy ra:
    $ B C = sqrt(525) = 5 sqrt(21). $

    🔹 *Mệnh đề c) ĐÚNG:* Diện tích tam giác $A B C$ là:
    $ S = 1/2 A B dot A C dot sin 60^@ = 1/2 dot 25 dot 20 dot sqrt(3)/2 = 125 sqrt(3). $

    🔹 *Mệnh đề d) SAI:* Bán kính đường tròn ngoại tiếp:
    $ R = (B C)/(2 sin 60^@) = (5 sqrt(21))/(2 dot sqrt(3)/2) = (5 sqrt(21))/sqrt(3) = 5 sqrt(7) != 5 sqrt(6). $
  ]
)

#ds(
  [Cho tam giác $A B C$ có $A B = 8 sqrt(3), hat(B) = 50^@, hat(A) = 70^@$. Xét tính đúng sai:],
  (
    [$hat(C) = 50^@$.],
    True([$hat(C) = 60^@$.]),
    True([Độ dài cạnh $A C = (A B dot sin 50^@)/(sin 60^@) approx 12,26$.]),
    True([Bán kính đường tròn ngoại tiếp $triangle A B C$ là $R = 8$.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) SAI:* Tổng ba góc trong tam giác bằng $180^@$, do đó:
    $ hat(C) = 180^@ - (hat(A) + hat(B)) = 180^@ - (70^@ + 50^@) = 60^@ != 50^@. $

    🔹 *Mệnh đề b) ĐÚNG:* Khẳng định $hat(C) = 60^@$ là chính xác.

    🔹 *Mệnh đề c) ĐÚNG:* Áp dụng định lý sin:
    $ (A C)/(sin B) = (A B)/(sin C) => A C = (A B dot sin 50^@)/(sin 60^@) = (8 sqrt(3) dot sin 50^@)/(sqrt(3)/2) = 16 sin 50^@ approx 12,26. $

    🔹 *Mệnh đề d) ĐÚNG:* Bán kính đường tròn ngoại tiếp là:
    $ R = (A B)/(2 sin C) = (8 sqrt(3))/(2 sin 60^@) = (8 sqrt(3))/(2 dot sqrt(3)/2) = (8 sqrt(3))/sqrt(3) = 8. $
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 8, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho hình thoi $A B C D$ có cạnh bằng $3$. Góc $hat(B A D) = 30^@$. Tính diện tích hình thoi $A B C D$.],
  [4,5],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 2.5, ctx => {
        let A = (0.0, 0.0)
        let B = (3.0, 0.0)
        let D = (3.0 * calc.cos(30deg), 3.0 * calc.sin(30deg))
        let C = (3.0 + 3.0 * calc.cos(30deg), 3.0 * calc.sin(30deg))

        da-giac(ctx, (A, B, C, D), mau: sm-blue, to: sm-blue-light.transparentize(60%), day: 1.2pt)
        goc(ctx, A, B, D, r: 0.6, ten: text(size: 7pt, fill: sm-red)[$30^@$], mau: sm-red)

        diem(ctx, A, ten: $A$, huong: "duoi-trai")
        diem(ctx, B, ten: $B$, huong: "duoi-phai")
        diem(ctx, C, ten: $C$, huong: "tren-phai")
        diem(ctx, D, ten: $D$, huong: "tren-trai")

        nhan(ctx, (1.5, -0.3), text(size: 7pt, fill: sm-blue)[$3$])
        nhan(ctx, (1.0, 0.9), text(size: 7pt, fill: sm-blue)[$3$])
      })
    ]

    📌 *Phương pháp:* Diện tích hình thoi có cạnh $a$ và góc $alpha$ bằng $S = a^2 sin alpha$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Hình thoi $A B C D$ gồm hai tam giác $A B D$ và $C B D$ có diện tích bằng nhau:
    $ S_{A B C D} = 2 S_{A B D} = 2 dot (1/2 A B dot A D dot sin hat(B A D)). $
    🔹 *Bước 2:* Thay số $A B = A D = 3, hat(B A D) = 30^@$:
    $ S_{A B C D} = 3 dot 3 dot sin 30^@ = 9 dot 1/2 = 4,5. $
    
    ✅ *Đáp số:* $4,5$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$ vuông tại $A$, biết $A B = 6" cm", A C = 8" cm"$ và $M$ là trung điểm $B C$. Tính bán kính đường tròn ngoại tiếp tam giác $A B M$ (làm tròn đến hai chữ số thập phân).],
  [3,13],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 4.5, ctx => {
        let A = (0.0, 0.0)
        let C = (4.0, 0.0)
        let B = (0.0, 3.0)
        let M = (2.0, 1.5)

        tam-giac(ctx, A, C, B, ten: ($A$, $C$, $B$))
        goc-vuong(ctx, A, C, B, r: 0.25, mau: sm-gray)
        doan(ctx, A, M, mau: sm-red, day: 1.2pt)
        diem(ctx, M, ten: $M$, huong: "tren-phai")

        nhan(ctx, (-0.4, 1.5), text(size: 7pt, fill: sm-blue)[$6$])
        nhan(ctx, (2.0, -0.3), text(size: 7pt, fill: sm-blue)[$8$])
        nhan(ctx, (2.8, 2.5), text(size: 7pt, fill: sm-gray)[$B C = 10$])
      })
    ]

    📌 *Phương pháp:* Tính các cạnh của tam giác $A B M$, tính diện tích $S_{A B M} = 1/2 S_{A B C}$, sau đó áp dụng công thức $R = (a b c)/(4 S)$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính cạnh huyền $B C$ theo định lý Pythagore:
    $ B C = sqrt(A B^2 + A C^2) = sqrt(6^2 + 8^2) = 10" cm". $
    Vì $M$ là trung điểm $B C$ nên $B M = M C = 5" cm"$.
    Đường trung tuyến ứng với cạnh huyền:
    $ A M = (B C)/2 = 5" cm". $
    🔹 *Bước 2:* Diện tích tam giác $A B M$ bằng một nửa diện tích tam giác vuông $A B C$:
    $ S_{A B M} = 1/2 S_{A B C} = 1/2 dot (1/2 dot 6 dot 8) = 12" cm"^2. $
    🔹 *Bước 3:* Bán kính đường tròn ngoại tiếp tam giác $A B M$ (ba cạnh $A B = 6, B M = 5, A M = 5$):
    $ R = (A B dot B M dot A M)/(4 S_{A B M}) = (6 dot 5 dot 5)/(4 dot 12) = 150/48 = 25/8 = 3,125" cm" approx 3,13" cm". $
    
    ✅ *Đáp số:* $3,13$.
  ]
)

#tln(
  dir: "ngang",
  [Tam giác $A B C$ vuông cân tại $A$ nội tiếp đường tròn bán kính $R$. Gọi $r$ là bán kính đường tròn nội tiếp tam giác. Tính tỉ số $R / r$ (làm tròn đến hai chữ số thập phân).],
  [2,41],
  loigiai: [
    📌 *Phương pháp:* Biểu diễn các cạnh của tam giác vuông cân theo bán kính ngoại tiếp $R$, tính diện tích $S$ và nửa chu vi $p$, từ đó tìm bán kính nội tiếp $r = S/p$ và lập tỉ số $R / r$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tam giác vuông tại $A$ nội tiếp đường tròn bán kính $R$ nên cạnh huyền $B C = 2 R$.
    Vì tam giác vuông cân tại $A$ nên:
    $ A B = A C = (B C)/sqrt(2) = (2 R)/sqrt(2) = R sqrt(2). $
    🔹 *Bước 2:* Nửa chu vi của tam giác:
    $ p = (A B + A C + B C)/2 = (2 R sqrt(2) + 2 R)/2 = R(sqrt(2) + 1). $
    Diện tích của tam giác:
    $ S = 1/2 A B dot A C = 1/2 dot (R sqrt(2))^2 = R^2. $
    🔹 *Bước 3:* Bán kính đường tròn nội tiếp $r$:
    $ r = S/p = R^2 / (R(sqrt(2) + 1)) = R / (sqrt(2) + 1) = R(sqrt(2) - 1). $
    🔹 *Bước 4:* Tỉ số $R / r$ là:
    $ R/r = R / (R(sqrt(2) - 1)) = 1 / (sqrt(2) - 1) = sqrt(2) + 1 approx 1,414 + 1 = 2,414 approx 2,41. $
    
    ✅ *Đáp số:* $2,41$.
  ]
)

#tln(
  dir: "ngang",
  [Từ hai đèn tín hiệu $A$ và $B$ cách nhau $1536" m"$ trên biển đo góc nhìn lên đỉnh núi. Ngọn núi cao bao nhiêu mét (làm tròn đến hàng đơn vị)?],
  [649],
  loigiai: [
    📌 *Phương pháp:* Sử dụng định lý sin trong tam giác tạo bởi hai đèn $A, B$ và đỉnh núi $C$, sau đó áp dụng hệ thức lượng trong tam giác vuông để tính chiều cao núi.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng định lý sin tính khoảng cách từ vị trí đèn ngắm tới đỉnh núi:
    $ d = (A B dot sin alpha_1)/(sin(alpha_2 - alpha_1)). $
    🔹 *Bước 2:* Chiều cao của ngọn núi so với mực nước biển:
    $ h = d dot sin alpha_2 approx 649" m". $
    
    ✅ *Đáp số:* $649$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$ có các cạnh $a = 10" m", b = 8" m", c = 6" m"$. Tính độ dài đường phân giác trong góc $A$ của tam giác $A B C$ (làm tròn đến hai chữ số thập phân).],
  [4,85],
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức độ dài đường phân giác trong góc $A$: $l_a = (2 b c cos(A/2))/(b + c)$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Nhận xét ba cạnh $6, 8, 10$ thỏa mãn $6^2 + 8^2 = 10^2$, do đó tam giác $A B C$ vuông tại $A$ ($hat(A) = 90^@$).
    Suy ra:
    $ A/2 = 45^@ => cos(A/2) = cos 45^@ = sqrt(2)/2. $
    🔹 *Bước 2:* Thay số vào công thức đường phân giác:
    $ l_a = (2 b c cos(A/2))/(b + c) = (2 dot 8 dot 6 dot sqrt(2)/2)/(8 + 6) = (48 sqrt(2))/14 = (24 sqrt(2))/7. $
    🔹 *Bước 3:* Bấm máy tính làm tròn kết quả:
    $ l_a approx (24 dot 1,4142)/7 approx 4,848" m" approx 4,85" m". $
    
    ✅ *Đáp số:* $4,85$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$ biết $b = 7, c = 5, cos A = 3/5$. Bán kính đường tròn nội tiếp có dạng $r = a_0 - sqrt(b_0)$ với $a_0, b_0 in ZZ$. Tính giá trị biểu thức $a_0 - 2 b_0$.],
  [-1],
  loigiai: [
    📌 *Phương pháp:* Sử dụng định lý côsin tính cạnh $a$, công thức $sin A = sqrt(1 - cos^2 A)$ để tính diện tích $S$, nửa chu vi $p$ rồi tìm $r = S/p$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng định lý côsin tính cạnh $a$:
    $ a^2 = b^2 + c^2 - 2 b c cos A = 7^2 + 5^2 - 2 dot 7 dot 5 dot 3/5 = 49 + 25 - 42 = 32. $
    Suy ra $a = sqrt(32) = 4 sqrt(2)$.
    🔹 *Bước 2:* Tính $sin A$ và diện tích tam giác:
    $ sin A = sqrt(1 - (3/5)^2) = 4/5. $
    $ S = 1/2 b c sin A = 1/2 dot 7 dot 5 dot 4/5 = 14. $
    🔹 *Bước 3:* Nửa chu vi tam giác:
    $ p = (a + b + c)/2 = (4 sqrt(2) + 7 + 5)/2 = 6 + 2 sqrt(2). $
    🔹 *Bước 4:* Bán kính đường tròn nội tiếp $r$:
    $ r = S/p = 14 / (6 + 2 sqrt(2)) = 7 / (3 + sqrt(2)) = (7(3 - sqrt(2)))/(3^2 - 2) = (7(3 - sqrt(2)))/7 = 3 - sqrt(2). $
    Do đó $a_0 = 3, b_0 = 2$.
    🔹 *Bước 5:* Giá trị biểu thức:
    $ a_0 - 2 b_0 = 3 - 2 dot 2 = 3 - 4 = -1. $
    
    ✅ *Đáp số:* $-1$.
  ]
)

#tln(
  dir: "ngang",
  [Mặt tiền nhà ông An có $A B = 4" m"$, lan can dạng cung tròn $(C)$ cao $1" m"$ bằng inox giá $2,2$ triệu/$m^2$. Tính số tiền ông An phải trả (làm tròn đến hàng nghìn).],
  [9416],
  loigiai: [
    📌 *Phương pháp:* Tính độ dài cung tròn lan can $l = R dot alpha$, diện tích xung quanh của lan can hình trụ $S = l dot h$, sau đó nhân đơn giá.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính độ dài cung tròn lan can:
    $ l approx 4,28" m". $
    🔹 *Bước 2:* Diện tích bề mặt lan can bằng inox:
    $ S = l dot h = 4,28 dot 1 = 4,28" m"^2. $
    🔹 *Bước 3:* Số tiền ông An cần thanh toán:
    $ T = 4,28 dot 2.200.000 = 9.416.000" đồng". $
    
    ✅ *Đáp số:* $9416$.
  ]
)

#tln(
  dir: "ngang",
  [Tháp nước cao $100" ft"$ trên con dốc nghiêng $6^@$. Khoảng cách từ chân tháp đến điểm cố định dây cáp là $75" ft"$. Tính chiều dài sợi dây cáp bên trái (làm tròn đến một chữ số thập phân).],
  [131,1],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 4.2, ctx => {
        let B = (0.0, 0.0)
        let A = (3.5, 0.37)
        let C = (3.5, 3.8)

        // Mat doc nghieng
        doan(ctx, (-0.4, -0.04), (4.5, 0.47), mau: sm-gray, day: 1.2pt)
        nhan(ctx, (4.2, 0.2), text(size: 7pt)[Mặt dốc $6^@$])

        // Thap thang dung
        doan(ctx, A, C, mau: sm-blue, day: 2.2pt)
        // Day cap
        doan(ctx, B, C, mau: sm-red, day: 1.3pt)

        diem(ctx, B, ten: $B$, huong: "duoi")
        diem(ctx, A, ten: $A$, huong: "duoi-phai")
        diem(ctx, C, ten: $C$, huong: "tren", mau: sm-blue)

        goc(ctx, A, B, C, r: 0.6, ten: text(size: 7pt, fill: sm-blue)[$96^@$], mau: sm-blue)

        nhan(ctx, (3.9, 2.0), text(size: 7pt, fill: sm-blue)[$100" ft"$])
        nhan(ctx, (1.8, -0.1), text(size: 7pt)[$75" ft"$])
        nhan(ctx, (1.4, 2.1), text(size: 7pt, fill: sm-red)[$d approx 131,1" ft"$])
      })
    ]

    📌 *Phương pháp:* Tháp dựng thẳng đứng vuông góc phương ngang. Mặt dốc nghiêng $6^@$ so với phương ngang, do đó góc giữa tháp và mặt dốc về phía chân dốc là $90^@ + 6^@ = 96^@$. Áp dụng định lý côsin tính chiều dài sợi cáp.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Góc hợp bởi thân tháp $A C$ và mặt dốc $A B$:
    $ hat(B A C) = 90^@ + 6^@ = 96^@. $
    🔹 *Bước 2:* Áp dụng định lý côsin trong tam giác $A B C$:
    $ B C^2 = A B^2 + A C^2 - 2 A B dot A C dot cos 96^@ $
    $ B C^2 = 75^2 + 100^2 - 2 dot 75 dot 100 dot cos 96^@ $
    $ B C^2 = 5625 + 10000 - 15000 dot (-0,1045) approx 15625 + 1567,5 = 17192,5. $
    🔹 *Bước 3:* Chiều dài sợi cáp là:
    $ B C = sqrt(17192.5) approx 131,12" ft" approx 131,1" ft". $
    
    ✅ *Đáp số:* $131,1$.
  ]
)
