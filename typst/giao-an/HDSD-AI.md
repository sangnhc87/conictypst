# HDSD — HỆ THỐNG GIÁO ÁN TYPST
## Dành cho AI đọc để hỗ trợ soạn & chuyển đổi giáo án
### THPT Nguyễn Hữu Cảnh · Tổ Toán

---

## 1. MÔ TẢ HỆ THỐNG

Hệ thống giáo án Typst của Tổ Toán — THPT Nguyễn Hữu Cảnh.
- **Ngôn ngữ soạn thảo:** Typst (`.typ`)
- **Xuất PDF:** `typst compile`
- **Xuất DOCX (gửi Sếp):** `python3 xuat-docx.py` (dùng pandoc 3.10)
- **Chuẩn giáo án:** CTGDPT 2018 — 4 hoạt động tiêu chuẩn

**Thư mục làm việc:** `/Users/admin/conictypst/typst/giao-an/`

---

## 2. CẤU TRÚC THƯ MỤC

```
typst/giao-an/
├── modules/
│   └── giao-an.typ          ← Module core (KHÔNG chỉnh sửa)
├── giao-an-mau.typ          ← Mẫu trắng — COPY để tạo bài mới
├── vi-du-to10-vecto.typ     ← Ví dụ đầy đủ tham khảo
├── xuat-docx.py             ← Script xuất DOCX
├── HDSD-AI.md               ← File này (AI đọc để hỗ trợ)
└── HUONG-DAN.md             ← Hướng dẫn cho giáo viên
```

**Quy tắc đặt tên file giáo án:**
```
giao-an-[lop]-[ten-bai-ngan].typ

Ví dụ:
  giao-an-to10-bai09-vecto.typ
  giao-an-to11-bai03-dao-ham.typ
  giao-an-to12-bai01-nguyen-ham.typ
```

---

## 3. CÁC LỆNH THỰC THI

### Biên dịch sang PDF
```bash
cd /Users/admin/conictypst/typst/giao-an

typst compile TEN-FILE.typ --root ../..
```

### Xuất sang DOCX (gửi Sếp)
```bash
cd /Users/admin/conictypst/typst/giao-an

# Xuất + tự mở Word
python3 xuat-docx.py TEN-FILE.typ --open

# Xuất với tên file tùy chỉnh
python3 xuat-docx.py TEN-FILE.typ -o "Giáo án Bài 1.docx" --open
```

### Tạo giáo án mới
```bash
cd /Users/admin/conictypst/typst/giao-an

cp giao-an-mau.typ giao-an-to12-bai01-nguyen-ham.typ
# → Mở file mới, điền nội dung
```

---

## 4. CẤU TRÚC FILE GIÁO ÁN (`.typ`)

Mỗi file giáo án có cấu trúc chuẩn như sau:

```typst
#import "modules/giao-an.typ": *

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",   // Giữ nguyên
  to:        "TỔ TOÁN",                  // Giữ nguyên
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "BÀI [số]. [TÊN BÀI]",
  thoi-gian: "2 tiết",
)

// ════ I. MỤC TIÊU ════════════════════════════════════
#phan("I", "MỤC TIÊU")

#muc("1", "kiến thức")
- [nội dung kiến thức]

#muc("2", "năng lực")
*Năng lực đặc thù (Năng lực Toán học):*
#nl("Năng lực tư duy và lập luận toán học")[...]
#nl("Năng lực mô hình hóa toán học")[...]
#nl("Năng lực giải quyết vấn đề toán học")[...]

*Năng lực chung:*
#nl("Năng lực tự chủ và tự học")[...]
#nl("Năng lực giao tiếp và hợp tác")[...]

*Năng lực số (theo TT 02/2025/TT-BGDĐT):*
#nls("3.1.NC1a")[...]
#nls("3.1.NC1b")[...]

#muc("3", "phẩm chất")
#pc("Chăm chỉ")[...]
#pc("Trách nhiệm")[...]
#pc("Trung thực")[...]

// ════ II. THIẾT BỊ ════════════════════════════════════
#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")

- *Thiết bị dạy học:* Máy chiếu, máy tính, bảng nhóm, giấy A0/A4, bút dạ.
- *Học liệu:*
  - Sách giáo khoa Toán [lớp] — [tên bộ sách].
  - Phiếu học tập...
  - [liệt kê học liệu khác]

// ════ III. TIẾN TRÌNH ═════════════════════════════════
#phan("III", "TIẾN TRÌNH DẠY HỌC")

// Hoạt động 1 — Mở đầu (10 phút)
#hd(1, "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", 10)
[... nội dung HĐ1 ...]

// Hoạt động 2 — Hình thành kiến thức (60 phút)
#hd(2, "Hình thành kiến thức mới/Giải quyết vấn đề", 60)
[... nội dung HĐ2 ...]

// Hoạt động 3 — Luyện tập (15 phút)
#hd(3, "Luyện tập", 15)
[... nội dung HĐ3 ...]

// Hoạt động 4 — Vận dụng (5 phút)
#hd(4, "Vận dụng", 5)
[... nội dung HĐ4 ...]
```

---

## 5. BẢNG TRA CỨU MACRO (Hàm Typst)

### 5.1. Tiêu đề phần

| Macro | Cú pháp | Hiển thị |
|-------|---------|----------|
| Phần chính | `#phan("I", "MỤC TIÊU")` | **I. MỤC TIÊU** (đỏ đậm) |
| Mục con | `#muc("1", "kiến thức")` | *1. Về kiến thức* (đỏ nghiêng) |

### 5.2. Hoạt động

| Macro | Cú pháp | Khi nào dùng |
|-------|---------|--------------|
| Hoạt động chính | `#hd(1, "Mở đầu", 10)` | HĐ1, HĐ2, HĐ3, HĐ4 |
| Hoạt động thành phần | `#hd-tp("2.1", "Định nghĩa", 30)` | Khi HĐ2 chia nhỏ thành 2.1, 2.2... |

### 5.3. Bộ phận bên trong mỗi hoạt động

| Macro | Cú pháp | Ghi chú |
|-------|---------|---------|
| Tên hoạt động | `#ten-hd[Khởi động — Đặt vấn đề]` | Dòng đầu tiên |
| a) Mục tiêu | `#mt-hd[HS hiểu được...]` | Nội dung nằm trên cùng dòng |
| b) Nội dung | `#nd-hd[- GV...\n- HS...]` | Content block, dùng `[...]` |
| c) Sản phẩm | `#sp-hd[- Câu trả lời...]` | Content block |
| d) Tổ chức | `#tc-hd[#buoc(...) #buoc(...)]` | Chứa các bước |
| Bước | `#buoc(1, "Giao nhiệm vụ", 2)[GV...]` | 4 tham số: số, tên, phút, nội dung |
| NL số | `#nl-so[_Tạo nội dung số_ ...]` | Dòng nghiêng đặc biệt |

### 5.4. Luyện tập (Hoạt động 3)

| Macro | Cú pháp |
|-------|---------|
| Dạng bài | `#dang("1", "Nhận biết")[nội dung]` |
| Bài tập | `#bai(1, dap-an: [6])[Đề bài...]` |
| Bài không đáp án | `#bai(2)[Đề bài chứng minh...]` |

### 5.5. Mục tiêu & Phẩm chất

| Macro | Cú pháp |
|-------|---------|
| Phẩm chất | `#pc("Chăm chỉ")[Tích cực...]` |
| Năng lực con | `#nl("Năng lực tư duy")[Phân tích...]` |
| NL số (mã TT) | `#nls("3.1.NC1a")[Áp dụng...]` |

### 5.6. Tiện ích

| Macro | Cú pháp | Dùng khi |
|-------|---------|----------|
| Ví dụ minh họa | `#vi-du[Cho tam giác $ABC$...]` | Cuối bước 4 của mỗi hoạt động |
| Dự kiến khó khăn | `#du-kien[HS nhầm lẫn với...]` | Trong bước 2 (thực hiện) |

---

## 6. CÁCH VIẾT CÔNG THỨC TOÁN (TYPST MATH)

Toán học viết trong `$...$` (inline) hoặc `$ ... $` (block có xuống dòng).

### Ký hiệu thường dùng trong Toán THPT

| Ký hiệu | Typst | Ví dụ |
|---------|-------|-------|
| Vectơ $\overrightarrow{AB}$ | `$vect(A B)$` | `$vect(A B) + vect(B C) = vect(A C)$` |
| Vectơ $\vec{a}$ | `$vect(a)$` | `$vect(a), vect(b), vect(u)$` |
| Vectơ không | `$vect(0)$` | `$k dot vect(0) = vect(0)$` |
| Phân số | `$frac(a, b)$` | `$frac(1, 2) vect(a)$` |
| Căn bậc 2 | `$sqrt(x)$` | `$sqrt(x^2 + y^2)$` |
| Căn bậc n | `$root(3, 8)$` | `$root(n, x)$` |
| Tích phân | `$integral_0^1 f(x) d x$` | |
| Tổng | `$sum_(k=1)^n k$` | |
| Giới hạn | `$lim_(x -> 0) frac(sin x, x)$` | |
| Hệ phương trình | `$cases(x + y = 1, x - y = 0)$` | |
| Tổ hợp | `$C_n^k$` | Tự động thành $C_n^k$ đứng |
| Chỉnh hợp | `$A_n^k$` | Tự động thành $A_n^k$ đứng |
| Mũ | `$x^2$` | `$x^(n+1)$` (dùng `(...)` nếu nhiều ký tự) |
| Chỉ số dưới | `$a_n$` | `$a_(n+1)$` |
| Dấu tuyệt đối | `$|x|$` | `$|vect(A B)|$` |
| In đậm (vectơ) | `$bold(a)$` | Dùng ít, ưu tiên `vect(a)` |
| Logarithm | `$log_a x$` | `$ln x$`, `$log x$` |
| Vô cực | `$+oo$`, `$-oo$` | |
| Thuộc | `$in$` | `$x in RR$` |
| Tập số | `$RR$`, `$ZZ$`, `$NN$` | |
| Góc | `$angle A B C$` | |
| Độ | `$90 degree$` | |
| Song song | `$A B parallel C D$` | |
| Vuông góc | `$perp$` | |
| Tam giác | `$triangle A B C$` | |
| Dấu suy ra | `$=>$` | |
| Tương đương | `$<=>$` | |
| Khác | `$!=$` hoặc `$≠$` | |
| Nhỏ hơn bằng | `$<=$` | |
| Lớn hơn bằng | `$>=$` | |

---

## 7. MẪU TỪNG PHẦN ĐỂ AI ĐIỀN NỘI DUNG

### 7.1. Mẫu Hoạt động 1 (Mở đầu)

```typst
#hd(1, "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", 10)

#ten-hd[Khởi động — [Tên ngắn gọn của tình huống khởi động]]

#mt-hd[[Tạo hứng thú, giúp HS nhớ lại... và bước đầu nhận ra nhu cầu về [chủ đề].]]

#nd-hd[
  - GV đưa ra tình huống thực tiễn: [mô tả...]
  - *Tình huống:* [câu chuyện/bài toán thực tế...]
  - *Nhiệm vụ:*
    - Cá nhân HS suy nghĩ và trả lời: [câu hỏi gợi mở...]
    - HS dùng bút/thước kẻ để phác hoạ...
]

#sp-hd[
  - [Câu trả lời dự kiến của HS...]
  - GV chuẩn hóa: [Kết luận/công thức chuẩn...]
]

#tc-hd[
  #buoc(1, "Giao nhiệm vụ", 1)[GV trình bày tình huống và yêu cầu HS suy nghĩ cá nhân.]
  #buoc(2, "Thực hiện nhiệm vụ", 5)[HS tự nghiên cứu và đưa ra câu trả lời. GV theo dõi, gợi ý. #du-kien[[khó khăn dự kiến...]]]
  #buoc(3, "Báo cáo, thảo luận", 3)[GV mời 1–2 HS trình bày, nhận xét, dẫn dắt đến chủ đề bài học.]
  #buoc(4, "Kết luận, nhận định", 1)[GV chốt vấn đề, ghi tên bài học, chuyển sang Hoạt động 2.]
]
```

### 7.2. Mẫu Hoạt động 2 (Hình thành kiến thức — có thành phần)

```typst
#hd(2, "Hình thành kiến thức mới/Giải quyết vấn đề", 60)

#hd-tp("2.1", "[Tên nội dung kiến thức thứ nhất]", 30)

#ten-hd[Khám phá [Định nghĩa/Tính chất/Định lý]]

#mt-hd[HS nắm vững [định nghĩa/công thức...] thông qua hoạt động khám phá nhóm.]

#nd-hd[
  - HS làm việc nhóm (4–5 HS/nhóm).
  - *Nhiệm vụ:* [mô tả nhiệm vụ cụ thể...]
  #nl-so[_Tạo ra nội dung số_ (vẽ hình bằng GeoGebra) và _Trao đổi, hợp tác_ bằng công cụ số (Zalo/Padlet).]
]

#sp-hd[
  - *Nội dung:* [kiến thức HS rút ra...]
  - *Hình thức:* [hình vẽ GeoGebra / bảng nhóm / sơ đồ tư duy]
]

#tc-hd[
  #buoc(1, "Giao nhiệm vụ", 2)[GV chiếu yêu cầu, chia nhóm.]
  #buoc(2, "Thực hiện nhiệm vụ", 15)[HS thảo luận, đọc SGK. GV quan sát, hỗ trợ.]
  #buoc(3, "Báo cáo, thảo luận", 8)[GV mời đại diện 2 nhóm trình bày, các nhóm khác phản biện.]
  #buoc(4, "Kết luận, nhận định", 5)[GV chuẩn hóa kiến thức. #vi-du[[ví dụ minh họa với công thức toán $...$]]]
]
```

### 7.3. Mẫu Hoạt động 3 (Luyện tập)

```typst
#hd(3, "Luyện tập", 15)

#ten-hd[Củng cố và Phát triển Kỹ năng Vận dụng.]

#mt-hd[HS vận dụng linh hoạt [kiến thức] để giải các bài tập từ cơ bản đến nâng cao.]

#nd-hd[
  Hệ thống bài tập trên Phiếu học tập (hoặc Quizizz/Google Forms):

  #dang("1", "Nhận biết")[
    #bai(1, dap-an: [[đáp án]])[[đề bài mức nhận biết, công thức ngắn gọn...]]
  ]

  #dang("2", "Thông hiểu/Vận dụng")[
    #bai(2, dap-an: [[đáp án]])[[đề bài vận dụng tính chất, rút gọn...]]
  ]

  #dang("3", "Vận dụng cao")[
    #bai(3, dap-an: [[đáp án]])[[đề bài tổng hợp, chứng minh, tìm điều kiện...]]
  ]
]

#sp-hd[Đáp án, lời giải chi tiết cho 3 bài tập.]

#tc-hd[
  #buoc(1, "Giao nhiệm vụ", 1)[GV giao phiếu học tập (hoặc link Quizizz), làm việc cá nhân.]
  #buoc(2, "Thực hiện nhiệm vụ", 8)[HS tự lực giải quyết. GV theo dõi, gợi ý khi cần.]
  #buoc(3, "Báo cáo, thảo luận", 5)[GV mời 3 HS lên trình bày, lớp nhận xét bổ sung.]
  #nl-so[_Tạo ra nội dung số._ (Sản phẩm bài tập trên Google Forms/Quizizz).]
]
```

### 7.4. Mẫu Hoạt động 4 (Vận dụng)

```typst
#hd(4, "Vận dụng", 5)

#ten-hd[Khám phá ứng dụng thực tiễn và mở rộng.]

#mt-hd[Phát triển năng lực mô hình hóa, giúp HS thấy ứng dụng của [chủ đề] trong thực tiễn.]

#nd-hd[
  - *Nhiệm vụ:*
    - Tìm hiểu ứng dụng trong lĩnh vực: [Vật lí / Kinh tế / Kỹ thuật / ...]
    - [Kiến thức mở rộng tùy chọn...]
  - *Yêu cầu:* HS phát hiện/đề xuất vấn đề thực tiễn liên quan.
]

#sp-hd[Bài báo cáo ngắn gọn / hình ảnh / video ứng dụng thực tiễn.]

#tc-hd[
  #buoc(1, "Giao nhiệm vụ", 1)[GV giao nhiệm vụ tìm hiểu ngoài giờ học.]
  #buoc(2, "Thực hiện nhiệm vụ", "Thời gian ở nhà")[HS tìm kiếm thông tin trên mạng, tổng hợp kiến thức.]
  #buoc(3, "Nộp báo cáo", "Buổi học tiếp theo")[GV yêu cầu HS nộp sản phẩm để trao đổi, chia sẻ và đánh giá.]
  #nl-so[_Tìm kiếm và xử lí dữ liệu số_ (tìm kiếm thông tin ứng dụng trên Internet).]
]
```

---

## 8. QUY TRÌNH AI HỖ TRỢ SOẠN GIÁO ÁN

Khi người dùng cung cấp nội dung bài học (tên bài, kiến thức cần dạy, lớp), AI thực hiện theo thứ tự:

### Bước 1: Thu thập thông tin
Hỏi (hoặc suy luận từ yêu cầu):
- Tên GV
- Tên bài (đầy đủ, bao gồm số bài)
- Lớp / Học kỳ / Thời lượng
- Kiến thức trọng tâm cần dạy
- Hoạt động thành phần (nếu HĐ2 chia làm 2.1, 2.2)

### Bước 2: Tạo file Typst
```bash
cp /Users/admin/conictypst/typst/giao-an/giao-an-mau.typ \
   /Users/admin/conictypst/typst/giao-an/[TEN-FILE].typ
```
Rồi điền đầy đủ nội dung theo cấu trúc ở Mục 4 và 7.

### Bước 3: Biên dịch kiểm tra
```bash
cd /Users/admin/conictypst/typst/giao-an
typst compile [TEN-FILE].typ --root ../..
```
Nếu có lỗi: đọc thông báo lỗi và sửa trong file `.typ`.

### Bước 4: Xuất DOCX
```bash
python3 xuat-docx.py [TEN-FILE].typ --open
```

---

## 9. LỖI THƯỜNG GẶP VÀ CÁCH SỬA

| Lỗi | Nguyên nhân | Cách sửa |
|-----|------------|----------|
| `unknown variable: giao-an` | Thiếu `#import "modules/giao-an.typ": *` | Thêm dòng import đầu file |
| `expected content, found ...` | Quên dấu `[` `]` trong content block | Kiểm tra `#nd-hd[...]`, `#tc-hd[...]` |
| Font warning | Font fallback không tìm thấy | Bình thường, vẫn compile được |
| Math error | Sai cú pháp Typst math | Xem Mục 6, kiểm tra dấu ngoặc `(...)` |
| `pandoc: unknown reader: typst` | Pandoc quá cũ (< 3.2) | `brew upgrade pandoc` |
| DOCX không có equation | Pandoc cũ, không hỗ trợ OMML | Nâng cấp pandoc lên 3.10+ |

---

## 10. THÔNG TIN TRƯỜNG

```
Trường:    THPT Nguyễn Hữu Cảnh
Tổ:        Tổ Toán
Tham số:   truong: "THPT NGUYỄN HỮU CẢNH"
           to:     "TỔ TOÁN"
Bộ sách:   (tùy từng khối — hỏi GV)
Chuẩn:     CTGDPT 2018, TT 02/2025/TT-BGDĐT (Năng lực số)
```

---

## 11. VÍ DỤ THAM KHẢO

File ví dụ đầy đủ: [`vi-du-to10-vecto.typ`](vi-du-to10-vecto.typ)

Giáo án: **Bài 9. Tích của một vectơ với một số** (Toán 10)
- HĐ1: Khởi động — Đi tìm "Bản sao" của Vectơ (10')
- HĐ2.1: Định nghĩa tích vectơ với số (30')
- HĐ2.2: Các tính chất phép nhân vectơ với số (30')
- HĐ3: Luyện tập — 3 dạng bài (15')
- HĐ4: Vận dụng — Ứng dụng vật lí (5')
