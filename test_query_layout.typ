#let tn(question, options, ..args) = {
  context {
    let w = options.map(o => measure(box[#o]).width)
    let max-w = calc.max(..w)
    let layout = "1x4"
    if max-w > 200pt { layout = "4x1" }
    else if max-w > 100pt { layout = "2x2" }
    [#metadata((layout: layout)) <layout>]
  }
}

#tn([Hỏi], ([Ngắn 1], [Ngắn 2], [Ngắn 3], [Ngắn 4]))
#tn([Hỏi], ([Rất rất rất rất rất dài 1], [Rất rất rất rất rất dài 2], [Dài 3], [Dài 4]))
