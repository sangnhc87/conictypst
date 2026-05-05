#import "../sang-exam.typ": *
#import "../questions.typ": question-bank, qb-pick
#import "../modules/question-bank.typ": render-selection

// 1. Đọc file gói đề được tải về từ Web
#let pack = json("conictypst-exam-pack.json")

// 2. Trích xuất danh sách ID
#let ids = pack.questions.map(q => q.taxonomy.id)

// Cấu hình đề thi
#show: thpt-school-exam.with(
  school: "Sinh ra từ Web",
  exam-title: "ĐỀ THI TỰ CHỌN TỪ WEB EDITOR",
  subject: "TOÁN",
  duration: "90 phút",
  code: "101",
)

// 3. Render toàn bộ câu hỏi đã chọn!
#render-selection(
  qb-pick(question-bank, ..ids),
  mode: "dethi" // Đổi thành "loigiai" nếu muốn in đáp án
)

#het
#print-answer-key()
