import * as pdfjs from "pdfjs-dist/legacy/build/pdf.mjs";
import workerUrl from "pdfjs-dist/legacy/build/pdf.worker.mjs?url";

pdfjs.GlobalWorkerOptions.workerSrc = workerUrl;

export interface PdfTextAnalysis {
  pageCount: number;
  pages: string[];
  markdown: string;
  score: number;
  questionMarkers: number;
  mathSignals: number;
  imageSignals: number;
}

const normalizeLine = (value: string) =>
  value
    .replace(/\u0000/g, "")
    .replace(/[ \t]+/g, " ")
    .replace(/\s+([,.;:!?])/g, "$1")
    .trim();

export async function analyzePdfText(
  file: File,
  onProgress: (progress: number, status: string) => void,
): Promise<PdfTextAnalysis> {
  const bytes = new Uint8Array(await file.arrayBuffer());
  const loadingTask = pdfjs.getDocument({
    data: bytes,
    verbosity: pdfjs.VerbosityLevel.ERRORS,
  });
  const document = await loadingTask.promise;
  const pages: string[] = [];
  let imageSignals = 0;

  for (let pageNumber = 1; pageNumber <= document.numPages; pageNumber += 1) {
    const page = await document.getPage(pageNumber);
    const content = await page.getTextContent();
    try {
      const operators = await page.getOperatorList();
      const imageOps = [pdfjs.OPS.paintImageMaskXObject, pdfjs.OPS.paintImageXObject, pdfjs.OPS.paintInlineImageXObject].filter((value) => value !== undefined);
      imageSignals += operators.fnArray.filter((fn) => imageOps.includes(fn)).length;
    } catch {
      // Some encrypted/linearized PDFs do not expose the operator list; OCR remains the safe fallback.
    }
    const lines: string[] = [];
    let current = "";
    let lastY: number | undefined;
    for (const item of content.items) {
      if (!("str" in item)) continue;
      const y = item.transform?.[5];
      if (lastY !== undefined && y !== undefined && Math.abs(y - lastY) > 3 && current.trim()) {
        lines.push(normalizeLine(current));
        current = "";
      }
      current += `${current ? " " : ""}${item.str}`;
      lastY = y;
    }
    if (current.trim()) lines.push(normalizeLine(current));
    pages.push(lines.filter(Boolean).join("\n"));
    onProgress(
      8 + Math.round((pageNumber / document.numPages) * 22),
      `Đang đọc lớp chữ PDF · trang ${pageNumber}/${document.numPages}`,
    );
  }

  const markdown = pages
    .map((page, index) => `<!-- page:${index + 1} -->\n${page}`)
    .join("\n\n<!-- page-break -->\n\n");
  const compact = markdown.replace(/\s/g, "");
  const charsPerPage = compact.length / Math.max(document.numPages, 1);
  const replacementRatio = (markdown.match(/�/g)?.length || 0) / Math.max(markdown.length, 1);
  const questionMarkers = (markdown.match(/(?:^|\n)\s*(?:Câu|Bài)\s*\d+[.:)]/giu) || []).length;
  const mathSignals = (markdown.match(/[=∫∑√∆≤≥]|\b(?:sin|cos|tan|log|ln)\b/giu) || []).length;
  const densityScore = Math.min(1, charsPerPage / 750);
  const structureScore = Math.min(1, questionMarkers / Math.max(3, document.numPages * 2));
  const score = Math.max(0, Math.min(1, densityScore * 0.68 + structureScore * 0.32 - replacementRatio * 8));

  await document.destroy();
  return { pageCount: pages.length, pages, markdown, score, questionMarkers, mathSignals, imageSignals };
}
