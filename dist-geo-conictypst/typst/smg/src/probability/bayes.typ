// ═════════════════════════════════════════════════════════════════════════════
// PROBABILITY: BAYES HELPERS
// Các hàm hỗ trợ tính toán Bayes và vẽ sơ đồ cây kết hợp tìm x
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": draw

/// Vẽ sơ đồ hộp bi -> hộp III -> rút bi (mô hình truyền tin / trích mẫu).
/// - name (string): Tên nhóm.
/// - box1-label (content): Nhãn hộp I.
/// - box2-label (content): Nhãn hộp II.
/// - box3-label (content): Nhãn hộp III.
/// - take1 (content): Số bi lấy từ hộp I.
/// - take2 (content): Số bi lấy từ hộp II.
/// - result-color (color): Màu kết quả rút ra.
/// - result-label (content): Nhãn kết quả.
/// -> group
#let draw-box-transfer-diagram(
  name: "box-transfer",
  box1-label: [Hộp I],
  box2-label: [Hộp II],
  box3-label: [Hộp III],
  take1: [3 bi],
  take2: [2 bi],
  result-color: red,
  result-label: [Đỏ],
) = {
  draw.group(name: name, {
    // Hộp I
    draw.rect((-4.5, 2), (-1.5, 5), radius: 0.2, stroke: 1.5pt + rgb("1A5276"), fill: rgb("EBF5FB"))
    draw.content((-3, 5.5), text(weight: "bold", fill: rgb("1A5276"))[#box1-label])

    // Hộp II
    draw.rect((1.5, 2), (4.5, 5), radius: 0.2, stroke: 1.5pt + rgb("900C3F"), fill: rgb("FADBD8"))
    draw.content((3, 5.5), text(weight: "bold", fill: rgb("900C3F"))[#box2-label])

    // Hộp III
    draw.rect((-1.5, -2.5), (1.5, 0), radius: 0.2, stroke: 1.5pt + rgb("117A65"), fill: rgb("E8F8F5"))
    draw.content((0, 0.5), text(weight: "bold", fill: rgb("117A65"))[#box3-label])

    // Mũi tên chuyển bi
    draw.line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black), stroke: 1.5pt + rgb("555555"))
    draw.content((-2.2, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*#take1*])

    draw.line((3, 2), (0.5, 0), mark: (end: ">", fill: black), stroke: 1.5pt + rgb("555555"))
    draw.content((2.2, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*#take2*])

    // Kết quả rút ra
    draw.line((0, -2.5), (0, -4), mark: (end: ">", fill: black), stroke: 1.5pt + result-color)
    draw.circle((0, -4.6), radius: 0.4, fill: rgb("ffebee"), stroke: 1.5pt + result-color)
    draw.content((0, -4.6), text(fill: result-color, weight: "bold")[#result-label])

    draw.anchor("box1", (-3, 3.5))
    draw.anchor("box2", (3, 3.5))
    draw.anchor("box3", (0, -1.25))
    draw.anchor("result", (0, -4.6))
  })
}

/// Vẽ thanh tỉ trọng đóng góp vào xác suất toàn phần P(M).
/// - name (string): Tên nhóm.
/// - terms (array): Mỗi phần tử là (label, value, color).
/// - total (content): Nhãn tổng.
/// -> group
#let draw-bayes-contribution-bar(
  name: "bayes-bar",
  terms: (),
  total: $P(M)$,
) = {
  let total-value = terms.map(t => t.at(1)).sum()
  let width = 8
  let x = 0

  draw.group(name: name, {
    for (label, value, color) in terms {
      let w = width * value / total-value
      draw.rect((x, 0), (x + w, 1.5), fill: color, stroke: 0.5pt + black, radius: 2pt)
      if w >= 1.8 {
        draw.content((x + w / 2, 0.75), text(size: 8pt)[#label \ #value])
      } else {
        draw.content((x + w / 2, 2.1), text(size: 7pt)[#label \ #value])
        draw.line((x + w / 2, 1.5), (x + w / 2, 1.9), stroke: 0.3pt + rgb("888888"))
      }
      x = x + w
    }
    draw.content((width / 2, -0.5), text(fill: rgb("d32f2f"))[Tổng: #total])

    draw.anchor("start", (0, 0))
    draw.anchor("end", (width, 0))
  })
}
