// ═════════════════════════════════════════════════════════════════════════════
// HƯỚNG DẪN SỬ DỤNG SANG-MATH 1.0.6 — SÁCH ĐỀ CƯƠNG & MA TRẬN LOGIC
// Lệnh biên dịch: typst compile --root . public/hdsd/typst/hdsd-sang-math-1.0.6.typ public/hdsd/typst/hdsd-sang-math-1.0.6.pdf
// ═════════════════════════════════════════════════════════════════════════════

#import "@local/sang-math:1.0.6": *

#show: decuong-book.with(
  title: "HƯỚNG DẪN SỬ DỤNG SANG-MATH 1.0.6",
  author: "Thầy Nguyễn Sang",
  school: "HỆ THỐNG CONICTYPST",
  subject: "HỆ THỐNG BIÊN SOẠN SÁCH & TOÁN THPT",
  year: "PHIÊN BẢN 1.0.6 — 2026",
  mode: "loigiai",
  show-cover: true,
  show-toc: true,
)

#chuong("GIỚI THIỆU & ĐIỂM MỚI TRONG SANG-MATH 1.0.6", mau: C1)
#bai("HỆ THỐNG SÁCH ĐỀ CƯƠNG TOÀN NĂNG", mau: C1)

#dang("Khai báo và cấu trúc một cuốn sách", mau: C1)

#phuong-phap(mau: C1)[
  - Sử dụng `#import "@local/sang-math:1.0.6": *` hoặc `#import "@preview/sang-math:1.0.6": *`.
  - Khai báo `#show: decuong-book.with(...)` ở đầu file chính `main.typ`.
  - Sử dụng các lệnh cấu trúc phân cấp: `#chuong`, `#bai`, `#dang`, `#phuong-phap`, `#bai-tap-tu-luan`, `#bt-item`, `#bai-tap-trac-nghiem`, `#tn`, `#ds`, `#tln`.
]

#ly-thuyet(tieu-de: "QUY TẮC CHUYỂN ĐỔI CHẾ ĐỘ 1 CHẠM (DUAL-MODE)", mau: C1)[
  - *Chế độ Đề thi* (`mode: "dethi"`):
    + Tự động ẩn toàn bộ khối lời giải trong tự luận và trắc nghiệm.
    + Câu hỏi trắc nghiệm tự động chia 2 cột: bên trái là đề bài, bên phải là ô kẻ chấm `_Bài làm:_` cho học sinh làm bài.
    + Tiết kiệm 50% số trang in khi photocopy tài liệu cho lớp học.
  - *Chế độ Lời giải* (`mode: "loigiai"`):
    + Hiển thị 100% lời giải chi tiết từng bước với khung bo viền màu xanh nhã nhặn.
    + Tô màu nổi bật các phương án đúng.
    + Bố cục 1 cột thoáng đãng, sắc nét chuẩn sách giáo viên.
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [
    Hãy giải thích cách dùng `decuong-preview` khi đang soạn thảo một file bài học đơn lẻ trong IDE.
  ], loigiai: [
    Khi soạn riêng lẻ 1 file bài học (như `bai01-dang01.typ`), ta không muốn sinh ra trang bìa hay mục lục.
    Chỉ cần đặt ở đầu file dòng:
    `#show: decuong-preview.with(mode: "loigiai")`
    Khi cần xem trước bản in học sinh:
    `#show: decuong-preview.with(mode: "dethi")`
  ])
]

#chuong("MA TRẬN SUY LUẬN LOGIC SƯ PHẠM", mau: C2)
#bai("PHƯƠNG PHÁP LẬP BẢNG MA TRẬN LOGIC", mau: C2)

#dang("Giải bài toán suy luận logic 3 đối tượng bằng bảng ma trận", mau: C2)

#phuong-phap(mau: C2)[
  - *Bước 1 (Lập bảng ban đầu)*: Điền các thông tin phủ định trực tiếp từ đề bài bằng ký hiệu #khong (`#khong` hoặc `#no`).
  - *Bước 2 (Nhận — Loại chéo)*: Ô nào nhận #co (`#co` hoặc `#yes`) thì lập tức gạch #khong cho tất cả các ô còn lại trên cùng hàng và cùng cột đó.
  - *Bước 3 (Bảng hoàn thiện)*: Điền đủ toàn bộ ma trận và rút ra kết luận duy nhất cho bài toán.
]

#bai-tap-tu-luan(mau: C2)[
  #bt-item(1, [
    Ba bạn Nam, Bình, Long đạt ba giải Nhất, Nhì, Ba trong kỳ thi học sinh giỏi các môn Toán, Lý, Hóa. Biết:
    - Nam không đạt giải môn Toán.
    - Người đạt giải Nhất học môn Hóa.
    - Bình đạt giải Nhì môn Lý.
    Tìm giải và môn thi của từng bạn.
  ], loigiai: [
    *Bước 1 & 2. Lập bảng ma trận phân tích:*
    #align(center)[
      #matrix-table(
        headers: ([Tên], [Toán], [Lý], [Hóa], [Giải Nhất], [Giải Nhì], [Giải Ba]),
        rows: (
          ([Nam],  khong, khong, co,    co,    khong, khong),
          ([Bình], khong, co,    khong, khong, co,    khong),
          ([Long], co,    khong, khong, khong, khong, co   ),
        )
      )
    ]
    *Bước 3. Kết luận:*
    - Bạn Nam: Giải Nhất môn Hóa.
    - Bạn Bình: Giải Nhì môn Lý.
    - Bạn Long: Giải Ba môn Toán.
  ])
]

#bai-tap-trac-nghiem(mau: C2)

#tn(
  dir: "ngang",
  [Ký hiệu nào trong sang-math 1.0.6 biểu thị giá trị khẳng định "Có" màu xanh lá trong bảng ma trận logic?],
  (
    [`#dung`],
    True([`#co` hoặc `#yes`]),
    [`#true`],
    [`#ok-box`],
  ),
  loigiai: [
    Trong `sang-math:1.0.6`, `#co` và `#yes` hiển thị biểu tượng chữ đậm màu xanh lá: #co.
  ]
)

#ds(
  dir: "doc",
  [Xét tính đúng sai của các nhận định sau về gói `sang-math:1.0.6`:],
  (
    True([Phiên bản 1.0.6 tương thích ngược hoàn toàn với tất cả mã nguồn của bản 1.0.5.]),
    True([Có thể chuyển toàn bộ cuốn sách từ bản đề thi sang bản lời giải chỉ bằng cách thay đổi tham số `mode`.]),
    [Khi ở chế độ `mode: "dethi"`, các lời giải trong `bt-item` vẫn hiển thị bình thường.],
    True([Hàm `decuong-preview` dùng để xem trước một file bài học riêng lẻ mà không sinh trang bìa hay mục lục.]),
  ),
  loigiai: [
    - Ý a) Đúng: `1.0.6` giữ nguyên toàn bộ API của `1.0.5`.
    - Ý b) Đúng: Đây là tính năng đột phá của `decuong-book`.
    - Ý c) Sai: Khi `mode: "dethi"`, 100% lời giải tự động ẩn hoàn toàn.
    - Ý d) Đúng: Rất tiện khi đang soạn thảo từng file dạng bài lẻ.
  ]
)

#tln(
  dir: "ngang",
  [Bảng màu chuẩn `C1` đến `C5` trong `sang-math:1.0.6` tương ứng với bao nhiêu chương học chuẩn của SGK Toán THPT?],
  "5",
  loigiai: [
    Tương ứng với 5 chương: Mệnh đề & Tập hợp ($C_1$), BPT ($C_2$), Hệ thức lượng ($C_3$), Vectơ ($C_4$), Thống kê ($C_5$).
  ]
)
