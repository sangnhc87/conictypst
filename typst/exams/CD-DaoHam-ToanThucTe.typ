#import "../sang-exam.typ": *
#import "../template.typ": *
#import "../bbt.typ": bbbt, bbt-opt
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG & MACRO STYLE (Tương tự CD Chi Phí)
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("1565C0"), rgb("1976D2"), angle: 0deg),
  stroke: none,
  inset: (x: 15pt, y: 10pt),
  radius: 6pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("E67E22")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("E67E22"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1E8449"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ─────────────────────────────────────────────
#let eco-navy = rgb("1B2A4A")
#let eco-amber = rgb("E67E22")
#let eco-green = rgb("1E8449")
#let eco-red = rgb("C0392B")
#let eco-gold = rgb("B7950B")
#let eco-teal = rgb("148F77")

// ─── Hộp Lý Thuyết (nền sáng xanh) ─────────────────────────────
#let eco-box(body) = block(
  fill: rgb("EEF4FB"),
  stroke: (left: 4pt + rgb("1565C0"), rest: 0.8pt + rgb("AACCE0")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

// ─── Hộp Nhận Xét (nền sáng, viền trái cam) ─────────────────
#let note-box(title: "📌 Nhận Xét", body) = block(
  fill: rgb("FFFBF2"),
  stroke: (left: 4pt + eco-amber, rest: 0.6pt + rgb("FAD7A0")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: eco-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ─── Hộp Kết Luận (vàng nhạt) ────────────────────────────────
#let ans-box(body) = block(
  fill: rgb("FFFDE7"),
  stroke: (left: 4pt + eco-gold, rest: 0.6pt + rgb("F9E79F")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: rgb("7D6608"), weight: "bold")[✅ Kết Luận / Đáp án]
  #v(0.3em)
  #body
]

// ─── Hộp Cảnh Báo (đỏ nhạt) ─────────────────────────────────
#let warn-box(body) = block(
  fill: rgb("FDF0EC"),
  stroke: (left: 4pt + eco-red, rest: 0.6pt + rgb("F5B7B1")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: eco-red, weight: "bold")[⚠️ Chú Ý — Bẫy Thường Gặp]
  #v(0.3em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D1B2A"), rgb("1E4A3B"), rgb("0D1B2A"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 22pt),
  )[
    #text(fill: eco-amber, size: 10pt, weight: "bold", tracking: 3pt)[
      CHUYÊN ĐỀ MÔ HÌNH HÓA TOÁN HỌC
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "bold")[Ứng Dụng Đạo Hàm Vào Toán Thực Tế]
    #v(0.4em)
    #text(fill: rgb("A9DFBF"), size: 13pt, style: "italic")[
      Tính đơn điệu và Cực trị trong Y sinh, Kinh tế & Kỹ thuật
    ]
    #v(1em)
    #line(length: 55%, stroke: 0.6pt + eco-amber)
    #v(0.9em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 0.6em,
      align(center)[
        #text(fill: eco-amber, size: 9pt, weight: "bold")[💊 Y SINH HỌC]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8.5pt)[
          Nồng độ thuốc\
          Tốc độ lây lan
        ]
      ],
      align(center)[
        #text(fill: eco-amber, size: 9pt, weight: "bold")[📦 ĐÓNG GÓI]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8.5pt)[
          Tối ưu vật liệu\
          Thể tích cực đại
        ]
      ],
      align(center)[
        #text(fill: eco-amber, size: 9pt, weight: "bold")[💵 KINH TẾ]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8.5pt)[
          Hàm cận biên\
          Tối đa lợi nhuận
        ]
      ],
      align(center)[
        #text(fill: eco-amber, size: 9pt, weight: "bold")[📈 ĐỒ THỊ]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8.5pt)[
          Đọc hiểu biểu đồ\
          Sự thay đổi
        ]
      ],
    )
  ]
]

#v(1.5em)

// ═══════════════════════════════════════════════
// SECTION I: Y SINH HỌC
// ═══════════════════════════════════════════════
= Dạng 1: Mô Hình Y Sinh Học — Nồng Độ Thuốc & Dịch Bệnh

== Bài toán cốt lõi: Nồng độ thuốc trong máu

Khi một bệnh nhân được tiêm hoặc uống thuốc, nồng độ thuốc trong máu $C(t)$ không tăng vô hạn mà tuân theo chu trình hấp thu và đào thải.
Hàm số thường gặp nhất để mô hình hóa nồng độ là hàm phân thức dạng:
$
  C(t) = frac(a t, t^2 + b) quad (t >= 0)
$
Trong đó $t$ là thời gian (giờ), $C(t)$ là nồng độ (mg/L).

#eco-box[
  #text(fill: eco-amber, size: 11pt, weight: "bold")[Phân tích Đạo hàm và Biến thiên]
  #v(0.5em)
  Với $C(t) = frac(a t, t^2 + b)$, ta áp dụng quy tắc đạo hàm $(u/v)'$:
  $
    C'(t) = frac(a(t^2 + b) - a t(2t), (t^2 + b)^2) = frac(a b - a t^2, (t^2 + b)^2) = frac(a(b - t^2), (t^2 + b)^2).
  $
  
  Do mẫu số luôn dương, dấu của $C'(t)$ phụ thuộc vào tử số $b - t^2$:
  - $C'(t) = 0 arrow.double.l.r t^2 = b arrow.double.r t_0 = sqrt(b)$ (vì $t >= 0$).
  - Khi $0 < t < sqrt(b)$, $C'(t) > 0$ $arrow.r$ Nồng độ thuốc *tăng* (Giai đoạn hấp thu).
  - Khi $t > sqrt(b)$, $C'(t) < 0$ $arrow.r$ Nồng độ thuốc *giảm* (Giai đoạn đào thải).
  
  Vậy, nồng độ thuốc đạt *cực đại* tại $t_0 = sqrt(b)$. Nồng độ đỉnh là $C_max = C(sqrt(b)) = frac(a sqrt(b), 2b) = frac(a, 2sqrt(b))$.
]

#v(0.6em)

#tln(
  id: "ToanThucTe-Y1",
  [Nồng độ $C$ (đơn vị: $m g / L$) của một loại thuốc trong máu bệnh nhân sau $t$ giờ tiêm được cho bởi hàm số:
  $
    C(t) = frac(24t, t^2 + 16) quad (t >= 0).
  $
  1) Nồng độ thuốc tăng trong khoảng thời gian nào?
  2) Sau bao lâu thì nồng độ thuốc đạt đỉnh (cao nhất), và giá trị đỉnh đó là bao nhiêu?
  3) Sau thời điểm đạt đỉnh, cần bao nhiêu giờ nữa để nồng độ thuốc giảm xuống chỉ còn một nửa so với lúc đạt đỉnh?],
  [1) $0 < t < 4$; 2) 4 giờ, 3 mg/L; 3) 6.47 giờ nữa],
  loigiai: [
    #ppgiai[
      Đây là bài toán kiểm tra toàn diện về tính đơn điệu (câu 1), cực trị (câu 2) và giải phương trình thực tế (câu 3).
    ]
    *1) Tính đạo hàm và xét tính đơn điệu:*
    $
      C'(t) = frac(24(t^2 + 16) - 24t(2t), (t^2 + 16)^2) = frac(384 - 24t^2, (t^2 + 16)^2) = frac(24(16 - t^2), (t^2 + 16)^2).
    $
    Giải $C'(t) = 0 arrow.double.r 16 - t^2 = 0 arrow.double.r t = 4$ (do $t >= 0$).
    
    Ta có $C'(t) > 0$ khi $t in (0, 4)$ và $C'(t) < 0$ khi $t in (4, +oo)$.
    Vậy nồng độ thuốc *tăng* trong khoảng $(0; 4)$ giờ đầu tiên sau khi tiêm.
    
    *2) Tìm nồng độ cực đại:*
    Từ sự biến thiên, $C(t)$ đạt cực đại tại $t = 4$.
    Nồng độ đỉnh là: $C_max = C(4) = frac(24 dot 4, 4^2 + 16) = frac(96, 32) = 3$ (mg/L).
    
    *3) Thời điểm nồng độ giảm còn một nửa:*
    Một nửa nồng độ đỉnh là $C = 3/2 = 1.5$ mg/L. Ta cần tìm $t > 4$ sao cho $C(t) = 1.5$.
    $
      frac(24t, t^2 + 16) = 1.5 arrow.double.r 1.5 t^2 - 24t + 24 = 0 arrow.double.r t^2 - 16t + 16 = 0.
    $
    Phương trình có hai nghiệm: $t_1 = 8 - 4sqrt(3) approx 1.07$ (loại vì $t < 4$) và $t_2 = 8 + 4sqrt(3) approx 14.93$ (thỏa mãn $t > 4$).
    
    Vậy nồng độ sẽ giảm xuống $1.5$ mg/L tại thời điểm $t approx 14.93$ giờ kể từ lúc tiêm. 
    Số giờ *cần thêm* kể từ lúc đạt đỉnh ($t=4$) là $14.93 - 4 = 10.93$ giờ.
    
    #ans-box[
      1) Thuốc hấp thu (nồng độ tăng) trong khoảng thời gian $(0; 4)$ giờ.\
      2) Đạt đỉnh sau *4 giờ*, nồng độ là *3 mg/L*.\
      3) Cần khoảng *10.93 giờ* nữa kể từ lúc đạt đỉnh để nồng độ giảm còn một nửa.
    ]
  ]
)

#v(0.6em)

== Mô Hình Logistic Trong Dịch Bệnh

Hàm Logistic mô tả sự tăng trưởng có giới hạn (chẳng hạn như số lượng người bị nhiễm bệnh trong một quần thể).
Hàm số có dạng:
$
  N(t) = frac(L, 1 + A e^(-k t))
$
Trong đó $L$ là giới hạn tối đa của quần thể (sức chứa), $k > 0$ là hệ số tốc độ lây lan.

#note-box(title: "Đặc điểm của hàm Logistic")[
  - Đạo hàm $N'(t) > 0$ với mọi $t$: Số người nhiễm bệnh luôn *tăng đơn điệu*.
  - Tuy nhiên, tốc độ lây lan (chính là $N'(t)$) không tăng mãi. Tốc độ này đạt cực đại tại một *điểm uốn* của đồ thị $N(t)$. Tại thời điểm đó, số ca nhiễm mới mỗi ngày là cao nhất (đỉnh dịch).
  - Khảo sát sự thay đổi tốc độ lây lan, ta có một đẳng thức cực kỳ đẹp mắt của phương trình vi phân:
    $ N'(t) = k N(t) (1 - frac(N(t), L)) $
    Suy ra tốc độ lây lan $N'$ lớn nhất khi số người nhiễm đạt đúng một nửa sức chứa: $N = L/2$.
]

#tln(
  id: "ToanThucTe-Y2",
  [Sự lây lan của một loại virus trong một cộng đồng nhỏ 10,000 người được mô hình hóa bởi hàm số:
  $
    N(t) = frac(10000, 1 + 999 e^(-0.2 t))
  $
  với $N(t)$ là số người bị nhiễm bệnh sau $t$ ngày ($t >= 0$).
  Hỏi sau bao nhiêu ngày thì *tốc độ lây lan* của dịch bệnh là lớn nhất (đỉnh dịch)?],
  [$t approx 34.5$ ngày],
  loigiai: [
    *1) Tính tốc độ lây lan $V(t)$:*
    Tốc độ lây lan là đạo hàm bậc nhất của $N(t)$.
    $
      V(t) = N'(t) = - frac(10000 dot (-199.8 e^(-0.2 t)), (1 + 999 e^(-0.2 t))^2) = frac(1\,998\,000 e^(-0.2 t), (1 + 999 e^(-0.2 t))^2).
    $
    *Mẹo Tính Toán (Dùng tính chất của Logistic):*
    Ta biết $N'(t)$ lớn nhất khi $N(t) = L/2 = 10000/2 = 5000$.

    *2) Tìm thời gian $t$:*
    Cho $N(t) = 5000$:
    $
      frac(10000, 1 + 999 e^(-0.2 t)) = 5000 arrow.double.r 1 + 999 e^(-0.2 t) = 2
    $
    $
      999 e^(-0.2 t) = 1 arrow.double.r e^(-0.2 t) = frac(1, 999) arrow.double.r -0.2 t = -ln(999)
    $
    $
      t = frac(ln(999), 0.2) = 5 ln(999) approx 5 dot 6.906 = 34.53.
    $
    
    #ans-box[
      Tốc độ lây lan đạt lớn nhất tại thời điểm *khoảng 34.5 ngày* (lúc này vừa đúng một nửa dân số đã bị nhiễm).
    ]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Axes
        line((-0.2, 0), (8, 0), mark: (end: ">", size: 0.2), stroke: 0.8pt)
        line((0, -0.2), (0, 6), mark: (end: ">", size: 0.2), stroke: 0.8pt)
        content((8.2, 0), text(size: 10pt)[$t$])
        content((0.2, 6.2), text(size: 10pt)[$N(t)$])
        content((-0.2, -0.2), text(size: 10pt)[$O$])
        
        // Ticks for N(t)
        for i in range(1, 6) {
          line((-0.1, i), (0.1, i), stroke: 0.5pt)
        }
        content((-0.6, 5), text(size: 8pt)[$10000$])
        content((-0.6, 2.5), text(size: 8pt)[$5000$])
        
        let pts = ()
        for i in range(0, 81, step: 2) {
          let t = float(i)
          let y = 10000.0 / (1.0 + 999.0 * calc.exp(-0.2 * t))
          pts.push((t / 10.0, y / 2000.0))
        }
        line(..pts, stroke: (paint: blue, thickness: 1.5pt))
        
        let t_u = 34.53
        let y_u = 5000.0
        circle((t_u / 10.0, y_u / 2000.0), radius: 0.1, fill: red)
        content((t_u / 10.0 + 1.2, y_u / 2000.0 - 0.3), box(fill: white, inset: 2pt)[Điểm uốn])
        
        // Asymptote
        line((0, 5), (7.8, 5), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      })
    ]
  ]
)

#v(0.6em)

#tln(
  id: "ToanThucTe-Y3",
  [Một con cá hồi bơi ngược dòng để vượt một khoảng cách là $300 " km"$. Vận tốc của dòng nước là $6 " km/h"$. Nếu cá bơi với vận tốc $v$ (km/h) đối với nước thì năng lượng tiêu hao của cá trong $t$ giờ được cho bởi công thức $E(v) = c v^3 t$, trong đó $c$ là một hằng số dương cho trước. Hỏi cá bơi với vận tốc $v$ bằng bao nhiêu để năng lượng tiêu hao là ít nhất?],
  [$v = 9 " km/h"$],
  loigiai: [
    *1) Thiết lập hàm năng lượng tiêu hao:*
    Vận tốc của cá so với bờ là $v - 6$ (điều kiện $v > 6$).
    Thời gian cá bơi hết quãng đường 300 km là:
    $ t = frac(300, v - 6). $
    Thay $t$ vào công thức năng lượng, ta có hàm năng lượng theo $v$:
    $ E(v) = c v^3 (frac(300, v - 6)) = 300c frac(v^3, v - 6) quad (v > 6). $
    
    *2) Tìm vận tốc tối ưu:*
    Ta cần tìm giá trị nhỏ nhất của hàm số $f(v) = frac(v^3, v - 6)$ trên khoảng $(6, +oo)$.
    Tính đạo hàm:
    $ f'(v) = frac(3v^2(v - 6) - v^3(1), (v - 6)^2) = frac(3v^3 - 18v^2 - v^3, (v - 6)^2) = frac(2v^3 - 18v^2, (v - 6)^2). $
    Giải phương trình $f'(v) = 0$:
    $ 2v^3 - 18v^2 = 0 arrow.double.r 2v^2(v - 9) = 0. $
    Do $v > 6$ nên phương trình chỉ có nghiệm $v = 9$.
    Lập bảng biến thiên của $f(v)$ trên $(6, +oo)$, ta thấy $f'(v) < 0$ với $v in (6, 9)$ và $f'(v) > 0$ với $v in (9, +oo)$.
    Vậy $f(v)$ đạt giá trị nhỏ nhất tại $v = 9$.
    
    #ans-box[
      Để tiêu hao ít năng lượng nhất, cá hồi cần bơi với vận tốc *9 km/h* so với nước (tức là 3 km/h so với bờ). 
    ]
  ]
)

#v(1.5em)

// ═══════════════════════════════════════════════
// SECTION II: HÌNH HỌC & TỐI ƯU VẬT LIỆU
// ═══════════════════════════════════════════════
= Dạng 2: Mô Hình Hình Học — Bài Toán Tối Ưu Đóng Gói

Trong công nghiệp sản xuất bao bì, việc thiết kế vỏ hộp sao cho tốn ít nguyên vật liệu nhất (diện tích toàn phần nhỏ nhất) mà vẫn chứa được lượng thể tích yêu cầu là một bài toán tối ưu hóa kinh điển.

== Bài toán 1: Tối ưu lon hình trụ (Bài toán lon sữa bò)

Một nhà máy cần sản xuất các lon sữa bò hình trụ có thể tích $V$ không đổi. Tìm bán kính đáy $r$ và chiều cao $h$ để chi phí kim loại làm vỏ lon là nhỏ nhất.

#eco-box[
  #text(fill: eco-amber, size: 11pt, weight: "bold")[Phương pháp giải bài toán tối ưu hình học]
  #v(0.5em)
  - *Bước 1:* Viết hàm mục tiêu cần tối ưu (thường là Thể tích $V$ hoặc Diện tích toàn phần $S_"tp"$).
    $ S_"tp" = 2 pi r^2 + 2 pi r h $
  - *Bước 2:* Sử dụng điều kiện ràng buộc để rút bớt một ẩn.
    Thể tích $V = pi r^2 h arrow.double.r h = frac(V, pi r^2)$.
  - *Bước 3:* Thế vào hàm mục tiêu để tạo thành hàm một biến (theo $r$).
    $ S_"tp"(r) = 2 pi r^2 + 2 pi r (frac(V, pi r^2)) = 2 pi r^2 + frac(2V, r). $
  - *Bước 4:* Lấy đạo hàm, lập bảng biến thiên để tìm cực trị.
    $ S'_"tp"(r) = 4 pi r - frac(2V, r^2). $
    $ S'_"tp"(r) = 0 arrow.double.l.r 4 pi r^3 = 2V arrow.double.l.r 2 pi r^2 (2 r) = 2 pi r^2 h arrow.double.l.r h = 2r. $
  
  *Kết luận đẹp mắt:* Để tối ưu nguyên liệu, chiều cao của hình trụ phải luôn bằng đường kính đáy!
]

#v(0.6em)

#tln(
  id: "ToanThucTe-H1",
  [Một cơ sở sản xuất cần làm những chiếc hộp hình trụ có nắp đậy với thể tích là $1000 " cm"^3$. Bán kính đáy $r$ của chiếc hộp nên là bao nhiêu cm để diện tích toàn phần của hộp nhỏ nhất? (Làm tròn đến 1 chữ số thập phân).],
  [$r approx 5.4$ cm],
  loigiai: [
    Gọi $r, h$ lần lượt là bán kính đáy và chiều cao của hộp trụ ($r, h > 0$).
    Theo giả thiết, thể tích $V = pi r^2 h = 1000 arrow.double.r h = frac(1000, pi r^2)$.
    
    Hàm diện tích toàn phần (hàm cần cực tiểu hóa):
    $
      S(r) = 2 pi r^2 + 2 pi r h = 2 pi r^2 + 2 pi r dot frac(1000, pi r^2) = 2 pi r^2 + frac(2000, r).
    $
    
    Tính đạo hàm:
    $
      S'(r) = 4 pi r - frac(2000, r^2).
    $
    Giải phương trình $S'(r) = 0$:
    $
      4 pi r = frac(2000, r^2) arrow.double.r r^3 = frac(500, pi) arrow.double.r r = root(3, frac(500, pi)) approx 5.42 " cm".
    $
    Lập bảng biến thiên dễ thấy $S(r)$ đạt cực tiểu tại $r approx 5.42$.
    
    #ans-box[
      Để tốn ít nguyên liệu nhất, bán kính đáy hộp nên được chọn là *5.4 cm*. Khi đó chiều cao $h = 2r approx 10.8$ cm.
    ]
  ]
)

#v(0.6em)

== Bài toán 2: Tối ưu hóa thời gian di chuyển (Nguyên lý Fermat)

#eco-box[
  #text(fill: eco-amber, size: 11pt, weight: "bold")[Bài toán quãng đường ngắn nhất / Thời gian ít nhất]
  #v(0.5em)
  Các bài toán dạng này thường yêu cầu tìm vị trí của một điểm trung gian trên một đường thẳng (bờ biển, bờ sông, đường đi) sao cho tổng thời gian đi từ điểm $A$ đến điểm $B$ qua điểm trung gian đó là ít nhất.
  - Sử dụng định lý Pytago để thiết lập độ dài quãng đường.
  - Thời gian $t = frac(S, v)$ hoặc Chi phí $C = S dot "Đơn giá"$.
]

#v(0.6em)

#tln(
  id: "ToanThucTe-H2",
  [Một hòn đảo $A$ cách bờ biển $d = 3$ km. Một trạm biến áp $B$ nằm trên bờ biển cách điểm $H$ (hình chiếu của $A$ lên bờ biển) một khoảng $8$ km. Người ta cần kéo đường dây điện từ $A$ đến $B$ qua một điểm $C$ nằm trên đoạn $H B$. Biết chi phí kéo cáp dưới nước là 500 triệu đồng/km, còn trên bờ là 300 triệu đồng/km. Điểm $C$ nên cách $H$ bao xa để tổng chi phí là nhỏ nhất?],
  [$H C = 2.25$ km],
  loigiai: [
    Gọi $x$ (km) là khoảng cách từ $H$ đến điểm $C$ ($0 <= x <= 8$).
    Khi đó, đoạn $C B$ trên bờ có độ dài là $8 - x$.
    Đoạn $A C$ dưới biển có độ dài tính theo định lý Pytago:
    $ A C = sqrt(A H^2 + H C^2) = sqrt(3^2 + x^2) = sqrt(x^2 + 9). $
    
    Hàm tổng chi phí (triệu đồng) theo $x$ là:
    $ f(x) = 500 sqrt(x^2 + 9) + 300(8 - x). $
    
    Tính đạo hàm:
    $ f'(x) = 500 dot frac(2x, 2 sqrt(x^2 + 9)) - 300 = frac(500x, sqrt(x^2 + 9)) - 300. $
    
    Giải phương trình $f'(x) = 0$:
    $ frac(500x, sqrt(x^2 + 9)) = 300 arrow.double.r 5x = 3 sqrt(x^2 + 9) arrow.double.r 25x^2 = 9(x^2 + 9). $
    $ 16x^2 = 81 arrow.double.r x^2 = frac(81, 16) arrow.double.r x = 2.25 " (do " x > 0 ")." $
    
    Vì $f''(x) > 0$ trên $(0, 8)$, hàm số đạt giá trị nhỏ nhất tại $x = 2.25$.
    
    #ans-box[
      Để chi phí nhỏ nhất, điểm $C$ phải cách điểm $H$ một khoảng *2.25 km*. 
    ]
  ]
)

#v(1.5em)

// ═══════════════════════════════════════════════
// SECTION III: MÔ HÌNH KINH TẾ (PHÂN TÍCH CẬN BIÊN)
// ═══════════════════════════════════════════════
= Dạng 3: Mô Hình Kinh Tế — Phân Tích Cận Biên

Phân tích cận biên (Marginal Analysis) là một trong những ứng dụng thực tế và quan trọng nhất của đạo hàm trong Kinh tế học.

== Các khái niệm cốt lõi

Giả sử $x$ là số lượng sản phẩm được sản xuất và bán ra.
- *Hàm chi phí $C(x)$:* Tổng chi phí để sản xuất $x$ sản phẩm.
- *Hàm doanh thu $R(x)$:* Tổng số tiền thu được khi bán $x$ sản phẩm.
- *Hàm lợi nhuận $P(x)$:* $P(x) = R(x) - C(x)$.

#eco-box[
  #text(fill: eco-amber, size: 11pt, weight: "bold")[Ý nghĩa của Đạo hàm trong Kinh tế (Cận biên)]
  #v(0.5em)
  Trong kinh tế học, đạo hàm của các hàm trên theo $x$ được gọi là các đại lượng *Cận biên* (Marginal):
  - *Chi phí cận biên* $M C(x) = C'(x)$: Xấp xỉ chi phí để sản xuất thêm *một* sản phẩm tiếp theo (sản phẩm thứ $x+1$).
  - *Doanh thu cận biên* $M R(x) = R'(x)$: Xấp xỉ doanh thu thu thêm được khi bán thêm *một* sản phẩm tiếp theo.
  - *Lợi nhuận cận biên* $M P(x) = P'(x)$: Xấp xỉ lợi nhuận tăng thêm từ việc bán thêm một sản phẩm.
  
  *Nguyên lý tối đa hóa lợi nhuận:*
  Lợi nhuận $P(x)$ đạt cực đại khi đạo hàm $P'(x) = 0$, tức là:
  $ P'(x) = R'(x) - C'(x) = 0 arrow.double.l.r R'(x) = C'(x) $
  *Kết luận vàng:* Doanh nghiệp đạt lợi nhuận tối đa tại mức sản lượng mà *Doanh thu cận biên bằng Chi phí cận biên* ($M R = M C$). Nếu $M R > M C$, sản xuất thêm sẽ có lãi. Nếu $M R < M C$, sản xuất thêm sẽ bị lỗ.
]

#v(0.6em)

#tln(
  id: "ToanThucTe-K1",
  [Một công ty sản xuất một loại thiết bị điện tử. Chi phí (đơn vị: triệu đồng) để sản xuất $x$ thiết bị mỗi ngày được cho bởi hàm số:
  $ C(x) = 100 + 12x - 0.05x^2 quad (0 <= x <= 200). $
  Giá bán của mỗi thiết bị (phụ thuộc vào số lượng bán ra) là:
  $ p(x) = 40 - 0.1x quad ("triệu đồng"). $
  1) Hãy tìm hàm doanh thu $R(x)$ và tính Doanh thu cận biên, Chi phí cận biên tại mức sản lượng $x = 100$. Giải thích ý nghĩa của hai con số này.
  2) Công ty nên sản xuất bao nhiêu thiết bị mỗi ngày để lợi nhuận đạt mức tối đa? Lợi nhuận tối đa đó là bao nhiêu?],
  [1) $M R(100) = 20$, $M C(100) = 2$; 2) $x = 200$, Lợi nhuận: 3500 triệu],
  loigiai: [
    *1) Hàm doanh thu và tính các giá trị cận biên:*
    Doanh thu = (Số lượng) $times$ (Đơn giá):
    $ R(x) = x dot p(x) = x(40 - 0.1x) = 40x - 0.1x^2. $
    
    Đạo hàm các hàm (Các hàm cận biên):
    - Doanh thu cận biên: $M R(x) = R'(x) = 40 - 0.2x$.
    - Chi phí cận biên: $M C(x) = C'(x) = 12 - 0.1x$.
    
    Tại $x = 100$:
    - $M R(100) = 40 - 0.2(100) = 20$ (triệu đồng/sản phẩm).
    - $M C(100) = 12 - 0.1(100) = 2$ (triệu đồng/sản phẩm).
    
    *Ý nghĩa:* Tại mức sản lượng 100 thiết bị, nếu công ty sản xuất và bán thêm thiết bị thứ 101, chi phí tăng thêm khoảng 2 triệu đồng nhưng doanh thu mang lại tăng thêm khoảng 20 triệu đồng. Vì $M R > M C$, công ty nên tiếp tục tăng sản lượng.
    
    *2) Tối đa hóa lợi nhuận:*
    Hàm lợi nhuận: 
    $ P(x) = R(x) - C(x) = (40x - 0.1x^2) - (100 + 12x - 0.05x^2) = -0.05x^2 + 28x - 100. $
    
    Tính đạo hàm và giải phương trình $P'(x) = 0$:
    $ P'(x) = -0.1x + 28 = 0 arrow.double.r 0.1x = 28 arrow.double.r x = 280. $
    
    Tuy nhiên, theo giả thiết bài toán, năng lực sản xuất tối đa của nhà máy chỉ là $x = 200$. 
    Khảo sát hàm $P(x)$ trên đoạn $[0, 200]$: 
    Ta có $P'(x) = -0.1x + 28 > 0$ với mọi $x in [0, 200]$.
    Vậy hàm $P(x)$ đồng biến trên đoạn $[0, 200]$. Lợi nhuận lớn nhất đạt được tại mức sản lượng cực đại cho phép là $x = 200$.
    
    Lợi nhuận tối đa:
    $ P(200) = -0.05(200)^2 + 28(200) - 100 = -2000 + 5600 - 100 = 3500 " (triệu đồng)". $
    
    #ans-box[
      1) $M R(100) = 20$, $M C(100) = 2$. Doanh thu tăng nhiều hơn chi phí nên cần tăng sản xuất.\
      2) Do điểm tối ưu lý thuyết ($x=280$) vượt quá năng lực, công ty nên sản xuất hết công suất là *200 thiết bị*, thu lợi nhuận tối đa *3.5 tỷ đồng*.
    ]
  ]
)

#v(0.6em)

== Bài toán 2: Chi phí trung bình (Average Cost)

#eco-box[
  #text(fill: eco-amber, size: 11pt, weight: "bold")[Mối liên hệ giữa Chi phí trung bình và Chi phí cận biên]
  #v(0.5em)
  - *Chi phí trung bình* trên một sản phẩm: $A C(x) = frac(C(x), x)$.
  - *Nguyên lý tối ưu:* Chi phí trung bình đạt giá trị nhỏ nhất khi *Chi phí trung bình bằng Chi phí cận biên*:
    $ A C(x) = M C(x) $
]

#v(0.6em)

#tln(
  id: "ToanThucTe-K2",
  [Tổng chi phí (triệu đồng) để sản xuất $x$ chiếc xe đạp được cho bởi hàm số $C(x) = 4000 + 10x + 0.1x^2$. 
  1) Tính chi phí trung bình để sản xuất một chiếc xe đạp khi $x = 100$.
  2) Nhà máy nên sản xuất bao nhiêu chiếc xe đạp để chi phí trung bình cho mỗi chiếc xe là thấp nhất? Chi phí trung bình thấp nhất đó là bao nhiêu?],
  [1) 60 triệu; 2) $x = 200$, Giá: 50 triệu],
  loigiai: [
    *1) Chi phí trung bình khi sản xuất 100 chiếc:*
    Hàm chi phí trung bình: $A C(x) = frac(C(x), x) = frac(4000, x) + 10 + 0.1x$.
    Tại $x = 100$: $A C(100) = frac(4000, 100) + 10 + 0.1(100) = 40 + 10 + 10 = 60$ (triệu đồng).
    
    *2) Tối ưu hóa chi phí trung bình:*
    Để tìm giá trị nhỏ nhất của $A C(x)$, ta giải phương trình đạo hàm bằng 0:
    $ A C'(x) = -frac(4000, x^2) + 0.1 = 0 arrow.double.r 0.1x^2 = 4000 arrow.double.r x^2 = 40000 arrow.double.r x = 200. $
    Hoặc sử dụng nguyên lý $A C(x) = M C(x)$:
    Chi phí cận biên: $M C(x) = C'(x) = 10 + 0.2x$.
    $ frac(4000, x) + 10 + 0.1x = 10 + 0.2x arrow.double.r frac(4000, x) = 0.1x arrow.double.r x^2 = 40000 arrow.double.r x = 200. $
    Cả hai cách đều cho ra sản lượng tối ưu $x = 200$.
    Chi phí trung bình thấp nhất: $A C(200) = frac(4000, 200) + 10 + 0.1(200) = 20 + 10 + 20 = 50$ (triệu đồng).
    
    #ans-box[
      Để chi phí trung bình thấp nhất, nhà máy nên sản xuất *200 chiếc xe*. Lúc đó chi phí sản xuất mỗi chiếc là *50 triệu đồng*.
    ]
  ]
)

#v(1.5em)

// ═══════════════════════════════════════════════
// SECTION IV: PHÂN TÍCH ĐỒ THỊ THỰC TẾ
// ═══════════════════════════════════════════════
= Dạng 4: Đọc Đồ Thị Trong Thực Tế

Trong thực tế, nhiều khi ta không có sẵn phương trình hàm số mà chỉ có dữ liệu được biểu diễn dưới dạng đồ thị. Kỹ năng quan trọng nhất là đọc được "vận tốc" và "gia tốc" của sự thay đổi thông qua hình dáng đồ thị.

== Đạo hàm bậc 1 và Bậc 2 trên đồ thị

Cho đồ thị của một đại lượng $f(t)$ theo thời gian (ví dụ: quãng đường, tổng số ca nhiễm, tổng doanh thu):
- $f'(t) > 0$: Đồ thị đi lên (đại lượng đang tăng).
- $f'(t) < 0$: Đồ thị đi xuống (đại lượng đang giảm).
- $f''(t) > 0$: Đồ thị lõm (bề lõm hướng lên). Tốc độ tăng đang *tăng dần* (tăng tốc).
- $f''(t) < 0$: Đồ thị lồi (bề lõm hướng xuống). Tốc độ tăng đang *chậm dần* (giảm tốc).
- Điểm uốn ($f''(t) = 0$): Nơi đồ thị chuyển từ lồi sang lõm (hoặc ngược lại). Tại đây, đạo hàm bậc 1 $f'(t)$ (tốc độ thay đổi) đạt cực đại hoặc cực tiểu.

#eco-box[
  #text(fill: eco-amber, size: 11pt, weight: "bold")[Bí kíp đọc nhanh đồ thị]
  #v(0.5em)
  - Đang cong lên trên (như cái bát ngửa): $f''(t) > 0$.
  - Đang cong xuống dưới (như cái bát úp): $f''(t) < 0$.
  - Điểm dốc nhất trên một đoạn đồ thị tăng chính là *điểm uốn*, và tại đó tốc độ tăng là lớn nhất!
]

#v(0.6em)

#tln(
  id: "ToanThucTe-G1",
  [Đồ thị biểu diễn tổng số ca nhiễm bệnh $N(t)$ trong một đợt dịch có dạng một đường cong chữ S (Logistic). Gọi $t_2$ là điểm uốn của đồ thị, đồ thị lõm trước $t_2$ và lồi sau $t_2$.
  1) Từ ngày $t_1$ (trước $t_2$) đến $t_2$, dịch bệnh lây lan nhanh lên hay chậm đi?
  2) Ngày nào là ngày có số ca nhiễm mới cao nhất (đỉnh dịch)? Giải thích.],
  [1) Nhanh lên; 2) Ngày $t_2$],
  loigiai: [
    *1) Phân tích tốc độ trong khoảng $(t_1, t_2)$:*
    Trong khoảng này, đồ thị $N(t)$ đi lên ($N'(t) > 0$) và có bề lõm hướng lên trên (hình cái bát ngửa, tức là $N''(t) > 0$). 
    Vì đạo hàm bậc hai dương, nên đạo hàm bậc nhất $N'(t)$ (số ca nhiễm mới mỗi ngày) đang tăng. Vậy dịch bệnh lây lan *nhanh lên*.
    
    *2) Phân tích đỉnh dịch:*
    Đỉnh dịch xảy ra khi số ca nhiễm mới mỗi ngày là cao nhất, tức là đạo hàm $N'(t)$ đạt cực đại.
    Hàm số $N'(t)$ đạt cực đại khi đạo hàm của nó bằng 0, tức là $N''(t) = 0$.
    Trên đồ thị $N(t)$, vị trí mà $N''(t) = 0$ chính là *điểm uốn* (điểm chuyển từ lõm sang lồi). Theo giả thiết, đó chính là điểm $t_2$.
    
    Sau điểm $t_2$, đồ thị vẫn đi lên nhưng có hình dáng lồi (bát úp, $N''(t) < 0$), nghĩa là số ca nhiễm mới bắt đầu *giảm dần*.
    
    #ans-box[
      1) Từ $t_1$ đến $t_2$: Dịch lây lan *nhanh dần*.\
      2) Đỉnh dịch (số ca nhiễm mới cao nhất) xảy ra tại *ngày $t_2$* (điểm uốn của đồ thị).
    ]
  ]
)

#v(1.5em)

// ═══════════════════════════════════════════════
// SECTION V: BÀI TẬP TỰ LUYỆN
// ═══════════════════════════════════════════════
= Dạng 5: Bài Tập Tự Luyện Tổng Hợp

== Trắc nghiệm nhiều lựa chọn

#tn(
  id: "ToanThucTe-TN1",
  [Một công ty bán $x$ sản phẩm với giá $p(x) = 120 - 0.2x$ (nghìn đồng/sản phẩm). Hàm chi phí là $C(x) = 500 + 20x$. Mức sản lượng $x$ để công ty đạt lợi nhuận tối đa là:],
  ([$x = 200$], True([$x = 250$]), [$x = 300$], [$x = 400$]),
  loigiai: [
    Doanh thu: $R(x) = x(120 - 0.2x) = 120x - 0.2x^2$.
    Lợi nhuận: $P(x) = R(x) - C(x) = -0.2x^2 + 100x - 500$.
    $P'(x) = -0.4x + 100 = 0 arrow.double.r x = 250$.
    #ans-box[Mức sản lượng tối ưu là *250 sản phẩm*.]
  ]
)

#tn(
  id: "ToanThucTe-TN2",
  [Nồng độ thuốc trong máu tính theo công thức $C(t) = frac(10t, t^2 + 25)$. Nồng độ thuốc đạt đỉnh sau bao nhiêu giờ?],
  ([$2.5$ giờ], True([$5$ giờ]), [$10$ giờ], [$25$ giờ]),
  loigiai: [
    Hàm dạng $C(t) = frac(a t, t^2 + b)$. Cực đại đạt tại $t = sqrt(b)$.
    Ở đây $b = 25 arrow.double.r t = sqrt(25) = 5$ giờ.
    #ans-box[Nồng độ đạt đỉnh sau *5 giờ*.]
  ]
)

== Câu hỏi Trắc nghiệm Đúng/Sai

#ds(
  id: "ToanThucTe-DS1",
  [Cho một tấm nhôm hình vuông cạnh 12 cm. Người ta cắt ở bốn góc bốn hình vuông nhỏ bằng nhau cạnh $x$ (cm) rồi gập lên để tạo thành một chiếc hộp không nắp. Thể tích hộp được tính theo công thức $V(x) = x(12 - 2x)^2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True[Điều kiện của $x$ là $0 < x < 6$.],
    False[Nghiệm duy nhất của phương trình $V'(x) = 0$ là $x=6$.],
    True[Thể tích hộp đạt lớn nhất khi cạnh hình vuông bị cắt đi là 2 cm.],
    False[Thể tích lớn nhất của hộp là $100 " cm"^3$.],
  ),
  loigiai: [
    *a) ĐÚNG:* Vì cạnh tấm nhôm là 12, nên $12 - 2x > 0 arrow.double.r 0 < x < 6$.
    
    *b) SAI:* $V(x) = x(144 - 48x + 4x^2) = 4x^3 - 48x^2 + 144x$.
    Đạo hàm $V'(x) = 12x^2 - 96x + 144 = 0 arrow.double.l.r x = 2$ hoặc $x = 6$.
    Phương trình có 2 nghiệm phân biệt, mệnh đề nói "nghiệm duy nhất" là sai. Hơn nữa, $x=6$ bị loại do vi phạm điều kiện.
    
    *c) ĐÚNG:* Lập bảng biến thiên của $V(x)$ trên khoảng $(0; 6)$ ta thấy hàm số đạt cực đại tại $x = 2$.
    
    *d) SAI:* Thể tích lớn nhất là $V_max = V(2) = 2(12 - 4)^2 = 2 dot 64 = 128$ ($"cm"^3$), không phải 100.
  ]
)

== Câu hỏi Trắc nghiệm Trả lời ngắn

#tln(
  id: "ToanThucTe-TLN1",
  [Một công ty bất động sản có 50 căn hộ cho thuê. Nếu giá thuê mỗi căn hộ là 2 triệu đồng/tháng thì tất cả các căn hộ đều được thuê hết. Biết rằng cứ mỗi lần tăng giá thuê lên 100 nghìn đồng/tháng thì sẽ có thêm 1 căn hộ bị bỏ trống. Công ty phải cho thuê với giá bao nhiêu triệu đồng/tháng để doanh thu là lớn nhất?],
  [3.5 triệu đồng/tháng],
  loigiai: [
    Gọi $x$ là số lần tăng giá thêm 100 nghìn đồng ($x >= 0, x in NN$).
    Khi đó, giá thuê mới là: $2 + 0.1x$ (triệu đồng).
    Số căn hộ được thuê là: $50 - x$ (căn).
    Doanh thu của công ty là: $R(x) = (2 + 0.1x)(50 - x) = 100 - 2x + 5x - 0.1x^2 = -0.1x^2 + 3x + 100$.
    Hàm số $R(x)$ là một parabol quay bề lõm xuống dưới, đạt giá trị lớn nhất tại đỉnh:
    $ x = -frac(b, 2a) = -frac(3, 2(-0.1)) = 15. $
    Vậy công ty cần tăng giá 15 lần. 
    Giá thuê tối ưu là: $2 + 0.1(15) = 3.5$ (triệu đồng).
    #ans-box[Giá thuê tối ưu là *3.5 triệu đồng*.]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Axes
        line((-0.2, 0), (6, 0), mark: (end: ">", size: 0.2), stroke: 0.8pt)
        line((0, -0.2), (0, 5), mark: (end: ">", size: 0.2), stroke: 0.8pt)
        content((6.2, 0), text(size: 10pt)[$x$])
        content((0.2, 5.2), text(size: 10pt)[$R(x)$])
        content((-0.2, -0.2), text(size: 10pt)[$O$])
        
        // Scale x = 1cm for 10 units, y = 1cm for 30 units (150 max)
        let pts = ()
        for i in range(0, 51, step: 2) {
          let x = float(i)
          let y = -0.1 * x * x + 3.0 * x + 100.0
          pts.push((x / 10.0, y / 30.0))
        }
        line(..pts, stroke: (paint: rgb("FF8C00"), thickness: 1.5pt))
        
        // Vertex
        circle((1.5, 122.5 / 30.0), radius: 0.1, fill: red)
        content((1.5, 122.5 / 30.0 + 0.3), text(size: 9pt)[$(15, 122.5)$])
        line((1.5, 0), (1.5, 122.5 / 30.0), stroke: (paint: gray, dash: "dashed"))
        line((0, 122.5 / 30.0), (1.5, 122.5 / 30.0), stroke: (paint: gray, dash: "dashed"))
        content((1.5, -0.3), text(size: 9pt)[$15$])
        content((-0.4, 122.5 / 30.0), text(size: 9pt)[$122.5$])
      })
    ]
  ]
)

#tln(
  id: "ToanThucTe-TLN2",
  [Một người thợ cần làm một bể cá bằng kính không nắp dạng hình hộp chữ nhật có thể tích $36 " m"^3$. Biết rằng chiều dài của bể gấp đôi chiều rộng. Tính chiều cao của bể (tính bằng mét) để tốn ít kính nhất (diện tích toàn phần của 5 mặt là nhỏ nhất).],
  [2 m],
  loigiai: [
    Gọi chiều rộng của đáy bể là $x$ (m, $x > 0$), khi đó chiều dài là $2x$. Chiều cao bể là $h$.
    Thể tích bể: $V = x dot 2x dot h = 2x^2h = 36 arrow.double.r h = frac(18, x^2)$.
    Diện tích kính cần dùng (diện tích 1 mặt đáy và 4 mặt bên):
    $ S(x) = S_("đáy") + S_("xq") = x(2x) + 2(x h + 2x h) = 2x^2 + 6x h = 2x^2 + 6x (frac(18, x^2)) = 2x^2 + frac(108, x). $
    Đạo hàm: $S'(x) = 4x - frac(108, x^2)$.
    Giải $S'(x) = 0 arrow.double.r 4x^3 = 108 arrow.double.r x^3 = 27 arrow.double.r x = 3$.
    Suy ra chiều cao tối ưu là: $h = frac(18, 3^2) = frac(18, 9) = 2$ (m).
    
    #ans-box[Chiều cao của bể để tốn ít kính nhất là *2 mét*.]
  ]
)
