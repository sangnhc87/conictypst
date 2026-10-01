// ================================================================
// SANG-MATH 1.1.0 — giữ cách gõ 1.0.6, bổ sung QR và phiếu OMR.
// Entry point after publication: #import "@preview/sang-math:1.1.0": *
// During development: #import "@local/sang-math:1.1.0": *
// ================================================================

// ── Stable public API ────────────────────────────────────────────
#import "bbt.typ": *            // BBT, Bảng biến thiên, Bảng xét dấu
#import "sang-exam.typ": *      // Trắc nghiệm, Tự luận, q-wrap...
#import "exam-templates.typ": * // Preset giao diện đề thi đẹp
#import "book-templates.typ": * // Preset giao diện sách, SGK, chuyên đề
#import "decuong-book.typ": *   // Hệ thống sách Đề cương, Chuyên đề, Bộ đề & Logic ma trận
#import "print-layouts.typ": *  // Layout đề 70/30 có vùng nháp đổi bên chẵn/lẻ
#import "math-sym.typ": *       // Ký hiệu toán tắt (vô cùng, tập hợp...)
#import "geometry.typ": *       // Hình học phẳng/không gian CeTZ (legacy v1)
#import "omr-qr.typ": sang-omr-qr, sang-omr-profile

// ── Core utilities ───────────────────────────────────────────────
#import "core/math-utils.typ": *  // linspace, lerp, rotate-2d, vec-*
#import "core/colors.typ": *      // sm-blue, sm-red, sm-green... (palette chuẩn)

// ── Geometry 2D ──────────────────────────────────────────────────
#import "geometry-2d/conics.typ": *  // draw-parabola, draw-ellipse, draw-hyperbola

// ── Geometry 3D (Thuật toán tự động & Khử nét khuất kiểu Luadraw) ──
#import "geometry-3d/lib.typ": *

// Public namespaces from the published 1.0.6 package.
#import "sang-book.typ" as book
#import "sang-beamer.typ" as beamer
