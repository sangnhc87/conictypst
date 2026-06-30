#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 4",
  exam-title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 01)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho ba điểm $A$, $B$, $C$ không thẳng hàng và một điểm $S$ nằm ngoài mặt phẳng $(A B C)$. Có bao nhiêu mặt phẳng phân biệt được tạo thành từ $4$ điểm đã cho?],
    (
        [$3$ mặt phẳng.],
        True([$4$ mặt phẳng.]),
        [$5$ mặt phẳng.],
        [$6$ mặt phẳng.]
    ),
    fig: canvas(length: 1.3cm, {
      import draw: *
      let S = (0.5, 3.0)
      let A = (-1.5, 0.5)
      let B = (2.0, 0.5)
      let C = (0.0, -0.8)
      
      // Hidden edge
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      // Visible edges
      line(S, A, stroke: 1pt + black)
      line(S, B, stroke: 1pt + black)
      line(S, C, stroke: 1pt + black)
      line(A, C, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      
      // Points and Labels
      circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.35), $S$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.35, B.at(1) + 0.2), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) - 0.1, C.at(1) - 0.35), $C$, size: 10pt)
    }),
    fig-pos: "center",
    loigiai: [
        Từ 4 điểm không đồng phẳng $S, A, B, C$, ta tạo được các mặt phẳng phân biệt là:
        - $(S A B)$, $(S B C)$, $(S C A)$ và $(A B C)$.
        Vậy có tất cả 4 mặt phẳng phân biệt.
    ]
)

// TN 2
#tn([Trong không gian, cho hai đường thẳng chéo nhau $a$ và $b$. Mệnh đề nào sau đây là đúng?],
    (
        [$a$ và $b$ cùng nằm trên một mặt phẳng.],
        [$a$ và $b$ cắt nhau tại một điểm chung.],
        True([Không tồn tại mặt phẳng nào chứa cả $a$ và $b$.]),
        [$a$ và $b$ song song với nhau.]
    ),
    loigiai: [
        Theo định nghĩa, hai đường thẳng chéo nhau là hai đường thẳng không cùng nằm trong bất kỳ mặt phẳng nào.
        Do đó, không tồn tại mặt phẳng chứa cả $a$ và $b$.
    ]
)

// TN 3
#tn([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Gọi $M$, $N$ lần lượt là trung điểm của các cạnh $S A$ và $S D$. Đường thẳng $M N$ song song với đường thẳng nào sau đây?],
    (
        [$S B$.],
        [$B C$.],
        True([$A D$.]),
        [$C D$.]
    ),
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.0, 0.8)
      let B = (-2.2, -0.6)
      let C = (1.8, -0.6)
      let D = (3.0, 0.8)
      let S = (-1.0, 3.0)
      
      let M = (-1.0, 1.9)
      let N = (1.0, 1.9)
      
      // Hidden edges
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges
      line(S, B, stroke: 1pt + black)
      line(S, C, stroke: 1pt + black)
      line(S, D, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      
      // Points and Labels
      circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.35), $S$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) - 0.3, B.at(1) - 0.3), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.3, C.at(1) - 0.3), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) + 0.35, D.at(1) + 0.2), $D$, size: 10pt)
      
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.35, M.at(1) + 0.2), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) + 0.35, N.at(1) + 0.2), $N$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Trong tam giác $S A D$, $M N$ là đường trung bình ứng với cạnh $A D$.
        Do đó, $M N parallel A D$.
    ]
)

// TN 4
#tn([Mái nhà của một nhà xưởng công nghiệp được cấu tạo từ các kèo thép hình tam giác $S B C$. Trên các kèo này, người ta gác các thanh xà gồ dọc song song với nhau để lợp tôn. Nếu đường thẳng chứa xà gồ thứ nhất là $d_1$ và đường thẳng chứa xà gồ thứ hai là $d_2$, khi đó mối quan hệ giữa $d_1$ và $d_2$ trong thiết kế kết cấu là gì?],
    (
        [Chéo nhau.],
        [Cắt nhau.],
        True([Song song.]),
        [Trùng nhau.]
    ),
    loigiai: [
        Các xà gồ nâng đỡ mái tôn được đặt song song với nhau để phân bổ lực đều và tạo khung phẳng lợp mái. Do đó, hai đường thẳng $d_1$ và $d_2$ song song với nhau.
    ]
)

// TN 5
#tn([Cho hình thang $A B C D$ trong không gian có $A B parallel C D$. Gọi $I, J$ lần lượt là trung điểm của $A D$ và $B C$. Giao tuyến của hai mặt phẳng $(S A B)$ và $(S C D)$ (với $S$ không nằm trên mặt phẳng hình thang) là đường thẳng nào sau đây?],
    (
        [Đường thẳng qua $S$ song song với $A D$.],
        [Đường thẳng qua $S$ song song với $B C$.],
        True([Đường thẳng qua $S$ song song với $A B$.]),
        [Đường thẳng qua $S$ vuông góc với $A B$.]
    ),
    loigiai: [
        Hai mặt phẳng $(S A B)$ và $(S C D)$ có:
        - Điểm chung duy nhất hiện tại là $S$.
        - Lần lượt chứa hai đường thẳng song song là $A B$ và $C D$.
        Do đó, giao tuyến của chúng là đường thẳng đi qua $S$ và song song với $A B$ (hoặc $C D$).
    ]
)

// TN 6
#tn([Để làm giá đỡ cho kệ hàng hóa sát tường, người thợ gắn thanh thép $A B$ nằm ngang song song với mặt sàn phẳng. Tiếp theo, anh ta gắn thêm một thanh chống chịu lực $M N$ có đầu $M$ trên tường, đầu $N$ trên thanh $A B$. Biết mặt sàn là mặt phẳng $(P)$, tường là mặt phẳng $(Q)$ cắt nhau theo giao tuyến $d$. Khẳng định nào sau đây là đúng về vị trí của đường thẳng $A B$ và giao tuyến $d$?],
    (
        [$A B$ và $d$ cắt nhau.],
        True([$A B$ song song với $d$.]),
        [$A B$ và $d$ chéo nhau.],
        [$A B$ vuông góc với $d$.]
    ),
    loigiai: [
        Thanh thép $A B$ nằm ngang song song với mặt sàn $(P)$ và nằm trong mặt phẳng tường $(Q)$.
        Theo tính chất: Nếu đường thẳng $A B$ song song với mặt phẳng $(P)$ và nằm trong mặt phẳng $(Q)$ cắt $(P)$ theo giao tuyến $d$, thì $A B parallel d$.
    ]
)

// TN 7
#tn([Cho đường thẳng $a$ song song với mặt phẳng $(alpha)$. Nếu mặt phẳng $(beta)$ chứa đường thẳng $a$ và cắt $(alpha)$ theo giao tuyến $b$ thì mối quan hệ giữa $a$ và $b$ là gì?],
    (
        [Cắt nhau.],
        [Chéo nhau.],
        True([Song song.]),
        [Trùng nhau.]
    ),
    loigiai: [
        Đây là định lý về giao tuyến của đường thẳng song song với mặt phẳng:
        Nếu đường thẳng $a$ song song với mặt phẳng $(alpha)$ thì mọi mặt phẳng $(beta)$ chứa $a$ và cắt $(alpha)$ theo giao tuyến $b$ sẽ có $a parallel b$.
    ]
)

// TN 8
#tn([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình thang với các cạnh đáy là $A B$ và $C D$. Gọi $d$ là giao tuyến của hai mặt phẳng $(S A B)$ and $(S C D)$. Khẳng định nào sau đây đúng?],
    (
        [$d$ song song với $S A$.],
        [$d$ song song với $S D$.],
        True([$d$ song song với $A B$ và $C D$.]),
        [$d$ đi qua trung điểm của $A D$.]
    ),
    loigiai: [
        Hai mặt phẳng $(S A B)$ và $(S C D)$ có điểm chung là $S$ và lần lượt chứa hai đường thẳng song song là $A B$ và $C D$.
        Do đó, giao tuyến $d$ là đường thẳng đi qua $S$ và song song với $A B, C D$.
    ]
)

// TN 9
#tn([Trong không gian, cho hai đường thẳng chéo nhau $a$ và $b$. Có bao nhiêu mặt phẳng chứa đường thẳng $a$ và song song với đường thẳng $b$?],
    (
        [Không có mặt phẳng nào.],
        True([Có duy nhất một mặt phẳng.]),
        [Có hai mặt phẳng.],
        [Có vô số mặt phẳng.]
    ),
    loigiai: [
        Qua đường thẳng $a$ chéo với $b$, ta dựng đường thẳng $b'$ song song với $b$.
        Mặt phẳng tạo bởi hai đường thẳng cắt nhau $a$ và $b'$ chứa $a$ và song song với $b$. Mặt phẳng này là duy nhất.
    ]
)

// TN 10
#tn([Cho tứ diện $A B C D$. Gọi $M$, $N$, $P$, $Q$ lần lượt là trung điểm của các cạnh $A B$, $B C$, $C D$, $D A$. Tứ giác $M N P Q$ là hình gì?],
    (
        [Hình thang.],
        [Hình chữ nhật.],
        True([Hình bình hành.]),
        [Hình thoi.]
    ),
    loigiai: [
        Ta có:
        - $M N$ là đường trung bình của tam giác $A B C => M N parallel A C$ và $M N = (1) / (2) A C$.
        - $P Q$ là đường trung bình của tam giác $A D C => P Q parallel A C$ và $P Q = (1) / (2) A C$.
        Do đó, $M N parallel P Q$ và $M N = P Q$.
        Tứ giác $M N P Q$ là hình bình hành.
    ]
)

// TN 11
#tn([Mô hình hóa kết cấu của một cầu vượt cạn đô thị phẳng. Mặt cầu phẳng nằm trên hệ dầm gồm các xà dọc $X_1, X_2$ song song với nhau. Trụ đỡ cầu được đóng đứng vuông góc với mặt đất phẳng. Các dầm xà dọc $X_1, X_2$ song song với mặt đất phẳng. Nếu một đường thẳng $d$ trên mặt đất song song với hệ xà dọc thì khẳng định nào dưới đây đúng?],
    (
        [$d$ vuông góc với mặt cầu.],
        [$d$ chéo nhau với mọi dầm xà.],
        True([$d$ song song với mặt phẳng chứa các dầm xà.]),
        [$d$ nằm trong mặt phẳng mặt cầu.]
    ),
    loigiai: [
        Vì các dầm xà dọc $X_1, X_2$ song song với nhau nên chúng xác định một mặt phẳng $(P)$.
        Đường thẳng $d$ song song với hệ xà dọc ($d parallel X_1$), do đó $d$ song song với mặt phẳng $(P)$ chứa các dầm xà đó.
    ]
)

// TN 12
#tn([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Giao tuyến của hai mặt phẳng $(S A D)$ và $(S B C)$ là đường thẳng đi qua $S$ và song song với đường thẳng nào sau đây?],
    (
        [$A B$.],
        True([$A D$.]),
        [$A C$.],
        [$S O$.]
    ),
    loigiai: [
        Hai mặt phẳng $(S A D)$ và $(S B C)$ có:
        - Điểm chung duy nhất hiện tại là $S$.
        - Lần lượt chứa hai đường thẳng song song là $A D$ và $B C$ (do đáy là hình bình hành).
        Do đó, giao tuyến của chúng là đường thẳng đi qua $S$ và song song với $A D$ (and $B C$).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M, N$ lần lượt là trung điểm của các cạnh $S A, S B$. Các phát biểu sau đúng hay sai?], (
        [Đường thẳng $M N$ chéo nhau với đường thẳng $C D$.],
        True([Đường thẳng $M N$ song song với mặt phẳng $(S C D)$.]),
        True([Đường thẳng $O N$ (với $O$ là tâm của đáy $A B C D$) song song với mặt phẳng $(S A D)$.]),
        True([Mặt phẳng $(O M N)$ song song với mặt phẳng $(S C D)$.])
    ), 
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.0, 0.8)
      let B = (-2.2, -0.6)
      let C = (1.8, -0.6)
      let D = (3.0, 0.8)
      let S = (-1.0, 3.0)
      let O = (0.4, 0.1)
      
      let M = (-1.0, 1.9)
      let N = (-1.6, 1.2)
      
      // Hidden edges
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, C, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
      line(B, D, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
      line(S, O, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges
      line(S, B, stroke: 1pt + black)
      line(S, C, stroke: 1pt + black)
      line(S, D, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      
      // Points and Labels
      circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.35), $S$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) - 0.3, B.at(1) - 0.3), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.3, C.at(1) - 0.3), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) + 0.35, D.at(1) + 0.2), $D$, size: 10pt)
      circle(O, radius: 1.5pt, fill: black); content((O.at(0) + 0.15, O.at(1) - 0.3), $O$, size: 9pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.35, M.at(1) + 0.2), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) - 0.35, N.at(1) - 0.1), $N$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        - *a)* Sai. Vì $M N parallel A B parallel C D => M N parallel C D$.
        - *b)* Đúng. Vì $M N parallel C D subset (S C D)$ nên $M N parallel (S C D)$.
        - *c)* Đúng. Vì $O N$ là đường trung bình của tam giác $S B D => O N parallel S D subset (S A D) => O N parallel (S A D)$.
        - *d)* Đúng. Vì mặt phẳng $(O M N)$ chứa hai đường thẳng cắt nhau $M N$ và $O N$ lần lượt song song với hai đường thẳng cắt nhau $C D$ và $S D$ của mặt phẳng $(S C D)$.
    ]
)

// DS 2
#ds([Cho tứ diện đều $S.A B C$ cạnh $a$. Một mặt phẳng $(alpha)$ song song với hai cạnh $A B$ và $S C$ cắt các cạnh $S A, S B, B C, A C$ lần lượt tại các điểm $M, N, P, Q$. Các phát biểu sau đúng hay sai?], (
        True([Thiết diện $M N P Q$ thu được là một hình chữ nhật.]),
        True([Độ dài các đoạn thẳng $M N$ và $P Q$ luôn bằng nhau và song song với $A B$.]),
        [Chu vi của thiết diện $M N P Q$ thay đổi tùy thuộc vào vị trí của mặt phẳng cắt $(alpha)$.],
        True([If mặt phẳng $(alpha)$ đi qua trung điểm của $S A$ thì diện tích thiết diện lớn nhất.])
    ), 
    loigiai: [
        Mặt phẳng $(alpha) parallel A B$ và $S C$.
        - *a)* Đúng. Thiết diện $M N P Q$ có $M N parallel P Q parallel A B$ và $N P parallel M Q parallel S C$. Vì vậy nó là hình bình hành. 
          Hơn nữa, đây là tứ diện đều nên $A B perp S C$. Do đó $M N perp N P$. Vậy thiết diện $M N P Q$ là hình chữ nhật.
        - *b)* Đúng. $M N$ và $P Q$ song song với $A B$. Theo định lý Thales: $M N = P Q$.
        - *c)* Sai. Gọi $S A$ có điểm $M$ sao cho $(S M) / (S A) = k$ ($0 < k < 1$).
          Ta có $M N = k A B = k a$, và $M Q = (1 - k) S C = (1 - k) a$.
          Chu vi hình chữ nhật $M N P Q$ là:
          $ C = 2(M N + M Q) = 2(k a + (1-k)a) = 2a $ không đổi.
          Chu vi luôn bằng $2a$ không đổi với mọi vị trí của mặt phẳng $(alpha)$.
          - *d)* Đúng. Diện tích thiết diện là:
          $ S(k) = M N dot M Q = k a dot (1-k)a = a^2 k(1-k) $
          Theo bất đẳng thức AM-GM: $k(1-k) <= (1)/(4)$.
          Dấu "=" xảy ra khi $k = (1)/(2)$, tức là $M$ là trung điểm của $S A$. Khi đó diện tích đạt lớn nhất bằng $(a^2) / (4)$.
    ]
)

// DS 3
#ds([Một giàn thép chịu lực có kết cấu hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành phẳng tâm $O$. Trên các cạnh $S A, S B, S C$, người ta lắp các khớp định vị $I, J, K$ sao cho $(S I) / (S A) = (S J) / (S B) = (2)/(3)$ và $(S K) / (S C) = (1)/(2)$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $I J$ song song với mặt phẳng đáy $(A B C D)$.]),
        [Đường thẳng $J K$ song song với mặt phẳng đáy $(A B C D)$.],
        True([Mặt phẳng $(I J K)$ cắt mặt phẳng đáy $(A B C D)$ theo một giao tuyến song song với $A B$.]),
        True([If người ta lắp thêm khớp $L$ trên cạnh $S D$ sao cho đường thẳng $I L$ song song với mặt đáy $(A B C D)$ thì tỉ số $(S L) / (S D) = (2)/(3)$.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $(S I) / (S A) = (S J) / (S B) = (2)/(3) => I J parallel A B$. Mà $A B subset (A B C D)$ nên $I J parallel (A B C D)$.
        - *b)* Sai. Vì $(S J) / (S B) = (2)/(3) != (S K) / (S C) = (1)/(2)$, nên $J K$ cắt $B C$. Do đó $J K$ không song song với $(A B C D)$.
        - *c)* Đúng. Vì mặt phẳng $(I J K)$ chứa đường thẳng $I J parallel (A B C D)$. Theo tính chất, giao tuyến của $(I J K)$ và $(A B C D)$ (nếu có) phải song song với $I J$, tức là song song với $A B$.
        - *d)* Đúng. Để $I L parallel (A B C D)$, mà $I L subset (S A D)$ và $(S A D) inter (A B C D) = A D$, nên $I L parallel A D$.
          Trong tam giác $S A D$, $I L parallel A D => (S L) / (S D) = (S I) / (S A) = (2)/(3)$.
    ]
)

// DS 4
#ds([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M, N, P, Q$ lần lượt là trung điểm của các cạnh $S A, S B, S C, S D$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $M N$ song song với đường thẳng $C D$.]),
        True([Mặt phẳng $(M N P Q)$ song song với mặt phẳng đáy $(A B C D)$.]),
        True([Giao tuyến của hai mặt phẳng $(M A B)$ và $(N C D)$ là đường thẳng song song với $A B$.]),
        [Giao tuyến của hai mặt phẳng $(S A C)$ và $(S B D)$ song song với $A B$.]
    ), 
    loigiai: [
        - *a)* Đúng. Vì $M N$ là đường trung bình của tam giác $S A B => M N parallel A B$. Mà $A B parallel C D$ nên $M N parallel C D$.
        - *b)* Đúng. Vì $M N parallel A B subset (A B C D)$ và $N P parallel B C subset (A B C D)$. Do đó $(M N P Q) parallel (A B C D)$.
        - *c)* Đúng. Vì hai mặt phẳng $(M A B)$ và $(N C D)$ lần lượt chứa hai đường thẳng song song $A B$ và $C D$, nên giao tuyến của chúng (nếu có) phải song song với $A B$.
        - *d)* Sai. Giao tuyến của $(S A C)$ và $(S B D)$ là đường thẳng $S O$ (với $O$ là giao điểm của $A C$ và $B D$). Đường thẳng $S O$ cắt mặt phẳng đáy tại $O$, không thể song song với $A B$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho tứ diện $A B C D$. Lấy các điểm $M, N$ lần lượt trên các cạnh $A B$ và $A C$ sao cho $(A M) / (A B) = (1)/(3)$ và $(A N) / (A C) = (2)/(3)$. Gọi $d$ là giao tuyến của hai mặt phẳng $(D M N)$ và $(B C D)$. Hỏi đường thẳng $d$ cắt đường thẳng $B C$ tại điểm $K$. Tính tỉ số $(K B) / (K C)$.],
    [4],
    loigiai: [
        Trong mặt phẳng $(A B C)$, vì $(A M) / (A B) = (1)/(3) != (A N) / (A C) = (2)/(3)$ nên đường thẳng $M N$ cắt đường thẳng $B C$ tại điểm $K$.
        Điểm $K$ thuộc $M N subset (D M N)$ và thuộc $B C subset (B C D)$.
        Do đó $K$ là điểm chung của $(D M N)$ và $(B C D) => K$ thuộc giao tuyến $d$.
        Áp dụng định lý Menelaus cho tam giác $A B C$ với cát tuyến $M, N, K$:
        $
          ((M A) / (M B)) dot ((K B) / (K C)) dot ((N C) / (N A)) = 1
        $
        Ta có:
        - $(M A) / (M B) = ((1)/(3) A B) / ((2)/(3) A B) = (1)/(2)$.
        - $(N C) / (N A) = ((1)/(3) A C) / ((2)/(3) A C) = (1)/(2)$.
        Thay vào công thức:
        $
          (1)/(2) dot ((K B) / (K C)) dot (1)/(2) = 1 \
          => (K B) / (K C) = 4
        $
    ]
)

// TL 2
#tln([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M$ là trung điểm của cạnh $S C$. Mặt phẳng $(alpha)$ đi qua $A M$ và song song với đường thẳng $B D$. Mặt phẳng này cắt cạnh $S B$ tại điểm $P$ và cắt cạnh $S D$ tại điểm $Q$. Tính tỉ số diện tích tam giác $S P Q$ và diện tích tam giác $S B D$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [13],
    loigiai: [
        Gọi $O = A C inter B D$ và $I = S O inter A M$.
        Trong tam giác $S A C$, $S O$ và $A M$ là hai đường trung tuyến cắt nhau tại $I$, do đó $I$ là trọng tâm tam giác $S A C => (S I) / (S O) = (2)/(3)$.
        Mặt phẳng $(alpha) parallel B D$ nên giao tuyến $P Q$ của $(alpha)$ với $(S B D)$ đi qua $I$ và song song với $B D$.
        Trong tam giác $S B D$, $P Q parallel B D => (S P) / (S B) = (S Q) / (S D) = (S I) / (S O) = (2)/(3)$.
        Tỉ số diện tích hai tam giác:
        $ (S_(S P Q)) / (S_(S B D)) = ((S P) / (S B)) dot ((S Q) / (S D)) = (2)/(3) dot (2)/(3) = (4)/(9). $
        Ta được phân số tối giản $(4)/(9)$, do đó $a = 4, b = 9 => a + b = 13$.
    ]
)

// TL 3
#tln([Cho tứ diện đều $A B C D$ cạnh $a = 12$ cm. Một mặt phẳng $(alpha)$ song song với cả $A B$ và $C D$ cắt các cạnh của tứ diện tạo thành thiết diện là một hình chữ nhật. Tính chu vi của hình chữ nhật thiết diện đó (tính bằng xăng-ti-mét).],
    [24],
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.5, 0.5)
      let B = (2.0, 0.5)
      let C = (0.0, -0.8)
      let D = (0.5, 3.0)
      
      let M = (-0.7, 1.5)
      let N = (1.4, 1.5)
      let P = (1.2, -0.02)
      let Q = (-0.9, -0.02)
      
      // Color fill for cross-section
      line(M, N, P, Q, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Hidden edges of tetrahedron
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      // Hidden edges of cross-section
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(P, Q, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges of tetrahedron
      line(D, A, stroke: 1pt + black)
      line(D, B, stroke: 1pt + black)
      line(D, C, stroke: 1pt + black)
      line(A, C, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      
      // Visible edges of cross-section
      line(N, P, stroke: 1.5pt + rgb("#0F766E"))
      line(Q, M, stroke: 1.5pt + rgb("#0F766E"))
      
      // Points and Labels
      circle(D, radius: 1.8pt, fill: black); content((D.at(0), D.at(1) + 0.35), $D$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.35, B.at(1) + 0.2), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) - 0.1, C.at(1) - 0.35), $C$, size: 10pt)
      
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.35, M.at(1) + 0.2), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) + 0.35, N.at(1) + 0.2), $N$, size: 10pt, fill: rgb("#0F766E"))
      circle(P, radius: 1.8pt, fill: rgb("#0F766E")); content((P.at(0) + 0.3, P.at(1) - 0.3), $P$, size: 10pt, fill: rgb("#0F766E"))
      circle(Q, radius: 1.8pt, fill: rgb("#0F766E")); content((Q.at(0) - 0.3, Q.at(1) - 0.3), $Q$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Gọi thiết diện là hình chữ nhật $M N P Q$ với $M in A C, N in B C, P in B D, Q in A D$.
        Ta có $M N parallel P Q parallel A B$ và $N P parallel M Q parallel C D$.
        Đặt $(A M) / (A C) = k$ ($0 < k < 1$).
        Theo định lý Thales:
        - $M N = k A B = 12k$ (cm).
        - $M Q = (1 - k) C D = 12(1-k)$ (cm).
        Chu vi của hình chữ nhật thiết diện $M N P Q$ là:
        $
          C = 2(M N + M Q) = 2(12k + 12(1-k)) = 24 " (cm)"
        $
        Chu vi thiết diện luôn không đổi và bằng $24$ cm với mọi vị trí của mặt phẳng cắt.
    ]
)

// TL 4
#tln([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình thang ($A B parallel C D$ và $A B = 2 C D$). Gọi $M$ là trung điểm của cạnh $S A$. Mặt phẳng $(M C D)$ cắt cạnh $S B$ tại điểm $N$. Tính tỉ số diện tích tam giác $S M N$ và diện tích tam giác $S A B$. (Viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$)],
    [5],
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-2.0, 0.8)
      let B = (2.0, 0.8)
      let C = (1.0, -0.6)
      let D = (-1.0, -0.6)
      let S = (0.0, 3.0)
      
      let M = (-1.0, 1.9)
      let N = (1.0, 1.9)
      
      // Color fill for cross-section MNCD
      line(M, N, C, D, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Hidden edges of pyramid
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(B, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Hidden edges of cross-section
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges of pyramid
      line(S, C, stroke: 1pt + black)
      line(S, D, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      
      // Visible edges of cross-section
      line(N, C, stroke: 1.5pt + rgb("#0F766E"))
      line(M, D, stroke: 1.5pt + rgb("#0F766E"))
      
      // Points and Labels
      circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.35), $S$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.35, B.at(1) + 0.2), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.3, C.at(1) - 0.3), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) - 0.3, D.at(1) - 0.3), $D$, size: 10pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.35, M.at(1) + 0.2), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) + 0.35, N.at(1) + 0.2), $N$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Mặt phẳng $(M C D)$ cắt cạnh $S B$ tại $N$.
        Vì $M \in S A$, và $C D parallel A B$, nên mặt phẳng $(M C D)$ chứa đường thẳng $C D parallel A B$.
        Do đó, giao tuyến $M N$ của mặt phẳng $(M C D)$ với mặt bên $(S A B)$ đi qua $M$ và song song với $A B$.
        Vì $M N parallel A B$ nên trong tam giác $S A B$, ta có:
        $ (S M) / (S A) = (S N) / (S B) = (1) / (2) $ (vì $M$ là trung điểm $S A$).
        Tỉ số diện tích hai tam giác là:
        $
          (S_(S M N)) / (S_(S A B)) = ((S M) / (S A)) dot ((S N) / (S B)) = (1) / (2) dot (1) / (2) = (1) / (4)
        $
        Phân số tối giản là $(1) / (4)$, do đó $a = 1, b = 4 => a + b = 5$.
    ]
)

// TL 5
#tln([Một hệ giàn giáo xây dựng chịu lực có kết cấu khung thép dạng hình chóp $S.A B C D$ đáy là hình bình hành $A B C D$ tâm $O$. Các thanh chống bên $S A, S B, S C, S D$ dài bằng nhau. Người ta lắp các thanh thép ngang ổn định kết cấu $E F$ nối trung điểm $S A$ và $S B$, và thanh $F H$ nối trung điểm $S B$ và $S C$. Hỏi thanh ngang $E H$ nối trung điểm $S A$ và $S C$ song song với mặt phẳng nào của đáy hình bình hành? Nhập số $1$ nếu song song với $(A B C D)$, số $2$ nếu song song với $(S B D)$.],
    [1],
    loigiai: [
        $E$ là trung điểm $S A$, $H$ là trung điểm $S C$.
        Trong tam giác $S A C$, $E H$ là đường trung bình ứng với cạnh $A C$.
        Do đó, $E H parallel A C$.
        Vì $A C$ nằm trong mặt phẳng đáy $(A B C D)$ nên $E H parallel (A B C D)$.
        Đáp án là số $1$.
    ]
)

// TL 6
#tln([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M, N$ lần lượt là trung điểm của $S B$ và $S D$. Mặt phẳng $(A M N)$ cắt $S C$ tại điểm $P$. Biết tỉ số $(S P) / (S C) = a/b$ (phân số tối giản). Nhập đáp án là $a+b$.],
    [4],
    loigiai: [
        Gọi $O = A C inter B D$ và $I = S O inter M N$.
        Vì $M, N$ lần lượt là trung điểm của $S B$ và $S D$, nên $M N$ là đường trung bình của tam giác $S B D => M N parallel B D$ và $I$ là trung điểm $S O$.
        Đường thẳng $A I$ nằm trong mặt phẳng $(S A C)$, cắt $S C$ tại $P$.
        Áp dụng định lý Menelaus cho tam giác $S O C$ với cát tuyến $A, I, P$:
        $
          ((A C) / (A O)) dot ((I O) / (I S)) dot ((P S) / (P C)) = 1
        $
        Ta có:
        - $(A C) / (A O) = 2$.
        - $(I O) / (I S) = 1$ (vì $I$ là trung điểm $S O$).
        Thay vào công thức:
        $
          2 dot 1 dot ((P S) / (P C)) = 1 => (P S) / (P C) = (1) / (2)
        $
        Do đó, $(S P) / (S C) = (1) / (3)$.
        Phân số tối giản là $(1) / (3)$, do đó $a = 1, b = 3 => a + b = 4$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
