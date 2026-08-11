#import "@preview/cetz:0.5.2"

// Hàm phụ để lấy tọa độ cho Venn 2
#let get-venn2-points() = {
  return (
    c1: (-0.8, 0),
    c2: (0.8, 0),
    r: 1.5,
    pts: (
      "A": (-1.3, 0),
      "B": (1.3, 0),
      "AB": (0, 0),
      "labelA": (-1.5, 1.5),
      "labelB": (1.5, 1.5)
    )
  )
}

// Hàm phụ để lấy tọa độ cho Venn 3
#let get-venn3-points() = {
  return (
    c1: (-0.8, 0.462),
    c2: (0.8, 0.462),
    c3: (0, -0.924),
    r: 1.5,
    pts: (
      "A": (-1.4, 0.9),
      "B": (1.4, 0.9),
      "C": (0, -1.6),
      "AB": (0, 0.8),
      "AC": (-0.8, -0.4),
      "BC": (0.8, -0.4),
      "ABC": (0, 0.1),
      "labelA": (-1.5, 1.8),
      "labelB": (1.5, 1.8),
      "labelC": (0, -2.5)
    )
  )
}

// Hàm phụ để lấy dữ liệu cho Venn 4 (dùng 4 elip)
#let get-venn4-points() = {
  // 4 hình elip. 
  // rx=2.5, ry=1.2
  return (
    e1: (c: (-0.5, 0), rot: 45deg),
    e2: (c: (-0.5, 0), rot: -45deg),
    e3: (c: (0.5, 0), rot: 45deg),
    e4: (c: (0.5, 0), rot: -45deg),
    rx: 2.5,
    ry: 1.2,
    pts: (
      // Các tọa độ tham khảo (gần đúng)
      "A": (-2.3, 1.5),
      "B": (-2.3, -1.5),
      "C": (2.3, 1.5),
      "D": (2.3, -1.5),
      "AB": (-1.8, 0),
      "CD": (1.8, 0),
      "AC": (0, 2),
      "BD": (0, -2),
      "AD": (0, 0), // AD và BC nằm ở trung tâm nhưng giao với các vùng khác
      "BC": (0, 0),
      "ABCD": (0, 0),
      "labelA": (-2.5, 2.5),
      "labelB": (-2.5, -2.5),
      "labelC": (2.5, 2.5),
      "labelD": (2.5, -2.5)
    )
  )
}

#let venn-diagram(
  n: 2, // 2, 3, hoặc 4
  labels: ("A", "B", "C", "D"), // Tên các tập hợp
  values: (:), // Dictionary chứa các giá trị (VD: ("A": 10, "AB": 5))
  theme: "default", // "default", "blue", "red", "green", "minimal"
  size-scale: 1.0,
  opacity: 0.15, // Độ mờ của các hình nền
) = {
  import cetz.draw: *
  
  // Xác định màu sắc theo theme
  let colors = if theme == "blue" {
    (rgb("1e88e5"), rgb("ffb300"), rgb("43a047"), rgb("e53935"))
  } else if theme == "red" {
    (rgb("e53935"), rgb("1e88e5"), rgb("ffb300"), rgb("43a047"))
  } else if theme == "green" {
    (rgb("43a047"), rgb("e53935"), rgb("1e88e5"), rgb("ffb300"))
  } else if theme == "minimal" {
    (black, black, black, black)
  } else {
    // default
    (rgb("0057b8"), rgb("cc2200"), rgb("1a7a2e"), rgb("d81b60"))
  }
  
  let fill-colors = if theme == "minimal" {
    (none, none, none, none)
  } else {
    (colors.at(0).transparentize(100% - opacity * 100%), 
     colors.at(1).transparentize(100% - opacity * 100%), 
     colors.at(2).transparentize(100% - opacity * 100%), 
     colors.at(3).transparentize(100% - opacity * 100%))
  }

  cetz.canvas(length: size-scale * 1cm, {
    if n == 2 {
      let data = get-venn2-points()
      // Vẽ 2 hình tròn
      circle(data.c1, radius: data.r, stroke: 1.5pt + colors.at(0), fill: fill-colors.at(0))
      circle(data.c2, radius: data.r, stroke: 1.5pt + colors.at(1), fill: fill-colors.at(1))
      
      // Vẽ nhãn tập hợp
      if labels.len() >= 1 { content(data.pts.labelA, text(weight: "bold", fill: colors.at(0), labels.at(0))) }
      if labels.len() >= 2 { content(data.pts.labelB, text(weight: "bold", fill: colors.at(1), labels.at(1))) }
      
      // Vẽ giá trị
      for (k, v) in values.pairs() {
        if k in data.pts {
          content(data.pts.at(k), [#v])
        }
      }
    } else if n == 3 {
      let data = get-venn3-points()
      // Vẽ 3 hình tròn
      circle(data.c1, radius: data.r, stroke: 1.5pt + colors.at(0), fill: fill-colors.at(0))
      circle(data.c2, radius: data.r, stroke: 1.5pt + colors.at(1), fill: fill-colors.at(1))
      circle(data.c3, radius: data.r, stroke: 1.5pt + colors.at(2), fill: fill-colors.at(2))
      
      // Vẽ nhãn tập hợp
      if labels.len() >= 1 { content(data.pts.labelA, text(weight: "bold", fill: colors.at(0), labels.at(0))) }
      if labels.len() >= 2 { content(data.pts.labelB, text(weight: "bold", fill: colors.at(1), labels.at(1))) }
      if labels.len() >= 3 { content(data.pts.labelC, text(weight: "bold", fill: colors.at(2), labels.at(2))) }
      
      // Vẽ giá trị
      for (k, v) in values.pairs() {
        if k in data.pts {
          content(data.pts.at(k), [#v])
        }
      }
    } else if n == 4 {
      let data = get-venn4-points()
      // Vẽ 4 hình elip
      
      group({
        anchor("origin", data.e1.c)
        rotate(data.e1.rot)
        circle((0,0), radius: (data.rx, data.ry), stroke: 1.5pt + colors.at(0), fill: fill-colors.at(0))
      })
      group({
        anchor("origin", data.e2.c)
        rotate(data.e2.rot)
        circle((0,0), radius: (data.rx, data.ry), stroke: 1.5pt + colors.at(1), fill: fill-colors.at(1))
      })
      group({
        anchor("origin", data.e3.c)
        rotate(data.e3.rot)
        circle((0,0), radius: (data.rx, data.ry), stroke: 1.5pt + colors.at(2), fill: fill-colors.at(2))
      })
      group({
        anchor("origin", data.e4.c)
        rotate(data.e4.rot)
        circle((0,0), radius: (data.rx, data.ry), stroke: 1.5pt + colors.at(3), fill: fill-colors.at(3))
      })
      
      // Vẽ nhãn tập hợp
      if labels.len() >= 1 { content(data.pts.labelA, text(weight: "bold", fill: colors.at(0), labels.at(0))) }
      if labels.len() >= 2 { content(data.pts.labelB, text(weight: "bold", fill: colors.at(1), labels.at(1))) }
      if labels.len() >= 3 { content(data.pts.labelC, text(weight: "bold", fill: colors.at(2), labels.at(2))) }
      if labels.len() >= 4 { content(data.pts.labelD, text(weight: "bold", fill: colors.at(3), labels.at(3))) }
      
      // Vẽ giá trị
      for (k, v) in values.pairs() {
        if k in data.pts {
          content(data.pts.at(k), [#v])
        }
      }
    }
  })
}
