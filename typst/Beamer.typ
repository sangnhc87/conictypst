// ═══════════════════════════════════════════════════════════
// MAIN-BEAMER.TYP — Trình chiếu CHỮA ĐỀ
// Compile: typst compile --font-path src/assets/fonts --font-path fonts --root . --input beamer=1 typst/Beamer.typ
// Hoặc dùng npm:  npm run compile:Beamer
// Watch mode:     npm run watch:Beamer
// ═══════════════════════════════════════════════════════════

#import "sang-beamer.typ": *
#import "@preview/cetz:0.5.2"

// ╔══════════════════════════════════════════════════════════╗
// ║              TUỲ CHỌN GIAO DIỆN BEAMER                  ║
// ╠══════════════════════════════════════════════════════════╣
// ║  Chỉ cần chỉnh các dòng bên dưới — còn lại tự động      ║
// ╚══════════════════════════════════════════════════════════╝

// ── Màu chủ đạo ──────────────────────────────────────────
#let accent = classic.blue
// Các lựa chọn: classic.blue | classic.emerald | classic.crimson | rgb("#...")

// ── Thông tin bài giảng ───────────────────────────────────
#let bm-title = "CHỮA ĐỀ THI THỬ THPT QG 2026"
#let bm-subtitle = "TOÁN - LỚP 12C9"
#let bm-author = "GV Nguyễn Văn Sang"
#let bm-institution = "ĐỀ THI THỬ"
#let bm-code = "101"

// ── Màu nền slide ────────────────────────────────────────
// Chữ, card, lời giải sẽ tự động thích nghi (tối/sáng)
//   Tối đêm:   rgb("#0f172a") ← mặc định
//   Xanh navy: rgb("#0a1628")  |  Tối tím:  rgb("#1a0a2e")
//   Trắng:     rgb("#ffffff")  |  Xám nhạt: rgb("#f1f5f9")
#let bm-bg-color = rgb("#f1f5f9")

// ── Màu công thức toán ───────────────────────────────────
//   Vàng:  rgb("#f59e0b") ← mặc định đẹp trên nền tối
//   Cam:   rgb("#fb923c")  |  Xanh lá: rgb("#4ade80")
//   Trắng: rgb("#ffffff")  |  Đen:     rgb("#000000")
#let bm-math-color = rgb("#f108ca")

// ── Cỡ chữ ───────────────────────────────────────────────
#let bm-text-size = 28pt
#let bm-q-size = 24pt
#let bm-opt-size = 20pt
#let bm-sol-size = 18pt

// ── Số câu (navigation dots ở footer) ────────────────────
#let bm-total-q = 22

// ── Step-by-step reveal ───────────────────────────────────
#let bm-auto-step = false  // true = mỗi #step tự pause

// ═══════════════════════════════════════════════════════════

#show: sang-beamer-theme.with(
  title: bm-title,
  subtitle: bm-subtitle,
  author: bm-author,
  institution: bm-institution,
  accent: accent,
  code: bm-code,
  total-q: bm-total-q,
  bg_color: bm-bg-color,
  text_size: bm-text-size,
  math_color: bm-math-color,
  question_size: bm-q-size,
  option_size: bm-opt-size,
  solution_size: bm-sol-size,
  auto_step_pause: bm-auto-step,
)

#let mode = "loigiai"
#let _m = exam-mode(mode: mode, accent: accent)
#let (mcq, tf, short) = (_m.mcq, _m.tf, _m.short)

// Import make-questions từ file đề — không cần --input beamer=1
#import "De-Cac-So/2026-Tự-Chế-Lần-2.typ": make-questions as _de
#_de(tn: _m.tn, ds: _m.ds, tln: _m.tln, tl: _m.tl, exam-part: exam-part)
#pagebreak()
#print-answer-key()
#het
