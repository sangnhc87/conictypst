
// ══════════════════════════════════════════════════════════════════
= Phụ lục: Kho Bài Tập Mẫu Thực Tế
// ══════════════════════════════════════════════════════════════════

Phần này cung cấp một kho tàng các ví dụ bài tập thực tế, quét qua **mọi cấu hình tham số** của hệ thống `conictypst`. Mục đích là giúp bạn có thể copy-paste nhanh chóng đoạn mã gần giống với bài toán của bạn nhất, từ việc chèn hình, canh lề, chia cột, đến các tổ hợp giao diện siêu phức tạp.

== Nhóm 1: Tùy biến vị trí hình ảnh (Image Positioning)

=== 1. Hình ảnh nằm bên PHẢI (`fig-pos: "right"`)

Đây là cách phổ biến nhất trong sách Toán học. Chiều rộng của hình có thể điều chỉnh qua `fig-width`.

```typst
#tn(
  [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ bên. Điểm cực tiểu của đồ thị hàm số là điểm nào dưới đây?],
  ([$M(0; 2)$], True([$N(2; -2)$]), [$P(2; 0)$], [$Q(0; -2)$]),
  fig-pos: "right",
  fig-width: 35%,
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    line((-1, 0), (4, 0), mark: (end: ">")) // Ox
    line((0, -3), (0, 3), mark: (end: ">")) // Oy
    bezier((-1,-2), (2,-2), (0,2)) // Giả lập đồ thị
    circle((2,-2), radius: 0.1, fill: black) // Cực tiểu
  })
)
```

#demo-out[
  #let em1 = exam-mode(mode: "dethi", accent: classic.blue)
  #(em1.tn)(
    [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ bên. Điểm cực tiểu của đồ thị hàm số là điểm nào dưới đây?],
    ([$M(0; 2)$], True([$N(2; -2)$]), [$P(2; 0)$], [$Q(0; -2)$]),
    fig-pos: "right",
    fig-width: 35%,
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      line((-1, 0), (4, 0), mark: (end: ">")) // Ox
      line((0, -3), (0, 3), mark: (end: ">")) // Oy
      bezier((-1,-2), (2,-2), (0,2)) // Giả lập đồ thị
      circle((2,-2), radius: 0.1, fill: black) // Cực tiểu
    })
  )
]

=== 2. Hình ảnh nằm bên TRÁI (`fig-pos: "left"`)

Khi nội dung hình ảnh quan trọng và là đối tượng quan sát đầu tiên của câu hỏi, hãy đưa nó sang trái.

```typst
#tn(
  [Quan sát khối nón bên trái. Biết bán kính đáy $r=3$ và đường sinh $l=5$. Thể tích khối nón là bao nhiêu?],
  ([$12 pi$], True([$15 pi$]), [$20 pi$], [$30 pi$]),
  fig-pos: "left",
  fig-width: 25%,
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    circle((0,0), radius: (2, 0.6))
    line((-2,0), (0,4), (2,0))
    line((0,0), (2,0), stroke: (dash: "dashed"))
    line((0,0), (0,4), stroke: (dash: "dashed"))
  })
)
```

#demo-out[
  #let em2 = exam-mode(mode: "dethi", accent: classic.blue)
  #(em2.tn)(
    [Quan sát khối nón bên trái. Biết bán kính đáy $r=3$ và đường sinh $l=5$. Thể tích khối nón là bao nhiêu?],
    ([$12 pi$], True([$15 pi$]), [$20 pi$], [$30 pi$]),
    fig-pos: "left",
    fig-width: 25%,
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      circle((0,0), radius: (2, 0.6))
      line((-2,0), (0,4), (2,0))
      line((0,0), (2,0), stroke: (dash: "dashed"))
      line((0,0), (0,4), stroke: (dash: "dashed"))
    })
  )
]

=== 3. Hình ảnh nằm DƯỚI câu hỏi (`fig-pos: "bottom"`)

Sử dụng khi hình vẽ lớn, phức tạp, không phù hợp để canh lề hai bên.

```typst
#tn(
  [Hình lăng trụ tam giác đều $A B C . A' B' C'$ dưới đây có cạnh đáy bằng $a$. Diện tích xung quanh của lăng trụ bằng bao nhiêu?],
  ([$a^2 sqrt(3)$], True([$3 a^2$]), [$2 a^2$], [$a^2$]),
  fig-pos: "bottom",
  fig: align(center)[
    #cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      // Đáy dưới
      line((0,0), (4,0), (2,-2), close: true)
      // Đáy trên
      line((0,4), (4,4), (2,2), close: true)
      // Cạnh bên
      line((0,0), (0,4)); line((4,0), (4,4)); line((2,-2), (2,2))
    })
  ]
)
```

#demo-out[
  #let em3 = exam-mode(mode: "dethi", accent: classic.blue)
  #(em3.tn)(
    [Hình lăng trụ tam giác đều $A B C . A' B' C'$ dưới đây có cạnh đáy bằng $a$. Diện tích xung quanh của lăng trụ bằng bao nhiêu?],
    ([$a^2 sqrt(3)$], True([$3 a^2$]), [$2 a^2$], [$a^2$]),
    fig-pos: "bottom",
    fig: align(center)[
      #cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        line((0,0), (4,0), (2,-2), close: true)
        line((0,4), (4,4), (2,2), close: true)
        line((0,0), (0,4)); line((4,0), (4,4)); line((2,-2), (2,2))
      })
    ]
  )
]

== Nhóm 2: Tùy biến dàn trang phương án (Options Layout)

=== 1. Dàn ngang 1 cột (`cols: 1`)
Sử dụng khi câu trả lời rất dài.

```typst
#tn(
  [Phát biểu nào sau đây diễn đạt đúng nguyên lý Dirichlet?],
  (
    [Nếu nhốt $n$ con thỏ vào $n$ chuồng thì mỗi chuồng có đúng 1 con thỏ.],
    True([Nếu nhốt $n+1$ con thỏ vào $n$ chuồng thì tồn tại ít nhất 1 chuồng chứa từ 2 con thỏ trở lên.]),
    [Nếu nhốt $n+1$ con thỏ vào $n$ chuồng thì mọi chuồng đều chứa 2 con thỏ.],
    [Không có nguyên lý nào như vậy tồn tại trong toán học.]
  ),
  cols: 1
)
```

#demo-out[
  #let em4 = exam-mode(mode: "dethi", accent: classic.blue)
  #(em4.tn)(
    [Phát biểu nào sau đây diễn đạt đúng nguyên lý Dirichlet?],
    (
      [Nếu nhốt $n$ con thỏ vào $n$ chuồng thì mỗi chuồng có đúng 1 con thỏ.],
      True([Nếu nhốt $n+1$ con thỏ vào $n$ chuồng thì tồn tại ít nhất 1 chuồng chứa từ 2 con thỏ trở lên.]),
      [Nếu nhốt $n+1$ con thỏ vào $n$ chuồng thì mọi chuồng đều chứa 2 con thỏ.],
      [Không có nguyên lý nào như vậy tồn tại trong toán học.]
    ),
    cols: 1
  )
]

=== 2. Dàn 3 cột (`cols: 3`)
Sử dụng khi phương án trả lời ngắn gọn (như số tự nhiên, phân số).

```typst
#tn(
  [Kết quả của phép tính $2^3 + 3^2$ là?],
  ([$12$], [$15$], True([$17$]), [$20$]),
  cols: 3
)
```

#demo-out[
  #let em5 = exam-mode(mode: "dethi", accent: classic.blue)
  #(em5.tn)(
    [Kết quả của phép tính $2^3 + 3^2$ là?],
    ([$12$], [$15$], True([$17$]), [$20$]),
    cols: 3
  )
]

== Nhóm 3: Tùy biến câu Đúng - Sai Nâng Cao (True/False Advanced)

=== 1. Câu Đúng - Sai có chèn hình bên cạnh

```typst
#ds(
  [Cho hình chóp $S.ABCD$ có đáy $ABCD$ là hình vuông. Đồ thị bên minh hoạ một mặt cắt của nó.],
  (
    [Đáy $ABCD$ là hình bình hành.],
    True([$S A$ vuông góc với mặt phẳng đáy.]),
    True([Tam giác $S A B$ là tam giác vuông.]),
    [$A B$ vuông góc với $S C$.]
  ),
  fig-pos: "right",
  fig-width: 30%,
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    line((0,0), (4,0), (6,-2), (2,-2), close: true)
    line((0,0), (0,4), (4,0))
    line((0,4), (6,-2))
    line((0,4), (2,-2))
  })
)
```

#demo-out[
  #let em6 = exam-mode(mode: "dethi", accent: classic.emerald)
  #(em6.ds)(
    [Cho hình chóp $S.ABCD$ có đáy $ABCD$ là hình vuông. Đồ thị bên minh hoạ một mặt cắt của nó.],
    (
      [Đáy $ABCD$ là hình bình hành.],
      True([$S A$ vuông góc với mặt phẳng đáy.]),
      True([Tam giác $S A B$ là tam giác vuông.]),
      [$A B$ vuông góc với $S C$.]
    ),
    fig-pos: "right",
    fig-width: 30%,
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      line((0,0), (4,0), (6,-2), (2,-2), close: true)
      line((0,0), (0,4), (4,0))
      line((0,4), (6,-2))
      line((0,4), (2,-2))
    })
  )
]

=== 2. Câu Đúng - Sai chèn Đồ thị hàm số phức tạp

```typst
#ds(
  [Đồ thị hàm số $y = a x^3 + b x^2 + c x + d$ được cho ở hình bên. Hãy xét tính đúng sai của các khẳng định sau:],
  (
    True([Hàm số đạt cực đại tại $x = -1$.]),
    [Giá trị nhỏ nhất của hàm số trên $RR$ là $-2$.],
    True([Phương trình $f(x) = 0$ có 3 nghiệm phân biệt.]),
    [Hệ số $a > 0$.]
  ),
  fig-pos: "right",
  fig-width: 30%,
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    line((-3, 0), (3, 0), mark: (end: ">"))
    line((0, -3), (0, 3), mark: (end: ">"))
    bezier((-2, 2), (2, -2), (0, -2))
    bezier((-2, 2), (-3, -2), (-2.5, 2))
    bezier((2, -2), (3, 2), (2.5, -2))
  })
)
```

#demo-out[
  #let em7 = exam-mode(mode: "dethi", accent: classic.emerald)
  #(em7.ds)(
    [Đồ thị hàm số $y = a x^3 + b x^2 + c x + d$ được cho ở hình bên. Hãy xét tính đúng sai của các khẳng định sau:],
    (
      True([Hàm số đạt cực đại tại $x = -1$.]),
      [Giá trị nhỏ nhất của hàm số trên $RR$ là $-2$.],
      True([Phương trình $f(x) = 0$ có 3 nghiệm phân biệt.]),
      [Hệ số $a > 0$.]
    ),
    fig-pos: "right",
    fig-width: 30%,
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -3), (0, 3), mark: (end: ">"))
      bezier((-2, 2), (2, -2), (0, -2))
      bezier((-2, 2), (-3, -2), (-2.5, 2))
      bezier((2, -2), (3, 2), (2.5, -2))
    })
  )
]

== Nhóm 4: Tự luận & Điền khuyết (Fill-in & Short Answer)

=== 1. Trả lời ngắn đóng khung (`boxed: true`)

```typst
#tln(
  [Tìm giá trị lớn nhất của hàm số $y = -x^2 + 4x + 1$.],
  [Max bằng 5.],
  boxed: true,
)
```

#demo-out[
  #let em8 = exam-mode(mode: "dethi", accent: classic.purple)
  #(em8.tln)(
    [Tìm giá trị lớn nhất của hàm số $y = -x^2 + 4x + 1$.],
    [Max bằng 5.],
    boxed: true,
  )
]

=== 2. Tự luận nhiều dòng nháp (`lines: 8`)

```typst
#tl(
  [Khảo sát sự biến thiên và vẽ đồ thị hàm số $y = x^3 - 3x^2 + 2$. Học sinh trình bày các bước rõ ràng xuống dưới đây.],
  [... Lời giải chi tiết ...],
  lines: 8,
)
```

#demo-out[
  #let em9 = exam-mode(mode: "dethi", accent: classic.purple)
  #(em9.tl)(
    [Khảo sát sự biến thiên và vẽ đồ thị hàm số $y = x^3 - 3x^2 + 2$. Học sinh trình bày các bước rõ ràng xuống dưới đây.],
    [... Lời giải chi tiết ...],
    lines: 8,
  )
]


== Nhóm 5: Tổ hợp tham số siêu cấp (Combo Options)

Ví dụ dưới đây tổng hợp tất cả các hiệu ứng trên một câu hỏi: Đóng khung (`boxed`), Kẻ dòng chấm (`lines`), Chữ cái khoanh tròn (`opt-style: "circle"`), Chèn hình minh họa (`fig`).

```typst
#tn(
  [Một quả bóng được thả rơi từ độ cao $h$. Mô hình dao động giảm xóc được miêu tả ở hình vẽ bên phải.
  
  Biết gia tốc trọng trường $g = 9.8 	ext{m/s}^2$. Hãy tính toán và chọn thời điểm bóng dừng hẳn.],
  ([$2.5$s], [$3.1$s], True([$4.2$s]), [$5.0$s]),
  opt-style: "circle",
  fig-pos: "right",
  boxed: true,
  lines: 4,
  box-fill: rgb("fafafa"),
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    line((0,0), (6,0), mark: (end: ">")) // t axis
    line((0,-2), (0,3), mark: (end: ">")) // y axis
    bezier((0,2), (1,0), (0.5, 0.5))
    bezier((1,0), (2,1.2), (1.5, 0.6))
    bezier((2,1.2), (3,0), (2.5, 0.6))
  })
)
```

#demo-out[
  #let em10 = exam-mode(mode: "dethi", accent: classic.blue)
  #(em10.tn)(
    [Một quả bóng được thả rơi từ độ cao $h$. Mô hình dao động giảm xóc được miêu tả ở hình vẽ bên phải.
    
    Biết gia tốc trọng trường $g = 9.8 #text("m/s")^2$. Hãy tính toán và chọn thời điểm bóng dừng hẳn.],
    ([$2.5$s], [$3.1$s], True([$4.2$s]), [$5.0$s]),
    opt-style: "circle",
    fig-pos: "right",
    boxed: true,
    lines: 4,
    box-fill: rgb("fafafa"),
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      line((0,0), (6,0), mark: (end: ">")) // t axis
      line((0,-2), (0,3), mark: (end: ">")) // y axis
      bezier((0,2), (1,0), (0.5, 0.5))
      bezier((1,0), (2,1.2), (1.5, 0.6))
      bezier((2,1.2), (3,0), (2.5, 0.6))
    })
  )
]
