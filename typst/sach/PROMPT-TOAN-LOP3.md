# PROMPT — Tạo Bộ Sách Toán Lớp 3 / Create Grade 3 Math Books (2 Volumes)

> **Sao chép toàn bộ prompt này** và dán vào cửa sổ chat mới với GitHub Copilot (agent mode).  
> The system already has `/Users/admin/conictypst/typst/sach/toan-lop2/` as a working reference.

---

## 🎯 MỤC TIÊU / GOAL

Tạo hai quyển sách Toán Lớp 3 hoàn chỉnh bằng Typst, song ngữ Việt–Anh, chất lượng quốc tế, sẵn sàng in ấn:

- **Quyển I** — `toan-lop3.typ` — Toán Cơ Bản & Tư Duy (~80 trang)  
  *Grade 3 Math: Core Curriculum & Thinking Skills*
- **Quyển II** — `toan-lop3-nc.typ` — Toán Nâng Cao Phát Triển Toàn Diện (~100 trang)  
  *Advanced Math: Comprehensive Enrichment for Top 20% Students*

---

## 📁 CẤU TRÚC FILE / FILE STRUCTURE

Tất cả file đặt tại: `/Users/admin/conictypst/typst/sach/toan-lop3/`

```
toan-lop3/
├── _theme.typ            # Base theme (copy từ lop2, update màu sắc cho lớp 3)
├── _theme-nc.typ         # Advanced theme (bảng màu riêng, macros nâng cao)
│
├── front.typ             # Bìa Quyển I + lời mở đầu + mục lục
├── c1-so-hoc.typ         # Chương 1: Số đến 10,000
├── c2-cong-tru.typ       # Chương 2: Cộng trừ có nhớ nhiều lần
├── c3-nhan-chia.typ      # Chương 3: Nhân/Chia (lên bảng 9, chia có dư)
├── c4-hinh-hoc.typ       # Chương 4: Hình học (chu vi, diện tích cơ bản)
├── c5-phan-so.typ        # Chương 5: Phân số đơn giản (½, ⅓, ¼)
├── back.typ              # Đáp án, bảng nhân chia, chứng chỉ
├── toan-lop3.typ         # Driver Quyển I
│
├── front-nc.typ          # Bìa Quyển II + lời mở đầu + mục lục nâng cao
├── nc1-so-hoc.typ        # Ch1: Tư duy số đến 10k, số nguyên tố, ước/bội
├── nc2-phep-tinh.typ     # Ch2: Tính nhẩm nhanh ×, ÷; phân phối; rút gọn
├── nc3-toan-do.typ       # Ch3: Bài toán có lời (3-4 bước, sơ đồ thanh nâng cao)
├── nc4-hinh-hoc.typ      # Ch4: Hình học (diện tích L-shape, ghép hình, đối xứng)
├── nc5-phan-so.typ       # Ch5: Phân số nâng cao (so sánh, cộng trừ cùng mẫu)
├── nc6-thu-thach.typ     # Ch6: Thử thách Olympiad lớp 3 (SASMO, Kangaroo level)
├── nc-luyen-tap.typ      # Luyện tập mở rộng (đề thi mô phỏng ×3)
├── nc-luyen-tap2.typ     # Khám phá toán học (Số nguyên tố, phân số thú vị, ...)
├── nc-extras.typ         # Đề tổng kết, sách tham khảo, lời kết
├── back-nc.typ           # Đáp án nâng cao, bảng tóm tắt, huy chương
└── toan-lop3-nc.typ      # Driver Quyển II
```

---

## 📚 NỘI DUNG CHI TIẾT / CONTENT DETAILS

### Quyển I — Nội dung chương trình lớp 3

| Chương | Chủ đề | Nội dung chính |
|--------|--------|----------------|
| 1 | Số đến 10,000 | Đọc-viết số, so sánh, làm tròn, tia số đến 10k |
| 2 | Cộng – Trừ | Cộng trừ có nhớ nhiều lần, cột dọc, bài toán văn |
| 3 | Nhân – Chia | Bảng ×6 ×7 ×8 ×9, chia có dư, nhân/chia với 10/100 |
| 4 | Hình Học | Chu vi hình chữ nhật, hình vuông; diện tích = dài×rộng |
| 5 | Phân Số | ½ ⅓ ¼ ⅕ — so sánh phân số đơn giản |

### Quyển II — Nội dung nâng cao (6 chương)

| Chương | Chủ đề EN | Chủ đề VI | Độ khó |
|--------|-----------|-----------|--------|
| 1 | Number Theory | Lý thuyết số (ước, bội, nguyên tố đến 50) | ⭐⭐⭐ |
| 2 | Speed Arithmetic | Tính nhẩm siêu tốc (×11, ×25, bù số nâng cao) | ⭐⭐⭐ |
| 3 | Problem Strategies | Chiến lược (sơ đồ nhánh, bảng 2 chiều, giả thiết) | ⭐⭐⭐⭐ |
| 4 | Advanced Geometry | Hình học (L-shape, T-shape, ghép-cắt hình) | ⭐⭐⭐⭐ |
| 5 | Fractions | Phân số (quy đồng đơn giản, cộng trừ cùng mẫu, ứng dụng) | ⭐⭐⭐ |
| 6 | Thinking Challenges | Thử thách Olympiad Grade 3 | ⭐⭐⭐⭐⭐ |

---

## 🎨 THIẾT KẾ / DESIGN SYSTEM

### Màu sắc Quyển I (lớp 3 — xanh lá/xanh dương tươi sáng)
```typst
#let C-CH = (
  rgb("#0EA5E9"), // Ch1 Sky Blue    — Số Học
  rgb("#10B981"), // Ch2 Emerald     — Cộng Trừ
  rgb("#F59E0B"), // Ch3 Amber       — Nhân Chia
  rgb("#8B5CF6"), // Ch4 Violet      — Hình Học
  rgb("#EF4444"), // Ch5 Red         — Phân Số
)
```

### Màu sắc Quyển II (đậm hơn, premium)
```typst
#let C-CH-NC = (
  rgb("#0369A1"), // Ch1 Deep Blue   — Lý thuyết số
  rgb("#047857"), // Ch2 Deep Green  — Tính nhẩm
  rgb("#B45309"), // Ch3 Brown       — Chiến lược
  rgb("#7C3AED"), // Ch4 Deep Violet — Hình học
  rgb("#BE123C"), // Ch5 Deep Rose   — Phân số
  rgb("#1E3A5F"), // Ch6 Midnight    — Thử thách
)
```

### Macros cần tạo thêm cho lớp 3
```typst
// Sơ đồ phân số trực quan
#let phan-so-hinh(tu:, mau:, c: C-TEAL) = ...

// Bảng nhân/chia  
#let bang-nhan(n:) = ...  // in bảng nhân của n

// Ước số trực quan
#let uoc-so(n:) = ...  // vẽ cây phân tích thừa số

// Bar model nâng cao (cho bài 3-4 bước)
#let bar-model-3(a:, b:, c:, d:, labels:) = ...

// Bài toán về thời gian
#let dong-ho(h:, m:) = ...  // vẽ mặt đồng hồ

// Lưới tọa độ đơn giản
#let luoi-toa-do(size:, ...) = ...
```

---

## ✅ CÁC TIÊU CHUẨN BẮT BUỘC / QUALITY STANDARDS

1. **Bilingual**: Mọi tiêu đề, hộp chiến lược, hướng dẫn đều có song ngữ VI/EN
2. **Singapore Math**: Dùng sơ đồ thanh (bar model) làm phương pháp chủ đạo cho bài toán văn
3. **Olympiad-ready**: Quyển II có ít nhất 15 bài ở mức SASMO/Kangaroo/AMC-8
4. **Visual**: Mỗi bài học ít nhất 1 hình minh họa CeTZ hoặc bảng/grid colorful
5. **Progress tracking**: Có "🌟 Điểm mình đạt được" ở cuối mỗi bài
6. **Parent guide**: back-nc.typ có đáp án đầy đủ + giải thích ngắn
7. **Page target**: Q1 ≥ 75 trang, Q2 ≥ 95 trang

---

## 🔧 THÔNG TIN KỸ THUẬT / TECHNICAL

```
Typst: 0.14.2
CeTZ: 0.5.2 (canvas(length: 1cm, { import draw: * ... }))
Font: "New Computer Modern"
Page: A4, margin: left 2.5cm, right 1.8cm, top 2.2cm, bottom 2.6cm
Root: /Users/admin/conictypst/
```

**Compile commands:**
```bash
# Quyển I:
typst compile --root /Users/admin/conictypst typst/sach/toan-lop3/toan-lop3.typ toan-lop3.pdf

# Quyển II:
typst compile --root /Users/admin/conictypst typst/sach/toan-lop3/toan-lop3-nc.typ toan-lop3-nc.pdf
```

**⚠️ Typst gotchas (bugs đã gặp ở lớp 2, cần tránh):**
1. `#function()` inside `grid()` args → remove `#` (code mode, not content mode)
2. `_text: \_\_\_\_` with no closing `_` → remove leading `_` to avoid unclosed italic
3. `[ / text]` in table cells → `[ \/ text]` to avoid term-list parse
4. CeTZ: use `circle((x,y), radius: (rx,ry))` for ellipse, NOT `ellipse()`
5. CeTZ: space in math: `(r - 0.25)` not `(r-0.25)`
6. `white.transparentize(X%)` IS valid in 0.14.2

---

## 📋 BẮT ĐẦU / HOW TO START

Hãy bắt đầu bằng cách:

1. Đọc file tham khảo: `typst/sach/toan-lop2/_theme-nc.typ` để hiểu cấu trúc theme
2. Tạo thư mục `typst/sach/toan-lop3/`
3. Tạo `_theme.typ` (màu xanh lá/xanh dương cho lớp 3)
4. Tạo `_theme-nc.typ` (màu nâng cao 6 chương)
5. Tạo `front.typ` (bìa Quyển I)
6. Tạo 5 file nội dung `c1-c5.typ`
7. Tạo `back.typ` và `toan-lop3.typ` (driver)
8. Compile → verify ≥ 75 trang
9. Lặp lại cho Quyển II (front-nc, nc1-nc6, nc-luyen-tap ×2, nc-extras, back-nc, driver)

---

## 💡 ĐIỂM KHÁC BIỆT LỚP 3 SO VỚI LỚP 2

| Chủ đề | Lớp 2 | Lớp 3 |
|--------|--------|--------|
| Phạm vi số | đến 1,000 | đến 10,000 |
| Nhân | bảng 2-5 | bảng 2-9 đầy đủ |
| Chia | chia đơn giản | chia có dư, chia cách |
| Hình học | chu vi, đếm ô | + diện tích, ghép hình L/T |
| Phân số | không có | ½ ⅓ ¼ + cộng trừ cùng mẫu |
| Bài toán | 1-2 bước | 3-4 bước, sơ đồ nhánh |
| Logic | số bí ẩn, dãy số | + phép thử, ước/bội, số học mô-đun |
| Olympiad | SEAMO level 1-2 | SASMO, Kangaroo Pré-Ecolier |

---

*Prompt này được tạo tự động dựa trên bộ Toán Lớp 2 đã hoàn thành. Cập nhật khi có thêm yêu cầu.*
