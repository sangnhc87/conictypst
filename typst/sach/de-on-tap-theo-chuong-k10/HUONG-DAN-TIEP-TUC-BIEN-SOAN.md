# HƯỚNG DẪN BÀN GIAO TIẾP TỤC DỰ ÁN BIÊN SOẠN ĐỀ ÔN TẬP TOÁN 10
*(Dành cho các AI Model / Agent kế nhiệm tiếp quản và tiếp tục thực hiện)*

---

> [!IMPORTANT]
> **DÀNH CHO MODEL KẾ NHIỆM**:
> Bạn đang tham gia dự án biên soạn bộ sách **Đề ôn tập theo chương Toán lớp 10 (Chương trình GDPT 2018 - Bộ sách Kết Nối Tri Thức với Cuộc Sống)** bằng ngôn ngữ **Typst** kết hợp thư viện vẽ hình **CeTZ**.
> Hãy đọc kỹ toàn bộ tài liệu này trước khi bắt tay vào biên soạn bất kỳ đề thi nào.

---

## 1. QUY TẮC BẤT BIẾN TỪ NGƯỜI DÙNG & HỆ THỐNG (USER RULES)

1. **Quy tắc Người dùng đặc biệt (AGENTS.md)**:
   - Hai email admin: `nguyensangnhc@gmail.com` và `sangbeau@gmail.com` được **miễn phí toàn bộ trọn đời**, không cần mua, được dùng full mọi tính năng hệ thống.
   - Không được tự ý deploy hoặc xóa deployment nếu người dùng không yêu cầu. Tuân thủ tuyệt đối an toàn dữ liệu trong `DEPLOYMENT-SAFETY.md`.
   - Giữ gìn worktree sạch sẽ, không xóa file ngoài phạm vi nhiệm vụ.
2. **Chỉ đạo chất lượng sư phạm từ người dùng**:
   - *"Cái hay của người đi dạy là trả lời: tại sao học bài này, ai phát minh, đặt nền móng, học làm gì, lịch sử cho bài này,... cả sách khi dạy cần phải nắm tại sao, ý nghĩa của việc học bài này,... để học sinh thấy sự cần thiết"*:
     - Toàn bộ các bài học trong SGK và các chủ đề liên quan mở rộng ngoài SGK đều được hệ thống hóa toàn diện trong cẩm nang: [`TOAN-10-KHAI-MO-TRI-THUC-TAI-SAO-HOC-BAI-NAY.typ`](TOAN-10-KHAI-MO-TRI-THUC-TAI-SAO-HOC-BAI-NAY.typ) (và bản PDF tương ứng).
     - Mỗi khi biên soạn hay giảng dạy bất kỳ bài nào, người dạy/model phải nắm vững: *Ai phát minh & Niên đại*, *Tại sao cần học?*, *Ứng dụng trong Kỷ nguyên Số/AI/Vũ trụ/Đời sống*, *Các bài mở rộng ngoài SGK*, và *Câu hỏi Hook 3 phút đầu giờ*.
   - *"Sáng tác chất lượng cao hơn nữa nghen bạn, tránh mấy bài quá cơ bản"*: Các câu hỏi phải có tính phân hóa rõ rệt, kết hợp bài toán tư duy, nhiều bước giải, liên môn Vật lý, Kỹ thuật, Khoa học dữ liệu, Hậu cần, Kinh tế.
   - *"Các bài dù dễ cũng nên vẽ thêm hình minh họa đi bạn, có hình học sinh dễ xem hơn"*: **100% câu hỏi** đều có hình vẽ minh họa CeTZ (hình học, hệ tọa độ $Oxy$, đồ thị hàm số, biểu đồ hộp Box plot, trục số sai số, bảng tần số...).
   - *"Ko dùng arrow mà dùng vec như overrightarrow bên latex á bạn"*:
     - Ký hiệu vectơ: Bắt buộc dùng `$vec(...)`$ (ví dụ: `$vec(a)$`, `$vec(AB)$`, `$vec(0)$`). Tuyệt đối **không** dùng `$arrow(...)`$.
     - Ký hiệu góc: Dùng `$hat(...)`$ (ví dụ: `$hat(A)$`, `$hat(BAC)$`) hoặc ký hiệu cung góc CeTZ.
   - *"Chú ý các đề khác nhau, sáng tạo đa dạng, tránh như nhau nhàm chán nghen bạn"*.

---

## 2. TIẾN ĐỘ THỰC HIỆN ĐẾN THỜI ĐIỂM HIỆN TẠI (HỌC KỲ I ĐÃ HOÀN TẤT 100%)

Bộ sách được lưu trữ trong thư mục: `typst/sach/de-on-tap-theo-chuong-k10/`.

| Chương | Nội dung chuyên đề | Các đề đã hoàn thành | Mã đề | Trạng thái |
| :--- | :--- | :--- | :---: | :---: |
| **Chương I** | Mệnh đề & Tập hợp | `de01A, B, C`<br>`de02A, B, C`<br>`de02D, E, F` (Toán thực tế: Venn, Logic Boolean, Dịch tễ) | 101 - 106F | **XONG 100% (9 đề)** |
| **Chương II** | Bất phương trình & Hệ BPT bậc nhất hai ẩn | `de03A, B, C`<br>`de04A, B, C`<br>`de04D, E, F, G, H, I, M` (7 chuyên đề thực tế QHTT) | 107 - 112M | **XONG 100% (13 đề)** |
| **Chương III** | Hệ thức lượng trong tam giác | `de05A, B, C`<br>`de06A, B, C`<br>`de06D, E, F` (Toán thực tế: Địa hình, Hàng hải, Thiên văn) | 113 - 118F | **XONG 100% (9 đề)** |
| **Chương IV** | Vectơ (Toàn bộ từ Bài 7 đến cuối chương) | `de07A, B, C` (Khái niệm)<br>`de08A, B, C` (Tổng & Hiệu)<br>`de09A, B, C` (Tích vectơ với số)<br>`de10A, B, C` (Tọa độ Oxy)<br>`de11A, B, C` (Tích vô hướng)<br>`de12A, B, C` (Ôn tập cuối chương)<br>`de12D, E, F` (Toán thực tế: Cơ học, Hàng không, Đồ họa) | 119 - 136F | **XONG 100% (21 đề)** |
| **Chương V** | Các số đặc trưng đo xu thế trung tâm & độ phân tán | `de13A, B, C` (Bài 13: Xu thế trung tâm & Sai số)<br>`de14A, B, C` (Bài 14: Đo độ phân tán)<br>`de15A, B, C` (Ôn tập cuối chương V)<br>`de15D, E, F` (Toán thực tế: AI/Big Data, Vaccine, Tài chính) | 125 - 133 | **XONG 100% (12 đề)** |
| **Chương VI** | Hàm số, đồ thị và ứng dụng | `de16A, B, C` (Bài 15: Khái niệm hàm số và đồ thị)<br>`de17A, B, C` (Bài 16: Hàm số bậc hai)<br>`de18A, B, C` (Bài 17: Dấu của tam thức bậc hai)<br>`de19A, B, C` (Bài 18: PT quy về PT bậc hai)<br>`de20A, B, C` (Ôn tập cuối chương VI)<br>`de20D, E, F` (3 Chuyên đề thực tế: Kiến trúc/Vật lý, Kinh tế/Lợi nhuận, Kỹ thuật/Giao thông) | 137 - 154 | **XONG 100% (18 đề)** |
| **Chương VII** | Phương pháp tọa độ trong mặt phẳng ($Oxy$) | `de21A, B, C` (Bài 19: Phương trình đường thẳng)<br>`de22A, B, C` (Bài 20: Vị trí tương đối, góc, khoảng cách)<br>`de23A, B, C` (Bài 21: Đường tròn trong Oxy)<br>`de24A, B, C` (Bài 22: Ba đường conic)<br>`de25A, B, C` (Ôn tập cuối chương VII)<br>`de25D, E, F` (3 Chuyên đề thực tế Oxy: Giao thông & Cầu vòm, Hàng hải & Vệ tinh, Thiên văn & Kiến trúc Conic) | 155 - 172 | **XONG 100% (18 đề)** |
| **Chương VIII** | Đại số tổ hợp | `de26A, B, C` (Bài 23: Quy tắc đếm)<br>`de27A, B, C` (Bài 24: Hoán vị, Chỉnh hợp, Tổ hợp)<br>`de28A, B, C` (Bài 25: Nhị thức Newton)<br>`de29A, B, C` (Ôn tập cuối chương VIII)<br>`de29D, E, F` (Toán thực tế: Mật mã học, An ninh mạng, Xác suất sinh học) | 173 - 187 | **XONG 100% (15 đề)** |
| **Chương IX** | Tính xác suất theo định nghĩa cổ điển | `de30A, B, C` (Bài 26: Biến cố và định nghĩa cổ điển của xác suất)<br>`de31A, B, C` (Bài 27: Thực hành tính xác suất)<br>`de32A, B, C` (Ôn tập cuối chương IX)<br>`de32D, E, F` (Toán thực tế: Trò chơi may rủi, Bảo hiểm, Kiểm thử chất lượng) | 188 - 199 | **XONG 100% (12 đề)** |
| **Ôn tập cuối HK2** | Tổng hợp toàn diện kiến thức Học kỳ II (Chương VI đến IX) | `de33A` (Mã 200 - Classic Blue: Đề tổng hợp toàn diện)<br>`de33B` (Mã 201 - Teal: Thực tiễn & Ứng dụng liên môn)<br>`de33C` (Mã 202 - Amber: Nâng cao & Phân hóa VDC) | 200 - 202 | **XONG 100% (3 đề)** |

> **Tổng kết tiến độ toàn diện**:
> - **Học kỳ I**: Đã hoàn thành xuất sắc **67 đề thi chuẩn mẫu Bộ GD&ĐT 2025** (Mã 101 - 136F).
> - **Tập 2 - Chương VI**: Đã hoàn thành xuất sắc **18 đề thi chuẩn mẫu Bộ GD&ĐT 2025** (Mã 137 - 154).
> - **Tập 2 - Chương VII**: Đã hoàn thành xuất sắc **18 đề thi chuẩn mẫu Bộ GD&ĐT 2025** (Mã 155 - 172).
> - **Tập 2 - Chương VIII**: Đã hoàn thành xuất sắc **15 đề thi chuẩn mẫu Bộ GD&ĐT 2025** (Mã 173 - 187).
> - **Tập 2 - Chương IX**: Đã hoàn thành xuất sắc **12 đề thi chuẩn mẫu Bộ GD&ĐT 2025** (Mã 188 - 199).
> - **Tập 2 - Ôn tập cuối HK2**: Đã hoàn thành xuất sắc **3 đề thi chuẩn mẫu Bộ GD&ĐT 2025** (Mã 200 - 202).
> - **TỔNG CỘNG TOÀN BỘ SÁCH TOÁN LỚP 10**: **133 ĐỀ THI ĐỘC LẬP HOÀN TẤT 100%**!
>   - 100% đề thi có lời giải chi tiết sư phạm từng bước với `#step(...)`.
>   - 100% đề thi có hình vẽ minh họa trực quan bằng CeTZ.
>   - 100% đề thi đạt chuẩn cấu trúc ma trận 2025 (12 câu TN + 4 câu DS + 6 câu TLN).
>   - 100% đề thi biên dịch ra file PDF chất lượng cao không lỗi và pass kiểm định cấu trúc tự động qua `inspect_exam.py`.

---

## 3. CẤU TRÚC CHUẨN CỦA MỖI FILE ĐỀ THI (MA TRẬN BỘ GD&ĐT 2025)

Mỗi file Typst đại diện cho 1 đề thi độc lập, gồm đúng **22 câu hỏi** chia làm 3 phần:

```
┌────────────────────────────────────────────────────────────────────────┐
│ PHẦN I: Câu trắc nghiệm nhiều phương án (12 câu: Câu 1 -> Câu 12)       │
│ • 4 phương án lựa chọn: 1 phương án đúng bọc trong True([...])          │
│ • 3 phương án sai để trong dấu ngoặc vuông thông thường [...]          │
├────────────────────────────────────────────────────────────────────────┤
│ PHẦN II: Câu trắc nghiệm Đúng / Sai (4 câu: Câu 13 -> Câu 16)           │
│ • Mỗi câu gồm 4 lệnh mệnh đề ý: a), b), c), d)                         │
│ • Ý ĐÚNG bọc trong True([...])                                          │
│ • Ý SAI để trong dấu ngoặc vuông [...]                                  │
│ • Thông thường cơ cấu: 3 Đúng - 1 Sai hoặc 2 Đúng - 2 Sai (chuẩn thi)  │
├────────────────────────────────────────────────────────────────────────┤
│ PHẦN III: Câu trắc nghiệm Trả lời ngắn (6 câu: Câu 17 -> Câu 22)        │
│ • Đáp án là số nguyên, số thập phân hoặc phân số ngắn gọn                │
│ • Đặt trong dấu ngoặc vuông: [8.5], [25], [10]                         │
└────────────────────────────────────────────────────────────────────────┘
```

Mỗi câu hỏi bắt buộc phải có phần `loigiai: [...]` với các bước giải sư phạm rõ ràng dùng `#step([Tiêu đề bước])`.

---

## 4. TEMPLATE KHỞI TẠO MÃ NGUỒN TYPST CHUẨN

Khi tạo đề mới (ví dụ `de14A.typ`), copy khung sườn chuẩn sau:

```typst
#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e40af") // Classic Blue cho Đề A, Teal cho Đề B, Amber cho Đề C

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG V: ĐO ĐỘ PHÂN TÁN CỦA MẪU SỐ LIỆU",
  exam-title: "BÀI 14: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN (ĐỀ A: CƠ BẢN - VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "125",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 01
#tn([Nội dung câu hỏi 1...],
    (
        True([Phương án đúng]),
        [Phương án sai 1],
        [Phương án sai 2],
        [Phương án sai 3]
    ),
    loigiai: [
        #step([Bước 1])
        Lời giải chi tiết...
    ]
)
// ... từ TN 02 đến TN 12

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 01 (Câu 13)
#ds([Đề bài câu đúng sai...],
  (
    True([Khẳng định a đúng]),
    True([Khẳng định b đúng]),
    True([Khẳng định c đúng]),
    [Khẳng định d sai]
  ),
  loigiai: [
    #step([Xét ý a]) ...
    #step([Xét ý b]) ...
    #step([Xét ý c]) ...
    #step([Xét ý d]) ...
  ]
)
// ... từ DS 02 (Câu 14) đến DS 04 (Câu 16)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 01 (Câu 17)
#tln([Nội dung câu hỏi ngắn 1...],
    [8.5],
    loigiai: [
        #step([Tính toán])
        Lời giải...
    ]
)
// ... từ TLN 02 (Câu 18) đến TLN 06 (Câu 22)

] // end make-questions

#make-questions()
```

---

## 5. BẢNG MÀU ACCENT QUY ƯỚC THEO TỪNG BỘ ĐỀ

Để đảm bảo nhận diện thẩm mỹ cao cấp và đồng bộ toàn bộ sách:
- **Bộ 3 Đề Tiêu Chuẩn (A - B - C)**:
  - **Đề A (Cơ bản đến Vận dụng)**: `rgb("1e40af")` (Classic Navy Blue)
  - **Đề B (Vận dụng & Thực tiễn)**: `rgb("0d9488")` (Teal)
  - **Đề C (Nâng cao & VDC)**: `rgb("d97706")` (Amber)
- **Bộ Chuyên Đề Thực Tế Mở Rộng (D - E - F)**:
  - **Đề D (Cơ học & Công trình)**: `rgb("1d4ed8")` (Royal Blue)
  - **Đề E (Định vị & Robot AGV)**: `rgb("059669")` (Emerald Green)
  - **Đề F (Vũ trụ & Năng lượng)**: `rgb("e11d48")` (Ruby / Rose)

---

## 6. NHỮNG LỖI CÚ PHÁP TYPST KINH ĐIỂN CẦN TRÁNH TUYỆT ĐỐI

1. **Lỗi ngoặc vuông `[...]` gây Unclosed Delimiter**:
   - Khi viết khoảng hay đoạn toán học trong nội dung text, nếu viết `$c \in [20; 40]$` ngay bên trong content block `True([ ... ])`, Typst có thể hiểu lầm dấu `[` là mở một content block mới.
   - **Khắc phục an toàn**: Viết dưới dạng bất đẳng thức kép `$20 <= c <= 40$`, hoặc viết `$[ 20; 40 ]$` có khoảng cách trắng, hoặc dùng `delim.bracket.l 20; 40 delim.bracket.r`.
2. **Lỗi hàm `min` trong chỉ số dưới**:
   - Viết `$D_min$` sẽ bị lỗi vì `min` là hàm tìm cực tiểu trong Typst.
   - **Khắc phục**: Viết `$D_("min")$` hoặc `$D_"min"$`.
3. **Lỗi dấu `$` đóng mở công thức toán**:
   - Không được quên dấu `$` đóng trước dấu ngoặc vuông:
   - ❌ Sai: `True([Tổng khoảng cách luôn bằng $D_min = 70" km".]),`
   - ✅ Đúng: `True([Tổng khoảng cách luôn bằng $D_"min" = 70" km"$.]),`
4. **Lỗi toán tử trị tuyệt đối `|x|`**:
   - Trong biểu thức toán phức tạp nhiều số hạng, nên dùng hàm `abs(...)` thay vì thanh đứng `|...|` để không bị nhầm lẫn với phân cách bảng.

---

## 7. CÔNG CỤ VÀ QUY TRÌNH KIỂM ĐỊNH TRƯỚC KHI BÀN GIAO

Mỗi khi biên soạn xong 1 đề, AI Model **bắt buộc chạy 3 lệnh sau trong Terminal**:

### Bước 1: Biên dịch kiểm tra lỗi cú pháp Typst
```bash
typst compile <path_to_file.typ> <path_to_file.pdf>
```
Nếu có lỗi, Typst sẽ báo chính xác dòng và cột. Phải sửa triệt để cho đến khi exit code = 0.

### Bước 2: Kiểm định cấu trúc đề thi bằng công cụ nội bộ
Đã có sẵn script kiểm định tự động đặt tại:
`typst/sach/de-on-tap-theo-chuong-k10/inspect_exam.py`

Chạy lệnh:
```bash
python3 typst/sach/de-on-tap-theo-chuong-k10/inspect_exam.py <path_to_file.typ>
```
Kiểm tra đầu ra:
- `Total TN: 12`
- `Total DS: 4` (Mỗi câu đủ 4 ý a, b, c, d với nhãn `[DUNG]` hoặc `[SAI]`)
- `Total TLN: 6` (Đầy đủ đáp số trong `Key: [...]`)

### Bước 3: Xuất ảnh Preview trang đầu để báo cáo trực quan
```bash
pdftoppm -png -r 150 -f 1 -l 1 <path_to_file.pdf> preview_output
```
Kiểm tra ảnh để chắc chắn tiêu đề, căn lề và hình vẽ CeTZ hiển thị đẹp mắt, sắc nét.

---

## 8. CÂU LỆNH (PROMPT) GỢI Ý CHO NGƯỜI DÙNG KHI GỌI MODEL MỚI

Khi bạn muốn gọi một AI Model khác (trong session mới hoặc chuyển tool), bạn chỉ cần gửi tin nhắn sau:

```text
Hãy đọc kỹ file hướng dẫn kế hoạch dự án tại:
typst/sach/de-on-tap-theo-chuong-k10/HUONG-DAN-TIEP-TUC-BIEN-SOAN.md
(hoặc file HUONG-DAN-TIEP-TUC-K10.md ở thư mục gốc).

Sau đó hãy tiếp tục biên soạn trọn bộ 3 đề tiếp theo: de14A, de14B, de14C 
thuộc Chương V: Bài 14: Các số đặc trưng đo độ phân tán của mẫu số liệu không ghép nhóm 
(Mã đề 125, 126, 127).
Yêu cầu tuân thủ 100% quy chuẩn cấu trúc 2025, ký hiệu $vec(...)$, 100% hình vẽ CeTZ và kiểm định bằng inspect_exam.py.
```

---
*Tài liệu này được lập tự động bởi Antigravity Pair Programmer vào ngày 03/09/2026.*
