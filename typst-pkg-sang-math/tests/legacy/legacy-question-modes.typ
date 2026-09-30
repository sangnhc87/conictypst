#import "../../lib.typ": *

#assert(exam-preset(theme: "ocean", profile: "dethi").mode == "dethi")
#assert(exam-preset(theme: "ocean", profile: "loigiai").mode == "loigiai")
#assert(exam-preset(theme: "ocean", profile: "compact").template.two-columns)
#assert(exam-preset(theme: "ocean", profile: "draft").question.draft)
#assert(exam-preset(theme: "ocean", profile: "beamer").beamer)

#set page(margin: 15mm)
#show: sang-setup

#resetexamstate()
#exam-part([PHẦN I], reset-counter: true)
#tn([Câu trắc nghiệm theo chỉ số], ([Một], [Hai], [Ba], [Bốn]), correct: (2,), id: "TN-1", loigiai: [Đáp án B.])
#tn([Câu trắc nghiệm theo cờ], (True([Đúng]), [Sai]), id: "TN-2")
#ds([Các khẳng định], (True([Đúng]), [Sai], False([Sai]), True([Đúng])), id: "DS-1", ds-style: "list")
#tln([Tính $2+3$.], 5, id: "TLN-1")
#tl([Trình bày lời giải.], loigiai: [Lời giải mẫu.], lines: 2, id: "TL-1")

#exam-part([PHẦN II], reset-counter: true)
#tn([Bắt đầu lại số câu], (True([A]), [B]), id: "TN-3")
#setcau(7)
#tn([Câu số bảy], (True([A]), [B]), id: "TN-4")

#pagebreak()
= Answer key
#print-answer-key()
#sang-omr-qr(ma-de: "0101", width: 2cm)

#pagebreak()
= Variant 0102
#resetexamstate()
#tn([Biến thể với đáp án B], ([A], True([B])), id: "V2-TN")
#ds([Biến thể đúng sai], ([Sai], True([Đúng])), id: "V2-DS")
#print-answer-key()
#sang-omr-qr(ma-de: "0102", width: 2cm)
