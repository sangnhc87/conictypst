# Sang DOCX Quiz Presenter

Ứng dụng giúp giáo viên thả PDF, Word hoặc ảnh đề Toán, giữ đủ câu/phương án/công thức, kiểm tra lại và xuất bài trình chiếu HTML cao cấp chạy offline. Hệ thống ưu tiên đọc cục bộ để giảm chi phí; Mistral, Mathpix và Groq chỉ chạy qua Cloudflare Pages Functions khi cần.

## Chạy dự án

Yêu cầu Node.js 20 trở lên.

```bash
npm install
npm run dev
npm run test
npm run test:e2e
npm run build
npm run preview
```

Để thử API cục bộ, sao chép `.dev.vars.example` thành `.dev.vars`, điền secret rồi chạy bằng Wrangler Pages Dev. Không dùng biến `VITE_*` cho khóa API vì các biến đó bị đóng gói vào trình duyệt.

Mở địa chỉ Vite hiển thị trong terminal, sau đó bấm **Mở bài demo** để thử đủ bốn dạng câu. Thư mục `dist/` sau build có thể đưa thẳng lên GitHub Pages hoặc Cloudflare Pages (build command `npm run build`, output `dist`). Vì cấu hình `base: './'`, cũng có thể phục vụ `dist` bằng bất kỳ web server tĩnh nào.

Bản Cloudflare Pages hiện hành: <https://trinhchieu.pages.dev>. Có thể kiểm thử trực tiếp deployment bằng `E2E_BASE_URL=https://trinhchieu.pages.dev npm run test:e2e`.

## Trung tâm quản trị riêng

Trang quản trị nằm ở `/admin.html` (production: `https://trinhchieu.pages.dev/admin.html`) và chỉ cho phép hai tài khoản `nguyensangnhc@gmail.com`, `sangbeau@gmail.com`. Trang này đọc danh sách Firebase Auth, hồ sơ Firestore, gói thuê bao và đơn PayOS qua `/api/admin-overview`; dữ liệu PII không được đưa vào bundle công khai. Mỗi lần đăng nhập production cũng được ghi nhận qua `/api/user-heartbeat` để bảng hoạt động có đủ người dùng kể cả khi họ chưa chạy AI.

Service account của Cloudflare Pages cần quyền đọc Firestore và quyền Firebase Auth tương ứng với `firebaseauth.users.get`; nếu thiếu quyền Auth, dashboard vẫn hiển thị hồ sơ Firestore nhưng sẽ báo rõ rằng tổng tài khoản chưa bao quát toàn bộ người chỉ mới đăng nhập.

Thời gian dùng thử của riêng Trình Chiếu được tính từ lần đầu tài khoản vào ứng dụng (hoặc lúc chọn môn lần đầu), không lấy ngày tạo tài khoản Firebase dùng chung với sản phẩm khác. Hạn dùng vẫn là 7 ngày hoặc 10 lượt AI/OCR, điều kiện nào đến trước.

## Thanh toán PayOS và cấp quyền

Luồng thanh toán chỉ nhận tài khoản Gmail đã đăng nhập. Giá và thời hạn gói được khóa ở `functions/api/paymentPlans.js`; giá gửi từ trình duyệt bị bỏ qua. Đơn hàng được ghi vào Firestore trước khi tạo link PayOS, webhook xác thực chữ ký, kiểm tra đúng số tiền, rồi cấp quyền vào tài liệu `users/{uid}` theo cách chống xử lý trùng.

Cloudflare Pages cần cấu hình các biến trong `.dev.vars.example`: `PAYOS_CLIENT_ID`, `PAYOS_API_KEY`, `PAYOS_CHECKSUM_KEY`, `FIREBASE_PROJECT_ID`, `FIREBASE_WEB_API_KEY`, `FIREBASE_SERVICE_ACCOUNT_JSON` và `PUBLIC_APP_ORIGIN`. Service account chỉ đặt trong Secrets, không đưa vào mã nguồn. PayOS webhook phải trỏ đến `/api/payos-webhook`; sau khi người dùng quay về, `/api/payos-status` kiểm tra đúng đơn hàng của Gmail đang đăng nhập.

Hạn dùng thật nằm trong `billingSubscriptions/{uid}`, tách khỏi hồ sơ giáo viên. Khi áp dụng Firestore Rules cho project `stexgv`, cho phép người dùng đọc đúng tài liệu của mình nhưng không cho client `create/update/delete`; chỉ webhook server được ghi tài liệu này. `paymentOrders` cũng nên cấm client đọc/ghi trực tiếp.

Nếu các khóa PayOS từng xuất hiện trong mã nguồn hoặc lịch sử Git, hãy thu hồi và tạo lại chúng trong PayOS trước khi mở bán thật. Mã nguồn không còn fallback khóa thanh toán.

## Cách dùng

1. Thả PDF, DOCX, DOC hoặc ảnh; chọn chế độ xử lý rồi bấm **Tạo bài trình chiếu**.
2. Kiểm tra thống kê và bảng cảnh báo; chọn từng câu ở cột trái.
3. Sửa loại câu, nội dung, LaTeX, đáp án và hình trong cột giữa; xem kết quả tức thời ở cột phải.
4. Bấm **Trình chiếu**, hoặc xuất HTML một file/ZIP offline/JSON để sửa lại sau.

## Profile môn học và câu hỏi chùm

Trước khi nhập tệp, chọn đúng **Môn và cấu trúc đề** cùng **Khối**. Hệ thống hiện có các profile độc lập cho Toán, Tiếng Anh, Sinh học, Lịch sử, Địa lý, GDCD/GDKT&PL, Vật lý, Hóa học, Tiểu học liên môn và Ngữ văn. Tiếng Anh lớp 10 và lớp 12 là hai profile riêng vì cấu trúc đề và prompt hậu xử lý khác nhau.

Mỗi profile định nghĩa riêng phần thi, kỹ năng/chuyên đề, loại câu khuyên dùng, công cụ soạn thảo và quy tắc AI. Profile Toán cũ vẫn là mặc định tương thích và giữ đường đọc DOCX local đã ổn định. Các profile chuyên môn khác dùng AI hậu xử lý để nhận đúng tư liệu, phần thi và chùm câu.

Một **câu hỏi chùm** gồm đoạn dẫn/tư liệu/bảng/hình/giả thiết chung và nhiều câu hỏi con độc lập. Trong trình soạn thảo:

1. Chọn **Tạo chùm** hoặc liên kết câu với một chùm đã có.
2. Sửa tiêu đề, chỉ dẫn và dữ kiện chung một lần.
3. Chuyển sang từng câu để sửa yêu cầu và đáp án riêng.
4. Trình chiếu và các bản xuất HTML, Word, Typst, LaTeX sẽ giữ dữ kiện chung.

Registry giao diện nằm tại `src/config/subjectProfiles.ts`; prompt máy chủ nằm tại `functions/api/subjectProfiles.js`; dữ liệu mẫu hồi quy nằm tại `src/demo/profileSamples.ts`. Cache OCR có khóa theo profile, khối và phiên bản prompt để không dùng nhầm kết quả giữa các môn.

Bốn chế độ chi phí:

- **Tự động**: DOCX và PDF có lớp chữ đọc cục bộ; bản quét mới dùng Mistral.
- **Tiết kiệm**: giống tự động nhưng luôn ưu tiên nguồn rẻ nhất.
- **Cân bằng**: dùng Mistral OCR cho PDF/ảnh, sau đó Groq chuẩn hóa.
- **Công thức khó**: dùng Mathpix Files API cho đề STEM phức tạp; kết quả được tải về rồi yêu cầu xóa bản tạm trên Mathpix.

DOCX nên dùng style đoạn văn thông thường, mỗi câu/lựa chọn/đáp án trên một đoạn riêng. Bốn cấu trúc mặc định:

```text
Câu 1. ...       Câu 2. ...       Câu 3. ...       Câu 4. ...
A. ...           a) ...           Đáp án: 12       Lời giải: ...
B. ...           b) ...
Đáp án: B        Đáp án: Đ S ...
```

Các biến thể `Bài 1:`, `Câu 01)`, `Đáp số`, `Giải`, `Hướng dẫn giải` cũng được nhận dạng. Sửa quy tắc tại `src/config/questionPatterns.ts`; logic phân đoạn nằm ở `src/features/question-parser/parser.ts`.

## Kiến trúc và công nghệ

- Vite, React, TypeScript; giao diện tiếng Việt responsive.
- Worker riêng cho chuyển đổi DOCX, giúp giao diện không bị khóa.
- `pandoc-wasm` được đóng gói như engine ưu tiên dài hạn. Bản hiện tại dùng Mammoth trong Worker làm engine tương thích thực tế vì Pandoc WASM khoảng 58 MB không khởi tạo ổn định trên mọi static host/browser. Việc kiểm tra cấu trúc và phục hồi media không phụ thuộc Mammoth.
- JSZip + DOMParser đọc `word/document.xml`, relationship, media và embeddings; DOMPurify loại script/object/handler nguy hiểm.
- Bộ chuyển OMML đệ quy giữ phân số, căn, chỉ số, tích phân/tổng, giới hạn, ngoặc, ma trận, hệ phương trình và dấu nhấn.
- `emf-converter` chuyển preview WMF/EMF sang PNG bằng Canvas, hoàn toàn trên thiết bị.
- KaTeX hiển thị LaTeX; dữ liệu giữ trạng thái `native-math`, `omml-converted`, `mathtype-preview`, `manual-latex`, `unsupported`.
- PDF.js kiểm tra lớp chữ trước khi quyết định gọi OCR. Mistral OCR là tuyến mặc định giá thấp; Mathpix là tuyến chuyên công thức; Groq dùng strict JSON Schema để giữ cấu trúc TN, Đ/S, TLN và tự luận.
- Tài liệu dài được chia theo ranh giới trang trước khi gọi Groq, sau đó ghép lại theo số câu để tránh vượt cửa sổ ngữ cảnh.
- FileSaver + JSZip xuất HTML, JSON và ZIP offline.
- Vitest kiểm thử parser, chuẩn hóa/chấm đáp án, chuyển đổi AI, đủ phương án và HTML offline.

Mã chia theo `models`, `config`, `features`, `workers`, `components`, `demo`, `utils`, `tests`; dữ liệu độc lập hoàn toàn với UI.

## MathType, OMML và hình ảnh

Ứng dụng phát hiện OMML trong `word/document.xml`, phát hiện OLE trong `word/embeddings`, lần theo `document.xml.rels` đến đúng preview PNG/JPEG/GIF/SVG/WebP/WMF/EMF và gắn nó vào câu chứa run tương ứng. WMF/EMF được chuyển sang PNG bằng Canvas. Binary MTEF bên trong OLE không có đặc tả/decoder web nguồn mở đủ tin cậy nên ứng dụng ưu tiên preview; chỉ tạo placeholder nếu OLE thực sự không có preview dùng được. Placeholder cho phép nhập LaTeX hoặc xóa trong trình biên tập. Để đạt kết quả tốt nhất, trong Word hãy chọn công thức MathType và chuyển sang Word Equation/OMML, hoặc xuất công thức thành PNG/SVG.

Ảnh được đưa thành data URL và ánh xạ từ `r:embed`/`r:id` tới đúng đoạn và câu gần nhất. Trình biên tập hỗ trợ thêm, xóa, đổi độ rộng/căn lề và kéo thẻ ảnh sang câu khác.

## Quyền riêng tư và bảo mật

- DOCX và PDF có lớp chữ ở chế độ tự động/tiết kiệm được đọc ngay trên máy. Khi giao diện báo Mistral hoặc Mathpix, tệp được gửi tới nhà cung cấp OCR; văn bản OCR tiếp tục được gửi tới Groq để phân loại cấu trúc.
- Secret chỉ tồn tại trong Pages Functions (`MISTRAL_API_KEY`, `MATHPIX_APP_ID`, `MATHPIX_APP_KEY`, `GROQ_API_KEY`), không có trong bundle, HTML xuất hay JSON.
- Không chạy macro hay nội dung nhúng. HTML DOCX được sanitize và không tự tải URL ngoài.
- Giới hạn DOCX cục bộ là 80 MB và OCR đám mây là 25 MB. Giới hạn 120 trang mỗi lần giúp tránh phát sinh chi phí bất ngờ.
- Chế độ lưu nháp local mặc định không được bật; xuất JSON là cách lưu dữ liệu chủ động.

## Xuất và giới hạn

HTML một file và ZIP đều nhúng ảnh, CSS và JavaScript, mở offline không cần Pandoc/CDN. Công thức được KaTeX kết xuất sẵn thành MathML để giữ chất lượng mà không kéo font/runtime ngoài. Phím mũi tên/Space chuyển câu, `A` hiện đáp án, `S` hiện lời giải, `F` toàn màn hình; bản in tự hiện lời giải và tách trang.

Parser ưu tiên độ ổn định, dựa trên các đoạn do bộ chuyển đổi DOCX tạo ra chứ không regex toàn HTML. Numbering phức tạp, textbox/floating shape, bảng lồng nhau và các phần mở rộng OMML hiếm vẫn có thể cần chỉnh thủ công. Giới hạn không thể loại bỏ hoàn toàn là giải mã trực tiếp binary MTEF độc quyền khi một MathType OLE không chứa bất kỳ preview nào; trường hợp đó luôn có placeholder và cảnh báo rõ ràng.

## Tùy biến giao diện

- Tên ứng dụng và logo chữ: `src/App.tsx` (khối `.brand`).
- Màu chủ đạo: thay `#167d8d` và các màu liên quan trong `src/styles.css`.
- Regex nhận dạng: `src/config/questionPatterns.ts`.
- Mẫu slide xuất: hàm `htmlFor` trong `src/features/export/exporters.ts`.
- Bài demo: `src/demo/demoData.ts`.

## Giấy phép thư viện

Vite, React, TypeScript, JSZip, DOMPurify, KaTeX, Mammoth, Reveal.js, FileSaver, Vitest và pandoc-wasm đều là phần mềm nguồn mở. Khi phân phối lại, xem tệp license của từng package trong `node_modules`; Pandoc và wrapper WASM cần được rà soát điều khoản GPL/LGPL tương ứng cho phương thức phân phối của đơn vị.
