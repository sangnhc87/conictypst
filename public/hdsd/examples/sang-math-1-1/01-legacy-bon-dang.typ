// Tình huống 01: Giữ nguyên cách viết sang-math 1.0.6 khi chuyển sang 1.1.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 20mm)
#show: sang-setup

= Kiểm tra nhanh — 4 dạng câu

#tn([Tính $2+3$.], ([$4$], True([$5$]), [$6$], [$7$]), id: "TN01", loigiai: [$2+3=5$.])
#ds([Xét số $6$.], (True([Số $6$ là số chẵn.]), [$6$ là số nguyên tố.], True([$6$ chia hết cho $3$.]), [$6<0$.]), id: "DS01")
#tln([Tính $3^2$.], [9], id: "TLN01", loigiai: [$3^2=9$.])
#tl([Chứng minh tổng hai số chẵn là số chẵn.], loigiai: [Viết hai số là $2m$ và $2n$; tổng bằng $2(m+n)$.])

#pagebreak()
= Đáp án giáo viên
#print-answer-key()
