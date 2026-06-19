#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 03 – BÀI TOÁN HAY · LẠ · KHÓ]
  #v(0.2em)
  #text(size: 10.5pt, style: "italic", fill: c-book.lighten(30%))[Tối ưu hóa, Mô hình hóa, Vật lý & Sinh thái học]
]

// ═══════════════════════════════════════
// HÌNH VẼ MINH HỌA
// ═══════════════════════════════════════

// Hình 1: Năng lượng drone E(v) = 100(v² + 128/v)
#let fig-uav = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (0, 4.8), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (6.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((6.2, -0.35), [$v$ (m/s)])
  content((-0.5, 4.5), [$E(v)$])
  content((-0.2, -0.25), $O$)
  let pts = ()
  for i in range(50) {
    let v = 0.6 + i * 5.6 / 50
    let y = (v * v + 128 / v) * 0.028
    pts.push((v, y))
  }
  line(..pts, stroke: rgb("#b91c1c") + 1.4pt)
  let peak_y = (16.0 + 32.0) * 0.028
  line((4, 0), (4, peak_y), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line((0, peak_y), (4, peak_y), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  circle((4, peak_y), radius: 0.06, fill: rgb("#b91c1c"))
  content((4, -0.35), $4$)
  content((-0.5, peak_y), text(size: 9pt)[$E_"min"$])
  content((5.3, 3.2), text(size: 9.5pt, fill: rgb("#b91c1c"))[$E(v)$])
})

// Hình 2: Góc nhìn tranh α(x) — cực đại tại x=3
#let fig-viewing = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((5, -0.5), (5, 5.5), stroke: 1.2pt + rgb("#64748b"))
  content((5.4, 5.2), text(size: 9pt)[Tường])
  line((5, 0.55), (5, 4.95), stroke: 4pt + rgb("#92400e"))
  content((5.9, 2.75), text(size: 8pt, fill: rgb("#92400e"))[Tranh])
  circle((2, 0), radius: 0.08, fill: rgb("#0f4c81"))
  content((2, -0.4), text(size: 9pt)[$M$])
  line((2, 0), (5, 0.55), stroke: (paint: gray, dash: "dashed", thickness: 0.7pt))
  line((2, 0), (5, 4.95), stroke: (paint: gray, dash: "dashed", thickness: 0.7pt))
  arc((2, 0), start: 10.4deg, stop: 61.9deg, radius: 1.1, stroke: 0.8pt + rgb("#0f4c81"))
  content((3.25, 1.6), text(size: 10pt, fill: rgb("#0f4c81"))[$alpha$])
  line((0.3, -0.8), (4.7, -0.8), mark: (both: "stealth", scale: 0.4), stroke: 0.5pt)
  content((2.5, -1.15), text(size: 9pt)[$x$ (m)])
  content((5.8, 0.55), text(size: 8pt)[$1$m])
  content((5.8, 4.95), text(size: 8pt)[$9$m])
})

// Hình 3: Đường cong dịch bệnh I(t)=500t·e^(-0.1t)
#let fig-epidemic = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (0, 4.5), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (7, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((6.7, -0.35), [$t$ (ngày)])
  content((-0.5, 4.2), [$I(t)$])
  content((-0.2, -0.25), $O$)
  let sc = 0.00215
  let pts = ()
  for i in range(68) {
    let t = i * 1.0 / 10
    let y = 500 * t * calc.exp(-0.1 * t) * sc
    pts.push((t, y))
  }
  line(..pts, stroke: rgb("#dc2626") + 1.4pt)
  let peak_x = 1.0
  let peak_y = 500 * 10.0 * calc.exp(-1.0) * sc
  line((peak_x, 0), (peak_x, peak_y), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line((0, peak_y), (peak_x, peak_y), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  circle((peak_x, peak_y), radius: 0.06, fill: rgb("#dc2626"))
  content((peak_x, -0.35), $10$)
  content((-0.7, peak_y), text(size: 8pt)[$I_"max"$])
  let inf_x = 2.0
  let inf_y = 500 * 20.0 * calc.exp(-2.0) * sc
  circle((inf_x, inf_y), radius: 0.06, fill: none, stroke: 0.8pt + rgb("#7c3aed"))
  content((inf_x + 0.3, inf_y + 0.35), text(size: 8pt, fill: rgb("#7c3aed"))[Điểm uốn])
  content((inf_x, -0.35), text(size: 8.5pt)[$20$])
})

// Hình 4: Đường cong Laffer T(r)=81r(1-r)²
#let fig-laffer = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (0, 4.5), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (6.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((6.2, -0.35), [$r$])
  content((-0.6, 4.2), [$T(r)$])
  content((-0.2, -0.25), $O$)
  let sc = 0.3
  let pts = ()
  for i in range(51) {
    let r = i * 1.0 / 50
    pts.push((r * 5.5, 81 * r * calc.pow(1 - r, 2) * sc))
  }
  line(..pts, stroke: rgb("#7c3aed") + 1.4pt)
  line((5.5 / 3, 0), (5.5 / 3, 3.6), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line((0, 3.6), (5.5 / 3, 3.6), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  circle((5.5 / 3, 3.6), radius: 0.06, fill: rgb("#7c3aed"))
  content((5.5 / 3, -0.38), text(size: 9.5pt)[$1/3$])
  content((-0.5, 3.6), text(size: 9pt)[$12$])
  content((0, -0.35), $0$)
  content((5.5, -0.35), $1$)
  content((4.5, 2.2), text(size: 9.5pt, fill: rgb("#7c3aed"))[$T(r)$])
})

// Hình 5: Nồng độ thuốc C(t)=2t·e^(-0.5t)
#let fig-pharma = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (0, 4.5), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (7, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((6.7, -0.35), [$t$ (giờ)])
  content((-0.6, 4.2), [$C(t)$ (mg/L)])
  content((-0.2, -0.25), $O$)
  let sc = 1.8
  let pts = ()
  for i in range(60) {
    let t = i * 12.0 / 60
    pts.push((t * 6.8 / 12, 2 * t * calc.exp(-0.5 * t) * sc))
  }
  line(..pts, stroke: rgb("#0891b2") + 1.4pt)
  let pk_x = 2.0 * 6.8 / 12
  let pk_y = 2 * 2.0 * calc.exp(-1.0) * sc
  line((pk_x, 0), (pk_x, pk_y), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line((0, pk_y), (pk_x, pk_y), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  circle((pk_x, pk_y), radius: 0.06, fill: rgb("#0891b2"))
  content((pk_x, -0.35), $2$)
  content((-0.8, pk_y), text(size: 8.5pt)[$approx 1.47$])
  content((5.0, 2.2), text(size: 9.5pt, fill: rgb("#0891b2"))[$C(t)$])
  line((0, 0.9), (6.5, 0.9), stroke: (paint: rgb("#16a34a"), dash: "dashed", thickness: 0.6pt))
  content((5.6, 1.18), text(size: 8pt, fill: rgb("#16a34a"))[0.5 mg/L])
})

// Hình 6: Bố cục cáp quang đảo–bờ biển
#let fig-cable = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((-0.5, 0), (7.5, 0), stroke: 1.5pt + rgb("#78716c"))
  content((6.5, -0.35), text(size: 9pt)[Bờ biển])
  rect((-0.5, 0), (7.5, 3.5), fill: rgb("#bae6fd").transparentize(60%), stroke: none)
  content((1, 2), text(size: 9pt, fill: rgb("#0284c7"))[Biển])
  circle((5, 3), radius: 0.12, fill: rgb("#16a34a"))
  content((5.35, 3.2), text(size: 9pt)[$B$])
  circle((5, 0), radius: 0.05, fill: black)
  content((5, -0.38), text(size: 9pt)[$H$])
  line((5, 3), (5, 0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  content((5.2, 1.5), text(size: 8.5pt)[$5$ km])
  circle((0, 0), radius: 0.1, fill: rgb("#b91c1c"))
  content((0, -0.38), text(size: 9pt)[$A$])
  line((0, -0.7), (5, -0.7), mark: (both: "stealth", scale: 0.4), stroke: 0.5pt)
  content((2.5, -1.05), text(size: 8.5pt)[$12$ km])
  circle((1.2, 0), radius: 0.08, fill: rgb("#7c3aed"))
  content((1.2, 0.3), text(size: 8.5pt, fill: rgb("#7c3aed"))[$M$])
  line((0, 0), (1.2, 0), stroke: 2pt + rgb("#b91c1c"))
  line((1.2, 0), (5, 3), stroke: (paint: rgb("#0284c7"), thickness: 2pt))
  content((1.8, 1.6), text(size: 8.5pt, fill: rgb("#0284c7"))[Dưới biển])
  content((0.6, 0.28), text(size: 8.5pt, fill: rgb("#b91c1c"))[Trên bờ])
  line((0, -1.4), (1.2, -1.4), mark: (both: "stealth", scale: 0.4), stroke: 0.5pt)
  content((0.6, -1.75), text(size: 8.5pt)[$x$])
})

// Hình 7: Hình chữ nhật lớn nhất nội tiếp tam giác vuông
#let fig-rect-tri = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (6, 0), stroke: 1.2pt + rgb("#0f4c81"))
  line((0, 0), (0, 4), stroke: 1.2pt + rgb("#0f4c81"))
  line((6, 0), (0, 4), stroke: 1.2pt + rgb("#0f4c81"))
  content((6.2, -0.2), $A$)
  content((-0.3, 4.2), $B$)
  content((-0.3, -0.2), $O$)
  content((3, -0.45), text(size: 9pt)[$a=6$])
  content((-0.65, 2), text(size: 9pt)[$b=8$])
  rect((0, 0), (3, 2), fill: rgb("#fef3c7"), stroke: 1.4pt + rgb("#d97706"))
  content((1.5, 1), text(size: 9pt, fill: rgb("#92400e"))[$S = 12$])
  content((1.5, -0.38), text(size: 9pt)[$x=3$])
  content((-0.5, 1), text(size: 9pt)[$y=4$])
  circle((3, 2), radius: 0.07, fill: rgb("#d97706"))
})

// ═══════════════════════════════════════
// PHẦN I – TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN
// ═══════════════════════════════════════

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Một thiết bị bay không người lái (drone) thực hiện một hành trình dài $100$ km. Khi drone di chuyển với vận tốc không đổi $v$ (m/s) thì năng lượng tiêu hao trên mỗi ki-lô-mét đường đi gồm hai phần: năng lượng thắng lực cản không khí là $v^2$ (J/km) và năng lượng duy trì các thiết bị điện tử là $128/v$ (J/km). Tổng năng lượng tiêu hao trong cả hành trình được tính theo công thức $E(v) = 100(v^2 + 128/v)$ (J). Vận tốc bay nào dưới đây giúp drone tiết kiệm năng lượng nhất?
    #align(center)[#fig-uav]],
  (
    [$2$ m/s],
    [$3$ m/s],
    True([$4$ m/s]),
    [$5$ m/s],
  ),
  loigiai: [
    #step[$E'(v) = 100(2v - 128/v^2) = 0 <=> v^3 = 64 <=> v = 4$ m/s.]
    #step[$E(4) = 100(16 + 32) = 4800$ J. *Công thức tổng quát:* $v^* = root(3, P_0/(2k))$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một bức tranh được treo thẳng đứng trên một bức tường phẳng. Cạnh dưới và cạnh trên của bức tranh lần lượt cao hơn tầm mắt của một người quan sát là $1$ m và $9$ m. Người quan sát đứng cách bức tường một khoảng $x$ (mét) thì góc nhìn $alpha$ của người đó đối với bức tranh được xác định bởi công thức $alpha = arctan(9/x) - arctan(1/x)$ (với $x > 0$). Khoảng cách $x$ bằng bao nhiêu để người đó có góc nhìn $alpha$ lớn nhất?
    #align(center)[#fig-viewing]],
  (
    [$1$ m],
    [$2$ m],
    True([$3$ m]),
    [$4$ m],
  ),
  loigiai: [
    #step[$tan alpha = frac(8x, x^2 + 9)$. Đặt $f(x) = frac(8x, x^2+9)$, tối ưu tương đương tối ưu $alpha$.]
    #step[$f'(x) = frac(8(9-x^2), (x^2+9)^2) = 0 <=> x = 3$. *Công thức đẹp:* $x^* = sqrt(1 times 9) = 3$ m — trung bình nhân!]
  ],
))

#q-wrap(dir: "doc", tn(
  [Theo định luật làm nguội của Newton, một vật ở nhiệt độ $100 degree$C được đặt vào một phòng có nhiệt độ không đổi là $0 degree$C. Nhiệt độ $T(t)$ của vật sau $t$ phút kể từ lúc đặt vào phòng được xác định bởi công thức $T(t) = 100 dot.c (1/2)^(t/20)$ (đơn vị: $degree$C). Hỏi sau bao lâu kể từ lúc bắt đầu làm nguội thì nhiệt độ của vật giảm còn bằng $1/16$ so với nhiệt độ ban đầu?],
  (
    [$40$ phút],
    [$60$ phút],
    True([$80$ phút]),
    [$100$ phút],
  ),
  loigiai: [
    #step[$(1/2)^(t/20) = 1/16 = (1/2)^4 <=> t = 80$ phút (tức $4$ chu kỳ bán rã).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một nguồn điện có suất điện động $epsilon = 24$ V và điện trở trong $r = 2 space Omega$. Công suất tiêu thụ $P$ (đơn vị: W) trên điện trở ngoài $R$ (đơn vị: $Omega$) của mạch điện được xác định bởi công thức $P(R) = frac(576 R, (R + 2)^2)$. Tìm điện trở ngoài $R$ để công suất tiêu thụ trên mạch ngoài đạt giá trị lớn nhất và tính giá trị công suất lớn nhất tương ứng đó.],
  (
    [$R = 1 space Omega$, $P = 64$ W],
    True([$R = 2 space Omega$, $P = 72$ W]),
    [$R = 3 space Omega$, $P approx 69$ W],
    [$R = 4 space Omega$, $P = 64$ W],
  ),
  loigiai: [
    #step[$P'(R) = 576 frac(2-R, (R+2)^3) = 0 <=> R = 2 = r$. *Định lý:* $P$ cực đại khi $R = r$.]
    #step[$P_"max" = 576 dot.c 2/16 = 72$ W. Hiệu suất tại điểm này đúng $50\%$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một khách sạn có $100$ phòng. Người quản lý thấy rằng nếu giá thuê mỗi phòng là $1.000$ nghìn đồng một đêm thì tất cả các phòng đều được thuê hết. Tuy nhiên, cứ mỗi lần tăng giá thuê thêm $100$ nghìn đồng một đêm thì sẽ có thêm $5$ phòng bị bỏ trống. Hỏi người quản lý nên đặt giá thuê phòng là bao nhiêu để doanh thu của khách sạn trong một đêm đạt giá trị lớn nhất?],
  (
    [$1200$k],
    [$1300$k],
    True([$1500$k]),
    [$1800$k],
  ),
  loigiai: [
    #step[$R(x) = (1000+100x)(100-5x) = 100000+5000x-500x^2$. $R'=5000-1000x=0 <=> x=5$.]
    #step[Giá tối ưu $= 1000 + 500 = 1500$k; $75$ phòng. Doanh thu $= 112500$k.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một chất điểm chuyển động trong mặt phẳng tọa độ $O x y$ với phương trình quỹ đạo xác định bởi $x = t - sin t$ và $y = 1 - cos t$ (với $t$ là thời gian). Tốc độ $v(t)$ của chất điểm tại thời điểm $t$ được xác định bởi công thức $v(t) = sqrt((1 - cos t)^2 + sin^2 t)$. Tốc độ chuyển động lớn nhất của chất điểm bằng bao nhiêu?],
  (
    [$1$],
    [$sqrt(2)$],
    True([$2$]),
    [$2 sqrt(2)$],
  ),
  loigiai: [
    #step[$v(t)^2 = 2 - 2 cos t = 4 sin^2(t/2) => v(t) = 2|sin(t/2)|$. Cực đại $= 2$ tại $t = pi$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Giả sử nguồn thu từ thuế $T$ (đơn vị: tỷ đồng) của một quốc gia được mô tả bởi đường cong Laffer thông qua công thức $T(r) = 81 r (1-r)^2$, trong đó $r in [0,1]$ là thuế suất (như hình vẽ minh họa). Hỏi thuế suất $r^*$ bằng bao nhiêu để nguồn thu từ thuế của quốc gia đạt giá trị lớn nhất và tính nguồn thu lớn nhất $T^*$ đó?
    #align(center)[#fig-laffer]],
  (
    [$r^* = 1/4$, $T^* = 9$ tỉ],
    True([$r^* = 1/3$, $T^* = 12$ tỉ]),
    [$r^* = 1/2$, $T^* approx 10.1$ tỉ],
    [$r^* = 2/3$, $T^* = 6$ tỉ],
  ),
  loigiai: [
    #step[$T'(r) = 81(1-r)(1-3r) = 0 <=> r = 1/3$. $T(1/3) = 81 dot.c frac(1, 3) dot.c frac(4, 9) = 12$ tỉ.]
    #step[*Ý nghĩa:* Thuế suất $> 1/3$ làm giảm nguồn thu — đây là bản chất kinh tế của đường Laffer!]
  ],
))

#q-wrap(dir: "doc", tn(
  [Để khai thác một quần thể cá một cách bền vững, tốc độ tăng trưởng của sinh khối đàn cá được mô hình hóa theo hàm số $f(N) = 0,4 N (1 - frac(N, 1000))$ (tấn/năm), trong đó $N$ là sinh khối của đàn cá (tấn). Sản lượng khai thác bền vững tối đa hằng năm đạt được tại giá trị lớn nhất của hàm số $f(N)$. Sản lượng khai thác tối đa hằng năm đó bằng bao nhiêu?],
  (
    [$50$ tấn/năm],
    True([$100$ tấn/năm]),
    [$150$ tấn/năm],
    [$200$ tấn/năm],
  ),
  loigiai: [
    #step[$f(N) = 0.4 N(1-N/1000)$. Cực đại tại $N^* = 500 = K/2$. $H^* = 0.4 times 500 times 0.5 = 100$ tấn.]
    #step[*Công thức:* $H^* = frac(r K, 4) = frac(0.4 times 1000, 4) = 100$ tấn/năm.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nồng độ cồn trong máu (BAC) của một tài xế sau khi uống rượu bia được xác định bởi công thức $"BAC"(t) = 2,4 dot.c (1/2)^(t/3)$ (đơn vị: phần ngàn - $‰$), trong đó $t$ là số giờ kể từ thời điểm đo đầu tiên. Một người đủ điều kiện lái xe an toàn khi nồng độ cồn trong máu không vượt quá $0,3 ‰$. Hỏi sau ít nhất bao nhiêu giờ kể từ thời điểm đo đầu tiên thì tài xế đó đủ điều kiện lái xe?],
  (
    [$6$ giờ],
    [$7$ giờ],
    True([$9$ giờ]),
    [$12$ giờ],
  ),
  loigiai: [
    #step[$(1/2)^(t/3) = frac(0.3, 2.4) = frac(1, 8) = (1/2)^3 <=> t = 9$ giờ. (BAC giảm một nửa mỗi $3$ giờ.)]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong một đợt bùng phát dịch bệnh, số ca mắc mới mỗi ngày được mô hình hóa bởi hàm số $I(t) = 500 t e^(-0.1 t)$ (ca/ngày), với $t >= 0$ là số ngày tính từ khi dịch bắt đầu xuất hiện (như hình vẽ minh họa). Hỏi sau bao nhiêu ngày kể từ khi bùng phát thì số ca mắc mới mỗi ngày đạt giá trị lớn nhất?
    #align(center)[#fig-epidemic]],
  (
    [Ngày $5$],
    [Ngày $8$],
    True([Ngày $10$]),
    [Ngày $15$],
  ),
  loigiai: [
    #step[$I'(t) = 500 e^(-0.1t)(1 - 0.1t) = 0 <=> t = 10$ ngày. $I(10) = 5000 e^(-1) approx 1839$ ca/ngày.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một công ty sữa cần thiết kế một chiếc lon hình trụ kín có thể tích $V$ cho trước. Để tiết kiệm vật liệu làm vỏ lon, người ta cần thiết kế sao cho diện tích toàn phần của hình trụ đạt giá trị nhỏ nhất. Khi đó, tỉ số giữa chiều cao $h$ và bán kính đáy $r$ của chiếc lon bằng:],
  (
    [$h/r = 1/2$],
    [$h/r = 1$],
    True([$h/r = 2$]),
    [$h/r = 4$],
  ),
  loigiai: [
    #step[$S = 2 pi r^2 + 2V/r$. $S'=0 => r^3 = V/(2 pi) => h = V/(pi r^2) = 2r$. Vậy $h/r = 2$ (chiều cao = đường kính).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho tam giác $O A B$ vuông tại $O$ với $O A = 6$ cm và $O B = 8$ cm. Một hình chữ nhật được dựng nội tiếp tam giác $O A B$ sao cho một đỉnh của hình chữ nhật trùng với $O$, hai cạnh nằm trên hai cạnh góc vuông $O A$, $O B$ và đỉnh đối diện nằm trên cạnh huyền $A B$ (như hình vẽ minh họa). Diện tích lớn nhất của hình chữ nhật đó bằng:
    #align(center)[#fig-rect-tri]],
  (
    [$8$ cm²],
    [$10$ cm²],
    True([$12$ cm²]),
    [$16$ cm²],
  ),
  loigiai: [
    #step[$S = x y = 8x - 4x^2/3$. $S'=0 => x=3$, $y=4$, $S=12$ cm².]
    #step[*Kết quả đẹp:* $S_"max" = frac(a b, 4) = 12 = frac(1, 2) S_{triangle}$. Luôn bằng nửa diện tích tam giác!]
  ],
))

// ═══════════════════════════════════════
// PHẦN II – ĐÚNG / SAI
// ═══════════════════════════════════════

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng – Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Trong một đợt bùng phát dịch bệnh, số ca nhiễm mới hằng ngày được mô hình hóa bởi hàm số $I(t) = 500 t e^(-0.1 t)$ (ca/ngày), với $t >= 0$ là số ngày tính từ khi bắt đầu dịch. Xét tính đúng hoặc sai của các khẳng định sau:],
  (
    True([Đỉnh dịch đạt vào ngày thứ $10$.]),
    True([Tổng số ca toàn đợt là $50000$ ca.]),
    True([Sau ngày thứ $20$, số ca hằng ngày vẫn giảm nhưng tốc độ giảm bắt đầu chậm lại.]),
    [Số ca ngày thứ $30$ nhiều hơn số ca ngày thứ $5$.],
  ),
  loigiai: [
    - *a) Đúng.* $I'(t)=500 e^(-0.1t)(1-0.1t)=0 <=> t=10$.
    - *b) Đúng.* $integral_0^(+oo) 500 t e^(-0.1t) dif t = 500 dot.c 1/(0.1)^2 = 50000$ ca.
    - *c) Đúng.* Điểm uốn tại $t=20$: $I''(20)=0$, với $t>20$ thì $I''>0$ — tốc độ giảm chậm dần.
    - *d) Sai.* $I(5)=2500e^(-0.5) approx 1516$; $I(30)=15000e^(-3) approx 747$. Ngày 30 ít hơn ngày 5.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Giả sử nguồn thu từ thuế của một quốc gia theo thuế suất $r$ ($r in [0,1]$) được mô tả bởi hàm số $T(r) = 81 r (1-r)^2$ (đơn vị: tỷ đồng). Xét tính đúng hoặc sai của các khẳng định sau:],
  (
    True([Thuế suất để quốc gia đạt nguồn thu từ thuế lớn nhất là $r = 1/3$ (khoảng $33,3\%$).]),
    True([Nguồn thu từ thuế lớn nhất của quốc gia đạt được là $12$ tỷ đồng.]),
    [Tại mức thuế suất $r = 1/2$, nếu tăng thuế suất thì nguồn thu từ thuế của quốc gia cũng tăng.],
    True([Tại các mức thuế suất $r = 0\%$ và $r = 100\%$, nguồn thu từ thuế của quốc gia đều bằng $0$.]),
  ),
  loigiai: [
    - *a) Đúng.* $T'(r)=81(1-r)(1-3r)=0 => r=1/3$.
    - *b) Đúng.* $T(1/3)=81 dot.c frac(1, 3) dot.c frac(4, 9)=12$ tỷ.
    - *c) Sai.* $T'(1/2)=81 dot.c frac(1, 2) dot.c (-frac(1, 2)) = -frac(81, 4) < 0$ — tăng thuế làm *giảm* nguồn thu.
    - *d) Đúng.* $T(0)=0$; $T(1)=81 dot.c 1 dot.c 0=0$.
  ],
))

#q-wrap(dir: "doc", ds(
  [Sau khi một bệnh nhân được tiêm một liều thuốc, nồng độ của hoạt chất trong máu sau $t$ giờ kể từ thời điểm tiêm được xác định bởi công thức $C(t) = 2t e^(-0.5t)$ (mg/L) (như hình vẽ minh họa). Xét tính đúng hoặc sai của các khẳng định sau:], 
  (
    True([Nồng độ đỉnh đạt khoảng $1.47$ mg/L vào giờ thứ $2$.]),
    [Diện tích dưới đường cong AUC (tổng phơi nhiễm) bằng $4$ mg$dot.c$giờ/L.],
    True([Sau $6$ giờ, nồng độ vẫn trên ngưỡng điều trị $0.5$ mg/L.]),
    True([Tại $t=4$ giờ, thuốc đang đào thải với tốc độ khoảng $0.27$ mg/L/giờ.]),
  ),
  loigiai: [
    - *a) Đúng.* $C'(t)=2e^(-0.5t)(1-0.5t)=0 => t=2$. $C(2)=4e^(-1) approx 1.47$ mg/L.
    - *b) Sai.* $"AUC" = integral_0^(+oo) 2t e^(-0.5t) dif t = 2 dot.c frac(1, 0.25) = 8$ mg$dot.c$giờ/L, không phải $4$.
    - *c) Đúng.* $C(6)=12e^(-3) approx 0.597 > 0.5$ mg/L.
    - *d) Đúng.* $|C'(4)| = |2e^(-2)(1-2)| = 2e^(-2) approx 0.271$ mg/(L$dot.c$giờ).
  ],
))

#q-wrap(dir: "doc", ds(
  [Một quần thể cá nuôi trong hồ có sinh khối $N(t)$ (tính bằng tấn) thay đổi theo thời gian $t$ (năm). Khi đánh bắt với sản lượng khai thác cố định là $H$ (tấn/năm), tốc độ thay đổi sinh khối của quần thể cá tuân theo công thức $N'(t) = 0,4 N(t) (1 - frac(N(t), 2000)) - H$. Xét tính đúng hoặc sai của các phát biểu sau:],
  (
    True([Mức khai thác mỗi năm lớn nhất để quần thể cá phát triển ổn định bền vững là $200$ tấn.]),
    [Để thu được sản lượng khai thác bền vững lớn nhất, cần duy trì sinh khối quần thể cá ở mức $2000$ tấn.],
    True([Nếu sản lượng khai thác mỗi năm là $H = 250$ tấn thì sinh khối quần thể cá sẽ liên tục giảm về $0$ và bị sụp đổ.]),
    [Khi không đánh bắt ($H = 0$), tốc độ tăng trưởng sinh khối tự nhiên của quần thể cá đạt cực đại tại quy mô sinh khối $500$ tấn.],
  ),
  loigiai: [
    - *a) Đúng.* Tốc độ tăng trưởng tự nhiên là $g(N) = 0,4 N (1 - frac(N, 2000)) = 0,4 N - 0,0002 N^2$. Cực đại của $g(N)$ đạt được khi $g'(N) = 0,4 - 0,0004 N = 0 <=> N = 1000$ tấn. Khi đó, sản lượng khai thác cực đại tương ứng là $H = g(1000) = 200$ tấn/năm.
    - *b) Sai.* Cần duy trì sinh khối ở mức $N = 1000$ tấn (nửa sức chứa tối đa), không phải $2000$ tấn.
    - *c) Đúng.* Khi $H = 250 > 200$, tốc độ thay đổi sinh khối $N'(t) < 0$ với mọi $N$, do đó sinh khối cá luôn giảm về $0$.
    - *d) Sai.* Tốc độ tăng trưởng tự nhiên đạt cực đại tại $N = 1000$ tấn, không phải $500$ tấn.
  ],
))

// ═══════════════════════════════════════
// PHẦN III – TRẢ LỜI NGẮN
// ═══════════════════════════════════════

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Một tấm pa-nô quảng cáo được treo thẳng đứng trên một bức tường phẳng. Cạnh dưới của pa-nô cao hơn tầm mắt của một người quan sát là $4$ m, cạnh trên của pa-nô cao hơn tầm mắt của người đó là $16$ m. Hỏi người quan sát phải đứng cách bức tường bao nhiêu mét để góc nhìn $alpha$ của người đó đối với pa-nô đạt giá trị lớn nhất? (Ghi kết quả dưới dạng số nguyên).],
  [$8$],
  loigiai: [
    #step[$tan alpha = frac(12x, x^2 + 64)$. Tối ưu $f(x)=frac(12x, x^2+64)$.]
    #step[$f'(x) = frac(12(64-x^2), (x^2+64)^2) = 0 <=> x^2 = 64 <=> x = 8$ m.]
    #step[*Công thức tổng quát:* $x^* = sqrt(a b) = sqrt(4 times 16) = 8$ m. Góc cực đại: $alpha_"max" = arctan(3/4) approx 36.9 degree$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một thiết bị bay không người lái (drone) có lượng năng lượng tiêu thụ trên mỗi ki-lô-mét khi bay với vận tốc không đổi $v$ (m/s) được xác định bởi công thức $e(v) = v^2 + 128/v$ (đơn vị: J/km), với $v > 0$. Vận tốc bay bằng bao nhiêu m/s để năng lượng tiêu hao trên mỗi ki-lô-mét của drone là nhỏ nhất?],
  [$4$],
  loigiai: [
    #step[$e'(v) = 2v - 128/v^2 = 0 <=> v^3 = 64 <=> v = 4$ m/s.]
    #step[$e(4) = 16 + 128/4 = 48$ J/km.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong một đợt dịch bệnh, số ca mắc mới mỗi ngày được mô hình hóa bởi hàm số $I(t) = 1000 t e^(-t/15)$ (ca/ngày), với $t >= 0$ là số ngày tính từ khi bùng phát dịch. Tổng số ca mắc trong $30$ ngày đầu tiên là $G = integral_0^(30) I(t) dif t$ (ca). Tính giá trị của $G$ làm tròn đến hàng trăm.],
  [$133900$],
  loigiai: [
    #step[Tích phân từng phần: $integral t e^(-t/15) dif t = -(15t+225)e^(-t/15) + C$.]
    #step[$G = 1000 [-(15t+225)e^(-t/15)]_0^(30) = 1000[-(675)e^(-2) + 225] = 1000(225 - 675e^(-2))$.]
    #step[$G approx 1000(225 - 675 times 0.135) approx 133900$ ca.]
  ],
))




#q-wrap(dir: "doc", tln(
  [Một trạm viễn thông trên đảo $B$ cách bờ biển một khoảng $B H = 5$ km. Trạm này cần kết nối cáp quang đến điểm $A$ trên bờ biển, biết khoảng cách từ $A$ đến hình chiếu $H$ của đảo trên bờ biển là $A H = 12$ km. Chi phí lắp đặt mỗi ki-lô-mét cáp dưới biển là $3.000$ triệu đồng, còn chi phí lắp đặt mỗi ki-lô-mét cáp trên bờ là $1.500$ triệu đồng. Người ta chọn một vị trí $M$ trên bờ biển nằm giữa $A$ và $H$ làm điểm kết nối cáp từ biển lên bờ, với $H M = x$ (km) như hình vẽ. Xác định giá trị của $x$ (km) để tổng chi phí lắp đặt tuyến cáp là nhỏ nhất (làm tròn kết quả đến hai chữ số thập phân).
    #align(center)[#fig-cable]],
  [$2.89$],
  loigiai: [
    #step[$C(x) = 3000 sqrt(x^2+25) + 1500(12-x)$.]
    #step[$C'(x) = frac(3000 x, sqrt(x^2+25)) - 1500 = 0 <=> frac(x, sqrt(x^2+25)) = frac(1, 2)$.]
    #step[$4x^2 = x^2 + 25 <=> 3x^2 = 25 <=> x = frac(5, sqrt(3)) = frac(5 sqrt(3), 3) approx 2.89$ km.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một tàu chở hàng đi từ cảng A đến cảng B với vận tốc không đổi là $v$ (km/h) ($v > 0$). Chi phí nhiên liệu của tàu cho mỗi giờ chạy được tính bởi công thức $C(v) = 4 v^2 + 1600$ (nghìn đồng/giờ). Biết khoảng cách giữa hai cảng là $100$ km. Hãy tìm vận tốc $v$ (km/h) của tàu để tổng chi phí nhiên liệu cho cả chuyến đi là nhỏ nhất.],
  [$20$],
  loigiai: [
    #step[Thời gian đi hết chuyến đi là $t = frac(100, v)$ (giờ).]
    #step[Tổng chi phí nhiên liệu cho cả hành trình là: $T(v) = t dot.c C(v) = frac(100, v) (4v^2 + 1600) = 400v + frac(160000, v)$ (nghìn đồng).]
    #step[Áp dụng bất đẳng thức AM-GM: $T(v) = 400v + frac(160000, v) >= 2 sqrt(400v dot.c frac(160000, v)) = 16000$ nghìn đồng.]
    #step[Dấu "=" xảy ra khi $400v = frac(160000, v) <=> v^2 = 400 <=> v = 20$ (km/h).]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một người nông dân muốn rào xung quanh một khu đất hình chữ nhật nằm sát bên bờ một con sông thẳng để trồng rau. Bờ sông đóng vai trò là một cạnh của khu đất nên không cần rào lưới. Người nông dân sử dụng $120$ mét lưới thép gai để rào ba cạnh còn lại của khu đất. Diện tích lớn nhất của khu đất rào được bằng bao nhiêu mét vuông?],
  [$1800$],
  loigiai: [
    #step[Gọi chiều rộng của khu đất vuông góc với bờ sông là $x$ (mét) ($0 < x < 60$).]
    #step[Chiều dài của khu đất song song với bờ sông là $120 - 2x$ (mét).]
    #step[Diện tích của khu đất là $S(x) = x(120 - 2x) = 120x - 2x^2$ (m²).]
    #step[$S'(x) = 120 - 4x = 0 <=> x = 30$ (mét). Diện tích lớn nhất là $S(30) = 1800$ m².]
  ],
))
