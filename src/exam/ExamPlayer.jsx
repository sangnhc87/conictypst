/**
 * ExamPlayer.jsx
 *
 * Full exam-taking experience.
 *
 * Flow:
 *   1. Receive `examMeta` + `questions` (already parsed).
 *   2. Navigate one question at a time (← Prev / Next →).
 *   3. Countdown timer (optional).
 *   4. Question nav grid (colour-coded: unanswered / answered / flagged).
 *   5. Submit button → calls `onSubmit(answers)`.
 *
 * Props:
 *   examMeta    – catalog entry from examRegistry
 *   questions   – Question[] from parseExamSource()
 *   onSubmit    – (answers: Record<string, any>) => void
 *   onExit      – () => void
 */
import React, { useCallback, useMemo, useState } from 'react';
import ExamTimer from './components/ExamTimer';
import QuestionView from './components/QuestionView';


export default function ExamPlayer({ examMeta, questions, onSubmit, onExit }) {
    const [currentIndex, setCurrentIndex] = useState(0);
    const [answers, setAnswers] = useState({});     // { questionId: answer }
    const [flagged, setFlagged] = useState(new Set()); // flagged for review
    const [submitted, setSubmitted] = useState(false);

    const totalSeconds = examMeta?.duration ? examMeta.duration * 60 : null;
    const currentQuestion = questions[currentIndex];

    const answeredCount = useMemo(
        () => questions.filter(q => {
            const a = answers[q.id];
            return a != null && (Array.isArray(a) ? a.some(v => v != null) : a !== '');
        }).length,
        [questions, answers],
    );

    const handleAnswer = useCallback((qId, value) => {
        setAnswers(prev => ({ ...prev, [qId]: value }));
    }, []);

    const toggleFlag = useCallback((qId) => {
        setFlagged(prev => {
            const next = new Set(prev);
            next.has(qId) ? next.delete(qId) : next.add(qId);
            return next;
        });
    }, []);

    function handleSubmit() {
        if (submitted) return;
        const unanswered = questions.length - answeredCount;
        if (unanswered > 0) {
            const ok = window.confirm(
                `Bạn còn ${unanswered} câu chưa trả lời. Vẫn nộp bài?`
            );
            if (!ok) return;
        }
        setSubmitted(true);
        onSubmit?.(answers);
    }

    // Navigate and prefetch ahead
    function goTo(idx) {
        const clamped = Math.max(0, Math.min(questions.length - 1, idx));
        setCurrentIndex(clamped);

    }

    // ── Section boundaries for sidebar grouping ──────────────────────────────
    const sections = useMemo(() => {
        const groups = [];
        let cur = null;
        questions.forEach((q, i) => {
            if (!cur || cur.type !== q.type) {
                cur = { type: q.type, start: i, end: i };
                groups.push(cur);
            } else {
                cur.end = i;
            }
        });
        return groups;
    }, [questions]);

    if (!currentQuestion) return null;

    const isFlagged = flagged.has(currentQuestion.id);
    const isFirst = currentIndex === 0;
    const isLast = currentIndex === questions.length - 1;

    const TYPE_LABELS = { tn: 'Trắc nghiệm', ds: 'Đúng / Sai', tln: 'Trả lời ngắn', tl: 'Tự luận' };
    const TYPE_COLORS = {
        tn:  { badge: 'bg-blue-100 text-blue-700',   dot: 'bg-blue-500'   },
        ds:  { badge: 'bg-emerald-100 text-emerald-700', dot: 'bg-emerald-500' },
        tln: { badge: 'bg-amber-100 text-amber-700', dot: 'bg-amber-500'  },
        tl:  { badge: 'bg-purple-100 text-purple-700', dot: 'bg-purple-500' },
    };

    const progressPct = questions.length > 0
        ? Math.round((answeredCount / questions.length) * 100)
        : 0;

    return (
        <div className="exam-player flex h-full flex-col bg-slate-100">

            {/* ── Top bar (gradient) ── */}
            <header className="flex items-center gap-3 bg-gradient-to-r from-blue-700 via-blue-700 to-blue-800
                px-5 py-3 shadow-lg">

                {/* Exit */}
                <button
                    className="flex items-center gap-1 rounded-lg bg-white/15 px-3 py-1.5 text-xs font-medium
                        text-white/90 hover:bg-white/25 transition-colors"
                    onClick={onExit}
                >
                    ← Thoát
                </button>

                {/* Title block */}
                <div className="min-w-0 flex-1">
                    <p className="truncate text-base font-bold text-white leading-tight">
                        {examMeta?.title ?? 'Đề thi'}
                    </p>
                    <div className="flex items-center gap-3 mt-0.5">
                        <div className="flex items-center gap-1.5">
                            <div className="h-1.5 w-36 rounded-full bg-white/20 overflow-hidden">
                                <div
                                    className="h-full rounded-full bg-green-300 transition-all duration-500"
                                    style={{ width: `${progressPct}%` }}
                                />
                            </div>
                            <span className="text-xs text-white/70">
                                {answeredCount}/{questions.length} câu
                            </span>
                        </div>
                    </div>
                </div>

                {/* Timer */}
                {totalSeconds && (
                    <div className="rounded-xl bg-white/15 px-4 py-1.5">
                        <ExamTimer
                            totalSeconds={totalSeconds}
                            onExpire={() => {
                                alert('Hết giờ! Bài đang được nộp tự động.');
                                handleSubmit();
                            }}
                        />
                    </div>
                )}

                {/* Submit */}
                <button
                    className="rounded-xl bg-white px-5 py-1.5 text-sm font-bold text-blue-700
                        hover:bg-blue-50 active:scale-95 transition-all shadow"
                    onClick={handleSubmit}
                    disabled={submitted}
                >
                    Nộp bài
                </button>
            </header>

            <div className="flex flex-1 overflow-hidden">

                {/* ── Main content ── */}
                <main className="flex flex-1 flex-col overflow-y-auto px-5 py-5 gap-4">
                    <QuestionView
                        key={currentQuestion.id}
                        question={currentQuestion}
                        index={currentIndex}
                        userAnswer={answers[currentQuestion.id] ?? null}
                        onAnswer={val => handleAnswer(currentQuestion.id, val)}
                        mode="exam"
                    />

                    {/* Navigation buttons */}
                    <div className="flex items-center gap-2 pb-4">
                        <button
                            className="flex items-center gap-1.5 rounded-xl border-2 border-gray-200 bg-white
                                px-5 py-2.5 text-sm font-semibold text-gray-700
                                hover:border-blue-300 hover:text-blue-700 disabled:opacity-35 transition-colors"
                            onClick={() => goTo(currentIndex - 1)}
                            disabled={isFirst}
                        >
                            ← Câu trước
                        </button>

                        <button
                            className={`flex items-center gap-1.5 rounded-xl border-2 px-5 py-2.5
                                text-sm font-semibold transition-colors
                                ${isFlagged
                                    ? 'border-amber-400 bg-amber-50 text-amber-700 hover:bg-amber-100'
                                    : 'border-gray-200 bg-white text-gray-500 hover:border-amber-300 hover:text-amber-600'
                                }`}
                            onClick={() => toggleFlag(currentQuestion.id)}
                        >
                            {isFlagged ? '🚩 Bỏ đánh dấu' : '🏳 Đánh dấu'}
                        </button>

                        <span className="ml-auto text-sm text-gray-400 font-medium">
                            {currentIndex + 1} / {questions.length}
                        </span>

                        <button
                            className="flex items-center gap-1.5 rounded-xl border-2 border-gray-200 bg-white
                                px-5 py-2.5 text-sm font-semibold text-gray-700
                                hover:border-blue-300 hover:text-blue-700 disabled:opacity-35 transition-colors"
                            onClick={() => goTo(currentIndex + 1)}
                            disabled={isLast}
                        >
                            Câu sau →
                        </button>
                    </div>
                </main>

                {/* ── Sidebar: question grid grouped by section ── */}
                <aside className="hidden w-56 shrink-0 overflow-y-auto border-l border-gray-200 bg-white p-4 md:block">

                    <p className="mb-3 text-xs font-bold uppercase tracking-widest text-gray-400">
                        Danh sách câu
                    </p>

                    {sections.map((sec) => {
                        const tc = TYPE_COLORS[sec.type] ?? TYPE_COLORS.tn;
                        return (
                            <div key={`${sec.type}-${sec.start}`} className="mb-4">
                                {/* Section header */}
                                <div className="flex items-center gap-1.5 mb-1.5">
                                    <span className={`inline-block h-2 w-2 rounded-full ${tc.dot}`} />
                                    <span className={`rounded-full px-2 py-0.5 text-xs font-bold ${tc.badge}`}>
                                        {TYPE_LABELS[sec.type] ?? sec.type.toUpperCase()}
                                    </span>
                                    <span className="text-xs text-gray-400">
                                        {sec.start + 1}–{sec.end + 1}
                                    </span>
                                </div>

                                {/* Grid */}
                                <div className="grid grid-cols-5 gap-1">
                                    {questions.slice(sec.start, sec.end + 1).map((q, _rel) => {
                                        const i = sec.start + _rel;
                                        const isAnswered = answers[q.id] != null &&
                                            (Array.isArray(answers[q.id])
                                                ? answers[q.id].some(v => v != null)
                                                : answers[q.id] !== '');
                                        const isFlaggedQ = flagged.has(q.id);
                                        const isCurrent = i === currentIndex;

                                        let cellCls = 'flex h-8 w-8 cursor-pointer items-center justify-center rounded-lg text-xs font-bold transition-all ';
                                        if (isCurrent) {
                                            cellCls += 'ring-2 ring-blue-500 bg-blue-600 text-white shadow-md';
                                        } else if (isFlaggedQ) {
                                            cellCls += 'bg-amber-100 text-amber-700 border border-amber-300';
                                        } else if (isAnswered) {
                                            cellCls += 'bg-green-100 text-green-700 border border-green-300';
                                        } else {
                                            cellCls += 'bg-slate-50 text-slate-400 border border-slate-200 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600';
                                        }

                                        return (
                                            <button
                                                key={q.id}
                                                className={cellCls}
                                                onClick={() => goTo(i)}
                                                title={`Câu ${i + 1} — ${isAnswered ? 'đã trả lời' : 'chưa trả lời'}`}
                                            >
                                                {i + 1}
                                            </button>
                                        );
                                    })}
                                </div>
                            </div>
                        );
                    })}

                    {/* Legend */}
                    <div className="mt-2 space-y-1.5 border-t border-gray-100 pt-3">
                        {[
                            ['bg-blue-600', 'Câu hiện tại'],
                            ['bg-green-100 border border-green-300', 'Đã trả lời'],
                            ['bg-amber-100 border border-amber-300', 'Đã đánh dấu'],
                            ['bg-slate-50 border border-slate-200', 'Chưa trả lời'],
                        ].map(([dot, label]) => (
                            <div key={label} className="flex items-center gap-2 text-xs text-gray-500">
                                <span className={`h-3.5 w-3.5 rounded ${dot} flex-shrink-0`} />
                                {label}
                            </div>
                        ))}
                    </div>
                </aside>
            </div>
        </div>
    );
}
