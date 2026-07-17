# Bộ kiểm thử OMR cho lớp 47 học sinh

Bộ dữ liệu này được sinh cố định với seed `20260714`, gồm 47 phiếu A4 theo mẫu
`thptqg-toan` (12 câu trắc nghiệm, 4 câu đúng/sai, 6 câu trả lời ngắn).

Các tệp dùng để thử chấm:

- `lop-47-hoc-sinh-ngau-nhien.pdf`: PDF 47 trang, mỗi học sinh một trang.
- `dap-an-ma-de-0101.json`: gói đáp án để nhập vào SANG MATH OMR.
- `ket-qua-ky-vong.csv`: SBD, số câu đúng và điểm chuẩn để đối chiếu.

Tất cả phiếu dùng mã đề `0101`; SBD chạy từ `120001` đến `120047`. Câu 17
có đáp án một chữ số `1`, được tô ở cột thứ 1 (ngoài cùng bên trái) của phần
trả lời ngắn. Phiếu đầu tiên là phiếu đối chứng đạt đúng `10.00` điểm.

## Cách thử

1. Mở trang chấm và chọn mẫu **Toán 12-4-6 A4 Dọc**.
2. Nhập `dap-an-ma-de-0101.json` tại mục **Nhập gói đáp án**.
3. Chọn `lop-47-hoc-sinh-ngau-nhien.pdf` ở vùng tải ảnh/PDF.
4. Bấm **Chấm từ ảnh** và đối chiếu kết quả với `ket-qua-ky-vong.csv`.

## Sinh lại đúng bộ dữ liệu

Chạy từ thư mục gốc của repository:

```sh
python3 sang-math-omr/test-data/lop-47-hoc-sinh/generate_class_47.py
```

Yêu cầu: `typst`, Python 3 và Pillow. Script chỉ đọc mẫu phiếu cùng tọa độ
hiện có, rồi ghi lại ba tệp dữ liệu trong chính thư mục này.
