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
        Parabol Trong Không Gian
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        Quy 3D về 2D
      ]
    ],
  )
]
#tln(
  [Trong không gian $O x y z$ có đơn vị dài trên mỗi trục là $10$ mét, mặt đất là mặt phẳng $(O x y)$ từ gốc toạ độ $O$ một vật được ném lên trên với vận tốc ban đầu $vect(v) = (3; 1; 4)$ với đơn vị tốc độ là m/s. Biết quỹ đạo chuyển động là một đường parabol $(P)$ nằm trong mặt phẳng $(alpha)$ vuông góc với mặt đất và đi qua gốc $O$. Giá của vectơ $vect(v)$ tiếp tuyến với $(P)$ và nằm trong $(alpha)$. Biết độ cao cực đại của vật là $80$ mét. Gọi $(a; b; c)$ là toạ độ của vật khi nó cách gốc một khoảng bằng $90$ mét. Hãy tính $(a + b + c)$ (_làm tròn kết quả đến hàng phần chục_)?

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // Các trục tọa độ
        line((0, 0), (-2, -2), mark: (end: ">"), stroke: 0.6pt)
        content((-2, -2.3), $x$)

        line((0, 0), (6, 0), mark: (end: ">"), stroke: 0.6pt)
        content((6, -0.3), $y$)

        line((0, 0), (0, 4.5), mark: (end: ">"), stroke: 0.6pt)
        content((-0.3, 4.5), $z$)

        content((-0.3, -0.2), $O$)

        // Trục t (hình chiếu của quỹ đạo)
        line((0, 0), (5, -1.8), mark: (end: ">"), stroke: (dash: "dashed", thickness: 0.6pt))
        content((5.2, -2), $t$)

        // Vectơ vận tốc ban đầu
        line((0, 0), (0.5, 1.5), mark: (end: "stealth", fill: black), stroke: 0.8pt)
        content((0.1, 1.8), $vect(v)$)

        // Quỹ đạo parabol
        bezier((0, 0), (4.5, -1.62), (1.5, 6), (3.5, 4), stroke: (dash: "dash-dotted", thickness: 0.8pt))
      })
    ]
  ],
  [$14,5$],
  loigiai: [
    #ppgiai[
      - *Đồng nhất hệ tọa độ:* Đổi các khoảng cách thực tế (mét) sang đơn vị tọa độ (chia cho 10).
      - *Phương pháp tham số hóa:* Quỹ đạo ném xiên trong không gian có thể viết dưới dạng tham số $t$. Vì tiếp tuyến tại $O$ là hướng của vận tốc ban đầu $vect(v) = (3; 1; 4)$ và lực hút trái đất chỉ kéo vật xuống theo trục $O z$, tọa độ vật luôn có dạng: $x=3t, y=t, z=4t-k t^2$.
      - Dùng dữ kiện "độ cao cực đại" để tìm tham số $k$.
      - Giải phương trình khoảng cách $x^2+y^2+z^2=d^2$ để tìm $t$, từ đó tính tổng $x+y+z$.
    ]

    Đổi độ dài thực tế sang đơn vị tọa độ ($1$ đơn vị $= 10" m"$):
    - Độ cao cực đại: $z_"max" = 80/10 = 8$.
    - Khoảng cách đến $O$: $d = 90/10 = 9$.

    *Giải thích hệ tham số:* Vật ném lên với vận tốc ban đầu $vect(v) = (3; 1; 4)$.
    - Theo phương ngang (mặt $O x y$), vật không chịu lực cản nên chuyển động thẳng đều: $a(t) = 3t$ và $b(t) = t$.
    - Theo phương đứng ($O z$), vật chịu trọng lực kéo xuống nên chuyển động chậm dần, phương trình có dạng bậc hai: $c(t) = 4t - k t^2$ ($k > 0$).

    Độ cao đạt cực đại khi $c'(t) = 0 <=> 4 - 2k t = 0 <=> t = 2/k$.
    Khi đó, độ cao cực đại là:
    $ z_"max" = c(2/k) = 4(2/k) - k(2/k)^2 = 4/k. $
    Theo đề bài, $z_"max" = 8$, suy ra $4/k = 8 <=> k = 0,5$.
    Vậy tọa độ của vật tại thời điểm $t$ là: $(3t; t; 4t - 0,5t^2)$.

    Vật cách gốc $O$ một khoảng $d = 9$, ta thiết lập phương trình khoảng cách:
    $ a^2 + b^2 + c^2 = 9^2 quad <=> quad (3t)^2 + t^2 + (4t - 0,5t^2)^2 = 81. $

    Nhập phương trình $10X^2 + (4X - 0,5X^2)^2 = 81$ vào máy tính cầm tay và sử dụng chức năng *SHIFT SOLVE* (chọn giá trị ban đầu $X > 0$), ta thu được nghiệm thời gian:
    $ t approx 2,0774. $

    Tổng tọa độ cần tìm là:
    $ a + b + c = 3t + t + 4t - 0,5t^2 = 8t - 0,5t^2. $
    Thay $t approx 2,0774$ vào, ta được:
    $ a + b + c approx 8(2,0774) - 0,5(2,0774)^2 approx 14,461. $

    Làm tròn kết quả đến hàng phần chục, ta thu được *$14,5$*.

    #meo(title: [Kết hợp Toán & Lý])[
      Bài toán quỹ đạo không gian sẽ cực kỳ rắc rối nếu cố lập phương trình mặt phẳng $(alpha)$ giao với mặt trụ. Bằng cách hiểu bản chất Vật lý: "Vận tốc là đạo hàm của chuyển động", ta viết ngay hệ tọa độ siêu gọn $x=3t, y=t, z=4t-k t^2$. Kết hợp cùng *Shift Solve*, thời gian giải bài này chưa tới 2 phút!
    ]
  ],
)

#tln(
  [Trong một buổi diễn tập cứu hộ, từ trạm chỉ huy đặt tại gốc tọa độ $O$ (mặt đất là mặt phẳng $O x y$, đơn vị dài trên mỗi trục là $10$ mét), một thiết bị flycam được phóng lên với vectơ vận tốc ban đầu $vect(v) = (4; 2; 6)$ (đơn vị tốc độ m/s). Bỏ qua sức cản của gió, quỹ đạo của flycam là một đường parabol $(P)$ nằm trong mặt phẳng thẳng đứng đi qua $O$. Biết thiết bị đạt độ cao cực đại là $180$ mét so với mặt đất. Khi flycam bay đến vị trí cách trạm chỉ huy đúng $120$ mét thì truyền về tọa độ $(a; b; c)$. Hãy tính tổng $S = a + b + c$ (_làm tròn kết quả đến hàng phần chục_).

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // Các trục tọa độ
        line((0, 0), (-2, -2), mark: (end: ">"), stroke: 0.6pt)
        content((-2, -2.3), $x$)

        line((0, 0), (6, 0), mark: (end: ">"), stroke: 0.6pt)
        content((6, -0.3), $y$)

        line((0, 0), (0, 4.5), mark: (end: ">"), stroke: 0.6pt)
        content((-0.3, 4.5), $z$)

        content((-0.3, -0.2), $O$)

        // Trục t (hình chiếu của quỹ đạo)
        line((0, 0), (5, -1.25), mark: (end: ">"), stroke: (dash: "dashed", thickness: 0.6pt))
        content((5.2, -1.45), $t$)

        // Vectơ vận tốc ban đầu
        line((0, 0), (0.8, 1.8), mark: (end: "stealth", fill: black), stroke: 0.8pt)
        content((0.4, 2.1), $vect(v)$)

        // Quỹ đạo parabol
        bezier((0, 0), (4.5, -1.125), (1.6, 6.5), (3.5, 4.5), stroke: (
          dash: "dash-dotted",
          thickness: 0.8pt,
          paint: blue,
        ))

        // Điểm đánh dấu trên quỹ đạo
        circle((2.6, 3.8), radius: 1.5pt, fill: red)
        content((2.6, 4.2), $(a;b;c)$)
        line((0, 0), (2.6, 3.8), stroke: (dash: "dashed", paint: red, thickness: 0.5pt))
      })
    ]
  ],
  [$19,6$],
  loigiai: [
    #ppgiai[
      Để giải quyết nhanh bài toán quỹ đạo không gian, ta tư duy theo 4 bước sau:
      - *Bước 1 (Quy đổi hệ quy chiếu):* Đưa mọi khoảng cách thực tế (mét) về số đo tọa độ (đơn vị) bằng cách chia cho $10$.
      - *Bước 2 (Tham số hóa bằng Vật lý):* Vì vận tốc là đạo hàm của tọa độ, từ $vect(v) = (v_x, v_y, v_z)$, ta nguyên hàm để ra phương trình tọa độ. Phương ngang $(x, y)$ không có lực cản nên là hàm bậc nhất. Phương đứng $(z)$ chịu trọng lực nên là hàm bậc hai có dạng $z(t) = v_z t - k t^2$.
      - *Bước 3 (Khai thác cực trị):* Dùng độ cao cực đại (tung độ đỉnh Parabol $z_"max"$) để giải ngược ra hằng số $k$.
      - *Bước 4 (Dùng máy tính):* Lập phương trình khoảng cách $x^2 + y^2 + z^2 = d^2$ ẩn $t$ và dùng `SHIFT SOLVE` để tìm thời điểm $t$, từ đó tính ra tổng $a+b+c$.
    ]

    *Bước 1: Quy đổi độ dài thực tế sang đơn vị tọa độ*
    ($1$ đơn vị tọa độ $= 10$ mét):
    - Độ cao cực đại: $z_"max" = 180 / 10 = 18$.
    - Khoảng cách từ trạm chỉ huy: $d = 120 / 10 = 12$.

    *Bước 2: Viết phương trình tham số*
    Flycam được phóng với vận tốc ban đầu $vect(v) = (4; 2; 6)$.
    - Theo phương mặt đất, tọa độ là hàm bậc nhất của thời gian $t$:
      $ a(t) = 4t, quad b(t) = 2t. $
    - Theo phương thẳng đứng, vật chịu lực hút trái đất nên là hàm bậc hai:
      $ c(t) = 6t - k t^2 quad (k > 0). $

    *Bước 3: Tìm hệ số $k$*
    Độ cao đạt cực đại khi vận tốc theo phương $z$ bằng $0$, tức là $c'(t) = 0$:
    $ c'(t) = 6 - 2k t = 0 quad <=> quad t = 3/k. $
    Thế $t = 3/k$ vào hàm $c(t)$ để ép bằng $z_"max" = 18$:
    $ c(3/k) = 6(3/k) - k(3/k)^2 = 18/k - 9/k = 9/k. $
    Suy ra $9/k = 18 <=> k = 0,5$.
    Vậy phương trình tọa độ hoàn chỉnh là: $(4t; 2t; 6t - 0,5t^2)$.

    *Bước 4: Lập phương trình và giải*
    Khi thiết bị cách gốc $O$ khoảng $d = 12$, ta có phương trình:
    $ a^2 + b^2 + c^2 = 12^2 $
    $ <=> (4t)^2 + (2t)^2 + (6t - 0,5t^2)^2 = 144 $
    $ <=> 20t^2 + (6t - 0,5t^2)^2 = 144. $

    Đến đây, thay vì khai triển đa thức bậc 4, ta nhập phương trình $20X^2 + (6X - 0,5X^2)^2 = 144$ vào máy tính cầm tay và bấm `SHIFT SOLVE` (nhập giá trị ban đầu $X = 1$).
    Máy tính trả về nghiệm dương (thời gian bay):
    $ t approx 1,7654. $

    Tổng tọa độ truyền về trạm chỉ huy là:
    $
      S = a + b + c & = 4t + 2t + 6t - 0,5t^2 \
                    & = 12t - 0,5t^2.
    $
    Thay $t approx 1,7654$ vào biểu thức:
    $ S approx 12(1,7654) - 0,5(1,7654)^2 approx 21,1848 - 1,5583 = 19,6265. $

    Làm tròn kết quả đến hàng phần chục, ta thu được *$19,6$*.

    #meo(title: [Lưu ý khi bấm Shift Solve])[
      Phương trình đa thức bậc 4 ẩn $t$ luôn có nhiều nghiệm (kể cả nghiệm âm hoặc phức). Trong các bài toán thực tế, thời gian $t$ tính từ lúc ném luôn dương ($t > 0$). Khi máy hỏi giá trị khởi tạo `X?`, hãy nhập một số dương nhỏ (ví dụ $1$ hoặc $2$) để máy dò ra nghiệm vật lý đúng đắn nhất, tránh bị hội tụ vào nghiệm âm.
    ]
  ],
)

#tln(
  [Trong một lễ hội pháo hoa quốc tế, bệ phóng được đặt tại gốc tọa độ $O$ (mặt đất là mặt phẳng $O x y$, đơn vị dài trên mỗi trục tương ứng với $5$ mét). Một quả pháo hoa được bắn lên bầu trời với vectơ vận tốc ban đầu $vect(v) = (2; 4; 8)$. Bỏ qua lực cản không khí, quỹ đạo của quả pháo là một đường parabol nằm trong mặt phẳng thẳng đứng đi qua bệ phóng. Biết quả pháo đạt độ cao cực đại là $160$ mét so với mặt đất. Khi quả pháo bay đến vị trí cách bệ phóng đúng $130$ mét thì hệ thống điện tử kích nổ. Gọi $(a; b; c)$ là tọa độ của điểm nổ trên hệ trục. Hãy tính tổng $S = a + b + c$ (_làm tròn kết quả đến hàng phần chục_).

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // Các trục tọa độ
        line((0, 0), (-2, -2), mark: (end: ">"), stroke: 0.6pt)
        content((-2, -2.3), $x$)

        line((0, 0), (6, 0), mark: (end: ">"), stroke: 0.6pt)
        content((6, -0.3), $y$)

        line((0, 0), (0, 5), mark: (end: ">"), stroke: 0.6pt)
        content((-0.3, 5), $z$)

        content((-0.3, -0.2), $O$)

        // Trục t (hình chiếu của quỹ đạo)
        line((0, 0), (5, 2.5), mark: (end: ">"), stroke: (dash: "dashed", thickness: 0.6pt))
        content((5.2, 2.6), $t$)

        // Vectơ vận tốc ban đầu
        line((0, 0), (0.6, 2.4), mark: (end: "stealth", fill: black), stroke: 0.8pt)
        content((0.2, 2.6), $vect(v)$)

        // Quỹ đạo parabol
        bezier((0, 0), (4.5, 2.25), (1.5, 7.5), (3.5, 5), stroke: (
          dash: "dash-dotted",
          thickness: 0.8pt,
          paint: rgb("#d32f2f"),
        ))

        // Điểm nổ pháo hoa (Ngôi sao nhiều cánh)
        let ex = 2.7
        let ey = 4.45
        for i in range(8) {
          let ang = i * 45deg
          line((ex, ey), (ex + 0.3 * calc.cos(ang), ey + 0.3 * calc.sin(ang)), stroke: (
            paint: orange,
            thickness: 1.5pt,
          ))
        }
        circle((ex, ey), radius: 2pt, fill: red)
        content((ex + 0.8, ey + 0.2), $(a;b;c)$)
        line((0, 0), (ex, ey), stroke: (dash: "dotted", paint: rgb("#d32f2f"), thickness: 1pt))
      })
    ]
  ],
  [$41,1$],
  loigiai: [
    #ppgiai[
      - *Đọc kỹ hệ số tỉ lệ:* Bài này $1$ đơn vị tọa độ $= 5$ mét (không phải $10$ mét như các bài trước). Phải cẩn thận chia cho $5$.
      - *Tham số hóa:* Phương trình theo phương ngang là $x = v_x t, y = v_y t$. Phương trình theo phương thẳng đứng (có gia tốc trọng trường) là $z = v_z t - k t^2$.
      - *Tìm $k$:* Sử dụng độ cao cực đại để giải hằng số $k$.
      - *Giải phương trình:* Dùng khoảng cách $d$ và chức năng `SHIFT SOLVE` để tìm thời điểm nổ $t$, sau đó thế ngược vào tính $S$.
    ]

    *Bước 1: Quy đổi khoảng cách về đơn vị tọa độ*
    (Nhớ kỹ $1$ đơn vị $= 5$ mét):
    - Độ cao cực đại: $z_"max" = 160 / 5 = 32$.
    - Khoảng cách đến bệ phóng: $d = 130 / 5 = 26$.

    *Bước 2: Viết hệ phương trình tọa độ theo thời gian $t$*
    Với vectơ vận tốc ban đầu $vect(v) = (2; 4; 8)$, ta có hệ tọa độ của quả pháo hoa là:
    $
      cases(
        a(t) = 2t,
        b(t) = 4t,
        c(t) = 8t - k t^2 quad (k > 0)
      )
    $

    *Bước 3: Tìm hệ số $k$ dựa vào độ cao cực đại*
    Độ cao đạt cực đại khi đạo hàm của hàm cao độ bằng $0$:
    $ c'(t) = 8 - 2k t = 0 quad <=> quad t = 4/k. $
    Thế lại $t = 4/k$ vào phương trình $c(t)$ để tìm giá trị cực đại:
    $ z_"max" = c(4/k) = 8(4/k) - k(4/k)^2 = 32/k - 16/k = 16/k. $
    Theo đề, $z_"max" = 32$, suy ra:
    $ 16/k = 32 quad <=> quad k = 16/32 = 0,5. $
    Vậy phương trình tọa độ hoàn chỉnh là: $(2t; 4t; 8t - 0,5t^2)$.

    *Bước 4: Giải phương trình khoảng cách*
    Quả pháo nổ khi cách gốc $O$ khoảng $d = 26$, tức là:
    $ a^2 + b^2 + c^2 = 26^2 $
    $ <=> (2t)^2 + (4t)^2 + (8t - 0,5t^2)^2 = 676 $
    $ <=> 4t^2 + 16t^2 + (8t - 0,5t^2)^2 = 676 $
    $ <=> 20t^2 + (8t - 0,5t^2)^2 = 676. $

    Nhập phương trình $20X^2 + (8X - 0,5X^2)^2 = 676$ vào máy tính và nhấn `SHIFT SOLVE` (chọn giá trị ban đầu $X = 3$).
    Máy tính cho ra nghiệm dương $t approx 3,3364$.

    *Bước 5: Tính tổng tọa độ $S$*
    Tổng tọa độ điểm nổ là:
    $
      S = a + b + c & = 2t + 4t + 8t - 0,5t^2 \
                    & = 14t - 0,5t^2.
    $
    Thay $t approx 3,3364$ vào biểu thức:
    $ S approx 14(3,3364) - 0,5(3,3364)^2 approx 46,7096 - 5,5658 = 41,1438. $

    Làm tròn kết quả đến hàng phần chục, ta thu được *$41,1$*.

    #luuy(title: [Bẫy quy đổi đơn vị])[
      Học sinh làm quen tay với các bài trước rất dễ mặc định lấy số mét chia cho $10$. Đề thi thật luôn có sự thay đổi tinh tế ở hệ số tỉ lệ (ở đây là $5$ mét). Cần đọc thật kỹ dòng: *"đơn vị dài trên mỗi trục tương ứng với... mét"* để thực hiện Bước 1 chính xác, nếu sai Bước 1 thì toàn bộ thuật toán đằng sau sẽ đi tong!
    ]
  ],
)
#tln(
  [Tại một khu công nghiệp, người ta thử nghiệm một hệ thống robot chữa cháy thông minh. Robot được đặt cố định tại gốc tọa độ $O$ (mặt đất là mặt phẳng $O x y$, đơn vị dài trên mỗi trục tương ứng với $2$ mét). Robot phun ra một tia nước áp suất cao với vectơ vận tốc ban đầu $vect(v) = (3; 4; 10)$. Bỏ qua sức cản của gió, quỹ đạo của tia nước là một đường parabol nằm trong mặt phẳng thẳng đứng. Biết tia nước đạt độ cao cực đại là $100$ mét so với mặt đất. Hệ thống tính toán rằng tia nước chạm trúng vào vị trí đám cháy khi nó cách gốc $O$ một khoảng đúng $60$ mét (đo theo đường thẳng không gian). Gọi $(a; b; c)$ là tọa độ của đám cháy trên hệ trục tọa độ. Hãy tính tổng $S = a + b + c$ (_làm tròn kết quả đến hàng phần chục_).

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // Các trục tọa độ
        line((0, 0), (-2, -1.5), mark: (end: ">"), stroke: 0.6pt)
        content((-2, -1.8), $x$)

        line((0, 0), (6, 0), mark: (end: ">"), stroke: 0.6pt)
        content((6, -0.3), $y$)

        line((0, 0), (0, 5.5), mark: (end: ">"), stroke: 0.6pt)
        content((-0.3, 5.5), $z$)

        // Robot tại gốc O
        rect((-0.3, -0.2), (0.3, 0.2), fill: rgb("#607d8b"), stroke: 1pt, radius: 1pt)
        content((-0.5, -0.4), $O$)

        // Trục t (hình chiếu của quỹ đạo, theo hướng vector (3,4))
        line((0, 0), (5, 1.5), mark: (end: ">"), stroke: (dash: "dashed", thickness: 0.6pt))
        content((5.2, 1.7), $t$)

        // Vectơ vận tốc ban đầu
        line((0, 0), (0.6, 2.0), mark: (end: "stealth", fill: black), stroke: 0.8pt)
        content((0.2, 2.2), $vect(v)$)

        // Quỹ đạo tia nước (màu xanh lam ngọc)
        bezier((0, 0), (4.5, 1.35), (1.5, 6), (3.5, 4.5), stroke: (thickness: 1.5pt, paint: rgb("#00bcd4")))

        // Đám cháy (Ngôi sao lửa)
        let ex = 3.0
        let ey = 3.65
        for i in range(7) {
          let ang = i * 360deg / 7
          line((ex, ey), (ex + 0.35 * calc.cos(ang), ey + 0.35 * calc.sin(ang)), stroke: (
            paint: rgb("#ff5722"),
            thickness: 1.5pt,
          ))
        }
        circle((ex, ey), radius: 2.5pt, fill: rgb("#ff9800"), stroke: none)
        content((ex + 0.9, ey + 0.2), $(a;b;c)$)

        // Đường khoảng cách d
        line((0, 0), (ex, ey), stroke: (dash: "dotted", paint: rgb("#e65100"), thickness: 1pt))
      })
    ]
  ],
  [$47,3$],
  loigiai: [
    #ppgiai[
      - *Bước 1 (Quy đổi hệ số):* Một đơn vị tọa độ ứng với $2$ mét. Chuyển đổi độ cao cực đại và khoảng cách từ mét sang đơn vị tọa độ.
      - *Bước 2 (Tham số hóa):* Vectơ vận tốc $vec{v} = (3; 4; 10)$ cho biết phương trình tham số: $x = 3t$, $y = 4t$, $z = 10t - k t^2$. Để ý phương ngang $(x, y)$ tạo thành bộ ba Pythagore $3-4-5$, giúp tính tổng bình phương cực nhanh.
      - *Bước 3 (Tìm k):* Dùng độ cao cực đại $z_{max}$ để giải hằng số trọng trường $k$.
      - *Bước 4 (Shift Solve):* Lập phương trình khoảng cách $x^2 + y^2 + z^2 = d^2$ và giải ra $t$, từ đó tính tổng tọa độ.
    ]

    *Bước 1: Quy đổi khoảng cách về đơn vị tọa độ*
    (Tỉ lệ: $1$ đơn vị $= 2$ mét):
    - Độ cao cực đại: $z_"max" = 100 / 2 = 50$.
    - Khoảng cách đến robot: $d = 60 / 2 = 30$.

    *Bước 2: Viết hệ phương trình tọa độ theo thời gian $t$*
    Tia nước được phun với vectơ vận tốc ban đầu $vect(v) = (3; 4; 10)$. Tọa độ của các giọt nước tại thời điểm $t$ là:
    $
      cases(
        a(t) = 3t,
        b(t) = 4t,
        c(t) = 10t - k t^2 quad (k > 0)
      )
    $

    *Bước 3: Tìm hệ số $k$ dựa vào độ cao cực đại*
    Tia nước đạt đỉnh khi đạo hàm của cao độ bằng $0$:
    $ c'(t) = 10 - 2k t = 0 quad <=> quad t = 5/k. $
    Thế $t = 5/k$ vào hàm $c(t)$ để ép bằng $z_"max" = 50$:
    $ z_"max" = c(5/k) = 10(5/k) - k(5/k)^2 = 50/k - 25/k = 25/k. $
    Suy ra:
    $ 25/k = 50 quad <=> quad k = 25/50 = 0,5. $
    Vậy phương trình tọa độ của tia nước là: $(3t; 4t; 10t - 0,5t^2)$.

    *Bước 4: Giải phương trình khoảng cách*
    Tia nước dập lửa tại vị trí cách gốc $O$ một khoảng $d = 30$, ta có:
    $ a^2 + b^2 + c^2 = 30^2 $
    $ <=> (3t)^2 + (4t)^2 + (10t - 0,5t^2)^2 = 900 $
    Để ý rằng $(3t)^2 + (4t)^2 = 9t^2 + 16t^2 = 25t^2$, phương trình thu gọn cực đẹp thành:
    $ 25t^2 + (10t - 0,5t^2)^2 = 900. $

    Nhập trực tiếp phương trình $25X^2 + (10X - 0,5X^2)^2 = 900$ vào máy tính và bấm `SHIFT SOLVE` (nhập giá trị dò ban đầu $X = 3$).
    Máy tính trả về nghiệm dương: $t approx 3,0538$.

    *Bước 5: Tính tổng tọa độ $S$*
    Tổng tọa độ của đám cháy trên hệ trục là:
    $
      S = a + b + c & = 3t + 4t + 10t - 0,5t^2 \
                    & = 17t - 0,5t^2.
    $
    Thay $t approx 3,0538$ vào biểu thức:
    $ S approx 17(3,0538) - 0,5(3,0538)^2 approx 51,9146 - 4,6628 = 47,2518. $

    Làm tròn kết quả đến hàng phần chục, ta thu được *$47,3$*.

    #meo(title: [Sự tinh tế của người ra đề])[
      Hãy chú ý vectơ vận tốc mặt ngang là $(3; 4)$. Việc người ra đề chọn cặp số này không hề ngẫu nhiên! Nó giúp tổng bình phương ngang $x^2 + y^2 = (3t)^2 + (4t)^2 = 25t^2$ trở nên vô cùng gọn gàng (bộ ba Pytago $3-4-5$). Trong kỳ thi, nếu tinh ý nhận ra điều này, tốc độ biến đổi biểu thức và nhập máy tính của bạn sẽ nhanh hơn đối thủ rất nhiều!
    ]
  ],
)

#tln(
  [Trong một chiến dịch cứu trợ vùng lũ, một trực thăng đang bay ngang qua tâm khu vực tại tọa độ $(0; 0; 500)$ mét thì thả một kiện hàng cứu trợ. Trực thăng bay với vận tốc đều đặn, được mô phỏng bởi vectơ $vect(v) = (6; 8; 0)$ m/s. Để thiết lập hệ tọa độ $O x y z$, người ta lấy mặt đất phẳng làm mặt $(O x y)$ và quy ước *$1$ đơn vị dài trên trục tương ứng với $10$ mét*.

    Do ảnh hưởng của trọng lực, kiện hàng rơi theo quỹ đạo parabol. Các cảm biến ghi nhận được: sau đúng $4$ giây kể từ lúc thả, kiện hàng rơi xuống độ cao $420$ mét so với mặt đất. Tuy nhiên, kiện hàng không rơi xuống mặt đất phẳng mà rơi trúng một sườn núi. Sườn núi này được mô hình hóa bằng mặt phẳng $(P)$ có phương trình: $x - y + z - 20 = 0$. Gọi $(a; b; c)$ là tọa độ điểm rơi của kiện hàng trên hệ trục $O x y z$. Hãy tính tổng $S = a + b + c$.

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // Hệ trục tọa độ 3D
        line((0, 0), (-2.5, -1.5), mark: (end: ">"), stroke: 0.6pt)
        content((-2.5, -1.8), $x$)
        line((0, 0), (6, 0), mark: (end: ">"), stroke: 0.6pt)
        content((6, -0.3), $y$)
        line((0, 0), (0, 5.5), mark: (end: ">"), stroke: 0.6pt)
        content((-0.3, 5.5), $z$)
        content((-0.3, -0.3), $O$)

        // Mặt phẳng sườn núi (P) - Nghiêng 3D
        let p1 = (0.5, 1.5)
        let p2 = (5, 0)
        let p3 = (6.5, 2.5)
        let p4 = (2, 4)
        line(p1, p2, p3, p4, close: true, fill: rgb("4caf5033"), stroke: (paint: rgb("388e3c"), thickness: 1.2pt))
        // Các đường grid line tạo độ nghiêng sườn núi
        line((1.25, 0.75), (5.75, 3.25), stroke: (paint: rgb("388e3c66"), thickness: 0.5pt))
        line((1.6, 2.7), (5.3, 1.2), stroke: (paint: rgb("388e3c66"), thickness: 0.5pt))
        content((5.8, 0.5), text(fill: rgb("2e7d32"), weight: "bold")[Mặt sườn núi $(P)$])

        // Trực thăng (Điểm H)
        let Hx = 0
        let Hy = 5
        circle((Hx, Hy), radius: 2.5pt, fill: black)
        content((-1.2, 5.2), text(weight: "bold")[$H(0;0;50)$])

        // Vectơ vận tốc ban đầu (bay ngang)
        line(
          (Hx, Hy),
          (Hx + 1.8, Hy + 0.6),
          mark: (end: "stealth", fill: blue),
          stroke: (paint: blue, thickness: 1.2pt),
        )
        content((Hx + 1.2, Hy + 0.9), text(fill: blue)[$vect(v)=(6;8;0)$])

        // Đường hình chiếu của quỹ đạo trên mặt đất (Oxy)
        let shadowX = 4.5
        let shadowY = 1.5
        line((0, 0), (shadowX, shadowY), stroke: (dash: "dotted", paint: gray, thickness: 1.2pt))
        content((shadowX + 0.5, shadowY), fill: gray)[$H."chiếu"$]

        // Quỹ đạo rơi thực tế (Parabol không gian)
        let fallX = 3.6
        let fallY = 1.8 // Tọa độ 2D mô phỏng điểm rơi
        bezier((Hx, Hy), (fallX, fallY), (2.5, 4.5), (3.5, 3.5), stroke: (
          dash: "dashed",
          thickness: 1.5pt,
          paint: rgb("#d32f2f"),
        ))

        // Gióng từ điểm rơi xuống bóng trên mặt đất
        line((fallX, fallY), (3.2, 1.05), stroke: (dash: "dotted", paint: rgb("#d32f2f"), thickness: 1pt))

        // Điểm rơi trúng sườn núi (Vụ nổ nhỏ)
        for i in range(6) {
          let ang = i * 60deg + 15deg
          line((fallX, fallY), (fallX + 0.3 * calc.cos(ang), fallY + 0.3 * calc.sin(ang)), stroke: (
            paint: rgb("#e65100"),
            thickness: 1.5pt,
          ))
        }
        circle((fallX, fallY), radius: 2.5pt, fill: rgb("#ffb300"), stroke: none)
        content((fallX + 0.9, fallY + 0.3), text(fill: red, weight: "bold")[$(a;b;c)$])
      })
    ]
  ],
  [$116$],
  loigiai: [
    #ppgiai[
      - *Động học ném ngang (Vật lý):* Vật thả từ máy bay sẽ giữ nguyên vận tốc ngang $vect(v) = (v_x, v_y, 0)$. Phương thẳng đứng ($O z$) rơi tự do nên có phương trình $z(t) = z_0 - k t^2$.
      - *Toán học hóa:* Thiết lập hệ phương trình tham số $a(t), b(t), c(t)$. Chú ý quy đổi hệ số ($1"đv" = 10m$). Dùng điều kiện tại $t=4$ để tìm hằng số trọng trường $k$.
      - *Tương giao Đường - Mặt:* Thế tham số $t$ của quỹ đạo vào phương trình mặt phẳng $(P)$ để giải phương trình bậc hai tìm thời gian va chạm $t$.
    ]

    *Bước 1: Quy đổi số liệu về hệ tọa độ*
    (Tỉ lệ: $1$ đơn vị $= 10$ mét)
    - Tọa độ thả hàng: $H(0; 0; 500/10) => H(0; 0; 50)$.
    - Cao độ sau $4$ giây: $z(4) = 420/10 = 42$.
    - Mặt phẳng sườn núi: $(P): x - y + z - 20 = 0$.

    *Bước 2: Tham số hóa quỹ đạo rơi*
    Kiện hàng kế thừa vận tốc bay ngang $vect(v) = (6; 8; 0)$.
    - Phương ngang không có lực tác dụng, chuyển động thẳng đều:
      $ a(t) = 6t, quad b(t) = 8t. $
    - Phương đứng rơi tự do từ độ cao $z_0 = 50$:
      $ c(t) = 50 - k t^2 quad (k > 0). $

    Sau $4$ giây, cao độ là $42$, ta có:
    $ c(4) = 42 quad <=> quad 50 - k(4)^2 = 42 quad <=> quad 16k = 8 quad <=> quad k = 0,5. $
    Vậy phương trình tham số quỹ đạo là:
    $ cases(a(t) = 6t, b(t) = 8t, c(t) = 50 - 0.5t^2) $

    *Bước 3: Tìm giao điểm với sườn núi $(P)$*
    Vật chạm sườn núi khi tọa độ $(a; b; c)$ thỏa mãn phương trình $(P)$. Ta có:
    $ (6t) - (8t) + (50 - 0,5t^2) - 20 = 0 <=> t = 6 $
    *Bước 4: Tính tọa độ điểm rơi và tổng $S$*
    Thế $t = 6$ vào hệ tham số quỹ đạo:
    $ a = 6(6) = 36 $
    $ b = 8(6) = 48 $
    $ c = 50 - 0,5(6)^2 = 50 - 18 = 32 $
    Kiện hàng rơi trúng sườn núi tại vị trí $(36; 48; 32)$.

    Tổng $S$ cần tìm là:
    $ S = a + b + c = 36 + 48 + 32 = 116. $

    #meo(title: [Sức mạnh của Tham số hóa trong HHKG])[
      Trong Hình học không gian Oxyz truyền thống, việc tìm giao điểm giữa một "đường cong" (Parabol) và một mặt phẳng là một bài toán vô cùng phức tạp nếu dùng hệ tọa độ Descartes. Tuy nhiên, bằng cách *"mượn biến thời gian $t$"*, bài toán lập tức biến thành một phương trình đại số bậc $2$ giải trong 1 nốt nhạc. Đây là tư duy cốt lõi để giải quyết các bài toán vận dụng cao liên môn Toán - Lý!
    ]
  ],
)

#tln(
  [Trong một buổi thử nghiệm công nghệ quốc phòng thực địa, một thiết bị bay không người lái (drone) được lập trình để thả một quả pháo sáng nhằm đánh dấu mục tiêu giả định. Drone đang bay ổn định ở độ cao $50$ mét so với mặt đất phẳng tại tọa độ $H(0; 0; 50)$ trong hệ trục tọa độ $O x y z$ (quy ước $1$ đơn vị dài trên hệ trục tương ứng với $1$ mét). Quả pháo sáng được phóng ra ngang với vận tốc đầu $vect(v) = (3; 1; 0)$ m/s.

    Do ảnh hưởng của trọng lực, quả pháo rơi theo quỹ đạo parabol. Các radar ghi nhận được: sau đúng $5$ giây kể từ lúc thả, quả pháo sáng rơi xuống độ cao $25$ mét. Biết rằng quả pháo sáng không chạm đất mà rơi trúng một mái vòm dốc bằng kính chịu lực. Mái vòm này được mô phỏng bằng mặt phẳng $(P)$ có phương trình: $2x - 2y + z - 38 = 0$. Gọi $M(a; b; c)$ là tọa độ điểm va chạm của quả pháo trên mái vòm. Tính giá trị biểu thức $S = a + b + c$.

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // Hệ trục tọa độ 3D
        line((0, 0), (-2.5, -1.5), mark: (end: ">"), stroke: 0.6pt)
        content((-2.5, -1.8), $x$)
        line((0, 0), (6, 0), mark: (end: ">"), stroke: 0.6pt)
        content((6, -0.3), $y$)
        line((0, 0), (0, 5.5), mark: (end: ">"), stroke: 0.6pt)
        content((-0.3, 5.5), $z$)
        content((-0.3, -0.3), $O$)

        // Mặt phẳng mái vòm (P) - Nghiêng 3D
        let p1 = (1, 1.5)
        let p2 = (5.5, 0.5)
        let p3 = (6.5, 3)
        let p4 = (2, 4)
        line(p1, p2, p3, p4, close: true, fill: rgb("2196f333"), stroke: (paint: rgb("1976d2"), thickness: 1.2pt))
        // Các đường grid line tạo độ nghiêng mái vòm
        line((1.5, 2), (5.8, 1), stroke: (paint: rgb("1976d266"), thickness: 0.5pt))
        line((2, 3), (6.2, 2), stroke: (paint: rgb("1976d266"), thickness: 0.5pt))
        content((5.8, 0.8), text(fill: rgb("0d47a1"), weight: "bold")[Mái vòm $(P)$])

        // Drone (Điểm H)
        let Hx = 0
        let Hy = 5
        circle((Hx, Hy), radius: 2.5pt, fill: black)
        content((-1.2, 5.2), text(weight: "bold")[$H(0;0;50)$])

        // Vectơ vận tốc ban đầu (bay ngang)
        line(
          (Hx, Hy),
          (Hx + 1.8, Hy + 0.6),
          mark: (end: "stealth", fill: blue),
          stroke: (paint: blue, thickness: 1.2pt),
        )
        content((Hx + 1.2, Hy + 0.9), text(fill: blue)[$vect(v)=(3;1;0)$])

        // Đường hình chiếu của quỹ đạo trên mặt đất (Oxy)
        let shadowX = 4.2
        let shadowY = 1.4
        line((0, 0), (shadowX, shadowY), stroke: (dash: "dotted", paint: gray, thickness: 1.2pt))
        content((shadowX + 0.5, shadowY), fill: gray)[$H_"chiếu"$]

        // Quỹ đạo rơi thực tế (Parabol không gian)
        let fallX = 3.2
        let fallY = 1.8 // Tọa độ 2D mô phỏng điểm rơi
        bezier((Hx, Hy), (fallX, fallY), (2, 4.8), (3, 3.5), stroke: (
          dash: "dashed",
          thickness: 1.5pt,
          paint: rgb("#d32f2f"),
        ))

        // Gióng từ điểm va chạm xuống bóng trên mặt đất
        line((fallX, fallY), (2.8, 0.85), stroke: (dash: "dotted", paint: rgb("#d32f2f"), thickness: 1pt))

        // Điểm rơi trúng mái vòm
        for i in range(5) {
          let ang = i * 72deg + 18deg
          line((fallX, fallY), (fallX + 0.25 * calc.cos(ang), fallY + 0.25 * calc.sin(ang)), stroke: (
            paint: rgb("#e65100"),
            thickness: 1.5pt,
          ))
        }
        circle((fallX, fallY), radius: 2.5pt, fill: rgb("#ffb300"), stroke: none)
        content((fallX + 0.9, fallY + 0.3), text(fill: red, weight: "bold")[$M(a;b;c)$])
      })
    ]
  ],
  [$38$],
  loigiai: [
    #ppgiai[
      - *Phân tích động lực học:* Khi vật rơi từ trên cao với vận tốc ban đầu phương ngang $vect(v) = (v_x; v_y; 0)$, chuyển động theo các trục $O x$ và $O y$ là thẳng đều. Phương $O z$ chịu tác dụng của trọng lực nên là chuyển động nhanh dần đều với phương trình $z(t) = z_0 - k t^2$.
      - *Mô hình hóa không gian:* Lập phương trình tham số $a(t), b(t), c(t)$ của quỹ đạo. Thế tọa độ này vào phương trình mặt phẳng $(P)$ để giải thời gian va chạm $t$.
    ]

    *Bước 1: Thiết lập phương trình tham số quỹ đạo rơi* \
    Quả pháo kế thừa vận tốc bay ngang của drone $vect(v) = (3; 1; 0)$.
    - Trên mặt phẳng ngang, vật chuyển động đều không có lực cản:
      $ x(t) = 3t, quad y(t) = t. $
    - Trên phương thẳng đứng, vật rơi tự do từ độ cao ban đầu $z_0 = 50$:
      $ z(t) = 50 - k t^2 quad (k > 0). $

    Sau $5$ giây, độ cao là $25$ mét. Ta thay $t = 5$ vào hàm $z(t)$:
    $ z(5) = 25 quad <=> quad 50 - k(5)^2 = 25 quad <=> quad 25k = 25 quad <=> quad k = 1. $
    Vậy phương trình tham số quỹ đạo của quả pháo là:
    $ cases(x(t) = 3t, y(t) = t, z(t) = 50 - t^2) $

    *Bước 2: Tìm giao điểm $M$ với mái vòm $(P)$* \
    Vật chạm vào mái vòm khi tọa độ $(x; y; z)$ thỏa mãn phương trình $(P): 2x - 2y + z - 38 = 0$.
    Thay hệ tham số vào phương trình mặt phẳng:
    $ 2(3t) - 2(t) + (50 - t^2) - 38 = 0 $
    $ <=> 6t - 2t + 50 - t^2 - 38 = 0 $
    $ <=> -t^2 + 4t + 12 = 0 $
    Giải phương trình bậc hai theo biến thời gian $t$, ta được:
    $ hoac(t = 6 quad ("nhận vì " t > 0), t = -2 quad ("loại")) $
    *Bước 3: Tính tọa độ va chạm và tổng $S$* \
    Tại thời điểm $t = 6$ (giây), thay vào hệ phương trình quỹ đạo để tìm tọa độ điểm $M(a; b; c)$:
    $ a = 3(6) = 18 $
    $ b = 6 $
    $ c = 50 - 6^2 = 50 - 36 = 14 $
    Quả pháo rơi trúng mái vòm tại vị trí $M(18; 6; 14)$.

    Tổng $S$ cần tìm là:
    $ S = a + b + c = 18 + 6 + 14 = 38. $

    #luuy(title: [Lưu ý Logic Toán & Lý])[
      Trong các bài toán tương giao có bối cảnh thực tế (chuyển động, thời gian), việc xuất hiện nghiệm âm (như $t = -2$ ở trên) là điều bình thường về mặt đại số do đồ thị Parabol trải dài trên toàn trục $O z$. Tuy nhiên, với vai trò là một "nhà điều tra", ta phải gắn chặt nghiệm với mốc thời gian thực $t > 0$ kể từ lúc bắt đầu thả vật để đưa ra kết luận chính xác.
    ]
  ],
)

#tln(
  [Tại một khu đô thị thông minh, một hệ thống robot tự động được triển khai để làm sạch các mảng pin năng lượng mặt trời trên cao. Vòi phun của robot được đặt tại điểm $H(0; 0; 2)$ trong hệ trục tọa độ $O x y z$ (quy ước $1$ đơn vị dài tương ứng với $1$ mét, mặt đất phẳng là $(O x y)$).

    Khi kích hoạt, robot phun ra một tia nước với vận tốc ban đầu được thiết lập là $vect(v) = (8; 6; 10)$ m/s. Trọng lực làm tia nước uốn cong thành quỹ đạo parabol. Theo tính toán của các kỹ sư, để tối ưu hóa lực cọ rửa mà không làm hỏng mặt kính, tia nước phải tiếp xúc (lướt dọc) trên bề mặt của mảng pin mặt trời. Mảng pin này được mô phỏng bằng một phần của mặt phẳng $(P)$ có phương trình: $x + 2y + 2z - 44 = 0$.

    Biết phương trình chuyển động của tia nước theo phương thẳng đứng tuân theo $z(t) = z_0 + v_z t - 5t^2$ (với gia tốc trọng trường $g = 10" m/s"^2$). Gọi $M(a; b; c)$ là điểm mà tia nước bắt đầu chạm vào mảng pin mặt trời. Tính giá trị biểu thức $S = a + 2b - c$.

    #align(center)[
      #cetz.canvas(length: 0.85cm, {
        import cetz.draw: *

        // Hệ trục tọa độ 3D
        line((0, 0), (-2.5, -1.5), mark: (end: ">"), stroke: 0.6pt)
        content((-2.5, -1.8), $x$)
        line((0, 0), (6, 0), mark: (end: ">"), stroke: 0.6pt)
        content((6, -0.3), $y$)
        line((0, 0), (0, 5), mark: (end: ">"), stroke: 0.6pt)
        content((-0.3, 5), $z$)
        content((-0.3, -0.3), $O$)

        // Mặt phẳng mảng pin (P)
        let p1 = (1, 2)
        let p2 = (5.5, 0.5)
        let p3 = (7, 2.5)
        let p4 = (2.5, 4)
        line(p1, p2, p3, p4, close: true, fill: rgb("00bcd433"), stroke: (paint: rgb("00838f"), thickness: 1.2pt))

        // Lưới chia ô của pin mặt trời (Grid)
        line((1.3, 1.6), (5.8, 2.1), stroke: (paint: rgb("00838f66"), thickness: 0.5pt))
        line((1.6, 1.2), (6.1, 1.7), stroke: (paint: rgb("00838f66"), thickness: 0.5pt))
        line((2, 2.8), (4, 0.8), stroke: (paint: rgb("00838f66"), thickness: 0.5pt))
        line((3.5, 3.2), (5.5, 1.2), stroke: (paint: rgb("00838f66"), thickness: 0.5pt))

        content((6.2, 0.8), text(fill: rgb("006064"), weight: "bold")[Mảng pin $(P)$])

        // Điểm phun H
        let Hx = 0
        let Hy = 1.2
        circle((Hx, Hy), radius: 2.5pt, fill: black)
        content((-1.2, 1.4), text(weight: "bold")[$H(0;0;2)$])

        // Vectơ vận tốc ban đầu
        line(
          (Hx, Hy),
          (Hx + 1.2, Hy + 1.8),
          mark: (end: "stealth", fill: blue),
          stroke: (paint: blue, thickness: 1.2pt),
        )
        content((Hx + 0.5, Hy + 2), text(fill: blue)[$vect(v)=(8;6;10)$])

        // Quỹ đạo tia nước (Parabol) lướt trên mặt phẳng
        let fallX = 3.8
        let fallY = 1.8
        bezier((Hx, Hy), (fallX, fallY), (1.5, 4.5), (2.5, 3.5), stroke: (
          thickness: 1.5pt,
          paint: rgb("#1e88e5"),
        ))

        // Hiệu ứng bọt nước văng ra khi lướt
        for i in range(4) {
          let ang = i * 45deg + 20deg
          line((fallX, fallY), (fallX + 0.3 * calc.cos(ang), fallY + 0.3 * calc.sin(ang)), stroke: (
            paint: rgb("#81d4fa"),
            thickness: 1pt,
          ))
        }

        // Điểm chạm M
        circle((fallX, fallY), radius: 2.5pt, fill: rgb("#e53935"), stroke: none)
        content((fallX + 0.8, fallY + 0.4), text(fill: red, weight: "bold")[$M(a;b;c)$])
      })
    ]
  ],
  [$38$],
  loigiai: [
    #ppgiai[
      - *Mô hình hóa động học:* Tia nước xuất phát từ $H$ với vận tốc ban đầu $vect(v) = (v_x; v_y; v_z)$. Chuyển động trên phương ngang ($O x, O y$) là thẳng đều. Phương thẳng đứng ($O z$) là chuyển động có gia tốc trọng trường. Ta lập phương trình tham số của quỹ đạo.
      - *Giải mã dấu vết (Giao điểm):* Quá trình tìm giao điểm của tia nước và mặt phẳng $(P)$ được đưa về việc giải phương trình đại số theo ẩn thời gian $t$.
      - *Sự kiện "Tiếp xúc":* Yêu cầu "lướt dọc trên bề mặt" tương đương với việc tia nước tiếp xúc với mặt phẳng. Về mặt đại số, phương trình hoành độ giao điểm theo $t$ phải có *nghiệm kép*.
    ]

    *Bước 1: Thiết lập phương trình tham số quỹ đạo của tia nước* \
    Tia nước xuất phát từ $H(0; 0; 2)$ với vận tốc $vect(v) = (8; 6; 10)$.
    - Trên các phương ngang, chuyển động thẳng đều:
      $ x(t) = 8t, quad y(t) = 6t. $
    - Trên phương thẳng đứng, thay $z_0 = 2$ và $v_z = 10$ vào phương trình đã cho:
      $ z(t) = 2 + 10t - 5t^2. $
    Hệ phương trình quỹ đạo của điểm nước tại thời điểm $t$ là:
    $ cases(x(t) = 8t, y(t) = 6t, z(t) = -5t^2 + 10t + 2) $

    *Bước 2: Tìm thời điểm tia nước chạm mảng pin $(P)$* \
    Thay hệ tham số trên vào phương trình mặt phẳng $(P): x + 2y + 2z - 44 = 0$, ta có phương trình tìm thời điểm $t$:
    $ (8t) + 2(6t) + 2(-5t^2 + 10t + 2) - 44 = 0 $
    $ <=> 8t + 12t - 10t^2 + 20t + 4 - 44 = 0 $
    $ <=> -10t^2 + 40t - 40 = 0 $
    $ <=> t^2 - 4t + 4 = 0 quad <=> quad (t - 2)^2 = 0 quad <=> quad t = 2. $

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trục tọa độ
        line((-0.5, 0), (5, 0), mark: (end: ">"), stroke: 0.8pt)
        content((5, -0.4), $t$ + " (giây)")
        line((0, -2.5), (0, 1.5), mark: (end: ">"), stroke: 0.8pt)
        content((-0.4, 1.5), $f(t)$)
        content((-0.3, -0.3), $O$)

        // Vẽ Parabol y = - (t-2)^2
        bezier((0, -2), (4, -2), (1.33, 0.66), (2.66, 0.66), stroke: (paint: red, thickness: 1.2pt))

        // Điểm tiếp xúc t = 2
        circle((2, 0), radius: 2pt, fill: black)
        content((2, 0.4), text(weight: "bold")[$t=2$])

        // Ghi chú
        content((3.5, -1.5), text(fill: red)[Nghiệm kép])
      })
    ]

    *Bước 3: Xác định tọa độ điểm chạm $M$ và tính $S$* \
    Tại thời điểm $t = 2$ (giây), thay vào hệ phương trình quỹ đạo để tìm tọa độ $M(a; b; c)$:
    $ a = 8(2) = 16 $
    $ b = 6(2) = 12 $
    $ c = -5(2)^2 + 10(2) + 2 = -20 + 20 + 2 = 2 $
    Tia nước chạm mặt phẳng tại điểm $M(16; 12; 2)$.

    Tính giá trị biểu thức theo yêu cầu:
    $ S = a + 2b - c = 16 + 2(12) - 2 = 16 + 24 - 2 = 38. $

    #nhanxet(title: [Góc nhìn Thám tử & Kỹ sư])[
      Khi lập mô hình toán học cho hệ thống thực tế, sự "hoàn hảo" của cơ học thường ẩn mình dưới hình hài của một phương trình đại số. Việc phương trình $-10t^2 + 40t - 40 = 0$ có *nghiệm kép* $t=2$ chính là lời khẳng định đanh thép: Tia nước không đâm xuyên (gây vỡ kính), cũng không bay hụt (vô nghiệm), mà nó chỉ vừa vặn *hôn nhẹ* lên mặt phẳng (grazing/tangent) để phát huy tối đa lực rửa trôi. Đây là vẻ đẹp của việc làm chủ tham số hóa trong không gian $O x y z$!
    ]
  ],
)


