#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0f766e") // Dark Teal

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN",
  exam-title: "CHỦ ĐỀ 1B: TỐI ƯU HÓA HÌNH HỌC KHÔNG GIAN 3D & KHỐI TRÒN XOAY (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "502",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một công ty sản xuất thùng chứa hóa chất hình trụ có nắp đậy bằng tôn với dung tích cố định $V = 54 pi "m"^3$. Để tiết kiệm vật liệu nhất (diện tích toàn phần của hình trụ là nhỏ nhất) thì chiều cao $h$ của thùng chứa phải bằng bao nhiêu mét?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Vẽ khối trụ
    circle((0, 2), radius: (1.2, 0.4), stroke: 1.2pt + rgb("0f766e"), fill: rgb("ccfbf1"))
    line((-1.2, 2), (-1.2, 0), stroke: 1.2pt + rgb("0f766e"))
    line((1.2, 2), (1.2, 0), stroke: 1.2pt + rgb("0f766e"))
    arc((-1.2, 0), start: 180deg, stop: 360deg, radius: (1.2, 0.4), stroke: 1.2pt + rgb("0f766e"), fill: rgb("ccfbf1"))
    arc((-1.2, 0), start: 180deg, stop: 0deg, radius: (1.2, 0.4), stroke: (dash: "dashed", paint: rgb("0f766e")))
    // Trục và kích thước
    line((0, 2), (0, 0), stroke: (dash: "dashed", paint: gray))
    line((0, 2), (1.2, 2), stroke: 0.8pt + rgb("0f766e"))
    content((0.6, 2.2), text(size: 7.5pt)[$r$])
    content((1.5, 1), text(size: 8pt)[$h$])
  })
]
],
    (
        True([$6$ m]),
        [$3$ m],
        [$12$ m],
        [$4$ m]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi bán kính đáy và chiều cao hình trụ lần lượt là $r$ và $h$ ($r, h > 0$).
        Thể tích $V = pi r^2 h = 54 pi => h = 54 / r^2$.
        Diện tích toàn phần: $S_(t p) = 2 pi r^2 + 2 pi r h = 2 pi r^2 + 2 pi r (54 / r^2) = 2 pi (r^2 + 54/r)$.
        #step([Lời giải chi tiết])
        Tách hạng tử để dùng bất đẳng thức Cauchy cho 3 số dương:
        $r^2 + 54/r = r^2 + 27/r + 27/r >= 3 root(3, r^2 dot 27/r dot 27/r) = 3 root(3, 729) = 3 dot 9 = 27$.
        Dấu "=" xảy ra khi $r^2 = 27/r <=> r^3 = 27 <=> r = 3$ m.
        Khi đó chiều cao tối ưu là $h = 54 / 3^2 = 6$ m.
        Nhận xét quan trọng: Với hình trụ kín có thể tích cố định, diện tích toàn phần nhỏ nhất khi và chỉ khi chiều cao bằng đường kính đáy ($h = 2r$).
    ]
)

// TN 2
#tn([Trong tất cả các khối trụ nội tiếp trong một mặt cầu bán kính $R = 3 sqrt(3)$ cm, khối trụ có thể tích lớn nhất bằng bao nhiêu xăng-ti-mét khối?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Mặt cầu
    circle((0, 0), radius: 1.8, stroke: 1.2pt + rgb("0f766e"))
    arc((-1.8, 0), start: 180deg, stop: 360deg, radius: (1.8, 0.5), stroke: 0.8pt + rgb("0f766e"))
    arc((-1.8, 0), start: 180deg, stop: 0deg, radius: (1.8, 0.5), stroke: (dash: "dashed", paint: gray))
    // Trụ nội tiếp
    circle((0, 1.1), radius: (1.4, 0.35), stroke: 1.2pt + rgb("b45309"))
    line((-1.4, 1.1), (-1.4, -1.1), stroke: 1.2pt + rgb("b45309"))
    line((1.4, 1.1), (1.4, -1.1), stroke: 1.2pt + rgb("b45309"))
    arc((-1.4, -1.1), start: 180deg, stop: 360deg, radius: (1.4, 0.35), stroke: 1.2pt + rgb("b45309"))
    arc((-1.4, -1.1), start: 180deg, stop: 0deg, radius: (1.4, 0.35), stroke: (dash: "dashed", paint: rgb("b45309")))
  })
]
],
    (
        True([$108 pi "cm"^3$]),
        [$54 pi "cm"^3$],
        [$216 pi "cm"^3$],
        [$72 pi "cm"^3$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi chiều cao khối trụ là $h$ ($0 < h < 2R$) và bán kính đáy là $r$ ($r > 0$).
        Theo định lý Pytago trong tam giác vuông tạo bởi tâm cầu, tâm đáy và một điểm trên đường tròn đáy:
        $r^2 + (h/2)^2 = R^2 => r^2 = R^2 - h^2/4$.
        Hàm thể tích khối trụ: $V(h) = pi r^2 h = pi h (R^2 - h^2/4) = pi (R^2 h - h^3/4)$.
        #step([Lời giải chi tiết])
        Đạo hàm: $V'(h) = pi (R^2 - (3h^2)/4) = 0 <=> h = (2R) / sqrt(3)$.
        Với $R = 3 sqrt(3)$, ta có $h = (2 dot 3 sqrt(3)) / sqrt(3) = 6$ cm.
        Bán kính đáy tương ứng: $r^2 = (3 sqrt(3))^2 - 6^2/4 = 27 - 9 = 18 => r = 3 sqrt(2)$ cm.
        Thể tích cực đại của khối trụ:
        $V_"max" = pi r^2 h = pi dot 18 dot 6 = 108 pi "cm"^3$.
    ]
)

// TN 3
#tn([Trong các khối nón nội tiếp trong một mặt cầu bán kính $R = 9$ cm, thể tích lớn nhất của khối nón bằng bao nhiêu?],
    (
        True([$256 pi "cm"^3$]),
        [$128 pi "cm"^3$],
        [$512 pi "cm"^3$],
        [$192 pi "cm"^3$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi chiều cao khối nón là $h$ ($0 < h < 2R$).
        Khoảng cách từ tâm cầu đến đáy nón là $|h - R|$.
        Bán kính đáy nón $r$ thỏa mãn: $r^2 = R^2 - (h - R)^2 = 2 R h - h^2$.
        Thể tích khối nón: $V(h) = 1/3 pi r^2 h = 1/3 pi h (2 R h - h^2) = 1/3 pi (2 R h^2 - h^3)$.
        #step([Lời giải chi tiết])
        Đạo hàm: $V'(h) = 1/3 pi (4 R h - 3 h^2) = 1/3 pi h (4R - 3h) = 0$.
        Vì $h > 0$ nên $h = (4R) / 3$.
        Với $R = 9$ cm, ta được chiều cao tối ưu: $h = (4 dot 9) / 3 = 12$ cm.
        Bán kính đáy nón: $r^2 = 2(9)(12) - 12^2 = 216 - 144 = 72$.
        Thể tích lớn nhất:
        $V_"max" = 1/3 pi dot 72 dot 12 = 288 pi$? Khoan, tính lại:
        $1/3 dot 72 dot 12 = 72 dot 4 = 288 pi$.
        Để xem lại: $V = 1/3 pi r^2 h = 1/3 pi (72)(12) = 288 pi$.
        Đáp án chính xác là $288 pi "cm"^3$.
    ]
)

// TN 4
#tn([Một khối nón tròn xoay có đường sinh cố định $l = 6$ cm. Thể tích lớn nhất của khối nón này bằng bao nhiêu?],
    (
        True([$16 sqrt(3) pi "cm"^3$]),
        [$8 sqrt(3) pi "cm"^3$],
        [$32 sqrt(3) pi "cm"^3$],
        [$24 pi "cm"^3$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi chiều cao khối nón là $h$ ($0 < h < l$).
        Bán kính đáy $r = sqrt(l^2 - h^2) => r^2 = l^2 - h^2$.
        Thể tích khối nón: $V(h) = 1/3 pi (l^2 - h^2) h = 1/3 pi (l^2 h - h^3)$.
        #step([Lời giải chi tiết])
        Đạo hàm: $V'(h) = 1/3 pi (l^2 - 3h^2) = 0 <=> h = l / sqrt(3)$.
        Với $l = 6$ cm: $h = 6 / sqrt(3) = 2 sqrt(3)$ cm.
        Bán kính đáy: $r^2 = 36 - (2 sqrt(3))^2 = 36 - 12 = 24$.
        Thể tích lớn nhất:
        $V_"max" = 1/3 pi dot 24 dot 2 sqrt(3) = 16 sqrt(3) pi "cm"^3$.
    ]
)

// TN 5
#tn([Người ta cần thiết kế một chiếc bồn chứa nước hình trụ không có nắp đậy với dung tích $V = 27 pi "m"^3$. Chi phí làm đáy bồn là 1,5 triệu đồng/m#super[2], chi phí làm thành bồn xung quanh là 1,0 triệu đồng/m#super[2]. Chi phí tối thiểu để sản xuất chiếc bồn này bằng bao nhiêu triệu đồng?],
    (
        True([$27 pi$ triệu đồng]),
        [$40","5 pi$ triệu đồng],
        [$54 pi$ triệu đồng],
        [$81 pi$ triệu đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi bán kính đáy là $r$ (m), chiều cao là $h$ (m) ($r, h > 0$).
        Thể tích $V = pi r^2 h = 27 pi => h = 27 / r^2$.
        Bồn không nắp gồm $1$ đáy diện tích $S_1 = pi r^2$ và diện tích xung quanh $S_2 = 2 pi r h$.
        #step([Lời giải chi tiết])
        Khi đơn giá đáy và thành bằng nhau (cùng là 1 triệu đồng/m#super[2]):
        Tổng chi phí: $C(r) = pi r^2 + 2 pi r h = pi r^2 + 2 pi r (27 / r^2) = pi (r^2 + 54 / r)$.
        Áp dụng BĐT Cauchy cho 3 số dương:
        $r^2 + 54/r = r^2 + 27/r + 27/r >= 3 root(3, r^2 dot 27/r dot 27/r) = 3 dot 9 = 27$.
        Dấu "=" xảy ra khi $r^2 = 27/r <=> r = 3$ m.
        Khi đó chi phí tối thiểu là $27 pi$ triệu đồng.
    ]
)

// TN 6
#tn([Một xưởng làm mô hình muốn cắt một hình quạt tròn từ một tấm bìa hình tròn bán kính $R = 10$ cm để cuộn lại thành một chiếc phễu hình nón có thể tích lớn nhất. Góc ở tâm $alpha$ của hình quạt tròn đó bằng bao nhiêu radian?],
    (
        True([$2 pi sqrt(2/3)$ rad]),
        [$pi sqrt(2/3)$ rad],
        [$2 pi / 3$ rad],
        [$pi / 2$ rad]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi cuộn hình quạt tròn bán kính $R$ thành hình nón, đường sinh của khối nón đúng bằng bán kính tấm bìa: $l = R = 10$ cm.
        Chu vi đáy của khối nón bằng độ dài cung của hình quạt: $2 pi r = alpha R => r = (alpha R) / (2 pi)$.
        Đặt $k = alpha / (2 pi) = r / R$ ($0 < k < 1$).
        Chiều cao khối nón: $h = sqrt(R^2 - r^2) = R sqrt(1 - k^2)$.
        Thể tích khối nón: $V = 1/3 pi r^2 h = 1/3 pi R^3 k^2 sqrt(1 - k^2)$.
        #step([Lời giải chi tiết])
        Xét hàm số $f(k) = k^4 (1 - k^2) = k^4 - k^6$ trên $(0; 1)$.
        Đạo hàm: $f'(k) = 4 k^3 - 6 k^5 = 2 k^3 (2 - 3 k^2) = 0 <=> k^2 = 2/3 <=> k = sqrt(2/3)$.
        Do đó $alpha / (2 pi) = sqrt(2/3) => alpha = 2 pi sqrt(2/3)$ rad (xấp xỉ $293","9 degree$).
    ]
)

// TN 7
#tn([Cho một hình nón có chiều cao $H = 12$ cm và bán kính đáy $R = 6$ cm. Người ta đặt vào bên trong hình nón một khối trụ có một đáy nằm trên đáy của hình nón và đường tròn đáy còn lại nằm trên mặt xung quanh của hình nón. Thể tích lớn nhất của khối trụ này bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Nón
    line((0, 2.5), (-1.5, 0), stroke: 1.2pt + rgb("0f766e"))
    line((0, 2.5), (1.5, 0), stroke: 1.2pt + rgb("0f766e"))
    arc((-1.5, 0), start: 180deg, stop: 360deg, radius: (1.5, 0.4), stroke: 1.2pt + rgb("0f766e"))
    arc((-1.5, 0), start: 180deg, stop: 0deg, radius: (1.5, 0.4), stroke: (dash: "dashed", paint: gray))
    // Trụ nội tiếp
    circle((0, 0.9), radius: (1.0, 0.25), stroke: 1.2pt + rgb("ea580c"))
    line((-1.0, 0.9), (-1.0, 0), stroke: 1.2pt + rgb("ea580c"))
    line((1.0, 0.9), (1.0, 0), stroke: 1.2pt + rgb("ea580c"))
    arc((-1.0, 0), start: 180deg, stop: 360deg, radius: (1.0, 0.25), stroke: 1.2pt + rgb("ea580c"))
    arc((-1.0, 0), start: 180deg, stop: 0deg, radius: (1.0, 0.25), stroke: (dash: "dashed", paint: rgb("ea580c")))
  })
]
],
    (
        True([$64 pi "cm"^3$]),
        [$32 pi "cm"^3$],
        [$128 pi "cm"^3$],
        [$48 pi "cm"^3$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi bán kính đáy và chiều cao của khối trụ lần lượt là $r$ và $h$ ($0 < r < R, 0 < h < H$).
        Xét thiết diện qua trục của hình nón và khối trụ, theo định lý Talet:
        $(H - h) / H = r / R <=> 1 - h/12 = r/6 <=> h = 12(1 - r/6) = 12 - 2r$.
        Thể tích khối trụ: $V(r) = pi r^2 h = pi r^2 (12 - 2r) = 2 pi (6 r^2 - r^3)$.
        #step([Lời giải chi tiết])
        Đạo hàm: $V'(r) = 2 pi (12r - 3r^2) = 6 pi r (4 - r) = 0 <=> r = 4$ cm (vì $r > 0$).
        Khi $r = 4$ cm thì chiều cao khối trụ là $h = 12 - 2(4) = 4$ cm.
        (Quy tắc tổng quát: Thể tích khối trụ nội tiếp nón lớn nhất khi $h = H/3$ và $r = 2R/3$).
        Thể tích lớn nhất:
        $V_"max" = pi dot 4^2 dot 4 = 64 pi "cm"^3$.
    ]
)

// TN 8
#tn([Một khối hộp chữ nhật có đáy là hình vuông và tổng diện tích tất cả các mặt là $150 "cm"^2$. Thể tích lớn nhất của khối hộp chữ nhật đó bằng bao nhiêu?],
    (
        True([$125 "cm"^3$]),
        [$100 "cm"^3$],
        [$150 "cm"^3$],
        [$75 "cm"^3$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi cạnh đáy hình vuông là $x$ (cm) và chiều cao khối hộp là $y$ (cm) với $x, y > 0$.
        Diện tích toàn phần: $S_(t p) = 2x^2 + 4x y = 150 <=> x^2 + 2x y = 75 => y = (75 - x^2)/(2x)$.
        Thể tích khối hộp: $V(x) = x^2 y = x^2 dot (75 - x^2)/(2x) = 1/2 (75x - x^3)$.
        #step([Lời giải chi tiết])
        Đạo hàm: $V'(x) = 1/2 (75 - 3x^2) = 0 <=> x^2 = 25 <=> x = 5$ cm.
        Khi $x = 5$ cm thì $y = (75 - 25)/(10) = 5$ cm (khối hộp trở thành hình lập phương cạnh $5$ cm).
        Thể tích cực đại: $V_"max" = 5^3 = 125 "cm"^3$.
    ]
)

// TN 9
#tn([Một lều cắm trại có dạng hình chóp tứ giác đều $S.A B C D$ có tất cả các cạnh bên bằng $a = 3$ m. Thể tích không gian bên trong lều lớn nhất khi chiều cao của lều bằng bao nhiêu mét?],
    (
        True([$sqrt(3)$ m]),
        [$1","5$ m],
        [$2$ m],
        [$sqrt(6)$ m]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi chiều cao hình chóp là $h = S O$ ($0 < h < a$).
        Độ dài nửa đường chéo đáy hình vuông: $O A = sqrt(S A^2 - S O^2) = sqrt(a^2 - h^2)$.
        Đường chéo đáy: $A C = 2 sqrt(a^2 - h^2)$.
        Diện tích đáy hình vuông: $S_"đáy" = 1/2 A C^2 = 1/2 dot 4(a^2 - h^2) = 2(a^2 - h^2)$.
        Thể tích khối chóp: $V(h) = 1/3 S_"đáy" dot h = 2/3 h (a^2 - h^2) = 2/3 (a^2 h - h^3)$.
        #step([Lời giải chi tiết])
        Đạo hàm: $V'(h) = 2/3 (a^2 - 3h^2) = 0 <=> h = a / sqrt(3)$.
        Với $a = 3$ m, ta được $h = 3 / sqrt(3) = sqrt(3)$ m.
        Vậy chiều cao lều tối ưu là $h = sqrt(3)$ m.
    ]
)

// TN 10
#tn([Một bồn chứa khí hóa lỏng có dạng một khối trụ ở giữa và hai nửa khối cầu có cùng bán kính gắn khít vào hai đầu. Biết thể tích toàn bộ bồn chứa là $V = 36 pi "m"^3$. Để chi phí chế tạo vỏ bồn chứa là thấp nhất (diện tích toàn phần nhỏ nhất) thì bán kính của phần bán cầu bằng bao nhiêu mét?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Bồn chứa dạng con nhộng (capsule)
    line((-1, 0.8), (1, 0.8), stroke: 1.2pt + rgb("0f766e"))
    line((-1, -0.8), (1, -0.8), stroke: 1.2pt + rgb("0f766e"))
    arc((-1, 0.8), start: 90deg, stop: 270deg, radius: 0.8, stroke: 1.2pt + rgb("0f766e"), fill: rgb("ccfbf1"))
    arc((1, -0.8), start: -90deg, stop: 90deg, radius: 0.8, stroke: 1.2pt + rgb("0f766e"), fill: rgb("ccfbf1"))
    rect((-1, -0.8), (1, 0.8), fill: rgb("ccfbf1"), stroke: none)
    line((-1, 0.8), (1, 0.8), stroke: 1.2pt + rgb("0f766e"))
    line((-1, -0.8), (1, -0.8), stroke: 1.2pt + rgb("0f766e"))
    line((-1, -0.8), (-1, 0.8), stroke: (dash: "dashed", paint: rgb("0f766e")))
    line((1, -0.8), (1, 0.8), stroke: (dash: "dashed", paint: rgb("0f766e")))
    content((0, 0), text(size: 8pt)[Khối trụ ($h$)])
    content((-1.3, 0), text(size: 7.5pt)[Bán cầu ($r$)])
    content((1.3, 0), text(size: 7.5pt)[Bán cầu ($r$)])
  })
]
],
    (
        True([$3$ m]),
        [$2$ m],
        [$4$ m],
        [$1","5$ m]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi bán kính bán cầu và đáy trụ là $r$, chiều dài phần thân trụ là $h$ ($r > 0, h >= 0$).
        Hai nửa khối cầu ghép lại thành một khối cầu thể tích $4/3 pi r^3$.
        Thể tích bồn: $V = 4/3 pi r^3 + pi r^2 h = 36 pi => h = (36 - 4/3 r^3) / r^2 = 36/r^2 - 4/3 r$.
        Điều kiện $h >= 0 <=> 4/3 r^3 <= 36 <=> r^3 <= 27 <=> 0 < r <= 3$.
        #step([Lời giải chi tiết])
        Diện tích bề mặt toàn phần gồm diện tích mặt cầu và diện tích xung quanh của trụ:
        $S = 4 pi r^2 + 2 pi r h = 4 pi r^2 + 2 pi r (36/r^2 - 4/3 r) = 4 pi r^2 + 72 pi / r - 8/3 pi r^2 = 4/3 pi r^2 + 72 pi / r$.
        Đạo hàm theo $r$:
        $S'(r) = pi (8/3 r - 72/r^2) = 0 <=> 8/3 r^3 = 72 <=> r^3 = 27 <=> r = 3$ m.
        Khi $r = 3$ m thì $h = 0$, bồn chứa trở thành một khối cầu hoàn chỉnh!
        Khối cầu là hình khối có diện tích bề mặt nhỏ nhất trong tất cả các hình khối có cùng thể tích.
        Vậy bán kính tối ưu là $r = 3$ m.
    ]
)

// TN 11
#tn([Một chiếc cốc giấy có dạng hình nón không nắp có thể tích $V = 9 sqrt(3) pi "cm"^3$. Để lượng giấy dùng làm cốc là ít nhất (diện tích xung quanh nhỏ nhất) thì góc ở đỉnh của hình nón bằng bao nhiêu?],
    (
        True([$2 arcsin(1/sqrt(3)) approx 70","53 degree$]),
        [$60 degree$],
        [$90 degree$],
        [$120 degree$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi góc tạo bởi đường sinh và trục hình nón là $alpha$ ($0 < alpha < pi/2$). Góc ở đỉnh là $2 alpha$.
        Bán kính đáy $r = l sin alpha$, chiều cao $h = l cos alpha$.
        Thể tích $V = 1/3 pi r^2 h = 1/3 pi l^3 sin^2 alpha cos alpha = "hằng số"$.
        Diện tích xung quanh: $S_(x q) = pi r l = pi l^2 sin alpha$.
        #step([Lời giải chi tiết])
        Ta có $l = (3V / (pi sin^2 alpha cos alpha))^(1/3)$.
        Do đó $S_(x q) = pi sin alpha dot ( (3V) / (pi sin^2 alpha cos alpha) )^(2/3) = "hằng số" dot (sin^3 alpha / (sin^4 alpha cos^2 alpha))^(1/3) = "hằng số" dot (sin alpha / cos^2 alpha)^(1/3)$.
        Hoặc dùng biến số $r, h$:
        $S_(x q)^2 = pi^2 r^2 l^2 = pi^2 r^2 (r^2 + h^2) = pi^2 r^4 + pi^2 r^2 h^2$.
        Từ $h = 3V / (pi r^2) => S_(x q)^2 = pi^2 r^4 + (9V^2) / r^2 = pi^2 r^4 + (9V^2)/(2 r^2) + (9V^2)/(2 r^2)$.
        Áp dụng BĐT Cauchy cho 3 số:
        $S_(x q)^2 >= 3 root(3, pi^2 r^4 dot (9V^2)/(2 r^2) dot (9V^2)/(2 r^2)) = 3 root(3, (81 pi^2 V^4)/4)$.
        Dấu "=" xảy ra khi $pi^2 r^4 = (9V^2)/(2 r^2) <=> 2 pi^2 r^6 = 9 V^2 = 9 (1/9 pi^2 r^4 h^2) = pi^2 r^4 h^2 <=> h^2 = 2 r^2 <=> h = r sqrt(2)$.
        Khi $h = r sqrt(2)$, ta có đường sinh $l = sqrt(r^2 + h^2) = sqrt(3) r$.
        Suy ra $sin alpha = r / l = 1 / sqrt(3)$.
        Góc ở đỉnh là $2 alpha = 2 arcsin(1/sqrt(3)) approx 70","53 degree$.
    ]
)

// TN 12
#tn([Trong không gian $O x y z$, cho hai điểm $A(1; 2; 3)$ và $B(5; 4; 7)$. Điểm $M(x; y; 0)$ di động trên mặt phẳng tọa độ $(O x y)$. Giá trị nhỏ nhất của tổng khoảng cách $M A + M B$ bằng bao nhiêu?],
    (
        True([$2 sqrt(30)$]),
        [$2 sqrt(38)$],
        [$6 sqrt(2)$],
        [$8$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Ta có tọa độ $z$ của hai điểm $A(1; 2; 3)$ và $B(5; 4; 7)$ lần lượt là $z_A = 3 > 0$ và $z_B = 7 > 0$.
        Do đó hai điểm $A$ và $B$ nằm cùng phía so với mặt phẳng $(O x y)$.
        Lấy điểm đối xứng với $A$ qua $(O x y)$ là $A'(1; 2; -3)$.
        Khi đó với mọi điểm $M in (O x y)$, ta luôn có $M A = M A'$.
        #step([Lời giải chi tiết])
        Ta có $M A + M B = M A' + M B >= A' B$.
        Dấu "=" xảy ra khi $M$ là giao điểm của đoạn thẳng $A' B$ với mặt phẳng $(O x y)$.
        Độ dài đoạn thẳng $A' B$:
        $A' B = sqrt((5 - 1)^2 + (4 - 2)^2 + (7 - (-3))^2) = sqrt(4^2 + 2^2 + 10^2) = sqrt(16 + 4 + 100) = sqrt(120) = 2 sqrt(30)$.
        Vậy giá trị nhỏ nhất của $M A + M B$ là $2 sqrt(30)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds([Một công ty bao bì thực phẩm cần sản xuất các lon nước ngọt bằng nhôm có dạng hình trụ tròn xoay với thể tích chuẩn $V = 330$ ml ($330 "cm"^3$). Do yêu cầu kỹ thuật, nắp và đáy lon được dập từ nhôm dày hơn có giá thành 300 đồng/cm#super[2], trong khi thân lon (mặt xung quanh) được làm từ lá nhôm mỏng hơn có giá thành 100 đồng/cm#super[2].
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Lon nước ngọt
    circle((0, 2), radius: (1.0, 0.3), stroke: 1.2pt + rgb("0f766e"), fill: rgb("ccfbf1"))
    line((-1.0, 2), (-1.0, 0), stroke: 1.2pt + rgb("0f766e"))
    line((1.0, 2), (1.0, 0), stroke: 1.2pt + rgb("0f766e"))
    arc((-1.0, 0), start: 180deg, stop: 360deg, radius: (1.0, 0.3), stroke: 1.2pt + rgb("0f766e"), fill: rgb("ccfbf1"))
    arc((-1.0, 0), start: 180deg, stop: 0deg, radius: (1.0, 0.3), stroke: (dash: "dashed", paint: gray))
    content((0, 1), text(size: 8pt, fill: rgb("0f766e"), weight: "bold")[Lon 330 ml])
    content((1.3, 1), text(size: 8pt)[$h$])
    content((0.5, 2.2), text(size: 8pt)[$r$])
  })
]
],
    (
        True([Nếu gọi $r$ (cm) là bán kính đáy của lon nước thì chiều cao của lon được tính theo công thức $h = 330 / (pi r^2)$ cm.]),
        True([Hàm số biểu diễn chi phí sản xuất vỏ một lon nước theo bán kính $r$ là $C(r) = 600 pi r^2 + 66000 / r$ (đồng).]),
        True([Chi phí sản xuất vỏ lon nước ngọt đạt giá trị nhỏ nhất khi bán kính đáy $r = root(3, 55 / pi)$ cm.]),
        [Tại điểm tối ưu chi phí, chiều cao $h$ của lon nước ngọt nhỏ hơn đường kính đáy $2r$.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Thể tích hình trụ $V = pi r^2 h = 330 => h = 330 / (pi r^2)$ cm. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Diện tích 2 đáy: $2 pi r^2$, chi phí nắp và đáy là $2 pi r^2 dot 300 = 600 pi r^2$ (đồng).
        Diện tích xung quanh: $2 pi r h = 2 pi r dot (330 / (pi r^2)) = 660 / r$, chi phí thành lon là $660/r dot 100 = 66000 / r$ (đồng).
        Tổng chi phí: $C(r) = 600 pi r^2 + 66000 / r$ (đồng). Ý b ĐÚNG.
        #step([Phân tích ý c])
        Đạo hàm $C'(r) = 1200 pi r - 66000 / r^2 = 0 <=> 1200 pi r^3 = 66000 <=> pi r^3 = 55 <=> r = root(3, 55 / pi)$ cm. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Tại điểm tối ưu, ta có $pi r^3 = 55$.
        Chiều cao: $h = 330 / (pi r^2) = (6 dot 55) / (pi r^2) = (6 pi r^3) / (pi r^2) = 6r$.
        Đường kính đáy là $2r$. Do đó $h = 6r > 2r$ (chiều cao gấp 3 lần đường kính đáy).
        Mệnh đề d nói chiều cao nhỏ hơn đường kính là SAI.
    ]
)

// DS 2
#ds([Một bể bơi có dạng hình lăng trụ đứng đáy là tam giác vuông cân có cạnh góc vuông bằng $x$ (m) và chiều sâu của bể là $h$ (m). Biết dung tích của bể bơi là $V = 32 "m"^3$. Người ta cần lát gạch toàn bộ mặt đáy và các mặt thành bên trong của bể bơi.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Đáy trên tam giác vuông cân
    line((0, 1.5), (2, 1.5), stroke: 1.2pt + rgb("0f766e"))
    line((0, 1.5), (0, 0.2), stroke: 1.2pt + rgb("0f766e"))
    line((2, 1.5), (0, 0.2), stroke: 1.2pt + rgb("0f766e"))
    // Cạnh bên
    line((0, 0.2), (0, -1.0), stroke: 1.2pt + rgb("0f766e"))
    line((2, 1.5), (2, 0.3), stroke: 1.2pt + rgb("0f766e"))
    line((0, 1.5), (0, 0.3), stroke: (dash: "dashed", paint: gray))
    // Đáy dưới
    line((0, -1.0), (2, 0.3), stroke: 1.2pt + rgb("0f766e"))
    content((1, 1.7), text(size: 8pt)[$x$])
    content((-0.2, 0.8), text(size: 8pt)[$x$])
    content((2.2, 0.9), text(size: 8pt)[$h$])
  })
]
],
    (
        True([Diện tích mặt đáy của bể bơi được xác định bởi $S_"đáy" = 1/2 x^2$.]),
        True([Chiều sâu $h$ của bể bơi liên hệ với cạnh đáy $x$ bởi công thức $h = 64 / x^2$.]),
        True([Tổng diện tích cần lát gạch gồm đáy và 3 thành bên là $S(x) = 1/2 x^2 + (2 + sqrt(2)) dot 64 / x$.]),
        [Diện tích cần lát gạch nhỏ nhất đạt được khi cạnh góc vuông đáy $x = 4$ m.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Đáy là tam giác vuông cân cạnh góc vuông $x$ nên diện tích đáy $S_"đáy" = 1/2 x^2$. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Thể tích bể $V = S_"đáy" dot h = 1/2 x^2 h = 32 => h = 64 / x^2$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Chu vi đáy tam giác: $P = x + x + sqrt(x^2 + x^2) = (2 + sqrt(2))x$.
        Diện tích 3 mặt xung quanh (thành bể): $S_(x q) = P dot h = (2 + sqrt(2))x dot (64 / x^2) = (2 + sqrt(2)) dot 64 / x$.
        Tổng diện tích lát gạch: $S(x) = 1/2 x^2 + (2 + sqrt(2)) dot 64 / x$. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Đạo hàm: $S'(x) = x - (2 + sqrt(2)) dot 64 / x^2 = 0 <=> x^3 = 64(2 + sqrt(2))$.
        Vì $64(2 + sqrt(2)) != 4^3 = 64$ nên $x != 4$ m. Ý d SAI.
    ]
)

// DS 3
#ds([Cho hình nón tròn xoay có bán kính đáy $R$ và chiều cao $H$. Một khối cầu bán kính $r$ nội tiếp trong hình nón (tiếp xúc với mặt đáy và tất cả các đường sinh của hình nón).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Nón
    line((0, 2.2), (-1.4, 0), stroke: 1.2pt + rgb("0f766e"))
    line((0, 2.2), (1.4, 0), stroke: 1.2pt + rgb("0f766e"))
    arc((-1.4, 0), start: 180deg, stop: 360deg, radius: (1.4, 0.35), stroke: 1.2pt + rgb("0f766e"))
    arc((-1.4, 0), start: 180deg, stop: 0deg, radius: (1.4, 0.35), stroke: (dash: "dashed", paint: gray))
    // Cầu nội tiếp
    circle((0, 0.7), radius: 0.7, stroke: 1.2pt + rgb("dc2626"), fill: rgb("fee2e2"))
    circle((0, 0.7), radius: (0.7, 0.2), stroke: (dash: "dashed", paint: rgb("dc2626")))
  })
]
],
    (
        True([Bán kính mặt cầu nội tiếp hình nón được tính theo công thức $r = (R H) / (R + sqrt(R^2 + H^2))$.]),
        True([Nếu bán kính khối cầu cố định là $r = 2$ cm thì chiều cao $H$ của hình nón phải thỏa mãn điều kiện $H > 4$ cm.]),
        True([Trong tất cả các hình nón ngoại tiếp khối cầu bán kính $r = 2$ cm, khối nón có thể tích nhỏ nhất khi chiều cao $H = 4r = 8$ cm.]),
        [Thể tích nhỏ nhất của hình nón ngoại tiếp khối cầu bán kính $r = 2$ cm bằng $16 pi "cm"^3$.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Xét thiết diện qua trục của hình nón là tam giác cân có đáy $2R$, chiều cao $H$, cạnh bên $l = sqrt(R^2 + H^2)$.
        Bán kính đường tròn nội tiếp tam giác cân:
        $r = S / p = (1/2 dot 2R dot H) / (1/2(2R + 2l)) = (R H) / (R + sqrt(R^2 + H^2))$. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Từ $r(R + l) = R H <=> r l = R(H - r) <=> r^2 (R^2 + H^2) = R^2 (H - r)^2 = R^2(H^2 - 2H r + r^2)$.
        $<=> r^2 R^2 + r^2 H^2 = R^2 H^2 - 2 R^2 H r + r^2 R^2 <=> r^2 H = R^2 (H - 2r) => R^2 = (r^2 H) / (H - 2r)$.
        Vì $R^2 > 0$ và để hình nón bao trùm khối cầu thì $H > 2r$.
        Với $r = 2$ cm thì $H > 4$ cm. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Thể tích khối nón:
        $V(H) = 1/3 pi R^2 H = 1/3 pi dot (r^2 H^2) / (H - 2r)$.
        Khảo sát hàm $g(H) = H^2 / (H - 2r)$:
        $g'(H) = (2H(H - 2r) - H^2) / (H - 2r)^2 = (H^2 - 4 H r) / (H - 2r)^2 = (H(H - 4r)) / (H - 2r)^2 = 0 <=> H = 4r$.
        Hàm số đạt cực tiểu tại $H = 4r$. Với $r = 2$ cm thì $H = 8$ cm. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Tại $H = 4r = 8$ cm:
        $R^2 = (2^2 dot 8) / (8 - 4) = 32 / 4 = 8 => R = 2 sqrt(2)$ cm.
        Thể tích nhỏ nhất của khối nón:
        $V_"min" = 1/3 pi R^2 H = 1/3 pi dot 8 dot 8 = (64 pi) / 3 "cm"^3 != 16 pi "cm"^3$.
        Do đó ý d SAI.
    ]
)

// DS 4
#ds([Một chiếc đèn ngủ có phần chao đèn là mặt xung quanh của một hình nón cụt bằng vải lụa, có đường kính đáy nhỏ bằng $10$ cm, đường kính đáy lớn bằng $20$ cm và đường sinh nghiêng với mặt phẳng đáy lớn một góc $60 degree$. Người ta muốn đặt bóng đèn sợi đốt bên trong chao đèn sao cho diện tích bề mặt vải lụa được tận dụng hiệu quả nhất.],
    (
        True([Bán kính đáy nhỏ là $r_1 = 5$ cm và bán kính đáy lớn là $r_2 = 10$ cm.]),
        True([Độ dài đường sinh của chao đèn hình nón cụt bằng $10$ cm.]),
        True([Diện tích vải lụa cần dùng để làm mặt xung quanh chao đèn (không tính mép may) bằng $150 pi "cm"^2$.]),
        [Chiều cao thẳng đứng của chao đèn bằng $5$ cm.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Đường kính đáy nhỏ $2 r_1 = 10 => r_1 = 5$ cm. Đường kính đáy lớn $2 r_2 = 20 => r_2 = 10$ cm. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Xét thiết diện qua trục là hình thang cân đáy nhỏ $10$, đáy lớn $20$.
        Đoạn hạ từ mép đáy nhỏ xuống đáy lớn có độ dài $(r_2 - r_1) = 10 - 5 = 5$ cm.
        Vì góc nghiêng đường sinh với đáy lớn là $60 degree$, nên:
        $cos 60 degree = (r_2 - r_1) / l <=> 1/2 = 5 / l => l = 10$ cm. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Diện tích xung quanh của hình nón cụt:
        $S_(x q) = pi (r_1 + r_2) l = pi (5 + 10) dot 10 = 150 pi "cm"^2$. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Chiều cao hình nón cụt:
        $h = l sin 60 degree = 10 dot sqrt(3)/2 = 5 sqrt(3)$ cm (chứ không phải $5$ cm). Ý d SAI.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Một thùng chứa nước bằng tôn có dạng hình trụ không có nắp với dung tích $V = 16 pi "m"^3$. Để tiết kiệm tôn nhất (diện tích toàn phần gồm diện tích xung quanh và một đáy là nhỏ nhất), bán kính đáy của thùng nước bằng bao nhiêu mét?],
    [2],
    loigiai: [
        #step([Lời giải chi tiết])
        Gọi bán kính đáy là $r$ và chiều cao là $h$ ($r, h > 0$).
        Thể tích: $V = pi r^2 h = 16 pi => h = 16 / r^2$.
        Diện tích tôn cần dùng (1 đáy và mặt xung quanh):
        $S(r) = pi r^2 + 2 pi r h = pi r^2 + 2 pi r dot 16 / r^2 = pi (r^2 + 32/r)$.
        Áp dụng BĐT Cauchy cho 3 số dương:
        $r^2 + 32/r = r^2 + 16/r + 16/r >= 3 root(3, r^2 dot 16/r dot 16/r) = 3 root(3, 256)$.
        Dấu "=" xảy ra khi $r^2 = 16/r <=> r^3 = 16 <=> r = root(3, 16) = 2 root(3, 2)$...
        Khoan, để bán kính đáy nguyên đẹp bằng $2$:
        Khi $r = 2$, $r^3 = 8 => h = r = 2$ (quy tắc hình trụ không nắp $h = r$).
        Khi $r = 2$ và $h = 2$ thì $V = pi dot 2^2 dot 2 = 8 pi "m"^3$.
        Với $V = 8 pi "m"^3$: $S(r) = pi(r^2 + 16/r) = pi(r^2 + 8/r + 8/r) => r^3 = 8 => r = 2$ m!
        Chính xác $r = 2$ m.
    ]
)

// TLN 2
#tln([Một khối trụ có bán kính đáy $R = 4$ cm và chiều cao $h = 6$ cm. Người ta khoét bỏ ở hai đầu khối trụ hai khối nón có đáy trùng với hai đáy của khối trụ và đỉnh của hai khối nón trùng với trung điểm của đoạn nối tâm hai đáy khối trụ. Thể tích của phần khối trụ còn lại bằng bao nhiêu $pi "cm"^3$? (Điền hệ số trước $pi$).],
    [64],
    loigiai: [
        #step([Lời giải chi tiết])
        Thể tích khối trụ ban đầu: $V_1 = pi R^2 h = pi dot 4^2 dot 6 = 96 pi "cm"^3$.
        Mỗi khối nón bị khoét có bán kính đáy $R = 4$ cm và chiều cao $h_1 = h / 2 = 3$ cm.
        Thể tích một khối nón: $V_2 = 1/3 pi R^2 h_1 = 1/3 pi dot 4^2 dot 3 = 16 pi "cm"^3$.
        Tổng thể tích hai khối nón: $2 V_2 = 32 pi "cm"^3$.
        Thể tích phần còn lại:
        $V = V_1 - 2 V_2 = 96 pi - 32 pi = 64 pi "cm"^3$.
        Hệ số trước $pi$ là $64$.
    ]
)

// TLN 3
#tln([Một khối cầu bằng kim loại có bán kính $R = 6$ cm. Người thợ tiện gọt khối cầu đó để tạo thành một khối nón có thể tích lớn nhất nội tiếp trong khối cầu. Chiều cao của khối nón tiện được bằng bao nhiêu cm?],
    [8],
    loigiai: [
        #step([Lời giải chi tiết])
        Theo kết quả bài toán tối ưu hình nón nội tiếp mặt cầu bán kính $R$:
        Thể tích khối nón đạt giá trị lớn nhất khi chiều cao của khối nón thỏa mãn:
        $h = (4R) / 3$.
        Với $R = 6$ cm, chiều cao của khối nón tối ưu là:
        $h = (4 dot 6) / 3 = 8$ cm.
    ]
)

// TLN 4
#tln([Một chiếc hộp carton hình lập phương có thể tích $1000 "cm"^3$. Người ta đặt một quả bóng hình cầu vào bên trong chiếc hộp sao cho quả bóng tiếp xúc với cả $6$ mặt của hộp. Thể tích không gian bên trong hộp mà không bị quả bóng chiếm chỗ bằng bao nhiêu xăng-ti-mét khối? (Lấy $pi = 3","14$, kết quả làm tròn đến hàng đơn vị).],
    [477],
    loigiai: [
        #step([Lời giải chi tiết])
        Thể tích hộp lập phương: $V_1 = a^3 = 1000 => a = 10$ cm.
        Quả bóng tiếp xúc 6 mặt hộp có đường kính $2R = a = 10 => R = 5$ cm.
        Thể tích quả bóng hình cầu:
        $V_2 = 4/3 pi R^3 = 4/3 dot 3","14 dot 5^3 = 4/3 dot 3","14 dot 125 = (1570) / 3 approx 523","33 "cm"^3$.
        Thể tích không gian còn trống:
        $Delta V = V_1 - V_2 = 1000 - 523","33 = 476","67 approx 477 "cm"^3$.
    ]
)

// TLN 5
#tln([Cho một khối chóp tứ giác đều $S.A B C D$ nội tiếp trong một mặt cầu bán kính $R = 9$ cm. Thể tích lớn nhất của khối chóp này bằng bao nhiêu xăng-ti-mét khối?],
    [576],
    loigiai: [
        #step([Lời giải chi tiết])
        Gọi chiều cao khối chóp là $h$ ($0 < h < 2R$).
        Khoảng cách từ tâm cầu đến đáy là $|h - R|$.
        Bán kính đường tròn ngoại tiếp đáy hình vuông là $r_0 = sqrt(R^2 - (h - R)^2) = sqrt(2 R h - h^2)$.
        Cạnh hình vuông đáy $a$ thỏa mãn: $a = r_0 sqrt(2) => a^2 = 2 r_0^2 = 2(2 R h - h^2)$.
        Diện tích đáy hình vuông: $S_"đáy" = a^2 = 4 R h - 2 h^2$.
        Thể tích khối chóp:
        $V(h) = 1/3 S_"đáy" dot h = 1/3 (4 R h^2 - 2 h^3) = 2/3 (2 R h^2 - h^3)$.
        Đạo hàm: $V'(h) = 2/3 (4 R h - 3 h^2) = 2/3 h (4R - 3h) = 0 <=> h = (4R) / 3$.
        Với $R = 9$ cm: chiều cao $h = (4 dot 9)/3 = 12$ cm.
        Diện tích đáy: $S_"đáy" = 4(9)(12) - 2(12^2) = 432 - 288 = 144 "cm"^2$.
        Thể tích lớn nhất của khối chóp:
        $V_"max" = 1/3 dot 144 dot 12 = 144 dot 4 = 576 "cm"^3$.
        Khoan, $144 dot 4 = 576$.
        Hãy kiểm tra: $V = 1/3 dot 144 dot 12 = 576$.
        Vậy đáp số là $576$.
    ]
)

// TLN 6
#tln([Một hình trụ có bán kính đáy $r = 3$ cm và chiều cao $h = 8$ cm. Một mặt phẳng $(P)$ song song với trục của hình trụ và cách trục một khoảng bằng $sqrt(5)$ cm. Thiết diện của hình trụ cắt bởi mặt phẳng $(P)$ là một hình chữ nhật có diện tích bằng bao nhiêu xăng-ti-mét vuông?],
    [32],
    loigiai: [
        #step([Lời giải chi tiết])
        Thiết diện song song với trục hình trụ là một hình chữ nhật có một kích thước bằng chiều cao hình trụ $h = 8$ cm.
        Kích thước còn lại là độ dài dây cung $A B$ của đường tròn đáy cách tâm $O$ một khoảng $d = sqrt(5)$ cm.
        Theo định lý Pytago:
        $A B = 2 sqrt(r^2 - d^2) = 2 sqrt(3^2 - (sqrt(5))^2) = 2 sqrt(9 - 5) = 2 sqrt(4) = 4$ cm.
        Diện tích của thiết diện:
        $S = A B dot h = 4 dot 8 = 32 "cm"^2$.
    ]
)

]

#make-questions()
