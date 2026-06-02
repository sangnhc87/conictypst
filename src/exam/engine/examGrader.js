/**
 * examGrader.js
 * Grade user answers against the correct answers extracted by typstExamParser.
 *
 * Scoring conventions (aligned with THPT national exam):
 *   TN  (trắc nghiệm):     0.25 điểm per question (out of 40 questions = 10 điểm)
 *   DS  (đúng/sai):        0/0.1/0.25/0.5 điểm based on how many statements correct
 *   TLN (trả lời ngắn):    0.5 điểm per question — exact-match after normalising
 *   TL  (tự luận):         manual grading — always null until teacher reviews
 *
 * These weights are configurable via the `scoringConfig` parameter.
 */

// ────────────────────────────────────────────────────────────────────────────
// Normalisation helpers
// ────────────────────────────────────────────────────────────────────────────

/**
 * Strip outer Typst content brackets [...]  and whitespace from a raw Typst source string.
 * This turns  [$ frac(1, 3) $]  into  $ frac(1, 3) $  so we can compare answers.
 */
function stripContentBrackets(src) {
    const s = (src ?? '').trim();
    if (s.startsWith('[') && s.endsWith(']')) return s.slice(1, -1).trim();
    return s;
}

/**
 * Normalise a user text answer or expected answer for TLN comparison.
 * - Collapse whitespace
 * - Remove math delimiters ($)
 * - Lower-case
 * - Remove accents (for forgiving Vietnamese comparisons)
 */
function normaliseTlnAnswer(raw) {
    return (raw ?? '')
        .replace(/\$/g, '')            // strip $ math delimiters
        .replace(/\\[a-z]+/gi, '')     // strip LaTeX-style commands
        .replace(/[{}()\[\]]/g, ' ')   // turn brackets into spaces
        .replace(/\s+/g, ' ')
        .trim()
        .toLowerCase()
        .normalize('NFD')
        .replace(/[\u0300-\u036f]/g, ''); // remove Vietnamese diacritics for fuzzy match
}

// ────────────────────────────────────────────────────────────────────────────
// Default scoring configuration
// ────────────────────────────────────────────────────────────────────────────

export const DEFAULT_SCORING = {
    tn: 0.25,   // per question
    ds: [0, 0.1, 0.25, 0.5],  // [0 correct, 1, 2, 3, 4 correct statements out of 4]
    tln: 0.5,    // per question
    tl: null,   // manual
};

// ────────────────────────────────────────────────────────────────────────────
// Individual question graders
// ────────────────────────────────────────────────────────────────────────────

/**
 * Grade a TN (MCQ) question.
 * @param {Question} question  - parsed question from typstExamParser
 * @param {string}   userAnswer - 'A'|'B'|'C'|'D' or null
 * @param {number}   pointValue - score for a correct answer
 * @returns {{ correct: boolean, earned: number, correctAnswer: string }}
 */
function gradeTn(question, userAnswer, pointValue) {
    const correct = question.correctLetter;
    const isCorrect = userAnswer != null && userAnswer.toUpperCase() === correct;
    return {
        correct: isCorrect,
        earned: isCorrect ? pointValue : 0,
        correctAnswer: correct ?? '?',
        userAnswer: userAnswer ?? null,
    };
}

/**
 * Grade a DS (true/false) question.
 * userAnswer is an array of 'D'|'S' per statement, e.g. ['D','S','D','S'].
 * scoring: 0 correct = 0, 1 = 0.1, 2 = 0.25, 3 = 0.5, 4 = 0.5 (full mark from 3+).
 * @returns {{ correctCount, totalStatements, earned, statementResults, correctAnswer }}
 */
function gradeDs(question, userAnswer, pointTable) {
    const statements = question.options ?? [];
    const n = statements.length;
    const userArr = Array.isArray(userAnswer) ? userAnswer : Array(n).fill(null);
    const table = pointTable ?? DEFAULT_SCORING.ds;

    let correctCount = 0;
    const statementResults = statements.map((stmt, i) => {
        const expected = stmt.correct ? 'D' : 'S';
        const given = (userArr[i] ?? '').toString().toUpperCase();
        const ok = given === expected;
        if (ok) correctCount++;
        return { correct: ok, expected, given: userArr[i] ?? null };
    });

    const tableIndex = Math.min(correctCount, table.length - 1);
    const earned = table[tableIndex] ?? 0;

    const correctAnswer = statements.map(s => (s.correct ? 'Đ' : 'S')).join('');

    return { correctCount, totalStatements: n, earned, statementResults, correctAnswer };
}

/**
 * Grade a TLN (short answer) question.
 * Exact match after normalisation, OR teacher marks correct via `override`.
 */
function gradeTln(question, userAnswer, pointValue, override) {
    if (override != null) {
        return { correct: override, earned: override ? pointValue : 0, method: 'manual' };
    }

    const expectedRaw = stripContentBrackets(question.answerSrc ?? '');
    const expected = normaliseTlnAnswer(expectedRaw);
    const given = normaliseTlnAnswer(userAnswer ?? '');

    const isCorrect = given.length > 0 && given === expected;
    return {
        correct: isCorrect,
        earned: isCorrect ? pointValue : 0,
        correctAnswer: expectedRaw,
        userAnswer: userAnswer ?? null,
        method: 'auto',
    };
}

// ────────────────────────────────────────────────────────────────────────────
// Public API
// ────────────────────────────────────────────────────────────────────────────

/**
 * Grade a complete exam.
 *
 * @param {Question[]} questions   - from parseExamSource()
 * @param {Record<string, any>} userAnswers - keyed by question id
 *   TN:  'A'|'B'|'C'|'D'
 *   DS:  ['D','S','D','S']  (one entry per statement)
 *   TLN: string (user-typed answer)
 *   TL:  string (user-typed, always manual)
 * @param {object} [scoringConfig]  - override DEFAULT_SCORING
 * @param {Record<string,boolean>} [tlnOverrides] - manual correct/incorrect for TLN
 * @returns {{ results, totalEarned, totalPossible, percentScore }}
 */
export function gradeExam(questions, userAnswers, scoringConfig, tlnOverrides) {
    const sc = { ...DEFAULT_SCORING, ...(scoringConfig ?? {}) };
    const overrides = tlnOverrides ?? {};

    let totalEarned = 0;
    let totalPossible = 0;

    const results = questions.map(q => {
        const ua = userAnswers[q.id] ?? null;

        if (q.type === 'tn') {
            const possible = sc.tn;
            totalPossible += possible;
            const r = gradeTn(q, ua, possible);
            totalEarned += r.earned;
            return { questionId: q.id, type: 'tn', possible, ...r };
        }

        if (q.type === 'ds') {
            const table = Array.isArray(sc.ds) ? sc.ds : DEFAULT_SCORING.ds;
            const possible = table[table.length - 1]; // max value
            totalPossible += possible;
            const r = gradeDs(q, ua, table);
            totalEarned += r.earned;
            return { questionId: q.id, type: 'ds', possible, ...r };
        }

        if (q.type === 'tln') {
            const possible = sc.tln ?? 0.5;
            totalPossible += possible;
            const r = gradeTln(q, ua, possible, overrides[q.id] ?? null);
            totalEarned += r.earned;
            return { questionId: q.id, type: 'tln', possible, ...r };
        }

        if (q.type === 'tl') {
            // Tự luận: always 0, pending manual review
            return {
                questionId: q.id,
                type: 'tl',
                possible: sc.tl ?? 0,
                earned: 0,
                correct: null,
                correctAnswer: null,
                userAnswer: ua,
                method: 'manual',
            };
        }

        return null;
    }).filter(Boolean);

    const percentScore = totalPossible > 0 ? (totalEarned / totalPossible) * 100 : 0;

    return { results, totalEarned, totalPossible, percentScore };
}

/**
 * Compute summary stats for quick display.
 */
export function computeStats(gradeResult) {
    const { results, totalEarned, totalPossible, percentScore } = gradeResult;

    const byType = { tn: { correct: 0, total: 0 }, ds: { scored: 0, total: 0 }, tln: { correct: 0, total: 0 } };
    for (const r of results) {
        if (r.type === 'tn') {
            byType.tn.total++;
            if (r.correct) byType.tn.correct++;
        } else if (r.type === 'ds') {
            byType.ds.total++;
            if (r.correctCount === r.totalStatements) byType.ds.scored++;
        } else if (r.type === 'tln') {
            byType.tln.total++;
            if (r.correct) byType.tln.correct++;
        }
    }

    const grade10 = Math.round(totalEarned * 10) / 10; // round to 1 dp

    return { byType, grade10, totalEarned, totalPossible, percentScore };
}
