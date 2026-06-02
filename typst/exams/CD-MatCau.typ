#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

// #show: stexgv-doc.with(
//   doc-type: "book",
//   title: "CHUYÊN ĐỀ: Mặt Cầu",
//   author: "GV Nguyễn Văn Sang",
//   theme-color: classic.blue
// )

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
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: Mặt Cầu]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Kỹ thuật tọa độ hóa và công thức giải nhanh bài toán Parabol nội tiếp hình chữ nhật.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "dethi"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// ═══════════════════════════════════════════════════════════
// THIẾT KẾ CHUYÊN ĐỀ MẪU: BÀI TOÁN THỰC TẾ & VẬN DỤNG CAO
// ═══════════════════════════════════════════════════════════
#tln(
  [Trong không gian $O x y z$, coi Trái Đất là một hình cầu có tâm là gốc tọa độ và có bán kính bằng $16$, đơn vị dài trên mỗi trục tọa độ là $400 " km"$, đường xích đạo nằm trong mặt phẳng $(O x y)$. Tại điểm $A(0; 16; 0)$, người ta phóng một tàu vũ trụ (coi như bay thẳng) lên không trung theo hướng của vectơ $vect(u) = (2; 0; 1)$ với tốc độ $10 " km/s"$. Sau khoảng thời gian $3$ phút thì tàu vũ trụ ở vị trí $B$. Gọi $M$ là điểm nằm trên đường xích đạo và gần với $B$ nhất. Hãy xác định theo kilômét độ dài $M B$ (làm tròn kết quả đến hàng đơn vị).],
  [$829$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Hình cầu nền
    circle((0,0), radius: 2, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    
    // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt) để tạo không gian 3D
    circle((0,0), radius: (0.7, 2), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle((0,0), radius: (1.4, 2), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle((0, 1), radius: (1.732, 0.35), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle((0, -1), radius: (1.732, 0.35), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    
    // Đường xích đạo màu đỏ: Nét đứt nửa sau, nét liền nửa trước
    arc((2,0), start: 0deg, stop: 180deg, radius: (2, 0.4), stroke: (dash: "dashed", paint: red, thickness: 1pt))
    arc((-2,0), start: 180deg, stop: 360deg, radius: (2, 0.4), stroke: (paint: red, thickness: 1pt))
    
    // Tâm O
    circle((0,0), radius: 1.5pt, fill: black)
    content((0,0), $O$, anchor: "east", padding: 5pt)
    
    // Điểm M nằm trên xích đạo
    let M = (0.8, -0.36) 
    circle(M, radius: 1.5pt, fill: black)
    content(M, $M$, anchor: "north", padding: 5pt)
    
    // Điểm A và vector u
    let A = (1.2, 1.4)
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-east", padding: 4pt)
    
    let u_end = (1.9, 1.4)
    let B = (2.6, 1.4)
    
    line(A, u_end, mark: (end: ">"), stroke: 1pt)
    content((1.65, 1.6), $vect(u)$)
    line(u_end, B, stroke: (dash: "dashed"))
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "west", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - *Bước 1:* Tính khoảng cách thực tế $A B$, sau đó chia cho $400$ để quy đổi sang đơn vị độ dài của hệ tọa độ $O x y z$.
      - *Bước 2:* Xác định tọa độ điểm $B$ thông qua hệ thức vectơ $vect(A B) = k vect(u)$.
      - *Bước 3:* Đường xích đạo là đường tròn giao tuyến của mặt cầu và mặt phẳng $(O x y)$. Điểm $M$ thuộc xích đạo và gần $B$ nhất chính là giao điểm của tia $O B'$ với đường xích đạo (trong đó $B'$ là hình chiếu vuông góc của $B$ lên mặt phẳng $(O x y)$).
      - *Bước 4:* Áp dụng định lý Pytago trong tam giác vuông $B B' M$ để tính độ dài $M B$, rồi nhân với $400$ để đổi lại sang đơn vị kilômét.
    ]
    
    Thời gian di chuyển của tàu vũ trụ là $t = 3 " phút" = 180 " giây"$.
    Quãng đường thực tế tàu vũ trụ đã đi là:
    $ s = v times t = 10 times 180 = 1800 " (km)" $
    Trong hệ tọa độ, mỗi đơn vị độ dài tương ứng với $400 " km"$, do đó độ dài đoạn $A B$ là:
    $ A B = 1800 / 400 = 4.5 " (đơn vị)" $
    
    Vectơ hướng bay là $vect(u) = (2; 0; 1) => |vect(u)| = sqrt(2^2 + 0^2 + 1^2) = sqrt(5)$.
    Vectơ $vect(A B)$ cùng hướng với $vect(u)$ và có độ dài bằng $4.5$, nên ta có:
    $ vect(A B) = (A B) / (|vect(u)|) vect(u) = 4.5 / sqrt(5) (2; 0; 1) = ( 9 / sqrt(5); 0; 4.5 / sqrt(5) ) $
    Suy ra tọa độ điểm $B$ là:
    $ B = A + vect(A B) = (0; 16; 0) + ( 9 / sqrt(5); 0; 4.5 / sqrt(5) ) = ( 9 / sqrt(5); 16; 4.5 / sqrt(5) ) $
    
    #align(center)[
      #cetz.canvas(length: 1.1cm, {
        import cetz.draw: *
        // Trục tọa độ
        line((0,0), (0, 4), mark: (end: ">"), stroke: gray); content((0, 4.2), $z$)
        line((0,0), (5, 0), mark: (end: ">"), stroke: gray); content((5.2, 0), $y$)
        line((0,0), (-2, -1.5), mark: (end: ">"), stroke: gray); content((-2.2, -1.7), $x$)
        
        // Đường tròn xích đạo: Nét đứt nửa sau, nét liền nửa trước
        arc((2.5,0), start: 0deg, stop: 180deg, radius: (2.5, 1), stroke: (dash: "dashed", paint: red, thickness: 1pt))
        arc((-2.5,0), start: 180deg, stop: 360deg, radius: (2.5, 1), stroke: (paint: red, thickness: 1pt))
        content((2.8, 0.5), [Xích đạo], fill: red, anchor: "west")
        
        // Điểm B', B
        let Bp = (3.6, 1.3)
        let B = (3.6, 3.5)
        line((0,0), Bp, stroke: (dash: "dashed", paint: blue))
        line(Bp, B, stroke: (paint: blue, thickness: 1pt))
        content(Bp, $B'$, anchor: "north-west")
        content(B, $B$, anchor: "south")
        
        // Điểm M
        let M = (3.6 * 0.65, 1.3 * 0.65) 
        circle(M, radius: 1.5pt, fill: red)
        content(M, $M$, anchor: "north-west", padding: 3pt)
        
        line(M, B, stroke: (paint: orange, thickness: 1.2pt))
        content((3, 2.6), $M B$, fill: orange)
        
        circle((0,0), radius: 1.5pt, fill: black); content((-0.2, 0.2), $O$)
        circle(Bp, radius: 1.5pt, fill: black)
        circle(B, radius: 1.5pt, fill: black)
      })
    ]
    
    Đường xích đạo nằm trong mặt phẳng $(O x y)$ nên nó là đường tròn tâm $O$, bán kính $R = 16$.
    Gọi $B'$ là hình chiếu vuông góc của $B$ lên mặt phẳng $(O x y)$, tọa độ của $B'$ là $( 9 / sqrt(5); 16; 0 )$.
    Khoảng cách từ gốc $O$ đến $B'$ là:
    $ O B' = sqrt( (9/sqrt(5))^2 + 16^2 ) = sqrt( 81/5 + 256 ) = sqrt(272.2) $
    
    Điểm $M$ thuộc đường xích đạo (bán kính $R=16$). Để $M$ gần $B$ nhất thì $M$ phải gần hình chiếu $B'$ nhất, tức là $M$ nằm trên đoạn thẳng $O B'$. 
    Khoảng cách từ $B'$ đến $M$ là:
    $ B' M = O B' - R = sqrt(272.2) - 16 $
    
    Xét tam giác vuông $B B' M$ vuông tại $B'$ (vì $B B' perp (O x y)$), áp dụng định lý Pytago ta có:
    $ M B^2 &= B' M^2 + B B'^2 = (sqrt(272.2) - 16)^2 + (4.5 / sqrt(5))^2 \
            &= 272.2 - 32 sqrt(272.2) + 256 + 4.05 \
            &= 532.25 - 32 sqrt(272.2) approx 4.2985 $
    Suy ra độ dài $M B$ trong hệ tọa độ là:
    $ M B approx sqrt(4.2985) approx 2.0733 " (đơn vị)" $
    
    Khoảng cách thực tế từ $M$ đến $B$ là:
    $ M B_"thực tế" = 2.0733 times 400 approx 829.3 " (km)" $
    Làm tròn kết quả đến hàng đơn vị, ta thu được *$829$* km.
    
    #nhanxet[
      Bài toán kết hợp hình học không gian $O x y z$ với thực tiễn. Chìa khóa quan trọng là vận dụng đúng tính chất hình chiếu: Khoảng cách từ một điểm $B$ ngoài mặt phẳng đến một đường tròn trong mặt phẳng đó đạt giá trị nhỏ nhất khi hình chiếu của $B$ cùng tâm đường tròn và điểm trên đường tròn thẳng hàng.
    ]
  ]
)

#tln(
  [Trong không gian $O x y z$, coi Trái Đất là một hình cầu có tâm là gốc tọa độ và có bán kính bằng $10$, đơn vị dài trên mỗi trục tọa độ là $600 " km"$, đường xích đạo nằm trong mặt phẳng $(O x y)$. Tại điểm $A(0; 10; 0)$, người ta phóng một tàu vũ trụ (coi như bay thẳng) lên không trung theo hướng của vectơ $vect(u) = (3; 0; 4)$ với tốc độ $15 " km/s"$. Sau khoảng thời gian $5$ phút thì tàu vũ trụ ở vị trí $B$. Gọi $M$ là điểm nằm trên đường xích đạo và gần với $B$ nhất. Hãy xác định theo kilômét độ dài $M B$ (làm tròn kết quả đến hàng đơn vị).],
  [$3646$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Hình cầu nền
    circle((0,0), radius: 2, fill: rgb("e3f2fd"), stroke: rgb("1565c0"))
    
    // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt) để tạo không gian 3D
    circle((0,0), radius: (0.7, 2), stroke: (dash: "dashed", paint: rgb("90caf9"), thickness: 0.6pt))
    circle((0,0), radius: (1.4, 2), stroke: (dash: "dashed", paint: rgb("90caf9"), thickness: 0.6pt))
    circle((0, 1), radius: (1.732, 0.35), stroke: (dash: "dashed", paint: rgb("90caf9"), thickness: 0.6pt))
    circle((0, -1), radius: (1.732, 0.35), stroke: (dash: "dashed", paint: rgb("90caf9"), thickness: 0.6pt))
    
    // Đường xích đạo màu cam: Nét đứt nửa sau, nét liền nửa trước
    arc((2,0), start: 0deg, stop: 180deg, radius: (2, 0.4), stroke: (dash: "dashed", paint: rgb("e65100"), thickness: 1pt))
    arc((-2,0), start: 180deg, stop: 360deg, radius: (2, 0.4), stroke: (paint: rgb("e65100"), thickness: 1pt))
    
    // Tâm O
    circle((0,0), radius: 1.5pt, fill: black)
    content((0,0), $O$, anchor: "east", padding: 5pt)
    
    // Điểm M nằm trên xích đạo
    let M = (0.9, -0.36) 
    circle(M, radius: 1.5pt, fill: black)
    content(M, $M$, anchor: "north", padding: 5pt)
    
    // Điểm A và vector u
    let A = (1.4, 1.4)
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-east", padding: 4pt)
    
    let u_end = (1.8, 2.0)
    let B = (2.2, 2.6)
    
    line(A, u_end, mark: (end: ">"), stroke: (paint: purple, thickness: 1pt))
    content((1.3, 1.8), $vect(u)$, fill: purple)
    line(u_end, B, stroke: (dash: "dashed", paint: black))
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "west", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      Bài toán yêu cầu tính khoảng cách ngắn nhất từ một điểm trong không gian đến một đường tròn nằm trên mặt phẳng tọa độ. Cấu trúc tư duy giải quyết bài toán gồm các bước logic sau:
      - *Bước 1: Đồng bộ hóa đơn vị.* Tính quãng đường bay thực tế của tàu vũ trụ, sau đó quy đổi về số đơn vị đo trong không gian tọa độ $O x y z$ bằng cách chia cho hệ số tỷ lệ ($600 " km"$).
      - *Bước 2: Hình học hóa vị trí.* Sử dụng tính chất của hai vectơ cùng hướng $vect(A B) = k vect(u)$ (với $k = (A B) / (|vect(u)|)$) để tìm chính xác tọa độ không gian của điểm $B$.
      - *Bước 3: Phân tích cực trị hình học.* Đường xích đạo là đường tròn $(C)$ tâm $O$, bán kính $R=10$ nằm trong mặt phẳng $(O x y)$. Điểm $M$ thuộc $(C)$ sao cho khoảng cách $M B$ là nhỏ nhất. Bằng bất đẳng thức tam giác, ta chứng minh được $M$ phải nằm trên đoạn thẳng $O B'$, với $B'$ là hình chiếu vuông góc của $B$ lên $(O x y)$.
      - *Bước 4: Tính toán tổng hợp.* Sử dụng định lý Pytago trong tam giác vuông $B B' M$ để tính khoảng cách tọa độ $M B$, cuối cùng nhân ngược với hệ số tỷ lệ để trả về khoảng cách thực tế.
    ]
    
    Thời gian di chuyển của tàu vũ trụ là $t = 5 " phút" = 300 " giây"$.
    Quãng đường thực tế tàu vũ trụ đã đi trong không gian là:
    $ s = v times t = 15 times 300 = 4500 " (km)" $
    Theo giả thiết, mỗi đơn vị độ dài trong hệ trục $O x y z$ tương ứng với $600 " km"$. Do đó, khoảng cách tọa độ giữa điểm xuất phát $A$ và vị trí hiện tại $B$ là:
    $ A B = 4500 / 600 = 7.5 " (đơn vị)" $
    
    Vectơ chỉ phương quỹ đạo bay là $vect(u) = (3; 0; 4)$. Độ dài của vectơ này là:
    $ |vect(u)| = sqrt(3^2 + 0^2 + 4^2) = sqrt(9 + 16) = 5 $
    Vì tàu vũ trụ bay thẳng theo hướng của $vect(u)$, vectơ dịch chuyển $vect(A B)$ sẽ cùng hướng với $vect(u)$ và có độ dài gấp $7.5 / 5 = 1.5$ lần độ dài $vect(u)$. Ta có phương trình vectơ:
    $ vect(A B) = (A B) / (|vect(u)|) vect(u) = 7.5 / 5 (3; 0; 4) = 1.5 (3; 0; 4) = (4.5; 0; 6) $
    Từ tọa độ điểm $A(0; 10; 0)$, tọa độ điểm $B$ được xác định là:
    $ B = A + vect(A B) = (0; 10; 0) + (4.5; 0; 6) = (4.5; 10; 6) $
    
    #align(center)[
      #cetz.canvas(length: 1.1cm, {
        import cetz.draw: *
        // Trục tọa độ
        line((0,0), (0, 4.5), mark: (end: ">"), stroke: gray); content((0, 4.7), $z$)
        line((0,0), (6, 0), mark: (end: ">"), stroke: gray); content((6.2, 0), $y$)
        line((0,0), (-2.5, -1.8), mark: (end: ">"), stroke: gray); content((-2.7, -2.0), $x$)
        
        // Đường tròn xích đạo: Nét đứt nửa sau, nét liền nửa trước
        arc((3,0), start: 0deg, stop: 180deg, radius: (3, 1.2), stroke: (dash: "dashed", paint: rgb("e65100"), thickness: 1pt))
        arc((-3,0), start: 180deg, stop: 360deg, radius: (3, 1.2), stroke: (paint: rgb("e65100"), thickness: 1pt))
        content((3.3, 0.6), [Xích đạo], fill: rgb("e65100"), anchor: "west")
        
        // Điểm B', B
        let Bp = (4.0, 1.5)
        let B = (4.0, 4.2)
        line((0,0), Bp, stroke: (dash: "dashed", paint: teal))
        line(Bp, B, stroke: (paint: teal, thickness: 1.2pt))
        content(Bp, $B'$, anchor: "north-west")
        content(B, $B$, anchor: "south")
        
        // Điểm M
        let M = (4.0 * 0.7, 1.5 * 0.7) 
        circle(M, radius: 1.5pt, fill: rgb("e65100"))
        content(M, $M$, anchor: "north-west", padding: 3pt)
        
        line(M, B, stroke: (paint: red, thickness: 1.5pt))
        content((3.2, 3.0), $M B$, fill: red)
        
        circle((0,0), radius: 1.5pt, fill: black); content((-0.2, 0.2), $O$)
        circle(Bp, radius: 1.5pt, fill: black)
        circle(B, radius: 1.5pt, fill: black)
        
        // Góc vuông
        line((3.7, 1.5), (3.7, 1.8), (4.0, 1.8), stroke: 0.5pt)
      })
    ]
    
    Đường xích đạo nằm trong mặt phẳng $(O x y)$ nên nó là một đường tròn có tâm là gốc $O(0; 0; 0)$ và bán kính $R = 10$.
    Gọi $B'$ là hình chiếu vuông góc của tàu vũ trụ $B$ lên mặt phẳng $(O x y)$. Tọa độ của $B'$ thu được bằng cách triệt tiêu cao độ của $B$, tức là $B'(4.5; 10; 0)$.
    Khoảng cách từ gốc $O$ đến $B'$ trên mặt phẳng xích đạo là:
    $ O B' = sqrt( 4.5^2 + 10^2 ) = sqrt( 20.25 + 100 ) = sqrt(120.25) $
    
    Vị trí $M$ cần tìm là điểm thuộc đường xích đạo (cách $O$ một khoảng $R=10$). Để độ dài $M B$ đạt giá trị nhỏ nhất, thì hình chiếu của đoạn $M B$ lên $(O x y)$, tức là đoạn $M B'$, cũng phải đạt giá trị nhỏ nhất. Điểm $M$ thỏa mãn điều kiện này nằm tại giao điểm của đoạn thẳng $O B'$ với đường tròn xích đạo.
    Khoảng cách từ điểm $M$ đến điểm chiếu $B'$ là:
    $ B' M = O B' - R = sqrt(120.25) - 10 $
    
    Do $B B'$ vuông góc với mặt phẳng $(O x y)$ nên tam giác $B B' M$ vuông tại $B'$. Cao độ của $B$ chính là độ dài đoạn $B B' = 6$. Áp dụng định lý Pytago trong không gian, bình phương khoảng cách $M B$ là:
    $ M B^2 &= B' M^2 + B B'^2 = (sqrt(120.25) - 10)^2 + 6^2 \
            &= 120.25 - 20 sqrt(120.25) + 100 + 36 \
            &= 256.25 - 20 sqrt(120.25) \
            &approx 256.25 - 20 times 10.96586 approx 36.9328 $
    Lấy căn bậc hai, ta thu được độ dài $M B$ trong hệ trục tọa độ:
    $ M B approx sqrt(36.9328) approx 6.07724 " (đơn vị)" $
    
    Để tìm khoảng cách thực tế, ta nhân lại với hệ số quy đổi không gian:
    $ M B_"thực tế" = 6.07724 times 600 = 3646.344 " (km)" $
    Làm tròn kết quả đến hàng đơn vị, ta thu được đáp án là *$3646$*.
    
    #nhanxet[
      Mô hình toán học của bài toán này là việc tìm khoảng cách từ một điểm nằm ngoài một mặt trụ (có đáy là đường xích đạo) đến đường tròn đáy. Điểm rơi tối ưu luôn xảy ra khi $M$, hình chiếu $B'$ và tâm $O$ thẳng hàng. Lưu ý học sinh không làm tròn số liệu ở các bước trung gian (như giá trị của $sqrt(120.25)$) để tránh sai số dây chuyền ảnh hưởng đến kết quả hàng đơn vị cuối cùng, đặc biệt khi hệ số nhân lên thực tế rất lớn ($600$ lần).
    ]
  ]
)

#tln(
  [
    Trong không gian với hệ tọa độ $O x y z$, một trạm nghiên cứu thiết lập một trường năng lượng có dạng mặt cầu $(S)$ với phương trình:
    $ (x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 625 $
    Một mặt phẳng laser $(P)$ có phương trình $2x + 2y - z - 40 = 0$ cắt mặt cầu $(S)$ tạo thành một đường tròn giao tuyến $(C)$. 
    Một mắt thần (camera) $M$ được lập trình để di chuyển liên tục trên quỹ đạo đường tròn $(C)$ này. Biết trung tâm thu nhận dữ liệu được đặt tại điểm cố định $A(29; 11; 4)$. 
    Gọi $M A_(max)$ và $M A_(min)$ lần lượt là khoảng cách truyền tín hiệu lớn nhất và nhỏ nhất từ mắt thần $M$ đến trung tâm $A$. Hãy tính tổng $M A_(max) + M A_(min)$.
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Vẽ mặt phẳng (P)
        line((-4, -2), (6, -2), (8, 3), (-2, 3), close: true, fill: rgb(0, 150, 255, 15%), stroke: (paint: blue, thickness: 1pt))
        content((-3.5, -1.5), text(fill: blue, weight: "bold")[$(P)$])
        
        // Quỹ đạo đường tròn (C) - vẽ như một elip
        let h = (2, 0.5) // Tâm H
        circle(h, radius: (3.5, 1.2), stroke: (paint: red, thickness: 1.5pt), name: "C")
        circle(h, radius: 2pt, fill: red)
        content(h, $H$, anchor: "north", padding: 5pt)

        // Tâm mặt cầu I
        let i = (2, -3.5)
        circle(i, radius: 2pt, fill: gray)
        content(i, $I$, anchor: "west", padding: 5pt)
        line(i, h, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
        // Ký hiệu vuông góc tại H
        line((1.7, 0.5), (1.7, 0.2), (2.0, 0.2), stroke: 0.5pt)

        // Điểm A và hình chiếu A'
        let a_prime = (6.5, 1.8)
        let a = (6.5, 5.5)
        
        circle(a_prime, radius: 2pt, fill: black)
        content(a_prime, $A'$, anchor: "north-west", padding: 5pt)
        circle(a, radius: 3pt, fill: black)
        content(a, $A$, anchor: "west", padding: 5pt)
        
        line(a, a_prime, stroke: (dash: "dashed", paint: black, thickness: 1pt))
        // Ký hiệu vuông góc tại A'
        line((6.2, 1.8), (6.2, 2.1), (6.5, 2.1), stroke: 0.5pt)

        // Đường thẳng qua H và A' cắt (C) tại 2 điểm min/max
        line(h, a_prime, stroke: (dash: "dotted", paint: black, thickness: 1pt))
        
        // Các điểm M_min, M_max
        // Vector HA' = (4.5, 1.3). Chuẩn hóa để tìm điểm trên elip.
        // Ước lượng M1 (min) và M2 (max)
        let m1 = (4.7, 1.3) 
        let m2 = (-0.7, -0.3)
        circle(m1, radius: 2.5pt, fill: orange)
        circle(m2, radius: 2.5pt, fill: orange)
        content(m1, $M_1 (min)$, anchor: "south-west", padding: 3pt)
        content(m2, $M_2 (max)$, anchor: "north-east", padding: 3pt)

        // Nối A với M1, M2
        line(a, m1, stroke: (paint: green.darken(20%), thickness: 1.5pt))
        line(a, m2, stroke: (paint: green.darken(20%), thickness: 1.5pt))
      })
    ]
  ],
  [ 50 ],
  loigiai: [
    #ppgiai[
      Để giải quyết bài toán điểm di động trên đường tròn giao tuyến, thay vì cố gắng tham số hóa tọa độ của $M$ (rất phức tạp), ta dùng *Phương pháp Hình chiếu Không gian*:
      - B1: Tìm tâm $I$, bán kính $R$ của $(S)$. Tính khoảng cách từ $I$ đến $(P)$ để suy ra bán kính $r$ của đường tròn $(C)$ (tâm $H$).
      - B2: Tìm khoảng cách từ $A$ đến $(P)$ và kiểm tra vị trí tương đối của $I$ và $A$ so với $(P)$.
      - B3: Chiếu đoạn thẳng $I A$ lên mặt phẳng $(P)$ để tính khoảng cách $H A'$.
      - B4: Sử dụng hình học phẳng để tìm cực trị $M A'$ trên mặt phẳng, sau đó dùng Pitago để suy ra cực trị của $M A$.
    ]

    *Bước 1: Khảo sát mặt cầu $(S)$ và đường tròn giao tuyến $(C)$*
    - Mặt cầu $(S)$ có tâm $I(1; -2; 3)$ và bán kính $R = sqrt(625) = 25$.
    - Khoảng cách từ tâm $I$ đến mặt phẳng $(P)$ là:
      $ d(I, (P)) = (abs(2(1) + 2(-2) - 3 - 40)) / (sqrt(2^2 + 2^2 + (-1)^2)) = (abs(-45)) / 3 = 15. $
    - Gọi $H$ là tâm đường tròn $(C)$ (hình chiếu của $I$ lên $(P)$). Bán kính của đường tròn $(C)$ là:
      $ r = sqrt(R^2 - d^2(I, (P))) = sqrt(25^2 - 15^2) = 20. $

    *Bước 2: Khảo sát vị trí điểm $A(29; 11; 4)$*
    - Khoảng cách từ $A$ đến $(P)$ là:
      $ d(A, (P)) = (abs(2(29) + 2(11) - 4 - 40)) / 3 = (abs(58 + 22 - 4 - 40)) / 3 = 36 / 3 = 12. $
    - *Kiểm tra vị trí tương đối:* Thay tọa độ $I$ và $A$ vào vế trái phương trình $(P)$:
      $ f(I) &= 2(1) + 2(-2) - 3 - 40 = -45 < 0 \
      f(A) &= 2(29) + 2(11) - 4 - 40 = 36 > 0 $
      Vì $f(I) dot f(A) < 0$ nên $I$ và $A$ nằm *khác phía* so với mặt phẳng $(P)$.

    *Bước 3: Siêu kĩ năng "Chiếu Vector" tìm độ dài $H A'$*
    Gọi $A'$ là hình chiếu vuông góc của $A$ lên $(P)$. Ta cần tính độ dài đoạn $H A'$ (nằm trên $(P)$).
    - Tính khoảng cách không gian $I A$:
      $ arrow(I A) = (28; 13; 1) => I A^2 = 28^2 + 13^2 + 1^2 = 784 + 169 + 1 = 954. $
    - Do $I, A$ khác phía so với $(P)$ nên hình chiếu của đoạn thẳng $I A$ lên trục pháp tuyến chính là tổng khoảng cách: $d(I, (P)) + d(A, (P)) = 15 + 12 = 27$.
    - Áp dụng định lý Pitago cho tam giác vuông tạo bởi đoạn $I A$ và các hình chiếu:
      $ H A'^2 = I A^2 - (d_I + d_A)^2 = 954 - 27^2 = 954 - 729 = 225. $
      Suy ra: $H A' = sqrt(225) = 15$. 
      *(Lưu ý: Bạn không cần mất thời gian đi tìm tọa độ cụ thể của $H$ và $A'$!)*

    *Bước 4: Tối ưu hóa khoảng cách $M A$*
    Bây giờ, mọi thứ đã quy về mặt phẳng $(P)$. Ta có đường tròn $(C)$ tâm $H$, bán kính $r = 20$. Điểm $A'$ nằm trên mặt phẳng $(P)$ cách $H$ một đoạn $H A' = 15$. 
    Một điểm $M$ di chuyển trên $(C)$. 
    - Vì $H A' < r$ ($15 < 20$), điểm $A'$ nằm *bên trong* đường tròn $(C)$.
    - Khoảng cách lớn nhất và nhỏ nhất từ $M$ đến $A'$ lần lượt là:
      $ M A'_(min) &= abs(r - H A') = 20 - 15 = 5. \
      M A'_(max) &= r + H A' = 20 + 15 = 35. $
    - Cuối cùng, vì $A A' perp (P)$ nên tam giác $A A' M$ vuông tại $A'$. Áp dụng Pitago:
      $ M A^2 = A A'^2 + M A'^2 = 12^2 + M A'^2 = 144 + M A'^2. $
    - Từ đó ta có:
      $ M A_(min) &= sqrt(144 + 5^2) = sqrt(169) = 13. \
      M A_(max) &= sqrt(144 + 35^2) = sqrt(144 + 1225) = sqrt(1369) = 37. $

    Vậy tổng khoảng cách lớn nhất và nhỏ nhất là: 
    $ 13 + 37 = 50. $

    #nhanxet[Bài toán là một "vở kịch" hoàn hảo của các bộ số Pitago: (15-20-25), (5-12-13) và (12-35-37). Bằng cách sử dụng phép chiếu không gian (tính $H A'$ qua $I A$), chúng ta đã bỏ qua hoàn toàn việc phải giải các hệ phương trình tọa độ cồng kềnh. Đây chính là tư duy "Thủ khoa" cần có để xử lý nhanh các câu VDC trong phòng thi!]
  ]
)

#tln(
  [
    Trong không gian triển lãm nghệ thuật, người ta trưng bày một mô hình hành tinh là một quả cầu đặc $(S)$ có bán kính $R = 30$ cm. Quả cầu được đâm xuyên qua bởi một trục kim loại $A B$ dài $120$ cm sao cho trục đi qua đúng tâm $I$ của quả cầu. Mô hình được treo lơ lửng bằng các sợi dây cáp trong suốt sao cho tâm $I$ cố định và cách mặt sàn ngang $150$ cm. Trục $A B$ được giữ nghiêng một góc $30^degree$ so với phương ngang của mặt sàn.
    Người ta dùng một dải đèn LED trang trí siêu sáng, kéo căng từ cực $A$, móc qua một điểm $M$ tùy ý trên mặt sàn, rồi nối thẳng lên cực $B$. 
    Biết rằng dải đèn luôn được giữ căng và khoảng cách từ tâm $I$ đến dải đèn luôn lớn hơn $R$ (dải đèn không bị vướng vào bề mặt quả cầu). Hãy tính tổng độ dài *ngắn nhất* của dải đèn $M A + M B$ (đơn vị: centimet, kết quả làm tròn đến hàng đơn vị).
  ],
  [ 317 ],
  fig: cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    // Mặt sàn
    line((-8, 0), (8, 0), stroke: 1.5pt)
    content((7, 0.4), text(fill: gray)[Mặt sàn])
    
    // Tọa độ tâm I
    let ix = 0
    let iy = 7.5 // Tương ứng 150cm (tỉ lệ 1 đơn vị = 20cm)
    let i = (ix, iy)
    
    // Tọa độ A, B
    let ax = ix + 3 * calc.cos(30deg)
    let ay = iy + 3 * calc.sin(30deg)
    let a = (ax, ay)
    
    let bx = ix - 3 * calc.cos(30deg)
    let by = iy - 3 * calc.sin(30deg)
    let b = (bx, by)
    
    // Điểm B' đối xứng qua mặt sàn
    let b_prime = (bx, -by)
    
    // Điểm M giao điểm của AB' và mặt sàn (y=0)
    let mx = ax - (ax - bx) * (ay / (ay + by))
    let m = (mx, 0)
    
    // Trục đứng ảo từ I xuống sàn
    line(i, (0, 0), stroke: (dash: "dashed", paint: gray))
    
    // VẼ QUẢ CẦU 3D THEO STYLE MỚI (CÓ KINH TUYẾN, VĨ TUYẾN)
    let r = 1.5 // Tương ứng 30cm
    
    // Hình cầu nền
    circle(i, radius: r, fill: rgb(255, 150, 0, 15%), stroke: (paint: orange, thickness: 1.2pt))
    
    // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt) để tạo không gian 3D
    circle(i, radius: (r*0.35, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(i, radius: (r*0.7, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    
    let y_offset = r * 0.5
    let x_rad = r * 0.866 // ~ căn(3)/2 của r
    let y_rad = r * 0.17
    circle((ix, iy + y_offset), radius: (x_rad, y_rad), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle((ix, iy - y_offset), radius: (x_rad, y_rad), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    
    // Đường xích đạo màu đỏ cam nổi bật: Nét đứt nửa sau, nét liền nửa trước
    arc((ix + r, iy), start: 0deg, stop: 180deg, radius: (r, r*0.2), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
    arc((ix - r, iy), start: 180deg, stop: 360deg, radius: (r, r*0.2), stroke: (paint: red, thickness: 1.2pt))
    
    // Thanh kim loại AB
    line(a, b, stroke: (paint: rgb("#333"), thickness: 2.5pt))
    circle(a, radius: 2.5pt, fill: black)
    circle(b, radius: 2.5pt, fill: black)
    circle(i, radius: 2.5pt, fill: red)
    
    content(a, $A$, anchor: "south-west", padding: 3pt)
    content(b, $B$, anchor: "north-east", padding: 3pt)
    content(i, $I$, anchor: "south-east", padding: 3pt)
    
    // Góc 30 độ (với mặt phẳng ngang)
    line(i, (3, iy), stroke: (dash: "dashed", paint: gray))
    arc((ix + 2, iy), start: 0deg, stop: 30deg, radius: 2)
    content((1.8, iy + 0.4), $30^degree$)
    
    // Điểm đối xứng B'
    circle(b_prime, radius: 2.5pt, fill: gray)
    content(b_prime, $B'$, anchor: "north-east", padding: 3pt)
    line(b, b_prime, stroke: (dash: "dashed", paint: blue))
    
    // Dây LED kéo từ A -> M -> B
    line(a, m, stroke: (paint: rgb("#00aa00"), thickness: 1.5pt))
    line(m, b, stroke: (paint: rgb("#00aa00"), thickness: 1.5pt))
    // Dây LED tàng hình phản xạ M -> B'
    line(m, b_prime, stroke: (dash: "dashed", paint: rgb("#00aa00"), thickness: 1.2pt))
    
    circle(m, radius: 2.5pt, fill: rgb("#00aa00"))
    content((mx, -0.6), $M$, anchor: "north")
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - *Bước 1:* Xác định cao độ (khoảng cách đến mặt sàn) của hai điểm $A$ và $B$.
      - *Bước 2:* Tính độ dài hình chiếu vuông góc của đoạn $A B$ xuống mặt sàn.
      - *Bước 3:* Sử dụng tính chất đối xứng gương. Lấy điểm $B'$ đối xứng với $B$ qua mặt sàn. Khi đó $M A + M B = M A + M B' >= A B'$. Độ dài ngắn nhất chính là đoạn thẳng $A B'$.
    ]

    #step[Tính cao độ của các điểm $A$ và $B$]
    - Tâm $I$ cách mặt sàn một khoảng $h_I = 150 text(" cm")$.
    - Trục $A B = 120 text(" cm")$, đi qua tâm $I$ nên $I A = I B = 60 text(" cm")$.
    - Vì trục $A B$ nghiêng $30^degree$ so với mặt sàn, độ chênh lệch chiều cao từ $I$ đến $A$ (hoặc $B$) là:
      $ Delta h = I A dot sin(30^degree) = 60 dot 1/2 = 30 text(" cm"). $
    - Gọi $A$ là điểm ở vị trí cao hơn, ta có chiều cao của $A$ và $B$ so với mặt sàn lần lượt là:
      $ h_A &= 150 + 30 = 180 text(" cm") \
        h_B &= 150 - 30 = 120 text(" cm"). $

    #step[Tính độ dài hình chiếu của $A B$ xuống mặt sàn]
    - Hình chiếu vuông góc của thanh $A B$ xuống mặt sàn là một đoạn thẳng có độ dài:
      $ L_(x y) = A B dot cos(30^degree) = 120 dot (sqrt(3))/2 = 60sqrt(3) text(" cm"). $

    #step[Áp dụng phép đối xứng và tính toán tối ưu]
    - Ta cần tìm $M$ thuộc mặt phẳng sàn sao cho $M A + M B$ đạt giá trị nhỏ nhất. Điểm $A, B$ đang nằm cùng một phía so với mặt sàn.
    - Lấy điểm $B'$ đối xứng với $B$ qua mặt sàn. Khi đó cao độ của $B'$ mang giá trị âm: $h_(B') = -h_B = -120 text(" cm")$.
    - Vì $M$ nằm trên mặt phẳng đối xứng nên khoảng cách $M B = M B'$.
    - Bất đẳng thức tam giác cho ta:
      $ M A + M B = M A + M B' >= A B'. $
    - Tổng chiều dài ngắn nhất chính là độ dài đoạn thẳng nối từ $A$ đến $B'$ trong không gian. Bình phương độ dài $A B'$ được tính bằng định lý Pitago mở rộng (tổng bình phương hình chiếu và bình phương độ chênh lệch cao độ):
      $ (A B')^2 = (L_(x y))^2 + (h_A - h_(B'))^2 $
    - Thế số vào ta được:
      $ (A B')^2 &= (60sqrt(3))^2 + (180 - (-120))^2 \
                 &= 10800 + 300^2 \
                 &= 10800 + 90000 = 100800. $
    - Quãng đường dây LED ngắn nhất là:
      $ A B' = sqrt(100800) = 120sqrt(7) text(" cm"). $
    
    #step[Làm tròn kết quả]
    - Với $sqrt(7) approx 2,64575$, ta có:
      $ 120sqrt(7) approx 317,49 text(" cm"). $
    - Làm tròn đến hàng đơn vị, chiều dài dải đèn LED ngắn nhất cần dùng là *$317$* cm.
  ]
)

#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.3": plot

#tln(
  [
    Trong một dự án thám hiểm đại dương, một phao thu thập dữ liệu công nghệ cao có dạng mặt cầu $(S)$. Trong hệ trục tọa độ không gian $O x y z$ (đơn vị: mét), mặt cầu $(S)$ có tâm $I(2, 2, 1)$ và bán kính $R = 10$. 
    Hai trạm phát sóng siêu âm $A$ và $B$ được neo cố định dưới đáy biển tại các tọa độ $A(12, 20, 15)$ và $B(16, 16, 17)$. Người ta cần lắp đặt một module nhận tín hiệu $M$ ở *trên bề mặt* của phao $(S)$ sao cho năng lượng tiêu hao để kết nối với hai trạm $A$ và $B$ là thấp nhất. 
    Biết rằng mức năng lượng này tỉ lệ thuận với tổng bình phương khoảng cách $P = M A^2 + M B^2$. Hãy tính giá trị *nhỏ nhất* của biểu thức $P$.
  ],
  [ 468 ],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    
    let ix = 0
    let iy = 0
    let r = 2.8 // Phóng to khối cầu theo yêu cầu
    
    // Hình cầu nền (Màu xanh dương của đại dương)
    circle((ix, iy), radius: r, fill: rgb("e3f2fd"), stroke: (paint: rgb("1565c0"), thickness: 1.5pt))
    
    // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt) tạo khối 3D sâu
    circle((ix, iy), radius: (r * 0.4, r), stroke: (dash: "dashed", paint: rgb("90caf9"), thickness: 0.8pt))
    circle((ix, iy), radius: (r * 0.8, r), stroke: (dash: "dashed", paint: rgb("90caf9"), thickness: 0.8pt))
    
    let y_offset = r * 0.5
    let x_rad = r * 0.866 
    let y_rad = r * 0.22
    circle((ix, iy + y_offset), radius: (x_rad, y_rad), stroke: (dash: "dashed", paint: rgb("90caf9"), thickness: 0.8pt))
    circle((ix, iy - y_offset), radius: (x_rad, y_rad), stroke: (dash: "dashed", paint: rgb("90caf9"), thickness: 0.8pt))
    
    // Đường xích đạo màu xanh đậm nổi bật
    arc((ix + r, iy), start: 0deg, stop: 180deg, radius: (r, r*0.25), stroke: (dash: "dashed", paint: rgb("0d47a1"), thickness: 1.2pt))
    arc((ix - r, iy), start: 180deg, stop: 360deg, radius: (r, r*0.25), stroke: (paint: rgb("0d47a1"), thickness: 1.2pt))
    
    // Tâm I của phao
    circle((ix, iy), radius: 2pt, fill: black)
    content((ix, iy), $I$, anchor: "north-west", padding: 5pt)
    
    // Điểm E (Trung điểm của A và B)
    let E = (4.5, 2)
    circle(E, radius: 2pt, fill: black)
    content(E, $E$, anchor: "south-west", padding: 5pt)
    
    // Đường nối tâm I với E
    line((ix, iy), E, stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
    
    // Điểm M (Giao của IE và mặt cầu - Vị trí tối ưu)
    // Tỷ lệ khoảng cách M trên đoạn IE
    let M = (4.5 * 0.57, 2 * 0.57) 
    circle(M, radius: 2.5pt, fill: red)
    content(M, $M$, anchor: "south-east", padding: 5pt)
    
    // Hai trạm phát sóng A và B
    let vecAB = (-1.2, 2.8) 
    let A = (E.at(0) + vecAB.at(0), E.at(1) + vecAB.at(1))
    let B = (E.at(0) - vecAB.at(0), E.at(1) - vecAB.at(1))
    
    line(A, B, stroke: (paint: black, thickness: 1.5pt))
    circle(A, radius: 2pt, fill: black)
    circle(B, radius: 2pt, fill: black)
    content(A, $A$, anchor: "south-east", padding: 5pt)
    content(B, $B$, anchor: "north-west", padding: 5pt)
    
    // Cáp kết nối MA và MB (Biểu diễn khoảng cách)
    line(M, A, stroke: (paint: rgb("e65100"), thickness: 1.2pt))
    line(M, B, stroke: (paint: rgb("e65100"), thickness: 1.2pt))
  }),
  fig-pos: "right",
  fig-width: 42%,
  loigiai: [
    #ppgiai[
      - Bài toán yêu cầu tìm giá trị nhỏ nhất của tổng hai bình phương $M A^2 + M B^2$ khi $M$ di động trên mặt cầu $(S)$.
      - *Vũ khí giải quyết:* Áp dụng công thức độ dài đường trung tuyến trong tam giác $M A B$ để gom hai biến $M A, M B$ về một biến duy nhất là khoảng cách từ $M$ đến trung điểm $E$ của $A B$.
      - *Bước 1:* Tìm tọa độ trung điểm $E$ và độ dài đoạn $A B$.
      - *Bước 2:* Chuyển hóa biểu thức $P = 2 M E^2 + (A B^2)/2$.
      - *Bước 3:* Lập luận hình học để tìm $M E$ nhỏ nhất khi $M$ nằm trên mặt cầu.
    ]

    #step[Phân tích tọa độ điểm $E$ và đoạn thẳng $A B$]
    - Gọi $E$ là trung điểm của đoạn thẳng $A B$. Tọa độ của $E$ được tính bằng trung bình cộng tọa độ của $A(12; 20; 15)$ và $B(16; 16; 17)$:
      $ x_E = (12 + 16)/2 = 14; quad y_E = (20 + 16)/2 = 18; quad z_E = (15 + 17)/2 = 16. $
      $=> E(14; 18; 16).$
    - Tọa độ vectơ $vect(A B) = (16 - 12; 16 - 20; 17 - 15) = (4; -4; 2)$.
    - Bình phương độ dài đoạn thẳng $A B$:
      $ A B^2 = 4^2 + (-4)^2 + 2^2 = 16 + 16 + 4 = 36. $

    #step[Chuyển hóa biểu thức bằng Định lý đường trung tuyến]
    - Trong tam giác $M A B$, $M E$ là đường trung tuyến. Theo định lý đường trung tuyến, ta có:
      $ M E^2 = (M A^2 + M B^2)/2 - (A B^2)/4 $
    - Nhân chéo lên, ta rút ra được biểu thức cần tìm:
      $ P = M A^2 + M B^2 = 2 M E^2 + (A B^2)/2 $
    - Thay $A B^2 = 36$ vào, biểu thức trở thành:
      $ P = 2 M E^2 + 36/2 = 2 M E^2 + 18. $
    - Vậy, để $P$ đạt giá trị nhỏ nhất, ta chỉ cần tìm vị trí điểm $M in (S)$ sao cho độ dài đoạn $M E$ là *ngắn nhất*.

    #step[Lập luận hình học không gian]
    - Mặt cầu $(S)$ có tâm $I(2; 2; 1)$ và bán kính $R = 10$.
    - Tính khoảng cách từ tâm $I$ đến điểm $E$:
      $ vect(I E) = (14 - 2; 18 - 2; 16 - 1) = (12; 16; 15). $
      $ I E = sqrt(12^2 + 16^2 + 15^2) = sqrt(144 + 256 + 225) = sqrt(625) = 25. $
    - Vì $I E = 25 > R = 10$, điểm $E$ nằm hoàn toàn bên ngoài mặt cầu $(S)$.
    - Khi $M$ di động trên mặt cầu, khoảng cách $M E$ ngắn nhất khi 3 điểm $I, M, E$ thẳng hàng và $M$ nằm giữa $I$ và $E$. 
    - Khoảng cách ngắn nhất đó là:
      $ M E_(min) = I E - R = 25 - 10 = 15. $

    #step[Tính kết quả cuối cùng]
    - Thay $M E_(min) = 15$ ngược lại vào biểu thức của $P$:
      $ P_(min) = 2 dot (15)^2 + 18 = 2 dot 225 + 18 = 450 + 18 = 468. $
    
    Vậy giá trị nhỏ nhất của tổng bình phương khoảng cách là *$468$*.
  ]
)

#tln(
  [
    Trong một khu vườn sinh thái thủy canh công nghệ cao, người ta treo một mô hình "Mặt trời nhân tạo" là một quả cầu đặc $(S)$ có bán kính $40$ cm. Quả cầu được đâm xuyên qua bởi một ống hợp kim $A B$ dài $320$ cm sao cho trục ống đi qua đúng tâm $I$ của mặt cầu. Hệ thống được treo lơ lửng sao cho tâm $I$ cách mặt sàn thủy canh (mặt phẳng ngang) đúng $130$ cm. Ống $A B$ được giữ nghiêng một góc $30^degree$ so với mặt sàn.
    Để cung cấp dưỡng chất, một ống mềm dẫn dung dịch được kéo thẳng từ đầu $A$, chạm vào một điểm $M$ tùy ý trên mặt sàn thủy canh, rồi nối thẳng lên đầu $B$. 
    Biết rằng ống dẫn luôn được kéo căng và không bị vướng vào quả cầu. Hãy tính tổng độ dài *ngắn nhất* của ống dẫn $M A + M B$ (đơn vị: centimet).
  ],
  [ 380 ],
  fig: cetz.canvas(length: 0.55cm, {
    import cetz.draw: *
    
    // Mặt sàn thủy canh (Màu xanh nước)
    line((-10, 0), (9, 0), stroke: (paint: rgb("00838f"), thickness: 2pt))
    content((7.5, 0.5), text(fill: rgb("00838f"), weight: "bold")[Mặt sàn thủy canh])
    
    // Tọa độ tâm I (130cm -> 6.5 đơn vị)
    let ix = 0
    let iy = 6.5 
    let i = (ix, iy)
    
    // Chiều dài IA = IB = 160cm -> 8 đơn vị
    let ax = ix + 8 * calc.cos(30deg)
    let ay = iy + 8 * calc.sin(30deg)
    let a = (ax, ay)
    
    let bx = ix - 8 * calc.cos(30deg)
    let by = iy - 8 * calc.sin(30deg)
    let b = (bx, by)
    
    // Điểm B' đối xứng qua mặt sàn
    let b_prime = (bx, -by)
    
    // Điểm M
    let mx = ax - (ax - bx) * (ay / (ay + by))
    let m = (mx, 0)
    
    // Trục đứng ảo từ I xuống sàn
    line(i, (0, 0), stroke: (dash: "dashed", paint: gray))
    
    // VẼ QUẢ CẦU "MẶT TRỜI NHÂN TẠO" (Bán kính 40cm -> 2 đơn vị)
    let r = 2 
    circle(i, radius: r, fill: rgb(255, 235, 59, 20%), stroke: (paint: rgb("fbc02d"), thickness: 1.5pt))
    
    // Kinh vĩ tuyến tạo độ sâu 3D
    circle(i, radius: (r*0.35, r), stroke: (dash: "dashed", paint: rgb("fbc02d"), thickness: 0.8pt))
    circle(i, radius: (r*0.7, r), stroke: (dash: "dashed", paint: rgb("fbc02d"), thickness: 0.8pt))
    
    let y_offset = r * 0.5
    let x_rad = r * 0.866 
    let y_rad = r * 0.17
    circle((ix, iy + y_offset), radius: (x_rad, y_rad), stroke: (dash: "dashed", paint: rgb("fbc02d"), thickness: 0.8pt))
    circle((ix, iy - y_offset), radius: (x_rad, y_rad), stroke: (dash: "dashed", paint: rgb("fbc02d"), thickness: 0.8pt))
    
    // Xích đạo
    arc((ix + r, iy), start: 0deg, stop: 180deg, radius: (r, r*0.2), stroke: (dash: "dashed", paint: rgb("e64a19"), thickness: 1.2pt))
    arc((ix - r, iy), start: 180deg, stop: 360deg, radius: (r, r*0.2), stroke: (paint: rgb("e64a19"), thickness: 1.2pt))
    
    // Ống hợp kim AB
    line(a, b, stroke: (paint: rgb("546e7a"), thickness: 3pt))
    circle(a, radius: 2.5pt, fill: black)
    circle(b, radius: 2.5pt, fill: black)
    circle(i, radius: 2.5pt, fill: red)
    
    content(a, $A$, anchor: "south-west", padding: 4pt)
    content(b, $B$, anchor: "north-east", padding: 4pt)
    content(i, $I$, anchor: "south-east", padding: 4pt)
    
    // Góc 30 độ
    line(i, (3.5, iy), stroke: (dash: "dashed", paint: gray))
    arc((ix + 2.5, iy), start: 0deg, stop: 30deg, radius: 2.5)
    content((2.5, iy + 0.5), $30^degree$)
    
    // Điểm đối xứng B'
    circle(b_prime, radius: 2.5pt, fill: gray)
    content(b_prime, $B'$, anchor: "north-west", padding: 4pt)
    line(b, b_prime, stroke: (dash: "dashed", paint: rgb("1976d2")))
    
    // Ống dẫn dung dịch M -> A và M -> B (Màu Cyan nổi bật)
    line(a, m, stroke: (paint: rgb("00bcd4"), thickness: 1.8pt))
    line(m, b, stroke: (paint: rgb("00bcd4"), thickness: 1.8pt))
    line(m, b_prime, stroke: (dash: "dashed", paint: rgb("00bcd4"), thickness: 1.2pt))
    
    circle(m, radius: 2.5pt, fill: rgb("00bcd4"))
    content((mx, -0.8), $M$, anchor: "north")
  }),
  fig-pos: "center",
  fig-width: 42%,
  loigiai: [
    #ppgiai[
      - *Bí mật Hình học (Conan Logic):* Khi dùng phép đối xứng mặt phẳng ngang, độ chênh lệch chiều cao $Delta H$ giữa điểm cao nhất ($A$) và điểm đối xứng ($B'$) *luôn luôn bằng $2$ lần chiều cao của tâm $I$*, hoàn toàn độc lập với chiều dài hay góc nghiêng của ống $A B$!
      - Ta chỉ cần tính hình chiếu ngang của $A B$, kết hợp với $Delta H = 2 h_I$ để dùng định lý Pitago là phá án thành công.
    ] 

    #step[Tính chiều cao các điểm và phát hiện quy luật]
    - Tâm $I$ cách mặt sàn $h_I = 130 text(" cm")$.
    - Ống $A B = 320 text(" cm")$, đi qua tâm $I$ nên $I A = I B = 160 text(" cm")$.
    - Chênh lệch chiều cao từ tâm $I$ đến $A$ (và từ $I$ đến $B$) là:
      $ Delta h = I A dot sin(30^degree) = 160 dot 1/2 = 80 text(" cm"). $
    - Chiều cao của $A$ và $B$ so với mặt sàn:
      $ h_A &= 130 + 80 = 210 text(" cm") \
        h_B &= 130 - 80 = 50 text(" cm"). $

    #step[Tính hình chiếu ngang của $A B$]
    - Hình chiếu vuông góc của ống $A B$ xuống mặt sàn có độ dài:
      $ L_(x y) = A B dot cos(30^degree) = 320 dot (sqrt(3))/2 = 160sqrt(3) text(" cm"). $

    #step[Áp dụng Nguyên lý phản xạ và tối ưu hóa]
    - Lấy $B'$ đối xứng với $B$ qua mặt sàn thủy canh. Khi đó $h_(B') = -h_B = -50 text(" cm")$.
    - Độ chênh lệch chiều cao giữa $A$ và $B'$ là:
      $ Delta H = h_A - h_(B') = 210 - (-50) = 260 text(" cm"). $
      *(Đúng bằng $2 h_I = 2 dot 130 = 260 text(" cm")$, góc $30^degree$ hoàn toàn bị triệt tiêu ở trục dọc!)*
    - Tổng độ dài ống dẫn nhỏ nhất chính là độ dài đoạn $A B'$ trong không gian. Áp dụng định lý Pitago mở rộng:
      $ (A B')^2 &= (L_(x y))^2 + (Delta H)^2 \
                 &= (160sqrt(3))^2 + 260^2 \
                 &= 76800 + 67600 = 144400. $
    - Quãng đường ống dẫn ngắn nhất là:
      $ A B' = sqrt(144400) = 380 text(" cm"). $
    
    Vậy độ dài ngắn nhất của ống dẫn cần dùng là *$380$* cm (một con số nguyên hoàn hảo, không cần làm tròn).
  ]
)

#tln(
  [
    Trong hệ thống khuôn viên thông minh (Smart Campus) của nền tảng EduAI Connect, người ta lắp đặt một trạm sạc drone giám sát có dạng mặt cầu $(S)$. Trong không gian $O x y z$ (đơn vị: mét), mặt cầu $(S)$ có tâm $I(1, 2, 3)$ và bán kính $R=5$. 
    Hệ thống sử dụng $3$ cột thu phát sóng Wi-fi định hướng được đặt tại các tọa độ $A(3, 10, 12)$, $B(1, 16, 16)$ và $C(5, 10, 14)$. Một chiếc drone $M$ (được xem như một điểm) đang đỗ trên bề mặt trạm sạc $(S)$. 
    Để tối ưu hóa, hệ thống AI cần chỉ định drone $M$ đỗ ở vị trí sao cho tổng năng lượng tiêu hao để duy trì kết nối với cả $3$ cột sóng là nhỏ nhất. Biết mức năng lượng này tỉ lệ thuận với biểu thức $P = M A^2 + M B^2 + M C^2$. Hãy tính giá trị *nhỏ nhất* của $P$.
  ],
  [ 340 ],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    let ix = 0
    let iy = 0
    let r = 2.2
    
    // Hình cầu nền (Màu Cyan công nghệ)
    circle((ix, iy), radius: r, fill: rgb("e0f7fa"), stroke: (paint: rgb("00acc1"), thickness: 1.5pt))
    
    // Hệ thống lưới 3D Cyber-style
    circle((ix, iy), radius: (r * 0.4, r), stroke: (dash: "dashed", paint: rgb("4dd0e1"), thickness: 0.8pt))
    circle((ix, iy), radius: (r * 0.8, r), stroke: (dash: "dashed", paint: rgb("4dd0e1"), thickness: 0.8pt))
    
    let y_offset = r * 0.5
    let x_rad = r * 0.866 
    let y_rad = r * 0.22
    circle((ix, iy + y_offset), radius: (x_rad, y_rad), stroke: (dash: "dashed", paint: rgb("4dd0e1"), thickness: 0.8pt))
    circle((ix, iy - y_offset), radius: (x_rad, y_rad), stroke: (dash: "dashed", paint: rgb("4dd0e1"), thickness: 0.8pt))
    
    // Đường xích đạo
    arc((ix + r, iy), start: 0deg, stop: 180deg, radius: (r, r*0.25), stroke: (dash: "dashed", paint: rgb("00838f"), thickness: 1.2pt))
    arc((ix - r, iy), start: 180deg, stop: 360deg, radius: (r, r*0.25), stroke: (paint: rgb("00838f"), thickness: 1.2pt))
    
    // Tâm I
    circle((ix, iy), radius: 2pt, fill: black)
    content((ix, iy), $I$, anchor: "north-west", padding: 5pt)
    
    // Trọng tâm G
    let G = (4.5, 2.5)
    circle(G, radius: 2.5pt, fill: rgb("d50000"))
    content(G, $G$, anchor: "south-east", padding: 5pt)
    
    // 3 Cột sóng A, B, C bao quanh G
    let A = (5.5, 4)
    let B = (3.5, 3)
    let C = (4.5, 0.5)
    
    // Vẽ tam giác ABC
    line(A, B, stroke: (paint: rgb("9e9e9e"), thickness: 1pt))
    line(B, C, stroke: (paint: rgb("9e9e9e"), thickness: 1pt))
    line(C, A, stroke: (paint: rgb("9e9e9e"), thickness: 1pt))
    
    circle(A, radius: 2pt, fill: black)
    circle(B, radius: 2pt, fill: black)
    circle(C, radius: 2pt, fill: black)
    content(A, $A$, anchor: "south-west", padding: 4pt)
    content(B, $B$, anchor: "north-east", padding: 4pt)
    content(C, $C$, anchor: "north-west", padding: 4pt)
    
    // Đường nối G với A, B, C
    line(G, A, stroke: (dash: "dotted", paint: gray))
    line(G, B, stroke: (dash: "dotted", paint: gray))
    line(G, C, stroke: (dash: "dotted", paint: gray))
    
    // Đường thẳng nối tâm I và G
    line((ix, iy), G, stroke: (dash: "dashed", paint: rgb("d50000"), thickness: 1.2pt))
    
    // Vị trí M (Drone) trên mặt cầu
    let dist_IG = calc.sqrt(4.5*4.5 + 2.5*2.5)
    let mx = r * (4.5 / dist_IG)
    let my = r * (2.5 / dist_IG)
    let M = (mx, my)
    
    circle(M, radius: 3pt, fill: rgb("ff6d00"))
    content((mx - 0.2, my + 0.3), text(fill: rgb("ff6d00"), weight: "bold")[$M$])
    
    // Tín hiệu kết nối từ M đến A, B, C (Màu Tím viễn thông)
    line(M, A, stroke: (paint: rgb("6200ea"), thickness: 1.2pt))
    line(M, B, stroke: (paint: rgb("6200ea"), thickness: 1.2pt))
    line(M, C, stroke: (paint: rgb("6200ea"), thickness: 1.2pt))
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - *Tuyệt kĩ Conan (Tâm tỉ cự):* Đứng trước biểu thức tổng bình phương khoảng cách đến nhiều điểm cố định, hãy gọi $G$ là *trọng tâm* của các điểm đó. 
      - Bằng phép chèn điểm vectơ $vect(M A) = vect(M G) + vect(G A)$, toàn bộ các thành phần rác sẽ bị triệt tiêu nhờ tính chất $vect(G A) + vect(G B) + vect(G C) = vect(0)$.
      - Bài toán 3 biến phức tạp lập tức biến thành: Tìm khoảng cách từ $M$ đến một điểm $G$ duy nhất!
    ]

    #step[Xác định trọng tâm $G$ và các hằng số]
    - Gọi $G$ là trọng tâm của tam giác $A B C$. Tọa độ của $G$ là trung bình cộng tọa độ của 3 điểm:
      $ x_G = (3 + 1 + 5)/3 = 9/3 = 3 \
        y_G = (10 + 16 + 10)/3 = 36/3 = 12 \
        z_G = (12 + 16 + 14)/3 = 42/3 = 14 $
      $=> G(3; 12; 14).$
    - Tính bình phương độ dài từ $G$ đến $A, B, C$:
      $ vect(G A) = (0; -2; -2) => G A^2 = 0^2 + (-2)^2 + (-2)^2 = 8 \
        vect(G B) = (-2; 4; 2) => G B^2 = (-2)^2 + 4^2 + 2^2 = 24 \
        vect(G C) = (2; -2; 0) => G C^2 = 2^2 + (-2)^2 + 0^2 = 8 $
    - Tổng hằng số: $G A^2 + G B^2 + G C^2 = 8 + 24 + 8 = 40$.

    #step[Biến đổi biểu thức năng lượng $P$]
    - Áp dụng công thức chèn điểm cho vectơ bình phương:
      $ P = M A^2 + M B^2 + M C^2 = (vect(M G) + vect(G A))^2 + (vect(M G) + vect(G B))^2 + (vect(M G) + vect(G C))^2 $
    - Khai triển và gom nhóm lại:
      $ P = 3 M G^2 + 2 vect(M G)(vect(G A) + vect(G B) + vect(G C)) + G A^2 + G B^2 + G C^2 $
    - Vì $G$ là trọng tâm nên $vect(G A) + vect(G B) + vect(G C) = vect(0)$. Cụm ở giữa biến mất. Ta thu được biểu thức vàng:
      $ P = 3 M G^2 + 40 $
    - Do đó, để $P$ đạt giá trị nhỏ nhất, khoảng cách $M G$ phải là *ngắn nhất*.

    #step[Tìm $M G$ nhỏ nhất bằng hình học mặt cầu]
    - Tâm trạm sạc là $I(1; 2; 3)$, bán kính $R=5$. Khoảng cách từ tâm $I$ đến trọng tâm $G$ là:
      $ vect(I G) = (3 - 1; 12 - 2; 14 - 3) = (2; 10; 11). $
      $ I G = sqrt(2^2 + 10^2 + 11^2) = sqrt(4 + 100 + 121) = sqrt(225) = 15. $
    - Vì $I G = 15 > R = 5$, điểm $G$ nằm ngoài mặt cầu. 
    - Drone $M$ chạy trên bề mặt trạm sạc. Đoạn thẳng $M G$ ngắn nhất khi $M$ là giao điểm của đoạn thẳng nối $I G$ với mặt cầu (M nằm giữa I và G).
    - Khoảng cách ngắn nhất đó là:
      $ M G_(min) = I G - R = 15 - 5 = 10 text(" (mét)"). $

    #step[Tính kết quả cuối cùng]
    - Thay $M G_(min) = 10$ vào biểu thức $P$:
      $ P_(min) = 3 dot (10)^2 + 40 = 300 + 40 = 340. $
    
    Vậy tổng năng lượng tiêu hao nhỏ nhất tương ứng với giá trị $P$ là *$340$*.
  ]
)

#import "@preview/cetz:0.5.2"

#tln(
  [
    Trong phòng thí nghiệm vật lý lượng tử, một "buồng giam hạt" (particle confinement chamber) có dạng mặt cầu $(S)$ với phương trình $(x-2)^2 + (y-3)^2 + (z+1)^2 = 49$ (đơn vị: cm). Một hệ thống từ trường điều khiển nhiệt độ tác động lên bề mặt buồng giam, tạo ra sự phân bố nhiệt độ tại mỗi điểm $M(x, y, z)$ trên mặt cầu tuân theo hàm số $T(x,y,z) = 3x - 6y + 2z + 100$ (đơn vị: Kelvin). 
    Các kỹ sư cần xác định "Cực nóng" (nơi nhiệt độ cao nhất $T_(max)$) và "Cực lạnh" (nơi nhiệt độ thấp nhất $T_(min)$) để lắp đặt van tản nhiệt. Hãy tính *độ chênh lệch nhiệt độ lớn nhất* $Delta T = T_(max) - T_(min)$ trên bề mặt buồng giam hạt này (tính bằng Kelvin).
  ],
  [ 98 ],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    let r = 2.5

    // Góc nghiêng của trục từ trường (Trục nóng - lạnh)
    let angle = 65deg
    let dx = calc.cos(angle)
    let dy = calc.sin(angle)

    // Tọa độ hai cực Nóng và Lạnh trên bản vẽ
    let Pmax = (r * dx, r * dy)
    let Pmin = (-r * dx, -r * dy)

    // Khối cầu nền (Màu xám nhạt kim loại)
    circle((0,0), radius: r, fill: rgb("f5f5f5"), stroke: (paint: rgb("9e9e9e"), thickness: 1.2pt))

    // Dùng group để xoay toàn bộ hệ thống vĩ tuyến và mặt phẳng tiếp xúc theo trục 65 độ
    group(name: "rot", {
      rotate(angle - 90deg) // Xoay để trục Y ảo trùng với vector n
      
      // Đường xích đạo (Nhiệt độ trung bình - Màu Cam)
      arc((r, 0), start: 0deg, stop: 180deg, radius: (r, r*0.25), stroke: (dash: "dashed", paint: rgb("ff9800"), thickness: 1.2pt))
      arc((-r, 0), start: 180deg, stop: 360deg, radius: (r, r*0.25), stroke: (paint: rgb("ff9800"), thickness: 1.2pt))

      // Vĩ tuyến cực Nóng (Màu Đỏ)
      let y_hot = r * 0.6
      let x_hot = calc.sqrt(r*r - y_hot*y_hot)
      arc((x_hot, y_hot), start: 0deg, stop: 180deg, radius: (x_hot, x_hot*0.25), stroke: (dash: "dashed", paint: rgb("f44336"), thickness: 0.8pt))
      arc((-x_hot, y_hot), start: 180deg, stop: 360deg, radius: (x_hot, x_hot*0.25), stroke: (paint: rgb("f44336"), thickness: 0.8pt))

      // Vĩ tuyến cực Lạnh (Màu Xanh dương)
      let y_cold = -r * 0.6
      let x_cold = calc.sqrt(r*r - y_cold*y_cold)
      arc((x_cold, y_cold), start: 0deg, stop: 180deg, radius: (x_cold, x_cold*0.25), stroke: (dash: "dashed", paint: rgb("2196f3"), thickness: 0.8pt))
      arc((-x_cold, y_cold), start: 180deg, stop: 360deg, radius: (x_cold, x_cold*0.25), stroke: (paint: rgb("2196f3"), thickness: 0.8pt))

      // Mặt phẳng tiếp xúc Nóng (T_max)
      let pw = 2.2
      let ph = 0.6
      line((-pw, r + ph), (pw, r + ph), (pw + 1.2, r - ph), (-pw + 1.2, r - ph), close: true, stroke: (paint: red, thickness: 1.2pt), fill: rgb(255, 0, 0, 15%))

      // Mặt phẳng tiếp xúc Lạnh (T_min)
      line((-pw, -r + ph), (pw, -r + ph), (pw + 1.2, -r - ph), (-pw + 1.2, -r - ph), close: true, stroke: (paint: blue, thickness: 1.2pt), fill: rgb(0, 0, 255, 15%))

      // Trục Vector pháp tuyến n
      line((0, -r*1.4), (0, r*1.4), stroke: (dash: "dotted", paint: black, thickness: 1.5pt), mark: (end: ">"))
      content((0, r*1.55), text(weight: "bold")[$vect(n)$])
    })

    // Các điểm nhấn và Label (đặt ngoài group để chữ không bị lật nghiêng)
    content(Pmax, text(fill: red, weight: "bold")[$T_(max)$], anchor: "south-east", padding: 5pt)
    content(Pmin, text(fill: blue, weight: "bold")[$T_(min)$], anchor: "north-west", padding: 5pt)
    
    circle(Pmax, radius: 2.5pt, fill: red)
    circle(Pmin, radius: 2.5pt, fill: blue)
    circle((0,0), radius: 2pt, fill: black)
    content((0,0), $I$, anchor: "west", padding: 5pt)
  }),
  fig-pos: "right",
  fig-width: 38%,
  loigiai: [
    #ppgiai[
      - *Giải mã Conan Logic:* Khi cần tìm GTLN, GTNN của một hàm bậc nhất $T = a x + b y + c z + d$ trên mặt cầu $(S)$, bản chất hình học của bài toán là đi tìm mặt phẳng $(P)$ có phương trình $a x + b y + c z + (d - T) = 0$ sao cho mặt phẳng này *tiếp xúc* với mặt cầu.
      - "Cực nóng" và "Cực lạnh" chính là hai tiếp điểm nằm ở hai đầu đường kính vuông góc với mặt phẳng.
      - Thay vì dùng đạo hàm hay Cauchy-Schwarz dài dòng, ta chỉ cần giải một bất phương trình duy nhất: *Khoảng cách từ tâm đến mặt phẳng phải nhỏ hơn hoặc bằng Bán kính*.
    ]

    #step[Phân tích các hằng số của mặt cầu]
    - Mặt cầu $(S)$ có phương trình $(x-2)^2 + (y-3)^2 + (z+1)^2 = 49$.
    - Xác định được tâm $I(2; 3; -1)$ và bán kính $R = sqrt(49) = 7$ (cm).

    #step[Chuyển bài toán tối ưu về chùm mặt phẳng]
    - Giả sử tại điểm $M(x;y;z) in (S)$, nhiệt độ đạt mức $T$. Ta có:
      $ 3x - 6y + 2z + 100 = T <=> 3x - 6y + 2z + (100 - T) = 0. $
    - Tập hợp tất cả các điểm trong không gian có cùng nhiệt độ $T$ sẽ tạo thành một mặt phẳng $(Q): 3x - 6y + 2z + (100 - T) = 0$.
    - Vectơ pháp tuyến của mặt phẳng này là $vect(n) = (3; -6; 2)$.
    - Độ dài vectơ pháp tuyến: $abs(vect(n)) = sqrt(3^2 + (-6)^2 + 2^2) = sqrt(9 + 36 + 4) = sqrt(49) = 7$.

    #step[Thiết lập điều kiện tiếp xúc]
    - Để có điểm $M$ thỏa mãn (nghĩa là mặt phẳng $(Q)$ phải có điểm chung với mặt cầu $(S)$), khoảng cách từ tâm $I$ đến mặt phẳng $(Q)$ không được vượt quá bán kính $R$:
      $ d(I, Q) <= R $
    - Áp dụng công thức khoảng cách từ điểm đến mặt phẳng:
      $ (abs(3(2) - 6(3) + 2(-1) + (100 - T))) / (sqrt(3^2 + (-6)^2 + 2^2)) <= 7 $
      $ (abs(6 - 18 - 2 + 100 - T)) / 7 <= 7 $
      $ (abs(86 - T)) / 7 <= 7 => abs(86 - T) <= 49 $
    - Giải bất phương trình trị tuyệt đối:
      $ -49 <= 86 - T <= 49 <=> 37 <= T <= 135 $

    #step[Đòn kết liễu siêu tốc]
    - Từ kết quả trên, ta suy ra:
      Nhiệt độ cao nhất: $T_(max) = 135 text(" K")$.
      Nhiệt độ thấp nhất: $T_(min) = 37 text(" K")$.
    - Chênh lệch nhiệt độ lớn nhất trên bề mặt buồng giam là:
      $ Delta T = T_(max) - T_(min) = 135 - 37 = 98 text(" K"). $
    
    #box(stroke: 1pt + rgb("1a7a2e"), fill: rgb("e8f5e9"), inset: 8pt, radius: 4pt)[
      *Mẹo cực nhanh cho trắc nghiệm:* Chênh lệch $Delta T$ giữa hai mặt phẳng tiếp xúc song song thực chất chính là *đường kính của mặt cầu nhân với độ dài vectơ pháp tuyến*.
      Công thức nổ máy: $Delta T = 2 R dot abs(vect(n)) = 2 dot 7 dot 7 = 98$. (Chỉ tốn 3 giây để ra đáp án!).
    ]
  ]
)
#tln(
  [
    Trong không gian $O x y z$, một thiết bị bay không người lái (Flycam) $M$ được lập trình để bay dọc theo một quỹ đạo hình tròn $(C)$. Biết quỹ đạo $(C)$ là giao tuyến của mặt cầu $(S): (x - 1)^2 + (y - 1)^2 + (z - 1)^2 = 2500$ và mặt phẳng $(P): x + 2y + 2z - 149 = 0$.
    
    Flycam $M$ liên tục thu phát tín hiệu với 3 trạm kiểm soát mặt đất là $A(10; 10; 10)$, $B(14; 20; 30)$ và $C(20; 23; 30)$. Hệ thống đánh giá chất lượng đường truyền tín hiệu thông qua hàm mục tiêu:
    $ T = abs(arrow(M A) + arrow(M B) + 2 arrow(M C)) $
    Hãy tính tổng giá trị lớn nhất và nhỏ nhất của hàm mục tiêu $T$ trong suốt quá trình Flycam bay trên quỹ đạo $(C)$.
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Vẽ mặt phẳng (P)
        line((-5, -2), (5, -2), (7, 3), (-3, 3), close: true, fill: rgb(0, 150, 255, 10%), stroke: (paint: blue, thickness: 1pt))
        content((-4, -1), text(fill: blue, weight: "bold")[$(P)$])
        
        // Quỹ đạo đường tròn (C) - vẽ dạng elip
        let h = (1, 0.5)
        circle(h, radius: (3.5, 1.2), stroke: (paint: red, thickness: 1.5pt), name: "C")
        circle(h, radius: 2pt, fill: red)
        content(h, $H$, anchor: "north", padding: 5pt)

        // Điểm K (Tâm tỉ cự) và hình chiếu K'
        let k_prime = (3, 1.2)
        let k = (3, 5)
        
        circle(k_prime, radius: 2pt, fill: black)
        content((3, 0.8), $K'$, anchor: "north")
        circle(k, radius: 3pt, fill: black)
        content(k, $K$, anchor: "west", padding: 5pt)
        
        line(k, k_prime, stroke: (dash: "dashed", paint: black, thickness: 1pt))
        // Ký hiệu vuông góc
        line((2.7, 1.2), (2.7, 1.5), (3.0, 1.5), stroke: 0.5pt)

        // Nối H và K' kéo dài cắt (C)
        line((-1.5, -0.375), (4, 1.55), stroke: (dash: "dotted", paint: black, thickness: 1pt))
        content((2.0, 0.9), $6$, anchor: "south-east") // Độ dài HK'

        // Hai điểm cực trị M_min, M_max
        let m1 = (4.3, 1.65)
        let m2 = (-2.3, -0.65)
        circle(m1, radius: 2.5pt, fill: orange)
        circle(m2, radius: 2.5pt, fill: orange)
        content(m1, $M_(min)$, anchor: "south-west", padding: 3pt)
        content(m2, $M_(max)$, anchor: "north-east", padding: 3pt)

        // Tam giác Pitago K - K' - M
        line(k, m1, stroke: (paint: green.darken(20%), thickness: 1.5pt))
        line(k, m2, stroke: (paint: green.darken(20%), thickness: 1.5pt))
        
        // Chú thích bán kính
        line(h, (-1, 1.5), stroke: (paint: red, thickness: 1pt))
        content((0, 1.1), text(fill: red)[$r = 14$])
        
        // Ký hiệu khoảng cách d
        content((3.3, 3), $15$, anchor: "west")
      })
    ]
  ],
  [ 168 ],
  loigiai: [
    #ppgiai[
      - *Bước 1 (Đại số Vector):* Cồng kềnh với 3 điểm $A, B, C$? Dùng ngay kĩ năng tìm *Tâm tỉ cự* $K$ để gom cụm vector về một điểm duy nhất: $T = 4 M K$.
      - *Bước 2 (Hình học Không gian):* Tìm tâm $H$, bán kính $r$ của quỹ đạo $(C)$. 
      - *Bước 3 (Hình chiếu & Pitago):* Chiếu điểm $K$ xuống mặt phẳng $(P)$ tạo thành $K'$. Đưa bài toán tối ưu khoảng cách không gian về bài toán phẳng: $M K^2 = K K'^2 + M K'^2$.
    ]

    *Bước 1: Thu gọn hàm mục tiêu bằng Tâm tỉ cự*
    Gọi $K(x; y; z)$ là điểm thỏa mãn hệ thức vector: $arrow(K A) + arrow(K B) + 2 arrow(K C) = arrow(0)$.
    Tọa độ điểm $K$ được tính theo công thức trọng số:
    $ x_K &= (x_A + x_B + 2 x_C) / (1 + 1 + 2) = (10 + 14 + 2(20)) / 4 = 64 / 4 = 16. \
    y_K &= (y_A + y_B + 2 y_C) / 4 = (10 + 20 + 2(23)) / 4 = 76 / 4 = 19. \
    z_K &= (z_A + z_B + 2 z_C) / 4 = (10 + 30 + 2(30)) / 4 = 100 / 4 = 25. $
    Vậy $K(16; 19; 25)$.
    Khi đó, chèn điểm $K$ vào biểu thức hàm mục tiêu:
    $ T &= abs((arrow(M K) + arrow(K A)) + (arrow(M K) + arrow(K B)) + 2(arrow(M K) + arrow(K C))) \
    &= abs(4 arrow(M K) + underbrace(arrow(K A) + arrow(K B) + 2 arrow(K C), arrow(0))) = 4 M K. $
    Như vậy, cực trị của $T$ phụ thuộc hoàn toàn vào cực trị của độ dài đoạn thẳng $M K$.

    *Bước 2: Tìm các thông số của quỹ đạo $(C)$*
    Mặt cầu $(S)$ có tâm $I(1; 1; 1)$ và bán kính $R = sqrt(2500) = 50$.
    Khoảng cách từ tâm $I$ đến mặt phẳng $(P)$ là:
    $ d(I, (P)) = (abs(1 + 2(1) + 2(1) - 149)) / (sqrt(1^2 + 2^2 + 2^2)) = (abs(-144)) / 3 = 48. $
    Bán kính của đường tròn quỹ đạo $(C)$:
    $ r = sqrt(R^2 - d^2) = sqrt(50^2 - 48^2) = 14. $
    Gọi $H$ là tâm của đường tròn $(C)$. Đường thẳng qua $I$, vuông góc $(P)$ có pt tham số: $x = 1+t, y = 1+2t, z = 1+2t$.
    Giao điểm $H$ với $(P)$ tương ứng $t=16$, ta được $H(17; 33; 33)$.

    *Bước 3: Chiếu điểm $K$ xuống mặt phẳng $(P)$*
    Khoảng cách từ điểm kiểm soát $K(16; 19; 25)$ đến mặt phẳng $(P)$ là:
    $ d(K, (P)) = (abs(16 + 2(19) + 2(25) - 149)) / 3 = (abs(104 - 149)) / 3 = 45 / 3 = 15. $
    Gọi $K'$ là hình chiếu vuông góc của $K$ lên $(P)$. 
    Ta tính khoảng cách giữa hai tâm $H$ và $K'$ (có thể dùng độ dài vector trên mặt phẳng $(P)$):
    $ H K'^2 = I K^2 - (d_I - d_K)^2 quad text("(vì I, K cùng phía so với P)") $
    $ arrow(I K) = (15; 18; 24) => I K^2 = 15^2 + 18^2 + 24^2 = 225 + 324 + 576 = 1125. $
    $ H K'^2 = 1125 - (48 - 15)^2 = 1125 - 33^2 = 1125 - 1089 = 36 \
    => H K' = 6. $

    *Bước 4: Tối ưu hóa và kết luận*
    Bây giờ, mọi thứ diễn ra trên mặt phẳng $(P)$. Điểm $M$ chạy trên đường tròn tâm $H$ bán kính $r=14$. Khoảng cách từ $H$ đến $K'$ là $6$.
    Vì $6 < 14$, điểm $K'$ nằm TRONG quỹ đạo bay. Khoảng cách lớn nhất và nhỏ nhất từ $M$ đến $K'$ là:
    $ M K'_(max) = r + H K' = 14 + 6 = 20. \
    M K'_(min) = r - H K' = 14 - 6 = 8. $
    
    Áp dụng định lý Pitago cho tam giác vuông $K K' M$:
    $ M K^2 = K K'^2 + M K'^2 = 15^2 + M K'^2 = 225 + M K'^2. $
    Do đó:
    $ M K_(max) = sqrt(225 + 20^2) = sqrt(225 + 400) = sqrt(625) = 25. \
    M K_(min) = sqrt(225 + 8^2) = sqrt(225 + 64) = sqrt(289) = 17. $
    
    Quay lại hàm mục tiêu ban đầu ($T = 4 M K$):
    $ T_(max) = 4 dot 25 = 100 \
    T_(min) = 4 dot 17 = 68 $
    
    Tổng giá trị lớn nhất và nhỏ nhất là: $100 + 68 = 168$.

    #nhanxet[Có thể coi bài toán này là một *bản giao hưởng của các bộ ba Pitago*: (14-48-50), (15-20-25) và (8-15-17). Việc dùng Tâm tỉ cự đã khéo léo bóc tách lớp mặt nạ cồng kềnh của vector, trả bài toán về đúng bản chất tinh khiết nhất của Hình học không gian.]
  ]
)
#tn(
  [Một vệ tinh viễn thông được đặt tại điểm $S$ trong không gian cách tâm Trái Đất một khoảng $d = 2R$ (với $R = 6400 " km"$ là bán kính Trái Đất). Vệ tinh phát ra chùm sóng hình nón tiếp xúc với mặt cầu Trái Đất. Gọi $(C)$ là đường tròn giới hạn vùng phủ sóng lớn nhất trên mặt đất. Tính bán kính $r$ của đường tròn vùng phủ sóng $(C)$ (giả sử sóng truyền theo đường thẳng).],
  ([$6400 " km"$], [$3200 " km"$], True([$3200 sqrt(3) " km"$]), [$1600 " km"$]),
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Trái đất nền
    circle((0,0), radius: 2, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    
    // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt)
    circle((0,0), radius: (0.7, 2), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle((0,0), radius: (1.4, 2), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    
    // Đường xích đạo màu đỏ: Nét đứt nửa sau, nét liền nửa trước
    arc((2,0), start: 0deg, stop: 180deg, radius: (2, 0.4), stroke: (dash: "dashed", paint: red, thickness: 1pt))
    arc((-2,0), start: 180deg, stop: 360deg, radius: (2, 0.4), stroke: (paint: red, thickness: 1pt))
    
    // Đỉnh vệ tinh S
    let S = (0, 4)
    let y_c = 1
    let x_c = 1.732
    let r_y = 0.35
    
    // Vùng sóng nón (Màu nền mờ)
    line(S, (-x_c, y_c), (x_c, y_c), close: true, fill: rgb("ffa50022"), stroke: none)
    
    // Đường tròn vùng phủ sóng (C): Nét đứt nửa sau, nét liền nửa trước
    arc((x_c, y_c), start: 0deg, stop: 180deg, radius: (x_c, r_y), stroke: (dash: "dashed", paint: orange, thickness: 1pt))
    arc((-x_c, y_c), start: 180deg, stop: 360deg, radius: (x_c, r_y), stroke: (paint: orange, thickness: 1.2pt))
    content((2.1, y_c), $(C)$, fill: orange, anchor: "west")
    
    // Các đường tiếp tuyến của sóng (nón)
    line(S, (x_c, y_c), stroke: (paint: orange, thickness: 1.2pt))
    line(S, (-x_c, y_c), stroke: (paint: orange, thickness: 1.2pt))
    
    // Điểm S và O
    circle(S, radius: 1.5pt, fill: black)
    content(S, $S$, anchor: "south-west", padding: 5pt)
    circle((0,0), radius: 1.5pt, fill: black)
    content((0,0), $O$, anchor: "north-west", padding: 5pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Vệ tinh tại $S$ phát sóng tiếp xúc với Trái Đất (tâm $O$, bán kính $R$) tạo thành một hình nón có đỉnh là $S$. Vùng tiếp xúc là đường tròn $(C)$.
      - Xét mặt cắt phẳng đi qua trục đối xứng $O S$. Mặt cắt này cắt mặt cầu theo một đường tròn lớn và cắt hình nón theo hai đường sinh (là hai tiếp tuyến của đường tròn).
      - Gọi $M$ là một tiếp điểm. Khi đó tam giác $O M S$ vuông tại $M$ (do tính chất tiếp tuyến).
      - Bán kính $r$ của đường tròn $(C)$ chính là đường cao hạ từ $M$ xuống cạnh huyền $O S$ trong tam giác vuông $O M S$.
    ]
    
    Xét mặt cắt đi qua tâm Trái Đất $O$ và vệ tinh $S$. Khi đó, vùng Trái Đất nhận được sóng bị giới hạn bởi hai tiếp tuyến kẻ từ $S$ đến đường tròn mặt cắt.
    
    Gọi $M$ là một điểm tiếp xúc. Ta có tam giác $O M S$ vuông tại $M$.
    Theo giả thiết, bán kính Trái Đất là $O M = R = 6400 " km"$, khoảng cách từ vệ tinh đến tâm Trái Đất là $O S = d = 2R$.
    
    Trong tam giác vuông $O M S$, ta có:
    $ sin(angle O S M) = (O M) / (O S) = R / (2R) = 1/2 => angle O S M = 30^degree. $
    Góc ở tâm tương ứng là:
    $ angle M O S = 90^degree - 30^degree = 60^degree. $
    
    Gọi $H$ là hình chiếu vuông góc của $M$ trên $O S$. Đường tròn $(C)$ chính là đường tròn vĩ tuyến có tâm là $H$ và bán kính là $r = M H$.
    Xét tam giác vuông $O M H$, ta tính được bán kính vùng phủ sóng:
    $ r = M H = O M dot sin(angle M O S) = R dot sin(60^degree) = R dot sqrt(3)/2. $
    Thay $R = 6400 " km"$ vào, ta được:
    $ r = 6400 dot sqrt(3)/2 = 3200 sqrt(3) " (km)". $
    
    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Trục đối xứng
        line((0, -2.5), (0, 4.5), stroke: (dash: "dashed", paint: gray))
        
        // Mặt cắt Trái Đất
        circle((0,0), radius: 2, stroke: (paint: rgb("2e7d32"), thickness: 1pt), fill: rgb("e8f5e933"))
        
        // Điểm S
        let S = (0, 4)
        
        // Điểm M (tiếp điểm) - Góc 60 độ so với trục tung
        let M = (1.732, 1) // 2*sin(60), 2*cos(60)
        let H = (0, 1)
        
        // Vẽ tiếp tuyến
        line(S, M, stroke: (paint: orange, thickness: 1.2pt))
        line(S, (-1.732, 1), stroke: (paint: orange, thickness: 1.2pt))
        
        // Nối O M và M H
        line((0,0), M, stroke: (paint: black, thickness: 1pt))
        line(M, H, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        line((-1.732, 1), H, stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        
        // Ký hiệu vuông góc
        line((1.55, 1), (1.55, 1.2), (1.732, 1.2), stroke: 0.6pt)
        line((0, 1.2), (0.2, 1.2), (0.2, 1), stroke: 0.6pt)
        
        // Các điểm và nhãn
        circle((0,0), radius: 1.5pt, fill: black); content((-0.2, -0.2), $O$)
        circle(S, radius: 1.5pt, fill: black); content(S, $S$, anchor: "west", padding: 3pt)
        circle(M, radius: 1.5pt, fill: black); content(M, $M$, anchor: "south-west", padding: 3pt)
        circle(H, radius: 1.5pt, fill: black); content(H, $H$, anchor: "north-east", padding: 3pt)
        
        content((0.866, 1.2), $r$, fill: blue)
        content((0.866, 0.4), $R$)
        content((-0.2, 2.5), $2R$, anchor: "east")
      })
    ]
    
    Vậy bán kính vùng phủ sóng là $3200 sqrt(3) " km"$. Chọn đáp án *C*.
    
    #nhanxet[
      Việc áp dụng mặt cắt qua trục giúp chuyển bài toán không gian (hình nón ngoại tiếp mặt cầu) về bài toán hình học phẳng (hai tiếp tuyến kẻ từ một điểm ngoài đường tròn). Đây là kỹ thuật thiết yếu để tính toán các yếu tố như bán kính, chiều cao hay diện tích vùng phủ sóng trong thực tế.
    ]
  ]
)
