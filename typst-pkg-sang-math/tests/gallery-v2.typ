// ═══════════════════════════════════════════════════════════════
// TEST / GALLERY — Kiểm tra tất cả hàm mới của sang-math v2
// Compile: typst compile tests/gallery-v2.typ tests/gallery-v2.pdf
// ═══════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2"
#import "../core/math-utils.typ": linspace, lerp, pt-lerp
#import "../core/colors.typ": *
#import "../geometry-3d/curves-3d.typ": draw-helix, draw-spring, helix-points
#import "../geometry-3d/revolution.typ": draw-cylinder, draw-cone, draw-sphere
#import "../geometry-2d/conics.typ": draw-parabola, draw-ellipse, draw-hyperbola

#set page(paper: "a4", margin: 1.5cm)
#set text(font: "New Computer Modern", size: 11pt)

#align(center)[
  #text(size: 18pt, weight: "bold")[SANG-MATH v1.0.1 — Gallery Test]
  #v(0.3em)
  #text(size: 11pt, fill: gray)[Kiểm tra tất cả hàm hình học mới]
]

#line(length: 100%, stroke: 0.5pt)
#v(0.5em)

// ── 1. draw-helix ──────────────────────────────────────────────
#text(weight: "bold")[1. draw-helix — Kiến bò trên mặt trụ]

#grid(columns: (1fr, 1fr), gutter: 1em,
  // Hình 3D Khối Trụ
  align(center)[
    #text(size: 9pt, fill: gray)[Hình 3D: trụ + helix tự động nét đứt]
    #cetz.canvas(length: 0.7cm, {
      import cetz.draw: *

      // Vẽ khung trụ
      draw-cylinder(
        name: "trụ",
        center: (-8, 0),
        radius: 2,
        height: 8,
        color: sm-blue,
      )

      // Điểm A, B
      circle((-10, 0), radius: 0.1, fill: sm-blue)
      content((-10.5, 0), [$A$])
      circle((-6, 8), radius: 0.1, fill: sm-green)
      content((-5.5, 8), [$B$])

      // ✨ 1 DÒNG thay cho 3 dòng toạ độ dài ngoằng!
      draw-helix(
        center: (-8, 0),
        radius: 2,
        height: 8,
        loops: 1.5,
        color: sm-red,
        auto-dashed: true,
      )

      content((-8, -1.2), text(size: 8pt)[Hình 3D])
    })
  ],

  // Hình Trải Phẳng
  align(center)[
    #text(size: 9pt, fill: gray)[Hình 2D: trải phẳng]
    #cetz.canvas(length: 0.7cm, {
      import cetz.draw: *

      rect((-2, 0), (2, 8), fill: rgb("E8F5E9"), stroke: 1.5pt)
      rect((2, 0), (4, 8), fill: rgb("F1F8E9"), stroke: 1.5pt)

      circle((-2, 0), radius: 0.1, fill: sm-blue)
      content((-2.5, -0.3), [$A$])
      circle((4, 8), radius: 0.1, fill: sm-green)
      content((4.5, 8.3), [$B'$])

      line((-2, 0), (4, 8), stroke: 2pt + sm-red)
      content((0, 4.5), box(fill: rgb("fce4ec"), inset: 2pt, radius: 2pt)[
        #text(size: 8pt)[$d = 10$]
      ])
      content((2, -0.8), text(size: 8pt)[Hình trải phẳng])
    })
  ]
)

#v(0.5em)
#line(length: 100%, stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
#v(0.3em)

// ── 2. draw-cone, draw-sphere ──────────────────────────────────
#text(weight: "bold")[2. draw-cone + draw-sphere — Anchor system]

#align(center)[
  #cetz.canvas(length: 0.7cm, {
    import cetz.draw: *

    // Nón — bên trái
    draw-cone(name: "N", center: (-5, 0), radius: 2, height: 5,
              color: sm-purple, show-hidden: true,
              label-apex: [$S$], label-center: [$O$])

    // Người dùng thêm vào bằng anchor:
    line("N.apex", "N.center",
         stroke: (dash: "dashed", paint: sm-gray, thickness: 0.8pt))
    circle("N.left", radius: 0.1, fill: sm-red)
    content("N.left", [$A$], anchor: "east", padding: 0.15)

    // Cầu — bên phải
    draw-sphere(name: "S", center: (5, 2.5), radius: 2.5,
                color: sm-orange, show-equator: true, show-meridian: true)

    // Người dùng thêm vào bằng anchor:
    circle("S.top", radius: 0.1, fill: sm-green)
    content("S.top", [$N$], anchor: "south", padding: 0.2)
    circle("S.bottom", radius: 0.1, fill: sm-red)
    content("S.bottom", [$S$], anchor: "north", padding: 0.2)
    line("S.top", "S.bottom",
         stroke: (dash: "dashed", paint: sm-gray, thickness: 0.8pt))
  })
]

#v(0.3em)
#line(length: 100%, stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
#v(0.3em)

// ── 3. Conic 2D ────────────────────────────────────────────────
#text(weight: "bold")[3. Conic 2D — Parabol, Elip, Hyperbol với Anchor]

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *

    // Trục tọa độ
    line((-4.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt + sm-gray)
    line((0, -3.2), (0, 3.2), mark: (end: ">"), stroke: 0.8pt + sm-gray)
    content((4.7, 0), [$x$])
    content((0, 3.4), [$y$])

    // Parabol y = x² - 2
    draw-parabola(name: "P", a: 0.4, h: -5, k: 0,
                  x-range: (-8.0, -2.0), color: sm-blue,
                  label-vertex: [$V$])

    // Elip trung tâm
    draw-ellipse(name: "E", a: 3, b: 2, center: (0.0, 0.0),
                 color: sm-purple, fill: rgb("F3E5F5"),
                 show-foci: true)

    // Người dùng thêm điểm P trên Elip bằng anchor:
    circle("E.top", radius: 0.08, fill: sm-red)
    content("E.top", [$P$], anchor: "south", padding: 0.15)

    // Hyperbol (nhỏ bên phải)
    draw-hyperbola(name: "H", a: 0.8, b: 1, center: (7.0, 0.0),
                   y-range: (-2.5, 2.5), color: sm-red,
                   show-asymptotes: true)
  })
]

#v(0.3em)
#line(length: 100%, stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
#v(0.3em)

// ── 4. draw-spring ─────────────────────────────────────────────
#text(weight: "bold")[4. draw-spring — Lò xo (bonus)]

#align(center)[
  #cetz.canvas(length: 0.8cm, {
    import cetz.draw: *

    // Trần và sàn
    line((-1, 5), (1, 5), stroke: 2pt + sm-gray)
    line((-1, 0), (1, 0), stroke: 2pt + sm-gray)

    // Lò xo
    draw-spring(center: (0, 0), radius: 0.5, height: 5, coils: 7,
                color: sm-blue)

    // Nhãn
    content((1.5, 2.5), [$k$])
    content((0, -0.5), text(size: 8pt)[Lò xo])
  })
]

#v(1em)
#align(center)[
  #text(size: 9pt, fill: gray)[
    sang-math v1.0.1 — #datetime.today().display("[year]/[month]/[day]")
  ]
]
