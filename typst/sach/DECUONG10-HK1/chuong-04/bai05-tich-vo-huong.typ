#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("TÍCH VÔ HƯỚNG CỦA HAI VECTƠ", mau: C4)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C4)[
  - *Góc giữa hai vectơ*: Cho hai vectơ $vec(a)$ và $vec(b)$ khác $vec(0)$. Từ điểm $O$, vẽ $vec(O A) = vec(a), vec(O B) = vec(b)$. Khi đó góc $hat(A O B)$ ($0^@ <= hat(A O B) <= 180^@$) gọi là góc giữa hai vectơ $vec(a)$ và $vec(b)$, kí hiệu $(vec(a), vec(b))$.
  - *Định nghĩa tích vô hướng*: Tích vô hướng của hai vectơ $vec(a)$ và $vec(b)$ là một số, kí hiệu là $vec(a) dot vec(b)$, xác định bởi:
    $ vec(a) dot vec(b) = |vec(a)| dot |vec(b)| dot cos(vec(a), vec(b)) $
  - *Tính chất*:
    - $vec(a) perp vec(b) <=> vec(a) dot vec(b) = 0$.
    - $vec(a)^2 = |vec(a)|^2$.
    - $vec(a) dot vec(b) = vec(b) dot vec(a)$.
    - $vec(a)(vec(b) + vec(c)) = vec(a) dot vec(b) + vec(a) dot vec(c)$.
  - *Biểu thức toạ độ*: Với $vec(u) = (x; y)$ và $vec(v) = (x'; y')$:
    - $vec(u) dot vec(v) = x x' + y y'$.
    - $|vec(u)| = sqrt(x^2 + y^2)$.
    - Khoảng cách hai điểm $A, B$: $A B = sqrt((x_B - x_A)^2 + (y_B - y_A)^2)$.
    - $cos(vec(u), vec(v)) = (x x' + y y') / (sqrt(x^2 + y^2) dot sqrt(x'^2 + y'^2))$.
    - $vec(u) perp vec(v) <=> x x' + y y' = 0$.
]

#dang("Tích vô hướng và ứng dụng", mau: C4)

#bai-tap-tu-luan(mau: C4)[
  #bt-item(1, [Cho tam giác $A B C$ vuông tại $A$, có $A B = a, B C = 2 a$. Tính các tích vô hướng:
    + $vec(A B) dot vec(A C)$.
    + $vec(A C) dot vec(C B)$.
    + $vec(A B) dot vec(B C)$.
  ], loigiai: [
    #align(center)[
      #hinh(w: 6cm, xmin: -0.8, xmax: 3.8, ymin: -0.6, ymax: 2.8, ctx => {
        let A = (0.0, 0.0)
        let B = (0.0, 1.5)
        let C = (2.598, 0.0)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc-vuong(ctx, A, B, C, r: 0.25, mau: sm-red)

        // Huong vecto
        mui-ten(ctx, A, B, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, A, C, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, C, B, mau: sm-green.darken(20%), day: 1.2pt)

        // Tia keo dai de xac dinh goc
        doan(ctx, B, (0.0, 2.2), dut: true, mau: sm-gray, day: 0.7pt)
        doan(ctx, C, (3.3, 0.0), dut: true, mau: sm-gray, day: 0.7pt)

        nhan(ctx, (-0.35, 0.75), text(size: 7.5pt, fill: sm-blue)[$a$])
        nhan(ctx, (1.3, -0.3), text(size: 7.5pt, fill: sm-blue)[$a sqrt(3)$])
        nhan(ctx, (1.6, 1.0), text(size: 7.5pt, fill: sm-green.darken(20%))[$2a$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *a)* Vì hai cạnh góc vuông $A B perp A C$ nên $vec(A B) dot vec(A C) = 0$.
    
    🔹 *b)* Theo định lí Pythagore, ta có: $A C = sqrt(B C^2 - A B^2) = sqrt((2 a)^2 - a^2) = a sqrt(3)$. 
    Xét trong tam giác vuông $A B C$, ta có $cos C = (A C)/(B C) = (a sqrt(3))/(2 a) = sqrt(3)/2 => hat(C) = 30^@$.
    Góc giữa hai vectơ $(vec(C A), vec(C B)) = 30^@ => (vec(A C), vec(C B)) = 180^@ - 30^@ = 150^@$.
    Tích vô hướng:
    $ vec(A C) dot vec(C B) = |vec(A C)| dot |vec(C B)| dot cos 150^@ = a sqrt(3) dot 2 a dot (-sqrt(3)/2) = -3 a^2. $
    
    🔹 *c)* Trong tam giác vuông $A B C$, ta có $hat(B) = 90^@ - hat(C) = 60^@$.
    Suy ra góc giữa hai vectơ $(vec(A B), vec(B C)) = 180^@ - 60^@ = 120^@$.
    Tích vô hướng:
    $ vec(A B) dot vec(B C) = |vec(A B)| dot |vec(B C)| dot cos 120^@ = a dot 2 a dot (-1/2) = -a^2. $
  ])

  #bt-item(2, [Cho tam giác đều $A B C$ cạnh $a$. Tính $vec(A B) dot (2 vec(A B) - 3 vec(A C))$.], loigiai: [
    #align(center)[
      #hinh(w: 5.5cm, xmin: -0.6, xmax: 3.6, ymin: -0.6, ymax: 3.2, ctx => {
        let A = (1.5, 2.598)
        let B = (0.0, 0.0)
        let C = (3.0, 0.0)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc(ctx, A, B, C, r: 0.5, ten: [$60^@$], mau: sm-red)

        mui-ten(ctx, A, B, mau: sm-blue, day: 1.3pt)
        mui-ten(ctx, A, C, mau: sm-blue, day: 1.3pt)

        nhan(ctx, (0.5, 1.4), text(size: 7.5pt, fill: sm-blue)[$vec(A B)$])
        nhan(ctx, (2.5, 1.4), text(size: 7.5pt, fill: sm-blue)[$vec(A C)$])
        nhan(ctx, (1.5, -0.3), text(size: 7.5pt, fill: sm-gray)[$a$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Vì tam giác $A B C$ là tam giác đều nên $A B = A C = a$ và $hat(B A C) = 60^@$.
    Góc giữa hai vectơ $vec(A B)$ và $vec(A C)$ là $(vec(A B), vec(A C)) = hat(B A C) = 60^@$.
    🔹 *Bước 2:* Khai triển biểu thức cần tính:
    $ vec(A B) dot (2 vec(A B) - 3 vec(A C)) &= 2 vec(A B)^2 - 3 vec(A B) dot vec(A C) \
    &= 2 A B^2 - 3 A B dot A C dot cos 60^@ \
    &= 2 a^2 - 3 a^2 dot (1/2) = 2 a^2 - 3/2 a^2 = 1/2 a^2. $
  ])
]

#bai-tap-trac-nghiem(mau: C4)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 10, reset-counter: true)

#tn(
  dir: "ngang",
  [Tam giác $A B C$ vuông ở $A$ và có góc $hat(B) = 50^@$. Hệ thức nào sau đây sai?],
  (
    [$vec(A B) dot vec(A C) = 0$.],
    [$cos(vec(A B), vec(B C)) = cos 130^@$.],
    True([$vec(A B) dot vec(B C) > 0$.]),
    [$vec(B A) dot vec(B C) = A B dot B C dot cos 50^@$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Góc giữa hai vectơ $vec(A B)$ và $vec(B C)$ được xác định bằng cách dời vectơ về cùng gốc. 
    Ta có $(vec(A B), vec(B C)) = 180^@ - hat(B) = 180^@ - 50^@ = 130^@$.
    Vì góc tù ($> 90^@$) nên tích vô hướng $vec(A B) dot vec(B C) < 0$.
    Khẳng định C sai.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác đều $A B C$ cạnh $a$. Giá trị $vec(A B) dot vec(A C)$ bằng:],
  (
    [$a^2$.],
    True([$1/2 a^2$.]),
    [$-1/2 a^2$.],
    [$(a^2 sqrt(3))/2$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Vì tam giác $A B C$ đều nên góc $hat(B A C) = 60^@$.
    Tích vô hướng:
    $ vec(A B) dot vec(A C) = |vec(A B)| dot |vec(A C)| dot cos 60^@ = a dot a dot 1/2 = 1/2 a^2 $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Trong mặt phẳng $O x y$, cho $vec(u) = (2; -1), vec(v) = (3; 2)$. Tích vô hướng $vec(u) dot vec(v)$ bằng:],
  (
    [$8$.],
    True([$4$.]),
    [$-4$.],
    [$5$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng công thức tích vô hướng bằng toạ độ, ta có:
    $ vec(u) dot vec(v) = x_u x_v + y_u y_v = 2 dot 3 + (-1) dot 2 = 6 - 2 = 4 $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $vec(a) = (1; 2)$ và $vec(b) = (-2; 1)$. Góc giữa hai vectơ $vec(a)$ và $vec(b)$ bằng:],
  (
    [$0^@$.],
    [$45^@$.],
    True([$90^@$.]),
    [$180^@$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta tính tích vô hướng của hai vectơ:
    $ vec(a) dot vec(b) = 1 dot (-2) + 2 dot 1 = -2 + 2 = 0 $
    Suy ra $vec(a) perp vec(b)$, do đó góc giữa hai vectơ bằng $90^@$.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $A(1; 2), B(4; 6)$. Độ dài đoạn thẳng $A B$ là:],
  (
    [$3$.],
    [$4$.],
    True([$5$.]),
    [$25$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng công thức tính khoảng cách giữa hai điểm:
    $ A B = sqrt((x_B - x_A)^2 + (y_B - y_A)^2) = sqrt((4 - 1)^2 + (6 - 2)^2) = sqrt(3^2 + 4^2) = sqrt(25) = 5. $
    
    ✅ *Chọn đáp án C.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2, reset-counter: true)

#ds(
  [Cho tam giác $A B C$ đều cạnh $a$. Xét tính đúng sai:],
  (
    True([$vec(A B) dot vec(A C) = 1/2 a^2$.]),
    True([$vec(B A) dot vec(B C) = 1/2 a^2$.]),
    [$vec(A B) dot vec(B C) = 1/2 a^2$.],
    True([$vec(A B) dot vec(B C) = -1/2 a^2$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Do $(vec(A B), vec(A C)) = 60^@$ nên $vec(A B) dot vec(A C) = a dot a dot cos 60^@ = 1/2 a^2$.
    
    🔹 *Mệnh đề b) ĐÚNG:* Tương tự $(vec(B A), vec(B C)) = 60^@$ nên $vec(B A) dot vec(B C) = a dot a dot cos 60^@ = 1/2 a^2$.
    
    🔹 *Mệnh đề c) SAI:* Góc $(vec(A B), vec(B C)) = 180^@ - 60^@ = 120^@$.
    Nên $vec(A B) dot vec(B C) = a dot a dot cos 120^@ = -1/2 a^2$.
    
    🔹 *Mệnh đề d) ĐÚNG:* (Lý giải như trên).
  ]
)

#ds(
  [Trong mặt phẳng $O x y$, cho $A(1; 3), B(4; 2), C(2; 0)$. Xét tính đúng sai:],
  (
    True([$vec(A B) = (3; -1)$.]),
    True([$vec(A C) = (1; -3)$.]),
    True([Tam giác $A B C$ cân tại $A$.]),
    [$vec(A B) dot vec(A C) = 0$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Tính toạ độ $vec(A B) = (4 - 1; 2 - 3) = (3; -1)$.
    
    🔹 *Mệnh đề b) ĐÚNG:* Tính toạ độ $vec(A C) = (2 - 1; 0 - 3) = (1; -3)$.
    
    🔹 *Mệnh đề c) ĐÚNG:* $A B = sqrt(3^2 + (-1)^2) = sqrt(10)$ và $A C = sqrt(1^2 + (-3)^2) = sqrt(10)$. 
    Vì $A B = A C$ nên tam giác $A B C$ cân tại $A$.
    
    🔹 *Mệnh đề d) SAI:* Tích vô hướng $vec(A B) dot vec(A C) = 3 dot 1 + (-1) dot (-3) = 3 + 3 = 6 != 0$.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 3, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho tam giác đều $A B C$ cạnh bằng $4$. Tính giá trị của $vec(A B) dot vec(A C)$.],
  [8],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tam giác đều có các góc bằng $60^@$. Góc giữa hai vectơ $vec(A B)$ và $vec(A C)$ là $60^@$.
    🔹 *Bước 2:* Áp dụng công thức tích vô hướng:
    $ vec(A B) dot vec(A C) = |vec(A B)| dot |vec(A C)| dot cos 60^@ = 4 dot 4 dot 1/2 = 8 $
    
    ✅ *Đáp số:* $8$.
  ]
)

#tln(
  dir: "ngang",
  [Trong mặt phẳng $O x y$, cho $vec(u) = (2; m)$ và $vec(v) = (3; 6)$. Tìm $m$ để $vec(u) perp vec(v)$.],
  [-1],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Hai vectơ vuông góc với nhau khi và chỉ khi tích vô hướng của chúng bằng 0: $vec(u) dot vec(v) = 0$.
    🔹 *Bước 2:* Thay toạ độ vào biểu thức tích vô hướng:
    $ 2 dot 3 + m dot 6 = 0 <=> 6 + 6 m = 0 <=> 6 m = -6 <=> m = -1. $
    
    ✅ *Đáp số:* $-1$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$ vuông tại $A$ có $A B = 3, A C = 4$. Tính tích vô hướng $vec(B A) dot vec(B C)$.],
  [9],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Theo định lí Pythagore trong tam giác vuông $A B C$: 
    $ B C = sqrt(A B^2 + A C^2) = sqrt(3^2 + 4^2) = 5. $
    🔹 *Bước 2:* Góc giữa hai vectơ $vec(B A)$ và $vec(B C)$ chính là góc $hat(B)$.
    Ta có $cos B = (A B)/(B C) = 3/5$.
    🔹 *Bước 3:* Tích vô hướng:
    $ vec(B A) dot vec(B C) = |vec(B A)| dot |vec(B C)| dot cos B = 3 dot 5 dot 3/5 = 9. $
    
    ✅ *Đáp số:* $9$.
  ]
)
