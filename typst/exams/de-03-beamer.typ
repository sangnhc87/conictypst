#import "../sang-beamer.typ": *

// Cấu hình slide
#show: sang-beamer-theme.with(
  title: "ĐỀ THI THỬ THPT 2026",
  subtitle: "TOÁN - LỚP 12",
  author: "GV Nguyễn Văn Sang",
  institution: "Sở GD&ĐT ...",
  code: "101",
  total-q: 22,
)

// Câu bắt đầu từ 1 — auto-counter, không cần nhập tay
#bm-resetcau()

// ═══════════════════════════════════════════════════════════
// PHẦN I — Trắc nghiệm
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN I — TRẮC NGHIỆM])

// Câu 1 — num: auto (tự đếm)
#mcq(
  [Đề bài câu 1.],
  ([A], [B], [C], [D]),
  correct: (2,),
  loigiai: [Lời giải.],
)

// Câu 2, 3, ... — không cần num, tự tăng
#mcq(
  [Đề bài câu 2.],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ═══════════════════════════════════════════════════════════
// PHẦN II — Đúng/Sai
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN II — ĐÚNG/SAI])

// num: auto bắt đầu từ 13 (sau 12 TN)
#bm-setcau(13)

#ds(
  [Đề bài câu đúng/sai 1.],
  (
    True([Phát biểu đúng.]),
    [Phát biểu sai.],
    True([Phát biểu đúng.]),
    [Phát biểu sai.],
  ),
)

// ═══════════════════════════════════════════════════════════
// PHẦN III — Trả lời ngắn
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN III — TRẢ LỜI NGẮN])

#bm-setcau(17)

#tln(
  [Đề bài câu điền số 1.],
  [$42$],
)

#het
