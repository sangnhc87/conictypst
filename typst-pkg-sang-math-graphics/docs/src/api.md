# API Reference

## Quy ước chung

- `draw-*` trả về một CeTZ group và phải được gọi bên trong `smg-canvas` hoặc
  `cetz.canvas`.
- `tri-*`, `rect-*`, `square`, `circle-*`, `angle-mark`, `phanghoa-*` và các
  hàm `*-unfold-2d` tự tạo canvas.
- Tham số `name` tạo namespace anchor, ví dụ `name: "N"` và
  `smg-draw.content("N.top", ...)`.

## 2D Conics

### `draw-parabola(a, b, c, x-range, samples, stroke)`

Vẽ parabol `y = a*x^2 + b*x + c`.

### `draw-ellipse(center, a, b, angle, samples, stroke)`

Vẽ elip.

### `draw-hyperbola(a, b, x-range, samples, stroke)`

Vẽ hyperbol `x^2/a^2 - y^2/b^2 = 1`.

## 3D Solids

### `draw-cone(name, radius, height, center, samples, stroke, fill, show-hidden)`

Vẽ hình nón 3D.

**Anchor:** `top`/`apex`, `center`/`base-center`, `front`, `back`, `left`, `right`

### `draw-cylinder(name, radius, height, center, samples, stroke, fill, show-hidden)`

Vẽ hình trụ 3D.

**Anchor:** `bottom`/`bottom-center`, `top`/`top-center`, `center`, `front`, `back`, `left`, `right`

### `draw-sphere(name, radius, center, samples, stroke, fill, show-equator, show-meridian)`

Vẽ hình cầu với đường tròn ngoài, xích đạo và kinh tuyến tùy chọn.

**Anchor:** `center`, `top`, `bottom`, `left`, `right`

## 3D Polyhedra

### `draw-pyramid(name, base-size, height, center, stroke)`

Vẽ khối chóp tứ giác đều.

**Anchor:** `apex`, `A`, `B`, `C`, `D`, `center`

### `draw-truncated-pyramid(name, base-size, top-size, height, center, stroke, fill)`

Vẽ khối chóp cụt tứ giác đều.

**Anchor:** `bottom-center`, `top-center`, `A`, `B`, `C`, `D`, `E`, `F`, `G`, `H`

## 3D Curves

### `draw-helix(name, center, radius, height, loops, samples, stroke)`

Vẽ đường xoắn ốc trên trụ.

**Anchor:** `start`, `end`, `center`

### `draw-conical-helix(name, center, base-radius, height, loops, samples, stroke)`

Vẽ đường xoắn ốc trên nón.

**Anchor:** `start`, `end`, `apex`

## 3D Surfaces

### `draw-saddle(name, x-range, y-range, samples, stroke)`

Vẽ mặt yên ngựa `z = x^2 - y^2` dạng lưới.

**Anchor:** `center`

### `draw-paraboloid(name, a, b, z-max, samples, stroke)`

Vẽ paraboloid elliptic `z = x^2/a^2 + y^2/b^2`.

**Anchor:** `center`

## Calculus Volumes

### `draw-square-cross-section(f, x-range, samples, proj, stroke)`

Vẽ vật thể có mặt cắt vuông góc trục `Ox` là hình vuông cạnh `f(x)`.

### `draw-square-y-cross-section(a, y-range, samples, proj, stroke)`

Vẽ vật thể có mặt cắt vuông góc trục `Oy` là hình vuông cạnh `a(y)`.

### `draw-half-elliptical-tunnel(name, length, h-start, h-end, ratio, samples)`

Vẽ đường hầm có thiết diện nửa elip.

## Probability

### `draw-tree-2x2(name, root-label, level1, level2, colors, spacing)`

Sơ đồ cây 2 tầng, 2 nhánh mỗi tầng.

### `draw-tree-3x2(name, root-label, level1, level2, colors, spacing)`

Sơ đồ cây 2 tầng, 3 nhánh tầng 1 và 2 nhánh tầng 2.

### `draw-bayes-tree(name, root-label, branches, spacing, result-colors)`

Sơ đồ cây Bayes tổng quát.

### `draw-box-transfer-diagram(name, box1-label, box2-label, box3-label, take1, take2, result-color, result-label)`

Mô hình truyền tin hộp bi.

### `draw-bayes-contribution-bar(name, terms, total)`

Thanh tỉ trọng đóng góp vào xác suất toàn phần.
