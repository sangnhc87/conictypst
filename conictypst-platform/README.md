# ConicTypst Platform control plane

Backend Firebase **riêng** cho Hub, HDSD và Sang Math OMR. Dự án `conicgv` chỉ
làm nhà cung cấp danh tính Google; dữ liệu, quyền sử dụng và lịch sử quản trị
ConicTypst nằm trong project `conictypst-platform`.

## Phạm vi

- Một UID Google dùng xuyên Hub, HDSD và OMR. Client đăng nhập tại `conicgv`,
  đổi token qua `ctExchangeConicgvToken`, rồi dùng custom session trong project
  mới. UID được giữ nguyên và claim/quyền admin của hệ cũ không được sao chép.
- Hồ sơ người dùng và quyền dùng từng sản phẩm trong Firestore.
- Chính sách truy cập theo sản phẩm: Hub công khai; HDSD tự cấp cho mọi email
  Google đã xác minh sau đăng nhập; OMR/Studio mới đi qua hàng chờ phê duyệt.
- Trang quản trị tách riêng tại `https://admin-conictypst.pages.dev/`; cổng giáo
  viên ở `/account`.
- Trang admin chỉ thao tác qua callable Functions; trình duyệt không có quyền
  ghi trực tiếp dữ liệu quản trị.
- Owner khởi tạo duy nhất qua email Google đã xác minh
  `nguyensangnhc@gmail.com`. Production hiện không cấu hình thêm owner nào.
- `platformAdmins/{uid}` đang active là nguồn quyền quản trị chính thức; custom
  claim chỉ là cache cho giao diện và không thể vượt qua bản ghi bị tạm dừng.

## Callable API

- `ctExchangeConicgvToken`: nhận ID token Google còn hiệu lực của Firebase
  project `conicgv`, xác minh audience/issuer/revocation, giữ nguyên UID và mint
  custom token cho project ConicTypst. Không sao chép custom claim/quyền admin
  từ hệ nguồn và không ghi đè khi cùng UID đã có email khác.
- `ctGetAccount`: cập nhật hồ sơ tối thiểu, trả memberships và trạng thái admin.
- `ctRequestProductAccess`: HDSD trả quyền ngay không tạo hàng chờ; sản phẩm có
  `accessMode: approval` mới tạo/cập nhật yêu cầu `pending`; owner allowlist
  được tự duyệt để không bị khóa khỏi sản phẩm.
- `ctAdminBootstrap`: khởi tạo owner an toàn, seed metadata sản phẩm còn thiếu.
- `ctAdminListMembers`: phân trang 1-100, lọc trạng thái, tìm theo tiền tố email,
  tên hoặc UID đã chuẩn hóa.
- `ctAdminListAudit`: trả 50 thao tác quản trị gần nhất cho owner.
- `ctAdminApplyMembershipAction`: transaction có `mutationId`,
  `expectedRevision`, audit nguyên tử và chống gửi lặp.

Các action: `approve`, `suspend`, `resume`, `extend`, `set_expiry`,
`update_limits`, `schedule_delete`, `cancel_delete`. `update_limits` không thay
ngày hết hạn; `extend` tính từ thời điểm lớn hơn giữa hiện tại và hạn cũ;
pause/resume không tự gia hạn.

`schedule_delete` chặn quyền ngay và tạo `deletionJobs`. Lịch dọn dẹp duy nhất
`omrCleanupExpiredData` nhận lease, xóa object R2 trước, recursive-delete nhánh
sản phẩm rồi ghi audit; tài khoản Firebase Auth và hồ sơ dùng chung vẫn được giữ.

OMR có 8 callable (`omrRequestAccess`, `omrGetBootstrap`, đồng bộ workspace/kết
quả, xóa kết quả, tạo/commit upload và download). Metadata ở Firestore,
ảnh và PDF mặc định chỉ nằm trên thiết bị người chấm. Metadata hết hạn theo đúng
12 tháng lịch. Cloud ảnh là quyền trả phí, mặc định tắt và tệp tự xóa sau tối đa
6 tháng; lifecycle R2 chỉ là backstop nếu lịch dọn dẹp gặp sự cố.

## Hạn mức và chặn chi phí

- Gói miễn phí mỗi giáo viên: 10 lớp, 500 học sinh, 12.000 kết quả/năm học,
  đồng bộ điểm/đáp án/lớp/thống kê và không cấp dung lượng ảnh cloud.
- Ảnh bài chấm cùng PDF/ZIP được lưu và tải về máy. Admin chỉ bật R2 khi cấp gói
  trả phí bằng cách đặt dung lượng lớn hơn 0; ảnh cloud giữ tối đa 6 tháng.
- Cleanup nhận tối đa 2.500 kết quả mỗi giờ (công suất danh nghĩa 60.000/ngày)
  với concurrency giới hạn; các trường lớn `answers`, `questionDetails`,
  `warnings` được miễn index Firestore.
- Toàn ứng dụng OMR dừng cấp upload mới khi R2 đạt 5 GiB.
- Callable tối đa 3 instance; cleanup tối đa 1 instance và dùng chung một lịch.
- Container build cũ tự xóa sau 1 ngày; runtime là Node.js 22.
- Firebase Storage không được dùng để nhân đôi tệp: Firestore lưu metadata, R2
  lưu blob để tận dụng dung lượng/egress miễn phí.

## Chuẩn bị trước deploy

1. Alias `.firebaserc` phải trỏ `conictypst-platform`.
2. Google sign-in chỉ bật ở `conicgv`. Cả hai project phải có các domain Pages
   trong Authorized domains. Service account runtime của project mới chỉ cần
   `roles/firebaseauth.viewer` ở `conicgv` để kiểm tra token đã thu hồi; không
   cấp quyền Firestore/R2 của hệ cũ.
3. Chạy `npm install` trong `functions`, sau đó `npm test`.
4. Deploy rules/indexes/functions từ thư mục này.
5. `firestore.indexes.json` đã khai báo TTL cho field `expireAt` ở `adminAudit`,
   `adminMutations` và `deletionJobs`; kiểm tra TTL đã bật sau lần deploy đầu.
   TTL là cleanup nền và có tính phí delete theo bảng giá Firestore; dữ liệu vẫn
   bị giới hạn quyền ngay cả trước khi TTL chạy.
6. Sau khi client đã tích hợp App Check ổn định, cân nhắc bật
   `enforceAppCheck`; không bật trước để tránh khóa người dùng thật.

Không đặt secret R2 hay khóa dịch vụ trong mã nguồn hoặc biến môi trường công
khai. `OMR_STORAGE_HMAC_SECRET` nằm trong Secret Manager và chỉ được bind vào
các Functions thực sự cần thao tác blob.

Kiểm thử tích hợp cục bộ (Auth + Firestore + Functions emulator):

```sh
firebase emulators:exec --only auth,firestore,functions \
  "npm --prefix functions run test:emulator"
```
