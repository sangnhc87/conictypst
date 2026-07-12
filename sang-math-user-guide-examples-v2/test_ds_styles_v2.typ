#import "lib.typ": *
#show: sang-setup
#set page(width: 450pt, height: auto, margin: 15pt)

#let render-style(style) = {
  heading(level: 2, [Style: ] + style)
  let statements = (
    True([$f'(x)=3x^2-3$.]),
    [Hàm số đồng biến trên $(-oo; +oo)$.],
  )
  
  let alpha = ("a", "b", "c", "d")
  let vis-ans = true
  let accent = rgb("#0d5cb6")
  let palette = (correct: rgb("#16a34a"), wrong: rgb("#dc2626"))
  
  let rows = statements.enumerate().map(((i, s)) => {
    let ok = if type(s) == dictionary { s.at("correct", default: false) } else { false }
    let txt = if type(s) == dictionary { s.body } else { s }
    
    if style == "bookmark" {
      let marker = if vis-ans {
        if ok { h(1fr) + text(fill: palette.correct, weight: "bold")[✓ ĐÚNG] }
        else  { h(1fr) + text(fill: palette.wrong, weight: "bold")[✗ SAI] }
      } else { none }
      
      let row-fill = if vis-ans and ok { palette.correct.lighten(95%) } else { white }
      let border-color = if vis-ans { if ok { palette.correct } else { palette.wrong } } else { luma(200) }
      
      block(width: 100%, inset: (top: 10pt, bottom: 6pt, left: 10pt, right: 10pt), radius: 4pt, stroke: 0.5pt + border-color, fill: row-fill)[
        #place(top + left, dx: -10pt, dy: -20pt)[
          #box(fill: accent, radius: 2pt, inset: (x: 8pt, y: 3pt))[#text(fill: white, weight: "bold")[#alpha.at(i)]]
        ]
        #txt #marker
      ]
    } else if style == "gradient" {
      let marker = if vis-ans {
        if ok { h(4pt) + text(fill: palette.correct.darken(20%), weight: "bold")[✓] }
        else  { h(4pt) + text(fill: palette.wrong.darken(20%), weight: "bold")[✗] }
      } else { none }
      
      let grad = if vis-ans and ok { 
        gradient.linear(palette.correct.lighten(80%), palette.correct.lighten(95%), angle: 0deg) 
      } else { 
        gradient.linear(luma(240), white, angle: 0deg) 
      }
      
      block(width: 100%, fill: grad, inset: (x: 8pt, y: 6pt), radius: 8pt)[
        #box(fill: gradient.linear(accent, accent.lighten(40%), angle: 0deg), radius: 50%, width: 1.5em, height: 1.5em, align(center+horizon)[#text(fill: white, weight: "bold")[#alpha.at(i)]]) #h(6pt) #txt #marker
      ]
    } else if style == "checklist" {
      let mark-icon = if vis-ans {
        if ok { text(fill: white, size: 0.8em)[✓] }
        else  { text(fill: white, size: 0.8em)[✗] }
      } else { none }
      
      let check-box = if vis-ans {
        if ok { box(fill: palette.correct, radius: 3pt, width: 1.2em, height: 1.2em, align(center+horizon)[#mark-icon]) }
        else  { box(fill: palette.wrong, radius: 3pt, width: 1.2em, height: 1.2em, align(center+horizon)[#mark-icon]) }
      } else { 
        box(stroke: 1pt + luma(180), radius: 3pt, width: 1.2em, height: 1.2em)
      }
      
      block(width: 100%, inset: (x: 4pt, y: 6pt), stroke: (bottom: 0.5pt + luma(230), top: 0.5pt + luma(230)))[
        #grid(columns: (auto, auto, 1fr), column-gutter: 8pt, align: (center+horizon, left+horizon, left+horizon),
          check-box,
          text(weight: "bold", fill: accent)[#alpha.at(i)) ],
          txt
        )
      ]
    } else {
      [Unknown]
    }
  })
  stack(dir: ttb, spacing: 14pt, ..rows)
}

#render-style("bookmark")
#v(10pt)
#render-style("gradient")
#render-style("checklist")
