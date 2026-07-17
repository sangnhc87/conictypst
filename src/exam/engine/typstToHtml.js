/**
 * typstToHtml.js
 *
 * Converts a Typst content string (as parsed from #tn / #ds / #tln / #tl
 * arguments) into an array of renderable tokens for use with KaTeX:
 *
 *   { type: 'text',        html: string }
 *   { type: 'inlineMath',  latex: string, raw: string }
 *   { type: 'displayMath', latex: string, raw: string }
 *
 * No WASM required — renders instantly in-browser.
 */

// ─── Typst math → LaTeX ──────────────────────────────────────────────────────

const GREEK = [
    'alpha','beta','gamma','delta','epsilon','zeta','eta','theta',
    'iota','kappa','lambda','mu','nu','xi','pi','rho','sigma',
    'tau','upsilon','phi','chi','psi','omega',
    'Gamma','Delta','Theta','Lambda','Xi','Pi','Sigma','Upsilon','Phi','Psi','Omega',
    'varepsilon','varphi','vartheta','varrho','varpi',
];

const MATH_FNS = [
    'sin','cos','tan','cot','sec','csc','arcsin','arccos','arctan','arccot',
    'sinh','cosh','tanh','coth',
    'ln','log','exp','lg',
    'max','min','sup','inf',
    'gcd','lcm','det','deg','dim','ker','rank',
    'Pr',
];

// ─── Utility: read balanced brackets ─────────────────────────────────────────

/**
 * Find the matching close bracket for the opening bracket at src[start].
 * Returns the index AFTER the close bracket, or -1 on failure.
 */
function findClose(src, start) {
    const CLOSE = { '(': ')', '[': ']', '{': '}' };
    const open  = src[start];
    const close = CLOSE[open];
    if (!close) return start + 1;

    let depth = 1;
    let i = start + 1;
    while (i < src.length && depth > 0) {
        if      (src[i] === open)  { depth++; i++; }
        else if (src[i] === close) { depth--; i++; }
        else                       { i++; }
    }
    return depth === 0 ? i : -1;
}

/**
 * Apply a one-argument Typst function like  sqrt(...)  to LaTeX.
 * Handles nested parens properly.
 */
function replaceOneArgFn(s, typstName, latexCmd) {
    const prefix = typstName + '(';
    let result = '';
    let i = 0;
    while (i < s.length) {
        const idx = s.indexOf(prefix, i);
        if (idx === -1) { result += s.slice(i); break; }
        // Make sure it's a word boundary (not e.g. "arcsin" matching "sin")
        if (idx > 0 && /\w/.test(s[idx - 1])) { result += s.slice(i, idx + 1); i = idx + 1; continue; }
        result += s.slice(i, idx);
        const parenStart = idx + typstName.length;
        const parenEnd   = findClose(s, parenStart);
        if (parenEnd === -1) { result += s.slice(idx); i = s.length; break; }
        const inner = s.slice(parenStart + 1, parenEnd - 1);
        result += `${latexCmd}{${inner}}`;
        i = parenEnd;
    }
    return result;
}

/**
 * Convert Typst frac(num, denom)  →  \dfrac{num}{denom}
 * Also handles display-math  frac  without parens used as infix: a/b handled separately.
 */
function replaceFracName(s, name, command) {
    let result = '';
    let i = 0;
    const prefix = name + '(';
    while (i < s.length) {
        const idx = s.indexOf(prefix, i);
        if (idx === -1) { result += s.slice(i); break; }
        // Word boundary check
        if (idx > 0 && /\w/.test(s[idx - 1])) { result += s.slice(i, idx + 1); i = idx + 1; continue; }
        result += s.slice(i, idx);
        const parenStart = idx + name.length; // index of '('
        const parenEnd   = findClose(s, parenStart);
        if (parenEnd === -1) { result += s.slice(idx); i = s.length; break; }
        // Inner: split by top-level comma
        const inner = s.slice(parenStart + 1, parenEnd - 1);
        const parts = splitTopLevel(inner, ',');
        if (parts.length >= 2) {
            result += `${command}{${parts[0].trim()}}{${parts[1].trim()}}`;
        } else {
            result += `${command}{${inner}}{}`;
        }
        i = parenEnd;
    }
    return result;
}

function replaceFrac(s) {
    s = replaceFracName(s, 'dfrac', '\\dfrac');
    s = replaceFracName(s, 'tfrac', '\\tfrac');
    return replaceFracName(s, 'frac', '\\dfrac');
}

function replaceRoot(s) {
    let result = '';
    let i = 0;
    while (i < s.length) {
        const idx = s.indexOf('root(', i);
        if (idx === -1) { result += s.slice(i); break; }
        result += s.slice(i, idx);
        const end = findClose(s, idx + 4);
        if (end === -1) { result += s.slice(idx); break; }
        const parts = splitTopLevel(s.slice(idx + 5, end - 1), ',');
        result += parts.length >= 2
            ? `\\sqrt[${parts[0].trim()}]{${parts.slice(1).join(',').trim()}}`
            : `\\sqrt{${parts[0]?.trim() || ''}}`;
        i = end;
    }
    return result;
}

function replaceLr(s) {
    let result = '';
    let i = 0;
    while (i < s.length) {
        const idx = s.indexOf('lr(', i);
        if (idx === -1) { result += s.slice(i); break; }
        result += s.slice(i, idx);
        const end = findClose(s, idx + 2);
        if (end === -1) { result += s.slice(idx); break; }
        const inner = s.slice(idx + 3, end - 1).trim();
        if (inner.endsWith('|')) result += `\\left.${inner.slice(0, -1)}\\right|`;
        else if (inner.startsWith('|')) result += `\\left|${inner.slice(1)}\\right.`;
        else result += `\\left(${inner}\\right)`;
        i = end;
    }
    return result;
}

/**
 * Split string by `sep` at depth 0 (ignoring brackets).
 */
function splitTopLevel(s, sep) {
    const parts = [];
    let depth = 0, start = 0;
    let quote = '';
    for (let i = 0; i < s.length; i++) {
        const ch = s[i];
        if (quote) {
            if (ch === '\\') i++;
            else if (ch === quote) quote = '';
            continue;
        }
        if (ch === '"' || ch === "'") { quote = ch; continue; }
        if ('([{'.includes(ch)) depth++;
        else if (')]}'.includes(ch)) depth--;
        else if (ch === sep && depth === 0) {
            parts.push(s.slice(start, i));
            start = i + 1;
        }
    }
    parts.push(s.slice(start));
    return parts;
}

function splitCaseRows(inner) {
    return splitTopLevel(inner, ',')
        .flatMap(part => splitTopLevel(part, ';'))
        .map(part => part.trim())
        .filter(Boolean);
}

/**
 * Convert balanced Typst cases/heva/hoac calls. Work from the innermost call
 * so nested systems and functions in a row stay valid.
 */
function replaceCaseFunction(source, name, kind) {
    const prefix = `${name}(`;
    let result = source;
    while (true) {
        const start = result.lastIndexOf(prefix);
        if (start < 0) break;
        if (start > 0 && /[\w.-]/u.test(result[start - 1])) break;
        const open = start + name.length;
        const end = findClose(result, open);
        if (end < 0) break;
        const rows = splitCaseRows(result.slice(open + 1, end - 1));
        const body = rows.join(' \\\\ ');
        const latex = kind === 'or'
            ? `\\left[\\begin{array}{l} ${body} \\end{array}\\right.`
            : `\\begin{cases} ${body} \\end{cases}`;
        result = `${result.slice(0, start)}${latex}${result.slice(end)}`;
    }
    return result;
}

function replaceCaseFunctions(source) {
    let result = replaceCaseFunction(source, 'cases', 'system');
    result = replaceCaseFunction(result, 'heva', 'system');
    return replaceCaseFunction(result, 'hoac', 'or');
}

/**
 * Convert Typst math source to LaTeX that KaTeX can render.
 */
export function typstMathToLatex(s) {
    // ── 0. Strip outer Typst display block markers (leading/trailing newline) ──
    s = s.trim();

    // ── 1. Number sets ────────────────────────────────────────────────────────
    s = s.replace(/\bRR\b/g, '\\mathbb{R}');
    s = s.replace(/\bNN\b/g, '\\mathbb{N}');
    s = s.replace(/\bZZ\b/g, '\\mathbb{Z}');
    s = s.replace(/\bQQ\b/g, '\\mathbb{Q}');
    s = s.replace(/\bCC\b/g, '\\mathbb{C}');
    s = s.replace(/\bHH\b/g, '\\mathbb{H}');

    // ── 2. Arrow sequences (longest first) ───────────────────────────────────
    s = s.replace(/arrow\.l\.r\.l\b/g,  '\\leftrightarrow');
    s = s.replace(/arrow\.r\.l\.r\b/g,  '\\leftrightarrow');
    s = s.replace(/arrow\.l\.r\b/g,     '\\leftrightarrow');
    s = s.replace(/arrow\.r\.l\b/g,     '\\leftrightarrow');
    s = s.replace(/arrow\.l\.l\b/g,     '\\Leftarrow');
    s = s.replace(/arrow\.r\.r\b/g,     '\\Rightarrow');
    s = s.replace(/arrow\.r\b/g,        '\\rightarrow');
    s = s.replace(/arrow\.l\b/g,        '\\leftarrow');
    s = s.replace(/arrow\.t\b/g,        '\\uparrow');
    s = s.replace(/arrow\.b\b/g,        '\\downarrow');
    s = s.replace(/<->/g,               '\\leftrightarrow');
    s = s.replace(/(?<!<|=)->/g,        '\\to');
    s = s.replace(/<-(?!>)/g,           '\\leftarrow');
    s = s.replace(/<=>/g,               '\\Leftrightarrow');
    s = s.replace(/==>/g,               '\\Rightarrow');
    s = s.replace(/(?<!<)=>/g,          '\\Rightarrow');

    // ── 3. Relation operators ─────────────────────────────────────────────────
    s = s.replace(/!=/g,    '\\neq');
    s = s.replace(/~=/g,    '\\approx');
    s = s.replace(/<=/g,    '\\leq');
    s = s.replace(/>=/g,    '\\geq');

    // ── 4. Named calculus / logic operators ───────────────────────────────────
    s = s.replace(/\bintegral(?![a-zA-Z])/g,  '\\int');
    s = s.replace(/\bsum(?![a-zA-Z])/g,        '\\sum');
    s = s.replace(/\bproduct(?![a-zA-Z])/g,    '\\prod');
    s = s.replace(/\blim(?![a-zA-Z])/g,        '\\lim');
    s = s.replace(/\bdif\b/g,                  '\\,\\mathrm{d}');
    s = s.replace(/\binfinity\b/g,             '\\infty');
    s = s.replace(/(?<!\\)\binfty\b/g,         '\\infty');
    s = s.replace(/(?<!\\)\binf(?![a-zA-Z])/g, '\\infty');
    s = s.replace(/\bapprox\b/g,              '\\approx');
    s = s.replace(/\bsim\b/g,                 '\\sim');
    s = s.replace(/\bplus\.minus\b/g,         '\\pm');
    s = s.replace(/\bminus\.plus\b/g,         '\\mp');
    s = s.replace(/(?<!\\)\bpm\b/g,           '\\pm');
    s = s.replace(/(?<!\\)\bmp\b/g,           '\\mp');
    s = s.replace(/(?<!\\)\bdot\b/g,          '\\cdot');
    s = s.replace(/(?<!\\)\btimes\b/g,        '\\times');
    s = s.replace(/(?<!\\)\bdiv\b/g,          '\\div');
    s = s.replace(/(?<!\\)\bslash\b/g,        '/');
    s = s.replace(/(?<!\\)\bcirc\b/g,         '\\circ');
    s = s.replace(/(?<!\\)%/g,                 '\\%');
    s = s.replace(/(?<!\\)\bperp\b/g,         '\\perp');
    s = s.replace(/(?<!\\)\bparallel\b/g,     '\\parallel');
    s = s.replace(/(?<!\\)\bangle\b/g,        '\\angle');
    // degree: handle both standalone and after ^ — must do BEFORE superscript group conversion
    s = s.replace(/\^degree\b/g,  '^{\\circ}');
    s = s.replace(/(?<![\^{\\])\bdegree\b/g, '^{\\circ}');

    // ── 5. Dots / ellipsis ────────────────────────────────────────────────────
    s = s.replace(/\bdots\.h\b/g,    '\\ldots');
    s = s.replace(/\bdots\.v\b/g,    '\\vdots');
    s = s.replace(/\bdots\.c\b/g,    '\\cdots');
    s = s.replace(/\bdots\b/g,       '\\ldots');
    s = s.replace(/\.\.\./g,         '\\ldots');

    // ── 6. Set operators ──────────────────────────────────────────────────────
    s = s.replace(/\bunion\b/g,      '\\cup');
    s = s.replace(/\bintersect\b/g,  '\\cap');
    s = s.replace(/\bsect\b/g,       '\\cap');
    s = s.replace(/\bemptyset\b/g,   '\\emptyset');
    s = s.replace(/\bsubset\.eq\b/g, '\\subseteq');
    s = s.replace(/\bsupset\.eq\b/g, '\\supseteq');
    s = s.replace(/\bsubset\b/g,     '\\subset');
    s = s.replace(/\bsupset\b/g,     '\\supset');
    s = s.replace(/\bnin\b/g,        '\\notin');

    // ── 7. Logic ──────────────────────────────────────────────────────────────
    s = s.replace(/\bnot\b/g,        '\\lnot');
    s = s.replace(/\band\b/g,        '\\land');
    s = s.replace(/\bor\b/g,         '\\lor');
    s = s.replace(/\bforall\b/g,     '\\forall');
    s = s.replace(/\bexists\b/g,     '\\exists');
    s = s.replace(/\bin\b/g,         '\\in');

    // ── 8. Math functions ─────────────────────────────────────────────────────
    for (const fn of MATH_FNS) {
        s = s.replace(new RegExp(`(?<!\\\\)\\b${fn}\\b`, 'g'), `\\${fn}`);
    }

    // ── 9. Greek letters ──────────────────────────────────────────────────────
    for (const g of GREEK) {
        s = s.replace(new RegExp(`(?<!\\\\)\\b${g}\\b`, 'g'), `\\${g}`);
    }

    // ── 10. Typst math functions → LaTeX commands ─────────────────────────────
    // frac(num, denom) — handle BEFORE other one-arg fns
    s = replaceFrac(s);
    s = replaceRoot(s);
    s = replaceLr(s);

    // One-argument functions with balanced-parens support
    const oneArgFns = [
        ['overline',  '\\overline'],
        ['underline', '\\underline'],
        ['widehat',   '\\widehat'],
        ['widetilde', '\\widetilde'],
        ['vec',       '\\vec'],
        ['vect',      '\\overrightarrow'],
        ['arrow',     '\\overrightarrow'],
        ['hat',       '\\hat'],
        ['tilde',     '\\tilde'],
        ['bar',       '\\bar'],
        ['bold',      '\\mathbf'],
        ['upright',   '\\mathrm'],
        ['italic',    '\\mathit'],
        ['cal',       '\\mathcal'],
        ['frak',      '\\mathfrak'],
        ['sans',      '\\mathsf'],
        ['mono',      '\\mathtt'],
        ['sqrt',      '\\sqrt'],
        ['floor',     '\\lfloor \\rfloor'],  // handled separately below
        ['ceil',      '\\lceil \\rceil'],
    ];
    for (const [typst, latex] of oneArgFns) {
        if (typst === 'floor' || typst === 'ceil') continue; // special below
        s = replaceOneArgFn(s, typst, latex);
    }

    // abs / norm / floor / ceil with proper delimiters
    s = replaceOneArgFn(s, 'abs',   '\\left|');  // hack: handled inline
    // Undo the hack and do it properly:
    s = s.replace(/\\left\|\{([^{}]*)\}/g, '\\left|$1\\right|');

    s = s.replace(/\bfloor\(([^()]*(?:\([^()]*\)[^()]*)*)\)/g, '\\lfloor $1 \\rfloor');
    s = s.replace(/\bceil\(([^()]*(?:\([^()]*\)[^()]*)*)\)/g,  '\\lceil $1 \\rceil');
    s = s.replace(/\bnorm\(([^()]*(?:\([^()]*\)[^()]*)*)\)/g,  '\\left\\|$1\\right\\|');
    s = s.replace(/\blimits\(([^()]*(?:\([^()]*\)[^()]*)*)\)/g, '$1\\limits');
    s = s.replace(/\bop\("([^"]+)"\)/g,    '\\operatorname{$1}');

    // text(...)[content] or text("raw")
    s = s.replace(/\btext\s*\([^)]*\)\s*\[([^\]]*)\]/g, '\\text{$1}');
    s = s.replace(/\btext\s*\(\s*"([^"]*)"\s*\)/g,       '\\text{$1}');
    s = s.replace(/\btext\s*\(([^)]*)\)/g,                '\\text{$1}');

    // mat(a, b; c, d) → pmatrix
    s = s.replace(/\bmat\(([^)]*)\)/g, (_, inner) => {
        const rows = inner.split(';').map(row =>
            row.split(',').map(c => c.trim()).join(' & ')
        ).join(' \\\\ ');
        return `\\begin{pmatrix} ${rows} \\end{pmatrix}`;
    });

    // cases/heva use a left brace; hoac uses a left square bracket. The
    // balanced parser accepts comma/semicolon rows and nested parentheses.
    s = replaceCaseFunctions(s);

    // ── 11. Typst decimal comma: 8","1 → 8{,}1 (Vietnamese notation) ─────────
    // Must do BEFORE subscript/superscript group conversion
    s = s.replace(/"(,)"/g, '{,}');           // explicit Typst comma  ","  in math
    s = s.replace(/(\d),(?=\d)/g, '$1{,}');   // bare 8,1 style

    // ── 12. Convert Typst subscript/superscript groups _(expr) → _{expr} ─────
    s = s.replace(/([_^])\(([^()]*(?:\([^()]*\)[^()]*)*)\)/g, (_, op, inner) => `${op}{${inner}}`);

    // ── 13. Fractions a/b → \frac{a}{b} ─────────────────────────────────────
    s = convertFractions(s);

    // ── 14. Normalise multi-line display math into single line ─────────────────
    s = s.replace(/\n+\s*/g, ' ');

    // ── 15. Wrap in \displaystyle ─────────────────────────────────────────────
    return `{\\displaystyle ${s}}`;
}

/**
 * Convert Typst fraction syntax  a/b  →  \frac{a}{b}
 * Handles parenthesised groups and atom tokens (including those with ^ _).
 * Multi-pass so nested fractions resolve correctly.
 */
function convertFractions(s) {
    // atom = backslash command or word chars with possible sub/sup, optionally wrapped in { }
    const atomPat = '(?:\\\\[a-zA-Z]+(?:\\{[^{}]*\\})?|\\{[^{}]*\\}|[\\w.]+)(?:[_^](?:\\{[^{}]*\\}|[\\w\\\\]+))*';

    for (let pass = 0; pass < 6; pass++) {
        const before = s;
        // (no inner parens) / (no inner parens)
        s = s.replace(/\(([^()]*)\)\s*\/\s*\(([^()]*)\)/g, (_, n, d) => `\\dfrac{${n}}{${d}}`);
        // (no inner parens) / atom
        s = s.replace(new RegExp(`\\(([^()]*)\\)\\s*\\/\\s*(${atomPat})`, 'g'),
            (_, n, d) => `\\dfrac{${n}}{${d}}`);
        // atom / (no inner parens)
        s = s.replace(new RegExp(`(${atomPat})\\s*\\/\\s*\\(([^()]*)\\)`, 'g'),
            (_, n, d) => `\\dfrac{${n}}{${d}}`);
        // atom / atom
        s = s.replace(new RegExp(`(${atomPat})\\s*\\/\\s*(${atomPat})`, 'g'),
            (_, n, d) => `\\dfrac{${n}}{${d}}`);
        if (s === before) break;
    }
    return s;
}

// ─── Content block helpers ────────────────────────────────────────────────────

/**
 * Strip the outer [ … ] wrapper from a Typst content block argument.
 * e.g. "[Cho hàm số $f(x)$]" → "Cho hàm số $f(x)$"
 */
export function stripBlock(src) {
    if (!src) return '';
    const s = src.trim();
    if (s.startsWith('[') && s.endsWith(']')) return s.slice(1, -1).trim();
    return s;
}

// ─── Text-segment processing ──────────────────────────────────────────────────

/**
 * Convert a plain-text segment (no $ math) to safe HTML.
 * Handles basic Typst content markup.
 */
function textToHtml(text) {
    if (!text) return '';

    // Escape HTML
    let h = text
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;');

    // Typst bold *text*
    h = h.replace(/\*([^*\n]+)\*/g, '<strong>$1</strong>');

    // Typst inline layout commands
    h = h.replace(/#linebreak\(\)/g,  '<br/>');
    h = h.replace(/#parbreak\(\)/g,   '<br/><br/>');
    h = h.replace(/#h\([^)]+\)/g,     '\u2002');   // en space
    h = h.replace(/#v\([^)]+\)/g,     '');
    h = h.replace(/#emph\[([^\]]*)\]/g,     '<em>$1</em>');
    h = h.replace(/#strong\[([^\]]*)\]/g,   '<strong>$1</strong>');
    h = h.replace(/#underline\[([^\]]*)\]/g,'<u>$1</u>');

    // #text(...)[content] and #text("raw")
    h = h.replace(/#text\([^)]*\)\[([^\]]*)\]/g, '$1');
    h = h.replace(/#text\([^)]*\)/g, '');

    // #ppgiai[...] solution wrapper — strip the call, keep inner via nested parse
    h = h.replace(/#ppgiai\[/g, '');

    // Strip remaining #command(args)[block] then #command(args) then #command
    h = h.replace(/#[a-zA-Z_][a-zA-Z0-9_.-]*\s*\([^)]*\)\s*\[[^\]]*\]/g, '');
    h = h.replace(/#[a-zA-Z_][a-zA-Z0-9_.-]*\s*\([^)]*\)/g, '');
    h = h.replace(/#[a-zA-Z_][a-zA-Z0-9_.-]*/g, '');

    // Collapse closing brackets left over from stripped blocks
    h = h.replace(/^\s*\]\s*/gm, '');

    // Newlines → paragraph breaks
    h = h.replace(/\n\n+/g, '<br/>');
    h = h.replace(/\n/g, ' ');

    return h;
}

// ─── Tokeniser ────────────────────────────────────────────────────────────────

/**
 * Tokenise a Typst content string (outer brackets already stripped).
 * Returns Array<{ type, html? | latex?, raw? }>
 *
 * Strategy: split on '$' boundaries.
 *   Even indices  → text segments
 *   Odd  indices  → math segments; display when raw has leading whitespace.
 */
export function tokenizeContent(content) {
    if (!content) return [];

    const tokens = [];
    const parts = content.split('$');

    for (let i = 0; i < parts.length; i++) {
        if (i % 2 === 0) {
            // Text
            const html = textToHtml(parts[i]);
            if (html.trim()) tokens.push({ type: 'text', html });
        } else {
            // Math: display when raw has leading whitespace
            const raw = parts[i];
            const isDisplay = /^[\s\n]/.test(raw) || /[\s\n]$/.test(raw);
            const trimmed = raw.trim();
            if (!trimmed) continue;
            let latex;
            try {
                latex = typstMathToLatex(trimmed);
            } catch (e) {
                latex = trimmed;
            }
            tokens.push({ type: isDisplay ? 'displayMath' : 'inlineMath', latex, raw: trimmed });
        }
    }

    return tokens;
}

/**
 * Full pipeline: strip outer block brackets → tokenise.
 * @param {string} contentSrc  Raw Typst content src, e.g. "[Cho $x > 0$]"
 * @returns {Array}
 */
export function parseTypstContent(contentSrc) {
    if (!contentSrc) return [];
    return tokenizeContent(stripBlock(contentSrc));
}
