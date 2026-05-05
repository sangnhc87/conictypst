// ═══════════════════════════════════════════════════════════
// bank-demo.typ — Demo Smart Query API
// Chạy file này để kiểm tra ngân hàng câu hỏi
// ═══════════════════════════════════════════════════════════
#import "sang-exam.typ": *
#import "questions.typ": question-bank, qb-get, qb-filter, qb-pick, qb-print-stat
#import "modules/question-bank.typ": render-question, render-selection

#show: thpt-school-exam.with(
  school: "DEMO — Smart Query Bank",
  exam-title: "DEMO NGÂN HÀNG CÂU HỎI",
  subject: "TOÁN",
  duration: "---",
  code: "DEMO",
)

// ════════════════════════════════════════════════════════
// 1. THỐNG KÊ TỔNG QUAN
// ════════════════════════════════════════════════════════
#exam-part([THỐNG KÊ NGÂN HÀNG], count: 0)
#qb-print-stat(question-bank)

// ════════════════════════════════════════════════════════
// 2. LẤY CÂU THEO ID CỤ THỂ
// ════════════════════════════════════════════════════════
#exam-part([LẤY CÂU THEO ID], count: 3)

// Cách 1: Dùng qb-get + render-question
#render-question(qb-get(question-bank, "12GT-TI-01"), mode: "loigiai")

// Cách 2: Dùng qb-pick để lấy nhiều câu theo thứ tự tuỳ ý
#render-selection(
  qb-pick(question-bank, "12HH-MC-01", "12HH-DT-01"),
  mode: "loigiai",
)

// ════════════════════════════════════════════════════════
// 3. LỌC THEO MỨC ĐỘ — Lấy tất cả câu NB, TH
// ════════════════════════════════════════════════════════
#exam-part([LỌC: Câu NB + TH (tất cả loại)], count: 0)

#render-selection(
  qb-filter(question-bank, difficulty: ("NB", "TH"), type: "tn"),
  mode: "dethi",
)

// ════════════════════════════════════════════════════════
// 4. LỌC THEO TAG — Lấy câu về oxyz
// ════════════════════════════════════════════════════════
#exam-part([LỌC: Tag = "oxyz"], count: 0)

#render-selection(
  qb-filter(question-bank, tag: "oxyz", status: "ready"),
  mode: "loigiai",
)

// ════════════════════════════════════════════════════════
// 5. LỌC THEO MỨC VDC — Bài khó nhất
// ════════════════════════════════════════════════════════
#exam-part([LỌC: Câu VDC tất cả loại], count: 0)

#render-selection(
  qb-filter(question-bank, difficulty: "VDC"),
  mode: "loigiai",
)

#het