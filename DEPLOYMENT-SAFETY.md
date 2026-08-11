# ĐỌC TRƯỚC KHI DEPLOY WEBSITE CONICTYPST

Tài liệu này dành cho chủ dự án và mọi AI/model hỗ trợ triển khai. Mục tiêu là
deploy đúng website, không đụng nhầm project, không đưa file riêng tư lên mạng
và không để lịch sử deployment tăng không kiểm soát.

## Chính sách bắt buộc

1. Mỗi website chỉ giữ tối đa **2 deployment Production/main**:
   - bản production đang phục vụ người dùng;
   - bản production ngay trước đó để rollback khẩn cấp.
2. Xóa toàn bộ preview và các deployment cũ hơn hai bản trên.
3. Không dùng `wrangler pages deploy` trực tiếp khi đã có lệnh `npm run deploy:*`.
   Các lệnh chuẩn bên dưới đã kèm bước dọn lịch sử sau khi deploy thành công.
4. Không bao giờ xóa Cloudflare Pages project, R2 bucket, Firebase project,
   Firestore, dữ liệu người dùng hoặc secret trong quy trình dọn deployment.
5. Không chạy lệnh deploy ở thư mục gốc nếu chưa xác nhận đúng source, output và
   `--project-name`.
6. Nếu build, test, upload hoặc kiểm tra production thất bại: dừng lại, báo lỗi,
   không tiếp tục xóa bản dự phòng.

## Tám website và lệnh đúng

| Website | Source/output | Cloudflare Pages project | Production | Lệnh deploy chuẩn |
|---|---|---|---|---|
| ConicTypst | `src/` → `dist/` | `conictypsst` | <https://conictypsst.pages.dev/> | `npm run deploy` |
| TypstConicHub | `typst-conic-hub/` → `dist-hub/` | `typstconichub` | <https://typstconichub.pages.dev/> | `npm run deploy:hub` |
| HDSD + Trộn đề | `public/hdsd/` | `hdsd-conictypst` | <https://hdsd-conictypst.pages.dev/> | `npm run deploy:hdsd` |
| Sang Math OMR | `sang-math-omr/` → stage riêng | `chamthi-conictypst` | <https://chamthi-conictypst.pages.dev/> | `npm run deploy:omr` |
| ConicTypst Admin | `conictypst-platform-admin/` → stage riêng, bắt buộc có `FIREBASE_CONFIG_JSON` | `admin-conictypst` | <https://admin-conictypst.pages.dev/> | `npm run deploy:admin` |
| Thi online | `conic-exam-web/` → `conic-exam-web/dist/` | `thi-conictypst` | <https://thi-conictypst.pages.dev/> | `cd conic-exam-web && npm run deploy` |
| Sang Math Template Store | `sang-math-store/` → `sang-math-store/dist/` | `sang-math-store` | <https://sang-math-store.pages.dev/> | `cd sang-math-store && npm run deploy` |
| Geo2Code cộng đồng | `geo-conictypst-web/` → `dist-geo-conictypst/` | `geo-conictypst` | <https://geo-conictypst.pages.dev/> | `npm run deploy:geo` |
| Sang Math Graphics Studio | `sang-math-graphics-studio/` → `dist-graphics-studio/` | `sang-math-graphics-studio` | <https://sang-math-graphics-studio.pages.dev/> | `npm run deploy:graphics-studio` |
| Thư viện Beamer | `web-app/` → `web-app/dist/` | `beamer` | <https://beamer-gjv.pages.dev/> | `npm run deploy:beamer` |
| Trình chiếu PDF/Word | `sang-docx-quiz-presenter/` → `sang-docx-quiz-presenter/dist/` | `trinhchieu` | <https://trinhchieu.pages.dev/> | `npm run deploy:trinhchieu` |

Không thay project trong bảng bằng project có tên gần giống như `conictypst`,
`hdsd`, `tron-de`, `beamer` hoặc `trinhchieu`.

## Quy trình model phải làm

### Trước khi deploy

1. Đọc `plan.md` và tài liệu này.
2. Xác định chính xác một website được yêu cầu; không deploy các website còn lại.
3. Chạy `git status --short` và không ghi đè thay đổi không liên quan của người dùng.
4. Chạy build/test phù hợp với website.
5. Với OMR và Admin, bắt buộc dùng stage builder/allowlist từ lệnh chuẩn; không
   upload nguyên thư mục source.
6. Kiểm tra project tồn tại bằng:

   ```bash
   npx wrangler pages project list
   ```

7. Ghi nhận deployment production hiện tại để làm bản dự phòng:

   ```bash
   npx wrangler pages deployment list --project-name TEN_PROJECT --json
   ```

### Khi deploy

1. Chỉ chạy đúng lệnh trong bảng.
2. Nhánh production phải là `main`.
3. Chỉ dọn deployment sau khi Cloudflare báo deploy thành công.
4. Script `scripts/prune-cloudflare-pages-deployments.mjs` chỉ cho phép chín
   project trong bảng và tự giữ hai bản Production/main mới nhất.

### Sau khi deploy

1. Mở URL production, yêu cầu HTTP 200 và kiểm tra dấu hiệu phiên bản/tính năng
   vừa thay đổi.
2. Chạy kiểm tra mô phỏng:

   ```bash
   npm run pages:prune -- TEN_PROJECT --dry-run
   ```

   Kết quả đúng là `removableVisible: 0` và danh sách `kept` có một hoặc hai ID.
3. Khi cần rà soát cả hệ thống:

   ```bash
   npm run pages:prune:all -- --dry-run
   ```

4. Báo cho người dùng: website nào đã deploy, URL production, số bản còn giữ và
   xác nhận các website khác không bị chạm tới.

## Dọn lịch sử và rollback

Dọn một project:

```bash
npm run pages:prune -- TEN_PROJECT
```

Dọn toàn bộ project trong danh sách an toàn:

```bash
npm run pages:prune:all
```

Không gọi `wrangler pages deployment delete --force` thủ công. Nếu bản mới lỗi,
rollback về deployment Production/main còn lại trong Cloudflare Dashboard, xác
minh website hoạt động, rồi mới xem xét deploy lại.

Nếu hiện chỉ có một deployment thì giữ nguyên. Không tạo bản sao giống hệt chỉ
để đủ hai bản; lần deploy tiếp theo sẽ tự tạo bản dự phòng có ý nghĩa.
