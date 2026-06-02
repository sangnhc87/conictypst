#!/usr/bin/env python3

import argparse
import io
import os
import shutil
import zipfile
import xml.etree.ElementTree as ET

W_NS = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
R_NS = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"
REL_NS = "http://schemas.openxmlformats.org/package/2006/relationships"
CT_NS = "http://schemas.openxmlformats.org/package/2006/content-types"

PAGE_W = 11906
PAGE_H = 16838
LEFT_M = 992
RIGHT_M = 992
TOP_M = 851
BOTTOM_M = 851

ANSWER_HDR_FILL_A = "DDEBF7"
ANSWER_HDR_FILL_B = "EAF3FB"
ANSWER_BODY_FILL_A = "F7FBFF"
ANSWER_BODY_FILL_B = "EFF6FC"
ANSWER_FIRST_COL_FILL = "E2F0D9"


def _w(tag):
    return f"{{{W_NS}}}{tag}"


def _r(tag):
    return f"{{{R_NS}}}{tag}"


def _register_namespaces(xml_bytes):
    ns_map = {}
    for _, elem in ET.iterparse(io.BytesIO(xml_bytes), events=["start-ns"]):
        prefix, uri = elem
        if prefix not in ns_map:
            ns_map[prefix] = uri
            ET.register_namespace(prefix, uri)
    return ns_map


def _ensure_ppr(paragraph):
    ppr = paragraph.find(_w("pPr"))
    if ppr is None:
        ppr = ET.Element(_w("pPr"))
        paragraph.insert(0, ppr)
    return ppr


def _ensure_tcpr(cell):
    tcpr = cell.find(_w("tcPr"))
    if tcpr is None:
        tcpr = ET.Element(_w("tcPr"))
        cell.insert(0, tcpr)
    return tcpr


def _set_or_create(parent, tag):
    child = parent.find(_w(tag))
    if child is None:
        child = ET.SubElement(parent, _w(tag))
    return child


def _get_text(node):
    return " ".join("".join(node.itertext()).split())


def _patch_styles_xml(styles_bytes):
    _register_namespaces(styles_bytes)
    root = ET.fromstring(styles_bytes)

    doc_defaults = root.find(_w("docDefaults"))
    if doc_defaults is None:
        doc_defaults = ET.Element(_w("docDefaults"))
        root.insert(0, doc_defaults)

    rpr_default = doc_defaults.find(_w("rPrDefault"))
    if rpr_default is None:
        rpr_default = ET.SubElement(doc_defaults, _w("rPrDefault"))
    rpr = rpr_default.find(_w("rPr"))
    if rpr is None:
        rpr = ET.SubElement(rpr_default, _w("rPr"))

    rfonts = _set_or_create(rpr, "rFonts")
    for attr in ("asciiTheme", "hAnsiTheme", "eastAsiaTheme", "cstheme"):
        rfonts.attrib.pop(_w(attr), None)
    rfonts.set(_w("ascii"), "Times New Roman")
    rfonts.set(_w("hAnsi"), "Times New Roman")
    rfonts.set(_w("eastAsia"), "Times New Roman")
    rfonts.set(_w("cs"), "Times New Roman")

    sz = _set_or_create(rpr, "sz")
    sz.set(_w("val"), "24")
    szcs = _set_or_create(rpr, "szCs")
    szcs.set(_w("val"), "24")

    ppr_default = doc_defaults.find(_w("pPrDefault"))
    if ppr_default is None:
        ppr_default = ET.SubElement(doc_defaults, _w("pPrDefault"))
    ppr = ppr_default.find(_w("pPr"))
    if ppr is None:
        ppr = ET.SubElement(ppr_default, _w("pPr"))
    spacing = _set_or_create(ppr, "spacing")
    if _w("after") not in spacing.attrib:
        spacing.set(_w("after"), "200")
    spacing.set(_w("line"), "300")
    spacing.set(_w("lineRule"), "auto")

    exam_styles = {
        "OptionsLayout": {"before": "0", "after": "80"},
        "OptionsLayout1x4": {"before": "0", "after": "80"},
        "CauHoi": {"before": "200", "after": "60"},
        "CenteredImage": {"before": "40", "after": "80"},
    }

    for style in root.findall(_w("style")):
        style_id = style.get(_w("styleId"))
        if style_id not in exam_styles:
            continue
        style_ppr = style.find(_w("pPr"))
        if style_ppr is None:
            style_ppr = ET.SubElement(style, _w("pPr"))
        style_spacing = _set_or_create(style_ppr, "spacing")
        style_spacing.set(_w("before"), exam_styles[style_id]["before"])
        style_spacing.set(_w("after"), exam_styles[style_id]["after"])
        style_spacing.set(_w("line"), "300")
        style_spacing.set(_w("lineRule"), "auto")

    return ET.tostring(root, encoding="UTF-8", xml_declaration=True)


def _enable_update_fields(settings_bytes):
    _register_namespaces(settings_bytes)
    root = ET.fromstring(settings_bytes)
    update_fields = root.find(_w("updateFields"))
    if update_fields is None:
        update_fields = ET.SubElement(root, _w("updateFields"))
    update_fields.set(_w("val"), "true")
    return ET.tostring(root, encoding="UTF-8", xml_declaration=True)


def _has_media_content(paragraph):
    for elem in paragraph.iter():
        if elem.tag in {_w("drawing"), _w("pict")}:
            return True
    return False


def _center_media_paragraphs(body):
    for paragraph in body.iter(_w("p")):
        if not _has_media_content(paragraph):
            continue
        ppr = _ensure_ppr(paragraph)
        jc = ppr.find(_w("jc"))
        if jc is None:
            jc = ET.SubElement(ppr, _w("jc"))
        jc.set(_w("val"), "center")


def _set_cell_shading(cell, fill):
    tcpr = _ensure_tcpr(cell)
    for old in list(tcpr.findall(_w("shd"))):
        tcpr.remove(old)
    ET.SubElement(tcpr, _w("shd"), {
        _w("val"): "clear",
        _w("color"): "auto",
        _w("fill"): fill,
    })


def _center_cell_content(cell):
    tcpr = _ensure_tcpr(cell)
    valign = tcpr.find(_w("vAlign"))
    if valign is None:
        valign = ET.SubElement(tcpr, _w("vAlign"))
    valign.set(_w("val"), "center")

    for paragraph in cell.findall(_w("p")):
        ppr = _ensure_ppr(paragraph)
        jc = ppr.find(_w("jc"))
        if jc is None:
            jc = ET.SubElement(ppr, _w("jc"))
        jc.set(_w("val"), "center")


def _beautify_answer_table(table):
    tblpr = table.find(_w("tblPr"))
    if tblpr is None:
        tblpr = ET.Element(_w("tblPr"))
        table.insert(0, tblpr)

    jc = tblpr.find(_w("jc"))
    if jc is None:
        jc = ET.SubElement(tblpr, _w("jc"))
    jc.set(_w("val"), "center")

    rows = table.findall(_w("tr"))
    for row_idx, row in enumerate(rows):
        cells = row.findall(_w("tc"))
        for col_idx, cell in enumerate(cells):
            _center_cell_content(cell)
            text = " ".join("".join(paragraph.itertext()).strip() for paragraph in cell.findall(_w("p"))).strip()
            upper_text = text.upper()
            if row_idx == 0:
                fill = ANSWER_HDR_FILL_A if col_idx % 2 == 0 else ANSWER_HDR_FILL_B
            elif col_idx == 0 and upper_text not in {"", "ĐÁP ÁN", "PHẦN"}:
                fill = ANSWER_FIRST_COL_FILL
            else:
                fill = ANSWER_BODY_FILL_A if (row_idx + col_idx) % 2 == 0 else ANSWER_BODY_FILL_B
            _set_cell_shading(cell, fill)


def _beautify_answer_tables(body):
    in_answer_section = False
    for child in list(body):
        if child.tag == _w("p"):
            text = _get_text(child).upper()
            if "BẢNG ĐÁP ÁN" in text:
                in_answer_section = True
            elif in_answer_section and text.startswith("HẾT"):
                in_answer_section = False
        elif child.tag == _w("tbl") and in_answer_section:
            _beautify_answer_table(child)


def _build_footer_xml(exam_code=""):
    ET.register_namespace("w", W_NS)
    ET.register_namespace("r", R_NS)

    footer = ET.Element(_w("ftr"))
    paragraph = ET.SubElement(footer, _w("p"))
    ppr = ET.SubElement(paragraph, _w("pPr"))
    ET.SubElement(ppr, _w("jc"), {_w("val"): "center"})

    def _apply_rpr(run_pr, bold=False):
        ET.SubElement(run_pr, _w("rFonts"), {
            _w("ascii"): "Times New Roman",
            _w("hAnsi"): "Times New Roman",
            _w("eastAsia"): "Times New Roman",
            _w("cs"): "Times New Roman",
        })
        if bold:
            ET.SubElement(run_pr, _w("b"))
            ET.SubElement(run_pr, _w("bCs"))
        ET.SubElement(run_pr, _w("sz"), {_w("val"): "18"})
        ET.SubElement(run_pr, _w("szCs"), {_w("val"): "18"})

    def _add_run(text, bold=False):
        run = ET.SubElement(paragraph, _w("r"))
        run_pr = ET.SubElement(run, _w("rPr"))
        _apply_rpr(run_pr, bold=bold)
        text_node = ET.SubElement(run, _w("t"))
        text_node.set("{http://www.w3.org/XML/1998/namespace}space", "preserve")
        text_node.text = text

    def _add_field(field_code, bold=False):
        run_begin = ET.SubElement(paragraph, _w("r"))
        run_begin_pr = ET.SubElement(run_begin, _w("rPr"))
        _apply_rpr(run_begin_pr, bold=bold)
        ET.SubElement(run_begin, _w("fldChar"), {_w("fldCharType"): "begin"})

        run_instr = ET.SubElement(paragraph, _w("r"))
        run_instr_pr = ET.SubElement(run_instr, _w("rPr"))
        _apply_rpr(run_instr_pr, bold=bold)
        instr = ET.SubElement(run_instr, _w("instrText"))
        instr.set("{http://www.w3.org/XML/1998/namespace}space", "preserve")
        instr.text = f" {field_code} "

        run_sep = ET.SubElement(paragraph, _w("r"))
        run_sep_pr = ET.SubElement(run_sep, _w("rPr"))
        _apply_rpr(run_sep_pr, bold=bold)
        ET.SubElement(run_sep, _w("fldChar"), {_w("fldCharType"): "separate"})

        run_placeholder = ET.SubElement(paragraph, _w("r"))
        run_placeholder_pr = ET.SubElement(run_placeholder, _w("rPr"))
        _apply_rpr(run_placeholder_pr, bold=bold)
        placeholder = ET.SubElement(run_placeholder, _w("t"))
        placeholder.text = "1"

        run_end = ET.SubElement(paragraph, _w("r"))
        run_end_pr = ET.SubElement(run_end, _w("rPr"))
        _apply_rpr(run_end_pr, bold=bold)
        ET.SubElement(run_end, _w("fldChar"), {_w("fldCharType"): "end"})

    _add_run("Trang ")
    _add_field("PAGE", bold=True)
    _add_run(" / ")
    _add_field("NUMPAGES", bold=True)
    if exam_code:
        _add_run(f"    Mã đề: {exam_code}")

    return ET.tostring(footer, encoding="UTF-8", xml_declaration=True)


def _wire_footer(all_files, footer_xml, body):
    all_files["word/footer1.xml"] = footer_xml

    if "[Content_Types].xml" in all_files:
        ct_bytes = all_files["[Content_Types].xml"]
        _register_namespaces(ct_bytes)
        ct_root = ET.fromstring(ct_bytes)
        exists = any(
            elem.get("PartName") == "/word/footer1.xml"
            for elem in ct_root.findall(f"{{{CT_NS}}}Override")
        )
        if not exists:
            ET.SubElement(ct_root, f"{{{CT_NS}}}Override", {
                "PartName": "/word/footer1.xml",
                "ContentType": "application/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml",
            })
        all_files["[Content_Types].xml"] = ET.tostring(ct_root, encoding="UTF-8", xml_declaration=True)

    rels_path = "word/_rels/document.xml.rels"
    if rels_path in all_files:
        rels_bytes = all_files[rels_path]
        _register_namespaces(rels_bytes)
        rels_root = ET.fromstring(rels_bytes)
    else:
        ET.register_namespace("", REL_NS)
        rels_root = ET.Element(f"{{{REL_NS}}}Relationships")

    max_id = 0
    for rel in rels_root:
        rid = rel.get("Id", "")
        if rid.startswith("rId"):
            try:
                max_id = max(max_id, int(rid[3:]))
            except ValueError:
                pass

    for rel in list(rels_root):
        if "footer" in rel.get("Type", "").lower():
            rels_root.remove(rel)

    footer_rid = f"rId{max_id + 1}"
    ET.SubElement(rels_root, f"{{{REL_NS}}}Relationship", {
        "Id": footer_rid,
        "Type": "http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer",
        "Target": "footer1.xml",
    })
    all_files[rels_path] = ET.tostring(rels_root, encoding="UTF-8", xml_declaration=True)

    sectpr = body.find(_w("sectPr"))
    if sectpr is None:
        sectpr = ET.SubElement(body, _w("sectPr"))

    for ref in list(sectpr.findall(_w("footerReference"))):
        sectpr.remove(ref)

    sectpr.insert(0, ET.Element(_w("footerReference"), {
        _w("type"): "default",
        _r("id"): footer_rid,
    }))

    pgsz = _set_or_create(sectpr, "pgSz")
    pgsz.set(_w("w"), str(PAGE_W))
    pgsz.set(_w("h"), str(PAGE_H))

    pgmar = _set_or_create(sectpr, "pgMar")
    pgmar.set(_w("top"), str(TOP_M))
    pgmar.set(_w("right"), str(RIGHT_M))
    pgmar.set(_w("bottom"), str(BOTTOM_M))
    pgmar.set(_w("left"), str(LEFT_M))
    pgmar.set(_w("header"), "360")
    pgmar.set(_w("footer"), "360")
    pgmar.set(_w("gutter"), "0")

    cols = _set_or_create(sectpr, "cols")
    cols.set(_w("space"), "708")

    doc_grid = _set_or_create(sectpr, "docGrid")
    doc_grid.set(_w("linePitch"), "360")


def postprocess_docx(docx_path, exam_code="", add_footer=False):
    with zipfile.ZipFile(docx_path, "r") as source:
        all_files = {item.filename: source.read(item.filename) for item in source.infolist()}

    if "word/styles.xml" in all_files:
        all_files["word/styles.xml"] = _patch_styles_xml(all_files["word/styles.xml"])

    if "word/settings.xml" in all_files:
        all_files["word/settings.xml"] = _enable_update_fields(all_files["word/settings.xml"])

    if "word/document.xml" in all_files:
        doc_xml = all_files["word/document.xml"]
        _register_namespaces(doc_xml)
        root = ET.fromstring(doc_xml)
        body = root.find(_w("body"))
        if body is not None:
            _center_media_paragraphs(body)
            _beautify_answer_tables(body)
            if add_footer:
                _wire_footer(all_files, _build_footer_xml(exam_code), body)
            all_files["word/document.xml"] = ET.tostring(root, encoding="UTF-8", xml_declaration=True)

    temp_path = docx_path + ".tmp"
    with zipfile.ZipFile(temp_path, "w", zipfile.ZIP_DEFLATED) as target:
        for filename, data in all_files.items():
            target.writestr(filename, data)
    shutil.move(temp_path, docx_path)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("docx_path")
    parser.add_argument("--exam-code", default="")
    parser.add_argument("--add-footer", action="store_true")
    args = parser.parse_args()

    if not os.path.exists(args.docx_path):
        raise SystemExit(f"File not found: {args.docx_path}")

    postprocess_docx(
        args.docx_path,
        exam_code=args.exam_code,
        add_footer=args.add_footer,
    )


if __name__ == "__main__":
    main()