// Generated STEXGV -> Typst mix demo.
#import "../sang-exam.typ": *
#import "../modules/exam-set.typ": de
#import "../modules/question-bank.typ": build-exam-plan, render-answer-key, render-exam-plan
#import "stexgv-bank.typ": stexgv-question-bank, stexgv-thpt-matrix

#let render-code(code, seed) = {
  let plan = build-exam-plan(
    stexgv-question-bank,
    stexgv-thpt-matrix,
    seed: seed,
    status: none,
    strict: false,
  )

  de(
    [
      #exam-part([PHẦN I. TRẮC NGHIỆM], count: 12)
      #render-exam-plan(plan.slice(0, 12), mode: "dethi", seed: seed, shuffle-options: true, show-id: true)

      #exam-part([PHẦN II. ĐÚNG / SAI], count: 4)
      #render-exam-plan(plan.slice(12, 16), mode: "dethi", seed: seed, shuffle-options: true, show-id: true)

      #exam-part([PHẦN III. TRẢ LỜI NGẮN], count: 6)
      #render-exam-plan(plan.slice(16), mode: "dethi", seed: seed, shuffle-options: true, show-id: true)

      #pagebreak()
      #render-answer-key(plan, seed: seed, shuffle-options: true, title: [Bảng đáp án mã #code])
    ],
    title: [STEXGV Typst mã #code],
    exam-title: [ĐỀ TRỘN TỪ KHO STEXGV - TYPST],
    department: "HỆ THỐNG CONICTYPST",
    school: "STEXGV BRIDGE",
    subject: "TOÁN",
    duration: "90 phút",
    code: code,
    pagebreak-before: true,
    show-answer-key: false,
    show-end: true,
  )
}

#render-code("101", 2026)
#render-code("102", 2027)
