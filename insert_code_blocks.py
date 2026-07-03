import re

with open('typst/hdsd-exam.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. Minimal Structure
min_struct_target = """== 1. Cấu trúc tối thiểu (Dễ dùng nhất)
Macro `#bbtv2` tự động tính toán mũi tên và cao độ dựa trên dấu đạo hàm. Bạn chỉ cần truyền đúng `x-vals`, `d-signs`, và `v-vals`.

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, $0$, $+$),
      v-vals: ($+oo$, $-2$, $+oo$),
    )
  ]
]"""

min_struct_repl = """== 1. Cấu trúc tối thiểu (Dễ dùng nhất)
Macro `#bbtv2` tự động tính toán mũi tên và cao độ dựa trên dấu đạo hàm. Bạn chỉ cần truyền đúng `x-vals`, `d-signs`, và `v-vals`.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($+oo$, $-2$, $+oo$),
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, $0$, $+$),
      v-vals: ($+oo$, $-2$, $+oo$),
    )
  ]
]"""

# 2. 4 points x-vals
four_points_target = """`d-signs: (dấu-khoảng-1, dấu-tại-b, dấu-khoảng-2, dấu-tại-c, dấu-khoảng-3)`

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $4$, $-5$, $+oo$),
    )
  ]
]"""

four_points_repl = """`d-signs: (dấu-khoảng-1, dấu-tại-b, dấu-khoảng-2, dấu-tại-c, dấu-khoảng-3)`

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $4$, $-5$, $+oo$),
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $4$, $-5$, $+oo$),
    )
  ]
]"""

# 3. Sizes
sizes_target = """Bạn có thể tinh chỉnh chiều rộng và chiều cao của từng hàng/cột để bảng rộng rãi, vừa vặn hơn.

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, $0$, $+$),
      v-vals: ($+oo$, $-2$, $+oo$),
      w1: 2.5,  // Cột bên trái rộng 2.5cm
      w2: 12,   // Cột bên phải rộng 12cm
      h1: 1.2,  // Chiều cao hàng x là 1.2cm
      h2: 1.5,  // Chiều cao hàng đạo hàm là 1.5cm
      h3: 3,    // Chiều cao hàng y là 3cm
    )
  ]
]"""

sizes_repl = """Bạn có thể tinh chỉnh chiều rộng và chiều cao của từng hàng/cột để bảng rộng rãi, vừa vặn hơn.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($+oo$, $-2$, $+oo$),
  w1: 2.5,  // Cột bên trái rộng 2.5cm
  w2: 12,   // Cột bên phải rộng 12cm
  h1: 1.2,  // Chiều cao hàng x là 1.2cm
  h2: 1.5,  // Chiều cao hàng đạo hàm là 1.5cm
  h3: 3,    // Chiều cao hàng y là 3cm
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, $0$, $+$),
      v-vals: ($+oo$, $-2$, $+oo$),
      w1: 2.5,  // Cột bên trái rộng 2.5cm
      w2: 12,   // Cột bên phải rộng 12cm
      h1: 1.2,  // Chiều cao hàng x là 1.2cm
      h2: 1.5,  // Chiều cao hàng đạo hàm là 1.5cm
      h3: 3,    // Chiều cao hàng y là 3cm
    )
  ]
]"""

# 4. Asymptote
asymp_target = """*Ví dụ 1: Tiệm cận đứng (Không shade)*
Truyền `"||"` vào `d-signs`, và dùng mảng con `($-oo$, $+oo$)` vào `v-vals` để gán hai giới hạn hai bên tiệm cận.

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ($-$, "||", $-$),
      v-vals: ($2$, ($-oo$, $+oo$), $2$),
      w2: 8
    )
  ]
]"""

asymp_repl = """*Ví dụ 1: Tiệm cận đứng (Không shade)*
Truyền `"||"` vào `d-signs`, và dùng mảng con `($-oo$, $+oo$)` vào `v-vals` để gán hai giới hạn hai bên tiệm cận.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $1$, $+oo$),
  d-signs: ($-$, "||", $-$),
  v-vals: ($2$, ($-oo$, $+oo$), $2$),
  w2: 8
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ($-$, "||", $-$),
      v-vals: ($2$, ($-oo$, $+oo$), $2$),
      w2: 8
    )
  ]
]"""

# 5. Shade
shade_target = """*Ví dụ 2: Vùng không xác định (Gạch chéo với `shade`)*
Sử dụng tham số `shade: ((start_index, end_index),)`.
VD: `shade: ((1, 2),)` tức là gạch chéo từ cột index 1 đến cột index 2 (tính từ 0).

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-2$, $2$, $+oo$),
      d-signs: ($+$, "||", none, "||", $+$),
      v-vals: ($-oo$, $0$, $0$, $+oo$),
      shade: ((1, 2),),
      w2: 10
    )
  ]
]"""

shade_repl = """*Ví dụ 2: Vùng không xác định (Gạch chéo với `shade`)*
Sử dụng tham số `shade: ((start_index, end_index),)`.
VD: `shade: ((1, 2),)` tức là gạch chéo từ cột index 1 đến cột index 2 (tính từ 0).

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-2$, $2$, $+oo$),
  d-signs: ($+$, "||", none, "||", $+$),
  v-vals: ($-oo$, $0$, $0$, $+oo$),
  shade: ((1, 2),),
  w2: 10
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-2$, $2$, $+oo$),
      d-signs: ($+$, "||", none, "||", $+$),
      v-vals: ($-oo$, $0$, $0$, $+oo$),
      shade: ((1, 2),),
      w2: 10
    )
  ]
]"""

# 6. Ranks
ranks_target = """== 5. Chỉnh thủ công vị trí mũi tên bằng `#bbbt` và `ranks`
Khi mũi tên bị lệch, đè lên text, hoặc thuật toán tự động của `bbtv2` tính sai độ dốc, bạn hãy chuyển sang `#bbbt` và dùng mảng `ranks`.
`ranks` quy định "độ cao tương đối" của mỗi giá trị trong hàng y. Số càng nhỏ thì càng thấp.

#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $4$, $-5$, $+oo$),
      ranks: ((0,), (2,), (0,), (2,)), // Thiết lập độ cao thủ công
      w2: 12,
    )
  ]
]"""

ranks_repl = """== 5. Chỉnh thủ công vị trí mũi tên bằng `#bbbt` và `ranks`
Khi mũi tên bị lệch, đè lên text, hoặc thuật toán tự động của `bbtv2` tính sai độ dốc, bạn hãy chuyển sang `#bbbt` và dùng mảng `ranks`.
`ranks` quy định "độ cao tương đối" của mỗi giá trị trong hàng y. Số càng nhỏ thì càng thấp.

```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $4$, $-5$, $+oo$),
  ranks: ((0,), (2,), (0,), (2,)), // Thiết lập độ cao thủ công
  w2: 12,
)
```

#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $4$, $-5$, $+oo$),
      ranks: ((0,), (2,), (0,), (2,)), // Thiết lập độ cao thủ công
      w2: 12,
    )
  ]
]"""

# 7. Bxd
bxd_target = """== 6. Bảng xét dấu `#bxd` (Nhiều dòng)
Dành cho bài toán xét dấu biểu thức, giải bất phương trình.
- Truyền một mảng vào `func` để tạo nhiều dòng.
- Truyền mảng 2 chiều vào `f-signs` tương ứng.

#demo-out[
  #align(center)[
    #bxd(
      var: $x$,
      func: ($x+1$, $x-2$, $f'(x)$),
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      f-signs: (
        ($-$, $0$, $+$, $+$, $+$),
        ($-$, $-$, $-$, $0$, $+$),
        ($+$, $0$, $-$, $0$, $+$),
      ),
      w1: 1.5,
      w2: 8,
      h1: 0.8,
      h2: 0.8,
    )
  ]
]"""

bxd_repl = """== 6. Bảng xét dấu `#bxd` (Nhiều dòng)
Dành cho bài toán xét dấu biểu thức, giải bất phương trình.
- Truyền một mảng vào `func` để tạo nhiều dòng.
- Truyền mảng 2 chiều vào `f-signs` tương ứng.

```typst
#bxd(
  var: $x$,
  func: ($x+1$, $x-2$, $f'(x)$),
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  f-signs: (
    ($-$, $0$, $+$, $+$, $+$),
    ($-$, $-$, $-$, $0$, $+$),
    ($+$, $0$, $-$, $0$, $+$),
  ),
  w1: 1.5,
  w2: 8,
  h1: 0.8,
  h2: 0.8,
)
```

#demo-out[
  #align(center)[
    #bxd(
      var: $x$,
      func: ($x+1$, $x-2$, $f'(x)$),
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      f-signs: (
        ($-$, $0$, $+$, $+$, $+$),
        ($-$, $-$, $-$, $0$, $+$),
        ($+$, $0$, $-$, $0$, $+$),
      ),
      w1: 1.5,
      w2: 8,
      h1: 0.8,
      h2: 0.8,
    )
  ]
]"""

# Replace all
for t, r in [
    (min_struct_target, min_struct_repl),
    (four_points_target, four_points_repl),
    (sizes_target, sizes_repl),
    (asymp_target, asymp_repl),
    (shade_target, shade_repl),
    (ranks_target, ranks_repl),
    (bxd_target, bxd_repl),
]:
    if t in text:
        text = text.replace(t, r)
    else:
        print(f"Warning: Target not found: {t[:50]}...")

with open('typst/hdsd-exam.typ', 'w', encoding='utf-8') as f:
    f.write(text)

print("Replacement complete.")
