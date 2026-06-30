# HƯỚNG DẪN SỬ DỤNG — HỆ THỐNG GIÁO ÁN TYPST
## THPT Nguyễn Hữu Cảnh · Tổ Toán

---

## 📁 Cấu trúc thư mục

```
typst/giao-an/
├── modules/
│   └── giao-an.typ         ← Module core (KHÔNG cần chỉnh)
├── giao-an-mau.typ         ← Mẫu trắng — COPY file này để tạo bài mới
├── vi-du-to10-vecto.typ    ← Ví dụ đầy đủ (Toán 10 — Vectơ)
├── xuat-docx.py            ← Công cụ xuất DOCX
└── HUONG-DAN.md            ← File này
```

---

## 🚀 Tạo giáo án mới (3 bước)

### Bước 1: Copy mẫu
```bash
cd typst/giao-an
cp giao-an-mau.typ giao-an-bai01-nguyen-ham.typ
```

### Bước 2: Mở file và điền thông tin
Chỉnh sửa phần đầu:
```typst
#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",   // ← Giữ nguyên
  to:        "TỔ TOÁN",                  // ← Giữ nguyên
  giao-vien: "Trần Thị B",              // ← Thay tên GV
  ten-bai:   "BÀI 1. NGUYÊN HÀM",      // ← Tên bài học
  thoi-gian: "2 tiết",                  // ← Thời gian
)
```

### Bước 3: Biên dịch PDF
```bash
# Từ thư mục giao-an/
typst compile giao-an-bai01-nguyen-ham.typ --root ../..

# Hoặc biên dịch với font từ thư mục fonts/
typst compile giao-an-bai01-nguyen-ham.typ --root ../.. --font-path ../../fonts
```

---

## 📤 Xuất DOCX (gửi cho Sếp)

```bash
# Cách đơn giản nhất
python3 xuat-docx.py giao-an-bai01-nguyen-ham.typ

# Tự động mở file sau khi xuất
python3 xuat-docx.py giao-an-bai01-nguyen-ham.typ --open

# Đặt tên file output tùy ý
python3 xuat-docx.py giao-an-bai01-nguyen-ham.typ -o "Giáo án Bài 1 Nguyên hàm.docx"
```

### Yêu cầu để xuất DOCX:
| Phương pháp | Cài đặt | Chất lượng |
|-------------|---------|------------|
| **pandoc** (khuyên dùng) | `brew install pandoc` | ⭐⭐⭐ Phương trình đẹp nhất |
| **LibreOffice** (dự phòng) | `brew install --cask libreoffice` | ⭐⭐ Ổn, PDF→DOCX |

---

## ✍️ Các lệnh (macro) quan trọng

### Tiêu đề phần
```typst
#phan("I", "MỤC TIÊU")           // → I. MỤC TIÊU (đỏ đậm)
#muc("1", "kiến thức")            // → 1. Về kiến thức (đỏ nghiêng)
```

### Hoạt động
```typst
#hd(1, "Mở đầu", 10)             // → Hoạt động 1: Mở đầu (10 phút)
#hd-tp("2.1", "Định nghĩa", 30)  // → Hoạt động thành phần 2.1
```

### Bên trong hoạt động
```typst
#ten-hd[Khởi động — Đặt vấn đề]
#mt-hd[HS nắm vững định nghĩa...]       // a) Mục tiêu
#nd-hd[                                   // b) Nội dung
  - HS làm việc nhóm...
]
#sp-hd[                                   // c) Sản phẩm
  - Câu trả lời...
]
#tc-hd[                                   // d) Tổ chức thực hiện
  #buoc(1, "Giao nhiệm vụ", 2)[GV trình bày...]
  #buoc(2, "Thực hiện", 5)[HS thảo luận...]
  #buoc(3, "Báo cáo", 2)[GV mời HS...]
  #buoc(4, "Kết luận", 1)[GV chốt vấn đề...]
]
```

### Luyện tập (Hoạt động 3)
```typst
#dang("1", "Nhận biết")[
  #bai(1, dap-an: [6])[Cho $|arrow(a)| = 2$. Tính $|-3arrow(a)|$.]
]
```

### Năng lực & Phẩm chất
```typst
#nl("Năng lực tư duy")[Phân tích, lập luận...]     // Năng lực con
#nls("3.1.NC1a")[Áp dụng được...]                   // Năng lực số (TT 02/2025)
#pc("Chăm chỉ")[Tích cực tìm tòi...]                // Phẩm chất
```

### Tiện ích
```typst
#vi-du[Cho tam giác $A B C$. Tính $vect(C M) = ?$]   // Ví dụ minh họa
#du-kien[HS có thể nhầm lẫn phép cộng vectơ.]         // Dự kiến khó khăn
#nl-so[_Tạo nội dung số_ (vẽ bằng GeoGebra)...]       // Tích hợp NL số
```

---

## 🔢 Viết công thức Toán

Giáo án Typst hỗ trợ đầy đủ Toán học:

```typst
Vectơ:   $vect(a)$,  $vect(A B)$,  $vect(0)$
Phân số: $frac(1, 2)$,  $frac(a+b, c)$
Căn:     $sqrt(2)$,  $root(3, 8)$
Tổ hợp:  $C_n^k$,  $A_n^k$  (tự động upright C, A)
Tập hợp: $in$, $subset$, $union$, $sect$
Hệ PT:   $cases(x + y = 1, x - y = 0)$
```

---

## 💡 Mẹo

- **Nhiều file cùng lúc**: Đặt tên theo `giao-an-bai[số]-[tên-ngắn].typ`
- **Font đẹp hơn**: Thêm flag `--font-path ../../fonts` khi biên dịch
- **Lưu nhanh PDF**: Dùng extension Typst Preview trong VS Code (xem trực tiếp)
- **Đồng bộ nhóm**: Đặt thư mục `giao-an/` vào Google Drive / shared folder
