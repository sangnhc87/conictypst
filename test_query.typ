#context {
  let sz = measure(box[Hello world])
  [#metadata((layout: if sz.width > 50pt { "2x2" } else { "1x4" })) <question-layout>]
}
