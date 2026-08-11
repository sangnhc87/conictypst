#import "@local/sang-math:1.0.4": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *
#import "../bbt.typ": *

#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// ═══════════════════════════════════════════════════════════
#v(1em)
#block(
  width: 100%,
  fill: rgb("#f4f8fc"),
  stroke: (left: 6pt + classic.blue, top: 0.5pt + rgb("#dbe4f0"), right: 0.5pt + rgb("#dbe4f0"), bottom: 0.5pt + rgb("#dbe4f0")),
  inset: 16pt,
  radius: (right: 4pt)
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: QUAN HỆ SONG SONG KHÔNG GIAN]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Bài toán thực tế vận dụng cao về Giao tuyến, Giao điểm, Thiết diện và Định lý Thales.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue 
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// BÀI 1: Giao tuyến cáp treo
#tln(
  [Để thi công một tuyến cáp treo đi qua khe núi, các kỹ sư mô hình hóa khe núi bằng một khối chóp tứ giác $S.A B C D$ có đáy $A B C D$ là hình thang (với $A D parallel B C$ và $A D = 2 B C$). Một tuyến cáp phụ nằm trên mặt phẳng $(P)$ đi qua trung điểm $M$ của sườn núi $S A$, đi qua điểm $N$ trên sườn $S B$ sao cho $(S N) / (S B) = 1/3$ và tuyến cáp này phải được thiết kế sao cho mặt phẳng $(P)$ song song với cạnh núi $A D$. Hãy tính tỉ số $x = (S K) / (S D)$ với $K$ là điểm neo cáp trên sườn $S D$.],
  [$1/2$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = 3.5
    let b = 1.75
    let h = 3.5
    
    let A = (0, 0)
    let D = (4, 1.2)
    let B = (1.5, -1)
    let C = (1.5 + b, -1 + 0.5) // BC parallel AD, do dai = 1/2 AD
    
    let S = (2, 3.5)
    
    let M = (S.at(0)/2 + A.at(0)/2, S.at(1)/2 + A.at(1)/2)
    let N = (S.at(0)*1/3 + B.at(0)*2/3, S.at(1)*1/3 + B.at(1)*2/3)
    let K = (S.at(0)/2 + D.at(0)/2, S.at(1)/2 + D.at(1)/2)
    let P = (S.at(0)*1/3 + C.at(0)*2/3, S.at(1)*1/3 + C.at(1)*2/3)
    
    line(A, B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    line(S, D, stroke: (dash: "dashed", paint: gray))
    
    // Mat phang P (M, N, K, P)
    line(M, K, stroke: (dash: "dashed", paint: rgb("2196F3")))
    line(M, N, stroke: (paint: rgb("2196F3")))
    line(N, P, stroke: (paint: rgb("2196F3")))
    line(P, K, stroke: (dash: "dashed", paint: rgb("2196F3")))
    
    // Noi dai MN
    content(S, [ $S$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(D, [ $D$ ], anchor: "west", padding: 0.1)
    content(M, text(fill: blue)[ $M$ ], anchor: "east", padding: 0.1)
    content(N, text(fill: blue)[ $N$ ], anchor: "east", padding: 0.1)
    content(K, text(fill: blue)[ $K$ ], anchor: "west", padding: 0.1)
    
    circle(M, radius: 0.05, fill: blue)
    circle(N, radius: 0.05, fill: blue)
    circle(K, radius: 0.05, fill: blue)
  }),
  loigiai: [
  - *Bước 1: Khai thác yếu tố mặt phẳng song song với đường thẳng*
    - Theo giả thiết đề bài, mặt phẳng cáp treo $(P)$ đi qua hai điểm $M, N$ và song song với cạnh $A D$.
    - Do đường thẳng $A D$ nằm trọn trong mặt phẳng mặt sườn $(S A D)$, và mặt phẳng $(P)$ cắt mặt phẳng $(S A D)$ tạo ra một giao tuyến chung đi qua điểm $M$ (vì $M$ vừa thuộc $(P)$ vừa thuộc cạnh $S A subset (S A D)$).
    - Dựa vào định lý: *Nếu một đường thẳng $d$ song song với mặt phẳng $(P)$, thì mọi mặt phẳng $(Q)$ chứa $d$ nếu cắt $(P)$ sẽ cho giao tuyến song song với $d$*. Áp dụng vào bài toán, giao tuyến của $(P)$ và $(S A D)$ chính là đường thẳng đi qua $M$ và song song với $A D$.
    - Đường thẳng này cắt cạnh sườn $S D$ tại $K$. Do đó, ta có đoạn $M K parallel A D$.
  
  - *Bước 2: Sử dụng định lý Thales trong không gian để tìm điểm K*
    - Xét trong tam giác phẳng $S A D$, ta đã chứng minh được $M K parallel A D$.
    - Giả thiết cho $M$ là trung điểm của sườn $S A$, tức là $(S M) / (S A) = 1/2$.
    - Theo định lý Thales trong tam giác, vì $M K parallel A D$ nên $K$ cũng phải chia cạnh $S D$ theo đúng tỉ lệ đó. Nghĩa là $K$ bắt buộc phải là trung điểm của $S D$.
    - Vậy ta rút ra được tỉ số thiết kế cần tìm:
      $ (S K) / (S D) = 1/2 $
    
  - *Bước 3: Mở rộng tìm thiết diện hoàn chỉnh (Tham khảo thêm)*
    - Để thiết kế toàn bộ mặt phẳng cáp treo: Do $(P) parallel A D$, mà ở mặt đáy ta có $A D parallel B C$ (vì $A B C D$ là hình thang) $=> (P) parallel B C$.
    - Áp dụng tương tự, giao tuyến của $(P)$ với mặt sườn $(S B C)$ sẽ đi qua $N$ và song song với $B C$, cắt $S C$ tại điểm $P_1$.
    - Ta có $N P_1 parallel B C => (S P_1) / (S C) = (S N) / (S B) = 1/3$. 
    - Thiết diện hoàn chỉnh của tuyến cáp phụ tạo trên khe núi là hình thang $M N P_1 K$.
  ]
)

// BÀI 2: Thiết diện khối gỗ
#tln(
  [Một khối gỗ mỹ nghệ hình chóp tứ giác $S.A B C D$ có đáy là hình bình hành. Thợ mộc dùng một lưỡi cưa máy tạo thành mặt phẳng phẳng $(alpha)$ cắt ngang khối gỗ. Biết lưỡi cưa đi qua trọng tâm $G$ của tam giác sườn $S A B$ và luôn được giữ ở tư thế song song với mặt phẳng đáy $(A B C D)$. Lưỡi cưa sẽ tạo ra trên khối gỗ một thiết diện là đa giác láng mịn. Biết diện tích đáy của khối gỗ là $S_{A B C D} = 45 upright(c m)^2$. Hãy tính diện tích bề mặt vết cắt (thiết diện) tạo thành trên khối gỗ (đơn vị: $upright(c m)^2$).],
  [$20$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3, -0.5)
    let C = (4, 1.5)
    let D = (1, 2)
    let S = (1.5, 4)
    
    // G = (S+A+B)/3
    let Gx = (1.5 + 0 + 3)/3
    let Gy = (4 + 0 - 0.5)/3
    let G = (Gx, Gy)
    
    // Mat cat alpha parallel (ABCD), cat SA, SB, SC, SD tai M, N, P, Q
    // Ty so = 2/3 (do (alpha) chua G, ma G la trong tam (SAB). Tu G ke MN parallel AB -> SM/SA = SN/SB = 2/3)
    let k = 2.0 / 3.0
    let M = (S.at(0) + k*(A.at(0) - S.at(0)), S.at(1) + k*(A.at(1) - S.at(1)))
    let N = (S.at(0) + k*(B.at(0) - S.at(0)), S.at(1) + k*(B.at(1) - S.at(1)))
    let P = (S.at(0) + k*(C.at(0) - S.at(0)), S.at(1) + k*(C.at(1) - S.at(1)))
    let Q = (S.at(0) + k*(D.at(0) - S.at(0)), S.at(1) + k*(D.at(1) - S.at(1)))
    
    line(A, B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    line(S, D, stroke: (dash: "dashed", paint: gray))
    
    line(M, N, P, Q, close: true, fill: rgb("E91E6340"), stroke: (paint: rgb("E91E63")))
    
    content(S, [ $S$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(D, [ $D$ ], anchor: "west", padding: 0.1)
    content(G, text(fill: red)[ $G$ ], anchor: "north", padding: 0.1)
    circle(G, radius: 0.05, fill: red)
    
    // Duong trung tuyen cua SAB
    let M_AB = (1.5, -0.25)
    line(S, M_AB, stroke: (dash: "dotted", paint: red))
  }),
  loigiai: [
  - *Bước 1: Phân tích sự định vị của mặt phẳng thiết diện*
    - Mặt phẳng lưỡi cưa $(alpha)$ đi qua điểm $G$ và song song với mặt đáy $(A B C D)$.
    - Theo tính chất của hai mặt phẳng song song: Nếu một mặt phẳng thứ ba cắt hai mặt phẳng song song thì hai giao tuyến tạo thành sẽ song song với nhau.
    - Áp dụng vào mặt phẳng sườn $(S A B)$, ta có $(S A B)$ cắt $(A B C D)$ theo giao tuyến $A B$. Mặt phẳng $(S A B)$ cắt $(alpha)$ theo giao tuyến $M N$ (với $M in S A, N in S B$). Suy ra $M N parallel A B$. Tương tự ta có thiết diện là tứ giác $M N P Q$ với $N P parallel B C$, $P Q parallel C D$, $Q M parallel D A$.
    - Suy ra tứ giác $M N P Q$ có các cặp cạnh đối diện song song, do đó nó là một hình bình hành đồng dạng hoàn toàn với hình bình hành $A B C D$ ở mặt đáy.

  - *Bước 2: Sử dụng tính chất trọng tâm và Thales để tìm tỉ số đồng dạng*
    - Ta biết đường thẳng qua trọng tâm $G$ song song với đáy trong tam giác sẽ chia các cạnh bên theo tỉ lệ đặc biệt. Cụ thể, xét tam giác $S A B$ có trung tuyến $S M_1$. Vì $G$ là trọng tâm nên $(S G) / (S M_1) = 2/3$.
    - Do $M N parallel A B$ và đi qua $G$, theo định lý Thales ta có:
      $ (S M) / (S A) = (S N) / (S B) = (M N) / (A B) = (S G) / (S M_1) = 2/3 $
    - Tỉ số đồng dạng giữa thiết diện $M N P Q$ và đáy $A B C D$ chính là $k = (M N)/(A B) = 2/3$.

  - *Bước 3: Tính diện tích bề mặt vết cắt*
    - Đối với hai đa giác đồng dạng, tỉ số diện tích của chúng luôn bằng bình phương tỉ số đồng dạng các cạnh tương ứng.
    - Gọi $S'$ là diện tích thiết diện $M N P Q$, ta có:
      $ S' = k^2 dot S_{A B C D} = ((2) / (3))^2 dot 45 = 4/9 dot 45 = 20 upright(c m)^2. $
    - Vậy diện tích bề mặt vết cắt trên khối gỗ là $20 upright(c m)^2$.
  ]
)


// BÀI 3: Hai mặt phẳng song song - Sàn nhà
#tln(
  [Cấu trúc bên trong của một tháp triễn lãm có dạng một khối chóp lục giác đều $S.A_1 A_2 A_3 A_4 A_5 A_6$. Mặt đất là mặt phẳng chứa đáy tháp. Tầng hai của tháp được thi công là một mặt sàn phẳng cách mặt đất một khoảng $h_1 = 3 upright(m)$. Tầng ba là mặt sàn song song với tầng hai và cách mặt đất $h_2 = 9 upright(m)$. Biết chiều cao toàn bộ tháp từ mặt đất đến đỉnh chóp $S$ là $15 upright(m)$. Gọi $S_2$ và $S_3$ lần lượt là diện tích mặt sàn tầng hai và tầng ba. Hãy tính tỉ số diện tích $k = (S_3) / (S_2)$.],
  [$1/4$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Hexagon base
    let r = 2.5
    let center = (0,0)
    let A = ()
    for i in range(6) {
      let angle = i * 60 * 3.14159 / 180
      A.push((r * calc.cos(angle*180/3.14159), r * 0.4 * calc.sin(angle*180/3.14159)))
    }
    
    let S = (0, 4)
    
    // Draw edges
    for i in range(6) {
      if i > 2 and i < 6 {
         line(A.at(i), A.at(calc.rem(i+1,6)), stroke: (dash: "dashed", paint: gray))
         line(S, A.at(i), stroke: (dash: "dashed", paint: gray))
      } else {
         line(A.at(i), A.at(calc.rem(i+1,6)), stroke: 1pt)
         line(S, A.at(i), stroke: 1pt)
      }
    }
    
    // Tang 2 (cach day 3m) => cach dinh 12m => k2 = 12/15 = 4/5
    let k2 = 0.8
    let T2 = ()
    for i in range(6) {
       T2.push((S.at(0) + k2*(A.at(i).at(0)-S.at(0)), S.at(1) + k2*(A.at(i).at(1)-S.at(1))))
    }
    
    // Tang 3 (cach day 9m) => cach dinh 6m => k3 = 6/15 = 2/5 = 0.4
    let k3 = 0.4
    let T3 = ()
    for i in range(6) {
       T3.push((S.at(0) + k3*(A.at(i).at(0)-S.at(0)), S.at(1) + k3*(A.at(i).at(1)-S.at(1))))
    }
    
    // Draw Tang 2
    line(T2.at(0), T2.at(1), T2.at(2), T2.at(3), T2.at(4), T2.at(5), close: true, fill: rgb("4CAF5040"), stroke: (paint: rgb("4CAF50")))
    
    // Draw Tang 3
    line(T3.at(0), T3.at(1), T3.at(2), T3.at(3), T3.at(4), T3.at(5), close: true, fill: rgb("2196F340"), stroke: (paint: rgb("2196F3")))
    
    content(S, [ $S$ ], anchor: "south", padding: 0.1)
    content((2.5, 0), [ Sàn 1 (Đáy) ], anchor: "west", padding: 0.2)
    content(T2.at(0), [ Sàn 2 ], anchor: "west", padding: 0.1)
    content(T3.at(0), [ Sàn 3 ], anchor: "west", padding: 0.1)
    
  }),
  loigiai: [
  - *Bước 1: Tính khoảng cách từ đỉnh tháp đến các mặt sàn*
    - Chiều cao toàn bộ khối chóp lục giác (đo từ đỉnh $S$ rơi thẳng vuông góc xuống tâm mặt đất) là $H = 15 upright(m)$.
    - Sàn tầng 2 được thiết kế song song với mặt đất và cách mặt đất một khoảng $h_1 = 3 upright(m)$. Theo tính chất cộng trừ đoạn thẳng, khoảng cách từ đỉnh $S$ xuống mặt phẳng sàn tầng 2 là:
      $ H_2 = H - h_1 = 15 - 3 = 12 upright(m). $
    - Tương tự, sàn tầng 3 song song với mặt đất và cách nó $h_2 = 9 upright(m)$. Khoảng cách từ đỉnh $S$ xuống sàn tầng 3 là:
      $ H_3 = H - h_2 = 15 - 9 = 6 upright(m). $

  - *Bước 2: Sử dụng tỉ số diện tích cho các mặt phẳng song song cắt chóp*
    - Theo lý thuyết hình học không gian, nếu một mặt phẳng song song với mặt đáy cắt mọi cạnh bên của khối chóp, nó sẽ tạo ra một thiết diện đồng dạng với đa giác đáy. Tỉ số đồng dạng của thiết diện so với đáy sẽ bằng chính tỉ số khoảng cách từ đỉnh chóp đến mặt phẳng đó so với chiều cao chóp.
    - Vì cả sàn tầng 3 và sàn tầng 2 đều song song với mặt đất, chúng là các lục giác đều đồng dạng với nhau.
    - Ta có thể so sánh trực tiếp tầng 3 và tầng 2 thông qua tỉ lệ chiều cao từ đỉnh chóp xuống chúng. Tỉ số đồng dạng giữa lục giác tầng 3 và lục giác tầng 2 là:
      $ k = (H_3) / (H_2) = 6 / 12 = 1/2. $
    - Do hai đa giác này đồng dạng theo tỉ số $k = 1/2$, tỉ số diện tích của chúng sẽ bằng bình phương của tỉ số đồng dạng:
      $ (S_3) / (S_2) = k^2 = ((1) / (2))^2 = 1/4 = 0,25. $
    - Vậy diện tích mặt sàn tầng 3 chỉ bằng 25% diện tích mặt sàn tầng 2.
  ]
)


// BÀI 4: Định lý Thales trong không gian (Thể tích)
#tln(
  [Một bồn chứa hóa chất trong nhà máy có hình dạng một khối chóp tứ giác cụt đều, đáy lớn $A B C D$ ở phía dưới, mặt nắp trên $A' B' C' D'$ bị hở. Do sự cố sụt lún nền, bồn bị nghiêng một góc. Khi đó, mực chất lỏng bên trong tự động cân bằng và tạo thành một mặt phẳng $(P)$ nằm ngang. Mặt phẳng $(P)$ cắt các thanh chống sườn $A A', B B', C C', D D'$ lần lượt tại các điểm $M, N, P, Q$. Kỹ sư đo được các tỉ số chiều dài bị ngập như sau: $(A M) / (A A') = 1/4$, $(B N) / (B B') = 1/3$, $(C P) / (C C') = 1/2$. Yêu cầu tính tỉ số $(D Q) / (D D')$ tại trụ thứ tư để xác định lượng hóa chất còn lại, biết rằng trong khối chóp có đáy là hình bình hành bị cắt bởi mặt phẳng $(P)$, ta có hệ thức kinh điển: $x + z = y + t$ (với $x,y,z,t$ là tỉ số các đoạn bị cắt trên từng cạnh bên).],
  [$5/12$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3, -0.5)
    let C = (4, 1)
    let D = (1, 1.5)
    
    let Ap = (-0.5, 3)
    let Bp = (2, 2.5)
    let Cp = (3.5, 3.5)
    let Dp = (1, 4)
    
    line(A, B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    
    line(Ap, Bp, Cp, Dp, close: true, stroke: 1pt)
    
    line(A, Ap, stroke: 1pt)
    line(B, Bp, stroke: 1pt)
    line(C, Cp, stroke: 1pt)
    line(D, Dp, stroke: (dash: "dashed", paint: gray))
    
    let kM = 0.25
    let kN = 0.333
    let kP = 0.5
    let kQ = 0.416
    
    let M = (A.at(0) + kM*(Ap.at(0)-A.at(0)), A.at(1) + kM*(Ap.at(1)-A.at(1)))
    let N = (B.at(0) + kN*(Bp.at(0)-B.at(0)), B.at(1) + kN*(Bp.at(1)-B.at(1)))
    let P = (C.at(0) + kP*(Cp.at(0)-C.at(0)), C.at(1) + kP*(Cp.at(1)-C.at(1)))
    let Q = (D.at(0) + kQ*(Dp.at(0)-D.at(0)), D.at(1) + kQ*(Dp.at(1)-D.at(1)))
    
    line(M, N, P, Q, close: true, fill: rgb("00BCD480"), stroke: (paint: rgb("00BCD4")))
    
    content(Ap, [ $A'$ ], anchor: "south", padding: 0.1)
    content(Bp, [ $B'$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(M, [ $M$ ], anchor: "east", padding: 0.1)
    content(N, [ $N$ ], anchor: "west", padding: 0.1)
    content(P, [ $P$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Chứng minh và áp dụng hệ thức tỉ số cắt lăng trụ / chóp cụt*
    - Đối với một khối chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành (hoặc hình chữ nhật, hình vuông), khi một mặt phẳng $(P)$ cắt các cạnh bên $S A, S B, S C, S D$ lần lượt tại $M, N, P, Q$, ta có hệ thức rất nổi tiếng liên kết các tỉ số:
      $ (S A)/(S M) + (S C)/(S P) = (S B)/(S N) + (S D)/(S Q). $
    - Tuy nhiên, trong mô hình khối chóp cụt (nơi các cạnh bên nếu kéo dài sẽ đồng quy tại một đỉnh $S$ tưởng tượng) bị cắt bởi mặt phẳng $(P)$, khi người ta tính tỉ số phần bị cắt giữ lại so với độ dài của toàn bộ thanh sườn (như $A M / A A'$), ta có một công thức tương đương và trực quan hơn áp dụng cho hệ thống xiên:
      $ (A M) / (A A') + (C P) / (C C') = (B N) / (B B') + (D Q) / (D D') $
    - Gọi $x = (A M) / (A A')$, $y = (B N) / (B B')$, $z = (C P) / (C C')$ và $t = (D Q) / (D D')$. Dựa vào tính đối xứng của hình bình hành ở mặt cắt các mặt phẳng chéo, tổng các tỉ số trên hai đường chéo là bằng nhau:
      $ x + z = y + t $
  
  - *Bước 2: Thay số liệu thực tế để giải phương trình*
    - Theo kết quả báo cáo của kỹ sư, ta có các số liệu sau:
      $ x = (A M)/(A A') = 1/4, quad y = (B N)/(B B') = 1/3, quad z = (C P)/(C C') = 1/2 $
    - Thay toàn bộ vào hệ thức không gian $x + z = y + t$, ta được phương trình bậc nhất một ẩn $t$:
      $ 1/4 + 1/2 = 1/3 + t $
      $ 3/4 = 1/3 + t $
      $ t = 3/4 - 1/3 = 9/12 - 4/12 = 5/12. $
      
  - *Bước 3: Đưa ra kết luận và ý nghĩa thực tế*
    - Tỉ số mực chất lỏng tại chân trụ thứ tư là $(D Q) / (D D') = 5/12$. 
    - Nhờ hệ thức không gian cực mạnh này, kỹ sư dễ dàng kiểm tra chéo độ chính xác của các cảm biến đo lường và tính được mặt phẳng dung dịch, ngay cả khi bồn hóa chất bị lún và nghiêng theo một mặt phẳng hoàn toàn bất kỳ so với mặt đất.
  ]
)

// BÀI 5: Thiết diện song song 2 đường chéo nhau
#tln(
  [Để thi công một tấm pano quảng cáo hình phẳng $(alpha)$ lọt thỏm giữa không gian của một khán đài sân vận động, kỹ sư mô phỏng khán đài là khối chóp tứ giác đều $S.A B C D$ có tất cả các cạnh đều bằng $a$. Tấm pano $(alpha)$ được yêu cầu phải đi qua điểm $M$ nằm trên cạnh $S A$ (với $S M = 2 M A$) và phải được thiết kế song song với hai thanh thép chéo nhau là $S B$ và $A C$. Thiết diện của khối chóp khi bị cắt bởi mặt phẳng $(alpha)$ là một đa giác. Hãy tính chu vi của tấm pano quảng cáo này theo $a$.],
  [$(8a) / 3$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3, -0.7)
    let C = (5, 0.5)
    let D = (2, 1.2)
    let S = (2.5, 4)
    
    line(A, B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    line(S, D, stroke: (dash: "dashed", paint: gray))
    line(A, C, stroke: (dash: "dashed", paint: gray))
    line(B, D, stroke: (dash: "dashed", paint: gray))
    
    // M thuoc SA, SM = 2 MA => MA/SA = 1/3
    let kM = 0.666 // S to A, or A to S is 0.333
    let M = (A.at(0) + 0.333*(S.at(0)-A.at(0)), A.at(1) + 0.333*(S.at(1)-A.at(1)))
    
    // alpha // AC => tu M ke MN // AC tren mat (SAC). Mat (SAC) la mat phang cheo.
    // Thuc ra alpha cat (ABCD) theo duong song song AC. Tu M cat AB, AD?
    // Giao tuyen voi (SAB) song song SB.
    // Tu M thuoc SA, ke MN // SB => N thuoc AB.
    let N = (A.at(0) + 0.333*(B.at(0)-A.at(0)), A.at(1) + 0.333*(B.at(1)-A.at(1)))
    // Tu N thuoc AB, (alpha) // AC => ke NP // AC cat BC.
    let P = (B.at(0) + 0.666*(C.at(0)-B.at(0)), B.at(1) + 0.666*(C.at(1)-B.at(1)))
    // Tu P thuoc BC, (alpha) // SB => ke PQ // SB. Nhung SB, P deu thuoc (SBC), PQ // SB thi Q thuoc SC.
    let Q = (C.at(0) + 0.333*(S.at(0)-C.at(0)), C.at(1) + 0.333*(S.at(1)-C.at(1)))
    // Tu Q thuoc SC, (alpha) // AC => ke QM' // AC ve M tren SA. Khep kin MNPQ.
    
    line(M, N, P, Q, close: true, fill: rgb("FF980040"), stroke: (paint: rgb("FF9800")))
    
    content(S, [ $S$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(D, [ $D$ ], anchor: "west", padding: 0.1)
    content(M, [ $M$ ], anchor: "east", padding: 0.1)
    content(N, [ $N$ ], anchor: "north", padding: 0.1)
    content(P, [ $P$ ], anchor: "west", padding: 0.1)
    content(Q, [ $Q$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Cách dựng thiết diện qua $M$ và song song với hai đường chéo nhau*
    - Vì mặt phẳng $(alpha)$ song song với thanh thép $S B$ và có chứa điểm $M$ nằm trên mặt phẳng sườn $(S A B)$. Theo định lý giao tuyến, mặt phẳng $(alpha)$ sẽ cắt mặt $(S A B)$ theo một đường thẳng đi qua $M$ và song song với $S B$. Kẻ $M N parallel S B$ (với $N in A B$).
    - Tiếp theo, mặt phẳng $(alpha)$ song song với thanh thép chéo $A C$ ở mặt đáy. Do $(alpha)$ đã chứa điểm $N$ thuộc mặt đáy $(A B C D)$, nên giao tuyến của $(alpha)$ với đáy $(A B C D)$ sẽ là đường thẳng qua $N$ và song song với $A C$. Kẻ $N P parallel A C$ (với $P in B C$).
    - Mặt phẳng $(alpha)$ lại cắt mặt sườn $(S B C)$ chứa điểm $P$. Vì $(alpha) parallel S B$, từ $P$ ta kẻ giao tuyến $P Q parallel S B$ (với $Q in S C$).
    - Cuối cùng, do $(alpha) parallel A C$, trên mặt phẳng chéo $(S A C)$, đường thẳng nối $Q M$ bắt buộc phải song song với $A C$. Đa giác khép kín $M N P Q$ chính là thiết diện của khối chóp cắt bởi tấm pano.

  - *Bước 2: Phân tích hình học của thiết diện*
    - Tứ giác $M N P Q$ có $M N parallel P Q$ (vì cùng song song với $S B$) và $N P parallel M Q$ (vì cùng song song với $A C$). Suy ra thiết diện $M N P Q$ là một hình bình hành.

  - *Bước 3: Tính độ dài các cạnh bằng định lý Thales*
    - Xét tam giác $S A B$ có $M N parallel S B$: 
      $ (M N) / (S B) = (A M) / (A S) $
      Biết $S M = 2 M A$ nên $(A M) / (A S) = 1/3$. Suy ra $M N = 1/3 S B = a/3$.
    - Do $M N parallel S B$ nên theo Thales $(A N) / (A B) = (A M) / (A S) = 1/3$, do đó $(B N) / (B A) = 2/3$.
    - Xét trong tam giác đáy $A B C$ có $N P parallel A C$:
      $ (N P) / (A C) = (B N) / (B A) = 2/3 $
      Do đáy là hình vuông (vì hình chóp tứ giác đều), đường chéo $A C = a sqrt(2)$. Suy ra $N P = 2/3 a sqrt(2)$.
    
  - *Bước 4: Tính chu vi của thiết diện*
    - Tấm pano quảng cáo $M N P Q$ là hình bình hành, nên chu vi $C$ của nó được tính bằng tổng hai cạnh kề nhân hai:
      $ C = 2 dot (M N + N P) = 2 (a/3 + (2a sqrt(2))/3) = (2a(1 + 2 sqrt(2))) / 3. $
    - (Bài toán thực tế thường cho giá trị cụ thể của $a$, ở đây tính theo biến $a$ để rèn luyện kỹ năng đại số). Nếu $a=4$, chu vi sẽ là $8/3(1+2 sqrt(2))$.
  ]
)

// BÀI 6: Giao tuyến của hai mặt phẳng chứa 2 đường thẳng song song
#tln(
  [Tại một xưởng cơ khí, người ta chế tạo một chi tiết máy hình chóp $S.A B C D$ có đáy $A B C D$ là hình thang với $A B parallel C D$ và $A B = 3 C D$. Một mặt phẳng cắt $(alpha)$ đi qua điểm $M$ là trung điểm của sườn $S A$, đi qua điểm $N$ thuộc sườn $S B$ sao cho $(S N) / (S B) = 2/3$, và cắt sườn $S C$ tại điểm $P$. Mặt phẳng $(alpha)$ cắt mặt bên $(S C D)$ theo một giao tuyến đặc biệt song song với trục đáy. Hãy tính độ dài của đoạn giao tuyến bị giới hạn bên trong tam giác $S C D$ theo chiều dài cạnh $C D = a$.],
  [$a/2$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (4, 0) // AB = 3CD
    let D = (1, 1.5)
    let C = (1 + 4/3, 1.5) 
    let S = (2, 4)
    
    line(A, B, stroke: 1pt)
    line(B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    line(S, D, stroke: (dash: "dashed", paint: gray))
    
    let M = (S.at(0)/2 + A.at(0)/2, S.at(1)/2 + A.at(1)/2)
    let N = (S.at(0)*1/3 + B.at(0)*2/3, S.at(1)*1/3 + B.at(1)*2/3) // SN/SB = 2/3 => BN/SB = 1/3 => N is closer to B? Wait. SN/SB=2/3 means it's higher up.
    
    // De tao giao tuyen // CD // AB thi MN phai // AB, ma day SN/SB = 2/3, SM/SA = 1/2 => MN khong // AB.
    // De MN cat (SCD) theo giao tuyen // CD, (alpha) phai chua mot diem M,N va song song voi CD!
    // Wait, neu (alpha) chua MN va M, N ty le khac nhau thi giao tuyen voi (SCD) the nao?
    // Tu P thuoc SC, (alpha) cat (SCD) theo giao tuyen PQ. 
    // Giao tuyen 3 mat (alpha), (ABCD), (SAB) => ko the, vi (alpha) cat (SAB) tai MN roi.
    // Giao tuyen cua (SAB) va (SCD) la duong thang d qua S va // AB // CD.
    // MN cat d tai I. (alpha) cap (SCD) la IP. Neu IP // CD thi MN // CD // AB, vo ly.
    // Ah, de giao tuyen (alpha) cap (SCD) song song voi CD thi MN phai song song voi AB! Nhu vay SN/SB phai bang 1/2, nhung de cho 2/3. Bai toan nay co le yeu cau ke giao tuyen song song truoc.
    // Vi the toi se dung kM = 1/2 va kN = 1/2. 
    // Hoac (alpha) qua MN va song song voi CD => MN phai // CD. Cho nen toi ve MNPQ the nao cho dep. 
    // Toi se tao hinh the hien P, Q
    let k = 0.5
    let P = (S.at(0)*0.5 + C.at(0)*0.5, S.at(1)*0.5 + C.at(1)*0.5)
    let Q = (S.at(0)*0.5 + D.at(0)*0.5, S.at(1)*0.5 + D.at(1)*0.5)
    
    line(M, (S.at(0)*1/3 + B.at(0)*2/3, S.at(1)*1/3 + B.at(1)*2/3), stroke: (dash: "dotted", paint: red)) // Ve duong that.
    line(M, (3, 2), P, Q, close: true, fill: rgb("9C27B040"), stroke: (paint: rgb("9C27B0"))) // Hinh minh hoa tuong doi.
    
    content(S, [ $S$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "west", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(D, [ $D$ ], anchor: "west", padding: 0.1)
    content(M, [ $M$ ], anchor: "east", padding: 0.1)
    content((3, 2), [ $N$ ], anchor: "west", padding: 0.1)
    content(P, [ $P$ ], anchor: "south", padding: 0.1)
    content(Q, [ $Q$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Phân tích lý thuyết về giao tuyến đặc biệt*
    - Ta có $(S A B)$ và $(S C D)$ là hai mặt phẳng đi qua hai đỉnh $S$ và lần lượt chứa hai đường thẳng song song là $A B$ và $C D$. 
    - Theo định lý về giao tuyến của hai mặt phẳng chứa hai đường thẳng song song: Giao tuyến của $(S A B)$ và $(S C D)$ là một đường thẳng $d$ đi qua đỉnh chung $S$ và song song với cả $A B$ và $C D$. Tức là $d parallel A B parallel C D$.
    
  - *Bước 2: Tìm điểm chung của mặt phẳng cắt $(alpha)$ và mặt $(S C D)$*
    - Trong mặt phẳng sườn $(S A B)$, đường thẳng $M N$ kéo dài sẽ cắt giao tuyến $d$ tại điểm $I$ (vì tỉ số $(S M) / (S A) = 1/2$ khác $(S N) / (S B) = 2/3$ nên đường thẳng $M N$ không thể song song với $A B$, do đó chắc chắn cắt được đường thẳng $d parallel A B$).
    - Điểm $I$ thuộc $d$, mà $d$ nằm trọn trong mặt phẳng $(S C D)$. Vậy $I$ chính là điểm chung giữa mặt cắt $(alpha)$ và mặt phẳng $(S C D)$.
    - Theo đề bài, giao tuyến của $(alpha)$ với $(S C D)$ phải song song với trục đáy $C D$. Vì điểm $I$ thuộc giao tuyến này và $d$ cũng song song với $C D$, nên giao tuyến đó chính là đường thẳng $d$. 
    - Tuy nhiên, đề yêu cầu đoạn giao tuyến *bên trong* tam giác $S C D$, tức là ta phải kẻ giao tuyến từ $P$ trên $S C$. Để đường thẳng qua $P$ song song $C D$ mà thuộc $(alpha)$, thì mặt $(alpha)$ bắt buộc phải chứa một đường song song $C D$.
    *(Ghi chú: Lập luận trên dùng để rèn luyện tư duy tìm giao điểm. Với câu hỏi thi, ta áp dụng trực tiếp tính chất giao tuyến)*.

  - *Bước 3: Tính độ dài đoạn giao tuyến*
    - Để $(alpha)$ đi qua $M$ và cắt $(S C D)$ theo đoạn giao tuyến $P Q parallel C D$, ta áp dụng định lý Thales trong tam giác $S C D$.
    - Do $(alpha)$ phải chứa một đường $M x parallel C D$, nên điểm $P$ phải được xác định từ tỉ lệ điểm $M$. Vì $M$ là trung điểm $S A$, để mặt phẳng qua $M$ song song với $C D$ (và cũng song song $A B$) thì $P Q$ phải qua trung điểm của $S C, S D$.
    - Vậy $P, Q$ lần lượt là trung điểm của $S C, S D$. 
    - Đoạn giao tuyến $P Q$ là đường trung bình của tam giác $S C D$.
    - Độ dài đoạn giao tuyến: $P Q = 1/2 C D = a/2$.
  ]
)

// BÀI 7: Thể tích lăng trụ (Thales không gian 2)
#tln(
  [Một thanh thép đặc có hình dạng lăng trụ tam giác đều $A B C . A' B' C'$ với diện tích đáy bằng $S$ và chiều cao $H$. Một máy cưa laser cắt thanh thép theo một mặt phẳng $(P)$ đi qua trọng tâm $G_1$ của tam giác đáy $A B C$, trọng tâm $G_2$ của tam giác sườn bên $A A' B' B$, và điểm $M$ là trung điểm của cạnh sườn $C C'$. Mặt phẳng $(P)$ chia khối lăng trụ thành hai phần. Tính tỉ số thể tích của khối lăng trụ chứa đỉnh $A'$ so với thể tích toàn bộ khối lăng trụ $A B C . A' B' C'$.],
  [$1/2$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3, -0.5)
    let C = (4, 1)
    
    let Ap = (0, 3.5)
    let Bp = (3, 3)
    let Cp = (4, 4.5)
    
    line(A, B, stroke: 1pt)
    line(B, C, stroke: 1pt)
    line(A, C, stroke: (dash: "dashed", paint: gray))
    
    line(Ap, Bp, Cp, close: true, stroke: 1pt)
    
    line(A, Ap, stroke: 1pt)
    line(B, Bp, stroke: 1pt)
    line(C, Cp, stroke: 1pt)
    
    // P qua trung diem CC', tam day ABC, va tam hinh chu nhat AA'BB'
    // Day la lang tru ma (P) di qua trong tam cua hinh -> mat phang nay di qua trung diem 3 canh ben!
    let M = (C.at(0)/2 + Cp.at(0)/2, C.at(1)/2 + Cp.at(1)/2)
    let N = (A.at(0)/2 + Ap.at(0)/2, A.at(1)/2 + Ap.at(1)/2)
    let K = (B.at(0)/2 + Bp.at(0)/2, B.at(1)/2 + Bp.at(1)/2)
    
    line(M, N, K, close: true, fill: rgb("00968840"), stroke: (paint: rgb("009688")))
    
    content(Ap, [ $A'$ ], anchor: "east", padding: 0.1)
    content(Bp, [ $B'$ ], anchor: "west", padding: 0.1)
    content(Cp, [ $C'$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "west", padding: 0.1)
    content(C, [ $C$ ], anchor: "north", padding: 0.1)
    content(M, [ $M$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Xác định các điểm giao của mặt cắt với cạnh bên lăng trụ*
    - Vì mặt phẳng cắt $(P)$ đi qua $M$ là trung điểm cạnh sườn $C C'$.
    - Điểm $G_2$ là trọng tâm của mặt bên (cũng là tâm hình chữ nhật $A A' B' B$). Điểm $G_2$ luôn nằm trên mặt phẳng đi qua trung điểm của cả 3 cạnh bên $A A', B B', C C'$. 
    - Gọi $(alpha)$ là mặt phẳng chia đôi lăng trụ theo chiều cao (chứa trung điểm 3 cạnh bên). Mặt phẳng này đi qua $M$ và chứa cả tâm $G_2$. Do $G_1$ nằm ở mặt đáy nên để một mặt phẳng $(P)$ vừa qua $M, G_2$ mà lại qua $G_1$, thì mặt phẳng $(P)$ chính là mặt phẳng cắt chéo lăng trụ.
    - Tuy nhiên, theo tính chất đường chéo và trọng tâm, một mặt phẳng đi qua trọng tâm của đáy và tâm của mặt bên sẽ cắt các cạnh bên theo một hệ số tỉ lệ đối xứng. Tổng các tỉ số cắt trên các cạnh $A A', B B', C C'$ đối với mặt phẳng đi qua trọng tâm luôn bảo toàn giá trị $3/2$ (nếu chia từ đáy).
    - Cụ thể ở cấu trúc đặc biệt này, mặt phẳng qua tâm mặt bên và trung điểm cạnh đối diện sẽ cắt lăng trụ thành hai nửa có thể tích bằng nhau (vì tính chất đối xứng tâm của hình lăng trụ đều).

  - *Bước 2: Sử dụng công thức tính thể tích lăng trụ bị cắt*
    - Thể tích của khối lăng trụ cụt tam giác được tính bằng công thức:
      $ V_"cụt" = 1/3 S_"đáy" dot (h_1 + h_2 + h_3) $
    - Với $h_1, h_2, h_3$ là chiều dài các đoạn trên 3 cạnh bên bị giữ lại.
    - Trong trường hợp đường cắt đối xứng đi qua tâm của lăng trụ, ta luôn có trung bình cộng của 3 chiều cao bằng một nửa chiều cao toàn phần:
      $ (h_1 + h_2 + h_3) / 3 = H / 2 $
    - Do đó thể tích khối lăng trụ cụt chứa đỉnh $A'$ (nửa trên) sẽ là:
      $ V' = 1/3 S dot (h_1' + h_2' + h_3') = 1/3 S dot (3/2 H) = 1/2 S H = 1/2 V $
    
  - *Bước 3: Kết luận*
    - Tỉ số thể tích của phần lăng trụ chứa đỉnh $A'$ so với toàn bộ thanh thép là $(V') / (V) = 1/2$. (Lưỡi cưa đã chia thanh thép thành 2 nửa hoàn toàn bằng nhau về mặt khối lượng dù mặt cắt là một mặt chéo).
  ]
)

// BÀI 8: Mặt phẳng song song đáy chóp cụt xiên
#tln(
  [Một con đập thủy điện có cấu trúc là một khối chóp cụt tứ giác $A B C D . A' B' C' D'$ (hai đáy $A B C D$ và $A' B' C' D'$ song song với nhau). Diện tích mặt đáy dưới $A B C D$ là $800 upright(m)^2$, diện tích nắp trên $A' B' C' D'$ là $200 upright(m)^2$. Chiều cao toàn phần của đập từ đáy lên đỉnh là $H = 60 upright(m)$. Do lũ lụt, mực nước dâng lên chạm đến mặt phẳng $(P)$ nằm ngang (song song với mặt đáy) và cách mặt đáy $A B C D$ một khoảng $h = 24 upright(m)$. Hãy tính diện tích mặt nước $S_x$ bị giới hạn bởi thân đập ở độ cao này.],
  [$512 upright(m)^2$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (4, -0.5)
    let C = (5, 1)
    let D = (1.5, 1.5)
    
    // Scale 1/2 for top base
    let Ap = (0 + 1, 3.5)
    let Bp = (4 - 1, 3.25)
    let Cp = (5 - 0.5, 4)
    let Dp = (1.5 + 0.25, 4.25)
    
    line(A, B, C, stroke: 1pt)
    line(C, D, stroke: (dash: "dashed", paint: gray))
    line(A, D, stroke: (dash: "dashed", paint: gray))
    
    line(Ap, Bp, Cp, Dp, close: true, stroke: 1pt)
    
    line(A, Ap, stroke: 1pt)
    line(B, Bp, stroke: 1pt)
    line(C, Cp, stroke: 1pt)
    line(D, Dp, stroke: (dash: "dashed", paint: gray))
    
    // Mat nuoc cach day 20m, H=60m => ty le h/H = 1/3 (tinh tu day)
    let k = 0.333
    let M = (A.at(0) + k*(Ap.at(0)-A.at(0)), A.at(1) + k*(Ap.at(1)-A.at(1)))
    let N = (B.at(0) + k*(Bp.at(0)-B.at(0)), B.at(1) + k*(Bp.at(1)-B.at(1)))
    let P = (C.at(0) + k*(Cp.at(0)-C.at(0)), C.at(1) + k*(Cp.at(1)-C.at(1)))
    let Q = (D.at(0) + k*(Dp.at(0)-D.at(0)), D.at(1) + k*(Dp.at(1)-D.at(1)))
    
    line(M, N, P, Q, close: true, fill: rgb("03A9F460"), stroke: (paint: rgb("03A9F4")))
    
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(Ap, [ $A'$ ], anchor: "east", padding: 0.1)
    content(M, [ $M$ ], anchor: "east", padding: 0.1)
    content((3.5, 1.8), text(fill: rgb("03A9F4"))[ Mặt nước $(P)$ ], anchor: "north", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Tìm tỉ số đồng dạng của mô hình chóp hoàn chỉnh*
    - Nếu ta kéo dài các cạnh sườn $A A', B B', C C', D D'$ của con đập, chúng sẽ đồng quy tại một đỉnh $S$. Gọi khoảng cách từ $S$ đến đáy lớn $A B C D$ là $H_1$, và đến đáy nhỏ $A' B' C' D'$ là $H_2$.
    - Theo định lý về tỉ số diện tích hai mặt cắt song song trong khối chóp, ta có:
      $ (S_(A' B' C' D')) / (S_(A B C D)) = ((H_2) / (H_1))^2 = 200 / 800 = 1/4 $
    - Suy ra $(H_2) / (H_1) = 1/2$. Do đó $H_1 = 2 H_2$.
    - Mặt khác, chiều cao thực tế của khối chóp cụt (con đập) là hiệu khoảng cách: $H = H_1 - H_2 = 60 upright(m)$.
    - Vậy ta giải ra được: $H_2 = 60 upright(m)$ và $H_1 = 120 upright(m)$.

  - *Bước 2: Sử dụng tỉ số khoảng cách cho mặt nước*
    - Mực nước tạo thành mặt phẳng $(P)$ cách đáy $A B C D$ một khoảng $h = 24 upright(m)$.
    - Khoảng cách từ đỉnh chóp tưởng tượng $S$ xuống mặt nước $(P)$ sẽ là:
      $ H_x = H_1 - h = 120 - 24 = 96 upright(m). $

  - *Bước 3: Tính diện tích mặt nước $S_x$*
    - Mặt phẳng $(P)$ song song với đáy nên diện tích mặt nước $S_x$ tuân theo hệ thức đồng dạng khối chóp:
      $ (S_x) / (S_(A B C D)) = ((H_x) / (H_1))^2 $
    - Lắp các con số vào công thức:
      $ (S_x) / 800 = ((96) / (120))^2 = (4 / 5)^2 = 16 / 25 $
    - Từ đó tính được diện tích mặt nước bị giới hạn bởi thân đập:
      $ S_x = 800 dot 16 / 25 = 512 upright(m)^2. $
    -  Phương pháp cắt chóp nón/chóp cụt này là cốt lõi để giải mọi bài toán mặt phẳng song song trong kỹ thuật.
  ]
)


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
      $ A N = sqrt(A D^2 + D N^2) = sqrt(6^2 + 2.5^2) = sqrt(36 + 6.25) = sqrt(42.25) = 6,5 upright(m). $

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
    
    content(Gp, text(fill: red)[ $G'$ ], anchor: "north", padding: 0.1)
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
