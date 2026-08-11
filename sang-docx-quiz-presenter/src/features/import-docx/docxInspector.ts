import JSZip from "jszip";
import { convertEmfToDataUrl, convertWmfToDataUrl } from "emf-converter";
import type { ImportWarning, MathBlock, MediaAsset } from "../../models/quiz";
import { uid } from "../../models/quiz";
import { ommlElementToLatex } from "../math-converter/ommlToLatex";
const MIME: Record<string, string> = {
  png: "image/png",
  jpg: "image/jpeg",
  jpeg: "image/jpeg",
  gif: "image/gif",
  svg: "image/svg+xml",
  webp: "image/webp",
};
const toDataUrl = (bytes: Uint8Array, mime: string) => {
  let binary = "";
  for (let i = 0; i < bytes.length; i += 0x8000)
    binary += String.fromCharCode(...bytes.subarray(i, i + 0x8000));
  return `data:${mime};base64,${btoa(binary)}`;
};
export interface MediaPlacement {
  paragraphIndex: number;
  questionNumber?: number;
  sectionId?: string;
  phase?: "questions" | "answers" | "solutions";
  assetId: string;
  relationshipId: string;
  isOlePreview: boolean;
}
export interface MathPlacement {
  paragraphIndex: number;
  questionNumber?: number;
  sectionId?: string;
  phase?: "questions" | "answers" | "solutions";
  block: MathBlock;
}
export interface StructuralDocxBlock {
  source: "paragraph" | "table" | "textbox";
  text: string;
  numbered: boolean;
}
export interface DocxStructure {
  html: string;
  blocks: StructuralDocxBlock[];
  tableCells: number;
  textBoxParagraphs: number;
  numberedParagraphs: number;
  questionMarkers: number;
}
export interface Inspection {
  paragraphs: number;
  images: MediaAsset[];
  math: MathBlock[];
  mediaPlacements: MediaPlacement[];
  mathPlacements: MathPlacement[];
  warnings: ImportWarning[];
  oleCount: number;
  structure: DocxStructure;
}

const localName = (element: Element) => element.localName || element.nodeName.split(":").at(-1) || "";
const elementChildren = (element: Element, name: string) => [...element.children].filter((child) => localName(child) === name);
const escapeHtml = (value: string) => value.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
const htmlForText = (value: string) => escapeHtml(value).replace(/\n/g, "<br>");
const compactText = (value: string) => value.replace(/\s+/g, " ").trim();

// Mammoth is excellent for ordinary paragraphs but may omit text boxes or
// flatten complex tables. Keep a second, lossless reading order straight from
// WordprocessingML so the importer has a dependable local recovery route.
const textFromParagraph = (paragraph: Element) => {
  const visit = (node: Node, isRoot = false): string => {
    if (node.nodeType !== Node.ELEMENT_NODE) return "";
    const element = node as Element;
    const name = localName(element);
    if (!isRoot && name === "p") return "";
    if (name === "txbxContent" || name === "oMath" || name === "oMathPara") return "";
    if (name === "t") return element.textContent || "";
    if (name === "tab") return "\t";
    if (name === "br" || name === "cr") return "\n";
    return [...element.childNodes].map((child) => visit(child)).join("");
  };
  return compactText(visit(paragraph, true));
};

const isNumberedParagraph = (paragraph: Element) => Boolean(paragraph.getElementsByTagNameNS("*", "numPr").length);

const makeParagraphBlock = (paragraph: Element, source: StructuralDocxBlock["source"], blocks: StructuralDocxBlock[]) => {
  const text = textFromParagraph(paragraph);
  if (!text) return "";
  const numbered = isNumberedParagraph(paragraph);
  blocks.push({ source, text, numbered });
  return `<p>${htmlForText(text)}</p>`;
};

/**
 * Converts the semantic WordprocessingML body into deliberately simple HTML.
 * It preserves document order, table cells and text-box paragraphs. This is
 * not a visual renderer; it is the fallback source for question extraction.
 */
export const structuralHtmlFromDocumentXml = (documentXml: string): DocxStructure => {
  const xml = new DOMParser().parseFromString(documentXml, "application/xml");
  const body = xml.getElementsByTagNameNS("*", "body")[0];
  const blocks: StructuralDocxBlock[] = [];
  let tableCells = 0;
  let textBoxParagraphs = 0;
  const paragraphWithTextboxes = (paragraph: Element, source: StructuralDocxBlock["source"]) => {
    let result = makeParagraphBlock(paragraph, source, blocks);
    for (const textbox of [...paragraph.getElementsByTagNameNS("*", "txbxContent")]) {
      for (const textParagraph of elementChildren(textbox, "p")) {
        const extracted = makeParagraphBlock(textParagraph, "textbox", blocks);
        if (extracted) {
          textBoxParagraphs += 1;
          result += extracted;
        }
      }
    }
    return result;
  };
  const tableHtml = (table: Element): string => {
    const rows = elementChildren(table, "tr");
    const renderedRows = rows.map((row) => {
      const cells = elementChildren(row, "tc");
      return `<tr>${cells.map((cell) => {
        tableCells += 1;
        const paragraphs = elementChildren(cell, "p").map((paragraph) => paragraphWithTextboxes(paragraph, "table")).join("");
        const nestedTables = elementChildren(cell, "tbl").map(tableHtml).join("");
        return `<td>${paragraphs || nestedTables || `<p>${htmlForText(compactText(cell.textContent || ""))}</p>`}</td>`;
      }).join("")}</tr>`;
    }).join("");
    return renderedRows ? `<table>${renderedRows}</table>` : "";
  };
  const html = body ? [...body.children].map((child) => {
    const name = localName(child);
    if (name === "p") return paragraphWithTextboxes(child, "paragraph");
    if (name === "tbl") return tableHtml(child);
    return "";
  }).join("") : "";
  const questionMarkers = blocks.filter((block) => /^(?:(?:Câu|Bài|Question)\s*)?0*\d+\s*[.:)]\s+/iu.test(block.text)).length;
  return {
    html,
    blocks,
    tableCells,
    textBoxParagraphs,
    numberedParagraphs: blocks.filter((block) => block.numbered).length,
    questionMarkers,
  };
};

const textFromHtml = (html: string) => compactText(new DOMParser().parseFromString(html, "text/html").body.textContent || "").toLocaleLowerCase();
const normalizedBlockText = (text: string) => compactText(text).toLocaleLowerCase();

/** Returns true only when OOXML contains material content Mammoth dropped. */
export const shouldPreferStructuralHtml = (mammothHtml: string, structure: DocxStructure) => {
  if (!structure.blocks.length || !structure.html) return false;
  const mammothText = textFromHtml(mammothHtml);
  const missing = structure.blocks.filter((block) => {
    const text = normalizedBlockText(block.text);
    return text.length >= 6 && !mammothText.includes(text);
  });
  const missingQuestions = missing.filter((block) => /^(?:(?:Câu|Bài|Question)\s*)?0*\d+\s*[.:)]\s+/iu.test(block.text));
  const missingTextboxes = missing.filter((block) => block.source === "textbox");
  const missingTableCells = missing.filter((block) => block.source === "table");
  return missingQuestions.length > 0
    || missingTextboxes.length > 0
    || (structure.tableCells > 0 && missingTableCells.length >= 2);
};
export async function inspectDocx(buffer: ArrayBuffer): Promise<Inspection> {
  const zip = await JSZip.loadAsync(buffer);
  const document = await zip.file("word/document.xml")?.async("string");
  if (!document) throw new Error("File DOCX bị hỏng: thiếu word/document.xml.");
  const xml = new DOMParser().parseFromString(document, "application/xml");
  const structure = structuralHtmlFromDocumentXml(document);
  const paragraphNodes = [...xml.getElementsByTagNameNS("*", "p")];
  const paragraphs = paragraphNodes.length;
  const math: MathBlock[] = [];
  const mathPlacements: MathPlacement[] = [];
  const images: MediaAsset[] = [];
  const warnings: ImportWarning[] = [];
  const mediaPlacements: MediaPlacement[] = [];
  const relXml = await zip
    .file("word/_rels/document.xml.rels")
    ?.async("string");
  const relationships = new Map<string, string>();
  if (relXml) {
    const relDoc = new DOMParser().parseFromString(relXml, "application/xml");
    for (const rel of [...relDoc.getElementsByTagNameNS("*", "Relationship")]) {
      const id = rel.getAttribute("Id"),
        target = rel.getAttribute("Target");
      if (id && target && !target.includes("://"))
        relationships.set(
          id,
          `word/${target.replace(/^\.\.\//, "")}`.replace("/./", "/"),
        );
    }
  }
  let currentQuestion: number | undefined;
  let sectionId: string | undefined;
  let phase: "questions" | "answers" | "solutions" = "questions";
  paragraphNodes.forEach((p, index) => {
    const text = [...p.getElementsByTagNameNS("*", "t")]
      .map((x) => x.textContent || "")
      .join("");
    if (/^ĐÁP ÁN THAM KHẢO\b/iu.test(text.trim())) {
      phase = "answers";
      currentQuestion = undefined;
    } else if (/^LỜI GIẢI THAM KHẢO\b/iu.test(text.trim())) {
      phase = "solutions";
      currentQuestion = undefined;
    }
    const part = text.match(/^PHẦN\s+(I{1,3}|IV)\s*[:.]/iu);
    if (part) {
      sectionId = `part-${part[1].toUpperCase() === "I" ? "i" : part[1].toUpperCase() === "II" ? "ii" : part[1].toUpperCase() === "III" ? "iii" : "iv"}`;
      currentQuestion = undefined;
    }
    const shared = text.match(/Nội dung câu\s+(\d+)\s+và\s+(\d+)/iu);
    if (shared && phase === "questions") currentQuestion = Number(shared[1]);
    // English entrance exams often number paragraphs as “Question 35.” or
    // simply “35.”.  Tracking that form keeps notice images attached to the
    // real question instead of falling back to question 1.
    const q = text.match(/^(?:(?:Câu|Bài|Question)\s*)?0*(\d+)\s*[.:)]\s+/iu);
    if (q) {
      const nextQuestion = Number(q[1]);
      if (nextQuestion >= 1 && nextQuestion <= 200 && (currentQuestion === undefined || nextQuestion >= currentQuestion || phase === "solutions")) currentQuestion = nextQuestion;
    }
    for (const element of [...p.getElementsByTagNameNS("*", "oMath")].filter(
      (x) => x.parentElement?.localName !== "oMath",
    )) {
      const block: MathBlock = {
        id: uid("math"),
        kind: "math",
        latex:
          ommlElementToLatex(element) || "\\text{Công thức OMML cần kiểm tra}",
        display: element.parentElement?.localName === "oMathPara",
        status: "omml-converted",
      };
      math.push(block);
      mathPlacements.push({
        paragraphIndex: index,
        questionNumber: currentQuestion,
        sectionId,
        phase,
        block,
      });
    }
    const oleIds = new Set(
      [...p.getElementsByTagNameNS("*", "OLEObject")]
        .map(
          (x) =>
            x.getAttribute("r:id") ||
            x.getAttributeNS(
              "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
              "id",
            ),
        )
        .filter(Boolean),
    );
    for (const blip of [
      ...p.getElementsByTagNameNS("*", "blip"),
      ...p.getElementsByTagNameNS("*", "imagedata"),
    ]) {
      const rid =
        blip.getAttribute("r:embed") ||
        blip.getAttribute("r:id") ||
        blip.getAttributeNS(
          "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
          "embed",
        ) ||
        blip.getAttributeNS(
          "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
          "id",
        );
      if (rid)
        mediaPlacements.push({
          paragraphIndex: index,
          questionNumber: currentQuestion,
          sectionId,
          phase,
          assetId: "",
          relationshipId: rid,
          isOlePreview: oleIds.size > 0,
        });
    }
  });
  for (const path of Object.keys(zip.files).filter(
    (x) => x.startsWith("word/media/") && !zip.files[x].dir,
  )) {
    const ext = path.split(".").pop()!.toLowerCase();
    let mime = MIME[ext];
    const raw = await zip.file(path)!.async("arraybuffer");
    let src = "";
    if (mime) src = toDataUrl(new Uint8Array(raw), mime);
    else if (ext === "emf" || ext === "wmf") {
      src =
        (ext === "emf"
          ? await convertEmfToDataUrl(raw, 1600, 1200)
          : await convertWmfToDataUrl(raw, 1600, 1200)) || "";
      mime = "image/png";
      if (src)
        warnings.push({
          id: uid("w"),
          type: "media",
          message: `Đã chuyển ${path} từ ${ext.toUpperCase()} sang PNG trong trình duyệt.`,
        });
    }
    if (!src) {
      warnings.push({
        id: uid("w"),
        type: "media",
        message: `Ảnh ${path} (${ext.toUpperCase()}) không chuyển đổi được; hãy thay bằng PNG/SVG.`,
      });
      continue;
    }
    const asset = {
      id: uid("media"),
      name: path
        .split("/")
        .pop()!
        .replace(/\.(emf|wmf)$/i, ".png"),
      mimeType: mime,
      src,
    };
    images.push(asset);
    for (const placement of mediaPlacements) {
      if (relationships.get(placement.relationshipId) === path)
        placement.assetId = asset.id;
    }
  }
  const oleCount = Object.keys(zip.files).filter(
    (x) => x.startsWith("word/embeddings/") && !zip.files[x].dir,
  ).length;
  for (let i = 0; i < oleCount; i++)
    warnings.push({
      id: uid("w"),
      type: "math",
      message:
        "Phát hiện MathType/OLE. Ảnh xem trước đã được giữ nếu có; hãy kiểm tra vị trí hoặc nhập LaTeX thay thế.",
    });
  return {
    paragraphs,
    images,
    math,
    mediaPlacements: mediaPlacements.filter((x) => x.assetId),
    mathPlacements,
    warnings,
    oleCount,
    structure,
  };
}
