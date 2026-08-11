// @vitest-environment jsdom
import { describe, expect, it } from "vitest";
import { structuralHtmlFromDocumentXml, shouldPreferStructuralHtml } from "../features/import-docx/docxInspector";
import { parseStructuredHtml } from "../features/question-parser/parser";

const documentXml = `<?xml version="1.0" encoding="UTF-8"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
  xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing">
  <w:body>
    <w:p><w:r><w:t>Câu 1. Chọn đáp án đúng</w:t></w:r></w:p>
    <w:tbl><w:tr>
      <w:tc><w:p><w:r><w:t>A. Một</w:t></w:r></w:p></w:tc>
      <w:tc><w:p><w:r><w:t>B. Hai</w:t></w:r></w:p></w:tc>
    </w:tr><w:tr>
      <w:tc><w:p><w:r><w:t>C. Ba</w:t></w:r></w:p></w:tc>
      <w:tc><w:p><w:r><w:t>D. Bốn</w:t></w:r></w:p></w:tc>
    </w:tr></w:tbl>
    <w:p><w:r><w:t>Đáp án: B</w:t></w:r></w:p>
    <w:p><w:r><w:drawing><wp:inline><w:txbxContent>
      <w:p><w:r><w:t>Lời giải: Vì phương án B đúng.</w:t></w:r></w:p>
    </w:txbxContent></wp:inline></w:drawing></w:r></w:p>
  </w:body>
</w:document>`;

describe("DOCX structural recovery", () => {
  it("keeps table choices and a floating text box in document order", () => {
    const structure = structuralHtmlFromDocumentXml(documentXml);

    expect(structure.tableCells).toBe(4);
    expect(structure.textBoxParagraphs).toBe(1);
    expect(structure.blocks.map((block) => block.text)).toEqual([
      "Câu 1. Chọn đáp án đúng", "A. Một", "B. Hai", "C. Ba", "D. Bốn", "Đáp án: B", "Lời giải: Vì phương án B đúng.",
    ]);
    const parsed = parseStructuredHtml(structure.html);
    expect(parsed.questions[0].choices).toHaveLength(4);
    expect(parsed.questions[0].choices?.[1].isCorrect).toBe(true);
    expect(parsed.questions[0].solution?.[0].content[0]).toMatchObject({ text: "Vì phương án B đúng." });
  });

  it("uses raw OOXML only when Mammoth omitted material content", () => {
    const structure = structuralHtmlFromDocumentXml(documentXml);

    expect(shouldPreferStructuralHtml("<p>Câu 1. Chọn đáp án đúng</p><p>Đáp án: B</p>", structure)).toBe(true);
    expect(shouldPreferStructuralHtml(structure.html, structure)).toBe(false);
  });
});
