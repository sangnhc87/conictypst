'use strict';

const DS_POINTS = Object.freeze([0, 0.1, 0.25, 0.5, 1]);

function roundScore(value) {
  return Math.round((Number(value) + Number.EPSILON) * 10000) / 10000;
}

function normalizeText(value) {
  return String(value ?? '')
    .normalize('NFKC')
    .trim()
    .replace(/\s+/gu, ' ');
}

function numericValue(value) {
  if (typeof value === 'number') return Number.isFinite(value) ? value : null;
  const normalized = normalizeText(value)
    .replace(/\s/gu, '')
    .replace(',', '.');
  if (!/^[+-]?(?:\d+(?:\.\d*)?|\.\d+)(?:e[+-]?\d+)?$/iu.test(normalized)) return null;
  const number = Number(normalized);
  return Number.isFinite(number) ? number : null;
}

function answersEqual(actual, expected) {
  if (typeof expected === 'number') {
    const actualNumber = numericValue(actual);
    return actualNumber !== null && actualNumber === expected;
  }
  return normalizeText(actual) === normalizeText(expected);
}

function gradeTln(response, key) {
  const accepted = Array.isArray(key.acceptedAnswers) && key.acceptedAnswers.length
    ? key.acceptedAnswers
    : [key.answer];
  const tolerance = Number.isFinite(key.tolerance) && key.tolerance >= 0 ? key.tolerance : 0;
  const actualNumber = numericValue(response);
  const correct = accepted.some((expected) => {
    const expectedNumber = numericValue(expected);
    if (actualNumber !== null && expectedNumber !== null) {
      return Math.abs(actualNumber - expectedNumber) <= tolerance;
    }
    return tolerance === 0 && answersEqual(response, expected);
  });
  return { correct, points: correct ? key.points : 0 };
}

function gradeDs(response, key) {
  const actual = Array.isArray(response) ? response : [];
  const expected = key.answer;
  let correctCount = 0;
  for (let index = 0; index < expected.length; index += 1) {
    if (typeof actual[index] === 'boolean' && actual[index] === expected[index]) correctCount += 1;
  }
  // The national 4-statement true/false scale is authoritative and deliberately
  // not multiplied by a client-supplied value.
  const points = expected.length === 4
    ? DS_POINTS[correctCount]
    : roundScore((correctCount / expected.length) * key.points);
  return { correct: correctCount === expected.length, correctCount, points };
}

function gradeObjectiveItem(key, response) {
  if (key.type === 'tn') {
    const correct = answersEqual(response, key.answer);
    return { correct, points: correct ? key.points : 0 };
  }
  if (key.type === 'ds') return gradeDs(response, key);
  if (key.type === 'tln') return gradeTln(response, key);
  if (key.type === 'tl') return { correct: null, points: 0, manual: true };
  throw new TypeError(`Unsupported question type: ${key.type}`);
}

function gradeResponses(keys, responses = {}, manualGrades = {}) {
  const itemResults = {};
  let automaticScore = 0;
  let manualScore = 0;
  let maximumScore = 0;
  let manualPending = 0;

  for (const key of keys) {
    maximumScore += key.points;
    if (key.type === 'tl') {
      const manual = manualGrades[key.id];
      if (manual && Number.isFinite(manual.points)) {
        const points = Math.min(key.points, Math.max(0, manual.points));
        manualScore += points;
        itemResults[key.id] = {
          type: key.type,
          points: roundScore(points),
          maxPoints: key.points,
          correct: null,
          manual: true,
          feedback: normalizeText(manual.feedback).slice(0, 2000),
        };
      } else {
        manualPending += 1;
        itemResults[key.id] = {
          type: key.type, points: 0, maxPoints: key.points, correct: null, manual: true, pending: true,
        };
      }
      continue;
    }
    const result = gradeObjectiveItem(key, responses[key.id]);
    automaticScore += result.points;
    itemResults[key.id] = {
      type: key.type,
      points: roundScore(result.points),
      maxPoints: key.points,
      correct: result.correct,
      ...(Number.isSafeInteger(result.correctCount) ? { correctCount: result.correctCount } : {}),
    };
  }

  return {
    automaticScore: roundScore(automaticScore),
    manualScore: roundScore(manualScore),
    score: roundScore(automaticScore + manualScore),
    maximumScore: roundScore(maximumScore),
    manualPending,
    itemResults,
  };
}

module.exports = {
  DS_POINTS,
  answersEqual,
  gradeObjectiveItem,
  gradeResponses,
  normalizeText,
  numericValue,
  roundScore,
};
