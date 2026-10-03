#let quiz-bank = json("checkpoints.json")
#let dark = rgb("#123047")
#let blue = rgb("#115e8c")
#let green = rgb("#047857")
#let amber = rgb("#a16207")

#let lesson-theme(body) = {
  set page(
    paper: "a4",
    margin: (x: 1.9cm, y: 1.7cm),
    header: context [
      #text(size: 8pt, fill: blue, weight: "bold")[SANG MATH · BÀI GIẢNG TOÁN 10]
      #h(1fr)
      #text(size: 8pt, fill: rgb("#64748b"))[Hệ bất phương trình bậc nhất hai ẩn]
    ],
    footer: context [
      #text(size: 8pt, fill: rgb("#64748b"))[Học qua mô hình · hình học · thực tiễn]
      #h(1fr)
      #counter(page).display("1")
    ],
  )
  set text(font: "New Computer Modern", size: 10.5pt, lang: "vi", fill: dark)
  set par(justify: true, leading: 0.58em)
  set heading(numbering: "1.")
  show heading: set text(fill: blue)
  body
}

#let lesson-box(title, body, accent: blue, fill: rgb("#eff6ff")) = block(
  width: 100%,
  fill: fill,
  stroke: 0.7pt + accent,
  radius: 5pt,
  inset: 10pt,
  breakable: true,
)[
  #text(weight: "bold", fill: accent)[#title]
  #v(0.3em)
  #body
]

#let teacher-note(body) = if sys.inputs.at("teacher", default: "0") == "1" {
  lesson-box([Gợi ý cho giáo viên], body, accent: amber, fill: rgb("#fffbeb"))
} else { [] }

#let _answer-label(q) = {
  let kind = q.at("type")
  let answer = q.at("answer")
  if kind == "single" { return ("A", "B", "C", "D", "E").at(answer) }
  if kind == "multi" { return answer.map(i => ("A", "B", "C", "D", "E").at(i)).join(", ") }
  if kind == "point_exact" { return "(" + str(answer.at(0)) + ";" + str(answer.at(1)) + ")" }
  if kind == "feasible_point" { return q.at("sample") + " (hoặc nghiệm khác phù hợp)" }
  str(answer)
}

#let checkpoint(id) = if sys.inputs.at("scorm", default: "0") == "1" { [] } else {
  let section = quiz-bank.sections.at(id)
  [
    #pagebreak()
    === Tự kiểm tra tại chỗ · #section.questions.len() câu
    #text(size: 9pt, fill: rgb("#475569"))[Bản SCORM cho phép bấm “Kiểm tra” ngay sau từng câu; bản in dùng để thảo luận và ghi lời giải.]
    #for (index, q) in section.questions.enumerate() {
      block(width: 100%, inset: 7pt, fill: rgb("#f8fafc"), radius: 4pt)[
        *Câu #str(index + 1) · #q.level* — #q.prompt
        #if q.at("type") == "single" or q.at("type") == "multi" {
          for (i, option) in q.options.enumerate() {
            [#("A", "B", "C", "D", "E").at(i). #option\ ]
          }
        } else if q.at("type") == "number" {
          [Đáp số: ...................................................]
        } else {
          [Tọa độ $(x;y)$: .............................................]
        }
      ]
      v(0.35em)
    }
  ]
}

#let teacher-key() = if sys.inputs.at("teacher", default: "0") == "1" {
  [
    #pagebreak()
    = Phụ lục dành cho giáo viên · đáp án và giải thích
    #for id in ("01", "02", "03", "04") {
      let section = quiz-bank.sections.at(id)
      [
        == #section.title
        #for q in section.questions {
          [*#q.id — Đáp án:* #_answer-label(q). #q.explanation\ ]
        }
      ]
    }
  ]
} else { [] }
