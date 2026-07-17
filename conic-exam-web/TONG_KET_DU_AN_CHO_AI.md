# Conic Exam — tổng kết dự án và hồ sơ bàn giao cho AI

> Cập nhật: 17/07/2026 (Asia/Ho_Chi_Minh)  
> Production: <https://thi-conictypst.pages.dev/>  
> Mục đích: giúp một AI/lập trình viên mới đọc một file này là hiểu trạng thái
> hiện tại, tiếp tục đúng kiến trúc và không làm hỏng các ranh giới bảo mật.

## 1. Kết luận ngắn

Conic Exam là hệ thống thi trực tuyến đa tenant cho đề Toán Typst/Sang-Math.
Giáo viên tải trực tiếp file `.typ` hoặc cả thư mục dự án, trình duyệt tự tìm file
đề, biên dịch bằng Typst WASM, tách câu, hiển thị text + KaTeX và giữ hình phức
tạp ở dạng SVG vector. Giáo viên duyệt/sửa từng câu rồi phát hành, giao cho lớp,
theo dõi bài làm và chấm tự luận. Học sinh đăng nhập Google, vào lớp bằng mã,
link hoặc QR, làm bài có lưu nháp cục bộ và nộp một lần lên máy chủ.

Hệ thống đã đủ để chạy thử với vài lớp thật. Nó chưa phải sản phẩm hoàn thiện
toàn bộ: chưa có Excel/PDF/giấy khen/bảng vàng, thống kê sâu từng câu, kho đề
công khai có tìm kiếm, import danh sách hàng loạt và một số công việc tối ưu chi
phí/lưu trữ ở phần backlog.

## 2. Điều AI tiếp theo phải đọc trước khi sửa

1. Đọc file này, sau đó đọc `VAN_HANH_VA_ROADMAP.md`.
2. Kiểm tra `git status` trước mọi thay đổi. Worktree hiện có nhiều thay đổi và
   file chưa được track; không được `git reset --hard`, `git checkout --` hoặc
   ghi đè thay đổi không liên quan.
3. Chạy test backend và frontend trước khi deploy.
4. Không đưa answer key, rubric riêng tư hoặc đáp án đúng vào payload học sinh.
5. Không cho web đọc/ghi trực tiếp dữ liệu nghiệp vụ Firestore. Mọi thao tác lớp,
   đề, lịch thi, bài làm và quản trị phải qua callable Cloud Functions.
6. Không biến toàn bộ câu hỏi thành ảnh raster. Text/toán phải ưu tiên HTML +
   KaTeX; chỉ hình, bảng biến thiên, CeTZ hoặc nội dung Typst khó chuyển mới dùng
   SVG vector tự chứa.
7. Không tạo Firebase/Pages riêng cho từng giáo viên. Đây là ứng dụng đa tenant;
   dữ liệu phải có `teacherUid` và server phải kiểm tra owner.

## 3. Địa chỉ và hạ tầng

| Thành phần | Giá trị hiện tại |
|---|---|
| Web production | <https://thi-conictypst.pages.dev/> |
| Cổng giáo viên | <https://thi-conictypst.pages.dev/teacher> |
| Cổng học sinh | <https://thi-conictypst.pages.dev/student> |
| Super Admin | <https://thi-conictypst.pages.dev/admin> |
| Frontend hosting | Cloudflare Pages project `thi-conictypst` |
| Identity nguồn | Firebase project `conicgv`, Google Sign-In |
| Backend/data | Firebase project `conictypst-platform` |
| Functions/Firestore region | `asia-southeast1` |
| Runtime | Node.js 22, Cloud Functions gen 2/Cloud Run |
| Frontend | React 19, Vite 8, Firebase SDK, SweetAlert2 |
| Typst web | `typst.ts` 0.7.0 chạy trong Web Worker |
| Toán web | KaTeX 0.16.22 |
| QR | `qrcode` 1.5.4, tạo ngay trên trình duyệt |

Firebase API key ở frontend là cấu hình client, không phải secret. Không được
đưa service-account JSON, khóa R2 hay secret HMAC vào repository hoặc bundle.

## 4. Kiến trúc đăng nhập và phân quyền

```text
Google Sign-In ở project conicgv
  -> lấy ID token
  -> ctExchangeConicgvToken xác minh token/revocation
  -> mint custom token cùng UID cho conictypst-platform
  -> mọi callable tiếp theo dùng phiên platform
```

Vai trò:

- Super Admin: bản ghi active trong `platformAdmins/{uid}` là nguồn quyền thật.
- Giáo viên: membership của sản phẩm `exam`; có trạng thái, ngày hết hạn và quota.
- Học sinh: tài khoản Google đã xác minh; chỉ vào được lớp bằng mã/link/QR và
  theo chế độ do giáo viên đặt.

Không tin custom claim đơn lẻ để vượt qua bản ghi admin/membership bị khóa.

## 5. Những phần đã làm được

### 5.1 Super Admin

- Dashboard chi phí/quota/vận hành, nhịp lượt thi 14 ngày và cảnh báo sớm.
- Duyệt, gia hạn, tạm khóa, mở lại và lên lịch xóa tenant giáo viên.
- Sửa quota từng giáo viên: lớp, học sinh, đề phát hành, lịch thi hoạt động,
  lượt thi/năm, thời gian lưu và dung lượng.
- Xem nhật ký quản trị/audit.
- Xem từng giáo viên có bao nhiêu lớp, lượt ghi danh học sinh, đề, lịch giao và
  lượt thi; mở chi tiết từng lớp để xem mã lớp, chế độ vào lớp, số đang học và
  số chờ duyệt.

Lưu ý dữ liệu: `activeStudentMemberships` là số **lượt ghi danh active**, không
phải số UID học sinh duy nhất. Một học sinh ở hai lớp của cùng giáo viên hiện
được tính là 2. Nếu sản phẩm cần “học sinh duy nhất theo giáo viên”, phải thêm
counter/dedup theo `(teacherUid, studentUid)` hoặc aggregation riêng.

### 5.2 Giáo viên và lớp học

- Tạo lớp với tên, môn, khối, năm học.
- Mỗi lớp có mã 8 ký tự, link mời và QR riêng.
- Hai chế độ vào lớp:
  - `approval`: học sinh gửi yêu cầu, giáo viên duyệt/từ chối.
  - `auto`: học sinh đăng nhập Google và vào ngay nếu quota còn chỗ.
- Giáo viên đổi chế độ sau khi tạo lớp.
- Danh sách thành viên có bộ lọc active/pending/rejected/removed; có duyệt,
  từ chối và xóa học sinh khỏi lớp.
- Việc vào lớp dùng transaction, chống gửi trùng, kiểm tra quota và ghi audit.

### 5.3 Nạp và phát hành đề Typst

- Không bắt giáo viên tự tạo ZIP hoặc JSON.
- Chọn một file `.typ` nếu đề độc lập, hoặc chọn cả thư mục nếu có import/ảnh/
  dữ liệu phụ.
- Tự tìm entry: ưu tiên `main.typ`, tên đề, marker và lệnh câu hỏi; loại trừ các
  file thư viện phổ biến.
- Hiển thị cây file, cho đổi entry và xử lý mọi đường dẫn bên trong project root.
- Typst WASM chạy trong Web Worker để tránh khóa UI.
- Metadata câu/đáp án được query từ Typst; ID câu và phương án ổn định.
- Nội dung thường được lưu có cấu trúc `conic-typst-katex/v1`: text/toán render
  bằng HTML + KaTeX; asset khó chuyển được chèn bằng marker và SVG vector gzip.
- Giáo viên xem từng câu, sửa nội dung/phương án/đáp án/lời giải/điểm, xóa câu,
  preview rồi mới phát hành.
- Release là revision bất biến; sửa đề sẽ tạo bản mới. Có xem, sửa thành bản mới
  và archive/xóa release khỏi giao diện.
- Server tách `publicPackage` khỏi `answerKey`; học sinh không nhận khóa chấm.

### 5.4 Lịch thi và trộn đề

- Giao một release cho một lớp, đặt giờ mở/đóng, thời lượng và số lượt tối đa.
- Trộn câu trong từng phần; vẫn giữ thứ tự Phần I/II/III và ID ổn định.
- Trộn phương án chỉ bật khi cấu trúc đề hỗ trợ an toàn.
- Chính sách công bố điểm và lời giải: ngay sau nộp, sau khi đóng, giáo viên
  công bố hoặc không công bố.
- Giáo viên có thể đóng/hủy lịch thi.
- Scheduler quét lượt hết giờ và khóa/chấm hoặc đánh dấu `expired_unsubmitted`.

### 5.5 Học sinh và bài làm

- Đăng nhập Google, quét QR/mở link/nhập mã lớp.
- Link dạng `/student?join=XXXXXXXX` tự thực hiện yêu cầu sau khi đăng nhập.
- Xem lớp đã duyệt/chờ duyệt, bài đang mở/sắp mở/đã đóng và lịch sử gần đây.
- Khi bắt đầu, server tạo attempt, thời hạn và thứ tự trộn cố định.
- Đáp án nháp lưu IndexedDB trên đúng thiết bị; reload vẫn phục hồi.
- Không ghi Firestore sau mỗi lần đổi đáp án. Khi nộp, gửi toàn bộ đáp án một lần.
- `mutationId` + hash/receipt làm nộp bài idempotent, chống nộp trùng khi retry.
- Cảnh báo câu chưa làm, điều hướng câu, đánh dấu xem lại và xác nhận trước nộp.
- Ghi nhận một số sự kiện toàn vẹn/rời trang; giáo viên thấy số cảnh báo.
- Xem điểm/đúng sai/lời giải theo đúng chính sách của lịch thi.

### 5.6 Chấm và kết quả

- TN, Đúng/Sai và TLN được chấm phía server.
- TLN hỗ trợ nhiều đáp án chấp nhận và tolerance.
- Câu không thể xác định đáp án máy an toàn được chuyển sang tự luận thay vì
  đoán sai.
- Giáo viên xem bảng bài làm, trạng thái, điểm máy, điểm tự luận, cảnh báo toàn
  vẹn; chấm tự luận bằng điểm + nhận xét.

### 5.7 Giao diện

- Chủ đạo xanh đậm/xanh lá/cam, card, hover, trạng thái màu và responsive.
- SweetAlert2 dùng cho thông báo/xác nhận quan trọng.
- Đã có bố cục riêng cho Super Admin, giáo viên, học sinh, player và kết quả.
- QR được sinh local; không gửi link lớp qua dịch vụ QR bên thứ ba.

## 6. Mã nguồn quan trọng

| Khu vực | File/thư mục |
|---|---|
| Router/app | `src/App.jsx`, `src/main.jsx` |
| Auth hai Firebase project | `src/auth/AuthContext.jsx`, `src/config.js` |
| API callable | `src/lib/api.js` |
| Super Admin UI | `src/pages/AdminPortal.jsx` |
| Giáo viên UI | `src/pages/TeacherPortal.jsx` |
| Học sinh UI | `src/pages/StudentPortal.jsx` |
| Làm bài/kết quả | `src/pages/ExamPlayer.jsx`, `src/pages/ResultPage.jsx` |
| Render text/KaTeX/SVG | `src/components/QuestionRenderer.jsx`, `src/lib/structuredContent.js` |
| Đọc project/cây file | `src/lib/typstProject.js` |
| Browser Publisher | `src/publisher/` |
| Offline draft | `src/lib/offline.js` |
| Backend Exam | `../conictypst-platform/functions/exam.js` |
| Logic lớp | `../conictypst-platform/functions/lib/examClassroom.js` |
| Cost/quota | `../conictypst-platform/functions/lib/examCostControl.js`, `examQuota.js` |
| Chấm/trộn/validate | `examGrading.js`, `examShuffle.js`, `examValidation.js` |
| Rules/indexes | `../conictypst-platform/firestore.rules`, `firestore.indexes.json` |

## 7. Mô hình dữ liệu chính

- `products/exam/members/{teacherUid}`: quyền, hạn dùng, limits của giáo viên.
- `examTeacherUsage/{teacherUid}`: counter/quota sử dụng.
- `examClassrooms/{classId}` và `members/{studentUid}`: lớp và roster.
- `examJoinCodes/{code}`: ánh xạ mã sang lớp.
- `examStudentClassLinks/{studentUid}/classes/{classId}`: reverse link cho HS.
- `examReleases/{releaseId}`: public package/release metadata.
- `examAnswerKeys/{releaseId}`: answer key riêng tư, chỉ server đọc.
- `examAssignments/{assignmentId}`: lịch thi/chính sách/trộn.
- `examAttempts/{attemptId}`: lượt làm và kết quả cuối.
- `examAttemptCounters`: khóa lượt hiện tại/số lượt.
- `examAttemptMutations`: idempotency khi nộp/chấm.
- `examAudit`: nhật ký nghiệp vụ.
- `adminAudit`, `adminMutations`, `deletionJobs`: quản trị và xóa tenant.

## 8. Callable Exam hiện có

`examGetBootstrap`, `examCreateClassroom`, `examJoinClassroom`,
`examUpdateClassroomJoinSettings`, `examReviewStudent`,
`examListClassroomStudents`, `examPublishRelease`, `examGetRelease`,
`examGetReleaseForEdit`, `examArchiveRelease`, `examCreateAssignment`,
`examUpdateAssignment`, `examStartAttempt`, `examGetAttempt`,
`examReportIntegrityEvent`, `examSaveResponses` (legacy),
`examSubmitAttempt`, `examGetResult`, `examListResults`, `examGradeManual`,
`examAdminGetStats`, `examAdminGetTeacherOverview` và scheduler
`examFinalizeExpiredAttempts`.

`examSaveResponses` còn tồn tại để tương thích cũ nhưng frontend mới không dùng.
Không xây tính năng mới dựa trên autosave cloud từng câu.

## 9. Test, build và deploy

### Frontend

```bash
cd /Users/admin/conictypst/conic-exam-web
npm test
npm run build
npm run deploy
```

Lần kiểm tra gần nhất: 21/21 test pass; production bundle chính sau đợt QR/lớp
là `index-Dz4zfCnq.js`.

### Backend

```bash
cd /Users/admin/conictypst/conictypst-platform
npm --prefix functions test
npx firebase-tools deploy --only functions
```

Lần kiểm tra gần nhất: 60 test tổng, 58 pass và 2 test emulator skip khi không
chạy emulator; không có test fail. Đợt deploy gần nhất cập nhật 5 Functions,
0 lỗi.

Kiểm thử tích hợp đầy đủ:

```bash
cd /Users/admin/conictypst/conictypst-platform
firebase emulators:exec \
  --project conictypst-platform \
  --only auth,firestore,functions \
  "npm --prefix functions run test:emulator"
```

Sau deploy frontend, luôn kiểm tra domain chính chứ không chỉ URL preview; nếu
index cũ do cache, dùng query cache-buster và xác nhận hash bundle mới.

## 10. Chi phí vận hành

### 10.1 Nếu không có người dùng

Kết luận thực tế: **dự kiến gần 0 đồng**, nhưng không nên hứa tuyệt đối 0 vì
project đang bật Blaze và vẫn có hai scheduler nền.

- Cloudflare Pages hiện chỉ phục vụ static assets: request static được miễn phí.
- Callable Functions đều `minInstances = 0`: không có container giữ nóng để trả
  tiền khi idle.
- Hai scheduler đang chạy:
  - `examFinalizeExpiredAttempts`: mỗi 5 phút.
  - `omrCleanupExpiredData`: mỗi 60 phút.
- Cloud Scheduler miễn phí 3 job/tháng trên **mỗi billing account**. Project này
  có 2 job; nếu billing account còn dự án khác dùng hết quota thì giá niêm yết
  là 0,10 USD/job/tháng. Trường hợp cả hai bị tính cũng chỉ khoảng 0,20 USD/tháng.
- Hai job tạo khoảng 9.360 lần gọi/tháng, thấp hơn rất xa mức miễn phí 2 triệu
  request Cloud Run/tháng; query rỗng cũng thấp hơn quota Firestore hằng ngày.
- Firestore miễn phí 1 GiB lưu trữ, 50.000 reads/ngày, 20.000 writes/ngày,
  20.000 deletes/ngày và 10 GiB outbound/tháng cho database đủ điều kiện.
- Artifact Registry hiện quan sát khoảng 214 MB cho `gcf-artifacts`, dưới mức
  miễn phí 0,5 GiB/billing account. Nhiều project dùng chung billing account có
  thể cộng dồn vượt mức này.
- TTL delete, backup/PITR và một số tính năng Firestore không có free quota. Khi
  có dữ liệu đến hạn xóa vẫn có thể phát sinh khoản rất nhỏ dù không ai đăng nhập.

Nguồn giá chính thức, phải kiểm tra lại khi đọc tài liệu này trong tương lai:

- <https://firebase.google.com/docs/firestore/pricing>
- <https://cloud.google.com/run/pricing>
- <https://cloud.google.com/scheduler/pricing>
- <https://cloud.google.com/artifact-registry/pricing>
- <https://developers.cloudflare.com/pages/functions/pricing/>
- <https://firebase.google.com/docs/auth>

### 10.2 Vài lớp, khoảng 100 học sinh

100 học sinh đăng nhập Google nằm rất xa free tier 50.000 MAU của Firebase Auth
with Identity Platform. Với 100 học sinh làm đồng thời một bài, tải Firestore và
Functions vẫn thấp hơn nhiều quota miễn phí hằng ngày/tháng.

Ước tính bảo thủ đã dùng trong roadmap:

| Mức dùng | Số bài nộp/năm | Ước tính tăng thêm |
|---|---:|---:|
| 100 HS, 1 bài/tuần, 40 tuần | 4.000 | thường gần 0 đến khoảng 20.000đ/năm |
| 100 HS, 3 bài/tuần, 40 tuần | 12.000 | khoảng 25.000–60.000đ/năm |

Khoảng trên là chi phí hạ tầng biên của riêng Conic Exam, không phải cam kết hóa
đơn. Biến số lớn nhất hiện tại là public release khoảng 0,8 MiB đang đi qua
Firestore/callable; 12.000 lượt có thể tạo khoảng 9,4 GiB egress/năm. Chuyển asset
SVG bất biến sang R2 và cache theo `contentHash` sẽ làm chi phí ổn định hơn.

Chi phí có thể cao hơn nếu:

- dùng chung billing account với nhiều dự án khác đã ăn hết free tier;
- upload rất nhiều release/ảnh/tệp lớn;
- bật backup/PITR hoặc min instances;
- log lỗi tăng bất thường, bot gọi API hoặc vòng lặp client;
- thay đổi scheduler chạy dày hơn hoặc query không có giới hạn.

Nên đặt Google Cloud Budget Alert ở 10.000đ, 50.000đ và 100.000đ/tháng. Budget
Alert chỉ cảnh báo, không tự khóa chi tiêu; khóa mềm phải thực hiện bằng quota
trong hệ thống và cảnh báo Super Admin.

## 11. Việc chưa hoàn thiện — backlog ưu tiên

### P0: trước khi dùng rộng hoặc thu phí

1. Đổi meter thương mại từ `attemptCount` lúc bắt đầu sang
   `finalSubmissionCount` tăng đúng một lần khi nộp thành công.
2. Chuyển release/SVG lớn khỏi Firestore sang R2, URL/ticket ngắn hạn và cache
   theo hash; Firestore chỉ giữ metadata/key.
3. Bổ sung unique student count theo giáo viên, tách khỏi membership count.
4. Hoàn thiện TTL roster, reverse link, counter và dọn hai chiều; đảm bảo dữ liệu
   học sinh không tồn tại quá 12 tháng.
5. App Check, rate limit theo UID/IP, cảnh báo bot và dashboard lỗi production.
6. Xuất Excel/CSV bảng điểm và thống kê tỷ lệ đúng từng câu/phổ điểm.
7. Import học sinh hàng loạt bằng CSV/email; link mời giới hạn domain hoặc danh
   sách email nếu trường yêu cầu. Hiện đã có Google login + QR/link/mã và hai chế
   độ auto/approval, nhưng chưa có roster email trước khi học sinh vào.
8. Cho giáo viên thêm giờ, mở lại bài, công bố thủ công điểm/lời giải đầy đủ và
   audit mọi thay đổi nhạy cảm.

### P1: trải nghiệm sản phẩm

- Kho đề học sinh có tìm kiếm, bộ lọc, yêu thích, đề sắp mở và lịch sử đầy đủ.
- Thống kê theo câu, theo lớp, tiến bộ học sinh, câu khó/dễ và xuất PDF.
- Bảng vàng/bảng vinh danh, mẫu giấy khen và in hàng loạt.
- Clone/archive lớp, import/export roster, thông báo trong app/email/web push.
- Ngân hàng câu hỏi, tag/chủ đề/mức độ, ma trận và trộn đề từ nhiều nguồn.
- Kiểm thử hồi quy riêng cho `heva`, `hoac`, bảng biến thiên, CeTZ, ảnh, font và
  package `@preview` khác Sang-Math.
- Tối ưu bundle lớn bằng code splitting; hiện Typst WASM/compiler chỉ cần ở phía
  giáo viên nhưng bundle JS chính vẫn lớn.

### P2: quy mô trường

- Tổ/trường, đồng quản trị, đồng tác giả, ngân hàng dùng chung.
- White-label, tên miền riêng, thanh toán, hóa đơn, API/SSO.
- Phân tích độ khó/độ phân biệt/reliability và chế độ giám sát nâng cao.

## 12. Các quyết định không được đảo ngược tùy tiện

- Final-submit-only: draft nằm local, không ghi mỗi câu lên cloud.
- Server-side grading: answer key không bao giờ xuống client trước khi chính sách
  cho phép công bố.
- Stable IDs: trộn câu/đáp án phải chấm theo ID, không theo vị trí hiển thị.
- Release immutable: sửa tạo revision mới, không thay nội dung release đang thi.
- Complex graphics = SVG vector, không raster hóa toàn đề.
- Multi-tenant + callable authorization; không tin dữ liệu `teacherUid` do client
  tự gửi nếu server chưa đối chiếu owner.
- Xóa tenant phải idempotent, có thời gian chờ/audit và dọn cả object lẫn metadata.

## 13. Gợi ý cho lần phát triển tiếp theo

Khi chưa có ý tưởng mới, không nên thêm tính năng ngẫu nhiên. Thứ tự hợp lý nhất:

1. Mở Billing/Usage và đo một kỳ thi thật 100 học sinh.
2. Hoàn thiện final-submission meter + unique student count.
3. Xuất Excel và thống kê từng câu vì đây là giá trị giáo viên thấy ngay.
4. Chuyển release asset sang R2 để khóa chi phí trước khi tăng người dùng.
5. Sau đó mới làm bảng vàng/giấy khen và kho đề học sinh.

Mỗi đợt phát triển phải cập nhật lại file này: ngày, tính năng, test, deploy,
chi phí quan sát thật và backlog đã thay đổi.
