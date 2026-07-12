#import "../lib.typ": *

#let preset = exam-preset(
  theme: "navy-gold",
  profile: "dethi",
  opt-style: "solid-hexagon",
  q-label-style: "solid-pill",
  two-columns: false,
  answer-key: true, // Hiển thị đáp án cuối cùng
)
#let (tn, ds, tln, tl) = exam-mode(..preset.question)

// Bật theme nhưng TẮT topbar mặc định để tự vẽ
#show: exam-theme.with(
  theme: preset.theme,
  show-topbar: false,
  watermark: [PREMIUM EXAM],
  ..preset.template,
)

// ==========================================
// TRANG TRÍ HEADER PREMIUM ĐẲNG CẤP
// ==========================================
#align(center)[
  #grid(
    columns: (1fr, auto, 1fr),
    align: (left, center, right),
    [
      #text(size: 11pt, weight: "bold", fill: rgb("#1e3a8a"))[🏫 SỞ GIÁO DỤC VÀ ĐÀO TẠO] \
      #text(size: 11pt, weight: "bold", fill: rgb("#b91c1c"))[TRƯỜNG THPT CHUYÊN SANG-MATH] \
      #line(length: 60%, stroke: 0.5pt + rgb("#1e3a8a"))
    ],
    [],
    [
      #box(
        fill: rgb("#fef3c7"), 
        stroke: 1.2pt + rgb("#d97706"), 
        radius: 4pt, 
        inset: (x: 10pt, y: 6pt)
      )[
        #text(size: 10pt, weight: "bold", fill: rgb("#92400e"))[
          🔑 MÃ ĐỀ: 101
        ]
      ]
    ]
  )
  
  #v(1em)
  // Tiêu đề chính
  #text(
    size: 20pt, 
    weight: "black", 
    fill: rgb("#1e3a8a"),
  )[ĐỀ KIỂM TRA KHẢO SÁT CHẤT LƯỢNG LỚP 12]
  
  #v(0.3em)
  #text(size: 14pt, weight: "bold", fill: rgb("#b45309"))[Môn thi: TOÁN (Chương trình mới 2025)]
  
  #v(0.8em)
  #box(
    fill: rgb("#eff6ff"),
    radius: 6pt,
    inset: (x: 15pt, y: 8pt),
    stroke: 0.5pt + rgb("#bfdbfe")
  )[
    #grid(
      columns: 3,
      gutter: 25pt,
      align: center,
      [#text(size: 11pt, weight: "medium", fill: rgb("#0c4a6e"))[⏱️ Thời gian: 90 phút]],
      [#text(size: 11pt, weight: "medium", fill: rgb("#0c4a6e"))[🗓️ Năm học: 2025 - 2026]],
      [#text(size: 11pt, weight: "medium", fill: rgb("#0c4a6e"))[📝 Hình thức: TN & Tự luận]],
    )
  ]
  
  #v(0.8em)
  #line(length: 100%, stroke: 1.5pt + rgb("#1e3a8a"))
  #v(0.5em)
]

// ==========================================
// KHU VỰC THÔNG TIN THÍ SINH
// ==========================================
#box(width: 100%, stroke: (left: 4pt + rgb("#d97706")), fill: rgb("#fffbeb"), inset: 10pt, radius: 2pt)[
  #text(size: 11pt, weight: "medium", fill: rgb("#92400e"))[
    🧑‍🎓 Họ và tên thí sinh: ........................................................................
    #h(2em) 🎫 Số báo danh: ........................................
  ]
]
#v(1em)

// ==========================================
// NỘI DUNG ĐỀ THI (Load tự động từ file Data)
// ==========================================
#import "05_data_de_thi_mau.typ": make-questions
#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)

#het
