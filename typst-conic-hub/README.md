# TypstConicHub

TypstConicHub là module soạn thảo Typst độc lập của hệ sinh thái ConicTypst.

- Production: <https://typstconichub.pages.dev/>
- HDSD: <https://hdsd-conictypst.pages.dev/>
- Trộn đề: <https://hdsd-conictypst.pages.dev/tron-de>
- OMR: <https://chamthi-conictypst.pages.dev/>

Các website trên được build và triển khai riêng. TypstConicHub chỉ liên kết tới chúng, không dùng chung CSS hoặc DOM nên một module không thể làm hỏng giao diện module khác.

## Năng lực hiện tại

- Monaco Editor tự host worker, không phụ thuộc Monaco CDN.
- Typst compiler chạy trong Web Worker bằng `typst.ts` WASM.
- Compiler tồn tại liên tục và chỉ nhận lại các tệp đã thay đổi.
- Preview canvas, xuất PDF, SVG và PNG.
- Dự án đa tệp, hỗ trợ tệp ảnh/asset nhị phân.
- Tự lưu toàn bộ dự án bằng IndexedDB, có snapshot cục bộ.
- Nhập/xuất dự án ZIP.
- Mẫu khởi động chính giữ nguyên tên entry `05_full_de_thi_mau.typ` cùng `05_data_de_thi_mau.typ`, dùng `#import "@preview/sang-math:1.0.0": *` và chọn theme `teal-pro`.
- Bảy mẫu dự án theo đúng sản phẩm đầu ra: đề đầy đủ 4 phần, tài liệu tự do, đề thi tinh gọn, sách/giáo trình, chuyên đề, Beamer 16:9 và BBT.
- Người dùng IndexedDB cũ đang ở “Khởi động nhanh” được chuyển một lần sang mẫu 05; dự án cũ vẫn được giữ nguyên trong danh sách.
- Beamer tích hợp 30 theme, dùng lại dữ liệu câu hỏi 05 và xuất slide chữa đề 16:9 ngay trong WASM.
- `sang-math:1.0.0` dùng package chính thức trên Typst Universe; Service Worker cache archive sau lần tải đầu tiên.
- Sang Math Center hiển thị trạng thái import của từng dự án, liên kết trang package và nâng cấp đường dẫn nội bộ cũ bằng một thao tác có snapshot tự động.
- Alias package cũ chỉ được giữ ẩn trong compiler để dự án IndexedDB trước đây không bị hỏng; mẫu mới không sinh đường dẫn `/packages/sang-math/`.
- Sang Math Center có tìm kiếm theo nhóm, mô tả cú pháp và chèn macro tại con trỏ.
- Monaco tự gợi ý macro Sang Math khi gõ `#` hoặc dùng `Ctrl/Cmd + Space`.
- Command Palette `Ctrl/Cmd + K`, tìm kiếm xuyên toàn dự án và bảng vấn đề có thể đi tới dòng lỗi.
- Outline nhận diện phần thi, heading và câu TN/ĐS/TLN/TL trong mọi tệp; bấm để đi đúng dòng.
- Exam Designer chọn trực quan 12 theme Sang Math và tự biên dịch lại mà không sửa nội dung câu hỏi.
- Click trực tiếp chữ/nội dung trong preview để mở đúng file và dòng source trong Monaco; hoạt động với cả entry 05 và file dữ liệu 05.
- Nhận diện cam–xanh lá thống nhất, trạng thái hover rõ trên desktop và bố cục riêng trên điện thoại.
- Giao diện desktop ba panel và chế độ tệp/editor/preview riêng trên điện thoại.
- Service Worker v2 dùng network-first cho navigation, cache asset bất biến và báo cập nhật mà không làm mất dự án đang soạn.

## Lệnh phát triển

```bash
npm run dev:hub
npm run build:hub
npm run preview:hub
npm run test:hub:package
npm run test:hub:smoke
npm run deploy:hub
```

Smoke test kiểm tra trang chủ, desktop Studio, mobile Studio, tải WASM, entry `05_full...` mặc định, click preview về source, 7 loại dự án, autocomplete, Outline, Exam Designer, đề Sang Math tinh gọn và Beamer 91 trang slide.

## Kiến trúc

```text
Monaco Editor
  └─ project files / IndexedDB
       └─ compiler.worker.js
            ├─ persistent typst.ts compiler
            ├─ Typst Universe package registry
            ├─ legacy compatibility aliases
            └─ vector/PDF artifact
                 └─ renderer trên UI → canvas/SVG/PNG
```

Compiler WASM được khóa ở `typst.ts 0.7.0-rc2` để đồng bộ với dependency hiện tại của repo. Trước khi đổi phiên bản cần chạy lại smoke test cho cả mẫu nhẹ và mẫu Sang Math.
