// ═══════════════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ CƯƠNG TOÁN 12 HỌC KỲ I
// ═══════════════════════════════════════════════════════════════════

#import "../../sang-exam.typ": classic

// Chế độ hiển thị: 
//   - "dethi": chỉ hiện đề bài, ẩn lời giải, chừa dòng kẻ chấm nếu có lines
//   - "loigiai": hiện đề bài và lời giải đầy đủ
//   - "solcolor": hiện đề bài và lời giải, tô màu nổi bật đáp án trắc nghiệm
#let mode = sys.inputs.at("mode", default: "dethi")

// Hướng trang giấy:
//   - false: dọc (portrait)
//   - true: ngang (landscape - flipped)
#let landscape = false 

// Số dòng kẻ chấm mặc định cho phần chừa trống của học sinh làm bài (0 để tắt)
#let default-lines = 0

// Màu chủ đề chính
#let theme-color = classic.blue
