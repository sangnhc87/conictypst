#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.0"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "dethi"   // dethi | loigiai | solcolor
#let accent = classic.blue

#show math.equation: set text(fill: rgb("#000000"))
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  school: "Sở GD&ĐT ...",
  exam-title: "THI THỬ THPT QUỐC GIA 2026",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
)

// ═══════════════════════════════════════════════════════════
// PHẦN I — Trắc nghiệm (12 câu)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12)

// Câu 1
#tn(
  [Đề bài câu 1.],
  ([$A$], [$B$], [$C$], [$D$]),
  loigiai: [Lời giải câu 1.],
)

// Câu 2 — thêm câu ở đây...

// ═══════════════════════════════════════════════════════════
// PHẦN II — Đúng/Sai (4 câu)
// ═══════════════════════════════════════════════════════════
#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: auto)

// Câu 1
#ds(
  [Đề bài câu đúng/sai 1.],
  (
    True([Phát biểu đúng.]),
    [Phát biểu sai.],
    True([Phát biểu đúng.]),
    [Phát biểu sai.],
  ),
  loigiai: [Lời giải.],
)

// ═══════════════════════════════════════════════════════════
// PHẦN III — Trả lời ngắn (6 câu)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)

// Câu 1
#tln(
  [Đề bài điền số 1.],
  [$42$],
  loigiai: [Lời giải.],
)

#het
#print-answer-key()
