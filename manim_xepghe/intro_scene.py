import asyncio
import os
import hashlib
import json
import edge_tts
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

class IntroTypst(VoiceoverScene):
    def construct(self):
        # 0. Setup Giọng Nam
        self.set_speech_service(EdgeTTSService(voice="vi-VN-NamMinhNeural"))
        
        # --- Cảnh 1: Tiêu đề ---
        title = MarkupText("<span fgcolor='YELLOW'>HỆ SINH THÁI TYPST</span>", font_size=60, weight=BOLD)
        subtitle = Text("Biên soạn Toán Học Thế Hệ Mới", font_size=36, color=WHITE)
        VGroup(title, subtitle).arrange(DOWN, buff=0.5).move_to(ORIGIN)
        
        with self.voiceover(text="Xin chào các thầy cô và các bạn. Chào mừng đến với hệ thống Typst thế hệ mới.") as tracker:
            self.play(Write(title))
            self.play(FadeIn(subtitle, shift=UP))
            
        self.wait(0.5)
        self.play(FadeOut(title), FadeOut(subtitle))
        
        # --- Cảnh 2: Tính năng cốt lõi ---
        core_features_title = Text("Giải pháp toàn diện", font_size=45, color=BLUE)
        core_features_title.to_edge(UP)
        
        box_book = VGroup(
            RoundedRectangle(corner_radius=0.2, height=1.5, width=2.5, color=GREEN, fill_opacity=0.3),
            Text("Sách & Đề", font_size=30)
        )
        box_math = VGroup(
            RoundedRectangle(corner_radius=0.2, height=1.5, width=2.5, color=RED, fill_opacity=0.3),
            Text("Toán & Cetz", font_size=30)
        )
        box_export = VGroup(
            RoundedRectangle(corner_radius=0.2, height=1.5, width=2.5, color=PURPLE, fill_opacity=0.3),
            Text("SCORM", font_size=30)
        )
        features = VGroup(box_book, box_math, box_export).arrange(RIGHT, buff=1.0)
        
        with self.voiceover(text="Một giải pháp toàn diện giúp soạn thảo siêu tốc, tự động hóa hình vẽ Toán học, và tối ưu hóa thời gian xuất bản sách, đề thi, hay hệ thống trực tuyến.") as tracker:
            self.play(Write(core_features_title))
            self.play(AnimationGroup(
                Create(box_book[0]), Write(box_book[1]),
                Create(box_math[0]), Write(box_math[1]),
                Create(box_export[0]), Write(box_export[1]),
                lag_ratio=0.3
            ))
            
        self.wait(0.5)
        self.play(FadeOut(features), FadeOut(core_features_title))
        
        # --- Cảnh 3: Hoạt hình Manim ---
        manim_title = Text("Sức mạnh của Hoạt hình", font_size=45, color=YELLOW)
        manim_title.to_edge(UP)
        
        axes = Axes(
            x_range=[-3, 3, 1],
            y_range=[-2, 8, 2],
            x_length=6,
            y_length=4,
            axis_config={"color": BLUE},
        )
        graph = axes.plot(lambda x: x**2, color=RED)
        math_equation = MathTex("y = x^2", font_size=40).next_to(graph, RIGHT)
        
        with self.voiceover(text="Đặc biệt, hệ thống không chỉ dừng lại ở tài liệu in ấn, mà còn tự động sinh ra các vi đê ô bài giảng hoạt hình cực kì sinh động và trực quan.") as tracker:
            self.play(Write(manim_title))
            self.play(Create(axes))
            self.play(Create(graph), run_time=2)
            self.play(Write(math_equation))
            
        self.wait(1)
        self.play(FadeOut(axes), FadeOut(graph), FadeOut(math_equation), FadeOut(manim_title))
        
        # --- Cảnh 4: Lời Kết ---
        final_text = MarkupText("Tất cả chỉ với <span fgcolor='RED'>một dòng lệnh</span>", font_size=50)
        logo = Text("Typst - Nâng tầm Toán học", font_size=36, color=GREEN).next_to(final_text, DOWN, buff=0.5)
        
        with self.voiceover(text="Tất cả mọi thứ... được giải quyết tự động chỉ với một vài dòng lệnh đơn giản. Hãy cùng trải nghiệm ngay hôm nay!") as tracker:
            self.play(Write(final_text))
            self.play(FadeIn(logo, scale=1.5))
            
        self.wait(3)
