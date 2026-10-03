// Mở rộng đồ thị phẳng trên thư viện sang-math-geom chuẩn của dự án.
// Mỗi ràng buộc (a, b, c, strict) biểu diễn a*x + b*y <= c.
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let _sm-gia-tri(p, r) = r.a * p.at(0) + r.b * p.at(1) - r.c

#let _sm-cat-mien(poly, r) = {
  if poly.len() == 0 { return () }
  let out = ()
  for i in range(poly.len()) {
    let a = poly.at(i)
    let b = poly.at(if i + 1 == poly.len() { 0 } else { i + 1 })
    let fa = _sm-gia-tri(a, r)
    let fb = _sm-gia-tri(b, r)
    let inside-a = fa <= 0.000001
    let inside-b = fb <= 0.000001
    if inside-a and inside-b {
      out.push(b)
    } else if inside-a and not inside-b {
      out.push(sm-ti-le(a, b, fa / (fa - fb)))
    } else if not inside-a and inside-b {
      out.push(sm-ti-le(a, b, fa / (fa - fb)))
      out.push(b)
    }
  }
  out
}

#let _sm-bo-trung-diem(points) = {
  let out = ()
  for p in points {
    if not out.any(q => sm-khoang-cach(p, q) < 0.0001) { out.push(p) }
  }
  out
}

#let _sm-bo-nen(r, xmin, xmax, ymin, ymax) = {
  let points = ()
  if calc.abs(r.b) > 0.000001 {
    for x in (xmin, xmax) {
      let y = (r.c - r.a * x) / r.b
      if y >= ymin - 0.000001 and y <= ymax + 0.000001 { points.push((x, y)) }
    }
  }
  if calc.abs(r.a) > 0.000001 {
    for y in (ymin, ymax) {
      let x = (r.c - r.b * y) / r.a
      if x >= xmin - 0.000001 and x <= xmax + 0.000001 { points.push((x, y)) }
    }
  }
  points = _sm-bo-trung-diem(points)
  if points.len() < 2 { return () }
  let best = (points.at(0), points.at(1))
  let longest = sm-khoang-cach(best.at(0), best.at(1))
  for i in range(points.len()) {
    for j in range(i + 1, points.len()) {
      let d = sm-khoang-cach(points.at(i), points.at(j))
      if d > longest { best = (points.at(i), points.at(j)); longest = d }
    }
  }
  best
}

/// Vẽ giao các nửa mặt phẳng bằng cắt đa giác; không nhập tọa độ đỉnh thủ công.
/// `them(ctx, d)` là hook của sang-math-geom để đánh dấu/ghi chú thêm.
#let sm-mien-he-bpt(
  rang-buoc,
  xmin: -1, xmax: 6, ymin: -1, ymax: 6,
  w: 11cm, mau: sm-green, to: rgb("#bbf7d0"),
  them: none,
) = {
  let poly = ((xmin, ymin), (xmax, ymin), (xmax, ymax), (xmin, ymax))
  for r in rang-buoc { poly = _sm-cat-mien(poly, r) }
  hinh(w: w, xmin: xmin, xmax: xmax, ymin: ymin, ymax: ymax, ctx => {
    if poly.len() >= 3 {
      sm-thiet-dien(ctx, poly, to: to, mau: to, day: 0pt)
    }
    he-truc(ctx, buoc-x: 1, buoc-y: 1, so: true, mau-luoi: rgb("#e2e8f0"))
    for r in rang-buoc {
      let ends = _sm-bo-nen(r, xmin, xmax, ymin, ymax)
      if ends.len() == 2 {
        sm-doan(ctx, ends.at(0), ends.at(1), dut: r.strict, mau: mau, day: 1.5pt)
      }
    }
    if them != none { them(ctx, (vertices: poly, rang-buoc: rang-buoc)) }
  })
}
