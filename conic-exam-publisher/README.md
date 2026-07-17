# Conic Exam Publisher

Publisher biên dịch đề Typst Sang-Math thành gói phát hành an toàn cho Conic Exam.
Nó không đọc câu hỏi bằng regex. Chính Typst thực thi import, biến, vòng lặp và
macro; publisher chỉ thu kết quả đã đánh giá qua collector functions.

## Năng lực hiện tại

- Nhận module cũ export `make-questions(tn:, ds:, tln:, tl:, exam-part:)`.
- Nhận source TypstConicHub có đúng một cặp marker
  `CONICTYPST:QUESTIONS:START/END`.
- Dùng Typst 0.14.2 `query` để lấy ID, loại, key và metadata.
- Dùng Typst `compile` để render mỗi câu thành một SVG có chiều cao tự động.
- Candidate SVG dùng `mode: "dethi"`; review SVG riêng dùng `mode: "loigiai"`.
- Nén từng candidate SVG bằng gzip level 9, nhúng base64 trực tiếp vào public
  item và xác minh lại SHA-256/byte bằng backend; player không cần resolver asset.
- Tách `publicItems` khỏi `answerKey`; `sourceId` từng câu chỉ ở private key.
- Chấm chuẩn 12 TN × 0,25 + 4 Đ/S theo thang
  `0–0,1–0,25–0,5–1` + 6 TLN × 0,5 = 10 điểm.
- Tính SHA-256 cho nguồn và mọi SVG, rồi xác minh đầu ra bằng chính
  `conictypst-platform/functions/lib/examValidation.js`.
- Có strict mode cho phát hành thật và non-strict mode để di trú đề cũ.

## Chạy nhanh

Yêu cầu Node.js 22 và Typst CLI 0.14.2 trong `PATH`.

```bash
cd /Users/admin/conictypst/conic-exam-publisher

node bin/conic-exam-publish.mjs \
  ../typst/dethi/de-01.typ \
  --root .. \
  --renderer typst/sang-exam.typ \
  --non-strict \
  --title "Đề mẫu 12-4-6" \
  --out ./.sample-build
```

Mặc định publisher chỉ render đề thi. Thêm `--review` khi thật sự cần xuất cả
SVG lời giải riêng; dữ liệu lời giải lớn và tuyệt đối không được gửi cho học sinh.

Hoặc:

```bash
npm run publish:sample
```

Xem toàn bộ tùy chọn:

```bash
node bin/conic-exam-publish.mjs --help
```

## Quy ước nguồn để publish strict

Mỗi câu cần ID ổn định. TLN cần thêm đáp án máy đọc được:

```typst
#tn(
  [Nội dung],
  ([$A$], True([$B$]), [$C$], [$D$]),
  id: "12GT-TN-001",
)

#tln(
  [Nội dung],
  [$0,25$],
  id: "12GT-TLN-001",
  answer-value: "0,25",
  accepted-answers: ("0,25", "0.25"),
  tolerance: 0,
)
```

Các field mới nằm trong `..args`, vì vậy Sang-Math cũ vẫn render PDF bình thường.

Strict mode chặn:

- ID thiếu hoặc trùng.
- TN không có đúng một phương án đúng.
- Đ/S không có đúng bốn phát biểu.
- TLN thiếu `answer-value`/`accepted-answers` hoặc chứa số không hữu hạn.
- Profile 12–4–6 không đúng cơ cấu hoặc không đủ 10 điểm.
- SVG có script, `foreignObject` hoặc tài nguyên mạng.

`--non-strict` chỉ nới hai điểm phục vụ di trú: sinh ID theo vị trí và suy ra
TLN đơn giản từ nội dung hiển thị. Mọi trường hợp đều ghi warning; không nên dùng
ID sinh tự động để phân tích dài hạn vì đổi thứ tự câu sẽ đổi quan hệ nguồn.

Đề khác 12–4–6 dùng:

```bash
--profile custom
```

## Đầu ra

```text
build/
├── conic-exam-package.json       # Build artifact đầy đủ, có publicItems nén
│                                 # và answerKey; review asset chỉ có khi bật
├── backend-public-package.json   # Public package tự chứa đã qua validator
├── backend-private-package.json  # Key nhỏ đã qua normalizePackage
├── public-package.json           # Public package + hash phát hành
├── private-package.json          # Private key + review asset nếu có
├── diagnostics.json
└── assets/
    ├── questions/001.svg ...
    └── solutions/001.svg ...     # Chỉ sinh với --review
```

Contract nguồn gửi vào backend:

```json
{
  "schemaVersion": "conic-exam-package/v1",
  "title": "...",
  "sourceId": "...",
  "sourceHash": "...",
  "version": "1",
  "publicItems": [],
  "answerKey": []
}
```

Public item dùng release-local ID, không dùng bank/source ID:

```json
{
  "id": "tn-001-4a3d81464639",
  "type": "tn",
  "position": 1,
  "points": 0.25,
  "questionSvg": {
    "encoding": "gzip-base64",
    "data": "H4sIAAAAA...",
    "sha256": "...64 hex...",
    "bytes": 173421
  },
  "stemText": "...",
  "options": [
    { "id": "o1", "label": "A" },
    { "id": "o2", "label": "B" }
  ]
}
```

Private key chứa mapping thật:

```json
{
  "id": "tn-001-4a3d81464639",
  "sourceId": "12GT-TN-001",
  "type": "tn",
  "points": 0.25,
  "answer": "o2",
  "optionOrder": ["o1", "o2"]
}
```

Khi bật `--review`, `solutionAsset` trong key chỉ là con trỏ tới thư mục
`assets/solutions` của build riêng cho giáo viên. Backend thi hiện không nhận
kho asset top-level này; vì vậy không upload artifact `--review` qua cổng web.

`questionSvg.data` là gzip-base64 tự chứa. Player giải mã base64, gunzip rồi đưa
SVG đã kiểm tra vào vùng hiển thị; không cần tải asset thứ hai. Backend tự giải
nén với giới hạn 2 MiB/SVG và 32 MiB/gói, kiểm tra byte, SHA-256 và nội dung SVG an toàn. Toàn
public package phải nhỏ hơn 900 KiB. Không được gửi `conic-exam-package.json`,
`backend-private-package.json` hoặc `private-package.json` cho học sinh.

## Kết quả chạy thật trên de-01.typ

Ngày 2026-07-16, Typst 0.14.2:

| Chỉ số | Kết quả |
|---|---:|
| Câu | 22 = 12 TN + 4 Đ/S + 6 TLN |
| Điểm tối đa | 10 |
| Candidate SVG thô | 3.836.465 byte |
| Candidate gzip | 584.033 byte |
| Candidate gzip-base64 | 778.732 ký tự |
| Combined JSON, mặc định không review | 808.402 byte |
| Backend public JSON, compact | 794.920 byte |
| Top-level public asset | 0 |
| Backend validator | Pass |

Đề hiện tại chưa có ID và `answer-value`, nên strict mode từ chối đúng tại câu 1.
Non-strict mode publish thành công với 22 cảnh báo ID và 6 cảnh báo TLN.

## Hub adapter

Hub source được sao chép vào sandbox tạm theo đúng đường dẫn tương đối. Publisher
chỉ thay vùng marker bằng một factory build-only, vì vậy import, biến, helper và
ảnh tương đối vẫn giữ nguyên ngữ nghĩa. Project Hub bị giới hạn 5.000 tệp,
100 MiB và không nhận symlink.

Nguồn có marker thiếu, trùng, đảo thứ tự hoặc marker không nằm riêng dòng bị từ
chối. Source không có marker phải export `make-questions`; publisher không có
regex fallback.

## Giới hạn MVP

- Candidate hiện là whole-question SVG. Nội dung phương án/phát biểu nằm trong
  SVG; các nút A/B/C/D hoặc Đ/S được player dựng ngoài SVG bằng local IDs.
- Player cần hỗ trợ giải nén object `gzip-base64`. Public package 12–4–6 mẫu
  hiện khoảng 794 KiB, vì vậy không nên lưu lặp lại nhiều bản trong Firestore;
  production nên lưu một object phát hành và tham chiếu bằng release ID/hash.
- Review/solution SVG có thể rất lớn (đề mẫu khoảng 10,7 MiB thô), nên mặc định
  không render. Bật `--review` chỉ cho luồng giáo viên/private storage.
- Chưa xáo phương án/phát biểu. `optionOrder` và `statementOrder` đang là thứ tự
  hiển thị gốc; bước variant compiler sẽ mở rộng từ chính collector state.
- `sourceHash` hiện là hash của entry source. Asset hash/build hash vẫn phát hiện
  thay đổi thực tế do import/font/renderer; production build job nên bổ sung
  project-tree hash và khóa package/font/compiler version.
- Publisher là compiler tool, chưa phải sandbox dịch vụ. Production phải chạy
  trong container không network, root riêng, package/font allowlist, CPU/RAM/time
  limit và quota output.

## Test

```bash
npm test
```

Test dùng Typst thật cho cả legacy factory và Hub marker, rồi bắt buộc package
đi qua backend `normalizePackage`.
