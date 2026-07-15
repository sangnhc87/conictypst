import lib from '../../../typst-pkg-sang-math/lib.typ?raw'
import bbt from '../../../typst-pkg-sang-math/bbt.typ?raw'
import sangExam from '../../../typst-pkg-sang-math/sang-exam.typ?raw'
import examTemplates from '../../../typst-pkg-sang-math/exam-templates.typ?raw'
import bookTemplates from '../../../typst-pkg-sang-math/book-templates.typ?raw'
import mathSym from '../../../typst-pkg-sang-math/math-sym.typ?raw'
import geometry from '../../../typst-pkg-sang-math/geometry.typ?raw'
import colors from '../../../typst-pkg-sang-math/core/colors.typ?raw'
import mathUtils from '../../../typst-pkg-sang-math/core/math-utils.typ?raw'
import conics from '../../../typst-pkg-sang-math/geometry-2d/conics.typ?raw'
import revolution from '../../../typst-pkg-sang-math/geometry-3d/revolution.typ?raw'
import curves3d from '../../../typst-pkg-sang-math/geometry-3d/curves-3d.typ?raw'
import sangBeamer from '../../../typst-pkg-submit/sang-beamer.typ?raw'
import sangBeamerThemes from '../../../typst-pkg-submit/sang-beamer-themes.typ?raw'

export const SANG_MATH_VERSION = '1.0.0-local'

export const SANG_MATH_FILES = {
  '/packages/sang-math/lib.typ': lib,
  '/packages/sang-math/bbt.typ': bbt,
  '/packages/sang-math/sang-exam.typ': sangExam,
  '/packages/sang-math/exam-templates.typ': examTemplates,
  '/packages/sang-math/book-templates.typ': bookTemplates,
  '/packages/sang-math/math-sym.typ': mathSym,
  '/packages/sang-math/geometry.typ': geometry,
  '/packages/sang-math/core/colors.typ': colors,
  '/packages/sang-math/core/math-utils.typ': mathUtils,
  '/packages/sang-math/geometry-2d/conics.typ': conics,
  '/packages/sang-math/geometry-3d/revolution.typ': revolution,
  '/packages/sang-math/geometry-3d/curves-3d.typ': curves3d,
  '/packages/sang-math/sang-beamer.typ': sangBeamer,
  '/packages/sang-math/sang-beamer-themes.typ': sangBeamerThemes,
}
