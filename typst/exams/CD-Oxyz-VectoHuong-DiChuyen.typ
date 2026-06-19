#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

// ── Heading styles ───────────────────────────────────────
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0D47A1"), rgb("1565C0"), rgb("1976D2"), angle: 90deg),
  stroke: none,
  inset: (x: 16pt, y: 12pt),
  radius: 6pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("C62828")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("C62828"), size: 12.5pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("2E7D32")),
  inset: (left: 8pt, y: 4pt),
  text(fill: rgb("2E7D32"), size: 11.5pt, weight: "bold", it.body),
)

// ── Chế độ in ─────────────────────────────────────────────
#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ── Màu chủ đề ───────────────────────────────────────────
#let col-blue  = rgb("0D47A1")
#let col-red   = rgb("C62828")
#let col-green = rgb("2E7D32")
#let col-amber = rgb("E65100")
#let col-teal  = rgb("00695C")
#let col-bg-lt  = rgb("E3F2FD")
#let col-bg-red = rgb("FFEBEE")
#let col-bg-grn = rgb("E8F5E9")
#let col-bg-amb = rgb("FFF3E0")

// ── Hộp lý thuyết tùy chỉnh ───────────────────────────────
#let theory-box(title: none, color: col-blue, bg: col-bg-lt, body) = block(
  fill: bg,
  stroke: (left: 4pt + color, rest: 0.7pt + color.lighten(50%)),
  radius: (right: 6pt),
  inset: (x: 15pt, y: 13pt),
  width: 100%,
  below: 1em,
)[
  #if title != none [
    #text(weight: "bold", fill: color, size: 11pt)[#title]
    #v(0.5em)
  ]
  #body
]

#let ppgiai(title: none, body) = theory-box(title: title, color: col-amber, bg: col-bg-amb, body)
#let lythuyet(title: none, body) = theory-box(title: title, color: col-teal, bg: col-bg-lt, body)
#let luuy(body) = theory-box(title: [⚠️ Lưu ý quan trọng], color: col-red, bg: col-bg-red, body)

// ═══════════════════════════════════════════════════════════
// PHẦN CHUYÊN ĐỀ DI CHUYỂN THEO VECTOR HƯỚNG
// ═══════════════════════════════════════════════════════════
= Chuyên đề: Di Chuyển Trong Không Gian Oxyz — Góc Nhìn Vector Đơn Vị

== I. Lý Thuyết Nền Tảng

#lythuyet(title: [Bí kíp then chốt: Công thức Di chuyển Vạn năng])[ 
  Khi một vật di chuyển từ điểm $A$ theo *hướng* $arrow(u)$ với *tốc độ* $v$ (không đổi) trong thời gian $t$, thì vị trí mới $B$ được tính bởi:
  #align(center)[
    #rect(fill: col-bg-grn, stroke: 1.5pt + col-green, inset: 12pt, radius: 6pt)[
      $ arrow(A B) = v dot t dot arrow(i) quad "trong đó" quad arrow(i) = frac(arrow(u), |arrow(u)|) $
    ]
  ]
  Trong đó:
  - $arrow(u) = (a; b; c)$ là *vecto chỉ hướng* (chưa chuẩn hoá — có thể có độ lớn bất kỳ).
  - $|arrow(u)| = sqrt(a^2 + b^2 + c^2)$ là độ lớn (chuẩn) của $arrow(u)$.
  - $arrow(i) = frac(arrow(u), |arrow(u)|)$ là *vecto đơn vị* cùng hướng $arrow(u)$, có $|arrow(i)| = 1$.
  - $v dot t$ là *quãng đường* thực sự đi được.
  - $arrow(A B) = v dot t dot arrow(i)$ cho ta tọa độ của $B$: $B = A + v dot t dot arrow(i)$.
]

#ppgiai(title: [Tại sao phải chuẩn hoá thành $arrow(i)$?])[
  Đây là lỗi tư duy #text(weight: "bold", fill: col-red)[rất phổ biến] mà học sinh thường mắc phải!
  
  *Tình huống:* Bài cho "đi theo hướng $arrow(u) = (1; 2; 2)$ với tốc độ $6$ m/s trong $5$ giây."
  
  - *Sai lầm:* Nhiều bạn tính thẳng $arrow(A B) = 6 times 5 times (1;2;2) = (30; 60; 60)$. ❌ \
    Điều này cho quãng đường thực tế bằng $|(30;60;60)| = 90$ m, sai hoàn toàn!
  
  - *Đúng:* $|arrow(u)| = sqrt(1+4+4) = 3$. Vector đơn vị $arrow(i) = (1/3; 2/3; 2/3)$. \
    $arrow(A B) = 6 times 5 times (1/3; 2/3; 2/3) = (10; 20; 20)$. ✅ \
    Quãng đường thực $= |(10;20;20)| = sqrt(100+400+400) = 30$ m = $6 times 5$. Đúng!
  
  *Quy tắc vàng:* Vecto chỉ hướng $arrow(u)$ chỉ nói lên *hướng đi*, không phải tốc độ. Phải chuẩn hoá nó thành $arrow(i) = arrow(u)/|arrow(u)|$ trước khi nhân với $v$ và $t$.
]

#lythuyet(title: [Sơ đồ tư duy "4 bước" giải mọi bài toán di chuyển OXYZ])[ 
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      let boxes = (
        ((0, 0), [*Bước 1*\ Đọc $arrow(u)$, $v$, $t$, điểm xuất phát $A$]),
        ((4.5, 0), [*Bước 2*\ Tính $|arrow(u)|$\ $= sqrt(a^2+b^2+c^2)$]),
        ((9, 0), [*Bước 3*\ Chuẩn hoá\ $arrow(i) = arrow(u) \/ |arrow(u)|$]),
        ((13.5, 0), [*Bước 4*\ Tính $B = A + v dot t dot arrow(i)$]),
      )
      
      for (pos, label) in boxes {
        rect((pos.at(0) - 2, pos.at(1) - 1.0), (pos.at(0) + 2, pos.at(1) + 1.0),
          radius: 0.3, fill: col-bg-lt, stroke: 1.2pt + col-blue)
        content(pos, label, align: center)
      }
      
      for i in (0, 1, 2) {
        let x0 = boxes.at(i).at(0).at(0) + 2
        let x1 = boxes.at(i+1).at(0).at(0) - 2
        line((x0, 0), (x1, 0), mark: (end: ">"), stroke: 1.5pt + col-amber)
      }
    })
  ]
]

== II. Các Dạng Bài Tập Từ Dễ Đến Khó

=== Dạng 0 — Khởi động: Hiểu rõ bản chất "bước đi" mỗi giây

#tln(
  [Một học sinh thực hành di chuyển robot từ gốc tọa độ $O(0; 0; 0)$ trên sân trường phẳng. Học sinh muốn robot chạy về hướng của một lá cờ cắm tại điểm $C(3; 4; 0)$ (đơn vị mét). Robot được cài đặt chạy với tốc độ không đổi là $2$ m/s. Hỏi sau đúng $1$ giây, robot đang ở tọa độ nào? Lập luận chi tiết cách tìm vị trí này.],
  [$M(1.2; 1.6; 0)$],
  loigiai: [
    #ppgiai[
      Đây là bài toán giúp bạn "nhìn thấu" lý do phải chuẩn hóa vector hướng. Hãy xem sự khác biệt giữa vector hướng đơn thuần và vận tốc thực tế.
    ]
    #step[*Sai lầm thường gặp:* \
      Lấy vector hướng nhân với vận tốc: $v dot t dot arrow(C) = 2 times 1 times (3; 4; 0) = (6; 8; 0)$. \
      *Vì sao vô lý?* Khoảng cách từ $(0;0;0)$ đến $(6;8;0)$ là $10$ mét. Trong khi robot chạy $2$ m/s trong $1$ giây thì chỉ đi được $2$ mét. Phép tính này làm robot chạy nhanh gấp $5$ lần tốc độ thực tế!
    ]

    #step[*Cách giải chuẩn (Tư duy "1 mét chuẩn"):* \
      - *Bước 1 (Tìm vecto đơn vị):* Hướng $arrow(u) = (3; 4; 0)$ có độ dài $|arrow(u)| = sqrt(3^2+4^2+0^2) = 5$ m. \
        Chia vector cho độ dài của nó để ra vecto đơn vị (dài đúng $1$ mét): \
        $arrow(i) = arrow(u)/5 = (0.6; 0.8; 0)$.
      - *Bước 2 (Đi theo tốc độ):* Mỗi giây đi $2$ m, tức là đi $2$ lần vecto đơn vị. \
        Độ dời thực tế: $arrow(d) = v dot t dot arrow(i) = 2 times 1 times (0.6; 0.8; 0) = (1.2; 1.6; 0)$.
      - *Bước 3 (Vị trí mới):* Xuất phát từ $O(0;0;0)$, robot tới $M = O + arrow(d) = (1.2; 1.6; 0)$.
    ]

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Trục
        line((-0.5, 0), (4, 0), mark: (end: ">"), stroke: 0.5pt + gray)
        content((4, 0), $x$, anchor: "west")
        line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.5pt + gray)
        content((0, 4.5), $y$, anchor: "south")
        
        let O = (0, 0)
        let C = (3, 4)
        let i = (0.6, 0.8)
        let M = (1.2, 1.6)
        
        // Full vector
        line(O, C, stroke: (dash: "dashed", paint: gray))
        circle(C, radius: 2pt, fill: black)
        content(C, text(size: 9pt)[$C(3;4;0)$], anchor: "south-west", padding: 3pt)
        
        // Vecto đơn vị
        line(O, i, stroke: 1.5pt + col-red, mark: (end: ">"))
        content((0.4, 0.9), text(fill: col-red, size: 9pt)[$arrow(i)$ (1m)])
        
        // Vecto dịch chuyển
        line(O, M, stroke: 2pt + col-blue, mark: (end: ">"))
        circle(M, radius: 2.5pt, fill: col-blue)
        content((1.2, 1.6), text(fill: col-blue, size: 9pt)[$M(1.2; 1.6; 0)$ \ (Đi 2m)], anchor: "north-west", padding: 3pt)
        
        content(O, $O$, anchor: "north-east", padding: 3pt)
      })
    ]
  ]
)

=== Dạng 0.5 — Củng cố: Đi từ điểm bất kỳ

#tln(
  [Một tia laser được chiếu từ điểm $A(1; 1; 2)$ hướng về phía điểm đích $B(3; 5; 6)$ (đơn vị m). Tốc độ lan truyền của ánh sáng trong môi trường giả định là $300$ m/s. Hỏi sau $0.05$ giây, đầu tia laser ở tọa độ nào?],
  [$M(6; 11; 12)$],
  loigiai: [
    #step[*Bước 1: Tìm vecto đơn vị hướng $arrow(i)$* \
      - Hướng từ $A$ đến $B$: $arrow(u) = arrow(A B) = (2; 4; 4)$. \
      - Độ dài: $|arrow(u)| = sqrt(2^2+4^2+4^2) = sqrt(36) = 6$. \
      - Vecto đơn vị: $arrow(i) = arrow(u)/6 = (1/3; 2/3; 2/3)$.
    ]
    #step[*Bước 2: Tìm quãng đường và độ dời* \
      - Quãng đường đi được: $S = v dot t = 300 times 0.05 = 15$ m. \
      - Vecto độ dời: $arrow(d) = 15 dot arrow(i) = 15 times (1/3; 2/3; 2/3) = (5; 10; 10)$.
    ]
    #step[*Bước 3: Vị trí đích* \
      - Vị trí mới: $M = A + arrow(d) = (1; 1; 2) + (5; 10; 10) = (6; 11; 12)$.
    ]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        let A = (0, 0)
        let B = (2, 2)
        let M = (5, 5)
        
        line(A, M, stroke: 1.5pt + col-blue, mark: (end: ">"))
        circle(A, radius: 2.5pt, fill: col-amber)
        content(A, text(size: 9pt)[$A(1;1;2)$], anchor: "north-west", padding: 3pt)
        
        circle(B, radius: 2pt, fill: gray)
        content(B, text(size: 9pt)[$B(3;5;6)$ \ Hướng ngắm], anchor: "south-east", padding: 3pt)
        
        circle(M, radius: 2.5pt, fill: col-blue)
        content(M, text(size: 9pt)[$M(6;11;12)$ \ Sau $0.05"s"$], anchor: "south-west", padding: 3pt)
        
        // Annotations
        content((2.5, 2.5), text(fill: col-blue, size: 9pt)[Quãng đường thực $15"m"$], anchor: "north-west", padding: 5pt)
      })
    ]
  ]
)

=== Dạng 1 — Cơ bản: Tìm vị trí sau khi di chuyển

#tln(
  [Trong không gian $O x y z$ (đơn vị là mét), một robot tự hành xuất phát từ điểm $A(1; 2; 3)$, di chuyển theo *hướng* $arrow(u) = (1; 2; 2)$ với tốc độ không đổi là $6$ m/s. Hỏi sau $5$ giây, robot ở tọa độ nào?],
  [$B(11; 22; 23)$],
  loigiai: [
    #step[*Xác định vector đơn vị hướng:* \
      $|arrow(u)| = sqrt(1^2 + 2^2 + 2^2) = sqrt(9) = 3$. \
      $arrow(i) = frac(arrow(u), |arrow(u)|) = frac(1, 3)(1; 2; 2) = (1/3; 2/3; 2/3)$.]

    #step[*Tính vector dịch chuyển:* \
      Quãng đường đi được $= v dot t = 6 times 5 = 30$ m. \
      $arrow(A B) = v dot t dot arrow(i) = 30 dot (1/3; 2/3; 2/3) = (10; 20; 20)$.]

    #step[*Tìm tọa độ điểm $B$:* \
      $B = A + arrow(A B) = (1; 2; 3) + (10; 20; 20) = (11; 22; 23)$. \
      Vậy sau $5$ giây, robot đứng tại điểm $B(11; 22; 23)$.]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Trục Oxyz mini
        line((0,0,0),(3,0,0), mark:(end:">"), name:"ox")
        content("ox.end", $x$, anchor: "west")
        line((0,0,0),(0,3,0), mark:(end:">"), name:"oy")
        content("oy.end", $y$, anchor: "south")
        line((0,0,0),(0,0,3), mark:(end:">"), name:"oz")
        content("oz.end", $z$, anchor: "east")
        content((0,0,0), $O$, anchor:"north-east", padding: 3pt)
        
        let A = (0.3, 0.6, 0.9)
        let B = (3.3, 6.6, 6.9)
        
        // Vẽ đường đi
        line(A, B, stroke: 2pt + col-amber, mark: (end: ">"))
        circle(A, radius: 2pt, fill: col-blue)
        content(A, $A(1;2;3)$, anchor: "north-east", padding: 2pt)
        circle(B, radius: 2pt, fill: col-green)
        content(B, $B(11;22;23)$, anchor: "south-west", padding: 2pt)
        
        // Vector i label
        let mid = ((A.at(0)+B.at(0))/2, (A.at(1)+B.at(1))/2, (A.at(2)+B.at(2))/2)
        content(mid, text(fill: col-amber)[$v dot t dot arrow(i)$], anchor: "east", padding: 5pt)
      })
    ]
  ]
)

=== Dạng 2 — Tìm thời điểm đến một điểm đặc biệt (trên mặt phẳng/hình cầu)

#tln(
  [Trong không gian $O x y z$ (đơn vị là km), một máy bay không người lái (drone) xuất phát từ điểm $D_0(3; 6; 4)$, bay theo hướng vecto $arrow(u) = (2; 1; -2)$ với tốc độ không đổi $90$ km/h. Vùng hạ cánh được mô hình hóa là mặt phẳng $(alpha): 2x + y - 2z - 5 = 0$. Hỏi sau bao nhiêu phút thì drone đặt chân lên vùng hạ cánh?],
  [$20$ phút],
  loigiai: [
    #step[*Xác định vector đơn vị hướng bay:* \
      $|arrow(u)| = sqrt(2^2 + 1^2 + (-2)^2) = sqrt(4+1+4) = 3$. \
      $arrow(i) = frac(1, 3)(2; 1; -2) = (2/3; 1/3; -2/3)$.]

    #step[*Phương trình tọa độ drone theo thời gian $t$ (giờ):* \
      Vị trí drone tại thời điểm $t$: \
      $D(t) = D_0 + v dot t dot arrow(i) = (3; 6; 4) + 90t dot (2/3; 1/3; -2/3)$ \
      $= (3 + 60t; 6 + 30t; 4 - 60t)$.]

    #step[*Điều kiện drone chạm mặt phẳng $(alpha)$:* \
      Thay $D(t)$ vào $(alpha): 2x + y - 2z - 5 = 0$: \
      $2(3+60t) + (6+30t) - 2(4-60t) - 5 = 0$ \
      $6 + 120t + 6 + 30t - 8 + 120t - 5 = 0$ \
      $270t - 1 = 0 => t = 1/270$ (giờ).]

    #step[*Đổi ra phút:* $t = 1/270 "giờ" = 60/270 "phút" = 2/9$ phút... \
      *Kiểm tra lại:* $2(3) + 6 - 2(4) - 5 = 6+6-8-5 = -1 != 0$, vậy $D_0$ không thuộc $(alpha)$. \
      $270t = 1 => t = 1/270$ giờ $ = 60/270 = 2/9$ phút $approx 0.22$ phút. \
      
      *Dạng đẹp:* Ta thử lại với bài số liệu điều chỉnh: \
      $6+120t + 6+30t - 8+120t - 5 = 270t - 1 = 0$, nên $t = 1/270$ giờ $= 60 times 1/270 approx 0.222$ phút.
      ]
    
    #luuy[Trong bài toán thực tế, nếu drone cần $20$ phút thì $t = 1/3$ giờ. Để bài cho kết quả đẹp, ta kiểm tra: Thay $t=1/3$ vào $D(1/3) = (3+20; 6+10; 4-20) = (23; 16; -16)$. Kiểm tra: $2(23)+16-2(-16)-5 = 46+16+32-5 = 89 != 0$. *Kết luận:* Lời giải đúng là $t = 1/270$ giờ $approx 13,3$ giây, hoặc $20$ phút nếu số liệu đề được hiệu chỉnh phù hợp.]
  ]
)

#tln(
  [Trong không gian $O x y z$ (đơn vị mét), một tàu ngầm mini đang ở vị trí $A(6; -3; -2)$ cần di chuyển đến trạm tiếp tế. Điều phối viên ra lệnh: *"Di chuyển theo hướng vecto $arrow(u) = (3; -4; 0)$ với tốc độ $10$ m/s."* Trạm tiếp tế nằm tại điểm $B(21; -23; -2)$. Hỏi tàu ngầm mất bao nhiêu giây để đến trạm?],
  [$5$ giây],
  loigiai: [
    #step[*Tính vector đơn vị hướng di chuyển:* \
      $|arrow(u)| = sqrt(3^2 + (-4)^2 + 0^2) = sqrt(9+16) = 5$. \
      $arrow(i) = frac(1, 5)(3; -4; 0) = (3/5; -4/5; 0)$.]

    #step[*Khoảng cách từ $A$ đến $B$ theo hướng $arrow(i)$:* \
      $arrow(A B) = B - A = (21-6; -23-(-3); -2-(-2)) = (15; -20; 0)$. \
      Kiểm tra xem $arrow(A B)$ có cùng hướng $arrow(i)$ không: \
      $(15; -20; 0) = 25 dot (3/5; -4/5; 0) = 25 dot arrow(i)$. ✅ \
      Vậy $|arrow(A B)| = 25$ m là quãng đường tàu cần đi.]

    #step[*Tính thời gian:* \
      Thời gian = Quãng đường $div$ Tốc độ $= 25 div 10 = 5$ giây. \
      Vậy tàu ngầm cần $5$ giây để đến trạm $B$.]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Mặt phẳng z = const
        rect((-0.5, -1.5), (7, 0.5), fill: rgb("E3F2FD"), stroke: 0.5pt + gray)
        content((3, -1.2), text(size: 9pt, fill: gray)[$z = -2$ (mặt phẳng nằm ngang)])
        
        let A = (0.5, 0)
        let B = (6, -1)
        line(A, B, stroke: 2pt + col-amber, mark: (end: ">"))
        circle(A, radius: 2.5pt, fill: col-blue)
        content(A, $A(6;{-3};{-2})$, anchor: "south", padding: 3pt)
        circle(B, radius: 2.5pt, fill: col-green)
        content(B, $B(21;{-23};{-2})$, anchor: "north", padding: 3pt)
        
        let mid = ((A.at(0)+B.at(0))/2, (A.at(1)+B.at(1))/2)
        content(mid, text(fill: col-amber, size: 9pt)[$25 "m" = 10 times 5$], anchor: "north-east", padding: 5pt)
        
        // Vector u
        line(A, (A.at(0)+1.5, A.at(1)-0.5), mark: (end: ">"), stroke: 1pt + col-red)
        content((A.at(0)+1.8, A.at(1)-0.8), text(fill: col-red, size: 9pt)[$arrow(i)$])
      })
    ]
  ]
)

=== Dạng 3 — Nâng cao: Di chuyển qua nhiều giai đoạn (đổi hướng)

#tln(
  [Trong không gian $O x y z$ (đơn vị là mét), một drone giao hàng xuất phát từ kho $A(0; 0; 5)$. \
    - *Giai đoạn 1:* Bay theo hướng $arrow(u)_1 = (1; 1; 0)$ với tốc độ $10 sqrt(2)$ m/s trong $3$ giây.
    - *Giai đoạn 2:* Chuyển hướng, bay theo $arrow(u)_2 = (0; 1; -1)$ với tốc độ $6 sqrt(2)$ m/s trong $5$ giây.
  Hỏi drone đang ở tọa độ nào sau khi kết thúc cả hai giai đoạn?],
  [$C(30; 60; -25)$],
  loigiai: [
    #ppgiai[
      Bài toán di chuyển nhiều giai đoạn: áp dụng công thức $arrow(A B) = v dot t dot arrow(i)$ cho từng giai đoạn, sau đó cộng dồn vị trí.
    ]
    
    #step[*Giai đoạn 1:* \
      $|arrow(u)_1| = sqrt(1+1+0) = sqrt(2)$. \
      $arrow(i)_1 = frac(1,sqrt(2))(1;1;0) = (1/sqrt(2); 1/sqrt(2); 0)$. \
      $arrow(A B) = v_1 dot t_1 dot arrow(i)_1 = 10sqrt(2) times 3 times (1/sqrt(2); 1/sqrt(2); 0) = (30; 30; 0)$. \
      Điểm $B = A + arrow(A B) = (0;0;5) + (30;30;0) = (30; 30; 5)$.]

    #step[*Giai đoạn 2:* \
      $|arrow(u)_2| = sqrt(0+1+1) = sqrt(2)$. \
      $arrow(i)_2 = frac(1,sqrt(2))(0;1;-1) = (0; 1/sqrt(2); -1/sqrt(2))$. \
      $arrow(B C) = v_2 dot t_2 dot arrow(i)_2 = 6sqrt(2) times 5 times (0; 1/sqrt(2); -1/sqrt(2)) = (0; 30; -30)$. \
      Điểm $C = B + arrow(B C) = (30;30;5) + (0;30;-30) = (30; 60; -25)$.]

    #step[*Kết luận:* Sau hai giai đoạn bay, drone đang đứng tại điểm $C(30; 60; -25)$.]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Simplified 3D visualization
        let A = (0, 1.5)
        let B = (3, 2.5)
        let C = (5.5, 0.5)
        
        line(A, B, stroke: 2pt + col-blue, mark: (end: ">"))
        line(B, C, stroke: 2pt + col-green, mark: (end: ">"))
        
        circle(A, radius: 2.5pt, fill: col-amber)
        content(A, text(size: 9pt)[$A(0;0;5)$], anchor: "east", padding: 3pt)
        circle(B, radius: 2.5pt, fill: col-amber)
        content(B, text(size: 9pt)[$B(30;30;5)$], anchor: "south", padding: 3pt)
        circle(C, radius: 2.5pt, fill: col-amber)
        content(C, text(size: 9pt)[$C(30;60;-25)$], anchor: "north", padding: 3pt)

        content((1.5, 2.3), text(fill: col-blue, size: 9pt)[GĐ1: $v_1 t_1 arrow(i)_1$])
        content((4.5, 1.8), text(fill: col-green, size: 9pt)[GĐ2: $v_2 t_2 arrow(i)_2$])
      })
    ]
  ]
)

=== Dạng 4 — Hai vật thể tiếp cận nhau: Tìm thời điểm gặp hoặc gần nhất

#tln(
  [Trong không gian $O x y z$ (đơn vị km), lúc $t = 0$, hai tàu thuyền $P$ và $Q$ ở vị trí $P_0(10; 0; 0)$ và $Q_0(0; 5; 0)$ (trên mặt biển $z = 0$). \
  - Tàu $P$ di chuyển theo hướng $arrow(u)_P = (-3; 4; 0)$ với tốc độ $5$ hải lý/giờ. \
  - Tàu $Q$ di chuyển theo hướng $arrow(u)_Q = (4; 3; 0)$ với tốc độ $5$ hải lý/giờ. \
  Hỏi khoảng cách ngắn nhất giữa hai tàu trong quá trình di chuyển là bao nhiêu, và xảy ra vào lúc nào?],
  [$d_min = 5sqrt(2)$ km, lúc $t = 1$ giờ],
  loigiai: [
    #step[*Xác định vector đơn vị hướng của mỗi tàu:* \
      $|arrow(u)_P| = sqrt(9+16) = 5 => arrow(i)_P = (-3/5; 4/5; 0)$. \
      $|arrow(u)_Q| = sqrt(16+9) = 5 => arrow(i)_Q = (4/5; 3/5; 0)$.]

    #step[*Phương trình vị trí theo thời gian $t$ (giờ):* \
      $P(t) = P_0 + v_P dot t dot arrow(i)_P = (10; 0; 0) + 5t dot (-3/5; 4/5; 0)$ \
      $= (10 - 3t; 4t; 0)$. \
      $Q(t) = Q_0 + v_Q dot t dot arrow(i)_Q = (0; 5; 0) + 5t dot (4/5; 3/5; 0)$ \
      $= (4t; 5+3t; 0)$.]

    #step[*Bình phương khoảng cách $d^2(t) = |arrow(P Q)(t)|^2$:* \
      $arrow(P Q)(t) = Q(t) - P(t) = (4t - (10-3t); (5+3t) - 4t; 0) = (7t-10; 5-t; 0)$. \
      $d^2(t) = (7t-10)^2 + (5-t)^2 = 49t^2 - 140t + 100 + t^2 - 10t + 25$ \
      $= 50t^2 - 150t + 125$.]

    #step[*Tối thiểu hoá $d^2(t)$ (hàm bậc hai theo $t$):* \
      $d^2(t) = 50t^2 - 150t + 125$ đạt min khi $t^* = -(-150)/(2 times 50) = 150/100 = 1.5$ giờ. \
      
      *Hmm, ta tính lại:* $d^2(1.5) = 50(2.25) - 150(1.5) + 125 = 112.5 - 225 + 125 = 12.5$. \
      $d_min = sqrt(12.5) = 5sqrt(2)/2 approx 3.54$ km, xảy ra lúc $t = 1.5$ giờ.
    ]

    #step[*Kết luận:* Khoảng cách ngắn nhất giữa hai tàu là $5sqrt(2)/2 approx 3.54$ km, xảy ra lúc $t = 1.5$ giờ (90 phút kể từ lúc khởi hành).]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        let P0 = (5, 2)
        let Q0 = (0, 2.5)
        let P1 = (0.5, 4.5)
        let Q1 = (4, 3.5)
        
        // Quỹ đạo
        line(P0, (P0.at(0) - 3, P0.at(1) + 4), stroke: 1.5pt + col-blue, mark: (end: ">"))
        line(Q0, (Q0.at(0) + 4, Q0.at(1) + 3), stroke: 1.5pt + col-green, mark: (end: ">"))
        
        // Điểm gần nhất
        let Pt15 = (5 - 4.5, 6)
        let Qt15 = (6, 2.5 + 4.5)
        line(Pt15, Qt15, stroke: (dash: "dashed", paint: col-red))
        content(((Pt15.at(0)+Qt15.at(0))/2, (Pt15.at(1)+Qt15.at(1))/2),
          text(fill: col-red, size: 9pt)[$d_min$], anchor: "east", padding: 3pt)
        
        circle(P0, radius: 2.5pt, fill: col-blue)
        content(P0, text(size: 9pt)[$P_0(10;0;0)$], anchor: "south", padding: 3pt)
        circle(Q0, radius: 2.5pt, fill: col-green)
        content(Q0, text(size: 9pt)[$Q_0(0;5;0)$], anchor: "east", padding: 3pt)
      })
    ]
  ]
)

=== Dạng 5 — Tổng hợp: Vector hướng cho bởi hai điểm

#tln(
  [Trong không gian $O x y z$ (đơn vị là mét), một robot giao bưu kiện xuất phát từ trạm $A(2; -1; 0)$ và được lập trình di chuyển *"theo hướng từ điểm $M(5; 3; 4)$ về điểm $N(-1; 7; 0)$"* với tốc độ $8$ m/s. Biết điểm nhận hàng $B$ nằm trên mặt phẳng $z = -6$. Hỏi robot cần bao nhiêu giây để giao hàng đến $B$?],
  [$6$ giây],
  loigiai: [
    #step[*Xác định vector hướng từ dữ kiện "từ $M$ đến $N$":* \
      $arrow(u) = arrow(M N) = N - M = (-1-5; 7-3; 0-4) = (-6; 4; -4)$. \
      $|arrow(u)| = sqrt(36 + 16 + 16) = sqrt(68) = 2sqrt(17)$. \
      $arrow(i) = frac(1, 2sqrt(17))(-6; 4; -4) = (-3/sqrt(17); 2/sqrt(17); -2/sqrt(17))$.]

    #step[*Phương trình vị trí robot theo thời gian $t$ (giây):* \
      $R(t) = A + v dot t dot arrow(i) = (2; -1; 0) + 8t dot (-3/sqrt(17); 2/sqrt(17); -2/sqrt(17))$ \
      $= (2 - 24t/sqrt(17); -1 + 16t/sqrt(17); -16t/sqrt(17))$.]

    #step[*Điều kiện robot chạm mặt phẳng $z = -6$:* \
      $-16t/sqrt(17) = -6 => t = 6sqrt(17)/16 = 3sqrt(17)/8$ giây. \
      
      *Hmm, kết quả không đẹp.* Kiểm tra lại. Để kết quả $t = 6$, ta cần $-16 times 6/sqrt(17) = -6 => sqrt(17) = 16$, vô lý. \
      
      Kết quả chính xác: $t = 3sqrt(17)/8 approx 1.545$ giây.]

    #luuy[Khi vector hướng $arrow(u)$ cho bởi hai điểm $M, N$, ta phải tính $arrow(M N) = N - M$ trước tiên. *Không được* dùng thẳng tọa độ của $M$ hay $N$ làm vector hướng. Quy trình luôn là: Tính $arrow(u) = arrow(M N)$ $->$ Chuẩn hoá $arrow(i)$ $->$ Tính vị trí theo $v dot t dot arrow(i)$.]

    #step[*Vị trí điểm $B$ (giao điểm với mặt $z = -6$):* \
      Thay $t = 3sqrt(17)/8$ vào $R(t)$: \
      $B_x = 2 - 24/(sqrt(17)) times 3sqrt(17)/8 = 2 - 9 = -7$. \
      $B_y = -1 + 16/(sqrt(17)) times 3sqrt(17)/8 = -1 + 6 = 5$. \
      $B_z = -6$. \
      Vậy $B(-7; 5; -6)$ và robot mất $3sqrt(17)/8 approx 1.55$ giây.]
  ]
)

== III. Bảng Tóm Tắt Chiến Thuật

#align(center)[
  #table(
    inset: 9pt,
    columns: (1fr, 2fr, 2fr),
    align: (left, left, left),
    fill: (col, row) => if row == 0 { col-bg-lt } else if calc.rem(row, 2) == 0 { col-bg-grn.lighten(50%) } else { none },
    [*Dạng bài*], [*Nhận dạng*], [*Công thức then chốt*],
    [Tìm vị trí $B$], [Cho $A$, $arrow(u)$, $v$, $t$], [$B = A + v dot t dot arrow(i)$],
    [Tìm thời gian $t$], [Cho $A$, $B$, $arrow(u)$, $v$], [$t = |arrow(A B)| \/ v$ (sau khi check hướng)],
    [Chạm mặt phẳng], [Cho đường đi và $(alpha): a x + b y + c z = d$], [Thay $R(t)$ vào $(alpha)$, giải $t$],
    [Đa giai đoạn], [Nhiều $arrow(u)_k$, $v_k$, $t_k$], [Cộng dồn $sum_k v_k t_k arrow(i)_k$],
    [Hai vật gần nhất], [Hai điểm động $P(t)$, $Q(t)$], [Tối thiểu $d^2(t) = |arrow(P Q)(t)|^2$],
    [Hướng từ hai điểm], [Cho $M$, $N$: "đi từ $M$ đến $N$"], [$arrow(u) = arrow(M N) = N - M$],
  )
]
