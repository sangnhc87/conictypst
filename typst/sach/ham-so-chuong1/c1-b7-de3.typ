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
  [*[Drone — Tối ưu năng lượng bay]* Một drone thực hiện chuyến bay dài $100$ km. Tại vận tốc $v$ m/s, năng lượng tiêu hao mỗi km gồm hai phần: lực cản không khí tốn $v^2$ J/km và điện tử cố định tốn $128/v$ J/km. Tổng năng lượng: $E(v) = 100(v^2 + 128/v)$ J. Vận tốc nào giúp drone tiết kiệm năng lượng nhất?
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
  [*[Góc nhìn tranh — Tối ưu vị trí quan sát]* Bức tranh treo thẳng đứng, cạnh dưới cao $1$m, cạnh trên cao $9$m so với tầm mắt. Người đứng cách tường $x$ mét; góc nhìn $alpha = arctan(9/x) - arctan(1/x)$. Giá trị $x$ để $alpha$ lớn nhất là:
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
  [*[Làm lạnh Newton — Bán chu kỳ]* Vật nóng $100 degree$C đặt trong phòng $0 degree$C. Nhiệt độ: $T(t) = 100 dot.c (1/2)^(t/20)$ với $t$ (phút). Sau bao lâu nhiệt độ còn $1/16$ ban đầu?],
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
  [*[Định lý truyền công suất cực đại]* Nguồn điện $epsilon = 24$ V, điện trở trong $r = 2 space Omega$. Công suất tiêu thụ trên điện trở ngoài $R$: $P(R) = frac(576 R, (R + 2)^2)$. Giá trị $R$ và $P_"max"$:],
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
  [*[Tối ưu giá phòng khách sạn]* Khách sạn $100$ phòng, giá $1000$k/đêm, tất cả kín. Mỗi tăng thêm $100$k thì $5$ phòng trống. Giá bán tối ưu để doanh thu cực đại:],
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
  [*[Cycloid — Tốc độ cực đại của hạt]* Hạt chuyển động theo cycloid: $x = t - sin t$, $y = 1 - cos t$. Tốc độ $v(t) = sqrt((1-cos t)^2 + sin^2 t)$. Tốc độ cực đại là bao nhiêu?],
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
  [*[Đường cong Laffer — Thuế suất tối ưu]* Nguồn thu thuế $T(r) = 81 r (1-r)^2$ (tỉ đồng), $r in [0,1]$. Mức thuế tối ưu $r^*$ và nguồn thu $T^*$:
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
  [*[Khai thác bền vững tối đa (MSY)]* Đàn cá: $r = 0.4$, $K = 1000$ tấn. Mức khai thác bền vững tối đa hằng năm là:],
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
  [*[Nồng độ cồn — Pháp y]* $"BAC"(t) = 2.4 dot.c (1/2)^(t/3)$ (phần ngàn), ngưỡng lái xe hợp lệ $0.3‰$. Sau bao lâu đủ điều kiện lái xe?],
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
  [*[Đỉnh dịch bệnh]* Số ca mới hằng ngày: $I(t) = 500 t e^(-0.1 t)$ (ca/ngày). Đỉnh dịch đạt vào ngày:
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
  [*[Lon trụ tối ưu — Tỉ lệ thiết kế]* Lon hình trụ kín, thể tích $V$ cho trước. Để diện tích bề mặt nhỏ nhất, tỉ số $h/r$ (chiều cao / bán kính) bằng:],
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
  [*[Hình chữ nhật lớn nhất nội tiếp tam giác vuông]* Tam giác vuông $O A B$: $O A = 6$ cm, $O B = 8$ cm. Hình chữ nhật có một đỉnh tại $O$, hai cạnh trên $O A$ và $O B$, đỉnh đối diện trên cạnh huyền. Diện tích cực đại:
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
  [*[Mô hình dịch bệnh]* Số ca nhiễm mới hằng ngày trong một đợt dịch: $I(t) = 500 t e^(-0.1 t)$ (ca/ngày), $t >= 0$ (ngày).],
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
  [*[Đường cong Laffer]* Nguồn thu thuế theo thuế suất $r in [0,1]$: $T(r) = 81 r (1-r)^2$ (tỉ đồng).],
  (
    True([Mức thuế tối ưu là $r^* = 1/3$ (khoảng $33.3\%$).]),
    True([Nguồn thu cực đại là $T^* = 12$ tỉ đồng.]),
    [Tại mức thuế $r = 1/2$, tăng thuế sẽ làm tăng thêm nguồn thu.],
    True([Cả $r=0\%$ và $r=100\%$ đều cho nguồn thu bằng $0$.]),
  ),
  loigiai: [
    - *a) Đúng.* $T'(r)=81(1-r)(1-3r)=0 => r=1/3$.
    - *b) Đúng.* $T(1/3)=81 dot.c frac(1, 3) dot.c frac(4, 9)=12$ tỉ.
    - *c) Sai.* $T'(1/2)=81 dot.c frac(1, 2) dot.c (-frac(1, 2)) = -frac(81, 4) < 0$ — tăng thuế làm *giảm* nguồn thu.
    - *d) Đúng.* $T(0)=0$; $T(1)=81 dot.c 1 dot.c 0=0$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [*[Dược học — Nồng độ thuốc]* Nồng độ hoạt chất trong máu: $C(t) = 2t e^(-0.5t)$ (mg/L), $t$ (giờ).
    #align(center)[#fig-pharma]],
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

#q-wrap(dir: "ngang", ds(
  [*[Sinh thái — Khai thác bền vững]* Quần thể cá: $frac(d N, d t) = 0.4 N(1 - N/2000)$ ($N$: tấn, $t$: năm). Khai thác cố định $H$ tấn/năm.],
  (
    True([Mức khai thác bền vững tối đa là $H^* = 200$ tấn/năm.]),
    [Để đạt MSY, cần duy trì quần thể ở mức $N = K = 2000$ tấn.],
    True([Nếu khai thác $H = 250 > H^*$, phương trình cân bằng vô nghiệm và quần thể sẽ sụp đổ.]),
    [Tốc độ tăng trưởng tự nhiên đạt cực đại khi $N = K/4 = 500$ tấn.],
  ),
  loigiai: [
    - *a) Đúng.* $H^* = frac(r K, 4) = frac(0.4 times 2000, 4) = 200$ tấn/năm.
    - *b) Sai.* Cần $N^* = K/2 = 1000$ tấn (nửa sức chứa), không phải $K$.
    - *c) Đúng.* Tại $H=250$: $Delta = r^2 K^2 - 4 r K H = 640000 - 800000 < 0$ — vô nghiệm thực.
    - *d) Sai.* $f'(N)=r(1-2N/K)=0 => N=K/2=1000$, không phải $K/4=500$.
  ],
))

// ═══════════════════════════════════════
// PHẦN III – TRẢ LỜI NGẮN
// ═══════════════════════════════════════

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [*[Tối ưu vị trí quan sát pa-nô]* Một tấm pa-nô treo thẳng đứng: cạnh dưới cao $a = 4$ m, cạnh trên cao $b = 16$ m so với tầm mắt. Tìm khoảng cách $x$ (mét) để góc nhìn $alpha = arctan(16/x) - arctan(4/x)$ đạt lớn nhất. (Ghi kết quả dạng số nguyên.)],
  [$8$],
  loigiai: [
    #step[$tan alpha = frac(12x, x^2 + 64)$. Tối ưu $f(x)=frac(12x, x^2+64)$.]
    #step[$f'(x) = frac(12(64-x^2), (x^2+64)^2) = 0 <=> x^2 = 64 <=> x = 8$ m.]
    #step[*Công thức tổng quát:* $x^* = sqrt(a b) = sqrt(4 times 16) = 8$ m. Góc cực đại: $alpha_"max" = arctan(3/4) approx 36.9 degree$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [*[Năng lượng tối thiểu drone]* Drone có hàm năng lượng mỗi km: $e(v) = k v^2 + P_0/v$ J/km. Chứng minh vận tốc tối ưu là $v^* = root(3, P_0/(2k))$. Với $k = 1$, $P_0 = 128$: tính $v^*$ (m/s) và $e_"min"$ (J/km).],
  [$v^* = 4$ m/s, $e_"min" = 48$ J/km],
  loigiai: [
    #step[$e'(v) = 2 k v - P_0/v^2 = 0 <=> v^3 = frac(P_0, 2k) <=> v^* = root(3, frac(P_0, 2k))$. $e'' > 0$ xác nhận cực tiểu.]
    #step[Với $k=1$, $P_0=128$: $v^* = root(3, 64) = 4$ m/s.]
    #step[$e(4) = 16 + 128/4 = 16 + 32 = 48$ J/km. *Nhận xét:* $e_"cản" = 16 = frac(1, 2) dot.c 32 = frac(1, 2) e_"điện tử"$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [*[Dịch tễ — Gánh nặng bệnh 30 ngày]* Số ca mới: $I(t) = 1000 t e^(-t/15)$ (ca/ngày). Tính tổng số ca trong $30$ ngày đầu: $G = integral_0^(30) I(t) dif t$. Biểu diễn kết quả theo $e^(-2)$ và ước lượng số.],
  [$G = 1000(225 - 675 e^(-2)) approx 133900$ ca],
  loigiai: [
    #step[Tích phân từng phần: $integral t e^(-t/15) dif t = -(15t+225)e^(-t/15) + C$.]
    #step[$G = 1000 [-(15t+225)e^(-t/15)]_0^(30) = 1000[-(675)e^(-2) + 225] = 1000(225 - 675e^(-2))$.]
    #step[$G approx 1000(225 - 675 times 0.135) approx 1000 times 133.9 approx 133900$ ca.]
    #step[Tổng toàn đợt: $1000 times 15^2 = 225000$ ca. Vậy $59\%$ ca bệnh xảy ra trong 30 ngày đầu.]
  ],
))

#q-wrap(dir: "doc", tln(
  [*[Công suất cực đại trong mạch điện]* Nguồn điện $epsilon = 24$ V, điện trở trong $r = 2 space Omega$. Công suất trên điện trở ngoài $R$: $P(R) = frac(epsilon^2 R, (R+r)^2)$. Tìm $R$ để $P$ cực đại. Tính $P_"max"$ (W). Nhận xét gì về hiệu suất $eta = P_"max" / P_"cực đại lý thuyết"$?],
  [$R = 2 space Omega$, $P_"max" = 72$ W, $eta = 50\%$],
  loigiai: [
    #step[$P'(R) = epsilon^2 frac((R+r)^2 - 2R(R+r), (R+r)^4) = epsilon^2 frac(r-R, (R+r)^3) = 0 <=> R = r = 2 space Omega$.]
    #step[$P_"max" = frac(576 times 2, 16) = 72$ W.]
    #step[*Định lý truyền công suất cực đại:* $P$ cực đại khi $R = r$ — điện trở ngoài bằng điện trở trong.]
    #step[Tại $R = r$: dòng điện $I = epsilon/(2r)$, điện áp nguồn chia đôi cho $r$ và $R$. Công suất nguồn $= epsilon^2/(2r) times epsilon/(2r)...$ Hiệu suất $= P/(P_"tổng") = frac(I^2 R, I^2 (R+r)) = frac(R, R+r) = frac(r, 2r) = 50\%$. Luôn đúng $50\%$ tại điểm cực đại.]
  ],
))

#q-wrap(dir: "doc", tln(
  [*[Chứng minh MSY]* Quần thể tôm hùm: $frac(d N, d t) = r N(1 - N/K)$ với $r = 0.5$, $K = 4000$ tấn. Tìm mức khai thác bền vững tối đa $H^*$ và chứng minh công thức $H^* = frac(r K, 4)$.],
  [$H^* = 500$ tấn/năm],
  loigiai: [
    #step[Tốc độ tăng trưởng tự nhiên $f(N) = r N(1-N/K)$ là parabol lõm. Cực đại tại $f'(N)=r(1-2N/K)=0 <=> N^*=K/2$.]
    #step[$H^* = f(K/2) = r dot.c frac(K, 2) dot.c (1 - frac(K/2, K)) = r dot.c frac(K, 2) dot.c frac(1, 2) = frac(r K, 4)$. (Q.E.D.)]
    #step[Với $r=0.5$, $K=4000$: $H^* = frac(0.5 times 4000, 4) = 500$ tấn/năm. Quy mô tối ưu $N^* = 2000$ tấn.]
  ],
))

#q-wrap(dir: "doc", tln(
  [*[Tuyến cáp quang tối ưu]* Đảo $B$ cách bờ $5$ km. Điểm $A$ trên bờ cách điểm $H$ (hình chiếu của $B$) là $12$ km. Chi phí cáp: $3000$ triệu/km dưới biển, $1500$ triệu/km trên bờ. Gọi $x$ (km) là khoảng cách từ $H$ đến điểm $M$ (cáp lên bờ). Tìm $x$ để chi phí nhỏ nhất.
    #align(center)[#fig-cable]],
  [$x = frac(5 sqrt(3), 3) approx 2.89$ km],
  loigiai: [
    #step[$C(x) = 3000 sqrt(x^2+25) + 1500(12-x)$.]
    #step[$C'(x) = frac(3000 x, sqrt(x^2+25)) - 1500 = 0 <=> frac(x, sqrt(x^2+25)) = frac(1, 2)$.]
    #step[$4x^2 = x^2 + 25 <=> 3x^2 = 25 <=> x = frac(5, sqrt(3)) = frac(5 sqrt(3), 3) approx 2.89$ km.]
    #step[*Ý nghĩa hình học:* $sin theta = 1/2 => theta = 30 degree$ — *Nguyên lý Snell* cho bài toán kinh tế! Tỉ số chi phí $frac(1500, 3000) = frac(1, 2)$ quyết định góc cáp vào bờ.]
  ],
))
