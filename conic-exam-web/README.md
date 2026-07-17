# Conic Exam

Hệ thống thi trực tuyến thương mại cho đề Toán Sang-Math/Typst.

Xem mô hình vai trò, pipeline hình Typst/SVG và thứ tự phát triển sản phẩm tại
[VAN_HANH_VA_ROADMAP.md](./VAN_HANH_VA_ROADMAP.md).

Hồ sơ tổng kết để bàn giao cho AI/lập trình viên tiếp tục phát triển nằm tại
[TONG_KET_DU_AN_CHO_AI.md](./TONG_KET_DU_AN_CHO_AI.md).

## Vai trò và quy trình

- **Chủ hệ thống** đăng nhập bằng tài khoản owner, duyệt hoặc gia hạn giáo viên
  cho sản phẩm `exam` (100.000đ/12 tháng), tạm khóa và xem nhật ký quản trị.
- **Giáo viên** gửi yêu cầu quyền, tạo lớp, đưa mã lớp cho học sinh, duyệt từng
  học sinh, phát hành gói đề bất biến, tạo lịch thi và chấm phần tự luận.
- **Học sinh** đăng nhập Google, nhập mã lớp, chờ giáo viên duyệt, làm bài được
  tự lưu trên thiết bị và chỉ gửi toàn bộ đáp án khi nộp, sau đó xem điểm/lời
  giải theo chính sách của lịch thi.

Đáp án không được gửi trong gói đề của học sinh và không thể đọc trực tiếp từ
Firestore. Việc chấm điểm diễn ra trong Cloud Functions.

Sau khi đăng nhập, mở **Giáo viên → Bắt đầu** để xem checklist trực tiếp gồm:
tạo lớp → mở/sửa đề mẫu Typst → chạy Publisher → tải gói đề → giao lịch thi →
duyệt học sinh → xem/chấm kết quả. Checklist tự đánh dấu theo dữ liệu thật của
tenant giáo viên. Chủ hệ thống có checklist riêng ở đầu trang **Quản trị** và có
thể mở tenant thử nghiệm của owner mà không truy cập tenant của giáo viên khác.

Đề `typst/dethi/de-mau-tu-do.typ` được tích hợp làm ví dụ: giáo viên có thể xem,
tải nguồn ngay trong Trung tâm bắt đầu hoặc mở template `exam-online-demo` tại
[TypstConicHub Studio](https://typstconichub.pages.dev/#studio?template=exam-online-demo).

## Chạy cục bộ

Yêu cầu Node.js 22.

```bash
npm install
npm test
npm run dev
```

Tạo bản production:

```bash
npm run build
```

## Chuyển đề Typst

Bộ biên dịch nằm tại `../conic-exam-publisher`. Ví dụ với đề hiện tại:

```bash
cd ../conic-exam-publisher
node bin/conic-exam-publish.mjs \
  ../typst/dethi/de-01.typ \
  --root .. \
  --renderer typst/sang-exam.typ \
  --non-strict \
  --title "Đề mẫu 12-4-6" \
  --out ./.sample-build
```

Trong cổng giáo viên, chọn **Phát hành đề** và tải
`.sample-build/conic-exam-package.json`. Khi nguồn đã có ID ổn định và đáp án
TLN máy đọc được, bỏ `--non-strict` để bật kiểm định nghiêm ngặt.

Không tải artifact được tạo với `--review` lên trình duyệt. Review SVG là kho
lưu riêng cho giáo viên và có thể vượt giới hạn upload; bản mặc định là gói thi
an toàn dùng cho hệ thống.

## Hạ tầng production

- Giao diện: Cloudflare Pages, project `thi-conictypst`.
- Identity: Firebase project `conicgv`.
- Dữ liệu/quyền/chấm bài: Firebase project `conictypst-platform`, region
  `asia-southeast1`.
- Firestore chỉ cho client đọc hồ sơ quyền của chính mình; toàn bộ dữ liệu thi
  đi qua callable functions.

Deploy frontend:

```bash
npm run build
npx wrangler pages deploy dist \
  --project-name thi-conictypst \
  --branch main \
  --commit-dirty=true
```

Các domain Pages phải nằm trong Firebase Authentication Authorized domains của
cả `conicgv` và `conictypst-platform`.

## Kiểm định trước khi phát hành

```bash
cd ../conictypst-platform
firebase emulators:exec \
  --project conictypst-platform \
  --only auth,firestore,functions \
  "npm --prefix functions run test:emulator"
```

Luồng tích hợp phải báo `2 pass`, `0 fail`, `0 skipped`.
