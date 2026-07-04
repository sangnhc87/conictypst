// ═══════════════════════════════════════════════════════════
// exam-mix-demo.typ — Demo quản lý ngân hàng & trộn đề bằng Typst
// Chạy:
//   typst compile --root typst typst/exam-mix-demo.typ output/exam-mix-demo.pdf
// ═══════════════════════════════════════════════════════════

#import "sang-exam.typ": *
#import "questions.typ": question-bank
#import "modules/exam-set.typ": de
#import "modules/question-bank.typ": (
  exam-slot,
  build-exam-plan,
  render-exam-plan,
  render-answer-key,
  thpt-2025-matrix,
)

// Ma trận demo nhỏ, dùng được ngay với ngân hàng mẫu hiện có.
// Khi ngân hàng đã đủ 22 slot, thay `demo-matrix` bằng `thpt-2025-matrix`.
#let demo-matrix = (
  exam-slot(1, label: [TN — mệnh đề], type: "tn", ids: ("0D1N1-1",)),
  exam-slot(2, label: [TN — tích phân], type: "tn", ids: ("12GT-TI-01",)),
  exam-slot(3, label: [TN — Oxyz], type: "tn", ids: ("12HH-MC-01", "12HH-DT-01", "12HH-MP-01")),
  exam-slot(4, label: [TN — thống kê], type: "tn", ids: ("12XS-TK-01",)),

  exam-slot(5, label: [Đúng sai — mệnh đề], type: "ds", ids: ("0D1N1-2",)),
  exam-slot(6, label: [Đúng sai — xác suất], type: "ds", ids: ("12XS-BAYES-01", "12GT-TY-01")),

  exam-slot(7, label: [Trả lời ngắn — mệnh đề], type: "tln", ids: ("0D1N1-3",)),
  exam-slot(8, label: [Trả lời ngắn — ứng dụng tích phân], type: "tln", ids: ("12GT-UD-DON-01",)),

  exam-slot(9, label: [Tự luận — mệnh đề], type: "tl", ids: ("0D1N1-4",)),
)

#let render-code(code, seed) = {
  let plan = build-exam-plan(
    question-bank,
    demo-matrix,
    seed: seed,
    strict: true,
  )

  de(
    [
      #exam-part([PHẦN I. TRẮC NGHIỆM], count: 4)
      #render-exam-plan(
        plan.slice(0, 4),
        mode: "dethi",
        seed: seed,
        shuffle-options: true,
        show-id: true,
      )

      #exam-part([PHẦN II. ĐÚNG / SAI], count: 2)
      #render-exam-plan(
        plan.slice(4, 6),
        mode: "dethi",
        seed: seed,
        shuffle-options: true,
        show-id: true,
      )

      #exam-part([PHẦN III. TRẢ LỜI NGẮN VÀ TỰ LUẬN], count: 3)
      #render-exam-plan(
        plan.slice(6),
        mode: "dethi",
        seed: seed,
        shuffle-options: true,
        show-id: true,
      )

      #pagebreak()
      #render-answer-key(plan, seed: seed, shuffle-options: true, title: [Bảng đáp án mã #code])
    ],
    title: [Đề minh họa mã #code],
    exam-title: [DEMO TRỘN ĐỀ TỪ NGÂN HÀNG TYPST],
    department: "HỆ THỐNG STEXGV TYPST",
    school: "CONICTYPST",
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

// Gợi ý dùng thật:
// #let plan = build-exam-plan(question-bank, thpt-2025-matrix, seed: 2026)
// #render-exam-plan(plan, seed: 2026)
// #render-answer-key(plan, seed: 2026)
