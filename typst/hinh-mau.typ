  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Hình cầu nền
    circle((0,0), radius: 2, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    
    // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt) để tạo không gian 3D
    circle((0,0), radius: (0.7, 2), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle((0,0), radius: (1.4, 2), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle((0, 1), radius: (1.732, 0.35), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle((0, -1), radius: (1.732, 0.35), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    
    // Đường xích đạo màu đỏ: Nét đứt nửa sau, nét liền nửa trước
    arc((2,0), start: 0deg, stop: 180deg, radius: (2, 0.4), stroke: (dash: "dashed", paint: red, thickness: 1pt))
    arc((-2,0), start: 180deg, stop: 360deg, radius: (2, 0.4), stroke: (paint: red, thickness: 1pt))
    
    // Tâm O
    circle((0,0), radius: 1.5pt, fill: black)
    content((0,0), $O$, anchor: "east", padding: 5pt)
    
    // Điểm M nằm trên xích đạo
    let M = (0.8, -0.36) 
    circle(M, radius: 1.5pt, fill: black)
    content(M, $M$, anchor: "north", padding: 5pt)
    
    // Điểm A và vector u
    let A = (1.2, 1.4)
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-east", padding: 4pt)
    
    let u_end = (1.9, 1.4)
    let B = (2.6, 1.4)
    
    line(A, u_end, mark: (end: ">"), stroke: 1pt)
    content((1.65, 1.6), $vect(u)$)
    line(u_end, B, stroke: (dash: "dashed"))
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "west", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 35%,