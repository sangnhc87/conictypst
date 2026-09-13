#import "@local/sang-math:1.0.6": *

#show: decuong-book.with(
  title: "ĐỀ CƯƠNG TOÁN 10 HỌC KỲ I",
  author: "Thầy Nguyễn Sang",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  subject: "MÔN: TOÁN — LỚP 10",
  year: "NĂM HỌC 2026–2027",
  mode: "dethi",
  show-cover: false,
  show-toc: false,
)

#chuong("MỆNH ĐỀ VÀ TẬP HỢP", mau: C1)
#bai("MỆNH ĐỀ TOÁN HỌC", mau: C1)

#dang("Suy luận logic bằng phương pháp lập bảng ma trận", mau: C1)

#phuong-phap(mau: C1)[
  - Lập bảng ma trận liên hệ giữa các đối tượng.
  - Phân tích dữ kiện, điền các dấu loại trừ #khong (#logic-cross).
  - Quét theo từng hàng và cột: Mỗi hàng/cột chỉ có duy nhất một kết quả #co (#logic-check).
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Ba bạn Toán, Lý, Hóa dạy ba môn khác nhau trùng tên ba bạn. Tìm môn dạy của mỗi người biết:
    - Không ai dạy môn trùng tên mình.
    - Bạn Toán lớn tuổi hơn người dạy môn Hóa.
  ], loigiai: [
    Lời giải này phải bị ẩn đi trong bản đề thi!
  ])
]

#bai-tap-trac-nghiem(mau: C1)

#tn(
  dir: "ngang",
  [Mệnh đề nào sau đây là đúng?],
  (
    [$forall x in RR, x^2 > 0$],
    True([$exists x in RR, x^2 = 0$]),
    [$forall n in NN, 2n + 1$ chia hết cho 2],
    [$pi < 3$],
  ),
  loigiai: [
    Lời giải này phải bị ẩn đi trong bản đề thi!
  ]
)

#ds(
  dir: "doc",
  [Cho tam thức bậc hai $f(x) = x^2 - 4x + 3$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([$f(1) = 0$]),
    [$f(x) > 0$ với mọi $x in RR$],
    True([Phương trình $f(x) = 0$ có hai nghiệm phân biệt.]),
    [Đỉnh của parabol là $I(2; 1)$],
  ),
  loigiai: [
    Lời giải này phải bị ẩn đi trong bản đề thi!
  ]
)

#tln(
  dir: "ngang",
  [Số nghiệm nguyên của bất phương trình $x^2 - 5x + 4 <= 0$ là bao nhiêu?],
  "4",
  loigiai: [
    Lời giải này phải bị ẩn đi trong bản đề thi!
  ]
)
