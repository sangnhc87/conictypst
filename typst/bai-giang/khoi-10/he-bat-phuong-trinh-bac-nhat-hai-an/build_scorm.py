#!/usr/bin/env python3
"""Build the printable lesson and a self-contained SCORM 1.2 learning object."""

from __future__ import annotations

import html
import json
import re
import shutil
import subprocess
import tempfile
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path


HERE = Path(__file__).resolve().parent
DIST = HERE / "dist"
SCORM = DIST / "scorm"
LESSON = json.loads((HERE / "checkpoints.json").read_text(encoding="utf-8"))
SECTION_IDS = ("01", "02", "03", "04")


def validate_bank() -> None:
    assert tuple(LESSON["sections"]) == SECTION_IDS
    seen = set()
    for section_id, section in LESSON["sections"].items():
        assert (HERE / section["file"]).is_file()
        assert len(section["questions"]) == 6
        for question in section["questions"]:
            qid, kind = question["id"], question["type"]
            assert qid.startswith(section_id + "-") and qid not in seen
            seen.add(qid)
            assert question["prompt"] and question["hint"] and question["explanation"]
            if kind == "single":
                assert 0 <= question["answer"] < len(question["options"])
            elif kind == "multi":
                assert question["answer"] and len(set(question["answer"])) == len(question["answer"])
                assert all(0 <= n < len(question["options"]) for n in question["answer"])
            elif kind == "number":
                assert isinstance(question["answer"], (int, float))
                assert question["tolerance"] >= 0
            elif kind == "point_exact":
                assert len(question["answer"]) == 2 and question["tolerance"] >= 0
            elif kind == "feasible_point":
                assert question["sample"] and question["answer"]["constraints"]
                match = re.fullmatch(r"\((-?\d+(?:[,.]\d+)?);(-?\d+(?:[,.]\d+)?)\)", question["sample"])
                assert match, f"Invalid sample point: {qid}"
                x, y = (float(value.replace(",", ".")) for value in match.groups())
                if question["answer"]["integer"]:
                    assert x.is_integer() and y.is_integer()
                for bound in question["answer"]["constraints"]:
                    assert bound["op"] in ("≤", "<")
                    assert bound["a"] != 0 or bound["b"] != 0
                    value = bound["a"] * x + bound["b"] * y
                    assert value < bound["c"] if bound["op"] == "<" else value <= bound["c"]
            else:
                raise ValueError(f"Unknown question type: {kind}")
    assert len(seen) == 24


def typst(*args: str) -> None:
    root = next(p for p in HERE.parents if (p / "public/hdsd/typst/sang-math-geom.typ").is_file())
    subprocess.run(["typst", "compile", "--root", str(root), *args], check=True)


def render() -> dict[str, list[str]]:
    DIST.mkdir(exist_ok=True)
    SCORM.mkdir(exist_ok=True)
    assets = SCORM / "assets"
    assets.mkdir(exist_ok=True)
    for stale in assets.glob("section-*.svg"):
        stale.unlink()
    typst(str(HERE / "main.typ"), str(DIST / "bai-giang-hoc-sinh.pdf"))
    typst("--input", "teacher=1", str(HERE / "main.typ"), str(DIST / "bai-giang-giao-vien.pdf"))
    shutil.copy2(DIST / "bai-giang-hoc-sinh.pdf", SCORM / "bai-giang-hoc-sinh.pdf")
    section_pages = {}
    with tempfile.TemporaryDirectory(prefix="sang-math-scorm-") as temp:
        tmp = Path(temp)
        for section_id in SECTION_IDS:
            typst(
                "--input", "scorm=1", "--input", f"section={section_id}",
                str(HERE / "section-view.typ"), str(tmp / f"section-{section_id}-{{p}}.svg"),
            )
            pages = sorted(tmp.glob(f"section-{section_id}-*.svg"), key=lambda p: int(p.stem.rsplit("-", 1)[1]))
            if not pages:
                raise RuntimeError(f"Typst did not render section {section_id}")
            section_pages[section_id] = []
            for page in pages:
                shutil.copy2(page, assets / page.name)
                section_pages[section_id].append(f"assets/{page.name}")
    return section_pages


def build_html(pages: dict[str, list[str]]) -> None:
    nav = []
    articles = []
    for section_id, section in LESSON["sections"].items():
        title = html.escape(section["title"])
        nav.append(f'<a href="#tiet-{section_id}" data-nav="{section_id}">{title}</a>')
        figures = "\n".join(
            f'<a class="page-link" href="{html.escape(path)}" target="_blank" rel="noopener" title="Mở trang để phóng to">'
            f'<img class="lesson-page" src="{html.escape(path)}" alt="Nội dung bài giảng {title}, trang {n}" loading="lazy"></a>'
            for n, path in enumerate(pages[section_id], 1)
        )
        articles.append(
            f'<section class="lesson-section" id="tiet-{section_id}" data-section="{section_id}">'
            f'<div class="section-heading"><span class="eyebrow">TOÁN 10 · {section["minutes"]} PHÚT</span>'
            f'<h2>{title}</h2></div>'
            f'<div class="pages">{figures}</div>'
            f'<div class="checkpoint"><div class="quiz-heading"><h3>Tự kiểm tra tại chỗ</h3>'
            f'<p>6 câu · bấm Kiểm tra sau mỗi câu · có thể sửa và thử lại</p></div>'
            f'<div class="questions" data-questions="{section_id}"></div></div></section>'
        )
    serialized = json.dumps(LESSON, ensure_ascii=False, separators=(",", ":")).replace("<", "\\u003c")
    document = f'''<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>{html.escape(LESSON["title"])} · SANG MATH</title>
  <link rel="stylesheet" href="scorm.css">
</head>
<body>
  <header class="site-header">
    <div class="brand">SANG MATH <span>· BÀI GIẢNG TƯƠNG TÁC</span></div>
    <div class="progress-wrap" aria-live="polite"><span id="progress-label">0/24 câu hoàn thành</span><progress id="progress" max="24" value="0"></progress></div>
  </header>
  <div class="layout">
    <nav class="toc" aria-label="Mục lục bài giảng"><div class="toc-title">NỘI DUNG 4 TIẾT</div>{''.join(nav)}<a class="pdf-link" href="bai-giang-hoc-sinh.pdf" download>Tải bản PDF học sinh ↗</a></nav>
    <main>
      <div class="hero"><div class="eyebrow">BÀI GIẢNG TOÁN 10 · SCORM 1.2</div><h1>Hệ bất phương trình<br>bậc nhất hai ẩn</h1><p>Từ mô hình thực tế đến miền nghiệm, tối ưu và quyết định. Học từng tiết, làm câu hỏi ngay tại chỗ và nhận phản hồi tức thì.</p><div class="meta"><span>4 tiết · 180 phút</span><span>24 câu tương tác</span><span>Lưu tiến độ học</span></div></div>
      {''.join(articles)}
      <footer>Biên soạn từ nguồn Typst · Đồ thị dùng thư viện sang-math-geom · Bản học sinh PDF đi kèm</footer>
    </main>
  </div>
  <script type="application/json" id="lesson-data">{serialized}</script>
  <script src="scorm.js" defer></script>
</body>
</html>'''
    (SCORM / "index.html").write_text(document, encoding="utf-8")
    for name in ("scorm.css", "scorm.js"):
        shutil.copy2(HERE / name, SCORM / name)


def build_manifest() -> None:
    ns = "http://www.imsproject.org/xsd/imscp_rootv1p1p2"
    adl = "http://www.adlnet.org/xsd/adlcp_rootv1p2"
    ET.register_namespace("", ns)
    ET.register_namespace("adlcp", adl)
    manifest = ET.Element(f"{{{ns}}}manifest", {"identifier": "SANG-MATH-HE-BPT-HAI-AN-V1", "version": "1.0"})
    meta = ET.SubElement(manifest, f"{{{ns}}}metadata")
    ET.SubElement(meta, f"{{{ns}}}schema").text = "ADL SCORM"
    ET.SubElement(meta, f"{{{ns}}}schemaversion").text = "1.2"
    orgs = ET.SubElement(manifest, f"{{{ns}}}organizations", {"default": "ORG-1"})
    org = ET.SubElement(orgs, f"{{{ns}}}organization", {"identifier": "ORG-1"})
    ET.SubElement(org, f"{{{ns}}}title").text = LESSON["title"]
    item = ET.SubElement(org, f"{{{ns}}}item", {"identifier": "ITEM-1", "identifierref": "RES-1", "isvisible": "true"})
    ET.SubElement(item, f"{{{ns}}}title").text = LESSON["title"]
    resources = ET.SubElement(manifest, f"{{{ns}}}resources")
    resource = ET.SubElement(resources, f"{{{ns}}}resource", {"identifier": "RES-1", "type": "webcontent", f"{{{adl}}}scormtype": "sco", "href": "index.html"})
    for path in sorted(p for p in SCORM.rglob("*") if p.is_file() and p.name != "imsmanifest.xml"):
        ET.SubElement(resource, f"{{{ns}}}file", {"href": path.relative_to(SCORM).as_posix()})
    ET.indent(manifest)
    ET.ElementTree(manifest).write(SCORM / "imsmanifest.xml", encoding="utf-8", xml_declaration=True)


def package() -> Path:
    output = DIST / "he-bat-phuong-trinh-bac-nhat-hai-an-scorm12.zip"
    with zipfile.ZipFile(output, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for path in sorted(p for p in SCORM.rglob("*") if p.is_file()):
            archive.write(path, path.relative_to(SCORM).as_posix())
    with zipfile.ZipFile(output) as archive:
        assert archive.testzip() is None
        assert "imsmanifest.xml" in archive.namelist()
        ET.fromstring(archive.read("imsmanifest.xml"))
    return output


def main() -> None:
    validate_bank()
    pages = render()
    build_html(pages)
    build_manifest()
    output = package()
    print(f"Built {output}")
    print("Pages per lesson:", ", ".join(f"{key}: {len(value)}" for key, value in pages.items()))


if __name__ == "__main__":
    main()
