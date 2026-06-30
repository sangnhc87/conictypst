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
  exam-title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 03)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho hai mặt phẳng song song $(alpha)$ và $(beta)$. Nếu mặt phẳng $(gamma)$ cắt $(alpha)$ theo giao tuyến $a$ thì giao tuyến $b$ của $(gamma)$ và $(beta)$ có mối quan hệ thế nào với $a$?],
    (
        [Cắt nhau.],
        [Chéo nhau.],
        True([Song song.]),
        [Trùng nhau.]
    ),
    loigiai: [
        Theo tính chất của hai mặt phẳng song song: Nếu hai mặt phẳng song song thì mọi mặt phẳng thứ ba cắt cả hai mặt phẳng này sẽ cắt theo hai giao tuyến song song với nhau. Do đó $a parallel b$.
    ]
)

// TN 2
#tn([Trong không gian, cho hai mặt phẳng phân biệt $(alpha)$ và $(beta)$ cùng song song với mặt phẳng $(gamma)$. Mệnh đề nào sau đây đúng?],
    (
        [$(alpha)$ và $(beta)$ cắt nhau.],
        [$(alpha)$ và $(beta)$ trùng nhau.],
        True([$(alpha)$ và $(beta)$ song song với nhau.]),
        [$(alpha)$ và $(beta)$ chéo nhau.]
    ),
    loigiai: [
        Theo tính chất bắc cầu của quan hệ song song giữa các mặt phẳng: Hai mặt phẳng phân biệt cùng song song với mặt phẳng thứ ba thì song song với nhau. Do đó $(alpha) parallel (beta)$.
    ]
)

// TN 3
#tn([Phép chiếu song song không bảo toàn tính chất nào sau đây của hình phẳng?],
    (
        [Tính song song của hai đường thẳng.],
        [Tính thẳng hàng của ba điểm.],
        True([Độ lớn của một góc.]),
        [Tỉ số độ dài hai đoạn thẳng nằm trên hai đường thẳng song song.]
    ),
    loigiai: [
        Phép chiếu song song bảo toàn tính thẳng hàng, thứ tự ba điểm thẳng hàng, tính song song và tỉ số độ dài hai đoạn thẳng song song. Tuy nhiên, nó không bảo toàn độ lớn của góc.
    ]
)

// TN 4
#tn([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của $A B$ và $A C$. Mặt phẳng $(A' M N)$ song song với đường thẳng nào sau đây?],
    (
        [$A A'$.],
        True([$B' C'$.]),
        [$B B'$.],
        [$C C'$.]
    ),
    fig: canvas(length: 1.3cm, {
      import draw: *
      
      // Tọa độ lăng trụ đứng tam giác ABC.A'B'C'
      let A = (-1.5, 0.5)
      let B = (2.0, 0.5)
      let C = (0.0, -0.8)
      
      let Ap = (-1.5, 3.0)
      let Bp = (2.0, 3.0)
      let Cp = (0.0, 1.7)
      
      let M = (0.25, 0.5) // trung điểm AB
      let N = (-0.75, -0.15) // trung điểm AC
      
      // Cạnh khuất của lăng trụ
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Cạnh thấy
      line(A, Ap, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(A, C, stroke: 1pt + black)
      line(B, Bp, stroke: 1pt + black)
      line(C, Cp, stroke: 1pt + black)
      line(Ap, Bp, stroke: 1.2pt + black)
      line(Bp, Cp, stroke: 1.2pt + black)
      line(Cp, Ap, stroke: 1.2pt + black)
      
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.15), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.35, B.at(1) + 0.15), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) - 0.1, C.at(1) - 0.35), $C$, size: 10pt)
      circle(Ap, radius: 1.8pt, fill: black); content((Ap.at(0) - 0.35, Ap.at(1) + 0.2), $A'$, size: 10pt)
      circle(Bp, radius: 1.8pt, fill: black); content((Bp.at(0) + 0.35, Bp.at(1) + 0.2), $B'$, size: 10pt)
      circle(Cp, radius: 1.8pt, fill: black); content((Cp.at(0) - 0.15, Cp.at(1) - 0.25), $C'$, size: 10pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0), M.at(1) + 0.35), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) - 0.35, N.at(1) - 0.15), $N$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Trong tam giác $A B C$, $M N$ là đường trung bình nên $M N parallel B C$.
        Mà trong hình lăng trụ, $B C parallel B' C'$. Do đó $M N parallel B' C'$.
        Vì $B' C'$ không nằm trong mặt phẳng $(A' M N)$, nên $B' C' parallel (A' M N)$.
    ]
)

// TN 5
#tn([Trong thiết kế mái nhà khung thép phẳng song song, mặt phẳng mái chứa hệ xà gồ $(alpha)$ song song với mặt sàn ngang $(beta)$. Nếu dầm chịu lực chính của mái là đường thẳng $d$ song song với mặt sàn $(beta)$ thì khẳng định nào dưới đây đúng?],
    (
        [$d$ vuông góc với mặt mái $(alpha)$.],
        [$d$ cắt mặt mái $(alpha)$.],
        True([$d$ song song hoặc nằm trong mặt mái $(alpha)$.]),
        [$d$ chéo nhau với mọi xà gồ trên mặt mái $(alpha)$.]
    ),
    loigiai: [
        Vì $(alpha) parallel (beta)$ và đường thẳng $d parallel (beta)$ nên đường dầm $d$ song song hoặc nằm trong mặt phẳng mái $(alpha)$.
    ]
)

// TN 6
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Mặt phẳng $(B A' D')$ song song với mặt phẳng nào sau đây?],
    (
        [$(A B' D)$.],
        True([$(C D' B')$.]),
        [$(A' C' D)$.],
        [$(B C' D)$.]
    ),
    loigiai: [
        Trong hình hộp $A B C D . A' B' C' D'$:
        - Ta có $B D' parallel B' D$ (không đúng).
        Xét mặt phẳng $(B A' D')$ and $(C D' B')$:
        - Ta có $B A' parallel C D'$ (vì $B A' D' C$ là hình bình hành).
        - Ta có $B D' parallel B' C$ (không đúng).
        Xét mặt phẳng $(C D' B')$:
        - $A' B' parallel C D$ và $A' B' = C D => A' D' parallel B C$ (không đúng).
        Ta có $B A' parallel C D'$ và $B D' parallel B' C$ là sai.
        Đúng là:
        - $B D parallel B' D'$
        - $A' B parallel D' C$
        - $A' D parallel B' C$
        Do đó, mặt phẳng $(B A' D)$ song song với mặt phẳng $(C' B D')$.
        Đối với mặt phẳng $(B A' D')$ và $(C D' B')$:
        - $B A' parallel C D'$ (do $A' B C D'$ là hình bình hành).
        - $B D' parallel B' C$ (do $B C D' A'$ là hình bình hành).
        - $A' D' parallel B C$ (do $A' B' C D'$ là hình bình hành).
        Vậy mặt phẳng $(B A' D')$ song song với $(C D' B')$.
    ]
)

// TN 7
#tn([Nếu hai mặt phẳng song song $(alpha)$ và $(beta)$ lần lượt chứa hai đường thẳng song song $a$ và $b$ thì mọi mặt phẳng $(gamma)$ cắt cả $a$ và $b$ sẽ cắt $(alpha)$ và $(beta)$ theo hai giao tuyến có mối quan hệ gì?],
    (
        [Cắt nhau.],
        True([Song song.]),
        [Chéo nhau.],
        [Trùng nhau.]
    ),
    loigiai: [
        Vì hai mặt phẳng $(alpha)$ và $(beta)$ song song nên mặt phẳng $(gamma)$ cắt chúng theo hai giao tuyến song song với nhau.
    ]
)

// TN 8
#tn([Cho hai mặt phẳng song song $(alpha)$ và $(beta)$. Điểm $A$ thuộc $(alpha)$ và điểm $B$ thuộc $(beta)$. Qua $A$ vẽ đường thẳng $a$ song song với $b$ qua $B$. Khẳng định nào sau đây đúng?],
    (
        [$a$ và $b$ chéo nhau.],
        [$a$ và $b$ cắt nhau.],
        True([Đường thẳng $a$ song song với mặt phẳng $(beta)$ và $b$ song song với $(alpha)$.]),
        [$a$ và $b$ trùng nhau.]
    ),
    loigiai: [
        Vì $a parallel b$, điểm $A in a$ và $B in b$. Do $a parallel b$ và $b subset (beta)$ nên $a parallel (beta)$. Tương tự $b parallel (alpha)$.
    ]
)

// TN 9
#tn([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $I, J, K$ lần lượt là trung điểm của các cạnh $A B, B C, C A$. Mặt phẳng $(I J K)$ song song với mặt phẳng nào sau đây?],
    (
        [$(A' B' C')$.],
        True([$(A B C)$ và $(A' B' C')$.]),
        [$(A B C)$.],
        [Không song song với mặt phẳng nào.]
    ),
    loigiai: [
        Vì $I, J, K$ là trung điểm các cạnh đáy $A B, B C, C A$ nên mặt phẳng $(I J K)$ trùng với mặt phẳng đáy $(A B C)$.
        Mà trong hình lăng trụ, $(A B C) parallel (A' B' C')$. Do đó $(I J K)$ song song với $(A' B' C')$ (và nằm trong $(A B C)$).
    ]
)

// TN 10
#tn([Trong phép chiếu song song lên mặt phẳng chiếu $(P)$ theo phương chiếu $l$. Một hình tròn $(C)$ nằm trên mặt phẳng không song song với phương chiếu $l$ và không song song với mặt phẳng chiếu $(P)$. Hình chiếu của hình tròn $(C)$ là hình gì?],
    (
        [Hình tròn.],
        True([Hình elip.]),
        [Đoạn thẳng.],
        [Hình tam giác.]
    ),
    loigiai: [
        Hình chiếu song song của một hình tròn lên mặt phẳng không song song với mặt phẳng chứa đường tròn đó là một hình elip.
    ]
)

// TN 11
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Thiết diện cắt bởi mặt phẳng song song với mặt phẳng $(A B C D)$ là hình gì?],
    (
        [Hình tam giác.],
        [Hình thang.],
        True([Hình bình hành.]),
        [Hình ngũ giác.]
    ),
    loigiai: [
        Mặt phẳng song song với mặt phẳng đáy $(A B C D)$ cắt bốn mặt bên của hình hộp theo các giao tuyến song song với các cạnh đáy tương ứng. Do đó, thiết diện thu được là một hình bình hành bằng đáy $A B C D$.
    ]
)

// TN 12
#tn([Một bức tranh phẳng được treo đứng trên tường đứng $(alpha)$. Một bóng đèn chiếu sáng từ xa tạo ánh sáng song song chiếu vào bức tranh và in bóng lên mặt sàn phẳng ngang $(beta)$. Biết tường $(alpha)$ vuông góc với sàn $(beta)$. Bóng của bức tranh trên mặt sàn là hình gì?],
    (
        [Hình chữ nhật.],
        True([Đoạn thẳng.]),
        [Hình elip.],
        [Điểm.]
    ),
    loigiai: [
        Vì bức tranh phẳng đứng sát tường $(alpha)$ vuông góc với sàn $(beta)$, nên mặt phẳng chứa bức tranh vuông góc với mặt sàn. Phép chiếu mặt trời (chiếu song song) theo phương đứng hoặc xiên sẽ chiếu bức tranh thẳng đứng xuống mặt sàn $(beta)$ tạo thành một đoạn thẳng nằm trên mặt sàn (giao tuyến của mặt phẳng chứa tranh với sàn).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hai mặt phẳng song song $(alpha)$ và $(beta)$. Đường thẳng $a$ nằm trong $(alpha)$, đường thẳng $b$ nằm trong $(beta)$. Các phát biểu sau đúng hay sai?], (
        [Đường thẳng $a$ và đường thẳng $b$ luôn song song với nhau.],
        [Đường thẳng $a$ và đường thẳng $b$ luôn chéo nhau.],
        True([Đường thẳng $a$ song song với mặt phẳng $(beta)$.]),
        True([Có duy nhất một mặt phẳng chứa đường thẳng $a$ và song song với đường thẳng $b$.])
    ), 
    loigiai: [
        - *a)* Sai. Vì $a$ và $b$ có thể chéo nhau.
        - *b)* Sai. Vì $a$ và $b$ có thể song song với nhau.
        - *c)* Đúng. Vì $a subset (alpha)$ mà $(alpha) parallel (beta)$ nên $a parallel (beta)$.
        - *d)* Đúng. Vì $a$ và $b$ song song hoặc chéo nhau, nên luôn tồn tại duy nhất một mặt phẳng chứa $a$ và song song với $b$ (chính là mặt phẳng $(alpha)$ nếu $a$ và $b$ chéo nhau, hoặc mặt phẳng dựng từ $a$ song song với $b$).
    ]
)

// DS 2
#ds([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $C D$. Các phát biểu sau đúng hay sai?], (
        True([Mặt phẳng $(A M D')$ song song với mặt phẳng $(B N C')$.]),
        True([Đường thẳng $M N$ song song với mặt phẳng $(A' B' C' D')$.]),
        [Mặt phẳng $(M B C)$ song song với mặt phẳng $(N A D)$.],
        True([Đường thẳng $A' C'$ song song với mặt phẳng $(A B C D)$.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $A D' parallel B C'$ và $A M parallel N C$ (do $A B C D$ là hình bình hành, $M, N$ là trung điểm $A B, C D$). Do đó $(A M D') parallel (B N C')$.
        - *b)* Đúng. Vì $M N$ là đường trung bình của hình bình hành $A B C D => M N parallel A D parallel A' D' subset (A' B' C' D') => M N parallel (A' B' C' D')$.
        - *c)* Sai. Vì $(M B C)$ và $(N A D)$ chính là mặt đáy $(A B C D)$, chúng trùng nhau chứ không song song.
        - *d)* Đúng. Vì $A' C' parallel A C subset (A B C D) => A' C' parallel (A B C D)$.
    ]
)

// DS 3
#ds([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N, P$ lần lượt là trung điểm của các cạnh bên $A A', B B', C C'$. Các phát biểu sau đúng hay sai?], (
        True([Mặt phẳng $(M N P)$ song song với mặt phẳng đáy $(A B C)$.]),
        [Đường thẳng $M N$ song song với mặt phẳng $(A C C' A')$.],
        True([Thiết diện của hình lăng trụ cắt bởi mặt phẳng $(M N P)$ là tam giác bằng tam giác đáy $A B C$.]),
        True([Đường nối trọng tâm của hai tam giác $A B C$ và $A' B' C'$ song song với mặt phẳng $(A B B' A')$.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $M, N, P$ là trung điểm các cạnh bên nên các đoạn thẳng $M N, N P, P M$ lần lượt song song với $A B, B C, C A$. Do đó $(M N P) parallel (A B C)$.
        - *b)* Sai. $M N$ nối trung điểm $A A'$ và $B B'$, do đó $M N parallel A B$. Mà $A B$ cắt mặt phẳng $(A C C' A')$ tại $A$. Vì thế $M N$ không song song với $(A C C' A')$.
        - *c)* Đúng. Vì $(M N P) parallel (A B C)$ cắt các cạnh bên đứng tại trung điểm, nên thiết diện tam giác $M N P$ bằng tam giác đáy $A B C$.
        - *d)* Đúng. Đường nối hai trọng tâm của hai đáy song song trong hình lăng trụ song song với các cạnh bên của hình lăng trụ đó.
    ]
)

// DS 4
#ds([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của $A' B'$ và $B' C'$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $M N$ song song với mặt phẳng đáy $(A B C)$.]),
        True([Giao tuyến của mặt phẳng $(A M N)$ và mặt phẳng $(A B C)$ là đường thẳng song song với $A C$.]),
        [Thiết diện của hình lăng trụ cắt bởi mặt phẳng $(A M N)$ là một hình bình hành.],
        True([Thiết diện của hình lăng trụ cắt bởi mặt phẳng $(A M N)$ là hình thang $A M N C$.])
    ), 
    fig: canvas(length: 1.3cm, {
      import draw: *
      
      // Tọa độ lăng trụ đứng tam giác ABC.A'B'C'
      let A = (-1.5, 0.5)
      let B = (2.0, 0.5)
      let C = (0.0, -0.8)
      
      let Ap = (-1.5, 3.0)
      let Bp = (2.0, 3.0)
      let Cp = (0.0, 1.7)
      
      let M = (0.25, 3.0) // trung điểm A'B'
      let N = (1.0, 2.35)  // trung điểm B'C'
      
      // Vẽ màu fill cho hình thang AMNC
      line(A, M, N, C, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Cạnh khuất của lăng trụ
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, Ap, stroke: 1pt + black)
      
      // Cạnh khuất của thiết diện
      line(A, M, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Cạnh thấy
      line(B, C, stroke: 1pt + black)
      line(A, C, stroke: 1pt + black)
      line(B, Bp, stroke: 1pt + black)
      line(C, Cp, stroke: 1pt + black)
      line(Ap, Bp, stroke: 1.2pt + black)
      line(Bp, Cp, stroke: 1.2pt + black)
      line(Cp, Ap, stroke: 1.2pt + black)
      
      line(M, N, stroke: 1.5pt + rgb("#0F766E"))
      line(N, C, stroke: 1.5pt + rgb("#0F766E"))
      
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.15), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.35, B.at(1) + 0.15), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) - 0.1, C.at(1) - 0.35), $C$, size: 10pt)
      circle(Ap, radius: 1.8pt, fill: black); content((Ap.at(0) - 0.35, Ap.at(1) + 0.2), $A'$, size: 10pt)
      circle(Bp, radius: 1.8pt, fill: black); content((Bp.at(0) + 0.35, Bp.at(1) + 0.2), $B'$, size: 10pt)
      circle(Cp, radius: 1.8pt, fill: black); content((Cp.at(0) - 0.15, Cp.at(1) - 0.25), $C'$, size: 10pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0), M.at(1) + 0.35), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) + 0.35, N.at(1) + 0.15), $N$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        - *a)* Đúng. Vì $M N$ là đường trung bình tam giác $A' B' C' => M N parallel A' C' parallel A C subset (A B C) => M N parallel (A B C)$.
        - *b)* Đúng. Vì hai mặt phẳng $(A M N)$ và $(A B C)$ chứa hai đường thẳng song song là $M N$ và $A C$, có điểm chung là $A$, nên giao tuyến của chúng là đường thẳng qua $A$ song song với $A C$.
        - *c)* Sai. Vì $M N = (1)/(2) A C$, thiết diện là hình thang chứ không phải hình bình hành.
        - *d)* Đúng. Thiết diện cắt qua các điểm $A, M, N, C$. Vì $M N parallel A C$ nên thiết diện là hình thang $A M N C$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho hình lăng trụ đứng tam giác $A B C . A' B' C'$. Một mặt phẳng $(alpha)$ song song với mặt phẳng đáy $(A B C)$ cắt các cạnh bên $A A', B B', C C'$ lần lượt tại $A_1, B_1, C_1$. Biết $A A_1 = 3$ cm và $A_1 A' = 6$ cm. Tính tỉ số diện tích mặt bên $A B B_1 A_1$ và diện tích mặt bên $A_1 B_1 B' A'$ (viết kết quả dưới dạng số thập phân).],
    [0.5],
    loigiai: [
        Vì các mặt bên là các hình chữ nhật đứng có cùng chiều rộng $A B$.
        Do đó, tỉ số diện tích hai mặt bên bằng tỉ số chiều cao của chúng:
        $ (S_(A B B_1 A_1)) / (S_(A_1 B_1 B' A')) = (A A_1) / (A_1 A') = (3) / (6) = 0.5 $.
    ]
)

// TL 2
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $G_1, G_2$ lần lượt là trọng tâm của các tam giác $B D A'$ và $B D C'$. Khẳng định nào sau đây là đúng về vị trí tương đối giữa đường thẳng $G_1 G_2$ và các mặt phẳng bên của hình hộp? Nhập số $1$ nếu $G_1 G_2$ song song với hai mặt phẳng bên đối diện $(A D D' A')$ và $(B C C' B')$, nhập số $2$ nếu song song với $(A B B' A')$ và $(C D D' C')$.],
    [1],
    loigiai: [
        Ta có $G_1$ là trọng tâm tam giác $A' B D$, $G_2$ là trọng tâm tam giác $C' B D$.
        Theo tính chất của trọng tâm, đường thẳng $G_1 G_2$ song song với đường chéo $A' C'$.
        Mà trong hình hộp, $A' C' parallel A C subset (A B C D)$, do đó $G_1 G_2 parallel (A B C D)$ và song song với các mặt phẳng song song với $A' C'$, cụ thể là hai mặt bên đối diện $(A D D' A')$ và $(B C C' B')$.
        Đáp án đúng là số $1$.
    ]
)

// TL 3
#tln([Cho hai mặt phẳng song song $(alpha)$ và $(beta)$ có khoảng cách bằng $d = 8$ cm. Một hình lập phương $A B C D . A' B' C' D'$ có đáy $A B C D$ nằm trên $(alpha)$ và đáy $A' B' C' D'$ nằm trên $(beta)$. Tính diện tích toàn phần của hình lập phương đó (tính bằng xăng-ti-mét vuông).],
    [384],
    loigiai: [
        Khoảng cách giữa hai mặt phẳng đáy chứa hai đáy của hình lập phương chính là độ dài cạnh $a$ của hình lập phương.
        Do đó $a = d = 8$ cm.
        Diện tích toàn phần của hình lập phương là:
        $ S_("tp") = 6 a^2 = 6 dot 8^2 = 6 dot 64 = 384 " (cm"^2")" $.
    ]
)

// TL 4
#tln([Cho hình lăng trụ đứng tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $A C$. Tính tỉ số diện tích tam giác $A M N$ và diện tích tam giác $A B C$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [5],
    loigiai: [
        Vì $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $A C$ nên theo tính chất đường trung bình, tam giác $A M N$ đồng dạng với tam giác $A B C$ theo tỉ số $k = (1)/(2)$.
        Do đó, tỉ số diện tích của hai tam giác là:
        $ (S_(A M N)) / (S_(A B C)) = k^2 = ((1)/(2))^2 = (1)/(4) $.
        Phân số tối giản là $(1)/(4)$, do đó $a = 1, b = 4 => a + b = 5$.
    ]
)

// TL 5
#tln([Cho hình lăng trụ đứng tam giác $A B C . A' B' C'$ có diện tích đáy bằng $54$ $"cm"^2$. Gọi $G, G'$ lần lượt là trọng tâm của hai đáy $A B C$ và $A' B' C'$. Mặt phẳng $(alpha)$ đi qua trung điểm $I$ của $G G'$ và song song với đáy $(A B C)$ cắt các cạnh bên $A A', B B', C C'$ lần lượt tại $A_1, B_1, C_1$. Tính diện tích thiết diện $A_1 B_1 C_1$ (tính bằng xăng-ti-mét vuông).],
    [54],
    fig: canvas(length: 1.3cm, {
      import draw: *
      
      // Tọa độ lăng trụ đứng tam giác ABC.A'B'C'
      let A = (-1.5, 0.5)
      let B = (2.0, 0.5)
      let C = (0.0, -0.8)
      
      let Ap = (-1.5, 3.0)
      let Bp = (2.0, 3.0)
      let Cp = (0.0, 1.7)
      
      // Trọng tâm G và G'
      let G = ((A.at(0) + B.at(0) + C.at(0))/3, (A.at(1) + B.at(1) + C.at(1))/3)
      let Gp = ((Ap.at(0) + Bp.at(0) + Cp.at(0))/3, (Ap.at(1) + Bp.at(1) + Cp.at(1))/3)
      
      // Cạnh khuất của lăng trụ (AB)
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Các cạnh thấy
      line(A, Ap, stroke: 1pt + black)
      
      // Các đường khuất nối đến G
      line(G, Ap, stroke: (paint: rgb("#0F766E"), thickness: 0.8pt, dash: "dashed"))
      line(G, Bp, stroke: (paint: rgb("#0F766E"), thickness: 0.8pt, dash: "dashed"))
      line(G, Cp, stroke: (paint: rgb("#0F766E"), thickness: 0.8pt, dash: "dashed"))
      line(G, Gp, stroke: (paint: rgb("#0F766E"), thickness: 0.8pt, dash: "dashed"))
      
      // Các cạnh thấy
      line(B, C, stroke: 1pt + black)
      line(A, C, stroke: 1pt + black)
      line(B, Bp, stroke: 1pt + black)
      line(C, Cp, stroke: 1pt + black)
      
      line(Ap, Bp, stroke: 1.2pt + black)
      line(Bp, Cp, stroke: 1.2pt + black)
      line(Cp, Ap, stroke: 1.2pt + black)
      
      // Vẽ điểm
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.2, A.at(1) + 0.2), $A$, size: 9pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.2, B.at(1) + 0.2), $B$, size: 9pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.2, C.at(1) - 0.2), $C$, size: 9pt)
      
      circle(Ap, radius: 1.8pt, fill: black); content((Ap.at(0) - 0.25, Ap.at(1) + 0.2), $A'$, size: 9pt)
      circle(Bp, radius: 1.8pt, fill: black); content((Bp.at(0) + 0.25, Bp.at(1) + 0.2), $B'$, size: 9pt)
      circle(Cp, radius: 1.8pt, fill: black); content((Cp.at(0) + 0.2, Cp.at(1) - 0.25), $C'$, size: 9pt)
      
      circle(G, radius: 1.8pt, fill: rgb("#0F766E")); content((G.at(0) + 0.3, G.at(1) - 0.2), $G$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-width: 40%,
    loigiai: [
        Vì mặt phẳng $(alpha)$ song song với đáy $(A B C)$ nên thiết diện $A_1 B_1 C_1$ là một tam giác song song và bằng với đáy $A B C$.
        Do đó, diện tích thiết diện $A_1 B_1 C_1$ bằng diện tích đáy $A B C$:
        $ S_(A_1 B_1 C_1) = S_(A B C) = 54 " (cm"^2")" $.
    ]
)

// TL 6
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $A D$. Mặt phẳng $(A' M N)$ cắt các cạnh bên $B B'$ và $D D'$ lần lượt tại $P$ và $Q$. Biết độ dài cạnh bên $A A' = 12$ cm. Tính độ dài đoạn thẳng $B P$ (tính bằng xăng-ti-mét).],
    [6],
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
      
      let M = (0.0, 0.5)   // trung điểm AB
      let N = (-1.0, -0.15)  // trung điểm AD
      let P = (1.5, 1.5)  // trung điểm BB'
      let Q = (-0.5, 0.2)  // trung điểm DD'
      
      // Vẽ màu fill cho thiết diện
      line(Ap, P, M, N, Q, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Hidden edges of hộp
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Hidden edges of cross-section
      line(Ap, P, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(P, M, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(N, Q, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(Q, Ap, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges of hộp
      line(A, Ap, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      line(B, Bp, stroke: 1pt + black)
      line(C, Cp, stroke: 1pt + black)
      line(D, Dp, stroke: 1pt + black)
      
      line(Ap, Bp, stroke: 1.2pt + black)
      line(Bp, Cp, stroke: 1.2pt + black)
      line(Cp, Dp, stroke: 1.2pt + black)
      line(Dp, Ap, stroke: 1.2pt + black)
      
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.15), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.35, B.at(1) + 0.15), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.25, C.at(1) - 0.25), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) - 0.35, D.at(1) - 0.2), $D$, size: 10pt)
      circle(Ap, radius: 1.8pt, fill: black); content((Ap.at(0) - 0.35, Ap.at(1) + 0.2), $A'$, size: 10pt)
      circle(Bp, radius: 1.8pt, fill: black); content((Bp.at(0) + 0.35, Bp.at(1) + 0.2), $B'$, size: 10pt)
      circle(Cp, radius: 1.8pt, fill: black); content((Cp.at(0) + 0.25, Cp.at(1) - 0.2), $C'$, size: 10pt)
      circle(Dp, radius: 1.8pt, fill: black); content((Dp.at(0) - 0.35, Dp.at(1) - 0.2), $D'$, size: 10pt)
    }),
    fig-width: 35%,
    loigiai: [
        Mặt phẳng $(A' M N)$ cắt mặt bên $(A B B' A')$ theo giao tuyến $A' P$ đi qua $M$ (trung điểm $A B$).
        Vì $M P$ đi qua trung điểm $A B$ và song song với cạnh bên (do Thales):
        $ (B P) / (A A') = (B M) / (A B) = (1)/(2) $.
        Do đó:
        $ B P = (1)/(2) A A' = (1)/(2) dot 12 = 6 $ cm.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
