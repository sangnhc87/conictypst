import JSZip from 'jszip';

const W_NS = "http://schemas.openxmlformats.org/wordprocessingml/2006/main";
const R_NS = "http://schemas.openxmlformats.org/officeDocument/2006/relationships";
const REL_NS = "http://schemas.openxmlformats.org/package/2006/relationships";
const CT_NS = "http://schemas.openxmlformats.org/package/2006/content-types";

const PAGE_W = "11906";
const PAGE_H = "16838";
const LEFT_M = "992";
const RIGHT_M = "992";
const TOP_M = "851";
const BOTTOM_M = "851";

const ANSWER_HDR_FILL_A = "DDEBF7";
const ANSWER_HDR_FILL_B = "EAF3FB";
const ANSWER_BODY_FILL_A = "F7FBFF";
const ANSWER_BODY_FILL_B = "EFF6FC";
const ANSWER_FIRST_COL_FILL = "E2F0D9";

function _w(tag) {
  return `w:${tag}`;
}

function _ensurePPr(doc, paragraph) {
  let ppr = paragraph.getElementsByTagNameNS(W_NS, "pPr")[0];
  if (!ppr) {
    ppr = doc.createElementNS(W_NS, "w:pPr");
    if (paragraph.firstChild) {
      paragraph.insertBefore(ppr, paragraph.firstChild);
    } else {
      paragraph.appendChild(ppr);
    }
  }
  return ppr;
}

function _ensureTcPr(doc, cell) {
  let tcpr = cell.getElementsByTagNameNS(W_NS, "tcPr")[0];
  if (!tcpr) {
    tcpr = doc.createElementNS(W_NS, "w:tcPr");
    if (cell.firstChild) {
      cell.insertBefore(tcpr, cell.firstChild);
    } else {
      cell.appendChild(tcpr);
    }
  }
  return tcpr;
}

function _setOrCreate(doc, parent, tag) {
  let child = parent.getElementsByTagNameNS(W_NS, tag)[0];
  if (!child) {
    child = doc.createElementNS(W_NS, `w:${tag}`);
    parent.appendChild(child);
  }
  return child;
}

function _getText(node) {
  return (node.textContent || "").replace(/\s+/g, " ").trim();
}

function _patchStylesXml(doc) {
  let root = doc.documentElement;

  let docDefaults = root.getElementsByTagNameNS(W_NS, "docDefaults")[0];
  if (!docDefaults) {
    docDefaults = doc.createElementNS(W_NS, "w:docDefaults");
    if (root.firstChild) root.insertBefore(docDefaults, root.firstChild);
    else root.appendChild(docDefaults);
  }

  let rprDefault = docDefaults.getElementsByTagNameNS(W_NS, "rPrDefault")[0];
  if (!rprDefault) {
    rprDefault = doc.createElementNS(W_NS, "w:rPrDefault");
    docDefaults.appendChild(rprDefault);
  }
  
  let rpr = rprDefault.getElementsByTagNameNS(W_NS, "rPr")[0];
  if (!rpr) {
    rpr = doc.createElementNS(W_NS, "w:rPr");
    rprDefault.appendChild(rpr);
  }

  let rfonts = _setOrCreate(doc, rpr, "rFonts");
  ["asciiTheme", "hAnsiTheme", "eastAsiaTheme", "cstheme"].forEach(attr => {
    rfonts.removeAttributeNS(W_NS, attr);
  });
  rfonts.setAttributeNS(W_NS, "w:ascii", "Times New Roman");
  rfonts.setAttributeNS(W_NS, "w:hAnsi", "Times New Roman");
  rfonts.setAttributeNS(W_NS, "w:eastAsia", "Times New Roman");
  rfonts.setAttributeNS(W_NS, "w:cs", "Times New Roman");

  let sz = _setOrCreate(doc, rpr, "sz");
  sz.setAttributeNS(W_NS, "w:val", "24");
  let szcs = _setOrCreate(doc, rpr, "szCs");
  szcs.setAttributeNS(W_NS, "w:val", "24");

  let pprDefault = docDefaults.getElementsByTagNameNS(W_NS, "pPrDefault")[0];
  if (!pprDefault) {
    pprDefault = doc.createElementNS(W_NS, "w:pPrDefault");
    docDefaults.appendChild(pprDefault);
  }
  let ppr = pprDefault.getElementsByTagNameNS(W_NS, "pPr")[0];
  if (!ppr) {
    ppr = doc.createElementNS(W_NS, "w:pPr");
    pprDefault.appendChild(ppr);
  }
  
  let spacing = _setOrCreate(doc, ppr, "spacing");
  if (!spacing.hasAttributeNS(W_NS, "after")) {
    spacing.setAttributeNS(W_NS, "w:after", "200");
  }
  spacing.setAttributeNS(W_NS, "w:line", "300");
  spacing.setAttributeNS(W_NS, "w:lineRule", "auto");

  const examStyles = {
    "OptionsLayout": { before: "0", after: "80" },
    "OptionsLayout1x4": { before: "0", after: "80" },
    "CauHoi": { before: "200", after: "60" },
    "CenteredImage": { before: "40", after: "80" },
  };

  const styles = root.getElementsByTagNameNS(W_NS, "style");
  for (let i = 0; i < styles.length; i++) {
    const style = styles[i];
    const styleId = style.getAttributeNS(W_NS, "styleId");

    let styleRpr = style.getElementsByTagNameNS(W_NS, "rPr")[0];
    if (!styleRpr) {
      styleRpr = doc.createElementNS(W_NS, "w:rPr");
      style.appendChild(styleRpr);
    }
    const styleFonts = _setOrCreate(doc, styleRpr, "rFonts");
    ["asciiTheme", "hAnsiTheme", "eastAsiaTheme", "cstheme"].forEach(attr => styleFonts.removeAttributeNS(W_NS, attr));
    styleFonts.setAttributeNS(W_NS, "w:ascii", "Times New Roman");
    styleFonts.setAttributeNS(W_NS, "w:hAnsi", "Times New Roman");
    styleFonts.setAttributeNS(W_NS, "w:eastAsia", "Times New Roman");
    styleFonts.setAttributeNS(W_NS, "w:cs", "Times New Roman");

    // ĐỒNG BỘ CỠ CHỮ 12pt cho Normal và các style thân văn bản. Giữ nguyên cỡ chữ riêng cho Tiêu đề.
    if (styleId !== "Title" && styleId !== "Subtitle" && !styleId.startsWith("Heading")) {
      _setOrCreate(doc, styleRpr, "sz").setAttributeNS(W_NS, "w:val", "24");
      _setOrCreate(doc, styleRpr, "szCs").setAttributeNS(W_NS, "w:val", "24");
    }

    if (!examStyles[styleId]) continue;

    let stylePpr = style.getElementsByTagNameNS(W_NS, "pPr")[0];
    if (!stylePpr) {
      stylePpr = doc.createElementNS(W_NS, "w:pPr");
      style.appendChild(stylePpr);
    }
    let styleSpacing = _setOrCreate(doc, stylePpr, "spacing");
    styleSpacing.setAttributeNS(W_NS, "w:before", examStyles[styleId].before);
    styleSpacing.setAttributeNS(W_NS, "w:after", examStyles[styleId].after);
    styleSpacing.setAttributeNS(W_NS, "w:line", "300");
    styleSpacing.setAttributeNS(W_NS, "w:lineRule", "auto");

    if (styleId === "OptionsLayout1x4") {
      let tabs = _setOrCreate(doc, stylePpr, "tabs");
      while (tabs.firstChild) tabs.removeChild(tabs.firstChild);
      [2480, 4961, 7441].forEach(pos => {
        let t = doc.createElementNS(W_NS, "w:tab");
        t.setAttributeNS(W_NS, "w:val", "left");
        t.setAttributeNS(W_NS, "w:pos", String(pos));
        tabs.appendChild(t);
      });
    } else if (styleId === "OptionsLayout") {
      let tabs = _setOrCreate(doc, stylePpr, "tabs");
      while (tabs.firstChild) tabs.removeChild(tabs.firstChild);
      let t = doc.createElementNS(W_NS, "w:tab");
      t.setAttributeNS(W_NS, "w:val", "left");
      t.setAttributeNS(W_NS, "w:pos", "4961");
      tabs.appendChild(t);
    }
  }
}

function _enableUpdateFields(doc) {
  let root = doc.documentElement;
  let updateFields = root.getElementsByTagNameNS(W_NS, "updateFields")[0];
  if (!updateFields) {
    updateFields = doc.createElementNS(W_NS, "w:updateFields");
    root.appendChild(updateFields);
  }
  updateFields.setAttributeNS(W_NS, "w:val", "true");
}

function _hasMediaContent(paragraph) {
  const drawings = paragraph.getElementsByTagNameNS(W_NS, "drawing");
  const picts = paragraph.getElementsByTagNameNS(W_NS, "pict");
  return drawings.length > 0 || picts.length > 0;
}

function _centerMediaParagraphs(doc, body) {
  const paragraphs = body.getElementsByTagNameNS(W_NS, "p");
  for (let i = 0; i < paragraphs.length; i++) {
    const paragraph = paragraphs[i];
    if (!_hasMediaContent(paragraph)) continue;
    let ppr = _ensurePPr(doc, paragraph);
    let jc = ppr.getElementsByTagNameNS(W_NS, "jc")[0];
    if (!jc) {
      jc = doc.createElementNS(W_NS, "w:jc");
      ppr.appendChild(jc);
    }
    jc.setAttributeNS(W_NS, "w:val", "center");
  }
}

function _setCellShading(doc, cell, fill) {
  let tcpr = _ensureTcPr(doc, cell);
  const oldShds = tcpr.getElementsByTagNameNS(W_NS, "shd");
  while (oldShds.length > 0) {
    tcpr.removeChild(oldShds[0]);
  }
  let shd = doc.createElementNS(W_NS, "w:shd");
  shd.setAttributeNS(W_NS, "w:val", "clear");
  shd.setAttributeNS(W_NS, "w:color", "auto");
  shd.setAttributeNS(W_NS, "w:fill", fill);
  tcpr.appendChild(shd);
}

function _centerCellContent(doc, cell) {
  let tcpr = _ensureTcPr(doc, cell);
  let valign = tcpr.getElementsByTagNameNS(W_NS, "vAlign")[0];
  if (!valign) {
    valign = doc.createElementNS(W_NS, "w:vAlign");
    tcpr.appendChild(valign);
  }
  valign.setAttributeNS(W_NS, "w:val", "center");

  const paragraphs = cell.getElementsByTagNameNS(W_NS, "p");
  for (let i = 0; i < paragraphs.length; i++) {
    const paragraph = paragraphs[i];
    let ppr = _ensurePPr(doc, paragraph);
    let jc = ppr.getElementsByTagNameNS(W_NS, "jc")[0];
    if (!jc) {
      jc = doc.createElementNS(W_NS, "w:jc");
      ppr.appendChild(jc);
    }
    jc.setAttributeNS(W_NS, "w:val", "center");
  }
}

function _beautifyAnswerTable(doc, table) {
  let tblpr = table.getElementsByTagNameNS(W_NS, "tblPr")[0];
  if (!tblpr) {
    tblpr = doc.createElementNS(W_NS, "w:tblPr");
    if (table.firstChild) table.insertBefore(tblpr, table.firstChild);
    else table.appendChild(tblpr);
  }
  let jc = tblpr.getElementsByTagNameNS(W_NS, "jc")[0];
  if (!jc) {
    jc = doc.createElementNS(W_NS, "w:jc");
    tblpr.appendChild(jc);
  }
  jc.setAttributeNS(W_NS, "w:val", "center");

  const rows = Array.from(table.childNodes).filter(node => node.localName === "tr" || node.tagName === "w:tr");
  for (let rowIdx = 0; rowIdx < rows.length; rowIdx++) {
    const row = rows[rowIdx];
    const cells = Array.from(row.childNodes).filter(node => node.localName === "tc" || node.tagName === "w:tc");
    for (let colIdx = 0; colIdx < cells.length; colIdx++) {
      const cell = cells[colIdx];
      _centerCellContent(doc, cell);
      const text = _getText(cell).toUpperCase();
      let fill;
      if (rowIdx === 0) {
        fill = colIdx % 2 === 0 ? ANSWER_HDR_FILL_A : ANSWER_HDR_FILL_B;
      } else if (colIdx === 0 && !["", "ĐÁP ÁN", "PHẦN"].includes(text)) {
        fill = ANSWER_FIRST_COL_FILL;
      } else {
        fill = (rowIdx + colIdx) % 2 === 0 ? ANSWER_BODY_FILL_A : ANSWER_BODY_FILL_B;
      }
      _setCellShading(doc, cell, fill);
    }
  }
}

function _beautifyAnswerTables(doc, body) {
  let inAnswerSection = false;
  const children = Array.from(body.childNodes);
  for (let i = 0; i < children.length; i++) {
    const child = children[i];
    if (child.localName === "p" || child.tagName === "w:p") {
      const text = _getText(child).toUpperCase();
      if (text.includes("BẢNG ĐÁP ÁN")) {
        inAnswerSection = true;
      } else if (inAnswerSection && text.startsWith("HẾT")) {
        inAnswerSection = false;
      }
    } else if ((child.localName === "tbl" || child.tagName === "w:tbl") && inAnswerSection) {
      _beautifyAnswerTable(doc, child);
    }
  }
}

// Parse an toàn: trả về doc CHỈ khi hợp lệ, ngược lại null. DOMParser của trình
// duyệt báo lỗi bằng cách chèn phần tử <parsererror> vào cây thay vì ném — nếu
// bỏ qua dấu hiệu này rồi serialize lại, ta ghi đè XML bằng cây lỗi/cụt và làm
// mất sạch nội dung (chính là bug "chỉ còn mỗi tiêu đề").
function _safeParse(parser, content) {
  try {
    const doc = parser.parseFromString(content, "application/xml");
    if (!doc || doc.getElementsByTagName("parsererror").length > 0) return null;
    return doc;
  } catch {
    return null;
  }
}

export async function postprocessDocxBlob(docxBlob) {
  // Postprocess chỉ làm ĐẸP (font, canh giữa, tô bảng). Nếu bất kỳ bước nào
  // trục trặc, PHẢI trả về file gốc từ Pandoc (đã đủ nội dung) — tuyệt đối
  // không đánh đổi nội dung lấy trang trí.
  try {
    const zip = await JSZip.loadAsync(docxBlob);
    const parser = new DOMParser();
    const serializer = new XMLSerializer();

    if (zip.file("word/styles.xml")) {
      const content = await zip.file("word/styles.xml").async("string");
      const doc = _safeParse(parser, content);
      if (doc) {
        _patchStylesXml(doc);
        zip.file("word/styles.xml", serializer.serializeToString(doc));
      }
    }

    if (zip.file("word/settings.xml")) {
      const content = await zip.file("word/settings.xml").async("string");
      const doc = _safeParse(parser, content);
      if (doc) {
        _enableUpdateFields(doc);
        zip.file("word/settings.xml", serializer.serializeToString(doc));
      }
    }

    if (zip.file("word/document.xml")) {
      const content = await zip.file("word/document.xml").async("string");
      const doc = _safeParse(parser, content);
      const body = doc && doc.getElementsByTagNameNS(W_NS, "body")[0];
      // CHỈ ghi đè khi parse thành công VÀ tìm thấy body. Không có body nghĩa là
      // cây hỏng → giữ nguyên document.xml gốc để không mất nội dung.
      if (doc && body) {
        _centerMediaParagraphs(doc, body);
        _beautifyAnswerTables(doc, body);

        let sectpr = body.getElementsByTagNameNS(W_NS, "sectPr")[0];
        if (!sectpr) {
          sectpr = doc.createElementNS(W_NS, "w:sectPr");
          body.appendChild(sectpr);
        }

        let pgsz = _setOrCreate(doc, sectpr, "pgSz");
        pgsz.setAttributeNS(W_NS, "w:w", PAGE_W);
        pgsz.setAttributeNS(W_NS, "w:h", PAGE_H);

        let pgmar = _setOrCreate(doc, sectpr, "pgMar");
        pgmar.setAttributeNS(W_NS, "w:top", TOP_M);
        pgmar.setAttributeNS(W_NS, "w:right", RIGHT_M);
        pgmar.setAttributeNS(W_NS, "w:bottom", BOTTOM_M);
        pgmar.setAttributeNS(W_NS, "w:left", LEFT_M);
        pgmar.setAttributeNS(W_NS, "w:header", "360");
        pgmar.setAttributeNS(W_NS, "w:footer", "360");
        pgmar.setAttributeNS(W_NS, "w:gutter", "0");

        let cols = _setOrCreate(doc, sectpr, "cols");
        cols.setAttributeNS(W_NS, "w:space", "708");

        let docGrid = _setOrCreate(doc, sectpr, "docGrid");
        docGrid.setAttributeNS(W_NS, "w:linePitch", "360");

        zip.file("word/document.xml", serializer.serializeToString(doc));
      } else {
        console.warn('postprocessDocxBlob: document.xml không parse được — giữ nguyên nội dung gốc, bỏ qua trang trí.');
      }
    }

    return await zip.generateAsync({ type: "blob", mimeType: "application/vnd.openxmlformats-officedocument.wordprocessingml.document" });
  } catch (error) {
    console.warn('postprocessDocxBlob lỗi — trả về DOCX gốc từ Pandoc:', error?.message || error);
    return docxBlob;
  }
}
