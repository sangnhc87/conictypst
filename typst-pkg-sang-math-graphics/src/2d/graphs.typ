// ═════════════════════════════════════════════════════════════════════════════
// 2D: GRAPHS
// Đồ thị hàm số (Bậc 3, Phân thức, Parabol) sử dụng cetz.plot
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2"

#let _ge-blue = rgb("#0057b8")
#let _ge-red = rgb("#cc2200")
#let _ge-scale = 0.7cm

// ── Đồ thị hàm bậc 3: y = ax^3 + bx^2 + cx + d ──────────
#let plot-cubic(
  a: 1, b: -3, c: 0, d: 2,
  domain: (-1.5, 3.5),
  size: (6, 6),
  x-tick-step: 1,
  y-tick-step: 1,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import "@preview/cetz-plot:0.1.4": plot
    plot.plot(
      size: size,
      x-tick-step: x-tick-step,
      y-tick-step: y-tick-step,
      axis-style: "school-book",
      {
        plot.add(
          domain: domain,
          style: (stroke: 1.5pt + _ge-blue),
          x => a * calc.pow(x, 3) + b * calc.pow(x, 2) + c * x + d
        )
      }
    )
  })
}

// ── Đồ thị Parabol: y = ax^2 + bx + c ───────────────────
#let plot-parabola(
  a: 1, b: -2, c: -3,
  domain: (-2.5, 4.5),
  size: (6, 6),
  x-tick-step: 1,
  y-tick-step: 1,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import "@preview/cetz-plot:0.1.4": plot
    plot.plot(
      size: size,
      x-tick-step: x-tick-step,
      y-tick-step: y-tick-step,
      axis-style: "school-book",
      {
        plot.add(
          domain: domain,
          style: (stroke: 1.5pt + _ge-red),
          x => a * calc.pow(x, 2) + b * x + c
        )
      }
    )
  })
}

// ── Đồ thị phân thức: y = (ax + b) / (cx + d) ───────────
#let plot-rational(
  a: 2, b: -1, c: 1, d: 1, // y = (2x - 1) / (x + 1), tiệm cận đứng x = -1, ngang y = 2
  domain: (-5, 5),
  size: (6, 6),
  x-tick-step: 1,
  y-tick-step: 1,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import "@preview/cetz-plot:0.1.4": plot
    // Tính tiệm cận đứng: x = -d/c
    let tc_dung = -d / c
    let tc_ngang = a / c
    
    plot.plot(
      size: size,
      x-tick-step: x-tick-step,
      y-tick-step: y-tick-step,
      axis-style: "school-book",
      {
        // Nhánh trái
        plot.add(
          domain: (domain.at(0), tc_dung - 0.1),
          style: (stroke: 1.5pt + _ge-blue),
          samples: 50,
          x => (a * x + b) / (c * x + d)
        )
        // Nhánh phải
        plot.add(
          domain: (tc_dung + 0.1, domain.at(1)),
          style: (stroke: 1.5pt + _ge-blue),
          samples: 50,
          x => (a * x + b) / (c * x + d)
        )
        // Vẽ tiệm cận đứng
        plot.add(
          ((tc_dung, -10), (tc_dung, 10)),
          style: (stroke: (paint: _ge-red, dash: "dashed"))
        )
        // Vẽ tiệm cận ngang
        plot.add(
          ((-10, tc_ngang), (10, tc_ngang)),
          style: (stroke: (paint: _ge-red, dash: "dashed"))
        )
      }
    )
  })
}
