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
  exam-title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 06)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Trong không gian, khẳng định nào sau đây là đúng về vị trí tương đối của hai đường thẳng chéo nhau?],
    (
        [Hai đường thẳng chéo nhau khi và chỉ khi chúng không có điểm chung.],
        True([Hai đường thẳng chéo nhau khi và chỉ khi chúng không cùng nằm trên bất kỳ mặt phẳng nào.]),
        [Hai đường thẳng chéo nhau thì cắt nhau tại đúng một điểm.],
        [Hai đường thẳng chéo nhau thì song song với nhau.]
    ),
    loigiai: [
        Theo định nghĩa, hai đường thẳng chéo nhau là hai đường thẳng không cùng nằm trong một mặt phẳng.
    ]
)

// TN 2
#tn([Cho đường thẳng $a$ song song với mặt phẳng $(P)$. Khẳng định nào sau đây đúng?],
    (
        True([Có duy nhất một mặt phẳng chứa $a$ và song song với $(P)$.]),
        [Mọi đường thẳng nằm trong $(P)$ đều song song với $a$.],
        [Đường thẳng $a$ không song song với bất kỳ đường thẳng nào nằm trong $(P)$.],
        [Nếu một mặt phẳng $(Q)$ chứa $a$ và cắt $(P)$ theo giao tuyến $b$ thì $b$ chéo với $a$.]
    ),
    loigiai: [
        - Có duy nhất một mặt phẳng chứa đường thẳng $a$ và song song với $(P)$ (đó là mặt phẳng dựng từ một điểm thuộc $a$ và song song với $(P)$).
        - Giao tuyến $b$ của mặt phẳng $(Q)$ chứa $a$ with $(P)$ phải song song với $a$, không thể chéo nhau.
    ]
)

// TN 3
#tn([Cho hình chóp $S.A B C D$ đáy là hình bình hành. Gọi $M, N, P$ lần lượt là trung điểm của $S A, S B, S D$. Mặt phẳng $(M N P)$ song song với mặt phẳng nào dưới đây?],
    (
        [$(S C D)$],
        [$(S B C)$],
        True([$(A B C D)$]),
        [$(S A D)$]
    ),
    loigiai: [
        Ta có $M N$ là đường trung bình của tam giác $S A B => M N parallel A B$.
        $M P$ là đường trung bình của tam giác $S A D => M P parallel A D$.
        Suy ra $(M N P) parallel (A B C D)$.
    ]
)

// TN 4
#tn([Trong các mệnh đề sau, mệnh đề nào sai?],
    (
        [Hai mặt phẳng song song với nhau thì mọi đường thẳng nằm trong mặt phẳng này đều song song với mặt phẳng kia.],
        [Hai mặt phẳng song song với nhau thì không có điểm chung.],
        True([Hai mặt phẳng song song với nhau thì mọi đường thẳng nằm trong mặt phẳng này đều song song với mọi đường thẳng nằm trong mặt phẳng kia.]),
        [Nếu hai mặt phẳng song song với nhau thì bất kỳ mặt phẳng nào cắt mặt phẳng này cũng cắt mặt phẳng kia theo hai giao tuyến song song.]
    ),
    loigiai: [
        Hai mặt phẳng song song thì đường thẳng nằm trong mặt này và đường thẳng nằm trong mặt kia có thể chéo nhau, không nhất thiết phải song song với nhau.
    ]
)

// TN 5
#tn([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của $A' B'$ và $A' C'$. Đường thẳng $M N$ song song với mặt phẳng nào sau đây?],
    (
        True([$(B C C' B')$]),
        [$(A B B' A')$],
        [$(A C C' A')$],
        [$(A B C')$]
    ),
    loigiai: [
        Ta có $M N$ là đường trung bình của tam giác $A' B' C' => M N parallel B' C'$.
        Mà $B' C' parallel B C$, do đó $M N parallel (B C C' B')$.
    ]
)

// TN 6
#tn([Cho ba mặt phẳng đôi một song song. Đường thẳng $d_1$ cắt ba mặt phẳng này lần lượt tại $A, B, C$ sao cho $A B = 3$ cm, $B C = 6$ cm. Đường thẳng $d_2$ cắt ba mặt phẳng trên lần lượt tại $D, E, F$ sao cho $D E = 4$ cm. Độ dài đoạn thẳng $E F$ là:],
    (
        [$2$ cm.],
        True([$8$ cm.]),
        [$6$ cm.],
        [$5$ cm.]
    ),
    loigiai: [
        Theo định lý Thales trong không gian:
        $ (A B) / (B C) = (D E) / (E F) => (3) / (6) = (4) / (E F) => E F = 8 $ cm.
    ]
)

// TN 7
#tn([Cho hình chóp $S.A B C D$ đáy là hình bình hành $A B C D$. Thiết diện của hình chóp cắt bởi mặt phẳng đi qua trung điểm của $S A, S D$ và song song với $A B$ là:],
    (
        [Hình thang cân.],
        [Hình thang (không cân, không vuông).],
        True([Hình bình hành.]),
        [Tam giác.]
    ),
    loigiai: [
        Gọi $M, P$ lần lượt là trung điểm của $S A, S D$. Ta có $M P parallel A D parallel B C$.
        Mặt phẳng $(alpha)$ qua $M, P$ và song song với $A B$ nên cắt mặt bên $(S A B)$ theo giao tuyến $M N parallel A B$ ($N$ là trung điểm $S B$).
        Thiết diện thu được là tứ giác $M N C P$ hay $M N P Q$ (với $Q$ trùng $D$)?
        Giao tuyến của $(alpha)$ với $(S C D)$ qua $P$ song song với $C D$ là đường trung bình $P Q$ ($Q$ là trung điểm $S C$).
        Tứ giác thiết diện là $M N Q P$.
        Ta có $M P parallel A D parallel B C parallel N Q$ và $M P = (1)/(2) A D = (1)/(2) B C = N Q$.
        Do đó thiết diện $M N Q P$ là hình bình hành.
    ]
)

// TN 8
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Mặt phẳng chứa đường thẳng $A B'$ và song song với $C D'$ là mặt phẳng nào sau đây?],
    (
        True([$(A B B' A')$]),
        [$(A B C' D')$],
        [$(A D D' A')$],
        [$(B C C' B')$]
    ),
    loigiai: [
        Ta có $C D' parallel B A'$ (do tứ giác $C D D' C'$ và $A B B' A'$ là hai mặt song song của hình hộp và các đường chéo tương ứng song song).
        Do đó $C D' parallel (A B B' A')$. Mặt phẳng này chứa đường thẳng $A B'$.
    ]
)

// TN 9
#tn([Khẳng định nào sau đây là sai khi nói về phép chiếu song song?],
    (
        [Phép chiếu song song biến ba điểm thẳng hàng thành ba điểm thẳng hàng và bảo toàn thứ tự giữa chúng.],
        [Phép chiếu song song biến hai đường thẳng song song thành hai đường thẳng song song hoặc trùng nhau.],
        [Phép chiếu song song biến một đường thẳng thành một đường thẳng (phương chiếu không song song với đường thẳng đó).],
        True([Phép chiếu song song bảo toàn khoảng cách giữa hai điểm bất kỳ.])
    ),
    loigiai: [
        Phép chiếu song song chỉ bảo toàn tỉ số độ dài của các đoạn thẳng song song hoặc nằm trên cùng một đường thẳng, chứ không bảo toàn khoảng cách thực tế giữa hai điểm bất kỳ.
    ]
)

// TN 10
#tn([Cho hình chóp $S.A B C$. Gọi $G_1, G_2$ lần lượt là trọng tâm của các tam giác $S A B, S A C$. Khẳng định nào sau đây đúng?],
    (
        True([$G_1 G_2 parallel (S B C)$]),
        [$G_1 G_2 parallel (S A B)$],
        [$G_1 G_2$ cắt $B C$.],
        [$G_1 G_2 parallel S A$.]
    ),
    loigiai: [
        Gọi $M, N$ lần lượt là trung điểm của $A B, A C$.
        Ta có: $(S G_1) / (S M) = (S G_2) / (S N) = 2/3 => G_1 G_2 parallel M N$.
        Mà $M N parallel B C$, do đó $G_1 G_2 parallel B C subset (S B C) => G_1 G_2 parallel (S B C)$.
    ]
)

// TN 11
#tn([Cho hình chóp $S.A B C D$ đáy là hình bình hành $A B C D$. Một mặt phẳng $(alpha)$ song song với đáy và cắt các cạnh bên $S A, S B, S C, S D$ lần lượt tại $A', B', C', D'$. Khẳng định nào dưới đây đúng?],
    (
        [Tứ giác $A' B' C' D'$ là hình thang.],
        True([Tứ giác $A' B' C' D'$ là hình bình hành.]),
        [Tứ giác $A' B' C' D'$ là hình chữ nhật.],
        [Tứ giác $A' B' C' D'$ là hình thoi.]
    ),
    loigiai: [
        Mặt phẳng song song với đáy cắt các mặt bên theo các giao tuyến song song với các cạnh đáy tương ứng.
        Do $A B C D$ là hình bình hành nên $A' B' parallel A B parallel C D parallel C' D'$ và $A' D' parallel A D parallel B C parallel B' C'$.
        Do đó tứ giác $A' B' C' D'$ là hình bình hành.
    ]
)

// TN 12
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Mặt phẳng $(B A' D)$ song song với mặt phẳng nào sau đây?],
    (
        [$(C' B' D)$],
        True([$(C B' D')$]),
        [$(C D D' C')$],
        [$(A C C' A')$]
    ),
    loigiai: [
        Ta có:
        - $B D parallel B' D'$ (do $B B' D' D$ là hình bình hành).
        - $B A' parallel C D'$ (do $A B C' D'$ là hình bình hành).
        Do đó mặt phẳng $(B A' D)$ song song với mặt phẳng $(C B' D')$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Gọi $M$ là trung điểm của cạnh $S D$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $O M$ song song với mặt phẳng $(S B C)$.]),
        True([Giao tuyến của mặt phẳng $(S A D)$ và mặt phẳng $(S B C)$ là đường thẳng đi qua $S$ và song song với $A D$.]),
        True([Mặt phẳng $(A B M)$ cắt hình chóp theo thiết diện là hình thang.]),
        [Đường thẳng $A M$ song song với mặt phẳng $(S B C)$.]
    ), 
    loigiai: [
        - *a)* Đúng. Vì $O$ là trung điểm $B D$ và $M$ là trung điểm $S D$ nên $O M$ là đường trung bình của tam giác $S B D => O M parallel S B => O M parallel (S B C)$.
        - *b)* Đúng. Mặt phẳng $(S A D)$ và $(S B C)$ chứa hai đường thẳng song song $A D$ và $B C$, do đó giao tuyến là đường thẳng qua điểm chung $S$ và song song với $A D$.
        - *c)* Đúng. Mặt phẳng $(A B M)$ chứa $A B parallel C D$, nên nó cắt mặt $(S C D)$ theo giao tuyến qua $M$ song song với $C D$. Giao tuyến này là đường trung bình $M N$ của tam giác $S C D$ ($N$ là trung điểm $S C$). Thiết diện thu được là hình thang $A B N M$.
        - *d)* Sai. Đường thẳng $A M$ nằm trong mặt phẳng $(S A D)$ và cắt $(S B C)$ tại giao điểm của chúng, không thể song song.
    ]
)

// DS 2
#ds([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $B C$ và $B' C'$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $M N$ song song với mặt phẳng $(A C C' A')$.]),
        [Mặt phẳng $(A M N)$ song song với mặt phẳng $(B C C' B')$.],
        True([Thiết diện cắt bởi mặt phẳng qua $M$ và song song với $(A C C' A')$ là một hình bình hành.]),
        True([Giao tuyến của mặt phẳng $(A B' C')$ và mặt phẳng $(A' B C)$ song song với $B C$.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $M N$ là đường nối hai trung điểm của hai đáy của hình lăng trụ đứng nên $M N parallel B B' parallel A A' => M N parallel (A C C' A')$.
        - *b)* Sai. Vì $M$ thuộc $B C$ nằm trong $(B C C' B')$ nên mặt phẳng $(A M N)$ cắt $(B C C' B')$ theo giao tuyến $M N$.
        - *c)* Đúng. Thiết diện đi qua $M$ và song song với mặt phẳng bên $(A C C' A')$ cắt các mặt đáy theo các đoạn thẳng song song với $A C$, cắt mặt bên theo đoạn thẳng song song với $A A'$. Do đó thiết diện thu được là hình bình hành.
        - *d)* Đúng. Hai mặt phẳng $(A B' C')$ và $(A' B C)$ chứa hai đường thẳng song song $B' C'$ và $B C$. Do đó giao tuyến của chúng song song với $B C$.
    ]
)

// DS 3
#ds([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M, N$ lần lượt là trung điểm của $A' D'$ và $C' D'$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $M N$ song song với mặt phẳng $(A B C D)$.]),
        [Giao tuyến của hai mặt phẳng $(B M N)$ và $(A B C D)$ là đường thẳng đi qua $D$ và song song với $A C$.],
        True([Mặt phẳng $(B M N)$ cắt hình hộp theo thiết diện là một ngũ giác.]),
        True([Gọi $P$ là giao điểm của $(B M N)$ với cạnh bên $A A'$. Khi đó $(A P) / (A A') = 1/3$.])
    ), 
    loigiai: [
        - *a)* Đúng. $M N$ là đường trung bình của tam giác $A' C' D' => M N parallel A' C' parallel A C => M N parallel (A B C D)$.
        - *b)* Sai. Giao tuyến của $(B M N)$ với $(A B C D)$ đi qua điểm chung $B$ và song song với $A C$ (vì $M N parallel A C$).
        - *c)* Đúng. Đường thẳng $M N$ cắt $A' B'$ kéo dài tại $E$ và $B' C'$ kéo dài tại $F$. Nối $B E$ cắt $A A'$ tại $P$, nối $B F$ cắt $C C'$ tại $Q$. Thiết diện thu được là ngũ giác $B P M N Q$.
        - *d)* Đúng. Trong tam giác $E B B'$ ta có $A' P parallel B B'$, do đó theo Thales: $(A P) / (A A') = (A' E) / (A' B')$. Vì $M, N$ là trung điểm nên $A' E = 1/2 A' B'$, do đó $(A P) / (A A') = 1/3$.
    ]
)

// DS 4
#ds([Một mô hình kiến trúc chịu lực có kết cấu dạng hình chóp $S.A B C D$ với đáy $A B C D$ là hình thang ($A B parallel C D, A B = 2 C D$). Người ta lắp đặt các khung giằng thép nằm trong các mặt phẳng song song với đáy. Các phát biểu sau đúng hay sai?], (
        True([Một thanh giằng nằm trong mặt phẳng song song với đáy sẽ song song với cả $A B$ và $C D$.]),
        True([Nếu mặt phẳng song song với đáy cắt các cạnh bên $S A, S B, S C, S D$ lần lượt tại $A', B', C', D'$ thì tứ giác $A' B' C' D'$ là hình thang với $A' B' = 2 C' D'$.]),
        True([Tỉ số diện tích thiết diện và diện tích đáy bằng $S_(A' B' C' D') / S_(A B C D) = (S A' / S A)^2$.]),
        True([Nếu mặt phẳng giằng đi qua trung điểm của cạnh bên $S A$ thì chu vi của hình thang $A' B' C' D'$ bằng nửa chu vi đáy $A B C D$.])
    ), 
    loigiai: [
        - *a)* Đúng. Mặt phẳng song song với đáy cắt các mặt bên theo giao tuyến song song với các cạnh đáy, do đó thanh giằng song song với cả $A B$ và $C D$.
        - *b)* Đúng. Áp dụng định lý Thales cho hình chóp ta có các cạnh tương ứng tỉ lệ: $A' B' / A B = C' D' / C D = S A' / S A$. Do $A B = 2 C D$ nên $A' B' = 2 C' D'$.
        - *c)* Đúng. Thiết diện $A' B' C' D'$ đồng dạng với đáy $A B C D$ theo tỉ số $k = S A' / S A$. Do đó tỉ số diện tích bằng $k^2$.
        - *d)* Đúng. Do $S A'/S A = 1/2$ nên tỉ số đồng dạng $k = 1/2$. Do đó chu vi của thiết diện bằng một nửa chu vi đáy.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành. Mặt phẳng $(alpha)$ đi qua trung điểm $M$ của $S A$ và song song với $A B$ và $S C$. Mặt phẳng $(alpha)$ cắt cạnh bên $S B$ tại $N$. Tính tỉ số $(S B) / (S N)$.],
    [2],
    loigiai: [
        Vì $(alpha)$ song song với $A B$ nên giao tuyến của $(alpha)$ với mặt bên $(S A B)$ là đường thẳng song song với $A B$.
        Đường thẳng này đi qua $M$ (trung điểm $S A$) nên nó cắt $S B$ tại trung điểm $N$ của $S B$.
        Do đó $(S B) / (S N) = 2$.
    ]
)

// TL 2
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $A D$. Mặt phẳng $(A' M N)$ cắt cạnh bên $C C'$ tại điểm $P$. Tính tỉ số $(C' P) / (C C')$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [5],
    loigiai: [
        Đường thẳng $M N$ cắt đường chéo $A C$ tại điểm $I$ sao cho $A I = (1)/(4) A C$.
        Đường thẳng $A' I$ nằm trong mặt phẳng $(A C C' A')$ cắt cạnh bên $C C'$ kéo dài tại $P$.
        Theo định lý Thales trong mặt phẳng $(A C C' A')$:
        $ (C P) / (A A') = (C I) / (A I) = ( (3)/(4) A C ) / ( (1)/(4) A C ) = 3 $.
        Do đó $C P = 3 A A' = 3 C C'$.
        Vì $C$ nằm giữa $C'$ và $P$ nên $C' P = C C' + C P = 4 C C'$.
        Suy ra tỉ số $(C' P) / (C C') = 4$.
        Kết quả viết dưới dạng phân số tối giản là $4/1$, suy ra $a = 4, b = 1 => a + b = 5$.
    ]
)

// TL 3
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M, N$ lần lượt là trung điểm của các cạnh $S A, S B$. Mặt phẳng $(alpha)$ đi qua $M, N$ cắt các cạnh $S D, S C$ lần lượt tại $P, Q$. Biết độ dài cạnh đáy $C D = 16$ cm. Tính độ dài đoạn thẳng $P Q$ (tính bằng xăng-ti-mét).],
    [8],
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.0, 0.8)
      let B = (-2.2, -0.6)
      let C = (1.8, -0.6)
      let D = (3.0, 0.8)
      let S = (-1.0, 3.0)
      
      let M = (-1.0, 1.9) // trung điểm SA
      let N = (-1.6, 1.2) // trung điểm SB
      let Q = (0.4, 1.2)  // trung điểm SC
      let P = (1.0, 1.9)  // trung điểm SD
      
      // Vẽ màu fill cho thiết diện MNPQ
      line(M, N, Q, P, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Hidden edges of pyramid
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Hidden edges of cross-section
      line(P, M, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges of pyramid
      line(S, B, stroke: 1pt + black)
      line(S, C, stroke: 1pt + black)
      line(S, D, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      
      // Visible edges of cross-section
      line(N, Q, stroke: 1.5pt + rgb("#0F766E"))
      line(Q, P, stroke: 1.5pt + rgb("#0F766E"))
      
      circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.35), $S$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) - 0.3, B.at(1) - 0.3), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.3, C.at(1) - 0.3), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) + 0.35, D.at(1) + 0.2), $D$, size: 10pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.35, M.at(1) + 0.15), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) - 0.3, N.at(1) - 0.3), $N$, size: 10pt, fill: rgb("#0F766E"))
      circle(Q, radius: 1.8pt, fill: rgb("#0F766E")); content((Q.at(0) + 0.3, Q.at(1) - 0.3), $Q$, size: 10pt, fill: rgb("#0F766E"))
      circle(P, radius: 1.8pt, fill: rgb("#0F766E")); content((P.at(0) + 0.35, P.at(1) + 0.15), $P$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Ta có $M N$ là đường trung bình của tam giác $S A B => M N parallel A B parallel C D$.
        Mặt phẳng $(alpha)$ chứa $M N$ song song với $C D$ nên cắt mặt bên $(S C D)$ theo giao tuyến $P Q$ song song với $C D$.
        Vì $M$ là trung điểm $S A$ và $(alpha) parallel (A B C D)$ nên $P, Q$ là trung điểm của $S D, S C$.
        Do đó $P Q$ là đường trung bình của tam giác $S C D => P Q = (1)/(2) C D = 8$ cm.
    ]
)

// TL 4
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M, N$ lần lượt là trung điểm của các cạnh $S A$ và $S C$. Mặt phẳng $(B M N)$ cắt cạnh bên $S D$ tại $P$. Tính tỉ số $(S D) / (S P)$.],
    [3],
    loigiai: [
        Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$.
        Trong tam giác $S A C$, $M N$ là đường trung bình nên $M N parallel A C$ và $M N$ cắt $S O$ tại trung điểm $I$ của $S O$.
        Đường thẳng $B I$ nằm trong mặt phẳng $(S B D)$ cắt cạnh $S D$ tại $P$.
        Áp dụng định lý Menelaus cho tam giác $S O D$ với cát tuyến $B-I-P$:
        $ (I S) / (I O) dot (B O) / (B D) dot (P D) / (P S) = 1 $.
        Vì $I$ là trung điểm $S O => (I S) / (I O) = 1$.
        Vì $O$ là trung điểm $B D => (B O) / (B D) = (1)/(2)$.
        Do đó: $1 dot (1)/(2) dot (P D) / (P S) = 1 => P D = 2 P S$.
        Vì $P$ nằm trên đoạn $S D$ nên $S D = S P + P D = 3 S P => (S D) / (S P) = 3$.
    ]
)

// TL 5
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành $A B C D$. Gọi $M$ là trung điểm của cạnh $S A$. Mặt phẳng $(alpha)$ qua $M$ và song song với đáy $(A B C D)$ cắt các cạnh bên $S B, S C, S D$ lần lượt tại $N, P, Q$. Biết diện tích hình bình hành đáy $S_(A B C D) = 36$ $"cm"^2$. Tính diện tích thiết diện $M N P Q$ (tính bằng xăng-ti-mét vuông).],
    [9],
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
      let Q = (1.0, 1.9)  // trung điểm SD
      
      // Vẽ màu fill cho thiết diện MNPQ
      line(M, N, P, Q, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Hidden edges of pyramid
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Hidden edges of cross-section
      line(Q, M, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges of pyramid
      line(S, B, stroke: 1pt + black)
      line(S, C, stroke: 1pt + black)
      line(S, D, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      
      // Visible edges of cross-section
      line(N, P, stroke: 1.5pt + rgb("#0F766E"))
      line(P, Q, stroke: 1.5pt + rgb("#0F766E"))
      
      circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.35), $S$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) - 0.3, B.at(1) - 0.3), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.3, C.at(1) - 0.3), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) + 0.35, D.at(1) + 0.2), $D$, size: 10pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.35, M.at(1) + 0.15), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) - 0.3, N.at(1) - 0.3), $N$, size: 10pt, fill: rgb("#0F766E"))
      circle(P, radius: 1.8pt, fill: rgb("#0F766E")); content((P.at(0) + 0.3, P.at(1) - 0.3), $P$, size: 10pt, fill: rgb("#0F766E"))
      circle(Q, radius: 1.8pt, fill: rgb("#0F766E")); content((Q.at(0) + 0.35, Q.at(1) + 0.15), $Q$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Vì mặt phẳng $(alpha)$ song song với mặt phẳng đáy $(A B C D)$ nên thiết diện $M N P Q$ là hình bình hành đồng dạng với đáy $A B C D$ theo tỉ số $k = (S M) / (S A) = (1)/(2)$ .
        Do đó:
        $ S_(M N P Q) = k^2 dot S_(A B C D) = ((1)/(2))^2 dot 36 = 9 " (cm"^2")" $.
    ]
)

// TL 6
#tln([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $B C, A' C'$. Gọi $d$ là giao tuyến của hai mặt phẳng $(A M N)$ và $(A' B' C')$. Biết $A' B' = 12$ cm. Tính độ dài đoạn thẳng thiết diện của giao tuyến $d$ nằm bên trong tam giác đáy $A' B' C'$ (tính bằng xăng-ti-mét).],
    [6],
    loigiai: [
        Ta có $M N$ là đường thẳng nối trung điểm $B C$ (đáy dưới) và $A' C'$ (đáy trên).
        Giao tuyến của $(A M N)$ với mặt phẳng đáy $(A' B' C')$ là đường thẳng qua $N$.
        Vì $A M$ là đường thẳng nối đỉnh $A$ và trung điểm $M$ của $B C$.
        Đường thẳng qua $N$ song song với $A M$ (phép chiếu song song) chính là giao tuyến $d$.
        Trong mặt phẳng đáy $(A' B' C')$, giao tuyến $d$ đi qua trung điểm $N$ của $A' C'$ và song song với $A' B'$ (do hình chiếu song song của $A M$ trên mặt đáy song song với $A' B'$).
        Do đó đoạn giao tuyến nằm trong tam giác đáy $A' B' C'$ là đường trung bình của tam giác $A' B' C'$, độ dài bằng:
        $ L = (1)/(2) A' B' = (1)/(2) dot 12 = 6 $ cm.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
