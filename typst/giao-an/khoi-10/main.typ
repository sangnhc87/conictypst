#set document(title: "Giáo án Toán Khối 10")
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
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 1. Mệnh đề và tập hợp]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 1. Mệnh đề và tập hợp])
#include "giao-an-10-bai-1-menh-e.typ"

#include "giao-an-10-bai-2-tap-hop.typ"

#include "giao-an-10-on-tap-chuong-1.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 2. Bất phương trình bậc nhất hai ẩn]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 2. Bất phương trình bậc nhất hai ẩn])
#include "giao-an-10-bai-3-bpt-bac-nhat-2-an.typ"

#include "giao-an-10-bai-4-h-bpt-bac-nhat-hai-an.typ"

#include "giao-an-10-on-tap-chuong-2.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 3. Hệ thức lượng trong tam giác và vectơ]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 3. Hệ thức lượng trong tam giác và vectơ])
#include "giao-an-10-bai-5-gia-tri-lg-cua-goc-tu-0-en-180.typ"

#include "giao-an-10-bai-6-he-thuc-luong-trong-tan-giac.typ"

#include "giao-an-10-bai-6-he-thuc-luong.typ"

#include "giao-an-10-bai-7-cac-khai-niem-mo-au.typ"

#include "giao-an-10-bai-8-tong-va-hieu-cua-hai-vecto.typ"

#include "giao-an-10-bai-9-tich-cua-mot-vt-voi-mot-so.typ"

#include "giao-an-10-bai-9-tich-vecto-voi-mot-so.typ"

#include "giao-an-10-bai-10-vecto-trong-mat-phang-toa-o.typ"

#include "giao-an-10-bai-11-tich-vo-huong-cua-hai-vt.typ"

#include "giao-an-10-on-tap-chuong-3.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 4. Thống kê]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 4. Thống kê])
#include "giao-an-10-bai-12-so-gan-ung-va-sai-so.typ"

#include "giao-an-10-bai-13-cac-so-ac-trung-o-xu-the-trung-tam.typ"

#include "giao-an-10-bai-14-cac-so-ac-trung-o-o-phan-tan.typ"

#include "giao-an-10-on-tap-chuong-4.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 5. Hàm số và đồ thị]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 5. Hàm số và đồ thị])
#include "giao-an-10-bai-15-ham-so.typ"

#include "giao-an-10-bai-16-ham-so-bac-hai.typ"

#include "giao-an-10-bai-17-dau-cua-tam-thuc-bac-hai.typ"

#include "giao-an-10-bai-18-pt-quy-ve-pt-bac-hai.typ"

#include "giao-an-10-on-tap-chuong-5.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 6. Hình học trong mặt phẳng tọa độ]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 6. Hình học trong mặt phẳng tọa độ])
#include "giao-an-10-bai-19-phuong-trinh-uong-thang.typ"

#include "giao-an-10-bai-20-vi-tri-tuong-oi.typ"

#include "giao-an-10-bai-21-uong-tron-trong-mp-toa-o.typ"

#include "giao-an-10-bai-22-ba-uong-conic.typ"

#include "giao-an-10-on-tap-chuong-6.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 7. Tổ hợp và xác suất]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 7. Tổ hợp và xác suất])
#include "giao-an-10-bai-23-quy-tac-em.typ"

#include "giao-an-10-bai-24-hv-ch-th.typ"

#include "giao-an-10-bai-25-nhi-thuc-newton.typ"

#include "giao-an-10-bai-26-bien-co-va-n-xs.typ"

#include "giao-an-10-bai-27-thuc-hanh-tinh-xs.typ"

#include "giao-an-10-on-tap-chuong-7.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Bài bổ sung và ôn tập cuối kỳ]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Bài bổ sung và ôn tập cuối kỳ])
#include "giao-an-10-on-tap-chuong-8.typ"

#include "giao-an-10-on-tap-chuong-9.typ"

#include "giao-an-10-hthtn-1-tim-hieu-mot-so-kien-thuc-ve-tai-chinh.typ"

#include "giao-an-10-hthtn-2-mang-xa-hoi-loi-va-hai.typ"

#include "giao-an-10-hthtn-3-mot-so-noi-dung-cho-htn-hinh-hoc.typ"

#include "giao-an-10-hthtn-4-uoc-tinh-so-ca-the-trong-quan-the.typ"

#include "giao-an-10-on-tap-cuoi-ky-1.typ"
