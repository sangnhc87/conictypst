// ═══════════════════════════════════════════════════════════════════
//  MAIN — ĐỀ CƯƠNG ÔN TẬP TOÁN 10 HỌC KỲ I
// ═══════════════════════════════════════════════════════════════════
// Cách biên dịch:
//   typst compile --root typst typst/sach/DECUONG10-HK1/main.typ typst/sach/DECUONG10-HK1/de-cuong-toan10-hk1.pdf
// Bản compact tiết kiệm giấy:
//   typst compile --root typst --input layout=compact typst/sach/DECUONG10-HK1/main-compact.typ typst/sach/DECUONG10-HK1/de-cuong-toan10-hk1-compact.pdf
// ═══════════════════════════════════════════════════════════════════

#import "preamble.typ": *
#show math.frac: math.display

// ─── CẤU HÌNH CHUNG ──────────────────────────────────────────────
#let truong-cfg = sys.inputs.at("truong", default: "TRƯỜNG THPT NGUYỄN HỮU CẢNH")
#let to-bomon-cfg = sys.inputs.at("to-bomon", default: "TỔ TOÁN")
#let tieu-de-cfg = sys.inputs.at("tieu-de", default: if mode == "loigiai" { "HƯỚNG DẪN GIẢI CHI TIẾT" } else { "TÀI LIỆU HỌC TẬP HỌC KỲ I" })
#let mon-cfg = sys.inputs.at("mon", default: "MÔN: TOÁN — LỚP 10")
#let nam-hoc-cfg = sys.inputs.at("nam-hoc", default: "NĂM HỌC 2026–2027")

#show: de-cuong.with(
  truong:    truong-cfg,
  to-bomon:  to-bomon-cfg,
  tieu-de:   tieu-de-cfg,
  mon:       mon-cfg,
  nam-hoc:   nam-hoc-cfg,
)

// ════════════════════════════════════════════════════════════════
//  CHƯƠNG 1 — MỆNH ĐỀ VÀ TẬP HỢP
// ════════════════════════════════════════════════════════════════
#chuong("Mệnh đề và tập hợp", mau: C1)
#include "chuong-01/bai01-menh-de.typ"
#include "chuong-01/bai02-tap-hop.typ"
#include "chuong-01/bai03-phep-toan-tap-hop.typ"

// ════════════════════════════════════════════════════════════════
//  CHƯƠNG 2 — BẤT PHƯƠNG TRÌNH VÀ HỆ BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN
// ════════════════════════════════════════════════════════════════
#chuong("Bất phương trình và hệ bất phương trình bậc nhất hai ẩn", mau: C2)
#include "chuong-02/bai01-bpt-bac-nhat-hai-an.typ"
#include "chuong-02/bai02-he-bpt-bac-nhat-hai-an.typ"

// ════════════════════════════════════════════════════════════════
//  CHƯƠNG 3 — HỆ THỨC LƯỢNG TRONG TAM GIÁC
// ════════════════════════════════════════════════════════════════
#chuong("Hệ thức lượng trong tam giác", mau: C3)
#include "chuong-03/bai01-gia-tri-luong-giac.typ"
#include "chuong-03/bai02-he-thuc-luong-tam-giac.typ"

// ════════════════════════════════════════════════════════════════
//  CHƯƠNG 4 — VECTƠ
// ════════════════════════════════════════════════════════════════
#chuong("Vectơ", mau: C4)
#include "chuong-04/bai01-khai-niem-mo-dau.typ"
#include "chuong-04/bai02-tong-hieu-vecto.typ"
#include "chuong-04/bai03-tich-vecto-voi-so.typ"
#include "chuong-04/bai04-vecto-toa-do-oxy.typ"
#include "chuong-04/bai05-tich-vo-huong.typ"

// ════════════════════════════════════════════════════════════════
//  CHƯƠNG 5 — CÁC SỐ ĐẶC TRƯNG CỦA MẪU SỐ LIỆU KHÔNG GHÉP NHÓM
// ════════════════════════════════════════════════════════════════
#chuong("Các số đặc trưng của mẫu số liệu không ghép nhóm", mau: C5)
#include "chuong-05/bai01-so-gan-dung-sai-so.typ"
#include "chuong-05/bai02-xu-the-trung-tam.typ"
#include "chuong-05/bai03-do-phan-tan.typ"

#context {
  if mode != "dethi" {
    pagebreak()
    print-answer-key()
  }
}
