#import "sang-exam.typ": *

#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: "dethi", accent: accent)

#show: thpt-school-exam.with(
  school: "ConicTypst Playground",
  exam-title: "MẪU SOẠN NHANH",
  subject: "Typst Workspace",
  duration: "5 phút",
  structure: auto,
  code: "DEMO",
  footer-left: [ConicTypst],
  accent: accent,
)

#exam-part([PHẦN MỞ NHANH], count: 3)

#tn(
  [Bạn đang sửa file trong explorer bên trái và preview cập nhật ở panel bên phải.],
  (
    [Preview chỉ render một file đơn],
    True([Workspace này compile được nhiều file `.typ`]),
    [Monaco không hỗ trợ syntax Typst],
    [Không thể xuất PDF]
  ),
)

#ds(
  [ConicTypst hiện hỗ trợ một workspace Typst nạp sẵn từ thư mục `typst/`.],
  (
    True([Có explorer để mở nhiều file]),
    True([Có thể đổi file entry để render]),
    [Chỉ dùng được đúng một mẫu duy nhất],
    True([Có thể reset về bộ file mẫu ban đầu])
  )
)

#tln(
  [Số panel chính đang hiển thị trong giao diện editor là bao nhiêu?],
  [$3$],
)

#het