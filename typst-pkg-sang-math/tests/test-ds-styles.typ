#import "../lib.typ": *

#set page(width: 210mm, height: auto, margin: 12mm)
#set text(size: 9pt)
#show: sang-setup

#let statements = (
  True([$f'(x)=2x$.]),
  [$f$ luôn nghịch biến trên $RR$.],
)
#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai")

#let render-style(style) = {
  heading(level: 2, outlined: false)[ds-style: #style]
  tf(
    [Xét các phát biểu sau.],
    statements,
    mode: "loigiai",
    ds-style: style,
  )
}

// Hành vi 1.0.3 được giữ nguyên: mặc định vẫn là bảng.
#tf([Kiểu mặc định.], statements)

// Alias được ghi trong HDSD cũ nay hoạt động thật.
#ds([Không dùng bảng.], statements, use-table: false)

// Tương thích thêm với ví dụ cũ từng dùng `table: false`.
#tf([Alias table cũ.], statements, table: false)

#for style in (
  "list",
  "pill",
  "modern",
  "minimal",
  "bookmark",
  "folder",
  "diamond",
  "gradient",
  "checklist",
) {
  render-style(style)
}
