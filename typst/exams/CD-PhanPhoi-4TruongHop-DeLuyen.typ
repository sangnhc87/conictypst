#import "../sang-exam.typ": *
#import "../template.typ": *

#set page(paper: "a4", margin: (x: 1.45cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.86em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0B1F54"), rgb("1A237E"), rgb("3949AB"), angle: 135deg),
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.7em,
  below: 1.1em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.3em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("283593")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("283593"), size: 12pt, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 1em,
  below: 0.45em,
  text(fill: rgb("1565C0"), size: 11pt, weight: "bold", "✦ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let col-blue = rgb("1565C0")
#let col-green = rgb("2E7D32")
#let col-amber = rgb("E65100")
#let col-violet = rgb("6A1B9A")
#let col-navy = rgb("1A237E")

#let intro-box(title: none, body) = block(
  fill: rgb("EEF3FF"),
  stroke: (left: 4pt + col-navy, rest: 0.5pt + rgb("CFD8DC")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-navy, weight: "bold")[#title]
    #v(0.25em)
  ]
  #body
]

#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[Hướng giải]
  #v(0.3em)
  #body
]

#let cach2-box(body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + col-violet, rest: 0.5pt + rgb("CE93D8")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-violet, weight: "bold", size: 10.5pt)[Hướng giải bằng hàm sinh]
  #v(0.3em)
  #body
]

#let ans-box(body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + col-green, rest: 0.5pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[Kết luận]
  #v(0.25em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.5pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-amber, weight: "bold")[Lưu ý chấm điểm]
  #v(0.25em)
  #body
]

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("09152E"), rgb("102A63"), rgb("1A237E"), rgb("3949AB"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 24pt),
  )[
    #text(fill: rgb("C5CAE9"), size: 11pt, weight: "bold", tracking: 2pt)[BỘ ĐỀ LUYỆN PHÂN TẦNG]
    #v(0.5em)
    #text(fill: white, size: 21pt, weight: "bold")[Luyện 16 Câu - 4 Case Phân Phối Vật Vào Hộp]
    #v(0.35em)
    #text(fill: rgb("E8EAF6"), size: 13pt)[Nhận biết · Thông hiểu · Vận dụng · Vận dụng cao]
    #v(0.5em)
    #text(fill: rgb("C5CAE9"), size: 10.5pt, style: "italic")[(Mỗi câu đều có đáp án và lời giải chi tiết)]
  ]
]

#v(0.9em)

#intro-box(title: [Cách dùng bộ đề này])[
  - Mỗi mức độ có đúng $4$ câu, tương ứng đủ $4$ case.

  - Case $1$ ưu tiên tư duy trực tiếp hoặc nguyên lý bù.

  - Case $2$, $3$, $4$ ưu tiên đúng công cụ của chuyên đề: OGF, EGF-Stirling, tích Euler.

  - Nên làm theo đúng thứ tự mức độ, vì các câu sau dùng lại tư duy của các câu trước.
]

#resetexamstate()

= I. Mức Nhận Biết

=== Câu 1 — Case 1
#tln(
  id: "DL-1",
  [Xếp $4$ học sinh phân biệt $A, B, C, D$ vào $2$ phòng phân biệt $P_1, P_2$. Hỏi có bao nhiêu cách xếp?],
  [$16$ cách],
  loigiai: [
    #cach1-box[
      Vì mỗi học sinh có đúng $2$ lựa chọn phòng nên bốn học sinh độc lập tạo ra
      $N = 2^4 = 16.$

      Đây là mô hình điển hình của Case $1$: vật có tên, hộp có tên. Ta chỉ hỏi “mỗi người đi vào đâu”.
    ]
    #ans-box[Có tất cả *16 cách* xếp học sinh.]
  ],
)

=== Câu 2 — Case 2
#tln(
  id: "DL-2",
  [Chia $6$ viên bi trắng giống nhau vào $3$ hộp phân biệt $A, B, C$. Hỏi có bao nhiêu cách chia?],
  [$28$ cách],
  loigiai: [
    #cach2-box[
      Mỗi hộp có thể nhận $0, 1, 2, ...$ viên bi, nên OGF của một hộp là
      $frac(1, 1 - x).$

      Vì ba hộp có tên, OGF tổng là
      $G(x) = frac(1, (1 - x)^3).$

      Số cách chia chính là hệ số của $x^6$:
      $N = [x^6] frac(1, (1 - x)^3).$

      Dùng khai triển nhị thức âm,
      $frac(1, (1 - x)^3) = sum_(n=0)^(+oo) C_(n+2)^2 x^n.$

      Vậy
      $N = C_8^2 = 28.$
    ]
    #warn-box[Case $2$ luôn đi về nghiệm nguyên không âm hoặc OGF theo từng hộp.]
    #ans-box[Có tất cả *28 cách* chia bi.]
  ],
)

=== Câu 3 — Case 3
#tln(
  id: "DL-3",
  [Chia $5$ học sinh phân biệt thành đúng $2$ nhóm vô danh, không nhóm nào rỗng. Hỏi có bao nhiêu cách chia?],
  [$15$ cách],
  loigiai: [
    #cach2-box[
      Với đúng $2$ nhóm vô danh không rỗng, EGF chuẩn là
      $Phi_2(x) = frac((e^x - 1)^2, 2!).$

      Số cách cần tìm là
      $N = 5! [x^5] frac((e^x - 1)^2, 2!).$

      Khai triển:
      $frac((e^x - 1)^2, 2!) = frac(e^(2x) - 2 e^x + 1, 2).$

      Suy ra
      $N = frac(2^5 - 2, 2) = frac(32 - 2, 2) = 15.$
    ]
    #warn-box[Đừng quên chia cho $2!$, vì hai nhóm là vô danh.]
    #ans-box[Có tất cả *15 cách* chia nhóm.]
  ],
)

=== Câu 4 — Case 4
#tln(
  id: "DL-4",
  [Chia $6$ vật giống nhau vào nhiều nhất $3$ hộp vô danh. Hỏi có bao nhiêu kiểu chia?],
  [$7$ kiểu],
  loigiai: [
    #cach2-box[
      Đây là bài toán phân hoạch số $6$ thành không quá $3$ phần.

      OGF Euler là
      $P_3(x) = frac(1, (1 - x)(1 - x^2)(1 - x^3)).$

      Ta cần hệ số của $x^6$, tương đương đếm số nghiệm nguyên không âm của
      $a + 2 b + 3 c = 6.$

      - Nếu $c = 0$ thì $a + 2 b = 6$: có $4$ nghiệm.
      - Nếu $c = 1$ thì $a + 2 b = 3$: có $2$ nghiệm.
      - Nếu $c = 2$ thì $a + 2 b = 0$: có $1$ nghiệm.

      Tổng cộng
      $N = 4 + 2 + 1 = 7.$
    ]
    #ans-box[Có tất cả *7 kiểu chia*.]
  ],
)

= II. Mức Thông Hiểu

=== Câu 5 — Case 1
#tln(
  id: "DL-5",
  [Xếp $5$ học sinh phân biệt vào $3$ phòng phân biệt sao cho *mỗi phòng đều có ít nhất $1$ học sinh*. Hỏi có bao nhiêu cách xếp?],
  [$150$ cách],
  loigiai: [
    #cach1-box[
      *Cách 1: Sử dụng nguyên lý bù trừ*
      
      Tổng số cách xếp tự do là $N = 3^5 = 243.$
      Số cách có ít nhất một phòng trống:
      - Chọn một phòng trống: có $C_3^1 = 3$ cách.
      - Khi đó $5$ học sinh chỉ còn chọn trong $2$ phòng: có $2^5 = 32$ cách.
      Số cách cần trừ là $3 dot 32 = 96$.
      
      Nhưng các cách có hai phòng trống đã bị trừ hai lần, nên phải cộng lại:
      - Chọn $2$ phòng trống: có $C_3^2 = 3$ cách.
      - Khi đó tất cả học sinh dồn vào đúng một phòng: có $1$ cách.
      
      Vậy:
      $N = 243 - 96 + 3 = 150.$
    ]
    #cach2-box[
      *Cách 2: Sử dụng Hàm sinh lũy thừa EGF (không chia $3!$)*
      
      - Mỗi phòng nhận ít nhất $1$ học sinh $->$ EGF của một phòng là $e^x - 1$.
      - Vì 3 phòng là phân biệt, EGF tổng của hệ thống là:
        $E(x) = (e^x - 1)^3 = e^(3x) - 3e^(2x) + 3e^x - 1.$
      - Số cách xếp là hệ số của $frac(x^5, 5!)$ trong $E(x)$, tương đương:
        $N = 5! [x^5] E(x) = 3^5 - 3 dot 2^5 + 3 = 243 - 96 + 3 = 150.$
    ]
    #ans-box[Có tất cả *150 cách* xếp học sinh thỏa mãn.]
  ],
)

=== Câu 6 — Case 2
#tln(
  id: "DL-6",
  [Chia $7$ viên kẹo giống nhau vào $3$ hộp phân biệt sao cho mỗi hộp có ít nhất $1$ viên, riêng hộp $1$ có nhiều nhất $3$ viên. Hỏi có bao nhiêu cách chia?],
  [$12$ cách],
  loigiai: [
    #cach2-box[
      OGF của từng hộp là:

      - Hộp $1$: $x + x^2 + x^3$.
      - Hộp $2$: $frac(x, 1 - x)$.
      - Hộp $3$: $frac(x, 1 - x)$.

      Do đó
      $G(x) = (x + x^2 + x^3) lr(frac(x, 1 - x))^2 = frac(x^3 (1 + x + x^2), (1 - x)^2).$

      Ta cần hệ số của $x^7$, tức là hệ số của $x^4$ trong
      $frac(1 + x + x^2, (1 - x)^2).$

      Mà
      $[x^m] frac(1, (1 - x)^2) = m + 1.$

      Suy ra
      $N = 5 + 4 + 3 = 12.$
    ]
    #ans-box[Có tất cả *12 cách* chia kẹo.]
  ],
)

=== Câu 7 — Case 3
#tln(
  id: "DL-7",
  [Chia $6$ học sinh phân biệt thành đúng $3$ nhóm vô danh, không nhóm nào rỗng. Hỏi có bao nhiêu cách chia?],
  [$90$ cách],
  loigiai: [
    #cach2-box[
      Với đúng $3$ nhóm vô danh không rỗng, EGF chuẩn là
      $Phi_3(x) = frac((e^x - 1)^3, 3!).$

      Số cách là
      $N = 6! [x^6] frac((e^x - 1)^3, 3!).$

      Khai triển:
      $frac((e^x - 1)^3, 3!) = frac(e^(3x) - 3 e^(2x) + 3 e^x - 1, 6).$

      Vì vậy
      $N = frac(3^6 - 3 dot 2^6 + 3, 6)$
      $= frac(729 - 192 + 3, 6)$
      $= 90.$
    ]
    #ans-box[Có tất cả *90 cách* chia nhóm.]
  ],
)

=== Câu 8 — Case 4
#tln(
  id: "DL-8",
  [Chia $9$ vật giống nhau vào *đúng $4$* hộp vô danh, mỗi hộp đều không rỗng. Hỏi có bao nhiêu kiểu chia?],
  [$6$ kiểu],
  loigiai: [
    #cach2-box[
      “Đúng $4$ hộp không rỗng” nghĩa là phân hoạch $9$ thành đúng $4$ phần dương.

      OGF tương ứng là
      $Q(x) = frac(x^4, (1 - x)(1 - x^2)(1 - x^3)(1 - x^4)).$

      Do đó số cách là hệ số của $x^9$, tức là hệ số của $x^5$ trong
      $frac(1, (1 - x)(1 - x^2)(1 - x^3)(1 - x^4)).$

      Điều này tương đương đếm số nghiệm nguyên không âm của
      $a + 2 b + 3 c + 4 d = 5.$

      - Nếu $d = 0$ thì $a + 2 b + 3 c = 5$: có $5$ nghiệm.
      - Nếu $d = 1$ thì $a + 2 b + 3 c = 1$: có $1$ nghiệm.

      Vậy
      $N = 5 + 1 = 6.$
    ]
    #ans-box[Có tất cả *6 kiểu chia*.]
  ],
)

= III. Mức Vận Dụng

=== Câu 9 — Case 1
#tln(
  id: "DL-9",
  [Xếp $7$ học sinh phân biệt vào $3$ phòng phân biệt sao cho phòng $1$ có đúng $2$ học sinh, phòng $2$ có số học sinh lẻ và phòng $3$ nhận số học sinh còn lại. Hỏi có bao nhiêu cách xếp?],
  [$336$ cách],
  loigiai: [
    #cach1-box[
      Trước hết chọn $2$ học sinh vào phòng $1$:
      $C_7^2 = 21$ cách.

      Còn lại $5$ học sinh. Phòng $2$ phải có số học sinh lẻ, nên số học sinh trong phòng $2$ có thể là $1$, $3$ hoặc $5$.

      Với $5$ học sinh còn lại, số cách chọn tập học sinh vào phòng $2$ là:
      $C_5^1 + C_5^3 + C_5^5 = 5 + 10 + 1 = 16.$

      Các học sinh còn lại tự động vào phòng $3$.

      Vậy
      $N = 21 dot 16 = 336.$
    ]
    #ans-box[Có tất cả *336 cách* xếp.]
  ],
)

=== Câu 10 — Case 2
#tln(
  id: "DL-10",
  [Chia $8$ quả bóng giống nhau vào $3$ hộp phân biệt sao cho hộp $1$ chứa số bóng chẵn, hộp $2$ chứa số bóng lẻ và hộp $3$ chứa ít nhất $1$ quả. Hỏi có bao nhiêu cách chia?],
  [$10$ cách],
  loigiai: [
    #cach2-box[
      OGF của ba hộp là:

      - Hộp $1$: $frac(1, 1 - x^2)$.
      - Hộp $2$: $frac(x, 1 - x^2)$.
      - Hộp $3$: $frac(x, 1 - x)$.

      Do đó
      $G(x) = frac(x^2, (1 - x^2)^2 (1 - x)).$

      Ta cần hệ số của $x^8$, tức là hệ số của $x^6$ trong
      $frac(1, (1 - x^2)^2 (1 - x)).$

      Khai triển:
      $(1 - x^2)^(-2) = 1 + 2 x^2 + 3 x^4 + 4 x^6 + ...$
      và
      $(1 - x)^(-1) = 1 + x + x^2 + x^3 + ...$

      Hệ số của $x^6$ là
      $1 + 2 + 3 + 4 = 10.$
    ]
    #ans-box[Có tất cả *10 cách* chia bóng.]
  ],
)

=== Câu 11 — Case 3
#tln(
  id: "DL-11",
  [Chia $7$ học sinh phân biệt thành *nhiều nhất $3$* nhóm vô danh, không nhóm nào rỗng. Hỏi có bao nhiêu cách chia?],
  [$365$ cách],
  loigiai: [
    #cach2-box[
      “Nhiều nhất $3$ nhóm” nghĩa là cộng ba trường hợp: đúng $1$, đúng $2$, đúng $3$ nhóm.

      Vì vậy
      $N = S_7^1 + S_7^2 + S_7^3.$

      - $S_7^1 = 1$.

      - $S_7^2 = 7! [x^7] frac((e^x - 1)^2, 2!) = frac(2^7 - 2, 2) = 63.$

      - $S_7^3 = 7! [x^7] frac((e^x - 1)^3, 3!)$
        $= frac(3^7 - 3 dot 2^7 + 3, 6)$
        $= frac(2187 - 384 + 3, 6)$
        $= 301.$

      Suy ra
      $N = 1 + 63 + 301 = 365.$
    ]
    #ans-box[Có tất cả *365 cách* chia nhóm.]
  ],
)

=== Câu 12 — Case 4
#tln(
  id: "DL-12",
  [Hỏi có bao nhiêu phân hoạch của $8$ thành các số hạng lẻ?],
  [$6$ phân hoạch],
  loigiai: [
    #cach2-box[
      Theo định lý Euler, số phân hoạch của $8$ thành các phần lẻ bằng số phân hoạch của $8$ thành các phần phân biệt.

      Ta liệt kê các phân hoạch của $8$ thành các phần phân biệt:
      $8,$
      $7 + 1,$
      $6 + 2,$
      $5 + 3,$
      $5 + 2 + 1,$
      $4 + 3 + 1.$

      Có tất cả $6$ phân hoạch.
    ]
    #warn-box[Đây là mẫu câu vận dụng rất hay ra: thay vì đếm trực tiếp phân hoạch lẻ, ta chuyển sang phân hoạch phần phân biệt nhờ định lý Euler.]
    #ans-box[Có tất cả *6 phân hoạch* của $8$ thành các số hạng lẻ.]
  ],
)

= IV. Mức Vận Dụng Cao

=== Câu 13 — Case 1
#tln(
  id: "DL-13",
  [Xếp $8$ học sinh phân biệt vào $4$ phòng phân biệt sao cho phòng $1$ có đúng $2$ học sinh, phòng $2$ và phòng $3$ đều có ít nhất $1$ học sinh, phòng $4$ nhận số học sinh còn lại. Hỏi có bao nhiêu cách xếp?],
  [$16856$ cách],
  loigiai: [
    #cach1-box[
      *Cách 1: Sử dụng đếm trực tiếp kết hợp bù trừ*

      - Bước 1: Chọn đúng $2$ học sinh trong số $8$ học sinh xếp vào phòng $1$:
        $C_8^2 = 28$ cách.
      - Bước 2: Còn lại $6$ học sinh cần phân phối vào ba phòng $2, 3, 4$ sao cho phòng $2$ và phòng $3$ không trống (phòng $4$ nhận số còn lại tự do, có thể trống).
        - Tổng số cách xếp 6 học sinh vào 3 phòng tự do là: $3^6 = 729$ cách.
        - Trừ số cách phòng $2$ trống (chỉ xếp vào phòng 3, 4): $2^6 = 64$ cách.
        - Trừ số cách phòng $3$ trống (chỉ xếp vào phòng 2, 4): $2^6 = 64$ cách.
        - Cộng lại số cách cả phòng $2$ và phòng $3$ đều trống (tất cả xếp vào phòng 4): $1^6 = 1$ cách.
        - Số cách xếp 6 học sinh thỏa mãn là: $729 - 64 - 64 + 1 = 602$ cách.
      - Bước 3: Tổng số cách xếp toàn bài là:
        $N = 28 dot 602 = 16856.$
    ]
    #cach2-box[
      *Cách 2: Giải trực tiếp bằng EGF (không chia $k!$)*

      - Chọn $2$ học sinh vào phòng 1: $C_8^2 = 28$ cách.
      - Với $6$ học sinh còn lại xếp vào ba phòng $2, 3, 4$ phân biệt với điều kiện:
        - Phòng $2$ nhận ít nhất $1$ học sinh $->$ EGF là $e^x - 1$.
        - Phòng $3$ nhận ít nhất $1$ học sinh $->$ EGF là $e^x - 1$.
        - Phòng $4$ nhận tự do $->$ EGF là $e^x$.
      - EGF tổng cho 3 phòng này (nhân trực tiếp):
        $E(x) = e^x (e^x - 1)^2 = e^x (e^(2x) - 2e^x + 1) = e^(3x) - 2e^(2x) + e^x.$
      - Số cách phân phối $6$ học sinh là:
        $N_2 = 6! [x^6] E(x) = 6! lr(frac(3^6, 6!) - 2 dot frac(2^6, 6!) + frac(1^6, 6!))$
        $N_2 = 3^6 - 2 dot 2^6 + 1 = 729 - 128 + 1 = 602$ cách.
      - Tổng số cách xếp là: $N = C_8^2 dot N_2 = 28 dot 602 = 16856$ cách.
    ]
    #ans-box[Có tất cả *16856 cách* xếp thỏa mãn.]
  ],
)

=== Câu 14 — Case 2
#tln(
  id: "DL-14",
  [Chia $12$ phần thưởng giống nhau vào $4$ hộp phân biệt sao cho hộp $1$ nhận số phần thưởng là bội của $3$, hộp $2$ nhận số phần thưởng lẻ, hộp $3$ nhận ít nhất $2$ phần thưởng, hộp $4$ nhận nhiều nhất $4$ phần thưởng. Hỏi có bao nhiêu cách chia?],
  [$103$ cách],
  loigiai: [
    #cach2-box[
      OGF của từng hộp là:

      - Hộp $1$: $frac(1, 1 - x^3)$.
      - Hộp $2$: $frac(x, 1 - x^2)$.
      - Hộp $3$: $frac(x^2, 1 - x)$.
      - Hộp $4$: $1 + x + x^2 + x^3 + x^4.$

      Do đó OGF tổng là
      $G(x) = frac(x^3 (1 + x + x^2 + x^3 + x^4), (1 - x^3)(1 - x^2)(1 - x)).$

      Ta cần hệ số của $x^12$, tức là hệ số của $x^9$ trong
      $H(x) = frac(1 + x + x^2 + x^3 + x^4, (1 - x^3)(1 - x^2)(1 - x)).$

      Đặt:
      - hộp $1$ nhận $3 u$ phần thưởng,
      - hộp $2$ nhận $2 v + 1$ phần thưởng,
      - hộp $3$ nhận $w + 2$ phần thưởng,
      - hộp $4$ nhận $t$ phần thưởng với $0 <= t <= 4$.

      Khi đó ta có phương trình
      $u + 2 v + w + t = 9.$

      Với mỗi giá trị $t$, số nghiệm của $u + 2 v + w = 9 - t$ được tính bằng cách cho $v$ chạy từ $0$ đến $floor((9 - t)/2)$.

      - $t = 0$: có $30$ nghiệm.
      - $t = 1$: có $25$ nghiệm.
      - $t = 2$: có $20$ nghiệm.
      - $t = 3$: có $16$ nghiệm.
      - $t = 4$: có $12$ nghiệm.

      Cộng lại:
      $N = 30 + 25 + 20 + 16 + 12 = 103.$
    ]
    #ans-box[Có tất cả *103 cách* chia phần thưởng.]
  ],
)

=== Câu 15 — Case 3
#tln(
  id: "DL-15",
  [Chia $9$ học sinh phân biệt thành đúng $4$ nhóm vô danh, không nhóm nào rỗng, sao cho *có đúng hai nhóm chỉ gồm $1$ học sinh*. Hỏi có bao nhiêu cách chia?],
  [$2016$ cách],
  loigiai: [
    #cach1-box[
      *Cách 1: Tách cấu trúc nhóm tổ hợp rời rạc*

      - *Bước 1:* Chọn đúng $2$ học sinh trong số $9$ học sinh để đứng riêng lẻ (mỗi người tạo thành một nhóm đơn $1$ người). Số cách chọn là:
        $C_9^2 = 36$ cách.
      - *Bước 2:* Còn lại $7$ học sinh phải chia thành đúng $2$ nhóm vô danh, sao cho mỗi nhóm phải có ít nhất $2$ học sinh (để không tạo thêm nhóm đơn $1$ người nào nữa).
        - Tổng số cách chia $7$ học sinh thành $2$ nhóm vô danh không rỗng là số Stirling loại hai:
          $S_7^2 = frac(2^7 - 2, 2!) = 63$ cách.
        - Trừ đi các cách chia dạng $1 + 6$ (có một nhóm chỉ có 1 người): chính là số cách chọn 1 người trong 7 người đứng riêng lẻ $-> 7$ cách.
        - Số cách chia hợp lệ cho 7 học sinh là: $63 - 7 = 56$ cách.
      - *Bước 3:* Tổng số cách chia toàn bài là:
        $N = 36 dot 56 = 2016$ cách.
    ]
    #cach2-box[
      *Cách 2: Thiết lập bằng EGF cấu trúc (Hộp giống nhau)*

      - Có $4$ nhóm vô danh (giống nhau):
        - Có $2$ nhóm có đúng $1$ người. EGF của một nhóm đúng $1$ người là $x$. Vì 2 nhóm này vô danh nên ta chia cho $2! -> frac(x^2, 2!).$
        - Có $2$ nhóm có ít nhất $2$ người. EGF của một nhóm $>= 2$ người là $e^x - 1 - x$. Vì 2 nhóm này vô danh nên ta chia cho $2! -> frac((e^x - 1 - x)^2, 2!).$
      - EGF tổng của toàn bộ cấu trúc phân hoạch là:
        $E(x) = frac(x^2, 2!) dot frac((e^x - 1 - x)^2, 2!) = frac(x^2 (e^x - 1 - x)^2, 4).$
      - Số cách phân phối $9$ học sinh là:
        $N = 9! [x^9] E(x) = 9! [x^9] frac(x^2 (e^x - 1 - x)^2, 4) = frac(9!, 4) [x^7] (e^x - 1 - x)^2.$
      - Khai triển $(e^x - 1 - x)^2 = e^(2x) - 2e^x (1 + x) + (1 + x)^2$. Ta trích hệ số của $x^7$:
        - Từ $e^(2x)$: hệ số là $frac(2^7, 7!) = frac(128, 7!)$.
        - Từ $-2e^x (1 + x) = -2e^x - 2x e^x$: hệ số là $-2 lr(frac(1, 7!) + frac(1, 6!)) = -2 dot frac(1 + 7, 7!) = -frac(16, 7!)$.
        - Từ $(1+x)^2$: hệ số bằng 0.
      - Vậy:
        $[x^7] (e^x - 1 - x)^2 = frac(128 - 16, 7!) = frac(112, 7!).$
      - Suy ra số cách là:
        $N = frac(9!, 4) dot frac(112, 7!) = frac(9 dot 8, 4) dot 112 = 18 dot 112 = 2016.$
    ]
    #warn-box[EGF cấu trúc nhóm vô danh rất mạnh khi cần chia nhiều nhóm có điều kiện khác nhau.]
    #ans-box[Có tất cả *2016 cách* chia nhóm thỏa mãn.]
  ],
)

=== Câu 16 — Case 4
#tln(
  id: "DL-16",
  [Chia $12$ vật giống nhau vào đúng $4$ hộp vô danh, mỗi hộp đều có ít nhất $2$ vật. Hỏi có bao nhiêu kiểu chia?],
  [$5$ kiểu],
  loigiai: [
    #cach2-box[
      Vì mỗi hộp đều có ít nhất $2$ vật và có đúng $4$ hộp, ta đặt trước $2$ vật vào mỗi hộp. Khi đó đã dùng $8$ vật, còn lại $4$ vật cần phân phối thêm.

      Bài toán trở thành: phân hoạch $4$ thành nhiều nhất $4$ phần.

      OGF tương ứng là
      $P_4(x) = frac(1, (1 - x)(1 - x^2)(1 - x^3)(1 - x^4)).$

      Ta cần hệ số của $x^4$, tương đương đếm số nghiệm nguyên không âm của
      $a + 2 b + 3 c + 4 d = 4.$

      - Nếu $d = 0$ thì $a + 2 b + 3 c = 4$: có $4$ nghiệm.
      - Nếu $d = 1$ thì $a + 2 b + 3 c = 0$: có $1$ nghiệm.

      Vậy
      $N = 4 + 1 = 5.$

      Năm dạng chia tương ứng là:
      $6 + 2 + 2 + 2,$
      $5 + 3 + 2 + 2,$
      $4 + 4 + 2 + 2,$
      $4 + 3 + 3 + 2,$
      $3 + 3 + 3 + 3.$
    ]
    #ans-box[Có tất cả *5 kiểu chia*.]
  ],
)

= V. Bảng Đáp Số Nhanh

#table(
  columns: (0.7fr, 2.6fr, 1fr),
  inset: (x: 8pt, y: 7pt),
  stroke: 0.45pt + col-navy,
  fill: (col, row) => if row == 0 { rgb("E8EAF6") } else if calc.rem(row, 2) == 1 { rgb("FBFDFF") } else { white },
  table.header([*Câu*], [*Dạng*], [*Đáp số*]),
  [1], [Case 1 - nhận biết], [16],
  [2], [Case 2 - nhận biết], [28],
  [3], [Case 3 - nhận biết], [15],
  [4], [Case 4 - nhận biết], [7],
  [5], [Case 1 - thông hiểu], [150],
  [6], [Case 2 - thông hiểu], [12],
  [7], [Case 3 - thông hiểu], [90],
  [8], [Case 4 - thông hiểu], [6],
  [9], [Case 1 - vận dụng], [336],
  [10], [Case 2 - vận dụng], [10],
  [11], [Case 3 - vận dụng], [365],
  [12], [Case 4 - vận dụng], [6],
  [13], [Case 1 - vận dụng cao], [16856],
  [14], [Case 2 - vận dụng cao], [103],
  [15], [Case 3 - vận dụng cao], [2016],
  [16], [Case 4 - vận dụng cao], [5],
)
