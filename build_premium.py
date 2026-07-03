import re

def process():
    with open("typst/giao-an/modules/lecture-beamer.typ", "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Replace metropolis import with custom Slide
    custom_slide_def = """
// --- PREMIUM CUSTOM THEME ---
#let slide(
  title: auto,
  align: auto,
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  if align != auto {
    self.store.align = align
  }
  let current-title = if title != auto { title } else { self.info.title }

  let header(self) = {
    set std.align(top)
    block(
      width: 100%, height: 40pt,
      fill: rgb(30, 41, 59, 120),
      stroke: (bottom: 1.5pt + rgb("#00F0FF")),
      inset: (x: 20pt, y: 10pt),
    )[
      #set std.align(horizon)
      #set text(font: "Arial", fill: white, size: 14pt, weight: "bold")
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [#current-title],
        text(fill: rgb("#00F0FF"))[#utils.call-or-display(self, self.store.header-right)]
      )
    ]
  }

  let footer(self) = {
    set std.align(center + bottom)
    pad(bottom: 10pt)[
      #block(
        fill: rgb(30, 41, 59, 200),
        stroke: 0.5pt + rgb("#00F0FF"),
        radius: 20pt,
        inset: (x: 14pt, y: 6pt),
      )[
        #set text(font: "Arial", fill: rgb("#00F0FF"), size: 12pt, weight: "bold")
        #context {
          utils.slide-counter.display() + " / " + utils.last-slide-number
        }
      ]
    ]
  }

  let self = utils.merge-dicts(
    self,
    config-page(
      paper: "presentation-16-9",
      fill: gradient.linear(rgb("#0B0F19"), rgb("#1A1B2F"), angle: 135deg),
      header: header(self),
      footer: footer(self),
      header-ascent: 0%,
      footer-descent: 0%,
      margin: (top: 3.5em, bottom: 3em, left: 2em, right: 2em),
    ),
  )
  
  let new-setting = body => {
    set text(fill: rgb("#f8fafc"))
    show: setting
    body
  }

  touying-slide(
    self: self,
    config: config,
    repeat: repeat,
    setting: new-setting,
    composer: composer,
    ..bodies,
  )
})

#let title-slide(
  config: (:),
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(
      fill: gradient.linear(rgb("#0B0F19"), rgb("#1A1B2F"), angle: 135deg),
      margin: 0pt,
      header: none,
      footer: none,
    ),
    config,
  )
  let info = self.info + args.named()
  let body = {
    set text(fill: white)
    set std.align(center + horizon)
    block(
      width: 80%,
      fill: rgb(30, 41, 59, 150),
      stroke: 1.5pt + gradient.linear(rgb("#00F0FF"), rgb("#FF007F")),
      radius: 20pt,
      inset: 30pt,
    )[
      #text(size: 32pt, weight: "bold", fill: rgb("#00F0FF"))[#info.title]
      
      #if info.subtitle != none [
        #v(5pt)
        #text(size: 20pt, fill: rgb("#E2E8F0"))[#info.subtitle]
      ]
      
      #v(20pt)
      #text(size: 24pt, weight: "bold")[#info.author]
      
      #v(10pt)
      #text(size: 18pt, fill: rgb("#94A3B8"))[#info.institution]
    ]
  }
  touying-slide(self: self, body)
})

#let new-section-slide(title: auto) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(rgb("#0B0F19"), rgb("#1A1B2F"), angle: 135deg),
      header: none,
      footer: none,
    ),
  )
  let body = {
    set text(fill: white)
    set std.align(center + horizon)
    block(
      fill: rgb(30, 41, 59, 150),
      stroke: 1pt + rgb("#00F0FF"),
      radius: 12pt,
      inset: 20pt,
    )[
      #text(size: 28pt, weight: "bold", fill: rgb("#00F0FF"))[#title]
    ]
  }
  touying-slide(self: self, body)
})
// ----------------------------
"""
    content = content.replace("#import themes.metropolis: *", custom_slide_def)

    # 2. Replace lecture-theme
    lecture_theme_start = content.find("#let lecture-theme(")
    if lecture_theme_start != -1:
        # find the matching closing brace
        brace_count = 0
        in_theme = False
        lecture_theme_end = -1
        for i in range(lecture_theme_start, len(content)):
            if content[i] == '{':
                in_theme = True
                brace_count += 1
            elif content[i] == '}':
                brace_count -= 1
                if in_theme and brace_count == 0:
                    lecture_theme_end = i
                    break
        if lecture_theme_end != -1:
            custom_theme = """#let lecture-theme(
  body,
  title:       "BÀI HỌC",
  subtitle:    "TOÁN 12",
  chapter:     "",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  date:        datetime.today(),
  accent:      rgb("#00F0FF"),
  bg-color:    rgb("#0B0F19"),
  math-color:  rgb("#00F0FF"),
  math-size:   1.05em,
  base-size:   22pt,
  body-font:   ("Arial", "sans-serif"),
  aspect-ratio: "16-9",
) = {
  let _fg = rgb("#f8fafc")
  let _card = rgb(30, 41, 59, 150)
  let _muted = rgb("#94a3b8")
  
  _lec-style.update((
    accent: rgb("#00F0FF"),
    bg: rgb("#0B0F19"),
    fg: _fg, card: _card, muted: _muted,
    math-color: math-color, math-size: math-size, base: base-size, body-font: body-font,
    def-fill: _card, thm-fill: _card,
    ex-fill: _card, note-fill: _card,
    hist-fill: _card, sol-fill: _card,
    is-dark: true,
  ))

  set text(font: body-font, size: base-size, fill: _fg, lang: "vi")
  show math.equation.where(block: false): math.display
  show math.equation: set text(fill: math-color, size: math-size)
  show heading: set text(font: body-font, fill: rgb("#00F0FF"))

  show math.attach: it => {
    let f = it.base.fields()
    if "text" in f and f.text in ("C", "A", "P") {
      return math.attach(math.upright(f.text), t: it.t, b: it.b, tl: it.tl, bl: it.bl, tr: it.tr, br: it.br)
    }
    it
  }

  show: touying-slides.with(
    config-info(
      title: title,
      subtitle: subtitle,
      author: author,
      institution: institution,
    ),
    config-common(slide-fn: slide, new-section-slide-fn: new-section-slide),
    config-store(header-right: ""),
  )

  title-slide()
  body
}"""
            content = content[:lecture_theme_start] + custom_theme + content[lecture_theme_end+1:]

    # 3. We will append the block overrides at the end
    overrides = """
// -------------------------------------------------------------
// OVERRIDE BLOCKS FOR GLASSMORPHISM
// -------------------------------------------------------------
#let _premium_block(title, title-color, body) = context {
  let s = _lec-style.get()
  block(
    width: 100%,
    fill: s.card,
    stroke: 1.5pt + gradient.linear(rgb("#00F0FF"), rgb("#FF007F"), angle: 45deg),
    radius: 12pt,
    inset: (x: 16pt, y: 12pt),
  )[
    #text(size: s.base * 0.7, fill: title-color, weight: "bold")[#title]
    #v(0.4em)
    #set text(size: s.base * 0.85, fill: s.fg)
    #body
  ]
}

#let lt-definition(title: none, numbered: true, body) = {
  _lec-def-cnt.step()
  context {
    let n = if numbered { " " + _lec-def-cnt.display() } else { "" }
    let ttl = if title != none { ": " + title } else { "" }
    _premium_block([📐 ĐỊNH NGHĨA#n#ttl], rgb("#00F0FF"), body)
  }
}

#let lt-theorem(title: none, kind: "ĐỊNH LÝ", numbered: true, body) = {
  _lec-thm-cnt.step()
  context {
    let n = if numbered { " " + _lec-thm-cnt.display() } else { "" }
    let ttl = if title != none { ": " + title } else { "" }
    _premium_block([⚡ #kind#n#ttl], rgb("#00F0FF"), body)
  }
}

#let lt-example(title: none, numbered: true, body) = {
  _lec-ex-cnt.step()
  context {
    let n = if numbered { " " + _lec-ex-cnt.display() } else { "" }
    let ttl = if title != none { ": " + title } else { "" }
    _premium_block([📝 VÍ DỤ#n#ttl], rgb("#FBBF24"), body)
  }
}

#let lt-rule(title: "QUY TẮC", body) = _premium_block([📌 #title], rgb("#FBBF24"), body)
#let lt-note(title: "CHÚ Ý", body) = _premium_block([💡 #title], rgb("#F43F5E"), body)
#let lt-history(title: "EM CÓ BIẾT?", body) = _premium_block([🔍 #title], rgb("#34D399"), body)
#let lt-solution(title: "LỜI GIẢI", body) = _premium_block([✅ #title], rgb("#34D399"), body)
"""
    content += overrides

    with open("typst/giao-an/modules/lecture-beamer-premium.typ", "w", encoding="utf-8") as f:
        f.write(content)

process()
print("Done")
