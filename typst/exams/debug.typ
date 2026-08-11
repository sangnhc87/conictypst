  [$4,29$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let a = 4.5
    let b = 3
    let h = 2.5
    
    let A = (0, 0)
    let B = (a, 0)
    let D = (1.5, 1.2)
    let C = (a + 1.5, 1.2)
    
    let Ap = (0, h)
    let Bp = (a, h)
    let Dp = (1.5, 1.2 + h)
    let Cp = (a + 1.5, 1.2 + h)

    let M = (a/2, 0)
    let N = (1.5/2, 1.2/2)
    let P = (a + 1.5, 1.2 + 0.6) // tren CC'

    line(A, B, Bp, Ap, close: true, stroke: 1pt)
    line(B, C, Cp, Bp, stroke: 1pt)
    line(Ap, Dp, Cp, stroke: 1pt)

    line(A, D, Dp, stroke: (dash: "dashed", paint: gray))
    line(C, D, stroke: (dash: "dashed", paint: gray))

    line(M, P, stroke: 1pt, fill: rgb("4CAF5040"))
    line(N, P, stroke: (dash: "dashed", paint: rgb("4CAF50")))
    line(M, N, stroke: (dash: "dashed", paint: rgb("4CAF50")))

    circle(Ap, radius: 0.08, fill: red)
    content(Ap, [ $A'$ (Camera)], anchor: "south", padding: 0.1, text(fill: red))
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content(C, [ $C$ ], anchor: "west", padding: 0.1)
    content(D, [ $D$ ], anchor: "south", padding: 0.1)
    content(M, [ $M$ ], anchor: "north", padding: 0.1)
    content(N, [ $N$ ], anchor: "east", padding: 0.1)
    content(P, [ $P$ ], anchor: "west", padding: 0.1)
  })
)[
  - **Bước 1: Mở rộng mặt phẳng cắt trục tung**
    - Ta có $M$ là trung điểm $A B implies A M = 4" m"$, $N$ là trung điểm $A D implies A N = 3" m"$.
    - Trong mặt phẳng sàn $(A B C D)$, kéo dài $M N$ cắt $C B$ và $C D$. Nhận thấy $\Delta A M N \sim \Delta C B D$ nên đường thẳng $M N$ hoàn toàn xác định.
    - Giả sử hệ tọa độ gốc $A(0,0,0)$ với các trục $A x \equiv A B$, $A y \equiv A D$, $A z \equiv A A'$. 
    - Khi đó $M(4, 0, 0)$, $N(0, 3, 0)$. Điểm $C$ có tọa độ $(8, 6, 0)$ nên $P$ có tọa độ $(8, 6, 1)$.
    - Phương trình mặt phẳng $(M N P)$ cắt các trục $O x, O y, O z$ lần lượt tại $M(4,0,0)$, $N(0,3,0)$ và $K(0,0,c)$.
  
  - **Bước 2: Tìm giao điểm $K$ với trục $A A'$**
    - Mặt phẳng $(M N K)$ có phương trình đoạn chắn:
      $ x/4 + y/3 + z/c = 1 $
    - Điểm $P(8, 6, 1)$ thuộc mặt phẳng này, thay vào ta được:
      $ 8/4 + 6/3 + 1/c = 1 \implies 2 + 2 + 1/c = 1 \implies 1/c = -3 \implies c = -1/3 $
    - Vậy mặt phẳng $(M N P)$ cắt đường thẳng $A A'$ tại $K(0, 0, -1/3)$. Khối chóp $A.M N K$ là chóp tam diện vuông tại $A$.

  - **Bước 3: Dùng tỉ số khoảng cách và công thức chóp vuông**
    - Chiều cao $h = d(A, (M N P))$ của chóp tam diện vuông $A.M N K$ được tính bằng:
      $ 1/h^2 = 1/(A M)^2 + 1/(A N)^2 + 1/(A K)^2 = 1/4^2 + 1/3^2 + 1/(-1/3)^2 = 1/16 + 1/9 + 9 = 1321/144 $
    - Suy ra khoảng cách $d(A, (M N P)) = 12 / sqrt(1321)$.
    - Ta cần tính $d(A', (M N P))$. Lập tỉ số khoảng cách từ $A'$ và $A$ đến mặt phẳng $(M N P)$ đi qua điểm $K$:
      $ (d(A', (M N P)))/(d(A, (M N P))) = (A' K)/(A K) $
    - Độ dài $A' K = | z_{A'} - z_K | = |4 - (-1/3)| = 13/3$.
    - Độ dài $A K = | z_A - z_K | = |0 - (-1/3)| = 1/3$.
    - Suy ra tỉ số bằng $(13/3) / (1/3) = 13$.
    - Vậy khoảng cách $d(A', (M N P)) = 13 . d(A, (M N P)) = (13 . 12)/sqrt(1321) = 156/sqrt(1321) approx 4,29" m$.
]

#tln(
  [Một thiết kế nhà kính sinh thái (Eco-dome) có hình dạng một tứ diện $O.A B C$, trong đó ba vách phẳng $(O A B)$, $(O B C)$, và $(O C A)$ vuông góc với nhau từng đôi một tại gốc $O$. Mặt phẳng $(O A B)$ áp sát mặt đất nằm ngang, không gian mặt đất của nhà kính này tạo thành một tam giác vuông cân tại $O$. Mặt kính nghiêng chính là mặt phẳng $(A B C)$ có diện tích là $S = 24" m"^2$. Để tối ưu hóa việc hấp thụ năng lượng mặt trời trong mùa đông, mặt kính $(A B C)$ được thiết kế hợp với mặt đất một góc nghiêng chính xác bằng $60^circ$. Hãy tính thể tích không gian không khí bên trong nhà kính $O.A B C$ (theo đơn vị $"m"^3$).],
  [$24$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let A = (-2, -1.5)
    let B = (3.5, -1.5)
    let C = (0.5, 3.5)
    let H = (0.75, -1.5) // Hinh chieu cua O tren AB
    
    line(A, B, stroke: 1pt)
    line(A, C, stroke: 1pt)
    line(B, C, stroke: 1pt)
    
    line(O, A, stroke: (dash: "dashed", paint: gray))
    line(O, B, stroke: (dash: "dashed", paint: gray))
    line(O, C, stroke: (dash: "dashed", paint: gray))
    
    line(O, H, stroke: (dash: "dashed", paint: rgb("2196F3")))
    line(C, H, stroke: (paint: rgb("2196F3")))
    
    content(O, [ $O$ ], anchor: "south", padding: 0.1)
    content(A, [ $A$ ], anchor: "east", padding: 0.1)
    content(B, [ $B$ ], anchor: "west", padding: 0.1)
    content(C, [ $C$ ], anchor: "south", padding: 0.1)
    content(H, [ $H$ ], anchor: "north", padding: 0.1)
  })
)[
  - **Bước 1: Áp dụng định lý hình chiếu diện tích**
    - Do ba mặt phẳng $(O A B), (O B C), (O C A)$ vuông góc với nhau tại $O$, hình chiếu vuông góc của tam giác $A B C$ lên mặt đất $(O A B)$ chính là tam giác $O A B$.
    - Gọi $alpha = 60^circ$ là góc nghiêng giữa mặt phẳng kính $(A B C)$ và mặt đất $(O A B)$. 
    - Theo định lý diện tích hình chiếu, ta có:
      $ S_{O A B} = S_{A B C} . cos alpha = 24 . cos(60^circ) = 24 . 1/2 = 12" m"^2. $
  
  - **Bước 2: Khai thác tính chất tam giác đáy**
    - Tam giác đáy $O A B$ vuông cân tại $O$, ta có:
      $ S_{O A B} = 1/2 O A . O B = 1/2 O A^2 = 12 \implies O A = O B = sqrt(24) = 2 sqrt(6)" m". $
    - Gọi $H$ là trung điểm của $A B$. Vì tam giác $O A B$ vuông cân tại $O$ nên $O H perp A B$.
    - Lại có $O C perp (O A B)$ nên $O C perp A B$. Suy ra $A B perp (O H C) \implies A B perp C H$.
    - Góc nhị diện giữa mặt kính $(A B C)$ và mặt đất $(O A B)$ chính là góc $angle O H C = 60^circ$.
  
  - **Bước 3: Tính chiều cao và Thể tích**
    - Độ dài đường trung tuyến ứng với cạnh huyền trong tam giác vuông cân $O A B$ là:
      $ O H = (O A) / sqrt(2) = (2 sqrt(6)) / sqrt(2) = 2 sqrt(3)" m". $
    - Xét tam giác vuông $O H C$ vuông tại $O$, chiều cao nhà kính $O C$ là:
      $ O C = O H . tan 60^circ = 2 sqrt(3) . sqrt(3) = 6" m". $
    - Thể tích không gian bên trong nhà kính (thể tích tứ diện $O.A B C$) là:
      $ V = 1/3 . S_{O A B} . O C = 1/3 . 12 . 6 = 24" m"^3. $
]

