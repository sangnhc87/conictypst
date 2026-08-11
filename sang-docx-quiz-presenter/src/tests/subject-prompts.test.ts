import { describe, expect, it } from "vitest";
// @ts-expect-error Cloudflare Pages Function is checked as JavaScript at deploy time.
import { buildSystemPrompt, resolvePromptProfile } from "../../functions/api/subjectProfiles.js";

describe("subject-specific AI prompts", () => {
  it("routes the HCM grade-9-to-10 English sample to its own profile", () => {
    const profile = resolvePromptProfile("english-10-hcm-v1");
    const prompt = buildSystemPrompt("english-10-hcm-v1", "10", true);

    expect(profile.subject).toContain("TP.HCM");
    expect(profile.subject).not.toContain("Toán");
    expect(prompt).toContain("1–4 pronunciation & stress");
    expect(prompt).toContain("17–22 cloze passage");
    expect(prompt).toContain("23–26 reading True/False");
    expect(prompt).toContain("27–28 reading multiple choice");
    expect(prompt).toContain("Cloze 17–22 phải là một group stimulus duy nhất");
  });

  it("keeps every supported subject on its own prompt rules", () => {
    const subjects = [
      ["biology-thpt-v1", "Sinh học"],
      ["history-thpt-v1", "Lịch sử"],
      ["geography-thpt-v1", "Địa lý"],
      ["civics-thpt-v1", "GDCD"],
      ["gdqp-10-v1", "GDQP 10"],
      ["physics-thpt-v1", "Vật lý"],
      ["chemistry-thpt-v1", "Hóa học"],
      ["primary-integrated-v1", "Tiểu học"],
      ["literature-thpt-v1", "Ngữ văn"],
      ["informatics-thpt-v1", "Tin học"],
    ] as const;

    for (const [id, subject] of subjects) {
      const profile = resolvePromptProfile(id);
      expect(profile.subject).toContain(subject);
      expect(buildSystemPrompt(id, "12", true)).toContain(profile.rules[0]);
    }
  });

  it("keeps the Informatics paper's shared and orientation-specific parts", () => {
    const profile = resolvePromptProfile("informatics-thpt-v1");
    const prompt = buildSystemPrompt("informatics-thpt-v1", "12", true);

    expect(profile.subject).toContain("Tin học");
    expect(prompt).toContain("24 câu trắc nghiệm nhiều phương án A–D");
    expect(prompt).toContain("Câu 1–2 là phần chung");
    expect(prompt).toContain("Câu 3–4 thuộc định hướng Khoa học máy tính");
    expect(prompt).toContain("Câu 5–6 thuộc định hướng Tin học ứng dụng");
    expect(prompt).toContain("Bảng mã hai cột Python/C++");
  });
});
