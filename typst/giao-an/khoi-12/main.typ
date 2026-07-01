#set document(title: "Giáo án Toán Khối 12")
#include "bia.typ"

#set page(numbering: "– 1 –", number-align: center)
#set text(font: "Times New Roman", lang: "vi")

#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  text(size: 12pt, weight: "bold", fill: rgb("0a2342"))[#it]
}
#show outline.entry.where(level: 2): it => {
  h(12pt)
  text(size: 11pt)[#it]
}

#outline(
  title: align(center)[
    #v(4mm)
    #text(size: 16pt, weight: "bold")[MỤC LỤC]
    #v(6mm)
  ],
  depth: 2,
)
#pagebreak()

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 1. Ứng dụng đạo hàm vào khảo sát hàm số]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 1. Ứng dụng đạo hàm vào khảo sát hàm số])
#include "giao-an-12-bai-1-tinh-on-ieu-va-cuc-tri.typ"

#include "giao-an-12-bai-2-gtln-gtnn-cua-ham-so.typ"

#include "giao-an-12-bai-3-uong-tiem-can.typ"

#include "giao-an-12-bai-4-ks-va-ve-t-ham-so.typ"

#include "giao-an-12-bai-5-ung-dung-cua-h-vao-thuc-tien.typ"

#include "giao-an-12-on-tap-chuong-1.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 2. Thống kê]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 2. Thống kê])
#include "giao-an-12-bai-8-bieu-thuc-toa-o.typ"

#include "giao-an-12-bai-9-khoang-bien-thien.typ"

#include "giao-an-12-bai-9-khoang-bt-va-khoang-tu-phan-vi.typ"

#include "giao-an-12-bai-10-phuong-sai.-o-lech-chuan.typ"

#include "giao-an-12-on-tap-chuong-2.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 3. Nguyên hàm và tích phân]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 3. Nguyên hàm và tích phân])
#include "giao-an-12-bai-11-nguyen-ham.typ"

#include "giao-an-12-bai-12-tich-phan.typ"

#include "giao-an-12-bai-13-ung-dung-hh-cua-tp.typ"

#include "giao-an-12-on-tap-chuong-3.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 4. Hình học không gian]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 4. Hình học không gian])
#include "giao-an-12-bai-14-pt-mat-phang.typ"

#include "giao-an-12-bai-15-pt-t-trong-kg.typ"

#include "giao-an-12-bai-16-cong-thuc-tinh-goc-trong-kg.typ"

#include "giao-an-12-bai-17-pt-mat-cau.typ"

#include "giao-an-12-on-tap-chuong-4.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 5. Xác suất]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 5. Xác suất])
#include "giao-an-12-bai-18-xs-co-k.typ"

#include "giao-an-12-bai-19-cong-thuc-xs.typ"

#include "giao-an-12-on-tap-chuong-5.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Bài bổ sung và ôn tập cuối kỳ]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Bài bổ sung và ôn tập cuối kỳ])
#include "giao-an-12-bai-6-vecto-trong-kg.typ"

#include "giao-an-12-bai-7-he-truc-toa-o-trong-kg.typ"

#include "giao-an-12-on-tap-chuong-6.typ"

#include "giao-an-12-hthtn-1-ks-va-vt-voi-phan-men-geogebra.typ"

#include "giao-an-12-hthtn-2-ve-vecto-tong-cua-3-vt.typ"

#include "giao-an-12-hthtn-3-o-dai-gang-tay.typ"

#include "giao-an-12-hthtn-4-tinh-ng-va-tp-bang-geogebra.typ"

#include "giao-an-12-hthtn-5-ve-o-hoa-3d-voi-geogebra.typ"

#include "giao-an-12-on-tap-cuoi-ky-1.typ"
