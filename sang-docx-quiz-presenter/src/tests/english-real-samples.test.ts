// @vitest-environment jsdom

import { readFile } from 'node:fs/promises';
import { join } from 'node:path';
import mammoth from 'mammoth';
import { describe, expect, it } from 'vitest';
import { parseEnglishStructuredHtml } from '../features/question-parser/parser';

const sample = (name: string) => join(process.cwd(), 'public', 'samples', name);

describe('English DOCX sample regression audit', () => {
  it.each([
    ['Hanoi', 'HN-De-thi-tuyen-sinh-10-Tieng-Anh-So-GD-Ha-Noi-nam-26-27.docx', 'english-10-v1', ['reading:6', 'announcement:4', 'cloze:6', 'gapped-text:4'], { 'single-choice': 40 }],
    ['HCMC', 'thuvienhoclieu.com-De-thi-tuyen-sinh-10-Tieng-Anh-So-GD-TP-HCM-nam-26-27-.docx', 'english-10-hcm-v1', ['cloze:6', 'reading-true-false:4', 'reading-choice:2'], { 'single-choice': 24, 'true-false': 4, 'short-answer': 12 }],
    ['Bac Ninh', 'De-kiem-tra-HK2-Tieng-Anh-12-So-GD-Bac-Ninh-25-26.docx', 'english-12-v1', ['advertisement:6', 'leaflet:6', 'gapped-text:5', 'reading-1:8', 'reading-2:10'], { 'single-choice': 40 }],
  ])('keeps the %s sample structurally readable', async (_label, filename, profileId, expectedGroups, expectedTypes) => {
    const converted = await mammoth.convertToHtml({ buffer: await readFile(sample(filename)) });
    const parsed = parseEnglishStructuredHtml(converted.value, profileId);
    expect(parsed.questions).toHaveLength(40);
    expect(parsed.questions.every((question) => question.number > 0)).toBe(true);
    expect(parsed.questions.filter((question) => question.choices && question.choices.length >= 2).length).toBeGreaterThan(0);
    expect(parsed.groups?.map((group) => `${group.kind}:${group.questionIds.length}`)).toEqual(expectedGroups);
    expect(parsed.warnings).toHaveLength(0);
    expect(parsed.questions.reduce<Record<string, number>>((counts, question) => ({ ...counts, [question.type]: (counts[question.type] || 0) + 1 }), {})).toEqual(expectedTypes);
  });
});
