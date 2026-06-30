#import "@preview/cetz:0.5.2"

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // TN 1
    // Wheels
    circle((-2, 0), radius: 1, name: "c1", fill: luma(230), stroke: 2pt + luma(100))
    circle((3, 0), radius: 2.5, name: "c2", fill: luma(230), stroke: 2pt + luma(100))
    
    // Belt wrap
    arc((-2.3, 0.954), start: 107.5deg, stop: 252.5deg, radius: 1, stroke: 2pt + blue)
    arc((2.25, -2.385), start: 252.5deg, stop: 467.5deg, radius: 2.5, stroke: 2pt + blue) // 467.5 = 360 + 107.5

    // Belt lines
    line((-2.3, 0.954), (2.25, 2.385), stroke: 2pt + blue)
    line((-2.3, -0.954), (2.25, -2.385), stroke: 2pt + blue)
    
    // Pulleys details
    circle((-2, 0), radius: 0.2, fill: white, stroke: 1.5pt)
    circle((3, 0), radius: 0.5, fill: white, stroke: 1.5pt)
    circle((3, 0), radius: 2.1, stroke: 1pt + luma(150))
    for i in range(8) {
      let angle = i * 45deg
      line((3 + 0.5 * calc.cos(angle), 0.5 * calc.sin(angle)), 
           (3 + 2.1 * calc.cos(angle), 2.1 * calc.sin(angle)), stroke: 2pt + luma(150))
    }
    
    // Centers
    circle((-2, 0), radius: 0.1, fill: black)
    circle((3, 0), radius: 0.1, fill: black)
    
    // Radii
    line((-2, 0), (-2, -1), stroke: (dash: "dashed", thickness: 1pt))
    line((3, 0), (3, -2.5), stroke: (dash: "dashed", thickness: 1pt))
    content((-2.5, -0.5), [$R_1$])
    content((3.5, -1.25), [$R_2$])
  })
]

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // Tilted coordinate system to make it look 3D
    group(name: "earth", {
      // 3D sphere gradient
      circle((0, 0), radius: 1.5, fill: gradient.radial(white, blue, center: (30%, 30%), radius: 100%), stroke: none)
      
      // Rotate for the axis tilt (23.5 degrees)
      rotate(-23.5deg)
      
      // Equator
      arc((-1.5, 0), start: 180deg, stop: 360deg, radius: (1.5, 0.3), stroke: (dash: "dashed", paint: white))
      arc((1.5, 0), start: 0deg, stop: 180deg, radius: (1.5, 0.3), stroke: 1pt + white)
      
      // Latitude lines
      arc((-1.2, 0.9), start: 180deg, stop: 360deg, radius: (1.2, 0.24), stroke: (dash: "dashed", paint: white))
      arc((1.2, 0.9), start: 0deg, stop: 180deg, radius: (1.2, 0.24), stroke: 0.5pt + white)
      
      arc((-1.2, -0.9), start: 180deg, stop: 360deg, radius: (1.2, 0.24), stroke: (dash: "dashed", paint: white))
      arc((1.2, -0.9), start: 0deg, stop: 180deg, radius: (1.2, 0.24), stroke: 0.5pt + white)

      // Longitude lines
      arc((0, -1.5), start: -90deg, stop: 90deg, radius: (0.5, 1.5), stroke: 0.5pt + white)
      arc((0, -1.5), start: 90deg, stop: 270deg, radius: (0.5, 1.5), stroke: (dash: "dashed", paint: white))
      
      arc((0, -1.5), start: -90deg, stop: 90deg, radius: (1.0, 1.5), stroke: 0.5pt + white)
      arc((0, -1.5), start: 90deg, stop: 270deg, radius: (1.0, 1.5), stroke: (dash: "dashed", paint: white))

      // Axis
      line((0, 1.5), (0, 2.5), stroke: 2pt + red)
      line((0, -2.5), (0, -1.5), stroke: 2pt + red)
      
      // Rotation arrow
      arc((0.7, 2.0), start: 180deg, stop: -20deg, radius: (0.7, 0.2), mark: (end: ">"), stroke: 1.5pt + orange)
    })
    content((0, -2.8), [Trái Đất])
  })
]
