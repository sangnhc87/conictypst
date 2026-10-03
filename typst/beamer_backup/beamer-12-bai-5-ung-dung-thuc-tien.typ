#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 5: ỨNG DỤNG ĐẠO HÀM ĐỂ GIẢI QUYẾT BÀI TOÁN THỰC TIỄN
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)


#show: lecture-theme.with(
  title:       "Bài 5: Ứng dụng đạo hàm giải quyết bài toán thực tiễn",
  subtitle:    "TOÁN 12 — Chương I: Ứng dụng của đạo hàm",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

// ════════════════════════════════════════════════

#lt-section-link("sec-fae86d", "🏛️", [Động Lực Học Tập])
#lt-slide-back(title: "Bài Toán Tối Ưu Hóa Trong Thực Tế")[
  #lt-two-col(ratio: (55%, 45%))[
    *Tại sao chúng ta phải học Giới hạn & Đạo hàm?*
    Trong thực tế đời sống và kinh doanh, con người luôn muốn tìm kiếm sự "hoàn hảo" nhất:
    - *Chi phí thấp nhất* nhưng *lợi nhuận cao nhất*.
    - *Vật liệu ít nhất* nhưng *thể tích chứa lớn nhất*.
    
    *Ví dụ thực tế*
    - Các hãng nước giải khát tính toán kích thước lon nhôm (hình trụ) sao cho với thể tích $330 "ml"$, diện tích vỏ lon là *nhỏ nhất* để tiết kiệm hàng triệu đô la tiền nhôm.
    - Công cụ duy nhất có thể giải quyết chính xác bài toán này chính là *Đạo hàm (Derivative)*!
  ][
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // Draw a soda can (cylinder)
        let cx = 0
        let cy = 0
        let r = 1.2
        let h = 3.5
        
        // Top ellipse
        circle((cx, cy + h), radius: (r, 0.4), stroke: 1.5pt + blue, fill: rgb("#e0e0e0"))
        
        // Body lines
        line((cx - r, cy), (cx - r, cy + h), stroke: 1.5pt + blue)
        line((cx + r, cy), (cx + r, cy + h), stroke: 1.5pt + blue)
        
        // Bottom ellipse (front half solid, back half dashed)
        arc((cx + r, cy), start: 0deg, stop: 180deg, radius: (r, 0.4), stroke: 1.5pt + blue)
        arc((cx - r, cy), start: 180deg, stop: 360deg, radius: (r, 0.4), stroke: (paint: blue, thickness: 1.5pt, dash: "dashed"))
        
        // Labels
        line((cx, cy), (cx + r, cy), stroke: 1pt + red)
        content((cx + r/2, cy + 0.3), text(fill: red)[$R$])
        
        line((cx + r + 0.5, cy), (cx + r + 0.5, cy + h), mark: (start: ">", end: ">", fill: red), stroke: 1pt + red)
        content((cx + r + 0.8, cy + h/2), text(fill: red)[$h$])
      })
    ]
  ]
]

#lt-section-link("sec-7ff265", "📖", [Phương Pháp Giải Toán])
#lt-slide-back(title: "Các Bước Giải Bài Toán Tối Ưu Tực Tế")[
  Để giải một bài toán ứng dụng GTLN, GTNN vào thực tế, ta thực hiện các bước sau:
  
  #step[Bước 1: Mô hình hóa toán học]
  - Chọn đại lượng cần tìm là biến số $x$.
  - Biểu diễn các đại lượng liên quan theo $x$.
  - Lập hàm số $y = f(x)$ biểu diễn đại lượng cần tối ưu.
  - Tìm tập xác định (miền giá trị thực tế) của biến $x$, thường là $x in [a; b]$ hoặc $x in (a; b)$.
  
  #step[Bước 2: Tìm GTLN, GTNN bằng đạo hàm]
  - Tính đạo hàm $f'(x)$.
  - Tìm các điểm tới hạn (nghiệm của $f'(x) = 0$).
  - Lập Bảng biến thiên (hoặc tính giá trị tại 2 đầu mút) để tìm GTLN, GTNN của $f(x)$ trên tập xác định.
  
  #step[Bước 3: Kết luận]
  - Đối chiếu với điều kiện bài toán để trả lời.
]

#lt-section-link("sec-cc53dc", "❓", [Luyện Tập Trắc Nghiệm])
// BÀI TẬP TRẮC NGHIỆM

#let draw-ellipse(cx, cy, rx, ry, stroke: 1pt, style: "solid") = {
  let stroke-val = stroke
  import draw: *
  if style == "dashed" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  } else if style == "dashed-back" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  } else {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: stroke-val)
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  }
}

#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd

// ==================== Đề 1 ====================
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Một vật chuyển động theo phương trình $s(t) = t^3 - 6t^2 + 9t + 2$ (m), với $t$ tính bằng giây, $t >= 0$. Vận tốc tức thời của vật tại thời điểm $t = 2$ giây là:],
  (
    [$3$ m/s],
    True([$-3$ m/s]),
    [$0$ m/s],
    [$6$ m/s]
  ),
  loigiai: []
)

// ─── CÂU 2 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Quãng đường $s$ (m) của một vật theo thời gian $t$ (giây) là $s(t) = 2t^3 - 3t^2 + 1$. Gia tốc của vật tại thời điểm $t = 1$ giây bằng:],
  (
    [$12$ m/s²],
    [$0$ m/s²],
    True([$6$ m/s²]),
    [$-6$ m/s²]
  ),
  loigiai: []
)

// ─── CÂU 3 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Dân số của một thành phố sau $t$ năm (kể từ năm 2000) được mô hình hóa bởi $P(t) = 500 + 20t - t^2$ (nghìn người). Tốc độ tăng dân số tức thời vào năm 2005 là:],
  (
    True([$10$ nghìn người/năm]),
    [$20$ nghìn người/năm],
    [$0$ nghìn người/năm],
    [$-10$ nghìn người/năm]
  ),
  loigiai: []
)

// ─── CÂU 4 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Tổng chi phí sản xuất $x$ sản phẩm của một xưởng là $C(x) = x^3 - 15x^2 + 80x + 200$ (nghìn đồng). Chi phí cận biên tại sản lượng $x = 5$ sản phẩm là:],
  (
    [$30$ nghìn đồng],
    [$-30$ nghìn đồng],
    True([$5$ nghìn đồng]),
    [$80$ nghìn đồng]
  ),
  loigiai: []
)

// ─── CÂU 5 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Một quả bóng ném thẳng đứng lên có độ cao $h(t) = -4.9t^2 + 20t + 1.5$ (mét) sau $t$ giây. Thời điểm quả bóng đạt độ cao lớn nhất xấp xỉ:],
  (
    [$t = 2$ giây],
    True([$t approx 2.04$ giây]),
    [$t = 4$ giây],
    [$t = 1$ giây]
  ),
  loigiai: []
)

// ─── CÂU 6 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Hàm lợi nhuận của một doanh nghiệp là $P(x) = -2x^2 + 40x - 80$ (triệu đồng), với $x$ là số lượng sản phẩm (trăm chiếc). Sản lượng tại đó lợi nhuận đạt cực đại là:],
  (
    [$x = 5$],
    True([$x = 10$]),
    [$x = 20$],
    [$x = 40$]
  ),
  loigiai: []
)

// ─── CÂU 7 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Năng suất lao động (sản phẩm/giờ) của một công nhân trong ca $t$ giờ được mô tả bởi $N(t) = -t^3 + 9t^2 - 15t + 8$ với $0 <= t <= 8$. Năng suất đạt cực đại vào giờ thứ:],
  (
    [$t = 1$],
    True([$t = 5$]),
    [$t = 3$],
    [$t = 8$]
  ),
  loigiai: []
)

// ─── CÂU 8 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Hàm lượng thuốc $C(t) = (4t)/(t^2 + 4)$ (mg/L) trong máu bệnh nhân sau $t$ giờ tiêm. Nồng độ thuốc đạt cực đại tại:],
  (
    [$t = 4$ giờ],
    True([$t = 2$ giờ]),
    [$t = 1$ giờ],
    [$t = 0$ giờ]
  ),
  loigiai: []
)

// ─── CÂU 9 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Một chiếc tàu chạy dọc con kênh với vị trí $x(t) = t^3 - 4.5t^2 + 3t$ (km). Vận tốc của tàu bằng $0$ lần đầu tiên vào khoảng thời gian:],
  (
    True([$t approx 0.38$ giờ]),
    [$t = 1$ giờ],
    [$t = 3$ giờ],
    [$t = 0$ giờ]
  ),
  loigiai: []
)

// ─── CÂU 10 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Sản lượng lúa của một cánh đồng phụ thuộc vào lượng phân bón $x$ (kg/sào) theo hàm $Y(x) = -0.1x^2 + 8x + 500$ (kg). Lượng phân bón tối ưu để sản lượng lớn nhất là:],
  (
    [$x = 50$ kg/sào],
    True([$x = 40$ kg/sào]),
    [$x = 80$ kg/sào],
    [$x = 20$ kg/sào]
  ),
  loigiai: []
)

// ─── CÂU 11 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Một viên đạn được bắn lên theo phương thẳng đứng với phương trình $h(t) = 40t - 5t^2$ (m). Khoảng thời gian viên đạn ở độ cao lớn hơn $60$ m là:],
  (
    [$2$ giây],
    True([$4$ giây]),
    [$6$ giây],
    [$3$ giây]
  ),
  loigiai: []
)

// ─── CÂU 12 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Một nhà máy có hàm tổng chi phí $C(x) = 0.5x^2 + 40x + 5000$ (nghìn đồng). Chi phí trung bình mỗi sản phẩm nhỏ nhất đạt được khi sản xuất:],
  (
    [$x = 50$ sản phẩm],
    True([$x = 100$ sản phẩm]),
    [$x = 200$ sản phẩm],
    [$x = 40$ sản phẩm]
  ),
  loigiai: []
)

// ─── CÂU 13 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Doanh thu bán hàng $R(t) = -t^3 + 9t^2 - 5$ (triệu đồng/ngày) biến đổi trong ngày $0 <= t <= 12$ giờ. Doanh thu tăng nhanh nhất (tốc độ tăng cực đại) vào lúc:],
  (
    True([$t = 3$ giờ]),
    [$t = 6$ giờ],
    [$t = 9$ giờ],
    [$t = 12$ giờ]
  ),
  loigiai: []
)

// ─── CÂU 14 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Nhiệt độ (°C) của lò nung sau $t$ giờ là $T(t) = -t^3 + 9t^2 + 60$ với $0 <= t <= 8$. Nhiệt độ lò đạt giá trị lớn nhất là:],
  (
    [$120$ °C],
    [$60$ °C],
    True([$168$ °C]),
    [$148$ °C]
  ),
  loigiai: []
)

// ─── CÂU 15 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Lượng hàng hóa (nghìn sản phẩm) sản xuất trong $t$ tháng là $Q(t) = 6t - t^2/2$ với $0 <= t <= 6$. Tốc độ sản xuất đang tăng hay giảm theo thời gian?],
  (
    [Tăng dần vì $Q'(t) > 0$],
    True([Giảm dần vì $Q''(t) < 0$]),
    [Không đổi],
    [Tăng rồi giảm]
  ),
  loigiai: []
)

// ─── CÂU 16 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Vận tốc (m/s) của một xe điện là $v(t) = 3t^2 - 24t + 36$ với $0 <= t <= 10$ giây. Khoảng thời gian xe chuyển động ngược chiều dương là:],
  (
    [$[0; 2]$ giây],
    [$[6; 10]$ giây],
    True([$(2; 6)$ giây]),
    [Xe luôn cùng chiều dương]
  ),
  loigiai: []
)

// ─── CÂU 17 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Một tên lửa có độ cao $h(t) = 100t^2 - 10t^3$ (m), $0 <= t <= 10$. Tên lửa đạt độ cao lớn nhất tại:],
  (
    [$t = 5$ giây],
    True([$t = 20/3$ giây]),
    [$t = 10$ giây],
    [$t = 3$ giây]
  ),
  loigiai: []
)

// ─── CÂU 18 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Khối lượng của vi khuẩn trong đĩa nuôi cấy tăng theo $M(t) = 5 dot 2^t$ (mg), $t$ tính bằng giờ. Biết $ln 2 approx 0.693$. Tốc độ tăng trưởng tức thời tại $t = 3$ giờ xấp xỉ:],
  (
    [$40$ mg/giờ],
    [$20$ mg/giờ],
    True([$27.7$ mg/giờ]),
    [$5 dot 3$ mg/giờ]
  ),
  loigiai: []
)

// ─── CÂU 19 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Một đập nước tích nước với thể tích $V(t) = 3t^2 - t^3/3$ (triệu m³), $0 <= t <= 6$ ngày. Tốc độ tích nước lớn nhất vào ngày thứ:],
  (
    [$t = 6$],
    True([$t = 3$]),
    [$t = 1$],
    [$t = 2$]
  ),
  loigiai: []
)

// ─── CÂU 20 ───
#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Một vật dao động điều hòa theo $x(t) = 5 cos(2t)$ (cm). Vận tốc dao động tại thời điểm $t = pi/4$ giây là:],
  (
    [$5$ cm/s],
    True([$-10$ cm/s]),
    [$10$ cm/s],
    [$0$ cm/s]
  ),
  loigiai: []
)



// ─── CÂU 1 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",
  [Một vật chuyển động theo phương trình $s(t) = t^3 - 9t^2 + 24t - 7$ (m), $t >= 0$ (giây). Khi đó:],
  (
    True([Vận tốc của vật tại thời điểm $t$ là $v(t) = 3t^2 - 18t + 24$ (m/s)]),
    True([Vật dừng lại tại hai thời điểm $t = 2$ giây và $t = 4$ giây]),
    True([Vật chuyển động ngược chiều dương khi $t in (2; 4)$]),
    True([Gia tốc của vật tại $t = 3$ giây bằng $0$ m/s²])
  ),
  loigiai: []
)

// ─── CÂU 2 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",
  [Lợi nhuận (triệu đồng) của một công ty sau $t$ tháng hoạt động là $P(t) = t^3 - 6t^2 + 9t + 2$ với $0 <= t <= 8$. Khi đó:],
  (
    True([Tốc độ thay đổi lợi nhuận bằng $0$ tại $t = 1$ và $t = 3$, đây là các điểm cực trị của $P(t)$]),
    [Lợi nhuận lớn nhất của công ty trên $[0;8]$ đạt được tại $t = 3$],
    True([Trên khoảng $(1; 3)$, lợi nhuận công ty đang giảm]),
    True([Lợi nhuận lớn nhất của công ty trên $[0; 8]$ là $P(8) = 202$ triệu đồng])
  ),
  loigiai: []
)

// ─── CÂU 3 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",
  [Nồng độ thuốc $C(t) = (4t)/(t^2 + 4)$ (mg/L) trong máu bệnh nhân ($t >= 0$ giờ). Khi đó:],
  (
    True([Nồng độ thuốc đạt cực đại tại $t = 2$ giờ]),
    True([Nồng độ thuốc cực đại là $C(2) = 1$ mg/L]),
    True([Khi $t arrow.r +oo$, nồng độ thuốc tiến về $0$ mg/L]),
    [Nồng độ thuốc tăng liên tục theo thời gian $t$]
  ),
  loigiai: []
)

// ─── CÂU 4 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",
  [Giá trị tài sản (triệu đồng) sau $t$ năm là $A(t) = 500 dot 0.8^t$ ($t >= 0$). Biết $ln 0.8 approx -0.223$. Khi đó:],
  (
    True([Tài sản giảm giá theo thời gian vì $A'(t) < 0$]),
    True([Tốc độ mất giá tại $t = 0$ xấp xỉ $111.5$ triệu đồng/năm]),
    [Sau $5$ năm, giá trị tài sản còn $200$ triệu đồng],
    True([Giá trị tài sản không bao giờ về đúng $0$, chỉ tiến về $0$])
  ),
  loigiai: []
)

// ─── CÂU 5 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Năng suất tổng hợp của $n$ công nhân được cho bởi $P(n) = n(100 - n)$ (đơn vị/ngày), $0 < n < 100$. Khi đó:],
  (
    True([Năng suất đạt cực đại khi sử dụng $n = 50$ công nhân]),
    True([Năng suất cực đại đạt được là $2500$ đơn vị/ngày]),
    [Thêm một công nhân vào nhóm $60$ người sẽ làm tăng năng suất tổng hợp],
    True([Đạo hàm $P'(n) = 100 - 2n$ biểu diễn tốc độ thay đổi năng suất khi thêm một công nhân])
  ),
  loigiai: []
)

// ─── CÂU 6 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Một tên lửa có độ cao $h(t) = 100t^2 - 10t^3$ (m), $0 <= t <= 10$ giây. Khi đó:],
  (
    [Vận tốc của tên lửa tại $t = 5$ giây là $750$ m/s],
    [Tên lửa đạt độ cao lớn nhất tại $t = 10$ giây],
    True([Gia tốc của tên lửa bằng $0$ tại $t = 10/3$ giây]),
    True([Trong khoảng $(20/3; 10)$, tên lửa đang chuyển động đi xuống])
  ),
  loigiai: []
)

// ─── CÂU 7 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",
  [Lượng hàng hóa sản xuất trong $t$ tháng là $Q(t) = 6t - t^2/2$ nghìn sản phẩm, $0 <= t <= 6$. Khi đó:],
  (
    True([Tốc độ sản xuất tại tháng thứ $3$ là $3$ nghìn sản phẩm/tháng]),
    True([Tổng sản lượng trong $6$ tháng là $18$ nghìn sản phẩm]),
    [Tốc độ sản xuất tăng dần theo thời gian],
    True([Tháng thứ $6$ là tháng có tốc độ sản xuất bằng $0$])
  ),
  loigiai: []
)

// ─── CÂU 8 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",
  [Một công ty mỏ khai thác dầu thu được $Q(t) = 100 t e^(-0.1 t)$ (tấn) sau $t$ ngày khai thác ($t >= 0$). Khi đó:],
  (
    True([Ngày khai thác có sản lượng cao nhất là ngày thứ $10$]),
    True([Với $t < 10$: sản lượng mỗi ngày đang tăng]),
    True([Khi $t arrow.r +oo$, sản lượng mỗi ngày tiến về $0$]),
    [Sản lượng mỗi ngày tăng liên tục không giới hạn]
  ),
  loigiai: []
)

// ─── CÂU 9 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Một doanh nghiệp sản xuất sản phẩm với hàm chi phí $C(x) = x^3 - 6x^2 + 15x + 10$ (triệu đồng) và bán với giá cố định $27$ triệu đồng/sản phẩm ($x >= 0$ là số lượng sản phẩm). Gọi $P(x)$ là hàm lợi nhuận thu được. Khi đó:],
  (
    True([Hàm lợi nhuận thu được là $P(x) = -x^3 + 6x^2 + 12x - 10$ (triệu đồng)]),
    True([Tốc độ thay đổi lợi nhuận tức thời khi sản xuất $x$ sản phẩm là $P'(x) = -3x^2 + 12x + 12$]),
    True([Doanh nghiệp đạt lợi nhuận lớn nhất khi sản xuất khoảng $4.83$ sản phẩm (tức là $x = 2 + 2 sqrt(2)$)]),
    [Nếu doanh nghiệp sản xuất và bán ra $10$ sản phẩm thì sẽ có lãi]
  ),
  loigiai: [
    Doanh thu từ việc bán $x$ sản phẩm là $R(x) = 27x$.\\
    Lợi nhuận là $P(x) = R(x) - C(x) = 27x - (x^3 - 6x^2 + 15x + 10) = -x^3 + 6x^2 + 12x - 10$.\\
    Đạo hàm $P'(x) = -3x^2 + 12x + 12$.\\
    $P'(x) = 0 <=> -3(x^2 - 4x - 4) = 0 <=> x = 2 + 2 sqrt(2) approx 4.83$ (do $x >= 0$).\\
    Ta có $P''(x) = -6x + 12$. Tại $x = 2 + 2 sqrt(2)$, $P''(x) = -6(2+2 sqrt(2)) + 12 < 0$, do đó hàm số đạt cực đại tại đây.\\
    Tại $x = 10$, $P(10) = -10^3 + 6 dot 10^2 + 12 dot 10 - 10 = -1000 + 600 + 120 - 10 = -290 < 0$ (lỗ), do đó ý d) là Sai.
  ]
)

// ─── CÂU 10 (PHẦN II) ───
#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Độ cao của sóng triều (mét) tại một cảng biển sau $t$ giờ ($0 <= t <= 24$) được mô hình hóa bởi hàm số $h(t) = 4 + 2 sin(pi t / 6 - pi / 3)$. Khi đó:],
  (
    True([Độ cao lớn nhất của sóng triều là $6$ m]),
    True([Độ cao thấp nhất của sóng triều là $2$ m]),
    True([Tốc độ thay đổi độ cao sóng triều tại thời điểm $t$ là $h'(t) = pi/3 cos(pi t / 6 - pi / 3)$ (m/giờ)]),
    [Độ cao của sóng triều đang giảm tại thời điểm $t = 4$ giờ]
  ),
  loigiai: [
    Vì $-1 <= sin(pi t / 6 - pi / 3) <= 1$ nên $2 <= h(t) <= 6$.\\
    Độ cao lớn nhất là $4 + 2 = 6$ m, nhỏ nhất là $4 - 2 = 2$ m.\\
    Đạo hàm $h'(t) = 2 dot pi/6 cos(pi t / 6 - pi / 3) = pi/3 cos(pi t / 6 - pi / 3)$.\\
    Tại $t = 4$, $h'(4) = pi/3 cos(4 pi / 6 - pi / 3) = pi/3 cos(pi / 3) = pi / 6 > 0$, do đó độ cao đang tăng (ý d) là Sai).
  ]
)



// ─── CÂU 1 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Một vật chuyển động theo phương trình $s(t) = 2t^3 - 9t^2 + 12t$ (m), $t >= 0$ (giây). Tổng quãng đường vật đi được trong $3$ giây đầu là bao nhiêu mét?],
  [$11$ m],
  loigiai: [
    $v(t) = s'(t) = 6t^2 - 18t + 12 = 6(t-1)(t-2)$. Vật dừng tại $t = 1$ và $t = 2$.

    $s(0) = 0$, $s(1) = 5$, $s(2) = 4$, $s(3) = 9$.

    Tổng quãng đường: $|s(1) - s(0)| + |s(2) - s(1)| + |s(3) - s(2)| = 5 + 1 + 5 = 11$ m.
  ]
)

// ─── CÂU 2 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Hàm doanh thu của một cửa hàng là $R(x) = 200x - x^2$ (nghìn đồng), $x$ là số sản phẩm bán ra. Doanh thu cận biên bằng $80$ nghìn đồng khi bán bao nhiêu sản phẩm?],
  [$60$ sản phẩm],
  loigiai: [
    $R'(x) = 200 - 2x$.
    $ 200 - 2x = 80 => x = 60 $
  ]
)

// ─── CÂU 3 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Quãng đường của một xe (km) theo thời gian $t$ (giờ) là $s(t) = t^3 - 3t + 4$, $t >= 0$. Vận tốc tức thời của xe bằng $0$ lần đầu tiên vào thời điểm $t$ bằng bao nhiêu giờ?],
  [$1$ giờ],
  loigiai: [
    $v(t) = 3t^2 - 3 = 3(t-1)(t+1) = 0$ khi $t = 1$ (do $t >= 0$).
  ]
)

// ─── CÂU 4 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Lợi nhuận của một doanh nghiệp là $P(x) = -x^3 + 12x^2 - 36x + 48$ (triệu đồng), $0 <= x <= 10$. Lợi nhuận lớn nhất mà doanh nghiệp có thể đạt được bằng bao nhiêu triệu đồng?],
  [$48$ triệu đồng],
  loigiai: [
    $P'(x) = -3(x-2)(x-6)$. $P'(x) = 0$ khi $x = 2$ hoặc $x = 6$.

    So sánh: $P(0) = 48$, $P(2) = 16$, $P(6) = 48$, $P(10) = -112$.

    Lợi nhuận lớn nhất là *48* triệu đồng.
  ]
)

// ─── CÂU 5 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Nhiệt độ của lò nung (°C) sau $t$ giờ là $T(t) = -t^3 + 9t^2 + 60$ với $0 <= t <= 8$. Nhiệt độ lò nung đạt giá trị lớn nhất bằng bao nhiêu °C?],
  [$168$ °C],
  loigiai: [
    $T'(t) = -3t(t - 6) = 0$ khi $t = 0$ hoặc $t = 6$.

    $T(0) = 60$, $T(6) = -216 + 324 + 60 = 168$, $T(8) = -512 + 576 + 60 = 124$.

    Nhiệt độ lớn nhất là *168* °C.
  ]
)

// ─── CÂU 6 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Vận tốc (m/s) của một xe điện là $v(t) = 3t^2 - 24t + 36$, $0 <= t <= 10$ giây. Khoảng thời gian (giây) mà xe chuyển động ngược chiều dương là bao nhiêu giây?],
  [$4$ giây],
  loigiai: [
    $v(t) = 3(t-2)(t-6) < 0$ khi $2 < t < 6$.

    Khoảng thời gian: $6 - 2 = 4$ giây.
  ]
)

// ─── CÂU 7 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Một công ty mỏ khai thác dầu thu được sản lượng mỗi ngày là $Q(t) = 100t e^(-0.1t)$ (tấn), $t >= 0$. Ngày khai thác có sản lượng cao nhất là ngày thứ mấy?],
  [$10$],
  loigiai: [
    $Q'(t) = 100 e^(-0.1t)(1 - 0.1t) = 0 => t = 10$.

    Với $t < 10$: $Q' > 0$ (tăng); với $t > 10$: $Q' < 0$ (giảm). Vậy sản lượng cao nhất vào ngày thứ *10*.
  ]
)

// ─── CÂU 8 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Một người thả hòn đá từ trên cầu. Độ cao (m) của hòn đá so với mặt nước sau $t$ giây là $h(t) = 45 - 5t^2$. Hòn đá chạm mặt nước với vận tốc bao nhiêu m/s?],
  [$30$ m/s],
  loigiai: [
    Hòn đá chạm nước khi $h(t) = 0$: $45 - 5t^2 = 0 => t = 3$ giây.

    $v(t) = h'(t) = -10t$. Vận tốc chạm nước: $|v(3)| = 30$ m/s.
  ]
)

// ─── CÂU 9 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Chi phí trung bình mỗi sản phẩm khi sản xuất $x$ sản phẩm là $A C(x) = 0.5x + 40 + 5000/x$ (nghìn đồng). Chi phí trung bình nhỏ nhất đạt được bằng bao nhiêu nghìn đồng?],
  [$140$ nghìn đồng],
  loigiai: [
    $A C'(x) = 0.5 - 5000/x^2 = 0 => x^2 = 10000 => x = 100$.

    $A C(100) = 50 + 40 + 50 = 140$ nghìn đồng.
  ]
)

// ─── CÂU 10 (PHẦN III) ───
#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Lợi nhuận bán hàng của một công ty phụ thuộc vào giá bán $p$ (triệu đồng/sản phẩm) theo hàm $Pi(p) = (p - 2)(100 - 10p)$ với $2 <= p <= 10$. Giá bán tối ưu để lợi nhuận lớn nhất là bao nhiêu triệu đồng/sản phẩm?],
  [$6$ triệu đồng/sản phẩm],
  loigiai: [
    $Pi(p) = (p-2)(100-10p) = 100p - 10p^2 - 200 + 20p = -10p^2 + 120p - 200$.

    $Pi'(p) = -20p + 120 = 0 => p = 6$.

    Vì $Pi''(p) = -20 < 0$, đây là cực đại. Giá bán tối ưu là *6* triệu đồng/sản phẩm.
  ]
)


