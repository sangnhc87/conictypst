import JSZip from "jszip";
import type { GameProject } from "./gameDb";

export async function exportGameZip(project: GameProject) {
  const zip = new JSZip();
  zip.file("project.json", JSON.stringify(project, null, 2));
  zip.file("HUONG-DAN.txt", [
    "SANG MATH GAME LAB",
    "",
    "Đây là bản sao ngân hàng câu hỏi và tùy chỉnh trò chơi trên thiết bị.",
    "Để chuyển máy: đăng nhập đúng Gmail có quyền, mở Game Lab và chọn Nhập ZIP.",
    "Một ngân hàng câu hỏi có thể dùng lại trong nhiều kiểu chơi đã mở quyền.",
    "Hình ảnh đã được đóng gói trực tiếp trong project.json.",
  ].join("\n"));
  return zip.generateAsync({ type: "blob", compression: "DEFLATE", compressionOptions: { level: 6 } });
}

export async function importGameZip(file: File, ownerEmail: string) {
  const zip = await JSZip.loadAsync(file);
  const entry = zip.file("project.json");
  if (!entry) throw new Error("ZIP không có file project.json.");
  const parsed = JSON.parse(await entry.async("text")) as GameProject;
  if (parsed.version !== 1 || !Array.isArray(parsed.questions) || !parsed.name) throw new Error("Dữ liệu game không hợp lệ.");
  const now = new Date().toISOString();
  return {
    ...parsed,
    id: crypto.randomUUID(),
    ownerEmail,
    name: `${parsed.name} — đã nhập`,
    createdAt: now,
    updatedAt: now,
    questions: parsed.questions.map((question) => ({ ...question, id: crypto.randomUUID() })),
  } satisfies GameProject;
}

export function downloadBlob(blob: Blob, fileName: string) {
  const url = URL.createObjectURL(blob);
  const anchor = document.createElement("a");
  anchor.href = url;
  anchor.download = fileName;
  anchor.click();
  window.setTimeout(() => URL.revokeObjectURL(url), 1000);
}
