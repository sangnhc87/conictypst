import { QUESTION_PATTERNS as R } from '../../config/questionPatterns';
import { getSubjectProfile } from '../../config/subjectProfiles';
import type { ContentBlock, Question, QuestionGroup, QuestionType, ImportWarning, QuizSection } from '../../models/quiz';
import { uid } from '../../models/quiz';

export interface ParsedDocument { questions: Question[]; warnings: ImportWarning[]; sections?: QuizSection[]; groups?: QuestionGroup[] }
const paragraph = (text:string):ContentBlock => ({id:uid('p'),kind:'paragraph',text});
const examEndFurniture = /^(?:[-—–\s]*HẾT[-—–\s]*|THÍ SINH KHÔNG ĐƯỢC SỬ DỤNG TÀI LIỆU[;,.]?|GIÁM THỊ KHÔNG GIẢI THÍCH GÌ THÊM[;,.]?)/iu;
const examFurniture = /^(?:SỞ GIÁO DỤC|ĐỀ KIỂM TRA|NĂM HỌC|MÔN\s*:|THỜI GIAN|HỌ VÀ TÊN|SỐ BÁO DANH|MÃ ĐỀ|.*ĐỀ CÓ\s+\d+\s+TRANG|THE END|ĐÁP ÁN|LỜI GIẢI|[-—–\s]*HẾT[-—–\s]*|THÍ SINH KHÔNG ĐƯỢC SỬ DỤNG TÀI LIỆU|GIÁM THỊ KHÔNG GIẢI THÍCH GÌ THÊM)/iu;
const parseTextToBlocks = (text: string): ContentBlock[] => {
  const blocks: ContentBlock[] = [];
  const regex = /!\[([^\]]*)\]\((data:image\/[^)]+)\)/g;
  let lastIndex = 0;
  let match;
  while ((match = regex.exec(text)) !== null) {
    if (match.index > lastIndex) {
      const pText = text.slice(lastIndex, match.index).trim();
      if (pText) blocks.push(paragraph(pText));
    }
    blocks.push({ id: uid('i'), kind: 'image', src: match[2], name: match[1] || 'image', alt: match[1], width: 88, align: 'center' });
    lastIndex = regex.lastIndex;
  }
  if (lastIndex < text.length) {
    const trailing = text.slice(lastIndex).trim();
    if (trailing) blocks.push(paragraph(trailing));
  }
  return blocks.length ? blocks : [paragraph(text)];
};

const linesFromHtml = (html:string) => {
  const doc = new DOMParser().parseFromString(html, 'text/html');
  const imgs = doc.body.querySelectorAll('img');
  for (let i = 0; i < imgs.length; i++) {
    const img = imgs[i];
    const src = img.getAttribute('src');
    if (src && src.startsWith('data:image')) {
      const textNode = doc.createTextNode(` ![${img.getAttribute('alt') || 'image'}](${src}) `);
      img.parentNode?.replaceChild(textNode, img);
    } else {
      img.parentNode?.removeChild(img);
    }
  }
  const inlineText = (element: Element) => {
    const visit = (node: Node): string => {
      if (node.nodeType === Node.TEXT_NODE) return node.textContent || '';
      if (node.nodeType !== Node.ELEMENT_NODE) return '';
      const childText = [...node.childNodes].map(visit).join('');
      if ((node as Element).tagName.toLowerCase() === 'br') return '\n';
      return (node as Element).tagName.toLowerCase() === 'u' ? `<u>${childText}</u>` : childText;
    };
    return visit(element).split('\n').map((line) => line.replace(/\s+/gu, ' ').trim()).join('\n').trim();
  };
  return [...doc.body.querySelectorAll('p,li,h1,h2,h3')]
    .flatMap((element) => inlineText(element).split(/\n+/u).map((line) => line.trim()).filter(Boolean));
};
export function parseStructuredHtml(html:string):ParsedDocument { return parseLines(linesFromHtml(html)); }

/**
 * Profile-aware fallback for subjects whose official paper family is not yet
 * pinned to a single provincial template. It gives the editor real sections
 * and keeps a true/false stem in a separate shared-data group. Official
 * adapters remain preferred for the validated English, History, Geography,
 * Physics, Biology and GDQP papers.
 */
export function parseProfileStructuredHtml(html: string, profileId: string): ParsedDocument {
  const parsed = parseStructuredHtml(html);
  const profile = getSubjectProfile(profileId);
  const sections = profile.sections.map((template) => ({
    id: uid('section'),
    title: template.title,
    instruction: template.instruction,
    questionIds: [] as string[],
    template,
  }));
  const groups: QuestionGroup[] = [...(parsed.groups || [])];
  const sectionRange = (title: string) => title.match(/(?:Câu|Bài)\s*(\d+)\s*[–-]\s*(\d+)/iu);
  const sectionFor = (question: Question) => {
    const ranged = sections.find((section) => {
      const range = sectionRange(section.title);
      return range && question.number >= Number(range[1]) && question.number <= Number(range[2]);
    });
    if (ranged) return ranged;
    const typeNeedle = question.type === 'single-choice' ? 'Một đáp án'
      : question.type === 'true-false' ? 'Đúng – sai'
      : question.type === 'short-answer' ? 'Trả lời ngắn'
      : 'Tự luận';
    const matches = sections.filter((section) => section.template.formats.some((format) => format.includes(typeNeedle)));
    // When a profile has a theory section and a later applied/data section
    // that both permit the same type, prefer the later, more specific one for
    // true/false, short-answer and essay questions.
    return (question.type === 'single-choice' ? matches[0] : matches.at(-1)) || sections[0];
  };

  parsed.questions.forEach((question) => {
    const section = sectionFor(question);
    if (section) {
      question.sectionId = section.id;
      section.questionIds.push(question.id);
    }
    if (question.type === 'true-false' && question.stem.length) {
      const groupId = uid('group');
      groups.push({
        id: groupId,
        title: `Câu ${question.number} · Dữ kiện chung`,
        instruction: 'Đọc dữ kiện chung và xác định Đúng hoặc Sai cho từng ý.',
        stimulus: question.stem,
        questionIds: [question.id],
        kind: `${profile.subject.toLowerCase()}-data`,
      });
      question.stem = [];
      question.groupId = groupId;
    }
  });

  return {
    ...parsed,
    sections: sections.map(({ template: _template, ...section }) => section),
    groups,
  };
}

type LiteratureRawBlock = { number: number; lines: string[] };

const literatureQuestionStart = /^Câu\s*0*(\d+)\s*[:.)]\s*(.*)$/iu;
const literatureWritingStart = /^Câu\s*([12])(?:\s*\([^)]*\))?\s*(?:[:.)]\s*)?(.*)$/iu;

/**
 * Literature Word files contain an answer/rubric table as well as ordinary
 * paragraphs. The generic line reader intentionally ignores table cells for
 * other subjects, so this reader flattens each table row only for Literature.
 */
const literatureLinesFromHtml = (html: string) => {
  const doc = new DOMParser().parseFromString(html, 'text/html');
  const inlineText = (element: Element) => {
    const visit = (node: Node): string => {
      if (node.nodeType === Node.TEXT_NODE) return node.textContent || '';
      if (node.nodeType !== Node.ELEMENT_NODE) return '';
      const childText = [...node.childNodes].map(visit).join('');
      return (node as Element).tagName.toLowerCase() === 'br' ? `${childText}\n` : childText;
    };
    return visit(element).split(/\n+/u).map((line) => line.replace(/\s+/gu, ' ').trim()).filter(Boolean).join('\n');
  };

  for (const img of [...doc.body.querySelectorAll('img')]) {
    const src = img.getAttribute('src');
    if (src?.startsWith('data:image')) img.replaceWith(doc.createTextNode(` ![${img.getAttribute('alt') || 'image'}](${src}) `));
    else img.remove();
  }
  for (const table of [...doc.body.querySelectorAll('table')]) {
    const fragment = doc.createDocumentFragment();
    for (const row of [...table.querySelectorAll('tr')]) {
      const cells = [...row.querySelectorAll(':scope > th, :scope > td')]
        .map((cell) => cell.textContent?.replace(/\s+/gu, ' ').trim() || '')
        .filter(Boolean);
      if (!cells.length) continue;
      const paragraphElement = doc.createElement('p');
      paragraphElement.textContent = cells.join(' | ');
      fragment.appendChild(paragraphElement);
    }
    table.replaceWith(fragment);
  }
  return [...doc.body.querySelectorAll('p,li,h1,h2,h3')]
    .flatMap((element) => inlineText(element).split(/\n+/u).map((line) => line.trim()).filter(Boolean));
};

const normalizeLiteratureLines = (lines: string[]) => lines
  .map((line) => line.replace(/\s+/gu, ' ').trim())
  .filter(Boolean);

const collectLiteratureBlocks = (
  lines: string[],
  start: number,
  end: number,
  startPattern: RegExp,
  maxNumber?: number,
) => {
  const blocks: LiteratureRawBlock[] = [];
  let current: LiteratureRawBlock | undefined;
  for (let index = start; index < end; index += 1) {
    const match = lines[index].match(startPattern);
    const number = match ? Number(match[1]) : undefined;
    if (match && number !== undefined && (maxNumber === undefined || number <= maxNumber)) {
      current = { number, lines: match[2]?.trim() ? [match[2].trim()] : [] };
      blocks.push(current);
      continue;
    }
    if (current) current.lines.push(lines[index]);
  }
  return blocks;
};

const literatureFurniture = /^(?:[-—–\s]*HẾT[-—–\s]*|–?\s*THÍ SINH KHÔNG ĐƯỢC SỬ DỤNG TÀI LIỆU[;,.]?|–?\s*GIÁM THỊ KHÔNG GIẢI THÍCH GÌ THÊM[;,.]?)/iu;

const literatureSolutionSteps = (rubric: string[], sample: string[]) => {
  const lines = [
    ...rubric.map((line) => `HƯỚNG DẪN CHẤM: ${line}`),
    ...sample.filter((line) => !/^Câu\s*\d+/iu.test(line)),
  ].filter(Boolean);
  return lines.length ? lines.map((line) => ({ id: uid('s'), content: parseTextToBlocks(line) })) : undefined;
};

const literatureRubrics = (lines: string[], start: number, end: number) => {
  const rubrics = new Map<string, string[]>();
  let currentKey: string | undefined;
  for (let index = start; index < end; index += 1) {
    const line = lines[index];
    const cells = line.split(/\s*\|\s*/u).map((cell) => cell.trim());
    const part = cells[0]?.toUpperCase();
    const number = Number(cells[1]);
    if ((part === 'I' && number >= 1 && number <= 5) || (part === 'II' && number >= 1 && number <= 2)) {
      currentKey = part === 'I' ? `reading-${number}` : `writing-${number}`;
      const content = cells[2] || line;
      const score = cells[3] ? ` (${cells[3]} điểm)` : '';
      rubrics.set(currentKey, [`${content}${score}`]);
      continue;
    }
    if (currentKey && cells.length < 3 && line) rubrics.get(currentKey)!.push(line);
  }
  return rubrics;
};

/**
 * Parse the official 2026 Ministry Literature paper as its own document
 * family. The paper is not a multiple-choice quiz: one argumentative text
 * feeds five open reading questions, followed by two writing tasks. Each
 * question keeps both the marking rubric and the reference solution so the
 * teacher can edit either one independently.
 */
export function parseLiteratureLines(lines: string[], profileId = 'literature-thpt-v1'): ParsedDocument {
  const normalized = normalizeLiteratureLines(lines);
  const answerMarker = normalized.findIndex((line) => /^ĐÁP ÁN BỘ GIÁO DỤC$/iu.test(line));
  const solutionMarker = normalized.findIndex((line) => /^LỜI GIẢI THAM KHẢO$/iu.test(line));
  const endOfExam = answerMarker >= 0 ? answerMarker : solutionMarker >= 0 ? solutionMarker : normalized.length;
  const examLines = normalized.slice(0, endOfExam);
  const readingHeading = examLines.findIndex((line) => /^I\.\s*ĐỌC HIỂU/iu.test(line));
  const readingInstruction = examLines.findIndex((line, index) => index > readingHeading && /^Đọc văn bản:?$/iu.test(line));
  const readingRequest = examLines.findIndex((line, index) => index > readingInstruction && /^Thực hiện các yêu cầu:?$/iu.test(line));
  const writingHeading = examLines.findIndex((line) => /^II\.\s*VIẾT/iu.test(line));
  const readingStart = readingInstruction >= 0 ? readingInstruction + 1 : readingHeading + 1;
  const readingEnd = readingRequest >= 0 ? readingRequest : writingHeading >= 0 ? writingHeading : examLines.length;
  const readingStimulus = examLines.slice(readingStart, readingEnd).filter((line) => !literatureFurniture.test(line));
  const readingBlocks = collectLiteratureBlocks(examLines, readingRequest >= 0 ? readingRequest + 1 : readingStart, writingHeading >= 0 ? writingHeading : examLines.length, literatureQuestionStart, 5);
  const writingBlocks = collectLiteratureBlocks(examLines, writingHeading >= 0 ? writingHeading + 1 : examLines.length, examLines.length, literatureWritingStart, 2);
  const rubricMap = answerMarker >= 0 && solutionMarker >= 0 ? literatureRubrics(normalized, answerMarker + 1, solutionMarker) : new Map<string, string[]>();
  const solutionHeading = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^I\.\s*ĐỌC HIỂU/iu.test(line)) : -1;
  const solutionWritingHeading = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^II\.\s*VIẾT/iu.test(line)) : -1;
  const readingSolutions = solutionHeading >= 0 ? collectLiteratureBlocks(normalized, solutionHeading + 1, solutionWritingHeading >= 0 ? solutionWritingHeading : normalized.length, literatureQuestionStart, 5) : [];
  const writingSolutions = solutionWritingHeading >= 0 ? collectLiteratureBlocks(normalized, solutionWritingHeading + 1, normalized.length, literatureQuestionStart, 2) : [];
  const solutionMap = new Map<string, string[]>();
  readingSolutions.forEach((block) => solutionMap.set(`reading-${block.number}`, block.lines));
  writingSolutions.forEach((block) => solutionMap.set(`writing-${block.number}`, block.lines));

  const profile = getSubjectProfile(profileId);
  const sections: QuizSection[] = profile.sections.map((section) => ({ id: section.id, title: section.title, instruction: section.instruction, questionIds: [] }));
  const questions: Question[] = [];
  const groups: QuestionGroup[] = [];
  const section = (id: string) => sections.find((item) => item.id === id);
  const addQuestion = (question: Question) => {
    questions.push(question);
    section(question.sectionId || '')?.questionIds.push(question.id);
  };

  const readingGroup: QuestionGroup = {
    id: uid('group'),
    title: 'PHẦN I · Văn bản đọc hiểu',
    instruction: 'Đọc văn bản nguồn và thực hiện 5 yêu cầu. Câu trả lời có thể diễn đạt khác nhưng phải phù hợp văn bản và hướng dẫn chấm.',
    stimulus: readingStimulus.flatMap(parseTextToBlocks),
    questionIds: [],
    kind: 'literature-reading',
  };
  groups.push(readingGroup);

  readingBlocks.forEach((raw, index) => {
    const key = `reading-${raw.number}`;
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'short-answer',
      stem: (raw.lines.length ? raw.lines : ['Trả lời ngắn gọn theo yêu cầu đọc hiểu.']).flatMap(parseTextToBlocks),
      shortAnswer: { acceptedAnswers: [], caseSensitive: false },
      solution: literatureSolutionSteps(rubricMap.get(key) || [], solutionMap.get(key) || []),
      attachments: [], confidence: 'high', warnings: [], sectionId: 'reading', groupId: readingGroup.id,
      skill: ['Nhận biết thông tin', 'Nhận biết bằng chứng', 'Giải thích từ ngữ hình ảnh', 'Phân tích lập luận', 'Liên hệ – phản biện'][index] || 'Đọc hiểu',
      format: 'Đọc hiểu · trả lời ngắn · đáp án mở',
    };
    addQuestion(question);
    readingGroup.questionIds.push(question.id);
  });

  const socialRaw = writingBlocks.find((block) => block.number === 1);
  if (socialRaw) {
    addQuestion({
      id: uid('q'), number: 1, type: 'essay', stem: socialRaw.lines.flatMap(parseTextToBlocks),
      solution: literatureSolutionSteps(rubricMap.get('writing-1') || [], solutionMap.get('writing-1') || []),
      attachments: [], confidence: 'high', warnings: [], sectionId: 'social', skill: 'Nghị luận xã hội', format: 'Đoạn văn khoảng 200 chữ · rubric mở',
    });
  }

  const literaryRaw = writingBlocks.find((block) => block.number === 2);
  if (literaryRaw) {
    const poemStart = literaryRaw.lines.findIndex((line) => /^NHỮNG CHIẾC LÁ$/iu.test(line));
    const poemSource = literaryRaw.lines.findIndex((line, index) => index > poemStart && /^\(Thơ Nguyễn Đình Thi/iu.test(line));
    const poemLines = poemStart >= 0
      ? literaryRaw.lines.slice(poemStart, poemSource >= 0 ? poemSource + 1 : literaryRaw.lines.length).concat(literaryRaw.lines.filter((line) => /^³\s*/u.test(line)))
      : [];
    const poemGroup: QuestionGroup | undefined = poemLines.length ? {
      id: uid('group'), title: 'Câu 2 · Văn bản thơ: Những chiếc lá', instruction: 'Đọc thi phẩm và phân tích nội dung, nghệ thuật theo yêu cầu viết.', stimulus: poemLines.flatMap(parseTextToBlocks), questionIds: [], kind: 'literature-poem',
    } : undefined;
    if (poemGroup) groups.push(poemGroup);
    const promptLines = poemStart >= 0 ? literaryRaw.lines.slice(0, poemStart) : literaryRaw.lines;
    const question: Question = {
      id: uid('q'), number: 2, type: 'essay', stem: promptLines.flatMap(parseTextToBlocks),
      solution: literatureSolutionSteps(rubricMap.get('writing-2') || [], solutionMap.get('writing-2') || []),
      attachments: [], confidence: 'high', warnings: [], sectionId: 'literary', skill: 'Nghị luận văn học · thơ tự do', format: 'Bài văn khoảng 600 chữ · rubric mở',
    };
    if (poemGroup) { question.groupId = poemGroup.id; poemGroup.questionIds.push(question.id); }
    addQuestion(question);
  }

  return { questions, warnings: [], sections, groups };
}

export function parseLiteratureStructuredHtml(html: string, profileId = 'literature-thpt-v1'): ParsedDocument {
  return parseLiteratureLines(literatureLinesFromHtml(html), profileId);
}

const geographyLinesFromHtml = (html: string) => {
  const doc = new DOMParser().parseFromString(html, 'text/html');
  const inlineText = (element: Element) => {
    const visit = (node: Node): string => {
      if (node.nodeType === Node.TEXT_NODE) return node.textContent || '';
      if (node.nodeType !== Node.ELEMENT_NODE) return '';
      const childText = [...node.childNodes].map(visit).join('');
      return (node as Element).tagName.toLowerCase() === 'br' ? `${childText}\n` : childText;
    };
    return visit(element).split('\n').map((line) => line.replace(/\s+/gu, ' ').trim()).join('\n').trim();
  };
  for (const img of [...doc.body.querySelectorAll('img')]) {
    const src = img.getAttribute('src');
    if (src?.startsWith('data:image')) img.replaceWith(doc.createTextNode(` ![${img.getAttribute('alt') || 'biểu đồ'}](${src}) `));
    else img.remove();
  }
  for (const table of [...doc.body.querySelectorAll('table')]) {
    const rows = [...table.querySelectorAll('tr')].map((row) => [...row.children].map((cell) => cell.textContent?.replace(/\s+/gu, ' ').trim() || ''));
    const token = `[[GEOTABLE:${encodeURIComponent(JSON.stringify(rows))}]]`;
    const tableMarker = doc.createElement('p');
    tableMarker.textContent = token;
    table.replaceWith(tableMarker);
  }
  return [...doc.body.querySelectorAll('p,li,h1,h2,h3')]
    .flatMap((element) => inlineText(element).split(/\n+/u).map((line) => line.trim()).filter(Boolean));
};

const parseGeographyTextToBlocks = (text: string): ContentBlock[] => {
  const blocks: ContentBlock[] = [];
  const token = /!\[([^\]]*)\]\((data:image\/[^)]+)\)|\[\[GEOTABLE:([^\]]+)\]\]/g;
  let lastIndex = 0;
  let match: RegExpExecArray | null;
  while ((match = token.exec(text)) !== null) {
    const before = text.slice(lastIndex, match.index).trim();
    if (before) blocks.push(paragraph(before));
    if (match[3]) {
      try {
        const rows = JSON.parse(decodeURIComponent(match[3])) as string[][];
        if (rows.length) blocks.push({ id: uid('table'), kind: 'table', rows });
      } catch {
        blocks.push(paragraph('[Không đọc được bảng số liệu]'));
      }
    } else {
      blocks.push({ id: uid('geo-img'), kind: 'image', src: match[2], name: match[1] || 'bieu-do', alt: match[1] || 'Biểu đồ/ hình Địa lý', width: 68, align: 'center' });
    }
    lastIndex = token.lastIndex;
  }
  const trailing = text.slice(lastIndex).trim();
  if (trailing) blocks.push(paragraph(trailing));
  return blocks.length ? blocks : [paragraph(text)];
};

type HistorySingleRaw = { number: number; head: string; lines: string[] };
type HistoryTrueFalseRaw = { number: number; head: string; stimulus: string[]; statements: { label: string; text: string }[] };

const historyQuestionStart = /^Câu\s*0*(\d+)\s*[.:)]\s*(.*)$/iu;
const historyChoiceStart = /^([A-D])\s*[.:)]\s+(.+)$/u;
const historyStatementStart = /^([a-d])\s*[.)]\s+(.+)$/u;

const normalizeHistoryLines = (lines: string[]) => lines
  .map((line) => line.replace(/\s+/gu, " ").trim())
  .filter(Boolean)
  .filter((line) => !examEndFurniture.test(line));

const splitHistoryChoices = (lines: string[]) => {
  const choices: { label: string; text: string }[] = [];
  const stem: string[] = [];
  const marker = /\b([A-D])\s*[.:)]\s*/g;
  for (const line of lines) {
    const matches = [...line.matchAll(marker)];
    if (!matches.length) {
      if (line.trim()) stem.push(line.trim());
      continue;
    }
    const before = line.slice(0, matches[0].index).trim();
    if (before) stem.push(before);
    matches.forEach((match, index) => {
      const start = (match.index || 0) + match[0].length;
      const end = index + 1 < matches.length ? (matches[index + 1].index || line.length) : line.length;
      const text = line.slice(start, end).trim();
      if (text) choices.push({ label: match[1].toUpperCase(), text });
    });
  }
  return { stem, choices };
};

// Biology data often contains codon labels such as “A: 5’GCA3’”.  A generic
// A–D splitter would mistake that label for answer choice A.  Official
// graduation papers use the period/parenthesis form for the four options, so
// keep the Biology splitter deliberately strict and leave labels inside the
// shared stimulus untouched.
const splitBiologyChoices = (lines: string[]) => {
  const choices: { label: string; text: string }[] = [];
  const stem: string[] = [];
  const marker = /(?<![\p{L}\p{N}])([A-D])\s*[.)]\s+/gu;
  for (const line of lines) {
    const matches = [...line.matchAll(marker)];
    if (!matches.length) {
      if (line.trim()) stem.push(line.trim());
      continue;
    }
    const before = line.slice(0, matches[0].index).trim();
    if (before) stem.push(before);
    matches.forEach((match, index) => {
      const start = (match.index || 0) + match[0].length;
      const end = index + 1 < matches.length ? (matches[index + 1].index || line.length) : line.length;
      const text = line.slice(start, end).trim();
      if (text) choices.push({ label: match[1].toUpperCase(), text });
    });
  }
  return { stem, choices };
};

const historyAnswerKey = (lines: string[], answerMarker: number, solutionMarker: number) => {
  const answers = new Map<number, string>();
  const end = solutionMarker >= 0 ? solutionMarker : lines.length;
  for (let index = answerMarker; index < end; index += 1) {
    if (lines[index] !== "Câu") continue;
    const numbers: number[] = [];
    let cursor = index + 1;
    while (cursor < end && /^\d{1,2}$/u.test(lines[cursor])) {
      numbers.push(Number(lines[cursor]));
      cursor += 1;
    }
    if (!numbers.length || lines[cursor] !== "Đáp án") continue;
    cursor += 1;
    const values: string[] = [];
    while (cursor < end && /^[A-D]$/iu.test(lines[cursor]) && values.length < numbers.length) {
      values.push(lines[cursor].toUpperCase());
      cursor += 1;
    }
    numbers.forEach((number, valueIndex) => {
      if (values[valueIndex]) answers.set(number, values[valueIndex]);
    });
    index = cursor - 1;
  }
  return answers;
};

const historyTrueFalseKey = (lines: string[], answerMarker: number, solutionMarker: number) => {
  const answers = new Map<number, (boolean | undefined)[]>();
  const end = solutionMarker >= 0 ? solutionMarker : lines.length;
  const partTwo = lines.findIndex((line, index) => index > answerMarker && /^PHẦN II\.\s*Đúng\/Sai$/iu.test(line));
  for (let index = partTwo >= 0 ? partTwo : answerMarker; index < end; index += 1) {
    const match = lines[index].match(/^Câu\s+([1-4])$/iu);
    if (!match) continue;
    const values: (boolean | undefined)[] = [];
    let cursor = index + 1;
    while (cursor < end && /^(?:Đúng|Sai)$/iu.test(lines[cursor]) && values.length < 4) {
      values.push(/^Đúng$/iu.test(lines[cursor]));
      cursor += 1;
    }
    if (values.length === 4) answers.set(Number(match[1]), values);
    index = cursor - 1;
  }
  return answers;
};

const historyPartISolutions = (lines: string[], start: number, end: number) => {
  const solutions = new Map<number, string[]>();
  let current: number | undefined;
  let collecting = false;
  for (let index = start; index < end; index += 1) {
    const match = lines[index].match(historyQuestionStart);
    if (match) {
      current = Number(match[1]);
      solutions.set(current, []);
      collecting = false;
      continue;
    }
    if (current === undefined) continue;
    const solution = lines[index].match(/^Lời giải\s*:\s*(.*)$/iu);
    if (solution) {
      collecting = true;
      if (solution[1].trim()) solutions.get(current)!.push(solution[1].trim());
    } else if (collecting && lines[index].trim()) {
      solutions.get(current)!.push(lines[index]);
    }
  }
  return solutions;
};

const historyPartIISolutions = (lines: string[], start: number) => {
  const solutions = new Map<number, string[]>();
  let current: number | undefined;
  let collecting = false;
  for (let index = start; index < lines.length; index += 1) {
    const match = lines[index].match(/^Câu\s*([1-4])$/iu);
    if (match) {
      current = Number(match[1]);
      solutions.set(current, []);
      collecting = false;
      continue;
    }
    if (current === undefined) continue;
    const answer = lines[index].match(/^Đáp án\s*:\s*(.*)$/iu);
    if (answer) {
      solutions.get(current)!.push(`Đáp án: ${answer[1].trim()}`);
      continue;
    }
    const explanation = lines[index].match(/^Giải thích\s*:\s*(.*)$/iu);
    if (explanation) {
      collecting = true;
      if (explanation[1].trim()) solutions.get(current)!.push(explanation[1].trim());
      continue;
    }
    if (collecting && lines[index].trim()) solutions.get(current)!.push(lines[index]);
  }
  return solutions;
};

/** Parse the graduation History format: 24 A–D questions + 4 source-based true/false groups. */
export function parseHistoryLines(lines: string[], profileId = "history-thpt-v1"): ParsedDocument {
  const normalized = normalizeHistoryLines(lines);
  const answerMarker = normalized.findIndex((line) => /^ĐÁP ÁN THAM KHẢO$/iu.test(line));
  const solutionMarker = normalized.findIndex((line) => /^LỜI GIẢI THAM KHẢO$/iu.test(line));
  const endOfQuestions = answerMarker >= 0 ? answerMarker : solutionMarker >= 0 ? solutionMarker : normalized.length;
  const questionLines = normalized.slice(0, endOfQuestions);
  const partTwoIndex = questionLines.findIndex((line) => /^PHẦN II\s*:/iu.test(line));
  const partOneEnd = partTwoIndex >= 0 ? partTwoIndex : questionLines.length;
  const answerMap = answerMarker >= 0 ? historyAnswerKey(normalized, answerMarker, solutionMarker) : new Map<number, string>();
  const trueFalseAnswers = answerMarker >= 0 ? historyTrueFalseKey(normalized, answerMarker, solutionMarker) : new Map<number, (boolean | undefined)[]>();
  const partOneSolutionEnd = normalized.findIndex((line, index) => index > (solutionMarker >= 0 ? solutionMarker : 0) && /^PHẦN II\.\s*Đúng\/Sai$/iu.test(line));
  const partOneSolutions = solutionMarker >= 0 ? historyPartISolutions(normalized, solutionMarker, partOneSolutionEnd >= 0 ? partOneSolutionEnd : normalized.length) : new Map<number, string[]>();
  const partTwoSolutions = solutionMarker >= 0 && partOneSolutionEnd >= 0 ? historyPartIISolutions(normalized, partOneSolutionEnd + 1) : new Map<number, string[]>();
  const profile = getSubjectProfile(profileId);
  const sections: QuizSection[] = profile.sections.map((section) => ({ id: section.id, title: section.title, instruction: section.instruction, questionIds: [] }));
  const questions: Question[] = [];
  const groups: QuestionGroup[] = [];

  let currentSingle: HistorySingleRaw | undefined;
  const singleRaws: HistorySingleRaw[] = [];
  for (let index = 0; index < partOneEnd; index += 1) {
    const match = questionLines[index].match(historyQuestionStart);
    if (match && Number(match[1]) >= 1 && Number(match[1]) <= 24) {
      currentSingle = { number: Number(match[1]), head: match[2].trim(), lines: [] };
      singleRaws.push(currentSingle);
    } else if (currentSingle) {
      currentSingle.lines.push(questionLines[index]);
    }
  }

  for (const raw of singleRaws) {
    const { stem, choices } = splitHistoryChoices([raw.head, ...raw.lines]);
    const answer = answerMap.get(raw.number);
    const question: Question = {
      id: uid("q"), number: raw.number, type: "single-choice", stem: stem.flatMap(parseTextToBlocks),
      choices: choices.map((choice) => ({ id: uid("c"), label: choice.label, content: parseTextToBlocks(choice.text), isCorrect: answer ? choice.label === answer : null })),
      attachments: [], confidence: answer ? "high" : "medium", warnings: [], sectionId: "part-i",
      solution: partOneSolutions.get(raw.number)?.map((text) => ({ id: uid("s"), content: parseTextToBlocks(text) })),
    };
    if (!answer) question.warnings.push("Chưa nhận dạng được đáp án Phần I từ bảng đáp án.");
    if (choices.length !== 4) question.warnings.push("Chưa tách đủ 4 phương án A–D; cần đối chiếu lại định dạng Word.");
    questions.push(question);
    sections.find((section) => section.id === "part-i")?.questionIds.push(question.id);
  }

  let currentTrueFalse: HistoryTrueFalseRaw | undefined;
  const trueFalseRaws: HistoryTrueFalseRaw[] = [];
  for (let index = partTwoIndex >= 0 ? partTwoIndex : questionLines.length; index < questionLines.length; index += 1) {
    const match = questionLines[index].match(historyQuestionStart);
    if (match && Number(match[1]) >= 1 && Number(match[1]) <= 4) {
      currentTrueFalse = { number: Number(match[1]), head: match[2].trim(), stimulus: [], statements: [] };
      trueFalseRaws.push(currentTrueFalse);
      continue;
    }
    if (!currentTrueFalse) continue;
    const statement = questionLines[index].match(historyStatementStart);
    if (statement) currentTrueFalse.statements.push({ label: statement[1].toLowerCase(), text: statement[2].trim() });
    else if (currentTrueFalse.statements.length) currentTrueFalse.statements.at(-1)!.text += ` ${questionLines[index]}`;
    else currentTrueFalse.stimulus.push(questionLines[index]);
  }

  for (const raw of trueFalseRaws) {
    const answerValues = trueFalseAnswers.get(raw.number) || [];
    const question: Question = {
      id: uid("q"), number: raw.number, type: "true-false", stem: [],
      statements: raw.statements.map((statement, index) => ({ id: uid("s"), label: statement.label, content: parseTextToBlocks(statement.text), correctValue: answerValues[index] })),
      attachments: [], confidence: answerValues.length === 4 ? "high" : "medium", warnings: [], sectionId: "part-ii",
      solution: partTwoSolutions.get(raw.number)?.map((text) => ({ id: uid("s"), content: parseTextToBlocks(text) })),
    };
    if (answerValues.length !== 4) question.warnings.push("Chưa nhận dạng đủ đáp án Đúng/Sai từ bảng đáp án.");
    if (raw.statements.length !== 4) question.warnings.push("Câu chùm chưa đủ 4 mệnh đề a), b), c), d); cần đối chiếu lại.");
    const groupId = uid("group");
    groups.push({ id: groupId, title: `Câu ${raw.number} · Tư liệu chung`, instruction: "Đọc tư liệu và chọn Đúng hoặc Sai cho từng ý.", stimulus: [raw.head, ...raw.stimulus].flatMap(parseTextToBlocks), questionIds: [question.id], kind: "historical-source" });
    question.groupId = groupId;
    questions.push(question);
    sections.find((section) => section.id === "part-ii")?.questionIds.push(question.id);
  }

  const warnings: ImportWarning[] = [];
  if (!questions.length) warnings.push({ id: uid("w"), type: "parser", message: "Không tìm thấy cấu trúc đề tốt nghiệp Lịch sử: Phần I 24 câu và Phần II 4 câu Đúng/Sai." });
  return { questions, warnings, sections, groups };
}

export function parseHistoryStructuredHtml(html: string, profileId = "history-thpt-v1"): ParsedDocument {
  return parseHistoryLines(linesFromHtml(html), profileId);
}

type GeographyRaw = { number: number; head: string; lines: string[] };
const geographyQuestionStart = /^Câu\s*0*(\d+)\s*[.:)]\s*(.*)$/iu;
const geographyStatementStart = /^([a-d])\s*[.)]\s+(.+)$/iu;

const normalizeGeographyLines = (lines: string[]) => lines
  .map((line) => line.replace(/\s+/gu, ' ').trim())
  .filter(Boolean)
  .filter((line) => !examEndFurniture.test(line));

const geographyTableRows = (line: string): string[][] | undefined => {
  const match = line.match(/^\[\[GEOTABLE:([^\]]+)\]\]$/u);
  if (!match) return undefined;
  try {
    return JSON.parse(decodeURIComponent(match[1])) as string[][];
  } catch {
    return undefined;
  }
};

const geographyLetterAnswers = (lines: string[], start: number, end: number) => {
  const answers = new Map<number, string>();
  for (let index = start; index < end; index += 1) {
    const rows = geographyTableRows(lines[index]);
    if (rows) {
      for (let rowIndex = 0; rowIndex + 1 < rows.length; rowIndex += 1) {
        const numberRow = rows[rowIndex];
        const answerRow = rows[rowIndex + 1];
        if (numberRow[0] !== 'Câu' || answerRow[0] !== 'Đáp án') continue;
        numberRow.slice(1).forEach((number, valueIndex) => {
          const value = answerRow[valueIndex + 1];
          if (/^\d{1,2}$/u.test(number) && /^[A-D]$/iu.test(value || '')) answers.set(Number(number), value.toUpperCase());
        });
      }
      continue;
    }
    if (lines[index] !== 'Câu') continue;
    const numbers: number[] = [];
    let cursor = index + 1;
    while (cursor < end && /^\d{1,2}$/u.test(lines[cursor])) {
      numbers.push(Number(lines[cursor]));
      cursor += 1;
    }
    if (!numbers.length || lines[cursor] !== 'Đáp án') continue;
    cursor += 1;
    const values: string[] = [];
    while (cursor < end && /^[A-D]$/iu.test(lines[cursor]) && values.length < numbers.length) {
      values.push(lines[cursor].toUpperCase());
      cursor += 1;
    }
    numbers.forEach((number, valueIndex) => {
      if (values[valueIndex]) answers.set(number, values[valueIndex]);
    });
    index = cursor - 1;
  }
  return answers;
};

const geographyTrueFalseAnswers = (lines: string[], start: number, end: number) => {
  const answers = new Map<number, boolean[]>();
  for (let index = start; index < end; index += 1) {
    const rows = geographyTableRows(lines[index]);
    if (rows) {
      rows.slice(1).forEach((row) => {
        const match = row[0]?.match(/^Câu\s*([1-4])$/iu);
        const values = row.slice(1).filter((value) => /^(?:Đúng|Sai)$/iu.test(value)).map((value) => /^Đúng$/iu.test(value));
        if (match && values.length === 4) answers.set(Number(match[1]), values);
      });
      continue;
    }
    const match = lines[index].match(/^Câu\s*([1-4])$/iu);
    if (!match) continue;
    const values: boolean[] = [];
    let cursor = index + 1;
    while (cursor < end && /^(?:Đúng|Sai)$/iu.test(lines[cursor]) && values.length < 4) {
      values.push(/^Đúng$/iu.test(lines[cursor]));
      cursor += 1;
    }
    if (values.length === 4) answers.set(Number(match[1]), values);
    index = cursor - 1;
  }
  return answers;
};

const geographyShortAnswers = (lines: string[], start: number, end: number) => {
  const answers = new Map<number, string>();
  const sectionIndex = lines.findIndex((line, index) => index >= start && /^PHẦN III\.\s*Trả lời ngắn$/iu.test(line));
  const from = sectionIndex >= 0 ? sectionIndex + 1 : start;
  for (let index = from; index < end; index += 1) {
    const rows = geographyTableRows(lines[index]);
    if (rows) {
      rows.slice(1).forEach((row) => {
        const match = row[0]?.match(/^Câu\s*([1-6])$/iu);
        if (match && row[1]) answers.set(Number(match[1]), row[1].trim());
      });
      continue;
    }
    const match = lines[index].match(/^Câu\s*([1-6])$/iu);
    if (!match) continue;
    const answer = lines[index + 1]?.trim();
    if (answer && !/^Câu\b/iu.test(answer) && !/^(?:Đúng|Sai|A|B|C|D)$/iu.test(answer)) answers.set(Number(match[1]), answer);
  }
  return answers;
};

const geographySolutions = (lines: string[], start: number, end: number, maxNumber: number) => {
  const solutions = new Map<number, string[]>();
  let current: number | undefined;
  let collecting = false;
  for (let index = start; index < end; index += 1) {
    const match = lines[index].match(/^Câu\s*0*(\d+)\s*[.:)]?\s*(.*)$/iu);
    if (match && Number(match[1]) >= 1 && Number(match[1]) <= maxNumber) {
      current = Number(match[1]);
      solutions.set(current, []);
      collecting = false;
      continue;
    }
    if (current === undefined) continue;
    const solution = lines[index].match(/^Lời giải\s*:\s*(.*)$/iu);
    if (solution) {
      collecting = true;
      if (solution[1].trim()) solutions.get(current)!.push(solution[1].trim());
    } else if (collecting && lines[index].trim()) {
      solutions.get(current)!.push(lines[index]);
    }
  }
  return solutions;
};

const collectGeographyRaws = (lines: string[], start: number, end: number, maxNumber: number) => {
  const raws: GeographyRaw[] = [];
  let current: GeographyRaw | undefined;
  for (let index = start; index < end; index += 1) {
    const match = lines[index].match(geographyQuestionStart);
    if (match && Number(match[1]) >= 1 && Number(match[1]) <= maxNumber) {
      current = { number: Number(match[1]), head: match[2].trim(), lines: [] };
      raws.push(current);
    } else if (current) {
      current.lines.push(lines[index]);
    }
  }
  return raws;
};

/** Parse the 2026 Geography graduation layout: 18 A–D + 4 true/false groups + 6 short answers. */
export function parseGeographyLines(lines: string[], profileId = 'geography-thpt-v1'): ParsedDocument {
  const normalized = normalizeGeographyLines(lines);
  const answerMarker = normalized.findIndex((line) => /^ĐÁP ÁN THAM KHẢO$/iu.test(line));
  const solutionMarker = normalized.findIndex((line) => /^LỜI GIẢI THAM KHẢO$/iu.test(line));
  const endOfQuestions = answerMarker >= 0 ? answerMarker : solutionMarker >= 0 ? solutionMarker : normalized.length;
  const questionLines = normalized.slice(0, endOfQuestions);
  const partTwoIndex = questionLines.findIndex((line) => /^PHẦN II\s*:/iu.test(line));
  const partThreeIndex = questionLines.findIndex((line) => /^PHẦN III\s*:/iu.test(line));
  const partOneEnd = partTwoIndex >= 0 ? partTwoIndex : questionLines.length;
  const partTwoEnd = partThreeIndex >= 0 ? partThreeIndex : questionLines.length;
  const answerEnd = solutionMarker >= 0 ? solutionMarker : normalized.length;
  const answerMap = answerMarker >= 0 ? geographyLetterAnswers(normalized, answerMarker, answerEnd) : new Map<number, string>();
  const trueFalseMap = answerMarker >= 0 ? geographyTrueFalseAnswers(normalized, answerMarker, answerEnd) : new Map<number, boolean[]>();
  const shortMap = answerMarker >= 0 ? geographyShortAnswers(normalized, answerMarker, answerEnd) : new Map<number, string>();
  const solutionPartOneIndex = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^PHẦN I(?:\.|\s*$)/iu.test(line)) : -1;
  const solutionPartTwoIndex = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^PHẦN II(?:\.|\s*$)/iu.test(line)) : -1;
  const solutionPartThreeIndex = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^PHẦN III(?:\.|\s*$)/iu.test(line)) : -1;
  const partOneSolutions = solutionMarker >= 0 ? geographySolutions(normalized, solutionPartOneIndex >= 0 ? solutionPartOneIndex + 1 : solutionMarker + 1, solutionPartTwoIndex >= 0 ? solutionPartTwoIndex : normalized.length, 18) : new Map<number, string[]>();
  const partTwoSolutions = solutionMarker >= 0 ? geographySolutions(normalized, solutionPartTwoIndex >= 0 ? solutionPartTwoIndex + 1 : solutionMarker + 1, solutionPartThreeIndex >= 0 ? solutionPartThreeIndex : normalized.length, 4) : new Map<number, string[]>();
  const partThreeSolutions = solutionMarker >= 0 ? geographySolutions(normalized, solutionPartThreeIndex >= 0 ? solutionPartThreeIndex + 1 : solutionMarker + 1, normalized.length, 6) : new Map<number, string[]>();
  const profile = getSubjectProfile(profileId);
  const sections: QuizSection[] = profile.sections.map((section) => ({ id: section.id, title: section.title, instruction: section.instruction, questionIds: [] }));
  const questions: Question[] = [];
  const groups: QuestionGroup[] = [];
  const warnings: ImportWarning[] = [];

  for (const raw of collectGeographyRaws(questionLines, 0, partOneEnd, 18)) {
    const { stem, choices } = splitHistoryChoices([raw.head, ...raw.lines]);
    const answer = answerMap.get(raw.number);
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'single-choice', stem: stem.flatMap(parseGeographyTextToBlocks),
      choices: choices.map((choice) => ({ id: uid('c'), label: choice.label, content: parseGeographyTextToBlocks(choice.text), isCorrect: answer ? choice.label === answer : null })),
      attachments: [], confidence: answer ? 'high' : 'medium', warnings: [], sectionId: 'part-i',
      solution: partOneSolutions.get(raw.number)?.map((text) => ({ id: uid('s'), content: parseGeographyTextToBlocks(text) })),
    };
    if (!answer) question.warnings.push('Chưa nhận dạng được đáp án Phần I từ bảng đáp án.');
    if (choices.length !== 4) question.warnings.push('Chưa tách đủ 4 phương án A–D; cần đối chiếu lại định dạng Word.');
    questions.push(question);
    sections.find((section) => section.id === 'part-i')?.questionIds.push(question.id);
  }

  for (const raw of collectGeographyRaws(questionLines, partTwoIndex >= 0 ? partTwoIndex : questionLines.length, partTwoEnd, 4)) {
    const statements: { label: string; text: string }[] = [];
    const stimulus: string[] = [];
    for (const line of raw.lines) {
      const statement = line.match(geographyStatementStart);
      if (statement) statements.push({ label: statement[1].toLowerCase(), text: statement[2].trim() });
      else if (statements.length) statements.at(-1)!.text += ` ${line}`;
      else stimulus.push(line);
    }
    const answerValues = trueFalseMap.get(raw.number) || [];
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'true-false', stem: [],
      statements: statements.map((statement, index) => ({ id: uid('statement'), label: statement.label, content: parseGeographyTextToBlocks(statement.text), correctValue: answerValues[index] })),
      attachments: [], confidence: answerValues.length === 4 ? 'high' : 'medium', warnings: [], sectionId: 'part-ii',
      solution: partTwoSolutions.get(raw.number)?.map((text) => ({ id: uid('s'), content: parseGeographyTextToBlocks(text) })),
    };
    if (answerValues.length !== 4) question.warnings.push('Chưa nhận dạng đủ đáp án Đúng/Sai từ bảng đáp án.');
    if (statements.length !== 4) question.warnings.push('Câu chùm chưa đủ 4 mệnh đề a), b), c), d); cần đối chiếu lại.');
    const groupId = uid('group');
    groups.push({ id: groupId, title: `Câu ${raw.number} · Dữ kiện chung`, instruction: 'Đọc dữ kiện/biểu đồ và chọn Đúng hoặc Sai cho từng ý.', stimulus: [raw.head, ...stimulus].flatMap(parseGeographyTextToBlocks), questionIds: [question.id], kind: 'geography-data' });
    question.groupId = groupId;
    questions.push(question);
    sections.find((section) => section.id === 'part-ii')?.questionIds.push(question.id);
  }

  for (const raw of collectGeographyRaws(questionLines, partThreeIndex >= 0 ? partThreeIndex : questionLines.length, questionLines.length, 6)) {
    const answer = shortMap.get(raw.number);
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'short-answer', stem: [raw.head, ...raw.lines].flatMap(parseGeographyTextToBlocks),
      shortAnswer: { acceptedAnswers: answer ? [answer] : [], caseSensitive: false }, attachments: [], confidence: answer ? 'high' : 'medium', warnings: [], sectionId: 'part-iii',
      solution: partThreeSolutions.get(raw.number)?.map((text) => ({ id: uid('s'), content: parseGeographyTextToBlocks(text) })),
    };
    if (!answer) question.warnings.push('Chưa nhận dạng được đáp án ngắn từ bảng đáp án.');
    questions.push(question);
    sections.find((section) => section.id === 'part-iii')?.questionIds.push(question.id);
  }

  if (!questions.length) warnings.push({ id: uid('w'), type: 'parser', message: 'Không tìm thấy cấu trúc đề tốt nghiệp Địa lý: 18 câu A–D, 4 câu Đúng/Sai và 6 câu trả lời ngắn.' });
  return { questions, warnings, sections, groups };
}

export function parseGeographyStructuredHtml(html: string, profileId = 'geography-thpt-v1'): ParsedDocument {
  return parseGeographyLines(geographyLinesFromHtml(html), profileId);
}

type PhysicsRaw = { number: number; head: string; lines: string[] };
type PhysicsSharedRaw = { start: number; end: number; head: string; lines: string[] };
const physicsQuestionStart = /^Câu\s*0*(\d+)\s*[.:)]\s*(.*)$/iu;
const physicsStatementStart = /^([a-d])\s*[.)]\s+(.+)$/iu;

const physicsLinesFromHtml = (html: string) => {
  const doc = new DOMParser().parseFromString(html, 'text/html');
  const inlineText = (element: Element) => {
    const visit = (node: Node): string => {
      if (node.nodeType === Node.TEXT_NODE) return node.textContent || '';
      if (node.nodeType !== Node.ELEMENT_NODE) return '';
      const childText = [...node.childNodes].map(visit).join('');
      return (node as Element).tagName.toLowerCase() === 'br' ? `${childText}\n` : childText;
    };
    return visit(element).split('\n').map((line) => line.replace(/\s+/gu, ' ').trim()).join('\n').trim();
  };
  for (const img of [...doc.body.querySelectorAll('img')]) {
    const src = img.getAttribute('src') || '';
    // Mammoth exposes the MathType/OLE previews as image/x-wmf. They are
    // restored from the inspector as converted PNGs; only keep real figures
    // here so a formula preview cannot become a giant broken image in a slide.
    if (/^data:image\/(?:png|jpe?g|gif|svg\+xml|webp);/iu.test(src)) {
      img.replaceWith(doc.createTextNode(` ![${img.getAttribute('alt') || 'hình minh họa'}](${src}) `));
    } else img.remove();
  }
  for (const table of [...doc.body.querySelectorAll('table')]) {
    const rows = [...table.querySelectorAll('tr')].map((row) => [...row.children].map((cell) => cell.textContent?.replace(/\s+/gu, ' ').trim() || ''));
    const marker = doc.createElement('p');
    marker.textContent = `[[PHYSTABLE:${encodeURIComponent(JSON.stringify(rows))}]]`;
    table.replaceWith(marker);
  }
  const lines = [...doc.body.querySelectorAll('p,li,h1,h2,h3')]
    .flatMap((element) => inlineText(element).split(/\n+/u).map((line) => line.trim()).filter(Boolean));
  // Some biology questions place a figure before the “Câu n.” text in the
  // same Word paragraph. Move that figure token after the header so the
  // structural splitter can still identify the question without losing it.
  return lines.flatMap((line) => {
    const questionIndex = line.search(/Câu\s*0*\d+\s*[.:)]/iu);
    if (questionIndex <= 0) return [line];
    const prefix = line.slice(0, questionIndex).trim();
    if (!/^((?:!\[[^\]]*\]\(data:image\/[^)]+\))\s*)+$/iu.test(prefix)) return [line];
    return [line.slice(questionIndex).trim(), prefix];
  });
};

const parsePhysicsTextToBlocks = (text: string): ContentBlock[] => {
  const blocks: ContentBlock[] = [];
  const token = /!\[([^\]]*)\]\((data:image\/(?:png|jpe?g|gif|svg\+xml|webp);[^)]+)\)|\[\[PHYSTABLE:([^\]]+)\]\]/giu;
  let lastIndex = 0;
  let match: RegExpExecArray | null;
  while ((match = token.exec(text)) !== null) {
    const before = text.slice(lastIndex, match.index).trim();
    if (before) blocks.push(paragraph(before));
    if (match[3]) {
      try {
        const rows = JSON.parse(decodeURIComponent(match[3])) as string[][];
        if (rows.length) blocks.push({ id: uid('table'), kind: 'table', rows });
      } catch {
        blocks.push(paragraph('[Không đọc được bảng số liệu]'));
      }
    } else {
      blocks.push({ id: uid('physics-img'), kind: 'image', src: match[2], name: match[1] || 'hinh-vat-ly', alt: match[1] || 'Hình minh họa Vật lý', width: 68, align: 'center' });
    }
    lastIndex = token.lastIndex;
  }
  const trailing = text.slice(lastIndex).trim();
  if (trailing) blocks.push(paragraph(trailing));
  return blocks.length ? blocks : [paragraph(text)];
};

const normalizePhysicsLines = (lines: string[]) => lines
  .map((line) => line.replace(/\s+/gu, ' ').trim())
  .filter(Boolean)
  .filter((line) => !examEndFurniture.test(line));

const physicsTableRows = (line: string): string[][] | undefined => {
  const match = line.match(/^\[\[PHYSTABLE:([^\]]+)\]\]$/u);
  if (!match) return undefined;
  try {
    return JSON.parse(decodeURIComponent(match[1])) as string[][];
  } catch {
    return undefined;
  }
};

const physicsLetterAnswers = (lines: string[], start: number, end: number) => {
  const answers = new Map<number, string>();
  for (let index = start; index < end; index += 1) {
    const rows = physicsTableRows(lines[index]);
    if (rows) {
      for (let rowIndex = 0; rowIndex + 1 < rows.length; rowIndex += 1) {
        const numberRow = rows[rowIndex];
        const answerRow = rows[rowIndex + 1];
        if (numberRow[0] !== 'Câu' || !/^(?:ĐA|Đáp án)$/iu.test(answerRow[0] || '')) continue;
        numberRow.slice(1).forEach((number, valueIndex) => {
          const value = answerRow[valueIndex + 1];
          if (/^\d{1,2}$/u.test(number) && /^[A-D]$/iu.test(value || '')) answers.set(Number(number), value.toUpperCase());
        });
      }
    }
  }
  return answers;
};

const physicsTrueFalseAnswers = (lines: string[], start: number, end: number) => {
  const answers = new Map<number, boolean[]>();
  for (let index = start; index < end; index += 1) {
    const rows = physicsTableRows(lines[index]);
    if (!rows) continue;
    rows.slice(1).forEach((row) => {
      const match = row[0]?.match(/^(?:Câu\s*)?([1-4])$/iu);
      const values = row.slice(1).filter((value) => /^(?:Đúng|Sai)$/iu.test(value)).map((value) => /^Đúng$/iu.test(value));
      if (match && values.length === 4) answers.set(Number(match[1]), values);
    });
  }
  return answers;
};

const physicsShortAnswers = (lines: string[], start: number, end: number) => {
  const answers = new Map<number, string>();
  for (let index = start; index < end; index += 1) {
    const rows = physicsTableRows(lines[index]);
    if (!rows) continue;
    rows.slice(1).forEach((row) => {
      const match = row[0]?.match(/^(?:Câu\s*)?([1-6])$/iu);
      if (match && row[1]) answers.set(Number(match[1]), row[1].trim());
    });
  }
  return answers;
};

const physicsSolutions = (lines: string[], start: number, end: number, maxNumber: number) => {
  const solutions = new Map<number, string[]>();
  let current: number | undefined;
  for (let index = start; index < end; index += 1) {
    const match = lines[index].match(/^Câu\s*0*(\d+)\s*[.:)]?\s*(.*)$/iu);
    if (match && Number(match[1]) >= 1 && Number(match[1]) <= maxNumber) {
      current = Number(match[1]);
      solutions.set(current, []);
      if (match[2].trim()) solutions.get(current)!.push(match[2].trim());
      continue;
    }
    if (current !== undefined && lines[index].trim()) solutions.get(current)!.push(lines[index]);
  }
  return solutions;
};

const collectPhysicsRaws = (lines: string[], start: number, end: number, maxNumber: number) => {
  const raws: PhysicsRaw[] = [];
  let current: PhysicsRaw | undefined;
  for (let index = start; index < end; index += 1) {
    const match = lines[index].match(physicsQuestionStart);
    if (match && Number(match[1]) >= 1 && Number(match[1]) <= maxNumber) {
      current = { number: Number(match[1]), head: match[2].trim(), lines: [] };
      raws.push(current);
    } else if (current) current.lines.push(lines[index]);
  }
  return raws;
};

const collectPhysicsPartThree = (lines: string[], start: number, end: number) => {
  const raws: PhysicsRaw[] = [];
  const contexts: PhysicsSharedRaw[] = [];
  let currentRaw: PhysicsRaw | undefined;
  let currentContext: PhysicsSharedRaw | undefined;
  for (let index = start; index < end; index += 1) {
    const context = lines[index].match(/^Nội dung câu\s+(\d+)\s+và\s+(\d+)\s*:?\s*(.*)$/iu);
    if (context) {
      currentRaw = undefined;
      currentContext = { start: Number(context[1]), end: Number(context[2]), head: context[3].trim(), lines: [] };
      contexts.push(currentContext);
      continue;
    }
    const question = lines[index].match(physicsQuestionStart);
    if (question && Number(question[1]) >= 1 && Number(question[1]) <= 6) {
      currentRaw = { number: Number(question[1]), head: question[2].trim(), lines: [] };
      raws.push(currentRaw);
      continue;
    }
    if (currentRaw) currentRaw.lines.push(lines[index]);
    else if (currentContext) currentContext.lines.push(lines[index]);
  }
  return { raws, contexts };
};

/** Parse the 2026 Physics graduation layout: 18 A–D + 4 true/false groups + 6 short answers. */
export function parsePhysicsLines(lines: string[], profileId = 'physics-thpt-v1', splitChoices = splitHistoryChoices): ParsedDocument {
  const normalized = normalizePhysicsLines(lines);
  const answerMarker = normalized.findIndex((line) => /^ĐÁP ÁN THAM KHẢO$/iu.test(line));
  const solutionMarker = normalized.findIndex((line) => /^LỜI GIẢI THAM KHẢO$/iu.test(line));
  const endOfQuestions = answerMarker >= 0 ? answerMarker : solutionMarker >= 0 ? solutionMarker : normalized.length;
  const questionLines = normalized.slice(0, endOfQuestions);
  const partTwoIndex = questionLines.findIndex((line) => /^PHẦN II\s*:/iu.test(line));
  const partThreeIndex = questionLines.findIndex((line) => /^PHẦN III\s*:/iu.test(line));
  const partOneEnd = partTwoIndex >= 0 ? partTwoIndex : questionLines.length;
  const partTwoEnd = partThreeIndex >= 0 ? partThreeIndex : questionLines.length;
  const answerEnd = solutionMarker >= 0 ? solutionMarker : normalized.length;
  const answerMap = answerMarker >= 0 ? physicsLetterAnswers(normalized, answerMarker, answerEnd) : new Map<number, string>();
  const trueFalseMap = answerMarker >= 0 ? physicsTrueFalseAnswers(normalized, answerMarker, answerEnd) : new Map<number, boolean[]>();
  const shortMap = answerMarker >= 0 ? physicsShortAnswers(normalized, answerMarker, answerEnd) : new Map<number, string>();
  const solutionPartOneIndex = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^PHẦN I(?:\.|\s)/iu.test(line)) : -1;
  const solutionPartTwoIndex = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^PHẦN II(?:\.|\s)/iu.test(line)) : -1;
  const solutionPartThreeIndex = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^PHẦN III(?:\.|\s)/iu.test(line)) : -1;
  const partOneSolutions = solutionMarker >= 0 ? physicsSolutions(normalized, solutionPartOneIndex >= 0 ? solutionPartOneIndex + 1 : solutionMarker + 1, solutionPartTwoIndex >= 0 ? solutionPartTwoIndex : normalized.length, 18) : new Map<number, string[]>();
  const partTwoSolutions = solutionMarker >= 0 ? physicsSolutions(normalized, solutionPartTwoIndex >= 0 ? solutionPartTwoIndex + 1 : solutionMarker + 1, solutionPartThreeIndex >= 0 ? solutionPartThreeIndex : normalized.length, 4) : new Map<number, string[]>();
  const partThreeSolutions = solutionMarker >= 0 ? physicsSolutions(normalized, solutionPartThreeIndex >= 0 ? solutionPartThreeIndex + 1 : solutionMarker + 1, normalized.length, 6) : new Map<number, string[]>();
  const partThreeData = collectPhysicsPartThree(questionLines, partThreeIndex >= 0 ? partThreeIndex : questionLines.length, questionLines.length);
  const profile = getSubjectProfile(profileId);
  const sections: QuizSection[] = profile.sections.map((section) => ({ id: section.id, title: section.title, instruction: section.instruction, questionIds: [] }));
  const questions: Question[] = [];
  const groups: QuestionGroup[] = [];
  const warnings: ImportWarning[] = [];

  for (const raw of collectPhysicsRaws(questionLines, 0, partOneEnd, 18)) {
    const { stem, choices } = splitChoices([raw.head, ...raw.lines]);
    const answer = answerMap.get(raw.number);
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'single-choice', stem: stem.flatMap(parsePhysicsTextToBlocks),
      choices: choices.map((choice) => ({ id: uid('c'), label: choice.label, content: parsePhysicsTextToBlocks(choice.text), isCorrect: answer ? choice.label === answer : null })),
      attachments: [], confidence: answer ? 'high' : 'medium', warnings: [], sectionId: 'part-i',
      solution: partOneSolutions.get(raw.number)?.map((text) => ({ id: uid('s'), content: parsePhysicsTextToBlocks(text) })),
    };
    if (!answer) question.warnings.push('Chưa nhận dạng được đáp án Phần I từ bảng đáp án.');
    if (choices.length !== 4) question.warnings.push('Chưa tách đủ 4 phương án A–D; cần đối chiếu lại định dạng Word.');
    questions.push(question);
    sections.find((section) => section.id === 'part-i')?.questionIds.push(question.id);
  }

  for (const raw of collectPhysicsRaws(questionLines, partTwoIndex >= 0 ? partTwoIndex : questionLines.length, partTwoEnd, 4)) {
    const statements: { label: string; text: string }[] = [];
    const stimulus: string[] = [];
    for (const line of raw.lines) {
      const statement = line.match(physicsStatementStart);
      if (statement) statements.push({ label: statement[1].toLowerCase(), text: statement[2].trim() });
      else if (statements.length) statements.at(-1)!.text += ` ${line}`;
      else stimulus.push(line);
    }
    const answerValues = trueFalseMap.get(raw.number) || [];
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'true-false', stem: [],
      statements: statements.map((statement, index) => ({ id: uid('statement'), label: statement.label, content: parsePhysicsTextToBlocks(statement.text), correctValue: answerValues[index] })),
      attachments: [], confidence: answerValues.length === 4 ? 'high' : 'medium', warnings: [], sectionId: 'part-ii',
      solution: partTwoSolutions.get(raw.number)?.map((text) => ({ id: uid('s'), content: parsePhysicsTextToBlocks(text) })),
    };
    if (answerValues.length !== 4) question.warnings.push('Chưa nhận dạng đủ đáp án Đúng/Sai từ bảng đáp án.');
    if (statements.length !== 4) question.warnings.push('Câu chùm chưa đủ 4 mệnh đề a), b), c), d); cần đối chiếu lại.');
    const groupId = uid('group');
    groups.push({ id: groupId, title: `Câu ${raw.number} · Dữ kiện Vật lý`, instruction: 'Đọc dữ kiện/hình minh họa và chọn Đúng hoặc Sai cho từng ý.', stimulus: [raw.head, ...stimulus].flatMap(parsePhysicsTextToBlocks), questionIds: [question.id], kind: 'physics-data' });
    question.groupId = groupId;
    questions.push(question);
    sections.find((section) => section.id === 'part-ii')?.questionIds.push(question.id);
  }

  const groupByContext = new Map<string, QuestionGroup>();
  for (const raw of partThreeData.raws) {
    const answer = shortMap.get(raw.number);
    const context = partThreeData.contexts.find((item) => raw.number >= item.start && raw.number <= item.end);
    const contextKey = context ? `${context.start}-${context.end}` : `question-${raw.number}`;
    let group = groupByContext.get(contextKey);
    if (!group) {
      group = { id: uid('group'), title: context ? `Nội dung câu ${context.start} và ${context.end}` : `Câu ${raw.number} · Dữ kiện Vật lý`, instruction: 'Dùng dữ kiện chung để tính toán và ghi đáp án theo yêu cầu.', stimulus: context ? [context.head, ...context.lines].flatMap(parsePhysicsTextToBlocks) : [], questionIds: [], kind: 'physics-calculation' };
      groupByContext.set(contextKey, group);
      groups.push(group);
    }
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'short-answer', stem: [raw.head, ...raw.lines].flatMap(parsePhysicsTextToBlocks),
      shortAnswer: { acceptedAnswers: answer ? [answer] : [], caseSensitive: false }, attachments: [], confidence: answer ? 'high' : 'medium', warnings: [], sectionId: 'part-iii', groupId: group.id,
      solution: partThreeSolutions.get(raw.number)?.map((text) => ({ id: uid('s'), content: parsePhysicsTextToBlocks(text) })),
    };
    if (!answer) question.warnings.push('Chưa nhận dạng được đáp án ngắn từ bảng đáp án.');
    questions.push(question);
    group.questionIds.push(question.id);
    sections.find((section) => section.id === 'part-iii')?.questionIds.push(question.id);
  }

  if (!questions.length) warnings.push({ id: uid('w'), type: 'parser', message: 'Không tìm thấy cấu trúc đề tốt nghiệp Vật lý: 18 câu A–D, 4 câu Đúng/Sai và 6 câu trả lời ngắn.' });
  return { questions, warnings, sections, groups };
}

export function parsePhysicsStructuredHtml(html: string, profileId = 'physics-thpt-v1'): ParsedDocument {
  return parsePhysicsLines(physicsLinesFromHtml(html), profileId);
}

/**
 * Biology's 2026 graduation paper uses the same three-part answer model as
 * the physics/geography papers, but its shared data are biological diagrams,
 * food webs and genetics tables. Reuse the proven structural splitter and
 * retag the output so the biology profile stays isolated from Physics.
 */
export function parseBiologyStructuredHtml(html: string, profileId = 'biology-thpt-v1'): ParsedDocument {
  const parsed = parsePhysicsLines(physicsLinesFromHtml(html), profileId, splitBiologyChoices);
  const retagBlocks = (blocks: ContentBlock[]) => blocks.map((block) => block.kind === 'image'
    ? { ...block, name: block.name === 'hinh-vat-ly' ? 'hinh-sinh-hoc' : block.name, alt: block.alt === 'Hình minh họa Vật lý' ? 'Hình minh họa Sinh học' : block.alt }
    : block);
  parsed.questions.forEach((question) => {
    question.stem = retagBlocks(question.stem);
    question.choices?.forEach((choice) => { choice.content = retagBlocks(choice.content); });
    question.statements?.forEach((statement) => { statement.content = retagBlocks(statement.content); });
    question.solution?.forEach((step) => { step.content = retagBlocks(step.content); });
  });
  parsed.groups = (parsed.groups || [])
    .filter((group) => !(group.kind === 'physics-calculation' && !group.stimulus.length))
    .map((group) => ({
      ...group,
      title: group.kind === 'physics-data' ? group.title.replace('Dữ kiện Vật lý', 'Dữ kiện Sinh học') : group.title,
      instruction: group.kind === 'physics-data' ? 'Đọc dữ kiện/hình/bảng Sinh học và chọn Đúng hoặc Sai cho từng ý.' : group.instruction,
      kind: group.kind === 'physics-data' ? 'biology-data' : group.kind,
      stimulus: retagBlocks(group.stimulus),
    }));
  const retainedGroupIds = new Set(parsed.groups.map((group) => group.id));
  parsed.questions.forEach((question) => {
    if (question.groupId && !retainedGroupIds.has(question.groupId)) delete question.groupId;
  });
  return parsed;
}

type GdqpRaw = { number: number; head: string; lines: string[] };
const gdqpQuestionStart = /^Câu\s*0*(\d+)\s*[.:)]\s*(.*)$/iu;

/**
 * Keep the GDQP outline's answer table as one lossless token.  The source is
 * an outline rather than an official exam, so the two essay topics must stay
 * as essay prompts and must never be inferred as a question group.
 */
const gdqpLinesFromHtml = (html: string) => {
  const doc = new DOMParser().parseFromString(html, 'text/html');
  const inlineText = (element: Element) => {
    const visit = (node: Node): string => {
      if (node.nodeType === Node.TEXT_NODE) return node.textContent || '';
      if (node.nodeType !== Node.ELEMENT_NODE) return '';
      const childText = [...node.childNodes].map(visit).join('');
      return (node as Element).tagName.toLowerCase() === 'br' ? `${childText}\n` : childText;
    };
    return visit(element).split('\n').map((line) => line.replace(/\s+/gu, ' ').trim()).join('\n').trim();
  };
  for (const img of [...doc.body.querySelectorAll('img')]) {
    const src = img.getAttribute('src') || '';
    if (/^data:image\/(?:png|jpe?g|gif|svg\+xml|webp);/iu.test(src)) img.replaceWith(doc.createTextNode(` ![${img.getAttribute('alt') || 'hình minh họa'}](${src}) `));
    else img.remove();
  }
  for (const table of [...doc.body.querySelectorAll('table')]) {
    const rows = [...table.querySelectorAll('tr')].map((row) => [...row.children].map((cell) => cell.textContent?.replace(/\s+/gu, ' ').trim() || ''));
    const marker = doc.createElement('p');
    marker.textContent = `[[GDQPTABLE:${encodeURIComponent(JSON.stringify(rows))}]]`;
    table.replaceWith(marker);
  }
  return [...doc.body.querySelectorAll('p,li,h1,h2,h3')]
    .flatMap((element) => inlineText(element).split(/\n+/u).map((line) => line.trim()).filter(Boolean));
};

const parseGdqpTextToBlocks = (text: string): ContentBlock[] => {
  const blocks: ContentBlock[] = [];
  const token = /!\[([^\]]*)\]\((data:image\/(?:png|jpe?g|gif|svg\+xml|webp);[^)]+)\)|\[\[GDQPTABLE:([^\]]+)\]\]/giu;
  let lastIndex = 0;
  let match: RegExpExecArray | null;
  while ((match = token.exec(text)) !== null) {
    const before = text.slice(lastIndex, match.index).trim();
    if (before) blocks.push(paragraph(before));
    if (match[3]) {
      try {
        const rows = JSON.parse(decodeURIComponent(match[3])) as string[][];
        if (rows.length) blocks.push({ id: uid('table'), kind: 'table', rows });
      } catch {
        blocks.push(paragraph('[Không đọc được bảng đáp án]'));
      }
    } else {
      blocks.push({ id: uid('gdqp-img'), kind: 'image', src: match[2], name: match[1] || 'hinh-gdqp', alt: match[1] || 'Hình minh họa GDQP', width: 68, align: 'center' });
    }
    lastIndex = token.lastIndex;
  }
  const trailing = text.slice(lastIndex).trim();
  if (trailing) blocks.push(paragraph(trailing));
  return blocks.length ? blocks : [paragraph(text)];
};

const normalizeGdqpLines = (lines: string[]) => lines
  .map((line) => line.replace(/\s+/gu, ' ').trim())
  .filter(Boolean)
  .filter((line) => !examEndFurniture.test(line));

const gdqpTableRows = (line: string): string[][] | undefined => {
  const match = line.match(/^\[\[GDQPTABLE:([^\]]+)\]\]$/u);
  if (!match) return undefined;
  try {
    return JSON.parse(decodeURIComponent(match[1])) as string[][];
  } catch {
    return undefined;
  }
};

const gdqpAnswerMap = (lines: string[], start: number, end: number) => {
  const answers = new Map<number, string>();
  for (let index = start; index < end; index += 1) {
    const rows = gdqpTableRows(lines[index]);
    if (!rows) continue;
    for (let rowIndex = 0; rowIndex + 1 < rows.length; rowIndex += 2) {
      const numberRow = rows[rowIndex];
      const answerRow = rows[rowIndex + 1];
      numberRow.forEach((number, valueIndex) => {
        const value = answerRow[valueIndex];
        if (/^\d{1,2}$/u.test(number) && /^[A-D]$/iu.test(value || '')) answers.set(Number(number), value.toUpperCase());
      });
    }
  }
  return answers;
};

/** Parse the supplied GDQP 10 review outline: 30 A–D questions + 2 essay topics. */
export function parseGdqpLines(lines: string[], profileId = 'gdqp-10-v1'): ParsedDocument {
  const normalized = normalizeGdqpLines(lines);
  const answerMarker = normalized.findIndex((line) => /^ĐÁP ÁN$/iu.test(line));
  const endOfQuestions = answerMarker >= 0 ? answerMarker : normalized.length;
  const questionLines = normalized.slice(0, endOfQuestions);
  const mcqStart = questionLines.findIndex((line) => /^A\.\s*TRẮC NGHIỆM\.?$/iu.test(line));
  const essayStart = questionLines.findIndex((line) => /^B\.\s*TỰ LUẬN\.?$/iu.test(line));
  const questionStart = mcqStart >= 0 ? mcqStart + 1 : 0;
  const questionEnd = essayStart >= 0 ? essayStart : questionLines.length;
  const answerMap = answerMarker >= 0 ? gdqpAnswerMap(normalized, answerMarker + 1, normalized.length) : new Map<number, string>();
  const profile = getSubjectProfile(profileId);
  const sections: QuizSection[] = profile.sections.map((section) => ({ id: section.id, title: section.title, instruction: section.instruction, questionIds: [] }));
  const questions: Question[] = [];
  const warnings: ImportWarning[] = [];
  const raws: GdqpRaw[] = [];
  let current: GdqpRaw | undefined;
  for (let index = questionStart; index < questionEnd; index += 1) {
    const match = questionLines[index].match(gdqpQuestionStart);
    if (match && Number(match[1]) >= 1 && Number(match[1]) <= 30) {
      current = { number: Number(match[1]), head: match[2].trim(), lines: [] };
      raws.push(current);
    } else if (current) current.lines.push(questionLines[index]);
  }

  for (const raw of raws) {
    const { stem, choices } = splitHistoryChoices([raw.head, ...raw.lines]);
    const answer = answerMap.get(raw.number);
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'single-choice', stem: stem.flatMap(parseGdqpTextToBlocks),
      choices: choices.map((choice) => ({ id: uid('c'), label: choice.label, content: parseGdqpTextToBlocks(choice.text), isCorrect: answer ? choice.label === answer : null })),
      attachments: [], confidence: answer ? 'high' : 'medium', warnings: [], sectionId: 'mcq',
    };
    if (!answer) question.warnings.push('Chưa nhận dạng được đáp án từ bảng đáp án GDQP.');
    if (choices.length !== 4) question.warnings.push('Chưa tách đủ 4 phương án A–D; cần đối chiếu lại định dạng Word.');
    questions.push(question);
    sections.find((section) => section.id === 'mcq')?.questionIds.push(question.id);
  }

  const essayLines = essayStart >= 0 ? questionLines.slice(essayStart + 1) : [];
  const essayPrompts = essayLines.filter((line) => /^[-–—•]\s*/u.test(line)).map((line) => line.replace(/^[-–—•]\s*/u, '').trim()).filter(Boolean);
  essayPrompts.forEach((prompt, index) => {
    const question: Question = {
      id: uid('q'), number: index + 1, type: 'essay', stem: parseGdqpTextToBlocks(prompt), attachments: [], confidence: 'high', warnings: [], sectionId: 'essay', format: 'Tự luận',
    };
    questions.push(question);
    sections.find((section) => section.id === 'essay')?.questionIds.push(question.id);
  });

  if (raws.length !== 30 || essayPrompts.length !== 2) warnings.push({ id: uid('w'), type: 'parser', message: `Cấu trúc GDQP 10 chưa đủ như file mẫu: nhận được ${raws.length} câu A–D và ${essayPrompts.length} chủ đề tự luận.` });
  return { questions, warnings, sections, groups: [] };
}

export function parseGdqpStructuredHtml(html: string, profileId = 'gdqp-10-v1'): ParsedDocument {
  return parseGdqpLines(gdqpLinesFromHtml(html), profileId);
}

type InformaticsRaw = { number: number; head: string; lines: string[] };
const informaticsQuestionStart = /^Câu\s*0*(\d+)\s*[.:)]?\s*(.*)$/iu;
const informaticsStatementStart = /^([a-d])\s*[.)]\s+(.+)$/iu;

/**
 * Tin học papers mix ordinary paragraphs with code tables and answer tables.
 * Keep every DOCX table as a lossless marker so code/data remain separate from
 * the question text and can be rendered as a real table in the editor/slide.
 */
const informaticsLinesFromHtml = (html: string) => {
  const doc = new DOMParser().parseFromString(html, 'text/html');
  const inlineText = (element: Element) => {
    const visit = (node: Node): string => {
      if (node.nodeType === Node.TEXT_NODE) return node.textContent || '';
      if (node.nodeType !== Node.ELEMENT_NODE) return '';
      const childText = [...node.childNodes].map(visit).join('');
      return (node as Element).tagName.toLowerCase() === 'br' ? `${childText}\n` : childText;
    };
    return visit(element).split('\n').map((line) => line.replace(/[ \t]+/gu, ' ').trim()).join('\n').trim();
  };
  const cellText = (element: Element) => {
    const visit = (node: Node): string => {
      if (node.nodeType === Node.TEXT_NODE) return node.textContent || '';
      if (node.nodeType !== Node.ELEMENT_NODE) return '';
      const childText = [...node.childNodes].map(visit).join('');
      return (node as Element).tagName.toLowerCase() === 'br' ? `${childText}\n` : childText;
    };
    return visit(element).replace(/\r/gu, '').trim();
  };

  for (const img of [...doc.body.querySelectorAll('img')]) {
    const src = img.getAttribute('src') || '';
    if (/^data:image\/(?:png|jpe?g|gif|svg\+xml|webp);/iu.test(src)) {
      img.replaceWith(doc.createTextNode(` ![${img.getAttribute('alt') || 'hình minh họa'}](${src}) `));
    } else img.remove();
  }
  for (const table of [...doc.body.querySelectorAll('table')]) {
    const rows = [...table.querySelectorAll('tr')].map((row) =>
      [...row.querySelectorAll(':scope > th, :scope > td')].map((cell) => cellText(cell))
    );
    const marker = doc.createElement('p');
    marker.textContent = `[[INFORMATICS_TABLE:${encodeURIComponent(JSON.stringify(rows))}]]`;
    table.replaceWith(marker);
  }
  return [...doc.body.querySelectorAll('p,li,h1,h2,h3')]
    .flatMap((element) => inlineText(element).split(/\n+/u).map((line) => line.trim()).filter(Boolean));
};

const escapeInformaticsText = (text: string) => text.replace(/</gu, '&#60;').replace(/>/gu, '&#62;');

const parseInformaticsTextToBlocks = (text: string): ContentBlock[] => {
  const blocks: ContentBlock[] = [];
  const token = /!\[([^\]]*)\]\((data:image\/(?:png|jpe?g|gif|svg\+xml|webp);[^)]+)\)|\[\[INFORMATICS_TABLE:([^\]]+)\]\]/giu;
  let lastIndex = 0;
  let match: RegExpExecArray | null;
  while ((match = token.exec(text)) !== null) {
    const before = text.slice(lastIndex, match.index).trim();
    if (before) blocks.push(paragraph(escapeInformaticsText(before)));
    if (match[3]) {
      try {
        const rows = JSON.parse(decodeURIComponent(match[3])) as string[][];
        if (rows.length) blocks.push({ id: uid('informatics-table'), kind: 'table', rows: rows.map((row) => row.map(escapeInformaticsText)) });
      } catch {
        blocks.push(paragraph('[Không đọc được bảng mã/dữ kiện Tin học]'));
      }
    } else {
      blocks.push({ id: uid('informatics-img'), kind: 'image', src: match[2], name: match[1] || 'hinh-tin-hoc', alt: match[1] || 'Hình minh họa Tin học', width: 76, align: 'center' });
    }
    lastIndex = token.lastIndex;
  }
  const trailing = text.slice(lastIndex).trim();
  if (trailing) blocks.push(paragraph(escapeInformaticsText(trailing)));
  return blocks.length ? blocks : [paragraph(escapeInformaticsText(text))];
};

const normalizeInformaticsLines = (lines: string[]) => lines
  .map((line) => line.replace(/\s+/gu, ' ').trim())
  .filter(Boolean)
  .filter((line) => !examEndFurniture.test(line))
  .filter((line) => !/^Cán bộ coi thi không giải thích gì thêm[;,.]?$/iu.test(line));

const informaticsTableRows = (line: string): string[][] | undefined => {
  const match = line.match(/^\[\[INFORMATICS_TABLE:([^\]]+)\]\]$/u);
  if (!match) return undefined;
  try {
    return JSON.parse(decodeURIComponent(match[1])) as string[][];
  } catch {
    return undefined;
  }
};

const informaticsAnswerMap = (lines: string[], start: number, end: number) => {
  const answers = new Map<number, string>();
  for (let index = start; index < end; index += 1) {
    const rows = informaticsTableRows(lines[index]);
    if (!rows || !/^Câu$/iu.test(rows[0]?.[0] || '') || !/^Đáp án$/iu.test(rows[0]?.[1] || '')) continue;
    rows.slice(1).forEach((row) => {
      for (let column = 0; column + 1 < row.length; column += 2) {
        const number = row[column]?.match(/^Câu\s*0*(\d+)$/iu)?.[1] || row[column];
        const answer = row[column + 1]?.trim();
        if (/^\d{1,2}$/u.test(number || '') && /^[A-D]$/iu.test(answer || '')) answers.set(Number(number), answer!.toUpperCase());
      }
    });
  }
  return answers;
};

const informaticsTrueFalseAnswers = (lines: string[], start: number, end: number) => {
  const answers = new Map<number, boolean[]>();
  for (let index = start; index < end; index += 1) {
    const rows = informaticsTableRows(lines[index]);
    if (!rows) continue;
    rows.slice(1).forEach((row) => {
      const number = row[0]?.match(/^Câu\s*0*(\d+)$/iu)?.[1];
      const values = (row.slice(1).join(' ').match(/Đúng|Sai/giu) || []).map((value) => /^Đúng$/iu.test(value));
      if (number && values.length === 4) answers.set(Number(number), values);
    });
  }
  return answers;
};

const collectInformaticsRaws = (lines: string[], start: number, end: number, minNumber: number, maxNumber: number) => {
  const raws: InformaticsRaw[] = [];
  let current: InformaticsRaw | undefined;
  for (let index = start; index < end; index += 1) {
    const match = lines[index].match(informaticsQuestionStart);
    const number = match ? Number(match[1]) : 0;
    if (match && number >= minNumber && number <= maxNumber) {
      current = { number, head: match[2].trim(), lines: [] };
      raws.push(current);
    } else if (current) current.lines.push(lines[index]);
  }
  return raws;
};

const informaticsSolutions = (lines: string[], start: number, end: number, maxNumber: number) => {
  const solutions = new Map<number, string[]>();
  let current: number | undefined;
  for (let index = start; index < end; index += 1) {
    const match = lines[index].match(informaticsQuestionStart);
    if (match && Number(match[1]) >= 1 && Number(match[1]) <= maxNumber) {
      current = Number(match[1]);
      solutions.set(current, []);
      if (match[2].trim()) solutions.get(current)!.push(match[2].trim());
      continue;
    }
    if (current !== undefined && lines[index].trim()) solutions.get(current)!.push(lines[index]);
  }
  return solutions;
};

/** Parse the Tin học graduation-style sample: 24 A–D + six true/false groups. */
export function parseInformaticsLines(lines: string[], profileId = 'informatics-thpt-v1'): ParsedDocument {
  const normalized = normalizeInformaticsLines(lines);
  const answerMarker = normalized.findIndex((line) => /^ĐÁP ÁN\s+THAM KHẢO$/iu.test(line));
  const solutionMarker = normalized.findIndex((line) => /^LỜI GIẢI\s+THAM KHẢO$/iu.test(line));
  const endOfQuestions = answerMarker >= 0 ? answerMarker : solutionMarker >= 0 ? solutionMarker : normalized.length;
  const questionLines = normalized.slice(0, endOfQuestions);
  const partTwoIndex = questionLines.findIndex((line) => /^PHẦN II\s*[.:]/iu.test(line));
  const partOneEnd = partTwoIndex >= 0 ? partTwoIndex : questionLines.length;
  const answerEnd = solutionMarker >= 0 ? solutionMarker : normalized.length;
  const answerMap = answerMarker >= 0 ? informaticsAnswerMap(normalized, answerMarker + 1, answerEnd) : new Map<number, string>();
  const trueFalseMap = answerMarker >= 0 ? informaticsTrueFalseAnswers(normalized, answerMarker + 1, answerEnd) : new Map<number, boolean[]>();
  const solutionPartOneIndex = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^PHẦN I(?:\.|\s)/iu.test(line)) : -1;
  const solutionPartTwoIndex = solutionMarker >= 0 ? normalized.findIndex((line, index) => index > solutionMarker && /^PHẦN II(?:\.|\s)/iu.test(line)) : -1;
  const partOneSolutions = solutionMarker >= 0 ? informaticsSolutions(normalized, solutionPartOneIndex >= 0 ? solutionPartOneIndex + 1 : solutionMarker + 1, solutionPartTwoIndex >= 0 ? solutionPartTwoIndex : normalized.length, 24) : new Map<number, string[]>();
  const partTwoSolutions = solutionMarker >= 0 ? informaticsSolutions(normalized, solutionPartTwoIndex >= 0 ? solutionPartTwoIndex + 1 : solutionMarker + 1, normalized.length, 6) : new Map<number, string[]>();
  const profile = getSubjectProfile(profileId);
  const sections: QuizSection[] = profile.sections.map((section) => ({ id: section.id, title: section.title, instruction: section.instruction, questionIds: [] }));
  const questions: Question[] = [];
  const groups: QuestionGroup[] = [];
  const warnings: ImportWarning[] = [];

  for (const raw of collectInformaticsRaws(questionLines, 0, partOneEnd, 1, 24)) {
    const { stem, choices } = splitHistoryChoices([raw.head, ...raw.lines]);
    const answer = answerMap.get(raw.number);
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'single-choice', stem: stem.flatMap(parseInformaticsTextToBlocks),
      choices: choices.map((choice) => ({ id: uid('c'), label: choice.label, content: parseInformaticsTextToBlocks(choice.text), isCorrect: answer ? choice.label === answer : null })),
      attachments: [], confidence: answer ? 'high' : 'medium', warnings: [], sectionId: 'part-i',
      solution: partOneSolutions.get(raw.number)?.map((text) => ({ id: uid('s'), content: parseInformaticsTextToBlocks(text) })),
    };
    if (!answer) question.warnings.push('Chưa nhận dạng được đáp án Phần I từ bảng đáp án Tin học.');
    if (choices.length !== 4) question.warnings.push('Chưa tách đủ 4 phương án A–D; cần đối chiếu lại định dạng Word.');
    questions.push(question);
    sections.find((section) => section.id === 'part-i')?.questionIds.push(question.id);
  }

  for (const raw of collectInformaticsRaws(questionLines, partTwoIndex >= 0 ? partTwoIndex : questionLines.length, questionLines.length, 1, 6)) {
    const statements: { label: string; text: string }[] = [];
    const stimulus: string[] = [];
    for (const line of [raw.head, ...raw.lines]) {
      const statement = line.match(informaticsStatementStart);
      if (statement) statements.push({ label: statement[1].toLowerCase(), text: statement[2].trim() });
      else if (statements.length) statements.at(-1)!.text += ` ${line}`;
      else stimulus.push(line);
    }
    const answerValues = trueFalseMap.get(raw.number) || [];
    const sectionId = raw.number <= 2 ? 'part-ii-common' : raw.number <= 4 ? 'part-ii-cs' : 'part-ii-app';
    const question: Question = {
      id: uid('q'), number: raw.number, type: 'true-false', stem: [],
      statements: statements.map((statement, index) => ({ id: uid('s'), label: statement.label, content: parseInformaticsTextToBlocks(statement.text), correctValue: answerValues[index] })),
      attachments: [], confidence: answerValues.length === 4 ? 'high' : 'medium', warnings: [], sectionId,
      solution: partTwoSolutions.get(raw.number)?.map((text) => ({ id: uid('s'), content: parseInformaticsTextToBlocks(text) })),
    };
    if (answerValues.length !== 4) question.warnings.push('Chưa nhận dạng đủ đáp án Đúng/Sai từ bảng đáp án Tin học.');
    if (statements.length !== 4) question.warnings.push('Câu chùm chưa đủ 4 mệnh đề a), b), c), d); cần đối chiếu lại.');
    const groupId = uid('group');
    groups.push({ id: groupId, title: `Câu ${raw.number} · Dữ kiện Tin học`, instruction: 'Đọc dữ kiện/mã/bảng chung và chọn Đúng hoặc Sai cho từng ý.', stimulus: stimulus.flatMap(parseInformaticsTextToBlocks), questionIds: [question.id], kind: 'informatics-data' });
    question.groupId = groupId;
    questions.push(question);
    sections.find((section) => section.id === sectionId)?.questionIds.push(question.id);
  }

  if (collectInformaticsRaws(questionLines, 0, partOneEnd, 1, 24).length !== 24 || collectInformaticsRaws(questionLines, partTwoIndex >= 0 ? partTwoIndex : questionLines.length, questionLines.length, 1, 6).length !== 6) {
    warnings.push({ id: uid('w'), type: 'parser', message: 'Cấu trúc Tin học chưa đủ như file mẫu: cần 24 câu A–D và 6 câu Đúng/Sai (2 câu chung + 4 câu theo định hướng).' });
  }
  return { questions, warnings, sections, groups };
}

export function parseInformaticsStructuredHtml(html: string, profileId = 'informatics-thpt-v1'): ParsedDocument {
  return parseInformaticsLines(informaticsLinesFromHtml(html), profileId);
}

export function parseLines(lines:string[]):ParsedDocument {
  const groups:{number:number;head:string;lines:string[]}[]=[];
  for(const line of lines.filter((item) => !examEndFurniture.test(item))){ const m=line.match(R.question); if(m) groups.push({number:Number(m[1]),head:m[2],lines:[]}); else if(groups.length) groups.at(-1)!.lines.push(line); }
  const warnings:ImportWarning[]=[];
  const questions=groups.map(g=>{
    const choiceRows:{label:string;text:string}[]=[]; const statementRows:{label:string;text:string}[]=[]; const body:string[]=[]; const solution:string[]=[];
    let answer=''; let inSolution=false;
    for(const line of g.lines){
      const ans=line.match(R.answer), sol=line.match(R.solution), choice=line.match(R.choice), statement=line.match(R.statement);
      if(ans){answer=ans[1].trim();continue} if(sol){inSolution=true;if(sol[1])solution.push(sol[1]);continue}
      if(inSolution){solution.push(line);continue}
      if(choice && choice[1]===choice[1].toUpperCase()) choiceRows.push({label:choice[1],text:choice[2]});
      else if(statement) statementRows.push({label:statement[1],text:statement[2]}); else body.push(line);
    }
    let type:QuestionType='short-answer';
    const lowerCaseChoices=statementRows.length>=2 && /^[A-Da-d]$/u.test(answer.trim());
    if(choiceRows.length>=2 || lowerCaseChoices) type='single-choice'; else if(statementRows.length>=2) type='true-false'; else if(solution.length) type='essay';
    const q:Question={id:uid('q'),number:g.number,type,stem:[...parseTextToBlocks(g.head),...body.flatMap(parseTextToBlocks)],attachments:[],confidence:'high',warnings:[]};
    if(type==='single-choice') q.choices=(choiceRows.length?choiceRows:statementRows.map(s=>({label:s.label.toUpperCase(),text:s.text}))).map(c=>({id:uid('c'),label:c.label,content:parseTextToBlocks(c.text),isCorrect:c.label===answer.trim().toUpperCase()}));
    if(type==='true-false'){const values=answer.toUpperCase().split(/[\s,;]+/);q.statements=statementRows.map((s,i)=>({id:uid('t'),label:s.label,content:parseTextToBlocks(s.text),correctValue:values[i]?values[i].startsWith('Đ'):undefined}));}
    if(type==='short-answer') q.shortAnswer={acceptedAnswers:answer?answer.split(/[;|]/).map(x=>x.trim()):[],caseSensitive:false};
    if(solution.length) q.solution=solution.map(x=>({id:uid('s'),content:parseTextToBlocks(x)}));
    if(!answer && type!=='essay'){q.confidence='medium';q.warnings.push('Chưa nhận dạng được đáp án.');}
    return q;
  });
  if(!questions.length) warnings.push({id:uid('w'),type:'parser',message:'Không tìm thấy câu hỏi theo mẫu Câu 1./Bài 1./Question 1.'});
  return {questions,warnings};
}

type EnglishRawQuestion = { number: number; lines: string[]; start: number; sharedContext?: string[] };

// Provincial entrance exams often omit "Question/Câu" and use only "1.".
const englishQuestionStart = /^(?:(?:Question|Câu)\s*)?0*(\d+)\s*[:.)]\s*(.*)$/iu;
const englishChoice = /\b([A-D])\s*[.:)]\s*/g;
const sectionRange = (title: string) => {
  const match = title.match(/Câu\s*(\d+)\s*[–-]\s*(\d+)/iu);
  return match ? { from: Number(match[1]), to: Number(match[2]) } : undefined;
};

const extractAnswerKey = (lines: string[], startAt: number): Map<number, string> => {
  const answers = new Map<number, string>();
  const solutionStart = lines.findIndex((line, index) => index > startAt && /^(?:LỜI GIẢI THAM KHẢO|SOLUTIONS?)$/iu.test(line));
  const endAt = solutionStart >= 0 ? solutionStart : lines.length;

  // Legacy compact key: "Câu 1 2 3 / Đáp án / B A C".
  for (let i = startAt; i < lines.length; i += 1) {
    if (!/^Câu(?:\s|$)/iu.test(lines[i])) continue;
    const numbers: number[] = [...lines[i].matchAll(/\b\d+\b/g)].map((match) => Number(match[0]));
    let j = i;
    while (j + 1 < lines.length && /^\d+$/u.test(lines[j + 1])) {
      numbers.push(Number(lines[j + 1]));
      j += 1;
    }
    if (!numbers.length || !/^Đáp án$/iu.test(lines[j + 1] || '')) continue;
    j += 2;
    const letters: string[] = [];
    while (j < lines.length && /^[A-D]$/iu.test(lines[j])) {
      letters.push(lines[j].toUpperCase());
      j += 1;
    }
    numbers.forEach((number, index) => {
      const answer = letters[index];
      if (answer) answers.set(number, answer);
    });
    i = j - 1;
  }

  // Word tables are commonly flattened as: Câu / 1 / B / 2 / A ...
  // This also accepts a single-line row such as "1 B" or "29 global".
  for (let i = startAt + 1; i < endAt; i += 1) {
    const row = lines[i].match(/^(\d{1,2})(?:\s+|[.)]\s*)(.+)$/u);
    if (row) {
      const number = Number(row[1]);
      if (!answers.has(number)) answers.set(number, row[2].trim());
      continue;
    }
    if (!/^\d{1,2}$/u.test(lines[i])) continue;
    const number = Number(lines[i]);
    const answer = lines[i + 1]?.trim();
    if (!answer || /^\d{1,2}$/u.test(answer) || /^(?:Câu|Đáp án)$/iu.test(answer)) continue;
    if (!answers.has(number)) answers.set(number, answer);
  }
  return answers;
};

const extractSolutions = (lines: string[], startAt: number): Map<number, string[]> => {
  const solutions = new Map<number, string[]>();
  let current: number | undefined;
  for (let i = startAt; i < lines.length; i += 1) {
    const match = lines[i].match(/^(?:Câu|Question)\s*0*(\d+)\s*[:.)]?\s*(.*)$/iu);
    if (match) {
      current = Number(match[1]);
      solutions.set(current, match[2].trim() ? [match[2].trim()] : []);
    } else if (current !== undefined && lines[i].trim()) {
      solutions.get(current)!.push(lines[i]);
    }
  }
  return solutions;
};

const splitEnglishChoices = (lines: string[]) => {
  const choices: { label: string; text: string }[] = [];
  const stem: string[] = [];
  for (const line of lines) {
    const matches = [...line.matchAll(englishChoice)];
    if (!matches.length) {
      if (line.trim()) stem.push(line.trim());
      continue;
    }
    const before = line.slice(0, matches[0].index).trim();
    if (before) stem.push(before);
    matches.forEach((match, index) => {
      const contentStart = (match.index || 0) + match[0].length;
      const contentEnd = index + 1 < matches.length ? (matches[index + 1].index || line.length) : line.length;
      const text = line.slice(contentStart, contentEnd).trim();
      if (text) choices.push({ label: match[1].toUpperCase(), text });
    });
  }
  return { choices, stem };
};

const uniqueChoices = (choices: { label: string; text: string }[]) => {
  const seen = new Set<string>();
  return choices.filter((choice) => {
    if (seen.has(choice.label)) return false;
    seen.add(choice.label);
    return true;
  });
};

const trailingSharedContext = (lines: string[]) => {
  let lastChoiceLine = -1;
  lines.forEach((line, index) => {
    if (/(?:^|\s)D\s*[.:)]\s*/iu.test(line)) lastChoiceLine = index;
  });
  if (lastChoiceLine < 0) return undefined;
  let questionLines = lines.slice(0, lastChoiceLine + 1);
  let context = lines.slice(lastChoiceLine + 1).filter((line) => !examFurniture.test(line));
  const lastLine = lines[lastChoiceLine];
  const dMatch = lastLine.match(/(?:^|\s)D\s*[.:)]\s*/iu);
  // A few Word files concatenate the passage directly after option D
  // (for example "tomorrowDeepfake"). Recover that boundary before grouping.
  if (context.join(' ').length < 80 && dMatch) {
    const dContentStart = (dMatch.index || 0) + dMatch[0].length;
    const compactBoundary = lastLine.slice(dContentStart).search(/(?<=[a-z])(?=[A-Z](?:[a-z]{2,}\b|\s))/u);
    if (compactBoundary >= 3) {
      const splitAt = dContentStart + compactBoundary;
      questionLines = [...lines.slice(0, lastChoiceLine), lastLine.slice(0, splitAt).trim()];
      context = [lastLine.slice(splitAt).trim()];
    }
  }
  const contextLength = context.join(' ').length;
  if (contextLength < 80) return undefined;
  return { questionLines, context };
};

/** Parse the English exam layout: shared passages, inline options, answer tables and explanations. */
export function parseEnglishLines(lines: string[], profileId = 'english-12-v1'): ParsedDocument {
  const normalized = lines.map((line) => line.replace(/\s+/gu, ' ').trim()).filter(Boolean).filter((line) => !examEndFurniture.test(line));
  const answerMarker = normalized.findIndex((line) => /^(?:ĐÁP ÁN THAM KHẢO|ANSWER KEY)$/iu.test(line));
  const solutionMarker = normalized.findIndex((line) => /^(?:LỜI GIẢI THAM KHẢO|SOLUTIONS?)$/iu.test(line));
  const endOfQuestions = answerMarker >= 0 ? answerMarker : solutionMarker >= 0 ? solutionMarker : normalized.length;
  const questionLines = normalized.slice(0, endOfQuestions);
  const answerMap = answerMarker >= 0 ? extractAnswerKey(normalized, answerMarker) : new Map<number, string>();
  const solutionMap = solutionMarker >= 0 ? extractSolutions(normalized, solutionMarker + 1) : new Map<number, string[]>();
  const rawQuestions: EnglishRawQuestion[] = [];
  questionLines.forEach((line, index) => {
    const match = line.match(englishQuestionStart);
    if (match) rawQuestions.push({ number: Number(match[1]), lines: [match[2].trim()], start: index });
    else if (rawQuestions.length) rawQuestions[rawQuestions.length - 1].lines.push(line);
  });
  const warnings: ImportWarning[] = [];
  if (!rawQuestions.length) {
    warnings.push({ id: uid('w'), type: 'parser', message: 'Không tìm thấy câu hỏi Tiếng Anh theo mẫu Question 1./Câu 1.' });
    return { questions: [], warnings };
  }

  const profile = getSubjectProfile(profileId);
  const sections: QuizSection[] = profile.sections.map((section) => ({ id: section.id, title: section.title, instruction: section.instruction, questionIds: [] }));
  const groups: QuestionGroup[] = [];
  const groupBySection = new Map<string, QuestionGroup>();
  const questionSection = (number: number) => profile.sections.find((section) => {
    const range = sectionRange(section.title);
    return range ? number >= range.from && number <= range.to : false;
  });
  const sharedSections = new Set(profile.sections
    .filter((section) => /chùm|đoạn đọc|cloze|reading|gapped|leaflet|advertisement|announcement/iu.test(`${section.title} ${section.instruction} ${section.formats.join(' ')}`))
    .map((section) => section.id));

  // The Hanoi DOCX places the gapped passage and its four sentence options
  // before the visible “Question 37–40” lines. Capture that block explicitly;
  // otherwise the scanner attaches it to Question 36 and leaves the gapped
  // group empty.
  let gappedContextLines: string[] = [];
  let gappedChoiceRows: { label: string; text: string }[] = [];
  const gappedFirstIndex = rawQuestions.findIndex((item) => questionSection(item.number)?.id === 'gapped-text');
  const gappedSeed = gappedFirstIndex > 0 ? rawQuestions[gappedFirstIndex - 1].lines : [];
  const gappedMarker = gappedSeed.findIndex((line) => /(?:phrases\/sentences have been removed|sentences have been removed|PRESERVING TRADITIONS)/iu.test(line));
  if (gappedMarker >= 0) {
    const gappedBlock = gappedSeed.slice(gappedMarker);
    const firstGappedChoice = gappedBlock.findIndex((line) => /^A\s*[.:)]\s+/iu.test(line));
    gappedContextLines = firstGappedChoice >= 0 ? gappedBlock.slice(0, firstGappedChoice) : gappedBlock;
    gappedChoiceRows = firstGappedChoice >= 0 ? uniqueChoices(splitEnglishChoices(gappedBlock.slice(firstGappedChoice)).choices) : [];
  }

  // Some provincial Word files place a long passage immediately after the
  // previous question's options. The question scanner naturally attaches it
  // to that previous question, so move only the long tail into the next group.
  for (let index = 1; index < rawQuestions.length; index += 1) {
    const currentSection = questionSection(rawQuestions[index].number);
    const previousSection = questionSection(rawQuestions[index - 1].number);
    if (!currentSection || !sharedSections.has(currentSection.id) || currentSection.id === previousSection?.id) continue;
    const extracted = trailingSharedContext(rawQuestions[index - 1].lines);
    if (extracted) {
      rawQuestions[index - 1].lines = extracted.questionLines;
      rawQuestions[index - 1].sharedContext = extracted.context;
    }
  }

  const questions = rawQuestions.map((raw, index) => {
    const section = questionSection(raw.number);
    const previousEnd = index === 0 ? 0 : rawQuestions[index - 1].start + rawQuestions[index - 1].lines.length;
    const movedContext = index > 0 && rawQuestions[index - 1].sharedContext ? rawQuestions[index - 1].sharedContext! : [];
    const rawContext = section?.id === 'gapped-text' && gappedContextLines.length
      ? gappedContextLines
      : section && sharedSections.has(section.id)
      ? (movedContext.length ? movedContext : questionLines.slice(previousEnd, raw.start).filter((line) => !examFurniture.test(line)))
      : [];
    // Word headers are sometimes split into short lines (for example "BẮC NINH")
    // and escape the normal furniture filter. A grouped English passage begins at
    // its instruction, so retain that instruction and everything after it.
    const instructionIndex = rawContext.findIndex((line) => /^(?:Read|Mark)\b/iu.test(line));
    const context = instructionIndex >= 0 ? rawContext.slice(instructionIndex) : rawContext;
    const { choices, stem } = splitEnglishChoices(raw.lines);
    // In a gapped-text block the A–D sentence bank is printed once before
    // Questions 37–40. Reuse that bank for every child question, while the
    // passage itself remains in the shared group stimulus.
    const contextChoices = section?.id === 'gapped-text'
      ? (gappedChoiceRows.length ? gappedChoiceRows : uniqueChoices(splitEnglishChoices(rawContext).choices))
      : [];
    const finalChoices = uniqueChoices(choices.length >= 2 ? choices : contextChoices);
    const answer = answerMap.get(raw.number);
    const isTrueFalse = Boolean(section?.formats.some((format) => /đúng|true\s*[&/-]?\s*false/iu.test(format))) && finalChoices.length < 2;
    const type: QuestionType = isTrueFalse ? 'true-false' : finalChoices.length >= 2 ? 'single-choice' : 'short-answer';
    const question: Question = {
      id: uid('q'), number: raw.number, type,
      stem: isTrueFalse ? [] : (stem.length ? stem : ['Chọn phương án phù hợp với câu hỏi.']).flatMap(parseTextToBlocks),
      choices: type === 'single-choice' ? finalChoices.map((choice) => ({ id: uid('c'), label: choice.label, content: parseTextToBlocks(choice.text), isCorrect: answer ? choice.label === answer : null })) : undefined,
      attachments: [], confidence: answer ? 'high' : 'medium', warnings: [], sectionId: section?.id,
      solution: solutionMap.has(raw.number) ? solutionMap.get(raw.number)!.map((text) => ({ id: uid('s'), content: parseTextToBlocks(text) })) : undefined,
    };
    if (isTrueFalse) {
      question.statements = [{ id: uid('s'), label: 'a', content: stem.length ? parseTextToBlocks(stem.join(' ')) : [paragraph('Đọc nhận định và xác định Đúng hoặc Sai.')], correctValue: /^(?:true|đúng)$/iu.test(answer || '') }];
    } else if (type === 'short-answer') {
      question.shortAnswer = { acceptedAnswers: answer ? [answer] : [], caseSensitive: false };
    }
    if (!answer) question.warnings.push('Chưa nhận dạng được đáp án từ bảng đáp án cuối đề.');
    if (!isTrueFalse && type === 'short-answer' && !answer) question.warnings.push('Chưa nhận dạng được đáp án ngắn; cần đối chiếu lại bảng đáp án.');
    if (type === 'single-choice' && finalChoices.length < 2) question.warnings.push('Chưa tách đủ phương án A–D; cần đối chiếu lại định dạng Word.');
    if (section) sections.find((item) => item.id === section.id)?.questionIds.push(question.id);
    if (section && sharedSections.has(section.id)) {
      let group = groupBySection.get(section.id);
      if (!group && context.length) {
        group = { id: uid('group'), title: section.title, instruction: section.instruction, stimulus: context.flatMap(parseTextToBlocks), questionIds: [], kind: section.id };
        groupBySection.set(section.id, group); groups.push(group);
      }
      if (group) { group.questionIds.push(question.id); question.groupId = group.id; }
    }
    return question;
  });

  // Compact DOCX files may omit the visible passage before the first question.
  // Still preserve the profile's shared-group semantics for all child questions.
  for (const section of profile.sections) {
    const range = sectionRange(section.title);
    if (!range || !sharedSections.has(section.id) || groupBySection.has(section.id)) continue;
    const members = questions.filter((question) => question.number >= range.from && question.number <= range.to);
    if (!members.length) continue;
    const previousReading = /reading/iu.test(section.title)
      ? [...groups].reverse().find((item) => /reading/iu.test(item.title) && item.stimulus.length)
      : undefined;
    const stimulus = previousReading?.stimulus.map((block) => ({ ...block, id: uid(block.kind) })) || [];
    const group: QuestionGroup = { id: uid('group'), title: section.title, instruction: section.instruction, stimulus, questionIds: members.map((question) => question.id), kind: section.id };
    members.forEach((question) => { question.groupId = group.id; }); groups.push(group);
  }
  return { questions, warnings, sections, groups };
}

export function parseEnglishStructuredHtml(html: string, profileId = 'english-12-v1'): ParsedDocument {
  return parseEnglishLines(linesFromHtml(html), profileId);
}
