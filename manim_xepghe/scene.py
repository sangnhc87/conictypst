import asyncio
import os
import hashlib
import json
import edge_tts
from manim import *
from manim_voiceover import VoiceoverScene
from manim_voiceover.services.base import SpeechService

class EdgeTTSService(SpeechService):
    def __init__(self, voice="vi-VN-HoaiMyNeural", **kwargs):
        super().__init__(**kwargs)
        self.voice = voice
    
    def generate_from_text(self, text, cache_dir=None, path=None, **kwargs):
        if cache_dir is None:
            cache_dir = self.cache_dir
        
        input_data = {"text": text, "voice": self.voice}
        dict_hash = hashlib.sha256(json.dumps(input_data, sort_keys=True).encode('utf-8')).hexdigest()[:16]
        audio_path = os.path.join(cache_dir, f"{dict_hash}.mp3")
        
        if not os.path.exists(audio_path):
            asyncio.run(self._generate_audio(text, audio_path))
        
        return {"original_audio": f"{dict_hash}.mp3", "json_dict": input_data}
        
    async def _generate_audio(self, text, path):
        communicate = edge_tts.Communicate(text, self.voice)
        await communicate.save(path)

class XepGheProblem(VoiceoverScene):
    def construct(self):
        # Thiết lập giọng đọc Nam miền Nam chất lượng cao
        self.set_speech_service(EdgeTTSService(voice="vi-VN-HoaiMyNeural"))
        
        # 1. TIÊU ĐỀ
        title = Text("BÀI TOÁN XẾP GHẾ", font_size=50, color=YELLOW, weight=BOLD)
        with self.voiceover(text="Chào các bạn. Hôm nay chúng ta sẽ giải quyết bài toán xếp ghế.") as tracker:
            self.play(Write(title))
        self.wait(0.5)
        self.play(title.animate.to_edge(UP))

        # 2. HIỂN THỊ ĐỀ BÀI (Xóa sau khi đọc xong)
        problem_group = VGroup()
        line1 = MarkupText("Có <span fgcolor='RED'>2 HS lớp A</span>, <span fgcolor='BLUE'>2 HS lớp B</span> và <span fgcolor='GREEN'>2 HS lớp C</span>.", font_size=36)
        line2 = MarkupText("Xếp vào 6 ghế chia thành 2 hàng đối diện.", font_size=36)
        line3 = MarkupText("ĐK: Không có 2 HS cùng lớp nào ngồi kề", font_size=36)
        line4 = MarkupText("hoặc ngồi đối diện nhau.", font_size=36)
        
        problem_group.add(line1, line2, line3, line4)
        problem_group.arrange(DOWN, buff=0.3)
        problem_group.move_to(ORIGIN)
        
        with self.voiceover(text="Đề bài cho hai học sinh lớp A, hai học sinh lớp B, và hai học sinh lớp C.") as tracker:
            self.play(Write(line1))
        
        with self.voiceover(text="Xếp sáu học sinh này vào sáu chiếc ghế được chia thành hai hàng đối diện nhau.") as tracker:
            self.play(Write(line2))
            
        with self.voiceover(text="Điều kiện là: Không có hai học sinh cùng lớp nào được ngồi kề hoặc ngồi đối diện nhau.") as tracker:
            self.play(Write(line3), Write(line4))
            
        self.wait(1)
        
        # XÓA BẢNG ĐỀ BÀI ĐỂ LẤY CHỖ VẼ HÌNH
        with self.voiceover(text="Chúng ta cùng bắt đầu phân tích nhé.") as tracker:
            self.play(FadeOut(problem_group))

        # 3. VẼ MÔ HÌNH HỌC SINH VÀ GHẾ (NỬA TRÊN MÀN HÌNH)
        # Vẽ ghế
        chairs = VGroup()
        for row in range(2):
            for col in range(3):
                chair = Square(side_length=1.2, color=WHITE)
                chair.set_fill(DARK_GRAY, opacity=0.8)
                x_pos = (col - 1) * 2.0
                y_pos = (row - 0.5) * -1.5
                chair.move_to([x_pos, y_pos, 0])
                chairs.add(chair)
        chairs.move_to(UP * 1.5)

        with self.voiceover(text="Đây là sáu chiếc ghế được xếp thành hai hàng đối diện.") as tracker:
            self.play(AnimationGroup(*[Create(c) for c in chairs], lag_ratio=0.1))

        # Vẽ học sinh
        students = VGroup()
        colors = [RED, RED, BLUE, BLUE, GREEN, GREEN]
        labels = ["A", "A", "B", "B", "C", "C"]
        for i in range(6):
            student = Circle(radius=0.4, color=colors[i], fill_opacity=0.9)
            label = Text(labels[i], font_size=32, color=WHITE, weight=BOLD)
            label.move_to(student.get_center())
            students.add(VGroup(student, label))
        
        students.arrange(RIGHT, buff=0.4)
        students.next_to(chairs, DOWN, buff=1.5)
        
        with self.voiceover(text="Và đây là sáu học sinh tương ứng.") as tracker:
            self.play(FadeIn(students, shift=UP))
        self.wait(1)

        # 4. TRÌNH BÀY LỜI GIẢI (NỬA DƯỚI MÀN HÌNH - TỪNG DÒNG MỘT)
        
        sol_step1 = MarkupText("Hai HS cùng lớp không được kề hay đối diện.", font_size=36, color=YELLOW)
        sol_step1.to_edge(DOWN).shift(UP * 1.5)
        
        with self.voiceover(text="Do không có hai học sinh cùng lớp nào ngồi kề hay đối diện...") as tracker:
            self.play(Write(sol_step1))
            
        sol_step2 = MarkupText("=> Mỗi cột (2 ghế đối diện) chứa 2 HS khác lớp.", font_size=36, color=GREEN)
        sol_step2.next_to(sol_step1, DOWN, buff=0.3)
        
        with self.voiceover(text="Nên mỗi cột dọc gồm hai ghế đối diện, bắt buộc phải chứa hai bạn khác lớp.") as tracker:
            self.play(Write(sol_step2))
            
        # Vẽ khung vàng
        cols = VGroup()
        for col in range(3):
            rect = SurroundingRectangle(VGroup(chairs[col], chairs[col+3]), color=YELLOW, buff=0.15)
            cols.add(rect)
        
        with self.voiceover(text="Đây là ba cột dọc của chúng ta.") as tracker:
            self.play(Create(cols[0]), Create(cols[1]), Create(cols[2]))

        # XÓA TEXT LỜI GIẢI CŨ ĐỂ HIỆN TEXT MỚI
        self.play(FadeOut(sol_step1), FadeOut(sol_step2))

        sol_step3 = MarkupText("Vậy 3 cột phải tương ứng với 3 cặp: {A,B}, {B,C}, {C,A}.", font_size=36)
        sol_step3.to_edge(DOWN).shift(UP * 1.5)
        
        with self.voiceover(text="Suy ra, ba cột dọc này chính là ba tổ hợp: Cột A B, cột B C, và cột C A.") as tracker:
            self.play(Write(sol_step3))
            
        # Xếp thử học sinh
        mapping = [0, 4, 2, 3, 1, 5]
        target_positions = [
            chairs[0].get_center(), chairs[1].get_center(), chairs[2].get_center(),
            chairs[3].get_center(), chairs[4].get_center(), chairs[5].get_center()
        ]
        with self.voiceover(text="Ví dụ, ta xếp ngẫu nhiên một trường hợp thỏa mãn như trên hình.") as tracker:
            self.play(
                AnimationGroup(
                    *[students[mapping[i]].animate.move_to(target_positions[i]) for i in range(6)],
                    lag_ratio=0.1, run_time=2
                )
            )

        self.play(FadeOut(sol_step3))

        sol_step4 = MarkupText("B1: Xếp 3 cặp vào 3 cột -> Có 3! = 6 (cách).", font_size=36)
        sol_step4.to_edge(DOWN).shift(UP * 1.5)
        
        with self.voiceover(text="Bước một, xếp ba cặp này vào ba cột, ta có ba giai thừa, bằng 6 cách.") as tracker:
            self.play(Write(sol_step4))
            
        sol_step5 = MarkupText("B2: Hoán vị 2 HS trong mỗi cột -> 2^3 = 8 (cách).", font_size=36)
        sol_step5.next_to(sol_step4, DOWN, buff=0.3)
        
        with self.voiceover(text="Bước hai, trong mỗi cột, ta có hai cách hoán vị học sinh, nên có hai mũ ba, bằng 8 cách.") as tracker:
            self.play(Write(sol_step5))
            
        self.play(FadeOut(sol_step4), FadeOut(sol_step5))

        sol_step6 = MarkupText("=> Số cách xếp: 6 x 8 = 48 (cách).", font_size=45, color=RED, weight=BOLD)
        sol_step6.to_edge(DOWN).shift(UP * 1.0)
        
        with self.voiceover(text="Vậy, số cách xếp ghế thỏa mãn bài toán là 6 nhân 8, bằng 48 cách.") as tracker:
            self.play(Write(sol_step6))
            
        self.wait(3)
