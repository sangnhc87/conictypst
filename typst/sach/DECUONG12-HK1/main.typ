// ═══════════════════════════════════════════════════════════════════
//  MAIN — ĐỀ CƯƠNG ÔN TẬP TOÁN 12 HỌC KỲ I
//  ═══════════════════════════════════════════
//  Cách dùng:
//    typst compile --root .. main.typ de-cuong-toan12-hk1.pdf
//
//  Cấu trúc thư mục:
//    DECUONG12-HK1/
//    ├── main.typ              ← file này
//    ├── preamble.typ          ← màu sắc + tất cả hộp nội dung
//    ├── chuong-01/
//    │   ├── bai01-don-dieu-cuc-tri.typ
//    │   ├── bai02-gtln-gtnn.typ
//    │   ├── bai03-tiem-can.typ
//    │   ├── bai04-khao-sat-ve-dthi.typ
//    │   └── bai05-ung-dung-thuc-tien.typ
//    ├── chuong-02/
//    │   ├── bai01-vecto-khong-gian.typ
//    │   ├── bai02-toa-do-vecto.typ
//    │   └── bai03-phep-toan-vecto.typ
//    └── chuong-03/
//        ├── bai01-khoang-bien-thien-tu-phan-vi.typ
//        └── bai02-phuong-sai-do-lech-chuan.typ
// ═══════════════════════════════════════════════════════════════════

#import "preamble.typ": *
#show math.frac: math.display


// ─── CẤU HÌNH CHUNG (mặc định cho THPT Nguyễn Hữu Cảnh, có thể ghi đè qua sys.inputs) ─────
#let truong-cfg = sys.inputs.at("truong", default: "TRƯỜNG THPT NGUYỄN HỮU CẢNH")
#let to-bomon-cfg = sys.inputs.at("to-bomon", default: "TỔ TOÁN")
#let tieu-de-cfg = sys.inputs.at("tieu-de", default: if mode == "loigiai" { "HƯỚNG DẪN GIẢI CHI TIẾT" } else { "TÀI LIỆU HỌC TẬP HỌC KỲ I" })
#let mon-cfg = sys.inputs.at("mon", default: "MÔN: TOÁN — LỚP 12")
#let nam-hoc-cfg = sys.inputs.at("nam-hoc", default: "NĂM HỌC 2026–2027")

#show: de-cuong.with(
  truong:    truong-cfg,
  to-bomon:  to-bomon-cfg,
  tieu-de:   tieu-de-cfg,
  mon:       mon-cfg,
  nam-hoc:   nam-hoc-cfg,
)
 

// ════════════════════════════════════════════════════════════════
//  CHƯƠNG 1 — ỨNG DỤNG ĐẠO HÀM ĐỂ KHẢO SÁT VÀ VẼ ĐỒ THỊ HÀM SỐ
// ════════════════════════════════════════════════════════════════
#chuong("Ứng dụng đạo hàm để khảo sát và vẽ đồ thị hàm số", mau: C1)

// #ly-thuyet(tieu-de: "Mục tiêu chương", mau: C1)[
//   Sau khi học xong chương này, học sinh có thể:
//   - Xác định tính đơn điệu, cực trị của hàm số bằng đạo hàm
//   - Tìm giá trị lớn nhất, nhỏ nhất của hàm số trên một đoạn
//   - Xác định đường tiệm cận của đồ thị
//   - Lập bảng biến thiên và vẽ đồ thị hàm số
//   - Vận dụng vào giải toán thực tiễn
// ]

// #muc-do(nhan-biet: 6, thong-hieu: 8, van-dung: 6, van-dung-cao: 4)

// ── Các bài trong Chương 1 ───────────────────────────────────────
#include "chuong-01/bai01-don-dieu-cuc-tri.typ"
#include "chuong-01/bai02-gtln-gtnn.typ"
#include "chuong-01/bai03-tiem-can.typ"
#include "chuong-01/bai04-khao-sat-ve-dthi.typ"
#include "chuong-01/bai05-ung-dung-thuc-tien.typ"
#include "chuong-01/bai06-chuyen-de-tiep-tuyen-tuong-giao.typ"


// ════════════════════════════════════════════════════════════════
//  CHƯƠNG 2 — VECTƠ TRONG KHÔNG GIAN
// ════════════════════════════════════════════════════════════════
#chuong("Vectơ trong không gian", mau: C2)

// #ly-thuyet(tieu-de: "Mục tiêu chương", mau: C2)[
//   Sau khi học xong chương này, học sinh có thể:
//   - Nắm vững khái niệm vectơ trong không gian ba chiều
//   - Thực hiện các phép toán với vectơ trong không gian
//   - Sử dụng tọa độ vectơ để giải bài toán hình học không gian
//   - Tính tích vô hướng, góc giữa hai vectơ; tích có hướng
// ]

// #muc-do(nhan-biet: 4, thong-hieu: 6, van-dung: 5, van-dung-cao: 3)

// ── Các bài trong Chương 2 ───────────────────────────────────────
#include "chuong-02/bai01-vecto-khong-gian.typ"
#include "chuong-02/bai02-toa-do-vecto.typ"
#include "chuong-02/bai03-phep-toan-vecto.typ"
// #include "chuong-02/bai04-chuyen-de-cat-gap-hinh.typ"


// ════════════════════════════════════════════════════════════════
//  CHƯƠNG 3 — CÁC SỐ ĐẶC TRƯNG ĐO MỨC ĐỘ PHÂN TÁN
//             CỦA MẪU SỐ LIỆU GHÉP NHÓM
// ════════════════════════════════════════════════════════════════
#chuong("Các số đặc trưng đo mức độ phân tán của mẫu số liệu ghép nhóm", mau: C3)

// #ly-thuyet(tieu-de: "Mục tiêu chương", mau: C3)[
//   Sau khi học xong chương này, học sinh có thể:
//   - Tính khoảng biến thiên và khoảng tứ phân vị của mẫu số liệu ghép nhóm
//   - Tính phương sai và độ lệch chuẩn của mẫu số liệu ghép nhóm
//   - Đọc và phân tích ý nghĩa thống kê của các số đặc trưng
//   - So sánh mức độ phân tán của hai hay nhiều mẫu số liệu
// ]

// #muc-do(nhan-biet: 3, thong-hieu: 4, van-dung: 4, van-dung-cao: 3)

// ── Các bài trong Chương 3 ───────────────────────────────────────
#include "chuong-03/bai01-khoang-bien-thien-tu-phan-vi.typ"
#include "chuong-03/bai02-phuong-sai-do-lech-chuan.typ"

#context {
  if mode != "dethi" {
    pagebreak()
    print-answer-key()
  }
}
