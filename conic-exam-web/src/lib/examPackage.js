export const PACKAGE_SCHEMA = 'conic-exam-package/v1';

export function inspectExamPackage(value) {
  const errors = [];
  if (!value || typeof value !== 'object' || Array.isArray(value)) errors.push('Gói đề phải là một object JSON.');
  if (![PACKAGE_SCHEMA, 1, '1'].includes(value?.schemaVersion)) errors.push(`schemaVersion phải là ${PACKAGE_SCHEMA}.`);
  if (!String(value?.title || '').trim()) errors.push('Thiếu tên đề.');
  const items = Array.isArray(value?.publicItems) ? value.publicItems : [];
  const answerKey = Array.isArray(value?.answerKey) ? value.answerKey : [];
  if (!items.length) errors.push('Đề chưa có câu hỏi.');
  if (items.length > 200) errors.push('Một đề tối đa 200 câu.');
  if (answerKey.length !== items.length) errors.push('answerKey phải có đúng một khóa cho mỗi câu công khai.');
  const keys = new Map(answerKey.map((item) => [item?.id, item]));
  const ids = new Set();
  const counts = { tn: 0, ds: 0, tln: 0, tl: 0 };
  let maxScore = 0;

  items.forEach((item, index) => {
    const prefix = `Câu ${index + 1}`;
    const id = String(item?.id || '').trim();
    if (!id) errors.push(`${prefix}: thiếu id.`);
    if (id && ids.has(id)) errors.push(`${prefix}: sourceId ${id} bị trùng.`);
    ids.add(id);
    if (!Object.hasOwn(counts, item?.type)) errors.push(`${prefix}: loại câu không hợp lệ.`);
    else counts[item.type] += 1;
    const key = keys.get(id);
    if (!key) errors.push(`${prefix}: thiếu khóa chấm riêng.`);
    const points = Number(key?.points ?? item?.points);
    if (!Number.isFinite(points) || points < 0 || points > 10) errors.push(`${prefix}: điểm không hợp lệ.`);
    else maxScore += points;
  });

  const warnings = Array.isArray(value?.warnings)
    ? value.warnings.filter((item) => typeof item === 'string').slice(0, 100)
    : [];
  return { valid: errors.length === 0, errors, warnings, counts, maxScore, itemCount: items.length };
}

export async function readExamPackage(file) {
  if (!file) throw new Error('Vui lòng chọn tệp gói đề.');
  if (file.size > 8 * 1024 * 1024) throw new Error('Gói đề vượt quá 8 MiB. Hãy tối ưu SVG/tài nguyên.');
  let value;
  try {
    value = JSON.parse(await file.text());
  } catch {
    throw new Error('Tệp không phải JSON hợp lệ.');
  }
  const report = inspectExamPackage(value);
  if (!report.valid) throw new Error(report.errors.slice(0, 5).join('\n'));
  return { value, report };
}

export function questionCountLabel(counts = {}) {
  return [
    counts.tn ? `${counts.tn} TN` : '',
    counts.ds ? `${counts.ds} Đ/S` : '',
    counts.tln ? `${counts.tln} TLN` : '',
    counts.tl ? `${counts.tl} tự luận` : '',
  ].filter(Boolean).join(' · ') || 'Chưa có câu';
}
