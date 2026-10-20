# Sang Math cho Word – hướng dẫn cho AI/model (ĐỌC FILE NÀY TRƯỚC, đừng quét cả dự án)

Add-in Word (Typst chạy bằng WASM trong trình duyệt). Đây là một module độc lập: **chỉ làm việc trong `tools/sang-mathtype/`**,
không đọc `exam/`, `desktop/`, các website khác, hay `plan.md` nếu không cần. Người dùng: thầy Nguyễn Văn Sang, trả lời tiếng Việt.

## Việc → mở đúng file
| Muốn làm | File |
|---|---|
| Thêm/sửa **mẫu rời** của bảng kéo thả | `src/draw/stamps-ext.mjs` (khai báo, props) + `src/draw/sm-draw.typ` (hàm vẽ CeTZ). Mẫu cũ ở `src/draw/stamps.mjs` |
| Hình mẫu hoàn chỉnh (tab "Hình mẫu có sẵn") | `src/draw/templates/*.typ` (đầu file có `// @ten`, `// @nhom`…) |
| Giao diện bảng vẽ (kho mẫu, thu phóng, căn, phím tắt) | `src/editor.js`, `src/taskpane.html` (khối `#edMode`), `src/taskpane.css` (cuối file) |
| Chèn vào Word / đọc lại alt text | `src/word.js` |
| Dựng công thức/hình → SVG/PNG | `src/engine.js` |
| Tự cập nhật, số phiên bản | `src/updater.js`, `build.mjs` (ghi `version.json`), `src/_headers` |
| Đóng gói | `build.mjs`, `draw-build.mjs` (dựng ảnh xem trước mẫu bằng `typst` CLI, có cache `.cache/`) |
| Trình cài cho người dùng | `release/sangmath/` (ở gốc repo) + `.github/workflows/sangmath-release.yml` |

## Quy ước khi thêm mẫu vẽ
- Hàm trong `sm-draw.typ`; tham số chỉnh được; **không đặt tên trùng hàm CeTZ** (fill, stroke, anchor, scale, rotate, ellipse…).
- Tên tham số nhiều chữ như `mu`, `sigma`, `alpha`, `phi` sẽ **che ký hiệu trong `$...$`**: dùng tên khác (`ky`, `dl`, `ga`).
- Biểu thức hàm số: dấu trừ phải có khoảng trắng (`x - 1`), đã được `normExpr` xử lý.
- Nhãn tiếng Việt; công thức hóa dùng `ch("H2SO4")` / `ct("…")`; hình không gian dùng bộ dựng 3D `da-dien`, `pj` (chiếu xiên hoặc phối cảnh).

## Kiểm tra nhanh (không cần mở Word)
```bash
cd tools/sang-mathtype
node tests/check-stamps.mjs <tiền-tố-id> ...   # dịch từng mẫu bằng typst, ảnh ở .cache/stamp-check/ (sheet-0.png là lưới xem nhanh)
node build.mjs                                   # phải không có ⚠
node serve.mjs                                   # https://localhost:3155 (có certs/), mở taskpane.html?debug → thẻ Vẽ hình
```
Xem ảnh `sheet-*.png` bằng công cụ Read thay vì đọc mã. Một lần build đầy đủ mất ~3 phút (dựng ảnh xem trước toàn bộ mẫu nếu thư viện đổi).

## Phát hành
- Deploy: ở gốc repo, nhánh `main`: `npm run deploy:sangmath-word` (đọc `DEPLOYMENT-SAFETY.md` trước; chỉ project `sangmath-word`). Người dùng tự nhận bản mới.
- Chỉ khi đổi trình cài: sửa `release/sangmath/*` rồi `git tag sangmath-vX.Y.Z && git push origin sangmath-vX.Y.Z` (workflow tự đăng Releases).
- Không commit `certs/`, `dist/`, `out/`, `.cache/` (đã có trong `.gitignore`).

## Hiệu năng/dung lượng docx
Ba định dạng chèn (mặc định `svgn`): `svgn` = SVG + PNG dự phòng cực nhỏ (1/8 độ phân giải, cho Office 2016+/365, nhẹ nhất);
`svg` = SVG + PNG dự phòng 1/3 (tương thích Google Docs, Word cũ); `png` = PNG đầy đủ. Mac app dán thẳng SVG. Xem `packageXml` trong `src/word.js`.
Một đề có hàng nghìn công thức: mỗi công thức là một SVG nhỏ + PNG dự phòng; giữ `svgn` để file nhẹ.

## Offline / web / PWA
`build.mjs` ghi `dist/sw.js` (từ `src/sw.template.js`, danh sách mọi tệp) và `app.webmanifest`; `taskpane.js` đăng ký service worker. Lần đầu có mạng thì lưu toàn bộ ~475 tệp, sau đó chạy offline (đã thử bằng Chrome: tắt máy chủ vẫn dựng được hình). Mỗi build có CACHE riêng nên bản mới tự thay bản cũ.
Service worker **không đăng ký được với chứng chỉ tự ký** (`https://localhost:3155`) hay trong khung trình duyệt nhúng; muốn thử offline dùng `python3 -m http.server --bind 127.0.0.1` trong `dist/` + Chrome. Add-in trong khung Word có chạy service worker hay không thì chưa kiểm chứng. Công cụ Trộn đề (Pyodide) chưa hỗ trợ offline.
Trang web đầy đủ: `taskpane.html?app=1` (nút "Mở Sang Math trên web" ở `index.html`); có Lưu PNG/SVG, Lưu/Mở dự án (.json).
