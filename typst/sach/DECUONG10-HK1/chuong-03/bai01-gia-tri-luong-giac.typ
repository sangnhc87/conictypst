#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("GIÁ TRỊ LƯỢNG GIÁC CỦA MỘT GÓC TỪ 0° ĐẾN 180°", mau: C3)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C3)[
  - *Nửa đường tròn đơn vị*: Nửa đường tròn tâm $O$, bán kính $R = 1$ nằm phía trên trục hoành.
  - Với mỗi góc $alpha$ ($0^@ <= alpha <= 180^@$), gọi $M(x_0; y_0)$ là điểm trên nửa đường tròn đơn vị sao cho $hat(x O M) = alpha$. Khi đó:
    - $sin alpha = y_0$ (tung độ của điểm $M$).
    - $cos alpha = x_0$ (hoành độ của điểm $M$).
    - $tan alpha = y_0 / x_0 = (sin alpha)/(cos alpha)$ (với $alpha != 90^@$, tức $x_0 != 0$).
    - $cot alpha = x_0 / y_0 = (cos alpha)/(sin alpha)$ (với $alpha != 0^@, 180^@$, tức $y_0 != 0$).
  - *Tính chất hai góc bù nhau* ($alpha$ và $180^@ - alpha$):
    $ sin(180^@ - alpha) = sin alpha, quad cos(180^@ - alpha) = -cos alpha $
    $ tan(180^@ - alpha) = -tan alpha, quad cot(180^@ - alpha) = -cot alpha $
  - *Tính chất hai góc phụ nhau* ($alpha$ và $90^@ - alpha$):
    $ sin(90^@ - alpha) = cos alpha, quad cos(90^@ - alpha) = sin alpha $
    $ tan(90^@ - alpha) = cot alpha, quad cot(90^@ - alpha) = tan alpha $
  - *Các hệ thức lượng giác cơ bản*:
    $ sin^2 alpha + cos^2 alpha = 1, quad tan alpha dot cot alpha = 1 $
    $ 1 + tan^2 alpha = 1/(cos^2 alpha) space (alpha != 90^@), quad 1 + cot^2 alpha = 1/(sin^2 alpha) space (alpha != 0^@, 180^@) $
]

#dang("Tính các giá trị của biểu thức lượng giác", mau: C3)

#bai-tap-tu-luan(mau: C3)[
  #bt-item(1, [Không dùng máy tính cầm tay, tính giá trị của các biểu thức sau:
    + $(2sin 30^@ + cos 135^@ - 3tan 150^@)(cos 180^@ - cot 60^@)$.
    + $sin^2 90^@ + cos^2 120^@ + cos^2 0^@ - tan^2 60^@ + cot^2 135^@$.
    + $cos 60^@ dot sin 30^@ + cos^2 30^@$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *a)* Thay các giá trị đặc biệt: $sin 30^@ = 1/2$, $cos 135^@ = -sqrt(2)/2$, $tan 150^@ = -sqrt(3)/3$, $cos 180^@ = -1$, $cot 60^@ = sqrt(3)/3$.
    
    🔹 *b)* Thay các giá trị lượng giác:
    $ 1^2 + (-1/2)^2 + 1^2 - (sqrt(3))^2 + (-1)^2 &= 1 + 1/4 + 1 - 3 + 1 \ 
    &= 1/4. $
    
    🔹 *c)* Thay các giá trị lượng giác:
    $ (1/2)(1/2) + (sqrt(3)/2)^2 &= 1/4 + 3/4 \ 
    &= 1. $
  ])

  #bt-item(2, [Tính giá trị các biểu thức sau:
    + $A = tan 30^@ + cot 30^@$.
    + $B = sin^2 45^@ - 2sin^2 50^@ + 3cos^2 45^@ - 2sin^2 40^@ + 4tan 55^@ dot tan 35^@$.
    + $C = cos 0^@ + cos 20^@ + cos 40^@ + dots + cos 160^@ + cos 180^@$.
    + $D = tan 5^@ dot tan 10^@ dot tan 15^@ dots tan 80^@ dot tan 85^@$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *a)* Ta có: $A = sqrt(3)/3 + sqrt(3) = (4sqrt(3))/3$.
    
    🔹 *b)* Vì $sin 50^@ = cos 40^@ => sin^2 50^@ + sin^2 40^@ = 1$.
    Mặt khác $tan 55^@ dot tan 35^@ = tan 55^@ dot cot 55^@ = 1$.
    Thay vào biểu thức $B$:
    $ B = 1/2 - 2(1) + 3(1/2) + 4(1) = 2 - 2 + 4 = 4. $
    
    🔹 *c)* Ghép từng cặp góc bù nhau: $cos x + cos(180^@ - x) = 0$.
    Tổng $C$ có các góc triệt tiêu lẫn nhau, riêng $cos 90^@ = 0$.
    Do đó $C = 0$.
    
    🔹 *d)* Ghép từng cặp góc phụ nhau: $tan x dot tan(90^@ - x) = tan x dot cot x = 1$.
    Tích $D$ gồm các cặp như vậy, và dư ra $tan 45^@ = 1$.
    Do đó $D = 1$.
  ])

  #bt-item(3, [Một chiếc đu quay có bán kính 75m, tâm ở độ cao 90m. Thời gian thực hiện mỗi vòng quay là 30 phút. Nếu một người vào cabin tại vị trí thấp nhất thì sau 20 phút quay người đó ở độ cao bao nhiêu mét?], loigiai: [
    Mỗi phút đu quay quét một góc: $360^@ / 30 = 12^@$.
    
    Sau 20 phút, góc quay được là: $20 dot 12^@ = 240^@$.
    
    #align(center)[
      #hinh(w: 6.5cm, xmin: -2.8, xmax: 2.8, ymin: -2.7, ymax: 2.5, ctx => {
        let O = (0.0, 0.0)
        let R = 1.8
        let M0 = (0.0, -R)
        let alpha = 30deg
        let M = (R * calc.cos(alpha), R * calc.sin(alpha))
        let K = (0.0, R * calc.sin(alpha))
        let Dat_trai = (-2.5, -2.4)
        let Dat_phai = (2.5, -2.4)
        let H = (0.0, -2.4)

        // Mat dat
        doan(ctx, Dat_trai, Dat_phai, mau: sm-gray, day: 1.2pt)
        nhan(ctx, (1.8, -2.55), [Mặt đất], mau: sm-gray)

        // Tru do
        doan(ctx, O, H, mau: sm-gray, day: 1pt, dut: true)
        doan(ctx, (-1.2, -2.4), O, mau: sm-gray, day: 0.8pt)
        doan(ctx, (1.2, -2.4), O, mau: sm-gray, day: 0.8pt)

        // Duong tron du quay
        duong-tron(ctx, O, R, mau: sm-blue, day: 1.2pt)

        // Truc toa do nhe qua tam
        doan(ctx, (-2.1, 0.0), (2.1, 0.0), dut: true, mau: sm-gray.lighten(30%), day: 0.7pt)
        doan(ctx, (0.0, -R - 0.2), (0.0, R + 0.3), dut: true, mau: sm-gray.lighten(30%), day: 0.7pt)

        // Ban kinh toi cabin M
        doan(ctx, O, M, mau: sm-red, day: 1.2pt)
        doan(ctx, M, K, dut: true, mau: sm-red, day: 0.8pt)
        goc-vuong(ctx, K, M, (0.0, 0.0), r: 0.2, mau: sm-red)

        // Cung goc 30 do
        goc(ctx, O, (1.0, 0.0), M, r: 0.6, ten: [$30^@$], mau: sm-red)

        // Cac diem
        diem(ctx, O, ten: $O$, huong: "tren-trai")
        diem(ctx, M0, ten: $M_0$, huong: "duoi", mau: sm-blue)
        diem(ctx, M, ten: $M$, huong: "tren-phai", mau: sm-red)
        diem(ctx, H, ten: $H$, huong: "duoi", mau: sm-gray)

        // Kich thuoc chu thich
        nhan(ctx, (-0.6, -1.2), text(size: 7.5pt, fill: sm-blue)[$90" m"$])
        nhan(ctx, (1.1, 0.5), text(size: 7.5pt, fill: sm-red)[$R = 75" m"$])
        nhan(ctx, (-0.8, 0.45), text(size: 7.5pt, fill: sm-green.darken(20%))[+$37,5" m"$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Xác định vị trí ban đầu.
    Vị trí ban đầu $M_0$ ở điểm thấp nhất, tương ứng với góc $270^@$ trên đường tròn lượng giác.
    
    🔹 *Bước 2:* Xác định góc quét.
    Sau khi quay $240^@$, vị trí mới $M$ tạo với phương ngang một góc $30^@$ (nằm phía trên tâm $O$).
    
    🔹 *Bước 3:* Tính độ cao.
    Độ cao vượt trội của cabin so với tâm $O$ là:
    $ Delta h = R dot sin 30^@ = 75 dot 1/2 = 37.5" m". $
    Vậy sau $20$ phút quay, cabin ở độ cao so với mặt đất:
    $ h = 90 + Delta h = 90 + 37.5 = 127.5" m". $
  ])
]

#bai-tap-trac-nghiem(mau: C3)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 6, reset-counter: true)

#tn(
  dir: "ngang",
  [Đẳng thức nào sau đây sai?],
  (
    [$sin 45^@ + sin 45^@ = sqrt(2)$.],
    [$sin 30^@ + cos 60^@ = 1$.],
    [$sin 60^@ + cos 150^@ = 0$.],
    True([$sin 120^@ + cos 30^@ = 0$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta xét mệnh đề $D$: $sin 120^@ + cos 30^@ = sqrt(3)/2 + sqrt(3)/2 = sqrt(3) != 0$.
    Khẳng định này sai.
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Tính giá trị của biểu thức $P = sqrt(3) sin 150^@ + cos 135^@ - sin 120^@$:],
  (
    [$sqrt(2)/2$.],
    [$sqrt(2)$.],
    [$-sqrt(2)$.],
    True([$-sqrt(2)/2$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Thay các giá trị lượng giác đặc biệt:
    $ P = sqrt(3) dot (1/2) + (-sqrt(2)/2) - sqrt(3)/2 = -sqrt(2)/2. $
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Giá trị của biểu thức $A = tan 1^@ dot tan 2^@ dot tan 3^@ dots tan 88^@ dot tan 89^@$ là:],
  (
    [$0$.],
    [$2$.],
    [$3$.],
    True([$1$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ghép các cặp góc phụ nhau: $tan 1^@ dot tan 89^@ = tan 1^@ dot cot 1^@ = 1$.
    Tương tự: $tan 2^@ dot tan 88^@ = 1, dots$
    Giá trị ở giữa là $tan 45^@ = 1$.
    Do đó tích $A = 1$.
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Tính giá trị của biểu thức $P = 2/(cos^2 x) + 3 - 2 tan^2 x$ :],
  (
    [$1$.],
    [$3$.],
    True([$5$.]),
    [$2$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng hằng đẳng thức lượng giác: $1/(cos^2 x) = 1 + tan^2 x$.
    Thay vào biểu thức $P$:
    $ P &= 2(1 + tan^2 x) + 3 - 2tan^2 x \
    &= 2 + 2tan^2 x + 3 - 2tan^2 x \
    &= 5. $
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Biết rằng $sin x + cos x = 2/3$. Giá trị của biểu thức $P = sin x dot cos x$ bằng:],
  (
    True([$-5/18$.]),
    [$-5/9$.],
    [$5/18$.],
    [$5/9$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Bình phương hai vế đẳng thức đã cho:
    $ (sin x + cos x)^2 &= (2/3)^2 \
    sin^2 x + 2 sin x cos x + cos^2 x &= 4/9 \
    1 + 2 sin x cos x &= 4/9 \
    2 sin x cos x &= -5/9 \
    sin x cos x &= -5/18. $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $tan x - cot x = 2$. Giá trị của biểu thức $P = tan^2 x + cot^2 x$ bằng:],
  (
    [$0$.],
    [$4$.],
    True([$6$.]),
    [$2$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Bình phương hai vế đẳng thức đã cho:
    $ (tan x - cot x)^2 &= 2^2 \
    tan^2 x - 2 tan x cot x + cot^2 x &= 4 \
    tan^2 x - 2(1) + cot^2 x &= 4 \
    tan^2 x + cot^2 x &= 6. $
    
    ✅ *Chọn đáp án C.*
  ]
)

#dang("Cho một giá trị lượng giác. Tính các giá trị còn lại", mau: C3)

#bai-tap-tu-luan(mau: C3)[
  #bt-item(1, [Thực hiện các yêu cầu sau:
    + Cho $sin alpha = 1/3$ với $90^@ < alpha < 180^@$. Tính $cos alpha$.
    + Cho biết $cos alpha = -2/3$. Tính $tan alpha$.
    + Cho $alpha$ là góc tù và $sin alpha = 5/13$. Tính giá trị biểu thức $3sin alpha + 2cos alpha$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *a)* Do $90^@ < alpha < 180^@$ nên $cos alpha < 0$.
    Áp dụng $sin^2 alpha + cos^2 alpha = 1$:
    $ cos alpha = -sqrt(1 - sin^2 alpha) = -sqrt(1 - 1/9) = -(2sqrt(2))/3. $
    
    🔹 *b)* Do $cos alpha = -2/3 < 0$ nên $alpha$ là góc tù.
    Khi đó $sin alpha > 0$, suy ra $sin alpha = sqrt(1 - (-2/3)^2) = sqrt(5)/3$.
    Vậy $tan alpha = (sin alpha)/(cos alpha) = (sqrt(5)/3)/(-2/3) = -sqrt(5)/2$.
    
    🔹 *c)* Vì $alpha$ là góc tù nên $cos alpha < 0$.
    $ cos alpha = -sqrt(1 - (5/13)^2) = -12/13. $
    Khi đó giá trị biểu thức là:
    $ 3sin alpha + 2cos alpha = 3(5/13) + 2(-12/13) = (15 - 24)/13 = -9/13. $
  ])

  #bt-item(2, [Cho $tan alpha = 3$. Tính giá trị biểu thức:
    $ B = (sin^3 alpha - cos^3 alpha)/(sin^3 alpha + 3cos^3 alpha + 2sin alpha) $
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Chia cả tử và mẫu của biểu thức cho $cos^3 alpha != 0$ (vì $tan alpha = 3 != 0$ nên $cos alpha != 0$):
    $ B &= (tan^3 alpha - 1)/(tan^3 alpha + 3 + 2(tan alpha)(1/(cos^2 alpha))) \
    &= (tan^3 alpha - 1)/(tan^3 alpha + 3 + 2(tan alpha)(1 + tan^2 alpha)) \
    &= (3^3 - 1)/(3^3 + 3 + 2(3)(1 + 3^2)) \
    &= (27 - 1)/(27 + 3 + 6(10)) \
    &= 26/(30 + 60) = 26/90 = 13/45. $
  ])
]

#dang("Rút gọn các biểu thức lượng giác", mau: C3)

#bai-tap-tu-luan(mau: C3)[
  #bt-item(1, [Rút gọn các biểu thức sau:
    + $A = (tan x + cot x)^2 - (tan x - cot x)^2$.
    + $B = (cot^2 x - cos^2 x)/(cot^2 x) + (sin x dot cos x)/(cot x)$.
    + $E = sin^4 x + sin^2 x cos^2 x + cos^2 x$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *a)* Khai triển hằng đẳng thức:
    $ A &= (tan^2 x + 2 tan x cot x + cot^2 x) - (tan^2 x - 2 tan x cot x + cot^2 x) \
    &= 4 tan x cot x = 4(1) = 4. $
    
    🔹 *b)* Phân tích từng phân thức:
    $ B &= (cot^2 x)/(cot^2 x) - (cos^2 x)/(cot^2 x) + sin x dot cos x dot tan x \
    &= 1 - cos^2 x / (cos^2 x / sin^2 x) + sin x dot cos x dot (sin x)/(cos x) \
    &= 1 - sin^2 x + sin^2 x = 1. $
    
    🔹 *c)* Nhóm các hạng tử:
    $ E &= sin^2 x(sin^2 x + cos^2 x) + cos^2 x \
    &= sin^2 x (1) + cos^2 x \
    &= sin^2 x + cos^2 x = 1. $
  ])
]
