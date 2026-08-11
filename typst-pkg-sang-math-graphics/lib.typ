// ═════════════════════════════════════════════════════════════════════════════
// SANG-MATH-GRAPHICS
// Package vẽ các hình Toán phức tạp trong Typst + CeTZ
// ═════════════════════════════════════════════════════════════════════════════

// Import tất cả các module con và re-export ra ngoài
#import "@preview/cetz:0.5.2" as cetz
#import "src/core/utils.typ": *
#import "src/core/projections.typ": *
#import "src/2d/conics.typ": *
#import "src/3d/pseudo3d.typ": *
#import "src/3d/phanghoa.typ": *
#import "src/3d/geodesic.typ": *
#import "src/2d/shapes.typ": *
#import "src/2d/graphs.typ": *
#import "src/3d/solids.typ": *
#import "src/3d/curves.typ": *
#import "src/3d/polyhedra.typ": *
#import "src/3d/surfaces.typ": *
#import "src/calculus/volumes.typ": *
#import "src/probability/tree.typ": *
#import "src/probability/bayes.typ": *

// Hai tiện ích giúp người dùng không phải lặp lại import CeTZ ở mọi file.
// Các hàm draw-* vẫn được gọi bên trong canvas như API CeTZ thông thường.
#let smg-canvas(length: 1cm, body) = cetz.canvas(length: length, body)
#let smg-draw = cetz.draw

// Re-export tất cả các hàm công khai
#let (
  // CeTZ convenience
  smg-canvas,
  smg-draw,
  // utils
  deg-to-rad,
  rad-to-deg,
  lerp,
  rotate-2d,
  rotate-3d,
  rotate-3d-x,
  rotate-3d-y,
  rotate-3d-z,
  range,
  // projections
  project-isometric,
  project-oblique,
  // 2d conics
  draw-parabola,
  draw-ellipse,
  draw-hyperbola,
  // 3d solids
  draw-cone,
  draw-cylinder,
  draw-sphere,
  // 3d polyhedra
  draw-pyramid,
  draw-truncated-pyramid,
  // 3d curves
  draw-helix,
  draw-conical-helix,
  // 3d surfaces
  draw-saddle,
  draw-paraboloid,
  // calculus volumes
  draw-square-cross-section,
  draw-square-y-cross-section,
  draw-half-elliptical-tunnel,
  // probability
  draw-tree-2x2,
  draw-tree-3x2,
  draw-bayes-tree,
  draw-box-transfer-diagram,
  draw-bayes-contribution-bar,
  // 2d shapes
  tri-xyz,
  tri-abc,
  tri-right,
  rect-xyz,
  rect-abc,
  square,
  circle-desc,
  circle-circumcircle,
  circle-incircle,
  angle-mark,
  arc-by-points,
  dashed-seg,
  
  // 2d graphs
  plot-cubic,
  plot-parabola,
  plot-rational,

  // 3d pseudo shapes
  axis-xyz,
  chop-sabc,
  chop-sabcd,
  chop-sabc-deu,
  chop-sabcd-deu,
  lang-tru-abc,
  pseudo-cone,
  pseudo-cylinder,

  // Phang hoa
  phanghoa-non,
  phanghoa-tru,
  phanghoa-sabc,

  // Geodesic (3D paths)
  cone-geodesic-3d,
  cone-unfold-2d,
  cylinder-geodesic-3d,
  cylinder-unfold-2d,
  truncated-cone-geodesic-3d,
  truncated-cone-unfold-2d,
) = (
  smg-canvas,
  smg-draw,
  deg-to-rad,
  rad-to-deg,
  lerp,
  rotate-2d,
  rotate-3d,
  rotate-3d-x,
  rotate-3d-y,
  rotate-3d-z,
  range,
  project-isometric,
  project-oblique,
  draw-parabola,
  draw-ellipse,
  draw-hyperbola,
  draw-cone,
  draw-cylinder,
  draw-sphere,
  draw-pyramid,
  draw-truncated-pyramid,
  draw-helix,
  draw-conical-helix,
  draw-saddle,
  draw-paraboloid,
  draw-square-cross-section,
  draw-square-y-cross-section,
  draw-half-elliptical-tunnel,
  draw-tree-2x2,
  draw-tree-3x2,
  draw-bayes-tree,
  draw-box-transfer-diagram,
  draw-bayes-contribution-bar,
  tri-xyz,
  tri-abc,
  tri-right,
  rect-xyz,
  rect-abc,
  square,
  circle-desc,
  circle-circumcircle,
  circle-incircle,
  angle-mark,
  arc-by-points,
  dashed-seg,
  plot-cubic,
  plot-parabola,
  plot-rational,
  axis-xyz,
  chop-sabc,
  chop-sabcd,
  chop-sabc-deu,
  chop-sabcd-deu,
  lang-tru-abc,
  pseudo-cone,
  pseudo-cylinder,
  phanghoa-non,
  phanghoa-tru,
  phanghoa-sabc,
  cone-geodesic-3d,
  cone-unfold-2d,
  cylinder-geodesic-3d,
  cylinder-unfold-2d,
  truncated-cone-geodesic-3d,
  truncated-cone-unfold-2d,
)
