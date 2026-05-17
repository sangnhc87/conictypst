#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"


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
        CHỦ ĐỀ TÍCH PHÂN ĐỘC LẠ
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        Vấn đề tích phân có thể được tiếp cận theo nhiều cách khác nhau, và đôi khi những cách tiếp cận này có thể dẫn đến những kết quả bất ngờ hoặc "độc lạ". Dưới đây là một số ví dụ về các tình huống tích phân độc lạ mà bạn có thể gặp phải trong quá trình học tập và nghiên cứu.
      ]
    ],
  )
]

#tln(
  [Cho tập $X = {1; 2; dots; 14}$ và 7 ô tròn $a, b, c, d, e, f, g$ được bố trí như hình vẽ bên dưới. Mỗi ô tròn nhỏ chỉ xếp được đúng một số từ $X$. Biết rằng có tất cả $T$ cách chọn ra $7$ số khác nhau từ tập $X$ để xếp vào 7 ô tròn, sao cho có ít nhất một hàng được sắp xếp theo chiều tăng dần hoặc giảm dần. Hãy xác định ba chữ số có nghĩa đầu tiên của $T$?],
  [$113$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Tọa độ các điểm
    let g = (0, 0)
    let c = (-2.5, 0)
    let d = (2.5, 0)
    let a = (-1.25, 2.165)
    let b = (1.25, -2.165)
    let e = (-1.25, -2.165)
    let f = (1.25, 2.165)
    
    // Các đường nối
    line(c, d, stroke: 0.6pt)
    line(a, b, stroke: 0.6pt)
    line(e, f, stroke: 0.6pt)
    
    // Bán kính ô tròn
    let r = 0.65
    
    // Vẽ các ô tròn và điền chữ
    circle(g, radius: r, fill: white, stroke: 0.6pt); content(g, $g$)
    circle(c, radius: r, fill: white, stroke: 0.6pt); content(c, $c$)
    circle(d, radius: r, fill: white, stroke: 0.6pt); content(d, $d$)
    circle(a, radius: r, fill: white, stroke: 0.6pt); content(a, $a$)
    circle(f, radius: r, fill: white, stroke: 0.6pt); content(f, $f$)
    circle(e, radius: r, fill: white, stroke: 0.6pt); content(e, $e$)
    circle(b, radius: r, fill: white, stroke: 0.6pt); content(b, $b$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Vì các ô tròn được đặt tên phân biệt ($a, b, c, d, e, f, g$) nên đây là bài toán xếp vị trí phân biệt (hoán vị thẳng), không phải hoán vị vòng tròn.
      - Sử dụng phương pháp đếm phần bù: $T = ("Số cách chọn 7 số") times ("Số cách xếp thỏa mãn")$.
      - Số cách xếp thỏa mãn = Tổng số cách xếp (là $7!$) trừ đi số cách xếp "lệch" (KHÔNG có hàng nào tăng dần hay giảm dần).
      - Một hàng chứa 3 phần tử $(X, g, Y)$ không tăng/giảm dần khi và chỉ khi phần tử ở tâm ($g$) lớn hơn cả 2 phần tử ở hai đầu hoặc nhỏ hơn cả 2 phần tử ở hai đầu.
    ]
    
    Số cách chọn 7 số khác nhau từ tập $X$ (có 14 phần tử) là $C_{14}^7 = 3432$ cách.
    Với mỗi bộ 7 số được chọn, giả sử sắp xếp theo thứ tự là $x_1 < x_2 < x_3 < x_4 < x_5 < x_6 < x_7$.
    
    Vì 7 vị trí $a, b, c, d, e, f, g$ là hoàn toàn phân biệt, tổng số cách xếp 7 số này vào hình là $7! = 5040$ cách.
    
    Ta đếm số cách xếp "lệch" (không có hàng nào tăng dần hoặc giảm dần). Để điều này xảy ra, ở cả 3 hàng, số ở tâm $g$ phải là lớn nhất hoặc nhỏ nhất. Giả sử có $k$ hàng mà $g$ là số lớn nhất ($k in {0, 1, 2, 3}$). Khi đó $g$ sẽ lớn hơn $2k$ số và nhỏ hơn $6 - 2k$ số ở các đầu mút. Vậy $g$ phải đứng thứ $2k + 1$ trong thứ tự, tức là $g in {x_1, x_3, x_5, x_7}$.
    
    - *Trường hợp 1: $g = x_7$ ($k = 3$).* Tâm $g$ là số lớn nhất trong 7 số, nên nó lớn hơn cả 6 số còn lại. Bất kỳ cách xếp 6 số còn lại vào 6 vị trí xung quanh đều tạo ra các hàng mà $g$ là cực đại. Số cách xếp là: $6! = 720$ cách.
    
    - *Trường hợp 2: $g = x_1$ ($k = 0$).* Tâm $g$ là số nhỏ nhất trong 7 số. Tương tự trường hợp 1, mọi cách xếp 6 số còn lại đều thỏa mãn. Số cách xếp là: $6! = 720$ cách.
    
    - *Trường hợp 3: $g = x_5$ ($k = 2$).* Tâm $g$ lớn hơn 4 số và nhỏ hơn 2 số ($x_6, x_7$). Khi đó $g$ là cực đại của 2 hàng và cực tiểu của 1 hàng. 
      + Chọn 1 hàng để $g$ làm cực tiểu: có $C_3^1 = 3$ cách (ví dụ hàng $c-g-d$).
      + Xếp 2 số lớn hơn $g$ ($x_6, x_7$) vào 2 đầu của hàng vừa chọn: có $2! = 2$ cách.
      + Xếp 4 số còn lại vào 4 vị trí của 2 hàng kia: có $4! = 24$ cách.
      Số cách xếp cho trường hợp này là: $3 dot 2 dot 24 = 144$ cách.
      
    - *Trường hợp 4: $g = x_3$ ($k = 1$).* Tâm $g$ lớn hơn 2 số và nhỏ hơn 4 số. Tức là $g$ là cực tiểu của 2 hàng và cực đại của 1 hàng. Hoàn toàn đối xứng với trường hợp 3, số cách xếp là: $3 dot 2! dot 4! = 144$ cách.
    
    Tổng số cách xếp "lệch" là: $720 + 720 + 144 + 144 = 1728$ cách.
    Số cách xếp "chuẩn" (có ít nhất một hàng tăng/giảm) là: $5040 - 1728 = 3312$ cách.
    
    Tổng số cách chọn và sắp xếp thỏa mãn yêu cầu đề bài là:
    $ T = C_{14}^7 dot 3312 = 3432 dot 3312 = 11366784. $
    
    Ba chữ số có nghĩa đầu tiên của $T$ là $1, 1, 3$.
    
    #nhanxet[
      Mô hình toán học của tác giả dùng hoán vị vòng tròn ($7 dot 5!$) là không đúng bản chất. Đề bài đã gọi tên rõ ràng $a, b, c, d, e, f, g$, chứng tỏ các vị trí là cố định và phân biệt (giống như 7 cái ghế có đánh số). Do đó, tổng số cách xếp ngẫu nhiên phải là hoán vị thẳng $7! = 5040$. Lời giải mới sử dụng hoán vị thẳng giúp đếm chính xác, chia trường hợp rõ ràng và dễ hiểu hơn.
    ]
  ]
)