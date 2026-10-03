// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHỦ ĐỀ 1G: TỐC ĐỘ THAY ĐỔI, NƯỚC DÂNG & RÚT NƯỚC (RELATED RATES) (VD - VDC)
// Lớp: Khối 12  ·  Mã đề: 507  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")



#show: lecture-theme.with(
  title: "CHỦ ĐỀ 1G: TỐC ĐỘ THAY ĐỔI, NƯỚC DÂNG & RÚT NƯỚC (RELATED RATES) (VD - VDC)",
  subtitle: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN — MÃ ĐỀ: 507",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 507]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        })
      )
    ]
  }
]

#let exam-part(title, count: none) = {
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#lt-tn(num: 1, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một bồn chứa nước có dạng hình nón tròn xoay đỉnh hướng thẳng đứng xuống dưới. Bán kính miệng nón là $R = 2$ m, chiều cao của bồn là $H = 4$ m. Người ta dùng một máy bơm để bơm nước vào bồn với tốc độ không đổi $q = 0","25 pi$ (m#super[3]/phút). Tại thời điểm chiều cao mực nước trong bồn là $h = 2$ m thì tốc độ dâng lên của mực nước bằng bao nhiêu mét/phút?],
  (
    [$0","25$ m/phút],
    True([$0","25$ m/phút]),
    [$0","5$ m/phút],
    [$0","125$ m/phút],
    [$1$ m/phút]
  ),
  loigiai: [
    #step([Thiết lập mối quan hệ hình học])
    Gọi $r$ và $h$ lần lượt là bán kính mặt nước và chiều cao mực nước tại thời điểm $t$.
    Theo tính chất tam giác đồng dạng của thiết diện qua trục hình nón:
    $r / h = R / H = 2/4 = 1/2 => r = h / 2.$
    Thể tích khối nước trong bồn tại thời điểm mực nước cao $h$:
    $V = 1/3 pi r^2 h = 1/3 pi (h/2)^2 h = pi / 12 h^3.$

    #step([Lấy đạo hàm theo thời gian $t$])
    $(dif V) / (dif t) = pi / 12 dot 3 h^2 dot (dif h) / (dif t) = (pi h^2) / 4 dot (dif h) / (dif t).$
    Theo giả thiết, tốc độ bơm nước là $(dif V) / (dif t) = q = 0","25 pi = pi / 4$ (m#super[3]/phút).
    Tại thời điểm $h = 2$ m:
    $pi / 4 = (pi dot 2^2) / 4 dot (dif h) / (dif t) <=> pi / 4 = pi dot (dif h) / (dif t) <=> (dif h) / (dif t) = 1/4 = 0","25$ m/phút.
    Vậy mực nước dâng lên với tốc độ $0","25$ m/phút.
  ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một chiếc thang dài $5$ m tựa đầu vào một bức tường thẳng đứng và chân thang đặt trên sàn nhà nằm ngang. Do sàn trơn, chân thang bị trượt ra xa chân tường với tốc độ không đổi $0","6$ m/s. Tại thời điểm chân thang cách chân tường $3$ m thì đầu trên của thang đang trượt tụt xuống dọc theo tường với tốc độ bằng bao nhiêu?],
  (
    [$0","4$ m/s],
    True([$0","45$ m/s]),
    [$0","5$ m/s],
    [$0","6$ m/s]
  ),
  loigiai: [
    #step([Thiết lập hệ thức Pytago])
    Chọn hệ trục tọa độ sao cho chân tường là gốc tọa độ $O$.
    Gọi $x(t)$ là khoảng cách từ chân thang đến chân tường, $y(t)$ là độ cao của đầu thang trên tường.
    Theo định lý Pytago:
    $x^2 + y^2 = 5^2 = 25.$
    Khi $x = 3$ m thì $y = sqrt(25 - 3^2) = 4$ m.

    #step([Đạo hàm liên kết theo thời gian $t$])
    Lấy đạo hàm hai vế theo thời gian $t$:
    $2 x dot (dif x) / (dif t) + 2 y dot (dif y) / (dif t) = 0 <=> x dot (dif x) / (dif t) + y dot (dif y) / (dif t) = 0.$
    Thay $x = 3$, $y = 4$ và $(dif x) / (dif t) = 0","6$ m/s vào:
    $3 dot (0","6) + 4 dot (dif y) / (dif t) = 0 <=> 1","8 + 4 dot (dif y) / (dif t) = 0 <=> (dif y) / (dif t) = -1","8 / 4 = -0","45$ m/s.
    Dấu âm biểu thị độ cao $y$ đang giảm. Tốc độ tụt xuống của đầu thang là $0","45$ m/s.
  ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một ngọn đèn đường treo ở đỉnh một cột đèn cao $5$ m. Một người có chiều cao $1","8$ m bước đi trên đường thẳng ra xa chân cột đèn với tốc độ không đổi $1","6$ m/s. Tốc độ dài ra của bóng người đó in trên mặt đất bằng bao nhiêu?],
  (
    [$0","8$ m/s],
    True([$0","9$ m/s]),
    [$1","0$ m/s],
    [$1","2$ m/s]
  ),
  loigiai: [
    #step([Mối quan hệ hình học tam giác đồng dạng])
    Gọi khoảng cách từ chân người đến chân cột đèn là $x(t)$, chiều dài bóng của người trên mặt đất là $s(t)$.
    Theo định lý Thales:
    $s / (s + x) = (1","8) / 5 = 9 / 25 <=> 25 s = 9(s + x) <=> 16 s = 9 x <=> s = 9 / 16 x.$

    #step([Đạo hàm theo thời gian])
    Lấy đạo hàm hai vế theo $t$:
    $(dif s) / (dif t) = 9 / 16 dot (dif x) / (dif t).$
    Biết rằng người bước đi với tốc độ $(dif x) / (dif t) = 1","6$ m/s, suy ra:
    $(dif s) / (dif t) = 9 / 16 dot 1","6 = 0","9$ m/s.
    Vậy tốc độ dài ra của bóng người là $0","9$ m/s.
  ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Cũng trong bài toán trên, tốc độ di chuyển của đỉnh bóng người (bóng của đỉnh đầu) trên mặt đất bằng bao nhiêu?],
  (
    [$2","0$ m/s],
    True([$2","5$ m/s]),
    [$2","8$ m/s],
    [$3","0$ m/s]
  ),
  loigiai: [
    #step([Vị trí của đỉnh bóng])
    Vị trí đỉnh bóng tính từ chân cột đèn là $y(t) = x(t) + s(t)$.
    Từ kết quả câu trước: $s(t) = 9 / 16 x(t)$, suy ra:
    $y(t) = x(t) + 9 / 16 x(t) = 25 / 16 x(t).$

    #step([Tính tốc độ chuyển động của đỉnh bóng])
    $(dif y) / (dif t) = 25 / 16 dot (dif x) / (dif t) = 25 / 16 dot 1","6 = 2","5$ m/s.
    Cách khác: Tốc độ đỉnh bóng bằng tốc độ của người cộng với tốc độ dài ra của bóng:
    $(dif y)/(dif t) = (dif x)/(dif t) + (dif s)/(dif t) = 1","6 + 0","9 = 2","5$ m/s.
  ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một máy bay đang bay theo phương nằm ngang ở độ cao ổn định $h = 4$ km với vận tốc không đổi $v = 600$ km/h. Máy bay bay qua ngay phía trên một trạm quan sát radar trên mặt đất. Tại thời điểm khoảng cách từ trạm radar đến máy bay đo được là $5$ km thì khoảng cách này đang tăng với tốc độ bằng bao nhiêu?],
  (
    [$360$ km/h],
    True([$360$ km/h]),
    [$400$ km/h],
    [$480$ km/h],
    [$500$ km/h]
  ),
  loigiai: [
    #step([Thiết lập mối quan hệ khoảng cách])
    Gọi $x(t)$ là khoảng cách theo phương ngang từ máy bay đến vị trí ngay trên đỉnh trạm radar.
    Khoảng cách đường thẳng từ radar đến máy bay là $s(t)$.
    Theo định lý Pytago:
    $s^2 = x^2 + h^2 = x^2 + 4^2 = x^2 + 16.$
    Khi $s = 5$ km thì $x = sqrt(5^2 - 16) = 3$ km.

    #step([Lấy đạo hàm hai vế theo thời gian])
    $2 s dot (dif s) / (dif t) = 2 x dot (dif x) / (dif t) <=> s dot (dif s) / (dif t) = x dot (dif x) / (dif t).$
    Vì máy bay bay với vận tốc $600$ km/h nên $(dif x) / (dif t) = 600$ km/h.
    Thay số:
    $5 dot (dif s) / (dif t) = 3 dot 600 = 1800 <=> (dif s) / (dif t) = 1800 / 5 = 360$ km/h.
    Vậy khoảng cách đang tăng với tốc độ $360$ km/h.
  ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một khinh khí cầu bay thẳng đứng lên cao từ một bãi đất trống với vận tốc không đổi $v = 5$ m/s. Một người quan sát đứng trên mặt đất cách điểm phóng của khinh khí cầu một khoảng $100$ m. Tốc độ thay đổi của góc nâng $theta$ (góc nhìn từ người quan sát đến khinh khí cầu so với phương ngang) tại thời điểm khinh khí cầu ở độ cao $100$ m bằng bao nhiêu rad/s?],
  (
    [$0","01$ rad/s],
    True([$0","025$ rad/s]),
    [$0","05$ rad/s],
    [$0","1$ rad/s]
  ),
  loigiai: [
    #step([Hệ thức liên hệ giữa góc và độ cao])
    Gọi $y(t)$ là độ cao của khinh khí cầu tại thời điểm $t$.
    Ta có: $tan theta = y / 100 <=> y = 100 tan theta.$
    Khi $y = 100$ m thì $tan theta = 100 / 100 = 1 => theta = pi / 4$ rad.

    #step([Lấy đạo hàm theo thời gian])
    $(dif y) / (dif t) = 100 dot (1 / (cos^2 theta)) dot (dif theta) / (dif t) = 100(1 + tan^2 theta) dot (dif theta) / (dif t).$
    Thay $(dif y) / (dif t) = 5$ m/s và $tan theta = 1$:
    $5 = 100(1 + 1^2) dot (dif theta) / (dif t) = 200 dot (dif theta) / (dif t) <=> (dif theta) / (dif t) = 5 / 200 = 0","025$ rad/s.
  ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Hai chất điểm $A$ và $B$ xuất phát cùng một lúc từ gốc tọa độ $O$ trên mặt phẳng, chất điểm $A$ di chuyển dọc theo chiều dương trục $O x$ với tốc độ không đổi $v_A = 6$ m/s, chất điểm $B$ di chuyển dọc theo chiều dương trục $O y$ với tốc độ không đổi $v_B = 8$ m/s. Tốc độ tăng khoảng cách giữa hai chất điểm tại mọi thời điểm $t > 0$ bằng:],
  (
    [$7$ m/s],
    True([$10$ m/s]),
    [$12$ m/s],
    [$14$ m/s]
  ),
  loigiai: [
    #step([Biểu thức khoảng cách giữa hai chất điểm])
    Tại thời điểm $t > 0$:
    Tọa độ của $A$ là $(x; 0)$ với $x = v_A t = 6t$.
    Tọa độ của $B$ là $(0; y)$ với $y = v_B t = 8t$.
    Khoảng cách giữa hai chất điểm:
    $d(t) = sqrt(x^2 + y^2) = sqrt((6t)^2 + (8t)^2) = sqrt(100t^2) = 10t$ (mét).

    #step([Tốc độ tăng khoảng cách])
    $(dif d) / (dif t) = 10$ m/s (hằng số không đổi).
  ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một quả bóng thám không dạng hình cầu được bơm khí heli sao cho thể tích của nó tăng đều đặn với tốc độ $100 pi$ cm#super[3]/s. Tại thời điểm bán kính quả bóng bằng $R = 5$ cm thì bán kính của nó đang tăng với tốc độ bằng bao nhiêu?],
  (
    [$0","5$ cm/s],
    True([$1","0$ cm/s]),
    [$1","5$ cm/s],
    [$2","0$ cm/s]
  ),
  loigiai: [
    #step([Đạo hàm thể tích hình cầu])
    Thể tích hình cầu bán kính $R$: $V = 4/3 pi R^3$.
    Lấy đạo hàm theo thời gian:
    $(dif V) / (dif t) = 4 pi R^2 dot (dif R) / (dif t).$
    Thay $(dif V) / (dif t) = 100 pi$ và $R = 5$ cm:
    $100 pi = 4 pi dot 5^2 dot (dif R) / (dif t) <=> 100 pi = 100 pi dot (dif R) / (dif t) <=> (dif R) / (dif t) = 1$ cm/s.
  ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Cũng với quả bóng hình cầu ở câu trên, tại thời điểm bán kính quả bóng bằng $R = 5$ cm, diện tích bề mặt của quả bóng đang tăng với tốc độ bằng bao nhiêu?],
  (
    [$20 pi$ cm#super[2]/s],
    True([$40 pi$ cm#super[2]/s]),
    [$50 pi$ cm#super[2]/s],
    [$80 pi$ cm#super[2]/s]
  ),
  loigiai: [
    #step([Đạo hàm diện tích mặt cầu])
    Diện tích mặt cầu: $S = 4 pi R^2$.
    Lấy đạo hàm theo thời gian:
    $(dif S) / (dif t) = 8 pi R dot (dif R) / (dif t).$
    Từ câu trước, khi $R = 5$ cm thì $(dif R) / (dif t) = 1$ cm/s.
    Thay vào ta được:
    $(dif S) / (dif t) = 8 pi dot 5 dot 1 = 40 pi$ cm#super[2]/s.
  ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một chất điểm chuyển động trên đường cong $y = x^2 + 2x$. Tại thời điểm hoành độ $x = 3$, hoành độ của chất điểm đang tăng với tốc độ $(dif x) / (dif t) = 2$ đơn vị/giây. Khi đó tung độ $y$ của chất điểm thay đổi với tốc độ bằng bao nhiêu?],
  (
    [$8$ đơn vị/giây],
    True([$16$ đơn vị/giây]),
    [$12$ đơn vị/giây],
    [$20$ đơn vị/giây]
  ),
  loigiai: [
    #step([Quy tắc chuỗi])
    Lấy đạo hàm hai vế của phương trình đường cong $y = x^2 + 2x$ theo thời gian $t$:
    $(dif y) / (dif t) = (2x + 2) dot (dif x) / (dif t).$
    Tại $x = 3$ và $(dif x) / (dif t) = 2$:
    $(dif y) / (dif t) = (2 dot 3 + 2) dot 2 = 8 dot 2 = 16$ đơn vị/giây.
  ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Nước thoát ra từ một bồn chứa hình trụ thẳng đứng qua một van ở đáy bồn. Chiều cao mực nước $h$ (mét) trong bồn giảm dần theo thời gian $t$ (phút) tuân theo định luật Torricelli: $h(t) = 4(1 - t / 20)^2$ với $0 <= t <= 20$. Tốc độ giảm của chiều cao mực nước tại thời điểm $t = 10$ phút là:],
  (
    [$0","1$ m/phút],
    True([$0","2$ m/phút]),
    [$0","3$ m/phút],
    [$0","4$ m/phút]
  ),
  loigiai: [
    #step([Đạo hàm hàm chiều cao])
    $h'(t) = 4 dot 2(1 - t / 20) dot (-1 / 20) = -2/5 (1 - t / 20).$
    Tại thời điểm $t = 10$ phút:
    $h'(10) = -2/5 (1 - 10 / 20) = -2/5 dot 1/2 = -1/5 = -0","2$ m/phút.
    Dấu âm cho biết chiều cao mực nước đang giảm. Vậy tốc độ giảm mực nước là $0","2$ m/phút.
  ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một cái phễu hình nón có bán kính miệng $R = 6$ cm và chiều sâu $H = 12$ cm. Nước đang chảy rỉ ra từ đáy phễu với tốc độ không đổi $2$ cm#super[3]/s. Tại thời điểm mực nước trong phễu còn cao $h = 4$ cm thì tốc độ tụt xuống của mực nước bằng bao nhiêu?],
  (
    [$1 / (2 pi)$ cm/s],
    True([$1 / (2 pi)$ cm/s]),
    [$1 / pi$ cm/s],
    [$2 / pi$ cm/s],
    [$1 / (4 pi)$ cm/s]
  ),
  loigiai: [
    #step([Mối quan hệ bán kính và chiều cao])
    Tam giác đồng dạng: $r / h = 6 / 12 = 1/2 => r = h / 2$.
    Thể tích nước: $V = 1/3 pi r^2 h = 1/3 pi (h/2)^2 h = pi / 12 h^3$.

    #step([Đạo hàm theo thời gian])
    $(dif V) / (dif t) = (pi h^2) / 4 dot (dif h) / (dif t).$
    Vì nước chảy ra khỏi phễu với tốc độ $2$ cm#super[3]/s nên $(dif V) / (dif t) = -2$.
    Tại $h = 4$ cm:
    $-2 = (pi dot 4^2) / 4 dot (dif h) / (dif t) <=> -2 = 4 pi dot (dif h) / (dif t) <=> (dif h) / (dif t) = -2 / (4 pi) = -1 / (2 pi)$ cm/s.
    Vậy mực nước tụt xuống với tốc độ $1 / (2 pi)$ cm/s.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một bồn chứa nước hình nón tròn xoay có bán kính miệng bồn là $R = 3$ m và chiều sâu của bồn là $H = 6$ m, đỉnh nón chúc thẳng xuống dưới. Nước được bơm vào bồn với lưu lượng không đổi $Q = 0","6 pi$ m#super[3]/phút. Gọi $h(t)$ là chiều cao mực nước và $r(t)$ là bán kính của mặt nước trong bồn tại thời điểm $t$ ($0 <= h <= 6$).
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Hình nón
      circle((0, 3), radius: (2, 0.4), stroke: (paint: rgb("#0284c7"), thickness: 1.5pt))
      line((-2, 3), (0, -1), stroke: (paint: rgb("#0284c7"), thickness: 1.5pt))
      line((2, 3), (0, -1), stroke: (paint: rgb("#0284c7"), thickness: 1.5pt))
      // Mực nước
      circle((0, 1), radius: (1, 0.2), fill: rgb("#e0f2fe"), stroke: (paint: rgb("#0284c7"), thickness: 1pt))
      line((-1, 1), (0, -1), stroke: (paint: rgb("#0284c7"), thickness: 1pt, dash: "dashed"))
      line((1, 1), (0, -1), stroke: (paint: rgb("#0284c7"), thickness: 1pt, dash: "dashed"))
      // Kích thước
      line((0, 3), (0, -1), stroke: (paint: rgb("#9ca3af"), thickness: 0.8pt, dash: "dotted"))
      content((0.3, 1), [$h$])
      content((1.2, 3.3), [$R = 3$ m])
      content((0.3, 2), [$H = 6$ m])
    })
  ]],
  (
    True([Tại mọi thời điểm mực nước cao $h$, bán kính mặt nước thỏa mãn $r = h / 2$.]),
    True([Thể tích khối nước trong bồn khi chiều cao mực nước là $h$ bằng $V(h) = pi / 12 h^3$.]),
    True([Tốc độ dâng lên của mực nước tỉ lệ nghịch với bình phương chiều cao mực nước: $(dif h) / (dif t) = (2","4) / h^2$ (m/phút).]),
    [Khi mực nước đạt độ cao $h = 3$ m, tốc độ dâng lên của mực nước lớn hơn $0","3$ m/phút.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Theo tính chất tam giác đồng dạng mặt cắt trục:
    $r / h = R / H = 3/6 = 1/2 => r = h / 2$. Ý a ĐÚNG.

    #step([Phân tích ý b])
    Thể tích nón cụt nước:
    $V = 1/3 pi r^2 h = 1/3 pi (h/2)^2 h = pi / 12 h^3$. Ý b ĐÚNG.

    #step([Phân tích ý c])
    Đạo hàm theo thời gian:
    $(dif V) / (dif t) = (pi h^2) / 4 dot (dif h) / (dif t).$
    Vì $(dif V) / (dif t) = 0","6 pi$ nên:
    $0","6 pi = (pi h^2) / 4 dot (dif h) / (dif t) <=> (dif h) / (dif t) = (4 dot 0","6) / h^2 = (2","4) / h^2$ (m/phút). Ý c ĐÚNG.

    #step([Phân tích ý d])
    Khi $h = 3$ m:
    $(dif h) / (dif t) = (2","4) / 3^2 = (2","4) / 9 = 4/15 approx 0","267$ m/phút.
    Vì $0","267 < 0","3$ nên tốc độ dâng nhỏ hơn $0","3$ m/phút. Ý d SAI.
  ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một chiếc thang có chiều dài $L = 10$ m được dựng dựa vào một bức tường phẳng thẳng đứng. Chân thang bắt đầu trượt ra xa chân tường trên nền nhà nằm ngang với vận tốc không đổi $v_x = 0","8$ m/s. Gọi $x(t)$ là khoảng cách từ chân thang đến chân tường, $y(t)$ là chiều cao của đỉnh thang trên tường, và $S(t) = 1/2 x(t) y(t)$ là diện tích của tam giác vuông tạo bởi bức tường, sàn nhà và chiếc thang.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-0.5, 0), (5, 0), stroke: (paint: rgb("#4b5563"), thickness: 1.5pt))
      line((0, -0.5), (0, 4.5), stroke: (paint: rgb("#4b5563"), thickness: 1.5pt))
      content((-0.4, 4.5), [Tường])
      content((5, -0.3), [Sàn])
      line((0, 3.5), (3, 0), stroke: (paint: rgb("#0284c7"), thickness: 2.5pt))
      content((1.8, 2), [$L = 10$ m])
      circle((3, 0), radius: 0.08, fill: rgb("#0284c7"))
      line((3, 0), (4.2, 0), stroke: (paint: rgb("#dc2626"), thickness: 1.5pt), mark: (end: "stealth"))
      content((3.6, -0.3), [$v_x$])
      circle((0, 3.5), radius: 0.08, fill: rgb("#0284c7"))
      line((0, 3.5), (0, 2.3), stroke: (paint: rgb("#dc2626"), thickness: 1.5pt), mark: (end: "stealth"))
      content((-0.4, 2.9), [$v_y$])
    })
  ]],
  (
    True([Tại thời điểm chân thang cách tường $x = 6$ m thì đỉnh thang ở độ cao $y = 8$ m và đang tụt xuống với tốc độ $0","6$ m/s.]),
    True([Diện tích tam giác vuông theo biến $x$ là $S(x) = 1/2 x sqrt(100 - x^2)$.]),
    True([Diện tích tam giác đạt giá trị lớn nhất khi chiếc thang tạo với mặt sàn một góc $45^circ$ (tức $x = y = 5 sqrt(2)$ m).]),
    [Tại thời điểm diện tích tam giác đạt giá trị lớn nhất, tốc độ thay đổi của diện tích tam giác $(dif S) / (dif t)$ bằng $4$ m#super[2]/s.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    $x^2 + y^2 = 100$. Khi $x = 6$ thì $y = sqrt(100 - 36) = 8$ m.
    $x dot (dif x)/(dif t) + y dot (dif y)/(dif t) = 0 <=> 6(0","8) + 8 dot (dif y)/(dif t) = 0 <=> (dif y)/(dif t) = -4","8 / 8 = -0","6$ m/s. Ý a ĐÚNG.

    #step([Phân tích ý b])
    $y = sqrt(100 - x^2)$ nên $S(x) = 1/2 x y = 1/2 x sqrt(100 - x^2)$. Ý b ĐÚNG.

    #step([Phân tích ý c])
    $S(x) = 1/2 sqrt(x^2(100 - x^2))$.
    Áp dụng Cauchy cho hai số dương $x^2$ và $100 - x^2$:
    $x^2(100 - x^2) <= ((x^2 + 100 - x^2) / 2)^2 = 50^2 = 2500.$
    Dấu "=" xảy ra khi $x^2 = 100 - x^2 <=> 2x^2 = 100 <=> x = 5 sqrt(2)$ m.
    Khi đó $y = sqrt(100 - 50) = 5 sqrt(2)$ m, tam giác vuông cân nên góc nghiêng là $45^circ$. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Vì tại thời điểm diện tích đạt giá trị lớn nhất (cực đại), đạo hàm của diện tích theo thời gian phải bằng $0$:
    $(dif S) / (dif t) = S'(x) dot (dif x) / (dif t) = 0 dot v_x = 0$ m#super[2]/s.
    Do đó không thể bằng $4$ m#super[2]/s. Ý d SAI.
  ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một cột đèn cao $H = 6$ m chiếu sáng một con đường bằng phẳng. Một người đi bộ cao $h = 1","8$ m bước đi thẳng ra xa cột đèn với tốc độ không đổi $v = 1","4$ m/s. Gọi $x(t)$ là khoảng cách từ chân người đến chân cột đèn, $s(t)$ là chiều dài bóng người in trên đường, và $L(t) = x(t) + s(t)$ là khoảng cách từ chân cột đèn đến đỉnh bóng.],
  (
    True([Chiều dài bóng người $s(t)$ liên hệ với khoảng cách $x(t)$ bởi công thức $s(t) = 3/7 x(t)$.]),
    True([Tốc độ dài ra của bóng người là hằng số không đổi và bằng $0","6$ m/s.]),
    True([Đỉnh của bóng người di chuyển trên mặt đất với tốc độ không đổi bằng $2","0$ m/s.]),
    [Nếu người đi bộ tăng tốc độ lên gấp đôi thì tốc độ dài ra của bóng sẽ tăng lên gấp bốn lần.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Theo định lý Thales:
    $s / (s + x) = (1","8) / 6 = 3 / 10 <=> 10s = 3s + 3x <=> 7s = 3x <=> s(t) = 3/7 x(t)$. Ý a ĐÚNG.

    #step([Phân tích ý b])
    Lấy đạo hàm theo thời gian:
    $(dif s) / (dif t) = 3/7 dot (dif x) / (dif t) = 3/7 dot 1","4 = 0","6$ m/s (hằng số không phụ thuộc vào vị trí). Ý b ĐÚNG.

    #step([Phân tích ý c])
    Khoảng cách từ chân cột đến đỉnh bóng:
    $L(t) = x(t) + s(t) = x(t) + 3/7 x(t) = 10/7 x(t).$
    Tốc độ di chuyển của đỉnh bóng:
    $(dif L) / (dif t) = 10/7 dot (dif x) / (dif t) = 10/7 dot 1","4 = 2","0$ m/s. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Vì $(dif s) / (dif t) = 3/7 dot (dif x) / (dif t)$ là một hàm bậc nhất đồng dạng với $(dif x) / (dif t)$, nên khi tốc độ người $(dif x) / (dif t)$ tăng lên gấp đôi thì tốc độ dài bóng chỉ tăng lên gấp đôi, chứ không phải gấp bốn. Ý d SAI.
  ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một bể chứa nước có dạng hình bán cầu với bán kính $R = 5$ m, mặt phẳng đáy tròn nằm ngang ở phía trên miệng bể. Nước được bơm vào bể với lưu lượng không đổi $Q = 0","4 pi$ m#super[3]/phút. Thể tích của khối chỏm cầu nước khi mực nước có độ sâu $h$ (tính từ điểm đáy sâu nhất của bán cầu, $0 <= h <= 5$) được tính theo công thức $V(h) = pi h^2 (R - h/3) = pi h^2 (5 - h/3)$.],
  (
    True([Diện tích mặt nước trong bể tại độ sâu $h$ là $S(h) = pi (10h - h^2)$.]),
    True([Đạo hàm thể tích nước theo chiều cao chính bằng diện tích mặt thoáng của nước: $(dif V) / (dif h) = S(h)$.]),
    True([Tốc độ dâng lên của mực nước được xác định bởi công thức $(dif h) / (dif t) = (0","4) / (10h - h^2)$ (m/phút).]),
    [Mực nước dâng lên nhanh nhất khi mực nước ở độ sâu $h = 5$ m (đầy nửa bể).]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Theo định lý Pytago trong mặt cắt thẳng đứng qua tâm hình cầu:
    Bán kính mặt nước tại độ sâu $h$ thỏa mãn $r^2 = R^2 - (R - h)^2 = 2 R h - h^2 = 10h - h^2$.
    Diện tích mặt nước: $S(h) = pi r^2 = pi (10h - h^2)$. Ý a ĐÚNG.

    #step([Phân tích ý b])
    $V(h) = pi (5 h^2 - h^3 / 3) => V'(h) = pi (10 h - h^2) = S(h)$.
    Đạo hàm thể tích theo chiều cao luôn bằng diện tích mặt thoáng. Ý b ĐÚNG.

    #step([Phân tích ý c])
    Theo quy tắc chuỗi:
    $(dif V) / (dif t) = (dif V) / (dif h) dot (dif h) / (dif t) <=> Q = pi(10h - h^2) dot (dif h) / (dif t).$
    Vì $Q = 0","4 pi$ nên:
    $(dif h) / (dif t) = (0","4 pi) / (pi(10h - h^2)) = (0","4) / (10h - h^2)$ (m/phút). Ý c ĐÚNG.

    #step([Phân tích ý d])
    Tốc độ dâng $(dif h) / (dif t) = (0","4) / (10h - h^2)$ lớn nhất khi mẫu số $10h - h^2$ nhỏ nhất.
    Khi $h -> 0$ (lúc mới bắt đầu bơm nước, đáy hẹp), diện tích mặt nước rất nhỏ nên mực nước dâng lên nhanh nhất.
    Tại $h = 5$ m, diện tích mặt nước $S(5) = 25 pi$ là lớn nhất, nên mực nước dâng lên CHẬM NHẤT ($0","4 / 25 = 0","016$ m/phút). Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một cái thang dài $10$ m dựng dựa vào bức tường thẳng đứng. Chân thang trượt ra xa tường với tốc độ $1","2$ m/s. Khi chân thang cách chân tường $6$ m thì đầu trên của thang đang tụt xuống với tốc độ bằng bao nhiêu m/s? (Nhập kết quả dưới dạng số thập phân)],
  [0.9],
  loigiai: [
    #step([Hệ thức Pytago])
    $x^2 + y^2 = 10^2 = 100$.
    Khi $x = 6$ m thì $y = sqrt(100 - 36) = 8$ m.

    #step([Đạo hàm liên kết])
    $2x dot (dif x)/(dif t) + 2y dot (dif y)/(dif t) = 0 <=> x dot (dif x)/(dif t) + y dot (dif y)/(dif t) = 0.$
    Thay $x = 6$, $y = 8$, $(dif x)/(dif t) = 1","2$:
    $6(1","2) + 8 dot (dif y)/(dif t) = 0 <=> 7","2 + 8 dot (dif y)/(dif t) = 0 <=> (dif y)/(dif t) = -0","9$ m/s.
    Tốc độ tụt xuống là $0","9$ m/s.
  ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một người cao $1","7$ m đi bộ ra xa một cây đèn đường cao $5","1$ m với vận tốc $2$ m/s. Tốc độ di chuyển của bóng đỉnh đầu người đó trên mặt đất bằng bao nhiêu m/s?],
  [3],
  loigiai: [
    #step([Tam giác đồng dạng])
    Gọi khoảng cách từ người đến chân đèn là $x$, chiều dài bóng là $s$.
    $s / (s + x) = (1","7) / (5","1) = 1/3 <=> 3s = s + x <=> 2s = x <=> s = 1/2 x.$
    Khoảng cách từ chân đèn đến bóng đỉnh đầu là:
    $L = x + s = x + 1/2 x = 3/2 x.$

    #step([Tính tốc độ])
    $(dif L) / (dif t) = 3/2 dot (dif x) / (dif t) = 3/2 dot 2 = 3$ m/s.
  ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một bồn nước hình nón tròn xoay đỉnh chúc xuống dưới có bán kính miệng $R = 1$ m và chiều cao $H = 2$ m. Bơm nước vào bồn với lưu lượng không đổi $0","25 pi$ m#super[3]/phút. Tốc độ dâng lên của mực nước tại thời điểm chiều cao mực nước đạt $h = 1$ m bằng bao nhiêu m/phút?],
  [1],
  loigiai: [
    #step([Mối quan hệ thể tích và chiều cao])
    $r / h = 1/2 => r = h/2$.
    $V = 1/3 pi r^2 h = pi / 12 h^3.$
    $(dif V) / (dif t) = (pi h^2) / 4 dot (dif h) / (dif t).$

    #step([Tính tốc độ dâng])
    Thay $(dif V)/(dif t) = 0","25 pi = pi / 4$ và $h = 1$:
    $pi / 4 = (pi dot 1^2) / 4 dot (dif h)/(dif t) <=> (dif h)/(dif t) = 1$ m/phút.
  ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một trạm radar đặt tại mặt đất theo dõi một tên lửa thử nghiệm đang bay thẳng đứng lên trời với vận tốc không đổi $v = 400$ m/s. Trạm radar cách bệ phóng tên lửa $300$ m trên mặt đất phẳng. Khi tên lửa đạt độ cao $400$ m, khoảng cách giữa tên lửa và trạm radar đang tăng với tốc độ bằng bao nhiêu m/s?],
  [320],
  loigiai: [
    #step([Hệ thức Pytago])
    Gọi khoảng cách từ radar đến tên lửa là $s$, độ cao tên lửa là $y$.
    $s^2 = y^2 + 300^2$.
    Khi $y = 400$ m: $s = sqrt(400^2 + 300^2) = 500$ m.

    #step([Đạo hàm liên kết])
    $2s dot (dif s)/(dif t) = 2y dot (dif y)/(dif t) <=> s dot (dif s)/(dif t) = y dot (dif y)/(dif t).$
    Thay số:
    $500 dot (dif s)/(dif t) = 400 dot 400 = 160000 <=> (dif s)/(dif t) = 160000 / 500 = 320$ m/s.
  ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Một máy bay trực thăng bay ở độ cao $1200$ m theo phương ngang với vận tốc $150$ m/s hướng thẳng về phía một đài kiểm soát không lưu. Khoảng cách đường thẳng từ đài kiểm soát đến trực thăng là $s$. Khi khoảng cách $s = 1500$ m, khoảng cách này đang giảm với tốc độ bằng bao nhiêu m/s?],
  [90],
  loigiai: [
    #step([Mối liên hệ khoảng cách])
    Gọi $x$ là khoảng cách theo phương nằm ngang từ trực thăng đến vị trí ngay trên đài kiểm soát.
    $s^2 = x^2 + 1200^2$.
    Khi $s = 1500$ m thì $x = sqrt(1500^2 - 1200^2) = 900$ m.

    #step([Tính tốc độ giảm khoảng cách])
    $s dot (dif s)/(dif t) = x dot (dif x)/(dif t).$
    Vì trực thăng bay về phía đài nên $(dif x)/(dif t) = -150$ m/s.
    Thay số:
    $1500 dot (dif s)/(dif t) = 900 dot (-150) <=> (dif s)/(dif t) = -90$ m/s.
    Vậy khoảng cách đang giảm với tốc độ $90$ m/s.
  ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd01G — Mã 507], back-to: "sec-exercise-hub",
  [Hai tàu cứu hộ $A$ và $B$ rời cảng cùng một lúc. Tàu $A$ chạy về hướng Nam với vận tốc $30$ km/h, tàu $B$ chạy về hướng Tây với vận tốc $40$ km/h. Sau $3$ giờ, khoảng cách giữa hai tàu đang tăng lên với tốc độ bằng bao nhiêu km/h?],
  [50],
  loigiai: [
    #step([Biểu thức khoảng cách theo thời gian])
    Sau thời gian $t$ (giờ):
    Quãng đường tàu $A$ đi được: $y = 30t$ (km).
    Quãng đường tàu $B$ đi được: $x = 40t$ (km).
    Khoảng cách giữa hai con tàu:
    $d(t) = sqrt(x^2 + y^2) = sqrt((40t)^2 + (30t)^2) = sqrt(1600t^2 + 900t^2) = sqrt(2500t^2) = 50t$ (km).

    #step([Tốc độ tăng khoảng cách])
    $(dif d) / (dif t) = 50$ km/h tại mọi thời điểm $t > 0$, bao gồm cả thời điểm $t = 3$ giờ.
  ]
)

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHỦ ĐỀ 1G: TỐC ĐỘ THAY ĐỔI, NƯỚC DÂNG & RÚT NƯỚC (RELATED RATES) (VD - VDC)!]      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
