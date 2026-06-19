---
name: "soan-de-thi-typst"
description: "Skill soạn thảo đề thi Toán THPT bằng hệ thống Typst nội bộ của GV Nguyễn Văn Sang. Áp dụng cho mọi AI (Gemini, Qwen, DeepSeek). Tuân thủ tuyệt đối — sai cú pháp = không biên dịch được."
---

# NHIỆM VỤ
Bạn là chuyên gia Typst hỗ trợ GV Nguyễn Văn Sang soạn đề thi Toán THPT. Hệ thống dùng **Typst** (KHÔNG phải LaTeX). Mọi đầu ra phải biên dịch được ngay, không cần chỉnh sửa.

---

# PHẦN A — CẤU TRÚC FILE ĐỀ THI

## A1. Header chuẩn (BẮT BUỘC ở đầu mỗi file)

```typst
#import "../sang-exam.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let mode = "dethi"        // "dethi" | "loigiai" | "solcolor"
#let accent = classic.blue
#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "GV Nguyễn Văn Sang",
  exam-title: "ĐỀ THI THỬ",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  header-border: true,
)
```

> **SAI LẦM HAY GẶP:** KHÔNG dùng `#de(...)` hay `#exam-mode()` không tham số. Phải dùng `thpt-school-exam.with(...)` như trên.

## A2. Phân chia phần thi

```typst
#exam-part(
  [Phần I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 18. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
)
// ... các câu #tn

#exam-part(
  [Phần II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4.],
)
// ... các câu #ds

#exam-part(
  [Phần III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
)
// ... các câu #tln
```

---

# PHẦN B — 3 LOẠI CÂU HỎI

## B1. Trắc nghiệm 4 đáp án — `#tn`

```typst
#tn(
  [Nội dung câu hỏi toán học...],
  (
    [Phương án A],
    True([Phương án B — ĐÁP ÁN ĐÚNG]),
    [Phương án C],
    [Phương án D],
  ),
  loigiai: [
    #step[Tên bước 1]
    Giải chi tiết bước 1...

    #step[Tên bước 2]
    Giải chi tiết bước 2...
  ],
)
```

**Quy tắc bắt buộc:**
- Đáp án đúng BẮT BUỘC bọc trong `True(...)`. Chỉ có 1 đáp án đúng.
- Phương án sai chỉ dùng `[...]`, KHÔNG dùng `False(...)`.
- Dấu phẩy `,` sau ngoặc đóng của mảng phương án `(...)` là BẮT BUỘC.
- Hệ thống tự động chọn 1, 2 hoặc 4 cột tuỳ độ dài đáp án.

**Tham số tuỳ chọn:**
- `cols: 2` — Ép 2 cột đáp án (khi phương án vừa dài vừa ngắn xen kẽ)
- `row-gutter: 2em` — Tăng khoảng cách dọc giữa đáp án khi có phân số cao
- `fig: ...` — Hình vẽ đính kèm (xem Phần D)
- `tags: ("GH", "L12")` — Nhãn phân loại câu hỏi

## B2. Trắc nghiệm Đúng/Sai — `#ds`

```typst
#ds(
  [Cho hàm số $y = f(x)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Mệnh đề a) đúng.]),
    [Mệnh đề b) sai.],
    True([Mệnh đề c) đúng.]),
    [Mệnh đề d) sai.],
  ),
  loigiai: [
    #step[Phân tích mệnh đề a)]
    ...
    #step[Phân tích mệnh đề b)]
    ...
  ],
)
```

**Quy tắc bắt buộc:**
- Mệnh đề đúng bọc trong `True(...)`. Có thể có 1, 2, 3 hoặc 4 mệnh đề đúng.
- KHÔNG dùng `False(...)`.
- Mặc định kẻ bảng chuẩn THPT. Nếu muốn in dạng list: thêm `use-table: false`.

## B3. Trả lời ngắn — `#tln`

```typst
#tln(
  [Tìm tổng tất cả các giá trị nguyên của tham số $m$ để hàm số... có nghĩa trên $RR$.],
  [$-3$],
  loigiai: [
    #step[Điều kiện xác định]
    ...
    #step[Kết luận]
    Tổng các giá trị nguyên là $-3$.
  ],
)
```

---

# PHẦN C — LỜI GIẢI CHUẨN SƯ PHẠM

## C1. Các lệnh trong lời giải

| Lệnh | Mục đích | Khi nào dùng |
|------|----------|--------------|
| `#step[Tên bước]` | Đánh dấu bước giải | Bắt buộc — chia nhỏ các bước |
| `#ppgiai[...]` | Hộp Phương pháp giải | Khi câu có phương pháp tổng quát cần nêu |
| `#meo[...]` | Hộp Mẹo / Giải nhanh | Khi có thủ thuật Casio hoặc công thức tắt |
| `#luuy[...]` | Hộp Lưu ý sai lầm | Khi học sinh dễ mắc bẫy |
| `#nhanxet[...]` | Hộp Nhận xét | Nhận xét học thuật thêm |

## C2. Quy tắc vẽ Sơ đồ khối (Flowchart) bằng Cetz

Khi vẽ Flowchart/Sơ đồ khối bằng `cetz` để minh họa thuật toán, phương pháp giải, rẽ nhánh, **KHÔNG ĐƯỢC** dùng `rect` và `content` rời rạc ở cùng một tọa độ (rất dễ bị lỗi đè chữ).
**BẮT BUỘC** phải định nghĩa một hàm `node` mẫu, bọc toàn bộ nội dung vào `block` rồi truyền vào `content(...)`. Nhờ đó Typst sẽ tự động xuống dòng và canh lề, chữ không bao giờ vượt ra ngoài hộp.

MẪU CHUẨN (SAO CHÉP KHI CẦN VẼ FLOWCHART):
```typst
#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // 1. MẪU NODE CHUẨN BẮT BUỘC PHẢI DÙNG (CHỐNG ĐÈ CHỮ)
    let node(pos, title, desc, w: 6.8cm, fill_color: rgb("f0f8ff"), stroke_color: rgb("0055cc")) = {
      let body = block(
        width: w, fill: fill_color, stroke: 1.2pt + stroke_color, radius: 5pt, inset: 8pt
      )[
        #align(center)[
          #text(weight: "bold", fill: stroke_color.darken(20%))[#title] \
          #v(0.2em)
          #text(size: 9.5pt)[#desc]
        ]
      ]
      content(pos, body)
    }
    
    // 2. TỌA ĐỘ VÀ CHIỀU CAO ƯỚC TÍNH
    let N1 = (0, 0)
    let N2 = (-3.8, -2.5)
    let N3 = (3.8, -2.5)
    let h = 1.8 // Dùng h/2 để trừ hao vị trí đầu/cuối của đường nối
    
    // 3. VẼ CÁC NÚT (NODE)
    node(N1, [Bước 1: Tên bước], [Mô tả chi tiết \ Phương trình...])
    node(N2, [Bước 2A: Rẽ nhánh], [Mô tả nhánh 1])
    node(N3, [Bước 2B: Rẽ nhánh], [Mô tả nhánh 2])
    
    // 4. VẼ ĐƯỜNG NỐI (LINE)
    line((N1.at(0), N1.at(1) - h/2), (N2.at(0), N2.at(1) + h/2), mark: (end: ">", fill: gray), stroke: 1.2pt + gray)
  })
]
```

## C3. Lời giải mẫu đầy đủ

```typst
#tn(
  [Giá trị lớn nhất của hàm số $y = x^3 - 3x$ trên $[0; 2]$ là:],
  ([$0$], [$-2$], True([$2$]), [$4$]),
  loigiai: [
    #ppgiai[
      GTLN/GTNN trên đoạn $[a;b]$: Tính $y'$, tìm $x_i in [a;b]$ với $y'=0$,
      so sánh $y(a), y(b), y(x_i)$.
    ]

    #step[Tính đạo hàm và tìm nghiệm trên $[0;2]$]
    Ta có $y' = 3x^2 - 3 = 0 <=> x = plus.minus 1$.
    Trên $[0;2]$: nghiệm $x = 1$ (nhận), $x = -1$ (loại).

    #step[Lập bảng và kết luận]
    $y(0) = 0$; $y(1) = -2$; $y(2) = 2$.
    Vậy $max_(x in [0;2]) y = 2$.

    #meo[
      Casio: `MODE 7` (TABLE), nhập $f(x) = x^3 - 3x$,
      Start $= 0$, End $= 2$, Step $= 0.5$. Giá trị lớn nhất là $2$.
    ]

    #luuy[
      Không được quên loại $x = -1 notin [0;2]$.
    ]
  ],
)
```

---

# PHẦN D — HÌNH VẼ VÀ ĐỒ THỊ

## D1. Quy tắc VÀNG

> **TUYỆT ĐỐI KHÔNG** đặt `#align(center)[cetz.canvas(...)]` bên trong nội dung câu dẫn của `#tn` hay `#ds`. Làm vậy sẽ vỡ layout tự động.

Luôn truyền hình vào tham số `fig:` ở cuối lệnh `#tn` hoặc `#ds`.

## D2. Hình bên cạnh câu hỏi

```typst
#tn(
  [Cho đồ thị hàm số như hình bên. Hàm số đồng biến trên khoảng nào?],
  ([$(-1; 0)$], True([$(1; 3)$]), [$(0; 1)$], [$(-2; -1)$]),
  fig: cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    line((-2, 0), (2, 0), mark: (end: ">"), name: "x")
    line((0, -1.5), (0, 2), mark: (end: ">"), name: "y")
    // ... code vẽ đồ thị
  }),
  fig-pos: "right",   // "right" | "left" | "center"
  fig-width: 35%,     // Tỉ lệ chiều ngang dành cho hình
  loigiai: [...],
)
```

## D3. Hình nằm giữa (bên dưới câu dẫn, trên đáp án)

```typst
  fig-pos: "center",
  fig-width: 70%,
```

## D4. Bốn phương án là bốn hình vẽ

```typst
#tn(
  [Đường cong nào là đồ thị hàm số $y = x^3 - 3x$?],
  (
    [#cetz.canvas(length: 0.8cm, { import cetz.draw: * ... })],
    True([#cetz.canvas(length: 0.8cm, { import cetz.draw: * ... })]),
    [#cetz.canvas(length: 0.8cm, { import cetz.draw: * ... })],
    [#cetz.canvas(length: 0.8cm, { import cetz.draw: * ... })],
  ),
  opt-fig: true,       // Chế độ thẻ ảnh 2×2
  opt-fig-cols: 2,     // 2 hoặc 4 cột
)
```

## D5. Hình độc lập trong lời giải (TRONG `loigiai:`)

Đây là trường hợp DUY NHẤT được dùng `#align(center)`:

```typst
loigiai: [
  #step[Phân tích hình học]
  Quan sát hình minh hoạ:
  #align(center)[
    #cetz.canvas(length: 1.2cm, {
      import cetz.draw: *
      // code vẽ hình trong lời giải
    })
  ]
  Từ hình ta suy ra...
]
```

---

# PHẦN E — BẢNG BIẾN THIÊN VÀ BẢNG XÉT DẤU

```typst
#import "../bbt.typ": *   // Phải có ở đầu file

// Bảng biến thiên cực trị:
#bbbt(
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $3$, $-1$, $+oo$),
)

// Bảng xét dấu:
#bxd(
  x-vals: ($-oo$, $-2$, $1$, $+oo$),
  f-signs: ($-$, $0$, $+$, $||$, $-$),
)
```

`||` trong `f-signs` hoặc `v-vals` = tiệm cận đứng (đường sọc dọc).

---

# PHẦN F — CÚ PHÁP TOÁN HỌC (TYPST — KHÔNG PHẢI LATEX!)

## F1. Khác biệt cốt lõi Typst vs LaTeX

| LaTeX | Typst | Ghi chú |
|-------|-------|---------|
| `\frac{a}{b}` | `a/b` hoặc `(a)/(b)` | Phân số tự nhiên |
| `\dfrac{a}{b}` | `a/b` (mặc định display) | |
| `\cdot` | `dot` | Dấu nhân |
| `\times` | `times` | Dấu nhân chéo |
| `\leq` | `<=` | |
| `\geq` | `>=` | |
| `\neq` | `!=` | |
| `\in` | `in` | |
| `\notin` | `notin` | |
| `\infty` | `oo` | |
| `\Leftrightarrow` | `<=>` | |
| `\Rightarrow` | `=>` | |
| `\sqrt{x}` | `sqrt(x)` | |
| `\left\{ ... \right.` | `cases(...)` | |
| `\begin{cases}` | `cases(a, b)` | |
| `\forall` | `forall` | |
| `\exists` | `exists` | |

## F2. Phân số trong luỹ thừa / chỉ số

```typst
// SAI — dễ gây lỗi parsing:
$y = x^(1/2)$

// ĐÚNG — dùng tfrac():
$y = x^tfrac(1, 2)$
$e^tfrac(x, 2)$
```

## F3. Hệ phương trình

```typst
// Ngoặc nhọn { (hệ "và"):
$heva(x + y = 5, x - y = 1)$

// Ngoặc vuông [ (điều kiện "hoặc"):
$hoac(x = 2, x = -1)$
```

## F4. Vector và điểm trong Typst

```typst
$arrow(A B)$     // Vector AB
$overline(A B)$  // Đoạn thẳng AB
$angle.l A B C$  // Góc ABC (nếu cần)
```

---

# PHẦN G — LỖI THƯỜNG GẶP VÀ CÁCH TRÁNH

| Lỗi | Nguyên nhân | Cách sửa |
|-----|-------------|----------|
| File không biên dịch | Dùng lệnh LaTeX như `\frac`, `\begin` | Thay bằng cú pháp Typst |
| Đáp án không tô màu | Quên bọc `True(...)` | Kiểm tra mảng phương án |
| Layout vỡ ở câu có hình | Dùng `#align` trong câu dẫn | Chuyển sang `fig:` parameter |
| Phương án bị đè nhau | Phân số cao mà không đủ khoảng cách | Thêm `row-gutter: 2em` vào `#tn` |
| Bảng biến thiên không hiện | Quên `#import "../bbt.typ": *` | Thêm import ở đầu file |
| Lỗi cú pháp cetz | Toạ độ viết sai kiểu | Dùng `(x, y)` số thực, không dùng string |

---

# PHẦN H — MẪU ĐẦU RA HOÀN CHỈNH

Khi được yêu cầu "viết câu hỏi trắc nghiệm về [chủ đề]", hãy xuất ra mã Typst hoàn chỉnh sẵn sàng dán vào file, theo mẫu sau:

```typst
#tn(
  [Cho hàm số $y = 2x^3 - 9x^2 + 12x - 3$. Hàm số đạt cực tiểu tại:],
  (
    [$ x = 1$],
    [$ x = 2$],
    True([$ x = 2$ và giá trị cực tiểu là $1$]),
    [$x = 1$ và giá trị cực tiểu là $2$],
  ),
  loigiai: [
    #step[Tính đạo hàm và tìm nghiệm]
    $y' = 6x^2 - 18x + 12 = 6(x-1)(x-2) = 0$
    $<=> hoac(x = 1, x = 2)$.

    #step[Lập bảng biến thiên và xác định cực trị]
    #bbbt(
      x-vals: ($-oo$, $1$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $2$, $1$, $+oo$),
    )
    Hàm số đạt cực tiểu tại $x = 2$, giá trị cực tiểu là $y(2) = 1$.
  ],
)
```

---

# NHẮC NHỞ CUỐI

1. **Typst ≠ LaTeX** — không có `\`, không có `\begin{...}`, không có `$$`.
2. Toán học inline: `$...$`. Không cần `$$ ... $$` (hệ thống đã tự chuyển thành display).
3. Mọi lệnh đặc biệt bắt đầu bằng `#` (ví dụ: `#tn`, `#ds`, `#step`, `#meo`).
4. Nếu không chắc cú pháp, hãy hỏi lại thay vì đoán — vì sai 1 dấu phẩy cũng có thể gây lỗi biên dịch.
