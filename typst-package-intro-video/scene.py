import asyncio
import hashlib
import json
import os
import time

import edge_tts
from manim import *
from manim_voiceover import VoiceoverScene
from manim_voiceover.services.base import SpeechService


BG = "#08111f"
PANEL = "#0f172a"
INK = "#eef6ff"
MUTED = "#a8b6cc"
BLUE = "#38bdf8"
GREEN = "#22c55e"
AMBER = "#f59e0b"
ROSE = "#fb7185"
PURPLE = "#a78bfa"
TEAL = "#14b8a6"
FONT = "Arial"
MONO = "Menlo"


class EdgeTTSService(SpeechService):
    def __init__(self, voice="vi-VN-NamMinhNeural", **kwargs):
        super().__init__(**kwargs)
        self.voice = voice

    def generate_from_text(self, text, cache_dir=None, path=None, **kwargs):
        if cache_dir is None:
            cache_dir = self.cache_dir

        input_data = {"text": text, "voice": self.voice}
        dict_hash = hashlib.sha256(
            json.dumps(input_data, sort_keys=True).encode("utf-8")
        ).hexdigest()[:16]
        audio_path = os.path.join(cache_dir, f"{dict_hash}.mp3")

        if not os.path.exists(audio_path) or os.path.getsize(audio_path) < 1024:
            last_error = None
            for attempt in range(6):
                try:
                    if os.path.exists(audio_path):
                        os.remove(audio_path)
                    asyncio.run(self._generate_audio(text, audio_path))
                    if os.path.exists(audio_path) and os.path.getsize(audio_path) >= 1024:
                        break
                except Exception as error:
                    last_error = error
                    if os.path.exists(audio_path):
                        os.remove(audio_path)
                    time.sleep(1.5 + attempt * 0.7)
            else:
                raise last_error or RuntimeError("Edge TTS did not create audio.")

        return {"original_audio": f"{dict_hash}.mp3", "json_dict": input_data}

    async def _generate_audio(self, text, path):
        communicate = edge_tts.Communicate(text, self.voice)
        await communicate.save(path)


def t(content, size=34, color=INK, weight=NORMAL, font=FONT, **kwargs):
    return Text(content, font=font, font_size=size, color=color, weight=weight, **kwargs)


def panel(width, height, stroke=BLUE, fill=PANEL):
    return RoundedRectangle(
        corner_radius=0.18,
        width=width,
        height=height,
        stroke_width=1.5,
        stroke_color=stroke,
        fill_color=fill,
        fill_opacity=1,
    )


def code_panel(lines, width=5.65, height=3.2, title="Typst", accent=BLUE, font_size=22):
    box = panel(width, height, stroke=accent, fill="#020617")
    top = RoundedRectangle(
        corner_radius=0.15,
        width=width,
        height=0.48,
        stroke_width=0,
        fill_color=accent,
        fill_opacity=0.2,
    )
    top.align_to(box, UP).move_to(box.get_top() + DOWN * 0.24)
    title_mob = t(title, size=18, color=accent, weight=BOLD)
    title_mob.move_to(top).align_to(top, LEFT).shift(RIGHT * 0.28)
    rows = VGroup(*[t(line, size=font_size, color=INK, font=MONO) for line in lines])
    rows.arrange(DOWN, buff=0.13, aligned_edge=LEFT)
    rows.move_to(box).align_to(box, LEFT).shift(RIGHT * 0.35 + DOWN * 0.18)
    return VGroup(box, top, title_mob, rows)


def macro_card(name, desc, color=BLUE, width=2.65):
    box = panel(width, 1.18, stroke=color, fill="#0b1220")
    name_mob = t(name, size=25, color=color, weight=BOLD, font=MONO)
    desc_mob = t(desc, size=16, color=MUTED)
    body = VGroup(name_mob, desc_mob).arrange(DOWN, buff=0.08)
    body.move_to(box)
    return VGroup(box, body)


def brand_label():
    label = t(
        "Nguyễn Văn Sang - THPT Nguyễn Hữu Cảnh",
        size=15,
        color=MUTED,
        weight=BOLD,
    )
    bg = RoundedRectangle(
        corner_radius=0.12,
        width=label.width + 0.38,
        height=0.38,
        stroke_width=0.8,
        stroke_color="#24324a",
        fill_color="#020617",
        fill_opacity=0.86,
    )
    label.move_to(bg)
    group = VGroup(bg, label).to_corner(UL, buff=0.2)
    group.set_z_index(100)
    return group


def mini_bbt():
    image = ImageMobject("assets/bbt-example.png")
    image.scale_to_fit_width(5.85)
    frame = RoundedRectangle(
        corner_radius=0.12,
        width=image.width + 0.16,
        height=image.height + 0.16,
        stroke_width=1.8,
        stroke_color=GREEN,
        fill_color="#f8fafc",
        fill_opacity=1,
    ).move_to(image)
    return Group(frame, image)


def example_badge(text="Ví dụ"):
    label = t(text, size=15, color="#04111f", weight=BOLD)
    box = RoundedRectangle(
        corner_radius=0.11,
        width=max(1.05, label.width + 0.38),
        height=0.42,
        stroke_width=0,
        fill_color=GREEN,
        fill_opacity=0.9,
    )
    label.move_to(box)
    return VGroup(box, label)


def option_row():
    row = VGroup()
    labels = [("A", BLUE), ("B", GREEN), ("C", AMBER), ("D", ROSE)]
    for label, color in labels:
        circle = Circle(radius=0.28, stroke_color=color, stroke_width=3, fill_color=color, fill_opacity=0.18)
        lab = t(label, size=22, color=color, weight=BOLD)
        row.add(VGroup(circle, lab.move_to(circle)))
    row.arrange(RIGHT, buff=0.35)
    return row


def theme_swatches():
    names = [
        ("teal", TEAL),
        ("aurora", PURPLE),
        ("navy", AMBER),
        ("royal", BLUE),
    ]
    swatches = VGroup()
    for name, color in names:
        swatch = RoundedRectangle(
            corner_radius=0.1,
            width=1.24,
            height=0.62,
            stroke_width=0,
            fill_color=color,
            fill_opacity=0.85,
        )
        label = t(name, size=14, color="#06111f", weight=BOLD)
        swatches.add(VGroup(swatch, label.move_to(swatch)))
    swatches.arrange(RIGHT, buff=0.18)
    return swatches


class SangMathPackageIntro(VoiceoverScene):
    def narrate(self, text, *animations, run_time=1.8, hold=0.15):
        with self.voiceover(text=text) as tracker:
            if animations:
                self.play(*animations, run_time=min(run_time, max(0.8, tracker.duration * 0.52)))
            self.wait(max(0.1, tracker.duration - run_time + hold))

    def clear(self, *mobs):
        if mobs:
            self.play(*[FadeOut(mob, shift=DOWN * 0.12) for mob in mobs], run_time=0.55)

    def construct(self):
        self.camera.background_color = BG
        self.set_speech_service(EdgeTTSService(voice="vi-VN-NamMinhNeural"))
        self.add(brand_label())

        # 1. Opening
        mark = RoundedRectangle(corner_radius=0.22, width=1.18, height=1.18, stroke_width=0, fill_color=BLUE)
        mark_text = t("S", size=54, color=BG, weight=BOLD).move_to(mark)
        title = t("sang-math", size=72, color=INK, weight=BOLD)
        subtitle = t("Bộ macro Toán THPT Việt Nam cho Typst", size=34, color=MUTED)
        author = t("Nguyễn Văn Sang - THPT Nguyễn Hữu Cảnh", size=28, color=BLUE, weight=BOLD)
        opening = VGroup(VGroup(mark, mark_text, title).arrange(RIGHT, buff=0.32), subtitle, author).arrange(DOWN, buff=0.28)

        self.narrate(
            "Xin chào, tôi là Nguyễn Văn Sang, giáo viên trường Trung học phổ thông Nguyễn Hữu Cảnh. Đây là sang-math: bộ macro Typst tôi xây dựng để soạn đề, lời giải, bảng biến thiên và học liệu Toán trung học phổ thông gọn hơn.",
            FadeIn(opening, shift=UP * 0.15),
            run_time=2.0,
        )
        self.clear(opening)

        # 2. Import and modules
        heading = t("Một import, sáu nhóm công cụ", size=46, color=INK, weight=BOLD)
        heading.to_edge(UP, buff=0.55)
        import_code = code_panel(
            ['#import "@preview/sang-math:1.0.0": *'],
            width=7.45,
            height=1.55,
            title="entry point",
            accent=BLUE,
            font_size=20,
        )
        modules = VGroup(
            macro_card("bbt.typ", "BBT, BXD", GREEN),
            macro_card("sang-exam", "tn, ds, tln, tl", BLUE),
            macro_card("exam themes", "18 mẫu đề", PURPLE),
            macro_card("book themes", "sách, SGK", AMBER),
            macro_card("math-sym", "ký hiệu tắt", ROSE),
            macro_card("geometry", "CeTZ hình học", TEAL),
        ).arrange_in_grid(rows=2, cols=3, buff=(0.24, 0.22))
        group = VGroup(import_code, modules).arrange(DOWN, buff=0.55).next_to(heading, DOWN, buff=0.45)

        self.narrate(
            "Trên màn hình là toàn bộ điểm vào của package. Một dòng import mở ra sáu nhóm công cụ: bảng biến thiên, câu hỏi đề thi, giao diện đề, giao diện sách, ký hiệu toán và hình học CeTZ.",
            FadeIn(heading),
            FadeIn(import_code, shift=UP * 0.12),
            run_time=2.2,
        )
        self.play(AnimationGroup(*[FadeIn(m, shift=UP * 0.1) for m in modules], lag_ratio=0.08), run_time=1.2)
        self.wait(0.4)
        self.clear(heading, group)

        # 3. Exam commands
        heading = t("Nhóm đề thi: viết đúng cấu trúc, bật/tắt lời giải", size=41, color=INK, weight=BOLD)
        heading.to_edge(UP, buff=0.55)
        exam_code = code_panel(
            [
                "#let (tn, ds, tln, tl) =",
                '  exam-mode(mode: "dethi")',
                "#tn([Câu hỏi...],",
                "  ([A], True([B]), [C], [D]),",
                "  loigiai: [Lời giải...],",
                ")",
            ],
            width=6.25,
            height=4.45,
            title="sang-exam.typ",
            accent=BLUE,
            font_size=19,
        )
        exam_cards = VGroup(
            macro_card("#tn", "trắc nghiệm", BLUE),
            macro_card("#ds", "đúng / sai", GREEN),
            macro_card("#tln", "trả lời ngắn", AMBER),
            macro_card("#tl", "tự luận", ROSE),
        ).arrange_in_grid(rows=2, cols=2, buff=(0.25, 0.25)).scale(0.92)
        options = option_row().next_to(exam_cards, DOWN, buff=0.35)
        right = VGroup(exam_cards, options).arrange(DOWN, buff=0.35)
        body = VGroup(exam_code, right).arrange(RIGHT, buff=0.65).next_to(heading, DOWN, buff=0.55)

        self.narrate(
            "Bên trái là một câu trắc nghiệm có đáp án đúng và lời giải. Bên phải là bốn kiểu câu tôi dùng hằng ngày: trắc nghiệm, đúng sai, trả lời ngắn và tự luận. Chỉ đổi mode là cùng một nguồn có thể xuất bản đề học sinh hoặc bản có lời giải.",
            FadeIn(heading),
            FadeIn(exam_code, shift=LEFT * 0.12),
            FadeIn(right, shift=RIGHT * 0.12),
            run_time=2.5,
        )
        self.clear(heading, body)

        # 4. BBT and BXD
        heading = t("Ví dụ BBT:  f(x) = x^3 - 3x", size=43, color=INK, weight=BOLD)
        heading.to_edge(UP, buff=0.55)
        bbt_code = code_panel(
            [
                "#let f = $x^3 - 3x$",
                "#bbtv2(",
                "  x-vals: ($-oo$, $-1$, $1$, $+oo$),",
                '  d-signs: ("+", 0, "-", 0, "+"),',
                "  v-vals: ($-oo$, $2$, $-2$, $+oo$),",
                ")",
            ],
            width=6.35,
            height=4.1,
            title="bbt.typ",
            accent=GREEN,
            font_size=16,
        )
        bbt = mini_bbt()
        badge = example_badge("BBT thật").next_to(bbt, UP, buff=0.16).align_to(bbt, LEFT)
        bxd = code_panel(
            ["#bxd(...)", "#bbbt(...)", "#bbt-opt(var: $t$)"],
            width=4.25,
            height=1.95,
            title="công tắc nhanh",
            accent=AMBER,
            font_size=19,
        )
        right = Group(Group(badge, bbt), bxd).arrange(DOWN, buff=0.26)
        body = Group(bbt_code, right).arrange(RIGHT, buff=0.42).next_to(heading, DOWN, buff=0.46)

        self.narrate(
            "Đây là ví dụ cụ thể với hàm x mũ ba trừ ba x. Hai mốc âm một và một chia trục số; dấu đạo hàm lần lượt là cộng, không, trừ, không, cộng. Vì vậy hàm tăng, rồi giảm, rồi tăng; cực đại bằng hai tại âm một, cực tiểu bằng âm hai tại một. Trong sang-math, tôi chỉ nhập mốc, dấu và giá trị, bảng được dựng lại thống nhất.",
            FadeIn(heading),
            FadeIn(bbt_code, shift=LEFT * 0.12),
            FadeIn(right, shift=RIGHT * 0.12),
            run_time=2.4,
        )
        self.clear(heading, body)

        # 5. Exam templates
        heading = t("Template đề thi: đổi theme, đổi profile", size=43, color=INK, weight=BOLD)
        heading.to_edge(UP, buff=0.55)
        preset_code = code_panel(
            [
                "#let preset = exam-preset(",
                '  theme: "teal-pro",',
                '  profile: "loigiai",',
                "  opt-style: auto,",
                ")",
                "#show: exam-theme.with(",
                "  ..preset.template)",
            ],
            width=5.35,
            height=4.45,
            title="exam-templates.typ",
            accent=PURPLE,
            font_size=16,
        )
        profile_cards = VGroup(
            macro_card("dethi", "đề học sinh", BLUE),
            macro_card("loigiai", "lời giải", GREEN),
            macro_card("compact", "hai cột", AMBER),
            macro_card("draft", "cột nháp", ROSE),
            macro_card("beamer", "sẵn slide", PURPLE),
        ).arrange(DOWN, buff=0.16).scale(0.78)
        swatches = theme_swatches()
        right = VGroup(swatches, profile_cards).arrange(DOWN, buff=0.32).scale(0.92)
        body = VGroup(preset_code, right).arrange(RIGHT, buff=0.38).next_to(heading, DOWN, buff=0.44)

        self.narrate(
            "Ở slide này, exam-preset là phần gom cấu hình. Hàng trên là các theme màu; cột bên phải là các profile xuất bản: đề học sinh, lời giải, bản compact, bản nháp và bản beamer. Nhờ vậy một file đề có thể đổi dáng rất nhanh.",
            FadeIn(heading),
            FadeIn(preset_code, shift=LEFT * 0.12),
            FadeIn(right, shift=RIGHT * 0.12),
            run_time=2.5,
        )
        self.clear(heading, body)

        # 6. Book and geometry
        heading = t("Sách, chuyên đề và hình học CeTZ", size=43, color=INK, weight=BOLD)
        heading.to_edge(UP, buff=0.55)
        book_code = code_panel(
            [
                "#show: book-theme.with(theme: \"sgk-modern\")",
                "#book-chapter([Ứng dụng đạo hàm])",
                "#book-lesson([Tính đơn điệu])",
                "#theory-box[...]",
                "#example-box[...]",
            ],
            width=6.3,
            height=3.7,
            title="book-templates.typ",
            accent=AMBER,
            font_size=17,
        )
        geom_code = code_panel(
            [
                "#tri-abc()",
                "$+oo$, $RR$, $ZZ$",
                "$=>$, $<=>$",
            ],
            width=4.25,
            height=2.35,
            title="geometry + math-sym",
            accent=TEAL,
            font_size=21,
        )
        triangle = VGroup(
            Polygon(LEFT * 0.9 + DOWN * 0.45, RIGHT * 0.9 + DOWN * 0.45, UP * 0.85, color=TEAL, stroke_width=5),
            t("A", size=22, color=INK).shift(UP * 1.08),
            t("B", size=22, color=INK).shift(LEFT * 1.08 + DOWN * 0.62),
            t("C", size=22, color=INK).shift(RIGHT * 1.08 + DOWN * 0.62),
        )
        tri_box = VGroup(panel(4.25, 2.25, stroke=TEAL, fill="#0b1220"), triangle)
        right = VGroup(geom_code, tri_box).arrange(DOWN, buff=0.28)
        body = VGroup(book_code, right).arrange(RIGHT, buff=0.55).next_to(heading, DOWN, buff=0.55)

        self.narrate(
            "Bên trái là khung sách và chuyên đề: chương, bài học, hộp lý thuyết và hộp ví dụ. Bên phải là nhóm hình học CeTZ cùng các ký hiệu toán tắt. Đây là phần giúp học liệu hằng năm không chỉ đẹp hơn, mà còn dễ bảo trì hơn.",
            FadeIn(heading),
            FadeIn(book_code, shift=LEFT * 0.12),
            FadeIn(right, shift=RIGHT * 0.12),
            run_time=2.5,
        )
        self.clear(heading, body)

        # 7. Closing
        final_title = t("sang-math: một gói lệnh sống", size=56, color=INK, weight=BOLD)
        final_sub = t("Đề thi · BBT/BXD · CeTZ · Sách · Template · Ký hiệu", size=30, color=MUTED)
        import_line = t('#import "@preview/sang-math:1.0.0": *', size=29, color=AMBER, weight=BOLD, font=MONO)
        final_note = t("Viết ít hơn, sửa nhanh hơn, dạy Toán rõ hơn.", size=31, color=GREEN, weight=BOLD)
        closing = VGroup(final_title, final_sub, import_line, final_note).arrange(DOWN, buff=0.35)

        self.narrate(
            "Tóm lại, sang-math là một gói lệnh sống cho công việc dạy Toán: đề thi, bảng biến thiên, hình học, sách, template và ký hiệu cùng đi trong một hệ thống. Mục tiêu của tôi là viết ít hơn, sửa nhanh hơn, và dạy Toán rõ hơn qua từng năm học.",
            FadeIn(closing, shift=UP * 0.15),
            run_time=2.4,
            hold=0.7,
        )
        self.wait(0.8)
