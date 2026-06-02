// Cấu hình chung — màu sắc và import cho toàn bộ cuốn Tích phân Ứng dụng

// ─── Alias trước khi import * để giữ tham chiếu gốc ────────────
#import "../../modules/book.typ": bt as _bt-orig, section as _section-orig, vd as _vd-orig

// ─── Import toàn bộ ─────────────────────────────────────────────
#import "../../modules/book.typ": *
#import "../../modules/exam.typ": True, ds, mcq, ppgiai, resetcau, resetexamstate, short, tf, tln, tn
// BBT + vẽ hình CeTZ — re-export để chapter chỉ cần 1 dòng import
#import "../../bbt.typ": bbt-opt, canvas, draw
#import "../../math-sym.typ": *

// ─── Màu chủ đề ─────────────────────────────────────────────────
#let c-book = rgb("#064e3b")   // emerald đậm — màu chủ đạo toàn quyển
#let c-p0 = rgb("#4f46e5")   // Phần 1 – chàm (Lý thuyết cơ bản)
#let c-p1 = rgb("#047857")   // Phần 2 – xanh lá tươi (Tích lũy & Sinh học)
#let c-p2 = rgb("#1d4ed8")   // Phần 3 – xanh thép (Động học & Vật lý)
#let c-p3 = rgb("#b45309")   // Phần 4 – hổ phách (Hình học phẳng & Diện tích)
#let c-p4 = rgb("#7c3aed")   // Phần 5 – tím (Thể tích thiết diện)
#let c-p5 = rgb("#dc2626")   // Phần 6 – đỏ (Khối tròn xoay)

// ─── Hộp nội dung rực rỡ (helper nội bộ) ───────────────────────
#let _vivid-box(body, title: [], accent: rgb("#064e3b"), fill: white) = block(
  width: 100%,
  radius: 8pt,
  clip: true,
  stroke: 0.5pt + accent.lighten(40%),
)[
  #block(width: 100%, fill: accent, inset: (x: 14pt, y: 8pt))[
    #text(fill: white, weight: "bold", size: 11pt)[#title]
  ]
  #block(width: 100%, fill: fill, inset: (x: 14pt, y: 10pt))[
    #body
  ]
]

// ─── Override hộp lý thuyết ─────────────────────────────────────
#let phuongphap(body, title: [⚙ Phương pháp], theme-color: none, ..args) = {
  let col = if theme-color != none { theme-color } else { rgb("#047857") }
  _vivid-box(body, title: title, accent: col, fill: col.lighten(93%))
}

#let ghinho(body, title: [★ Ghi nhớ], theme-color: none, ..args) = {
  let col = if theme-color != none { theme-color } else { rgb("#047857") }
  _vivid-box(body, title: title, accent: col, fill: col.lighten(93%))
}

#let luuy(body, title: [▲ Lưu ý], theme-color: none, ..args) = {
  _vivid-box(body, title: title, accent: rgb("#b45309"), fill: rgb("#fffbeb"))
}

#let nhanxet(body, title: [◈ Nhận xét], theme-color: none, ..args) = {
  let col = if theme-color != none { theme-color.lighten(15%) } else { rgb("#7c3aed") }
  _vivid-box(body, title: title, accent: col, fill: col.lighten(91%))
}

// ─── Override Ví dụ / Bài tập — header đậm màu ──────────────────
#let vd(stem, theme-color: rgb("#047857"), header-fill: auto, title-fill: auto, ..args) = {
  let hf = if header-fill == auto { theme-color } else { header-fill }
  let tf = if title-fill == auto { white } else { title-fill }
  _vd-orig(stem, theme-color: theme-color, header-fill: hf, title-fill: tf, ..args)
}

#let bt(stem, theme-color: rgb("#1d4ed8"), header-fill: auto, title-fill: auto, ..args) = {
  let hf = if header-fill == auto { theme-color } else { header-fill }
  let tf = if title-fill == auto { white } else { title-fill }
  _bt-orig(stem, theme-color: theme-color, header-fill: hf, title-fill: tf, ..args)
}

// ─── Đầu phần BÀI TẬP TỔNG HỢP ─────────────────────────────────
#let bt-header(color) = {
  v(1.2em)
  block(
    width: 100%,
    fill: color,
    inset: (x: 16pt, y: 11pt),
    radius: 7pt,
  )[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      stack(
        dir: ltr,
        spacing: 8pt,
        text(fill: white.transparentize(15%), size: 18pt)[◆],
        text(fill: white, weight: "bold", size: 13pt, tracking: 0.02em)[BÀI TẬP TỔNG HỢP],
      ),
      text(fill: white.transparentize(35%), size: 10pt, tracking: 0.04em)[TN · DS · TLN],
    )
  ]
  v(0.5em)
}

// ─── Nhãn kiểu câu (TN / DS / TLN) ─────────────────────────────
#let q-label(title, color) = {
  v(0.75em)
  block(width: 100%, fill: color, inset: (x: 14pt, y: 9pt), radius: 5pt)[
    #text(fill: white, weight: "bold", size: 11.5pt)[#title]
  ]
  v(0.35em)
}

// ─── Override dang — dùng level-4 trong mục lục (lùi sau Bài) ───
#let dang(title, prefix: "Dạng", theme-color: c-book, ..args) = {
  _section-orig(title, prefix: prefix, theme-color: theme-color, ..args)
}
