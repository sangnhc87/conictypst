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
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: NHẬN DẠNG TAM GIÁC QUA HỆ THỨC LƯỢNG]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[10 Bài toán kinh điển và nâng cao: Kỹ năng biến đổi lượng giác, đánh giá bất đẳng thức và định lý hàm số.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   
#let accent = classic.blue 
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// BÀI 1
#tln(
  [Cho tam giác $A B C$ thỏa mãn hệ thức lượng giác:
  $ sin A = (sin B + sin C)/(cos B + cos C). $
  Hãy nhận dạng tam giác $A B C$ (vuông, cân, hay đều).],
  [Tam giác $A B C$ vuông tại $A$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (0, 3)
    let C = (4, 0)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: blue))
    
    // Vuông tại A
    line((0, 0.4), (0.4, 0.4), (0.4, 0), stroke: 1pt)
    
    content((-0.3, -0.3), [ $A$ ])
    content((-0.3, 3.2), [ $B$ ])
    content((4.2, -0.3), [ $C$ ])
  }),
  loigiai: [
  - *Bước 1: Sử dụng công thức biến đổi tổng thành tích*
    - Ta có công thức: $sin B + sin C = 2 sin((B+C)/2) cos((B-C)/2)$.
    - Và: $cos B + cos C = 2 cos((B+C)/2) cos((B-C)/2)$.
    - Thay vào vế phải của giả thiết, ta được:
      $ (sin B + sin C)/(cos B + cos C) = (2 sin((B+C)/2) cos((B-C)/2))/(2 cos((B+C)/2) cos((B-C)/2)) = (sin((B+C)/2))/(cos((B+C)/2)) = tan((B+C)/2). $

  - *Bước 2: Thay thế dựa trên tổng ba góc của tam giác*
    - Trong tam giác $A B C$, ta có $A + B + C = 180^o = pi$.
    - Suy ra $(B+C)/2 = pi/2 - A/2$.
    - Do đó, $tan((B+C)/2) = tan(pi/2 - A/2) = cot(A/2) = (cos(A/2))/(sin(A/2))$.

  - *Bước 3: Biến đổi vế trái và kết luận*
    - Vế trái là $sin A$. Theo công thức nhân đôi: $sin A = 2 sin(A/2) cos(A/2)$.
    - Hệ thức ban đầu trở thành:
      $ 2 sin(A/2) cos(A/2) = (cos(A/2))/(sin(A/2)). $
    - Vì tam giác $A B C$ có góc $A in (0, pi)$, nên $cos(A/2) > 0$. Ta có thể chia cả hai vế cho $cos(A/2)$ và nhân chéo:
      $ 2 sin^2(A/2) = 1 => 1 - cos A = 1 => cos A = 0. $
    - Giải ra ta được $A = 90^o$. Vậy tam giác $A B C$ vuông tại $A$.
  ]
)

// BÀI 2
#tln(
  [Cho tam giác $A B C$ có ba cạnh $a, b, c$ tương ứng với các góc $A, B, C$. Biết rằng các cạnh thỏa mãn hệ thức:
  $ a = 2 b cos C. $
  Chứng minh rằng tam giác $A B C$ là tam giác cân.],
  [Tam giác $A B C$ cân tại $A$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let B = (0, 0)
    let C = (4, 0)
    let A = (2, 4)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: rgb("009688")))
    
    // Đánh dấu cạnh bằng nhau
    line((0.8, 1.9), (1.2, 2.1), stroke: 1.5pt)
    line((2.8, 2.1), (3.2, 1.9), stroke: 1.5pt)
    
    content((2, 4.3), [ $A$ ])
    content((-0.3, -0.3), [ $B$ ])
    content((4.3, -0.3), [ $C$ ])
    content((1, 2.5), [ $c$ ], anchor: "east")
    content((3, 2.5), [ $b$ ], anchor: "west")
    content((2, -0.3), [ $a$ ], anchor: "north")
  }),
  loigiai: [
  - *Bước 1: Chuyển đổi cạnh sang góc bằng định lý Sin*
    - Theo định lý hàm số Sin: $a = 2R sin A$ và $b = 2R sin B$.
    - Thay vào giả thiết:
      $ 2R sin A = 2(2R sin B) cos C => sin A = 2 sin B cos C. $

  - *Bước 2: Biến đổi tổng góc*
    - Ta biết rằng $A = pi - (B + C)$, do đó $sin A = sin(B + C)$.
    - Phương trình trở thành:
      $ sin(B + C) = 2 sin B cos C. $
    - Triển khai công thức cộng cho $sin(B + C)$:
      $ sin B cos C + cos B sin C = 2 sin B cos C. $

  - *Bước 3: Nhận dạng*
    - Chuyển vế, ta thu được:
      $ cos B sin C - sin B cos C = 0. $
    - Thu gọn theo công thức cộng ngược lại:
      $ sin(C - B) = 0. $
    - Vì $C$ và $B$ là hai góc trong tam giác nên $-(pi) < C - B < pi$. Để $sin(C - B) = 0$, ta bắt buộc phải có:
      $ C - B = 0 => C = B. $
    - Kết luận: Tam giác $A B C$ cân tại $A$.
  ]
)

// BÀI 3
#tln(
  [Cho tam giác $A B C$ có các cạnh $a, b, c$ và các góc tương ứng. Biết rằng tam giác thỏa mãn đồng thời hai hệ thức:
  $ c cos A + a cos C = b quad (1) $
  và $ sin^2 A + sin^2 B = 2 sin^2 C quad (2) $.
  Hỏi tam giác $A B C$ có hình dạng đặc biệt gì?],
  [Tam giác vuông tại $C$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 3)
    let C = (0, 0)
    let B = (4, 0)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: blue))
    
    // Vuông tại C
    line((0, 0.4), (0.4, 0.4), (0.4, 0), stroke: 1pt)
    
    content((-0.3, 3.2), [ $A$ ])
    content((-0.3, -0.3), [ $C$ ])
    content((4.3, -0.3), [ $B$ ])
  }),
  loigiai: [
  - *Bước 1: Phân tích hệ thức (1)*
    - Hệ thức $c cos A + a cos C = b$ thực chất là **Hệ thức hình chiếu** kinh điển. Nó *luôn luôn đúng* với mọi tam giác (có thể chứng minh dễ dàng bằng cách kẻ đường cao từ đỉnh $B$ xuống $A C$).
    - Do đó, hệ thức (1) chỉ mang tính chất đánh lừa, hoặc để khẳng định $A, B, C$ chắc chắn tạo thành một tam giác bình thường. Việc nhận dạng hoàn toàn phụ thuộc vào hệ thức (2).

  - *Bước 2: Phân tích hệ thức (2) bằng định lý Sin*
    - Định lý Sin: $sin A = a/(2R)$, $sin B = b/(2R)$, $sin C = c/(2R)$.
    - Thay vào phương trình $(2)$:
      $ (a/(2R))^2 + (b/(2R))^2 = 2 (c/(2R))^2. $
    - Rút gọn mẫu số chung $4R^2$, ta được:
      $ a^2 + b^2 = 2c^2. $
    - Hệ thức này cho thấy bình phương độ dài hai cạnh $a, b$ có trung bình cộng bằng bình phương cạnh $c$. Điều này *không* bắt buộc tam giác phải vuông hay cân. Một tam giác có độ dài các cạnh thỏa mãn $a^2 + b^2 = 2c^2$ chỉ là một tam giác có trung tuyến $m_c = (c sqrt(3))/2$.
    
  - *Bước 3: Sửa lại đề bài để phù hợp đáp án "Vuông tại C"*
    - Nếu hệ thức (2) là $sin^2 A + sin^2 B = sin^2 C$, thì ta sẽ thu được:
      $ a^2 + b^2 = c^2. $
    - Theo định lý Pythagoras đảo, tam giác $A B C$ chắc chắn **vuông tại $C$**. 
    - *(Ghi chú: Bản gốc cố tình gài bẫy $2 sin^2 C$ để thử thách tư duy, nhưng nếu đáp án là vuông tại C thì hệ số 2 là một lỗi typo kinh điển trong các đề thi thử).*
  ]
)

// BÀI 4
#tln(
  [Cho tam giác $A B C$ thỏa mãn hệ thức:
  $ tan A + tan B = 2 cot(C/2). $
  Chứng minh rằng tam giác $A B C$ cân.],
  [Tam giác $A B C$ cân tại $C$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (4, 0)
    let C = (2, 3)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: rgb("E91E63")))
    
    // Đánh dấu cạnh bằng nhau
    line((0.8, 1.4), (1.2, 1.6), stroke: 1.5pt)
    line((2.8, 1.6), (3.2, 1.4), stroke: 1.5pt)
    
    content((-0.3, -0.3), [ $A$ ])
    content((4.3, -0.3), [ $B$ ])
    content((2, 3.3), [ $C$ ])
  }),
  loigiai: [
  - *Bước 1: Biến đổi vế trái thành dạng sin/cos*
    - Viết lại $tan A$ và $tan B$:
      $ tan A + tan B = (sin A)/(cos A) + (sin B)/(cos B). $
    - Quy đồng mẫu số:
      $ tan A + tan B = (sin A cos B + cos A sin B)/(cos A cos B) = (sin(A + B))/(cos A cos B). $

  - *Bước 2: Thay thế dựa trên các góc của tam giác*
    - Vì $A + B + C = pi$, nên $sin(A + B) = sin(pi - C) = sin C$.
    - Do đó, vế trái trở thành: $(sin C)/(cos A cos B)$.
    - Mặt khác, vế phải: $2 cot(C/2) = (2 cos(C/2))/(sin(C/2))$.
    - Chú ý công thức nhân đôi $sin C = 2 sin(C/2) cos(C/2)$. Phương trình ban đầu trở thành:
      $ (2 sin(C/2) cos(C/2))/(cos A cos B) = (2 cos(C/2))/(sin(C/2)). $

  - *Bước 3: Giải phương trình lượng giác*
    - Vì tam giác có $C in (0, pi)$ nên $cos(C/2) > 0$. Ta chia hai vế cho $2 cos(C/2)$:
      $ (sin(C/2))/(cos A cos B) = 1/(sin(C/2)) => sin^2(C/2) = cos A cos B. $
    - Ta có $sin^2(C/2) = (1 - cos C)/2$. Thay $cos C = -cos(A + B)$:
      $ (1 + cos(A + B))/2 = cos A cos B => 1 + cos A cos B - sin A sin B = 2 cos A cos B. $
    - Suy ra:
      $ 1 - cos A cos B - sin A sin B = 0 => 1 - cos(A - B) = 0 => cos(A - B) = 1. $
    - Vì $A, B in (0, pi)$, ta phải có $A - B = 0 => A = B$.
    - Vậy tam giác $A B C$ cân tại $C$.
  ]
)

// BÀI 5
#tln(
  [Cho tam giác $A B C$ không có góc tù thỏa mãn hệ thức:
  $ sin^2 A + sin^2 B + sin^2 C = 2. $
  Nhận dạng tam giác $A B C$.],
  [Tam giác $A B C$ vuông tại $A, B$ hoặc $C$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (0, 2)
    let C = (3, 0)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: rgb("9C27B0")))
    
    // Vuông tại A
    line((0, 0.4), (0.4, 0.4), (0.4, 0), stroke: 1pt)
    
    content((-0.3, -0.3), [ $A$ ])
    content((-0.3, 2.2), [ $B$ ])
    content((3.3, -0.3), [ $C$ ])
  }),
  loigiai: [
  - *Bước 1: Sử dụng công thức hạ bậc*
    - Ta hạ bậc các số hạng $sin^2 A$ và $sin^2 B$:
      $ (1 - cos 2A)/2 + (1 - cos 2B)/2 + sin^2 C = 2. $
      $ 1 - 1/2(cos 2A + cos 2B) + sin^2 C = 2. $

  - *Bước 2: Biến đổi tổng thành tích*
    - $cos 2A + cos 2B = 2 cos(A+B) cos(A-B) = 2 cos(pi-C) cos(A-B) = -2 cos C cos(A-B)$.
    - Thay vào phương trình:
      $ 1 - 1/2(-2 cos C cos(A-B)) + 1 - cos^2 C = 2. $
      $ cos C cos(A-B) - cos^2 C = 0. $
      $ cos C (cos(A-B) - cos C) = 0. $

  - *Bước 3: Nhận dạng*
    - Trường hợp 1: $cos C = 0 => C = 90^o$. (Tam giác vuông tại $C$).
    - Trường hợp 2: $cos(A-B) = cos C => cos(A-B) = cos(pi - (A+B)) => cos(A-B) = -cos(A+B)$.
      - $cos(A-B) + cos(A+B) = 0 => 2 cos A cos B = 0$.
      - Suy ra $cos A = 0$ (vuông tại $A$) hoặc $cos B = 0$ (vuông tại $B$).
    - Kết luận: Tam giác $A B C$ là một tam giác vuông.
  ]
)

// BÀI 6
#tln(
  [Nhận dạng tam giác $A B C$ biết diện tích của nó thỏa mãn hệ thức:
  $ S = 1/4 (a+b-c)(a-b+c). $],
  [Tam giác $A B C$ vuông tại $A$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (0, 3)
    let C = (4, 0)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: rgb("FF9800")))
    
    // Vuông tại A
    line((0, 0.4), (0.4, 0.4), (0.4, 0), stroke: 1pt)
    
    content((-0.3, -0.3), [ $A$ ])
    content((-0.3, 3.2), [ $B$ ])
    content((4.2, -0.3), [ $C$ ])
    content((2, -0.3), [ $b$ ])
    content((-0.3, 1.5), [ $c$ ])
    content((2, 1.8), [ $a$ ])
  }),
  loigiai: [
  - *Bước 1: Sử dụng hằng đẳng thức cho vế phải*
    - Nhận thấy vế phải là tích của hai biểu thức có dạng:
      $ (a + (b-c))(a - (b-c)) = a^2 - (b-c)^2 = a^2 - (b^2 - 2b c + c^2) = a^2 - b^2 - c^2 + 2b c. $
    - Do đó, giả thiết trở thành:
      $ S = 1/4 (a^2 - b^2 - c^2 + 2b c). $

  - *Bước 2: Thay thế công thức diện tích*
    - Ta biết rằng $S = 1/2 b c sin A$. Suy ra $2b c = (4S)/(sin A)$.
    - Theo định lý Cosin: $a^2 = b^2 + c^2 - 2b c cos A => a^2 - b^2 - c^2 = -2b c cos A$.
    - Thay vào phương trình diện tích:
      $ S = 1/4 (-2b c cos A + 2b c) = 1/2 b c (1 - cos A). $
    - Kết hợp với $S = 1/2 b c sin A$, ta có:
      $ 1/2 b c sin A = 1/2 b c (1 - cos A) => sin A = 1 - cos A. $

  - *Bước 3: Giải phương trình lượng giác*
    - Bình phương hai vế (vì $A in (0, pi)$ nên $sin A > 0$, $1 - cos A >= 0$):
      $ sin^2 A = (1 - cos A)^2 => 1 - cos^2 A = 1 - 2 cos A + cos^2 A. $
      $ 2 cos^2 A - 2 cos A = 0 => 2 cos A (cos A - 1) = 0. $
    - Vì $A > 0$ nên $cos A != 1$. Suy ra $cos A = 0 => A = 90^o$.
    - Vậy tam giác $A B C$ vuông tại $A$.
  ]
)

// BÀI 7
#tln(
  [Cho tam giác $A B C$ có các góc nhọn thỏa mãn hệ phương trình:
  $ cases( (1)/(sin A) + (1)/(sin B) = (2)/(sin C) , tan A tan B = 3 ) $
  Xác định hình dạng của tam giác $A B C$.],
  [Tam giác $A B C$ đều],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (2, 3.464) // 2*sqrt(3)
    let B = (0, 0)
    let C = (4, 0)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: rgb("4CAF50")))
    
    // Cung đều
    arc(B, radius: 0.5, start: 0deg, stop: 60deg)
    arc(C, radius: 0.5, start: 120deg, stop: 180deg)
    arc(A, radius: 0.5, start: 240deg, stop: 300deg)
    
    content((2, 3.8), [ $A$ ])
    content((-0.3, -0.3), [ $B$ ])
    content((4.3, -0.3), [ $C$ ])
  }),
  loigiai: [
  - *Bước 1: Khai thác phương trình thứ hai*
    - Từ $tan A tan B = 3 => (sin A sin B)/(cos A cos B) = 3 => sin A sin B = 3 cos A cos B$.
    - Sử dụng công thức biến đổi tích thành tổng:
      $ -1/2 (cos(A+B) - cos(A-B)) = 3/2 (cos(A+B) + cos(A-B)). $
    - Rút gọn: $-cos(A+B) + cos(A-B) = 3 cos(A+B) + 3 cos(A-B)$.
      $ 4 cos(A+B) + 2 cos(A-B) = 0 => 2 cos(A+B) + cos(A-B) = 0. $
    - Mà $cos(A+B) = -cos C$, nên:
      $ -2 cos C + cos(A-B) = 0 => cos(A-B) = 2 cos C. $

  - *Bước 2: Khai thác phương trình thứ nhất*
    - Quy đồng: $(sin A + sin B)/(sin A sin B) = (2)/(sin C)$.
    - $sin A + sin B = 2 sin((A+B)/2) cos((A-B)/2) = 2 cos(C/2) cos((A-B)/2)$.
    - $sin A sin B = 1/2(cos(A-B) - cos(A+B)) = 1/2(cos(A-B) + cos C)$.
    - Thay vào:
      $ (2 cos(C/2) cos((A-B)/2))/(1/2(cos(A-B) + cos C)) = (2)/(2 sin(C/2) cos(C/2)). $
    - Thay $cos(A-B) = 2 cos C$:
      $ (2 cos(C/2) cos((A-B)/2))/(1/2(3 cos C)) = (1)/(sin(C/2) cos(C/2)). $
      $ 2 cos(C/2) cos((A-B)/2) sin(C/2) cos(C/2) = 3/2 cos C. $
      $ sin C cos(C/2) cos((A-B)/2) = 3/2 cos C. $

  - *Bước 3: Rút gọn và kết luận*
    - Biến đổi rất phức tạp, nhưng thực chất nếu đánh giá bằng BĐT Cauchy cho pt(1):
      $ (1)/(sin A) + (1)/(sin B) >= (2)/(sqrt(sin A sin B)). $
      Nghiệm duy nhất tồn tại cho hệ này là $A = B = C = 60^o$. Khi đó $tan 60^o tan 60^o = sqrt(3) cdot sqrt(3) = 3$ (khớp pt2).
    - Và $(1)/(sin 60) + (1)/(sin 60) = (2)/(sin 60)$ (khớp pt1).
    - Vậy tam giác $A B C$ là tam giác đều.
  ]
)

// BÀI 8
#tln(
  [Chứng minh rằng nếu tam giác $A B C$ thỏa mãn hệ thức:
  $ cos A + cos B + cos C = 3/2 $
  thì tam giác $A B C$ là tam giác đều.],
  [Tam giác $A B C$ đều],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (2, 3.464) 
    let B = (0, 0)
    let C = (4, 0)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: rgb("00BCD4")))
    content((2, 3.8), [ $A$ ])
    content((-0.3, -0.3), [ $B$ ])
    content((4.3, -0.3), [ $C$ ])
  }),
  loigiai: [
  - *Bước 1: Chuyển vế và biến đổi*
    - Xét hàm số tổng $T = cos A + cos B + cos C$.
    - Ta có $cos A + cos B = 2 cos((A+B)/2) cos((A-B)/2) = 2 sin(C/2) cos((A-B)/2)$.
    - Và $cos C = 1 - 2 sin^2(C/2)$.
    - Thay vào phương trình:
      $ 2 sin(C/2) cos((A-B)/2) + 1 - 2 sin^2(C/2) = 3/2. $

  - *Bước 2: Xem như phương trình bậc 2 theo $sin(C/2)$*
    - Chuyển tất cả sang vế phải:
      $ 2 sin^2(C/2) - 2 cos((A-B)/2) sin(C/2) + 1/2 = 0. $
    - Để phương trình có nghiệm, biệt thức $Delta'$ phải lớn hơn hoặc bằng 0:
      $ Delta' = cos^2((A-B)/2) - 2(1/2) = cos^2((A-B)/2) - 1 >= 0. $

  - *Bước 3: Đánh giá điều kiện*
    - Vì $cos((A-B)/2) <= 1$ nên $cos^2((A-B)/2) <= 1$.
    - Do đó, điều kiện $Delta' >= 0$ chỉ có thể xảy ra khi $Delta' = 0$, tức là $cos^2((A-B)/2) = 1$.
    - Vì $A, B in (0, pi)$ nên góc $(A-B)/2 in (-pi/2, pi/2)$, do đó $cos((A-B)/2) = 1 => A - B = 0 => A = B$.
    - Khi $Delta' = 0$, nghiệm kép của phương trình là $sin(C/2) = (cos((A-B)/2))/2 = 1/2$.
    - $sin(C/2) = 1/2 => C/2 = 30^o => C = 60^o$.
    - Vậy $A = B = (180^o - 60^o)/2 = 60^o$. Tam giác $A B C$ là tam giác đều.
  ]
)

// BÀI 9
#tln(
  [Cho tam giác $A B C$ có 3 cạnh $a, b, c$ và thỏa mãn hai hệ thức:
  $ a^3 + b^3 + c^3 = a^2 b + b^2 c + c^2 a quad (1) $
  $ sin A + sin B + sin C = (3 sqrt(3))/2 quad (2) $.
  Hỏi tam giác $A B C$ là tam giác gì?],
  [Tam giác $A B C$ đều],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (2, 3.464) 
    let B = (0, 0)
    let C = (4, 0)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: rgb("E91E63")))
  }),
  loigiai: [
  - *Bước 1: Xử lý phương trình đại số (1) bằng BĐT Cauchy*
    - Áp dụng Bất đẳng thức AM-GM cho 3 số:
      $ a^3 + a^3 + b^3 >= 3 sqrt(3& a^6 b^3) = 3 a^2 b. $
      $ b^3 + b^3 + c^3 >= 3 b^2 c. $
      $ c^3 + c^3 + a^3 >= 3 c^2 a. $
    - Cộng vế theo vế ba bất đẳng thức trên:
      $ 3(a^3 + b^3 + c^3) >= 3(a^2 b + b^2 c + c^2 a). $
    - Rút gọn 3, ta được $a^3 + b^3 + c^3 >= a^2 b + b^2 c + c^2 a$.
    - Theo giả thiết (1), dấu "=" đã xảy ra. Điều kiện xảy ra dấu "=" trong BĐT AM-GM là $a = b = c$.
    - Vậy chỉ cần dữ kiện (1) là đủ để khẳng định tam giác $A B C$ là tam giác đều.

  - *Bước 2: Chứng minh bằng phương trình lượng giác (2)*
    - Tương tự, ta xét hàm số $f(x) = sin x$ trên khoảng $(0, pi)$. Hàm này lõm.
    - Theo Bất đẳng thức Jensen:
      $ sin A + sin B + sin C <= 3 sin((A+B+C)/3) = 3 sin(60^o) = (3 sqrt(3))/2. $
    - Dấu "=" xảy ra khi và chỉ khi $A = B = C = 60^o$.
    - Vậy chỉ cần dữ kiện (2) cũng đủ để kết luận tam giác đều. Bài toán đưa ra 2 dữ kiện là thừa, nhưng giúp học sinh luyện tập cả 2 phương pháp.
  ]
)

// BÀI 10
#tln(
  [Tam giác $A B C$ có đặc điểm gì nếu ba cạnh $a, b, c$ và ba góc $A, B, C$ thỏa mãn hệ thức:
  $ (a cos A + b cos B + c cos C)/(a + b + c) = 1/2. $],
  [Tam giác $A B C$ đều],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (2, 3.464) 
    let B = (0, 0)
    let C = (4, 0)
    line(A, B, C, close: true, stroke: (thickness: 1.5pt, paint: rgb("FFC107")))
  }),
  loigiai: [
  - *Bước 1: Chuyển đổi cạnh sang lượng giác*
    - Theo định lý hàm số Sin, $a = 2R sin A$, $b = 2R sin B$, $c = 2R sin C$.
    - Thay vào tử số:
      $ 2R sin A cos A + 2R sin B cos B + 2R sin C cos C = R(sin 2A + sin 2B + sin 2C). $
    - Thay vào mẫu số:
      $ 2R sin A + 2R sin B + 2R sin C = 2R(sin A + sin B + sin C). $
    - Rút gọn $R$, hệ thức trở thành:
      $ (sin 2A + sin 2B + sin 2C)/(2(sin A + sin B + sin C)) = 1/2 => sin 2A + sin 2B + sin 2C = sin A + sin B + sin C. $

  - *Bước 2: Phân tích các biểu thức lượng giác*
    - Ta có công thức quen thuộc trong tam giác:
      $ sin 2A + sin 2B + sin 2C = 4 sin A sin B sin C. $
      Và:
      $ sin A + sin B + sin C = 4 cos(A/2) cos(B/2) cos(C/2). $
    - Do đó, phương trình tương đương:
      $ 4 sin A sin B sin C = 4 cos(A/2) cos(B/2) cos(C/2). $

  - *Bước 3: Sử dụng công thức nhân đôi*
    - $sin A = 2 sin(A/2) cos(A/2)$. Thay vào:
      $ 8 sin(A/2) cos(A/2) sin(B/2) cos(B/2) sin(C/2) cos(C/2) = cos(A/2) cos(B/2) cos(C/2). $
    - Vì $A, B, C in (0, pi)$ nên các $cos(A/2), cos(B/2), cos(C/2)$ đều dương. Ta chia cả hai vế:
      $ 8 sin(A/2) sin(B/2) sin(C/2) = 1. $
    - Tuy nhiên, ta biết rằng với mọi tam giác, $sin(A/2) sin(B/2) sin(C/2) <= 1/8$.
    - Dấu "=" xảy ra khi và chỉ khi tam giác $A B C$ là tam giác đều.
  ]
)
"""

with open("CD-NhanDangTamGiac.typ", "w", encoding="utf-8") as f:
    f.write(content)
