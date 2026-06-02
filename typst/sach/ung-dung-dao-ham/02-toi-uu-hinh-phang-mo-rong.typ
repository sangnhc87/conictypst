// ════════════════════════════════════════════════════════════════
// TIẾP NỐI — Các chủ đề mở rộng
// ════════════════════════════════════════════════════════════════

#topic([Rào Mảnh Vườn — Biến Thể Đa Dạng], prefix: "Bài", theme-color: c-p1)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một hộ nông dân có $120$ m lưới thép để rào một khu vườn hình chữ nhật. Biết rằng một cạnh của vườn giáp bờ sông không cần rào. Người đó muốn rào thêm $2$ vách ngăn song song với bờ sông để chia vườn thành $3$ khu riêng. Hỏi chiều dài và chiều rộng bao nhiêu để tổng diện tích lớn nhất?],
    canvas(length: 1.3cm, {
      import draw: *
      line((0, 1.5), (5, 1.5), stroke: 2pt + rgb("555555"))
      for i in range(0, 11) { line((i*0.5, 1.5), (i*0.5+0.2, 1.9), stroke: 0.5pt + rgb("555555")) }
      content((2.5, 2.2), [*Bờ sông*])
      line((0, 1.5), (0, 0), (5, 0), (5, 1.5), stroke: 1.5pt + blue)
      line((5/3, 0), (5/3, 1.5), stroke: 1.5pt + blue)
      line((10/3, 0), (10/3, 1.5), stroke: 1.5pt + blue)
      content((-0.3, 0.75), [$x$])
      content((2.5, -0.4), [$y$])
    })
  ),
  loigiai: [
    #ppgiai[
      - Vách ngăn song song bờ sông → tổng hàng rào: $2x + y + 2y = 2x + 3y$ (xem hình)
      - Rút $y$ theo $x$ từ $2x + 3y = 120$, đưa $S = xy$ về một biến.
    ]
    #step[Gọi $x$ (m) là chiều rộng (cạnh vuông góc bờ sông), gọi $y$ (m) là chiều dài (song song bờ sông). \
    Tổng hàng rào $= 2x + y + 2y = 2x + 3y = 120$ m. \
    Suy ra $y = (120 - 2x)/3$. Điều kiện: $x > 0$, $y > 0$ → $x < 60$. \
    Miền xác định: $D = (0; 60)$.]

    #step[Diện tích: $S(x) = x dot.c (120 - 2x)/3 = (120x - 2x^2)/3$.]

    #step[$S'(x) = (120 - 4x)/3$. Cho $S' = 0$ → $x = 30$.]

    #align(center)[
      #bbt-opt(var: $x$, der: $S'$, func: $S$, x-vals: ($0$, $30$, $60$), d-signs: ($+$, $0$, $-$), v-vals: ($0$, $600$, $0$), is-min: false)
    ]

    #step[$S_(max) = 600$ m² tại $x = 30$ m, $y = 20$ m.]
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một nông dân có $80$ m lưới để rào hai khu vườn hình chữ nhật liền kề có chung một cạnh dài và giáp một con mương thẳng (không cần rào phía mương). Hỏi diện tích mỗi khu lớn nhất là bao nhiêu?],
    canvas(length: 1.2cm, {
      import draw: *
      line((0, 2), (4, 2), stroke: 2pt + rgb("555555"))
      for i in range(0, 9) { line((i*0.5, 2), (i*0.5+0.2, 2.4), stroke: 0.5pt + rgb("555555")) }
      content((2, 2.7), [*Mương*])
      line((0, 2), (0, 0), (2, 0), (2, 2), stroke: 1.5pt + blue)
      line((2, 0), (4, 0), (4, 2), stroke: 1.5pt + blue)
      content((-0.3, 1), [$x$])
      content((1, -0.4), [$y$])
      content((3, -0.4), [$y$])
    })
  ),
  loigiai: [
    #ppgiai[
      - Hai khu chung cạnh dài, mỗi khu rộng $y$ (song song mương), sâu $x$ (vuông góc mương).
      - Hàng rào gồm: $3$ cạnh $x$ (hai cạnh ngoài + vách giữa) và $2$ cạnh $y$.
      - $3x + 2y = 80$ → $y = (80 - 3x)/2$.
    ]
    #step[Đặt $x$ (m) là chiều sâu mỗi khu. Tổng rào: $3x + 2y = 80$. Điều kiện: $0 < x < 80/3$.]

    #step[Tổng diện tích: $S(x) = 2 dot.c x dot.c y = 2x dot.c (80 - 3x)/2 = x(80 - 3x) = 80x - 3x^2$.]

    #step[$S'(x) = 80 - 6x$. $S' = 0$ → $x = 40/3 approx.c 13.33$.]

    #align(center)[
      #bbt-opt(var: $x$, der: $S'$, func: $S$, x-vals: ($0$, $40/3$, $80/3$), d-signs: ($+$, $0$, $-$), v-vals: ($0$, $1600/3$, $0$), is-min: false)
    ]

    #step[$S_(max) = 1600/3 approx.c 533.33$ m². Mỗi khu rộng $x = 40/3$ m, dài $y = 20$ m, diện tích mỗi khu $= 400/3 approx.c 133.33$ m².]
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Có $200$ m hàng rào để quây một khu đất gồm một hình chữ nhật và một nửa hình tròn ở một đầu (như hình). Đầu nửa tròn không quây thêm bên trong (chỉ quây chu vi ngoài). Hỏi kích thước bao nhiêu để tổng diện tích lớn nhất?],
    canvas(length: 1.2cm, {
      import draw: *
      line((0, 0), (4, 0), (4, 2), (0, 2), stroke: 1.5pt + blue)
      let pts = ()
      for i in range(0, 31) {
        let a = i * 3.14159 / 30
        pts.push((2 + 2*calc.cos(a), 1 + 2*calc.sin(a)))
      }
      line(..pts, stroke: 1.5pt + blue)
      content((2, -0.4), [$x$])
      content((4.5, 1), [$x/2$])
    })
  ),
  loigiai: [
    #ppgiai[
      - Nửa tròn đường kính $y$ (cạnh HCN), HCN rộng $x$ (chiều dài).
      - Chu vi: $2x + y + pi y / 2 = 200$.
      - Diện tích: $S = xy + pi y^2 / 8$. Rút $y$ theo $x$ (hoặc ngược lại).
    ]
    #step[Gọi HCN có cạnh $x$ (dài) và $y$ (rộng). Nửa tròn đường kính $y$, bán kính $y/2$. \
    Chu vi hàng rào = $2x + y + (pi y)/2 = 2x + y(1 + pi/2) = 200$. \
    → $y = (200 - 2x) / (1 + pi/2)$. ĐK: $0 < x < 100$.]

    #step[Diện tích: $S(x) = x y + pi y^2 / 8$. Thay $y$ vào, khảo sát...]

    #luuy[Đây là bài toán mở rộng hay — kết quả tối ưu phụ thuộc vào tỉ lệ giữa phần chữ nhật và phần tròn.]
  ],
  theme-color: c-p1,
)

#topic([Hình Chữ Nhật Nội Tiếp], prefix: "Bài", theme-color: c-p1)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một hình chữ nhật nội tiếp trong nửa đường tròn bán kính $R = 6$ cm sao cho một cạnh nằm trên đường kính. Tìm kích thước hình chữ nhật để diện tích lớn nhất.],
    canvas(length: 0.9cm, {
      import draw: *
      let pts = ()
      for i in range(0, 61) {
        let a = i * 3.14159 / 60
        pts.push((6*calc.cos(a), 6*calc.sin(a)))
      }
      line(..pts, stroke: 1.5pt + blue)
      line((-6, 0), (6, 0), stroke: 1pt + black)
      let x = 4
      let y = calc.sqrt(36 - x*x)
      rect((-x, 0), (x, y), stroke: 1pt + red, fill: rgb("ff000033"))
      content((x, -0.4), [$x$])
      content((-x, -0.4), [$-x$])
      content((-6.3, 3), [$R$])
    })
  ),
  loigiai: [
    #ppgiai[Đặt tọa độ, dùng phương trình đường tròn $x^2 + y^2 = R^2$ để biểu diễn chiều cao theo chiều rộng.]

    #step[Gọi nửa chiều rộng là $x$ ($0 < x < R$). Từ PT đường tròn: $x^2 + y^2 = R^2$ → $y = sqrt(R^2 - x^2)$ (chiều cao).]

    #step[Diện tích HCN: $S(x) = 2x dot.c sqrt(R^2 - x^2)$. \
    Xét $f(x) = S(x)^2 = 4x^2(R^2 - x^2) = 4(R^2 x^2 - x^4)$.] 

    #step[$f'(x) = 4(2R^2 x - 4x^3) = 8x(R^2 - 2x^2)$. $f'(x) = 0$ → $x = R/sqrt(2)$.]

    #step[Với $R = 6$: $x = 6/sqrt(2) = 3 sqrt(2) approx.c 4.24$ cm, $y = sqrt(36 - 18) = 3 sqrt(2)$ cm. \
    HCN có kích thước $2x = 6 sqrt(2)$ cm và $y = 3 sqrt(2)$ cm. $S_(max) = 2x y = 36$ cm².]

    #nhanxet[HCN nội tiếp nửa đường tròn có diện tích lớn nhất khi tỉ lệ rộng:cao $= 2:1$.]
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một hình chữ nhật nội tiếp trong elip $(E): x^2/a^2 + y^2/b^2 = 1$ với các cạnh song song với trục tọa độ (với $a = 5$, $b = 3$). Tìm diện tích lớn nhất của hình chữ nhật đó.],
    canvas(length: 0.8cm, {
      import draw: *
      let pts = ()
      for i in range(0, 61) {
        let a = i * 6.28318 / 60
        pts.push((5*calc.cos(a), 3*calc.sin(a)))
      }
      line(..pts, stroke: 1.5pt + blue)
      line((-5.5, 0), (5.5, 0), mark: (end: ">"))
      line((0, -3.5), (0, 3.5), mark: (end: ">"))
      let x = 3.5; let y = 3*calc.sqrt(1 - x*x/25)
      rect((-x, -y), (x, y), stroke: 1pt + red, fill: rgb("ff000033"))
      content((x, 0.3), [$x$])
      content((0.3, y), [$y$])
    })
  ),
  loigiai: [
    #step[Gọi tọa độ đỉnh HCN góc phần tư thứ nhất là $(x; y)$ với $x > 0$, $y > 0$. Từ PT elip: $y = b sqrt(1 - x^2/a^2) = (b/a) sqrt(a^2 - x^2)$.]

    #step[Diện tích: $S(x) = 4xy = 4x dot.c (b/a) sqrt(a^2 - x^2) = (4b/a) x sqrt(a^2 - x^2)$.]

    #step[Xét $f(x) = S(x)^2 = (16b^2/a^2) x^2(a^2 - x^2)$. Cực đại khi $x^2 = a^2/2$ → $x = a/sqrt(2)$. Tương tự $y = b/sqrt(2)$.]

    #step[Với $a = 5$, $b = 3$: $S_(max) = 4 dot.c 5/sqrt(2) dot.c 3/sqrt(2) = 2ab = 30$.]

    #nhanxet[HCN nội tiếp elip có diện tích lớn nhất $S_(max) = 2ab$, đạt tại $x = a/sqrt(2)$, $y = b/sqrt(2)$.]
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một hình chữ nhật nội tiếp trong đường tròn bán kính $R = 10$ cm. Tìm diện tích lớn nhất của hình chữ nhật đó.],
    canvas(length: 0.8cm, {
      import draw: *
      circle((0, 0), radius: 2.5, stroke: 1.5pt + blue)
      let x = 1.8; let y = calc.sqrt(6.25 - x*x)
      line((-x, y), (x, y), (x, -y), (-x, -y), close: true, stroke: 1pt + red, fill: rgb("ff000033"))
      content((x+0.2, 0), [$x$])
      content((0, y+0.2), [$y$])
    })
  ),
  loigiai: [
    #step[Gọi nửa kích thước là $x$, $y$. Từ PT đường tròn: $x^2 + y^2 = R^2$. \
    Diện tích HCN: $S = 4xy$.]

    #step[Từ $x^2 + y^2 = R^2$, ta có $y = sqrt(R^2 - x^2)$. \
    $S(x) = 4x sqrt(R^2 - x^2)$. Xét $f(x) = S^2 = 16 x^2(R^2 - x^2) = 16(R^2 x^2 - x^4)$.]

    #step[$f'(x) = 16(2R^2 x - 4x^3) = 32x(R^2 - 2x^2)$. $f' = 0$ → $x = R/sqrt(2)$ → $y = R/sqrt(2)$.]

    #step[Với $R = 10$: $S_(max) = 4 dot.c 10/sqrt(2) dot.c 10/sqrt(2) = 200$ cm². Khi đó HCN là hình vuông cạnh $10 sqrt(2)$ cm.]

    #nhanxet[HCN nội tiếp đường tròn có diện tích lớn nhất khi là hình vuông. Đây là kết quả cổ điển!]
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một hình chữ nhật nội tiếp trong tam giác vuông có các cạnh góc vuông dài $6$ cm và $8$ cm, sao cho một đỉnh trùng đỉnh góc vuông của tam giác. Tìm diện tích lớn nhất của hình chữ nhật.],
    canvas(length: 0.9cm, {
      import draw: *
      line((0, 0), (4, 0), (0, 3), close: true, stroke: 1.5pt + blue)
      let x = 2.4
      let y = 3*(1 - x/4)
      rect((0, 0), (x, y), stroke: 1pt + red, fill: rgb("ff000033"))
      content((x+0.2, -0.3), [$x$])
      content((-0.6, y/2), [$y$])
      content((2, -0.5), [$8$])
      content((-0.5, 1.5), [$6$])
    })
  ),
  loigiai: [
    #step[Đặt tam giác vuông với cạnh góc vuông $6$ và $8$, cạnh huyền $10$ (tỉ lệ $3:4:5$). \
    Gọi HCN có chiều rộng $x$ (dọc cạnh $8$) và chiều cao $y$ (dọc cạnh $6$).]

    #step[Dùng tam giác đồng dạng: $y/6 = (8 - x)/8$ → $y = 6(1 - x/8) = (3/4)(8 - x)$.]

    #step[Diện tích: $S(x) = xy = x dot.c (3/4)(8 - x) = (3/4)(8x - x^2)$.]

    #step[$S'(x) = (3/4)(8 - 2x)$. $S' = 0$ → $x = 4$. \
    $S_(max) = S(4) = 4 dot.c (3/4) dot.c 4 = 12$ cm².]

    #nhanxet[HCN đạt diện tích max khi $x = 4$ (nửa cạnh $8$), $y = 3$ (nửa cạnh $6$). Diện tích max = nửa diện tích tam giác.]
  ],
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════════

#topic([Tam Giác — Tối Ưu Diện Tích & Chu Vi], prefix: "Bài", theme-color: c-p1)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Trong tất cả các tam giác vuông có cạnh huyền $10$ cm, tam giác nào có diện tích lớn nhất? Tính diện tích đó.],
    canvas(length: 0.8cm, {
      import draw: *
      circle((0, 0), radius: 2.5, stroke: 1pt + gray)
      line((-2.5, 0), (2.5, 0), stroke: 1pt + gray)
      let x = 3*calc.cos(45deg)*2.5/5; let y = 4*calc.sin(45deg)*2.5/5
      line((-2.5, 0), (x, y), (2.5, 0), close: true, stroke: 1.5pt + blue)
      content((0, -0.5), [$10$])
    }),
  ),
  loigiai: [
    #step[Gọi hai cạnh góc vuông là $x$, $y$ $(x, y > 0)$. Cạnh huyền $10$ → $x^2 + y^2 = 100$.]
    #step[Diện tích: $S = xy/2$. Ta cần max $xy$ với ràng buộc $x^2 + y^2 = 100$.]
    #step[Biểu diễn $y = sqrt(100 - x^2)$. $S(x) = x sqrt(100 - x^2)/2$. Xét $f = S^2 = x^2(100 - x^2)/4$. Cực đại khi $x^2 = 50$ → $x = 5 sqrt(2)$.]
    #step[$S_(max) = (5 sqrt(2) dot.c 5 sqrt(2))/2 = 25$ cm². Đạt khi tam giác vuông cân.]
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Trong tất cả các tam giác cân có chu vi $36$ cm, tam giác nào có diện tích lớn nhất?],
    canvas(length: 0.7cm, {
      import draw: *
      line((-2, -1.5), (0, 2.5), (2, -1.5), close: true, stroke: 1.5pt + blue)
      line((0, 2.5), (0, -1.5), stroke: (dash: "dashed", paint: gray))
      content((0.3, 0.5), [$h$])
      content((1, -1.8), [$a$])
    })
  ),
  loigiai: [
    #step[Gọi cạnh đáy $2x$, cạnh bên $y$. Chu vi: $2x + 2y = 36$ → $x + y = 18$.]
    #step[Chiều cao: $h = sqrt(y^2 - x^2) = sqrt((18-x)^2 - x^2) = sqrt(324 - 36x)$. Điều kiện: $0 < x < 9$.]
    #step[Diện tích: $S(x) = x dot.c h = x sqrt(324 - 36x) = 6x sqrt(9 - x)$. \
    $S'(x) = ...$ Cực đại khi $x = 6$.]
    #step[$S_(max) = 6 dot.c 6 dot.c sqrt(9-6) = 36 sqrt(3)$ cm². Tam giác đều!]

    #nhanxet[Trong các tam giác có chu vi không đổi, tam giác đều có diện tích lớn nhất. Đây là kết quả sâu sắc!]
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Trong tất cả các tam giác vuông nội tiếp đường tròn bán kính $R$, tìm tam giác có diện tích lớn nhất.],
    canvas(length: 0.7cm, {
      import draw: *
      circle((0, 0), radius: 2.2, stroke: 1.5pt + blue)
      line((-2.2, 0), (2.2, 0), stroke: 1pt + gray)
      line((-2.2, 0), (0, 2.2), (2.2, 0), stroke: 1.5pt + blue)
      content((0, -0.5), [$2R$])
    })
  ),
  loigiai: [
    #step[Cạnh huyền là đường kính = $2R$ (góc nội tiếp chắn nửa đường tròn là góc vuông).]
    #step[Gọi một cạnh góc vuông là $x$ $(0 < x < 2R)$. Cạnh còn lại $y = sqrt((2R)^2 - x^2)$.]
    #step[$S = xy/2 = x sqrt(4R^2 - x^2)/2$. Cực đại khi $x = R sqrt(2)$, $y = R sqrt(2)$.]
    #step[$S_(max) = R^2$. Tam giác vuông cân nội tiếp đường tròn có diện tích lớn nhất.]
  ],
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════════

#topic([Cắt Dây Thành Hình — Phân Phối Chu Vi], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  *Dạng tổng quát:* Một sợi dây dài $L$ được cắt thành $2$ (hoặc $n$) đoạn,
  mỗi đoạn uốn thành một hình. Tổng diện tích (hoặc chu vi...) được tối ưu.
  Đặt $x$ là chiều dài đoạn dây thứ nhất → đoạn còn lại $L - x$.
]

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một sợi dây dài $120$ cm được cắt thành hai đoạn. Đoạn thứ nhất uốn thành hình vuông, đoạn thứ hai uốn thành hình tròn. Hỏi phải cắt tại điểm nào để tổng diện tích hai hình là nhỏ nhất?],
    canvas(length: 0.9cm, {
      import draw: *
      rect((0, 0), (1.5, 1.5), stroke: 1.5pt + blue)
      circle((3, 0.75), radius: 0.75, stroke: 1.5pt + red)
      content((0.75, -0.3), [Vuông])
      content((3, -0.3), [Tròn])
      content((1.75, 0.75), [$+$])
    })
  ),
  loigiai: [
    #step[Gọi đoạn thứ nhất dài $x$ (cm), uốn thành hình vuông cạnh $x/4$, diện tích $S_1 = (x/4)^2 = x^2/16$. \
    Đoạn thứ hai dài $120 - x$, uốn thành hình tròn bán kính $r = (120 - x)/(2 pi)$, diện tích $S_2 = pi r^2 = (120 - x)^2/(4 pi)$.]

    #step[Tổng diện tích: $S(x) = x^2/16 + (120 - x)^2/(4 pi)$, với $x in (0; 120)$.]

    #step[$S'(x) = x/8 - (120 - x)/(2 pi)$. Cho $S' = 0$: $x/8 = (120 - x)/(2 pi)$ → $x pi = 4(120 - x)$ → $x = 480/(pi + 4)$.]

    #step[Nghiệm $x approx.c 67.2$ cm. $S''(x) = 1/8 + 1/(2 pi) > 0$ → cực tiểu. \
    Vậy cắt tại điểm cách đầu sợi dây $x = 480/(pi + 4) approx.c 67.2$ cm để tổng diện tích nhỏ nhất.]
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một sợi dây dài $L = 60$ cm được cắt thành hai đoạn bằng nhau. Đoạn thứ nhất uốn thành tam giác đều, đoạn thứ hai uốn thành hình vuông. Hỏi tổng diện tích bằng bao nhiêu? Phải cắt thế nào để tổng diện tích lớn nhất?],
    canvas(length: 0.9cm, {
      import draw: *
      line((0, 0), (1.2, 2.1), (2.4, 0), close: true, stroke: 1.5pt + blue)
      content((1.2, -0.3), [Đều])
      rect((3, 0.5), (4.5, 2), stroke: 1.5pt + red)
      content((3.75, -0.3), [Vuông])
    })
  ),
  loigiai: [
    #step[Gọi đoạn thứ nhất dài $x$ → tam giác đều cạnh $x/3$, diện tích $S_1 = (sqrt(3)/4)(x/3)^2 = (sqrt(3) x^2)/36$. \
    Đoạn thứ hai $60 - x$ → hình vuông cạnh $(60-x)/4$, $S_2 = (60-x)^2/16$.]

    #step[$S(x) = (sqrt(3)/36) x^2 + (60-x)^2/16$. Lấy đạo hàm, tìm cực trị...]

    #luuy[Kết quả tối ưu phụ thuộc vào độ "hiệu quả diện tích" của mỗi hình: hình tròn > hình vuông > tam giác đều (với cùng chu vi).]
  ],
  theme-color: c-p1,
)

#vd(
  [Một sợi dây dài $100$ cm. Hỏi nên cắt thành mấy đoạn và uốn thành hình gì để tổng diện tích là nhỏ nhất? (Gợi ý: tất cả dồn vào một hình tròn?)],
  loigiai: [
    #step[Với cùng chu vi, các hình có diện tích xếp theo thứ tự: tròn > vuông > tam giác đều > ... \
    Vậy để tổng diện tích *nhỏ* nhất, ta nên dùng hình có hiệu suất diện tích thấp nhất (tam giác đều) hoặc cắt thành nhiều đoạn nhỏ.]

    #step[Nếu cắt thành $n$ đoạn bằng nhau, mỗi đoạn uốn thành hình vuông cạnh $100/(4n)$: \
    $S(n) = n dot.c (100/(4n))^2 = 2500/n$. Khi $n$ tăng, $S$ giảm về $0$.]

    #nhanxet[Bài toán tổng quát: để cực tiểu tổng diện tích, ta chia dây thành vô hạn đoạn hoặc dùng hình có diện tích nhỏ nhất trên mỗi đơn vị chu vi.]
  ],
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════════

#topic([Gấp Hộp — Biến Thể Có Nắp & Hình Chữ Nhật], prefix: "Bài", theme-color: c-p1)

#vd(
  [
    Từ một tấm bìa hình vuông cạnh $a = 30$ cm, người ta cắt ở mỗi góc một hình vuông cạnh $x$ (cm), rồi gấp lên thành một chiếc hộp có nắp. Cần cắt $x$ bằng bao nhiêu để thể tích hộp lớn nhất?
    
    #v(0.5em)
    #align(center)[
      #canvas(length: 0.9cm, {
        import draw: *
        rect((0, 0), (4, 4), stroke: 1.5pt + blue)
        rect((0, 0), (0.8, 0.8), fill: rgb("dddddd"), stroke: 1pt + black)
        rect((3.2, 0), (4, 0.8), fill: rgb("dddddd"), stroke: 1pt + black)
        rect((0, 3.2), (0.8, 4), fill: rgb("dddddd"), stroke: 1pt + black)
        rect((3.2, 3.2), (4, 4), fill: rgb("dddddd"), stroke: 1pt + black)
        line((0.8, 0.8), (3.2, 0.8), stroke: (dash: "dashed", paint: black))
        line((0.8, 3.2), (3.2, 3.2), stroke: (dash: "dashed", paint: black))
        line((0.8, 0.8), (0.8, 3.2), stroke: (dash: "dashed", paint: black))
        line((3.2, 0.8), (3.2, 3.2), stroke: (dash: "dashed", paint: black))
        // Đường gập nắp giữa
        line((2, 3.2), (2, 4), stroke: (dash: "dashed", paint: red))
        content((2, -0.3), [$30$])
        content((0.4, 0.4), [$x$])
        content((2, 3.7), [*Nắp*])
      })
    ]
  ],
  loigiai: [
    #ppgiai[
      - Hộp có nắp: đáy là HCN $a-2x$ nhân $a/2 - x$, cao $x$.
      - Nắp được gấp từ phần bìa dư ra ở cạnh trên.
    ]

    #step[Đáy hộp có kích thước: cạnh đáy $= 30 - 2x$, cạnh kia (chiều sâu) $= 15 - x$ (vì nửa trên dùng làm nắp). \
    Chiều cao hộp $= x$. Điều kiện: $0 < x < 15$.]

    #step[Thể tích: $V(x) = x(30 - 2x)(15 - x) = x(450 - 60x + 2x^2) = 450x - 60x^2 + 2x^3$.]

    #step[$V'(x) = 450 - 120x + 6x^2 = 6(75 - 20x + x^2) = 6(x - 5)(x - 15)$. $V' = 0$ → $x = 5$ hoặc $x = 15$ (loại).]

    #align(center)[
      #bbt-opt(var: $x$, der: $V'(x)$, func: $V(x)$, x-vals: ($0$, $5$, $15$), d-signs: ($+$, $0$, $-$), v-vals: ($0$, $1000$, $0$), is-min: false)
    ]

    #step[$V_(max) = 5 dot.c 20 dot.c 10 = 1000$ cm³ tại $x = 5$ cm.]
  ],
  theme-color: c-p1,
)

#vd(
  [
    Từ một tấm bìa hình chữ nhật kích thước $40$ cm $times$ $25$ cm, cắt bỏ $4$ góc các hình vuông bằng nhau cạnh $x$ cm rồi gấp lên thành hộp không nắp. Tìm $x$ để thể tích hộp lớn nhất.
    
    #v(0.5em)
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        rect((0, 0), (4.5, 3), stroke: 1.5pt + blue)
        rect((0, 0), (0.7, 0.7), fill: rgb("dddddd"), stroke: 1pt + black)
        rect((3.8, 0), (4.5, 0.7), fill: rgb("dddddd"), stroke: 1pt + black)
        rect((0, 2.3), (0.7, 3), fill: rgb("dddddd"), stroke: 1pt + black)
        rect((3.8, 2.3), (4.5, 3), fill: rgb("dddddd"), stroke: 1pt + black)
        line((0.7, 0.7), (3.8, 0.7), stroke: (dash: "dashed", paint: black))
        line((0.7, 2.3), (3.8, 2.3), stroke: (dash: "dashed", paint: black))
        line((0.7, 0.7), (0.7, 2.3), stroke: (dash: "dashed", paint: black))
        line((3.8, 0.7), (3.8, 2.3), stroke: (dash: "dashed", paint: black))
        content((2.25, -0.3), [$40$])
        content((-0.5, 1.5), [$25$])
      })
    ]
  ],
  loigiai: [
    #ppgiai[
      - Đáy hộp: HCN $(40-2x) times (25-2x)$, cao $x$.
      - Điều kiện: $0 < x < 12.5$ (nửa cạnh ngắn hơn).
    ]

    #step[Thể tích: $V(x) = x(40 - 2x)(25 - 2x)$. Khai triển: $V(x) = 4x^3 - 130x^2 + 1000x$.]

    #step[$V'(x) = 12x^2 - 260x + 1000 = 4(3x^2 - 65x + 250)$. Giải $3x^2 - 65x + 250 = 0$: \
    $Delta = 65^2 - 4 dot.c 3 dot.c 250 = 4225 - 3000 = 1225 = 35^2$. \
    $x = (65 pm 35)/6$ → $x = 100/6 approx.c 16.67$ (loại) hoặc $x = 30/6 = 5$.]

    #align(center)[
      #bbt-opt(var: $x$, der: $V'(x)$, func: $V(x)$, x-vals: ($0$, $5$, $12.5$), d-signs: ($+$, $0$, $-$), v-vals: ($0$, $1500$, $0$), is-min: false)
    ]

    #step[$V_(max) = 5 dot.c 30 dot.c 15 = 2250$ cm³ tại $x = 5$ cm.]
  ],
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════════

#topic([Cửa Sổ & Máng Nước — Hình Ghép], prefix: "Bài", theme-color: c-p1)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một cửa sổ hình chữ nhật phía trên gắn thêm một nửa hình tròn (cửa sổ Norman). Chu vi cửa sổ là $P = 6$ m. Tìm kích thước để cửa sổ nhận được nhiều ánh sáng nhất.],
    canvas(length: 1cm, {
      import draw: *
      rect((0, 0), (3, 2), stroke: 1.5pt + blue)
      let pts = ()
      for i in range(0, 31) {
        let a = i * 3.14159 / 30
        pts.push((1.5 + 1.5*calc.cos(a), 2 + 1.5*calc.sin(a)))
      }
      line(..pts, stroke: 1.5pt + blue)
      content((1.5, -0.3), [$2r$])
      content((-0.5, 1), [$h$])
    })
  ),
  loigiai: [
    #step[Gọi bán kính nửa tròn là $r$, chiều cao phần chữ nhật là $h$. \
    Chu vi: nửa đường tròn $pi r$ + đáy $2r$ + hai cạnh $2h$ = $6$. → $2h + 2r + pi r = 6$ → $h = 3 - r - pi r/2$. \
    Điều kiện: $h > 0$ → $r < 6/(2 + pi) approx.c 1.17$.]

    #step[Diện tích (ánh sáng): $S(r) = "diện tích HCN" + "nửa tròn" = 2r h + pi r^2/2$. \
    Thay $h$: $S(r) = 2r(3 - r - pi r/2) + pi r^2/2 = 6r - 2r^2 - pi r^2 + pi r^2/2 = 6r - 2r^2 - (pi/2) r^2$.]

    #step[$S'(r) = 6 - 4r - pi r$. $S' = 0$ → $r = 6/(4 + pi) approx.c 0.84$ m. \
    $h = 3 - 0.84 - pi dot.c 0.84/2 approx.c 0.84$ m. \
    $S_(max) approx.c ...$ m².]
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một máng xối nước được làm từ tấm tôn rộng $30$ cm bằng cách gấp hai mép lên với góc vuông. Tìm chiều cao gấp lên để tiết diện máng (lượng nước chảy qua) lớn nhất.],
    canvas(length: 0.9cm, {
      import draw: *
      line((0, 1.5), (4, 1.5), stroke: 1.5pt + blue)
      line((0, 1.5), (0, 2.5), stroke: 1.5pt + blue)
      line((4, 1.5), (4, 2.5), stroke: 1.5pt + blue)
      line((0, 2.5), (4, 2.5), stroke: (dash: "dashed", paint: gray))
      content((0, 2.8), [$x$])
      content((4, 2.8), [$x$])
      content((2, 1.2), [$30 - 2x$])
    })
  ),
  loigiai: [
    #step[Gọi chiều cao gấp lên là $x$ (cm). Đáy máng dài $30 - 2x$ (cm). Điều kiện $0 < x < 15$.]
    #step[Tiết diện: $S(x) = x(30 - 2x) = 30x - 2x^2$.]
    #step[$S'(x) = 30 - 4x$. $S' = 0$ → $x = 7.5$ cm. $S_(max) = 7.5 times 15 = 112.5$ cm².]
  ],
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════════

#topic([Lon Nước & Hình Trụ — Tối Ưu Vật Liệu], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  *Hình trụ:* $V = pi r^2 h$, $S_(tp) = 2 pi r^2 + 2 pi r h$ (có nắp). \
  $S_(xq) = 2 pi r h$, $S_(kn) = pi r^2 + 2 pi r h$ (không nắp).
]

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một nhà máy sản xuất lon nước hình trụ có thể tích $V = 330$ ml. Tìm bán kính đáy và chiều cao để tiết kiệm vật liệu nhất (lon có nắp).],
    canvas(length: 0.7cm, {
      import draw: *
      line((0.5, 2), (2.5, 0.5), (4.5, 2), (4.5, 3), (2.5, 4.5), (0.5, 3), close: true, stroke: 1.5pt + blue)
      line((0.5, 3), (2.5, 1.5), (4.5, 3), stroke: 1.5pt + blue)
      line((2.5, 0.5), (2.5, 1.5), stroke: 1pt + gray)
      content((2.5, 1), [$h$])
      content((1.2, 2.5), [$r$])
    })
  ),
  loigiai: [
    #step[$V = pi r^2 h = 330$ → $h = 330/(pi r^2)$. Diện tích toàn phần (có nắp): $S = 2 pi r^2 + 2 pi r h$.]
    #step[Thay $h$: $S(r) = 2 pi r^2 + 2 pi r dot.c 330/(pi r^2) = 2 pi r^2 + 660/r$.]
    #step[$S'(r) = 4 pi r - 660/r^2$. $S' = 0$ → $4 pi r^3 = 660$ → $r = root(3, 165/pi) approx.c 3.74$ cm. \
    $h = 330/(pi r^2) = ... approx.c 7.49$ cm.]

    #nhanxet[Lon tiết kiệm nhất khi $h = 2r$ (chiều cao = đường kính đáy). Đây là kết quả cổ điển!]
  ],
  theme-color: c-p1,
)

#vd(
  [
    Một hộp sữa hình trụ không nắp, thể tích $1$ lít. Tìm bán kính đáy để tiết kiệm vật liệu nhất.
  ],
  loigiai: [
    #step[$V = pi r^2 h = 1000$ cm³ → $h = 1000/(pi r^2)$. Không nắp nên $S = pi r^2 + 2 pi r h$.]
    #step[$S(r) = pi r^2 + 2 pi r dot.c 1000/(pi r^2) = pi r^2 + 2000/r$.]
    #step[$S'(r) = 2 pi r - 2000/r^2$. $S'=0$ → $r = root(3, 1000/pi) approx.c 6.83$ cm. $h = 1000/(pi r^2) approx.c 6.83$ cm.]

    #nhanxet[Hộp không nắp tiết kiệm nhất khi $h = r$ (chiều cao = bán kính đáy).]
  ],
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════════

#topic([Tối Ưu Khoảng Cách — Hình Học Tọa Độ], prefix: "Bài", theme-color: c-p1)

#vd(
  [
    Trên parabol $y = x^2$, tìm điểm $M$ có hoành độ dương sao cho tổng khoảng cách từ $M$ đến hai điểm $A(0; 1)$ và $B(0; 4)$ là nhỏ nhất.
  ],
  loigiai: [
    #step[Gọi $M(t; t^2)$ với $t > 0$.]
    #step[$d_1 = sqrt(t^2 + (t^2 - 1)^2)$, $d_2 = sqrt(t^2 + (t^2 - 4)^2)$. Hàm tổng $f(t) = d_1 + d_2$.]
    #step[Bài toán tối ưu khoảng cách — có thể dùng bất đẳng thức hoặc đạo hàm. Điểm tối ưu thường là giao của trục đối xứng.]
  ],
  theme-color: c-p1,
)

#vd(
  [
    Trên đường thẳng $d: x + y - 2 = 0$, tìm điểm $M$ sao cho diện tích tam giác tạo bởi $M$ và hai điểm $A(0; 0)$, $B(2; 0)$ là nhỏ nhất.
  ],
  loigiai: [
    #step[M thuộc $d$ → $y = 2 - x$. Tam giác $MAB$ có đáy $AB = 2$ (trên $Ox$).]
    #step[Chiều cao từ $M$ đến $AB$ (trục $Ox$) = $|y_M| = |2 - x|$. Diện tích $S = (1/2) dot.c 2 dot.c |2 - x| = |2 - x|$.]
    #step[$S$ nhỏ nhất khi $|2 - x|$ nhỏ nhất → $x = 2$. Khi đó $M$ trùng $B$, $S = 0$ (suy biến). \
    Tuy nhiên bài toán thực tế cần điều kiện khoảng cách dương.]
  ],
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════════
// ─── BÀI TẬP TỔNG HỢP ──────────────────────────────────────────
// ════════════════════════════════════════════════════════════════
#bt-header(c-p1)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Toàn bộ chủ đề tối ưu hình phẳng], c-p1)

// ─── CÂU TN ────────────────────────────────────────────────────

#tn(
  [Một sợi dây dài $100$ cm được cắt thành hai đoạn, một đoạn uốn thành hình vuông, đoạn kia uốn thành hình tròn. Gọi $x$ (cm) là độ dài đoạn uốn thành hình vuông. Tổng diện tích hai hình là hàm số $S(x)$. Khi đó $S(x)$ đạt giá trị nhỏ nhất tại $x$ bằng?],
  ([$100 pi / (4 + pi)$], [$400 / (4 + pi)$], [$400 pi / (4 + pi)$], [$100 / (4 + pi)$]),
  correct: 2,
  theme-color: c-p1,
)

#tn(
  [Một tấm bìa hình chữ nhật kích thước $30$ cm $times$ $20$ cm. Cắt $4$ góc các hình vuông cạnh $x$ (cm) rồi gấp lên thành hộp không nắp. Thể tích lớn nhất của hộp *gần nhất* với giá trị nào sau đây?],
  ([$900$ cm³], [$1000$ cm³], [$1056$ cm³], [$1200$ cm³]),
  correct: 3,
  theme-color: c-p1,
)

#tn(
  [Hình chữ nhật nội tiếp nửa đường tròn bán kính $R = 4$ có diện tích lớn nhất bằng bao nhiêu?],
  ([$8$], [$16$], [$12$], [$32$]),
  correct: 2,
  theme-color: c-p1,
)

#tn(
  [Người ta muốn rào một khu vườn HCN có diện tích $800$ m². Để tiết kiệm chi phí rào nhất, tỉ số giữa chiều dài và chiều rộng của khu vườn là?],
  ([$3:2$], [$1:1$], [$2:1$], [$4:3$]),
  correct: 2,
  theme-color: c-p1,
)

#tn(
  [Một chiếc hộp hình trụ không nắp có thể tích $V$ cố định. Để tiết kiệm vật liệu nhất, tỉ số $h/r$ bằng?],
  ([$1$], [$2$], [$1/2$], [$sqrt(2)$]),
  correct: 1,
  theme-color: c-p1,
)

#tn(
  [Cửa sổ Norman gồm HCN + nửa tròn phía trên, chu vi $6$ m. Bán kính nửa tròn để diện tích cửa sổ lớn nhất là?],
  ([$6/pi$], [$6/(4+pi)$], [$6/(2+pi)$], [$12/pi$]),
  correct: 2,
  theme-color: c-p1,
)

#tn(
  [Từ tấm tôn rộng $60$ cm, gấp hai mép thành máng nước tiết diện chữ U. Để tiết diện lớn nhất, mỗi mép gấp lên bao nhiêu cm?],
  ([$10$], [$15$], [$20$], [$12$]),
  correct: 2,
  theme-color: c-p1,
)

#tn(
  [Trong các tam giác vuông có cạnh huyền $10$, diện tích lớn nhất là?],
  ([$20$], [$25$], [$30$], [$50$]),
  correct: 2,
  theme-color: c-p1,
)

#tn(
  [HCN nội tiếp elip $x^2/25 + y^2/9 = 1$ có diện tích lớn nhất là?],
  ([$15$], [$30$], [$45$], [$60$]),
  correct: 2,
  theme-color: c-p1,
)

#tn(
  [Một nhà vườn có $L$ mét hàng rào, muốn quây khu đất HCN sát tường và chia thành $n$ ngăn song song với tường. Để diện tích lớn nhất, chiều rộng (vuông góc tường) bằng?],
  ([$L/(2n)$], [$L/(n+1)$], [$L/(2(n+1))$], [$L/(2n+1)$]),
  correct: 3,
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════════

#q-label([B. ĐÚNG – SAI — Xét tính đúng/sai của mỗi phát biểu], c-p1)
#resetexamstate()

#ds(
  [Về bài toán tối ưu diện tích hình chữ nhật nội tiếp nửa đường tròn bán kính $R$:],
  (
    True([Chiều rộng HCN lớn nhất là $2R$.]),
    True([Chiều cao HCN là $h = sqrt(R^2 - x^2)$ với $x$ là nửa chiều rộng.]),
    [Diện tích HCN lớn nhất đạt được khi $x = R/2$.],
    [Diện tích lớn nhất là $S_(max) = R^2$.],
  ),
  theme-color: c-p1,
)

#ds(
  [Về bài toán cắt dây thành hình vuông và hình tròn:],
  (
    [Tổng diện tích luôn đạt cực tiểu khi hai đoạn dây bằng nhau.],
    [Tổng diện tích đạt cực tiểu là bài toán tìm min của hàm bậc hai.],
    True([Nếu dồn hết dây vào một hình tròn, diện tích sẽ lớn hơn dồn hết vào hình vuông (cùng chu vi).]),
    True([Hàm tổng diện tích $S(x)$ là hàm bậc hai có hệ số $a > 0$ nên có cực tiểu duy nhất.]),
  ),
  theme-color: c-p1,
)

#ds(
  [Về bài toán tối ưu thể tích hộp gấp từ tấm bìa vuông:],
  (
    True([Thể tích hộp $V(x) = x(a - 2x)^2$ đạt cực đại tại $x = a/6$.]),
    [Hộp không nắp có thể tích lớn nhất khi $x = a/4$.],
    True([Hàm $V(x)$ xác định trên khoảng $(0; a/2)$.]),
    [Với $a = 30$ cm, thể tích lớn nhất là $2000$ cm³.],
  ),
  theme-color: c-p1,
)

#ds(
  [Về bài toán tối ưu hình trụ:],
  (
    True([Lon nước có nắp tiết kiệm vật liệu nhất khi $h = 2r$.]),
    True([Lon không nắp tiết kiệm vật liệu nhất khi $h = r$.]),
    [Với thể tích cố định, diện tích toàn phần là hàm đồng biến theo $r$.],
    [Thể tích lon nước $V = pi r h$.],
  ),
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════════

#q-label([C. TỰ LUẬN NGẮN — Ghi đáp số vào ô trống], c-p1)
#resetexamstate()

#tln(
  [Một sợi dây dài $120$ cm cắt thành hai đoạn, uốn thành hình vuông và hình tròn. Tổng diện tích nhỏ nhất là bao nhiêu cm²? (làm tròn đến chữ số thập phân thứ nhất)]
  answer: [$504.8$],
  theme-color: c-p1,
)

#tln(
  [Từ tấm bìa vuông cạnh $24$ cm, gấp hộp không nắp. Thể tích lớn nhất là bao nhiêu cm³?],
  answer: [$1024$],
  theme-color: c-p1,
)

#tln(
  [HCN nội tiếp parabol $y = 4 - x^2$ (cạnh đáy trên $Ox$). Diện tích lớn nhất của HCN là bao nhiêu?]
  answer: [$32 sqrt(3) / 3$],
  theme-color: c-p1,
)

#tln(
  [Rào vườn HCN diện tích $600$ m². Một cạnh giáp sông không rào. Chiều dài tối thiểu của hàng rào là bao nhiêu mét?]
  answer: [$20 sqrt(6)$],
  theme-color: c-p1,
)

#tln(
  [Máng nước tiết diện chữ U làm từ tôn rộng $40$ cm. Tiết diện lớn nhất là bao nhiêu cm²?]
  answer: [$200$],
  theme-color: c-p1,
)

#tln(
  [Lon nước hình trụ không nắp, thể tích $500$ ml. Diện tích vật liệu tối thiểu là bao nhiêu cm²? (làm tròn đến hàng đơn vị)]
  answer: [$327$],
  theme-color: c-p1,
)

#het
