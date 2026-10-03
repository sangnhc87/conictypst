# Hướng Dẫn Phát Triển & Build SCORM - Dự Án ConicTypst (Sang-Math)

Tài liệu này đóng vai trò là "Bản thiết kế" (Blueprint) để hướng dẫn các AI Model khác (GPT-4, Claude, Gemini,...) hoặc các cộng sự kế thừa cách viết code, quy tắc biên dịch và luồng hoạt động của hệ thống SCORM môn Toán trong dự án này.

---

## 1. Cấu Trúc Thư Mục Chuẩn

Kể từ nay, mọi file phục vụ xuất SCORM không để lẫn lộn ở thư mục gốc mà sẽ quy hoạch trong:
```
typst/bai-giang-beamer-scorm/
 ┣ khoi-10/
 ┣ khoi-11/
 ┗ khoi-12/
```
- Các file bài giảng (`.typ`) phải có tiền tố `scorm-` (VD: `scorm-12-bai-3-duong-tiem-can.typ`).

---

## 2. Quy Tắc Soạn Thảo (AI/Model Cần Nhớ Kỹ)

Khi nhận lệnh "soạn thêm đề", "nâng cấp đề", AI phải tuân thủ chuẩn form của Bộ GD&ĐT (Trắc Nghiệm 4 đáp án, Trắc Nghiệm Đúng/Sai, Trả Lời Ngắn) với bộ Macro được tùy biến riêng cho hệ thống này:

### A. Lệnh Macro Khai Báo Câu Hỏi
Hệ thống sử dụng các lệnh: `#my-tn`, `#my-ds`, `#my-tln` (dành cho Khối 12 và hệ thống mới) hoặc `#lt-tn`, `#lt-ds`, `#lt-tln` (ở một số file cũ). Ưu tiên dùng `#my-*`.

**Cú pháp chuẩn Trắc Nghiệm (TN):**
```typst
#my-tn(de: "Toán Thực Tế - Tiệm cận ngang",
  [Nội dung câu hỏi (sử dụng $...$ cho công thức toán)],
  (
    [Đáp án A],
    [Đáp án B],
    [Đáp án C],
    [Đáp án D]
  ),
  correct: 2, // Index đáp án đúng (0=A, 1=B, 2=C, 3=D)
  loigiai: [
    #step[Bước 1: Thiết lập mô hình]
    Nội dung bước 1...
    #step[Bước 2: Tính toán]
    Nội dung bước 2...
  ]
)
```

**Cú pháp chuẩn Đúng/Sai (DS):**
```typst
#my-ds(de: "Đề Đúng/Sai",
  [Nội dung câu hỏi],
  (
    [Mệnh đề a],
    [Mệnh đề b],
    [Mệnh đề c],
    [Mệnh đề d]
  ),
  correct: "1010", // 1=Đúng, 0=Sai tương ứng a, b, c, d
  loigiai: [
    - a) Đúng. Giải thích...
    - b) Sai. Giải thích...
  ]
)
```

**Cú pháp chuẩn Trả Lời Ngắn (TLN):**
```typst
#my-tln(de: "Trả Lời Ngắn",
  [Nội dung câu hỏi],
  [Đáp án (chỉ ghi số/kết quả cuối)],
  loigiai: [
    #step[Bước 1: ...]
    ...
  ]
)
```

### B. Giải step-by-step & Phương pháp Bảng
- BẮT BUỘC sử dụng thẻ `#step[Tiêu đề bước]` trong tham số `loigiai` để học sinh yếu cũng hiểu được trình tự tư duy.
- Khi làm **Toán Đố/Thực tế (như hệ BPT)**: Phải lập bảng `#table(...)` để mô hình hóa đại lượng (X, Y, Đơn giá,...). Hệ thống `build_scorm.py` đã được thiết kế để render bảng này tuyệt đẹp dưới dạng SVG (Dark Mode/Light Mode).
- **Tô màu con số**: Các số liệu xuất hiện trong đề bài khi được lặp lại ở lời giải sẽ tự động được hệ thống bôi màu đồng bộ, do đó AI chỉ cần gõ đúng con số, thuật toán SCORM sẽ tự xử lý hiệu ứng sư phạm!

### C. Quy Tắc Vẽ Hình Học
Theo file `AGENTS.md`, khi bài toán cần đồ thị, hình phẳng, mặt cắt, v.v., **tuyệt đối không** tọa độ hóa thủ công bằng vòng lặp. Bắt buộc dùng thư viện `sang-math-geom.typ`:
```typst
#import "../../../public/hdsd/typst/sang-math-geom.typ": *
```
Sử dụng các hàm đại số dựng hình: `sm-trung-diem`, `sm-giao-diem`, `sm-song-song`, `sm-hinh-chieu`, `sm-doan`, `sm-thiet-dien`, v.v. để tự động hóa vị trí.

Đối với **Bảng biến thiên / Bảng xét dấu**, sử dụng hàm `#my-bbbt(...)` hoặc `#my-bxd(...)` từ file `bbt.typ`.

---

## 3. Quy Trình Biên Dịch SCORM (Pipeline)

Hệ thống có một Pipeline trích xuất Typst sang SCORM cực kỳ mạnh mẽ.

**Bước 1: Chạy lệnh Biên dịch**
Tại thư mục gốc dự án (`conictypst/`), chạy lệnh:
```bash
python3 typst-to-scorm.py typst/bai-giang-beamer-scorm/khoi-12/scorm-12-bai-X...typ
```

**Bước 2: Hệ thống phân tích (parse_typ.py)**
Script này dùng Regex và hàm cân bằng ngoặc `_balance()` để móc toàn bộ đề, đáp án, và `loigiai` ra khỏi cấu trúc Typst. Đã hỗ trợ tự động nhận dạng chuẩn `#my-tn`, `#my-ds`, `#my-tln`.

**Bước 3: Render giao diện SCORM (build_scorm.py)**
- Biên dịch 20-30 trang đầu tiên của file (phần lý thuyết) thành các file ảnh `.svg` nét căng (Vector).
- Xóa bỏ các lỗi khoảng trắng (Whitespace) dư thừa sinh ra từ Typst SVG export.
- Dịch các công thức Toán học inline/display sang chuẩn KaTeX/HTML.
- Đóng gói toàn bộ file `imsmanifest.xml`, `index.html` và thư mục `slides/` vào một file ZIP chuẩn SCORM 1.2.

---

## 4. Ghi Chú Dành Cho AI Khi "Tiếp Quản" Dự Án

*Thông điệp gán vào System Prompt cho AI tiếp theo:*
> "Dự án ConicTypst quản lý khóa học Toán THPT. Mọi file bài tập bạn viết phải dùng `#my-tn`, `#my-ds`, `#my-tln`, giải chi tiết qua `#step[...]`. Mọi file sẽ được xuất SCORM qua lệnh `python3 typst-to-scorm.py`. Nếu bạn thêm mới file, hãy đặt vào `typst/bai-giang-beamer-scorm/khoi-[x]`. Admin có tài khoản email Pro miễn phí mọi tính năng. Khi vẽ hình bắt buộc import `sang-math-geom.typ`."
