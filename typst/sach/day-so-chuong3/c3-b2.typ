#import "_config.typ": *

#lesson([Bài 2: Cấp Số Cộng (Tăng Trưởng Tuyến Tính)], theme-color: c-book)

#q-label([KHỞI ĐỘNG: GIAI THOẠI VỀ GAUSS], c-book)
Năm 9 tuổi, thần đồng toán học Carl Friedrich Gauss bị thầy giáo phạt tính tổng các số từ $1$ đến $100$. Trong khi cả lớp hì hục nháp, Gauss chỉ mất vài giây để đưa ra đáp án $5050$. Cậu bé đã nhận ra quy luật: $1+100 = 101, 2+99 = 101...$ Có chính xác $50$ cặp như vậy. Gauss vừa khám phá ra công thức tính tổng của một *Cấp số cộng*.

---

#muc([1. KHÁI NIỆM VÀ TÍNH CHẤT KINH ĐIỂN])

#block(breakable: false)[
  #phuongphap(title: [Định nghĩa & Số hạng tổng quát])[
    Cấp số cộng (CSC) là dãy số thỏa mãn: $u_n = u_(n-1) + d$. 
    - $d$: Công sai. ($d>0$ dãy tăng, $d<0$ dãy giảm).
    - *Công thức "nhảy cóc" (Số hạng tổng quát):*
      $ u_n = u_1 + (n - 1)d $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Tính chất nội tại của 3 số liên tiếp])[
    Ba số $a, b, c$ lập thành cấp số cộng khi và chỉ khi:
    $ a + c = 2b <=> b = (a+c)/2 $
    (Số ở giữa luôn là Trung bình cộng của hai số hai bên).
    *Mở rộng:* $u_k = (u_(k-m) + u_(k+m))/2$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Kỹ thuật "Chèn số hạng"])[
    Làm sao để chèn $k$ số vào giữa hai số $A$ và $B$ để tạo thành một CSC?
    - Ta coi $A = u_1$. Chèn thêm $k$ số nên $B$ sẽ trở thành số hạng thứ $k + 2$.
    - Khi đó $u_(k+2) = B <=> u_1 + (k+1)d = B => d = (B - A)/(k+1)$.
  ]
]

#muc([2. TỔNG CỦA $n$ SỐ HẠNG ĐẦU TIÊN])

#block(breakable: false)[
  #phuongphap(title: [Công thức tính tổng $S_n$])[
    Tổng của $n$ số hạng đầu tiên $S_n = u_1 + u_2 + ... + u_n$ được tính bằng 2 cách:
    - *Cách 1 (Như Gauss):* Biết đầu và cuối.
      $ S_n = n/2 (u_1 + u_n) $
    - *Cách 2 (Thực dụng):* Chỉ cần biết đầu và công sai.
      $ S_n = n/2 [2u_1 + (n - 1)d] $
  ]
]

#muc([3. CHUYÊN ĐỀ: TOÁN THỰC TẾ & MÔ HÌNH HÓA])

#block(breakable: false)[
  #phuongphap(title: [Mô hình 1: Thiết kế Rạp hát & Sân vận động])[
    Trong các rạp hát, người ta xếp ghế theo dạng hình nón cong. Hàng ghế đầu tiên có $u_1$ ghế. Mỗi hàng tiếp theo đều tăng thêm $d$ ghế.
    Tổng số ghế trong rạp chính là tổng của CSC.
    *Ví dụ:* Hàng 1 có 20 ghế. Hàng sau tăng 2 ghế. Rạp có 30 hàng.
    Sức chứa: $S_(30) = 30/2 [2(20) + 29(2)] = 1470$ người.
  ]
]

#align(center)[
  *Mô hình rạp hát dạng hình thang (Cấp số cộng)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let d = 0.5
    for row in range(0, 5) {
      let y = row * 0.8
      let num_seats = 5 + row * 2
      let start_x = - (num_seats * d) / 2
      for i in range(0, num_seats) {
        rect((start_x + i * d, y), (start_x + i * d + 0.4, y + 0.4), stroke: blue, fill: rgb("bae6fd"), radius: 0.1)
      }
      content((start_x - 1, y + 0.2), text(fill: luma(100))[Hàng #(row+1)])
    }
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 2: Kinh tế học - Khấu hao tài sản tuyến tính (Straight-Line Depreciation)])[
    Một công ty mua chiếc máy bay giá 500 tỷ. Kế toán quy định khấu hao đều mỗi năm 20 tỷ trong 25 năm.
    Giá trị máy bay qua các năm tạo thành một Cấp số cộng GIẢM với $d = -20$.
    - $u_1 = 500$ (Năm 0)
    - Giá trị năm thứ $n$: $u_n = 500 - 20(n-1)$.
    Đây là kỹ thuật khấu hao phổ biến nhất trong báo cáo tài chính doanh nghiệp.
  ]
]

#align(center)[
  *Đồ thị khấu hao tài sản tuyến tính (Cấp số cộng giảm)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Grid
    grid((0, 0), (5, 4), stroke: (paint: gray.lighten(60%), dash: "dashed"), step: 1)
    
    // Axes
    line((0, 0), (5.7, 0), mark: (end: ">"))
    content((5.5, -0.4), [$n$ (Năm)])
    line((0, 0), (0, 4.5), mark: (end: ">"))
    content((-0.6, 4.3), [$u_n$ (Tỷ)])
    
    // Depreciation line
    line((0, 4), (5, 0), stroke: 2pt + red)
    
    // Labels on axes
    content((-0.4, 4), [500])
    content((-0.4, 3.2), [400])
    content((-0.4, 2.4), [300])
    content((-0.4, 0), [0])
    
    content((0, -0.3), [0])
    content((1, -0.3), [5])
    content((2, -0.3), [10])
    content((5, -0.3), [25])
    
    // Dashed helper lines
    line((1, 0), (1, 3.2), stroke: (paint: gray, dash: "dotted"))
    line((0, 3.2), (1, 3.2), stroke: (paint: gray, dash: "dotted"))
    circle((1, 3.2), radius: 0.06, fill: red, stroke: none)
    
    line((2, 0), (2, 2.4), stroke: (paint: gray, dash: "dotted"))
    line((0, 2.4), (2, 2.4), stroke: (paint: gray, dash: "dotted"))
    circle((2, 2.4), radius: 0.06, fill: red, stroke: none)
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 3: Kỹ thuật - Chi phí khoan giếng lũy tiến])[
    Kỹ sư khoan một giếng dầu sâu 100m. 
    - Mét đầu tiên chi phí 1000 USD.
    - Càng khoan sâu đất càng cứng, nên từ mét thứ 2, cứ mỗi mét chi phí tăng thêm 200 USD so với mét trước đó.
    Chi phí khoan mét thứ $n$ là một CSC: $u_n = 1000 + (n-1)200$.
    *Tổng chi phí* để khoan 100m chính là tổng CSC: $S_(100) = 100/2 [2(1000) + 99(200)] = 1,090,000$ USD.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 4: Kỹ thuật xây dựng - Xếp chồng ống thép hình thang])[
    Trong các kho bãi, ống thép tròn thường được xếp chồng lên nhau tạo thành hình thang cân để đảm bảo cấu trúc ổn định, không bị lăn đổ.
    Giả sử hàng dưới cùng có $30$ ống, hàng ngay trên có ít hơn hàng dưới $1$ ống, và hàng trên cùng có $15$ ống.
    - Số ống thép ở mỗi hàng lập thành một Cấp số cộng GIẢM với $u_1 = 30, d = -1$.
    - Để tìm số hàng $n$, ta có: $u_n = u_1 + (n-1)d <=> 15 = 30 - (n-1) => n = 16$ hàng.
    - Tổng số ống thép trong kho bãi là:
      $ S_(16) = 16/2 (u_1 + u_(16)) = 8 times (30 + 15) = 360 text(" ống.") $
  ]
]

#align(center)[
  *Mô hình xếp chồng ống thép tròn (Cấp số cộng)* \
  #cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    
    let r = 0.4 
    let dy = calc.sqrt(3) * r 
    
    for row in range(0, 5) {
      let num_pipes = 6 - row
      let y = row * dy
      let start_x = - (num_pipes - 1) * r
      for i in range(0, num_pipes) {
        let cx = start_x + i * 2 * r
        circle((cx, y), radius: r, stroke: c-book, fill: rgb("e0f2fe"))
        circle((cx, y), radius: r - 0.08, stroke: c-book.lighten(30%), fill: none)
      }
      content((start_x - 1.8, y), text(size: 9pt, fill: luma(120))[Hàng #(row+1)])
    }
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 5: Vật lý - Chuyển động thẳng biến đổi đều (Quãng đường đi được theo giây)])[
    Một vật chuyển động thẳng nhanh dần đều không vận tốc đầu với gia tốc $a$ (m/s#super[2]).
    Quãng đường vật đi được trong giây thứ $n$ liên tiếp được tính bởi công thức:
    $ s_n = a/2 (2n - 1) $
    - Xét các quãng đường đi được trong giây thứ 1, thứ 2, thứ 3...:
      $s_1 = a/2, s_2 = 3a/2, s_3 = 5a/2, s_4 = 7a/2...$
    - Dãy số $(s_n)$ lập thành một Cấp số cộng với số hạng đầu $u_1 = a/2$ và công sai $d = a$.
    Đây chính là quy luật số lẻ của Galileo về sự rơi tự do và chuyển động nhanh dần đều.
  ]
]

#align(center)[
  *Quãng đường đi được trong các giây liên tiếp của vật rơi tự do (Cấp số cộng)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Draw ground/axis
    line((0, 0), (9, 0), mark: (end: ">"))
    content((9.2, -0.3), [$s$])
    
    let pos = (0, 0.8, 3.2, 7.2)
    
    // Draw vertical markers and balls
    for (i, p) in pos.enumerate() {
      circle((p, 0.4), radius: 0.2, fill: c-book, stroke: c-book.darken(20%))
      line((p, 0), (p, -0.15), stroke: 0.5pt + gray)
      content((p, -0.4), text(size: 8pt)[$t = #i text(" s")$])
    }
    
    // Bracket 1
    line((0, 0.8), (0, 0.95), (0.8, 0.95), (0.8, 0.8), stroke: 0.6pt + c-book)
    content((0.4, 1.25), text(size: 9pt, fill: c-book)[$s_1$])
    
    // Bracket 2
    line((0.8, 0.8), (0.8, 0.95), (3.2, 0.95), (3.2, 0.8), stroke: 0.6pt + c-book)
    content((2.0, 1.25), text(size: 9pt, fill: c-book)[$s_2 = 3 s_1$])
    
    // Bracket 3
    line((3.2, 0.8), (3.2, 0.95), (7.2, 0.95), (7.2, 0.8), stroke: 0.6pt + c-book)
    content((5.2, 1.25), text(size: 9pt, fill: c-book)[$s_3 = 5 s_1$])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 6: Khai thác tài nguyên - Sản lượng suy giảm tuyến tính])[
    Một mỏ than bắt đầu khai thác với sản lượng năm đầu tiên là $u_1 = 5$ triệu tấn. Do điều kiện vỉa quặng ngày càng sâu và khó tiếp cận, mỗi năm tiếp theo sản lượng khai thác giảm đi $0.2$ triệu tấn so với năm trước.
    - Dãy sản lượng khai thác hàng năm lập thành một Cấp số cộng với $u_1 = 5$, công sai $d = -0.2$.
    - Sản lượng năm thứ $n$: $u_n = 5 - 0.2(n-1)$.
    - Tổng sản lượng khai thác được sau $10$ năm là:
      $ S_(10) = 10/2 [2 u_1 + 9d] = 5 times [2(5) + 9(-0.2)] = 5 times [10 - 1.8] = 41 text(" triệu tấn.") $
  ]
]

#align(center)[
  *Biểu đồ cột sản lượng giảm dần theo năm (Cấp số cộng)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Axes
    line((0, 0), (6, 0), mark: (end: ">"))
    content((5.8, -0.4), [$n$ (Năm)])
    line((0, 0), (0, 3.5), mark: (end: ">"))
    content((-0.6, 3.3), [$u_n$ (Triệu)])
    
    for i in range(1, 6) {
      let val = 5 - 0.2 * (i - 1)
      let h = val * 0.5
      let x = i
      rect((x - 0.3, 0), (x + 0.3, h), fill: rgb("bae6fd"), stroke: c-book)
      content((x, -0.3), text(size: 8pt)[#i])
      content((x, h + 0.25), text(size: 7pt, fill: c-book)[#val])
    }
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 7: Quản trị nhân sự - Thang bảng lương lũy tiến (Lương tăng định kỳ)])[
    Anh Nam được tuyển dụng vào một cơ quan Nhà nước với mức lương năm đầu tiên là $u_1 = 120$ triệu đồng. Cơ quan áp dụng chính sách bậc lương: cứ sau mỗi năm làm việc, mức lương năm tiếp theo sẽ được tăng thêm một khoản cố định là $d = 10$ triệu đồng.
    - Mức lương năm thứ $n$ là một Cấp số cộng: $u_n = 120 + (n-1)10$.
    - Tổng số tiền lương anh Nam nhận được sau đúng $15$ năm công tác là:
      $ S_(15) = 15/2 [2 u_1 + 14d] = 15/2 [2(120) + 14(10)] = 15/2 [240 + 140] = 15/2 times 380 = 2850 text(" triệu đồng.") $
  ]
]

#align(center)[
  *Đồ thị thang bảng lương bậc thang theo năm (Cấp số cộng)* \
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Axes
    line((0, 0), (6, 0), mark: (end: ">"))
    content((5.8, -0.3), [$n$ (Năm)])
    line((0, 0), (0, 3.5), mark: (end: ">"))
    content((-0.6, 3.3), [$u_n$ (Triệu)])
    
    for i in range(1, 6) {
      let y = 1.0 + (i - 1) * 0.5
      line((i - 1, y), (i, y), stroke: 1.5pt + c-book)
      if i > 1 {
        let prev_y = 1.0 + (i - 2) * 0.5
        line((i - 1, prev_y), (i - 1, y), stroke: (paint: c-book, dash: "dashed"))
      }
      circle((i - 1, y), radius: 0.04, fill: c-book, stroke: none)
      circle((i, y), radius: 0.04, fill: c-book, stroke: none)
      content((i - 0.5, y + 0.25), text(size: 8pt)[#(110 + i * 10)])
      content((i - 0.5, -0.25), text(size: 8pt)[Năm #i])
    }
  })
]
