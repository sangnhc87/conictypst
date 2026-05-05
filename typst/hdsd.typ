#import "template.typ": *

#let bank = load-bank()
#let dai-so = bank-filter(bank, branch: "Đại Số")
#let hinh-hoc = bank-filter(bank, branch: "Hình Học")
#let chapter-counts = bank-count(bank, by: "chapter")
#let lesson-counts = bank-count(bank, by: "lesson")

#show: stexgv-doc.with(
  doc-type: "outline",
  title: "HƯỚNG DẪN SỬ DỤNG HỆ THỐNG STEXGV",
  subtitle: "Thiết kế hierarchy, smart box và quản lý ngân hàng câu hỏi",
  author: "GitHub Copilot",
  institution: "ConicTypst Workspace",
  subject: "Typst",
  series: "Bộ khung vận hành tài liệu",
  academic-year: "2026",
  outline-depth: 5,
)

#loinoidau[
  Tài liệu này là bản hướng dẫn in PDF để đọc trực tiếp khi biên soạn sách, SGK, chuyên đề và bộ đề trong workspace hiện tại.

  Mục tiêu của bản này không chỉ là mô tả macro, mà còn chốt luôn cách tổ chức hệ thống sao cho sau này thêm bài mới, thêm chương mới hoặc mở rộng ngân hàng câu hỏi vẫn giữ được một cấu trúc ổn định.
]

#gioithieu[
  Hệ thống hiện tại đã được chia làm ba lớp rõ ràng:

  - Lớp soạn tài liệu dài: sách, SGK, chuyên đề, phụ lục.
  - Lớp đề thi: đề đơn, bộ đề, đáp án, reset trạng thái đề.
  - Lớp metadata ngân hàng câu hỏi: đọc dữ liệu từ `bank.json`, lọc, đếm, tra cứu và chuẩn bị để nối với nội dung câu hỏi thật.
]

#chapter([Thiết kế hierarchy từ chương đến cấp nhỏ nhất])

#muctieu[
  - Giữ mục lục sạch và đúng cấp.
  - Cho phép tài liệu vừa đẹp ở cấp lớn, vừa gọn ở cấp nhỏ.
  - Không phá API cũ như `#chapter`, `#bai`, `#dang`, `#muc`.
]

#section([Các tầng đã có sẵn])

#smartbox(kind: "summary")[
  Hiện tại bạn có thể dùng theo trục sau:

  - `#part` hoặc `#unit` cho phần lớn.
  - `#chapter` cho chương.
  - `#lesson` hoặc `#bai` cho bài.
  - `#topic` hoặc `#dang` cho dạng toán/chủ đề con ở cấp bài.
  - `#section` hoặc `#muc` cho mục nội dung.
  - `#subsection` hoặc `#tieumuc` cho tiểu mục.
  - `#microsection` hoặc `#y` cho cấp nhỏ nhất khi cần tách ý thật gọn.
]

#tieumuc([Nguyên tắc dùng đẹp và sang])

#y([Không nên lạm dụng cấp nhỏ nhất], look: "minimal")
Chỉ dùng `#y(...)` khi thật sự cần chia một mục thành các ý nhỏ, ví dụ checklist, bước giải hoặc ghi chú ngắn. Nếu lạm dụng, mục lục sẽ dài mà tài liệu mất nhịp đọc.

#y([Tầng lớn ưu tiên kiểu đậm], look: "minimal")
`#part` và `#chapter` nên để kiểu mạnh, nhiều không khí. `#section` và `#tieumuc` nên đi theo kiểu gọn hơn để phân tầng rõ mà không rối.

#section([Tùy chọn look thông minh cho heading])

Mỗi tầng giờ có thể đổi `look` thay vì chỉ bật/tắt `boxed`.

Các giá trị nên dùng:

- `hero`: khối lớn, phù hợp phần/chương/phụ lục.
- `band`: thanh tiêu đề rõ, hợp cho bài hoặc dạng.
- `rule`: gọn, có nhịp trang, hợp cho mục.
- `chip`: nhẹ, thanh lịch, hợp cho tiểu mục.
- `minimal`: rất gọn, hợp cho ý rất nhỏ.

```typst
#chapter([Phương trình bậc hai], look: "hero")
#bai([Công thức nghiệm], look: "band")
#muc([Trường hợp delta > 0], look: "rule")
#tieumuc([Bước biến đổi], look: "chip")
#y([Nhận xét nhanh], look: "minimal")
```

#section([Mẫu phân cấp khuyến nghị])

#smartbox(kind: "method")[
  Với SGK:

  - `#chapter` -> `#bai` -> `#muc` -> `#tieumuc`

  Với chuyên đề dài:

  - `#part` -> `#chapter` -> `#dang` -> `#muc` -> `#tieumuc`

  Với tài liệu cực sâu nhiều bước giải:

  - `#chapter` -> `#bai` -> `#muc` -> `#tieumuc` -> `#y`
]

#chapter([Smart box và đóng khung đẹp khi cần])

#section([Macro mới dùng nhanh])

Macro mới là `#smartbox(...)`, alias ngắn là `#khung(...)`.

Ý tưởng của macro này là: bạn chỉ nói loại khung muốn dùng, còn hệ thống tự gợi màu, nền và kiểu viền hợp lý trước. Khi cần tinh chỉnh sâu hơn mới truyền `accent`, `fill`, `style`, `compact`, `radius`.

```typst
#smartbox(kind: "method")[
  Đây là khung phương pháp.
]

#smartbox(kind: "warning", compact: true)[
  Đây là khung lưu ý dạng gọn.
]

#khung(kind: "summary", title: [Chốt kiến thức])[ 
  Đây là alias ngắn cho smartbox.
]
```

#section([Các preset đang có])

- `kind: "theory"` hoặc `"lythuyet"`
- `kind: "method"` hoặc `"phuongphap"`
- `kind: "memory"` hoặc `"ghinho"`
- `kind: "summary"` hoặc `"tomtat"`
- `kind: "warning"` hoặc `"luuy"`
- `kind: "remark"` hoặc `"nhanxet"`
- `kind: "exercise"` hoặc `"baitap"`
- mặc định là `note`

#tieumuc([Nên dùng khi nào])

#smartbox(kind: "theory")[
  Dùng khi bạn có một đoạn kiến thức cần được nổi bật tạm thời nhưng chưa muốn tạo hẳn macro chuyên biệt như `#dn`, `#dl`, `#tc`.
]

#smartbox(kind: "warning", compact: true)[
  Dùng khi cần một cảnh báo ngắn chen giữa bài, ví dụ lỗi thường gặp, điều kiện xác định, dấu dễ nhầm.
]

#smartbox(kind: "remark", style: "minimal")[
  Dùng khi muốn khung có cảm giác nhẹ, học thuật, không quá nổi màu.
]

#chapter([Quản lý ngân hàng câu hỏi từ bank.json])

#section([Chẩn đoán đúng hiện trạng hiện nay])

#smartbox(kind: "warning", title: [Điểm cần chốt ngay])[ 
  `bank.json` hiện tại *chưa phải* là ngân hàng câu hỏi hoàn chỉnh.

  Nó mới là *metadata index*: mỗi mã như `0D1N1-1` đang trỏ tới một dòng mô tả phân loại theo lớp, mạch kiến thức, chương, bài và dạng.

  Điều đó rất tốt để quản lý taxonomy, nhưng chưa đủ để dựng đề vì chưa có nội dung thật của câu hỏi như đề bài, đáp án, lời giải, hình, tags.

  Quan trọng hơn: *nội dung câu hỏi giàu công thức* không nên nhét vào JSON để Typst render trực tiếp, vì chuỗi JSON không phải là markup Typst sống. Với bài toán có phân số, ma trận, hình vẽ, cách bền vững hơn là giữ taxonomy ở JSON và giữ nội dung thật ở file `.typ` keyed theo cùng ID.
]

#section([Module mới để quản lý bank])

Hiện đã có thêm các hàm mới trong `template.typ`:

- `#load-bank()` đọc mirror `typst/bank.json`
- `#bank-filter(...)` lọc theo lớp, mảng kiến thức, chương, bài, dạng
- `#bank-count(...)` đếm số mã theo chương, bài hoặc mảng kiến thức
- `#bank-lookup(...)` tra một mã cụ thể
- `#bank-attach(...)` để nối metadata bank với dữ liệu câu hỏi thật sau này
- `#question-tn`, `#question-ds`, `#question-tln`, `#question-tl` để khai báo câu hỏi thật bằng Typst
- `#question-select(...)` để lọc theo metadata rồi nối với nội dung câu hỏi thật
- `#question-missing(...)` để phát hiện mã có trong `bank.json` nhưng chưa viết câu
- `#render-selection(...)` để dựng đề trực tiếp từ danh sách đã lọc

#smartbox(kind: "warning", compact: true)[
  Vì Typst đang compile theo `--root typst`, mọi file JSON mà Typst đọc trực tiếp phải nằm trong thư mục `typst/`.

  Workflow ổn định nên dùng là:

  - chỉnh `bank.json` ở repo root nếu bạn muốn quản lý nguồn ngoài Typst;
  - chạy `npm run sync:bank` để cập nhật `typst/bank.json`;
  - viết nội dung câu hỏi thật ở `typst/questions.typ`;
  - sau đó compile tài liệu Typst.
]

```typst
#let bank = load-bank()
#let menh-de = bank-filter(bank, chapter: "Mệnh đề")
#let bai-1 = bank-filter(bank, lesson: "Mệnh đề")
#let thong-ke = bank-count(bank, by: "chapter")
```

```typst
#import "questions.typ": question-bank

#let bank = load-bank()
#let selected = question-select(bank, question-bank, chapter: "Mệnh đề", status: "ready")
#render-selection(selected, show-id: true)
```

#section([Thống kê thật từ bank.json hiện tại])

#smartbox(kind: "summary", title: [Tổng quan dữ liệu thật])[ 
  - Tổng số mã hiện có trong `bank.json`: #bank.len().
  - Số mã thuộc Đại số: #dai-so.len().
  - Số mã thuộc Hình học: #hinh-hoc.len().
  - Số chương/phân cụm đang xuất hiện: #chapter-counts.len().
  - Số bài đang xuất hiện: #lesson-counts.len().
]

#tieumuc([Một vài chương đang có dữ liệu])

#for item in chapter-counts.slice(0, 8) [
- *#item.label*: #item.count mã.
]

#section([Kế hoạch chuẩn từ đầu để dùng lâu dài])

#smartbox(kind: "method", title: [Mô hình 3 lớp khuyến nghị])[ 
  Hãy giữ hệ thống theo ba lớp riêng:

  - Lớp 1: `bank.json` chỉ giữ metadata phân loại.
  - Lớp 2: một file Typst-native như `typst/questions.typ`, giữ nội dung đề bài, đáp án, lời giải, hình, công thức.
  - Lớp 3: các file Typst chỉ lo render, lọc và xuất SGK/chuyên đề/đề thi.
]

#tieumuc([Vì sao nên tách 3 lớp])

#y([Không trói nội dung vào layout], look: "minimal")
Khi tách metadata khỏi nội dung và khỏi layout, bạn có thể dùng cùng một mã câu hỏi cho nhiều đầu ra khác nhau: đề kiểm tra, chuyên đề, sách bài tập hoặc slide chữa đề.

#y([Dễ kiểm kê và lọc], look: "minimal")
Bạn sẽ kiểm tra rất nhanh được: chương nào còn thiếu câu, dạng nào quá ít, mức độ nào đang lệch.

#y([Dễ tự động hóa], look: "minimal")
Sau này Typst có thể đọc filter và dựng tuyển chọn câu hỏi theo chương-bài-dạng mà không cần chép tay danh sách.

#section([Dữ liệu câu hỏi thật nên trông như thế nào])

Nếu bắt đầu lại cho chuẩn, hãy giữ `bank.json` làm bản đồ, còn câu hỏi thật đặt trong file `typst/questions.typ` như sau:

```typst
#import "template.typ": ds-item, question-tn, question-ds

#let question-bank = (
  "0D1N1-1": question-tn(
    [Phát biểu nào sau đây là một mệnh đề?],
    (
      [Bạn học tốt nhé!],
      [$2$ là số nguyên tố.],
      [Hôm nay đẹp quá!],
      [$x + 1 = 3$],
    ),
    correct: 2,
    solution: [Chỉ phát biểu "$2$ là số nguyên tố" là mệnh đề.],
    status: "ready",
    tags: ("lop10", "menh-de"),
  ),

  "0D1N1-2": question-ds(
    [Xét các phát biểu sau.],
    (
      ds-item(["$2$ là số chẵn" là mệnh đề.], correct: true),
      ds-item(["Hãy mở vở ra" là mệnh đề.], correct: false),
    ),
    status: "ready",
  ),
)
```

#section([Cách nối metadata với câu hỏi thật])

Khi đã có `questions.typ`, quy trình đẹp và ổn định là:

```typst
#import "questions.typ": question-bank

#let bank = load-bank()
#let linked = question-select(
  bank,
  question-bank,
  chapter: "Mệnh đề",
  status: "ready",
)
```

Từ đó mỗi câu sẽ có hai lớp thông tin:

- `question`: nội dung thật để render.
- `meta`: chương, bài, dạng lấy từ `bank.json`.

#section([Kết luận quản lý bank hiện tại])

#smartbox(kind: "summary", title: [Nên làm ngay từ bây giờ])[ 
  - Giữ `bank.json` như bản đồ mã chuẩn.
  - Không nhét trực tiếp đề bài và đáp án vào đúng file đó nữa.
  - Tạo `typst/questions.typ` để lưu câu hỏi thật bằng Typst-native content.
  - Dùng `question-select(...)` để lấy đúng câu theo chương, bài, dạng, mức độ và trạng thái.
  - Dùng `render-selection(...)` để dựng đề trực tiếp từ danh sách ID đã chọn.
]

#chapter([Quy trình vận hành khuyến nghị])

#section([Khi viết sách hoặc chuyên đề])

- Bắt đầu từ `sgk.typ`, `chuyende.typ` hoặc `book.typ`.
- Dùng hierarchy mới để giữ cấu trúc sâu mà vẫn đẹp.
- Dùng `smartbox` cho các khung tạm, còn macro chuyên biệt dùng cho các khối lặp nhiều.

#section([Khi viết đề hoặc bộ đề])

- Dùng `de-01.typ` cho đề đơn.
- Dùng `bo-de.typ` cho tài liệu nhiều đề.
- Khi có file câu hỏi thật, chỉ cần lọc theo `bank.json` rồi đưa vào engine đề.

#section([Khi rà soát ngân hàng])

- Dùng `load-bank()` để nạp metadata.
- Dùng `bank-count(..., by: "chapter")` để xem độ phủ từng chương.
- Dùng `bank-filter(..., chapter: ..., lesson: ..., form: ...)` để lấy đúng cụm câu cần biên tập.

#tomtat[
  Bộ khung hiện tại đã mạnh hơn ở ba điểm:

  - hierarchy sâu hơn, đẹp hơn và có nhiều look cho từng cấp;
  - có `smartbox` để đóng khung nhanh mà vẫn đẹp;
  - `bank.json` đã có lớp quản lý riêng để làm nền cho một ngân hàng câu hỏi chuẩn, tách metadata khỏi nội dung câu hỏi thật.
]