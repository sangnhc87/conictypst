/**
 * typstExamParser.js
 * Parse #tn / #ds / #tln / #tl macro calls from a Typst exam source file.
 * Returns structured question objects ready for rendering + grading.
 *
 * Supported formats (sang-exam.typ v6.0):
 *   #tn(id: "...", [stem], (True([opt]), False([opt]), ...), fig: ..., loigiai: ...)
 *   #ds(id: "...", [stem], (True([stmt]), False([stmt]), ...), fig: ..., loigiai: ...)
 *   #tln(id: "...", [stem], [answer], loigiai: ...)
 *   #tl(id: "...", [stem], [answer], loigiai: ...)
 */

// ────────────────────────────────────────────────────────────────────────────
// Low-level scanner utilities
// ────────────────────────────────────────────────────────────────────────────

/**
 * Read a balanced bracket region starting at src[pos].
 * open ∈ { '(', '[', '{' }  →  matching close found automatically.
 * Returns { text: string (includes delimiters), end: number (index after close) }
 */
function readBalanced(src, pos) {
    const CLOSE = { '(': ')', '[': ']', '{': '}' };
    const open = src[pos];
    const close = CLOSE[open];
    if (!close) return { text: src[pos] ?? '', end: pos + 1 };

    let i = pos + 1;
    let depth = 1;

    while (i < src.length && depth > 0) {
        const ch = src[i];

        if (ch === '"') {
            // string literal — skip until unescaped "
            i++;
            while (i < src.length) {
                if (src[i] === '\\') { i += 2; continue; }
                if (src[i] === '"') { i++; break; }
                i++;
            }
        } else if (ch === '$') {
            // Typst math mode — skip brackets inside $...$
            i++;
            while (i < src.length) {
                if (src[i] === '$') { i++; break; }
                i++;
            }
        } else if (ch === '/' && src[i + 1] === '/') {
            // line comment
            while (i < src.length && src[i] !== '\n') i++;
        } else if (ch === open) {
            depth++;
            i++;
        } else if (ch === close) {
            depth--;
            i++;
        } else {
            i++;
        }
    }

    return { text: src.slice(pos, i), end: i };
}

/**
 * Split an argument list string (content BETWEEN outer parens, NOT including them)
 * into individual raw argument strings.  Commas at depth 0 are separators.
 */
function splitArgList(inner) {
    const args = [];
    let depth = 0;
    let start = 0;
    let i = 0;

    while (i < inner.length) {
        const ch = inner[i];

        if (ch === '(' || ch === '[' || ch === '{') {
            depth++;
            i++;
        } else if (ch === ')' || ch === ']' || ch === '}') {
            depth--;
            i++;
        } else if (ch === '$') {
            // Typst math mode — skip brackets inside $...$
            i++;
            while (i < inner.length) {
                if (inner[i] === '$') { i++; break; }
                i++;
            }
        } else if (ch === '"') {
            // string literal
            i++;
            while (i < inner.length) {
                if (inner[i] === '\\') { i += 2; continue; }
                if (inner[i] === '"') { i++; break; }
                i++;
            }
        } else if (ch === '/' && inner[i + 1] === '/') {
            // line comment — treat as whitespace
            while (i < inner.length && inner[i] !== '\n') i++;
        } else if (ch === ',' && depth === 0) {
            const piece = inner.slice(start, i).trim();
            if (piece) args.push(piece);
            start = i + 1;
            i++;
        } else {
            i++;
        }
    }

    const last = inner.slice(start).trim();
    if (last) args.push(last);

    return args;
}

/**
 * Parse a single raw argument string into { named, name, valueSrc }.
 * Named args look like:  identifier: <value>
 * Positional args have named = false.
 */
function parseOneArg(argStr) {
    const trimmed = argStr.trim();
    // Check for named arg: word characters + hyphens, then colon
    const m = trimmed.match(/^([\w-]+)\s*:([\s\S]*)$/s);
    if (m) {
        return { named: true, name: m[1], valueSrc: m[2].trim() };
    }
    return { named: false, name: null, valueSrc: trimmed };
}

/**
 * Extract a plain string value from  "foo"  or  foo  (unquoted identifier).
 */
function extractStringLiteral(src) {
    const s = src.trim();
    if ((s.startsWith('"') && s.endsWith('"')) || (s.startsWith("'") && s.endsWith("'"))) {
        return s.slice(1, -1);
    }
    return s;
}

// ────────────────────────────────────────────────────────────────────────────
// Options tuple parser  (True([...]), False([...]), ...)
// ────────────────────────────────────────────────────────────────────────────

/**
 * Parse the options tuple src like  (True([opt A]), False([opt B]), ...)
 * Returns Array<{ correct: boolean, contentSrc: string }>
 * contentSrc is the raw Typst source for the option content (typically [text]).
 */
function parseOptionsTuple(tupleSrc) {
    const trimmed = tupleSrc.trim();
    // Strip outer ( )
    const inner = trimmed.startsWith('(') ? trimmed.slice(1, -1) : trimmed;
    const items = splitArgList(inner);

    return items
        .map(item => {
            const t = item.trim();
            if (!t) return null;

            if (/^True\s*\(/.test(t)) {
                // True(content) — read balanced parens
                const callStart = t.indexOf('(');
                const balanced = readBalanced(t, callStart);
                const innerContent = balanced.text.slice(1, -1).trim(); // strip outer ( )
                return { correct: true, contentSrc: innerContent };
            }

            if (/^False\s*\(/.test(t)) {
                const callStart = t.indexOf('(');
                const balanced = readBalanced(t, callStart);
                const innerContent = balanced.text.slice(1, -1).trim();
                return { correct: false, contentSrc: innerContent };
            }

            // Plain content (no True/False wrapper) — treat as False
            if (t.startsWith('[')) {
                return { correct: false, contentSrc: t };
            }

            return null;
        })
        .filter(Boolean);
}

// ────────────────────────────────────────────────────────────────────────────
// Macro call finder
// ────────────────────────────────────────────────────────────────────────────

const MACRO_NAMES = ['tn', 'ds', 'tln', 'tl'];

/**
 * Find all #tn / #ds / #tln / #tl macro calls in src.
 * Returns Array<{ type, start, argsSrc, argsInner }>
 */
function findMacroCalls(src) {
    const results = [];

    for (const name of MACRO_NAMES) {
        const pattern = new RegExp(`#${name}\\s*\\(`, 'g');
        let match;
        while ((match = pattern.exec(src)) !== null) {
            const parenStart = match.index + match[0].length - 1; // index of '('
            const balanced = readBalanced(src, parenStart);
            results.push({
                type: name,
                start: match.index,
                argsSrc: balanced.text,          // includes outer ( )
                argsInner: balanced.text.slice(1, -1), // just the inner content
            });
        }
    }

    // Sort by position in source
    results.sort((a, b) => a.start - b.start);
    return results;
}

// ────────────────────────────────────────────────────────────────────────────
// Question builder
// ────────────────────────────────────────────────────────────────────────────

let _autoId = 0;

function buildQuestion(type, rawArgs) {
    const named = {};
    const positional = [];

    for (const arg of rawArgs) {
        const parsed = parseOneArg(arg);
        if (parsed.named) {
            named[parsed.name] = parsed.valueSrc;
        } else {
            positional.push(parsed.valueSrc);
        }
    }

    const id = named['id'] ? extractStringLiteral(named['id']) : `auto-${++_autoId}`;
    const stemSrc = positional[0] ?? '[?]';
    const figSrc = named['fig'] ?? null;
    const loigiaiSrc = named['loigiai'] ?? null;

    if (type === 'tn' || type === 'ds') {
        const optionsTupleSrc = positional[1] ?? '()';
        const options = parseOptionsTuple(optionsTupleSrc);

        // For TN: find the single correct option → letter A/B/C/D
        const correctIndex = options.findIndex(o => o.correct);
        const correctLetter = correctIndex >= 0 ? 'ABCDEFGH'[correctIndex] : null;

        return {
            type,
            id,
            stemSrc,
            optionsSrc: positional[1] ?? '()',
            options,          // [{ correct, contentSrc }]
            correctLetter,    // for type=tn: 'A'/'B'/'C'/'D'
            figSrc,
            loigiaiSrc,
        };
    }

    if (type === 'tln' || type === 'tl') {
        const answerSrc = positional[1] ?? '';
        return {
            type,
            id,
            stemSrc,
            answerSrc,        // raw Typst source of the expected answer
            figSrc,
            loigiaiSrc,
        };
    }

    return null;
}

// ────────────────────────────────────────────────────────────────────────────
// Public API
// ────────────────────────────────────────────────────────────────────────────

/**
 * Parse a full Typst exam source string.
 *
 * @param {string} typSrc  - Content of the .typ file
 * @returns {{ questions: Question[] }}
 *
 * Question shape:
 *   type ∈ 'tn' | 'ds' | 'tln' | 'tl'
 *   id: string
 *   stemSrc: string          raw Typst [content] for the question stem
 *   optionsSrc?: string      raw Typst (True/False tuple) — for tn/ds
 *   options?: {correct, contentSrc}[]  — for tn/ds
 *   correctLetter?: string   'A'–'H'  — for tn only
 *   answerSrc?: string       raw Typst for the answer — for tln/tl
 *   figSrc?: string | null   raw Typst for the figure — if any
 *   loigiaiSrc?: string|null raw Typst for the solution
 */
export function parseExamSource(typSrc) {
    _autoId = 0; // reset auto-id counter per parse
    const calls = findMacroCalls(typSrc);

    const questions = calls
        .map(call => {
            const rawArgs = splitArgList(call.argsInner);
            return buildQuestion(call.type, rawArgs);
        })
        .filter(Boolean);

    return { questions };
}

/**
 * Quick smoke-test helper — returns a summary string.
 * Call from browser console: import('./exam/engine/typstExamParser.js').then(m => console.log(m.summarize(src)))
 */
export function summarizeParseResult(typSrc) {
    const { questions } = parseExamSource(typSrc);
    return questions.map((q, i) => {
        if (q.type === 'tn') {
            const opts = q.options.map((o, j) => `${'ABCD'[j]}${o.correct ? '*' : ''}`).join(' ');
            return `[${i + 1}] TN  id=${q.id}  opts=${opts}`;
        }
        if (q.type === 'ds') {
            const stmts = q.options.map(o => (o.correct ? 'Đ' : 'S')).join('');
            return `[${i + 1}] DS  id=${q.id}  stmts=${stmts}`;
        }
        return `[${i + 1}] ${q.type.toUpperCase()}  id=${q.id}`;
    }).join('\n');
}
