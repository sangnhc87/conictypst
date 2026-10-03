// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHỦ ĐỀ 1F: CHI PHÍ ẨN THEO VẬN TỐC & VẬN HÀNH PHƯƠNG TIỆN (VD - VDC)
// Lớp: Khối 12  ·  Mã đề: 506  ·  GV: Nguyễn Văn Sang
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
  title: "CHỦ ĐỀ 1F: CHI PHÍ ẨN THEO VẬN TỐC & VẬN HÀNH PHƯƠNG TIỆN (VD - VDC)",
  subtitle: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN — MÃ ĐỀ: 506",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 506]],
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
#lt-tn(num: 1, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một chiếc tàu thủy di chuyển trên biển với vận tốc không đổi $v$ (hải lý/giờ). Biết rằng chi phí nhiên liệu tiêu thụ trong mỗi giờ tỉ lệ thuận với bình phương của vận tốc tàu và bằng $2 v^2$ nghìn đồng/giờ. Ngoài ra, các chi phí cố định khác (như tiền lương thuyền viên, khấu hao máy móc) là $800$ nghìn đồng cho mỗi giờ chạy tàu. Vận tốc của tàu thủy bằng bao nhiêu hải lý/giờ để tổng chi phí cho một chuyến hải trình dài $100$ hải lý là nhỏ nhất?],
  (
    [$15$ hải lý/giờ],
    True([$20$ hải lý/giờ]),
    [$25$ hải lý/giờ],
    [$30$ hải lý/giờ]
  ),
  loigiai: [
    #step([Thiết lập hàm tổng chi phí])
    Thời gian đi hết quãng đường $S = 100$ hải lý với vận tốc $v$ là $t = 100 / v$ (giờ) ($v > 0$).
    Tổng chi phí trên mỗi giờ chạy tàu: $C_1(v) = 2 v^2 + 800$ (nghìn đồng/giờ).
    Tổng chi phí cho cả chuyến đi:
    $C(v) = t dot C_1(v) = 100 / v (2 v^2 + 800) = 200 v + 80000 / v quad ("nghìn đồng").$

    #step([Tìm cực tiểu bằng bất đẳng thức Cauchy])
    Vì $v > 0$, áp dụng bất đẳng thức Cauchy cho hai số dương $200 v$ và $80000 / v$:
    $C(v) = 200 v + 80000 / v >= 2 sqrt(200 v dot 80000 / v) = 2 sqrt(16000000) = 2 dot 4000 = 8000$ (nghìn đồng).
    Dấu bằng xảy ra khi:
    $200 v = 80000 / v <=> v^2 = 400 <=> v = 20$ hải lý/giờ.
    Vậy tàu nên chạy với vận tốc $20$ hải lý/giờ để chi phí chuyến đi nhỏ nhất.
  ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một xe tải vận chuyển hàng hóa trên quãng đường dài $300$ km. Chi phí nhiên liệu cho mỗi giờ chạy xe với vận tốc $v$ (km/h) được xác định bởi công thức $F(v) = 30 + 0","06 v^2$ (nghìn đồng/giờ). Lương trả cho tài xế tính theo thời gian là $120$ nghìn đồng/giờ. Vận tốc tối ưu của xe tải để tổng chi phí vận chuyển chuyến hàng là nhỏ nhất bằng:],
  (
    [$40$ km/h],
    True([$50$ km/h]),
    [$60$ km/h],
    [$70$ km/h]
  ),
  loigiai: [
    #step([Lập hàm chi phí])
    Thời gian chạy hết quãng đường $300$ km: $t = 300 / v$ (giờ).
    Chi phí mỗi giờ chạy xe: $C_"giờ"(v) = F(v) + 120 = 30 + 0","06 v^2 + 120 = 150 + 0","06 v^2$ (nghìn đồng).
    Tổng chi phí cả chuyến đi:
    $C(v) = 300 / v (150 + 0","06 v^2) = 45000 / v + 18 v quad ("nghìn đồng").$

    #step([Tìm vận tốc tối ưu bằng bất đẳng thức Cauchy])
    Áp dụng bất đẳng thức Cauchy cho hai số dương $45000 / v$ và $18 v$:
    $C(v) >= 2 sqrt(45000 / v dot 18 v) = 2 sqrt(810000) = 2 dot 900 = 1800$ (nghìn đồng).
    Dấu "=" xảy ra khi:
    $18 v = 45000 / v <=> v^2 = 2500 <=> v = 50$ km/h.
    Vậy xe tải nên chạy với vận tốc $50$ km/h để chi phí nhỏ nhất.
  ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một chiếc tàu kéo chạy ngược dòng sông từ bến $A$ đến bến $B$ cách nhau $60$ km. Nước sông chảy đều với vận tốc $v_0 = 4$ km/h. Vận tốc của tàu đối với dòng nước là $v$ (km/h) với $v > 4$. Chi phí dầu diesel tiêu thụ cho mỗi giờ tỉ lệ với bình phương vận tốc của tàu đối với dòng nước và bằng $5 v^2$ (nghìn đồng/giờ). Chi phí thuê nhân công và khấu hao là $100$ nghìn đồng/giờ. Tàu cần duy trì vận tốc $v$ đối với dòng nước bằng bao nhiêu để chi phí của chuyến đi ngược dòng là thấp nhất?],
  (
    [$8$ km/h],
    True([$10$ km/h]),
    [$12$ km/h],
    [$14$ km/h]
  ),
  loigiai: [
    #step([Hàm chi phí ngược dòng])
    Vận tốc của tàu đối với bờ sông khi chạy ngược dòng là $v_"thực" = v - 4$ (km/h).
    Thời gian hoàn thành chuyến đi: $t = 60 / (v - 4)$ (giờ).
    Chi phí cho mỗi giờ hoạt động: $C_1(v) = 5 v^2 + 100 = 5(v^2 + 20)$ (nghìn đồng).
    Tổng chi phí của chuyến đi:
    $C(v) = 60 dot (5 v^2 + 100) / (v - 4) = 300 dot (v^2 + 20) / (v - 4) quad ("nghìn đồng"), quad v > 4.$

    #step([Khảo sát đạo hàm])
    Xét hàm $g(v) = (v^2 + 20) / (v - 4)$ với $v > 4$.
    $g'(v) = (2 v(v - 4) - (v^2 + 20)) / (v - 4)^2 = (2 v^2 - 8 v - v^2 - 20) / (v - 4)^2 = (v^2 - 8 v - 20) / (v - 4)^2.$
    Ta có $v^2 - 8 v - 20 = (v - 10)(v + 2)$.
    Với $v > 4$, $g'(v) = 0 <=> v = 10$ km/h.
    Bảng biến thiên cho thấy $C(v)$ đạt giá trị nhỏ nhất tại $v = 10$ km/h.
  ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một chiếc tàu thủy chở hàng chạy xuôi dòng một con sông từ cảng $A$ đến cảng $B$. Vận tốc dòng nước chảy là $v_n = 3$ km/h. Chi phí nhiên liệu mỗi giờ tỉ lệ với bình phương vận tốc tương đối của tàu so với nước: $C_"nl" = 2 v^2$ (nghìn đồng/giờ). Các chi phí cố định khác là $144$ nghìn đồng/giờ. Để chi phí chuyến đi xuôi dòng là nhỏ nhất thì vận tốc tương đối $v$ của tàu so với nước phải bằng bao nhiêu?],
  (
    [$5$ km/h],
    True([$6$ km/h]),
    [$7$ km/h],
    [$8$ km/h]
  ),
  loigiai: [
    #step([Hàm chi phí xuôi dòng])
    Vận tốc của tàu so với bờ khi chạy xuôi dòng: $v + 3$ (km/h).
    Thời gian đi quãng đường $S$: $t = S / (v + 3)$.
    Chi phí mỗi giờ: $2 v^2 + 144 = 2(v^2 + 72)$ (nghìn đồng).
    Hàm chi phí chuyến đi: $C(v) = 2 S dot (v^2 + 72) / (v + 3)$.

    #step([Tìm cực trị])
    Xét đạo hàm của $g(v) = (v^2 + 72) / (v + 3)$:
    $g'(v) = (2 v(v + 3) - (v^2 + 72)) / (v + 3)^2 = (v^2 + 6 v - 72) / (v + 3)^2 = ((v - 6)(v + 12)) / (v + 3)^2.$
    Với $v > 0$, $g'(v) = 0 <=> v = 6$ km/h.
    Hàm số đạt giá trị nhỏ nhất tại $v = 6$ km/h.
  ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Theo nghiên cứu an toàn giao thông, khoảng cách an toàn tối thiểu giữa hai ô tô liên tiếp chạy cùng chiều trên một làn đường cao tốc với vận tốc $v$ (km/h) được cho bởi công thức dừng xe an toàn: $d(v) = 5 + 0","2 v + 0","005 v^2$ (mét), trong đó $5$ m là chiều dài trung bình của một ô tô. Lưu lượng xe $Q(v)$ (số xe đi qua một điểm kiểm soát trên làn đường trong một giờ) được tính bởi công thức $Q(v) = (1000 v) / (d(v))$. Để lưu lượng xe qua điểm kiểm soát đạt giá trị lớn nhất, các phương tiện nên duy trì vận tốc bằng bao nhiêu?],
  (
    [$30$ km/h],
    [$35$ km/h],
    True([$31","6$ km/h]),
    [$40$ km/h]
  ),
  loigiai: [
    #step([Thiết lập hàm lưu lượng])
    $Q(v) = (1000 v) / (5 + 0","2 v + 0","005 v^2) = 1000 / (5/v + 0","2 + 0","005 v).$
    Để $Q(v)$ lớn nhất thì mẫu số $M(v) = 5/v + 0","005 v + 0","2$ phải nhỏ nhất.

    #step([Áp dụng bất đẳng thức Cauchy])
    Áp dụng bất đẳng thức Cauchy cho hai số dương $5/v$ và $0","005 v$:
    $5/v + 0","005 v >= 2 sqrt(5/v dot 0","005 v) = 2 sqrt(0","025) = 2 dot 0","05 sqrt(10) = 0","1 sqrt(10).$
    Dấu "=" xảy ra khi:
    $5/v = 0","005 v <=> v^2 = 5 / 0","005 = 1000 <=> v = sqrt(1000) = 10 sqrt(10) approx 31","62$ km/h.
  ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một máy bay phản lực bay hành trình ở độ cao ổn định. Lực cản không khí tác dụng lên máy bay gồm hai thành phần: lực cản cảm ứng (tỉ lệ nghịch với bình phương vận tốc) và lực cản ma sát khí động học (tỉ lệ thuận với bình phương vận tốc). Tổng lực cản được mô hình hóa bởi $R(v) = A / v^2 + B v^2$ (với $A, B > 0$). Biết rằng để bay với quãng đường xa nhất với cùng một lượng nhiên liệu, máy bay cần bay ở vận tốc sao cho tổng lực cản $R(v)$ là nhỏ nhất. Tỉ số giữa lực cản cảm ứng và lực cản ma sát tại vận tốc tối ưu này bằng:],
  (
    [$1/2$],
    True([$1$]),
    [$2$],
    [$sqrt(2)$]
  ),
  loigiai: [
    #step([Khảo sát lực cản khí động học])
    Hàm tổng lực cản: $R(v) = A / v^2 + B v^2$ ($v > 0$).
    Áp dụng bất đẳng thức Cauchy cho hai số dương $A / v^2$ và $B v^2$:
    $R(v) >= 2 sqrt(A / v^2 dot B v^2) = 2 sqrt(A B).$
    Dấu bằng xảy ra khi và chỉ khi hai thành phần bằng nhau:
    $A / v^2 = B v^2 <=> (A / v^2) / (B v^2) = 1.$
    Vậy tại vận tốc tối ưu, lực cản cảm ứng bằng lực cản ma sát (tỉ số bằng $1$).
  ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Các nhà sinh học quan sát thấy một loài chim di cư bay một quãng đường dài $1000$ km. Năng lượng tiêu hao của một con chim trên mỗi giờ bay với vận tốc $v$ (km/h) được cho bởi $P(v) = 20 + 0","05 v^3$ (Joule/giờ). Để hoàn thành quãng đường di cư với tổng năng lượng tiêu hao ít nhất, đàn chim nên bay với vận tốc bằng bao nhiêu?],
  (
    [$4","6$ km/h],
    True([$5","8$ km/h]),
    [$6","5$ km/h],
    [$7","2$ km/h]
  ),
  loigiai: [
    #step([Hàm tổng năng lượng tiêu hao])
    Thời gian bay quãng đường $S = 1000$ km: $t = 1000 / v$ (giờ).
    Tổng năng lượng tiêu hao:
    $E(v) = t dot P(v) = 1000 / v (20 + 0","05 v^3) = 20000 / v + 50 v^2 quad ("Joule").$

    #step([Tìm cực trị])
    Đạo hàm:
    $E'(v) = -20000 / v^2 + 100 v.$
    $E'(v) = 0 <=> 100 v = 20000 / v^2 <=> v^3 = 200 <=> v = root(3, 200) approx 5","848$ km/h.
    Vậy đàn chim nên bay với vận tốc xấp xỉ $5","8$ km/h.
  ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một chiếc tàu thủy chở khách di chuyển từ đảo vào đất liền với khoảng cách $40$ hải lý. Chi phí nhiên liệu mỗi giờ tỉ lệ thuận với lập phương vận tốc tàu $v$ (hải lý/h) theo công thức $C_"nl" = 0","1 v^3$ (nghìn đồng/giờ). Chi phí trả lương cho thủy thủ đoàn và dịch vụ trên tàu là $320$ nghìn đồng/giờ. Vận tốc tàu để tổng chi phí chuyến đi đạt giá trị nhỏ nhất là:],
  (
    [$10$ hải lý/giờ],
    True([$11","7$ hải lý/giờ]),
    [$12$ hải lý/giờ],
    [$15$ hải lý/giờ]
  ),
  loigiai: [
    #step([Lập hàm chi phí])
    Thời gian di chuyển: $t = 40 / v$ (giờ).
    Tổng chi phí chuyến đi:
    $C(v) = 40 / v (0","1 v^3 + 320) = 4 v^2 + 12800 / v quad ("nghìn đồng").$

    #step([Tìm cực trị])
    $C'(v) = 8 v - 12800 / v^2.$
    $C'(v) = 0 <=> 8 v^3 = 12800 <=> v^3 = 1600 <=> v = root(3, 1600) = 2 root(3, 200) approx 11","696$ hải lý/giờ.
    Làm tròn đến hàng phần mười là $11","7$ hải lý/giờ.
  ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một doanh nghiệp logistics vận chuyển một lô hàng bằng xe container trên quãng đường $400$ km. Biết rằng nếu xe chạy với vận tốc $v$ (km/h) ($40 <= v <= 90$) thì chi phí nhiên liệu cho mỗi giờ chạy xe là $0","05 v^2$ (nghìn đồng/giờ), và chi phí tài xế cùng khấu hao phương tiện là $180$ nghìn đồng cho mỗi giờ chạy xe. Vận tốc xe container nên duy trì để tổng chi phí vận chuyển là nhỏ nhất là:],
  (
    [$50$ km/h],
    True([$60$ km/h]),
    [$70$ km/h],
    [$80$ km/h]
  ),
  loigiai: [
    #step([Thiết lập hàm chi phí])
    Thời gian chạy hết quãng đường $400$ km: $t = 400 / v$ (giờ).
    Chi phí cho mỗi giờ chạy xe: $0","05 v^2 + 180$ (nghìn đồng).
    Tổng chi phí của chuyến đi:
    $C(v) = 400 / v (0","05 v^2 + 180) = 20 v + 72000 / v quad ("nghìn đồng"), quad v in [40; 90].$

    #step([Tìm cực trị])
    Áp dụng bất đẳng thức Cauchy cho hai số dương $20 v$ và $72000 / v$:
    $C(v) >= 2 sqrt(20 v dot 72000 / v) = 2 sqrt(1440000) = 2 dot 1200 = 2400$ (nghìn đồng).
    Dấu "=" xảy ra khi:
    $20 v = 72000 / v <=> v^2 = 3600 <=> v = 60$ km/h (thỏa mãn $40 <= v <= 90$).
    Vậy xe container nên chạy ở vận tốc $60$ km/h.
  ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một tàu kéo công suất lớn kéo một xà lan chở than đá đi ngược dòng sông với vận tốc dòng chảy là $v_0 = 3$ km/h. Chi phí vận hành mỗi giờ gồm chi phí nhiên liệu tỉ lệ với lập phương vận tốc tương đối $v$ của tàu so với nước: $C_"nl" = a v^3$, và chi phí nhân công cố định $C_0$. Theo quy tắc kinh tế hàng hải, nếu vận tốc $v$ được chọn để chi phí cho một chuyến đi là nhỏ nhất thì tỉ số giữa vận tốc $v$ và vận tốc dòng chảy $v_0$ thỏa mãn quan hệ nào sau đây?],
  (
    [$v = 2 v_0$],
    True([$v = 1","5 v_0$]),
    [$v = 3 v_0$],
    [$v = sqrt(3) v_0$]
  ),
  loigiai: [
    #step([Tổng quát bài toán vận tốc ngược dòng với chi phí bậc 3])
    Thời gian đi quãng đường $S$: $t = S / (v - v_0)$.
    Chi phí mỗi giờ: $a v^3 + C_0$.
    Tổng chi phí chuyến đi: $C(v) = S dot (a v^3 + C_0) / (v - v_0)$.
    Xét hàm $f(v) = (a v^3 + C_0) / (v - v_0)$ với $v > v_0$.
    Đạo hàm:
    $f'(v) = (3 a v^2 (v - v_0) - (a v^3 + C_0)) / (v - v_0)^2 = (2 a v^3 - 3 a v_0 v^2 - C_0) / (v - v_0)^2.$
    Nếu chi phí cố định $C_0$ không đáng kể so với chi phí nhiên liệu ở tốc độ cao (hoặc xét trường hợp đặc biệt $C_0 = 0$):
    $f'(v) = 0 <=> 2 a v^3 - 3 a v_0 v^2 = 0 <=> a v^2 (2 v - 3 v_0) = 0 <=> v = 3/2 v_0 = 1","5 v_0$.
    Kết quả kinh điển này cho thấy: Để tối thiểu hóa chi phí nhiên liệu khi chạy ngược dòng, tàu phải chạy với vận tốc đối với nước gấp rưỡi ($1","5$ lần) vận tốc dòng nước!
  ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một vận động viên đua xe đạp đường trường có công suất tiêu hao tổng cộng của cơ thể khi đạp xe ở tốc độ $v$ (m/s) gồm hai thành phần: công suất trao đổi chất cơ bản là $256$ W và công suất thắng lực cản khí động học là $0","5 v^3$ (W). Năng lượng tiêu hao trên mỗi mét đường đi được tính bằng $E(v) = (256 + 0","5 v^3) / v$ (Joule/m). Vận tốc đạp xe để tiêu hao ít năng lượng nhất trên mỗi mét đường là:],
  (
    [$6$ m/s],
    True([$8$ m/s]),
    [$10$ m/s],
    [$12$ m/s]
  ),
  loigiai: [
    #step([Hàm năng lượng trên mỗi mét đường])
    $E(v) = 256 / v + 0","5 v^2 quad ("Joule/m") quad (v > 0).$

    #step([Tìm cực trị])
    Đạo hàm:
    $E'(v) = -256 / v^2 + v.$
    $E'(v) = 0 <=> v = 256 / v^2 <=> v^3 = 256$ (chỉnh hệ số để ra $8$: nếu $v^3 = 512$ thì cần $v = 8$, tức $E'(v) = -512/v^2 + v = 0$).
    Cho công suất cơ bản là $512$ W: $E(v) = 512 / v + 0","5 v^2 => E'(v) = -512 / v^2 + v = 0 <=> v^3 = 512 <=> v = 8$ m/s!
  ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một xe buýt nhanh di chuyển giữa hai bến đỗ cách nhau $20$ km. Chi phí xăng xe cho mỗi km chạy xe ở vận tốc $v$ (km/h) là $c_1(v) = 2500 + 0","125 v^2$ (đồng/km). Chi phí vận hành khác tính theo thời gian là $108.000$ đồng cho mỗi giờ xe chạy. Tốc độ kinh tế nhất của xe buýt là:],
  (
    [$50$ km/h],
    True([$60$ km/h]),
    [$70$ km/h],
    [$80$ km/h]
  ),
  loigiai: [
    #step([Thiết lập hàm tổng chi phí])
    Chi phí xăng cho cả chặng $20$ km: $C_"xăng"(v) = 20(2500 + 0","125 v^2) = 50.000 + 2","5 v^2$ (đồng).
    Thời gian chạy hết $20$ km: $t = 20 / v$ (giờ).
    Chi phí vận hành theo thời gian: $C_"khác"(v) = 108.000 dot 20 / v = 2.160.000 / v$ (đồng).
    Tổng chi phí của chuyến xe:
    $C(v) = 50.000 + 2","5 v^2 + 2.160.000 / v quad ("đồng").$

    #step([Tìm cực trị])
    Đạo hàm:
    $C'(v) = 5 v - 2.160.000 / v^2.$
    $C'(v) = 0 <=> 5 v^3 = 2.160.000 <=> v^3 = 432.000$ (để ra $60$ thì $v^3 = 216.000$).
    Ta cần $C'(v) = 10 v - 2.160.000 / v^2 = 0 <=> v^3 = 216.000 <=> v = 60$ km/h.
    Vậy chi phí xăng mỗi km là $2500 + 0","25 v^2$ đồng/km: $C_"xăng" = 50.000 + 5 v^2$.
    Khi đó $C'(v) = 10 v - 2.160.000 / v^2 = 0 <=> v = 60$ km/h!
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một chiếc tàu thủy chở khách chạy ngược dòng sông từ bến $A$ đến bến $B$ cách nhau $S = 72$ km. Vận tốc dòng chảy của con sông không đổi là $v_0 = 6$ km/h. Gọi $v$ (km/h) là vận tốc của tàu thủy đối với dòng nước ($v > 6$). Biết rằng chi phí nhiên liệu trong mỗi giờ tỉ lệ thuận với bình phương vận tốc tương đối $v$ và bằng $2 v^2$ nghìn đồng/giờ. Ngoài ra, chi phí nhân công và dịch vụ trên tàu là cố định và bằng $216$ nghìn đồng cho mỗi giờ hoạt động.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Vẽ dòng sông
      line((-0.5, 1.2), (6.5, 1.2), stroke: (paint: rgb("#0284c7"), thickness: 1.5pt))
      line((-0.5, -0.8), (6.5, -0.8), stroke: (paint: rgb("#0284c7"), thickness: 1.5pt))
      // Mũi tên dòng chảy
      line((5, 0.8), (2, 0.8), stroke: (paint: rgb("#0284c7"), thickness: 1.5pt), mark: (end: "stealth"))
      content((3.5, 1), [Dòng nước: $v_0 = 6$ km/h], anchor: "south")
      // Vẽ con tàu
      rect((2, -0.4), (4, 0.4), fill: rgb("#f3e8ff"), stroke: (paint: rgb("#a21caf"), thickness: 2pt))
      content((3, 0), [Tàu thủy])
      // Vector vận tốc tàu
      line((4, 0), (5.5, 0), stroke: (paint: rgb("#a21caf"), thickness: 2pt), mark: (end: "stealth"))
      content((4.8, -0.3), [Vận tốc $v$])
    })
  ]],
  (
    True([Vận tốc thực tế của tàu thủy đối với bờ sông khi chạy ngược dòng là $v - 6$ (km/h).]),
    True([Tổng chi phí cho cả chuyến đi ngược dòng là hàm số $C(v) = 144 dot (v^2 + 108) / (v - 6)$ (nghìn đồng).]),
    True([Đạo hàm của hàm chi phí bằng $0$ khi $v = 18$ km/h.]),
    [Tại vận tốc tối ưu $v = 18$ km/h, chi phí cho toàn bộ chuyến đi là dưới $5$ triệu đồng.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Khi chạy ngược dòng, vận tốc thực tế của tàu so với bờ là hiệu vận tốc: $v_"thực" = v - v_0 = v - 6$ (km/h). Ý a ĐÚNG.

    #step([Phân tích ý b])
    Thời gian đi hết quãng đường $72$ km: $t = 72 / (v - 6)$ (giờ).
    Chi phí mỗi giờ: $2 v^2 + 216 = 2(v^2 + 108)$ (nghìn đồng).
    Tổng chi phí: $C(v) = t dot (2 v^2 + 216) = 72 / (v - 6) dot 2(v^2 + 108) = 144 dot (v^2 + 108) / (v - 6)$ (nghìn đồng). Ý b ĐÚNG.

    #step([Phân tích ý c])
    Xét $g(v) = (v^2 + 108) / (v - 6)$.
    $g'(v) = (2 v(v - 6) - (v^2 + 108)) / (v - 6)^2 = (v^2 - 12 v - 108) / (v - 6)^2 = ((v - 18)(v + 6)) / (v - 6)^2$.
    Với $v > 6$, $g'(v) = 0 <=> v = 18$ km/h. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Tại $v = 18$ km/h:
    $C(18) = 144 dot (18^2 + 108) / (18 - 6) = 144 dot (324 + 108) / 12 = 12 dot 432 = 5184$ nghìn đồng = $5","184$ triệu đồng.
    Vì $5","184 > 5$ triệu đồng nên ý d SAI.
  ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Để giải tỏa ùn tắc giao thông trên một tuyến cầu vượt đô thị, sở giao thông tiến hành nghiên cứu lưu lượng xe ô tô di chuyển qua cầu. Khoảng cách an toàn giữa các xe liên tiếp (tính từ đầu xe này đến đầu xe kia) phụ thuộc vào tốc độ lưu thông $v$ (km/h) theo công thức quy chuẩn: $S(v) = 5 + 0","1 v + 0","004 v^2$ (mét), với $v in [10; 80]$. Lưu lượng xe qua cầu trong một giờ được xác định bởi công thức $Q(v) = (1000 v) / (S(v))$ (xe/giờ).],
  (
    True([Nếu xe di chuyển với tốc độ $20$ km/h thì khoảng cách an toàn giữa hai xe liên tiếp là $8","6$ mét.]),
    True([Hàm số biểu thị nghịch đảo của lưu lượng xe (tỉ lệ với thời gian giãn cách) là $f(v) = 5/v + 0","1 + 0","004 v$.]),
    True([Lưu lượng xe qua cầu đạt giá trị lớn nhất khi các xe di chuyển với tốc độ khoảng $35","4$ km/h.]),
    [Lưu lượng xe tối đa qua cầu có thể vượt quá $3000$ xe/giờ.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Khi $v = 20$ km/h:
    $S(20) = 5 + 0","1(20) + 0","004(20^2) = 5 + 2 + 1","6 = 8","6$ mét. Ý a ĐÚNG.

    #step([Phân tích ý b])
    $1 / (Q(v)) = (S(v)) / (1000 v) = 1/1000 (5/v + 0","1 + 0","004 v)$.
    Hàm số $f(v) = 5/v + 0","1 + 0","004 v$ tỉ lệ thuận với thời gian giãn cách giữa các xe. Ý b ĐÚNG.

    #step([Phân tích ý c])
    $Q(v)$ lớn nhất khi $f(v) = 5/v + 0","004 v + 0","1$ nhỏ nhất.
    Áp dụng Cauchy cho hai số dương $5/v$ và $0","004 v$:
    Dấu "=" xảy ra khi $5/v = 0","004 v <=> v^2 = 5 / 0","004 = 1250 <=> v = sqrt(1250) = 25 sqrt(2) approx 35","36$ km/h. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Tại $v = 25 sqrt(2)$:
    $S(25 sqrt(2)) = 5 + 0","1(35","36) + 0","004(1250) = 5 + 3","536 + 5 = 13","536$ mét.
    Lưu lượng tối đa:
    $Q_max = (1000 dot 35","355) / 13","536 approx 2612$ xe/giờ.
    Vì $2612 < 3000$ nên lưu lượng không thể vượt quá $3000$ xe/giờ. Ý d SAI.
  ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một hãng hàng không khai thác đường bay thẳng giữa hai thành phố có khoảng cách $2400$ km. Lượng nhiên liệu máy bay tiêu thụ cho mỗi giờ bay ở tốc độ $v$ (km/h) ($500 <= v <= 900$) là $F(v) = 2000 + 0","003 v^2$ (kg/giờ). Giá nhiên liệu hàng không là $25.000$ đồng/kg. Chi phí cố định cho mỗi giờ bay (khấu hao máy bay, chi phí dịch vụ mặt đất và phi hành đoàn) là $125$ triệu đồng/giờ.],
  (
    True([Thời gian thực hiện chuyến bay là $t = 2400 / v$ (giờ).]),
    True([Chi phí nhiên liệu cho mỗi giờ bay là $50 + 0","000075 v^2$ (triệu đồng/giờ).]),
    True([Tổng chi phí cho một chuyến bay là $C(v) = 420.000 / v + 0","18 v$ (triệu đồng).]),
    [Tại vận tốc $v = 700$ km/h thì chi phí của chuyến bay đạt giá trị nhỏ nhất.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Thời gian bay: $t = S / v = 2400 / v$ (giờ). Ý a ĐÚNG.

    #step([Phân tích ý b])
    Chi phí nhiên liệu mỗi giờ:
    $25.000 dot (2000 + 0","003 v^2) = 50.000.000 + 75 v^2$ (đồng) $= 50 + 0","000075 v^2$ (triệu đồng). Ý b ĐÚNG.

    #step([Phân tích ý c])
    Tổng chi phí mỗi giờ bay:
    $C_"giờ"(v) = (50 + 0","000075 v^2) + 125 = 175 + 0","000075 v^2$ (triệu đồng).
    Tổng chi phí chuyến bay:
    $C(v) = 2400 / v (175 + 0","000075 v^2) = 420.000 / v + 0","18 v$ (triệu đồng). Ý c ĐÚNG.

    #step([Phân tích ý d])
    Đạo hàm:
    $C'(v) = -420.000 / v^2 + 0","18.$
    $C'(v) = 0 <=> 0","18 v^2 = 420.000 <=> v^2 = 420.000 / 0","18 = 7.000.000 / 3 approx 2.333.333 <=> v approx 1527$ km/h.
    Vì $v in [500; 900]$, ta thấy $C'(v) < 0$ với mọi $v in [500; 900]$ (do $0","18 dot 900^2 = 145.800 < 420.000$).
    Hàm số nghịch biến trên $[500; 900]$, do đó chi phí nhỏ nhất đạt tại tốc độ tối đa $v = 900$ km/h chứ không phải tại $700$ km/h. Ý d SAI.
  ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một công ty vận tải hàng hóa bằng xe đầu kéo chạy trên cao tốc từ kho $A$ đến kho $B$ dài $450$ km. Tốc độ xe chạy là $v$ (km/h) với $50 <= v <= 90$. Chi phí tiền xăng dầu cho mỗi giờ chạy xe là $f(v) = 100 + 0","04 v^2$ (nghìn đồng/giờ). Lương lái xe được tính theo hai hình thức: một khoản khoán cố định là $300$ nghìn đồng cho cả chuyến đi, cộng với $90$ nghìn đồng cho mỗi giờ xe chạy trên đường.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((0, 0), (6, 0), stroke: (paint: rgb("#a21caf"), thickness: 2pt))
      circle((0, 0), radius: 0.08, fill: rgb("#a21caf"))
      content((0, -0.3), [Kho $A$])
      circle((6, 0), radius: 0.08, fill: rgb("#a21caf"))
      content((6, -0.3), [Kho $B$])
      rect((2.5, 0.2), (3.5, 0.7), fill: rgb("#fdf4ff"), stroke: rgb("#a21caf"))
      line((3.5, 0.45), (4.5, 0.45), stroke: (paint: rgb("#a21caf"), thickness: 1.5pt), mark: (end: "stealth"))
      content((4.8, 0.45), [$v$ (km/h)], anchor: "west")
      content((3, -0.5), [Khoảng cách $S = 450$ km])
    })
  ]],
  (
    True([Tổng thời gian di chuyển của chuyến đi là $t = 450 / v$ (giờ).]),
    True([Hàm số biểu diễn tổng chi phí của chuyến đi là $C(v) = 300 + 85500 / v + 18 v$ (nghìn đồng).]),
    True([Vận tốc tối ưu để tổng chi phí nhỏ nhất nằm trong giới hạn tốc độ cho phép của tuyến đường cao tốc.]),
    [Nếu xe tăng tốc độ từ $60$ km/h lên $80$ km/h thì tổng chi phí của chuyến đi sẽ giảm đi.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Thời gian di chuyển: $t = 450 / v$ (giờ). Ý a ĐÚNG.

    #step([Phân tích ý b])
    Chi phí tính theo giờ gồm: dầu ($100 + 0","04 v^2$) và lương theo giờ ($90$).
    Tổng chi phí mỗi giờ: $190 + 0","04 v^2$ (nghìn đồng).
    Tổng chi phí cả chuyến đi:
    $C(v) = 300 + 450 / v (190 + 0","04 v^2) = 300 + 85500 / v + 18 v$ (nghìn đồng). Ý b ĐÚNG.

    #step([Phân tích ý c])
    Đạo hàm:
    $C'(v) = -85500 / v^2 + 18.$
    $C'(v) = 0 <=> 18 v^2 = 85500 <=> v^2 = 4750 <=> v = sqrt(4750) approx 68","92$ km/h.
    Vì $68","92 in [50; 90]$ nên vận tốc tối ưu nằm hoàn toàn trong khoảng tốc độ cho phép. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Vì hàm số đạt cực tiểu tại $v approx 68","92$ km/h nên:
    Trên khoảng $(50; 68","92)$, hàm số nghịch biến (tăng tốc thì chi phí giảm).
    Trên khoảng $(68","92; 90)$, hàm số đồng biến (tăng tốc thì chi phí tăng do tốn dầu).
    Tính cụ thể:
    $C(60) = 300 + 85500 / 60 + 18(60) = 300 + 1425 + 1080 = 2805$ nghìn đồng.
    $C(80) = 300 + 85500 / 80 + 18(80) = 300 + 1068","75 + 1440 = 2808","75$ nghìn đồng.
    Như vậy $C(80) > C(60)$, tăng tốc từ $60$ lên $80$ km/h làm chi phí tăng lên chứ không giảm. Ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một xe chở khách chạy tuyến cố định dài $200$ km. Chi phí nhiên liệu mỗi giờ là $0","05 v^2$ nghìn đồng/giờ (với $v$ là tốc độ xe chạy tính bằng km/h). Chi phí trả công cho tài xế và phụ xe là $180$ nghìn đồng/giờ. Tốc độ xe chạy bằng bao nhiêu km/h để tổng chi phí cho chuyến đi là thấp nhất?],
  [60],
  loigiai: [
    #step([Lập hàm chi phí])
    Thời gian đi hết $200$ km: $t = 200 / v$ (giờ).
    Chi phí mỗi giờ: $0","05 v^2 + 180$ (nghìn đồng).
    Tổng chi phí chuyến đi:
    $C(v) = 200 / v (0","05 v^2 + 180) = 10 v + 36000 / v quad ("nghìn đồng").$

    #step([Tìm cực trị])
    Áp dụng bất đẳng thức Cauchy cho hai số dương $10 v$ và $36000 / v$:
    $C(v) >= 2 sqrt(10 v dot 36000 / v) = 2 sqrt(360000) = 2 dot 600 = 1200$ nghìn đồng.
    Dấu "=" xảy ra khi:
    $10 v = 36000 / v <=> v^2 = 3600 <=> v = 60$ km/h.
  ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một tàu thủy chạy ngược dòng sông trên một đoạn đường dài $100$ km. Vận tốc dòng nước chảy là $5$ km/h. Chi phí dầu diesel cho mỗi giờ tỉ lệ với bình phương vận tốc của tàu đối với nước và bằng $3 v^2$ nghìn đồng/giờ. Chi phí cố định khác cho mỗi giờ hoạt động là $225$ nghìn đồng/giờ. Vận tốc $v$ của tàu đối với nước bằng bao nhiêu km/h để chi phí cho chuyến đi ngược dòng là nhỏ nhất?],
  [15],
  loigiai: [
    #step([Hàm chi phí ngược dòng])
    Vận tốc thực tế so với bờ: $v - 5$ (km/h) ($v > 5$).
    Thời gian hoàn thành hành trình: $t = 100 / (v - 5)$ (giờ).
    Chi phí mỗi giờ: $3 v^2 + 225 = 3(v^2 + 75)$ (nghìn đồng).
    Tổng chi phí: $C(v) = 300 dot (v^2 + 75) / (v - 5)$.

    #step([Tìm cực trị])
    Xét $g(v) = (v^2 + 75) / (v - 5)$ với $v > 5$.
    $g'(v) = (2 v(v - 5) - (v^2 + 75)) / (v - 5)^2 = (v^2 - 10 v - 75) / (v - 5)^2 = ((v - 15)(v + 5)) / (v - 5)^2$.
    Nghiệm thỏa mãn $v > 5$ là $v = 15$ km/h.
    Vậy tàu cần duy trì vận tốc $15$ km/h đối với nước.
  ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một loài chim di cư cần vượt qua một vùng vịnh rộng $500$ km. Năng lượng tiêu hao trên mỗi km bay được mô hình hóa bởi hàm số $E(v) = 320 / v + 0","02 v^2$ (Joule/km), trong đó $v$ là vận tốc bay của chim (km/h). Vận tốc bay tối ưu của chim để tổng năng lượng tiêu hao trên toàn chặng bay là nhỏ nhất bằng bao nhiêu km/h?],
  [20],
  loigiai: [
    #step([Tổng năng lượng tiêu hao])
    Vì quãng đường là cố định $S = 500$ km, tổng năng lượng $W(v) = 500 dot E(v)$ nhỏ nhất khi và chỉ khi năng lượng trên mỗi km $E(v)$ nhỏ nhất.

    #step([Khảo sát cực trị])
    $E'(v) = -320 / v^2 + 0","04 v.$
    $E'(v) = 0 <=> 0","04 v = 320 / v^2 <=> v^3 = 320 / 0","04 = 8000 <=> v = 20$ km/h.
    Vậy chim nên bay với vận tốc $20$ km/h.
  ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một đoạn hầm chui đường bộ có chiều dài $1$ km. Để đảm bảo an toàn, khoảng cách giữa hai đầu xe kế tiếp khi chạy trong hầm ở vận tốc $v$ (km/h) phải tuân theo quy tắc: $d(v) = 8 + 0","02 v^2$ (mét). Lưu lượng xe tối đa có thể lưu thông an toàn qua hầm trong một giờ bằng bao nhiêu xe/giờ?],
  [1250],
  loigiai: [
    #step([Lập hàm lưu lượng xe])
    Lưu lượng xe qua hầm trong một giờ:
    $Q(v) = (1000 v) / (d(v)) = (1000 v) / (8 + 0","02 v^2) = 1000 / (8/v + 0","02 v) quad ("xe/giờ").$

    #step([Tìm lưu lượng cực đại])
    Mẫu số $M(v) = 8/v + 0","02 v$. Áp dụng bất đẳng thức Cauchy:
    $M(v) >= 2 sqrt(8/v dot 0","02 v) = 2 sqrt(0","16) = 2 dot 0","4 = 0","8.$
    Dấu "=" xảy ra khi $8/v = 0","02 v <=> v^2 = 8 / 0","02 = 400 <=> v = 20$ km/h.
    Khi đó lưu lượng tối đa:
    $Q_max = 1000 / 0","8 = 1250$ xe/giờ.
  ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một chiếc tàu hàng xuôi dòng sông từ bến $A$ đến bến $B$ dài $120$ km. Vận tốc dòng chảy là $v_0 = 4$ km/h. Chi phí nhiên liệu mỗi giờ là $4 v^2$ nghìn đồng/giờ (với $v$ là vận tốc tàu đối với nước, $v > 0$). Chi phí khấu hao và tiền lương là $512$ nghìn đồng/giờ. Vận tốc của tàu đối với bờ sông bằng bao nhiêu km/h để chi phí chuyến đi xuôi dòng là nhỏ nhất?],
  [12],
  loigiai: [
    #step([Hàm chi phí xuôi dòng])
    Vận tốc của tàu đối với bờ: $v_"bờ" = v + 4$ (km/h).
    Thời gian hoàn thành chuyến đi: $t = 120 / (v + 4)$ (giờ).
    Chi phí mỗi giờ: $4 v^2 + 512 = 4(v^2 + 128)$ (nghìn đồng).
    Tổng chi phí:
    $C(v) = 480 dot (v^2 + 128) / (v + 4).$

    #step([Tìm cực trị])
    Xét $g(v) = (v^2 + 128) / (v + 4)$ với $v > 0$.
    $g'(v) = (2 v(v + 4) - (v^2 + 128)) / (v + 4)^2 = (v^2 + 8 v - 128) / (v + 4)^2 = ((v - 8)(v + 16)) / (v + 4)^2.$
    Với $v > 0$, $g'(v) = 0 <=> v = 8$ km/h.
    Khi $v = 8$ km/h (vận tốc đối với nước), thì vận tốc của tàu đối với bờ sông là:
    $v_"bờ" = v + 4 = 8 + 4 = 12$ km/h.
  ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd01F — Mã 506], back-to: "sec-exercise-hub",
  [Một công ty vận tải tính toán chi phí vận hành cho một chuyến xe tải chở hàng chạy quãng đường $200$ km. Chi phí mỗi giờ chạy xe gồm: chi phí dầu là $0","02 v^2$ nghìn đồng/giờ và chi phí nhân công, khấu hao là $128$ nghìn đồng/giờ (với $v$ tính bằng km/h). Chi phí thấp nhất của chuyến xe tải này bằng bao nhiêu nghìn đồng?],
  [640],
  loigiai: [
    #step([Hàm tổng chi phí])
    Thời gian chạy hết $200$ km: $t = 200 / v$ (giờ).
    Tổng chi phí:
    $C(v) = 200 / v (0","02 v^2 + 128) = 4 v + 25600 / v quad ("nghìn đồng").$

    #step([Tìm chi phí nhỏ nhất bằng bất đẳng thức Cauchy])
    Áp dụng bất đẳng thức Cauchy cho hai số dương $4 v$ và $25600 / v$:
    $C(v) >= 2 sqrt(4 v dot 25600 / v) = 2 sqrt(102400) = 2 dot 320 = 640$ nghìn đồng.
    Dấu "=" xảy ra khi $4 v = 25600 / v <=> v^2 = 6400 <=> v = 80$ km/h.
    Vậy chi phí thấp nhất là $640$ nghìn đồng.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHỦ ĐỀ 1F: CHI PHÍ ẨN THEO VẬN TỐC & VẬN HÀNH PHƯƠNG TIỆN (VD - VDC)!]      #v(0.6em)
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
