# Sang Math Store

Cửa hàng sản phẩm số cho giáo viên tại
<https://sang-math-store.pages.dev/>.

## Năng lực hiện có

- catalog đa loại sản phẩm;
- giỏ hàng và combo tính giá ở server;
- QR chuyển khoản riêng cho từng đơn;
- SePay webhook có chữ ký HMAC và chống giao dịch trùng;
- gói Conic Studio Pro 1/2/5 năm được cấp tự động sang TypstConicHub qua cầu
  HMAC; nếu khách chưa đăng nhập, quyền chờ đúng Gmail và tự nhận sau đăng nhập;
- giao file ZIP riêng tư từ R2 sau khi thanh toán;
- mở tiện ích web qua liên kết đơn đã được xác thực;
- Admin quản lý sản phẩm, giá, trạng thái, cách giao và file ZIP;
- Sang Math Game Lab có 13 kiểu chơi dùng chung một ngân hàng câu hỏi: Triệu
  Phú, Đua Đội, Mảnh Ghép, Săn Kho Báu, Vòng Quay, Dò Mìn, Đoàn Tàu, Bàn Cờ,
  Ghép Cặp, Hộp Quà, Bingo, Tên Lửa và Vượt Sông;
- nhập hàng loạt câu hỏi từ Word, Excel, CSV hoặc JSON; có file mẫu tải ngay
  trong Studio, ngoài ZIP sao lưu/chuyển máy;
- mỗi game có gói 1/2/5 năm và một lượt trial full 24 giờ cho mỗi Gmail/game;
- Studio hỗ trợ KaTeX, chèn hình, đổi màu, điều khiển lớp học và ZIP chuyển máy;
- D1 chỉ lưu sản phẩm, đơn hàng, giao dịch và metadata quyền; nội dung game nằm
  trong IndexedDB của người dùng và file ZIP họ tự giữ.

Kiến trúc, trạng thái đã làm, blocker production và backlog dành cho model tiếp
theo nằm trong [PLATFORM-ROADMAP.md](./PLATFORM-ROADMAP.md).

## Phát triển local

Yêu cầu Node.js `>=22.13.0`.

```bash
npm install
npm run dev
npm run build
npm run lint
```

## Deploy

Chỉ dùng lệnh chuẩn sau từ thư mục website:

```bash
npm run deploy
```

Hai biến production bắt buộc cho cầu cấp quyền Studio: Pages secret
`STUDIO_STORE_WEBHOOK_SECRET` và biến `STUDIO_GRANT_URL` trỏ tới Function
`studioStoreGrant` của project `conictypst-platform`. Firebase Function phải
bind Secret Manager secret cùng tên và cùng giá trị.

Lệnh này build, deploy đúng Cloudflare Pages project `sang-math-store` và dọn
lịch sử để chỉ giữ hai bản Production/main gần nhất.
