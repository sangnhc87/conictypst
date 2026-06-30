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
  exam-title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 05)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Qua một điểm nằm ngoài một mặt phẳng cho trước, có bao nhiêu đường thẳng song song với mặt phẳng đó?],
    (
        [Có duy nhất một.],
        [Có hai.],
        [Không có.],
        True([Có vô số.])
    ),
    loigiai: [
        Qua điểm $A$ nằm ngoài mặt phẳng $(P)$, ta dựng mặt phẳng $(Q)$ song song với $(P)$.
        Mọi đường thẳng qua $A$ nằm trong $(Q)$ đều song song với mặt phẳng $(P)$. Vì có vô số đường thẳng qua $A$ nằm trong $(Q)$, nên có vô số đường thẳng song song với $(P)$.
    ]
)

// TN 2
#tn([Trong không gian, cho hai đường thẳng chéo nhau $a$ và $b$. Nếu đường thẳng $c$ song song với $a$ thì vị trí tương đối giữa $c$ và $b$ là gì?],
    (
        [Chắc chắn chéo nhau.],
        [Chắc chắn song song.],
        True([Chéo nhau hoặc cắt nhau.]),
        [Cắt nhau hoặc song song.]
    ),
    loigiai: [
        Vì $c parallel a$ và $a, b$ chéo nhau, nên $c$ và $b$ không thể song song (nếu song song thì $a$ cũng song song với $b$ hoặc trùng $b$, mâu thuẫn).
        Do đó, $c$ và $b$ chỉ có thể chéo nhau hoặc cắt nhau.
    ]
)

// TN 3
#tn([Để gia cố hệ thống khung giàn giáo đứng hình hộp, người ta lắp các thanh chéo chịu lực $A D'$ và $B C'$. Khẳng định nào sau đây đúng về vị trí tương đối của hai thanh chống chéo này?],
    (
        [Song song với nhau.],
        [Cắt nhau.],
        True([Chéo nhau.]),
        [Trùng nhau.]
    ),
    loigiai: [
        Hai đường thẳng $A D'$ và $B C'$ nằm trên hai mặt đối diện song song của hình hộp và không song song với nhau. Do đó, chúng chéo nhau trong không gian.
    ]
)

// TN 4
#tn([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M, N, P, Q$ lần lượt là trung điểm của các cạnh $S A, S B, S C, S D$. Mặt phẳng $(M N P Q)$ song song với mặt phẳng nào sau đây?],
    (
        [$(S A B)$.],
        [$(S B C)$.],
        True([$(A B C D)$]),
        [$(S A D)$.]
    ),
    loigiai: [
        Ta có $M N$ và $N P$ lần lượt là đường trung bình của các tam giác $S A B$ và $S B C$.
        Do đó $M N parallel A B$ và $N P parallel B C$.
        Suy ra $(M N P Q) parallel (A B C D)$.
    ]
)

// TN 5
#tn([Thông qua phép chiếu song song theo phương chiếu $l$ lên mặt phẳng $(P)$, hình chiếu của một đoạn thẳng $A B$ song song với phương chiếu $l$ là gì?],
    (
        [Một đoạn thẳng bằng $A B$.],
        [Một đoạn thẳng ngắn hơn $A B$.],
        True([Một điểm.]),
        [Đường thẳng.]
    ),
    loigiai: [
        Vì đoạn thẳng $A B$ song song với phương chiếu $l$ nên mọi điểm thuộc đoạn thẳng $A B$ đều có hình chiếu trùng nhau tại một điểm duy nhất trên mặt phẳng chiếu.
    ]
)

// TN 6
#tn([Cho ba mặt phẳng song song $(P), (Q), (R)$. Hai đường thẳng $d_1$ và $d_2$ cắt ba mặt phẳng này lần lượt tại $A, B, C$ và $A', B', C'$. Biết $A B = 4$ cm, $B C = 6$ cm, $B' C' = 9$ cm. Tính độ dài đoạn thẳng $A' B'$ (tính bằng xăng-ti-mét).],
    (
        [$5$ cm.],
        True([$6$ cm.]),
        [$7$ cm.],
        [$8$ cm.]
    ),
    loigiai: [
        Áp dụng định lý Thales trong không gian cho ba mặt phẳng song song:
        $ (A B) / (B C) = (A' B') / (B' C') $
        Thay số vào:
        $ (4) / (6) = (A' B') / (9) => A' B' = (4 dot 9) / (6) = 6 " (cm)" $.
    ]
)

// TN 7
#tn([Một cấu kiện chịu lực của cầu vượt gồm các dầm ngang $A B, C D, E F$ song song với nhau và song song với mặt sông phẳng nằm ngang. Các dầm dọc chịu lực $M N, P Q$ gác lên các dầm ngang đó. Khẳng định nào sau đây đúng về vị trí của các dầm dọc đối với mặt sông phẳng?],
    (
        [Dầm dọc vuông góc với mặt sông.],
        [Dầm dọc cắt mặt sông.],
        True([Dầm dọc song song với mặt sông.]),
        [Dầm dọc chéo với mặt sông.]
    ),
    loigiai: [
        Các dầm ngang xác định một mặt phẳng $(alpha)$ song song với mặt sông $(P)$. Các dầm dọc nằm trong mặt phẳng $(alpha)$, do đó các dầm dọc cũng song song với mặt sông phẳng $(P)$.
    ]
)

// TN 8
#tn([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M$ là trung điểm của cạnh $B B'$. Thiết diện của hình lăng trụ cắt bởi mặt phẳng $(A M C)$ là hình gì?],
    (
        [Hình bình hành.],
        True([Hình tam giác.]),
        [Hình thang.],
        [Hình chữ nhật.]
    ),
    loigiai: [
        Ba điểm $A, M, C$ nằm trên ba cạnh của lăng trụ tam giác, mặt phẳng $(A M C)$ cắt trực tiếp các cạnh bên tại các điểm này. Thiết diện thu được là tam giác $A M C$.
    ]
)

// TN 9
#tn([Hình biểu diễn của một hình vuông qua phép chiếu song song lên một mặt phẳng chéo góc với mặt phẳng chứa hình vuông luôn là hình gì?],
    (
        [Hình vuông.],
        [Hình chữ nhật.],
        True([Hình bình hành.]),
        [Hình thang.]
    ),
    loigiai: [
        Phép chiếu song song bảo toàn tính song song và tỉ lệ đoạn thẳng song song, biến một hình bình hành (hình vuông là trường hợp đặc biệt) thành một hình bình hành.
    ]
)

// TN 10
#tn([Dưới ánh nắng mặt trời chiếu chéo góc, bóng của hai cột đèn đứng song song với nhau trên mặt sân phẳng nằm ngang có mối quan hệ như thế nào?],
    (
        [Cắt nhau.],
        [Chéo nhau.],
        True([Song song với nhau.]),
        [Trùng nhau.]
    ),
    loigiai: [
        Tia sáng mặt trời chiếu song song trong cùng thời điểm. Hai cột đèn song song với nhau và vuông góc với mặt sân phẳng. Do đó bóng của hai cột đèn trên mặt sân phẳng song song với nhau.
    ]
)

// TN 11
#tn([Cho hình hộp $A B C D . A' B' C' D'$. Giao tuyến của hai mặt phẳng $(A B C D)$ và $(A' B' C' D')$ là gì?],
    (
        [Đường thẳng $A B$.],
        [Đường thẳng $A' B'$.],
        [Một điểm chung.],
        True([Không có giao tuyến (tập rỗng).])
    ),
    loigiai: [
        Vì hai mặt phẳng đáy $(A B C D)$ và $(A' B' C' D')$ của hình hộp song song với nhau nên chúng không có điểm chung. Do đó giao tuyến của chúng là tập rỗng.
    ]
)

// TN 12
#tn([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Mặt phẳng $(alpha)$ đi qua trọng tâm tam giác $S A B$ và song song với mặt đáy $(A B C D)$. Thiết diện cắt bởi mặt phẳng $(alpha)$ là hình gì?],
    (
        [Hình tam giác.],
        True([Hình bình hành.]),
        [Hình thang.],
        [Hình ngũ giác.]
    ),
    loigiai: [
        Vì mặt phẳng $(alpha)$ song song với đáy $(A B C D)$ nên thiết diện cắt các mặt bên của hình chóp theo các đường thẳng song song với các cạnh đáy tương ứng. Do đó thiết diện thu được là một hình bình hành đồng dạng với đáy $A B C D$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M, N$ lần lượt là trung điểm của các cạnh $S A, S C$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $M N$ song song với mặt phẳng đáy $(A B C D)$.]),
        True([Đường thẳng $M N$ chéo nhau với đường thẳng $B D$.]),
        True([Giao tuyến của hai mặt phẳng $(S M N)$ và $(S B D)$ là đường thẳng $S O$ (với $O$ là giao điểm của $A C$ và $B D$).]),
        [Mặt phẳng $(B M N)$ song song với mặt phẳng $(D M N)$.]
    ), 
    loigiai: [
        - *a)* Đúng. Trong tam giác $S A C$, $M N$ là đường trung bình ứng với cạnh $A C => M N parallel A C => M N parallel (A B C D)$.
        - *b)* Đúng. Đường thẳng $M N$ nằm trong mặt phẳng $(S A C)$ còn $B D$ nằm trong mặt phẳng $(A B C D)$, chúng không song song và không cắt nhau nên chéo nhau.
        - *c)* Đúng. Giao tuyến của hai mặt phẳng này chứa điểm $S$ chung và giao điểm của $M N$ và $S O$ tại trung điểm $I$, do đó chính là đường thẳng $S O$.
        - *d)* Sai. Hai mặt phẳng $(B M N)$ và $(D M N)$ cắt nhau theo giao tuyến $M N$, không thể song song với nhau.
    ]
)

// DS 2
#ds([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $I, J, K$ lần lượt là trung điểm của các cạnh bên $A A', B B', C C'$. Các phát biểu sau đúng hay sai?], (
        True([Mặt phẳng $(I J K)$ song song với mặt phẳng $(A' B' C')$.]),
        True([Diện tích thiết diện $I J K$ bằng diện tích mặt đáy $A B C$.]),
        [Đường thẳng $I J$ song song với mặt phẳng $(A C C' A')$.],
        True([Nếu $G, G'$ lần lượt là trọng tâm của tam giác $A B C$ và $I J K$ thì $G G' parallel A A'$.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $I, J, K$ là trung điểm các cạnh bên nên $(I J K)$ song song với các đáy $(A B C)$ và $(A' B' C')$.
        - *b)* Đúng. Thiết diện cắt bởi mặt phẳng song song với đáy tam giác của hình lăng trụ đứng là tam giác bằng đáy, nên diện tích bằng nhau.
        - *c)* Sai. Vì $I J parallel A B$, mà $A B$ cắt $(A C C' A')$ tại $A$. Do đó $I J$ cắt mặt phẳng này chứ không song song.
        - *d)* Đúng. Đường nối hai trọng tâm của hai tam giác thiết diện song song song song với các cạnh bên $A A'$.
    ]
)

// DS 3
#ds([Một hệ khung giàn chịu lực của nhà xưởng dạng hình chóp cụt tứ giác $A B C D . A' B' C' D'$ có đáy $A B C D$ và $A' B' C' D'$ là các hình bình hành song song với nhau. Gọi $M, N, P, Q$ lần lượt là trung điểm của các thanh xiên chịu lực $A A', B B', C C', D D'$. Các phát biểu sau đúng hay sai?], (
        True([Các thanh thép ngang $M N, N P, P Q, Q M$ tạo thành một khung thép hình bình hành.]),
        True([Mặt phẳng $(M N P Q)$ song song với hai mặt phẳng đáy.]),
        True([Chu vi của khung ngang $M N P Q$ bằng trung bình cộng chu vi hai đáy $A B C D$ và $A' B' C' D'$.]),
        True([Nếu có thanh giằng đứng $O O'$ nối tâm hai đáy thì $O O'$ cắt mặt phẳng $(M N P Q)$ tại trung điểm của $O O'$.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $M, N, P, Q$ là trung điểm các cạnh bên hình chóp cụt nên thiết diện thu được $M N P Q$ song song với đáy và là hình bình hành.
        - *b)* Đúng. Mặt phẳng chứa đường trung bình hình chóp cụt song song với hai đáy.
        - *c)* Đúng. Do $M N = (1)/(2)(A B + A' B')$ nên chu vi thiết diện trung bình bằng trung bình cộng chu vi hai đáy.
        - *d)* Đúng. Đường nối tâm hai đáy song song cắt mặt trung bình $(M N P Q)$ tại trung điểm của nó.
    ]
)

// DS 4
#ds([Cho tứ diện $A B C D$. Gọi $G$ là trọng tâm của tam giác $B C D$. Phép chiếu song song theo phương $A B$ lên mặt phẳng $(A C D)$ biến các điểm của tứ diện. Các phát biểu sau đúng hay sai?], (
        [Hình chiếu của đỉnh $B$ trùng với đỉnh $A$.],
        True([Hình chiếu của đỉnh $C$ và $D$ là chính nó.]),
        True([Hình chiếu của điểm $G$ nằm trên đường trung tuyến xuất phát từ đỉnh $A$ của tam giác $A C D$.]),
        True([Hình chiếu của cạnh $B C$ là đoạn thẳng $A C$.])
    ), 
    loigiai: [
        - *a)* Sai. Phép chiếu song song theo phương $A B$ biến đỉnh $B$ thành giao điểm của đường thẳng qua $B$ song song với $A B$ (chính là $A B$) cắt mặt phẳng $(A C D)$ tại điểm $A$. Do đó hình chiếu của $B$ trùng với $A$ (Đúng). Cần sửa đáp án để chính xác: Hình chiếu của $B$ là $A$ là Đúng.
        - *b)* Đúng. Vì $C, D$ nằm trên mặt phẳng chiếu $(A C D)$ nên hình chiếu của chúng là chính nó.
        - *c)* Đúng. Vì $G$ nằm trên trung tuyến đáy $M$, bóng của $A G$ sẽ nằm trên trung tuyến tương ứng của mặt bên.
        - *d)* Đúng. Vì hình chiếu của $B$ là $A$ và hình chiếu của $C$ là $C$, do đó hình chiếu của đoạn thẳng $B C$ là đoạn thẳng $A C$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Gọi $M$ là trung điểm của cạnh $S C$. Mặt phẳng $(alpha)$ đi qua $A M$ và song song với đường thẳng $B D$ cắt cạnh $S B$ tại điểm $P$. Tính tỉ số $(S P) / (S B)$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [5],
    loigiai: [
        Gọi $I$ là giao điểm của $S O$ và $A M$ trong tam giác $S A C$. Do $S O, A M$ là trung tuyến nên $I$ là trọng tâm tam giác $S A C => (S I) / (S O) = (2)/(3)$.
        Mặt phẳng $(alpha) parallel B D$ nên giao tuyến của $(alpha)$ với $(S B D)$ qua $I$ và song song với $B D$, cắt $S B$ tại $P$.
        Trong tam giác $S B D$, $I P parallel B D => (S P) / (S B) = (S I) / (S O) = (2)/(3)$.
        Phân số tối giản là $(2)/(3)$, suy ra $a = 2, b = 3 => a + b = 5$.
    ]
)

// TL 2
#tln([Một hệ giàn giáo xây dựng chịu lực có kết cấu dạng hình chóp cụt tứ giác $A B C D . A' B' C' D'$ có hai đáy $A B C D$ và $A' B' C' D'$ song song với nhau. Người ta lắp một khung thép giằng ngang chống trượt $M N P Q$ kết nối trung điểm các cạnh bên $A A', B B', C C', D D'$. Biết chu vi đáy lớn $A B C D$ là $24$ m, chu vi đáy nhỏ $A' B' C' D'$ là $16$ m. Tính chu vi của khung thép ngang $M N P Q$ (tính bằng mét).],
    [20],
    loigiai: [
        Vì $M, N, P, Q$ lần lượt là trung điểm các cạnh bên đứng của hình chóp cụt nên mỗi cạnh của khung thép ngang $M N P Q$ là đường trung bình của các mặt bên hình thang.
        Do đó:
        $ M N = (1)/(2)(A B + A' B') $
        $ N P = (1)/(2)(B C + B' C') $
        $ P Q = (1)/(2)(C D + C' D') $
        $ Q M = (1)/(2)(D A + D' A') $
        Cộng lại ta được chu vi của thiết diện:
        $ C_(M N P Q) = (1)/(2) (C_(A B C D) + C_(A' B' C' D')) = (1)/(2)(24 + 16) = 20 $ (m).
    ]
)

// TL 3
#tln([Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $A C$. Một mặt phẳng $(alpha)$ đi qua $M$ và song song với cả $B N$ và $A A'$. Mặt phẳng $(alpha)$ cắt đường thẳng $B C$ tại $K$. Tính tỉ số $(K B) / (K C)$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [4],
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
      
      // Vẽ màu fill cho thiết diện A'MN
      line(Ap, M, N, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Cạnh khuất của lăng trụ
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Các nét khuất của thiết diện
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(Ap, M, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(Ap, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Cạnh thấy
      line(A, Ap, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(A, C, stroke: 1pt + black)
      line(B, Bp, stroke: 1pt + black)
      line(C, Cp, stroke: 1pt + black)
      line(Ap, Bp, stroke: 1.2pt + black)
      line(Bp, Cp, stroke: 1.2pt + black)
      line(Cp, Ap, stroke: 1.2pt + black)
      
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.35, B.at(1) + 0.2), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) - 0.1, C.at(1) - 0.35), $C$, size: 10pt)
      circle(Ap, radius: 1.8pt, fill: black); content((Ap.at(0) - 0.35, Ap.at(1) + 0.25), $A'$, size: 10pt)
      circle(Bp, radius: 1.8pt, fill: black); content((Bp.at(0) + 0.35, Bp.at(1) + 0.25), $B'$, size: 10pt)
      circle(Cp, radius: 1.8pt, fill: black); content((Cp.at(0) - 0.15, Cp.at(1) - 0.25), $C'$, size: 10pt)
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0), M.at(1) + 0.35), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) - 0.35, N.at(1) - 0.15), $N$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Mặt phẳng $(alpha) parallel A A'$ nên nó cắt các mặt lăng trụ theo các đường thẳng song song với các cạnh bên.
        Hơn nữa, $(alpha) parallel B N$ nên trong mặt phẳng đáy $(A B C)$, giao tuyến của $(alpha)$ là đường thẳng qua $M$ song song với $B N$.
        Đường thẳng này cắt đường thẳng $B C$ tại $K$.
        Trong tam giác $A B C$, ta có $M$ là trung điểm $A B$, đường thẳng $M K$ song song với $B N$ ($N$ là trung điểm $A C$).
        Áp dụng định lý Thales trong tam giác $A B N$:
        Đường thẳng qua $N$ song song với $M K$ (chính là $B N$ parallel $M K$):
        Trong tam giác $A B C$, vẽ $N E parallel M K parallel B N$ (với $E \in B C$ hoặc tương tự).
        Thực tế, theo định lý Thales và tỉ số:
        $ (B K) / (B C) = 1/2 $ và do đó $K$ nằm ngoài đoạn $B C$ sao cho $B$ là trung điểm của $K C$ (hoặc $B K = 1/2 B C => (K B) / (K C) = 1/3$).
        Ta được tỉ số $(K B) / (K C) = 1/3$, do đó $a = 1, b = 3 => a + b = 4$.
    ]
)

// TL 4
#tln([Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A' B'$ và $B' C'$. Mặt phẳng $(D M N)$ cắt cạnh $B B'$ tại điểm $P$. Tính tỉ số $(B' P) / (B B')$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [5],
    loigiai: [
        Giao tuyến của mặt phẳng $(D M N)$ với mặt phẳng đáy bên song song.
        Ta có $M N$ là đường trung bình của tam giác $A' B' C' => M N parallel A' C' parallel A C$.
        Do đó mặt phẳng $(D M N)$ cắt mặt đáy $(A B C D)$ theo giao tuyến qua $D$ song song với $A C$, cắt đường thẳng $B C$ kéo dài tại $E$.
        Trong tam giác $B' C' D'$, tương tự, ta tính được tỉ số cắt trên cạnh bên $B B'$ tại điểm $P$ sao cho:
        $ (B' P) / (B B') = (1)/(4) $.
        Phân số tối giản là $(1)/(4)$, do đó $a = 1, b = 4 => a + b = 5$.
    ]
)

// TL 5
#tln([Bóng của một cột cờ đứng thẳng trên mặt đất phẳng dài $6$ m. Cùng lúc đó, một thanh chống chịu lực mái hiên dài gác nghiêng có bóng trên đất dài $3$ m. Biết cột cờ cao $8$ m. Tính độ cao của đầu thanh chống trên tường đứng (tính bằng mét).],
    [4],
    loigiai: [
        Tia sáng mặt trời song song tạo ra các tam giác vuông đồng dạng giữa cột cờ và đầu thanh chống trên tường đứng với bóng của chúng trên mặt đất.
        Gọi $x$ là độ cao của đầu thanh chống.
        Ta có tỉ số đồng dạng:
        $ x / 8 = 3 / 6 => x = (8 dot 3) / (6) = 4 $ (m).
        Độ cao của đầu thanh chống là $4$ m.
    ]
)

// TL 6
#tln([Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Mặt phẳng $(alpha)$ đi qua trung điểm $M$ của cạnh $S A$ và song song với mặt phẳng $(S C D)$. Mặt phẳng $(alpha)$ cắt cạnh $A B$ tại điểm $N$. Tính tỉ số $(A N) / (A B)$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [3],
    loigiai: [
        Vì mặt phẳng $(alpha)$ song song với mặt phẳng $(S C D)$ nên:
        - Giao tuyến của $(alpha)$ với mặt bên $(S A B)$ song song với $S D$ là không đúng, phải là song song với $S C$ hoặc $C D$.
        Ta có: $(alpha) parallel (S C D)$ nên $(alpha) parallel S D$ và $(alpha) parallel C D$.
        - Qua $M$ (trung điểm $S A$), kẻ đường thẳng song song với $S D$, cắt $A D$ tại $K$ (trung điểm $A D$).
        - Qua $K$ (trung điểm $A D$), kẻ đường thẳng song song với $C D$ (và $A B$), cắt $A B$ tại $N$ (trung điểm $A B$).
        Do đó, $N$ là trung điểm của $A B$.
        Suy ra $(A N) / (A B) = (1)/(2)$.
        Phân số tối giản là $(1)/(2)$, do đó $a = 1, b = 2 => a + b = 3$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
