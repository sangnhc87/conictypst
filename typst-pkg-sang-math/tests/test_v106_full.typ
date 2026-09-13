#import "@local/sang-math:1.0.6": *

#show: decuong-book.with(
  title: "ĐỀ CƯƠNG TOÁN 10 HỌC KỲ I",
  author: "Thầy Nguyễn Sang",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  subject: "MÔN: TOÁN — LỚP 10",
  year: "NĂM HỌC 2026–2027",
  mode: "loigiai",
  show-cover: true,
  show-toc: true,
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
    Ta lập bảng ma trận suy luận:
    #align(center)[
      #matrix-table(
        headers: ([Tên \\ Môn], [Toán], [Lý], [Hóa]),
        rows: (
          ([Toán], khong, co, khong),
          ([Lý], co, khong, khong),
          ([Hóa], khong, khong, co),
        )
      )
    ]
    Vậy bạn Toán dạy Lý, bạn Lý dạy Toán, bạn Hóa dạy Hóa là sai (bạn Hóa dạy Hóa trùng tên, nên hoán vị phù hợp).
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
    Với $x = 0 in RR$, ta có $0^2 = 0$. Do đó mệnh đề tồn tại là đúng.
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
    - a) Đúng vì $1^2 - 4(1) + 3 = 0$.
    - b) Sai vì $Delta' = 1 > 0$ nên đổi dấu.
    - c) Đúng vì $x = 1, x = 3$.
    - d) Sai vì đỉnh là $I(2; -1)$.
  ]
)

#tln(
  dir: "ngang",
  [Số nghiệm nguyên của bất phương trình $x^2 - 5x + 4 <= 0$ là bao nhiêu?],
  "4",
  loigiai: [
    Bất phương trình tương đương $1 <= x <= 4$.
    Các số nguyên thỏa mãn là $x in {1, 2, 3, 4}$. Vậy có 4 nghiệm.
  ]
)
