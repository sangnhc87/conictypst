#import "../lib.typ": *

// ========================================================
// ĐỀ MINH HỌA SỬ DỤNG TÍNH NĂNG HYPERLINK TỰ ĐỘNG
// ========================================================
// Hướng dẫn:
// Để sử dụng tính năng Hyperlink (bấm vào câu hỏi nhảy tới lời giải, 
// bấm vào lời giải nhảy về câu hỏi), thầy cô chỉ cần thêm tham số:
// `show-hyperlink: true` vào hàm `exam-mode()`
//
// Yêu cầu quan trọng:
// Cả Đề thi (profile: "dethi") và Lời giải (profile: "loigiai")
// phải ĐƯỢC IN RA TRONG CÙNG 1 FILE (cùng 1 tài liệu PDF)
// thì link nhảy qua lại mới hoạt động được!
// ========================================================

#let theme = "navy-gold"
#let opt-style = "vietnam-star"
#let q-label-style = auto

// --------------------------------------------------------
// BƯỚC 1: TẠO CẤU HÌNH (PRESET) CHUNG
// --------------------------------------------------------
#let preset = exam-preset(
  theme: theme,
  profile: "dethi", // Profile mặc định ban đầu là dethi
  opt-style: opt-style,
  q-label-style: q-label-style,
  answer-key: false, // Bảng đáp án để ở cuối hoặc tắt
  two-columns: false,
)

// Kích hoạt giao diện
#show: exam-theme.with(
  theme: preset.theme,
  school: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  exam-title: "ĐỀ KIỂM TRA CÓ HYPERLINK TỰ ĐỘNG",
  subject: "TOÁN 12 - CHƯƠNG TRÌNH 2025",
  duration: "90 phút",
  code: "101",
  ..preset.template,
)

// Import Data câu hỏi từ file Data dùng chung
#import "05_data_de_thi_mau.typ": make-questions

// ========================================================
// LẦN 1: IN ĐỀ THI (Kích hoạt Hyperlink)
// ========================================================
// Dùng hàm exam-mode với profile "dethi" và show-hyperlink: true
#let (tn, ds, tln, tl) = exam-mode(..preset.question, show-hyperlink: true)

// In phần câu hỏi ra
#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)

#het

#pagebreak()
// ========================================================
// LẦN 2: IN ĐÁP ÁN - LỜI GIẢI CHI TIẾT (Kích hoạt Hyperlink)
// ========================================================
// Dùng hàm exam-mode với profile "loigiai" và show-hyperlink: true
#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai", show-hyperlink: true)

// Quan trọng: Reset lại biến đếm câu hỏi về Câu 1
#resetcau()

// In lại phần câu hỏi (nhưng vì profile là "loigiai", hệ thống sẽ chỉ in Lời giải!)
#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
