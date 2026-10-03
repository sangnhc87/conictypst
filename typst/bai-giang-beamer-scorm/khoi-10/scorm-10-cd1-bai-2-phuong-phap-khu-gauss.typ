#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Phương Pháp Khử Gauss],
  subtitle: [TOÁN 10 — CHUYÊN ĐỀ HỌC TẬP: CHUYÊN ĐỀ 1],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#1e40af"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC BÀI HỌC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG BÀI HỌC])

// ════════════════════════════════════════════════
// PHẦN I: MA TRẬN VÀ PHÉP BIẾN ĐỔI SƠ CẤP
// ════════════════════════════════════════════════
#lt-section-link("sec-ma-tran", "🔢", [I. Ma Trận và Phép Biến Đổi Sơ Cấp])

#lt-slide-back(title: "🔢 Ma trận bậc thang & Biến đổi sơ cấp")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Phép biến đổi sơ cấp trên dòng")[
        Có 3 phép biến đổi sơ cấp không làm thay đổi nghiệm của hệ phương trình:
        1. Đổi chỗ hai dòng cho nhau ($h_i <-> h_j$).
        2. Nhân một dòng với số thực $k != 0$ ($h_i <- k h_i$).
        3. Cộng vào một dòng một bội số của dòng khác ($h_i <- h_i + k h_j$).
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e40af"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1e40af"), size: 10.5pt)[Ma trận bậc thang]\
        #v(0.15em)
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            rect((-1.8, 0.4), (-0.6, 1.0), fill: rgb("dbeafe"), stroke: 0.8pt + rgb("1e40af"))
            content((-1.2, 0.7), text(size: 7.5pt, weight: "bold")[Dòng 1])
            rect((-1.8, -0.2), (-0.6, 0.4), fill: rgb("dbeafe"), stroke: 0.8pt + rgb("1e40af"))
            content((-1.2, 0.1), text(size: 7.5pt, weight: "bold")[Dòng 2])
            rect((-1.8, -0.8), (-0.6, -0.2), fill: rgb("dbeafe"), stroke: 0.8pt + rgb("1e40af"))
            content((-1.2, -0.5), text(size: 7.5pt, weight: "bold")[Dòng 3])
            line((-0.4, 0.8), (0.2, 0.8), stroke: 1.2pt + rgb("dc2626"))
            line((0.2, 0.8), (0.2, 0.2), stroke: 1.2pt + rgb("dc2626"))
            line((0.2, 0.2), (0.8, 0.2), stroke: 1.2pt + rgb("dc2626"))
            line((0.8, 0.2), (0.8, -0.4), stroke: 1.2pt + rgb("dc2626"))
            line((0.8, -0.4), (1.4, -0.4), stroke: 1.2pt + rgb("dc2626"))
          })
        ]
        #text(size: 8.5pt)[
          - Phần tử khác $0$ đầu tiên của dòng dưới phải nằm bên phải phần tử khác $0$ đầu tiên của dòng trên.
          - Các dòng toàn số $0$ phải nằm ở dưới cùng.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: PHƯƠNG PHÁP KHỬ GAUSS
// ════════════════════════════════════════════════
#lt-section-link("sec-gauss", "⚙️", [II. Phương Pháp Khử Gauss])

#lt-slide-back(title: "⚙️ Thuật toán Khử Gauss")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Các bước thực hiện")[
        - *Bước 1:* Lập ma trận bổ sung $(A|B)$ từ hệ phương trình.
        - *Bước 2:* Dùng các phép biến đổi sơ cấp trên dòng để đưa ma trận $(A|B)$ về dạng *bậc thang*. (Mục tiêu triệt tiêu các hệ số nằm dưới đường chéo chính).
        - *Bước 3:* Viết lại hệ phương trình mới tương ứng với ma trận bậc thang.
        - *Bước 4:* Giải hệ từ dưới lên trên bằng *phép thế ngược* (tìm $z$, thế tìm $y$, thế tìm $x$).
      ]
    ],
    [
      #lt-warning(title: "Biện luận số nghiệm")[
        Trong quá trình khử, ta xét dòng cuối cùng của ma trận:
        - Nếu xuất hiện dòng $mat(0, 0, 0, |, c)$ với $c != 0$ ($0x + 0y + 0z = c$): Hệ *VÔ NGHIỆM*.
        - Nếu số dòng khác $0$ của ma trận bậc thang ít hơn số ẩn (và không có dòng vô lý): Hệ *VÔ SỐ NGHIỆM*.
        - Nếu có đúng $3$ dòng khác $0$ (thành bậc thang chuẩn $3 times 3$): Hệ có *NGHIỆM DUY NHẤT*.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Phương Pháp Khử Gauss])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHUYÊN ĐỀ 1 BÀI 2],
  questions: (
    ( type: "TN", desc: [Phép biến đổi không sơ cấp]),
    ( type: "TN", desc: [Nhận diện ma trận bậc thang]),
    ( type: "TN", desc: [Thực hiện phép biến đổi dòng]),
    ( type: "TN", desc: [Giải bằng thế ngược]),
    ( type: "TN", desc: [Dòng vô lý và biện luận nghiệm]),
    ( type: "DS", desc: [Khử Gauss hệ 3 ẩn cơ bản]),
    ( type: "DS", desc: [Biện luận hệ phương trình có tham số m]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(num: 1, [Trong phương pháp khử Gauss, ba phép biến đổi sơ cấp trên các dòng của ma trận mở rộng $(A|B)$ không làm thay đổi tập nghiệm của hệ phương trình. Phép biến đổi nào sau đây *không phải* là một phép biến đổi sơ cấp trên dòng?],
    (
        [Nhân tất cả các phần tử của một dòng với một số thực $k != 0$],
        [Đổi chỗ hai dòng bất kỳ cho nhau ($h_i <-> h_j$)],
        [Nhân các phần tử của một dòng với số $0$],
        [Cộng vào một dòng một bội số của một dòng khác ($h_i + k h_j$)]
    ),
    correct: 3,
    loigiai: [
        Phép nhân các phần tử của một dòng với số $0$ sẽ làm triệt tiêu hoàn toàn một phương trình ban đầu ($0=0$), làm mất thông tin và có thể làm thay đổi tập nghiệm của hệ, do đó không phải phép biến đổi sơ cấp hợp lệ.
    ]
)

#lt-tn(num: 2, [Ma trận nào sau đây là ma trận ở dạng bậc thang?],
    (
        [$mat(0, 2, -1, 3; 1, 0, 4, 2; 0, 0, 3, 6)$],
        [$mat(1, 2, -1, 3; 0, 1, 4, 2; 0, 0, 3, 6)$],
        [$mat(1, 2, -1, 3; 0, 1, 4, 2; 0, 2, 3, 6)$],
        [$mat(1, 2, -1, 3; 0, 0, 0, 0; 0, 1, 4, 2)$]
    ),
    correct: 2,
    loigiai: [
        Trong ma trận $mat(1, 2, -1, 3; 0, 1, 4, 2; 0, 0, 3, 6)$:
        - Dòng 1 có phần tử khác 0 đầu tiên nằm ở cột 1.
        - Dòng 2 có phần tử khác 0 đầu tiên nằm ở cột 2 (bên phải cột 1).
        - Dòng 3 có phần tử khác 0 đầu tiên nằm ở cột 3 (bên phải cột 2).
        Đây là ma trận đúng dạng bậc thang.
    ]
)

#lt-tn(num: 3, [Cho ma trận mở rộng $(A|B) = mat(1, 1, -1, 2; 2, 3, 1, 7; 1, 2, 3, 8)$.
Sau khi thực hiện phép biến đổi sơ cấp $h_2 <- h_2 - 2h_1$, dòng thứ hai của ma trận trở thành],
    (
        [$mat(0, 1, 1, 3)$],
        [$mat(0, 1, 3, 5)$],
        [$mat(0, 1, 3, 3)$],
        [$mat(0, -1, 3, 3)$]
    ),
    correct: 3,
    loigiai: [
        Ta có $h_2 = (2, 3, 1, 7)$ và $h_1 = (1, 1, -1, 2)$.
        Phép tính $h_2 - 2h_1 = (2 - 2(1), 3 - 2(1), 1 - 2(-1), 7 - 2(2))$
        $ = (0, 1, 3, 3) $.
    ]
)

#lt-tn(num: 4, [Giải hệ phương trình bậc nhất ba ẩn bằng phương pháp khử Gauss thu được ma trận mở rộng dạng bậc thang:
$ mat(1, 2, 1, 8; 0, 1, -1, 1; 0, 0, 1, 3) $
Tích các nghiệm $P = x_0 y_0 z_0$ của hệ phương trình bằng],
    (
        [$12$],
        [$-36$],
        [$6$],
        [$24$]
    ),
    correct: 2,
    loigiai: [
        Sử dụng phép thế ngược:
        - Từ dòng 3: $z = 3$.
        - Từ dòng 2: $y - z = 1 <=> y - 3 = 1 <=> y = 4$.
        - Từ dòng 1: $x + 2y + z = 8 <=> x + 2(4) + 3 = 8 <=> x = -3$.
        Tích các nghiệm: $P = (-3) times 4 times 3 = -36$.
    ]
)

#lt-tn(num: 5, [Trong quá trình khử Gauss, nếu xuất hiện một dòng của ma trận mở rộng có dạng:
$ mat(0, 0, 0, |, c) quad "với" quad c != 0 $
Khi đó ta có thể kết luận gì về số nghiệm của hệ phương trình?],
    (
        [Hệ phương trình có vô số nghiệm],
        [Hệ phương trình có nghiệm duy nhất bằng c],
        [Hệ phương trình hoàn toàn vô nghiệm],
        [Hệ phương trình có đúng hai nghiệm phân biệt]
    ),
    correct: 3,
    loigiai: [
        Dòng $mat(0, 0, 0, |, c)$ tương ứng với phương trình $0x + 0y + 0z = c <=> 0 = c$. Vì $c != 0$ nên đẳng thức này vô lý. Do đó hệ phương trình vô nghiệm.
    ]
)

#lt-ds(num: 6, [Cho hệ phương trình bậc nhất ba ẩn:
$ (H): cases(x + y - z = 2, 2x - y + 3z = 7, 3x + y + 2z = 11) $],
  (
    [Ma trận hệ số mở rộng ban đầu là $(A|B) = mat(1, 1, -1, 2; 2, -1, 3, 7; 3, 1, 2, 11)$.],
    [Thực hiện $h_2 <- h_2 - 2h_1$ và $h_3 <- h_3 - 3h_1$ ta triệt tiêu được ẩn $x$ ở dòng 2 và dòng 3.],
    [Hệ phương trình $(H)$ có nghiệm duy nhất là $(2; 1; 1)$.],
    [Giá trị biểu thức $x_0 y_0 + z_0$ của nghiệm bằng $5$.]
  ),
  correct: "1100",
  loigiai: [
    a) Ma trận bổ sung đúng (ĐÚNG).
    b) Hai phép biến đổi trên nhằm triệt tiêu hệ số cột 1 (ẩn $x$) (ĐÚNG).
    c) Thử $(2; 1; 1)$ vào PT 2: $2(2) - 1 + 3(1) = 6 != 7$. (SAI).
    d) Vì $(2; 1; 1)$ không phải nghiệm nên mệnh đề tính giá trị $x_0 y_0 + z_0$ dựa trên nó là (SAI).
  ]
)

#lt-ds(num: 7, [Cho hệ phương trình bậc nhất ba ẩn chứa tham số $m$:
$ cases(x + y + z = 2, 2x + 3y + z = 3, 3x + 4y + m z = 5) $],
  (
    [Cộng phương trình thứ nhất và thứ hai ta được $3x + 4y + 2z = 5$.],
    [Khi $m = 2$, hệ phương trình có vô số nghiệm.],
    [Khi $m != 2$, hệ phương trình luôn có nghiệm duy nhất.],
    [Khi $m = 2$, hệ phương trình hoàn toàn vô nghiệm.]
  ),
  correct: "1110",
  loigiai: [
    a) Lấy PT1 + PT2: $(x+y+z) + (2x+3y+z) = 3x + 4y + 2z = 5$ (ĐÚNG).
    b, c, d) So sánh tổng trên với PT3: $3x + 4y + m z = 5$.
    Trừ hai phương trình: $(m - 2)z = 0$.
    - Nếu $m = 2$, PT trở thành $0z = 0$ (vô số nghiệm $z$). Hệ có vô số nghiệm. (b ĐÚNG, d SAI).
    - Nếu $m != 2$, PT có nghiệm $z = 0$, hệ có nghiệm duy nhất. (c ĐÚNG).
  ]
)
