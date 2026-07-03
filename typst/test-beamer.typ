// ═══════════════════════════════════════════════════════════
// MAIN-BEAMER.TYP — Trình chiếu CHỮA ĐỀ
// Compile: typst compile --font-path src/assets/fonts --font-path fonts --root . --input beamer=1 typst/Beamer.typ
// Hoặc dùng npm:  npm run compile:Beamer
// Watch mode:     npm run watch:Beamer
// ═══════════════════════════════════════════════════════════

#import "@local/sang-math:1.0.0": *
#import beamer: *

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
#let bm-subtitle = "TOÁN - LỚP 12"
#let bm-author = "GV Nguyễn Văn Sang"
#let bm-institution = "ĐỀ THI THỬ CUỐI CÙNG"
#let bm-code = "9999"

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

// ── Cỡ chữ (Hệ thống tự co giãn theo Base Size) ────────────
#let bm-base-size = 24pt // Chỉ cần chỉnh biến này để phóng to/thu nhỏ toàn bộ
#let bm-text-size = bm-base-size * 1.15  // Text chung
#let bm-q-size = bm-base-size            // Câu hỏi
#let bm-opt-size = bm-base-size * 0.85   // Phương án A, B, C, D
#let bm-sol-size = bm-base-size * 0.75   // Lời giải
#let bm-table-size = bm-base-size * 0.75 // Bảng Đ/S

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
  table_size: bm-table-size,
  auto_step_pause: bm-auto-step,
)

#let mode = "loigiai"
#let _m = exam-mode(mode: mode, accent: accent)
#let (mcq, tf, short) = (_m.mcq, _m.tf, _m.short)

// Import make-questions từ file đề — không cần --input beamer=1
#import "dethi/de-30.typ": make-questions as _de
#_de(tn: _m.tn, ds: _m.ds, tln: _m.tln, tl: _m.tl, exam-part: exam-part)
#pagebreak()
#print-answer-key()
#het
