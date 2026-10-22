# SANG MATH – TÀI LIỆU TỔNG QUAN CHO AI/MODEL (đọc file này là đủ, đừng quét cả dự án)

> Cập nhật: 2026-10-21. Người dùng: thầy **Nguyễn Văn Sang** (GV THPT Nguyễn Hữu Cảnh, TP.HCM) – **trả lời bằng tiếng Việt**, ngắn gọn, nói thật phần nào chưa kiểm chứng.
> Phạm vi: **chỉ làm trong `tools/sang-mathtype/`** (+ `release/sangmath/`, `.github/workflows/sangmath-release.yml`). Không đọc/sửa `exam/`, `desktop/` (trừ khi việc nói rõ), các website khác trong repo, `plan.md`.
> Hai email admin `nguyensangnhc@gmail.com`, `sangbeau@gmail.com` luôn miễn phí toàn bộ (quy ước chung của repo).

## 1. Sản phẩm là gì
**Sang Math** = công cụ thay MathType cho Word, gồm 4 cách dùng chung một mã nguồn (trang web `taskpane.html`):
1. **Add-in Office** (Word Windows/Mac/Online): khung bên phải Word. Chèn công thức (Typst hoặc LaTeX) và hình vẽ Toán–Lý–Hóa thành ảnh SVG/PNG, bấm vào để sửa lại (mã nguồn nằm trong alt text, tiền tố `SMATH1:`).
2. **Trang web độc lập** `https://sangmath-word.pages.dev/taskpane?app=1`: cùng giao diện, không cần Word; lưu PNG/SVG, lưu/mở dự án `.json`; **chạy offline** sau lần đầu (service worker); cài được như PWA.
3. **App Mac** (Electron, `desktop/`): điều khiển Word bằng AppleScript. Chưa phát hành cho người dùng.
4. **Add-on Google Docs** (`gdocs/`): khung bên Docs (Apps Script), chèn ảnh PNG.

Mọi thứ chạy **trong trình duyệt/Word của người dùng**, không có máy chủ riêng: Typst biên dịch bằng WASM (`@myriaddreamin/typst-ts-web-compiler`, ~29 MB, tách đôi vì Cloudflare Pages giới hạn 25 MiB/tệp), LaTeX→Typst bằng `mitex.wasm`, trộn đề bằng Pyodide.

Các thẻ lớn trong giao diện (`src/tabs.js`): **Công thức** · **Vẽ hình** (bảng kéo thả + "Hình mẫu có sẵn") · **Công cụ soạn** (đánh số lại câu, định dạng đề, bảng đáp án, phiếu trả lời, QR… cho Word) · **Trộn đề / Làm đẹp đề** (Python).

## 2. Bản đồ tệp (mở đúng tệp theo việc)
| Việc | Tệp |
|---|---|
| **Thêm/sửa mẫu rời** của bảng kéo thả | `src/draw/stamps-ext.mjs` (khai báo + thuộc tính) và `src/draw/sm-draw.typ` (hàm vẽ CeTZ). Mẫu đợt 1: `src/draw/stamps.mjs` (+ danh sách `BASE`/`MORE`, `stampDocument`, `sceneDocument`, `normExpr`) |
| **Vẽ chất hữu cơ/vô cơ từ SMILES** (công thức khung, mô hình quả cầu–que; danh sách ~135 chất THPT) | `src/draw/smiles.mjs` (parser + bố cục 2D + sinh mã CeTZ, tự viết, offline), `src/draw/chat-list.mjs` (tên → SMILES), mẫu `hc-*` ở cuối `stamps-ext.mjs`; hàm `khung` trong `sm-draw.typ` |
| Hình mẫu hoàn chỉnh ("Hình mẫu có sẵn", ~32 hình) | `src/draw/templates/*.typ` (dòng đầu `// @ten`, `// @nhom`, `// @muc`, `// @mota`) |
| Giao diện bảng kéo thả (kho mẫu, thu phóng, căn, undo, dự án) | `src/editor.js`; HTML khối `#edMode` trong `src/taskpane.html`; CSS ở **cuối** `src/taskpane.css` |
| Thẻ Vẽ hình (chuyển chế độ, hình mẫu có sẵn) | `src/figure.js` |
| Dựng Typst → SVG/PNG, nạp WASM, đo baseline, làm phẳng SVG | `src/engine.js` (`renderFormula`, `renderFigure`, `renderStamp`, `flattenSvg`) |
| Chèn vào Word (OOXML), đọc lại alt text | `src/word.js` (`packageXml`, `drawingRun`, `encodeMeta/decodeMeta`) |
| Giao diện chính, bảng ký hiệu | `src/taskpane.js`, `src/taskpane.html`, `src/palette.js` (≈550 ký hiệu Toán/Lý/Hóa) |
| Cầu nối: Office.js / app Mac / Google Docs | `src/word.js` (Office), `src/desktop.js` + `desktop/*.mjs` (Mac), `src/gdocs.js` + `gdocs/` |
| Nút ☕ chân trang + hộp thoại mời cà phê (QR VietQR VPBank, số TK) | `#coffeeBtn`/`#coffeeDlg` (`<dialog>`) trong `src/taskpane.html`, nghe sự kiện trong `src/taskpane.js`, `src/qr-donate.png` (copy từ `images/qr-donate.png` của repo), CSS cuối `taskpane.css` |
| Tự cập nhật + số phiên bản | `src/updater.js`, `build.mjs` (ghi `dist/version.json`) |
| Offline/PWA | `src/sw.template.js` (→ `dist/sw.js`), `src/app.webmanifest`, `icons/icon-192/512.png` |
| Đóng gói | `build.mjs` (toàn bộ) và `draw-build.mjs` (gói CeTZ + dựng ảnh xem trước mẫu bằng `typst` CLI, có cache `.cache/`) |
| Máy chủ thử cục bộ | `serve.mjs` (HTTPS cổng 3155 nếu có `certs/`) |
| Kiểm tra mẫu | `tests/check-stamps.mjs`; các test khác `tests/*.test.mjs` (OMML, Office bridge, gdocs, công cụ) – chưa rà lại cách chạy ở phiên gần nhất |
| Trình cài cho người dùng | `release/sangmath/**` + `.github/workflows/sangmath-release.yml` (ở **gốc repo**) |
| **Làm đẹp tài liệu bất kỳ** (khối ★ đầu thẻ Công cụ soạn: đổi danh sách tự động → chữ, đánh số lại Câu/1./a)/I., dính chữ sau dấu câu, khoảng trắng ngoặc, viết hoa đầu câu, in đậm/canh tab phương án A-D, chống mồ côi keepWithNext, căn giữa bảng, ngắt dòng mềm, lề A4 NĐ30, format đoạn) | `src/tools/doc-clean.js` (các hàm `plan*` thuần + `runDocClean` gọi Office.js), khối `#tlDocBox` trong `taskpane.html`, nối ở `src/tools/ui.js` (chỉ khi `host.name === 'office'`), test `tests/doc-clean.test.mjs` (10 test pass). **Phần gọi Word chưa thử trong Word thật** |
| Công cụ soạn đề cho Word | `src/tools/*` (`parse`, `plans`, `runner`, `ui`, host-office/host-desktop), `src/omml*.js`, `src/convert.js`, `src/toequation.js` |
| Trộn đề | `src/exam*.js`, `src/exam.worker.js`, `exam/engine/*.py` |

Hướng dẫn sử dụng cho giáo viên: `src/hdsd.html` (→ `https://sangmath-word.pages.dev/hdsd`, có mục #smiles #hoa #ly #toan…); **khi thêm tính năng/mẫu mới, cập nhật trang này**. Link 📖 nằm ở kho mẫu (`#edHelp`, đổi theo nhóm) và trong bảng thuộc tính mẫu `hc-*`.

Tài liệu phụ: `README.md` (dùng app/add-in), `HUONG-DAN-TAO-WEB-VE-HINH.md` (tách bảng vẽ thành website riêng).

## 3. Hệ thống vẽ hình (phần phát triển nhiều nhất)
- **511 mẫu rời** (Hóa 265 · Vật lí 110 · Toán 130 · Chung 6), mỗi mẫu: `S(id, nhóm, nhóm-con, tên, 'cetz'|'content', code(p), props, extra)`.
  - `'cetz'`: lệnh CeTZ vẽ quanh gốc (0,0). `'content'`: khối Typst đặt giữa gốc (bảng biến thiên, bảng xác suất…). `extra.needs: ['bbt'|'geo']` để nạp thêm thư viện sang-math (`/sang-math/bbt.typ`, `geometry.typ` lấy từ `../../typst-pkg-sang-math/`).
  - `props` dùng helper `num/txt/bool/sel/col`; `p` đã gộp mặc định; chuỗi người dùng nhập phải qua `q()` (escape) hoặc `normExpr()` (biểu thức hàm).
  - `stamps-ext.mjs` nhận helper từ `stamps.mjs` qua `makeExt({...})`; `R(k,nhãn,mặc định,min,max,bước)` là phím tắt `num`.
- **Hàm vẽ** trong `sm-draw.typ`: dụng cụ Hóa (`coc`, `erlen`, `binh-cau`, `ong-nghiem`, `buret`, `binh-kip`, `kieng`, `thap-chung-cat`…), sơ đồ thí nghiệm (`tn-so2`, `tn-nh3`, `dieu-che-cl2`…), `khung`/`dong-phan`/`o-mang` (công thức khung, đồng phân, tinh thể), mạch điện `sym(a,b,kind)`, đồ thị (`truc`, `duong`, `do-thi`, `do-thi-dac-biet`, `ba-do-thi-khi`), 3D (`pj`, `da-dien`, `chop-deu`, `lap-phuong`, `thiet-dien-lp`, `mat-cau-3d`…), conic, xác suất/thống kê (`cay-xs`, `histogram`, `hop-boxplot`), `mien-nghiem`…
- **Bộ dựng 3D**: `pj(kieu:"co-dien"|"phoi-canh")` trả `{f, v}` (chiếu + vectơ nhìn); `da-dien(vs, fs, pr, …)` vẽ khối lồi, cạnh khuất nét đứt tự động (mặt nhìn thấy = pháp tuyến·v > 0). Cầu cần `phoi-canh` (chiếu vuông góc để đường tròn khớp).
- Bảng kéo thả lưu `scene = {W, H, items:[{id,k,x,y,s,r,f,z,p}]}` (cm, gốc góc dưới trái). Dự án `.json` = `{app:'sangmath-editor', v:1, W, H, items}`. Nháp tự lưu ở `localStorage` (`sangmath.editor.draft`), yêu thích/gần đây (`sangmath.editor.favs|recent`).

- **Cân bằng phương trình**: `src/draw/can-bang.mjs` (`balance(text)` – ma trận nguyên tố + điện tích, khử Gauss trên phân số; báo lỗi tiếng Việt nếu nhiều nghiệm/không cân bằng được) → hàm `pt-hh` trong `sm-draw.typ`; mẫu `hh-*` cuối `stamps-ext.mjs`.
- **Bộ hình theo bài**: `src/draw/bo-hinh.mjs` (27 bộ: id mẫu + props), tab `📚 Bộ hình theo bài` trong `editor.js` (`renderSets`, `addSet`: dựng ảnh rồi xếp lưới theo kích thước thật, co tỉ lệ nếu >40×30 cm). Thêm bộ: thêm một dòng `B(...)`; id mẫu phải tồn tại.
- **Xoay 3D**: các mẫu hình không gian có prop `yaw`/`pitch` (+`kieu`); `renderInspector` hiện ô kéo chuột và 5 góc nhìn nhanh khi mẫu có cả hai prop (cập nhật nhẹ, không dựng lại bảng thuộc tính để ô kéo không mất).
- **SMILES**: `skeletonCode(smi,{len,ghiC})` / `ballStickCode(smi,{len})` trả chuỗi `khung(...)` / `mo-hinh(...)`. Hỗ trợ nguyên tử hữu cơ + `[ngoặc]`, `- = # :`, nhánh, vòng `1-9/%nn`, thơm (Kekulé hoá), điện tích; bỏ qua lập thể. Bố cục: vòng đa giác đều, vòng ngưng tụ lật qua cạnh chung, mạch zigzag (nhánh lớn tiếp tục mạch chính). Chưa tối ưu tránh chồng cho phân tử rất nhánh (vd. axit xitric hơi chồng nhãn). Thêm chất mới: thêm một dòng `[nhóm, tên, SMILES]` vào `chat-list.mjs` (tự sinh mẫu + ảnh).

### Quy ước & bẫy khi thêm mẫu (đã gặp thật)
1. **Không đặt tên trùng hàm CeTZ** (`fill, stroke, anchor, scale, rotate, translate, group, line, circle, arc, rect, content, grid, ellipse, polygon, mark…`) cho hàm hoặc biến; `ellipse(...)` của CeTZ có tham số khác → dùng `circle(pos, radius: (rx, ry))`.
2. **Tham số nhiều chữ che ký hiệu trong `$…$`**: `mu, sigma, alpha, theta, phi` làm tên tham số thì `$mu$` bị thay bằng giá trị. Dùng tên khác (`ky, dl, ga, gt, dp`). Chữ đơn (`a`, `i`) thì an toàn.
3. **Dấu trừ trong biểu thức hàm phải có khoảng trắng** (`x - 1`): Typst coi `x-1` là một định danh. `normExpr` đã xử lý, nhưng preset phải bọc `q(normExpr(f))`.
4. Trong `eval(f, mode:"code")` các hàm hỗ trợ: `sin cos tan exp ln sqrt abs pow pi e log floor` (xem `eval-f`).
5. Mã Typst "code mode" dùng `if c { a } else { b }` (không có `if c then`). Bảng `fill:` phải là closure có `{ }`.
6. Nhãn chữ/công thức: `lab(pos, [..], at: "north", size: 10pt)`; hóa dùng `ch("H2SO4")`, `ct("O2, t° và H2SO4")`; chú thích có đường chỉ `chuthich(a, b, "…")`.
7. Thêm nhóm con mới là đủ (giao diện tự gom theo thứ tự xuất hiện); nhóm lớn cố định: `GROUPS = Hóa học, Vật lí, Toán, Chung`.
8. Mỗi mẫu mới cần ảnh xem trước: `draw-build.mjs` tự dựng bằng `typst` CLI khi `node build.mjs` (cache theo mã + hash thư viện; đổi `sm-draw.typ` thì dựng lại toàn bộ ~3 phút).

## 4. Chèn vào Word: định dạng, hiệu năng
- Ba định dạng (`format`): **`svgn`** (mặc định) = SVG + PNG dự phòng **1/8** độ phân giải, nhẹ nhất, cần Office 2019/365; **`svg`** = SVG + PNG dự phòng 1/3 (hợp Google Docs/Word cũ); **`png`** = PNG đầy đủ 576 PPI (5 px/pt ở add-in).
- Một đề nhiều nghìn công thức: mỗi công thức = 1 SVG nhỏ + PNG nhỏ ⇒ giữ `svgn`. App Mac dán thẳng SVG (không PNG).
- **Bẫy Word**: Typst xuất màu trong suốt dạng `#rrggbbaa`; Word không hiểu và tô **đen**. `flattenSvg` đã đổi thành `#rrggbb` + `fill-opacity/stroke-opacity/stop-opacity`. Mọi SVG đưa vào Word phải đi qua `flattenSvg`.
- Gradient/clip giữ lại (mô hình quả cầu dùng gradient). Glyph chữ được đổi thành path.
- Add-in Office mặc định `svgn` nhưng **việc sửa lại SVG sau khi chèn qua Office.js chưa kiểm chứng trong Word thật** (trước đây mặc định PNG vì lý do này). Nếu lỗi, đổi sang PNG.
- Nút "Chèn hình vào Word" chỉ hiện khi có cầu nối Word (`bridge`); editor đọc lại mỗi lần `setBridgeButtons()`/sự kiện `sm-bridge`.

## 5. Build · thử · phát hành
```bash
cd tools/sang-mathtype
node tests/check-stamps.mjs <tiền-tố-id> ...   # dịch từng mẫu bằng typst CLI → .cache/stamp-check/<id>.png + sheet-N.png (lưới 12 ảnh)
node build.mjs                                   # → dist/ ; phải KHÔNG có dòng ⚠ ; thêm --out=<thư mục>, SM_BASE_URL=https://… cho bản phát hành
node serve.mjs                                   # https://localhost:3155 (chứng chỉ tự ký trong certs/) → mở taskpane.html?debug
```
- `?debug` bật `window.__ed = { scene, addItem, select, code, loadScene, finalImage }` để thử bằng script.
- **Xem ảnh** `sheet-*.png` bằng công cụ Read thay vì đọc mã; sửa nhãn chồng/lệch rồi chạy lại.
- Cần `typst` CLI (`/usr/local/bin/typst`) và gói `@preview/cetz:0.5.2`, `oxifmt:1.0.0` trong cache Typst (`~/Library/Caches/typst/packages/preview`); ImageMagick (`magick montage`) cho lưới ảnh.
- **Thử offline/service worker**: không đăng ký được với chứng chỉ tự ký (`https://localhost:3155`) hay trong khung trình duyệt nhúng của Claude. Dùng `python3 -m http.server 3300 --bind 127.0.0.1` trong `dist/` và Chrome thật (đã thử: tắt máy chủ vẫn dựng được hình).

### Deploy (đã làm nhiều lần, an toàn)
1. Đọc `DEPLOYMENT-SAFETY.md` ở gốc repo. **Chỉ** project `sangmath-word` (https://sangmath-word.pages.dev/). Không đụng project khác.
2. Ở gốc repo, nhánh `main`: `npm run deploy:sangmath-word` (build vào `/private/tmp/sangmath-word-production` → `wrangler pages deploy` → tự dọn, giữ 2 bản Production/main).
3. Kiểm tra: `npm run pages:prune -- sangmath-word --dry-run` ⇒ `removableVisible: 0`; `curl https://sangmath-word.pages.dev/version.json`.
4. **Người dùng tự nhận bản mới** (add-in là trang web): `_headers` đặt `no-cache`; `updater.js` so `version.json` rồi hiện thanh "Cập nhật ngay"; service worker thay cache theo từng build.
- Thư mục `tools/sang-mathtype` đã nằm trong git (không có `certs/ dist/ out/ .cache/`). Quy trình đã dùng: tạo nhánh từ `origin/main` trong worktree, rsync mã từ thư mục chính, commit, PR, `gh pr merge --merge`, rồi deploy **từ thư mục chính** `/Users/admin/conictypst`. Thư mục chính của thầy thường **bẩn** (nhiều thay đổi riêng): không `git add -A` ở đó, bảo toàn mọi thay đổi không thuộc việc. Công cụ Write bị chặn khi ghi vào thư mục chính từ worktree: sửa trong worktree rồi đồng bộ bằng `cp`/`rsync`.

### Bản cài cho giáo viên (Releases)
- Workflow `sangmath-release.yml`, khi đẩy tag `sangmath-v*`: dựng **`SangMath-Setup.exe`** (Inno Setup, `release/sangmath/windows/SangMath.iss` + `install.ps1`), **`SangMath.dmg`** (`release/sangmath/mac/build-dmg.sh`, app shell gọi `install-mac.sh`) và script dự phòng `Cai-SangMath-Windows.cmd`, `Cai-SangMath-Mac.zip`, `Go-SangMath-Windows.cmd`. Link: https://github.com/sangnhc87/conictypst/releases/latest
- Các bản cài **chỉ đăng ký manifest** (`https://sangmath-word.pages.dev/manifest.xml`) với Word (Windows: khóa registry `HKCU\Software\Microsoft\Office\16.0\WEF\Developer`; Mac: `~/Library/Containers/com.microsoft.Word/Data/Documents/wef/sangmath.xml`), nên **không phải phát hành lại khi sửa add-in**; chỉ tag mới khi đổi trình cài. `installers/install-mac.sh`, `install-windows.ps1` được deploy cùng site.
- **Chưa ký mã** ⇒ SmartScreen/Gatekeeper cảnh báo. **Chưa thử cài trên máy Windows/Mac sạch** ở thời điểm viết tài liệu này.

## 6. Trạng thái & việc còn dở (đừng nói là xong nếu chưa)
- ✅ Đã làm: 363 mẫu, bảng kéo thả (kho yêu thích/gần đây, thu phóng, căn, undo/redo, copy/paste, "Vừa nội dung", dự án json, xuất PNG/SVG), tự cập nhật, offline/PWA, trang web, bản cài .exe/.dmg, định dạng `svgn`.
- ⏳ Chưa kiểm chứng: add-in trong Word thật với `svgn` (hiển thị + sửa lại); offline trong khung Word; cài thử trên máy sạch; app Mac offline.
- ❌ Chưa có: chọn nhiều mẫu/nhóm, bộ mẫu theo bài, tìm mẫu thông minh, xuất PDF/TikZ, mẫu do người dùng tự tạo, Trộn đề offline (Pyodide tải ngoài), app Mac phát hành, ký mã, nạp thêm gói Typst Universe ngoài CeTZ (kho Typst còn nhiều gói mạch điện/hóa học chưa dùng).
- Gợi ý nâng cấp "siêu web": xem `HUONG-DAN-TAO-WEB-VE-HINH.md` mục 5.

## 7. Cách giao việc cho model để tiết kiệm token
- Nói: "đọc `tools/sang-mathtype/AGENTS.md`, chỉ mở các tệp trong mục 2 liên quan, làm việc X". **Không** yêu cầu đọc lại toàn bộ repo.
- Mỗi phiên một việc; kiểm tra bằng ảnh (`check-stamps` → `sheet-*.png`) thay vì đọc mã dài.
- Sau thay đổi lớn: cập nhật **mục 2, 3, 6** của file này (ngắn) để phiên sau không phải khám phá lại.
- Tránh `Read` cả `sm-draw.typ` (~3.5k dòng) hoặc `stamps*.mjs`: `grep -n "^#let <tên>"` rồi đọc đúng đoạn.
