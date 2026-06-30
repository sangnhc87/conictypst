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
  exam-title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 02)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho đường thẳng $d$ song song với mặt phẳng $(alpha)$. Khẳng định nào sau đây đúng?],
    (
        [$d$ cắt mọi đường thẳng nằm trong mặt phẳng $(alpha)$.],
        [$d$ không song song với bất kỳ đường thẳng nào nằm trong mặt phẳng $(alpha)$.],
        True([Trong mặt phẳng $(alpha)$ có ít nhất một đường thẳng song song với $d$.]),
        [$d$ song song với mọi đường thẳng nằm trong mặt phẳng $(alpha)$.]
    ),
    loigiai: [
        Theo định lý về quan hệ giữa đường thẳng song song với mặt phẳng:
        Nếu một đường thẳng $d$ song song với mặt phẳng $(alpha)$ thì trong $(alpha)$ luôn tồn tại các đường thẳng song song với $d$ (cụ thể là các giao tuyến của $(alpha)$ với các mặt phẳng chứa $d$).
    ]
)

// TN 2
#tn([Cho hai đường thẳng phân biệt $a, b$ và mặt phẳng $(alpha)$. Biết $a parallel (alpha)$ và $b subset (alpha)$. Mệnh đề nào sau đây đúng?],
    (
        [$a$ và $b$ song song với nhau.],
        [$a$ và $b$ chéo nhau.],
        True([$a$ và $b$ song song với nhau hoặc chéo nhau.]),
        [$a$ và $b$ cắt nhau.]
    ),
    loigiai: [
        Vì $a parallel (alpha)$ nên $a$ không có điểm chung với $(alpha)$.
        Do $b subset (alpha)$ nên $a$ và $b$ không thể cắt nhau.
        Như vậy, $a$ và $b$ chỉ có thể song song hoặc chéo nhau.
    ]
)

// TN 3
#tn([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Đường thẳng $M N$ song song với mặt phẳng $(S A D)$ khi $M, N$ lần lượt là trung điểm của các cạnh nào dưới đây?],
    (
        [$S B$ và $A B$.],
        [$S B$ và $A D$.],
        True([$S C$ và $C D$.]),
        [$S D$ và $S B$.]
    ),
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.0, 0.8)
      let B = (-2.2, -0.6)
      let C = (1.8, -0.6)
      let D = (3.0, 0.8)
      let S = (-1.0, 3.0)
      
      let M = (0.4, 1.2) // trung điểm SC
      let N = (2.4, 0.1) // trung điểm CD
      
      // Hidden edges
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Visible edges
      line(S, B, stroke: 1pt + black)
      line(S, C, stroke: 1pt + black)
      line(S, D, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      
      // Đường MN
      line(M, N, stroke: 1.5pt + rgb("#0F766E"))
      
      circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.35), $S$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) - 0.3, B.at(1) - 0.3), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.3, C.at(1) - 0.3), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) + 0.35, D.at(1) + 0.2), $D$, size: 10pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) + 0.35, M.at(1) + 0.15), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) + 0.35, N.at(1) - 0.15), $N$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Nếu $M, N$ lần lượt là trung điểm của $S C$ và $C D$.
        Trong tam giác $S C D$, $M N$ là đường trung bình ứng với cạnh $S D$.
        Do đó $M N parallel S D$.
        Mà $S D subset (S A D)$, do đó $M N parallel (S A D)$.
    ]
)

// TN 4
#tn([Một cấu kiện của giàn giáo xây dựng gồm bốn thanh sắt tạo thành một hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Các thanh giằng ngang $M N, N P, P Q, Q M$ nối trung điểm của các cạnh bên $S A, S B, S C, S D$. Khẳng định nào sau đây là sai?],
    (
        [$M N parallel (A B C D)$.],
        [$N P parallel (S A D)$.],
        True([$M P parallel (S B D)$.]),
        [$M Q parallel (S B C)$.]
    ),
    loigiai: [
        - $M N$ là đường trung bình của tam giác $S A B => M N parallel A B subset (A B C D) => M N parallel (A B C D)$ (Đúng).
        - $N P$ là đường trung bình của tam giác $S B C => N P parallel B C parallel A D => N P parallel (S A D)$ (Đúng).
        - $M Q$ là đường trung bình của tam giác $S A D => M Q parallel A D parallel B C => M Q parallel (S B C)$ (Đúng).
        - $M P$ nối trung điểm $S A$ và $S C$, nằm trong mặt phẳng $(S A C)$, không song song với $(S B D)$ vì chúng cắt nhau tại điểm $I$ (trên $S O$). Do đó khẳng định C là sai.
    ]
)

// TN 5
#tn([Để lắp ráp hệ thống rèm cửa thông minh phẳng song song với bức tường đứng $(alpha)$, người thợ cần lắp một thanh ray định hướng $d$ nằm ngang. Để đảm bảo tính thẩm mỹ và kỹ thuật, thanh ray $d$ phải có vị trí thế nào đối với bức tường $(alpha)$?],
    (
        [Cắt bức tường $(alpha)$ tại một điểm.],
        True([Song song với bức tường $(alpha)$.]),
        [Nằm hoàn toàn trên bức tường $(alpha)$.],
        [Vuông góc với mọi đường thẳng trên bức tường $(alpha)$.]
    ),
    loigiai: [
        Hệ rèm cửa phẳng song song với bức tường đứng $(alpha)$ yêu cầu thanh ray định hướng chuyển động $d$ của rèm cũng phải song song với bức tường $(alpha)$.
    ]
)

// TN 6
#tn([Trong không gian, cho hai đường thẳng chéo nhau $a, b$. Có bao nhiêu mặt phẳng chứa đường thẳng $a$ và song song với đường thẳng $b$?],
    (
        [Vô số.],
        [Không có.],
        True([Duy nhất $1$.]),
        [Có $2$.]
    ),
    loigiai: [
        Theo định lý về sự tồn tại và duy nhất của mặt phẳng song song:
        Qua đường thẳng $a$, dựng đường thẳng $b'$ song song với $b$. Mặt phẳng xác định bởi hai đường thẳng cắt nhau $a$ và $b'$ là mặt phẳng duy nhất chứa $a$ và song song với $b$.
    ]
)

// TN 7
#tn([Cho hai đường thẳng chéo nhau $a$ và $b$. Khẳng định nào sau đây là sai khi nói về các đường thẳng song song với $b$?],
    (
        [Có vô số đường thẳng song song với $b$ cắt $a$.],
        [Có vô số đường thẳng song song với $b$ chéo nhau với $a$.],
        [Có duy nhất một đường thẳng song song với $b$ song song với $a$.],
        True([Có duy nhất một đường thẳng song song với $b$ cắt $a$.])
    ),
    loigiai: [
        Mỗi điểm trên đường thẳng $a$, ta đều vẽ được duy nhất một đường thẳng đi qua điểm đó và song song với $b$. Do đó có vô số đường thẳng song song với $b$ cắt $a$. Khẳng định D nói "duy nhất một" là sai.
    ]
)

// TN 8
#tn([Cho đường thẳng $a$ song song với mặt phẳng $(alpha)$ và đường thẳng $b$ nằm trong mặt phẳng $(alpha)$. Mệnh đề nào sau đây đúng?],
    (
        [$a$ và $b$ chéo nhau.],
        [$a$ và $b$ song song hoặc cắt nhau.],
        [$a$ và $b$ song song với nhau.],
        True([$a$ và $b$ song song hoặc chéo nhau.])
    ),
    loigiai: [
        Vì $a parallel (alpha)$ nên $a$ không cắt mặt phẳng $(alpha)$, suy ra $a$ không cắt $b subset (alpha)$.
        Do đó $a$ và $b$ hoặc song song hoặc chéo nhau.
    ]
)

// TN 9
#tn([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Gọi $M$ là trung điểm của $S D$. Giao tuyến của hai mặt phẳng $(S A B)$ và $(M C D)$ là đường thẳng như thế nào?],
    (
        [Đường thẳng qua $S$ song song với $A B$.],
        [Đường thẳng qua $S$ song song với $A C$.],
        True([Đường thẳng qua $M$ song song với $A B$.]),
        [Đường thẳng qua $M$ song song với $A D$.]
    ),
    loigiai: [
        Ta có $M in (S A B) inter (M C D)$ (vì $M$ là trung điểm $S D$, không thuộc $(S A B)$, wait!).
        Giao tuyến của mặt phẳng $(S A B)$ và $(M C D)$:
        Hai mặt phẳng lần lượt chứa hai đường thẳng song song là $A B$ và $C D$.
        Điểm chung của chúng là điểm giao tuyến cắt qua, và giao tuyến này song song với $A B$ và $C D$.
        Vì $M in S D$ và $C D subset (M C D)$, đường giao tuyến này đi qua giao điểm của thiết diện cắt trên các cạnh bên, song song với $A B$.
    ]
)

// TN 10
#tn([Trong mô hình kiến trúc của một tòa nhà phẳng đứng. Để tạo tính liên kết chịu lực giữa cột thẳng đứng $a$ và thanh dầm chéo $b$, người thợ cần đặt một tấm liên kết dầm chéo song song với cả hai thanh $a$ và $b$. Điều kiện cần và đủ để dựng được tấm liên kết chéo này là gì?],
    (
        [$a$ và $b$ cắt nhau.],
        True([$a$ và $b$ chéo nhau hoặc song song.]),
        [$a$ và $b$ nằm trong cùng một mặt phẳng.],
        [$a$ và $b$ trùng nhau.]
    ),
    loigiai: [
        Một mặt phẳng song song với cả hai đường thẳng $a$ và $b$ chỉ tồn tại khi và chỉ khi hai đường thẳng này không cắt nhau, tức là chéo nhau hoặc song song.
    ]
)

// TN 11
#tn([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình thang ($A D parallel B C$). Gọi $M$ là trung điểm của $S B$. Mặt phẳng $(A D M)$ cắt hình chóp theo thiết diện là hình gì?],
    (
        [Hình bình hành.],
        [Hình chữ nhật.],
        True([Hình thang.]),
        [Hình tam giác.]
    ),
    loigiai: [
        Mặt phẳng $(A D M)$ cắt mặt bên $(S B C)$ theo giao tuyến đi qua $M$ và song song với $B C$ (do $A D parallel B C$ và $A D subset (A D M), B C subset (S B C)$).
        Kẻ $M N parallel B C$ ($N in S C$), ta được thiết diện là hình thang $A D N M$ với $M N parallel A D$.
    ]
)

// TN 12
#tn([Cho đường thẳng $a$ song song với mặt phẳng $(alpha)$. Mệnh đề nào sau đây đúng?],
    (
        [Nếu mặt phẳng $(beta)$ chứa $a$ thì $(beta)$ song song với $(alpha)$.],
        True([Mọi mặt phẳng chứa $a$ mà cắt $(alpha)$ thì cắt theo giao tuyến song song với $a$.]),
        [Đường thẳng $a$ song song với mọi đường thẳng nằm trong $(alpha)$.],
        [Đường thẳng $a$ vuông góc với mặt phẳng $(alpha)$.]
    ),
    loigiai: [
        Đây là tính chất cơ bản: Nếu một đường thẳng song song với một mặt phẳng thì mọi mặt phẳng chứa đường thẳng đó và cắt mặt phẳng đã cho theo một giao tuyến thì giao tuyến đó song song với đường thẳng đã cho.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Gọi $M$ là trung điểm của cạnh $S A$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $O M$ song song với mặt phẳng $(S B C)$.]),
        True([Đường thẳng $O M$ song song với mặt phẳng $(S C D)$.]),
        [Đường thẳng $O M$ song song với mặt phẳng $(S B D)$.],
        [Mặt phẳng $(O M N)$ (với $N$ là trung điểm $S B$) song song với mặt phẳng đáy $(A B C D)$.]
    ), 
    loigiai: [
        - *a)* Đúng. Trong tam giác $S A C$, $O M$ là đường trung bình ứng với cạnh $S C => O M parallel S C$. Mà $S C subset (S B C) => O M parallel (S B C)$.
        - *b)* Đúng. Tương tự $O M parallel S C subset (S C D) => O M parallel (S C D)$.
        - *c)* Sai. Vì $O M$ là đường trung bình tam giác $S A C => O M parallel S C$. Mà $S C$ cắt $(S B D)$ tại $S$, nên $O M$ cũng cắt $(S B D)$.
        - *d)* Sai. Vì hai đường thẳng cắt nhau $M N$ và $N P$ trong $(M N P)$ lần lượt song song với hai đường thẳng cắt nhau $A B$ và $B D$ trong $(A B C D)$.
    ]
)

// DS 2
#ds([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M$ là trung điểm của cạnh $S A$. Mặt phẳng $(alpha)$ đi qua $M$ và song song với mặt phẳng $(S B C)$. Các phát biểu sau đúng hay sai?], (
        True([Mặt phẳng $(alpha)$ song song với hai đường thẳng $S B$ và $B C$.]),
        [Mặt phẳng $(alpha)$ cắt mặt phẳng đáy $(A B C D)$ theo một giao tuyến song song với $A B$.],
        True([Thiết diện của hình chóp cắt bởi mặt phẳng $(alpha)$ là hình bình hành $M H K L$ (với $H, K, L$ lần lượt là trung điểm của $A B, C D, S D$).]),
        True([Tỉ số diện tích thiết diện $M H K L$ và diện tích mặt bên $S B C$ bằng $(1)/(4)$.])
    ), 
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.0, 0.8)
      let B = (-2.2, -0.6)
      let C = (1.8, -0.6)
      let D = (3.0, 0.8)
      let S = (-1.0, 3.0)
      
      let M = (-1.0, 1.9) // trung điểm SA
      let H = (-1.6, 0.1) // trung điểm AB
      let K = (2.4, 0.1)  // trung điểm CD
      let L = (1.0, 1.9)  // trung điểm SD
      
      // Vẽ màu fill cho thiết diện MHKL
      line(M, H, K, L, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Hidden edges of pyramid
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Hidden edges of cross-section
      line(M, H, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(H, K, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(L, M, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges of pyramid
      line(S, B, stroke: 1pt + black)
      line(S, C, stroke: 1pt + black)
      line(S, D, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      
      // Visible edges of cross-section
      line(K, L, stroke: 1.5pt + rgb("#0F766E"))
      
      circle(S, radius: 1.8pt, fill: black); content((S.at(0), S.at(1) + 0.35), $S$, size: 10pt)
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) - 0.3, B.at(1) - 0.3), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.3, C.at(1) - 0.3), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) + 0.35, D.at(1) + 0.2), $D$, size: 10pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.35, M.at(1) + 0.15), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(H, radius: 1.8pt, fill: rgb("#0F766E")); content((H.at(0) - 0.3, H.at(1) - 0.3), $H$, size: 10pt, fill: rgb("#0F766E"))
      circle(K, radius: 1.8pt, fill: rgb("#0F766E")); content((K.at(0) + 0.3, K.at(1) - 0.3), $K$, size: 10pt, fill: rgb("#0F766E"))
      circle(L, radius: 1.8pt, fill: rgb("#0F766E")); content((L.at(0) + 0.35, L.at(1) + 0.15), $L$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        - *a)* Đúng. Vì $(alpha) parallel (S B C)$ nên $(alpha)$ song song với mọi đường thẳng nằm trong $(S B C)$, bao gồm $S B$ và $B C$.
        - *b)* Sai. Giao tuyến của $(alpha)$ với $(A B C D)$ là đường thẳng đi qua $H$ (trung điểm $A B$) và song song với $B C$ (không song song với $A B$).
        - *c)* Đúng. Qua $M$ kẻ $M H parallel S B$ ($H in A B$), qua $H$ kẻ $H K parallel B C$ ($K in C D$), qua $K$ kẻ $K L parallel S C$ ($L in S D$). Ta được thiết diện là hình bình hành $M H K L$ với các đỉnh lần lượt là trung điểm của $S A, A B, C D, S D$.
        - *d)* Đúng. Ta có $M H = (1)/(2) S B$, $M L = (1)/(2) A D = (1)/(2) B C$, góc giữa $M H$ và $M L$ bằng góc giữa $S B$ và $B C$.
          Do đó diện tích hình bình hành $M H K L$ bằng:
          $ S_(M H K L) = M H dot M L dot sin(M H, M L) = (1)/(2) S B dot (1)/(2) B C dot sin(S B, B C) = (1)/(4) S_(S B C) $.
          Tỉ số diện tích là $(1)/(4)$.
    ]
)

// DS 3
#ds([Cho hai đường thẳng chéo nhau $a$ và $b$. Đường thẳng $c$ cắt cả hai đường thẳng $a$ và $b$. Các phát biểu sau đúng hay sai?], (
        [Luôn tồn tại một mặt phẳng chứa cả ba đường thẳng $a, b, c$.],
        [Đường thẳng $a$ và $b$ cùng song song với một mặt phẳng chứa $c$.],
        True([Nếu có đường thẳng $d$ chéo với $c$ thì $d$ cũng chéo với $a$ hoặc $b$.]),
        True([Mặt phẳng tạo bởi $a$ và $c$ cắt mặt phẳng tạo bởi $b$ và $c$ theo giao tuyến chính là đường thẳng $c$.])
    ), 
    loigiai: [
        - *a)* Sai. Vì $a$ và $b$ chéo nhau nên không thể cùng nằm trong một mặt phẳng, dẫn tới cả ba đường không thể đồng phẳng.
        - *b)* Sai. Mặt phẳng chứa $c$ có thể cắt $a$ và $b$ (tại các giao điểm của chúng với $c$), không thể song song với cả hai.
        - *c)* Đúng. Nếu $d$ không chéo với cả $a$ và $b$, thì $d$ đồng phẳng với cả hai, dẫn đến mâu thuẫn là $a$ và $b$ chéo nhau.
        - *d)* Đúng. Vì mặt phẳng thứ nhất chứa $a, c$, mặt phẳng thứ hai chứa $b, c$. Chúng có đường thẳng chung là $c$, nên giao tuyến của chúng chính là $c$.
    ]
)

// DS 4
#ds([Một khung giàn mái thép có kết cấu dạng hình chóp cụt tứ giác $A B C D . A' B' C' D'$ với hai đáy $A B C D$ và $A' B' C' D'$ song song với nhau. Một thanh giằng chéo ổn định liên kết $M N$ nối trung điểm $M$ của cạnh $A B$ và trung điểm $N$ của cạnh $C' D'$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $M N$ song song với mặt phẳng bên $(A D D' A')$.]),
        True([Đường thẳng $M N$ song song với mặt phẳng bên $(B C C' B')$.]),
        [Đường thẳng $M N$ cắt mặt đáy $(A' B' C' D')$.],
        [Mặt phẳng chứa $M N$ và song song với $A D$ sẽ cắt mặt phẳng đáy $(A B C D)$ theo một giao tuyến song song với $A B$.]
    ), 
    loigiai: [
        - *a)* Đúng. Vì $M, N$ là trung điểm của các cạnh đáy đối diện nên $M N$ song song với mặt bên liên kết.
        - *b)* Đúng. Tương tự như trên.
        - *c)* Sai. Vì $M in A B subset (A B C D)$ và $N in C' D' subset (A' B' C' D')$. Do hai đáy song song nên $M N$ chéo nhau hoặc cắt các cạnh bên khác, nhưng không cắt đáy $(A' B' C' D')$ tại điểm nằm ngoài $N$.
        - *d)* Sai. Giao tuyến của mặt phẳng này với đáy $(A B C D)$ phải song song với $A D$ (không song song với $A B$).
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M$ là trung điểm của cạnh $S B$. Mặt phẳng $(A D M)$ cắt cạnh $S C$ tại điểm $N$. Biết diện tích hình thang $A D N M$ gấp $3$ lần diện tích tam giác $S M N$. Tính tỉ số diện tích tam giác $S M N$ và diện tích hình thang $A D N M$ (nhập đáp án dưới dạng số thập phân làm tròn đến 2 chữ số thập phân, ví dụ: 0.33).],
    [0.33],
    loigiai: [
        Diện tích tam giác $S M N$ là $S_1$, diện tích hình thang $A D N M$ là $S_2$.
        Theo đề bài: $S_2 = 3 S_1$.
        Tỉ số diện tích cần tìm là:
        $ (S_1) / (S_2) = (1) / (3) approx 0.33 $.
    ]
)

// TL 2
#tln([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Một mặt phẳng $(alpha)$ song song với mặt phẳng đáy $(A B C D)$ cắt các cạnh bên $S A, S B, S C, S D$ lần lượt tại $A', B', C', D'$. Biết tỉ số $(S A') / (S A) = (1)/(3)$. Tính tỉ số diện tích thiết diện $A' B' C' D'$ và diện tích đáy $A B C D$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [10],
    loigiai: [
        Vì mặt phẳng $(alpha) parallel (A B C D)$ nên các cạnh của thiết diện song song với các cạnh của đáy tương ứng:
        $A' B' parallel A B$, $B' C' parallel B C$, $C' D' parallel C D$, $D' A' parallel D A$.
        Theo định lý Thales trong không gian:
        $ (A' B') / (A B) = (B' C') / (B C) = (S A') / (S A) = (1)/(3) $.
        Thiết diện $A' B' C' D'$ đồng dạng với đáy $A B C D$ theo tỉ số $k = (1)/(3)$.
        Do đó tỉ số diện tích là:
        $ (S_(A' B' C' D')) / (S_(A B C D)) = k^2 = ((1)/(3))^2 = (1)/(9) $.
        Ta được phân số tối giản là $(1)/(9)$, do đó $a = 1, b = 9 => a + b = 10$.
    ]
)

// TL 3
#tln([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M$ là trung điểm của cạnh $S C$. Mặt phẳng $(alpha)$ đi qua $A M$ và song song với đường thẳng $B D$ cắt các cạnh $S B, S D$ lần lượt tại $P, Q$. Biết diện tích tam giác $S P Q$ bằng $16$ $"cm"^2$. Tính diện tích tam giác $S B D$ (tính bằng xăng-ti-mét vuông).],
    [36],
    loigiai: [
        Gọi $O = A C inter B D$ và $I = S O inter A M$.
        Trong tam giác $S A C$, $S O$ và $A M$ là các trung tuyến nên $I$ là trọng tâm $=> (S I) / (S O) = (2)/(3)$.
        Vì $(alpha) parallel B D$ nên $P Q parallel B D$.
        Trong tam giác $S B D$, $P Q parallel B D => (S P) / (S B) = (S Q) / (S D) = (S I) / (S O) = (2)/(3)$.
        Tỉ số diện tích hai tam giác:
        $ (S_(S P Q)) / (S_(S B D)) = ((S P) / (S B)) dot ((S Q) / (S D)) = (2)/(3) dot (2)/(3) = (4)/(9) $.
        Do đó:
        $ S_(S B D) = (9)/(4) S_(S P Q) = (9)/(4) dot 16 = 36 " (cm"^2")" $.
    ]
)

// TL 4
#tln([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $C D$. Một mặt phẳng $(alpha)$ song song với mặt phẳng $(S A D)$ cắt các cạnh $B C, S C, S B$ lần lượt tại $I, J, K$. Biết $M N = 12$ cm. Tính độ dài đoạn thẳng thiết diện $I K$ (tính bằng xăng-ti-mét).],
    [6],
    loigiai: [
        Mặt phẳng $(alpha) parallel (S A D)$ nên:
        - Giao tuyến của $(alpha)$ với mặt đáy $(A B C D)$ song song với $A D$. Do đó $I K$ song song với các cạnh bên tương ứng.
        Ta có $I, K$ lần lượt là trung điểm của $B C$ và $S B$.
        Trong tam giác $S B C$, $I K$ là đường trung bình ứng với cạnh $S C$, hoặc trong tam giác $A B D$ song song.
        Vì $M N$ là đường trung bình hình bình hành $A B C D => M N = B C = 12$ cm.
        Do đó $I K = (1)/(2) B C = (1)/(2) dot 12 = 6$ (cm).
    ]
)

// TL 5
#tln([Cho tứ diện $A B C D$. Gọi $G_1, G_2, G_3$ lần lượt là trọng tâm của các tam giác $A B C$, $A C D$, $A B D$. Tính tỉ số diện tích tam giác $G_1 G_2 G_3$ và diện tích tam giác $B C D$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [10],
    fig: canvas(length: 1.3cm, {
      import draw: *
      
      // Đỉnh tứ diện A.BCD
      let B = (-1.5, 0.5)
      let C = (2.0, 0.5)
      let D = (0.0, -0.8)
      let A = (0.5, 3.0)
      
      // Trọng tâm G1, G2, G3
      // G1: trọng tâm ABC
      let G1 = ((A.at(0) + B.at(0) + C.at(0))/3, (A.at(1) + B.at(1) + C.at(1))/3)
      // G2: trọng tâm ACD
      let G2 = ((A.at(0) + C.at(0) + D.at(0))/3, (A.at(1) + C.at(1) + D.at(1))/3)
      // G3: trọng tâm ABD
      let G3 = ((A.at(0) + B.at(0) + D.at(0))/3, (A.at(1) + B.at(1) + D.at(1))/3)
      
      // Vẽ màu fill cho tam giác G1G2G3
      line(G1, G2, G3, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Cạnh khuất của tứ diện
      line(B, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Các cạnh khuất của tam giác G1G2G3 (vì chúng nằm trong hoặc trên mặt khuất)
      line(G1, G2, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(G2, G3, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(G3, G1, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Các cạnh thấy của tứ diện
      line(A, B, stroke: 1pt + black)
      line(A, C, stroke: 1pt + black)
      line(A, D, stroke: 1pt + black)
      line(B, D, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      
      // Vẽ điểm
      circle(A, radius: 1.8pt, fill: black); content((A.at(0), A.at(1) + 0.35), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) - 0.35, B.at(1) + 0.15), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.35, C.at(1) + 0.15), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) - 0.1, D.at(1) - 0.35), $D$, size: 10pt)
      
      circle(G1, radius: 1.8pt, fill: rgb("#0F766E")); content((G1.at(0) + 0.35, G1.at(1) + 0.15), $G_1$, size: 10pt, fill: rgb("#0F766E"))
      circle(G2, radius: 1.8pt, fill: rgb("#0F766E")); content((G2.at(0) + 0.35, G2.at(1) - 0.15), $G_2$, size: 10pt, fill: rgb("#0F766E"))
      circle(G3, radius: 1.8pt, fill: rgb("#0F766E")); content((G3.at(0) - 0.35, G3.at(1) - 0.15), $G_3$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Gọi $M, N, P$ lần lượt là trung điểm của các cạnh $B C, C D, B D$.
        Ta có $A M, A N, A P$ là các đường trung tuyến của các tam giác $A B C, A C D, A B D$.
        Vì $G_1, G_2, G_3$ là trọng tâm của các tam giác đó nên:
        $ (A G_1) / (A M) = (A G_2) / (A N) = (A G_3) / (A P) = (2)/(3) $.
        Theo định lý Thales đảo, tam giác $G_1 G_2 G_3$ song song với tam giác $M N P$ và đồng dạng với tam giác $M N P$ theo tỉ số $k = (2)/(3)$.
        Do đó:
        $ (S_(G_1 G_2 G_3)) / (S_(M N P)) = k^2 = ((2)/(3))^2 = (4)/(9) $.
        Mặc khác, $M, N, P$ là trung điểm của các cạnh tam giác $B C D$, nên tam giác $M N P$ đồng dạng với tam giác $B C D$ theo tỉ số $(1)/(2)$.
        $ (S_(M N P)) / (S_(B C D)) = (1)/(4) $.
        Tỉ số diện tích cần tìm là:
        $ (S_(G_1 G_2 G_3)) / (S_(B C D)) = ((S_(G_1 G_2 G_3)) / (S_(M N P))) dot ((S_(M N P)) / (S_(B C D))) = (4)/(9) dot (1)/(4) = (1)/(9) $.
        Ta được phân số tối giản là $(1)/(9)$, do đó $a = 1, b = 9 => a + b = 10$.
    ]
)

// TL 6
#tln([Một giàn giáo chịu lực đứng dạng hình chóp $S.A B C D$ đáy là hình bình hành có chu vi bằng $36$ m. Người ta lắp các thanh thép ngang chống trượt ổn định kết cấu $M N, N P, P Q, Q M$ kết nối lần lượt trung điểm các cạnh bên $S A, S B, S C, S D$. Tính chu vi của khung thép ngang $M N P Q$ đó (tính bằng mét).],
    [18],
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
      
      // Vẽ màu fill cho khung ngang MNPQ
      line(M, N, P, Q, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Hidden edges of pyramid
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Hidden edges of cross-section
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(Q, M, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
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
        Vì $M, N, P, Q$ lần lượt là trung điểm của các cạnh bên $S A, S B, S C, S D$ nên các đoạn thẳng $M N, N P, P Q, Q M$ là các đường trung bình của các mặt bên hình chóp.
        Do đó:
        - $M N = (1)/(2) A B$.
        - $N P = (1)/(2) B C$.
        - $P Q = (1)/(2) C D$.
        - $Q M = (1)/(2) D A$.
        Chu vi của khung thép ngang $M N P Q$ là:
        $ C_(M N P Q) = M N + N P + P Q + Q M = (1)/(2) (A B + B C + C D + D A) = (1)/(2) C_(A B C D) $.
        Theo đề bài chu vi đáy là $36$ m, do đó chu vi của khung ngang là:
        $ C_(M N P Q) = (1)/(2) dot 36 = 18 $ (m).
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
