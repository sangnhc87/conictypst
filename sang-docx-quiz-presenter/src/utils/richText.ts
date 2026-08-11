import DOMPurifyModule from "dompurify";

const allowedTags = [
  "b", "strong", "i", "em", "u", "mark", "span", "font", "br", "div", "p", "ul", "ol", "li", "img",
];
const allowedAttrs = ["style", "color", "class", "src", "alt", "width", "height"];

type Sanitizer = { sanitize: (value: string, config: { ALLOWED_TAGS: string[]; ALLOWED_ATTR: string[] }) => string };
type PurifyModule = Sanitizer & ((window: Window) => Sanitizer);

const candidate = DOMPurifyModule as unknown as Partial<Sanitizer> & PurifyModule;
const purifier: Sanitizer | null = typeof candidate.sanitize === "function"
  ? candidate
  : typeof candidate === "function" && typeof window !== "undefined"
    ? candidate(window)
    : null;

export const sanitizeRichText = (value: string) => {
  if (!purifier) return value || "";
  return purifier.sanitize(value || "", { ALLOWED_TAGS: allowedTags, ALLOWED_ATTR: allowedAttrs });
};
