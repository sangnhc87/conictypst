#import "/typst/sang-exam.typ": *
#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.1"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#set page(width: auto, height: auto, margin: 10pt)
#show math.equation: set text(fill: black)

#cetz.canvas(length: 0.7cm, {
          import cetz.draw: *
          line((-3,0), (3,0), mark: (end: ">")); content((3.2, 0), $x$)
          line((0,-1), (0,5), mark: (end: ">")); content((0, 5.2), $y$)
          content((-0.3, -0.3), $O$)
          
          let pts = ()
          for i in range(-20, 21) {
            let x = i / 10
            let y = x * x * x - 3 * x + 2
            pts.push((x, y))
          }
          line(..pts, stroke: (paint: blue, thickness: 1.2pt))
          
          line((-1,0), (-1,4), (0,4), stroke: (dash: "dashed", paint: gray))
          circle((-1,4), radius: 2pt, fill: red)
          circle((1,0), radius: 2pt, fill: red)
          
          content((-1, -0.4), $-1$)
          content((1, -0.4), $1$)
          content((-0.3, 4), $4$, anchor: "east")
        })
#pagebreak()
#cetz.canvas(length: 1cm, {
          import cetz.draw: *
          line((-0.5, 0), (5.5, 0), mark: (end: ">")); content((5.7, 0), $x$)
          
          let pts = ()
          for i in range(12, 39) {
            let x = i / 10
            let y = -x*x + 5*x - 6
            pts.push((x, y * 3))
          }
          line(..pts, stroke: (paint: blue, thickness: 1.2pt))
          
          circle((2,0), radius: 2pt, fill: red)
          circle((3,0), radius: 2pt, fill: red)
          content((2, -0.3), $2$)
          content((3, -0.3), $3$)
          
          content((2.5, 0.4), [$+$], text: (fill: red, weight: "bold"))
          content((1.5, -0.3), [$-$], text: (fill: blue, weight: "bold"))
          content((3.5, -0.3), [$-$], text: (fill: blue, weight: "bold"))
        })
#pagebreak()
#cetz.canvas(length: 1cm, {
          import cetz.draw: *
          circle((0,0), radius: 1.5, stroke: (paint: blue, thickness: 1.2pt), fill: rgb("e6f2ff"))
          arc((1.5,0), start: 0deg, stop: 180deg, radius: (1.5, 0.4), stroke: (dash: "dashed", paint: gray))
          arc((-1.5,0), start: 180deg, stop: 360deg, radius: (1.5, 0.4), stroke: (paint: blue, thickness: 1pt))
          
          circle((0,0), radius: 2pt, fill: red)
          content((0, -0.25), $I$, text: (fill: red))
          line((0,0), (1.5,0), stroke: (dash: "dashed", paint: red, thickness: 1pt))
          content((0.75, 0.2), $R=3a$, text: (fill: red, size: 10pt))
        })
#pagebreak()
#cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    
    // Hệ trục tọa độ
    line((-0.5, 0), (6.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
    content((6.5, -0.4), text(size: 10pt)[Thời gian])
    content((-0.75, 4.2), text(size: 10pt)[Tần số])
    
    // Các cột biểu đồ
    rect((0,0), (1, 1), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((0.5, 1.3), $5$)
    
    rect((1,0), (2, 2.4), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((1.5, 2.7), $12$)
    
    rect((2,0), (3, 3.6), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((2.5, 3.9), $18$)
    
    rect((3,0), (4, 2), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((3.5, 2.3), $10$)
    
    rect((4,0), (5, 1), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((4.5, 1.3), $5$)
    
    // Đánh dấu mốc trên trục hoành
    content((0, -0.4), $0$)
    content((1, -0.4), $20$)
    content((2, -0.4), $40$)
    content((3, -0.4), $60$)
    content((4, -0.4), $80$)
    content((5, -0.4), $100$)
  })
#pagebreak()
#cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trục
        line((-0.5, 0), (6.5, 0), mark: (end: ">"), stroke: 0.8pt)
        line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
        
        // Vẽ lại các cột, tô đậm cột chứa Q1
        rect((0,0), (1, 1), fill: rgb("bbdefb"), stroke: 0.5pt+black)
        rect((1,0), (2, 2.4), fill: rgb("ffcdd2"), stroke: 1pt+rgb("c62828")) // Cột chứa Q1
        content((1.5, 1.2), text(fill: rgb("c62828"), weight: "bold")[Nhóm \ chứa $Q_1$])
        rect((2,0), (3, 3.6), fill: rgb("bbdefb"), stroke: 0.5pt+black)
        rect((3,0), (4, 2), fill: rgb("bbdefb"), stroke: 0.5pt+black)
        rect((4,0), (5, 1), fill: rgb("bbdefb"), stroke: 0.5pt+black)
        
        // Nhãn
        content((0, -0.4), $0$)
        content((1, -0.4), $20$)
        content((2, -0.4), $40$)
        content((3, -0.4), $60$)
        content((4, -0.4), $80$)
        content((5, -0.4), $100$)
      })
#pagebreak()
#cetz.canvas(length: 0.7cm, {
      import cetz.draw: *

      line((-2.5, 0), (2.5, 0), mark: (end: ">"))
      content((2.5, 0.35), $x$)
      line((0, -2), (0, 3.5), mark: (end: ">"))
      content((0.3, 3.5), $y$)
      content((-0.25, -0.25), $O$)

      line((-1, 0.1), (-1, -0.1))
      content((-1, -0.4), $-1$)
      line((1, 0.1), (1, -0.1))
      content((1, -0.4), $1$)
      line((2, 0.1), (2, -0.1))
      content((2, -0.4), $2$)

      line((0.1, 1), (-0.1, 1))
      content((-0.35, 1), $1$)
      line((0.1, 3), (-0.1, 3))
      content((-0.35, 3), $3$)
      line((0.1, -1), (-0.1, -1))
      content((-0.4, -1), $-1$)

      let pts = ()
      for i in range(-40, 41) {
        let x = i / 20.0
        let y = x * x * x - 3 * x + 1
        pts.push((x, y))
      }
      line(..pts, stroke: 1.2pt + blue)
    })
#pagebreak()
#cetz.canvas(length: 1cm, {
          import cetz.draw: *
          
          let R_sphere = 2.5
          let d_dist = 1.5
          let r_circle = 2 // sqrt(2.5^2 - 1.5^2) = 2

          // Mặt cầu
          circle((0,0), radius: R_sphere, fill: rgb("e6f2ff"), stroke: 1pt + blue)
          arc((R_sphere,0), start: 0deg, stop: 180deg, radius: (R_sphere, 0.6), stroke: (dash: "dashed", paint: gray))
          arc((-R_sphere,0), start: 180deg, stop: 360deg, radius: (R_sphere, 0.6), stroke: 1pt + blue)

          // Đường tròn giao tuyến
          circle((0, d_dist), radius: (r_circle, r_circle*0.25), fill: rgb("ccffcc99"), stroke: 1pt + green)

          // Các điểm tâm
          circle((0,0), radius: 2pt, fill: red)
          content((0.2, -0.2), $I$)

          circle((0,d_dist), radius: 2pt, fill: red)
          content((-0.3, d_dist+0.2), $H$)

          // Các đường sinh của nón và chiều cao
          line((0,0), (-r_circle, d_dist), stroke: (dash: "dashed", paint: red))
          line((0,0), (r_circle, d_dist), stroke: (dash: "dashed", paint: red))
          line((0,0), (0, d_dist), stroke: (dash: "dashed", paint: red))
          line((0,d_dist), (r_circle, d_dist), stroke: (dash: "dashed", paint: red))

          // Ghi chú đại lượng
          content((r_circle/2, d_dist + 0.3), $r$, fill: red)
          content((0.2, d_dist/2), $d$, fill: red)
          content((r_circle/2 + 0.2, d_dist/2), $R$, fill: red)
        })
#pagebreak()
#cetz.canvas(length: 1cm, {
    import cetz.draw: *

    let style-root = (frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
    let style-node = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl = (frame: "rect", fill: white, padding: 1pt, stroke: none)

    // Nút gốc
    content((0, 0), text(size: 10pt)[Học sinh\ THPT NHC], name: "root", ..style-root)

    // Tầng 1: Khối lớp (3 nhánh)
    content((3.5, 2.5), [Khối 10], name: "k10", ..style-node)
    content((3.5, 0), [Khối 11], name: "k11", ..style-node)
    content((3.5, -2.5), [Khối 12], name: "k12", ..style-node)

    line("root", "k10", mark: (end: ">", fill: black)); content((1.8, 1.6), text(size: 9pt)[$0,30$], ..lbl)
    line("root", "k11", mark: (end: ">", fill: black)); content((1.8, 0.2), text(size: 9pt)[$0,35$], ..lbl)
    line("root", "k12", mark: (end: ">", fill: black)); content((1.8, -1.6), text(size: 9pt)[$0,35$], ..lbl)

    // Tầng 2: Hành vi sử dụng (6 lá)
    let style-yes = (frame: "rect", padding: 3pt, stroke: 0.5pt + rgb("388e3c"), fill: rgb("e8f5e9"), radius: 2pt)
    let style-no = (frame: "rect", padding: 3pt, stroke: 0.5pt + rgb("d32f2f"), fill: rgb("ffebee"), radius: 2pt)

    // Khối 10
    content((7.5, 3.2), [Dùng thường xuyên], name: "y10", ..style-yes)
    content((7.5, 1.8), [Ít dùng], name: "n10", ..style-no)
    line("k10", "y10", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,90$], ..lbl)
    line("k10", "n10", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 1.9), text(fill: red, size: 9pt)[$0,10$], ..lbl)

    // Khối 11
    content((7.5, 0.7), [Dùng thường xuyên], name: "y11", ..style-yes)
    content((7.5, -0.7), [Ít dùng], name: "n11", ..style-no)
    line("k11", "y11", mark: (end: ">", fill: black)); content((5.5, 0.6), text(size: 9pt)[$0,80$], ..lbl)
    line("k11", "n11", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, -0.6), text(fill: red, size: 9pt)[$0,20$], ..lbl)

    // Khối 12
    content((7.5, -1.8), [Dùng thường xuyên], name: "y12", ..style-yes)
    content((7.5, -3.2), [Ít dùng], name: "n12", ..style-no)
    line("k12", "y12", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,60$], ..lbl)
    line("k12", "n12", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, -3.1), text(fill: red, size: 9pt)[$0,40$], ..lbl)
  })
#pagebreak()
#cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trục tọa độ
    line((-3.8, 0), (3.8, 0), mark: (end: "stealth")); content((3.8, -0.3), $x$)
    line((0, -0.5), (0, 4.8), mark: (end: "stealth")); content((-0.3, 4.8), $y$)
    content((0.2, -0.3), $O$)
    
    // Các điểm trên trục
    circle((-3, 0), radius: 1.5pt, fill: black); content((-3, -0.35), $A$)
    circle((3, 0), radius: 1.5pt, fill: black); content((3, -0.35), $B$)
    circle((0, 4), radius: 1.5pt, fill: black); content((-0.3, 4.1), $H$)

    // Parabol
    let p-pts = ()
    for i in range(-30, 31) {
      let x = i / 10.0
      p-pts.push((x, -4/9 * x * x + 4))
    }
    
    // Tô màu nền cho cổng (trừ phần bảng quảng cáo)
    let fill-pts = p-pts
    fill-pts.push((3, 0))
    fill-pts.push((-3, 0))
    line(..fill-pts, close: true, fill: rgb("e3f2fd"), stroke: none)
    line(..p-pts, stroke: 1.2pt + rgb("1e88e5"))

    // Biển quảng cáo (Hình chữ nhật)
    let x0 = 1.732 // Căn 3
    let y0 = -4/9 * x0 * x0 + 4 // 8/3 = 2.667
    
    line((-x0, 0), (-x0, y0), (x0, y0), (x0, 0), close: true, fill: rgb("fff3e0"), stroke: 1pt + rgb("f57c00"))
    
    circle((-x0, 0), radius: 1.5pt, fill: black); content((-x0, -0.35), $C$)
    circle((x0, 0), radius: 1.5pt, fill: black); content((x0, -0.35), $D$)
    circle((x0, y0), radius: 1.5pt, fill: black); content((x0+0.3, y0+0.2), $E$)
    circle((-x0, y0), radius: 1.5pt, fill: black); content((-x0 -0.3, y0+0.2), $F$)

    // Chú thích độ dài
    line((-3, -0.8), (3, -0.8), mark: (start: "stealth", end: "stealth"), stroke: 0.5pt + rgb("555555"))
    content((0, -1.1), text(size: 9pt)[$6$ m])
    line((-3, -0.1), (-3, -0.9), stroke: 0.5pt + rgb("555555"))
    line((3, -0.1), (3, -0.9), stroke: 0.5pt + rgb("555555"))

    content((2.5, 2.5), text(fill: rgb("1e88e5"))[$(P)$])
  })
#pagebreak()
#cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      // Phép chiếu 3D trục cơ bản
      let project(x, y, z) = (x - 0.4 * y, z - 0.3 * y)
      let w = 4  // Tỉ lệ trục lớn (tương ứng 20m)
      let h = 2  // Tỉ lệ trục bé (tương ứng 10m)

      // Trục tọa độ
      line(project(-5, 0, 0), project(5.5, 0, 0), stroke: (dash: "dashed", paint: gray), mark: (end: "stealth")); content(project(5.7, 0, 0), $x$)
      line(project(0, -3, 0), project(0, 3.5, 0), stroke: (dash: "dashed", paint: gray), mark: (end: "stealth")); content(project(0, 3.7, 0), $y$)
      line(project(0, 0, 0), project(0, 0, 3), stroke: (dash: "dashed", paint: gray), mark: (end: "stealth")); content(project(0, 0, 3.2), $z$)

      // Vẽ đáy elip
      let base-pts = ()
      for i in range(0, 361, step: 5) {
        let xx = w * calc.cos(i * 1deg)
        let yy = h * calc.sin(i * 1deg)
        base-pts.push(project(xx, yy, 0))
      }
      line(..base-pts, close: true, fill: rgb("e3f2fd"), stroke: 0.8pt + rgb("1e88e5"))

      // Vẽ các thiết diện nửa đường tròn
      let sections = (-3, -1.5, 0, 1.5, 3)
      for xx in sections {
        let inner = 1.0 - (xx*xx)/(w*w)
        if inner < 0 { inner = 0 }
        let R = h * calc.sqrt(inner)
        let arc-pts = ()
        for i in range(0, 181, step: 5) {
          let Y = R * calc.cos(i * 1deg)
          let Z = R * calc.sin(i * 1deg)
          arc-pts.push(project(xx, Y, Z))
        }
        line(..arc-pts, stroke: 0.8pt + rgb("1e88e5"))
        
        // Gạch mặt cắt cho một mặt cắt điển hình
        if xx == 1.5 {
           line(project(xx, R, 0), project(xx, -R, 0), stroke: 0.8pt + rgb("1e88e5"))
           let fill-pts = arc-pts
           fill-pts.push(project(xx, -R, 0))
           fill-pts.push(project(xx, R, 0))
           line(..fill-pts, close: true, fill: rgb("1e88e5"), stroke: none)
           content(project(xx + 0.3, 0, R/2), text(size: 9pt)[$S(x)$], fill: rgb("0d47a1"))
        }
      }

      // Vẽ đường sinh trên cùng (Top ridge)
      let top-pts = ()
      for i in range(-40, 41) {
        let xx = i / 10.0
        let inner = 1.0 - (xx*xx)/(w*w)
        if inner < 0 { inner = 0 }
        let R = h * calc.sqrt(inner)
        top-pts.push(project(xx, 0, R))
      }
      line(..top-pts, stroke: 1.5pt + rgb("d32f2f"))

      // Ghi chú tọa độ (tương ứng kích thước thực)
      content(project(0, 0, -0.25), $O$)
      content(project(4.2, 0, 0), $20$)
      content(project(-4.3, 0, 0), $-20$)
      content(project(0, 2.3, 0), $10$)
      content(project(0, -2.4, 0), $-10$)
    })
#pagebreak()
#cetz.canvas(length: 2.5mm, {
    import cetz.draw: *
    // Trục tọa độ
    line((-2, 0), (25, 0), mark: (end: "stealth")); content((25, -1.5), $t$ + " (ngày)")
    line((0, -2), (0, 13), mark: (end: "stealth")); content((-2.5, 13), $N(t)$)
    content((-1.5, -1.5), $O$)
    
    // Đường tiệm cận
    line((0, 10), (23, 10), stroke: (dash: "dashed", paint: gray))
    content((-3.5, 10), $10000$)

    // Vẽ đồ thị hàm N(t)
    let pts = ()
    for i in range(0, 240) {
      let t = i / 10.0
      let y = 10 / (1 + 99 * calc.exp(-0.5 * t))
      pts.push((t, y))
    }
    line(..pts, stroke: 1.2pt + rgb("1e88e5"))
    content((17, 7.25), text(fill: rgb("1e88e5"), size: 10pt)[Đồ thị lây nhiễm])
  })
#pagebreak()
#cetz.canvas(length: 3mm, {
        import cetz.draw: *
        // Trục tọa độ
        line((-1, 0), (22, 0), mark: (end: "stealth")); content((22, -1.5), $t$)
        line((0, -1), (0, 12), mark: (end: "stealth")); content((-1.5, 12), $y$)
        
        // Tiệm cận
        line((0, 10), (21, 10), stroke: (dash: "dashed", paint: gray))
        
        // Đồ thị
        let pts-N = ()
        let pts-Nd = ()
        for i in range(0, 210) {
          let t = i / 10.0
          let val-N = 10 / (1 + 99 * calc.exp(-0.5 * t))
          // Cố tình scale N'(t) lớn lên 4 lần để vẽ minh họa cho học sinh dễ nhìn
          let val-Nd = 4 * 0.5 * val-N * (1 - val-N / 10)
          pts-N.push((t, val-N))
          pts-Nd.push((t, val-Nd))
        }
        line(..pts-N, stroke: 1.2pt + rgb("1e88e5"))
        line(..pts-Nd, stroke: 1.2pt + rgb("d32f2f"), dash: "dashed")
        
        // Điểm uốn (Thời điểm bùng phát mạnh nhất)
        let t-inf = 2 * calc.ln(99)
        line((t-inf, 0), (t-inf, 5), stroke: (dash: "dotted", paint: gray, thickness: 1pt))
        circle((t-inf, 5), radius: 2pt, fill: rgb("d32f2f"))
        content((t-inf, -1.5), $t approx 9,2$)
        
        content((15, 8.5), text(fill: rgb("1e88e5"))[$N(t)$])
        content((13, 3), text(fill: rgb("d32f2f"))[$N'(t)$])
      })
#pagebreak()
#cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Hệ trục tọa độ Oxyz minh họa
    line((0,0), (-1.2, -0.8), mark: (end: ">"), stroke: (paint: gray))
    content((-1.2, -0.8), $x$, anchor: "north-east", fill: gray)
    line((0,0), (4.5, 0), mark: (end: ">"), stroke: (paint: gray))
    content((4.5, 0), $y$, anchor: "west", fill: gray)
    line((0,0), (0, 3.5), mark: (end: ">"), stroke: (paint: gray))
    content((0, 3.5), $z$, anchor: "south", fill: gray)
    
    let O = (0,0)
    let K = (2, 0.5)
    let A = (3.5, 3.2)
    let M = (1.2, 2.5)
    
    // Quỹ đạo K
    line(O, K, stroke: (paint: rgb("d32f2f"), thickness: 1.2pt), mark: (end: ">"))
    content(K, $K$, anchor: "north-west", padding: 3pt)
    content((1, 0.2), $vect(v)_K$, fill: rgb("d32f2f"))
    
    // Quỹ đạo M
    line(A, M, stroke: (paint: rgb("0288d1"), thickness: 1.2pt), mark: (end: ">"))
    content(A, $A$, anchor: "south-west", padding: 3pt)
    content(M, $M$, anchor: "south-east", padding: 3pt)
    content((2.5, 3.0), $vect(v)_M$, fill: rgb("0288d1"))
    line(M, (0, 2.13), stroke: (dash: "dashed", paint: rgb("0288d1")))
    
    // Tia laser K -> M
    line(K, M, stroke: (paint: rgb("f57c00"), thickness: 1.5pt))
    content((1.8, 1.5), [Tia laser], angle: -65deg, fill: rgb("f57c00"), size: 8pt)
    
    // Góc vuông
    line((1.4, 2.56), (1.46, 2.36), (1.26, 2.3), stroke: 0.8pt)
  })
#pagebreak()
#cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // --- HÌNH 1: MẶT CẮT 2D ---
    group(name: "2d", {
      let O_2d = (0, 0)
      let M_2d = (4, 0)
      let O1_2d = (0, 3.464)
      let M1_2d = (2, 3.464)
      let N_2d = (3, 1.732)
      
      // Vẽ đa giác thiết diện
      line(O_2d, M_2d, M1_2d, O1_2d, close: true, stroke: 1pt + rgb("1565c0"), fill: rgb("e3f2fd"))
      
      // Hệ trục tọa độ O y z
      line((-0.5, 0), (5, 0), mark: (end: ">"), stroke: 0.6pt + luma(100))
      content((4.8, -0.3), $y$, fill: luma(100))
      line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.6pt + luma(100))
      content((-0.3, 4.3), $z$, fill: luma(100))
      
      // Tia nhìn O N
      line(O_2d, N_2d, stroke: (paint: rgb("e65100"), thickness: 1.2pt), mark: (end: ">"))
      
      // Các điểm và nhãn
      circle(O_2d, radius: 1.5pt, fill: black)
      circle(M_2d, radius: 1.5pt, fill: black)
      circle(O1_2d, radius: 1.5pt, fill: black)
      circle(M1_2d, radius: 1.5pt, fill: black)
      circle(N_2d, radius: 1.5pt, fill: rgb("c62828"))
      
      content((-0.3, -0.3), $O$)
      content((4.2, -0.3), $M$)
      content((-0.4, 3.464), $O'$)
      content((2.2, 3.7), $M'$)
      content((3.3, 1.7), $N$)
      
      // Góc
      arc(O_2d, start: 0deg, stop: 30deg, radius: 1.2, stroke: 0.6pt)
      content((1.6, 0.4), $30^circ$, fill: luma(100), size: 8pt)
      arc(M_2d, start: 120deg, stop: 180deg, radius: 0.6, stroke: 0.6pt)
      content((3.2, 0.3), $60^circ$, fill: luma(100), size: 8pt)
      
      content((2, -1.2), text(weight: "bold")[Mặt cắt $2 D$])
    })

    // --- HÌNH 2: KHỐI CHÓP CỤT 3D ---
    group(name: "3d", {
      set-origin((8.5, 0.5))
      
      let A = (-2, -1)
      let B = (2, -1)
      let C = (3, 1)
      let D = (-1, 1)
      
      let O = (0.5, 0)
      let h = 3.464
      let O1 = (0.5, h)
      
      let A1 = (-0.75, h - 0.5)
      let B1 = (1.25, h - 0.5)
      let C1 = (1.75, h + 0.5)
      let D1 = (-0.25, h + 0.5)

      // Cạnh khuất đáy
      line(A, D, stroke: (dash: "dashed", paint: luma(80), thickness: 0.8pt))
      line(C, D, stroke: (dash: "dashed", paint: luma(80), thickness: 0.8pt))
      
      // Cạnh thấy đáy
      line(A, B, C, stroke: 0.8pt)
      
      // Cạnh đáy nhỏ
      line(A1, B1, C1, D1, close: true, stroke: 0.8pt + rgb("1565c0"), fill: rgb("e3f2fd"))
      
      // Cạnh bên
      line(A, A1, stroke: (dash: "dashed", paint: luma(80), thickness: 0.8pt))
      line(D, D1, stroke: (dash: "dashed", paint: luma(80), thickness: 0.8pt))
      line(B, B1, stroke: 0.8pt)
      line(C, C1, stroke: 0.8pt)
      
      // Điểm M, M'
      let M = (2.5, 0)
      let M1 = (1.5, h)
      line(M, M1, stroke: 1.2pt + rgb("1565c0"))
      
      // Các đường tâm và đáy
      line(A, C, stroke: (dash: "dashed", paint: luma(120), thickness: 0.5pt))
      line(B, D, stroke: (dash: "dashed", paint: luma(120), thickness: 0.5pt))
      line(O, O1, stroke: (dash: "dashed", paint: rgb("c2185b"), thickness: 0.8pt))
      line(O, M, stroke: (dash: "dashed", paint: luma(120), thickness: 0.8pt))
      
      // Điểm N và tia nhìn
      let N = (2, h/2)
      line(O, N, stroke: (paint: rgb("e65100"), thickness: 1.2pt), mark: (end: ">"))
      
      // Vẽ điểm
      circle(O, radius: 1.5pt, fill: black)
      circle(M, radius: 1.5pt, fill: black)
      circle(M1, radius: 1.5pt, fill: black)
      circle(N, radius: 1.5pt, fill: rgb("c62828"))
      
      // Gắn nhãn
      content(O, $O$, anchor: "north", padding: 4pt)
      content(M, $M$, anchor: "west", padding: 3pt)
      content(M1, $M'$, anchor: "west", padding: 3pt)
      content(N, $N$, anchor: "south-east", padding: 3pt)
      
      content(A, $A$, anchor: "north-east", padding: 3pt)
      content(B, $B$, anchor: "north-west", padding: 3pt)
      content(C, $C$, anchor: "south-west", padding: 3pt)
      content(A1, $A'$, anchor: "south", padding: 3pt)
      content(B1, $B'$, anchor: "north-west", padding: 3pt)
      content(C1, $C'$, anchor: "south", padding: 3pt)
      
      content((1.2, h/4), [Tia nhìn], angle: 45deg, fill: rgb("e65100"), size: 8pt)
      content((0.5, -1.7), text(weight: "bold")[Mô hình $3 D$])
    })
  })
#pagebreak()
#cetz.canvas(length: 0.7cm, {
    import cetz.draw: *
    
    // Tính toán biên dạng Elip (y từ 1 đến 2)
    let ell_r = ()
    for i in range(31) {
      let y = 1.0 + i * 1.0 / 30.0
      let val = 1.0 - (y - 2.0)*(y - 2.0)
      let x = 2.0 * calc.sqrt(calc.max(0.0, val))
      ell_r.push((x, y))
    }
    
    // Tính toán biên dạng Parabol (y từ 2 đến 5)
    let para_r = ()
    for i in range(31) {
      let y = 2.0 + i * 3.0 / 30.0
      let x = -2.0 / 9.0 * (y - 2.0) * (y - 2.0) + 2.0
      para_r.push((x, y))
    }

    // --- HÌNH 1: MẶT CẮT 2D ---
    group(name: "2d", {
      // Đổ màu vùng phẳng
      let region = ((0, 1),) + ell_r + para_r + ((0, 5),)
      line(..region, close: true, fill: rgb("e3f2fd"), stroke: none)
      
      // Hệ trục tọa độ O x y
      line((-1, 0), (4, 0), mark: (end: ">"), stroke: 0.8pt + luma(80))
      content((3.8, -0.4), $x$, fill: luma(80), size: 10pt)
      line((0, -0.5), (0, 6.5), mark: (end: ">"), stroke: 0.8pt + luma(80))
      content((-0.4, 6.3), $y$, fill: luma(80), size: 10pt)
      content((-0.4, -0.4), $O$, fill: luma(80), size: 10pt)

      // Vẽ đường biên
      line(..ell_r, stroke: 1.5pt + rgb("0d47a1"))
      line(..para_r, stroke: 1.5pt + rgb("0d47a1"))

      // Điểm đặc biệt
      circle((2, 2), radius: 1.5pt, fill: rgb("b71c1c"))
      content((2.5, 2.1), text(fill: rgb("b71c1c"), size: 10pt)[$N$])
      circle((0, 5), radius: 1.5pt, fill: rgb("b71c1c"))
      content((-0.5, 5.2), text(fill: rgb("b71c1c"), size: 10pt)[$P$])
      
      content((1.5, -1.2), text(weight: "bold")[Mặt cắt phẳng $2 D$])
    })

    // --- HÌNH 2: KHỐI TRÒN XOAY 3D ---
    group(name: "3d", {
      set-origin((8, 0)) // Dịch sang phải 8 đơn vị
      
      let ell_l = ell_r.map(p => (-p.at(0), p.at(1)))
      let para_l = para_r.map(p => (-p.at(0), p.at(1)))
      
      // Đổ màu khối xoay
      let solid_pts = ell_r + para_r + para_l.rev() + ell_l.rev()
      line(..solid_pts, close: true, fill: rgb("e3f2fd"), stroke: none)

      // Các lát cắt (ellipses ngang) tạo hiệu ứng 3D
      arc((2, 2), start: 0deg, stop: -180deg, radius: (2, 0.4), stroke: 0.8pt + rgb("1565c0"))
      arc((-2, 2), start: 180deg, stop: 360deg, radius: (2, 0.4), stroke: (dash: "dashed", paint: rgb("1565c0"), thickness: 0.8pt))

      let r_15 = 2.0 * calc.sqrt(0.75)
      arc((r_15, 1.5), start: 0deg, stop: -180deg, radius: (r_15, 0.35), stroke: 0.6pt + rgb("42a5f5"))
      arc((-r_15, 1.5), start: 180deg, stop: 360deg, radius: (r_15, 0.35), stroke: (dash: "dashed", paint: rgb("42a5f5"), thickness: 0.6pt))

      arc((1.5, 3.5), start: 0deg, stop: -180deg, radius: (1.5, 0.3), stroke: 0.6pt + rgb("42a5f5"))
      arc((-1.5, 3.5), start: 180deg, stop: 360deg, radius: (1.5, 0.3), stroke: (dash: "dashed", paint: rgb("42a5f5"), thickness: 0.6pt))

      // Biên dạng 2 bên
      line(..ell_r, stroke: 1.5pt + rgb("0d47a1"))
      line(..ell_l, stroke: 1.5pt + rgb("0d47a1"))
      line(..para_r, stroke: 1.5pt + rgb("0d47a1"))
      line(..para_l, stroke: 1.5pt + rgb("0d47a1"))

      // Trục quay
      line((0, 0), (0, 6.5), stroke: (dash: "dash-dotted", paint: luma(100)))
      arc((0, 6.0), start: -150deg, stop: 30deg, radius: (0.5, 0.2), mark: (end: ">"), stroke: 1pt + rgb("d32f2f"))
      
      content((0, -1.2), text(weight: "bold")[Khối tròn xoay $3 D$])
    })
  })
#pagebreak()
#bbt-opt(
        var: $x$,
        der: $P'(x)$,
        func: $P(x)$,
        x-vals: ($2$, $3,7$, $7$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($150$, $207,8$, $-10$),
        is-min: false
      )