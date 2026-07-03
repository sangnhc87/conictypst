import os

bbt_content = """
== Nhóm 6: Chuyên đề Bảng Biến Thiên (BBT) và Xét Dấu (BXD)

Chuyên đề này sẽ cung cấp mã nguồn tạo Bảng Biến Thiên cho toàn bộ các dạng hàm số quen thuộc trong chương trình THPT. Mọi bảng đều tự động nội suy mũi tên lên xuống.

=== 1. BBT Hàm Đa Thức Cơ Bản (Bậc 3 & Bậc 4)

Hàm bậc 3 với 2 cực trị là dạng cơ bản nhất. Các mũi tên sẽ tự động nối từ cực đại xuống cực tiểu.

```typst
#bbbt(
  tx: $x$, f'(x): $y'$, f(x): $y$,
  x: (-oo, 0, 2, +oo),
  f'(x): (+, 0, -, 0, +),
  f(x): (-oo, 4, 0, +oo)
)
```

#demo-out[
  #align(center)[
    #bbbt(
      tx: $x$, f'(x): $y'$, f(x): $y$,
      x: (-oo, 0, 2, +oo),
      f'(x): (+, 0, -, 0, +),
      f(x): (-oo, 4, 0, +oo)
    )
  ]
]

Hàm bậc 4 trùng phương với 3 cực trị. Hệ thống tự động đẩy hai cực tiểu (hoặc hai cực đại) bằng nhau về cùng một độ cao, bạn không cần phải tính toán tọa độ!

```typst
#bbbt(
  tx: $x$, f'(x): $y'$, f(x): $y$,
  x: (-oo, -1, 0, 1, +oo),
  f'(x): (-, 0, +, 0, -, 0, +),
  f(x): (+oo, -3, 2, -3, +oo)
)
```

#demo-out[
  #align(center)[
    #bbbt(
      tx: $x$, f'(x): $y'$, f(x): $y$,
      x: (-oo, -1, 0, 1, +oo),
      f'(x): (-, 0, +, 0, -, 0, +),
      f(x): (+oo, -3, 2, -3, +oo)
    )
  ]
]


=== 2. BBT Hàm Phân Thức (Có Gián Đoạn `||`)

Đối với hàm bậc 1 / bậc 1, đạo hàm luôn mang một dấu và hàm số không xác định tại tiệm cận đứng. Ta dùng ký hiệu `"||"` ở cả dòng $y'$ và $y$.

```typst
#bbbt(
  tx: $x$, f'(x): $y'$, f(x): $y$,
  x: (-oo, 1, +oo),
  f'(x): (+, "||", +),
  f(x): (2, +oo, "||", -oo, 2)
)
```

#demo-out[
  #align(center)[
    #bbbt(
      tx: $x$, f'(x): $y'$, f(x): $y$,
      x: (-oo, 1, +oo),
      f'(x): (+, "||", +),
      f(x): (2, +oo, "||", -oo, 2)
    )
  ]
]

Hàm phân thức bậc 2 / bậc 1 có cực trị, và vẫn có tiệm cận đứng phân tách BBT làm 2 nhánh rõ rệt:

```typst
#bbbt(
  tx: $x$, f'(x): $y'$, f(x): $y$,
  x: (-oo, 0, 1, 2, +oo),
  f'(x): (+, 0, -, "||", -, 0, +),
  f(x): (-oo, -1, -oo, "||", +oo, 3, +oo)
)
```

#demo-out[
  #align(center)[
    #bbbt(
      tx: $x$, f'(x): $y'$, f(x): $y$,
      x: (-oo, 0, 1, 2, +oo),
      f'(x): (+, 0, -, "||", -, 0, +),
      f(x): (-oo, -1, -oo, "||", +oo, 3, +oo)
    )
  ]
]


=== 3. Giới hạn miền xác định (Dùng `shade`)

Khi hàm số chứa căn thức hoặc logarit, miền xác định bị giới hạn (ví dụ chỉ xét trên đoạn $[1; 3]$). Để gạch bỏ các vùng không xác định, ta dùng `"shade"` trong dòng $y$. Bạn cũng có thể dùng `(|` hoặc `|)` trên dòng $x$ để thể hiện ngoặc vuông (lấy dấu bằng).

```typst
#bbbt(
  tx: $x$, f'(x): $f'(x)$, f(x): $f(x)$,
  x: (-oo, "(|1", 2, "3|)", +oo),
  f'(x): ("shade", "||", +, 0, -, "||", "shade"),
  f(x): ("shade", "||", 0, 4, 0, "||", "shade")
)
```

#demo-out[
  #align(center)[
    #bbbt(
      tx: $x$, f'(x): $f'(x)$, f(x): $f(x)$,
      x: (-oo, "(|1", 2, "3|)", +oo),
      f'(x): ("shade", "||", +, 0, -, "||", "shade"),
      f(x): ("shade", "||", 0, 4, 0, "||", "shade")
    )
  ]
]

=== 4. Điểm Đạo hàm không xác định nhưng Hàm số liên tục

Trong các hàm chứa trị tuyệt đối hoặc căn thức đặc biệt, có những điểm làm $y'$ không xác định (`||`) nhưng hàm số $y$ vẫn đi qua bình thường và tạo thành "đỉnh nhọn" (cực trị).

```typst
#bbbt(
  tx: $x$, f'(x): $y'$, f(x): $y$,
  x: (-oo, -2, 2, +oo),
  f'(x): (-, 0, +, "||", -),
  f(x): (+oo, -4, 0, -oo)
)
```

#demo-out[
  #align(center)[
    #bbbt(
      tx: $x$, f'(x): $y'$, f(x): $y$,
      x: (-oo, -2, 2, +oo),
      f'(x): (-, 0, +, "||", -),
      f(x): (+oo, -4, 0, -oo)
    )
  ]
]


=== 5. Canh chỉnh độ cao mũi tên thủ công (Dùng `ranks`)

Đôi khi hệ thống tự động gán sai độ cao mũi tên nếu hàm số quá phức tạp hoặc có các giới hạn đặc biệt. Ta có thể dùng tham số `ranks` để ép buộc cấp độ cao (cấp 1 là thấp nhất, cấp 2 cao hơn...). Số lượng phần tử trong mảng `ranks` bằng số lượng giá trị trong dòng $y$ (không tính các dấu `"||"` tách nhánh).

```typst
#bbbt(
  tx: $x$, f'(x): $y'$, f(x): $y$,
  x: (-oo, -1, 1, +oo),
  f'(x): (+, 0, -, 0, +),
  f(x): (2, 4, 0, +oo),
  ranks: (2, 3, 1, 4) // +oo cao nhất (4), 4 ở mức (3), 2 ở mức (2), 0 ở mức (1)
)
```

#demo-out[
  #align(center)[
    #bbbt(
      tx: $x$, f'(x): $y'$, f(x): $y$,
      x: (-oo, -1, 1, +oo),
      f'(x): (+, 0, -, 0, +),
      f(x): (2, 4, 0, +oo),
      ranks: (2, 3, 1, 4)
    )
  ]
]


=== 6. Bảng Xét Dấu Nhiều Dòng (`#bxd`)

Lệnh `#bxd` cho phép xét dấu đồng thời nhiều biểu thức con (nhân tử) trước khi chốt hạ dấu của đạo hàm tổng ở dòng cuối.

```typst
#bxd(
  tx: $x$, 
  f1: $x - 1$, 
  f2: $x + 2$, 
  f(x): $f'(x) = (x-1)/(x+2)$,
  x: (-oo, -2, 1, +oo),
  f1: (-, |, -, 0, +),
  f2: (-, 0, +, |, +),
  f(x): (+, "||", -, 0, +)
)
```

#demo-out[
  #align(center)[
    #bxd(
      tx: $x$, 
      f1: $x - 1$, 
      f2: $x + 2$, 
      f(x): $f'(x) = (x-1)/(x+2)$,
      x: (-oo, -2, 1, +oo),
      f1: (-, |, -, 0, +),
      f2: (-, 0, +, |, +),
      f(x): (+, "||", -, 0, +)
    )
  ]
]

"""

with open('typst/hdsd-exam.typ', 'a', encoding='utf-8') as f:
    f.write('\n\n' + bbt_content)

