#!/usr/bin/env python3
"""
annotate_result.py - Tao bao cao ket qua cham thi PNG chuyen nghiep voi Pillow.

Usage:
    python3 annotate_result.py --image graded_result.png --result result.json
    python3 annotate_result.py --image graded_result.png \
        --sbd 001 --made 132 --score 8.5 --correct 12 --total 15 \
        --wrong "C2: B (D.An: A)" "C7: C (D.An: D)"

Output: BaoCao_<sbd>_<diem>d.png (same directory as --image)
Requirements: pip install pillow
"""

import argparse
import json
import os
import sys
import textwrap
from datetime import datetime
from pathlib import Path

try:
    from PIL import Image, ImageDraw, ImageFont
except ImportError:
    print("Thieu thu vien Pillow. Chay: pip install pillow")
    sys.exit(1)


def score_color(score):
    if score >= 9.0:  return (0, 184, 122)
    if score >= 7.0:  return (33, 150, 243)
    if score >= 5.0:  return (255, 152, 0)
    return (244, 67, 54)


def score_verdict(score):
    if score >= 9.0: return "Xuat Sac"
    if score >= 7.0: return "Kha"
    if score >= 5.0: return "Trung Binh"
    return "Can Co Gang"


def score_comment(score):
    if score >= 9.0: return "Em da tra loi xuat sac! Tiep tuc phat huy nhe!"
    if score >= 7.0: return "Ket qua tot! Xem lai cac cau con sai de hoan thien hon."
    if score >= 5.0: return "Can on tap them cac phan con yeu, em nhe."
    return "Gap thay/co de duoc ho tro them. Em dung nan nhe!"


def _load_font(size, bold=False):
    candidates_bold = [
        "/System/Library/Fonts/Supplemental/Arial Bold.ttf",
        "/System/Library/Fonts/Arial Bold.ttf",
        "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
        "/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf",
        "C:/Windows/Fonts/arialbd.ttf",
    ]
    candidates_regular = [
        "/System/Library/Fonts/Supplemental/Arial.ttf",
        "/System/Library/Fonts/Arial.ttf",
        "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
        "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",
        "C:/Windows/Fonts/arial.ttf",
    ]
    candidates = candidates_bold if bold else candidates_regular
    for path in candidates:
        if os.path.exists(path):
            try:
                return ImageFont.truetype(path, size)
            except Exception:
                pass
    try:
        return ImageFont.load_default(size=size)
    except Exception:
        return ImageFont.load_default()


def build_report(sheet_img_path, sbd, made, score, correct, total,
                 wrong_details, school="TRUONG THPT SANG MATH",
                 exam="Kiem tra - Mon Toan", out_path=None):
    sheet = Image.open(sheet_img_path).convert("RGBA")

    REPORT_W = 1100
    HEADER_H = 130
    IMG_MAX_H = 900
    SIDE_W    = 420
    SHEET_W   = REPORT_W - SIDE_W - 20

    sheet_ratio     = sheet.height / sheet.width
    sheet_display_w = SHEET_W - 20
    sheet_resized   = sheet.resize(
        (sheet_display_w, int(sheet_display_w * sheet_ratio)), Image.LANCZOS
    )
    if sheet_resized.height > IMG_MAX_H:
        sheet_resized = sheet_resized.crop((0, 0, sheet_display_w, IMG_MAX_H))
    sheet_display_h = sheet_resized.height

    BODY_H   = max(sheet_display_h + 20, 560)
    REPORT_H = HEADER_H + BODY_H + 40

    img  = Image.new("RGB", (REPORT_W, REPORT_H), (13, 27, 53))
    draw = ImageDraw.Draw(img)

    # Header gradient
    for y in range(HEADER_H):
        t = y / HEADER_H
        r = int(26 * (1 - t) + 13 * t)
        g = int(58 * (1 - t) + 27 * t)
        b = int(106 * (1 - t) + 53 * t)
        draw.line([(0, y), (REPORT_W, y)], fill=(r, g, b))
    draw.rectangle([0, HEADER_H - 3, REPORT_W, HEADER_H], fill=(59, 130, 246))

    fnt_h1 = _load_font(28, bold=True)
    fnt_h2 = _load_font(14)
    fnt_h3 = _load_font(13)

    draw.text((24, 18), "PHIEU KET QUA CHAM THI", font=fnt_h1, fill=(226, 232, 240))
    draw.text((24, 54), school, font=fnt_h2, fill=(148, 163, 184))
    draw.text((24, 74), exam,   font=fnt_h2, fill=(148, 163, 184))
    date_str = datetime.now().strftime("%d/%m/%Y %H:%M")
    draw.text((24, 96), f"SBD: {sbd}  |  Ma de: {made}  |  Ngay: {date_str}",
              font=fnt_h3, fill=(148, 163, 184))

    sc_color  = score_color(score)
    fnt_score = _load_font(72, bold=True)
    score_str = str(int(score)) if score == int(score) else f"{score:.2f}".rstrip('0')
    sw = draw.textlength(score_str, font=fnt_score)
    draw.text((REPORT_W - int(sw) - 24, 14), score_str, font=fnt_score, fill=sc_color)
    draw.text((REPORT_W - 60, HEADER_H - 24), "DIEM", font=fnt_h3, fill=(148, 163, 184))

    # Sheet image left
    img.paste(sheet_resized.convert("RGB"), (10, HEADER_H + 10))

    # Right panel
    px, py = SHEET_W + 14, HEADER_H + 14
    draw.rounded_rectangle([px, py, REPORT_W - 10, HEADER_H + BODY_H - 10],
                           radius=12, fill=(20, 40, 80))

    # Verdict
    verdict     = score_verdict(score)
    fnt_verdict = _load_font(18, bold=True)
    vw = draw.textlength(verdict, font=fnt_verdict)
    bx = px + (SIDE_W - vw) // 2
    draw.rounded_rectangle([bx - 10, py + 10, bx + vw + 10, py + 44],
                           radius=14, outline=sc_color, width=2,
                           fill=(sc_color[0]//6, sc_color[1]//6, sc_color[2]//6))
    draw.text((bx, py + 14), verdict, font=fnt_verdict, fill=sc_color)

    # Big score right panel
    fnt_big = _load_font(80, bold=True)
    ss  = draw.textlength(score_str, font=fnt_big)
    draw.text((px + (SIDE_W - ss) // 2, py + 56), score_str, font=fnt_big, fill=sc_color)

    # Correct/total
    fnt_detail = _load_font(15)
    ct_str = f"Cau dung: {correct}/{total}"
    ctw = draw.textlength(ct_str, font=fnt_detail)
    draw.text((px + (SIDE_W - ctw) // 2, py + 152), ct_str, font=fnt_detail, fill=(148, 163, 184))

    # Score bar
    bx2, by2, bw2, bh2 = px + 14, py + 180, SIDE_W - 28, 8
    draw.rounded_rectangle([bx2, by2, bx2 + bw2, by2 + bh2], radius=4, fill=(42, 58, 90))
    fw = int((score / 10) * bw2)
    if fw > 0:
        seg = fw // 3
        bar_colors = [(244, 67, 54), (255, 152, 0), (33, 150, 243)]
        for i, c in enumerate(bar_colors):
            x0 = bx2 + i * seg
            x1 = x0 + seg if i < 2 else bx2 + fw
            draw.rectangle([x0, by2, x1, by2 + bh2], fill=c)

    draw.line([(px + 10, py + 200), (REPORT_W - 20, py + 200)], fill=(42, 58, 90), width=1)

    # Comment
    fnt_cm  = _load_font(13)
    comment = score_comment(score)
    cy = py + 212
    for wline in textwrap.wrap(comment, width=34):
        draw.text((px + 14, cy), wline, font=fnt_cm, fill=(176, 196, 222))
        cy += 20

    # Wrong details
    if wrong_details:
        cy += 8
        fnt_wh = _load_font(12, bold=True)
        draw.text((px + 14, cy), f"{len(wrong_details)} CAU SAI - CAN XEM LAI",
                  font=fnt_wh, fill=(248, 113, 113))
        cy += 22
        fnt_wr = _load_font(12)
        for i, witem in enumerate(wrong_details):
            bg = (60, 20, 20) if i % 2 == 0 else (50, 15, 15)
            draw.rounded_rectangle([px + 10, cy - 2, REPORT_W - 20, cy + 18],
                                   radius=4, fill=bg)
            draw.text((px + 16, cy), witem, font=fnt_wr, fill=(252, 165, 165))
            cy += 22
            if cy > REPORT_H - 60:
                rem = len(wrong_details) - i - 1
                if rem > 0:
                    draw.text((px + 14, cy), f"... va {rem} cau khac",
                              font=fnt_wr, fill=(100, 120, 160))
                break
    else:
        cy += 14
        draw.text((px + 14, cy), "Khong co cau sai!",
                  font=_load_font(14, bold=True), fill=(0, 184, 122))

    # Watermark
    fnt_wm = _load_font(11)
    wm = "SANG MATH OMR  |  He thong cham thi thong minh"
    wmw = draw.textlength(wm, font=fnt_wm)
    draw.text(((REPORT_W - wmw) // 2, REPORT_H - 22), wm, font=fnt_wm, fill=(40, 60, 100))

    if out_path is None:
        out_dir   = Path(sheet_img_path).parent
        safe_sc   = score_str.replace('.', '_')
        out_path  = str(out_dir / f"BaoCao_{sbd}_{safe_sc}d.png")

    img.save(out_path, "PNG", dpi=(150, 150))
    print(f"Da luu bao cao: {out_path}")
    return out_path


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description="Tao bao cao PNG ket qua cham thi")
    ap.add_argument("--image",   required=True)
    ap.add_argument("--result",  default=None)
    ap.add_argument("--sbd",     default="000")
    ap.add_argument("--made",    default="???")
    ap.add_argument("--score",   type=float, default=0.0)
    ap.add_argument("--correct", type=int,   default=0)
    ap.add_argument("--total",   type=int,   default=0)
    ap.add_argument("--wrong",   nargs="*",  default=[])
    ap.add_argument("--school",  default="TRUONG THPT SANG MATH")
    ap.add_argument("--exam",    default="Kiem tra - Mon Toan")
    ap.add_argument("--out",     default=None)
    args = ap.parse_args()

    sbd = args.sbd; made = args.made; score = args.score
    correct = args.correct; total = args.total; wrong = args.wrong

    if args.result:
        with open(args.result, encoding="utf-8") as f:
            data = json.load(f)
        sbd     = data.get("sbd", sbd)
        made    = data.get("made", made)
        score   = float(data.get("score", score))
        correct = int(data.get("correct", data.get("mcqCorrect", correct)))
        total   = int(data.get("total",   data.get("mcqTotal",   total)))
        wrong   = data.get("wrongDetails", wrong) or []

    build_report(args.image, str(sbd), str(made), score, correct, total,
                 wrong, args.school, args.exam, args.out)
