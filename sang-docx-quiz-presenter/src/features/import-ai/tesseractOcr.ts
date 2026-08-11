/**
 * tesseractOcr.ts — Browser OCR miễn phí với Tesseract.js
 * Load lazy — chỉ tải model (~15MB) khi thực sự cần.
 * Hỗ trợ: vie (tiếng Việt) + eng (tiếng Anh)
 *
 * Pipeline: enhanceForOcr → Tesseract → smartOcrRoute quyết định local/cloud.
 * imageEnhance cải thiện accuracy ~15–25 % với ảnh quét/chụp điện thoại.
 */
import { enhanceForOcr } from './imageEnhance';

export interface TesseractResult {
  text: string;
  confidence: number; // 0-100
  hasFormulas: boolean; // phát hiện công thức LaTeX/toán học
}

// Pattern phát hiện công thức toán học
const FORMULA_PATTERNS = [
  /\$[^$]+\$/u,          // inline LaTeX $...$
  /\\\(/u,              // \(
  /\\frac/u,            // \frac
  /\\sqrt/u,            // \sqrt
  /\\sum|\\int/u,       // \sum \int
  /[∫∑∏√±≤≥≠≈∞]/u,    // unicode math
  /\^[\d{]/u,           // superscript x^2
  /[A-Za-z]_\d/u,       // subscript x_1
  /\d+\/\d+/u,          // fractions 1/2
];

function detectFormulas(text: string): boolean {
  return FORMULA_PATTERNS.some((pattern) => pattern.test(text));
}

let workerPromise: Promise<import("tesseract.js").Worker> | null = null;

async function getWorker(): Promise<import("tesseract.js").Worker> {
  if (!workerPromise) {
    workerPromise = (async () => {
      const { createWorker } = await import("tesseract.js");
      const worker = await createWorker(["vie", "eng"], 1, {
        // Load từ CDN để không tăng bundle size
        langPath: "https://tessdata.projectnaptha.com/4.0.0",
        cacheMethod: "none",
      });
      return worker;
    })();
  }
  return workerPromise;
}

/**
 * OCR một ảnh với Tesseract.js.
 * Trả về text, confidence (0-100), và có công thức không.
 */
export async function tesseractOcr(
  imageSource: File | Blob | string,
  onProgress?: (pct: number, status: string) => void,
): Promise<TesseractResult> {
  onProgress?.(5, "Đang tải engine OCR cục bộ (lần đầu ~15s)…");

  // Tăng chất lượng ảnh trước khi OCR (greyscale + contrast + sharpen)
  let source: File | Blob | string = imageSource;
  if (imageSource instanceof Blob) {
    try {
      onProgress?.(10, "Đang tối ưu chất lượng ảnh…");
      source = await enhanceForOcr(imageSource);
    } catch {
      source = imageSource; // Giữ nguyên nếu enhance lỗi
    }
  }

  const worker = await getWorker();
  onProgress?.(30, "Đang nhận dạng văn bản cục bộ…");

  const { data } = await worker.recognize(source);

  onProgress?.(90, "Hoàn tất OCR cục bộ");

  return {
    text: data.text,
    confidence: data.confidence,
    hasFormulas: detectFormulas(data.text),
  };
}

/**
 * Quyết định có dùng Tesseract hay gọi cloud API không.
 * Return: 'local' | 'cloud'
 * 
 * Logic:
 * - Thử Tesseract trước (0 VNĐ)
 * - Nếu confidence >= 70 và không có công thức → dùng local
 * - Nếu confidence >= 70 nhưng có công thức → dùng Mistral (xử lý tốt công thức)
 * - Nếu confidence < 70 → ảnh quá mờ/phức tạp → dùng Mistral
 */
export async function smartOcrRoute(
  file: File,
  onProgress: (pct: number, status: string) => void,
): Promise<{ source: "local"; markdown: string } | { source: "cloud"; reason: string }> {
  try {
    const result = await tesseractOcr(file, onProgress);

    if (result.confidence >= 70 && !result.hasFormulas) {
      // Chất lượng tốt, không có công thức → dùng local hoàn toàn
      return { source: "local", markdown: result.text };
    }

    if (result.confidence < 40) {
      return { source: "cloud", reason: `Ảnh quá mờ (confidence: ${result.confidence.toFixed(0)}%)` };
    }

    if (result.hasFormulas) {
      return { source: "cloud", reason: "Phát hiện công thức toán học — cần dịch vụ nhận dạng nâng cao" };
    }

    return { source: "cloud", reason: `Độ chính xác chưa đủ (${result.confidence.toFixed(0)}%)` };
  } catch {
    // Tesseract fail → fallback cloud
    return { source: "cloud", reason: "Tesseract không khởi động được" };
  }
}

/** Giải phóng worker khi không còn cần (optional cleanup) */
export async function terminateTesseract(): Promise<void> {
  if (workerPromise) {
    const worker = await workerPromise;
    await worker.terminate();
    workerPromise = null;
  }
}
