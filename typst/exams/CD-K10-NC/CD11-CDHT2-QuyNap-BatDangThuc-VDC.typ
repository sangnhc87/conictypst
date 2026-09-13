#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU
// ══════════════════════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.82em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 2pt + rgb("4C1D95")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("4C1D95"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("6D28D9")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("6D28D9"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("7C3AED")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("7C3AED"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("6D28D9")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Quy nạp & Bất đẳng thức
#let c-purple-dark = rgb("4C1D95")
#let c-purple = rgb("6D28D9")
#let c-violet = rgb("7C3AED")
#let c-blue = rgb("2563EB")
#let c-red = rgb("DC2626")
#let c-bg-purple = rgb("FAF5FF")
#let c-border = rgb("E9D5FF")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-purple,
    stroke: (
      left: 6pt + c-purple-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-purple-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: PHƯƠNG PHÁP QUY NẠP TOÁN HỌC,\
      QUY NẠP LÙI CAUCHY & BẤT ĐẲNG THỨC NÂNG CAO
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4B5563"))[
      Chuyên đề học tập 2 Toán 10 (GDPT 2018) -- Quy nạp hoàn toàn, quy nạp mạnh, quy nạp lùi Cauchy,\
      BĐT Bernoulli, BĐT AM-GM tổng quát, đồng dư số học & bài toán phân chia hình học
    ]
  ]
]

#v(1em)

= PHẦN I: CƠ SỞ LÝ THUYẾT & CÁC NGUYÊN LÝ QUY NẠP CỐT LÕI

== 1. Nguyên lý quy nạp toán học suy rộng (Cơ sở $n_0$)
Để chứng minh một mệnh đề $P(n)$ đúng với mọi số tự nhiên $n ge n_0$ ($n_0 in NN$), ta thực hiện hai bước:
- *Bước cơ sở (Base Step)*: Kiểm tra mệnh đề $P(n)$ đúng khi $n = n_0$.
- *Bước quy nạp (Inductive Step)*: Giả sử mệnh đề $P(n)$ đúng với một số tự nhiên bất kỳ $k ge n_0$ (gọi là *giả thiết quy nạp*), tức là thừa nhận $P(k)$ đúng. Cần chứng minh mệnh đề cũng đúng khi $n = k + 1$, tức là $P(k+1)$ đúng.
- *Kết luận*: Theo nguyên lý quy nạp toán học, $P(n)$ đúng với mọi số tự nhiên $n ge n_0$.

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Vẽ chuỗi quân cờ Domino ngã liên tiếp
    for i in range(0, 5) {
      let x = i * 1.5 - 3
      if i < 3 {
        // Các quân cờ đang đổ nghiêng
        line((x, 0), (x + 0.6, 1.2), stroke: 2.5pt + c-purple)
        circle((x + 0.6, 1.2), radius: 0.08, fill: c-purple)
        content((x + 0.3, -0.4), text(size: 8pt)[$P(#(i+1))$])
      } else if i == 3 {
        // Quân cờ k
        line((x, 0), (x + 0.6, 1.2), stroke: 2.5pt + c-violet)
        content((x + 0.3, -0.4), text(size: 8pt, weight: "bold", fill: c-violet)[$P(k)$])
      } else {
        // Quân cờ k+1 sắp đổ
        line((x, 0), (x + 0.3, 1.3), stroke: 2.5pt + c-red)
        content((x + 0.3, -0.4), text(size: 8pt, weight: "bold", fill: c-red)[$P(k+1)$])
      }
    }
    content((0, 1.8), text(size: 8.5pt, style: "italic", fill: c-purple-dark)[Hiệu ứng Domino: Quân $P(1)$ ngã kéo theo quân $P(k)$ ngã thì $P(k+1)$ ắt phải ngã!])
  })
]

== 2. Nguyên lý quy nạp mạnh (Strong Induction)
Trong một số bài toán (như dãy truy hồi dạng Fibonacci hoặc phân tích thừa số nguyên tố), giả thiết $P(k)$ đúng là chưa đủ lực để suy ra $P(k+1)$, ta cần giả thiết mạnh hơn:
- *Bước cơ sở*: Kiểm tra $P(n_0), P(n_0 + 1), dots, P(n_0 + m)$ đúng.
- *Bước quy nạp*: Giả sử $P(i)$ đúng với *mọi* số tự nhiên $i$ thỏa mãn $n_0 le i le k$. Ta chứng minh $P(k+1)$ đúng.

== 3. Kỹ thuật quy nạp lùi Cauchy (Forward-Backward Induction)
Đây là một trong những tuyệt kỹ chứng minh đẹp nhất của Augustin-Louis Cauchy, dùng để chứng minh các mệnh đề phụ thuộc biến nguyên $n$ (đặc biệt là bất đẳng thức đối xứng như AM-GM $n$ số):
- *Bước 1 (Quy nạp tiến qua lũy thừa của 2)*: Chứng minh $P(2)$ đúng. Sau đó giả sử $P(2^m)$ đúng, chứng minh $P(2^(m+1))$ đúng. Suy ra $P(n)$ đúng với mọi $n = 2^k$ ($k in NN^*$).
- *Bước 2 (Quy nạp lùi)*: Chứng minh rằng nếu $P(k)$ đúng thì $P(k - 1)$ cũng đúng ($forall k ge 2$).
- *Kết luận*: Do mọi số tự nhiên $n$ đều có thể bị chặn bởi một lũy thừa của 2 ($n < 2^k$), quá trình lùi liên tiếp từ $2^k$ về $n$ đảm bảo $P(n)$ đúng với mọi $n in NN^*$.

== 4. Hai bất đẳng thức kinh điển
- *Bất đẳng thức Bernoulli*: Với mọi số thực $x > -1, x != 0$ và số nguyên $n ge 2$, ta luôn có:
  $ (1 + x)^n > 1 + n x $
- *Bất đẳng thức AM-GM cho $n$ số không âm*: Cho $n$ số thực không âm $a_1, a_2, dots, a_n ge 0$, ta có:
  $ (a_1 + a_2 + dots + a_n)/n ge root(n, a_1 a_2 dots a_n) $
  Đẳng thức xảy ra khi và chỉ khi $a_1 = a_2 = dots = a_n$.

== 5. Nguồn gốc lịch sử & Các hướng mở rộng cao cấp

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("4C1D95"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-purple-dark)[a) Nguồn gốc lịch sử: Từ Maurolico và Pascal đến Cauchy:]
  - *Francesco Maurolico (1494--1575)*: Trong tác phẩm *Arithmeticorum Libri Duo*, Maurolico lần đầu tiên trình bày phương pháp chứng minh từ $n$ lên $n+1$ cho chuỗi số tự nhiên.
  - *Blaise Pascal (1623--1662)*: Trong *Traité du triangle arithmétique* (1654), Pascal chính thức hệ thống hóa phương pháp này thành một tiên đề toán học hoàn chỉnh mang tên "Quy nạp toán học" để chứng minh các hệ thức tổ hợp trên Tam giác Pascal.
  - *Augustin-Louis Cauchy (1789--1857)*: Sáng tạo kỹ thuật *Quy nạp tiến - lùi (Forward-Backward Induction)* bất hủ trong *Cours d'Analyse* (1821) để chứng minh BĐT AM-GM: Chứng minh cho lũy thừa $2^k$ bằng quy nạp tiến, sau đó lùi từ $k$ về $k-1$ bằng cách gán số hạng cuối bằng giá trị trung bình cộng $a_n = A$!

  #v(0.4em)
  #text(weight: "bold", fill: c-purple-dark)[b) Hướng mở rộng 1: Quy nạp siêu hạn (Transfinite Induction):]
  - Trên các tập hợp vô hạn không đếm được, nguyên lý quy nạp thông thường trên tập số tự nhiên $NN$ không còn áp dụng được. Nhà toán học *Georg Cantor* đã mở rộng quy nạp toán học lên các số thứ tự vô hạn (*Ordinals*) mang tên *Quy nạp siêu hạn*.
  - Đây là công cụ quyền năng bậc nhất của Lý thuyết tiên đề tập hợp hiện đại, dùng để chứng minh Định lý sắp thứ tự tốt (Well-Ordering Theorem) và Bổ đề Zorn.

  #v(0.4em)
  #text(weight: "bold", fill: c-purple-dark)[c) Hướng mở rộng 2: Lý thuyết Sắp thứ tự trội (Majorization) & BĐT Karamata (1932):]
  - Cho hai dãy số giảm dần $x = (x_1 ge x_2 ge dots ge x_n)$ và $y = (y_1 ge y_2 ge dots ge y_n)$. Ta nói $x$ *trội hơn* $y$ (ký hiệu $x succ y$) nếu $sum_(i=1)^k x_i ge sum_(i=1)^k y_i$ với mọi $k < n$ và $sum_(i=1)^n x_i = sum_(i=1)^n y_i$.
  - *Định lý Karamata*: Nếu $x succ y$ thì với mọi hàm lồi $f(t)$, ta luôn có:
    $ sum_(i=1)^n f(x_i) ge sum_(i=1)^n f(y_i) $
    Bất đẳng thức Karamata bao hàm hầu hết các bất đẳng thức đối xứng kinh điển của Olympic (AM-GM, Cauchy-Schwarz, Jensen, Schur, Muirhead) dưới một góc nhìn thống nhất và bao quát.
]

#v(1em)

= PHẦN II: 4 DẠNG TOÁN VẬN DỤNG CAO & KỸ THUẬT CHỨNG MINH

== Dạng 1: Chứng minh đẳng thức đại số & Tính tổng lũy thừa hữu hạn
- Kỹ thuật: Phân tích biểu thức $S_(k+1) = S_k + u_(k+1)$. Sử dụng hằng đẳng thức hoặc khai triển nhị thức Newton để đồng nhất các hệ số.

== Dạng 2: Chứng minh tính chất chia hết trong số học
- Kỹ thuật: Biến đổi biểu thức $A_(k+1) - A_k$ hoặc $A_(k+1) - m A_k$ sao cho hiệu số xuất hiện thừa số chia hết hiển nhiên.
- Dùng công thức nhị thức Newton $(a + b)^n = a^n + C_n^1 a^(n-1) b + dots$ để chứng minh các bài toán chia hết cho số mũ lớn.

== Dạng 3: Bất đẳng thức quy nạp & Bất đẳng thức giải tích
- Kỹ thuật: Tăng cường giả thiết quy nạp (Strengthening the Induction Hypothesis). Đôi khi một mệnh đề tổng quát $P(n)$ khó chứng minh trực tiếp, nhưng khi làm mạnh biểu thức thành $Q(n)$ (ví dụ thêm đại lượng âm) thì bước chuyển $k -> k+1$ lại dễ dàng triệt tiêu.

== Dạng 4: Quy nạp hình học & Bài toán lát gạch (Tromino Tiling)
- Kỹ thuật: Chia hình khối kích thước $2^n times 2^n$ thành 4 góc phần tư kích thước $2^(n-1) times 2^(n-1)$, đặt một viên gạch chữ L (Tromino) vào trung tâm để mỗi góc đều khuyết đúng 1 ô, áp dụng giả thiết quy nạp.

#v(1em)

= PHẦN III: BÀI TẬP MẪU CÓ LỜI GIẢI SƯ PHẠM CHI TIẾT

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tl(
  [*(Chứng minh Bất đẳng thức Bernoulli bằng quy nạp)*\
  Cho số thực $x > -1$ và $x != 0$. Chứng minh rằng với mọi số nguyên dương $n ge 2$, ta luôn có:
  $ (1 + x)^n > 1 + n x $],
  loigiai: [
    #step[
      *Bước cơ sở (Base Step):* \
      Với $n = 2$, vế trái là $(1 + x)^2 = 1 + 2x + x^2$. \
      Vì $x != 0$ nên $x^2 > 0$, do đó:
      $ (1 + x)^2 = 1 + 2x + x^2 > 1 + 2x $
      Vậy bất đẳng thức đúng với $n = 2$.
    ]

    #step[
      *Bước quy nạp (Inductive Step):* \
      Giả sử bất đẳng thức đúng với $n = k ge 2$, nghĩa là:
      $ (1 + x)^k > 1 + k x quad text("(Giả thiết quy nạp)") $
      Ta cần chứng minh bất đẳng thức cũng đúng khi $n = k + 1$, tức là:
      $ (1 + x)^(k+1) > 1 + (k + 1)x $
      Thật vậy, vì $x > -1 <=> 1 + x > 0$, ta nhân cả hai vế của giả thiết quy nạp với số dương $(1 + x)$:
      $ (1 + x)^(k+1) = (1 + x)^k dot (1 + x) > (1 + k x)(1 + x) $
      Khai triển vế phải:
      $ (1 + k x)(1 + x) = 1 + x + k x + k x^2 = 1 + (k + 1)x + k x^2 $
      Vì $k ge 2 > 0$ và $x != 0$ nên $k x^2 > 0$. Suy ra:
      $ 1 + (k + 1)x + k x^2 > 1 + (k + 1)x $
      Từ đó suy ra:
      $ (1 + x)^(k+1) > 1 + (k + 1)x $
      Như vậy, bất đẳng thức đúng với $n = k + 1$.
    ]

    #step[
      *Kết luận:* \
      Theo nguyên lý quy nạp toán học, bất đẳng thức Bernoulli đúng với mọi số nguyên $n ge 2$.
    ]
  ]
)

#v(0.8em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tl(
  [*(Quy nạp hình học -- Bài toán lát bảng khuyết bằng quân Tromino chữ L)*\
  Cho một bảng vuông kích thước $2^n times 2^n$ ô vuông đơn vị ($n in NN^*$), trong đó có đúng một ô vuông bất kỳ bị khoét bỏ. Một quân cờ Tromino chữ L gồm 3 ô vuông đơn vị ghép lại như hình vẽ. Chứng minh rằng luôn có thể lát kín phần còn lại của bảng bằng các quân Tromino chữ L mà không đè lên nhau và không tràn ra ngoài.],
  loigiai: [
    #step[
      *Bước cơ sở:* \
      Với $n = 1$, bảng có kích thước $2^1 times 2^1 = 2 times 2$ gồm 4 ô vuông. Bị khoét 1 ô thì còn đúng 3 ô vuông tạo thành hình một quân Tromino chữ L. Ta chỉ cần đặt đúng 1 quân Tromino là phủ kín bảng. Mệnh đề đúng với $n = 1$.
    ]

    #step[
      *Bước quy nạp:* \
      Giả sử mệnh đề đúng với $n = k ge 1$, tức là mọi bảng kích thước $2^k times 2^k$ bị khuyết đúng 1 ô bất kỳ đều lát kín được bằng các quân Tromino chữ L. \
      Xét bảng kích thước $2^(k+1) times 2^(k+1)$ bị khoét 1 ô bất kỳ.
      - Ta chia bảng lớn này thành 4 bảng con bằng nhau kích thước $2^k times 2^k$ (góc Tây Bắc, Đông Bắc, Tây Nam, Đông Nam).
      - Ô bị khoét ban đầu ắt phải nằm ở một trong bốn bảng con (giả sử ở bảng Tây Bắc).
      - Đối với ba bảng con còn lại (không chứa ô bị khoét ban đầu), ta xét ba ô góc của chúng nằm chụm vào trung tâm bảng lớn. Đặt đúng một quân Tromino chữ L che phủ 3 ô góc trung tâm này!
      - Khi đó, mỗi bảng trong 4 bảng con kích thước $2^k times 2^k$ đều có đúng một ô bị "khuyết" (bảng Tây Bắc có ô khuyết ban đầu, 3 bảng còn lại có ô khuyết do quân Tromino trung tâm vừa che).
      - Áp dụng giả thiết quy nạp cho từng bảng con $2^k times 2^k$, mỗi bảng con đều lát kín được hoàn toàn bằng các quân Tromino.
      Vậy bảng kích thước $2^(k+1) times 2^(k+1)$ được lát kín hoàn toàn.
    ]

    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *
        // Vẽ quân Tromino L bên trái
        rect((-5.5, 0.5), (-4.5, 2.5), fill: rgb("EDE9FE"), stroke: 1.5pt + c-purple)
        rect((-4.5, 0.5), (-3.5, 1.5), fill: rgb("EDE9FE"), stroke: 1.5pt + c-purple)
        line((-4.5, 1.5), (-4.5, 0.5), stroke: 0.8pt + c-purple)
        content((-4.5, -0.2), text(size: 8pt, weight: "bold", fill: c-purple)[Quân Tromino chữ L])

        // Vẽ bảng 4x4 chia làm 4 bảng 2x2
        // Bảng lớn
        rect((-1.5, -0.5), (3.5, 4.5), stroke: 2pt + c-purple-dark)
        // Đường phân chia 4 góc 2x2
        line((1, -0.5), (1, 4.5), stroke: (dash: "dashed", paint: c-purple-dark, thickness: 1.5pt))
        line((-1.5, 2), (3.5, 2), stroke: (dash: "dashed", paint: c-purple-dark, thickness: 1.5pt))
        // Lưới 4x4
        for x in (-0.5, 2.25) {
          line((x, -0.5), (x, 4.5), stroke: 0.5pt + gray)
        }
        for y in (0.75, 3.25) {
          line((-1.5, y), (3.5, y), stroke: 0.5pt + gray)
        }

        // Ô bị khoét ban đầu ở góc Tây Bắc (ô (-1.5, 3.25) đến (-0.5, 4.5))
        rect((-1.5, 3.25), (-0.5, 4.5), fill: rgb("FCA5A5"), stroke: 1.5pt + c-red)
        content((-1, 3.85), text(size: 7.5pt, fill: c-red, weight: "bold")[Ô khoét])

        // Quân Tromino trung tâm lấp 3 ô góc tiếp giáp
        // Ô Đông Bắc trung tâm: (1, 2) đến (2.25, 3.25)
        rect((1, 2), (2.25, 3.25), fill: rgb("DDD6FE"), stroke: 1.5pt + c-purple)
        // Ô Tây Nam trung tâm: (-0.5, 0.75) đến (1, 2)
        rect((-0.5, 0.75), (1, 2), fill: rgb("DDD6FE"), stroke: 1.5pt + c-purple)
        // Ô Đông Nam trung tâm: (1, 0.75) đến (2.25, 2)
        rect((1, 0.75), (2.25, 2), fill: rgb("DDD6FE"), stroke: 1.5pt + c-purple)
        content((1.3, 1.4), text(size: 7.5pt, fill: c-purple-dark, weight: "bold")[Tromino\ trung tâm])

        content((1, -1.1), text(size: 8pt, style: "italic", fill: c-purple-dark)[Quy nạp bảng $4 times 4$: Đặt 1 quân Tromino trung tâm để 3 bảng con $2 times 2$ còn lại đều có 1 ô khuyết!])
      })
    ]

    #step[
      *Kết luận:* \
      Theo nguyên lý quy nạp toán học, mệnh đề đúng với mọi số nguyên dương $n$.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 3 ─────────────────────────────────────────────────
#tl(
  [*(Bất đẳng thức Schur bậc 3 & Phương pháp Dồn biến SOS)*\
  Cho ba số thực không âm $a, b, c ge 0$. Chứng minh bất đẳng thức Schur bậc ba kinh điển:
  $ a^3 + b^3 + c^3 + 3 a b c ge a b(a + b) + b c(b + c) + c a(c + a) $
  và chỉ ra dấu đẳng thức xảy ra trong những trường hợp nào.],
  loigiai: [
    #step[
      *Bước 1: Viết bất đẳng thức dưới dạng tổng bình phương đối xứng (SOS):* \
      Ta đưa bất đẳng thức về dạng chính tắc:
      $ a(a - b)(a - c) + b(b - c)(b - a) + c(c - a)(c - b) ge 0. $
      Thật vậy, khai triển trực tiếp vế trái:
      $ a(a^2 - a b - a c + b c) + b(b^2 - b c - a b + c a) + c(c^2 - c a - b c + a b) $
      $ = a^3 + b^3 + c^3 + 3 a b c - [a^2 b + a^2 c + b^2 c + b^2 a + c^2 a + c^2 b] $
      $ = a^3 + b^3 + c^3 + 3 a b c - [a b(a+b) + b c(b+c) + c a(c+a)]. $
      Do đó hai dạng phát biểu là hoàn toàn tương đương!
    ]
    #step[
      *Bước 2: Giả sử thứ tự và đánh giá đại số:* \
      Do tính đối xứng hoàn toàn giữa ba biến $a, b, c$, không mất tính tổng quát ta giả sử: $a ge b ge c ge 0$. \
      Khi đó:
      - $c(c - a)(c - b) ge 0$ (vì $c - a le 0$ và $c - b le 0$ nên tích hai số âm là số không âm, nhân với $c ge 0$).
      - Nhóm hai số hạng đầu tiên lại:
        $ a(a - b)(a - c) + b(b - c)(b - a) = (a - b) [a(a - c) - b(b - c)]. $
      Vì $a ge b$ nên $a - b ge 0$. Mặt khác:
      $ a(a - c) - b(b - c) = a^2 - a c - b^2 + b c = (a^2 - b^2) - c(a - b) = (a - b)(a + b - c). $
      Vì $a ge b ge c$ nên $a + b - c ge b + b - c = 2b - c ge 0$. \
      Do đó: $a(a - c) - b(b - c) = (a - b)(a + b - c) ge 0$. \
      Suy ra cả hai đại lượng đều không âm:
      $ a(a - b)(a - c) + b(b - c)(b - a) + c(c - a)(c - b) ge 0. $
    ]
    #step[
      *Bước 3: Điều kiện xảy ra đẳng thức:* \
      Đẳng thức xảy ra khi và chỉ khi:
      - Trường hợp 1: $a = b = c$ (ba biến bằng nhau).
      - Trường hợp 2: $a = b$ và $c = 0$ hoặc các hoán vị (hai biến bằng nhau, biến còn lại bằng $0$).
    ]
  ]
)

#v(1em)

= PHẦN IV: BÀI TẬP TỰ LUYỆN VDC ĐỈNH CAO (CHUẨN OLYMPIC & MA TRẬN 2025)

== 1. Trắc nghiệm nhiều lựa chọn (6 Câu VDC Đỉnh Cao)

// CÂU 1
#tn(
  [*(Bất đẳng thức Schur bậc 3 & Kỹ thuật dồn biến)*: \
  Cho ba số thực không âm $a, b, c$ thỏa mãn $a + b + c = 3$. Giá trị nhỏ nhất của biểu thức:
  $ P = a^3 + b^3 + c^3 + 6 a b c $
  bằng bao nhiêu?],
  (
    [$3$],
    True([$9$]),
    [$12$],
    [$27/4$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-purple)[BĐT Schur bậc 3: $a^3 + b^3 + c^3 + 3 a b c ge sum a b(a+b)$])
  }),
  loigiai: [
    #step[
      *Bất đẳng thức Schur bậc 3 dạng chuẩn:* \
      Với mọi $a, b, c ge 0$: $a^3 + b^3 + c^3 + 3 a b c ge a b(a+b) + b c(b+c) + c a(c+a)$. \
      Cộng $3 a b c$ vào cả hai vế:
      $ a^3 + b^3 + c^3 + 6 a b c ge a b(a+b) + b c(b+c) + c a(c+a) + 3 a b c = (a+b)(b+c)(c+a). $
      Mặt khác, theo hằng đẳng thức đối xứng:
      $ (a+b+c)^3 = a^3 + b^3 + c^3 + 3(a+b)(b+c)(c+a) - 3 a b c. $
      Biểu diễn theo các biến nguyên cơ sở $p = a+b+c = 3, q = a b + b c + c a, r = a b c$:
      $ P = p^3 - 3 p q + 9r = 27 - 9q + 9r. $
      Theo BĐT Schur: $r ge frac(p(4q - p^2), 9) = frac(3(4q - 9), 9) = frac(4q - 9, 3) = frac(4, 3) q - 3$. \
      Thay vào $P$: $P ge 27 - 9q + 9(frac(4, 3) q - 3) = 27 - 9q + 12q - 27 = 3q$. \
      Vì $a, b, c ge 0$ có tổng bằng 3 nên khi cho $a = 3, b = c = 0$, ta có $P = 3^3 = 27$. \
      Khi $a = b = c = 1$, ta có $P = 1 + 1 + 1 + 6(1) = 9$. \
      Do đó giá trị nhỏ nhất của $P$ là $9$ khi $a = b = c = 1$.
    ]
  ]
)

// CÂU 2
#tn(
  [*(Bổ đề Titu — Bất đẳng thức Cauchy-Schwarz dạng Engel 4 biến)*: \
  Cho bốn số thực dương $a, b, c, d > 0$ thỏa mãn điều kiện $a + b + c + d = 4$. Giá trị nhỏ nhất của biểu thức:
  $ S = frac(a^2, b + c) + frac(b^2, c + d) + frac(c^2, d + a) + frac(d^2, a + b) $
  bằng:],
  (
    [$1$],
    True([$2$]),
    [$4$],
    [$8/3$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-purple)[Bổ đề Titu: $sum frac(x_i^2, y_i) ge frac((sum x_i)^2, sum y_i)$])
  }),
  loigiai: [
    #step[
      *Áp dụng Bổ đề Titu (Cauchy-Schwarz dạng Engel):* \
      Với các số thực dương, ta luôn có:
      $ sum_(i=1)^4 frac(x_i^2, y_i) ge frac((x_1 + x_2 + x_3 + x_4)^2, y_1 + y_2 + y_3 + y_4). $
      Áp dụng cho $S$:
      $ S ge frac((a + b + c + d)^2, (b + c) + (c + d) + (d + a) + (a + b)) = frac((a + b + c + d)^2, 2(a + b + c + d)) = frac(a + b + c + d, 2). $
      Vì $a + b + c + d = 4$, suy ra:
      $ S ge 4/2 = 2. $
      Đẳng thức xảy ra khi $a/(b+c) = b/(c+d) = c/(d+a) = d/(a+b)$, tức là $a = b = c = d = 1$. \
      Vậy giá trị nhỏ nhất của $S$ bằng $2$.
    ]
  ]
)

// CÂU 3
#tn(
  [*(Định lý Mantel-Turán & Quy nạp Đồ thị không chứa tam giác)*: \
  Một mạng lưới gồm $n = 10$ máy chủ kết nối với nhau bằng các kênh truyền tin trực tiếp hai chiều. Biết rằng trong mạng lưới *không tồn tại bất kỳ bộ ba máy chủ nào đôi một kết nối với nhau* (tức đồ thị không chứa tam giác $K_3$). Hỏi số kênh truyền tin tối đa có thể lắp đặt trong mạng lưới bằng bao nhiêu?],
  (
    [$20$],
    True([$25$]),
    [$30$],
    [$45$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-purple)[Định lý Mantel: $"Max edges" = floor(n^2 / 4) = floor(100 / 4) = 25$])
  }),
  loigiai: [
    #step[
      *Định lý Mantel (Chứng minh bằng quy nạp toán học):* \
      Số cạnh tối đa của một đồ thị đơn $n$ đỉnh không chứa chu trình tam giác $K_3$ là $floor(n^2 / 4)$. \
      - Với $n = 10$: $floor(10^2 / 4) = floor(100 / 4) = 25$.
      - Cấu hình cực đại đạt được khi ta chia $10$ đỉnh thành hai tập hợp $A$ và $B$ rời nhau, mỗi tập có đúng $5$ đỉnh, và nối toàn bộ $5 times 5 = 25$ cạnh giữa $A$ và $B$ (Đồ thị hai phía đầy đủ $K_(5, 5)$).
    ]
  ]
)

// CÂU 4
#tn(
  [*(Bất đẳng thức Jensen đa biến & Cực trị lượng giác tam giác)*: \
  Cho tam giác $A B C$ có ba góc nhọn. Giá trị lớn nhất của biểu thức $P = sin A dot sin B dot sin C$ bằng biểu thức nào sau đây?],
  (
    [$3/8$],
    True([$frac(3 sqrt(3), 8)$]),
    [$frac(sqrt(3), 2)$],
    [$1$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-purple)[Hàm $f(x) = ln(sin x)$ lõm trên $(0, pi) => P le (sin(pi/3))^3 = frac(3sqrt(3), 8)$])
  }),
  loigiai: [
    #step[
      *Áp dụng Bất đẳng thức Jensen cho hàm lồi/lõm:* \
      Xét hàm số $f(x) = ln(sin x)$ trên khoảng $(0; pi)$. \
      Đạo hàm: $f'(x) = cot x$, $f''(x) = - frac(1, sin^2 x) < 0$ với mọi $x in (0; pi)$. \
      Do $f''(x) < 0$ nên $f(x)$ là hàm lõm ngặt trên $(0; pi)$. \
      Theo bất đẳng thức Jensen:
      $ frac(ln(sin A) + ln(sin B) + ln(sin C), 3) le ln(sin(frac(A + B + C, 3))) = ln(sin(pi / 3)) = ln(frac(sqrt(3), 2)). $
      Lấy mũ hai vế:
      $ root(3, sin A sin B sin C) le frac(sqrt(3), 2) ==> sin A sin B sin C le (frac(sqrt(3), 2))^3 = frac(3 sqrt(3), 8). $
      Đẳng thức xảy ra khi $A = B = C = pi/3$ (tam giác đều).
    ]
  ]
)

// CÂU 5
#tn(
  [*(Bất đẳng thức Minkowski dạng hình học vector)*: \
  Cho các số thực $x, y$ tùy ý. Giá trị nhỏ nhất của biểu thức:
  $ P = sqrt(x^2 + 1) + sqrt((y - x)^2 + 4) + sqrt((3 - y)^2 + 9) $
  bằng bao nhiêu?],
  (
    [$3 sqrt(5)$],
    True([$3 sqrt(5)$]),
    [$5 sqrt(2)$],
    [$6$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-purple)[Minkowski: $|vec(u)| + |vec(v)| + |vec(w)| ge |vec(u) + vec(v) + vec(w)| = sqrt(3^2 + 6^2) = 3sqrt(5)$])
  }),
  loigiai: [
    #step[
      *Đưa về độ dài vectơ và BĐT tam giác Minkowski:* \
      Xét ba vectơ trong mặt phẳng toạ độ $O x y$:
      $ vec(u) = (x; 1), quad vec(v) = (y - x; 2), quad vec(w) = (3 - y; 3). $
      Khi đó:
      - $|vec(u)| = sqrt(x^2 + 1^2) = sqrt(x^2 + 1)$.
      - $|vec(v)| = sqrt((y - x)^2 + 2^2) = sqrt((y - x)^2 + 4)$.
      - $|vec(w)| = sqrt((3 - y)^2 + 3^2) = sqrt((3 - y)^2 + 9)$. \
      Tổng ba vectơ là:
      $ vec(u) + vec(v) + vec(w) = (x + (y - x) + (3 - y); 1 + 2 + 3) = (3; 6). $
      Theo Bất đẳng thức Minkowski (BĐT tam giác mở rộng cho $n$ vectơ):
      $ P = |vec(u)| + |vec(v)| + |vec(w)| ge |vec(u) + vec(v) + vec(w)| = sqrt(3^2 + 6^2) = sqrt(9 + 36) = sqrt(45) = 3 sqrt(5). $
      Đẳng thức xảy ra khi và chỉ khi ba vectơ cùng hướng:
      $ frac(x, 1) = frac(y - x, 2) = frac(3 - y, 3) = frac(3, 6) = 1/2 ==> x = 1/2, y = 3/2. $
      Vậy GTNN của $P$ là $3 sqrt(5)$.
    ]
  ]
)

// CÂU 6
#tn(
  [*(Dãy số truy hồi phi tuyến phân kỳ chậm Putnam)*: \
  Cho dãy số $(x_n)$ xác định bởi: $x_1 = 1$ và $x_(n+1) = x_n + frac(1, x_n)$ với mọi $n ge 1$. Bằng phương pháp quy nạp toán học, người ta chứng minh được đánh giá chặt:
  $ sqrt(2n - 1) le x_n le sqrt(2n) quad (forall n ge 1). $
  Giá trị của phần nguyên $floor(x_(100))$ bằng:],
  (
    [$13$],
    True([$14$]),
    [$15$],
    [$10$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-purple)[$sqrt(199) le x_100 le sqrt(200) => floor(x_100) = 14$])
  }),
  loigiai: [
    #step[
      *Phân tích đánh giá quy nạp cho $x_n^2$:* \
      Ta có: $x_(k+1)^2 = (x_k + 1/x_k)^2 = x_k^2 + 2 + frac(1, x_k^2) > x_k^2 + 2$. \
      Lấy tổng liên tiếp: $x_n^2 > x_1^2 + 2(n - 1) = 1 + 2n - 2 = 2n - 1$. Do đó $x_n > sqrt(2n - 1)$. \
      Với $n = 100$:
      $ sqrt(2(100) - 1) = sqrt(199) < x_(100) le sqrt(2(100)) = sqrt(200). $
      Vì $14^2 = 196 < 199$ và $15^2 = 225 > 200$, nên:
      $ 14 < sqrt(199) < x_(100) < sqrt(200) < 15. $
      Suy ra phần nguyên $floor(x_(100)) = 14$.
    ]
  ]
)

== 2. Trắc nghiệm Đúng/Sai (2 Câu Toàn Diện & Đẳng Cấp)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Phương Pháp Dồn Biến P-Q-R & Bất Đẳng Thức Schur Trong Olympic)*: \
  Cho ba số thực không âm $a, b, c$. Đặt $p = a + b + c, q = a b + b c + c a, r = a b c$ là các đa thức đối xứng cơ sở của ba biến:],
  (
    True([Bất đẳng thức Schur bậc 3 tương đương với hệ thức: $p^3 - 4 p q + 9r ge 0$.]),
    True([Điều kiện cần và đủ để ba số thực không âm $a, b, c$ tồn tại là $p ge 0, q ge 0, r ge 0$ và đa thức bậc ba $f(t) = t^3 - p t^2 + q t - r$ có ba nghiệm thực.]),
    True([Với $p$ và $q$ không đổi, đại lượng $r = a b c$ đạt giá trị lớn nhất khi và chỉ khi có ít nhất hai biến bằng nhau.]),
    False([Bất đẳng thức Schur bậc 4: $a^4 + b^4 + c^4 + a b c(a+b+c) ge a b(a^2+b^2) + b c(b^2+c^2) + c a(c^2+a^2)$ không thể chứng minh được bằng quy nạp.]),
  ),
  loigiai: [
    *(a) Đúng.* Biến đổi trực tiếp: $sum a^3 + 3 a b c - sum a b(a+b) = p^3 - 3 p q + 3r + 3r - q p + 3r = p^3 - 4 p q + 9r ge 0$. \
    *(b) Đúng.* Định lý Viète cho đa thức bậc ba. \
    *(c) Đúng.* Đây là nguyên lý dồn biến cốt lõi: Khi cố định tổng $p$ và tổng tích $q$, $r$ đạt cực trị tại biên (hai biến bằng nhau hoặc một biến bằng 0). \
    *(d) Sai.* BĐT Schur tổng quát bậc $r$: $a^r(a-b)(a-c) + b^r(b-c)(b-a) + c^r(c-a)(c-b) ge 0$ đúng với mọi $r > 0$ và hoàn toàn chứng minh được bằng quy nạp theo số biến hoặc tính đối xứng hoán vị.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Lý Thuyết Sắp Thứ Tự Trội Majorization & Bất Đẳng Thức Karamata)*: \
  Cho hai bộ số thực giảm dần $x = (x_1 ge x_2 ge dots ge x_n)$ và $y = (y_1 ge y_2 ge dots ge y_n)$ cùng có tổng bằng nhau $sum x_i = sum y_i$. Ta nói $x$ trội hơn $y$ (ký hiệu $x succ y$) nếu $sum_(i=1)^k x_i ge sum_(i=1)^k y_i$ với mọi $k = 1, 2, dots, n - 1$],
  (
    True([Với ba số dương $a, b, c$, bộ số $(3, 0, 0)$ luôn trội hơn bộ số $(2, 1, 0)$ và $(2, 1, 0)$ trội hơn $(1, 1, 1)$.]),
    True([Theo Định lý Karamata, nếu $x succ y$ và $f$ là hàm số lồi thì $sum_(i=1)^n f(x_i) ge sum_(i=1)^n f(y_i)$.]),
    True([Bất đẳng thức AM-GM cho $n$ số thực dương có thể suy ra trực tiếp từ Định lý Karamata bằng cách áp dụng cho hàm lồi $f(t) = -ln t$.]),
    False([Bất đẳng thức Cauchy-Schwarz không thể biểu diễn dưới dạng sắp thứ tự trội.]),
  ),
  loigiai: [
    *(a) Đúng.* Kiểm tra các tổng tiền tố: $3 ge 2 ge 1$, tổng cuối cùng đều bằng 3. \
    *(b) Đúng.* Đây là định nghĩa của Định lý Karamata (1932). \
    *(c) Đúng.* Bộ $(x_1, dots, x_n) succ (A, dots, A)$ với $A$ là trung bình cộng. Áp dụng cho $f(t) = -ln t$ cho $- sum ln x_i ge - n ln A <=> product x_i le A^n$. \
    *(d) Sai.* BĐT Cauchy-Schwarz là trường hợp riêng của BĐT Muirhead và Karamata khi viết dưới dạng đơn thức đồng bậc đối xứng.
  ]
)

== 3. Trả lời ngắn (4 Câu VDC Cực Khó)

// TLN 1
#tln(
  [*(Bất đẳng thức Olympic Quốc tế IMO 1995)*: \
  Cho ba số thực dương $a, b, c$ thỏa mãn điều kiện $a b c = 1$. Giá trị nhỏ nhất của biểu thức:
  $ P = frac(1, a^3(b + c)) + frac(1, b^3(c + a)) + frac(1, c^3(a + b)) $
  bằng bao nhiêu? (viết kết quả dưới dạng phân số tối giản).],
  [$3/2$],
  loigiai: [
    #step[
      *Đổi biến nghịch đảo chuẩn hóa IMO 1995:* \
      Đặt $x = 1/a, y = 1/b, z = 1/c$. Do $a b c = 1 => x y z = 1$. \
      Biến đổi từng số hạng:
      $ frac(1, a^3(b + c)) = frac(x^3, 1/y + 1/z) = frac(x^3, (y+z)/(y z)) = frac(x^3 y z, y + z) = frac(x^2 (x y z), y + z) = frac(x^2, y + z). $
      Biểu thức trở thành:
      $ P = frac(x^2, y + z) + frac(y^2, z + x) + frac(z^2, x + y). $
      Áp dụng Bổ đề Titu (Cauchy-Schwarz dạng Engel):
      $ P ge frac((x + y + z)^2, (y + z) + (z + x) + (x + y)) = frac(x + y + z, 2). $
      Theo BĐT AM-GM cho ba số $x, y, z > 0$ có $x y z = 1$:
      $ x + y + z ge 3 root(3, x y z) = 3(1) = 3. $
      Suy ra: $P ge 3/2$. \
      Đẳng thức xảy ra khi $x = y = z = 1 <=> a = b = c = 1$. \
      Vậy GTNN của $P$ là $3/2$.
    ]
  ]
)

// TLN 2
#tln(
  [*(Định lý Erdős về tập tự do ước số — Quy nạp tổ hợp)*: \
  Cho tập hợp $S = {1, 2, 3, dots, 20}$. Người ta chọn ra một tập con $A subset S$ gồm $k$ phần tử sao cho trong $A$ *không có bất kỳ hai số nào mà số này chia hết cho số kia* (không có $a, b in A$ thỏa $a divides b$). Số phần tử lớn nhất $|A|_max$ có thể chọn được bằng bao nhiêu?],
  [$10$],
  loigiai: [
    #step[
      *Áp dụng Định lý Dilworth / Nguyên lý Dirichlet:* \
      Mỗi số nguyên $x in {1, 2, dots, 2n}$ đều có thể biểu diễn duy nhất dưới dạng:
      $ x = 2^k dot m $
      với $m$ là một số nguyên lẻ thuộc tập $\{1, 3, 5, dots, 2n - 1\}$. \
      Có đúng $n$ số lẻ như vậy. \
      Nếu ta chọn $n + 1$ số từ $\{1, 2, dots, 2n\}$, theo nguyên lý Dirichlet, ắt phải có hai số $x_1, x_2$ có cùng phần lẻ $m$:
      $ x_1 = 2^(k_1) m, quad x_2 = 2^(k_2) m. $
      Giả sử $k_1 < k_2$, khi đó hiển nhiên $x_1 divides x_2$. \
      Do đó, để không có hai số nào chia hết cho nhau, ta chỉ có thể chọn tối đa $n$ số. \
      Với $2n = 20 => n = 10$. Ta có thể chọn tập gồm $10$ số lớn: $\{11, 12, 13, dots, 20\}$, không có số nào chia hết cho nhau. \
      Vậy số phần tử lớn nhất là $10$.
    ]
  ]
)

// TLN 3
#tln(
  [*(Bất đẳng thức Nesbitt 4 biến)*: \
  Cho bốn số thực dương $a, b, c, d > 0$. Giá trị nhỏ nhất của biểu thức:
  $ Q = frac(a, b + c + d) + frac(b, c + d + a) + frac(c, d + a + b) + frac(d, a + b + c) $
  bằng bao nhiêu? (viết kết quả dưới dạng phân số tối giản).],
  [$4/3$],
  loigiai: [
    #step[
      Đặt $S = a + b + c + d$. Khi đó:
      $ Q = sum frac(a, S - a) = sum (frac(a, S - a) + 1) - 4 = sum frac(S, S - a) - 4 = S (sum frac(1, S - a)) - 4. $
      Áp dụng BĐT Cauchy-Schwarz dạng Engel:
      $ sum_(i=1)^4 frac(1, S - a_i) ge frac((1 + 1 + 1 + 1)^2, sum (S - a_i)) = frac(16, 4S - S) = frac(16, 3S). $
      Do đó:
      $ Q ge S dot frac(16, 3S) - 4 = 16/3 - 4 = 4/3. $
      Đẳng thức xảy ra khi $a = b = c = d$. Giá trị nhỏ nhất là $4/3$.
    ]
  ]
)

// TLN 4
#tln(
  [*(Cực trị phân thức đối xứng qua Cauchy-Schwarz)*: \
  Cho ba số thực dương $x, y, z > 0$ thỏa mãn điều kiện $x + y + z = 1$. Giá trị nhỏ nhất của biểu thức:
  $ M = frac(x, sqrt(1 - x)) + frac(y, sqrt(1 - y)) + frac(z, sqrt(1 - z)) $
  bằng biểu thức có dạng $sqrt(a)/b$ với $a, b in NN^*$. Tính giá trị của $a + b$.],
  [$8$],
  loigiai: [
    #step[
      *Áp dụng Bất đẳng thức Jensen hoặc AM-GM:* \
      Xét hàm số $f(t) = frac(t, sqrt(1 - t))$ trên $(0; 1)$. \
      Đạo hàm: $f'(t) = frac(2 - t, 2(1 - t)^(3/2)) > 0$. \
      $f''(t) = frac(4 - t, 4(1 - t)^(5/2)) > 0$ với mọi $t in (0; 1)$. \
      Hàm số $f(t)$ là hàm lồi ngặt trên $(0; 1)$. \
      Theo BĐT Jensen:
      $ M = f(x) + f(y) + f(z) ge 3 f(frac(x+y+z, 3)) = 3 f(1/3). $
      Tính $f(1/3)$:
      $ f(1/3) = frac(1/3, sqrt(1 - 1/3)) = frac(1/3, sqrt(2/3)) = frac(1, 3) dot frac(sqrt(3), sqrt(2)) = frac(sqrt(6), 6). $
      Suy ra:
      $ M ge 3 dot frac(sqrt(6), 6) = frac(sqrt(6), 2). $
      Đẳng thức xảy ra khi $x = y = z = 1/3$. \
      Biểu thức có dạng $frac(sqrt(a), b) = frac(sqrt(6), 2) ==> a = 6, b = 2$. \
      Tổng $a + b = 6 + 2 = 8$.
    ]
  ]
)

== 4. Tự luận Vận dụng cao (Phân hóa sâu)

// TỰ LUẬN 1
#tl(
  [*(Chứng minh Bất đẳng thức AM-GM bằng kỹ thuật Quy nạp lùi Cauchy)*\
  Cho $n$ số thực không âm $a_1, a_2, dots, a_n ge 0$ ($n in NN^*, n ge 2$). Hãy chứng minh bất đẳng thức:
  $ (a_1 + a_2 + dots + a_n)/n ge root(n, a_1 a_2 dots a_n) $
  bằng các bước sau:
  1. Chứng minh bất đẳng thức đúng với $n = 2$.
  2. Bằng quy nạp, chứng minh rằng nếu bất đẳng thức đúng với $n = 2^k$ thì nó cũng đúng với $n = 2^(k+1)$ (suy ra đúng với mọi lũy thừa của 2).
  3. Bằng quy nạp lùi, chứng minh rằng nếu bất đẳng thức đúng với $n = k$ ($k ge 3$) thì nó cũng đúng với $n = k - 1$.],
  loigiai: [
    #step[
      *Bước 1: Chứng minh với $n = 2$:* \
      Ta có: $(a_1 + a_2)/2 - sqrt(a_1 a_2) = (sqrt(a_1) - sqrt(a_2))^2 / 2 ge 0$. \
      Đẳng thức xảy ra khi và chỉ khi $a_1 = a_2$.
    ]
    #step[
      *Bước 2: Quy nạp tiến qua lũy thừa của 2:* \
      Giả sử bất đẳng thức đúng với $n = 2^k$. Xét $2^(k+1)$ số không âm $a_1, a_2, dots, a_(2^(k+1))$. \
      Chia $2^(k+1)$ số thành 2 nhóm, mỗi nhóm có $2^k$ số. Áp dụng giả thiết quy nạp cho từng nhóm và áp dụng BĐT cho 2 số đại diện, ta suy ra BĐT đúng với $n = 2^(k+1)$.
    ]
    #step[
      *Bước 3: Quy nạp lùi từ $k$ về $k - 1$:* \
      Giả sử BĐT đúng với $n = k$. Cho $k - 1$ số không âm $a_1, a_2, dots, a_(k-1)$. \
      Chọn số thứ $k$ là trung bình cộng của $k-1$ số trước: $A = (a_1 + dots + a_(k-1))/(k-1)$. \
      Áp dụng BĐT cho $k$ số $a_1, a_2, dots, a_(k-1), A$:
      $ (a_1 + dots + a_(k-1) + A)/k ge root(k, a_1 dots a_(k-1) A) $
      Vì $a_1 + dots + a_(k-1) = (k - 1)A$, vế trái trở thành $((k - 1)A + A)/k = A$. \
      Do đó: $A ge root(k, a_1 dots a_(k-1) A) <=> A^k ge a_1 dots a_(k-1) A <=> A^(k-1) ge a_1 dots a_(k-1)$. \
      Lấy căn bậc $k-1$ hai vế:
      $ A = (a_1 + dots + a_(k-1))/(k-1) ge root(k-1, a_1 dots a_(k-1)) $
      BĐT đúng với $n = k - 1$. Phép chứng minh quy nạp lùi Cauchy hoàn tất!
    ]
  ]
)

// TỰ LUẬN 2
#tl(
  [*(Chứng minh Bất đẳng thức Nesbitt mở rộng bằng quy nạp)*\
  1. Với $3$ số thực dương $a, b, c > 0$, chứng minh bất đẳng thức Nesbitt kinh điển:
  $ a/(b+c) + b/(c+a) + c/(a+b) ge 3/2 $
  2. Bằng phương pháp quy nạp toán học, chứng minh rằng với mọi số nguyên dương $n ge 1$ ta luôn có:
  $ 1/(sqrt(1)) + 1/(sqrt(2)) + 1/(sqrt(3)) + dots + 1/(sqrt(n)) > 2(sqrt(n+1) - 1) $],
  loigiai: [
    #step[
      *1. Chứng minh BĐT Nesbitt cho 3 số:* \
      Cộng $3$ vào cả hai vế:
      $ (a/(b+c) + 1) + (b/(c+a) + 1) + (c/(a+b) + 1) ge 3/2 + 3 = 9/2 $
      $ <=> (a+b+c)(1/(b+c) + 1/(c+a) + 1/(a+b)) ge 9/2 $
      Đặt $x = b+c, y = c+a, z = a+b => x+y+z = 2(a+b+c)$. \
      Bất đẳng thức tương đương:
      $ 1/2 (x + y + z)(1/x + 1/y + 1/z) ge 9/2 <=> (x+y+z)(1/x + 1/y + 1/z) ge 9 $
      Bất đẳng thức này luôn đúng theo Cauchy-Schwarz hoặc AM-GM cho 3 số. Đẳng thức xảy ra khi $a = b = c$.
    ]
    #step[
      *2. Quy nạp chứng minh BĐT tổng căn:* \
      - Với $n = 1$: Vế trái $= 1$. Vế phải $= 2(sqrt(2) - 1) approx 2(0.414) = 0.828 < 1$. BĐT đúng với $n = 1$. \
      - Giả sử BĐT đúng với $n = k ge 1$:
        $ S_k = sum_(i=1)^k 1/sqrt(i) > 2(sqrt(k+1) - 1) $
      - Cần chứng minh $S_(k+1) > 2(sqrt(k+2) - 1)$. Thật vậy:
        $ S_(k+1) = S_k + 1/sqrt(k+1) > 2(sqrt(k+1) - 1) + 1/sqrt(k+1) $
        Ta chỉ cần chứng minh:
        $ 2 sqrt(k+1) - 2 + 1/sqrt(k+1) ge 2 sqrt(k+2) - 2 <=> 2 sqrt(k+1) + 1/sqrt(k+1) > 2 sqrt(k+2) $
        Quy đồng mẫu số dương $sqrt(k+1)$:
        $ 2(k+1) + 1 > 2 sqrt((k+1)(k+2)) <=> 2k + 3 > 2 sqrt(k^2 + 3k + 2) $
        Bình phương hai vế dương:
        $ (2k + 3)^2 = 4k^2 + 12k + 9 > 4(k^2 + 3k + 2) = 4k^2 + 12k + 8 $
        $ <=> 9 > 8 $ (luôn đúng hiển nhiên!). \
      Vậy BĐT đúng với $n = k + 1$. Theo nguyên lý quy nạp, BĐT đúng với mọi $n in NN^*$.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC TRÍ TUỆ ĐỈNH CAO (OLYMPIC & GRAND CHALLENGES)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0F172A"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC BẤT ĐẲNG THỨC OLYMPIC: QUY NẠP XUÔI -- NGƯỢC CAUCHY (1821)] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Augustin-Louis Cauchy trong giáo trình Cours d'Analyse 1821 — Tuyệt kỹ quy nạp phi truyền thống đẹp nhất lịch sử toán học)]

  #v(0.4em)
  *Đề bài:* Cho $n$ số thực không âm $a_1, a_2, dots, a_n$ ($n ge 2$).
  Bất đẳng thức giữa Trung bình cộng (AM) và Trung bình nhân (GM) khẳng định:
  $ frac(a_1 + a_2 + dots + a_n, n) ge root(n, a_1 a_2 dots a_n). $
  Dấu bằng xảy ra khi và chỉ khi $a_1 = a_2 = dots = a_n$.
  
  Hãy chứng minh BĐT tổng quát cho mọi số nguyên dương $n ge 2$ bằng *Phương pháp Quy nạp Cauchy xuôi -- ngược (Forward--Backward Induction)*:
  1. *Bước 1 (Cơ sở $n = 2$):* Chứng minh trực tiếp bằng hằng đẳng thức.
  2. *Bước 2 (Bước tiến lũy thừa 2):* Chứng minh nếu BĐT đúng cho $n = k$, nó sẽ đúng cho $n = 2k$. Từ đó suy ra BĐT đúng với mọi $n = 2^m$ ($m in NN^*$).
  3. *Bước 3 (Bước lùi Cauchy):* Chứng minh nếu BĐT đúng cho $n$ số, thì nó bắt buộc phải đúng cho $n - 1$ số bằng kỹ thuật gán giá trị biến phụ đặc biệt.
  4. Tổng hợp ba bước để chứng minh BĐT đúng cho *mọi* số tự nhiên $n ge 2$.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trục số tự nhiên n
    line((0, 0), (9.5, 0), mark: (end: ">"), stroke: 1.2pt)
    content((9.7, 0), [$n$], anchor: "west")
    
    // Các vị trí n = 2, 3, 4, 5, 6, 7, 8
    let pts = (
      ("2", 1.5, rgb("2563EB")),
      ("3", 2.8, rgb("DC2626")),
      ("4", 4.1, rgb("2563EB")),
      ("5", 5.4, rgb("DC2626")),
      ("6", 6.7, rgb("DC2626")),
      ("7", 8.0, rgb("DC2626")),
      ("8", 9.3, rgb("2563EB"))
    )
    
    for (lbl, x, col) in pts {
      circle((x, 0), radius: 0.1, fill: col)
      content((x, -0.4), text(weight: "bold", fill: col)[$#lbl$])
    }
    
    // Cung nhảy tiến xuôi lũy thừa 2: 2 -> 4 -> 8 (màu xanh dương)
    // 2 -> 4
    line((1.5, 0.2), (2.8, 1.2), (4.1, 0.2), mark: (end: ">"), stroke: 1.5pt + rgb("2563EB"))
    content((2.8, 1.4), text(fill: rgb("2563EB"), size: 8pt, weight: "bold")[Tiến: $n -> 2n$])

    // 4 -> 8
    line((4.1, 0.2), (6.7, 1.8), (9.3, 0.2), mark: (end: ">"), stroke: 1.5pt + rgb("2563EB"))
    content((6.7, 2.0), text(fill: rgb("2563EB"), size: 8pt, weight: "bold")[Tiến: $4 -> 8$])

    // Cung nhảy lùi ngược: 4 -> 3, 8 -> 7 -> 6 -> 5 (màu đỏ)
    line((4.1, -0.2), (3.45, -1.0), (2.8, -0.2), mark: (end: ">"), stroke: 1.2pt + rgb("DC2626"))
    content((3.45, -1.25), text(fill: rgb("DC2626"), size: 7.5pt, weight: "bold")[Lùi $4 -> 3$])

    line((9.3, -0.2), (8.65, -1.0), (8.0, -0.2), mark: (end: ">"), stroke: 1.2pt + rgb("DC2626"))
    content((8.65, -1.25), text(fill: rgb("DC2626"), size: 7.5pt, weight: "bold")[Lùi $8 -> 7$])

    line((8.0, -0.2), (7.35, -1.0), (6.7, -0.2), mark: (end: ">"), stroke: 1.2pt + rgb("DC2626"))
    content((7.35, -1.25), text(fill: rgb("DC2626"), size: 7.5pt, weight: "bold")[Lùi $7 -> 6$])

    line((6.7, -0.2), (6.05, -1.0), (5.4, -0.2), mark: (end: ">"), stroke: 1.2pt + rgb("DC2626"))
    content((6.05, -1.25), text(fill: rgb("DC2626"), size: 7.5pt, weight: "bold")[Lùi $6 -> 5$])
  })
]

#v(0.4em)

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 3pt + rgb("D97706")),
  inset: (x: 12pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC & ĐẲNG CẤP CAUCHY:] \
  
  #step[
    *1. Bước 1 (Cơ sở $n = 2$):* \
    Với hai số thực không âm $a_1, a_2$:
    $ (sqrt(a_1) - sqrt(a_2))^2 ge 0 <=> a_1 - 2 sqrt(a_1 a_2) + a_2 ge 0 <=> frac(a_1 + a_2, 2) ge sqrt(a_1 a_2). $
    Đẳng thức xảy ra khi $sqrt(a_1) = sqrt(a_2) <=> a_1 = a_2$. BĐT đúng với $n = 2$.
  ]
  
  #step[
    *2. Bước 2 (Tiến xuôi theo bước nhảy $k -> 2k$):* \
    Giả sử BĐT AM-GM đúng cho $k$ số bất kỳ. Xét $2k$ số không âm $a_1, a_2, dots, a_(2k)$:
    Chia $2k$ số thành hai nhóm đều nhau, mỗi nhóm có $k$ số:
    $ frac(a_1 + dots + a_(2k), 2k) = 1/2 [ frac(a_1 + dots + a_k, k) + frac(a_(k+1) + dots + a_(2k), k) ]. $
    Áp dụng giả thiết quy nạp cho từng nhóm $k$ số:
    $ frac(a_1 + dots + a_k, k) ge root(k, a_1 dots a_k), quad frac(a_(k+1) + dots + a_(2k), k) ge root(k, a_(k+1) dots a_(2k)). $
    Áp dụng BĐT cơ sở cho $2$ số trung gian trên:
    $ frac(a_1 + dots + a_(2k), 2k) ge 1/2 [ root(k, a_1 dots a_k) + root(k, a_(k+1) dots a_(2k)) ] ge sqrt(root(k, a_1 dots a_k) dot root(k, a_(k+1) dots a_(2k))) = root(2k, a_1 a_2 dots a_(2k)). $
    Vậy nếu BĐT đúng cho $k$ số, nó sẽ đúng cho $2k$ số! \
    Vì nó đúng cho $n = 2$, suy ra nó đúng cho $n = 4, 8, 16, 32, dots, 2^m$ với mọi $m ge 1$.
  ]
  
  #step[
    *3. Bước 3 (Bước lùi thiên tài Cauchy: $n -> n - 1$):* \
    Giả sử BĐT AM-GM đúng cho $n$ số. Cho trước $n - 1$ số không âm $a_1, a_2, dots, a_(n-1)$. \
    Đặt $A = frac(a_1 + a_2 + dots + a_(n-1), n - 1)$ (trung bình cộng của $n - 1$ số này). \
    Cauchy đã nảy ra ý tưởng thiên tài: *Chọn số hạng thứ $n$ đúng bằng số trung bình $A$*:
    $ a_n = A = frac(a_1 + a_2 + dots + a_(n-1), n - 1). $
    Khi đó, trung bình cộng của toàn bộ $n$ số là:
    $ frac(a_1 + dots + a_(n-1) + a_n, n) = frac((n-1)A + A, n) = frac(n A, n) = A. $
    Áp dụng BĐT AM-GM cho $n$ số này (do đã giả thiết đúng cho $n$ số):
    $ A ge root(n, a_1 a_2 dots a_(n-1) dot A). $
    Lũy thừa bậc $n$ cả hai vế dương:
    $ A^n ge (a_1 a_2 dots a_(n-1)) dot A <=> A^(n-1) ge a_1 a_2 dots a_(n-1). $
    Lấy căn bậc $n-1$ cả hai vế:
    $ A ge root(n-1, a_1 a_2 dots a_(n-1)) <=> frac(a_1 + a_2 + dots + a_(n-1), n - 1) ge root(n-1, a_1 a_2 dots a_(n-1)). $
    Bất đẳng thức được chứng minh đúng cho $n - 1$ số!
  ]
  
  #step[
    *4. Kết luận toàn diện:* \
    Với số nguyên dương $n$ bất kỳ, luôn tồn tại số $m$ đủ lớn sao cho $2^m > n$. \
    Theo Bước 2, BĐT đúng cho $2^m$. Sau đó áp dụng liên tiếp Bước 3 để lùi từ $2^m -> 2^m - 1 -> dots -> n$. \
    Vậy BĐT AM-GM đúng với mọi số nguyên dương $n ge 2$!
  ]
]


