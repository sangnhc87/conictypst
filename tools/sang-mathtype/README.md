# Sang Math cho Word

Công cụ thay MathType: gõ công thức **Typst** hoặc **LaTeX**, chèn vào Word thành hình đẹp kiểu TeX (font New Computer Modern),
bấm vào công thức bất kỳ để **sửa lại**. Không dùng Equation của Word.

- **SVG vector** (mặc định): nét nhất, kèm PNG dự phòng. **PNG**: 576 PPI, nền trong suốt, cho Word cũ/Google Docs.
- Căn baseline tự động, cắt sát nét, chọn cỡ chữ và màu.
- "Phân số, cận to (display)": mặc định bật, phân số và cận tích phân/tổng to như `dfrac`.
- "Đánh số công thức": dòng `[công thức giữa] ...... (n)`, n là trường `SEQ Equation` tự tăng (F9 hoặc khi in thì cập nhật).
- Mã nguồn công thức lưu trong alt text của hình (tiền tố `SMATH1:`); chọn hình thì khung soạn tự nạp lại.

## Dùng (Mac, Word Mac): app desktop, cách chính
Tạo app một lần: `tools/sang-mathtype/desktop/make-app.sh` → `tools/sang-mathtype/out/Sang Math.app` (kéo vào Applications cũng được).
Lần đầu chèn, macOS hỏi quyền cho Sang Math điều khiển Word: bấm **OK**. (Không tạo app thì double-click `Mo-SangMath.command` ở thư mục gốc.)

Cửa sổ Sang Math rộng, nổi bên cạnh Word, vừa khít không cuộn trang (trái: ký hiệu; phải: ô mã, xem trước, nút), bố cục như trình soạn công thức:
- **Ô tìm ký hiệu** và **danh mục** Toán / Lý / Hóa (≈550 ký hiệu, mẫu công thức, đơn vị, nguyên tố, phản ứng). Bấm ký hiệu thì mã chèn vào ô, chỗ trống đầu tiên được bôi đen để gõ đè; đang bôi đen chữ thì chữ đó được đưa vào chỗ trống.
- **Thanh nhanh** các ký hiệu hay dùng; ô mã Typst hoặc LaTeX (nút ký hiệu mờ nếu chỉ có ở Typst); **xem trước** lớn.
- **Chèn:** đặt con trỏ trong Word → **Chèn vào Word** (hoặc Cmd+Enter).
- **Sửa:** bấm chọn công thức bất kỳ trong Word (mới hay cũ), Sang Math tự nạp lại mã trong chưa đầy 1 giây (nhãn "Đang sửa"). Không bấm trúng được hình thì đặt con trỏ sát công thức (ngay trước/sau) rồi nhấn **⌘⇧E** hoặc nút "Lấy công thức trong Word": app tự chọn công thức đó. Sửa mã rồi **Cập nhật**; công thức vẫn được chọn để sửa tiếp. Hình công thức có nền gần trong suốt 2% và lề nhỏ để bấm trúng cả vùng, không chỉ đúng nét chữ.
- **Đổi hàng loạt:** mục "Đổi cỡ chữ / màu hàng loạt" dựng lại mọi công thức Sang Math trong tài liệu (hoặc vùng chọn) theo cỡ chữ / màu mới.
- **Icon ∑ ở thanh menu macOS:** bấm để ẩn/hiện, menu có "Sửa công thức đang chọn". **⌘⇧M** ẩn/hiện từ bất kỳ đâu. Đóng cửa sổ chỉ ẩn đi; thoát bằng menu icon hoặc Cmd+Q.
- **Nút trên thanh menu Word:** tab Home → nhóm **Sang Math** → nút Sang Math (đưa cửa sổ app lên). Cài một lần: chạy app (nó mở HTTPS ở cổng 3155), tin cậy chứng chỉ localhost (xem mục Add-in), chép `manifest.xml` vào `~/Library/Containers/com.microsoft.Word/Data/Documents/wef/`, thoát hẳn rồi mở lại Word. App phải đang chạy (menu icon ∑ có "Tự mở khi bật máy").
- Công thức là hình (SVG vector hoặc PNG) có mã nguồn trong alt text, nên lưu file, mở lại vẫn sửa được.

Lưu ý: app dùng AppleScript nên chỉ chạy với Word Mac, chèn vào tài liệu đang mở phía trước; không hỏi Word liên tục nên Word không bị giật. Chưa có đánh số công thức trong app (có trong add-in).

## Add-in Office (Word Windows/Online, hoặc muốn nằm ngay trong Word)
```bash
node tools/sang-mathtype/build.mjs
node tools/sang-mathtype/serve.mjs   # https://localhost:3155
```
Mac: tin cậy chứng chỉ (bạn tự chạy) `security add-trusted-cert -r trustRoot -p ssl -k ~/Library/Keychains/login.keychain-db tools/sang-mathtype/certs/localhost.pem`, chép `manifest.xml` vào `~/Library/Containers/com.microsoft.Word/Data/Documents/wef/`, mở lại Word → Chèn → Phần bổ trợ của tôi → Developer Add-ins → **Sang Math**.
Cho người khác dùng: host `dist/` ở HTTPS thật và đổi `https://localhost:3155` trong `manifest.xml`.

## Cấu trúc
- `src/engine.js` — Typst/LaTeX (mitex) → SVG → PNG, đo baseline bằng điểm đánh dấu, cắt sát nét, làm phẳng SVG cho Word.
- `src/word.js` — chèn bằng `insertOoxml` (ảnh inline + `w:position` đúng baseline, `svgBlip` + PNG dự phòng), đọc lại alt text.
- `src/taskpane.*` — giao diện dùng chung cho app và add-in; `src/desktop.js` — cầu nối app.
- `src/palette.js` — bộ ký hiệu Toán/Lý/Hóa (Typst + LaTeX); `src/engine.js` cũng dựng biểu tượng cho nút.
- `desktop/` — app Electron (`main.mjs`: cửa sổ, icon menu, phím tắt; `preload.cjs`), `word-applescript.mjs` (chèn/đọc/thay hình trong Word bằng AppleScript), `make-app.sh` (đóng gói .app).

## Phát hành online (Cloudflare Pages)
Production: <https://sangmath-word.pages.dev/> (trang giới thiệu), `/taskpane` (dùng trực tiếp trên web), `/manifest.xml` (add-in).
Deploy: `npm run deploy:sangmath-word` (chỉ project `sangmath-word`; tự dọn, giữ tối đa 2 bản). Build phát hành dùng `SM_BASE_URL` để manifest trỏ về địa chỉ thật.
Người khác cài add-in: Word trên web (Upload My Add-in), hoặc quản trị Microsoft 365 triển khai `manifest.xml` cho cả tổ chức; Word Mac cá nhân chép manifest vào thư mục `wef`. App Mac (`make-app.sh`) vẫn là cách chèn/sửa nhanh nhất trên Mac.

## Chuyển đổi hai chiều (add-in trong Word, mục "Chuyển đổi Equation của Word ⇄ Sang Math")
- **Equation → Sang Math:** `src/omml2latex.js` đọc cấu trúc Equation (OMML) thành LaTeX, dựng lại bằng chính bộ dựng rồi thay đúng chỗ (`src/convert.js`). Nút "vùng đang chọn" hoặc "cả tài liệu".
- **Sang Math → Equation:** mã nguồn lấy từ alt text, LaTeX đi qua mitex thành Typst, `src/omml.js` đổi sang OMML (`src/toequation.js`). Hình đứng một mình thành Equation riêng một dòng, còn lại thành Equation nội dòng.
- Kiểm thử: `node tools/sang-mathtype/tests/office-bridge.test.mjs` (Word giả) và `node tools/sang-mathtype/tests/omml.test.mjs` (mọi mục trong bảng ký hiệu).


## Công cụ soạn (thẻ thứ năm)
Sửa đề ngay trong tài liệu Word đang mở, cả bản add-in (Office.js: Word Online / Windows / Mac) và app Mac (AppleScript). Chọn **Toàn tài liệu** hoặc **Vùng chọn** (bôi đen trong Word) ở thanh trên cùng; mọi thao tác đều có nút **Hoàn tác** (nhớ 20 bước gần nhất, hoàn tác theo thứ tự ngược).

1. **Đánh số lại** Câu 1, 2, 3… và phương án A. B. C. D. (Phần II: a) b) c) d)); nhận cả phương án nằm cùng một dòng (`A. … B. … C. …`).
2. **Chuẩn hóa định dạng**: phông, cỡ, giãn dòng, canh lề, khoảng cách đoạn, tiêu đề PHẦN đậm + giữa, dòng kẻ dưới tiêu đề PHẦN, "Câu n." in đậm; 4 mẫu đề có sẵn.
3. **Đáp án**: tô màu / in đậm / gạch chân phương án đúng, bỏ tô; **ẩn / hiện** lời giải và bảng đáp án cuối đề (chữ ẩn của Word, không xóa nội dung). Đáp án lấy từ đề (bộ máy `exam/engine`: chữ cái đã gạch chân; add-in chạy bằng Pyodide, app Mac đọc bản .docx đã lưu) hoặc gõ tay (`1A 2B 3C…`).
4. **Chèn** bảng đáp án, khung điểm, phiếu trả lời, mã QR chứa đáp án (`SM1|mã đề|1A,2B,…|5DSDS|6=2,5`; D = Đúng, S = Sai), tại con trỏ hoặc cuối tài liệu.
5. **Xuất / nhập** danh sách câu hỏi ⇄ bảng Word (hoặc chép / dán từ Excel, Google Sheets).
6. **Giải một câu bằng AI**: dán khóa API của thầy cô (Claude hoặc dịch vụ tương thích OpenAI). Khóa chỉ lưu trong bộ nhớ của trình duyệt / app trên máy này và chỉ được gửi tới địa chỉ nhà cung cấp đã chọn, kèm nội dung câu hỏi.

Mã: `src/tools/` (parse.js, plans.js, runner.js, solve.js, ui.js; host-office.js và host-desktop.js là hai cầu nối), `desktop/word-tools.mjs` (dựng AppleScript). Kiểm thử: `node tests/tools.test.mjs`, `tests/tools-office.test.mjs`, `tests/tools-mac.test.mjs`; thử với Word Mac thật (tạo tài liệu nháp rồi đóng, không lưu): `SM_LIVE_WORD=1 node tests/live-word-tools.mjs`.

Lưu ý: công thức dạng hình không có chữ nên không vào được cột nội dung khi xuất bảng; lời giải AI là chữ thường (ký hiệu Unicode), cần đọc lại trước khi dùng.

## Tự cập nhật khi deploy (add-in web)
Add-in là trang web: manifest chỉ trỏ tới địa chỉ cố định, nên **chỉ cần `node build.mjs` rồi deploy `dist/`** (đúng lệnh chuẩn trong `DEPLOYMENT-SAFETY.md`), mọi máy tự dùng bản mới, không phải cài lại.
- `_headers` đặt `Cache-Control: no-cache` cho trang, JS và `draw/*` để trình duyệt luôn kiểm tra bản mới.
- Mỗi lần build ghi `dist/version.json`; khung Sang Math đang mở sẽ so phiên bản (khi bật lại cửa sổ và mỗi 10 phút) và hiện thanh "Có bản Sang Math mới – Cập nhật ngay". Số bản hiện ở chân khung.
