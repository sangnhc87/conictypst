#import "_config.typ": *

#lesson([Bài 3: Cấp Số Nhân (Tăng Trưởng Bùng Nổ)], theme-color: c-book)

#q-label([KHỞI ĐỘNG: NGHỊCH LÝ HẠT THÓC VÀ BÀN CỜ VUA], c-book)
Truyền thuyết kể rằng, một nhà thông thái Ấn Độ đã tặng vua bàn cờ vua. Vua hỏi thưởng gì, ông đáp: "1 hạt thóc vào ô thứ nhất, 2 hạt vào ô hai, 4 hạt vào ô ba, cứ thế gấp đôi đến ô 64". Vua cười nhạo. Nhưng tổng số thóc tính ra là $18,446,744,073,709,551,615$ hạt, tương đương toàn bộ sản lượng lúa mạch của Trái Đất trong 1500 năm!
Sức mạnh khủng khiếp đó chính là *Cấp số nhân*.

---

#muc([1. KHÁI NIỆM VÀ TÍNH CHẤT KINH ĐIỂN])

#block(breakable: false)[
  #phuongphap(title: [Định nghĩa & Số hạng tổng quát])[
    Cấp số nhân (CSN) là dãy số thỏa mãn: $u_n = u_(n-1) dot q$.
    - $q$: Công bội. 
    - *Công thức "nhảy cóc" (Số hạng tổng quát):*
      $ u_n = u_1 dot q^(n - 1) $
    (Sự khác biệt cốt lõi: CSC là "cộng dồn", CSN là "nhân gấp bội").
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Tính chất nội tại của 3 số liên tiếp])[
    Ba số $a, b, c$ lập thành cấp số nhân khi và chỉ khi:
    $ a dot c = b^2 <=> |b| = sqrt(a c) $
    (Số ở giữa luôn là Trung bình nhân của hai số hai bên).
    *Mở rộng:* $u_k^2 = u_(k-m) dot u_(k+m)$.
  ]
]

#muc([2. TỔNG CỦA $n$ SỐ HẠNG ĐẦU TIÊN & TỔNG LÙI VÔ HẠN])

#block(breakable: false)[
  #phuongphap(title: [Công thức tính tổng $S_n$])[
    Tổng $S_n = u_1 + u_2 + ... + u_n$ được tính bằng:
    $ S_n = u_1 (1 - q^n) / (1 - q) quad (q != 1) $
    *Lưu ý:* Nếu $q=1$, dãy số là hằng số nên $S_n = n dot u_1$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Tổng CSN Lùi vô hạn ($|q| < 1$)])[
    Khi $|q| < 1$, mỗi số hạng tiếp theo càng ngày càng nhỏ dần về $0$. Dù cộng vô hạn lần, tổng vẫn có giới hạn cố định:
    $ S_oo = u_1 / (1 - q) $
  ]
]

#muc([3. CHUYÊN ĐỀ: TOÁN THỰC TẾ ĐỈNH CAO])

#block(breakable: false)[
  #phuongphap(title: [Mô hình 1: Tài chính Kế toán (Lãi kép & Gửi góp định kỳ)])[
    *1. Lãi kép (Compound Interest):* Gửi 1 cục tiền $A$ với lãi $r$. Tiền thành Cấp số nhân.
    $ T_n = A(1+r)^n $
    *2. Gửi góp định kỳ (Annuity):* Đầu MỖI THÁNG đều đặn gửi $A$ đồng. Cuối tháng $n$ thu về bao nhiêu?
    Đây là tổng của $n$ cái Cấp số nhân khác nhau:
    $ S_n = A/r (1+r) [(1+r)^n - 1] $
    *(Đây là công thức bắt buộc phải thuộc nếu muốn làm bài điểm 9, 10).*
  ]
]

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      *Đồ thị tăng trưởng lãi kép (CSN)* \ \
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        
        // Axes
        line((0, 0), (5.5, 0), stroke: 1pt + gray, mark: (end: ">"))
        content((5.2, -0.4), [kỳ $n$])
        line((0, 0), (0, 4.2), stroke: 1pt + gray, mark: (end: ">"))
        content((-0.4, 4.0), [$T_n$])
        
        // Bars
        let heights = (0.6, 0.84, 1.18, 1.65, 2.31, 3.23)
        let pts = ()
        for i in range(0, 6) {
          let h = heights.at(i)
          pts.push((i, h))
          rect((i - 0.2, 0), (i + 0.2, h), fill: rgb("bae6fd"), stroke: c-book)
          if i == 0 {
            content((i, h + 0.3), text(size: 7pt)[$A$])
          } else if i == 1 {
            content((i, h + 0.3), text(size: 7pt)[$T_1$])
          } else if i == 2 {
            content((i, h + 0.3), text(size: 7pt)[$T_2$])
          } else if i == 5 {
            content((i, h + 0.3), text(size: 7pt)[$T_n$])
          }
          content((i, -0.3), text(size: 7pt)[#i])
        }
        // Trend line
        line(..pts, stroke: 1.2pt + rgb("dc2626"))
      })
    ],
    [
      *Sơ đồ tích lũy gửi góp về tương lai* \ \
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        
        // Timeline axis
        line((0, 0), (5.5, 0), stroke: 1pt + gray, mark: (end: ">"))
        content((5.2, -0.4), [Thời gian])
        
        // Ticks
        content((0, 0.3), [0])
        content((1.2, 0.3), [1])
        content((2.4, 0.3), [2])
        content((3.6, 0.3), [...])
        content((4.8, 0.3), [$n-1$])
        content((5.5, 0.3), [$n$])
        
        // Deposits A (downward arrows)
        line((0, 0), (0, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
        content((0, -1.1), text(size: 7pt, fill: blue)[$A$])
        
        line((1.2, 0), (1.2, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
        content((1.2, -1.1), text(size: 7pt, fill: blue)[$A$])
        
        line((2.4, 0), (2.4, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
        content((2.4, -1.1), text(size: 7pt, fill: blue)[$A$])
        
        line((4.8, 0), (4.8, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
        content((4.8, -1.1), text(size: 7pt, fill: blue)[$A$])
        
        // Upward arrow S_n at t=n
        line((5.5, 0), (5.5, 2.5), stroke: 1.8pt + rgb("16a34a"), mark: (end: ">", size: 0.15))
        content((5.5, 2.8), text(size: 8pt, fill: rgb("16a34a"), weight: "bold")[$S_n$])
        
        // Accumulation curves (forward Bezier curves above axis)
        bezier((0, 0), (5.5, 0.1), (2.75, 1.8), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
        content((2.0, 1.1), text(size: 7pt, fill: gray)[$A(1+r)^n$])
        
        bezier((1.2, 0), (5.5, 0.3), (3.35, 1.4), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
        content((3.35, 0.8), text(size: 7pt, fill: gray)[$A(1+r)^(n-1)$])
        
        bezier((4.8, 0), (5.5, 0.5), (5.15, 0.8), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
        content((5.15, 0.4), text(size: 7pt, fill: gray)[$A(1+r)$])
      })
    ]
  )
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 2: Vật lý Hạt nhân - Phân rã Carbon-14])[
    Đồng vị Carbon-14 có chu kỳ bán rã khoảng 5730 năm (cứ sau 5730 năm, lượng $"C14"$ trong hóa thạch giảm đi một nửa).
    Lượng $"C14"$ còn lại theo thời gian $t$ là một Cấp số nhân:
    $ M(t) = M_0 dot (1/2)^(t/5730) $
    Nhờ công thức này, các nhà khảo cổ đo lượng Carbon còn lại để đoán chính xác xương khủng long hay xác ướp Ai Cập sống cách đây bao nhiêu ngàn năm.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 3: Hình học Fractal - Bông tuyết Koch])[
    Bắt đầu từ 1 tam giác đều cạnh $a$. Ở mỗi bước, chia mỗi cạnh làm 3 đoạn, xây 1 tam giác đều nhỏ lên đoạn giữa.
    - Chu vi bông tuyết tăng theo CSN công bội $q = 4/3 > 1 =>$ Chu vi tiến tới vô cực!
    - Tuy nhiên, diện tích của bông tuyết lại là tổng của một CSN lùi vô hạn với $q = 4/9 < 1 =>$ Diện tích là một số Hữu hạn!
    *Nghịch lý: Một hình có chu vi dài vô tận nhưng lại có thể nhét vừa trong một mảnh giấy hữu hạn!*
  ]
]

#align(center)[
  *Quy trình dựng Đường cong Koch (Cấp số nhân)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Step 0: Line at y=5.0
    draw-koch-curve(0, 5.0, 6, 5.0, 0, 0, 1.2pt + c-book)
    content((3, 4.6), text(size: 9pt)[Bước 0: 1 đoạn thẳng độ dài $a$])
    
    // Step 1: Line at y=2.5
    draw-koch-curve(0, 2.5, 6, 2.5, 0, 1, 1.2pt + c-book)
    content((3, 2.1), text(size: 9pt)[Bước 1: 4 đoạn thẳng, mỗi đoạn độ dài $a/3$ (Chu vi = $4/3 a$)])
    
    // Step 2: Line at y=0.0
    draw-koch-curve(0, 0.0, 6, 0.0, 0, 2, 1pt + c-book)
    content((3, -0.4), text(size: 9pt)[Bước 2: 16 đoạn thẳng, mỗi đoạn độ dài $a/9$ (Chu vi = $16/9 a$)])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 3b: Hình học Fractal - Tam giác Sierpinski & Thảm Sierpinski])[
    Tam giác Sierpinski và Thảm Sierpinski là các cấu trúc phân hình kinh điển khác, được tạo thành bằng cách loại bỏ liên tiếp các phần hình học ở giữa theo tỷ lệ cấp số nhân.
    - *Tam giác Sierpinski*: Mỗi bước loại bỏ $1/4$ diện tích còn lại ở giữa (công bội diện tích chưa tô là $q = 3/4 < 1$).
    - *Thảm Sierpinski*: Một hình vuông chia thành 9 hình vuông nhỏ, loại bỏ ô chính giữa. Ở mỗi bước tiếp theo, diện tích phần còn lại nhân với công bội $q = 8/9 < 1$.
    Cả hai hình này đều có diện tích phần còn lại tiến về $0$ khi số bước thực hiện tiến đến vô cùng!
  ]
]

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(center)[
      *Tam giác Sierpinski (Cấp 4)* \
      #cetz.canvas(length: 1.0cm, {
        import cetz.draw: *
        line((0, 0), (4, 0), (2, 3.464), close: true, fill: c-book.lighten(15%), stroke: 0.6pt + c-book)
        draw-sierpinski(0, 0, 4, 0, 2, 3.464, 1, 5, rgb("#f6f8f4"), 0.3pt + c-book)
      })
    ],
    align(center)[
      *Thảm Sierpinski (Cấp 3)* \
      #cetz.canvas(length: 1.0cm, {
        import cetz.draw: *
        rect((0, 0), (4, 4), fill: c-book.lighten(15%), stroke: 0.6pt + c-book)
        draw-sierpinski-carpet(0, 0, 4, 4, 1, 5, rgb("#f6f8f4"), 0.3pt + c-book)
      })
    ]
  )
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 3c: Hình học Fractal Mở rộng (3D & Cây phân nhánh)])[
    Ngoài các dạng cơ bản, hình học Fractal còn ứng dụng vào việc tạo ra các cấu trúc 3D phức tạp hoặc mô phỏng sự phân nhánh của cây xanh trong tự nhiên.
    - *Tứ diện Sierpinski (Tetrix)*: Mở rộng của Tam giác Sierpinski trong không gian 3D. Mỗi bước chia một tứ diện thành 4 tứ diện nhỏ hơn ở các góc. Khối lượng/Thể tích giảm dần về 0 nhưng diện tích bề mặt không đổi!
    - *Cây Pythagoras (Pythagoras Tree)*: Một fractal được xây dựng bằng cách vẽ các hình vuông. Từ một hình vuông gốc, xây dựng một tam giác vuông cân trên cạnh trên, rồi tiếp tục xây dựng các hình vuông trên hai cạnh góc vuông của tam giác đó.
    - *Cây nhị phân (Fractal Canopy)*: Mô phỏng sự phát triển của cành cây bằng cách lặp lại quy tắc rẽ nhánh theo một góc cố định, chiều dài cành giảm dần theo cấp số nhân.
  ]
]

#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 10pt,
    align(center)[
      *Tứ diện Sierpinski 3D* \
      #cetz.canvas(length: 0.8cm, {
        let p1 = (0, 3)
        let p2 = (-2, -1)
        let p3 = (2, -1)
        let p4 = (0, -2)
        draw-sierpinski-3d(p1, p2, p3, p4, 0, 4, rgb("38bdf8"), rgb("0284c7"))
      })
    ],
    align(center)[
      *Cây Pythagoras* \
      #cetz.canvas(length: 0.8cm, {
        draw-pythagoras-tree(-0.5, 0, 0.5, 0, 0, 6, rgb("22c55e"))
      })
    ],
    align(center)[
      *Cây Fractal (Canopy)* \
      #cetz.canvas(length: 0.8cm, {
        draw-fractal-canopy(0, 0, 0, 1.5, 0, 8, 25deg, 0.75, 0.8pt + rgb("84cc16"))
      })
    ]
  )
]


#block(breakable: false)[
  #phuongphap(title: [Mô hình 4: Sinh học - Sự phân đôi tế bào / Vi khuẩn (Binary Fission)])[
    Tế bào vi khuẩn Escherichia coli (E. coli) trong điều kiện lý tưởng cứ sau 20 phút lại phân đôi một lần.
    - Ban đầu có $1$ tế bào ($u_1 = 1$).
    - Sau 20 phút (thế hệ 2) có $2$ tế bào ($u_2 = 2$).
    - Sau 40 phút (thế hệ 3) có $4$ tế bào ($u_3 = 4$).
    Số tế bào ở thế hệ thứ $n$ lập thành một Cấp số nhân với $u_1 = 1$, công bội $q = 2$.
    - Công thức tổng quát: $u_n = 2^(n-1)$.
    - Sau 4 giờ (tương ứng với 12 chu kỳ phân đôi, tức thế hệ thứ 13):
      $ u_(13) = 2^(12) = 4096 text(" tế bào.") $
  ]
]

#align(center)[
  *Sơ đồ phân đôi tế bào (Cấp số nhân)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    circle((0, 2), radius: 0.3, fill: rgb("bae6fd"), stroke: c-book)
    content((0, 2), text(size: 8pt, weight: "bold")[$u_1$])
    
    circle((-1.5, 0.5), radius: 0.3, fill: rgb("7dd3fc"), stroke: c-book)
    content((-1.5, 0.5), text(size: 8pt, weight: "bold")[$u_2$])
    circle((1.5, 0.5), radius: 0.3, fill: rgb("7dd3fc"), stroke: c-book)
    content((1.5, 0.5), text(size: 8pt, weight: "bold")[$u_2$])
    
    circle((-2.25, -1), radius: 0.3, fill: rgb("38bdf8"), stroke: c-book)
    content((-2.25, -1), text(size: 8pt, weight: "bold")[$u_3$])
    circle((-0.75, -1), radius: 0.3, fill: rgb("38bdf8"), stroke: c-book)
    content((-0.75, -1), text(size: 8pt, weight: "bold")[$u_3$])
    circle((0.75, -1), radius: 0.3, fill: rgb("38bdf8"), stroke: c-book)
    content((0.75, -1), text(size: 8pt, weight: "bold")[$u_3$])
    circle((2.25, -1), radius: 0.3, fill: rgb("38bdf8"), stroke: c-book)
    content((2.25, -1), text(size: 8pt, weight: "bold")[$u_3$])
    
    line((0, 1.7), (-1.5, 0.8), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    line((0, 1.7), (1.5, 0.8), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    
    line((-1.5, 0.2), (-2.25, -0.7), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    line((-1.5, 0.2), (-0.75, -0.7), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    line((1.5, 0.2), (0.75, -0.7), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    line((1.5, 0.2), (2.25, -0.7), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    
    content((-4, 2), text(size: 8pt, fill: luma(100))[Ban đầu ($t=0$)])
    content((-4, 0.5), text(size: 8pt, fill: luma(100))[Sau 20 phút])
    content((-4, -1), text(size: 8pt, fill: luma(100))[Sau 40 phút])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 5: Vật lý - Quả bóng nảy giảm độ cao (Bouncing Ball)])[
    Một quả bóng được thả từ độ cao ban đầu $H$. Mỗi lần chạm đất, nó nảy lên độ cao bằng $q$ lần độ cao trước đó ($0 < q < 1$).
    - Quãng đường di chuyển gồm: rơi lần đầu ($H$), các lần nảy lên và rơi xuống tiếp theo ($2 H q, 2 H q^2, 2 H q^3...$).
    - Tổng quãng đường di chuyển cho đến khi bóng dừng hẳn là:
      $ S = H + 2 H q + 2 H q^2 + 2 H q^3 + ... $
      $ S = H + 2 H q (1 + q + q^2 + ...) $
    - Do $|q| < 1$, ta áp dụng tổng của Cấp số nhân lùi vô hạn:
      $ S = H + (2 H q) / (1 - q) = H (1 + q) / (1 - q) $
    *Ví dụ:* Nếu $H = 10$ m và $q = 3/4$, ta có $S = 10 dot (1 + 3/4) / (1 - 3/4) = 70$ m.
  ]
]

#align(center)[
  *Quỹ đạo nảy giảm độ cao của quả bóng (Cấp số nhân lùi vô hạn)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    line((-1, 0), (7, 0), stroke: 1.5pt + gray)
    
    line((0, 3), (0, 0), stroke: (paint: c-book, dash: "dashed"), mark: (end: ">", size: 0.15))
    circle((0, 3), radius: 0.15, fill: red, stroke: red)
    content((-0.4, 1.5), text(size: 8pt)[$H$])
    
    bezier((0, 0), (2, 0), (1, 4.5), stroke: 1.2pt + c-book)
    circle((1, 2.25), radius: 0.08, fill: red, stroke: none)
    content((1, 2.5), text(size: 8pt)[$H q$])
    
    bezier((2, 0), (3.5, 0), (2.75, 3.375), stroke: 1.2pt + c-book)
    circle((2.75, 1.6875), radius: 0.08, fill: red, stroke: none)
    content((2.75, 1.9), text(size: 8pt)[$H q^2$])
    
    bezier((3.5, 0), (4.625, 0), (4.06, 2.52), stroke: 1.2pt + c-book)
    bezier((4.625, 0), (5.46, 0), (5.04, 1.88), stroke: 1.2pt + c-book)
    
    content((6.2, 0.3), [...])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Ví dụ bổ sung: Con lắc đơn dao động tắt dần (Cấp số nhân lùi vô hạn)])[
    Khi một con lắc đơn dao động, do lực cản của không khí và ma sát ở chốt treo, biên độ dao động (chiều dài quãng đường mỗi lần vung từ biên này sang biên kia) giảm dần theo cấp số nhân lùi vô hạn.
    - Lần vung đầu tiên dài $u_1$ cm.
    - Lần vung thứ hai dài $u_2 = u_1 dot q$ cm ($0 < q < 1$).
    - Tổng quãng đường con lắc di chuyển được cho đến khi dừng hẳn là:
      $ S = u_1 + u_2 + u_3 + ... = u_1 / (1 - q) $
  ]
]

#align(center)[
  *Quỹ đạo dao động tắt dần của con lắc đơn (Cấp số nhân lùi vô hạn)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Ceiling
    line((-2, 3), (2, 3), stroke: 1.5pt + gray)
    circle((0, 3), radius: 0.06, fill: black)
    
    // Axis
    line((0, 3), (0, 0), stroke: (paint: gray, dash: "dotted"))
    
    // Swing 1 (left side): length 3, angle 30 degrees
    let x1 = -1.5
    let y1 = 0.402
    line((0, 3), (x1, y1), stroke: 0.8pt + gray)
    circle((x1, y1), radius: 0.2, fill: rgb("bae6fd"), stroke: c-book)
    content((x1 - 0.4, y1 - 0.4), text(size: 8pt)[$u_1$])
    
    // Swing 2 (right side): angle 20 degrees
    let x2 = 1.026
    let y2 = 0.181
    line((0, 3), (x2, y2), stroke: (paint: gray, dash: "dashed"))
    circle((x2, y2), radius: 0.17, fill: rgb("7dd3fc"), stroke: c-book.lighten(20%))
    content((x2 + 0.4, y2 - 0.4), text(size: 8pt)[$u_2$])
    
    // Swing 3 (left side): angle 14 degrees
    let x3 = -0.725
    let y3 = 0.09
    line((0, 3), (x3, y3), stroke: (paint: gray, dash: "dashed"))
    circle((x3, y3), radius: 0.14, fill: rgb("38bdf8"), stroke: c-book.lighten(40%))
    content((x3 - 0.4, y3 - 0.4), text(size: 8pt)[$u_3$])
    
    // Curved arrows for swing paths
    arc((0, 3), start: 240deg, stop: 290deg, radius: 2.8, stroke: (paint: red, dash: "dashed"), mark: (end: ">", size: 0.12))
    arc((0, 3), start: 290deg, stop: 256deg, radius: 2.6, stroke: (paint: red, dash: "dashed"), mark: (end: ">", size: 0.12))
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 6: Tài chính ngân hàng - Bài toán mua trả góp và Trục thời gian chiết khấu (Amortization)])[
    *Bản chất cốt lõi: Giá trị thời gian của tiền tệ (Time Value of Money).*
    Lãi suất phát sinh từ trục thời gian: một đồng tiền ở tương lai luôn có giá trị thấp hơn một đồng tiền ở hiện tại. 
    Khi mượn số tiền gốc $V$ tại thời điểm $t=0$, người mua hoàn trả định kỳ số tiền cố định $X$ vào cuối mỗi kỳ tại các thời điểm $t=1, 2, ..., N$. 
    - Để xóa hết nợ, tổng các khoản trả $X$ quy về giá trị hiện tại (Present Value - PV) ở thời điểm $t=0$ phải đúng bằng khoản nợ gốc:
      $ V = X / (1+r) + X / (1+r)^2 + ... + X / (1+r)^N $
    - Vế phải chính là tổng của một cấp số nhân hữu hạn gồm $N$ số hạng, số hạng đầu $u_1 = X / (1+r)$ và công bội $q = 1 / (1+r)$ ($q < 1$):
      $ V = u_1 dot (1 - q^N) / (1 - q) = X / (1+r) dot (1 - (1+r)^(-N)) / (1 - 1 / (1+r)) = X dot (1 - (1+r)^(-N)) / r $
    - Giải phương trình trên theo $X$, ta có công thức tính số tiền phải trả mỗi kỳ:
      $ X = (V dot r dot (1+r)^N) / ((1+r)^N - 1) $
  ]
]

#align(center)[
  *Sơ đồ quy đổi dòng tiền trả góp về hiện tại (Nguồn gốc lãi suất)* \
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Timeline axis
    line((0, 0), (6, 0), stroke: 1pt + gray, mark: (end: ">"))
    content((5.8, 0.3), [Thời gian])
    
    // Ticks
    content((0, 0.3), [0])
    content((1.2, 0.3), [1])
    content((2.4, 0.3), [2])
    content((3.6, 0.3), [...])
    content((4.8, 0.3), [$N$])
    
    // Upward arrow V at t=0
    line((0, 0), (0, 1.8), stroke: 2pt + rgb("16a34a"), mark: (end: ">", size: 0.15))
    content((0, 2.1), text(size: 9pt, fill: rgb("16a34a"), weight: "bold")[Vốn vay gốc $V$])
    
    // Repayments X at t=1, 2, N
    line((1.2, 0), (1.2, -1.2), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.15))
    content((1.2, -1.5), text(fill: rgb("dc2626"))[$X$])
    
    line((2.4, 0), (2.4, -1.2), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.15))
    content((2.4, -1.5), text(fill: rgb("dc2626"))[$X$])
    
    line((4.8, 0), (4.8, -1.2), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.15))
    content((4.8, -1.5), text(fill: rgb("dc2626"))[$X$])
    
    // Curved discounting arrows (Bezier curves going backwards below axis)
    bezier((1.2, -1.2), (0, -0.2), (0.6, -1.0), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.1))
    content((0.8, -0.6), text(size: 8pt, fill: blue)[$"PV"_1 = X/(1+r)$])
    
    bezier((2.4, -1.2), (0, -0.4), (1.2, -1.6), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.1))
    content((1.8, -1.1), text(size: 8pt, fill: blue)[$"PV"_2 = X/(1+r)^2$])
    
    bezier((4.8, -1.2), (0, -0.6), (2.4, -2.4), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.1))
    content((3.5, -1.8), text(size: 8pt, fill: blue)[$"PV"_N = X/(1+r)^N$])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 7: Y học - Liều dùng thuốc tích lũy và Nồng độ bão hòa (Steady State)])[
    Một bệnh nhân uống định kỳ một liều thuốc $D$ mg sau mỗi khoảng thời gian $T$ giờ. Giả sử giữa các lần uống, cơ thể đào thải $p\%$ lượng thuốc đang có (tức là còn lại tỷ lệ $q = 1 - p\%$ với $0 < q < 1$).
    - Lượng thuốc trong cơ thể ngay sau liều thứ $n$ liên tiếp là:
      $ u_n = D + D q + D q^2 + ... + D q^(n-1) = D (1 - q^n) / (1 - q) $
    - Khi điều trị dài ngày ($n -> oo$), lượng thuốc tích lũy trong cơ thể sẽ tiệm cận đến một giới hạn bão hòa (không tăng vô hạn gây ngộ độc):
      $ u_oo = D / (1 - q) = D / p\% $
    *Ví dụ:* Nếu uống $100$ mg mỗi ngày, cơ thể đào thải $40\%$ lượng thuốc ($q = 0.6$), lượng thuốc bão hòa là $100 / (1 - 0.6) = 250$ mg.
  ]
]

#align(center)[
  *Đồ thị nồng độ thuốc trong cơ thể tiệm cận giới hạn bão hòa (CSN lùi vô hạn)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Axes
    line((0, 0), (7, 0), mark: (end: ">"))
    content((6.8, -0.4), [$t$ (Ngày)])
    line((0, 0), (0, 4.2), mark: (end: ">"))
    content((-0.6, 4.0), [$C$ (mg)])
    
    // Steady state limit line (y = 2.5 represents 250mg)
    line((0, 2.5), (6.5, 2.5), stroke: (paint: red, dash: "dashed"))
    content((5.8, 2.8), text(fill: red, size: 8pt)[Bão hòa $250$ mg])
    
    // We draw the sawtooth curve.
    let y_val = 0.0
    for i in range(0, 6) {
      let t_start = i
      let t_end = i + 1
      
      // Spike (vertical line)
      let spike_y = y_val + 1.0
      line((t_start, y_val), (t_start, spike_y), stroke: 1.2pt + c-book)
      
      // Decay curve
      let decay_y = spike_y * 0.6
      line((t_start, spike_y), (t_end, decay_y), stroke: 1.2pt + c-book)
      
      y_val = decay_y
      
      // Labels on time axis
      content((t_start, -0.3), text(size: 7pt)[#i])
    }
    
    // Label y-axis points
    content((-0.4, 1.0), [100])
    content((-0.4, 2.5), [250])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 8: Công nghệ môi trường - Hệ màng lọc nhiều lớp (Multi-Stage Filtration)])[
    Để xử lý nước thải công nghiệp, người ta dẫn nước qua hệ thống gồm nhiều màng lọc xếp liên tiếp. Mỗi màng lọc loại bỏ được đúng $30\%$ lượng chất độc hại còn lại trong nước.
    - Cường độ chất độc hại còn lại sau tấm lọc thứ $n$ lập thành một Cấp số nhân giảm với công bội $q = 1 - 0.3 = 0.7$.
    - Nếu nồng độ ban đầu là $C_0$, nồng độ sau $n$ lớp lọc là: $C_n = C_0 dot (0.7)^n$.
    - Để nồng độ chất hại giảm xuống dưới $5\%$ so với ban đầu ($C_n < 0.05 C_0$):
      $ 0.7^n < 0.05 => n > log_(0.7)(0.05) approx 8.39 $
    Do đó, hệ thống cần ít nhất $9$ lớp màng lọc để đảm bảo tiêu chuẩn xả thải.
  ]
]

#align(center)[
  *So sánh Tăng trưởng Tuyến tính (CSC) và Bùng nổ (CSN)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Axes
    line((0, 0), (6, 0), mark: (end: ">"))
    content((5.8, -0.4), [$n$ (Thời gian)])
    line((0, 0), (0, 5), mark: (end: ">"))
    content((-0.5, 4.8), [$u_n$])
    
    // CSC (Linear)
    line((0, 0.5), (5, 2.5), stroke: 1.5pt + blue)
    content((5.5, 2.5), text(fill: blue)[CSC (Tuyến tính)])
    
    // CSN (Exponential)
    let csn-points = ()
    for i in range(0, 50) {
      let x = i * 0.1
      let y = 0.5 * calc.pow(1.6, x)
      csn-points.push((x, y))
    }
    line(..csn-points, stroke: 1.5pt + red)
    content((4, 4.5), text(fill: red)[CSN (Bùng nổ)])
  })
]
