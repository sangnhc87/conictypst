# Hệ thống template Typst cho sách, SGK, chuyên đề và bộ đề

Tài liệu này mô tả toàn bộ khung biên soạn đã được dựng sẵn trong workspace để sau này bạn chỉ cần thay nội dung học thuật vào đúng vị trí.

## 1. Các file nên dùng làm điểm bắt đầu

- `typst/book.typ`: mẫu sách/chuyên đề cơ bản, gọn, phù hợp khi cần một tài liệu ngắn.
- `typst/sgk.typ`: mẫu SGK đầy đủ mạch dạy học: mục tiêu, khởi động, khám phá, luyện tập, vận dụng, tóm tắt, phụ lục.
- `typst/chuyende.typ`: mẫu chuyên đề dài, chia phần, chương, dạng toán, ví dụ, bài tập, phụ lục.
- `typst/bo-de.typ`: mẫu bộ đề thi nhiều đề trong một tài liệu, có khung ma trận, đặc tả và hướng dẫn chấm.
- `typst/exams/de-01.typ`: mẫu đề thi đơn lẻ chi tiết theo cú pháp `tn/ds/tln/tl`.
- `typst/template.typ`: cổng import chung. Nếu muốn hệ thống đồng bộ nhất thì nên import từ file này.

## 2. Lệnh biên dịch chuẩn

Do toàn bộ tài liệu trong thư mục `typst/` dùng import tương đối, nên hãy biên dịch theo đúng mẫu này:

```bash
typst compile --root typst typst/<ten-file>.typ <duong-dan-pdf>
```

Ví dụ:

```bash
typst compile --root typst typst/sgk.typ /tmp/sgk.pdf
typst compile --root typst typst/chuyende.typ /tmp/chuyende.pdf
typst compile --root typst typst/bo-de.typ /tmp/bo-de.pdf
```

## 3. Cách bắt đầu nhanh nhất

Nếu viết SGK:

```typst
#import "template.typ": *

#show: stexgv-doc.with(
  doc-type: "sgk",
  title: "TÊN SÁCH",
  subtitle: "Phụ đề nếu có",
  author: "Tên tác giả",
  institution: "Đơn vị",
  subject: "Toán",
  grade: "Lớp 10",
  series: "Tên bộ tài liệu",
  academic-year: "2025-2026",
)

#chapter([Tên chương])
#bai([Tên bài])
#muctieu[
  - Mục tiêu 1.
  - Mục tiêu 2.
]
#khoidong[
  Nội dung mở bài.
]
#khampha[
  Nội dung hình thành kiến thức.
]
#vd(
  [Ví dụ minh hoạ.],
  loigiai: [Lời giải mẫu.],
)
#bt(
  [Bài tập luyện tập.],
  lines: 3,
)
```

Nếu viết chuyên đề:

```typst
#import "template.typ": *

#show: stexgv-doc.with(
  doc-type: "chuyende",
  title: "CHUYÊN ĐỀ ...",
  author: "Tên tác giả",
)

#part([Phần lớn])
#chapter([Tên chương])
#dang([Tên dạng toán])
#phuongphap[
  Khung phương pháp giải.
]
#vd(
  [Ví dụ mẫu.],
  loigiai: [Lời giải.],
)
#bt(
  [Bài tập tự luyện.],
  lines: 4,
)
```

Nếu viết bộ đề:

```typst
#import "template.typ": *

#show: stexgv-doc.with(
  doc-type: "bo-de",
  title: "BỘ ĐỀ ...",
  author: "Tên tác giả",
)

#let (tn, ds, tln, tl) = exam-mode()

#de(
  title: [Đề số 1],
  code: "101",
  show-answer-key: true,
)[
  #exam-part([PHẦN I. Trắc nghiệm])
  #tn(
    [Nội dung câu hỏi],
    ([$A$], True([$B$]), [$C$], [$D$]),
    loigiai: [Lời giải.],
  )
]
```

## 4. Router chung `stexgv-doc`

Hàm `stexgv-doc` nằm trong `typst/template.typ` là router điều phối chính.

Các giá trị `doc-type` hiện hỗ trợ:

- `"book"`: tài liệu sách/chuyên đề cơ bản.
- `"outline"`: đề cương hoặc tài liệu tóm tắt, vẫn dùng khung sách.
- `"sgk"`: sách giáo khoa, dùng cùng khung sách nhưng nhãn bìa là SGK.
- `"chuyende"`: chuyên đề học tập dài.
- `"exam"`: đề thi đơn lẻ.
- `"bo-de"` hoặc `"exam-set"`: bộ đề thi nhiều đề.
- `"research"`: khung bài nghiên cứu.

Các tham số dùng chung quan trọng:

- `title`: tiêu đề chính.
- `subtitle`: phụ đề.
- `author`: tác giả hoặc người biên soạn.
- `theme-color`: màu chủ đạo.
- `institution`: đơn vị, tổ bộ môn, trường.
- `subject`: môn học.
- `grade`: khối/lớp.
- `series`: tên bộ tài liệu.
- `academic-year`: năm học.
- `publisher`: đơn vị phát hành.
- `cover-note`: ghi chú bìa.
- `show-cover`: bật/tắt trang bìa.
- `show-outline`: bật/tắt mục lục.
- `outline-depth`: độ sâu mục lục.

## 5. Hệ thống sách, SGK, chuyên đề

### 5.1. Các macro mở đầu tài liệu

Các khối này phù hợp cho phần đầu sách:

- `#loinoidau[...]`
- `#gioithieu[...]`
- `#huongdansudung[...]`
- `#muctieuchung[...]`
- `#bangthuatngu[...]`
- `#tailieuthamkhao[...]`

Alias tiếng Anh đã có sẵn nếu cần:

- `#preface[...]`
- `#introduction[...]`
- `#glossary[...]`
- `#references[...]`

### 5.2. Khung cấu trúc lớn

Các khối cấu trúc đã có outline ẩn nên mục lục sẽ tự sinh:

- `#part([Tên phần])` hoặc `#unit([Tên phần])`
- `#chapter([Tên chương])`
- `#lesson([Tên bài])` hoặc `#bai([Tên bài])`
- `#topic([Tên dạng])` hoặc `#dang([Tên dạng])`
- `#section([Tên mục])` hoặc `#muc([Tên mục])`
- `#appendix([Tên phụ lục])` hoặc `#phuluc([Tên phụ lục])`
- `#appendix-section([Tên mục phụ lục])` hoặc `#mucphuluc([Tên mục phụ lục])`

### 5.3. Các khối nội dung được đánh số

Nhóm này phù hợp cho ví dụ, bài tập, câu hỏi, hoạt động:

- `#vd(...)` hoặc `#vidu(...)`
- `#bt(...)` hoặc `#baitap(...)`
- `#cauhoi(...)`
- `#hoatdongn(...)` hoặc `#hd(...)`
- `#onluyen(...)`

Mẫu chung:

```typst
#vd(
  [Nội dung ví dụ],
  loigiai: [Lời giải chi tiết],
)

#bt(
  [Nội dung bài tập],
  lines: 4,
)
```

Các tham số hữu ích:

- `loigiai`: lời giải mẫu.
- `lines`: số dòng trống để học sinh tự làm.
- `theme-color`: màu chủ đạo.
- `boxed`: có khung hay không.
- `fill`, `stroke`, `radius`: chỉnh kiểu hộp.
- `num`: ép số thủ công nếu cần.

### 5.4. Các hộp sư phạm / nhấn mạnh

Đã có sẵn nhiều preset để soạn SGK/chuyên đề:

- `#muctieu[...]`
- `#chuanbi[...]`
- `#khoidong[...]`
- `#khampha[...]`
- `#hoatdong[...]`
- `#luyentap[...]`
- `#vandung[...]`
- `#morang[...]`
- `#tomtat[...]`
- `#duan[...]`
- `#nhanxet[...]`
- `#ghinho[...]`
- `#phuongphap[...]`
- `#lythuyet[...]`
- `#luuy[...]`
- `#note[...]`
- `#dn[...]`
- `#dl[...]`
- `#tc[...]`
- `#bode[...]`
- `#definition[...]`

## 6. Điều khiển bộ đếm trong sách/chuyên đề

Các lệnh chuyên cho book module:

- `#setbookcounter("chapter", 3)`
- `#setbookcounter("lesson", 5)`
- `#setbookcounter("vd", 10)`
- `#resetbookcounter("bt")`

Các alias tiện dùng:

- `#setchuong(3)` / `#resetchuong()`
- `#setbai(4)` / `#resetbai()`
- `#setmuc(2)` / `#resetmuc()`
- `#setphuluc(2)` / `#resetphuluc()`
- `#setvd(6)` / `#resetvd()`
- `#setbt(8)` / `#resetbt()`

Lưu ý:

- Bộ đếm ví dụ, bài tập, câu hỏi, hoạt động sẽ tự reset khi sang bài/chương mới theo thiết kế mặc định.
- Nếu cần ghép nội dung từ nhiều nguồn, hãy dùng lệnh `set...` ở đúng chỗ trước khối cần đánh số.

## 7. Hệ thống bộ đề thi

### 7.1. Khung tổng cho bộ đề

File `typst/modules/exam-set.typ` cung cấp wrapper cho tài liệu chứa nhiều đề thi trong cùng một file.

Macro chính:

- `#show: stexgv-exam-set.with(...)`
- hoặc dùng router `#show: stexgv-doc.with(doc-type: "bo-de", ...)`

### 7.2. Từng đề con trong bộ đề

Mỗi đề dùng macro:

- `#de(...)[ ... ]`
- alias: `#dethi(...)[ ... ]`

Các tham số quan trọng của `#de(...)`:

- `title`: tên đề trên mục lục bộ đề.
- `exam-title`: tên hiện ngay trên đầu đề, nếu cần khác `title`.
- `department`, `school`: đầu đề thi.
- `subject`, `duration`, `code`.
- `footer-left`: nội dung chân trang bên trái.
- `reset-state`: mặc định là `true`, nghĩa là khi bắt đầu đề mới sẽ tự reset trạng thái.
- `question-start`: số câu bắt đầu nếu muốn không khởi động từ 1.
- `part-start`: số phần bắt đầu nếu muốn không khởi động từ I.
- `show-answer-key`: có in đáp án ngay sau đề hay không.
- `show-end`: có in dòng HẾT hay không.

### 7.3. Reset trạng thái đề thi

Macro mới đã có sẵn:

- `#resetexamstate()`

Tác dụng:

- Xoá dữ liệu đáp án đã gom cho MCQ/Đúng-Sai/Trả lời ngắn/Tự luận.
- Reset số phần.
- Reset số câu về đầu đề mới.

Macro này được `#de(...)` gọi tự động khi `reset-state: true`, nên khi soạn bộ đề thường không cần gọi tay.

### 7.4. Khối phụ cho bộ đề

Đã có thêm các khối:

- `#matran[...]`
- `#dacta[...]`
- `#huongdancham[...]`
- `#luuybode[...]`

Chúng phù hợp cho phần trước hoặc sau mỗi đề, hoặc cho toàn tuyển tập.

## 8. Hệ thống câu hỏi đề thi

Sau khi import `template.typ`, hãy tạo bộ macro theo mode đề thi:

```typst
#let (tn, ds, tln, tl) = exam-mode()
```

Ý nghĩa:

- `#tn(...)`: câu trắc nghiệm nhiều phương án.
- `#ds(...)`: câu đúng/sai.
- `#tln(...)`: câu trả lời ngắn.
- `#tl(...)`: câu tự luận.

### 8.1. Cú pháp `#tn(...)`

Ví dụ đúng:

```typst
#tn(
  [Hàm số có bao nhiêu cực trị?],
  ([$0$], [$1$], True([$2$]), [$3$]),
  loigiai: [Lời giải.],
)
```

Lưu ý:

- Đối số thứ hai phải là *một tuple các lựa chọn*.
- Phương án đúng có thể bọc bằng `True([...])`.
- Đây là cú pháp an toàn nhất khi biên soạn mới.

### 8.2. Cú pháp `#ds(...)`

Ví dụ:

```typst
#ds(
  [Xét các khẳng định sau.],
  (
    True([Khẳng định 1]),
    [Khẳng định 2],
    True([Khẳng định 3]),
    [Khẳng định 4],
  ),
  loigiai: [Phân tích từng ý.],
)
```

### 8.3. Cú pháp `#tln(...)`

Ví dụ:

```typst
#tln(
  [Giải phương trình $2x - 5 = 7$.],
  [$6$],
  loigiai: [Ta có $x = 6$.],
)
```

### 8.4. Cú pháp `#tl(...)`

Ví dụ:

```typst
#tl(
  [Trình bày lời giải của bài toán.],
  loigiai: [Lời giải mẫu.],
  lines: 5,
)
```

## 9. Điều khiển bộ đếm đề thi

Các lệnh đã có từ engine thi:

- `#setcounter("cau", 13)`
- `#resetcounter("cau")`
- `#setcounter("phan", 3)`
- `#resetcounter("phan")`
- `#setcau(13)` / `#resetcau()`
- `#setphan(3)` / `#resetphan()`

Lưu ý quan trọng:

- `exam-part(...)` hiện mặc định `reset-counter: false`, nghĩa là số câu chạy liên tục giữa các phần.
- Nếu muốn phần mới bắt đầu lại từ `Câu 1`, có thể dùng `#exam-part(..., reset-counter: true)` hoặc chèn `#resetcau()` trước đó.

## 10. Quy trình biên soạn khuyến nghị

Khi viết SGK:

- Copy `typst/sgk.typ` thành file mới.
- Đổi metadata ở phần `#show: stexgv-doc.with(...)`.
- Thêm/chỉnh `#chapter`, `#bai`, `#muctieu`, `#khoidong`, `#khampha`, `#luyentap`, `#vandung`, `#appendix`.

Khi viết chuyên đề:

- Copy `typst/chuyende.typ`.
- Chia phần bằng `#part`, chương bằng `#chapter`, dạng toán bằng `#dang`.
- Dùng `#phuongphap`, `#vd`, `#bt`, `#ghinho`, `#nhanxet` để chuẩn hoá phong cách.

Khi viết bộ đề:

- Copy `typst/bo-de.typ`.
- Mỗi đề thêm một `#de(...)` mới.
- Bên trong đề dùng `#exam-part`, `#tn`, `#ds`, `#tln`, `#tl`.
- Bật `show-answer-key: true` nếu muốn in đáp án ngay dưới đề đó.

## 11. Khi nào nên import trực tiếp module con

Thông thường nên import:

```typst
#import "template.typ": *
```

Chỉ nên import trực tiếp module con khi:

- Muốn file cực ngắn, chỉ dùng đúng một hệ con.
- Muốn tránh namespace lớn.
- Muốn can thiệp sâu vào đúng engine tương ứng.

Ví dụ:

- `typst/modules/book.typ`: dùng riêng cho sách/chuyên đề.
- `typst/modules/exam.typ`: dùng riêng cho đề thi đơn lẻ.
- `typst/modules/exam-set.typ`: dùng riêng cho tuyển tập nhiều đề.

## 12. Kết luận ngắn

Hiện tại workspace đã có đủ 4 lớp làm việc:

- Engine đề thi gốc.
- Module sách/chuyên đề/SGK.
- Module bộ đề thi nhiều đề.
- Router tổng và các file mẫu dùng thật.

Vì vậy sau này quy trình nhanh nhất là:

- Chọn `sgk.typ`, `chuyende.typ`, `bo-de.typ` hoặc `book.typ`.
- Đổi metadata ở đầu file.
- Ghi nội dung vào đúng các macro khung đã có sẵn.
- Biên dịch bằng lệnh `typst compile --root typst ...`.