# Video Manim giới thiệu package `sang-math`

## Nội dung

Video giới thiệu gói lệnh Typst `sang-math` theo đúng cấu trúc `lib.typ`.
Mỗi slide đều có nhãn nhỏ:

```text
Nguyễn Văn Sang - THPT Nguyễn Hữu Cảnh
```

Các phần chính:

- `bbt.typ`: `bbtv2`, `bbbt`, `bxd`, `bbt-opt`.
- `sang-exam.typ`: `tn`, `ds`, `tln`, `tl`, `exam-mode`.
- `exam-templates.typ`: `exam-preset`, `exam-theme`, theme/profile.
- `book-templates.typ`: `book-theme`, `book-chapter`, `book-lesson`, các hộp sư phạm.
- `math-sym.typ`: ký hiệu toán tắt.
- `geometry.typ`: hình học CeTZ.

## BBT

Slide BBT dùng ảnh render thật từ Typst, không vẽ tay trong Manim.

Ví dụ:

```typst
#bbtv2(
  x-vals: ($-oo$, $-1$, $1$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $2$, $-2$, $+oo$),
)
```

Tái tạo ảnh minh họa:

```bash
cd typst-package-intro-video
typst compile --root .. assets/bbt-example.typ assets/bbt-example.png
```

## Giọng đọc

- TTS: `edge-tts`
- Voice: `vi-VN-NamMinhNeural`
- Đây là giọng nam tiếng Việt.

## Render

```bash
cd typst-package-intro-video
./.venv/bin/manim -qh scene.py SangMathPackageIntro
```

File xuất chính đã copy ra thư mục gốc của video:

```text
typst-package-intro-video/sang-math-package-intro.mp4
```

Phụ đề:

```text
typst-package-intro-video/sang-math-package-intro.srt
```
