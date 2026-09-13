#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("VECTƠ TRONG MẶT PHẲNG TOẠ ĐỘ", mau: C4)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C4)[
  - *Toạ độ của vectơ*: Trong mặt phẳng toạ độ $(O; vec(i), vec(j))$, với mỗi vectơ $vec(u)$, có duy nhất cặp số $(x; y)$ sao cho:
    $ vec(u) = x vec(i) + y vec(j) $
    Cặp số $(x; y)$ gọi là toạ độ của vectơ $vec(u)$, kí hiệu $vec(u) = (x; y)$.
  - *Toạ độ của điểm*: Điểm $M$ có toạ độ $(x; y)$ khi và chỉ khi $vec(O M) = (x; y)$.
  - *Liên hệ toạ độ điểm và vectơ*: Với $A(x_A; y_A)$ và $B(x_B; y_B)$:
    $ vec(A B) = (x_B - x_A; y_B - y_A) $
  - *Các phép toán toạ độ*: Cho $vec(u) = (x; y), vec(v) = (x'; y')$ và số thực $k$:
    - $vec(u) + vec(v) = (x + x'; y + y')$.
    - $vec(u) - vec(v) = (x - x'; y - y')$.
    - $k vec(u) = (k x; k y)$.
    - $vec(u) = vec(v) <=> cases(x = x', y = y')$.
    - $vec(u)$ cùng phương với $vec(v) (vec(v) != vec(0)) <=> x/x' = y/y'$ (nếu $x', y' != 0$).
  - *Toạ độ trung điểm và trọng tâm*:
    - Trung điểm $I$ của đoạn thẳng $A B$: $I((x_A + x_B)/2; (y_A + y_B)/2)$.
    - Trọng tâm $G$ của tam giác $A B C$: $G((x_A + x_B + x_C)/3; (y_A + y_B + y_C)/3)$.
]

#dang("Toạ độ của điểm và toạ độ của vectơ", mau: C4)

#bai-tap-trac-nghiem(mau: C4)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12, reset-counter: true)

#tn(
  dir: "ngang",
  [Trong mặt phẳng toạ độ $O x y$, cho vectơ $vec(a) = -2 vec(j)$. Toạ độ vectơ $vec(a)$ là:],
  (
    [$(-2; 0)$.],
    True([$(0; -2)$.]),
    [$(2; 0)$.],
    [$(0; 2)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta có $vec(a) = 0 vec(i) - 2 vec(j)$. 
    Suy ra toạ độ của vectơ là $vec(a) = (0; -2)$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $A(1; 3), B(4; 2)$. Toạ độ của vectơ $vec(A B)$ là:],
  (
    [$(5; 5)$.],
    True([$(3; -1)$.]),
    [$(-3; 1)$.],
    [$(3; 1)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng công thức toạ độ vectơ, ta có:
    $ vec(A B) = (x_B - x_A; y_B - y_A) = (4 - 1; 2 - 3) = (3; -1) $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $vec(u) = (2; -3)$ và $vec(v) = (1; 4)$. Toạ độ của vectơ $vec(u) + vec(v)$ là:],
  (
    [$(1; -7)$.],
    True([$(3; 1)$.]),
    [$(3; -7)$.],
    [$(1; 1)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta có:
    $ vec(u) + vec(v) = (2 + 1; -3 + 4) = (3; 1) $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $A(2; -1), B(4; 3)$. Toạ độ trung điểm $I$ của đoạn $A B$ là:],
  (
    [$(6; 2)$.],
    True([$(3; 1)$.]),
    [$(1; 2)$.],
    [$(2; 4)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng công thức toạ độ trung điểm:
    $ cases(
      x_I = (x_A + x_B)/2 = (2 + 4)/2 = 3,
      y_I = (y_A + y_B)/2 = (-1 + 3)/2 = 1
    ) => I(3; 1) $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $triangle A B C$ có $A(1; 2), B(-2; 3), C(4; 1)$. Toạ độ trọng tâm $G$ của tam giác là:],
  (
    True([$(1; 2)$.]),
    [$(3; 6)$.],
    [$(1; 3)$.],
    [$(2; 1)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng công thức toạ độ trọng tâm:
    $ cases(
      x_G = (x_A + x_B + x_C)/3 = (1 - 2 + 4)/3 = 1,
      y_G = (y_A + y_B + y_C)/3 = (2 + 3 + 1)/3 = 2
    ) => G(1; 2) $
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $vec(a) = (2; -4)$. Vectơ nào sau đây cùng phương với $vec(a)$?],
  (
    [$(1; 2)$.],
    True([$(-1; 2)$.]),
    [$(2; 4)$.],
    [$(-2; -4)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Kiểm tra tỉ lệ các toạ độ của vectơ ở phương án B với $vec(a)$, ta có:
    $ (-1)/2 = 2/(-4) = -1/2 $
    Hai vectơ có toạ độ tỉ lệ nên chúng cùng phương.
    
    ✅ *Chọn đáp án B.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2, reset-counter: true)

#ds(
  [Trong mặt phẳng toạ độ $O x y$, cho $A(2; 3), B(-1; 5), C(4; 1)$. Xét tính đúng sai:],
  (
    True([$vec(A B) = (-3; 2)$.]),
    True([$vec(A C) = (2; -2)$.]),
    [Ba điểm $A, B, C$ thẳng hàng.],
    True([Trọng tâm tam giác $A B C$ có toạ độ là $(5/3; 3)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Ta có $vec(A B) = (-1 - 2; 5 - 3) = (-3; 2)$.
    
    🔹 *Mệnh đề b) ĐÚNG:* Ta có $vec(A C) = (4 - 2; 1 - 3) = (2; -2)$.
    
    🔹 *Mệnh đề c) SAI:* Xét tỉ số toạ độ hai vectơ $vec(A B)$ và $vec(A C)$: 
    $ (-3)/2 != 2/(-2) $
    Suy ra $vec(A B), vec(A C)$ không cùng phương, do đó $A, B, C$ không thẳng hàng.
    
    🔹 *Mệnh đề d) ĐÚNG:* Trọng tâm tam giác $A B C$ có toạ độ:
    $ G ((2 - 1 + 4)/3; (3 + 5 + 1)/3) = (5/3; 3). $
  ]
)

#ds(
  [Cho $vec(u) = (2; -1), vec(v) = (x; 3)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([$2 vec(u) = (4; -2)$.]),
    True([Để $vec(u)$ cùng phương với $vec(v)$ thì $x = -6$.]),
    [Khi $x = 1$ thì $vec(u) + vec(v) = (3; 4)$.],
    True([Độ dài của $vec(u)$ là $sqrt(5)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Ta có $2 vec(u) = 2(2; -1) = (4; -2)$.
    
    🔹 *Mệnh đề b) ĐÚNG:* $vec(u)$ cùng phương với $vec(v)$ khi $x/2 = 3/(-1) => x = -6$.
    
    🔹 *Mệnh đề c) SAI:* Khi $x = 1$, ta có $vec(v) = (1; 3)$. 
    Khi đó $vec(u) + vec(v) = (2 + 1; -1 + 3) = (3; 2) != (3; 4)$.
    
    🔹 *Mệnh đề d) ĐÚNG:* $|vec(u)| = sqrt(2^2 + (-1)^2) = sqrt(5)$.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 3, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho $vec(u) = 2 vec(i) - vec(j)$ và $vec(v) = vec(i) + x vec(j)$. Xác định $x$ để $vec(u)$ và $vec(v)$ cùng phương.],
  [-0,5],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Chuyển giả thiết về toạ độ: $vec(u) = (2; -1)$ và $vec(v) = (1; x)$.
    🔹 *Bước 2:* Để hai vectơ cùng phương thì toạ độ của chúng phải tỉ lệ với nhau.
    $ 2/1 = (-1)/x <=> 2 x = -1 <=> x = -1/2 = -0.5 $
    
    ✅ *Đáp số:* $-0.5$.
  ]
)

#tln(
  dir: "ngang",
  [Cho $A(1; 2), B(3; 8)$. Toạ độ điểm $M$ trên trục hoành sao cho $A, B, M$ thẳng hàng là $(x_M; 0)$. Tìm $x_M$.],
  [0,33],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tính toạ độ các vectơ: $vec(A B) = (2; 6)$ và $vec(A M) = (x_M - 1; -2)$.
    🔹 *Bước 2:* Ba điểm $A, B, M$ thẳng hàng khi $vec(A B)$ và $vec(A M)$ cùng phương.
    $ (x_M - 1)/2 = (-2)/6 <=> x_M - 1 = -2/3 <=> x_M = 1/3 $
    Ta lấy giá trị xấp xỉ là $0.33$.
    
    ✅ *Đáp số:* $0.33$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hình bình hành $A B C D$ có $A(1; 1), B(3; 5), C(7; 4)$. Toạ độ đỉnh $D$ là $(x_D; y_D)$. Tính $x_D + y_D$.],
  [5],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Tứ giác $A B C D$ là hình bình hành khi $vec(A D) = vec(B C)$.
    🔹 *Bước 2:* Ta có $vec(A D) = (x_D - 1; y_D - 1)$ và $vec(B C) = (7 - 3; 4 - 5) = (4; -1)$.
    $ cases(
      x_D - 1 = 4,
      y_D - 1 = -1
    ) <=> cases(
      x_D = 5,
      y_D = 0
    ) $
    🔹 *Bước 3:* Vậy $D(5; 0)$. Suy ra $x_D + y_D = 5$.
    
    ✅ *Đáp số:* $5$.
  ]
)
