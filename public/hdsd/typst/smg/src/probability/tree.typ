// ═════════════════════════════════════════════════════════════════════════════
// PROBABILITY: TREE DIAGRAMS
// Các hàm vẽ sơ đồ cây xác suất thông minh
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": draw

/// Vẽ sơ đồ cây xác suất 2 tầng, 2 nhánh mỗi tầng.
/// Phù hợp bài toán: 2 nguồn gốc -> 2 kết quả (Đỏ/Xanh, Phế phẩm/Chuẩn...)
/// - name (string): Tên nhóm.
/// - root-label (content): Nhãn nút gốc.
/// - level1 (array): 2 nhánh tầng 1, mỗi nhánh là (label, probability).
/// - level2 (array): 4 nhánh tầng 2, theo thứ tự [A-M, A-notM, B-M, B-notM].
/// - colors (array): Màu cho [nhánh A, nhánh B, kết quả M, kết quả notM].
/// - spacing (float): Khoảng cách giữa các nút.
/// -> group
#let draw-tree-2x2(
  name: "tree-2x2",
  root-label: [Gốc],
  level1: (([A], $p$), ([B], $1-p$)),
  level2: (([M], $a$), ([not M], $1-a$), ([M], $b$), ([not M], $1-b$)),
  colors: (rgb("009688"), rgb("ef6c00"), red, blue),
  spacing: 3.5,
) = {
  let s = spacing
  let (cA, cB, cM, cNotM) = colors

  let ((labA, pA), (labB, pB)) = level1
  let ((labAM, pAM), (labAnM, pAnM), (labBM, pBM), (labBnM, pBnM)) = level2

  draw.group(name: name, {
    // Nút gốc
    draw.content(
      (0, 0),
      root-label,
      name: "root",
      frame: "rect",
      padding: 5pt,
      fill: rgb("e3f2fd"),
      stroke: 0.5pt + rgb("1e88e5"),
      radius: 3pt,
    )

    // Tầng 1
    draw.content((s, s * 0.7), labA, name: "A", frame: "rect", padding: 4pt, stroke: 0.5pt + cA, radius: 2pt)
    draw.content((s, -s * 0.7), labB, name: "B", frame: "rect", padding: 4pt, stroke: 0.5pt + cB, radius: 2pt)

    draw.line("root", "A", mark: (end: ">", fill: black))
    draw.content((s * 0.5, s * 0.45), box(fill: white, inset: 1pt)[#pA])

    draw.line("root", "B", mark: (end: ">", fill: black))
    draw.content((s * 0.5, -s * 0.45), box(fill: white, inset: 1pt)[#pB])

    // Tầng 2
    draw.content((2 * s, s * 1.1), labAM, name: "AM", frame: "rect", padding: 3pt, stroke: 0.5pt + cM, radius: 2pt)
    draw.content((2 * s, s * 0.3), labAnM, name: "AnM", frame: "rect", padding: 3pt, stroke: 0.5pt + cNotM, radius: 2pt)
    draw.content((2 * s, -s * 0.3), labBM, name: "BM", frame: "rect", padding: 3pt, stroke: 0.5pt + cM, radius: 2pt)
    draw.content(
      (2 * s, -s * 1.1),
      labBnM,
      name: "BnM",
      frame: "rect",
      padding: 3pt,
      stroke: 0.5pt + cNotM,
      radius: 2pt,
    )

    draw.line("A", "AM", mark: (end: ">", fill: cM), stroke: cM)
    draw.content((1.5 * s, s * 0.95), box(fill: white, inset: 1pt)[#pAM])

    draw.line("A", "AnM", mark: (end: ">", fill: cNotM), stroke: cNotM)
    draw.content((1.5 * s, s * 0.45), box(fill: white, inset: 1pt)[#pAnM])

    draw.line("B", "BM", mark: (end: ">", fill: cM), stroke: cM)
    draw.content((1.5 * s, -s * 0.45), box(fill: white, inset: 1pt)[#pBM])

    draw.line("B", "BnM", mark: (end: ">", fill: cNotM), stroke: cNotM)
    draw.content((1.5 * s, -s * 0.95), box(fill: white, inset: 1pt)[#pBnM])

    // Anchor
    draw.anchor("root", (0, 0))
    draw.anchor("A", (s, s * 0.7))
    draw.anchor("B", (s, -s * 0.7))
  })
}

/// Vẽ sơ đồ cây xác suất 2 tầng, 3 nhánh tầng 1 và 2 nhánh tầng 2.
/// Phù hợp bài toán: 3 nhóm khách hàng (mua/cân nhắc/không mua) -> mua/không.
/// - name (string): Tên nhóm.
/// - root-label (content): Nhãn nút gốc.
/// - level1 (array): 3 nhánh tầng 1, mỗi nhánh là (label, probability).
/// - level2 (array): 6 nhánh tầng 2, theo thứ tự [A-M, A-notM, B-M, B-notM, C-M, C-notM].
/// - colors (array): Màu cho [nhánh A, B, C, kết quả M, kết quả notM].
/// - spacing (float): Khoảng cách giữa các nút.
/// -> group
#let draw-tree-3x2(
  name: "tree-3x2",
  root-label: [Gốc],
  level1: (([A], $p_A$), ([B], $p_B$), ([C], $p_C$)),
  level2: (([M], $a$), ([not M], $1-a$), ([M], $b$), ([not M], $1-b$), ([M], $c$), ([not M], $1-c$)),
  colors: (rgb("1e88e5"), rgb("7cb342"), rgb("8e24aa"), red, blue),
  spacing: 3.5,
) = {
  let s = spacing
  let (cA, cB, cC, cM, cNotM) = colors

  let ((labA, pA), (labB, pB), (labC, pC)) = level1
  let ((labAM, pAM), (labAnM, pAnM), (labBM, pBM), (labBnM, pBnM), (labCM, pCM), (labCnM, pCnM)) = level2

  draw.group(name: name, {
    // Nút gốc
    draw.content(
      (0, 0),
      root-label,
      name: "root",
      frame: "rect",
      padding: 5pt,
      fill: rgb("e3f2fd"),
      stroke: 0.5pt + rgb("1e88e5"),
      radius: 3pt,
    )

    // Tầng 1
    draw.content((s, s), labA, name: "A", frame: "rect", padding: 4pt, stroke: 0.5pt + cA, radius: 2pt)
    draw.content((s, 0), labB, name: "B", frame: "rect", padding: 4pt, stroke: 0.5pt + cB, radius: 2pt)
    draw.content((s, -s), labC, name: "C", frame: "rect", padding: 4pt, stroke: 0.5pt + cC, radius: 2pt)

    draw.line("root", "A", mark: (end: ">", fill: black))
    draw.content((s * 0.5, s * 0.65), box(fill: white, inset: 1pt)[#pA])

    draw.line("root", "B", mark: (end: ">", fill: black))
    draw.content((s * 0.5, 0.3), box(fill: white, inset: 1pt)[#pB])

    draw.line("root", "C", mark: (end: ">", fill: black))
    draw.content((s * 0.5, -s * 0.65), box(fill: white, inset: 1pt)[#pC])

    // Tầng 2
    draw.content((2 * s, s * 1.2), labAM, name: "AM", frame: "rect", padding: 3pt, stroke: 0.5pt + cM, radius: 2pt)
    draw.content((2 * s, s * 0.6), labAnM, name: "AnM", frame: "rect", padding: 3pt, stroke: 0.5pt + cNotM, radius: 2pt)
    draw.content((2 * s, s * 0.2), labBM, name: "BM", frame: "rect", padding: 3pt, stroke: 0.5pt + cM, radius: 2pt)
    draw.content(
      (2 * s, -s * 0.2),
      labBnM,
      name: "BnM",
      frame: "rect",
      padding: 3pt,
      stroke: 0.5pt + cNotM,
      radius: 2pt,
    )
    draw.content((2 * s, -s * 0.6), labCM, name: "CM", frame: "rect", padding: 3pt, stroke: 0.5pt + cM, radius: 2pt)
    draw.content(
      (2 * s, -s * 1.2),
      labCnM,
      name: "CnM",
      frame: "rect",
      padding: 3pt,
      stroke: 0.5pt + cNotM,
      radius: 2pt,
    )

    draw.line("A", "AM", mark: (end: ">", fill: cM), stroke: cM)
    draw.content((1.5 * s, s * 1.05), box(fill: white, inset: 1pt)[#pAM])

    draw.line("A", "AnM", mark: (end: ">", fill: cNotM), stroke: cNotM)
    draw.content((1.5 * s, s * 0.75), box(fill: white, inset: 1pt)[#pAnM])

    draw.line("B", "BM", mark: (end: ">", fill: cM), stroke: cM)
    draw.content((1.5 * s, s * 0.15), box(fill: white, inset: 1pt)[#pBM])

    draw.line("B", "BnM", mark: (end: ">", fill: cNotM), stroke: cNotM)
    draw.content((1.5 * s, -s * 0.15), box(fill: white, inset: 1pt)[#pBnM])

    draw.line("C", "CM", mark: (end: ">", fill: cM), stroke: cM)
    draw.content((1.5 * s, -s * 0.75), box(fill: white, inset: 1pt)[#pCM])

    draw.line("C", "CnM", mark: (end: ">", fill: cNotM), stroke: cNotM)
    draw.content((1.5 * s, -s * 1.05), box(fill: white, inset: 1pt)[#pCnM])

    // Anchor
    draw.anchor("root", (0, 0))
    draw.anchor("A", (s, s))
    draw.anchor("B", (s, 0))
    draw.anchor("C", (s, -s))
  })
}

/// Vẽ sơ đồ cây Bayes tổng quát với n nhánh tầng 1 và m kết quả tầng 2.
/// - name (string): Tên nhóm.
/// - root-label (content): Nhãn nút gốc.
/// - branches (array): Mỗi phần tử là (label, probability, [(kết-quả, xác-suất), ...]).
/// - spacing (float): Khoảng cách.
/// - result-colors (array): Màu cho các kết quả.
/// -> group
#let draw-bayes-tree(
  name: "bayes",
  root-label: [Gốc],
  branches: (),
  spacing: 3.5,
  result-colors: (red, blue, green),
) = {
  let s = spacing
  let n = branches.len()
  let y-step = if n > 1 { 2 * s / (n - 1) } else { 0 }

  draw.group(name: name, {
    // Nút gốc
    draw.content(
      (0, 0),
      root-label,
      name: "root",
      frame: "rect",
      padding: 5pt,
      fill: rgb("e3f2fd"),
      stroke: 0.5pt + rgb("1e88e5"),
      radius: 3pt,
    )

    for i in range(n) {
      let (label, prob, results) = branches.at(i)
      let y1 = if n > 1 { s - i * y-step } else { 0 }
      let node-name = "b" + str(i)
      let r = calc.min(255, calc.max(0, i * 60 + 30))
      let g = calc.min(255, calc.max(0, 120 - i * 30))
      let b = 180
      let branch-color = rgb(r, g, b)

      // Nút tầng 1
      draw.content(
        (s, y1),
        label,
        name: node-name,
        frame: "rect",
        padding: 4pt,
        stroke: 0.5pt + branch-color,
        radius: 2pt,
      )
      draw.line("root", node-name, mark: (end: ">", fill: black))
      let label-y1 = if calc.abs(y1) < 0.5 { 0.3 } else { y1 * 0.5 }
      draw.content((s * 0.5, label-y1), box(fill: white, inset: 1pt)[#prob])

      // Tầng 2
      let m = results.len()
      let y2-step = if m > 1 { s * 0.8 / (m - 1) } else { 0 }
      for j in range(m) {
        let (res-label, res-prob) = results.at(j)
        let y2 = y1 + s * 0.4 - j * y2-step
        let res-name = node-name + "r" + str(j)
        let res-color = result-colors.at(calc.rem(j, result-colors.len()))
        draw.content(
          (2 * s, y2),
          res-label,
          name: res-name,
          frame: "rect",
          padding: 3pt,
          stroke: 0.5pt + res-color,
          radius: 2pt,
        )
        draw.line(node-name, res-name, mark: (end: ">", fill: res-color), stroke: res-color)
        draw.content((1.5 * s, (y1 + y2) / 2), box(fill: white, inset: 1pt)[#res-prob])
      }
    }

    draw.anchor("root", (0, 0))
  })
}
