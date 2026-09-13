#import "sang-exam.typ": *
#import "book-templates.typ": *

#import "@preview/cetz:0.4.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(
  paper: "a4",
  margin: (x: 1.4cm, y: 1.8cm),
  header: none,
  footer: none,
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("#004D40"), rgb("#00695C"), rgb("#00796B"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("#00695C")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("#00695C"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("#00796B"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

// Mục lục
#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  strong(it)
}

// ═══════════════════════════════════════════════
// BÌA SÁCH
// ═══════════════════════════════════════════════
#{
  show math.equation: set text(fill: white.transparentize(15%))
  let c-bg    = rgb("#041311") // Deep dark teal
  let c-p1    = rgb("#004D40") // Dark teal
  let c-p2    = rgb("#00695C") // Teal
  let c-p3    = rgb("#00796B") // Medium teal
  let c-p4    = rgb("#D97706") // Amber
  let c-p5    = rgb("#0284C7") // Sky

  // Nền toàn trang
  place(top + left, dx: -1.4cm, dy: -1.8cm,
    rect(width: 210mm, height: 297mm, fill: c-bg, radius: 0pt))
  // Dải màu trái
  place(top + left, dx: -1.4cm, dy: -1.8cm,
    rect(width: 7mm, height: 297mm, fill: c-p2, radius: 0pt))
  // Dải 5 màu dưới
  place(top + left, dx: -1.4cm + 7mm, dy: 26.1cm,
    block(width: 203mm, height: 18mm)[
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr), rows: 18mm,
        rect(width: 100%, height: 100%, fill: c-p1, stroke: none),
        rect(width: 100%, height: 100%, fill: c-p2, stroke: none),
        rect(width: 100%, height: 100%, fill: c-p3, stroke: none),
        rect(width: 100%, height: 100%, fill: c-p4, stroke: none),
        rect(width: 100%, height: 100%, fill: c-p5, stroke: none),
      )
    ])

  v(22mm)
  align(center, {
    // Nhãn
    box(
      stroke: 1pt + white.transparentize(50%),
      fill: white.transparentize(88%),
      inset: (x: 18pt, y: 7pt),
      radius: 20pt,
    )[
      #text(fill: white, weight: "bold", size: 10pt, tracking: 0.06em)[
        ◆ TÀI LIỆU CHUYÊN SÂU THPT — TOÁN ỨNG DỤNG THỰC TẾ · 2025 – 2026
      ]
    ]
    v(1.4em)
    // Công thức trang trí
    text(fill: white.transparentize(45%), size: 12pt)[
      $S(r) = 2 pi r^2 + frac(2 V_0, r) quad | quad A = P (1+r)^n quad | quad P(t) = P_0 e^(k t) quad | quad d = v_0 t + 1/2 a t^2$
    ]
    v(1.3em)
    // Khung tiêu đề
    block(
      width: 90%,
      fill: white,
      inset: 0pt,
      radius: 12pt,
      clip: true,
    )[
      #block(
        width: 100%, height: 8pt,
        fill: c-p2,
      )
      #v(0.6em)
      #block(
        width: 100%,
        inset: (bottom: 22pt, x: 26pt),
      )[
        #text(size: 28pt, weight: "bold", fill: c-bg)[MẪU BÀI TOÁN THỰC TẾ]
        #linebreak()
        #text(size: 14pt, weight: "bold", fill: c-p2)[ỨNG DỤNG TOÁN HỌC VÀO ĐỜI SỐNG & KINH TẾ]
        #linebreak()
        #v(0.4em)
        #text(size: 15pt, weight: "bold", fill: c-p3)[12 CHỦ ĐỀ TOÀN DIỆN · MÔ HÌNH HÓA THỰC TIỄN]
        #v(0.7em)
        #line(length: 100%, stroke: 1.5pt + c-p2.lighten(55%))
        #v(0.6em)
        #text(size: 9.5pt, style: "italic", fill: rgb("#475569"))[
          Tối ưu chi phí · Lãi suất & Niên kim · Chuyển động biến đổi · Thể tích cực đại · Tăng trưởng mũ
        ]
        #v(1.2em)
        #grid(
          columns: (1fr, 1fr, 1fr, 1fr),
          column-gutter: 4pt,
          block(fill: c-p1, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[12 CHỦ ĐỀ]]
          ],
          block(fill: c-p2, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[150+ BÀI TOÁN]]
          ],
          block(fill: c-p3, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[LỜI GIẢI CHI TIẾT]]
          ],
          block(fill: c-p4, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[MÔ HÌNH THỰC TẾ]]
          ],
        )
      ]
    ]
    v(2em)
    // Thống kê
    grid(
      columns: (auto, auto, auto),
      column-gutter: 12pt,
      align: center,
      box(
        fill: white.transparentize(85%),
        stroke: 1pt + c-p2.transparentize(50%),
        inset: (x: 20pt, y: 12pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 18pt)[12]
        #linebreak()
        #text(fill: white.transparentize(25%), size: 9pt)[CHỦ ĐỀ]
      ],
      box(
        fill: white.transparentize(85%),
        stroke: 1pt + c-p2.transparentize(50%),
        inset: (x: 20pt, y: 12pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 18pt)[150+]
        #linebreak()
        #text(fill: white.transparentize(25%), size: 9pt)[BÀI TOÁN]
      ],
      box(
        fill: white.transparentize(85%),
        stroke: 1pt + c-p2.transparentize(50%),
        inset: (x: 20pt, y: 12pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 18pt)[4]
        #linebreak()
        #text(fill: white.transparentize(25%), size: 9pt)[MỨC ĐỘ]
      ],
    )
    v(2em)
    // Tác giả
    box(stroke: 1pt + c-p2.transparentize(40%), inset:(x:22pt,y:13pt), radius:8pt)[
      #text(fill: white, weight: "bold", size: 13pt)[★ Tổ Toán THPT]
      #linebreak()
      #text(fill: white.transparentize(30%), size: 10pt)[
        Bộ Tài Liệu Thực Chiến Môn Toán THPT & Đánh Giá Năng Lực
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
  title: [Mục Lục Chuyên Đề Bài Toán Thực Tế],
  depth: 2,
  indent: 1.5em,
)
#pagebreak()

// ==========================================
// CẤU HÌNH HEADER/FOOTER (Có thể tùy chỉnh)
// ==========================================
#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("#00695C"))
    grid(
      columns: (1fr, auto),
      [CHUYÊN ĐỀ TOÁN THỰC TẾ 12 — TỐI ƯU HÓA & MÔ HÌNH TOÁN HỌC],
      [Năm học 2025 – 2026],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("#00695C"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("#00695C"))
    grid(
      columns: (1fr, auto),
      [ConicTypst · Tài liệu chia sẻ học tập],
      [Trang #counter(page).display()],
    )
  },
)

= CHỦ ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA CHI PHÍ TRONG SẢN XUẤT

== 1. Phương pháp mô hình hóa bài toán tối ưu
#method-box(title: "Quy trình giải bài toán tối ưu thực tế (Ứng dụng Đạo hàm)")[
  + *Bước 1 (Xác định đại lượng cần tối ưu):* Gọi $x$ là biến số đại diện cho kích thước, số lượng hoặc thời gian ($x in D$). Thiết lập hàm mục tiêu $f(x)$ cần tìm giá trị lớn nhất (GTLN) hoặc giá trị nhỏ nhất (GTNN).
  + *Bước 2 (Thiết lập ràng buộc):* Dùng các mối liên hệ hình học, vật lý hoặc kinh tế để biểu diễn tất cả các biến phụ theo một biến chính $x$.
  + *Bước 3 (Khảo sát hàm số):* Tính đạo hàm $f'(x)$, tìm nghiệm $x_0 in D$ thỏa mãn $f'(x_0) = 0$, lập bảng biến thiên hoặc đánh giá bất đẳng thức (AM-GM, Cauchy-Schwarz).
  + *Bước 4 (Kết luận thực tế):* Đối chiếu giá trị tối ưu với điều kiện thực tế của bài toán.
]

#definition-box(title: "Công thức thể tích và diện tích hình trụ")[
  Cho khối trụ có bán kính đáy $r$ và chiều cao $h$:
  - Thể tích khối trụ: $V = pi r^2 h$.
  - Diện tích xung quanh: $S_(x q) = 2 pi r h$.
  - Diện tích toàn phần (gồm 2 nắp): $S_(t p) = 2 pi r^2 + 2 pi r h$.
]

== 2. Các ví dụ minh họa điển hình
#example-box(title: "Ví dụ 1 (Thiết kế vỏ lon nước ngọt tối ưu chi phí)")[
  Một nhà máy sản xuất nước giải khát cần thiết kế vỏ lon nhôm hình trụ có thể tích chứa cố định $V_0 = 500 upright("ml") = 500 upright("cm")^3$. Để giảm thiểu tối đa chi phí mua nhôm sản xuất vỏ lon, kỹ sư cần thiết kế sao cho tổng diện tích toàn phần $S_(t p)$ của lon nước là nhỏ nhất.

  Hãy xác định tỉ số giữa chiều cao $h$ và bán kính đáy $r$ của lon nước để đạt hiệu quả kinh tế tối ưu.

  *Lời giải:*
  + Gọi bán kính đáy của lon là $r > 0$ $(upright("cm"))$ và chiều cao là $h > 0$ $(upright("cm"))$.
  + Theo giả thiết, thể tích lon cố định:
    $ V = pi r^2 h = 500 => h = frac(500, pi r^2) $
  + Diện tích toàn phần (lượng nhôm sử dụng) biểu diễn theo biến $r$:
    $ S(r) = 2 pi r^2 + 2 pi r h = 2 pi r^2 + 2 pi r dot frac(500, pi r^2) = 2 pi r^2 + frac(1000, r) quad (r > 0) $
  + Khảo sát hàm số $S(r)$ trên $(0; +infinity)$:
    $ S'(r) = 4 pi r - frac(1000, r^2) = frac(4 pi r^3 - 1000, r^2) $
    $ S'(r) = 0 <=> 4 pi r^3 = 1000 <=> r^3 = frac(250, pi) <=> r = root(3, frac(250, pi)) $
  + Bảng biến thiên cho thấy $S(r)$ đạt giá trị nhỏ nhất tại $r_0 = root(3, frac(250, pi))$.
  + Khi đó, chiều cao tương ứng của lon nước là:
    $ h = frac(500, pi r^2) = frac(2 dot 250, pi (root(3, 250/pi))^2) = 2 root(3, frac(250, pi)) = 2r $
  
  *Kết luận:* Tỉ số tối ưu là $frac(h, r) = 2$, nghĩa là chiều cao bằng đúng đường kính đáy ($h = 2r$).
]

#practice-box(title: "Bài tập tự luyện")[
  1. *(Bài toán dẫn dầu)*: Một mỏ dầu nằm trên biển cách bờ sông một khoảng cách ngắn nhất $A B = 6 upright("km")$. Một nhà máy lọc dầu $C$ nằm bên bờ sông cách vị trí $B$ một khoảng $B C = 15 upright("km")$. Chi phí kéo ống ngầm dưới biển là 10.000 USD/km và chi phí kéo ống trên đất liền là 6.000 USD/km. Tìm vị trí tiếp đất $M$ trên đoạn $B C$ để tổng chi phí kéo đường ống là nhỏ nhất.
  
  2. *(Bài toán gửi tiết kiệm)*: Một người gửi tiết kiệm ngân hàng 200 triệu đồng với lãi suất kép định kỳ 6.5%/năm. Hỏi sau ít nhất bao nhiêu năm người đó nhận được số tiền cả gốc lẫn lãi vượt quá 350 triệu đồng (giả sử lãi suất không đổi qua các năm)?
]

#summary-box(title: "Tóm tắt & Đúc kết")[
  - Với các bài toán hình trụ có thể tích cố định, hình dạng đối xứng $h = 2r$ luôn mang lại diện tích bề mặt nhỏ nhất.
  - Luôn kiểm tra điều kiện xác định của biến thực tế ($r > 0, x > 0$) trước khi kết luận nghiệm.
]

