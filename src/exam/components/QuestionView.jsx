/**
 * QuestionView.jsx
 *
 * Renders a single exam question using instant HTML + KaTeX rendering.
 * No WASM compilation — content shown immediately.
 *
 * Props:
 *   question    – parsed question object from typstExamParser
 *   index       – 0-based display index
 *   userAnswer  – current answer from parent state
 *   onAnswer    – (newAnswer) => void
 *   mode        – 'exam' | 'review'
 *   gradeResult – result object from examGrader (optional, review mode)
 */
import React from 'react';
import TypstContent from './TypstContent';
import FigureView from './FigureView';

const LABELS = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
const ALPHA  = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];

// ────────────────────────────────────────────────────────────────────────────
// TN — trắc nghiệm một đáp án đúng
// ────────────────────────────────────────────────────────────────────────────

function TnControls({ options, userAnswer, onAnswer, gradeResult, mode }) {
    const isReview = mode === 'review';

    return (
        <div className="mt-4 space-y-2.5">
            {options.map((opt, i) => {
                const letter   = LABELS[i];
                const selected = userAnswer === letter;
                const correct  = isReview && opt.correct;
                const wrong    = isReview && selected && !opt.correct;

                let cls = 'flex items-start gap-3.5 w-full rounded-xl border-2 px-4 py-3 text-base text-left transition-all select-none ';
                if (isReview) {
                    cls += correct
                        ? 'border-green-400 bg-green-50'
                        : wrong
                            ? 'border-red-300 bg-red-50 opacity-70'
                            : selected
                                ? 'border-blue-200 bg-blue-50'
                                : 'border-gray-100 bg-white text-gray-400';
                } else {
                    cls += selected
                        ? 'border-blue-500 bg-blue-50 shadow-md ring-1 ring-blue-200 cursor-pointer'
                        : 'border-gray-200 bg-white hover:border-blue-300 hover:bg-blue-50/60 cursor-pointer';
                }

                return (
                    <button
                        key={letter}
                        className={cls}
                        onClick={() => !isReview && onAnswer?.(selected ? null : letter)}
                        disabled={isReview}
                    >
                        <span className={`flex-shrink-0 mt-0.5 inline-flex h-7 w-7 items-center justify-center rounded-full border-2 text-sm font-bold
                            ${isReview
                                ? correct  ? 'border-green-500 bg-green-500 text-white'
                                : wrong    ? 'border-red-400 bg-red-100 text-red-600'
                                           : 'border-gray-200 text-gray-400'
                                : selected ? 'border-blue-500 bg-blue-500 text-white'
                                           : 'border-gray-300 text-gray-500'
                            }`}>
                            {isReview && correct ? '✓' : isReview && wrong ? '✗' : letter}
                        </span>
                        <span className="leading-relaxed flex-1">
                            <TypstContent src={opt.contentSrc} />
                        </span>
                    </button>
                );
            })}
        </div>
    );
}

// ────────────────────────────────────────────────────────────────────────────
// DS — đúng / sai (multi-statement)
// ────────────────────────────────────────────────────────────────────────────

function DsControls({ options, userAnswer, onAnswer, gradeResult, mode }) {
    const isReview = mode === 'review';
    const n       = options.length;
    const current = Array.isArray(userAnswer) ? userAnswer : Array(n).fill(null);

    function toggle(i, val) {
        if (isReview) return;
        const next = [...current];
        next[i] = next[i] === val ? null : val;
        onAnswer?.(next);
    }

    return (
        <div className="mt-3 overflow-x-auto rounded-xl border-2 border-gray-200">
            <table className="w-full border-collapse text-base">
                <thead>
                    <tr className="bg-gradient-to-r from-slate-100 to-slate-50 text-xs font-bold uppercase tracking-wider text-gray-500">
                        <th className="border-b-2 border-gray-200 px-4 py-2.5 text-left">Phát biểu</th>
                        <th className="border-b-2 border-gray-200 px-4 py-2.5 text-center w-16 text-emerald-700">Đúng</th>
                        <th className="border-b-2 border-gray-200 px-4 py-2.5 text-center w-16 text-rose-600">Sai</th>
                    </tr>
                </thead>
                <tbody>
                    {options.map((opt, i) => {
                        const label      = ALPHA[i] ?? String(i + 1);
                        const chosenD    = current[i] === 'D';
                        const chosenS    = current[i] === 'S';
                        const correctVal = opt.correct ? 'D' : 'S';
                        const stmtRes    = gradeResult?.statementResults?.[i];

                        return (
                            <tr key={i} className={i % 2 === 0 ? 'bg-white' : 'bg-slate-50/70'}>
                                <td className="border-b border-gray-100 px-4 py-3 text-gray-800">
                                    <span className="font-bold text-gray-400 mr-2 text-sm">{label})</span>
                                    <TypstContent src={opt.contentSrc} />
                                    {isReview && stmtRes && (
                                        <span className={`ml-2 text-sm font-bold
                                            ${stmtRes.correct ? 'text-green-600' : 'text-red-500'}`}>
                                            {stmtRes.correct ? '✓' : '✗'}
                                        </span>
                                    )}
                                </td>
                                <td className="border-b border-gray-100 px-4 py-3 text-center">
                                    <button
                                        onClick={() => toggle(i, 'D')}
                                        disabled={isReview}
                                        className={`inline-flex h-8 w-8 items-center justify-center rounded-full border-2 text-sm font-bold transition-all
                                            ${isReview
                                                ? correctVal === 'D'
                                                    ? 'border-emerald-500 bg-emerald-500 text-white'
                                                    : chosenD
                                                        ? 'border-red-300 bg-red-50 text-red-500'
                                                        : 'border-gray-200 text-gray-300'
                                                : chosenD
                                                    ? 'border-blue-500 bg-blue-500 text-white'
                                                    : 'border-gray-300 text-gray-300 hover:border-emerald-400 hover:text-emerald-500 cursor-pointer'
                                            }`}
                                    >
                                        {(isReview ? correctVal === 'D' : chosenD) ? '✓' : ''}
                                    </button>
                                </td>
                                <td className="border-b border-gray-100 px-4 py-3 text-center">
                                    <button
                                        onClick={() => toggle(i, 'S')}
                                        disabled={isReview}
                                        className={`inline-flex h-8 w-8 items-center justify-center rounded-full border-2 text-sm font-bold transition-all
                                            ${isReview
                                                ? correctVal === 'S'
                                                    ? 'border-emerald-500 bg-emerald-500 text-white'
                                                    : chosenS
                                                        ? 'border-red-300 bg-red-50 text-red-500'
                                                        : 'border-gray-200 text-gray-300'
                                                : chosenS
                                                    ? 'border-rose-500 bg-rose-500 text-white'
                                                    : 'border-gray-300 text-gray-300 hover:border-rose-400 hover:text-rose-500 cursor-pointer'
                                            }`}
                                    >
                                        {(isReview ? correctVal === 'S' : chosenS) ? '✓' : ''}
                                    </button>
                                </td>
                            </tr>
                        );
                    })}
                </tbody>
            </table>
        </div>
    );
}

// ────────────────────────────────────────────────────────────────────────────
// TLN — trả lời ngắn
// ────────────────────────────────────────────────────────────────────────────

function TlnControls({ userAnswer, onAnswer, gradeResult, mode }) {
    const isReview = mode === 'review';
    const correct  = gradeResult?.correct;

    return (
        <div className="mt-4 space-y-2">
            <label className="block text-xs font-bold text-gray-500 uppercase tracking-wider">
                Trả lời ngắn
            </label>
            <input
                type="text"
                className={`w-full rounded-xl border-2 px-4 py-2.5 text-base font-mono
                    ${isReview
                        ? correct === true
                            ? 'border-green-400 bg-green-50 text-green-800'
                            : correct === false
                                ? 'border-red-300 bg-red-50 text-red-700'
                                : 'border-gray-300 bg-gray-50'
                        : 'border-gray-300 bg-white focus:border-blue-400 focus:outline-none focus:ring-2 focus:ring-blue-100'
                    }`}
                value={userAnswer ?? ''}
                onChange={e => !isReview && onAnswer?.(e.target.value)}
                placeholder="Nhập câu trả lời…"
                readOnly={isReview}
            />
            {isReview && gradeResult?.correctAnswer && (
                <p className="text-xs text-green-700">
                    Đáp án đúng: <span className="font-semibold">{gradeResult.correctAnswer}</span>
                </p>
            )}
        </div>
    );
}

// ────────────────────────────────────────────────────────────────────────────
// TL — tự luận
// ────────────────────────────────────────────────────────────────────────────

function TlControls({ userAnswer, onAnswer, mode }) {
    const isReview = mode === 'review';
    return (
        <div className="mt-4 space-y-2">
            <label className="block text-xs font-bold text-gray-500 uppercase tracking-wider">
                Bài làm tự luận
            </label>
            <textarea
                className="w-full rounded-xl border-2 border-gray-300 px-4 py-3 text-base font-mono leading-relaxed
                    focus:border-blue-400 focus:outline-none focus:ring-2 focus:ring-blue-100 resize-none"
                rows={6}
                value={userAnswer ?? ''}
                onChange={e => !isReview && onAnswer?.(e.target.value)}
                placeholder="Viết bài giải tại đây…"
                readOnly={isReview}
            />
            {isReview && (
                <p className="text-xs text-amber-600 italic">Câu tự luận — chấm thủ công.</p>
            )}
        </div>
    );
}

// ────────────────────────────────────────────────────────────────────────────
// Main QuestionView
// ────────────────────────────────────────────────────────────────────────────

export default function QuestionView({
    question,
    index,
    userAnswer,
    onAnswer,
    mode = 'exam',
    gradeResult,
}) {
    const typeLabel = { tn: 'TN', ds: 'Đ/S', tln: 'TLN', tl: 'TL' }[question.type] ?? '';
    const scoreInfo = gradeResult
        ? `${gradeResult.earned} / ${gradeResult.possible} điểm`
        : null;

    const answered = userAnswer != null &&
        (Array.isArray(userAnswer) ? userAnswer.some(v => v != null) : userAnswer !== '');

    return (
        <div className="question-view rounded-2xl border border-gray-200 bg-white shadow-md overflow-hidden">
            {/* Header bar */}
            <div className="flex items-center gap-2 border-b-2 border-gray-100 bg-gradient-to-r from-blue-600 to-blue-700 px-4 py-2.5">
                <span className="font-extrabold text-white text-sm tracking-wide">Câu {index + 1}</span>
                <span className={`rounded-full px-2.5 py-0.5 text-xs font-bold
                    ${{ tn: 'bg-blue-200 text-blue-800', ds: 'bg-emerald-200 text-emerald-800',
                         tln: 'bg-amber-200 text-amber-800', tl: 'bg-purple-200 text-purple-800'
                       }[question.type] ?? 'bg-white/20 text-white'}`}>
                    {typeLabel}
                </span>
                <span className="text-blue-200 text-xs ml-1">#{question.id}</span>
                {mode === 'exam' && answered && (
                    <span className="ml-auto flex items-center gap-1 rounded-full bg-green-100 px-2.5 py-0.5 text-xs font-bold text-green-700">
                        <span>✓</span> Đã trả lời
                    </span>
                )}
                {mode === 'review' && scoreInfo && (
                    <span className={`ml-auto rounded-full px-2.5 py-0.5 text-xs font-bold
                        ${gradeResult.correct === true  ? 'bg-green-100 text-green-700'
                        : gradeResult.earned > 0        ? 'bg-amber-100 text-amber-700'
                                                        : 'bg-red-100 text-red-600'}`}>
                        {scoreInfo}
                    </span>
                )}
            </div>

            {/* Content */}
            <div className="px-5 py-4">
                {/* Stem */}
                <div className="text-base leading-loose text-gray-900 font-medium">
                    <TypstContent src={question.stemSrc} />
                </div>

                {/* Figure */}
                {question.figSrc && (
                    <FigureView src={question.figSrc} />
                )}

                {/* Answer controls */}
                {question.type === 'tn' && (
                    <TnControls
                        options={question.options}
                        userAnswer={userAnswer}
                        onAnswer={onAnswer}
                        gradeResult={gradeResult}
                        mode={mode}
                    />
                )}
                {question.type === 'ds' && (
                    <DsControls
                        options={question.options}
                        userAnswer={userAnswer}
                        onAnswer={onAnswer}
                        gradeResult={gradeResult}
                        mode={mode}
                    />
                )}
                {question.type === 'tln' && (
                    <TlnControls
                        userAnswer={userAnswer}
                        onAnswer={onAnswer}
                        gradeResult={gradeResult}
                        mode={mode}
                    />
                )}
                {question.type === 'tl' && (
                    <TlControls
                        userAnswer={userAnswer}
                        onAnswer={onAnswer}
                        mode={mode}
                    />
                )}

                {/* Review: solution */}
                {mode === 'review' && question.loigiaiSrc && (
                    <div className="mt-5 rounded-xl border-2 border-amber-200 bg-amber-50 px-4 py-3">
                        <div className="mb-2 flex items-center gap-2 text-xs font-bold uppercase tracking-wider text-amber-700">
                            <span>📝</span> Lời giải
                        </div>
                        <div className="text-base text-gray-700 leading-loose">
                            <TypstContent src={question.loigiaiSrc} />
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
}
