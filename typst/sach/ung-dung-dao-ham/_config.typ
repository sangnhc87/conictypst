// Cấu hình chung — màu sắc và import cho toàn bộ chương

// ─── Alias trước khi import * để giữ tham chiếu gốc ────────────
#import "../../modules/book.typ": bt as _bt-orig, section as _section-orig, vd as _vd-orig

// ─── Import toàn bộ ─────────────────────────────────────────────
#import "../../modules/book.typ": *
#import "../../modules/exam.typ": True, ppgiai, resetcau, resetexamstate, exam-mode

// ─── CHÍNH THỨC: HỆ THỐNG TUỲ CHỌN MODE ĐỀ THI & MÀU LỜI GIẢI ─────
// Người dùng dễ dàng thay đổi trạng thái đề bài / lời giải
#let EXAM_MODE = "loigiai"           // "dethi" (ẩn đáp án) hoặc "loigiai" (hiện chi tiết)
#let EXAM_SOL_COLOR = rgb("#0c4a6e") // Màu mặc định của lời giải (có thể đồng bộ với c-book)

// Kích hoạt nạp bộ macro exam-mode mới
#let _exam_fns = exam-mode(mode: EXAM_MODE, accent: EXAM_SOL_COLOR)
#let tn = _exam_fns.tn
#let ds = _exam_fns.ds
#let tln = _exam_fns.tln
#let tl = _exam_fns.tl
#let mcq = _exam_fns.mcq
#let tf = _exam_fns.tf
#let short = _exam_fns.short

// BBT + vẽ hình CeTZ — re-export để chapter chỉ cần 1 dòng import
#import "../../bbt.typ": bbt-opt, canvas, draw
// Hệ phương trình ngoặc vuông (dùng trong lời giải)
#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))

// ─── Màu chủ đề ─────────────────────────────────────────────────
#let c-book = rgb("#0c4a6e")   // màu chủ đạo toàn quyển
#let c-p1 = rgb("#0369a1")   // Phần 1 – xanh dương
#let c-p2 = rgb("#065f46")   // Phần 2 – lá cây
#let c-p3 = rgb("#92400e")   // Phần 3 – hổ phách
#let c-p4 = rgb("#4c1d95")   // Phần 4 – tím trầm
#let c-p5 = rgb("#991b1b")   // Phần 5 – đỏ thực chiến

// ─── Hộp nội dung rực rỡ (helper nội bộ) ───────────────────────
#let _vivid-box(body, title: [], accent: rgb("#0c4a6e"), fill: white) = block(
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
  let col = if theme-color != none { theme-color } else { rgb("#0369a1") }
  _vivid-box(body, title: title, accent: col, fill: col.lighten(93%))
}

#let luuy(body, title: [▲ Lưu ý], theme-color: none, ..args) = {
  _vivid-box(body, title: title, accent: rgb("#b45309"), fill: rgb("#fffbeb"))
}

#let nhanxet(body, title: [◈ Nhận xét], theme-color: none, ..args) = {
  let col = if theme-color != none { theme-color.lighten(15%) } else { rgb("#7c3aed") }
  _vivid-box(body, title: title, accent: col, fill: col.lighten(91%))
}

// ─── Bước giải (step) — mỗi bước một màu xoay vòng ────────────
#let _step-cnt = counter("_ung-dung-dao-ham-step")
#let _step-palette = (
  rgb("#0369a1"), // bước 1 – xanh
  rgb("#065f46"), // bước 2 – lá
  rgb("#92400e"), // bước 3 – hổ phách
  rgb("#4c1d95"), // bước 4 – tím
  rgb("#991b1b"), // bước 5 – đỏ
)
#let resetstep() = _step-cnt.update(0)
#let reset-step() = _step-cnt.update(0)
#let step(body, accent: auto) = {
  _step-cnt.step()
  context {
    let n = _step-cnt.get().first()
    let col = if accent != auto { accent } else {
      _step-palette.at(calc.rem(n - 1, _step-palette.len()))
    }
    block(
      width: 100%,
      inset: (left: 12pt, top: 4pt, bottom: 4pt, right: 0pt),
      stroke: (left: 3pt + col),
    )[#body]
  }
}

// ─── Override Ví dụ / Bài tập — header đậm màu ──────────────────
#let vd(stem, theme-color: rgb("#0369a1"), header-fill: auto, title-fill: auto, ..args) = {
  let hf = if header-fill == auto { theme-color } else { header-fill }
  let tf = if title-fill == auto { white } else { title-fill }
  _vd-orig(stem, theme-color: theme-color, header-fill: hf, title-fill: tf, ..args)
}

#let bt(stem, theme-color: rgb("#065f46"), header-fill: auto, title-fill: auto, ..args) = {
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
// ─── Override dang — dùng level-4 trong mục lục (lùi sau Bài) ───────
// Gọi #dang([Tiêu đề], prefix: "Dạng", theme-color: c-p1) như bình thường
#let dang(title, prefix: "Dạng", theme-color: c-book, ..args) = {
  _section-orig(title, prefix: prefix, theme-color: theme-color, ..args)
}
