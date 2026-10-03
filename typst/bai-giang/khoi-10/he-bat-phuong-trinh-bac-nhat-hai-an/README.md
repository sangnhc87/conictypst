# Bài giảng Toán 10: Hệ bất phương trình bậc nhất hai ẩn

Bộ học liệu gồm nguồn Typst, bản in học sinh, bản giáo viên và một gói SCORM 1.2 tự chứa. Mỗi tiết có phần học, ví dụ giải mẫu và 6 câu kiểm tra ngay tại chỗ. Học sinh có thể nhận gợi ý, bấm **Kiểm tra** từng câu, sửa câu sai và tiếp tục; không cần chờ nộp cả bài.

## Tệp để sử dụng ngay

| Tệp | Công dụng |
|---|---|
| `dist/bai-giang-hoc-sinh.pdf` | Trình chiếu, phát cho học sinh hoặc in; có khoảng trống ghi đáp số. |
| `dist/bai-giang-giao-vien.pdf` | Thêm ghi chú tổ chức hoạt động, đáp án và giải thích cho 24 câu. |
| `dist/he-bat-phuong-trinh-bac-nhat-hai-an-scorm12.zip` | Nhập trực tiếp vào LMS hỗ trợ SCORM 1.2. `imsmanifest.xml` nằm ở gốc ZIP. |
| `dist/scorm/index.html` | Xem thử trực tiếp trong trình duyệt, kể cả khi không có LMS. |

Không đưa bản giáo viên vào ZIP dành cho học sinh. Bản SCORM có PDF học sinh để tải về. Tất cả hình, mã JavaScript và CSS nằm trong ZIP; phần học không cần CDN.

## Lộ trình dạy 4 tiết

| Tiết | Trọng tâm | Hoạt động gợi ý | Đánh giá tại chỗ |
|---|---|---|---|
| 1 · 45 phút | Tình huống xưởng mộc, lập hệ, kiểm tra nghiệm và hiểu bờ mở/đóng | Cho học sinh đề xuất phương án, thử từng ràng buộc, phản biện điểm trên bờ | 6 câu: chọn một, chọn nhiều, số và điểm khả thi |
| 2 · 45 phút | Giao các nửa mặt phẳng, vẽ đường bờ, miền rỗng và không bị chặn | Thử điểm không nằm trên bờ, đối chiếu phần tô với phép thế | 6 câu, gồm nhập tọa độ trong miền có bờ mở |
| 3 · 45 phút | Đỉnh miền nghiệm, hàm tuyến tính, cạnh cùng tối ưu và giới hạn của quy tắc xét đỉnh | Lập bảng giá trị tại các đỉnh, nêu giả thiết bị chặn/bờ đóng | 6 câu, gồm nhập tọa độ đỉnh và tính giá trị cực trị |
| 4 · 45 phút | Mô hình hóa, đơn vị, tính nguyên, diễn giải phương án tối ưu | Giải quyết bài toán sản xuất; nhóm nhanh so sánh tối ưu thực/nguyên | 6 câu, gồm nhập phương án nguyên bất kỳ thỏa hệ |

Đáp án được giải thích ngay sau khi học sinh bấm kiểm tra. Với câu “nhập một điểm trong miền”, bộ chấm kiểm tra *mọi* ràng buộc và phân biệt `<` với `≤`; câu số lượng sản phẩm còn yêu cầu tọa độ nguyên. Trong tiết 4, bài mở rộng có nghiệm tối ưu liên tục tại `(42/11; 60/11)` với giá trị `468/11`, còn nghiệm nguyên tốt nhất là `(3;6)` với giá trị `42`. Bản giáo viên có gợi ý khai triển và kiểm chứng.

## Xây dựng lại

Chạy từ gốc repository:

```bash
python3 typst/bai-giang/khoi-10/he-bat-phuong-trinh-bac-nhat-hai-an/build_scorm.py
```

Cần `typst` trên `PATH` (bộ này đã được biên dịch với Typst 0.14.2) và Python 3. Không cần kết nối mạng khi biên dịch nếu các package Typst của repository đã có trong cache. Mã đồ thị dùng `public/hdsd/typst/sang-math-geom.typ` và hook `them: (ctx, d) => { ... }`; không dựng lại hình bằng tọa độ vẽ thô.

Để kiểm tra trong trình duyệt, mở `dist/scorm/index.html`. Trên điện thoại, chạm vào trang bài giảng để mở trang SVG ở kích thước lớn. Trong LMS, nhập **nguyên tệp ZIP**; không nén thêm một thư mục bên ngoài. Gói dùng một SCO, lưu các câu đã làm đúng trong `cmi.suspend_data`, ghi vị trí tiết học vào `cmi.core.lesson_location`, và cập nhật `cmi.core.score.raw`. Trạng thái hoàn thành được ghi `passed` khi làm đúng đủ 24 câu. Bên ngoài LMS, tiến độ được lưu trong `localStorage` của trình duyệt.

## Cấu trúc nguồn và mở rộng hệ thống

- `main.typ`: bản PDF đầy đủ. Tham số `--input teacher=1` thêm ghi chú và đáp án.
- `sections/*.typ`: nội dung học theo tiết. Các mảnh này dùng chung để biên dịch PDF và từng trang SCORM.
- `checkpoints.json`: nguồn duy nhất của 24 câu hỏi, đáp án, gợi ý, giải thích và kiểu chấm.
- `style.typ`: bố cục bài giảng và bản in của câu hỏi.
- `mien-he.typ`: vẽ giao nửa mặt phẳng bằng thư viện hình học chuẩn của dự án.
- `section-view.typ`: chọn một tiết để render SVG cho SCORM.
- `build_scorm.py`, `scorm.js`, `scorm.css`: đóng gói và vận hành tương tác.

Để soạn bài tiếp theo, sao chép thư mục này, thay các tệp `sections/*.typ` và dữ liệu trong `checkpoints.json`, giữ mã `id` câu hỏi duy nhất. Hiện mẫu cấu hình bốn tiết, sáu câu mỗi tiết; nếu đổi số tiết/câu, cập nhật `SECTION_IDS`, `validate_bank()` và nội dung mở đầu trong builder rồi xây dựng lại. `test_scorm.cjs` là bài kiểm tra tích hợp với Puppeteer của repository:

```bash
node typst/bai-giang/khoi-10/he-bat-phuong-trinh-bac-nhat-hai-an/test_scorm.cjs
```

Kiểm tra này chạy các dạng câu hỏi, thử lại sau khi sai, kiểm tra biên nghiêm ngặt, điều kiện nguyên, lưu tiến độ, bố cục di động và các lệnh SCORM 1.2 giả lập.
