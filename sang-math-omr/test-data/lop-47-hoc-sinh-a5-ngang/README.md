# Bộ kiểm thử OMR 47 học sinh – A5 ngang

Bộ dữ liệu cố định với seed `20260714`, gồm 47 phiếu theo mẫu
`12-4-6ngang`: 12 câu trắc nghiệm, 4 câu đúng/sai và 6 câu trả lời ngắn.

Các tệp kiểm thử:

- `lop-47-hoc-sinh-a5-ngang.pdf`: PDF 47 trang A5 ngang, mỗi học sinh một trang.
- `dap-an-ma-de-0202.json`: gói đáp án để nhập vào SANG MATH OMR.
- `ket-qua-ky-vong.csv`: SBD, số câu đúng và điểm chuẩn để đối chiếu.
- `SHA256SUMS.txt`: mã SHA-256 giúp kiểm tra kết quả sinh lại hoàn toàn giống nhau.

Tất cả phiếu dùng mã đề `0202`; SBD chạy từ `520001` đến `520047`. Câu 17
có đáp án một chữ số `1` và được tô ở cột thứ 1 (ngoài cùng bên trái) của
phần trả lời ngắn. Phiếu đầu tiên là phiếu đối chứng đạt `10.00` điểm.

## Cách thử

1. Mở trang chấm và chọn mẫu **Toán 12-4-6 A5 ngang**.
2. Nhập `dap-an-ma-de-0202.json` tại mục **Nhập gói đáp án**.
3. Chọn `lop-47-hoc-sinh-a5-ngang.pdf` ở vùng tải ảnh/PDF.
4. Bấm **Chấm từ ảnh** và đối chiếu kết quả với `ket-qua-ky-vong.csv`.

Để thử camera điện thoại, in một trang ở tỷ lệ **Actual size / 100%**, không
dùng chế độ “Fit to page”. Bốn marker đen ở bốn góc phải nằm trọn trong ảnh.

## Sinh lại đúng bộ dữ liệu

Chạy từ thư mục gốc của repository:

```sh
python3 sang-math-omr/test-data/lop-47-hoc-sinh-a5-ngang/generate_class_47_a5.py
```

Yêu cầu: `typst`, Python 3, Pillow và `pdfinfo` (Poppler). Script tự kiểm tra:

- trang nguồn đã biên dịch là khổ ngang và khớp kích thước tọa độ;
- toàn bộ 432 tọa độ đáp án nằm đúng trên vòng tròn được in;
- bốn marker góc nằm đúng vị trí hiệu chuẩn;
- các điểm tô nằm đúng tâm, riêng câu 17 chỉ tô cột TLN thứ 1;
- PDF có đúng 47 trang A5 ngang và nhỏ hơn 25 MiB.
