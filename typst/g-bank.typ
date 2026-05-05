// =========================================================
// HỆ THỐNG NGÂN HÀNG CÂU HỎI (QUESTION BANK)
// Hỗ trợ: Trộn đề ngẫu nhiên (LCG), Xuất Slides Trình chiếu
// =========================================================

// 1. THUẬT TOÁN SINH SỐ NGẪU NHIÊN (LCG - Linear Congruential Generator)
#let lcg(seed) = {
  let a = 1664525
  let c = 1013904223
  let m = 4294967296
  return calc.rem(a * seed + c, m)
}

// 2. THUẬT TOÁN TRỘN MẢNG (Fisher-Yates dựa trên LCG)
#let shuffle(array, seed) = {
  let result = ()
  let current-seed = seed
  let source = array
  while source.len() > 0 {
    current-seed = lcg(current-seed)
    let idx = calc.rem(current-seed, source.len())
    result.push(source.remove(idx))
  }
  return result
}

// 3. HÀM TRỘN PHƯƠNG ÁN (Dành riêng cho câu hỏi Trắc nghiệm)
#let shuffle-options(options, correct, seed) = {
  if type(correct) == int {
    let paired = options.enumerate().map(((i, opt)) => (opt: opt, is-correct: i == correct))
    let shuffled-paired = shuffle(paired, seed)
    let new-options = shuffled-paired.map(x => x.opt)
    let new-correct = shuffled-paired.position(x => x.is-correct)
    return (options: new-options, correct: new-correct)
  }
  return (options: options, correct: correct)
}

// =========================================================
// 4. HÀM XUẤT ĐỀ THI TỪ NGÂN HÀNG (TRỘN CÂU HỎI + ĐÁP ÁN)
// =========================================================
#let build-exam(
  questions, 
  seed: 101, 
  render-mcq: none,
  render-tf: none
) = {
  let shuffled-questions = shuffle(questions, seed)
  
  for (i, q) in shuffled-questions.enumerate() {
    let q-seed = seed + i
    
    if q.type == "mcq" {
      let sh-opts = shuffle-options(q.options, q.correct, q-seed)
      render-mcq(
        q.stem,
        sh-opts.options,
        correct: (sh-opts.correct,),
        image: q.at("image", default: none),
        solution: q.at("solution", default: none)
      )
    } else if q.type == "tf" {
      // Logic trộn cho câu Đúng/Sai (Sẽ cập nhật sau)
    }
  }
}

// =========================================================
// 5. HÀM XUẤT SLIDES TRÌNH CHIẾU TỪ NGÂN HÀNG
// =========================================================
#let build-slides(
  questions, 
  seed: 101,
  accent: rgb("#1b3fb8")
) = {
  set page(paper: "presentation-16-9", margin: 2em)
  set text(size: 20pt, lang: "vi", font: "Libertinus Serif")
  
  // Các hàm tiện ích render Slides
  let render-opts(options, correct: none, show-ans: false) = {
    let labels = ("A", "B", "C", "D")
    grid(
      columns: (1fr, 1fr),
      row-gutter: 1.5em,
      column-gutter: 1em,
      ..options.enumerate().map(((i, opt)) => {
        let is-c = show-ans and i == correct
        box(fill: if is-c { accent.lighten(85%) } else { none }, inset: 0.5em, radius: 0.25em)[
          #text(weight: "bold", fill: if is-c { accent } else { black })[#labels.at(i).] #opt
        ]
      })
    )
  }

  let shuffled-questions = shuffle(questions, seed)
  
  for (i, q) in shuffled-questions.enumerate() {
    let q-seed = seed + i
    
    if q.type == "mcq" {
      let sh-opts = shuffle-options(q.options, q.correct, q-seed)
      let stem-block = block(fill: rgb("#f8fafc"), stroke: 1pt + accent, inset: 1em, radius: 0.5em, width: 100%)[
        #text(weight: "bold", fill: accent)[Câu #(i+1):] #q.stem
      ]

      // SLIDE 1: ĐỀ BÀI VÀ PHƯƠNG ÁN
      pagebreak(weak: true)
      stem-block
      v(1.5em)
      if "image" in q and q.image != none {
        grid(columns: (1fr, auto), column-gutter: 2em,
          render-opts(sh-opts.options),
          box(stroke: 1pt + rgb("#e2e8f0"), inset: 0.5em, q.image)
        )
      } else {
        render-opts(sh-opts.options)
      }

      // SLIDE 2: BÔI MÀU ĐÁP ÁN VÀ HIỂN THỊ LỜI GIẢI
      pagebreak(weak: true)
      stem-block
      v(1em)
      if "image" in q and q.image != none {
        grid(columns: (1fr, auto), column-gutter: 2em,
          render-opts(sh-opts.options, correct: sh-opts.correct, show-ans: true),
          box(stroke: 1pt + rgb("#e2e8f0"), inset: 0.5em, q.image)
        )
      } else {
        render-opts(sh-opts.options, correct: sh-opts.correct, show-ans: true)
      }
      
      if "solution" in q and q.solution != none {
        v(1em)
        block(fill: rgb("#f0fdf4"), stroke: (left: 4pt + rgb("#16a34a")), inset: 1em, radius: 0.25em, width: 100%)[
          #text(weight: "bold", fill: rgb("#15803d"))[💡 Lời Giải:] \
          #q.solution
        ]
      }
    }
  }
}
