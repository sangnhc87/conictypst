#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
 
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  school: "Sở GD&ĐT",
  exam-title: "KỲ THI KHẢO SÁT CHẤT LƯỢNG",
  subject: "TOÁN",
  duration: "90 phút",
  structure: auto,         // tự đếm số câu mỗi phần
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,      // tắt thanh xanh trên đỉnh
  header-border: true,
)



// Câu 2
#tln(
  [Người ta trang trí một bảng ô vuông $5 times 5$ bằng các *Ngôi sao* và *Bông hoa* $(*)$ giống nhau. Mỗi ô vuông nhỏ được dán một đối tượng sao cho trong mỗi hàng và mỗi cột của bảng đó đều có đúng *2 Ngôi sao* (và $3$ Bông hoa). Có tất cả bao nhiêu cách trang trí bảng lưới này?],
  [$2040$],
  fig: cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    
    // Kẻ lưới 5x5
    for i in range(6) {
      line((0, i), (5, i), stroke: 0.8pt + black)
      line((i, 0), (i, 5), stroke: 0.8pt + black)
    }
    
    // Cấu hình mẫu minh họa
    let config = (
      (1,1,0,0,0),
      (0,1,1,0,0),
      (0,0,1,1,0),
      (0,0,0,1,1),
      (1,0,0,0,1)
    )
    
    // Điền nội dung vào lưới
    for r in range(5) {
      for c in range(5) {
        let cx = c + 0.5
        let cy = 4.5 - r
        if config.at(r).at(c) == 1 {
          content((cx, cy), text(fill: red, size: 18pt)[★])
        } else {
          content((cx, cy), text(fill: blue, size: 16pt)[$*$])
        }
      }
    }
  }),
  fig-pos: "center",
  loigiai: [
    #ppgiai[
      - Bài toán tương đương với việc đếm số ma trận nhị phân kích thước $n times n$ (với $n=5$), trong đó các phần tử là $1$ (Ngôi sao) và $0$ (Bông hoa), sao cho tổng các phần tử trên mỗi hàng và mỗi cột đều bằng $2$.
      - Gọi $A_n$ là số ma trận thỏa mãn. Ta xét cách xếp ở dòng cuối cùng (dòng thứ $n$):
        + Có $C_n^2$ cách chọn 2 vị trí điền số $1$ ở dòng $n$ (giả sử ở cột $i$ và cột $j$).
        + Ở cột $i$ và cột $j$ còn thiếu đúng một số $1$ nữa. Ta chia làm 2 trường hợp:\
          *Trường hợp 1:* Số $1$ còn thiếu của cột $i$ và cột $j$ cùng nằm trên một dòng $k$ nào đó ($k < n$). Có $n-1$ cách chọn dòng $k$. Xóa dòng $n$, dòng $k$ và cột $i$, cột $j$, ta được ma trận cấp $(n-2)$ thỏa mãn yêu cầu $=> (n-1)A_(n-2)$ cách.\
          *Trường hợp 2:* Số $1$ còn thiếu của cột $i$ và cột $j$ nằm ở hai dòng khác nhau. Ta có thể "chập" cột $i$ và cột $j$ thành một cột mới cần hai số $1$, khi đó bài toán đưa về ma trận cấp $n-1$. Với mỗi cấu hình của ma trận cấp $n-1$, ta có $2$ cách tách ngược lại ra cột $i$ và cột $j$ $=> 2A_(n-1)$ cách.
      - Ta có công thức truy hồi: $A_n = C_n^2 (2A_(n-1) + (n-1)A_(n-2))$.
    ]
    
    Khởi tạo các giá trị đầu tiên:
    - $n=1$: Không thể có tổng bằng $2$, nên $A_1 = 0$.
    - $n=2$: Ma trận $2 times 2$ toàn số $1$, nên $A_2 = 1$.
    
    Áp dụng công thức truy hồi $A_n = C_n^2 (2A_(n-1) + (n-1)A_(n-2))$:
    - $n=3$: $A_3 = C_3^2 (2A_2 + 2A_1) = 3 (2 dot 1 + 2 dot 0) = 6$.
    - $n=4$: $A_4 = C_4^2 (2A_3 + 3A_2) = 6 (2 dot 6 + 3 dot 1) = 6(12 + 3) = 90$.
    - $n=5$: $A_5 = C_5^2 (2A_4 + 4A_3) = 10 (2 dot 90 + 4 dot 6) = 10(180 + 24) = 2040$.
    
    Vậy đối với bảng lưới $5 times 5$, có tất cả *$2040$* cách trang trí thỏa mãn yêu cầu bài toán.
    
    #align(center)[
      #cetz.canvas(length: 0.55cm, {
        import cetz.draw: *
        for i in range(6) {
          line((0, i), (5, i), stroke: 0.5pt + gray)
          line((i, 0), (i, 5), stroke: 0.5pt + gray)
        }
        let config = (
          (1,1,0,0,0),
          (0,1,1,0,0),
          (0,0,1,1,0),
          (0,0,0,1,1),
          (1,0,0,0,1)
        )
        for r in range(5) {
          for c in range(5) {
            let cx = c + 0.5
            let cy = 4.5 - r
            if config.at(r).at(c) == 1 {
              content((cx, cy), text(fill: red, size: 14pt)[★])
            } else {
              content((cx, cy), text(fill: blue, size: 14pt)[$*$])
            }
          }
        }
      })
    ]
    
    #nhanxet[Nhận xét của bạn rất tinh tế khi đưa về được truy hồi! Tuy nhiên, công thức chính xác phải có thêm hệ số $(n-1)$ ở số hạng $A_(n-2)$, tức là $A_n = C_n^2 (2A_(n-1) + (n-1)A_(n-2))$. Lý do là khi hai số $1$ còn thiếu của $2$ cột nằm trên cùng một dòng, ta có $(n-1)$ lựa chọn cho dòng đó (trừ dòng cuối cùng $n$). Dãy số này chính là dãy OEIS A001496 nổi tiếng trong lý thuyết đồ thị (đếm số đồ thị hai phía đều bậc 2 trên tập $n$ đỉnh).]
  ]
)

#tln(
  [Trong công viên, vòng đu quay (Ferris wheel) là đường tròn $(T)$ trong không gian $O x y z$ (mặt đất là mặt phẳng $O x y$). Ba cabin ở vị trí $M(20 ; 10 ; 5)$, $N(35 ; 25 ; 20)$, $P(5 ; 55 ; 20)$. Vòng quay giữ cố định mặt phẳng quỹ đạo. Tính khoảng cách từ điểm cao nhất của đu quay xuống mặt đất (làm tròn đến 1 chữ số thập phân).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Mặt đất Oxy
      line((-3.5, -0.5), (3.5, -0.5), (4.5, 1), (-2.5, 1), close: true, fill: rgb("e6e6e680"), stroke: gray)
      content((-2, 0), $(O x y)$)

      // Mặt phẳng quỹ đạo
      line((-1.5, 1), (3, 2), (4, 5.5), (-0.5, 4.5), close: true, fill: rgb("0057b81a"), stroke: (paint: blue, dash: "dashed"))
      content((3, 5), $(M N P)$)

      // Quỹ đạo (T)
      group({
        translate((1.2, 3.2))
        rotate(35deg)
        circle((0,0), radius: (2.2, 0.8), stroke: (paint: red, thickness: 1.2pt))
        
        // Điểm trên quỹ đạo
        circle((0, 0), radius: 1.5pt, fill: black); content((0.3, -0.2), $I$)
        circle((2.2, 0), radius: 1.5pt, fill: black); content((2.5, 0), $M$)
        circle((-1.1, 0.69), radius: 1.5pt, fill: black); content((-1.4, 0.8), $N$)
        circle((-1.1, -0.69), radius: 1.5pt, fill: black); content((-1.4, -0.8), $P$)
      })
    })
  ]
  ],
  [$26,9$],
  loigiai: [
    #ppgiai[
      - Mặt đất là mặt phẳng $(O x y)$ có phương trình $z = 0$. Khoảng cách từ một điểm $A(x_A; y_A; z_A)$ đến mặt đất chính là trị tuyệt đối cao độ $|z_A|$.
      - Vòng đu quay là đường tròn $(T)$ đi qua 3 điểm $M, N, P$. Viết phương trình mặt phẳng $(M N P)$, sau đó tìm tâm $I$ và bán kính $R$ của đường tròn $(T)$.
      - Góc nghiêng của mặt phẳng $(M N P)$ so với mặt đất nằm ngang là $gamma$. Độ chênh lệch cao độ lớn nhất từ tâm $I$ đến các điểm trên đường biên là $Delta z = R sin gamma$.
      - Khi đó, các điểm đặc biệt có cao độ:
        + Điểm cao nhất: $z_"max" = z_I + Delta z$.
        + Điểm thấp nhất: $z_"min" = z_I - Delta z$.
    ]
    
    *Bước 1: Viết phương trình mặt phẳng quỹ đạo $(M N P)$.*
    Ta có: $vect(M N) = (15; 15; 15)$ và $vect(M P) = (-15; 45; 15)$.
    Vectơ pháp tuyến của mặt phẳng $(M N P)$ là:
    $ vect(n) = [vect(M N), vect(M P)] = (15 dot 15 - 15 dot 45; 15 dot (-15) - 15 dot 15; 15 dot 45 - 15 dot (-15)) = (-450; -450; 900). $
    Chọn vectơ pháp tuyến rút gọn là $vect(n) = (1; 1; -2)$.
    Phương trình mặt phẳng $(M N P)$ đi qua $M(20; 10; 5)$:
    $ 1(x - 20) + 1(y - 10) - 2(z - 5) = 0 <=> x + y - 2z - 20 = 0. $
    
    *Bước 2: Tìm tâm $I$ và bán kính $R$ của vòng quay.*
    Tâm $I(x; y; z)$ là tâm đường tròn ngoại tiếp tam giác $M N P$. Giải hệ:
    $ heva(
      I in (M N P),
      I M^2 = I N^2,
      I N^2 = I P^2
    ) <=> heva(
      x + y - 2z = 20,
      x + y + z = 57.5,
      -x + y = 20
    ) <=> heva(
      x = 12.5,
      y = 32.5,
      z = 12.5
    ) $
    Vậy $I(12.5; 32.5; 12.5)$ nên $z_I = 12.5$.
    Bán kính đường tròn vòng quay:
    $ R = sqrt((12.5 - 20)^2 + (32.5 - 10)^2 + (12.5 - 5)^2) = sqrt(618.75) approx 24.87 " (m)". $
    
    *Bước 3: Tìm các vị trí cao nhất và thấp nhất.*
    Gọi $gamma$ là góc giữa mặt phẳng $(M N P)$ và mặt đất $(O x y)$ (có vtpt $vect(k) = (0; 0; 1)$):
    $ cos gamma = (|vect(n) dot vect(k)|)/(|vect(n)| dot |vect(k)|) = (|-2|)/(sqrt(1^2 + 1^2 + (-2)^2) dot 1) = 2/sqrt(6) = sqrt(2/3). $
    $ => sin gamma = sqrt(1 - cos^2 gamma) = 1/sqrt(3). $
    Độ chênh lệch cao độ $Delta z$ từ tâm $I$ đến điểm biên là:
    $ Delta z = R sin gamma = sqrt(618.75) dot 1/sqrt(3) = sqrt(206.25) approx 14.36 " (m)". $
    
    - Điểm cao nhất có cao độ: $z_"max" = z_I + Delta z = 12.5 + 14.36 = 26.86 " (m)".$
    - Điểm thấp nhất có cao độ: $z_"min" = z_I - Delta z = 12.5 - 14.36 = -1.86 " (m)".$
    
    Làm tròn đến 1 chữ số thập phân, khoảng cách từ điểm cao nhất xuống mặt đất là *$26,9$* m.
    
    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        
        let GroundY = 0
        let I = (0, 1.25)
        let R = 2.8
        let gamma = 35deg
        
        let H_max = (I.at(0) + R*calc.cos(gamma), I.at(1) + R*calc.sin(gamma))
        let H_min = (I.at(0) - R*calc.cos(gamma), I.at(1) - R*calc.sin(gamma))
        
        // Mặt đất
        line((-4, GroundY), (4, GroundY), stroke: 1.2pt + rgb("8b4513"))
        content((-3.2, GroundY + 0.3), [Mặt đất $(z=0)$],fill: rgb("8b4513"), weight: "bold")
        
        // Quỹ đạo đường tròn nhìn nghiêng
        group({
          translate(I)
          rotate(gamma)
          circle((0,0), radius: (R, 0.4), stroke: (paint: rgb("1b5aed"), thickness: 1.2pt))
        })
        
        // Đường kính dốc nhất H_min -> H_max
        line(H_min, H_max, stroke: (paint: red, thickness: 1.2pt))
        
        // Đường nằm ngang kẻ từ điểm thấp nhất H_min để thể hiện góc gamma
        let H_min_ngang = (H_min.at(0) + 2.5, H_min.at(1))
        line(H_min, H_min_ngang, stroke: (dash: "dashed", paint: gray))
        
        // Vẽ cung góc gamma tại điểm biên H_min
        arc(H_min, start: 0deg, stop: gamma, radius: 1.0, mode: "PIE", fill: rgb("ff990040"), stroke: none)
        content((H_min.at(0) + 1.2, H_min.at(1) + 0.35), $gamma$, fill: rgb("cc7a00"), weight: "bold")
        
        // Hình chiếu xuống mặt đất
        let I_p = (I.at(0), GroundY)
        let H_max_p = (H_max.at(0), GroundY)
        let H_min_p = (H_min.at(0), GroundY)
        
        // Đường gióng cao độ (H_min nằm dưới mặt đất nên gióng ngược lên)
        line(H_max, H_max_p, stroke: (dash: "dotted", paint: orange, thickness: 1.2pt))
        line(I, I_p, stroke: (dash: "dotted", paint: black, thickness: 1.2pt))
        line(H_min, H_min_p, stroke: (dash: "dotted", paint: blue, thickness: 1.2pt))
        
        // Ký hiệu góc vuông tại mặt đất
        let sq_s = 0.15
        line((I_p.at(0), sq_s), (I_p.at(0)+sq_s, sq_s), (I_p.at(0)+sq_s, 0), stroke: 0.5pt)
        line((H_max_p.at(0), sq_s), (H_max_p.at(0)-sq_s, sq_s), (H_max_p.at(0)-sq_s, 0), stroke: 0.5pt)
        line((H_min_p.at(0), -sq_s), (H_min_p.at(0)+sq_s, -sq_s), (H_min_p.at(0)+sq_s, 0), stroke: 0.5pt)
        
        // Vẽ điểm và dán nhãn
        circle(I, radius: 2pt, fill: black); content((I.at(0)-0.3, I.at(1)+0.2), $I$)
        circle(H_max, radius: 2pt, fill: orange); content((H_max.at(0), H_max.at(1)+0.3), $H_"max"$, fill: orange, weight: "bold")
        circle(H_min, radius: 2pt, fill: blue); content((H_min.at(0)-0.5, H_min.at(1)-0.1), $H_"min"$, fill: blue, weight: "bold")
        
        circle(I_p, radius: 1.5pt, fill: black); content((I_p.at(0)+0.2, -0.2), $I'$)
        circle(H_max_p, radius: 1.5pt, fill: orange); content((H_max_p.at(0)+0.3, -0.2), $H'_"max"$, fill: orange, weight: "bold")
        circle(H_min_p, radius: 1.5pt, fill: blue); content((H_min_p.at(0)-0.3, 0.2), $H'_"min"$, fill: blue, weight: "bold")
        
        // Nhãn khoảng cách
        content((H_max.at(0) + 0.4, (H_max.at(1)+GroundY)/2), $z_"max"$, fill: orange, weight: "bold")
        content((I.at(0) + 0.3, (I.at(1)+GroundY)/2), $z_I$, fill: black, weight: "bold")
        content((H_min.at(0) - 0.4, (H_min.at(1)+GroundY)/2), $z_"min"$, fill: blue, weight: "bold")
        
        // Kẻ ngang từ I qua để thấy Delta z
        line(I, (H_max.at(0), I.at(1)), stroke: (dash: "dashed", paint: gray))
        line((H_max.at(0), I.at(1)), H_max, mark: (start: "<", end: ">"), stroke: (paint: red))
        content((H_max.at(0) - 0.4, (H_max.at(1)+I.at(1))/2), $Delta z$, fill: red, weight: "bold")
      })
    ]
    
    #nhanxet[
      Dựa vào hình chiếu cắt ngang, ta dễ dàng quan sát thấy cao độ điểm thấp nhất $z_"min" = -1.86 < 0$. Điều này cho thấy quỹ đạo của vòng đu quay có một phần chìm xuống dưới mặt đất khoảng $1.86$ mét (như phần móng hoặc rãnh hầm của hệ thống).
    ]
  ]
)

#tln(
  [Trong công viên, vòng đu quay (Ferris wheel) là đường tròn $(T)$ trong không gian $O x y z$ (mặt đất là mặt phẳng $O x y$). Ba cabin ở vị trí $M(20 ; 10 ; 5)$, $N(35 ; 25 ; 20)$, $P(5 ; 55 ; 20)$. Vòng quay giữ cố định mặt phẳng quỹ đạo. Tính khoảng cách từ điểm cao nhất của đu quay xuống mặt đất (làm tròn đến 1 chữ số thập phân).],
  [$26,9$],
  loigiai: [
    #ppgiai[
      - Mặt đất là mặt phẳng $O x y$ có phương trình $z = 0$. Khoảng cách từ một điểm $A(x_A; y_A; z_A)$ đến mặt đất chính là trị tuyệt đối cao độ $|z_A|$ của điểm đó.
      - Vòng đu quay là đường tròn $(T)$ đi qua 3 điểm $M, N, P$. Ta cần viết phương trình mặt phẳng $(M N P)$ chứa vòng quay, tìm tâm $I$ và bán kính $R$ của đường tròn $(T)$.
      - Góc nghiêng của mặt phẳng $(M N P)$ so với mặt đất nằm ngang là $gamma$. Độ chênh lệch cao độ lớn nhất từ tâm $I$ đến điểm cao nhất/thấp nhất của đường tròn là $Delta z = R sin gamma$.
      - Cao độ điểm cao nhất sẽ là: $z_"max" = z_I + Delta z$.
      - Cao độ điểm thấp nhất sẽ là: $z_"min" = z_I - Delta z$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        // Mặt đất Oxy (z = 0)
        line((-5, -0.5), (3, -0.5), (4, 0.5), (-4, 0.5), close: true, fill: rgb("e6e6e6cc"), stroke: gray)
        content((-4, 0), [Mặt đất $(O x y) \ z=0$], anchor: "east")

        // Tọa độ giả lập trên bản vẽ 2D
        let I = (0, 2.5)
        let H_max = (2.5, 5.5)
        let H_min = (-2.5, -0.5)

        // Quỹ đạo đường tròn (mô phỏng ellipse 3D)
        group({
          translate(I)
          rotate(50.19deg) // arctan(3/2.5) để khớp với trục H_min -> H_max
          circle((0,0), radius: (3.905, 1.2), stroke: (paint: rgb("1b5aed"), thickness: 1.2pt))
        })

        // Trục nằm ngang qua I để xác định góc
        line((-3, 2.5), (3, 2.5), stroke: (paint: gray, dash: "dashed"))
        
        // Đường kính dốc nhất H_min -> H_max
        line(H_min, H_max, stroke: (paint: red, thickness: 1.2pt))
        
        // Góc nghiêng gamma
        arc(I, start: 0deg, stop: 50.19deg, radius: 1.2, mode: "PIE", fill: rgb("ff990040"), stroke: none)
        content((1.0, 2.8), $gamma$, fill: rgb("cc7a00"), weight: "bold")

        // Hình chiếu vuông góc xuống mặt đất (y=0 trên canvas)
        let I_p = (0, 0)
        let H_max_p = (2.5, 0)
        let H_min_p = (-2.5, 0)

        // Các đường gióng cao độ
        line(H_max, H_max_p, stroke: (paint: orange, dash: "dashed", thickness: 1pt))
        line(I, I_p, stroke: (paint: black, dash: "dashed", thickness: 1pt))
        line(H_min, H_min_p, stroke: (paint: blue, dash: "dashed", thickness: 1pt))

        // Ký hiệu cao độ
        content((2.5, 2.75), $z_"max"$, anchor: "west", padding: 3pt, fill: orange)
        content((0, 1.25), $z_I$, anchor: "west", padding: 3pt)
        content((-2.5, -0.25), $z_"min"$, anchor: "east", padding: 3pt, fill: blue)

        // Các điểm thực tế
        circle(I, radius: 2pt, fill: black); content((-0.1, 2.7), $I$, anchor: "south-east")
        circle(H_max, radius: 2pt, fill: orange); content(H_max, $H_"max"$, anchor: "south-west", padding: 3pt)
        circle(H_min, radius: 2pt, fill: blue); content((-2.6, -0.6), $H_"min"$, anchor: "north-east", padding: 3pt)

        // Các điểm hình chiếu trên mặt đất
        circle(I_p, radius: 1.5pt, fill: black); content((0, -0.3), $I'$, anchor: "north")
        circle(H_max_p, radius: 1.5pt, fill: orange); content((2.5, -0.3), $H'_"max"$, anchor: "north")
        circle(H_min_p, radius: 1.5pt, fill: blue); content((-2.5, 0.3), $H'_"min"$, anchor: "south")

        // Ký hiệu Delta z
        line((2.5, 2.5), (2.5, 5.5), mark: (start: "<", end: ">"), stroke: (paint: red))
        content((2.5, 4), $Delta z$, anchor: "west", padding: 3pt, fill: red)
        
        // Chú thích phụ
        content((1.2, 4.3), $R$, fill: red, weight: "bold")
      })
    ]

    *Bước 1: Viết phương trình mặt phẳng quỹ đạo $(M N P)$.*
    Ta có: $vect(M N) = (15; 15; 15)$ và $vect(M P) = (-15; 45; 15)$.
    Vectơ pháp tuyến của mặt phẳng $(M N P)$ là:
    $ vect(n) = [vect(M N), vect(M P)] = (15 dot 15 - 15 dot 45; 15 dot (-15) - 15 dot 15; 15 dot 45 - 15 dot (-15)) = (-450; -450; 900). $
    Chọn vectơ pháp tuyến rút gọn là $vect(n) = (1; 1; -2)$.
    Phương trình mặt phẳng $(M N P)$ đi qua $M(20; 10; 5)$ là:
    $ 1(x - 20) + 1(y - 10) - 2(z - 5) = 0 <=> x + y - 2z - 20 = 0. $
    
    *Bước 2: Tìm tâm $I$ và bán kính $R$ của vòng quay.*
    Tâm $I(x; y; z)$ của đường tròn là tâm đường tròn ngoại tiếp tam giác $M N P$. Giải hệ điều kiện:
    $ heva(
      I in (M N P),
      I M^2 = I N^2,
      I N^2 = I P^2
    ) <=> heva(
      x + y - 2z - 20 = 0,
      (x-20)^2 + (y-10)^2 + (z-5)^2 = (x-35)^2 + (y-25)^2 + (z-20)^2,
      (x-35)^2 + (y-25)^2 + (z-20)^2 = (x-5)^2 + (y-55)^2 + (z-20)^2
    ) $
    Khai triển và rút gọn hai phương trình dưới, ta được hệ:
    $ heva(
      x + y - 2z = 20,
      x + y + z = 57.5,
      -x + y = 20
    ) $
    Giải hệ phương trình trên, ta thu được tọa độ tâm $I$:
    $ z_I = (57.5 - 20) / 3 = 12.5 $
    $ x + y = 45 " và " -x + y = 20 => y = 32.5; x = 12.5 $
    Vậy $I(12.5; 32.5; 12.5)$.
    Bán kính đường tròn vòng quay:
    $ R^2 = I M^2 = (12.5 - 20)^2 + (32.5 - 10)^2 + (12.5 - 5)^2 = 618.75 $
    $ => R = sqrt(618.75) approx 24.87 " (m)". $
    
    *Bước 3: Tìm điểm cao nhất của vòng quay.*
    Gọi $gamma$ là góc giữa mặt phẳng $(M N P)$ và mặt đất $(O x y)$. 
    Vectơ pháp tuyến của mặt đất là $vect(k) = (0; 0; 1)$.
    $ cos gamma = (|vect(n) dot vect(k)|)/(|vect(n)| dot |vect(k)|) = (|-2|)/(sqrt(1^2 + 1^2 + (-2)^2) dot 1) = 2/sqrt(6) = sqrt(2/3). $
    $ => sin gamma = sqrt(1 - cos^2 gamma) = sqrt(1 - 2/3) = 1/sqrt(3). $
    Độ chênh lệch cao độ từ tâm $I$ đến điểm cao nhất $H_"max"$ của đường tròn là:
    $ Delta z = R sin gamma = sqrt(618.75) dot 1/sqrt(3) = sqrt(206.25) approx 14.36 " (m)". $
    Cao độ của điểm cao nhất là:
    $ z_"max" = z_I + Delta z = 12.5 + sqrt(206.25) approx 26.86 " (m)". $
    
    Làm tròn đến 1 chữ số thập phân, khoảng cách từ điểm cao nhất xuống mặt đất là *$26,9$* m.
    
    #nhanxet(title: [Làm rõ về vị trí thấp nhất (min):])[
      Qua hình vẽ minh họa, ta thấy rõ quỹ đạo không nằm ngang mà bị nghiêng một góc $gamma$. Nếu tính toán cao độ của điểm thấp nhất $H_"min"$, ta sẽ được:
      $ z_"min" = z_I - Delta z = 12.5 - sqrt(206.25) approx -1.86 " (m)". $
      Giá trị *âm* này ($z_"min" < 0$) mang ý nghĩa là điểm thấp nhất của quỹ đạo đu quay đã "xuyên" qua và nằm thấp hơn mặt đất $(O x y)$ một khoảng $1.86" m"$. Hình chiếu của quỹ đạo lên trục $O z$ sẽ trải dài từ đoạn âm này lên đến đỉnh $26.9" m"$.
    ]
  ]
)

#tln(
  [Trong công viên, vòng đu quay (Ferris wheel) là đường tròn $(T)$ trong không gian $O x y z$ (mặt đất là mặt phẳng $O x y$). Ba cabin ở vị trí $M(20 ; 10 ; 5)$, $N(35 ; 25 ; 20)$, $P(5 ; 55 ; 20)$. Vòng quay giữ cố định mặt phẳng quỹ đạo. Tính khoảng cách từ điểm cao nhất của đu quay xuống mặt đất (làm tròn đến 1 chữ số thập phân).],
  [$26,9$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Mặt đất Oxy
    line((-3.5, -2), (3.5, -2), (4.5, 0), (-2.5, 0), close: true, fill: rgb("e6e6e6"), stroke: gray)
    content((-2.5, -1), $(O x y) \ z=0$, anchor: "west")

    // Mặt phẳng nghiêng (MNP)
    line((-2, 1), (4, 1.5), (5, 5), (-1, 4.5), close: true, fill: rgb("0057b81a"), stroke: (dash: "dashed", paint: rgb("0057b8")))
    content((4, 4), $(M N P)$)

    // Quỹ đạo đường tròn (mô phỏng ellipse)
    circle((1.5, 3), radius: (2.2, 1), angle: 15deg, stroke: (paint: red, thickness: 1.2pt), name: "orbit")

    // Tâm I
    circle((1.5, 3), radius: 2pt, fill: black)
    content((1.5, 3), $I$, anchor: "west", padding: 5pt)

    // Điểm cao nhất H_max
    let H_max = (0.9, 3.96)
    circle(H_max, radius: 2pt, fill: orange)
    content(H_max, $H_"max"$, anchor: "south-west", padding: 3pt)

    // Điểm thấp nhất H_min
    let H_min = (2.1, 2.04)
    circle(H_min, radius: 2pt, fill: blue)
    content(H_min, $H_"min"$, anchor: "north-west", padding: 3pt)

    // Đường kính dốc nhất
    line(H_max, H_min, stroke: (dash: "dotted"))

    // Gióng cao độ xuống trục ngang ảo
    line(H_max, (H_max.at(0), -1.2), stroke: (paint: orange, dash: "dashed"))
    circle((H_max.at(0), -1.2), radius: 1.5pt, fill: orange)
    content((H_max.at(0), -1.2), $z_"max"$, anchor: "south", padding: 5pt)

    line(H_min, (H_min.at(0), -0.7), stroke: (paint: blue, dash: "dashed"))
    circle((H_min.at(0), -0.7), radius: 1.5pt, fill: blue)
    content((H_min.at(0), -0.7), $z_"min" (<0)$, anchor: "north-west", padding: 3pt)

    // z_I
    line((1.5, 3), (1.5, -0.9), stroke: (paint: black, dash: "dashed"))
    circle((1.5, -0.9), radius: 1.5pt, fill: black)
    content((1.5, -0.9), $z_I$, anchor: "north", padding: 5pt)
    
    // Delta z
    line(H_max, (1.5, 3.96), stroke: (paint: gray, dash: "dotted"))
    line((1.5, 3), (1.5, 3.96), mark: (start: "<", end: ">"), stroke: (paint: red))
    content((1.5, 3.48), $Delta z$, anchor: "west", padding: 3pt)
  }),
  fig-pos: "center",
  loigiai: [
    #ppgiai[
      - Mặt đất là mặt phẳng $(O x y)$ có phương trình $z = 0$. Khoảng cách từ một điểm $A(x_A; y_A; z_A)$ đến mặt đất chính là cao độ $|z_A|$.
      - Vòng đu quay là đường tròn $(T)$ ngoại tiếp tam giác $M N P$. Ta cần viết phương trình mặt phẳng $(M N P)$, tìm tọa độ tâm $I$ và bán kính $R$ của đường tròn này.
      - Gọi $gamma$ là góc nghiêng giữa mặt phẳng quỹ đạo $(M N P)$ và mặt đất ngang $(O x y)$. 
      - Theo tính chất hình chiếu, độ chênh lệch cao độ từ tâm $I$ đến điểm cao nhất/thấp nhất trên đường tròn là $Delta z = R sin gamma$.
      - Khi đó:
        + Khoảng cách điểm cao nhất: $z_"max" = z_I + Delta z$.
        + Khoảng cách điểm thấp nhất: $z_"min" = z_I - Delta z$.
    ]
    
    *Bước 1: Viết phương trình mặt phẳng $(M N P)$*
    Ta có: $vect(M N) = (15; 15; 15)$ chọn $vect(u) = (1; 1; 1)$.
    $vect(M P) = (-15; 45; 15)$ chọn $vect(v) = (-1; 3; 1)$.
    Vectơ pháp tuyến của mặt phẳng $(M N P)$ là:
    $ vect(n) = [vect(u), vect(v)] = (1 dot 1 - 1 dot 3; 1 dot (-1) - 1 dot 1; 1 dot 3 - 1 dot (-1)) = (-2; -2; 4). $
    Chọn vectơ pháp tuyến rút gọn là $vect(n) = (1; 1; -2)$.
    Phương trình mặt phẳng $(M N P)$ đi qua $M(20; 10; 5)$:
    $ 1(x - 20) + 1(y - 10) - 2(z - 5) = 0 <=> x + y - 2z - 20 = 0. $
    
    *Bước 2: Tìm tâm $I$ và bán kính $R$ của vòng quay*
    Tâm $I(x; y; z)$ của đường tròn là tâm đường tròn ngoại tiếp tam giác $M N P$. Ta giải hệ gồm mặt phẳng $(M N P)$ và 2 mặt phẳng trung trực của đoạn $M N, M P$:
    $ heva(
      I in (M N P),
      I M^2 = I N^2,
      I M^2 = I P^2
    ) <=> heva(
      x + y - 2z = 20,
      1(x - 27.5) + 1(y - 17.5) + 1(z - 12.5) = 0,
      -1(x - 12.5) + 3(y - 32.5) + 1(z - 12.5) = 0
    ) $
    $ <=> heva(
      x + y - 2z = 20,
      x + y + z = 57.5,
      -x + 3y + z = 97.5
    ) <=> heva(
      x = 12.5,
      y = 32.5,
      z = 12.5
    ) $
    Vậy tâm đu quay là $I(12.5; 32.5; 12.5)$.
    Bán kính đường tròn $R = I M$:
    $ R^2 = (20 - 12.5)^2 + (10 - 32.5)^2 + (5 - 12.5)^2 = 7.5^2 + (-22.5)^2 + (-7.5)^2 = 618.75. $
    $ => R = sqrt(618.75) " (m)". $
    
    *Bước 3: Tính góc $gamma$ và khoảng cách điểm cao nhất*
    Gọi $gamma$ là góc giữa mặt phẳng $(M N P)$ và mặt phẳng $(O x y)$ (có pháp tuyến $vect(k) = (0; 0; 1)$):
    $ cos gamma = (|vect(n) dot vect(k)|)/(|vect(n)| dot |vect(k)|) = (|-2|)/(sqrt(1^2 + 1^2 + (-2)^2) dot 1) = 2/sqrt(6) = sqrt(2/3). $
    Suy ra $sin gamma = sqrt(1 - cos^2 gamma) = sqrt(1 - 2/3) = 1/sqrt(3)$.
    Độ chênh lệch cao độ từ tâm $I$ đến điểm cao nhất của quỹ đạo là:
    $ Delta z = R sin gamma = sqrt(618.75) dot 1/sqrt(3) = sqrt(206.25) approx 14.36 " (m)". $
    Cao độ của điểm cao nhất là:
    $ z_"max" = z_I + Delta z = 12.5 + sqrt(206.25) approx 26.86 " (m)". $
    Làm tròn đến 1 chữ số thập phân, khoảng cách từ điểm cao nhất xuống mặt đất là *$26,9$*.

    #nhanxet(title: [Làm rõ về "khoảng cách min" của quỹ đạo:])[
      Theo yêu cầu của bạn về việc khó tưởng tượng điểm thấp nhất: 
      Nếu ta áp dụng công thức để tính điểm thấp nhất của quỹ đạo đu quay, ta được:
      $ z_"min" = z_I - Delta z = 12.5 - sqrt(206.25) approx -1.86 " (m)". $
      Giá trị *âm* này cho thấy một phần của vòng đu quay bị lún xuống dưới mặt phẳng tọa độ $z=0$ (nằm dưới lòng đất/tầng hầm nếu mặt đất thực tế là $O x y$). Đây là điểm gây "khó tưởng tượng" về mặt vật lý nếu không nhìn vào hình vẽ nghiêng ở trên. Hình chiếu của vòng quay xuống trục $O z$ sẽ chạy dài từ $-1.86"m"$ lên đến $26.86"m"$. Do đề bài chỉ hỏi khoảng cách đến điểm *cao nhất*, ta lấy $z_"max" = 26.9$.
    ]
  ]
)

#tln(
  [Trong công viên, vòng đu quay (Ferris wheel) là đường tròn $(T)$ trong không gian $O x y z$ (mặt đất là mặt phẳng $O x y$). Ba cabin ở vị trí $M(20 ; 10 ; 5)$, $N(35 ; 25 ; 20)$, $P(5 ; 55 ; 20)$. Vòng quay giữ cố định mặt phẳng quỹ đạo. Tính khoảng cách từ điểm cao nhất của đu quay xuống mặt đất (làm tròn đến 1 chữ số thập phân).],
  [$26,9$],
  loigiai: [
    #ppgiai[
      - Mặt đất là mặt phẳng $O x y$ có phương trình $z = 0$. Khoảng cách từ một điểm đến mặt đất chính là trị tuyệt đối cao độ $|z|$ của điểm đó.
      - Vòng đu quay là đường tròn $(T)$ đi qua 3 điểm $M, N, P$. Ta cần viết phương trình mặt phẳng $(M N P)$ chứa vòng quay, tìm tâm $I$ và bán kính $R$ của đường tròn $(T)$.
      - Góc nghiêng của mặt phẳng $(M N P)$ so với mặt đất nằm ngang là $gamma$. Độ chênh lệch cao độ lớn nhất từ tâm $I$ đến điểm cao nhất/thấp nhất của đường tròn là $Delta z = R sin gamma$.
      - Cao độ điểm cao nhất sẽ là: $z_"max" = z_I + Delta z$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        let I = (1, 3.5)
        let R = 3.2
        let gamma = 55deg
        
        let H_max = (I.at(0) + R*calc.cos(gamma), I.at(1) + R*calc.sin(gamma))
        let H_min = (I.at(0) - R*calc.cos(gamma), I.at(1) - R*calc.sin(gamma))
        
        // Mặt phẳng (P_min) đi qua điểm thấp nhất
        let p_min_y = H_min.at(1)
        line((-3.5, p_min_y), (2.5, p_min_y), (4, p_min_y+1.5), (-2, p_min_y+1.5), close: true, fill: rgb("0057b81a"), stroke: rgb("0057b8"))
        content((-2.8, p_min_y+0.2), $(P_"min") \ z = z_"min"$, anchor: "west", fill: rgb("0057b8"), size: 9pt)

        // Mặt đất Oxy (z = 0)
        let p_0_y = p_min_y - 1.6 // Cao hơn z_min một chút vì z_min bị âm
        line((-3.5, p_0_y), (2.5, p_0_y), (5, p_0_y+1.5), (-2, p_0_y+1.5), close: true, fill: rgb("e6e6e6cc"), stroke: gray)
        content((-2.8, p_0_y - 2.2), [Mặt đất $(O x y)$], anchor: "west", fill: gray, size: 9pt)

        // Quỹ đạo đường tròn (mô phỏng ellipse 3D)
        group({
          translate(I)
          rotate(gamma)
          circle((0,0), radius: (R, R * 0.35), stroke: (paint: red, thickness: 1.2pt))
        })

        // Đường kính dốc nhất H_min -> H_max
        line(H_min, H_max, stroke: (paint: red, dash: "dashed", thickness: 1.2pt))
        
        // Mặt phẳng ngang ảo đi qua tâm I để chỉ góc
        line((I.at(0) - 2.5, I.at(1)), (I.at(0) + 3, I.at(1)), stroke: (dash: "dashed", paint: gray))
        
        // Góc nghiêng gamma
        arc(I, start: 0deg, stop: gamma, radius: 0.9, mode: "PIE", fill: rgb("ff990040"), stroke: none)
        content((I.at(0)+1.3, I.at(1)+0.5), $gamma$, fill: rgb("cc7a00"), weight: "bold")

        // Các điểm
        circle(I, radius: 2pt, fill: black); content((I.at(0)-0.1, I.at(1)+0.2), $I$, anchor: "south-east")
        circle(H_max, radius: 2pt, fill: orange); content(H_max, $H_"max"$, anchor: "south-west", padding: 3pt)
        circle(H_min, radius: 2pt, fill: blue); content((H_min.at(0)+0.2, H_min.at(1)-0.1), $H_"min"$, anchor: "north-west", padding: 3pt)

        // Gióng cao độ Delta z
        line(H_max, (H_max.at(0), I.at(1)), stroke: (paint: orange, dash: "dashed"))
        content((H_max.at(0), (H_max.at(1)+I.at(1))/2), $Delta z$, anchor: "west", padding: 3pt, fill: orange)
        line((H_max.at(0), I.at(1)), (H_max.at(0), p_0_y), stroke: (paint: orange, dash: "dotted"))
        
        // Gióng cao độ z_I
        line(I, (I.at(0), p_0_y), stroke: (paint: black, dash: "dotted"))
        content((I.at(0), (I.at(1)+p_0_y)/2), $z_I$, anchor: "east", padding: 3pt)

        // Bán kính R
        content(((I.at(0)+H_max.at(0))/2 - 0.2, (I.at(1)+H_max.at(1))/2 + 0.3), $R$, fill: red, weight: "bold")
      })
    ]

    *Bước 1: Viết phương trình mặt phẳng quỹ đạo $(M N P)$.*
    Ta có: $vect(M N) = (15; 15; 15)$ và $vect(M P) = (-15; 45; 15)$.
    Vectơ pháp tuyến của mặt phẳng $(M N P)$ là:
    $ vect(n) = [vect(M N), vect(M P)] = (15 dot 15 - 15 dot 45; 15 dot (-15) - 15 dot 15; 15 dot 45 - 15 dot (-15)) = (-450; -450; 900). $
    Chọn vectơ pháp tuyến rút gọn là $vect(n) = (1; 1; -2)$.
    Phương trình mặt phẳng $(M N P)$ đi qua $M(20; 10; 5)$ là:
    $ 1(x - 20) + 1(y - 10) - 2(z - 5) = 0 <=> x + y - 2z - 20 = 0. $
    
    *Bước 2: Tìm tâm $I$ và bán kính $R$ của vòng quay.*
    Tâm $I(x; y; z)$ của đường tròn là tâm đường tròn ngoại tiếp tam giác $M N P$. Ta có hệ điều kiện:
    $ heva(
      I in (M N P),
      I M^2 = I N^2,
      I N^2 = I P^2
    ) <=> heva(
      x + y - 2z - 20 = 0,
      (x-20)^2 + (y-10)^2 + (z-5)^2 = (x-35)^2 + (y-25)^2 + (z-20)^2,
      (x-35)^2 + (y-25)^2 + (z-20)^2 = (x-5)^2 + (y-55)^2 + (z-20)^2
    ) $
    Khai triển và rút gọn hai phương trình dưới, ta được:
    $ heva(
      x + y - 2z = 20,
      30x + 30y + 30z = 1725,
      -60x + 60y = 1200
    ) <=> heva(
      x + y - 2z = 20,
      x + y + z = 57.5,
      -x + y = 20
    ) $
    Giải hệ phương trình trên, ta thu được tọa độ tâm $I$:
    $ z = (57.5 - 20) / 3 = 12.5 $
    $ x + y = 45 " và " -x + y = 20 => y = 32.5; x = 12.5 $
    Vậy $I(12.5; 32.5; 12.5)$.
    Bán kính đường tròn vòng quay:
    $ R^2 = I M^2 = (12.5 - 20)^2 + (32.5 - 10)^2 + (12.5 - 5)^2 = (-7.5)^2 + 22.5^2 + 7.5^2 = 618.75 $
    $ => R = sqrt(618.75) = (15sqrt(11))/2 approx 24.87 " (m)". $
    
    *Bước 3: Tìm điểm cao nhất của vòng quay.*
    Gọi $gamma$ là góc giữa mặt phẳng $(M N P)$ và mặt đất $(O x y)$. 
    Vectơ pháp tuyến của mặt đất là $vect(k) = (0; 0; 1)$.
    $ cos gamma = (|vect(n) dot vect(k)|)/(|vect(n)| dot |vect(k)|) = (|-2|)/(sqrt(1^2 + 1^2 + (-2)^2) dot 1) = 2/sqrt(6) = sqrt(2/3). $
    $ => sin gamma = sqrt(1 - cos^2 gamma) = sqrt(1 - 2/3) = 1/sqrt(3). $
    Độ chênh lệch cao độ từ tâm $I$ đến điểm cao nhất $H_"max"$ của đường tròn là:
    $ Delta z = R sin gamma = sqrt(618.75) dot 1/sqrt(3) = sqrt(206.25) approx 14.36 " (m)". $
    Cao độ của điểm cao nhất là:
    $ z_"max" = z_I + Delta z = 12.5 + sqrt(206.25) approx 26.86 " (m)". $
    
    Làm tròn đến 1 chữ số thập phân, khoảng cách từ điểm cao nhất xuống mặt đất là *$26,9$* m.
    
    #nhanxet(title: [Làm rõ về vị trí thấp nhất (min):])[
      Nếu tính cao độ của điểm thấp nhất $H_"min"$, ta được:
      $ z_"min" = z_I - Delta z = 12.5 - sqrt(206.25) approx -1.86 " (m)". $
      Giá trị âm này chứng tỏ quỹ đạo của đu quay có một phần "lún" xuống dưới mặt đất $(O x y)$. Để dễ hình dung, trong hình vẽ trên ta dựng thêm mặt phẳng $(P_"min")$ song song với mặt đất và đi qua điểm thấp nhất $H_"min"$. Khi đó góc nghiêng $gamma$ và khoảng chênh lệch $Delta z$ được thể hiện rất trực quan: điểm cao nhất sẽ vươn lên cách tâm một đoạn $Delta z = R sin gamma$ theo phương thẳng đứng.
    ]
  ]
)


#tln(
  [Trong công viên, vòng đu quay (Ferris wheel) là đường tròn $(T)$ trong không gian $O x y z$ (mặt đất là mặt phẳng $O x y$). Ba cabin ở vị trí $M(20 ; 10 ; 5)$, $N(35 ; 25 ; 20)$, $P(5 ; 55 ; 20)$. Vòng quay giữ cố định mặt phẳng quỹ đạo. Tính khoảng cách từ điểm cao nhất của đu quay xuống mặt đất (làm tròn đến 1 chữ số thập phân).],
  [$26,9$],
  loigiai: [
    #ppgiai[
      - Mặt đất là mặt phẳng $O x y$ có phương trình $z = 0$. Khoảng cách từ một điểm $A(x_A; y_A; z_A)$ đến mặt đất chính là trị tuyệt đối cao độ $|z_A|$ của điểm đó.
      - Vòng đu quay là đường tròn $(T)$ đi qua 3 điểm $M, N, P$. Ta cần viết phương trình mặt phẳng $(M N P)$ chứa vòng quay, tìm tâm $I$ và bán kính $R$ của đường tròn $(T)$.
      - Góc nghiêng của mặt phẳng $(M N P)$ so với mặt đất nằm ngang là $gamma$. Độ chênh lệch cao độ lớn nhất từ tâm $I$ đến điểm cao nhất/thấp nhất của đường tròn là $Delta z = R sin gamma$.
      - Cao độ điểm cao nhất sẽ là: $z_"max" = z_I + Delta z$.
      - Cao độ điểm thấp nhất sẽ là: $z_"min" = z_I - Delta z$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        // Mặt đất Oxy (z = 0)
        line((-5, -0.5), (3, -0.5), (4, 0.5), (-4, 0.5), close: true, fill: rgb("e6e6e6cc"), stroke: gray)
        content((-4, 0), [Mặt đất $(O x y) \ z=0$], anchor: "east")

        // Tọa độ giả lập trên bản vẽ 2D
        let I = (0, 2.5)
        let H_max = (2.5, 5.5)
        let H_min = (-2.5, -0.5)

        // Quỹ đạo đường tròn (mô phỏng ellipse 3D)
        group({
          translate(I)
          rotate(50.19deg) // arctan(3/2.5) để khớp với trục H_min -> H_max
          circle((0,0), radius: (3.905, 1.2), stroke: (paint: rgb("1b5aed"), thickness: 1.2pt))
        })

        // Trục nằm ngang qua I để xác định góc
        line((-3, 2.5), (3, 2.5), stroke: (paint: gray, dash: "dashed"))
        
        // Đường kính dốc nhất H_min -> H_max
        line(H_min, H_max, stroke: (paint: red, thickness: 1.2pt))
        
        // Góc nghiêng gamma
        arc(I, start: 0deg, stop: 50.19deg, radius: 1.2, mode: "PIE", fill: rgb("ff990040"), stroke: none)
        content((1.0, 2.8), $gamma$, fill: rgb("cc7a00"), weight: "bold")

        // Hình chiếu vuông góc xuống mặt đất (y=0 trên canvas)
        let I_p = (0, 0)
        let H_max_p = (2.5, 0)
        let H_min_p = (-2.5, 0)

        // Các đường gióng cao độ
        line(H_max, H_max_p, stroke: (paint: orange, dash: "dashed", thickness: 1pt))
        line(I, I_p, stroke: (paint: black, dash: "dashed", thickness: 1pt))
        line(H_min, H_min_p, stroke: (paint: blue, dash: "dashed", thickness: 1pt))

        // Ký hiệu cao độ
        content((2.5, 2.75), $z_"max"$, anchor: "west", padding: 3pt, fill: orange)
        content((0, 1.25), $z_I$, anchor: "west", padding: 3pt)
        content((-2.5, -0.25), $z_"min"$, anchor: "east", padding: 3pt, fill: blue)

        // Các điểm thực tế
        circle(I, radius: 2pt, fill: black); content((-0.1, 2.7), $I$, anchor: "south-east")
        circle(H_max, radius: 2pt, fill: orange); content(H_max, $H_"max"$, anchor: "south-west", padding: 3pt)
        circle(H_min, radius: 2pt, fill: blue); content((-2.6, -0.6), $H_"min"$, anchor: "north-east", padding: 3pt)

        // Các điểm hình chiếu trên mặt đất
        circle(I_p, radius: 1.5pt, fill: black); content((0, -0.3), $I'$, anchor: "north")
        circle(H_max_p, radius: 1.5pt, fill: orange); content((2.5, -0.3), $H'_"max"$, anchor: "north")
        circle(H_min_p, radius: 1.5pt, fill: blue); content((-2.5, 0.3), $H'_"min"$, anchor: "south")

        // Ký hiệu Delta z
        line((2.5, 2.5), (2.5, 5.5), mark: (start: "<", end: ">"), stroke: (paint: red))
        content((2.5, 4), $Delta z$, anchor: "west", padding: 3pt, fill: red)
        
        // Chú thích phụ
        content((1.2, 4.3), $R$, fill: red, weight: "bold")
      })
    ]

    *Bước 1: Viết phương trình mặt phẳng quỹ đạo $(M N P)$.*
    Ta có: $vect(M N) = (15; 15; 15)$ và $vect(M P) = (-15; 45; 15)$.
    Vectơ pháp tuyến của mặt phẳng $(M N P)$ là:
    $ vect(n) = [vect(M N), vect(M P)] = (15 dot 15 - 15 dot 45; 15 dot (-15) - 15 dot 15; 15 dot 45 - 15 dot (-15)) = (-450; -450; 900). $
    Chọn vectơ pháp tuyến rút gọn là $vect(n) = (1; 1; -2)$.
    Phương trình mặt phẳng $(M N P)$ đi qua $M(20; 10; 5)$ là:
    $ 1(x - 20) + 1(y - 10) - 2(z - 5) = 0 <=> x + y - 2z - 20 = 0. $
    
    *Bước 2: Tìm tâm $I$ và bán kính $R$ của vòng quay.*
    Tâm $I(x; y; z)$ của đường tròn là tâm đường tròn ngoại tiếp tam giác $M N P$. Giải hệ điều kiện:
    $ heva(
      I in (M N P),
      I M^2 = I N^2,
      I N^2 = I P^2
    ) <=> heva(
      x + y - 2z - 20 = 0,
      (x-20)^2 + (y-10)^2 + (z-5)^2 = (x-35)^2 + (y-25)^2 + (z-20)^2,
      (x-35)^2 + (y-25)^2 + (z-20)^2 = (x-5)^2 + (y-55)^2 + (z-20)^2
    ) $
    Khai triển và rút gọn hai phương trình dưới, ta được hệ:
    $ heva(
      x + y - 2z = 20,
      x + y + z = 57.5,
      -x + y = 20
    ) $
    Giải hệ phương trình trên, ta thu được tọa độ tâm $I$:
    $ z_I = (57.5 - 20) / 3 = 12.5 $
    $ x + y = 45 " và " -x + y = 20 => y = 32.5; x = 12.5 $
    Vậy $I(12.5; 32.5; 12.5)$.
    Bán kính đường tròn vòng quay:
    $ R^2 = I M^2 = (12.5 - 20)^2 + (32.5 - 10)^2 + (12.5 - 5)^2 = 618.75 $
    $ => R = sqrt(618.75) approx 24.87 " (m)". $
    
    *Bước 3: Tìm điểm cao nhất của vòng quay.*
    Gọi $gamma$ là góc giữa mặt phẳng $(M N P)$ và mặt đất $(O x y)$. 
    Vectơ pháp tuyến của mặt đất là $vect(k) = (0; 0; 1)$.
    $ cos gamma = (|vect(n) dot vect(k)|)/(|vect(n)| dot |vect(k)|) = (|-2|)/(sqrt(1^2 + 1^2 + (-2)^2) dot 1) = 2/sqrt(6) = sqrt(2/3). $
    $ => sin gamma = sqrt(1 - cos^2 gamma) = sqrt(1 - 2/3) = 1/sqrt(3). $
    Độ chênh lệch cao độ từ tâm $I$ đến điểm cao nhất $H_"max"$ của đường tròn là:
    $ Delta z = R sin gamma = sqrt(618.75) dot 1/sqrt(3) = sqrt(206.25) approx 14.36 " (m)". $
    Cao độ của điểm cao nhất là:
    $ z_"max" = z_I + Delta z = 12.5 + sqrt(206.25) approx 26.86 " (m)". $
    
    Làm tròn đến 1 chữ số thập phân, khoảng cách từ điểm cao nhất xuống mặt đất là *$26,9$* m.
    
    #nhanxet(title: [Làm rõ về vị trí thấp nhất (min):])[
      Qua hình vẽ minh họa, ta thấy rõ quỹ đạo không nằm ngang mà bị nghiêng một góc $gamma$. Nếu tính toán cao độ của điểm thấp nhất $H_"min"$, ta sẽ được:
      $ z_"min" = z_I - Delta z = 12.5 - sqrt(206.25) approx -1.86 " (m)". $
      Giá trị *âm* này ($z_"min" < 0$) mang ý nghĩa là điểm thấp nhất của quỹ đạo đu quay đã "xuyên" qua và nằm thấp hơn mặt đất $(O x y)$ một khoảng $1.86" m"$. Hình chiếu của quỹ đạo lên trục $O z$ sẽ trải dài từ đoạn âm này lên đến đỉnh $26.9" m"$.
    ]
  ]
)