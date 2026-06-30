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
  exam-title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 09)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Trong không gian, cho hai đường thẳng chéo nhau $a$ và $b$. Có bao nhiêu mặt phẳng song song với cả hai đường thẳng đó?],
    (
        [Có duy nhất một.],
        [Có đúng hai.],
        [Không có mặt phẳng nào.],
        True([Có vô số.])
    ),
    loigiai: [
        Ta chọn một mặt phẳng $(P)$ song song với cả $a$ và $b$ bằng cách lấy điểm $O$ bất kỳ và dựng hai đường thẳng lần lượt song song với $a$ và $b$.
        Mỗi mặt phẳng song song với mặt phẳng $(P)$ đều song song với cả $a$ và $b$, do đó có vô số mặt phẳng như vậy.
    ]
)

// TN 2
#tn([Cho đường thẳng $a$ nằm trong mặt phẳng $(P)$ và đường thẳng $b$ nằm trong mặt phẳng $(Q)$. Biết $(P) parallel (Q)$. Khẳng định nào sau đây đúng?],
    (
        [ $a$ cắt $b$. ],
        [ $a$ trùng $b$. ],
        True([ $a$ song song hoặc chéo với $b$. ]),
        [ $a$ vuông góc với $b$. ]
    ),
    loigiai: [
        Vì hai mặt phẳng chứa hai đường thẳng song song với nhau nên hai đường thẳng đó không có điểm chung. Do đó chúng song song hoặc chéo nhau.
    ]
)

// TN 3
#tn([Cho tứ diện $A B C D$. Các điểm $M, N$ lần lượt là trung điểm của các cạnh $A B, A C$. Giao tuyến của hai mặt phẳng $(D M N)$ và $(B C D)$ song song với đường thẳng nào dưới đây?],
    (
        [$A B$],
        [$A C$],
        True([$B C$]),
        [$A D$]
    ),
    loigiai: [
        Ta có $M N$ là đường trung bình của tam giác $A B C => M N parallel B C$.
        Giao tuyến của mặt phẳng $(D M N)$ và $(B C D)$ là đường thẳng đi qua điểm chung $D$ và song song với $M N parallel B C$.
    ]
)

// TN 4
#tn([Trong các mệnh đề sau, mệnh đề nào là đúng?],
    (
        [Hai mặt phẳng phân biệt cùng song song với một đường thẳng thì song song với nhau.],
        [Một đường thẳng song song với một trong hai đường thẳng chéo nhau thì cắt đường thẳng còn lại.],
        True([Hai mặt phẳng phân biệt cùng song song với mặt phẳng thứ ba thì song song với nhau.]),
        [Nếu hai mặt phẳng song song thì mọi đường thẳng thuộc mặt phẳng này song song với mọi đường thẳng thuộc mặt phẳng kia.]
    ),
    loigiai: [
        Tính chất song song của ba mặt phẳng phân biệt: hai mặt phẳng cùng song song với mặt phẳng thứ ba thì song song với nhau.
    ]
)

// TN 5
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Đường thẳng nào sau đây song song với mặt phẳng $(A B C D)$?],
    (
        [$A B'$],
        [$B C'$],
        True([$A' C'$]),
        [$B D'$]
    ),
    loigiai: [
        Ta có $A' C' parallel A C$ (do $A' C' C A$ là hình bình hành).
        Mà $A C subset (A B C D)$, do đó $A' C' parallel (A B C D)$.
    ]
)

// TN 6
#tn([Cho phép chiếu song song. Phép chiếu song song bảo toàn tính chất nào sau đây của các hình hình học?],
    (
        [Khoảng cách giữa hai điểm bất kỳ.],
        [Độ lớn góc giữa hai đường thẳng.],
        True([Thứ tự của ba điểm thẳng hàng.]),
        [Diện tích của các hình phẳng.]
    ),
    loigiai: [
        Phép chiếu song song bảo toàn tính thẳng hàng và thứ tự của ba điểm thẳng hàng, cũng như tỉ số độ dài các đoạn thẳng song song.
    ]
)

// TN 7
#tn([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ là các điểm trên các cạnh $A A', B B'$ sao cho $(A M) / (A A') = (B N) / (B B') = 1/2$. Giao tuyến của mặt phẳng $(C M N)$ và mặt phẳng đáy $(A B C)$ song song với đường thẳng nào?],
    (
        [$A C$],
        [$B C$],
        True([$A B$]),
        [$C C'$]
    ),
    loigiai: [
        Vì $(A M) / (A A') = (B N) / (B B') = 1/2$ nên $M N parallel A B$.
        Mặt phẳng $(C M N)$ chứa $M N parallel A B$ nên cắt mặt đáy $(A B C)$ chứa $A B$ theo giao tuyến qua $C$ song song với $A B$.
    ]
)

// TN 8
#tn([Cho hai đường thẳng song song $a$ và $b$, và đường thẳng $b$ song song với mặt phẳng $(P)$. Khẳng định nào sau đây đúng về vị trí của $a$ đối với $(P)$?],
    (
        [ $a$ cắt $(P)$. ],
        [ $a$ vuông góc với $(P)$. ],
        True([ $a$ song song hoặc nằm trong $(P)$. ]),
        [ $a$ chéo với $(P)$. ]
    ),
    loigiai: [
        Vì $a parallel b$ và $b parallel (P)$ nên đường thẳng $a$ phải song song với $(P)$ hoặc trùng với một đường thẳng nằm trong $(P)$ (tức là $a$ nằm trong $(P)$).
    ]
)

// TN 9
#tn([Cho hình chóp cụt tam giác $A B C . A' B' C'$. Mặt phẳng song song với hai đáy cắt các cạnh bên $A A', B B', C C'$ lần lượt tại $D, E, F$. Khẳng định nào sau đây đúng?],
    (
        [Tam giác $D E F$ bằng tam giác $A B C$.],
        [Tam giác $D E F$ bằng tam giác $A' B' C'$.],
        True([Tam giác $D E F$ đồng dạng với tam giác $A B C$.]),
        [Tứ giác $D E F$ là hình thang.]
    ),
    loigiai: [
        Thiết diện cắt bởi mặt phẳng song song với đáy của hình chóp cụt là một hình đồng dạng với đáy. Do đó tam giác $D E F$ đồng dạng với tam giác $A B C$.
    ]
)

// TN 10
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $O$ là giao điểm của hai đường chéo $A' C$ và $B D'$. Khẳng định nào sau đây đúng?],
    (
        [ $O$ là trung điểm của $A B'$. ],
        True([ $O$ là trung điểm của tất cả các đường chéo của hình hộp. ]),
        [ $O$ nằm trên cạnh $A' B$. ],
        [ $O$ trùng với đỉnh $A$. ]
    ),
    loigiai: [
        Trong hình hộp, các đường chéo $A C', B D', C A', D B'$ cắt nhau tại trung điểm của mỗi đường. Điểm đó chính là tâm đối xứng $O$ của hình hộp.
    ]
)

// TN 11
#tn([Cho hai đường thẳng chéo nhau $a$ và $b$. Đường thẳng $c$ cắt cả hai đường thẳng $a$ và $b$. Khẳng định nào sau đây đúng?],
    (
        [Luôn tồn tại mặt phẳng chứa cả ba đường thẳng $a, b, c$.],
        [Đường thẳng $a$ và $b$ chắc chắn song song.],
        True([Đường thẳng $c$ không thể song song với $a$ hoặc $b$.]),
        [Đường thẳng $c$ song song với mặt phẳng chứa $a$ và $b$.]
    ),
    loigiai: [
        Vì $c$ cắt $a$ và $b$ nên $c$ có điểm chung với chúng, không thể song song với chúng. Đồng thời do $a, b$ chéo nhau nên cả ba đường thẳng không thể đồng phẳng.
    ]
)

// TN 12
#tn([Cho hình lập phương $A B C D . A' B' C' D'$. Hình chiếu song song của hình lập phương lên mặt phẳng đáy $(A B C D)$ theo phương chiếu $A A'$ là hình gì?],
    (
        [Hình lập phương.],
        True([Hình vuông $A B C D$.]),
        [Hình thoi $A B C D$.],
        [Hình tam giác $A B C$.]
    ),
    loigiai: [
        Phép chiếu song song theo phương cạnh bên $A A'$ biến toàn bộ hình lập phương thành hình chiếu trên mặt đáy là hình vuông đáy $A B C D$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình thang với đáy lớn $A B$ ($A B parallel C D, A B = 3 C D$). Gọi $M$ là trung điểm của cạnh bên $S A$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng qua $M$ song song với $A B$ sẽ song song với mặt phẳng $(S C D)$.]),
        [Mặt phẳng $(M C D)$ cắt cạnh bên $S B$ tại điểm $N$ sao cho $(S N) / (S B) = 2/3$.],
        True([Thiết diện của hình chóp cắt bởi mặt phẳng $(M C D)$ là hình thang.]),
        [Giao tuyến của hai mặt phẳng $(S A B)$ và $(S C D)$ song song với $A D$.]
    ), 
    loigiai: [
        - *a)* Đúng. Đường thẳng qua $M$ song song với $A B$ nên cũng song song với $C D$. Mà $C D subset (S C D)$, do đó đường thẳng này song song với $(S C D)$.
        - *b)* Sai. Vì $M$ là trung điểm $S A$ và mặt phẳng $(M C D)$ chứa $C D parallel A B$, nên giao tuyến của $(M C D)$ với mặt $(S A B)$ là đường thẳng qua $M$ song song với $A B$, cắt $S B$ tại trung điểm $N$ của $S B$. Do đó $(S N) / (S B) = 1/2$.
        - *c)* Đúng. Thiết diện thu được là hình thang $M N C D$ do có hai cạnh đáy $M N parallel C D$ song song với nhau.
        - *d)* Sai. Hai mặt phẳng $(S A B)$ và $(S C D)$ chứa hai đường thẳng song song $A B$ và $C D$, do đó giao tuyến là đường thẳng qua $S$ song song với $A B$ (không song song với $A D$).
    ]
)

// DS 2
#ds([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N, P$ lần lượt là trung điểm của các cạnh đáy dưới $A B, B C, C A$. Các phát biểu sau đúng hay sai?], (
        True([Mặt phẳng $(M N P)$ song song với mặt phẳng đáy trên $(A' B' C')$.]),
        True([Đường thẳng nối $M$ và trung điểm $M'$ của $A' B'$ song song với cạnh bên $C C'$.]),
        True([Hình chiếu song song của thiết diện $M N P$ lên mặt đáy trên $(A' B' C')$ theo phương chiếu $C C'$ là tam giác $M' N' P'$ (với $M', N', P'$ là trung điểm các cạnh đáy trên).]),
        [Giao tuyến của mặt phẳng $(M N C')$ và mặt phẳng $(A B C)$ là đường thẳng $A C$.]
    ), 
    loigiai: [
        - *a)* Đúng. Vì mặt phẳng chứa các đường trung bình $(M N P)$ trùng với mặt phẳng đáy dưới $(A B C)$, do đó nó song song với đáy trên $(A' B' C')$.
        - *b)* Đúng. Đường nối trung điểm hai cạnh tương ứng ở hai đáy song song với các cạnh bên: $M M' parallel A A' parallel C C'$.
        - *c)* Đúng. Phép chiếu song song biến các trung điểm đáy dưới thành trung điểm đáy trên tương ứng.
        - *d)* Sai. Giao tuyến của $(M N C')$ với $(A B C)$ là đường thẳng $M N$ (chứ không phải $A C$).
    ]
)

// DS 3
#ds([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $O_1$ và $O_2$ lần lượt là tâm của các hình bình hành mặt bên đối diện $A D D' A'$ và $B C C' B'$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $O_1 O_2$ song song với đường thẳng $A B$.]),
        True([Đường thẳng $O_1 O_2$ song song với mặt phẳng đáy $(A B C D)$.]),
        True([Mặt phẳng chứa $O_1 O_2$ và song song với mặt bên $(A B B' A')$ là mặt phẳng đi qua trung điểm của các cạnh đáy $A D$ và $B C$.]),
        True([Đường thẳng $O_1 B'$ cắt đường thẳng $O_2 A'$ tại trung điểm mỗi đường.])
    ), 
    loigiai: [
        - *a)* Đúng. Tâm mặt bên đối diện liên kết tạo thành đoạn thẳng song song với các cạnh đáy ngang: $O_1 O_2 parallel A B parallel C D$.
        - *b)* Đúng. Vì $O_1 O_2 parallel A B subset (A B C D)$ nên $O_1 O_2 parallel (A B C D)$.
        - *c)* Đúng. Mặt phẳng song song với mặt bên đứng $(A B B' A')$ đi qua $O_1, O_2$ phải đi qua trung điểm các cạnh vuông góc tương ứng $A D$ và $B C$.
        - *d)* Đúng. Vì tứ giác $A' O_1 B' O_2$ là hình bình hành do có các cạnh song song và bằng nhau, nên hai đường chéo cắt nhau tại trung điểm mỗi đường.
    ]
)

// DS 4
#ds([Một hệ khung chịu lực giàn giáo có kết cấu dạng hình chóp cụt tam giác $A B C . A' B' C'$. Các mặt phẳng đáy song song với nhau. Gọi $M, N, P$ lần lượt là trung điểm của các cạnh bên $A A', B B', C C'$. Các phát biểu sau đúng hay sai?], (
        True([Thiết diện cắt bởi mặt phẳng $(M N P)$ là tam giác đồng dạng với đáy tam giác $A B C$.]),
        True([Mặt phẳng $(M N P)$ song song với cả hai mặt đáy.]),
        True([Chu vi của thiết diện $M N P$ bằng trung bình cộng chu vi hai đáy $A B C$ và $A' B' C'$.]),
        [Đường thẳng $M N$ chéo với đường thẳng $A' B'$.]
    ), 
    loigiai: [
        - *a)* Đúng. Thiết diện song song đáy là tam giác đồng dạng với hai đáy.
        - *b)* Đúng. Mặt phẳng đi qua trung điểm các cạnh bên của hình chóp cụt song song với hai đáy.
        - *c)* Đúng. Các cạnh của thiết diện $M N, N P, P M$ lần lượt là đường trung bình các mặt bên hình thang, nên mỗi cạnh bằng trung bình cộng hai cạnh đáy tương ứng. Suy ra chu vi bằng trung bình cộng chu vi hai đáy.
        - *d)* Sai. Vì $M, N$ là trung điểm các cạnh bên nên $M N$ là đường trung bình của hình thang mặt bên $A B B' A' => M N parallel A' B'$ (chúng song song chứ không chéo nhau).
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M$ là trung điểm của cạnh bên $S B$. Mặt phẳng $(alpha)$ đi qua $M$ và song song với cả $B C$ và $S A$. Mặt phẳng $(alpha)$ cắt cạnh bên $S D$ tại $P$. Biết độ dài cạnh $S D = 16$ cm. Tính độ dài đoạn thẳng $S P$ (tính bằng xăng-ti-mét).],
    [8],
    loigiai: [
        Mặt phẳng $(alpha)$ song song với $B C$ nên $(alpha) parallel A D$.
        Vì $M$ là trung điểm $S B$ và $(alpha) parallel S A$ nên giao tuyến của $(alpha)$ với mặt bên $(S A B)$ là đường trung bình $M H$ song song với $S A$ ($H$ là trung điểm $A B$).
        Giao tuyến của $(alpha)$ với đáy $(A B C D)$ là đường thẳng qua $H$ song song với $A D$ (và $B C$), đường này cắt $C D$ tại trung điểm $I$ của $C D$.
        Trong mặt phẳng $(S A D)$, giao tuyến qua $H$ (trung điểm $A B$ là không đúng, qua trung điểm $A D$) song song với $S A$ cắt $S D$ tại trung điểm $P$.
        Do đó $P$ là trung điểm của $S D => S P = (1)/(2) S D = 8$ cm.
    ]
)

// TL 2
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A' B'$ và $B' C'$. Mặt phẳng $(D M N)$ cắt cạnh bên $C C'$ tại điểm $P$. Tính tỉ số $(C' P) / (C C')$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [5],
    loigiai: [
        Mặt phẳng $(D M N)$ chứa đường thẳng $M N$ là đường trung bình của tam giác $A' B' C' => M N parallel A' C' parallel A C$.
        Giao tuyến của $(D M N)$ với mặt đáy dưới $(A B C D)$ là đường thẳng qua $D$ song song với $A C$, cắt đường thẳng $B C$ kéo dài tại $E$.
        Trong mặt bên $(B C C' B')$, đường thẳng nối $N$ và $E$ cắt cạnh bên $C C'$ tại $P$.
        Theo tính chất tỉ số:
        $ (C' P) / (C C') = 1/4 $.
        Kết quả viết dưới dạng phân số tối giản là $1/4$, suy ra $a = 1, b = 4 => a + b = 5$.
    ]
)

// TL 3
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành $A B C D$. Gọi $M, N$ là các điểm lần lượt trên các cạnh bên $S A, S B$ sao cho $(S M) / (S A) = 2/3, (S N) / (S B) = 2/3$. Mặt phẳng $(alpha)$ đi qua $M, N$ và song song với đáy $(A B C D)$ cắt các cạnh bên $S D, S C$ lần lượt tại $P, Q$. Biết độ dài cạnh đáy $C D = 15$ cm. Tính độ dài đoạn thẳng $P Q$ (tính bằng xăng-ti-mét).],
    [10],
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.0, 0.8)
      let B = (-2.2, -0.6)
      let C = (1.8, -0.6)
      let D = (3.0, 0.8)
      let S = (-1.0, 3.0)
      
      let M = (-1.0, 1.53) // SA ratio 2/3 from S
      let N = (-1.8, 0.6)  // SB ratio 2/3 from S
      let Q = (0.87, 0.6)  // SC ratio 2/3 from S
      let P = (1.67, 1.53) // SD ratio 2/3 from S
      
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
        Vì $(alpha)$ song song với đáy $(A B C D)$ nên theo định lý Thales trong hình chóp:
        $ (S P) / (S D) = (S Q) / (S C) = (S M) / (S A) = 2/3 $.
        Do $(alpha) parallel (A B C D)$ nên $P Q parallel C D$.
        Trong tam giác $S C D$, ta có $P Q parallel C D => (P Q) / (C D) = (S P) / (S D) = 2/3$.
        Do đó:
        $ P Q = (2)/(3) C D = (2)/(3) dot 15 = 10 $ cm.
    ]
)

// TL 4
#tln([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $A C$. Mặt phẳng $(alpha)$ đi qua $M$ và song song với cả $B N$ và $A A'$. Mặt phẳng $(alpha)$ cắt đường thẳng $B C$ tại điểm $K$. Biết độ dài cạnh đáy $B C = 18$ cm. Tính độ dài đoạn thẳng $B K$ (tính bằng xăng-ti-mét).],
    [9],
    loigiai: [
        Mặt phẳng $(alpha) parallel A A'$ cắt đáy $(A B C)$ theo giao tuyến song song với mặt bên đứng.
        Hơn nữa $(alpha) parallel B N$ nên giao tuyến của $(alpha)$ với đáy $(A B C)$ qua $M$ song song với $B N$, cắt đường thẳng $B C$ tại $K$.
        Trong tam giác $A B C$, ta có $M$ là trung điểm $A B$, đường thẳng $M K$ song song với $B N$ ($N$ là trung điểm $A C$).
        Theo định lý Thales, tỉ số $(B K) / (B C) = 1/2$.
        Do đó:
        $ B K = (1)/(2) B C = (1)/(2) dot 18 = 9 $ cm.
    ]
)

// TL 5
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $G$ là trọng tâm của tam giác $A' B D$. Đường thẳng $A G$ cắt mặt phẳng $(B D C')$ tại điểm $I$. Tính tỉ số $(A I) / (A G)$.],
    [2],
    loigiai: [
        Trong hình hộp, đường chéo chính $A C'$ cắt hai mặt phẳng song song $(A' B D)$ và $(B D C')$ tại các điểm $G$ và $I$ chia đường chéo chính thành ba phần bằng nhau:
        $ A G = G I = I C' = (1)/(3) A C' $.
        Do đó $G$ chính là trọng tâm tam giác $A' B D$, và $I$ là giao điểm nằm trên $A C'$ sao cho $A I = A G + G I = 2 A G$.
        Suy ra tỉ số $(A I) / (A G) = 2$.
    ]
)

// TL 6
#tln([Bóng của một cột cờ đứng thẳng trên mặt đất phẳng dài $8$ m. Cùng lúc đó, bóng của một cọc gỗ cao $2$ m dựng thẳng đứng dài $1.6$ m. Tính chiều cao của cột cờ (tính bằng mét).],
    [10],
    loigiai: [
        Vì các tia sáng mặt trời chiếu song song nên cột cờ và cọc gỗ tạo với bóng của chúng các tam giác vuông đồng dạng.
        Gọi $H$ là chiều cao của cột cờ.
        Ta có tỉ số đồng dạng:
        $ H / 8 = 2 / 1.6 => H = (8 dot 2) / (1.6) = 10 $ (m).
        Chiều cao của cột cờ là $10$ m.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
