import math from "./prompts/math-thpt.js";
import english10Hanoi from "./prompts/english-10-hanoi.js";
import english10Hcm from "./prompts/english-10-hcm.js";
import english12 from "./prompts/english-12.js";
import biology from "./prompts/biology-thpt.js";
import history from "./prompts/history-thpt.js";
import geography from "./prompts/geography-thpt.js";
import civics from "./prompts/civics-thpt.js";
import gdqp10 from "./prompts/gdqp-10.js";
import physics from "./prompts/physics-thpt.js";
import chemistry from "./prompts/chemistry-thpt.js";
import primary from "./prompts/primary-integrated.js";
import literature from "./prompts/literature-thpt.js";
import informatics from "./prompts/informatics-thpt.js";

export const SUBJECT_PROMPT_PROFILES = {
  "math-thpt-v1": math,
  "english-10-v1": english10Hanoi,
  "english-10-hcm-v1": english10Hcm,
  "english-12-v1": english12,
  "biology-thpt-v1": biology,
  "history-thpt-v1": history,
  "geography-thpt-v1": geography,
  "civics-thpt-v1": civics,
  "gdqp-10-v1": gdqp10,
  "physics-thpt-v1": physics,
  "chemistry-thpt-v1": chemistry,
  "primary-integrated-v1": primary,
  "literature-thpt-v1": literature,
  "informatics-thpt-v1": informatics,
};

// Unknown profiles remain safe and deterministic: the AI never silently uses
// a different subject's rules unless the profile is explicitly Math.
export const resolvePromptProfile = (profileId) => SUBJECT_PROMPT_PROFILES[profileId] || math;

export const buildSystemPrompt = (profileId, grade, generateSolutions) => {
  const profile = resolvePromptProfile(profileId);
  const subjectRules = profile.rules.map((rule, index) => `${index + 8}. ${rule}`).join("\n");
  return `Bạn là ${profile.role}. Chuyển OCR Markdown thành dữ liệu trình chiếu chính xác cho môn ${profile.subject}, khối ${grade || "không xác định"}.
Quy tắc bắt buộc:
1. Giữ đủ TẤT CẢ câu hỏi, phương án, phần thi, đoạn dẫn, bảng, hình và dữ kiện; không rút gọn, không tự giải thay nội dung gốc.
2. Nhận diện: một đáp án = single-choice; đúng/sai nhiều ý = true-false; trả lời ngắn = short-answer; tự luận = essay.
3. Tách công thức thành block math với LaTeX sạch; văn bản là paragraph; bảng là table; danh sách là list. Trường không dùng trả chuỗi rỗng hoặc mảng rỗng đúng schema.
4. Chỉ đánh isCorrect/correctValue khi nguồn có đáp án rõ. Nếu không rõ dùng null và thêm warning; tuyệt đối không đoán đáp án.
5. Tạo sections theo các phần thực có trong đề. Tạo groups khi một đoạn dẫn/tư liệu/bảng/hình/giả thiết phục vụ từ hai câu trở lên; dùng cùng groupKey cho các câu con.
6. Không chép stimulus chung vào stem từng câu. Stem chỉ giữ yêu cầu riêng; group stimulus giữ nguyên nội dung dùng chung.
7. Sửa lỗi OCR hiển nhiên nhưng không đổi nội dung chuyên môn. Khi mơ hồ, giữ gần nguyên bản, hạ confidence và thêm warning.
${subjectRules}
${generateSolutions ? "" : `${profile.rules.length + 8}. KHÔNG TẠO LỜI GIẢI: trả solution: [] cho mọi câu.`}`;
};
