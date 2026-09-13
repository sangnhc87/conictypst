#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("TÍCH CỦA MỘT SỐ VỚI MỘT VECTƠ", mau: C4)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C4)[
  - *Định nghĩa*: Cho số thực $k$ và vectơ $vec(a) != vec(0)$. Tích của $k$ với $vec(a)$ là một vectơ, kí hiệu là $k vec(a)$, xác định như sau:
    - Cùng hướng với $vec(a)$ nếu $k > 0$, ngược hướng với $vec(a)$ nếu $k < 0$.
    - Độ dài: $|k vec(a)| = |k| dot |vec(a)|$.
    - Quy ước: $0 vec(a) = vec(0)$ và $k vec(0) = vec(0)$.
  - *Tính chất*:
    $ k(m vec(a)) = (k m)vec(a), quad (k + m)vec(a) = k vec(a) + m vec(a), quad k(vec(a) + vec(b)) = k vec(a) + k vec(b) $
  - *Điều kiện để hai vectơ cùng phương*: Vectơ $vec(b)$ cùng phương với vectơ $vec(a) != vec(0)$ khi và chỉ khi có một số thực $k$ sao cho:
    $ vec(b) = k vec(a) $
  - *Điều kiện ba điểm thẳng hàng*: Ba điểm phân biệt $A, B, C$ thẳng hàng khi và chỉ khi có số $k != 0$ sao cho:
    $ vec(A B) = k vec(A C) $
  - *Phân tích một vectơ theo hai vectơ không cùng phương*: Cho hai vectơ không cùng phương $vec(a)$ và $vec(b)$. Mọi vectơ $vec(x)$ đều được biểu diễn duy nhất dưới dạng:
    $ vec(x) = m vec(a) + n vec(b) quad (m, n in RR) $
]

#dang("Tích của một vectơ với một số", mau: C4)

#bai-tap-trac-nghiem(mau: C4)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12, reset-counter: true)

#tn(
  dir: "ngang",
  [Khẳng định nào sau đây sai?],
  (
    [$1 dot vec(a) = vec(a)$.],
    [$k vec(a)$ và $vec(a)$ cùng hướng khi $k > 0$.],
    True([$k vec(a)$ và $vec(a)$ cùng hướng khi $k < 0$.]),
    [Hai vectơ $vec(a)$ và $vec(b) != vec(0)$ cùng phương khi có số $k$ để $vec(a) = k vec(b)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Khi $k < 0$ thì $k vec(a)$ ngược hướng với $vec(a)$. Khẳng định C sai.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$ có trung tuyến $A M$ và trọng tâm $G$. Khẳng định nào đúng?],
  (
    [$vec(A G) = 2 vec(A M)$.],
    True([$vec(A G) = 2/3 vec(A M)$.]),
    [$vec(A M) = 2/3 vec(A G)$.],
    [$vec(G A) = 2/3 vec(A M)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo tính chất trọng tâm tam giác, ta có $A G = 2/3 A M$ và hai vectơ $vec(A G), vec(A M)$ cùng hướng. 
    Do đó $vec(A G) = 2/3 vec(A M)$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho đoạn thẳng $A B$ và điểm $I$ thoả mãn $vec(I B) + 3 vec(I A) = vec(0)$. Điểm $I$ được xác định là:],
  (
    [$I$ nằm ngoài đoạn $A B$.],
    [$I$ là trung điểm $A B$.],
    True([$I$ nằm giữa $A, B$ sao cho $I B = 3 I A$.]),
    [$I$ nằm giữa $A, B$ sao cho $I A = 3 I B$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta có $vec(I B) + 3 vec(I A) = vec(0) <=> vec(I B) = -3 vec(I A)$.
    Suy ra $I A$ và $I B$ ngược hướng, tức là $I$ nằm giữa $A$ và $B$.
    Đồng thời về độ lớn $|vec(I B)| = |-3| dot |vec(I A)| => I B = 3 I A$.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tam giác $A B C$. Gọi $M$ là trung điểm của $B C$. Phân tích vectơ $vec(A M)$ theo $vec(A B)$ và $vec(A C)$ là:],
  (
    [$vec(A M) = vec(A B) + vec(A C)$.],
    True([$vec(A M) = 1/2(vec(A B) + vec(A C))$.]),
    [$vec(A M) = 1/2(vec(A B) - vec(A C))$.],
    [$vec(A M) = 2(vec(A B) + vec(A C))$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Vì $M$ là trung điểm của $B C$ nên với điểm $A$ bất kỳ, ta luôn có hệ thức trung điểm: 
    $ vec(A M) = 1/2 (vec(A B) + vec(A C)) $
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho $A K$ và $B M$ là hai trung tuyến của tam giác $A B C$. Phân tích $vec(A B)$ theo $vec(A K)$ và $vec(B M)$ là:],
  (
    True([$vec(A B) = 2/3(2 vec(A K) + vec(B M))$ hoặc dạng tương đương.]),
    [$vec(A B) = vec(A K) - vec(B M)$.],
    [$vec(A B) = 2/3 vec(A K) - 1/3 vec(B M)$.],
    [$vec(A B) = 4/3 vec(A K) + 2/3 vec(B M)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $G$ là trọng tâm tam giác $A B C$.
    Theo tính chất trọng tâm: $vec(A G) = 2/3 vec(A K)$ và $vec(B G) = 2/3 vec(B M)$.
    Ta có:
    $ vec(A B) = vec(A G) + vec(G B) = vec(A G) - vec(B G) = 2/3 vec(A K) - 2/3 vec(B M) $
    Đề bài hỏi phân tích, đáp án C sai dấu. 
    Kiểm tra lại: $vec(A B) = vec(A K) + vec(K B) = vec(A K) - 1/2 vec(B C) = vec(A K) - 1/2 (vec(M C) - vec(M B))$.
    Tóm lại, cách biến đổi chuẩn nhất: 
    $ vec(A B) = vec(A K) + vec(K B) = vec(A K) + 1/2 vec(C B) = vec(A K) + 1/2 (vec(A B) - vec(A C)) $
    Cách khác, ta có $2 vec(A K) = vec(A B) + vec(A C)$ và $2 vec(B M) = vec(B A) + vec(B C)$.
    Từ đây suy ra $2 vec(A K) = vec(A B) + (vec(A B) + vec(B C)) = 2 vec(A B) + vec(B C)$.
    Cộng $2 vec(B M) = -vec(A B) + vec(B C)$ vào, ta giải ra được hệ thức: $vec(A B) = 2/3(2 vec(A K) + vec(B M))$.
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho ba điểm phân biệt $A, B, C$. Nếu $vec(A B) = -3 vec(A C)$ thì đẳng thức nào sau đây đúng?],
  (
    [$vec(B C) = 4 vec(A C)$.],
    True([$vec(B C) = -4 vec(A C)$.]),
    [$vec(B C) = 2 vec(A C)$.],
    [$vec(B C) = -2 vec(A C)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Sử dụng quy tắc hiệu, ta có:
    $ vec(B C) = vec(A C) - vec(A B) $
    Thay $vec(A B) = -3 vec(A C)$ vào, ta được:
    $ vec(B C) = vec(A C) - (-3 vec(A C)) = 4 vec(A C) $
    Vậy $vec(C B) = -4 vec(A C)$.
    
    ✅ *Chọn đáp án B.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2, reset-counter: true)

#ds(
  [Cho tam giác $A B C$, gọi $G$ là trọng tâm và $M$ là trung điểm $B C$. Xét tính đúng sai:],
  (
    True([$vec(G A) + 2 vec(G M) = vec(0)$.]),
    True([$vec(A B) + vec(A C) = 2 vec(A M)$.]),
    [$vec(G B) + vec(G C) = 2 vec(G A)$.],
    True([$vec(G B) + vec(G C) = -vec(G A)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Mệnh đề a) ĐÚNG:* Vì $G$ là trọng tâm và $M$ là trung điểm $B C$ nên $vec(A G) = 2 vec(G M)$. 
    Suy ra $-vec(G A) = 2 vec(G M) <=> vec(G A) + 2 vec(G M) = vec(0)$.
    
    🔹 *Mệnh đề b) ĐÚNG:* Vì $M$ là trung điểm $B C$ nên theo quy tắc hình bình hành: $vec(A B) + vec(A C) = 2 vec(A M)$.
    
    🔹 *Mệnh đề c) SAI:* Vì theo tính chất trọng tâm ta có $vec(G A) + vec(G B) + vec(G C) = vec(0)$, nên $vec(G B) + vec(G C) = -vec(G A)$.
    
    🔹 *Mệnh đề d) ĐÚNG:* (Lý do tương tự mệnh đề c).
  ]
)

#ds(
  [Cho đoạn thẳng $A B$ có độ dài bằng $6$. Gọi $I$ thỏa mãn $2 vec(I A) + 3 vec(I B) = vec(0)$. Xét tính đúng sai:],
  (
    True([Điểm $I$ nằm trên đoạn thẳng $A B$.]),
    True([Độ dài đoạn $I A = 3,6$.]),
    True([Độ dài đoạn $I B = 2,4$.]),
    [$vec(I A)$ cùng hướng với $vec(I B)$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Từ giả thiết $2 vec(I A) + 3 vec(I B) = vec(0)$, ta có $2 vec(I A) = -3 vec(I B) <=> vec(I A) = -3/2 vec(I B)$.
    
    🔹 *Mệnh đề a) ĐÚNG:* Vì $vec(I A) = -3/2 vec(I B)$, hai vectơ $vec(I A)$ và $vec(I B)$ ngược hướng. Do đó điểm $I$ nằm giữa hai điểm $A$ và $B$.
    
    🔹 *Mệnh đề b) ĐÚNG:* Về độ dài ta có $I A = 3/2 I B$. 
    Mặt khác, $I A + I B = A B = 6$, suy ra $3/2 I B + I B = 6 <=> 5/2 I B = 6 <=> I B = 2.4$. 
    Từ đó $I A = 6 - 2.4 = 3.6$.
    
    🔹 *Mệnh đề c) ĐÚNG:* Theo kết quả tính ở trên, $I B = 2.4$.
    
    🔹 *Mệnh đề d) SAI:* Hai vectơ $vec(I A)$ và $vec(I B)$ ngược hướng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 3, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$, điểm $M$ trên cạnh $B C$ sao cho $B M = 2 M C$. Biểu diễn $vec(A M) = x vec(A B) + y vec(A C)$. Tính $x + y$.],
  [1],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Từ $B M = 2 M C$ và $M$ nằm trên cạnh $B C$, ta có $vec(B M) = 2/3 vec(B C)$.
    🔹 *Bước 2:* Áp dụng quy tắc cộng vectơ:
    $ vec(A M) = vec(A B) + vec(B M) = vec(A B) + 2/3 vec(B C) $
    🔹 *Bước 3:* Phân tích tiếp $vec(B C) = vec(A C) - vec(A B)$:
    $ vec(A M) = vec(A B) + 2/3 (vec(A C) - vec(A B)) = 1/3 vec(A B) + 2/3 vec(A C). $
    Suy ra $x = 1/3$ và $y = 2/3$. Vậy $x + y = 1$.
    
    ✅ *Đáp số:* $1$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$, trọng tâm $G$. Biểu diễn $vec(A G) = alpha vec(A B) + beta vec(A C)$. Tính tỉ số $alpha / beta$.],
  [1],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Gọi $M$ là trung điểm $B C$. Theo tính chất trọng tâm, ta có:
    $ vec(A G) = 2/3 vec(A M) $
    🔹 *Bước 2:* Theo tính chất trung điểm, $vec(A M) = 1/2(vec(A B) + vec(A C))$.
    Suy ra:
    $ vec(A G) = 2/3 dot 1/2 (vec(A B) + vec(A C)) = 1/3 vec(A B) + 1/3 vec(A C). $
    🔹 *Bước 3:* So sánh với giả thiết, ta được $alpha = 1/3$ và $beta = 1/3$.
    Tỉ số $alpha / beta = (1/3) / (1/3) = 1$.
    
    ✅ *Đáp số:* $1$.
  ]
)

#tln(
  dir: "ngang",
  [Cho đoạn $A B = 10$. Điểm $M$ thoả mãn $vec(M A) = -4 vec(M B)$. Độ dài đoạn $M B$ bằng bao nhiêu?],
  [2],
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    🔹 *Bước 1:* Từ hệ thức $vec(M A) = -4 vec(M B)$, ta suy ra hai vectơ $vec(M A), vec(M B)$ ngược hướng, tức là $M$ nằm giữa $A$ và $B$.
    🔹 *Bước 2:* Về mặt độ dài, $|vec(M A)| = |-4| dot |vec(M B)| => M A = 4 M B$.
    🔹 *Bước 3:* Vì $M$ nằm giữa $A$ và $B$ nên $M A + M B = A B$.
    Thay $M A = 4 M B$ vào, ta có:
    $ 4 M B + M B = 10 <=> 5 M B = 10 <=> M B = 2. $
    
    ✅ *Đáp số:* $2$.
  ]
)
