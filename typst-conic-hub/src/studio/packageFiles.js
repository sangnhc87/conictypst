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
import packageManifest from '../../../typst-pkg-sang-math/typst.toml?raw'
import sangBeamer from '../../../typst-pkg-submit/sang-beamer.typ?raw'
import sangBeamerThemes from '../../../typst-pkg-submit/sang-beamer-themes.typ?raw'
import { SANG_MATH_PACKAGE, SANG_MATH_VERSION } from './packagePolicy.js'

export { SANG_MATH_VERSION }

// Beamer chưa nằm trong archive sang-math trên Universe. Studio giữ nó
// như một extension riêng và cho extension import API public chính thức.
const studioSangBeamer = sangBeamer.replace(
  '#import "sang-exam.typ": (',
  `#import "${SANG_MATH_PACKAGE}": (`,
)

export const SANG_MATH_PACKAGE_FILES = {
  'typst.toml': packageManifest,
  'lib.typ': lib,
  'bbt.typ': bbt,
  'sang-exam.typ': sangExam,
  'exam-templates.typ': examTemplates,
  'book-templates.typ': bookTemplates,
  'math-sym.typ': mathSym,
  'geometry.typ': geometry,
  'core/colors.typ': colors,
  'core/math-utils.typ': mathUtils,
  'geometry-2d/conics.typ': conics,
  'geometry-3d/revolution.typ': revolution,
  'geometry-3d/curves-3d.typ': curves3d,
}

export const SANG_MATH_FILES = {
  // Alias cũ chỉ để dự án IndexedDB đã lưu trước đây không bị hỏng. Mẫu mới và
  // catalog không bao giờ sinh các đường dẫn /packages/sang-math/* này nữa.
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
  '/packages/sang-math/sang-beamer.typ': studioSangBeamer,
  '/packages/sang-math/sang-beamer-themes.typ': sangBeamerThemes,
  '/extensions/sang-beamer/sang-beamer.typ': studioSangBeamer,
  '/extensions/sang-beamer/themes.typ': sangBeamerThemes,
}
