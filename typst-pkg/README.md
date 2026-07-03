# conictypst

Bộ macro Toán THPT Việt Nam — Bảng biến thiên, Bảng xét dấu, Trắc nghiệm, Hình học CeTZ.

📖 Tài liệu đầy đủ: https://hdsd-conictypst.pages.dev

## Cài đặt

```typ
#import "@preview/conictypst:1.0.0": *
```

## Các macro chính

### 1. Bảng biến thiên (`bbtv2`)

```typ
#import "@preview/conictypst:1.0.0": bbtv2

#bbtv2(
  x-vals: ($-oo$, $-1$, $1$, $+oo$),
  d-signs: ("+", 0, "-", 0, "+"),
  v-vals: ($-oo$, $3$, $-1$, $+oo$),
)
```

### 2. Bảng biến thiên đầy đủ (`bbbt`) — có hàng `f(x)` và `ranks`

```typ
#import "@preview/conictypst:1.0.0": bbbt

#bbbt(
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ("-", z, "+"),
  v-vals: ($+oo$, $0$, $+oo$),
  ranks: ("CB", none, "CT"),
)
```

### 3. Bảng xét dấu (`bxd`)

```typ
#import "@preview/conictypst:1.0.0": bxd

#bxd(
  x-vals: ($-oo$, $-2$, $1$, $+oo$),
  rows: (
    ($x + 2$, "-", z, "+", "|", "+"),
    ($x - 1$, "-", "|", "-", z, "+"),
    ($f(x)$,  "+", z, "-", z, "+"),
  ),
)
```

### 4. Câu trắc nghiệm (`tn`)

```typ
#import "@preview/conictypst:1.0.0": tn, sang-setup, True

#show: sang-setup

#tn(
  [Đạo hàm của hàm số $f(x) = x^3 - 3x + 1$ tại $x = 2$ bằng],
  ([$3$], True([$9$]), [$6$], [$-3$]),
  loigiai: [$f'(x) = 3x^2 - 3 Rightarrow f'(2) = 9$],
)
```

### 5. Câu tự luận có lời giải (`tl`)

```typ
#import "@preview/conictypst:1.0.0": tl, sang-setup

#show: sang-setup

#tl(
  [Giải phương trình $2^x = 8$.],
  loigiai: [$2^x = 2^3 Rightarrow x = 3$],
)
```

### 6. Nhóm câu hỏi (`q-wrap`)

```typ
#import "@preview/conictypst:1.0.0": tn, q-wrap, True

#q-wrap(dir: "ngang", lines: 4,
  tn(
    [Tìm tập xác định của hàm số $y = log_2 (x - 1)$],
    ([$D = (0; +oo)$], True([$D = (1; +oo)$]), [$D = RR setminus {1}$], [$D = [1; +oo)$]),
  )
)
```

### 7. Ký hiệu toán học tắt (`math-sym`)

```typ
#import "@preview/conictypst:1.0.0": *

// Các ký hiệu: vô cực, tập hợp, mũi tên...
$+oo$, $-oo$, $RR$, $ZZ$, $NN$, $QQ$
$=>$, $<=>$, $forall$, $exists$
```

### 8. Hình học CeTZ (`geometry`)

```typ
#import "@preview/conictypst:1.0.0": tri-abc

// Tam giác ABC với đỉnh tùy chỉnh
#tri-abc()
```

## Tùy chọn bbt-opt

```typ
#import "@preview/conictypst:1.0.0": bbt-opt, bbtv2

// Đặt tùy chọn toàn cục
#bbt-opt(
  var: $t$,       // Tên biến (mặc định: $x$)
  der: $f'(t)$,   // Ký hiệu đạo hàm
  func: $f(t)$,   // Tên hàm số
  w1: 1.2,        // Chiều rộng cột tên
  w2: 12,         // Chiều rộng mỗi khoảng
)
```

## License

MIT © 2024 Sang Nguyen
