#let prj(x, y, z) = {
  let alpha = -30 * 0.0174532925
  let beta = 20 * 0.0174532925
  let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
  let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
  let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
  (xp, ypp)
}

#let R = 3
#let pts = ()
#for deg in range(0, 361, step: 30) {
  let rad = deg * 0.0174532925
  let pt = prj(R * calc.cos(rad), R * calc.sin(rad), 0)
  pts.push((deg, pt))
}

#for pt in pts [
  deg: #pt.at(0) -> x: #pt.at(1).at(0), y: #pt.at(1).at(1) \
]
