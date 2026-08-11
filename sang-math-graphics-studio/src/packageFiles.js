import manifest from '../../typst-pkg-sang-math-graphics/typst.toml?raw'
import lib from '../../typst-pkg-sang-math-graphics/lib.typ?raw'
import conics from '../../typst-pkg-sang-math-graphics/src/2d/conics.typ?raw'
import graphs from '../../typst-pkg-sang-math-graphics/src/2d/graphs.typ?raw'
import shapes from '../../typst-pkg-sang-math-graphics/src/2d/shapes.typ?raw'
import curves from '../../typst-pkg-sang-math-graphics/src/3d/curves.typ?raw'
import geodesic from '../../typst-pkg-sang-math-graphics/src/3d/geodesic.typ?raw'
import phanghoa from '../../typst-pkg-sang-math-graphics/src/3d/phanghoa.typ?raw'
import polyhedra from '../../typst-pkg-sang-math-graphics/src/3d/polyhedra.typ?raw'
import pseudo3d from '../../typst-pkg-sang-math-graphics/src/3d/pseudo3d.typ?raw'
import solids from '../../typst-pkg-sang-math-graphics/src/3d/solids.typ?raw'
import surfaces from '../../typst-pkg-sang-math-graphics/src/3d/surfaces.typ?raw'
import volumes from '../../typst-pkg-sang-math-graphics/src/calculus/volumes.typ?raw'
import bayes from '../../typst-pkg-sang-math-graphics/src/probability/bayes.typ?raw'
import tree from '../../typst-pkg-sang-math-graphics/src/probability/tree.typ?raw'
import projections from '../../typst-pkg-sang-math-graphics/src/core/projections.typ?raw'
import utils from '../../typst-pkg-sang-math-graphics/src/core/utils.typ?raw'

export const SANG_MATH_GRAPHICS_VERSION = '0.1.0'
export const SANG_MATH_GRAPHICS_FILES = {
  'typst.toml': manifest,
  'lib.typ': lib,
  'src/2d/conics.typ': conics,
  'src/2d/graphs.typ': graphs,
  'src/2d/shapes.typ': shapes,
  'src/3d/curves.typ': curves,
  'src/3d/geodesic.typ': geodesic,
  'src/3d/phanghoa.typ': phanghoa,
  'src/3d/polyhedra.typ': polyhedra,
  'src/3d/pseudo3d.typ': pseudo3d,
  'src/3d/solids.typ': solids,
  'src/3d/surfaces.typ': surfaces,
  'src/calculus/volumes.typ': volumes,
  'src/probability/bayes.typ': bayes,
  'src/probability/tree.typ': tree,
  'src/core/projections.typ': projections,
  'src/core/utils.typ': utils,
}
