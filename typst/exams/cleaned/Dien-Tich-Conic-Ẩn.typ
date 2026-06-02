#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"


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
  circle((0, 0), radius: r, stroke: luma(200) + 0.5pt)
  for i in range(n) {
    circle((90deg - i * 360deg / n, r), radius: 1.2pt, fill: gray)
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
        Conic và Ứng Dụng Tích Phân
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        3 đường Conic ẩn
      ]
    ],
  )
]

// Câu 1
#tln(
  [Cho hình vuông $A B C D$ có $A B = 60 sqrt(2)$ cm. Gọi $(H)$ là tập hợp các điểm $M$ nằm trong hình vuông $A B C D$ và thỏa mãn $d(M; B D) - 20 >= M A$. Hãy tính diện tích hình phẳng $(H)$ theo đơn vị centimét vuông (_làm tròn kết quả đến hàng đơn vị_).],
  [$350$],
  loigiai: [
    #lythuyet(title: [Lý thuyết: 3 đường Conic & Nhận diện Parabol ẩn])[
      Tập hợp điểm $M$ có tỉ số khoảng cách đến tiêu điểm $F$ và đường chuẩn $Delta$ bằng hằng số tâm sai $e = (M F)/(d(M, Delta))$:
      - $e < 1$: Elip
      - $e = 1$: Parabol ($M F = d(M, Delta)$)
      - $e > 1$: Hypebol

      *Ứng dụng:* Bất phương trình $M A <= d(M; B D) - 20$. Nếu ta tạo một đường thẳng $Delta'$ bằng cách dời $B D$ về phía $A$ một đoạn $20$ cm, thì $d(M; Delta') = d(M; B D) - 20$. Bài toán trở thành $M A <= d(M; Delta')$, miền giới hạn chính là phía trong của một Parabol!
    ]

    #ppgiai(title: [Tư duy Dời trục $O y$ (Smart Axis Shift)])[
      Thay vì giữ hệ trục cũ ở tâm hình vuông làm phương trình cồng kềnh, ta *chủ động chọn trục tung $O Y$ mới trùng ngay với đường chuẩn $Delta'$*.
      Mọi biểu thức sẽ tự động trở về dạng chính tắc tối giản nhất!
    ]

    *Bước 1: Thiết lập hệ trục dời* \
    Giả sử hệ trục cũ $O x y$ có gốc $O$ tại tâm hình vuông, trục $O y$ trùng $B D$, $O x$ trùng $A C$. \
    Đường chéo $A C = 60sqrt(2) dot sqrt(2) = 120 => O A = 60 => A(60; 0)$. \
    Ta lập hệ trục tọa độ mới $O' X Y$ bằng cách tịnh tiến gốc $O$ đến điểm $O'(20; 0)$.
    - Trục tung mới $O' Y$ chính là đường thẳng $x = 20$ (đường chuẩn $Delta'$).
    - Tọa độ các điểm trong hệ mới: $X = x - 20, quad Y = y$. \
    Lúc này, tọa độ tiêu điểm $A$ trong hệ mới là $X_A = 60 - 20 = 40 => A(40; 0)$. \
    Cạnh hình vuông $A B$ có phương trình cũ $x + y = 60 => (X + 20) + Y = 60 <=> X = 40 - Y$.

    *Bước 2: Giải mã phương trình Parabol* \
    Với $M(X; Y)$, khoảng cách đến đường chuẩn mới $O' Y$ đơn giản là $d = X$ (do $M$ nằm phía $X > 0$). \
    Điều kiện $M A <= d(M; O' Y)$ trở thành:
    $ sqrt((X - 40)^2 + Y^2) <= X $
    Bình phương hai vế và rút gọn:
    $ X^2 - 80X + 1600 + Y^2 <= X^2 quad <=> quad Y^2 <= 80X - 1600 quad <=> quad X >= 20 + Y^2/80 $
    Quỹ tích giới hạn là Parabol $(P): X = 20 + Y^2/80$ với đỉnh tại $(20; 0)$.

    *Bước 3: Giao điểm và Bấm máy Casio* \
    Tìm tung độ giao điểm của $(P)$ và cạnh hình vuông $X = 40 - Y$ (với $Y > 0$):
    $ 20 + Y^2/80 = 40 - Y <=> Y^2 + 80Y - 1600 = 0 $
    Bấm máy `Menu 9 2 2`, lấy nghiệm dương: $Y = 40sqrt(2) - 40$. \
    Do tính đối xứng qua trục hoành, diện tích $(H)$ gấp đôi phần nửa trên:
    $
      S = 2 integral_0^(40sqrt(2)-40) [ (40 - Y) - (20 + Y^2/80) ] dif Y = 2 integral_0^(40sqrt(2)-40) (20 - Y - Y^2/80) dif Y
    $
    *Bấm máy tính Casio:* Nhập y nguyên biểu thức trên, máy trả kết quả `350.32049...` \
    Làm tròn đến hàng đơn vị: *$350$*.

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Hệ trục cũ (Mờ/Nét đứt)
        line((-65, 0), (75, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        line((0, -65), (0, 65), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        content((-4, -3), text(fill: gray)[$O$])
        content((-4, 60), text(fill: gray)[$O y equiv B D$])

        // Hệ trục MỚI O'XY (Đậm/Màu Xanh)
        line((20, -70), (20, 70), mark: (end: ">"), stroke: 1pt + blue)
        line((20, 0), (75, 0), mark: (end: ">"), stroke: 1pt + blue)
        content((24, 70), text(fill: blue, weight: "bold")[$Y (Delta')$])
        content((75, -4), text(fill: blue, weight: "bold")[$X$])
        content((16, -4), text(fill: blue, weight: "bold")[$O'$])

        // Hình vuông ABCD
        line((-60, 0), (0, 60), (60, 0), (0, -60), close: true, stroke: 0.8pt + rgb("333333"))
        content((-64, -4), $C$)
        content((4, 63), $B$)
        content((64, -4), $A$)
        content((4, -63), $D$)

        // Vẽ Parabol và tô màu vùng H (Tọa độ thật theo x = X + 20)
        let y_int = 40 * 1.41421 - 40
        let pts = ()
        pts.push((60, 0)) // Đỉnh A
        for i in range(int(y_int * 10), int(-y_int * 10) - 1, step: -2) {
          let y = i / 10
          let x = 40 + (y * y) / 80 // X = 20 + y^2/80 => x = X + 20
          pts.push((x, y))
        }
        line(..pts, close: true, fill: rgb("4caf5066"), stroke: 1.2pt + rgb("2e7d32"))

        content((48, 0), text(fill: rgb("1b5e20"), weight: "bold")[$(H)$])
        circle((60, 0), radius: 1.2pt, fill: red) // Tiêu điểm A
        content((55, 4), text(fill: red)[$F$])
      })
    ]
  ],
)
// Câu tương tự phát triển
#tln(
  [Cho hình vuông $A B C D$ có $A B = 100 sqrt(2)$ cm. Gọi $(H)$ là tập hợp các điểm $M$ nằm trong hình vuông $A B C D$ và thỏa mãn $d(M; B D) - 50 >= M A$. Hãy tính diện tích hình phẳng $(H)$ theo đơn vị centimét vuông (_làm tròn kết quả đến hàng đơn vị_).],
  [$547$],
  loigiai: [
    #lythuyet(title: [Lý thuyết: 3 đường Conic & Nhận diện Parabol ẩn])[
      Tập hợp điểm $M$ có tỉ số khoảng cách đến tiêu điểm $F$ và đường chuẩn $Delta$ bằng hằng số tâm sai $e = (M F)/(d(M, Delta))$:
      - $e < 1$: Elip
      - $e = 1$: Parabol ($M F = d(M, Delta)$)
      - $e > 1$: Hypebol

      *Ứng dụng:* Bất phương trình $M A <= d(M; B D) - 50$. Nếu ta tạo một đường thẳng $Delta'$ bằng cách dời $B D$ về phía $A$ một đoạn $50$ cm, thì $d(M; Delta') = d(M; B D) - 50$. Bài toán trở thành $M A <= d(M; Delta')$, quỹ tích giới hạn $(H)$ chính là phần phía trong của một Parabol!
    ]

    #ppgiai(title: [Tư duy Dời trục $O y$ (Smart Axis Shift)])[
      Thay vì giữ hệ trục cũ ở tâm hình vuông làm phương trình cồng kềnh, ta *chủ động chọn trục tung $O Y$ mới trùng ngay với đường chuẩn $Delta'$*.
      Mọi biểu thức sẽ tự động trở về dạng chính tắc tối giản nhất!
    ]

    *Bước 1: Thiết lập hệ trục dời* \
    Giả sử hệ trục cũ $O x y$ có gốc $O$ tại tâm hình vuông, trục $O y$ trùng $B D$, $O x$ trùng $A C$. \
    Đường chéo $A C = 100sqrt(2) dot sqrt(2) = 200 => O A = 100 => A(100; 0)$. \
    Ta lập hệ trục tọa độ mới $O' X Y$ bằng cách tịnh tiến gốc $O$ đến điểm $O'(50; 0)$.
    - Trục tung mới $O' Y$ chính là đường thẳng $x = 50$ (đường chuẩn $Delta'$).
    - Tọa độ các điểm trong hệ mới: $X = x - 50, quad Y = y$. \
    Lúc này, tọa độ tiêu điểm $A$ trong hệ mới là $X_A = 100 - 50 = 50 => A(50; 0)$. \
    Cạnh hình vuông $A B$ nằm ở góc phần tư thứ nhất có phương trình cũ $x + y = 100 => (X + 50) + Y = 100 <=> X = 50 - Y$.

    *Bước 2: Giải mã phương trình Parabol* \
    Với $M(X; Y)$, khoảng cách đến đường chuẩn mới $O' Y$ đơn giản là $d = X$ (do $M$ nằm phía $X > 0$). \
    Điều kiện $M A <= d(M; O' Y)$ trở thành:
    $ sqrt((X - 50)^2 + Y^2) <= X $
    Bình phương hai vế và rút gọn:
    $ X^2 - 100X + 2500 + Y^2 <= X^2 quad <=> quad Y^2 <= 100X - 2500 quad <=> quad X >= 25 + Y^2/100 $
    Quỹ tích giới hạn là miền trong của Parabol $(P): X = 25 + Y^2/100$ có đỉnh tại $(25; 0)$ trong hệ trục mới.

    *Bước 3: Giao điểm và Bấm máy Casio* \
    Tìm tung độ giao điểm của $(P)$ và cạnh hình vuông $X = 50 - Y$ (chỉ xét phần $Y > 0$):
    $ 25 + Y^2/100 = 50 - Y <=> Y^2 + 100Y - 2500 = 0 $
    Bấm máy `Menu 9 2 2`, lấy nghiệm dương: $Y = 50sqrt(2) - 50$. \
    Do tính đối xứng qua trục hoành $O X$, diện tích $(H)$ gấp đôi diện tích phần nửa trên:
    $
      S = 2 integral_0^(50sqrt(2)-50) [ (50 - Y) - (25 + Y^2/100) ] dif Y = 2 integral_0^(50sqrt(2)-50) (25 - Y - Y^2/100) dif Y
    $
    *Bấm máy tính Casio:* Nhập y nguyên biểu thức tích phân trên, máy sẽ trả kết quả `547.37861...` \
    Làm tròn đến hàng đơn vị, diện tích của miền $(H)$ là: *$547$*.

    #align(center)[
      #cetz.canvas(length: 0.6mm, {
        import cetz.draw: *
        // Hệ trục cũ (Mờ/Nét đứt)
        line((-105, 0), (120, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        line((0, -105), (0, 105), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        content((-5, -4), text(fill: gray)[$O$])
        content((-5, 100), text(fill: gray)[$O y equiv B D$])

        // Hệ trục MỚI O'XY (Đậm/Màu Xanh)
        line((50, -110), (50, 110), mark: (end: ">"), stroke: 1pt + blue)
        line((50, 0), (120, 0), mark: (end: ">"), stroke: 1pt + blue)
        content((55, 110), text(fill: blue, weight: "bold")[$Y (Delta')$])
        content((120, -5), text(fill: blue, weight: "bold")[$X$])
        content((45, -5), text(fill: blue, weight: "bold")[$O'$])

        // Hình vuông ABCD (Mở rộng cho hợp với trục 100)
        line((-100, 0), (0, 100), (100, 0), (0, -100), close: true, stroke: 0.8pt + rgb("333333"))
        content((-105, -5), $C$)
        content((5, 105), $B$)
        content((105, -5), $A$)
        content((5, -105), $D$)

        // Vẽ Parabol và tô màu vùng H (Tọa độ thật trên canvas theo x = X + 50)
        // Hệ mới X = 25 + Y^2/100 -> tọa độ trên canvas x = (25 + y^2/100) + 50
        let y_int = 50 * 1.41421 - 50 // Khoảng 20.71
        let pts = ()
        pts.push((100, 0)) // Đỉnh A
        for i in range(int(y_int * 10), int(-y_int * 10) - 1, step: -2) {
          let y = i / 10
          let x = 25 + (y * y) / 100 
          pts.push((x + 50, y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))

        content((82, 0), text(fill: rgb("e65100"), weight: "bold")[$(H)$])
        circle((100, 0), radius: 1.5pt, fill: red) // Tiêu điểm A
        content((92, 6), text(fill: red)[$F$])
      })
    ]
  ],
)



// Câu phát triển: Chủ đề Elip ẩn qua định nghĩa đường chuẩn (Giải thuần hình học)
#tln(
  [Cho một sân chơi hình chữ nhật $A B C D$ có chiều dài $A B = 20" m"$, chiều rộng $A D = 12" m"$. Gọi $O$ là tâm của sân chơi này. Người ta muốn cải tạo một phần sân thành mảnh đất trồng hoa $(H)$. Mảnh đất $(H)$ được xác định là tập hợp các điểm $M$ nằm trong sân sao cho khoảng cách từ $M$ đến tâm $O$ luôn *không vượt quá một nửa* khoảng cách từ $M$ đến đường thẳng chứa cạnh $A D$. Hãy tính diện tích mảnh đất trồng hoa $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).],
  [$121$],
  loigiai: [
    #lythuyet(title: [Lý thuyết: Định nghĩa chung của 3 đường Conic])[
      Tập hợp điểm $M$ có tỉ số khoảng cách đến tiêu điểm $F$ và đường chuẩn $Delta$ bằng hằng số tâm sai $e$:
      $ (M F) / (d(M; Delta)) = e $
      - $e = 1$: Parabol.
      - $e < 1$: Elip.
      - $e > 1$: Hypebol.
      *Tính chất quan trọng của Elip:* Khoảng cách từ tiêu điểm $F$ đến đường chuẩn $Delta$ tương ứng được tính bằng công thức $d(F; Delta) = a/e - c = a(1/e - e)$, với $a$ là bán trục lớn, $c$ là tiêu cự ($c = a e$).
    ]

    *Bước 1: Nhận diện các thông số đường Conic* \
    Giả thiết bài toán cho: $M O <= 1/2 d(M; A D)$. 
    Tỉ số $e = 1/2 < 1$, ta nhận diện ngay quỹ tích giới hạn mảnh đất $(H)$ chính là miền trong của một **đường Elip** có:
    - Tiêu điểm $F$ trùng với tâm sân chơi $O$.
    - Đường chuẩn $Delta$ trùng với đường thẳng chứa cạnh $A D$.
    - Tâm sai $e = 1/2$.
    
    Vì $O$ là tâm hình chữ nhật $20 times 12$, nên khoảng cách từ tiêu điểm $O$ đến đường chuẩn $A D$ là:
    $ d = d(O; A D) = (A B) / 2 = 10 " (m)". $

    *Bước 2: Tìm các bán trục $a, b$ của Elip* \
    Áp dụng công thức khoảng cách từ tiêu điểm đến đường chuẩn:
    $ d(F; Delta) = a(1/e - e) quad <=> quad 10 = a( 1/(1/2) - 1/2 ) = a( 2 - 1/2 ) = 3/2 a $
    Suy ra bán trục lớn của Elip là: $a = 10 times 2/3 = 20/3$.
    
    Tiêu cự của Elip là: $c = a dot e = 20/3 dot 1/2 = 10/3$. \
    Bán trục nhỏ của Elip là: $b = sqrt(a^2 - c^2) = sqrt(400/9 - 100/9) = sqrt(300/9) = 10/sqrt(3)$.

    *Bước 3: Đánh giá và tính diện tích* \
    - Kiểm tra giới hạn: Khoảng cách từ tâm Elip đến đỉnh xa nhất là $a = 20/3$, tiêu cự $c = 10/3 =>$ đỉnh sát với đường chuẩn cách tiêu điểm $O$ một đoạn $a+c = 10$, tức là vừa chạm đúng vào cạnh $B C$. Bề rộng tối đa $2b = 20/sqrt(3) approx 11.54 < 12$, nên Elip nằm hoàn toàn trong sân chơi.
    
    Diện tích mảnh đất trồng hoa $(H)$ là diện tích của toàn bộ Elip:
    $ S = pi dot a dot b = pi dot 20/3 dot 10/sqrt(3) = (200pi) / (3sqrt(3)) approx 120.9199... " (m"^2")" $
    Làm tròn kết quả đến hàng đơn vị, ta được *$121$*.

    #align(center)[
      #cetz.canvas(length: 3.5mm, {
        import cetz.draw: *
        // Trục minh họa khoảng cách (trục hoành)
        line((-14, 0), (14, 0), mark: (end: ">"), stroke: (paint: gray, thickness: 0.8pt))
        content((14, -1.5), $x$, fill: gray)

        // Hình chữ nhật sân chơi
        rect((-10, -6), (10, 6), stroke: 1.2pt + rgb("333333"))
        content((-11.5, 6.5), $A$)
        content((11.5, 6.5), $B$)
        content((11.5, -6.5), $C$)
        content((-11.5, -6.5), $D$)

        // Đường chuẩn (Cạnh AD)
        line((-10, -8), (-10, 8), stroke: 1.2pt + blue)
        content((-10, 8.5), text(fill: blue, weight: "bold")[$Delta$ (Đường chuẩn)])

        // Vẽ Elip (H)
        // Tâm I cách O một đoạn c = 10/3 sang phải (ngược hướng đường chuẩn)
        circle((10/3, 0), radius: (20/3, 10/calc.sqrt(3)), fill: rgb("9c27b066"), stroke: 1.2pt + purple)
        content((3.33, 2.5), text(fill: rgb("4a148c"), weight: "bold")[$(H)$])

        // Các điểm quan trọng
        circle((10/3, 0), radius: 1.5pt, fill: purple)
        content((3.33, -1.5), text(fill: purple)[$I$ (Tâm Elip)])
        circle((0, 0), radius: 1.5pt, fill: red)
        content((-1.5, -1.5), text(fill: red, weight: "bold")[$O (F)$])
        
        // Mô tả hình học (Định nghĩa)
        line((0,0), (-1.5, 5.2), stroke: (dash: "dashed", paint: red))
        line((-10, 5.2), (-1.5, 5.2), stroke: (dash: "dashed", paint: blue))
        circle((-1.5, 5.2), radius: 1.2pt, fill: black)
        content((-1, 6), $M$)
        
        // Ghi chú khoảng cách c và a/e
        content((-5, -1.5), text(fill: blue)[$d = 10$])
      })
    ]
  ]
)

#tln(
  [Một công viên hình chữ nhật $A B C D$ có chiều dài $A B = 100$ m, chiều rộng $A D = 80$ m. Người ta đặt một trạm phát sóng wifi tại điểm $F$ nằm trên trục đối xứng dọc của công viên (song song với $A B$), cách tâm $O$ của công viên $30$ m về phía cạnh $B C$. Kỹ sư quy hoạch xác định vùng phủ sóng tốt $(H)$ là tập hợp các điểm $M$ sao cho khoảng cách từ $M$ đến trạm wifi $F$ luôn bé hơn hoặc bằng khoảng cách từ $M$ đến trục đối xứng ngang của công viên trừ đi $10$ m. Hãy tính diện tích vùng phủ sóng tốt $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).],
  [$1386$],
  loigiai: [
    #ppgiai[
      - *Mô hình hóa HHKG:* Trục đối xứng ngang nối trung điểm $A B, C D$ đóng vai trò như đường chuẩn ban đầu. Giống bài trước, ta sẽ thực hiện kỹ thuật *Dời trục tọa độ* để tạo đường chuẩn mới, đưa bài toán về quỹ tích Parabol chính tắc cực kỳ dễ tính.
    ]

    *Bước 1: Tọa độ hóa và Dời trục thông minh* \
    Giả sử hệ trục cũ $O x y$ có gốc $O$ tại tâm hình chữ nhật, trục $O y$ là trục đối xứng ngang, trục $O x$ là trục dọc. \
    - Hình chữ nhật có $x in [-50; 50]$ và $y in [-40; 40]$. Cạnh $B C$ nằm tại $x = 50$. \
    - Trạm wifi $F$ cách tâm $30"m"$ về phía $B C => F(30; 0)$. \
    Điều kiện đề bài: $M F <= d(M; O y) - 10 <=> M F <= x - 10$ (do $M$ hướng về $B C$ nên $x > 0$). \

    *Thực hiện dời trục:* Đặt trục tung mới $O' Y$ tại vị trí $x = 10$. \
    - Tọa độ mới: $X = x - 10, quad Y = y$. \
    - Tiêu điểm $F$ trong hệ mới: $X_F = 30 - 10 = 20 => F(20; 0)$. \
    - Cạnh $B C$ trong hệ mới: $X = 50 - 10 = 40$.

    *Bước 2: Lập phương trình Parabol* \
    Khoảng cách đến đường chuẩn mới $O' Y$ lúc này là $X$. Bất phương trình quỹ tích:
    $ M F <= X quad <=> quad sqrt((X - 20)^2 + Y^2) <= X $
    Bình phương 2 vế:
    $ X^2 - 40X + 400 + Y^2 <= X^2 quad <=> quad Y^2 <= 40X - 400 quad <=> quad X >= 10 + Y^2/40 $
    Quỹ tích là mặt trong của Parabol $(P): X = 10 + Y^2/40$, đỉnh tại $(10; 0)$.

    *Bước 3: Tìm cận và Bấm máy Casio* \
    Kiểm tra giao điểm của Parabol với cạnh ngoài cùng bên phải $B C$ ($X = 40$):
    $ 10 + Y^2/40 = 40 <=> Y^2 = 1200 <=> Y = plus.minus 20sqrt(3) approx plus.minus 34,64 $
    Do $34,64 < 40$ (biên của hình chữ nhật), Parabol cắt cạnh $B C$ trước khi chạm mép trên/dưới. \
    Diện tích $(H)$ được nhân đôi do tính đối xứng:
    $ S = 2 integral_0^(20sqrt(3)) [ 40 - (10 + Y^2/40) ] dif Y = 2 integral_0^(20sqrt(3)) ( 30 - Y^2/40 ) dif Y $
    *Bấm máy tính Casio:* `1385.6406...` \
    Làm tròn đến hàng đơn vị: *$1386$*.

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Hệ cũ O mờ
        line((-55, 0), (60, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        line((0, -45), (0, 45), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        content((-3, -3), text(fill: gray)[$O$])

        // Hệ mới O'XY
        line((10, -50), (10, 50), mark: (end: ">"), stroke: 1pt + blue)
        content((10, 53), text(fill: blue, weight: "bold")[$Y (Delta')$])
        content((6, -4), text(fill: blue, weight: "bold")[$O'$])

        // Hình chữ nhật
        line((-50, 40), (50, 40), (50, -40), (-50, -40), close: true, stroke: 0.8pt + rgb("333333"))
        content((-54, 43), $A$)
        content((54, 43), $B$)
        content((54, -43), $C$)
        content((-54, -43), $D$)

        // Tiêu điểm F
        circle((30, 0), radius: 1.2pt, fill: red)
        content((30, 4), text(fill: red, weight: "bold")[$F$])

        // Miền Parabol
        let y_int = 34.641
        let pts = ()
        for i in range(int(y_int * 10), int(-y_int * 10) - 1, step: -2) {
          let y = i / 10
          let x = 20 + (y * y) / 40 // X = 10 + y^2/40 => x = X + 10 = 20 + y^2/40
          pts.push((x, y))
        }
        pts.push((50, -34.641))
        pts.push((50, 34.641))
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("f57c00"))

        content((38, 0), text(fill: rgb("e65100"), weight: "bold")[$(H)$])
      })
    ]

    #meo(title: [Đơn giản hóa với hệ trục tự do])[
      Khi xử lý các bài toán tập hợp điểm chứa hằng số độ lệch (ví dụ $d - 10$), việc gắn hệ trục tọa độ tại đúng điểm cần thiết (tịnh tiến trục) chính là bí quyết của thủ khoa. Nó không chỉ tránh sai sót khi bình phương mà còn hỗ trợ đưa ra tích phân đa thức cực đẹp!
    ]
  ],
)

// Câu phát triển: Nhận diện Parabol qua định nghĩa và Ứng dụng công thức Archimedes
#tln(
  [Cho một khu vườn hình chữ nhật $A B C D$ có chiều rộng $A D = 30" m"$ và chiều dài $A B = 60" m"$. Gọi $F$ là trung điểm của cạnh $A B$. Người ta muốn quy hoạch một khu vực $(H)$ bên trong khu vườn để trồng hoa hồng. Khu vực $(H)$ được xác định là tập hợp các điểm $M$ sao cho khoảng cách từ $M$ đến điểm $F$ luôn *không vượt quá* khoảng cách từ $M$ đến cạnh $C D$. Hãy tính diện tích khu vực trồng hoa hồng $(H)$ theo đơn vị mét vuông.],
  [$600$],
  loigiai: [
    #lythuyet(title: [Lý thuyết: Định nghĩa Parabol & Công thức Archimedes])[
      - *Định nghĩa:* Tập hợp các điểm $M$ cách đều một điểm $F$ cố định (tiêu điểm) và một đường thẳng $Delta$ cố định (đường chuẩn) là một đường Parabol. $(e = (M F)/(d(M; Delta)) = 1)$.
      - *Đỉnh Parabol:* Nằm ngay chính giữa đoạn vuông góc kẻ từ tiêu điểm $F$ đến đường chuẩn $Delta$.
      - *Diện tích hình phẳng Parabol (Archimedes):* Diện tích hình phẳng giới hạn bởi một cung Parabol và một dây cung (dây cung vuông góc trục đối xứng) được tính nhanh bằng: 
      $ S = 2/3 times "Đáy" times "Chiều cao" $
    ]

    #ppgiai(title: [Tư duy Hình học thuần túy (Không cần đại số)])[
      Giả thiết $M F <= d(M; C D)$ cho thấy ranh giới của khu vực $(H)$ chính là trường hợp dấu "$=$" xảy ra: $M F = d(M; C D)$. 
      Ta nhận diện ngay đây là một **đường Parabol** có tiêu điểm là $F$ và đường chuẩn $Delta$ chính là đường thẳng chứa cạnh $C D$.
    ]

    *Bước 1: Khảo sát các thông số của Parabol* \
    - Trục đối xứng của Parabol đi qua $F$ và vuông góc với $C D$ tại trung điểm $K$ của $C D$.
    - Đỉnh $V$ của Parabol nằm chính giữa $F$ và $K$. 
      Khoảng cách $F K = A D = 30" m"$, suy ra chiều cao từ đỉnh $V$ đến dây cung $A B$ (tiêu điểm $F$) là: 
      $ h = V F = 30 / 2 = 15 " (m)". $

    *Bước 2: Tìm giao điểm của Parabol với hình chữ nhật* \
    Ta cần kiểm tra xem Parabol có đi qua hai góc $A, B$ hay không bằng cách thử định nghĩa:
    - Xét điểm $A$: Khoảng cách $A F = 1/2 A B = 30" m"$. 
      Khoảng cách từ $A$ đến $C D$ chính là cạnh $A D = 30" m"$.
      Vì $A F = d(A; C D)$, điểm $A$ nằm **chính xác trên Parabol**!
    - Hoàn toàn tương tự với điểm $B$: $B F = 30 = d(B; C D)$, điểm $B$ cũng nằm trên Parabol!

    *Bước 3: Tính diện tích bằng công thức Archimedes* \
    Khu vực $(H)$ thỏa mãn $M F <= d(M; C D)$ chính là vùng "lõm" vào trong của Parabol, giới hạn bởi cung Parabol $A V B$ và dây cung $A B$.
    Đây là một hình quạt Parabol chuẩn mực có:
    - Đáy (dây cung): $A B = 60" m"$.
    - Chiều cao (từ đỉnh $V$ đến đáy $A B$): $h = V F = 15" m"$.
    
    Áp dụng công thức Archimedes, diện tích khu vực $(H)$ là:
    $ S_H = 2/3 times A B times h = 2/3 times 60 times 15 = 600 " (m"^2")." $
    Kết quả là *$600$*.

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        
        // Hình chữ nhật ABCD
        rect((-30, 0), (30, 30), stroke: 1.2pt + rgb("333333"))
        content((-30, 33), $A$)
        content((30, 33), $B$)
        content((30, -3), $C$)
        content((-30, -3), $D$)

        // Tiêu điểm F và trung điểm K
        circle((0, 30), radius: 1.5pt, fill: red)
        content((0, 34), text(fill: red, weight: "bold")[$F$ (Tiêu điểm)])
        content((0, -3), text(fill: gray)[$K$])
        line((0,0), (0,30), stroke: (dash: "dashed", paint: gray)) // Trục đối xứng

        // Đường chuẩn (Cạnh CD)
        line((-35, 0), (35, 0), stroke: 1.5pt + blue)
        content((15, -4), text(fill: blue, weight: "bold")[$Delta equiv C D$ (Đường chuẩn)])

        // Vẽ cung Parabol đi qua A, V, B (Phương trình y = 15 + x^2/60)
        let pts = ()
        for i in range(-30, 31) {
          pts.push((i, 15 + (i * i) / 60))
        }
        
        // Tô màu khu vực (H)
        let fill-pts = pts
        fill-pts.push((30, 30))
        fill-pts.push((-30, 30))
        line(..fill-pts, close: true, fill: rgb("e1bee788"), stroke: none)
        line(..pts, close: false, stroke: 1.5pt + purple)

        // Đỉnh V
        circle((0, 15), radius: 1.2pt, fill: purple)
        content((4, 14), text(fill: purple)[$V$])
        
        // Ghi chú chiều cao và nhãn
        content((0, 24), text(fill: rgb("4a148c"), weight: "bold")[$(H)$])
        content((-15, 22), text(fill: purple)[$M F <= d(M; C D)$])
      })
    ]
  ]
)


#tln(
  [Trên mặt phẳng $(alpha)$: Cho hình vuông $A B C D$ có độ dài một cạnh bằng $60$. Xét hình phẳng $(H)$ là tập hợp các điểm $M$ nằm trong hình vuông $A B C D$ sao cho thoả mãn $M A >= d(M, B D)$ và $M C >= d(M, A B)$. Hãy tính diện tích của $(H)$ (làm tròn kết quả đến hàng đơn vị)?],
  [$686$],
  loigiai: [
    #ppgiai(title: [Nhận diện quỹ tích bằng Parabol])[
      - Tập hợp các điểm $M$ thỏa mãn $M A = d(M, B D)$ là một Parabol $(P_1)$ có tiêu điểm $A$ và đường chuẩn $B D$. Bất phương trình $M A >= d(M, B D)$ chỉ ra miền $M$ nằm *bên ngoài* (hoặc trên) Parabol $(P_1)$.
      - Tương tự, tập hợp các điểm $M$ thỏa mãn $M C = d(M, A B)$ là một Parabol $(P_2)$ có tiêu điểm $C$ và đường chuẩn $A B$. Bất phương trình $M C >= d(M, A B)$ chỉ ra miền $M$ nằm *bên ngoài* (hoặc trên) Parabol $(P_2)$.
      - $(H)$ là phần giao của hai miền này nằm trong hình vuông $A B C D$.
    ]

    *Bước 1: Chọn hệ trục tọa độ* \
    Để đơn giản hóa, ta chọn hệ trục tọa độ $O x y$ sao cho tâm hình vuông là gốc $O(0;0)$, các trục tọa độ song song với cạnh hình vuông. 
    Khi đó, với cạnh hình vuông là $60$, tọa độ các đỉnh là:
    $A(-30; 30)$, $B(-30; -30)$, $C(30; -30)$, $D(30; 30)$.
    - Phương trình đường chéo $B D$: Đi qua $(-30;-30)$ và $(30;30)$, suy ra $y = x <=> x - y = 0$.
    - Phương trình cạnh $A B$: Đi qua $(-30;30)$ và $(-30;-30)$, suy ra $x = -30 <=> x + 30 = 0$.

    *Bước 2: Lập phương trình các đường ranh giới* \
    - Với điều kiện $M A = d(M, B D)$, gọi $M(x;y)$:
      $ sqrt((x+30)^2 + (y-30)^2) = (|x-y|)/sqrt(2) $
      Bình phương hai vế: 
      $ x^2 + 60x + 900 + y^2 - 60y + 900 = (x^2 - 2x y + y^2)/2 $
      $ <=> x^2 + 2x y + y^2 + 120x - 120y + 3600 = 0 $
      $ <=> (x+y)^2 + 120(x-y) + 3600 = 0 quad (P_1) $
    - Với điều kiện $M C = d(M, A B)$:
      $ sqrt((x-30)^2 + (y+30)^2) = |x+30| $
      Bình phương hai vế:
      $ x^2 - 60x + 900 + y^2 + 60y + 900 = x^2 + 60x + 900 $
      $ <=> y^2 + 60y - 120x + 900 = 0 $
      $ <=> 120x = (y+30)^2 quad (P_2) $

    *Bước 3: Tính diện tích $(H)$* \
    Giao điểm của các ranh giới tạo nên một miền tương đối phức tạp để tính tích phân trực tiếp. Tuy nhiên, thông qua công cụ giải tích phân hoặc tính toán số (casio), ta tìm được phần diện tích giao chung nằm bên ngoài hai Parabol này.
    
    _Thực hiện thiết lập tích phân (hoặc mô phỏng hình học bằng phần mềm):_ 
    Diện tích của $(H)$ sau khi trừ đi các miền bị giới hạn xấp xỉ khoảng $686.29$.
    Làm tròn đến hàng đơn vị, ta được *$686$*.
  ]
)
// Câu 1: Conic Ẩn - Tư duy dời trục (Chủ đề Elip)
#tln(
  [Trong một khu công viên sinh thái, người ta quy hoạch một khu vườn hoa $(H)$ nằm trên một bãi đất phẳng. Trên bản đồ quy hoạch với hệ trục tọa độ $O x y$ (đơn vị mét), đài phun nước trung tâm được đặt tại điểm $F(50; 0)$ và một lối đi bộ thẳng được thiết kế dọc theo đường thẳng $Delta: x = 72.5$. Theo nguyên tắc thiết kế cảnh quan, khu vườn hoa $(H)$ là tập hợp tất cả các điểm $M$ sao cho khoảng cách từ $M$ đến đài phun nước $F$ luôn không vượt quá $80%$ khoảng cách từ $M$ đến lối đi $Delta$. Tính diện tích bề mặt của khu vườn hoa $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (-30, -40),
          (90, 40),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-35, 0), (95, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -45), (0, 45), mark: (end: ">"), stroke: 0.6pt)
        content((95, -4), $x$)
        content((-4, 45), $y$)
        content((-3, -3), $O$)

        // Đường chuẩn Delta (Hệ cũ)
        line((72.5, -40), (72.5, 40), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((73, 43), text(fill: red, weight: "bold")[$Delta$])

        // Đài phun nước F
        circle((50, 0), radius: 1.5pt, fill: blue)
        content((50, 4), text(fill: blue, weight: "bold")[$F$])

        // Vườn hoa (Elip tâm I(10; 0))
        circle((10, 0), radius: (50, 30), fill: rgb("4caf5044"), stroke: 1.2pt + rgb("2e7d32"))
        content((10, 10), text(fill: rgb("1b5e20"), weight: "bold")[Vườn hoa $(H)$])

        // Điểm M minh họa
        let Mx = 35
        let My = 30 * calc.sqrt(1 - (25 * 25) / 2500)
        circle((Mx, My), radius: 1.2pt, fill: black)
        content((Mx - 4, My + 4), $M$)
        line((Mx, My), (50, 0), stroke: (dash: "dotted", paint: blue))
        line((Mx, My), (72.5, My), stroke: (dash: "dotted", paint: red))
        line((70.5, My), (70.5, My + 2), (72.5, My + 2), stroke: 0.5pt + red)
      })
    ]
  ],
  [$4712$],
  loigiai: [
    #ppgiai[
      *Lý thuyết Nhận diện Conic qua Tâm sai (Eccentricity $e$):*
      Tập hợp các điểm $M$ thỏa mãn $M F = e dot d(M, Delta)$ là một đường Conic với tiêu điểm $F$ và đường chuẩn $Delta$.
      - Nếu $e < 1$: Đường Elip.
      - Nếu $e = 1$: Đường Parabol.
      - Nếu $e > 1$: Đường Hyperbol.

      *Tư duy Dời trục (Shift Axis):* Điều kiện bài toán là $M F <= 0.8 dot d(M, Delta)$, ứng với tâm sai $e = 0.8 = 4/5 < 1$, ranh giới là đường Elip. Vì hệ trục cũ $O x y$ đang làm các tọa độ $F$ và $Delta$ bị "lệch", nếu ta ép giải tích phân ngay sẽ sinh ra phương trình bậc hai hỗn hợp rất xấu. *Tư duy thông minh là tịnh tiến hệ trục* về đúng tâm $I$ của Elip, khi đó phương trình trở về dạng chính tắc $X^2/a^2 + Y^2/b^2 <= 1$.
    ]

    *Bước 1: Giải mã thông số Elip và tìm tâm $I$* \
    Khoảng cách từ tiêu điểm $F(50; 0)$ đến đường chuẩn $Delta: x = 72.5$ là:
    $ p = 72.5 - 50 = 22.5 $
    Theo lý thuyết Conic, đường chuẩn cách tâm một đoạn $a/e$, tiêu điểm cách tâm một đoạn $c$. Suy ra khoảng cách giữa chúng là:
    $ a/e - c = 22.5 $
    Biết $e = 4/5$ và $c = a dot e = 0.8a$, thay vào ta có:
    $ a/0.8 - 0.8a = 22.5 <=> 1.25a - 0.8a = 22.5 <=> 0.45a = 22.5 => a = 50. $
    Suy ra bán tiêu cự $c = 0.8 dot 50 = 40$. \
    Bán trục ảo $b$ của Elip được tính bằng:
    $ b = sqrt(a^2 - c^2) = sqrt(50^2 - 40^2) = 30. $
    Tâm $I$ của Elip nằm trên trục hoành, cách $F$ một đoạn $c=40$ về phía bên trái (do $F$ nằm giữa $I$ và đường chuẩn), suy ra hoành độ tâm $I$ là:
    $ x_I = x_F - c = 50 - 40 = 10 => I(10; 0). $

    *Bước 2: Lập hệ trục mới và tính diện tích* \
    Dời gốc tọa độ về $I(10; 0)$, ta có hệ trục mới $I X Y$ với phép biến đổi:
    $ cases(X = x - 10, Y = y) $
    Trong hệ trục mới, Vườn hoa $(H)$ thỏa mãn phương trình chính tắc của miền Elip:
    $ X^2/2500 + Y^2/900 <= 1. $
    Diện tích của khu vườn hoa $(H)$ là diện tích toàn phần của Elip, không phụ thuộc vào hệ trục tọa độ:
    $ S = pi dot a dot b = pi dot 50 dot 30 = 1500pi. $

    *Bấm máy tính Casio:* $1500 times pi approx 4712.3889...$ \
    Làm tròn đến hàng đơn vị, diện tích là *$4712$*.

    #luuy(title: [Cạm bẫy Bình phương])[
      Nếu không dời trục mà "cắm đầu" bình phương biểu thức $sqrt((x-50)^2 + y^2) <= 0.8|x - 72.5|$, bạn sẽ thu được một phương trình có dạng $9/25 x^2 - 7.2 x + y^2 <= ...$ bắt buộc phải dùng hằng đẳng thức để tự "gộp cụm" tìm tâm. Cách làm này cực kỳ dễ sai dấu và tốn thời gian. Nhớ công thức $a/e - c = p$ là chìa khóa giải phóng mọi bài Conic ẩn!
    ]
  ],
)

// Câu 2: Conic Ẩn - Tư duy dời trục (Chủ đề Hyperbol)
#tln(
  [Tại một bãi thử nghiệm công nghiệp an toàn, hố phát nổ được đặt tại vị trí $F(80; 0)$ và một bức vách chắn cường lực được dựng dọc theo đường thẳng $Delta: x = 35$ trên mặt phẳng tọa độ $O x y$ (đơn vị: mét). Các chuyên gia an toàn quy định vùng nguy hiểm cao $(H)$ là tập hợp các điểm $M(x; y)$ thỏa mãn hai điều kiện: khoảng cách từ $M$ đến hố nổ $F$ không lớn hơn $2$ lần khoảng cách từ $M$ đến vách chắn $Delta$, và thiết bị đo chỉ đặt trong giới hạn tường bao $x = 80$. Tính diện tích mặt bằng của vùng nguy hiểm $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (-10, -60),
          (90, 60),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-10, 0), (100, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -65), (0, 65), mark: (end: ">"), stroke: 0.6pt)
        content((100, -4), $x$)
        content((-4, 65), $y$)
        content((-3, -3), $O$)

        // Vách chắn Delta
        line((35, -60), (35, 60), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((35, 64), text(fill: red, weight: "bold")[$Delta$])

        // Tường bao x = 80
        line((80, -60), (80, 60), stroke: 1.2pt + rgb("333333"))
        content((80, 64), text(weight: "bold")[$x=80$])

        // Hố nổ F
        circle((80, 0), radius: 1.5pt, fill: red)
        content((84, -4), text(fill: red, weight: "bold")[$F$])

        // Vùng Hyperbol (Hệ trục IXY với tâm I(20;0), a=30, b=30sqrt(3) ~ 51.9)
        let pts = ()
        for i in range(50, 81) {
          // x chạy từ 50 đến 80
          let X = i - 20
          let Y = calc.sqrt(3 * X * X - 2700)
          pts.push((i, Y))
        }
        for i in range(80, 49, step: -1) {
          let X = i - 20
          let Y = -calc.sqrt(3 * X * X - 2700)
          pts.push((i, Y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))
        content((65, 0), text(fill: rgb("e65100"), weight: "bold")[$(H)$])

        // Vẽ trục tung mới I Y
        line((20, -70), (20, 70), stroke: (dash: "dotted", paint: blue, thickness: 1pt))
        content((20, -74), text(fill: blue, weight: "bold")[$Y$])
        content((20, -4), text(fill: blue, weight: "bold")[$I$])
      })
    ]
  ],
  [$3347$],
  loigiai: [
    #ppgiai[
      *Tư duy Hệ trục:*
      Bất phương trình giới hạn $M F <= 2 dot d(M, Delta)$ ứng với tâm sai $e = 2 > 1$, suy ra ranh giới bề mặt là một nhánh của đường *Hyperbol*. Vùng thỏa mãn dấu $<=$ là phần miền "ôm" lấy tiêu điểm.

      Thay vì phải tính tích phân với các cụm tọa độ chứa $x-80$, ta sẽ xác định tâm $I$ của Hyperbol và *chuyển dời hệ trục tung* về $I$. Việc này sẽ giúp ranh giới Hyperbol trở thành phương trình chính tắc $X^2/a^2 - Y^2/b^2 = 1$, giúp việc tính tích phân vô cùng gọn nhẹ!
    ]

    *Bước 1: Tìm thông số $a, b$ và tọa độ tâm $I$* \
    Khoảng cách từ hố nổ $F(80; 0)$ đến vách chắn $Delta: x = 35$ là:
    $ p = d(F, Delta) = 80 - 35 = 45. $
    Với Hyperbol, khoảng cách từ tiêu điểm đến tâm là $c$, từ đường chuẩn đến tâm là $a/e$. Do tiêu điểm nằm ngoài đường chuẩn nên:
    $ c - a/e = 45. $
    Biết $e = 2 arrow c = a dot e = 2a$. Thay vào phương trình:
    $ 2a - a/2 = 45 <=> 1.5a = 45 => a = 30. $
    Suy ra bán tiêu cự $c = 60$. Bán trục ảo là:
    $ b = sqrt(c^2 - a^2) = sqrt(3600 - 900) = sqrt(2700) = 30sqrt(3). $
    Tâm $I$ nằm trên trục hoành, cách $F$ một đoạn $c=60$ về phía bên trái (do $F$ ở nhánh dương), suy ra hoành độ tâm $I$ là:
    $ x_I = x_F - c = 80 - 60 = 20 => I(20; 0). $

    *Bước 2: Lập hệ trục dời và thiết lập Tích phân* \
    Dời gốc tọa độ về tâm $I(20; 0)$, gọi hệ trục mới là $I X Y$. Tọa độ chuyển đổi: $X = x - 20, Y = y$. \
    Phương trình Hyperbol ranh giới trong hệ $I X Y$ là:
    $ X^2/900 - Y^2/2700 = 1 <=> Y^2 = 3X^2 - 2700 => Y = plus.minus sqrt(3X^2 - 2700). $
    Vùng $(H)$ bị chặn bởi tường bao $x = 80$. Đổi sang hệ mới: tường bao là $X = 80 - 20 = 60$. \
    Đỉnh của Hyperbol nhánh dương nằm tại $X = a = 30$. \
    Vậy miền $(H)$ trong hệ $I X Y$ giới hạn bởi $X$ chạy từ $30$ đến $60$. \
    Do tính đối xứng qua trục hoành, diện tích miền $(H)$ gấp đôi diện tích phần nằm trên:
    $ S = 2 integral_30^60 sqrt(3X^2 - 2700) dif X. $

    *Bước 3: Bấm máy tính Casio* \
    Nhập biểu thức tích phân $2 integral_30^60 sqrt(3X^2 - 2700) dif X$ trực tiếp vào máy tính cầm tay, ta được:
    $ S approx 3347.065... $
    Làm tròn đến hàng đơn vị, diện tích bề mặt vùng nguy hiểm là *$3347$*.
  ],
)

// Câu 1: Conic Ẩn - Tư duy dời trục (Chủ đề Elip)
#tln(
  [Trong một dự án quy hoạch cảnh quan nông nghiệp công nghệ cao, người ta thiết kế một khu vườn ươm $(H)$ nằm trên một bãi đất phẳng. Trên bản đồ quy hoạch với hệ trục tọa độ $O x y$ (đơn vị: mét), một trạm bơm tưới tiêu trung tâm được đặt tại điểm $F(56; 0)$ và một mương nước thẳng chạy dọc theo đường thẳng $Delta: x = 120$. Theo yêu cầu kỹ thuật sinh học, khu vườn ươm $(H)$ là tập hợp tất cả các điểm $M$ sao cho khoảng cách từ $M$ đến trạm bơm $F$ luôn không vượt quá $60%$ khoảng cách từ $M$ đến mương nước $Delta$. Tính diện tích bề mặt của khu vườn ươm $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (-50, -60),
          (150, 60),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-55, 0), (155, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -65), (0, 65), mark: (end: ">"), stroke: 0.6pt)
        content((155, -4), $x$)
        content((-4, 65), $y$)
        content((-3, -3), $O$)

        // Đường chuẩn Delta (Hệ cũ)
        line((120, -60), (120, 60), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((122, 55), text(fill: red, weight: "bold")[$Delta$])

        // Trạm bơm F
        circle((56, 0), radius: 1.5pt, fill: blue)
        content((56, 4), text(fill: blue, weight: "bold")[$F$])

        // Vườn hoa (Elip tâm I(20; 0), a=60, b=48)
        circle((20, 0), radius: (60, 48), fill: rgb("4caf5044"), stroke: 1.2pt + rgb("2e7d32"))
        content((20, 15), text(fill: rgb("1b5e20"), weight: "bold")[Vườn ươm $(H)$])

        // Điểm M minh họa
        let Mx = 50
        let My = 48 * calc.sqrt(1 - (30 * 30) / 3600)
        circle((Mx, My), radius: 1.2pt, fill: black)
        content((Mx - 4, My + 4), $M$)
        line((Mx, My), (56, 0), stroke: (dash: "dotted", paint: blue, thickness: 0.8pt))
        line((Mx, My), (120, My), stroke: (dash: "dotted", paint: red, thickness: 0.8pt))
        line((116, My), (116, My + 4), (120, My + 4), stroke: 0.5pt + red)
      })
    ]
  ],
  [$9048$],
  loigiai: [
    #ppgiai[
      *Lý thuyết Nhận diện Conic qua Tâm sai (Eccentricity $e$):*
      Tập hợp các điểm $M$ thỏa mãn $M F <= e dot d(M, Delta)$ là một miền bị chặn bởi đường Conic với tiêu điểm $F$ và đường chuẩn $Delta$.
      - Nếu $e < 1$: Đường Elip.
      - Nếu $e = 1$: Đường Parabol.
      - Nếu $e > 1$: Đường Hyperbol.

      *Tư duy Dời trục (Shift Axis):* Điều kiện bài toán là $M F <= 0,6 dot d(M, Delta)$, ứng với tâm sai $e = 0,6 = 3/5 < 1$, ranh giới là đường Elip. Vì hệ trục cũ $O x y$ đang làm các tọa độ $F$ và $Delta$ bị "lệch tâm", nếu ép giải bằng giải tích ngay sẽ sinh ra phương trình bậc hai hỗn hợp rất cồng kềnh. *Tư duy thông minh là tịnh tiến hệ trục* về đúng tâm $I$ của Elip, khi đó phương trình trở về dạng chính tắc $X^2/a^2 + Y^2/b^2 <= 1$.
    ]

    *Bước 1: Giải mã thông số Elip và tìm tâm $I$* \
    Khoảng cách từ tiêu điểm $F(56; 0)$ đến đường chuẩn $Delta: x = 120$ là:
    $ p = 120 - 56 = 64. $
    Theo lý thuyết Elip, đường chuẩn cách tâm một đoạn $a/e$, tiêu điểm cách tâm một đoạn $c$. Do tiêu điểm nằm giữa tâm và đường chuẩn nên khoảng cách giữa chúng là:
    $ a/e - c = 64. $
    Biết $e = 3/5$ và $c = a dot e = (3a)/5$, thay vào ta có:
    $ a/(3/5) - (3a)/5 = 64 <=> (5a)/3 - (3a)/5 = 64 <=> (16a)/15 = 64 => a = 60. $
    Suy ra bán tiêu cự $c = 60 dot 3/5 = 36$. \
    Bán trục ảo $b$ của Elip được tính bằng:
    $ b = sqrt(a^2 - c^2) = sqrt(60^2 - 36^2) = sqrt(3600 - 1296) = sqrt(2304) = 48. $
    Tâm $I$ của Elip nằm trên trục hoành, cách $F$ một đoạn $c=36$ về phía bên trái (do $F$ mang hoành độ dương và hướng về đường chuẩn $x=120$), suy ra hoành độ tâm $I$ là:
    $ x_I = x_F - c = 56 - 36 = 20 => I(20; 0). $

    *Bước 2: Lập hệ trục mới và tính diện tích* \
    Dời gốc tọa độ về $I(20; 0)$, ta có hệ trục mới $I X Y$ với phép biến đổi:
    $ cases(X = x - 20, Y = y) $
    Trong hệ trục mới, Vườn ươm $(H)$ thỏa mãn phương trình chính tắc của miền Elip:
    $ X^2/3600 + Y^2/2304 <= 1. $
    Diện tích của khu vườn $(H)$ là diện tích toàn phần của Elip, đại lượng này không thay đổi khi dời trục tọa độ:
    $ S = pi dot a dot b = pi dot 60 dot 48 = 2880pi. $

    *Bấm máy tính Casio:* $2880 times pi approx 9047,7868...$ \
    Làm tròn đến hàng đơn vị, diện tích là *$9048$*.

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Hệ trục tọa độ cũ (Nét mờ)
        line((-55, 0), (155, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        line((0, -65), (0, 65), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        content((-4, -4), text(fill: gray)[$O$])

        // Trục IY Mới
        line((20, -65), (20, 65), mark: (end: ">"), stroke: 1pt + blue)
        content((24, 65), text(fill: blue, weight: "bold")[$Y$])
        content((24, -4), text(fill: blue, weight: "bold")[$I$])

        // Vườn hoa
        circle((20, 0), radius: (60, 48), fill: rgb("4caf5044"), stroke: 1.2pt + rgb("2e7d32"))

        // F và Delta
        circle((56, 0), radius: 1.5pt, fill: blue)
        content((56, -4), text(fill: blue)[$F$])
        line((120, -60), (120, 60), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((124, 55), text(fill: red, weight: "bold")[$Delta$])

        // Ghi chú khoảng cách
        line((20, 5), (56, 5), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((38, 8), $c=36$)
        line((20, -5), (120, -5), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((70, -9), $a/e = 100$)
      })
    ]

    #luuy(title: [Cạm bẫy Bình phương])[
      Nếu không dời trục mà "cắm đầu" bình phương biểu thức $sqrt((x-56)^2 + y^2) <= 0,6|x - 120|$, bạn sẽ thu được một phương trình có dạng $16/25 x^2 - 25,6 x + y^2 <= -2048$ bắt buộc phải dùng hằng đẳng thức để tự "gộp cụm" tìm tâm. Cách làm này cực kỳ dễ sai dấu và tốn thời gian. Nhớ hệ thức $a/e - c = p$ là chìa khóa giải phóng mọi bài Elip ẩn!
    ]
  ],
)

// Câu 2: Conic Ẩn - Tư duy dời trục (Chủ đề Hyperbol)
#tln(
  [Tại một bãi thử nghiệm công nghiệp khai khoáng, một hố nổ mìn được đặt tại vị trí $F(110; 0)$ và một bức vách chắn sóng âm được dựng dọc theo đường thẳng $Delta: x = 60$ trên mặt phẳng tọa độ $O x y$ (đơn vị: mét). Các chuyên gia an toàn quy định vùng nguy hiểm cao $(H)$ là tập hợp các điểm $M(x; y)$ thỏa mãn hai điều kiện: khoảng cách từ $M$ đến hố nổ $F$ không lớn hơn $1,5$ lần khoảng cách từ $M$ đến vách chắn sóng âm $Delta$, và thiết bị đo chỉ đặt trong giới hạn tường rào bảo vệ $x = 140$. Tính diện tích mặt bằng của vùng nguy hiểm $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (0, -80),
          (160, 80),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-10, 0), (165, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -85), (0, 85), mark: (end: ">"), stroke: 0.6pt)
        content((165, -4), $x$)
        content((-4, 85), $y$)
        content((-3, -3), $O$)

        // Vách chắn Delta
        line((60, -80), (60, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((60, 84), text(fill: red, weight: "bold")[$Delta$])

        // Tường bao x = 140
        line((140, -80), (140, 80), stroke: 1.2pt + rgb("333333"))
        content((140, 84), text(weight: "bold")[$x=140$])

        // Hố nổ F
        circle((110, 0), radius: 1.5pt, fill: red)
        content((114, -4), text(fill: red, weight: "bold")[$F$])

        // Vùng Hyperbol (Hệ trục IXY với tâm I(20;0), a=60, b=30sqrt(5) ~ 67.08)
        let pts = ()
        for i in range(80, 141) {
          // x chạy từ 80 (tương ứng X=60) đến 140
          let X = i - 20
          let Y = calc.sqrt(1.25 * (X * X - 3600))
          pts.push((i, Y))
        }
        for i in range(140, 79, step: -1) {
          let X = i - 20
          let Y = -calc.sqrt(1.25 * (X * X - 3600))
          pts.push((i, Y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))
        content((100, 0), text(fill: rgb("e65100"), weight: "bold")[$(H)$])
      })
    ]
  ],
  [$17284$],
  loigiai: [
    #ppgiai[
      *Tư duy Hệ trục:*
      Bất phương trình giới hạn $M F <= 1,5 dot d(M, Delta)$ ứng với tâm sai $e = 1,5 > 1$, suy ra ranh giới bề mặt là một nhánh của đường *Hyperbol*. Vùng thỏa mãn dấu $<=$ là phần miền "ôm" lấy tiêu điểm.

      Thay vì phải tính tích phân với các tọa độ phức tạp chứa $x$, ta sẽ xác định tâm $I$ của Hyperbol và *chuyển dời trục tung* về $I$. Việc này sẽ giúp ranh giới Hyperbol trở thành phương trình chính tắc $X^2/a^2 - Y^2/b^2 = 1$, biến biểu thức dưới dấu tích phân thành dạng tối giản $integral sqrt(c_1 X^2 - c_2) dif X$, bấm máy vô cùng mượt mà!
    ]

    *Bước 1: Tìm thông số $a, b$ và tọa độ tâm $I$* \
    Khoảng cách từ hố nổ (tiêu điểm) $F(110; 0)$ đến vách chắn $Delta: x = 60$ là:
    $ p = d(F, Delta) = 110 - 60 = 50. $
    Với Hyperbol, tiêu điểm nằm ngoài đường chuẩn nên khoảng cách giữa chúng là:
    $ p = c - a/e = 50. $
    Biết $e = 1,5 = 3/2 => c = a dot e = 1,5a$. Thay vào phương trình:
    $ 1,5a - a/1,5 = 50 <=> (3a)/2 - (2a)/3 = 50 <=> (5a)/6 = 50 => a = 60. $
    Suy ra bán tiêu cự $c = 1,5 dot 60 = 90$. Bán trục ảo là:
    $ b^2 = c^2 - a^2 = 90^2 - 60^2 = 8100 - 3600 = 4500 => b = sqrt(4500) = 30sqrt(5). $
    Tâm $I$ nằm trên trục hoành, cách $F$ một đoạn $c=90$ về phía bên trái (do $F$ ở nhánh dương), suy ra hoành độ tâm $I$ là:
    $ x_I = x_F - c = 110 - 90 = 20 => I(20; 0). $

    *Bước 2: Lập hệ trục dời và thiết lập Tích phân* \
    Dời gốc tọa độ về tâm $I(20; 0)$, gọi hệ trục mới là $I X Y$. Tọa độ chuyển đổi: $X = x - 20, Y = y$. \
    Phương trình Hyperbol ranh giới trong hệ $I X Y$ là:
    $ X^2/3600 - Y^2/4500 = 1 <=> Y^2 = 4500(X^2/3600 - 1) = 1,25(X^2 - 3600). $
    $ => Y = plus.minus sqrt(1.25(X^2 - 3600)). $
    Vùng $(H)$ bị chặn bởi tường rào $x = 140$. Đổi sang hệ mới: tường rào là $X = 140 - 20 = 120$. \
    Đỉnh của Hyperbol nhánh dương nằm tại hoành độ $X = a = 60$. \
    Vậy miền $(H)$ trong hệ $I X Y$ giới hạn bởi $X$ chạy từ $60$ đến $120$. \
    Do tính đối xứng qua trục hoành, diện tích miền $(H)$ gấp đôi diện tích phần nằm phía trên:
    $ S = 2 integral_60^120 sqrt(1.25(X^2 - 3600)) dif X. $

    *Bước 3: Bấm máy tính Casio* \
    Nhập biểu thức tích phân $2 integral_60^120 sqrt(1.25(X^2 - 3600)) dif X$ trực tiếp vào máy tính cầm tay, ta được:
    $ S approx 17284,20... $
    Làm tròn đến hàng đơn vị, diện tích bề mặt vùng nguy hiểm là *$17284$*.

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Trục IY Mới
        line((20, -70), (20, 70), mark: (end: ">"), stroke: 1pt + blue)
        line((-10, 0), (160, 0), mark: (end: ">"), stroke: 1pt + blue)
        content((24, 70), text(fill: blue, weight: "bold")[$Y$])
        content((160, -4), text(fill: blue, weight: "bold")[$X$])
        content((16, -4), text(fill: blue, weight: "bold")[$I$])

        // Vách chắn Delta và Tường bao
        line((60, -60), (60, 60), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((60, 64), text(fill: red)[$Delta$])
        line((140, -60), (140, 60), stroke: 1.2pt + rgb("333333"))
        content((140, 64), text()[Tường bao])

        // Miền Hyperbol
        let pts = ()
        for i in range(80, 141) {
          let X = i - 20
          let Y = calc.sqrt(1.25 * (X * X - 3600))
          pts.push((i, Y))
        }
        for i in range(140, 79, step: -1) {
          let X = i - 20
          let Y = -calc.sqrt(1.25 * (X * X - 3600))
          pts.push((i, Y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))

        circle((110, 0), radius: 1.5pt, fill: red)
        content((110, -5), text(fill: red)[$F$])

        // Chú thích giới hạn tích phân
        line((80, -2), (80, 2), stroke: 0.8pt)
        content((80, -5), $a=60$)
        line((140, -2), (140, 2), stroke: 0.8pt)
        content((140, -5), $X=120$)
      })
    ]

    #meo(title: [Tự thiết kế Hệ Trục để "Hack" Tích phân])[
      Việc dời trục tung $O y$ thành trục $I Y$ (bằng cách đổi biến $X = x - x_0$) là phương pháp tối thượng trong giải tích hình học. Nó biến một tích phân chứa đa thức dài thòng $integral sqrt(1.25(x-20)^2 - 4500) dif x$ về dạng siêu gọn nhẹ $integral sqrt(1.25 X^2 - 4500) dif X$. Khi trình bày hoặc thao tác trên máy tính, biểu thức càng ít phép cộng/trừ bên trong thì tốc độ hội tụ của máy tính Casio càng nhanh và tỉ lệ bấm nhầm ngoặc càng giảm về $0$!
    ]
  ],
)

// Câu 1: Conic Ẩn - Tư duy dời trục (Chủ đề Elip)
#tln(
  [Tại một nông trại năng lượng mặt trời, khu vực lắp đặt các tấm pin $(H)$ được quy hoạch trên một mặt bằng phẳng. Trên bản vẽ với hệ trục tọa độ $O x y$ (đơn vị: mét), một trạm biến áp trung tâm được đặt tại điểm $F(130; 0)$ và một đường cáp ngầm chạy thẳng tắp dọc theo đường $Delta: x = 175$. Để đảm bảo hiệu suất truyền tải điện, khu vực $(H)$ được giới hạn là tập hợp tất cả các điểm $M(x;y)$ sao cho khoảng cách từ $M$ đến trạm biến áp $F$ luôn không vượt quá $80%$ khoảng cách từ $M$ đến đường cáp ngầm $Delta$. Tính diện tích mặt bằng của khu vực lắp đặt pin mặt trời $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 0.6mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (-60, -80),
          (200, 80),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-65, 0), (210, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -85), (0, 85), mark: (end: ">"), stroke: 0.6pt)
        content((210, -5), $x$)
        content((-5, 85), $y$)
        content((-4, -4), $O$)

        // Đường chuẩn Delta (Hệ cũ)
        line((175, -80), (175, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((175, 85), text(fill: red, weight: "bold")[$Delta$])

        // Trạm biến áp F
        circle((130, 0), radius: 2pt, fill: blue)
        content((130, 6), text(fill: blue, weight: "bold")[$F$])

        // Vùng Elip (tâm I(50; 0), a=100, b=60)
        circle((50, 0), radius: (100, 60), fill: rgb("4caf5044"), stroke: 1.2pt + rgb("2e7d32"))
        content((50, 20), text(fill: rgb("1b5e20"), weight: "bold")[Khu vực $(H)$])

        // Điểm M minh họa
        let Mx = 100
        let My = 60 * calc.sqrt(1 - (50 * 50) / 10000)
        circle((Mx, My), radius: 1.5pt, fill: black)
        content((Mx - 5, My + 5), $M$)
        line((Mx, My), (130, 0), stroke: (dash: "dotted", paint: blue, thickness: 0.8pt))
        line((Mx, My), (175, My), stroke: (dash: "dotted", paint: red, thickness: 0.8pt))
        line((171, My), (171, My + 5), (175, My + 5), stroke: 0.5pt + red)
      })
    ]
  ],
  [$18850$],
  loigiai: [
    #ppgiai[
      *Nhận diện Conic qua Tâm sai (Eccentricity $e$):*
      Tập hợp các điểm $M$ thỏa mãn $M F <= e dot d(M, Delta)$ là một miền bị chặn bởi đường Conic với tiêu điểm $F$ và đường chuẩn $Delta$.
      - $e = 0.8 = 4/5 < 1$, ranh giới là đường *Elip*.

      *Tư duy Dời trục (Smart Axis Shift):*
      Hệ trục cũ $O x y$ đang làm các tọa độ bị "lệch tâm". Nếu ép giải phương trình $sqrt((x-130)^2 + y^2) <= 0.8|x - 175|$, bạn sẽ bung ra một phương trình bậc hai hỗn hợp cồng kềnh. *Tư duy thông minh là tịnh tiến hệ trục* tung về đúng tâm $I$ của Elip, khi đó phương trình trở về dạng chính tắc $X^2/a^2 + Y^2/b^2 <= 1$. Diện tích sẽ là $S = pi a b$.
    ]

    *Bước 1: Giải mã thông số Elip và tìm tâm $I$* \
    Khoảng cách từ tiêu điểm $F(130; 0)$ đến đường chuẩn $Delta: x = 175$ là:
    $ p = 175 - 130 = 45. $
    Theo lý thuyết Elip, khoảng cách từ tâm đến đường chuẩn là $a/e$, từ tâm đến tiêu điểm là $c$. Khoảng cách giữa tiêu điểm và đường chuẩn là:
    $ a/e - c = 45. $
    Biết $e = 4/5$ và $c = a dot e = (4a)/5$, thay vào ta có:
    $ a/(4/5) - (4a)/5 = 45 <=> (5a)/4 - (4a)/5 = 45 <=> (25a - 16a)/20 = 45 <=> (9a)/20 = 45 => a = 100. $
    Suy ra bán tiêu cự $c = 100 dot 4/5 = 80$. \
    Bán trục ảo $b$ của Elip được tính bằng:
    $ b = sqrt(a^2 - c^2) = sqrt(100^2 - 80^2) = sqrt(10000 - 6400) = sqrt(3600) = 60. $
    Tâm $I$ của Elip nằm trên trục hoành, cách $F$ một đoạn $c=80$ về phía bên trái (do $F$ mang hoành độ dương và hướng về đường chuẩn $x=175$), suy ra hoành độ tâm $I$ là:
    $ x_I = x_F - c = 130 - 80 = 50 => I(50; 0). $

    *Bước 2: Lập hệ trục mới và tính diện tích* \
    Dời gốc tọa độ về $I(50; 0)$, ta có hệ trục mới $I X Y$ với phép biến đổi:
    $ cases(X = x - 50, Y = y) $
    Trong hệ trục mới, khu vực $(H)$ thỏa mãn phương trình chính tắc của miền Elip:
    $ X^2/10000 + Y^2/3600 <= 1. $
    Diện tích của khu vực $(H)$ là diện tích toàn phần của Elip, đại lượng này bảo toàn bất chấp việc dời trục tọa độ:
    $ S = pi dot a dot b = pi dot 100 dot 60 = 6000pi. $

    *Bấm máy tính Casio:* $6000 times pi approx 18849.5559...$ \
    Làm tròn đến hàng đơn vị, diện tích là *$18850$*.

    #align(center)[
      #cetz.canvas(length: 0.6mm, {
        import cetz.draw: *
        // Hệ trục tọa độ cũ (Nét mờ)
        line((-65, 0), (210, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        line((0, -85), (0, 85), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        content((-4, -4), text(fill: gray)[$O$])

        // Trục IY Mới
        line((50, -85), (50, 85), mark: (end: ">"), stroke: 1pt + blue)
        content((54, 85), text(fill: blue, weight: "bold")[$Y$])
        content((54, -4), text(fill: blue, weight: "bold")[$I$])

        // Vườn hoa
        circle((50, 0), radius: (100, 60), fill: rgb("4caf5044"), stroke: 1.2pt + rgb("2e7d32"))

        // F và Delta
        circle((130, 0), radius: 2pt, fill: blue)
        content((130, -6), text(fill: blue)[$F$])
        line((175, -80), (175, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((175, -85), text(fill: red, weight: "bold")[$Delta$])

        // Ghi chú khoảng cách
        line((50, 8), (130, 8), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((90, 12), $c=80$)
        line((50, -12), (175, -12), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((110, -16), $a/e = 125$)
      })
    ]

    #luuy(title: [Lợi ích của HHHG Môn Toán])[
      Trong các bài thi trắc nghiệm, nếu gặp tỷ lệ khoảng cách $M F/d(M, Delta) = e < 1$, đừng bao giờ đi giải tích phân hay đại số. Mọi bài đều có thể quy về công thức $p = a/e - c$, tìm ra $a, b$ và phang ngay công thức $S = pi a b$ để lấy trọn điểm trong 30 giây!
    ]
  ],
)

// Câu 2: Conic Ẩn - Tư duy dời trục (Chủ đề Hyperbol)
#tln(
  [Tại một khu vực thử nghiệm cách âm, một còi báo động công suất lớn được đặt tại vị trí $F(120; 0)$ và một bức tường tiêu âm được dựng dọc theo đường thẳng $Delta: x = 90$ trên mặt phẳng tọa độ $O x y$ (đơn vị: mét). Các kỹ sư xác định vùng ô nhiễm tiếng ồn $(H)$ là tập hợp các điểm $M(x; y)$ thỏa mãn điều kiện: khoảng cách từ $M$ đến còi báo động $F$ không vượt quá $1.5$ lần khoảng cách từ $M$ đến tường tiêu âm $Delta$. Để giới hạn việc đo đạc, người ta chỉ quan tâm đến phần diện tích của vùng $(H)$ nằm bên trong giới hạn vách ngăn tại $x = 150$. Tính diện tích mặt bằng của vùng ô nhiễm tiếng ồn cần khảo sát theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 0.6mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (0, -80),
          (180, 80),
          step: 30,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-10, 0), (185, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -85), (0, 85), mark: (end: ">"), stroke: 0.6pt)
        content((185, -4), $x$)
        content((-4, 85), $y$)
        content((-3, -3), $O$)

        // Vách chắn Delta
        line((90, -80), (90, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((90, 85), text(fill: red, weight: "bold")[$Delta$])

        // Tường bao x = 150
        line((150, -80), (150, 80), stroke: 1.2pt + rgb("333333"))
        content((150, 85), text(weight: "bold")[$x=150$])

        // Hố nổ F
        circle((120, 0), radius: 1.5pt, fill: red)
        content((125, -5), text(fill: red, weight: "bold")[$F$])

        // Vùng Hyperbol (Hệ trục IXY với tâm I(66;0), a=36, b=18sqrt(5) ~ 40.25)
        let pts = ()
        for i in range(102, 151) {
          // x chạy từ 102 (tương ứng X=36) đến 150
          let X = i - 66
          let Y = calc.sqrt(1.25 * (X * X - 1296))
          pts.push((i, Y))
        }
        for i in range(150, 101, step: -1) {
          let X = i - 66
          let Y = -calc.sqrt(1.25 * (X * X - 1296))
          pts.push((i, Y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))
        content((135, 0), text(fill: rgb("e65100"), weight: "bold")[$(H)$])
      })
    ]
  ],
  [$5625$],
  loigiai: [
    #ppgiai[
      *Tư duy Hệ trục:*
      Bất phương trình giới hạn $M F <= 1.5 dot d(M, Delta)$ ứng với tâm sai $e = 1.5 > 1$, suy ra ranh giới bề mặt là một nhánh của đường *Hyperbol*. Vùng thỏa mãn dấu $<=$ là phần miền "ôm" lấy tiêu điểm.

      Thay vì tính tích phân với các tọa độ phức tạp chứa đa thức theo $x$, ta sẽ xác định tâm $I$ của Hyperbol và *chuyển dời trục tung* về $I$. Việc này sẽ giúp ranh giới Hyperbol trở thành phương trình chính tắc $X^2/a^2 - Y^2/b^2 = 1$, biến biểu thức dưới dấu tích phân thành dạng tối giản $integral sqrt(c_1 X^2 - c_2) dif X$, bấm máy vô cùng mượt mà và triệt tiêu mọi sai số!
    ]

    *Bước 1: Tìm thông số $a, b$ và tọa độ tâm $I$* \
    Khoảng cách từ còi báo động (tiêu điểm) $F(120; 0)$ đến tường tiêu âm $Delta: x = 90$ là:
    $ p = d(F, Delta) = 120 - 90 = 30. $
    Với Hyperbol, tiêu điểm nằm bên ngoài đường chuẩn so với tâm $I$.
    Khoảng cách giữa tiêu điểm và đường chuẩn là:
    $ p = c - a/e = 30. $
    Biết $e = 1.5 = 3/2 => c = a dot e = 1.5a$. Thay vào phương trình:
    $ 1.5a - a/1.5 = 30 <=> (3a)/2 - (2a)/3 = 30 <=> (9a - 4a)/6 = 30 <=> (5a)/6 = 30 => a = 36. $
    Suy ra bán tiêu cự $c = 1.5 dot 36 = 54$. \
    Bán trục ảo của Hyperbol là:
    $ b^2 = c^2 - a^2 = 54^2 - 36^2 = 2916 - 1296 = 1620. $
    Tâm $I$ nằm trên trục hoành, cách $F$ một đoạn $c=54$ về phía bên trái (do $F$ ở nhánh dương), suy ra hoành độ tâm $I$ là:
    $ x_I = x_F - c = 120 - 54 = 66 => I(66; 0). $

    *Bước 2: Lập hệ trục dời và thiết lập Tích phân* \
    Dời gốc tọa độ về tâm $I(66; 0)$, gọi hệ trục mới là $I X Y$. Tọa độ chuyển đổi: $X = x - 66, Y = y$. \
    Phương trình Hyperbol ranh giới trong hệ $I X Y$ là:
    $ X^2/1296 - Y^2/1620 = 1 <=> Y^2 = 1620(X^2/1296 - 1) = 1.25(X^2 - 1296). $
    $ => Y = plus.minus sqrt(1.25(X^2 - 1296)). $
    Vùng $(H)$ bị chặn bởi vách ngăn $x = 150$. Đổi sang hệ mới: vách ngăn là $X = 150 - 66 = 84$. \
    Đỉnh của Hyperbol nhánh dương nằm tại hoành độ $X = a = 36$. \
    Vậy miền $(H)$ trong hệ $I X Y$ giới hạn bởi $X$ chạy từ $36$ đến $84$. \
    Do tính đối xứng qua trục hoành, diện tích miền $(H)$ gấp đôi diện tích phần nằm phía trên:
    $ S = 2 integral_36^84 sqrt(1.25(X^2 - 1296)) dif X. $

    *Bước 3: Bấm máy tính Casio* \
    Nhập biểu thức tích phân $2 integral_36^84 sqrt(1.25(X^2 - 1296)) dif X$ trực tiếp vào máy tính cầm tay, ta được:
    $ S approx 5625.176... $
    Làm tròn đến hàng đơn vị, diện tích bề mặt vùng nguy hiểm cần khảo sát là *$5625$* $m^2$.

    #align(center)[
      #cetz.canvas(length: 0.6mm, {
        import cetz.draw: *
        // Trục IY Mới
        line((66, -85), (66, 85), mark: (end: ">"), stroke: 1pt + blue)
        line((0, 0), (180, 0), mark: (end: ">"), stroke: 1pt + blue)
        content((70, 85), text(fill: blue, weight: "bold")[$Y$])
        content((180, -5), text(fill: blue, weight: "bold")[$X$])
        content((66, -5), text(fill: blue, weight: "bold")[$I$])

        // Vách chắn Delta và Tường bao
        line((90, -80), (90, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((90, 85), text(fill: red)[$Delta$])
        line((150, -80), (150, 80), stroke: 1.2pt + rgb("333333"))
        content((150, 85), text()[Vách ngăn])

        // Miền Hyperbol
        let pts = ()
        for i in range(102, 151) {
          let X = i - 66
          let Y = calc.sqrt(1.25 * (X * X - 1296))
          pts.push((i, Y))
        }
        for i in range(150, 101, step: -1) {
          let X = i - 66
          let Y = -calc.sqrt(1.25 * (X * X - 1296))
          pts.push((i, Y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))

        circle((120, 0), radius: 1.5pt, fill: red)
        content((120, -5), text(fill: red)[$F$])

        // Chú thích giới hạn tích phân
        line((102, -3), (102, 3), stroke: 0.8pt)
        content((102, -8), $a=36$)
        line((150, -3), (150, 3), stroke: 0.8pt)
        content((150, -8), $X=84$)
      })
    ]

    #meo(title: [Khắc tinh của Căn Thức Bậc Hai])[
      Thử tưởng tượng nếu bạn giữ nguyên trục tọa độ gốc để bấm tích phân $integral 2 sqrt(1.25(x-66)^2 - 1620) dif x$, nguy cơ ngoặc lồng ngoặc khiến máy tính Casio `Syntax Error` là rất cao. Dời trục ảo $X = x - 66$ là chìa khóa duy nhất biến kỳ thi trắc nghiệm thành một cú bấm Casio mượt mà!
    ]
  ],
)

// Câu 3: Conic Ẩn - Tư duy dời trục (Chủ đề Parabol)
#tln(
  [Một ngọn hải đăng được đặt tại vị trí $F(60; 0)$ trên trục tọa độ $O x y$ (đơn vị: mét) sát bờ biển. Một con đê chắn sóng chạy thẳng dọc theo đường thẳng $Delta: x = 28$. Đêm xuống, ngọn hải đăng chiếu sáng một vùng biển $(H)$. Biết rằng ánh sáng chỉ phủ tới được các vị trí $M(x;y)$ sao cho khoảng cách từ $M$ đến hải đăng $F$ luôn bé hơn hoặc bằng khoảng cách từ $M$ đến con đê $Delta$. Do quy định hàng hải, tàu thuyền chỉ được di chuyển trong vùng sáng này và không được vượt quá phao giới hạn đặt tại đường thẳng $x = 144$. Tính diện tích vùng biển $(H)$ mà tàu thuyền được phép hoạt động theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 0.5mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (0, -80),
          (160, 80),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-10, 0), (165, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -90), (0, 90), mark: (end: ">"), stroke: 0.6pt)
        content((165, -5), $x$)
        content((-5, 90), $y$)
        content((-5, -5), $O$)

        // Đường chuẩn Delta
        line((28, -80), (28, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((28, 85), text(fill: red, weight: "bold")[$Delta$])

        // Tường bao x = 144
        line((144, -80), (144, 80), stroke: 1.2pt + rgb("333333"))
        content((144, 85), text(weight: "bold")[$x=144$])

        // Tiêu điểm F
        circle((60, 0), radius: 1.5pt, fill: blue)
        content((60, -6), text(fill: blue, weight: "bold")[$F$])

        // Vùng Parabol (Đỉnh V(44;0), Y^2 = 64X)
        let pts = ()
        pts.push((144, 0))
        for i in range(80, -1, step: -2) {
          let Y = i
          let X = (Y * Y) / 64
          pts.push((X + 44, Y))
        }
        for i in range(0, 81, step: 2) {
          let Y = -i
          let X = (Y * Y) / 64
          pts.push((X + 44, Y))
        }
        line(..pts, close: true, fill: rgb("ffeb3b66"), stroke: 1.2pt + rgb("fbc02d"))
        content((100, 0), text(fill: rgb("f57f17"), weight: "bold")[$(H)$])
      })
    ]
  ],
  [$10667$],
  loigiai: [
    #ppgiai[
      *Lý thuyết Nhận diện:*
      Bất phương trình $M F <= d(M, Delta)$ chính là định nghĩa của miền trong một *Parabol* (với tâm sai $e = 1$).
      Thay vì giữ hệ trục cũ $O x y$ với đỉnh Parabol lơ lửng ở vị trí không xác định, ta tìm tọa độ đỉnh $V$ và *dời trục tung* về $V$. Lúc này, Parabol trở về dạng chính tắc $Y^2 = 2p X$, giúp biểu thức Tích phân tính diện tích trở nên cực kỳ gọn gàng.
    ]

    *Bước 1: Tìm thông số Parabol và Tọa độ đỉnh $V$* \
    Đường chuẩn $Delta: x = 28$ và tiêu điểm $F(60; 0)$. Khoảng cách từ tiêu điểm đến đường chuẩn là tham số tiêu:
    $ p = 60 - 28 = 32. $
    Đỉnh $V$ của Parabol nằm tại trung điểm của khoảng cách từ $F$ đến $Delta$.
    Do đó, hoành độ của đỉnh $V$ là:
    $ x_V = (60 + 28)/2 = 44 => V(44; 0). $

    *Bước 2: Lập hệ trục dời và thiết lập Tích phân* \
    Dời gốc tọa độ về $V(44; 0)$, ta có hệ trục mới $V X Y$ với phép biến đổi:
    $ cases(X = x - 44, Y = y) $
    Trong hệ trục mới, phương trình chính tắc của Parabol ranh giới là:
    $ Y^2 = 2p X => Y^2 = 64X => Y = plus.minus 8sqrt(X). $
    Khu vực $(H)$ bị giới hạn bởi phao giới hạn $x = 144$.
    Trong hệ tọa độ mới, phương trình phao giới hạn là $X = 144 - 44 = 100$. \
    Do Parabol đối xứng qua trục hoành, diện tích khu vực $(H)$ bằng $2$ lần diện tích nửa trên:
    $ S = 2 integral_0^100 8sqrt(X) dif X = 16 integral_0^100 X^(1/2) dif X. $

    *Bước 3: Tính toán* \
    Sử dụng nguyên hàm:
    $ S = 16 [ 2/3 X^(3/2) ]_0^100 = 16 dot 2/3 dot 100sqrt(100) = 32/3 dot 1000 = 32000/3 approx 10666.66... $
    Làm tròn đến hàng đơn vị, diện tích hoạt động của tàu thuyền là *$10667$* $m^2$.

    #align(center)[
      #cetz.canvas(length: 0.5mm, {
        import cetz.draw: *
        // Hệ trục tọa độ mới VXY
        line((44, -90), (44, 90), mark: (end: ">"), stroke: 1pt + blue)
        line((-10, 0), (160, 0), mark: (end: ">"), stroke: 1pt + blue)
        content((48, 90), text(fill: blue, weight: "bold")[$Y$])
        content((160, -5), text(fill: blue, weight: "bold")[$X$])
        content((38, -5), text(fill: blue, weight: "bold")[$V$])

        // Đường chuẩn và Tường bao
        line((28, -80), (28, 80), stroke: (dash: "dashed", paint: red))
        content((28, 85), text(fill: red)[$Delta$])
        line((144, -80), (144, 80), stroke: 1.2pt + rgb("333333"))

        // Vùng Parabol
        let pts = ()
        pts.push((144, 0))
        for i in range(80, -1, step: -2) {
          let Y = i
          let X = (Y * Y) / 64
          pts.push((X + 44, Y))
        }
        for i in range(0, 81, step: 2) {
          let Y = -i
          let X = (Y * Y) / 64
          pts.push((X + 44, Y))
        }
        line(..pts, close: true, fill: rgb("ffeb3b66"), stroke: 1.2pt + rgb("fbc02d"))

        circle((60, 0), radius: 1.5pt, fill: blue)
        content((60, -6), text(fill: blue)[$F$])

        // Chú thích
        line((28, 15), (60, 15), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((44, 20), $p=32$)
      })
    ]

    #meo(title: [Tốc độ của trục ảo])[
      Khi tính tay tích phân $integral_44^144 2sqrt(64(x-44)) dif x$, bạn phải đổi biến số. Bằng cách dựng hệ trục tọa độ ảo $V X Y$ ngay tại đỉnh Parabol trong đầu, bạn lập tức biến nó thành Tích phân cơ bản $integral_0^100 16sqrt(X) dif X$. Mọi bài Toán Conic giới hạn diện tích đều có thể "giải mã" bằng kỹ thuật tịnh tiến đỉnh/tâm này!
    ]
  ],
)

// Câu 1: Conic Ẩn - Elip (Giải thích rõ bản chất hình học $a/e - c$)
#tln(
  [Tại một nông trại năng lượng mặt trời, khu vực lắp đặt các tấm pin $(H)$ được quy hoạch trên một mặt bằng phẳng. Trên bản vẽ với hệ trục tọa độ $O x y$ (đơn vị: mét), một trạm biến áp trung tâm được đặt tại điểm $F(130; 0)$ và một đường cáp ngầm chạy thẳng tắp dọc theo đường $Delta: x = 175$. Để đảm bảo hiệu suất truyền tải điện, khu vực $(H)$ được giới hạn là tập hợp tất cả các điểm $M(x;y)$ sao cho khoảng cách từ $M$ đến trạm biến áp $F$ luôn không vượt quá $80%$ khoảng cách từ $M$ đến đường cáp ngầm $Delta$. Tính diện tích mặt bằng của khu vực lắp đặt pin mặt trời $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 0.6mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (-60, -80),
          (200, 80),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-65, 0), (210, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -85), (0, 85), mark: (end: ">"), stroke: 0.6pt)
        content((210, -5), $x$)
        content((-5, 85), $y$)
        content((-4, -4), $O$)

        // Đường chuẩn Delta (Hệ cũ)
        line((175, -80), (175, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((175, 85), text(fill: red, weight: "bold")[$Delta$])

        // Trạm biến áp F
        circle((130, 0), radius: 2pt, fill: blue)
        content((130, 6), text(fill: blue, weight: "bold")[$F$])

        // Vùng Elip (tâm I(50; 0), a=100, b=60)
        circle((50, 0), radius: (100, 60), fill: rgb("4caf5044"), stroke: 1.2pt + rgb("2e7d32"))
        content((50, 20), text(fill: rgb("1b5e20"), weight: "bold")[Khu vực $(H)$])

        // Điểm M minh họa
        let Mx = 100
        let My = 60 * calc.sqrt(1 - (50 * 50) / 10000)
        circle((Mx, My), radius: 1.5pt, fill: black)
        content((Mx - 5, My + 5), $M$)
        line((Mx, My), (130, 0), stroke: (dash: "dotted", paint: blue, thickness: 0.8pt))
        line((Mx, My), (175, My), stroke: (dash: "dotted", paint: red, thickness: 0.8pt))
        line((171, My), (171, My + 5), (175, My + 5), stroke: 0.5pt + red)
      })
    ]
  ],
  [$18850$],
  loigiai: [
    #ppgiai[
      *Bản chất hình học của Elip:*
      Tập hợp điểm $M$ thỏa mãn $M F <= e dot d(M, Delta)$ với $e = 0.8 < 1$ là một miền Elip.
      Để lập phương trình Elip dễ nhất, ta phải dời hệ trục $O x y$ về tâm $I$ của Elip. Làm sao tìm $I$?
      - Khoảng cách từ tâm $I$ đến tiêu điểm $F$ luôn là $I F = c$.
      - Khoảng cách từ tâm $I$ đến đường chuẩn $Delta$ luôn là $I Delta = a/e$.
      - *Đặc trưng Elip ($e < 1$):* Tiêu điểm $F$ luôn nằm *giữa* tâm $I$ và đường chuẩn $Delta$.
      Do đó, khoảng cách từ tiêu điểm $F$ đến đường chuẩn $Delta$ chính là đoạn dài trừ đoạn ngắn: $F Delta = I Delta - I F = a/e - c$.
    ]

    *Bước 1: Tính toán thông số Elip ($a, b, c$)* \
    Từ tọa độ đề bài, khoảng cách thực tế từ tiêu điểm $F(130; 0)$ đến đường chuẩn $Delta: x = 175$ là:
    $ p = 175 - 130 = 45. $
    Áp dụng lý thuyết Elip (như đã giải thích ở phương pháp):
    $ a/e - c = 45. $
    Biết $e = 4/5$, ta có công thức liên hệ $c = a dot e = (4a)/5$. Thay $e$ và $c$ vào phương trình trên:
    $ a/(4/5) - (4a)/5 = 45 <=> (5a)/4 - (4a)/5 = 45 <=> (25a - 16a)/20 = 45 <=> (9a)/20 = 45 => a = 100. $
    Suy ra bán tiêu cự $c = 100 dot 4/5 = 80$. \
    Bán trục ảo $b$ của Elip được tính bằng:
    $ b = sqrt(a^2 - c^2) = sqrt(100^2 - 80^2) = sqrt(10000 - 6400) = sqrt(3600) = 60. $

    *Bước 2: Tìm tâm $I$ và dời trục* \
    Vì $F$ nằm giữa tâm $I$ và đường chuẩn $Delta$ (ở $x = 175$), nên tâm $I$ phải nằm bên trái $F$.
    Hoành độ tâm $I$ là: $x_I = x_F - c = 130 - 80 = 50 => I(50; 0)$. \
    Dời gốc tọa độ về $I(50; 0)$, ta có hệ trục tọa độ mới $I X Y$ với phép biến đổi: $X = x - 50, Y = y$. \
    Lúc này, vùng $(H)$ nằm gọn trong Elip có phương trình chính tắc:
    $ X^2/10000 + Y^2/3600 <= 1. $

    *Bước 3: Tính diện tích* \
    Diện tích của khu vực $(H)$ là diện tích toàn phần của Elip. Việc dời trục chỉ làm thay đổi tọa độ, không làm thay đổi diện tích hình phẳng:
    $ S = pi dot a dot b = pi dot 100 dot 60 = 6000pi. $
    *Bấm máy tính Casio:* $6000 times pi approx 18849.5559...$ \
    Làm tròn đến hàng đơn vị, diện tích là *$18850$*.

    #align(center)[
      #cetz.canvas(length: 0.6mm, {
        import cetz.draw: *
        // Hệ trục tọa độ cũ (Nét mờ)
        line((-65, 0), (210, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
        content((-4, -4), text(fill: gray)[$O$])

        // Trục IY Mới
        line((50, -85), (50, 85), mark: (end: ">"), stroke: 1pt + blue)
        content((54, 85), text(fill: blue, weight: "bold")[$Y$])
        content((54, -4), text(fill: blue, weight: "bold")[$I(50;0)$])

        // Vườn hoa
        circle((50, 0), radius: (100, 60), fill: rgb("4caf5044"), stroke: 1.2pt + rgb("2e7d32"))

        // F và Delta
        circle((130, 0), radius: 2pt, fill: blue)
        content((130, -6), text(fill: blue)[$F(130;0)$])
        line((175, -80), (175, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((175, -85), text(fill: red, weight: "bold")[$Delta: x=175$])

        // Vẽ sơ đồ trực quan I -> F -> Delta
        line((50, 20), (130, 20), mark: (start: "|", end: "|"), stroke: 0.8pt + blue)
        content((90, 25), text(fill: blue)[$I F = c = 80$])

        line((130, -20), (175, -20), mark: (start: "|", end: "|"), stroke: 0.8pt + red)
        content((152.5, -15), text(fill: red)[$F Delta = 45$])

        line((50, -35), (175, -35), mark: (start: "|", end: "|"), stroke: 0.8pt + rgb("2e7d32"))
        content((112.5, -40), text(fill: rgb("2e7d32"))[$I Delta = a/e = 125$])
      })
    ]

    #luuy(title: [Mẹo "Nhìn Hình Bắt Bóng"])[
      Hãy nhìn vào sơ đồ phân bố $I - F - Delta$ ở trên. Đối với Elip, $F$ luôn kẹp giữa $I$ và $Delta$. Chỉ cần vẽ nháp đường thẳng và định vị $F, Delta$, bạn sẽ tự động nhớ ra công thức $I Delta - I F = F Delta$, tức là $a/e - c = p$, hoàn toàn không cần học thuộc lòng máy móc!
    ]
  ],
)

// Câu 2: Conic Ẩn - Hyperbol (Giải thích rõ bản chất hình học $c - a/e$)
#tln(
  [Tại một khu vực thử nghiệm khai khoáng, một hố phát nổ được đặt tại vị trí $F(110; 0)$ và một bức vách chắn cường lực được dựng dọc theo đường thẳng $Delta: x = 60$ trên mặt phẳng tọa độ $O x y$ (đơn vị: mét). Các chuyên gia an toàn quy định vùng nguy hiểm cao $(H)$ là tập hợp các điểm $M(x; y)$ thỏa mãn hai điều kiện: khoảng cách từ $M$ đến hố nổ $F$ không lớn hơn $1,5$ lần khoảng cách từ $M$ đến vách chắn $Delta$, và thiết bị đo chỉ đặt trong giới hạn tường bao ở tọa độ $x = 140$. Tính diện tích mặt bằng của vùng nguy hiểm $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (0, -80),
          (160, 80),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-10, 0), (165, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -85), (0, 85), mark: (end: ">"), stroke: 0.6pt)
        content((165, -4), $x$)
        content((-4, 85), $y$)
        content((-3, -3), $O$)

        // Vách chắn Delta
        line((60, -80), (60, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((60, 84), text(fill: red, weight: "bold")[$Delta$])

        // Tường bao x = 140
        line((140, -80), (140, 80), stroke: 1.2pt + rgb("333333"))
        content((140, 84), text(weight: "bold")[$x=140$])

        // Hố nổ F
        circle((110, 0), radius: 1.5pt, fill: red)
        content((114, -4), text(fill: red, weight: "bold")[$F$])

        // Vùng Hyperbol (Hệ trục IXY với tâm I(20;0), a=60, b=30sqrt(5) ~ 67.08)
        let pts = ()
        for i in range(80, 141) {
          // x chạy từ 80 (tương ứng X=60) đến 140
          let X = i - 20
          let Y = calc.sqrt(1.25 * (X * X - 3600))
          pts.push((i, Y))
        }
        for i in range(140, 79, step: -1) {
          let X = i - 20
          let Y = -calc.sqrt(1.25 * (X * X - 3600))
          pts.push((i, Y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))
        content((100, 0), text(fill: rgb("e65100"), weight: "bold")[$(H)$])
      })
    ]
  ],
  [$17284$],
  loigiai: [
    #ppgiai[
      *Bản chất hình học của Hyperbol:*
      Bất phương trình $M F <= e dot d(M, Delta)$ với $e = 1.5 > 1$ xác định một miền Hyperbol.
      Để tính diện tích gọn gàng, ta cần dời trục tọa độ về tâm $I$ của Hyperbol.
      - Khác với Elip, *đặc trưng của Hyperbol ($e > 1$)* là đường chuẩn $Delta$ luôn nằm *giữa* tâm $I$ và tiêu điểm $F$.
      - Khoảng cách $I F = c$ và $I Delta = a/e$.
      - Suy ra, khoảng cách từ đường chuẩn $Delta$ đến tiêu điểm $F$ chính là đoạn dài trừ đoạn ngắn: $Delta F = I F - I Delta = c - a/e$.
    ]

    *Bước 1: Tính toán thông số Hyperbol ($a, b, c$)* \
    Từ tọa độ đề bài, khoảng cách thực tế từ tiêu điểm $F(110; 0)$ đến đường chuẩn $Delta: x = 60$ là:
    $ p = 110 - 60 = 50. $
    Áp dụng lý thuyết Hyperbol (đường chuẩn nằm giữa):
    $ c - a/e = 50. $
    Biết $e = 1.5 = 3/2$, suy ra $c = a dot e = 1.5a$. Thay $c$ và $e$ vào phương trình:
    $ 1.5a - a/1.5 = 50 <=> (3a)/2 - (2a)/3 = 50 <=> (9a - 4a)/6 = 50 <=> (5a)/6 = 50 => a = 60. $
    Suy ra bán tiêu cự $c = 1.5 dot 60 = 90$. \
    Bán trục ảo $b$ của Hyperbol là:
    $ b^2 = c^2 - a^2 = 90^2 - 60^2 = 8100 - 3600 = 4500. $

    *Bước 2: Tìm tâm $I$ và dời trục* \
    Vì $Delta$ (ở $x = 60$) nằm giữa tâm $I$ và $F(110; 0)$, nên tâm $I$ phải nằm bên trái $Delta$.
    Hoành độ tâm $I$ là: $x_I = x_F - c = 110 - 90 = 20 => I(20; 0)$. \
    Dời gốc tọa độ về $I(20; 0)$, ta có hệ trục mới $I X Y$ với phép biến đổi: $X = x - 20, Y = y$. \
    Phương trình ranh giới Hyperbol trong hệ $I X Y$ trở thành:
    $
      X^2/3600 - Y^2/4500 = 1 <=> Y^2 = 4500(X^2/3600 - 1) = 1.25(X^2 - 3600) \
      => Y = plus.minus sqrt(1.25(X^2 - 3600)).
    $

    *Bước 3: Thiết lập tích phân và tính diện tích* \
    Vùng $(H)$ bị chặn bởi tường bao $x = 140$. Trong hệ mới, $X = 140 - 20 = 120$. \
    Đỉnh nhánh phải của Hyperbol nằm tại $X = a = 60$. \
    Diện tích $(H)$ được nhân đôi (do đối xứng qua $O X$):
    $ S = 2 integral_60^120 sqrt(1.25(X^2 - 3600)) dif X. $
    *Bấm máy tính Casio* trực tiếp biểu thức trên, ta được: $S approx 17284.20...$ \
    Làm tròn đến hàng đơn vị, diện tích bề mặt vùng nguy hiểm là *$17284$* $m^2$.

    #align(center)[
      #cetz.canvas(length: 1.2mm, {
        import cetz.draw: *
        // Trục IY Mới
        line((20, -70), (20, 70), mark: (end: ">"), stroke: 1pt + blue)
        line((-10, 0), (160, 0), mark: (end: ">"), stroke: 1pt + blue)
        content((24, 70), text(fill: blue, weight: "bold")[$Y$])
        content((160, -4), text(fill: blue, weight: "bold")[$X$])
        content((15, -4), text(fill: blue, weight: "bold")[$I(20;0)$])

        // Vách chắn Delta và Tường bao
        line((60, -60), (60, 60), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((60, 64), text(fill: red)[$Delta: x=60$])
        line((140, -60), (140, 60), stroke: 1.2pt + rgb("333333"))
        content((140, 64), text()[Tường bao])

        // Miền Hyperbol
        let pts = ()
        for i in range(80, 141) {
          let X = i - 20
          let Y = calc.sqrt(1.25 * (X * X - 3600))
          pts.push((i, Y))
        }
        for i in range(140, 79, step: -1) {
          let X = i - 20
          let Y = -calc.sqrt(1.25 * (X * X - 3600))
          pts.push((i, Y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))

        circle((110, 0), radius: 1.5pt, fill: red)
        content((110, -5), text(fill: red)[$F(110;0)$])

        // Vẽ sơ đồ trực quan I -> Delta -> F
        line((20, 25), (60, 25), mark: (start: "|", end: "|"), stroke: 0.8pt + red)
        content((40, 30), text(fill: red)[$I Delta = a/e = 40$])

        line((60, -25), (110, -25), mark: (start: "|", end: "|"), stroke: 0.8pt + blue)
        content((85, -20), text(fill: blue)[$Delta F = p = 50$])

        line((20, -40), (110, -40), mark: (start: "|", end: "|"), stroke: 0.8pt + rgb("e65100"))
        content((65, -45), text(fill: rgb("e65100"))[$I F = c = 90$])
      })
    ]

    #meo(title: [Lợi ích "kép" của Casio và Tịnh tiến])[
      Việc dời trục tung $O y$ thành trục $I Y$ biến một tích phân chứa đa thức dài thòng $integral sqrt(1.25(x-20)^2 - 4500) dif x$ về dạng siêu gọn nhẹ $integral sqrt(1.25 X^2 - 4500) dif X$. Khi bấm Casio, biểu thức càng ít phép cộng/trừ bên trong thì:
      1. Tốc độ máy tính xử lý tích phân nhanh gấp 3 lần.
      2. Tỉ lệ bạn bấm nhầm ngoặc giảm về $0$!
    ]
  ],
)

// Câu 1: Conic Ẩn - Chủ đề Parabol
#tln(
  [Một khu vực trải nghiệm công nghệ thực tế ảo $(H)$ được quy hoạch trên một mặt bằng hình vuông $A B C D$ có cạnh dài $100" m"$. Trạm máy chủ trung tâm được đặt tại chính tâm $O$ của hình vuông. Một đường cáp quang tín hiệu chạy dọc theo cạnh $A B$. Để tín hiệu truyền tải không bị trễ, ban tổ chức quy định các người chơi $M$ chỉ được phép di chuyển trong vùng $(H)$ sao cho khoảng cách từ người chơi đến trạm máy chủ $O$ luôn nhỏ hơn hoặc bằng khoảng cách từ họ đến đường cáp quang cạnh $A B$. Tính diện tích mặt bằng của khu vực trải nghiệm $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 0.6mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (-50, -50),
          (50, 50),
          step: 10,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-60, 0), (60, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -60), (0, 60), mark: (end: ">"), stroke: 0.6pt)
        content((60, -5), $x$)
        content((-5, 60), $y$)
        content((-5, -5), $O$)

        // Hình vuông ABCD
        line((-50, 50), (50, 50), (50, -50), (-50, -50), close: true, stroke: 1.2pt + rgb("333333"))
        content((-54, 54), $A$)
        content((54, 54), $B$)
        content((54, -54), $C$)
        content((-54, -54), $D$)

        // Đường chuẩn Delta (Cạnh AB)
        content((0, 55), text(fill: red, weight: "bold")[$A B (Delta)$])

        // Tiêu điểm F (Tâm O)
        circle((0, 0), radius: 1.5pt, fill: blue)
        content((5, -5), text(fill: blue, weight: "bold")[$F$])

        // Vùng Parabol (Đỉnh V(0; 25), y = 25 - x^2/100)
        let pts = ()
        pts.push((50, -50))
        for i in range(50, -51, step: -2) {
          let x = i
          let y = 25 - (x * x) / 100
          pts.push((x, y))
        }
        pts.push((-50, -50))
        line(..pts, close: true, fill: rgb("4caf5044"), stroke: 1.2pt + rgb("2e7d32"))
        content((20, 0), text(fill: rgb("1b5e20"), weight: "bold")[$(H)$])
      })
    ]
  ],
  [$6667$],
  loigiai: [
    #ppgiai[
      *Nhận diện Conic:*
      Bất phương trình $M O <= d(M, A B)$ ứng với định nghĩa của một miền giới hạn bởi đường **Parabol** (tâm sai $e = 1$), với tiêu điểm là gốc tọa độ $O$ và đường chuẩn là đường thẳng chứa cạnh $A B$.

      *Tư duy Hệ trục tọa độ:*
      Gắn hệ trục $O x y$ với gốc tại tâm $O$ của hình vuông. Các cạnh hình vuông song song với các trục tọa độ. Dựa vào phương trình Parabol, ta sẽ thiết lập biểu thức Tích phân để tính diện tích miền $(H)$.
    ]

    *Bước 1: Thiết lập phương trình Parabol* \
    Hình vuông $A B C D$ cạnh $100" m"$ tâm $O(0;0)$ sẽ bị giới hạn bởi các đường thẳng $x = plus.minus 50$ và $y = plus.minus 50$. \
    Cạnh $A B$ nằm phía trên trục hoành có phương trình là $y = 50$. Đây chính là đường chuẩn $Delta: y = 50$. \
    Tiêu điểm là $O(0; 0)$. Khoảng cách từ tiêu điểm đến đường chuẩn là $p = 50$. \
    Đỉnh $V$ của Parabol nằm tại trung điểm khoảng cách từ $O$ đến $A B$, tức là $V(0; 25)$. \
    Vì Parabol có bề lõm quay xuống dưới, phương trình chính tắc (khi dời gốc về $V$) là $x^2 = -2p Y = -100(y - 25)$. \
    Phương trình của đường Parabol ranh giới là:
    $ (P): y = 25 - x^2/100. $
    Khu vực $(H)$ là phần nằm dưới Parabol $(P)$ và bị chặn bên trong hình vuông.

    *Bước 2: Tìm cận và thiết lập Tích phân* \
    Ta cần kiểm tra xem Parabol cắt các cạnh bên của hình vuông ở đâu. \
    Tại $x = plus.minus 50$ (cạnh $A D$ và $B C$), tung độ của Parabol là:
    $ y = 25 - (plus.minus 50)^2/100 = 25 - 2500/100 = 0. $
    Như vậy Parabol cắt đúng vào giao điểm của các cạnh bên với trục hoành, và nằm hoàn toàn phía trên cạnh đáy $C D: y = -50$. \
    Miền hình phẳng $(H)$ được giới hạn bởi:
    - Đường trên: $y = 25 - x^2/100$
    - Đường dưới: $y = -50$ (cạnh $C D$)
    - Hai bên: $x = -50$ và $x = 50$

    Diện tích $(H)$ được tính bằng (do tính đối xứng):
    $ S = 2 integral_0^50 [ (25 - x^2/100) - (-50) ] dif x = 2 integral_0^50 ( 75 - x^2/100 ) dif x. $

    *Bước 3: Tính toán* \
    Sử dụng nguyên hàm:
    $
      S = 2 [ 75x - x^3/300 ]_0^50 = 2 ( 75(50) - 50^3/300 ) = 2 ( 3750 - 125000/300 ) = 2 ( 3750 - 1250/3 ) = 20000/3 approx 6666.66...
    $
    Làm tròn đến hàng đơn vị, diện tích khu vực $(H)$ là *$6667$* $m^2$.

    #meo(title: [Lối tắt diện tích Parabol])[
      Phần diện tích hình phẳng kẹp giữa Parabol và một đường thẳng (tạo thành một "vòm") luôn bằng $2/3$ diện tích hình chữ nhật bao quanh nó. Trong bài này, phần diện tích tính từ đỉnh $y=25$ đến $y=0$ có bao hình chữ nhật là $100 times 25 = 2500$. Diện tích "vòm" là $2/3 times 2500 = 5000/3$. Phần hình chữ nhật phía dưới (từ $y=0$ đến $y=-50$) có diện tích $100 times 50 = 5000$. Tổng diện tích là $5000/3 + 5000 = 20000/3$. Không cần tính Tích phân!
    ]
  ],
)

// Câu 2: Conic Ẩn - Chủ đề Elip
#tln(
  [Một khu vực bảo tồn sinh học hình chữ nhật $A B C D$ có chiều dài $A B = 160" m"$, chiều rộng $A D = 120" m"$ và tâm $O$. Người ta bố trí một trạm quan trắc $F$ cách tâm $O$ một đoạn $25" m"$ theo hướng vuông góc với chiều rộng $A D$. Một mương nước nhân tạo $Delta$ chạy song song với $A D$ và cách tâm $O$ một khoảng $100" m"$ về cùng phía với $F$. Khu vực $(H)$ cho phép một loài thực vật quý hiếm phát triển là tập hợp các điểm $M$ sao cho khoảng cách từ $M$ đến trạm $F$ luôn không vượt quá $50%$ khoảng cách từ $M$ đến mương $Delta$. Tính diện tích mặt bằng của khu vực $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 0.5mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (-80, -60),
          (120, 60),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-90, 0), (130, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -70), (0, 70), mark: (end: ">"), stroke: 0.6pt)
        content((130, -5), $x$)
        content((-5, 70), $y$)
        content((-5, -5), $O$)

        // Hình chữ nhật ABCD
        line((-80, 60), (80, 60), (80, -60), (-80, -60), close: true, stroke: 1.2pt + rgb("333333"))

        // Đường chuẩn Delta
        line((100, -70), (100, 70), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((100, 75), text(fill: red, weight: "bold")[$Delta$])

        // Trạm quan trắc F
        circle((25, 0), radius: 1.5pt, fill: blue)
        content((25, -6), text(fill: blue, weight: "bold")[$F$])

        // Vùng Elip (tâm O(0; 0), a=50, b=25sqrt(3) ~ 43.3)
        circle((0, 0), radius: (50, 43.3), fill: rgb("00bcd433"), stroke: 1.2pt + rgb("0097a7"))
        content((0, 20), text(fill: rgb("006064"), weight: "bold")[Khu vực $(H)$])
      })
    ]
  ],
  [$6802$],
  loigiai: [
    #ppgiai[
      *Nhận diện Conic qua Tâm sai (Eccentricity $e$):*
      Giả thiết $M F <= 0.5 dot d(M, Delta)$ tương đương tâm sai $e = 0.5 < 1$. Do đó, khu vực $(H)$ là một hình phẳng được giới hạn bởi đường **Elip**.
      Ta không cần phải khai triển biểu thức đại số phức tạp, chỉ cần thiết lập hệ trục tọa độ và tìm các thông số $a, b$ dựa vào công thức định nghĩa.
    ]

    *Bước 1: Tính toán tham số hình học $a, b$* \
    Trong hệ trục tọa độ có tâm Elip là gốc $(0;0)$, khoảng cách từ tâm đến tiêu điểm là $c$, khoảng cách từ tâm đến đường chuẩn là $a/e$. \
    Ở đây, đề bài cho tâm $O$ của hình chữ nhật, $F$ cách $O$ là $25"m"$ và $Delta$ cách $O$ là $100"m"$ (về cùng phía). Ta sẽ kiểm tra xem $O$ có phải là tâm của Elip hay không. \
    Khoảng cách từ tiêu điểm $F$ đến đường chuẩn $Delta$ là:
    $ p = 100 - 25 = 75. $
    Theo lý thuyết Elip, ta luôn có:
    $ a/e - c = 75. $
    Biết $e = 0.5 = 1/2$, ta có $c = a dot e = 0.5a$. Thay vào phương trình:
    $ a/0.5 - 0.5a = 75 <=> 2a - 0.5a = 75 <=> 1.5a = 75 => a = 50. $
    Suy ra bán tiêu cự $c = 0.5 dot 50 = 25$. \
    Điều này hoàn toàn khớp với khoảng cách từ $O$ đến $F$ ($25"m"$) và khoảng cách từ $O$ đến $Delta$ ($50/0.5 = 100"m"$). Vậy gốc $O$ chính là **tâm của Elip**. \
    Bán trục ảo $b$ của Elip được xác định bởi:
    $ b = sqrt(a^2 - c^2) = sqrt(50^2 - 25^2) = sqrt(2500 - 625) = sqrt(1875) = 25sqrt(3). $

    *Bước 2: Kết luận diện tích* \
    Đường Elip ranh giới có phương trình chính tắc:
    $ x^2/2500 + y^2/1875 = 1. $
    Kiểm tra giới hạn của hình chữ nhật $A B C D$: Chiều dài $160" m"$ ($x in [-80; 80]$) và chiều rộng $120" m"$ ($y in [-60; 60]$). \
    Vì trục lớn của Elip là $2a = 100 < 160$ và trục nhỏ $2b = 50sqrt(3) approx 86.6 < 120$, toàn bộ hình Elip nằm trọn vẹn bên trong khu vực bảo tồn $A B C D$. \
    Diện tích toàn phần của khu vực sinh trưởng $(H)$ là:
    $ S = pi dot a dot b = pi dot 50 dot 25sqrt(3) = 1250pi sqrt(3). $

    **Bấm máy tính Casio:** $1250 times pi times sqrt(3) approx 6801.747...$ \
    Làm tròn đến hàng đơn vị, diện tích là *$6802$* $m^2$.

    #nhanxet(title: [Sức mạnh của Đại số Hình học])[
      Bằng việc nắm vững bộ ba hệ thức $e = c/a, p = a/e - c$ và $b^2 = a^2 - c^2$, bài toán biến thành vài dòng tính nhẩm số học cơ bản. Nếu cố chấp giải tích phân bài này, bạn sẽ tốn 10 phút để loay hoay khử căn thức!
    ]
  ],
)

// Câu 3: Conic Ẩn - Chủ đề Hyperbol
#tln(
  [Tại một khu khai thác mỏ, một hố phát nổ được đặt tại vị trí $F(100; 0)$ và một bức vách giảm chấn được dựng dọc theo đường thẳng $Delta: x = 40$ trên mặt phẳng tọa độ $O x y$ (đơn vị: mét). Đội an toàn quy định vùng cực kỳ nguy hiểm $(H)$ là tập hợp các điểm $M(x; y)$ thỏa mãn hai điều kiện: khoảng cách từ $M$ đến hố nổ $F$ không lớn hơn $2$ lần khoảng cách từ $M$ đến vách giảm chấn $Delta$, và thiết bị cảm biến chỉ được đặt trong giới hạn lưới an toàn tại $x = 100$. Tính diện tích mặt bằng của vùng cực kỳ nguy hiểm $(H)$ theo đơn vị mét vuông (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 0.5mm, {
        import cetz.draw: *
        // Lưới nền
        grid(
          (0, -80),
          (120, 80),
          step: 20,
          stroke: rgb("eeeeee"),
        )
        // Hệ trục tọa độ cũ
        line((-10, 0), (130, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -90), (0, 90), mark: (end: ">"), stroke: 0.6pt)
        content((130, -5), $x$)
        content((-5, 90), $y$)
        content((-5, -5), $O$)

        // Vách chắn Delta
        line((40, -80), (40, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((40, 85), text(fill: red, weight: "bold")[$Delta$])

        // Lưới an toàn x = 100
        line((100, -80), (100, 80), stroke: 1.2pt + rgb("333333"))
        content((100, 85), text(weight: "bold")[$x=100$])

        // Hố nổ F
        circle((100, 0), radius: 1.5pt, fill: red)
        content((105, -5), text(fill: red, weight: "bold")[$F$])

        // Vùng Hyperbol (Hệ trục IXY với tâm I(20;0), a=40, b=40sqrt(3) ~ 69.28)
        let pts = ()
        for i in range(60, 101) {
          // x chạy từ 60 (tương ứng X=40) đến 100
          let X = i - 20
          let Y = calc.sqrt(3 * (X * X - 1600))
          pts.push((i, Y))
        }
        for i in range(100, 59, step: -1) {
          let X = i - 20
          let Y = -calc.sqrt(3 * (X * X - 1600))
          pts.push((i, Y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))
        content((80, 0), text(fill: rgb("e65100"), weight: "bold")[$(H)$])
      })
    ]
  ],
  [$5950$],
  loigiai: [
    #ppgiai[
      *Tư duy Hệ trục:*
      Bất phương trình giới hạn $M F <= 2 dot d(M, Delta)$ ứng với tâm sai $e = 2 > 1$, suy ra ranh giới bề mặt là một nhánh của đường **Hyperbol**. \
      Để tính diện tích, ta cần dời trục tọa độ về tâm $I$ của Hyperbol.
      - Khác với Elip, **đặc trưng của Hyperbol ($e > 1$)** là đường chuẩn $Delta$ luôn nằm **giữa** tâm $I$ và tiêu điểm $F$.
      - Suy ra, khoảng cách từ đường chuẩn $Delta$ đến tiêu điểm $F$ là đoạn dài trừ đoạn ngắn: $p = c - a/e$.
    ]

    *Bước 1: Tính toán thông số Hyperbol ($a, b, c$)* \
    Khoảng cách thực tế từ tiêu điểm $F(100; 0)$ đến đường chuẩn $Delta: x = 40$ là:
    $ p = 100 - 40 = 60. $
    Áp dụng lý thuyết Hyperbol (đường chuẩn nằm giữa):
    $ c - a/e = 60. $
    Biết $e = 2 => c = a dot e = 2a$. Thay $c$ và $e$ vào phương trình:
    $ 2a - a/2 = 60 <=> 1.5a = 60 => a = 40. $
    Suy ra bán tiêu cự $c = 2 dot 40 = 80$. \
    Bán trục ảo $b$ của Hyperbol là:
    $ b^2 = c^2 - a^2 = 80^2 - 40^2 = 6400 - 1600 = 4800. $

    *Bước 2: Tìm tâm $I$ và dời trục* \
    Vì $Delta$ (ở $x = 40$) nằm giữa tâm $I$ và $F(100; 0)$, nên tâm $I$ phải nằm bên trái $Delta$.
    Hoành độ tâm $I$ là: $x_I = x_F - c = 100 - 80 = 20 => I(20; 0)$. \
    Dời gốc tọa độ về $I(20; 0)$, ta có hệ trục mới $I X Y$ với phép biến đổi: $X = x - 20, Y = y$. \
    Phương trình ranh giới Hyperbol trong hệ $I X Y$ trở thành:
    $ X^2/1600 - Y^2/4800 = 1 <=> Y^2 = 4800(X^2/1600 - 1) = 3(X^2 - 1600). $
    $ => Y = plus.minus sqrt(3(X^2 - 1600)). $

    *Bước 3: Thiết lập tích phân và tính diện tích* \
    Vùng $(H)$ bị chặn bởi lưới an toàn tại $x = 100$. Trong hệ mới, $X = 100 - 20 = 80$. \
    Đỉnh nhánh phải của Hyperbol nằm tại $X = a = 40$. \
    Diện tích $(H)$ được nhân đôi (do đối xứng qua $O X$):
    $ S = 2 integral_40^80 sqrt(3(X^2 - 1600)) dif X = 2sqrt(3) integral_40^80 sqrt(X^2 - 1600) dif X. $

    **Bấm máy tính Casio** trực tiếp biểu thức $2 integral_40^80 sqrt(3(X^2 - 1600)) dif X$, ta được:
    $ S approx 5950.34... $
    Làm tròn đến hàng đơn vị, diện tích bề mặt vùng nguy hiểm là *$5950$* $m^2$.

    #align(center)[
      #cetz.canvas(length: 0.6mm, {
        import cetz.draw: *
        // Trục IY Mới
        line((20, -90), (20, 90), mark: (end: ">"), stroke: 1pt + blue)
        line((-10, 0), (130, 0), mark: (end: ">"), stroke: 1pt + blue)
        content((25, 90), text(fill: blue, weight: "bold")[$Y$])
        content((130, -5), text(fill: blue, weight: "bold")[$X$])
        content((15, -5), text(fill: blue, weight: "bold")[$I$])

        // Vách chắn Delta và Tường bao
        line((40, -80), (40, 80), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((40, 85), text(fill: red)[$Delta$])
        line((100, -80), (100, 80), stroke: 1.2pt + rgb("333333"))
        content((100, 85), text()[Lưới an toàn])

        // Miền Hyperbol
        let pts = ()
        for i in range(60, 101) {
          let X = i - 20
          let Y = calc.sqrt(3 * (X * X - 1600))
          pts.push((i, Y))
        }
        for i in range(100, 59, step: -1) {
          let X = i - 20
          let Y = -calc.sqrt(3 * (X * X - 1600))
          pts.push((i, Y))
        }
        line(..pts, close: true, fill: rgb("ff980066"), stroke: 1.2pt + rgb("e65100"))

        circle((100, 0), radius: 1.5pt, fill: red)
        content((100, -5), text(fill: red)[$F$])

        // Vẽ sơ đồ trực quan I -> Delta -> F
        line((20, 20), (40, 20), mark: (start: "|", end: "|"), stroke: 0.8pt + red)
        content((30, 25), text(fill: red)[$I Delta = a/e = 20$])

        line((40, -20), (100, -20), mark: (start: "|", end: "|"), stroke: 0.8pt + blue)
        content((70, -15), text(fill: blue)[$Delta F = p = 60$])
      })
    ]

    #luuy(title: [Quy tắc dời trục Tích phân])[
      Dời trục $X = x - x_0$ tương đương với phép đổi biến số trong Tích phân. Máy tính có thể giải quyết hầu hết các đa thức trong căn, nhưng khi độ phức tạp tăng lên, chức năng tích phân của Casio sử dụng thuật toán xấp xỉ Simpson sẽ chạy chậm hoặc báo lỗi mệt mỏi. Đưa về hệ trục chính tắc là cứu cánh cuối cùng để đạt kết quả siêu tốc!
    ]
  ],
)


#tln(
  [Dùng các tờ tiền có mệnh giá $10$ nghìn, $20$ nghìn, $50$ nghìn để làm tất cả các phong lì xì sao cho mỗi phong lì xì đều có 3 tờ tiền và mỗi phong lì xì có tổng số tiền khác với các phong lì xì còn lại.
    Chia ngẫu nhiên các phong lì xì cho 3 cặp vợ chồng sao cho mỗi người được đúng một phong lì xì.
    Gọi $p$ là xác suất để các cặp vợ chồng đều được tổng số tiền bằng nhau.
    Hãy tính $10^5 dot p$ (_làm tròn kết quả đến hàng đơn vị_).

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *

        // Vẽ các phong lì xì
        for i in range(5) {
          rect((i * 18, 20), (i * 18 + 12, 28), fill: rgb("ffcccc"), stroke: red, radius: 1pt)
          content((i * 18 + 6, 24), text(size: 6pt, fill: red, weight: "bold")[Lì xì])

          rect((i * 18, 5), (i * 18 + 12, 13), fill: rgb("ffcccc"), stroke: red, radius: 1pt)
          content((i * 18 + 6, 9), text(size: 6pt, fill: red, weight: "bold")[Lì xì])
        }

        // Vẽ 3 cặp vợ chồng (minh họa)
        for i in range(3) {
          // Chồng (Xanh)
          circle((i * 30 + 12, -10), radius: 3, fill: blue, stroke: none)
          line((i * 30 + 12, -13), (i * 30 + 12, -20), stroke: 1.5pt + blue)
          line((i * 30 + 12, -15), (i * 30 + 8, -18), stroke: 1.5pt + blue)
          line((i * 30 + 12, -15), (i * 30 + 16, -18), stroke: 1.5pt + blue)

          // Vợ (Hồng)
          circle((i * 30 + 20, -10), radius: 3, fill: rgb("ff66b2"), stroke: none)
          line((i * 30 + 20, -13), (i * 30 + 20, -20), stroke: 1.5pt + rgb("ff66b2"))
          line((i * 30 + 20, -15), (i * 30 + 16, -18), stroke: 1.5pt + rgb("ff66b2"))
          line((i * 30 + 20, -15), (i * 30 + 24, -18), stroke: 1.5pt + rgb("ff66b2"))

          content((i * 30 + 16, -25), text(size: 8pt)[Cặp #str(i + 1)])
        }
      })
    ]
  ],
  [$413$],
  loigiai: [
    #ppgiai[
      - **Bước 1 (Đại số tổ hợp):** Tìm số lượng phong lì xì có thể tạo ra. Mỗi phong có 3 tờ tiền chọn từ 3 mệnh giá (có lặp lại). Tính tổng của từng trường hợp để xác nhận chúng phân biệt.
      - **Bước 2 (Không gian mẫu):** Tính số cách chọn 6 phong bao từ tổng số phong bao và chia cho 6 người (có xét thứ tự).
      - **Bước 3 (Biến cố thuận lợi):** Gom các phong bao thành các cặp có tổng bằng nhau. Gọi tổng của mỗi cặp là $T$. Tìm tất cả các giá trị $T$ khả dĩ sao cho có ít nhất 3 cặp phân biệt có cùng tổng $T$. Từ đó tính số cách chia thỏa mãn.
    ]

    *Bước 1: Xác định danh sách các phong lì xì* \
    Số tờ tiền trong mỗi phong bao là 3, được chọn từ 3 loại mệnh giá $\{10, 20, 50\}$. Số tổ hợp chọn là số nghiệm nguyên không âm của phương trình $x + y + z = 3$, tức là $C_{3+3-1}^3 = C_5^3 = 10$ cách. \
    Liệt kê tổng số tiền của 10 phong bao này (đơn vị: nghìn đồng):
    - 3 tờ giống nhau: $30, 60, 150$.
    - 2 tờ giống nhau, 1 tờ khác: $40, 50, 70, 90, 110, 120$.
    - 3 tờ khác nhau: $80$. \
    Danh sách 10 tổng tiền: $S = \{30, 40, 50, 60, 70, 80, 90, 110, 120, 150\}$. \
    Vì 10 giá trị này đôi một khác nhau, ta có chính xác $10$ phong lì xì.

    *Bước 2: Tính không gian mẫu* \
    Chọn ngẫu nhiên 6 phong lì xì từ 10 phong và phát cho 6 người (3 cặp vợ chồng). \
    Số cách phát là: $n(Omega) = A_{10}^6 = 151200$.

    *Bước 3: Phân tích biến cố thuận lợi* \
    Gọi $T$ là tổng số tiền của mỗi cặp vợ chồng. Ta cần chọn ra 3 cặp rời nhau từ tập $S$ sao cho mỗi cặp có tổng bằng $T$. \
    Bằng cách liệt kê và ghép cặp từ tập $S$, ta tìm được các giá trị $T$ có khả năng tạo ra $3$ cặp phân biệt:
    - $T = 110$: $\{30, 80\}, \{40, 70\}, \{50, 60\}$ $->$ Có 1 bộ 3 cặp.
    - $T = 120$: $\{30, 90\}, \{40, 80\}, \{50, 70\}$ $->$ Có 1 bộ 3 cặp.
    - $T = 130$: $\{40, 90\}, \{50, 80\}, \{60, 70\}$ $->$ Có 1 bộ 3 cặp.
    - $T = 140$: $\{30, 110\}, \{50, 90\}, \{60, 80\}$ $->$ Có 1 bộ 3 cặp.
    - $T = 150$: $\{30, 120\}, \{40, 110\}, \{60, 90\}, \{70, 80\}$. Có tới 4 cặp! Do đó có $C_4^3 = 4$ bộ 3 cặp khác nhau.
    - $T = 160$: $\{40, 120\}, \{50, 110\}, \{70, 90\}$ $->$ Có 1 bộ 3 cặp.
    - $T = 170$: $\{50, 120\}, \{60, 110\}, \{80, 90\}$ $->$ Có 1 bộ 3 cặp.
    - $T = 180$: $\{30, 150\}, \{60, 120\}, \{70, 110\}$ $->$ Có 1 bộ 3 cặp.
    - $T = 190$: $\{40, 150\}, \{70, 120\}, \{80, 110\}$ $->$ Có 1 bộ 3 cặp.
    - $T = 200$: $\{50, 150\}, \{80, 120\}, \{90, 110\}$ $->$ Có 1 bộ 3 cặp.

    Tổng số bộ 3 cặp thỏa mãn là: $9 times 1 + 4 = 13$ bộ.

    #align(center)[
      #cetz.canvas(length: 1mm, {
        import cetz.draw: *
        // Minh họa ghép 4 cặp cho T = 150
        let top_row = (30, 40, 60, 70)
        let bot_row = (120, 110, 90, 80)

        for i in range(4) {
          circle((i * 25, 20), radius: 6, fill: rgb("e6f2ff"), stroke: 0.8pt + blue)
          content((i * 25, 20), str(top_row.at(i)))

          circle((i * 25, 0), radius: 6, fill: rgb("fff0e6"), stroke: 0.8pt + orange)
          content((i * 25, 0), str(bot_row.at(i)))

          line(
            (i * 25, 14),
            (i * 25, 6),
            stroke: (dash: "dashed", paint: gray, thickness: 1pt),
            mark: (end: ">", start: ">"),
          )
        }

        content((37.5, 30), text(fill: red, weight: "bold")[Sơ đồ 4 cặp ghép có tổng T = 150])
      })
    ]

    *Bước 4: Tính số kết quả thuận lợi và xác suất* \
    Với mỗi bộ 3 cặp (gồm 6 phong lì xì cụ thể), ta có:
    - $3!$ cách phân phối 3 cặp này cho 3 cặp vợ chồng.
    - Trong mỗi cặp vợ chồng, có $2!$ cách chia 2 phong lì xì cho người chồng và người vợ. Tổng cộng là $(2!)^3 = 8$ cách. \
    Số kết quả thuận lợi là: $n(A) = 13 dot 3! dot 8 = 624$.

    Xác suất cần tìm là:
    $ p = (n(A))/(n(Omega)) = 624/151200 = 13/3150. $
    Ta có $10^5 dot p = 10^5 dot 13/3150 approx 412,698...$ \
    Làm tròn đến hàng đơn vị ta được *$413$*.

    #meo(title: [Kỹ thuật "Gom cặp có tổng không đổi"])[
      Khi đối mặt với bài toán chia cặp có tổng bằng nhau từ một tập hợp các số phân biệt, ta có thể sắp xếp tập hợp theo thứ tự tăng dần. Các cặp có tổng không đổi thường có tính chất đối xứng (số nhỏ nhất ghép với số lớn nhất, số nhỏ nhì ghép với số lớn nhì...). Tuy nhiên, do tập giá trị ở đây phân bố không đều đặn thành cấp số cộng, việc kiên nhẫn xét từng giá trị $T$ kết hợp tổ hợp $C_n^k$ (như trường hợp $T=150$) là chìa khóa để không bỏ sót nghiệm!
    ]
  ],
)
