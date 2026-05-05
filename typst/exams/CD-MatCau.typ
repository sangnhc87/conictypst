#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.0"
#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

#show: stexgv-doc.with(
  doc-type: "book",
  title: "CHUYÊN ĐỀ: Mặt Cầu",
  author: "GV Nguyễn Văn Sang",
  theme-color: classic.blue
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
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: Mặt Cầu]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Kỹ thuật tọa độ hóa và công thức giải nhanh bài toán Parabol nội tiếp hình chữ nhật.]
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
