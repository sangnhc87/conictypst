#import "template.typ": *

#show: stexgv-doc.with(
  doc-type: "sgk",
  title: "TOÁN HỌC CƠ SỞ",
  subtitle: "Khung SGK mẫu để điền bài học trực tiếp",
  author: "GV Nguyễn Văn Sang",
  institution: "Tổ Toán - Tài liệu nội bộ",
  subject: "Toán",
  grade: "Lớp 10",
  series: "Khung SGK chuẩn hoá",
  academic-year: "2025-2026",
  cover-note: [Dùng tài liệu này làm xương sống cho bài học, hoạt động, ví dụ, luyện tập, vận dụng và phụ lục.],
)

#loinoidau[
  Tài liệu này minh hoạ một khung SGK hoàn chỉnh để sau này chỉ cần thay phần nội dung bài học bằng kiến thức thật.
]

#huongdansudung[
  - Mỗi `#bai(...)` là một bài học độc lập trong cùng chương.
  - Dùng `#muctieu`, `#khoidong`, `#khampha`, `#luyentap`, `#vandung`, `#tomtat` để tạo tiến trình dạy học rõ ràng.
  - Các ví dụ dùng `#vd(...)`, bài tập dùng `#bt(...)`, câu hỏi kiểm tra nhanh dùng `#cauhoi(...)`.
]

#chapter([Mệnh đề và tập hợp])

#bai([Mệnh đề logic])

#muctieu[
  - Nhận biết được mệnh đề và giá trị đúng sai của mệnh đề.
  - Biết viết mệnh đề phủ định của một mệnh đề đơn giản.
  - Vận dụng kí hiệu toán học khi diễn đạt một mệnh đề.
]

#chuanbi[
  Học sinh chuẩn bị bảng phụ nhỏ, bút dạ và ôn lại các phát biểu đã biết trong số học và hình học.
]

#khoidong[
  Xét hai phát biểu sau:
  - "Tam giác đều có ba cạnh bằng nhau."
  - "Số $x$ là số đẹp nhất."

  Hãy chỉ ra phát biểu nào có thể xác định đúng hoặc sai.
]

#khampha[
  Một phát biểu mà ta có thể xác định được là đúng hoặc sai gọi là *mệnh đề*. Những câu cảm thán, câu hỏi hoặc ý kiến mơ hồ không được xem là mệnh đề.
]

#vd(
  [Xét các phát biểu sau và cho biết phát biểu nào là mệnh đề: "2 là số nguyên tố", "Học tốt nhé!", "Tam giác vuông có một góc bằng $90 deg$".],
  loigiai: [
    Hai phát biểu thứ nhất và thứ ba là mệnh đề vì đều xác định được đúng sai. Câu "Học tốt nhé!" là câu cầu khiến nên không phải mệnh đề.
  ],
)

#hoatdongn(
  [Viết một mệnh đề đúng và một mệnh đề sai liên quan đến tập số thực hoặc hình học phẳng.],
  loigiai: [
    Ví dụ mệnh đề đúng: "Tổng ba góc trong của một tam giác bằng $180 deg$".
    Ví dụ mệnh đề sai: "Mọi số nguyên đều là số nguyên tố".
  ],
)

#luyentap[
  - Xác định giá trị đúng sai của các mệnh đề: "$5 > 2$", "$3$ là số chẵn", "Hai đường thẳng phân biệt cùng vuông góc với đường thẳng thứ ba thì song song với nhau".
  - Viết mệnh đề phủ định cho mệnh đề: "Hôm nay trời nắng".
]

#bt(
  [Cho mệnh đề $P$: "Phương trình $x^2 - 1 = 0$ có nghiệm nguyên". Hãy xác định tính đúng sai của $P$ và viết phủ định của $P$.],
  lines: 3,
)

#vandung[
  Hãy phát biểu một mệnh đề gắn với thực tế lớp học của em và nêu cách kiểm tra đúng sai của mệnh đề đó.
]

#tomtat[
  - Mệnh đề là phát biểu có giá trị đúng sai xác định.
  - Phủ định của một mệnh đề đúng là mệnh đề sai và ngược lại.
  - Khi viết toán học, nên dùng kí hiệu ngắn gọn nhưng vẫn phải đảm bảo nghĩa rõ ràng.
]

#bai([Tập hợp và các phép toán trên tập hợp])

#muctieu[
  - Nhận biết được cách mô tả một tập hợp.
  - Biết xác định giao, hợp và hiệu của hai tập hợp đơn giản.
]

#khoidong[
  Liệt kê tập hợp các số tự nhiên nhỏ hơn $6$ và tập hợp các số chẵn nhỏ hơn $10$.
]

#phuongphap[
  Khi xử lí các bài toán tập hợp, nên biểu diễn bằng sơ đồ Ven hoặc liệt kê phần tử trong trường hợp hữu hạn để tránh bỏ sót.
]

#vd(
  [Cho $A = {1, 2, 3, 4}$ và $B = {3, 4, 5}$. Hãy tìm $A union B$, $A inter B$ và $A without B$.],
  loigiai: [
    Ta có $A union B = {1, 2, 3, 4, 5}$, $A inter B = {3, 4}$, $A without B = {1, 2}$.
  ],
)

#bt(
  [Cho $M = {x in ZZ | -2 <= x <= 3}$ và $N = {x in ZZ | x^2 <= 4}$. Tìm $M union N$ và $M inter N$.],
  lines: 3,
)

#morang[
  Có thể dùng kí hiệu điều kiện để mô tả tập hợp vô hạn, ví dụ $A = {x in RR | x > 1}$.
]

#appendix([Phụ lục học tập])

#mucphuluc([Phiếu kiểm tra nhanh cuối bài])

#cauhoi(
  [Hãy viết hai mệnh đề đúng liên quan đến giao và hợp của hai tập hợp bất kỳ.],
  lines: 3,
)

#bangthuatngu[
  - *Mệnh đề*: phát biểu có giá trị đúng sai xác định.
  - *Phủ định*: mệnh đề mang giá trị logic ngược với mệnh đề ban đầu.
  - *Giao của hai tập hợp*: tập hợp gồm các phần tử chung.
  - *Hợp của hai tập hợp*: tập hợp gồm các phần tử thuộc ít nhất một trong hai tập hợp.
]

#tailieuthamkhao[
  - Sách giáo viên Toán THPT.
  - Tài liệu bồi dưỡng giáo viên môn Toán.
  - Bộ câu hỏi luyện tập nội bộ của tổ chuyên môn.
]