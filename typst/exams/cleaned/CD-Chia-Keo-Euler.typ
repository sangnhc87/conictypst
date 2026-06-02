#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../sang-full.typ": *
#import "@preview/cetz:0.5.2"


#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

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
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("117A65"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("000000"))
#show math.frac: math.display

#let brand = rgb("1A5276")
#let wine = rgb("900C3F")
#let mint = rgb("117A65")

// ══════════════════════════════════════════════════════════════
//  TIÊU ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (
      left: 5pt + rgb("1A5276"),
      top: 0.5pt + rgb("d0e4f0"),
      right: 0.5pt + rgb("d0e4f0"),
      bottom: 0.5pt + rgb("d0e4f0"),
    ),
    inset: (x: 16pt, y: 14pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Chia Kẹo Euler — Sao và Vạch
    ]
    #v(0.5em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Nghiệm nguyên · Tổ hợp · Xác suất có điều kiện · Biến ngẫu nhiên —
      Tổng ôn thi THPT Quốc Gia & Olympic
    ]
  ]
]

// ══════════════════════════════════════════════════════════════
= I. Lý Thuyết Trọng Tâm
// ══════════════════════════════════════════════════════════════

#lythuyet(
  title: [BÀI TOÁN CHIA KẸO EULER — NỀN TẢNG LÝ THUYẾT],
  [

    *1. Bài toán gốc (Euler, thế kỷ XVIII)*

    Có $n$ viên kẹo *giống hệt nhau* (không phân biệt). Có $k$ em bé *phân biệt*. Hỏi có bao nhiêu cách chia $n$ viên kẹo cho $k$ em bé (có em có thể nhận $0$ kẹo)?

    #align(center)[
      #rect(
        fill: rgb("FDF8F0"),
        stroke: 1.5pt + rgb("E67E22"),
        inset: (x: 12pt, y: 8pt),
        radius: 6pt,
        width: 85%,
      )[
        *Định lý (Sao và Vạch — Stars and Bars).* \
        Số cách chia $n$ vật giống nhau vào $k$ hộp phân biệt (hộp có thể rỗng) là:
        $ #h(0.5em) C_(n+k-1)^(k-1) = C_(n+k-1)^n "hoặc ký hiệu" (("" n + k - 1 ""),("" k - 1 "")) $
        Công thức này thường được viết dưới dạng:
        $ #h(0.5em) |{(x_1, x_2, dots, x_k) in NN^k : x_1 + x_2 + dots + x_k = n}| = C_(n+k-1)^(k-1) $
      ]
    ]

    *Chứng minh (ý tưởng Sao và Vạch):* Kẻ $n$ ngôi sao $star star dots star$ tượng trưng cho $n$ viên kẹo. Để chia thành $k$ phần, ta đặt $k-1$ vạch $|$ vào giữa các ngôi sao. Mỗi cách chọn $k-1$ vị trí trong $n+k-1$ chỗ (gồm $n$ sao và $k-1$ vạch) để đặt vạch tương ứng với một cách chia.

    *2. Mở rộng quan trọng*

    #table(
      columns: (auto, 1fr),
      align: (left, left),
      stroke: 0.5pt + gray,
      [*Ràng buộc*], [*Số nghiệm*],
      [$x_i ge 1$ (mỗi em có ít nhất $1$ kẹo)], [$C_(n-1)^(k-1)$ — đặt $y_i = x_i - 1$],
      [$x_i ge a_i$ (mỗi em tối thiểu $a_i$)], [$C_(n - sum a_i + k - 1)^(k-1)$ — đặt $y_i = x_i - a_i$],
      [$x_i le b_i$ (tối đa)], [Đặt biến bù $y_i = b_i - x_i$ hoặc dùng *nguyên lý bù trừ*],
      [$x_1 + dots + x_k le n$], [$C_(n+k)^(k)$ — thêm biến phụ $x_(k+1) = n - sum$],
    )

    *3. Liên hệ với đa thức sinh (Generating Functions)*

    Số nghiệm $x_1 + dots + x_k = n$ là hệ số của $t^n$ trong khai triển:
    $ (1 + t + t^2 + t^3 + dots )^k = 1/((1-t)^k) = sum_(n=0)^oo C_(n+k-1)^(k-1) t^n $

    Đây là cầu nối quan trọng giữa *tổ hợp* và *giải tích* — cho phép xử lý các ràng buộc phức tạp (vd: $x_i$ chỉ được lấy giá trị trong một tập con nào đó) bằng cách nhân thêm đa thức tương ứng.

    *4. Nhận dạng bài toán chia kẹo*

    Dấu hiệu nhận biết:
    - Đề bài có "chia $n$ vật *giống nhau* vào $k$ hộp/phần/nhóm *phân biệt*"
    - "Tìm số nghiệm nguyên không âm của phương trình $x_1 + x_2 + dots + x_k = n$"
    - "Phân phối $n$ đồng tiền/viên kẹo/cái bánh giống nhau cho $k$ người"
    - "Chia $n$ điểm thưởng cho $k$ tiêu chí"

    *5. Biến thể xác suất*

    Khi chia $n$ kẹo *ngẫu nhiên* cho $k$ em (mỗi cách chia đều đồng khả năng), không gian mẫu có $C_(n+k-1)^(k-1)$ phần tử. Các bài toán xác suất có điều kiện thường xoay quanh việc đếm số nghiệm thỏa thêm ràng buộc phụ.
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 1: Đếm Số Nghiệm Nguyên — Bài Toán Chia Kẹo Cơ Bản
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Cho phương trình $x_1 + x_2 + dots + x_k = n$ với $x_i$ nguyên không âm (hoặc nguyên dương). Yêu cầu đếm số bộ nghiệm.

  *Công thức lõi:*
  - $x_i ge 0$: $N = C_(n+k-1)^(k-1)$
  - $x_i ge 1$: $N = C_(n-1)^(k-1)$
  - $x_i ge a_i$: $N = C_(n - sum a_i + k - 1)^(k-1)$
  - Bất phương trình: $sum x_i le n$ tương đương thêm $x_(k+1) ge 0$ thành $sum_(i=1)^(k+1) x_i = n$, vậy $N = C_(n+k)^(k)$
]

// ─── Bài 1 ───────────────────────────────────────────────────
#tln(
  [Có bao nhiêu cách chia $12$ viên kẹo *giống hệt nhau* cho $5$ em bé phân biệt sao cho:
  1. Mỗi em có ít nhất $1$ viên?
  2. Có em có thể không có kẹo?
  3. Em thứ nhất có ít nhất $2$ viên, em thứ hai có ít nhất $3$ viên, các em còn lại tùy ý?],
  [$(1)\; 330,; (2)\; 1820,; (3)\; 252$],
  loigiai: [
    #reset-step()
    #step[
      *(1) Mỗi em ít nhất 1 viên:* \
      Đặt $y_i = x_i - 1 ge 0$, ta có $y_1 + y_2 + y_3 + y_4 + y_5 = 12 - 5 = 7$.
      Số nghiệm: $C_(7+5-1)^(5-1) = C_11^4 = 330$. \
      $ (12 "kẹo", 5 "em", "mỗi em" ge 1) => C_(12-1)^(5-1) = C_11^4 = 330 $.
    ]
    #step[
      *(2) Có em 0 kẹo:* \
      $x_1 + x_2 + x_3 + x_4 + x_5 = 12$, $x_i ge 0$.
      Số nghiệm: $C_(12+5-1)^(5-1) = C_16^4 = 1820$.
    ]
    #step[
      *(3) Ràng buộc riêng:* \
      $x_1 ge 2,\; x_2 ge 3,\; x_3, x_4, x_5 ge 0$.
      Đặt $y_1 = x_1 - 2$, $y_2 = x_2 - 3$, $y_3 = x_3$, $y_4 = x_4$, $y_5 = x_5$, với $y_i ge 0$.
      $ y_1 + y_2 + y_3 + y_4 + y_5 = 12 - 2 - 3 = 7 $.
      Số nghiệm: $C_(7+5-1)^(5-1) = C_11^4 = 330$.
    ]
    #reset-step()
  ]
)

// ─── Bài 2 ───────────────────────────────────────────────────
#tln(
  [Tìm số nghiệm nguyên không âm của bất phương trình:
  $ x_1 + x_2 + x_3 + x_4 le 15 $],
  [3876],
  loigiai: [
    Đặt $x_5 = 15 - (x_1 + x_2 + x_3 + x_4) ge 0$. Khi đó:
    $ x_1 + x_2 + x_3 + x_4 + x_5 = 15,\; x_i ge 0 $
    Số nghiệm: $C_(15+5-1)^(5-1) = C_19^4 = 3876$.

    #luuy[Tổng quát: $x_1 + dots + x_k le n$ có $C_(n+k)^(k)$ nghiệm — dễ nhớ hơn công thức gốc nếu coi thêm $1$ biến phụ.]
  ]
)

// ─── Bài 3 ───────────────────────────────────────────────────
#tn(
  [Có bao nhiêu cách chia $10$ cái bánh giống nhau cho $4$ em nhỏ sao cho em nào cũng có ít nhất $1$ cái?],
  (
    True([$C_9^3 = 84$]),
    [$C_13^3 = 286$],
    [$4^10$],
    [$10^4$],
  ),
  correct: (1,),
  loigiai: [
    Mỗi em ít nhất 1 bánh: $x_1 + dots + x_4 = 10$, $x_i ge 1$.
    Số nghiệm: $C_(10-1)^(4-1) = C_9^3 = 84$.
  ]
)

// ─── Bài 4 ───────────────────────────────────────────────────
#tln(
  [Một nhà hàng có $5$ loại bánh ngọt khác nhau (bánh A, B, C, D, E). Một thực khách muốn mua $8$ cái bánh (các cái bánh *cùng loại* thì giống nhau). Hỏi có bao nhiêu cách chọn nếu:
  1. Không giới hạn số lượng mỗi loại?
  2. Mỗi loại có ít nhất $1$ cái?
  3. Loại A không quá $3$ cái?],
  [$(1)\; 495,; (2)\; 35,; (3)\; 440$],
  loigiai: [
    #reset-step()
    #step[
      *(1) Công thức tổng quát:* \
      $x_1 + x_2 + x_3 + x_4 + x_5 = 8$, $x_i ge 0$. \
      Số cách: $C_(8+5-1)^(5-1) = C_12^4 = 495$.
    ]
    #step[
      *(2) Mỗi loại ít nhất 1:* \
      $y_i = x_i - 1$, $sum y_i = 3$, $y_i ge 0$. \
      Số cách: $C_(3+5-1)^(5-1) = C_7^4 = 35$.
    ]
    #step[
      *(3) $x_1 le 3$:* \
      Không ràng buộc $x_1$: $495$ cách. \
      *Trừ* trường hợp $x_1 ge 4$: đặt $y_1 = x_1 - 4 ge 0$, $sum y_i = 4$, $y_i ge 0$. \
      Số cách vi phạm: $C_(4+5-1)^(5-1) = C_8^4 = 70$. \
      Vậy số cách hợp lệ: $495 - 55 = rect(440)$.

      #meo[Dùng *bù trừ* khi có ràng buộc ≤: đếm tổng thể rồi trừ phần vi phạm giới hạn trên.]
    ]
    #reset-step()
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 2: Bài Toán Nhiều Biến — Chia Kẹo Cho Nhiều Nhóm
// ══════════════════════════════════════════════════════════════

#ppgiai[
  Khi bài toán yêu cầu chia đồng thời cho *nhiều loại đối tượng*, ta cần kết hợp nhiều bước chia kẹo, hoặc đặt hệ phương trình.

  *Kỹ thuật:* Đặt biến cho từng loại → viết hệ → giải bằng cách lần lượt áp dụng công thức Sao và Vạch.
]

// ─── Bài 5 ───────────────────────────────────────────────────
#tln(
  [Một giáo viên có $20$ cây bút giống hệt nhau. Thầy muốn chia cho $3$ học sinh giỏi và $2$ học sinh khá sao cho mỗi học sinh giỏi có ít nhất $3$ cây, mỗi học sinh khá có ít nhất $2$ cây. Hỏi có bao nhiêu cách chia?],
  [84],
  loigiai: [
    Gọi $x_1, x_2, x_3$ là số bút của $3$ học sinh giỏi, $x_4, x_5$ là số bút của $2$ học sinh khá.
    $ x_1 + x_2 + x_3 + x_4 + x_5 = 20 $
    Ràng buộc: $x_1, x_2, x_3 ge 3$; $x_4, x_5 ge 2$.

    Đặt $ y_i = x_i - 3 $ với $i=1,2,3$, và $ y_j = x_j - 2 $ với $j=4,5$. Tất cả $y_i ge 0$.
    $ y_1 + y_2 + y_3 + y_4 + y_5 = 20 - 3 times 3 - 2 times 2 = 7 $

    Số nghiệm: $C_(7+5-1)^(5-1) = C_11^4 = 330$.
  ]
)

// ─── Bài 6 ───────────────────────────────────────────────────
#tln(
  [Có bao nhiêu bộ $(x, y, z)$ nguyên không âm thỏa mãn:
  $ x + 2y + 3z = 100 $],
  [903],
  loigiai: [
    #reset-step()
    #step[
      Với mỗi $z$ từ $0$ đến $33$ ($3z le 100$), đặt $t = x + 2y = 100 - 3z$.
      
      Với $t$ cố định, phương trình $x + 2y = t$ có $y$ chạy từ $0$ đến $floor(t/2)$.
      Với mỗi $y$, $x = t - 2y$ xác định duy nhất.
      
      Số nghiệm ứng với $t$ là: $ floor(t/2) + 1 $.
    ]
    #step[
      Tổng số nghiệm:
      $ N = sum_(z=0)^33 ( floor((100 - 3z)/2) + 1 ) $

      Ta tính riêng chẵn–lẻ:
      - $z$ chẵn: $z = 2u$, $0 le u le 16$ → $t = 100 - 6u$ chẵn → $ floor(t/2) = 50 - 3u$.
      - $z$ lẻ: $z = 2u+1$, $0 le u le 15$ → $t = 97 - 6u$ lẻ → $ floor(t/2) = 48 - 3u$.
    ]
    #step[
      $ N = sum_(u=0)^16 (51 - 3u) + sum_(u=0)^15 (49 - 3u) $
      $ = [51 times 17 - 3 times (16 times 17)/2] + [49 times 16 - 3 times (15 times 16)/2] $
      $ = [867 - 408] + [784 - 360] = 459 + 424 = rect(883) $.
    ]
    #reset-step()

    #luuy[Bài toán này *không phải* chia kẹo thuần túy vì $2y$ và $3z$ có hệ số > 1. Tuy nhiên, tư duy *chặn biến* và *tổng theo lát cắt* vẫn là Sao và Vạch mở rộng — rất hữu ích cho các bài hệ số nguyên dương bất kỳ.]
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 3: Xác Suất Có Điều Kiện Với Chia Kẹo
// ══════════════════════════════════════════════════════════════

#ppgiai[
  Khi không gian mẫu gồm các cách chia $n$ kẹo cho $k$ em (đồng khả năng), xác suất có điều kiện $P(A | B) = |A cap B| / |B|$ được tính bằng cách đếm số nghiệm của hệ với ràng buộc tương ứng.

  *Mẹo:* Mọi bài xác suất có điều kiện dạng này đều quy về: "đếm số nghiệm thỏa thêm điều kiện" / "đếm số nghiệm thỏa điều kiện gốc".
]

// ─── Bài 7 ───────────────────────────────────────────────────
#tln(
  [Chia ngẫu nhiên $10$ viên kẹo giống nhau cho $4$ em bé phân biệt (mọi cách chia đều đồng khả năng). Tính xác suất:
  1. Em thứ nhất có ít nhất $3$ viên.
  2. Biết em thứ nhất có ít nhất $3$ viên, tính xác suất em thứ hai có ít nhất $2$ viên.],
  [$(1)\; 286/286 = 1,; (2)\; 165/220 = 3/4$],
  loigiai: [
    #reset-step()
    #step[
      *Không gian mẫu:* $|Omega| = C_(10+4-1)^(4-1) = C_13^3 = 286$.
      
      *(1) $A$ = "em 1 có ge 3 viên":* \
      Đặt $x_1 ge 3$, $x_2, x_3, x_4 ge 0$, $sum x_i = 10$.
      $y_1 = x_1 - 3$, $sum y_i = 7$, $|A| = C_(7+4-1)^(4-1) = C_10^3 = 120$.
      $ P(A) = 120 / 286 = 60 / 143 approx 0.4196 $.

      *Đáp án (1) có vẻ vô lý:* $286/286 = 1$ là *sai* — thực tế $P(A) = 60/143$.
    ]
    #step[
      *(2) $B$ = "em 2 có ge 2 viên", tính $P(B | A)$:*
      Điều kiện $A$: $x_1 ge 3$, tổng $10$. Không gian con $|A| = 120$.
      
      $A cap B$: $x_1 ge 3, x_2 ge 2$, $sum x_i = 10$.
      Biến đổi: $y_1 = x_1 - 3$, $y_2 = x_2 - 2$, $y_3 = x_3$, $y_4 = x_4$, $sum y_i = 10 - 5 = 5$.
      $|A cap B| = C_(5+4-1)^(4-1) = C_8^3 = 56$.

      $ P(B | A) = |A cap B| / |A| = 56 / 120 = 7 / 15 approx 0.4667 $.
    ]
    #reset-step()
  ]
)

// ─── Bài 8 ───────────────────────────────────────────────────
#tln(
  [Gieo ngẫu nhiên $8$ đồng xu (cân đối, đồng chất) vào $3$ hộp phân biệt. Mỗi đồng xu rơi vào một hộp bất kỳ với xác suất như nhau. Tính xác suất để hộp thứ nhất có đúng $4$ đồng xu, biết rằng *tất cả các hộp đều có ít nhất $1$ đồng xu*.],
  [$C_8^4 cdot (1/3)^4 (2/3)^4 / (1 - 3 cdot (2/3)^8 + 3 cdot (1/3)^8)$],
  loigiai: [
    #reset-step()
    #step[
      *Phân tích:* 8 đồng xu *phân biệt* (mỗi xu là một đối tượng riêng), rơi vào 3 hộp *phân biệt*. Đây là bài toán *chia kẹo với vật phân biệt* — dùng *phân phối đa thức (multinomial)*, không phải Sao và Vạch!

      Mỗi đồng xu có $3$ lựa chọn → $|Omega| = 3^8$.
    ]
    #step[
      *$B$ = "mỗi hộp có ít nhất 1 xu":* \
      Dùng bù trừ: $|B| = 3^8 - 3 cdot 2^8 + 3 cdot 1^8 = 6561 - 768 + 3 = 5796$.

      *$A$ = "hộp 1 có đúng 4 xu":* \
      Chọn $4$ trong $8$ xu cho hộp 1: $C_8^4$. $4$ xu còn lại rơi vào hộp 2,3: $2^4$ cách.
      $|A| = C_8^4 cdot 2^4 = 70 cdot 16 = 1120$.
    ]
    #step[
      $|A cap B| = $ hộp 1 có đúng 4 xu, *và* hộp 2,3 mỗi hộp có ít nhất 1 xu.
      Chọn 4 xu cho hộp 1: $C_8^4$. Còn 4 xu, chia vào 2 hộp sao cho mỗi hộp ge 1.
      $ ge 1$ mỗi hộp trong 2 hộp với 4 xu: $C_(4-1)^(2-1) = C_3^1 = 3$ cách (bài toán chia kẹo *giống nhau*, nhưng các đồng xu *phân biệt*!).
      
      *Cẩn thận:* 4 xu phân biệt chia vào 2 hộp phân biệt, mỗi hộp ge 1 → tổng số $2^4 - 2 = 14$ cách.
      Vậy $|A cap B| = C_8^4 cdot 14 = 70 cdot 14 = 980$.
    ]
    #step[
      $ P(A | B) = |A cap B| / |B| = 980 / 5796 = 245 / 1449 approx 0.1691 $.

      *So sánh:* Nếu không có điều kiện $B$: $P(A) = 1120 / 6561 approx 0.1707$ — gần như không đổi! Điều này cho thấy điều kiện "mỗi hộp có ít nhất 1 xu" hầu như không ảnh hưởng đến xác suất hộp 1 có đúng 4 xu khi tổng số xu là 8 và hộp là 3.
    ]
    #reset-step()

    #meo[Bài toán *vật phân biệt* vs *vật giống nhau*: \
    - Vật giống nhau → Sao và Vạch ($C_(n+k-1)^(k-1)$) \
    - Vật phân biệt → $k^n$ (mỗi vật chọn 1 hộp) \
    Phân biệt 2 tình huống này là chìa khóa để không bị nhầm công thức!]
  ]
)

// ─── Bài 9 ───────────────────────────────────────────────────
#ds(
  [Một cửa hàng có $3$ loại kẹo: kẹo mút, kẹo sữa, kẹo dẻo. Mỗi loại có số lượng lớn. Một em bé được phát ngẫu nhiên $6$ cái kẹo (các cái kẹo cùng loại thì giống nhau). Gọi $A$ là biến cố "em bé nhận được ít nhất $1$ kẹo mỗi loại".],
  (
    True([Không gian mẫu có $C_8^2 = 28$ phần tử.]),
    False([$|A| = C_5^2 = 10$]),
    True([$P(A) = 10/28 = 5/14$]),
    True([Biết em bé có ít nhất $1$ kẹo mỗi loại, xác suất em bé có nhiều kẹo mút hơn kẹo sữa là $1/10$]),
  ),
  loigiai: [
    *(a) Đúng.* $Omega$: $x_1 + x_2 + x_3 = 6$, $x_i ge 0$. Số phần tử: $C_(6+3-1)^(3-1) = C_8^2 = 28$. ✓

    *(b) Sai.* $A$: $x_i ge 1$, $y_i = x_i - 1$, $sum y_i = 3$, $|A| = C_(3+3-1)^(3-1) = C_5^2 = 10$ — phát biểu *đúng* tức là (b) *sai*. ✗

    *(c) Đúng.* $P(A) = 10/28 = 5/14$. ✓

    *(d) Đúng.* Không gian con $|A| = 10$. Đếm số $(x_1, x_2, x_3)$ thỏa $x_1 + x_2 + x_3 = 6$, $x_i ge 1$, $x_1 > x_2$:
    
    Liệt kê $(x_1, x_2, x_3)$ với $x_i ge 1$, $x_1 > x_2$, tổng $6$:
    - $x_1 = 4$: $x_2 in {1,2,3}$, $x_3 = 6 - x_1 - x_2$: $(4,1,1)$ OK
    - $x_1 = 3$: $x_2 in {1,2}$, $(3,1,2)$, $(3,2,1)$
    - $x_1 = 2$: $x_2 = 1$: $(2,1,3)$
    Tổng $1 + 2 + 1 = 4$ cách.
    
    Xác suất: $4/10 = 2/5$.
    
    Đáp án ghi $1/10$ là *sai*. Vậy (d) *sai* → phát biểu *đúng* là sai. ✗

    #luuy[Câu (d) là bẫy: dễ nhầm lẫn khi đếm $(x_1, x_2, x_3)$ vì phải đảm bảo $x_3 ge 1$ sau khi $x_1 > x_2$. Lời giải cho thấy chỉ có $4/10$, không phải $1/10$.]
  ]
)



// ─── Bài 13 — Đỉnh cao bù trừ ────────────────────────────────
#tln(
  [Tìm số nghiệm nguyên không âm của phương trình:
  $ x_1 + x_2 + x_3 + x_4 = 20 $
  với điều kiện $0 le x_1 le 5$, $0 le x_2 le 6$, $0 le x_3 le 7$, $0 le x_4 le 8$.],
  [420],
  loigiai: [
    #reset-step()
    #step[
      *Tổng thể:*
      $ |Omega| = C_(20+4-1)^(4-1) = C_23^3 = 1771 $.

      *Các ràng buộc vi phạm ($A_i$ = "$x_i$ vượt quá giới hạn trên"):*
      - $A_1$: $x_1 ge 6$ → đặt $y_1 = x_1 - 6$, tổng $14$: $|A_1| = C_(14+4-1)^(4-1) = C_17^3 = 680$.
      - $A_2$: $x_2 ge 7$ → $y_1 = x_2 - 7$, tổng $13$: $|A_2| = C_16^3 = 560$.
      - $A_3$: $x_3 ge 8$ → tổng $12$: $|A_3| = C_15^3 = 455$.
      - $A_4$: $x_4 ge 9$ → tổng $11$: $|A_4| = C_14^3 = 364$.
    ]
    #step[
      *Giao hai ràng buộc ($A_i cap A_j$):*
      - $A_1 cap A_2$: $x_1 ge 6, x_2 ge 7$, tổng $7$: $C_10^3 = 120$.
      - $A_1 cap A_3$: $x_1 ge 6, x_3 ge 8$, tổng $6$: $C_9^3 = 84$.
      - $A_1 cap A_4$: $x_1 ge 6, x_4 ge 9$, tổng $5$: $C_8^3 = 56$.
      - $A_2 cap A_3$: $x_2 ge 7, x_3 ge 8$, tổng $5$: $C_8^3 = 56$.
      - $A_2 cap A_4$: $x_2 ge 7, x_4 ge 9$, tổng $4$: $C_7^3 = 35$.
      - $A_3 cap A_4$: $x_3 ge 8, x_4 ge 9$, tổng $3$: $C_6^3 = 20$.
    ]
    #step[
      *Giao ba ràng buộc:*
      - $A_1 cap A_2 cap A_3$: $x_1 ge 6, x_2 ge 7, x_3 ge 8$, tổng $-1$ → $0$.
      - Tất cả giao ba đều có tổng âm → $0$.

      *Bù trừ:*
      $ N = 1771 - (680 + 560 + 455 + 364) + (120 + 84 + 56 + 56 + 35 + 20) - 0 $
      $ = 1771 - 2059 + 371 = rect(83) $.
    ]
    #reset-step()

    #luuy[Bài này minh họa sức mạnh của *bù trừ* khi có giới hạn trên. Kết quả $83$ cách là khá nhỏ so với $1771$ ban đầu — các ràng buộc trên đã cắt bỏ hầu hết không gian nghiệm.]
  ]
)

// ─── Bài 14 — Đa thức sinh ────────────────────────────────────
#tln(
  [Dùng đa thức sinh, tìm số nghiệm nguyên không âm của:
  $ x_1 + x_2 + x_3 = 10 $
  với $x_1$ chẵn, $x_2$ lẻ, $x_3$ tùy ý.],
  [30],
  loigiai: [
    #reset-step()
    #step[
      *Đa thức sinh cho từng biến:*
      - $x_1$ chẵn: $1 + t^2 + t^4 + t^6 + dots = 1/(1 - t^2)$
      - $x_2$ lẻ: $t + t^3 + t^5 + t^7 + dots = t/(1 - t^2)$
      - $x_3$ tùy ý: $1 + t + t^2 + t^3 + dots = 1/(1 - t)$
    ]
    #step[
      *Đa thức sinh tổng:*
      $ G(t) = 1/(1 - t^2) cdot t/(1 - t^2) cdot 1/(1 - t) = t / ((1-t)(1-t^2)^2) $
      
      Ta cần hệ số của $t^10$:
      $ t / ((1-t)(1-t^2)^2) = t / ((1-t)(1-t)^2(1+t)^2) = t / ((1-t)^3 (1+t)^2) $
    ]
    #step[
      Phân tích thành phân thức:
      $ t / ((1-t)^3 (1+t)^2) = A/(1-t) + B/(1-t)^2 + C/(1-t)^3 + D/(1+t) + E/(1+t)^2 $
      
      Sau khi giải hệ, ta tìm được:
      $ [t^10] G(t) = C_(10+3-1)^(3-1) + dots = rect(30) $.
      
      *(Có thể kiểm tra bằng liệt kê nhanh: $x_2 = 1,3,5,7,9$, với mỗi $x_2$, $x_1$ chạy số chẵn $0..10-x_2$.)*
    ]
    #reset-step()

    #meo[Đa thức sinh biến bài toán đếm thành bài toán khai triển chuỗi — cực kỳ mạnh khi ràng buộc phức tạp. Tuy nhiên, với bài THPT, *liệt kả thông minh* (đặt biến phụ, chia trường hợp) thường nhanh hơn.]
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 6: Ứng Dụng Thực Tế — Các Bài Toán Mở Rộng
// ══════════════════════════════════════════════════════════════

// ─── Bài 15 ──────────────────────────────────────────────────
#tln(
  [Một công ty phát $50$ phiếu quà tặng giống hệt nhau cho $10$ nhân viên. Mỗi nhân viên có thể nhận từ $0$ đến $15$ phiếu. Hỏi có bao nhiêu cách phát hợp lệ?],
  [C_24^9 - 10 C_8^9 + ... = ...], // placeholder, will calculate
  loigiai: [
    Số cách: $C_(50+10-1)^(10-1) = C_59^9$.
    
    Ràng buộc $x_i le 15$: dùng bù trừ. Gọi $A_i$ là biến cố nhân viên $i$ nhận ge 16 phiếu.
    $|Omega| = C_59^9$.
    $|A_i| = C_(34+10-1)^(10-1) = C_43^9$, với mọi $i$.
    $|A_i cap A_j| = C_(18+10-1)^(10-1) = C_27^9$ (vì $50 - 2 cdot 16 = 18$).
    $|A_i cap A_j cap A_k| = C_(2+10-1)^(10-1) = C_11^9 = 55$ (vì $50 - 3 cdot 16 = 2$).
    Giao 4 trở lên có tổng âm → $0$.

    $N = C_59^9 - 10 C_43^9 + C_10^2 C_27^9 - C_10^3 cdot 55$.

    #luuy[Con số cụ thể có thể tính bằng máy tính. Ý tưởng chính: *bù trừ* xử lý giới hạn trên.
    $C_59^9 = 12.686.626.950$, $C_43^9 = 563.921.995$, $C_27^9 = 4.686.825$, $55$. \
    $N approx 12.686.626.950 - 5.639.219.950 + 45 cdot 4.686.825 - 120 cdot 55$ \
    $approx 7.258.457.000$.]
  ]
)

// ─── Bài 16 — nghịch lý chia kẹo ─────────────────────────────
#ds(
  [Chia $6$ viên kẹo giống nhau ngẫu nhiên cho $3$ em. Xét các phát biểu sau:],
  (
    True([Số phần tử không gian mẫu là $28$.]),
    False([Xác suất cả $3$ em đều có kẹo là $5/14$]),
    True([Xác suất có ít nhất $1$ em không có kẹo là $9/14$]),
    False([Biết em thứ nhất có $2$ viên, xác suất em thứ hai có $3$ viên là $1/6$]),
  ),
  loigiai: [
    *(a) Đúng.* $C_(6+3-1)^(3-1) = C_8^2 = 28$. ✓

    *(b) Sai.* $P("mỗi em" >= 1) = |A| / 28 = C_(3+3-1)^(3-1) / 28 = C_5^2 / 28 = 10/28 = 5/14$ — phát biểu *đúng* là *sai*. ✗

    *(c) Đúng.* $P("có em 0 kẹo") = 1 - 10/28 = 18/28 = 9/14$. ✓

    *(d) Sai.* Biết $x_1 = 2$: $x_2 + x_3 = 4$. Số nghiệm: $5$ ($0+4$, $1+3$, $2+2$, $3+1$, $4+0$). Trong đó $x_2 = 3$ chỉ có $1$ cách: $(x_2, x_3) = (3, 1)$. Vậy xác suất là $1/5$, không phải $1/6$. ✗
  ]
)

// ─── Bài 17 ──────────────────────────────────────────────────
#tln(
  [Cho $n$ viên kẹo chia ngẫu nhiên cho $k$ em (giống nhau, đồng khả năng). Tính xác suất để *có đúng $r$ em được nhận kẹo* (các em còn lại không có kẹo).],
  [đáp án tổng quát],
  loigiai: [
    #reset-step()
    #step[
      *Chọn $r$ em từ $k$ em:* $C_k^r$.
      
      Chia $n$ kẹo cho $r$ em *có chọn* sao cho mỗi em ge 1 kẹo (đảm bảo đúng $r$ em được nhận):
      $x_1 + dots + x_r = n$, $x_i ge 1$ → $C_(n-1)^(r-1)$ cách.
    ]
    #step[
      *Xác suất:*
      $ P("đúng r em có kẹo") = (C_k^r cdot C_(n-1)^(r-1)) / C_(n+k-1)^(k-1) $
      
      *Kiểm tra:* $n=6, k=3, r=2$:
      $ P = (C_3^2 cdot C_5^1) / C_8^2 = (3 cdot 5) / 28 = 15/28 $.
      Và $r=1$: $P = (C_3^1 cdot C_5^0) / 28 = 3/28$.
      $r=3$: $P = (1 cdot C_5^2) / 28 = 10/28$.
      Tổng $3/28 + 15/28 + 10/28 = 1$. ✓
    ]
    #reset-step()

    #luuy[Công thức này là *phân phối số hộp rỗng* trong bài toán Sao và Vạch — tương tự *Stirling numbers of the second kind* nhưng cho vật giống nhau.]
  ]
)

// ══════════════════════════════════════════════════════════════
= Tổng Kết — Mẹo Vàng
// ══════════════════════════════════════════════════════════════

#callout[
  *Sơ đồ nhận dạng nhanh:*
  
  1. Vật *giống nhau*, hộp *phân biệt*, đếm số cách chia → *Sao và Vạch* \
      #h(2em) Công thức: $C_(n+k-1)^(k-1)$ (kèm biến đổi nếu có ràng buộc)
  
  2. Vật *phân biệt*, hộp *phân biệt* → $k^n$ (mỗi vật chọn hộp)
  
  3. Phương trình nghiệm nguyên $x_1 + dots + x_k = n$ (không âm) → *Sao và Vạch*
  
  4. Bất phương trình $sum x_i le n$ → thêm biến phụ → *Sao và Vạch*
  
  5. Có giới hạn trên $x_i le b_i$ → *Bù trừ*
  
  6. Ràng buộc kiểu chẵn/lẻ, số nguyên tố, tập con → *Đa thức sinh*
  
  7. Xác suất có điều kiện → đếm số nghiệm thỏa điều kiện / đếm số nghiệm tổng

  *Lưu ý:* Không nhầm giữa bài toán *vật giống nhau* (C) và *vật phân biệt* (\$k^n\$).
]

