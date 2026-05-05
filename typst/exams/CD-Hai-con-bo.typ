#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.0"


#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

// ==========================================
// THIẾT KẾ GIAO DIỆN TIÊU ĐỀ
// ==========================================
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)

// ==========================================
// HÀM VẼ ĐA GIÁC CƠ BẢN (DÙNG CHUNG)
// ==========================================
#let draw-poly(n, r: 1.2) = {
  import cetz.draw: *
  degreele((0, 0), radius: r, stroke: luma(200) + 0.5pt)
  for i in range(n) {
    degreele((90deg - i * 360deg / n, r), radius: 1.2pt, fill: gray)
  }
}
// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill: math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display
// ==========================================
// NỘI DUNG TÀI LIỆU
// ==========================================
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        CHỦ ĐỀ HAI CON BỌ RÙA
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        Vấn đề tốc độ thay đổi liên tục tăng và giảm.
      ]
    ],
  )
]
#tln(
  [
    Từ điểm $A$ trên mặt đất hai con bọ rùa I và II bò sát mặt đất theo hai hướng tạo với nhau một góc $50^degree$, với tốc độ lần lượt là $4 " cm/s"$ và $5 " cm/s"$, sau đó $20$ giây thì hai con bọ rùa bắt đầu đổi hướng bay lên trên không theo hai hướng vuông góc với các hướng ban đầu của chúng. Do lúc bò ở mặt đất con bọ rùa II bò nhanh quá nên thấm mệt và khi chuyển động trên không tốc độ của nó chỉ bằng một nửa con bọ rùa I. Biết rằng hai con bọ rùa này gặp nhau tại điểm $B$. Hãy xác định độ cao của điểm $B$ so với mặt đất theo đơn vị centimet (_làm tròn kết quả đến hàng phần mười_)?
  ],
  [$27,9$],
  loigiai: [
    #ppgiai[
      - *Mô hình hóa hình học:* Đặt gốc tọa độ tại điểm xuất phát $A(0;0;0)$, mặt đất là mặt phẳng tọa độ $O x y$. Trục $O z$ hướng thẳng đứng lên trên.
      - Tại thời điểm bắt đầu bay, hai con bọ ở các vị trí $M_1$ và $M_2$ trên mặt đất. Quãng đường bò $s = v dot t$.
      - Hướng bay "vuông góc với hướng ban đầu" có nghĩa là mặt phẳng chứa quỹ đạo bay vuông góc với các vectơ hướng bò $vect(A M_1)$ và $vect(A M_2)$. Do đó, hình chiếu vuông góc $H$ của điểm gặp nhau $B$ lên mặt đất phải thỏa mãn: $M_1 H perp A M_1$ và $M_2 H perp A M_2$.
      - Khai thác tỉ lệ tốc độ bay để lập phương trình liên hệ khoảng cách: $M_1 B = 2 M_2 B$.
      - Sử dụng định lý Pythagore trong các tam giác vuông để giải tìm độ cao $h = B H$.
    ]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Các đường nét đứt biểu diễn mặt phẳng
        line((-1,0), (6,0), stroke: (dash: "dashed", paint: gray))
        content((6,0), $x$, anchor: "west")
        line((0,-0.5), (2, 3.5), stroke: (dash: "dashed", paint: gray))
        content((2.1, 3.6), $y$, anchor: "south-west")
        
        let A = (0,0)
        circle(A, radius: 1.5pt, fill: black)
        content(A, $A$, anchor: "north-east", padding: 0.15)
        
        // Vị trí M1 (thu nhỏ tọa độ để vẽ)
        let M1 = (4, 0)
        line(A, M1, stroke: (paint: blue, thickness: 1.2pt), mark: (end: ">"))
        circle(M1, radius: 1.5pt, fill: blue)
        content(M1, $M_1$, anchor: "north", padding: 0.15)
        
        // Vị trí M2
        let angle = 45deg // Góc mô phỏng phối cảnh
        let M2 = (5 * calc.cos(angle), 5 * calc.sin(angle))
        line(A, M2, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
        circle(M2, radius: 1.5pt, fill: red)
        content(M2, $M_2$, anchor: "south-east", padding: 0.15)
        
        // Góc 50 độ
        arc(A, start: 0deg, stop: angle, radius: 1)
        content((1.3, 0.4), $50^degree$)
        
        // Điểm H (Hình chiếu của B)
        let H = (4, 2.8) 
        line(M1, H, stroke: (dash: "dashed", paint: black))
        line(M2, H, stroke: (dash: "dashed", paint: black))
        circle(H, radius: 1.5pt, fill: black)
        content(H, $H$, anchor: "north-west", padding: 0.1)
        
        // Ký hiệu vuông góc tại M1 và M2
        line((3.7, 0), (3.7, 0.3), (4, 0.3), stroke: 0.5pt)
        
        let vM2 = (calc.cos(angle), calc.sin(angle))
        let nM2 = (-calc.sin(angle), calc.cos(angle))
        line((M2.at(0) - 0.3*vM2.at(0), M2.at(1) - 0.3*vM2.at(1)), 
             (M2.at(0) - 0.3*vM2.at(0) + 0.3*nM2.at(0), M2.at(1) - 0.3*vM2.at(1) + 0.3*nM2.at(1)),
             (M2.at(0) + 0.3*nM2.at(0), M2.at(1) + 0.3*nM2.at(1)), stroke: 0.5pt)

        // Điểm B (Độ cao h)
        let B = (4, 5.5)
        line(H, B, stroke: (paint: rgb("008000"), thickness: 1.5pt))
        content((4, 4), $h$, anchor: "west", padding: 0.15, fill: rgb("008000"))
        circle(B, radius: 1.5pt, fill: rgb("008000"))
        content(B, $B$, anchor: "south", padding: 0.15)
        
        // Quỹ đạo bay M1B và M2B
        line(M1, B, stroke: (paint: blue, thickness: 1pt))
        line(M2, B, stroke: (paint: red, thickness: 1pt))
      })
    ]

    *Phân tích và giải chi tiết:*

    *Bước 1: Tọa độ hóa các điểm trên mặt đất.*
    Chọn hệ trục tọa độ $O x y z$ với gốc tọa độ là điểm $A(0;0;0)$. Mặt đất là mặt phẳng $(O x y)$.
    Sau $t = 20" s"$, quãng đường hai con bọ rùa bò được lần lượt là:
    $ A M_1 = 4 times 20 = 80 " (cm)" quad "và" quad A M_2 = 5 times 20 = 100 " (cm)" $
    Giả sử con bọ I bò theo chiều dương của trục $O x$, ta có tọa độ $M_1(80; 0; 0)$.
    Hướng của con bọ II tạo với trục $O x$ góc $50^degree$, nên tọa độ của $M_2$ là:
    $ M_2 (100 cos 50^degree; 100 sin 50^degree; 0) $

    *Bước 2: Phân tích đường bay và tìm hình chiếu $H$.*
    Gọi điểm gặp nhau trên không là $B(x_H; y_H; h)$, với $h$ là độ cao cần tìm ($h > 0$).
    Hình chiếu vuông góc của $B$ lên mặt đất là $H(x_H; y_H; 0)$. 
    Vì quỹ đạo bay nằm trong mặt phẳng vuông góc với hướng bò ban đầu, nên đoạn thẳng hình chiếu $M_1 H$ và $M_2 H$ lần lượt vuông góc với $A M_1$ và $A M_2$.
    - Tại $M_1$: $vect(M_1 H) perp vect(A M_1)$ (vuông góc trục $O x$) nên hoành độ của $H$ bằng hoành độ của $M_1$:
      $ x_H = 80 $
    - Tại $M_2$: Tam giác $A M_2 H$ vuông tại $M_2$, ta áp dụng định lý Pytago $M_2 H^2 = A H^2 - A M_2^2$:
      $ M_2 H^2 = (x_H^2 + y_H^2) - 100^2 = 80^2 + y_H^2 - 10000 = y_H^2 - 3600 quad (1) $
    - Mặt khác, ta giải trực tiếp $y_H$ bằng tích vô hướng $vect(M_2 H) dot vect(A M_2) = 0$:
      $ (x_H - 100 cos 50^degree) dot (100 cos 50^degree) + (y_H - 100 sin 50^degree) dot (100 sin 50^degree) = 0 $
      Rút gọn cho $100$ và thay $x_H = 80$:
      $ (80 - 100 cos 50^degree) cos 50^degree + (y_H - 100 sin 50^degree) sin 50^degree = 0 $
      $ <=> 80 cos 50^degree + y_H sin 50^degree - 100(cos^2 50^degree + sin^2 50^degree) = 0 $
      $ <=> y_H = (100 - 80 cos 50^degree)/(sin 50^degree) $
      Bấm máy tính tính toán ta thu được:
      $ y_H approx 63","4127 " (cm)" quad => quad y_H^2 approx 4021","18 $

    *Bước 3: Thiết lập phương trình tìm độ cao $h$.*
    Gọi thời gian từ lúc cất cánh đến khi gặp nhau là $t'$. Vận tốc bay của bọ II bằng nửa bọ I ($v_2 = v_1 / 2$). Do đó, quãng đường bay của bọ I gấp đôi bọ II: 
    $ M_1 B = 2 M_2 B quad => quad M_1 B^2 = 4 M_2 B^2 $
    Áp dụng Pytago cho các tam giác vuông đứng $M_1 H B$ và $M_2 H B$:
    - $M_1 B^2 = M_1 H^2 + B H^2 = (x_H - 80)^2 + (y_H - 0)^2 + h^2 = y_H^2 + h^2$.
    - $M_2 B^2 = M_2 H^2 + h^2 = (y_H^2 - 3600) + h^2$ (do kết quả từ pt (1)).
    
    Thay vào phương trình tỉ lệ:
    $ y_H^2 + h^2 = 4(y_H^2 - 3600 + h^2) $
    $ <=> y_H^2 + h^2 = 4y_H^2 - 14400 + 4h^2 $
    $ <=> 3h^2 = 14400 - 3y_H^2 $
    $ <=> h^2 = 4800 - y_H^2 $
    
    Cuối cùng, thay giá trị $y_H^2 approx 4021","18$ vào:
    $ h^2 approx 4800 - 4021","18 = 778","82 $
    $ => h = sqrt(778","82) approx 27","907... " (cm)" $
    Làm tròn kết quả đến hàng phần mười, ta thu được độ cao của điểm $B$ là *$27,9$* cm.

    #meo[
      Điểm mấu chốt của bài này là nhận ra ý nghĩa hình học của cụm từ "hướng bay vuông góc với hướng ban đầu". Nó ám chỉ rằng *hình chiếu* của điểm $B$ xuống mặt đất chính là giao điểm của hai đường thẳng vuông góc với hai tia quỹ đạo $A M_1, A M_2$ tại các điểm mút $M_1, M_2$. Việc dùng Pytago ($A H^2 - A M_2^2$) giúp né được phép khai triển tọa độ phức tạp cho độ dài $M_2 H^2$.
    ]
  ],
)

// CÂU SÁNG TÁC 1: BÀI TOÁN TỌA ĐỘ FLYCAM
#tln(
  [
    Hai chiếc flycam I và II xuất phát cùng lúc từ điểm $O$ trên một bãi đất phẳng. Chúng bay ở độ cao là mặt phẳng đất theo hai hướng tạo với nhau một góc $60^degree$. Tốc độ bay ngang của flycam I là $6 " m/s"$ và flycam II là $10 " m/s"$. Sau đúng $5$ giây, hệ thống tự động điều khiển cả hai chiếc flycam cùng lúc đổi hướng bay thẳng lên trên trời. Biết quỹ đạo bay lên của mỗi chiếc nằm trong mặt phẳng vuông góc với mặt đất và vuông góc với hướng bay ngang ban đầu của chúng. Tốc độ bay lên theo phương thẳng đứng của flycam I gấp $2$ lần tốc độ bay lên của flycam II. Giả sử hai chiếc flycam này va chạm nhau tại điểm $B$ trên không trung. Hãy xác định độ cao của điểm $B$ so với mặt đất theo đơn vị mét (_làm tròn kết quả đến hàng phần mười_)?
  ],
  [$22,4$],
  loigiai: [
    #ppgiai[
      - *Bước 1 (Mô hình hóa):* Gắn hệ trục tọa độ $O x y z$ với $O$ là điểm xuất phát, mặt đất là mặt phẳng $(O x y)$. Trục $O z$ hướng thẳng lên trời.
      - *Bước 2 (Tìm tọa độ mặt đất):* Tính quãng đường di chuyển ngang sau thời gian $t$. Dùng lượng giác để xác định tọa độ $M_1, M_2$ của hai flycam trước khi bay lên.
      - *Bước 3 (Xác định hình chiếu):* Khai thác giả thiết quỹ đạo bay thẳng lên "vuông góc với hướng bay ngang ban đầu". Điều này đồng nghĩa hình chiếu $H$ của điểm gặp nhau $B$ xuống mặt đất phải thỏa mãn: $M_1 H perp O M_1$ và $M_2 H perp O M_2$.
      - *Bước 4 (Thiết lập phương trình):* Tính tọa độ $H$. Sử dụng tỉ lệ tốc độ bay thẳng đứng để lập phương trình liên hệ giữa các quãng đường $M_1 B$ và $M_2 B$, từ đó tính độ cao $h$.
    ]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Phép chiếu 3D -> 2D giả lập
        let p(x, y, z) = (x + y * 0.35, z + y * 0.3)
        
        // Trục tọa độ
        line(p(0,0,0), p(4.5,0,0), mark: (end: ">"), stroke: (paint: gray, dash: "dashed"))
        content(p(4.7,0,0), $x$, anchor: "west")
        line(p(0,0,0), p(0,5.5,0), mark: (end: ">"), stroke: (paint: gray, dash: "dashed"))
        content(p(0,5.7,0), $y$, anchor: "south")
        line(p(0,0,0), p(0,0,3.5), mark: (end: ">"), stroke: (paint: gray, dash: "dashed"))
        content(p(0,0,3.7), $z$, anchor: "south")
        
        let O = p(0,0,0)
        circle(O, radius: 1.5pt, fill: black)
        content(O, $O$, anchor: "north-east", padding: 0.15)
        
        // Tọa độ thực (thu nhỏ tỉ lệ: chia cho 10)
        // M1(3, 0)
        let M1 = p(3, 0, 0)
        line(O, M1, stroke: (paint: blue, thickness: 1.5pt), mark: (end: ">"))
        circle(M1, radius: 1.5pt, fill: blue)
        content(M1, $M_1$, anchor: "north", padding: 0.15)
        
        // M2(2.5, 2.5*sqrt(3)) ~ (2.5, 4.33)
        let M2 = p(2.5, 4.33, 0)
        line(O, M2, stroke: (paint: red, thickness: 1.5pt), mark: (end: ">"))
        circle(M2, radius: 1.5pt, fill: red)
        content(M2, $M_2$, anchor: "south-east", padding: 0.1)
        
        // Góc 60 độ (minh họa)
        bezier(p(0.8,0,0), p(0.4, 0.69, 0), p(0.8, 0.2, 0), p(0.6, 0.5, 0), stroke: 0.5pt)
        content(p(1.2, 0.4, 0), $60^degree$)
        
        // Hình chiếu H(3, 70/sqrt(3)) ~ (3, 4.04)
        let H = p(3, 4.04, 0)
        line(M1, H, stroke: (dash: "dashed", paint: black))
        line(M2, H, stroke: (dash: "dashed", paint: black))
        circle(H, radius: 1.5pt, fill: black)
        content(H, $H$, anchor: "north-west", padding: 0.1)
        
        // Ký hiệu vuông góc giả lập
        line(p(2.7, 0, 0), p(2.7, 0.4, 0), p(3, 0.4, 0), stroke: 0.5pt)
        
        // Điểm B (độ cao h ~ 2.24)
        let B = p(3, 4.04, 2.24)
        line(H, B, stroke: (paint: rgb("008000"), thickness: 1.5pt))
        content(p(3, 4.04, 1.1), $h$, anchor: "west", padding: 0.15, fill: rgb("008000"))
        circle(B, radius: 1.5pt, fill: rgb("008000"))
        content(B, $B$, anchor: "south", padding: 0.15)
        
        // Quỹ đạo bay lên
        line(M1, B, stroke: (paint: blue, thickness: 1pt))
        line(M2, B, stroke: (paint: red, thickness: 1pt))
        
        content(p(3.5, -1, 0), [Mặt đất $(O x y)$], fill: gray)
      })
    ]

    *Phân tích và giải chi tiết:*

    *1. Tọa độ hóa các vị trí trên mặt đất:*
    - Gắn trục $O x$ trùng với hướng bay ngang của flycam I. Ta có tọa độ điểm cất cánh $M_1$ (sau 5 giây):
      $ O M_1 = 6 times 5 = 30 " (m)" quad => quad M_1(30; 0; 0) $
    - Hướng bay ngang của flycam II tạo với $O x$ một góc $60^degree$. Quãng đường $O M_2$:
      $ O M_2 = 10 times 5 = 50 " (m)" $
      Tọa độ điểm cất cánh $M_2$ là:
      $ M_2 (50 cos 60^degree; 50 sin 60^degree; 0) = M_2(25; 25sqrt(3); 0) $

    *2. Xác định hình chiếu $H$ của điểm va chạm $B$:*
    - Gọi $B(x_H; y_H; h)$ là điểm hai flycam gặp nhau ($h > 0$). Hình chiếu vuông góc của $B$ lên mặt đất là $H(x_H; y_H; 0)$.
    - Theo giả thiết, quỹ đạo bay lên vuông góc với hướng bay ngang ban đầu. Do đó, các đoạn thẳng hình chiếu $M_1 H$ và $M_2 H$ vuông góc với các vectơ hướng $vect(O M_1)$ và $vect(O M_2)$.
      + *Tại $M_1$:* $M_1 H perp O x => x_H = x_(M_1) = 30$.
      + *Tại $M_2$:* $vect(M_2 H) perp vect(O M_2)$.
        $ vect(M_2 H) = (x_H - 25; y_H - 25sqrt(3); 0) $
        $ vect(O M_2) = (25; 25sqrt(3); 0) $
        Tích vô hướng bằng 0 (triệt tiêu số $25$ cho gọn):
        $ (x_H - 25) dot 1 + (y_H - 25sqrt(3)) dot sqrt(3) = 0 $
        Thay $x_H = 30$ vào:
        $ (30 - 25) + y_H sqrt(3) - 25(3) = 0 quad <=> quad 5 - 75 + y_H sqrt(3) = 0 $
        $ <=> y_H sqrt(3) = 70 quad <=> quad y_H = 70/sqrt(3) $
    - Bình phương khoảng cách từ $M_1, M_2$ đến $H$:
      $ M_1 H^2 = (30 - 30)^2 + y_H^2 = (70/sqrt(3))^2 = 4900/3 $
      $ M_2 H^2 = (30 - 25)^2 + (70/sqrt(3) - 25sqrt(3))^2 = 5^2 + ((70 - 75)/sqrt(3))^2 = 25 + 25/3 = 100/3 $

    *3. Tìm độ cao $h$:*
    - Gọi thời gian bay thẳng lên là $t'$. Vận tốc bay lên của flycam I gấp 2 lần flycam II ($V_1 = 2 V_2$). 
    - Quãng đường bay lên tỉ lệ thuận với vận tốc: $M_1 B = 2 M_2 B => M_1 B^2 = 4 M_2 B^2$.
    - Áp dụng định lý Pytago cho các tam giác vuông $M_1 H B$ và $M_2 H B$:
      $ M_1 H^2 + h^2 = 4(M_2 H^2 + h^2) $
      $ <=> 4900/3 + h^2 = 4(100/3 + h^2) $
      $ <=> 4900/3 + h^2 = 400/3 + 4h^2 $
      $ <=> 3h^2 = 4500/3 = 1500 $
      $ <=> h^2 = 500 quad => quad h = sqrt(500) = 10sqrt(5) $
    - Bấm máy tính: $10sqrt(5) approx 22","3606...$ mét.
    - Làm tròn kết quả đến hàng phần mười, ta thu được *$22,4$*.

    #meo[
      Việc sử dụng trực tiếp công thức khoảng cách tọa độ $M_2 H^2 = (x_H - x_(M_2))^2 + (y_H - y_(M_2))^2$ sẽ giúp học sinh tránh bị rối so với việc dùng hình học thuần túy. Hơn nữa, việc tính toán để nguyên phân số $4900/3$ và $100/3$ sẽ giúp bài toán ra được số đẹp $1500$, loại bỏ hoàn toàn sai số trung gian!
    ]
  ],
)

// CÂU SÁNG TÁC 2: BÀI TOÁN AUV LẶN DƯỚI BIỂN
#tln(
  [
    Từ một trạm nổi $A$ trên mặt biển phẳng lặng, hai thiết bị lặn không người lái (AUV) I và II di chuyển trên mặt nước theo hai hướng tạo với nhau một góc $60^degree$. Tốc độ di chuyển trên mặt nước của AUV I là $2 " m/s"$ và AUV II là $5 " m/s"$. Sau $12$ giây di chuyển, hai thiết bị bắt đầu lặn sâu xuống đáy biển. Biết quỹ đạo lặn của mỗi thiết bị nằm trong mặt phẳng vuông góc với mặt nước và vuông góc với hướng di chuyển ban đầu của chúng trên mặt nước. AUV I được trang bị động cơ lặn tốt hơn nên tốc độ lặn gấp $3$ lần tốc độ lặn của AUV II. Hai thiết bị cuối cùng gặp nhau tại một trạm thu thập dữ liệu $B$ đặt dưới đáy biển. Hỏi độ sâu của trạm $B$ so với mặt nước biển là bao nhiêu mét (_làm tròn kết quả đến hàng phần mười_)?
  ],
  [$18,2$],
  loigiai: [
    #ppgiai[
      - *Mô hình hóa:* Đặt gốc tọa độ tại $A(0;0;0)$, mặt nước là mặt phẳng $(O x y)$. Trục $O z$ hướng xuống dưới đáy biển (hoặc dùng độ sâu $h > 0$).
      - *Tính tọa độ:* Xác định tọa độ $M_1, M_2$ của hai AUV trên mặt nước sau 12 giây.
      - *Tìm hình chiếu:* Hình chiếu $H$ của trạm $B$ lên mặt nước là giao điểm của hai đường thẳng kẻ từ $M_1 perp A M_1$ và từ $M_2 perp A M_2$. Thiết lập hệ phương trình tọa độ để tìm $H$.
      - *Giải phương trình khoảng cách:* Tốc độ lặn gấp 3 lần đồng nghĩa với quãng đường $M_1 B = 3 M_2 B$. Kết hợp định lý Pytago $M B^2 = M H^2 + h^2$ để giải tìm độ sâu $h$.
    ]

    *Phân tích và giải chi tiết:*

    *1. Tọa độ hóa vị trí AUV trên mặt nước:*
    - Chọn trục $A x$ dọc theo hướng di chuyển của AUV I. Quãng đường sau 12 giây:
      $ A M_1 = 2 times 12 = 24 " (m)" quad => quad M_1(24; 0; 0) $
    - Hướng của AUV II tạo góc $60^degree$ với $A x$. Quãng đường:
      $ A M_2 = 5 times 12 = 60 " (m)" $
      Tọa độ điểm lặn $M_2$:
      $ M_2 (60 cos 60^degree; 60 sin 60^degree; 0) = M_2(30; 30sqrt(3); 0) $

    *2. Xác định hình chiếu $H$ của điểm $B$:*
    - Gọi $B(x_H; y_H; -h)$ với $h > 0$ là độ sâu. Hình chiếu lên mặt nước là $H(x_H; y_H; 0)$.
    - Theo điều kiện vuông góc:
      + *Đường lặn 1:* $M_1 H perp A x => x_H = x_(M_1) = 24$.
      + *Đường lặn 2:* $vect(M_2 H) perp vect(A M_2)$.
        Vectơ $vect(M_2 H) = (x_H - 30; y_H - 30sqrt(3); 0)$. Vectơ $vect(A M_2)$ có hướng $(1; sqrt(3); 0)$.
        Tích vô hướng:
        $ (x_H - 30) dot 1 + (y_H - 30sqrt(3)) dot sqrt(3) = 0 $
        Thay $x_H = 24$:
        $ (24 - 30) + y_H sqrt(3) - 30(3) = 0 quad <=> quad -6 - 90 + y_H sqrt(3) = 0 $
        $ <=> y_H sqrt(3) = 96 quad <=> quad y_H = 96/sqrt(3) = 32sqrt(3) $
    - Bình phương khoảng cách trên mặt nước:
      $ M_1 H^2 = (24 - 24)^2 + (32sqrt(3))^2 = 1024 times 3 = 3072 $
      $ M_2 H^2 = (24 - 30)^2 + (32sqrt(3) - 30sqrt(3))^2 = (-6)^2 + (2sqrt(3))^2 = 36 + 12 = 48 $

    *3. Tìm độ sâu $h$:*
    - Tốc độ lặn của AUV I gấp 3 lần AUV II, với cùng thời gian lặn ta có quãng đường lặn: 
      $ M_1 B = 3 M_2 B quad => quad M_1 B^2 = 9 M_2 B^2 $
    - Áp dụng Pytago cho không gian 3 chiều:
      $ M_1 H^2 + h^2 = 9(M_2 H^2 + h^2) $
      $ <=> 3072 + h^2 = 9(48 + h^2) $
      $ <=> 3072 + h^2 = 432 + 9h^2 $
      $ <=> 8h^2 = 2640 quad <=> quad h^2 = 330 $
      $ => h = sqrt(330) approx 18","1659... $
    - Làm tròn kết quả đến hàng phần mười, độ sâu của trạm $B$ là *$18,2$* mét.

    #luuy[
      Dù bài toán đổi ngữ cảnh từ "bay lên" (trục z dương) thành "lặn xuống" (trục z âm), cấu trúc toán học của định lý Pytago $d^2 = (Delta x)^2 + (Delta y)^2 + (Delta z)^2$ không hề thay đổi. Thành phần độ cao hay độ sâu đều đóng vai trò là tham số $h^2$ trong phương trình.
    ]
  ],
)