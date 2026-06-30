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
  exam-title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 10)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho hai đường thẳng chéo nhau $a$ và $b$. Đường thẳng $c$ song song với $a$. Hỏi $c$ và $b$ có thể song song với nhau hay không?],
    (
        [Chắc chắn song song.],
        [Chắc chắn cắt nhau.],
        True([Không thể song song với nhau.]),
        [Chắc chắn chéo nhau.]
    ),
    loigiai: [
        Vì nếu $c parallel b$, mà $c parallel a$, suy ra $a parallel b$ hoặc trùng nhau, mâu thuẫn với giả thiết $a$ và $b$ chéo nhau.
    ]
)

// TN 2
#tn([Cho đường thẳng $a$ song song với mặt phẳng $(P)$. Nếu mặt phẳng $(Q)$ song song với $(P)$ thì vị trí tương đối giữa $a$ và $(Q)$ là gì?],
    (
        [Chắc chắn song song.],
        [Chắc chắn chéo nhau.],
        True([Song song hoặc nằm trong mặt phẳng $(Q)$.]),
        [Cắt nhau.]
    ),
    loigiai: [
        Vì $(P) parallel (Q)$ nên bất kỳ đường thẳng nào song song với $(P)$ cũng sẽ song song với $(Q)$ hoặc nằm hoàn toàn trong $(Q)$.
    ]
)

// TN 3
#tn([Cho hình lăng trụ đứng tam giác. Thiết diện cắt bởi mặt phẳng song song với một mặt bên là hình gì?],
    (
        [Hình bình hành.],
        [Hình thang.],
        True([Hình chữ nhật.]),
        [Tam giác.]
    ),
    loigiai: [
        Trong hình lăng trụ đứng tam giác, các mặt bên là các hình chữ nhật.
        Thiết diện cắt bởi mặt phẳng song song với một mặt bên là hình chữ nhật đứng song song với mặt bên đó.
    ]
)

// TN 4
#tn([Hình hộp $A B C D . A' B' C' D'$ có tất cả bao nhiêu cạnh bên song song và bằng nhau?],
    (
        [$2$],
        True([$4$]),
        [$6$],
        [$8$]
    ),
    loigiai: [
        Hình hộp có 4 cạnh bên song song và bằng nhau: $A A', B B', C C', D D'$.
    ]
)

// TN 5
#tn([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M, N, P, Q$ lần lượt là trung điểm của các cạnh bên $S A, S B, S C, S D$. Tứ giác $M N P Q$ là hình gì?],
    (
        [Hình thang.],
        True([Hình bình hành.]),
        [Hình thoi.],
        [Hình chữ nhật.]
    ),
    loigiai: [
        Ta có $M N$ là đường trung bình tam giác $S A B => M N parallel A B$ và $M N = (1)/(2) A B$.
        $Q P$ là đường trung bình tam giác $S A D$ (là không đúng, của tam giác $S C D$) $=> Q P parallel C D$ và $Q P = (1)/(2) C D$.
        Vì $A B C D$ là hình bình hành nên $A B parallel C D$ và $A B = C D$.
        Do đó $M N parallel Q P$ và $M N = Q P$.
        Tứ giác $M N P Q$ có một cặp cạnh đối song song và bằng nhau nên nó là hình bình hành.
    ]
)

// TN 6
#tn([Trong các mệnh đề sau, mệnh đề nào là đúng?],
    (
        [Hai mặt phẳng song song với nhau thì mọi đường thẳng nằm trong mặt phẳng này đều song song với mọi đường thẳng nằm trong mặt phẳng kia.],
        True([Hai mặt phẳng song song với nhau thì mọi đường thẳng cắt mặt phẳng này cũng cắt mặt phẳng kia.]),
        [Nếu hai mặt phẳng song song thì bất kỳ đường thẳng nào song song với mặt này cũng song song với mặt kia.],
        [Hai mặt phẳng không cắt nhau thì song song.]
    ),
    loigiai: [
        Nếu đường thẳng $d$ cắt mặt phẳng $(P)$, mà $(P) parallel (Q)$ thì $d$ cũng phải cắt mặt phẳng $(Q)$.
    ]
)

// TN 7
#tn([Trong phép chiếu song song, hình chiếu song song của hai đường thẳng song song là:],
    (
        [Hai đường thẳng cắt nhau.],
        True([Hai đường thẳng song song hoặc trùng nhau.]),
        [Hai đường thẳng chéo nhau.],
        [Một đường thẳng và một điểm.]
    ),
    loigiai: [
        Theo tính chất phép chiếu song song, nó biến hai đường thẳng song song thành hai đường thẳng song song hoặc trùng nhau (nếu phương chiếu song song với mặt phẳng chứa hai đường thẳng đó).
    ]
)

// TN 8
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Đường chéo $B D'$ cắt mặt phẳng $(A' C' D)$ tại điểm $G$. Khẳng định nào sau đây là đúng về điểm $G$?],
    (
        [ $G$ là trung điểm của $B D'$. ],
        True([ $G$ là trọng tâm của tam giác $A' C' D$. ]),
        [ $G$ trùng với $D$. ],
        [ $G$ nằm trên cạnh $A' C'$. ]
    ),
    loigiai: [
        Đường chéo $B D'$ cắt mặt phẳng $(A' C' D)$ tại trọng tâm $G$ của tam giác $A' C' D$. Đây là giao điểm chia đường chéo theo tỉ số $(S G) / (S O)$ tương ứng.
    ]
)

// TN 9
#tn([Thiết diện của hình chóp cụt cắt bởi mặt phẳng song song với hai đáy là hình gì?],
    (
        [Hình bình hành.],
        [Hình thang.],
        True([Hình đồng dạng với đáy.]),
        [Tam giác.]
    ),
    loigiai: [
        Mặt phẳng song song với đáy cắt hình chóp cụt theo một thiết diện là đa diện đồng dạng với hai đáy.
    ]
)

// TN 10
#tn([Cho hai mặt phẳng song song $(P)$ và $(Q)$. Đường thẳng $d$ cắt mặt phẳng $(P)$ tại điểm $A$. Hỏi $d$ và $(Q)$ có bao nhiêu điểm chung?],
    (
        [Không có điểm chung.],
        True([Có duy nhất một điểm chung.]),
        [Có vô số điểm chung.],
        [Có đúng hai điểm chung.]
    ),
    loigiai: [
        Vì $d$ cắt $(P)$ tại $A$ và $(P) parallel (Q)$, do đó $d$ cũng phải cắt $(Q)$ tại một điểm duy nhất.
    ]
)

// TN 11
#tn([Cho hình lăng trụ đứng tam giác $A B C . A' B' C'$. Đường thẳng nối hai trung điểm của hai cạnh bên chéo nhau $A A'$ và $B B'$ có đặc điểm gì?],
    (
        [Nó song song với các cạnh bên.],
        True([Nó song song với hai mặt phẳng đáy.]),
        [Nó vuông góc với tất cả các mặt bên.],
        [Nó cắt mặt đáy dưới tại trung điểm của $A B$.]
    ),
    loigiai: [
        Đường nối trung điểm của $A A'$ và $B B'$ song song với $A B$.
        Vì $A B$ nằm trong mặt phẳng đáy dưới $(A B C)$, nên đường thẳng này song song với hai mặt đáy.
    ]
)

// TN 12
#tn([Hình hộp $A B C D . A' B' C' D'$ có tất cả bao nhiêu đường chéo (đoạn thẳng nối hai đỉnh không cùng thuộc một mặt bên nào)?],
    (
        [$2$],
        True([$4$]),
        [$6$],
        [$8$]
    ),
    loigiai: [
        Hình hộp có 4 đường chéo cắt nhau tại trung điểm của mỗi đường: $A C', B D', C A', D B'$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hình chóp $S.A B C D$ đáy hình bình hành $A B C D$. Gọi $M, N$ lần lượt là trung điểm của các cạnh bên $S A$ và $S D$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $M N$ song song với mặt phẳng $(S B C)$.]),
        True([Giao tuyến của hai mặt phẳng $(S A B)$ và $(S C D)$ song song với $M N$.]),
        [Mặt phẳng $(B C N M)$ cắt hình chóp theo thiết diện là hình thang cân.],
        True([Đường thẳng $A N$ chéo với đường thẳng $B M$.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $M N$ là đường trung bình của tam giác $S A D => M N parallel A D parallel B C => M N parallel (S B C)$.
        - *b)* Đúng. Giao tuyến của $(S A B)$ và $(S C D)$ là đường thẳng qua $S$ song song với $A B parallel C D parallel M N$.
        - *c)* Sai. Thiết diện thu được là hình thang $B C N M$ có $M N parallel B C$ nhưng không cân (do $B M$ và $C N$ có độ dài không bằng nhau trừ khi hình chóp đều).
        - *d)* Đúng. Vì $A N$ nằm trong mặt bên $(S A D)$ còn $B M$ nằm trong mặt bên $(S A B)$ và không song song cũng không cắt nhau, do đó chúng chéo nhau.
    ]
)

// DS 2
#ds([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M, N, P, Q$ lần lượt là trung điểm của các cạnh đáy dưới $A B, B C, C D, D A$. Các phát biểu sau đúng hay sai?], (
        [Đường thẳng $M P$ song song với đường thẳng $N Q$.],
        True([Mặt phẳng $(M N P Q)$ song song với mặt phẳng đáy trên $(A' B' C' D')$.]),
        True([Thiết diện của hình hộp cắt bởi mặt phẳng $(M N B')$ là hình thang.]),
        [Giao tuyến của hai mặt phẳng $(M N P Q)$ và $(A' B' C' D')$ song song với $A B$.]
    ), 
    loigiai: [
        - *a)* Sai. $M P$ và $N Q$ cắt nhau tại tâm đáy $O$.
        - *b)* Đúng. Mặt phẳng $(M N P Q)$ trùng với mặt đáy $(A B C D)$, nên song song với đáy trên $(A' B' C' D')$.
        - *c)* Đúng. Vì $M N parallel A C parallel A' C' parallel A' C' ...$ và qua $B'$, thiết diện cắt mặt phẳng $(A B C D)$ song song với $A C$, cắt mặt bên theo đường song song, tạo thành hình thang.
        - *d)* Sai. Vì hai mặt đáy song song nên chúng không cắt nhau, giao tuyến của $(M N P Q)$ và đáy trên là tập rỗng.
    ]
)

// DS 3
#ds([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M$ là trung điểm của cạnh bên $A A'$. Các phát biểu sau đúng hay sai?], (
        [Đường thẳng qua $M$ song song với $B C$ nằm hoàn toàn trong mặt phẳng $(B C C' B')$.],
        True([Mặt phẳng đi qua $M$ và song song với đáy $(A B C)$ cắt cạnh bên $B B'$ tại trung điểm của $B B'$.]),
        True([Thiết diện của lăng trụ cắt bởi mặt phẳng qua $M$ song song với đáy $(A B C)$ là tam giác bằng tam giác $A B C$.]),
        True([Đường thẳng $A' B$ chéo với đường thẳng $B' C$.])
    ), 
    loigiai: [
        - *a)* Sai. Đường thẳng qua $M$ song song với $B C$ không thể nằm trong $(B C C' B')$ vì $M$ nằm ngoài mặt phẳng đó.
        - *b)* Đúng. Mặt phẳng qua $M$ song song với đáy chính là mặt phẳng trung bình, cắt các cạnh bên tại trung điểm tương ứng.
        - *c)* Đúng. Thiết diện cắt bởi mặt phẳng song song với đáy là tam giác bằng đáy.
        - *d)* Đúng. Vì $A' B$ nằm trong mặt bên $(A B B' A')$ còn $B' C$ nằm trong mặt bên $(B C C' B')$ và không cắt nhau, không song song.
    ]
)

// DS 4
#ds([Một hệ thống pin năng lượng mặt trời dạng tấm phẳng được dựng đỡ bởi các cột xiên chịu lực song song. Thiết kế mô hình hóa dạng hình hộp chữ nhật $A B C D . A' B' C' D'$. Các phát biểu sau đúng hay sai?], (
        True([Các thanh chống chéo $A C'$ và $B D'$ cắt nhau tại trung điểm của mỗi đường.]),
        True([Mặt phẳng tấm pin $(A' B' C' D')$ song song với mặt phẳng giá đỡ mặt đất $(A B C D)$.]),
        True([Một thanh giằng ngang nối từ trung điểm $A A'$ đến trung điểm $C C'$ song song với cả hai mặt đáy.]),
        True([Đường thẳng nối tâm mặt bên $A B B' A'$ và tâm mặt bên $C D D' C'$ song song với cạnh đáy $A D$.])
    ), 
    loigiai: [
        - *a)* Đúng. Hai đường chéo của hình hộp cắt nhau tại trung điểm mỗi đường.
        - *b)* Đúng. Hai mặt đáy của hình lập phương/hình hộp chữ nhật song song với nhau.
        - *c)* Đúng. Đoạn thẳng nối trung điểm các cạnh bên song song với các đáy.
        - *d)* Đúng. Tâm hai mặt bên đối diện tạo thành đường thẳng song song với các cạnh đáy dọc $A D$ và $B C$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành. Gọi $M$ là trung điểm của cạnh bên $S A$. Mặt phẳng $(alpha)$ đi qua $M$ và song song với cả $A B$ và $S C$. Mặt phẳng $(alpha)$ cắt cạnh bên $S D$ tại $P$. Biết độ dài cạnh $S D = 14$ cm. Tính độ dài đoạn thẳng $S P$ (tính bằng xăng-ti-mét).],
    [7],
    loigiai: [
        Vì $(alpha) parallel A B$ nên $(alpha) parallel C D$.
        Vì $M$ là trung điểm $S A$ và $(alpha) parallel S C$ nên trong tam giác $S A C$, giao tuyến của $(alpha)$ cắt $A C$ tại trung điểm $O$ của $A C$.
        Trong mặt đáy $(A B C D)$, đường thẳng qua $O$ song song với $C D$ cắt $A D$ tại trung điểm $K$ của $A D$.
        Trong mặt phẳng $(S A D)$, giao tuyến của $(alpha)$ là $M K$.
        Trong $(S C D)$, giao tuyến qua $O$ song song với $C D$ cắt $S D$ tại trung điểm $P$.
        Do đó $P$ là trung điểm của $S D => S P = (1)/(2) S D = 7$ cm.
    ]
)

// TL 2
#tln([Cho hình lập phương $A B C D . A' B' C' D'$ cạnh $12$ cm. Gọi $M$ là trung điểm của cạnh đáy $A B$. Mặt phẳng $(A' M D)$ cắt cạnh bên $C C'$ tại điểm $P$. Tính độ dài đoạn thẳng $C' P$ (tính bằng xăng-ti-mét).],
    [6],
    loigiai: [
        Trong mặt phẳng đáy $(A B C D)$, đường thẳng $D M$ cắt $B C$ tại $E$. Vì $M$ là trung điểm $A B$ nên theo Thales, $B E = B C$, do đó $C$ là trung điểm của $B E$.
        Trong mặt bên $(B C C' B')$, đường thẳng $A' E$ cắt cạnh bên $C C'$ tại $P$.
        Vì $A' B' parallel B E$ và $A' B' = B E$ nên $A' B' E E'$ là hình bình hành.
        Do đó $P$ là giao điểm của hai đường chéo nên $P$ là trung điểm của $C C'$.
        Độ dài $C' P = (1)/(2) C C' = 6$ cm.
    ]
)

// TL 3
#tln([Cho hình chóp $S.A B C D$ đáy hình bình hành $A B C D$. Gọi $M$ là trung điểm của cạnh $S B$. Mặt phẳng $(alpha)$ đi qua $M$ và song song với cả $A C$ và $B D$ cắt cạnh bên $S A$ tại $N$. Biết độ dài cạnh bên $S A = 20$ cm. Tính độ dài đoạn thẳng $S N$ (tính bằng xăng-ti-mét).],
    [10],
    loigiai: [
        Vì mặt phẳng $(alpha)$ song song với cả $A C$ và $B D$ nên nó song song với mặt phẳng đáy dưới $(A B C D)$ chứa hai đường chéo đó.
        Do $(alpha) parallel (A B C D)$ và $(alpha)$ đi qua $M$ (trung điểm $S B$) nên theo định lý Thales trong hình chóp, nó cắt cạnh bên $S A$ tại trung điểm $N$ của $S A$.
        Do đó $S N = (1)/(2) S A = 10$ cm.
    ]
)

// TL 4
#tln([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh bên $B C$ và $B' C'$. Mặt phẳng $(alpha)$ đi qua trung điểm $I$ của $M N$ và song song với mặt phẳng đáy $(A B C)$ cắt cạnh bên $C C'$ tại điểm $Q$. Biết độ dài cạnh bên $C C' = 16$ cm. Tính độ dài đoạn thẳng $C' Q$ (tính bằng xăng-ti-mét).],
    [8],
    loigiai: [
        Vì $M, N$ lần lượt là trung điểm của $B C, B' C'$ nên $M N parallel C C'$.
        Vì $I$ là trung điểm $M N$ nên $I$ là trung điểm của trục lăng trụ.
        Mặt phẳng $(alpha)$ qua $I$ và song song với đáy $(A B C)$ chính là mặt phẳng trung bình song song của hình lăng trụ.
        Do đó, mặt phẳng này cắt các cạnh bên tại trung điểm tương ứng.
        Suy ra $Q$ là trung điểm của $C C' => C' Q = (1)/(2) C C' = 8$ cm.
    ]
)

// TL 5
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $G_1, G_2$ lần lượt là trọng tâm của các tam giác $B D A'$ và $B D C'$. Biết độ dài đường chéo đáy $A' C' = 30$ cm. Tính độ dài đoạn thẳng $G_1 G_2$ (tính bằng xăng-ti-mét).],
    [10],
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
        Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$ ở đáy dưới.
        Trong tam giác $A' O C'$, ta có $G_1$ và $G_2$ lần lượt nằm trên $O A'$ và $O C'$ thỏa mãn:
        $ (O G_1) / (O A') = (O G_2) / (O C') = 1/3 $.
        Theo Thales: $G_1 G_2 parallel A' C'$ và:
        $ G_1 G_2 = (1)/(3) A' C' = (1)/(3) dot 30 = 10 $ cm.
    ]
)

// TL 6
#tln([Để đo chiều cao của một cột cờ trong sân trường có bóng nắng dài $12$ m, người ta cắm một cọc tiêu đứng cao $1.5$ m có bóng nắng dài $1.8$ m. Tính chiều cao cột cờ (tính bằng mét).],
    [10],
    loigiai: [
        Vì các tia sáng mặt trời chiếu song song nên cột cờ và cọc tiêu tạo với bóng của chúng các tam giác vuông đồng dạng.
        Gọi $H$ là chiều cao của cột cờ.
        Ta có tỉ số đồng dạng:
        $ H / 12 = 1.5 / 1.8 => H = (12 dot 1.5) / (1.8) = 10 $ (m).
        Chiều cao của cột cờ là $10$ m.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
