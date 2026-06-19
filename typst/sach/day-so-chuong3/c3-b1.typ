#import "_config.typ": *

#lesson([Bài 1: Dãy Số và Kỹ Thuật Truy Hồi], theme-color: c-book)

#q-label([KHỞI ĐỘNG: TOÁN HỌC TRONG HOA HƯỚNG DƯƠNG], c-book)
Bạn đã bao giờ đếm số cánh của một bông hoa cúc, hay số đường xoắn ốc trên một quả dứa chưa? Chúng không bao giờ là những con số ngẫu nhiên. Chúng luôn tuân theo một danh sách các con số được tự nhiên sắp xếp hoàn hảo: $1, 1, 2, 3, 5, 8, 13, 21, ...$ Đây chính là dãy Fibonacci khứ danh, một ví dụ tuyệt đẹp về *Dãy số*.

---

#muc([1. PHƯƠNG PHÁP QUY NẠP TOÁN HỌC])
Để chứng minh một mệnh đề liên quan đến dãy số đúng với mọi $n in NN^*$, ta không thể thử từng số một vì $NN^*$ là vô hạn. Ta sử dụng hiệu ứng Domino - gọi là *Phương pháp Quy nạp toán học*.

#block(breakable: false)[
  #phuongphap(title: [3 Bước Quy Nạp Kinh Điển])[
    Để chứng minh mệnh đề $P(n)$ đúng với mọi $n >= 1$:
    - *Bước 1 (Khởi tạo):* Chứng minh $P(1)$ đúng. (Làm đổ quân Domino đầu tiên).
    - *Bước 2 (Giả thiết quy nạp):* Giả sử mệnh đề đúng với $n = k >= 1$ (Tức là $P(k)$ đúng).
    - *Bước 3 (Bước nhảy):* Chứng minh mệnh đề cũng đúng với $n = k + 1$ (Quân Domino thứ $k$ đổ sẽ làm quân $k+1$ đổ).
    *Kết luận:* Mệnh đề đúng với mọi $n in NN^*$.
  ]
]

#muc([2. KHÁI NIỆM VÀ TÍNH CHẤT DÃY SỐ])

#block(breakable: false)[
  #phuongphap(title: [Các cách cho một dãy số])[
    1. *Cho bằng công thức số hạng tổng quát:* $u_n = 2n + 1$. Cho phép tính ngay $u_5 = 11$.
    2. *Cho bằng hệ thức truy hồi (Recursive):* Cho biết số hạng đầu và công thức tính $u_n$ dựa vào các số đứng trước. Ví dụ: $u_1=1, u_n = u_(n-1) + 2$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Tính Tăng/Giảm và Bị Chặn])[
    - *Tính đơn điệu:* Xét $H = u_(n+1) - u_n$. Nếu $H > 0$ thì dãy tăng; $H < 0$ thì dãy giảm.
    - *Tính bị chặn:* Dãy số $(u_n)$ bị chặn nếu tồn tại số $m, M$ sao cho $m <= u_n <= M$ với mọi $n$.
  ]
]

#muc([3. KỸ THUẬT TÌM SỐ HẠNG TỔNG QUÁT TỪ TRUY HỒI])
Truy hồi rất khó để tính số hạng thứ 100. Ta phải tìm ra công thức tổng quát $u_n = f(n)$.

#block(breakable: false)[
  #phuongphap(title: [Dạng cơ bản: $u_(n+1) = a dot u_n + b$ (Dãy tuyến tính bậc nhất)])[
    Cho $u_1$ và hệ thức $u_(n+1) = a dot u_n + b$ với $a != 1$.
    - *Bước 1:* Tìm hằng số $c$ sao cho $c = a dot c + b => c = b / (1 - a)$.
    - *Bước 2:* Đặt dãy phụ $v_n = u_n - c$.
    - *Bước 3:* Chứng minh $(v_n)$ là Cấp số nhân công bội $a$, từ đó suy ra $u_n$.
  ]
]

#muc([4. CHUYÊN ĐỀ: TOÁN THỰC TẾ & BẢN CHẤT DÃY SỐ])

#block(breakable: false)[
  #phuongphap(title: [Mô hình 1: Dãy Fibonacci và Tỷ lệ vàng (Sự hoàn hảo của Tự nhiên)])[
    Dãy số Fibonacci do Leonardo Fibonacci phát hiện:
    $ u_1=1, u_2=1, u_n = u_(n-1) + u_(n-2) $
    Đáng kinh ngạc, khi chia $u_(n+1) / u_n$, thương số tiến dần đến con số Tỷ Lệ Vàng $Phi = (1+sqrt(5))/2 approx 1.618$.
  ]
]

#align(center)[
  *Hình chữ nhật Vàng và Đường xoắn ốc Fibonacci* \
  #cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    
    // Draw squares
    rect((0,0), (1,1), stroke: blue, fill: rgb("e0f2fe"))
    content((0.5, 0.5), [1])
    
    rect((-1,0), (0,1), stroke: blue, fill: rgb("e0f2fe"))
    content((-0.5, 0.5), [1])
    
    rect((-1,-2), (1,0), stroke: blue, fill: rgb("bae6fd"))
    content((0, -1), [2])
    
    rect((1,-2), (4,1), stroke: blue, fill: rgb("7dd3fc"))
    content((2.5, -0.5), [3])
    
    rect((-1,1), (4,6), stroke: blue, fill: rgb("38bdf8"))
    content((1.5, 3.5), [5])
    
    rect((-9,-2), (-1,6), stroke: blue, fill: rgb("0284c7"))
    content((-5, 2), text(fill: white)[8])
    
    // Draw spiral (arcs using start points)
    arc((1,0), start: 0deg, stop: 90deg, radius: 1, stroke: 1.5pt + red)
    arc((0,1), start: 90deg, stop: 180deg, radius: 1, stroke: 1.5pt + red)
    arc((-1,0), start: 180deg, stop: 270deg, radius: 2, stroke: 1.5pt + red)
    arc((1,-2), start: 270deg, stop: 360deg, radius: 3, stroke: 1.5pt + red)
    arc((4,1), start: 0deg, stop: 90deg, radius: 5, stroke: 1.5pt + red)
    arc((-1,6), start: 90deg, stop: 180deg, radius: 8, stroke: 1.5pt + red)
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 2: Tháp Hà Nội (Quy luật Truy hồi Kinh điển)])[
    Trò chơi Tháp Hà Nội yêu cầu chuyển đĩa từ cọc này sang cọc khác sao cho đĩa lớn không đè lên đĩa nhỏ.
    Nếu $u_n$ là số bước tối thiểu cho $n$ đĩa, ta có: $u_1 = 1$, $u_n = 2 u_(n-1) + 1$.
    Bằng quy nạp, ta chứng minh được công thức tổng quát: $u_n = 2^n - 1$.
    Nếu có 64 chiếc đĩa, các nhà sư sẽ cần $2^64 - 1$ bước (khoảng 585 tỷ năm!).
  ]
]
