# ConicTypst — hồ sơ bàn giao và kế hoạch phát triển

> Cập nhật gần nhất: 2026-07-15
> Mục đích: đây là tài liệu đầu tiên model/agent mới phải đọc trước khi sửa mã nguồn.
> Trạng thái tổng thể: OMR đã ổn định; HDSD, Trộn đề và TypstConicHub là các website độc lập; `sang-math` 1.0.0 đã phát hành và bản vá 1.0.1 đang được kiểm thử local.

## 1. Tầm nhìn sản phẩm

ConicTypst là hệ sinh thái soạn tài liệu Toán THPT cho giáo viên Việt Nam:

```text
TypstConicHub (soạn thảo WASM)
   ├─ HDSD ConicTypst (tài liệu và công cụ)
   ├─ Trộn đề + OMR Passport (nhiều mã đề, đáp án, QR)
   ├─ Sang Math OMR (sinh phiếu, tô, camera, chấm, thống kê)
   └─ package sang-math (đề thi, sách, BBT, ký hiệu, hình học)
```

Nguyên tắc sản phẩm:

- Mỗi website là một module độc lập, có thể dùng và deploy riêng.
- Hub chỉ liên kết tới module khác; không ghép CSS/DOM giữa các website.
- Dữ liệu người dùng ưu tiên local-first. Hub công khai; HDSD tự cấp quyền khi đăng nhập; sản phẩm có cloud hoặc dữ liệu riêng dùng chính sách truy cập riêng.
- Màu nhận diện chính: xanh lá và cam; xanh dương/tím chỉ là màu hỗ trợ.
- Mọi thay đổi liên quan đề thi/OMR phải kiểm tra cả sinh phiếu, tô đáp án và chấm.
- Không publish `sang-math` thay người dùng. Mỗi bản mới phải qua cổng API, Typst tối thiểu và compile HDSD.

## 2. URL và mốc deploy

| Module | Production | Snapshot quan trọng |
|---|---|---|
| TypstConicHub | <https://typstconichub.pages.dev/> | `b3504302.typstconichub.pages.dev` — click preview về source + fraction layout contract + mẫu 05 chính |
| HDSD | <https://hdsd-conictypst.pages.dev/> | deploy bằng `npm run deploy:hdsd` |
| Trộn đề | <https://hdsd-conictypst.pages.dev/tron-de> | hiện nằm trong project HDSD |
| Sang Math OMR | <https://chamthi-conictypst.pages.dev/> | `bb10e40b` — bản nâng cấp; `e60a3799` — “BẢN HOÀN HẢO SỐ 1” |

Cloudflare Pages projects:

- Hub: `typstconichub`
- HDSD: `hdsd-conictypst`
- OMR: project đang phục vụ `chamthi-conictypst.pages.dev`

## 3. Ranh giới mã nguồn — bắt buộc giữ

### 3.1 TypstConicHub

- Thư mục: `typst-conic-hub/`
- Vite config: `vite.hub.config.js`
- Build output: `dist-hub/` (không commit)
- Package nội bộ được bundle từ `typst-pkg-sang-math/` qua `packageFiles.js`.
- Không import stylesheet từ `public/hdsd` hoặc `sang-math-omr`.

### 3.2 HDSD và Trộn đề

- Thư mục web: `public/hdsd/`
- Có nhiều trang HTML độc lập và một số tài nguyên dùng chung.
- Trước đây CSS của HDSD từng bị hỏng do chỉnh selector/phạm vi quá rộng. Khi sửa:
  - dùng class có namespace;
  - kiểm tra `index.html`, `dashboard.html`, `ecosystem.html` và `tron-de.html`;
  - không đưa CSS Hub/OMR vào HDSD.

### 3.3 Sang Math OMR

- Thư mục: `sang-math-omr/`
- Đây là module đang chấm tốt; ưu tiên không hồi quy engine chấm.
- Các preset phiếu, tọa độ bubble, giao diện tô phiếu và engine chấm phải cùng dùng một schema/cấu hình.
- Nếu sửa hình học phiếu phải kiểm tra ảnh/camera thật, không chỉ preview trình duyệt.

### 3.4 Package Sang Math

- Thư mục chính: `typst-pkg-sang-math/`
- Entry point: `lib.typ`
- API ổn định hiện export:
  - `sang-exam.typ`
  - `exam-templates.typ`
  - `book-templates.typ`
  - `bbt.typ`
  - `math-sym.typ`
  - `geometry.typ`
  - CeTZ API nâng cao trong `geometry-2d/` và `geometry-3d/`.

## 4. Những phần đã hoàn thành

### 4.1 OMR — đã coi như hoàn thành giai đoạn chính

- Đồng bộ sinh phiếu, giao diện tô trực tiếp và engine chấm.
- Nhiều loại phiếu TN, Đúng/Sai, TLN và mẫu hỗn hợp.
- Nhập/xuất nhiều mã đề bằng Excel, TXT/CSV, JSON và QR.
- Có file mẫu cho các luồng nhập dữ liệu chính.
- Quản lý lớp, danh sách học sinh/SBD/lớp và luồng nhập Excel.
- Camera điện thoại, chọn ảnh, QR và quy trình rà soát kết quả.
- Sửa đáp án có thể cập nhật/chấm lại điểm.
- Thống kê và giao diện đã được nâng cấp đáng kể.
- Mốc an toàn cần giữ: `e60a3799.chamthi-conictypst.pages.dev`.

Trước khi sửa OMR lần nữa, đọc `sang-math-omr/readme.md` và kiểm tra worktree vì có nhiều thay đổi/xóa file do các đợt dọn dẹp trước.

### 4.2 HDSD + Trộn đề

- Có tab Trộn đề liên kết quy trình Typst → nhiều mã đề → đáp án/QR → OMR.
- Giao diện Trộn đề đã có cấu hình loại câu, mã đề, seed và chế độ trộn.
- HDSD đã có trang hệ sinh thái và các liên kết module độc lập.
- Mẫu tải về `05_full_de_thi_mau.typ` đã sửa API lỗi:
  - bỏ đối số cũ `show-hyperlink` khỏi `exam-mode`;
  - tiếp tục dùng file dữ liệu `05_data_de_thi_mau.typ`.

### 4.3 TypstConicHub — bản nền tảng

- Website độc lập tại `typst-conic-hub/`.
- Monaco Editor tự host worker.
- Typst compiler WASM chạy trong Web Worker riêng.
- Compiler giữ sống giữa các lần build và chỉ cập nhật file thay đổi.
- Preview nhiều trang bằng canvas.
- Xuất PDF, SVG, PNG; nhiều PNG được đóng ZIP.
- Dự án đa tệp, asset nhị phân và import ZIP.
- IndexedDB local-first, tự lưu, snapshot và khôi phục.
- Giao diện ba panel trên desktop; chuyển Tệp/Editor/Preview trên mobile.
- Theme sáng/tối.
- Liên kết HDSD, Trộn đề và OMR nhưng không dùng chung CSS.

### 4.4 TypstConicHub — đợt nâng cấp 2026-07-13

- Mẫu mặc định là đúng bộ:
  - `public/hdsd/downloads/examples/05_full_de_thi_mau.typ`
  - `public/hdsd/downloads/examples/05_data_de_thi_mau.typ`
- Hub chuyển import sang `/packages/sang-math/lib.typ` và chọn `teal-pro`.
- Mẫu đầy đủ biên dịch thành 6 trang; không ghi đè dự án IndexedDB cũ.
- Có bảy template rõ theo mục đích: đề đầy đủ 05, tài liệu tự do, đề tinh gọn, sách/giáo trình, chuyên đề, Beamer 16:9 và BBT.
- Dự án chính giữ đúng tên entry `05_full_de_thi_mau.typ` cùng `05_data_de_thi_mau.typ`; migration một lần chuyển người dùng quickstart cũ sang mẫu 05 nhưng không xóa/ghi đè dự án cũ.
- Beamer bundle nội bộ `sang-beamer.typ` + 30 theme, tái sử dụng file dữ liệu 05 và hiện biên dịch sạch 91 trang slide trong WASM sau khi dành đúng chiều cao cho công thức phân số lớn.
- Sang Math Center:
  - hơn 20 macro có nhóm, mô tả, signature và snippet;
  - tìm kiếm bỏ dấu và bỏ ký tự phân cách;
  - chèn đúng vị trí con trỏ.
- Command Palette `Ctrl/Cmd + K`:
  - biên dịch, xuất file, dự án, snapshot, theme;
  - mở HDSD/Trộn đề/OMR;
  - tìm và chèn macro Sang Math.
- Tìm kiếm xuyên tất cả file trong dự án, hiển thị file/dòng và đi tới vị trí.
- Bảng Problems hiển thị toàn bộ diagnostic, hint và đi tới dòng lỗi.
- Nhận diện cam–xanh lá và hover được áp dụng cho landing + Studio.
- Outline tự đọc heading, phần thi và 26 câu TN/ĐS/TLN/TL của bộ mẫu; bấm để mở đúng tệp và dòng.
- Exam Designer cho phép chọn trực quan 12 theme đề thi, sửa an toàn cấu hình Typst và tự biên dịch lại.
- Preview hỗ trợ click nội dung để trở về source: đã kiểm tra tiêu đề về `05_full_de_thi_mau.typ:62` và thân câu hỏi về `05_data_de_thi_mau.typ:6`; nội dung do package sinh hoàn toàn sẽ báo rõ khi không có literal nguồn trong dự án.
- Monaco nạp đầy đủ Suggest Controller để gợi ý bằng `#` và nút `Gợi ý` hoạt động ổn định.
- README và smoke test riêng cho Hub.

### 4.5 Sang Math — hợp đồng phân số lớn

- Phân số thông thường và `dfrac` luôn dùng display style theo yêu cầu sản phẩm.
- Công thức inline display-style có hộp bố cục với khoảng thở trên/dưới, tránh đè dòng trong đoạn văn, danh sách, đề thi, sách và Beamer.
- `tfrac`/`tfrac-tex` là ngoại lệ nhỏ có chủ ý; không còn phụ thuộc state nên kết quả ổn định giữa các lần layout.
- Đã đồng bộ phần lõi giữa `typst-pkg-sang-math/`, `typst-pkg-submit/`, các bản phân phối HDSD/guide và `src/typst-system/`.
- Contract test đo trực tiếp chiều cao để khẳng định phân số mặc định và `dfrac` lớn hơn `tfrac`, đồng thời có stress test phân số lồng không chèn dòng trống.

## 5. Kiểm thử đã chạy

### 5.1 TypstConicHub

Các lệnh đã qua:

```bash
npm run build:hub
npm run test:hub:smoke
npm run build:public
npm run deploy:hub
```

Smoke test production gần nhất:

- Mẫu `Đề thi đầy đủ 05`: 6 canvas, 2 file, khoảng 1.5–1.9 giây.
- Mẫu `Đề thi Sang Math`: 2 canvas, khoảng 0.09–0.13 giây.
- Snapshot production `b3504302` đã qua kiểm tra trực tiếp; alias `typstconichub.pages.dev` đang phục vụ bundle `index-SCaE3cdR.js`.
- Không có diagnostic Typst.
- Sang Math Center tìm đúng `Câu đúng / sai`.
- Command Palette tìm đúng `Xuất tài liệu PDF`.
- Tìm toàn dự án trả kết quả và điều hướng được.
- Click preview đi đúng source ở cả entry 05 và file dữ liệu 05.
- Desktop và mobile đều khởi động Monaco/preview.

Kiểm thử package đã qua:

- public API contract;
- fraction layout contract cho bản canonical và bản submit;
- 18 exam theme + 6 biến thể tính năng;
- đúng file `05_full_de_thi_mau.typ`: 6 trang.

Smoke script: `scripts/test-hub-smoke.mjs`.

### 5.2 Cảnh báo build đã biết

- Monaco chunk khoảng 2.5 MB trước gzip; đây là cảnh báo kích thước, không phải lỗi runtime.
- Root public build rất lớn vì nhúng nhiều file Typst; Vite báo nhiều dynamic import không tách chunk được.
- Trước đó `npm audit` báo một số dependency alert; không chạy `npm audit fix --force` nếu chưa rà breaking change.

## 6. P0 đã hoàn thành

### P0. Cơ chế cập nhật Hub không giữ bản cũ — hoàn thành

- Cache đã lên `typst-conic-hub-v2`.
- Navigation dùng network-first và có fallback offline.
- Asset hash/WASM dùng cache-first; cache cũ được dọn khi activate.
- Có thông báo bản mới; Studio flush IndexedDB trước khi gửi `SKIP_WAITING` và chỉ reload khi controller đã đổi.

### P0. Autocomplete Sang Math trong Monaco — hoàn thành

- Dùng chung catalog với Sang Math Center, có signature, mô tả và snippet.
- Xử lý vùng thay thế khi đã gõ `#`.
- Provider chỉ đăng ký một lần kể cả React StrictMode.
- Suggest Controller được bundle cục bộ; gõ `#`, `Ctrl/Cmd + Space` và nút `Gợi ý` đều dùng được.

## 7. Backlog tiếp theo — thứ tự đề nghị

### P1. Studio productivity

1. ~~Outline tài liệu: phần, heading, câu TN/DS/TLN/TL; bấm để đi tới dòng.~~ Hoàn thành 2026-07-13.
2. Quick Fix cho lỗi phổ biến:
   - thiếu import Sang Math;
   - sai tên theme;
   - `True`/`False` sai cấu trúc;
   - `d-signs` của BBT sai số phần tử.
3. ~~Đổi theme đề thi bằng giao diện, không phải sửa chuỗi trong code.~~ Hoàn thành 2026-07-13 với 12 theme.
4. Project settings: entry file, metadata đề, font và khổ giấy.
5. So sánh snapshot/diff trước khi khôi phục.

### P1. Luồng Trộn đề ↔ Hub ↔ OMR

1. ~~Định nghĩa một `Conic Exam Passport v1` duy nhất~~ — hoàn thành lớp hợp đồng và validator ngày 2026-07-15:
   - metadata kỳ thi;
   - mã đề;
   - mapping câu/phương án;
   - đáp án TN/DS/TLN;
   - loại phiếu + phiên bản schema;
   - checksum.
2. Hub xuất passport cùng ZIP/PDF.
3. Trộn đề sinh passport/QR theo từng mã.
4. OMR nhập passport từ file, ảnh QR hoặc camera.
5. ~~Có validator, checksum và thông báo version không tương thích ở lớp hợp đồng.~~ Việc nối UI import/export còn đi cùng bước 2–4.

### P1. HDSD rõ ràng hơn

1. Viết lại HDSD theo quy trình thay vì chỉ liệt kê API.
2. Mỗi macro có ví dụ tối thiểu, preview và nút mở trong Hub.
3. Hoàn thiện phần BBT:
   - giải thích quy luật `d-signs`;
   - ví dụ tiệm cận đứng, cực trị và hàm phân thức;
   - giải thích `w1`, `w2`, `h1`, `h2`, `h3`, `shade`, `ranks`.
4. Kiểm tra cỡ chữ và responsive trên điện thoại.

### P2. Năng lực nâng cao

1. Web Share / PWA install cho điện thoại và Chromebook.
2. Nhập ảnh bằng kéo-thả/clipboard và tự tạo `image(...)`.
3. Search/replace toàn dự án.
4. Export DOCX/SCORM/video chỉ nên là module hoặc workflow riêng, không nhồi trực tiếp vào core compiler.
5. Tùy chọn đồng bộ cloud chỉ làm sau khi local-first ổn định; không bắt đăng nhập.

## 8. Definition of Done

Một thay đổi chỉ được coi là xong khi:

- build đúng module thành công;
- không làm thay đổi CSS/DOM của module khác;
- template mặc định và ít nhất một template Sang Math biên dịch sạch;
- không ghi đè dự án IndexedDB hiện có;
- desktop và mobile không mất thao tác chính;
- nếu sửa Service Worker phải kiểm tra cả người dùng mới và người dùng có cache cũ;
- nếu sửa OMR phải kiểm tra preview, ảnh chọn từ máy và camera;
- deploy xong phải kiểm tra cả snapshot URL và production URL.

## 9. Quy tắc làm việc cho model/agent tiếp theo

1. Đọc file này và README của module sắp sửa.
2. Chạy `git status --short`; worktree hiện có rất nhiều thay đổi/xóa file thuộc các đợt trước.
3. Không reset, checkout hoặc khôi phục hàng loạt file của người dùng.
4. Chỉ sửa file trong đúng scope; tránh formatter chạy toàn repo.
5. Dùng `apply_patch` cho chỉnh sửa thủ công.
6. Không deploy HDSD/OMR khi task chỉ liên quan Hub.
7. Không tự publish package `sang-math`.
8. Ghi lại URL snapshot và kết quả test mới vào file này sau mỗi mốc lớn.

## 10. Lệnh nhanh

```bash
# Hub
npm run dev:hub
npm run build:hub
npm run preview:hub
npm run test:hub:smoke
npm run deploy:hub

# Root public app
npm run build:public

# HDSD
npm run deploy:hdsd
```

Không dùng lệnh destructive như `git reset --hard` hoặc `git checkout --` trong worktree này.
