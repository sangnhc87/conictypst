#!/usr/bin/env python3
"""Extract answer-key rows from the ToánMath bundle with PDF coordinates.

The text-only extraction loses the six answer columns in Part III. pdfplumber
lets us recover those columns without touching the source PDF or guessing from
the answer digits in reading order.
"""

import argparse
import json
import re
from pathlib import Path

import pdfplumber


def word_rows(words, tolerance=3):
    rows = []
    for word in sorted(words, key=lambda item: (item["top"], item["x0"])):
        row = next((row for row in rows if abs(row[0]["top"] - word["top"]) <= tolerance), None)
        if row is None:
            rows.append([word])
        else:
            row.append(word)
    return [sorted(row, key=lambda item: item["x0"]) for row in sorted(rows, key=lambda row: row[0]["top"])]


def find_header(words, label, minimum_top=0):
    matches = [word for word in words if word["text"] == label and word["top"] >= minimum_top]
    return min(matches, key=lambda word: word["top"])["top"] if matches else None


def extract_key(page):
    words = page.extract_words(x_tolerance=1, y_tolerance=2)
    rows = word_rows(words)
    part_i_top = find_header(words, "I", 50)
    part_ii_top = find_header(words, "II", 50)
    part_iii_top = find_header(words, "III", 50)
    answer = {"tn": {}, "ds": {}, "tln": {}}

    if part_i_top is not None:
        for row in rows:
            if not part_i_top + 15 < row[0]["top"] < (part_ii_top or 9999):
                continue
            for index, word in enumerate(row):
                if not re.fullmatch(r"\d{1,2}\.", word["text"]):
                    continue
                next_word = next((item for item in row[index + 1:] if item["x0"] - word["x0"] < 40), None)
                if next_word and next_word["text"] in {"A", "B", "C", "D"}:
                    answer["tn"][int(word["text"].rstrip("."))] = ord(next_word["text"]) - ord("A") + 1

    if part_ii_top is not None:
        for row in rows:
            if not part_ii_top + 15 < row[0]["top"] < (part_iii_top or 9999):
                continue
            for index, word in enumerate(row):
                if word["text"] != "Câu" or index + 1 >= len(row):
                    continue
                number = row[index + 1]["text"].rstrip(".")
                if not number.isdigit():
                    continue
                pairs = {}
                cursor = index + 2
                while cursor + 1 < len(row) and row[cursor]["text"] != "Câu":
                    if row[cursor]["text"] in {"a", "b", "c", "d"} and row[cursor + 1]["text"] in {"S", "Đ"}:
                        pairs[row[cursor]["text"]] = row[cursor + 1]["text"] == "Đ"
                        cursor += 2
                    else:
                        cursor += 1
                if len(pairs) == 4:
                    answer["ds"][int(number)] = [pairs[key] for key in ("a", "b", "c", "d")]

    if part_iii_top is not None:
        labels = [word for word in words if part_iii_top < word["top"] < part_iii_top + 35 and word["text"] in {f"{i}." for i in range(1, 7)}]
        labels = sorted(labels, key=lambda word: word["x0"])
        if len(labels) == 6:
            x_positions = [word["x0"] for word in labels]
            boundaries = [-10**9] + [(x_positions[i] + x_positions[i + 1]) / 2 for i in range(5)] + [10**9]
            answer_row = [word for word in words if part_iii_top + 10 < word["top"] < part_iii_top + 55 and word["text"] != "Câu" and word not in labels]
            for index in range(6):
                tokens = [word["text"] for word in answer_row if boundaries[index] <= word["x0"] < boundaries[index + 1]]
                value = "".join(tokens).replace("−", "-").replace("–", "-").replace(" ", "")
                if value:
                    answer["tln"][index + 1] = value

    return answer


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pdf", required=True)
    parser.add_argument("--manifest", required=True)
    parser.add_argument("--out", required=True)
    args = parser.parse_args()

    manifest = json.loads(Path(args.manifest).read_text(encoding="utf-8"))
    with pdfplumber.open(args.pdf) as pdf:
        for exam in manifest["exams"]:
            if not exam.get("pdfAnswerPage"):
                continue
            key = extract_key(pdf.pages[exam["pdfAnswerPage"] - 1])
            exam["answerKey"]["tn"].update({str(k): v for k, v in key["tn"].items()})
            exam["answerKey"]["ds"].update({str(k): v for k, v in key["ds"].items()})
            exam["answerKey"]["tln"] = key["tln"]
            for question in exam["questions"]:
                number = int(str(question["id"]).split("-c")[-1])
                if question["type"] == "tn" and number in key["tn"]:
                    question["correctAnswers"] = [key["tn"][number]]
                    question["answerVerified"] = True
                elif question["type"] == "ds" and number in key["ds"]:
                    for index, statement in enumerate(question.get("statements", [])):
                        if index < len(key["ds"][number]):
                            statement["correct"] = key["ds"][number][index]
                    question["answerVerified"] = True
                elif question["type"] == "tln" and number in key["tln"]:
                    question["shortAnswer"] = key["tln"][number]
                    question["answerVerified"] = True

    Path(args.out).write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"exams": manifest["examCount"], "records": manifest["recordCount"], "output": args.out}, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
