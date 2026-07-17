# HDSD chính thức — `sang-math:1.0.0`

Website production: <https://hdsd-conictypst.pages.dev/#intro>

Tài liệu này mô tả API public của package Typst `sang-math:1.0.0`: đề thi,
sách/chuyên đề, BBT/BXD, hình học cơ bản và CeTZ nâng cao. Bản PDF thực hành
gồm 100 trang với hơn 110 khung code và kết quả được Typst render trực tiếp.

## Import chuẩn

```typst
#import "@preview/sang-math:1.0.0": *
```

Không sao chép hoặc import trực tiếp `sang-exam.typ`, `bbt.typ`,
`modules/book.typ` hay các đường dẫn nội bộ của package.

## Cấu trúc tài liệu

```text
typst/hdsd-exam.typ
public/hdsd/
├── index.html
├── style.css
├── script.js
└── downloads/
    └── hdsd-sang-math-1.0.0.pdf
```

## AI sang-math có kiểm định

Trang `ai-sang-math.html` là ứng dụng BYOK riêng cho giáo viên: chọn Gemini hoặc
OpenRouter, nhập model/API key, tạo đề theo ma trận rồi kiểm định đầu ra bằng hợp
đồng `sang-math-ai-contract/1.0.1-r1`. Key mặc định chỉ lưu trong phiên trình
duyệt; website không có backend nhận key.

Bộ kiểm định chặn chữ ký API cũ, LaTeX thô, sai số phương án, thiếu `True`, thiếu
`id/tags/loigiai`, ID trùng và số câu lệch ma trận. Nếu bật tự sửa, danh sách lỗi
được gửi lại model tối đa hai vòng trước khi bàn giao mã.

```bash
npm run test:hdsd:ai-contract
```

## Kiểm thử và phát hành

```bash
# Biên dịch sách HDSD
typst compile --root . typst/hdsd-exam.typ typst/hdsd-exam.pdf

# Kiểm thử API public và hai demo chính thức
typst compile --root . typst-pkg-sang-math/tests/test-public-api.typ /tmp/public-api.pdf
typst compile --root . typst-pkg-sang-math/examples/exam-template-demo.typ /tmp/exam-demo.pdf
typst compile --root . typst-pkg-sang-math/examples/book-template-demo.typ /tmp/book-demo.pdf

# Deploy riêng website HDSD
npm run deploy:hdsd
```
