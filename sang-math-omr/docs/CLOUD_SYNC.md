# Sang Math OMR — đồng bộ nhiều thiết bị

## Quyết định kiến trúc

- Firebase Authentication (Google): danh tính giáo viên.
- Cloud Firestore: tenant, quyền sử dụng, lớp/học sinh, đáp án, điểm, tombstone và con trỏ đồng bộ.
- Cloud Functions: biên bảo mật cho duyệt quyền, quota, ghi kết quả và cấp vé HMAC sống 5 phút.
- Cloudflare R2 Standard, bucket **private riêng**: ảnh bài đã chấm và PDF lớn.
- Cloudflare Worker có R2 binding: kiểm tra vé HMAC rồi mới PUT/GET/DELETE; không dùng S3 access key cho OMR.
- Firebase Storage: chỉ dùng cho tài sản nhỏ cần Firebase Rules (logo/chữ ký/tệp cấu hình). Không sao chép ảnh OMR sang cả Storage và R2.
- IndexedDB trên thiết bị: nguồn làm việc local-first và outbox. Mất mạng không chặn chấm bài.

Không dùng bucket `conicgv-pdf`/Worker public hiện tại cho dữ liệu học sinh.

## Ranh giới dữ liệu

Mọi dữ liệu OMR nằm dưới UID Firebase:

```text
omrAccessRequests/{uid}
omrTenants/{uid}
omrTenants/{uid}/omrWorkspace/current
omrTenants/{uid}/omrResults/{resultId}
omrTenants/{uid}/omrBlobs/{blobId}
omrTenants/{uid}/omrMutations/{mutationId}
omrAdminAudit/{eventId}
```

Object R2 không chứa SBD/họ tên trong key:

```text
omr/users/{uid}/results/{resultUuid}/{randomUuid}.jpg
```

Bucket không có public domain. Trình duyệt chỉ gọi Worker bằng vé sống ngắn sau khi Functions đã kiểm tra chủ sở hữu, hạn dùng, quota và hạn lưu.

## Hai loại thời hạn độc lập

1. `accessExpiresAt`: admin duyệt số tháng dùng. Hết hạn thì dừng ghi/sync mới; dữ liệu local vẫn dùng được.
2. `expiresAt`: lần đầu một record/blob được đưa lên cloud cộng đúng 12 **tháng lịch**. Chỉnh sửa không kéo dài thời hạn.

API từ chối đọc/cấp URL khi đã tới `expiresAt`. Scheduled cleanup xóa vật lý định kỳ; Firestore TTL và R2 lifecycle là lớp dự phòng. TTL/lifecycle không bảo đảm xóa đúng từng giây, nên không được dùng làm cutoff truy cập.

## Quota mặc định

- 10 lớp/năm học.
- 500 học sinh duy nhất/năm học.
- 5.000 kết quả/năm học (admin có thể điều chỉnh về sau).
- Dung lượng R2 do admin cấp; mặc định 1 GiB/giáo viên.
- Toàn bộ OMR có chốt cứng 5 GiB để chừa phần miễn phí cho các bucket `conicgv` khác.
- Mỗi ảnh tối đa 8 MiB; PDF batch nên tải multipart ở pha sau.

Quota là server-side và cập nhật bằng transaction/idempotency key. Client không được tự ghi entitlement/counter.

## Chuẩn bị production

1. Thu hồi/rotate toàn bộ R2 credential cũ từng xuất hiện trong `conicgv/public/R2.md`; xóa file khỏi bản hiện hành và xử lý lịch sử Git riêng. OMR mới không phụ thuộc các credential này.
2. [Đã xong] Bucket R2 Standard `sang-math-omr-private` đã được tạo; `r2.dev` đang tắt.
3. [Đã xong] Worker `sang-math-omr-storage` đã gắn trực tiếp bucket. CORS Worker chỉ cho `https://chamthi-conictypst.pages.dev`; request không có vé hợp lệ bị từ chối.
4. [Đã xong] Cùng một secret `OMR_STORAGE_HMAC_SECRET` đã được đặt trong Firebase Secret Manager và Worker secret; không lưu giá trị trong repo.
5. [Đã xong] `chamthi-conictypst.pages.dev` đã được thêm vào Firebase Authentication Authorized domains.
6. [Đã xong] 12 Function `omr*`, Rules, collection-group indexes, TTL, Worker, trang chấm và trang admin đã được deploy riêng; Function/Hosting cũ của `conicgv` không bị deploy kèm.
7. [Đã xong] R2 lifecycle 366 ngày cho prefix `omr/` là lớp dự phòng (366 để không xóa sớm trong năm nhuận). Scheduled cleanup chạy mỗi giờ và retry tối đa 3 lần; Firestore TTL là lớp dự phòng tiếp theo.
8. [Sau khi thử nghiệm nhóm nhỏ] Cấu hình App Check/reCAPTCHA và cảnh báo ngân sách trước khi mở đại trà.

## Chính sách sync

- Điểm/lớp/đáp án: tự động đồng bộ khi tài khoản active.
- Ảnh bài chấm: mặc định bật nhưng giáo viên có thể tắt để tiết kiệm dung lượng.
- Gemini API key không bao giờ được đồng bộ.
- Thao tác được ghi vào IndexedDB outbox trước khi gọi mạng.
- Outbox gắn Firebase UID và revision; request cũ không thể xóa bản sửa mới. Một trình duyệt chỉ gắn một tài khoản giáo viên để tránh trộn dữ liệu khi đổi Gmail.
- Xóa được ưu tiên trước workspace/kết quả; một item lỗi có backoff riêng và không chặn các item khác.
- Xóa dùng tombstone để thiết bị khác biết phải xóa bản cache.
- Khi chấm lại một bài, ảnh annotated mới được gắn an toàn trước; ảnh cũ chuyển sang hàng đợi xóa có retry để không rò dung lượng R2/quota.
- Workspace lần đầu được merge; các lần sau server version mới hơn là nguồn sự thật.
- Pull nền tối đa mỗi 15 phút khi tab đang mở; thay đổi local, online trở lại, mở tab và nút “Đồng bộ ngay” vẫn kích hoạt sớm.

## URL production

- Trang chấm: `https://chamthi-conictypst.pages.dev/`
- Trang quản trị: `https://chamthi-conictypst.pages.dev/omr-admin`
- PDF lớp 47 A4: `/test-data/lop-47-hoc-sinh/lop-47-hoc-sinh-ngau-nhien.pdf`
- PDF lớp 47 A5 ngang 12-4-6: `/test-data/lop-47-hoc-sinh-a5-ngang/lop-47-hoc-sinh-a5-ngang.pdf`

Local IndexedDB không thể tự chạy khi trình duyệt đã đóng; bản hết hạn được xóa khỏi máy ở lần mở/sync kế tiếp. Cloud từ chối truy cập đúng tại `expiresAt`, sau đó cleanup vật lý theo giờ.

## Trạng thái cổng R2

Worker R2 đã được triển khai trên bucket private riêng và không dùng access key/secret S3. Public Firebase config trong trình duyệt không phải secret; mọi secret HMAC/R2 tuyệt đối không được đưa vào HTML/JavaScript. Credential cũ của các phần `conicgv` khác vẫn phải được rotate độc lập.
