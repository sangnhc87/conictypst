import asyncio
import hashlib
import json
import os
import time

import edge_tts
import numpy as np
from manim import *
from manim_voiceover import VoiceoverScene
from manim_voiceover.services.base import SpeechService


BG = "#0b1120"
PANEL = "#111827"
INK = "#e5eefc"
MUTED = "#9fb0c8"
BLUE = "#38bdf8"
GREEN = "#22c55e"
AMBER = "#f59e0b"
ROSE = "#fb7185"
PURPLE = "#a78bfa"
FONT = "Arial"


class EdgeTTSService(SpeechService):
    def __init__(self, voice="vi-VN-NamMinhNeural", rate="+0%", **kwargs):
        super().__init__(**kwargs)
        self.voice = voice
        self.rate = rate

    def generate_from_text(self, text, cache_dir=None, path=None, **kwargs):
        if cache_dir is None:
            cache_dir = self.cache_dir

        input_data = {"text": text, "voice": self.voice, "rate": self.rate}
        dict_hash = hashlib.sha256(
            json.dumps(input_data, sort_keys=True).encode("utf-8")
        ).hexdigest()[:16]
        audio_path = os.path.join(cache_dir, f"{dict_hash}.mp3")

        if not os.path.exists(audio_path) or os.path.getsize(audio_path) < 1024:
            last_error = None
            for attempt in range(5):
                try:
                    if os.path.exists(audio_path):
                        os.remove(audio_path)
                    use_rate = attempt < 3
                    asyncio.run(self._generate_audio(text, audio_path, use_rate=use_rate))
                    if os.path.exists(audio_path) and os.path.getsize(audio_path) >= 1024:
                        break
                except Exception as error:
                    last_error = error
                    if os.path.exists(audio_path):
                        os.remove(audio_path)
                    time.sleep(1.2 + attempt * 0.6)
            else:
                raise last_error or RuntimeError("Edge TTS did not create audio.")

        return {"original_audio": f"{dict_hash}.mp3", "json_dict": input_data}

    async def _generate_audio(self, text, path, use_rate=True):
        kwargs = {"rate": self.rate} if use_rate else {}
        communicate = edge_tts.Communicate(text, self.voice, **kwargs)
        await communicate.save(path)


def txt(content, size=38, color=INK, weight=NORMAL, **kwargs):
    return Text(content, font=FONT, font_size=size, color=color, weight=weight, **kwargs)


def rounded_panel(width, height, color=PANEL, stroke="#263247", opacity=1):
    rect = RoundedRectangle(
        corner_radius=0.18,
        width=width,
        height=height,
        stroke_width=1.4,
        stroke_color=stroke,
        fill_color=color,
        fill_opacity=opacity,
    )
    return rect


def pill(label, color=BLUE):
    bg = RoundedRectangle(
        corner_radius=0.14,
        width=max(1.2, len(label) * 0.15 + 0.45),
        height=0.42,
        stroke_width=0,
        fill_color=color,
        fill_opacity=0.18,
    )
    label_mob = txt(label, size=20, color=color, weight=BOLD)
    return VGroup(bg, label_mob)


def stat_card(value, label, color=BLUE):
    box = rounded_panel(2.15, 1.32, color="#0f172a", stroke="#334155")
    value_t = txt(value, size=38, color=color, weight=BOLD)
    label_t = txt(label, size=18, color=MUTED, weight=BOLD)
    body = VGroup(value_t, label_t).arrange(DOWN, buff=0.08, aligned_edge=LEFT)
    body.move_to(box).align_to(box, LEFT).shift(RIGHT * 0.28)
    return VGroup(box, body)


def screenshot_card(path, title, subtitle, accent=BLUE):
    image = ImageMobject(path)
    image.set_width(8.65)
    frame = rounded_panel(9.1, 5.12, color="#020617", stroke=accent, opacity=1)
    image.move_to(frame)
    cap_bg = RoundedRectangle(
        corner_radius=0.14,
        width=9.1,
        height=0.78,
        stroke_width=0,
        fill_color="#020617",
        fill_opacity=0.9,
    )
    cap_bg.next_to(frame, DOWN, buff=-0.78)
    title_t = txt(title, size=26, color=INK, weight=BOLD)
    sub_t = txt(subtitle, size=17, color=MUTED)
    cap = VGroup(title_t, sub_t).arrange(DOWN, buff=0.06, aligned_edge=LEFT)
    cap.move_to(cap_bg).align_to(cap_bg, LEFT).shift(RIGHT * 0.3)
    return Group(frame, image, cap_bg, cap)


class TypstSystemIntro(VoiceoverScene):
    def narrate(self, text, *animations, run_time=1.8, hold=0.15):
        with self.voiceover(text=text) as tracker:
            if animations:
                self.play(*animations, run_time=min(run_time, max(0.8, tracker.duration * 0.55)))
            self.wait(max(0.1, tracker.duration - run_time + hold))

    def clear(self, *mobs):
        if mobs:
            self.play(*[FadeOut(mob, shift=DOWN * 0.15) for mob in mobs], run_time=0.55)

    def construct(self):
        self.camera.background_color = BG
        self.set_speech_service(EdgeTTSService(voice="vi-VN-NamMinhNeural", rate="+0%"))

        # 1. Opening
        logo = RoundedRectangle(
            corner_radius=0.22,
            width=1.15,
            height=1.15,
            stroke_width=0,
            fill_color=BLUE,
            fill_opacity=1,
        )
        logo_t = txt("T", size=54, color=BG, weight=BOLD).move_to(logo)
        title = txt("ConicTypst", size=72, color=INK, weight=BOLD)
        subtitle = txt("Hệ sinh thái soạn học liệu Toán bằng Typst", size=31, color=MUTED)
        author = txt("GV Nguyễn Văn Sang", size=28, color=BLUE, weight=BOLD)
        heading = VGroup(VGroup(logo, logo_t), title).arrange(RIGHT, buff=0.35)
        opening = VGroup(heading, subtitle, author).arrange(DOWN, buff=0.28)

        self.narrate(
            "Xin chào. Tôi là giáo viên Nguyễn Văn Sang. Đây là ConicTypst, hệ sinh thái tôi đang xây dựng để soạn học liệu Toán bằng Typst.",
            FadeIn(opening, shift=UP * 0.15),
            run_time=2.1,
        )
        self.clear(opening)

        # 2. Problem space and pipeline
        headline = txt("Từ việc rời rạc → một quy trình thống nhất", size=46, color=INK, weight=BOLD)
        headline.to_edge(UP, buff=0.55)
        needs = VGroup(
            pill("Soạn đề", BLUE),
            pill("Ngân hàng câu hỏi", GREEN),
            pill("BBT & CeTZ", AMBER),
            pill("OCR", ROSE),
            pill("Beamer", PURPLE),
            pill("HDSD", BLUE),
        ).arrange(RIGHT, buff=0.22)
        needs.next_to(headline, DOWN, buff=0.46)

        pipeline = VGroup()
        labels = [
            ("Nguồn", "PDF / ảnh / bank"),
            ("Chuẩn hóa", "#tn #ds #tln"),
            ("Kiểm lỗi", "linter / preview"),
            ("Xuất bản", "PDF / web / slide"),
        ]
        colors = [BLUE, GREEN, AMBER, PURPLE]
        for i, (name, desc) in enumerate(labels):
            card = rounded_panel(2.55, 1.5, color="#0f172a", stroke=colors[i])
            name_t = txt(name, size=27, color=colors[i], weight=BOLD)
            desc_t = txt(desc, size=18, color=MUTED)
            body = VGroup(name_t, desc_t).arrange(DOWN, buff=0.14)
            body.move_to(card)
            pipeline.add(VGroup(card, body))
        pipeline.arrange(RIGHT, buff=0.28).move_to(DOWN * 0.2)

        arrows = VGroup()
        for a, b in zip(pipeline[:-1], pipeline[1:]):
            arrows.add(Arrow(a.get_right(), b.get_left(), buff=0.1, color="#64748b", stroke_width=4))

        self.narrate(
            "Một giáo viên Toán mỗi năm phải lặp lại rất nhiều việc: soạn đề, vẽ hình, làm bảng biến thiên, quản lý câu hỏi, trình chiếu và hướng dẫn học sinh. ConicTypst gom các việc đó thành một quy trình thống nhất.",
            FadeIn(headline),
            FadeIn(needs, lag_ratio=0.08),
            run_time=2.3,
        )
        self.play(AnimationGroup(*[FadeIn(card, shift=UP * 0.12) for card in pipeline], lag_ratio=0.12), run_time=1.2)
        self.play(Create(arrows), run_time=0.7)
        self.wait(0.4)
        self.clear(headline, needs, pipeline, arrows)

        # 3. Dashboard
        dashboard = screenshot_card(
            "assets/dashboard.png",
            "Dashboard HDSD",
            "Một màn hình để vào đúng công cụ: đề thi, bank, CeTZ, OCR, Beamer.",
            accent=BLUE,
        )
        dashboard.scale(0.93).move_to(ORIGIN)
        stats = VGroup(
            stat_card("1.553", "câu import", BLUE),
            stat_card("22", "slot THPT", AMBER),
            stat_card("743", "ready", GREEN),
        ).arrange(DOWN, buff=0.18)
        stats.scale(0.72).to_edge(RIGHT, buff=0.42).shift(UP * 0.3)

        self.narrate(
            "Dashboard là cửa vào chính. Ở đây tôi có thể đi thẳng đến ngân hàng câu hỏi, trộn đề, OCR, công cụ CeTZ, Beamer và tài liệu hướng dẫn. Những con số trên dashboard giúp tôi biết hệ thống đang lớn lên đến đâu.",
            FadeIn(dashboard, shift=UP * 0.12),
            run_time=2.2,
        )
        self.play(FadeIn(stats, shift=LEFT * 0.2), run_time=0.8)
        self.wait(0.5)
        self.clear(dashboard, stats)

        # 4. Exam engine and bank
        title2 = txt("Đề thi Typst: chuẩn hóa, trộn mã, giữ ID", size=44, color=INK, weight=BOLD)
        title2.to_edge(UP, buff=0.55)
        code_panel = rounded_panel(5.4, 3.5, color="#020617", stroke="#334155")
        code_lines = VGroup(
            txt("#tn([Câu hỏi...],", size=24, color=BLUE),
            txt("  ([A], True([B]), [C], [D]),", size=24, color=GREEN),
            txt("  loigiai: [ ... ]", size=24, color=AMBER),
            txt(")", size=24, color=BLUE),
        ).arrange(DOWN, buff=0.18, aligned_edge=LEFT)
        code_lines.move_to(code_panel).align_to(code_panel, LEFT).shift(RIGHT * 0.35)
        bank_cards = VGroup(
            stat_card("ID", "đối soát câu", BLUE),
            stat_card("Seed", "trộn ổn định", GREEN),
            stat_card("PDF", "xuất bản", AMBER),
        ).arrange(DOWN, buff=0.2).scale(0.82)
        exam_group = VGroup(VGroup(code_panel, code_lines), bank_cards).arrange(RIGHT, buff=0.55).next_to(title2, DOWN, buff=0.65)

        self.narrate(
            "Phần đề thi dùng macro Typst thống nhất. Mỗi câu có cấu trúc rõ, có đáp án đúng, có lời giải và có ID để đối soát. Khi cần, hệ thống có thể trộn nhiều mã đề bằng seed mà vẫn giữ được bảng đáp án.",
            FadeIn(title2),
            FadeIn(exam_group, shift=UP * 0.18),
            run_time=2.3,
        )
        self.clear(title2, exam_group)

        # 5. CeTZ and BBT visual
        title3 = txt("CeTZ & BBT: hình vẽ sống trong cùng một tài liệu", size=43, color=INK, weight=BOLD)
        title3.to_edge(UP, buff=0.5)
        axes = Axes(
            x_range=[-3, 3, 1],
            y_range=[-2, 3, 1],
            x_length=4.6,
            y_length=3.25,
            axis_config={"color": "#94a3b8", "stroke_width": 2},
            tips=False,
        )
        curve = ParametricFunction(
            lambda t: axes.c2p(t, 0.35 * (t ** 3 - 2.2 * t) + 0.2),
            t_range=[-2.45, 2.45],
            color=BLUE,
            stroke_width=6,
        )
        dot1 = Dot(axes.c2p(-1.2, 0.35 * ((-1.2) ** 3 - 2.2 * (-1.2)) + 0.2), color=AMBER)
        dot2 = Dot(axes.c2p(1.2, 0.35 * ((1.2) ** 3 - 2.2 * 1.2) + 0.2), color=ROSE)
        graph_panel = VGroup(rounded_panel(5.4, 4.25, color="#0f172a", stroke=BLUE), VGroup(axes, curve, dot1, dot2))

        bbt_panel = rounded_panel(5.3, 4.25, color="#0f172a", stroke=GREEN)
        rows = VGroup(
            txt("x       -∞       -1       1       +∞", size=23, color=INK),
            txt("f'(x)        +        0       -       0       +", size=23, color=GREEN),
            txt("f(x)          ↗       CĐ      ↘      CT      ↗", size=23, color=AMBER),
        ).arrange(DOWN, buff=0.35, aligned_edge=LEFT)
        rows.move_to(bbt_panel)
        bbt_group = VGroup(bbt_panel, rows)
        visual = VGroup(graph_panel, bbt_group).arrange(RIGHT, buff=0.35).next_to(title3, DOWN, buff=0.55)

        self.narrate(
            "Với CeTZ và BBT, hình vẽ không còn là ảnh rời khó sửa. Đồ thị, bảng biến thiên, bảng xét dấu và hình không gian đều có thể sinh từ mã Typst, sửa tọa độ là hình cập nhật theo.",
            FadeIn(title3),
            FadeIn(graph_panel[0]),
            Create(axes),
            Create(curve),
            FadeIn(dot1),
            FadeIn(dot2),
            run_time=2.5,
        )
        self.play(FadeIn(bbt_group, shift=LEFT * 0.15), run_time=1.0)
        self.wait(0.4)
        self.clear(title3, visual)

        # 6. Atlas
        atlas = screenshot_card(
            "assets/atlas.png",
            "Sang Math Atlas",
            "Kho chuyên đề và bài giảng sống: 116 học liệu, 73 chuyên đề CD, 43 Beamer.",
            accent=GREEN,
        )
        atlas.scale(0.93).move_to(ORIGIN)
        badge_row = VGroup(
            stat_card("116", "học liệu", BLUE),
            stat_card("73", "CD", GREEN),
            stat_card("43", "Beamer", PURPLE),
        ).arrange(RIGHT, buff=0.2).scale(0.62).to_edge(DOWN, buff=0.35)

        self.narrate(
            "Atlas là nơi tôi gom các chuyên đề tâm đắc để dùng lại hằng năm. Mỗi năm chỉ cần thêm file, cập nhật trạng thái, rồi học liệu cũ và mới cùng nằm trong một bản đồ rõ ràng.",
            FadeIn(atlas, shift=UP * 0.12),
            run_time=2.2,
        )
        self.play(FadeIn(badge_row, shift=UP * 0.1), run_time=0.75)
        self.wait(0.4)
        self.clear(atlas, badge_row)

        # 7. Beamer
        beamer = screenshot_card(
            "assets/beamer.png",
            "Thư viện bài giảng Typst",
            "Mở bài, trình chiếu, quay lại lớp học nhanh hơn.",
            accent=PURPLE,
        )
        beamer.scale(0.95).move_to(ORIGIN)
        slide_icon = VGroup(
            RoundedRectangle(corner_radius=0.12, width=1.15, height=0.78, stroke_color=BLUE, stroke_width=4),
            Line(LEFT * 0.35, RIGHT * 0.35, color=BLUE, stroke_width=4).shift(DOWN * 0.22),
        ).to_edge(RIGHT, buff=0.75).shift(UP * 2.35)

        self.narrate(
            "Phần Beamer giúp tôi biến bài giảng Typst thành thư viện trình chiếu. Khi lên lớp, chỉ cần mở bài, phóng to, sang slide và tập trung vào nhịp giảng với học sinh.",
            FadeIn(beamer, shift=UP * 0.12),
            Create(slide_icon),
            run_time=2.2,
        )
        self.clear(beamer, slide_icon)

        # 8. Web links and public system
        links = screenshot_card(
            "assets/links.png",
            "Một link để nhớ toàn hệ thống",
            "hdsd-conictypst.pages.dev/links",
            accent=AMBER,
        )
        links.scale(0.93).move_to(ORIGIN)
        url = txt("https://hdsd-conictypst.pages.dev/links", size=34, color=AMBER, weight=BOLD)
        url.to_edge(DOWN, buff=0.52)

        self.narrate(
            "Tất cả được đưa lên web để chính tôi và học sinh không phải nhớ nhiều địa chỉ. Một link duy nhất dẫn đến HDSD, Dashboard, Atlas, Beamer và các công cụ thường dùng.",
            FadeIn(links, shift=UP * 0.12),
            run_time=2.2,
        )
        self.play(FadeIn(url, shift=UP * 0.1), run_time=0.6)
        self.wait(0.4)
        self.clear(links, url)

        # 9. Closing
        closing_title = txt("ConicTypst", size=70, color=INK, weight=BOLD)
        closing_sub = txt("Một hệ thống sống, cập nhật theo từng năm học", size=34, color=MUTED)
        closing_quote = txt(
            "Soạn nhanh hơn. Dạy rõ hơn. Học sinh có học liệu bền vững hơn.",
            size=30,
            color=GREEN,
            weight=BOLD,
        )
        closing_url = txt("hdsd-conictypst.pages.dev/links", size=28, color=AMBER, weight=BOLD)
        closing = VGroup(closing_title, closing_sub, closing_quote, closing_url).arrange(DOWN, buff=0.35)

        self.narrate(
            "ConicTypst chưa phải là điểm kết thúc. Nó là một hệ thống sống: mỗi năm tôi dạy, tôi cập nhật thêm; mỗi chuyên đề tốt sẽ được giữ lại; và học sinh có một nguồn học liệu ngày càng rõ ràng hơn.",
            FadeIn(closing, shift=UP * 0.15),
            run_time=2.3,
            hold=0.6,
        )
        self.wait(0.8)
