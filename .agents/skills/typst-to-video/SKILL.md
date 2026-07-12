---
name: typst-to-video
description: >-
  Chuyển đổi mã nguồn bài toán Typst thành kịch bản hoạt hình Manim hoàn chỉnh, kết hợp lồng tiếng (Voiceover) giọng AI chuẩn sư phạm với kiến trúc Đa Engine (Edge-TTS, FPT.AI, Google Cloud).
---

# Typst to Video Generator

## Overview
Skill này giúp người dùng tự động chuyển đổi bất kỳ bài toán nào (do họ cung cấp) thành một video giảng bài (dạng slide) đẹp mắt, có giọng AI đọc giải thích. Hỗ trợ đa dạng các nền tảng TTS (Edge-TTS miễn phí, FPT.AI cực chuẩn sư phạm, hoặc Google Cloud 4-triệu-ký-tự). Mặc định nếu không chỉ định engine, hệ thống sẽ dùng `edge` với giọng Nam (`vi-VN-NamMinhNeural`).

## Cấu hình mặc định (BẮT BUỘC)

Khi người dùng yêu cầu tạo video cho một bài toán, Agent PHẢI thực hiện đúng các bước sau:

### Bước 1: Tạo file `.typ`
Tạo một file `.typ` trong thư mục `examples` (hoặc thư mục người dùng chỉ định).
Sử dụng bộ template **Dark Mode bắt mắt (Manim-style)** với kích thước chuẩn Full HD, cụ thể như sau:

```typst
#set page(
  width: 1920pt,
  height: 1080pt,
  fill: rgb("#111111"),
  margin: 80pt
)

// Thiết lập font chữ, màu trắng, phong cách toán học
#set text(size: 32pt, fill: white, font: "New Computer Modern")
#show math.equation: set text(fill: rgb("#f6e8c3"), size: 48pt)
#set align(center)

// Macro tuỳ biến tạo trang hiển thị từng bước
#let video-step(..pieces) = {
  let arr = pieces.pos()
  for i in range(1, arr.len() + 1) {
    page(align(center + horizon, block(breakable: false, arr.slice(0, i).join())))
  }
}

// BẮT ĐẦU NỘI DUNG BÀI TOÁN
#video-step(
  [
    #text(size: 48pt, fill: rgb("#ff9e64"), weight: "bold")[TIÊU ĐỀ BÀI TOÁN]
    #v(1em)
    Nội dung đề bài...
  ],
  [
    #v(1em)
    *Giải:*
    \
  ],
  [
    Bước giải 1...
    \
  ],
  [
    Bước giải 2...
  ]
)
```

**LƯU Ý QUAN TRỌNG VỀ TYPST:**
1. Hãy chia bài toán thành các khối `[ ... ],` trong hàm `#video-step`.
2. Đếm chính xác số khối (gọi là `N`). Sẽ có chính xác `N` trang PDF được sinh ra.

### Bước 2: Tạo script lồng tiếng `.txt`
Tạo một file `.txt` trùng tên với file `.typ`.
File `.txt` này PHẢI chứa **chính xác `N` dòng (không hơn không kém)**, tương ứng 1-1 với các khối trong hàm `#video-step` ở Bước 1.

Mỗi dòng là kịch bản lồng tiếng tiếng Việt cho khối đó.
- Để lại dòng trống (chuỗi rỗng) nếu không cần đọc gì ở bước đó.
- Ghi phiên âm tiếng Việt rõ ràng cho các công thức Toán học (ví dụ: `L bằng lim khi x tiến tới 1 của biểu thức...`).

### Bước 3: Render Video
Sử dụng tool `run_command` để gọi script python tạo video. Hãy hỏi ý kiến người dùng xem họ muốn dùng engine nào, hoặc tự đưa ra quyết định nếu họ đã thiết lập API Key trong `.env`.

**Cách gọi cơ bản (dùng edge-tts miễn phí không cần key):**
```bash
python3 scripts/touying_to_video.py path/to/file.typ path/to/file.txt --tts-engine edge
```

**Cách gọi với FPT (Khuyên dùng cho Giọng Nam Sư Phạm):**
Yêu cầu người dùng điền `FPT_API_KEY` vào file `.env` theo hướng dẫn trong `.env.example`, sau đó chạy:
```bash
python3 scripts/touying_to_video.py path/to/file.typ path/to/file.txt --tts-engine fpt
```

**Cách gọi với Google Cloud (Giọng Nam miền Nam, 4 triệu ký tự free):**
Yêu cầu người dùng điền `GCP_API_KEY` vào file `.env` theo hướng dẫn trong `.env.example`, sau đó chạy:
```bash
python3 scripts/touying_to_video.py path/to/file.typ path/to/file.txt --tts-engine gcp --voice vi-VN-Standard-D
```

Lưu ý: Mặc định script sẽ lưu file thành `path/to/file.mp4`. Cần chú ý hướng dẫn người dùng file `.env.example` nếu hệ thống báo thiếu API Key.

## Common Mistakes
1. **Sai lệch đồng bộ trang:** File `.txt` có số dòng KHÁC VỚI số lượng khối `[ ... ]` trong file `.typ`. Bạn phải luôn luôn đếm kỹ và đảm bảo số dòng `.txt` = số lượng tham số truyền vào hàm `#video-step`.
2. **Quên `breakable: false`:** Phải sử dụng `block(breakable: false, ...)` trong hàm `video-step` để ngăn Typst tự động ngắt trang, nếu không số lượng trang PDF sinh ra sẽ bị sai lệch.
3. **Màu sắc nhạt nhoà:** Đảm bảo sử dụng màu nổi bật như `#ff9e64` (Cam) cho tiêu đề và `#f6e8c3` (Vàng kem) cho công thức toán học (`show math.equation...`).
