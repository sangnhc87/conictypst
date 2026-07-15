# Quy trình phát hành sang-math

## Nguyên tắc phiên bản

- `1.0.x`: chỉ sửa lỗi và cải thiện bố cục, không phá API.
- `1.x.0`: thêm API tương thích ngược.
- `2.0.0`: chỉ dùng khi cố ý thay đổi hợp đồng public.

## Cổng kiểm tra bắt buộc

Chạy từ thư mục gốc repository:

```bash
for file in typst-pkg-sang-math/tests/*.typ; do
  typst compile --root . "$file" "/tmp/$(basename "$file" .typ).pdf"
done
typst compile --root . typst-pkg-sang-math/examples/exam-template-demo.typ
typst compile --root . typst-pkg-sang-math/examples/book-template-demo.typ
typst compile --root . typst/hdsd-exam.typ
```

Trước khi gửi Typst Universe:

1. Đối chiếu `lib.typ` với phiên bản gần nhất để không làm mất export.
2. Đồng bộ số phiên bản trong `typst.toml`, `lib.typ`, README và installer.
3. Cập nhật `CHANGELOG.md` và bỏ chữ “Chưa phát hành”.
4. Chỉ đưa mã nguồn, README, LICENSE, ví dụ và test cần thiết vào thư mục gói; loại file PDF build, `.DS_Store`, `node_modules` và tài liệu thử nghiệm mang số phiên bản tương lai.
5. Compile từ một bản sao sạch trước khi tạo pull request phát hành.
