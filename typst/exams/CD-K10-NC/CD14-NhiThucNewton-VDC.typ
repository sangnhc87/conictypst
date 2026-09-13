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
  stroke: (bottom: 2pt + rgb("134E4A")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("134E4A"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("0D9488")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("0D9488"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("2DD4BF")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("2DD4BF"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("0D9488")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Nhị thức Newton (Teal - Cyan)
#let c-teal-dark = rgb("134E4A")
#let c-teal = rgb("0D9488")
#let c-teal-light = rgb("2DD4BF")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-emerald = rgb("059669")
#let c-bg-teal = rgb("F0FDFA")
#let c-border = rgb("CCFBF1")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-teal,
    stroke: 1.5pt + c-teal,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-teal-dark, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-teal, size: 16pt, weight: "black")[CHUYÊN ĐỀ 14: BÀI TẬP VẬN DỤNG – VẬN DỤNG CAO NHỊ THỨC NIUTƠN]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      Công thức Khai triển Tổng quát, Hệ số Cực đại, Kỹ thuật Đạo hàm Tổ hợp & Đẳng thức Tích chập Vandermonde
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-teal),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Nhị thức Newton: Chiếc Cầu Nối Giữa Đại số, Giải tích & Xác suất:*
  
  Năm 1665, chàng thanh niên 22 tuổi Isaac Newton khi đang tránh dịch bệnh dịch hạch tại quê nhà Woolsthorpe đã phát minh ra Định lý Khai triển Nhị thức tổng quát. Đây là một trong những cột mốc vĩ đại nhất của lịch sử toán học, đặt nền móng trực tiếp cho phép tính vi tích phân và lý thuyết chuỗi vô hạn.
  
  Trong chương trình Toán 10 và các kỳ thi Học sinh giỏi, Nhị thức Newton $(a + b)^n$ là công cụ biến đổi đa thức thượng thừa:
  1. *Công thức số hạng tổng quát*:
     $ T_(k + 1) = C_n^k a^(n - k) b^k quad (k in {0, 1, 2, dots, n}). $
  2. *Phương pháp Hàm sinh (Generating Functions)*: Nhìn biểu thức đại số $(1 + x)^n$ như một vật chứa mã hóa toàn bộ dãy tổ hợp $C_n^0, C_n^1, dots, C_n^n$.
  3. *Kỹ thuật Đạo hàm & Tích phân để tính tổng hệ số*: Lấy đạo hàm hai vế để tạo ra thừa số $k$ trước hệ số $C_n^k$, giúp giải quyết các bài toán tính tổng tổ hợp phức tạp chỉ trong vài dòng biến đổi.
  4. *Đẳng thức Vandermonde*: Đếm số cách chọn bằng hai góc nhìn tương đương, giải thích nguồn gốc của các đẳng thức bình phương hệ số tổ hợp.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. HỆ THỐNG KỸ THUẬT & ĐỊNH LÝ NỀN TẢNG VDC
// ══════════════════════════════════════════════════════════════

== 1. Công thức Khai triển & Các Hệ quả Cơ bản

#block(
  fill: c-bg-teal,
  stroke: 1pt + c-border,
  inset: 10pt,
  radius: 6pt,
  width: 100%,
)[
  Với mọi cặp số thực $a, b$ và số nguyên dương $n$:
  $ (a + b)^n = sum_(k = 0)^n C_n^k a^(n - k) b^k = C_n^0 a^n + C_n^1 a^(n - 1) b + C_n^2 a^(n - 2) b^2 + dots + C_n^n b^n. $
  - Khai triển có đúng $n + 1$ số hạng.
  - Tổng số mũ của $a$ và $b$ trong mỗi số hạng luôn bằng $n$.
  - Các hệ số đối xứng nhau qua tâm: $C_n^k = C_n^(n - k)$.
  - *Hệ quả đặc biệt (chọn $a = 1, b = x$)*:
    $ (1 + x)^n = C_n^0 + C_n^1 x + C_n^2 x^2 + dots + C_n^n x^n. $
    - Cho $x = 1$: $C_n^0 + C_n^1 + C_n^2 + dots + C_n^n = 2^n$.
    - Cho $x = -1$: $C_n^0 - C_n^1 + C_n^2 - dots + (-1)^n C_n^n = 0$.
    - Suy ra: Tổng các hệ số vị trí chẵn bằng tổng các hệ số vị trí lẻ và bằng $2^(n - 1)$:
      $ C_n^0 + C_n^2 + C_n^4 + dots = C_n^1 + C_n^3 + C_n^5 + dots = 2^(n - 1). $
]

#v(0.6em)

== 2. Bảng Tam giác Pascal & Phân phối Hình chuông

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ Tam giác Pascal 6 tầng
    let rows = (
      (1,),
      (1, 1),
      (1, 2, 1),
      (1, 3, 3, 1),
      (1, 4, 6, 4, 1),
      (1, 5, 10, 10, 5, 1),
    )
    let dy = 0.65
    let dx = 0.85

    let r_idx = 0
    for r in rows {
      let n_elements = r.len()
      let start_x = - (n_elements - 1) * dx / 2
      let y = - r_idx * dy

      let e_idx = 0
      for val in r {
        let x = start_x + e_idx * dx
        // Vẽ ô số
        rect((x - 0.35, y - 0.25), (x + 0.35, y + 0.25), fill: if r_idx == 5 { rgb("CCFBF1") } else { rgb("F8FAFC") }, stroke: 0.8pt + c-teal, radius: 3pt)
        content((x, y), text(fill: c-teal-dark, weight: "bold", size: 9pt)[#val])
        e_idx = e_idx + 1
      }
      content((start_x - 0.8, y), text(fill: rgb("64748B"), size: 8pt)[$n = #r_idx$])
      r_idx = r_idx + 1
    }
  })
]

#v(0.6em)

== 3. Kỹ thuật Đạo hàm & Tìm Hệ số Lớn nhất

- *Kỹ thuật Đạo hàm tính tổng*:
  Lấy đạo hàm hai vế của $(1 + x)^n$:
  $ n (1 + x)^(n - 1) = 1 dot C_n^1 + 2 dot C_n^2 x + 3 dot C_n^3 x^2 + dots + n dot C_n^n x^(n - 1). $
  Thay $x = 1$:
  $ 1 dot C_n^1 + 2 dot C_n^2 + 3 dot C_n^3 + dots + n dot C_n^n = n dot 2^(n - 1). $
- *Kỹ thuật Tìm Hệ số Cực đại trong khai triển $(a + b x)^n$*:
  Gọi $a_k$ là hệ số của số hạng thứ $k + 1$. Hệ số $a_k$ đạt giá trị lớn nhất khi và chỉ khi thỏa mãn hệ bất phương trình điểm rơi:
  $ cases(a_k >= a_(k - 1), a_k >= a_(k + 1)) <==> cases(C_n^k a^(n - k) b^k >= C_n^(k - 1) a^(n - k + 1) b^(k - 1), C_n^k a^(n - k) b^k >= C_n^(k + 1) a^(n - k - 1) b^(k + 1)). $

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (VDC - Số hạng không chứa $x$ trong khai triển phân thức):*
    Tìm số hạng không chứa $x$ trong khai triển nhị thức Newton của biểu thức
    $ P(x) = (2x - 1 / x^2)^9 quad (x != 0). $
  ],
  (
    [$5376$],
    True([$-5376$]),
    [$672$],
    [$-672$],
  ),
)
#step[
  *Lời giải chi tiết bằng Số hạng tổng quát:*
  - Khai triển nhị thức Newton có số hạng tổng quát thứ $k + 1$ là ($0 <= k <= 9, k in NN$):
    $ T_(k + 1) = C_9^k dot (2x)^(9 - k) dot (-1 / x^2)^k $
    $ = C_9^k dot 2^(9 - k) dot x^(9 - k) dot (-1)^k dot x^(-2k) $
    $ = (-1)^k dot C_9^k dot 2^(9 - k) dot x^(9 - 3k). $
  - Số hạng không chứa $x$ tương ứng với số mũ của $x$ bằng 0:
    $ 9 - 3k = 0 <==> 3k = 9 <==> k = 3. $
  - Giá trị $k = 3$ thỏa mãn điều kiện $0 <= k <= 9$.
  - Thay $k = 3$ vào biểu thức hệ số:
    $ T_4 = (-1)^3 dot C_9^3 dot 2^(9 - 3) = -1 dot ((9 dot 8 dot 7) / 6) dot 2^6 $
    $ = -1 dot 84 dot 64 = -5376. $
  - Vậy số hạng không chứa $x$ là $-5376$.
]

#v(0.5em)

#tn(
  [
    *Câu 2 (VDC - Hệ số của đa thức tổng nhiều nhị thức):*
    Tìm hệ số của $x^5$ trong khai triển thành đa thức của biểu thức
    $ P(x) = (1 + x)^6 + (1 + x)^7 + (1 + x)^8 + (1 + x)^9 + (1 + x)^10. $
  ],
  (
    [$252$],
    True([$462$]),
    [$330$],
    [$500$],
  ),
)
#step[
  *Lời giải chi tiết bằng Công thức Nhị thức Newton:*
  - Trong mỗi khai triển $(1 + x)^n$, số hạng chứa $x^5$ có hệ số là $C_n^5$ (với điều kiện $n >= 5$).
  - Do đó, hệ số của $x^5$ trong biểu thức $P(x)$ là tổng:
    $ S = C_6^5 + C_7^5 + C_8^5 + C_9^5 + C_10^5. $
  - Tính toán từng giá trị:
    - $C_6^5 = C_6^1 = 6$.
    - $C_7^5 = C_7^2 = (7 dot 6) / 2 = 21$.
    - $C_8^5 = C_8^3 = (8 dot 7 dot 6) / 6 = 56$.
    - $C_9^5 = C_9^4 = (9 dot 8 dot 7 dot 6) / 24 = 126$.
    - $C_10^5 = (10 dot 9 dot 8 dot 7 dot 6) / 120 = 252$.
  - Tổng các hệ số là:
    $ S = 6 + 21 + 56 + 126 + 252 = 462. $
  - *Ghi nhớ tính chất Hockey-stick:* $sum_(i = 5)^10 C_i^5 = C_11^6 = C_11^5 = (11 dot 10 dot 9 dot 8 dot 7) / 120 = 462$!
]

#v(0.5em)

#tn(
  [
    *Câu 3 (VDC - Tìm hệ số có giá trị lớn nhất):*
    Trong khai triển nhị thức Newton $(1 + 2x)^10 = a_0 + a_1 x + a_2 x^2 + dots + a_10 x^10$. Hệ số lớn nhất trong các hệ số ${a_0, a_1, dots, a_10}$ là:
  ],
  (
    [$a_6$],
    True([$a_7 = C_10^7 dot 2^7 = 15.360$]),
    [$a_8$],
    [$a_5$],
  ),
)
#step[
  *Lời giải chi tiết bằng Bất đẳng thức Điểm rơi:*
  - Số hạng tổng quát trong khai triển là:
    $ T_(k + 1) = C_10^k dot 1^(10 - k) dot (2x)^k = C_10^k dot 2^k dot x^k. $
  - Hệ số tương ứng là $a_k = C_10^k dot 2^k$ (với $0 <= k <= 10$).
  - Ta tìm chỉ số $k$ sao cho $a_k >= a_(k - 1)$:
    $ C_10^k dot 2^k >= C_10^(k - 1) dot 2^(k - 1) $
    $ <==> (10!) / (k! (10 - k)!) dot 2 >= (10!) / ((k - 1)! (11 - k)!) $
    $ <==> 2 / k >= 1 / (11 - k) <==> 2(11 - k) >= k <==> 22 - 2k >= k <==> 3k <= 22 <==> k <= 22 / 3 approx 7.33. $
  - Vì $k$ là số nguyên, ta có:
    - Với $k <= 7$, dãy hệ số tăng dần: $a_0 < a_1 < a_2 < dots < a_6 < a_7$.
    - Với $k >= 8$, dãy hệ số giảm dần: $a_7 > a_8 > a_9 > a_10$.
  - Do đó, hệ số đạt giá trị lớn nhất tại chỉ số $k = 7$:
    $ a_7 = C_10^7 dot 2^7 = C_10^3 dot 128 = 120 dot 128 = 15.360. $
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Khảo sát toàn diện khai triển nhị thức có chứa tham số):*
    Xét khai triển nhị thức Newton của biểu thức $P(x) = (2 - 3x)^n$ ($n in NN^*$). Biết rằng tổng tất cả các hệ số trong khai triển bằng $1$.
  ],
  (
    True([a) Tổng tất cả các hệ số nhận được bằng cách thay $x = 1$ vào biểu thức $P(x)$.]),
    True([b) Số mũ $n$ là một số chẵn bất kỳ vì $(2 - 3)^n = (-1)^n = 1$.]),
    True([c) Khi $n = 8$, khai triển có tất cả $9$ số hạng và số hạng thứ 5 có hệ số dương.]),
    False([d) Khi $n = 8$, hệ số của số hạng chứa $x^3$ là $-108.864$.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) Đúng:* Khai triển $P(x) = a_0 + a_1 x + dots + a_n x^n$.
    Khi thay $x = 1$, ta được $P(1) = a_0 + a_1 + dots + a_n$, chính là tổng tất cả các hệ số.
  - *Ý b) Đúng:* Ta có $P(1) = (2 - 3 dot 1)^n = (-1)^n$.
    Theo giả thiết tổng hệ số bằng 1: $(-1)^n = 1 <==> n$ là số chẵn dương.
  - *Ý c) Đúng:* Khi $n = 8$, số các số hạng là $n + 1 = 8 + 1 = 9$.
    Số hạng thứ 5 ứng với $k = 4$:
    $ T_5 = C_8^4 dot 2^(8 - 4) dot (-3x)^4 = C_8^4 dot 2^4 dot (-3)^4 dot x^4 = 70 dot 16 dot 81 dot x^4 = 90.720 x^4 > 0 $.
  - *Ý d) Sai:* Số hạng chứa $x^3$ ứng với $k = 3$:
    $ T_4 = C_8^3 dot 2^(8 - 3) dot (-3x)^3 = C_8^3 dot 2^5 dot (-27) dot x^3 $
    $ = 56 dot 32 dot (-27) dot x^3 = -48.384 x^3. $
    Hệ số là $-48.384$ (không phải $-108.864$). Mệnh đề d là Sai.
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (KỸ THUẬT VDC)

#tln(
  [
    *Câu 1 (Hệ số của đa thức ba số hạng - Tam thức Newton):*
    Tìm hệ số của số hạng chứa $x^3$ trong khai triển thành đa thức của biểu thức $P(x) = (1 - 2x + 3x^2)^5$.
  ],
  [
    *Đáp số: -200*
  ],
)
#step[
  *Lời giải chi tiết bằng Khai triển Hai tầng:*
  - Viết $P(x) = [1 + (-2x + 3x^2)]^5$.
  - Áp dụng công thức nhị thức Newton cho biểu thức trên:
    $ P(x) = sum_(k = 0)^5 C_5^k dot 1^(5 - k) dot (-2x + 3x^2)^k = sum_(k = 0)^5 C_5^k dot x^k dot (-2 + 3x)^k. $
  - Để thu được số hạng chứa $x^3$, ta chỉ cần xét các giá trị $k <= 3$ (vì với $k >= 4$, lũy thừa nhỏ nhất của $x$ là $x^4$):
    - *Với $k = 0, 1$:* Khai triển không thể tạo ra $x^3$ hoặc chỉ cho lũy thừa nhỏ hơn.
    - *Với $k = 2$:*
      Số hạng là $C_5^2 dot x^2 dot (-2 + 3x)^2 = 10 x^2 dot (4 - 12x + 9x^2)$.
      Số hạng chứa $x^3$ thu được từ $10 x^2 dot (-12x) = -120 x^3$.
    - *Với $k = 3$:*
      Số hạng là $C_5^3 dot x^3 dot (-2 + 3x)^3 = 10 x^3 dot [(-2)^3 + dots] = 10 x^3 dot (-8) = -80 x^3$.
  - Tổng các số hạng chứa $x^3$ là:
    $ (-120 - 80) x^3 = -200 x^3. $
  - Vậy hệ số của $x^3$ là $-200$.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Tính tổng các hệ số tổ hợp bằng Đạo hàm):*
    Tính giá trị của tổng $S = 1 dot C_10^1 + 2 dot C_10^2 + 3 dot C_10^3 + dots + 10 dot C_10^10$.
  ],
  [
    *Đáp số: 5120*
  ],
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Đạo hàm:*
  - Xét hàm số:
    $ f(x) = (1 + x)^10 = C_10^0 + C_10^1 x + C_10^2 x^2 + C_10^3 x^3 + dots + C_10^10 x^10. $
  - Lấy đạo hàm cấp 1 theo biến $x$ ở cả hai vế:
    $ f'(x) = 10 (1 + x)^9 = C_10^1 + 2 C_10^2 x + 3 C_10^3 x^2 + dots + 10 C_10^10 x^9. $
  - Thay $x = 1$ vào đẳng thức đạo hàm:
    $ 10 (1 + 1)^9 = C_10^1 + 2 C_10^2 + 3 C_10^3 + dots + 10 C_10^10. $
  - Do đó:
    $ S = 10 dot 2^9 = 10 dot 512 = 5120. $
  - *Đáp số:* $5120$.
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Hệ số nhị thức qua tổng hệ số):*
    Cho biết tổng tất cả các hệ số trong khai triển nhị thức Newton của biểu thức $P(x) = (1 + 2x)^n$ bằng $6561$. Tìm hệ số của số hạng chứa $x^4$ trong khai triển này.
  ],
  [
    *Đáp số: 1120*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Tổng các hệ số của khai triển $P(x)$ nhận được khi thay $x = 1$:
    $ P(1) = (1 + 2 dot 1)^n = 3^n. $
  - Theo bài ra:
    $ 3^n = 6561 <==> 3^n = 3^8 <==> n = 8. $
  - Khi đó biểu thức trở thành $P(x) = (1 + 2x)^8$.
  - Số hạng tổng quát trong khai triển là:
    $ T_(k + 1) = C_8^k dot 1^(8 - k) dot (2x)^k = C_8^k dot 2^k dot x^k. $
  - Số hạng chứa $x^4$ ứng với $k = 4$:
    $ T_5 = C_8^4 dot 2^4 dot x^4 = 70 dot 16 dot x^4 = 1120 x^4. $
  - Vậy hệ số của $x^4$ là $1120$.
  - *Đáp số:* $1120$.
]

#v(1em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TOÁN THÁCH THỨC OLYMPIC (GRAND CHALLENGE)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFBEB"),
  stroke: 1.5pt + c-amber,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  *BÀI TOÁN (Đẳng thức Tích chập Vandermonde & Tổng bình phương các tổ hợp):*
  
  1. Sử dụng phương pháp đồng nhất hệ số của đa thức $(1 + x)^(2n) = (1 + x)^n dot (x + 1)^n$, hãy chứng minh đẳng thức tổ hợp nổi tiếng:
     $ (C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + dots + (C_n^n)^2 = C_(2n)^n. $
  2. Hãy giải thích ý nghĩa tổ hợp thực tế của đẳng thức trên thông qua bài toán chia một nhóm $2n$ học sinh (gồm $n$ nam và $n$ nữ) thành một đội tuyển gồm đúng $n$ người.
]

#step[
  *Chứng minh chuyên khảo sâu sắc:*
  
  - *Ý 1: Chứng minh bằng Phương pháp Hàm sinh (Đồng nhất hệ số):*
    - Xét khai triển nhị thức Newton của $(1 + x)^(2n)$:
      $ (1 + x)^(2n) = sum_(k = 0)^(2n) C_(2n)^k x^k. $
      Trong khai triển này, hệ số của số hạng chứa $x^n$ chính là $C_(2n)^n$.
    - Mặt khác, ta có thể phân tích thành tích của hai nhị thức bậc $n$:
      $ (1 + x)^(2n) = (1 + x)^n dot (x + 1)^n. $
    - Khai triển từng nhân tử:
      $ (1 + x)^n = C_n^0 + C_n^1 x + C_n^2 x^2 + dots + C_n^k x^k + dots + C_n^n x^n $
      $ (x + 1)^n = C_n^0 x^n + C_n^1 x^(n - 1) + C_n^2 x^(n - 2) + dots + C_n^k x^(n - k) + dots + C_n^n. $
    - Nhân hai đa thức trên, số hạng chứa $x^n$ được tạo thành bằng cách nhân số hạng chứa $x^k$ của đa thức thứ nhất với số hạng chứa $x^(n - k)$ của đa thức thứ hai (với mọi $k$ từ $0$ đến $n$):
      $ [x^n] = sum_(k = 0)^n C_n^k dot C_n^k = sum_(k = 0)^n (C_n^k)^2. $
    - Đồng nhất hệ số của $x^n$ ở cả hai cách khai triển, ta thu được đẳng thức tuyệt đẹp:
      $ (C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + dots + (C_n^n)^2 = C_(2n)^n. $

  - *Ý 2: Ý nghĩa Tổ hợp thực tế (Mô hình đếm hai cách):*
    - Giả sử có $2n$ học sinh gồm $n$ học sinh nam và $n$ học sinh nữ. Cần chọn ra một đội tình nguyện gồm đúng $n$ người.
    - *Cách 1 (Chọn trực tiếp)*: Chọn $n$ người từ tổng số $2n$ người, số cách là $C_(2n)^n$.
    - *Cách 2 (Phân loại theo số lượng nữ trong đội)*:
      Giả sử trong đội có $k$ bạn nữ ($0 <= k <= n$), thì số bạn nam trong đội bắt buộc phải là $n - k$.
      - Số cách chọn $k$ bạn nữ từ $n$ nữ là $C_n^k$.
      - Số cách chọn $n - k$ bạn nam từ $n$ nam là $C_n^(n - k) = C_n^k$.
      - Số cách chọn đội có đúng $k$ nữ là $C_n^k dot C_n^k = (C_n^k)^2$.
      - Cho $k$ chạy từ $0$ đến $n$ (đầy đủ các trường hợp xung khắc), tổng số cách chọn là:
        $ sum_(k = 0)^n (C_n^k)^2. $
    - Vì hai cách đếm cùng mô tả một hành động chọn mẫu, hai kết quả phải bằng nhau!
]
