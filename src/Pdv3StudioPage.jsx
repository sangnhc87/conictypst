import React, { startTransition, useDeferredValue, useEffect, useRef, useState } from 'react';
import clsx from 'clsx';
import { BlockMath, InlineMath } from 'react-katex';
import 'katex/dist/katex.min.css';
import { toast } from 'sonner';
import {
    FiAlertCircle,
    FiAlertTriangle,
    FiArrowRight,
    FiCheckCircle,
    FiClipboard,
    FiCode,
    FiDownload,
    FiExternalLink,
    FiFileText,
    FiLayers,
    FiRefreshCw,
    FiRepeat,
    FiTool,
    FiZap,
} from 'react-icons/fi';
import AppButton from './components/shared/AppButton';
import {
    autoFixPdv3Source,
    convertExToPlainText,
    convertPlainTextToEx,
    DEFAULT_PDV3_SOURCE,
    parsePdv3Source,
    summarizePdv3Questions,
} from './pdv3Studio';

const splitTextAndMath = (text) => {
    const source = String(text || '');
    const regex = /(\$\$[\s\S]+?\$\$|\\\[[\s\S]+?\\\]|\\\([\s\S]+?\\\)|\$[^$\n]+\$)/g;
    const segments = [];
    let lastIndex = 0;
    let match;

    while ((match = regex.exec(source)) !== null) {
        if (match.index > lastIndex) {
            segments.push({ type: 'text', value: source.slice(lastIndex, match.index) });
        }

        const raw = match[0];
        const displayMode = raw.startsWith('$$') || raw.startsWith('\\[');
        const math = raw
            .replace(/^\$\$|\$\$$/g, '')
            .replace(/^\$|\$$/g, '')
            .replace(/^\\\[|\\\]$/g, '')
            .replace(/^\\\(|\\\)$/g, '')
            .trim();

        segments.push({ type: 'math', value: math, displayMode });
        lastIndex = regex.lastIndex;
    }

    if (lastIndex < source.length) {
        segments.push({ type: 'text', value: source.slice(lastIndex) });
    }

    return segments;
};

const splitTextMathAndImages = (text, typstMap) => {
    let segments = [{ type: 'raw', value: text || '' }];

    if (typstMap) {
        for (const [code, imgData] of typstMap.entries()) {
            const newSegments = [];
            for (const seg of segments) {
                if (seg.type !== 'raw') {
                    newSegments.push(seg);
                    continue;
                }
                const parts = seg.value.split(code);
                for (let i = 0; i < parts.length; i++) {
                    if (parts[i]) newSegments.push({ type: 'raw', value: parts[i] });
                    if (i < parts.length - 1) newSegments.push({ type: 'image', imgData, code });
                }
            }
            segments = newSegments;
        }
    }

    const finalSegments = [];
    for (const seg of segments) {
        if (seg.type === 'raw') {
            finalSegments.push(...splitTextAndMath(seg.value));
        } else {
            finalSegments.push(seg);
        }
    }
    return finalSegments;
};

const escapeHtml = (value) => String(value || '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');

const formatTextFragment = (value) => escapeHtml(String(value || ''))
    .replace(/\\textbf\{([^{}]*)\}/g, '<strong>$1</strong>')
    .replace(/\\textit\{([^{}]*)\}/g, '<em>$1</em>')
    .replace(/\\underline\{([^{}]*)\}/g, '<u>$1</u>')
    .replace(/\\True\b\s*/g, '')
    .replace(/\\False\b\s*/g, '')
    .replace(/\\\\/g, '<br />')
    .replace(/\n/g, '<br />');

const stripLatexDecorators = (value) => String(value || '')
    .replace(/\\textbf\{([^{}]*)\}/g, '$1')
    .replace(/\\textit\{([^{}]*)\}/g, '$1')
    .replace(/\\underline\{([^{}]*)\}/g, '$1')
    .replace(/\\True\b\s*/g, '')
    .replace(/\\False\b\s*/g, '')
    .trim();

const convertLatexToWordMath = (latex) => String(latex || '')
    .replace(/\\dfrac/g, '\\frac')
    .replace(/\\tfrac/g, '\\frac')
    .replace(/\\begin\{cases\}([\s\S]*?)\\end\{cases\}/g, (_, content) => `\\cases(${content.replace(/\\\\/g, '@').replace(/\n/g, '')})`)
    .replace(/\\overrightarrow\{([^}]+)\}/g, '\\vec($1)');

const createDocxRuns = (text, api, typstMap) => {
    const { TextRun, Math: DocxMath, MathRun, ImageRun } = api;
    const runs = [];
    const segments = splitTextMathAndImages(text, typstMap);

    segments.forEach((segment) => {
        if (segment.type === 'image') {
            runs.push(new ImageRun({
                data: segment.imgData.buffer,
                transformation: {
                    width: segment.imgData.width,
                    height: segment.imgData.height,
                }
            }));
            return;
        }

        if (segment.type === 'text') {
            const cleaned = stripLatexDecorators(segment.value);
            const parts = cleaned.split(/\\\\|\n/g);

            parts.forEach((part, index) => {
                if (part) {
                    runs.push(new TextRun({
                        text: part,
                        font: 'Times New Roman',
                        size: 24,
                    }));
                }

                if (index < parts.length - 1) {
                    runs.push(new TextRun({ text: '', break: 1 }));
                }
            });
            return;
        }

        const wordMath = convertLatexToWordMath(segment.value);

        if (!segment.displayMode) {
            runs.push(new TextRun({ text: ' ', font: 'Times New Roman', size: 24 }));
        }

        runs.push(new DocxMath({
            children: [new MathRun(wordMath)],
        }));

        if (!segment.displayMode) {
            runs.push(new TextRun({ text: ' ', font: 'Times New Roman', size: 24 }));
        }
    });

    return runs.length ? runs : [new TextRun({ text: '', font: 'Times New Roman', size: 24 })];
};

const RichLatexText = ({ text, className }) => {
    const segments = splitTextAndMath(text);

    if (!segments.length) {
        return null;
    }

    return (
        <div className={clsx('leading-7 text-slate-700', className)}>
            {segments.map((segment, index) => {
                if (segment.type === 'math') {
                    return segment.displayMode ? (
                        <div key={`${segment.value}-${index}`} className="my-3 overflow-x-auto rounded-2xl bg-slate-900/95 px-4 py-3 text-white shadow-sm">
                            <BlockMath math={segment.value} />
                        </div>
                    ) : (
                        <span key={`${segment.value}-${index}`} className="mx-0.5 inline-flex rounded-md bg-amber-100 px-1.5 py-0.5 text-slate-900">
                            <InlineMath math={segment.value} />
                        </span>
                    );
                }

                return (
                    <span
                        key={`${segment.value}-${index}`}
                        dangerouslySetInnerHTML={{ __html: formatTextFragment(segment.value) }}
                    />
                );
            })}
        </div>
    );
};

const severityConfig = {
    error: {
        label: 'Lỗi',
        chip: 'bg-rose-100 text-rose-700 border border-rose-200',
        card: 'border-rose-200 bg-rose-50/80',
        icon: <FiAlertCircle className="text-rose-600" />,
    },
    warning: {
        label: 'Cảnh báo',
        chip: 'bg-amber-100 text-amber-700 border border-amber-200',
        card: 'border-amber-200 bg-amber-50/80',
        icon: <FiAlertTriangle className="text-amber-600" />,
    },
    info: {
        label: 'Gợi ý',
        chip: 'bg-sky-100 text-sky-700 border border-sky-200',
        card: 'border-sky-200 bg-sky-50/80',
        icon: <FiCheckCircle className="text-sky-600" />,
    },
};

const SummaryCard = ({ label, value, accent }) => (
    <div className={clsx('rounded-[24px] border bg-white px-4 py-4 shadow-sm', accent)}>
        <div className="text-[11px] font-semibold uppercase tracking-[0.22em] text-slate-500">{label}</div>
        <div className="mt-2 text-2xl font-black text-slate-900 sm:text-3xl">{value}</div>
    </div>
);

const getOptionDisplayLabel = (type, index) => (
    type === 'choice'
        ? `${String.fromCharCode(65 + index)}.`
        : `${String.fromCharCode(97 + index)})`
);

const getAnswerSummary = (question) => {
    if (question.type === 'choice') {
        return question.choices
            .filter((choice) => choice.isCorrect)
            .map((choice, index) => choice.label || getOptionDisplayLabel('choice', index))
            .map((label) => `${String(label).toUpperCase().replace(/[.)]$/, '')}.`)
            .join(', ');
    }

    if (question.type === 'choiceTF') {
        return question.choices
            .map((choice, index) => `${getOptionDisplayLabel('choiceTF', index)} ${choice.isCorrect ? 'Đ' : 'S'}`)
            .join(' · ');
    }

    return question.answerText;
};

const InspectorToggle = ({ active, icon: Icon, label, count, onClick }) => (
    <button
        type="button"
        onClick={onClick}
        className={clsx(
            'flex items-center gap-3 rounded-2xl px-4 py-3 text-left transition',
            active
                ? 'bg-slate-900 text-white shadow-sm'
                : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
        )}
    >
        <span className={clsx(
            'inline-flex h-8 w-8 items-center justify-center rounded-xl',
            active ? 'bg-white/15' : 'bg-white text-slate-700'
        )}>
            <Icon className="h-4 w-4" />
        </span>
        <span className="min-w-0">
            <span className="block text-sm font-semibold">{label}</span>
            <span className={clsx('block text-xs', active ? 'text-white/70' : 'text-slate-400')}>
                {count}
            </span>
        </span>
    </button>
);

const QuestionCard = ({ question }) => {
    const answerSummary = getAnswerSummary(question);

    return (
        <article className="rounded-[24px] border border-slate-200 bg-white px-4 py-4 shadow-sm">
            <div className="mb-4 flex items-start justify-between gap-3">
                <div>
                    <div className="text-xs font-semibold uppercase tracking-[0.22em] text-teal-600">Câu {question.number}</div>
                    <div className="mt-1 text-sm font-medium text-slate-500">
                        {question.type === 'choice' && 'Trắc nghiệm'}
                        {question.type === 'choiceTF' && 'Đúng / Sai'}
                        {question.type === 'shortans' && 'Trả lời ngắn'}
                        {question.type === 'note' && 'Ghi chú / tự luận'}
                    </div>
                </div>
                {answerSummary ? (
                    <div className="rounded-full bg-emerald-100 px-3 py-1 text-xs font-semibold text-emerald-700">
                        Đáp án: {answerSummary}
                    </div>
                ) : null}
            </div>

            <RichLatexText text={question.stem} className="text-sm" />

            {(question.type === 'choice' || question.type === 'choiceTF') && question.choices.length ? (
                <div className="mt-4 grid gap-3">
                    {question.choices.map((choice, index) => (
                        <div
                            key={`${question.number}-${choice.label}-${index}`}
                            className={clsx(
                                'rounded-2xl border px-4 py-3',
                                choice.isCorrect
                                    ? 'border-emerald-300 bg-emerald-50'
                                    : 'border-slate-200 bg-slate-50'
                            )}
                        >
                            <div className="mb-2 flex items-center gap-2">
                                <span className="inline-flex min-w-[2.75rem] items-center justify-center rounded-full bg-slate-900 px-2.5 py-1 text-xs font-bold text-white">
                                    {getOptionDisplayLabel(question.type, index)}
                                </span>
                                {choice.isCorrect ? <span className="text-xs font-semibold text-emerald-700">Đúng</span> : null}
                            </div>
                            <RichLatexText text={choice.text} className="text-sm" />
                        </div>
                    ))}
                </div>
            ) : null}

            {question.type === 'shortans' && question.answerText ? (
                <div className="mt-4 rounded-2xl border border-cyan-200 bg-cyan-50 px-4 py-3 text-sm font-semibold text-cyan-800">
                    Đáp án ngắn: {question.answerText}
                </div>
            ) : null}

            {question.solution ? (
                <div className="mt-5 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-4">
                    <div className="mb-2 text-sm font-semibold text-amber-800">Lời giải</div>
                    <RichLatexText text={question.solution} className="text-sm" />
                </div>
            ) : null}
        </article>
    );
};

const Pdv3StudioPage = () => {
    const textareaRef = useRef(null);
    const [source, setSource] = useState(DEFAULT_PDV3_SOURCE);
    const [isExporting, setIsExporting] = useState(false);
    const [isCopying, setIsCopying] = useState(false);
    const [inspectorView, setInspectorView] = useState('preview');
    const deferredSource = useDeferredValue(source);
    const [parseResult, setParseResult] = useState(() => parsePdv3Source(DEFAULT_PDV3_SOURCE));

    useEffect(() => {
        setParseResult(parsePdv3Source(deferredSource));
    }, [deferredSource]);

    useEffect(() => {
        const previousTitle = document.title;
        document.title = 'Phan De V3 Studio';

        return () => {
            document.title = previousTitle;
        };
    }, []);

    const summary = summarizePdv3Questions(parseResult.questions, parseResult.diagnostics);
    const sourceLineCount = source ? source.split('\n').length : 1;
    const previewCount = parseResult.questions.length;
    const diagnosticCount = parseResult.diagnostics.length;

    const updateSource = (nextSource, successMessage) => {
        startTransition(() => {
            setSource(nextSource);
        });

        if (successMessage) {
            toast.success(successMessage);
        }
    };

    const jumpToLine = (line) => {
        const element = textareaRef.current;
        if (!element) {
            return;
        }

        const lines = source.split('\n');
        const safeLine = Math.min(Math.max(line, 1), lines.length || 1);
        const selectionStart = lines.slice(0, safeLine - 1).reduce((sum, item) => sum + item.length + 1, 0);
        const selectionEnd = selectionStart + (lines[safeLine - 1]?.length || 0);

        element.focus();
        element.setSelectionRange(selectionStart, selectionEnd);
        element.scrollTop = Math.max(0, (safeLine - 3) * 24);
    };

    const handleAutoFix = () => {
        const nextSource = autoFixPdv3Source(source);
        if (nextSource === source) {
            toast.info('Nguồn hiện tại đã khá sạch, chưa cần tự sửa thêm.');
            return;
        }
        updateSource(nextSource, 'Đã tự chuẩn hóa nhanh nguồn nhập.');
    };

    const handlePlainToEx = () => {
        const { content, diagnostics } = convertPlainTextToEx(source);
        updateSource(content, 'Đã chuyển văn bản thường sang chuẩn ex.');

        const errorCount = diagnostics.filter((item) => item.severity === 'error').length;
        if (errorCount) {
            toast.warning(`Có ${errorCount} lỗi cần xem lại trong bảng chẩn đoán.`);
        }
    };

    const handleExToPlain = () => {
        const { content } = convertExToPlainText(source);
        updateSource(content, 'Đã chuyển chuẩn ex sang văn bản thường.');
    };

    const handleCopySource = async () => {
        try {
            setIsCopying(true);
            await navigator.clipboard.writeText(source);
            toast.success('Đã sao chép nội dung hiện tại.');
        } catch {
            toast.error('Không thể sao chép vào clipboard.');
        } finally {
            setIsCopying(false);
        }
    };

    const handleCopyPlain = async () => {
        try {
            setIsCopying(true);
            const { content } = convertExToPlainText(source);
            await navigator.clipboard.writeText(content);
            toast.success('Đã sao chép bản text sạch.');
        } catch {
            toast.error('Không thể sao chép bản text sạch.');
        } finally {
            setIsCopying(false);
        }
    };

    const handleExportDocx = async () => {
        try {
            setIsExporting(true);
            const { extractTypstBlocks, compileTypstToPngBuffer } = await import('./typstRenderer');
            
            toast.info('Đang biên dịch hình vẽ CeTZ và Bảng biến thiên (có thể mất vài giây)...');
            
            const blocksToRender = new Map();
            const addBlocks = (text) => {
                const b = extractTypstBlocks(text || '');
                for (const block of b) {
                    if (!blocksToRender.has(block.code)) {
                        blocksToRender.set(block.code, block);
                    }
                }
            };

            const questions = parseResult.questions;
            if (!questions.length) {
                addBlocks(source);
            } else {
                questions.forEach(q => {
                    addBlocks(q.stem);
                    if (q.choices) q.choices.forEach(c => addBlocks(c.text));
                    addBlocks(q.answerText);
                    addBlocks(q.solution);
                });
            }

            const typstImageMap = new Map();
            
            const renderPromises = Array.from(blocksToRender.values()).map(async (block) => {
                try {
                    const imgData = await compileTypstToPngBuffer(block);
                    typstImageMap.set(block.code, imgData);
                } catch (err) {
                    console.error("Lỗi vẽ khối:", block.code, err);
                    toast.error(`Lỗi dịch hình: ${block.prefix}`);
                }
            });
            await Promise.all(renderPromises);

            const docx = await import('docx');
            const fileSaver = await import('file-saver');
            const {
                AlignmentType,
                Document,
                Packer,
                Paragraph,
                TextRun,
                ImageRun,
            } = docx;

            const children = [
                new Paragraph({
                    alignment: AlignmentType.CENTER,
                    spacing: { after: 280 },
                    children: [
                        new TextRun({
                            text: 'PHAN DE V3 STUDIO',
                            bold: true,
                            color: '0F766E',
                            font: 'Times New Roman',
                            size: 30,
                        }),
                    ],
                }),
            ];

            if (!questions.length) {
                children.push(new Paragraph({
                    children: createDocxRuns(source, docx, typstImageMap),
                    spacing: { after: 180 },
                }));
            } else {
                questions.forEach((question, index) => {
                    children.push(new Paragraph({
                        spacing: { after: 120 },
                        children: [
                            new TextRun({
                                text: `Câu ${question.number}: `,
                                bold: true,
                                color: '0F172A',
                                font: 'Times New Roman',
                                size: 26,
                            }),
                            ...createDocxRuns(question.stem, docx, typstImageMap),
                        ],
                    }));

                    if (question.type === 'choice' || question.type === 'choiceTF') {
                        question.choices.forEach((choice, choiceIndex) => {
                            const label = `${getOptionDisplayLabel(question.type, choiceIndex)} `;

                            children.push(new Paragraph({
                                spacing: { after: 80 },
                                children: [
                                    new TextRun({
                                        text: label,
                                        bold: true,
                                        color: '1D4ED8',
                                        font: 'Times New Roman',
                                        size: 24,
                                    }),
                                    ...createDocxRuns(choice.text, docx, typstImageMap),
                                    ...(choice.isCorrect ? [new TextRun({
                                        text: ' (DAP AN DUNG)',
                                        bold: true,
                                        color: '047857',
                                        font: 'Times New Roman',
                                        size: 22,
                                    })] : []),
                                ],
                            }));
                        });
                    }

                    if (question.type === 'shortans' && question.answerText) {
                        children.push(new Paragraph({
                            spacing: { after: 80 },
                            children: [
                                new TextRun({
                                    text: 'Đáp án: ',
                                    bold: true,
                                    color: '047857',
                                    font: 'Times New Roman',
                                    size: 24,
                                }),
                                ...createDocxRuns(question.answerText, docx, typstImageMap),
                            ],
                        }));
                    }

                    if (question.solution) {
                        children.push(new Paragraph({
                            spacing: { before: 80, after: 180 },
                            children: [
                                new TextRun({
                                    text: 'Lời giải: ',
                                    bold: true,
                                    color: '9A3412',
                                    font: 'Times New Roman',
                                    size: 24,
                                }),
                                ...createDocxRuns(question.solution, docx, typstImageMap),
                            ],
                        }));
                    }

                    if (index < questions.length - 1) {
                        children.push(new Paragraph({ children: [new TextRun({ text: '', break: 1 })] }));
                    }
                });
            }

            const document = new Document({
                styles: {
                    default: {
                        document: {
                            paragraph: { spacing: { line: 300 } },
                            run: { font: 'Times New Roman', size: 24 },
                        },
                    },
                },
                sections: [{ children }],
            });

            const blob = await Packer.toBlob(document);
            fileSaver.saveAs(blob, `phan-de-v3-studio-${new Date().toISOString().slice(0, 10)}.docx`);
            toast.success('Đã xuất DOCX từ page React mới.');
        } catch (error) {
            console.error(error);
            toast.error('Xuất DOCX thất bại.');
        } finally {
            setIsExporting(false);
        }
    };

    return (
        <div className="min-h-screen bg-[radial-gradient(circle_at_top_left,rgba(251,191,36,0.16),transparent_24%),radial-gradient(circle_at_top_right,rgba(20,184,166,0.12),transparent_28%),linear-gradient(180deg,#fffdf7_0%,#f8fafc_100%)] px-4 py-5 sm:px-6 lg:px-8">
            <div className="mx-auto max-w-[1500px] space-y-5">
                <section className="overflow-hidden rounded-[32px] border border-slate-200 bg-white/90 p-6 shadow-[0_20px_60px_rgba(15,23,42,0.08)] backdrop-blur sm:p-8">
                    <div className="flex flex-col gap-5 xl:flex-row xl:items-start xl:justify-between">
                        <div className="max-w-4xl space-y-3">
                            <div className="inline-flex items-center gap-2 rounded-full border border-teal-200 bg-teal-50 px-3 py-1 text-xs font-semibold uppercase tracking-[0.26em] text-teal-700">
                                <FiZap />
                                React Studio
                            </div>
                            <h1 className="text-4xl font-black tracking-tight text-slate-900 sm:text-5xl">
                                Phan De V3 Studio
                            </h1>
                            <p className="max-w-3xl text-base leading-7 text-slate-600 sm:text-lg">
                                Dán nguồn, sửa nhanh, xem lỗi theo dòng và xuất DOCX trong một bố cục gọn hơn, đỡ rối mắt hơn.
                            </p>
                            <div className="text-sm font-medium text-slate-500">
                                Hỗ trợ cả chuẩn ex lẫn văn bản thường.
                            </div>
                        </div>

                        <div className="flex flex-wrap gap-2 xl:max-w-[360px] xl:justify-end">
                            <AppButton variant="outline" size="md" onClick={() => updateSource(DEFAULT_PDV3_SOURCE, 'Đã nạp ví dụ mẫu.') }>
                                <FiLayers /> Nạp mẫu
                            </AppButton>
                            <AppButton variant="secondary" size="md" onClick={handleCopySource} disabled={isCopying}>
                                <FiClipboard /> Sao chép nguồn
                            </AppButton>
                            <a
                                href="/kho-phan-mem/pdv3.html"
                                target="_blank"
                                rel="noreferrer"
                                className="inline-flex items-center gap-2 rounded-md border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 shadow-sm transition hover:bg-slate-50"
                            >
                                <FiExternalLink /> Mở HTML cũ
                            </a>
                        </div>
                    </div>
                </section>

                <section className="grid gap-3 sm:grid-cols-2 xl:grid-cols-5">
                    <SummaryCard label="Tổng câu" value={summary.total} accent="border-teal-200" />
                    <SummaryCard label="Trắc nghiệm" value={summary.choice} accent="border-sky-200" />
                    <SummaryCard label="Đúng / Sai" value={summary.choiceTF} accent="border-amber-200" />
                    <SummaryCard label="Trả lời ngắn" value={summary.shortans} accent="border-cyan-200" />
                    <SummaryCard label="Lỗi / Cảnh báo" value={`${summary.errors} / ${summary.warnings}`} accent="border-rose-200" />
                </section>

                <section className="grid gap-5 xl:grid-cols-[minmax(0,1.2fr)_430px]">
                    <article className="rounded-[28px] border border-slate-200 bg-white/90 p-5 shadow-sm">
                        <div className="mb-4 flex flex-col gap-3 lg:flex-row lg:items-center lg:justify-between">
                            <div>
                                <div className="text-xs font-semibold uppercase tracking-[0.24em] text-slate-500">Nguồn nhập</div>
                                <h2 className="mt-1 text-2xl font-black text-slate-900">Editor + smart tools</h2>
                            </div>
                            <div className="flex flex-wrap gap-2 text-xs font-semibold text-slate-700">
                                <span className="rounded-full bg-slate-100 px-3 py-1">
                                    Chế độ: {parseResult.inputMode === 'latex' ? 'LaTeX / ex' : 'Văn bản thường'}
                                </span>
                                <span className="rounded-full bg-slate-100 px-3 py-1">{sourceLineCount} dòng</span>
                            </div>
                        </div>

                        <div className="mb-4 flex flex-wrap gap-2 rounded-[22px] border border-slate-200 bg-slate-100/80 p-2">
                            <AppButton variant="warning" size="md" onClick={handleAutoFix}>
                                <FiTool /> Tự sửa nhanh
                            </AppButton>
                            <AppButton variant="primary" size="md" onClick={handlePlainToEx}>
                                <FiArrowRight /> Text to ex
                            </AppButton>
                            <AppButton variant="outline" size="md" onClick={handleExToPlain}>
                                <FiRepeat /> ex to text
                            </AppButton>
                            <AppButton variant="secondary" size="md" onClick={() => setSource('')}>
                                <FiRefreshCw /> Xóa trắng
                            </AppButton>
                        </div>

                        <div className="rounded-[24px] border border-slate-900 bg-slate-950 p-3 shadow-inner">
                            <textarea
                                ref={textareaRef}
                                value={source}
                                onChange={(event) => setSource(event.target.value)}
                                spellCheck={false}
                                className="min-h-[640px] w-full resize-y rounded-[20px] border border-slate-800 bg-slate-950 px-4 py-4 font-mono text-sm leading-6 text-slate-100 outline-none placeholder:text-slate-500 focus:border-teal-400"
                                placeholder="Dán chuẩn ex hoặc text thường vào đây..."
                            />
                        </div>

                        <div className="mt-4 flex flex-wrap gap-2 text-xs font-medium text-slate-500">
                            <span className="rounded-full border border-slate-200 bg-slate-50 px-3 py-1">Dán dài vẫn ổn, parser chạy theo deferred update</span>
                            <span className="rounded-full border border-slate-200 bg-slate-50 px-3 py-1">Click lỗi để nhảy đúng dòng</span>
                        </div>
                    </article>

                    <div className="space-y-5 self-start xl:sticky xl:top-5">
                        <article className="rounded-[28px] border border-slate-200 bg-white/90 p-5 shadow-sm">
                            <div className="mb-4 flex items-start justify-between gap-3">
                                <div>
                                    <div className="text-xs font-semibold uppercase tracking-[0.24em] text-slate-500">Kết quả</div>
                                    <h2 className="mt-1 text-2xl font-black text-slate-900">Xem trước hoặc lỗi</h2>
                                </div>
                                <div className="inline-flex items-center gap-2 rounded-full bg-emerald-100 px-3 py-1 text-xs font-semibold text-emerald-700">
                                    <FiCode /> Parser mới
                                </div>
                            </div>

                            <div className="mb-4 grid gap-2 sm:grid-cols-2">
                                <InspectorToggle
                                    active={inspectorView === 'preview'}
                                    icon={FiLayers}
                                    label="Preview"
                                    count={`${previewCount} câu hợp lệ`}
                                    onClick={() => setInspectorView('preview')}
                                />
                                <InspectorToggle
                                    active={inspectorView === 'diagnostics'}
                                    icon={FiAlertTriangle}
                                    label="Diagnostics"
                                    count={`${diagnosticCount} mục cần xem`}
                                    onClick={() => setInspectorView('diagnostics')}
                                />
                            </div>

                            <div className="max-h-[68vh] overflow-y-auto pr-1">
                                {inspectorView === 'preview' ? (
                                    previewCount ? (
                                        <div className="space-y-4">
                                            {parseResult.questions.map((question) => (
                                                <QuestionCard key={`${question.number}-${question.line}`} question={question} />
                                            ))}
                                        </div>
                                    ) : (
                                        <div className="rounded-[24px] border border-dashed border-slate-300 bg-slate-50 px-5 py-8 text-center text-sm text-slate-500">
                                            Chưa có câu hỏi hợp lệ để xem trước. Hãy thử Tự sửa nhanh hoặc Text to ex.
                                        </div>
                                    )
                                ) : (
                                    diagnosticCount ? (
                                        <div className="space-y-3">
                                            {parseResult.diagnostics.map((item) => {
                                                const config = severityConfig[item.severity] || severityConfig.info;

                                                return (
                                                    <button
                                                        key={item.id}
                                                        type="button"
                                                        onClick={() => jumpToLine(item.line || 1)}
                                                        className={clsx('w-full rounded-2xl border p-4 text-left transition hover:-translate-y-0.5 hover:shadow-sm', config.card)}
                                                    >
                                                        <div className="mb-2 flex items-center justify-between gap-3">
                                                            <div className="flex items-center gap-2 text-sm font-semibold text-slate-900">
                                                                {config.icon}
                                                                {config.label}
                                                            </div>
                                                            <span className={clsx('rounded-full px-2.5 py-1 text-[11px] font-bold uppercase tracking-[0.16em]', config.chip)}>
                                                                Dòng {item.line || 1}
                                                            </span>
                                                        </div>
                                                        <div className="text-sm leading-6 text-slate-700">{item.message}</div>
                                                    </button>
                                                );
                                            })}
                                        </div>
                                    ) : (
                                        <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-4 text-sm text-emerald-800">
                                            Không thấy lỗi hoặc cảnh báo nào đáng chú ý.
                                        </div>
                                    )
                                )}
                            </div>
                        </article>

                        <article className="rounded-[28px] border border-slate-200 bg-white/90 p-5 shadow-sm">
                            <div className="mb-4">
                                <div className="text-xs font-semibold uppercase tracking-[0.24em] text-slate-500">Xuất file</div>
                                <h2 className="mt-1 text-2xl font-black text-slate-900">DOCX và text sạch</h2>
                            </div>

                            <div className="space-y-3">
                                <AppButton variant="success" size="md" className="w-full justify-center py-3 text-sm" onClick={handleExportDocx} disabled={isExporting}>
                                    <FiDownload /> {isExporting ? 'Đang xuất DOCX...' : 'Xuất DOCX'}
                                </AppButton>
                                <AppButton variant="outline" size="md" className="w-full justify-center py-3 text-sm" onClick={handleCopyPlain} disabled={isCopying}>
                                    <FiFileText /> Sao chép bản text sạch
                                </AppButton>
                            </div>
                        </article>
                    </div>
                </section>
            </div>
        </div>
    );
};

export default Pdv3StudioPage;