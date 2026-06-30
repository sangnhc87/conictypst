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
  exam-title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 08)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho hình lập phương $A B C D . A' B' C' D'$. Đường thẳng $A C'$ chéo với đường thẳng nào dưới đây?],
    (
        [$A A'$],
        [$A C$],
        [$A' C'$],
        True([$B D$])
    ),
    loigiai: [
        Đường thẳng $A C'$ đi qua hai đỉnh đối diện của hình lập phương.
        Đường thẳng $B D$ nằm ở mặt đáy đáy dưới $(A B C D)$ và không có điểm chung cũng như không cùng nằm trong bất kỳ mặt phẳng nào chứa $A C'$, do đó chúng chéo nhau.
    ]
)

// TN 2
#tn([Cho hai mặt phẳng song song $(P)$ và $(Q)$. Nếu đường thẳng $a$ song song với mặt phẳng $(P)$ thì vị trí của $a$ đối với $(Q)$ là gì?],
    (
        [Chắc chắn song song.],
        [Nằm trong mặt phẳng $(Q)$.],
        True([Song song hoặc nằm trong mặt phẳng $(Q)$.]),
        [Cắt mặt phẳng $(Q)$.]
    ),
    loigiai: [
        Vì $(P) parallel (Q)$ nên bất kỳ đường thẳng nào song song với $(P)$ cũng sẽ song song với $(Q)$ hoặc nằm hoàn toàn trong $(Q)$.
    ]
)

// TN 3
#tn([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $G_1, G_2$ lần lượt là trọng tâm của tam giác $S A B$ và $S C D$. Khẳng định nào sau đây đúng?],
    (
        True([$G_1 G_2 parallel (A B C D)$]),
        [$G_1 G_2$ cắt $(A B C D)$.],
        [$G_1 G_2$ chéo với $A D$.],
        [$G_1 G_2 parallel S B$.]
    ),
    loigiai: [
        Gọi $M, N$ lần lượt là trung điểm của $A B, C D$.
        Ta có $G_1$ nằm trên trung tuyến $S M$ và $G_2$ nằm trên trung tuyến $S N$.
        Theo tính chất trọng tâm: $(S G_1) / (S M) = (S G_2) / (S N) = 2/3 => G_1 G_2 parallel M N$.
        Mà $M N parallel A D parallel B C$ (do $A B C D$ là hình bình hành), do đó $G_1 G_2 parallel (A B C D)$.
    ]
)

// TN 4
#tn([Cho phép chiếu song song theo phương $l$ lên mặt phẳng $(P)$. Khẳng định nào sau đây đúng?],
    (
        [Phép chiếu song song luôn bảo toàn khoảng cách giữa hai điểm bất kỳ.],
        [Hình chiếu song song của một tam giác luôn luôn là một tam giác.],
        True([Phép chiếu song song bảo toàn tỉ số độ dài của hai đoạn thẳng song song.]),
        [Hình chiếu của một đường thẳng luôn là một điểm.]
    ),
    loigiai: [
        Theo tính chất của phép chiếu song song, nó bảo toàn tính song song và tỉ số độ dài của hai đoạn thẳng song song.
    ]
)

// TN 5
#tn([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Mặt phẳng đi qua cạnh $A B$ và song song với cạnh bên $C C'$ sẽ cắt mặt bên $A C C' A'$ của lăng trụ theo giao tuyến song song với đường thẳng nào?],
    (
        [$B C$],
        True([$A A'$]),
        [$A C$],
        [$A B$]
    ),
    loigiai: [
        Mặt phẳng $(alpha)$ chứa $A B$ và song song với $C C'$.
        Vì $C C' parallel A A'$ nên $(alpha) parallel A A'$.
        Mặt khác, $(alpha)$ cắt mặt bên $(A C C' A')$ chứa $A A'$ theo giao tuyến đi qua $A$, do đó giao tuyến này phải song song với $A A'$.
    ]
)

// TN 6
#tn([Trong các mệnh đề sau, mệnh đề nào đúng?],
    (
        [Hai mặt phẳng cùng song song với một đường thẳng thì song song với nhau.],
        True([Hai mặt phẳng phân biệt cùng song song với mặt phẳng thứ ba thì song song với nhau.]),
        [Hai mặt phẳng cùng cắt một mặt phẳng thứ ba thì song song với nhau.],
        [Hai mặt phẳng không có điểm chung thì cắt nhau.]
    ),
    loigiai: [
        Đây là tính chất bắc cầu của quan hệ song song giữa các mặt phẳng phân biệt trong không gian.
    ]
)

// TN 7
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $O$ là giao điểm của $A C$ và $B D$. Đường thẳng $A' O$ song song với mặt phẳng nào sau đây?],
    (
        [$(A B D)$],
        True([$(C B' D')$]),
        [$(A B B' A')$],
        [$(A C C' A')$]
    ),
    loigiai: [
        Ta có $A' C' parallel A C$ và $A' C' = A C$. Tứ giác $A' C' C A$ là hình bình hành.
        Nối $B' D'$ cắt $A' C'$ tại $O'$.
        Ta có $O O' parallel A A' parallel C C'$ và $O O' = A A'$.
        Tứ giác $A' O C' O'$ là hình bình hành => $A' O parallel C' O'$.
        Mà $C' O' subset (C B' D')$, do đó $A' O parallel (C B' D')$.
    ]
)

// TN 8
#tn([Cho ba mặt phẳng song song $(P), (Q), (R)$. Hai đường thẳng $d_1$ và $d_2$ cắt ba mặt phẳng này lần lượt tại các điểm $A, B, C$ và $D, E, F$. Biết $A B = 2$ cm, $A C = 6$ cm, $D F = 9$ cm. Độ dài đoạn thẳng $D E$ là:],
    (
        [$2$ cm.],
        True([$3$ cm.]),
        [$4$ cm.],
        [$6$ cm.]
    ),
    loigiai: [
        Ta có $B C = A C - A B = 6 - 2 = 4$ cm.
        Theo định lý Thales trong không gian:
        $ (A B) / (A C) = (D E) / (D F) => (2) / (6) = (D E) / (9) => D E = 3 $ cm.
    ]
)

// TN 9
#tn([Cho hình chóp $S.A B C D$ đáy là hình bình hành. Thiết diện của hình chóp cắt bởi mặt phẳng song song với mặt bên $(S A B)$ là hình gì?],
    (
        [Tam giác.],
        True([Hình thang.]),
        [Hình bình hành.],
        [Hình chữ nhật.]
    ),
    loigiai: [
        Mặt phẳng $(alpha) parallel (S A B)$ cắt các mặt chứa các cạnh song song tương ứng.
        Nó cắt đáy $(A B C D)$ theo giao tuyến song song với $A B$, cắt mặt bên $(S C D)$ theo giao tuyến song song với $C D$ (và $A B$).
        Cắt các mặt bên $(S B C)$ và $(S A D)$ theo các đoạn thẳng song song với $S B$ và $S A$.
        Do hai giao tuyến trên đáy và mặt bên đối diện song song với nhau nhưng có độ dài khác nhau nên thiết diện thu được là hình thang.
    ]
)

// TN 10
#tn([Cho tứ diện $A B C D$. Gọi $G_1, G_2, G_3$ lần lượt là trọng tâm của tam giác $A B C, A C D, A B D$. Khẳng định nào sau đây đúng?],
    (
        True([Mặt phẳng $(G_1 G_2 G_3) parallel (B C D)$]),
        [Mặt phẳng $(G_1 G_2 G_3) parallel (A B C)$],
        [Đường thẳng $G_1 G_2$ cắt $B D$.],
        [Đường thẳng $G_1 G_3$ chéo với $C D$.]
    ),
    loigiai: [
        Gọi $M, N, P$ lần lượt là trung điểm của $B C, C D, B D$.
        Ta có các tỉ số trọng tâm xuất phát từ $A$ đều bằng $2/3$, do đó các tam giác $G_1 G_2 G_3$ và $M N P$ song song với nhau.
        Mà $(M N P)$ chính là mặt phẳng đáy $(B C D)$, suy ra $(G_1 G_2 G_3) parallel (B C D)$.
    ]
)

// TN 11
#tn([Cho hai đường thẳng chéo nhau $a$ và $b$. Đường thẳng $c$ song song với $a$. Khẳng định nào sau đây đúng?],
    (
        [$c$ và $b$ chắc chắn song song.],
        [$c$ và $b$ chắc chắn cắt nhau.],
        True([$c$ và $b$ chéo nhau hoặc cắt nhau.]),
        [$c$ và $b$ trùng nhau.]
    ),
    loigiai: [
        Vì $c parallel a$ và $a, b$ chéo nhau nên $c$ và $b$ không thể song song hay trùng nhau.
        Do đó chúng chỉ có thể chéo nhau hoặc cắt nhau trong không gian.
    ]
)

// TN 12
#tn([Hình hộp $A B C D . A' B' C' D'$ có tất cả bao nhiêu mặt chéo (mặt phẳng đi qua 4 đỉnh của hình hộp nhưng không phải là mặt bên)?],
    (
        [$4$],
        True([$6$]),
        [$8$],
        [$12$]
    ),
    loigiai: [
        Các mặt chéo của hình hộp được tạo bởi hai đường chéo song song của hai mặt đối diện.
        Có 6 mặt chéo: $(A B C' D')$, $(C D A' B')$, $(B C D' A')$, $(A D C' B')$, $(A C C' A')$, $(B D D' B')$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho tứ diện $A B C D$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $C D$. Mặt phẳng $(alpha)$ chứa đường thẳng $M N$ và song song với $B C$. Các phát biểu sau đúng hay sai?], (
        True([Mặt phẳng $(alpha)$ cắt mặt bên $(B C D)$ theo giao tuyến song song với $B C$.]),
        True([Mặt phẳng $(alpha)$ cắt cạnh $A C$ tại trung điểm $P$ của $A C$.]),
        True([Thiết diện của tứ diện cắt bởi mặt phẳng $(alpha)$ là hình bình hành.]),
        [Đường thẳng $A D$ song song với mặt phẳng $(alpha)$.]
    ), 
    loigiai: [
        - *a)* Đúng. Vì $(alpha) parallel B C$ nên giao tuyến của $(alpha)$ với mọi mặt phẳng chứa $B C$ (hoặc song song) phải song song với $B C$.
        - *b)* Đúng. Trong tam giác $A B C$, qua $M$ (trung điểm $A B$) vẽ đường thẳng song song với $B C$, đường này phải cắt $A C$ tại trung điểm $P$ của $A C$.
        - *c)* Đúng. Tương tự trong tam giác $B C D$, qua $N$ vẽ đường song song với $B C$ cắt $B D$ tại trung điểm $Q$ của $B D$. Thiết diện là hình bình hành $M P N Q$ do có hai cặp cạnh đối song song và bằng một nửa $B C$.
        - *d)* Sai. Đường thẳng $A D$ cắt thiết diện $(alpha)$ tại điểm $N$ (trung điểm $C D$ là không đúng, cắt tại điểm thuộc giao tuyến $P Q$).
    ]
)

// DS 2
#ds([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $O_1, O_2$ lần lượt là tâm của hai đáy $A B C D$ và $A' B' C' D'$. Gọi $M$ là trung điểm của cạnh bên $A A'$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $O_1 O_2$ song song với mặt phẳng $(A B B' A')$.]),
        [Đường thẳng $M O_1$ song song với mặt phẳng $(A' B' C' D')$.],
        True([Giao tuyến của mặt phẳng $(M B D)$ và mặt phẳng $(A' B' C' D')$ song song với $B D$.]),
        True([Thiết diện của hình hộp cắt bởi mặt phẳng $(M B D)$ là hình thang.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $O_1 O_2 parallel A A' parallel B B' => O_1 O_2 parallel (A B B' A')$.
        - *b)* Sai. $M$ thuộc $A A'$ và $O_1$ thuộc đáy $(A B C D)$, đường $M O_1$ cắt mặt phẳng đáy trên chứ không song song.
        - *c)* Đúng. Mặt phẳng $(M B D)$ chứa $B D$, mà $B D parallel B' D'$ nên giao tuyến của $(M B D)$ với mặt đáy trên $(A' B' C' D')$ song song với $B D$.
        - *d)* Đúng. Qua $M$ kẻ đường thẳng song song với $B D$, cắt $A' D'$ tại $P$ và $A' B'$ tại $Q$. Thiết diện thu được là hình thang $P Q D B$.
    ]
)

// DS 3
#ds([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $I, J, K$ lần lượt là trọng tâm của các tam giác $A' B C, B' C A, C' A B$. Các phát biểu sau đúng hay sai?], (
        True([Mặt phẳng $(I J K)$ song song với mặt phẳng đáy $(A B C)$.]),
        True([Trọng tâm $G$ của tam giác $A B C$ cũng là trọng tâm của tam giác $I J K$.]),
        True([Đường thẳng $I J$ song song với mặt phẳng $(A B C)$.]),
        [Diện tích tam giác $I J K$ bằng diện tích tam giác $A B C$.]
    ), 
    loigiai: [
        - *a)* Đúng. Các trọng tâm $I, J, K$ của các tam giác nối các đỉnh đáy trên với đáy dưới tạo thành một mặt phẳng song song với hai đáy.
        - *b)* Đúng. Do tính chất đối xứng và đồng dạng của các điểm trọng tâm.
        - *c)* Đúng. Vì $(I J K) parallel (A B C)$ nên mọi đường thẳng nằm trong $(I J K)$ đều song song với $(A B C)$.
        - *d)* Sai. Tam giác $I J K$ đồng dạng với tam giác $A B C$ theo tỉ số $k != 1$, do đó diện tích của chúng khác nhau.
    ]
)

// DS 4
#ds([Một hệ khung thép giàn chịu lực hình hộp chữ nhật $A B C D . A' B' C' D'$ được lắp đặt các thanh chống xiên cố định. Gọi $M$ là trung điểm của cạnh bên $A A'$. Các kỹ sư kiểm tra hệ giằng chéo. Các phát biểu sau đúng hay sai?], (
        True([Đường giằng chéo nối từ $M$ đến trung điểm $N$ của $C C'$ song song với mặt đất $(A B C D)$.]),
        True([Mặt phẳng đi qua $M$ và song song với mặt bên $(B C C' B')$ cắt hình hộp theo một thiết diện hình chữ nhật.]),
        True([Đường thẳng nối $M$ và trung điểm $P$ của $B B'$ song song với $A B$.]),
        [Mặt phẳng $(M C D)$ song song với mặt phẳng $(A' B' B)$.]
    ), 
    loigiai: [
        - *a)* Đúng. Vì $M$ và $N$ là trung điểm của các cạnh bên song song $A A'$ và $C C'$ nên $M N parallel A C => M N parallel (A B C D)$.
        - *b)* Đúng. Thiết diện qua $M$ song song với mặt bên của hình hộp chữ nhật là hình chữ nhật đứng song song với các mặt bên đứng.
        - *c)* Đúng. Vì $M, P$ là trung điểm của $A A'$ và $B B'$ nên $M P parallel A B$.
        - *d)* Sai. Mặt phẳng $(M C D)$ cắt mặt phẳng $(A' B' B)$ tại điểm $M$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M, N$ là các điểm trên các cạnh $S A, S B$ sao cho $(S M) / (S A) = 1/3, (S N) / (S B) = 1/3$. Một mặt phẳng song song với đáy và đi qua $M, N$ cắt cạnh bên $S C$ tại $P$. Biết độ dài cạnh bên $S C = 15$ cm. Tính độ dài đoạn thẳng $S P$ (tính bằng xăng-ti-mét).],
    [5],
    loigiai: [
        Vì mặt phẳng $(alpha)$ song song với đáy $(A B C D)$ nên theo định lý Thales trong hình chóp, ta có tỉ số:
        $ (S P) / (S C) = (S M) / (S A) = (1)/(3) $.
        Do đó:
        $ S P = (1)/(3) S C = (1)/(3) dot 15 = 5 $ cm.
    ]
)

// TL 2
#tln([Cho hình lập phương $A B C D . A' B' C' D'$ cạnh $6$ cm. Gọi $M$ là trung điểm của cạnh đáy $A D$. Mặt phẳng $(A' M B)$ cắt cạnh bên $C C'$ tại điểm $P$. Tính độ dài đoạn thẳng $C' P$ (tính bằng xăng-ti-mét).],
    [3],
    loigiai: [
        Trong mặt phẳng đáy $(A B C D)$, đường thẳng $D M$ cắt $B C$ tại $E$. Vì $M$ là trung điểm $A D$ nên theo Thales, $B E = B C$, do đó $C$ là trung điểm của $B E$.
        Trong mặt phẳng bên $(B C C' B')$, đường thẳng $A' E$ cắt cạnh bên $C C'$ tại $P$.
        Vì $A' B' parallel B E$ và $A' B' = B E$ nên $A' B' E E'$ là hình bình hành.
        Do đó $P$ là giao điểm của hai đường chéo nên $P$ là trung điểm của $C C'$.
        Độ dài $C' P = (1)/(2) C C' = 3$ cm.
    ]
)

// TL 3
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M$ là trung điểm của cạnh bên $S A$. Mặt phẳng $(alpha)$ đi qua $M$ và song song với cả $A B$ và $S C$. Mặt phẳng $(alpha)$ cắt cạnh đáy $B C$ tại $Q$. Biết độ dài cạnh $B C = 12$ cm. Tính độ dài đoạn thẳng $C Q$ (tính bằng xăng-ti-mét).],
    [6],
    loigiai: [
        Vì $(alpha) parallel A B$ nên $(alpha) parallel C D$.
        Trong mặt phẳng $(S A C)$, đường thẳng qua $M$ (trung điểm $S A$) song song với $S C$ cắt $A C$ tại trung điểm $O$ của $A C$.
        Trong mặt đáy $(A B C D)$, đường thẳng qua $O$ song song với $A B$ (và $C D$) cắt $A D$ tại trung điểm $K$ và $B C$ tại trung điểm $Q$.
        Do đó $Q$ là trung điểm của $B C$.
        Độ dài $C Q = (1)/(2) B C = 6$ cm.
    ]
)

// TL 4
#tln([Cho hình lăng trụ đứng tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh đáy $A B$ và $A C$. Mặt phẳng $(A' M N)$ cắt các cạnh bên $B B'$ và $C C'$ lần lượt tại $P$ và $Q$. Biết độ dài cạnh bên $A A' = 18$ cm. Tính độ dài đoạn thẳng $B P$ (tính bằng xăng-ti-mét).],
    [9],
    loigiai: [
        Mặt phẳng $(A' M N)$ cắt mặt bên $(A B B' A')$ theo giao tuyến $A' P$ đi qua $M$ (trung điểm $A B$).
        Theo định lý Thales trong mặt bên $(A B B' A')$:
        $ (B P) / (A A') = (B M) / (A B) = (1)/(2) $.
        Do đó:
        $ B P = (1)/(2) A A' = 9 $ cm.
    ]
)

// TL 5
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $G_1, G_2$ lần lượt là trọng tâm của các tam giác $B D A'$ và $B D C'$. Biết độ dài đường chéo của đáy dưới $A' C' = 24$ cm. Tính độ dài đoạn thẳng $G_1 G_2$ (tính bằng xăng-ti-mét).],
    [8],
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.5, 0.5)
      let B = (1.5, 0.5)
      let C = (2.5, -0.8)
      let D = (-0.5, -0.8)
      
      let Ap = (-1.5, 2.5)
      let Bp = (1.5, 2.5)
      let Cp = (2.5, 1.2)
      let Dp = (-0.5, 1.2)
      
      let O = (0.5, -0.15) // Giao điểm BD và AC
      let G1 = (-0.17, 0.73) // Trọng tâm BDA' trên OA'
      let G2 = (1.17, 0.3) // Trọng tâm BDC' trên OC'
      
      // Hidden edges of box
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, Ap, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Hidden structural lines
      line(B, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(O, Ap, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(O, Cp, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Visible edges of box
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      line(B, Bp, stroke: 1pt + black)
      line(C, Cp, stroke: 1pt + black)
      line(D, Dp, stroke: 1pt + black)
      line(Ap, Bp, stroke: 1pt + black)
      line(Bp, Cp, stroke: 1pt + black)
      line(Cp, Dp, stroke: 1pt + black)
      line(Dp, Ap, stroke: 1pt + black)
      
      // Diagonal A'C'
      line(Ap, Cp, stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
      
      // Segment G1G2
      line(G1, G2, stroke: 1.5pt + rgb("#0F766E"))
      
      circle(Ap, radius: 1.8pt, fill: black); content((Ap.at(0) - 0.3, Ap.at(1) + 0.3), $A'$, size: 10pt)
      circle(Bp, radius: 1.8pt, fill: black); content((Bp.at(0) + 0.3, Bp.at(1) + 0.3), $B'$, size: 10pt)
      circle(Cp, radius: 1.8pt, fill: black); content((Cp.at(0) + 0.3, Cp.at(1) + 0.1), $C'$, size: 10pt)
      circle(Dp, radius: 1.8pt, fill: black); content((Dp.at(0) - 0.3, Dp.at(1) + 0.1), $D'$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.3, B.at(1) - 0.2), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.3, C.at(1) - 0.3), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) - 0.3, D.at(1) - 0.3), $D$, size: 10pt)
      circle(O, radius: 1.8pt, fill: black); content((O.at(0), O.at(1) - 0.35), $O$, size: 10pt)
      circle(G1, radius: 1.8pt, fill: rgb("#0F766E")); content((G1.at(0) - 0.35, G1.at(1) + 0.15), $G_1$, size: 10pt, fill: rgb("#0F766E"))
      circle(G2, radius: 1.8pt, fill: rgb("#0F766E")); content((G2.at(0) + 0.35, G2.at(1) - 0.1), $G_2$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Gọi $O$ là giao điểm của hai đường chéo đáy $A C$ và $B D$.
        Trong tam giác $A' O C'$, ta có $G_1$ và $G_2$ lần lượt nằm trên $O A'$ và $O C'$ thỏa mãn:
        $ (O G_1) / (O A') = (O G_2) / (O C') = 1/3 $.
        Theo Thales: $G_1 G_2 parallel A' C'$ và:
        $ G_1 G_2 = (1)/(3) A' C' = (1)/(3) dot 24 = 8 $ cm.
    ]
)

// TL 6
#tln([Cho hình chóp $S.A B C D$ đáy là hình bình hành $A B C D$. Gọi $G$ là trọng tâm của tam giác $S A B$. Mặt phẳng $(alpha)$ đi qua $G$ và song song với đáy $(A B C D)$ cắt các cạnh bên $S A, S B, S C, S D$ lần lượt tại $A', B', C', D'$. Biết diện tích hình bình hành đáy $S_(A B C D) = 90$ $"cm"^2$. Tính diện tích thiết diện $A' B' C' D'$ (tính bằng xăng-ti-mét vuông).],
    [40],
    loigiai: [
        Gọi $I$ là trung điểm $A B$. Vì $G$ là trọng tâm tam giác $S A B$ nên $(S G) / (S I) = 2/3$.
        Mặt phẳng $(alpha)$ song song với đáy nên thiết diện $A' B' C' D'$ đồng dạng với đáy $A B C D$ theo tỉ số:
        $ k = (S A') / (S A) = (S G) / (S I) = (2)/(3) $.
        Do đó diện tích thiết diện là:
        $ S_(A' B' C' D') = k^2 dot S_(A B C D) = ((2)/(3))^2 dot 90 = (4)/(9) dot 90 = 40 " (cm"^2")" $.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
