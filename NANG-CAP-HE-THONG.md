# NÂNG CẤP HỆ THỐNG CONICTYPST — Lộ trình cho người & AI model

> Tài liệu này ghi lại **hiện trạng, mục tiêu, và lộ trình nâng cấp an toàn** của toàn
> hệ ConicTypst. Mục đích: bất kỳ AI model nào (hoặc người) vào sau đều biết
> **cần làm gì, làm theo thứ tự nào, kiểm chứng ra sao, rollback thế nào** — mà
> KHÔNG làm hư những thứ đang chạy tốt.
>
> Nguyên tắc tối cao: **KHÔNG HƯ HẠI CÁI ĐANG DÙNG ĐƯỢC.** Mọi thay đổi phải
> có bước kiểm chứng và đường lùi. Ưu tiên thao tác cục bộ, đảo ngược được.

Ngày lập: 2026-07-23. Người lập: review tự động (Claude) theo yêu cầu chủ dự án.

---

## 0. Đọc cái này trước (bối cảnh bắt buộc)

- Dự án là hệ công cụ tạo đề Toán THPT Việt Nam bằng Typst, chủ dự án là giáo viên.
- Trước mọi deploy/xóa: đọc `DEPLOYMENT-SAFETY.md` + `AGENTS.md`. 7 website = 7
  Cloudflare Pages project riêng, không suy đoán theo tên gần giống.
- **Sự thật quan trọng nhất:** đề thi thật **KHÔNG dùng gói `@preview/sang-math`**.
  Có 276 file import bản `sang-exam.typ` **cục bộ**; chỉ 3 file dùng `@preview`.
  → Nâng cấp gói publish gần như không chạm tới đề thật. Muốn cải thiện đề thật
  phải sửa đúng bản cục bộ đang được import.
- Bảo mật lõi (Firestore rules, phân quyền admin, webhook thanh toán, storage-worker)
  đã **rất vững** — KHÔNG đập đi làm lại, chỉ vá mép.

---

## 1. Hiện trạng (chụp ngày 2026-07-23)

### 1.1. Bảy website

| Web | Source | Pages project | Bảo mật | Kiến trúc | Nợ chính |
|---|---|---|---|---|---|
| ConicTypst (app chính) | `src/`→`dist/` | `conictypsst` | TB | Khá | Đáp án lộ client; file 2500 dòng; không lazy-load |
| TypstConicHub | `typst-conic-hub/`→`dist-hub/` | `typstconichub` | Khá | Yếu | `HubStudio.jsx` 2736 dòng |
| HDSD + Trộn đề | `public/hdsd/` | `hdsd-conictypst` | Khá | Tĩnh | CSP thiếu `script-src`; `bank-cu.json` 741KB |
| Sang Math OMR | `sang-math-omr/` | `chamthi-conictypst` | Tốt | Yếu | `index.html` 13.043 dòng; `opencv.js` 13MB |
| ConicTypst Admin | `conictypst-platform-admin/` | `admin-conictypst` | Xuất sắc | Khá | `admin.js` 1097 dòng |
| Thi online | `conic-exam-web/` | `thi-conictypst` | Xuất sắc | Tốt | Chống gian lận chỉ client-side |
| Sang Math Store | `sang-math-store/` | `sang-math-store` | Tốt | Tốt | Admin 1 mật khẩu không rate-limit; CORS `*`; `.sql` rác |

### 1.2. Hệ Typst

- `typst-pkg-sang-math` v1.0.2 — gói chính, module hóa sạch, có contract test. GIỮ làm chuẩn.
- `typst-pkg-sang-math-graphics` v0.1.0 — **orphan, không ai import**; `lib.typ` self re-export thừa; repository còn `yourname`.
- `typst-pkg-submit` — lệch version (1.0.0), compiler (0.11.0), email so với gói chính.
- `sang-exam.typ` tồn tại **4 bản khác MD5**: pkg-chính 1638 dòng / pkg-submit 1462 / `typst/` 1416 / `src/typst-system/` 1340. Lệch tới 554 dòng.
- 3 hệ màu song song (`core/colors.typ` semantic + `palette`/`classic` trong sang-exam + 153 hex hardcode).
- 17 chỗ dùng `repr()` hack (dò `"oo"`, `"layout("`, `"|"`) — dễ vỡ khi Typst đổi định dạng.

### 1.3. Vệ sinh repo (đo thực tế)

- `.git` = **731MB**.
- `manim_xepghe/.venv/` bị commit: **11.345 file = 79% tổng file git track** (`.gitignore` đã có `.venv/` nhưng commit từ trước nên vẫn track).
- `typst.zip` 84MB đã commit. `opencv.js` 13MB. `bank-cu.json` 741KB.
- 81 file rời ở gốc (script scratch `patch_*`, `debug_*`, `.pyc`).
- **Không** file/script nào phụ thuộc `typst.zip` hay `.venv` → gỡ khỏi track an toàn về chức năng.

---

## 2. Lộ trình nâng cấp (thứ tự an toàn tăng dần)

> Quy tắc chung cho MỌI phase:
> 1. Trước khi bắt đầu: `git status --short` — nếu cây bẩn, **chỉ đụng đúng
>    phần của phase**, không commit gộp với việc dở của người dùng.
> 2. Mỗi thay đổi code phải build/test lại (mục 3) TRƯỚC khi coi là xong.
> 3. Không deploy trừ khi chủ dự án yêu cầu đúng website đó.
> 4. Mỗi phase độc lập — làm xong 1 phase, dừng, báo cáo, chờ duyệt phase sau.

### PHASE 1 — Nhẹ repo (rủi ro THẤP, tác động lớn) ⭐ nên làm trước

**Điều kiện tiên quyết:** cây git sạch (`git status --short` rỗng) HOẶC đã commit
xong việc đang dở. KHÔNG chạy khi đang có 200+ file uncommitted.

Bước:
```bash
# 1. Ngừng track virtualenv (GIỮ file trên đĩa — manim vẫn chạy):
git rm -r --cached manim_xepghe/.venv

# 2. Ngừng track archive nặng:
git rm --cached typst.zip

# 3. Bổ sung .gitignore (nếu chưa có dòng tương ứng):
#    manim_xepghe/.venv/  (đã có .venv/ nhưng thêm path tường minh cho chắc)
#    /typst.zip

# 4. Kiểm chứng KHÔNG mất file trên đĩa:
ls manim_xepghe/.venv >/dev/null && echo "venv còn trên đĩa OK"
ls typst.zip >/dev/null && echo "zip còn trên đĩa OK"

# 5. Kiểm chứng số file track giảm mạnh:
git ls-files | wc -l   # kỳ vọng ~2.900 thay vì ~14.334

# 6. Commit riêng, message rõ:
git add -A && git commit -m "chore: untrack .venv và typst.zip (giảm repo, giữ file local)"
```
**Lưu ý:** bước này KHÔNG giảm `.git` 731MB (lịch sử vẫn còn) — chỉ ngừng phình
thêm và làm việc/clone nhẹ hơn. Muốn xóa hẳn khỏi lịch sử → PHASE 4 (rủi ro cao).

**Rollback:** nếu lỡ, `git reset --soft HEAD~1` rồi `git restore --staged .`
(file trên đĩa chưa từng bị xóa nên không mất gì).

**Dọn file rác gốc (tùy chọn, cùng nhóm rủi ro thấp):** gom `patch_*.cjs`,
`check_*.cjs`, `debug_*.js`, `fix_*.cjs`, `script_0..3.js` vào `scripts/archive/`
hoặc xóa nếu chắc không dùng. Kiểm tra từng file bằng `git log --oneline -- <file>`
trước khi xóa.

### PHASE 2 — Mượt hơn: tách file monolith + lazy-load (rủi ro TRUNG BÌNH)

Mục tiêu: bundle nhẹ, tải nhanh, dễ bảo trì. Làm TỪNG file một, test UI sau mỗi lần.

Ưu tiên (nặng nhất trước):
1. `sang-math-omr/index.html` (13.043 dòng) — tách CSS ra `.css`, JS ra module.
   Đây là monolith nặng nhất hệ thống.
2. `typst-conic-hub/src/studio/HubStudio.jsx` (2736 dòng) — tách theo cụm:
   studio / AI-fix / account / command-palette thành component riêng.
3. `src/TemplateGen.jsx` (2508) + `src/App.jsx` (1166) — App.jsx thêm
   `React.lazy` + `Suspense` cho các view nặng (Monaco, Typst WASM, studio).
   Hiện KHÔNG dùng lazy ở đâu → mọi thứ vào bundle khởi tạo.

Kiểm chứng bắt buộc sau mỗi tách:
- `npm run build` (và `cd <web> && npm run build`) phải xanh.
- Mở app thật trên trình duyệt, chạy đúng luồng vàng (soạn đề / biên dịch /
  chấm / thanh toán tùy web). Type-check qua ≠ tính năng chạy đúng.

**Rollback:** mỗi tách là 1 commit riêng → `git revert <hash>` nếu vỡ.

### PHASE 3 — Thông minh hơn: gộp nguồn `sang-exam.typ` (rủi ro TRUNG BÌNH-CAO)

Đây là nợ kỹ thuật lớn nhất phần Typst: 4 bản drift + 276 import cục bộ.

Chiến lược (KHÔNG làm gấp, làm dần):
1. Chọn **1 nguồn chân lý** = `typst-pkg-sang-math/sang-exam.typ` (bản đầy đủ nhất, 1638 dòng).
2. Diff từng cặp để hiểu 554 dòng lệch là gì (bug fix hay tính năng riêng của web):
   ```bash
   diff typst-pkg-sang-math/sang-exam.typ src/typst-system/sang-exam.typ
   ```
3. Với mỗi khác biệt: quyết định giữ bản nào, port về nguồn chân lý.
4. Các nơi khác (`typst/`, `src/typst-system/`, `typst-pkg-submit/`) chuyển sang
   **generate/symlink** từ nguồn chân lý thay vì bản chép tay. Hoặc đổi 276 file
   đề sang import 1 đường dẫn chung.
5. Sau mỗi bước: compile lại các đề mẫu + `tests/test-public-api.typ` (mục 3).

**Cảnh báo:** đây là chỗ dễ làm hư đề thật nhất. Làm trên nhánh riêng, compile
đối chiếu PDF trước/sau, không merge tới khi PDF khớp.

### PHASE 4 — Xóa file nặng khỏi LỊCH SỬ git (rủi ro CAO, cần duyệt riêng)

Chỉ làm khi thực sự cần `.git` nhẹ (731MB→~vài chục MB) và đã hiểu hệ quả.

- Dùng `git filter-repo` (không dùng filter-branch) xóa `.venv/`, `typst.zip`,
  `opencv.js` khỏi toàn bộ lịch sử.
- **Phá vỡ mọi hash commit** → ai clone rồi phải clone lại. Nếu có nhiều máy/
  cộng tác viên: phối hợp trước.
- **Bắt buộc:** backup toàn repo (`cp -r` hoặc clone --mirror) TRƯỚC khi chạy.
- Force-push chỉ khi chủ dự án đồng ý rõ ràng.

### PHASE 5 — Vá bảo mật mép

> CẢNH BÁO: đã kiểm lại, các mục dưới KHÔNG đồng nhất mức rủi ro. Đọc nhãn từng cái.

- **[rủi ro THẤP, làm được]** Store: thêm rate-limit đăng nhập admin
  (`_shared.js` quanh `x-admin-key`) — thuần thêm, không đổi luồng cũ.
- **[rủi ro THẤP, làm được]** Store: siết CORS orders khỏi `*`
  (`orders/_middleware.js`) — LƯU Ý file này thường đang được sửa dở, kiểm
  `git status` trước.
- **[rủi ro THẤP]** OMR + HDSD: chuyển Gemini key khỏi query string → header.
- **[rủi ro CAO — KHÔNG phải one-liner]** Thêm `script-src`/`default-src` cho
  HDSD (`public/hdsd/_headers`): 20+ HTML có inline script + CDN (KaTeX,
  pandoc-wasm, jsDelivr). CSP chặt mà thiếu nguồn/hash sẽ CHẾT inline script.
  Phải liệt kê đủ nguồn + test từng trang. Đừng làm vội.
- **[KHÔNG cần sửa]** `LuckyLightStudioPage.jsx:547` `dangerouslySetInnerHTML`:
  `subQ.solution` là dữ liệu TĨNH do giáo viên soạn, không phải input người lạ.
  Escape sẽ làm hỏng render `<strong>`. Chỉ xử lý NẾU sau này nội dung này nhận
  từ nguồn không tin cậy.
- **[cân nhắc dài hạn]** App editor chính trích đáp án client-side — nếu dùng cho
  thi nghiêm túc, chuyển chấm sang server như `conic-exam-web` đã làm.

---

## 3. Lệnh kiểm chứng từng phần (dùng sau mỗi thay đổi)

| Phần | Build/Test | Kiểm chứng chạy thật |
|---|---|---|
| App chính | `npm run build` | mở `dist/` / `npm run dev` → soạn+biên dịch 1 đề |
| Hub | `npm run dev:hub` rồi `vite build --config vite.hub.config.js` | mở studio, biên dịch 1 file Typst |
| Thi online | `cd conic-exam-web && npm run build` | tạo 1 đề thử, làm bài, nộp |
| Store | `cd sang-math-store && npm run build` | thử luồng đặt + webhook sandbox |
| OMR | mở `sang-math-omr/index.html` | quét thử 1 phiếu mẫu |
| Gói Typst | `cd typst-pkg-sang-math && typst compile --root . tests/test-public-api.typ /tmp/x.pdf` | compile các đề mẫu `examples/` |
| Đề thật | `npm run compile:exam -- <ten-de>` | so PDF trước/sau khi sửa sang-exam |

Nguyên tắc: **type-check/compile qua ≠ tính năng đúng.** Luôn mở thật để xác nhận.

---

## 4. Nhật ký tiến độ (AI/người làm sau CẬP NHẬT vào đây)

> Ghi lại: ngày, phase, việc đã làm, kết quả kiểm chứng, còn tồn đọng gì.
> Để người kế tiếp không phải dò lại từ đầu.

- **2026-07-23** — Lập tài liệu. Đã rà soát toàn hệ (7 web + Typst + vệ sinh repo).
- **2026-07-23** — ✅ **PHASE 1 XONG** (commit `83426620`). Gỡ `manim_xepghe/.venv`
  (11.345 file) + `typst.zip` (80M) khỏi git track. Kết quả: file track
  14.334 → **2.988** (giảm 79%). File vẫn nguyên trên đĩa. Đã thêm `/typst.zip`
  vào `.gitignore` (working tree). Làm khi cây git đang bẩn (172 unstaged của chủ
  dự án) nhưng dùng kỹ thuật gỡ-staged/commit-cô-lập/re-stage nên KHÔNG cuốn việc
  dở vào commit — đã kiểm chứng commit chỉ chứa .venv + typst.zip.
  - LƯU Ý cho người sau: `.git` VẪN 731MB (lịch sử còn nguyên). Muốn nhẹ đĩa thật
    phải làm PHASE 4 (filter-repo, rủi ro cao, cần duyệt).
  - Dòng `/typst.zip` trong `.gitignore` hiện ở working tree, CHƯA commit (vì
    `.gitignore` có thay đổi dở khác của chủ dự án — không gộp vào commit dọn).
- **2026-07-23** — ✅ **PHASE 5 (rate-limit admin Store) XONG.** Thêm chống dò
  mật khẩu (brute-force) cho đăng nhập quản trị Store:
  - Mới: `sang-math-store/migrations/0012_admin_rate_limit.sql` (bảng
    `admin_auth_attempts` theo IP).
  - Sửa: `functions/_shared.js` thêm hàm `adminAuthorizedLimited()` (giữ nguyên
    `adminAuthorized` cũ). Khóa IP 15 phút sau 10 lần sai trong cửa sổ 15 phút.
  - Gắn vào 3 endpoint: `api/admin/catalog.js` (GET+PUT), `api/admin/upload/[id].js`.
  - Đã test 5 kịch bản bằng mock D1: brute-force khóa đúng lần 10; key đúng xóa
    đếm; **thiếu migration → fallback, admin thật KHÔNG bị chặn** (an toàn nhất).
  - ⚠️ **CẦN LÀM KHI DEPLOY:** apply migration mới thì rate-limit mới bật:
    `cd sang-math-store && npx wrangler d1 migrations apply sang-math-store-orders --remote`
    (chưa apply cũng KHÔNG sao — code tự fallback về hành vi cũ, không vỡ).
- **2026-07-23** — ✅ **NÂNG CẤP BBT + bbt-live XONG.**
  - Thêm macro mới `bxd-tich` (bảng xét dấu TÍCH/THƯƠNG tự tính dòng kết quả) vào
    `bbt.typ`, đồng bộ 4 bản: `typst-pkg-sang-math/`, `src/typst-system/`,
    `public/hdsd/typst/`, `typst/`. Cả 4 compile OK (Typst 0.15). Thuần thêm,
    không đụng 8 macro cũ.
  - **bbt-live.html: sửa gốc rễ "như rác".** Trước đây preview là bảng HTML giả
    lập (mũi tên ↗↘ trong ô), khác hẳn output Typst. Giờ render **Typst WASM thật**
    (tái dùng engine `playground.js` + import map jsDelivr như `index.html`), preview
    = output PDF chính xác. Cập nhật regex trong `playground.js` để nhận `bxd-tich`,
    `bang-gia-tri`, `bang-phan-phoi`, `auto-bbt`.
  - Đã TEST trình duyệt thật (playwright headless): status "✓ Render Typst thật",
    SVG 358px/6 phần tử render vào `#typstReal`, không lỗi console. PASS.
  - LƯU Ý người sau: bbt-live giữ thêm "preview HTML nhanh" (trong `<details>`) làm
    phản hồi tức thì lúc WASM đang tải lần đầu. WASM tải từ CDN ~vài MB, lần đầu chậm.
- **2026-07-23** — ✅ **THỐNG KÊ NGƯỜI DÙNG HUB (số THẬT) XONG.**
  - Backend `conictypst-platform/functions/studio-sync.js`: thêm `studioRefreshStats`
    (scheduled mỗi 6h, đếm bằng `count()` aggregation → rẻ) ghi `stats/studio`;
    `studioGetStats` (callable, đọc cache, chỉ tính lại nếu >1h). Chỉ số tổng
    (giáo viên / tài liệu / bản Pro), KHÔNG PII.
  - `firestore.rules`: cho đọc công khai ĐÚNG `stats/studio` (`allow get: if true`),
    ghi chỉ Cloud Function. Các rule khác giữ deny-by-default.
  - Frontend `firebaseSync.js` (`fetchStudioStats`, lỗi→null) + `HubStudio.jsx`
    (UpgradeDialog hiện "X giáo viên · Y tài liệu" — CHỈ khi teachers≥5 để số nhỏ
    lúc đầu không phản tác dụng). Build hub PASS (`✓ built in 13s`).
  - ⚠️ **CẦN LÀM KHI DEPLOY:** deploy Cloud Functions (`studioRefreshStats`,
    `studioGetStats`) + deploy `firestore.rules` mới. Chưa deploy thì UI tự ẩn
    thống kê (fetchStudioStats trả null) — KHÔNG vỡ gì.
- Bước kế đề xuất: PHASE 2 tách monolith, hoặc siết CORS orders (rủi ro thấp).
- _(mục tiếp theo…)_

---

## 5. Ranh giới tuyệt đối (đừng bao giờ vượt)

- KHÔNG xóa Cloudflare project, R2, Firebase, Firestore, secret, dữ liệu người dùng.
- KHÔNG force-push khi chưa được duyệt.
- KHÔNG đổi chữ ký API public của `sang-math` nhánh 1.0.x (theo CHANGELOG cam kết).
- KHÔNG commit gộp thay đổi của mình với việc đang dở của chủ dự án.
- KHÔNG deploy website ngoài cái được yêu cầu.
- 2 email admin `nguyensangnhc@gmail.com`, `sangbeau@gmail.com` miễn phí full tính năng.
