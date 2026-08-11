import { describe, expect, it } from "vitest";
import { ENGLISH_CORE_PROFILE_IDS, SUBJECT_OPTIONS, SUBJECT_PROFILES, defaultProfileForSubject, profilesForSubject } from "../config/subjectProfiles";
import { createProfileSample } from "../demo/profileSamples";
import { cacheKey } from "../features/cache/fileCache";
import { htmlFor, typstFor } from "../features/export/exporters";

describe("subject profile registry", () => {
  it("contains every requested subject and distinct English 10/12 profiles", () => {
    const ids = SUBJECT_PROFILES.map((profile) => profile.id);
    expect(new Set(ids).size).toBe(ids.length);
    expect(ids).toContain("english-10-v1");
    expect(ids).toContain("english-12-v1");
    expect(new Set(SUBJECT_PROFILES.map((profile) => profile.subject))).toEqual(new Set([
      "Toán", "Tiếng Anh", "Sinh học", "Lịch sử", "Địa lý", "GDCD", "GDQP", "Vật lý", "Hóa học", "Tiểu học", "Ngữ văn", "Tin học",
    ]));
  });

  it("builds an editable sample for every profile with consistent references", () => {
    for (const profile of SUBJECT_PROFILES) {
      const sample = createProfileSample(profile.id, profile.defaultGrade);
      expect(sample.profile?.id).toBe(profile.id);
      expect(sample.questions.length).toBeGreaterThanOrEqual(3);
      for (const group of sample.groups || []) {
        expect(group.stimulus.length).toBeGreaterThan(0);
        expect(group.questionIds.length).toBeGreaterThanOrEqual(2);
        for (const questionId of group.questionIds) {
          expect(sample.questions.find((question) => question.id === questionId)?.groupId).toBe(group.id);
        }
      }
      if (profile.groupMode === "central") expect(sample.groups?.length).toBeGreaterThan(0);
    }
  });

  it("separates OCR cache by profile, grade and prompt version", () => {
    expect(cacheKey("abc", "auto", true, "english-10-v1@1.0.0:10"))
      .not.toBe(cacheKey("abc", "auto", true, "english-12-v1@1.0.0:12"));
  });

  it("has a focused one-subject catalog with two core English spaces", () => {
    expect(SUBJECT_OPTIONS).toHaveLength(12);
    expect(defaultProfileForSubject("Tiếng Anh").id).toBe("english-10-v1");
    expect(profilesForSubject("Tiếng Anh").map((profile) => profile.id)).toEqual(expect.arrayContaining([
      ...ENGLISH_CORE_PROFILE_IDS,
      "english-10-hcm-v1",
    ]));
  });
});

describe("shared question context exports", () => {
  it("keeps a shared English passage in offline HTML and subject-aware Typst", async () => {
    const sample = createProfileSample("english-12-v1", "12");
    const html = await htmlFor(sample, "GV-TEST-1234");
    expect(html).toContain("Advertisement · Weekend Science Tour");
    expect(html).toContain("WEEKEND SCIENCE TOUR");
    expect(html).toContain("shared-context");
    const typst = typstFor(sample);
    expect(typst).toContain("TIẾNG ANH TỐT NGHIỆP THPT · TỪ 2025");
    expect(typst).toContain("WEEKEND SCIENCE TOUR");
  });
});
