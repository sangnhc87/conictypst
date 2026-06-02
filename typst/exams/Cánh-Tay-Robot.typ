
#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ"
#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm),
)

#show: stexgv-doc.with(
  doc-type: "book",
  title: "CHUYÊN ĐỀ: HHKG KHÓ",
  author: "GV Nguyễn Văn Sang",
  theme-color: classic.blue,
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
  stroke: (
    left: 6pt + classic.blue,
    top: 0.5pt + rgb("#dbe4f0"),
    right: 0.5pt + rgb("#dbe4f0"),
    bottom: 0.5pt + rgb("#dbe4f0"),
  ),
  inset: 16pt,
  radius: (right: 4pt),
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: GẤP KHÚC - CÁNH TAY ROBOT]

  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Đoạn Gấp Khúc Và Cánh Tay Robot.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

#tln(
  [
    Cho ba thanh cứng $A B, B C, C D$ gắn với nhau bằng hai bản lề tại $B$ và $C$, hai đầu còn lại được gắn cố định với sàn nhà tại hai bản lề $A$ và $D$. Biết rằng $A B = C D = 5$ m, $B C = 3$ m, $A D = 6$ m, mặt phẳng $(A B C D)$ luôn vuông góc với sàn nhà. Khi hai bản lề $B$ và $C$ di chuyển thì điểm $C$ cách sàn nhà một khoảng ngắn nhất bằng bao nhiêu centimet (làm tròn kết quả đến hàng đơn vị)?
  ],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
    
    // Tọa độ các điểm (mô phỏng trạng thái hình thang cân để giống hình gốc)
    // AD = 6, BC = 3. Hình chiếu của C và B xuống AD cách D và A một đoạn (6-3)/2 = 1.5
    // Chiều cao h = sqrt(5^2 - 1.5^2) = sqrt(22.75) ≈ 4.77
    let d = (0, 0)
    let a = (6, 0)
    let c = (1.5, 4.77)
    let b = (4.5, 4.77)

    // Vẽ đường sàn nhà
    line((-1.5, 0), (7.5, 0), name: "floor", stroke: 0.8pt)
    
    // Vẽ các thanh cứng (màu giống hình gốc)
    line(d, c, stroke: (paint: red, thickness: 1.5pt))
    line(c, b, stroke: (paint: blue, thickness: 1.5pt))
    line(b, a, stroke: (paint: blue, thickness: 1.5pt))

    // Vẽ các chốt bản lề
    circle(d, radius: 2pt, fill: rgb("2C3E50"))
    circle(a, radius: 2pt, fill: rgb("2C3E50"))
    circle(c, radius: 2pt, fill: rgb("2C3E50"))
    circle(b, radius: 2pt, fill: rgb("2C3E50"))

    // Gắn nhãn các điểm
    content(d, $D$, anchor: "south-east", padding: 5pt)
    content(a, $A$, anchor: "south-west", padding: 5pt)
    content(c, $C$, anchor: "east", padding: 5pt)
    content(b, $B$, anchor: "west", padding: 5pt)

    // Gắn nhãn kích thước
    content((0.75, 2.38), $5m$, anchor: "east", padding: 5pt)
    content((3, 4.77), $3m$, anchor: "north", padding: 5pt)
    content((5.25, 2.38), $5m$, anchor: "west", padding: 5pt)

    // Gắn nhãn chữ
    content((0, -0.4), [Cố định])
    content((6, -0.4), [Cố định])
    content((7, 0.3), [Sàn nhà])
  }),
  fig-pos: "center",
  [ 156 ],
  loigiai: [
    #ppgiai[
      - Khoảng cách từ $C$ đến sàn nhà chính là chiều cao của tam giác $A C D$ hạ từ đỉnh $C$ xuống cạnh đáy $A D$.
      - Để chiều cao này nhỏ nhất, diện tích tam giác $A C D$ phải nhỏ nhất. Ta dùng công thức Heron để khảo sát diện tích theo độ dài cạnh thay đổi $A C$.
      - Sử dụng bất đẳng thức tam giác cho $Delta A B C$ để tìm giới hạn độ dài của $A C$.
    ]
    
    Gọi khoảng cách từ $C$ đến sàn nhà (đường thẳng $A D$) là $h_C$. Trong $Delta A C D$, ta có:
    $ h_C = (2 S_(A C D)) / (A D) = (2 S_(A C D)) / 6 = S_(A C D) / 3. $
    Như vậy, $h_C$ đạt giá trị nhỏ nhất khi và chỉ khi diện tích $S_(A C D)$ đạt giá trị nhỏ nhất.
    
    Xét $Delta A B C$, theo bất đẳng thức tam giác, ta có:
    $ abs(A B - B C) <= A C <= A B + B C \
    <=> abs(5 - 3) <= A C <= 5 + 3 \
    <=> 2 <= A C <= 8. $
    
    Xét $Delta A C D$, gọi $p$ là nửa chu vi của tam giác:
    $ p = (A D + C D + A C) / 2 = (6 + 5 + A C) / 2 = (11 + A C) / 2. $
    Theo công thức Heron, bình phương diện tích tam giác $A C D$ là:
    $ S_(A C D)^2 &= p (p - A D) (p - C D) (p - A C) \
    &= (11 + A C)/2 dot (A C - 1)/2 dot (A C + 1)/2 dot (11 - A C)/2 \
    &= ((121 - A C^2)(A C^2 - 1)) / 16. $
    
    Đặt $t = A C^2$. Do $2 <= A C <= 8$ nên $t in [4; 64]$.
    Xét hàm số $f(t) = (121 - t)(t - 1) = -t^2 + 122t - 121$ trên đoạn $[4; 64]$.
    Đây là một parabol quay bề lõm xuống dưới (đỉnh tại $t = 61$), nên giá trị nhỏ nhất của $f(t)$ trên $[4; 64]$ sẽ đạt được tại một trong hai đầu mút:
    - Tại $t = 4$: $f(4) = (121 - 4)(4 - 1) = 117 dot 3 = 351$.
    - Tại $t = 64$: $f(64) = (121 - 64)(64 - 1) = 57 dot 63 = 3591$.
    
    Vậy $min f(t) = 351$ đạt được khi $t = 4 <=> A C = 2$ (m).
    Lúc này, ba điểm $A, C, B$ thẳng hàng và các thanh gấp lại với nhau, điều này hoàn toàn thỏa mãn các điều kiện vật lý của bài toán (các chốt B, C nằm cao hơn mặt sàn).
    
    Khi đó, giá trị nhỏ nhất của diện tích là $S_(A C D) = (sqrt(351)) / 4 = (3 sqrt(39)) / 4$.
    Suy ra khoảng cách ngắn nhất từ $C$ đến mặt sàn là:
    $ h_C = S_(A C D) / 3 = (sqrt(39)) / 4 text(" (m)"). $
    
    Đổi đơn vị ra centimet:
    $ h_C = (sqrt(39)) / 4 dot 100 = 25 sqrt(39) text(" (cm)") approx 156,1249 text(" (cm)"). $
    
    Làm tròn đến hàng đơn vị ta được $156$.
  ]
)


#tln(
  [
    Cho ba thanh cứng $A B, B C, C D$ gắn với nhau bằng hai bản lề tại $B$ và $C$, hai đầu còn lại được gắn cố định với sàn nhà tại hai bản lề $A$ và $D$. Biết rằng $A B = C D = 5$ m, $B C = 3$ m, $A D = 6$ m, mặt phẳng $(A B C D)$ luôn vuông góc với sàn nhà. Khi hai bản lề $B$ và $C$ di chuyển thì điểm $C$ cách sàn nhà một khoảng ngắn nhất bằng bao nhiêu centimet (làm tròn kết quả đến hàng đơn vị)?
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let d = (0, 0)
        let a = (6, 0)
        let c = (1.5, 4.77)
        let b = (4.5, 4.77)

        line((-1.5, 0), (7.5, 0), name: "floor", stroke: 0.8pt)
        
        line(d, c, stroke: (paint: red, thickness: 1.5pt))
        line(c, b, stroke: (paint: blue, thickness: 1.5pt))
        line(b, a, stroke: (paint: blue, thickness: 1.5pt))

        circle(d, radius: 2pt, fill: rgb("2C3E50"))
        circle(a, radius: 2pt, fill: rgb("2C3E50"))
        circle(c, radius: 2pt, fill: rgb("2C3E50"))
        circle(b, radius: 2pt, fill: rgb("2C3E50"))

        content(d, $D$, anchor: "south-east", padding: 5pt)
        content(a, $A$, anchor: "south-west", padding: 5pt)
        content(c, $C$, anchor: "east", padding: 5pt)
        content(b, $B$, anchor: "west", padding: 5pt)

        content((0.75, 2.38), $5m$, anchor: "east", padding: 5pt)
        content((3, 4.77), $3m$, anchor: "north", padding: 5pt)
        content((5.25, 2.38), $5m$, anchor: "west", padding: 5pt)

        content((0, -0.4), [Cố định])
        content((6, -0.4), [Cố định])
        content((7, 0.3), [Sàn nhà])
      })
    ]
  ],
  [ 156 ],
  loigiai: [
    Bài toán này có thể giải quyết bằng nhiều góc nhìn khác nhau. Dưới đây là 3 cách giải tiêu biểu:

    #text(fill: blue, weight: "bold")[Cách 1: Sử dụng Định lý hàm số Cosin (Ngắn gọn và bản chất lượng giác)]
    Gọi $alpha = angle A D C$. Khoảng cách từ $C$ đến mặt sàn chính là chiều cao hạ từ $C$ của $Delta A C D$:
    $ h_C = C D dot sin alpha = 5 sin alpha. $
    Để $h_C$ nhỏ nhất thì $sin alpha$ phải nhỏ nhất. Vì $C$ nằm trên mặt sàn nên $alpha in (0; pi)$. Trong khoảng này, $sin alpha$ càng nhỏ khi $cos alpha$ càng lớn (vì $sin alpha = sqrt(1 - cos^2 alpha)$).
    
    Áp dụng định lý hàm số cosin trong $Delta A C D$:
    $ A C^2 = A D^2 + C D^2 - 2 dot A D dot C D dot cos alpha = 6^2 + 5^2 - 2 dot 6 dot 5 dot cos alpha = 61 - 60 cos alpha \
    => cos alpha = (61 - A C^2) / 60. $
    Để $cos alpha$ lớn nhất thì độ dài $A C^2$ phải nhỏ nhất.
    
    Xét $Delta A B C$, theo bất đẳng thức tam giác, ta luôn có:
    $ A C >= abs(A B - B C) = abs(5 - 3) = 2 " (m)". $
    Dấu "$=$" xảy ra khi ba điểm $A, C, B$ thẳng hàng theo thứ tự đó (thanh bị gập lại).
    Vậy $min(A C) = 2 " m"$. Lúc này:
    $ cos alpha = (61 - 2^2) / 60 = 57/60 = 19/20. $
    Suy ra:
    $ sin alpha = sqrt(1 - (19/20)^2) = sqrt(39) / 20. $
    Khoảng cách ngắn nhất từ $C$ xuống sàn là:
    $ h_C = 5 dot (sqrt(39) / 20) = sqrt(39) / 4 " (m)" = 25 sqrt(39) " (cm)" approx 156 " (cm)". $
    
    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 2: Phương pháp Tọa độ (Hình học giải tích)]
    Chọn hệ trục tọa độ $O x y$ sao cho $D(0;0)$, $A(6;0)$. Sàn nhà là trục $O x$. 
    Giả sử tọa độ điểm $C(x; y)$ với $y > 0$. Khoảng cách cần tìm chính là tung độ $y$.
    
    Vì $C D = 5$ nên điểm $C$ nằm trên đường tròn tâm $D$, bán kính 5:
    $ x^2 + y^2 = 25 quad (1) $
    
    Điểm $B$ di chuyển trên đường tròn tâm $A(6;0)$ bán kính $A B = 5$. 
    Vì khoảng cách $B C = 3$ nên $C$ phải cách đường tròn $(A)$ một đoạn xa nhất là $5 + 3 = 8$ và gần nhất là $abs(5 - 3) = 2$.
    Nói cách khác, khoảng cách từ $C$ đến tâm $A$ phải thỏa mãn:
    $ A C >= 2 <=> (x - 6)^2 + y^2 >= 4 quad (2) $
    
    Thay $y^2 = 25 - x^2$ từ $(1)$ vào $(2)$, ta được:
    $ x^2 - 12x + 36 + (25 - x^2) >= 4 \
    <=> 61 - 12x >= 4 \
    <=> 12x <= 57 \
    <=> x <= 19/4. $
    
    Ta có $y^2 = 25 - x^2$. Để $y$ nhỏ nhất (với $y > 0$) thì $x^2$ phải lớn nhất, tức là $x$ lớn nhất.
    Chọn $x = 19/4$, khi đó:
    $ y^2 = 25 - (19/4)^2 = 25 - 361/16 = 39/16 \
    => y = sqrt(39) / 4 " (m)". $
    Đổi ra centimet ta được $h_C approx 156 " (cm)"$.

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 3: Sử dụng công thức Heron (Khảo sát hàm số)]
    Ký hiệu $h_C$ là chiều cao tam giác $A C D$. Ta có $h_C = (2 S_(A C D)) / (A D) = S_(A C D) / 3$.
    Nửa chu vi tam giác $A C D$: $p = (11 + A C) / 2$. 
    Bình phương diện tích tam giác $A C D$:
    $ S_(A C D)^2 = p(p-6)(p-5)(p-A C) = ((121 - A C^2)(A C^2 - 1)) / 16. $
    Như đã chứng minh ở Cách 1, độ dài $A C$ bị giới hạn: $2 <= A C <= 8$.
    Đặt $t = A C^2$ ($4 <= t <= 64$), xét hàm số: 
    $ f(t) = (121 - t)(t - 1) = -t^2 + 122t - 121. $
    Đỉnh parabol quay xuống dưới, nằm tại $t = 61$. Do đó giá trị nhỏ nhất trên đoạn $[4; 64]$ nằm ở một trong hai đầu mút:
    - Tại $t=4$: $f(4) = (121-4)(4-1) = 351$.
    - Tại $t=64$: $f(64) = (121-64)(64-1) = 3591$.
    Vậy $min f(t) = 351$ tại $t=4$.
    Khi đó $S_(A C D) = sqrt(351) / 4 = (3 sqrt(39)) / 4$.
    Suy ra khoảng cách $h_C = S_(A C D) / 3 = sqrt(39) / 4 " (m)" approx 156 " (cm)"$.
  ]
)

#tln(
  [
    Cho ba thanh cứng $A B, B C, C D$ gắn với nhau bằng hai bản lề tại $B$ và $C$, hai đầu còn lại được gắn cố định với sàn nhà tại hai bản lề $A$ và $D$. Biết rằng $A B = 5$ m, $B C = 2$ m, $C D = 3$ m và khoảng cách $A D = 6$ m. Biết mặt phẳng $(A B C D)$ luôn vuông góc với sàn nhà và các thanh luôn nằm phía trên mặt sàn. Khi hai bản lề $B$ và $C$ di chuyển, điểm $B$ cách sàn nhà một khoảng *lớn nhất* bằng bao nhiêu centimet?
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        // Chọn một trạng thái bất kỳ để vẽ hình minh họa (Ví dụ B(4,3) và C(6,3))
        let a = (0, 0)
        let d = (6, 0)
        let b = (4, 3)
        let c = (6, 3)

        // Sàn nhà
        line((-1.5, 0), (7.5, 0), name: "floor", stroke: 0.8pt)
        
        // Các thanh cứng
        line(a, b, stroke: (paint: blue, thickness: 1.5pt))
        line(b, c, stroke: (paint: red, thickness: 1.5pt))
        line(c, d, stroke: (paint: blue, thickness: 1.5pt))

        // Bản lề
        circle(a, radius: 2pt, fill: rgb("2C3E50"))
        circle(d, radius: 2pt, fill: rgb("2C3E50"))
        circle(b, radius: 2pt, fill: rgb("2C3E50"))
        circle(c, radius: 2pt, fill: rgb("2C3E50"))

        // Nhãn điểm
        content(a, $A$, anchor: "north-east", padding: 5pt)
        content(d, $D$, anchor: "north-west", padding: 5pt)
        content(b, $B$, anchor: "south-east", padding: 5pt)
        content(c, $C$, anchor: "south-west", padding: 5pt)

        // Kích thước
        content((2, 1.8), $5m$, anchor: "east", padding: 5pt)
        content((5, 3), $2m$, anchor: "south", padding: 5pt)
        content((6, 1.5), $3m$, anchor: "west", padding: 5pt)

        // Chú thích
        content((1, -0.4), [Cố định])
        content((7.5, -0.4), [Cố định])
        content((7, 0.3), [Sàn nhà])
      })
    ]
  ],
  [ 400 ],
  loigiai: [
    #ppgiai[
      Sự khác biệt của bài này là ta cần cực đại hóa đường cao hạ từ $B$ của tam giác $A B D$. Độ dài cạnh $B D$ sẽ bị giới hạn bởi sự vươn tối đa của hai thanh $B C$ và $C D$. 
    ]

    #text(fill: blue, weight: "bold")[Cách 1: Phương pháp Tọa độ (Hình học giải tích)]
    Chọn hệ trục tọa độ $O x y$ sao cho $A(0;0)$, $D(6;0)$. Sàn nhà là trục $O x$. 
    Giả sử tọa độ điểm $B(x; y)$ với $y > 0$. Khoảng cách từ $B$ đến sàn nhà chính là tung độ $y$.
    
    Vì thanh $A B = 5$ nên điểm $B$ luôn nằm trên đường tròn tâm $A$ bán kính 5:
    $ x^2 + y^2 = 25 quad (1) $
    
    Trong lúc đó, điểm $C$ đóng vai trò nối giữa $B$ và $D$. Theo bất đẳng thức tam giác đối với $Delta B C D$, khoảng cách $B D$ không thể vượt quá tổng chiều dài hai thanh $B C$ và $C D$:
    $ B D <= B C + C D = 2 + 3 = 5 \
    <=> (x - 6)^2 + y^2 <= 25 quad (2) $
    
    Thay $y^2 = 25 - x^2$ từ $(1)$ vào $(2)$, ta được:
    $ x^2 - 12x + 36 + 25 - x^2 <= 25 \
    <=> 36 - 12x <= 0 \
    <=> 12x >= 36 <=> x >= 3. $
    
    Từ $(1)$ ta có $y = sqrt(25 - x^2)$. Hàm số này nghịch biến khi $x > 0$. 
    Do đó, để $y$ đạt giá trị lớn nhất thì $x$ phải đạt giá trị nhỏ nhất. 
    Từ điều kiện $x >= 3$, ta chọn $x = 3$. Khi đó:
    $ y = sqrt(25 - 3^2) = sqrt(16) = 4 " (m)". $
    Vậy điểm $B$ cách sàn nhà tối đa $4 " m" = 400 " cm"$.

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 2: Sử dụng Định lý hàm số Cosin]
    Xét $Delta A B D$, gọi $alpha = angle D A B$. Khoảng cách từ $B$ đến sàn nhà là $h_B = A B dot sin alpha = 5 sin alpha$.
    Để $h_B$ lớn nhất thì $sin alpha$ phải lớn nhất. Vì $alpha in (0; pi)$, $sin alpha$ càng lớn khi $cos alpha$ càng nhỏ (tiến về $0$).
    
    Áp dụng định lý cosin trong $Delta A B D$:
    $ cos alpha = (A B^2 + A D^2 - B D^2) / (2 dot A B dot A D) = (25 + 36 - B D^2) / (2 dot 5 dot 6) = (61 - B D^2) / 60. $
    Để $cos alpha$ nhỏ nhất thì $B D^2$ phải lớn nhất.
    Như đã lập luận, cơ cấu $B-C-D$ bị giới hạn độ dài: $B D <= B C + C D = 5$.
    Dấu "$=$" xảy ra khi thanh $B C$ và $C D$ duỗi thẳng hàng.
    
    Vậy $max(B D) = 5$. Khi đó:
    $ cos alpha = (61 - 5^2) / 60 = 36 / 60 = 3 / 5. $
    Suy ra:
    $ sin alpha = sqrt(1 - (3/5)^2) = 4/5. $
    Khoảng cách lớn nhất từ $B$ đến sàn là $h_B = 5 dot (4/5) = 4 " (m)" = 400 " (cm)"$.

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 3: Sử dụng công thức Heron]
    Khoảng cách $h_B$ chính là chiều cao của $Delta A B D$. Ta có $h_B = (2 S_{A B D}) / (A D) = S_{A B D} / 3$.
    Để $h_B$ lớn nhất thì diện tích $S_{A B D}$ phải lớn nhất.
    
    Nửa chu vi $Delta A B D$ là $p = (11 + B D) / 2$. Bình phương diện tích là:
    $ S_{A B D}^2 = ((11 + B D)/2) ((B D - 1)/2) ((B D + 1)/2) ((11 - B D)/2) = ((121 - B D^2)(B D^2 - 1)) / 16. $
    Đặt $t = B D^2$. Từ điều kiện vật lý, $B D >= abs(C D - B C) = 1$ và $B D <= C D + B C = 5$. 
    Suy ra $t in [1; 25]$.
    
    Xét hàm số $f(t) = (121 - t)(t - 1) = -t^2 + 122t - 121$.
    Đây là parabol có đỉnh tại $t = 61$. Vì đoạn $[1; 25]$ nằm hoàn toàn bên trái đỉnh nên hàm số luôn đồng biến trên đoạn này.
    Do đó, $f(t)$ đạt giá trị lớn nhất tại $t = 25$ (khi $B D = 5$).
    
    Khi đó, $S_{A B D}^2 = (121 - 25)(25 - 1) / 16 = (96 dot 24) / 16 = 144 => S_{A B D} = 12$.
    Khoảng cách cực đại: $h_B = 12 / 3 = 4 " (m)" = 400 " (cm)"$.
    
    #nhanxet[Bài toán mới này đảo ngược tư duy (tìm Max thay vì Min, xét điểm B thay vì C) nhưng vẫn giữ được bộ khung logic giải bằng 3 phương pháp. Đặc biệt, bộ số Pitago (3-4-5) được ẩn giấu khéo léo khiến kết quả ra số nguyên 400 cực kỳ gọn gàng.]
  ]
)

#tln(
  [
    Cho một hệ thống gồm ba thanh cứng $A B, B C, C D$ được liên kết bản lề tại $B$ và $C$. Hai đầu $A$ và $D$ được gắn chặt xuống mặt sàn phẳng sao cho khoảng cách $A D = 14$ m. Biết chiều dài các thanh là $A B = 13$ m, $B C = 5$ m và $C D = 10$ m. Hệ thống luôn nằm trong một mặt phẳng vuông góc với sàn nhà và các thanh luôn nằm phía trên mặt sàn. Khi các khớp chuyển động, hãy tìm khoảng cách *lớn nhất* từ bản lề $B$ xuống mặt sàn (tính bằng đơn vị mét).
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        // Tọa độ thu nhỏ 1/2 để vừa trang: A(0,0), D(7,0), B(2.5, 6), C(4, 4)
        let a = (0, 0)
        let d = (7, 0)
        let b = (2.5, 6)
        let c = (4, 4)

        line((-1, 0), (8, 0), name: "floor", stroke: 0.8pt)
        
        line(a, b, stroke: (paint: blue, thickness: 1.5pt))
        line(b, c, stroke: (paint: red, thickness: 1.5pt))
        line(c, d, stroke: (paint: blue, thickness: 1.5pt))

        circle(a, radius: 2pt, fill: rgb("2C3E50"))
        circle(d, radius: 2pt, fill: rgb("2C3E50"))
        circle(b, radius: 2pt, fill: rgb("2C3E50"))
        circle(c, radius: 2pt, fill: rgb("2C3E50"))

        content(a, $A$, anchor: "north-east", padding: 5pt)
        content(d, $D$, anchor: "north-west", padding: 5pt)
        content(b, $B$, anchor: "south", padding: 5pt)
        content(c, $C$, anchor: "south-west", padding: 5pt)

        content((1.25, 3), $13m$, anchor: "east", padding: 5pt)
        content((3.25, 5), $5m$, anchor: "south-west", padding: 3pt)
        content((5.5, 2), $10m$, anchor: "west", padding: 5pt)
        content((3.5, -0.5), $A D = 14m$)
      })
    ]
  ],
  [ 12 ],
  loigiai: [
    Để giải quyết trọn vẹn, ta gọi khoảng cách từ $B$ đến sàn nhà là $h_B$. 

    #text(fill: blue, weight: "bold")[Cách 1: Góc nhìn Hình học giải tích (Tọa độ hóa)]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let a = (0, 0)
        let d = (7, 0)
        let b = (2.5, 6)
        let c = (4, 4)
        let h = (2.5, 0) // Hình chiếu của B

        // Trục tọa độ
        line((-1, 0), (8, 0), mark: (end: ">"), stroke: 0.8pt, name: "ox")
        line((0, -1), (0, 7), mark: (end: ">"), stroke: 0.8pt, name: "oy")
        content((8, -0.3), $x$)
        content((-0.3, 7), $y$)
        content((-0.3, -0.3), $O(A)$)

        line(a, b, stroke: (paint: blue, thickness: 1.5pt))
        line(b, c, stroke: (paint: red, thickness: 1.5pt))
        line(c, d, stroke: (paint: blue, thickness: 1.5pt))
        
        // Đường cao h_B
        line(b, h, stroke: (dash: "dashed", paint: green, thickness: 1pt))
        content((2.5, 3), $y$, anchor: "west", padding: 3pt)
        content(h, $H(x;0)$, anchor: "north", padding: 3pt)
        
        circle(a, radius: 2pt, fill: rgb("2C3E50"))
        circle(d, radius: 2pt, fill: rgb("2C3E50"))
        circle(b, radius: 2pt, fill: rgb("2C3E50"))
        content(d, $D(14;0)$, anchor: "north-west", padding: 3pt)
        content(b, $B(x;y)$, anchor: "south", padding: 5pt)
      })
    ]
    
    Chọn hệ trục tọa độ $O x y$ sao cho $A(0;0)$ và $D(14;0)$. Trục hoành $O x$ chứa sàn nhà. 
    Điểm $B(x; y)$ với $y > 0$. Khoảng cách cần tìm chính là tung độ $y$.
    
    Vì $A B = 13$ nên $B$ chuyển động trên quỹ đạo tròn tâm $A$:
    $ x^2 + y^2 = 13^2 = 169 => y^2 = 169 - x^2 quad (1) $
    
    Khoảng cách $B D$ bị khống chế bởi hai thanh $B C$ và $C D$. Theo bất đẳng thức tam giác, thanh không thể vươn dài hơn tổng chiều dài của chúng:
    $ B D <= B C + C D = 5 + 10 = 15. $
    Tương đương với khoảng cách tọa độ:
    $ (x - 14)^2 + y^2 <= 15^2 = 225 quad (2) $
    
    Thế $(1)$ vào $(2)$ ta được một bất phương trình một ẩn $x$:
    $ (x^2 - 28x + 196) + (169 - x^2) <= 225 \
    <=> -28x + 365 <= 225 \
    <=> 28x >= 140 <=> x >= 5. $
    
    Từ $(1)$ ta thấy hàm số $y = sqrt(169 - x^2)$ nghịch biến khi $x > 0$. Vậy $y$ đạt giá trị lớn nhất khi $x$ đạt giá trị nhỏ nhất có thể, tức là $x = 5$.
    Khi đó, $y = sqrt(169 - 5^2) = sqrt(144) = 12$.
    Vậy khoảng cách lớn nhất là $12$ mét.

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 2: Góc nhìn Lượng giác (Định lý hàm số Cosin)]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let a = (0, 0)
        let d = (7, 0)
        let b = (2.5, 6)
        let c = (4, 4)
        
        line((-1, 0), (8, 0), stroke: 0.8pt)
        line(a, b, stroke: (paint: blue, thickness: 1.5pt))
        // B, C, D duỗi thẳng
        line(b, d, stroke: (paint: red, thickness: 1.5pt))
        
        // Đánh dấu góc alpha
        arc((a.at(0) + 0.8, a.at(1)), start: 0deg, stop: 67.38deg, radius: 0.8, name: "ang")
        content((1.2, 0.5), $alpha$)
        
        // Đường cao
        line(b, (2.5, 0), stroke: (dash: "dashed", paint: green, thickness: 1pt))
        content((2.5, 3), $h_B$, anchor: "east", padding: 3pt)

        circle(a, radius: 2pt, fill: rgb("2C3E50"))
        circle(d, radius: 2pt, fill: rgb("2C3E50"))
        circle(b, radius: 2pt, fill: rgb("2C3E50"))
        
        content(a, $A$, anchor: "north", padding: 5pt)
        content(d, $D$, anchor: "north", padding: 5pt)
        content(b, $B$, anchor: "south", padding: 5pt)
      })
    ]

    Trong $Delta A B D$, gọi $alpha = angle D A B$. Chiều cao từ $B$ là $h_B = A B dot sin alpha = 13 sin alpha$.
    Để $h_B$ lớn nhất thì $sin alpha$ phải lớn nhất, đồng nghĩa với $cos alpha$ phải nhỏ nhất (vì $alpha in (0; pi)$).
    
    Áp dụng định lý hàm số cosin cho $Delta A B D$:
    $ cos alpha = (A B^2 + A D^2 - B D^2) / (2 dot A B dot A D) = (169 + 196 - B D^2) / (2 dot 13 dot 14) = (365 - B D^2) / 364. $
    Để $cos alpha$ đạt giá trị nhỏ nhất, biểu thức $B D^2$ phải đạt giá trị LỚN NHẤT.
    Như đã phân tích, cơ cấu $B-C-D$ vươn dài tối đa khi ba điểm thẳng hàng:
    $ max(B D) = B C + C D = 5 + 10 = 15. $
    
    Thế $B D = 15$ vào, ta có:
    $ cos alpha = (365 - 15^2) / 364 = (365 - 225) / 364 = 140 / 364 = 5 / 13. $
    Từ đó, tính được:
    $ sin alpha = sqrt(1 - (5/13)^2) = sqrt((144)/169) = 12/13. $
    Khoảng cách tối đa: $h_B = 13 dot (12/13) = 12$ mét.

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 3: Góc nhìn Hàm số (Công thức Heron tối ưu diện tích)]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let a = (0, 0)
        let d = (7, 0)
        let b = (2.5, 6)
        
        // Tô màu tam giác ABD
        line(a, b, d, close: true, fill: rgb(0, 0, 255, 30%), stroke: none)
        
        line((-1, 0), (8, 0), stroke: 0.8pt)
        line(a, b, stroke: (paint: blue, thickness: 1.5pt))
        line(b, d, stroke: (dash: "dotted", paint: red, thickness: 1.5pt))
        line(a, d, stroke: (thickness: 1.5pt))
        
        line(b, (2.5, 0), stroke: (dash: "dashed", paint: green, thickness: 1pt))
        
        content((3, 2), text(fill: blue, weight: "bold")[$S_(A B D)$ lớn nhất])
        content((5, 3.5), $B D in [5; 15]$)

        circle(a, radius: 2pt, fill: rgb("2C3E50"))
        circle(d, radius: 2pt, fill: rgb("2C3E50"))
        circle(b, radius: 2pt, fill: rgb("2C3E50"))
      })
    ]

    Chiều cao $h_B = (2 S_{A B D}) / (A D) = (2 S_{A B D}) / 14 = S_{A B D} / 7$. Để $h_B$ lớn nhất thì diện tích $S_{A B D}$ phải lớn nhất.
    
    Đặt $x = B D$. Giới hạn vật lý của thanh truyền cho biết: $abs(10 - 5) <= B D <= 10 + 5 => x in [5; 15]$.
    Nửa chu vi của $Delta A B D$ là $p = (13 + 14 + x) / 2 = (27 + x) / 2$.
    
    Bình phương diện tích theo công thức Heron:
    $ 16 S_{A B D}^2 &= 16 dot p(p - 13)(p - 14)(p - x) \
    &= (27 + x)(x + 1)(27 - x - 28)(27 - x) *text(" (chú ý rút gọn)") \
    &= (27 + x)(27 - x)(x + 1)(x - 1) = (729 - x^2)(x^2 - 1). $
    
    Đặt $t = x^2$ với $t in [25; 225]$. Ta xét hàm số $f(t) = -t^2 + 730t - 729$.
    Hàm số này là một Parabol có bề lõm hướng xuống, hoành độ đỉnh nằm tại $t = 730 / 2 = 365$.
    Vì khoảng $[25; 225]$ nằm hoàn toàn bên trái đỉnh $365$, nên hàm số $f(t)$ luôn đồng biến trên đoạn này.
    
    Do đó, $f(t)$ đạt GTLN tại $t = 225$ (khi $x = 15$).
    Khi đó: $16 S_{A B D}^2 = (729 - 225)(225 - 1) = 504 dot 224 = 112896$.
    $ => S_{A B D} = sqrt(112896 / 16) = sqrt(7056) = 84. $
    Khoảng cách tối đa: $h_B = 84 / 7 = 12$ mét.

    #nhanxet[Bằng cách thay đổi cấu trúc số liệu, bài toán không những đem lại kết quả nguyên đẹp mắt (12m) mà qua các hình vẽ, ta còn thấy rõ cách các lý thuyết toán học (Giải tích, Lượng giác, Đại số) cùng hội tụ để giải thích một hiện tượng cơ học. Đây chính là vẻ đẹp của Toán Lý kết hợp!]
  ]
)
#tln(
  [
    Cho một khung cơ cấu phẳng gồm 4 thanh cứng có độ dài lần lượt là $A B = 15$ cm, $B C = 20$ cm, $C D = 24$ cm và $D A = 7$ cm. Các thanh này được nối với nhau bằng các bản lề trơn tại $A, B, C, D$ tạo thành một tứ giác khép kín. Người ta có thể thay đổi hình dáng của khung này bằng cách bẻ gập các góc bản lề (đảm bảo tứ giác không bị tự cắt chéo). Hãy tính diện tích lớn nhất mà khung tứ giác $A B C D$ này có thể bao qua (tính bằng $text("cm")^2$).
    
    #align(center)[
      #cetz.canvas(length: 0.15cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        // Vẽ trạng thái ngẫu nhiên
        let a = (0, 0)
        let b = (5, 14.1)
        let c = (24, 7)
        let d = (4, -5.7)

        line(a, b, stroke: (paint: blue, thickness: 1.5pt))
        line(b, c, stroke: (paint: red, thickness: 1.5pt))
        line(c, d, stroke: (paint: blue, thickness: 1.5pt))
        line(d, a, stroke: (paint: red, thickness: 1.5pt))

        circle(a, radius: 4pt, fill: rgb("2C3E50"))
        circle(b, radius: 4pt, fill: rgb("2C3E50"))
        circle(c, radius: 4pt, fill: rgb("2C3E50"))
        circle(d, radius: 4pt, fill: rgb("2C3E50"))

        content(a, $A$, anchor: "east", padding: 5pt)
        content(b, $B$, anchor: "south", padding: 5pt)
        content(c, $C$, anchor: "west", padding: 5pt)
        content(d, $D$, anchor: "north", padding: 5pt)

        content((2.5, 7), $15$, anchor: "east", padding: 5pt)
        content((14, 11), $20$, anchor: "south", padding: 5pt)
        content((14, 0), $24$, anchor: "north-west", padding: 5pt)
        content((1.5, -3), $7$, anchor: "east", padding: 5pt)
      })
    ]
  ],
  [ 234 ],
  loigiai: [
    #text(fill: blue, weight: "bold")[Cách 1: Tư duy Bất đẳng thức & Nhận xét Pitago (Đỉnh cao nhạy bén)]
    
    #align(center)[
      #cetz.canvas(length: 0.15cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        // Trạng thái tối ưu (Góc vuông)
        let a = (0, 0)
        let c = (25, 0)
        let b = (9, 12)
        let d = (1.96, -6.72)

        // Tô màu 2 tam giác
        line(a, b, c, close: true, fill: rgb(0, 0, 255, 20%), stroke: none)
        line(a, d, c, close: true, fill: rgb(255, 0, 0, 20%), stroke: none)

        line(a, b, stroke: (paint: blue, thickness: 1.5pt))
        line(b, c, stroke: (paint: red, thickness: 1.5pt))
        line(c, d, stroke: (paint: blue, thickness: 1.5pt))
        line(d, a, stroke: (paint: red, thickness: 1.5pt))
        line(a, c, stroke: (dash: "dashed", thickness: 1pt)) // Đường chéo

        // Ký hiệu góc vuông
        line((7.8, 11.1), (8.7, 10.5), (9.9, 11.3), stroke: 0.8pt)
        line((2.8, -5.6), (3.9, -6.5), (3.0, -7.5), stroke: 0.8pt)

        circle(a, radius: 4pt, fill: rgb("2C3E50"))
        circle(b, radius: 4pt, fill: rgb("2C3E50"))
        circle(c, radius: 4pt, fill: rgb("2C3E50"))
        circle(d, radius: 4pt, fill: rgb("2C3E50"))
        
        content((12.5, 1), $A C = 25$, anchor: "south")
        content(a, $A$, anchor: "east", padding: 5pt)
        content(b, $B$, anchor: "south", padding: 5pt)
        content(c, $C$, anchor: "west", padding: 5pt)
        content(d, $D$, anchor: "north", padding: 5pt)
      })
    ]

    Chia tứ giác thành hai tam giác bằng đường chéo $A C$. Diện tích tứ giác là:
    $ S_{A B C D} = S_{A B C} + S_{A D C} = 1/2 A B dot B C sin B + 1/2 A D dot C D sin D. $
    Vì $sin B <= 1$ và $sin D <= 1$, ta có bất đẳng thức:
    $ S_{A B C D} <= 1/2 (15)(20) + 1/2 (7)(24) = 150 + 84 = 234. $
    
    Dấu "$=$" xảy ra khi và chỉ khi $angle B = 90^degree$ và $angle D = 90^degree$. Liệu cấu hình này có tồn tại trong thực tế không? Ta kiểm tra:
    - Nếu $angle B = 90^degree$, độ dài $A C^2 = 15^2 + 20^2 = 225 + 400 = 625 => A C = 25$.
    - Nếu $angle D = 90^degree$, độ dài $A C^2 = 7^2 + 24^2 = 49 + 576 = 625 => A C = 25$.
    
    Thật kỳ diệu! Cả hai góc có thể cùng vuông vì chúng chia sẻ chung một đường chéo $A C = 25$ (đây là sự kết hợp của 2 bộ số Pitago $15-20-25$ và $7-24-25$). 
    Vậy diện tích lớn nhất là $234 text(" cm")^2$.

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 2: Tư duy Biến đổi Lượng giác (Sức mạnh của Đại số)]
    
    #align(center)[
      #cetz.canvas(length: 0.15cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        // Vẽ trạng thái tổng quát để chứng minh
        let a = (0, 0)
        let b = (7, 13)
        let c = (25, 0)
        let d = (5, -4)

        line(a, b, stroke: (paint: blue, thickness: 1.5pt))
        line(b, c, stroke: (paint: red, thickness: 1.5pt))
        line(c, d, stroke: (paint: blue, thickness: 1.5pt))
        line(d, a, stroke: (paint: red, thickness: 1.5pt))
        line(a, c, stroke: (dash: "dashed", thickness: 1pt))

        content((4, 7), $a=15$)
        content((17, 7), $b=20$)
        content((15, -3), $c=24$)
        content((2.5, -3), $d=7$)
        content(b, $B$, anchor: "south", padding: 5pt)
        content(d, $D$, anchor: "north", padding: 5pt)
      })
    ]

    Nếu bạn không nhận ra bộ số Pitago, ta dùng định lý Cosin cho $Delta A B C$ và $Delta A D C$:
    $ A C^2 = 15^2 + 20^2 - 2(15)(20) cos B = 625 - 600 cos B $
    $ A C^2 = 7^2 + 24^2 - 2(7)(24) cos D = 625 - 336 cos D $
    Từ đó suy ra phương trình ràng buộc: $600 cos B = 336 cos D quad (*)$

    Ta có phương trình diện tích: $4S = 2(15)(20) sin B + 2(7)(24) sin D = 600 sin B + 336 sin D quad (*)$
    
    Bình phương hai phương trình $(*)$ và $(*)$ rồi cộng lại:
    $ (4S)^2 + 0^2 &= (600 sin B + 336 sin D)^2 + (600 cos B - 336 cos D)^2 \
    16S^2 &= 600^2(sin^2 B + cos^2 B) + 336^2(sin^2 D + cos^2 D) + 2(600)(336)(sin B sin D - cos B cos D) \
    16S^2 &= 360000 + 112896 - 403200 cos(B + D) \
    16S^2 &= 472896 - 403200 cos(B + D). $
    
    Để $16S^2$ đạt giá trị lớn nhất, thành phần trừ đi $- 403200 cos(B + D)$ phải là lớn nhất. Điều này xảy ra khi $cos(B + D) = -1 <=> B + D = 180^degree$.
    $ 16 S^2_max = 472896 - 403200(-1) = 876096 \
    => S_max = sqrt(876096 / 16) = sqrt(54756) = 234. $

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 3: Siêu công cụ Bretschneider (Tứ giác nội tiếp)]

    #align(center)[
      #cetz.canvas(length: 0.15cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let a = (0, 0)
        let c = (25, 0)
        let b = (9, 12)
        let d = (1.96, -6.72)
        let center = (12.5, 0)

        // Đường tròn ngoại tiếp
        circle(center, radius: 12.5, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

        line(a, b, stroke: (paint: blue, thickness: 1.5pt))
        line(b, c, stroke: (paint: red, thickness: 1.5pt))
        line(c, d, stroke: (paint: blue, thickness: 1.5pt))
        line(d, a, stroke: (paint: red, thickness: 1.5pt))
        
        circle(a, radius: 4pt, fill: rgb("2C3E50"))
        circle(b, radius: 4pt, fill: rgb("2C3E50"))
        circle(c, radius: 4pt, fill: rgb("2C3E50"))
        circle(d, radius: 4pt, fill: rgb("2C3E50"))
        circle(center, radius: 4pt, fill: gray)

        content(center, $I$, anchor: "south-east")
        content((12.5, 14), text(fill: gray, weight: "bold")[Tứ giác nội tiếp đường tròn], anchor: "south")
      })
    ]

    Trong hình học phẳng, diện tích của một tứ giác bất kỳ được tính bằng công thức Bretschneider (mở rộng của công thức Heron):
    $ S = sqrt((p-a)(p-b)(p-c)(p-d) - a b c d cos^2((B+D)/2)) $
    Trong đó, $p$ là nửa chu vi: $p = (15 + 20 + 24 + 7) / 2 = 33$.
    
    Vì $a b c d cos^2((B+D)/2) >= 0$, diện tích tứ giác đạt giá trị lớn nhất khi cụm này bằng $0$, tức là $cos((B+D)/2) = 0 <=> B+D = 180^degree$. Nói cách khác, tứ giác có diện tích lớn nhất chính là *tứ giác nội tiếp được trong đường tròn*.
    
    Khi đó, công thức thu gọn thành công thức Brahmagupta:
    $ S_max &= sqrt((33 - 15)(33 - 20)(33 - 24)(33 - 7)) \
    &= sqrt(18 dot 13 dot 9 dot 26) \
    &= sqrt((9 dot 2) dot 13 dot 9 dot (13 dot 2)) \
    &= sqrt(9^2 dot 2^2 dot 13^2) = 9 dot 2 dot 13 = 234 text(" cm")^2. $
    
    #nhanxet[Bài toán mang lại một định lý vật lý/hình học rất thú vị: *"Trong tất cả các hình đa giác tạo từ các thanh cứng cho trước, đa giác có thể bọc được một hình tròn (nội tiếp đường tròn) sẽ tạo ra khoảng không gian (diện tích) rộng lớn nhất."*]
  ]
)
#tln(
  [
    Một vòm che di động (dùng cho các sự kiện ngoài trời) được thiết kế dưới dạng một khung cơ cấu phẳng gồm 3 thanh cứng $A B, B C, C D$ nối với nhau bằng các bản lề trơn. 
    Biết thanh mái $B C$ có chiều dài $17$ m và luôn được giữ song song với mặt đất nhờ hệ thống thủy lực. Hai thanh chống $A B$ và $C D$ có cùng chiều dài $10$ m. 
    Đầu $A$ được gắn cố định trên mặt đất, đầu $D$ được gắn vào một con trượt có thể di chuyển dọc theo mặt đất (đường thẳng đi qua $A$).
    Người ta muốn điều chỉnh khoảng cách $A D$ sao cho *diện tích không gian bên dưới vòm che* (chính là diện tích hình thang cân $A B C D$) đạt giá trị *LỚN NHẤT* nhằm chứa được nhiều thiết bị nhất.
    Hỏi khoảng cách $A D$ lúc đó là bao nhiêu mét?
    
    #align(center)[
      #cetz.canvas(length: 0.3cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let a = (0, 0)
        let d = (25, 0)
        let b = (4, 9.16)
        let c = (21, 9.16)

        // Sàn nhà
        line((-3, 0), (28, 0), name: "floor", stroke: 1pt)

        // Khung vòm
        line(a, b, stroke: (paint: blue, thickness: 2pt))
        line(b, c, stroke: (paint: red, thickness: 2pt))
        line(c, d, stroke: (paint: blue, thickness: 2pt))

        // Tô màu không gian bên dưới
        line(a, b, c, d, close: true, fill: rgb(0, 255, 0, 15%), stroke: none)

        // Bản lề và thanh trượt
        circle(a, radius: 3pt, fill: rgb("2C3E50"))
        circle(b, radius: 3pt, fill: rgb("2C3E50"))
        circle(c, radius: 3pt, fill: rgb("2C3E50"))
        rect((24.5, -0.5), (25.5, 0.5), fill: orange, stroke: black) // Con trượt tại D

        content(a, $A$, anchor: "north-east", padding: 5pt)
        content(b, $B$, anchor: "south-east", padding: 5pt)
        content(c, $C$, anchor: "south-west", padding: 5pt)
        content((25, -1), $D$, anchor: "north", padding: 5pt)

        content((2, 5), text(fill: blue)[$10$], anchor: "east", padding: 5pt)
        content((12.5, 9.16), text(fill: red)[$17$], anchor: "south", padding: 5pt)
        content((23, 5), text(fill: blue)[$10$], anchor: "west", padding: 5pt)
        
        content((12.5, 4), text(fill: green, weight: "bold")[$S_(max) = ?$])
      })
    ]
  ],
  [ 25 ],
  loigiai: [
    Nhiều người sẽ lầm tưởng dựng đứng thanh $A B, C D$ để tạo thành hình chữ nhật ($A D = 17$) sẽ cho diện tích lớn nhất ($170 text(" m")^2$). Tuy nhiên, Toán học chứng minh điều ngược lại!

    #text(fill: blue, weight: "bold")[Cách 1: Khảo sát hàm đa thức (Tư duy Đại số)]
    
    #align(center)[
      #cetz.canvas(length: 0.3cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let a = (0, 0)
        let d = (25, 0)
        let b = (4, 9.16)
        let c = (21, 9.16)
        let h1 = (4, 0)
        let h2 = (21, 0)

        line((-2, 0), (27, 0), stroke: 1pt)
        line(a, b, c, d, stroke: (thickness: 1.5pt))
        
        // Đường cao
        line(b, h1, stroke: (dash: "dashed", paint: gray))
        line(c, h2, stroke: (dash: "dashed", paint: gray))
        
        content((2, 0), $x$, anchor: "north", padding: 3pt)
        content((12.5, 0), $17$, anchor: "north", padding: 3pt)
        content((23, 0), $x$, anchor: "north", padding: 3pt)
        content((4, 4.5), $h$, anchor: "east", padding: 3pt)

        content(h1, $H$, anchor: "north-west", padding: 3pt)
        content(h2, $K$, anchor: "north-east", padding: 3pt)
      })
    ]

    Gọi hình chiếu vuông góc của $B$ và $C$ xuống mặt đất lần lượt là $H$ và $K$.
    Do hình thang cân, ta đặt độ dài đoạn vươn ngang $A H = K D = x$ (với $0 < x < 10$).
    Chiều cao của vòm che là $h = B H = sqrt(A B^2 - A H^2) = sqrt(100 - x^2)$.
    Đáy lớn của hình thang: $A D = x + 17 + x = 2x + 17$.
    
    Hàm số tính diện tích hình thang theo $x$:
    $ S(x) &= 1/2 (B C + A D) dot h = 1/2 (17 + 2x + 17) sqrt(100 - x^2) \
    &= (x + 17) sqrt(100 - x^2). $
    
    Lấy đạo hàm của hàm số $S(x)$:
    $ S'(x) &= 1 dot sqrt(100 - x^2) + (x + 17) dot (-x) / (sqrt(100 - x^2)) \
    &= (100 - x^2 - x^2 - 17x) / (sqrt(100 - x^2)) = (-2x^2 - 17x + 100) / (sqrt(100 - x^2)). $
    
    Cho $S'(x) = 0 <=> 2x^2 + 17x - 100 = 0$.
    Giải phương trình bậc hai này ($Delta = 17^2 - 4(2)(-100) = 1089 = 33^2$), ta được:
    $ x = (-17 + 33) / 4 = 4 quad text("(nhận)") quad text("hoặc") quad x = (-17 - 33) / 4 = -12.5 quad text("(loại)"). $
    
    Vậy diện tích đạt cực đại khi $x = 4$ mét. 
    Lúc này khoảng cách $A D = 2x + 17 = 2(4) + 17 = 25$ mét.
    *(Diện tích tối đa đạt được là $S = (4+17)sqrt(100-16) = 21 sqrt(84) approx 192.46 text(" m")^2$, lớn hơn hẳn so với $170 text(" m")^2$ của hình chữ nhật).*

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 2: Khảo sát lượng giác (Tư duy Vật lý)]
    Gọi $alpha$ là góc nâng của tay đòn $A B$ so với mặt đất ($0 < alpha < 90^degree$).
    Ta có chiều cao $h = 10 sin alpha$ và đoạn vươn $A H = 10 cos alpha$.
    Đáy lớn $A D = 17 + 20 cos alpha$.
    Diện tích vòm:
    $ S(alpha) = (17 + 10 cos alpha) 10 sin alpha = 170 sin alpha + 100 sin alpha cos alpha = 170 sin alpha + 50 sin 2alpha. $
    
    Đạo hàm theo $alpha$:
    $ S'(alpha) &= 170 cos alpha + 100 cos 2alpha = 170 cos alpha + 100(2 cos^2 alpha - 1) \
    &= 200 cos^2 alpha + 170 cos alpha - 100. $
    Cho $S'(alpha) = 0 <=> 20 cos^2 alpha + 17 cos alpha - 10 = 0$.
    Bấm máy giải ra $cos alpha = 0.4$ (nhận) hoặc $cos alpha = -1.25$ (loại).
    
    Với $cos alpha = 0.4$, khoảng cách $A D = 17 + 20(0.4) = 17 + 8 = 25$ mét.

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 3: Cú lừa từ Hình học phẳng (Đẹp ngỡ ngàng!)]

    #align(center)[
      #cetz.canvas(length: 0.3cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let a = (0, 0)
        let d = (25, 0)
        let b = (4, 9.16)
        let c = (21, 9.16)
        let h1 = (4, 0)

        line((-2, 0), (27, 0), stroke: 1pt)
        line(a, b, c, d, stroke: (thickness: 1.5pt))
        
        // Đường chéo BD và nét vuông góc
        line(b, d, stroke: (dash: "dashed", paint: purple, thickness: 1.5pt))
        line(a, d, stroke: 1.5pt)
        
        // Ký hiệu góc vuông tại B
        line((3.3, 8.5), (4.2, 8.1), (4.9, 8.8), stroke: 1pt)

        // Đường cao
        line(b, h1, stroke: (paint: gray))
        content(h1, $H$, anchor: "north", padding: 3pt)
        
        content(a, $A$, anchor: "north", padding: 3pt)
        content(d, $D$, anchor: "north", padding: 3pt)
        content(b, $B$, anchor: "south-east", padding: 5pt)
      })
    ]

    Trong hình học có một định lý kinh điển ít người biết: *"Hình thang cân có 3 cạnh cố định đạt diện tích lớn nhất khi đường chéo vuông góc với cạnh bên"*.
    Thật vậy, hãy giả sử diện tích đang ở trạng thái lớn nhất, tức là $angle A B D = 90^degree$.
    
    Khi $Delta A B D$ vuông tại $B$ và có đường cao $B H$, theo hệ thức lượng trong tam giác vuông, ta phải có:
    $ A B^2 = A H dot A D $
    
    Hãy kiểm tra xem hệ thức này dẫn ta đến đâu. 
    Biết $A B = 10$, $A H = x$ và $A D = 2x + 17$. Thay vào ta được:
    $ 10^2 = x(2x + 17) <=> 2x^2 + 17x - 100 = 0. $
    Trời ơi! Đây chính xác là phương trình đạo hàm $S'(x) = 0$ ta tìm được ở Cách 1!
    Vậy không cần dùng đến một giọt đạo hàm nào, chỉ cần nhớ tính chất "Đường chéo vuông góc cạnh bên", ta lập tức nhẩm ra $x=4$ và chốt luôn đáp án $A D = 2(4)+17 = 25$.

    #nhanxet[Bài toán là minh chứng xuất sắc cho thấy Đạo hàm và Hình học luôn có một sợi dây liên kết vô hình. Sự hội tụ của các phương pháp ở phương trình $2x^2 + 17x - 100 = 0$ chính là cảm giác thăng hoa nhất khi học Toán!]
  ]
)
#tln(
  [
    Trong một kho hàng tự động, một hệ thống cánh tay robot dạng thanh trượt thẳng ($A B$) được thiết kế để di chuyển tựa dọc theo vách tường thẳng đứng và mặt sàn nằm ngang. 
    Ở góc tường có đặt cố định một khối máy quét mã vạch hình hộp chữ nhật. Mặt cắt ngang của khối máy này có chiều rộng là $27$ cm và chiều cao là $64$ cm. 
    Trong suốt quá trình trượt, thanh robot luôn phải chạm vào vách tường tại $A$, chạm sàn tại $B$ và tì lên góc $M$ của khối máy quét. Hãy tính chiều dài *ngắn nhất* mà thanh robot $A B$ cần có để không bị rơi khỏi khối máy (tính bằng centimet).
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        // Tọa độ đã thu nhỏ 1/10 (2.7 và 6.4)
        let a = (0, 10)
        let b = (7.5, 0)
        let m = (2.7, 6.4)

        // Tường và sàn
        line((0, 11), (0, 0), (9, 0), stroke: 1.5pt, name: "axes")
        content((0, 11.5), $y text(" (Tường)")$)
        content((9.5, 0), $x text(" (Sàn)")$)
        content((-0.4, -0.4), $O$)

        // Khối máy
        rect((0,0), m, fill: rgb(255, 165, 0, 50%), stroke: (paint: orange, thickness: 1.5pt))
        
        // Thanh robot
        line(a, b, stroke: (paint: blue, thickness: 2.5pt))

        // Điểm tì
        circle(a, radius: 3pt, fill: rgb("2C3E50"))
        circle(b, radius: 3pt, fill: rgb("2C3E50"))
        circle(m, radius: 3pt, fill: red)

        content(a, $A$, anchor: "east", padding: 5pt)
        content(b, $B$, anchor: "north", padding: 5pt)
        content(m, $M$, anchor: "south-west", padding: 5pt)

        content((1.35, 3.2), text(fill: orange.darken(20%), weight: "bold")[Khối máy])
        
        // Ghi chú kích thước
        line((2.7, -0.2), (2.7, -0.4), stroke: 0.5pt)
        content((1.35, -0.5), $27 text(" cm")$)
        line((-0.2, 6.4), (-0.4, 6.4), stroke: 0.5pt)
        content((-0.8, 3.2), $64 text(" cm")$)
      })
    ]
  ],
  [ 125 ],
  loigiai: [
    Gọi $A(0; y)$ và $B(x; 0)$ là tọa độ hai đầu của thanh robot (với $x > 27$ và $y > 64$).
    Khối máy đặt ở góc tường nên tọa độ điểm tì là $M(27; 64)$.
    Vì $A, M, B$ thẳng hàng nên theo định lý Thales (hoặc phương trình đoạn chắn), ta luôn có mối liên hệ:
    $ 27/x + 64/y = 1 quad (*) $
    Mục tiêu của chúng ta là tìm giá trị nhỏ nhất của chiều dài thanh robot $L = sqrt(x^2 + y^2)$.

    #text(fill: blue, weight: "bold")[Cách 1: Góc nhìn Lượng giác (Cách của Kỹ sư Robot)]
    
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let a = (0, 10)
        let b = (7.5, 0)
        let m = (2.7, 6.4)
        
        line((0, 11), (0, 0), (9, 0), stroke: 1pt)
        rect((0,0), m, fill: rgb(255, 165, 0, 20%), stroke: orange)
        line(a, b, stroke: (paint: blue, thickness: 2pt))
        
        // Đường đứt nét tạo tam giác
        line((2.7, 0), m, stroke: (dash: "dashed"))
        line((0, 6.4), m, stroke: (dash: "dashed"))
        
        // Góc alpha
        arc((b.at(0) - 1.5, b.at(1)), start: 180deg, stop: 126.87deg, radius: 1.5)
        content((5.5, 0.5), $alpha$)
        arc((m.at(0) - 1.5, m.at(1)), start: 180deg, stop: 126.87deg, radius: 1.5)
        content((1.2, 6.9), $alpha$)
        
        content((1.35, 6.4), $27$, anchor: "south", padding: 3pt)
        content((2.7, 3.2), $64$, anchor: "west", padding: 3pt)
        content((1.35, 8.2), text(fill: blue)[$L_1$], anchor: "south-west")
        content((5.1, 3.2), text(fill: blue)[$L_2$], anchor: "south-west")
      })
    ]

    Gọi $alpha$ là góc tạo bởi thanh robot và mặt sàn ($0 < alpha < 90^degree$).
    Thanh robot bị điểm $M$ chia làm 2 đoạn $L_1 = A M$ và $L_2 = M B$.
    Xét các tam giác vuông, ta dễ dàng thấy:
    $ L_1 = 27 / (cos alpha) quad text("và") quad L_2 = 64 / (sin alpha). $
    Chiều dài tổng cộng của thanh là hàm số theo góc $alpha$:
    $ L(alpha) = 27 / (cos alpha) + 64 / (sin alpha). $
    Đạo hàm hàm số:
    $ L'(alpha) = (27 sin alpha) / (cos^2 alpha) - (64 cos alpha) / (sin^2 alpha). $
    Cho $L'(alpha) = 0 <=> (27 sin alpha) / (cos^2 alpha) = (64 cos alpha) / (sin^2 alpha) <=> sin^3 alpha / cos^3 alpha = 64/27 <=> tan^3 alpha = 64/27. $
    Suy ra $tan alpha = 4/3$. 
    Khi $tan alpha = 4/3$, ta có một tam giác Pitago kinh điển (cạnh 3-4-5), do đó $sin alpha = 4/5$ và $cos alpha = 3/5$.
    Thế vào hàm $L$:
    $ L_(min) = 27 / (3/5) + 64 / (4/5) = 45 + 80 = 125 text(" (cm)"). $

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 2: Góc nhìn Giải tích (Cách của Học sinh Giỏi)]
    
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
        let a = (0, 10)
        let b = (7.5, 0)
        let m = (2.7, 6.4)
        
        line((0, 11), (0, 0), (9, 0), stroke: 1pt)
        rect((0,0), m, fill: rgb(255, 165, 0, 20%), stroke: orange)
        line(a, b, stroke: (paint: blue, thickness: 2pt))
        
        content(a, $A(0; y)$, anchor: "east", padding: 5pt)
        content(b, $B(x; 0)$, anchor: "north", padding: 5pt)
        content(m, $M(27; 64)$, anchor: "south-west", padding: 5pt)
      })
    ]

    Từ phương trình ràng buộc $27/x + 64/y = 1$, ta rút được:
    $ 64/y = 1 - 27/x = (x - 27)/x => y = (64x)/(x - 27). $
    Bình phương chiều dài thanh robot là một hàm số theo $x$:
    $ f(x) = L^2 = x^2 + y^2 = x^2 + (64x)^2 / (x - 27)^2 = x^2 ( 1 + 4096 / (x - 27)^2 ). $
    Để tìm giá trị nhỏ nhất, ta đạo hàm $f'(x)$ và cho bằng $0$. Tuy nhiên việc lấy đạo hàm trực tiếp hơi cồng kềnh. Ta có thể đặt ẩn phụ $t = x - 27$ (với $t > 0$). Khi đó $x = t + 27$ và $y = 64(t+27)/t = 64 + 1728/t$.
    Dù biến đổi thế nào, khi giải phương trình đạo hàm ta cũng sẽ thu được nghiệm duy nhất $x = 75$.
    Lúc đó $y = (64 dot 75) / (75 - 27) = 4800 / 48 = 100$.
    Vậy $L_(min) = sqrt(75^2 + 100^2) = sqrt(5625 + 10000) = sqrt(15625) = 125 text(" (cm)"). $

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 3: Đòn "Cốt Tử" - Bất đẳng thức Hölder (Cách của Thủ khoa)]
    
    Nếu bạn muốn một dòng duy nhất để triệt hạ bài toán này mà không cần đạo hàm, hãy dùng *Bất đẳng thức Hölder* (phiên bản 3 dãy số). 
    *Nhắc lại BĐT Hölder:* $ (a^3+b^3)(c^3+d^3)(e^3+f^3) >= (a c e + b d f)^3. $
    
    Hãy thiết lập 3 dãy số cực kỳ tinh tế như sau:
    - Dãy 1: $(x^2, y^2)$
    - Dãy 2: $(27/x, 64/y)$
    - Dãy 3: $(27/x, 64/y)$
    
    Áp dụng BĐT Hölder cho 3 dãy này, ta có:
    $ (x^2 + y^2) (27/x + 64/y) (27/x + 64/y) >= ( root(3, x^2 dot 27/x dot 27/x) + root(3, y^2 dot 64/y dot 64/y) )^3 $
    
    Rút gọn vế phải, ta nhận ra một phép màu Toán học:
    $ root(3, x^2 dot 27^2/x^2) = root(3, 27^2) = (root(3,27))^2 = 3^2 = 9. $
    $ root(3, y^2 dot 64^2/y^2) = root(3, 64^2) = (root(3,64))^2 = 4^2 = 16. $
    Vế phải trở thành: $(9 + 16)^3 = 25^3 = 15625$.
    
    Đồng thời, theo giả thiết thì $27/x + 64/y = 1$, nên vế trái chỉ còn lại chính là $L^2$.
    Vậy ta có ngay:
    $ L^2 dot 1 dot 1 >= 15625 \
    <=> L^2 >= 15625 <=> L >= 125. $
    
    Dấu "=" xảy ra khi các dãy tỷ lệ với nhau, tức là $x^2 / (27/x) = y^2 / (64/y) <=> x^3 / 27 = y^3 / 64 <=> x/3 = y/4$, hoàn toàn khớp với $x=75, y=100$.

    #nhanxet[Sự kỳ diệu của Toán học nằm ở chỗ: Một bài toán Kỹ thuật thực tế, vẽ ra bằng Hình học, khảo sát bằng Giải tích, nhưng cuối cùng lại bị chinh phục hoàn toàn bởi Vẻ đẹp tuyệt mĩ của Đại số (BĐT Hölder). Nắm được tư duy này, bạn sẽ không "ngán" bất kỳ câu điểm 10 nào!]
  ]
)

