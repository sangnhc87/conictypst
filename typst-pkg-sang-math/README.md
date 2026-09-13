# sang-math

Bộ macro Typst dành cho Toán THPT Việt Nam: đề thi bốn dạng câu hỏi, sách/chuyên đề, bảng biến thiên, bảng xét dấu và hình học CeTZ.

- Hướng dẫn trực tuyến: https://hdsd-conictypst.pages.dev
- Mã nguồn: https://github.com/sangnhc87/conictypst
- Yêu cầu: Typst 0.14.0 trở lên (do `cetz 0.5.2`)

## Cài đặt

```typ
// Sử dụng bản chính thức trên Typst Universe:
#import "@preview/sang-math:1.0.6": *

// Hoặc sử dụng bản cài đặt local trên máy:
#import "@local/sang-math:1.0.6": *
```

Khi chỉ dùng một nhóm chức năng, có thể import tường minh:

```typ
#import "@local/sang-math:1.0.6": tn, ds, tln, tl, True, decuong-book, decuong-preview
```

## API chính

| Nhóm | Macro tiêu biểu |
|---|---|
| **Sách Đề cương (Mới 1.0.6)** | `decuong-book`, `decuong-preview`, `chuyende-book`, `dethi-book`, `chuong`, `bai`, `dang`, `phuong-phap`, `bt-item`, `C1`..`C5` |
| **Ma trận Logic (Mới 1.0.6)** | `matrix-table`, `co`, `yes`, `khong`, `no`, `logic-check`, `logic-cross` |
| **Đề thi THPT** | `tn`, `ds`, `tln`, `tl`, `exam-mode`, `exam-part`, `print-answer-key` |
| **Giao diện đề thi** | `exam-theme`, `exam-preset`, `exam-input-preset`, `exam-template-names` |
| **Sách / SGK chuyên sâu** | `book-theme`, `book-chapter`, `book-lesson`, các hộp sư phạm (`goal-box`, `theorem-box`...) |
| **Layout in hai mặt** | `layout-draft`, `layout-2col-draft` — nội dung 70%, nháp 30% đổi bên chẵn/lẻ |
| **Bảng biến thiên & Xét dấu** | `bbtv2`, `bbbt`, `bxd`, `my-bxd`, `my-bbbt`, `bang-gia-tri`, `auto-bbt` |
| **Hình học cơ bản** | `tri-abc`, `tri-right`, `chop-sabc`, `circle-desc`, `axis-xy`, `plot` |
| **Conic & Khối tròn xoay** | `draw-parabola`, `draw-ellipse`, `draw-hyperbola`, `draw-cylinder`, `draw-cone`, `draw-sphere` |
| **Ký hiệu toán & đa môn** | `RR`, `ZZ`, `NN`, `QQ`, `tfrac`, `heva`, `hoac`, `doC`, `ohm`, `pu-tn`... |

`lib.typ` là cổng public duy nhất xuất toàn bộ hệ thống đề thi, sách đề cương, ma trận logic, BBT và hình học CeTZ.


## Câu đúng/sai dạng bảng hoặc danh sách

Mặc định `#ds` vẫn dùng bảng Đ/S như các phiên bản trước. Từ `1.0.4`, có thể
chuyển nhanh sang danh sách bằng `use-table: false`:

```typ
#ds(
  [Xét các phát biểu sau.],
  (True([Mệnh đề đúng.]), [Mệnh đề sai.]),
  use-table: false,
)
```

Để chọn giao diện danh sách, dùng `ds-style` với một trong các giá trị:
`"list"`, `"pill"`, `"modern"`, `"minimal"`, `"bookmark"`, `"folder"`,
`"diamond"`, `"gradient"` hoặc `"checklist"`.

```typ
#ds(
  [Xét các phát biểu sau.],
  (True([Mệnh đề đúng.]), [Mệnh đề sai.]),
  ds-style: "bookmark",
)
```

`use-table: false` tương đương `ds-style: "list"`. Cú pháp cũ
`table: false` cũng được giữ để tương thích với các ví dụ đã lưu.

## Sách Đề Cương & Biên Soạn Toàn Năng (Mới 1.0.6)

Soạn thảo toàn bộ tài liệu học tập, sách đề cương ôn tập hoặc hướng dẫn giải chi tiết chỉ với một lệnh show rule duy nhất:

```typ
#import "@local/sang-math:1.0.6": *

#show: decuong-book.with(
  title: "ĐỀ CƯƠNG TOÁN 10 HỌC KỲ I",
  author: "Thầy Nguyễn Sang",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  subject: "MÔN: TOÁN — LỚP 10",
  year: "NĂM HỌC 2026–2027",
  mode: "loigiai", // Đổi thành "dethi" là cả cuốn sách tự động ẩn hết lời giải!
  show-cover: true, // Bìa màu chuẩn nhận diện
  show-toc: true,   // Mục lục 3 cấp
)

#chuong("MỆNH ĐỀ VÀ TẬP HỢP", mau: C1)
#bai("MỆNH ĐỀ TOÁN HỌC", mau: C1)

#dang("Suy luận logic bằng bảng ma trận", mau: C1)
#phuong-phap[Phương pháp loại trừ theo hàng và cột...]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Đề bài tự luận...], loigiai: [Lời giải chi tiết...])
]

#bai-tap-trac-nghiem(mau: C1)
#tn(dir: "ngang", [Câu hỏi trắc nghiệm...], (A, B, C, D), loigiai: [...])
```

### Soạn riêng lẻ 1 file bài tập (decuong-preview)

Khi đang mở riêng 1 file bài trong IDE, dùng `decuong-preview` để xem trước trực tiếp mà không sinh ra trang bìa hay mục lục:

```typ
#import "@local/sang-math:1.0.6": *
#show: decuong-preview.with(mode: "loigiai") // Hoặc "dethi"

#dang("Dạng toán cụ thể", mau: C1)
...
```

### Ký hiệu Ma Trận Logic

Hỗ trợ trực tiếp các ký hiệu ma trận suy luận:
- `#co`, `#yes` (✔ Có) và `#khong`, `#no` (✘ Không).
- `#logic-check` (✔) và `#logic-cross` (✘).
- `#matrix-table(headers: (...), rows: (...))` cho bảng suy luận logic nhiều chiều.

## Ví dụ đề thi


```typ
#import "@preview/sang-math:1.0.5": *

#let preset = exam-preset(
  theme: "teal-pro",
  profile: "dethi", // dethi | loigiai | compact | draft | beamer
)
#let (tn, ds, tln, tl) = exam-mode(..preset.question)

#show: sang-setup.with(math-color: preset.accent)
#show: exam-theme.with(
  theme: preset.theme,
  school: "TRƯỜNG THPT SANG-MATH",
  exam-title: "ĐỀ THI THỬ TỐT NGHIỆP THPT",
  subject: "TOÁN 12",
  duration: "90 phút",
  code: "101",
  ..preset.template,
)

#tn(
  [Đạo hàm của $f(x)=x^3-3x+1$ tại $x=2$ bằng],
  ([$3$], True([$9$]), [$6$], [$-3$]),
  loigiai: [$f'(2)=3 dot 2^2-3=9$.],
)
```

## Bộ mẫu để copy và sửa

Thư mục [`examples/copy-ready`](https://github.com/sangnhc87/conictypst/tree/14b296889533c8b1897e5bebbfec499de7c5a932/typst-pkg-sang-math/examples/copy-ready) có các mẫu chạy sẵn cho
đề 15 phút, giữa kỳ hỗn hợp, cấu trúc THPT 12–4–6, đề tự luận có nháp, phiếu học
tập và câu có bảng biến thiên/CeTZ. Xem bảng chọn mẫu tại
[`examples/README.md`](https://github.com/sangnhc87/conictypst/blob/14b296889533c8b1897e5bebbfec499de7c5a932/typst-pkg-sang-math/examples/README.md).

Giáo viên dùng AI/OCR để tạo hoặc chuyển đề có thể sao chép bộ hướng dẫn tại
[`PROMPT_AI_TAO_DE.md`](https://github.com/sangnhc87/conictypst/blob/14b296889533c8b1897e5bebbfec499de7c5a932/typst-pkg-sang-math/PROMPT_AI_TAO_DE.md). Prompt quy định đúng chữ ký
`tn/ds/tln/tl`, ID ổn định, cú pháp toán Typst và bước tự kiểm tra đáp án.

Các theme đề có thể lấy trực tiếp bằng `exam-template-names`; hiện gồm `classic`, `ocean`, `emerald`, `royal`, `violet`, `crimson`, `graphite`, `amber`, `teal-pro`, `sky`, `indigo-minimal`, `print-economy`, `aurora`, `lotus`, `navy-gold`, `jade`, `coral`, `plum`.

## Ví dụ sách/chuyên đề

```typ
#import "@preview/sang-math:1.0.5": *

#show: book-theme.with(
  theme: "sgk-modern",
  title: "CHUYÊN ĐỀ HÀM SỐ",
  author: "Tổ Toán",
)

#book-chapter([Ứng dụng đạo hàm], number: 1)
#book-lesson([Tính đơn điệu của hàm số], number: 1)

#theory-box[Hàm số đồng biến trên khoảng $K$ khi...]
#example-box[Khảo sát tính đơn điệu của $f(x)=x^3-3x$.]
#practice-box[Giải các bài tập tương tự.]
```

Danh sách giao diện sách có sẵn nằm trong `book-template-names`.

## Bảng biến thiên

```typ
#import "@preview/sang-math:1.0.5": bbtv2

#bbtv2(
  x-vals: ($-oo$, $-1$, $1$, $+oo$),
  d-signs: ("+", 0, "-", 0, "+"),
  v-vals: ($-oo$, $3$, $-1$, $+oo$),
)
```

## Đề 70/30 có nháp khi in hai mặt

```typ
#import "@preview/sang-math:1.0.5": layout-draft

#show: layout-draft.with(
  nháp-pct: 30%,
  accent: rgb("#117a65"),
)

Nội dung đề thi...
```

Trang lẻ đặt vùng nháp bên phải, trang chẵn đặt vùng nháp bên trái. Lề nội dung
dùng cơ chế `inside`/`outside` nên tự đảo đúng khi in hai mặt. Mẫu đầy đủ nằm tại
[`examples/copy-ready/07-de-70-30-nhap-in-hai-mat.typ`](https://github.com/sangnhc87/conictypst/blob/14b296889533c8b1897e5bebbfec499de7c5a932/typst-pkg-sang-math/examples/copy-ready/07-de-70-30-nhap-in-hai-mat.typ).


## Hình học CeTZ nâng cao

Các hàm `draw-*` được gọi bên trong `cetz.canvas`:

```typ
#import "@preview/cetz:0.5.2"
#import "@preview/sang-math:1.0.5": draw-ellipse, draw-cylinder

#cetz.canvas({
  draw-ellipse(a: 2, b: 1, show-axes: true, show-foci: true)
})

#cetz.canvas({
  draw-cylinder(radius: 1.4, height: 3.5, show-hidden: true)
})
```

## Ứng dụng cho Đa môn (Vật lí, Hóa học, KHTN)
Gói `sang-math` cung cấp khung đề thi chuẩn Bộ GD&ĐT 2025, hoàn toàn có thể dùng cho mọi môn học:
- **Vật lí**: Đổi `subject: "VẬT LÍ 12"`, sử dụng các ký hiệu `$ohm$`, `$doC$` hoặc `$mu"F"$.
- **Hóa học**: Kết hợp với gói công thức hóa học `@preview/typsium:0.3.2`:
```typ
#import "@preview/sang-math:1.0.5": *
#import "@preview/typsium:0.3.2": *

#show: exam-classic.with(subject: "HÓA HỌC 12", duration: "50 phút")

#exam-part([PHẦN I. Trắc nghiệm 4 lựa chọn])
#tn([Chất nào là este no, đơn chức, mạch hở?], (
  [#ce("CH3COOH")],
  True([#ce("CH3COOC2H5")]),
  [#ce("CH2=CHCOOCH3")],
  [#ce("HCOOCH=CH2")],
))
```

## Tạo đề bằng AI (ChatGPT / Claude / Gemini)
Để AI hỗ trợ soạn đề tự động đúng 100% cú pháp `sang-math:1.0.5`, xem hướng dẫn và sao chép System Prompt chuẩn tại [`PROMPT_AI_TAO_DE.md`](https://github.com/sangnhc87/conictypst/blob/14b296889533c8b1897e5bebbfec499de7c5a932/typst-pkg-sang-math/PROMPT_AI_TAO_DE.md).

## Phát triển và kiểm thử

```bash
typst compile --root . examples/exam-template-demo.typ
typst compile --root . examples/book-template-demo.typ
typst compile --root . tests/test-public-api.typ
```

Các thay đổi phá vỡ tên hoặc chữ ký macro phải dành cho phiên bản major mới. Tính năng mới nên được export từ `lib.typ`, có ví dụ tối thiểu và có bài kiểm thử compile.

## License

MIT © Nguyễn Văn Sang
