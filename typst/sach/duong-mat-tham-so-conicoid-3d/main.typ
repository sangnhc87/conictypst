#import "_theme.typ": *

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 2.2cm, bottom: 2.6cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#64748B"), style: "italic")[Tư Duy Đại Bác Diệt Ruồi — Tập 7: Đường & Mặt Tham Số 3D]],
        align(right)[#text(size: 8pt, fill: rgb("#0284C7"), weight: "bold")[Giải Phóng Tư Duy Không Gian]],
      )
      v(2pt)
      line(length: 100%, stroke: 0.4pt + rgb("#E2E8F0"))
    }
  },
  footer: align(center, context {
    let n = counter(page).get().first()
    if n > 1 { text(size: 9pt, fill: rgb("#64748B"))[— #counter(page).display() —] }
  }),
)

#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.92em, first-line-indent: 1.2em)
#set list(indent: 1.2em, body-indent: 0.6em)
#set enum(indent: 1.2em, body-indent: 0.6em)
#show math.equation: set text(fill: rgb("#0F172A"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display
#show heading: it => [
  #set par(first-line-indent: 0em)
  #it
]
#show heading.where(level: 1): it => [
  #pagebreak(weak: true)
  #block(
    fill: gradient.linear(C-DARK, rgb("#1E293B"), angle: 90deg),
    inset: (x: 16pt, y: 10pt),
    radius: 5pt,
    width: 100%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: white, weight: "black", size: 14pt)[#it.body]
  ]
  #v(0.9em)
]
#show heading.where(level: 2): it => block(
  fill: rgb("#F0F9FF"),
  stroke: (left: 4pt + C-FOREST),
  inset: (x: 14pt, y: 10pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 0.6em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-DARK, weight: "bold", size: 12pt)[#it.body]
]

#cover-box([TẬP 7: ĐƯỜNG & MẶT THAM SỐ 3D],[Quỹ đạo chuyển động, Dải Möbius, Các mặt kẻ Conicoids và Kỹ thuật lập trình mô phỏng])

#v(1.2em)
#align(center)[
  #block(
    fill: rgb("#FFFBEB"),
    stroke: 0.8pt + C-GOLD,
    inset: 12pt,
    radius: 6pt,
    width: 92%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-AMBER, weight: "bold")[Lời tựa: Phép Tham Số Hóa Như Sự Giải Phóng Tư Duy]
    #v(0.4em)
    #text(size: 9.6pt, style: "italic")[
      Tại sao ta cần đường và mặt tham số? Trong chương trình phổ thông, ta quen nhìn hình học không gian qua các phương trình ràng buộc (như phương trình mặt cầu, phương trình mặt phẳng). Nhưng thế giới thực tế di động: Robot di chuyển, gió thổi qua cánh buồm, tháp giải nhiệt Canton Tower vươn lên bầu trời.
      #linebreak()
      Chương này sẽ thay đổi hoàn toàn cách nhìn của bạn: từ thụ động sang chủ động. Bạn sẽ học cách dùng các tham số tự do để "vẽ" ra các đường xoắn Helix, các dải Möbius bất đối xứng, và dệt nên các mặt cong bằng những đường thẳng chéo nhau. Đó chính là cầu nối giữa toán phổ thông nâng cao, giải tích số bậc đại học và lập trình đồ họa hiện đại.
    ]
  ]
]

#v(1em)
#quote-block[Đừng chỉ nhìn hình học không gian như một tập hợp các ràng buộc khóa chặt. Hãy nhìn nó như một không gian tự do, nơi các đường tham số và mặt tham số là những dải băng động động năng tự vẽ nên chính mình dưới các tham số biến đổi.]

#v(1em)
#outline(title: [Mục Lục Tập 7], depth: 2)
#pagebreak()

#include "parts/01-loinoidau.typ"
#include "parts/02-duong-tham-so.typ"
#include "parts/03-mat-tham-so.typ"
#include "parts/04-conicoid.typ"
#include "parts/05-tuduy-caocap.typ"
#include "parts/06-xuong-so.typ"
