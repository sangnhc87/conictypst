// ═══════════════════════════════════════════════════════════════
// CẤU HÌNH SÁCH: NGUỒN GỐC TRÍ TUỆ
// ═══════════════════════════════════════════════════════════════

#import "../../modules/_shared-config.typ": *
#import "../../modules/book.typ": *

// ── Màu chủ đạo ──────────────────────────────────────────────
#let c-book    = rgb("#1a3a5c")   // xanh đen học thuật
#let c-brain   = rgb("#7c3aed")   // tím - não bộ / triết học
#let c-evo     = rgb("#065f46")   // xanh lá - tiến hóa
#let c-ai      = rgb("#0369a1")   // xanh dương - AI / công nghệ
#let c-philo   = rgb("#9f1239")   // đỏ sẫm - triết học
#let c-neuro   = rgb("#b45309")   // cam vàng - khoa học thần kinh
#let c-acct    = c-book

// ── Box nội dung ─────────────────────────────────────────────
#let _vivid-box(body, title: [], accent: c-book, fill: white) = block(
  width: 100%,
  radius: 8pt,
  clip: true,
  stroke: 0.5pt + accent.lighten(40%),
)[
  #block(width: 100%, fill: accent, inset: (x: 14pt, y: 8pt))[
    #text(fill: white, weight: "bold", size: 11pt)[#title]
  ]
  #block(width: 100%, fill: fill, inset: (x: 14pt, y: 11pt))[
    #body
  ]
]

#let khainiemboc(body, title: [📖 Khái niệm], accent: c-book) = {
  _vivid-box(body, title: title, accent: accent, fill: accent.lighten(94%))
}

#let lydo(body, title: [💡 Luận điểm cốt lõi], accent: c-brain) = {
  _vivid-box(body, title: title, accent: accent, fill: accent.lighten(94%))
}

#let luuy(body, title: [▲ Lưu ý], accent: rgb("#b45309")) = {
  _vivid-box(body, title: title, accent: accent, fill: rgb("#fffbeb"))
}

#let nhanxet(body, title: [◈ Nhận xét], accent: c-brain) = {
  _vivid-box(body, title: title, accent: accent, fill: accent.lighten(93%))
}

#let trithuc(body, title: [★ Tri thức mở rộng], accent: c-evo) = {
  _vivid-box(body, title: title, accent: accent, fill: accent.lighten(93%))
}

#let caudoi(body, title: [? Câu hỏi suy ngẫm], accent: c-philo) = {
  _vivid-box(body, title: title, accent: accent, fill: accent.lighten(94%))
}

#let dinhly(body, title: [≡ Định lý / Nguyên lý], accent: c-ai) = {
  _vivid-box(body, title: title, accent: accent, fill: accent.lighten(94%))
}

#let nghiencuu(body, title: [🔬 Nghiên cứu tiêu biểu], accent: c-neuro) = {
  _vivid-box(body, title: title, accent: accent, fill: accent.lighten(94%))
}

// ── Trích dẫn nổi bật ────────────────────────────────────────
#let trichdan(body, author: [], source: []) = block(
  width: 100%,
  inset: (left: 20pt, right: 12pt, top: 10pt, bottom: 10pt),
  stroke: (left: 4pt + c-philo.lighten(20%)),
  fill: c-philo.lighten(96%),
  radius: (right: 6pt),
)[
  #text(size: 12.5pt, style: "italic")[#body]
  #if author != [] {
    v(0.4em)
    align(right)[
      #text(size: 10.5pt, weight: "bold", fill: c-philo)[— #author]
      #if source != [] { text(size: 9.5pt, fill: gray)[, #emph[#source]] }
    ]
  }
]

// ── Bước / Ý trong phân tích ─────────────────────────────────
#let _step-cnt = counter("_tri-tue-step")
#let _step-palette = (c-book, c-brain, c-evo, c-ai, c-philo, c-neuro)
#let resetstep() = _step-cnt.update(0)

#let step(body, accent: auto) = {
  _step-cnt.step()
  context {
    let n = _step-cnt.get().first()
    let col = if accent != auto { accent } else {
      _step-palette.at(calc.rem(n - 1, _step-palette.len()))
    }
    block(
      width: 100%,
      inset: (left: 14pt, top: 5pt, bottom: 5pt, right: 0pt),
      stroke: (left: 3pt + col),
    )[#body]
  }
}

// ── Dòng thời gian ───────────────────────────────────────────
#let timeline-event(year, content, accent: c-book) = grid(
  columns: (2.8cm, 1fr),
  column-gutter: 12pt,
  align: (right + top, left + top),
  [
    #box(
      fill: accent,
      inset: (x: 8pt, y: 5pt),
      radius: 4pt,
    )[#text(fill: white, weight: "bold", size: 10.5pt)[#year]]
  ],
  block(
    inset: (left: 6pt, top: 3pt, bottom: 8pt),
    stroke: (left: 2pt + accent.lighten(40%)),
  )[#content],
)
