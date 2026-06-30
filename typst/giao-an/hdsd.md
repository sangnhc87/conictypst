# HƯỚNG DẪN SỬ DỤNG TEMPLATE GIÁO ÁN TYPST (THPT NGUYỄN HỮU CẢNH)

Đây là tài liệu hướng dẫn (User Guide) dành cho AI và người dùng để hiểu rõ cách biên soạn, cấu trúc và cách xuất từ Giáo án Toán Typst sang DOCX (Word) sao cho đẹp nhất, chuẩn mẫu CTGDPT 2018.

## 1. CẤU TRÚC THƯ MỤC
- `modules/giao-an.typ`: Đây là bộ khung (template) cốt lõi chứa các màu sắc (Navy, Crimson), định dạng bảng biểu mặc định (có viền ngang dọc), định dạng font chữ (Times New Roman), và các cấu trúc hàm giáo án. **KHÔNG ĐƯỢC làm hỏng các quy tắc `show heading` tại đây**, vì nó dùng `set text(...)` kết hợp trả về `it` để Pandoc nhận diện và ánh xạ đúng thẻ `Heading1..4` sang Word.
- `xuat-docx.py`: Kịch bản Python tự động chuyển đổi file `.typ` sang `.docx`, tự động khởi tạo/nạp file `reference.docx` để chèn mã màu Navy/Crimson vào các Tiêu đề Heading Word.
- `khoi-10/`, `khoi-11/`, `khoi-12/`: Chứa các giáo án tương ứng của từng khối.

## 2. QUY TẮC SOẠN NỘI DUNG (DÀNH CHO AI VÀ NGƯỜI DÙNG)

### A. Cấu trúc khởi tạo cơ bản
Mỗi file giáo án cần bắt đầu bằng:
```typst
#import "../modules/giao-an.typ": *

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang", // Mặc định là tên thầy
  ten-bai:   "BÀI 9. TÍCH CỦA MỘT VECTƠ VỚI MỘT SỐ",
  thoi-gian: "2 tiết",
)
```
*(Khối Ký tên ở cuối giáo án sẽ tự động thụt dòng trống để thầy ký, không cần thủ công nhập thêm dòng rỗng).*

### B. Các hàm Tiêu đề (Ánh xạ sang Word Heading)
Để giữ được màu sắc chuẩn khi sang Word:
- `#phan("I", "MỤC TIÊU")`: Tương đương `Heading 1` (Màu Xanh Navy)
- `#muc("1", "Về kiến thức")`: Tương đương `Heading 2` (Màu Đỏ Crimson, in nghiêng)
- `#hd("1", "Khởi động", "5")`: Tương đương `Heading 3` (Màu Đỏ Crimson)
- `#hd-tp("1.1", "Chia nhóm", "2")`: Tương đương `Heading 4` (Màu Xanh Navy)

### C. Các hàm chi tiết của Hoạt động
Luôn gọi các hàm:
- `#mt-hd[Mục tiêu...]` (a) Mục tiêu)
- `#nd-hd[Nội dung...]` (b) Nội dung)
- `#sp-hd[Sản phẩm...]` (c) Sản phẩm)
- `#tc-hd[Tổ chức thực hiện...]` (d) Tổ chức thực hiện)

### D. Bảng biểu (Tables)
Template mặc định đã cấu hình **Bảng có sẵn viền ngang dọc** (kẻ bảng đầy đủ, stroke 0.5pt, màu đen). 
Nếu muốn thay đổi (ví dụ bảng không viền), người dùng hoặc AI có thể tùy biến trực tiếp: 
`#table(stroke: none, ...)`

### E. Toán học
Sử dụng công thức Toán học chuẩn của Typst (`$ ... $`). Hệ thống tự động đẩy Toán inline thành chế độ `math.display` nếu cần thiết (được cài mặc định trong `giao-an.typ`) để phương trình lớn hiển thị rộng rãi, đẹp mắt mà không làm vỡ dòng.

## 3. XỬ LÝ HÌNH ẢNH CETZ (RẤT QUAN TRỌNG)
Pandoc **không hỗ trợ** đọc trực tiếp khối mã `#cetz.canvas(...)` để chuyển sang Word DOCX. Nếu giữ mã CetZ trong file, hình vẽ sẽ biến mất trong DOCX.

**Cách xử lý (Quy trình chuẩn cho AI):**
1. Viết code `#cetz.canvas(...)` vào một file riêng, ví dụ `hinh-1.typ`.
2. Biên dịch file đó ra SVG (chỉ lấy hình): 
   `typst compile hinh-1.typ hinh-1.svg`
3. Trong file giáo án chính (ví dụ `giao-an-10...typ`), chèn hình ảnh bằng:
   `#image("hinh-1.svg", width: 50%)`
*(Bằng cách này, file PDF và file DOCX đều sẽ hiển thị hình ảnh với chất lượng Vector siêu nét!)*

## 4. HƯỚNG DẪN XUẤT FILE DOCX VÀ PDF
**Xuất PDF:** (tại thư mục chứa giáo án)
```bash
typst compile ten-giao-an.typ --root ../..
```
**Xuất DOCX:** (sử dụng script xuat-docx.py)
```bash
python3 ../xuat-docx.py ten-giao-an.typ --open
```
*(Tham số `--open` sẽ tự động mở file Word sau khi xuất xong, đảm bảo màu sắc Heading được kế thừa đầy đủ từ `reference.docx` sinh tự động).*
