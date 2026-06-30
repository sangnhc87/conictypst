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
  exam-title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 07)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho đường thẳng $a$ song song với mặt phẳng $(P)$ và đường thẳng $b$ song song với $(P)$. Vị trí tương đối của $a$ và $b$ có thể là:],
    (
        True([Song song, chéo nhau, hoặc cắt nhau.]),
        [Chỉ có thể song song.],
        [Chỉ có thể chéo nhau.],
        [Chỉ có thể cắt nhau.]
    ),
    loigiai: [
        Hai đường thẳng cùng song song với một mặt phẳng thì có thể song song, cắt nhau hoặc chéo nhau trong không gian.
    ]
)

// TN 2
#tn([Cho hai mặt phẳng song song $(P)$ và $(Q)$. Nếu đường thẳng $a$ nằm trong $(P)$ và đường thẳng $b$ nằm trong $(Q)$ thì:],
    (
        True([$a$ và $b$ chéo nhau hoặc song song.]),
        [$a$ và $b$ cắt nhau.],
        [$a$ và $b$ trùng nhau.],
        [$a$ và $b$ vuông góc.]
    ),
    loigiai: [
        Do $(P) parallel (Q)$ nên $a$ và $b$ không có điểm chung. Do đó chúng chỉ có thể song song hoặc chéo nhau.
    ]
)

// TN 3
#tn([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M, N$ lần lượt là trung điểm của $S A, S C$. Khẳng định nào sau đây đúng?],
    (
        True([$M N parallel (A B C D)$]),
        [$M N parallel (S A D)$],
        [$M N parallel (S A B)$],
        [$M N parallel (S B C)$]
    ),
    loigiai: [
        Ta có $M N$ là đường trung bình của tam giác $S A C => M N parallel A C$.
        Mà $A C subset (A B C D)$, do đó $M N parallel (A B C D)$.
    ]
)

// TN 4
#tn([Cho hai đường thẳng chéo nhau $a$ và $b$. Có bao nhiêu mặt phẳng chứa $a$ và song song với $b$?],
    (
        [Vô số.],
        True([Có duy nhất một.]),
        [Không có mặt phẳng nào.],
        [Có đúng hai.]
    ),
    loigiai: [
        Qua một điểm bất kỳ trên $a$, dựng đường thẳng $b' parallel b$. Mặt phẳng tạo bởi $a$ và $b'$ là mặt phẳng duy nhất chứa $a$ và song song với $b$.
    ]
)

// TN 5
#tn([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $G$ là trọng tâm tam giác $S A B$. Qua $G$ kẻ đường thẳng song song với $A B$ cắt $S B$ tại $M$. Tỉ số $(S M) / (S B)$ bằng:],
    (
        [$1/2$],
        True([$2/3$]),
        [$1/3$],
        [$3/4$]
    ),
    loigiai: [
        Gọi $I$ là trung điểm $A B$. Vì $G$ là trọng tâm nên $(S G) / (S I) = 2/3$.
        Đường thẳng qua $G$ song song với $A B$ nằm trong mặt phẳng $(S A B)$ cắt $S B$ tại $M$ và cắt $S A$ tại $N$.
        Theo Thales: $(S M) / (S B) = (S G) / (S I) = 2/3$.
    ]
)

// TN 6
#tn([Cho ba mặt phẳng song song $(P), (Q), (R)$. Hai cát tuyến bất kỳ $d_1, d_2$ cắt ba mặt phẳng này lần lượt tại $A, B, C$ và $A', B', C'$. Khẳng định nào sau đây đúng?],
    (
        True([$(A B) / (B C) = (A' B') / (B' C')$]),
        [$(A B) / (A C) = (B' C') / (A' C')$],
        [$(B C) / (A C) = (A' B') / (A' C')$],
        [$A B dot B' C' = A' B' dot A C$]
    ),
    loigiai: [
        Theo định lý Thales trong không gian, các mặt phẳng song song định ra trên hai cát tuyến những đoạn thẳng tỉ lệ tương ứng: $(A B) / (B C) = (A' B') / (B' C')$.
    ]
)

// TN 7
#tn([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Thiết diện cắt bởi mặt phẳng $(A B' C')$ và mặt phẳng $(A' B C)$ song song với đường thẳng nào?],
    (
        [$A A'$],
        True([$B C$]),
        [$A B$],
        [$A C$]
    ),
    loigiai: [
        Hai mặt phẳng $(A B' C')$ và $(A' B C)$ chứa hai đường thẳng song song $B' C'$ và $B C$.
        Do đó giao tuyến của chúng phải song song với $B C$ và $B' C'$.
    ]
)

// TN 8
#tn([Cho phép chiếu song song lên mặt phẳng $(P)$ theo phương $l$. Hình chiếu của một tam giác $A B C$ (không có cạnh nào song song hoặc trùng với phương chiếu) là:],
    (
        True([Một tam giác hoặc một đoạn thẳng.]),
        [Luôn là một tam giác.],
        [Luôn là một đoạn thẳng.],
        [Một hình bình hành.]
    ),
    loigiai: [
        - Nếu mặt phẳng tam giác $A B C$ song song với phương chiếu $l$ thì hình chiếu của nó là một đoạn thẳng.
        - Nếu mặt phẳng tam giác $A B C$ không song song với phương chiếu $l$ thì hình chiếu của nó là một tam giác.
    ]
)

// TN 9
#tn([Cho hình chóp $S.A B C D$ đáy là hình bình hành $A B C D$ tâm $O$. Gọi $M$ là trung điểm của $S C$. Giao điểm của đường thẳng $A M$ và mặt phẳng $(S B D)$ là:],
    (
        True([Giao điểm của $A M$ và $S O$.]),
        [Giao điểm của $A M$ và $S B$.],
        [Giao điểm của $A M$ và $S D$.],
        [Trọng tâm tam giác $S B C$.]
    ),
    loigiai: [
        Trong mặt phẳng $(S A C)$, đường thẳng $A M$ cắt đường thẳng $S O$ tại $I$.
        Vì $S O subset (S B D)$, nên $I$ chính là giao điểm của $A M$ và mặt phẳng $(S B D)$.
    ]
)

// TN 10
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Đường thẳng nào sau đây song song với mặt phẳng $(A A' C' C)$?],
    (
        [ $B D$ ],
        [ $B' D'$ ],
        True([ $B B'$ ]),
        [ Không có đường thẳng nào. ]
    ),
    loigiai: [
        Ta có $B B' parallel A A'$. Mà $A A' subset (A A' C' C)$ và $B B' subset.not (A A' C' C)$.
        Do đó $B B' parallel (A A' C' C)$.
    ]
)

// TN 11
#tn([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M, N$ lần lượt là trung điểm của $S A, S B$. Khẳng định nào sau đây đúng?],
    (
        True([$M N parallel (S C D)$]),
        [$M N parallel (S B C)$],
        [$M N parallel (S A D)$],
        [$M N parallel (S A B)$]
    ),
    loigiai: [
        Ta có $M N$ là đường trung bình của tam giác $S A B => M N parallel A B$.
        Mà $A B parallel C D$, do đó $M N parallel C D subset (S C D) => M N parallel (S C D)$.
    ]
)

// TN 12
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Khẳng định nào sau đây là đúng về các cặp mặt phẳng đối diện?],
    (
        [$(A B C)$ và $(A' B' C')$ song song với nhau.],
        [$(A B B' A')$ và $(C D D' C')$ song song với nhau.],
        [$(A D D' A')$ và $(B C C' B')$ song song với nhau.],
        True([Cả ba khẳng định trên đều đúng.])
    ),
    loigiai: [
        Hình hộp là hình lăng trụ có đáy là hình bình hành, do đó các cặp mặt đối diện đều song song với nhau từng đôi một.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hình chóp $S.A B C D$ đáy là hình bình hành $A B C D$ tâm $O$. Gọi $M$ là trung điểm của $S A$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $O M$ song song với mặt phẳng $(S C D)$.]),
        True([Giao tuyến của hai mặt phẳng $(M C D)$ và $(S A B)$ là đường thẳng đi qua $M$ và song song với $A B$.]),
        [Thiết diện của hình chóp cắt bởi mặt phẳng $(M C D)$ là hình bình hành.],
        [Đường thẳng $B M$ song song với mặt phẳng $(S C D)$.]
    ), 
    loigiai: [
        - *a)* Đúng. Vì $O$ là trung điểm $A C$ nên $O M$ là đường trung bình của tam giác $S A C => O M parallel S C => O M parallel (S C D)$.
        - *b)* Đúng. Mặt phẳng $(M C D)$ và $(S A B)$ chứa hai đường thẳng song song $C D$ và $A B$, do đó giao tuyến là đường thẳng qua điểm chung $M$ và song song với $A B$.
        - *c)* Sai. Đường thẳng qua $M$ song song với $A B$ cắt $S B$ tại trung điểm $N$ của $S B$. Thiết diện thu được là hình thang $M N C D$ (không phải hình bình hành vì $M N = (1)/(2) A B = (1)/(2) C D != C D$).
        - *d)* Sai. Đường thẳng $B M$ cắt $(S C D)$ tại giao điểm của chúng, không thể song song.
    ]
)

// DS 2
#ds([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $G_1, G_2$ lần lượt là trọng tâm của các tam giác $A B C$ và $A' B' C'$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $G_1 G_2$ song song với cạnh bên $A A'$.]),
        [Mặt phẳng đi qua $G_1, G_2$ và song song với mặt phẳng bên $(A B B' A')$ chứa cạnh bên $C C'$.],
        True([Hình chiếu song song của tam giác $A B C$ lên mặt phẳng đáy $(A' B' C')$ theo phương chiếu $A A'$ là chính tam giác $A' B' C'$.]),
        [Nếu $M$ là trung điểm của $B C$ thì đường thẳng $A' M$ song song với mặt phẳng $(B' C' C)$.]
    ), 
    loigiai: [
        - *a)* Đúng. Đường thẳng nối trọng tâm hai đáy song song với các cạnh bên của lăng trụ.
        - *b)* Sai. Mặt phẳng song song với $(A B B' A')$ thì không thể chứa $C C'$ vì $C C' parallel A A' subset (A B B' A')$, chúng song song với nhau.
        - *c)* Đúng. Phép chiếu song song theo phương cạnh bên biến mỗi đỉnh đáy dưới thành đỉnh đáy trên tương ứng.
        - *d)* Sai. Đường thẳng $A' M$ cắt mặt phẳng bên $(B' C' C)$ tại điểm $M$.
    ]
)

// DS 3
#ds([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $I$ là giao điểm của hai đường chéo của mặt bên $A D D' A'$, $J$ là giao điểm của hai đường chéo của mặt bên $B C C' B'$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $I J$ song song với đường thẳng $A B$.]),
        [Mặt phẳng $(A B J I)$ song song với mặt phẳng $(C D D' C')$.],
        True([Giao tuyến của hai mặt phẳng $(I J D')$ và $(A B C D)$ song song với $C D$.]),
        True([Thiết diện của hình hộp cắt bởi mặt phẳng $(I J D')$ là hình bình hành.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $I$ là trung điểm $A D'$ và $J$ là trung điểm $B C'$ nên $I J parallel A B parallel C D$.
        - *b)* Sai. Mặt phẳng $(A B J I)$ chứa $A B parallel C D$, nên nó cắt mặt $(C D D' C')$ theo giao tuyến $C D$.
        - *c)* Đúng. Vì mặt phẳng $(I J D')$ chứa $I J parallel C D$ nên giao tuyến của nó với đáy $(A B C D)$ song song với $C D$.
        - *d)* Đúng. Thiết diện cắt bởi mặt phẳng song song với $C D$ đi qua $D', C'$ là hình bình hành $I J C' D'$.
    ]
)

// DS 4
#ds([Một tòa tháp kết cấu khung thép chịu lực dạng hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Các kỹ sư lắp đặt các giằng chịu lực nối trung điểm các cạnh. Các phát biểu sau đúng hay sai?], (
        True([Đường nối trung điểm $M$ của $S A$ và $N$ của $S C$ song song với mặt đất $(A B C D)$.]),
        True([Đường nối trung điểm $P$ của $S B$ và $Q$ của $S D$ cắt $M N$ tại trung điểm mỗi đường.]),
        True([Đoạn thẳng $P Q$ song song với đường thẳng $B D$.]),
        [Thiết diện tạo bởi mặt phẳng $(M N P)$ cắt hình chóp theo một tam giác.]
    ), 
    loigiai: [
        - *a)* Đúng. $M N$ là đường trung bình của tam giác $S A C => M N parallel A C => M N parallel (A B C D)$.
        - *b)* Đúng. Cả hai đường thẳng $M N$ và $P Q$ đều cắt trục $S O$ tại trung điểm của $S O$.
        - *c)* Đúng. $P Q$ là đường trung bình của tam giác $S B D => P Q parallel B D$.
        - *d)* Sai. Vì $M N parallel A C$ và $P Q parallel B D$, mặt phẳng $(M N P)$ chứa hai đường song song với hai đường chéo đáy nên thiết diện cắt hình chóp thu được hình bình hành $M P N Q$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M, N$ lần lượt là trung điểm của $S A, S B$. Mặt phẳng $(alpha)$ đi qua $M, N$ cắt các cạnh $S D, S C$ lần lượt tại $P, Q$. Biết độ dài đoạn thẳng thiết diện $P Q = 5$ cm. Tính độ dài cạnh đáy $C D$ (tính bằng xăng-ti-mét).],
    [10],
    loigiai: [
        Ta có $M N$ là đường trung bình của tam giác $S A B => M N parallel A B parallel C D$.
        Mặt phẳng $(alpha)$ chứa $M N$ song song với $C D$ nên giao tuyến $P Q$ song song với $C D$.
        Vì $M$ là trung điểm $S A$ và $(alpha) parallel (A B C D)$ nên $P, Q$ lần lượt là trung điểm của $S D, S C$.
        Do đó $P Q$ là đường trung bình của tam giác $S C D => C D = 2 P Q = 10$ cm.
    ]
)

// TL 2
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M$ là trung điểm của cạnh $A B$. Mặt phẳng $(A' M D)$ cắt cạnh bên $C C'$ tại điểm $P$. Tính tỉ số $(C' P) / (C C')$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [3],
    loigiai: [
        Trong mặt phẳng đáy $(A B C D)$, đường thẳng $D M$ cắt đường thẳng $B C$ tại điểm $E$.
        Vì $M$ là trung điểm $A B$ và $A D parallel B E$ nên theo Thales tam giác $M A D$ đồng dạng $M B E$ theo tỉ số $1$.
        Suy ra $B E = A D = B C$, do đó $C$ là trung điểm của $B E$.
        Trong mặt phẳng bên $(B C C' B')$, đường thẳng $A' E$ cắt cạnh bên $C C'$ tại $P$.
        Vì $A' B' parallel B E$ và $A' B' = B E$ nên tứ giác $A' B' E E'$ là hình bình hành.
        Do đó $P$ là giao điểm của hai đường chéo $A' E$ và $C C'$, suy ra $P$ là trung điểm của $C C'$.
        Do đó $(C' P) / (C C') = 1/2$, suy ra $a = 1, b = 2 => a + b = 3$.
    ]
)

// TL 3
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành $A B C D$. Gọi $M$ là trung điểm của cạnh $S A$. Mặt phẳng $(alpha)$ đi qua $M$ và song song với mặt phẳng $(S B C)$ cắt cạnh đáy $A B$ tại $N$. Tính tỉ số $(A B) / (A N)$.],
    [2],
    loigiai: [
        Vì mặt phẳng $(alpha)$ song song với mặt phẳng $(S B C)$ nên giao tuyến của nó với mặt bên $(S A B)$ là đường thẳng đi qua $M$ song song với $S B$.
        Đường thẳng này cắt $A B$ tại $N$.
        Vì $M$ là trung điểm $S A$ và $M N parallel S B$ nên $N$ là trung điểm của $A B$.
        Do đó $(A B) / (A N) = 2$.
    ]
)

// TL 4
#tln([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $B C$ và $B' C'$. Mặt phẳng $(alpha)$ đi qua trung điểm $I$ của $M N$ và song song với mặt phẳng đáy $(A B C)$ cắt cạnh bên $A A'$ tại điểm $P$. Biết độ dài cạnh bên $A A' = 18$ cm. Tính độ dài đoạn thẳng $A P$ (tính bằng xăng-ti-mét).],
    [9],
    loigiai: [
        Vì $M, N$ lần lượt là trung điểm của $B C, B' C'$ nên $M N parallel A A'$.
        Vì $I$ là trung điểm $M N$ nên $I$ là trung điểm của trục lăng trụ.
        Mặt phẳng $(alpha)$ qua $I$ và song song với đáy $(A B C)$ chính là mặt phẳng trung bình song song của hình lăng trụ.
        Do đó, mặt phẳng này cắt các cạnh bên tại trung điểm tương ứng.
        Suy ra $P$ là trung điểm của $A A' => A P = (1)/(2) A A' = 9$ cm.
    ]
)

// TL 5
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $G_1, G_2$ lần lượt là trọng tâm của các tam giác $B D A'$ và $B D C'$. Biết độ dài đường chéo đáy $A' C' = 18$ cm. Tính độ dài đoạn thẳng $G_1 G_2$ (tính bằng xăng-ti-mét).],
    [6],
    loigiai: [
        Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$ ở đáy dưới.
        Trong tam giác $A' O C'$, ta có $G_1$ nằm trên $O A'$ sao cho $(O G_1) / (O A') = 1/3$.
        $G_2$ nằm trên $O C'$ sao cho $(O G_2) / (O C') = 1/3$.
        Theo định lý Thales trong tam giác $A' O C'$, ta có $G_1 G_2 parallel A' C'$ và:
        $ G_1 G_2 = (1)/(3) A' C' = (1)/(3) dot 18 = 6 $ cm.
    ]
)

// TL 6
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M$ là trung điểm của $S A$. Mặt phẳng $(alpha)$ đi qua $M$ và song song với cả $A B$ và $S D$. Mặt phẳng $(alpha)$ cắt cạnh bên $S C$ tại $P$. Biết độ dài cạnh $S C = 10$ cm. Tính độ dài đoạn thẳng $S P$ (tính bằng xăng-ti-mét).],
    [5],
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.0, 0.8)
      let B = (-2.2, -0.6)
      let C = (1.8, -0.6)
      let D = (3.0, 0.8)
      let S = (-1.0, 3.0)
      
      let M = (-1.0, 1.9) // trung điểm SA
      let N = (-1.6, 1.2) // trung điểm SB
      let P = (0.4, 1.2)  // trung điểm SC
      let I = (2.4, 0.1)  // trung điểm CD
      let K = (1.0, 0.8)  // trung điểm AD
      
      // Vẽ màu fill cho thiết diện MNPIK
      line(M, N, P, I, K, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Hidden edges of pyramid
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Hidden edges of cross-section
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(K, M, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(I, K, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges of pyramid
      line(S, B, stroke: 1pt + black)
      line(S, C, stroke: 1pt + black)
      line(S, D, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      
      // Visible edges of cross-section
      line(N, P, stroke: 1.5pt + rgb("#0F766E"))
      line(P, I, stroke: 1.5pt + rgb("#0F766E"))
      
      circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.35), $S$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) - 0.3, B.at(1) - 0.3), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.3, C.at(1) - 0.3), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) + 0.35, D.at(1) + 0.2), $D$, size: 10pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.35, M.at(1) + 0.15), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) - 0.3, N.at(1) - 0.3), $N$, size: 10pt, fill: rgb("#0F766E"))
      circle(P, radius: 1.8pt, fill: rgb("#0F766E")); content((P.at(0) + 0.35, P.at(1) + 0.15), $P$, size: 10pt, fill: rgb("#0F766E"))
      circle(I, radius: 1.8pt, fill: rgb("#0F766E")); content((I.at(0) + 0.25, I.at(1) - 0.25), $I$, size: 10pt, fill: rgb("#0F766E"))
      circle(K, radius: 1.8pt, fill: rgb("#0F766E")); content((K.at(0) + 0.25, K.at(1) + 0.25), $K$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Vì $(alpha)$ song song với $A B$ nên giao tuyến của $(alpha)$ với các mặt phẳng song song với $A B$ sẽ song song với $A B$.
        Do $(alpha) parallel S D$ và $(alpha)$ chứa $M$ (trung điểm $S A$) nên giao tuyến của $(alpha)$ với $(S A D)$ là đường thẳng qua $M$ song song với $S D$, cắt $A D$ tại trung điểm $K$ của $A D$.
        Từ $K$ vẽ đường thẳng song song với $A B$ (và $C D$) cắt $C D$ tại trung điểm $I$ của $C D$.
        Trong mặt phẳng $(S C D)$, qua $I$ vẽ đường thẳng song song với $S D$ cắt $S C$ tại trung điểm $P$ của $S C$.
        Do đó $P$ là trung điểm của $S C => S P = (1)/(2) S C = 5$ cm.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
