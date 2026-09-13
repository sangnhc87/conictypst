#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("TỔNG VÀ HIỆU CỦA HAI VECTƠ", mau: C4)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C4)[
  - *Quy tắc ba điểm (Quy tắc cộng)*: Với ba điểm $A, B, C$ bất kì, ta luôn có:
    $ vec(A B) + vec(B C) = vec(A C) $
  - *Quy tắc hình bình hành*: Nếu $A B C D$ là hình bình hành thì:
    $ vec(A B) + vec(A D) = vec(A C) $
  - *Quy tắc trừ (Quy tắc hiệu)*: Với ba điểm $O, A, B$ bất kì:
    $ vec(O B) - vec(O A) = vec(A B) quad "hay" quad vec(A B) - vec(A C) = vec(C B) $
  - *Tính chất trung điểm*: Điểm $I$ là trung điểm của đoạn thẳng $A B$ khi và chỉ khi:
    $ vec(I A) + vec(I B) = vec(0) quad "hay với mọi điểm" M: vec(M A) + vec(M B) = 2 vec(M I) $
  - *Tính chất trọng tâm*: Điểm $G$ là trọng tâm tam giác $A B C$ khi và chỉ khi:
    $ vec(G A) + vec(G B) + vec(G C) = vec(0) quad "hay với mọi điểm" M: vec(M A) + vec(M B) + vec(M C) = 3 vec(M G) $
]

#dang("Tính tổng và hiệu của hai vectơ", mau: C4)

#bai-tap-tu-luan(mau: C4)[
  #bt-item(1, [Cho hình bình hành $A B C D$ với $M, N$ lần lượt là trung điểm của $B C$ và $A D$. Tìm tổng:
    + $vec(N C) + vec(M C)$.
    + $vec(A M) + vec(C D)$.
  ], loigiai: [
    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.6, xmax: 4.8, ymin: -0.6, ymax: 2.6, ctx => {
        let A = (0.0, 0.0)
        let D = (3.6, 0.0)
        let B = (0.8, 2.0)
        let C = (4.4, 2.0)
        let M = (2.6, 2.0)
        let N = (1.8, 0.0)

        // Hinh binh hanh ABCD
        da-giac(ctx, (A, B, C, D), mau: sm-gray, day: 1pt)

        // Vecto cau a: NC, MC
        mui-ten(ctx, N, C, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, M, C, mau: sm-green.darken(20%), day: 1.2pt)

        // Vecto cau b: AM, BM
        mui-ten(ctx, A, M, mau: sm-red, day: 1.3pt)
        mui-ten(ctx, B, M, mau: sm-purple, day: 1.2pt, dut: true)

        diem(ctx, A, ten: $A$, huong: "duoi-trai")
        diem(ctx, B, ten: $B$, huong: "tren-trai")
        diem(ctx, C, ten: $C$, huong: "tren-phai")
        diem(ctx, D, ten: $D$, huong: "duoi-phai")
        diem(ctx, M, ten: $M$, huong: "tren", mau: sm-blue)
        diem(ctx, N, ten: $N$, huong: "duoi", mau: sm-blue)
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *a)* Vì $N, M$ lần lượt là trung điểm của $A D$ và $B C$ trong hình bình hành $A B C D$, nên tứ giác $N C M D$ cũng là một hình bình hành.
    Áp dụng quy tắc hình bình hành: $vec(N C) + vec(M C) = vec(N C) + vec(N D) = 2 vec(N I)$ (với $I$ là trung điểm của $C D$).
    
    🔹 *b)* Trong hình bình hành $A B C D$, ta có $vec(C D) = vec(B A)$.
    Suy ra $vec(A M) + vec(C D) = vec(A M) + vec(B A) = vec(B A) + vec(A M) = vec(B M)$.
  ])

  #bt-item(2, [Cho hình vuông $A B C D$ cạnh $a$, tâm $O$. Tính:
    + Độ dài vectơ $vec(O A) - vec(C B)$.
    + Tính độ dài $|vec(A B) + vec(D C)|$.
  ], loigiai: [
    #align(center)[
      #hinh(w: 5.5cm, xmin: -0.6, xmax: 3.6, ymin: -0.6, ymax: 3.6, ctx => {
        let A = (0.0, 3.0)
        let B = (3.0, 3.0)
        let C = (3.0, 0.0)
        let D = (0.0, 0.0)
        let O = (1.5, 1.5)

        da-giac(ctx, (A, B, C, D), mau: sm-blue, day: 1.1pt)
        doan(ctx, A, C, mau: sm-gray, day: 0.7pt, dut: true)
        doan(ctx, B, D, mau: sm-gray, day: 0.7pt, dut: true)

        // Vecto OA, AD, OD
        mui-ten(ctx, O, A, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, A, D, mau: sm-green.darken(20%), day: 1.2pt)
        mui-ten(ctx, O, D, mau: sm-red, day: 1.3pt)

        diem(ctx, A, ten: $A$, huong: "tren-trai")
        diem(ctx, B, ten: $B$, huong: "tren-phai")
        diem(ctx, C, ten: $C$, huong: "duoi-phai")
        diem(ctx, D, ten: $D$, huong: "duoi-trai")
        diem(ctx, O, ten: $O$, huong: "phai", mau: sm-gray)
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *a)* Ta có $vec(C B) = vec(D A)$.
    Do đó $vec(O A) - vec(C B) = vec(O A) - vec(D A) = vec(O A) + vec(A D) = vec(O D)$.
    Độ dài: $|vec(O D)| = O D = 1/2 B D = (a sqrt(2))/2$.
    
    🔹 *b)* Ta có $vec(D C) = vec(A B)$.
    Do đó $vec(A B) + vec(D C) = vec(A B) + vec(A B) = 2 vec(A B)$.
    Độ dài: $|2 vec(A B)| = 2 A B = 2 a$.
  ])

  #bt-item(3, [Cho tam giác $A B C$ đều cạnh $a$, đường cao $A H$. Tính:
    + $|vec(A B) + vec(A C)|$.
    + $|vec(A B) - vec(A C)|$.
  ], loigiai: [
    #align(center)[
      #hinh(w: 6cm, xmin: -0.6, xmax: 3.6, ymin: -0.6, ymax: 3.2, ctx => {
        let B = (0.0, 0.0)
        let C = (3.0, 0.0)
        let A = (1.5, 2.598)
        let H = (1.5, 0.0)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc-vuong(ctx, H, A, C, r: 0.25, mau: sm-red)

        // Vecto AB, AC, AH
        mui-ten(ctx, A, B, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, A, C, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, A, H, mau: sm-red, day: 1.3pt)
        mui-ten(ctx, C, B, mau: sm-green.darken(20%), day: 1.2pt)

        diem(ctx, H, ten: $H$, huong: "duoi")
        nhan(ctx, (1.9, 1.3), text(size: 7.5pt, fill: sm-red)[$2 vec(A H)$])
        nhan(ctx, (1.5, -0.35), text(size: 7.5pt, fill: sm-green.darken(20%))[$vec(C B)$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *a)* Gọi $H$ là trung điểm của $B C$. Theo công thức trung tuyến, ta có $vec(A B) + vec(A C) = 2 vec(A H)$.
    Độ dài: $|vec(A B) + vec(A C)| = |2 vec(A H)| = 2 A H$.
    Vì $A B C$ là tam giác đều cạnh $a$ nên $A H = (a sqrt(3))/2$. Suy ra $2 A H = a sqrt(3)$.
    
    🔹 *b)* Theo quy tắc trừ, ta có $vec(A B) - vec(A C) = vec(C B)$.
    Độ dài: $|vec(C B)| = B C = a$.
  ])
]

#bai-tap-trac-nghiem(mau: C4)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho ba điểm phân biệt $A, B, C$. Đẳng thức nào sau đây luôn đúng?],
  (
    [$vec(A B) + vec(A C) = vec(B C)$.],
    True([$vec(A B) + vec(B C) = vec(A C)$.]),
    [$vec(B A) + vec(A C) = vec(C B)$.],
    [$vec(A B) - vec(A C) = vec(B C)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo quy tắc ba điểm (quy tắc cộng vectơ): $vec(A B) + vec(B C) = vec(A C)$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hình bình hành $A B C D$. Đẳng thức nào sau đây đúng?],
  (
    [$vec(A B) + vec(A C) = vec(A D)$.],
    [$vec(A B) + vec(C D) = vec(A C)$.],
    True([$vec(A B) + vec(A D) = vec(A C)$.]),
    [$vec(A B) - vec(A D) = vec(A C)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo quy tắc hình bình hành: Nếu $A B C D$ là hình bình hành thì $vec(A B) + vec(A D) = vec(A C)$.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ vuông tại $A$ có $A B = 3, A C = 4$. Độ dài của vectơ $vec(A B) + vec(A C)$ là:],
  (
    [$5$.],
    [$7$.],
    True([$5$.]),
    [$1$.],
  ),
  loigiai: [
    #align(center)[
      #hinh(w: 5.5cm, xmin: -0.6, xmax: 3.6, ymin: -0.6, ymax: 2.8, ctx => {
        let A = (0.0, 0.0)
        let B = (3.0, 0.0)
        let C = (0.0, 2.0)
        let D = (3.0, 2.0)

        da-giac(ctx, (A, B, D, C), mau: sm-gray, day: 1pt, dut: true)
        goc-vuong(ctx, A, B, C, r: 0.25, mau: sm-blue)

        mui-ten(ctx, A, B, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, A, C, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, A, D, mau: sm-red, day: 1.4pt)

        diem(ctx, A, ten: $A$, huong: "duoi-trai")
        diem(ctx, B, ten: $B$, huong: "duoi-phai")
        diem(ctx, C, ten: $C$, huong: "tren-trai")
        diem(ctx, D, ten: $D$, huong: "tren-phai")

        nhan(ctx, (1.5, -0.3), text(size: 7.5pt, fill: sm-blue)[$3$])
        nhan(ctx, (-0.35, 1.0), text(size: 7.5pt, fill: sm-blue)[$4$])
        nhan(ctx, (1.8, 1.25), text(size: 7.5pt, fill: sm-red)[$A D = 5$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Dựng điểm $D$ sao cho tứ giác $A B D C$ là hình chữ nhật (do tam giác $A B C$ vuông tại $A$).
    🔹 *Bước 2:* Theo quy tắc hình bình hành: $vec(A B) + vec(A C) = vec(A D)$.
    🔹 *Bước 3:* Độ dài của vectơ cần tìm là: $|vec(A B) + vec(A C)| = |vec(A D)| = A D$.
    Trong hình chữ nhật $A B D C$, $A D = B C = sqrt(A B^2 + A C^2) = sqrt(3^2 + 4^2) = 5$.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác đều $A B C$ cạnh $a$. Khi đó $|vec(A B) - vec(B C)|$ bằng:],
  (
    [$a$.],
    [$2 a$.],
    True([$a sqrt(3)$.]),
    [$(a sqrt(3))/2$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Áp dụng quy tắc hiệu, ta có $vec(A B) - vec(B C) = vec(A B) + vec(C B)$.
    🔹 *Bước 2:* Lấy điểm $D$ đối xứng với $C$ qua $B$, ta có $vec(C B) = vec(B D)$.
    Khi đó $vec(A B) + vec(C B) = vec(A B) + vec(B D) = vec(A D)$.
    🔹 *Bước 3:* Trong tam giác vuông $A C D$ tại $A$ (do trung tuyến $A B$ bằng nửa cạnh đáy $C D$), ta có: 
    $A D = A C dot sqrt(3) = a sqrt(3)$. (Hoặc tính theo định lí cosin trong tam giác $A B D$).
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ đều cạnh $a$, $A H$ là đường cao. Khi đó $|vec(A C) + vec(A H)|$ bằng:],
  (
    True([$(a sqrt(13))/2$.]),
    [$(a sqrt(7))/2$.],
    [$a sqrt(3)$.],
    [$2 a$.],
  ),
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Vì $A H$ là đường cao của tam giác đều cạnh $a$ nên $A H = (a sqrt(3))/2$.
    Đồng thời $A H$ cũng là đường phân giác nên góc $hat(C A H) = 30^@$.
    🔹 *Bước 2:* Độ dài vectơ tổng được tính dựa trên bình phương vô hướng:
    $ |vec(A C) + vec(A H)|^2 &= vec(A C)^2 + vec(A H)^2 + 2 vec(A C) dot vec(A H) \
    &= A C^2 + A H^2 + 2 A C dot A H dot cos 30^@ \
    &= a^2 + 3/4 a^2 + 2 a dot (a sqrt(3))/2 dot sqrt(3)/2 \
    &= a^2 + 3/4 a^2 + 3/2 a^2 = 13/4 a^2. $
    🔹 *Bước 3:* Khai căn, ta được $|vec(A C) + vec(A H)| = (a sqrt(13))/2$.
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hình thoi $A B C D$ cạnh $a$, $hat(A) = 60^@$. Độ dài vectơ $vec(A B) + vec(A D)$ bằng:],
  (
    [$a$.],
    [$a sqrt(2)$.],
    True([$a sqrt(3)$.]),
    [$2 a$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo quy tắc hình bình hành, ta có $vec(A B) + vec(A D) = vec(A C)$.
    Độ dài: $|vec(A B) + vec(A D)| = |vec(A C)| = A C$.
    Vì hình thoi có góc $hat(A) = 60^@$ nên tam giác $A B D$ là tam giác đều cạnh $a$.
    Đường chéo $A C = 2 A H = 2 (a sqrt(3))/2 = a sqrt(3)$ (với $H$ là tâm hình thoi).
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $I$ là trung điểm đoạn $A B$. Với mọi điểm $M$, đẳng thức nào đúng?],
  (
    [$vec(M A) + vec(M B) = vec(M I)$.],
    True([$vec(M A) + vec(M B) = 2 vec(M I)$.]),
    [$vec(M A) - vec(M B) = 2 vec(M I)$.],
    [$vec(M A) + vec(M B) = vec(0)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo tính chất trung điểm, với điểm $M$ bất kì, ta luôn có $vec(M A) + vec(M B) = 2 vec(M I)$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho trọng tâm $G$ của tam giác $A B C$. Với điểm $M$ bất kì, ta có:],
  (
    [$vec(M A) + vec(M B) + vec(M C) = vec(M G)$.],
    True([$vec(M A) + vec(M B) + vec(M C) = 3 vec(M G)$.]),
    [$vec(M A) + vec(M B) + vec(M C) = 2 vec(M G)$.],
    [$vec(M A) + vec(M B) + vec(M C) = vec(0)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo tính chất trọng tâm, với điểm $M$ bất kì, ta luôn có $vec(M A) + vec(M B) + vec(M C) = 3 vec(M G)$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho lục giác đều $A B C D E F$ tâm $O$ cạnh $a$. Giá trị $|vec(A B) + vec(F E)|$ là:],
  (
    [$a$.],
    True([$a sqrt(3)$ hoặc $a$.]),
    [$2 a$.],
    [$0$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Trong lục giác đều $A B C D E F$, ta có $vec(F E) = vec(B C)$.
    Suy ra $vec(A B) + vec(F E) = vec(A B) + vec(B C) = vec(A C)$.
    Độ dài: $|vec(A C)| = A C = a sqrt(3)$ (vì tam giác $A B C$ có $A B = B C = a$ và $hat(B) = 120^@$).
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hình vuông $A B C D$ cạnh $3 a$. Gọi $M$ là trung điểm $A B$. Độ dài $|vec(D C) + vec(M B)|$ là:],
  (
    [$3 a$.],
    True([$4,5 a$.]),
    [$6 a$.],
    [$3 a sqrt(2)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Hai vectơ $vec(D C)$ và $vec(M B)$ cùng hướng (vì cùng song song với $A B$ và hướng từ trái sang phải).
    Do đó độ dài của tổng bằng tổng các độ dài:
    $ |vec(D C) + vec(M B)| = |vec(D C)| + |vec(M B)| = D C + M B = 3 a + 1.5 a = 4.5 a. $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hai lực $vec(F_1), vec(F_2)$ cùng tác dụng vào vật tại điểm $O$. Góc giữa hai lực là $60^@$, độ lớn bằng $50" N"$. Độ lớn của hợp lực là:],
  (
    [$50" N"$.],
    [$100" N"$.],
    True([$50 sqrt(3)" N"$.]),
    [$25 sqrt(3)" N"$.],
  ),
  loigiai: [
    #align(center)[
      #hinh(w: 6cm, xmin: -0.6, xmax: 4.2, ymin: -0.6, ymax: 3.0, ctx => {
        let O = (0.0, 0.0)
        let F1 = (2.5, 0.0)
        let F2 = (2.5 * calc.cos(60deg), 2.5 * calc.sin(60deg))
        let F = (2.5 + 2.5 * calc.cos(60deg), 2.5 * calc.sin(60deg))

        da-giac(ctx, (O, F1, F, F2), mau: sm-gray, day: 0.8pt, dut: true)
        goc(ctx, O, F1, F2, r: 0.6, ten: [$60^@$], mau: sm-amber.darken(20%))

        mui-ten(ctx, O, F1, mau: sm-blue, day: 1.3pt)
        mui-ten(ctx, O, F2, mau: sm-blue, day: 1.3pt)
        mui-ten(ctx, O, F, mau: sm-red, day: 1.5pt)

        diem(ctx, O, ten: $O$, huong: "duoi-trai")
        nhan(ctx, (1.3, -0.3), text(size: 7.5pt, fill: sm-blue)[$vec(F_1)$])
        nhan(ctx, (0.45, 1.3), text(size: 7.5pt, fill: sm-blue)[$vec(F_2)$])
        nhan(ctx, (2.6, 1.3), text(size: 7.5pt, fill: sm-red)[$vec(F) = vec(F_1) + vec(F_2)$])
      })
    ]

    Theo quy tắc hình bình hành (ở đây là hình thoi vì $|vec(F_1)| = |vec(F_2)| = 50" N"$):
    Hợp lực $vec(F) = vec(F_1) + vec(F_2)$ nằm trên đường phân giác của góc $60^@$ (góc giữa hai lực), độ lớn:
    $ F = 2 dot 50 dot cos((60^@)/2) = 100 dot cos 30^@ = 100 dot (sqrt(3)/2) = 50 sqrt(3)" N". $
    Chọn C.
  ]
)

#tn(
  dir: "ngang",
  [Gọi $O$ là tâm hình bình hành $A B C D$. Đẳng thức nào sau đây sai?],
  (
    [$vec(O A) + vec(O C) = vec(0)$.],
    [$vec(O B) + vec(O D) = vec(0)$.],
    True([$vec(A B) + vec(B C) = vec(D B)$.]),
    [$vec(A B) + vec(A D) = 2 vec(A O)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta xét các phương án:
    🔹 *A)* $vec(O A) + vec(O C) = vec(0)$ đúng vì $O$ là trung điểm $A C$.
    🔹 *B)* $vec(O B) + vec(O D) = vec(0)$ đúng vì $O$ là trung điểm $B D$.
    🔹 *C)* $vec(A B) + vec(B C) = vec(A C) != vec(D B)$. Khẳng định C sai.
    🔹 *D)* $vec(A B) + vec(A D) = vec(A C) = 2 vec(A O)$. Khẳng định D đúng.
    
    ✅ *Chọn đáp án C.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 4, reset-counter: true)

#ds(
  [Cho tam giác đều $A B C$ cạnh $a$. Xét tính đúng sai của các khẳng định sau:],
  (
    [$vec(A B) + vec(B C) = vec(C A)$.],
    True([$vec(A C) - vec(A B) = vec(B C)$.]),
    [$|vec(A B) - vec(A C)| = 0$.],
    True([$|vec(A B) + vec(A C)| = a sqrt(3)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) SAI:* $vec(A B) + vec(B C) = vec(A C)$. Mà $vec(A C) != vec(C A)$.
    
    🔹 *Mệnh đề b) ĐÚNG:* Theo quy tắc hiệu, $vec(A C) - vec(A B) = vec(B C)$.
    
    🔹 *Mệnh đề c) SAI:* $vec(A B) - vec(A C) = vec(C B)$. Độ dài $|vec(A B) - vec(A C)| = |vec(C B)| = a != 0$.
    
    🔹 *Mệnh đề d) ĐÚNG:* Gọi $H$ là trung điểm $B C$, $vec(A B) + vec(A C) = 2 vec(A H)$. Độ dài $|vec(A B) + vec(A C)| = 2 A H = a sqrt(3)$.
  ]
)

#ds(
  [Cho hình thoi $A B C D$ tâm $H$ có cạnh bằng $a$ và $hat(A B C) = 60^@$. Xét tính đúng sai:],
  (
    True([$vec(A B) + vec(A D) = vec(A C)$.]),
    True([$vec(A B) - vec(A D) = vec(D B)$.]),
    True([$vec(H A) + vec(H B) = vec(D A)$ hoặc tương đương.]),
    True([Độ dài các tổng vectơ tính được từ tính chất hai đường chéo vuông góc.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Áp dụng quy tắc hình bình hành cho hình thoi $A B C D$, ta có $vec(A B) + vec(A D) = vec(A C)$.
    
    🔹 *Mệnh đề b) ĐÚNG:* Áp dụng quy tắc trừ, $vec(A B) - vec(A D) = vec(D B)$.
    
    🔹 *Mệnh đề c) ĐÚNG:* Khẳng định tính toán theo tính chất hình bình hành.
    
    🔹 *Mệnh đề d) ĐÚNG:* Trong hình thoi, hai đường chéo vuông góc với nhau và cắt nhau tại trung điểm, giúp dễ dàng tính độ dài bằng định lí Pythagore.
  ]
)

#ds(
  [Cho hình vuông $A B C D$ cạnh $a$, tâm $O$. Xét tính đúng sai:],
  (
    True([$|vec(A B) + vec(A D)| = a sqrt(2)$.]),
    True([$|vec(A B) - vec(A D)| = a sqrt(2)$.]),
    [$vec(O A) + vec(O B) = vec(0)$.],
    True([$vec(O A) + vec(O B) + vec(O C) + vec(O D) = vec(0)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* $vec(A B) + vec(A D) = vec(A C)$. Độ dài $|vec(A C)| = a sqrt(2)$ (đường chéo hình vuông).
    
    🔹 *Mệnh đề b) ĐÚNG:* $vec(A B) - vec(A D) = vec(D B)$. Độ dài $|vec(D B)| = a sqrt(2)$.
    
    🔹 *Mệnh đề c) SAI:* $vec(O A)$ và $vec(O B)$ là hai vectơ vuông góc nhau, tổng của chúng có độ dài khác $0$, không phải vectơ-không.
    
    🔹 *Mệnh đề d) ĐÚNG:* $vec(O A) + vec(O C) = vec(0)$ và $vec(O B) + vec(O D) = vec(0)$, nên tổng $4$ vectơ là $vec(0)$.
  ]
)

#ds(
  [Cho tam giác $A B C$ có trọng tâm $G$. Xét tính đúng sai:],
  (
    True([$vec(G A) + vec(G B) + vec(G C) = vec(0)$.]),
    [$vec(A G) = 1/3 (vec(A B) + vec(A C))$.],
    True([$vec(A G) = 2/3 vec(A M)$ (với $M$ là trung điểm $B C$).]),
    True([Với mọi điểm $O$, $vec(O A) + vec(O B) + vec(O C) = 3 vec(O G)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Đây là tính chất cơ bản của trọng tâm tam giác.
    
    🔹 *Mệnh đề b) ĐÚNG:* Công thức đúng khi tam giác có trọng tâm $G$ và trung điểm $M$ của $B C$ là $vec(A G) = 2/3 vec(A M) = 2/3 dot 1/2 (vec(A B) + vec(A C)) = 1/3(vec(A B) + vec(A C))$.
    
    🔹 *Mệnh đề c) ĐÚNG:* $G$ chia đoạn trung tuyến theo tỉ lệ $2:1$ kể từ đỉnh.
    
    🔹 *Mệnh đề d) ĐÚNG:* Đây là công thức biến thiên điểm bất kì đối với trọng tâm.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 4, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$ vuông tại $A$ có $A B = 6, A C = 8$. Độ dài vectơ $vec(A B) + vec(A C)$ bằng bao nhiêu?],
  [10],
  loigiai: [
    #align(center)[
      #hinh(w: 5.5cm, xmin: -0.6, xmax: 3.6, ymin: -0.6, ymax: 2.8, ctx => {
        let A = (0.0, 0.0)
        let B = (3.0, 0.0)
        let C = (0.0, 2.0)
        let D = (3.0, 2.0)

        da-giac(ctx, (A, B, D, C), mau: sm-gray, day: 1pt, dut: true)
        goc-vuong(ctx, A, B, C, r: 0.25, mau: sm-blue)

        mui-ten(ctx, A, B, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, A, C, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, A, D, mau: sm-red, day: 1.4pt)

        diem(ctx, A, ten: $A$, huong: "duoi-trai")
        diem(ctx, B, ten: $B$, huong: "duoi-phai")
        diem(ctx, C, ten: $C$, huong: "tren-trai")
        diem(ctx, D, ten: $D$, huong: "tren-phai")

        nhan(ctx, (1.5, -0.3), text(size: 7.5pt, fill: sm-blue)[$6$])
        nhan(ctx, (-0.35, 1.0), text(size: 7.5pt, fill: sm-blue)[$8$])
        nhan(ctx, (1.8, 1.25), text(size: 7.5pt, fill: sm-red)[$A D = 10$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Dựng điểm $D$ sao cho tứ giác $A B D C$ là hình chữ nhật (do tam giác $A B C$ vuông tại $A$).
    🔹 *Bước 2:* Theo quy tắc hình bình hành: $vec(A B) + vec(A C) = vec(A D)$.
    🔹 *Bước 3:* Độ dài của vectơ cần tìm là: $|vec(A B) + vec(A C)| = |vec(A D)| = A D$.
    Trong hình chữ nhật $A B D C$, $A D = B C = sqrt(A B^2 + A C^2) = sqrt(6^2 + 8^2) = 10$.
    
    ✅ *Đáp số:* $10$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác đều $A B C$ cạnh $2" cm"$. Độ dài của vectơ $vec(A B) + vec(A C)$ bằng bao nhiêu cm (làm tròn đến một chữ số thập phân)?],
  [3,5],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $H$ là trung điểm của $B C$. Theo quy tắc trung tuyến: $vec(A B) + vec(A C) = 2 vec(A H)$.
    Độ dài: $|vec(A B) + vec(A C)| = |2 vec(A H)| = 2 A H$.
    Trong tam giác đều cạnh $a = 2$, đường cao $A H = (2 sqrt(3))/2 = sqrt(3)$.
    Suy ra $2 A H = 2 sqrt(3) approx 3.5" cm"$.
    
    ✅ *Đáp số:* $3.5$.
  ]
)

#tln(
  dir: "ngang",
  [Ba lực cùng tác dụng vào chất điểm $O$ tạo thành trạng thái cân bằng. Biết độ lớn hai lực là $30" N"$ và $40" N"$ và chúng vuông góc với nhau. Độ lớn của lực thứ ba là bao nhiêu Newton?],
  [50],
  loigiai: [
    #align(center)[
      #hinh(w: 5.5cm, xmin: -2.8, xmax: 2.6, ymin: -2.4, ymax: 2.2, ctx => {
        let O = (0.0, 0.0)
        let F1 = (2.0, 0.0)
        let F2 = (0.0, 1.6)
        let F12 = (2.0, 1.6)
        let F3 = (-2.0, -1.6)

        da-giac(ctx, (O, F1, F12, F2), mau: sm-gray, day: 0.8pt, dut: true)
        goc-vuong(ctx, O, F1, F2, r: 0.25, mau: sm-blue)

        mui-ten(ctx, O, F1, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, O, F2, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, O, F12, mau: sm-purple, day: 1.2pt, dut: true)
        mui-ten(ctx, O, F3, mau: sm-red, day: 1.4pt)

        diem(ctx, O, ten: $O$, huong: "tren-trai")
        nhan(ctx, (1.0, -0.3), text(size: 7.5pt, fill: sm-blue)[$30" N"$])
        nhan(ctx, (-0.4, 0.8), text(size: 7.5pt, fill: sm-blue)[$40" N"$])
        nhan(ctx, (-1.2, -1.1), text(size: 7.5pt, fill: sm-red)[$vec(F_3)$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Vì ba lực ở trạng thái cân bằng nên:
    $ vec(F_1) + vec(F_2) + vec(F_3) = vec(0) => vec(F_3) = -(vec(F_1) + vec(F_2)). $
    🔹 *Bước 2:* Độ lớn của hợp lực hai lực đầu (vuông góc nhau) là:
    $ F_12 = sqrt(F_1^2 + F_2^2) = sqrt(30^2 + 40^2) = 50" N". $
    🔹 *Bước 3:* Suy ra độ lớn của lực thứ ba: $F_3 = F_12 = 50" N"$.
    
    ✅ *Đáp số:* $50$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hình thoi $A B C D$ có cạnh bằng $5$, góc $hat(A) = 60^@$. Tính độ dài vectơ $vec(A B) - vec(A D)$.],
  [5],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo quy tắc trừ: $vec(A B) - vec(A D) = vec(D B)$.
    Độ dài cần tìm là $D B$. 
    Vì hình thoi $A B C D$ có $hat(A) = 60^@$ và $A B = A D = 5$, nên tam giác $A B D$ là tam giác đều.
    Suy ra $D B = A B = 5$.
    
    ✅ *Đáp số:* $5$.
  ]
)
