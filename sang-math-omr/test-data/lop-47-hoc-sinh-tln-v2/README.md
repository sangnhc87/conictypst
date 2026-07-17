# Bộ kiểm thử 47 học sinh – TLN trái sang phải v2

Bộ dữ liệu cố định với seed `20260716`, gồm 47 phiếu theo mẫu A5 ngang
`12-4-6ngang`. Mục tiêu chính là kiểm tra đồng bộ **Tô Phiếu → Chấm ảnh →
Chấm camera** theo quy tắc TLN Việt Nam:

- `0`: tô cột 1.
- `-2`: tô cột 1–2.
- `4,5`: tô cột 1–3.
- `-2,3`: tô đủ cột 1–4.

Sáu đáp án chuẩn TLN là `0`, `-2`, `4,5`, `-2,3`, `61,5`, `832`. Các phiếu
học sinh còn bao phủ nhiều đáp án hợp lệ dài từ 1 đến 4 ký tự như `0,5`,
`-12`, `61,5`, `12,3`, `1234` và `-123`.

## Tệp dành cho người kiểm thử

- `lop-47-hoc-sinh-tln-v2.pdf`: PDF 47 trang A5 ngang.
- `dap-an-ma-de-0303.json`: gói đáp án JSON nhập trực tiếp vào OMR.
- `dap-an-ma-de-0303.csv`: đáp án dạng bảng ngang.
- `dap-an-ma-de-0303.xlsx`: đáp án Excel và trang hướng dẫn.
- `ket-qua-ky-vong.csv`: đáp án TLN từng học sinh và điểm chuẩn.
- `du-lieu-47-hoc-sinh.json`: dữ liệu chi tiết dùng cho kiểm thử tự động.
- `batch-grade-report.json`: báo cáo chấm thực tế bằng engine production/stage.
- `SHA256SUMS.txt`: mã kiểm tra các tệp sinh ra.

Tất cả phiếu dùng mã đề `0303`; SBD từ `620001` đến `620047`. Trang đầu là
phiếu đối chứng đúng toàn bộ, đạt `10,00`.

## Thử thủ công trên website

1. Chọn mẫu **Toán 12-4-6 A5 ngang**.
2. Nhập `dap-an-ma-de-0303.json`, CSV hoặc XLSX.
3. Tải `lop-47-hoc-sinh-tln-v2.pdf`.
4. Chấm cả lớp và đối chiếu `ket-qua-ky-vong.csv`.

Để thử camera, in một vài trang ở tỷ lệ **Actual size / 100%**, không dùng
“Fit to page”.

## Sinh lại dữ liệu

```sh
python3 sang-math-omr/test-data/lop-47-hoc-sinh-tln-v2/generate_class_47_tln_v2.py
```

Để đồng thời giữ 47 ảnh PNG cho batch test:

```sh
python3 sang-math-omr/test-data/lop-47-hoc-sinh-tln-v2/generate_class_47_tln_v2.py \
  --pages-dir /private/tmp/omr-tln-v2-pages
```

Sau khi dựng stage tại `http://127.0.0.1:8765`, chạy:

```sh
node sang-math-omr/test-data/lop-47-hoc-sinh-tln-v2/batch_grade_stage.cjs \
  http://127.0.0.1:8765/index.html \
  /private/tmp/omr-tln-v2-pages
```

Batch test gọi trực tiếp `OmrEngine.gradeImage` cho đủ 47 trang ở cả chế độ
upload và camera; không thay đổi bất kỳ ngưỡng nhận dạng nào.

## Kết quả kiểm thử đã ghi nhận

Stage cục bộ `http://127.0.0.1:8765/index.html` đã chấm bằng đúng engine
đóng gói ngày `2026-07-16`:

- Upload ảnh: **47/47**, không sai lệch, không cảnh báo.
- Mô phỏng camera: **47/47**, không sai lệch, không cảnh báo.

Chi tiết máy đọc được nằm trong `batch-grade-report.json`; mã SHA-256 của báo
cáo và toàn bộ bộ dữ liệu nằm trong `SHA256SUMS.txt`.
