# Sang Math Atlas - Thiết kế tổng thể

Mục tiêu của hệ thống: biến repo hiện tại thành một kho học liệu sống dùng nhiều năm cho học sinh lớp 12, đồng thời vẫn cập nhật được bài mới, chuyên đề mới, slide Beamer mới và đề luyện mới mà không làm rối repo.

## 1. Tư tưởng sản phẩm

Repo đang có hai tài sản chính:

- `typst/exams/CD-*.typ`: các chuyên đề tâm đắc, thường là ý tưởng đề thi hoặc bài toán thực tế hóa.
- `typst/beamer/**/*.typ`: bài giảng trình chiếu theo khối/chương/bài.

Sang Math Atlas sẽ là lớp quản trị phía trên hai kho này:

- Mỗi file `.typ` vẫn là nguồn gốc học liệu.
- Mỗi học liệu có metadata: khối, chương, chủ đề, mức độ, kỹ năng, năm dùng, trạng thái, link PDF.
- Web chỉ đọc manifest JSON để hiển thị, tìm kiếm, lọc, mở PDF/Typst.
- Hằng năm chỉ thêm/cập nhật metadata và file mới, không phải viết lại web.

## 2. Các module chính

### Module A - CD Atlas

Quản lý các chuyên đề `CD-*`.

Mục tiêu:

- Tìm nhanh chuyên đề theo nhóm: Giải tích thực tế, Oxyz, Tổ hợp - xác suất, Tối ưu, Hình học khó.
- Biết chuyên đề nào dùng để dạy, chuyên đề nào để luyện VDC, chuyên đề nào để ra đề.
- Có đường dẫn đến PDF, Typst, bản học sinh, bản giáo viên nếu có.

Màn hình đề xuất:

- Danh sách dạng bảng/card, không làm landing page.
- Bộ lọc: khối, chương, nhóm, độ khó, dạng toán, năm dùng, trạng thái.
- Ô tìm nhanh theo tên file, tag, nội dung mô tả.
- Mỗi chuyên đề mở ra detail panel: mô tả, kỹ năng, prerequisites, lỗi HS hay gặp, links.

### Module B - Beamer Library

Quản lý bài giảng `typst/beamer`.

Mục tiêu:

- Chọn khối 10/11/12, chương, bài.
- Mở PDF trình chiếu ngay trên web-app Presenter hiện có.
- Gắn chuyên đề CD liên quan với bài giảng.

Màn hình đề xuất:

- Giữ cấu trúc hiện tại của `web-app/src/Gallery.jsx`, nhưng thay `data.json` thủ công bằng manifest sinh tự động.
- Mỗi Beamer card có: chương, bài, khối, PDF, Typst, chuyên đề liên quan.

### Module C - Year Plan

Quản lý lộ trình từng năm học.

Mục tiêu:

- Năm 2026-2027 dùng bộ nào, dạy lúc nào, giao HS làm gì.
- Năm sau kế thừa, chỉ update phiên bản hoặc thay chuyên đề.
- Có lịch dạy theo tuần/chương.

Cấu trúc đề xuất:

```text
typst/plans/
  2026-2027.yaml
  2027-2028.yaml
```

Ví dụ:

```yaml
year: "2026-2027"
grade: 12
weeks:
  - week: 1
    topic: "Tính đơn điệu và cực trị"
    beamer:
      - beamer-12-bai-1-tinh-on-dieu-cuc-tri
    cd:
      - CD-Tang-Giam-LienTuc
      - CD-KhaoSat-HamSo-ThucTe
    homework:
      - CD-Tang-Giam-LienTuc-DeLuyen
    note: "HS hay sai khi gộp khoảng qua điểm gián đoạn."
```

### Module D - Student Cycle

Mỗi chuyên đề nên có ba cách xuất:

- `student`: bản học sinh, ít lời giải, có khoảng trống/gợi mở.
- `teacher`: bản giáo viên, có lời giải, ghi chú phương pháp.
- `practice`: biến thể/giao về nhà.

Trong Typst có thể dùng mode:

```typst
#let mode = sys.inputs.at("mode", default: "student")
```

Compile:

```bash
typst compile typst/exams/CD-X.typ output/CD-X-student.pdf --input mode=student --root .
typst compile typst/exams/CD-X.typ output/CD-X-teacher.pdf --input mode=teacher --root .
```

## 3. Metadata chuẩn cho mỗi học liệu

Một asset trong Atlas có cấu trúc:

```yaml
id: CD-Lorenz-Gini
kind: cd
title: "Lorenz - Gini"
grade: 12
domain: "Tích phân ứng dụng"
cluster: "Giải tích thực tế"
chapter: "Nguyên hàm - Tích phân"
difficulty: 4
status: ready
year_first_used: "2025-2026"
year_last_used: "2026-2027"
skills:
  - đọc đồ thị
  - mô hình hóa
  - tính diện tích
tags:
  - tích phân
  - kinh tế xã hội
  - vdc
source_typ: "typst/exams/CD-Lorenz-Gini.typ"
pdf: "typst/exams/CD-Lorenz-Gini.pdf"
related_beamer:
  - beamer-12-bai-5-ung-dung-thuc-tien
teacher_note: "Dùng sau khi HS đã biết ý nghĩa diện tích dưới đồ thị."
student_pitfall: "Nhầm diện tích giữa đường Lorenz và đường y=x."
```

## 4. Cấu trúc thư mục đề xuất

Không cần phá cấu trúc hiện tại. Chỉ thêm lớp metadata và plans:

```text
typst/
  exams/
    CD-*.typ
    CD-*.pdf
  beamer/
    ...
  atlas/
    assets/
      cd.yaml
      beamer.yaml
    plans/
      2026-2027.yaml
      2027-2028.yaml

public/hdsd/
  atlas-data.json       # sinh tự động từ script
  atlas.html            # web atlas sau này

scripts/
  atlas-inventory.mjs   # quét repo sinh manifest ban đầu
```

## 5. Quy trình cập nhật mỗi năm

Đầu năm:

1. Copy plan năm trước thành `typst/atlas/plans/2027-2028.yaml`.
2. Đánh dấu bài nào giữ, bài nào thay, bài nào thêm mới.
3. Chạy inventory để cập nhật manifest.
4. Web Atlas tự có bài mới.

Trong năm:

1. Dạy xong chuyên đề, thêm ghi chú: HS sai gì, bài nào hiệu quả.
2. Nếu có đề hay, thêm vào `CD-*` hoặc tạo file mới.
3. Nếu có Beamer mới, đặt vào đúng thư mục `typst/beamer`.
4. Chạy script sinh lại `atlas-data.json`.

Cuối năm:

1. Đánh dấu `gold`, `revise`, `retire`.
2. Tổng kết các chuyên đề hiệu quả.
3. Chuẩn bị bản plan năm sau.

## 6. Trạng thái học liệu

Nên dùng các trạng thái cố định:

- `draft`: mới viết, chưa dạy.
- `tested`: đã dạy thử.
- `ready`: dùng tốt.
- `gold`: chủ đề tâm đắc, nên giữ hằng năm.
- `revise`: cần sửa.
- `retire`: tạm bỏ.

## 7. Nhóm chủ đề gợi ý

Từ repo hiện tại có thể phân nhóm tự động:

- `Giải tích thực tế`: khảo sát hàm, tiệm cận, nguyên hàm, tích phân, Lorenz-Gini.
- `Kinh tế - tối ưu`: chi phí, doanh thu, thuế, năng suất, quy hoạch tuyến tính.
- `Oxyz - hình học không gian`: mặt phẳng, mặt cầu, chuyển động, cảm biến, vector hướng.
- `Tổ hợp - xác suất`: xếp ghế, chia kẹo, Bayes, Markov, phân phối.
- `Mô hình trạng thái`: FSM, Markov, quy hoạch động, tô màu.
- `Hình học khó`: tiếp xúc, khoảng cách hai đường cong, min-max đường tròn/mặt cầu.

## 8. Lộ trình triển khai

### Pha 1 - Inventory và manifest

- Tạo script quét `CD-*` và Beamer.
- Sinh `public/hdsd/atlas-data.json`.
- Chưa cần UI đẹp.

### Pha 2 - Web Atlas

- Tạo `public/hdsd/atlas.html`.
- Đọc `atlas-data.json`.
- Có search/filter/link PDF.

### Pha 3 - Metadata thủ công

- Thêm `typst/atlas/assets/cd.yaml`.
- Chỉnh tag, difficulty, status cho các chuyên đề quan trọng.
- Script merge metadata thủ công với inventory tự động.

### Pha 4 - Year Plan

- Tạo plan năm học.
- Web có tab "Kế hoạch năm".
- Mỗi tuần biết dạy Beamer nào, giao CD nào.

### Pha 5 - Student/Teacher/Practice modes

- Chuẩn hóa một số CD vàng sang mode.
- Tạo script compile hàng loạt theo mode.

## 9. Nguyên tắc thiết kế

- Không làm nặng repo bằng video.
- Không ép tất cả file cũ sửa ngay.
- Metadata đi trước, UI theo sau.
- File `.typ` vẫn là nguồn chân lý.
- Web chỉ là lớp tra cứu và vận hành.
- Mỗi năm cập nhật bằng plan + status, không làm lại từ đầu.

