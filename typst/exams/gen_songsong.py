import os

content = r"""#import "@local/sang-math:1.0.4": *
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
  [Để thi công một tuyến cáp treo đi qua khe núi, các kỹ sư mô hình hóa khe núi bằng một khối chóp tứ giác $S.A B C D$ có đáy $A B C D$ là hình thang (với $A D // B C$ và $A D = 2 B C$). Một tuyến cáp phụ nằm trên mặt phẳng $(P)$ đi qua trung điểm $M$ của sườn núi $S A$, đi qua điểm $N$ trên sườn $S B$ sao cho $S N = 1/3 S B$ và song song với cạnh núi $A D$. Hãy tính tỉ số $x = (S K) / (S D)$ với $K$ là điểm neo cáp trên sườn $S D$.],
  [$1/2$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = 3.5
    let b = 1.75
    let h = 3.5
    
    let A = (0, 0)
    let D = (4, 1.2)
    let B = (1.5, -1)
    let C = (1.5 + b, -1 + 0.5) // BC // AD, do dai = 1/2 AD
    
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
    content(M, [ $M$ ], anchor: "east", padding: 0.1, text(fill: blue))
    content(N, [ $N$ ], anchor: "east", padding: 0.1, text(fill: blue))
    content(K, [ $K$ ], anchor: "west", padding: 0.1, text(fill: blue))
    
    circle(M, radius: 0.05, fill: blue)
    circle(N, radius: 0.05, fill: blue)
    circle(K, radius: 0.05, fill: blue)
  }),
  loigiai: [
  - **Bước 1: Khai thác yếu tố song song của mặt phẳng $(P)$**
    - Theo đề bài, mặt phẳng $(P)$ chứa đoạn $M N$ và song song với cạnh $A D$.
    - Do $A D subset (S A D)$ và $(P)$ cắt $(S A D)$ theo một giao tuyến đi qua $M$ (vì $M in (P) cap (S A D)$).
    - Tính chất: Nếu một mặt phẳng chứa một điểm chung với mặt phẳng khác và song song với một đường thẳng nằm trong mặt phẳng đó, thì giao tuyến sẽ đi qua điểm chung và song song với đường thẳng kia.
    - Vậy giao tuyến của $(P)$ và $(S A D)$ là đường thẳng qua $M$, song song với $A D$, cắt $S D$ tại $K$.
  
  - **Bước 2: Sử dụng định lý Thales trong tam giác**
    - Xét $Delta S A D$ có $M K // A D$ (vì $(P) // A D$).
    - Do $M$ là trung điểm của $S A$ nên theo định lý đường trung bình (hoặc Thales), $K$ bắt buộc phải là trung điểm của $S D$.
    - Từ đó suy ra $S K / S D = 1/2$.
    
  - **Bước 3: Mở rộng tìm thiết diện hoàn chỉnh (Tham khảo thêm)**
    - Nếu đề bài yêu cầu vẽ thiết diện cắt bởi $(P)$: Do $(P) // A D$, mà $A D // B C$ (đáy là hình thang) $=> (P) // B C$.
    - Giao tuyến của $(P)$ với $(S B C)$ sẽ đi qua $N$ và song song với $B C$, cắt $S C$ tại điểm $P_1$.
    - Ta có $N P_1 // B C => S P_1 / S C = S N / S B = 1/3$. 
    - Thiết diện tạo thành là hình thang $M N P_1 K$.
  ]
)

// BÀI 2: Thiết diện khối gỗ
#tln(
  [Một khối gỗ mỹ nghệ hình chóp tứ giác $S.A B C D$ có đáy là hình bình hành. Thợ mộc dùng một lưỡi cưa máy phẳng $(alpha)$ cắt ngang khối gỗ. Biết lưỡi cưa đi qua trọng tâm $G$ của tam giác $S A B$ và luôn giữ song song với mặt phẳng đáy $(A B C D)$. Lưỡi cưa sẽ tạo ra trên khối gỗ một thiết diện là đa giác. Biết diện tích đáy $S_{A B C D} = 45 upright(c m)^2$. Hãy tính diện tích bề mặt vết cắt (thiết diện) tạo thành trên khối gỗ (đơn vị: $upright(c m)^2$).],
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
    
    // Mat cat alpha // (ABCD), cat SA, SB, SC, SD tai M, N, P, Q
    // Ty so = 2/3 (do (alpha) chua G, ma G la trong tam (SAB). Tu G ke MN // AB -> SM/SA = SN/SB = 2/3)
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
    content(G, [ $G$ ], anchor: "north", padding: 0.1, text(fill: red))
    circle(G, radius: 0.05, fill: red)
    
    // Duong trung tuyen cua SAB
    let M_AB = (1.5, -0.25)
    line(S, M_AB, stroke: (dash: "dotted", paint: red))
  }),
  loigiai: [
  - **Bước 1: Dựng thiết diện của $(alpha)$**
    - Điểm $G$ là trọng tâm $Delta S A B$. Trong mặt phẳng $(S A B)$, kéo dài trung tuyến $S M_1$ ($M_1$ là trung điểm $A B$), ta có $S G / S M_1 = 2/3$.
    - Lưỡi cưa $(alpha)$ đi qua $G$ và song song với $(A B C D)$. Do $(A B C D)$ chứa $A B$ nên $(alpha) // A B$.
    - Giao tuyến của $(alpha)$ với mặt bên $(S A B)$ là đường thẳng qua $G$, song song với $A B$, cắt $S A, S B$ lần lượt tại $M, N$.
    - Áp dụng định lý Thales trong $Delta S A B$: $S M / S A = S N / S B = S G / S M_1 = 2/3$.
    - Tương tự, do $(alpha) // (A B C D)$ nên $(alpha)$ sẽ cắt các mặt bên còn lại theo các giao tuyến song song với các cạnh đáy: $N P // B C$, $P Q // C D$, $Q M // D A$.
    - Thiết diện tạo thành là tứ giác $M N P Q$. Do $M N P Q$ có các cạnh tương ứng song song với $A B C D$ nên $M N P Q$ là hình bình hành đồng dạng với $A B C D$.

  - **Bước 2: Tính tỷ số đồng dạng và diện tích**
    - Hai đa giác $M N P Q$ và $A B C D$ là hai đa giác đồng dạng (vì các cạnh tương ứng song song).
    - Tỉ số đồng dạng $k = (M N)/(A B) = (S M)/(S A) = 2/3$.
    - Định lý diện tích đối với hình đồng dạng: Tỉ số diện tích bằng bình phương tỉ số đồng dạng.
      $ S_{M N P Q} = k^2 dot S_{A B C D} = (2/3)^2 dot 45 = 4/9 dot 45 = 20 upright(c m)^2. $
    - Vậy diện tích bề mặt vết cắt là $20 upright(c m)^2$.
  ]
)


// BÀI 3: Hai mặt phẳng song song - Sàn nhà
#tln(
  [Cấu trúc của một tháp triễn lãm có dạng một khối chóp lục giác đều $S.A_1 A_2 A_3 A_4 A_5 A_6$. Mặt đất là mặt phẳng chứa đáy tháp. Tầng hai của tháp là một mặt sàn phẳng cách mặt đất một khoảng $h_1 = 3 upright(m)$. Tầng ba là mặt sàn song song với tầng hai và cách mặt đất $h_2 = 9 upright(m)$. Biết chiều cao toàn bộ tháp từ mặt đất đến chóp $S$ là $15 upright(m)$. Hãy tính tỉ số diện tích giữa mặt sàn tầng ba và mặt sàn tầng hai $k = S_3 / S_2$.],
  [$4/16 = 1/4 = 0,25$],
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
  - **Bước 1: Tính khoảng cách từ đỉnh tháp đến các mặt sàn**
    - Chiều cao toàn bộ khối chóp (từ $S$ xuống đáy mặt đất) là $H = 15 upright(m)$.
    - Sàn tầng 2 song song với mặt đất và cách mặt đất $h_1 = 3 upright(m)$. Khoảng cách từ đỉnh $S$ xuống sàn tầng 2 là:
      $ H_2 = H - h_1 = 15 - 3 = 12 upright(m). $
    - Sàn tầng 3 song song với mặt đất và cách mặt đất $h_2 = 9 upright(m)$. Khoảng cách từ đỉnh $S$ xuống sàn tầng 3 là:
      $ H_3 = H - h_2 = 15 - 9 = 6 upright(m). $

  - **Bước 2: Sử dụng tỉ số diện tích cho mặt phẳng song song đáy**
    - Nếu một mặt phẳng song song với mặt đáy cắt khối chóp, nó sẽ tạo ra một thiết diện đồng dạng với đa giác đáy. Tỉ số đồng dạng bằng tỉ số khoảng cách từ đỉnh chóp đến hai mặt phẳng.
    - Sàn tầng 3 và tầng 2 đều là các lục giác đều đồng dạng với lục giác đáy.
    - Tỉ số đồng dạng giữa lục giác tầng 3 và lục giác tầng 2 là:
      $ k = H_3 / H_2 = 6 / 12 = 1/2. $
    - Do hai đa giác đồng dạng tỉ số $k = 1/2$, tỉ số diện tích của chúng sẽ bằng bình phương tỉ số đồng dạng:
      $ S_3 / S_2 = k^2 = (1/2)^2 = 1/4 = 0,25. $
    - Vậy diện tích mặt sàn tầng 3 chỉ bằng 25% diện tích mặt sàn tầng 2.
  ]
)


// BÀI 4: Định lý Thales trong không gian (Thể tích)
#tln(
  [Một bồn chứa hóa chất có hình dạng một khối chóp tứ giác cụt đều, đáy lớn $A B C D$ ở dưới, mặt trên $A' B' C' D'$ bị hở. Bồn bị nghiêng một góc sao cho mực hóa chất lỏng bên trong tạo thành một mặt phẳng $(P)$ nằm ngang, cắt các cạnh bên $A A', B B', C C', D D'$ lần lượt tại $M, N, P, Q$. Kỹ sư đo được $A M / A A' = 1/4$, $B N / B B' = 1/3$, $C P / C C' = 1/2$. Tính tỉ số $D Q / D D'$ để xác định lượng hóa chất còn lại, biết rằng trong khối chóp có đáy là hình bình hành bị cắt bởi mặt phẳng $(P)$, ta có hệ thức kinh điển về khoảng cách: $x + z = y + t$ (với $x,y,z,t$ là tỉ số các đoạn bị cắt).],
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
  - **Bước 1: Áp dụng hệ thức thể tích chóp tứ giác**
    - Đối với một khối chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành (hoặc hình chữ nhật, hình vuông), khi một mặt phẳng $(P)$ cắt các cạnh bên $S A, S B, S C, S D$ lần lượt tại $M, N, P, Q$, ta có hệ thức rất nổi tiếng:
      $ (S A)/(S M) + (S C)/(S P) = (S B)/(S N) + (S D)/(S Q). $
    - Tuy nhiên, trong mô hình khối chóp cụt hoặc lập lăng trụ bị cắt, khi tỉ số được tính từ mặt đáy lên, ta có công thức tương đương dành cho chiều cao:
      $ h_M + h_P = h_N + h_Q $
    - Gọi $x = A M / A A'$, $y = B N / B B'$, $z = C P / C C'$ và $t = D Q / D D'$. Do $A A', B B', C C', D D'$ đối xứng và đồng quy tại đỉnh chóp $S$ tưởng tượng, theo định lý Thales trong không gian cho hệ chóp tứ giác có đáy là hình bình hành, tổng các tỉ số trên hai đường chéo là bằng nhau:
      $ x + z = y + t $
  
  - **Bước 2: Lập phương trình và giải**
    - Theo đề bài, ta có các số liệu sau do kỹ sư đo đạc:
      $ x = (A M)/(A A') = 1/4 $
      $ y = (B N)/(B B') = 1/3 $
      $ z = (C P)/(C C') = 1/2 $
    - Thay vào hệ thức không gian $x + z = y + t$, ta được:
      $ 1/4 + 1/2 = 1/3 + t $
      $ 3/4 = 1/3 + t $
      $ t = 3/4 - 1/3 = 9/12 - 4/12 = 5/12. $
  - **Bước 3: Kết luận**
    - Tỉ số tại chân trụ thứ tư là $D Q / D D' = 5/12$. 
    - Nhờ hệ thức không gian cực mạnh này, kỹ sư dễ dàng kiểm tra chéo độ chính xác của các cảm biến đo lường, ngay cả khi bồn hóa chất bị nghiêng theo mặt phẳng bất kỳ.
  ]
)
"""

with open("CD-QuanHeSongSong.typ", "w", encoding="utf-8") as f:
    f.write(content)
