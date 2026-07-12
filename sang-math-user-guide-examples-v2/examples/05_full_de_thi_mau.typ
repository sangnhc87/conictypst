#import "../lib.typ": *

// ========================================================
// CHỌN GIAO DIỆN (THEME) CHO ĐỀ THI
// Hướng dẫn: Chỉ để BỎ COMMENT (xóa dấu //) ở đúng MỘT dòng theme mà thầy muốn dùng.
// Các dòng theme khác thầy thêm // vào đầu để comment lại nhé.
// ========================================================

// 1. TONE CỔ ĐIỂN & TỐI GIẢN
// #let theme = "classic"        // Cổ điển xanh: chuẩn phong cách đề Bộ GD&ĐT
// #let theme = "graphite"       // Xám chì: tối giản, chuyên nghiệp, hợp in đen trắng
// #let theme = "indigo-minimal" // Tối giản xanh lơ: không rườm rà, tập trung nội dung
// #let theme = "print-economy"  // Tiết kiệm mực in: tối ưu in trắng đen 100%

// 2. TONE SANG TRỌNG & ĐẲNG CẤP
// #let theme = "royal"          // Hoàng gia (Xanh/Tím): hộp câu hỏi có khung viền đẳng cấp
// #let theme = "emerald"        // Xanh ngọc lục bảo: sang trọng, tươi mát, êm mắt
// #let theme = "jade"           // Cẩm thạch: tinh tế, quý phái
// #let theme = "navy-gold"      // Xanh Navy Vàng: phong cách cực kỳ cao cấp, hút mắt (ĐANG CHỌN)

// 3. TONE RỰC RỠ & PHÂN HOÁ TỐT
// #let theme = "ocean"          // Đại dương xanh: màu nhẹ nhàng, dịu mắt học sinh
#let theme = "violet"         // Tím mộng mơ: nổi bật, hợp làm đề phân hóa cực trị
// #let theme = "crimson"        // Đỏ sậm: mạnh mẽ, rực rỡ, thích hợp cho đề kiểm tra gắt
// #let theme = "amber"          // Vàng hổ phách: ấm áp, lạ mắt
// #let theme = "teal-pro"       // Xanh mòng két: hiện đại, phong cách Pro cực xịn
// #let theme = "sky"            // Xanh bầu trời: trẻ trung, năng động, tươi sáng
// #let theme = "aurora"         // Cực quang: màu sắc rực rỡ và ảo diệu
// #let theme = "lotus"          // Hồng sen: mềm mại, nữ tính, màu độc lạ
// #let theme = "coral"          // San hô: tươi mới, sáng sủa và rực rỡ
// #let theme = "plum"           // Đỏ mận: quyến rũ, ấn tượng, nổi bật

// ========================================================
// CHỌN CÁC TÙY CHỈNH KHÁC CHO ĐỀ THI
// ========================================================
#let profile = "dethi"         // "dethi": bản học sinh làm, "loigiai": bản giáo viên có đáp án
// KIỂU DÁNG ĐÁP ÁN A, B, C, D (Dành cho phần Trắc nghiệm nhiều phương án)
// Các lựa chọn: "plain" (A. B. C. D.), "circle", "double-circle", "solid-circle", "square", "solid-square", "rounded-square", "diamond", "solid-diamond", "triangle", "solid-triangle", "pentagon", "solid-pentagon", "hexagon", "solid-hexagon", "badge", "calligraphy", "vietnam-star"
#let opt-style = "vietnam-star" // auto = tự lấy kiểu đẹp nhất của theme đang chọn. Nếu muốn ép kiểu khác, đổi auto thành tên kiểu (VD: "vietnam-star")

// KIỂU DÁNG CHỮ "Câu 1", "Câu 2" (Nhãn câu hỏi)
// Các lựa chọn: "plain" (chữ thường), "pill" (bo viên), "solid-pill", "badge", "ribbon" (ruy băng), "flag" (lá cờ), "underline" (gạch chân), "spark" (toả sáng)
#let q-label-style = auto      // auto = tự lấy kiểu đẹp nhất của theme đang chọn. Nếu muốn ép kiểu khác, đổi auto thành tên kiểu (VD: "pill")
#let answer-key = false        // true: In thêm bảng đáp án A-B-C-D ở cuối đề thi
#let two-columns = false       // true: Chia đề thi thành 2 cột

#let preset = exam-preset(
  theme: theme,
  profile: profile,
  opt-style: opt-style,
  q-label-style: q-label-style,
  answer-key: answer-key,
  two-columns: two-columns,
)

// Khởi tạo các hàm sinh câu hỏi theo preset
#let (tn, ds, tln, tl) = exam-mode(..preset.question)

// Kích hoạt giao diện
#show: exam-theme.with(
  theme: preset.theme,
  school: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  exam-title: "ĐỀ KIỂM TRA KHẢO SÁT CHẤT LƯỢNG",
  subject: "TOÁN 12 - CHƯƠNG TRÌNH 2025",
  duration: "90 phút",
  code: "101",
  ..preset.template,
)

// ========================================================
// IMPORT DỮ LIỆU CÂU HỎI TỪ FILE DATA
// Thay vì viết câu hỏi trực tiếp ở đây, ta gọi file Data để tái sử dụng
// ========================================================
#import "05_data_de_thi_mau.typ": make-questions
#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)

// Lời chào kết thúc
#het

// In bảng đáp án (nếu answer-key = true)
#if preset.template.at("answer-key", default: false) {
  print-answer-key()
}
