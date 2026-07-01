import re

with open("typst/giao-an/modules/lecture-beamer.typ", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Update Palette
new_palette = """// ── MÀU SẮC CHUẨN SGK (LIGHT THEME) ───────────────────────────────────
#let lec-palette = (
  // Nền
  light:   rgb("#ffffff"),
  surface: rgb("#f8fafc"),
  card:    rgb("#ffffff"),
  // Accent
  navy:    rgb("#1e3a8a"), // Tiêu đề chính
  emerald: rgb("#059669"), // Lời giải, Định lý
  amber:   rgb("#d97706"), // Công thức, Chú ý
  rose:    rgb("#e11d48"), // Cảnh báo, Sai lầm
  violet:  rgb("#6d28d9"), // Bổ trợ
  cyan:    rgb("#0891b2"),
  // Text
  text:    rgb("#0f172a"),
  muted:   rgb("#475569"),
  // Box fills
  def-fill:  rgb("#eff6ff"),
  thm-fill:  rgb("#f0fdf4"),
  ex-fill:   rgb("#fffbeb"),
  note-fill: rgb("#fff1f2"),
  hist-fill: rgb("#f5f3ff"),
  sol-fill:  rgb("#ecfdf5"),
)"""

content = re.sub(r'#let lec-palette = \([\s\S]*?\)', new_palette, content)

# 2. Update lecture-theme definition
new_theme = """#let lecture-theme(
  body,
  // Thông tin bài
  title:       "BÀI HỌC",
  subtitle:    "TOÁN 12",
  chapter:     "",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  date:        datetime.today(),
  // Giao diện
  accent:      lec-palette.navy,
  bg-color:    lec-palette.light,
  math-color:  lec-palette.navy,
  base-size:   22pt,
  aspect-ratio: "16-9",
) = {
  let _fg      = lec-palette.text
  let _card    = lec-palette.card
  let _muted   = lec-palette.muted

  // Lưu style vào state để macro con truy cập
  _lec-style.update((
    accent: accent, bg: bg-color, fg: _fg, card: _card, muted: _muted,
    math-color: math-color, base: base-size,
    def-fill: lec-palette.def-fill, thm-fill: lec-palette.thm-fill,
    ex-fill: lec-palette.ex-fill, note-fill: lec-palette.note-fill,
    hist-fill: lec-palette.hist-fill, sol-fill: lec-palette.sol-fill,
    is-dark: false,
  ))

  show: metropolis-theme.with(
    aspect-ratio: aspect-ratio,
    footer: context {
      set text(size: 8pt, fill: _muted, weight: "medium")
      grid(
        columns: (1fr, auto, 1fr),
        align: (left + horizon, center + horizon, right + horizon),
        pad(left: 6pt)[#author — #institution],
        text(fill: accent, weight: "bold")[#title],
        pad(right: 6pt)[
          Trang #touying-progress(ratio => str(touying-utils.page-num()) + " / " + str(touying-utils.page-count()))
        ]
      )
    }
  )

  // Configure Metropolis Colors
  show: config-colors(
    primary: bg-color,
    primary-light: bg-color,
    primary-dark: bg-color,
    secondary: bg-color,
    secondary-light: bg-color,
    secondary-dark: bg-color,
    tertiary: bg-color,
    tertiary-light: bg-color,
    tertiary-dark: bg-color,
    neutral: _fg,
    neutral-light: _muted,
    neutral-dark: _fg,
  )"""

content = re.sub(r'#let lecture-theme\([\s\S]*?neutral-dark: _fg,\n  \)', new_theme, content)

# Write back
with open("typst/giao-an/modules/lecture-beamer.typ", "w", encoding="utf-8") as f:
    f.write(content)

