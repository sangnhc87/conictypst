#import "../lib.typ": *

// ========================================================
// FILE XUẤT ĐỀ THI IN GIẤY A4
// ========================================================
#let preset = exam-preset(
  theme: "teal-pro",
  profile: "loigiai", // Đổi thành "dethi" để ẩn toàn bộ lời giải
  opt-style: "plain",
  q-label-style: "plain",
  two-columns: false,
  answer-key: true,
)
#let (tn, ds, tln, tl) = exam-mode(..preset.question)

#show: sang-setup.with(math-color: preset.accent)

#show: exam-theme.with(
  theme: preset.theme,
  school: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  exam-title: "ĐỀ KIỂM TRA KHẢO SÁT CHẤT LƯỢNG MÔN TOÁN 12",
  subject: "TOÁN 12 - Chương trình mới 2025",
  duration: "90 phút",
  code: "101",
  ..preset.template,
)

// --------------------------------------------------------
// Nhúng toàn bộ câu hỏi từ file dữ liệu
// --------------------------------------------------------
#import "05_data_de_thi_mau.typ": make-questions
#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)

#het

// Hiển thị bảng đáp án
#if preset.template.at("answer-key", default: false) {
  print-answer-key()
}
