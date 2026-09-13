#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 2.5cm, right: 1.5cm)
)
#set text(font: "Times New Roman", size: 14pt)
#set par(justify: true, leading: 1.2em)

#grid(
  columns: (40%, 60%),
  align: (center, center), 
  [
    #text(size: 11pt)[SỞ GD \& ĐT TP.HỒ CHÍ MINH]\
    #text(size: 11pt, weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH]\
    #text(size: 11pt, weight: "bold")[TỔ TOÁN]\
    #v(-0.5em)
    #line(length: 40%, stroke: 0.5pt)
  ],
  [
    #text(size: 11pt, weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM]\
    #text(size: 12pt, weight: "bold")[Độc lập - Tự do - Hạnh phúc]\
    #v(-0.5em)
    #line(length: 60%, stroke: 0.7pt)
  ]
)

#v(1.5cm)
#align(center)[
  #text(size: 14pt, weight: "bold")[KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN]\
  #text(size: 14pt, weight: "bold")[Môn học/Hoạt động giáo dục: Toán]\
  #text(size: 14pt, weight: "bold")[Năm học: 2025 - 2026]
]

#v(0.5cm)
*Họ và tên giáo viên:* Nguyễn Văn Sang

*I. Kế hoạch dạy học* \
*1. Phân phối chương trình* \

#set table(
  stroke: 0.5pt + black,
  inset: 6pt,
)

#table(
  columns: (10%, 35%, 12%, 18%, 25%),
  align: (col, row) => if row == 0 { center + horizon } else if col == 0 or col == 2 or col == 3 { center + horizon } else { left + horizon },
  
  [*STT*], [*Bài học/Chủ đề*], [*Số tiết*], [*Thời điểm*], [*Thiết bị dạy học*],
  [1], [Bài 1: ...], [...], [Tuần 1], [Máy chiếu, thước thẳng...],
  [2], [Bài 2: ...], [...], [Tuần 2], [...],
  [...], [...], [...], [...], [...]
)

#v(0.5cm)
*2. Chuyên đề lựa chọn (nếu có)* \
#table(
  columns: (10%, 35%, 12%, 18%, 25%),
  align: (col, row) => if row == 0 { center + horizon } else if col == 0 or col == 2 or col == 3 { center + horizon } else { left + horizon },
  
  [*STT*], [*Chuyên đề*], [*Số tiết*], [*Thời điểm*], [*Thiết bị dạy học*],
  [1], [Chuyên đề 1: ...], [...], [Tuần ...], [...],
  [2], [Chuyên đề 2: ...], [...], [Tuần ...], [...],
  [...], [...], [...], [...], [...]
)

#v(0.5cm)
*II. Nhiệm vụ khác (nếu có)* \
- Tham gia công tác chủ nhiệm lớp ...
- Tham gia tổ chức các hoạt động ngoại khóa của Tổ Toán và Nhà trường.
- Bồi dưỡng học sinh giỏi khối ...
- Phụ đạo học sinh yếu kém môn Toán khối ...

#v(1cm)
#grid(
  columns: (1fr, 1fr),
  align(center)[
    *TỔ TRƯỞNG CHUYÊN MÔN*\
    _(Ký và ghi rõ họ tên)_
  ],
  align(center)[
    _......., ngày ..... tháng 08 năm 2025_\
    *GIÁO VIÊN*\
    _(Ký và ghi rõ họ tên)_\
    #v(3cm)
    *Nguyễn Văn Sang*
  ]
)
