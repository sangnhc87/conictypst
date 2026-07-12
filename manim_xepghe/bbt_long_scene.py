import os
import hashlib
import json
import subprocess
from manim import *
from manim_voiceover import VoiceoverScene
from manim_voiceover.services.base import SpeechService

class EdgeTTSService(SpeechService):
    def __init__(self, voice="vi-VN-NamMinhNeural", **kwargs):
        super().__init__(**kwargs)
        self.voice = voice
    
    def generate_from_text(self, text, cache_dir=None, path=None, **kwargs):
        if cache_dir is None: cache_dir = self.cache_dir
        input_data = {"text": text, "voice": self.voice}
        dict_hash = hashlib.sha256(json.dumps(input_data, sort_keys=True).encode('utf-8')).hexdigest()[:16]
        audio_path = os.path.join(cache_dir, f"{dict_hash}.mp3")
        
        if not os.path.exists(audio_path) or os.path.getsize(audio_path) == 0:
            print(f"Generating audio for: {text[:30]}...")
            subprocess.run(["edge-tts", "--voice", self.voice, "--text", text, "--write-media", audio_path], check=True)
            
        if os.path.exists(audio_path) and os.path.getsize(audio_path) > 0:
            return {"original_audio": f"{dict_hash}.mp3", "json_dict": input_data}
        else:
            raise Exception("Generated audio file is empty or missing")

class BBTLongScene(VoiceoverScene):
    def construct(self):
        self.set_speech_service(EdgeTTSService(voice="vi-VN-NamMinhNeural"))
        
        # Watermark
        watermark = Text("Nguyễn Văn Sang - THPT Nguyễn Hữu Cảnh", font_size=20, color=GRAY)
        watermark.to_corner(DR)
        self.add(watermark)
        
        # --- Cảnh 1: Lời giới thiệu ---
        title = MarkupText("<span fgcolor='RED'>GÓI LỆNH</span> <span fgcolor='YELLOW'>BẢNG BIẾN THIÊN</span>", font_size=60, weight=BOLD)
        subtitle = Text("Đỉnh cao tự động hoá Toán học", font_size=35, color=WHITE)
        VGroup(title, subtitle).arrange(DOWN, buff=0.5).move_to(ORIGIN)
        
        with self.voiceover(text="Xin chào quý thầy cô. Hôm nay, chúng tôi xin giới thiệu siêu gói lệnh Typst Bảng biến thiên - một công cụ đột phá giúp vẽ hàng trăm bảng biến thiên tự động siêu tốc và chuẩn xác.") as tracker:
            self.play(Write(title))
            self.play(FadeIn(subtitle, shift=UP))
        self.wait(0.5)
        self.play(FadeOut(title), FadeOut(subtitle))
        
        # Hàm hỗ trợ kẻ bảng
        def draw_table_lines(color=TEAL, double_bar_x=None):
            line_top = Line(LEFT*5.5, RIGHT*5.5, color=color).shift(UP*1.5)
            line_mid1 = Line(LEFT*5.5, RIGHT*5.5, color=color).shift(UP*0.5)
            line_mid2 = Line(LEFT*5.5, RIGHT*5.5, color=color).shift(DOWN*0.5)
            line_bot = Line(LEFT*5.5, RIGHT*5.5, color=color).shift(DOWN*2.5)
            line_vert = Line(UP*1.5, DOWN*2.5, color=color).shift(LEFT*4.0)
            
            lines = VGroup(line_top, line_mid1, line_mid2, line_bot, line_vert)
            
            if double_bar_x is not None:
                d1 = Line(UP*0.5, DOWN*2.5, color=RED).move_to(np.array([double_bar_x - 0.05, -1.0, 0]))
                d2 = Line(UP*0.5, DOWN*2.5, color=RED).move_to(np.array([double_bar_x + 0.05, -1.0, 0]))
                lines.add(d1, d2)
                
            labels = VGroup(
                MathTex("x", color=WHITE).move_to(np.array([-4.75, 1.0, 0])),
                MathTex("y'", color=WHITE).move_to(np.array([-4.75, 0.0, 0])),
                MathTex("y", color=WHITE).move_to(np.array([-4.75, -1.5, 0]))
            )
            return lines, labels
            
        # --- Cảnh 2: Bậc 3 ---
        bbt_title_1 = VGroup(
            Text("Ví dụ 1: Hàm bậc 3 ", font_size=30, color=BLUE_B),
            MathTex("y = x^3 - 3x + 2", font_size=35, color=BLUE_B)
        ).arrange(RIGHT).to_edge(UP)
        
        lines1, labels1 = draw_table_lines(color=TEAL)
        
        row_x_1 = VGroup(
            MathTex(r"-\infty").move_to(np.array([-3.0, 1.0, 0])),
            MathTex("-1").move_to(np.array([-0.5, 1.0, 0])),
            MathTex("1").move_to(np.array([2.0, 1.0, 0])),
            MathTex(r"+\infty").move_to(np.array([4.5, 1.0, 0]))
        )
        row_yp_1 = VGroup(
            MathTex("+", color=GREEN).move_to(np.array([-1.75, 0.0, 0])),
            MathTex("0", color=WHITE).move_to(np.array([-0.5, 0.0, 0])),
            MathTex("-", color=RED).move_to(np.array([0.75, 0.0, 0])),
            MathTex("0", color=WHITE).move_to(np.array([2.0, 0.0, 0])),
            MathTex("+", color=GREEN).move_to(np.array([3.25, 0.0, 0]))
        )
        row_y_1 = VGroup(
            MathTex(r"-\infty").move_to(np.array([-3.0, -2.0, 0])),
            MathTex("4", color=GOLD).move_to(np.array([-0.5, -1.0, 0])),
            MathTex("0", color=GOLD).move_to(np.array([2.0, -2.0, 0])),
            MathTex(r"+\infty").move_to(np.array([4.5, -1.0, 0])),
            Arrow(start=np.array([-2.5, -2.0, 0]), end=np.array([-1.0, -1.0, 0]), buff=0.1, color=GOLD),
            Arrow(start=np.array([0.0, -1.0, 0]), end=np.array([1.5, -2.0, 0]), buff=0.1, color=GOLD),
            Arrow(start=np.array([2.5, -2.0, 0]), end=np.array([4.0, -1.0, 0]), buff=0.1, color=GOLD)
        )
        
        with self.voiceover(text="Đầu tiên là hàm số bậc ba quen thuộc. Chỉ với một câu lệnh ngắn, hệ thống tự động tính đạo hàm, xét dấu và điền các mũi tên đồng biến, nghịch biến một cách hoàn hảo.") as tracker:
            self.play(Write(bbt_title_1))
            self.play(Create(lines1), Write(labels1))
            self.play(Write(row_x_1))
            self.play(Write(row_yp_1))
            self.play(Write(row_y_1), run_time=2.5)
            
        self.wait(1)
        self.play(FadeOut(bbt_title_1), FadeOut(lines1), FadeOut(labels1), FadeOut(row_x_1), FadeOut(row_yp_1), FadeOut(row_y_1))

        # --- Cảnh 3: Trùng phương ---
        bbt_title_2 = VGroup(
            Text("Ví dụ 2: Hàm trùng phương ", font_size=30, color=PURPLE_B),
            MathTex("y = -x^4 + 2x^2 + 1", font_size=35, color=PURPLE_B)
        ).arrange(RIGHT).to_edge(UP)
        
        lines2, labels2 = draw_table_lines(color=PURPLE)
        
        row_x_2 = VGroup(
            MathTex(r"-\infty").move_to(np.array([-3.0, 1.0, 0])),
            MathTex("-1").move_to(np.array([-1.2, 1.0, 0])),
            MathTex("0").move_to(np.array([0.6, 1.0, 0])),
            MathTex("1").move_to(np.array([2.4, 1.0, 0])),
            MathTex(r"+\infty").move_to(np.array([4.2, 1.0, 0]))
        )
        row_yp_2 = VGroup(
            MathTex("+", color=GREEN).move_to(np.array([-2.1, 0.0, 0])),
            MathTex("0", color=WHITE).move_to(np.array([-1.2, 0.0, 0])),
            MathTex("-", color=RED).move_to(np.array([-0.3, 0.0, 0])),
            MathTex("0", color=WHITE).move_to(np.array([0.6, 0.0, 0])),
            MathTex("+", color=GREEN).move_to(np.array([1.5, 0.0, 0])),
            MathTex("0", color=WHITE).move_to(np.array([2.4, 0.0, 0])),
            MathTex("-", color=RED).move_to(np.array([3.3, 0.0, 0]))
        )
        row_y_2 = VGroup(
            MathTex(r"-\infty").move_to(np.array([-3.0, -2.0, 0])),
            MathTex("2", color=PINK).move_to(np.array([-1.2, -1.0, 0])),
            MathTex("1", color=PINK).move_to(np.array([0.6, -2.0, 0])),
            MathTex("2", color=PINK).move_to(np.array([2.4, -1.0, 0])),
            MathTex(r"-\infty").move_to(np.array([4.2, -2.0, 0])),
            Arrow(start=np.array([-2.6, -2.0, 0]), end=np.array([-1.6, -1.0, 0]), buff=0.1, color=PINK),
            Arrow(start=np.array([-0.8, -1.0, 0]), end=np.array([0.2, -2.0, 0]), buff=0.1, color=PINK),
            Arrow(start=np.array([1.0, -2.0, 0]), end=np.array([2.0, -1.0, 0]), buff=0.1, color=PINK),
            Arrow(start=np.array([2.8, -1.0, 0]), end=np.array([3.8, -2.0, 0]), buff=0.1, color=PINK)
        )
        
        with self.voiceover(text="Tiếp theo là hàm số trùng phương với ba điểm cực trị. Khả năng tự động căn chỉnh khoảng cách giữa các số, giúp bảng luôn cân đối và đẹp mắt.") as tracker:
            self.play(Write(bbt_title_2))
            self.play(Create(lines2), Write(labels2))
            self.play(Write(row_x_2))
            self.play(Write(row_yp_2))
            self.play(Write(row_y_2), run_time=3)
            
        self.wait(1)
        self.play(FadeOut(bbt_title_2), FadeOut(lines2), FadeOut(labels2), FadeOut(row_x_2), FadeOut(row_yp_2), FadeOut(row_y_2))
        
        # --- Cảnh 4: Phân thức ---
        bbt_title_3 = VGroup(
            Text("Ví dụ 3: Hàm phân thức ", font_size=30, color=ORANGE),
            MathTex(r"y = \frac{2x - 1}{x - 1}", font_size=40, color=ORANGE)
        ).arrange(RIGHT).to_edge(UP)
        
        lines3, labels3 = draw_table_lines(color=ORANGE, double_bar_x=0.5)
        
        row_x_3 = VGroup(
            MathTex(r"-\infty").move_to(np.array([-3.0, 1.0, 0])),
            MathTex("1").move_to(np.array([0.5, 1.0, 0])),
            MathTex(r"+\infty").move_to(np.array([4.0, 1.0, 0]))
        )
        row_yp_3 = VGroup(
            MathTex("-", color=RED).move_to(np.array([-1.25, 0.0, 0])),
            MathTex("-", color=RED).move_to(np.array([2.25, 0.0, 0]))
        )
        row_y_3 = VGroup(
            MathTex("2").move_to(np.array([-3.0, -1.0, 0])),
            MathTex(r"-\infty").move_to(np.array([-0.2, -2.0, 0])),
            MathTex(r"+\infty").move_to(np.array([1.2, -1.0, 0])),
            MathTex("2").move_to(np.array([4.0, -2.0, 0])),
            Arrow(start=np.array([-2.4, -1.0, 0]), end=np.array([-0.8, -2.0, 0]), buff=0.1, color=BLUE_C),
            Arrow(start=np.array([1.8, -1.0, 0]), end=np.array([3.4, -2.0, 0]), buff=0.1, color=BLUE_C)
        )
        
        with self.voiceover(text="Ngay cả với hàm phân thức phức tạp có đường tiệm cận đứng, gói lệnh vẫn tự động kẻ vạch đôi song song và điền chính xác giới hạn tại vô cực.") as tracker:
            self.play(Write(bbt_title_3))
            self.play(Create(lines3), Write(labels3))
            self.play(Write(row_x_3))
            self.play(Write(row_yp_3))
            self.play(Write(row_y_3), run_time=2.5)
            
        self.wait(1)
        self.play(FadeOut(bbt_title_3), FadeOut(lines3), FadeOut(labels3), FadeOut(row_x_3), FadeOut(row_yp_3), FadeOut(row_y_3))
        
        # --- Cảnh 5: Kết luận ---
        final_text = MarkupText("Đã có sẵn <span fgcolor='GREEN'>100+</span> ví dụ thực chiến", font_size=45)
        sub_text = Text("Giải pháp hoàn hảo cho giáo án Toán", font_size=30, color=WHITE).next_to(final_text, DOWN, buff=0.5)
        
        with self.voiceover(text="Không chỉ ba, mà có tới hơn một trăm ví dụ thực chiến đã được biên soạn sẵn. Một giải pháp tuyệt vời để soạn giáo án và đề thi. Hãy trải nghiệm ngay hôm nay!") as tracker:
            self.play(Write(final_text))
            self.play(FadeIn(sub_text, shift=UP))
            
        self.wait(3)
