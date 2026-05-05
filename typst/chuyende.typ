#import "template.typ": *

#show: stexgv-doc.with(
  doc-type: "chuyende",
  title: "CHUYÊN ĐỀ HÀM SỐ",
  subtitle: "Khung biên soạn chuyên đề theo mạch kiến thức",
  author: "GV Nguyễn Văn Sang",
  institution: "Tổ Toán - Tài liệu chuyên sâu",
  subject: "Toán",
  grade: "Lớp 12",
  series: "Ôn thi THPT",
  academic-year: "2025-2026",
  cover-note: [Dùng khung này cho tài liệu chuyên đề dài, có thể chia phần, chương, dạng toán, ví dụ, bài tập và phụ lục tóm tắt.],
)

#gioithieu[
  Đây là khung chuyên đề phục vụ biên soạn tài liệu luyện thi hoặc bồi dưỡng học sinh khá giỏi. Nội dung có thể chia thành nhiều phần, mỗi phần gồm các chương và các dạng toán cụ thể.
]

#muctieuchung[
  - Hệ thống hoá kiến thức về tính đơn điệu, cực trị, tiếp tuyến và các bài toán tối ưu.
  - Chuẩn hoá cách trình bày lời giải theo từng dạng toán.
  - Tách rõ phần lý thuyết nền, ví dụ mẫu, bài tập tự luyện và phụ lục công thức nhanh.
]

#part([Nền tảng lý thuyết và kỹ thuật khảo sát])

#chapter([Khảo sát sự biến thiên của hàm số])

#dang([Điều kiện đơn điệu])

#phuongphap[
  Quy trình chuẩn gồm ba bước:
  - Tìm tập xác định của hàm số.
  - Tính đạo hàm và giải bất phương trình $f'(x) > 0$, $f'(x) < 0$.
  - Kết luận tính đồng biến, nghịch biến trên từng khoảng xác định.
]

#ghinho[
  Không được gộp hai khoảng đơn điệu thành một khoảng lớn hơn nếu giữa chúng có điểm làm hàm số không xác định.
]

#vd(
  [Tìm khoảng đồng biến, nghịch biến của hàm số $y = x^3 - 3x + 1$.],
  loigiai: [
    Ta có $y' = 3x^2 - 3 = 3(x - 1)(x + 1)$.
    Suy ra $y' > 0$ khi $x < -1$ hoặc $x > 1$, còn $y' < 0$ khi $-1 < x < 1$.
    Vậy hàm số đồng biến trên $(-oo; -1)$ và $(1; +oo)$, nghịch biến trên $(-1; 1)$.
  ],
)

#bt(
  [Khảo sát tính đơn điệu của hàm số $y = (x - 1)/(x + 2)$.],
  lines: 4,
)

#dang([Cực trị và tiếp tuyến])

#lythuyet[
  Điểm $x_0$ là điểm cực trị tiềm năng nếu $f'(x_0) = 0$ hoặc đạo hàm không xác định tại $x_0$ nhưng hàm số xác định. Sau đó phải kiểm tra dấu của $f'(x)$ hoặc dùng đạo hàm cấp hai trong trường hợp phù hợp.
]

#nhanxet[
  Bài toán viết phương trình tiếp tuyến thường sai ở bước xác định đúng hoành độ tiếp điểm. Cần tách rõ điều kiện tiếp xúc và điều kiện đi qua điểm cho trước.
]

#vd(
  [Viết phương trình tiếp tuyến của đồ thị $y = x^2 - 2x + 3$ tại điểm có hoành độ $x = 1$.],
  loigiai: [
    Ta có $y' = 2x - 2$ nên tại $x = 1$ thì hệ số góc bằng $0$.
    Điểm tiếp xúc là $(1; 2)$. Vậy tiếp tuyến có dạng $y = 2$.
  ],
)

#cauhoi(
  [Khi nào có thể dùng dấu của đạo hàm bậc nhất để kết luận cực trị mà không cần lập bảng biến thiên đầy đủ?],
  lines: 3,
)

#part([Rèn luyện và mở rộng])

#chapter([Bài toán cực trị và tối ưu])

#dang([Tối ưu hoá hình học và đại số])

#muctieu[
  - Nhận diện điều kiện ràng buộc.
  - Đưa bài toán thực tế về một hàm một biến.
  - Chọn công cụ đạo hàm phù hợp để tìm giá trị lớn nhất, nhỏ nhất.
]

#vd(
  [Trong các hình chữ nhật có chu vi bằng $20$, hình nào có diện tích lớn nhất?],
  loigiai: [
    Gọi hai cạnh là $x$ và $10 - x$, diện tích là $S = x(10 - x) = -x^2 + 10x$.
    Đây là tam thức bậc hai có giá trị lớn nhất tại $x = 5$. Vậy hình vuông cạnh $5$ cho diện tích lớn nhất.
  ],
)

#bt(
  [Một người có $24$ m hàng rào để quây một mảnh vườn hình chữ nhật. Hãy tìm kích thước để diện tích lớn nhất.],
  lines: 4,
)

#appendix([Phụ lục ôn tập nhanh])

#mucphuluc([Bảng nhắc nhanh đạo hàm cơ bản])

#tomtat[
  - $(x^n)' = n x^(n-1)$ với $n in ZZ$ thích hợp.
  - $(sin x)' = cos x$, $(cos x)' = -sin x$.
  - $(ln x)' = 1/x$ với $x > 0$.
]

#bangthuatngu[
  - *Đồng biến*: hàm tăng theo biến số trên một khoảng.
  - *Nghịch biến*: hàm giảm theo biến số trên một khoảng.
  - *Cực trị*: giá trị lớn nhất hoặc nhỏ nhất cục bộ của hàm số.
]

#tailieuthamkhao[
  - Chuyên đề bồi dưỡng học sinh lớp 12.
  - Bộ đề tham khảo kèm lời giải chi tiết.
  - Ghi chép chuyên môn của tổ Toán.
]