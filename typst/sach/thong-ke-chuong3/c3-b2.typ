#import "_config.typ": *

#lesson([Phương sai và Độ lệch chuẩn của mẫu số liệu ghép nhóm], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Giá trị đại diện và Số trung bình cộng])

#block(breakable: false)[
  #dn(title: [Giá trị đại diện và Số trung bình cộng])[
    - *Giá trị đại diện* của nhóm $[u_i; u_(i+1))$, kí hiệu là $x_i$, là trung điểm của khoảng ghép nhóm đó:
      $ x_i = frac(u_i + u_(i+1), 2) $
    - *Số trung bình cộng* của mẫu số liệu ghép nhóm, kí hiệu là $bar(x)$, được tính bằng công thức:
      $ bar(x) = frac(n_1 x_1 + n_2 x_2 + dots.c + n_k x_k, n) $
      Trong đó $n = n_1 + n_2 + dots.c + n_k$ là cỡ mẫu; $x_i$ là giá trị đại diện của nhóm thứ $i$; $n_i$ là tần số của nhóm thứ $i$.
  ]
]

#muc([Phương sai và Độ lệch chuẩn])

#block(breakable: false)[
  #dn(title: [Định nghĩa Phương sai và Độ lệch chuẩn])[
    - *Phương sai* của mẫu số liệu ghép nhóm, kí hiệu là $s^2$, là đại lượng đo mức độ phân tán của dữ liệu xung quanh giá trị trung bình mẫu:
      $ s^2 = frac(n_1 (x_1 - bar(x))^2 + n_2 (x_2 - bar(x))^2 + dots.c + n_k (x_k - bar(x))^2, n) $
    - *Công thức tính nhanh phương sai:*
      $ s^2 = frac(n_1 x_1^2 + n_2 x_2^2 + dots.c + n_k x_k^2, n) - bar(x)^2 $
    - *Độ lệch chuẩn* của mẫu số liệu ghép nhóm, kí hiệu là $s$, là căn bậc hai số học của phương sai:
      $ s = sqrt(s^2) $
  ]
]

#muc([Ý nghĩa của Phương sai và Độ lệch chuẩn])

#block(breakable: false)[
  #nhanxet(title: [Ý nghĩa thực tiễn])[
    - Phương sai và độ lệch chuẩn dùng để đo độ phân tán của các số liệu xung quanh số trung bình mẫu.
    - Phương sai và độ lệch chuẩn càng lớn chứng tỏ số liệu càng phân tán rộng (không ổn định).
    - Phương sai và độ lệch chuẩn càng nhỏ chứng tỏ số liệu càng đồng đều, ổn định, tập trung sát số trung bình cộng.
    - So với phương sai, độ lệch chuẩn $s$ có cùng đơn vị đo với số liệu ban đầu nên thường được ưu tiên sử dụng trong thực tế để mô tả trực quan.
  ]
]

#v(0.5em)
#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    
    // Axes
    line((-4.5, 0), (4.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.8pt)
    line((0, 0), (0, 4.5), mark: (end: "stealth", scale: 0.5), stroke: 0.8pt)
    
    content((4.3, -0.3), [$x$])
    content((-0.3, 4.3), [$y$])
    content((0.2, -0.35), [$bar(x)$])
    
    // Mean line (x=0)
    line((0, 0), (0, 4.0), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Distribution 1: highly concentrated (small s)
    // f1(x) = 3.8 * exp(-x^2 / 0.5)
    let pts1 = ()
    for i in range(0, 41) {
      let x = -4.0 + i * 8.0 / 40.0
      let y = 3.8 * calc.exp(- (x * x) / 0.6)
      pts1.push((x, y))
    }
    line(..pts1, stroke: 1.5pt + rgb("#5b21b6"))
    content((1.2, 3.2), [Phân phối A \ (Độ lệch chuẩn $s_A$ nhỏ)], fill: none)
    
    // Distribution 2: highly dispersed (large s)
    // f2(x) = 1.8 * exp(-x^2 / 3.0)
    let pts2 = ()
    for i in range(0, 41) {
      let x = -4.0 + i * 8.0 / 40.0
      let y = 1.6 * calc.exp(- (x * x) / 4.0)
      pts2.push((x, y))
    }
    line(..pts2, stroke: 1.5pt + rgb("#b45309"))
    content((2.8, 1.2), [Phân phối B \ (Độ lệch chuẩn $s_B$ lớn)], fill: none)
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 2. So sánh hai phân bố tần suất có cùng giá trị trung bình mẫu $bar(x)$ nhưng độ lệch chuẩn khác nhau ($s_A < s_B$)]
]


#q-label([B. CÁC DẠNG TOÁN VÀ VÍ DỤ MINH HỌA], c-book)

#dang([Tính số trung bình cộng, phương sai và độ lệch chuẩn từ bảng tần số ghép nhóm], theme-color: c-book)

#vd(
  [Đo chiều cao (cm) của 30 cây bạch đàn con trong một vườn ươm, ta thu được mẫu số liệu ghép nhóm như sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Chiều cao (cm)], $[50; 60)$, $[60; 70)$, $[70; 80)$, $[80; 90)$, $[90; 100]$,
        [Số cây], [4], [7], [10], [6], [3]
      )
    ]
    Hãy tính giá trị trung bình $bar(x)$, phương sai $s^2$ và độ lệch chuẩn $s$ của mẫu số liệu ghép nhóm trên.
  ],
  loigiai: [
    #step[
      *1. Xác định giá trị đại diện $x_i$ của từng nhóm:*
      - Nhóm $[50; 60)$ có giá trị đại diện $x_1 = frac(50 + 60, 2) = 55$.
      - Nhóm $[60; 70)$ có giá trị đại diện $x_2 = frac(60 + 70, 2) = 65$.
      - Nhóm $[70; 80)$ có giá trị đại diện $x_3 = frac(70 + 80, 2) = 75$.
      - Nhóm $[80; 90)$ có giá trị đại diện $x_4 = frac(80 + 90, 2) = 85$.
      - Nhóm $[90; 100]$ có giá trị đại diện $x_5 = frac(90 + 100, 2) = 95$.
    ]
    #step[
      *2. Tính số trung bình mẫu $bar(x)$:*
      - Tổng cỡ mẫu: $n = 4 + 7 + 10 + 6 + 3 = 30$.
      - Số trung bình cộng:
        $ bar(x) = frac(4 dot 55 + 7 dot 65 + 10 dot 75 + 6 dot 85 + 3 dot 95, 30) = frac(220 + 455 + 750 + 510 + 285, 30) = frac(2220, 30) = 74 " (cm)" $
    ]
    #step[
      *3. Tính phương sai $s^2$:*
      - Áp dụng công thức tính nhanh phương sai:
        $ s^2 = frac(n_1 x_1^2 + n_2 x_2^2 + n_3 x_3^2 + n_4 x_4^2 + n_5 x_5^2, n) - bar(x)^2 $
        $ s^2 = frac(4 dot 55^2 + 7 dot 65^2 + 10 dot 75^2 + 6 dot 85^2 + 3 dot 95^2, 30) - 74^2 $
        $ s^2 = frac(4 dot 3025 + 7 dot 4225 + 10 dot 5625 + 6 dot 7225 + 3 dot 9025, 30) - 5476 $
        $ s^2 = frac(12100 + 29575 + 56250 + 43350 + 27075, 30) - 5476 = frac(168350, 30) - 5476 $
        $ s^2 = frac(16835, 3) - 5476 = frac(16835 - 16428, 3) = frac(407, 3) approx 135.67 $
    ]
    #step[
      *4. Tính độ lệch chuẩn $s$:*
      - Độ lệch chuẩn là căn bậc hai số học của phương sai:
        $ s = sqrt(s^2) = sqrt(frac(407, 3)) approx 11.65 " (cm)" $
    ]
  ],
  theme-color: c-book,
)

#dang([Bài toán thực tế sử dụng phương sai, độ lệch chuẩn để so sánh mức độ ổn định], theme-color: c-book)

#vd(
  [Hai bạn Nam và Bắc cùng đo thời gian (phút) chạy bộ cự ly 1500m của mình trong 20 ngày luyện tập liên tiếp. Kết quả được ghi nhận ở bảng sau:
    - *Bạn Nam*:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
          align: center,
          [Thời gian (phút)], $[5; 5.5)$, $[5.5; 6)$, $[6; 6.5)$, $[6.5; 7]$,
          [Tần số (ngày)], [2], [8], [7], [3]
        )
      ]
    - *Bạn Bắc*:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
          align: center,
          [Thời gian (phút)], $[5; 5.5)$, $[5.5; 6)$, $[6; 6.5)$, $[6.5; 7]$,
          [Tần số (ngày)], [4], [5], [6], [5]
        )
      ]
    Hãy tính số trung bình cộng và độ lệch chuẩn thời gian chạy của mỗi bạn. Dựa trên độ lệch chuẩn, hãy cho biết bạn nào có phong độ chạy bộ ổn định hơn?
  ],
  loigiai: [
    #step[
      - Giá trị đại diện của các nhóm tương ứng là:
        $x_1 = 5.25;  x_2 = 5.75;  x_3 = 6.25;  x_4 = 6.75$ (phút).
    ]
    #step[
      *1. Tính toán cho bạn Nam ($n = 20$):*
      - Số trung bình cộng:
        $ bar(x)_N = frac(2 dot 5.25 + 8 dot 5.75 + 7 dot 6.25 + 3 dot 6.75, 20) = frac(120.5, 20) = 6.025 " (phút)" $
      - Phương sai:
        $ s_N^2 = frac(2 dot 5.25^2 + 8 dot 5.75^2 + 7 dot 6.25^2 + 3 dot 6.75^2, 20) - bar(x)_N^2 $
        $ s_N^2 = frac(2 dot 27.5625 + 8 dot 33.0625 + 7 dot 39.0625 + 3 dot 45.5625, 20) - 6.025^2 $
        $ s_N^2 = frac(55.125 + 264.5 + 273.4375 + 136.6875, 20) - 36.300625 = frac(729.75, 20) - 36.300625 $
        $ s_N^2 = 36.4875 - 36.300625 = 0.186875 $
      - Độ lệch chuẩn: $s_N = sqrt(0.186875) approx 0.432$ (phút).
    ]
    #step[
      *2. Tính toán cho bạn Bắc ($n = 20$):*
      - Số trung bình cộng:
        $ bar(x)_B = frac(4 dot 5.25 + 5 dot 5.75 + 6 dot 6.25 + 5 dot 6.75, 20) = frac(121, 20) = 6.05 " (phút)" $
      - Phương sai:
        $ s_B^2 = frac(4 dot 5.25^2 + 5 dot 5.75^2 + 6 dot 6.25^2 + 5 dot 6.75^2, 20) - bar(x)_B^2 $
        $ s_B^2 = frac(4 dot 27.5625 + 5 dot 33.0625 + 6 dot 39.0625 + 5 dot 45.5625, 20) - 6.05^2 $
        $ s_B^2 = frac(110.25 + 165.3125 + 234.375 + 227.8125, 20) - 36.6025 = frac(737.75, 20) - 36.6025 $
        $ s_B^2 = 36.8875 - 36.6025 = 0.285 $
      - Độ lệch chuẩn: $s_B = sqrt(0.285) approx 0.534$ (phút).
    ]
    #step[
      *3. Kết luận:*
      - Ta thấy thời gian chạy trung bình của hai bạn xấp xỉ nhau ($6.025$ phút và $6.05$ phút).
      - Tuy nhiên, độ lệch chuẩn thời gian chạy của bạn Nam ($s_N approx 0.432$ phút) bé hơn của bạn Bắc ($s_B approx 0.534$ phút). Điều này có nghĩa là thời gian hoàn thành cự ly chạy của bạn Nam ít biến động hơn.
      - Vậy phong độ chạy bộ của bạn Nam ổn định hơn bạn Bắc.
    ]
  ],
  theme-color: c-book,
)

#dang([Bài toán xác định tham số của mẫu số liệu], theme-color: c-book)

#vd(
  [Khảo sát nhiệt độ trung bình hàng tháng (°C) của một địa phương trong một năm (12 tháng) thu được bảng ghép nhóm sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Nhiệt độ (°C)], $[16; 20)$, $[20; 24)$, $[24; 28)$, $[28; 32]$,
        [Tần số (số tháng)], [2], [$a$], [4], [$b$]
      )
    ]
    Biết số trung bình cộng của mẫu số liệu ghép nhóm trên bằng 24°C. Hãy tính giá trị của các tham số nguyên dương $a$ và $b$, từ đó tính phương sai của mẫu số liệu này.
  ],
  loigiai: [
    #step[
      - Tổng tần số của mẫu là số tháng trong năm nên ta có phương trình:
        $ 2 + a + 4 + b = 12  <=>  a + b = 6  " (1)" $
      - Xác định giá trị đại diện của các nhóm lần lượt là:
        $x_1 = 18;  x_2 = 22;  x_3 = 26;  x_4 = 30$ (°C).
    ]
    #step[
      - Số trung bình cộng của mẫu số liệu bằng $24$, ta có:
        $ bar(x) = frac(2 dot 18 + a dot 22 + 4 dot 26 + b dot 30, 12) = 24 $
        $ <=> 36 + 22a + 104 + 30b = 288 $
        $ <=> 22a + 30b = 148  <=>  11a + 15b = 74  " (2)" $
    ]
    #step[
      - Từ $(1)$ ta có $a = 6 - b$. Thế vào $(2)$:
        $ 11(6 - b) + 15b = 74  <=>  66 + 4b = 74  <=>  4b = 8  <=>  b = 2 $
      - Suy ra $a = 6 - 2 = 4$.
      - Vậy hai tham số nguyên dương cần tìm là $a = 4$ và $b = 2$.
    ]
    #step[
      - Tính phương sai $s^2$ của mẫu số liệu khi đã tìm được $a$ và $b$:
        $ s^2 = frac(2 dot (18 - 24)^2 + 4 dot (22 - 24)^2 + 4 dot (26 - 24)^2 + 2 dot (30 - 24)^2, 12) $
        $ s^2 = frac(2 dot (-6)^2 + 4 dot (-2)^2 + 4 dot 2^2 + 2 dot 6^2, 12) = frac(2 dot 36 + 4 dot 4 + 4 dot 4 + 2 dot 36, 12) $
        $ s^2 = frac(72 + 16 + 16 + 72, 12) = frac(176, 12) = frac(44, 3) approx 14.67 $
    ]
  ],
  theme-color: c-book,
)

#dang([Đọc biểu đồ tần số cột ghép nhóm để tính phương sai và độ lệch chuẩn], theme-color: c-book)

#vd(
  [Tuổi thọ (năm) của một lô pin điện thoại di động mới sản xuất được thể hiện qua biểu đồ tần số ghép nhóm dưới đây:
    #align(center)[
      #canvas(length: 1.2cm, {
        import draw: *
        // Trục tọa độ
        line((0, 0), (5.0, 0), stroke: 1pt + rgb("#b45309"), mark: (end: ">"))
        line((0, 0), (0, 3.8), stroke: 1pt + rgb("#b45309"), mark: (end: ">"))
        
        content((4.8, -0.3), text(size: 8.5pt)[$t$ (năm)])
        content((-0.6, 3.6), text(size: 8.5pt)[Tần số])
        
        let fill-col = rgb("#f59e0b").transparentize(60%)
        let stroke-col = 1.2pt + rgb("#b45309")
        
        // Vẽ các cột ghép nhóm
        rect((1, 0), (2, 1.2), fill: fill-col, stroke: stroke-col)  // [2; 2.5): 6
        rect((2, 0), (3, 2.8), fill: fill-col, stroke: stroke-col)  // [2.5; 3): 14
        rect((3, 0), (4, 3.2), fill: fill-col, stroke: stroke-col)  // [3.0; 3.5): 16
        rect((4, 0), (5, 0.8), fill: fill-col, stroke: stroke-col)  // [3.5; 4.0]: 4
        
        // Nhãn số lượng trên đỉnh cột
        content((1.5, 1.2 + 0.2), text(size: 8pt, weight: "bold")[6])
        content((2.5, 2.8 + 0.2), text(size: 8pt, weight: "bold")[14])
        content((3.5, 3.2 + 0.2), text(size: 8pt, weight: "bold")[16])
        content((4.5, 0.8 + 0.2), text(size: 8pt, weight: "bold")[4])
        
        // Nhãn trục hoành
        content((1.0, -0.25), text(size: 7.5pt)[2.0])
        content((2.0, -0.25), text(size: 7.5pt)[2.5])
        content((3.0, -0.25), text(size: 7.5pt)[3.0])
        content((4.0, -0.25), text(size: 7.5pt)[3.5])
        content((5.0, -0.25), text(size: 7.5pt)[4.0])
        
        // Nhãn trục tung
        line((-0.05, 0.8), (0.05, 0.8))
        content((-0.3, 0.8), text(size: 7.5pt)[4])
        line((-0.05, 1.2), (0.05, 1.2))
        content((-0.3, 1.2), text(size: 7.5pt)[6])
        line((-0.05, 2.8), (0.05, 2.8))
        content((-0.3, 2.8), text(size: 7.5pt)[14])
        line((-0.05, 3.2), (0.05, 3.2))
        content((-0.3, 3.2), text(size: 7.5pt)[16])
      })
    ]
    Hãy tính tuổi thọ trung bình và độ lệch chuẩn của tuổi thọ lô pin này.
  ],
  loigiai: [
    #step[
      - Từ biểu đồ cột tần số ghép nhóm, ta chuyển đổi thành bảng số liệu kèm giá trị đại diện $x_i$:
        #align(center)[
          #table(
            columns: (1.8fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
            align: center,
            [Tuổi thọ (năm)], $[2.0; 2.5)$, $[2.5; 3.0)$, $[3.0; 3.5)$, $[3.5; 4.0]$,
            [Tần số ($n_i$)], [6], [14], [16], [4],
            [Giá trị đại diện ($x_i$)], [2.25], [2.75], [3.25], [3.75]
          )
        ]
      - Tổng cỡ mẫu: $n = 6 + 14 + 16 + 4 = 40$.
    ]
    #step[
      - *Tính tuổi thọ trung bình $bar(x)$:*
        $ bar(x) = frac(6 dot 2.25 + 14 dot 2.75 + 16 dot 3.25 + 4 dot 3.75, 40) = frac(13.5 + 38.5 + 52 + 15, 40) = frac(119, 40) = 2.975 " (năm)" $
    ]
    #step[
      - *Tính phương sai $s^2$:*
        $ s^2 = frac(6 dot 2.25^2 + 14 dot 2.75^2 + 16 dot 3.25^2 + 4 dot 3.75^2, 40) - bar(x)^2 $
        $ s^2 = frac(6 dot 5.0625 + 14 dot 7.5625 + 16 dot 10.5625 + 4 dot 14.0625, 40) - 2.975^2 $
        $ s^2 = frac(30.375 + 105.875 + 169 + 56.25, 40) - 8.850625 $
        $ s^2 = frac(361.5, 40) - 8.850625 = 9.0375 - 8.850625 = 0.186875 $
    ]
    #step[
      - *Tính độ lệch chuẩn $s$:*
        $ s = sqrt(s^2) = sqrt(0.186875) approx 0.432 " (năm)" $
    ]
  ],
  theme-color: c-book,
)

#pagebreak()

#q-label([C. ĐỀ LUYỆN TẬP], c-book)

#include "c3-b2-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
