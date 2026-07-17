# TypstConicHub

TypstConicHub là module soạn thảo Typst độc lập của hệ sinh thái ConicTypst.

- Production: <https://typstconichub.pages.dev/>
- HDSD: <https://hdsd-conictypst.pages.dev/>
- Trộn đề: <https://hdsd-conictypst.pages.dev/tron-de>
- OMR: <https://chamthi-conictypst.pages.dev/>

Các website trên được build và triển khai riêng. TypstConicHub chỉ liên kết tới chúng, không dùng chung CSS hoặc DOM nên một module không thể làm hỏng giao diện module khác.

## Năng lực hiện tại

- Monaco Editor tự host worker, không phụ thuộc Monaco CDN.
- Typst compiler chạy trong Web Worker bằng `typst.ts` WASM; WASM được chia thành hai asset dưới ngưỡng Pages, tải song song với 17 font nền rồi lưu đệm cho lần sau.
- Preview mới được render trong vùng staging rồi thay nguyên khối, không xóa trắng trong lúc biên dịch.
- Compiler tồn tại liên tục và chỉ nhận lại các tệp đã thay đổi.
- Preview canvas, xuất PDF, SVG và PNG.
- Dự án đa tệp, hỗ trợ tệp ảnh/asset nhị phân.
- Tự lưu toàn bộ dự án bằng IndexedDB, có snapshot cục bộ.
- Nhập/xuất dự án ZIP.
- Mẫu khởi động `05_full_de_thi_mau.typ` dùng `#import "@preview/sang-math:1.0.1": *`, theme `teal-pro` và soạn trực tiếp từng câu bằng `#tn`, `#ds`, `#tln`, `#tl` — không cần `make-questions`.
- Tám mẫu dự án theo đúng sản phẩm đầu ra: đề 05 đầy đủ, tài liệu tự do, đề thi tinh gọn, sách bài học, sách bài tập có lời giải, chuyên đề, Beamer 16:9 và BBT.
- Người dùng IndexedDB cũ đang ở “Khởi động nhanh” được chuyển một lần sang mẫu 05; dự án cũ vẫn được giữ nguyên trong danh sách.
- Nút “Tạo/Cập nhật Beamer” tạo slide 16:9 trong cùng dự án; nút “Về đề A4” chuyển lại bản soạn trực tiếp. Đầu tệp Beamer luôn liệt kê 10 theme đề xuất (thư viện vẫn có đủ 30 theme).
- `sang-math:1.0.1` dùng API chính thức của Typst Universe; Studio bundle đúng phiên bản này để khóa bản vá tương thích WASM, còn registry mạng vẫn xử lý package khác và dự án cũ.
- Sang Math Center hiển thị trạng thái import của từng dự án, liên kết trang package và nâng cấp đường dẫn nội bộ cũ bằng một thao tác có snapshot tự động.
- Alias package cũ chỉ được giữ ẩn trong compiler để dự án IndexedDB trước đây không bị hỏng; mẫu mới không sinh đường dẫn `/packages/sang-math/`.
- Sang Math Center có tìm kiếm theo nhóm, mô tả cú pháp và chèn macro tại con trỏ.
- Monaco ưu tiên đúng `#tn`, `#ds`, `#tln`, `#tl` khi gõ lệnh và chỉ bỏ dấu `#` khi mở một dự án cũ đang ở trong khối hàm Typst.
- Command Palette `Ctrl/Cmd + K`, tìm kiếm xuyên toàn dự án và bảng vấn đề có thể đi tới dòng lỗi.
- Outline nhận diện phần thi, heading và câu TN/ĐS/TLN/TL trong mọi tệp; bấm để đi đúng dòng.
- Exam Designer chọn trực quan 12 theme Sang Math và tự biên dịch lại mà không sửa nội dung câu hỏi.
- Click trực tiếp chữ/nội dung trong preview để mở đúng file và dòng source trong Monaco.
- Nhận diện cam–xanh lá thống nhất; light mode có màu chữ/hover tương phản cao và bố cục riêng trên điện thoại.
- Header Studio chỉ giữ Tài khoản và Hướng dẫn; Vẽ hình, Trộn đề và OMR không chen vào không gian soạn thảo.
- Giao diện desktop ba panel và chế độ tệp/editor/preview riêng trên điện thoại.
- Service Worker v4 dùng network-first cho navigation, cache asset bất biến, package Universe và báo cập nhật mà không làm mất dự án đang soạn.

## Lệnh phát triển

```bash
npm run dev:hub
npm run build:hub
npm run preview:hub
npm run test:hub:package
npm run test:hub:exam-online
npm run test:hub:smoke
npm run deploy:hub
```

Smoke test kiểm tra trang chủ, desktop/mobile Studio, A4 ↔ Beamer, 10 theme gợi ý, preview không trắng khi biên dịch, hover light mode, 8 loại dự án, autocomplete `#tn`, Outline, sách bài tập và Beamer 86 slide.

## Kiến trúc

```text
Monaco Editor
  └─ project files / IndexedDB
       └─ compiler.worker.js
            ├─ persistent typst.ts compiler
            ├─ bundled sang-math 1.0.1 + Typst Universe fallback
            ├─ legacy compatibility aliases
            └─ vector/PDF artifact
                 └─ renderer trên UI → canvas/SVG/PNG
```

Compiler WASM được khóa ở `typst.ts 0.7.0-rc2` để đồng bộ với dependency hiện tại của repo. Trước khi đổi phiên bản cần chạy lại smoke test cho cả mẫu nhẹ và mẫu Sang Math.
