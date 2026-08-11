const children = (node: Element, name?: string) =>
  [...node.children].filter((x) => !name || x.localName === name);
const first = (node: Element, name: string) => children(node, name)[0];
const escapeText = (value: string) =>
  value
    .replace(/([#$%&_{}])/g, "\\$1")
    .replace(/≤/g, "\\le ")
    .replace(/≥/g, "\\ge ")
    .replace(/≠/g, "\\ne ")
    .replace(/×/g, "\\times ")
    .replace(/÷/g, "\\div ")
    .replace(/∞/g, "\\infty ");
const propValue = (
  node: Element | undefined,
  property: string,
  fallback = "",
) => {
  const element = node && first(node, property);
  return (
    element?.getAttributeNS(
      "http://schemas.openxmlformats.org/officeDocument/2006/math",
      "val",
    ) ||
    element?.getAttribute("m:val") ||
    element?.getAttribute("val") ||
    fallback
  );
};
const group = (node: Element | undefined) =>
  node ? convertChildren(node) : "";
const convertChildren = (node: Element) =>
  children(node)
    .filter((x) => !x.localName.endsWith("Pr"))
    .map(convertNode)
    .join("");

function convertNode(node: Element): string {
  switch (node.localName) {
    case "t":
      return escapeText(node.textContent || "");
    case "r":
      return children(node, "t")
        .map((x) => escapeText(x.textContent || ""))
        .join("");
    case "oMath":
    case "oMathPara":
    case "e":
    case "num":
    case "den":
    case "sub":
    case "sup":
    case "deg":
    case "fName":
    case "lim":
      return convertChildren(node);
    case "f":
      return `\\frac{${group(first(node, "num"))}}{${group(first(node, "den"))}}`;
    case "rad": {
      const degree = group(first(node, "deg"));
      return degree
        ? `\\sqrt[${degree}]{${group(first(node, "e"))}}`
        : `\\sqrt{${group(first(node, "e"))}}`;
    }
    case "sSup":
      return `{${group(first(node, "e"))}}^{${group(first(node, "sup"))}}`;
    case "sSub":
      return `{${group(first(node, "e"))}}_{${group(first(node, "sub"))}}`;
    case "sSubSup":
      return `{${group(first(node, "e"))}}_{${group(first(node, "sub"))}}^{${group(first(node, "sup"))}}`;
    case "nary": {
      const chr = propValue(first(node, "naryPr"), "chr", "∫");
      const op: Record<string, string> = {
        "∫": "\\int",
        "∑": "\\sum",
        "∏": "\\prod",
        "⋃": "\\bigcup",
        "⋂": "\\bigcap",
      };
      return `${op[chr] || escapeText(chr)}_{${group(first(node, "sub"))}}^{${group(first(node, "sup"))}} ${group(first(node, "e"))}`;
    }
    case "d": {
      const pr = first(node, "dPr");
      const begin = propValue(pr, "begChr", "("),
        end = propValue(pr, "endChr", ")");
      return `\\left${begin}${children(node, "e").map(group).join(" \\middle| ")}\\right${end}`;
    }
    case "m":
      return `\\begin{matrix}${children(node, "mr")
        .map((row) => children(row, "e").map(group).join(" & "))
        .join(" \\\\ ")}\\end{matrix}`;
    case "eqArr":
      return `\\begin{aligned}${children(node, "e").map(group).join(" \\\\ ")}\\end{aligned}`;
    case "func":
      return `${group(first(node, "fName"))}\\left(${group(first(node, "e"))}\\right)`;
    case "limLow":
      return `${group(first(node, "e"))}_{${group(first(node, "lim"))}}`;
    case "limUpp":
      return `${group(first(node, "e"))}^{${group(first(node, "lim"))}}`;
    case "acc": {
      const chr = propValue(first(node, "accPr"), "chr", "̂");
      const cmd: Record<string, string> = {
        "̂": "hat",
        "¯": "bar",
        "→": "vec",
        "˜": "tilde",
        "˙": "dot",
      };
      return `\\${cmd[chr] || "hat"}{${group(first(node, "e"))}}`;
    }
    case "bar": {
      const pos = propValue(first(node, "barPr"), "pos", "top");
      return `\\${pos === "bot" ? "underline" : "overline"}{${group(first(node, "e"))}}`;
    }
    case "box":
    case "borderBox":
    case "phant":
    case "groupChr":
      return group(first(node, "e"));
    default:
      return convertChildren(node);
  }
}

export function ommlElementToLatex(element: Element): string {
  return convertNode(element).trim();
}
export function ommlXmlToLatex(xml: string): string[] {
  const doc = new DOMParser().parseFromString(xml, "application/xml");
  return [...doc.getElementsByTagNameNS("*", "oMath")]
    .filter((x) => x.parentElement?.localName !== "oMath")
    .map(ommlElementToLatex);
}
