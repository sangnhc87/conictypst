import os
import hashlib
import json
from manim import *
from manim_voiceover import VoiceoverScene
from manim_voiceover.services.base import SpeechService

class EdgeTTSService(SpeechService):
    def __init__(self, voice="vi-VN-NamMinhNeural", **kwargs):
        super().__init__(**kwargs)
        self.voice = voice
    
    def generate_from_text(self, text, cache_dir=None, path=None, **kwargs):
        if cache_dir is None:
            cache_dir = self.cache_dir
        
        input_data = {"text": text, "voice": self.voice}
        dict_hash = hashlib.sha256(json.dumps(input_data, sort_keys=True).encode('utf-8')).hexdigest()[:16]
        audio_path = os.path.join(cache_dir, f"{dict_hash}.mp3")
        
        if not os.path.exists(audio_path) or os.path.getsize(audio_path) == 0:
            import subprocess
            print(f"Generating audio for: {text[:30]}...")
            subprocess.run(["edge-tts", "--voice", self.voice, "--text", text, "--write-media", audio_path], check=True)
            
        if os.path.exists(audio_path) and os.path.getsize(audio_path) > 0:
            return {"original_audio": f"{dict_hash}.mp3", "json_dict": input_data}
        else:
            raise Exception("Generated audio file is empty or missing")

class BBTScene(VoiceoverScene):
    def construct(self):
        self.set_speech_service(EdgeTTSService(voice="vi-VN-NamMinhNeural"))
        
        # Watermark
        watermark = Text("Nguyễn Văn Sang - THPT Nguyễn Hữu Cảnh", font_size=20, color=GRAY)
        watermark.to_corner(DR)
        self.add(watermark)
        
        # --- Cảnh 1: Lời giới thiệu ---
        title = MarkupText("<span fgcolor='YELLOW'>TUYỂN TẬP 100 BẢNG BIẾN THIÊN</span>", font_size=50, weight=BOLD)
        subtitle = Text("Đa dạng các hàm số: Bậc 3, Trùng phương, Phân thức...", font_size=30, color=WHITE)
        VGroup(title, subtitle).arrange(DOWN, buff=0.5).move_to(ORIGIN)
        
        with self.voiceover(text="Hệ thống đã tự động kết xuất thành công tuyển tập 100 bảng biến thiên chuẩn mực.") as tracker:
            self.play(Write(title))
            self.play(FadeIn(subtitle, shift=UP))
            
        self.wait(0.5)
        self.play(FadeOut(title), FadeOut(subtitle))
        
        bbt_title = VGroup(
            Text("Bảng biến thiên: ", font_size=30, color=BLUE),
            MathTex("y = x^3 - 3x + 2", font_size=35, color=BLUE)
        ).arrange(RIGHT)
        bbt_title.to_edge(UP)
        
        # Kẻ bảng BBT
        # Width: 10, Height: 4
        # Rows: 3 (x, y', y)
        line_top = Line(LEFT*5, RIGHT*5).shift(UP*1.5)
        line_mid1 = Line(LEFT*5, RIGHT*5).shift(UP*0.5)
        line_mid2 = Line(LEFT*5, RIGHT*5).shift(DOWN*0.5)
        line_bot = Line(LEFT*5, RIGHT*5).shift(DOWN*2.5)
        line_vert = Line(UP*1.5, DOWN*2.5).shift(LEFT*3.5)
        
        table_lines = VGroup(line_top, line_mid1, line_mid2, line_bot, line_vert)
        
        # Tiêu đề hàng
        x_label = MathTex("x").move_to(np.array([-4.25, 1.0, 0]))
        yprime_label = MathTex("y'").move_to(np.array([-4.25, 0.0, 0]))
        y_label = MathTex("y").move_to(np.array([-4.25, -1.5, 0]))
        labels = VGroup(x_label, yprime_label, y_label)
        
        # Dòng x
        x_val1 = MathTex("-\infty").move_to(np.array([-2.5, 1.0, 0]))
        x_val2 = MathTex("-1").move_to(np.array([-0.5, 1.0, 0]))
        x_val3 = MathTex("1").move_to(np.array([1.5, 1.0, 0]))
        x_val4 = MathTex("+\infty").move_to(np.array([3.5, 1.0, 0]))
        row_x = VGroup(x_val1, x_val2, x_val3, x_val4)
        
        # Dòng y'
        yp_val1 = MathTex("+").move_to(np.array([-1.5, 0.0, 0]))
        yp_val2 = MathTex("0").move_to(np.array([-0.5, 0.0, 0]))
        yp_val3 = MathTex("-").move_to(np.array([0.5, 0.0, 0]))
        yp_val4 = MathTex("0").move_to(np.array([1.5, 0.0, 0]))
        yp_val5 = MathTex("+").move_to(np.array([2.5, 0.0, 0]))
        row_yp = VGroup(yp_val1, yp_val2, yp_val3, yp_val4, yp_val5)
        
        # Dòng y
        y_val1 = MathTex("-\infty").move_to(np.array([-2.5, -2.0, 0]))
        y_val2 = MathTex("4").move_to(np.array([-0.5, -1.0, 0]))
        y_val3 = MathTex("0").move_to(np.array([1.5, -2.0, 0]))
        y_val4 = MathTex("+\infty").move_to(np.array([3.5, -1.0, 0]))
        
        arr1 = Arrow(start=np.array([-2.2, -2.0, 0]), end=np.array([-0.8, -1.0, 0]), buff=0.1, color=YELLOW)
        arr2 = Arrow(start=np.array([-0.2, -1.0, 0]), end=np.array([1.2, -2.0, 0]), buff=0.1, color=YELLOW)
        arr3 = Arrow(start=np.array([1.8, -2.0, 0]), end=np.array([3.2, -1.0, 0]), buff=0.1, color=YELLOW)
        
        row_y = VGroup(y_val1, y_val2, y_val3, y_val4, arr1, arr2, arr3)
        
        with self.voiceover(text="Hãy cùng xem một ví dụ về bảng biến thiên của hàm số bậc ba, mọi chi tiết từ dấu đạo hàm đến mũi tên đồng biến, nghịch biến đều được tính toán và vẽ tự động.") as tracker:
            self.play(Write(bbt_title))
            self.play(Create(table_lines), Write(labels))
            self.play(Write(row_x))
            self.play(Write(row_yp))
            self.play(Write(row_y), run_time=2)
            
        self.wait(1)
        self.play(FadeOut(bbt_title), FadeOut(table_lines), FadeOut(labels), FadeOut(row_x), FadeOut(row_yp), FadeOut(row_y))
        
        # --- Cảnh 3: Kết luận ---
        final_text = MarkupText("Hàng trăm ví dụ đã <span fgcolor='GREEN'>sẵn sàng</span> sử dụng!", font_size=45)
        
        with self.voiceover(text="Hàng trăm ví dụ tương tự đã sẵn sàng để thầy cô sử dụng. Giải phóng hoàn toàn thời gian gõ công thức thủ công.") as tracker:
            self.play(Write(final_text))
            
        self.wait(3)
