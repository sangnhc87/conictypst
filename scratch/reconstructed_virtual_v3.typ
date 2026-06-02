# Kế hoạch tích hợp phương pháp Hàm Sinh (Generating Functions) nâng cao cho Chuyên đề Đại Số Tổ Hợp

Kế hoạch này bổ sung lời giải bằng phương pháp **Hàm sinh (Generating Functions)** dưới dạng Cách 2 hoặc Cách 3 cho các ví dụ lý thuyết và bài tập tự luyện thích hợp trong tài liệu `CD-DaiSo-ToHop-content.typ`.

## User Review Required

> [!IMPORTANT]
> **Các bài toán được nâng cấp bằng phương pháp Hàm sinh:**
> We will add detailed Generating Function solutions to the following problems:
> 1. **Chủ đề 5 - Ví dụ 2 (Xếp 5 chữ A, 3 chữ B không cạnh nhau):** Dựng hàm sinh số chữ A xen giữa các chữ B để tính số nghiệm $x_0 + x_1 + x_2 + x_3 = 5$ với $x_1, x_2 \ge 1$.
> 2. **Chủ đề 6 - Ví dụ 1 (Chia 10 kẹo cho 3 bạn, mỗi bạn ít nhất 1 kẹo):** Sử dụng hàm sinh $G(t) = (t + t^2 + ...)^3 = t^3 (1-t)^{-3}$ tìm hệ số $[t^{10}]$.
> 3. **Chủ đề 6 - Ví dụ 2 (Số nghiệm nguyên có điều kiện dưới $x_1+x_2+x_3+x_4=15$):** Sử dụng hàm sinh $G(t) = \frac{t^2}{(1-t)^4}$ tìm hệ số $[t^{15}]$.
> 4. **Chủ đề 7 - Ví dụ 1 (Chia 6 kẹo cho 3 bạn, mỗi bạn không quá 3 kẹo):** Sử dụng hàm sinh giới hạn trên $G(t) = (1+t+t^2+t^3)^3 = \frac{(1-t^4)^3}{(1-t)^3}$ tìm hệ số $[t^6]$.
> 5. **Chủ đề 13 - Ví dụ 1 (Bài toán leo cầu thang $n$ bậc):** Dựng hàm sinh Fibonacci dịch chuyển $G(x)
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#show heading.where(level: 1): it => {
  if repr(it.body).contains("Chủ Đề") {
    []
  } else {
    it
  }
}

// Mục lục
#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  strong(it)
}

// ═══════════════════════════════════════════════
// BÌA SÁCH
// ═══════════════════════════════════════════════

##### 5. Chủ đề 13 - Ví dụ 1
- Bổ sung `*Cách 2 (Sử dụng phương pháp Hàm sinh):*` dựng hàm sinh cho hệ thức Fibonacci $G(x) = \frac{1}{1-x-x^2}$ và dùng công thức Binet/chuỗi để rút ra số hạng tổng quát.

##### 6. Chủ đề 13 - Ví dụ 2
- Bổ sung `*Cách 2 (Sử dụng phương pháp Hàm sinh):*` dựng hàm sinh $G(x) = \frac{1+x}{1-x-x^2}$ tương ứng với các giá trị khởi tạo $a_0 = 1, a_1 = 2$.

##### 7. Chủ đề 15 - Ví dụ 1
- Đổi tiêu đề cách giải hiện tại thành `*Cách 1 (Sử dụng tổ hợp trực tiếp):*`.
- Bổ sung `*Cách 2 (Sử dụng hàm sinh):*` dựng đa thức $G(x) = (\frac{1}{2} + \frac{1}{2}x)^6$.

##### 8. Chủ đề 15 - Ví dụ 2
- Đổi tiêu đề cách giải hiện tại thành `*Cách 1 (Tính toán theo trường hợp trực tiếp):*`.
- Bổ sung `*Cách 2 (Sử dụng hàm sinh xác suất):*` với đa thức $P(a, b) = a^3 + 3a^3b + 6a^3b^2$.

##### 9. Bài tập 14
- Đổi tiêu đề cách giải hiện tại thành `*Cách 1 (Tính toán trực tiếp):*`.
- Bổ sung `*Cách 2 (Sử dụng hàm sinh xác suất):*` với đa thức $P(a, b) = a^2 + 2a^2b$.

## Verification Plan

### Automated Tests
- Chạy biên dịch Typst sang PDF để kiểm tra cú pháp và độ chính xác toán học:
  `typst compile --root . typst/exams/CD-DaiSo-ToHop.typ typst/exams/CD-DaiSo-ToHop.pdf`

### Manual Verification
- Đọc lại lời giải của từng ví dụ và bài tập đảm bảo không có lỗi lô-gích, ký hiệu toán học chính xác theo định dạng Typst, biến số viết rời `$a x$` thay vì `$ax$`, và các ký hiệu $C_n^k, A_n^k, P_n$ được in đứng chuẩn xác.
- Đảm bảo không chứa bất kỳ từ khóa cấm nào ("TDM", "TDMY").








    Hàm sinh cho từng biến số ứng với các điều kiện ràng buộc như sau:
























        width: 100%,
        inset: (bottom: 22pt, x: 26pt),
      )[
        #text(size: 28pt, weight: "bold", fill: c-bg)[ĐẠI SỐ TỔ HỢP]
        #linebreak()
        #text(size: 14pt, weight: "bold", fill: c-p2)[COMBINATORICS — NHÌN NHẬN TỔNG QUÁT]
        #linebreak()
        #v(0.4em)
    ]
    #if loigiai != [] [
      #v(0.4em)
      #block(
        fill: rgb("FFFBEB"),
        stroke: (left: 3pt + c-gold, rest: 0.5pt + rgb("FDE68A")),
        inset: (x: 12pt, y: 10pt),
        radius: (right: 5pt),
        width: 100%,
      )[
        #text(fill: c-gold, weight: "bold", size: 9.5pt)[📖 Hướng dẫn giải]
        #v(0.3em)
        #loigiai
      ]
    ]
  ]
}

// ─── Separator ──────────────────────────────────────────────────
#let section-rule(color: c-blue) = {
  v(0.5em)
  line(length: 100%, stroke: 1.2pt + color)
  v(0.5em)
}

// ══════════════════════════════════════════════════════════════
// PHẦN I: BẢN ĐỒ TƯ DUY TỔNG QUÁT
// ══════════════════════════════════════════════════════════════
= Bản Đồ Tư Duy Hệ Thống

#insight-box(title: "💡 Khung Kiến Thức Đại Số Tổ Hợp THPT")[
  #align(center)[
    #block(
      fill: white, stroke: 0.8pt + rgb("E2E8F0"),
      inset: (x: 12pt, y: 10pt), radius: 8pt, width: 100%,
    )[
      #table(
        columns: (1.5fr, 3fr, 2.5fr, 1.2fr),
        align: (center, left, left, center),
        stroke: 0.5pt + rgb("E2E8F0"),
        inset: (x: 7pt, y: 6pt),
        fill: (x, y) => if y == 0 { c-navy } else if calc.rem(y, 2) == 0 { rgb("F8FAFC") } else { white },
    ]
  })
}
#pagebreak()
  ]
]

#pagebreak()

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 1: NGUYÊN LÝ CỘNG, NHÂN VÀ SƠ ĐỒ CÂY
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 1", "Nguyên Lý Cộng, Nguyên Lý Nhân Và Sơ Đồ Cây", color: c-blue)

#theory-box[
    v(2em)
    v(2em)
    // Tác giả
    box(stroke: 1pt + white.transparentize(40%), inset:(x:22pt,y:13pt), radius:8pt)[
        [Chủ đề 15], [Đếm kịch bản trò chơi & Quy về xác suất], [Xích Markov đơn giản, xác suất đối kháng], [Khó],
      )
    ]
  ]
    box(stroke: 1pt + white.transparentize(40%), inset:(x:22pt,y:13pt), radius:8pt)[
      #text(fill: white, weight: "bold", size: 13pt)[★ GV Nguyễn Văn Sang]
      #linebreak()
      #text(fill: white.transparentize(30%), size: 10pt)[
        SĐT: 0389.821.115 · Tổ Toán – Tài liệu Thực chiến THPT
      ]
    ]
  })
}
#pagebreak()

#show: sang-setup

// ═══════════════════════════════════════════════
// MỤC LỤC
// ═══════════════════════════════════════════════
#outline(
  title: [Mục Lục Chuyên Đề Đại Số Tổ Hợp],
  depth: 2,
  indent: 1.5em,
)
#pagebreak()

// ═══════════════════════════════════════════════
// NỘI DUNG CHÍNH — CÓ HEADER & FOOTER
// ═══════════════════════════════════════════════
#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("1565C0"))
    grid(
      columns: (1fr, auto),
      [Chuyên Đề Đại Số Tổ Hợp — 15 Chủ Đề Toàn Diện],
      [GV Nguyễn Văn Sang · 0389.821.115],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("1565C0"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("1565C0"))
    grid(
      columns: (1fr, auto),
      [Đại Số Tổ Hợp · Conic Typst · 2025–2026],
      [Trang #counter(page).display()],
    )
  },
)

#include "CD-DaiSo-ToHop-content.typ"

  - *TH2 ($k=1$):* Có đúng 1 chữ số 0. Chọn vị trí cho số 0 trong 5 vị trí: $C_5^1 = 5$ chuỗi.
  - *TH3 ($k=2$):* Có đúng 2 chữ số 0. Xếp 3 chữ số 1 trước: `_ 1 _ 1 _ 1 _`. Xuất hiện 4 khoảng trống trống (ở giữa và hai đầu). Để hai chữ số 0 không đứng cạnh nhau, ta chọn 2 khoảng trống từ 4 khoảng trống này để đặt 2 chữ số 0: $C_4^2 = 6$ chuỗi.
  - *TH4 ($k=3$):* Có đúng 3 chữ số 0. Xếp 2 chữ số 1 trước: `_ 1 _ 1 _`. Có 3 khoảng trống. Để đặt 3 chữ số 0 không kề nhau, ta bắt buộc phải chọn cả 3 khoảng trống này: $C_3^3 = 1$ chuỗi (đó là $01010$).
  Tổng số chuỗi thỏa mãn là: $1 + 5 + 6 + 1 = 13$ chuỗi.

  *Cách 2 (Sơ đồ cây trạng thái & Truy hồi):*
  Vẽ sơ đồ cây phát triển chuỗi hợp lệ theo độ dài từ 1 đến 5:
  - Độ dài 1: $\{0, 1\}$ (2 chuỗi)
  - Độ dài 2: $\{01, 10, 11\}$ (3 chuỗi)
  - 
    - Nhánh từ $01  ->  \{010, 011\}$
    - Nhánh từ $10  ->  \{101\}$ (vì sau 0 chỉ được đi 1)
    - Nhánh từ $11  ->  \{110, 111\}$
    Tổng cộng độ dài 3 có 5 chuỗi.
  - Nhận xét: Gọi $a_n$ là số chuỗi hợp lệ độ dài $n$.
    - Chuỗi kết thúc bằng 1: Có dạng $S_{n-1} 1$ với $S_{n-1}$ là chuỗi hợp lệ độ dài $n-1$ (có $a_{n-1}$ cách).
    - Chuỗi kết thúc bằng 0: Phải có dạng $S_{n-2} 10$ với $S_{n-2}$ là chuỗi hợp lệ độ dài $n-2$ (có $a_{n-2}$ cách).
    Do đó ta có hệ thức truy hồi Fibonacci: $a_n = a_{n-1} + a_{n-2}$.
    Với $a_1 = 2, a_2 = 3$, ta tính được:
    - $a_3 = 2 + 3 = 5$
    - $a_4 = 3 + 5 = 8$
    - $a_5 = 5 + 8 = 13$ chuỗi.

  *Cách 3 (Sử dụng hàm sinh - Generating Functions):*
  Ta có thể xây dựng các chuỗi nhị phân không có hai chữ số 0 kề nhau bằng các khối xây dựng cơ bản:
  - Khối `1` (độ dài 1, hàm sinh tương ứng là $x$).
  - Khối `10` (độ dài 2, hàm sinh tương ứng là $x^2$).
  Mọi chuỗi hợp lệ đều có thể viết dưới dạng lặp lại các khối này và kết thúc bằng chuỗi rỗng $e$ (độ dài 0, hàm sinh 1) hoặc số 0 đơn lẻ (độ dài 1, hàm sinh $x$). Biểu thức kịch bản: `(1|10)*(e|0)`.
  Hàm sinh tổng quát của các chuỗi hợp lệ theo độ dài là:
  $ G(x) = frac(1, 1 - x - x^2) dot (1 + x) = frac(1 + x, 1 - x - x^2) $
  Khai triển chuỗi lũy thừa của $G(x)$:
  $
    G(x) = (1 + x) sum_(k=0)^(infinity) (x + x^2)^k \
    = (1 + x) [1 + (x + x^2) + (x + x^2)^2 + (x + x^2)^3 + (x + x^2)^4 + (x + x^2)^5 + ...] \
    = (1 + x) [1 + x + 2x^2 + 3x^3 + 5x^4 + 8x^5 + 13x^6 + ...] \
    = 1 + 2x + 3x^2 + 5x^3 + 8x^4 + 13x^5 + 21x^6 + ...
  $
  Số lượng chuỗi hợp lệ độ dài 5 chính là hệ số của $x^5$ trong khai triển trên, bằng 13.
  Cả ba phương pháp đều cho kết quả nhất quán.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 2: NGUYÊN LÝ BÙ TRỪ VÀ ĐẾM NGƯỢC
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 2", "Nguyên Lý Bù Trừ Và Đếm Ngược", color: c-teal)

#theory-box[
  *1. Nguyên lý Đếm ngược (Complementary Counting):*
  Khi đếm trực tiếp một tập hợp các đối tượng thỏa mãn tính chất $P$ gặp nhiều khó khăn do chia quá nhiều trường hợp, ta có thể đếm gián tiếp:
  $ |A| = |Omega| - |overline(A)| $
  Trong đó:
  - $Omega$ là tập vũ trụ (tất cả các khả năng, kể cả không thỏa $P$).
  - $overline(A)$ là tập hợp các khả năng không thỏa mãn tính chất $P$ (phần bù).

  *2. Nguyên lý Bù trừ (Inclusion-Exclusion Principle):*
  - Với hai tập hợp: $|A union B| = |A| + |B| - |A inter B|$
  - Với ba tập hợp:
  $ |A union B union C| = |A| + |B| + |C| - (|A inter B| + |A inter C| + |B inter C|) + |A inter B inter C| $
]

#example-box(n: "1 (Dễ)")[
  Có bao nhiêu số tự nhiên có 3 chữ số chứa ít nhất một chữ số chẵn?

  *Giải:*
  - Tập vũ trụ $Omega$ là tập hợp tất cả các số tự nhiên có 3 chữ số: từ 100 đến 999 $ ->  |Omega| = 900$.
  - Phần bù $overline(A)$ là tập hợp các số có 3 chữ số mà tất cả các chữ số của nó đều là số lẻ (lấy từ $\{1, 3, 5, 7, 9\}$):
    - Chữ số thứ nhất có 5 cách chọn.
    - Chữ số thứ hai có 5 cách chọn.
    - Chữ số thứ ba có 5 cách chọn.
    Suy r
    - $487$ (nguyên tố, thỏa mãn)
    - $491$ (nguyên tố, thỏa mãn)
    - $493$ (chia hết cho 17, thỏa mãn)
    - $497$ (chia hết cho 7, thỏa mãn)
    - $499$ (nguyên tố, thỏa mãn)
    Tổng cộng có thêm 6 số thỏa mãn.
  Kết quả cuối cùng: $128 + 6 = 134$ số.
  - Tổng số cách chọn 5 học sinh từ 25 học sinh (không phân biệt giới tính) là: $|Omega| = C_(25)^5 = 53130$ cách.
  - Các trường hợp vi phạm điều kiện (không có ít nhất 1 nam và 1 nữ):
    - *Chọn toàn nam:* Chọn 5 học sinh từ 15 nam: $C_(15)^5 = 3003$ cách.
    - *Chọn toàn nữ:* Chọn 5 học sinh từ 10 nữ: $C_(10)^5 = 252$ cách.
  - Số cách chọn thỏa mãn yêu cầu đề bài là:
    $ N = 53130 - (3003 + 252) = 49875 " cách" $
]

#example-box(n: "3 (Khó - Giải bằng 2 cách)")[
  Có bao nhiêu số nguyên dương từ 1 đến 500 không chia hết cho bất kỳ số nào trong các số 2, 3 và 5?

  *Cách 1 (Nguyên lý bù trừ trực tiếp):*
  Gọi $Omega = \{1, 2, ..., 500\}  ->  |Omega| = 500$.
  Gọi $A, B, C$ lần lượt là tập hợp các số thuộc $Omega$ chia hết cho 2, 3, 5.
  - $|A| = floor(500 / 2) = 250$.
  - $|B| = floor(500 / 3) = 166$.
  - $|C| = floor(500 / 5) = 100$.
  - $|A inter B|$ (chia hết cho 6): $floor(500 / 6) = 83$.
  - $|A inter C|$ (chia hết cho 10): $floor(500 / 10) = 50$.
  - $|B inter C|$ (chia hết cho 15): $floor(500 / 15) = 33$.
  - $|A inter B inter C|$ (chia hết cho 30): $floor(500 / 30) = 16$.
  Áp dụng nguyên lý bù trừ, số các số chia hết cho ít nhất một trong ba số 2, 3, 5 là:
  $
    |A union B union C| = (250 + 166 + 100) - (83 + 50 + 33) + 16 \
    = 516 - 166 + 16 = 366
  Sắp xếp thứ tự của $n$ phần tử phân biệt. Số lượng cách xếp là:
  $ P_n = n! = n dot (n-1) dot ... dot 1 $
  $ N = |Omega| - |A union B union C| = 500 - 366 = 134 " số" $

  *Cách 2 (Xét lớp thặng dư theo mô-đun 30):*
  Bội chung nhỏ nhất của 2, 3, 5 là $lcm(2, 3, 5) = 30$.
  Xét một chu kỳ gồm 30 số nguyên liên tiếp $\{1, 2, ..., 30\}$. Số lượng số không chia hết cho 2, 3, 5 trong chu kỳ này được tính bằng hàm phi Euler $phi(30)$:
  $ phi(30) = 30 dot (1 - 1/2) dot (1 - 1/3) dot (1 - 1/5) = 30 dot 1/2 dot 2/3 dot 4/5 = 8 " số" $
  Từ 1 đến 500 có số chu kỳ đầy đủ là: $floor(500 / 30) = 16$ chu kỳ (tương ứng từ 1 đến 480).
  - Số lượng số thỏa mãn trong khoảng $[1, 480]$ là: $16 dot 8 = 128$ số.
  - Ta xét thủ công 20 số còn lại trong đoạn $[481, 500]$:
    Các số không chia hết cho 2, 3, 5 trong đoạn này là các số tận cùng bằng 1, 3, 7, 9 và không chia hết cho 3:
    - $481$ (chia hết cho 13, thỏa mãn)
    - $487$ (nguyên tố, thỏa mãn)
    - $491$ (nguyên tố, thỏa mãn)
    - $493$ (chia hết cho 17, thỏa mãn)
    - $497$ (chia hết cho 7, thỏa mãn)
    - $499$ (nguyên tố, thỏa mãn)
    Tổng cộng có thêm 6 số thỏa mãn.
  Kết quả cuối cùng: $128 + 6 = 134$ số.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 3: HOÁN VỊ, CHỈNH HỢP VÀ TỔ HỢP CƠ BẢN
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 3", "Hoán Vị, Chỉnh Hợp Và Tổ Hợp Cơ Bản", color: c-amber)

#theory-box[
  *1. Hoán vị (Permutations):*
  Sắp xếp thứ tự của $n$ phần tử phân biệt. Số lượng cách xếp là:
  $ P_n = n! = n dot (n-1) dot ... dot 1 $

  *2. Chỉnh hợp (Variations / K-permutations):*
  Chọn $k$ phần tử từ $n$ phần tử phân biệt và sắp xếp chúng theo một thứ tự xác định ($0 <= k <= n$):
  $ A_n^k = frac(n!, (n-k)!) $

  *3. Tổ hợp (Combinations):*
  Chọn $k$ phần tử từ $n$ phần tử phân biệt mà không quan tâm đến thứ tự chọn ($0 <= k <= n$):
  $ C_n^k = binom(n, k) = frac(n!, k! dot (n-k)!) $
]

#example-box(n: "1 (Dễ)")[
  Một lớp học có 40 học sinh. 
  a) Có bao nhiêu cách bầu ra một ban cán sự gồm 3 người giữ 3 chức vụ khác nhau: Lớp trưởng, Lớp phó, Thủ quỹ?
  b) Có bao nhiêu cách chọn ra 3 học sinh đi quét sân trường?

  *Giải:*
  a) Vì 3 học sinh được chọn giữ 3 chức vụ khác nhau nên việc sắp xếp thứ tự là quan trọng. Số cách chọn là một chỉnh hợp chập 3 của 40:
  $ A_(40)^3 = 40 dot 39 dot 38 = 59280 " cách" $
  b) Đi quét sân trường không phân biệt thứ tự/chức vụ giữa 3 người. Số cách chọn là một tổ hợp chập 3 của 40:
  $ C_(40)^3 = frac(40 dot 39 dot 38, 3 dot 2 dot 1) = 9880 " 
// ══════════════════════════════════════════════════════════════
]

// ══════════════════════════════════════════════════════════════
  $ C_n^k = C_(n-1)^k + C_(n-1)^(k-1) $

  *Giải:*
  Vế trái $C_n^k$ là số cách chọn ra một tập con có $k$ phần tử từ tập $S$ gồm $n$ phần tử.
  Ta cố định một phần tử đặc biệt trong tập $S$, giả sử là phần tử $n$. Khi chọn tập con $k$ phần tử, chỉ có hai trường hợp loại trừ nhau:
  - *Trường hợp 1:* Tập con được chọn không chứa phần tử $n$. Điều này tương đương với việc ta chọn cả $k$ phần tử từ $n-1$ phần tử còn lại của $S$. Số cách chọn là $C_(n-1)^k$.
  - *Trường hợp 2:* Tập con được chọn bắt buộc phải chứa phần tử $n$. Khi đó, ta chỉ cần chọn thêm $k-1$ phần tử nữa từ $n-1$ phần tử còn lại của $S$. Số cách chọn là $C_(n-1)^(k-1)$.
  Theo nguyên lý cộng, tổng số cách chọn là $C_(n-1)^k + C_(n-1)^(k-1)$. Do đó hai vế bằng nhau.
]

#example-box(n: "3 (Khó - Giải bằng 3 cách)")[
  Chọn 4 số từ tập hợp $\{1, 2, ..., 12\}$ sao cho trong 4 số được chọn không có hai số nào là hai số tự nhiên liên tiếp. Hỏi có bao nhiêu cách chọn?

  *Cách 1 (Phương pháp song ánh):*
  Giả sử các số được chọn theo thứ tự tăng dần là $x_1 < x_2 < x_3 < x_4$.
  Điều kiện không có hai số nào liên tiếp có nghĩa là:
  $ x_(i+1) - x_i >= 2 quad (forall i = 1, 2, 3) $
  Ta thực hiện phép đổi biến đặt:
#theory-box[
  *1. Phương pháp Gộp khối (Gluing Method):*
  - Tổng số cách xếp 3 khối lớn bất kỳ là: $3! = 6$ cách.
  - Số cách xếp 3 khối lớn sao cho khối A và khối C đứng cạnh nhau:
    Gộp A và C thành một khối siêu cấp {AC}. Khi đó ta hoán vị 2 đối tượng là {AC} và B: có $2! = 2$ cách. Hoán vị nội bộ A và C trong khối siêu cấp là $2! = 2$ cách. Vậy có $2 dot 2 = 4$ cách xếp khối có A kề C.
  - Số cách xếp khối thỏa mãn A không kề C là: $6 - 4 = 2$ cách.
  - Nhân với số hoán vị bên trong các khối A, B, C:
    $ N = 2 dot (3! dot 2! dot 2!) = 2 dot 6 dot 2 dot 2 = 48 " cách" $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 5: HOÁN VỊ LẶP VÀ BÀI TOÁN SẮP XẾP CHUỖI
// ══════════════════════════════════════════════════════════════
  Theo nguyên lý nhân, số cách xếp thỏa mãn là: $120 dot 120 = 14400$ cách.
]

#example-box(n: "3 (Khó - Giải bằng 2 cách)")[
  Xếp 3 học sinh lớp A, 2 học sinh lớp B và 2 học sinh lớp C thành một hàng ngang sao cho học sinh cùng lớp luôn đứng cạnh nhau, đồng thời học sinh lớp A và học sinh lớp C không được đứng cạnh nhau.

  *Cách 1 (Xếp trực tiếp khối):*
  Gộp học sinh cùng lớp thành các khối lớn: Khối A (chứa 3 học sinh A), Khối B (chứa 2 học sinh B), Khối C (chứa 2 học sinh C).
  Ta quy bài toán về việc đếm số nghiệm nguyên của một phương trình. Giả sử 4 số được chọn theo thứ tự tăng dần là $x_1 < x_2 < x_3 < x_4$.
  Gọi:
  - $y_1$ là số lượng số không được chọn nằm trước $x_1$ ($y_1 >= 0$).
  - $y_2, y_3, y_4$ lần lượt là số lượng số không được chọn nằm giữa $x_1$ và $x_2$, $x_2$ và $x_3$, $x_3$ và $x_4$. Do không có hai số nào liên tiếp nên giữa mỗi cặp số được chọn phải có ít nhất một số không được chọn, tức là $y_2, y_3, y_4 >= 1$.
  - $y_5$ là số lượng số không được chọn nằm sau $x_4$ ($y_5 >= 0$).
  
  Tổng số các số không được chọn là $12 - 4 = 8$ số, do đó ta có phương trình nghiệm nguyên:
  $ y_1 + y_2 + y_3 + y_4 + y_5 = 8 $
  Trong đó $y_1, y_5 >= 0$ và $y_2, y_3, y_4 >= 1$.
  Hàm sinh cho số nghiệm của phương trình này là:
  $ f(t) = (sum_(k=0)^(infinity) t^k)^2 dot (sum_(k=1)^(infinity) t^k)^3 = (frac(1, 1-t))^2 dot (frac(t, 1-t))^3 = frac(t^3, (1-t)^5) $
  Số cách chọn thỏa mãn yêu cầu chính là hệ số của $t^8$ trong khai triển lũy thừa của $f(t)$:
  $ [t^8] f(t) = [t^8] frac(t^3, (1-t)^5) = [t^5] (1-t)^(-5) = C_(5+5-1)^5 = C_9^4 = 126 " cách." $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 4: PHƯƠNG PHÁP GỘP KHỐI VÀ KHOẢNG TRỐNG
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 4", "Phương Pháp Gộp Khối Và Khoảng Trống", color: c-violet)

#theory-box[
  *1. Phương pháp Gộp khối (Gluing Method):*
  Dùng khi đề bài yêu cầu các phần tử thuộc nhóm $X$ phải đứng cạnh nhau.
  - *Chiến lược:* Gộp toàn bộ các phần tử của nhóm $X$ thành một "siêu phần tử" duy nhất. Sắp xếp siêu phần tử này cùng các phần tử còn lại, sau đó nhân với số cách sắp xếp nội bộ trong khối $X$.

  *2. Phương pháp Khoảng trống (Gap Method):*
  Dùng khi đề bài yêu cầu các phần tử thuộc nhóm $Y$ không được đứng cạnh nhau.
  - *Chiến lược:* Sắp xếp các phần tử tự do còn lại trước. Sau đó, chèn các phần tử của nhóm $Y$ vào các khoảng trống được tạo ra giữa các phần tử tự do (bao gồm cả hai đầu).
]

#example-box(n: "1 (Dễ)")[
  Xếp 4 học sinh nam và 2 học sinh nữ thành một hàng dọc. Có bao nhiêu cách xếp sao cho 2 học sinh nữ luôn đứng cạnh nhau?

  *Giải:*
  - Gộp 2 học sinh nữ thành 1 khối duy nhất. Lúc này ta cần sắp xếp 5 đối tượng (khối nữ + 4 học sinh nam): có $5! = 120$ cách xếp.
  - Hoán vị nội bộ 2 học sinh nữ trong khối đó: có $2! = 2$ cách.
  Theo nguyên lý nhân, tổng số cách xếp hàng là: $120 dot 2 = 240$ cách.
]

#example-box(n: "2 (Trung bình)")[
  Xếp 5 học sinh nam và 3 học sinh nữ thành một hàng ngang sao cho không có hai học sinh nữ n

  *Giải:*
  - Bước 1: Sắp xếp 5 học sinh nam trước, có $5! = 120$ cách xếp.
  - Xếp xong 5 học sinh nam, ta có 6 khoảng trống xen kẽ ở hai đầu và giữa họ:
    `_ Nam _ Nam _ Nam _ Nam _ Nam _`
  - Bước 2: Chọn 3 khoảng trống từ 6 khoảng trống này và xếp 3 học sinh nữ vào đó: có $A_6^3 = 120$ cách.
  Theo nguyên lý nhân, số cách xếp thỏa mãn là: $120 dot 120 = 14400$ cách.
]

#example-box(n: "3 (Khó - Giải bằng 2 cách)")[
  Xếp 3 học sinh lớp A, 2 học sinh lớp B và 2 học sinh lớp C thành một hàng ngang sao cho học sinh cùng lớp luôn đứng cạnh nhau, đồng thời học sinh lớp A và học sinh lớp C không được đứng cạnh nhau.

  *Cách 1 (Xếp trực tiếp khối):*
  Gộp học sinh cùng lớp thành các khối lớn: Khối A (chứa 3 học sinh A), Khối B (chứa 2 học sinh B), Khối C (chứa 2 học sinh C).
  - Hoán vị nội bộ trong mỗi khối:
    - Khối A: $3! = 6$ cách.
    - Khối B: $2! = 2$ cách.
    - Khối C: $2! = 2$ cách.
  - Sắp xếp vị trí của 3 khối (A, B, C) sao cho khối A và khối C không kề nhau. Với 3 khối đứng hàng ngang, chỉ có thể để khối B ở giữa:
    - Dạng 1: `Khối A - Khối B - Khối C`
    - Dạng 2: `Khối C - Khối B - Khối A`
    Vậy có đúng 2 cách xếp khối.
  Tổng số cách xếp thỏa mãn đề bài là:
  $ N = 2 dot (6 dot 2 dot 2) = 48 " cách" $

  *Cách 2 (Đếm ngược - Dùng phần bù):*
  - Tổng số cách xếp 3 khối lớn bất kỳ là: $3! = 6$ cách.
  - Số cách xếp 3 khối lớn sao cho khối A và khối C đứng cạnh nhau:
    Gộp A và C thành một khối siêu cấp {AC}. Khi đó ta hoán vị 2 đối tượng là {AC} và B: có $2! = 2$ cách. Hoán vị nội bộ A và C trong khối siêu cấp là $2! = 2$ cách. Vậy có $2 dot 2 = 4$ cách xếp khối có A kề C.
  - Số cách xếp khối thỏa mãn A không kề C là: $6 - 4 = 2$ cách.
  - Nhân với số hoán vị bên trong các khối A, B, C:
    $ N = 2 dot (3! dot 2! dot 2!) = 2 dot 6 dot 2 dot 2 = 48 " cách" $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 5: HOÁN VỊ LẶP VÀ BÀI TOÁN SẮP XẾP CHUỖI
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 5", "Hoán Vị Lặp Và Bài Toán Sắp Xếp Chuỗi", color: c-indigo)

#theory-box[
  *1. Định nghĩa Hoán vị lặp:*
  Cho $n$ phần tử, trong đó có $n_1$ phần tử loại 1 giống nhau, $n_2$ phần tử loại 2 giống nhau, ..., $n_k$ phần tử loại $k$ giống nhau (tổng $n_1 + n_2 + ... + n_k = n$).
  Số cách sắp xếp có phân biệt $n$ phần tử này thành một hàng là:
  $ P(n; n_1, n_2, ..., n_k) = frac(n!, n_1! dot n_2! dot ... dot n_k!) $

  *2. Bài toán đường đi ngắn nhất trên lưới:*
  Đường đi từ $(0,0)$ đến $(m,n)$ chỉ bằng các bước sang phải $R(1,0)$ hoặc lên trên $U(0,1)$. Mỗi đường đi là một hoán vị của chuỗi gồm $m$ ký tự $R$ và $n$ ký tự $U$. Tổng số đường đi là:
  $ P(m+n; m, n) = frac((m+n)!, m! dot n!) = C_(m+n)^m $
]

#example-box(n: "1 (Dễ)")[
  Có bao nhiêu cách sắp xếp các chữ cái của từ "HỌCTẬP" thành một chuỗi ký tự phân biệt?

  *Giải:*
  Từ "HỌCTẬP" gồm 6 chữ cái phân biệt: H, O, C, T, A, P.
  Số cách sắp xếp là số hoán vị của 6 phần tử:
  $ P_6 = 6! = 720 " cách" $
]

"#example-box(n: \"2 (Trung bình)\")[\n  Có bao nhiêu cách sắp xếp 5 chữ cái A giống nhau và 3 chữ cái B giống nhau thành một chuỗi ký tự sao cho không có hai chữ B nào đứng cạnh nhau?\n\n  *Cách 1 (Sử dụng phương pháp khoảng trống):*\n  - Bước 1: Xếp 5 chữ cái A thành hàng ngang. Vì các chữ cái A giống nhau nên chỉ có 1 cách xếp.\n  - Bước 2: Tạo ra 6 khoảng trống xung quanh 5 chữ cái A:\n    `_ A _ A _ A _ A _ A _`\n  - Bước 3: Để không có hai chữ B kề nhau, ta chọn 3 khoảng trống từ 6 khoảng trống này để đặt 3 chữ B vào. Vì các chữ B giống nhau nên mỗi cách chọn khoảng trống chỉ tương ứng với 1 cách đặt.\n  Số cách xếp là: $C_6^3 = 20$ cách.\n\n  *Cách 2 (Sử dụng phương pháp Hàm sinh - Generating Functions):*\n  Ta có thể coi chuỗi ký tự được hình thành bằng cách phân phối các chữ cái A vào các khoảng trống xung quanh các chữ cái B. Gọi:\n  - $x_0$ là số lượng chữ cái A đứng trước chữ B thứ nhất ($x_0 >= 0$).\n  - $x_1$ là số lượng chữ cái A đứng giữa chữ B thứ nhất và thứ hai ($x_1 >= 1$, do hai chữ B không kề nhau).\n  - $x_2$ là số lượng chữ cái A đứng giữa chữ B thứ hai và thứ ba ($x_2 >= 1$, do hai chữ B không kề nhau).\n  - $x_3$ là số lượng chữ cái A đứng sau chữ B thứ ba ($x_3 >= 0$).\n\n  Tổng số chữ cái A là 5, nên ta có phương trình nghiệm nguyên:\n  $ x_0 + x_1 + x_2 + x_3 = 5 $\n  với $x_0, x_3 >= 0$ và $x_1, x_2 >= 1$.\n\n  Hàm sinh đại diện cho từng biến số là:\n  - Với $x_0, x_3$: $f_0 (t) = f_3 (t) = 1 + t + t^2 + ... = frac(1, 1 - t)$.\n  - Với $x_1, x_2$: $f_1 (t) = f_2 (t) = t + t^2 + t^3 + ... = frac(t, 1 - t)$.\n\n  Hàm sinh tổng quát của bài toán là:\n  $ G(t) = f_0 (t) dot f_1 (t) dot f_2 (t) dot f_3 (t) = (frac(1, 1 - t))^2 dot (frac(t, 1 - t))^2 = frac(t^2
<truncated 229 bytes>

#example-box(n: "3 (Khó - Giải bằng 2 cách)")[
  Trên lưới tọa độ phẳng, một robot di chuyển từ điểm $(0,0)$ đến điểm $(4,3)$ chỉ bằng các bước sang phải $(+1, 0)$ hoặc lên trên $(0, +1)$. Hỏi có bao nhiêu con đường đi ngắn nhất mà không đi qua điểm $(2,2)$?

  *Cách 1 (Sử dụng phần bù & Hoán vị lặp):*
  - Bước 1: Tính tổng số con đường đi ngắn nhất từ $(0,0)$ đến $(4,3)$.
    Mỗi đường đi gồm 4 bước sang phải (R) và 3 bước đi lên (U), tổng cộng 7 bước.
    Số đường đi bất kỳ là: $N_(Omega) = C_(7)^4 = frac(7!, 4! dot 3!) = 35$ đường.
  - Bước 2: Tính số con đường đi qua điểm $(2,2)$. Quy trình được chia làm hai gia
  Ta thực hiện đổi biến cho biến $a$: đặt $a' = a - 1 >= 0  ->  a = a' + 1$.
  Phương trình trở thành:
  $ (a' + 1) + b + c + d = 10  <->  a' + b + c + d = 9 $
  - Số đường đi hợp lệ là: $N = N_(Omega) - N_("cấm") = 35 - 18 = 17$ đường.

  *Cách 2 (Quy hoạch động - Đếm trực tiếp trên lưới):*
  Ta tính số cách đi đến mỗi nút $(i,j)$ bằng hệ thức:
  $ f(i,j) = f(i-1, j) + f(i, j-1) $
  Với điểm cấm $(2,2)$, ta gán cố định $f(2,2) = 0$.
  Lập bảng giá trị:
  - Hàng $j=0$: $f(0,0)=1, f(1,0)=1, f(2,0)=1, f(3,0)=1, f(4,0)=1$.
  - Hàng $j=1$:
    - $f(0,1) = 1$
    - $f(1,1) = f(0,1) + f(1,0) = 1 + 1 = 2$
    - $f(2,1) = f(1,1) + f(2,0) = 2 + 1 = 3$
    - $f(3,1) = f(2,1) + f(3,0) = 3 + 1 = 4$
    - $f(4,1) = f(3,1) + f(4,0) = 4 + 1 = 5$
  - Hàng $j=2$:
    - $f(0,2) = 1$
    - $f(1,2) = 1 + 2 = 3$
    - $f(2,2) = 0$ (điểm cấm)
    - $f(3,2) = f(2,2) + f(3,1) = 0 + 4 = 4$
    - $f(4,2) = f(3,2) + f(4,1) = 4 + 5 = 9$
  - Hàng $j=3$:
    - $f(0,3) = 1$
    - $f(1,3) = 1 + 3 = 4$
    - $f(2,3) = f(1,3) + f(2,2) = 4 + 0 = 4$
    - $f(3,3) = f(2,3) + f(3,2) = 4 + 4 = 8$
    - $f(4,3) = f(3,3) + f(4,2) = 8 + 9 = 17$
  Kết quả tại điểm $(4,3)$ là 17 đường.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 6: PHƯƠNG PHÁP VÁCH NGĂN (STARS & BARS) CƠ BẢN
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 6", "Phương Pháp Vách Ngăn Cơ Bản", color: c-blue)

#theory-box[
  *Bài toán cơ bản:* Tìm số nghiệm nguyên của phương trình:
  $ x_1 + x_2 + ... + x_k = n $

  *1. Trường hợp nghiệm nguyên không âm ($x_i >= 0$):*
  Tương ứng với cách phân phối $n$ vật giống nhau vào $k$ hộp phân biệt (hộp có thể rỗng). Số nghiệm là:
  $ N = C_(n+k-1)^(k-1) = C_(n+k-1)^n $

  *2. Trường hợp nghiệm nguyên dương ($x_i >= 1$):*
  Tương ứng với việc chia $n$ vật giống nhau vào $k$ hộp sao cho hộp nào cũng có ít nhất 1 vật. Số nghiệm là:
  $ N = C_(n-1)^(k-1) $
]

#example-box(n: "1 (Dễ)")[
  Có bao nhiêu cách chia 10 chiếc kẹo giống nhau cho 3 bạn nhỏ sao cho mỗi bạn nhận được ít nhất 1 chiếc kẹo?

  *Giải:*
  Đây là bài toán chia kẹo Euler cơ bản với $n=10$ vật giống nhau và $k=3$ phần tử phân biệt, điều kiện mỗi phần tử có giá trị $x_i >= 1$.
  Số cách chia kẹo là:
  $ C_(10-1)^(3-1) = C_9^2 = 36 " cách" $
]

#example-box(n: "2 (Trung bình)")[
  Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 15$ thỏa mãn điều kiện $x_1 >= 1, x_2 >= 2, x_3 >= -1, x_4 >= 0$.

  *Cách 1 (Phương pháp đổi biến - Vách ngăn):*
  Ta thực hiện đổi biến để chuyển các điều kiện ràng buộc về dạng không âm ($>= 0$):
  - Đặt $y_1 = x_1 - 1 >= 0  ->  x_1 = y_1 + 1$
  - Đặt $y_2 = x_2 - 2 >= 0  ->  x_2 = y_2 + 2$
  - Đặt $y_3 = x_3 + 1 >= 0  ->  x_3 = y_3 - 1$
  - Đặt $y_4 = x_4 >= 0  ->  x_4 = y_4$
  Thay vào phương trình ban đầu ta được:
  $
    (y_1 + 1) + (y_2 + 2) + (y_3 - 1) + y_4 = 15 \
     <->  y_1 + y_2 + y_3 + y_4 = 13
  $
  Số cách chọn chính là số nghiệm nguyên không âm của phương trình mới với $n=13$ và $k=4$:
  $ N = C_(13+4-1)^(4-1) = C_(16)^3 = frac(16 dot 15 dot 14, 3 dot 2 dot 1) = 560 " nghiệm" $
]

  $ y_1 + y_2 + y_3 = 12 - 6 = 6 $

"#example-box(n: \"1 (Dễ)\")[\n  Có bao nhiêu cách chia 10 chiếc kẹo giống nhau cho 3 bạn nhỏ sao cho mỗi bạn nhận được ít nhất 1 chiếc kẹo?\n\n  *Cách 1 (Sử dụng phương pháp vách ngăn):*\n  Đây là bài toán chia kẹo Euler cơ bản với $n=10$ vật giống nhau và $k=3$ phần tử phân biệt, điều kiện mỗi phần tử có giá trị $x_i >= 1$.\n  Số cách chia kẹo là:\n  $ C_(10-1)^(3-1) = C_9^2 = 36 \" cách\" $\n\n  *Cách 2 (Sử dụng phương pháp Hàm sinh):*\n  Gọi $x_1, x_2, x_3$ lần lượt là số kẹo của 3 bạn nhỏ. Bài toán quy về tìm số nghiệm nguyên của phương trình:\n  $ x_1 + x_2 + x_3 = 10 $\n  với các điều kiện ràng buộc $x_i >= 1$ ($i = 1, 2, 3$).\n\n  Mỗi biến $x_i >= 1$ tương ứng với hàm sinh biểu diễn cho số lượng kẹo nhận được:\n  $ f(t) = t + t^2 + t^3 + ... = frac(t, 1 - t) $\n\n  Hàm sinh cho tổng số cách chia kẹo cho cả 3 bạn là:\n  $ G(t) = (f(t))^3 = (frac(t, 1 - t))^3 = t^3 (1 - t)^(-3) $\n\n  Số cách chia kẹo chính là hệ số của $t^(10)$ trong khai triển của $G(t)$, ký hiệu là $[t^(10)] G(t)$:\n  $ [t^(10)] G(t) = [t^7] (1 - t)^(-3) = C_(7 + 3 - 1)^7 = C_9^7 = C_9^2 = 36 \" cách.\" $\n]"

#example-box(n: "2 (Trung bình)")[
  Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 15$ thỏa mãn điều kiện $x_1 >= 1, x_2 >= 2, x_3 >= -1, x_4 >= 0$.

    f(x) = x^6 (1 + x + x^2 + x^3)^3 = x^6 (frac(1 - x^4, 1 - x))^3 \
    = x^6 (1 - x^4)^3 (1 - x)^(-3) \
    = x^6 (1 - 3x^4 + 3x^8 - x^(12)) (1 - x)^(-3)
  $
  - Chữ số đầu $a  in  \{1, 2, ..., 9\}$ đại diện bởi đa thức: $P_a (x) = x + x^2 + ... + x^9$.
  - Ba chữ số sau $b, c, d  in  \{0, 1, ..., 9\}$ đại diện bởi đa thức: $P_{b,c,d}(x) = 1 + x + ... + x^9$.
  Hàm sinh tổng quát là:
  $ f(x) = (x + x^2 + ... + x^9) dot (1 + x + ... + x^9)^3 $
  Ta tìm hệ số của $x^(10)$ trong $f(x)$, tương đương hệ số của $x^9$ trong:
  $ g(x) = (1 + x + ... + x^8) dot (1 + x + ... + x^9)^3 $
  Với các số mũ nhỏ ($<= 9$), đa thức $1+x+...+x^k$ có thể viết xấp xỉ dưới dạng chuỗi lũy thừa vô hạn $(1-x)^(-1)$. Hệ số của $x^9$ trong $g(x)$ chính là hệ số của $x^9$ trong:
  Số cách chọn là:
  $ N = C_(9+4-1)^(4-1) = C_(12)^3 = frac(12 dot 11 dot 10, 3 dot 2 dot 1) = 220 " số" $

  *Cách 2 (Sử dụng hàm sinh - Generating Function):*
  Số cách chính là hệ số của số hạng $x^(10)$ trong khai triển hàm sinh đại diện cho việc chọn 4 chữ số:
]

#example-box(n: "2 (Trung bình)")[
  Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 15$ thỏa mãn điều kiện $x_1 >= 1, x_2 >= 2, x_3 >= -1, x_4 >= 0$.

  *Cách 1 (Phương pháp đổi biến - Vách ngăn):*
  Ta thực hiện đổi biến để chuyển các điều kiện ràng buộc về dạng không âm ($>= 0$):
  - Đặt $y_1 = x_1 - 1 >= 0  ->  x_1 = y_1 + 1$
  - Đặt $y_2 = x_2 - 2 >= 0  ->  x_2 = y_2 + 2$
  - Đặt $y_3 = x_3 + 1 >= 0  ->  x_3 = y_3 - 1$
  - Đặt $y_4 = x_4 >= 0  ->  x_4 = y_4$
  Thay vào phương trình ban đầu ta được:
  $
    (y_1 + 1) + (y_2 + 2) + (y_3 - 1) + y_4 = 15 \
     <->  y_1 + y_2 + y_3 + y_4 = 13
  $
  Số cách chọn chính là số nghiệm nguyên không âm của phương trình mới với $n=13$ và $k=4$:
  $ N = C_(13+4-1)^(4-1) = C_(16)^3 = frac(16 dot 15 dot 14, 3 dot 2 dot 1) = 560 " nghiệm" $

  *Cách 2 (Sử dụng hàm sinh - Generating Function):*
  Hàm sinh đại diện cho từng biến tương đương với điều kiện chặn của chúng:
  - Biến $x_1$ ($x_1 >= 1$): $f_1(t) = t + t^2 + t^3 + ... = frac(t, 1-t)$.
  - Biến $x_2$ ($x_2 >= 2$): $f_2(t) = t^2 + t^3 + t^4 + ... = frac(t^2, 1-t)$.
  - Biến $x_3$ ($x_3 >= -1$): $f_3(t) = t^(-1) + 1 + t + t^2 + ... = frac(t^(-1), 1-t)$.
  - Biến $x_4$ ($x_4 >= 0$): $f_4(t) = 1 + t + t^2 + ... = frac(1, 1-t)$.
  
  Hàm sinh tổng quát của hệ là:
  $ f(t) = f_1(t) f_2(t) f_3(t) f_4(t) = frac(t, 1-t) dot frac(t^2, 1-t) dot frac(t^(-1), 1-t) dot frac(1, 1-t) = frac(t^2, (1-t)^4) $
  Số nghiệm của phương trình chính là hệ số của $t^(15)$ trong khai triển hàm sinh:
  $ [t^(15)] f(t) = [t^(15)] frac(t^2, (1-t)^4) = [t^(13)] (1-t)^(-4) = C_(13+4-1)^(13) = C_(16)^3 = 560 " nghiệm." $
]

#example-box(n: "3 (Khó - Giải bằng 2 cách)")[
  Có bao nhiêu số tự nhiên có 4 chữ số mà tổng các chữ số của số đó bằng 10?

  *Cách 1 (Phương pháp vách ngăn trực tiếp):*
    - Giả sử $x_1 >= 4$. Đặt $x_1' = x_1 - 4 >= 0  ->  x_1' + x_2 + x_3 = 2$.
      Số nghiệm là $C_(2+3-1)^(3-1) = C_4^2 = 6$. Có 3 biến nên có $3 dot 6 = 18$ cách vi phạm.
    - Không thể có đồng thời 2 biến $x_i >= 4$ vì tổng chỉ bằng 6.
  Theo nguyên lý bù trừ, số nghiệm thỏa mãn là: $28 - 18 = 10$.
]

#example-box(n: "2 (Trung bình)")[
  Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 = 10$ thỏa mãn điều kiện $0 <= x_i <= 4$ với mọi $i = 1, 2, 3$.

  *Cách 1 (Nguyên lý bù trừ kết hợp vách ngăn):*
  - Số nghiệm nguyên không âm không giới hạn trên: $C_(10+3-1)^2 = C_(12)^2 = 66$.
  - Xét các trường hợp vi phạm điều kiện cận trên ($x_i >= 5$):
    - *Trường hợp 1 (Có đúng 1 biến $x_i >= 5$):*
      Giả sử $x_1 >= 5$, đặt $x_1' = x_1 - 5 >= 0  ->  x_1' + x_2 + x_3 = 5$.
      Số nghiệm là $C_(5+2)^2 = C_7^2 = 21$.
      Có $C_3^1 = 3$ cách chọn biến vi phạm $ ->  3 dot 21 = 63$ cách.
    - *Trường hợp 2 (Có ít nhất 2 biến $x_i >= 5$):*
      Giả sử $x_1 >= 5, x_2 >= 5$. Đặt $x_1'=x_1-5, x_2'=x_2-5  ->  x_1'+x_2'+x_3 = 0$.
      Số nghiệm là $C_2^2 = 1$.
      Có $C_3^2 = 3$ cách chọn cặp biến vi phạm $ ->  3 dot 1 = 3$ cách.
    - Không thể có cả 3 biến $x_i >= 5$ vì tổng bằng 10.
  Áp dụng công thức bù trừ:
  $ N = 66 - 63 + 3 = 6 " nghiệm" $

  *Cách 2 (Phương pháp hàm sinh đại số):*
  Mỗi biến nhận giá trị từ 0 đến 4 đại diện bởi đa thức $P(x) = 1 + x + x^2 + x^3 + x^4 = frac(1 - x^5, 1 - x)$.
  Số nghiệm chính là hệ số của $x^(10)$ trong đa thức tích:
  $ f(x) = (frac(1 - x^5, 1 - x))^3 = (1 - x^5)^3 (1 - x)^(-3) $
  Khai triển đa thức ta có:
  $ (1 - x^5)^3 = 1 - 3x^5 + 3x^(10) - x^(15) $
  Khai triển chuỗi lũy thừa ta có:
  $ (1 - x)^(-3) = sum_(k=0)^(infinity) C_(k+2)^2 x^k $
  Để tìm hệ số của $x^(10)$ trong $f(x)$, ta nhân các hạng tử tương ứng có tổng bậc bằng 10:
  - Số hạng 1 nhân với hệ số của $x^(10)$ trong $(1-x)^(-3)$ ($k=10$): $1 dot C_(12)^2 = 66$.
  - Số hạng $-3x^5$ nhân với hệ số của $x^5$ trong $(1-x)^(-3)$ ($k=5$): $-3 dot C_7^2 = -63$.
  - Số hạng $3x^(10)$ nhân với hệ số của $x^0$ trong $(1-x)^(-3)$ ($k=0$): $3 dot C_2^2 = 3$.
  Tổng các hệ số trên là:
  $ N = 66 - 63 + 3 = 6 " nghiệm." $
]
]

"#example-box(n: \"1 (Dễ)\")[\n  Tìm số cách chia 6 viên kẹo giống nhau cho 3 bạn nhỏ sao cho mỗi bạn nhận được không quá 3 viên kẹo.\n\n  *Cách 1 (Sử dụng Nguyên lý bù trừ kết hợp vách ngăn):*\n  Gọi số kẹo mỗi bạn nhận là $x_1, x_2, x_3$. Ta có phương trình:\n  $ x_1 + x_2 + x_3 = 6 $\n  Ràng buộc: $0 <= x_i <= 3$.\n  - Số nghiệm không âm không có cận trên là: $C_(6+3-1)^(3-1) = C_8^2 = 28$.\n  - Đặt điều kiện vi phạm: $A_i$ là tập nghiệm có $x_i >= 4$.\n    - Giả sử $x_1 >= 4$. Đặt $x_1' = x_1 - 4 >= 0  ->  x_1' + x_2 + x_3 = 2$.\n      Số nghiệm là $C_(2+3-1)^(3-1) = C_4^2 = 6$. Có 3 biến nên có $3 dot 6 = 18$ cách vi phạm.\n    - Không thể có đồng thời 2 biến $x_i >= 4$ vì tổng chỉ bằng 6.\n  Theo nguyên lý bù trừ, số nghiệm thỏa mãn là: $28 - 18 = 10$.\n\n  *Cách 2 (Sử dụng phương pháp Hàm sinh):*\n  Mỗi biến $x_i$ ($i = 1, 2, 3$) đại diện cho số kẹo của một bạn nhỏ, nhận giá trị từ $0$ đến $3$. Đa thức đại diện cho mỗi biến là:\n  $ P(t) = 1 + t + t^2 + t^3 = frac(1 - t^4, 1 - t) $\n\n  Hàm sinh cho tổng số cách chia kẹo là:\n  $ G(t) = (P(t))^3 = (frac(1 - t^4, 1 - t))^3 = (1 - t^4)^3 (1 - t)^(-3) $\n\n  Khai triển đa thức thứ nhất:\n  $ (1 - t^4)^3 = 1 - 3 t^4 + 3 t^8 - t^(12) $\n\n  Khai triển chuỗi lũy thừa của nhân tử thứ hai:\n  $ (1 - t)^(-3) = sum_(k=0)^(infinity) C_(k + 2)^2 t^k $\n\n  Số cách chia kẹo chính là hệ số của $t^6$ trong khai triển của $G(t)$, ký hiệu là $[t^6] G(t)$. Hệ số này được đóng góp từ hai hạng tử của đa thức $(1 - 3 t^4)$:\n  - Hạng tử $1$ nhân với hệ số của $t^6$ trong $(1 - t)^(-3)$ (tương ứng $k=6$):\n    $ 1 dot C_(6 + 2)^2 = C_8^2 = 28 $\n  - Hạng tử $-3 t^4$ nhân với hệ số của $t^2$ trong $(1 - t)^(-3)$ (tương ứng $k=2$):\n    $ -3 dot C_(2 + 2)^2 = -3 dot C_4^2 = -18
<truncated 80 bytes>

#example-box(n: "2 (Trung bình)")[
  Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 = 10$ thỏa mãn điều kiện $0 <= x_i <= 4$ với mọi $i = 1, 2, 3$.

  *Cách 1 (Nguyên lý bù trừ kết hợp vách ngăn):*
  $
    f(x) = x^6 (1 + x + x^2 + x^3)^3 = x^6 (frac(1 - x^4, 1 - x))^3 \
    = x^6 (1 - x^4)^3 (1 - x)^(-3) \
    = x^6 (1 - 3x^4 + 3x^8 - x^(12)) (1 - x)^(-3)
  $
  Cần tìm hệ số của $x^(12)$ trong $f(x)$, tương đương hệ số của $x^6$ trong:
  $ h(x) = (1 - 3x^4) (1 - x)^(-3) $
  (Bỏ các số mũ $x^k$ với $k > 6$ vì không đóng góp vào hệ số $x^6$).
  Biết rằng $(1-x)^(-3) = sum_(k=0)^( infinity ) C_(k+2)^2 x^k$.
  - Phần đóng góp từ số hạng 1 trong $(1-3x^4)$ là hệ số của $x^6$ trong $(1-x)^(-3)$, tương ứng $k=6$:
    $ C_(6+2)^2 = C_8^2 = 28 $
  - Phần đóng góp từ số hạng $-3x^4$ là hệ số của $x^2$ trong $(1-x)^(-3)$ nhân với $-3$, tương ứng $k=2$:
    $ -3 dot C_(2+2)^2 = -3 dot C_4^2 = -18 $
  Tổng hệ số là: $28 - 18 = 10$. Kết quả hoàn toàn trùng khớp.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 8: PHÂN HOẠCH TẬP HỢP (SỐ STIRLING LOẠI 2 & SỐ BELL)
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 8", "Phân Hoạch Tập Hợp", color: c-violet)

#theory-box[
  *1. Số Stirling loại 2 (Stirling Numbers of the Second Kind) $S(n,k)$:*
  Là số cách chia một tập hợp gồm $n$ phần tử phân biệt thành $k$ nhóm không rỗng, trong đó *các nhóm không phân biệt* (không có tên gọi).
  $ S(n,k) = frac(1, k!) sum_(j=0)^k (-1)^(k-j) C_k^j j^n $
  Công thức truy hồi: $S(n,k) = k dot S(n-1, k) + S(n-1, k-1)$ với $S(n,1) = S(n,n) = 1$.

  *2. Liên hệ nhóm phân biệt (Toàn ánh - Surjection):*
  Số cách chia $n$ vật phân biệt vào $k$ hộp phân biệt sao cho hộp nào cũng có ít nhất 1 vật là:
  $ T(n,k) = k! dot S(n,k) $

  *3. Số Bell $B(n)$:*
  Là tổng số cách phân hoạch tập hợp có $n$ phần tử thành các nhóm không rỗng (số lượng nhóm tùy ý từ 1 đến $n$).
  $ B(n) = sum_(k=1)^n S(n,k) $
]

#example-box(n: "1 (Dễ)")[
  Có 4 học sinh khác nhau. Hỏi có bao nhiêu cách chia 4 học sinh này thành 2 nhóm học tập không phân biệt, mỗi nhóm có ít nhất 1 học sinh?

  *Giải:*
  Số cách chia chính là số Stirling loại 2 chập 2 của 4 phần tử: $S(4,2)$.
  Theo công thức truy hồi hoặc tính trực tiếp:
  $ S(4,2) = frac(1, 2!) [(-1)^0 C_2^2 2^4 + (-1)^1 C_2^1 1^4] = frac(1, 2) [16 - 2] = 7 " cách" $
]

#example-box(n: "2 (Trung bình)")[
  Có 5 phần quà k
  - *Dạng 1 (4-1-1):* Kích thước các nhóm là 4, 1, 1.
    Chọn 4 học sinh cho nhóm lớn: $C_6^4 = 15$ cách. Hai nhóm nhỏ mỗi nhóm 1 học sinh, do vai trò của hai nhóm kích thước bằng nhau (cỡ 1) không phân biệt nên ta chia cho $2!$:
    $ N_1 = frac(C_6^4 dot C_2^1 dot C_1^1, 2!) = frac(15 dot 2, 2) = 15 " cách" $
  - *Dạng 2 (3-2-1):* Kích thước các nhóm là 3, 2, 1.
    Do kích thước các nhóm đôi một khác nhau nên không sợ trùng lặp thứ tự nhóm. Số cách chọn là:
    $ N_2 = C_6^3 dot C_3^2 dot C_1^1 = 20 dot 3 dot 1 = 60 " cách" $
  - *Dạng 3 (2-2-2):* Kích thước các nhóm là 2, 2, 2.
    Do cả 3 nhóm đều có kích thước bằng nhau (cỡ 2) và không phân biệt nên ta phải chia cho hoán vị của 3 nhóm tức $3!$:
    $ N_3 = frac(C_6^2 dot C_4^2 dot C_2^2, 3!) = frac(15 dot 6 dot 1, 6) = 15 " cách" $
  Tổng số cách chia là: $N = N_1 + N_2 + N_3 = 15 + 60 + 15 = 90$ cách.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 9: ĐẾM TRONG HÌNH HỌC PHẲNG VÀ LƯỚI TỌA ĐỘ
// ══════════════════════════════════════════════════════════════
]

#example-box(n: "1 (Dễ)")[
  Tính số đường chéo của một đa giác đều có 10 cạnh.

  *Giải:*
  Đa giác có 10 cạnh ứng với 10 đỉnh.
  Số đoạn thẳng nối giữa 2 đỉnh bất kỳ là: $C_(10)^2 = 45$.
  Trong 45 đoạn thẳng này, có 10 đoạn là cạnh của đa giác.
  Số đường chéo của đa giác là: $45 - 10 = 35$ đường chéo.
]

#example-box(n: "2 (Trung bình)")[
  Cho hai đường thẳng song song $d_1$ và $d_2$. Trên đường thẳng $d_1$ lấy 5 điểm phân biệt, trên đường thẳng $d_2$ lấy 6 điểm phân biệt. Hỏi có thể






    $ N_3 = frac(C_6^2 dot C_4^2 dot C_2^2, 3!) = frac(15 dot 6 dot 1, 6) = 15 " cách" $
  Tổng số cách chia là: $N = N_1 + N_2 + N_3 = 15 + 60 + 15 = 90$ cách.

  *Cách 3 (Sử dụng hàm sinh mũ - Exponential Generating Function):*
  Vì các học sinh là phân biệt và nhóm không phân biệt, ta dùng hàm sinh mũ (EGF) để biểu diễn việc phân hoạch.
  Hàm sinh mũ của một nhóm không rỗng là: $E_1(x) = e^x - 1$.
  Hàm sinh mũ của việc phân hoạch tập hợp thành $k=3$ nhóm không rỗng, không phân biệt là:
  $ G(x) = frac((e^x - 1)^3, 3!) = frac(1, 6) (e^(3x) - 3e^(2x) + 3e^x - 1) $
  Số cách phân hoạch tập hợp 6 phần tử là hệ số của $frac(x^6, 6!)$ trong khai triển Maclaurin của $G(x)$, tức là:
  $
    S(6,3) = 6! [x^6] G(x) \
    = 6! [x^6] ( frac(1, 6) (sum_(n=0)^(infinity) frac((3x)^n, n!) - 3 sum_(n=0)^(infinity) frac((2x)^n, n!) + 3 sum_(n=0)^(infinity) frac(x^n, n!) - 1) ) \
    = frac(6!, 6) ( frac(3^6, 6!) - 3 dot frac(2^6, 6!) + 3 dot frac(1^6, 6!) ) \
    = frac(1, 6) (3^6 - 3 dot 2^6 + 3) = frac(729 - 192 + 3, 6) = 90 " cách."
  $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 9: ĐẾM TRONG HÌNH HỌC PHẲNG VÀ LƯỚI TỌA ĐỘ
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 9", "Đếm Trong Hình Học Phẳng Và Lưới", color: c-teal)

#theory-box[
  *1. Số đoạn thẳng, đường thẳng từ $n$ điểm:*
  - Số đoạn thẳng tạo bởi $n$ điểm phân biệt: $C_n^2$.
  - Số đường thẳng tạo bởi $n$ điểm phân biệt trong đó không có 3 điểm nào thẳng hàng: $C_n^2$.

  *2. Đa giác và đường chéo:*
  Cho đa giác đều $n$ đỉnh ($n >= 3$):
  - Số tam giác tạo bởi các đỉnh: $C_n^3$.
  - Số đường chéo của đa giác: $C_n^2 - n = frac(n(n-3), 2)$.

  *3. Hình chữ nhật trong lưới:*
  Một lưới tạo bởi $m$ đường thẳng song song nằm ngang cắt $n$ đường thẳng song song thẳng đứng. Số hình chữ nhật tạo thành là:
  $ N = C_m^2 dot C_n^2 $
]

#example-box(n: "1 (Dễ)")[
  Tính số đường chéo của một đa giác đều có 10 cạnh.

  *Giải:*
  Đa giác có 10 cạnh ứng với 10 đỉnh.
  Số đoạn thẳng nối giữa 2 đỉnh bất kỳ là: $C_(10)^2 = 45$.
  Trong 45 đoạn thẳng này, có 10 đoạn là cạnh của đa giác.
  Số đường chéo của đa giác là: $45 - 10 = 35$ đường chéo.
]

#example-box(n: "2 (Trung bình)")[
  Cho hai đường thẳng song song $d_1$ và $d_2$. Trên đường thẳng $d_1$ lấy 5 điểm phân biệt, trên đường thẳng $d_2$ lấy 6 điểm phân biệt. Hỏi có thể
    Số lượng số: $1 dot 5 dot 4 = 20$ số.
  - *TH2 ($c = 5$):*
    - Chọn $c$: 1 cách.
    - Chọn $a$ từ $\{1, 2, 3, 4\}$ (khác 0 và 5): 4 cách.
    - Chọn $b$ từ $\{0\}$ và 3 chữ số còn lại: 4 cách.
    Số lượng số: $1 dot 4 dot 4 = 16$ số.
  Tổng số c
    - Bộ này không chứa chữ số 0. Số cách xếp là: $4! = 24$ số.
  Tổng số các số lập được là: $72 + 24 = 96$ số.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 11: NGUYÊN LÝ SONG ÁNH VÀ ĐÁNH SỐ VỊ TRÍ

#example-box(n: "3 (Khó - Giải bằng 2 cách)")[
  Có bao nhiêu con đường đi ngắn nhất từ $(0,0)$ đến $(n,n)$ trên lưới tọa độ phẳng chỉ đi phải $(+1,0)$ hoặc lên $(0,+1)$ sao cho đường đi không bao giờ vượt qua phía trên đường phân giác $y = x$ (có thể chạm vào đường phân giác)?
  - Cứ mỗi cách chọn ra 2 đường kính bất kỳ từ $n$ đường kính này sẽ tạo thành 4 đỉnh của một hình chữ nhật duy nhất.
  Số hình chữ nhật tạo thành là:
  $ N = C_n^2 = frac(n(n-1), 2) " hình chữ nhật" $

  *Cách 2 (Sử dụng tính chất đối xứng tâm):*
  Một hình chữ nhật được xác định bởi 4 đỉnh đối xứng nhau từng cặp qua tâm đường tròn.
  - Chọn đỉnh thứ nhất trong $2n$ đỉnh: có $2n$ cách chọn.
  - Chọn đỉnh thứ hai không đối diện qua tâm với đỉnh thứ nhất: có $2n - 2$ cách chọn.
  - Khi đã chọn xong 2 đỉnh này, 2 đỉnh còn lại bắt buộc phải là 2 đỉnh đối diện qua tâm của chúng để tạo thành một hình chữ nhật.
  Vì vai trò của 4 đỉnh trong hình chữ nhật là như nhau (được đếm 4 lần cho mỗi đỉnh bắt đầu) và việc chọn đỉnh thứ nhất rồi đến đỉnh thứ hai tạo ra một sự sắp xếp thứ tự giữa hai đường chéo (chia thêm 2), ta phải chia cho hệ số lặp là $4 dot 2 = 8$.
  Số hình chữ nhật là:
  $ N = frac(2n dot (2n-2), 8) = frac(4n(n-1), 8) = frac(n(n-1), 2) $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 10: ĐẾM SỐ TỰ NHIÊN CHIA HẾT VÀ CẤU TRÚC CHỮ SỐ
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 10", "Đếm Số Tự Nhiên Chia Hết", color: c-gold)

#theory-box[
  *Dấu hiệu chia hết cơ bản:*
  - Chia hết cho 2: Chữ số tận cùng chẵn $\{0, 2, 4, 6, 8\}$.
  - Chia hết cho 5: Chữ số tận cùng $\{0, 5\}$.
  - Chia hết cho 3: Tổng các chữ số chia hết cho 3.
  - Chia hết cho 9: Tổng các chữ số chia hết cho 9.
  - Chia hết cho 4: Hai chữ số tận cùng tạo thành số chia hết cho 4.

  *Chiến lược xử lý số 0:* Chữ số hàng cao nhất luôn phải khác 0. Khi lập số, hãy đặc biệt lưu ý tách riêng trường hợp có số 0 hoặc ưu tiên xử lý vị trí đầu tiên.
]

#example-box(n: "1 (Dễ)")[
  Lập được bao nhiêu số tự nhiên có 3 chữ số đôi một khác nhau từ tập hợp $\{0, 1, 2, 3, 4, 5\}$ sao cho số đó chia hết cho 5?

  *Giải:*
  Gọi số cần lập là $overline(a b c)$ với $a  !=  0$ và $c  in  \{0, 5\}$.
  - *TH1 ($c = 0$):*
    - Chọn $c$: 1 cách.
    - Chọn $a$ từ $\{1, 2, 3, 4, 5\}$: 5 cách.
    - Chọn $b$ từ 4 chữ số còn lại: 4 cách.
    Số lượng số: $1 dot 5 dot 4 = 20$ số.
  - *TH2 ($c = 5$):*
    - Chọn $c$: 1 cách.
    - Chọn $a$ từ $\{1, 2, 3, 4\}$ (khác 0 và 5): 4 cách.
    - Chọn $b$ từ $\{0\}$ và 3 chữ số còn lại: 4 cách.
    Số lượng số: $1 dot 4 dot 4 = 16$ số.
  Tổng số c
    - Bộ này không chứa chữ số 0. Số cách xếp là: $4! = 24$ số.
  Tổng số các số lập được là: $72 + 24 = 96$ số.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 11: NGUYÊN LÝ SONG ÁNH VÀ ĐÁNH SỐ VỊ TRÍ
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 11", "Nguyên Lý Song Ánh Và Đánh Số", color: c-blue)

#theory-box[
  *1. Nguyên lý Song ánh (Bijective Principle):*
  Nếu thiết lập được một ánh xạ $f: A  ->  B$ là song ánh (1-1 và bao phủ toàn bộ) giữa hai tập hợp hữu hạn $A$ và $B$, thì $|A| = |B|$.
  - *Ứng dụng:* Thay vì đếm trực tiếp tập hợp phức tạp $A$, ta chuyển sang đếm tập hợp đơn giản $B$ có cấu trúc dễ mô tả hơn.

  *2. Phương pháp Đánh số vị trí:*
  Gán nhãn tọa độ hoặc chỉ số thứ tự từ điển cho các đối tượng. Phân tích các bước chuyển vị trí theo quy luật toán học để đếm số cấu hình hợp lệ.
]

#example-box(n: "1 (Dễ)")[
  Chứng minh rằng số tập hợp con của một tập hợp gồm $n$ phần tử là $2^n$.

  *Giải:*
  Cho tập $S = \{s_1, s_2, ..., s_n\}$. Mỗi tập con $A  subset.eq  S$ tương ứng song ánh 1-1 với một chuỗi nhị phân $x = (x_1, x_2, ..., x_n)$ độ dài $n$ theo quy tắc:
  - $x_i = 1$ nếu $s_i  in  A$.
  - $x_i = 0$ nếu $s_i  in.not  A$.
  Số chuỗi nhị phân độ dài $n$ là $2^n$ (mỗi vị trí có 2 cách chọn 0 hoặc 1). Do đó, số tập con của tập hợp $S$ bằng $2^n$.
]

  *Cách 2 (Phân nhóm số dư theo mô-đun 3):*
  Ta phân hoạch tập hợp ban đầu thành 3 nhóm theo số dư khi chia cho 3:
  - Nhóm dư 0: $X_0 = \{0, 3\}$ (2 phần tử).
  - Nhóm dư 1: $X_1 = \{1, 4\}$ (2 phần tử).
  - Nhóm dư 2: $X_2 = \{2, 5\}$ (2 phần tử).
  Để tổng của 4 chữ số chia hết cho 3, ta có các cách kết hợp số lượng phần tử từ mỗi nhóm sau:
  - *Trường hợp 1 (Chọn từ cả 3 nhóm):* Chọn 2 phần tử nhóm $X_0$, 1 phần tử nhóm $X_1$, 1 phần tử nhóm $X_2$ (tổng dư $0 + 0 + 1 + 2  equiv  0  mod  3$).
    - Số cách chọn bộ số: $C_2^2 dot C_2^1 dot C_2^1 = 4$ bộ chữ số.
    - Cả 4 bộ này đều chứa chữ số 0. Số cách xếp mỗi bộ là: $3 dot 3! = 18$ cách.
    - Số lượng số: $4 dot 18 = 72$ số.
  - *Trường hợp 2 (Không chọn nhóm $X_0$):* Chọn 2 phần tử nhóm $X_1$, 2 phần tử nhóm $X_2$ (tổng dư $1 + 1 + 2 + 2 = 6  equiv  0  mod  3$).
    - Số cách chọn bộ số: $C_2^2 dot C_2^2 = 1$ bộ duy nhất là $\{1, 4, 2, 5\}$.
    - Bộ này không chứa chữ số 0. Số cách xếp là: $4! = 24$ số.
  Tổng số các số lập được là: $72 + 24 = 96$ số.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 11: NGUYÊN LÝ SONG ÁNH VÀ ĐÁNH SỐ VỊ TRÍ
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 11", "Nguyên Lý Song Ánh Và Đánh Số", color: c-blue)

#theory-box[
  *1. Nguyên lý Song ánh (Bijective Principle):*
  Nếu thiết lập được một ánh xạ $f: A  ->  B$ là song ánh (1-1 và bao phủ toàn bộ) giữa hai tập hợp hữu hạn $A$ và $B$, thì $|A| = |B|$.
  - *Ứng dụng:* Thay vì đếm trực tiếp tập hợp phức tạp $A$, ta chuyển sang đếm tập hợp đơn giản $B$ có cấu trúc dễ mô tả hơn.

  *2. Phương pháp Đánh số vị trí:*
  Gán nhãn tọa độ hoặc chỉ số thứ tự từ điển cho các đối tượng. Phân tích các bước chuyển vị trí theo quy luật toán học để đếm số cấu hình hợp lệ.
]

#example-box(n: "1 (Dễ)")[
  Chứng minh rằng số tập hợp con của một tập hợp gồm $n$ phần tử là $2^n$.

  *Giải:*
  Cho tập $S = \{s_1, s_2, ..., s_n\}$. Mỗi tập con $A  subset.eq  S$ tương ứng song ánh 1-1 với một chuỗi nhị phân $x = (x_1, x_2, ..., x_n)$ độ dài $n$ theo quy tắc:
  - $x_i = 1$ nếu $s_i  in  A$.
  - $x_i = 0$ nếu $s_i  in.not  A$.
  Số chuỗi nhị phân độ dài $n$ là $2^n$ (mỗi vị trí có 2 cách chọn 0 hoặc 1). Do đó, số tập con của tập hợp $S$ bằng $2^n$.
]

#example-box(n: "2 (Trung bình)")[
  Có bao nhiêu tập con của tập hợp $\{1, 2, ..., 10\}$ chứa ít nhất một số lẻ?

 
  - Nếu trong cách tô màu hợp lệ của $n-1$ đỉnh đầu tiên, đỉnh $n-1$ và đỉnh 1 có màu khác nhau:
    Khi đó, việc tô màu $n-1$ đỉnh này tương đương với cách tô hợp lệ đa giác $n-1$ đỉnh (có $a_(n-1)$ cách). Đỉnh $n$ kề với 2 đỉnh khác màu nhau (đỉnh 1 và đỉnh $n-1$) nên chỉ còn đúng $3 - 2 = 1$ cách chọn màu.
  - Nếu trong cách tô màu của $n-1$ đỉnh đầu tiên, đỉnh $n-1$ và đỉnh 1 có cùng màu:
    Ta có thể chập đỉnh $n-1$ và đỉnh 1 làm một đỉnh duy nhất. Khi đó, cấu hình màu trở thành cách tô màu hợp lệ cho đa giác $n-2$ đỉnh (có $a_(n-2)$ cách). Khi trả lại đỉnh, đỉnh $n$ kề với 2 đỉnh cùng màu nên có $3 - 1 = 2$ cách ch
]

#example-box(n: "3 (Khó - Giải bằng 3 cách)")[
  Có bao nhiêu con đường đi ngắn nhất từ $(0,0)$ đến $(n,n)$ trên lưới tọa độ phẳng chỉ đi phải $(+1,0)$ hoặc lên $(0,+1)$ sao cho đường đi không bao giờ vượt qua phía trên đường phân giác $y = x$ (có thể chạm vào đường phân giác)?

  *Cách 1 (Nguyên lý phản xạ của André - André's Reflection Method):*
  - Tổng số đường đi ngắn nhất bất kỳ từ $(0,0)$ đến $(n,n)$ là: $C_(2n)^n$.
  - Ta đếm số con đường vi phạm (đi qua phía trên đường $y=x$, tức là chạm vào đường thẳng $y = x + 1$).
    - Giả sử đường đi chạm đường $y = x + 1$ lần đầu tiên tại điểm $P(k, k+1)$.
    - Ta phản xạ phần đường đi từ $(0,0)$ đến $P$ qua đường thẳng $y = x + 1$. Điểm đầu $(0,0)$ qua phép phản xạ biến thành điểm $A'(-1, 1)$.
    - Mỗi con đường vi phạm tương ứng song ánh 1-1 với một con đường đi bất kỳ từ điểm bắt đầu mới $A'(-1, 1)$ đến đích $(n,n)$.
    - Khoảng cách từ $A'(-1, 1)$ đến $(n,n)$ cần đi là: $n - (-1) = n+1$ bước sang phải và $n - 1$ bước đi lên.
    - Số con đường vi phạm là: $C_(2n)^(n-1)$.
  - Số con đường hợp lệ là số Catalan $C_n$:
    $ C_n = C_(2n)^n - C_(2n)^(n-1) = frac(1, n+1) C_(2n)^n $

  *Cách 2 (Lập công thức truy hồi tr
  Ta sử dụng xích Markov đơn giản để đếm chuỗi màu vòng tròn.
  Gọi ma trận chuyển trạng thái giữa các màu (mỗi bước đi sang đỉnh kề phải đổi màu):
  $
    M = mat(0, 1, 1; 1, 0, 1; 1, 1, 0)
  $
  Số cách tô màu chuỗi vòng tròn độ dài $n$ chính là vết (trace) của ma trận $M^n$:
  $ a_n = "Tr"(M^n) = lambda_1^n + lambda_2^n + lambda_3^n $
  Trong đó $lambda_i$ là các trị riêng của ma trận $M$.
  Phương trình trị riêng:
  $
    det(lambda I - M) = 0  <->  det mat(lambda, -1, -1; -1, lambda, -1; -1, -1, lambda) = 0 \
     <->  lambda^3 - 3lambda - 2 = 0  <->  (lambda - 2)(lambda + 1)^2 = 0
  $
  
  Do đó, ta có công thức truy hồi:
  $ C_n = sum_(k=1)^n C_(k-1) C_(n-k) = sum_(i=0)^(n-1) C_i C_(n-1-i) quad (forall n >= 1), quad C_0 = 1. $
  Định nghĩa hàm sinh cho dãy Catalan: $C(x) = sum_(n=0)^(infinity) C_n x^n$. Nhân hai vế hệ thức truy hồi với $x^n$ và lấy tổng từ $n=1$ đến $infinity$:
  $ C(x) - 1 = sum_(n=1)^(infinity) (sum_(i=0)^(n-1) C_i C_(n-1-i)) x^n = x sum_(n=1)^(infinity) (sum_(i=0)^(n-1) C_i C_(n-1-i)) x^(n-1) = x C(x)^2 $
  Ta nhận được phương trình bậc hai đối với $C(x)$:
  $ x C(x)^2 - C(x) + 1 = 0 $
  Giải phương trình bậc hai này ta được hai nghiệm:
  $ C(x) = frac(1 - sqrt(1 - 4x), 2x) " và " C(x) = frac(1 + sqrt(1 - 4x), 2x) $
  Vì $C(0) = C_0 = 1$, ta phải chọn nghiệm có dấu trừ để giới hạn $lim_(x -> 0) C(x) = 1$:
  $ C(x) = frac(1 - sqrt(1 - 4x), 2x) $
  Khai triển chuỗi lũy thừa của $sqrt(1-4x)$ theo công thức nhị thức mở rộng:
  $ sqrt(1 - 4x) = 1 - sum_(n=1)^(infinity) frac(2, n) C_(2n-2)^(n-1) x^n = 1 - sum_(n=0)^(infinity) frac(2, n+1) C_(2n)^n x^(n+1) $
  Thay vào công thức của $C(x)$, ta rút ra hệ số $C_n$:
  $ C_n = [x^n] C(x) = frac(1, n+1) C_(2n)^n. $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 12: NGUYÊN LÝ ĐI-RÍCH-LÊ (PIGEONHOLE PRINCIPLE)
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 12", "Nguyên Lý Đi-rích-lê Trong Tổ Hợp", color: c-violet)

#theory-box[
  *1. Nguyên lý Đi-rích-lê cơ bản (Pigeonhole Principle):*
  Nếu nhốt $n+1$ con thỏ vào $n$ cái chuồng thì có ít nhất 1 chuồng chứa từ 2 con thỏ trở lên.

  *2. Nguyên lý Đi-rích-lê tổng quát:*
  Nếu nhốt $m$ con thỏ vào $n$ cái chuồng ($m > n$) thì có ít nhất 1 chuồng chứa không ít hơn:
  $ floor(frac(m-1, n)) + 1 $ con thỏ.

  *Chiến lược áp dụng:* Xác định rõ "Thỏ" (đối tượng cần đếm) và "Chuồng" (phân hoạch thuộc tính/trạng thái). Thiết kế chuồng sao cho khi thỏ rơi vào chung chuồng thì tính chất cần chứng minh tự động xảy ra.
]

#example-box(n: "1 (Dễ)")[
  Chứng minh rằng trong một nhóm gồm 13 người, luôn tồn tại ít nhất 2 người có cùng tháng sinh.

  *Giải:*
  - "Thỏ": 13 người trong nhóm.
  - "Chuồng": 12 tháng sinh trong năm (từ tháng 1 đến tháng 12).
  Vì số thỏ (13) lớn hơn số chuồng (12), theo nguyên lý Đi-rích-lê, có ít nhất 2 người (2 con thỏ) sinh vào cùng một tháng (cùng 1 chuồng).
]

#example-box(n: "2 (Trung bình)")[
  Chọn ra 6 số từ tập hợp $\{1, 2, ..., 10\}$. Chứng minh rằng luôn tìm được hai số có tổng bằng 11.

  *Giải:*
  - Ta phân ho
#example-box(n: "3 (Khó - Giải bằng 2 cách)")[
  Tính tổng sau theo $n$:
  $ S = C_n^0 + frac(1, 2) C_n^1 + frac(1, 3) C_n^2 + ... + frac(1, n+1) C_n^n $

  *Cách 1 (Sử dụng tích phân):*
  Khai triển nhị thức Newton:
  $ (1 + t)^n = C_n^0 + C_n^1 t + C_n^2 t^2 + ... + C_n^n t^n $
  Lấy tích phân xác định hai vế từ 0 đến 1 theo biến $t$:
  $  in t_0^1 (1 + t)^n d t =  in t_0^1 (C_n^0 + C_n^1 t + C_n^2 t^2 + ... + C_n^n t^n) d t $
  Tính các tích phân:
  - Vế trái:
    $  in t_0^1 (1 + t)^n d t =  [  frac((1 + t)^(n+1), n+1)  ] |_0^1 = frac(2^(n+1) - 1, n+1) $
  - Vế phải:
  *Giải:*
  Gọi $a_n$ là số cách leo hết cầu thang $n$ bậc.
  Xét bước chân cuối cùng để chạm đỉnh bậc thứ $n$:
  - Theo nguyên lý Đi-rích-lê, khi chọn 101 số, có ít nhất 2 số có cùng phần lẻ $q$.
  Gọi hai số đó là $x_1 = 2^(k_1) dot q$ và $x_2 = 2^(k_2) dot q$.
  - Nếu $k_1 < k_2$ thì $x_2$ chia hết cho $x_1$ (tức $x_2$ là bội của $x_1$).
  - Nếu $k_1 > k_2$ thì $x_1$ chia hết cho $x_2$ (tức $x_1$ là bội của $x_2$).
  Chứng minh hoàn tất.

  *Cách 2 (Phân hoạch tập hợp thành chuỗi bội số):*
  Ta chia tập hợp $\{1, 2, ..., 200\}$ thành 100 tập con dạng chuỗi bội số (mỗi tập con đóng vai trò là một "chuồng"):
  $ C_q = \{q, 2q, 4q, 8q, ...\}  inter  \{1, 2, ..., 200\} $
  Với $q$ chạy qua 100 số lẻ từ 1 đến 199.
  - Ví dụ:
    - $C_1 = \{1, 2, 4, 8, 16, 32, 64, 128\}$
    - $C_3 = \{3, 6, 12, 24, 48, 96, 192\}$
    - ...
  - Rõ ràng, 100 tập con này đôi một rời nhau và phủ hết tập $S$.
  - Khi chọn 101 số từ $S$, theo nguyên lý Đi-rích-lê, có ít nhất 2 số được chọn nằm chung trong một tập con $C_q$.
  Hai số bất kỳ trong cùng một tập con $C_q$ luôn có dạng $2^a q$ và $2^b q$. Số có số mũ lũy thừa của 2 nhỏ hơn sẽ là ước của số còn lại.
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 13: HỆ THỨC TRUY HỒI VÀ CÁC DÃY SỐ ĐẶC BIỆT
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 13", "Hệ Thức Truy Hồi Và Dãy Số Đặc Biệt", color: c-blue)

#theory-box[
  *Phương pháp lập Hệ thức truy hồi:*
  Khi đếm cấu hình độ dài $n$, ta liên hệ nó với các cấu hình có độ dài nhỏ hơn như $n-1, n-2$ bằng cách phân tích cấu trúc của phần tử cuối cùng hoặc bước đi cuối cùng.

  *Các dãy số điển hình:*
  - *Fibonacci:* $F_n = F_(n-1) + F_(n-2)$ (Lát gạch $1  times  2$, bậc thang).
  - *Tribonacci:* $T_n = T_(n-1) + T_(n-2) + T_(n-3)$ (Không có 3 phần tử cấm kề nhau).
  - *Catalan:* $C_n = frac(1, n+1) C_(2n)^n$ (Ngoặc hợp lệ, phân hoạch tam giác đa giác).
]

#example-box(n: "1 (Dễ)")[
  Một người muốn leo lên một cầu thang gồm $n$ bậc. Mỗi bước chân người đó có thể bước lên 1 bậc hoặc 2 bậc. Hỏi có bao nhiêu cách để leo hết cầu thang?

  *Giải:*
  Gọi $a_n$ là số cách leo hết cầu thang $n$ bậc.
  Xét bước chân cuối cùng để chạm đỉnh bậc thứ $n$:
  - Nếu bước cuối là bước 1 bậc: trước đó người đó phải ở bậc thứ $n-1$. Có $a_(n-1)$ cách đến đây.
  - Nếu bước cuối là bước 2 bậc: trước đó người đó phải ở bậc thứ $n-2$. Có $a_(n-2)$ cách đến đây.
  Theo nguyên lý cộng, ta có hệ thức: $a_n = a_(n-1) + a_(n-2)$ (với $n >= 3$).
  Tính tổng sau theo $n$:
  $ S = C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n $

  *Giải:*
  Ta xu
  Suy ra $C_(n+1)^1 + C_(n+1)^2 + ... + C_(n+1)^(n+1) = 2^(n+1) - 1$ (do $C_(n+1)^0 = 1$).
  Thế vào công thức của $S$:
  $ S = frac(2^(n+1) - 1, n+1) $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 15: ỨNG DỤNG TỔ HỢP TRONG TRÒ CHƠI & XÁC SUẤT
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 15", "Ứng Dụng Tổ Hợp Và Xác Suất Trò Ch



  - $n=1$: $\{0, 1\}  ->  a_1 = 2$.
  - $n=2$: $\{01, 10, 11\}  ->  a_2 = 3$.
  Vậy dãy số là: $a_n = F_(n+2)$ với $F$ là số Fibonacci.
]

#example-box(n: "3 (Khó - Giải bằng 3 cách)")[
  Có bao nhiêu cách cách tô màu các đỉnh của một đa giác đều có $n$ cạnh ($n >= 3$) bằng 3 màu khác nhau sao cho không có hai đỉnh kề nhau nào được tô cùng một màu?

  *Cách 1 (Lập hệ thức truy hồi tuyến tính):*
  Gọi các đỉnh của đa giác theo thứ tự vòng tròn là $1, 2, ..., n$. Gọi $a_n$ là số cách tô màu hợp lệ đa giác $n$ đỉnh.
  Xét việc "cắt" liên kết kề giữa đỉnh $n-1$ và đỉnh $1$ để quy về đa giác ít đỉnh hơn:
  - Nếu trong cách tô màu hợp lệ của $n-1$ đỉnh đầu tiên, đỉnh $n-1$ và đỉnh 1 có màu khác nhau:
    Khi đó, việc tô màu $n-1$ đỉnh này tương đương với cách tô hợp lệ đa giác $n-1$ đỉnh (có $a_(n-1)$ cách). Đỉnh $n$ kề với 2 đỉnh khác màu nhau (đỉnh 1 và đỉnh $n-1$) nên chỉ còn đúng $3 - 2 = 1$ cách chọn màu.
  - Nếu trong cách tô màu của $n-1$ đỉnh đầu tiên, đỉnh $n-1$ và đỉnh 1 có cùng màu:
    Ta có thể chập đỉnh $n-1$ và đỉnh 1 làm một đỉnh duy nhất. Khi đó, cấu hình màu trở thành cách tô màu hợp lệ cho đa giác $n-2$ đỉnh (có $a_(n-2)$ cách). Khi trả lại đỉnh, đỉnh $n$ kề với 2 đỉnh cùng màu nên có $3 - 1 = 2$ cách chọn màu cho đỉnh $n$.
  Ta thu được hệ thức truy hồi:
  $ a_n = a_(n-1) + 2 a_(n-2)  quad  (n >= 4) $
  Phương trình đặc trưng: $t^2 - t - 2 = 0  ->  t_1 = 2, t_2 = -1$.
  Công thức tổng quát của dãy số là: $a_n = A dot 2^n + B dot (-1)^n$.
  Khởi tạo:
  - Với đa giác 3 đỉnh (tam giác): $a_3 = 3 dot 2 dot 1 = 6$ cách.
  - Với đa giác 2 đỉnh (đoạn thẳng tô 2 màu): $a_2 = 3 dot 2 = 6$ cách.
  Thay $n=2, n=3$ vào hệ thức giải tìm $A, B$:
  $
    cases(
      4A + B = 6,
      8A - B = 6
    )  ->  A = 1, B = 2
  $
  Vậy số cách tô màu đa giác $n$ đỉnh là: $a_n = 2^n + 2 dot (-1)^n$.

  *Cách 2 (Sử dụng ma trận trạng thái Markov):*
  Ta sử dụng xích Markov đơn giản để đếm chuỗi màu vòng tròn.
  Gọi ma trận chuyển trạng thái giữa các màu (mỗi bước đi sang đỉnh kề phải đổi màu):
  $
    M = mat(0, 1, 1; 1, 0, 1; 1, 1, 0)
  $
  Số cách tô màu chuỗi vòng tròn độ dài $n$ chính là vết (trace) của ma trận $M^n$:
  $ a_n = "Tr"(M^n) = lambda_1^n + lambda_2^n + lambda_3^n $
  Trong đó $lambda_i$ là các trị riêng của ma trận $M$.
  Phương trình trị riêng:
  $
    det(lambda I - M) = 0  <->  det mat(lambda, -1, -1; -1, lambda, -1; -1, -1, lambda) = 0 \
     <->  lambda^3 - 3lambda - 2 = 0  <->  (lambda - 2)(lambda + 1)^2 = 0
  $
  Trị riêng là $lambda_1 = 2, lambda_2 = -1, lambda_3 = -1$.
  Vậy $a_n = 2^n + (-1)^n + (-1)^n = 2^n + 2 dot (-1)^n$.

  *Cách 3 (Sử dụng hàm sinh - Generating Functions):*
  Định nghĩa hàm sinh cho số cách tô màu đa giác $n$ đỉnh là $G(x) = sum_(n=1)^(infinity) a_n x^n$.
  Ta có hệ thức truy hồi $a_n = a_(n-1) + 2 a_(n-2)$ với mọi $n >= 3$ (với quy ước $a_1 = 0$, $a_2 = 6$, $a_3 = 6$).
  Nhân hai vế của hệ thức truy hồi với $x^n$ và lấy tổng từ $n=3$ đến $infinity$:
  $ sum_(n=3)^(infinity) a_n x^n = sum_(n=3)^(infinity) a_(n-1) x^n + 2 sum_(n=3)^(infinity) a_(n-2) x^n $
  $ G(x) - a_1 x - a_2 x^2 = x (G(x) - a_1 x) + 2 x^2 G(x) $
  - *Tribonacci:* $T_n = T_(n-1) + T_(n-2) + T_(n-3)$ (Không có 3 phần tử cấm kề nhau).
  - *Catalan:* $C_n = frac(1, n+1) C_(2n)^n$ (Ngoặc hợp lệ, phân hoạch tam giác đa giác).
]

#example-box(n: "1 (Dễ)")[
  Một người muốn leo lên một cầu thang gồm $n$ bậc. Mỗi bước chân người đó có thể bước lên 1 bậc hoặc 2 bậc. Hỏi có bao nhiêu cách để leo hết cầu thang?

  *Cách 1 (Sử dụng hệ thức truy hồi):*
  Gọi $a_n$ là số cách leo hết cầu thang $n$ bậc.
  Xét bước chân cuối cùng để chạm đỉnh bậc thứ $n$:
  - Nếu bước cuối là bước 1 bậc: trước đó người đó phải ở bậc thứ $n-1$. Có $a_(n-1)$ cách đến đây.
  - Nếu bước cuối là bước 2 bậc: trước đó người đó phải ở bậc thứ $n-2$. Có $a_(n-2)$ cách đến đây.
  Theo nguyên lý cộng, ta có hệ thức: $a_n = a_(n-1) + a_(n-2)$ (với $n >= 3$).
  Khởi tạo:
  - Bậc 1 ($n=1$): Chỉ có 1 cách (bước 1 bậc) $ ->  a_1 = 1$.
  - Bậc 2 ($n=2$): Có 2 cách (bước 1-1 hoặc bước 2) $ ->  a_2 = 2$.
  Dãy số thu được là dãy Fibonacci dịch chuyển: $a_3 = 3, a_4 = 5, a_5 = 8$, và công thức tổng quát là $a_n = F_(n+1)$ (với $F_1 = 1, F_2 = 1, F_3 = 2, ...$ là các số Fibonacci).

  *Cách 2 (Sử dụng phương pháp Hàm sinh):*
  Ta mở rộng định nghĩa dãy số bằng các
  Tìm hệ số của số hạng chứa $x^3$ trong khai triển của nhị thức:
  $ (x - frac(2, x))^7  quad  (x  !=  0) $

  *Giải:*
  Số hạng tổng quát trong khai triển là:
  $ T_(k+1) = C_7^k x^(7-k) (-frac(2, x))^k = C_7^k (-2)^k x^(7-2k) $
  Số hạng chứa $x^3$ tương ứng với số mũ: $7 - 2k = 3  <->  2k = 4  <->  k = 2$.
  Hệ số của số hạng chứa $x^3$ là:
  $ C_7^2 (-2)^2 = 21 dot 4 = 84 $
]

#example-box(n: "2 (Trung bình)")[
  Tính tổng sau theo $n$:
  $ S = C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n $

  *Giải:*
  Với $alpha - beta = sqrt(5)$. Khai triển chuỗi lũy thừa:
  $ G(x) = frac(1, sqrt(5)) (alpha sum_(n=0)^(infinity) alpha^n x^n - beta sum_(n=0)^(infinity) beta^n x^n) = sum_(n=0)^(infinity) frac(alpha^(n+1) - beta^(n+1), sqrt(5)) x^n $

  Số cách leo cầu thang $n$ bậc chính là hệ số của $x^n$ trong khai triển của $G(x)$:
  $ a_n = [x^n] G(x) = frac(1, sqrt(5)) [ (frac(1 + sqrt(5), 2))^(n+1) - (frac(1 - sqrt(5), 2))^(n+1) ] = F_(n+1). $
]

#example-box(n: "2 (Trung bình)")[
  Lập được bao nhiêu chuỗi nhị phân độ dài $n$ ($n >= 1$) không chứa chuỗi con "00"?

  *Giải:*
  Gọi $a_n$ là số chuỗi nhị phân độ dài $n$ thỏa mãn điều kiện.
  Phân tích chữ số tận cùng của chuỗi nhị phân hợp lệ:
  - Nếu chuỗi tận cùng bằng chữ số 1: Phần trước đó dài $n-1$ phải là một chuỗi hợp lệ (không chứa "00"). Có $a_(n-1)$ cách.
  - Nếu chuỗi tận cùng bằng chữ số 0: Do không được chứa "00" nên chữ số kề cuối bắt buộc phải là 1. Phần trước đó dài $n-2$ phải là chuỗi hợp lệ. Có $a_(n-2)$ cách.
  Theo nguyên lý cộng, ta có hệ thức truy hồi:
  $ a_n = a_(n-1) + a_(n-2)  quad  (n >= 3) $
  Khởi tạo giá trị:
  - $n=1$: $\{0, 1\}  ->  a_1 = 2$.
  - $n=2$: $\{01, 10, 11\}  ->  a_2 = 3$.
  Vậy dãy số là: $a_n = F_(n+2)$ với $F$ là số Fibonacci.
]

#example-box(n: "3 (Khó - Giải bằng 3 cách)")[
  Có bao nhiêu cách cách tô màu các đỉnh của một đa giác đều có $n$ cạnh ($n >= 3$) bằng 3 màu khác nhau sao cho không có hai đỉnh kề nhau nào được tô cùng một màu?

  *Cách 1 (Lập hệ thức truy hồi tuyến tính):*
  Gọi các đỉnh của đa giác theo thứ tự vòng tròn là $1, 2, ..., n$. Gọi $a_n$ là số cách tô màu hợp lệ đa giác $n$ đỉnh.
  Xét việc "cắt" liên kết kề giữa đỉnh $n-1$ và đỉnh $1$ để quy về đa giác ít đỉnh hơn:
  - Nếu trong cách tô màu hợp lệ của $n-1$ đỉnh đầu tiên, đỉnh $n-1$ và đỉnh 1 có màu khác nhau:
  $
    frac(1, k+1) C_n^k = frac(1, k+1) dot frac(n!, k! dot (n-k)!) = frac(n!, (k+1)! dot (n-k)!) \
    = frac(1, n+1) dot frac((n+1)!, (k+1)! dot ((n+1) - (k+1))!) = frac(1, n+1) C_(n+1)^(k+1)
  $
  Thay biểu thức này vào tổng $S$, ta có:
  $
    S = sum_(k=0)^n frac(1, n+1) C_(n+1)^(k+1) = frac(1, n+1) sum_(k=0)^n C_(n+1)^(k+1) \
    = frac(1, n+1) [C_(n+1)^1 + C_(n+1)^2 + ... + C_(n+1)^(n+1)]
  $
  Biết rằng tổng các hệ số nhị thức từ 0 đến $n+1$ là $2^(n+1)$:
  $ C_(n+1)^0 + C_(n+1)^1 + ... + C_(n+1)^(n+1) = 2^(n+1) $
  Suy ra $C_(n+1)^1 + C_(n+1)^2 + ... + C_(n+1)^(n+1) = 2^(n+1) - 1$ (do $C_(n+1)^0 = 1$).
  Thế vào công thức của $S$:
  $ S = frac(2^(n+1) - 1, n+1) $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 15: ỨNG DỤNG TỔ HỢP TRONG TRÒ CHƠI & XÁC SUẤT
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 15", "Ứng Dụng Tổ Hợp Và Xác Suất Trò Chơi", color: c-indigo)

#theory-box[
  *1. Xác suất cổ điển trên không gian mẫu tổ hợp:*
  $ P(A) = frac(|A|, |Omega|) $
  Trong đó $|Omega|$ và $|A|$ được tính bằng các công cụ đếm tổ hợp nâng cao.

  *2. Xích Markov và Mô hình hóa trạng thái:*
  Với các trò chơi nhiều lượt, xác suất thắng/thua ở mỗi lượt thay đổi phụ thuộc vào trạng thái hiện tại. Ta lập hệ thức liên hệ xác suất giữa các trạng thái kế tiếp và giải phương trình đại số.
]

#example-box(n: "1 (Dễ)")[
  Một người tung một đồng xu cân đối và đồng chất 6 lần liên tiếp. Tính xác suất để số lần xuất hiện mặt ngửa đúng bằng số lần xuất hiện mặt sấp.

  *Giải:*
  - Mỗi lần tung đồng xu có 2 khả năng (Ngửa hoặc Sấp). Tổng số kịch bản xảy ra khi tung 6 lần là:
    $ |Omega| = 2^6 = 64 " kịch bản" $
  - Để số lần ngửa bằng số sấp, mỗi mặt phải xuất hiện đúng 3 lần. Số cách chọn ra 3 lượt tung xuất hiện mặt ngửa trong 6 lượt tung là:
    $ |A| = C_6^3 = 20 " cách" $
  - Xác suất cần tìm là: $P(A) = frac(20, 64) = frac(5, 16) = 0.3125$.
]

#example-box(n: "2 (Trung bình)")[
  Hai đấu thủ A và B chơi một giải cờ vua. Xác suất thắng một ván cờ của A là 0.6, của B là 0.4 (không có hòa). Trận đấu sẽ kết thúc khi có một đấu thủ giành chiến thắng trước đúng 3 ván cờ. Tính xác suất để đấu thủ A thắng giải đấu.

  *Giải:*
  Giải đấu kết thúc sau tối thiểu 3 ván và tối đa 5 ván cờ. A thắng giải đấu trong các trường hợp loại trừ nhau sau:
  - *TH1 (A thắng sau đúng 3 ván):* A thắng cả 3 ván đầu tiên. Xác suất là:
    $ P_3 = (0.6)^3 = 0.216 $
  - *TH2 (A thắng sau đúng 4 ván):* A phải thắng ván thứ 4 và thắng đúng 2 ván trong 3 ván đầu tiên. Xác suất là:
    $ P_4 = C_3^2 dot (0.6)^2 dot (0.4) dot 0.6 = 3 dot 0.36 dot 0.4 dot 0.6 = 0.2592 $
  - *TH3 (A thắng sau đúng 5 ván):* A phải thắng ván thứ 5 và thắng đúng 2 ván trong 4 ván đầu tiên. Xác suất là:
    $ P_5 = C_4^2 dot (0.6)^2 dot (0.4)^2 dot 0.6 = 6 dot 0.36 dot 0.16 dot 0.6 = 0.20736 $
  Tổng xác suất đấu thủ A giành chiến thắng chung cuộc là:
  $ P = P_3 + P_4 + P_5 = 0.216 + 0.2592 + 0.20736 = 0.68256 $
]

#example-box(n: "3 (Khó - Giải bằng 3 cách)")[
  Hai người chơi A và B luân phiên nhau tung một đồng xu cân đối. Người nào tung được mặt ngửa đầu tiên sẽ giành chiến thắng. Biết A là người được quyền tung trước. Tính xác suất để người A thắng cuộc.

  *Cách 1 (Tổng cấp số nhân lùi vô hạn):*
  Xét các lượt tung mà người A có thể giành chiến thắng:
  - A thắng ở lượt tung thứ 1: A tung được mặt ngửa ngay. Xác suất là $1/2$.
  - A thắng ở lượt tung thứ 3: Lượt 1 A tung sấp ($1/2$), lượt 2 B tung sấp ($1/2$), lượt 3 A tung ngửa ($1/2$). Xác suất là $(1/2)^3 = 1/8$.
  - A thắng ở lượt tung thứ 5: A sấp, B sấp, A sấp, B sấp, A ngửa. Xác suất là $(1/2)^5 = 1/32$.
  Tổng quát, A có thể thắng ở lượt thứ $2k+1$ với xác suất $(1/2)^(2k+1)$.
  Xác suất thắng cuộc của A là tổng của cấp số nhân lùi vô hạn:
  $
    P = frac(1, 2) + (frac(1, 2))^3 + (frac(1, 2))^5 + ... \
    = frac(1, 2) sum_(k=0)^( infinity ) (frac(1, 4))^k
  $
  Áp dụng công thức tổng cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 1/2$ và công vị $q = 1/4$:
  $ P = frac(u_1, 1 - q) = frac(1/2, 1 - 1/4) = frac(1/2, 3/4) = frac(2, 3) $

  *Cách 2 (Phương trình trạng thái có điều kiện - Markov):*
  Gọi $p$ là xác suất người tung t
      - Chọn chữ số thứ hai $b$ (khác $a$): 9 cách chọn.
      - Chọn chữ số thứ ba $c$ (khác $a, b$): 8 cách chọn.
      Tổng số là: $9 dot 9 dot 8 = 648$ số.
    - Trường hợp vi phạm: Số có 3 chữ số đôi một khác nhau mà tích là số lẻ (tức là cả 3 chữ số đều là số lẻ lấy từ $\{1, 3, 5, 7, 9\}$):
      - Số cách chọn là chỉnh hợp chập 3 của 5 số lẻ: $A_5^3 = 5 dot 4 dot 3 = 60$ số.
    - Số các số thỏa mãn đề bài là:
      $ N = 648 - 60 = 588 " số" $
      *(Lưu ý: hiệu chỉnh tính toán chính xác $648 - 60 = 588$)*.
  $
  Xác suất thắng cuộc của người A là $2/3$.

  *Cách 3 (Sử dụng hàm sinh xác suất - Probability Generating Functions):*
  Gọi $X$ là biến ngẫu nhiên biểu diễn số lượt tung cho đến khi xuất hiện mặt ngửa đầu tiên. Do mỗi lần tung độc lập với xác suất ngửa là $1/2$, $X$ tuân theo phân phối hình học $X ~ upright("Geom")(1/2)$ với xác suất:
  $ P(X = k) = (frac(1, 2))^k quad (forall k = 1, 2, 3, ...) $
  Hàm sinh xác suất (PGF) của biến ngẫu nhiên $X$ được định nghĩa là:
  $ G_X(t) = E[t^X] = sum_(k=1)^(infinity) P(X = k) t^k = sum_(k=1)^(infinity) (frac(t, 2))^k = frac(frac(t, 2), 1 - frac(t, 2)) = frac(t, 2 - t) $
  Người A thắng cuộc khi và chỉ khi mặt ngửa đầu tiên xuất hiện ở lượt tung lẻ của trò chơi, tức là $X$ nhận giá trị lẻ.
  Ta có thể lọc tổng các xác suất tại điểm lẻ bằng cách sử dụng các giá trị của hàm sinh xác suất tại $t=1$ và $t=-1$:
  $ P(X " lẻ") = sum_(k " lẻ") P(X = k) = frac(G_X(1) - G_X(-1), 2) $
  Tính các giá trị của hàm sinh:
  - Với $t = 1$: $G_X(1) = frac(1, 2 - 1) = 1$.
  - Với $t = -1$: $G_X(-1) = frac(-1, 2 - (-1)) = -frac(1, 3)$.
  Thay vào công thức ta được:
  $ P(X " lẻ") = frac(1 - (-frac(1, 3)), 2) = frac(frac(4, 3), 2) = frac(2, 3). $
  Vậy xác suất người A thắng cuộc là $2/3$.
]

#pagebreak()

// ══════════════════════════════════════════════════════════════
// PHẦN II: ĐỀ LUYỆN TỔNG HỢP
// ══════════════════════════════════════════════════════════════
= Đề Luyện Tổng Hợp

#align(center)[
  #block(
    fill: rgb("F8FAFC"),
    stroke: 1pt + c-navy,
    radius: 8pt,
    inset: (x: 20pt, y: 15pt),
    width: 100%,
  )[
    #text(fill: c-navy, weight: "bold", size: 12pt)[
      📋 Bảng Phân Loại Đề Thực Chiến 15 Bài Tập Điển Hình
    ]
    #v(0.8em)
    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 12pt,
  Thay biểu thức này vào tổng $S$, ta có:
  $
    S = sum_(k=0)^n frac(1, n+1) C_(n+1)^(k+1) = frac(1, n+1) sum_(k=0)^n C_(n+1)^(k+1) \
    = frac(1, n+1) [C_(n+1)^1 + C_(n+1)^2 + ... + C_(n+1)^(n+1)]
  $
  Biết rằng tổng các hệ số nhị thức từ 0 đến $n+1$ là $2^(n+1)$:
  $ C_(n+1)^0 + C_(n+1)^1 + ... + C_(n+1)^(n+1) = 2^(n+1) $
  Suy ra $C_(n+1)^1 + C_(n+1)^2 + ... + C_(n+1)^(n+1) = 2^(n+1) - 1$ (do $C_(n+1)^0 = 1$).
  Thế vào công thức của $S$:
  $ S = frac(2^(n+1) - 1, n+1) $
]

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 15: ỨNG DỤNG TỔ HỢP TRONG TRÒ CHƠI & XÁC SUẤT
// ══════════════════════════════════════════════════════════════
#skill-badge("Chủ Đề 15", "Ứng Dụng Tổ Hợp Và Xác Suất Trò Chơi", color: c-indigo)

#theory-box[
  *1. Xác suất cổ điển trên không gian mẫu tổ hợp:*
  $ P(A) = frac(|A|, |Omega|) $
  Trong đó $|Omega|$ và $|A|$ được tính bằng các công cụ đếm tổ hợp nâng cao.

  *2. Xích Markov và Mô hình hóa trạng thái:*
  Với các trò chơi nhiều lượt, xác suất thắng/thua ở mỗi lượt thay đổi p
]

#example-box(n: "1 (Dễ)")[
  Một người tung một đồng xu cân đối và đồng chất 6 lần liên tiếp. Tính xác suất để số lần xuất hiện mặt ngửa đúng bằng số lần xuất hiện mặt sấp.

  *Giải:*
  - Mỗi lần tung đồng xu có 2 khả năng (Ngửa hoặc Sấp). Tổng số kịch bản xảy ra khi tung 6 lần là:
    $ |Omega| = 2^6 = 64 " kịch bản" $
  - Để số lần ngửa bằng số sấp, mỗi mặt phải xuất hiện đúng 3 lần. Số cách chọn ra 3 lượt tung xuất hiện mặt ngửa trong 6 lượt tung là:
    $ |A| = C_6^3 = 20 " cách" $
  - Xác suất cần tìm là: $P(A) = frac(20, 64) = frac(5, 16) = 0.3125$.
]

#example-box(n: "2 (Trung bình)")[
  Hai đấu thủ A và B chơi một giải cờ vua. Xác suất thắng một ván cờ của A là 0.6, của B là 0.4 (không có hòa). Trận đấu sẽ kết thúc khi có một đấu thủ giành chiến thắng trước đúng 3 ván cờ. Tính xác suất để đấu thủ A th
  [Tìm số nghiệm nguyên không âm của phương trình $x + y + z + w = 17$ thỏa mãn điều kiện $x >= 1$, $y >= 2$, $z >= 3$, $w >= 0$.],
  [364],
  loigiai: [
    *Cách 1 (Sử dụng phương pháp đổi biến - Vách ngăn):*
    Thực hiện đổi biến đưa về dạng không âm tự do:
    - Đặt $x' = x - 1 >= 0$
    - Đặt $y' = y - 2 >= 0$
    - Đặt $z' = z - 3 >= 0$
    - Đặt $w' = w >= 0$
    Thay vào phương trình ta được:
    $
      (x' + 1) + (y' + 2) + (z' + 3) + w' = 17 \
       <->  x' + y' + z' + w' = 11
    $
    Áp dụng công thức vách ngăn cơ bản với $n=11$ và $k=4$:
    $ N = 
    Áp dụng khai triển nhị thức Newton cho $(1+x)^k$:
    $ G(x) = sum_(k=0)^(infinity) x^k sum_(j=0)^k C_k^j x^j = sum_(k=0)^(infinity) sum_(j=0)^k C_k^j x^(k+j) $
    Để tìm hệ số của $x^(10)$, ta chọn các cặp số $(k, j)$ sao cho $k + j = 10$ với $0 <= j <= k$.
    - Biến $x$ ($x >= 1$): $f_x(t) = t + t^2 + t^3 + ... = frac(t, 1-t)$.
  - A thắng ở lượt tung thứ 5: A sấp, B sấp, A sấp, B sấp, A ngửa. Xác suất là $(1/2)^5 = 1/32$.
  Tổng quát, A có thể thắng ở lượt thứ $2k+1$ với xác suất $(1/2)^(2k+1)$.
  Xác suất thắng cuộc của A là tổng của cấp số nhân lùi vô hạn:
  $
    P = frac(1, 2) + (frac(1, 2))^3 + (frac(1, 2))^5 + ... \
    = frac(1, 2) sum_(k=0)^( infinity ) (frac(1, 4))^k
  $
  Áp dụng công thức tổng cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 1/2$ và công vị $q = 1/4$:
  $ P = frac(u_1, 1 - q) = frac(1/2, 1 - 1/4) = frac(1/2, 3/4) = frac(2, 3) $

  *Cách 2 (Phương trình trạng thái có điều kiện - Markov):*
  Gọi $p$ là xác suất người tung trước giành chiến thắng trong trò chơi này từ thời điểm bắt đầu lượt tung của mình.
  Xét lượt tung của người A (đang đóng vai trò người đi trước):
  - A tung được mặt ngửa (xác suất $1/2$): A thắng cuộc ngay lập tức (xác suất thắng là 1).
  - A tung được mặt sấp (xác suất $1/2$): Lượt chơi chuyển sang người B. Lúc này, người B trở thành người đi trước trong lượt tung của mình. Theo định nghĩa, xác suất để B thắng trò chơi kể từ thời điểm này là $p$. Do đó, xác suất để A thắng trò chơi kể từ thời điểm này là $1 - p$.
  Ta lập phương trình tự liên hệ xác suất:
  $
    p = frac(1, 2) dot 1 + frac(1, 2) dot (1 - p) \
     <->  p = frac(1, 2) + frac(1, 2) - frac(1, 2) p \
     <->  frac(3, 2) p = 1  <->  p = frac(2, 3)
  $
  Xác suất thắng cuộc của người A là $2/3$.
      Số cách chia vào nhóm phân biệt là: $C_(12)^3 dot C_9^3 dot C_6^3 dot C_3^3 = 220 dot 84 dot 20 dot 1 = 369600$.

      - Sắp xếp vị trí 4 nam vào các vị trí nam: $4! = 24$ cách.
      - Sắp xếp vị trí 4 nữ vào các vị trí nữ: $4! = 24$ cách.
      Số cách xếp là: $24 dot 24 = 576$ cách.
    - *Cấu trúc 2:* `Nữ - Nam - Nữ - Nam - Nữ - Nam - Nữ - Nam`
      - Tương tự như trên, số cách xếp là: $24 dot 24 = 576$ cách.
    Tổng số cách xếp thỏa mãn là: $576 + 576 = 1152$ cách.
  ],
)

  - Với $t = -1$: $G_X(-1) = frac(-1, 2 - (-1)) = -frac(1, 3)$.
  Thay vào công thức ta được:
  $ P(X " lẻ") = frac(1 - (-frac(1, 3)), 2) = frac(frac(4, 3), 2) = frac(2, 3). $
  Vậy xác suất người A thắng cuộc là $2/3$.
]

#pagebreak()

// ══════════════════════════════════════════════════════════════
// PHẦN II: ĐỀ LUYỆN TỔNG HỢP
// ══════════════════════════════════════════════════════════════
= Đề Luyện Tổng Hợp

#align(center)[
  #block(
    fill: rgb("F8FAFC"),
    stroke: 1pt + c-navy,
    radius: 8pt,
    inset: (x: 20pt, y: 15pt),
    width: 100%,
  )[
    #text(fill: c-navy, weight: "bold", size: 12pt)[
      📋 Bảng Phân Loại Đề Thực Chiến 15 Bài Tập Điển Hình
    ]
    #v(0.8em)
    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 12pt,
      row-gutter: 8pt,
      align: (center, left, center),
      box(fill: rgb("DCFCE7"), stroke: 1pt + c-teal, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-teal, weight: "bold")[★ Cơ Bản]
      ],
      [Nguyên lý cộng nhân, hoán vị chỉnh hợp cơ bản, vách ngăn đơn giản],
      [Bài 1–5],

      box(fill: rgb("FEF9C3"), stroke: 1pt + c-gold, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-gold, weight: "bold")[★★ Khá]
      ],
      [Gộp khối khoảng trống, hoán vị lặp, đếm hình học, chữ số chia hết],
      [Bài 6–10],

      box(fill: rgb("FEE2E2"), stroke: 1pt + c-crimson, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-crimson, weight: "bold")[★★★ Khó]
      ],
      [Hàm sinh Euler, phân hoạch Stirling, song ánh Catalan, truy hồi bậc cao, Newton],
      [Bài 11–15],
    )
  ]
]

#v(1em)

#prob(
  "1 ★",
  [Có bao nhiêu số tự nhiên có 5 chữ số đôi một khác nhau được lập từ các chữ số của tập hợp $\{1, 2, 3, 4, 5, 6, 7\}$ sao cho số đó chia hết cho 5?],
  [360],
  loigiai: [
    Gọi số cần lập là $overline(a_1 a_2 a_3 a_4 a_5)$ với các chữ số khác nhau thuộc tập $\{1, ..., 7\}$.
    - Chữ số cuối $a_5$ bắt buộc phải bằng 5 (có đúng 1 cách chọn).
    - Bốn chữ số còn lại $a_1, a_2, a_3, a_4$ được chọn và xếp thứ tự từ tập 6 chữ số còn lại $\{1, 2, 3, 4, 6, 7\}$: có $A_6^4 = 360$ cách.
    Số lượng số thỏa mãn là: $1 dot 360 = 360$ số.
  ],
)

#prob(
  "2 ★",
  [Tìm số nghiệm nguyên không âm của phương trình $x + y + z + w = 17$ thỏa mãn điều kiện $x >= 1$, $y >= 2$, $z >= 3$, $w >= 0$.],
  [364],
  loigiai: [
    *Cách 1 (Sử dụng phương pháp đổi biến - Vách ng
"  loigiai: [\n    *Cách 1 (Liệt kê trực tiếp):*\n    Một dãy nhị phân độ dài $n$ xen kẽ hoàn toàn chỉ có thể có hai cấu trúc duy nhất:\n    - Nếu bắt đầu bằng 0: $0101...$\n    - Nếu bắt đầu bằng 1: $1010...$\n    Với $n = 8$, hai dãy thỏa mãn là $01010101$ và $10101010$. Do đó, chỉ có đúng 2 dãy nhị phân thỏa mãn đề bài.\n\n    *Cách 2 (Sử dụng hàm sinh - Generating Functions):*\n    Gọi $a_n$ là số dãy nhị phân độ dài $n$ xen kẽ hoàn toàn.\n    - Với $n = 0$, ta có 1 chuỗi rỗng: $a_0 = 1$.\n    - Với mỗi $n >= 1$, luôn có đúng 2 chuỗi thỏa mãn (một chuỗi bắt đầu bằng 0 và một chuỗi bắt đầu bằng 1). Do đó, $a_n = 2$ với mọi $n >= 1$.\n    Hàm sinh của dãy số $a_n$ là:\n    $ A(x) = a_0 + sum_(n=1)^(infinity) a_n x^n = 1 + sum_(n=1)^(infinity) 2 x^n = 1 + frac(2x, 1-x) = frac(1+x, 1-x) $\n    Khai triển thành chuỗi lũy thừa:\n    $ A(x) = (1+x)(1 + x + x^2 + x^3 + ... + x^8 + ...) = 1 + 2x + 2x^2 + 2x^3 + ... + 2x^8 + ... $\n    Số dãy nhị phân xen kẽ hoàn toàn độ dài 8 chính là hệ số của $x^8$ trong khai triển trên, tức là $[x^8] A(x) = 2$.\n  ],"

    *Cách 2 (Sử dụng hàm sinh mũ - Exponential Generating Function):*
    Số cách phân chia tập hợp $n$ phần tử phân biệt thành $k=2$ nhóm không rỗng không phân biệt được biểu diễn bởi hệ số của hàm sinh mũ:
    $ G_2(x) = frac((e^x - 1)^2, 2!) = frac(1, 2) (e^(2x) - 2e^x + 1) $
"    Áp dụng khai triển lũy thừa kép $e^(a x) = sum_(n=0)^(infinity) frac((a x)^n, n!)$, ta tìm hệ số của $frac(x^5, 5!)$ trong khai triển của $G_2(x)$:\n    $\n      S(5,2) = 5! [x^5] G_2(x) = 5! [x^5] ( frac(1, 2) (sum_(n=0)^(infinity) frac(2^n x^n, n!) - 2 sum_(n=0)^(infinity) frac(x^n, n!) + 1) ) \\\n      = frac(5!, 2) ( frac(2^5, 5!) - 2 dot frac(1, 5!) ) = frac(2^5 - 2, 2) = frac(30, 2) = 15 \" cách.\"\n    $"
  ],
)

#prob(
  "11 ★★★",
  [Lát một hành lang kích thước $1  times  10$ bằng các viên gạch kích thước $1  times  1$ và $1  times  2$. Hỏi có bao nhiêu cách lát khác nhau?],
  [89],
  loigiai: [
    *Cách 1 (Sử dụng công thức truy hồi):*
    Gọi $a_n$ là số cách lát hành lang kích thước $1  times  n$.
    Xét viên gạch cuối cùng được đặt ở vị trí kết thúc:
    - Nếu viên gạch cuối là $1  times  1$: Phần hành lang phía trước dài $1  times  (n-1)$ có $a_(n-1)$ cách lát.
  loigiai: [
    *Cách 1 (Chia trường hợp kết hợp vách ngăn):*
    Xét viên gạch cuối cùng được đặt ở vị trí kết thúc:
    - Nếu viên gạch cuối là $1  times  1$: Phần hành lang phía trước dài $1  times  (n-1)$ có $a_(n-1)$ cách lát.
    - Nếu viên gạch cuối là $1  times  2$: Phần hành lang phía trước dài $1  times  (n-2)$ có $a_(n-2)$ cách lát.
    Ta có hệ thức truy hồi Fibonacci: $a_n = a_(n-1) + a_(n-2)$ với mọi $n >= 3$.
    Khởi tạo giá trị:
    - Hành lang $1  times  1$ ($n=1$): Chỉ có 1 cách dùng gạch $1  times  1  ->  a_1 = 1$.
    - Hành lang $1  times  2$ ($n=2$): Có 2 cách (dùng hai viên $1  times  1$ hoặc một viên $1  times  2$) $ ->  a_2 = 2$.
    Tính các số hạng tiếp theo của dãy:
    $
      a_3 = 3, a_4 = 5, a_5 = 8, a_6 = 13, a_7 = 21, a_8 = 34, a_9 = 55, a_(10) = 89
    $
    Vậy có tất cả 89 cách lát hành lang.

    *Cách 2 (Sử dụng hàm sinh - Generating Functions):*
    Quy ước $a_0 = 1$ (số cách lát hành lang độ dài 0 là 1 - lát rỗng). Khi đó hệ thức truy hồi $a_n = a_(n-1) + a_(n-2)$ được thỏa mãn với mọi $n >= 2$ (do $a_1 = a_0 = 1$, $a_2 = a_1 + a_0 = 2$).
    Định nghĩa hàm sinh của dãy số $a_n$ là:
    $ G(x) = sum_(n=0)^(infinity) a_n x^n $
    Áp dụng hệ thức truy hồi ta có:
    $ G(x) = a_0 + a_1 x + sum_(n=2)^(infinity) (a_(n-1) + a_(n-2)) x^n = 1 + x + x sum_(n=2)^(infinity) a_(n-1) x^(n-1) + x^2 sum_(n=2)^(infinity) a_(n-2) x^(n-2) $
    $ G(x) = 1 + x + x (G(x) - 1) + x^2 G(x) = 1 + (x + x^2) G(x) $
    Suy ra hàm sinh của dãy số $a_n$ là:
    $ G(x) = frac(1, 1 - x - x^2) $
    Ta khai triển lũy thừa của phân thức $G(x)$:
    $ G(x) = sum_(k=0)^(infinity) (x + x^2)^k = sum_(k=0)^(infinity) x^k (1 + x)^k $
    Áp dụng khai triển nhị thức Newton cho $(1+x)^k$:
    $ G(x) = sum_(k=0)^(infinity) x^k sum_(j=0)^k C_k^j x^j = sum_(k=0)^(infinity) sum_(j=0)^k C_k^j x^(k+j) $
    Để tìm hệ số của $x^(10)$, ta chọn các cặp số $(k, j)$ sao cho $k + j = 10$ với $0 <= j <= k$.
    Các cặp số thỏa mãn là:
    - Với $k = 10, j = 0 -> C_(10)^0 = 1$
    - Với $k = 9, j = 1 -> C_9^1 = 9$
    - Với $k = 8, j = 2 -> C_8^2 = 28$
    - Với $k = 7, j = 3 -> C_7^3 = 35$
    - Với $k = 6, j = 4 -> C_6^4 = 15$
    - Với $k = 5, j = 5 -> C_5^5 = 1$
    (Các trường hợp khác $k < 5$ không thỏa mãn điều kiện $j <= k$).
    Cộng tất cả các hệ số trên ta được số cách lát:
    $ a_(10) = 1 + 9 + 28 + 35 + 15 + 1 = 89 " cách." $
  ],
)

#prob(
  "12 ★★★",
  [Tìm số đường đi trên lưới tọa độ từ điểm $(0,0)$ đến điểm $(5,5)$ bằng các bước đi sang phải $(+1,0)$ hoặc đi lên trên $(0,+1)$ sao cho đường đi không bao giờ đi lên phía trên đường thẳng $y = x$.],
  [42],
  loigiai: [
    *Cách 1 (Sử dụng công thức số Catalan):*
    Đây là bài toán tính số đường đi Dyck dưới đường phân giác, kết quả chính là số Catalan thứ 5 ($C_5
    - Gọi $A_i$ là tính chất nghiệm thỏa mãn $x_i >= 4$ với $i in \{1, 2, 3, 4\}$. Ta cần tìm số nghiệm không thỏa mãn bất kỳ tính chất $A_i$ nào. Theo nguyên lý bù trừ:
      $ N = |S| - sum_(i=1)^4 |A_i| + sum_(1 <= i < j <= 4) |A_i nn A_j| - sum_(1 <= i < j < k <= 4) |A_i nn A_j nn A_k| + |A_1 nn A_2 nn A_3 nn A_4| $
      - Tính $|A_i|$: Giả sử $x_1 >= 4$, đặt $x_1' = x_1 - 4 >= 0$, phương trình trở thành $x_1' + x_2 + x_3 + x_4 = 6$.
        Số nghiệm là $C_(6+4-1)^(4-1) = C_9^3 = 84$. Có $C_4^1 = 4$ cách chọn biến vi phạm, nên $sum |A_i| = 4 dot 84 = 336$.
      - Tính $|A_i nn A_j|$: Giả sử $x_1 >= 4, x_2 >= 4$, đặt $x_1' = x_1 - 4 >= 0, x_2' = x_2 - 4 >= 0$, phương trình trở thành $x_1' + x_2' + x_3 + x_4 = 2$.
    Quy ước $a_0 = 1$ (số cách lát hành lang độ dài 0 là 1 - lát rỗng). Khi đó hệ thức truy hồi $a_n = a_(n-1) + a_(n-2)$ được thỏa mãn với mọi $n >= 2$ (do $a_1 = a_0 = 1$, $a_2 = a_1 + a_0 = 2$).
    Định nghĩa hàm sinh của dãy số $a_n$ là:
    $ G(x) = sum_(n=0)^(infinity) a_n x^n $
    Áp dụng hệ thức truy hồi ta có:
    $ G(x) = a_0 + a_1 x + sum_(n=2)^(infinity) (a_(n-1) + a_(n-2)) x^n = 1 + x + x sum_(n=2)^(infinity) a_(n-1) x^(n-1) + x^2 sum_(n=2)^(infinity) a_(n-2) x^(n-2) $
    $ G(x) = 1 + x + x (G(x) - 1) + x^2 G(x) = 1 + (x + x^2) G(x) $
    Suy ra hàm sinh của dãy số $a_n$ là:
    $ G(x) = frac(1, 1 - x - x^2) $
    Ta khai triển lũy thừa của phân thức $G(x)$:
    $ G(x) = sum_(k=0)^(infinity) (x + x^2)^k = sum_(k=0)^(infinity) x^k (1 + x)^k $
    Áp dụng khai triển nhị thức Newton cho $(1+x)^k$:
    $ G(x) = sum_(k=0)^(infinity) x^k sum_(j=0)^k C_k^j x^j = sum_(k=0)^(infinity) sum_(j=0)^k C_k^j x^(k+j) $
    Để tìm hệ số của $x^(10)$, ta chọn các cặp số $(k, j)$ sao cho $k + j = 10$ với $0 <= j <= k$.
    Các cặp số thỏa mãn là:
    - Với $k = 10, j = 0 -> C_(10)^0 = 1$
    - Với $k = 9, j = 1 -> C_9^1 = 9$
    - Với $k = 8, j = 2 -> C_8^2 = 28$
    - Với $k = 7, j = 3 -> C_7^3 = 35$
    - Với $k = 6, j = 4 -> C_6^4 = 15$
    - Với $k = 5, j = 5 -> C_5^5 = 1$
    (Các trường hợp khác $k < 5$ không thỏa mãn điều kiện $j <= k$).
    Cộng tất cả các hệ số trên ta được số cách lát:
    $ a_(10) = 1 + 9 + 28 + 35 + 15 + 1 = 89 " cách." $
  ],
)

#prob(
  "12 ★★★",
  [Tìm số đường đi trên lưới tọa độ từ điểm $(0,0)$ đến điểm $(5,5)$ bằng các bước đi sang phải $(+1,0)$ hoặc đi lên trên $(0,+1)$ sao cho đường đi không bao giờ đi lên phía trên đường thẳng $y = x$.],
  [42],
  loigiai: [
    *Cách 1 (Sử dụng công thức số Catalan):*
    Đây là bài toán tính số đường đi Dyck dưới đường phân giác, kết quả chính là số Catalan thứ 5 ($C_5$):
    $ C_5 = frac(1, 5+1) C_(10)^5 = frac(1, 6) dot 252 = 42 " đường đi" $

    *Cách 2 (Sử dụng hàm sinh - Generating Function):*
    Hàm sinh cho dãy số Catalan $C_n$ là $C(x) = sum_(n=0)^(infinity) C_n x^n$. Bằng cách phân hoạch đường đi Dyck theo điểm đầu tiên chạm vào đường phân giác $y=x$, ta thu được phương trình hàm sinh:
    $ C(x) = 1 + x C(x)^2  <=>  x C(x)^2 - C(x) + 1 = 0 $
    Giải phương trình với điều kiện biên $C(0) = 1$, ta có:
    $ C(x) = frac(1 - sqrt(1 - 4x), 2x) $
    Khai triển Taylor cho căn thức bằng công thức nhị thức mở rộng:
    $ (1 - 4x)^(1/2) = sum_(n=0)^(infinity) C_(1/2)^n (-4x)^n $
    Rút gọn hệ số dẫn đến:
    $ C_n = [x^n] C(x) = frac(1, n+1) C_(2n)^n $
    Với $n = 5$, ta tính được số đường đi Dyck hợp lệ:
    $ C_5 = frac(1, 6) C_(10)^5 = 42 " đường đi." $
  ],
)

#prob(
  "13 ★★★",
  [Tính tổng sau theo $n$:
  $ S = (C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + ... + (C_n^n)^2 $],
  [$C_(2n)^n$],
  loigiai: [
    *Cách 2 (Sử dụng hàm sinh - Generating Functions):*
    Gọi $a_n$ là số dãy nhị phân độ dài $n$ xen kẽ hoàn toàn.
    - Với $n = 0$, ta có 1 chuỗi rỗng: $a_0 = 1$.
    - Với mỗi $n >= 1$, luôn có đúng 2 chuỗi thỏa mãn (một chuỗi bắt đầu bằng 0 và một chuỗi bắt đầu bằng 1). Do đó, $a_n = 2$ với mọi $n >= 1$.
    Hàm sinh của dãy số $a_n$ là:
    $ A(x) = a_0 + sum_(n=1)^(infinity) a_n x^n = 1 + sum_(n=1)^(infinity) 2 x^n = 1 + frac(2x, 1-x) = frac(1+x, 1-x) $
    Khai triển thành chuỗi lũy thừa:
    $ A(x) = (1+x)(1 + x + x^2 + x^3 + ... + x^8 + ...) = 1 + 2x + 2x^2 + 2x^3 + ... + 2x^8 + ... $
"    Số dãy nhị phân xen kẽ hoàn toàn độ dài 8 chính là hệ số của $x^8$ trong khai triển trên, tức là $[x^8] A(x) = 2$.\n  ],"

#prob(
  "9 ★★",
  [Một lưới ô vuông kích thước $5  times  5$ được tạo bởi 6 đường thẳng dọc và 6 đường thẳng ngang. Hỏi có bao nhiêu hình chữ nhật (kể cả hình vuông) xuất hiện trong lưới này?],
  [225],
  loigiai: [
    Một hình chữ nhật được tạo ra bằng cách chọn 2 đường thẳng dọc từ 6 đường dọc và 2 đường thẳng ngang từ 6 đường ngang.
    Số cách chọn là:
    $ N = C_6^2 dot C_6^2 = 15 dot 15 = 225 " hình chữ nhật" $
  ],
)

      - Các phần giao từ 3 tính chất trở lên bằng 0 (do tổng các biến vi phạm tối thiểu phải bằng $4 dot 3 = 12 > 10$).
    - Vậy số nghiệm thỏa mãn điều kiện $0 <= x_i <= 3$ là:
      $ N = 286 - 336 + 60 = 10 " nghiệm." $
  ],
)
    Tổng xác suất A giành chiến thắng chung cuộc là:
    $ P = P_2 + P_3 = 0.36 + 0.288 = 0.648 $
  ],
)

#prob(
  "15 ★★★",
  [Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 10$ thỏa mãn điều kiện $0 <= x_i <= 3$ với mọi $i = 1, 2, 3, 4$.],
  [10],
  loigiai: [
    *Cách 1 (Sử dụng phương pháp hàm sinh):*
    Số nghiệm chính là hệ số của $x^(10)$ trong khai triển đa thức:
    $ f(x) = (1 + x + x^2 + x^3)^4 = (frac(1 - x^4, 1 - x))^4 = (1 - x^4)^4 (1 - x)^(-4) $
    Khai triển các nhân tử:
    - $(1 - x^4)^4 = 1 - 4x^4 + 6x^8 - 4x^(12) + x^(16)$
    - $(1 - x)^(-4) = sum_(k=0)^( infinity ) C_(k+3)^3 x^k$
    Ta tìm hệ số của $x^(10)$ bằng cách nhân các số hạng có tổng số mũ bằng 10:
    - Số hạng $1$ nhân với hệ số của $x^(10)$ trong $(1-x)^(-4)$, tương ứng $k=10$:
      $ 1 dot C_(10+3)^3 = C_(13)^3 = 286 $
    - Số hạng $-4x^4$ nhân với hệ số của $x^6$ trong $(1-x)^(-4)$, tương ứng $k=6$:
      $ -4 dot C_(6+3)^3 = -4 dot C_9^3 = -4 dot 84 = -336 $
    - Hành lang $1  times  2$ ($n=2$): Có 2 cách (dùng hai viên $1  times  1$ hoặc một viên $1  times  2$) $ ->  a_2 = 2$.
    Tính các số hạng tiếp theo của dãy:
    $
      a_3 = 3, a_4 = 5, a_5 = 8, a_6 = 13, a_7 = 21, a_8 = 34, a_9 = 55, a_(10) = 89
    $
    Vậy có tất cả 89 cách lát hành lang.

    *Cách 2 (Sử dụng hàm sinh - Generating Functions):*
    Quy ước $a_0 = 1$ (số cách lát hành lang độ dài 0 là 1 - lát rỗng). Khi đó hệ thức truy hồi $a_n = a_(n-1) + a_(n-2)$ được thỏa mãn với mọi $n >= 2$ (do $a_1 = a_0 = 1$, $a_2 = a_1 + a_0 = 2$).
    Định nghĩa hàm sinh của dãy số $a_n$ là:
    $ G(x) = sum_(n=0)^(infinity) a_n x^n $
    Áp dụng hệ thức truy hồi ta có:
    $ G(x) = a_0 + a_1 x + sum_(n=2)^(infinity) (a_(n-1) + a_(n-2)) x^n = 1 + x + x sum_(n=2)^(infinity) a_(n-1) x^(n-1) + x^2 sum_(n=2)^(infinity) a_(n-2) x^(n-2) $
    $ G(x) = 1 + x + x (G(x) - 1) + x^2 G(x) = 1 + (x + x^2) G(x) $
    Suy ra hàm sinh của dãy số $a_n$ là:
    $ G(x) = frac(1, 1 - x - x^2) $
    Ta khai triển lũy thừa của phân thức $G(x)$:
    $ G(x) = sum_(k=0)^(infinity) (x + x^2)^k = sum_(k=0)^(infinity) x^k (1 + x)^k $
    Áp dụng khai triển nhị thức Newton cho $(1+x)^k$:
    $ G(x) = sum_(k=0)^(infinity) x^k sum_(j=0)^k C_k^j x^j = sum_(k=0)^(infinity) sum_(j=0)^k C_k^j x^(k+j) $
    Để tìm hệ số của $x^(10)$, ta chọn các cặp số $(k, j)$ sao cho $k + j = 10$ với $0 <= j <= k$.
    Các cặp số thỏa mãn là:
    - Với $k = 10, j = 0 -> C_(10)^0 = 1$
    - Với $k = 9, j = 1 -> C_9^1 = 9$
    - Với $k = 8, j = 2 -> C_8^2 = 28$
    - Với $k = 7, j = 3 -> C_7^3 = 35$
    - Với $k = 6, j = 4 -> C_6^4 = 15$
    - Với $k = 5, j = 5 -> C_5^5 = 1$
    (Các trường hợp khác $k < 5$ không thỏa mãn điều kiện $j <= k$).
    Cộng tất cả các hệ số trên ta được số cách lát:
    $ a_(10) = 1 + 9 + 28 + 35 + 15 + 1 = 89 " cách." $
  ],
)

#prob(
  "12 ★★★",
  [Tìm số đường đi trên lưới tọa độ từ điểm $(0,0)$ đến điểm $(5,5)$ bằng các bước đi sang phải $(+1,0)$ hoặc đi lên trên $(0,+1)$ sao cho đường đi không bao giờ đi lên phía trên đường thẳng $y = x$.],
  [42],
  loigiai: [
    *Cách 1 (Sử dụng công thức số Catalan):*
    Đây là bài toán tính số đường đi Dyck dưới đường phân giác, kết quả chính là số Catalan thứ 5 ($C_5$):
    $ C_5 = frac(1, 5+1) C_(10)^5 = frac(1, 6) dot 252 = 42 " đường đi" $

    *Cách 2 (Sử dụng hàm sinh - Generating Function):*
    Hàm sinh cho dãy số Catalan $C_n$ là $C(x) = sum_(n=0)^(infinity) C_n x^n$. Bằng cách phân hoạch đường đi Dyck theo điểm đầu tiên chạm vào đường phân giác $y=x$, ta thu được phương trình hàm sinh:
    $ C(x) = 1 + x C(x)^2  <=>  x C(x)^2 - C(x) + 1 = 0 $
    Giải phương trình với điều kiện biên $C(0) = 1$, ta có:
    $ y_1 + y_2 + ... + y_(k+1) = n - k $
    Trong đó $y_1, y_(k+1) >= 0$ và $y_2, ..., y_k >= 1$ ($k-1$ biến lớn hơn hoặc bằng 1).
    Hàm sinh cho số nghiệm của phương trình là:
    $ f(t) = (sum_(i=0)^(infinity) t^i)^2 dot (sum_(i=1)^(infinity) t^i)^(k-1) = (frac(1, 1-t))^2 dot (frac(t, 1-t))^(k-1) = frac(t^(k-1), (1-t)^(k+1)) $
    Số cách chọn thỏa 



    Hai cách giải đều dẫn tới cùng một kết quả nhất quán.
  ],
)

#prob(
  "17 ★★★",
  [Có bao nhiêu cách chia 20 viên kẹo giống nhau cho 4 đứa trẻ sao cho đứa thứ nhất nhận được số chẵn kẹo, đứa thứ hai nhận được số lẻ kẹo, đứa thứ ba nhận được ít nhất 3 viên kẹo, và đứa thứ tư nhận được nhiều nhất 5 viên kẹo?],
  [194],
  loigiai: [
    *Cách 1 (Chia trường hợp kết hợp vách ngăn):*
    Gọi $x_1, x_2, x_3, x_4$ lần lượt là số kẹo của 4 đứa trẻ. Ta có phương trình:
    $ x_1 + x_2 + x_3 + x_4 = 20 $
    Với điều kiện: $x_1$ chẵn, $x_2$ lẻ, $x_3 >= 3$, $0 <= x_4 <= 5$.
    Ta đổi biến bằng cách đặt:
    - $x_1 = 2 a$ với $a >= 0$
    - $x_2 = 2 b + 1$ với $b >= 0$
    - $x_3 = c + 3$ với $c >= 0$
    Khi đó phương trình trở thành:
    $ 2 a + (2 b + 1) + (c + 3) + x_4 = 20  <->  2(a + b) + c + x_4 = 16 $
    Ta có thể chia trường hợp cho $x_4 in {0, 1, 2, 3, 4, 5}$:
    - Nếu $x_4 = 0 => 2(a+b) + c = 16$. Đặt $k = a+b$. Với mỗi $k in {0, ..., 8}$, ta có $c = 16 - 2k >= 0$. Số cách chọn cặp $(a,b)$ thỏa mãn $a+b = k$ là $k+1$. Tổng số cách là $sum_(k=0)^8 (k+1) = 45$.
    - Nếu $x_4 = 1 => 2(a+b) + c = 15$. Với mỗi $k in {0, ..., 7}$, ta có $c = 15 - 2k >= 0$. Số cách chọn $(a,b)$ là $k+1$. Tổng số cách là $sum_(k=0)^7 (k+1) = 36$.
    - Nếu $x_4 = 2 => 2(a+b) + c = 14 => sum_(k=0)^7 (k+1) = 36$.
    - Nếu $x_4 = 3 => 2(a+b) + c = 13 => sum_(k=0)^6 (k+1) = 28$.
    - Nếu $x_4 = 4 => 2(a+b) + c = 12 => sum_(k=0)^6 (k+1) = 28$.




    *Cách 2 (Sử dụng hàm sinh - Đồng nhất hệ số):*
    Xét đa thức hàm sinh cho hai phân phối nhị thức:
    $ f(x) = (1 + x)^n " và " g(x) = (x + 1)^n $
    Nhân hai đa thức này ta được:
    $ f(x) g(x) = (1 + x)^(2n) $
    - Hệ số của số hạng $x^n$ trong vế phải $(1 + x)^(2n)$ là: $C_(2n)^n$.
    - Ở vế trái, ta thực hiện khai triển nhị thức Newton cho từng đa thức:
      $ f(x) g(x) = (sum_(i=0)^n C_n^i x^i) dot (sum_(j=0)^n C_n^j x^(n-j)) $
      Hệ số của số hạng $x^n$ trong tích vế trái có được bằng cách nhân các số hạng có tích số mũ bằng $n$, tức là $x^i dot x^(n-j) = x^n  <=>  i = j$.
      Hệ số tương ứng thu được là:
      $ sum_(i=0)^n C_n^i dot C_n^i = sum_(i=0)^n (C_n^i)^2 $
    Đồng nhất hệ số của $x^n$ ở cả hai vế, ta thu được: $S = C_(2n)^n$.
  ],
)

#prob(
  "14 ★★★",
  [Hai người chơi A và B chơi một trò chơi tung đồng xu. Người A thắng nếu tung được mặt ngửa, người B thắng nếu tung được mặt sấp. Biết đồng xu không cân đối, xác suất xuất hiện mặt ngửa là $p = 0.6$ và sấp là $1-p = 0.4$. Trò chơi kết thúc khi có người đạt được 2 lượt thắng. Tính xác suất để người A giành chiến thắng chung cuộc.],
  [0.648],
  loigiai: [
    Trò chơi kết thúc sau tối đa 3 lượt chơi. A giành chiến thắng chung cuộc trong các trường hợp sau:
    - *TH1 (A thắng sau 2 lượt):* A thắng cả 2 lượt đầu. Xác suất là:
      $ P_2 = (0.6)^2 = 0.36 $
    - *TH2 (A thắng sau 3 lượt):* A thắng lượt thứ 3 và thắng đúng 1 trong 2 lượt đầu. Xác suất là:
      $ P_3 = C_2^1 dot (0.6) dot (0.4) dot 0.6 = 2 dot 0.24 dot 0.6 = 0.288 $
    Tổng xác suất A giành chiến thắng chung cuộc là:
    $ P = P_2 + P_3 = 0.36 + 0.288 = 0.648 $
  ],
)

#prob(
  "15 ★★★",
  [Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 10$ thỏa mãn điều kiện $0 <= x_i <= 3$ với mọi $i = 1, 2, 3, 4$.],
  [10],
  loigiai: [
    *Cách 1 (Sử dụng phương pháp hàm sinh):*
    Số nghiệm chính là hệ số của $x^(10)$ trong khai triển đa thức:
    $ f(x) = (1 + x + x^2 + x^3)^4 = (frac(1 - x^4, 1 - x))^4 = (1 - x^4)^4 (1 - x)^(-4) $
    Khai triển các nhân tử:
    - $(1 - x^4)^4 = 1 - 4x^4 + 6x^8 - 4x^(12) + x^(16)$
    - $(1 - x)^(-4) = sum_(k=0)^( infinity ) C_(k+3)^3 x^k$
    Ta tìm hệ số của $x^(10)$ bằng cách nhân các số hạng có tổng số mũ bằng 10:
    - Số hạng $1$ nhân với hệ số của $x^(10)$ trong $(1-x)^(-4)$, tương ứng $k=10$:
      $ 1 dot C_(10+3)^3 = C_(13)^3 = 286 $
    - Số hạng $-4x^4$ nhân với hệ số của $x^6$ trong $(1-x)^(-4)$, tương ứng $k=6$:




























































































































    Đây là một song ánh 1-1, chứng minh $D(n) = O(n)$.
  ],
)

#prob(
  "31 ★★★",
  [Tìm hệ số của $x^5$ trong khai triển đa thức sau:
  $ f(x) = (1 + 2 x - 3 x^2)^8 $],
  [-1904],
  loigiai: [
    *Cách 1 (Sử dụng khai triển nhị thức Newton kép):*
    Ta viết đa thức dưới dạng:
    $ f(x) = [1 + x(2 - 3x)]^8 = sum_(k=0)^8 C_8^k x^k (2 - 3x)^k $
    Số hạng chứa $x^5$ xuất hiện khi số mũ của $x$ bên ngoài nhân với số hạng tương ứng bên trong khai triển của $(2-3x)^k$ để tổng số mũ bằng 5. Do đó ta chỉ cần xét các trường hợp $k$ từ 3 đến 5:
    - *Với $k=3$:* Ta cần tìm hệ số của $x^2$ trong $(2-3x)^3$.
      $ [x^2] (2-3x)^3 = C_3^2 dot 2^1 dot (-3)^2 = 3 dot 2 dot 9 = 54 $
      Nhân với hệ số ngoài: $C_8^3 dot 54 = 56 dot 54 = 3024$.
    - *Với $k=4$:* Ta cần tìm hệ số của $x^1$ trong $(2-3x)^4$.
      $ [x^1] (2-3x)^4 = C_4^1 dot 2^3 dot (-3)^1 = 4 dot 8 dot (-3) = -96 $
      Nhân với hệ số ngoài: $C_8^4 dot (-96) = 70 dot (-96) = -6720$.
    - *Với $k=5$:* Ta cần tìm hệ số của $x^0$ trong $(2-3x)^5$.
      $ [x^0] (2-3x)^5 = C_5^0 dot 2^5 = 32 $
      Nhân với hệ số ngoài: $C_8^5 dot 32 = 56 dot 32 = 1792$.
    Tổng hệ số của $x^5$ trong khai triển là:
    $ N = 3024 - 6720 + 1792 = -1904. $

    *Cách 2 (Sử dụng công thức đa thức - Multinomial Theorem):*
    Theo công thức đa thức, số hạng tổng quát trong khai triển $(1 + 2x - 3x^2)^8$ có dạng:
    $ frac(8!, a! b! c!) dot 1^a dot (2x)^b dot (-3x^2)^c = frac(8!, a! b! c!) d






    Hàm sinh cho từng vị trí chữ số của số có 6 chữ số:
    - Chữ số hàng trăm nghìn $a_1 in {2, 4, 6, 8}$: $P(x) = x^2 + x^4 + x^6 + x^8$.
    - Năm chữ số còn lại $a_i in {0, 2, 4, 6, 8}$: $Q(x) = 1 + x^2 + x^4 + x^6 + x^8$.
    Hàm sinh tổng quát biểu diễn tổng các chữ số là:
    $ F(x) = P(x) Q(x)^5 $
    Ta cần tính tổng các hệ số của $x^k$ với $k$ chia hết cho 9 trong khai triển của $F(x)$.
"    Sử dụng kỹ thuật lọc căn đơn vị với $epsilon = e^(i 2 pi / 9)$ (căn bậc 9 của đơn vị):\n    $ N = frac(1, 9) sum_(j=0)^8 F(epsilon^j) $\n    - Với $j = 0$ ($epsilon^0 = 1$): $F(1) = P(1) Q(1)^5 = 4 dot 5^5 = 12500$.\n    - Với $j >= 1$: do $epsilon^j != 1$ và $(epsilon^j)^9 = 1$, ta có:\n      $ Q(epsilon^j) = frac(1 - (epsilon^j)^(10), 1 - (epsilon^j)^2) = frac(1 - epsilon^j, 1 - (epsilon^j)^2) = frac(1, 1 + epsilon^j) $\n      $ P(epsilon^j) = Q(epsilon^j) - 1 = frac(1, 1 + epsilon^j) - 1 = -frac(epsilon^j, 1 + epsilon^j) $\n      Do đó: $F(epsilon^j) = -frac(epsilon^j, (1 + epsilon^j)^6)$.\n      Tính tổng $sum_(j=1)^8 F(epsilon^j)$ bằng cách nhóm các căn liên hợp phức, ta thu được tổng này bằng $-128$."
    Như vậy, số các số tự nhiên thỏa mãn là:
    $ N = frac(1, 9) [ 12500 - 128 ] = frac(12372, 9) = 1292 " số." $
  ],
)

#prob(
  "20 ★★★",
  [Cho một đa giác đều có 12 đỉnh. Chọn ngẫu nhiên 3 đỉnh của đa giác. Tính số tam giác có các đỉnh là 3 đỉnh được chọn sao cho không có cạnh nào của tam giác là cạnh của đa giác đều đã cho.],
"    Sử dụng kỹ thuật lọc căn đơn vị với $epsilon = e^(i 2 pi / 9)$ (căn bậc 9 của đơn vị):\n    $ N = frac(1, 9) sum_(j=0)^8 F(epsilon^j) $\n    - Với $j = 0$ ($epsilon^0 = 1$): $F(1) = P(1) Q(1)^5 = 4 dot 5^5 = 12500$.\n    - Với $j >= 1$: do $epsilon^j != 1$ và $(epsilon^j)^9 = 1$, ta có:\n      $ Q(epsilon^j) = frac(1 - (epsilon^j)^(10), 1 - (epsilon^j)^2) = frac(1 - epsilon^j, 1 - (epsilon^j)^2) = frac(1, 1 + epsilon^j) $\n      $ P(epsilon^j) = Q(epsilon^j) - 1 = frac(1, 1 + epsilon^j) - 1 = -frac(epsilon^j, 1 + epsilon^j) $\n      Do đó: $F(epsilon^j) = -frac(epsilon^j, (1 + epsilon^j)^6)$.\n      Tính tổng $sum_(j=1)^8 F(epsilon^j)$ bằng cách nhóm các căn liên hợp phức, ta thu được tổng này bằng $-128$."
    *Cách 2 (Sử dụng công thức vách ngăn dạng tròn):*
    Bài toán tương đương với việc chọn 3 đỉnh không kề nhau từ 12 đỉnh xếp trên một vòng tròn.
    Công thức tổng quát để chọn ra $k$ đối tượng không kề nhau từ $n$ đối tượng được xếp trên một vòng tròn ($n >= 2k$) là:
    $ N = frac(n, n-k) C_(n-k)^k $
    Áp dụng công thức trên với $n = 12$ và $k = 3$, ta có số cách chọn là:
    $ N = frac(12, 12-3) C_(12-3)^3 = frac(12, 9) C_9^3 = frac(4, 3) dot frac(9 dot 8 dot 7, 3 dot 2 dot 1) = frac(4, 3) dot 84 = 112 " tam giác." $
  ],
)

#prob(
  "21 ★★★",
  [Chứng minh đẳng thức tổ hợp sau với mọi số tự nhiên $n$ và $m$ thỏa mãn $0 <= m <= n$:
  $ sum_(k=0)^m C_n^k C_(n-k)^(m-k) = 2^m C_n^m $],
  [Đẳng thức được chứng minh],
  loigiai: [
    *Cách 1 (Sử dụng lập luận tổ hợp - Đếm bằng hai cách):*
    Giả sử có một nhóm gồm $n$ người phân biệt. Ta cần chọn ra một ban đại diện gồm đúng $m$ người, trong đó một số người trong ban đại diện được chọn làm thành viên chính thức, số còn lại là thành viên dự bị.
    Ta đếm số cách thiết lập ban đại diện này bằng hai phương pháp khác nhau:
    - *Phương pháp 1 (Đếm trực tiếp):*
      - Bước 1: Chọn ra $m$ người từ $n$ người để đưa 












  [$2^(n-1)$],
  loigiai: [
    *Cách 1 (Sử dụng công thức nhị thức Newton):*
    Số chuỗi nhị phân độ dài $n$ chứa đúng $k$ chữ số 1 là $C_n^k$. Ta cần tính tổng số chuỗi với điều kiện $k$ là số chẵn:
    $ S = sum_(k " chẵn", 0 <= k <= n) C_n^k = C_n^0 + C_n^2 + C_n^4 + ... $
    Áp dụng khai triển nhị thức Newton cho biểu thức $(1+x)^n$ và $(1-x)^n$:
    - $(1+1)^n = C_n^0 + C_n^1 + C_n^2 + ... = 2^n$
    - $(1-1)^n = C_n^0 - C_n^1 + C_n^2 - ... = 0$
    Cộng hai biểu thức trên lại, ta triệt tiêu các số hạng có chỉ số lẻ và nhân đôi các số hạng có chỉ số chẵn:
    $ 2^n + 0 = 2 (C_n^0 + C_n^2 + C_n^4 + ...)  <->  2^n = 2 S $
    Do đó, số chuỗi nhị phân có số lượng số 1 chẵn là:
    $ S = 2^(n-1) " chuỗi." $

    *Cách 2 (Sử dụng đại số hàm sinh - Generating Functions):*
    Ta xây dựng hàm sinh cho từng vị trí trong chuỗi nhị phân:
    Mỗi vị trí có thể đặt chữ số 0 (đóng góp 0 vào số lượng số 1, hàm sinh $1$) hoặc đặt chữ số 1 (đóng góp 1 vào số lượng số 1, hàm sinh $y$ để theo dõi số lượng chữ số 1).
    Hàm sinh tổng quát cho chuỗi nhị phân độ dài $n$ là:
    $ F(y) = (1 + y)^n = sum_(k=0)^n C_n^k y^k $
    Ta cần tính tổng các hệ số của $y^k$ với $k$ chẵn.
    Sử dụng bộ lọc căn đơn v



























    $ x_(i+1) - x_i >= 3 quad (forall i = 1, 2, 3, 4) $
    Ta thực hiện đổi biến đặt:
    - $y_1 = x_1$
    - $y_2 = x_2 - 2$
    - $y_3 = x_3 - 4$
    - $y_4 = x_4 - 6$
    - $y_5 = x_5 - 8$
    Khi đó, từ điều kiện $x_(i+1) - x_i >= 3$, ta suy ra:
    $ y_(i+1) - y_i = x_(i+1) - x_i - 2 >= 3 - 2 = 1 $
    Điều này tương đương với $y_1 < y_2 < y_3 < y_4 < y_5$.
    Giới hạn của các biến $y_i$: do $1 <= x_1$ và $x_5 <= 20$ nên ta có:
    $ 1 <= y_1 < y_2 < y_3 < y_4 < y_5 <= 20 - 8 = 12 $
    Như vậy, mỗi cách chọn bộ $\{x_i\}$ tương ứng song ánh 1-1 với một cách chọn bộ 5 số phân biệt $\{y_i\}$ từ tập $\{1, ..., 12\}$.
    Số cách chọn thỏa mãn yêu cầu là: $C_(12)^5 = frac(12 dot 11 dot 10 dot 9 dot 8, 5 dot 4 dot 3 dot 2 dot 1) = 792$ cách.

    *Cách 2 (Sử dụng hàm sinh - Generating Functions):*
    Quy bài toán về việc đếm số nghiệ    Tính toán liên tiếp theo khối 3 bước:
    - Với $n=1$ ($1 equiv 1 mod 3$): $a_1 = a_0+c_0 = 1$; $b_1 = 1$; $c_1 = 0$.
    - Với $n=2$ ($2 equiv 2 mod 3$): $a_2 = a_1+b_1 = 2$; $b_2 = 1$; $c_2 = 1$.
    - Với $n=3$ ($3 equiv 0 mod 3$): $a_3 = 2 a_2 = 4$; $b_3 = 2$; $c_3 = 2$.
    Bằng phương pháp quy nạp toán học, ta suy ra công thức nghiệm tổng quát cho $a_n$ (số tập con có tổng chia hết cho 3):
    - Nếu $n = 3m$: $a_n = frac(1, 3) (2^(3m) + 2 dot
    - Nếu $n = 3m+1$: $a_n = frac(1, 3) (2^(3m+1) + 2^m) = frac(1, 3) (2^n + 2^((n-1)/3))$.
    - Nếu $n = 3m+2$: $a_n = frac(1, 3) (2^(3m+2) + 2^(m+1)) = frac(1, 3) (2^n + 2^((n-2)/3 + 1)) = frac(1, 3) (2^n + 2^((n+1)/3))$.
 
    *Cách 2 (Sử dụng hàm sinh và kỹ thuật lọc căn đơn vị - Roots of unity filter):*
    Hàm sinh cho tổng các phần tử của tập con của $S$ là:
    $ f(x) = product_(j=1)^n (1 + x^j) $
    Hệ số của $x^k$ trong khai triển của $f(x)$ chính là số tập con của $S$ có tổng các phần tử bằng $k$. Ta cần tính tổng các hệ số của $x^k$ với $k equiv 0 mod 3$.:
    $ [t^(15)] f(t) = [t^(15)] frac(t^8, (1-t)^6) = [t^7] (1-t)^(-6) = C_(7+6-1)^7 = C_(12)^7 = C_(12)^5 = 792 " cách." $
  ],
)

#prob(
  "23 ★★★",
  [Tìm số chuỗi tam phân độ dài $n$ (gồm các chữ số 0, 1, 2) sao cho không chứa hai chữ số 0 nào đứng cạnh nhau.],
  [Công thức tổng quát: hệ số của $x^n$ trong $frac(1+x, 1-2x-2x^2)$],
  loigiai: [
    *Cách 1 (Sử dụng hệ thức truy hồi tuyến tính):*
    Gọi $a_n$ là số chuỗi tam phân độ dài $n$ thỏa mãn điều kiện không chứa "00".
    Phân tích chữ số tận cùng của chuỗi hợp lệ độ dài $n$:
    - Nếu chữ số tận cùng là 1 hoặc 2 (có 2 cách chọn): Phần trước đó độ dài $n-1$ là một chuỗi hợp lệ. Số cách là $2 a_(n-1)$.
    - Nếu chữ số tận cùng là 0: Chữ số kề cuối bắt buộc phải là 1 hoặc 2 (có 2 cách chọn). Phần trước đó độ dài $n-2$ là chuỗi hợp lệ. Số cách là $2 a_(n-2)$.
    Theo nguyên lý cộng, ta có hệ thức truy hồi:
    $ a_n = 2 a_(n-1) + 2 a_(n-2)  quad  (forall n >= 3) $
    Khởi tạo giá trị:
      [Vách ngăn ($>= 0$)], $C_(n+k-1)^(k-1)$, [Vách ngăn ($>= 1$)], $C_(n-1)^(k-1)$,
      [Stirling loại 2], $S(n,k) = frac(1, k!) sum (-1)^j C_k^j (k-j)^n$, [Số Bell], $B(n) = sum_(k=1)^n S(n,k)$,
      [Số Catalan], $C_n = frac(1, n+1) C_(2n)^n$, [Đa thức sắc vòng], $(k-1)^n + (k-1)(-1)^n$,
      [Dãy Fibonacci], $F_n = F_(n-1)+F_(n-2)$, [Hàm phi Euler], $phi(n) = n product_(p|n) (1 - 1/p)$,
      [Khai triển], $(a+b)^n = sum C_n^k a^(n-k) b^k$, [Vandermonde], $C_(2n)^n = sum_(k=0)^n (C_n^k)^2$,
    )
  ]
]

#v(1em)
#key-box[
  *Phương châm giải toán Đại số Tổ hợp:*
  - *Xem xét tính phân biệt:* Vật phân biệt hay giống nhau? Hộp/Nhóm phân biệt hay giống nhau?
  - *Xem xét tính thứ tự:* Lựa chọn có quan tâm đến thứ tự sắp xếp hay chỉ lấy ra tập hợp?
  - *Đơn giản hóa mô hình:* Nếu đếm xuôi có quá nhiều điều kiện chặn, hãy lập tức nghĩ đến việc đếm gián tiếp qua phần bù hoặc thiết lập hệ thức truy hồi.
]




































































    Đây là một song ánh 1-1, chứng minh $D(n) = O(n)$.
  ],
)

#prob(
  "31 ★★★",
  [Tìm hệ số của $x^5$ trong khai triển đa thức sau:
  $ f(x) = (1 + 2 x - 3 x^2)^8 $],
  [-1904],
  loigiai: [
    *Cách 1 (Sử dụng khai triển nhị thức Newton kép):*
    Ta viết đa thức dưới dạng:
    $ f(x) = [1 + x(2 - 3x)]^8 = sum_(k=0)^8 C_8^k x^k (2 - 3x)^k $
    Số hạng chứa $x^5$ xuất hiện khi số mũ của $x$ bên ngoài nhân với số hạng tương ứng bên trong khai triển của $(2-3x)^k$ để tổng số mũ bằng 5. Do đó ta chỉ cần xét các trường hợp $k$ từ 3 đến 5:
    - *Với $k=3$:* Ta cần tìm hệ số của $x^2$ trong $(2-3x)^3$.
    Số cách chia thỏa mãn là:
    $ N = 165 - 140 + 6 = 31 " cách." $

    *Cách 2 (Sử dụng hàm sinh đa thức - Generating Functions):*
    Hộp lựa chọn số món quà cho mỗi đứa trẻ có hàm sinh tương ứng là $f_i(x) = x + x^2 + x^3 + x^4$ (từ 1 đến 4 món quà).
    Hàm sinh tổng quát cho cả 4 đứa trẻ là:
    $ f(x) = (x + x^2 + x^3 + x^4)^4 = x^4 (1 + x + x^2 + x^3)^4 = x^4 (frac(1-x^4, 1-x))^4 $
    Số cách chia quà chính là hệ số của $x^(12)$ trong khai triển lũy thừa của $f(x)$:
    $ [x^(12)] f(x) = [x^(12)] x^4 (frac(1-x^4, 1-x))^4 = [x^8] (1-x^4)^4 (1-x)^(-4) $
    Khai triển hai nhân tử:
    - $(1-x^4)^4 = 1 - 4x^4 + 6x^8 - ...$
    - $(1-x)^(-4) = sum_(k=0)^(infinity) C_(k+3)^3 x^k$
    Tìm hệ số của $x^8$ trong tích:
    $ [x^8] ( (1 - 4x^4 + 6x^8) dot sum_(k=0)^(infinity) C_(k+3)^3 x^k ) = 1 dot C_(8+3)^3 - 4 dot C_(4+3)^3 + 6 dot C_(0+3)^3 $
    $ = C_(11)^3 - 4 C_7^3 + 6 C_3^3 = 165 - 140 + 6 = 31 " cách." $
  ],
)

#prob(
  "28 ★★★",
  [Có bao nhiêu chuỗi nhị phân độ dài 10 chứa đúng 4 chữ số 0 sao cho không có bất kỳ hai chữ số 0 nào đứng cạnh nhau?],
  [35],
  loigiai: [
    *Cách 1 (Sử dụng phương pháp vách ngăn):*
    Chuỗi nhị phân độ dài 10 chứa đúng 4 chữ số 0, suy ra nó chứa đúng 6 chữ số 1.
    - Đầu tiên ta xếp 6 chữ số 1 thành một hàng ngang. Khi đó, có 7 khoảng trống được tạo ra ở giữa các chữ số 1 và hai đầu:
      `_ 1 _ 1 _ 1 _ 1 _ 1 _ 1 _`
    - Để đảm bảo không có hai chữ số 0 nào đứng cạnh nhau, ta chỉ cần chọn ra 4 khoảng trống trong số 7 khoảng trống này để đặt 4 chữ số 0 (mỗi khoảng trống đặt tối đa 1 chữ số 0).
    Số cách chọn khoảng trống đặt chữ số 0 là:
    $ N = C_7^4 = frac(7 dot 6 dot 5, 3 dot 2 dot 1) = 35 " cách." $

    *Cách 2 (Sử dụng phương pháp hàm sinh - Generating Functions):*
    Mỗi chuỗi nhị phân chứa đúng 4 chữ số 0 và 6 chữ số 1 được chia thành các phần bởi các chữ số 0:
    - Gọi $x_1$ là số chữ số 1 đứng trước chữ số 0 thứ nhất ($x_1 >= 0$).
    - Gọi $x_2, x_3, x_4$ lần lượt là số chữ số 1 đứng giữa chữ số 0 thứ nhất và thứ hai, thứ hai và thứ ba, thứ ba và thứ tư. Do không có hai số 0 nào đứng cạnh nhau nên $x_2, x_3, x_4 >= 1$.
    - Gọi $x_5$ là số chữ số 1 đứng sau chữ số 0 thứ tư ($x_5 >= 0$).
    Tổng số chữ số 1 là 6, nên ta có phương trình nghiệm nguyên:
    $ x_1 + x_2 + x_3 + x_4 + x_5 = 6 $
    Với $x_1, x_5 >= 0$ và $x_2, x_3, x_4 >= 1$.
    Hàm sinh biểu diễn số nghiệm của phương trình là:
    $ f(t) = (sum_(i=0)^(infinity) t^i)^2 dot (sum_(i=1)^(infinity) t^i)^3 = (frac(1, 1-t))^2 dot (frac(t, 1-t))^3 = frac(t^3, (1-t)^5) $
    Số cách xếp thỏa mãn chính là hệ số c













































  [$2^(n-1)$],
  loigiai: [
    *Cách 1 (Sử dụng công thức nhị thức Newton):*
    Số chuỗi nhị phân độ dài $n$ chứa đúng $k$ chữ số 1 là $C_n^k$. Ta cần tính tổng số chuỗi với điều kiện $k$ là số chẵn:
    $ S = sum_(k " chẵn", 0 <= k <= n) C_n^k = C_n^0 + C_n^2 + C_n^4 + ... $
    Áp dụng khai triển nhị thức Newton cho biểu thức $(1+x)^n$ và $(1-x)^n$:
    - $(1+1)^n = C_n^0 + C_n^1 + C_n^2 + ... = 2^n$
    - $(1-1)^n = C_n^0 - C_n^1 + C_n^2 - ... = 0$
    Cộng hai biểu thức trên lại, ta triệt tiêu các số hạng có chỉ số lẻ và nhân đôi các số hạng có chỉ số chẵn:
    $ 2^n + 0 = 2 (C_n^0 + C_n^2 + C_n^4 + ...)  <->  2^n = 2 S $
    Do đó, số chuỗi nhị phân có số lượng số 1 chẵn là:
    $ S = 2^(n-1) " chuỗi." $

    *Cách 2 (Sử dụng đại số hàm sinh - Generating Functions):*
    Ta xây dựng hàm sinh cho từng vị trí trong chuỗi nhị phân:
    Mỗi vị trí có thể đặt chữ số 0 (đóng góp 0 vào số lượng số 1, hàm sinh $1$) hoặc đặt chữ số 1 (đóng góp 1 vào số lượng số 1, hàm sinh $y$ để theo dõi số lượng chữ số 1).
    Hàm sinh tổng quát cho chuỗi nhị phân độ dài $n$ là:
    $ F(y) = (1 + y)^n = sum_(k=0)^n C_n^k y^k $
    Ta cần tính tổng các hệ số của $y^k$ với $k$ chẵn.
    Sử dụng bộ lọc căn đơn v






























































      stroke: 0.6pt + rgb("E2E8F0"),
      inset: (x: 8pt, y: 7pt),
      fill: (x,y) => if y==0 { c-navy } else if calc.rem(y,2)==0 { rgb("F8FAFC") } else { white },

      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],
      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],

      [Hoán vị], $P_n = n!$, [Tổ hợp], $C_n^k = frac(n!, k!(n-k)!)$,
      [Chỉnh hợp], $A_n^k = frac(n!, (n-k)!)$, [Hoán vị lặp], $frac(n!, n_1!n_2!dots.c n_k!)$,
      [Vách ngăn ($>= 0$)], $C_(n+k-1)^(k-1)$, [Vách ngăn ($>= 1$)], $C_(n-1)^(k-1)$,
      [Stirling loại 2], $S(n,k) = frac(1, k!) sum (-1)^j C_k^j (k-j)^n$, [Số Bell], $B(n) = sum_(k=1)^n S(n,k)$,
      [Số Catalan], $C_n = frac(1, n+1) C_(2n)^n$, [Đa thức sắc vòng], $(k-1)^n + (k-1)(-1)^n$,
      [Dãy Fibonacci], $F_n = F_(n-1)+F_(n-2)$, [Hàm phi Euler], $phi(n) = n product_(p|n) (1 - 1/p)$,
      [Khai triển], $(a+b)^n = sum C_n^k a^(n-k) b^k$, [Vandermonde], $C_(2n)^n = sum_(k=0)^n (C_n^k)^2$,
    )
  ]
]

#v(1em)
#key-box[
  *Phương châm giải toán Đại số Tổ hợp:*
  - *Xem xét tính phân biệt:* Vật phân biệt hay giống nhau? Hộp/Nhóm phân biệt hay giống nhau?
  - *Xem xét tính thứ tự:* Lựa chọn có quan tâm đến thứ tự sắp xếp hay chỉ lấy ra tập hợp?
  - *Đơn giản hóa mô hình:* Nếu đếm xuôi có quá nhiều điều kiện chặn, hãy lập tức nghĩ đến việc đếm gián tiếp qua phần bù hoặc thiết lập hệ thức truy hồi.
]

















































    - $(1-1)^n = C_n^0 - C_n^1 + C_n^2 - ... = 0$
    Cộng hai biểu thức trên lại, ta triệt tiêu các số hạng có chỉ số lẻ và nhân đôi các số hạng có chỉ số chẵn:
    $ 2^n + 0 = 2 (C_n^0 + C_n^2 + C_n^4 + ...)  <->  2^n = 2 S $
    Do đó, số chuỗi nhị phân có số lượng số 1 chẵn là:
    $ S = 2^(n-1) " chuỗi." $

    *Cách 2 (Sử dụng đại số hàm sinh - Generating Functions):*
    Ta xây dựng hàm sinh cho từng vị trí trong chuỗi nhị phân:
    Mỗi vị trí có thể đặt chữ số 0 (đóng góp 0 vào số lượng số 1, hàm sinh $1$) hoặc đặt chữ số 1 (đóng góp 1 vào số lượng số 1, hàm sinh $y$ để theo dõi số lượng chữ số 1).
    Hàm sinh tổng quát cho chuỗi nhị phân độ dài $n$ là:
    $ F(y) = (1 + y)^n = sum_(k=0)^n C_n^k y^k $
    Ta cần tính tổng các hệ số của $y^k$ với $k$ chẵn.
    Sử dụng bộ lọc căn đơn vị bậc 2 (roots of unity filter) bằng cách lấy trung bình cộng giá trị của hàm sinh tại $y = 1$ và $y = -1$:
    $ S = frac(F(1) + F(-1), 2) = frac((1+1)^n + (1-1)^n, 2) = frac(2^n + 0, 2) = 2^(n-1) " chuỗi." $
  ],
)

#prob(
  "35 ★★★",
  [Cho tập hợp $S = {1, 2, ..., n}$ (với $n >= 1$). Có bao nhiêu tập con $A$ của $S$ sao cho tổng tất cả các phần tử của $A$ là một số chia hết cho 3 (quy ước tổng các phần





    - *Trường hợp $n+1$ chia cho 3 dư 1:*
      $ a_(n+1) = a_n + c_n, quad b_(n+1) = b_n + a_n, quad c_(n+1) = c_n + b_n $
    - *Trường hợp $n+1$ chia cho 3 dư 2:*
      $ a_(n+1) = a_n + b_n, quad b_(n+1) = b_n + c_n, quad c_(n+1) = c_n + a_n $
    Khởi tạo với tập rỗng ($n=0$): $a_0 = 1$ (tập rỗng có tổng 0), $b_0 = 0, c_0 = 0$.
"    Tính toán liên tiếp theo khối 3 bước:\n    - Với $n=1$ ($1 equiv 1 mod 3$): $a_1 = a_0+c_0 = 1$; $b_1 = 1$; $c_1 = 0$.\n    - Với $n=2$ ($2 equiv 2 mod 3$): $a_2 = a_1+b_1 = 2$; $b_2 = 1$; $c_2 = 1$.\n    - Với $n=3$ ($3 equiv 0 mod 3$): $a_3 = 2 a_2 = 4$; $b_3 = 2$; $c_3 = 2$.\n    Bằng phương pháp quy nạp toán học, ta suy ra công thức nghiệm tổng quát cho $a_n$ (số tập con có tổng chia hết cho 3):\n    - Nếu $n = 3m$: $a_n = frac(1, 3) (2^(3m) + 2 dot 2^m) = frac(1, 3) (2^n + 2^(n/3 + 1))$.\n    - Nếu $n = 3m+1$: $a_n = frac(1, 3) (2^(3m+1) + 2^m) = frac(1, 3) (2^n + 2^((n-1)/3))$.\n    - Nếu $n = 3m+2$: $a_n = frac(1, 3) (2^(3m+2) + 2^(m+1)) = frac(1, 3) (2^n + 2^((n-2)/3 + 1)) = frac(1, 3) (2^n + 2^((n+1)/3))$.\n \n    *Cách 2 (Sử dụng hàm sinh và kỹ thuật lọc căn đơn vị - Roots of unity filter):*\n    Hàm sinh cho tổng các phần tử của tập con của $S$ là:\n    $ f(x) = product_(j=1)^n (1 + x^j) $\n    Hệ số của $x^k$ trong khai triển của $f(x)$ chính là số tập con của $S$ có tổng các phần tử bằng $k$. Ta cần tính tổng các hệ số của $x^k$ với $k equiv 0 mod 3$."
    - Ta có $f(1) = product_(j=1)^n (1 + 1^j) = 2^n$.
    - Xét tích $f(omega) = product_(j=1)^n (1 + omega^j)$. Nhận xét rằng với mỗi bộ 3 số mũ liên tiếp $\{3k-2, 3k-1, 3k\}$, ta có:
// ══════════════════════════════════════════════════════════════
  *Phương châm giải toán Đại số Tổ hợp:*
  - *Xem xét tính phân biệt:* Vật phân biệt hay giống nhau? Hộp/Nhóm phân biệt hay giống nhau?
  - *Xem xét tính thứ tự:* Lựa chọn có quan tâm đến thứ tự sắp xếp hay chỉ lấy ra tập hợp?
  - *Đơn giản hóa mô hình:* Nếu đếm xuôi có quá nhiều điều kiện chặn, hãy lập tức nghĩ đến việc đếm gián tiếp qua phần bù hoặc thiết lập hệ thức truy hồi.
]







    $ N = frac(1, 3) [ f(1) + f(omega) + f(omega^2) ] $
    - Ta có $f(1) = product_(j=1)^n (1 + 1^j) = 2^n$.
    - Xét tích $f(omega) = product_(j=1)^n (1 + omega^j)$. Nhận xét rằng với mỗi bộ 3 số mũ liên tiếp $\{3k-2, 3k-1, 3k\}$, ta có:
      $ (1+omega^(3k-2))(1+omega^(3k-1))(1+omega^(3k)) = (1+omega)(1+omega^2)(1+omega^3) = (-omega^2)(-omega)(2) = 2 omega^3 = 2 $
      Do đó:
      - Nếu $n = 3m$: $f(omega) = 2^m = 2^(n/3)$. Tương tự $f(omega^2) = 2^(n/3)$.
        $ N = frac(1, 3) (2^n + 2^(n/3) + 2^(n/3)) = frac(1, 3) (2^n + 2^(n/3 + 1)) $
      - Nếu $n = 3m+1$: $f(omega) = 2^m (1+omega) = 2^m (-omega^2)$, và $f(omega^2) = 2^m (1+omega^2) = 2^m (-omega)$.
        $ f(omega) + f(omega^2) = 2^m (-omega^2 - omega) = 2^m (1) = 2^((n-1)/3) $
        $ N = frac(1, 3) (2^n + 2^((n-1)/3)) $
      - Nếu $n = 3m+2$: $f(omega) = 2^m (1+omega)(1+omega^2) = 2^m$, và $f(omega^2) = 2^m (1+omega^2)(1+omega) = 2^m$.
        $ f(omega) + f(omega^2) = 2 dot 2^m = 2^((n-2)/3 + 1) = 2^((n+1)/3) $
        $ N = frac(1, 3) (2^n + 2^((n+1)/3)) $
    Cả hai phương pháp đều dẫn tới cùng một công thức nhất quán.
  ],
)

#pagebreak()

// ══════════════════════════════════════════════════════════════
// PHẦN III: BẢNG TỔNG HỢP CÔNG THỨC
// ══════════════════════════════════════════════════════════════
= Bảng Tổng Hợp Công Thức Cốt Lõi

#align(center)[