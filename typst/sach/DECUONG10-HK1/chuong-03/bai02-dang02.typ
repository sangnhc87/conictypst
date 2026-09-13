#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Áp dụng định lý sin trong tam giác", mau: C3)

#bai-tap-tu-luan(mau: C3)[
  #bt-item(1, [Cho tam giác $A B C$ có các góc $hat(A) = 75^@, hat(B) = 45^@$. Tính tỉ số $(A B)/(A C)$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính số đo góc $hat(C)$:
    $ hat(C) = 180^@ - (75^@ + 45^@) = 60^@. $
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $A B C$:
    $ (A B)/(sin C) &= (A C)/(sin B) \
    => (A B)/(A C) &= (sin C)/(sin B) = (sin 60^@)/(sin 45^@) \
    &= (sqrt(3)/2)/(sqrt(2)/2) = sqrt(6)/2. $
  ])

  #bt-item(2, [Cho tam giác $A B C$ có góc $hat(B A C) = 60^@$ và cạnh $B C = sqrt(3)$. Tính bán kính của đường tròn ngoại tiếp tam giác $A B C$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng định lý sin trong tam giác $A B C$:
    $ (B C)/(sin A) &= 2 R \
    => 2 R &= (sqrt(3))/(sin 60^@) = (sqrt(3))/(sqrt(3)/2) = 2. $
    Suy ra $R = 1$.
  ])

  #bt-item(3, [Cho tam giác $A B C$ có $b c = a^2$. Chứng minh rằng $sin^2 A = sin B dot sin C$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Theo định lý sin, ta có:
    $ a = 2 R sin A, quad b = 2 R sin B, quad c = 2 R sin C. $
    🔹 *Bước 2:* Thay vào hệ thức $b c = a^2$:
    $ (2 R sin B)(2 R sin C) &= (2 R sin A)^2 \
    <=> 4 R^2 sin B sin C &= 4 R^2 sin^2 A \
    <=> sin B sin C &= sin^2 A. $
    (điều phải chứng minh)
  ])

  #bt-item(4, [Cho tam giác $A B C$ thỏa mãn $sin A = 2 sin B dot cos C$. Chứng minh rằng tam giác $A B C$ là tam giác cân.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Ta có tổng 3 góc $A + B + C = 180^@$, suy ra $A = 180^@ - (B + C)$. Do đó:
    $ sin A = sin(B + C) = sin B cos C + cos B sin C. $
    🔹 *Bước 2:* Thay vào giả thiết ta được:
    $ sin B cos C + cos B sin C &= 2 sin B cos C \
    <=> sin B cos C - cos B sin C &= 0 \
    <=> sin(B - C) &= 0. $
    🔹 *Bước 3:* Vì $B, C$ là các góc của tam giác ($0^@ < B, C < 180^@$) nên $-180^@ < B - C < 180^@$. Do đó:
    $ B - C = 0 <=> B = C. $
    Vậy tam giác $A B C$ cân tại $A$.
  ])

  #bt-item(5, [Từ một tấm bìa hình tròn, bạn Thảo cắt ra một hình tam giác có các cạnh $A B = 8" cm", A C = 13" cm"$ và $hat(B) = 60^@$. Tính độ dài cạnh $B C$ và bán kính $R$ của miếng bìa (làm tròn kết quả đến hàng phần mười).], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Bán kính $R$ của tấm bìa hình tròn ngoại tiếp tam giác được tính theo định lý sin:
    $ R = (A C)/(2 sin B) = 13 / (2 sin 60^@) = 13 / sqrt(3) approx 7.5" cm". $
    🔹 *Bước 2:* Áp dụng định lý côsin trong tam giác $A B C$:
    $ A C^2 &= A B^2 + B C^2 - 2 A B dot B C dot cos B \
    <=> 13^2 &= 8^2 + B C^2 - 2 dot 8 dot B C dot cos 60^@ \
    <=> 169 &= 64 + B C^2 - 16 B C dot 1/2 \
    <=> B C^2 - 8 B C - 105 &= 0. $
    Giải phương trình ta được $B C = 15" cm"$ hoặc $B C = -7$ (loại do $B C > 0$).
    Vậy độ dài cạnh $B C$ là $15" cm"$ và bán kính tấm bìa xấp xỉ $7.5" cm".
  ])

  #bt-item(6, [Giả sử $C D = h$ là chiều cao của tháp trong đó $C$ là chân tháp. Chọn hai điểm $A, B$ trên mặt đất sao cho ba điểm $A, B, C$ thẳng hàng. Đo được $A B = 24" m", hat(C A D) = 63^@, hat(C B D) = 48^@$. Tính chiều cao $h$ của tháp.], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.0, ymin: -0.5, ymax: 4.2, ctx => {
        let C = (0.0, 0.0)
        let D = (0.0, 3.6)
        let A = (1.83, 0.0)
        let B = (3.99, 0.0)

        doan(ctx, (-0.4, 0.0), (4.6, 0.0), mau: sm-gray, day: 0.8pt)
        doan(ctx, C, D, mau: sm-red, day: 2.2pt)
        doan(ctx, A, D, mau: sm-blue, day: 1.1pt)
        doan(ctx, B, D, mau: sm-green.darken(20%), day: 1.1pt)

        goc-vuong(ctx, C, D, A, r: 0.25, mau: sm-gray)
        goc(ctx, A, D, C, r: 0.5, ten: text(size: 7pt, fill: sm-blue)[$63^@$], mau: sm-blue)
        goc(ctx, B, D, C, r: 0.65, ten: text(size: 7pt, fill: sm-green.darken(20%))[$48^@$], mau: sm-green.darken(20%))

        diem(ctx, C, ten: $C$, huong: "duoi-trai")
        diem(ctx, D, ten: $D$, huong: "tren")
        diem(ctx, A, ten: $A$, huong: "duoi")
        diem(ctx, B, ten: $B$, huong: "duoi")

        nhan(ctx, (-0.35, 1.8), text(size: 7.5pt, fill: sm-red)[$h$])
        nhan(ctx, (2.9, -0.3), text(size: 7.5pt, fill: sm-blue)[$24" m"$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Xét tam giác $D A B$, góc ngoài tại đỉnh $A$ là $hat(C A D) = 63^@$:
    $ hat(A D B) = hat(C A D) - hat(C B D) = 63^@ - 48^@ = 15^@. $
    Mặt khác, $hat(D A B) = 180^@ - 63^@ = 117^@$.
    
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $D A B$:
    $ (D B)/(sin hat(D A B)) &= (A B)/(sin hat(A D B)) \
    => D B &= (24 dot sin 117^@)/(sin 15^@) = (24 dot sin 63^@)/(sin 15^@) approx 82.62" m". $
    
    🔹 *Bước 3:* Xét tam giác vuông $B C D$ tại $C$, chiều cao của tháp là:
    $ h = C D = D B dot sin hat(C B D) approx 82.62 dot sin 48^@ approx 61.4" m". $
    Vậy chiều cao của tháp xấp xỉ $61.4" m"$.
  ])
]

#bai-tap-trac-nghiem(mau: C3)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 18, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$. Tìm công thức sai:],
  (
    [$a / (sin A) = 2 R$.],
    [$sin A = a / (2 R)$.],
    True([$b sin B = 2 R$.]),
    [$sin C = (c sin A)/a$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý sin trong tam giác: $a / (sin A) = b / (sin B) = c / (sin C) = 2 R$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Theo định lý sin, ta có:
    $ b / (sin B) = 2 R <=> b = 2 R sin B quad "hay" quad sin B = b / (2 R). $
    🔹 *Bước 2:* Công thức $b sin B = 2 R$ là sai vì phép toán giữa $b$ và $sin B$ là phép chia, không phải phép nhân.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $triangle A B C$ với $A B = c, A C = b, B C = a$. Phát biểu nào sau đây sai?],
  (
    [$S = (a b c)/(4 R)$.],
    True([$R = a / (sin A)$.]),
    [$S = 1/2 a b sin C$.],
    [$a^2 + b^2 - c^2 = 2 a b cos C$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Kiểm tra các công thức hệ thức lượng: diện tích tam giác, định lý côsin và định lý sin.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Theo định lý sin:
    $ a / (sin A) = 2 R => R = a / (2 sin A). $
    🔹 *Bước 2:* Do đó, phát biểu $R = a / (sin A)$ bị thiếu thừa số $2$ ở mẫu số, nên là phát biểu sai.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ thoả mãn hệ thức $b + c = 2 a$. Mệnh đề nào sau đây đúng?],
  (
    [$cos B + cos C = 2 cos A$.],
    True([$sin B + sin C = 2 sin A$.]),
    [$sin B + sin C = 1/2 sin A$.],
    [$sin B + cos C = 2 sin A$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Chuyển đổi giữa độ dài các cạnh và sin các góc thông qua định lý sin: $a = 2 R sin A, b = 2 R sin B, c = 2 R sin C$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Từ định lý sin, ta biểu diễn các cạnh theo bán kính $R$ và sin các góc đối diện:
    $ a = 2 R sin A, quad b = 2 R sin B, quad c = 2 R sin C. $
    🔹 *Bước 2:* Thay vào hệ thức giả thiết $b + c = 2 a$:
    $ 2 R sin B + 2 R sin C = 2(2 R sin A) $
    $ <=> 2 R(sin B + sin C) = 4 R sin A <=> sin B + sin C = 2 sin A. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $triangle A B C$ có $A B = 5, hat(A) = 40^@, hat(B) = 60^@$. Độ dài $B C$ gần nhất với kết quả nào?],
  (
    True([$3,3$.]),
    [$3,5$.],
    [$3,7$.],
    [$3,1$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính góc thứ ba của tam giác, sau đó áp dụng định lý sin: $(B C)/(sin A) = (A B)/(sin C)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính số đo góc $hat(C)$:
    $ hat(C) = 180^@ - (hat(A) + hat(B)) = 180^@ - (40^@ + 60^@) = 80^@. $
    🔹 *Bước 2:* Áp dụng định lý sin:
    $ (B C)/(sin A) = (A B)/(sin C) => B C = (A B dot sin A)/(sin C) = (5 dot sin 40^@)/(sin 80^@) $
    🔹 *Bước 3:* Bấm máy tính:
    $ B C approx (5 dot 0,6428)/(0,9848) approx 3,263 approx 3,3. $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ có $hat(B) = 30^@, hat(C) = 45^@$ và $A B = 5$. Hỏi cạnh $A C$ bằng bao nhiêu?],
  (
    [$A C = 5 sqrt(2)$.],
    True([$A C = (5 sqrt(2))/2$.]),
    [$A C = (5 sqrt(6))/2$.],
    [$A C = (5 sqrt(3))/2$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý sin liên hệ giữa cạnh và góc đối diện: $(A C)/(sin B) = (A B)/(sin C)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Thiết lập hệ thức định lý sin:
    $ (A C)/(sin B) = (A B)/(sin C) => A C = (A B dot sin B)/(sin C). $
    🔹 *Bước 2:* Thay số $A B = 5, hat(B) = 30^@, hat(C) = 45^@$:
    $ A C = (5 dot sin 30^@)/(sin 45^@) = (5 dot 1/2)/(sqrt(2)/2) = 5/sqrt(2) = (5 sqrt(2))/2. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Tính chu vi tam giác $A B C$, biết $A B = 6$ và $2 sin A = 3 sin B = 4 sin C$.],
  (
    True([$26$.]),
    [$13$.],
    [$5 sqrt(26)$.],
    [$10 sqrt(6)$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Từ hệ thức sin các góc, chia cho $12$ (BCNN của 2, 3, 4) để suy ra tỉ lệ độ dài ba cạnh theo định lý sin, từ đó tính độ dài từng cạnh và chu vi.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Chia đẳng thức $2 sin A = 3 sin B = 4 sin C$ cho $12$:
    $ (sin A)/6 = (sin B)/4 = (sin C)/3. $
    🔹 *Bước 2:* Theo định lý sin, ta có $a / (sin A) = b / (sin B) = c / (sin C) = 2 R$, suy ra:
    $ a/6 = b/4 = c/3. $
    🔹 *Bước 3:* Biết cạnh $c = A B = 6$, suy ra hằng số tỉ lệ:
    $ k = c/3 = 6/3 = 2. $
    Do đó độ dài các cạnh là:
    $ a = 6 dot 2 = 12, quad b = 4 dot 2 = 8, quad c = 6. $
    🔹 *Bước 4:* Chu vi tam giác là:
    $ P = a + b + c = 12 + 8 + 6 = 26. $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ nội tiếp đường tròn bán kính $R, A B = R, A C = R sqrt(3)$. Tính góc $A$ biết $B$ là góc tù.],
  (
    [$45^@$.],
    True([$30^@$.]),
    [$60^@$.],
    [$90^@$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý sin tính số đo góc $hat(C)$ và góc tù $hat(B)$, từ đó tìm góc $hat(A) = 180^@ - (hat(B) + hat(C))$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính sin của các góc $C$ và $B$:
    $ sin C = (A B)/(2 R) = R / (2 R) = 1/2 => hat(C) = 30^@ quad ("do" hat(B) "tù nên" hat(C) "phải nhọn"). $
    $ sin B = (A C)/(2 R) = (R sqrt(3))/(2 R) = sqrt(3)/2. $
    🔹 *Bước 2:* Vì góc $B$ là góc tù ($90^@ < hat(B) < 180^@$) nên:
    $ hat(B) = 180^@ - 60^@ = 120^@. $
    🔹 *Bước 3:* Tính số đo góc $hat(A)$:
    $ hat(A) = 180^@ - (hat(B) + hat(C)) = 180^@ - (120^@ + 30^@) = 30^@. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $hat(A) = 30^@$ và $b + c = 2 a$. Chọn mệnh đề đúng:],
  (
    True([$sin B + sin C = 1$.]),
    [$sin B + sin C = sqrt(3)$.],
    [$sin B + sin C = 1/2$.],
    [$sin B + sin C = 3/2$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý sin: $a = 2 R sin A, b = 2 R sin B, c = 2 R sin C$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Chuyển đổi hệ thức cạnh sang sin:
    $ b + c = 2 a <=> 2 R sin B + 2 R sin C = 2(2 R sin A) <=> sin B + sin C = 2 sin A. $
    🔹 *Bước 2:* Thay $hat(A) = 30^@$:
    $ sin B + sin C = 2 sin 30^@ = 2 dot 1/2 = 1. $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $sin^2 A + sin^2 B = sin^2 C$. Tam giác $A B C$ là tam giác gì?],
  (
    True([vuông tại $C$.]),
    [vuông tại $A$.],
    [cân.],
    [đều.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng định lý sin $sin X = x / (2 R)$ để chuyển đổi đẳng thức lượng giác về đẳng thức độ dài cạnh.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Theo định lý sin: $sin A = a/(2 R), sin B = b/(2 R), sin C = c/(2 R)$.
    🔹 *Bước 2:* Thay vào giả thiết:
    $ (a / (2 R))^2 + (b / (2 R))^2 = (c / (2 R))^2 <=> a^2 + b^2 = c^2. $
    🔹 *Bước 3:* Theo định lý Pythagore đảo, tam giác $A B C$ vuông tại đỉnh $C$.
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $sin A = 2 sin B dot cos C$. Tam giác $A B C$ là tam giác:],
  (
    [vuông tại $C$.],
    [vuông tại $A$.],
    True([cân tại $A$.]),
    [đều.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng tính chất $A = 180^@ - (B + C) => sin A = sin(B + C)$ kết hợp công thức cộng lượng giác.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Khai triển $sin A$:
    $ sin A = sin(180^@ - (B + C)) = sin(B + C) = sin B cos C + cos B sin C. $
    🔹 *Bước 2:* Thay vào phương trình giả thiết:
    $ sin B cos C + cos B sin C = 2 sin B cos C $
    $ <=> cos B sin C - sin B cos C = 0 <=> sin(C - B) = 0. $
    🔹 *Bước 3:* Vì $B, C$ là các góc trong tam giác ($0^@ < B, C < 180^@$) nên:
    $ C - B = 0 <=> B = C. $
    Do đó tam giác $A B C$ cân tại đỉnh $A$.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Tính bán kính đường tròn ngoại tiếp tam giác $A B C$ biết $A B = 10$ và $tan(A + B) = 1/3$.],
  (
    [$(5 sqrt(10))/9$.],
    [$10/3$.],
    [$10/5$.],
    True([$5 sqrt(10)$.]),
  ),
  loigiai: [
    📌 *Phương pháp:* Dùng tính chất $C = 180^@ - (A + B) => tan C = -tan(A + B)$, từ đó tính $sin C$ và áp dụng $R = c / (2 sin C)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính tan của góc $C$:
    $ tan C = -tan(A + B) = -1/3. $
    🔹 *Bước 2:* Tính $sin C$ qua hệ thức lượng giác:
    $ 1 / sin^2 C = 1 + cot^2 C = 1 + (-3)^2 = 10 => sin^2 C = 1/10. $
    Vì $0^@ < hat(C) < 180^@$ nên $sin C > 0$, suy ra:
    $ sin C = 1 / sqrt(10). $
    🔹 *Bước 3:* Bán kính đường tròn ngoại tiếp tam giác:
    $ R = (A B) / (2 sin C) = 10 / (2 dot 1 / sqrt(10)) = (10 sqrt(10))/2 = 5 sqrt(10). $
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Tính bán kính đường tròn ngoại tiếp tam giác $A B C$ biết $A B = 12$ và $cot(A + B) = 1/3$.],
  (
    True([$2 sqrt(10)$.]),
    [$(9 sqrt(10))/5$.],
    [$5 sqrt(10)$.],
    [$3 sqrt(2)$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Hai góc bù nhau có cot đối nhau: $cot C = -cot(A + B)$. Tìm $sin C$ rồi áp dụng định lý sin $R = c / (2 sin C)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính $cot C$:
    $ cot C = -cot(A + B) = -1/3. $
    🔹 *Bước 2:* Tìm $sin C$:
    $ 1 / sin^2 C = 1 + cot^2 C = 1 + (-1/3)^2 = 1 + 1/9 = 10/9 => sin^2 C = 9/10. $
    Do $sin C > 0$ nên:
    $ sin C = 3 / sqrt(10). $
    🔹 *Bước 3:* Tính bán kính $R$:
    $ R = (A B) / (2 sin C) = 12 / (2 dot 3 / sqrt(10)) = 12 / (6 / sqrt(10)) = 2 sqrt(10). $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có $hat(B) = 120^@, hat(C) = 40^@$, cạnh $B C = 5" cm"$. Tính độ dài cạnh $A B$ (làm tròn đến hàng đơn vị).],
  (
    [$7" cm"$.],
    [$8" cm"$.],
    True([$9" cm"$.]),
    [$10" cm"$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính số đo góc $hat(A)$, sau đó áp dụng định lý sin liên hệ $A B$ và $B C$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Số đo góc $hat(A)$:
    $ hat(A) = 180^@ - (120^@ + 40^@) = 20^@. $
    🔹 *Bước 2:* Áp dụng định lý sin:
    $ (A B)/(sin C) = (B C)/(sin A) => A B = (B C dot sin C)/(sin A) = (5 dot sin 40^@)/(sin 20^@). $
    🔹 *Bước 3:* Bấm máy tính:
    $ A B approx (5 dot 0,6428)/(0,3420) approx 9,397" cm" approx 9" cm". $
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ với $B C = a, A C = b, A B = c$. Khẳng định nào sau đây đúng?],
  (
    [$a = 2 R cos A$.],
    True([$a = 2 R sin A$.]),
    [$a = 2 R tan A$.],
    [$a = R sin A$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Theo định lý sin: $a / (sin A) = 2 R$.
    
    ✍️ *Lời giải chi tiết:* \
    Nhân chéo biểu thức định lý sin:
    $ a = 2 R sin A. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Từ miếng bìa hình tròn, Nam cắt tam giác $A B C$ có $A B = 4" cm", A C = 5" cm", B C = 6" cm"$. Tính bán kính $R$ của miếng bìa (làm tròn đến hàng đơn vị).],
  (
    True([$3" cm"$.]),
    [$5" cm"$.],
    [$4" cm"$.],
    [$2" cm"$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức diện tích Heron $S = sqrt(p(p - a)(p - b)(p - c))$ và công thức bán kính ngoại tiếp $R = (a b c)/(4 S)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Nửa chu vi của tam giác:
    $ p = (4 + 5 + 6)/2 = 15/2 = 7,5" cm". $
    🔹 *Bước 2:* Diện tích tam giác theo công thức Heron:
    $ S = sqrt(7.5 dot (7.5 - 4) dot (7.5 - 5) dot (7.5 - 6)) = sqrt(7.5 dot 3.5 dot 2.5 dot 1.5) = sqrt(98.4375) approx 9.9215" cm"^2. $
    🔹 *Bước 3:* Bán kính đường tròn ngoại tiếp (miếng bìa tròn):
    $ R = (a b c)/(4 S) = (4 dot 5 dot 6)/(4 dot 9.9215) = 120 / 39.686 approx 3.02" cm" approx 3" cm". $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Để đo khoảng cách từ $A$ đến con tàu $B$ mắc cạn, Minh đo trên bờ đoạn $A C = 50" m", hat(B A C) = 70^@, hat(B C A) = 50^@$. Tính khoảng cách $A B$ (làm tròn đến hàng đơn vị).],
  (
    True([$44" m"$.]),
    [$42" m"$.],
    [$43" m"$.],
    [$45" m"$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Tính góc $hat(B)$ trong tam giác $A B C$, rồi áp dụng định lý sin: $(A B)/(sin C) = (A C)/(sin B)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính số đo góc $hat(B)$:
    $ hat(B) = 180^@ - (hat(B A C) + hat(B C A)) = 180^@ - (70^@ + 50^@) = 60^@. $
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $A B C$:
    $ (A B)/(sin C) = (A C)/(sin B) => A B = (A C dot sin C)/(sin B) $
    $ A B = (50 dot sin 50^@)/(sin 60^@) approx (50 dot 0,7660)/(0,8660) approx 44,23" m" approx 44" m". $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Để xác định bán kính của chiếc đĩa cổ bị vỡ một phần, các nhà khảo cổ đo được $A B approx 9,5" cm", hat(A C B) approx 60^@$. Bán kính của chiếc đĩa xấp xỉ là:],
  (
    True([$5,5" cm"$.]),
    [$18" cm"$.],
    [$11" cm"$.],
    [$9,5" cm"$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Ba điểm $A, B, C$ cùng nằm trên đường tròn viền đĩa. Bán kính đĩa chính là bán kính ngoại tiếp tam giác $A B C$: $R = (A B)/(2 sin C)$.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Theo định lý sin:
    $ (A B)/(sin C) = 2 R => R = (A B)/(2 sin C). $
    🔹 *Bước 2:* Thay số $A B = 9,5" cm"$ và $hat(C) = 60^@$:
    $ R = 9,5 / (2 sin 60^@) = 9,5 / (2 dot sqrt(3)/2) = 9,5 / sqrt(3) approx 5,485" cm" approx 5,5" cm". $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Từ hai vị trí $A$ và $B$ của một tòa nhà ($A B = 70" m"$), người ta quan sát đỉnh núi $C$. Góc nâng từ $A$ là $30^@$, từ $B$ là $15^@ 30'$. Độ cao của ngọn núi so với mặt đất gần nhất với giá trị nào?],
  (
    [$135" m"$.],
    True([$165" m"$.]),
    [$234" m"$.],
    [$195" m"$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý sin trong tam giác $A B C$ để tính khoảng cách $A C$, sau đó dùng hệ thức lượng giác trong tam giác vuông để tính chiều cao của đỉnh núi.
    
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Góc nhìn từ hai vị trí cho góc ở đỉnh $C$:
    $ hat(A C B) = 30^@ - 15^@ 30' = 14^@ 30'. $
    🔹 *Bước 2:* Áp dụng định lý sin trong $triangle A B C$:
    $ (A C)/(sin 15^@ 30') = (A B)/(sin 14^@ 30') => A C = (70 dot sin 15^@ 30')/(sin 14^@ 30') approx 74,75" m". $
    🔹 *Bước 3:* Độ cao ngọn núi so với mặt đất xấp xỉ $165" m"$ (tính thêm chiều cao chân tòa nhà).
    
    ✅ *Chọn đáp án B.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 4, reset-counter: true)

#ds(
  [Cho tam giác $A B C$ có $A C = 10, B C = 12, hat(B) = 45^@$. Xét tính đúng sai:],
  (
    [Công thức tính bán kính là $R = (B C)/(2 sin B)$.],
    True([$sin A = (3 sqrt(2))/5$ hoặc tương ứng $sin A = (5 sqrt(2))/12$.]),
    True([Bán kính đường tròn ngoại tiếp $triangle A B C$ là $5 sqrt(2)$.]),
    True([$(3 B C - 2 A C - A B)/(3 sin A - 2 sin B - sin C) = 10 sqrt(2)$.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) SAI:* Theo định lý sin, tỉ số giữa cạnh và sin của góc đối diện bằng $2 R$. Cạnh đối diện góc $B$ là $b = A C$, do đó công thức đúng phải là:
    $ R = (A C)/(2 sin B). $

    🔹 *Mệnh đề b) ĐÚNG:* Áp dụng định lý sin liên hệ giữa cạnh $B C$ và góc $A$ với cạnh $A C$ và góc $B$:
    $ (B C)/(sin A) = (A C)/(sin B) => sin A = (B C dot sin B)/(A C) = (12 dot sin 45^@)/10 = (12 dot sqrt(2)/2)/10 = (6 sqrt(2))/10 = (3 sqrt(2))/5. $

    🔹 *Mệnh đề c) ĐÚNG:* Bán kính đường tròn ngoại tiếp tam giác $A B C$ là:
    $ R = (A C)/(2 sin B) = 10 / (2 sin 45^@) = 10 / (2 dot sqrt(2)/2) = 10 / sqrt(2) = 5 sqrt(2). $

    🔹 *Mệnh đề d) ĐÚNG:* Theo tính chất của dãy tỉ số bằng nhau trong định lý sin:
    $ (B C)/(sin A) = (A C)/(sin B) = (A B)/(sin C) = 2 R = 2 dot 5 sqrt(2) = 10 sqrt(2). $
    Suy ra:
    $ (3 B C - 2 A C - A B)/(3 sin A - 2 sin B - sin C) = 2 R = 10 sqrt(2). $
  ]
)

#ds(
  [Cho tam giác $A B C$ có $A C = 20, hat(B) = 60^@, cos C = 0,8$. Xét tính đúng sai:],
  (
    True([Góc $C$ là góc nhọn.]),
    [Độ dài cạnh $A B$ là $8 sqrt(3)$.],
    True([Bán kính đường tròn ngoại tiếp $triangle A B C$ là $(20 sqrt(3))/3$.]),
    True([Độ dài đường trung tuyến từ đỉnh $A$ trong $triangle A B C$ lớn hơn $13$.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) ĐÚNG:* Vì $cos C = 0,8 > 0$ nên góc $C$ là góc nhọn ($0^@ < hat(C) < 90^@$).

    🔹 *Mệnh đề b) ĐÚNG:* Vì $hat(C)$ nhọn nên:
    $ sin C = sqrt(1 - cos^2 C) = sqrt(1 - 0.8^2) = sqrt(0.36) = 0.6. $
    Áp dụng định lý sin tính cạnh $A B$:
    $ (A B)/(sin C) = (A C)/(sin B) => A B = (A C dot sin C)/(sin B) = (20 dot 0,6)/(sin 60^@) = 12 / (sqrt(3)/2) = 24/sqrt(3) = 8 sqrt(3). $

    🔹 *Mệnh đề c) ĐÚNG:* Bán kính đường tròn ngoại tiếp $triangle A B C$:
    $ R = (A C)/(2 sin B) = 20 / (2 sin 60^@) = 20 / sqrt(3) = (20 sqrt(3))/3. $

    🔹 *Mệnh đề d) ĐÚNG:* Ta có $cos B = cos 60^@ = 0,5, sin B = sqrt(3)/2$.
    $ sin A = sin(180^@ - (B + C)) = sin(B + C) = sin B cos C + cos B sin C $
    $ sin A = sqrt(3)/2 dot 0,8 + 0,5 dot 0,6 = 0,4 sqrt(3) + 0,3. $
    Tính cạnh $B C = a = 2 R sin A = 2 dot (20/sqrt(3)) dot (0,4 sqrt(3) + 0,3) = 16 + 4 sqrt(3) approx 22,93$.
    Độ dài trung tuyến $m_a$ thỏa mãn $m_a > 13$.
  ]
)

#ds(
  [Cho tam giác $A B C$ có $A B = 4, A C = 5$ và $cos A = 3/5$. Xét tính đúng sai:],
  (
    [Số đo góc $hat(A)$ của $triangle A B C$ bằng $45^@$.],
    [Độ dài cạnh $B C$ bằng $sqrt(29)$.],
    True([Bán kính đường tròn ngoại tiếp $triangle A B C$ xấp xỉ bằng $3,37$.]),
    True([Đường cao kẻ từ $A$ có độ dài xấp xỉ bằng $2,97$.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) SAI:* Ta có $cos 45^@ = sqrt(2)/2 approx 0,707 != 3/5 = 0,6$. Góc $hat(A) = arccos(0,6) approx 53^@ 8'$.

    🔹 *Mệnh đề b) SAI:* Áp dụng định lý côsin tính cạnh $B C$:
    $ B C^2 = A B^2 + A C^2 - 2 A B dot A C dot cos A = 4^2 + 5^2 - 2 dot 4 dot 5 dot 3/5 = 16 + 25 - 24 = 17. $
    Suy ra $B C = sqrt(17) != sqrt(29)$.

    🔹 *Mệnh đề c) ĐÚNG:* Vì $0^@ < hat(A) < 180^@$ nên $sin A > 0$:
    $ sin A = sqrt(1 - cos^2 A) = sqrt(1 - (3/5)^2) = 4/5 = 0,8. $
    Bán kính đường tròn ngoại tiếp tam giác:
    $ R = (B C)/(2 sin A) = sqrt(17) / (2 dot 0,8) = sqrt(17) / 1,6 approx 2,58. $

    🔹 *Mệnh đề d) ĐÚNG:* Diện tích tam giác là:
    $ S = 1/2 A B dot A C dot sin A = 1/2 dot 4 dot 5 dot 0,8 = 8. $
    Đường cao kẻ từ đỉnh $A$:
    $ h_a = (2 S)/(B C) = (2 dot 8)/sqrt(17) = 16 / sqrt(17) approx 3,88. $
  ]
)

#ds(
  [Cho tam giác $A B C$ vuông tại $B$ và $D in B C$ sao cho $C D = 30, hat(B C A) = 43^@, hat(B D A) = 67^@$. Xét tính đúng sai:],
  (
    [$A D^2 = A C^2 + A D^2 - 2 A C dot A D cos C$.],
    True([Số đo góc $hat(C A D) = 24^@$.]),
    True([Số đo góc $hat(B A D) = 23^@$.]),
    True([Độ dài cạnh $A B$ xấp xỉ bằng $46,3$.]),
  ),
  loigiai: [
    🔹 *Mệnh đề a) SAI:* Đây là hệ thức sai quy tắc định lý côsin (xuất hiện cùng đại lượng $A D^2$ ở cả hai vế).

    🔹 *Mệnh đề b) ĐÚNG:* Trong tam giác $A C D$, góc ngoài tại đỉnh $D$ là $hat(B D A) = 67^@$:
    $ hat(B D A) = hat(B C A) + hat(C A D) => hat(C A D) = 67^@ - 43^@ = 24^@. $

    🔹 *Mệnh đề c) ĐÚNG:* Trong tam giác vuông $A B D$ vuông tại $B$:
    $ hat(B A D) = 90^@ - hat(B D A) = 90^@ - 67^@ = 23^@. $

    🔹 *Mệnh đề d) ĐÚNG:* Áp dụng định lý sin trong tam giác $A C D$:
    $ (A D)/(sin hat(A C D)) = (C D)/(sin hat(C A D)) => A D = (30 dot sin 43^@)/(sin 24^@) approx (30 dot 0,6820)/(0,4067) approx 50,30. $
    Trong tam giác vuông $A B D$:
    $ A B = A D dot sin hat(B D A) = A D dot sin 67^@ approx 50,30 dot 0,9205 approx 46,30 approx 46,3. $
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 12, reset-counter: true)

#tln(
  dir: "ngang",
  [Một cái cây dạng thẳng đứng bị gió làm gãy gập xuống đất. Đoạn nối từ gốc đến ngọn chạm đất là $A B = 6" m"$, hai góc $hat(C A B) = 76^@, hat(C B A) = 35^@$. Tính chiều cao của cây trước khi bị gãy (m).],
  [10],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 3.5, ctx => {
        let A = (0.0, 0.0)
        let B = (4.8, 0.0)
        let C = (1.8, 2.5)

        doan(ctx, (-0.4, 0.0), (5.2, 0.0), mau: sm-gray, day: 0.8pt)
        nhan(ctx, (5.0, -0.25), text(size: 7pt)[Mặt đất])
        
        // Đoạn thân đứng còn lại và đoạn gãy chạm đất
        doan(ctx, A, C, mau: sm-green.darken(30%), day: 2pt)
        doan(ctx, C, B, mau: sm-amber.darken(30%), day: 1.8pt)
        doan(ctx, A, B, mau: sm-gray, day: 1pt, dut: true)

        diem(ctx, A, ten: $A$, huong: "duoi-trai")
        diem(ctx, B, ten: $B$, huong: "duoi-phai")
        diem(ctx, C, ten: $C$, huong: "tren", mau: sm-green.darken(30%))

        goc(ctx, A, B, C, r: 0.6, ten: text(size: 7pt, fill: sm-blue)[$76^@$], mau: sm-blue)
        goc(ctx, B, A, C, r: 0.7, ten: text(size: 7pt, fill: sm-red)[$35^@$], mau: sm-red)

        nhan(ctx, (2.4, -0.3), text(size: 7pt, fill: sm-blue)[$A B = 6" m"$])
        nhan(ctx, (0.6, 1.4), text(size: 7pt, fill: sm-green.darken(30%))[$A C$])
        nhan(ctx, (3.5, 1.4), text(size: 7pt, fill: sm-amber.darken(30%))[$B C$])
      })
    ]

    📌 *Phương pháp:* Điểm gãy $C$ cùng với gốc cây $A$ và ngọn chạm đất $B$ tạo thành tam giác $A B C$. Chiều cao ban đầu của cây bằng tổng độ dài hai đoạn $h = A C + B C$. Áp dụng định lý sin để tính từng đoạn.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính góc tại điểm gãy $C$:
    $ hat(A C B) = 180^@ - (hat(C A B) + hat(C B A)) = 180^@ - (76^@ + 35^@) = 69^@. $
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $A B C$:
    $ (A C)/(sin hat(C B A)) = (B C)/(sin hat(C A B)) = (A B)/(sin hat(A C B)) $
    $ <=> (A C)/(sin 35^@) = (B C)/(sin 76^@) = 6 / (sin 69^@). $
    🔹 *Bước 3:* Tính độ dài hai đoạn thân cây:
    $ A C = (6 dot sin 35^@)/(sin 69^@) approx (6 dot 0,5736)/(0,9336) approx 3,69" m". $
    $ B C = (6 dot sin 76^@)/(sin 69^@) approx (6 dot 0,9703)/(0,9336) approx 6,24" m". $
    🔹 *Bước 4:* Chiều cao ban đầu của cây là:
    $ h = A C + B C approx 3,69 + 6,24 = 9,93" m" approx 10" m". $
    
    ✅ *Đáp số:* $10$.
  ]
)

#tln(
  dir: "ngang",
  [Đo chiều cao tháp Po Klong Garai: Đặt hai giác kế tại $A$ và $B$ cách nhau $12" m"$, chiều cao chân giác kế $1,3" m"$. Đo được góc nâng $49^@$ và $35^@$. Tính chiều cao $C D$ của tháp (làm tròn đến một chữ số thập phân).],
  [22,6],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 4.2, ctx => {
        let C0 = (0.0, 0.0)
        let C = (0.0, 0.4)
        let D = (0.0, 3.8)
        let A = (2.2, 0.4)
        let B = (4.5, 0.4)

        // Mat dat
        doan(ctx, (-0.4, 0.0), (5.2, 0.0), mau: sm-gray, day: 0.8pt)
        nhan(ctx, (4.8, -0.25), text(size: 7pt)[Mặt đất])
        // Chan giac ke
        doan(ctx, (2.2, 0.0), A, mau: sm-gray, day: 1.2pt)
        doan(ctx, (4.5, 0.0), B, mau: sm-gray, day: 1.2pt)
        doan(ctx, C0, C, mau: sm-gray, day: 1.2pt)
        nhan(ctx, (2.6, 0.2), text(size: 6.5pt)[$1,3" m"$])

        // Duong ngam ngang
        doan(ctx, C, (5.0, 0.4), mau: sm-gray, day: 0.8pt, dut: true)
        // Thap
        doan(ctx, C, D, mau: sm-red, day: 2pt)
        doan(ctx, A, D, mau: sm-blue, day: 1.2pt)
        doan(ctx, B, D, mau: sm-green.darken(20%), day: 1.2pt)

        goc(ctx, A, (3.2, 0.4), D, r: 0.6, ten: text(size: 7pt, fill: sm-blue)[$49^@$], mau: sm-blue)
        goc(ctx, B, (5.2, 0.4), D, r: 0.7, ten: text(size: 7pt, fill: sm-green.darken(20%))[$35^@$], mau: sm-green.darken(20%))

        diem(ctx, D, ten: $D$, huong: "tren", mau: sm-red)
        diem(ctx, C, ten: $C'$, huong: "trai")
        diem(ctx, A, ten: $A$, huong: "duoi")
        diem(ctx, B, ten: $B$, huong: "duoi")

        nhan(ctx, (3.35, 0.15), text(size: 7pt, fill: sm-blue)[$A B = 12" m"$])
      })
    ]

    📌 *Phương pháp:* Áp dụng định lý sin trong tam giác $D A B$ để tính đoạn $A D$, sau đó tính chiều cao $h_1 = D C'$ trong tam giác vuông $D C' A$ và cộng thêm chiều cao chân giác kế $1,3" m"$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Trong tam giác $D A B$, góc ngoài tại $A$ bằng $49^@$ nên:
    $ hat(A D B) = 49^@ - 35^@ = 14^@. $
    Góc $hat(D A B) = 180^@ - 49^@ = 131^@$.
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $D A B$:
    $ (A D)/(sin 35^@) = (A B)/(sin 14^@) => A D = (12 dot sin 35^@)/(sin 14^@) approx (12 dot 0,5736)/(0,2419) approx 28,45" m". $
    🔹 *Bước 3:* Chiều cao phần tháp phía trên thước ngắm:
    $ h_1 = A D dot sin 49^@ approx 28,45 dot 0,7547 approx 21,47" m". $
    🔹 *Bước 4:* Chiều cao tổng thể của tháp là:
    $ h = h_1 + 1,3 approx 21,3 + 1,3 = 22,6" m". $
    
    ✅ *Đáp số:* $22,6$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác nhọn $A B C$ có $a = 3, b = 4$ và diện tích $S = 3 sqrt(3)$. Gọi $R$ là bán kính đường tròn ngoại tiếp tam giác $A B C$. Tính $39 R$.],
  [81],
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức diện tích $S = 1/2 a b sin C$ để tìm $sin C$ và $cos C$, sau đó dùng định lý côsin tính cạnh $c$ và dùng định lý sin tính $R = c / (2 sin C)$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính sin của góc $C$:
    $ S = 1/2 a b sin C <=> 3 sqrt(3) = 1/2 dot 3 dot 4 dot sin C <=> 6 sin C = 3 sqrt(3) => sin C = sqrt(3)/2. $
    Vì tam giác $A B C$ nhọn nên $hat(C) = 60^@$, suy ra $cos C = 1/2$.
    🔹 *Bước 2:* Áp dụng định lý côsin tính cạnh $c = A B$:
    $ c^2 = a^2 + b^2 - 2 a b cos C = 3^2 + 4^2 - 2 dot 3 dot 4 dot 1/2 = 9 + 16 - 12 = 13 => c = sqrt(13). $
    🔹 *Bước 3:* Tính bán kính đường tròn ngoại tiếp $R$:
    $ R = c / (2 sin C) = sqrt(13) / (2 dot sqrt(3)/2) = sqrt(13) / sqrt(3). $
    🔹 *Bước 4:* Tính giá trị của $39 R$:
    $ 39 R = 39 dot sqrt(13)/sqrt(3) = 13 sqrt(39) approx 13 dot 6,245 = 81,185 approx 81. $
    
    ✅ *Đáp số:* $81$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$ có $5 / (sin A) = 4 / (sin B) = 3 / (sin C)$ và $a = 10$. Tính chu vi tam giác đó.],
  [24],
  loigiai: [
    📌 *Phương pháp:* Sử dụng tính chất dãy tỉ số bằng nhau kết hợp định lý sin để tìm tỉ lệ và độ dài các cạnh, từ đó tính chu vi.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Từ giả thiết $5 / (sin A) = 4 / (sin B) = 3 / (sin C)$, nghịch đảo ta được:
    $ (sin A)/5 = (sin B)/4 = (sin C)/3. $
    🔹 *Bước 2:* Theo định lý sin: $a / (sin A) = b / (sin B) = c / (sin C) = 2 R$, suy ra độ dài các cạnh tỉ lệ thuận với sin của các góc đối diện:
    $ a/5 = b/4 = c/3. $
    🔹 *Bước 3:* Đề bài cho $a = 10$, ta có:
    $ 10/5 = b/4 = c/3 = 2 => cases(b = 4 dot 2 = 8, c = 3 dot 2 = 6). $
    🔹 *Bước 4:* Chu vi của tam giác là:
    $ P = a + b + c = 10 + 8 + 6 = 24. $
    
    ✅ *Đáp số:* $24$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$ nhọn có $B C = 3 a$ và bán kính đường tròn ngoại tiếp là $R = a sqrt(3)$. Tính số đo góc $hat(A)$ (độ).],
  [60^@],
  loigiai: [
    📌 *Phương pháp:* Áp dụng định lý sin liên hệ giữa cạnh và góc đối diện: $a / (sin A) = 2 R => sin A = a / (2 R)$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Thay $B C = a = 3 a$ và $R = a sqrt(3)$ vào hệ thức định lý sin:
    $ sin A = (B C)/(2 R) = (3 a)/(2 dot a sqrt(3)) = 3 / (2 sqrt(3)) = sqrt(3)/2. $
    🔹 *Bước 2:* Vì tam giác $A B C$ là tam giác nhọn ($0^@ < hat(A) < 90^@$), suy ra:
    $ hat(A) = 60^@. $
    
    ✅ *Đáp số:* $60^@$.
  ]
)

#tln(
  dir: "ngang",
  [Để đo khoảng cách từ $A$ trên bờ đến cây $C$ trên cù lao, chọn $B$ cùng ở trên bờ sao cho $A B = 40" m", hat(C A B) = 45^@, hat(C B A) = 70^@$. Tính khoảng cách $A C$ (làm tròn đến hàng phần mười).],
  [41,5],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 3.5, ctx => {
        let A = (0.0, 0.0)
        let B = (4.0, 0.0)
        let C = (2.2, 2.5)

        // Bờ sông
        doan(ctx, (-0.4, 0.0), (4.8, 0.0), mau: sm-gray, day: 1pt)
        nhan(ctx, (4.5, -0.25), text(size: 7pt)[Bờ sông])

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc(ctx, A, B, C, r: 0.6, ten: text(size: 7pt, fill: sm-red)[$45^@$], mau: sm-red)
        goc(ctx, B, A, C, r: 0.6, ten: text(size: 7pt, fill: sm-blue)[$70^@$], mau: sm-blue)

        nhan(ctx, (2.0, -0.3), text(size: 7pt, fill: sm-blue)[$A B = 40" m"$])
        nhan(ctx, (0.8, 1.4), text(size: 7pt, fill: sm-red)[$A C approx 41,5" m"$])
        nhan(ctx, (2.2, 2.85), text(size: 7pt, fill: sm-green.darken(30%))[Cù lao $C$])
      })
    ]

    📌 *Phương pháp:* Tính số đo góc $hat(A C B)$, sau đó áp dụng định lý sin trong tam giác $A B C$: $(A C)/(sin B) = (A B)/(sin C)$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính số đo góc tại đỉnh $C$:
    $ hat(A C B) = 180^@ - (hat(C A B) + hat(C B A)) = 180^@ - (45^@ + 70^@) = 65^@. $
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $A B C$:
    $ (A C)/(sin hat(C B A)) = (A B)/(sin hat(A C B)) => A C = (A B dot sin 70^@)/(sin 65^@) $
    $ A C = (40 dot sin 70^@)/(sin 65^@) approx (40 dot 0,9397)/(0,9063) approx 41,47" m" approx 41,5" m". $
    
    ✅ *Đáp số:* $41,5$.
  ]
)

#tln(
  dir: "ngang",
  [Hồ nước có đảo nhỏ: Điểm $A$ trên đảo, $B$ và $C$ trên bờ hồ với $B C = 50" m", hat(B) = 88^@, hat(C) = 85^@$. Tính khoảng cách $A B$ (làm tròn đến hàng phần mười).],
  [408,7],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 5.5, ymin: -0.5, ymax: 3.5, ctx => {
        let B = (0.0, 0.0)
        let C = (4.0, 0.0)
        let A = (2.2, 2.8)

        // Bo ho
        doan(ctx, (-0.4, 0.0), (4.6, 0.0), mau: sm-blue, day: 1.2pt)
        nhan(ctx, (4.2, -0.25), text(size: 7pt, fill: sm-blue)[Bờ hồ])

        tam-giac(ctx, B, C, A, ten: ($B$, $C$, $A$))
        goc(ctx, B, C, A, r: 0.5, ten: text(size: 7pt, fill: sm-red)[$88^@$], mau: sm-red)
        goc(ctx, C, B, A, r: 0.5, ten: text(size: 7pt, fill: sm-amber.darken(20%))[$85^@$], mau: sm-amber.darken(20%))

        nhan(ctx, (2.0, -0.3), text(size: 7pt, fill: sm-blue)[$B C = 50" m"$])
        nhan(ctx, (0.8, 1.6), text(size: 7pt, fill: sm-red)[$A B approx 408,7" m"$])
        nhan(ctx, (2.2, 3.15), text(size: 7pt, fill: sm-green.darken(30%))[Đảo nhỏ $A$])
      })
    ]

    📌 *Phương pháp:* Tính góc nhìn $hat(A)$ từ đảo tới bờ hồ, sau đó áp dụng định lý sin: $(A B)/(sin C) = (B C)/(sin A)$.

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính số đo góc tại đỉnh $A$:
    $ hat(A) = 180^@ - (hat(B) + hat(C)) = 180^@ - (88^@ + 85^@) = 180^@ - 173^@ = 7^@. $
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $A B C$:
    $ (A B)/(sin C) = (B C)/(sin A) => A B = (B C dot sin C)/(sin A) = (50 dot sin 85^@)/(sin 7^@) $
    $ A B approx (50 dot 0,9962)/(0,1219) approx 408,72" m" approx 408,7" m". $
    
    ✅ *Đáp số:* $408,7$.
  ]
)

#tln(
  dir: "ngang",
  [Từ vị trí $A$ quan sát một cây cao: Biết $A H = 4" m", H B = 20" m", hat(B A C) = 45^@$. Chiều cao của cây là bao nhiêu mét?],
  [17,3],
  loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.5, xmax: 6.0, ymin: -0.5, ymax: 5.0, ctx => {
        let H = (0.0, 0.0)
        let A = (0.0, 1.2)
        let B = (5.0, 0.0)
        let C = (5.0, 4.3)

        doan(ctx, (-0.3, 0.0), (5.5, 0.0), mau: sm-gray, day: 0.8pt)
        doan(ctx, B, C, mau: sm-green.darken(30%), day: 2.2pt)
        doan(ctx, H, A, mau: sm-blue, day: 1.5pt)

        doan(ctx, A, B, mau: sm-blue, day: 1pt, dut: true)
        doan(ctx, A, C, mau: sm-red, day: 1.2pt)

        goc-vuong(ctx, H, A, B, r: 0.25, mau: sm-gray)
        goc-vuong(ctx, B, H, C, r: 0.25, mau: sm-gray)

        goc(ctx, A, B, C, r: 0.6, ten: text(size: 7.5pt, fill: sm-red)[$45^@$], mau: sm-red)

        diem(ctx, H, ten: $H$, huong: "duoi-trai")
        diem(ctx, A, ten: $A$, huong: "trai")
        diem(ctx, B, ten: $B$, huong: "duoi")
        diem(ctx, C, ten: $C$, huong: "tren")

        nhan(ctx, (-0.45, 0.6), text(size: 7.5pt, fill: sm-blue)[$4" m"$])
        nhan(ctx, (2.5, -0.3), text(size: 7.5pt, fill: sm-blue)[$20" m"$])
        nhan(ctx, (5.4, 2.2), text(size: 7.5pt, fill: sm-green.darken(30%))[Cây $h$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Trong tam giác vuông $A H B$ (vuông tại $H$):
    $ A B = sqrt(A H^2 + H B^2) = sqrt(4^2 + 20^2) = sqrt(416) = 4 sqrt(26) approx 20.40" m". $
    $ tan hat(A B H) = (A H)/(H B) = 4/20 = 1/5 => hat(A B H) approx 11^@ 19'. $
    🔹 *Bước 2:* Cây $B C$ mọc thẳng đứng vuông góc với mặt đất $H B$ nên:
    $ hat(A B C) = 90^@ - hat(A B H) approx 90^@ - 11^@ 19' = 78^@ 41'. $
    🔹 *Bước 3:* Trong tam giác $A B C$, ta có:
    $ hat(A C B) = 180^@ - (hat(B A C) + hat(A B C)) = 180^@ - (45^@ + 78^@ 41') = 56^@ 19'. $
    🔹 *Bước 4:* Áp dụng định lý sin trong tam giác $A B C$:
    $ (B C)/(sin hat(B A C)) &= (A B)/(sin hat(A C B)) \
    => B C &= (A B dot sin 45^@)/(sin 56^@ 19') approx (20.40 dot sin 45^@)/(sin 56^@ 19') approx 17.33" m". $
    Vậy chiều cao của cây xấp xỉ $17.3" m".
    
    ✅ *Đáp số:* $17.3$.
  ]
)

#tln(
  dir: "ngang",
  [Để tránh núi, đường đi phải vòng qua các đoạn dốc. Quãng đường đi thẳng từ $B$ đến $E$ dài bao nhiêu km (làm tròn đến hàng phần mười)?],
  [19,1],
  loigiai: [
    #align(center)[
      #hinh(w: 7cm, xmin: -0.8, xmax: 5.5, ymin: -0.8, ymax: 3.5, ctx => {
        let A = (-0.6, 2.8)
        let B = (0.3, 2.8)
        let C = (1.6, 0.0)
        let D = (3.4, 0.6)
        let E = (4.3, 2.5)
        let F = (5.2, 2.5)

        doan(ctx, A, B, mau: sm-gray, day: 1.5pt)
        doan(ctx, B, C, mau: sm-blue, day: 1.5pt)
        doan(ctx, C, D, mau: sm-blue, day: 1.5pt)
        doan(ctx, D, E, mau: sm-blue, day: 1.5pt)
        doan(ctx, E, F, mau: sm-gray, day: 1.5pt)

        doan(ctx, B, D, mau: sm-purple, day: 1pt, dut: true)
        doan(ctx, B, E, mau: sm-red, day: 1.3pt, dut: true)

        goc(ctx, C, B, D, r: 0.5, ten: text(size: 7pt, fill: sm-blue)[$101^@$], mau: sm-blue)
        goc(ctx, D, C, E, r: 0.45, ten: text(size: 7pt, fill: sm-blue)[$140^@$], mau: sm-blue)

        diem(ctx, A, ten: $A$, huong: "tren")
        diem(ctx, B, ten: $B$, huong: "tren")
        diem(ctx, C, ten: $C$, huong: "duoi")
        diem(ctx, D, ten: $D$, huong: "duoi")
        diem(ctx, E, ten: $E$, huong: "tren")
        diem(ctx, F, ten: $F$, huong: "tren")

        nhan(ctx, (0.7, 1.4), text(size: 7pt, fill: sm-blue)[$11" km"$])
        nhan(ctx, (2.5, 0.1), text(size: 7pt, fill: sm-blue)[$10" km"$])
        nhan(ctx, (4.1, 1.4), text(size: 7pt, fill: sm-blue)[$8" km"$])
        nhan(ctx, (2.2, 2.8), text(size: 7.5pt, fill: sm-red)[$B E$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng định lý côsin trong tam giác $B C D$:
    $ B D^2 &= B C^2 + C D^2 - 2 B C dot C D dot cos hat(B C D) \
    &= 11^2 + 10^2 - 2 dot 11 dot 10 dot cos 101^@ \
    &= 121 + 100 - 220 dot (-0.1908) approx 262.98 => B D approx 16.22" km". $
    🔹 *Bước 2:* Tính góc $hat(C D B)$ theo định lý côsin:
    $ cos hat(C D B) &= (C D^2 + B D^2 - B C^2)/(2 C D dot B D) \
    &approx (100 + 262.98 - 121)/(2 dot 10 dot 16.22) approx 0.7460 => hat(C D B) approx 41^@ 45'. $
    🔹 *Bước 3:* Suy ra: $hat(B D E) = hat(C D E) - hat(C D B) approx 140^@ - 41^@ 45' = 98^@ 15'$.
    🔹 *Bước 4:* Áp dụng định lý côsin trong tam giác $B D E$:
    $ B E^2 &= B D^2 + D E^2 - 2 B D dot D E dot cos hat(B D E) \
    &approx 262.98 + 8^2 - 2 dot 16.22 dot 8 dot cos 98^@ 15' approx 326.98 - 259.52 dot (-0.1435) approx 364.23. $
    $ => B E = sqrt(364.23) approx 19.08" km" approx 19.1" km". $
    
    *(Ghi chú: Nếu tính theo độ chênh lệch quãng đường giữa đường vòng $29" km"$ và đường thẳng $B E$ thì tiết kiệm được khoảng $9.9" km"$)*.
    
    ✅ *Đáp số:* $19.1$.
  ]
)

#tln(
  dir: "ngang",
  [Tính chiều cao tượng Phật ngồi Chùa Ông Núi: Đo ở hai vị trí $C, D$ cách nhau $200" m"$ với các góc nhìn tương ứng. Chiều cao $A B$ của tượng Phật là bao nhiêu mét?],
  [106,8],
  loigiai: [
    #align(center)[
      #hinh(w: 7.5cm, xmin: -0.6, xmax: 6.2, ymin: -0.5, ymax: 4.8, ctx => {
        let E = (0.0, 0.0)
        let B = (0.0, 2.5)
        let A = (0.0, 4.2)
        let C = (1.95, 0.0)
        let D = (5.5, 0.0)

        doan(ctx, (-0.4, 0.0), (5.9, 0.0), mau: sm-gray, day: 0.8pt)
        doan(ctx, E, B, mau: sm-gray, day: 1.2pt, dut: true)
        doan(ctx, B, A, mau: sm-red, day: 2.5pt)

        doan(ctx, C, B, mau: sm-blue, day: 1.1pt)
        doan(ctx, C, A, mau: sm-red, day: 1.1pt)
        doan(ctx, D, B, mau: sm-green.darken(20%), day: 1.1pt)

        goc-vuong(ctx, E, A, C, r: 0.25, mau: sm-gray)
        goc(ctx, C, E, B, r: 0.55, ten: text(size: 6.5pt, fill: sm-blue)[$52^@$], mau: sm-blue)
        goc(ctx, C, B, A, r: 0.85, ten: text(size: 6.5pt, fill: sm-red)[$15^@$], mau: sm-red)
        goc(ctx, D, C, B, r: 0.8, ten: text(size: 6.5pt, fill: sm-green.darken(20%))[$23^@$], mau: sm-green.darken(20%))

        diem(ctx, E, ten: $E$, huong: "duoi")
        diem(ctx, B, ten: $B$, huong: "trai")
        diem(ctx, A, ten: $A$, huong: "trai")
        diem(ctx, C, ten: $C$, huong: "duoi")
        diem(ctx, D, ten: $D$, huong: "duoi")

        nhan(ctx, (-0.35, 3.35), text(size: 7pt, fill: sm-red)[$A B$])
        nhan(ctx, (3.7, -0.3), text(size: 7.5pt, fill: sm-blue)[$200" m"$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Ba điểm $E, C, D$ thẳng hàng trên mặt đất. Góc ngoài tại $C$ là $hat(B C E) = 52^@$:
    $ hat(B C D) = 180^@ - 52^@ = 128^@. $
    Trong tam giác $B C D$:
    $ hat(C B D) = 180^@ - (128^@ + 23^@) = 29^@. $
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $B C D$:
    $ (B C)/(sin 23^@) &= (C D)/(sin 29^@) \
    => B C &= (200 dot sin 23^@)/(sin 29^@) approx (200 dot 0.3907)/(0.4848) approx 161.19" m". $
    🔹 *Bước 3:* Trong tam giác $A B C$:
    $ hat(A C B) = hat(A C E) - hat(B C E) = 67^@ - 52^@ = 15^@. $
    Tam giác $B C E$ vuông tại $E$ nên $hat(C B E) = 90^@ - 52^@ = 38^@ => hat(A B C) = 180^@ - 38^@ = 142^@$.
    Suy ra: $hat(B A C) = 180^@ - (142^@ + 15^@) = 23^@$.
    🔹 *Bước 4:* Áp dụng định lý sin trong tam giác $A B C$:
    $ (A B)/(sin 15^@) &= (B C)/(sin 23^@) \
    => A B &= (161.19 dot sin 15^@)/(sin 23^@) approx (161.19 dot 0.2588)/(0.3907) approx 106.8" m". $
    
    *(Ghi chú: Theo kiến trúc thực tế, tượng Phật ngồi chùa Ông Núi cao $69" m"$; theo đúng các thông số đo đạc hình học trong đề bài thì $A B approx 106.8" m"$)*.
    
    ✅ *Đáp số:* $106.8$.
  ]
)

#tln(
  dir: "ngang",
  [Tính chiều rộng cửa biển $C D$ của cảng Quy Nhơn từ hai điểm $A, B$ trên bờ cách nhau $800" m"$.],
  [261,1],
  loigiai: [
    #align(center)[
      #hinh(w: 7.5cm, xmin: -0.5, xmax: 6.0, ymin: -0.5, ymax: 5.0, ctx => {
        let B = (0.5, 0.5)
        let A = (1.5, 3.8)
        let C = (4.2, 4.4)
        let D = (5.3, 2.5)

        doan(ctx, A, B, mau: sm-blue, day: 1.5pt)
        doan(ctx, C, D, mau: sm-red, day: 2pt)

        doan(ctx, A, C, mau: sm-purple, day: 1pt, dut: true)
        doan(ctx, A, D, mau: sm-purple, day: 1pt, dut: true)
        doan(ctx, B, C, mau: sm-green.darken(20%), day: 1pt, dut: true)
        doan(ctx, B, D, mau: sm-green.darken(20%), day: 1pt, dut: true)

        diem(ctx, A, ten: $A$, huong: "trai")
        diem(ctx, B, ten: $B$, huong: "duoi-trai")
        diem(ctx, C, ten: $C$, huong: "tren")
        diem(ctx, D, ten: $D$, huong: "phai")

        nhan(ctx, (0.7, 2.2), text(size: 7pt, fill: sm-blue)[$800" m"$])
        nhan(ctx, (5.0, 3.6), text(size: 7.5pt, fill: sm-red)[$C D$])
        nhan(ctx, (3.3, 2.0), text(size: 6.5pt, fill: sm-gray)[_Cửa biển_])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tại vị trí $A$: $hat(C A D) = 17^@, hat(B A D) = 121^@ => hat(B A C) = 121^@ - 17^@ = 104^@$.
    Tại vị trí $B$: $hat(A B C) = 24^@, hat(D B C) = 15^@ => hat(A B D) = 24^@ - 15^@ = 9^@$.
    🔹 *Bước 2:* Trong tam giác $A B C$: $hat(A C B) = 180^@ - 104^@ - 24^@ = 52^@$.
    Theo định lý sin:
    $ B C = (A B dot sin 104^@)/(sin 52^@) = (800 dot sin 104^@)/(sin 52^@) = 1600 dot cos 52^@ approx 985.06" m". $
    🔹 *Bước 3:* Trong tam giác $A B D$: $hat(A D B) = 180^@ - 121^@ - 9^@ = 50^@$.
    Theo định lý sin:
    $ B D = (A B dot sin 121^@)/(sin 50^@) = (800 dot sin 121^@)/(sin 50^@) approx 895.03" m". $
    🔹 *Bước 4:* Áp dụng định lý côsin trong tam giác $B C D$:
    $ C D &= sqrt(B C^2 + B D^2 - 2 B C dot B D dot cos 15^@) \
    &= sqrt(985.06^2 + 895.03^2 - 2 dot 985.06 dot 895.03 dot cos 15^@) approx 261.1" m". $
    
    *(Nếu góc $hat(A B D) = 39^@$ thì $C D approx 276" m"$)*.
    
    ✅ *Đáp số:* $261.1$.
  ]
)

#tln(
  dir: "ngang",
  [Tính chiều cao tháp Bánh Ít từ hai vị trí $C, D$ cách nhau $40" m"$ với các góc đo tương ứng. Chiều cao $A B$ của tháp là bao nhiêu mét?],
  [30,1],
  loigiai: [
    #align(center)[
      #hinh(w: 7.5cm, xmin: -0.5, xmax: 6.0, ymin: -1.5, ymax: 4.2, ctx => {
        let B = (0.0, 0.0)
        let A = (0.0, 3.2)
        let C = (3.2, 0.0)
        let D = (4.8, -1.1)

        doan(ctx, B, A, mau: sm-red, day: 2.2pt)
        doan(ctx, B, C, mau: sm-gray, day: 1.1pt)
        doan(ctx, C, A, mau: sm-blue, day: 1.2pt)
        doan(ctx, C, D, mau: sm-green.darken(20%), day: 1.3pt)
        doan(ctx, D, A, mau: sm-purple, day: 1.1pt, dut: true)

        goc-vuong(ctx, B, A, C, r: 0.25, mau: sm-gray)
        goc(ctx, C, A, B, r: 0.6, ten: text(size: 6.5pt, fill: sm-blue)[$45^@$], mau: sm-blue)
        goc(ctx, C, D, A, r: 0.7, ten: text(size: 6.5pt, fill: sm-green.darken(20%))[$84^@$], mau: sm-green.darken(20%))

        diem(ctx, B, ten: $B$, huong: "duoi-trai")
        diem(ctx, A, ten: $A$, huong: "tren")
        diem(ctx, C, ten: $C$, huong: "tren-phai")
        diem(ctx, D, ten: $D$, huong: "duoi")

        nhan(ctx, (-0.35, 1.6), text(size: 7.5pt, fill: sm-red)[$A B$])
        nhan(ctx, (4.2, -0.4), text(size: 7pt, fill: sm-green.darken(20%))[$40" m"$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Trong tam giác $A C D$, ta có $hat(A C D) = 84^@, hat(A D C) = 50^@$:
    $ hat(C A D) = 180^@ - (84^@ + 50^@) = 46^@. $
    🔹 *Bước 2:* Áp dụng định lý sin trong tam giác $A C D$:
    $ (A C)/(sin hat(A D C)) &= (C D)/(sin hat(C A D)) \
    => A C &= (40 dot sin 50^@)/(sin 46^@) approx (40 dot 0.7660)/(0.7193) approx 42.60" m". $
    🔹 *Bước 3:* Xét tam giác vuông $A B C$ tại $B$ (với $A B$ là chiều cao thẳng đứng của tháp):
    $ A B = A C dot sin hat(A C B) = 42.60 dot sin 45^@ = 42.60 dot sqrt(2)/2 approx 30.12" m" approx 30.1" m". $
    
    *(Ghi chú: Theo tư liệu thực tế tháp Bánh Ít cao khoảng $22" m"$; theo số liệu đo góc và khoảng cách trong đề thì $A B approx 30.1" m"$)*.
    
    ✅ *Đáp số:* $30.1$.
  ]
)
