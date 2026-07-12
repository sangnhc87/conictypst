# Video giới thiệu ConicTypst

## Mục tiêu

Video ngắn giới thiệu hệ thống ConicTypst/Sang Math mà GV Nguyễn Văn Sang đang xây dựng:

- Dashboard công cụ.
- Ngân hàng câu hỏi, trộn đề, macro Typst.
- CeTZ và BBT.
- Sang Math Atlas cho chuyên đề hằng năm.
- Beamer trình chiếu bài giảng.
- Link web nhớ nhanh toàn hệ thống.

## Giọng đọc

- TTS: `edge-tts`
- Voice: `vi-VN-NamMinhNeural`
- Rate: `+0%`
- Lý do: giọng nam tiếng Việt, hợp yêu cầu video mang giọng giáo viên Nam.

## Lệnh render

```bash
cd typst-system-intro-video
./.venv/bin/manim -qh scene.py TypstSystemIntro
```

File MP4 sau render nằm trong:

```text
typst-system-intro-video/media/videos/scene/1080p60/TypstSystemIntro.mp4
```

Sau render, bản copy tiện mở sẽ được đặt tại:

```text
typst-system-intro-video/typst-system-intro.mp4
```
