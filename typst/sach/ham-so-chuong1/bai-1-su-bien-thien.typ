#import "_config.typ": *

#lesson([Bài 1. Sự biến thiên của hàm số], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([1. Khái niệm về tính đơn điệu của hàm số])
#block(breakable: false)[
  #dn(title: [Định nghĩa])[
    Kí hiệu $K$ là một khoảng, một đoạn hoặc một nửa khoảng. Giả sử hàm số $y = f(x)$ xác định trên $K$.
    
    Hàm số $y = f(x)$ được gọi là:
    - *Đồng biến* (tăng) trên $K$ nếu với mọi $x_1, x_2 in K$, $x_1 < x_2 => f(x_1) < f(x_2)$.
    - *Nghịch biến* (giảm) trên $K$ nếu với mọi $x_1, x_2 in K$, $x_1 < x_2 => f(x_1) > f(x_2)$.
    
    Hàm số đồng biến hoặc nghịch biến trên $K$ được gọi chung là hàm số *đơn điệu* trên $K$.
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Chú ý])[
    - Về mặt đồ thị: 
      + Nếu hàm số đồng biến trên $K$ thì đồ thị của nó có hướng *đi lên* từ trái sang phải (Hình 1a).
      + Nếu hàm số nghịch biến trên $K$ thì đồ thị của nó có hướng *đi xuống* từ trái sang phải (Hình 1b).

    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 20pt,
      align: center,
      [
        #canvas(length: 0.65cm, {
          import draw: *
          // Trục lưới nền nhạt
          for x in range(1, 6) {
            line((x, -0.2), (x, 4.2), stroke: 0.25pt + gray.lighten(70%))
          }
          for y in range(1, 5) {
            line((-0.2, y), (5.2, y), stroke: 0.25pt + gray.lighten(70%))
          }

          // Trục tọa độ
          line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt + black)
          line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt + black)
          content((5.5, -0.35), [$x$])
          content((0.35, 4.5), [$y$])
          content((-0.25, -0.25), [$O$])

          // Đồ thị hàm số đồng biến (đường cong mịn bậc hai)
          let pts = ()
          let n = 40
          let xmin = 1.2
          let xmax = 4.5
          for i in range(n + 1) {
            let x = xmin + i * (xmax - xmin) / n
            let y = 0.8 + (x - xmin) * 0.4 + 0.16 * calc.pow(x - xmin, 2)
            pts.push((x, y))
          }
          line(..pts, stroke: 1.5pt + c-book)

          // Đường dóng từ hai đầu mút
          line((xmin, 0), (xmin, 0.8), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
          line((xmax, 0), (xmax, 0.8 + (xmax - xmin) * 0.4 + 0.16 * calc.pow(xmax - xmin, 2)), stroke: (
            paint: gray,
            thickness: 0.5pt,
            dash: "dashed",
          ))

          // Điểm biểu diễn hai đầu mút
          circle((xmin, 0.8), radius: 1.8pt, fill: c-book)
          circle((xmax, 0.8 + (xmax - xmin) * 0.4 + 0.16 * calc.pow(xmax - xmin, 2)), radius: 1.8pt, fill: c-book)

          content((2.8, 2.5), [$y = f(x)$])

          // Biểu diễn tập K
          line((xmin, -0.4), (xmax, -0.4), mark: (start: ">", end: ">", fill: black), stroke: 0.6pt + black)
          content(((xmin + xmax) / 2, -0.75), [$K$])
        })
        #v(0.3em)
        *Hình 1a: Hàm số đồng biến*
      ],
      [
        #canvas(length: 0.65cm, {
          import draw: *
          // Trục lưới nền nhạt
          for x in range(1, 6) {
            line((x, -0.2), (x, 4.2), stroke: 0.25pt + gray.lighten(70%))
          }
          for y in range(1, 5) {
            line((-0.2, y), (5.2, y), stroke: 0.25pt + gray.lighten(70%))
          }

          // Trục tọa độ
          line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt + black)
          line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt + black)
          content((5.5, -0.35), [$x$])
          content((0.35, 4.5), [$y$])
          content((-0.25, -0.25), [$O$])

          // Đồ thị hàm số nghịch biến (đường cong mịn nghịch biến)
          let pts = ()
          let n = 40
          let xmin = 1.2
          let xmax = 4.5
          for i in range(n + 1) {
            let x = xmin + i * (xmax - xmin) / n
            let y = 3.86 - (x - xmin) * 0.4 - 0.16 * calc.pow(x - xmin, 2)
            pts.push((x, y))
          }
          line(..pts, stroke: 1.5pt + rgb("#cc2200"))

          // Đường dóng từ hai đầu mút
          line((xmin, 0), (xmin, 3.86), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
          line((xmax, 0), (xmax, 3.86 - (xmax - xmin) * 0.4 - 0.16 * calc.pow(xmax - xmin, 2)), stroke: (
            paint: gray,
            thickness: 0.5pt,
            dash: "dashed",
          ))

          // Điểm biểu diễn hai đầu mút
          circle((xmin, 3.86), radius: 1.8pt, fill: rgb("#cc2200"))
          circle(
            (xmax, 3.86 - (xmax - xmin) * 0.4 - 0.16 * calc.pow(xmax - xmin, 2)),
            radius: 1.8pt,
            fill: rgb("#cc2200"),
          )

          content((2.8, 3.1), [$y = f(x)$])

          // Biểu diễn tập K
          line((xmin, -0.4), (xmax, -0.4), mark: (start: ">", end: ">", fill: black), stroke: 0.6pt + black)
          content(((xmin + xmax) / 2, -0.75), [$K$])
        })
        #v(0.3em)
        *Hình 1b: Hàm số nghịch biến*
      ],
    )
  ]
]

#muc([2. Mối liên hệ giữa đạo hàm và sự biến thiên])
#block(breakable: false)[
  #dl(title: [Định lý])[
    Cho hàm số $y = f(x)$ có đạo hàm trên $K$.
    - Nếu $f'(x) > 0$ với mọi $x in K$ thì hàm số $y = f(x)$ đồng biến trên $K$.
    - Nếu $f'(x) < 0$ với mọi $x in K$ thì hàm số $y = f(x)$ nghịch biến trên $K$.
  ]
]

#block(breakable: false)[
  #ghinho(title: [★ Định lý mở rộng])[
    Giả sử hàm số $y = f(x)$ có đạo hàm trên $K$.
    - Nếu $f'(x) >= 0$ với mọi $x in K$ và $f'(x) = 0$ chỉ tại *một số hữu hạn điểm* thì hàm số đồng biến trên $K$.
    - Nếu $f'(x) <= 0$ với mọi $x in K$ và $f'(x) = 0$ chỉ tại *một số hữu hạn điểm* thì hàm số nghịch biến trên $K$.
    - Nếu $f'(x) = 0$ với mọi $x in K$ thì hàm số không đổi (hàm hằng) trên $K$.
  ]
]

#muc([3. Quy tắc xét tính đơn điệu của hàm số])
#block(breakable: false)[
  #phuongphap(title: [Sơ đồ 4 bước xét tính đơn điệu])[
    #align(center)[
      #box(fill: c-book, radius: 4pt, inset: 8pt, width: 80%)[#text(fill: white, weight: "bold")[① BƯỚC 1: Tìm Tập xác định $D$ của hàm số]]
      
      #v(0.1em)
      #text(fill: gray, size: 14pt)[▼]
      #v(0.1em)
      
      #box(fill: c-book, radius: 4pt, inset: 8pt, width: 80%)[
        #text(fill: white, weight: "bold")[② BƯỚC 2: Tính đạo hàm $y'$] \
        #text(fill: white.transparentize(20%), size: 9pt)[Giải phương trình $y' = 0$ hoặc tìm các điểm $y'$ không xác định]
      ]
      
      #v(0.1em)
      #text(fill: gray, size: 14pt)[▼]
      #v(0.1em)
      
      #box(fill: c-book, radius: 4pt, inset: 8pt, width: 80%)[
        #text(fill: white, weight: "bold")[③ BƯỚC 3: Lập Bảng biến thiên] \
        #text(fill: white.transparentize(20%), size: 9pt)[Sắp xếp các nghiệm tăng dần và xét dấu $y'$. (Quy tắc đan dấu, trong trái ngoài cùng,...)]
      ]
      
      #v(0.1em)
      #text(fill: gray, size: 14pt)[▼]
      #v(0.1em)
      
      #box(fill: rgb("#b91c1c"), radius: 4pt, inset: 8pt, width: 80%)[
        #text(fill: white, weight: "bold")[④ BƯỚC 4: Kết luận] \
        #text(fill: white.transparentize(20%), size: 9pt)[Khoảng có $y' > 0$ (mũi tên lên) là Đồng biến. Khoảng có $y' < 0$ (mũi tên xuống) là Nghịch biến.]
      ]
    ]
  ]
]

#pagebreak()
#q-label([B. CÁC VÍ DỤ TỪ DỄ ĐẾN KHÓ], c-book)

#vd(
  [Xét sự biến thiên của hàm đa thức bậc ba: $y = x^3 - 3x^2 + 1$.],
  loigiai: [
    #ppgiai[
      - Hàm đa thức luôn xác định trên $RR$.
      - Tính đạo hàm $y'$, giải phương trình $y' = 0$ để tìm điểm tới hạn.
      - Lập bảng biến thiên và đọc kết luận.
    ]
    
    #step[Tập xác định: $D = RR$.]
    
    #step[Tính đạo hàm: $y' = 3x^2 - 6x$.
      Cho $y' = 0 <=> 3x^2 - 6x = 0 <=> 3x(x - 2) = 0 <=> x = 0$ hoặc $x = 2$.]
      
    #step[Bảng biến thiên:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $y'$,
          func: $y$,
          x-vals: ($-oo$, $0$, $2$, $+oo$),
          d-signs: ($+$, $0$, $-$, $0$, $+$),
          v-vals: ($-oo$, $1$, $-3$, $+oo$),
        )
      ]
    ]
    
    #step[Kết luận:
      - Hàm số đồng biến trên các khoảng $(-oo; 0)$ và $(2; +oo)$ (do $y' > 0$).
      - Hàm số nghịch biến trên khoảng $(0; 2)$ (do $y' < 0$).]
    #resetstep()
  ],
  theme-color: c-book,
)

#vd(
  [Xét sự biến thiên của hàm số chứa căn: $y = sqrt(x^2 + 1)$.],
  loigiai: [
    #ppgiai[
      - Tìm điều kiện xác định. Với bài này $x^2 + 1 > 0$ luôn đúng.
      - Áp dụng công thức đạo hàm hàm hợp: $(sqrt(u))' = frac(u', 2sqrt(u))$.
      - Giải phương trình $y' = 0$ và lập bảng biến thiên.
    ]
    
    #step[Tập xác định: Vì $x^2 + 1 > 0$ với mọi $x in RR$ nên hàm số xác định trên toàn bộ trục số.
      Vậy $D = RR$.]
    
    #step[Tính đạo hàm: 
      $y' = frac((x^2 + 1)', 2sqrt(x^2 + 1)) = frac(2x, 2sqrt(x^2 + 1)) = frac(x, sqrt(x^2 + 1))$.
      
      Cho $y' = 0 <=> x = 0$.]
      
    #step[Tính giá trị của hàm số: $y(0) = sqrt(0^2 + 1) = 1$.]
      
    #step[Bảng biến thiên:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $y'$,
          func: $y$,
          x-vals: ($-oo$, $0$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $1$, $+oo$),
        )
      ]
      *(Mẹo xét dấu: Do mẫu số $sqrt(x^2 + 1) > 0$ nên dấu của $y'$ hoàn toàn phụ thuộc vào dấu của tử số $x$.)*
    ]
    
    #step[Kết luận:
      - Hàm số nghịch biến trên khoảng $(-oo; 0)$.
      - Hàm số đồng biến trên khoảng $(0; +oo)$.]
    #resetstep()
  ],
  theme-color: c-book,
)

#vd(
  [Xét sự biến thiên của hàm phân thức: $y = frac(2x - 1, x + 1)$.],
  loigiai: [
    #ppgiai[
      - Tìm điều kiện để mẫu số khác $0$.
      - Dùng công thức đạo hàm nhanh $(frac(a x + b, c x + d))' = frac(a d - b c, (c x + d)^2)$.
      - Hàm phân thức bậc nhất trên bậc nhất không bao giờ có $y' = 0$, nó luôn mang một dấu trên từng khoảng xác định.
    ]
    
    #step[Tập xác định: Hàm số có nghĩa khi $x + 1 != 0 <=> x != -1$. 
      Vậy $D = RR backslash {-1}$.]
    
    #step[Tính đạo hàm: 
      $y' = frac(2 dot.c 1 - (-1) dot.c 1, (x + 1)^2) = frac(3, (x + 1)^2)$.]
      
    #step[Nhận xét: Vì $3 > 0$ và $(x+1)^2 > 0$ với mọi $x != -1$ nên $y' > 0, forall x != -1$.]
      
    #step[Bảng biến thiên:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $y'$,
          func: $y$,
          x-vals: ($-oo$, $-1$, $+oo$),
          d-signs: ($+$, $||$, $+$),
          v-vals: ($2$, $||$, $2$),
        )
      ]
      *(Chú ý: Dấu $||$ thể hiện hàm số và đạo hàm không xác định tại $x = -1$.)*
    ]
    
    #step[Kết luận: Hàm số đồng biến trên từng khoảng $(-oo; -1)$ và $(-1; +oo)$.
      *Lưu ý rất quan trọng:* Tuyệt đối không được kết luận hàm số đồng biến trên $RR backslash {-1}$ hoặc $(-oo; -1) union (-1; +oo)$.]
    #resetstep()
  ],
  theme-color: c-book,
)

#vd(
  [Xét sự biến thiên của hàm số chứa căn: $y = sqrt(4 - x^2)$.],
  loigiai: [
    #ppgiai[
      - Hàm chứa căn bậc chẵn xác định khi biểu thức trong căn không âm.
      - Sử dụng quy tắc đạo hàm hàm hợp: $(sqrt(u))' = frac(u', 2sqrt(u))$.
      - Giải phương trình $y' = 0$ và chú ý điều kiện của $y'$.
    ]
    
    #step[Tập xác định: Hàm số xác định khi $4 - x^2 >= 0 <=> -2 <= x <= 2$.
      Vậy $D = [-2; 2]$.]
      
    #step[Tính đạo hàm: 
      $y' = frac((4 - x^2)', 2sqrt(4 - x^2)) = frac(-2x, 2sqrt(4 - x^2)) = frac(-x, sqrt(4 - x^2))$.
      
      Hàm số có đạo hàm trên khoảng $(-2; 2)$. Tại $x = +-2$, đạo hàm không xác định vì mẫu số bằng $0$.]
      
    #step[Cho $y' = 0 <=> -x = 0 <=> x = 0$ (thuộc khoảng $(-2; 2)$).
      Tính giá trị: $y(-2) = 0$, $y(0) = 2$, $y(2) = 0$.]
      
    #step[Bảng biến thiên:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $y'$,
          func: $y$,
          x-vals: ($-2$, $0$, $2$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $2$, $0$),
        )
      ]
    ]
    
    #step[Kết luận:
      - Hàm số đồng biến trên khoảng $(-2; 0)$.
      - Hàm số nghịch biến trên khoảng $(0; 2)$.]
    #resetstep()
  ],
  theme-color: c-book,
)
#vd(
  [Xét sự biến thiên của hàm số bậc bốn: $y = x^4 - 2x^2 + 3$.],
  loigiai: [
    #ppgiai[
      - Tập xác định là $RR$.
      - Tính đạo hàm, phân tích thành nhân tử để giải phương trình $y' = 0$.
      - Lập bảng biến thiên với $3$ nghiệm của đạo hàm.
    ]
    
    #step[Tập xác định: $D = RR$.]
    
    #step[Tính đạo hàm: 
      $y' = 4x^3 - 4x = 4x(x^2 - 1)$.
      
      Cho $y' = 0 <=> 4x(x^2 - 1) = 0 <=> x = 0$ hoặc $x = -1$ hoặc $x = 1$.]
      
    #step[Tính giá trị của hàm số: $y(-1) = 2$, $y(0) = 3$, $y(1) = 2$.]
      
    #step[Bảng biến thiên:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $y'$,
          func: $y$,
          x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
          d-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$),
          v-vals: ($+oo$, $2$, $3$, $2$, $+oo$),
        )
      ]
    ]
    
    #step[Kết luận:
      - Hàm số đồng biến trên các khoảng $(-1; 0)$ và $(1; +oo)$.
      - Hàm số nghịch biến trên các khoảng $(-oo; -1)$ và $(0; 1)$.]
    #resetstep()
  ],
  theme-color: c-book,
)

#vd(
  [Xét sự biến thiên của hàm phân thức: $y = frac(x^2 - 2x + 2, x - 1)$.],
  loigiai: [
    #ppgiai[
      - Dạng hàm phân thức bậc hai trên bậc nhất rất quan trọng trong chương trình mới.
      - Áp dụng công thức đạo hàm $y' = frac(u' v - u v', v^2)$.
      - Điểm làm mẫu bằng $0$ (tức $x=1$) là điểm không xác định, phải đưa vào bảng biến thiên bằng dấu $||$.
    ]
    
    #step[Tập xác định: Hàm số có nghĩa khi $x - 1 != 0 <=> x != 1$. 
      Vậy $D = RR backslash {1}$.]
      
    #step[Tính đạo hàm: 
      $y' = frac((2x - 2)(x - 1) - (x^2 - 2x + 2) dot.c 1, (x - 1)^2) = frac(2x^2 - 4x + 2 - x^2 + 2x - 2, (x - 1)^2) = frac(x^2 - 2x, (x - 1)^2)$.
      
      Cho $y' = 0 <=> x^2 - 2x = 0 <=> x = 0$ hoặc $x = 2$.]
      
    #step[Tính các giá trị: $y(0) = -2$, $y(2) = 2$. Tại $x = 1$ hàm số và đạo hàm không xác định.]
      
    #step[Bảng biến thiên:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $y'$,
          func: $y$,
          x-vals: ($-oo$, $0$, $1$, $2$, $+oo$),
          d-signs: ($+$, $0$, $-$, $||$, $-$, $0$, $+$),
          v-vals: ($-oo$, $-2$, $-oo$, $+oo$, $2$, $+oo$),
        )
      ]
    ]
    
    #step[Kết luận:
      - Hàm số đồng biến trên các khoảng $(-oo; 0)$ và $(2; +oo)$.
      - Hàm số nghịch biến trên các khoảng $(0; 1)$ và $(1; 2)$.]
    #resetstep()
  ],
  theme-color: c-book,
)

#pagebreak()
#q-label([C. ĐỀ LUYỆN TẬP CƠ BẢN], c-book)
#resetexamstate()

#muc([I. Câu trắc nghiệm nhiều phương án lựa chọn])

#tn(
  [Hàm số nào dưới đây đồng biến trên $RR$?],
  (
    [$y = x^2 + 2x$],
    True([$y = x^3 + 3x$]),
    [$y = frac(x - 1, x + 2)$],
    [$y = -x^3 + 2x^2 - x$]
  ),
  accent: c-book,
  loigiai: [
    #step[Xét $y = x^3 + 3x$, ta có $y' = 3x^2 + 3 > 0$ với mọi $x in RR$.]
    #step[Do đó hàm số này đồng biến trên toàn bộ $RR$. Các hàm còn lại không thỏa mãn.]
  ]
)

#tn(
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-1$, $3$, $+oo$),
        d-signs: ($-$, $0$, $+$, $0$, $-$),
        v-vals: ($+oo$, $-2$, $4$, $-oo$),
      )
    ]
    Hàm số đã cho nghịch biến trên khoảng nào dưới đây?
  ],
  (
    [$( -1 ; 3 )$],
    True([$( 3 ; +oo )$]),
    [$( -oo ; 3 )$],
    [$( -2 ; 4 )$]
  ),
  accent: c-book,
  loigiai: [
    #step[Từ bảng biến thiên, ta thấy mũi tên đi xuống (tương ứng $y' < 0$) trên các khoảng $( -oo ; -1 )$ và $( 3 ; +oo )$.]
    #step[Vậy hàm số nghịch biến trên $( -oo ; -1 )$ và $( 3 ; +oo )$. Đối chiếu đáp án, khoảng $( 3 ; +oo )$ nằm trong lựa chọn.]
  ]
)

#muc([II. Câu trắc nghiệm đúng - sai])
#resetexamstate()

#ds(
  [Cho hàm số $y = frac(2x + 1, x - 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tập xác định của hàm số là $D = RR$.],
    True([Đạo hàm của hàm số là $y' = frac(-3, (x - 1)^2)$.]),
    [Hàm số nghịch biến trên $RR backslash {1}$.],
    True([Hàm số nghịch biến trên khoảng $(2; 5)$.]),
  ),
  accent: c-book,
  loigiai: [
    #step[Tập xác định cần điều kiện $x - 1 != 0 <=> x != 1$. Do đó $D = RR backslash {1}$. Phát biểu $1$ sai.]
    #step[Đạo hàm $y' = frac(2 dot.c (-1) - 1 dot.c 1, (x - 1)^2) = frac(-3, (x - 1)^2)$. Phát biểu $2$ đúng.]
    #step[Vì $y' < 0$ với mọi $x != 1$, hàm số nghịch biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$. Theo quy tắc không được dùng kí hiệu $union$ hay $RR backslash {1}$. Phát biểu $3$ sai.]
    #step[Khoảng $(2; 5)$ là một tập con của khoảng $(1; +oo)$. Vì hàm số nghịch biến trên $(1; +oo)$ nên nó cũng nghịch biến trên $(2; 5)$. Phát biểu $4$ đúng.]
  ]
)

#muc([III. Câu trắc nghiệm trả lời ngắn])
#resetexamstate()

#tln(
  [Hàm số $y = -x^3 + 3x^2 - 1$ đồng biến trên khoảng $(a; b)$ với $a, b$ là các số thực. Giá trị của biểu thức $S = a + b$ bằng bao nhiêu?],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Tập xác định $D = RR$. Đạo hàm: $y' = -3x^2 + 6x$.]
    #step[Cho $y' = 0 <=> -3x^2 + 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Xét dấu đạo hàm: $y' > 0$ khi $x in (0; 2)$. Suy ra hàm số đồng biến trên khoảng $(0; 2)$.]
    #step[Từ đó suy ra $a = 0, b = 2$. Do đó $S = a + b = 2$.]
  ]
)
