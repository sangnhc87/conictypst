// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 2.2B: THỂ TÍCH MÔ HÌNH HOÁ - VẬT THỂ CẮT LÁT
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2.2B: THỂ TÍCH MÔ HÌNH HOÁ",
  subtitle:    "Phương pháp Cắt lát Vật thể và Tròn xoay Thực tế",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Cái nêm gỗ hình trụ")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Thực tế Kỹ thuật:]
    
    Hãy tưởng tượng bạn có một khúc gỗ hình trụ tròn. Bạn dùng cưa cắt chéo qua trục của nó tạo thành một cái nêm gỗ. 
    
    Cái nêm này *KHÔNG PHẢI* là một khối chóp, cũng *KHÔNG PHẢI* là khối nón hay lăng trụ chuẩn! Nó có một mặt cong phức tạp.
    
    Làm sao để tính thể tích của khúc nêm gỗ này? Chúng ta không có công thức lượng giác sẵn. 
    *Giải pháp:* Dùng "Máy cắt lớp" của Toán học — Phương pháp Tích phân thiết diện (Cross-section Method).
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Công thức Tổng quát cho Mọi Vật thể")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Nguyên lý Cắt lát (Nguyên lý Cavalieri mở rộng):*
    Cho một vật thể nằm giữa hai mặt phẳng $x = a$ và $x = b$.
    Dùng một mặt dao phẳng (vuông góc với trục $O x$) cắt ngang vật thể tại toạ độ $x$.
    Diện tích của mặt cắt lộ ra được gọi là $S(x)$.
    
    Khi đó, *Thể tích toàn bộ vật thể* chính là tổng cộng dồn của muôn vàn các lát cắt siêu mỏng từ $a$ đến $b$:
    $ V = integral_a^b S(x) d x $
  ]
  
  #v(0.5em)
  #text(style: "italic")[*Chú ý:* Nếu mặt cắt là hình vuông cạnh $y$, thì $S(x) = y^2$. Nếu mặt cắt là hình bán nguyệt bán kính $y$, thì $S(x) = 1/2 pi y^2$. Chỉ cần tìm quy luật của mặt cắt $S(x)$!]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Bài toán Thể tích Lều Trại")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Ví dụ:* Một cái lều có đáy là hình elip $x^2/16 + y^2/9 = 1$. Khi lấy kéo cắt ngang lều (vuông góc với trục $O x$), mọi lát cắt đều tạo ra một *Tam giác đều*. Tính thể tích cái lều.
    
    *Giải:*
    - Lều nằm dọc theo trục $O x$ từ $x = -4$ đến $x = 4$ (vì $a^2 = 16 => a=4$).
    - Từ PT elip: Nửa chiều rộng đáy tại vị trí $x$ là $y = 3 sqrt(1 - x^2/16)$.
    - Vậy cạnh đáy của tam giác mặt cắt ngang là $2y$.
    - Diện tích tam giác đều cạnh $C$ là $S = (C^2 sqrt(3)) / 4$. Ở đây $C = 2y$, nên $S(x) = (4y^2 sqrt(3))/4 = y^2 sqrt(3)$.
    - Suy ra $S(x) = sqrt(3) dot 9(1 - x^2/16)$.
    - Thể tích: $V = integral_{-4}^4 9 sqrt(3) (1 - x^2/16) d x = 32 sqrt(3) approx 55.43$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Khối Tròn xoay Thực Tế (Cái Lu nước)")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Ví dụ: Sản xuất chum sành (Lu nước)]
    Một cái lu nước có đường cong thành lu mô phỏng theo hàm số $y = 2 + sin(x)$ (đơn vị: dm), với $x$ từ $0$ đến $pi$. Người thợ xoay gốm xoay khối này quanh trục $O x$. Thể tích nước tối đa chứa được là bao nhiêu?
    
    *Giải:*
    Đây là khối tròn xoay quanh trục $O x$. Lát cắt là hình tròn bán kính $y$.
    $ S(x) = pi y^2 = pi (2 + sin(x))^2 $
    $ V = integral_0^pi pi (2 + sin(x))^2 d x = pi integral_0^pi (4 + 4sin(x) + sin^2(x)) d x $
    Áp dụng công thức hạ bậc cho $sin^2(x) = (1 - cos(2x))/2$, tích phân sẽ ra kết quả là $pi(4.5pi + 8) approx 69.5 ("lít")$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Tại sao công thức thể tích khối tròn xoay lại có chứa số $pi$ ($V = pi integral y^2 d x$), còn công thức thể tích vật thể cắt lát nói chung ($V = integral S(x) d x$) lại KHÔNG CHẮC có số $pi$?],
  (
    [Vì khối tròn xoay lớn hơn vật thể bình thường.],
    [Vì lát cắt của khối tròn xoay luôn là Hình tròn (có diện tích $S = pi y^2$), còn lát cắt của vật thể bất kỳ có thể là tam giác, hình vuông (không có $pi$).],
    [Vì công thức đầu tiên bị sai.],
    [Do quy định của sách giáo khoa Toán học.]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Thiết Diện",
  loigiai: [
    Bản chất công thức tròn xoay chỉ là một trường hợp đặc biệt của công thức $V = integral S(x) d x$. Khi xoay quanh trục, mặt cắt sinh ra là hình tròn bán kính $R = f(x)$, diện tích là $S(x) = pi [f(x)]^2$. Số $pi$ sinh ra từ diện tích hình tròn mặt cắt!
  ]
)

#lt-tn(
  [Một kim tự tháp (khối chóp tứ giác đều) có chiều cao $h$, đáy là hình vuông cạnh $a$. Đặt gốc toạ độ ở đỉnh, trục Ox hướng xuống đáy. Tại vị trí toạ độ $x$ (với $0 <= x <= h$), lát cắt ngang là một hình vuông có cạnh tỉ lệ thuận với $x$: $c(x) = a dot x/h$. Thể tích kim tự tháp tính bằng tích phân là:],
  (
    [$integral_0^h (a x/h) d x$],
    [$integral_0^h (a x/h)^2 d x$],
    [$pi integral_0^h (a x/h)^2 d x$],
    [$integral_0^h a^2 d x$]
  ),
  correct: 2,
  num: 2,
  de: "Phần Luyện Tập Thiết Diện",
  loigiai: [
    Vì mặt cắt là hình vuông cạnh $c(x)$, diện tích mặt cắt là $S(x) = [c(x)]^2 = (a x/h)^2$.
    Vậy $V = integral_0^h S(x) d x = integral_0^h (a x/h)^2 d x$.
    *(Giải ra ta được $V = a^2/h^2 [x^3/3]_0^h = 1/3 a^2 h$, chính là công thức thể tích khối chóp quen thuộc!)*
  ]
)

#lt-tn(
  [Tính thể tích $V$ của vật thể nằm giữa hai mặt phẳng $x=0$ và $x=3$, biết rằng thiết diện cắt bởi mặt phẳng vuông góc trục Ox tại điểm có hoành độ $x$ là một nửa hình tròn có bán kính $R(x) = sqrt(x)$.],
  (
    [$V = (9 pi)/2$],
    [$V = (9 pi)/4$],
    [$V = 9/2$],
    [$V = (27 pi)/2$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập Thiết Diện",
  loigiai: [
    Thiết diện là NỬA hình tròn bán kính $R(x) = sqrt(x)$.
    Diện tích thiết diện: $S(x) = 1/2 pi R^2 = 1/2 pi (sqrt(x))^2 = (pi)/2 x$.
    Thể tích $V = integral_0^3 S(x) d x = integral_0^3 (pi)/2 x d x = (pi)/2 [x^2/2]_0^3 = (pi)/2 dot 9/2 = (9 pi)/4$.
  ]
)

#lt-tn(
  [Mô hình cái kèn Trumpet của Gabriel được tạo ra bằng cách quay đường cong $y = 1/x$ (với $x >= 1$ đến vô cực) xung quanh trục Ox. Bỏ qua độ dày của kèn, thể tích bên trong kèn bằng bao nhiêu? (Tính $integral_1^(+oo) pi (1/x)^2 d x$)],
  (
    [Vô cực ($+oo$)],
    [$pi$],
    [$0$],
    [Không tính được]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập Tròn Xoay Nghịch Lý",
  loigiai: [
    $V = lim_(a -> +oo) integral_1^a pi x^(-2) d x = lim_(a -> +oo) [-pi/x]_1^a = lim_(a -> +oo) (-pi/a - (-pi/1)) = 0 + pi = pi$.
    *(Đây là nghịch lý nổi tiếng: Kèn có độ dài vô hạn nhưng thể tích nước chứa được lại hữu hạn và bằng $pi$!)*
  ]
)

#lt-tn(
  [Khi tính thể tích khối tròn xoay của một bánh Donut (hình xuyến), người ta quay một hình tròn nhỏ cách xa trục Ox một khoảng $R$. Nếu ta dùng tích phân, ta phải thiết lập diện tích bằng hiệu của 2 bán kính bình phương: $S(x) = pi(R_("ngoai")^2 - R_("trong")^2)$. Một học sinh viết nhầm thành $S(x) = pi(R_("ngoai") - R_("trong"))^2$. Lỗi sai này dẫn đến hình gì?],
  (
    [Đúng, không sai gì cả.],
    [Thể tích sẽ bị âm.],
    [Học sinh đang tính thể tích của một khối cầu đặc thay vì bánh Donut bị rỗng ở giữa.],
    [Thể tích sẽ lớn hơn thực tế gấp 2 lần.]
  ),
  correct: 3,
  num: 5,
  de: "Phần Luyện Tập Donut",
  loigiai: [
    $(R_("ngoai") - R_("trong"))^2$ chỉ là bình phương bề dày của lớp vỏ. Nếu dùng công thức này, máy tính sẽ hiểu bạn đang lấy nguyên phần thịt Donut nén lại dính sát vào trục Ox, tức là tạo ra một khối đặc liền mạch (như khối cầu/bầu dục), không hề có lỗ hổng ở giữa nữa!
  ]
)
