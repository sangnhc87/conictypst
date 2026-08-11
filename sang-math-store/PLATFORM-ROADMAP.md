# Sang Math Store — hồ sơ bàn giao và kế hoạch phát triển

> Cập nhật: 2026-07-20  
> Production: <https://sang-math-store.pages.dev/>  
> Snapshot Production hiện tại: `b993e2a0.sang-math-store.pages.dev`  
> Cloudflare Pages project: `sang-math-store`  
> Mục đích: model/agent mới phải đọc file này, `README.md`, `../plan.md` và
> `../DEPLOYMENT-SAFETY.md` trước khi sửa hoặc deploy Store.

## 1. Tầm nhìn

Sang Math Store là cửa hàng sản phẩm số cho giáo viên Việt Nam, dùng chung một
luồng catalog → đơn hàng → QR chuyển khoản → SePay → giao file/cấp quyền. Nền
tảng phải mở rộng được cho:

1. `template`: mẫu Typst, Beamer, PDF và tài liệu tải về;
2. `utility`: tiện ích web nhỏ, thực dụng;
3. `game`: game giáo dục giáo viên tự nhập nội dung;
4. `account`: quyền truy cập hoặc tài khoản có thời hạn;
5. `latex`: mẫu, package và công cụ LaTeX.

Nguyên tắc kinh doanh từ 2026-07-20:

- Không quảng cáo game là “vĩnh viễn”.
- Mỗi game có ba gói chuẩn: **1 năm 30.000đ, 2 năm 50.000đ, 5 năm 100.000đ**.
- Mỗi Gmail được kích hoạt **một lượt dùng thử full tính năng trong 24 giờ cho
  từng game**. Dùng 24 giờ thay vì khóa ngay sau một lần mở để người dùng không
  mất lượt do tải lại trang hoặc sự cố mạng.
- Các quyền “vĩnh viễn” đã cấp trước khi đổi chính sách vẫn được bảo toàn như
  quyền legacy, không tự ý rút lại.
- Sản phẩm tải file có thể tiếp tục là không thời hạn; chính sách gói năm áp
  dụng cho app/game chạy trên web.

## 2. Ranh giới và kiến trúc

- Source: `sang-math-store/`
- Output: `sang-math-store/dist/`
- Pages Functions: `sang-math-store/functions/`
- D1: `sang-math-store-orders`
- R2: kho ZIP riêng tư đã gắn với Store
- Firebase project dùng xác minh Gmail: `conicgv`
- Sang Math Game Lab gồm 13 route độc lập nhưng dùng chung ngân hàng câu hỏi:
  `/games/trieu-phu/`, `/games/dua-doi/`, `/games/manh-ghep/`,
  `/games/san-kho-bau/`, `/games/vong-quay/`, `/games/do-min/`,
  `/games/doan-tau/`, `/games/ban-co/`, `/games/ghep-cap/`, `/games/hop-qua/`,
  `/games/bingo/`, `/games/ten-lua/` và `/games/vuot-song/`.
- Không import CSS/DOM hoặc deploy các website ConicTypst khác khi chỉ sửa Store.

```text
Store catalog
   ├─ sản phẩm tải về ── đơn đã trả ── token riêng ── R2 ZIP
   └─ Sang Math Game Lab
        ├─ 1 ngân hàng câu hỏi local ── nhiều kiểu chơi
        ├─ mỗi game có nhiều SKU thời hạn ── entitlement_key chung
        ├─ SePay webhook ── access_grants trong D1
        ├─ Gmail ── Firebase ID token ── /api/account
        ├─ 1 lượt thử/Gmail/game ── product_trials
        └─ nội dung game ── IndexedDB trên thiết bị + ZIP do người dùng giữ
```

Store chỉ lưu metadata cần thiết cho thanh toán và quyền truy cập. Nội dung câu
hỏi, hình ảnh, màu sắc và tên project game không được đưa lên D1/R2/cloud.

## 3. Những phần đã hoàn thành

### 3.1 Nền tảng bán hàng

- Catalog đa loại sản phẩm, giỏ hàng và combo.
- Giá được tính lại ở server, không tin tổng tiền từ trình duyệt.
- Đơn có mã chuyển khoản riêng và hết hạn sau 24 giờ.
- QR VPBank có sẵn số tiền và nội dung.
- SePay webhook dùng HMAC SHA-256, giới hạn timestamp và chống giao dịch trùng.
- Chỉ cấp file/quyền khi số tiền khớp chính xác.
- ZIP bán được lưu riêng tư trên R2, giao bằng token của đơn.
- Admin có thể quản lý tên, giá, loại, trạng thái, hình, URL giao và ZIP.
- Deploy script tự giữ tối đa hai bản Production/main.

### 3.2 Sang Math Game Lab — 13 chế độ

- Mười ba kiểu chơi có thương hiệu và giao diện riêng, không sao chép nhận diện của
  website tham khảo hoặc chương trình truyền hình:
  - **Triệu Phú Tri Thức**: 15 nấc, đồng hồ và trợ giúp 50:50;
  - **Đua Đội Tri Thức**: hai đội luân phiên, đường đua và bảng điểm;
  - **Mảnh Ghép Bí Ẩn**: trả lời đúng để mở dần 12 mảnh hình;
  - **Săn Kho Báu**: tiến qua các mốc hành trình theo câu trả lời;
  - **Vòng Quay Thử Thách**: vòng quay chuyển động kết hợp câu hỏi và điểm;
  - **Dò Mìn Toán Học**: ba mạng, mở ô an toàn bằng câu trả lời đúng;
  - **Đoàn Tàu Logic**: mỗi đáp án đúng nối thêm một toa tri thức;
  - **Bàn Cờ Thử Thách**: hai người chơi luân phiên gieo xúc xắc và tiến quân;
  - **Ghép Cặp Thần Tốc**: nối câu hỏi với đáp án đã xáo trộn;
  - **Hộp Quà Bí Mật**: mở quà và nhận sao sau mỗi câu đúng;
  - **Bingo Toán Học**: đánh dấu bảng Bingo theo tiến độ cả lớp;
  - **Tên Lửa Tri Thức**: tích năng lượng để đưa tên lửa chạm quỹ đạo;
  - **Vượt Sông Thử Thách**: đặt từng nhịp cầu bằng câu trả lời đúng.
- Một project/ngân hàng câu hỏi được dùng lại trong cả mười ba chế độ; người dùng
  không phải nhập lại nội dung khi đổi kiểu chơi.
- Kho nhiều project trên máy; đổi tên, nhân bản, xóa và đổi màu.
- Soạn câu hỏi, bốn đáp án, đáp án đúng và lời giải.
- KaTeX hỗ trợ `$...$` và `$$...$$`.
- Chèn PNG/JPG/WebP tối đa 2 MB; ảnh nằm trong dữ liệu local và ZIP.
- Cổng nhập hàng loạt nhận Word `.docx`, Excel `.xlsx`, CSV và JSON; giáo
  viên chọn nối thêm hoặc thay toàn bộ kho câu hỏi.
- Studio cung cấp file mẫu Word, Excel và CSV. Excel có danh sách chọn đáp án;
  Word nhận cả bảng lẫn các khối Câu hỏi/A/B/C/D/Đáp án/Lời giải.
- Trình chiếu toàn màn hình và điều khiển lớp học bằng phím 1–4/Enter/Escape.
- IndexedDB local-first và tự lưu nhẹ bằng debounce.
- Xuất/nhập `.sanggame.zip` để sao lưu và chuyển máy.
- Bundle Studio được lazy-load để trang Store chính nhẹ hơn.

### 3.3 Quyền thời hạn và dùng thử

- Mỗi game có ba SKU cùng một `entitlement_key`: SKU cơ sở 365 ngày/30.000đ,
  hậu tố `-2y` 730 ngày/50.000đ và hậu tố `-5y` 1.825 ngày/100.000đ.
- Mười ba access key hiện có: `trieu-phu-tri-thuc`, `dua-doi-tri-thuc`,
  `manh-ghep-bi-an`, `san-kho-bau`, `vong-quay-thu-thach`,
  `do-min-toan-hoc`, `doan-tau-logic`, `ban-co-thu-thach`,
  `ghep-cap-than-toc`, `hop-qua-bi-mat`, `bingo-toan-hoc`,
  `ten-lua-tri-thuc` và `vuot-song-thu-thach`.
- Store gộp ba SKU thành một card có ba lựa chọn, không bày ba card trùng nhau.
- `access_grants` có một hàng cho mỗi Gmail + `access_key`; mua thêm sẽ gia hạn
  từ ngày hết hạn hiện tại, hoặc từ ngày mua nếu quyền đã hết.
- `product_trials` có unique Gmail + `access_key`; không thể nhận lượt thứ hai
  bằng cùng Gmail.
- `/api/account` chỉ trả quyền còn hạn và trả cả trạng thái lượt thử.
- `/api/trials/:accessKey` xác minh Firebase ID token trước khi cấp 24 giờ.
- Quyền legacy có `expires_at = NULL` và tiếp tục được chấp nhận.

### 3.4 Mốc production Game Lab 2026-07-20

- Migration `0006_game_lab_wave_one.sql` đã áp dụng lên D1 production.
- Catalog production có 15 SKU, gộp thành đúng 5 nhóm game; mỗi nhóm đủ ba gói
  30.000đ/365 ngày, 50.000đ/730 ngày và 100.000đ/1.825 ngày.
- Cả năm route game, Store và ảnh `/previews/game-lab.png` đều trả HTTP 200.
- Webhook mô phỏng ký đúng HMAC đã chuyển đơn Đua Đội 30.000đ sang `paid` và
  cấp đúng 365 ngày; sau kiểm thử đã xóa toàn bộ order, transaction và grant QA.
- Snapshot production: `4446901a.sang-math-store.pages.dev`; bản dự phòng:
  `bd46a64e.sang-math-store.pages.dev`.

### 3.5 Đợt game thứ hai 2026-07-20

- Đã nghiên cứu các luồng tạo nội dung Đoàn Tàu, Game Theo Lượt, Dò Mìn, Ô Chữ
  và Kéo Thả/Nối Ý trên website tham khảo bằng phiên người dùng cung cấp.
- Chỉ học mô hình tương tác; không sao chép tên thương hiệu, CSS, tài nguyên hay
  dữ liệu. Sang Math cải tiến bằng một kho câu hỏi local dùng chung, mặc định
  riêng tư, không buộc đăng công khai từng bài.
- Migration `0007_game_lab_wave_two.sql` thêm 12 SKU cho bốn game mới; tổng cộng
  27 SKU thuộc 9 nhóm game, mỗi nhóm đủ ba gói thời hạn chuẩn.
- Bốn chế độ mới tiếp tục dùng KaTeX, hình ảnh, IndexedDB và ZIP sẵn có; giáo
  viên đổi game mà không nhập lại nội dung.
- Snapshot production: `52db0acf.sang-math-store.pages.dev`; bản dự phòng:
  `4446901a.sang-math-store.pages.dev`.
- Production smoke: cả 9 route và hai ảnh preview trả HTTP 200; catalog có đúng
  27 SKU/9 nhóm. Webhook mô phỏng ký HMAC đã cấp Dò Mìn 365 ngày, sau đó toàn
  bộ order, transaction và grant QA đã được xóa và xác nhận còn 0 bản ghi.

### 3.6 Đợt game thứ ba và nhập liệu đa định dạng 2026-07-20

- Migration `0008_game_lab_wave_three.sql` thêm 12 SKU cho Hộp Quà, Bingo, Tên
  Lửa và Vượt Sông; tổng kiến trúc hiện tại là 39 SKU thuộc 13 nhóm game.
- `gameImport.ts` chuẩn hóa tiêu đề tiếng Việt/Anh, đáp án A–D hoặc 1–4, bỏ qua
  dòng lỗi và giới hạn file/câu hỏi để trình duyệt luôn nhẹ.
- Word/Excel/CSV/JSON được đọc hoàn toàn trên thiết bị; không đưa file nhập hoặc
  nội dung câu hỏi lên D1, R2 hay cloud.
- Ba file mẫu production nằm trong `/samples/`; bản Word đã render kiểm tra đủ
  ba trang và bản Excel đã render kiểm tra cả hai sheet.
- Snapshot production: `b993e2a0.sang-math-store.pages.dev`; bản dự phòng:
  `52db0acf.sang-math-store.pages.dev`.
- Production smoke: Store, 13 route game, ba file mẫu và ảnh preview đều trả
  HTTP 200; catalog có đúng 39 SKU/13 nhóm, mỗi nhóm đủ ba mức giá/thời hạn.
- Webhook mô phỏng ký HMAC đã cấp Hộp Quà đúng 365 ngày; sau kiểm tra, order,
  transaction và grant QA đã được xóa và xác nhận cùng còn 0 bản ghi.

## 4. Dữ liệu và chính sách riêng tư

### D1 được phép lưu

- catalog, settings;
- orders, transactions;
- email mua hàng đã chuẩn hóa;
- access key, ngày bắt đầu/hết hạn, order nguồn;
- thời điểm bắt đầu/hết hạn lượt thử.

### Không lưu trên server

- câu hỏi và đáp án;
- hình người dùng chèn;
- tên game/project;
- màu tùy chỉnh;
- file ZIP sao lưu của game.

Người dùng phải được nhắc xuất ZIP định kỳ và tự cất vào Drive/USB. Hết gói
không xóa IndexedDB; chỉ khóa quyền mở Studio cho đến khi gia hạn.

## 5. Trạng thái vận hành còn cần chủ dự án xử lý

### Firebase — đang chặn đăng nhập production

`sang-math-store.pages.dev` chưa có trong Firebase Authentication → Settings →
Authorized domains. Tài khoản Google đang mở trong Codex xem được danh sách
nhưng Firebase báo không có quyền quản lý. Chủ project `conicgv` phải thêm đúng
domain này. Không thêm wildcard hoặc domain preview.

### SePay — chưa được phép tuyên bố bán thật

Wizard tạo webhook đã đi tới nút “Thêm” cuối cùng nhưng chưa có xác nhận rõ của
chủ dự án để tạo external side effect. Chỉ bấm sau khi người dùng xác nhận tại
thời điểm thao tác. Trước đó chỉ được mô phỏng webhook bằng secret local.

Không đưa `ADMIN-PASSWORD.local.txt` hoặc `SEPAY-WEBHOOK-SECRET.local.txt` vào
chat/log/commit/deployment.

## 6. Backlog đề nghị

### P0 — đưa Game Lab vào bán thật

1. Chủ Firebase thêm authorized domain production.
2. Kiểm tra đăng nhập Google thật trên production.
3. Chủ dự án xác nhận và tạo webhook SePay thật.
4. Chuyển khoản số tiền nhỏ theo một đơn test thật; xác nhận đơn → quyền → game.
5. Thêm trang “Sản phẩm của tôi” để xem gói, ngày hết hạn và nút gia hạn.

### P1 — hoàn thiện nền tảng nhiều game

1. Tách cấu hình game/plan khỏi component Store để Admin tạo plan theo nhóm.
2. Thiết kế schema chuyên biệt cho Ô Chữ (từ khóa/hàng/cột), Gắn Nhãn Hình và
   Sắp Xếp Thứ Tự; không ép các kiểu dữ liệu này vào schema trắc nghiệm hiện có.
3. Email giao dịch: xác nhận mua, sắp hết hạn 30/7/1 ngày.
4. Dashboard Admin: doanh thu, đơn chờ, giao dịch lệch tiền, trial → mua.
5. Nhật ký gia hạn riêng để không chỉ dựa vào order cuối.
6. Cho người dùng xóa tài khoản/quyền liên kết theo chính sách riêng tư.

### P2 — tăng trưởng nhưng vẫn nhẹ

1. Coupon/campaign tính hoàn toàn ở server.
2. Bundle game theo môn/cấp học.
3. Thư viện ảnh nền/icon an toàn bản quyền, tối ưu dung lượng.
4. PWA/offline shell; vẫn bắt xác minh quyền định kỳ hợp lý.
5. Chỉ cân nhắc cloud project sync như gói nâng cấp riêng có phí; mặc định vẫn
   IndexedDB + ZIP.

## 7. Quy tắc cho model/agent tiếp theo

1. Đọc file này và tám migration trước khi đổi schema.
2. Chạy `git status --short`; worktree gốc đang bẩn và cả thư mục Store hiện có
   thể chưa được Git theo dõi. Không reset/checkout thay đổi của người dùng.
3. Không đổi chính sách 1/2/5 năm hoặc trial 24 giờ nếu người dùng chưa yêu cầu.
4. Không dùng localStorage để quyết định đã dùng trial; nguồn thật là D1 theo
   Gmail đã xác minh.
5. Không cho phép trình duyệt tự gửi giá hoặc số ngày có hiệu lực.
6. Gia hạn phải cộng từ ngày hết hạn hiện tại nếu quyền còn hạn.
7. Không xóa quyền legacy `expires_at = NULL`.
8. Không lưu nội dung game lên cloud nếu chưa có yêu cầu và thiết kế giá riêng.
9. Chỉ deploy bằng `cd sang-math-store && npm run deploy`.
10. Sau deploy kiểm tra production và dry-run retention bằng project chính xác.

## 8. Kiểm thử tối thiểu

```bash
npm run lint
npm run build
npx wrangler d1 migrations apply sang-math-store-orders --local
```

Production smoke test cần chứng minh:

- catalog có đúng 13 nhóm game, mỗi nhóm ba gói 30k/50k/100k và cùng
  entitlement key trong nhóm;
- email không phải Gmail bị từ chối với game;
- webhook sai chữ ký bị 401;
- webhook đúng chữ ký + đúng tiền cấp quyền đúng số ngày;
- mua thêm cùng/different SKU gia hạn một `access_grants` chung;
- `/api/account` không trả quyền đã hết hạn;
- trial lần đầu 201, lần hai 409;
- cả 13 route game, ba ảnh preview Game Lab, ba file mẫu và Store đều HTTP 200;
- chỉ còn tối đa hai deployment Production/main.

## 9. Definition of Done

Một thay đổi Store chỉ hoàn thành khi build/lint qua, migration đã kiểm tra local,
API không tin dữ liệu giá từ client, không rò secret/nội dung người dùng, deploy
đúng `sang-math-store`, production có dấu hiệu phiên bản mới và deployment cũ
được dọn theo `DEPLOYMENT-SAFETY.md`.
