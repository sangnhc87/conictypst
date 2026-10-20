// Sang Math cho Google Docs: khung bên phải (Sidebar.html) nhúng trang dựng công thức online,
// còn mã này chèn ảnh công thức vào tài liệu và đọc lại mã nguồn từ mô tả thay thế (alt text) của ảnh.
const TAG = 'SMATH1:';

function onOpen() {
  DocumentApp.getUi().createMenu('Sang Math').addItem('Mở Sang Math', 'showSidebar').addToUi();
}

function onInstall() { onOpen(); }

function showSidebar() {
  const html = HtmlService.createHtmlOutputFromFile('Sidebar').setTitle('Sang Math');
  DocumentApp.getUi().showSidebar(html);
}

// Ảnh công thức Sang Math đang được chọn (hoặc null).
function selectedFormulaImage_() {
  const sel = DocumentApp.getActiveDocument().getSelection();
  if (!sel) return null;
  for (const re of sel.getRangeElements()) {
    const el = re.getElement();
    if (el.getType() === DocumentApp.ElementType.INLINE_IMAGE) {
      const img = el.asInlineImage();
      if ((img.getAltDescription() || '').indexOf(TAG) === 0) return img;
    }
  }
  return null;
}

/** Mô tả thay thế (chứa mã nguồn) của công thức đang chọn, '' nếu không chọn công thức Sang Math. */
function getSelectedFormula() {
  const img = selectedFormulaImage_();
  return img ? img.getAltDescription() : '';
}

/**
 * Chèn ảnh công thức. replace = true: thay công thức đang chọn.
 * b64: PNG base64; alt: SMATH1:{json}; wPt/hPt: kích thước theo điểm.
 * block = true: đặt công thức vào đoạn riêng, căn giữa (Docs không hạ ảnh theo đường chữ nên công thức cao dễ bị lệch dòng).
 */
function insertFormula(b64, alt, wPt, hPt, replace, block) {
  const doc = DocumentApp.getActiveDocument();
  const blob = Utilities.newBlob(Utilities.base64Decode(b64), 'image/png', 'cong-thuc.png');
  let img = null;
  if (replace) {
    const old = selectedFormulaImage_();
    if (!old) throw new Error('Chưa chọn công thức Sang Math nào để thay.');
    const parent = old.getParent();
    const index = parent.getChildIndex(old);
    old.removeFromParent();
    img = parent.insertInlineImage(index, blob);
  } else {
    const cursor = doc.getCursor();
    if (cursor && block) {
      let para = cursor.getElement();
      while (para && para.getType() !== DocumentApp.ElementType.PARAGRAPH && para.getType() !== DocumentApp.ElementType.LIST_ITEM) para = para.getParent();
      const container = para && para.getParent();
      if (container && typeof container.insertParagraph === 'function') {
        const np = container.insertParagraph(container.getChildIndex(para) + 1, '');
        np.setAlignment(DocumentApp.HorizontalAlignment.CENTER);
        img = np.appendInlineImage(blob);
      } else img = cursor.insertInlineImage(blob);
    } else if (cursor) img = cursor.insertInlineImage(blob);
    else {
      const sel = doc.getSelection();
      if (!sel) throw new Error('Hãy bấm vào chỗ muốn chèn trong tài liệu.');
      const first = sel.getRangeElements()[0].getElement();
      const para = first.getType() === DocumentApp.ElementType.PARAGRAPH ? first.asParagraph() : first.getParent().asParagraph();
      img = para.appendInlineImage(blob);
    }
  }
  img.setAltTitle('Công thức Sang Math').setAltDescription(alt);
  img.setWidth(Math.max(1, Math.round(wPt))).setHeight(Math.max(1, Math.round(hPt)));
  doc.setSelection(doc.newRange().addElement(img).build()); // giữ công thức vừa chèn được chọn để sửa tiếp
  return true;
}
