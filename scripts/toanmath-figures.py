#!/usr/bin/env python3
"""Extract vector-figure crops from the source PDF for Typst #image().

The crop is generated from PDF drawing objects inside the vertical span of a
question. It is a source-preserving review asset, not an invented recreation.
Questions without a reliable drawing cluster remain marked for manual CeTZ/BBT
reconstruction.
"""

import argparse
import json
import re
from pathlib import Path

import pdfplumber


def question_spans(page):
    words = page.extract_words(x_tolerance=1, y_tolerance=3)
    markers = []
    for index, word in enumerate(words[:-1]):
        if word["text"] == "Câu" and re.fullmatch(r"\d+\.", words[index + 1]["text"]):
            markers.append((int(words[index + 1]["text"].rstrip(".")), word["top"]))
    markers.sort(key=lambda item: item[1])
    return {number: (top, markers[index + 1][1] if index + 1 < len(markers) else page.height - 40) for index, (number, top) in enumerate(markers)}


def crop_objects(page, top, bottom):
    objects = [*page.lines, *page.rects, *page.curves]
    selected = []
    for obj in objects:
        object_top = obj.get("top", 0)
        object_bottom = obj.get("bottom", object_top)
        if object_bottom < top - 8 or object_top > bottom + 8:
            continue
        width = obj.get("x1", obj.get("x0", 0)) - obj.get("x0", 0)
        height = object_bottom - object_top
        if width >= 4 or height >= 4:
            selected.append(obj)
    if len(selected) < 4:
        return None
    x0 = max(0, min(obj.get("x0", 0) for obj in selected) - 8)
    x1 = min(page.width, max(obj.get("x1", obj.get("x0", 0)) for obj in selected) + 8)
    y0 = max(top - 8, min(obj.get("top", top) for obj in selected) - 8)
    y1 = min(bottom + 8, max(obj.get("bottom", bottom) for obj in selected) + 8)
    if x1 - x0 < 20 or y1 - y0 < 15:
        return None
    return (x0, y0, x1, y1)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pdf", required=True)
    parser.add_argument("--input", required=True)
    parser.add_argument("--out", required=True)
    parser.add_argument("--root", default=".")
    args = parser.parse_args()

    payload = json.loads(Path(args.input).read_text(encoding="utf-8"))
    root = Path(args.root).resolve()
    figure_root = root / "question-bank" / "figures" / "2026-08-ngo-duc-tai-hk1"
    figure_root.mkdir(parents=True, exist_ok=True)
    extracted = 0
    unresolved = 0

    records = payload["records"]
    with pdfplumber.open(args.pdf) as pdf:
        for record in records.values():
            if not record.get("figureAlt"):
                continue
            page_match = re.search(r"PDF trang (\d+)", record.get("sourcePage", ""))
            question_match = re.search(r"Câu (\d+)", record.get("sourcePage", ""))
            if not page_match or not question_match:
                unresolved += 1
                continue
            page_number = int(page_match.group(1))
            question_number = int(question_match.group(1))
            page = pdf.pages[page_number - 1]
            span = question_spans(page).get(question_number)
            if not span:
                unresolved += 1
                continue
            bbox = crop_objects(page, *span)
            if not bbox:
                unresolved += 1
                continue
            image = page.to_image(resolution=220).original
            scale = 220 / 72
            crop = image.crop(tuple(round(value * scale) for value in bbox))
            filename = f"{record['id']}.png"
            path = figure_root / filename
            crop.save(path, optimize=True)
            record["figure"] = f"question-bank/figures/2026-08-ngo-duc-tai-hk1/{filename}"
            record["figureStatus"] = "source-crop"
            record["reviewNotes"] = f"{record.get('reviewNotes', '')} Đã trích crop vector từ PDF để đối chiếu.".strip()
            extracted += 1

    payload["figureExtraction"] = {"extracted": extracted, "unresolved": unresolved}
    Path(args.out).write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"extracted": extracted, "unresolved": unresolved, "output": str(Path(args.out).resolve())}, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
