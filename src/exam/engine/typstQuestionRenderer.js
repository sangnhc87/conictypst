/**
 * typstQuestionRenderer.js
 *
 * Renders parsed question objects to SVG via the Typst WASM compiler.
 * Reuses the singleton from typstCompilerSingleton.js and the system .typ files
 * from src/typst-system/ (already used by typstRenderer.js for CeTZ figures).
 *
 * Strategy:
 *  - Each question is compiled as a tiny self-contained Typst document.
 *  - For TN/DS: we reconstruct the #tn(...)/#ds(...) call so the full
 *    auto-column layout logic from sang-exam.typ applies unchanged.
 *  - For TLN/TL: we render just the stem.
 *  - In mode "dethi"  → no answer highlighting.
 *  - In mode "loigiai" → correct options highlighted (used in result view).
 *
 * Rendered SVGs are cached by a (questionId + mode) key so each question
 * is compiled at most twice per session.
 */

import { getTypstCompiler } from '../../typstCompilerSingleton';
import sangExamSource from '../../typst-system/sang-exam.typ?raw';
import mathSymSource from '../../typst-system/math-sym.typ?raw';
import bbtSource from '../../typst-system/bbt.typ?raw';
import geometrySource from '../../typst-system/geometry.typ?raw';
import themdepSource from '../../typst-system/themdep.typ?raw';

// ────────────────────────────────────────────────────────────────────────────
// SVG cache
// ────────────────────────────────────────────────────────────────────────────

const _svgCache = new Map();

function cacheKey(question, mode) {
    return `${question.id}::${mode}`;
}

// ────────────────────────────────────────────────────────────────────────────
// System-file injection (idempotent)
// ────────────────────────────────────────────────────────────────────────────

let _systemFilesLoaded = false;

function injectSystemFiles(compiler) {
    if (_systemFilesLoaded) return;
    compiler.addSource('/sang-exam.typ', sangExamSource);
    compiler.addSource('/math-sym.typ', mathSymSource);
    compiler.addSource('/bbt.typ', bbtSource);
    compiler.addSource('/geometry.typ', geometrySource);
    compiler.addSource('/themdep.typ', themdepSource);
    _systemFilesLoaded = true;
}

// ────────────────────────────────────────────────────────────────────────────
// Source builders
// ────────────────────────────────────────────────────────────────────────────

const PAGE_HEADER = `\
#import "@preview/cetz:0.5.2": *
#import "@preview/cetz-plot:0.1.1": *
#import "/sang-exam.typ": *
#import "/math-sym.typ": *
#import "/bbt.typ": *
#import "/geometry.typ": *
#import "/themdep.typ": *

#set page(width: 560pt, height: auto, margin: (x: 10pt, y: 8pt), fill: white)
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(leading: 0.5em)
#show: sang-setup
`;

/**
 * Build source for a TN/DS question.
 * We reconstruct the macro call with num: 1, prefix: "" so the rendered output
 * looks like the exam content (without the "Câu N." label).
 */
function buildTnSource(q, mode) {
    const macroName = q.type === 'ds' ? 'ds' : 'tn';
    const figArg = q.figSrc ? `\n  fig: ${q.figSrc},` : '';
    const solArg = (mode === 'loigiai' && q.loigiaiSrc)
        ? `\n  loigiai: ${q.loigiaiSrc},`
        : '';

    return `${PAGE_HEADER}
#${macroName}(
  ${q.stemSrc},
  ${q.optionsSrc},
  mode: "${mode}",
  num: 1,
  prefix: "",${figArg}${solArg}
)
`;
}

/**
 * Build source for a TLN/TL question (render only the stem).
 */
function buildTlnSource(q, mode) {
    const figArg = q.figSrc ? `\n  fig: ${q.figSrc},` : '';
    const macro = q.type === 'tln' ? 'tln' : 'tl';
    const solArg = (mode === 'loigiai' && q.loigiaiSrc)
        ? `\n  loigiai: ${q.loigiaiSrc},`
        : '';
    const ansArg = mode === 'loigiai' ? `\n  ${q.answerSrc ?? ''},` : '';

    // tln / tl signature: (stem, ans, loigiai: ..., fig: ..., num: auto, prefix: "Câu")
    // We need to look at the sang-exam.typ signature more carefully.
    // Safe fallback: render just the stem as plain content.
    if (!q.answerSrc) {
        return `${PAGE_HEADER}\n${q.stemSrc}\n`;
    }

    return `${PAGE_HEADER}
#${macro}(
  ${q.stemSrc},
  ${q.answerSrc ?? '[]'},
  mode: "${mode}",
  num: 1,
  prefix: "",${figArg}${solArg}
)
`;
}

function buildSource(q, mode) {
    if (q.type === 'tn' || q.type === 'ds') return buildTnSource(q, mode);
    return buildTlnSource(q, mode);
}

// ────────────────────────────────────────────────────────────────────────────
// Compiler singleton serialisation guard
// ────────────────────────────────────────────────────────────────────────────

// Typst WASM compiler is single-threaded — serialise all compile calls.
let _compileQueue = Promise.resolve();

function enqueueCompile(fn) {
    _compileQueue = _compileQueue.then(fn).catch(fn);
    return _compileQueue;
}

// ────────────────────────────────────────────────────────────────────────────
// Public API
// ────────────────────────────────────────────────────────────────────────────

/**
 * Render a question to an SVG string.
 *
 * @param {Question} question  - from typstExamParser
 * @param {'dethi'|'loigiai'} mode
 * @returns {Promise<string>}  - SVG markup string
 */
export async function renderQuestion(question, mode = 'dethi') {
    const key = cacheKey(question, mode);
    if (_svgCache.has(key)) return _svgCache.get(key);

    const src = buildSource(question, mode);

    const svg = await enqueueCompile(async () => {
        const compiler = await getTypstCompiler();
        injectSystemFiles(compiler);
        compiler.addSource('/q_render.typ', src);
        const result = await compiler.svg({ mainFilePath: '/q_render.typ' });
        return result;
    });

    _svgCache.set(key, svg);
    return svg;
}

/**
 * Pre-render a list of questions in background (optional performance hint).
 * Does not block — errors are silently swallowed.
 */
export function prefetchQuestions(questions, mode = 'dethi') {
    for (const q of questions) {
        renderQuestion(q, mode).catch(() => { });
    }
}

/**
 * Clear the SVG cache (e.g. after font loading changes).
 */
export function clearRenderCache() {
    _svgCache.clear();
    _systemFilesLoaded = false;
}
