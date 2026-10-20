import io
import json
import re
import zipfile
import xml.etree.ElementTree as ET
from copy import deepcopy

W_NS = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"

MC_LABELS = ["A.", "B.", "C.", "D."]
TF_LABELS = ["a)", "b)", "c)", "d)"]

QUESTION_RE = re.compile(r"^Câu\s+\d+\s*[:.]", re.IGNORECASE)
SECTION_RE = re.compile(r"^(PHẦN|Phần)\s+[IVX0-9]+", re.IGNORECASE)
ANSWER_TABLE_RE = re.compile(r"BẢNG\s+ĐÁP\s+ÁN", re.IGNORECASE)
SHORT_ANSWER_RE = re.compile(r"^Đáp án\s*:\s*(.+)$", re.IGNORECASE)
SOLUTION_RE = re.compile(r"^(Lời giải|Phương pháp|Áp dụng)\b(?:\s*:?(?:\s+.*)?)?$", re.IGNORECASE)

CHOICE_INDENT = 840
CHOICE_HANGING = 300


def _w(tag):
    return f"{{{W_NS}}}{tag}"


def _register_namespaces(xml_bytes):
    ns_map = {}
    for _, elem in ET.iterparse(io.BytesIO(xml_bytes), events=["start-ns"]):
        prefix, uri = elem
        if prefix not in ns_map:
            ns_map[prefix] = uri
            ET.register_namespace(prefix, uri)
    return ns_map


def _child_text(child):
    return " ".join("".join(child.itertext()).split())


def _run_text(run):
    return "".join(t.text or "" for t in run.findall(_w("t")))


def _normalized_label(text):
    return "".join(text.split())


def _is_paragraph(child):
    return child.tag == _w("p")


def _is_table(child):
    return child.tag == _w("tbl")


def _label_run_map(paragraph, labels):
    label_set = set(labels)
    mapping = {}
    for run in paragraph.findall(_w("r")):
        text = _normalized_label(_run_text(run))
        if text in label_set and text not in mapping:
            mapping[text] = run
    return mapping


def _is_choice_group_paragraph(paragraph, labels):
    return len(_label_run_map(paragraph, labels)) == len(labels)


def _run_has_underline(run):
    r_pr = run.find(_w("rPr"))
    if r_pr is None:
        return False
    underline = r_pr.find(_w("u"))
    if underline is None:
        return False
    return underline.get(_w("val"), "single") != "none"


def _ensure_run_pr(run):
    r_pr = run.find(_w("rPr"))
    if r_pr is None:
        r_pr = ET.Element(_w("rPr"))
        run.insert(0, r_pr)
    return r_pr


def _set_run_underline(run):
    r_pr = _ensure_run_pr(run)
    underline = r_pr.find(_w("u"))
    if underline is None:
        underline = ET.SubElement(r_pr, _w("u"))
    underline.set(_w("val"), "single")


def _clear_run_underline(run):
    r_pr = run.find(_w("rPr"))
    if r_pr is None:
        return
    for underline in list(r_pr.findall(_w("u"))):
        r_pr.remove(underline)


def _ensure_paragraph_props(paragraph):
    p_pr = paragraph.find(_w("pPr"))
    if p_pr is None:
        p_pr = ET.Element(_w("pPr"))
        paragraph.insert(0, p_pr)
    return p_pr


def _ensure_paragraph_spacing(paragraph):
    p_pr = _ensure_paragraph_props(paragraph)
    spacing = p_pr.find(_w("spacing"))
    if spacing is None:
        spacing = ET.SubElement(p_pr, _w("spacing"))
    spacing.set(_w("after"), "0")
    spacing.set(_w("before"), "0")
    spacing.set(_w("line"), "240")
    spacing.set(_w("lineRule"), "auto")


def _apply_choice_indent(paragraph):
    p_pr = _ensure_paragraph_props(paragraph)
    ind = p_pr.find(_w("ind"))
    if ind is None:
        ind = ET.SubElement(p_pr, _w("ind"))
    ind.set(_w("left"), str(CHOICE_INDENT))

    mc_labels = _label_run_map(paragraph, MC_LABELS)
    tf_labels = _label_run_map(paragraph, TF_LABELS)
    if len(mc_labels) <= 1 and len(tf_labels) <= 1:
        ind.set(_w("hanging"), str(CHOICE_HANGING))


def _apply_basic_formatting(body):
    for paragraph in body.iter(_w("p")):
        _ensure_paragraph_spacing(paragraph)
        text = _child_text(paragraph)
        if text.startswith(tuple(MC_LABELS + TF_LABELS)):
            _apply_choice_indent(paragraph)


def _make_run(text, bold=False):
    run = ET.Element(_w("r"))
    r_pr = ET.SubElement(run, _w("rPr"))
    if bold:
        ET.SubElement(r_pr, _w("b"))
        ET.SubElement(r_pr, _w("bCs"))
    t = ET.SubElement(run, _w("t"))
    t.set("{http://www.w3.org/XML/1998/namespace}space", "preserve")
    t.text = text
    return run


def _make_paragraph(text=None, bold=False, alignment=None):
    paragraph = ET.Element(_w("p"))
    p_pr = ET.SubElement(paragraph, _w("pPr"))
    if alignment:
        ET.SubElement(p_pr, _w("jc"), {_w("val"): alignment})
    _ensure_paragraph_spacing(paragraph)
    if text is not None:
        paragraph.append(_make_run(text, bold=bold))
    return paragraph


def _make_table(rows):
    table = ET.Element(_w("tbl"))
    tbl_pr = ET.SubElement(table, _w("tblPr"))
    ET.SubElement(tbl_pr, _w("tblStyle"), {_w("val"): "Table"})
    ET.SubElement(tbl_pr, _w("tblW"), {_w("w"): "0", _w("type"): "auto"})

    max_cols = max((len(row) for row in rows), default=1)
    tbl_grid = ET.SubElement(table, _w("tblGrid"))
    for _ in range(max_cols):
        ET.SubElement(tbl_grid, _w("gridCol"), {_w("w"): "2400"})

    for row_index, row in enumerate(rows):
        tr = ET.SubElement(table, _w("tr"))
        if row_index == 0:
            tr_pr = ET.SubElement(tr, _w("trPr"))
            ET.SubElement(tr_pr, _w("tblHeader"), {_w("val"): "on"})
        for cell_text in row:
            tc = ET.SubElement(tr, _w("tc"))
            ET.SubElement(tc, _w("tcPr"))
            p = ET.SubElement(tc, _w("p"))
            p_pr = ET.SubElement(p, _w("pPr"))
            ET.SubElement(p_pr, _w("jc"), {_w("val"): "center"})
            _ensure_paragraph_spacing(p)
            p.append(_make_run(str(cell_text), bold=row_index == 0 or str(cell_text).startswith("Đáp án")))
    return table


def _table_to_matrix(table):
    matrix = []
    for tr in table.findall(_w("tr")):
        row = []
        for tc in tr.findall(_w("tc")):
            row.append(_child_text(tc))
        if row:
            matrix.append(row)
    return matrix


def _find_answer_table_index(children):
    for index, child in enumerate(children):
        if _is_paragraph(child) and ANSWER_TABLE_RE.search(_child_text(child)):
            return index
    return None


def _extract_answer_table_region(children):
    start_index = _find_answer_table_index(children)
    if start_index is None:
        return None
    region = []
    for child in children[start_index:]:
        if child.tag == _w("sectPr"):
            break
        region.append(deepcopy(child))
    return region


def _parse_mc_answer_from_descriptor(descriptor):
    for paragraph in descriptor["paragraphs"]:
        for label, run in _label_run_map(paragraph, MC_LABELS).items():
            if _run_has_underline(run):
                return label[0].upper()
    return "?"


def _parse_tf_answer_from_descriptor(descriptor):
    values = []
    for label in TF_LABELS:
        value = "S"
        for paragraph in descriptor["paragraphs"]:
            mapping = _label_run_map(paragraph, TF_LABELS)
            run = mapping.get(label)
            if run is not None:
                value = "Đ" if _run_has_underline(run) else "S"
                break
        values.append(value)
    return values


def _collect_choice_groups(children, stop_index=None):
    limit = len(children) if stop_index is None else stop_index
    groups = []
    index = 0

    while index < limit:
        child = children[index]
        if not _is_paragraph(child):
            index += 1
            continue

        if _is_choice_group_paragraph(child, MC_LABELS):
            groups.append({"kind": "mc", "paragraphs": [child]})
            index += 1
            continue

        if _is_choice_group_paragraph(child, TF_LABELS):
            groups.append({"kind": "tf", "paragraphs": [child]})
            index += 1
            continue

        next_four = children[index:index + 4]
        if len(next_four) == 4 and all(_is_paragraph(item) for item in next_four):
            mc_match = True
            tf_match = True
            for paragraph, label in zip(next_four, MC_LABELS):
                if label not in _label_run_map(paragraph, [label]):
                    mc_match = False
                    break
            for paragraph, label in zip(next_four, TF_LABELS):
                if label not in _label_run_map(paragraph, [label]):
                    tf_match = False
                    break
            if mc_match:
                groups.append({"kind": "mc", "paragraphs": list(next_four)})
                index += 4
                continue
            if tf_match:
                groups.append({"kind": "tf", "paragraphs": list(next_four)})
                index += 4
                continue

        index += 1

    return groups


def _parse_answer_table(region_children):
    parsed = {"mc": [], "tf": [], "sa": []}
    if not region_children:
        return parsed

    section = None
    for child in region_children:
        if _is_paragraph(child):
            text = _child_text(child)
            if text.startswith("A. ĐÁP ÁN PHẦN I"):
                section = "mc"
            elif text.startswith("B. ĐÁP ÁN PHẦN II"):
                section = "tf"
            elif text.startswith("C. ĐÁP ÁN PHẦN III"):
                section = "sa"
        elif _is_table(child):
            matrix = _table_to_matrix(child)
            if not matrix:
                continue
            if section == "mc" and len(matrix) >= 2:
                for question, answer in zip(matrix[0], matrix[1]):
                    if question.strip().isdigit() and answer.strip():
                        parsed["mc"].append(answer.strip().replace(".", "").upper())
            elif section == "tf" and len(matrix) >= 2:
                for row in matrix[1:]:
                    if len(row) >= 5 and row[0].strip().isdigit():
                        parsed["tf"].append([cell.strip().upper() or "S" for cell in row[1:5]])
            elif section == "sa" and len(matrix) >= 2:
                header_row = matrix[0][1:] if matrix[0] and matrix[0][0].startswith("Câu") else matrix[0]
                answer_row = matrix[1][1:] if matrix[1] and matrix[1][0].startswith("Đáp án") else matrix[1]
                for question, answer in zip(header_row, answer_row):
                    if question.strip().isdigit() and answer.strip():
                        parsed["sa"].append(answer.strip())

    return parsed


def _scan_main_body(children, stop_index=None):
    limit = len(children) if stop_index is None else stop_index
    question_count = 0
    short_answers = []

    for child in children[:limit]:
        if not _is_paragraph(child):
            continue
        text = _child_text(child)
        if QUESTION_RE.match(text):
            question_count += 1
        match = SHORT_ANSWER_RE.match(text)
        if match:
            short_answers.append(match.group(1).strip())

    groups = _collect_choice_groups(children, stop_index=limit)
    mc_answers = []
    tf_answers = []
    for descriptor in groups:
        if descriptor["kind"] == "mc":
            mc_answers.append(_parse_mc_answer_from_descriptor(descriptor))
        elif descriptor["kind"] == "tf":
            tf_answers.append(_parse_tf_answer_from_descriptor(descriptor))

    return {
        "question_count": question_count,
        "mc": mc_answers,
        "tf": tf_answers,
        "sa": short_answers,
    }


def _merge_answers(primary, fallback):
    return {
        "mc": primary["mc"] if primary["mc"] else fallback["mc"],
        "tf": primary["tf"] if primary["tf"] else fallback["tf"],
        "sa": primary["sa"] if primary["sa"] else fallback["sa"],
    }


def _build_report_analysis(children):
    answer_table_index = _find_answer_table_index(children)
    answer_table_region = _extract_answer_table_region(children)
    main_scan = _scan_main_body(children, stop_index=answer_table_index)
    table_scan = _parse_answer_table(answer_table_region)
    answers = _merge_answers(table_scan, main_scan)

    counts = {
        "total": main_scan["question_count"] or len(answers["mc"]) + len(answers["tf"]) + len(answers["sa"]),
        "mc": len(answers["mc"]),
        "tf": len(answers["tf"]),
        "sa": len(answers["sa"]),
    }
    if counts["sa"] == 0 and counts["total"] > counts["mc"] + counts["tf"]:
        counts["sa"] = counts["total"] - counts["mc"] - counts["tf"]

    warnings = []
    if answer_table_region is None:
        warnings.append("Không thấy vùng 'BẢNG ĐÁP ÁN' sẵn trong DOCX; hệ thống sẽ tự dựng bảng nếu nhận diện được đáp án.")
    if not any(answers.values()):
        warnings.append("Chưa nhận diện được đáp án từ gạch chân, dòng 'Đáp án:' hoặc bảng đáp án; các file sinh ra sẽ thiên về làm đẹp bố cục.")
    if counts["total"] == 0:
        warnings.append("Không tìm thấy mẫu 'Câu n:' trong DOCX; hãy kiểm tra lại bố cục đề nguồn.")

    return {
        "counts": counts,
        "answers": answers,
        "answer_table_region": answer_table_region,
        "warnings": warnings,
        "answer_table_present": answer_table_region is not None,
    }


def _replace_body_children(body, new_children):
    section = body.find(_w("sectPr"))
    if section is not None:
        body.remove(section)
    for child in list(body):
        body.remove(child)
    for child in new_children:
        body.append(child)
    if section is not None:
        body.append(section)


def _is_solution_start(text):
    return bool(SOLUTION_RE.match(text))


def _is_short_answer_line(text):
    return bool(SHORT_ANSWER_RE.match(text))


def _is_question_or_section(text):
    return bool(QUESTION_RE.match(text) or SECTION_RE.match(text) or ANSWER_TABLE_RE.search(text))


def _copy_main_exam_children(children, keep_solutions=False, keep_short_answers=False):
    answer_table_index = _find_answer_table_index(children)
    limit = len(children) if answer_table_index is None else answer_table_index
    copied = []
    in_solution = False

    for child in children[:limit]:
        if _is_paragraph(child):
            text = _child_text(child)
            if _is_solution_start(text):
                in_solution = True
                if keep_solutions:
                    copied.append(deepcopy(child))
                continue
            if in_solution and _is_question_or_section(text):
                in_solution = False
            elif in_solution:
                if keep_solutions:
                    copied.append(deepcopy(child))
                continue
            if _is_short_answer_line(text) and not keep_short_answers:
                continue
        elif in_solution:
            if keep_solutions:
                copied.append(deepcopy(child))
            continue

        copied.append(deepcopy(child))

    return copied


def _clear_descriptor_marks(descriptor):
    labels = MC_LABELS if descriptor["kind"] == "mc" else TF_LABELS
    for paragraph in descriptor["paragraphs"]:
        for run in _label_run_map(paragraph, labels).values():
            _clear_run_underline(run)


def _apply_mc_answer(descriptor, answer):
    answer = (answer or "").strip().upper()[:1]
    if answer not in {"A", "B", "C", "D"}:
        return
    for paragraph in descriptor["paragraphs"]:
        for label, run in _label_run_map(paragraph, MC_LABELS).items():
            if label[0].upper() == answer:
                _set_run_underline(run)
            else:
                _clear_run_underline(run)


def _apply_tf_answer(descriptor, answers):
    values = list(answers or [])
    if len(values) != 4:
        return
    for paragraph in descriptor["paragraphs"]:
        mapping = _label_run_map(paragraph, TF_LABELS)
        for label, run in mapping.items():
            index = TF_LABELS.index(label)
            if values[index].strip().upper().startswith("Đ"):
                _set_run_underline(run)
            else:
                _clear_run_underline(run)


def _apply_answers_to_body(body, answers):
    groups = _collect_choice_groups(list(body))
    mc_index = 0
    tf_index = 0
    for descriptor in groups:
        if descriptor["kind"] == "mc":
            answer = answers["mc"][mc_index] if mc_index < len(answers["mc"]) else None
            if answer:
                _clear_descriptor_marks(descriptor)
                _apply_mc_answer(descriptor, answer)
            mc_index += 1
        else:
            answer = answers["tf"][tf_index] if tf_index < len(answers["tf"]) else None
            if answer:
                _clear_descriptor_marks(descriptor)
                _apply_tf_answer(descriptor, answer)
            tf_index += 1


def _clear_all_answer_marks(body):
    for descriptor in _collect_choice_groups(list(body)):
        _clear_descriptor_marks(descriptor)


def _build_generated_answer_table(answers):
    children = [_make_paragraph("BẢNG ĐÁP ÁN", bold=True, alignment="center")]

    if answers["mc"]:
        children.append(_make_paragraph("A. ĐÁP ÁN PHẦN I (Trắc nghiệm)", bold=True))
        for start in range(0, len(answers["mc"]), 10):
            chunk = answers["mc"][start:start + 10]
            numbers = [str(start + offset + 1) for offset in range(len(chunk))]
            children.append(_make_table([numbers, chunk]))

    if answers["tf"]:
        children.append(_make_paragraph("B. ĐÁP ÁN PHẦN II (Đúng/Sai)", bold=True))
        rows = [["Câu", "a)", "b)", "c)", "d)"]]
        for index, values in enumerate(answers["tf"], start=1):
            rows.append([str(index)] + values)
        children.append(_make_table(rows))

    if answers["sa"]:
        children.append(_make_paragraph("C. ĐÁP ÁN PHẦN III (Trả lời ngắn)", bold=True))
        for start in range(0, len(answers["sa"]), 6):
            chunk = answers["sa"][start:start + 6]
            numbers = [str(start + offset + 1) for offset in range(len(chunk))]
            children.append(_make_table([["Câu"] + numbers, ["Đáp án"] + chunk]))

    if len(children) == 1:
        children.append(_make_paragraph("Không nhận diện được đáp án để dựng bảng.", bold=False))

    return children


def _build_variant_document_xml(document_xml, variant, analysis):
    _register_namespaces(document_xml)
    root = ET.fromstring(document_xml)
    body = root.find(_w("body"))
    if body is None:
        return document_xml

    original_children = list(body)
    if variant == "clean":
        new_children = _copy_main_exam_children(original_children, keep_solutions=False, keep_short_answers=False)
    elif variant == "answer":
        new_children = _copy_main_exam_children(original_children, keep_solutions=False, keep_short_answers=True)
    elif variant == "solution":
        new_children = _copy_main_exam_children(original_children, keep_solutions=True, keep_short_answers=True)
    elif variant == "answer_table":
        new_children = analysis["answer_table_region"] or _build_generated_answer_table(analysis["answers"])
    else:
        new_children = [deepcopy(child) for child in original_children if child.tag != _w("sectPr")]

    _replace_body_children(body, new_children)

    if variant == "clean":
        _clear_all_answer_marks(body)
    elif variant in {"answer", "solution"}:
        _apply_answers_to_body(body, analysis["answers"])

    _apply_basic_formatting(body)
    return ET.tostring(root, encoding="UTF-8", xml_declaration=True)


def _serialize_report(analysis, generated_files):
    return {
        "counts": analysis["counts"],
        "warnings": analysis["warnings"],
        "generated_files": generated_files,
        "answer_table_present": analysis["answer_table_present"],
        "detected_answers": {
            "mc": len([answer for answer in analysis["answers"]["mc"] if answer and answer != "?"]),
            "tf": len(analysis["answers"]["tf"]),
            "sa": len(analysis["answers"]["sa"]),
        },
    }


def _report_text(base_name, report):
    counts = report["counts"]
    detected = report["detected_answers"]
    lines = [
        "BAO CAO LAM DEP DOCX",
        f"Tep nguon: {base_name}",
        "",
        f"Tong so cau: {counts['total']}",
        f"Phan I (trac nghiem): {counts['mc']}",
        f"Phan II (dung/sai): {counts['tf']}",
        f"Phan III (tra loi ngan): {counts['sa']}",
        "",
        f"Nhan dien dap an trac nghiem: {detected['mc']}",
        f"Nhan dien dap an dung/sai: {detected['tf']}",
        f"Nhan dien dap an tra loi ngan: {detected['sa']}",
        f"Co bang dap an san trong file goc: {'Co' if report['answer_table_present'] else 'Khong'}",
        "",
        "Cac tep duoc tao:",
    ]
    for name in report["generated_files"]:
        lines.append(f"- {name}")
    if report["warnings"]:
        lines.append("")
        lines.append("Canh bao:")
        for warning in report["warnings"]:
            lines.append(f"- {warning}")
    return "\n".join(lines) + "\n"


def _build_docx_bytes(all_files, document_xml):
    payload = dict(all_files)
    payload["word/document.xml"] = document_xml
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, "w", zipfile.ZIP_DEFLATED) as zout:
        for file_name, data in payload.items():
            zout.writestr(file_name, data)
    buffer.seek(0)
    return buffer.getvalue()


def _load_analysis(file_content):
    file_stream = io.BytesIO(file_content)
    try:
        with zipfile.ZipFile(file_stream, "r") as zin:
            all_files = {item.filename: zin.read(item.filename) for item in zin.infolist()}
    except zipfile.BadZipFile as exc:
        raise ValueError("File tải lên không phải DOCX hợp lệ.") from exc

    document_xml = all_files.get("word/document.xml")
    if not document_xml:
        raise ValueError("DOCX nguồn không có word/document.xml hợp lệ.")

    _register_namespaces(document_xml)
    root = ET.fromstring(document_xml)
    body = root.find(_w("body"))
    if body is None:
        raise ValueError("Không đọc được phần nội dung chính của DOCX.")

    analysis = _build_report_analysis(list(body))
    return all_files, document_xml, analysis


def _safe_stem(source_name):
    stem = (source_name or "DeThi").strip()
    stem = re.sub(r"\.docx$", "", stem, flags=re.IGNORECASE)
    stem = stem.replace("/", "_").replace("\\", "_")
    return stem or "DeThi"


def analyze_docx(file_content_js):
    file_content = file_content_js.to_py()
    _, _, analysis = _load_analysis(file_content)
    report = _serialize_report(analysis, [])
    report["suggested_files"] = [
        "*_De.docx",
        "*_DapAnGachChan.docx",
        "*_LoiGiai.docx",
        "*_BangDapAn.docx",
        "BaoCao_LamDep.txt",
    ]
    return json.dumps(report, ensure_ascii=False)


def beautify_docx(file_content_js, options_js):
    file_content = file_content_js.to_py()
    options = options_js.to_py() if options_js is not None else {}
    base_name = _safe_stem(options.get("source_name"))

    all_files, document_xml, analysis = _load_analysis(file_content)
    output_names = {
        "clean": f"{base_name}_De.docx",
        "answer": f"{base_name}_DapAnGachChan.docx",
        "solution": f"{base_name}_LoiGiai.docx",
        "answer_table": f"{base_name}_BangDapAn.docx",
    }

    zip_buffer = io.BytesIO()
    with zipfile.ZipFile(zip_buffer, "w", zipfile.ZIP_DEFLATED) as zip_file:
        generated_files = []
        for variant, output_name in output_names.items():
            variant_xml = _build_variant_document_xml(document_xml, variant, analysis)
            zip_file.writestr(output_name, _build_docx_bytes(all_files, variant_xml))
            generated_files.append(output_name)

        report = _serialize_report(analysis, generated_files)
        zip_file.writestr(
            "BaoCao_LamDep.json",
            json.dumps(report, ensure_ascii=False, indent=2).encode("utf-8"),
        )
        zip_file.writestr("BaoCao_LamDep.txt", _report_text(base_name, report).encode("utf-8"))

    zip_buffer.seek(0)
    return zip_buffer.getvalue()
