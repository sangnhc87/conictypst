const LATEX_BEGIN_REGEX = /\\begin\s*\{\s*ex\s*\}/gi;
const LATEX_END_REGEX = /\\end\s*\{\s*ex\s*\}/gi;
const QUESTION_MARKER_REGEX = /%%--\s*Câu\s+(\d+)\s*:?\s*--%%/gi;
const PLAIN_HEADING_REGEX = /(^|\n)\s*(?:Câu|Bài|Question|Problem)\s+(\d+)\s*[:.)-]?/gi;
const ANSWER_LINE_REGEX = /(?:^|\n)\s*(?:Đáp án(?:\s*đúng)?|ĐA|Answer)\s*[:\-]\s*(.+)$/im;
const SOLUTION_LINE_REGEX = /(?:^|\n)\s*(?:Lời giải|Hướng dẫn giải|Giải thích|Solution)\s*[:.\-]?\s*/i;

export const DEFAULT_PDV3_SOURCE = String.raw`%%--Câu 1:--%%
\begin{ex}
Cho hàm số $f(x)=x^2+3x-2$. Tính đạo hàm của hàm số.
\choice
{\True $f'(x)=2x+3$}
{$f'(x)=x+3$}
{$f'(x)=2x-2$}
{$f'(x)=2x$}
\loigiai{
Áp dụng công thức $(x^n)'=nx^{n-1}$ và $(ax+b)'=a$.
}
\end{ex}

%%--Câu 2:--%%
\begin{ex}
Trong các mệnh đề sau, mệnh đề nào đúng?
\choiceTF
{\True Hàm số $y=x^2$ có đạo hàm là $y'=2x$}
{Phương trình $x^2+1=0$ có nghiệm thực}
{\True Tập nghiệm của $x^2-1=0$ là $x=\pm1$}
{Tổng hai số âm luôn dương}
\loigiai{Xét từng mệnh đề và đối chiếu kiến thức cơ bản.}
\end{ex}`;

const severityOrder = {
    error: 0,
    warning: 1,
    info: 2,
};

const normalizeSource = (value) => String(value || '')
    .replace(/\r\n?/g, '\n')
    .replace(/\u00a0/g, ' ')
    .replace(/[“”]/g, '"')
    .replace(/[‘’]/g, "'");

const preserveLineCountCommentStrip = (source) => normalizeSource(source)
    .split('\n')
    .map((line) => {
        if (/^\s*%%--/.test(line)) {
            return line;
        }

        if (/^\s*%/.test(line)) {
            return '';
        }

        return line.replace(/(^|[^\\])%.*$/, '$1');
    })
    .join('\n');

const cleanupText = (value) => String(value || '')
    .replace(/\r\n?/g, '\n')
    .replace(/\t/g, '    ')
    .replace(/[ \t]+\n/g, '\n')
    .replace(/\n{3,}/g, '\n\n')
    .trim();

const getOptionDisplayLabel = (type, index) => (
    type === 'choice'
        ? `${String.fromCharCode(65 + index)}.`
        : `${String.fromCharCode(97 + index)})`
);

const removeLatexFormatting = (value) => cleanupText(value)
    .replace(/\\textbf\{([^{}]*)\}/g, '$1')
    .replace(/\\textit\{([^{}]*)\}/g, '$1')
    .replace(/\\underline\{([^{}]*)\}/g, '$1')
    .replace(/\\True\b\s*/g, '')
    .replace(/\\False\b\s*/g, '')
    .trim();

const getLineNumberFromIndex = (source, index) => source.slice(0, Math.max(index, 0)).split('\n').length;

const sortDiagnostics = (diagnostics) => diagnostics
    .map((item, index) => ({
        id: item.id || `${item.severity}-${item.line || 1}-${index}`,
        ...item,
    }))
    .sort((left, right) => {
        const severityDiff = severityOrder[left.severity] - severityOrder[right.severity];
        if (severityDiff !== 0) {
            return severityDiff;
        }
        return (left.line || 0) - (right.line || 0);
    });

const readBalancedBlock = (text, startIndex, openChar = '{', closeChar = '}') => {
    let cursor = startIndex;
    while (cursor < text.length && /\s/.test(text[cursor])) {
        cursor += 1;
    }

    if (text[cursor] !== openChar) {
        return null;
    }

    let depth = 1;
    for (let index = cursor + 1; index < text.length; index += 1) {
        if (text[index] === '\\') {
            index += 1;
            continue;
        }

        if (text[index] === openChar) {
            depth += 1;
        } else if (text[index] === closeChar) {
            depth -= 1;
            if (depth === 0) {
                return {
                    startIndex: cursor,
                    endIndex: index,
                    content: text.slice(cursor + 1, index),
                };
            }
        }
    }

    return null;
};

const findCommand = (text, commandNames) => {
    let earliest = null;

    commandNames.forEach((commandName) => {
        const regex = new RegExp(`\\\\${commandName}\\b`, 'i');
        const match = regex.exec(text);
        if (!match) {
            return;
        }

        if (!earliest || match.index < earliest.index) {
            earliest = {
                name: commandName,
                index: match.index,
                length: match[0].length,
            };
        }
    });

    return earliest;
};

const extractCommandArguments = (text, commandNames, argumentCount, { allowOptionalBracket = false } = {}) => {
    const command = findCommand(text, commandNames);
    if (!command) {
        return null;
    }

    let cursor = command.index + command.length;
    let optionalArgument = null;

    if (allowOptionalBracket) {
        const optionalBlock = readBalancedBlock(text, cursor, '[', ']');
        if (optionalBlock && optionalBlock.startIndex === cursor + text.slice(cursor).search(/\S/)) {
            optionalArgument = optionalBlock.content;
            cursor = optionalBlock.endIndex + 1;
        }
    }

    const args = [];
    for (let count = 0; count < argumentCount; count += 1) {
        const block = readBalancedBlock(text, cursor, '{', '}');
        if (!block) {
            return null;
        }
        args.push(block.content);
        cursor = block.endIndex + 1;
    }

    return {
        name: command.name,
        start: command.index,
        end: cursor,
        args,
        optionalArgument,
    };
};

const removeRange = (text, start, end) => `${text.slice(0, start)}${text.slice(end)}`.trim();

const collectBraceDiagnostics = (source) => {
    const diagnostics = [];
    const stack = [];

    for (let index = 0; index < source.length; index += 1) {
        const currentChar = source[index];

        if (currentChar === '\\') {
            index += 1;
            continue;
        }

        if (currentChar === '{') {
            stack.push(index);
        } else if (currentChar === '}') {
            if (!stack.length) {
                diagnostics.push({
                    severity: 'error',
                    line: getLineNumberFromIndex(source, index),
                    message: 'Dư dấu đóng ngoặc nhọn `}`.',
                });
            } else {
                stack.pop();
            }
        }
    }

    stack.forEach((index) => {
        diagnostics.push({
            severity: 'error',
            line: getLineNumberFromIndex(source, index),
            message: 'Thiếu dấu đóng ngoặc nhọn `}`.',
        });
    });

    return diagnostics;
};

const collectMarkers = (source) => [...source.matchAll(QUESTION_MARKER_REGEX)].map((match) => ({
    number: Number(match[1]),
    index: match.index,
}));

const resolveQuestionNumber = (markers, blockIndex, fallbackNumber) => {
    const marker = [...markers].reverse().find((item) => item.index < blockIndex);
    return marker?.number || fallbackNumber;
};

const parseChoiceArguments = (text, commandName, labels) => {
    const command = extractCommandArguments(text, [commandName], labels.length);
    if (!command) {
        return null;
    }

    const choices = command.args.map((choiceText, index) => {
        const trimmed = cleanupText(choiceText);
        const isCorrect = /^\\True\b/i.test(trimmed);
        const normalizedText = cleanupText(trimmed.replace(/^\\True\b\s*/i, '').replace(/^\\False\b\s*/i, ''));

        return {
            label: labels[index],
            text: normalizedText,
            isCorrect,
        };
    });

    return {
        choices,
        remaining: removeRange(text, command.start, command.end),
    };
};

const parseLatexBlock = (content, line, number) => {
    const diagnostics = [];
    let working = cleanupText(content);
    let solution = '';

    const solutionCommand = extractCommandArguments(working, ['loigiai'], 1);
    if (solutionCommand) {
        solution = cleanupText(solutionCommand.args[0]);
        working = removeRange(working, solutionCommand.start, solutionCommand.end);
    } else {
        diagnostics.push({
            severity: 'info',
            line,
            message: `Câu ${number} chưa có \\loigiai{...}.`,
        });
    }

    const trueFalse = parseChoiceArguments(working, 'choiceTF', ['a', 'b', 'c', 'd']);
    if (trueFalse) {
        const correctCount = trueFalse.choices.filter((choice) => choice.isCorrect).length;
        if (correctCount === 0) {
            diagnostics.push({
                severity: 'warning',
                line,
                message: `Câu ${number} dạng đúng/sai chưa có mệnh đề nào được đánh dấu \\True.`,
            });
        }

        return {
            question: {
                number,
                line,
                type: 'choiceTF',
                stem: cleanupText(trueFalse.remaining),
                choices: trueFalse.choices,
                solution,
                answerText: trueFalse.choices.filter((choice) => choice.isCorrect).map((choice) => choice.label.toUpperCase()).join(', '),
                sourceFormat: 'latex',
            },
            diagnostics,
        };
    }

    const multipleChoice = parseChoiceArguments(working, 'choice', ['A', 'B', 'C', 'D']);
    if (multipleChoice) {
        const correctChoices = multipleChoice.choices.filter((choice) => choice.isCorrect);
        if (correctChoices.length === 0) {
            diagnostics.push({
                severity: 'warning',
                line,
                message: `Câu ${number} trắc nghiệm chưa có đáp án đúng.`,
            });
        }

        if (correctChoices.length > 1) {
            diagnostics.push({
                severity: 'warning',
                line,
                message: `Câu ${number} có nhiều hơn một đáp án đúng.`,
            });
        }

        return {
            question: {
                number,
                line,
                type: 'choice',
                stem: cleanupText(multipleChoice.remaining),
                choices: multipleChoice.choices,
                solution,
                answerText: correctChoices.map((choice) => choice.label).join(', '),
                sourceFormat: 'latex',
            },
            diagnostics,
        };
    }

    const shortAnswer = extractCommandArguments(working, ['shortans', 'sh'], 1, { allowOptionalBracket: true });
    if (shortAnswer) {
        return {
            question: {
                number,
                line,
                type: 'shortans',
                stem: cleanupText(removeRange(working, shortAnswer.start, shortAnswer.end)),
                choices: [],
                solution,
                answerText: cleanupText(shortAnswer.args[0]),
                sourceFormat: 'latex',
            },
            diagnostics,
        };
    }

    diagnostics.push({
        severity: 'warning',
        line,
        message: `Câu ${number} không có \\choice, \\choiceTF hoặc \\shortans.`,
    });

    return {
        question: {
            number,
            line,
            type: 'note',
            stem: cleanupText(working),
            choices: [],
            solution,
            answerText: '',
            sourceFormat: 'latex',
        },
        diagnostics,
    };
};

const collectLatexQuestions = (source) => {
    const diagnostics = [];
    const questions = [];
    const markers = collectMarkers(source);
    const beginMatches = [...source.matchAll(LATEX_BEGIN_REGEX)];
    const endMatches = [...source.matchAll(LATEX_END_REGEX)];

    if (beginMatches.length !== endMatches.length) {
        diagnostics.push({
            severity: 'error',
            line: 1,
            message: 'Số lượng `\\begin{ex}` và `\\end{ex}` không khớp.',
        });
    }

    beginMatches.forEach((match, index) => {
        const start = match.index;
        const endRegex = new RegExp(LATEX_END_REGEX.source, 'gi');
        endRegex.lastIndex = start + match[0].length;
        const endMatch = endRegex.exec(source);

        if (!endMatch) {
            diagnostics.push({
                severity: 'error',
                line: getLineNumberFromIndex(source, start),
                message: 'Không tìm thấy `\\end{ex}` tương ứng.',
            });
            return;
        }

        const blockContent = source.slice(start + match[0].length, endMatch.index);
        const number = resolveQuestionNumber(markers, start, index + 1);
        const line = getLineNumberFromIndex(source, start);
        const parsed = parseLatexBlock(blockContent, line, number);
        questions.push(parsed.question);
        diagnostics.push(...parsed.diagnostics);
    });

    if (!questions.length) {
        diagnostics.push({
            severity: 'warning',
            line: 1,
            message: 'Không tách được câu hỏi LaTeX nào từ nguồn hiện tại.',
        });
    }

    return { questions, diagnostics };
};

const collectPlainOptions = (content) => {
    const optionRegex = /(^|\n)\s*([A-Da-d])([.)\:])\s+([\s\S]*?)(?=(?:\n\s*[A-Da-d][.)\:]\s+)|$)/g;

    return [...content.matchAll(optionRegex)].map((match) => ({
        label: match[2],
        text: cleanupText(match[4]),
        isCorrect: false,
        start: match.index + match[1].length,
    }));
};

const normalizeAnswerValue = (answerText, options) => {
    const cleaned = cleanupText(answerText).toUpperCase();
    if (!cleaned) {
        return { letters: [], booleans: null, raw: '' };
    }

    const letters = [...cleaned.matchAll(/[A-D]/g)].map((match) => match[0]);
    if (letters.length) {
        return { letters, booleans: null, raw: cleaned };
    }

    const compact = cleaned.replace(/[^A-ZĐSTF]/g, '');
    const boolTokens = compact.split('').filter((token) => /[ĐSTF]/.test(token));
    if (boolTokens.length === options.length) {
        return {
            letters: [],
            booleans: boolTokens.map((token) => token === 'Đ' || token === 'T'),
            raw: cleaned,
        };
    }

    return { letters: [], booleans: null, raw: cleaned };
};

const parsePlainBlock = ({ content, number, line }) => {
    const diagnostics = [];
    let working = cleanupText(content);
    let solution = '';
    let answerText = '';

    const solutionIndex = working.search(SOLUTION_LINE_REGEX);
    if (solutionIndex >= 0) {
        const solutionMatch = SOLUTION_LINE_REGEX.exec(working.slice(solutionIndex));
        if (solutionMatch) {
            solution = cleanupText(working.slice(solutionIndex + solutionMatch[0].length));
            working = cleanupText(working.slice(0, solutionIndex));
        }
    }

    const answerMatch = working.match(ANSWER_LINE_REGEX);
    if (answerMatch) {
        answerText = cleanupText(answerMatch[1]);
        working = cleanupText(working.replace(ANSWER_LINE_REGEX, ''));
    }

    const options = collectPlainOptions(working);

    if (options.length === 4) {
        const stem = cleanupText(working.slice(0, options[0].start));
        const normalizedAnswer = normalizeAnswerValue(answerText, options);
        const isTrueFalse = /^[a-d]{4}$/i.test(options.map((option) => option.label).join('')) || Boolean(normalizedAnswer.booleans);

        const normalizedChoices = options.map((option, index) => ({
            label: isTrueFalse ? String.fromCharCode(97 + index) : option.label.toUpperCase(),
            text: option.text,
            isCorrect: normalizedAnswer.booleans ? normalizedAnswer.booleans[index] : normalizedAnswer.letters.includes(option.label.toUpperCase()),
        }));

        if (!answerText) {
            diagnostics.push({
                severity: 'warning',
                line,
                message: `Câu ${number} chưa có dòng đáp án.`,
            });
        }

        return {
            question: {
                number,
                line,
                type: isTrueFalse ? 'choiceTF' : 'choice',
                stem,
                choices: normalizedChoices,
                solution,
                answerText,
                sourceFormat: 'plain',
            },
            diagnostics,
        };
    }

    if (answerText) {
        return {
            question: {
                number,
                line,
                type: 'shortans',
                stem: working,
                choices: [],
                solution,
                answerText,
                sourceFormat: 'plain',
            },
            diagnostics,
        };
    }

    diagnostics.push({
        severity: 'info',
        line,
        message: `Khối Câu ${number} được hiểu là văn bản thường.`,
    });

    return {
        question: {
            number,
            line,
            type: 'note',
            stem: working,
            choices: [],
            solution,
            answerText: '',
            sourceFormat: 'plain',
        },
        diagnostics,
    };
};

const collectPlainQuestions = (source) => {
    const diagnostics = [];
    const matches = [...source.matchAll(PLAIN_HEADING_REGEX)];
    const questions = [];

    if (!matches.length) {
        const fallback = cleanupText(source);
        if (!fallback) {
            return { questions: [], diagnostics };
        }

        const parsed = parsePlainBlock({
            content: fallback,
            number: 1,
            line: 1,
        });
        questions.push(parsed.question);
        diagnostics.push({
            severity: 'info',
            line: 1,
            message: 'Không thấy đầu mục `Câu ...`, hệ thống xem toàn bộ như một khối nội dung.',
        });
        diagnostics.push(...parsed.diagnostics);
        return { questions, diagnostics };
    }

    matches.forEach((match, index) => {
        const start = match.index + match[1].length;
        const end = index < matches.length - 1 ? matches[index + 1].index : source.length;
        const headingMatch = /(?:Câu|Bài|Question|Problem)\s+(\d+)/i.exec(match[0]);
        const number = Number(headingMatch?.[1] || index + 1);
        const block = source.slice(start, end).replace(/^(?:Câu|Bài|Question|Problem)\s+\d+\s*[:.)-]?/i, '');
        const line = getLineNumberFromIndex(source, start);
        const parsed = parsePlainBlock({ content: block, number, line });
        questions.push(parsed.question);
        diagnostics.push(...parsed.diagnostics);
    });

    return { questions, diagnostics };
};

export const summarizePdv3Questions = (questions = [], diagnostics = []) => ({
    total: questions.length,
    choice: questions.filter((question) => question.type === 'choice').length,
    choiceTF: questions.filter((question) => question.type === 'choiceTF').length,
    shortans: questions.filter((question) => question.type === 'shortans').length,
    note: questions.filter((question) => question.type === 'note').length,
    errors: diagnostics.filter((item) => item.severity === 'error').length,
    warnings: diagnostics.filter((item) => item.severity === 'warning').length,
});

export const parsePdv3Source = (rawSource) => {
    const source = preserveLineCountCommentStrip(rawSource);
    const diagnostics = [...collectBraceDiagnostics(source)];
    const looksLatex = /\\begin\s*\{\s*ex\s*\}|\\choice(?:TF)?\b|\\shortans\b|\\loigiai\b/i.test(source);

    const parsed = looksLatex ? collectLatexQuestions(source) : collectPlainQuestions(source);
    diagnostics.push(...parsed.diagnostics);

    return {
        inputMode: looksLatex ? 'latex' : 'plain',
        questions: parsed.questions,
        diagnostics: sortDiagnostics(diagnostics),
        normalizedSource: source,
    };
};

export const autoFixPdv3Source = (rawSource) => normalizeSource(rawSource)
    .replace(/[ \t]+$/gm, '')
    .replace(/%%\s*--\s*Câu\s+(\d+)\s*:?\s*--\s*%%/gi, '%%--Câu $1:--%%')
    .replace(/\\begin\s*\{\s*ex\s*\}/gi, '\\begin{ex}')
    .replace(/\\end\s*\{\s*ex\s*\}/gi, '\\end{ex}')
    .replace(/\\choice\s*TF/gi, '\\choiceTF')
    .replace(/\\loigiai\s*\{/gi, '\\loigiai{')
    .replace(/\\shortans\s*\{/gi, '\\shortans{')
    .replace(/(^|\n)\s*[•●▪]\s*([A-Da-d][.)\:])/g, '$1$2')
    .replace(/\n{3,}/g, '\n\n')
    .trim();

const buildLatexChoiceBlock = (question) => {
    if (question.type === 'choice') {
        return [
            '\\choice',
            ...question.choices.map((choice) => `{${choice.isCorrect ? '\\True ' : ''}${choice.text}}`),
        ];
    }

    if (question.type === 'choiceTF') {
        return [
            '\\choiceTF',
            ...question.choices.map((choice) => `{${choice.isCorrect ? '\\True ' : ''}${choice.text}}`),
        ];
    }

    if (question.type === 'shortans') {
        return [`\\shortans{${question.answerText || ''}}`];
    }

    return [];
};

export const convertPlainTextToEx = (rawSource) => {
    const fixedSource = autoFixPdv3Source(rawSource);
    const parsed = collectPlainQuestions(fixedSource);

    if (!parsed.questions.length) {
        return {
            content: fixedSource,
            diagnostics: [{ severity: 'warning', line: 1, message: 'Không có khối văn bản nào để chuyển sang chuẩn ex.' }],
        };
    }

    const content = parsed.questions.map((question, index) => {
        const lines = [
            `%%--Câu ${question.number || index + 1}:--%%`,
            '\\begin{ex}',
            question.stem || '',
            ...buildLatexChoiceBlock(question),
            `\\loigiai{${question.solution || ''}}`,
            '\\end{ex}',
        ].filter(Boolean);

        return lines.join('\n');
    }).join('\n\n');

    return {
        content,
        diagnostics: sortDiagnostics(parsed.diagnostics),
    };
};

const buildPlainAnswerLine = (question) => {
    if (question.type === 'choice') {
        const answers = question.choices
            .filter((choice) => choice.isCorrect)
            .map((choice, index) => choice.label || getOptionDisplayLabel('choice', index))
            .map((label) => `${String(label).toUpperCase().replace(/[.)]$/, '')}.`)
            .join(', ');
        return answers ? `Đáp án: ${answers}` : '';
    }

    if (question.type === 'choiceTF') {
        const answers = question.choices
            .map((choice, index) => `${getOptionDisplayLabel('choiceTF', index)} ${choice.isCorrect ? 'Đ' : 'S'}`)
            .join(', ');
        return answers ? `Đáp án: ${answers}` : '';
    }

    if (question.type === 'shortans') {
        return question.answerText ? `Đáp án: ${question.answerText}` : '';
    }

    return '';
};

export const convertExToPlainText = (rawSource) => {
    const parsed = parsePdv3Source(rawSource);

    if (!parsed.questions.length) {
        return {
            content: cleanupText(rawSource),
            diagnostics: parsed.diagnostics,
        };
    }

    const content = parsed.questions.map((question, index) => {
        const lines = [
            `Câu ${question.number || index + 1}:`,
            removeLatexFormatting(question.stem),
        ];

        if (question.type === 'choice' || question.type === 'choiceTF') {
            question.choices.forEach((choice, choiceIndex) => {
                const label = getOptionDisplayLabel(question.type, choiceIndex);
                lines.push(`${label} ${removeLatexFormatting(choice.text)}`);
            });
        }

        const answerLine = buildPlainAnswerLine(question);
        if (answerLine) {
            lines.push(answerLine);
        }

        if (question.solution) {
            lines.push('Lời giải:');
            lines.push(removeLatexFormatting(question.solution));
        }

        return lines.filter(Boolean).join('\n');
    }).join('\n\n');

    return {
        content,
        diagnostics: parsed.diagnostics,
    };
};