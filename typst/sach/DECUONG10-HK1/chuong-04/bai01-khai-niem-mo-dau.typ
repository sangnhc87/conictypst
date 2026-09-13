#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("CÁC KHÁI NIỆM MỞ ĐẦU VỀ VECTƠ", mau: C4)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C4)[
  - *Định nghĩa vectơ*: Vectơ là một đoạn thẳng có hướng, nghĩa là trong hai điểm mút của đoạn thẳng đã chỉ rõ điểm nào là điểm đầu, điểm nào là điểm cuối. Kí hiệu: $vec(A B)$, $vec(a)$, $vec(b)$, $dots$
  - *Độ dài của vectơ*: Độ dài của vectơ $vec(A B)$ là khoảng cách giữa điểm đầu $A$ và điểm cuối $B$. Kí hiệu: $|vec(A B)| = A B$.
  - *Vectơ-không*: Là vectơ có điểm đầu và điểm cuối trùng nhau. Kí hiệu: $vec(0)$. Quy ước: $|vec(0)| = 0$. Mọi vectơ-không đều cùng phương, cùng hướng với mọi vectơ.
  - *Giá của vectơ*: Đường thẳng đi qua điểm đầu và điểm cuối của vectơ gọi là giá của vectơ đó.
  - *Hai vectơ cùng phương*: Hai vectơ được gọi là cùng phương nếu giá của chúng song song hoặc trùng nhau.
  - *Hai vectơ cùng hướng, ngược hướng*: Hai vectơ cùng phương thì chỉ có thể cùng hướng hoặc ngược hướng.
  - *Hai vectơ bằng nhau*: Hai vectơ $vec(a)$ và $vec(b)$ được gọi là bằng nhau nếu chúng có cùng hướng và cùng độ dài. Kí hiệu: $vec(a) = vec(b)$.
  - *Hai vectơ đối nhau*: Hai vectơ $vec(a)$ và $vec(b)$ được gọi là đối nhau nếu chúng ngược hướng và có cùng độ dài. Kí hiệu: $vec(a) = -vec(b)$ hay $vec(a) + vec(b) = vec(0)$.
]

#dang("Xác định vectơ. Xác định phương, hướng, độ dài của vectơ", mau: C4)

#bai-tap-tu-luan(mau: C4)[
  #bt-item(1, [Với ba điểm phân biệt $A, B, C$ có thể xác định được bao nhiêu vectơ khác vectơ-không có điểm đầu và điểm cuối lấy từ ba điểm trên?], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Từ $3$ điểm phân biệt $A, B, C$, mỗi cặp $2$ điểm phân biệt khi nối lại sẽ cho ta $2$ vectơ có hướng ngược nhau.
    Ví dụ cặp $A, B$ cho ta $vec(A B)$ và $vec(B A)$.
    
    🔹 *Bước 2:* Số lượng vectơ khác vectơ-không được tạo thành chính là số chỉnh hợp chập $2$ của $3$ phần tử:
    $ A_3^2 = 3 dot 2 = 6 "vectơ". $
    Các vectơ đó là: $vec(A B), vec(B A), vec(A C), vec(C A), vec(B C), vec(C B)$.
  ])

  #bt-item(2, [Cho ba điểm $M, N, P$ thẳng hàng, trong đó $N$ nằm giữa $M$ và $P$. Tìm các cặp vectơ cùng hướng, ngược hướng.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Vì $N$ nằm giữa $M$ và $P$ trên cùng một đường thẳng nên thứ tự các điểm là $M - N - P$.
    
    🔹 *Bước 2:* Dựa vào thứ tự này, ta liệt kê các cặp vectơ cùng hướng (cùng nằm trên 1 đường thẳng và hướng về 1 phía):
    - $(vec(M N), vec(M P))$
    - $(vec(N P), vec(M P))$
    - $(vec(P N), vec(P M))$
    - $dots$
    
    🔹 *Bước 3:* Liệt kê các cặp vectơ ngược hướng (hướng về 2 phía ngược nhau):
    - $(vec(N M), vec(N P))$
    - $(vec(M N), vec(P N))$
    - $(vec(M P), vec(P M))$
    - $dots$
  ])

  #bt-item(3, [Cho hình vuông $A B C D$ cạnh $a$, tâm $O$. Tính độ dài các vectơ: $vec(A B), vec(A C), vec(O A), vec(O B)$.], loigiai: [
    #align(center)[
      #hinh(w: 5.5cm, xmin: -0.6, xmax: 3.6, ymin: -0.6, ymax: 3.6, ctx => {
        let A = (0.0, 3.0)
        let B = (3.0, 3.0)
        let C = (3.0, 0.0)
        let D = (0.0, 0.0)
        let O = (1.5, 1.5)

        // Hinh vuong
        da-giac(ctx, (A, B, C, D), mau: sm-blue, day: 1.2pt)
        // Duong cheo
        doan(ctx, A, C, mau: sm-gray, day: 0.8pt, dut: true)
        doan(ctx, B, D, mau: sm-gray, day: 0.8pt, dut: true)

        // Cac vecto noi bat
        mui-ten(ctx, A, B, mau: sm-red, day: 1.3pt)
        mui-ten(ctx, A, C, mau: sm-green.darken(20%), day: 1.3pt)
        mui-ten(ctx, O, A, mau: sm-purple, day: 1.2pt)
        mui-ten(ctx, O, B, mau: sm-amber.darken(20%), day: 1.2pt)

        diem(ctx, A, ten: $A$, huong: "tren-trai")
        diem(ctx, B, ten: $B$, huong: "tren-phai")
        diem(ctx, C, ten: $C$, huong: "duoi-phai")
        diem(ctx, D, ten: $D$, huong: "duoi-trai")
        diem(ctx, O, ten: $O$, huong: "duoi", mau: sm-gray)

        nhan(ctx, (1.5, 3.25), text(size: 7.5pt, fill: sm-red)[$a$])
        nhan(ctx, (3.25, 1.5), text(size: 7.5pt, fill: sm-gray)[$a$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Độ dài của vectơ $vec(A B)$ chính là độ dài đoạn thẳng $A B$.
    Vì $A B C D$ là hình vuông cạnh $a$ nên $|vec(A B)| = A B = a$.
    
    🔹 *Bước 2:* $A C$ là đường chéo của hình vuông cạnh $a$. 
    Áp dụng định lí Pythagore trong tam giác vuông $A B C$:
    $ A C = sqrt(A B^2 + B C^2) = sqrt(a^2 + a^2) = a sqrt(2). $
    Suy ra $|vec(A C)| = a sqrt(2)$.
    
    🔹 *Bước 3:* Tâm $O$ là giao điểm của hai đường chéo nên $O$ là trung điểm của $A C$ và $B D$.
    Suy ra độ dài $O A = O B = (A C)/2 = (a sqrt(2))/2$.
    Vậy $|vec(O A)| = |vec(O B)| = (a sqrt(2))/2$.
  ])

  #bt-item(4, [Cho tam giác đều $A B C$ cạnh $a$, đường cao $A H$. Tính $|vec(A B)|, |vec(A H)|, |vec(B C)|$.], loigiai: [
    #align(center)[
      #hinh(w: 5.5cm, xmin: -0.6, xmax: 3.6, ymin: -0.6, ymax: 3.2, ctx => {
        let B = (0.0, 0.0)
        let C = (3.0, 0.0)
        let A = (1.5, 2.598)
        let H = (1.5, 0.0)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        goc-vuong(ctx, H, A, C, r: 0.25, mau: sm-red)

        // Duong cao AH va cac vecto
        mui-ten(ctx, A, B, mau: sm-blue, day: 1.2pt)
        mui-ten(ctx, B, C, mau: sm-green.darken(20%), day: 1.2pt)
        mui-ten(ctx, A, H, mau: sm-red, day: 1.3pt)

        diem(ctx, H, ten: $H$, huong: "duoi")
        danh-dau(ctx, B, H, so: 1, mau: sm-blue)
        danh-dau(ctx, H, C, so: 1, mau: sm-blue)

        nhan(ctx, (0.5, 1.5), text(size: 7.5pt, fill: sm-blue)[$a$])
        nhan(ctx, (1.5, -0.35), text(size: 7.5pt, fill: sm-green.darken(20%))[$a$])
        nhan(ctx, (1.9, 1.2), text(size: 7.5pt, fill: sm-red)[$(a sqrt(3))/2$])
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Độ dài các vectơ $vec(A B)$ và $vec(B C)$ chính là độ dài các cạnh của tam giác đều.
    Nên $|vec(A B)| = a$ và $|vec(B C)| = a$.
    
    🔹 *Bước 2:* Độ dài vectơ $vec(A H)$ là chiều cao của tam giác đều cạnh $a$.
    Áp dụng công thức đường cao tam giác đều (hoặc dùng định lí Pythagore cho tam giác $A H B$ với $H B = a/2$):
    $ |vec(A H)| = A H = (a sqrt(3))/2. $
  ])
]

#bai-tap-trac-nghiem(mau: C4)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12, reset-counter: true)

#tn(
  dir: "ngang",
  [Mệnh đề nào sau đây đúng?],
  (
    [Có duy nhất một vectơ cùng phương với mọi vectơ.],
    True([Có vô số vectơ cùng phương với mọi vectơ.]), // vectơ-không có dạng AA, BB...
    [Không có vectơ nào cùng phương với mọi vectơ.],
    [Cả A, B, C đều sai.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Vectơ-không $vec(0)$ được quy ước là cùng phương, cùng hướng với mọi vectơ. 
    Có vô số biểu diễn của vectơ-không (tất cả các vectơ có điểm đầu và điểm cuối trùng nhau như $vec(A A), vec(B B), dots$).
    Do đó có vô số vectơ cùng phương với mọi vectơ. Khẳng định B đúng.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$. Có thể xác định bao nhiêu vectơ khác vectơ-không có điểm đầu và điểm cuối là các đỉnh $A, B, C$?],
  (
    [$3$.],
    True([$6$.]),
    [$4$.],
    [$9$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Cứ $2$ điểm phân biệt lấy từ $3$ điểm $A, B, C$ sẽ tạo thành $2$ vectơ khác vectơ-không.
    Số vectơ tạo thành là: $A_3^2 = 3 dot 2 = 6$.
    Các vectơ đó là: $vec(A B), vec(B A), vec(B C), vec(C B), vec(C A), vec(A C)$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Hai vectơ được gọi là bằng nhau khi và chỉ khi:],
  (
    [Chúng cùng hướng.],
    [Chúng có cùng độ dài.],
    True([Chúng cùng hướng và có cùng độ dài.]),
    [Chúng cùng phương và có cùng độ dài.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo định nghĩa, hai vectơ được gọi là bằng nhau nếu chúng có cùng hướng và cùng độ dài.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tứ giác $A B C D$. Điều kiện cần và đủ để $vec(A B) = vec(D C)$ là:],
  (
    [$A B C D$ là hình bình hành.],
    True([Tứ giác $A B C D$ là hình bình hành.]),
    [$A B = C D$.],
    [$A B parallel C D$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta có $vec(A B) = vec(D C)$ khi và chỉ khi hai vectơ này cùng hướng và cùng độ dài.
    Tức là $A B parallel D C$, $A B$ cùng hướng với $D C$ và $A B = D C$.
    Điều này tương đương với việc tứ giác $A B C D$ là hình bình hành.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hình lục giác đều $A B C D E F$ tâm $O$. Số vectơ khác $vec(0)$, cùng phương với $vec(O C)$ có điểm đầu và điểm cuối là đỉnh của lục giác là:],
  (
    [$4$.],
    True([$6$.]),
    [$8$.],
    [$7$.],
  ),
  loigiai: [
    #align(center)[
      #hinh(w: 5cm, xmin: -2.3, xmax: 2.3, ymin: -2.2, ymax: 2.2, ctx => {
        let R = 1.8
        let pts = ()
        for i in range(6) {
          let g = i * 60deg
          pts.push((R * calc.cos(g), R * calc.sin(g)))
        }
        let D = pts.at(0)
        let C = pts.at(1)
        let B = pts.at(2)
        let A = pts.at(3)
        let F = pts.at(4)
        let E = pts.at(5)
        let O = (0.0, 0.0)

        da-giac(ctx, (A, B, C, D, E, F), mau: sm-blue, day: 1.1pt)
        doan(ctx, A, D, mau: sm-red, day: 1.2pt, dut: true)
        doan(ctx, B, E, mau: sm-gray, day: 0.7pt, dut: true)
        doan(ctx, C, F, mau: sm-gray, day: 0.7pt, dut: true)

        // Vecto OC
        mui-ten(ctx, O, C, mau: sm-amber.darken(20%), day: 1.3pt)

        // Cac vecto cung phuong
        mui-ten(ctx, B, C, mau: sm-green.darken(20%), day: 1.2pt)
        mui-ten(ctx, F, E, mau: sm-green.darken(20%), day: 1.2pt)

        diem(ctx, A, ten: $A$, huong: "trai")
        diem(ctx, B, ten: $B$, huong: "tren-trai")
        diem(ctx, C, ten: $C$, huong: "tren-phai")
        diem(ctx, D, ten: $D$, huong: "phai")
        diem(ctx, E, ten: $E$, huong: "duoi-phai")
        diem(ctx, F, ten: $F$, huong: "duoi-trai")
        diem(ctx, O, ten: $O$, huong: "duoi", mau: sm-gray)
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Quan sát hình lục giác đều $A B C D E F$ tâm $O$.
    Đường thẳng $O C$ trùng với đường chéo chính $F C$ (hoặc $A D$ trong một số cách kẻ, ở đây $O$ là tâm, $O C$ là bán kính).
    Chính xác hơn, đường thẳng chứa $vec(O C)$ là đường chéo chính $F C$.
    Các cạnh song song với $F C$ trong lục giác đều là $A B$ và $E D$.
    
    🔹 *Bước 2:* Các vectơ khác $vec(0)$, có điểm mút là đỉnh của lục giác, cùng phương với $vec(O C)$ (nghĩa là giá của nó song song hoặc trùng với $F C$) bao gồm:
    - Trên đường chéo $F C$: $vec(F C), vec(C F)$ (2 vectơ).
    - Trên cạnh $A B$: $vec(A B), vec(B A)$ (2 vectơ).
    - Trên cạnh $E D$: $vec(E D), vec(D E)$ (2 vectơ).
    Tổng cộng có $2 + 2 + 2 = 6$ vectơ thỏa mãn.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hình chữ nhật $A B C D$ có $A B = 3, B C = 4$. Độ dài của vectơ $vec(A C)$ là:],
  (
    [$5$.],
    True([$5$.]),
    [$7$.],
    [$1$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Trong hình chữ nhật $A B C D$, tam giác $A B C$ là tam giác vuông tại $B$.
    Áp dụng định lí Pythagore, ta có:
    $ A C = sqrt(A B^2 + B C^2) = sqrt(3^2 + 4^2) = sqrt(25) = 5. $
    Vậy độ dài của vectơ $vec(A C)$ là $|vec(A C)| = A C = 5$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác đều $A B C$ cạnh $a$. Mệnh đề nào sau đây đúng?],
  (
    [$vec(A B) = vec(A C)$.],
    [$|vec(A B)| = |vec(B C)| = |vec(C A)| = a$.],
    True([$|vec(A B)| = |vec(B C)| = |vec(C A)| = a$.]),
    [$vec(A B), vec(A C)$ cùng phương.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Tam giác đều có ba cạnh bằng nhau nên độ dài ba đoạn thẳng $A B, B C, C A$ bằng nhau và bằng $a$.
    Độ dài của các vectơ tương ứng chính là độ dài đoạn thẳng:
    $ |vec(A B)| = |vec(B C)| = |vec(C A)| = a. $
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho đoạn thẳng $A B$ có trung điểm $I$. Khẳng định nào sau đây sai?],
  (
    [$vec(I A) = -vec(I B)$.],
    [$|vec(I A)| = |vec(I B)|$.],
    [$vec(I A) + vec(I B) = vec(0)$.],
    True([$vec(I A) = vec(I B)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Vì $I$ là trung điểm của $A B$ nên $I$ nằm giữa $A$ và $B$.
    Khi đó, hai vectơ $vec(I A)$ và $vec(I B)$ ngược hướng.
    Hai vectơ ngược hướng thì không thể bằng nhau (dù có cùng độ dài).
    Khẳng định $vec(I A) = vec(I B)$ là sai.
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hình thang vuông $A B C D$ tại $A$ và $B$ có $A D = 2 a, A B = B C = a$. Độ dài của vectơ $vec(C D)$ là:],
  (
    [$a$.],
    True([$a sqrt(2)$.]),
    [$2 a$.],
    [$a sqrt(3)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Kẻ $C H perp A D$ tại $H$. Vì $A B C H$ là hình chữ nhật (có $3$ góc vuông) nên $C H = A B = a$ và $A H = B C = a$.
    Suy ra $D H = A D - A H = 2 a - a = a$.
    Trong tam giác vuông $C H D$, áp dụng định lí Pythagore:
    $ C D = sqrt(C H^2 + D H^2) = sqrt(a^2 + a^2) = a sqrt(2). $
    Vậy độ dài vectơ $vec(C D)$ là $|vec(C D)| = C D = a sqrt(2)$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Hai lực $vec(F_1), vec(F_2)$ cùng tác dụng vào vật tại điểm $M$, góc giữa hai lực là $90^@$, độ lớn lần lượt $300" N"$ và $400" N"$. Hợp lực tác dụng vào vật có độ lớn là:],
  (
    [$700" N"$.],
    [$100" N"$.],
    True([$500" N"$.]),
    [$1000" N"$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Vì hai lực vuông góc với nhau, hợp lực của chúng tạo thành đường chéo của một hình chữ nhật.
    Độ lớn của hợp lực được tính theo định lí Pythagore:
    $ F = sqrt(F_1^2 + F_2^2) = sqrt(300^2 + 400^2) = 500" N". $
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho ba điểm phân biệt $A, B, C$ thẳng hàng. Điều kiện để $vec(A B)$ và $vec(A C)$ cùng hướng là:],
  (
    [$A$ nằm giữa $B$ và $C$.],
    True([$A$ nằm ngoài đoạn $B C$ và gần $B$ hoặc $C$ hơn, hoặc $B, C$ cùng phía đối với $A$.]),
    [$B$ nằm giữa $A$ và $C$.],
    [$C$ nằm giữa $A$ và $B$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Hai vectơ $vec(A B)$ và $vec(A C)$ cùng hướng khi điểm $A$ không nằm giữa hai điểm $B$ và $C$.
    Nói cách khác, hai điểm $B$ và $C$ phải cùng nằm về một phía đối với điểm $A$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hình vuông $A B C D$ tâm $O$. Các vectơ cùng hướng với $vec(O B)$ là:],
  (
    [$vec(D O), vec(D B)$.],
    True([$vec(D O), vec(D B)$.]),
    [$vec(B O), vec(B D)$.],
    [$vec(O D), vec(B D)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Các vectơ cùng phương với $vec(O B)$ (cùng nằm trên đường thẳng $B D$) và hướng từ $D$ đến $B$ là các vectơ: $vec(D O)$ và $vec(D B)$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 4, reset-counter: true)

#ds(
  [Cho hình bình hành $A B C D$ tâm $O$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([$vec(A B) = vec(D C)$.]),
    [$vec(A D) = vec(C B)$.],
    True([$vec(O A) = -vec(O C)$.]),
    True([$|vec(A C)| = |vec(B D)|$ khi và chỉ khi $A B C D$ là hình chữ nhật.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Vì $A B C D$ là hình bình hành nên $A B parallel D C$, $A B = D C$ và $vec(A B)$ cùng hướng với $vec(D C)$. Do đó $vec(A B) = vec(D C)$.
    
    🔹 *Mệnh đề b) SAI:* Vì $vec(A D) = vec(B C)$ (hai vectơ bằng nhau có cùng hướng). Trong khi $vec(B C)$ và $vec(C B)$ là hai vectơ đối nhau, nên $vec(A D) != vec(C B)$.
    
    🔹 *Mệnh đề c) ĐÚNG:* Trong hình bình hành, hai đường chéo cắt nhau tại trung điểm của mỗi đường. $O$ là trung điểm $A C$ nên $vec(O A)$ và $vec(O C)$ là hai vectơ đối nhau, tức là $vec(O A) = -vec(O C)$.
    
    🔹 *Mệnh đề d) ĐÚNG:* $|vec(A C)| = |vec(B D)| <=> A C = B D$. Hình bình hành có hai đường chéo bằng nhau thì nó là hình chữ nhật.
  ]
)

#ds(
  [Cho tam giác $A B C$, gọi $M, N, P$ lần lượt là trung điểm của $B C, C A, A B$. Xét tính đúng sai:],
  (
    True([Vectơ $vec(A B)$ cùng phương với vectơ $vec(N M)$.]),
    True([Có 6 vectơ khác vectơ-không cùng phương với $vec(A B)$ nằm trên đường thẳng $A B$ có điểm đầu, cuối lấy từ $A, B, P$.]),
    True([Vectơ $vec(A P)$ cùng hướng với $vec(P B)$.]),
    True([$vec(M N) = vec(B P) = vec(P A)$.]),
  ),
  loigiai: [
    #align(center)[
      #hinh(w: 5.5cm, xmin: -0.6, xmax: 3.6, ymin: -0.6, ymax: 2.8, ctx => {
        let B = (0.0, 0.0)
        let C = (3.0, 0.0)
        let A = (1.2, 2.4)
        let M = (1.5, 0.0)
        let N = (2.1, 1.2)
        let P = (0.6, 1.2)

        tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$))
        tam-giac(ctx, M, N, P, mau: sm-blue, day: 1pt, to: sm-blue-light.transparentize(60%))

        mui-ten(ctx, A, B, mau: sm-red, day: 1.2pt)
        mui-ten(ctx, N, M, mau: sm-red, day: 1.2pt)
        mui-ten(ctx, A, P, mau: sm-green.darken(20%), day: 1.2pt)
        mui-ten(ctx, P, B, mau: sm-green.darken(20%), day: 1.2pt)

        diem(ctx, M, ten: $M$, huong: "duoi")
        diem(ctx, N, ten: $N$, huong: "tren-phai")
        diem(ctx, P, ten: $P$, huong: "tren-trai")
      })
    ]

    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Vì $M, N$ là trung điểm $B C, C A$ nên $M N$ là đường trung bình của $triangle A B C$, suy ra $M N parallel A B$. Do đó $vec(A B)$ và $vec(N M)$ cùng phương.
    
    🔹 *Mệnh đề b) ĐÚNG:* Trên đường thẳng $A B$, $3$ điểm $A, B, P$ phân biệt tạo ra $A_3^2 = 6$ vectơ: $vec(A B), vec(B A), vec(A P), vec(P A), vec(P B), vec(B P)$. Các vectơ này đều cùng phương với $vec(A B)$.
    
    🔹 *Mệnh đề c) ĐÚNG:* Vì $P$ là trung điểm $A B$ nên $P$ nằm giữa $A$ và $B$. Do đó $vec(A P)$ và $vec(P B)$ cùng hướng.
    
    🔹 *Mệnh đề d) ĐÚNG:* Tứ giác $M N P B$ là hình bình hành (do $M N parallel P B$ và $M N = P B = (A B)/2$), nên $vec(M N) = vec(B P)$. Mặt khác $vec(B P)$ ngược hướng với $vec(P A)$ (nếu lấy đúng thì $vec(M N) = vec(B P) = vec(P A)$? Không, $vec(B P)$ cùng hướng với $vec(P A)$ vì $P$ ở giữa $A, B$, $vec(P A)$ hướng từ $P$ về $A$, $vec(B P)$ hướng từ $B$ về $P$. Khoan, hai vectơ này hướng về cùng phía, là cùng hướng! Và cùng độ lớn nên bằng nhau). Do đó $vec(M N) = vec(B P) = vec(P A)$.
  ]
)

#ds(
  [Một mảnh vườn hình chữ nhật $25" m" times 16" m"$, để dành lối đi xung quanh rộng $0,5" m"$. Xét tính đúng sai:],
  (
    True([Các cạnh lối đi song song với các cạnh của mảnh vườn.]),
    True([Độ dài đường chéo mảnh vườn là $sqrt(25^2 + 16^2) = sqrt(881) approx 29,68" m" < 30" m"$.]),
    True([Chiều dài phần trồng rau là $25 - 1 = 24" m"$.]),
    True([Chi phí bón phân được tính dựa trên diện tích đất trồng rau.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Lối đi xung quanh cách đều nên các cạnh của lối đi song song với các cạnh của mảnh vườn.
    
    🔹 *Mệnh đề b) ĐÚNG:* Đường chéo $d = sqrt(25^2 + 16^2) = sqrt(881) approx 29.68" m" < 30" m"$.
    
    🔹 *Mệnh đề c) ĐÚNG:* Hai bên đều có lối đi rộng $0.5" m"$, nên chiều dài phần trồng rau bị thu hẹp hai bên: $25 - 2 dot 0.5 = 24" m"$.
    
    🔹 *Mệnh đề d) ĐÚNG:* Phân bón chỉ dùng cho diện tích đất thực sự trồng rau.
  ]
)

#ds(
  [Cho tam giác đều $A B C$ cạnh $a$. Gọi $H$ là trung điểm $B C$. Xét tính đúng sai:],
  (
    True([Độ dài vectơ $vec(A H)$ bằng $(a sqrt(3))/2$.]),
    [$vec(A B) = vec(A C)$.],
    True([$vec(H B) = -vec(H C)$.]),
    True([$|vec(B A) - vec(B C)| = a$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Vì tam giác $A B C$ đều, $A H$ là trung tuyến nên cũng là đường cao. 
    Độ dài đường cao: $|vec(A H)| = A H = (a sqrt(3))/2$.
    
    🔹 *Mệnh đề b) SAI:* $vec(A B)$ và $vec(A C)$ là hai vectơ không cùng hướng nên không thể bằng nhau.
    
    🔹 *Mệnh đề c) ĐÚNG:* Vì $H$ là trung điểm $B C$ nên $vec(H B)$ và $vec(H C)$ là hai vectơ đối nhau, suy ra $vec(H B) = -vec(H C)$.
    
    🔹 *Mệnh đề d) ĐÚNG:* $vec(B A) - vec(B C) = vec(C A)$. Suy ra $|vec(B A) - vec(B C)| = |vec(C A)| = a$.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho ngũ giác $A B C D E$. Có bao nhiêu vectơ khác vectơ-không có điểm đầu và điểm cuối là các đỉnh của ngũ giác?],
  [20],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Số vectơ khác vectơ-không được tạo từ $5$ đỉnh của ngũ giác là: $A_5^2 = 5 dot 4 = 20$.
    
    ✅ *Đáp số:* $20$.
  ]
)

#tln(
  dir: "ngang",
  [Trên biển Đông, tàu đi từ $A$ theo hướng $N 20^@ W$ vận tốc $30" km/h"$. Sau $5$ giờ tàu đến $B$. Khoảng cách $A B$ là bao nhiêu km?],
  [150],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Khoảng cách $A B$ chính là quãng đường tàu đi được trong $5$ giờ:
    $ A B = v dot t = 30 dot 5 = 150" km". $
    
    ✅ *Đáp số:* $150$.
  ]
)

#tln(
  dir: "ngang",
  [Hai lực vuông góc có độ lớn $60" N"$ và $80" N"$ cùng tác dụng vào một chất điểm. Cường độ lực tổng hợp là bao nhiêu Newton?],
  [100],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Vì hai lực vuông góc với nhau, hợp lực được tính theo định lí Pythagore:
    $ F = sqrt(F_1^2 + F_2^2) = sqrt(60^2 + 80^2) = 100" N". $
    
    ✅ *Đáp số:* $100$.
  ]
)

#tln(
  dir: "ngang",
  [Một con tàu đi về hướng Đông $10" km"$ rồi rẽ về hướng Nam $10" km"$ tới đảo $B$. Khoảng cách từ vị trí xuất phát đến đảo $B$ là bao nhiêu km (làm tròn đến một chữ số thập phân)?],
  [14,1],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Hành trình của con tàu tạo thành hai cạnh góc vuông của một tam giác vuông (Đông vuông góc với Nam).
    Khoảng cách từ vị trí xuất phát đến đảo $B$ là cạnh huyền của tam giác vuông này:
    $ d = sqrt(10^2 + 10^2) = 10 sqrt(2) approx 14.1" km". $
    
    ✅ *Đáp số:* $14.1$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hình vuông $A B C D$ cạnh $6" cm"$. Tính độ dài của vectơ $vec(A C)$ (làm tròn đến hàng phần mười).],
  [8,5],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Độ dài vectơ $vec(A C)$ chính là độ dài đường chéo hình vuông cạnh $6$:
    $ |vec(A C)| = A C = 6 sqrt(2) approx 8.5" cm". $
    
    ✅ *Đáp số:* $8.5$.
  ]
)

#tln(
  dir: "ngang",
  [Hai ca nô chạy ngược chiều và xuôi chiều trên sông với vận tốc riêng bằng nhau $v_0 = 12,8" km/h"$, vận tốc dòng nước $3,2" km/h"$. Vận tốc thực tế của ca nô xuôi dòng là bao nhiêu km/h?],
  [16],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Khi đi xuôi dòng, vận tốc thực tế của ca nô bằng vận tốc riêng cộng với vận tốc dòng nước:
    $ v = v_0 + v_n = 12.8 + 3.2 = 16" km/h". $
    
    ✅ *Đáp số:* $16$.
  ]
)
