#import "modules/exam.typ": classic
#import "modules/book.typ": *

#show: stexgv-book.with(
  title: "CHUYÊN ĐỀ HÀM SỐ",
  author: "GV Nguyễn Văn Sang",
  theme-color: classic.blue,
)

#chapter([Khảo sát và ứng dụng đạo hàm])

#topic([Cơ sở lý thuyết])

#lythuyet[
  Đạo hàm cho phép mô tả tốc độ biến thiên tức thời của hàm số và là công cụ trọng tâm khi khảo sát tính đơn điệu, cực trị và tiếp tuyến.
]

#ghinho[
  Khi khảo sát một hàm số, ba bước luôn nên đi cùng nhau: xác định tập xác định, tính đạo hàm, rồi xét dấu đạo hàm trên từng khoảng xác định.
]

#dn[
  Hàm số $f$ được gọi là *đồng biến* trên khoảng $I$ nếu với mọi $x_1, x_2 in I$ và $x_1 < x_2$ thì $f(x_1) <= f(x_2)$.
]

#dl[
  Nếu $f'(x) > 0$ với mọi $x in I$ thì $f$ đồng biến trên $I$.
]

#tc[
  Khi lập bảng biến thiên, cần tách riêng các điểm làm hàm số không xác định hoặc làm đổi dấu đạo hàm.
]

#bode[
  Nếu $f'(x) = 0$ trên một khoảng thì $f$ không đổi trên khoảng đó.
]

#note[
  Có thể phối hợp các khối này với màu riêng bằng các tham số `accent`, `fill`, `stroke`, `boxed`.
]

#phuongphap[
  Khi cần tìm khoảng đồng biến và nghịch biến, nên ưu tiên lập bảng xét dấu của $f'(x)$ thay vì suy luận trực tiếp từ biểu thức ban đầu.
]

#nhanxet[
  Với các hàm phân thức hoặc chứa căn, điểm gián đoạn và điểm loại khỏi tập xác định thường là nơi dễ sai nhất khi kết luận tính đơn điệu.
]

#luuy[
  Dù $f'(x) > 0$ trên từng khoảng con, ta vẫn không được kết luận đồng biến trên một khoảng lớn hơn nếu giữa chúng có điểm gián đoạn.
]

#topic([Ví dụ và bài tập])

#setcounter("vd", 2)

#vd(
  [Xét hàm số $y = x^3 - 3x$. Tìm các điểm cực trị của đồ thị.],
  loigiai: [
    Ta có $y' = 3x^2 - 3 = 3(x - 1)(x + 1)$. Suy ra $y' = 0$ khi $x = -1$ hoặc $x = 1$.
    Đạo hàm đổi dấu từ dương sang âm tại $x = -1$ nên đó là điểm cực đại; đổi dấu từ âm sang dương tại $x = 1$ nên đó là điểm cực tiểu.
  ],
)

#bt(
  [Tìm khoảng đồng biến và nghịch biến của hàm số $y = (x - 1)/(x + 2)$.],
  lines: 4,
)