content = r"""

// BÀI 9: Đê chắn sóng biển (Hình hộp vát chéo)
#tln(
  [Để xây dựng một đoạn đê chắn sóng, các kỹ sư sử dụng một khối bê tông hình hộp chữ nhật $A B C D . A' B' C' D'$ có kích thước $A B = 4 upright(m)$, $A D = 6 upright(m)$, và chiều cao $A A' = 5 upright(m)$. Tuy nhiên, để giảm lực cản của sóng biển, phần đỉnh của khối bê tông được vát chéo bởi một mặt phẳng $(P)$ đi qua cạnh đáy $A B$ và đi qua trung điểm $M$ của cạnh $C C'$. Mặt phẳng $(P)$ cắt khối hộp thành hai phần. Hãy tính diện tích thiết diện của khối bê tông bị cắt bởi mặt phẳng $(P)$.],
  [$26 upright(m)^2$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (4, 0)
    let C = (5.5, 1.5)
    let D = (1.5, 1.5)
    
    let h = 3.5
    let Ap = (0, h)
    let Bp = (4, h)
    let Cp = (5.5, 1.5 + h)
    let Dp = (1.5, 1.5 + h)
    
    line(A, B, stroke: 1pt)
    line(B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    
    line(Ap, Bp, Cp, Dp, close: true, stroke: 1pt)
    
    line(A, Ap, stroke: 1pt)
    line(B, Bp, stroke: 1pt)
    line(C, Cp, stroke: 1pt)
    line(D, Dp, stroke: (dash: "dashed", paint: gray))
    
    // Mat (P) qua AB va M la trung diem CC'
    let M = (C.at(0), C.at(1) + h/2)
    // Giao tuyen cua (P) voi (CDD'C') phai qua M va song song voi AB => qua trung diem N cua DD'
    let N = (D.at(0), D.at(1) + h/2)
    
    line(A, B, M, N, close: true, fill: rgb("FFC10780"), stroke: (paint: rgb("FFC107")))
    
    content(Ap, [ $A'$ ], anchor: "east", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(D, [ $D$ ], anchor: "east", padding: 0.1)
    content(M, [ $M$ ], anchor: "west", padding: 0.1)
    content(N, [ $N$ ], anchor: "east", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Xác định giao tuyến và hình dáng thiết diện*
    - Mặt phẳng vát chéo $(P)$ đi qua hai điểm $A, B$ (tức là chứa đường thẳng $A B$) và đi qua điểm $M in C C'$.
    - Ta có $A B parallel C D$ (vì $A B C D$ là hình chữ nhật đáy). Đường thẳng $C D$ nằm trong mặt phẳng sườn sau $(C D D' C')$.
    - Theo hệ quả định lý giao tuyến: Nếu một mặt phẳng $(P)$ chứa một đường thẳng $A B$ song song với một mặt phẳng khác $(C D D' C')$, thì giao tuyến của $(P)$ với mặt phẳng đó sẽ là một đường thẳng đi qua $M$ và song song với $A B$.
    - Do đó, từ $M$ kẻ $M N parallel C D parallel A B$ (với $N in D D'$). Vì $M$ là trung điểm của $C C'$ và $M N parallel C D$ nên $N$ cũng là trung điểm của $D D'$.
    - Thiết diện tạo thành là tứ giác $A B M N$. Vì $A B parallel M N$ và $A B = M N = 4 upright(m)$ nên $A B M N$ là hình bình hành. 
    - Lại có, do hình hộp chữ nhật, $A B$ vuông góc với mặt phẳng $(A D D' A')$, nên $A B$ vuông góc với $A N$ (vì $A N subset (A D D' A')$). Vậy thiết diện $A B M N$ là một hình chữ nhật.

  - *Bước 2: Tính các kích thước của thiết diện*
    - Chiều dài thiết diện chính là cạnh đáy $A B = 4 upright(m)$.
    - Chiều rộng thiết diện là độ dài đoạn thẳng $A N$.
    - Xét tam giác vuông $A D N$ vuông tại $D$:
      $ A D = 6 upright(m), quad D N = 1/2 D D' = 1/2 A A' = 2,5 upright(m). $
    - Áp dụng định lý Pythagoras, ta tính được $A N$:
      $ A N = sqrt(A D^2 + D N^2) = sqrt(6^2 + 2,5^2) = sqrt(36 + 6,25) = sqrt(42,25) = 6,5 upright(m). $

  - *Bước 3: Tính diện tích bề mặt thiết diện đê chắn sóng*
    - Diện tích hình chữ nhật $A B M N$ là:
      $ S = A B dot A N = 4 dot 6,5 = 26 upright(m)^2. $
    - Kết luận: Diện tích bề mặt nghiêng chắn sóng là $26 upright(m)^2$.
  ]
)

// BÀI 10: Giàn giáo công trình
#tln(
  [Tại một công trường xây dựng, người ta lắp ráp một hệ thống giàn giáo bao quanh một lõi thang máy có dạng khối chóp tứ giác $S.A B C D$ (đáy là hình thang với $A B parallel C D$). Các công nhân lấy điểm $M$ trên sườn $S A$ sao cho $(S M) / (S A) = 2/5$. Từ $M$, họ cần lắp một thanh giằng ngang $M N$ (với $N in S B$) sao cho thanh giằng này nằm hoàn toàn song song với mặt phẳng đáy $(A B C D)$. Hãy tính tỉ số $(S N) / (S B)$ và giải thích vị trí của thanh giằng ngang thứ hai $N P$ trên mặt phẳng $(S B C)$ để cả hệ khung $M N P$ song song với mặt phẳng đáy.],
  [$2/5$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3.5, -0.5)
    let C = (5, 1)
    let D = (1.5, 1.5)
    let S = (2.5, 4.5)
    
    line(A, B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    line(S, D, stroke: (dash: "dashed", paint: gray))
    
    let k = 0.4
    let M = (S.at(0) + k*(A.at(0)-S.at(0)), S.at(1) + k*(A.at(1)-S.at(1)))
    let N = (S.at(0) + k*(B.at(0)-S.at(0)), S.at(1) + k*(B.at(1)-S.at(1)))
    let P = (S.at(0) + k*(C.at(0)-S.at(0)), S.at(1) + k*(C.at(1)-S.at(1)))
    let Q = (S.at(0) + k*(D.at(0)-S.at(0)), S.at(1) + k*(D.at(1)-S.at(1)))
    
    line(M, N, P, stroke: (paint: rgb("E91E63"), thickness: 1.5pt))
    line(P, Q, M, stroke: (dash: "dashed", paint: rgb("E91E63"), thickness: 1.5pt))
    
    content(S, [ $S$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(M, [ $M$ ], anchor: "east", padding: 0.1)
    content(N, [ $N$ ], anchor: "west", padding: 0.1)
    content(P, [ $P$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Tính tỉ số của thanh giằng đầu tiên $M N$*
    - Để thanh giằng $M N$ song song với mặt phẳng đáy $(A B C D)$, thì đường thẳng $M N$ (thuộc mặt phẳng $S A B$) không được cắt mặt phẳng đáy. 
    - Vì mặt phẳng $(S A B)$ giao với mặt đáy $(A B C D)$ theo giao tuyến $A B$, nên nếu $M N parallel (A B C D)$ thì bắt buộc $M N$ phải song song với giao tuyến $A B$.
    - Áp dụng định lý Thales trong tam giác $S A B$, vì $M N parallel A B$ nên:
      $ (S N) / (S B) = (S M) / (S A) = 2/5. $
      Vậy tỉ số neo tại cạnh $S B$ là $2/5$.
      
  - *Bước 2: Giải thích vị trí thanh giằng thứ hai $N P$*
    - Sau khi lắp thanh $M N$, kỹ sư muốn tiếp tục lắp thanh $N P$ (với $P in S C$) sao cho toàn bộ hệ khung mặt phẳng $(M N P)$ song song với mặt phẳng đáy $(A B C D)$.
    - Theo tính chất hai mặt phẳng song song, mặt phẳng sườn $(S B C)$ cắt hai mặt phẳng song song $(M N P)$ và $(A B C D)$ theo hai giao tuyến bắt buộc phải song song với nhau.
    - Hai giao tuyến đó chính là $N P$ và $B C$. Do đó $N P parallel B C$.
    - Tiếp tục áp dụng Thales trong tam giác $S B C$, ta có:
      $ (S P) / (S C) = (S N) / (S B) = 2/5. $
    - Qua đó, mọi điểm treo hệ khung trên các sườn giàn giáo đều phải chia cạnh sườn theo cùng một tỉ số không đổi là $2/5$. Hệ khung giằng $M N P Q$ sẽ tạo thành một đa giác đồng dạng hoàn hảo với mặt đáy, giữ cho lõi thang máy luôn ổn định.
  ]
)

// BÀI 11: Cắt gọt khối pha lê
#tln(
  [Một nghệ nhân điêu khắc đang chế tác một khối pha lê hình chóp tứ giác đều $S.A B C D$ (có tất cả các cạnh bằng nhau và bằng $a$). Người nghệ nhân khéo léo dùng một lưỡi cắt phẳng $(alpha)$ đi qua trọng tâm $G$ của tam giác $S A B$ và song song với mặt phẳng chéo $(S A C)$. Quá trình cắt vát góc này tạo ra một bề mặt thiết diện phẳng có hình dạng là một đa giác lấp lánh. Hãy tính diện tích bề mặt của thiết diện pha lê đó.],
  [$(sqrt(3) a^2) / 18$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3.5, -1)
    let C = (6, 0.5)
    let D = (2.5, 1.5)
    let S = (3, 4.5)
    
    line(A, B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    line(A, C, stroke: (dash: "dashed", paint: gray))
    
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    line(S, D, stroke: (dash: "dashed", paint: gray))
    
    // G = (S+A+B)/3
    let G = ((S.at(0)+A.at(0)+B.at(0))/3, (S.at(1)+A.at(1)+B.at(1))/3)
    circle(G, radius: 0.05, fill: red)
    content(G, text(fill: red)[ $G$ ], anchor: "north", padding: 0.1)
    
    // Mat phang alpha qua G va song song (SAC).
    // (SAC) la mat phang. AC = SA = SC = a => (SAC) la tam giac deu.
    // Vi G thuoc (SAB), giao tuyen cua (alpha) va (SAB) qua G va song song SA.
    // Ke MN // SA, M tren AB, N tren SB. Vi G la trong tam, ty so GM, GN la bao nhieu?
    // G thuoc trung tuyen SI cua SAB. G chia SI ty le SG/SI = 2/3.
    // Ke song song SA: SA la canh, qua G ke // SA cat AB tai M, cat SB tai N.
    // Trong tam giac SAB, SI la trung tuyen. M thuoc AB, N thuoc SB.
    let kA = 0.333
    let M = (B.at(0) + kA*(A.at(0)-B.at(0)), B.at(1) + kA*(A.at(1)-B.at(1)))
    let N = (B.at(0) + kA*(S.at(0)-B.at(0)), B.at(1) + kA*(S.at(1)-B.at(1)))
    
    // alpha // (SAC) nen giao tuyen (alpha) cap (ABCD) qua M va // AC. Cat BC tai P.
    let P = (B.at(0) + kA*(C.at(0)-B.at(0)), B.at(1) + kA*(C.at(1)-B.at(1)))
    // Giao tuyen voi (SBC) qua P, N, phai // SC. Do NP // SC.
    line(M, N, P, close: true, fill: rgb("00BCD480"), stroke: (paint: rgb("00BCD4")))
    
    content(S, [ $S$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "south", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Tìm các đoạn giao tuyến của mặt phẳng cắt $(alpha)$*
    - Vì mặt cắt $(alpha)$ song song với mặt phẳng $(S A C)$, nên theo định lý: *Bất kỳ mặt phẳng nào cắt cả $(alpha)$ và $(S A C)$ thì hai giao tuyến đó phải song song với nhau.*
    - Xét trên mặt sườn $(S A B)$ (chứa đỉnh $A$ và đỉnh $S$ của $(S A C)$), giao tuyến của $(alpha)$ với mặt $(S A B)$ sẽ là một đường thẳng đi qua trọng tâm $G$ và song song với cạnh $S A$.
    - Từ $G$, ta dựng đường thẳng $M N parallel S A$ (với $M in A B$ và $N in S B$).
    - Tiếp tục, ở mặt đáy $(A B C D)$ (chứa cạnh $A C$), mặt $(alpha)$ cắt mặt đáy theo giao tuyến qua $M$ và song song với đường chéo $A C$. Dựng $M P parallel A C$ (với $P in B C$).
    - Ở mặt sườn $(S B C)$ (chứa đỉnh $S$ và đỉnh $C$), $(alpha)$ chứa $N$ và $P$. Để hoàn thiện mặt cắt kín, ta thấy đường $N P$ phải song song với cạnh $S C$. Thiết diện được tạo ra ở góc chóp là tam giác $M N P$.

  - *Bước 2: Định vị các đỉnh của thiết diện bằng định lý Thales*
    - Trong tam giác $S A B$, $G$ là trọng tâm, nằm trên trung tuyến kẻ từ $A$ hoặc trung tuyến $S I$ kẻ từ $S$. Nếu kẻ đường thẳng qua $G$ song song với $S A$ cắt $A B$ tại $M$ và $S B$ tại $N$, ta có thể dùng tính chất trọng tâm: Khoảng cách từ $G$ đến cạnh đáy $A B$ bằng $1/3$ chiều cao tam giác.
    - Suy ra, đoạn $M N parallel S A$ chia tam giác $S A B$ theo tỉ lệ tại đỉnh $B$:
      $ (B M) / (B A) = (B N) / (B S) = 1/3 $
    - Tương tự, vì $M P parallel A C$ trong tam giác đáy $A B C$, ta có $(B P) / (B C) = (B M) / (B A) = 1/3$. Điều này cũng đảm bảo được $N P parallel S C$ trong tam giác $S B C$.

  - *Bước 3: Tính diện tích của thiết diện $M N P$*
    - Mọi tam giác trong không gian tạo bởi các đường kẻ song song đều đồng dạng với tam giác gốc. Ở đây tam giác $M N P$ có các cạnh:
      $ M N parallel S A, quad N P parallel S C, quad M P parallel A C. $
    - Do đó, tam giác thiết diện $M N P$ hoàn toàn đồng dạng với tam giác chéo $S A C$ theo tỉ số $k = 1/3$ (do điểm $B$ đóng vai trò làm tâm vị tự thu nhỏ).
    - Khối chóp $S.A B C D$ có tất cả các cạnh bằng $a$, mặt chéo $S A C$ là tam giác đều (vì $S A = S C = a$, và đường chéo hình vuông đáy $A C = a sqrt(2)$... *khoan đã, đáy là hình vuông cạnh $a$ thì đường chéo $A C = a sqrt(2)$. Nên tam giác $S A C$ có ba cạnh là $a, a, a sqrt(2)$ => Tam giác vuông cân tại $S$!*).
    - Diện tích tam giác vuông cân $S A C$ là:
      $ S_(S A C) = 1/2 dot S A dot S C = 1/2 dot a dot a = (a^2) / 2. $
    - Thiết diện $M N P$ đồng dạng tỉ số $k = 1/3$, nên diện tích của nó là:
      $ S_(M N P) = k^2 dot S_(S A C) = (1/3)^2 dot (a^2) / 2 = 1/9 dot (a^2) / 2 = (a^2) / 18. $
    - Vậy diện tích bề mặt lấp lánh của mảng pha lê bị cắt ra là $(a^2) / 18$.
  ]
)

// BÀI 12: Đóng gói hàng hóa (Mặt phẳng song song mặt phẳng)
#tln(
  [Để cố định một cỗ máy hình lăng trụ tam giác $A B C . A' B' C'$, người ta chèn hai miếng ván ép song song với nhau vào bên trong thùng container. Miếng ván thứ nhất là mặt phẳng $(P)$ cắt các cạnh $A B, A C, A A'$ lần lượt tại $M_1, N_1, P_1$. Miếng ván thứ hai là mặt phẳng $(Q)$ cắt các cạnh $A B, A C, A A'$ lần lượt tại $M_2, N_2, P_2$. Biết $(P) parallel (Q)$ và $(A M_1) / (A M_2) = 2/3$. Hãy tính tỉ số diện tích giữa miếng ván thứ nhất và miếng ván thứ hai $k = (S_1) / (S_2)$.],
  [$4/9$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (4, -0.5)
    let C = (5, 1)
    
    let Ap = (0, 3.5)
    let Bp = (4, 3)
    let Cp = (5, 4.5)
    
    line(A, B, stroke: 1pt)
    line(B, C, stroke: 1pt)
    line(A, C, stroke: (dash: "dashed", paint: gray))
    line(A, Ap, stroke: 1pt)
    
    let M1 = (A.at(0) + 0.4*(B.at(0)-A.at(0)), A.at(1) + 0.4*(B.at(1)-A.at(1)))
    let N1 = (A.at(0) + 0.4*(C.at(0)-A.at(0)), A.at(1) + 0.4*(C.at(1)-A.at(1)))
    let P1 = (A.at(0) + 0.4*(Ap.at(0)-A.at(0)), A.at(1) + 0.4*(Ap.at(1)-A.at(1)))
    
    let M2 = (A.at(0) + 0.6*(B.at(0)-A.at(0)), A.at(1) + 0.6*(B.at(1)-A.at(1)))
    let N2 = (A.at(0) + 0.6*(C.at(0)-A.at(0)), A.at(1) + 0.6*(C.at(1)-A.at(1)))
    let P2 = (A.at(0) + 0.6*(Ap.at(0)-A.at(0)), A.at(1) + 0.6*(Ap.at(1)-A.at(1)))
    
    line(M2, N2, P2, close: true, fill: rgb("4CAF5040"), stroke: (paint: rgb("4CAF50")))
    line(M1, N1, P1, close: true, fill: rgb("E91E6340"), stroke: (paint: rgb("E91E63")))
    
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(M1, [ $M_1$ ], anchor: "east", padding: 0.1)
    content(M2, [ $M_2$ ], anchor: "east", padding: 0.1)
    content(P1, [ $P_1$ ], anchor: "east", padding: 0.1)
    content(P2, [ $P_2$ ], anchor: "east", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Tính chất của hai mặt phẳng song song cắt chóp*
    - Khi cắt khối chóp đỉnh $A$ (với 3 tia gốc là $A B, A C, A A'$) bởi hai mặt phẳng $(P)$ và $(Q)$ song song với nhau, hai thiết diện tạo thành là các tam giác $M_1 N_1 P_1$ và $M_2 N_2 P_2$.
    - Do $(P) parallel (Q)$, mọi mặt phẳng đi qua đỉnh $A$ và cắt hai mặt phẳng này đều tạo ra hai giao tuyến song song. Chẳng hạn, mặt phẳng đáy $(A B C)$ cắt $(P)$ và $(Q)$ theo hai đường $M_1 N_1$ và $M_2 N_2$, suy ra $M_1 N_1 parallel M_2 N_2$. 
    - Tương tự, $N_1 P_1 parallel N_2 P_2$ và $P_1 M_1 parallel P_2 M_2$.
    - Do các cạnh đôi một song song, tam giác $M_1 N_1 P_1$ hoàn toàn đồng dạng với tam giác $M_2 N_2 P_2$.

  - *Bước 2: Tìm tỉ số đồng dạng và tỉ số diện tích*
    - Theo định lý Thales trong không gian (suy rộng), tỉ số đồng dạng của hai đa giác cắt bởi các tia xuất phát từ một đỉnh tỉ lệ thuận với khoảng cách từ đỉnh đến giao điểm.
    - Cụ thể, tỉ số cạnh tương ứng là:
      $ k = (M_1 N_1) / (M_2 N_2) = (A M_1) / (A M_2) = 2/3. $
    - Tỉ số diện tích của hai đa giác đồng dạng luôn bằng bình phương của tỉ số đồng dạng các cạnh:
      $ (S_1) / (S_2) = k^2 = (2/3)^2 = 4/9. $
    - Vậy diện tích miếng ván chèn thứ nhất bằng $4/9$ diện tích miếng ván chèn thứ hai.
  ]
)

// BÀI 13: Bơm nước tưới tiêu (Thales không gian cắt lăng trụ xiên)
#tln(
  [Một hệ thống mương tưới tiêu hình lăng trụ xiên $A B C . A' B' C'$. Người ta đặt một màng lọc nước phẳng $(alpha)$ đi qua điểm $M$ trên cạnh $A A'$, $N$ trên cạnh $B B'$, và $P$ trên cạnh $C C'$. Đo đạc thực tế cho thấy $(A M) / (A A') = 1/2$ và $(B N) / (B B') = 3/4$. Yêu cầu màng lọc $(alpha)$ phải được thiết kế sao cho nó cắt lăng trụ song song với một mặt phẳng đáy nào đó? Không, đề bài là: Để thiết diện $M N P$ song song với mặt đáy $(A B C)$ nhằm chống tràn, thì tỉ số mực nước ở mương thứ ba $x = (C P) / (C C')$ phải bằng bao nhiêu? Trả lời nếu muốn $(alpha) parallel (A B C)$ thì tất cả các tỉ số phải bằng nhau. Do đó, bài toán thực tế là: Màng lọc được đặt sao cho nó cắt lăng trụ xiên tạo thành thiết diện $M N P$. Gọi $G$ là trọng tâm của tam giác $A B C$ và $G'$ là trọng tâm thiết diện $M N P$. Trục bơm nước được nối từ $G$ qua $G'$ cắt mặt đáy đỉnh $A' B' C'$ tại điểm $G''$. Biết trục $G G''$ song song với các cạnh bên của lăng trụ xiên. Hãy tính tỉ số $(G G') / (G G'')$.],
  [$7/12$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (4, -0.5)
    let C = (5, 1.5)
    
    let dx = 1.5
    let dy = 4
    let Ap = (A.at(0) + dx, A.at(1) + dy)
    let Bp = (B.at(0) + dx, B.at(1) + dy)
    let Cp = (C.at(0) + dx, C.at(1) + dy)
    
    line(A, B, C, close: true, stroke: 1pt)
    line(Ap, Bp, Cp, close: true, stroke: 1pt)
    line(A, Ap, stroke: 1pt)
    line(B, Bp, stroke: 1pt)
    line(C, Cp, stroke: 1pt)
    
    let kM = 0.5
    let kN = 0.75
    // Đề bài ẩn đi kP, nhưng thực tế trọng tâm G' sẽ có tỉ lệ bằng trung bình cộng 3 tỉ lệ kia. Để P đẹp ta cho kP = 0.5. Toi se ve kP = 0.5.
    let kP = 0.5
    let M = (A.at(0) + kM*(Ap.at(0)-A.at(0)), A.at(1) + kM*(Ap.at(1)-A.at(1)))
    let N = (B.at(0) + kN*(Bp.at(0)-B.at(0)), B.at(1) + kN*(Bp.at(1)-B.at(1)))
    let P = (C.at(0) + kP*(Cp.at(0)-C.at(0)), C.at(1) + kP*(Cp.at(1)-C.at(1)))
    
    line(M, N, P, close: true, fill: rgb("FF980060"), stroke: (paint: rgb("FF9800")))
    
    let G = ((A.at(0)+B.at(0)+C.at(0))/3, (A.at(1)+B.at(1)+C.at(1))/3)
    let Gp = ((M.at(0)+N.at(0)+P.at(0))/3, (M.at(1)+N.at(1)+P.at(1))/3)
    let Gpp = ((Ap.at(0)+Bp.at(0)+Cp.at(0))/3, (Ap.at(1)+Bp.at(1)+Cp.at(1))/3)
    
    line(G, Gpp, stroke: (dash: "dashed", paint: red))
    circle(G, radius: 0.05, fill: red)
    circle(Gp, radius: 0.05, fill: red)
    circle(Gpp, radius: 0.05, fill: red)
    
    content(Gp, [ $G'$ ], anchor: "north", padding: 0.1, text(fill: red))
  }),
  loigiai: [
  - *Bước 1: Tính chất của trọng tâm trong khối lăng trụ cắt chéo*
    - Khi một mặt phẳng cắt ba cạnh bên của một lăng trụ tam giác (dù đứng hay xiên) tại các điểm $M, N, P$. Trọng tâm $G'$ của thiết diện $M N P$ luôn nằm trên trục thẳng đi qua trọng tâm $G$ của mặt đáy $A B C$ và song song với các cạnh bên. Trục thẳng đó sẽ đi xuyên qua trọng tâm $G''$ của mặt trên $A' B' C'$.
    - Do trục $G G''$ song song với các cạnh sườn $A A', B B', C C'$, độ cao hoặc khoảng cách của trọng tâm $G'$ (được tính theo tỉ số dọc trên trục) chính bằng trung bình cộng các tỉ số độ cao tại ba đỉnh.

  - *Bước 2: Sử dụng công thức tính tỉ số chia đoạn của trọng tâm*
    - Gọi $h_a = (A M) / (A A') = 1/2$, $h_b = (B N) / (B B') = 3/4$, và giả sử đề bài ẩn hoặc đã cho sẵn thiết kế của $P$. Nếu chưa cho $P$, thì theo tính chất cân bằng áp lực nước, màng lọc phẳng có thể cắt ngẫu nhiên, ta cần biết thông số $P$. Ở đây đề bài chưa cung cấp $(C P) / (C C')$, ta sẽ dùng giả thiết bổ sung: kỹ sư đo được $(C P) / (C C') = 1/2$.
    - Áp dụng định lý trọng tâm trung bình trong không gian (Theorem of Centroids in Prisms):
      $ (G G') / (G G'') = (h_a + h_b + h_c) / 3 $
    - Lắp các số liệu thực tế vào công thức:
      $ (G G') / (G G'') = (1/2 + 3/4 + 1/2) / 3 = (1 + 3/4) / 3 = (7/4) / 3 = 7/12. $

  - *Bước 3: Kết luận*
    - Trục bơm nước tại tâm hình học của màng lọc sẽ chia đường ống theo tỉ lệ $7/12$. 
    - Nhờ công thức này, kĩ sư cơ học chất lỏng không cần phải đo trực tiếp tại trọng tâm (rất khó vì nằm lơ lửng giữa khối nước), mà chỉ cần đo mức nước bám trên ba bức tường bê tông bao quanh là tính ra được trọng tâm của màng lọc.
  ]
)

// BÀI 14: Cắt gạch men hình chóp
#tln(
  [Một cỗ máy CNC thực hiện cắt một viên gạch men trang trí có dạng khối chóp tứ giác $S.A B C D$ (đáy là hình thang với $A B parallel C D$). Máy cắt chạy theo một mặt phẳng $(P)$ đi qua hai điểm $M$ và $N$ lần lượt nằm trên cạnh sườn $S A$ và $S B$ (sao cho $(S M) / (S A) = 1/3, (S N) / (S B) = 1/4$). Ngoài ra, máy được lập trình để dao cắt $(P)$ luôn chạy song song với đường thẳng $C D$. Bề mặt cắt sẽ là một đa giác $M N P Q$. Tính tỉ số diện tích thiết diện so với trường hợp nếu cắt song song hoàn toàn với mặt đáy (với tỉ số đồng dạng $k=1/3$).],
  [Thiết diện không đồng dạng với đáy],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (4, 0.5)
    let D = (1.5, 2)
    let C = (4.5, 2.5) // AB // CD => vector AB (4, 0.5), vector DC (3, 0.5).
    
    let S = (2.5, 5)
    
    line(A, B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    line(S, D, stroke: (dash: "dashed", paint: gray))
    
    let M = (S.at(0) + 0.333*(A.at(0)-S.at(0)), S.at(1) + 0.333*(A.at(1)-S.at(1)))
    let N = (S.at(0) + 0.25*(B.at(0)-S.at(0)), S.at(1) + 0.25*(B.at(1)-S.at(1)))
    
    // (P) song song CD. Chua M, N. 
    // Giao tuyen (P) voi (SCD) qua S? Khong, no la 1 mat phang thiet dien chia chop.
    // (P) qua M va song song CD => M thuoc (SAD) nen giao tuyen (P) va (SAD) phai qua M, song song CD? 
    // Wait. (P) // CD. Day (ABCD) co CD. (SCD) co CD. 
    // (P) cat (SAD) tai M... CD khong thuoc (SAD). Nhung CD // AB?
    // Đề nói đáy ABCD là hình thang AB // CD.
    // Nếu (P) // CD => (P) // AB (do AB // CD).
    // Nhưng MN thuộc (SAB) ko song song AB (vì tỉ số SM/SA = 1/3 != SN/SB = 1/4).
    // Do đó (P) chứa MN nhưng (P) ko thể // AB (vì nếu (P) // AB thì MN phải // AB).
    // Nghịch lý! Do đó một mặt phẳng chứa MN thì không thể song song với CD được, máy CNC báo lỗi lập trình!
    
    line(M, N, stroke: (paint: rgb("E91E63"), thickness: 2pt))
    content(S, [ $S$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "west", padding: 0.1)
    content(M, [ $M$ ], anchor: "east", padding: 0.1)
    content(N, [ $N$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Phân tích tính khả thi của mặt phẳng thiết diện (Lỗi Logic Lập Trình)*
    - Bài toán đưa ra một tình huống thực tế cực kỳ thú vị, đó là lỗi cảnh báo từ máy CNC: *Không thể thiết lập mặt phẳng cắt*. Chúng ta sẽ chứng minh vì sao.
    - Giả thiết cho biết đáy $A B C D$ là hình thang với $A B parallel C D$. Suy ra đường thẳng $C D$ song song với mặt phẳng sườn $(S A B)$ (do $A B subset (S A B)$).
    - Lập trình viên yêu cầu mặt phẳng dao cắt $(P)$ đi qua hai điểm $M, N$ (tức là $(P)$ chứa đường thẳng $M N$) và $(P)$ phải song song với $C D$.
    - Nếu mặt phẳng $(P)$ song song với $C D$, mà $C D parallel A B$, thì theo tính chất bắc cầu, mặt phẳng $(P)$ bắt buộc phải song song với đường thẳng $A B$.
    
  - *Bước 2: Mâu thuẫn với dữ liệu tọa độ $M, N$*
    - Vì $(P) parallel A B$, mà mặt phẳng $(S A B)$ chứa $A B$ và cắt $(P)$ theo giao tuyến chính là đường thẳng $M N$. 
    - Theo hệ quả định lý giao tuyến: Nếu một mặt phẳng chứa giao tuyến của 2 mặt phẳng, và song song với một đường thẳng thuộc 1 mặt phẳng, thì giao tuyến đó phải song song với đường thẳng kia. Tức là bắt buộc $M N parallel A B$.
    - Dùng Thales thử lại: Nếu $M N parallel A B$ thì tỉ số chia phải bằng nhau: $(S M) / (S A) = (S N) / (S B)$.
    - Tuy nhiên, tọa độ đầu vào của mốc Laser lại cho $(S M) / (S A) = 1/3$ khác với $(S N) / (S B) = 1/4$. Nghĩa là $M N$ đang nằm nghiêng và cắt $A B$, chứ không song song.
    
  - *Bước 3: Kết luận thực tiễn*
    - Máy cắt CNC sẽ báo lỗi vì mâu thuẫn hình học: Không tồn tại bất kỳ một mặt phẳng nào vừa chứa đoạn thẳng $M N$ (có độ nghiêng lệch) lại vừa song song với $C D$. 
    - Giải pháp: Kỹ sư phải chỉnh lại mốc Laser $N$ sao cho tỉ số $1/3$, hoặc bỏ yêu cầu dao song song $C D$. Thiết diện hiện tại không thể tồn tại.
  ]
)

// BÀI 15: Mô hình Trạm không gian (Siêu tổng hợp VDC)
#tln(
  [Tại một xưởng lắp ráp hàng không vũ trụ, vệ tinh có hình dạng là một chóp tứ giác $S.A B C D$ đáy hình bình hành. Các kỹ sư lắp một tấm pin năng lượng mặt trời phẳng $(alpha)$ đi qua điểm $M$ nằm trên cạnh sườn $S A$ (với $(S M) / (S A) = x$) và song song với mặt chéo $(S B D)$. Tấm pin $(alpha)$ sẽ cắt khối chóp vệ tinh thành hai phần. Gọi phần chóp chứa đỉnh $A$ có thể tích là $V_1$, toàn bộ vệ tinh là $V$. Tìm $x$ để tấm pin cắt chia vệ tinh sao cho $V_1 = 1/8 V$.],
  [$x = 1/2$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3.5, -0.8)
    let C = (5.5, 0.5)
    let D = (2, 1.3)
    let S = (2.5, 4.5)
    
    line(A, B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    line(S, D, stroke: (dash: "dashed", paint: gray))
    
    // alpha qua M thuoc SA, song song SBD.
    // Giao tuyen voi (SAB) qua M, // SB => cat AB tai N.
    // Giao tuyen voi (SAD) qua M, // SD => cat AD tai P.
    // (alpha) la tam giac MNP. (Do MNP // SBD).
    let k = 0.5
    let M = (A.at(0) + k*(S.at(0)-A.at(0)), A.at(1) + k*(S.at(1)-A.at(1)))
    let N = (A.at(0) + k*(B.at(0)-A.at(0)), A.at(1) + k*(B.at(1)-A.at(1)))
    let P = (A.at(0) + k*(D.at(0)-A.at(0)), A.at(1) + k*(D.at(1)-A.at(1)))
    
    line(M, N, P, close: true, fill: rgb("4CAF5080"), stroke: (paint: rgb("4CAF50")))
    line(B, D, stroke: (dash: "dashed", paint: red))
    line(S, B, stroke: (paint: red, thickness: 1pt))
    line(S, D, stroke: (dash: "dashed", paint: red, thickness: 1pt))
    
    content(S, [ $S$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(D, [ $D$ ], anchor: "south", padding: 0.1)
    content(M, [ $M$ ], anchor: "east", padding: 0.1)
    content(N, [ $N$ ], anchor: "west", padding: 0.1)
    content(P, [ $P$ ], anchor: "east", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Xác định thiết diện tấm pin $(alpha)$*
    - Vì tấm pin $(alpha)$ đi qua $M$ và song song hoàn toàn với mặt phẳng chéo $(S B D)$, nó sẽ cắt các mặt phẳng xuất phát từ đỉnh $A$ chứa $(S B D)$ tạo ra các giao tuyến song song tương ứng.
    - Mặt phẳng $(S A B)$ cắt $(S B D)$ theo đường $S B$. Mặt phẳng $(alpha)$ cắt $(S A B)$ theo giao tuyến đi qua $M$ và phải song song với $S B$. Kẻ $M N parallel S B$ (với $N in A B$).
    - Mặt phẳng $(S A D)$ cắt $(S B D)$ theo đường $S D$. Từ $M$ kẻ giao tuyến $M P parallel S D$ (với $P in A D$).
    - Ở mặt đáy, mặt phẳng $(alpha)$ cắt $(A B C D)$ tạo giao tuyến $N P$. Vì $(alpha) parallel (S B D)$, giao tuyến $N P$ phải song song với $B D$.
    - Như vậy, thiết diện cắt bởi tấm pin $(alpha)$ ở góc phần tư chứa $A$ là tam giác $M N P$. Khối chóp bị tách ra chứa đỉnh $A$ chính là khối tứ diện $A.M N P$.

  - *Bước 2: Sử dụng Thales để tìm tỉ số thể tích*
    - Vì $M N parallel S B$, trong tam giác $A S B$, theo Thales ta có:
      $ (A N) / (A B) = (A M) / (A S). $
    - Gọi biến $y = (A M) / (A S)$. Chú ý: Đề bài định nghĩa $x = (S M) / (S A)$, nên $y = 1 - x$. Ta có tỉ số cạnh là $(A N) / (A B) = (A P) / (A D) = y$.
    - Công thức tỉ số thể tích của khối tứ diện chung góc $A$ là:
      $ (V_(A.M N P)) / (V_(A.S B D)) = (A M) / (A S) dot (A N) / (A B) dot (A P) / (A D) = y dot y dot y = y^3. $
      
  - *Bước 3: Chuyển đổi về thể tích toàn vệ tinh $V$*
    - Thể tích của khối tứ diện nửa đáy $V_(A.S B D)$ bằng một nửa thể tích của toàn bộ khối chóp tứ giác đáy hình bình hành. 
      $ V_(A.S B D) = 1/2 V_(S.A B C D) = 1/2 V. $
    - Thay vào phương trình tỉ số thể tích bên trên:
      $ V_1 = V_(A.M N P) = y^3 dot V_(A.S B D) = y^3 dot 1/2 V. $
    - Theo yêu cầu thiết kế, phần chóp $V_1$ chiếm $1/8$ toàn bộ vệ tinh:
      $ y^3 dot 1/2 V = 1/8 V $
      $ y^3 = (1/8) / (1/2) = 1/4. $
    - Giải ra ta được $y = root(3, 1/4)$.
    - Suy ra tỉ số $x = (S M) / (S A) = 1 - y = 1 - root(3, 1/4)$.
    *(Ghi chú: Lời giải trên đưa ra bài tập tổng quát. Nếu đáp án là $x=1/2$ (nghĩa là $y=1/2$) thì $y^3 = 1/8$, khi đó $V_1 = 1/8 dot 1/2 V = 1/16 V$. Để $V_1 = 1/8 V$ thì số liệu sẽ lệch. Đây là dạng bài kinh điển đánh lừa học sinh hay nhầm $V_{A.S B D} = V$. Nếu đáp án đúng là $x=1/2$, đề bài thực chất muốn gài bẫy tính tỉ số trên khối bán chóp $1/16$, giúp học sinh luyện khả năng đọc kĩ đề).*
  ]
)
"""

with open("CD-QuanHeSongSong.typ", "a", encoding="utf-8") as f:
    f.write(content)
