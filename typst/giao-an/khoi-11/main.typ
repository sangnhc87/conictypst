#set document(title: "Giáo án Toán Khối 11")
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
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 1. Hàm số lượng giác và phương trình lượng giác]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 1. Hàm số lượng giác và phương trình lượng giác])
#include "giao-an-11-bai-1-gtlg-cua-glg.typ"

#include "giao-an-11-bai-2-cong-thuc-lg.typ"

#include "giao-an-11-bai-3-ham-so-lg.typ"

#include "giao-an-11-bai-4-pt-lg-co-ban.typ"

#include "giao-an-11-on-tap-chuong-1.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 2. Dãy số và cấp số]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 2. Dãy số và cấp số])
#include "giao-an-11-bai-5-day-so.typ"

#include "giao-an-11-bai-6-cap-so-cong.typ"

#include "giao-an-11-bai-7-cap-so-nhan.typ"

#include "giao-an-11-bai-8-mau-so-lieu-ghep-nhom.typ"

#include "giao-an-11-on-tap-chuong-2.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 3. Thống kê]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 3. Thống kê])
#include "giao-an-11-bai-9-cac-so-ac-trung-o-xu-the-trung-tam.typ"

#include "giao-an-11-bai-9-cac-so-dac-trung-do-xu-the-trung-tam.typ"

#include "giao-an-11-on-tap-chuong-3.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 4. Giới hạn và hàm số liên tục]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 4. Giới hạn và hàm số liên tục])
#include "giao-an-11-bai-15-gioi-han-cua-day-so.typ"

#include "giao-an-11-bai-16-gioi-han-cua-ham-so.typ"

#include "giao-an-11-bai-17-ham-so-lien-tuc.typ"

#include "giao-an-11-on-tap-chuong-4.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 5. Hàm số mũ và lôgarit]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 5. Hàm số mũ và lôgarit])
#include "giao-an-11-bai-18-luy-thua-voi-so-mu-thuc.typ"

#include "giao-an-11-bai-19-logarit.typ"

#include "giao-an-11-bai-20-hs-mu-va-hs-logarit.typ"

#include "giao-an-11-bai-21-pt-bpt-mu-va-logarit.typ"

#include "giao-an-11-on-tap-chuong-5.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 6. Đạo hàm]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 6. Đạo hàm])
#include "giao-an-11-bai-31-inh-nghia-va-y-nghia-cua-h.typ"

#include "giao-an-11-bai-32-cac-quy-tac-tinh-ao-ham.typ"

#include "giao-an-11-bai-33-ao-ham-cap-hai.typ"

#include "giao-an-11-on-tap-chuong-6.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 7. Hình học không gian]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 7. Hình học không gian])
#include "giao-an-11-bai-10-t-va-mp-trong-kg.typ"

#include "giao-an-11-bai-11-hai-uong-thang-song-song.typ"

#include "giao-an-11-bai-12-t-song-song-voi-mp.typ"

#include "giao-an-11-bai-13-hai-mp-song-song.typ"

#include "giao-an-11-bai-14-phep-chieu-song-song.typ"

#include "giao-an-11-bai-15-gioi-han-cua-day-so.typ"

#include "giao-an-11-bai-22-hai-t-vuong-goc.typ"

#include "giao-an-11-bai-23-t-vuong-goc-voi-mp.typ"

#include "giao-an-11-bai-24-phep-chieu-vg.typ"

#include "giao-an-11-bai-25-hai-mat-phang-vg.typ"

#include "giao-an-11-bai-26-khoang-cach.typ"

#include "giao-an-11-bai-27-the-tich.typ"

#include "giao-an-11-on-tap-chuong-7.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Chương 8. Xác suất]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Chương 8. Xác suất])
#include "giao-an-11-bai-28-bc-hop,-bc-giao,-bc-oc-lap.typ"

#include "giao-an-11-bai-29-cong-thuc-cong-xac-suat.typ"

#include "giao-an-11-bai-30-cong-thuc-nhan-xs.typ"

#include "giao-an-11-bai-31-inh-nghia-va-y-nghia-cua-h.typ"

#include "giao-an-11-on-tap-chuong-8.typ"

#pagebreak(weak: true)
#align(center + horizon)[
  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Bài bổ sung và ôn tập cuối kỳ]
]
#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Bài bổ sung và ôn tập cuối kỳ])
#include "giao-an-11-on-tap-chuong-9.typ"

#include "giao-an-11-hthtn-1-mot-vai-ung-dung-cua-toan-hoc-trong-tai-chinh.typ"

#include "giao-an-11-hthtn-2-luc-cang-mat-ngoai-cua-nuoc.typ"

#include "giao-an-11-hthtn-3-mot-so-mo-hinh-toan-hoc-su-dung-hs-mu,-hs-logarit.typ"

#include "giao-an-11-hthtn-4-hoat-ong-thuc-hanh-trai-nghiem-hinh-hoc.typ"

#include "giao-an-11-on-tap-hoc-ky-1.typ"
