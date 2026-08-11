// @vitest-environment jsdom
import { describe, expect, it } from "vitest";
import { ommlXmlToLatex } from "../features/math-converter/ommlToLatex";

const wrap = (body: string) => `<root xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"><m:oMath>${body}</m:oMath></root>`;
describe("chuyển OMML sang LaTeX", () => {
  it("giữ phân số, căn và chỉ số", () => {
    const latex = ommlXmlToLatex(wrap(`<m:f><m:num><m:r><m:t>x</m:t></m:r></m:num><m:den><m:rad><m:deg/><m:e><m:r><m:t>y</m:t></m:r></m:e></m:rad></m:den></m:f><m:sSup><m:e><m:r><m:t>z</m:t></m:r></m:e><m:sup><m:r><m:t>2</m:t></m:r></m:sup></m:sSup>`))[0];
    expect(latex).toBe("\\frac{x}{\\sqrt{y}}{z}^{2}");
  });
  it("chuyển tổng có cận và ma trận", () => {
    const latex = ommlXmlToLatex(wrap(`<m:nary><m:naryPr><m:chr m:val="∑"/></m:naryPr><m:sub><m:r><m:t>i=1</m:t></m:r></m:sub><m:sup><m:r><m:t>n</m:t></m:r></m:sup><m:e><m:r><m:t>i</m:t></m:r></m:e></m:nary><m:m><m:mr><m:e><m:r><m:t>a</m:t></m:r></m:e><m:e><m:r><m:t>b</m:t></m:r></m:e></m:mr></m:m>`))[0];
    expect(latex).toContain("\\sum_{i=1}^{n} i");
    expect(latex).toContain("\\begin{matrix}a & b\\end{matrix}");
  });
});
