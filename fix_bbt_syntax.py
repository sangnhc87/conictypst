import re

with open('typst/hdsd-exam.typ', 'r', encoding='utf-8') as f:
    text = f.read()

index = text.find("== Nhóm 6")
if index != -1:
    text = text[:index]

bbt_content = """== Nhóm 6: Chuyên đề Bảng Biến Thiên (BBT) và Xét Dấu (BXD)

Chuyên đề này cung cấp mã nguồn tạo Bảng Biến Thiên cho toàn bộ các dạng hàm số quen thuộc trong chương trình THPT.

=== 1. BBT Hàm Đa Thức Cơ Bản (Bậc 3 & Bậc 4)

Hàm bậc 3 với 2 cực trị là dạng cơ bản nhất.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $4$, $0$, $+oo$)
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $4$, $0$, $+oo$)
    )
  ]
]

Hàm bậc 4 trùng phương với 3 cực trị. Hệ thống tự động đẩy hai cực tiểu bằng nhau về cùng một độ cao.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
  d-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$),
  v-vals: ($+oo$, $-3$, $2$, $-3$, $+oo$)
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$),
      v-vals: ($+oo$, $-3$, $2$, $-3$, $+oo$)
    )
  ]
]


=== 2. BBT Hàm Phân Thức (Có Gián Đoạn `||`)

Hàm bậc 1 / bậc 1, đạo hàm luôn mang một dấu và hàm số không xác định tại tiệm cận đứng. Ta dùng ký hiệu `"||"` ở dòng $y'$ và một mảng 2 phần tử `($+oo$, $-oo$)` ở dòng $y$.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $1$, $+oo$),
  d-signs: ($+$, $"||"$, $+$),
  v-vals: ($2$, ($+oo$, $-oo$), $2$)
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ($+$, $"||"$, $+$),
      v-vals: ($2$, ($+oo$, $-oo$), $2$)
    )
  ]
]

Hàm phân thức bậc 2 / bậc 1 có cực trị, và vẫn có tiệm cận đứng phân tách BBT làm 2 nhánh rõ rệt:

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $1$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $"||"$, $-$, $0$, $+$),
  v-vals: ($-oo$, $-1$, ($-oo$, $+oo$), $3$, $+oo$)
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $1$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $"||"$, $-$, $0$, $+$),
      v-vals: ($-oo$, $-1$, ($-oo$, $+oo$), $3$, $+oo$)
    )
  ]
]


=== 3. Giới hạn miền xác định (Dùng `shade`)

Khi hàm số chứa căn thức hoặc logarit, miền xác định bị giới hạn. Dùng `shade: ((i, j),)` để gạch chéo vùng không xác định từ khoảng $i$ đến $j$.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-2$, $2$, $+oo$),
  d-signs: ($""$, $"||"$, $+$, $"||"$, $""$),
  v-vals: ($""$, ($-oo$, $0$), ($0$, $+oo$), $""$),
  shade: ((0, 1), (2, 3))
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-2$, $2$, $+oo$),
      d-signs: ($""$, $"||"$, $+$, $"||"$, $""$),
      v-vals: ($""$, ($-oo$, $0$), ($0$, $+oo$), $""$),
      shade: ((0, 1), (2, 3))
    )
  ]
]

=== 4. Điểm Đạo hàm không xác định nhưng Hàm số liên tục

Trong hàm chứa trị tuyệt đối hoặc căn thức, có điểm $y'$ không xác định (`||`) nhưng hàm số $y$ vẫn đi qua bình thường. Ta chỉ gán giá trị đơn ở `v-vals` tại điểm đó.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ($-$, $"||"$, $+$),
  v-vals: ($+oo$, $0$, $+oo$)
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, $"||"$, $+$),
      v-vals: ($+oo$, $0$, $+oo$)
    )
  ]
]


=== 5. Bảng Xét Dấu Nhiều Dòng (`#bxd`)

Lệnh `#bxd` cho phép xét dấu đồng thời nhiều biểu thức con. Truyền `func` và `f-signs` dưới dạng mảng của mảng.

```typst
#bxd(
  var: $x$, 
  func: ($x - 1$, $x + 2$, $f'(x) = (x-1)/(x+2)$),
  x-vals: ($-oo$, $-2$, $1$, $+oo$),
  f-signs: (
    ($-$, $"|"$, $-$, $0$, $+$),
    ($-$, $0$, $+$, $"|"$, $+$),
    ($+$, $"||"$, $-$, $0$, $+$),
  ),
  w1: 4
)
```

#demo-out[
  #align(center)[
    #bxd(
      var: $x$, 
      func: ($x - 1$, $x + 2$, $f'(x) = (x-1)/(x+2)$),
      x-vals: ($-oo$, $-2$, $1$, $+oo$),
      f-signs: (
        ($-$, $"|"$, $-$, $0$, $+$),
        ($-$, $0$, $+$, $"|"$, $+$),
        ($+$, $"||"$, $-$, $0$, $+$),
      ),
      w1: 4
    )
  ]
]
"""

with open('typst/hdsd-exam.typ', 'w', encoding='utf-8') as f:
    f.write(text + bbt_content)

