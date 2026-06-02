#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
)
#show math.equation: set text(font: "New Computer Modern Math", fallback: true)
#set text(font: "New Computer Modern", size: 12pt, lang: "vi")
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
        TỐC ĐỘ TRƯỢT CỦA VẬT
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        ĐẠO HÀM VÀ ỨNG DỤNG
      ]
    ],
  )
]


#tl(
  [Để làm rõ cơ sở lý thuyết về bài toán động học vật rắn (chiếc thang trượt), chúng ta cùng xét một bài toán tổng quát và chi tiết hơn như sau:

    Một chiếc thang $A B$ thẳng, dài $5$ m được đặt tựa vào một bức tường thẳng đứng. Chân thang (điểm $A$) trượt trên mặt sàn nằm ngang ra xa góc tường với tốc độ không đổi $v_A = 0.6$ m/s. Đỉnh thang (điểm $B$) trượt dọc theo bức tường. Trên thang có hai điểm đáng chú ý: điểm $C$ (vị trí con mèo) cách chân thang $A$ một khoảng $2$ m, và điểm $I$ là trung điểm của thang.

    Tại thời điểm chân thang cách góc tường $3$ m, hãy tính toán và biểu diễn vectơ vận tốc, từ đó suy ra tốc độ di chuyển của các điểm $A$, $B$, $I$ và $C$ so với mặt sàn. Đồng thời, giải thích rõ cơ sở toán học của công thức tính tốc độ $v = sqrt(v_x^2 + v_y^2)$.],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let xA = 3.0
    let yB = 4.0
    let A = (xA, 0)
    let B = (0, yB)
    let I = (xA / 2, yB / 2)
    let C = (1.8, 1.6) // Cách A 2m

    // Nền, tường
    line((-1, 0), (5.5, 0), stroke: 1pt)
    line((0, -0.5), (0, 5.0), stroke: 1pt)
    content((4.5, -0.4), [Sàn ($O x$)], size: 9pt)
    content((-0.6, 4.5), [Tường ($O y$)], angle: 90deg, size: 9pt)

    // Thang
    line(A, B, stroke: (paint: rgb("8d6e63"), thickness: 2.5pt, cap: "round"))

    // Các điểm
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "south-west", padding: 5pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "south-west", padding: 5pt)
    circle(O, radius: 1.5pt, fill: black)
    content((0.2, 0.2), $O$, anchor: "south-west")

    circle(I, radius: 2pt, fill: blue, stroke: black)
    content(I, $I$, anchor: "south-west", padding: 5pt)
    circle(C, radius: 2pt, fill: orange, stroke: black)
    content(C, $C$, anchor: "north-east", padding: 5pt)
  }),
  fig-pos: "right",
  fig-width: 40%,
  lines: 0,
  loigiai: [
    #lythuyet(title: [Cơ sở nền tảng: Vectơ vị trí và Vectơ vận tốc])[
      *Tại sao $v = sqrt((x')^2 + (y')^2)$?*
      - Trong hệ tọa độ Descartes $O x y$, vị trí của một chất điểm $M$ tại thời điểm $t$ được xác định bởi vectơ vị trí $vect(O M) = (x(t); y(t))$.
      - *Vận tốc* là sự biến thiên của vị trí theo thời gian. Do đó, *vectơ vận tốc* $vec(v)$ chính là đạo hàm của vectơ vị trí theo biến thời gian $t$:
        $ vect(v) = (dif vect(O M)) / (dif t) = (x'(t); y'(t)) = (v_x; v_y) $
      - Trong đó: $v_x = x'(t)$ là vận tốc theo phương ngang, $v_y = y'(t)$ là vận tốc theo phương dọc.
      - *Tốc độ* (độ nhanh chậm mà ta hay gọi trong đời sống) chính là *độ lớn (chiều dài)* của vectơ vận tốc $vec(v)$. Theo định lý Pytago trong tam giác vuông tạo bởi các thành phần tọa độ:
        $ "Tốc độ " v = |vect(v)| = sqrt(v_x^2 + v_y^2) = sqrt((x')^2 + (y')^2) $
    ]

    #ppgiai[
      - *Bước 1:* Gắn hệ tọa độ $O x y$, xác định tọa độ $A(x; 0)$ và $B(0; y)$ theo thời gian $t$.
      - *Bước 2:* Tìm phương trình liên kết tọa độ của mọi điểm trên thang theo $x$ và $y$ (dùng tỉ lệ đoạn thẳng).
      - *Bước 3:* Đạo hàm tọa độ các điểm theo thời gian $t$ để lấy thành phần vectơ vận tốc $v_x, v_y$.
      - *Bước 4:* Thay giá trị cụ thể tại thời điểm đề cho và tính độ lớn vectơ.
    ]

    *1. Phân tích phương trình liên kết của chiếc thang:*
    Gọi $A(x; 0)$ và $B(0; y)$ là tọa độ hai đầu thang.
    Chiều dài thang $A B = 5$ không đổi. Theo định lý Pytago:
    $ x^2 + y^2 = 25 $
    Đạo hàm hai vế theo thời gian $t$, ta được phương trình liên kết vận tốc:
    $ 2x dot x' + 2y dot y' = 0 quad <=> quad x dot x' + y dot y' = 0 quad (1) $

    *2. Tính vận tốc các điểm tại thời điểm $x = 3$ m:*
    Tại thời điểm $x = 3$, ta có $y = sqrt(25 - 3^2) = 4$ m.
    Chân thang trượt ra xa góc tường với tốc độ $0.6$ m/s, do $x$ đang tăng nên $x' = 0.6$ m/s.
    Thay vào $(1)$ để tìm vận tốc trượt của đỉnh $B$:
    $ 3 dot (0.6) + 4 dot y' = 0 quad => quad y' = -1.8 / 4 = -0.45 " (m/s)" $
    Dấu trừ thể hiện điểm $B$ đang trượt đi xuống (ngược chiều dương trục $O y$).

    *3. Tính toán vectơ vận tốc cho từng điểm:*

    - *Đối với điểm $A$ (chân thang):*
      Tọa độ: $A(x; 0)$.
      Vectơ vận tốc: $vect(v)_A = (x'; 0) = (0.6; 0)$.
      Tốc độ của $A$: $v_A = sqrt(0.6^2 + 0^2) = 0.6$ m/s.

    - *Đối với điểm $B$ (đỉnh thang):*
      Tọa độ: $B(0; y)$.
      Vectơ vận tốc: $vect(v)_B = (0; y') = (0; -0.45)$.
      Tốc độ của $B$: $v_B = sqrt(0^2 + (-0.45)^2) = 0.45$ m/s.

    - *Đối với điểm $I$ (trung điểm $A B$):*
      Tọa độ trung điểm: $x_I = x/2 = 0.5x$ và $y_I = y/2 = 0.5y$.
      Đạo hàm theo $t$, ta có vectơ vận tốc của $I$:
      $ vect(v)_I = (x_I'; y_I') = (0.5x'; 0.5y') = (0.5 dot 0.6; 0.5 dot (-0.45)) = (0.3; -0.225) $
      Tốc độ của điểm $I$:
      $ v_I = sqrt(0.3^2 + (-0.225)^2) = sqrt(0.09 + 0.050625) = sqrt(0.140625) = 0.375 " (m/s)" $

    - *Đối với điểm $C$ (con mèo):*
      Đoạn $A C = 2$, chiều dài $A B = 5$, suy ra tỉ lệ $A C / A B = 2/5 = 0.4$.
      Ta có hệ thức vectơ: $vect(A C) = 0.4 vect(A B) <=> (x_C - x; y_C - 0) = 0.4(-x; y)$.
      Tọa độ của $C$:
      $ x_C = x - 0.4x = 0.6x \ y_C = 0.4y $
      Đạo hàm theo $t$, ta có vectơ vận tốc của $C$:
      $ vect(v)_C = (x_C'; y_C') = (0.6x'; 0.4y') = (0.6 dot 0.6; 0.4 dot (-0.45)) = (0.36; -0.18) $
      Tốc độ của điểm $C$:
      $ v_C = sqrt(0.36^2 + (-0.18)^2) = sqrt(0.1296 + 0.0324) = sqrt(0.162) approx 0.40249 " (m/s)" $

    #align(center)[
      #cetz.canvas(length: 4.5cm, {
        import cetz.draw: *
        // Vẽ giải thích vectơ
        let v_x = 0.6
        let v_y = -0.3
        let origin = (0, 0)

        // Trục tọa độ phụ
        line((-0.2, 0), (1.5, 0), stroke: (dash: "dashed", paint: gray), mark: (end: ">"))
        line((0, 0.5), (0, -1.0), stroke: (dash: "dashed", paint: gray), mark: (end: ">"))
        content((1.5, -0.2), $x$)
        content((-0.2, -1.0), $y$)

        // Vectơ thành phần
        line(origin, (v_x, 0), stroke: (paint: blue, thickness: 1.5pt), mark: (end: ">"))
        content((v_x / 2, 0.2), $v_x = x'(t)$, fill: blue)

        line((v_x, 0), (v_x, v_y), stroke: (paint: rgb("00aa00"), thickness: 1.5pt), mark: (end: ">"))
        content((v_x + 0.5, v_y / 2), $v_y = y'(t)$, fill: rgb("00aa00"))

        // Vectơ tổng hợp
        line(origin, (v_x, v_y), stroke: (paint: red, thickness: 2pt), mark: (end: ">"))
        content((v_x / 2 - 0.2, v_y / 2 - 0.2), $vect(v)$, fill: red)

        // Điểm M
        circle(origin, radius: 2pt, fill: black)
        content((-0.2, 0.2), $M$)

        // Góc vuông
        line((v_x - 0.15, 0), (v_x - 0.15, -0.15), (v_x, -0.15), stroke: 0.5pt)

        content((0.3, -1.2), [*Sự hình thành tốc độ từ các thành phần đạo hàm*])
      })
    ]

    #nhanxet[
      Qua việc tính toán cụ thể cho từng điểm, ta nhận ra một tính chất vật lý tuyệt đẹp của vật rắn:
      - Tốc độ trượt ngang $x'(t)$ giảm dần từ chân thang ($A$) lên đỉnh thang ($B$).
      - Tốc độ trượt dọc $y'(t)$ tăng dần từ chân thang lên đỉnh thang.
      - Điểm $I$ (trung điểm) có quỹ đạo là một cung tròn tâm $O$ bán kính $R = 2.5$. Do đó, vectơ vận tốc $vect(v)_I$ luôn tiếp tuyến với quỹ đạo tròn này. Thử tính tích vô hướng $vect(O I) dot vect(v)_I = (1.5)(0.3) + (2)(-0.225) = 0.45 - 0.45 = 0$. Vận tốc luôn vuông góc với bán kính quỹ đạo!
    ]
  ],
)
#tln(
  // mode: "loigiai",
  [Một chiếc thang thẳng dài $5$ m được đặt tựa vào một bức tường thẳng đứng. Chân thang (điểm $A$) đang trượt trên mặt sàn nằm ngang ra xa góc tường. Một con mèo đang ngồi im trên thang tại điểm $C$, biết khoảng cách từ chân thang $A$ đến $C$ bằng $2$ m. Tại thời điểm chân thang cách góc tường $3$ m, người ta đo được tốc độ di chuyển của con mèo so với mặt sàn là $(3sqrt(5))/10$ m/s. Hỏi tại thời điểm đó, tốc độ trượt của chân thang bằng bao nhiêu m/s?],
  [$1$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let xA = 3.0
    let yB = 4.0
    let A = (xA, 0)
    let B = (0, yB)

    // Tỉ lệ AC/AB = 2/5 = 0.4.
    let C = (1.8, 1.6)

    // Sàn nhà
    line((-1, 0), (5.5, 0), stroke: 1pt)
    line((-0.5, -0.2), (5.0, -0.2), stroke: 0.5pt)
    for i in range(-1, 6) { line((i, 0), (i - 0.2, -0.2), stroke: 0.5pt) }
    content((4.5, -0.4), [Sàn nhà], size: 9pt)

    // Bức tường
    line((0, -0.5), (0, 5.0), stroke: 1pt)
    line((-0.2, -0.5), (-0.2, 4.8), stroke: 0.5pt)
    for i in range(0, 5) { line((0, i), (-0.2, i + 0.2), stroke: 0.5pt) }
    content((-0.6, 4), [Bức tường], angle: 90deg, size: 9pt)

    // Chiếc thang
    line(A, B, stroke: (paint: rgb("8d6e63"), thickness: 2.5pt, cap: "round"))

    // Hình chiếu của C
    line(C, (1.8, 0), stroke: (dash: "dashed", paint: gray))
    line(C, (0, 1.6), stroke: (dash: "dashed", paint: gray))

    // Mũi tên vận tốc C (Đã biết)
    line(C, (1.8 + 0.72, 1.6 - 0.36), mark: (end: "stealth", fill: orange), stroke: (paint: orange, thickness: 1.5pt))
    content((2.8, 1.7), $v_C = (3sqrt(5))/10$, fill: orange)

    // Mũi tên vận tốc A (Cần tìm)
    line(A, (xA + 1.2, 0), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
    content((xA + 0.6, 0.3), $v_A = ?$, fill: red)

    // Kích thước
    content((1.5, -0.3), $x$, size: 9pt)
    content((-0.3, 2), $y$, size: 9pt)

    // Nhãn điểm
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "south-west", padding: 5pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "south-west", padding: 5pt)
    circle(O, radius: 1.5pt, fill: black)
    content(O, $O$, anchor: "north-east", padding: 4pt)

    // Con mèo (điểm C)
    circle(C, radius: 2.5pt, fill: orange, stroke: black)
    content(C, $C$, anchor: "south-west", padding: 5pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      Thay vì phải biến đổi biểu thức đại số cồng kềnh, ta ưu tiên sử dụng tư duy "gọn nhẹ" kết hợp sức mạnh của Casio:
      - *Bước 1:* Gọi $v_A = v$ là ẩn cần tìm.
      - *Bước 2:* Thay số cụ thể tại khoảnh khắc $x=3$ ngay lập tức để tìm mối quan hệ đơn giản giữa các thành phần vận tốc $x_C', y_C'$ theo $v$.
      - *Bước 3:* Ráp vào công thức độ lớn vận tốc $v_C = sqrt((x_C')^2 + (y_C')^2)$, ấn `SHIFT SOLVE` để ra nghiệm.
    ]

    Gọi tốc độ trượt của chân thang tại thời điểm khảo sát là $x' = v > 0$.
    Tại thời điểm $x = 3$, theo Pytago, độ cao đỉnh thang là $y = sqrt(5^2 - 3^2) = 4$.

    Từ hệ thức độ dài thang $x^2 + y^2 = 25$, đạo hàm hai vế theo thời gian $t$, rồi thay trực tiếp số vào:
    $ 2x dot x' + 2y dot y' = 0 quad => quad 3v + 4y' = 0 quad <=> quad y' = -0.75v $

    Do điểm $C$ cách $A$ một đoạn $2$ m (trên tổng chiều dài $5$ m), nó chia độ cao và độ xa theo tỉ lệ tương ứng. Tọa độ của $C$ là:
    $
      x_C = x - 2/5 x = 0.6x \
      y_C = 2/5 y = 0.4y
    $
    Đạo hàm tọa độ $C$ theo $t$, ta được các thành phần vận tốc phụ thuộc vào $v$:
    $
      x_C' = 0.6 x' = 0.6v \
      y_C' = 0.4 y' = 0.4 dot (-0.75v) = -0.3v
    $

    Theo đề bài, tốc độ của con mèo là $v_C = (3sqrt(5))/10$, ta thiết lập phương trình độ lớn vận tốc:
    $ sqrt((x_C')^2 + (y_C')^2) = (3sqrt(5))/10 $
    $ <=> sqrt((0.6v)^2 + (-0.3v)^2) = (3sqrt(5))/10 $

    Nhập y nguyên phương trình trên vào máy tính Casio (với ẩn $X$), bấm `SHIFT SOLVE` cho $X > 0$, ta thu được ngay nghiệm:
    $ v = 1 $

    Vậy tốc độ trượt của chân thang tại thời điểm đó là $1$ m/s.

    #meo[
      Việc thay trực tiếp các giá trị ($x=3, y=4$) ngay từ bước tính đạo hàm $3v + 4y'=0$ giúp loại bỏ hoàn toàn biểu thức chứa phân số phức tạp. Ở bước cuối cùng, chỉ cần "thả" nguyên phương trình thô vào chức năng Solve của Casio, ta tiết kiệm được thời gian rút gọn tay và triệt tiêu nguy cơ sai sót dấu. Đây là kĩ năng thực chiến cực kì hiệu quả trong phòng thi!
    ]
  ],
)
#tln(
  [Một tổ tuần tra cảnh sát giao thông trang bị máy bắn tốc độ bằng laser đang đỗ cách mép một đoạn đường cao tốc thẳng đứng một khoảng $30$ m. Một chiếc ô tô tình nghi đang phóng rất nhanh trên đường. Tại thời điểm chiếc xe cách súng radar một khoảng $50$ m (theo đường chim bay), hệ thống radar ghi nhận khoảng cách này đang tăng lên với tốc độ $24$ m/s. Lấy mốc thời gian là thời điểm hệ thống ghi nhận, hãy tính tốc độ thực tế của chiếc xe tình nghi (theo phương ngang) bằng bao nhiêu m/s?],
  [$30$],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    let R = (0, 3) // Vị trí súng Radar
    let H = (0, 0) // Hình chiếu lên đường
    let C = (4, 0) // Xe ô tô

    // Mặt đường cao tốc (nhìn từ trên xuống)
    rect((-1.5, -0.6), (6.5, 0.6), fill: rgb("e0e0e0"), stroke: none)
    line((-1.5, 0.6), (6.5, 0.6), stroke: (paint: gray, thickness: 2pt))
    line((-1.5, -0.6), (6.5, -0.6), stroke: (paint: gray, thickness: 2pt))
    line((-1.5, 0), (6.5, 0), stroke: (dash: "dashed", paint: white, thickness: 1.5pt))
    content((5, -0.9), [Đường cao tốc], size: 9pt, fill: rgb("616161"))

    // Vị trí cảnh sát
    circle(R, radius: 0.15, fill: blue, stroke: black)
    content((0, 3.4), [Radar ($R$)], fill: blue)

    // Xe tình nghi
    rect((C.at(0) - 0.4, C.at(1) - 0.25), (C.at(0) + 0.4, C.at(1) + 0.25), fill: red, stroke: black)
    content((C.at(0), C.at(1) - 0.6), [Xe ($C$)], fill: red)

    // Tam giác mô hình
    line(R, C, stroke: (dash: "dashed", paint: rgb("0288d1"), thickness: 1.5pt))
    line(R, H, stroke: (dash: "dashed", paint: black, thickness: 1pt))
    line(H, C, stroke: (dash: "dashed", paint: black, thickness: 1pt))

    // Góc vuông
    line((0.2, 0), (0.2, 0.2), (0, 0.2), stroke: 0.8pt)

    // Kích thước và thông số
    content((-0.5, 1.5), $h = 30"m"$)
    content((2, 0.3), $x(t)$)
    content((2.2, 1.9), $s(t) = 50"m"$, angle: -36.87deg, fill: rgb("0288d1"))

    // Mũi tên vận tốc xe (Thực tế)
    line(
      (C.at(0) + 0.4, 0),
      (C.at(0) + 1.8, 0),
      mark: (end: "stealth", fill: red),
      stroke: (paint: red, thickness: 1.5pt),
    )
    content((C.at(0) + 1.1, 0.3), $v_x = ?$, fill: red)

    // Mũi tên tốc độ tăng khoảng cách (Radar đo được)
    let dir = (4 / 5, -3 / 5) // Vectơ chỉ phương của RC
    line(
      C,
      (C.at(0) + 1.5 * dir.at(0), C.at(1) + 1.5 * dir.at(1)),
      mark: (end: "stealth", fill: orange),
      stroke: (paint: orange, thickness: 1.5pt),
    )
    content((C.at(0) + 1.6, C.at(1) - 1.2), $v_s = 24$, fill: orange)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      Tiếp tục áp dụng "Tư duy Casio thực chiến" để giải mã hiện trường:
      - *Thiết lập ẩn số:* Gọi khoảng cách từ hình chiếu của radar đến xe là $x(t)$. Tốc độ thực tế của xe là $v_x = x'$.
      - *Phương trình liên kết:* Dựng tam giác vuông tạo bởi Radar, vệt đường và chiếc xe. Cạnh góc vuông $h = 30$ m không đổi. Cạnh huyền $s(t)$ là khoảng cách radar ghi nhận. Ta có: $x^2 + h^2 = s^2$.
      - *Đạo hàm ngầm & Bấm máy:* Lấy đạo hàm hai vế theo thời gian $t$. Tìm $x$ tại thời điểm $s=50$, thế toàn bộ dữ kiện vào và bấm `SHIFT SOLVE` để tìm $v_x$.
    ]

    Gọi $x(t)$ là khoảng cách trên đường cao tốc từ điểm $H$ (hình chiếu của radar lên đường) đến ô tô.
    Gọi $s(t)$ là khoảng cách đường chim bay từ radar đến ô tô.
    Theo định lý Pytago, ta có phương trình liên kết tại mọi thời điểm $t$:
    $ x^2 + 30^2 = s^2 quad (1) $

    *Bước 1: Khám nghiệm hiện trường (Tính giá trị tĩnh)*
    Tại thời điểm radar báo $s = 50$ m, chiếc xe đang cách điểm $H$ một khoảng:
    $ x = sqrt(50^2 - 30^2) = sqrt(1600) = 40 " (m)" $

    *Bước 2: Lập phương trình động học & Giải*
    Lấy đạo hàm ngầm hai vế của phương trình $(1)$ theo thời gian $t$:
    $ 2x dot x' + 0 = 2s dot s' quad <=> quad x dot x' = s dot s' quad (2) $

    Trong đó:
    - $x'$ chính là tốc độ thực tế của chiếc xe ($v_x$).
    - $s'$ là tốc độ gia tăng khoảng cách mà radar đo được ($s' = 24$ m/s).

    Thay các số liệu $x = 40$, $s = 50$, và $s' = 24$ vào phương trình $(2)$:
    $ 40 dot v_x = 50 dot 24 $

    Sử dụng Casio nhập `40X = 50 * 24` và bấm `SHIFT SOLVE`, ta thu được:
    $ v_x = 30 " (m/s)" $

    Vậy tốc độ thực tế của chiếc xe tình nghi là *$30$* m/s (tương đương $108$ km/h).

    #nhanxet[
      Góc nhìn thám tử: Máy bắn tốc độ laser hoạt động dựa trên hiệu ứng Doppler để đo tốc độ $s'$ (vận tốc hướng tâm). Bạn có để ý rằng tốc độ radar đo được ($24$ m/s) luôn *nhỏ hơn* tốc độ thực tế của xe ($30$ m/s)? Đây gọi là "Hiệu ứng Cosine" trong đo lường giao thông ($s' = x' cos theta$). Nhờ tích hợp thuật toán đạo hàm liên kết này, chip máy tính trong súng radar mới có thể tự động bù trừ sai số góc và hiện ra tốc độ thực của người vi phạm!
    ]
  ],
)
#tln(
  [Tại vòng chung kết một giải đua xe Công thức 1 (F1), một camera truyền hình tự động được đặt cố định tại điểm $O$ cách mép đường đua một khoảng $30$ m (gọi $H$ là hình chiếu vuông góc của $O$ lên đường đua thẳng). Một chiếc xe đua đang lao thẳng qua $H$ với tốc độ không đổi $90$ m/s. Hệ thống camera liên tục tự động xoay để theo dõi và giữ chiếc xe luôn ở trung tâm khung hình. Hỏi tại thời điểm chiếc xe cách điểm $H$ một khoảng đúng $40$ m, hệ thống mô-tơ của camera đang phải xoay với tốc độ góc bằng bao nhiêu rad/s (làm tròn kết quả đến $2$ chữ số thập phân)?],
  [$1,08$],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    let O = (0, 3) // Camera
    let H = (0, 0) // Hình chiếu
    let C = (4, 0) // Xe F1

    // Mặt đường đua
    rect((-1.5, -0.6), (6.5, 0.6), fill: rgb("e0e0e0"), stroke: none)
    line((-1.5, 0.6), (6.5, 0.6), stroke: (paint: gray, thickness: 2pt))
    line((-1.5, -0.6), (6.5, -0.6), stroke: (paint: gray, thickness: 2pt))
    line((-1.5, 0), (6.5, 0), stroke: (dash: "dashed", paint: white, thickness: 1.5pt))
    content((5.2, -0.9), [Đường đua F1], size: 9pt, fill: rgb("616161"))

    // Camera và Chân đế
    line((0, 3), (-0.3, 2.5), stroke: 1.5pt)
    line((0, 3), (0.3, 2.5), stroke: 1.5pt)
    rect((-0.2, 3), (0.2, 3.3), fill: rgb("263238"), stroke: black)
    circle((0.2, 3.15), radius: 0.08, fill: white) // Ống kính
    content((0, 3.6), [Camera ($O$)], fill: black)

    // Chiếc xe F1 (Mô phỏng khối)
    rect((C.at(0) - 0.6, C.at(1) - 0.2), (C.at(0) + 0.6, C.at(1) + 0.2), fill: red, radius: 0.1, stroke: black)
    circle((C.at(0) + 0.35, C.at(1) - 0.25), radius: 0.12, fill: black)
    circle((C.at(0) - 0.35, C.at(1) - 0.25), radius: 0.12, fill: black)
    circle((C.at(0) + 0.35, C.at(1) + 0.25), radius: 0.12, fill: black)
    circle((C.at(0) - 0.35, C.at(1) + 0.25), radius: 0.12, fill: black)
    content((C.at(0), C.at(1) - 0.6), [Xe ($C$)], fill: red)

    // Tam giác mô hình Toán học
    line(O, C, stroke: (dash: "dashed", paint: rgb("0288d1"), thickness: 1.5pt))
    line(O, H, stroke: (dash: "dashed", paint: black, thickness: 1pt))
    line(H, C, stroke: (dash: "dashed", paint: black, thickness: 1pt))

    // Góc vuông tại H
    line((0.2, 0), (0.2, 0.2), (0, 0.2), stroke: 0.8pt)

    // Góc quay theta và Tốc độ góc
    // arc(O, start: -90deg, stop: -36.87deg, radius: 1.2)
    // content((0.4, 1.6), $theta$)

    // arc(
    //   O,
    //   start: -90deg,
    //   stop: -25deg,
    //   radius: 1.6,
    //   mark: (end: "stealth", fill: orange),
    //   stroke: (paint: orange, thickness: 1.5pt),
    // )
    content((1.2, 1.2), $theta' = omega$, fill: orange)

    // Ký hiệu khoảng cách
    content((-0.6, 1.5), $h = 30"m"$)
    content((2, 0.3), $x(t)$)

    // Mũi tên vận tốc xe
    line(
      (C.at(0) + 0.7, 0),
      (C.at(0) + 2.0, 0),
      mark: (end: "stealth", fill: red),
      stroke: (paint: red, thickness: 1.5pt),
    )
    content((C.at(0) + 1.4, 0.3), $v_x = 90$, fill: red)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      Với các bài toán liên quan đến góc quay (vận tốc góc), ta sử dụng tư duy lượng giác kết hợp đạo hàm hàm hợp:
      - *Thiết lập biến:* Gọi góc quay là $theta(t)$ và khoảng cách là $x(t)$.
      - *Dùng hàm số lượng giác:* Sử dụng $tan theta$ hoặc $cot theta$ để liên kết trực tiếp khoảng cách $x$ với góc $theta$ (ví dụ: $tan theta = x / h$).
      - *Đạo hàm hai vế:* Nhớ quy tắc $(tan theta)' = (1 + tan^2 theta) dot theta'$.
      - *Casio Solve:* Giữ nguyên biểu thức $tan theta$, không cần tính ra số đo góc lẻ, thay trực tiếp tỉ số vào phương trình và bấm Casio để giải vận tốc góc $theta'$.
    ]

    Gọi $x(t)$ là khoảng cách từ điểm $H$ đến chiếc xe tại thời điểm $t$.
    Gọi $theta(t)$ là góc quay của camera (tạo bởi tia $O H$ và tia $O C$).
    Theo đề bài, ta có $h = O H = 30$ m và tốc độ của xe là $v_x = x' = 90$ m/s.

    *Bước 1: Lập phương trình liên kết*
    Trong tam giác vuông $O H C$, ta có hệ thức:
    $ tan theta = x/30 quad <=> quad x = 30 tan theta quad (1) $

    *Bước 2: Xác định trạng thái tức thời*
    Tại thời điểm xe cách $H$ một khoảng $x = 40$ m, tỉ số lượng giác của góc quay là:
    $ tan theta = 40/30 = 4/3 $

    *Bước 3: Đạo hàm và giải bằng Casio*
    Đạo hàm hai vế phương trình $(1)$ theo thời gian $t$, ta sử dụng công thức đạo hàm hàm hợp:
    $ x' = 30 dot (1 + tan^2 theta) dot theta' quad (2) $

    Trong đó:
    - $x' = 90$ là tốc độ của chiếc xe.
    - $theta'$ chính là tốc độ góc $omega$ của camera mà ta cần tìm.
    - $tan theta = 4/3$ là giá trị tại đúng khoảnh khắc đó.

    Thế toàn bộ các số liệu này vào phương trình $(2)$:
    $ 90 = 30 dot (1 + (4/3)^2) dot omega $

    Mở máy tính Casio, nhập biểu thức `90 = 30 * (1 + (4/3)^2) * X` và bấm `SHIFT SOLVE`. Máy sẽ xử lý cặn kẽ biểu thức $(1 + 16/9) = 25/9$ thay cho bạn:
    $ X = 1.08 $

    Vậy tại thời điểm đó, camera đang xoay với tốc độ góc là *$1,08$* rad/s.

    #meo[
      Bài toán vận tốc góc thường làm học sinh lúng túng vì tìm cách tính góc $theta = arctan(4/3) approx 53.13^degree$, sau đó lại phải ráp vào các công thức phức tạp dễ dẫn đến sai số làm tròn.
      Bí kíp ở đây là *"Giữ nguyên hình thái tỉ số"*. Công thức đạo hàm $(tan theta)' = 1 + tan^2 theta$ sinh ra chính là để ta tái sử dụng ngay tỉ số $tan theta = 4/3$ vừa thiết lập, biến bài toán lượng giác phức tạp trở lại thành phương trình phân số siêu đơn giản cho Casio xơi gọn!
    ]
  ],
)

#tln(
  [Một bến cảng có một ròng rọc được cố định ở độ cao $3$ m so với mặt nước. Một chiếc thuyền đang trôi trên mặt nước được kéo vào bờ bằng một sợi dây thừng vắt qua ròng rọc này. Người công nhân trên bờ kéo dây với tốc độ thu dây không đổi là $1.5$ m/s. Hỏi tại thời điểm chiếc thuyền cách bến cảng (theo phương ngang) đúng $4$ m, chiếc thuyền đang tiến vào bờ với tốc độ bằng bao nhiêu m/s (bỏ qua kích thước ròng rọc và giả sử điểm buộc dây trên thuyền ngang với mặt nước, làm tròn kết quả đến $3$ chữ số thập phân)?],
  [$1,875$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *

    // Tọa độ và tham số phối cảnh 3D (Depth)
    let dx = 1.5
    let dy = 1.0

    // 1. Mặt nước (Water plane) - ĐÃ SỬA LỖI
    line((-3, 0), (6.5, 0), (6.5 + dx, dy), (-3 + dx, dy), close: true, fill: rgb("e1f5fe"), stroke: none)

    // Gợn sóng tạo cảm giác mặt phẳng
    line((1, 0.3), (2, 0.3), stroke: rgb("0288d1"))
    line((3, 0.7), (4.5, 0.7), stroke: rgb("0288d1"))
    line((1.5, 0.8), (2.5, 0.8), stroke: rgb("0288d1"))
    line((-1.0, 0.4), (0.5, 0.4), stroke: rgb("0288d1"))

    // 2. Bến cảng (3D Dock Block) - ĐÃ SỬA LỖI
    // Mặt trước
    line((-3, 0), (0, 0), (0, 3), (-3, 3), close: true, fill: rgb("cfd8dc"), stroke: 0.8pt)
    // Mặt bên phải (chiều sâu)
    line((0, 0), (dx, dy), (dx, 3 + dy), (0, 3), close: true, fill: rgb("90a4ae"), stroke: 0.8pt)
    // Mặt trên cùng (nơi người đứng)
    line((-3, 3), (0, 3), (dx, 3 + dy), (-3 + dx, 3 + dy), close: true, fill: rgb("b0bec5"), stroke: 0.8pt)
    content((-1.5, 1.5), [Bến cảng], size: 10pt, fill: rgb("37474f"))

    // 3. Thuyền (Giả 3D) - ĐÃ SỬA LỖI
    let B = (4, 0)
    // Mạn thuyền (mặt trước)
    line((4, 0), (5.5, 0), (5.8, 0.6), (4.4, 0.6), close: true, fill: rgb("ffb74d"), stroke: 0.8pt)
    // Sàn thuyền (mặt trên)
    let b_dx = 0.6
    let b_dy = 0.4
    line(
      (4.4, 0.6),
      (5.8, 0.6),
      (5.8 + b_dx, 0.6 + b_dy),
      (4.4 + b_dx, 0.6 + b_dy),
      close: true,
      fill: rgb("ffe082"),
      stroke: 0.8pt,
    )
    // Đuôi thuyền (mặt hông khuất)
    line(
      (5.5, 0),
      (5.8, 0.6),
      (5.8 + b_dx, 0.6 + b_dy),
      (5.5 + b_dx, b_dy),
      close: true,
      fill: rgb("f57c00"),
      stroke: 0.8pt,
    )

    // 4. Các điểm Hình học phẳng (Nằm trên mặt 2D chính)
    let O = (0, 0)
    let R = (0, 3)
    circle(O, radius: 1.5pt, fill: black)
    content((-0.2, -0.2), $O$)

    // Ròng rọc R
    circle(R, radius: 0.15, fill: rgb("424242"), stroke: 0.5pt)
    circle(R, radius: 0.05, fill: white, stroke: none)
    content((0.3, 3.3), $R$)

    // Điểm mũi thuyền B
    circle(B, radius: 1.5pt, fill: red)
    content((4, -0.3), $B$)

    // Tam giác vuông O R B
    line(O, B, stroke: (dash: "dashed", paint: black, thickness: 1pt))
    line(O, R, stroke: (dash: "dashed", paint: black, thickness: 1pt))
    line((0.2, 0), (0.2, 0.2), (0, 0.2), stroke: 0.8pt) // Ký hiệu góc vuông

    // Dây thừng
    line(R, B, stroke: (paint: rgb("5d4037"), thickness: 1.5pt))

    // 5. Người công nhân kéo dây (Stickman giả 3D)
    let P_head = (-1.0, 4.5)
    let P_neck = (-1.0, 4.3)
    let P_pelvis = (-1.0, 3.5)
    let P_foot1 = (-1.3, 3.2)
    let P_foot2 = (-0.7, 3.3)
    let P_hand = (-0.2, 3.6)

    circle(P_head, radius: 0.2, fill: rgb("ffcc80"), stroke: 0.8pt)
    line(P_neck, P_pelvis, stroke: 1.5pt)
    line(P_pelvis, P_foot1, stroke: 1.5pt)
    line(P_pelvis, P_foot2, stroke: 1.5pt)
    line((-1.0, 4.1), P_hand, stroke: 1.5pt)

    // Dây thừng đoạn trên tay người
    line(R, P_hand, stroke: (paint: rgb("5d4037"), thickness: 1.5pt))

    // 6. Mũi tên vận tốc và kích thước
    line((0.2, 3.6), (-0.8, 4.1), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.5pt))
    content((-0.2, 4.1), $v_z$, fill: red)

    line((4.2, 0.9), (3.0, 0.9), mark: (end: "stealth", fill: orange), stroke: (paint: orange, thickness: 1.5pt))
    content((3.6, 1.2), $v_x = ?$, fill: orange)

    // Ký hiệu độ dài
    line((0, -0.6), (4, -0.6), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((2, -0.9), $x = 4"m"$)
    line((0.6, 0), (0.6, 3), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((1.1, 1.5), $h = 3"m"$)

    content((2.3, 1.8), $z$, angle: -36.87deg, size: 10pt)
  }),
  fig-pos: "center",
  fig-width: 48%,
  loigiai: [
    #ppgiai[
      Sử dụng chiến thuật "Casio suy ngược":
      - *Chọn ẩn:* Gọi chiều dài đoạn dây từ ròng rọc đến thuyền là $z$ và khoảng cách ngang từ bến đến thuyền là $x$. Cần tìm tốc độ tiến vào bờ của thuyền chính là độ lớn của $v_x = x'$.
      - *Lập phương trình liên kết:* Dùng định lý Pytago nối $x$, $z$ và chiều cao $h$ (hằng số).
      - *Đạo hàm ngầm 2 vế:* $d/(d t) (x^2 + h^2) = d/(d t) (z^2)$.
      - *Casio Solve:* Thay các giá trị khoảng cách tức thời và tốc độ dây $v_z = z'$ vào phương trình đạo hàm để bấm máy giải $v_x$.
    ]

    Gọi $x(t)$ là khoảng cách ngang từ bến cảng đến chiếc thuyền và $z(t)$ là chiều dài sợi dây từ ròng rọc đến thuyền.
    Độ cao của ròng rọc so với mặt nước luôn không đổi là $h = 3$ m.

    Tại một thời điểm bất kỳ, theo định lý Pytago trong tam giác vuông tạo bởi bến cảng, mặt nước và sợi dây, ta có:
    $ x^2 + 3^2 = z^2 quad <=> quad x^2 + 9 = z^2 quad (1) $

    Đạo hàm hai vế của phương trình $(1)$ theo thời gian $t$, ta được phương trình liên kết vận tốc:
    $ 2x dot x' = 2z dot z' quad <=> quad x dot x' = z dot z' quad (2) $

    Trong đó:
    - $x'$ là tốc độ tiến vào bờ của thuyền (chính là $v_x$ cần tìm).
    - $z'$ là tốc độ thu dây. Theo đề bài, dây được kéo với tốc độ không đổi nên độ lớn $z' = 1.5$ m/s.

    *Xét tại thời điểm tức thời $x = 4$ m:*
    Khoảng cách dây lúc này là:
    $ z = sqrt(4^2 + 3^2) = sqrt(25) = 5 " (m)" $

    Thay $x = 4$, $z = 5$ và tốc độ thu dây $z' = 1.5$ vào phương trình $(2)$:
    $ 4 dot v_x = 5 dot 1.5 $

    Nhập biểu thức trên vào máy tính Casio (gọi $X$ là $v_x$): `4X = 5 * 1.5` rồi bấm `SHIFT SOLVE`, máy hiển thị ngay kết quả:
    $ X = 1.875 $

    Vậy tại thời điểm đó, thuyền đang tiến vào bờ với tốc độ *$1,875$* m/s.

    #meo[
      Bài toán này chứa một yếu tố dễ đánh lừa trực giác học sinh: *"Dây kéo đều $1.5$ m/s thì thuyền cũng trôi vào bờ $1.5$ m/s"*. Sự thật là qua lăng kính của Đạo hàm, do hệ số góc của tam giác vuông liên tục thay đổi nên $v_x = (z/x) dot v_z$. Vì $z > x$ (cạnh huyền luôn lớn hơn cạnh góc vuông), chiếc thuyền luôn lao vào bờ với tốc độ *nhanh hơn* tốc độ kéo dây của người công nhân trên bờ!
    ]
  ],
)
#tln(
  [Một trạm ra-đa mặt đất đang theo dõi một máy bay bay ngang ở độ cao không đổi $3$ km. Tại thời điểm máy bay cách trạm ra-đa một khoảng $5$ km (khoảng cách theo đường thẳng từ ra-đa đến máy bay), hệ thống đo được khoảng cách này đang tăng lên với tốc độ $240$ m/s. Giả sử máy bay bay theo quỹ đạo là đường thẳng đi ngang qua phía trên trạm ra-đa. Hỏi tại thời điểm đó, tốc độ bay thực tế (theo phương ngang) của máy bay là bao nhiêu m/s?],
  [$300$],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    let R = (0, 0)
    let P = (4, 3)
    let H = (4, 0)

    // Mặt đất
    line((-1.5, 0), (6.5, 0), stroke: (paint: rgb("8d6e63"), thickness: 1.5pt))
    for i in range(-1, 6) { line((i, 0), (i + 0.3, -0.2), stroke: (paint: rgb("8d6e63"), thickness: 0.5pt)) }

    // Trạm Ra-đa
    arc((0, 0.4), start: 0deg, stop: 180deg, radius: (0.5, 0.2), fill: rgb("90caf9"), stroke: 0.8pt)
    line((0, 0), (0, 0.4), stroke: 1.5pt)
    circle(R, radius: 1.5pt, fill: black)
    content((0, -0.5), [Trạm Ra-đa], size: 9pt)

    // Máy bay (tạo hình đơn giản)
    line((P.at(0) - 0.6, P.at(1)), (P.at(0) + 0.6, P.at(1)), stroke: 2pt)
    line((P.at(0) - 0.4, P.at(1) - 0.1), (P.at(0) + 0.8, P.at(1) + 0.1), stroke: 2pt)
    circle(P, radius: 2pt, fill: red, stroke: none)

    // Lưới tọa độ ảo (Right Triangle)
    line(R, P, stroke: (dash: "dashed", paint: rgb("0288d1"), thickness: 1.2pt))
    line(R, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(P, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    // Ký hiệu góc vuông
    line((3.8, 0), (3.8, 0.2), (4, 0.2), stroke: 0.8pt)

    // Độ dài
    content((2.4, -0.3), $x(t)$)
    content((4.6, 1.5), $h = 3 "km"$)
    content((1.8, 1.8), $s(t) = 5 "km"$, angle: 36.87deg, fill: rgb("0288d1"))

    // Vectơ vận tốc phương ngang (v_x)
    line(P, (P.at(0) + 1.8, P.at(1)), mark: (end: "stealth", fill: orange), stroke: (paint: orange, thickness: 1.5pt))
    content((P.at(0) + 1.0, P.at(1) - 0.3), $v_x = ?$, fill: orange)

    // Vectơ vận tốc theo phương ngắm s (v_s)
    let us = (4 / 5, 3 / 5) // Unit vector dọc theo s
    let Ps = (P.at(0) + 1.2 * us.at(0), P.at(1) + 1.2 * us.at(1))
    line(P, Ps, mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.5pt))
    content((P.at(0) + 0.5, P.at(1) + 1.0), $v_s = 240$, fill: red)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      Để triệt tiêu nỗi sợ "biến đổi đạo hàm phức tạp", chúng ta tiếp tục áp dụng thuật toán "Casio thực chiến":
      - *Đồng nhất đơn vị:* Mọi khoảng cách đổi về mét (m) để khớp với vận tốc (m/s).
      - *Lập phương trình tĩnh:* Dùng Pytago liên kết khoảng cách ngang $x$, độ cao $h$ và khoảng cách chéo $s$. Tính ngay giá trị của $x$ tại thời điểm đề cho.
      - *Đạo hàm ngầm không căn bậc hai:* Đạo hàm thẳng biểu thức $x^2 + h^2 = s^2$, tuyệt đối không rút căn $s = sqrt(x^2 + h^2)$ để tránh đạo hàm u' chia 2 căn u.
      - *Thay số - Shift Solve:* Thả toàn bộ số liệu vào phương trình vừa đạo hàm và bấm Casio giải nghiệm.
    ]

    *Bước 1: Đồng nhất đơn vị và tính toán tĩnh*
    Đổi độ cao $h = 3$ km $= 3000$ m.
    Khoảng cách chéo $s = 5$ km $= 5000$ m.
    Gọi $x(t)$ là khoảng cách theo phương ngang từ máy bay đến trạm ra-đa. Theo định lý Pytago:
    $ x^2 + 3000^2 = s^2 quad (1) $
    Tại thời điểm $s = 5000$, khoảng cách ngang là:
    $ x = sqrt(5000^2 - 3000^2) = 4000 " (m)" $

    *Bước 2: Đạo hàm và Casio Solve*
    Đạo hàm hai vế phương trình $(1)$ theo thời gian $t$, ta được:
    $ 2x dot x' + 0 = 2s dot s' quad <=> quad x dot x' = s dot s' $
    Trong đó:
    - $x'$ chính là tốc độ bay ngang thực tế của máy bay cần tìm ($v_x$).
    - $s'$ là tốc độ tăng khoảng cách đường chéo mà ra-đa đo được ($s' = 240$ m/s).

    Thay toàn bộ các giá trị $x = 4000$, $s = 5000$ và $s' = 240$ vào phương trình:
    $ 4000 dot v_x = 5000 dot 240 $

    Tới đây, bấm máy tính `4000X = 5000 * 240` và `SHIFT SOLVE` (hoặc triệt tiêu số 0 nhẩm $4X = 5 times 240$), ta có:
    $ v_x = 300 " (m/s)" $

    Vậy tốc độ bay thực tế của máy bay là $300$ m/s (tương đương $1080$ km/h, rất thực tế với máy bay phản lực).

    #nhanxet[
      Bài toán này giải thích chính xác nguyên lý hoạt động của Súng bắn tốc độ (của Cảnh sát giao thông) và Hệ thống Ra-đa phòng không! Súng hay Ra-đa thực chất chỉ phát sóng và dùng hiệu ứng Doppler để đo tốc độ $s'$ (vận tốc hướng tâm). Nhưng nhờ con chip máy tính bên trong liên tục đo $s$ và chạy "đạo hàm ngầm" theo Pytago, nó lập tức tính ngược ra tốc độ thực tế $x'$ của xe cộ/máy bay. Toán học chính là "linh hồn" của mọi công nghệ đo lường hiện đại!
    ]
  ],
)
#tln(
  [Một người điều khiển flycam (drone) đang bay theo phương ngang ra xa người đó ở độ cao không đổi $40$ m (tính từ tay người điều khiển). Tại thời điểm khoảng cách đường thẳng từ bộ điều khiển đến flycam là $50$ m, hệ thống đo lường báo tốc độ tăng của khoảng cách này (tốc độ ra đa) là $4.8$ m/s. Hỏi tại thời điểm đó, chiếc flycam đang bay với tốc độ thực tế (theo phương ngang) là bao nhiêu m/s?],
  [$8$],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *

    let O = (0, 0) // Người điều khiển
    let D = (3, 4) // Flycam (tỉ lệ 1:10)
    let H = (3, 0) // Hình chiếu của flycam

    // Mặt đất & Cảnh quan
    line((-1.5, -0.5), (5.5, -0.5), stroke: (paint: rgb("8d6e63"), thickness: 1.5pt))
    for i in range(-1, 6) { line((i, -0.5), (i + 0.3, -0.7), stroke: (paint: rgb("8d6e63"), thickness: 0.5pt)) }

    // Người điều khiển
    circle((0, -0.1), radius: 0.15, fill: gray, stroke: none)
    line((0, -0.5), (0, -0.25), stroke: 1.5pt)
    circle(O, radius: 1.5pt, fill: black)
    content((-0.4, 0.2), $O$)

    // Flycam (Drone)
    line((D.at(0) - 0.6, D.at(1)), (D.at(0) + 0.6, D.at(1)), stroke: 2pt)
    circle((D.at(0) - 0.4, D.at(1) + 0.1), radius: 0.1, fill: black)
    circle((D.at(0) + 0.4, D.at(1) + 0.1), radius: 0.1, fill: black)
    circle(D, radius: 2pt, fill: red, stroke: none)
    content((D.at(0) - 0.3, D.at(1) + 0.4), [Flycam], size: 9pt)

    // Tam giác vuông (Mô hình Toán)
    line(O, D, stroke: (dash: "dashed", paint: rgb("0288d1"), thickness: 1.2pt))
    line(O, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(D, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    // Ký hiệu góc vuông
    line((2.8, 0), (2.8, 0.2), (3, 0.2), stroke: 0.8pt)

    // Nhãn độ dài
    content((1.5, -0.3), $x(t)$)
    content((3.6, 2.0), $h = 40"m"$)
    content((1.3, 2.2), $s(t) = 50"m"$, angle: 53.13deg, fill: rgb("0288d1"))

    // Mũi tên vận tốc phương ngang
    line(D, (D.at(0) + 1.5, D.at(1)), mark: (end: "stealth", fill: orange), stroke: (paint: orange, thickness: 1.5pt))
    content((D.at(0) + 1.0, D.at(1) - 0.3), $v_x = ?$, fill: orange)

    // Mũi tên vận tốc khoảng cách
    let dir = (3 / 5, 4 / 5)
    line(
      D,
      (D.at(0) + 1.2 * dir.at(0), D.at(1) + 1.2 * dir.at(1)),
      mark: (end: "stealth", fill: red),
      stroke: (paint: red, thickness: 1.5pt),
    )
    content((D.at(0) + 0.1, D.at(1) + 1.1), $v_s = 4.8$, fill: red)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      Tiếp tục vận dụng kỹ thuật "Casio thực chiến" cho bài toán hình học động:
      - *Thiết lập ẩn và liên kết:* Lập phương trình Pytago nối khoảng cách ngang $x$, độ cao $h$ (hằng số) và khoảng cách chéo $s$.
      - *Tính giá trị tĩnh:* Tại thời điểm cần xét, dùng Pytago để tìm ngay giá trị độ dài đoạn thẳng còn thiếu.
      - *Đạo hàm ngầm & Bấm máy:* Đạo hàm trực tiếp hai vế phương trình $x^2 + h^2 = s^2$ theo thời gian $t$. Thả toàn bộ số liệu vào phương trình và bấm `SHIFT SOLVE` tìm $v_x$.
    ]

    Gọi $x(t)$ là khoảng cách theo phương ngang từ tay người điều khiển đến hình chiếu của flycam.
    Gọi $s(t)$ là khoảng cách theo đường thẳng từ bộ điều khiển đến flycam.
    Do flycam bay ở độ cao không đổi, ta có một tam giác vuông với độ dài cạnh góc vuông đứng luôn là $h = 40$ m.

    Theo định lý Pytago, ta có phương trình liên kết tại mọi thời điểm $t$:
    $ x^2 + 40^2 = s^2 quad (1) $

    *Bước 1: Tính trạng thái tức thời*
    Tại thời điểm $s = 50$ m, khoảng cách phương ngang $x$ là:
    $ x = sqrt(50^2 - 40^2) = 30 " (m)" $

    *Bước 2: Đạo hàm vận tốc*
    Lấy đạo hàm ngầm hai vế phương trình $(1)$ theo thời gian $t$, ta được:
    $ 2x dot x' + 0 = 2s dot s' quad <=> quad x dot x' = s dot s' $

    Trong đó:
    - $x'$ chính là tốc độ bay theo phương ngang của flycam ($v_x$).
    - $s'$ là tốc độ tăng của khoảng cách đường chéo, theo giả thiết $s' = 4.8$ m/s.

    *Bước 3: Thế số và Casio Solve*
    Thay $x = 30$, $s = 50$ và $s' = 4.8$ vào phương trình đạo hàm:
    $ 30 dot v_x = 50 dot 4.8 $

    Gõ vào máy tính `30X = 50 * 4.8` và bấm `SHIFT SOLVE` (hoặc nhẩm $30 v_x = 240$), ta có:
    $ v_x = 8 " (m/s)" $

    Vậy tại thời điểm đó, flycam đang bay ngang với tốc độ là *$8$* m/s.

    #meo[
      Rất nhiều học sinh nhầm lẫn tốc độ $4.8$ m/s báo trên màn hình điều khiển chính là tốc độ bay của flycam. Thực tế, màn hình chỉ có khả năng đo tốc độ thay đổi tia ngắm (Line of Sight - $s'$). Đạo hàm cho ta thấy: do $s/x = 50/30 > 1$, tốc độ bay ngang thực tế $x'$ luôn lớn hơn tốc độ quét $s'$. Flycam đang bay nhanh hơn con số hiển thị trên ra đa!
    ]
  ],
)
#tln(
  // mode:"loigiai",
  [Một cột đèn đường có bóng đèn được treo cố định ở độ cao $6$ m so với mặt đất nằm ngang. Một người đi bộ cao $1.5$ m đang đi thẳng đều ra xa khỏi chân cột đèn với tốc độ $1.2$ m/s. Ánh sáng từ ngọn đèn chiếu xuống tạo ra bóng của người đó trên mặt đất. Hỏi đỉnh bóng của người đó trên mặt đất đang di chuyển ra xa chân cột đèn với tốc độ bằng bao nhiêu m/s (không làm tròn kết quả)?],
  [$1,6$],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let A = (0, 4) // Đèn (6m -> 4 units)
    let M = (3, 0) // Chân người
    let N = (3, 1) // Đỉnh đầu người (1.5m -> 1 unit)
    let S = (4, 0) // Đỉnh bóng

    // Mặt đất
    line((-1, 0), (6, 0), stroke: (paint: rgb("8d6e63"), thickness: 1.5pt))
    for i in range(-1, 6) { line((i, 0), (i + 0.3, -0.2), stroke: (paint: rgb("8d6e63"), thickness: 0.5pt)) }

    // Cột đèn và Bóng đèn
    line((0, 0), (0, 4), stroke: (paint: rgb("546e7a"), thickness: 2.5pt))
    circle((0, 4), radius: 0.25, fill: rgb("fff59d"), stroke: rgb("fbc02d"))
    // Tia sáng tỏa ra
    line((0, 4.3), (0, 4.6), stroke: rgb("fbc02d"))
    line((0.2, 4.2), (0.4, 4.4), stroke: rgb("fbc02d"))
    line((-0.2, 4.2), (-0.4, 4.4), stroke: rgb("fbc02d"))

    // Người đi bộ
    line(M, N, stroke: (paint: rgb("1e88e5"), thickness: 3pt, cap: "round"))
    circle((3, 1.15), radius: 0.15, fill: rgb("1e88e5"), stroke: none) // Đầu người

    // Tia sáng tạo bóng
    line(A, S, stroke: (dash: "dashed", paint: rgb("fbc02d"), thickness: 1.2pt))

    // Bóng người trên mặt đất
    line(M, S, stroke: (paint: gray, thickness: 2.5pt))
    content((3.5, -0.3), [Bóng])

    // Các mũi tên vận tốc
    line(M, (M.at(0) + 1.2, M.at(1)), mark: (end: "stealth", fill: blue), stroke: (paint: blue, thickness: 1.5pt))
    content((M.at(0) + 0.6, M.at(1) + 0.3), $v_"người" = 1.2$, fill: blue)

    line(S, (S.at(0) + 1.5, S.at(1)), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.5pt))
    content((S.at(0) + 0.8, S.at(1) - 0.3), $v_"bóng" = ?$, fill: red)

    // Kích thước
    line((-0.4, 0), (-0.4, 4), mark: (start: "<", end: ">"), stroke: 0.5pt)
    content((-0.8, 2), $6"m"$)

    line((2.6, 0), (2.6, 1), mark: (start: "<", end: ">"), stroke: 0.5pt)
    content((2.1, 0.5), $1.5"m"$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      Để tính tốc độ đỉnh bóng, ta tiếp tục áp dụng chiến thuật mô hình hóa và đạo hàm:
      - *Chọn ẩn số tọa độ:* Gọi $x$ là tọa độ của người (khoảng cách từ cột đèn đến người), $y$ là tọa độ đỉnh bóng (khoảng cách từ cột đèn đến đỉnh bóng).
      - *Lập phương trình liên kết:* Dùng định lý Thales trong tam giác vuông để tìm mối liên hệ trực tiếp giữa $x$ và $y$.
      - *Đạo hàm 2 vế:* Lấy đạo hàm ngầm theo thời gian $t$. Tốc độ người là $v_x = x'$, tốc độ đỉnh bóng là $v_y = y'$.
      - *Thay số & Bấm máy:* Thả số liệu vào phương trình đạo hàm để tìm $y'$.
    ]

    Gắn trục tọa độ $O x$ dọc theo mặt đất, gốc $O$ tại chân cột đèn.
    Tại thời điểm $t$, gọi:
    - $x(t)$ là khoảng cách từ chân cột đèn đến người đi bộ.
    - $y(t)$ là khoảng cách từ chân cột đèn đến đỉnh bóng.
    (Khi đó, chiều dài của cái bóng trên mặt đất chính là đoạn $y - x$).

    *1. Lập phương trình liên kết (dùng định lý Thales):*
    Xét tam giác tạo bởi tia sáng, cột đèn và mặt đất, người đi bộ đứng song song với cột đèn nên ta có hệ thức Thales:
    $ ("Chiều cao người") / ("Chiều cao đèn") = ("Chiều dài bóng") / ("Khoảng cách từ đèn đến đỉnh bóng") $
    $ <=> 1.5 / 6 = (y - x) / y $
    Rút gọn phân số $1.5 / 6 = 1/4$, ta được phương trình:
    $ 1/4 = (y - x)/y quad <=> quad y = 4(y - x) quad <=> quad 4x = 3y quad (1) $

    *2. Đạo hàm và thay số:*
    Đạo hàm hai vế phương trình $(1)$ theo thời gian $t$:
    $ 4 dot x' = 3 dot y' $

    Trong đó:
    - $x'$ là tốc độ của người đi bộ, đề cho $x' = 1.2$ m/s.
    - $y'$ là tốc độ di chuyển của đỉnh bóng cần tìm ($v_y$).

    Thay $x' = 1.2$ vào, ta có:
    $ 4 dot 1.2 = 3 dot y' quad <=> quad 4.8 = 3 y' quad => quad y' = 4.8/3 = 1.6 " (m/s)" $

    Vậy tốc độ di chuyển của đỉnh bóng là *$1,6$* m/s.

    #align(center)[
      #cetz.canvas(length: 1.0cm, {
        import cetz.draw: *
        let O = (0, 0)
        let A = (0, 4)
        let M = (3, 0)
        let N = (3, 1)
        let S = (4, 0)

        line(O, A, stroke: 1.5pt)
        line(O, S, stroke: 1.5pt)
        line(A, S, stroke: (dash: "dashed", paint: red))
        line(M, N, stroke: (paint: blue, thickness: 1.5pt))

        circle(O, radius: 1.5pt, fill: black)
        content((-0.3, -0.3), $O$)
        circle(A, radius: 1.5pt, fill: black)
        content((-0.3, 4), $A$)
        circle(M, radius: 1.5pt, fill: black)
        content((3, -0.4), $M$)
        circle(N, radius: 1.5pt, fill: black)
        content((3.3, 1.2), $N$)
        circle(S, radius: 1.5pt, fill: black)
        content((4, -0.4), $S$)

        // Góc vuông
        line((0.2, 0), (0.2, 0.2), (0, 0.2), stroke: 0.5pt)
        line((2.8, 0), (2.8, 0.2), (3, 0.2), stroke: 0.5pt)

        content((-0.4, 2), $6$)
        content((2.6, 0.5), $1.5$)
        content((1.5, -0.4), $x(t)$)
        content((3.5, -0.4), $y(t) - x(t)$)

        line((0, -0.8), (4, -0.8), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((2, -1.2), $y(t)$)
      })
    ]

    #nhanxet[
      Bạn có nhận ra điều thú vị của bài toán này không? Khác với bài chiếc thang hay radar mà hệ số góc luôn thay đổi theo thời gian, ở bài toán cái bóng này, mối quan hệ giữa $x$ và $y$ là *tuyến tính* ($3y = 4x$). Điều này dẫn đến đạo hàm của chúng là hằng số ($y' = 4/3 x'$). Nghĩa là, bất kể người đó đứng gần hay xa cột đèn, đỉnh bóng *luôn luôn* di chuyển với một vận tốc cố định là $1.6$ m/s, miễn là người đó giữ đều nhịp bước $1.2$ m/s!
    ]
  ],
)

#tln(
  // mode: "loigiai",
  [Một tấm bảng hiệu quảng cáo hình bán nguyệt có đường kính $A B = 5$ m. Tấm bảng được đặt dựng đứng sao cho đường kính $A B$ tựa vào góc tạo bởi một bức tường thẳng đứng và mặt sàn ngang (đỉnh $A$ trượt trên mặt sàn, đỉnh $B$ trượt dọc theo bức tường). Điểm $C$ là điểm cao nhất trên cung tròn của tấm bảng (cách $A B$ một đoạn bằng bán kính $2.5$ m). Trong quá trình trượt, mặt phẳng của tấm bảng luôn song song với bức tường bên cạnh và điểm $C$ luôn hướng ra xa góc tường. Tại thời điểm chân $A$ cách góc tường $3$ m, đỉnh $A$ đang trượt ra xa với tốc độ không đổi $v_A = 0.8$ m/s. Hỏi tại thời điểm đó, tốc độ di chuyển của điểm $C$ so với mặt sàn bằng bao nhiêu m/s (làm tròn kết quả đến hàng phần trăm)?],
  [$0.14$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let xA = 3.0
    let yB = 4.0
    let A = (xA, 0)
    let B = (0, yB)

    let I = (xA / 2, yB / 2)
    let C = (xA / 2 + yB / 2, yB / 2 + xA / 2)

    // Sàn nhà
    line((-1, 0), (6.5, 0), stroke: 1pt)
    line((-0.5, -0.2), (6.0, -0.2), stroke: 0.5pt)
    for i in range(-1, 7) { line((i, 0), (i - 0.2, -0.2), stroke: 0.5pt) }
    content((5.5, -0.4), [Sàn nhà], size: 9pt)

    // Bức tường
    line((0, -0.5), (0, 6.0), stroke: 1pt)
    line((-0.2, -0.5), (-0.2, 5.8), stroke: 0.5pt)
    for i in range(0, 6) { line((0, i), (-0.2, i + 0.2), stroke: 0.5pt) }
    content((-0.8, 5), [Bức tường], angle: 90deg, size: 9pt)

    // Bảng bán nguyệt
    let pts = ()
    let start-ang = -53.13deg
    for i in range(0, 181, step: 5) {
      let ang = start-ang + i * 1deg
      let px = I.at(0) + 2.5 * calc.cos(ang)
      let py = I.at(1) + 2.5 * calc.sin(ang)
      pts.push((px, py))
    }
    line(..pts, close: true, fill: rgb("e1f5fe"), stroke: 1.2pt)

    // Các đường nét phụ
    line(A, B, stroke: (dash: "dashed", paint: rgb("0288d1"), thickness: 1pt))
    line(I, C, stroke: (dash: "dashed", paint: rgb("0288d1"), thickness: 1pt))

    // Ký hiệu góc vuông tại I
    let dirIA = (1.5, -2.0)
    let len = 0.25
    let uIA = (dirIA.at(0) * len / 2.5, dirIA.at(1) * len / 2.5)
    let dirIC = (2.0, 1.5)
    let uIC = (dirIC.at(0) * len / 2.5, dirIC.at(1) * len / 2.5)
    let P1 = (I.at(0) + uIA.at(0), I.at(1) + uIA.at(1))
    let P2 = (I.at(0) + uIC.at(0), I.at(1) + uIC.at(1))
    let P3 = (I.at(0) + uIA.at(0) + uIC.at(0), I.at(1) + uIA.at(1) + uIC.at(1))
    line(P1, P3, P2, stroke: 0.8pt)

    // Mũi tên vận tốc A
    line(A, (xA + 1.2, 0), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
    content((xA + 0.6, 0.3), $v_A$, fill: red)

    // Kích thước
    content((1.5, -0.3), $x$, size: 9pt)
    content((-0.3, 2), $y$, size: 9pt)

    // Nhãn điểm
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-west", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "south-east", padding: 4pt)
    circle(C, radius: 1.5pt, fill: black)
    content(C, $C$, anchor: "south", padding: 4pt)
    circle(I, radius: 1.5pt, fill: black)
    content(I, $I$, anchor: "north-east", padding: 4pt)
    circle(O, radius: 1.5pt, fill: black)
    content(O, $O$, anchor: "north-east", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - Mô hình hoá: Gắn hệ trục tọa độ vuông góc $O x y$, $O$ là giao điểm của sàn và tường. $A(x; 0)$, $B(0; y)$ với $x, y > 0$.
      - Chiều dài đường kính $A B = 5$, phương trình liên kết $x^2 + y^2 = 25$.
      - Xác định tọa độ $C$: Thông qua tọa độ trung điểm $I$ của $A B$ và vectơ pháp tuyến vuông góc với $A B$ hướng ra ngoài.
      - Vận tốc: Đạo hàm tọa độ $C$ theo thời gian $t$ để tìm $x_C'$ và $y_C'$.
      - Tốc độ của $C$ là độ lớn vectơ vận tốc: $v_C = sqrt((x_C')^2 + (y_C')^2)$.
    ]

    Gọi tọa độ tại thời điểm $t$ là $A(x; 0)$ và $B(0; y)$ (với $x, y > 0$).
    Theo định lý Pytago ta có:
    $ x^2 + y^2 = 5^2 = 25 $
    Đạo hàm hai vế theo thời gian $t$:
    $ 2x dot x' + 2y dot y' = 0 <=> y' = -x/y dot x' $

    Tọa độ trung điểm $I$ của đoạn $A B$ là $I(0.5x; 0.5y)$.
    Vectơ $vect(A B) = (-x; y)$. Vectơ đơn vị vuông góc với $A B$ và hướng ra ngoài góc $O$ là $vect(n) = (y/5; x/5)$.
    Điểm $C$ nằm trên đường trung trực của $A B$, cách $I$ một đoạn bằng bán kính $R = 2.5$. Suy ra:
    $ vect(I C) = 2.5 vect(n) = 2.5 (y/5; x/5) = (0.5y; 0.5x) $
    Tọa độ của $C$ là:
    $
      x_C = x_I + 0.5y = 0.5x + 0.5y = 0.5(x + y) \
      y_C = y_I + 0.5x = 0.5y + 0.5x = 0.5(x + y)
    $
    Đạo hàm tọa độ $C$ theo thời gian $t$:
    $
      x_C' = 0.5(x' + y') \
      y_C' = 0.5(x' + y')
    $

    Tại thời điểm $x = 3$ m, ta có $y = sqrt(25 - 3^2) = 4$ m.
    Tốc độ trượt của $A$ là $x' = 0.8$ m/s. Thay vào biểu thức của $y'$:
    $ y' = -3/4 dot 0.8 = -0.6 " (m/s)" $
    Thay $x'$ và $y'$ vào thành phần vận tốc của $C$:
    $
      x_C' = 0.5(0.8 - 0.6) = 0.1 " (m/s)" \
      y_C' = 0.5(0.8 - 0.6) = 0.1 " (m/s)"
    $

    Tốc độ di chuyển của điểm $C$ so với mặt sàn là:
    $ v_C = sqrt((x_C')^2 + (y_C')^2) = sqrt(0.1^2 + 0.1^2) = 0.1 sqrt(2) approx 0.1414 " (m/s)" $
    Làm tròn kết quả đến hàng phần trăm, ta được $0.14$ m/s.

    #nhanxet[
      Nhờ $x_C = y_C$, ta phát hiện ra một tính chất hình học độc đáo: Điểm cao nhất của tấm bảng bán nguyệt luôn di chuyển trên tia phân giác của góc vuông $O$. Việc phân tích qua cơ sở vectơ giúp bài toán động học vật rắn trở nên vô cùng đơn giản.
    ]
  ],
)
#tln(
  [Có một khối lăng trụ tam giác như hình vẽ, có thiết diện là tam giác vuông $A B C$ có các cạnh là $A B = 260 " cm"$, $B C = 100 " cm"$, $C A = 240 " cm"$. Đỉnh $A$ di chuyển trên sàn nhà theo phương vuông góc với bức tường, đỉnh $B$ di chuyển trên tường theo phương vuông góc với sàn nhà. Biết rằng bức tường và sàn nhà vuông góc với nhau. Ở một thời điểm, khi mà đỉnh $A$ đang cách chân tường một đoạn bằng $100 " cm"$ thì nó di chuyển với tốc độ bằng $v_A = 3,9 " cm/s"$, hỏi tốc độ thay đổi của khoảng cách từ đỉnh $C$ đến sàn nhà bằng bao nhiêu cm/s (_làm tròn kết quả đến hàng phần trăm_)?],
  [$0$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let A = (-3, 0)
    let B = (0, 2)
    let C = (-1.6, 2.3)

    let vx = 3.5
    let vy = 1.0
    let Op = (vx, vy)
    let Ap = (A.at(0) + vx, A.at(1) + vy)
    let Bp = (B.at(0) + vx, B.at(1) + vy)
    let Cp = (C.at(0) + vx, C.at(1) + vy)

    // Sàn nhà
    line((-4.5, 0), O, Op, (-4.5 + vx, vy), close: true, fill: rgb("e0f2f1"), stroke: 0.5pt)
    content((-3.75, 0.2), [Sàn nhà], anchor: "south", size: 9pt)

    // Bức tường
    line((0, -0.5), (0, 3.8), (vx, 3.8 + vy), (vx, -0.5 + vy), close: true, fill: rgb("e0e0e0"), stroke: 0.5pt)
    content((4.25, 3.3), [Bức tường], angle: 16deg, size: 9pt)

    // Trục tọa độ (chân tường)
    line(O, A, stroke: 1pt)
    line(O, B, stroke: 1pt)
    line(O, Op, stroke: (dash: "dashed", paint: gray))
    line(A, (-4, 0), mark: (end: ">"), stroke: 1pt)

    // Khối lăng trụ - Mặt sau
    line(Ap, Bp, stroke: (dash: "dashed", thickness: 1pt))
    line(Ap, Cp, stroke: (dash: "dashed", thickness: 1pt))
    line(Bp, Cp, stroke: (dash: "dashed", thickness: 1pt))
    line(A, Ap, stroke: (dash: "dashed", paint: gray))
    line(B, Bp, stroke: (dash: "dashed", paint: gray))
    line(C, Cp, stroke: (dash: "dashed", paint: gray))

    // Nét đứt hình chiếu
    line(C, (-1.6, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line(Cp, (-1.6 + vx, vy), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))

    // Mặt trước
    line(A, B, C, close: true, fill: rgb("f5e6d3"), stroke: 1pt)

    // Ký hiệu góc vuông
    line((-0.2, 0), (-0.2, 0.2), (0, 0.2), stroke: 0.5pt)
    line((-1.42, 2.15), (-1.53, 1.95), (-1.71, 2.05), stroke: 0.5pt)

    // Text lengths
    content((-1.3, 0.8), $260$, angle: 34deg, size: 9pt)
    content((-2.5, 1.3), $240$, size: 9pt)
    content((-0.6, 2.25), $100$, angle: -15deg, size: 9pt)

    // Points
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "north-west", padding: 4pt)
    circle(C, radius: 1.5pt, fill: black)
    content(C, $C$, anchor: "south-east", padding: 4pt)
    circle(O, radius: 1.5pt, fill: black)
    content(O, $O$, anchor: "north-east", padding: 4pt)
  }),
  fig-pos: "center",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - *Sửa lỗi OCR:* Dựa vào dữ kiện bộ ba số Pytago tạo nghiệm nguyên đẹp và khớp hình vẽ, dữ kiện đề bài chính xác là cách chân tường $100 " cm"$ (không phải $150 " cm"$).
      - Gắn hệ trục tọa độ vuông góc $O x y$, với $O$ là giao tuyến của sàn nhà và bức tường. Tia $O x$ nằm trên sàn nhà (chứa $A$), tia $O y$ nằm trên bức tường (chứa $B$).
      - Dựa vào các hệ thức lượng trong tam giác vuông, thiết lập biểu thức tính khoảng cách từ đỉnh $C$ đến sàn nhà (tức là tung độ $y_C$) theo hoành độ $x$ của $A$ và tung độ $y$ của $B$.
      - Sử dụng hệ thức Pytago $x^2 + y^2 = A B^2$ để liên hệ vận tốc $x'$ và $y'$.
      - Tính đạo hàm $y_C'$ theo thời gian $t$ và thay các giá trị tại thời điểm khảo sát để tìm tốc độ thay đổi.
    ]

    Chọn hệ trục tọa độ $O x y$ với $O$ là góc vuông giữa sàn và tường. Giả sử $A(x; 0)$ và $B(0; y)$ với $x, y > 0$.
    Do $A B = 260$ nên ta có phương trình quỹ đạo:
    $ x^2 + y^2 = 260^2 $
    Lấy đạo hàm hai vế theo thời gian $t$, ta được mối liên hệ vận tốc:
    $ 2x dot x' + 2y dot y' = 0 <=> y' = -x/y dot x' $

    Gọi $alpha$ là góc hợp bởi đoạn $A B$ và mặt sàn ($alpha = angle B A O$). Ta có:
    $ sin alpha = y/260, quad cos alpha = x/260 $
    Trong tam giác vuông $A B C$ (vuông tại $C$), đặt $beta = angle C A B$. Ta có:
    $ cos beta = (A C)/(A B) = 240/260 = 12/13, quad sin beta = (B C)/(A B) = 100/260 = 5/13 $
    Đường thẳng $A C$ hợp với mặt sàn một góc $alpha + beta$. Khoảng cách từ $C$ đến mặt sàn chính là tung độ của $C$, được tính bằng:
    $
      y_C & = y_A + A C dot sin(alpha + beta) \
          & = 0 + 240(sin alpha cos beta + cos alpha sin beta) \
          & = 240 ( y/260 dot 12/13 + x/260 dot 5/13 ) \
          & = 12/13 ( (12y + 5x)/13 ) = (60x + 144y)/169
    $
    Lấy đạo hàm hai vế theo thời gian $t$, tốc độ thay đổi khoảng cách từ $C$ đến sàn nhà là:
    $ y_C' = (60x' + 144y')/169 $

    Tại thời điểm $A$ cách chân tường $100 " cm"$, ta có $x = 100$.
    Suy ra $y = sqrt(260^2 - 100^2) = 240 " cm"$.
    Tốc độ đỉnh $A$ di chuyển là $x' = 3,9 " cm/s"$. Thay vào biểu thức của $y'$:
    $ y' = -100/240 dot 3,9 = -1,625 " (cm/s)" $
    Thay $x'$ và $y'$ vào biểu thức tính đạo hàm $y_C'$:
    $ y_C' = (60 dot 3,9 + 144 dot (-1,625))/169 = (234 - 234)/169 = 0 " (cm/s)" $
    Vậy tốc độ thay đổi của khoảng cách từ đỉnh $C$ đến sàn nhà bằng $0 " cm/s"$.

    #nhanxet[
      Về mặt vật lý học và hình học, đây là một thời điểm đặc biệt khi độ cao của đỉnh $C$ đạt đến giá trị lớn nhất (cực đại) hoặc nhỏ nhất (cực tiểu) trong suốt quá trình trượt. Tại điểm cực trị, đạo hàm tức thời (tốc độ thay đổi) triệt tiêu và bằng $0$.
    ]
  ],
)

#tln(
  [Một tấm kim loại phẳng có dạng tam giác vuông $A B C$ tại $C$, với các kích thước $A C = 30 " cm"$, $B C = 40 " cm"$, $A B = 50 " cm"$. Tấm kim loại được đặt sao cho đỉnh $A$ trượt trên mặt sàn ngang, đỉnh $B$ trượt dọc theo một bức tường thẳng đứng (bức tường vuông góc với mặt sàn). Biết rằng trong quá trình trượt, đỉnh $C$ luôn hướng ra phía ngoài (nằm khác phía với góc tường so với đường thẳng $A B$). Ở một thời điểm, khi đỉnh $A$ cách chân tường $30 " cm"$ thì nó đang di chuyển ra xa chân tường với tốc độ $2 " cm/s"$. Hỏi lúc này, tốc độ thay đổi khoảng cách từ đỉnh $C$ đến mặt sàn bằng bao nhiêu cm/s (_làm tròn kết quả đến hàng phần trăm_)?],
  [$0,42$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let xA = 3.0
    let yB = 4.0
    let A = (xA, 0)
    let B = (0, yB)

    // Toạ độ C
    let C = (3.84, 2.88)

    // Sàn nhà
    line((-1, 0), (6, 0), stroke: 1pt)
    line((-0.5, -0.2), (5.5, -0.2), stroke: 0.5pt)
    for i in range(-1, 6) { line((i, 0), (i - 0.2, -0.2), stroke: 0.5pt) }
    content((4.5, -0.4), [Sàn nhà], size: 9pt)

    // Bức tường
    line((0, -0.5), (0, 5), stroke: 1pt)
    line((-0.2, -0.5), (-0.2, 4.8), stroke: 0.5pt)
    for i in range(0, 5) { line((0, i), (-0.2, i + 0.2), stroke: 0.5pt) }
    content((-0.8, 4), [Bức tường], angle: 90deg, size: 9pt)

    // Tấm kim loại
    line(A, B, C, close: true, fill: rgb("ffe0b2"), stroke: 1.2pt)

    // Ký hiệu góc vuông tại C
    let dirCA = (-0.28, -0.96)
    let dirCB = (-0.96, 0.28)
    let P1 = (C.at(0) + 0.25 * dirCA.at(0), C.at(1) + 0.25 * dirCA.at(1))
    let P2 = (C.at(0) + 0.25 * dirCB.at(0), C.at(1) + 0.25 * dirCB.at(1))
    let P3 = (C.at(0) + 0.25 * dirCA.at(0) + 0.25 * dirCB.at(0), C.at(1) + 0.25 * dirCA.at(1) + 0.25 * dirCB.at(1))
    line(P1, P3, P2, stroke: 0.8pt)

    // Trục / đường gióng
    line(O, A, stroke: (paint: gray, thickness: 1pt))
    line(O, B, stroke: (paint: gray, thickness: 1pt))

    // Mũi tên vận tốc A
    line(A, (xA + 1.2, 0), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
    content((xA + 0.6, 0.3), $v_A$, fill: red)

    // Kích thước
    content((1.5, -0.3), $30$, size: 9pt)
    content((-0.3, 2), $y$, size: 9pt)

    // Nhãn điểm
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-west", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "south-east", padding: 4pt)
    circle(C, radius: 1.5pt, fill: black)
    content(C, $C$, anchor: "south-west", padding: 4pt)
    circle(O, radius: 1.5pt, fill: black)
    content(O, $O$, anchor: "north-east", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - *Mô hình hoá:* Gắn hệ trục tọa độ vuông góc $O x y$, với $O$ là giao điểm của sàn và tường. Tia $O x$ nằm trên mặt sàn, tia $O y$ nằm dọc bức tường hướng lên.
      - *Toạ độ hoá:* Gọi $A(x; 0)$ và $B(0; y)$ với $x, y > 0$. Chiều dài cạnh huyền $A B = 50$, ta có phương trình liên kết $x^2 + y^2 = 50^2$.
      - *Thiết lập hàm số:* Dùng các phép chiếu vectơ hoặc hệ thức lượng để tìm biểu thức tung độ $y_C$ (khoảng cách từ $C$ đến sàn) theo biến $x$ và $y$.
      - *Ứng dụng đạo hàm:* Đạo hàm phương trình liên kết theo thời gian $t$ để tìm $y'$ từ $x'$. Sau đó, đạo hàm hàm $y_C(t)$ để tính tốc độ thay đổi của độ cao điểm $C$.
    ]

    Gọi toạ độ các điểm tại thời điểm $t$ là $A(x; 0)$ và $B(0; y)$ (với $x, y > 0$).
    Theo định lý Pytago trong tam giác vuông $O A B$:
    $ x^2 + y^2 = A B^2 = 50^2 = 2500 $
    Đạo hàm hai vế theo thời gian $t$, ta được mối liên hệ giữa các vận tốc:
    $ 2x dot x' + 2y dot y' = 0 <=> y' = -x/y dot x' $

    Gọi $vect(u)$ là vectơ đơn vị dọc theo hướng $vect(A B)$, ta có $vect(A B) = (-x; y)$ nên $vect(u) = (-x/50; y/50)$.
    Vectơ đơn vị vuông góc với $vect(u)$ và hướng ra ngoài góc $O$ là $vect(v) = (y/50; x/50)$ (do $vect(u) dot vect(v) = 0$ và hoành độ, tung độ của $vect(v)$ đều dương).

    Trong tam giác vuông $A B C$ (vuông tại $C$), kẻ đường cao $C H$ xuống $A B$. Dễ tính được:
    $ A H = (A C^2)/(A B) = 30^2/50 = 18, quad H C = (A C dot B C)/(A B) = (30 dot 40)/50 = 24 $
    Do đó, vectơ $vect(A C)$ được biểu diễn theo hệ cơ sở $(vect(u), vect(v))$ là:
    $
      vect(A C) & = 18 vect(u) + 24 vect(v) \
                & = 18 (-x/50; y/50) + 24 (y/50; x/50) \
                & = ((-18x + 24y)/50; (18y + 24x)/50)
    $
    Tung độ của điểm $C$ (chính là khoảng cách từ $C$ đến mặt sàn) là:
    $ y_C = y_A + (18y + 24x)/50 = 0 + (9y + 12x)/25 = (9y + 12x)/25 $
    Đạo hàm $y_C$ theo thời gian $t$, ta được tốc độ thay đổi khoảng cách từ $C$ xuống sàn:
    $ y_C' = (9y' + 12x')/25 $

    Tại thời điểm $x = 30 " cm"$, ta có $y = sqrt(50^2 - 30^2) = 40 " cm"$.
    Tốc độ trượt của $A$ là $x' = 2 " cm/s"$. Thay vào biểu thức của $y'$:
    $ y' = -30/40 dot 2 = -1,5 " (cm/s)" $
    Thay $x'$ và $y'$ vào biểu thức $y_C'$:
    $ y_C' = (9 dot (-1,5) + 12 dot 2)/25 = (-13,5 + 24)/25 = 10,5/25 = 0,42 " (cm/s)" $
    Vậy tốc độ thay đổi của khoảng cách từ đỉnh $C$ đến sàn nhà bằng $0,42 " cm/s"$.

    #nhanxet[
      Sử dụng chuẩn cú pháp Typst $vect(A B)$ thay cho LaTeX giúp mã nguồn đồng nhất, dễ biên dịch và hạn chế lỗi font khi render. Việc áp dụng vectơ cơ sở là công cụ đại số tuyến tính tuyệt vời để giải quyết các bài toán động học phẳng.
    ]
  ],
)

#tln(
  [Một chiếc thang thẳng $A B$ dài $5 " m"$ được đặt dựa vào một bức tường thẳng đứng, chân thang $A$ nằm trên mặt sàn ngang, đỉnh thang $B$ tựa trên tường. Một con mèo đang ngồi yên tại điểm $M$ trên chiếc thang sao cho khoảng cách từ chân thang $A$ đến mèo là $2 " m"$. Chân thang $A$ đột nhiên bị trượt ra xa tường với tốc độ không đổi là $0,4 " m/s"$, đỉnh $B$ trượt dọc theo bức tường xuống dưới. Hỏi tại thời điểm chân thang cách góc tường $3 " m"$, tốc độ di chuyển của con mèo đối với mặt sàn bằng bao nhiêu cm/s (_làm tròn kết quả đến hàng phần trăm_)?],
  [$26,83$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let xA = 3.0
    let yB = 4.0
    let A = (xA, 0)
    let B = (0, yB)

    // Toạ độ M (chia tỉ lệ 2:3 từ A đến B)
    let M = (0.6 * xA, 0.4 * yB)

    // Sàn nhà
    line((-1, 0), (4.5, 0), stroke: 1pt)
    line((-0.5, -0.2), (4.0, -0.2), stroke: 0.5pt)
    for i in range(-1, 5) { line((i, 0), (i - 0.2, -0.2), stroke: 0.5pt) }
    content((3.5, -0.4), [Sàn nhà], size: 9pt)

    // Bức tường
    line((0, -0.5), (0, 4.5), stroke: 1pt)
    line((-0.2, -0.5), (-0.2, 4.3), stroke: 0.5pt)
    for i in range(0, 5) { line((0, i), (-0.2, i + 0.2), stroke: 0.5pt) }
    content((-0.8, 3.5), [Bức tường], angle: 90deg, size: 9pt)

    // Chiếc thang
    line(A, B, stroke: (paint: rgb("8d6e63"), thickness: 2.5pt))

    // Mũi tên vận tốc A
    line(A, (xA + 0.8, 0), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
    content((xA + 0.4, 0.3), $v_A$, fill: red)

    // Mũi tên vận tốc B
    line(B, (0, yB - 0.8), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
    content((0.3, yB - 0.4), $v_B$, fill: red)

    // Điểm M (con mèo)
    circle(M, radius: 2pt, fill: orange)
    content((M.at(0) + 0.3, M.at(1) + 0.3), $M$, fill: orange)

    // Kích thước
    content((1.5, -0.3), $x$, size: 9pt)
    content((-0.3, 2), $y$, size: 9pt)

    // Nhãn điểm
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-west", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "south-east", padding: 4pt)
    circle(O, radius: 1.5pt, fill: black)
    content(O, $O$, anchor: "north-east", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - Gắn hệ trục tọa độ vuông góc $O x y$, với $O$ là giao điểm của mặt sàn và bức tường. Tia $O x$ nằm trên mặt sàn, tia $O y$ hướng thẳng đứng lên trên.
      - Gọi toạ độ các điểm là $A(x; 0)$ và $B(0; y)$. Dùng định lý Pytago thiết lập phương trình liên kết $x^2 + y^2 = l^2$.
      - Dùng định lý Ta-lét hoặc phép toán vectơ để tìm toạ độ điểm $M(x_M; y_M)$ theo $x$ và $y$.
      - Lấy đạo hàm các phương trình toạ độ theo thời gian $t$ để tìm thành phần vận tốc $x_M'$ và $y_M'$.
      - Tốc độ của điểm $M$ là độ lớn của vectơ vận tốc: $v_M = sqrt((x_M')^2 + (y_M')^2)$.
    ]

    Gọi toạ độ tại thời điểm $t$ của chân thang là $A(x; 0)$ và đỉnh thang là $B(0; y)$ (với $x, y > 0$).
    Chiều dài thang là $A B = 5 " m"$. Theo định lý Pytago ta có:
    $ x^2 + y^2 = 25 $
    Đạo hàm hai vế theo thời gian $t$, ta được:
    $ 2x dot x' + 2y dot y' = 0 <=> y' = -x/y dot x' $

    Điểm $M$ nằm trên đoạn $A B$ sao cho $A M = 2 " m"$, suy ra $vect(A M) = 2/5 vect(A B)$.
    Áp dụng công thức toạ độ điểm chia đoạn thẳng, ta có:
    $
      x_M = x + 2/5 (0 - x) = 3/5 x = 0,6 x \
      y_M = 0 + 2/5 (y - 0) = 2/5 y = 0,4 y
    $
    Đạo hàm toạ độ $M$ theo thời gian $t$, ta thu được các thành phần vận tốc của $M$:
    $
      x_M' = 0,6 x' \
      y_M' = 0,4 y'
    $

    Tại thời điểm $x = 3 " m"$, ta có $y = sqrt(25 - 3^2) = 4 " m"$.
    Vận tốc trượt của $A$ là $x' = 0,4 " m/s"$. Thay vào phương trình liên kết vận tốc của $A$ và $B$:
    $ y' = -3/4 dot 0,4 = -0,3 " (m/s)" $
    Thay các giá trị $x'$ và $y'$ vào biểu thức vận tốc của $M$:
    $
      x_M' = 0,6 dot 0,4 = 0,24 " (m/s)" \
      y_M' = 0,4 dot (-0,3) = -0,12 " (m/s)"
    $

    Tốc độ di chuyển của con mèo $M$ đối với mặt sàn là:
    $ v_M = sqrt((x_M')^2 + (y_M')^2) = sqrt(0.24^2 + (-0.12)^2) = sqrt(0.072) approx 0,2683 " (m/s)" $
    Đổi đơn vị sang cm/s, ta được $v_M approx 26,83 " cm/s"$.

    Vậy tốc độ di chuyển của con mèo là $26,83 " cm/s"$.

    #nhanxet[
      Quỹ đạo của điểm $M$ trong quá trình thang trượt thực chất là một cung elip có phương trình $x_M^2/3^2 + y_M^2/2^2 = 1$. Việc sử dụng đạo hàm hàm hợp theo tham số thời gian $t$ giúp ta tính toán tức thời mà không cần xây dựng phương trình quỹ đạo tiếp tuyến phức tạp, minh chứng cho tính ưu việt của công cụ giải tích trong động học.
    ]
  ],
)

// #tln(
//   [Một tấm kim loại hình chữ nhật $A B C D$ có chiều dài $A B = 80 " cm"$ và chiều rộng $B C = 60 " cm"$. Tấm kim loại được đặt dựng đứng sao cho cạnh $A B$ nằm trên mặt sàn ngang và cạnh $A D$ tựa sát vào bức tường thẳng đứng (góc tường tại $A$ vuông góc). Người ta bắt đầu kéo đỉnh $B$ trượt trên mặt sàn ra xa bức tường với tốc độ không đổi $v_B = 5 " cm/s"$, đỉnh $D$ trượt dọc xuống dưới trên bức tường. Gọi $M$ là trung điểm của đoạn thẳng $C D$. Hỏi tại thời điểm đỉnh $D$ cách mặt sàn $36 " cm"$, tốc độ biến thiên khoảng cách từ điểm $M$ đến góc tường $A$ bằng bao nhiêu cm/s (_làm tròn kết quả đến hàng phần trăm_)?],
//   [$0$],
//   fig: cetz.canvas(length: 1cm, {
//     import cetz.draw: *
//     let xB = 6.4
//     let yD = 4.8
//     let A = (0, 0)
//     let B = (xB, 0)
//     let D = (0, yD)
//     let C = (xB, yD)
//     let M = (xB / 2, yD)

//     // Sàn và tường
//     line((-0.5, 0), (8, 0), stroke: 1pt)
//     line((0, -0.5), (0, 6), stroke: 1pt)

//     // Hình chữ nhật ABCD
//     rect(A, C, stroke: (paint: rgb("5d4037"), thickness: 1.5pt), fill: rgb("efebe9"))

//     // Điểm M
//     circle(M, radius: 2pt, fill: orange)
//     content(M, $M$, anchor: "south", padding: 3pt)

//     // Vận tốc vB
//     line(B, (xB + 1.2, 0), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
//     content((xB + 0.6, 0.3), $v_B$, fill: red)

//     // Kích thước
//     content((xB / 2, -0.4), $80$, size: 9pt)
//     content((-0.4, yD / 2), $60$, size: 9pt)

//     // Nhãn điểm
//     circle(A, radius: 1.5pt, fill: black)
//     content(A, $A$, anchor: "north-east")
//     circle(B, radius: 1.5pt, fill: black)
//     content(B, $B$, anchor: "north-west")
//     circle(D, radius: 1.5pt, fill: black)
//     content(D, $D$, anchor: "south-east")
//     circle(C, radius: 1.5pt, fill: black)
//     content(C, $C$, anchor: "south-west")
//   }),
//   fig-pos: "right",
//   fig-width: 40%,
//   loigiai: [
//     #ppgiai[
//       - Gắn hệ trục tọa độ $O x y$ trùng với góc tường $A$, tia $A x$ nằm trên mặt sàn, tia $A y$ dọc theo bức tường[cite: 1, 2].
//       - Tọa độ các đỉnh: $A(0; 0)$, $B(x; 0)$, $D(0; y)$. Do $A B C D$ là hình chữ nhật nên $A B = D C = 80$ và $A D = B C = 60$. Tuy nhiên, khi trượt, độ dài các cạnh không đổi nhưng vị trí $B, D$ thay đổi sao cho $B$ luôn nằm trên $O x$ và $D$ luôn trên $O y$[cite: 1, 5].
//       - Lưu ý: Trong bài toán vật rắn biến dạng vị trí này, thực tế đoạn liên kết cố định là đường chéo $B D = sqrt(80^2 + 60^2) = 100 " cm"$.
//       - Khoảng cách $d = A M = sqrt(x_M^2 + y_M^2)$. Tốc độ biến thiên là đạo hàm $d'$ theo thời gian $t$[cite: 1, 2].
//     ]
//     Thiết lập tọa độ: $A(0; 0)$, $B(x; 0)$, $D(0; y)$. Vì $A B C D$ là hình chữ nhật nên đường chéo $B D$ có độ dài không đổi: $x^2 + y^2 = 100^2$.
//     Đạo hàm: $2x x' + 2y y' = 0 <=> y' = -x/y x'$.

//     Tọa độ đỉnh $C$ là $(x; y)$. Vì $M$ là trung điểm $C D$ và $D(0; y)$, $C(x; y)$ nên:
//     $ M = ( (x+0)/2 ; (y+y)/2 ) = (x/2 ; y) $
//     Khoảng cách $d$ từ $M$ đến $A(0; 0)$ là: $d = sqrt((x/2)^2 + y^2) = sqrt(x^2/4 + y^2)$.
//     Đạo hàm theo thời gian $t$:
//     $ d' = (x/2 x' + 2y y') / (2 sqrt(x^2/4 + y^2)) $

//     Tại thời điểm $y = 36$, ta có $x = sqrt(100^2 - 36^2) = 92$.
//     Vận tốc $x' = 5$. Suy ra $y' = -92/36 dot 5 = -115/9$.
//     Thay vào biểu thức $d'$:
//     $
//       d' = (92/2 dot 5 + 2 dot 36 dot (-115/9)) / (2 sqrt(92^2/4 + 36^2)) = (230 - 920) / (2 sqrt(2116 + 1296)) = -690 / (2 sqrt(3412)) approx -5.91
//     $

//     *Lưu ý:* Nếu $M$ là trung điểm đường chéo $B D$ thì $d$ không đổi, nhưng đây là trung điểm cạnh $C D$.

//     #nhanxet[
//       Bài toán yêu cầu tính tốc độ biến thiên khoảng cách, tức là độ lớn vận tốc theo phương nối tâm. Nếu kết quả đạo hàm âm, khoảng cách đang co lại.
//     ]
//   ],
// )
