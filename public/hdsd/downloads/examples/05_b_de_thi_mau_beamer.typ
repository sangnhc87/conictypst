// ========================================================
// FILE XUẤT TRÌNH CHIẾU BEAMER (SLIDE 16:9)
// ========================================================
#import "../../typst-pkg-submit/sang-beamer.typ": *

#show: sang-beamer-theme.with(
  title: "ĐỀ THI MẪU CHUẨN CẤU TRÚC 2025",
  subtitle: "TOÁN 12"
)

#let mode = "loigiai"
#let _m = exam-mode(mode: mode, accent: classic.blue)

// --------------------------------------------------------
// Nhúng toàn bộ câu hỏi từ file dữ liệu
// --------------------------------------------------------
#import "05_data_de_thi_mau.typ": make-questions
#make-questions(tn: _m.tn, ds: _m.ds, tln: _m.tln, tl: _m.tl, exam-part: exam-part)

#pagebreak()
#print-answer-key()
#het
