# Hướng dẫn chạy hiệu ứng hoạt hình bằng Manim

Bài toán được lấy từ tài liệu: **CD-XepGhe-KhongKe.typ** (Câu 1).
> Có 2 học sinh lớp A, 2 học sinh lớp B và 2 học sinh lớp C. Xếp các học sinh vào 6 ghế chia thành 2 hàng song song đối diện nhau, mỗi hàng gồm 3 ghế. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau cùng hàng hoặc ngồi đối diện nhau khác hàng.

## 1. Cài đặt Manim
Để chạy được file `scene.py`, bạn cần cài đặt thư viện Manim.

1. **Cài đặt Python:** Yêu cầu Python 3.8 trở lên.
2. **Cài đặt các gói phụ thuộc hệ thống:** 
   - Trên macOS: `brew install py3cairo ffmpeg pango pkg-config`
   - Trên Windows: Tải và cài đặt FFmpeg, sau đó thêm vào PATH. (Cài đặt thêm MiKTeX nếu muốn xuất công thức toán học).
3. **Cài đặt thư viện Manim bằng pip:**
   ```bash
   pip install manim
   ```

## 2. Cách chạy và xuất video
Mở terminal, di chuyển vào thư mục `manim_xepghe` và chạy lệnh sau:

```bash
# Xuất video ở chất lượng thấp (render nhanh) để xem thử
manim -pql scene.py XepGheProblem

# Xuất video ở chất lượng cao (1080p 60fps)
manim -pqh scene.py XepGheProblem
```

- Cờ `-p` nghĩa là tự động mở file video (Preview) sau khi render xong.
- Cờ `-q l` hoặc `-q h` là chất lượng (Low / High).

Video sẽ được lưu trong thư mục `media/videos/scene/...`.

## 3. Nếu muốn có giọng đọc (manim-voiceover)
1. Cài đặt thêm plugin:
   ```bash
   pip install "manim-voiceover[azure]"
   ```
2. Trong code Python, bạn import thư viện và thay đổi class như sau:
   ```python
   from manim import *
   from manim_voiceover import VoiceoverScene
   from manim_voiceover.services.azure import AzureService

   class XepGheProblem(VoiceoverScene):
       def construct(self):
           self.set_speech_service(AzureService(voice="vi-VN-HoaiMyNeural"))
           
           with self.voiceover(text="Có 2 học sinh lớp A, 2 học sinh lớp B và 2 học sinh lớp C.") as tracker:
               self.play(Write(title))
   ```
