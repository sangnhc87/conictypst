#import "_config.typ": *
#import "bia-thongke.typ": cover-page

#show: stexgv-book.with(
  title: "ĐO ĐỘ PHÂN TÁN CỦA MẪU SỐ LIỆU GHÉP NHÓM",
  subtitle: "Khung lý thuyết, bài mẫu và đề luyện tập chuyên sâu",
  author: "GV Nguyễn Văn Sang",
  theme-color: c-book,
  doc-type: "chuyende",
  institution: "Tổ Toán – Tài liệu Chuyên sâu",
  subject: "Toán",
  grade: "Lớp 12",
  series: "Bộ tài liệu Thống kê thực chiến",
  academic-year: "2025 – 2026",
  outline-depth: 4,
  show-cover: false,
  show-outline: false,
)

// Call custom cover page
#cover-page()

#set page(margin: (top: 1.8cm, bottom: 1.8cm, inside: 2cm, outside: 1.5cm))
#set text(size: 12pt)
#set par(leading: 0.72em, spacing: 1.25em)

// Custom helper function to clean prefixes in TOC
#let clean-prefix(body) = {
  let txt = ""
  if body.has("children") {
    for child in body.children {
      if child.has("text") {
        txt = txt + child.text
      } else if repr(child.func()) == "space" {
        txt = txt + " "
      }
    }
  } else if body.has("text") {
    txt = body.text
  } else {
    txt = repr(body)
  }
  
  let cleaned = txt
  if txt.starts-with("Bài ") or txt.starts-with("Mục ") {
    let parts = txt.split(". ")
    if parts.len() > 1 {
      cleaned = parts.slice(1).join(". ")
    }
  }
  return cleaned
}

// Redesign Outline Entries
#show outline.entry.where(level: 3): it => {
  let title = clean-prefix(it.body())
  v(0.7em)
  link(it.element.location())[
    #block(
      width: 100%,
      fill: c-book.lighten(94%),
      stroke: (left: 4.5pt + c-book),
      inset: (x: 14pt, y: 11pt),
      radius: (right: 6pt),
    )[
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        text(fill: c-book.darken(10%), weight: "bold", size: 12pt)[📘 #title],
        text(fill: c-book, size: 11pt, weight: "bold")[#it.page()]
      )
    ]
  ]
}

#show outline.entry.where(level: 4): it => {
  let title = clean-prefix(it.body())
  v(0.2em)
  h(22pt)
  link(it.element.location())[
    #box(
      width: 100% - 22pt,
      fill: rgb("#f8fafc"),
      stroke: (left: 2pt + rgb("#e2e8f0")),
      inset: (x: 12pt, y: 7pt),
      radius: (right: 4pt),
    )[
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        text(fill: rgb("#334155"), size: 10.5pt)[✦ #title],
        text(fill: rgb("#64748b"), size: 10pt, weight: "medium")[#it.page()]
      )
    ]
  ]
}

#{
  v(2em)
  align(center)[
    #text(size: 22pt, weight: "bold", fill: c-book)[MỤC LỤC]
    #v(0.4em)
    #block(width: 40%)[
      #line(length: 100%, stroke: 2pt + c-book)
    ]
  ]
  v(1.5em)
  outline(title: none, depth: 4, indent: auto)
  pagebreak()
}

#include "c4-flowchart.typ"
#include "c3-b1.typ"
#include "c3-b2.typ"

#context {
  let resets = query(<appendix-heading>)
  let pages = resets.map(r => r.location().page())
  [#metadata(pages) <debug-pages>]
}
