/**
 * imageDeskew.ts — Tự động chỉnh ảnh nghiêng trước OCR
 * Dùng canvas + variance histogram ngang để tìm góc tối ưu
 */

const ANGLES = [-8, -6, -4, -2, -1, 0, 1, 2, 4, 6, 8]; // độ thử nghiệm

function imageToCanvas(img: HTMLImageElement): HTMLCanvasElement {
  const canvas = document.createElement("canvas");
  canvas.width = img.naturalWidth;
  canvas.height = img.naturalHeight;
  canvas.getContext("2d")!.drawImage(img, 0, 0);
  return canvas;
}

function rotateCanvas(source: HTMLCanvasElement, angleDeg: number): HTMLCanvasElement {
  const rad = (angleDeg * Math.PI) / 180;
  const cos = Math.abs(Math.cos(rad));
  const sin = Math.abs(Math.sin(rad));
  const w = Math.round(source.width * cos + source.height * sin);
  const h = Math.round(source.width * sin + source.height * cos);
  const out = document.createElement("canvas");
  out.width = w;
  out.height = h;
  const ctx = out.getContext("2d")!;
  ctx.fillStyle = "#fff";
  ctx.fillRect(0, 0, w, h);
  ctx.translate(w / 2, h / 2);
  ctx.rotate(rad);
  ctx.drawImage(source, -source.width / 2, -source.height / 2);
  return out;
}

/**
 * Tính variance của tổng pixel tối theo từng hàng ngang.
 * Ảnh thẳng → văn bản thành các hàng rõ → variance cao.
 */
function rowVariance(canvas: HTMLCanvasElement): number {
  const ctx = canvas.getContext("2d")!;
  const { data } = ctx.getImageData(0, 0, canvas.width, canvas.height);
  const rowSums: number[] = [];
  for (let y = 0; y < canvas.height; y++) {
    let darkCount = 0;
    for (let x = 0; x < canvas.width; x++) {
      const i = (y * canvas.width + x) * 4;
      const lum = 0.299 * data[i] + 0.587 * data[i + 1] + 0.114 * data[i + 2];
      if (lum < 128) darkCount++;
    }
    rowSums.push(darkCount);
  }
  const mean = rowSums.reduce((s, v) => s + v, 0) / rowSums.length;
  return rowSums.reduce((s, v) => s + (v - mean) ** 2, 0) / rowSums.length;
}

/**
 * Tìm góc xoay tối ưu để chỉnh thẳng ảnh.
 * Trả về góc (độ) có variance cao nhất.
 */
export async function detectSkewAngle(imageBlob: Blob): Promise<number> {
  return new Promise((resolve) => {
    const url = URL.createObjectURL(imageBlob);
    const img = new Image();
    img.onload = () => {
      URL.revokeObjectURL(url);
      const src = imageToCanvas(img);
      let bestAngle = 0;
      let bestVariance = -Infinity;
      for (const angle of ANGLES) {
        const rotated = rotateCanvas(src, angle);
        const v = rowVariance(rotated);
        if (v > bestVariance) {
          bestVariance = v;
          bestAngle = angle;
        }
      }
      resolve(bestAngle);
    };
    img.onerror = () => { URL.revokeObjectURL(url); resolve(0); };
    img.src = url;
  });
}

/**
 * Deskew ảnh và trả về Blob đã được chỉnh thẳng.
 * Nếu góc nhỏ hơn 0.5° → trả nguyên bản (không đáng chỉnh).
 */
export async function deskewImage(file: File): Promise<File> {
  // Chỉ xử lý file ảnh
  if (!file.type.startsWith("image/")) return file;

  const angle = await detectSkewAngle(file);
  if (Math.abs(angle) < 0.5) return file; // Không cần chỉnh

  return new Promise((resolve) => {
    const url = URL.createObjectURL(file);
    const img = new Image();
    img.onload = () => {
      URL.revokeObjectURL(url);
      const src = imageToCanvas(img);
      const rotated = rotateCanvas(src, angle);
      rotated.toBlob(
        (blob) => {
          if (!blob) { resolve(file); return; }
          const deskewed = new File([blob], file.name, { type: "image/jpeg" });
          resolve(deskewed);
        },
        "image/jpeg",
        0.92,
      );
    };
    img.onerror = () => { URL.revokeObjectURL(url); resolve(file); };
    img.src = url;
  });
}
