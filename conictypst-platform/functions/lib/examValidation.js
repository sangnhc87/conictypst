'use strict';

const crypto = require('node:crypto');
const zlib = require('node:zlib');

const MAX_INLINE_SVG_BYTES = 2 * 1024 * 1024;
const MAX_PACKAGE_EXPANDED_SVG_BYTES = 32 * 1024 * 1024;
const MAX_PUBLIC_PACKAGE_BYTES = 900 * 1024;
const MAX_PRIVATE_PACKAGE_BYTES = 900 * 1024;

class ExamValidationError extends Error {
  constructor(message) {
    super(message);
    this.name = 'ExamValidationError';
    this.code = 'invalid-argument';
  }
}

function fail(message) {
  throw new ExamValidationError(message);
}

function isObject(value) {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
    && Object.getPrototypeOf(value) === Object.prototype;
}

function string(value, field, { required = true, max = 500, pattern = null } = {}) {
  if (value === undefined || value === null) {
    if (required) fail(`${field} là bắt buộc.`);
    return '';
  }
  if (typeof value !== 'string') fail(`${field} phải là chuỗi.`);
  const result = value.trim();
  if (required && !result) fail(`${field} không được để trống.`);
  if (result.length > max) fail(`${field} vượt quá ${max} ký tự.`);
  if (pattern && result && !pattern.test(result)) fail(`${field} không hợp lệ.`);
  return result;
}

function id(value, field = 'id') {
  return string(value, field, { max: 128, pattern: /^[A-Za-z0-9][A-Za-z0-9_.:-]{0,127}$/u });
}

function jsonBytes(value) {
  return Buffer.byteLength(JSON.stringify(value), 'utf8');
}

function cleanJson(value, field = 'data', depth = 0) {
  if (depth > 16) fail(`${field} lồng nhau quá sâu.`);
  if (value === null || typeof value === 'boolean') return value;
  if (typeof value === 'number') {
    if (!Number.isFinite(value)) fail(`${field} chứa số không hữu hạn.`);
    return value;
  }
  if (typeof value === 'string') {
    if (value.length > 100000) fail(`${field} chứa chuỗi quá dài.`);
    return value;
  }
  if (Array.isArray(value)) {
    if (value.length > 1000) fail(`${field} chứa mảng quá dài.`);
    return value.map((child, index) => cleanJson(child, `${field}[${index}]`, depth + 1));
  }
  if (!isObject(value)) fail(`${field} chứa kiểu dữ liệu không được hỗ trợ.`);
  const entries = Object.entries(value);
  if (entries.length > 1000) fail(`${field} chứa quá nhiều trường.`);
  const output = {};
  for (const [key, child] of entries) {
    if (!/^[^/\u0000-\u001f]{1,200}$/u.test(key)
      || ['__proto__', 'prototype', 'constructor'].includes(key)) fail(`${field} chứa tên trường không an toàn.`);
    if (child !== undefined) output[key] = cleanJson(child, `${field}.${key}`, depth + 1);
  }
  return output;
}

const PUBLIC_ITEM_FIELDS = new Set([
  'id', 'type', 'position',
  'stemSvg', 'questionSvg', 'stemText', 'questionText',
  'points', 'section', 'options', 'statements',
]);
const PUBLIC_CHOICE_FIELDS = new Set([
  'id', 'label', 'svg', 'text', 'contentSvg', 'contentText', 'content',
]);
const COMPRESSED_SVG_FIELDS = new Set(['encoding', 'data', 'sha256', 'bytes']);

function assertOnlyFields(raw, allowed, path) {
  const unknown = Object.keys(raw).filter((key) => !allowed.has(key));
  if (unknown.length) {
    fail(`${path} chứa trường công khai không được hỗ trợ: ${unknown.join(', ')}.`);
  }
}

function optionalContent(value, field, max = 100000) {
  if (value === undefined || value === null) return undefined;
  if (typeof value !== 'string') fail(`${field} phải là chuỗi an toàn.`);
  if (value.length > max) fail(`${field} vượt quá ${max} ký tự.`);
  if (/svg$/iu.test(field) && (
    /<\s*(?:script|foreignObject|iframe|object|embed)\b/iu.test(value)
    || /\bon[a-z]+\s*=/iu.test(value)
    || /(?:javascript|data\s*:\s*text\/html)\s*:/iu.test(value)
    || /(?:href|xlink:href)\s*=\s*["']\s*(?:https?:|\/\/)/iu.test(value)
  )) fail(`${field} chứa SVG chủ động hoặc tài nguyên ngoài không an toàn.`);
  return value;
}

function assertSafeSvg(svg, field) {
  if (!/^\s*<svg\b/iu.test(svg) || !/<\/svg>\s*$/iu.test(svg)) {
    fail(`${field} không phải tài liệu SVG hoàn chỉnh.`);
  }
  if (
    /<\s*(?:script|foreignObject|iframe|object|embed)\b/iu.test(svg)
    || /\bon[a-z]+\s*=/iu.test(svg)
    || /(?:javascript|data\s*:\s*text\/html)\s*:/iu.test(svg)
    || /(?:href|xlink:href)\s*=\s*["']\s*(?:https?:|\/\/)/iu.test(svg)
  ) fail(`${field} chứa SVG chủ động hoặc tài nguyên ngoài không an toàn.`);
}

function normalizeCompressedSvg(raw, field, svgBudget) {
  if (!isObject(raw)) fail(`${field} phải là chuỗi SVG hoặc object gzip-base64.`);
  assertOnlyFields(raw, COMPRESSED_SVG_FIELDS, field);
  if (raw.encoding !== 'gzip-base64') fail(`${field}.encoding phải là gzip-base64.`);
  if (typeof raw.data !== 'string' || raw.data.length < 8 || raw.data.length > 900 * 1024
    || raw.data.length % 4 !== 0 || !/^[A-Za-z0-9+/]+={0,2}$/u.test(raw.data)) {
    fail(`${field}.data không phải base64 chuẩn hoặc vượt giới hạn.`);
  }
  const sha256 = string(raw.sha256, `${field}.sha256`, {
    max: 64, pattern: /^[a-fA-F0-9]{64}$/u,
  }).toLowerCase();
  if (!Number.isSafeInteger(raw.bytes) || raw.bytes < 1 || raw.bytes > MAX_INLINE_SVG_BYTES) {
    fail(`${field}.bytes phải là số byte nguyên dương không quá ${MAX_INLINE_SVG_BYTES}.`);
  }
  if (svgBudget.expandedBytes + raw.bytes > MAX_PACKAGE_EXPANDED_SVG_BYTES) {
    fail(`Tổng SVG giải nén của gói vượt quá ${MAX_PACKAGE_EXPANDED_SVG_BYTES} byte.`);
  }
  // Reserve before doing CPU work. A failed asset aborts the whole request, so
  // no rollback is needed and later assets cannot bypass the aggregate budget.
  svgBudget.expandedBytes += raw.bytes;
  let compressed;
  let expanded;
  try {
    compressed = Buffer.from(raw.data, 'base64');
    if (compressed.toString('base64') !== raw.data || compressed[0] !== 0x1f || compressed[1] !== 0x8b) {
      fail(`${field}.data không phải gzip-base64 chuẩn.`);
    }
    expanded = zlib.gunzipSync(compressed, { maxOutputLength: MAX_INLINE_SVG_BYTES });
  } catch (error) {
    if (error instanceof ExamValidationError) throw error;
    fail(`${field}.data không giải nén được hoặc vượt giới hạn.`);
  }
  if (expanded.length !== raw.bytes) fail(`${field}.bytes không khớp nội dung giải nén.`);
  const actualHash = crypto.createHash('sha256').update(expanded).digest('hex');
  if (actualHash !== sha256) fail(`${field}.sha256 không khớp nội dung SVG giải nén.`);
  const svg = expanded.toString('utf8');
  if (!Buffer.from(svg, 'utf8').equals(expanded)) fail(`${field} không phải UTF-8 hợp lệ.`);
  assertSafeSvg(svg, field);
  return { encoding: 'gzip-base64', data: raw.data, sha256, bytes: raw.bytes };
}

function normalizeSvg(value, field, svgBudget) {
  if (value === undefined || value === null) return undefined;
  if (typeof value === 'string') {
    const svg = optionalContent(value, field);
    assertSafeSvg(svg, field);
    const bytes = Buffer.byteLength(svg, 'utf8');
    if (svgBudget.expandedBytes + bytes > MAX_PACKAGE_EXPANDED_SVG_BYTES) {
      fail(`Tổng SVG giải nén của gói vượt quá ${MAX_PACKAGE_EXPANDED_SVG_BYTES} byte.`);
    }
    svgBudget.expandedBytes += bytes;
    return svg;
  }
  return normalizeCompressedSvg(value, field, svgBudget);
}

function normalizePublicChoice(raw, field, svgBudget) {
  if (!isObject(raw)) fail(`${field} phải là object.`);
  assertOnlyFields(raw, PUBLIC_CHOICE_FIELDS, field);
  const output = { id: id(raw.id, `${field}.id`) };
  if (raw.label !== undefined) output.label = string(raw.label, `${field}.label`, { max: 40 });
  for (const key of ['svg', 'contentSvg']) {
    const value = normalizeSvg(raw[key], `${field}.${key}`, svgBudget);
    if (value !== undefined) output[key] = value;
  }
  for (const key of ['text', 'contentText', 'content']) {
    const value = optionalContent(raw[key], `${field}.${key}`);
    if (value !== undefined) output[key] = value;
  }
  if (!output.label && !['svg', 'text', 'contentSvg', 'contentText', 'content'].some((key) => output[key])) {
    fail(`${field} phải có label hoặc nội dung text/SVG.`);
  }
  return output;
}

function number(value, field, min, max, fallback) {
  if (value === undefined && fallback !== undefined) return fallback;
  if (typeof value !== 'number' || !Number.isFinite(value) || value < min || value > max) {
    fail(`${field} phải là số từ ${min} đến ${max}.`);
  }
  return value;
}

function normalizePublicItem(raw, index, svgBudget) {
  if (!isObject(raw)) fail(`publicItems[${index}] phải là object.`);
  const path = `publicItems[${index}]`;
  assertOnlyFields(raw, PUBLIC_ITEM_FIELDS, path);
  const item = {
    id: id(raw.id, `${path}.id`),
    type: string(raw.type, `${path}.type`, { max: 8 }).toLowerCase(),
  };
  if (!['tn', 'ds', 'tln', 'tl'].includes(item.type)) fail(`Loại câu ${item.type} không được hỗ trợ.`);
  if (raw.position !== undefined) {
    if (!Number.isSafeInteger(raw.position) || raw.position < 1 || raw.position > 250) {
      fail(`${path}.position phải là số nguyên từ 1 đến 250.`);
    }
    item.position = raw.position;
  }
  if (raw.points !== undefined) item.points = number(raw.points, `${path}.points`, 0.01, 100);
  if (raw.section !== undefined) item.section = string(raw.section, `${path}.section`, { max: 120 });
  for (const key of ['stemSvg', 'questionSvg']) {
    const value = normalizeSvg(raw[key], `${path}.${key}`, svgBudget);
    if (value !== undefined) item[key] = value;
  }
  for (const key of ['stemText', 'questionText']) {
    const value = optionalContent(raw[key], `${path}.${key}`);
    if (value !== undefined) item[key] = value;
  }
  if (!['stemSvg', 'questionSvg', 'stemText', 'questionText'].some((key) => item[key])) {
    fail(`${path} phải có nội dung câu hỏi text hoặc SVG.`);
  }
  if (item.type === 'tn') {
    if (!Array.isArray(raw.options) || raw.options.length < 2 || raw.options.length > 10) {
      fail(`${path}.options phải có từ 2 đến 10 phương án.`);
    }
    item.options = raw.options.map((choice, choiceIndex) => normalizePublicChoice(
      choice, `${path}.options[${choiceIndex}]`, svgBudget,
    ));
    if (new Set(item.options.map((choice) => choice.id)).size !== item.options.length) {
      fail(`${path}.options chứa ID trùng nhau.`);
    }
    item.supportsOptionShuffle = item.options.every((option) => (
      ['contentSvg', 'contentText', 'content'].some((key) => Boolean(option[key]))
    ));
    if (raw.statements !== undefined) fail(`${path}.statements không dùng cho câu TN.`);
  } else if (item.type === 'ds') {
    if (!Array.isArray(raw.statements) || raw.statements.length !== 4) {
      fail(`${path}.statements phải có đúng 4 phát biểu.`);
    }
    item.statements = raw.statements.map((choice, choiceIndex) => normalizePublicChoice(
      choice, `${path}.statements[${choiceIndex}]`, svgBudget,
    ));
    if (new Set(item.statements.map((choice) => choice.id)).size !== 4) {
      fail(`${path}.statements chứa ID trùng nhau.`);
    }
    if (raw.options !== undefined) fail(`${path}.options không dùng cho câu Đ/S.`);
  } else if (raw.options !== undefined || raw.statements !== undefined) {
    fail(`${path} không được chứa options/statements.`);
  }
  return item;
}

function normalizeExactOrder(rawOrder, expectedIds, field) {
  if (rawOrder === undefined) return [...expectedIds];
  if (!Array.isArray(rawOrder) || rawOrder.length !== expectedIds.length
    || rawOrder.some((value) => typeof value !== 'string')) {
    fail(`${field} phải chứa đúng toàn bộ ID công khai.`);
  }
  const normalized = rawOrder.map((value, index) => id(value, `${field}[${index}]`));
  if (new Set(normalized).size !== normalized.length
    || normalized.some((value) => !expectedIds.includes(value))) {
    fail(`${field} phải là hoán vị duy nhất của toàn bộ ID công khai.`);
  }
  return normalized;
}

function normalizeKey(raw, publicItem, index, svgBudget) {
  if (!isObject(raw)) fail(`answerKey[${index}] phải là object.`);
  const itemId = id(raw.id, `answerKey[${index}].id`);
  if (itemId !== publicItem.id) fail(`answerKey[${index}] không khớp ID câu công khai.`);
  const type = string(raw.type || publicItem.type, `answerKey[${index}].type`, { max: 8 }).toLowerCase();
  if (type !== publicItem.type) fail(`answerKey[${index}] không khớp loại câu công khai.`);
  const defaultPoints = { tn: 0.25, ds: 1, tln: 0.5, tl: 1 }[type];
  const points = number(raw.points, `answerKey[${index}].points`, 0.01, 100, defaultPoints);
  if (publicItem.points !== undefined && publicItem.points !== points) {
    fail(`Điểm công khai của ${itemId} không khớp điểm chấm riêng.`);
  }
  if (type === 'ds' && points !== 1) fail('Câu Đúng/Sai phải có points = 1 theo thang 0–0,1–0,25–0,5–1.');

  const key = { id: itemId, type, points };
  if (raw.sourceId !== undefined) key.sourceId = string(raw.sourceId, `answerKey[${index}].sourceId`, { max: 256 });
  if (type === 'tn') {
    const optionIds = publicItem.options.map((option) => option.id);
    key.optionOrder = normalizeExactOrder(raw.optionOrder, optionIds, `answerKey[${index}].optionOrder`);
    if (!['string', 'number'].includes(typeof raw.answer)) fail(`Đáp án TN ${itemId} phải là ID hoặc chỉ số phương án.`);
    if (typeof raw.answer === 'number') {
      if (!Number.isSafeInteger(raw.answer) || raw.answer < 1 || raw.answer > key.optionOrder.length) {
        fail(`Chỉ số đáp án TN ${itemId} phải là số nguyên hữu hạn từ 1 đến ${key.optionOrder.length}.`);
      }
      key.answer = key.optionOrder[raw.answer - 1];
    } else {
      const answer = id(raw.answer, `answerKey[${index}].answer`);
      if (!optionIds.includes(answer)) fail(`Đáp án TN ${itemId} không thuộc các ID phương án công khai.`);
      key.answer = answer;
    }
  } else if (type === 'ds') {
    const statementIds = publicItem.statements.map((statement) => statement.id);
    key.statementOrder = normalizeExactOrder(raw.statementOrder, statementIds, `answerKey[${index}].statementOrder`);
    if (!Array.isArray(raw.answer) || raw.answer.length !== 4 || raw.answer.some((value) => typeof value !== 'boolean')) {
      fail(`Đáp án Đ/S ${itemId} phải gồm đúng 4 giá trị boolean.`);
    }
    key.answer = [...raw.answer];
  } else if (type === 'tln') {
    const accepted = raw.acceptedAnswers === undefined ? [raw.answer] : raw.acceptedAnswers;
    if (!Array.isArray(accepted) || !accepted.length || accepted.length > 20
      || accepted.some((value) => !['string', 'number'].includes(typeof value)
        || (typeof value === 'string' && !value.trim())
        || (typeof value === 'number' && !Number.isFinite(value)))) {
      fail(`acceptedAnswers của ${itemId} không hợp lệ.`);
    }
    key.answer = accepted[0];
    key.acceptedAnswers = [...accepted];
    key.tolerance = number(raw.tolerance, `answerKey[${index}].tolerance`, 0, 1000000, 0);
  } else {
    key.rubric = cleanJson(raw.rubric || [], `answerKey[${index}].rubric`);
  }
  const privateSolution = raw.solutionSvg ?? raw.solution;
  if (privateSolution !== undefined) {
    key.solution = typeof privateSolution === 'string' && !/^\s*<svg\b/iu.test(privateSolution)
      ? optionalContent(privateSolution, `answerKey[${index}].solution`)
      : normalizeSvg(privateSolution, `answerKey[${index}].solution`, svgBudget);
  }
  if (raw.solutionAsset !== undefined) {
    key.solutionAsset = isObject(raw.solutionAsset) && raw.solutionAsset.encoding === 'gzip-base64'
      ? normalizeCompressedSvg(raw.solutionAsset, `answerKey[${index}].solutionAsset`, svgBudget)
      : cleanJson(raw.solutionAsset, `answerKey[${index}].solutionAsset`);
  }
  return key;
}

function stable(value) {
  if (Array.isArray(value)) return value.map(stable);
  if (value && typeof value === 'object') {
    return Object.keys(value).sort().reduce((output, key) => {
      output[key] = stable(value[key]);
      return output;
    }, {});
  }
  return value;
}

function packageHash(value) {
  return crypto.createHash('sha256').update(JSON.stringify(stable(value))).digest('hex');
}

function normalizePackage(data) {
  if (!isObject(data)) fail('examPackage phải là object.');
  const title = string(data.title, 'examPackage.title', { max: 200 });
  const description = string(data.description, 'examPackage.description', { required: false, max: 2000 });
  const sourceId = string(data.sourceId, 'examPackage.sourceId', { required: false, max: 256 });
  const sourceHash = string(data.sourceHash, 'examPackage.sourceHash', {
    required: false, max: 128, pattern: /^[A-Fa-f0-9]{32,128}$/u,
  }).toLowerCase();
  const version = string(data.version || '1', 'examPackage.version', { max: 64 });
  if (!Array.isArray(data.publicItems) || !data.publicItems.length || data.publicItems.length > 250) {
    fail('publicItems phải có từ 1 đến 250 câu.');
  }
  if (!Array.isArray(data.answerKey) || data.answerKey.length !== data.publicItems.length) {
    fail('answerKey phải có đúng một bản ghi cho mỗi câu công khai.');
  }
  const svgBudget = { expandedBytes: 0 };
  const publicItems = data.publicItems.map((item, index) => normalizePublicItem(item, index, svgBudget));
  const ids = new Set(publicItems.map((item) => item.id));
  if (ids.size !== publicItems.length) fail('ID câu hỏi phải duy nhất trong một bản phát hành.');
  const keyById = new Map(data.answerKey.map((key) => [id(key?.id, 'answerKey.id'), key]));
  if (keyById.size !== data.answerKey.length) fail('answerKey chứa ID trùng nhau.');
  const answerKey = publicItems.map((item, index) => normalizeKey(
    keyById.get(item.id), item, index, svgBudget,
  ));
  const maximumScore = answerKey.reduce((sum, key) => sum + key.points, 0);
  if (maximumScore > 100) fail('Tổng điểm đề không được vượt quá 100.');
  const publicPackage = { schemaVersion: 1, title, description, sourceId, sourceHash, version, publicItems };
  const privatePackage = { schemaVersion: 1, items: answerKey };
  if (jsonBytes(publicPackage) > MAX_PUBLIC_PACKAGE_BYTES) fail('Gói đề công khai vượt quá 900 KiB.');
  if (jsonBytes(privatePackage) > MAX_PRIVATE_PACKAGE_BYTES) fail('Kho đáp án/lời giải vượt quá 900 KiB.');
  return {
    publicPackage,
    privatePackage,
    contentHash: packageHash({ publicPackage, privatePackage }),
    questionCount: publicItems.length,
    maximumScore: Math.round(maximumScore * 10000) / 10000,
  };
}

function normalizeResponses(raw, publicItems) {
  if (!isObject(raw)) fail('responses phải là object.');
  const allowed = new Map(publicItems.map((item) => [item.id, item]));
  const output = {};
  for (const [questionId, value] of Object.entries(raw)) {
    if (!allowed.has(questionId)) fail(`responses chứa ID câu không thuộc đề: ${questionId}.`);
    const item = allowed.get(questionId);
    const type = item.type;
    if (type === 'tn') {
      if (!['string', 'number'].includes(typeof value)) fail(`Câu ${questionId} cần ID/chỉ số phương án.`);
      const optionIds = item.options.map((option) => option.id);
      if (typeof value === 'number') {
        if (!Number.isSafeInteger(value) || value < 1 || value > optionIds.length) {
          fail(`Câu ${questionId} cần chỉ số phương án hữu hạn từ 1 đến ${optionIds.length}.`);
        }
        output[questionId] = optionIds[value - 1];
      } else {
        const responseId = id(value, `responses.${questionId}`);
        if (!optionIds.includes(responseId)) fail(`Câu ${questionId} chứa ID phương án không hợp lệ.`);
        output[questionId] = responseId;
      }
    } else if (type === 'ds') {
      if (!Array.isArray(value) || value.length > 4
        || value.some((child) => child !== null && typeof child !== 'boolean')) {
        fail(`Câu ${questionId} cần tối đa 4 giá trị true/false/null.`);
      }
      output[questionId] = [...value];
    } else if (type === 'tln') {
      if (!['string', 'number'].includes(typeof value)) fail(`Câu ${questionId} cần câu trả lời ngắn.`);
      if (typeof value === 'number' && !Number.isFinite(value)) fail(`Câu ${questionId} chứa số không hữu hạn.`);
      output[questionId] = typeof value === 'string' ? value.trim().slice(0, 500) : value;
    } else {
      if (typeof value !== 'string') fail(`Câu ${questionId} cần bài làm dạng văn bản.`);
      output[questionId] = value.slice(0, 20000);
    }
  }
  if (jsonBytes(output) > 300 * 1024) fail('Bài làm vượt quá 300 KiB.');
  return output;
}

module.exports = {
  ExamValidationError,
  cleanJson,
  id,
  isObject,
  jsonBytes,
  normalizePackage,
  normalizeResponses,
  packageHash,
  string,
};
