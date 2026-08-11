# Quy trình ngân hàng câu hỏi Toán THPT

## Mục tiêu

PDF là nguồn đề. `bank.json` là catalogue phân loại và ID ổn định. Nội dung câu hỏi được lưu ở một payload riêng, không ghi đè catalogue.

```text
PDF → đọc/OCR → tách câu → giải → gắn bank ID → rà soát → lưu JSON → xuất Typst 1.0.4
```

Một câu chỉ được đưa vào trạng thái `ready` sau khi đã kiểm tra đáp án và lời giải. Câu chưa chắc chắn giữ `status: "review"` để không làm sai đề về sau.

## Ba lớp dữ liệu

1. `bank.json`: ID và nhãn phân loại. Đây là dữ liệu gốc, chỉ đọc trong quy trình nhập.
2. Payload nội dung: schema `conictypst.question-bank/v1`, có `records` theo key là bank ID.
3. File Typst sinh ra: đề in dùng `@preview/sang-math:1.0.4`; registry dùng để truy vấn câu theo ID trong `typst/questions.typ`.

Ví dụ một bản ghi:

```json
{
  "schemaVersion": "conictypst.question-bank/v1",
  "sangMath": "1.0.4",
  "catalog": "bank.json",
  "records": {
    "0D1N1-1": {
      "id": "0D1N1-1",
      "type": "tn",
      "status": "review",
      "difficulty": "nhan-biet",
      "tags": ["lop10", "menh-de"],
      "stem": "Phát biểu nào sau đây là một mệnh đề?",
      "options": ["...", "...", "...", "..."],
      "correctAnswers": [2],
      "solution": "Giải thích ngắn gọn, có đủ bước.",
      "source": "de-giua-ky-1.pdf",
      "sourcePage": "trang 2, câu 1",
      "confidence": "cao",
      "answerVerified": false,
      "solutionVerified": false
    }
  }
}
```

Các loại câu hiện có: `tn`, `ds`, `tln`, `tl`. Với `tn`, đáp án là chỉ số 1-based; với `ds`, mỗi phần tử trong `statements` có `text` và `correct`; với `tln`, dùng `shortAnswer`.

## Khi đưa một PDF vào

Quy trình xử lý chuẩn cho từng PDF:

1. Đọc lớp chữ trước. Nếu là PDF scan, OCR từng trang và đánh dấu trang/câu có công thức hoặc hình cần xem lại.
2. Tách đúng các phần: câu hỏi, phương án, phát biểu đúng/sai, đáp án ngắn, hình và lời giải nếu PDF có sẵn.
3. Giải lại độc lập; không coi đáp án đọc được từ PDF là chân lý. Đối chiếu đáp án với phép giải.
4. Gắn câu vào một ID có sẵn trong `bank.json`. Nếu chưa xác định được dạng/chương/bài, giữ `review` và ghi lý do; không tự ý tạo ID mới.
5. Lưu nguồn PDF, trang, độ tin cậy và cảnh báo. Câu có hình hoặc OCR sai không được tự động chuyển `ready`.
6. Kiểm tra schema, kiểm tra ID tồn tại, rồi mới nhập vào app hoặc xuất file Typst.

Trong cuộc trò chuyện, khi bạn gửi PDF, tôi sẽ trả về bản nhập theo đúng payload này và nêu riêng các câu cần bạn xác nhận. Không cần đưa PDF lên Cloud Run; việc đọc PDF có lớp chữ có thể thực hiện cục bộ.

## Lệnh kiểm tra và xuất

Các lệnh này không sửa `bank.json`:

```bash
node scripts/question-bank.mjs validate --file bank-content.json
node scripts/question-bank.mjs export-typst \
  --file bank-content.json \
  --out bank-sang-math-1.0.4.typ
node scripts/question-bank.mjs export-registry \
  --file bank-content.json \
  --out typst/questions/imported-bank.typ
```

`export-typst` tạo một đề/phiếu có các macro `#tn`, `#ds`, `#tln`, `#tl` và import `sang-math:1.0.4`. `export-registry` tạo biến `imported-question-bank` để ghép vào registry đang dùng trong `typst/questions.typ`, sau đó có thể lấy câu theo ID bằng `qb-get`/`qb-pick`.

Trong app, nút `Xuất JSON` tạo payload chuẩn; `Nhập JSON` vẫn nhận cả file cũ; `Xuất Typst 1.0.4` ưu tiên các câu trong giỏ đề, nếu giỏ rỗng thì xuất toàn bộ câu không lưu kho.

