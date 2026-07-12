# Ứng dụng Giải tích

## Thể tích theo mặt cắt

### Vật thể có mặt cắt vuông theo trục Ox

Vật thể có đáy giới hạn bởi trục hoành và đồ thị $y = f(x)$, mặt cắt vuông góc với $Ox$ là hình vuông có một cạnh nằm trên mặt đáy.

![Thể tích mặt cắt vuông](/img/calculus-volume-demo-1.png)

```typst
#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-square-cross-section

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  draw-square-cross-section(x => calc.pow(2, x), x-range: (0, 2), samples: 5)
})
```

### Vật thể có mặt cắt vuông theo trục Oy

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-square-y-cross-section

draw-square-y-cross-section(y => 2 * calc.sqrt(y + 1), y-range: (0, 8), samples: 4)
```

### Đường hầm nửa elip

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-half-elliptical-tunnel

draw-half-elliptical-tunnel(length: 6, h-start: 4, h-end: 1, ratio: 3)
```

## Công thức

Thể tích vật thể giới hạn bởi hai mặt phẳng vuông góc với trục $O x$ tại $x=a$ và $x=b$:

$$ V = integral_a^b S(x) dif x $$

Trong đó $S(x)$ là diện tích thiết diện tại hoành độ $x$.
