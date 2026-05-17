// ================================================================
// VÍ DỤ MẪU: #tn với 4 options là hình vẽ cetz
// ================================================================
#import "@preview/cetz:0.5.2"
#import "sang-exam.typ": *

#set page(paper: "a4", margin: (x: 2cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt)
#show: sang-setup

// Hàm vẽ trục Oxy nhỏ gọn
#let draw-axes(xmin, xmax, ymin, ymax, xticks: (), yticks: ()) = {
  import cetz.draw: *
  // Trục
  line((xmin, 0), (xmax + 0.2, 0), mark: (end: "stealth", scale: 0.4))
  line((0, ymin), (0, ymax + 0.2), mark: (end: "stealth", scale: 0.4))
  // Nhãn trục
  content((xmax + 0.35, 0), $x$, anchor: "west")
  content((0, ymax + 0.35), $y$, anchor: "south")
  // Gốc
  content((-0.15, -0.2), $O$)
  // Tick x
  for v in xticks {
    line((v, 0.07), (v, -0.07))
    content((v, -0.25), text(size: 7pt)[$#v$])
  }
  // Tick y
  for v in yticks {
    line((0.07, v), (-0.07, v))
    content((-0.28, v), text(size: 7pt)[$#v$])
  }
}

// Lấy mẫu hàm số để vẽ đường cong
#let sample(f, a, b, n: 60) = {
  let step = (b - a) / n
  range(n + 1).map(i => {
    let x = a + i * step
    (x, f(x))
  })
}

// ── CHUẨN BỊ 4 CANVAS ──────────────────────────────────────────
// Hàm đúng: y = x³ - 3x  (cực đại (-1,2), cực tiểu (1,-2))
#let canvas-A = cetz.canvas(length: 0.65cm, {
  import cetz.draw: *
  draw-axes(-2.2, 2.2, -3, 3, xticks: (-1, 1), yticks: (-2, 2))
  let pts = sample(x => x * x * x - 3 * x, -2.1, 2.1)
  hobby(..pts, stroke: blue + 1.4pt, fill: none)
  // Điểm cực trị
  circle((-1, 2), radius: 0.08, fill: red, stroke: none)
  circle((1, -2), radius: 0.08, fill: red, stroke: none)
})

// Phương án sai B: y = x³ (không có cực trị, đơn điệu tăng)
#let canvas-B = cetz.canvas(length: 0.65cm, {
  import cetz.draw: *
  draw-axes(-2.2, 2.2, -3, 3)
  let pts = sample(x => x * x * x, -1.85, 1.85)
  hobby(..pts, stroke: blue + 1.4pt, fill: none)
})

// Phương án sai C: y = -x³ + 3x (lật ngược, cực đại (1,2), cực tiểu (-1,-2))
#let canvas-C = cetz.canvas(length: 0.65cm, {
  import cetz.draw: *
  draw-axes(-2.2, 2.2, -3, 3, xticks: (-1, 1), yticks: (-2, 2))
  let pts = sample(x => -(x * x * x) + 3 * x, -2.1, 2.1)
  hobby(..pts, stroke: blue + 1.4pt, fill: none)
  circle((1, 2), radius: 0.08, fill: red, stroke: none)
  circle((-1, -2), radius: 0.08, fill: red, stroke: none)
})

// Phương án sai D: y = x³ - x (cực trị khác: cực đại (-1/√3, ...), cực tiểu (1/√3,...))
#let canvas-D = cetz.canvas(length: 0.65cm, {
  import cetz.draw: *
  draw-axes(-2.2, 2.2, -3, 3)
  let pts = sample(x => x * x * x - x, -1.9, 1.9)
  hobby(..pts, stroke: blue + 1.4pt, fill: none)
})

// ── CÂU HỎI ────────────────────────────────────────────────────
= Ví dụ: Options là hình vẽ cetz

Cách 1 — *Tự động phát hiện* (không cần thêm tham số):

// Hệ thống tự nhận ra canvas qua repr() → tự bỏ qua measure()
#tn(
  [Đồ thị nào dưới đây là đồ thị của hàm số $y = x^3 - 3x$?],
  (
    True(canvas-A), // ← A đúng
    canvas-B,
    canvas-C,
    canvas-D,
  ),
  loigiai: [
    Hàm $f(x) = x^3 - 3x$ có $f'(x) = 3x^2 - 3 = 3(x-1)(x+1)$.

    - $f'(x) = 0 arrow.l.r x = plus.minus 1$
    - Cực đại tại $x = -1$: $f(-1) = 2$
    - Cực tiểu tại $x = 1$: $f(1) = -2$

    Đồ thị tăng trên $(-oo, -1)$, giảm trên $(-1, 1)$, tăng trên $(1, +oo)$ → chọn *A*.
  ],
  mode: "loigiai",
)

#pagebreak()

Cách 2 — *Ép thủ công* với `opt-fig: true`:

#tn(
  [Đồ thị nào dưới đây là đồ thị của hàm số $y = x^3 - 3x$?],
  (
    True(canvas-A),
    canvas-B,
    canvas-C,
    canvas-D,
  ),
  opt-fig: true, // ép chế độ hình
  opt-fig-cols: 2, // 2×2 (mặc định, có thể viết 1 hoặc 4)
  loigiai: [Chọn *A* vì cực đại $(-1, 2)$ và cực tiểu $(1, -2)$.],
  mode: "loigiai",
)
