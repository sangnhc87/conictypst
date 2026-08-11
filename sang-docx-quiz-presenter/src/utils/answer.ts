export const normalizeAnswer = (value: string, caseSensitive = false) => {
  const compact = value.trim().replace(/\s+/g, ' ').replace(/(?<=\d),(?=\d)/g, '.');
  return caseSensitive ? compact : compact.toLocaleLowerCase('vi');
};
export const isShortAnswerCorrect = (input: string, accepted: string[], tolerance = 0, caseSensitive = false) => {
  const normalized = normalizeAnswer(input, caseSensitive);
  return accepted.some(answer => {
    const expected = normalizeAnswer(answer, caseSensitive);
    const a = Number(normalized), b = Number(expected);
    return Number.isFinite(a) && Number.isFinite(b) ? Math.abs(a - b) <= tolerance : normalized === expected;
  });
};
