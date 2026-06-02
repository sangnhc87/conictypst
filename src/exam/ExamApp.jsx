/**
 * ExamApp.jsx
 *
 * Top-level component for the online exam system.
 * Manages the state machine:
 *
 *   'browse'   → ExamBrowser  (choose an exam)
 *   'loading'  → loading spinner while parsing source
 *   'exam'     → ExamPlayer   (take the exam)
 *   'result'   → ExamResult   (see score + review)
 *
 * Everything is static / client-side.  No backend needed.
 */
import React, { useState } from 'react';
import { EXAM_CATALOG, loadExamById } from './examRegistry';
import { parseExamSource } from './engine/typstExamParser';
import { gradeExam, computeStats } from './engine/examGrader';
import ExamPlayer from './ExamPlayer';
import ExamResult from './ExamResult';

// ────────────────────────────────────────────────────────────────────────────
// Exam browser
// ────────────────────────────────────────────────────────────────────────────

function ExamBrowser({ onSelect }) {
    return (
        <div className="flex flex-1 flex-col overflow-y-auto bg-gradient-to-br from-slate-100 to-blue-50 p-6">
            <div className="mx-auto w-full max-w-2xl">

                {/* Hero header */}
                <div className="mb-8 text-center">
                    <div className="mb-3 inline-flex items-center justify-center h-14 w-14 rounded-2xl
                        bg-gradient-to-br from-blue-600 to-blue-700 shadow-lg">
                        <span className="text-2xl">📝</span>
                    </div>
                    <h1 className="text-3xl font-extrabold text-gray-900 tracking-tight">Thi Online</h1>
                    <p className="mt-1.5 text-sm text-gray-500">
                        Chọn đề thi — chấm điểm tự động, không cần backend
                    </p>
                </div>

                {EXAM_CATALOG.length === 0 && (
                    <div className="rounded-2xl border-2 border-dashed border-gray-300 p-10 text-center text-gray-400">
                        <p className="font-bold text-base">Chưa có đề thi nào.</p>
                        <p className="mt-1 text-sm">Thêm file .typ vào typst/exams/ và đăng ký trong examRegistry.js.</p>
                    </div>
                )}

                <div className="space-y-4">
                    {EXAM_CATALOG.map((meta, idx) => (
                        <div
                            key={meta.id}
                            className="group relative flex flex-col gap-2 rounded-2xl border-2 border-gray-200 bg-white
                                px-5 py-4 shadow-sm hover:border-blue-400 hover:shadow-md transition-all cursor-pointer"
                            onClick={() => onSelect(meta)}
                        >
                            {/* Left accent bar */}
                            <div className="absolute left-0 top-4 bottom-4 w-1 rounded-r-full bg-blue-500
                                opacity-0 group-hover:opacity-100 transition-opacity" />

                            <div className="flex items-start gap-3 pl-1">
                                {/* Number badge */}
                                <span className="flex-shrink-0 mt-0.5 flex h-9 w-9 items-center justify-center
                                    rounded-xl bg-blue-50 text-sm font-bold text-blue-600">
                                    {idx + 1}
                                </span>

                                <div className="flex-1 min-w-0">
                                    <p className="font-bold text-gray-900 text-base leading-tight">
                                        {meta.title}
                                    </p>
                                    {meta.description && (
                                        <p className="mt-0.5 text-sm text-gray-500 line-clamp-2">
                                            {meta.description}
                                        </p>
                                    )}
                                </div>

                                <button
                                    className="shrink-0 rounded-xl bg-blue-600 px-4 py-2 text-sm font-bold text-white
                                        hover:bg-blue-700 active:scale-95 transition-all shadow-sm"
                                    onClick={e => { e.stopPropagation(); onSelect(meta); }}
                                >
                                    Vào thi →
                                </button>
                            </div>

                            {/* Tags row */}
                            <div className="flex flex-wrap gap-1.5 text-xs pl-12">
                                {meta.grade && (
                                    <span className="rounded-full bg-indigo-100 px-2.5 py-0.5 text-indigo-700 font-semibold">
                                        Lớp {meta.grade}
                                    </span>
                                )}
                                {meta.subject && (
                                    <span className="rounded-full bg-gray-100 px-2.5 py-0.5 text-gray-600 font-medium">
                                        {meta.subject}
                                    </span>
                                )}
                                {meta.duration && (
                                    <span className="rounded-full bg-amber-100 px-2.5 py-0.5 text-amber-700 font-semibold">
                                        ⏱ {meta.duration} phút
                                    </span>
                                )}
                                {(meta.tags ?? []).map(tag => (
                                    <span key={tag} className="rounded-full bg-blue-50 px-2.5 py-0.5 text-blue-600 font-medium">
                                        #{tag}
                                    </span>
                                ))}
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}

// ────────────────────────────────────────────────────────────────────────────
// Loading screen
// ────────────────────────────────────────────────────────────────────────────

function LoadingScreen({ message }) {
    return (
        <div className="flex flex-1 flex-col items-center justify-center gap-3 bg-gray-50">
            <div className="h-8 w-8 animate-spin rounded-full border-4 border-blue-400 border-t-transparent" />
            <p className="text-sm text-gray-500">{message}</p>
        </div>
    );
}

// ────────────────────────────────────────────────────────────────────────────
// ExamApp state machine
// ────────────────────────────────────────────────────────────────────────────

export default function ExamApp() {
    const [phase, setPhase] = useState('browse');   // 'browse' | 'loading' | 'exam' | 'result'
    const [loadError, setLoadError] = useState(null);
    const [examMeta, setExamMeta] = useState(null);
    const [questions, setQuestions] = useState([]);
    const [gradeResult, setGradeResult] = useState(null);
    const [stats, setStats] = useState(null);

    async function startExam(meta) {
        setExamMeta(meta);
        setPhase('loading');
        setLoadError(null);
        try {
            const { source } = await loadExamById(meta.id);
            const { questions: qs } = parseExamSource(source);
            if (qs.length === 0) {
                throw new Error('Không tìm thấy câu hỏi nào trong file này. Hãy kiểm tra định dạng #tn/#ds/#tln/#tl.');
            }
            setQuestions(qs);
            setGradeResult(null);
            setStats(null);
            setPhase('exam');
        } catch (err) {
            setLoadError(String(err));
            setPhase('browse');
        }
    }

    function handleSubmit(answers) {
        const result = gradeExam(questions, answers);
        const s = computeStats(result);
        setGradeResult(result);
        setStats(s);
        setPhase('result');
    }

    function handleRetry() {
        setGradeResult(null);
        setStats(null);
        setPhase('exam');
    }

    return (
        <div className="exam-app flex h-full flex-col overflow-hidden">
            {loadError && (
                <div className="bg-red-50 border-b border-red-200 px-4 py-2 text-sm text-red-700">
                    Lỗi tải đề: {loadError}
                </div>
            )}

            {phase === 'browse' && (
                <ExamBrowser onSelect={startExam} />
            )}

            {phase === 'loading' && (
                <LoadingScreen message={`Đang tải đề "${examMeta?.title}"…`} />
            )}

            {phase === 'exam' && questions.length > 0 && (
                <ExamPlayer
                    examMeta={examMeta}
                    questions={questions}
                    onSubmit={handleSubmit}
                    onExit={() => setPhase('browse')}
                />
            )}

            {phase === 'result' && gradeResult && stats && (
                <ExamResult
                    examMeta={examMeta}
                    questions={questions}
                    gradeResult={gradeResult}
                    stats={stats}
                    onRetry={handleRetry}
                    onExit={() => setPhase('browse')}
                />
            )}
        </div>
    );
}
