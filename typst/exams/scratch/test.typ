#set page(paper: "a4")
#set text(font: "New Computer Modern")

#outline()

#v(2cm)

#show heading.where(level: 1): it => {
  if repr(it.body).contains("Chủ Đề") {
    []
  } else {
    it
  }
}

= Bản Đồ Tư Duy Hệ Thống

Đây là bản đồ tư duy. Nó sẽ hiển thị bình thường.

#block(fill: blue.lighten(90%), inset: 10pt)[
  #heading(level: 1)[Chủ Đề 1: Quy Tắc Cộng]
  Đây là nội dung của chủ đề 1.
]

#block(fill: green.lighten(90%), inset: 10pt)[
  #heading(level: 1)[Chủ Đề 2: Quy Tắc Nhân]
  Đây là nội dung của chủ đề 2.
]
