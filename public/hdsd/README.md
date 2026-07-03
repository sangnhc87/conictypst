# HDSD Typst — Sách hướng dẫn hệ thống

> Website HDSD: mở file `public/hdsd/index.html` trong trình duyệt.
> Production URL: `https://hdsd-conictypst.pages.dev`
> Deploy riêng project HDSD: `npm run deploy:hdsd`.

## Cấu trúc thư mục

```
typst/
├── sang-exam.typ      ← Engine đề thi (tn, ds, tln, tl)
├── bbt.typ            ← Bảng biến thiên, xét dấu
├── geometry.typ       ← Hình học phẳng & không gian
├── template.typ       ← Router tổng (import từ đây)
├── math-sym.typ       ← Ký hiệu toán bổ sung
├── book.typ           ← File mẫu sách
├── sgk.typ            ← File mẫu SGK
├── chuyende.typ       ← File mẫu chuyên đề
├── bo-de.typ          ← File mẫu bộ đề
└── modules/
    ├── book.typ       ← Engine sách/SGK/chuyên đề
    ├── exam.typ       ← Wrapper engine thi
    ├── exam-set.typ   ← Bộ đề nhiều đề
    └── research.typ   ← Bài nghiên cứu

public/hdsd/
├── index.html         ← Website HDSD
├── style.css
├── script.js
└── downloads/
    ├── stexgv-template-full.zip
    ├── stexgv-exam-only.zip
    ├── stexgv-book-only.zip
    └── stexgv-drawing.zip
```

## Lệnh biên dịch

```bash
# Đề thi
typst compile --root typst typst/exams/de-01.typ output/de.pdf

# Sách / chuyên đề  
typst compile --root typst typst/chuyende.typ output/cd.pdf

# Watch mode
typst watch --root typst typst/exams/de-01.typ output/de.pdf

# Sách HDSD PDF
typst compile --root . typst/hdsd-exam.typ typst/hdsd-exam.pdf

# Web HDSD project riêng
npm run deploy:hdsd
```

## Import chuẩn

```typst
// Tất cả — khuyến nghị
#import "template.typ": *

// Chỉ đề thi
#import "sang-exam.typ": *
#import "@preview/cetz:0.5.2"

// Chỉ sách
#import "modules/book.typ": *
```
