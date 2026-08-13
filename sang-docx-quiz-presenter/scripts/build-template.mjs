/**
 * Sinh public/templates/mau-de-chuan-quiz.docx — template Word chuẩn với bộ
 * style Quiz* mà templateParser đọc deterministic. Chạy: node scripts/build-template.mjs
 *
 * Giáo viên mở file này, soạn đề bằng cách áp style tương ứng cho từng đoạn:
 *   QuizSection   → tiêu đề phần thi (PHẦN I. ...)
 *   QuizStimulus  → dữ kiện/đoạn dẫn dùng chung cho các câu sau nó (câu chùm)
 *   QuizQuestion  → nội dung câu hỏi (có thể kèm hoặc bỏ prefix "Câu N.")
 *   QuizChoice    → một phương án trắc nghiệm (tự đánh nhãn A-D nếu thiếu)
 *   QuizStatement → một ý đúng/sai (tự đánh nhãn a-d nếu thiếu)
 *   QuizAnswer    → đáp án: "B" | "Đ S Đ S" | giá trị trả lời ngắn
 *   QuizSolution  → một bước lời giải
 */
import JSZip from "jszip";
import { mkdirSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const outPath = join(root, "public", "templates", "mau-de-chuan-quiz.docx");

const esc = (value) => value.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
const p = (style, text) =>
  `<w:p><w:pPr>${style ? `<w:pStyle w:val="${style}"/>` : ""}</w:pPr><w:r><w:t xml:space="preserve">${esc(text)}</w:t></w:r></w:p>`;

const content = [
  p("Title", "MẪU ĐỀ CHUẨN — SOẠN BẰNG STYLE Quiz*"),
  p(null, "Hướng dẫn: sao chép các đoạn mẫu dưới đây, giữ nguyên style của từng đoạn. Ứng dụng đọc style để tách câu nên không cần gõ đúng mẫu chữ 'Câu N.' hay 'A.'."),
  p("QuizSection", "PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn."),
  p("QuizQuestion", "Câu 1. Đạo hàm của hàm số $y = x^2 + 3x$ là"),
  p("QuizChoice", "$y' = 2x + 3$."),
  p("QuizChoice", "$y' = x + 3$."),
  p("QuizChoice", "$y' = 2x$."),
  p("QuizChoice", "$y' = x^2 + 3$."),
  p("QuizAnswer", "A"),
  p("QuizSolution", "Áp dụng công thức $(x^n)' = nx^{n-1}$ ta được $y' = 2x + 3$."),
  p("QuizQuestion", "Câu 2. Nghiệm của phương trình $2^x = 8$ là"),
  p("QuizChoice", "A. $x = 2$."),
  p("QuizChoice", "B. $x = 3$."),
  p("QuizChoice", "C. $x = 4$."),
  p("QuizChoice", "D. $x = 16$."),
  p("QuizAnswer", "B"),
  p("QuizSection", "PHẦN II. Câu trắc nghiệm đúng sai."),
  p("QuizStimulus", "Cho hàm số $f(x) = x^3 - 3x$ có đồ thị (C)."),
  p("QuizQuestion", "Câu 1. Xét tính đúng sai của các phát biểu sau:"),
  p("QuizStatement", "Hàm số đồng biến trên khoảng $(1; +\\infty)$."),
  p("QuizStatement", "Hàm số có đúng hai điểm cực trị."),
  p("QuizStatement", "Giá trị cực đại của hàm số bằng $-2$."),
  p("QuizStatement", "Đồ thị (C) đi qua gốc tọa độ."),
  p("QuizAnswer", "Đ Đ S Đ"),
  p("QuizSection", "PHẦN III. Câu trắc nghiệm trả lời ngắn."),
  p("QuizQuestion", "Câu 1. Tính tích phân $\\int_0^1 (2x + 1)\\,dx$."),
  p("QuizAnswer", "2"),
  p("QuizSolution", "Nguyên hàm là $x^2 + x$; thay cận được $1 + 1 = 2$."),
].join("\n");

const documentXml = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:body>
${content}
<w:sectPr><w:pgSz w:w="11906" w:h="16838"/><w:pgMar w:top="1134" w:right="1134" w:bottom="1134" w:left="1134"/></w:sectPr>
</w:body></w:document>`;

const styleDefs = [
  ["QuizSection", "Phần thi (Quiz)", true],
  ["QuizStimulus", "Dữ kiện chùm (Quiz)", false],
  ["QuizQuestion", "Câu hỏi (Quiz)", false],
  ["QuizChoice", "Phương án (Quiz)", false],
  ["QuizStatement", "Ý đúng-sai (Quiz)", false],
  ["QuizAnswer", "Đáp án (Quiz)", false],
  ["QuizSolution", "Lời giải (Quiz)", false],
]
  .map(([id, name, bold]) => `<w:style w:type="paragraph" w:styleId="${id}"><w:name w:val="${name}"/><w:basedOn w:val="Normal"/><w:uiPriority w:val="20"/><w:qFormat/>${bold ? "<w:rPr><w:b/></w:rPr>" : ""}</w:style>`)
  .join("\n");

const stylesXml = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
<w:style w:type="paragraph" w:default="1" w:styleId="Normal"><w:name w:val="Normal"/><w:qFormat/></w:style>
<w:style w:type="paragraph" w:styleId="Title"><w:name w:val="Title"/><w:basedOn w:val="Normal"/><w:qFormat/><w:rPr><w:b/><w:sz w:val="32"/></w:rPr></w:style>
${styleDefs}
</w:styles>`;

const contentTypes = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
<Default Extension="xml" ContentType="application/xml"/>
<Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
<Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/>
</Types>`;

const rels = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>`;

const documentRels = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
</Relationships>`;

const zip = new JSZip();
zip.file("[Content_Types].xml", contentTypes);
zip.file("_rels/.rels", rels);
zip.file("word/document.xml", documentXml);
zip.file("word/styles.xml", stylesXml);
zip.file("word/_rels/document.xml.rels", documentRels);

const buffer = await zip.generateAsync({ type: "nodebuffer", compression: "DEFLATE" });
mkdirSync(dirname(outPath), { recursive: true });
writeFileSync(outPath, buffer);
console.log(`Đã tạo ${outPath} (${buffer.length} bytes)`);
