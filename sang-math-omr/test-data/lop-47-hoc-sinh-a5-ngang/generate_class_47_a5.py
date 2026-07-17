#!/usr/bin/env python3
"""Generate a deterministic 47-student A5-landscape OMR test bundle.

The source template and templates.json coordinates are expressed in Typst
points (72 ppi).  The sheet is compiled at 144 ppi, hence the 2x coordinate
scale used for filling bubbles.
"""

from __future__ import annotations

import csv
import hashlib
import json
import math
import random
import re
import subprocess
import tempfile
from pathlib import Path

from PIL import Image, ImageDraw


SEED = 20260714
STUDENT_COUNT = 47
EXAM_CODE = "0202"
TEMPLATE_ID = "12-4-6ngang"
PPI = 144
COORDINATE_PPI = 72
SCALE = PPI / COORDINATE_PPI
FILL_RADIUS = int(3.8 * SCALE)
MAX_PDF_BYTES = 25 * 1024 * 1024

HERE = Path(__file__).resolve().parent
OMR_ROOT = HERE.parents[1]
REPO_ROOT = OMR_ROOT.parent
TEMPLATES_JSON = OMR_ROOT / "templates.json"
TYPST_TEMPLATE = OMR_ROOT / "templates" / "12-4-6ngang.typ"

PDF_PATH = HERE / "lop-47-hoc-sinh-a5-ngang.pdf"
ANSWER_PATH = HERE / "dap-an-ma-de-0202.json"
EXPECTED_PATH = HERE / "ket-qua-ky-vong.csv"
HASH_PATH = HERE / "SHA256SUMS.txt"

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
        raise RuntimeError(f"Expected one blank A5 page, found {len(pages)}")
    with Image.open(pages[0]) as image:
        return image.convert("RGB")


def iter_coordinate_pairs(value):
    if (
        isinstance(value, list)
        and len(value) == 2
        and all(isinstance(item, (int, float)) for item in value)
    ):
        yield value
        return
    if isinstance(value, dict):
        for child in value.values():
            yield from iter_coordinate_pairs(child)
    elif isinstance(value, list):
        for child in value:
            yield from iter_coordinate_pairs(child)


def dark_annulus_ratio(image: Image.Image, point: list[float]) -> float:
    gray = image.convert("L")
    cx, cy = (round(point[0] * SCALE), round(point[1] * SCALE))
    values = []
    for y in range(cy - 10, cy + 11):
        for x in range(cx - 10, cx + 11):
            radius = math.hypot(x - cx, y - cy)
            if 6 <= radius <= 10:
                values.append(gray.getpixel((x, y)))
    return sum(value < 180 for value in values) / len(values)


def validate_template_geometry(template: dict, blank: Image.Image) -> None:
    if blank.width <= blank.height:
        raise RuntimeError(f"Expected landscape page, got {blank.size}")

    expected_width = round(template["warp"]["width"] * SCALE)
    expected_height = round(template["warp"]["height"] * SCALE)
    if abs(blank.width - expected_width) > 1 or abs(blank.height - expected_height) > 4:
        raise RuntimeError(
            "Compiled page does not match template geometry: "
            f"page={blank.size}, warp≈({expected_width}, {expected_height})"
        )

    expected_counts = {
        "sbd": 6 * 10,
        "made": 4 * 10,
        "mcq": 12 * 4,
        "tf": 4 * 4 * 2,
        "tln": 6 * (10 + 11 + 11 + 10),
    }
    for section, expected_count in expected_counts.items():
        points = list(iter_coordinate_pairs(template[section]))
        if len(points) != expected_count:
            raise RuntimeError(
                f"Unexpected {section} coordinate count: {len(points)} != {expected_count}"
            )
        for x, y in points:
            px, py = round(x * SCALE), round(y * SCALE)
            if not (0 <= px < blank.width and 0 <= py < blank.height):
                raise RuntimeError(f"{section} coordinate outside page: {(x, y)}")

        # Every coordinate must land on a printed bubble ring, not merely be
        # inside the page.  This catches stale JSON after a Typst layout edit.
        weakest_ring = min(dark_annulus_ratio(blank, point) for point in points)
        if weakest_ring < 0.15:
            raise RuntimeError(
                f"{section} coordinates do not align with compiled bubbles "
                f"(weakest ring ratio {weakest_ring:.3f})"
            )

    for marker_name in ("TL", "TR", "BR", "BL"):
        x, y = template["warp"][marker_name]
        px, py = round(x * SCALE), round(y * SCALE)
        if max(blank.getpixel((px, py))) > 20:
            raise RuntimeError(f"Warp marker {marker_name} is not black at {(px, py)}")


def build_answer_key(rng: random.Random) -> dict:
    # Câu 17 deliberately tests the one-digit TLN mapping: digit 1 belongs in
    # column index 0, the first/leftmost answer column.
    return {
        "mcq": {str(question): rng.choice(MCQ_OPTIONS) for question in range(1, 13)},
        "tf": {
            str(question): {label: rng.choice(TF_OPTIONS) for label in TF_LABELS}
            for question in range(13, 17)
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
    if index == 1:
        return json.loads(json.dumps(answer_key, ensure_ascii=False))

    ability = 0.34 + (index - 2) * (0.61 / (STUDENT_COUNT - 2))
    ability = max(0.25, min(0.97, ability + rng.uniform(-0.08, 0.08)))

    mcq = {
        question: correct if rng.random() < ability else wrong_mcq(correct, rng)
        for question, correct in answer_key["mcq"].items()
    }
    tf = {
        question: {
            label: correct if rng.random() < ability else ("S" if correct == "Đ" else "Đ")
            for label, correct in correct_row.items()
        }
        for question, correct_row in answer_key["tf"].items()
    }
    tln = {
        question: correct if rng.random() < ability else wrong_digit(correct, rng)
        for question, correct in answer_key["tln"].items()
    }
    return {"mcq": mcq, "tf": tf, "tln": tln}


def tf_score(correct_row: dict, student_row: dict) -> float:
    correct_count = sum(student_row[label] == correct_row[label] for label in TF_LABELS)
    return (0.0, 0.1, 0.25, 0.5, 1.0)[correct_count]


def score_answers(answer_key: dict, answers: dict) -> dict:
    mcq_correct = sum(
        answers["mcq"][question] == correct
        for question, correct in answer_key["mcq"].items()
    )
    tf_points = sum(
        tf_score(correct_row, answers["tf"][question])
        for question, correct_row in answer_key["tf"].items()
    )
    tln_correct = sum(
        answers["tln"][question] == correct
        for question, correct in answer_key["tln"].items()
    )
    total = mcq_correct * 0.25 + tf_points + tln_correct * 0.5
    return {
        "mcq_correct": mcq_correct,
        "tf_points": tf_points,
        "tln_correct": tln_correct,
        "total": total,
    }


def selected_points(template: dict, sbd: str, exam_code: str, answers: dict) -> list:
    points = []
    for column_index, digit in enumerate(sbd):
        points.append(template["sbd"][column_index][int(digit)])
    for column_index, digit in enumerate(exam_code):
        points.append(template["made"][column_index][int(digit)])
    for question, answer in answers["mcq"].items():
        points.append(template["mcq"][question][MCQ_OPTIONS.index(answer)])
    for global_question, row in answers["tf"].items():
        local_question = str(int(global_question) - 12)
        for label, answer in row.items():
            points.append(
                template["tf"][local_question][label][0 if answer == "Đ" else 1]
            )
    for global_question, answer in answers["tln"].items():
        local_question = str(int(global_question) - 16)
        column_index = 1 if answer == "0" else 0
        bubble_index = int(answer) + 1 if column_index == 1 else int(answer)
        points.append(template["tln"][local_question][column_index][bubble_index])
    return points


def render_page(blank: Image.Image, points: list) -> Image.Image:
    page = blank.copy()
    draw = ImageDraw.Draw(page)
    for x, y in points:
        px, py = round(x * SCALE), round(y * SCALE)
        draw.ellipse(
            (px - FILL_RADIUS, py - FILL_RADIUS, px + FILL_RADIUS, py + FILL_RADIUS),
            fill="black",
        )
    return page


def patch_mean(image: Image.Image, point: list[float], radius: int = 2) -> float:
    cx, cy = round(point[0] * SCALE), round(point[1] * SCALE)
    values = []
    for y in range(cy - radius, cy + radius + 1):
        for x in range(cx - radius, cx + radius + 1):
            values.extend(image.getpixel((x, y)))
    return sum(values) / len(values)


def validate_rendered_page(
    page: Image.Image, template: dict, points: list, check_q17_one: bool = False
) -> None:
    for point in points:
        if patch_mean(page, point) > 5:
            raise RuntimeError(f"Expected filled bubble is not black at {point}")

    if not check_q17_one:
        return

    # Explicit regression check on the perfect-control page for câu 17 = 1.
    # Only the first numeric-1 bubble is filled; the equivalent digit
    # positions in columns 2–4 stay clear.
    question = template["tln"]["1"]
    leftmost_one = question[0][1]
    if patch_mean(page, leftmost_one) > 5:
        raise RuntimeError("Câu 17 digit 1 was not filled in TLN column 1")
    other_one_positions = (question[1][2], question[2][2], question[3][1])
    if any(patch_mean(page, point) < 220 for point in other_one_positions):
        raise RuntimeError("Câu 17 digit 1 leaked into a non-leftmost TLN column")


def write_answer_package(answer_key: dict) -> None:
    payload = {
        "v": 1,
        "meta": {
            "exam": "Bộ kiểm thử 47 học sinh - A5 ngang",
            "subject": "Toán",
            "seed": SEED,
            "omr": {
                "id": TEMPLATE_ID,
                "name": "Toán 12-4-6 A5 ngang",
                "mcq": 12,
                "tf": 4,
                "tln": 6,
                "paper": "a5",
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
    pages[0].save(
        PDF_PATH,
        "PDF",
        resolution=PPI,
        save_all=True,
        append_images=pages[1:],
        quality=88,
        optimize=True,
        title="Lop 47 hoc sinh A5 ngang - SANG MATH OMR",
        author="SANG MATH OMR test generator",
        creationDate=False,
        modDate=False,
    )


def validate_pdf() -> None:
    pdf_bytes = PDF_PATH.read_bytes()
    if len(pdf_bytes) >= MAX_PDF_BYTES:
        raise RuntimeError(
            f"Generated PDF is {len(pdf_bytes)} bytes; limit is {MAX_PDF_BYTES}"
        )
    page_count = len(re.findall(rb"/Type /Page\b", pdf_bytes))
    if page_count != STUDENT_COUNT:
        raise RuntimeError(f"Expected {STUDENT_COUNT} PDF pages, found {page_count}")

    info = subprocess.run(
        ["pdfinfo", str(PDF_PATH)], capture_output=True, text=True, check=True
    ).stdout
    if not re.search(r"^Pages:\s+47\s*$", info, re.MULTILINE):
        raise RuntimeError("pdfinfo did not report 47 pages")
    size_match = re.search(
        r"^Page size:\s+([\d.]+) x ([\d.]+) pts", info, re.MULTILINE
    )
    if not size_match:
        raise RuntimeError("pdfinfo did not report the page size")
    width, height = map(float, size_match.groups())
    if width <= height or abs(width - 595.5) > 1 or abs(height - 419.5) > 1:
        raise RuntimeError(f"Unexpected PDF page size: {width} x {height} pts")


def write_hash_manifest() -> None:
    lines = []
    for path in (ANSWER_PATH, EXPECTED_PATH, PDF_PATH):
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        lines.append(f"{digest}  {path.name}")
    HASH_PATH.write_text("\n".join(lines) + "\n", encoding="ascii")


def main() -> None:
    rng = random.Random(SEED)
    with TEMPLATES_JSON.open(encoding="utf-8") as source:
        template = json.load(source)[TEMPLATE_ID]

    answer_key = build_answer_key(rng)
    pages = []
    expected_rows = []

    with tempfile.TemporaryDirectory(prefix="sang-math-omr-a5-class-") as temp:
        blank = compile_blank_sheet(Path(temp))
        validate_template_geometry(template, blank)

        for index in range(1, STUDENT_COUNT + 1):
            sbd = f"{520000 + index:06d}"
            answers = build_student_answers(index, answer_key, rng)
            score = score_answers(answer_key, answers)
            points = selected_points(template, sbd, EXAM_CODE, answers)
            page = render_page(blank, points)
            validate_rendered_page(page, template, points, check_q17_one=index == 1)
            pages.append(page)
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
    validate_pdf()
    write_hash_manifest()

    for page in pages:
        page.close()

    print(f"Generated {STUDENT_COUNT} A5-landscape pages: {PDF_PATH}")
    print(f"PDF size: {PDF_PATH.stat().st_size} bytes")
    print(HASH_PATH.read_text(encoding="ascii"), end="")


if __name__ == "__main__":
    main()
