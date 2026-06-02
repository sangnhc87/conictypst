/**
 * ExamResult.jsx
 *
 * Post-submission score card + per-question review.
 *
 * Props:
 *   examMeta    – catalog entry
 *   questions   – Question[]
 *   gradeResult – return value of gradeExam()
 *   stats       – return value of computeStats()
 *   onRetry     – () => void
 *   onExit      – () => void
 */
import React, { useState } from 'react';
import QuestionView from './components/QuestionView';

function ScoreBadge({ grade10, percentScore }) {
    const color = percentScore >= 80 ? 'text-green-600'
        : percentScore >= 50 ? 'text-amber-600'
            : 'text-red-600';

    return (
        <div className={`text-center ${color}`}>
            <p className="text-7xl font-black leading-none">{grade10.toFixed(1)}</p>
            <p className="mt-1 text-base font-semibold text-gray-500">/ 10 điểm</p>
            <p className="text-sm text-gray-400">({percentScore.toFixed(1)}%)</p>
        </div>
    );
}

function StatRow({ label, correct, total }) {
    if (total === 0) return null;
    const pct = total > 0 ? Math.round((correct / total) * 100) : 0;
    return (
        <div className="flex items-center justify-between rounded-lg bg-gray-50 px-3 py-2 text-sm">
            <span className="text-gray-700">{label}</span>
            <span className="font-semibold">
                <span className="text-green-700">{correct}</span>
                <span className="text-gray-400">/{total}</span>
                <span className="ml-2 text-xs text-gray-400">({pct}%)</span>
            </span>
        </div>
    );
}

export default function ExamResult({ examMeta, questions, gradeResult, stats, onRetry, onExit }) {
    const [showReview, setShowReview] = useState(false);
    const [reviewIndex, setReviewIndex] = useState(0);

    const { results } = gradeResult;
    const resultById = Object.fromEntries(results.map(r => [r.questionId, r]));

    const reviewQuestion = questions[reviewIndex];

    return (
        <div className="flex h-full flex-col overflow-hidden bg-gray-100">
            {/* Header */}
            <header className="flex items-center gap-3 border-b border-gray-200 bg-white px-4 py-2 shadow-sm">
                <button
                    className="rounded px-2 py-1 text-xs text-gray-500 hover:bg-gray-100"
                    onClick={onExit}
                >
                    ← Thoát
                </button>
                <p className="flex-1 truncate text-sm font-semibold text-gray-800">
                    Kết quả — {examMeta?.title ?? 'Đề thi'}
                </p>
                <button
                    className="rounded-lg border border-blue-300 px-3 py-1 text-xs font-semibold text-blue-600
            hover:bg-blue-50"
                    onClick={onRetry}
                >
                    Làm lại
                </button>
            </header>

            {/* Body */}
            {!showReview ? (
                <div className="flex flex-1 flex-col items-center overflow-y-auto p-6">
                    {/* Score card */}
                    <div className="w-full max-w-md rounded-2xl bg-white p-6 shadow">
                        <p className="mb-4 text-center text-lg font-bold text-gray-700">Điểm của bạn</p>
                        <ScoreBadge grade10={stats.grade10} percentScore={stats.percentScore} />

                        <div className="mt-6 space-y-2">
                            <StatRow
                                label="Trắc nghiệm (TN)"
                                correct={stats.byType.tn.correct}
                                total={stats.byType.tn.total}
                            />
                            <StatRow
                                label="Đúng/Sai (DS)"
                                correct={stats.byType.ds.scored}
                                total={stats.byType.ds.total}
                            />
                            <StatRow
                                label="Trả lời ngắn (TLN)"
                                correct={stats.byType.tln.correct}
                                total={stats.byType.tln.total}
                            />
                        </div>

                        <button
                            className="mt-6 w-full rounded-lg bg-blue-600 py-2 text-sm font-semibold text-white
                hover:bg-blue-700 transition-colors"
                            onClick={() => { setShowReview(true); setReviewIndex(0); }}
                        >
                            Xem lại bài làm
                        </button>
                    </div>

                    {/* Quick summary table */}
                    <div className="mt-6 w-full max-w-2xl rounded-xl bg-white shadow overflow-hidden">
                        <p className="border-b border-gray-100 px-4 py-2 text-sm font-semibold text-gray-600">
                            Chi tiết từng câu
                        </p>
                        <div className="divide-y divide-gray-50">
                            {questions.map((q, i) => {
                                const r = resultById[q.id];
                                if (!r) return null;
                                const correctIcon = r.correct === true ? '✓'
                                    : r.correct === false ? '✗'
                                        : '—';
                                const iconCls = r.correct === true ? 'text-green-600'
                                    : r.correct === false ? 'text-red-500'
                                        : 'text-gray-400';

                                return (
                                    <button
                                        key={q.id}
                                        className="flex w-full items-center gap-3 px-4 py-2 text-left text-sm hover:bg-gray-50"
                                        onClick={() => { setReviewIndex(i); setShowReview(true); }}
                                    >
                                        <span className="w-14 shrink-0 text-xs text-gray-400">Câu {i + 1}</span>
                                        <span className={`w-6 text-center font-bold ${iconCls}`}>{correctIcon}</span>
                                        <span className="flex-1 truncate text-gray-600">
                                            {r.type === 'tn' && `Đáp án đúng: ${r.correctAnswer}`}
                                            {r.type === 'ds' && `Đúng ${r.correctCount}/${r.totalStatements} phát biểu`}
                                            {r.type === 'tln' && `Đáp án: ${r.correctAnswer ?? '—'}`}
                                            {r.type === 'tl' && 'Tự luận — chấm thủ công'}
                                        </span>
                                        <span className="ml-auto text-xs text-gray-400">
                                            {r.earned} / {r.possible} đ
                                        </span>
                                    </button>
                                );
                            })}
                        </div>
                    </div>
                </div>
            ) : (
                /* ── Review mode ── */
                <div className="flex flex-1 overflow-hidden">
                    <main className="flex flex-1 flex-col overflow-y-auto p-4">
                        <QuestionView
                            key={reviewQuestion?.id}
                            question={reviewQuestion}
                            index={reviewIndex}
                            userAnswer={null}
                            mode="review"
                            gradeResult={reviewQuestion ? resultById[reviewQuestion.id] : null}
                        />

                        <div className="mt-4 flex gap-2">
                            <button
                                className="rounded-lg border border-gray-300 bg-white px-4 py-1.5 text-sm
                  font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-40"
                                onClick={() => setReviewIndex(i => Math.max(0, i - 1))}
                                disabled={reviewIndex === 0}
                            >
                                ← Câu trước
                            </button>
                            <button
                                className="ml-auto rounded-lg border border-gray-300 bg-white px-4 py-1.5 text-sm
                  font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-40"
                                onClick={() => setReviewIndex(i => Math.min(questions.length - 1, i + 1))}
                                disabled={reviewIndex === questions.length - 1}
                            >
                                Câu sau →
                            </button>
                        </div>

                        <button
                            className="mt-3 text-center text-xs text-blue-600 hover:underline"
                            onClick={() => setShowReview(false)}
                        >
                            ← Quay lại bảng điểm
                        </button>
                    </main>

                    {/* Side nav */}
                    <aside className="hidden w-48 shrink-0 overflow-y-auto border-l border-gray-200 bg-white p-3 md:block">
                        <p className="mb-2 text-xs font-semibold uppercase tracking-wider text-gray-400">
                            Danh sách câu
                        </p>
                        <div className="grid grid-cols-5 gap-1">
                            {questions.map((q, i) => {
                                const r = resultById[q.id];
                                const correct = r?.correct === true;
                                const wrong = r?.correct === false;
                                const partial = !correct && !wrong && (r?.earned ?? 0) > 0;
                                const isCurrent = i === reviewIndex;

                                let cellCls = 'flex h-7 w-7 cursor-pointer items-center justify-center rounded text-xs font-semibold transition-colors ';
                                if (isCurrent) {
                                    cellCls += 'ring-2 ring-blue-500 bg-blue-500 text-white';
                                } else if (correct) {
                                    cellCls += 'bg-green-100 text-green-700 border border-green-300';
                                } else if (partial) {
                                    cellCls += 'bg-amber-100 text-amber-700 border border-amber-300';
                                } else if (wrong) {
                                    cellCls += 'bg-red-100 text-red-500 border border-red-300';
                                } else {
                                    cellCls += 'bg-gray-100 text-gray-400 border border-gray-200';
                                }

                                return (
                                    <button
                                        key={q.id}
                                        className={cellCls}
                                        onClick={() => setReviewIndex(i)}
                                    >
                                        {i + 1}
                                    </button>
                                );
                            })}
                        </div>
                    </aside>
                </div>
            )}
        </div>
    );
}
