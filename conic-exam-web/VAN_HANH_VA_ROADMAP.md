# Conic Exam — vận hành và lộ trình sản phẩm

## Kết luận hiện tại

Conic Exam đã có data plane an toàn để chạy thử có thu phí: phân quyền thuê bao,
tenant giáo viên, lớp học, lịch thi, làm bài, chấm phía máy chủ và chính sách công
bố kết quả. Hệ thống **chưa ngang Azota về độ hoàn thiện sản phẩm** vì quy trình
đưa một đề Typst mới lên thi vẫn cần Publisher CLI và gói JSON.

Lợi thế cần tập trung không phải sao chép mọi tính năng của Azota, mà là:

> Một nguồn Typst Sang-Math tạo được PDF, OMR và bài thi online giữ nguyên công
> thức/hình vector, đúng cấu trúc THPT 12–4–6, bằng một quy trình xuất bản.

## Ai làm gì?

| Vai trò | Phạm vi |
|---|---|
| Super Admin | Duyệt/gia hạn/khóa giáo viên, quota, audit, tình trạng hệ thống |
| Giáo viên | Quản lý tenant riêng: lớp, học sinh, đề, lịch thi, bài làm, bảng điểm |
| Học sinh | Vào lớp bằng mã, chờ duyệt, làm bài, xem kết quả theo chính sách |

Không tạo một `pages.dev` hay Firebase riêng cho mỗi giáo viên. Một ứng dụng đa
tenant là kiến trúc đúng; mọi dữ liệu nghiệp vụ đều mang `teacherUid`, còn callable
server kiểm tra quyền sở hữu. Firestore không cho trình duyệt đọc trực tiếp kho đề,
khóa chấm hay bài làm.

## Quy trình đang chạy

1. Owner duyệt quyền Conic Exam 12 tháng cho giáo viên.
2. Giáo viên tạo lớp và gửi mã lớp.
3. Học sinh nhập mã; giáo viên duyệt đúng tài khoản.
4. Giáo viên soạn hoặc sửa `.typ` trong Studio.
5. Publisher strict kiểm tra ID, đáp án TLN và cấu trúc; Typst render từng câu.
6. Giáo viên tải `conic-exam-package.json` lên Kho đề.
7. Server kiểm tra lại gói, tách `publicPackage` và `answerKey`, tạo release bất biến.
8. Giáo viên tạo đợt thi: lớp, giờ mở/đóng, thời lượng, số lượt, chính sách kết quả.
9. Học sinh làm bài; từng đáp án chỉ tự lưu trong IndexedDB trên thiết bị hiện
   tại. Khi nộp hoặc hết giờ, client gửi một gói đáp án cuối cùng.
10. Server xác thực thời hạn, khóa và ghi bài đúng một lần, chấm TN/Đ-S/TLN;
    giáo viên chấm tự luận và công bố kết quả/lời giải.

Đề chuẩn để học quy trình là `typst/dethi/de-mau-tu-do.typ`: 22 câu = 12 TN +
4 Đ/S + 6 TLN, 10 điểm, strict pass và không có cảnh báo.

## Chính sách lưu bài tiết kiệm

Conic Exam dùng mô hình **final-submit-only** cho câu trả lời:

- Khi bắt đầu, server chỉ tạo một vé thi nhỏ chứa học sinh, đề, số lượt,
  `startedAt`, `deadlineAt` và thứ tự câu. Vé này là bắt buộc để học sinh không
  thể mở lại nhằm đặt lại đồng hồ hoặc vượt số lượt.
- Trong lúc làm, câu trả lời, câu đánh dấu và vị trí đang xem chỉ được ghi vào
  IndexedDB của đúng tài khoản trên trình duyệt hiện tại. Không gọi Cloud
  Function và không ghi Firestore sau từng câu.
- Khi bấm **Nộp bài**, client gửi toàn bộ `responses` một lần. Server kiểm tra
  owner, thời hạn và schema, chấm rồi cập nhật attempt trong một transaction.
- `mutationId` và hash của gói nộp được giữ ngay trong attempt để lần retry cùng
  nội dung nhận lại đúng biên nhận, không tạo thêm một mutation document.
- Cache local chỉ bị xóa sau khi server trả biên nhận. Nếu mất mạng khi nộp, bài
  vẫn còn trên thiết bị và học sinh phải kết nối lại.
- Có 60 giây đệm chỉ dành cho việc truyền gói nộp sau khi đồng hồ về 0. Sau mốc
  này, lượt không có final payload chuyển thành `expired_unsubmitted`.

Giới hạn cần nói rõ: bản nháp local khôi phục được sau reload trên cùng trình
duyệt, nhưng không phải cloud backup. Đổi máy, xóa dữ liệu website hoặc đăng xuất
trước khi nộp có thể làm mất bản nháp. Giáo viên chỉ thấy trạng thái đã bắt đầu
và đã nộp, không thấy từng đáp án theo thời gian thực.

“Ghi một lần lúc nộp” ở đây là **gói câu trả lời chỉ được ghi một lần**. Hệ
thống vẫn phải tạo vé thi khi bắt đầu, khóa lượt, kiểm tra quota và tạo audit
nhỏ. Không nên quảng cáo là toàn bộ một lượt thi chỉ phát sinh đúng một document
write.

### Ranh giới lưu giữ dữ liệu

Nguyên tắc bắt buộc là:

> Mọi dữ liệu có thể quy về một học sinh hoặc một bài làm phải biến mất khỏi
> hệ thống và bản sao lưu chậm nhất sau 12 tháng. Kho đề, source và tài sản do
> giáo viên tạo không áp dụng TTL.

| Nhóm dữ liệu | Ví dụ | Chính sách |
|---|---|---|
| Bài làm chi tiết | `responses`, `itemResults`, điểm, feedback tự luận, thời gian làm, log thiết bị | Tối đa 12 tháng rồi xóa |
| Chi tiết học sinh trong tenant | UID, tên, email, ảnh đại diện, roster lớp, reverse link, attempt counter | Tối đa 12 tháng; lớp năm học mới phải ghi danh lại |
| Ảnh/minh chứng học sinh | Ảnh bài tự luận, tệp đính kèm, scan hoặc log giám sát | Object và metadata cùng hết hạn tối đa 12 tháng |
| Thống kê vô danh | Số lượt, phổ điểm, tổng số đúng theo câu, thời gian trung bình | Có thể giữ lâu dài nếu không còn UID, tên, email, câu trả lời thô hoặc đường dẫn ảnh |
| Tài sản giáo viên | Source `.typ`, project, release, answer key, SVG/PDF, template, manifest | Không TTL; giữ đến khi giáo viên chủ động xóa hoặc xóa toàn tenant |
| Idempotency/audit | Mutation receipt, audit bảo mật | Mutation 30 ngày; audit có học sinh tối đa 12 tháng |

Chính sách đích khi hết hạn thuê bao là chuyển kho giáo viên sang trạng thái chỉ
đọc, không tự xóa source/release/asset. Code hiện tại chặn toàn bộ callable giáo
viên khi quyền hết hạn, nên cần bổ sung đường đọc/xuất kho riêng. Quy trình xóa
tenant hiện có thời gian chờ 7 ngày vẫn là đường xóa toàn bộ khi giáo viên yêu
cầu.

### TTL, index và quy trình xóa

Mốc vận hành nên đặt ngắn hơn 365 ngày để còn thời gian cho TTL bất đồng bộ và
backup:

1. Khi nộp bài, cố định `retentionOriginAt = submittedAt` và
   `expireAt = submittedAt + 350 ngày`. Chấm lại tự luận không được kéo dài mốc
   này. Lượt không nộp dùng `expiredAt` làm mốc.
2. `examAttempts`, roster `members`, reverse link `classes`,
   `examAttemptCounters` và metadata ảnh học sinh đều phải có `expireAt`.
3. Dữ liệu lớn như `responses`, `itemResults`, `manualGrades`, SVG và source
   không tạo single-field index. Field TTL cũng bỏ index nếu không cần query để
   tránh tăng dung lượng và hotspot.
4. Chỉ metadata object cần dọn trước khi TTL mới giữ index
   `expiresAt ASC`: job dọn xóa object R2, đánh dấu hoàn tất rồi để Firestore TTL
   xóa metadata. R2 có thêm lifecycle rule cho prefix `student-evidence/` ở 350
   ngày làm lớp bảo vệ cuối.
5. Giữ đúng các composite index phục vụ nghiệp vụ:
   `assignmentId + submittedAt`, `studentUid + startedAt` và
   `status + deadlineAt`; không index câu trả lời hoặc chi tiết chấm.
6. Firestore TTL không xóa subcollection và không bảo đảm các document liên quan
   biến mất trong cùng transaction. Vì vậy cleanup phải idempotent, xóa cả hai
   phía roster/link, counter, metadata và object; chạy lại an toàn nếu lần trước
   bị ngắt.
7. Dashboard theo dõi số TTL delete và độ trễ từ hết hạn đến xóa. Firestore cho
   biết dữ liệu thường được xóa trong vòng 24 giờ sau mốc TTL, không phải ngay
   lập tức; ngày 350 tạo đủ vùng đệm để kiểm tra hard deadline ngày 365.

Tài liệu chính thức: [Firestore TTL](https://firebase.google.com/docs/firestore/ttl)
và [R2 object lifecycle](https://developers.cloudflare.com/r2/buckets/object-lifecycles/).

Quy trình dọn dữ liệu hàng ngày:

1. Tổng hợp thống kê vô danh cần giữ trước khi bài chi tiết hết hạn.
2. Xóa object học sinh đã hết hạn, sau đó xóa/TTL metadata.
3. Đối soát dangling object và dangling metadata theo prefix/hash.
4. Kiểm tra không còn record quá hard deadline 365 ngày; nếu còn thì cảnh báo
   owner và chạy purge cưỡng bức.
5. Yêu cầu xóa của học sinh hoặc giáo viên chạy ngay qua deletion job, không chờ
   đến TTL tự nhiên.

### Backup không được phá vỡ thời hạn 12 tháng

- Dùng full Firestore backup hằng ngày, chỉ giữ 7 ngày. Vì dữ liệu online bắt đầu
  hết hạn ở ngày 350, ngay cả bản backup cuối cùng có chứa record đó cũng hết hạn
  trước ngày 365.
- Backup Firestore chứa toàn database và không mang theo TTL policy. Khi restore,
  luôn restore vào database cách ly, chạy `purgeExpired` và đối soát object trước
  khi chuyển traffic; không restore thẳng lên production.
- Mỗi tuần xuất chọn lọc riêng các collection tài sản giáo viên
  (`examReleases`, `examAnswerKeys`, cấu hình đề/lịch và manifest) để giữ 30
  ngày. Không đưa `examAttempts`, roster hoặc metadata ảnh học sinh vào bản xuất
  dài hạn.
- Release object dùng key theo `contentHash`, bất biến và có manifest kiểm tra
  SHA-256. Ảnh học sinh không dùng chung bucket/prefix với tài sản giáo viên.

Firestore hỗ trợ backup hằng ngày/hằng tuần và backup là bản sao toàn database;
export chọn lọc collection dùng cho kho giáo viên được mô tả tại
[Firestore backups](https://cloud.google.com/firestore/docs/backups) và
[Firestore export/import](https://cloud.google.com/firestore/docs/manage-data/export-import).

### Thống kê ít ghi

- Không tạo event document cho từng câu, lần đổi đáp án, lần chuyển trang hoặc
  heartbeat.
- Attempt cuối cùng đã chứa đủ `responses`, điểm và `itemResults`; đây là nguồn
  sự thật duy nhất trong 12 tháng.
- Sau khi đợt thi đóng, hoặc theo batch ban đêm, đọc các attempt mới một lần và
  ghi đè một document `examAssignmentStats/{assignmentId}` gồm count, histogram
  điểm và tổng đúng/sai theo câu. Document này không chứa dữ liệu nhận diện.
- Báo cáo năm của giáo viên cập nhật tối đa một lần/ngày từ các summary, không
  increment hàng chục field cho mỗi lần học sinh chọn đáp án.
- Chấm tự luận chỉ đánh dấu assignment “stats dirty”; batch kế tiếp tính lại.
  Không cần duy trì một mutation document cho từng thay đổi nhỏ.

### Quota 100.000đ/năm

Đơn vị bán hàng nên là **bài nộp cuối thành công**, không phải số lần mở đề.
Quota dùng chung tự giải quyết câu hỏi “ít học sinh thì có được thi nhiều hơn
không”:

| Quy mô | Tần suất trong 40 tuần | Final submissions/năm |
|---|---:|---:|
| 47 học sinh | 3 bài/tuần | 5.640 |
| 100 học sinh | 3 bài/tuần | 12.000 |
| 200 học sinh | 3 bài/tuần | 24.000 |

Gói cơ bản 100.000đ/12 tháng nên giữ **12.000 final submissions** và tối đa 100
học sinh active cùng lúc. Như vậy 47 học sinh có thể dùng khoảng 6,4 lượt thi
toàn lớp/tuần, còn 100 học sinh dùng đúng 3 lượt/tuần. Lượt bắt đầu nhưng không
nộp không trừ quota trả phí, nhưng vẫn chịu rate limit và một ngưỡng chống lạm
dụng riêng.

Điểm cần sửa trước khi bán: code hiện tại tăng `examTeacherUsage.attemptCount`
ngay tại `examStartAttempt`. Meter thương mại phải chuyển sang tăng
`finalSubmissionCount` đúng một lần trong transaction nộp bài; receipt/hash bảo
đảm retry không tăng quota lần hai. Có thể giữ `startCount` riêng để chống abuse,
nhưng không hiển thị nó như lượt đã mua.

Không nên tăng gói cơ bản lên 24.000 lượt ở giá 100.000đ. Phần vượt 12.000 dùng
top-up, ví dụ 30.000đ/5.000 final submissions, hoặc tier Pro. Quota release hiện
là 200 bản tích lũy suốt đời cũng không phù hợp với kho đề lâu dài: giáo viên ra
3 đề/tuần sẽ chạm trần sau khoảng 20 tháng. Nên chuyển giới hạn chính sang dung
lượng asset bất biến và số release mới trong kỳ, không xóa release cũ chỉ để
giải phóng bộ đếm.

### Ước lượng dung lượng và chi phí

Giả định bảo thủ:

- Đề thật `de-01.typ` có public package compact 794.920 byte, làm tròn 0,8 MiB.
- Một attempt 22 câu hiện có JSON khoảng 4,2 KiB; mô hình lấy 12 KiB/lượt để
  gồm audit, counter, metadata và index overhead.
- Một lượt gồm khoảng 14 reads, 8 writes vòng đời và 4 deletes sau retention.
  Gói đáp án vẫn chỉ ghi một lần khi nộp.
- Có 7 bản full backup quay vòng, 120 release/năm và release được phát từ R2.
- Dùng đơn giá không cam kết: Firestore $0,03/100.000 reads,
  $0,09/100.000 writes, $0,01/100.000 deletes, khoảng $0,15/GiB-tháng;
  backup khoảng $0,03/GiB-tháng. R2 Standard là $0,015/GB-tháng,
  $0,36/triệu GET và không tính egress.
- Quy đổi kế hoạch 27.000đ/USD, cao hơn nhẹ tỷ giá bán USD 26.471đ được
  Vietcombank niêm yết đầu tháng 7/2026 để có đệm tỷ giá.

| Kịch bản | Dữ liệu Firestore rolling | Chi phí trực tiếp/năm | Biên hạ tầng trên 100.000đ |
|---|---:|---:|---:|
| 47 HS × 3 bài/tuần = 5.640 lượt | khoảng 66 MiB | khoảng $0,41 ≈ 11.000đ | khoảng 89% |
| 100 HS × 3 bài/tuần = 12.000 lượt | khoảng 141 MiB | khoảng $0,86 ≈ 23.000đ | khoảng 77% |
| 200 HS × 3 bài/tuần = 24.000 lượt | khoảng 281 MiB | khoảng $1,70 ≈ 46.000đ | khoảng 54% |

Đây là chi phí hạ tầng biên, chưa gồm thuế, phí thanh toán, hỗ trợ, log bất
thường và công phát triển. Khi lập ngân sách nên dự phòng gấp đôi dòng trực tiếp:
gói 12.000 lượt vẫn còn khoảng 54.000đ cho chi phí khác; gói 24.000 lượt gần như
không còn vùng an toàn ở giá 100.000đ.

R2 là điều kiện quan trọng của phép tính này. Nếu callable tiếp tục trả toàn bộ
0,8 MiB release cho mỗi lần bắt đầu, 12.000 lượt tạo khoảng 9,4 GiB egress/năm;
chi phí mạng biên có thể thêm khoảng 35.000đ/giáo viên sau free tier. Release nên
được tải bằng URL/ticket ngắn hạn từ R2, cache theo `contentHash`; callable chỉ
trả quyền, metadata và receipt nhỏ.

Nguồn giá chính thức:
[Firestore pricing](https://cloud.google.com/firestore/pricing),
[Firestore billing](https://firebase.google.com/docs/firestore/pricing),
[Cloud Run functions](https://cloud.google.com/functions),
[Cloudflare R2 pricing](https://developers.cloudflare.com/r2/pricing/) và
[Vietcombank tỷ giá](https://www.vietcombank.com.vn/vi-VN/To-chuc/Trang-chu-DCTC/KHTC---Ti-gia---DCTC).

### Trạng thái code so với chính sách đích

| Hạng mục | Hiện tại | Việc cần làm |
|---|---|---|
| Draft đáp án | IndexedDB, không ghi từng câu | Giữ nguyên |
| Final submit | Ghi cả gói trong transaction | Giữ nguyên |
| Legacy autosave | Backend còn export `examSaveResponses`, frontend mới không gọi | Gỡ/khóa sau cửa sổ migration để không bị lạm dụng ghi nhiều |
| Attempt TTL | Có `expireAt` và TTL, tính từ lúc bắt đầu | Chuyển mốc sang submit/expire và chừa buffer |
| Mutation/audit TTL | Mutation 30 ngày, audit 365 ngày | Giữ; bảo đảm audit có học sinh không quá hard deadline |
| Roster/link/counter | Chưa có TTL | Bổ sung TTL và cleanup hai chiều |
| Ảnh bài làm online | Chưa có trong Conic Exam | Khi thêm phải tách prefix/bucket và lifecycle 350 ngày |
| Meter quota | Trừ khi bắt đầu | Chuyển sang final submission idempotent |
| Hạn học sinh | Mặc định hiện là 500 | Chốt base 100 active; tenant lớn dùng tier/add-on |
| Hết hạn thuê bao | Callable giáo viên bị chặn | Cho đọc/xuất kho GV, không cho tạo kỳ thi mới |
| Thống kê | `count()` khi bootstrap, `startedCount` khi bắt đầu | Thêm summary batch vô danh, không ghi theo câu |
| Release asset | Public package base64 nằm trong Firestore | Chuyển object bất biến sang R2; Firestore chỉ giữ hash/key |

## Typst, WASM, SVG và hình vẽ

Studio dùng `typst.ts` WASM trong Web Worker để biên dịch preview ngay trên trình
duyệt giáo viên. Bản phát hành thi hiện dùng Typst CLI trong Publisher để khóa
phiên bản và tạo đầu ra ổn định:

```text
.typ + Sang-Math + CeTZ
  → Typst query metadata/khóa đáp án
  → Typst render một SVG tự chứa cho mỗi câu
  → kiểm tra an toàn + SHA-256
  → gzip/base64
  → callable tách public/private
  → học sinh chỉ giải nén và hiển thị SVG bằng <img>
```

Máy học sinh không chạy Typst/WASM, không nhận source và không nhận answer key.
Hình CeTZ, bảng và glyph toán đã nằm trong SVG vector nên không cần font hay ảnh
ngoài. Với đề lớn, đích kiến trúc là lưu SVG gzip bất biến ở R2/Cloud Storage và
chỉ giữ metadata, hash và object key trong Firestore. Học sinh nhận ticket ngắn
hạn để tải từ R2; tài sản giáo viên không TTL, còn prefix ảnh/bài làm học sinh có
lifecycle riêng tối đa 12 tháng.

## Lộ trình theo thứ tự thương mại

### P0 — cần để bán paid beta

- Nút `Phát hành Online` ngay trong Studio: WASM preflight/build hoặc build job
  sandbox, server kiểm tra lại, không còn CLI/JSON với người dùng cuối.
- Kho dự án nháp → preview như học sinh → release bất biến → giao cho lớp.
- Template hệ thống cài một chạm bằng callable; artifact/key nằm ở private storage.
- Lưu và công bố được lời giải SVG giàu định dạng, không chỉ đáp án đúng/sai.
- Trang công khai `/t/:slug`, logo/màu giáo viên, link/QR lớp và kỳ thi.
- Phổ điểm, tỷ lệ đúng từng câu, trạng thái chưa thi/đang thi/đã nộp, thời gian làm.
- Xuất Excel/CSV; import danh sách học sinh; archive/clone/version đề và lớp.
- Log rời tab/fullscreen/thiết bị theo tùy chọn, khóa lượt đồng thời và rate limit.
- Meter quota theo final submission; TTL roster/counter/evidence; summary vô danh.
- Chuyển release SVG khỏi Firestore sang R2 và cache theo `contentHash`.
- Notification trong app; usage/quota/ngày hết hạn; App Check, backup và cảnh báo lỗi.

### P1 — sản phẩm giữ chân giáo viên

- Ngân hàng câu hỏi riêng và kho hệ thống, tag/chủ đề/mức độ, ma trận và trộn đề.
- Tách stem/phương án/phát biểu thành asset độc lập để trộn đáp án thật.
- Báo cáo tiến bộ học sinh qua nhiều đề, phúc khảo và lịch sử thay đổi điểm.
- Link thi tự do/PIN/phòng chờ; email hoặc Web Push.
- Đồng bộ một bảng điểm chung giữa bài thi online và chấm OMR.

### P2 — quy mô trường/tổ chức

- Trường/tổ bộ môn, đồng tác giả, ngân hàng dùng chung và nhiều quản trị viên.
- White-label, tên miền riêng, API/SSO, marketplace và thanh toán tự động.
- Phân tích độ khó/độ phân biệt/reliability; app/kiosk và các chế độ giám sát nâng cao.

## Nguyên tắc tái sử dụng dự án cũ

Có thể lấy UX/ý tưởng từ `conicgv` và `thi-online` như teacher profile, help center,
bank, biểu đồ, Excel, live room và anti-cheat. Không ghép nguyên backend/rules cũ
vào hệ thống mới. Mỗi tính năng phải di trú qua callable và mô hình chấm server
hiện tại để không hạ thấp ranh giới bảo mật.

Tài liệu tham chiếu đối chiếu sản phẩm: [Azota — tạo đề](https://docs.azota.vn/docs/huong-dan-su-dung/de-thi/),
[cấu hình thi online](https://docs.azota.vn/docs/huong-dan-su-dung/thi-online/cau-hinh-thi-online/),
[thống kê](https://docs.azota.vn/docs/huong-dan-su-dung/thi-online/thong-ke-de-thi/),
[giám sát thi](https://docs.azota.vn/docs/huong-dan-su-dung/thi-online/giam-sat-thi/).
