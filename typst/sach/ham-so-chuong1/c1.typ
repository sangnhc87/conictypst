#import "_config.typ": *

#chapter([Chương 1. Hàm Số], theme-color: c-p1)

#phuongphap(theme-color: c-p1)[
  *Quy trình chuẩn khi giải bài hàm số:*
  - Xác định tập xác định và miền đang xét.
  - Tính đạo hàm, giải phương trình $f'(x) = 0$ hoặc tìm điểm $f'(x)$ không xác định.
  - Lập bảng dấu của $f'(x)$, từ đó suy ra sự biến thiên và cực trị.
  - Nếu bài hỏi GTLN - GTNN trên đoạn, luôn so sánh cả giá trị tại biên.
  - Nếu bài hỏi tiệm cận, phải tách rõ ba loại: đứng, ngang và xiên.
  - Nếu bài hỏi tương giao hoặc thực tế, hãy quy về phương trình $f(x) = g(x)$ rồi giải và diễn giải lại bằng ngôn ngữ bài toán.
]

#topic([Sự Biến Thiên và Khoảng Đơn Điệu], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  - Hàm số đồng biến trên khoảng nào thì $f'(x) > 0$ trên khoảng đó.
  - Hàm số nghịch biến trên khoảng nào thì $f'(x) < 0$ trên khoảng đó.
  - Với đa thức bậc ba, bậc bốn cơ bản, bảng biến thiên tổng quát thường nên trình bày bằng `bbbt`.
]

#vd(
  [Khảo sát sự biến thiên của hàm số $f(x) = x^3 - 3x^2 + 1$ trên $RR$.],
  loigiai: [
    #ppgiai[
      - Tính đạo hàm và tìm các điểm tới hạn.
      - Lập bảng dấu của $f'(x)$.
      - Suy ra khoảng đồng biến, nghịch biến và đọc các giá trị đặc biệt từ BBT.
    ]

    #step[Tập xác định của hàm số là $RR$.]

    #step[Ta có
      $f'(x) = 3x^2 - 6x = 3 dot.c x dot.c (x - 2)$.]

    #step[Giải $f'(x) = 0$ được $x = 0$ và $x = 2$.]

    #step[Bảng biến thiên của hàm số là:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $f'$,
          func: $f$,
          x-vals: ($-oo$, $0$, $2$, $+oo$),
          d-signs: ($+$, $0$, $-$, $0$, $+$),
          v-vals: ($-oo$, $1$, $-3$, $+oo$),
        )
      ]]

    #step[Vậy hàm số đồng biến trên $( -oo; 0 )$ và $( 2; +oo )$, nghịch biến trên $( 0; 2 )$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#vd(
  [Khảo sát sự biến thiên của hàm số $f(x) = x^4 - 2x^2 + 3$ trên $RR$.],
  loigiai: [
    #ppgiai[
      - Tính đạo hàm và phân tích thành nhân tử.
      - Giải $f'(x) = 0$ để lấy các mốc xét dấu.
      - Lập BBT rồi kết luận khoảng đơn điệu.
    ]

    #step[Ta có
      $f'(x) = 4x^3 - 4x = 4 dot.c x dot.c (x - 1) dot.c (x + 1)$.]

    #step[Giải $f'(x) = 0$ được $x = -1$, $x = 0$, $x = 1$.]

    #step[Tính thêm các giá trị cần thiết:
      $f(-1) = 2$, $f(0) = 3$, $f(1) = 2$.]

    #step[Bảng biến thiên của hàm số là:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $f'$,
          func: $f$,
          x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
          d-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$),
          v-vals: ($+oo$, $2$, $3$, $2$, $+oo$),
        )
      ]]

    #step[Vậy hàm số nghịch biến trên $( -oo; -1 )$ và $( 0; 1 )$, đồng biến trên $( -1; 0 )$ và $( 1; +oo )$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#bt(
  [Tìm các khoảng đồng biến và nghịch biến của hàm số $f(x) = x^3 + 3x^2 - 9x + 1$.],
  loigiai: [
    #ppgiai[
      - Tính đạo hàm và phân tích nhân tử.
      - Xét dấu của đạo hàm.
      - Kết luận từ bảng biến thiên.
    ]

    #step[Ta có
      $f'(x) = 3x^2 + 6x - 9 = 3 dot.c (x + 3) dot.c (x - 1)$.]

    #step[Giải $f'(x) = 0$ được $x = -3$ và $x = 1$.]

    #step[Vì $f'(x) > 0$ trên $( -oo; -3 )$ và $( 1; +oo )$, còn $f'(x) < 0$ trên $( -3; 1 )$, nên hàm số đồng biến trên $( -oo; -3 )$, $( 1; +oo )$ và nghịch biến trên $( -3; 1 )$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#topic([Cực Trị Của Hàm Số], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  - Điểm $x_0$ là điểm cực trị khi $f'(x)$ đổi dấu khi đi qua $x_0$.
  - Nếu $f'(x)$ không đổi dấu thì $x_0$ chỉ là nghiệm của đạo hàm, chưa đủ để kết luận cực trị.
  - Với bài tham số, điều cần khóa trước là số nghiệm phân biệt của phương trình $f'(x) = 0$.
]

#vd(
  [Tìm các điểm cực trị của hàm số $f(x) = x^3 - 3x + 2$.],
  loigiai: [
    #ppgiai[
      - Tính đạo hàm và tìm nghiệm của $f'(x) = 0$.
      - Xét dấu của $f'(x)$.
      - Kết luận cực đại, cực tiểu và tính giá trị tương ứng.
    ]

    #step[Ta có
      $f'(x) = 3x^2 - 3 = 3 dot.c (x - 1) dot.c (x + 1)$.]

    #step[Giải $f'(x) = 0$ được $x = -1$ và $x = 1$.]

    #step[Bảng biến thiên của hàm số là:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $f'$,
          func: $f$,
          x-vals: ($-oo$, $-1$, $1$, $+oo$),
          d-signs: ($+$, $0$, $-$, $0$, $+$),
          v-vals: ($-oo$, $4$, $0$, $+oo$),
        )
      ]]

    #step[Vậy hàm số đạt cực đại tại $x = -1$ với giá trị cực đại bằng $4$, và đạt cực tiểu tại $x = 1$ với giá trị cực tiểu bằng $0$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#vd(
  [Tìm điều kiện của tham số $m$ để hàm số $f(x) = x^3 - 3 dot.c m dot.c x + 1$ có hai điểm cực trị phân biệt.],
  loigiai: [
    #ppgiai[
      - Tính đạo hàm theo $x$.
      - Xét phương trình $f'(x) = 0$ có hai nghiệm phân biệt.
      - Kết luận điều kiện của $m$.
    ]

    #step[Ta có
      $f'(x) = 3x^2 - 3m = 3 dot.c (x^2 - m)$.]

    #step[Hàm số có hai điểm cực trị phân biệt khi và chỉ khi phương trình $f'(x) = 0$ có hai nghiệm phân biệt, tức là
      $x^2 = m$
      có hai nghiệm phân biệt.]

    #step[Điều đó xảy ra khi và chỉ khi $m > 0$.]

    #step[Vậy điều kiện cần tìm là $m > 0$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#bt(
  [Tìm số điểm cực trị của hàm số $f(x) = x^4 - 4x^2 + 1$ và xác định giá trị cực trị.],
  loigiai: [
    #ppgiai[
      - Tính đạo hàm và giải $f'(x) = 0$.
      - Xét dấu của đạo hàm trên các khoảng.
      - Kết luận số điểm cực trị và các giá trị cực trị.
    ]

    #step[Ta có
      $f'(x) = 4x^3 - 8x = 4 dot.c x dot.c (x^2 - 2)$.]

    #step[Giải $f'(x) = 0$ được $x = -sqrt(2)$, $x = 0$, $x = sqrt(2)$.]

    #step[Tính các giá trị:
      $f(-sqrt(2)) = -3$, $f(0) = 1$, $f(sqrt(2)) = -3$.]

    #step[Vì $f'(x)$ đổi dấu theo thứ tự $- , + , - , +$, nên hàm số có ba điểm cực trị: cực tiểu tại $x = +-sqrt(2)$ với giá trị $-3$, và cực đại tại $x = 0$ với giá trị $1$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#topic([Giá Trị Lớn Nhất - Nhỏ Nhất Trên Khoảng], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  - Muốn tìm GTLN - GTNN trên đoạn $[a; b]$, phải tính cả giá trị tại biên lẫn các điểm tới hạn trong đoạn.
  - Bảng biến thiên giúp nhìn nhanh, nhưng kết luận cuối phải dựa trên việc so sánh giá trị số cụ thể.
]

#vd(
  [Tìm GTLN và GTNN của hàm số $f(x) = x^3 - 3x + 1$ trên đoạn $[-2; 2]$.],
  loigiai: [
    #ppgiai[
      - Tính đạo hàm và tìm điểm tới hạn trong đoạn.
      - Lập BBT trên đoạn đã cho.
      - So sánh giá trị tại biên và tại các điểm cực trị.
    ]

    #step[Ta có
      $f'(x) = 3x^2 - 3 = 3 dot.c (x - 1) dot.c (x + 1)$.]

    #step[Trong đoạn $[-2; 2]$, các điểm cần xét là $x = -2$, $x = -1$, $x = 1$, $x = 2$.]

    #step[Tính các giá trị:
      $f(-2) = -1$, $f(-1) = 3$, $f(1) = -1$, $f(2) = 3$.]

    #step[Bảng biến thiên trên đoạn đã cho là:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $f'$,
          func: $f$,
          x-vals: ($-2$, $-1$, $1$, $2$),
          d-signs: ($+$, $0$, $-$, $0$, $+$),
          v-vals: ($-1$, $3$, $-1$, $3$),
        )
      ]]

    #step[Vậy GTLN của hàm số trên đoạn là $3$, còn GTNN là $-1$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#vd(
  [Tìm GTNN của hàm số $f(x) = x + frac(4, x)$ trên đoạn $[1; 4]$.],
  loigiai: [
    #ppgiai[
      - Tính đạo hàm và tìm điểm tới hạn trong đoạn.
      - Lập BBT đơn giản trên đoạn.
      - Kết luận giá trị nhỏ nhất.
    ]

    #step[Ta có
      $f'(x) = 1 - frac(4, x^2)$.]

    #step[Giải $f'(x) = 0$ được $x^2 = 4$, nên trên đoạn $[1; 4]$ chỉ có điểm $x = 2$.]

    #step[Tính các giá trị:
      $f(1) = 5$, $f(2) = 4$, $f(4) = 5$.]

    #step[Bảng biến thiên là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $f'$,
          func: $f$,
          x-vals: ($1$, $2$, $4$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($5$, $4$, $5$),
          is-min: true,
        )
      ]]

    #step[Vậy GTNN của hàm số trên đoạn $[1; 4]$ là $4$, đạt tại $x = 2$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#bt(
  [Tìm GTLN và GTNN của hàm số $f(x) = x^2 - 4x + 5$ trên đoạn $[0; 5]$.],
  loigiai: [
    #ppgiai[
      - Tính đạo hàm và tìm điểm tới hạn.
      - So sánh giá trị tại biên và tại điểm tới hạn.
      - Kết luận GTLN, GTNN.
    ]

    #step[Ta có $f'(x) = 2x - 4$. Giải $f'(x) = 0$ được $x = 2$.]

    #step[Tính các giá trị:
      $f(0) = 5$, $f(2) = 1$, $f(5) = 10$.]

    #step[Vậy GTNN của hàm số trên đoạn là $1$, còn GTLN là $10$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#topic([Tiệm Cận Của Đồ Thị], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  - Tiệm cận đứng đến từ các giá trị làm mẫu số bằng $0$ nhưng tử số khác $0$.
  - Tiệm cận ngang đến từ giới hạn khi $x -> +-oo$.
  - Tiệm cận xiên thường tìm bằng phép chia đa thức khi bậc tử lớn hơn bậc mẫu đúng $1$ đơn vị.
]

#vd(
  [Tìm các đường tiệm cận của đồ thị hàm số $y = frac(2x + 1, x - 1)$.],
  loigiai: [
    #ppgiai[
      - Xét tập xác định và khả năng có tiệm cận đứng.
      - Biến đổi hàm số để đọc tiệm cận ngang.
      - Kết luận đầy đủ các đường tiệm cận.
    ]

    #step[Tập xác định là $RR backslash {1}$. Vì tử số tại $x = 1$ bằng $3 != 0$, nên đồ thị có tiệm cận đứng là $x = 1$.]

    #step[Biến đổi:
      $frac(2x + 1, x - 1) = 2 + frac(3, x - 1)$.]

    #step[Vì $frac(3, x - 1) -> 0$ khi $x -> +-oo$, nên đồ thị có tiệm cận ngang là $y = 2$.]

    #step[Vậy đồ thị hàm số có hai tiệm cận: $x = 1$ và $y = 2$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#vd(
  [Tìm các đường tiệm cận của đồ thị hàm số $y = frac(x^2 + 1, x - 1)$.],
  loigiai: [
    #ppgiai[
      - Xét điểm làm mẫu số bằng $0$ để tìm tiệm cận đứng.
      - Chia đa thức để tìm tiệm cận xiên.
      - Kết luận các đường tiệm cận của đồ thị.
    ]

    #step[Tập xác định là $RR backslash {1}$. Tại $x = 1$, tử số bằng $2 != 0$, nên đồ thị có tiệm cận đứng là $x = 1$.]

    #step[Chia đa thức, ta được
      $frac(x^2 + 1, x - 1) = x + 1 + frac(2, x - 1)$.]

    #step[Vì $frac(2, x - 1) -> 0$ khi $x -> +-oo$, nên tiệm cận xiên của đồ thị là $y = x + 1$.]

    #step[Vậy đồ thị hàm số có hai tiệm cận là $x = 1$ và $y = x + 1$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#bt(
  [Tìm số đường tiệm cận của đồ thị hàm số $y = frac(2x^2 - 3x + 4, x - 2)$.],
  loigiai: [
    #ppgiai[
      - Tìm tiệm cận đứng bằng cách xét mẫu số.
      - Chia đa thức để tìm tiệm cận xiên.
      - Đếm tổng số tiệm cận.
    ]

    #step[Ta có
      $frac(2x^2 - 3x + 4, x - 2) = 2x + 1 + frac(6, x - 2)$.]

    #step[Vì vậy đồ thị có tiệm cận đứng $x = 2$ và tiệm cận xiên $y = 2x + 1$.]

    #step[Suy ra tổng số đường tiệm cận là $2$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#topic([Đồ Thị Hàm Số], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  - Muốn vẽ phác đồ thị, phải khóa ít nhất các yếu tố sau: giao trục, cực trị, tiệm cận, tính đối xứng nếu có.
  - Với bài đọc đồ thị, hãy đọc đúng đối tượng được hỏi: số cực trị, số giao điểm, phương trình tiệm cận hay khoảng đơn điệu.
]

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 16pt,
    [Phác đồ thị của hàm số $y = x^3 - 3x + 1$.],
    canvas(length: 0.65cm, {
      import draw: *
      line((0.4, 2.5), (6.1, 2.5), mark: (end: ">"), stroke: 1pt)
      line((3, 0.2), (3, 5.8), mark: (end: ">"), stroke: 1pt)
      content((6.25, 2.2), [$x$])
      content((3.2, 5.9), [$y$])
      let pts = ((1, 1.5), (2, 5.5), (3, 3.5), (4, 1.5), (5, 5.5))
      line(..pts, stroke: 1.4pt + c-p1)
      circle((2, 5.5), radius: 1.3pt, fill: c-p1)
      circle((4, 1.5), radius: 1.3pt, fill: c-p1)
      content((1.8, 5.95), [$M$])
      content((4.1, 1.1), [$N$])
    }),
  ),
  loigiai: [
    #ppgiai[
      - Tính đạo hàm để tìm cực trị.
      - Tìm giao điểm với trục tung và một vài điểm đặc trưng.
      - Dựa vào BBT để phác đúng dáng đồ thị.
    ]

    #step[Ta có
      $y' = 3x^2 - 3 = 3 dot.c (x - 1) dot.c (x + 1)$.]

    #step[Suy ra đồ thị có hai điểm cực trị: cực đại tại $(-1; 3)$ và cực tiểu tại $(1; -1)$.]

    #step[Đồ thị cắt trục tung tại điểm $(0; 1)$.]

    #step[BBT của hàm số là:
      #align(center)[
        #bbbt(
          var: $x$,
          der: $y'$,
          func: $y$,
          x-vals: ($-oo$, $-1$, $1$, $+oo$),
          d-signs: ($+$, $0$, $-$, $0$, $+$),
          v-vals: ($-oo$, $3$, $-1$, $+oo$),
        )
      ]]

    #step[Từ các dữ kiện trên, ta phác được đồ thị dạng chữ S như hình bên, đi qua $(0; 1)$, có đỉnh trên tại $(-1; 3)$ và đỉnh dưới tại $(1; -1)$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 16pt,
    [Quan sát đồ thị bên và xác định các đường tiệm cận, giao điểm với hai trục tọa độ của hàm số.],
    canvas(length: 0.65cm, {
      import draw: *
      line((0.4, 3), (6.1, 3), mark: (end: ">"), stroke: 1pt)
      line((3, 0.3), (3, 5.9), mark: (end: ">"), stroke: 1pt)
      line((4, 0.4), (4, 5.8), stroke: (dash: "dashed", paint: rgb("888888")))
      line((0.5, 4), (6.0, 4), stroke: (dash: "dashed", paint: rgb("888888")))
      let left-pts = ((0.9, 4.5), (1.8, 4.2), (2.6, 3.4), (3.1, 1.7), (3.35, 0.7))
      let right-pts = ((4.35, 5.5), (4.6, 4.8), (5.1, 4.3), (5.8, 4.1))
      line(..left-pts, stroke: 1.4pt + c-p1)
      line(..right-pts, stroke: 1.4pt + c-p1)
      circle((2, 3), radius: 1.3pt, fill: c-p1)
      circle((3, 2), radius: 1.3pt, fill: c-p1)
      content((1.8, 2.55), [$(-1; 0)$])
      content((3.15, 1.65), [$(0; -1)$])
    }),
  ),
  loigiai: [
    #ppgiai[
      - Đọc trực tiếp các đường thẳng mà đồ thị tiến sát nhưng không cắt ổn định ở xa.
      - Đọc các giao điểm với trục hoành và trục tung.
      - Kết luận bằng phương trình các đường và tọa độ các giao điểm.
    ]

    #step[Quan sát hình vẽ, đường thẳng đứng mà đồ thị tiến sát là $x = 1$, nên đây là tiệm cận đứng.]

    #step[Đường thẳng ngang mà hai nhánh đồ thị tiến sát là $y = 1$, nên đây là tiệm cận ngang.]

    #step[Đồ thị cắt trục hoành tại $(-1; 0)$ và cắt trục tung tại $(0; -1)$.]

    #step[Vậy đồ thị có hai tiệm cận $x = 1$, $y = 1$; giao điểm với trục hoành là $(-1; 0)$ và giao điểm với trục tung là $(0; -1)$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#bt(
  [Dựa vào đạo hàm, hãy phác đồ thị của hàm số $y = x^4 - 2x^2$.],
  loigiai: [
    #ppgiai[
      - Tìm giao điểm với trục tọa độ và tính chẵn lẻ.
      - Tính đạo hàm để tìm cực trị.
      - Dựa vào tính chẵn và các điểm đặc biệt để phác đồ thị.
    ]

    #step[Hàm số chẵn vì $f(-x) = f(x)$, nên đồ thị nhận trục $O y$ làm trục đối xứng.]

    #step[Ta có
      $f'(x) = 4x^3 - 4x = 4 dot.c x dot.c (x - 1) dot.c (x + 1)$.]

    #step[Hàm số có cực đại tại $(0; 0)$ và hai cực tiểu tại $(-1; -1)$, $(1; -1)$. Ngoài ra, đồ thị cắt trục hoành tại $x = -sqrt(2)$, $x = 0$, $x = sqrt(2)$.]

    #step[Từ các dữ kiện trên, ta phác được đồ thị dạng đối xứng qua $O y$, đi xuống ở hai nhánh giữa rồi vươn lên về hai phía.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#topic([Tương Giao và Bài Toán Thực Tế], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  - Tương giao của hai đồ thị là nghiệm của phương trình $f(x) = g(x)$.
  - Trong bài toán thực tế doanh thu - chi phí, điểm hòa vốn là nghiệm của phương trình $R(x) = C(x)$.
  - Sau khi giải phương trình, luôn diễn giải lại ý nghĩa của từng nghiệm.
]

#vd(
  [Tìm số giao điểm của hai đồ thị $y = x^3 - 3x + 1$ và $y = x + 1$.],
  loigiai: [
    #ppgiai[
      - Lập phương trình hoành độ giao điểm.
      - Phân tích nhân tử để tìm nghiệm.
      - Kết luận số giao điểm và có thể nêu tọa độ nếu cần.
    ]

    #step[Hoành độ giao điểm thỏa
      $x^3 - 3x + 1 = x + 1$.]

    #step[Biến đổi được
      $x^3 - 4x = 0 <=> x dot.c (x - 2) dot.c (x + 2) = 0$.]

    #step[Phương trình có ba nghiệm phân biệt $x = -2$, $x = 0$, $x = 2$.]

    #step[Vậy hai đồ thị cắt nhau tại $3$ điểm phân biệt.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#vd(
  [Một doanh nghiệp có doanh thu $R(x) = 6x$ và chi phí $C(x) = x^2 + x + 6$, với $x$ là số lô hàng. Hãy tìm các mức sản xuất hòa vốn.],
  loigiai: [
    #ppgiai[
      - Điều kiện hòa vốn là doanh thu bằng chi phí.
      - Lập phương trình $R(x) = C(x)$.
      - Giải và diễn giải nghiệm trong bối cảnh thực tế.
    ]

    #step[Điều kiện hòa vốn là
      $R(x) = C(x)$.]

    #step[Suy ra
      $6x = x^2 + x + 6 <=> x^2 - 5x + 6 = 0$.]

    #step[Giải phương trình được
      $(x - 2) dot.c (x - 3) = 0 <=> x = 2$ hoặc $x = 3$.]

    #step[Vậy doanh nghiệp hòa vốn khi sản xuất $2$ lô hàng hoặc $3$ lô hàng.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#bt(
  [Tìm điều kiện của $m$ để đường thẳng $y = m$ cắt đồ thị hàm số $y = x^2 - 4x + 3$ tại hai điểm phân biệt.],
  loigiai: [
    #ppgiai[
      - Lập phương trình hoành độ giao điểm.
      - Đưa về phương trình bậc hai theo $x$.
      - Dùng điều kiện biệt thức dương để có hai giao điểm phân biệt.
    ]

    #step[Hoành độ giao điểm thỏa
      $x^2 - 4x + 3 = m <=> x^2 - 4x + 3 - m = 0$.]

    #step[Để đường thẳng cắt parabol tại hai điểm phân biệt, phương trình trên phải có hai nghiệm phân biệt, tức là
      $Delta > 0$.]

    #step[Ta có
      $Delta = (-4)^2 - 4 dot.c (3 - m) = 16 - 12 + 4m = 4 + 4m$.]

    #step[Điều kiện là $4 + 4m > 0 <=> m > -1$.]
    #resetstep()
  ],
  theme-color: c-p1,
)

// ════════════════════════════════════════════════════════════
#bt-header(c-p1)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — 12 câu tổng hợp], c-p1)

#tn(
  [Hàm số $f(x) = x^3 - 3x^2 + 1$ nghịch biến trên khoảng nào?],
  ([$(-oo; 0)$], True([$(0; 2)$]), [$(2; +oo)$], [$(-oo; 2)$]),
  accent: c-p1,
  loigiai: [
    #step[Ta có $f'(x) = 3 dot.c x dot.c (x - 2)$.]
    #step[Đạo hàm âm trên $(0; 2)$, nên hàm số nghịch biến trên khoảng đó.]
  ],
)

#tn(
  [Hàm số $f(x) = x^4 - 2x^2 + 3$ có bao nhiêu điểm cực trị?],
  ([$1$], [$2$], True([$3$]), [$4$]),
  accent: c-p1,
  loigiai: [
    #step[Ta có $f'(x) = 4 dot.c x dot.c (x - 1) dot.c (x + 1)$.]
    #step[Hàm số có ba điểm cực trị ứng với $x = -1$, $x = 0$, $x = 1$.]
  ],
)

#tn(
  [Giá trị cực đại của hàm số $f(x) = x^3 - 3x + 2$ là],
  ([$0$], True([$4$]), [$2$], [$3$]),
  accent: c-p1,
  loigiai: [
    #step[Hàm số đạt cực đại tại $x = -1$.]
    #step[Tính được $f(-1) = 4$.]
  ],
)

#tn(
  [Hàm số $f(x) = x^3 - 3 dot.c m dot.c x + 1$ có hai điểm cực trị phân biệt khi],
  ([$m < 0$], [$m >= 0$], True([$m > 0$]), [$m != 0$]),
  accent: c-p1,
  loigiai: [
    #step[Ta có $f'(x) = 3 dot.c (x^2 - m)$.]
    #step[Phương trình $f'(x) = 0$ có hai nghiệm phân biệt khi và chỉ khi $m > 0$.]
  ],
)

#tn(
  [GTNN của hàm số $f(x) = x + frac(4, x)$ trên đoạn $[1; 4]$ là],
  ([$3$], True([$4$]), [$5$], [$6$]),
  accent: c-p1,
  loigiai: [
    #step[Điểm tới hạn trong đoạn là $x = 2$.]
    #step[So sánh $f(1) = 5$, $f(2) = 4$, $f(4) = 5$ nên GTNN là $4$.]
  ],
)

#tn(
  [GTLN của hàm số $f(x) = x^2 - 4x + 5$ trên đoạn $[0; 5]$ là],
  ([$5$], [$6$], [$8$], True([$10$])),
  accent: c-p1,
  loigiai: [
    #step[So sánh tại các điểm cần xét: $f(0) = 5$, $f(2) = 1$, $f(5) = 10$.]
    #step[Vậy GTLN bằng $10$.]
  ],
)

#tn(
  [Đường tiệm cận đứng của đồ thị hàm số $y = frac(2x + 1, x - 1)$ là],
  ([$x = -1$], True([$x = 1$]), [$y = 2$], [$y = 1$]),
  accent: c-p1,
  loigiai: [
    #step[Mẫu số bằng $0$ tại $x = 1$ và tử số khi đó khác $0$, nên tiệm cận đứng là $x = 1$.]
  ],
)

#tn(
  [Đường tiệm cận xiên của đồ thị hàm số $y = frac(x^2 + 1, x - 1)$ là],
  ([$y = x - 1$], [$y = x$], True([$y = x + 1$]), [$y = 1$]),
  accent: c-p1,
  loigiai: [
    #step[Chia đa thức được
      $frac(x^2 + 1, x - 1) = x + 1 + frac(2, x - 1)$.]
    #step[Vì thế tiệm cận xiên là $y = x + 1$.]
  ],
)

#tn(
  [Hai đồ thị $y = x^3 - 3x + 1$ và $y = x + 1$ cắt nhau tại bao nhiêu điểm phân biệt?],
  ([$1$], [$2$], True([$3$]), [$4$]),
  accent: c-p1,
  loigiai: [
    #step[Giải phương trình hoành độ giao điểm:
      $x^3 - 3x + 1 = x + 1 <=> x^3 - 4x = 0$.]
    #step[Phương trình có ba nghiệm phân biệt $-2$, $0$, $2$, nên có $3$ giao điểm.]
  ],
)

#tn(
  [Doanh thu $R(x) = 6x$ và chi phí $C(x) = x^2 + x + 6$. Số mức sản xuất hòa vốn là],
  ([$0$], [$1$], True([$2$]), [$3$]),
  accent: c-p1,
  loigiai: [
    #step[Hòa vốn khi $R(x) = C(x)$, tức là $x^2 - 5x + 6 = 0$.]
    #step[Phương trình có hai nghiệm $x = 2$, $x = 3$, nên có $2$ mức hòa vốn.]
  ],
)

#tn(
  [Điểm cực tiểu của đồ thị $y = x^3 - 3x + 1$ là],
  ([$(-1; 3)$], [$(-1; 1)$], True([$(1; -1)$]), [$(1; 1)$]),
  accent: c-p1,
  loigiai: [
    #step[Hàm số có hai điểm cực trị tại $x = -1$ và $x = 1$.]
    #step[Tính được $f(1) = -1$, nên điểm cực tiểu là $(1; -1)$.]
  ],
)

#tn(
  [Đồ thị hàm số $y = x^4 - 2x^2$ nhận đường thẳng nào làm trục đối xứng?],
  ([$x = 1$], [trục $O x$], True([trục $O y$]), [$y = 1$]),
  accent: c-p1,
  loigiai: [
    #step[Ta có $f(-x) = f(x)$, nên hàm số chẵn.]
    #step[Vì vậy đồ thị nhận trục $O y$ làm trục đối xứng.]
  ],
)

#q-label([B. ĐÚNG – S A I — 4 câu tổng hợp], c-p1)
#resetexamstate()

#ds(
  [Xét hàm số $f(x) = x^3 - 3x^2 + 1$.],
  (
    True([Hàm số đồng biến trên $( -oo; 0 )$.]),
    True([Hàm số nghịch biến trên $( 0; 2 )$.]),
    True([Hàm số đạt cực tiểu tại $x = 2$ với giá trị bằng $-3$.]),
    [Hàm số có ba điểm cực trị.],
  ),
  accent: c-p1,
  loigiai: [
    #step[Vì $f'(x) = 3 dot.c x dot.c (x - 2)$ nên phát biểu $1$ và $2$ đúng.]
    #step[Tại $x = 2$, đạo hàm đổi dấu từ âm sang dương và $f(2) = -3$, nên phát biểu $3$ đúng.]
    #step[Hàm số chỉ có hai điểm cực trị ứng với $x = 0$ và $x = 2$, nên phát biểu $4$ sai.]
  ],
)

#ds(
  [Xét hàm số $f(x) = x + frac(4, x)$ trên đoạn $[1; 4]$.],
  (
    True([Ta có $f'(x) = 1 - frac(4, x^2)$.]),
    True([GTNN của hàm số trên đoạn đạt tại $x = 2$.]),
    [GTLN của hàm số trên đoạn đạt tại $x = 2$.],
    True([GTLN của hàm số trên đoạn bằng $5$.]),
  ),
  accent: c-p1,
  loigiai: [
    #step[Đạo hàm đúng như phát biểu $1$, nên phát biểu $1$ đúng.]
    #step[So sánh $f(1) = 5$, $f(2) = 4$, $f(4) = 5$ nên phát biểu $2$ và $4$ đúng.]
    #step[GTLN không đạt tại $x = 2$, nên phát biểu $3$ sai.]
  ],
)

#ds(
  [Xét hàm số $y = frac(x^2 + 1, x - 1)$.],
  (
    True([Đồ thị có tiệm cận đứng $x = 1$.]),
    [Đồ thị có tiệm cận ngang $y = 1$.],
    True([Đồ thị có tiệm cận xiên $y = x + 1$.]),
    True([Đồ thị cắt trục tung tại điểm $(0; -1)$.]),
  ),
  accent: c-p1,
  loigiai: [
    #step[Tại $x = 1$ mẫu số bằng $0$ còn tử số bằng $2$, nên phát biểu $1$ đúng.]
    #step[Do bậc tử lớn hơn bậc mẫu đúng $1$ đơn vị, đồ thị không có tiệm cận ngang, nên phát biểu $2$ sai.]
    #step[Chia đa thức được tiệm cận xiên $y = x + 1$, nên phát biểu $3$ đúng.]
    #step[Thay $x = 0$ được $y = -1$, nên phát biểu $4$ đúng.]
  ],
)

#ds(
  [Một doanh nghiệp có doanh thu $R(x) = 6x$ và chi phí $C(x) = x^2 + x + 6$. Gọi $P(x) = R(x) - C(x)$ là lợi nhuận.],
  (
    True([Doanh nghiệp hòa vốn khi $x = 2$ hoặc $x = 3$.]),
    True([Doanh nghiệp có lãi khi $2 < x < 3$.]),
    True([Lợi nhuận lớn nhất đạt tại $x = 2{,}5$.]),
    [Lợi nhuận lớn nhất bằng $1$.],
  ),
  accent: c-p1,
  loigiai: [
    #step[Ta có $P(x) = -x^2 + 5x - 6$, nên phát biểu $1$ đúng vì $P(x) = 0$ khi $x = 2$, $x = 3$.]
    #step[Vì parabol $P(x)$ quay xuống, nên $P(x) > 0$ trên khoảng giữa hai nghiệm, tức là $2 < x < 3$. Phát biểu $2$ đúng.]
    #step[Đỉnh của parabol ở $x = frac(5, 2) = 2{,}5$, nên phát biểu $3$ đúng.]
    #step[Tính $P(2{,}5) = 0{,}25$, không phải $1$, nên phát biểu $4$ sai.]
  ],
)

#q-label([C. TỰ LUẬN NGẮN — Ghi một đáp số ngắn], c-p1)
#resetexamstate()

#tln(
  [Hàm số $f(x) = x^3 - 3x^2 + 1$ có bao nhiêu khoảng đồng biến?],
  [$2$],
  accent: c-p1,
  loigiai: [
    #step[Hàm số đồng biến trên $( -oo; 0 )$ và $( 2; +oo )$, nên có $2$ khoảng đồng biến.]
  ],
)

#tln(
  [Hàm số $f(x) = x^4 - 4x^2 + 1$ có bao nhiêu điểm cực trị?],
  [$3$],
  accent: c-p1,
  loigiai: [
    #step[Giải $f'(x) = 0$ được ba nghiệm $-sqrt(2)$, $0$, $sqrt(2)$ và đạo hàm đổi dấu tại cả ba điểm này.]
    #step[Vậy hàm số có $3$ điểm cực trị.]
  ],
)

#tln(
  [GTNN của hàm số $f(x) = x + frac(4, x)$ trên đoạn $[1; 4]$ bằng bao nhiêu?],
  [$4$],
  accent: c-p1,
  loigiai: [
    #step[So sánh $f(1) = 5$, $f(2) = 4$, $f(4) = 5$ nên GTNN bằng $4$.]
  ],
)

#tln(
  [Đồ thị hàm số $y = frac(2x^2 - 3x + 4, x - 2)$ có bao nhiêu đường tiệm cận?],
  [$2$],
  accent: c-p1,
  loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = 2$ và tiệm cận xiên $y = 2x + 1$, nên có $2$ đường tiệm cận.]
  ],
)

#tln(
  [Đồ thị hàm số $y = x^4 - 2x^2$ cắt trục hoành tại bao nhiêu điểm phân biệt?],
  [$3$],
  accent: c-p1,
  loigiai: [
    #step[Giải $x^4 - 2x^2 = 0$ được $x = 0$, $x = +-sqrt(2)$.]
    #step[Vậy có $3$ giao điểm phân biệt với trục hoành.]
  ],
)

#tln(
  [Với doanh thu $R(x) = 6x$ và chi phí $C(x) = x^2 + x + 6$, mức hòa vốn lớn hơn bằng bao nhiêu?],
  [$3$],
  accent: c-p1,
  loigiai: [
    #step[Giải $R(x) = C(x)$ được hai nghiệm $x = 2$ và $x = 3$.]
    #step[Mức hòa vốn lớn hơn là $3$.]
  ],
)
