// ╔══════════════════════════════════════════════════════════════════╗
// ║          TEMPLATE: ĐẠO ĐỨC KINH — BOOK DESIGN (v2)              ║
// ║          Đọc được hoàn toàn bằng Tiếng Việt                      ║
// ║          Chữ Hán chỉ dùng làm trang trí nhỏ                     ║
// ╚══════════════════════════════════════════════════════════════════╝

// ══════════════════════════════════════════════════════
// §1. BẢN MÀU
// ══════════════════════════════════════════════════════
#let dao-ink      = rgb("#1c1410")
#let dao-cinnabar = rgb("#8b1a1a")
#let dao-gold     = rgb("#a07830")
#let dao-jade     = rgb("#2d6a4f")
#let dao-mist     = rgb("#f7f3eb")
#let dao-silk     = rgb("#ede7d5")
#let dao-brown    = rgb("#6b4c2a")
#let dao-smoke    = rgb("#7a6a5a")
#let dao-azure    = rgb("#1a3a5c")
#let dao-char     = rgb("#2e2416")
#let dao-red-lt   = dao-cinnabar.lighten(45%)

// ══════════════════════════════════════════════════════
// §2. HÀM NỘI BỘ
// ══════════════════════════════════════════════════════
#let _hairline(color: dao-brown.lighten(55%)) = line(length: 100%, stroke: 0.4pt + color)

#let _ornament(color: dao-gold) = align(center)[
  #text(fill: color, size: 11pt)[✦]
]

#let _roman(n) = {
  let r = ("I","II","III","IV","V","VI","VII","VIII","IX","X",
    "XI","XII","XIII","XIV","XV","XVI","XVII","XVIII","XIX","XX",
    "XXI","XXII","XXIII","XXIV","XXV","XXVI","XXVII","XXVIII","XXIX","XXX",
    "XXXI","XXXII","XXXIII","XXXIV","XXXV","XXXVI","XXXVII","XXXVIII","XXXIX","XL",
    "XLI","XLII","XLIII","XLIV","XLV","XLVI","XLVII","XLVIII","XLIX","L",
    "LI","LII","LIII","LIV","LV","LVI","LVII","LVIII","LIX","LX",
    "LXI","LXII","LXIII","LXIV","LXV","LXVI","LXVII","LXVIII","LXIX","LXX",
    "LXXI","LXXII","LXXIII","LXXIV","LXXV","LXXVI","LXXVII","LXXVIII","LXXIX","LXXX",
    "LXXXI")
  if n >= 1 and n <= r.len() { r.at(n - 1) } else { str(n) }
}

// ══════════════════════════════════════════════════════
// §3. SETUP TOÀN CỤC
// ══════════════════════════════════════════════════════
#let dao-book(
  title:      "ĐẠO ĐỨC KINH",
  subtitle:   "Bình giải và suy tư",
  author:     "Lão Tử",
  translator: "Nguyễn Hiến Lê & Nhiều học giả",
  year:       "~600 TCN · Bình giải 2026",
  body,
) = {
  set document(title: title, author: author)

  set page(
    paper: "a5",
    margin: (top: 2.3cm, bottom: 2.2cm, inside: 2.1cm, outside: 1.7cm),
    fill: dao-mist,

    header: context {
      let pg = counter(page).get().first()
      if pg <= 2 { return none }
      set text(size: 7.5pt, fill: dao-smoke, font: "Baskerville")
      if calc.odd(pg) {
        grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
          text(style: "italic")[#title],
          text(fill: dao-gold, weight: "bold", size: 9pt)[✦],
        )
      } else {
        grid(columns: (auto, 1fr), align: (left + horizon, right + horizon),
          text(fill: dao-gold, weight: "bold", size: 9pt)[✦],
          text(style: "italic")[Lão Tử · Đạo Đức Kinh],
        )
      }
      v(-3pt)
      line(length: 100%, stroke: 0.35pt + dao-brown.lighten(55%))
    },

    footer: context {
      let pg = counter(page).get().first()
      if pg <= 2 { return none }
      line(length: 100%, stroke: 0.35pt + dao-brown.lighten(55%))
      v(2pt)
      align(center)[#text(size: 8pt, fill: dao-smoke)[#pg]]
    },
  )

  set text(font: ("Baskerville", "Songti SC"), size: 11pt, lang: "vi", fill: dao-char)
  set par(justify: true, leading: 0.88em, spacing: 1.4em)
  set list(marker: [—])

  // ── TRANG BÌA ─────────────────────────────────────
  page(fill: dao-silk, margin: 0cm)[ // Nền lụa ngà sang trọng, ấm áp, không bị "đen xì lì", lề bằng 0 để căn chỉnh viền tuyệt đối chính xác
    // Viền kép phong cách thư bản cổ điển
    #place(top + left, dx: 14pt, dy: 14pt,
      rect(width: 100% - 28pt, height: 100% - 28pt,
        stroke: 2pt + dao-cinnabar, fill: none))
    #place(top + left, dx: 18pt, dy: 18pt,
      rect(width: 100% - 36pt, height: 100% - 36pt,
        stroke: 0.5pt + dao-gold, fill: none))
    #place(top + left, dx: 22pt, dy: 22pt,
      rect(width: 100% - 44pt, height: 100% - 44pt,
        stroke: 0.25pt + dao-cinnabar.lighten(30%), fill: none))

    // Góc hoa văn trang trí nhỏ màu vàng đồng
    #place(top + left, dx: 26pt, dy: 26pt)[#text(fill: dao-gold, size: 10pt)[✦]]
    #place(top + right, dx: -26pt, dy: 26pt)[#text(fill: dao-gold, size: 10pt)[✦]]
    #place(bottom + left, dx: 26pt, dy: -26pt)[#text(fill: dao-gold, size: 10pt)[✦]]
    #place(bottom + right, dx: -26pt, dy: -26pt)[#text(fill: dao-gold, size: 10pt)[✦]]

    // Khối nội dung chính được căn lề trong để không đè lên viền
    #place(top + left, dx: 30pt, dy: 30pt,
      block(width: 100% - 60pt, height: 100% - 60pt)[
        #align(center + horizon)[
          #v(-1.5em)
          // Dải tiêu đề nhỏ phía trên
          #text(fill: dao-cinnabar, size: 9.5pt, tracking: 0.3em, weight: "bold")[
            CỔ THƯ TINH HOA
          ]
          
          #v(0.5em)
          #_ornament(color: dao-gold)
          #v(1.5em)

          // Tiêu đề lớn màu đỏ chu sa nổi bật trên nền ngà
          #text(
            font: "Baskerville",
            size: 38pt, fill: dao-cinnabar, weight: "bold",
            tracking: 0.1em,
          )[#upper(title)]
          
          #v(0.8em)
          #line(length: 3.5cm, stroke: 1.2pt + dao-gold)
          #v(0.8em)

          // Tác giả dạng con dấu Triện màu đỏ truyền thống
          #v(0.5em)
          #box(
            fill: dao-cinnabar,
            inset: (x: 15pt, y: 8pt),
            radius: 3pt,
            stroke: 0.8pt + dao-gold
          )[
            #text(font: "Baskerville", size: 14pt, fill: dao-silk, weight: "bold", tracking: 0.25em)[#upper(author)]
          ]
          
          #v(2em)
          
          #block(width: 100%)[
            #align(center)[
              #text(
                font: "Baskerville",
                size: 13pt, fill: dao-brown,
                style: "italic", tracking: 0.05em
              )[#subtitle]
            ]
          ]
          
          #v(3em)
          #text(font: "Baskerville", size: 9.5pt, fill: dao-smoke, tracking: 0.05em)[#year]

          #v(2.5em)
          #if translator != none {
            text(size: 9.5pt, fill: dao-char, style: "italic")[
              Bản dịch & Bình giải song ngữ:\
              #text(weight: "bold")[#translator]
            ]
            v(0.4em)
          }

          #v(2em)
          // Câu kinh trích dẫn trên bìa
          #text(fill: dao-cinnabar.lighten(10%), size: 10.5pt, weight: "medium", style: "italic")[
            "Đạo khả Đạo, phi thường Đạo."
          ]
          #v(0.3em)
          #text(fill: dao-char.lighten(15%), size: 9pt)[
            "Đạo có thể gọi được, không phải là Đạo vĩnh hằng."
          ]
        ]
      ]
    )
  ]

  pagebreak()
  body
}

// ══════════════════════════════════════════════════════
// §4. CÁC BLOCK NỘI DUNG
// ══════════════════════════════════════════════════════

// Mục lục
#let dao-outline() = {
  v(1em)
  align(center)[
    #text(size: 9pt, fill: dao-smoke, tracking: 0.18em)[✦ MỤC LỤC ✦]
  ]
  v(0.8em)
  set outline.entry(fill: repeat[#text(fill: dao-brown.lighten(60%), size: 7pt)[· ]])
  outline(title: none, depth: 2, indent: 1.5em)
  pagebreak(weak: true)
}

// Lời tựa / giới thiệu
#let dao-preface(body, title: "Lời Tựa") = {
  pagebreak(weak: true)
  v(1.4em)
  align(center)[
    #_hairline()
    #v(0.7em)
    #text(font: "Baskerville", size: 14pt, fill: dao-brown, weight: "bold")[#title]
    #v(0.4em)
    #_hairline()
  ]
  v(1em)
  body
  v(1.4em)
  _ornament()
  pagebreak(weak: true)
}

// Phần (Thượng Kinh / Hạ Kinh)
#let _part-cnt = counter("dao-part")
#let dao-part(title, subtitle: []) = {
  _part-cnt.step()
  pagebreak(weak: true)
  v(2em)
  page(fill: dao-cinnabar.darken(15%), margin: 0cm)[ // Đặt margin: 0cm để viền được đặt sát mép trang giống như bìa sách
    #place(top + left, dx: 14pt, dy: 14pt,
      rect(width: 100% - 28pt, height: 100% - 28pt,
        stroke: 0.5pt + dao-gold.lighten(20%), fill: none))
    #place(top + left, dx: 30pt, dy: 30pt,
      block(width: 100% - 60pt, height: 100% - 60pt)[
        #align(center + horizon)[
          #context {
            let n = _part-cnt.get().first()
            text(fill: dao-gold.lighten(30%), size: 9pt, tracking: 0.2em)[
              PHẦN #n
            ]
          }
          #v(0.8em)
          #text(font: "Baskerville", size: 30pt, fill: dao-mist, weight: "bold",
            tracking: 0.04em)[#upper(str(title))]
          #v(0.6em)
          #if subtitle != [] {
            text(font: "Baskerville", size: 12pt, fill: dao-gold.lighten(20%),
              style: "italic")[#subtitle]
          }
          #v(1em)
          #line(length: 5cm, stroke: 0.7pt + dao-gold.darken(10%))
        ]
      ]
    )
    #hide(heading(level: 1, outlined: true)[#title])
  ]
  pagebreak(weak: true)
}

// Truyện tiêu biểu
#let dao-truyen(body) = {
  v(0.35em)
  block(
    width: 100%,
    fill: rgb("#fbf7ef"),
    stroke: (left: 3pt + dao-gold),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9pt, weight: "bold", fill: dao-brown, tracking: 0.05em)[
      ✦ MẪU TRUYỆN TIÊU BIỂU
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.8pt, fill: dao-char)
    #set par(leading: 0.9em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.35em)
}

// Chương (章)
#let _zhang-cnt = counter("dao-zhang")
#let dao-zhang(number, title) = {
  _zhang-cnt.update(number)
  v(2.5em)
  align(center)[
    #text(font: "Baskerville", size: 10pt, fill: dao-gold.darken(20%), tracking: 0.1em)[
      CHƯƠNG #_roman(number)
    ]
    #v(0.4em)
    #text(font: "Baskerville", size: 18pt, fill: dao-cinnabar, weight: "bold", tracking: 0.05em)[
      #title
    ]
    #v(0.8em)
    #_hairline(color: dao-gold.lighten(20%))
  ]
  v(1em)

  hide(heading(level: 2, outlined: true, bookmarked: true)[#number. #title])
  
  import "truyen.typ": dao-truyen-note-for
  context {
    let story = dao-truyen-note-for(_zhang-cnt.get().first())
    if story != none { dao-truyen(story) }
  }
}

// Bản dịch song ngữ (Tiếng Việt & Tiếng Anh)
#let dao-songngu(vi: [], en: []) = {
  v(0.4em)
  let has-en = (en != [] and en != none)
  
  if has-en {
    block(
      width: 100%,
      fill: dao-silk,
      stroke: (
        left: 3.5pt + dao-gold,
        right: 3.5pt + dao-gold.lighten(40%)
      ),
      inset: (left: 14pt, right: 14pt, top: 14pt, bottom: 14pt),
      radius: 3pt,
    )[
      #grid(
        columns: (1fr, 1fr),
        column-gutter: 1.5em,
        [
          #set text(font: ("Baskerville","Georgia"), size: 11.5pt, fill: dao-char)
          #set par(leading: 1.0em, spacing: 1.4em, justify: true)
          #vi
        ],
        [
          #set text(font: ("Georgia","Baskerville"), size: 10.5pt, fill: dao-smoke, style: "italic")
          #set par(leading: 1.0em, spacing: 1.4em, justify: true)
          #en
        ]
      )
    ]
  } else {
    align(center)[
      #block(
        width: 88%,
        stroke: (top: 1pt + dao-gold, bottom: 1pt + dao-gold),
        inset: (x: 10pt, y: 16pt),
      )[
        #set text(font: ("Baskerville","Georgia"), size: 12.5pt, fill: dao-brown.darken(20%), weight: "medium")
        #set par(leading: 1.1em, spacing: 1.5em, justify: true)
        #vi
      ]
    ]
  }
  v(0.4em)
}

// Bản dịch — khối chính, gọi song ngữ nhưng mặc định chỉ hiển thị tiếng Việt nếu không có tiếng Anh
#let dao-trans(body) = {
  dao-songngu(vi: body, en: [])
}

// Đối chiếu triết học Đông Tây - Cổ Kim
#let dao-dongtay(truoc: [], sau: []) = {
  v(0.4em)
  block(
    width: 100%,
    fill: rgb("#fcf8f2"),
    stroke: 0.8pt + rgb("#a83a32"),
    inset: (x: 14pt, y: 12pt),
    radius: 4pt,
  )[
    #text(size: 9.5pt, weight: "bold", fill: rgb("#78211b"), tracking: 0.05em)[
      ✧ ĐÔNG TÂY CỔ KIM HỘI TỤ
    ]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1.5em,
      [
        #text(size: 8.5pt, weight: "bold", fill: dao-smoke)[VỚI NGƯỜI ĐI TRƯỚC:]
        #v(0.3em)
        #set text(font: ("Baskerville","Georgia"), size: 10pt, fill: dao-char)
        #set par(leading: 0.8em, justify: true)
        #truoc
      ],
      [
        #text(size: 8.5pt, weight: "bold", fill: dao-smoke)[VỚI NGƯỜI ĐI SAU:]
        #v(0.3em)
        #set text(font: ("Baskerville","Georgia"), size: 10pt, fill: dao-char)
        #set par(leading: 0.8em, justify: true)
        #sau
      ]
    )
  ]
  v(0.4em)
}

// Phiên âm Hán-Việt (nhỏ, nhẹ — ai muốn đọc thì đọc)
#let dao-phienam(body) = {
  block(
    width: 100%,
    inset: (left: 18pt, right: 10pt, top: 4pt, bottom: 6pt),
  )[
    #set text(font: ("Georgia","Baskerville"), size: 9pt,
      fill: dao-smoke, style: "italic")
    #set par(leading: 0.7em)
    _Phiên âm:_ #body
  ]
}

// Bình giải — chú thích dài, học thuật
#let dao-binh(body) = {
  v(0.3em)
  block(
    width: 100%,
    fill: dao-azure.lighten(95%),
    stroke: (left: 2.5pt + dao-azure),
    inset: (left: 14pt, right: 12pt, top: 11pt, bottom: 11pt),
    radius: (right: 4pt),
  )[
    #text(size: 8pt, weight: "bold", fill: dao-azure, tracking: 0.1em)[
      BÌNH GIẢI
    ]
    #v(0.4em)
    #set text(font: ("Baskerville","Georgia"), size: 10.5pt, fill: dao-azure.darken(20%))
    #set par(leading: 0.82em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.3em)
}

// Khái niệm then chốt
#let dao-concept(ten, body) = {
  v(0.4em)
  block(
    width: 100%,
    fill: dao-gold.lighten(90%),
    stroke: 0.6pt + dao-gold.lighten(25%),
    inset: (x: 14pt, y: 12pt),
    radius: 5pt,
  )[
    #text(font: "Baskerville", size: 12.5pt, weight: "bold", fill: dao-brown)[#ten]
    #v(0.3em)
    #line(length: 100%, stroke: 0.4pt + dao-gold.lighten(30%))
    #v(0.4em)
    #set text(size: 10.5pt, fill: dao-char)
    #set par(leading: 0.8em)
    #body
  ]
  v(0.4em)
}

// Câu hỏi suy ngẫm
#let dao-suyngam(body) = {
  v(0.4em)
  align(center)[
    #block(
      width: 88%,
      stroke: (top: 0.6pt + dao-cinnabar.lighten(40%),
               bottom: 0.6pt + dao-cinnabar.lighten(40%)),
      inset: (x: 0pt, y: 13pt),
    )[
      #set text(font: ("Baskerville","Georgia"), size: 11pt,
        style: "italic", fill: dao-cinnabar.darken(10%))
      #body
    ]
  ]
  v(0.4em)
}

// Trích dẫn so sánh
#let dao-compare(body, source: []) = {
  block(
    width: 100%,
    inset: (left: 20pt, right: 12pt, top: 8pt, bottom: 8pt),
    stroke: (left: 2.5pt + dao-jade),
    fill: dao-jade.lighten(95%),
    radius: (right: 4pt),
  )[
    #set text(font: ("Baskerville","Georgia"), size: 10.5pt,
      style: "italic", fill: dao-jade.darken(20%))
    #body
    #if source != [] {
      v(0.3em)
      align(right)[
        #text(size: 9pt, style: "normal", weight: "bold", fill: dao-jade)[— #source]
      ]
    }
  ]
}

// Áp dụng sư phạm
#let dao-supham(body) = {
  v(0.4em)
  block(
    width: 100%,
    fill: rgb("#e8f4f8"),
    stroke: (left: 3pt + rgb("#0277bd")),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9pt, weight: "bold", fill: rgb("#01579b"), tracking: 0.05em)[
      📐 GÓC NHÌN SƯ PHẠM
    ]
    #v(0.4em)
    #set text(font: ("Baskerville","Georgia"), size: 10.5pt, fill: rgb("#003c8f"))
    #set par(leading: 0.85em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.4em)
}

// Phân cách nhẹ
#let dao-sep() = {
  v(0.5em)
  _ornament(color: dao-gold)
  v(0.5em)
}

// Tiêu đề phụ trong bình giải
#let dao-section(title) = {
  v(0.8em)
  text(font: "Baskerville", size: 10.5pt, weight: "bold",
    fill: dao-brown, tracking: 0.06em)[#upper(title)]
  v(0.15em)
  line(length: 2.5cm, stroke: 1pt + dao-gold)
  v(0.5em)
}
