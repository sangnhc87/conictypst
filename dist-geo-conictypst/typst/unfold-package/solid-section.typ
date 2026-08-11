// math-diagrams/solid-section.typ
// Vẽ thiết diện 3D tự động cho các bài toán thể tích tích phân

#import "@preview/cetz:0.5.2"

#import "@preview/cetz:0.5.2"

#let draw-solid-section(
  type: "circle", // "circle", "semi-circle", "triangle", "square", "pentagon", "hexagon"
  axis: "y", // "y" hoặc "x"
  f: none, // Hàm số R(t) hoặc a(t)
  f2: none, // Hàm số R2(t) hoặc a2(t) (Đường cong bên trong, tạo khối rỗng)
  domain: (0, 4), // (start, end)
  slices: (), // Mảng các vị trí vẽ lát cắt (vd: (1, 2, 3))
  caps: true, // Vẽ mặt đáy và mặt đỉnh
  value-type: "radius", // "radius" (bán kính ngoại tiếp) hoặc "side" (cạnh đa giác)
  anchor: "center", // "center" (tâm ở gốc) hoặc "bottom" (đáy nằm trên trục)
  rotation: 0deg, // Xoay thiết diện
  proj-vector: (-0.4, -0.15), // Vector chiếu của trục Z lên X, Y
  show-axis: true,
  theme: "blue",
  size-scale: 1.0,
  opacity: 0.2,
  steps: 40 // Số bước chia để vẽ đường cong (tuỳ biến độ mịn)
) = {
  import cetz.draw: *

  let colors = if theme == "blue" {
    (rgb("0088cc"), rgb("006699"), rgb("005588"))
  } else if theme == "orange" {
    (rgb("ff8800"), rgb("cc6600"), rgb("aa5500"))
  } else if theme == "green" {
    (rgb("43a047"), rgb("2e7d32"), rgb("1b5e20"))
  } else if theme == "gray" {
    (rgb("aaaaaa"), rgb("888888"), rgb("666666"))
  } else {
    (rgb("0088cc"), rgb("006699"), rgb("005588"))
  }

  let fill-color = colors.at(0).transparentize(100% - opacity * 100%)
  let edge-color = colors.at(1)
  let outline-color = colors.at(2)
  let hidden-edge-color = edge-color.transparentize(50%)

  cetz.canvas(length: size-scale * 1cm, {
    
    // Hàm chiếu 3D
    let proj(x, y, z) = {
      if axis == "y" {
        (x + proj-vector.at(0) * z, y + proj-vector.at(1) * z)
      } else {
        (x + proj-vector.at(1) * z, y + proj-vector.at(0) * z)
      }
    }

    if show-axis {
      if axis == "y" {
        line(proj(0,0,0), proj(2.5,0,0), mark: (end: ">"), stroke: 0.5pt)
        content(proj(2.7,0,0), $x$)
        line(proj(0,0,0), proj(0, domain.at(1) + 1.0, 0), mark: (end: ">"), stroke: 0.5pt)
        content(proj(0, domain.at(1) + 1.2, 0), $y$)
        line(proj(0,0,0), proj(0,0, 3), mark: (end: ">"), stroke: 0.5pt)
        content(proj(0,0, 3.3), $z$)
        content(proj(0.3,-0.2,0), $O$)
      } else {
        line(proj(0,0,0), proj(domain.at(1) + 1.0, 0, 0), mark: (end: ">"), stroke: 0.5pt)
        content(proj(domain.at(1) + 1.2, 0, 0), $x$)
        line(proj(0,0,0), proj(0, 2.5, 0), mark: (end: ">"), stroke: 0.5pt)
        content(proj(0, 2.7, 0), $y$)
        line(proj(0,0,0), proj(0,0, 3), mark: (end: ">"), stroke: 0.5pt)
        content(proj(0,0, 3.3), $z$)
        content(proj(-0.2, -0.3, 0), $O$)
      }
    }

    let n-sides = 0
    let angle-offset = rotation
    if type == "triangle" {
      n-sides = 3
      angle-offset += -90deg
    } else if type == "square" {
      n-sides = 4
      angle-offset += 45deg
    } else if type == "pentagon" {
      n-sides = 5
      angle-offset += 90deg
    } else if type == "hexagon" {
      n-sides = 6
      angle-offset += 90deg
    } else if type == "circle" or type == "semi-circle" {
      n-sides = 36
    }

    let get_R(t, is_inner: false) = {
      if is_inner and f2 == none { return 0.0 }
      let val = if is_inner { f2(t) } else { f(t) }
      if value-type == "radius" {
        return val
      } else {
        if type == "triangle" { return val / calc.sqrt(3) }
        if type == "square" { return val / calc.sqrt(2) }
        if type == "pentagon" { return val / (2 * calc.sin(36deg)) }
        if type == "hexagon" { return val }
        return val
      }
    }

    let get_vertex_3d(t, k, is_inner: false) = {
      let R = get_R(t, is_inner: is_inner)
      let th = angle-offset + k * (360deg / n-sides)
      
      let min_pz = 0.0
      let min_px = 0.0
      if anchor == "bottom" {
        let R_out = get_R(t, is_inner: false)
        min_pz = 9999.0
        for i in range(0, n-sides) {
          let ith = angle-offset + i * (360deg / n-sides)
          let iz = R_out * calc.sin(ith)
          if iz < min_pz { min_pz = iz }
        }
      }

      let px = R * calc.cos(th) - min_px
      let pz = R * calc.sin(th) - min_pz
      
      if type == "semi-circle" {
         if k > 18 { pz = 0 }
      }

      if axis == "y" {
        return (px, t, pz)
      } else {
        return (t, px, pz)
      }
    }

    let is_hidden(k) = {
      let R = 1.0
      let th = angle-offset + k * (360deg / n-sides)
      let z_val = R * calc.sin(th)
      return z_val < -0.01
    }

    let draw_long_edges(is_inner: false) = {
      if type != "circle" and type != "semi-circle" {
        for k in range(0, n-sides) {
          let pts = ()
          let steps = 40
          let step = (domain.at(1) - domain.at(0)) / steps
          for i in range(0, steps + 1) {
            let t = domain.at(0) + i * step
            let v = get_vertex_3d(t, k, is_inner: is_inner)
            pts.push(proj(v.at(0), v.at(1), v.at(2)))
          }
          
          if is_hidden(k) {
            line(..pts, stroke: (dash: "dashed", paint: hidden-edge-color, thickness: 0.8pt))
          } else {
            line(..pts, stroke: (paint: edge-color, thickness: 0.8pt))
          }
        }
      } else {
        let dx = proj-vector.at(0)
        let th_max = calc.atan(dx)
        let th_min = th_max + 180deg
        
        for th in (th_max, th_min) {
          let pts = ()
          let steps = 40
          let step = (domain.at(1) - domain.at(0)) / steps
          for i in range(0, steps + 1) {
            let t = domain.at(0) + i * step
            let R = get_R(t, is_inner: is_inner)
            
            let min_pz = 0.0
            if anchor == "bottom" { 
              let R_out = get_R(t, is_inner: false)
              min_pz = -R_out 
            }
            
            let px = R * calc.cos(th)
            let pz = R * calc.sin(th) - min_pz
            if type == "semi-circle" and pz < 0 { pz = 0 }
            
            if axis == "y" { pts.push(proj(px, t, pz)) } 
            else { pts.push(proj(t, px, pz)) }
          }
          line(..pts, stroke: (paint: outline-color, thickness: 1.2pt))
        }
        
        // Vẽ thêm đường sinh chân đáy nếu anchor = bottom
        if anchor == "bottom" and not is_inner {
          let pts = ()
          let steps = 40
          let step = (domain.at(1) - domain.at(0)) / steps
          for i in range(0, steps + 1) {
            let t = domain.at(0) + i * step
            if axis == "y" { pts.push(proj(0, t, 0)) }
            else { pts.push(proj(t, 0, 0)) }
          }
          line(..pts, stroke: (dash: "dashed", paint: hidden-edge-color, thickness: 0.8pt))
        }
      }
    }

    draw_long_edges(is_inner: false)
    // if f2 != none { draw_long_edges(is_inner: true) }

    let draw_slice(t, fill-shape: false) = {
      if type == "circle" or type == "semi-circle" {
        let pts_back = ()
        let pts_front = ()
        let full = ()
        let pts_back_in = ()
        let pts_front_in = ()
        let full_in = ()
        
        for i in range(0, 37) {
          let v = get_vertex_3d(t, i, is_inner: false)
          let p2d = proj(v.at(0), v.at(1), v.at(2))
          full.push(p2d)
          if i <= 18 { pts_front.push(p2d) }
          if i >= 18 { pts_back.push(p2d) }
          
          if f2 != none {
            let vi = get_vertex_3d(t, i, is_inner: true)
            let p2di = proj(vi.at(0), vi.at(1), vi.at(2))
            full_in.push(p2di)
            if i <= 18 { pts_front_in.push(p2di) }
            if i >= 18 { pts_back_in.push(p2di) }
          }
        }
        
        line(..pts_back, stroke: (dash: "dashed", paint: hidden-edge-color))
        if f2 != none { line(..pts_back_in, stroke: (dash: "dashed", paint: hidden-edge-color)) }
        
        if fill-shape {
          let poly = ()
          for p in full { poly.push(p) }
          if f2 != none {
            for p in full_in.rev() { poly.push(p) }
          }
          line(..poly, close: true, fill: fill-color, stroke: none)
        }
        line(..pts_front, stroke: (paint: edge-color, thickness: 1.0pt))
        if f2 != none { line(..pts_front_in, stroke: (paint: edge-color, thickness: 1.0pt)) }
        
        if type == "semi-circle" {
          let v1 = get_vertex_3d(t, 0, is_inner: false)
          let v2 = get_vertex_3d(t, 18, is_inner: false)
          line(proj(v1.at(0), v1.at(1), v1.at(2)), proj(v2.at(0), v2.at(1), v2.at(2)), stroke: (dash: "dashed", paint: hidden-edge-color))
          if f2 != none {
            let vi1 = get_vertex_3d(t, 0, is_inner: true)
            let vi2 = get_vertex_3d(t, 18, is_inner: true)
            line(proj(vi1.at(0), vi1.at(1), vi1.at(2)), proj(vi2.at(0), vi2.at(1), vi2.at(2)), stroke: (dash: "dashed", paint: hidden-edge-color))
          }
        }
      } else {
        let pts = ()
        let pts_in = ()
        for k in range(0, n-sides) {
          let v = get_vertex_3d(t, k, is_inner: false)
          pts.push(proj(v.at(0), v.at(1), v.at(2)))
          if f2 != none {
            let vi = get_vertex_3d(t, k, is_inner: true)
            pts_in.push(proj(vi.at(0), vi.at(1), vi.at(2)))
          }
        }
        if fill-shape { 
          let poly = ()
          for p in pts { poly.push(p) }
          if f2 != none {
            poly.push(pts.first())
            for p in pts_in.rev() { poly.push(p) }
            poly.push(pts_in.last())
          }
          line(..poly, close: true, fill: fill-color, stroke: none) 
        }
        
        let draw_edges(p_arr) = {
          for k in range(0, n-sides) {
            let p1 = p_arr.at(k)
            let p2 = p_arr.at(calc.rem(k + 1, n-sides))
            let mid_th = angle-offset + (k + 0.5) * (360deg / n-sides)
            let hidden = calc.sin(mid_th) < -0.01
            if hidden { line(p1, p2, stroke: (dash: "dashed", paint: hidden-edge-color, thickness: 0.8pt)) } 
            else { line(p1, p2, stroke: (paint: edge-color, thickness: 1.0pt)) }
          }
        }
        draw_edges(pts)
        if f2 != none { draw_edges(pts_in) }
      }
    }

    let all_slices = slices
    if caps {
      all_slices.push(domain.at(0))
      all_slices.push(domain.at(1))
    }
    
    let sorted_slices = all_slices.sorted()
    let dedup_slices = ()
    for t in sorted_slices {
      if dedup_slices.len() == 0 or dedup_slices.last() != t {
        dedup_slices.push(t)
      }
    }

    for t in dedup_slices { draw_slice(t, fill-shape: true) }

    if type != "circle" and type != "semi-circle" {
      let left_pts = ()
      let right_pts = ()
      let steps = 40
      let step = (domain.at(1) - domain.at(0)) / steps
      for i in range(0, steps + 1) {
        let t = domain.at(0) + i * step
        let min_px = 9999.0
        let max_px = -9999.0
        let p_min = (0,0)
        let p_max = (0,0)
        for k in range(0, n-sides) {
          let v = get_vertex_3d(t, k, is_inner: false)
          let p2d = proj(v.at(0), v.at(1), v.at(2))
          let val = if axis == "y" { p2d.at(0) } else { p2d.at(1) }
          
          if val < min_px { min_px = val; p_min = p2d }
          if val > max_px { max_px = val; p_max = p2d }
        }
        left_pts.push(p_min)
        right_pts.push(p_max)
      }
      line(..left_pts, stroke: (paint: outline-color, thickness: 1.2pt))
      line(..right_pts, stroke: (paint: outline-color, thickness: 1.2pt))
    }
  })
}
