#import "_config.typ": *

#lesson([Khoảng biến thiên và Khoảng tứ phân vị của mẫu số liệu ghép nhóm], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Khoảng biến thiên của mẫu số liệu ghép nhóm])

#block(breakable: false)[
  #dn(title: [Định nghĩa Khoảng biến thiên])[
    - Giả sử mẫu số liệu ghép nhóm gồm $k$ nhóm có dạng $[u_1; u_2), [u_2; u_3), dots, [u_k; u_(k+1))$ với tần số tương ứng $n_1, n_2, dots, n_k$.
    - *Khoảng biến thiên* của mẫu số liệu ghép nhóm đó, kí hiệu là $R$, là hiệu số giữa đầu mút phải của nhóm cuối cùng và đầu mút trái của nhóm đầu tiên chứa số liệu.
      $ R = u_(k+1) - u_1 $
      Trong đó $u_1$ là đầu mút trái của nhóm đầu tiên và $u_(k+1)$ là đầu mút phải của nhóm cuối cùng.
  ]
]

#block(breakable: false)[
  #nhanxet(title: [Ý nghĩa của khoảng biến thiên])[
    - Khoảng biến thiên được dùng để đo độ phân tán của mẫu số liệu ghép nhóm. Khoảng biến thiên càng lớn thì mẫu số liệu càng phân tán.
    - *Ưu điểm:* Rất đơn giản, dễ tính toán, nhanh chóng.
    - *Nhược điểm:* Chỉ sử dụng giá trị biên lớn nhất và bé nhất, do đó không phản ánh được cấu trúc bên trong mẫu số liệu và cực kỳ nhạy cảm với các giá trị bất thường (outliers).
  ]
]

#muc([Khoảng tứ phân vị của mẫu số liệu ghép nhóm])

#block(breakable: false)[
  #dn(title: [Định nghĩa Khoảng tứ phân vị])[
    - *Khoảng tứ phân vị* của mẫu số liệu ghép nhóm, kí hiệu là $Delta_Q$, là hiệu số giữa tứ phân vị thứ ba $Q_3$ và tứ phân vị thứ nhất $Q_1$:
      $ Delta_Q = Q_3 - Q_1 $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Quy trình xác định tứ phân vị ghép nhóm $Q_1$ và $Q_3$])[
    Giả sử cỡ mẫu là $n = n_1 + n_2 + dots.c + n_k$.
    
    1. *Tìm tứ phân vị thứ nhất $Q_1$:*
       - Tính giá trị $n/4$. Tìm nhóm chứa tứ phân vị thứ nhất (là nhóm đầu tiên có tần số tích lũy lớn hơn hoặc bằng $n/4$), giả sử là $[u_m; u_(m+1))$.
       - Công thức nội suy:
         $ Q_1 = u_m + frac(frac(n, 4) - C_(m-1), n_m) dot.c (u_(m+1) - u_m) $
         Trong đó: $n_m$ là tần số của nhóm chứa $Q_1$; $C_(m-1)$ là tần số tích lũy của nhóm trước đó.
         
    2. *Tìm tứ phân vị thứ ba $Q_3$:*
       - Tính giá trị $(3n)/4$. Tìm nhóm chứa tứ phân vị thứ ba (là nhóm đầu tiên có tần số tích lũy lớn hơn hoặc bằng $(3n)/4$), giả sử là $[u_j; u_(j+1))$.
       - Công thức nội suy:
         $ Q_3 = u_j + frac(frac(3n, 4) - C_(j-1), n_j) dot.c (u_(j+1) - u_j) $
         Trong đó: $n_j$ là tần số của nhóm chứa $Q_3$; $C_(j-1)$ là tần số tích lũy của nhóm trước đó.
  ]
]

#v(0.5em)
#align(center)[
  #canvas(length: 1.5cm, {
    import draw: *
    
    // Trục số chính
    line((0, 0), (8.0, 0), stroke: 1.0pt + black)
    
    // Các mốc phân vị
    let xmin = 0.5
    let Q1 = 2.3
    let Q2 = 4.0
    let Q3 = 5.7
    let xmax = 7.5
    
    // Vẽ vạch và nhãn trên trục
    line((xmin, -0.1), (xmin, 0.1), stroke: 1.2pt)
    line((Q1, -0.1), (Q1, 0.1), stroke: 1.2pt)
    line((Q2, -0.1), (Q2, 0.1), stroke: 1.2pt)
    line((Q3, -0.1), (Q3, 0.1), stroke: 1.2pt)
    line((xmax, -0.1), (xmax, 0.1), stroke: 1.2pt)
    
    content((xmin, -0.4), [$u_1$])
    content((Q1, -0.4), [$Q_1$])
    content((Q2, -0.4), [$Q_2$])
    content((Q3, -0.4), [$Q_3$])
    content((xmax, -0.4), [$u_(k+1)$])
    
    // Vẽ ngoặc nhọn hoặc khoảng phần trăm
    // 25% các đoạn
    content(((xmin+Q1)/2, 0.35), [25%], fill: rgb("#faf5ff"))
    content(((Q1+Q2)/2, 0.35), [25%], fill: rgb("#faf5ff"))
    content(((Q2+Q3)/2, 0.35), [25%], fill: rgb("#faf5ff"))
    content(((Q3+xmax)/2, 0.35), [25%], fill: rgb("#faf5ff"))
    
    // Khoảng tứ phân vị Delta Q (50% dữ liệu trung tâm)
    line((Q1, 0.8), (Q3, 0.8), stroke: 1.5pt + rgb("#5b21b6"), mark: (start: "stealth", end: "stealth", scale: 0.5))
    content(((Q1+Q3)/2, 1.15), [$Delta_Q = Q_3 - Q_1$ \ (50% dữ liệu ở giữa)], fill: none)
    
    // Khoảng biến thiên R
    line((xmin, -1.0), (xmax, -1.0), stroke: 1.2pt + rgb("#b45309"), mark: (start: "stealth", end: "stealth", scale: 0.5))
    content(((xmin+xmax)/2, -1.35), [$R = u_(k+1) - u_1$ (Khoảng biến thiên)])
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 1. Trực quan hóa Khoảng biến thiên $R$ và Khoảng tứ phân vị $Delta_Q$ trên trục số mẫu số liệu]
]

#block(breakable: false)[
  #nhanxet(title: [Ý nghĩa của khoảng tứ phân vị])[
    - Khoảng tứ phân vị $Delta_Q$ đo độ phân tán của 50% số liệu tập trung ở giữa mẫu số liệu.
    - Khoảng tứ phân vị càng nhỏ thì 50% số liệu ở chính giữa mẫu số liệu càng đồng đều, có độ lệch nhỏ.
    - *Ưu điểm:* Loại bỏ hoàn toàn sự ảnh hưởng của các giá trị bất thường (outliers) ở cả hai phía biên của mẫu số liệu. Do đó, nó phản ánh trung thực hơn độ phân tán của đại đa số số liệu.
  ]
]


#q-label([B. CÁC DẠNG TOÁN VÀ VÍ DỤ MINH HỌA], c-book)

#dang([Xác định khoảng biến thiên và khoảng tứ phân vị từ bảng tần số ghép nhóm], theme-color: c-book)

#vd(
  [Một khảo sát về thời gian tự học trong ngày (giờ) của một nhóm học sinh lớp 12 được ghi nhận ở bảng sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Thời gian (giờ)], $[0; 2)$, $[2; 4)$, $[4; 6)$, $[6; 8)$, $[8; 10)$,
        [Số học sinh], [8], [15], [18], [14], [5]
      )
    ]
    Hãy tìm khoảng biến thiên $R$ và khoảng tứ phân vị $Delta_Q$ của mẫu số liệu ghép nhóm trên.
  ],
  loigiai: [
    #step[
      *1. Tìm khoảng biến thiên $R$:*
      - Đầu mút trái của nhóm đầu tiên chứa số liệu ($[0; 2)$) là $u_1 = 0$.
      - Đầu mút phải của nhóm cuối cùng chứa số liệu ($[8; 10)$) là $u_6 = 10$.
      - Khoảng biến thiên: $R = u_6 - u_1 = 10 - 0 = 10$ (giờ).
    ]
    #step[
      *2. Tìm khoảng tứ phân vị $Delta_Q$:*
      - Cỡ mẫu: $n = 8 + 15 + 18 + 14 + 5 = 60$.
      - Lập bảng tần số tích lũy:
        #align(center)[
          #table(
            columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
            align: center,
            [Nhóm thời gian], $[0; 2)$, $[2; 4)$, $[4; 6)$, $[6; 8)$, $[8; 10)$,
            [Tần số tích lũy], [8], [23], [41], [55], [60]
          )
        ]
    ]
    #step[
      - *Tìm tứ phân vị thứ nhất $Q_1$:*
        - Ta có $n/4 = 60/4 = 15$.
        - Tần số tích lũy nhóm $[0; 2)$ là $8 < 15$. Tần số tích lũy nhóm $[2; 4)$ là $23 >= 15$. Do đó nhóm chứa $Q_1$ là $[2; 4)$.
        - Cận dưới nhóm chứa $Q_1$ là $u_2 = 2$, tần số nhóm là $n_2 = 15$, tần số tích lũy trước đó là $C_1 = 8$, độ dài nhóm $h = 2$.
        - Áp dụng công thức:
          $ Q_1 = u_2 + frac(frac(n, 4) - C_1, n_2) dot h = 2 + frac(15 - 8, 15) dot 2 = 2 + frac(14, 15) = frac(44, 15) approx 2.93 " (giờ)" $
    ]
    #step[
      - *Tìm tứ phân vị thứ ba $Q_3$:*
        - Ta có $(3n)/4 = (3 dot 60)/4 = 45$.
        - Tần số tích lũy của các nhóm trước $[6; 8)$ là $41 < 45$. Tần số tích lũy của nhóm $[6; 8)$ là $55 >= 45$. Do đó nhóm chứa $Q_3$ là $[6; 8)$.
        - Cận dưới nhóm chứa $Q_3$ là $u_4 = 6$, tần số nhóm là $n_4 = 14$, tần số tích lũy trước đó là $C_3 = 41$, độ dài nhóm $h = 2$.
        - Áp dụng công thức:
          $ Q_3 = u_4 + frac(frac(3n, 4) - C_3, n_4) dot h = 6 + frac(45 - 41, 14) dot 2 = 6 + frac(8, 14) = 6 + frac(4, 7) = frac(46, 7) approx 6.57 " (giờ)" $
    ]
    #step[
      - *Tìm khoảng tứ phân vị $Delta_Q$:*
        - Ta có:
          $ Delta_Q = Q_3 - Q_1 = frac(46, 7) - frac(44, 15) = frac(382, 105) approx 3.64 " (giờ)" $
    ]
  ],
  theme-color: c-book,
)

#dang([Bài toán thực tế ứng dụng so sánh hai mẫu số liệu], theme-color: c-book)

#vd(
  [Để đánh giá sự đồng đều về mức lương của công nhân tại hai nhà máy $A$ và $B$, một cuộc khảo sát thu thập mẫu số liệu ghép nhóm về thu nhập hàng tháng (triệu đồng) như sau:
    - *Nhà máy A*:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
          align: center,
          [Mức lương (triệu)], $[6; 8)$, $[8; 10)$, $[10; 12)$, $[12; 14]$,
          [Số công nhân], [5], [25], [15], [5]
        )
      ]
    - *Nhà máy B*:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
          align: center,
          [Mức lương (triệu)], $[6; 8)$, $[8; 10)$, $[10; 12)$, $[12; 14]$,
          [Số công nhân], [12], [13], [15], [10]
        )
      ]
    Hãy so sánh mức độ đồng đều của thu nhập công nhân hai nhà máy này bằng cách sử dụng khoảng biến thiên và khoảng tứ phân vị.
  ],
  loigiai: [
    #step[
      *1. So sánh bằng khoảng biến thiên $R$:*
      - Đối với cả hai nhà máy $A$ và $B$:
        - Đầu mút trái của nhóm đầu tiên chứa số liệu ($[6; 8)$) là $u_1 = 6$.
        - Đầu mút phải của nhóm cuối cùng chứa số liệu ($[12; 14]$) là $u_5 = 14$.
        - Khoảng biến thiên: $R_A = R_B = 14 - 6 = 8$ (triệu đồng).
      - *Nhận xét*: Khoảng biến thiên của hai nhà máy bằng nhau và bằng $8$ triệu đồng. Do đó, nếu chỉ sử dụng khoảng biến thiên, ta chưa thể kết luận nhà máy nào có thu nhập công nhân đồng đều hơn.
    ]
    #step[
      *2. So sánh bằng khoảng tứ phân vị $Delta_Q$:*
      - *Nhà máy A* (cỡ mẫu $n_A = 5 + 25 + 15 + 5 = 50$):
        - Tìm $Q_(1 A)$: Ta có $n_A / 4 = 12.5$. Nhóm chứa $Q_1$ là nhóm $[8; 10)$ vì tần số tích lũy đến nhóm này là $5 + 25 = 30 >= 12.5$.
          $ Q_(1 A) = 8 + frac(12.5 - 5, 25) dot 2 = 8.6 " (triệu đồng)" $
        - Tìm $Q_(3 A)$: Ta có $3n_A / 4 = 37.5$. Nhóm chứa $Q_3$ là nhóm $[10; 12)$ vì tần số tích lũy đến nhóm trước là $30 < 37.5$ và đến nhóm này là $30 + 15 = 45 >= 37.5$.
          $ Q_(3 A) = 10 + frac(37.5 - 30, 15) dot 2 = 11.0 " (triệu đồng)" $
        - Khoảng tứ phân vị: $Delta_(Q A) = Q_(3 A) - Q_(1 A) = 11.0 - 8.6 = 2.4$ (triệu đồng).
    ]
    #step[
      - *Nhà máy B* (cỡ mẫu $n_B = 12 + 13 + 15 + 10 = 50$):
        - Tìm $Q_(1 B)$: Ta có $n_B / 4 = 12.5$. Nhóm chứa $Q_1$ là nhóm $[8; 10)$ vì tần số tích lũy đến nhóm này là $12 + 13 = 25 >= 12.5$.
          $ Q_(1 B) = 8 + frac(12.5 - 12, 13) dot 2 = 8 + frac(1, 13) approx 8.08 " (triệu đồng)" $
        - Tìm $Q_(3 B)$: Ta có $3n_B / 4 = 37.5$. Nhóm chứa $Q_3$ là nhóm $[10; 12)$ vì tần số tích lũy đến nhóm này là $25 + 15 = 40 >= 37.5$.
          $ Q_(3 B) = 10 + frac(37.5 - 25, 15) dot 2 = 10 + frac(25, 15) = 11.67 " (triệu đồng)" $
        - Khoảng tứ phân vị: $Delta_(Q B) = Q_(3 B) - Q_(1 B) = 11.67 - 8.08 = 3.59$ (triệu đồng).
    ]
    #step[
      - *Kết luận*: Do $Delta_(Q A) = 2.4 < Delta_(Q B) = 3.59$, mức độ phân tán của 50% số liệu trung tâm ở nhà máy $A$ nhỏ hơn nhà máy $B$.
      - Vì vậy, xét về đại đa số công nhân, mức lương của công nhân nhà máy $A$ có độ đồng đều cao hơn mức lương của công nhân nhà máy $B$.
    ]
  ],
  theme-color: c-book,
)

#dang([Bài toán ngược xác định tham số của mẫu số liệu], theme-color: c-book)

#vd(
  [Khảo sát doanh thu hàng ngày (triệu đồng) của một cửa hàng tạp hóa trong một tháng (30 ngày) được ghép nhóm như sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Doanh thu (triệu)], $[0; 1)$, $[1; 2)$, $[2; 3)$, $[3; 4)$,
        [Số ngày], [4], [a], [12], [b]
      )
    ]
    Biết rằng nhóm chứa tứ phân vị thứ nhất $Q_1$ là nhóm $[1; 2)$, và tứ phân vị thứ nhất của mẫu số liệu ghép nhóm này bằng $1.35$. Hãy tính giá trị của các tham số nguyên dương $a$ và $b$.
  ],
  loigiai: [
    #step[
      - Tổng cỡ mẫu: $n = 30$ ngày. Ta có phương trình tổng tần số:
        $ 4 + a + 12 + b = 30  <=>  a + b = 14  " (1)" $
      - Vị trí của tứ phân vị thứ nhất $Q_1$ là: $n/4 = 30/4 = 7.5$.
    ]
    #step[
      - Vì nhóm chứa $Q_1$ là nhóm thứ hai $[1; 2)$ nên ta có:
        - Cận dưới $u_2 = 1$, độ dài nhóm $h = 1$.
        - Tần số nhóm chứa $Q_1$ là $n_2 = a$.
        - Tần số tích lũy của nhóm đứng trước là $C_1 = 4$.
      - Áp dụng công thức nội suy cho $Q_1$:
        $ Q_1 = 1 + frac(7.5 - 4, a) dot 1 = 1 + frac(3.5, a) $
    ]
    #step[
      - Theo giả thiết $Q_1 = 1.35$, ta có phương trình:
        $ 1 + frac(3.5, a) = 1.35  <=>  frac(3.5, a) = 0.35  <=>  a = 10 $
    ]
    #step[
      - Thay $a = 10$ vào phương trình $(1)$, ta được:
        $ 10 + b = 14  <=>  b = 4 $
      - Kiểm tra tính hợp lệ: Tần số tích lũy đến nhóm thứ hai $[1; 2)$ là $4 + 10 = 14 >= 7.5$ (thỏa mãn nhóm chứa $Q_1$ là $[1; 2)$).
      - Vậy các giá trị cần tìm là $a = 10$ và $b = 4$.
    ]
  ],
  theme-color: c-book,
)

#dang([Tìm khoảng biến thiên và khoảng tứ phân vị từ biểu đồ tần số], theme-color: c-book)

#vd(
  [Biểu đồ cột tần số ghép nhóm dưới đây thể hiện kết quả kiểm tra thời gian hoàn thành một bài test tiếng Anh (phút) của một nhóm học sinh:
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Trục tọa độ
        line((0, 0), (6.5, 0), stroke: 1pt + rgb("#4b21b6"), mark: (end: ">"))
        line((0, 0), (0, 3.8), stroke: 1pt + rgb("#4b21b6"), mark: (end: ">"))
        
        content((6.3, -0.35), text(size: 8pt)[$t$ (phút)])
        content((-0.6, 3.6), text(size: 8pt)[Tần số])
        
        let fill-col = rgb("#8b5cf6").transparentize(60%)
        let stroke-col = 1.2pt + rgb("#6d28d9")
        
        // Vẽ cột ghép nhóm
        rect((1, 0), (2, 0.8), fill: fill-col, stroke: stroke-col)  // [10; 15): 4
        rect((2, 0), (3, 2.4), fill: fill-col, stroke: stroke-col)  // [15; 20): 12
        rect((3, 0), (4, 3.2), fill: fill-col, stroke: stroke-col)  // [20; 25): 16
        rect((4, 0), (5, 1.2), fill: fill-col, stroke: stroke-col)  // [25; 30): 6
        rect((5, 0), (6, 0.4), fill: fill-col, stroke: stroke-col)  // [30; 35]: 2
        
        // Nhãn số lượng trên đỉnh
        content((1.5, 0.8 + 0.2), text(size: 8pt, weight: "bold")[4])
        content((2.5, 2.4 + 0.2), text(size: 8pt, weight: "bold")[12])
        content((3.5, 3.2 + 0.2), text(size: 8pt, weight: "bold")[16])
        content((4.5, 1.2 + 0.2), text(size: 8pt, weight: "bold")[6])
        content((5.5, 0.4 + 0.2), text(size: 8pt, weight: "bold")[2])
        
        // Nhãn trục hoành
        content((1.0, -0.25), text(size: 7.5pt)[10])
        content((2.0, -0.25), text(size: 7.5pt)[15])
        content((3.0, -0.25), text(size: 7.5pt)[20])
        content((4.0, -0.25), text(size: 7.5pt)[25])
        content((5.0, -0.25), text(size: 7.5pt)[30])
        content((6.0, -0.25), text(size: 7.5pt)[35])
        
        // Nhãn trục tung
        line((-0.05, 0.4), (0.05, 0.4))
        content((-0.3, 0.4), text(size: 7.5pt)[2])
        line((-0.05, 0.8), (0.05, 0.8))
        content((-0.3, 0.8), text(size: 7.5pt)[4])
        line((-0.05, 1.2), (0.05, 1.2))
        content((-0.3, 1.2), text(size: 7.5pt)[6])
        line((-0.05, 2.4), (0.05, 2.4))
        content((-0.3, 2.4), text(size: 7.5pt)[12])
        line((-0.05, 3.2), (0.05, 3.2))
        content((-0.3, 3.2), text(size: 7.5pt)[16])
      })
    ]
    Dựa vào biểu đồ cột tần số ghép nhóm trên, hãy xác định khoảng biến thiên $R$ và khoảng tứ phân vị $Delta_Q$ của thời gian làm bài test.
  ],
  loigiai: [
    #step[
      - Từ biểu đồ cột, ta lập được bảng tần số ghép nhóm như sau:
        #align(center)[
          #table(
            columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
            align: center,
            [Thời gian (phút)], $[10; 15)$, $[15; 20)$, $[20; 25)$, $[25; 30)$, $[30; 35]$,
            [Tần số ($n_i$)], [4], [12], [16], [6], [2],
            [Tích lũy ($C_i$)], [4], [16], [32], [38], [40]
          )
        ]
      - Tổng cỡ mẫu: $n = 4 + 12 + 16 + 6 + 2 = 40$.
    ]
    #step[
      - *Tìm khoảng biến thiên $R$:*
        - Nhóm đầu tiên chứa số liệu là $[10; 15)$ có đầu mút trái $u_1 = 10$.
        - Nhóm cuối cùng chứa số liệu là $[30; 35]$ có đầu mút phải $u_6 = 35$.
        - Khoảng biến thiên: $R = 35 - 10 = 25$ (phút).
    ]
    #step[
      - *Tìm tứ phân vị thứ nhất $Q_1$:*
        - Ta có $n/4 = 40/4 = 10$. Nhóm đầu tiên có tần số tích lũy lớn hơn hoặc bằng 10 là $[15; 20)$ (do $C_2 = 16 >= 10$).
        - Ta có: $u_2 = 15$, $n_2 = 12$, $C_1 = 4$, độ dài nhóm $h = 5$.
        - Công thức nội suy:
          $ Q_1 = 15 + frac(10 - 4, 12) dot 5 = 15 + 2.5 = 17.5 " (phút)" $
    ]
    #step[
      - *Tìm tứ phân vị thứ ba $Q_3$:*
        - Ta có $3n/4 = (3 dot 40)/4 = 30$. Nhóm đầu tiên có tần số tích lũy lớn hơn hoặc bằng 30 là $[20; 25)$ (do $C_3 = 32 >= 30$).
        - Ta có: $u_3 = 20$, $n_3 = 16$, $C_2 = 16$, độ dài nhóm $h = 5$.
        - Công thức nội suy:
          $ Q_3 = 20 + frac(30 - 16, 16) dot 5 = 20 + frac(14, 16) dot 5 = 20 + 4.375 = 24.375 " (phút)" $
    ]
    #step[
      - *Tìm khoảng tứ phân vị $Delta_Q$:*
        - Ta có:
          $ Delta_Q = Q_3 - Q_1 = 24.375 - 17.5 = 6.875 " (phút)" $
    ]
  ],
  theme-color: c-book,
)

#pagebreak()

#q-label([C. ĐỀ LUYỆN TẬP], c-book)

#include "c3-b1-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
