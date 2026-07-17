#!/usr/bin/env python3
"""Generate a deterministic 47-student OMR class test bundle.

The sheet geometry comes from templates.json (72 dpi Typst coordinates).  The
blank A4 sheet is compiled at 144 dpi, so every bubble centre is scaled by 2.
"""

from __future__ import annotations

import csv
import json
import random
import subprocess
import tempfile
from pathlib import Path

from PIL import Image, ImageDraw


SEED = 20260714
STUDENT_COUNT = 47
EXAM_CODE = "0101"
TEMPLATE_ID = "thptqg-toan"
PPI = 144
COORDINATE_PPI = 72
SCALE = PPI / COORDINATE_PPI
FILL_RADIUS = int(3.8 * SCALE)
MAX_PDF_BYTES = 25 * 1024 * 1024

HERE = Path(__file__).resolve().parent
OMR_ROOT = HERE.parents[1]
REPO_ROOT = OMR_ROOT.parent
TEMPLATES_JSON = OMR_ROOT / "templates.json"
TYPST_TEMPLATE = OMR_ROOT / "templates" / "thptqg-toan-2025.typ"

PDF_PATH = HERE / "lop-47-hoc-sinh-ngau-nhien.pdf"
ANSWER_PATH = HERE / "dap-an-ma-de-0101.json"
EXPECTED_PATH = HERE / "ket-qua-ky-vong.csv"

MCQ_OPTIONS = ("A", "B", "C", "D")
TF_OPTIONS = ("Đ", "S")
TF_LABELS = ("a", "b", "c", "d")


def compile_blank_sheet(temp_dir: Path) -> Image.Image:
    output_pattern = temp_dir / "blank-{p}.png"
    subprocess.run(
        [
            "typst",
            "compile",
            "--ppi",
            str(PPI),
            "--root",
            str(REPO_ROOT),
            str(TYPST_TEMPLATE),
            str(output_pattern),
        ],
        check=True,
    )
    pages = sorted(temp_dir.glob("blank-*.png"))
    if len(pages) != 1:
        raise RuntimeError(f"Expected one blank page, found {len(pages)}")
    with Image.open(pages[0]) as image:
        return image.convert("RGB")


def build_answer_key(rng: random.Random) -> dict:
    # Câu 17 is intentionally the single digit 1.  It must be marked in the
    # first TLN answer column on this sheet.
    return {
        "mcq": {str(q): rng.choice(MCQ_OPTIONS) for q in range(1, 13)},
        "tf": {
            str(q): {label: rng.choice(TF_OPTIONS) for label in TF_LABELS}
            for q in range(13, 17)
        },
        "tln": {
            "17": "1",
            "18": "7",
            "19": "0",
            "20": "5",
            "21": "3",
            "22": "9",
        },
    }


def wrong_mcq(correct: str, rng: random.Random) -> str:
    return rng.choice(tuple(option for option in MCQ_OPTIONS if option != correct))


def wrong_digit(correct: str, rng: random.Random) -> str:
    return rng.choice(tuple(str(digit) for digit in range(10) if str(digit) != correct))


def build_student_answers(index: int, answer_key: dict, rng: random.Random) -> dict:
    # The first pupil is a deliberate perfect-control page.  The remainder
    # cover a broad, reproducible score range.
    if index == 1:
        return json.loads(json.dumps(answer_key, ensure_ascii=False))

    ability = 0.34 + (index - 2) * (0.61 / (STUDENT_COUNT - 2))
    ability += rng.uniform(-0.08, 0.08)
    ability = max(0.25, min(0.97, ability))

    mcq = {}
    for q, correct in answer_key["mcq"].items():
        mcq[q] = correct if rng.random() < ability else wrong_mcq(correct, rng)

    tf = {}
    for q, correct_row in answer_key["tf"].items():
        tf[q] = {}
        for label, correct in correct_row.items():
            tf[q][label] = correct if rng.random() < ability else ("S" if correct == "Đ" else "Đ")

    tln = {}
    for q, correct in answer_key["tln"].items():
        tln[q] = correct if rng.random() < ability else wrong_digit(correct, rng)

    return {"mcq": mcq, "tf": tf, "tln": tln}


def tf_score(correct_row: dict, student_row: dict) -> float:
    correct_count = sum(student_row[label] == correct_row[label] for label in TF_LABELS)
    return (0.0, 0.1, 0.25, 0.5, 1.0)[correct_count]


def score_answers(answer_key: dict, answers: dict) -> dict:
    mcq_correct = sum(
        answers["mcq"][q] == correct for q, correct in answer_key["mcq"].items()
    )
    tf_points = sum(
        tf_score(correct_row, answers["tf"][q])
        for q, correct_row in answer_key["tf"].items()
    )
    tln_correct = sum(
        answers["tln"][q] == correct for q, correct in answer_key["tln"].items()
    )
    total = mcq_correct * 0.25 + tf_points + tln_correct * 0.5
    return {
        "mcq_correct": mcq_correct,
        "tf_points": tf_points,
        "tln_correct": tln_correct,
        "total": total,
    }


def point_for_digit(columns: list, column_index: int, digit: str) -> list:
    return columns[column_index][int(digit)]


def selected_points(template: dict, sbd: str, exam_code: str, answers: dict) -> list:
    points = []

    for column_index, digit in enumerate(sbd):
        points.append(point_for_digit(template["sbd"], column_index, digit))
    for column_index, digit in enumerate(exam_code):
        points.append(point_for_digit(template["made"], column_index, digit))

    for q, answer in answers["mcq"].items():
        points.append(template["mcq"][q][MCQ_OPTIONS.index(answer)])

    # Template TF questions are locally numbered 1..4, whereas imported keys
    # and grading results use the global numbers 13..16.
    for global_q, row in answers["tf"].items():
        local_q = str(int(global_q) - 12)
        for label, answer in row.items():
            points.append(template["tf"][local_q][label][0 if answer == "Đ" else 1])

    # Positive one-digit TLN values start in column index 0.  The standalone
    # value 0 uses column index 1, the leftmost calibrated column with a zero
    # bubble.
    for global_q, answer in answers["tln"].items():
        local_q = str(int(global_q) - 16)
        column_index = 1 if answer == "0" else 0
        bubble_index = int(answer) + 1 if column_index == 1 else int(answer)
        points.append(template["tln"][local_q][column_index][bubble_index])

    return points


def render_page(blank: Image.Image, points: list) -> Image.Image:
    page = blank.copy()
    draw = ImageDraw.Draw(page)
    for x, y in points:
        px = round(x * SCALE)
        py = round(y * SCALE)
        draw.ellipse(
            (px - FILL_RADIUS, py - FILL_RADIUS, px + FILL_RADIUS, py + FILL_RADIUS),
            fill="black",
        )
    return page


def write_answer_package(answer_key: dict) -> None:
    payload = {
        "v": 1,
        "meta": {
            "exam": "Bộ kiểm thử ngẫu nhiên 47 học sinh",
            "subject": "Toán",
            "seed": SEED,
            "omr": {
                "id": TEMPLATE_ID,
                "name": "Toán 12-4-6 A4 Dọc",
                "mcq": 12,
                "tf": 4,
                "tln": 6,
                "paper": "a4",
            },
        },
        "keys": {EXAM_CODE: answer_key},
    }
    ANSWER_PATH.write_text(
        json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )


def write_expected_results(rows: list[dict]) -> None:
    with EXPECTED_PATH.open("w", encoding="utf-8-sig", newline="") as output:
        writer = csv.DictWriter(
            output,
            fieldnames=(
                "STT",
                "SBD",
                "MaDe",
                "MCQ_Dung",
                "TF_Diem",
                "TLN_Dung",
                "Diem_Ky_Vong",
            ),
        )
        writer.writeheader()
        writer.writerows(rows)


def write_pdf(pages: list[Image.Image]) -> None:
    if not pages:
        raise RuntimeError("No pages generated")
    pages[0].save(
        PDF_PATH,
        "PDF",
        resolution=PPI,
        save_all=True,
        append_images=pages[1:],
        quality=88,
        optimize=True,
        title="Lop 47 hoc sinh - SANG MATH OMR",
        author="SANG MATH OMR test generator",
        creationDate=False,
        modDate=False,
    )


def main() -> None:
    rng = random.Random(SEED)
    with TEMPLATES_JSON.open(encoding="utf-8") as source:
        template = json.load(source)[TEMPLATE_ID]

    answer_key = build_answer_key(rng)
    pages = []
    expected_rows = []

    with tempfile.TemporaryDirectory(prefix="sang-math-omr-class-") as temp:
        blank = compile_blank_sheet(Path(temp))
        for index in range(1, STUDENT_COUNT + 1):
            sbd = f"{120000 + index:06d}"
            answers = build_student_answers(index, answer_key, rng)
            score = score_answers(answer_key, answers)
            points = selected_points(template, sbd, EXAM_CODE, answers)
            pages.append(render_page(blank, points))
            expected_rows.append(
                {
                    "STT": index,
                    "SBD": sbd,
                    "MaDe": EXAM_CODE,
                    "MCQ_Dung": score["mcq_correct"],
                    "TF_Diem": f'{score["tf_points"]:.2f}',
                    "TLN_Dung": score["tln_correct"],
                    "Diem_Ky_Vong": f'{score["total"]:.2f}',
                }
            )

    write_answer_package(answer_key)
    write_expected_results(expected_rows)
    write_pdf(pages)

    pdf_size = PDF_PATH.stat().st_size
    if pdf_size >= MAX_PDF_BYTES:
        raise RuntimeError(
            f"Generated PDF is {pdf_size} bytes; it must stay below {MAX_PDF_BYTES} bytes"
        )

    for page in pages:
        page.close()

    print(f"Generated {STUDENT_COUNT} pages ({pdf_size} bytes): {PDF_PATH}")
    print(f"Answer package: {ANSWER_PATH}")
    print(f"Expected results: {EXPECTED_PATH}")


if __name__ == "__main__":
    main()
