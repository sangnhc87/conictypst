#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"

#show: lecture-theme.with(
  title: [Dấu Tam Thức Bậc Hai],
  subtitle: [TOÁN 10 — XÉT DẤU & GIẢI BẤT PHƯƠNG TRÌNH],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG CHUYÊN SÂU])

// ════════════════════════════════════════════════
// PHẦN I: ĐỊNH LÝ VỀ DẤU
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet", "📚", [I. Định Lý Về Dấu Tam Thức Bậc Hai])

#lt-slide-back(title: "📚 Tam thức bậc hai & Định lý")[
  #lt-definition(title: "Tam thức bậc hai")[
    Tam thức bậc hai là biểu thức có dạng:
    $ f(x) = a x^2 + b x + c quad (a != 0) $
    với $Delta = b^2 - 4a c$.
  ]
  #v(0.2em)
  #lt-theorem(title: "Định lý về dấu")[
    - *Nếu $Delta < 0$:* $f(x)$ luôn cùng dấu với $a$ với mọi $x in RR$. (Không đổi dấu)
    - *Nếu $Delta = 0$:* $f(x)$ luôn cùng dấu với $a$ với mọi $x != (-b)/(2a)$. (Không đổi dấu, chạm trục hoành)
    - *Nếu $Delta > 0$:* $f(x)$ có hai nghiệm $x_1 < x_2$. Dấu của $f(x)$ tuân theo quy tắc: *"Trong trái, ngoài cùng"*.
  ]
]

#lt-slide-back(title: "⚡ Trực Quan Hóa Quy Tắc: Trong Trái Ngoài Cùng")[
  #lt-two-col(
    ratio: (40%, 60%),
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Trục x
          line((-2, 0), (4, 0), mark: (end: "stealth"))
          content((3.8, -0.3), [$x$])
          
          // Parabol a > 0
          bezier((-1, 2), (3, 2), (1, -2), stroke: 1.5pt + blue)
          
          content((-0.2, 0.3), text(red)[$x_1$])
          circle((0, 0), radius: 2pt, fill: black)
          
          content((2.2, 0.3), text(red)[$x_2$])
          circle((2, 0), radius: 2pt, fill: black)
          
          content((-1, 1), text(blue)[$+$])
          content((3, 1), text(blue)[$+$])
          content((1, -0.8), text(blue)[$-$])
        })
      ]
    ],
    [
      #lt-important(title: "Quy tắc: Trong Trái - Ngoài Cùng")[
        Với trường hợp $Delta > 0$ và có hai nghiệm $x_1 < x_2$:
        - Giữa hai nghiệm $(x_1; x_2)$: $f(x)$ *trái dấu* với hệ số $a$.
        - Ngoài khoảng hai nghiệm $(-oo; x_1) union (x_2; +oo)$: $f(x)$ *cùng dấu* với hệ số $a$.
      ]
      #lt-tip(title: "Ý nghĩa Đồ thị")[
        Phần parabol nằm *trên* trục $O x$ thì $f(x) > 0$.
        Phần parabol nằm *dưới* trục $O x$ thì $f(x) < 0$.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: BẤT PHƯƠNG TRÌNH
// ════════════════════════════════════════════════
#lt-section-link("sec-bpt", "🚀", [II. Giải Bất Phương Trình Bậc Hai])

#lt-slide-back(title: "🚀 Phương Pháp Lập Bảng Xét Dấu")[
  #lt-example(title: "Ví dụ: Giải bpt $-x^2 + 3x - 2 >= 0$")[
    *Bước 1:* Xét tam thức $f(x) = -x^2 + 3x - 2$. Hệ số $a = -1 < 0$.
    
    *Bước 2:* Giải phương trình $f(x) = 0 <=> x = 1$ hoặc $x = 2$.
    (Tam thức có hai nghiệm phân biệt $=> Delta > 0$).
    
    *Bước 3:* Lập bảng xét dấu:
    Khoảng $(1; 2)$ nằm giữa hai nghiệm $=>$ $f(x)$ trái dấu với $a$ (tức là dấu $+$).
    Ngoài khoảng nghiệm $=>$ $f(x)$ cùng dấu với $a$ (tức là dấu $-$).
    
    *Bước 4:* Kết luận. Ta cần lấy $f(x) >= 0$, vậy $x in [1; 2]$.
  ]
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [III. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — XÉT DẤU],
  questions: (
    (num: 1, type: "TN", desc: [Xác định dấu qua Delta]),
    (num: 2, type: "TN", desc: [Quy tắc Trong Trái Ngoài Cùng]),
    (num: 3, type: "TN", desc: [Giải BPT cơ bản]),
    (num: 4, type: "TN", desc: [Điều kiện luôn dương]),
    (num: 5, type: "TN", desc: [Tìm m để phương trình vô nghiệm]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho tam thức $f(x) = x^2 - 4x + 4$. Mệnh đề nào sau đây đúng?],
  (
    [$f(x) > 0, forall x in RR$],
    [$f(x) >= 0, forall x in RR$],
    [$f(x) < 0, forall x in RR$],
    [$f(x) <= 0, forall x in RR$]
  ),
  correct: 1,
  num: 1,
  de: "Xác định dấu qua Delta = 0",
  loigiai: [
    Ta có $f(x) = (x - 2)^2 >= 0, forall x in RR$.
    Tam thức có $Delta = 0, a = 1 > 0$ nên luôn không âm.
  ]
)

#lt-tn(
  [Tập nghiệm của bất phương trình $x^2 - 5x + 6 < 0$ là:],
  (
    [$(2; 3)$],
    [$(-oo; 2) union (3; +oo)$],
    [$[2; 3]$],
    [$(-oo; 2] union [3; +oo)$]
  ),
  correct: 0,
  num: 2,
  de: "Giải BPT bằng Trong Trái Ngoài Cùng",
  loigiai: [
    Nghiệm phương trình $x^2 - 5x + 6 = 0$ là $x = 2$ và $x = 3$.
    Hệ số $a = 1 > 0$. BPT lấy phần âm ($< 0$) tức là lấy khoảng "Trong trái dấu với $a$".
    Vậy $x in (2; 3)$.
  ]
)

#lt-tn(
  [Tam thức $f(x) = -2x^2 + x - 3$ có dấu như thế nào?],
  (
    [Luôn âm với mọi $x$],
    [Luôn dương với mọi $x$],
    [Đổi dấu khi qua $x=1$],
    [Có dấu phụ thuộc vào nghiệm]
  ),
  correct: 0,
  num: 3,
  de: "Xét dấu Delta < 0",
  loigiai: [
    $Delta = 1^2 - 4(-2)(-3) = 1 - 24 = -23 < 0$.
    Hệ số $a = -2 < 0$.
    Do $Delta < 0$ nên $f(x)$ luôn cùng dấu với $a$, suy ra $f(x) < 0, forall x in RR$.
  ]
)

#lt-tn(
  [Tìm $m$ để tam thức $f(x) = x^2 - 2x + m > 0, forall x in RR$.],
  (
    [$m > 1$],
    [$m >= 1$],
    [$m < 1$],
    [$m <= 1$]
  ),
  correct: 0,
  num: 4,
  de: "Điều kiện luôn dương",
  loigiai: [
    Để $f(x) > 0, forall x in RR$ thì:
    $cases(a > 0, Delta' < 0)$
    $<=> cases(1 > 0 (text("luôn đúng")), (-1)^2 - m < 0) <=> 1 - m < 0 <=> m > 1$.
  ]
)

#lt-tn(
  [Với giá trị nào của tham số $m$ thì bất phương trình $-x^2 + 4x - m >= 0$ vô nghiệm?],
  (
    [$m < 4$],
    [$m <= 4$],
    [$m > 4$],
    [$m >= 4$]
  ),
  correct: 2,
  num: 5,
  de: "BPT vô nghiệm",
  loigiai: [
    BPT $-x^2 + 4x - m >= 0$ vô nghiệm
    $<=> -x^2 + 4x - m < 0, forall x in RR$.
    Yêu cầu này tương đương với:
    $cases(a = -1 < 0, Delta' < 0) <=> 2^2 - (-1)(-m) < 0 <=> 4 - m < 0 <=> m > 4$.
  ]
)
