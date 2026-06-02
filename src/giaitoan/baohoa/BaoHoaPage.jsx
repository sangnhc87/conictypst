/**
 * BaoHoaPage.jsx — Trang giải toán tương tác: Tăng trưởng 2 giai đoạn + bão hoà
 *
 * Mô hình đề thi phổ biến:
 *   • Giai đoạn 1: N(t) = N₀·eᵃᵗ  (0 ≤ t ≤ t₀)
 *   • Giai đoạn 2: M(t) = A − B·e^(−b·(t−t₀))  (t ≥ t₀)
 *   • Điều kiện nối trơn tại t₀: liên tục + đạo hàm liên tục
 *
 * Tính A, B tự động. Hiển thị từng bước. Kiểm tra mệnh đề đúng/sai.
 * Vẽ đồ thị SVG đường cong 2 giai đoạn.
 */

import React, { useState, useMemo } from 'react'
import { InlineMath, BlockMath } from 'react-katex'
import 'katex/dist/katex.min.css'
import { solveBaoHoa, curveData, fmt } from './utils/baohoa.js'

// ─── Theme ──────────────────────────────────────────────────────────
const T = {
    phase1: { bg: 'bg-blue-600', bgL: 'bg-blue-50', border: 'border-blue-400', text: 'text-blue-700', badge: 'bg-blue-100 text-blue-800' },
    phase2: { bg: 'bg-emerald-600', bgL: 'bg-emerald-50', border: 'border-emerald-400', text: 'text-emerald-700', badge: 'bg-emerald-100 text-emerald-800' },
    key: { bg: 'bg-violet-600', bgL: 'bg-violet-50', border: 'border-violet-300', text: 'text-violet-700' },
    sat: { bg: 'bg-orange-600', bgL: 'bg-orange-50', border: 'border-orange-300', text: 'text-orange-700' },
}

// ─── Helpers ────────────────────────────────────────────────────────
function SectionCard({ children, className = '' }) {
    return <div className={`bg-white rounded-2xl border border-slate-200 shadow-sm p-5 ${className}`}>{children}</div>
}

function StepBadge({ n, color = 'bg-slate-700' }) {
    return <span className={`inline-flex items-center justify-center w-6 h-6 rounded-full ${color} text-white text-xs font-bold shrink-0`}>{n}</span>
}

function NumberInput({ label, value, min, max, step = 0.1, onChange, accent = 'blue', unit = '' }) {
    return (
        <div className="flex items-center gap-3">
            <span className="text-sm font-semibold text-slate-700 w-16 shrink-0">{label}</span>
            <div className="flex items-center gap-1.5">
                <button
                    type="button"
                    onClick={() => onChange(Math.max(min, +(value - step).toFixed(4)))}
                    className="w-7 h-7 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50 text-sm"
                >−</button>
                <input
                    type="number" min={min} max={max} step={step} value={value}
                    onChange={e => {
                        const v = parseFloat(e.target.value)
                        if (!isNaN(v)) onChange(Math.max(min, Math.min(max ?? 1e9, v)))
                    }}
                    className={`w-20 text-center border border-slate-300 rounded-lg py-1 font-bold text-slate-800 bg-white text-sm focus:outline-none focus:ring-2 focus:ring-${accent}-400`}
                />
                <button
                    type="button"
                    onClick={() => onChange(+(value + step).toFixed(4))}
                    className="w-7 h-7 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50 text-sm"
                >+</button>
            </div>
            {unit && <span className="text-xs text-slate-400">{unit}</span>}
        </div>
    )
}

// ─── Mini SVG Chart ──────────────────────────────────────────────────
function CurveChart({ N0, a, t0, b, A, B }) {
    const W = 480, H = 200, PAD = { left: 44, right: 16, top: 14, bottom: 32 }
    const pts = useMemo(() => curveData({ N0, a, t0, b, A, B, tMax: t0 * 3.5 }), [N0, a, t0, b, A, B])

    if (!pts.length) return null

    const tMax = pts[pts.length - 1].t
    const yMax = Math.max(A * 1.08, N0 * 1.05)
    const yMin = 0

    const sx = t => PAD.left + (t / tMax) * (W - PAD.left - PAD.right)
    const sy = y => PAD.top + (1 - (y - yMin) / (yMax - yMin)) * (H - PAD.top - PAD.bottom)

    const phase1Pts = pts.filter(p => p.t <= t0)
    const phase2Pts = pts.filter(p => p.t >= t0)

    const toPath = arr => arr.map((p, i) => `${i === 0 ? 'M' : 'L'}${sx(p.t).toFixed(1)},${sy(p.y).toFixed(1)}`).join(' ')

    const xt0 = sx(t0)
    const ticksY = 4

    return (
        <svg viewBox={`0 0 ${W} ${H}`} className="w-full" style={{ maxHeight: 200 }}>
            {/* Grid lines */}
            {Array.from({ length: ticksY + 1 }, (_, i) => {
                const y = yMin + (yMax - yMin) * i / ticksY
                const cy = sy(y)
                return (
                    <g key={i}>
                        <line x1={PAD.left} x2={W - PAD.right} y1={cy} y2={cy} stroke="#e2e8f0" strokeWidth={1} />
                        <text x={PAD.left - 4} y={cy + 4} textAnchor="end" fontSize={9} fill="#94a3b8">{fmt(y, 1)}</text>
                    </g>
                )
            })}

            {/* Asymptote A */}
            <line x1={PAD.left} x2={W - PAD.right} y1={sy(A)} y2={sy(A)} stroke="#f97316" strokeWidth={1.5} strokeDasharray="4,3" />
            <text x={W - PAD.right + 2} y={sy(A) + 4} fontSize={8} fill="#f97316">A={fmt(A, 2)}</text>

            {/* Divider t0 */}
            <line x1={xt0} x2={xt0} y1={PAD.top} y2={H - PAD.bottom} stroke="#6366f1" strokeWidth={1.5} strokeDasharray="3,2" />
            <text x={xt0} y={H - PAD.bottom + 12} textAnchor="middle" fontSize={9} fill="#6366f1">t₀={t0}</text>

            {/* Axes */}
            <line x1={PAD.left} x2={W - PAD.right} y1={H - PAD.bottom} y2={H - PAD.bottom} stroke="#94a3b8" strokeWidth={1} />
            <line x1={PAD.left} x2={PAD.left} y1={PAD.top} y2={H - PAD.bottom} stroke="#94a3b8" strokeWidth={1} />

            {/* Phase 1 curve */}
            <path d={toPath(phase1Pts)} fill="none" stroke="#3b82f6" strokeWidth={2.5} />

            {/* Phase 2 curve */}
            <path d={toPath(phase2Pts)} fill="none" stroke="#10b981" strokeWidth={2.5} />

            {/* Point at t0 */}
            <circle cx={xt0} cy={sy(phase1Pts[phase1Pts.length - 1]?.y ?? 0)} r={4} fill="#6366f1" />

            {/* Labels */}
            <text x={PAD.left + 8} y={PAD.top + 14} fontSize={9} fill="#3b82f6" fontWeight="bold">Giai đoạn 1</text>
            <text x={xt0 + 8} y={PAD.top + 14} fontSize={9} fill="#10b981" fontWeight="bold">Giai đoạn 2</text>
        </svg>
    )
}

// ─── Step 1: Model display ───────────────────────────────────────────
function ModelCard({ N0, a, t0, b }) {
    return (
        <SectionCard>
            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                <StepBadge n={1} color="bg-blue-600" />
                Mô hình 2 giai đoạn
            </p>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <div className="bg-blue-50 rounded-xl border border-blue-200 p-4">
                    <p className="text-xs font-bold text-blue-700 mb-2">📈 Giai đoạn 1 — Tăng trưởng mũ</p>
                    <BlockMath math={`N(t) = ${N0} \\cdot e^{${a}t}, \\quad 0 \\leq t \\leq ${t0}`} />
                    <p className="text-xs text-blue-600 mt-1">Tốc độ tăng: <InlineMath math={`N'(t) = ${N0 * a} e^{${a}t}`} /></p>
                </div>
                <div className="bg-emerald-50 rounded-xl border border-emerald-200 p-4">
                    <p className="text-xs font-bold text-emerald-700 mb-2">📉 Giai đoạn 2 — Bão hoà</p>
                    <BlockMath math={`M(t) = A - B \\cdot e^{-${b}(t-${t0})}, \\quad t \\geq ${t0}`} />
                    <p className="text-xs text-emerald-600 mt-1">Tốc độ giảm: <InlineMath math={`M'(t) = ${b}B \\cdot e^{-${b}(t-${t0})}`} /></p>
                </div>
            </div>
        </SectionCard>
    )
}

// ─── Step 2: Conditions ──────────────────────────────────────────────
function ConditionsCard({ N0, a, t0, b, sol }) {
    return (
        <SectionCard>
            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                <StepBadge n={2} color="bg-violet-600" />
                Điều kiện nối trơn tại <InlineMath math={`t = ${t0}`} />
            </p>
            <div className="space-y-3">
                <div className="bg-violet-50 rounded-xl border border-violet-200 p-4">
                    <p className="text-xs font-bold text-violet-700 mb-2">① Điều kiện liên tục: <InlineMath math="M(0) = N(t_0)" /></p>
                    <div className="space-y-1 text-sm text-slate-700">
                        <BlockMath math={`A - B = N(${t0}) = ${N0} \\cdot e^{${a} \\times ${t0}} = ${N0} e^{${a * t0}}`} />
                        <p className="text-xs text-violet-600">
                            ≈ <strong>{fmt(sol.Nt0, 4)}</strong>
                        </p>
                    </div>
                </div>
                <div className="bg-violet-50 rounded-xl border border-violet-200 p-4">
                    <p className="text-xs font-bold text-violet-700 mb-2">② Điều kiện đạo hàm liên tục: <InlineMath math="M'(0) = N'(t_0)" /></p>
                    <div className="space-y-1 text-sm text-slate-700">
                        <BlockMath math={`${b} B = N'(${t0}) = ${N0} \\cdot ${a} \\cdot e^{${a * t0}} = ${N0 * a} e^{${a * t0}}`} />
                        <p className="text-xs text-violet-600">
                            ≈ <strong>{fmt(sol.dNt0, 4)}</strong>
                        </p>
                    </div>
                </div>
            </div>
        </SectionCard>
    )
}

// ─── Step 3: Solve A, B ──────────────────────────────────────────────
function SolveCard({ N0, a, t0, b, sol }) {
    const exp = a * t0
    return (
        <SectionCard>
            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                <StepBadge n={3} color="bg-emerald-600" />
                Tính B và A
            </p>
            <div className="space-y-4">
                {/* B */}
                <div className="bg-emerald-50 rounded-xl border border-emerald-200 p-4">
                    <p className="text-xs font-bold text-emerald-700 mb-2">Từ điều kiện ②</p>
                    <BlockMath math={`B = \\frac{${N0 * a} e^{${exp}}}{${b}} = ${N0 * a / b} e^{${exp}}`} />
                    <div className="flex items-center gap-2 mt-2">
                        <span className="text-xs text-slate-500">Số cụ thể:</span>
                        <span className="font-black text-emerald-700 text-lg">{fmt(sol.B, 4)}</span>
                    </div>
                </div>

                {/* A */}
                <div className="bg-orange-50 rounded-xl border border-orange-200 p-4">
                    <p className="text-xs font-bold text-orange-700 mb-2">Từ điều kiện ①</p>
                    <BlockMath math={`A = (A - B) + B = ${N0} e^{${exp}} + ${N0 * a / b} e^{${exp}} = ${N0 + N0 * a / b} e^{${exp}}`} />
                    <div className="flex items-center gap-2 mt-2">
                        <span className="text-xs text-slate-500">Số cụ thể:</span>
                        <span className="font-black text-orange-700 text-lg">{fmt(sol.A, 4)}</span>
                    </div>
                </div>
            </div>
        </SectionCard>
    )
}

// ─── Step 4: Saturation ──────────────────────────────────────────────
function SaturationCard({ sol, unit }) {
    return (
        <div className="bg-gradient-to-r from-orange-500 to-amber-500 rounded-2xl p-5 text-white shadow-md">
            <p className="font-bold text-sm mb-1 text-orange-100">🎯 Giới hạn bão hoà</p>
            <p className="text-xs text-orange-100 mb-3">
                Khi <InlineMath math="t \to +\infty" />, hàm <InlineMath math="M(t) \to A" /> vì số hạng <InlineMath math="B e^{-b(t-t_0)} \to 0" />
            </p>
            <div className="flex items-end gap-3">
                <div>
                    <p className="text-orange-100 text-xs mb-1">Giá trị A chính xác</p>
                    <p className="font-black" style={{ fontSize: '2.4rem', lineHeight: 1 }}>{fmt(sol.A, 4)}</p>
                </div>
                <div className="border-l border-orange-300 pl-3">
                    <p className="text-orange-100 text-xs mb-1">Làm tròn đơn vị</p>
                    <p className="font-black text-3xl">{Math.round(sol.A)}</p>
                    {unit && <p className="text-orange-100 text-xs">{unit}</p>}
                </div>
            </div>
        </div>
    )
}

// ─── Statement Checker ───────────────────────────────────────────────
const MENHDE_DEFAULTS = [
    { id: 'a', label: '', claimStr: '', claimVal: null, isCorrect: null },
    { id: 'b', label: '', claimStr: '', claimVal: null, isCorrect: null },
    { id: 'c', label: '', claimStr: '', claimVal: null, isCorrect: null },
    { id: 'd', label: '', claimStr: '', claimVal: null, isCorrect: null },
]

function StatementPanel({ sol, N0, a, t0, b }) {
    // Danh sách các mệnh đề phổ biến trong đề thi
    const stmts = useMemo(() => {
        const exp = a * t0
        return [
            {
                id: 'a',
                tex: `N(${t0}) = ${N0} e^{${exp}}`,
                truth: true,
                actual: sol.Nt0,
                explain: `N(${t0}) = ${N0} · e^{${a}·${t0}} = ${N0} e^{${exp}} ≈ ${fmt(sol.Nt0, 3)} ✓`,
            },
            {
                id: 'b',
                tex: `B = ${N0 * a / b} e^{${exp}}`,
                truth: true,
                actual: sol.B,
                explain: `Từ 0.${b}B = ${N0 * a}e^{${exp}} → B = ${N0 * a / b}e^{${exp}} ≈ ${fmt(sol.B, 3)} ✓`,
            },
            {
                id: 'c',
                tex: `A = ${N0 + N0 * a / b} e^{${exp}}`,
                truth: true,
                actual: sol.A,
                explain: `A = (${N0} + ${N0 * a / b})e^{${exp}} = ${N0 + N0 * a / b}e^{${exp}} ≈ ${fmt(sol.A, 3)} ✓`,
            },
            {
                id: 'd',
                tex: `\\text{Giới hạn bão hoà} \\approx ${Math.round(sol.A)}`,
                truth: true,
                actual: Math.round(sol.A),
                explain: `A ≈ ${fmt(sol.A, 2)}, làm tròn = ${Math.round(sol.A)} ✓`,
            },
        ]
    }, [sol, N0, a, t0, b])

    const [revealed, setRevealed] = useState({})
    const toggleReveal = id => setRevealed(prev => ({ ...prev, [id]: !prev[id] }))

    return (
        <SectionCard>
            <p className="font-bold text-slate-800 text-sm mb-4 flex items-center gap-2">
                <StepBadge n={4} color="bg-slate-600" />
                Kiểm tra mệnh đề — đúng hay sai?
            </p>
            <p className="text-xs text-slate-400 mb-3">Bấm vào mỗi mệnh đề để xem giải thích.</p>
            <div className="space-y-3">
                {stmts.map(s => (
                    <div key={s.id}
                        onClick={() => toggleReveal(s.id)}
                        className={`rounded-xl border-2 p-3.5 cursor-pointer transition-all select-none
                            ${revealed[s.id]
                                ? s.truth
                                    ? 'border-emerald-400 bg-emerald-50'
                                    : 'border-red-400 bg-red-50'
                                : 'border-slate-200 bg-white hover:border-slate-300 hover:bg-slate-50'
                            }`}
                    >
                        <div className="flex items-start justify-between gap-3">
                            <div className="flex items-start gap-3 min-w-0">
                                <span className={`shrink-0 w-7 h-7 rounded-full flex items-center justify-center text-sm font-black
                                    ${revealed[s.id] ? (s.truth ? 'bg-emerald-500 text-white' : 'bg-red-500 text-white') : 'bg-slate-200 text-slate-600'}`}>
                                    {s.id.toUpperCase()}
                                </span>
                                <div className="min-w-0">
                                    <InlineMath math={s.tex} />
                                    {revealed[s.id] && (
                                        <p className={`text-xs mt-1.5 ${s.truth ? 'text-emerald-700' : 'text-red-700'}`}>
                                            {s.explain}
                                        </p>
                                    )}
                                </div>
                            </div>
                            {revealed[s.id] && (
                                <span className={`shrink-0 text-sm font-black px-2.5 py-1 rounded-full
                                    ${s.truth ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-700'}`}>
                                    {s.truth ? 'ĐÚNG' : 'SAI'}
                                </span>
                            )}
                            {!revealed[s.id] && (
                                <span className="shrink-0 text-xs text-slate-300 font-medium">bấm xem</span>
                            )}
                        </div>
                    </div>
                ))}
            </div>
            <button
                type="button"
                onClick={() => {
                    const all = Object.fromEntries(stmts.map(s => [s.id, true]))
                    setRevealed(all)
                }}
                className="mt-4 w-full py-2 rounded-xl bg-slate-800 text-white text-sm font-bold hover:bg-slate-700 transition-colors"
            >
                Hiện tất cả đáp án
            </button>
        </SectionCard>
    )
}

// ─── Param Panel ─────────────────────────────────────────────────────
function ParamPanel({ N0, a, t0, b, unit, onN0, onA, onT0, onB, onUnit }) {
    const presets = [
        { label: 'Đề 1 — Dân số', N0: 5, a: 0.25, t0: 6, b: 0.2, unit: 'nghìn người' },
        { label: 'Đề 2 — Vi khuẩn', N0: 100, a: 0.8, t0: 2, b: 0.5, unit: 'nghìn cá thể' },
        { label: 'Đề 3 — Cây trồng', N0: 15, a: 0.1, t0: 8, b: 0.25, unit: 'cm' },
        { label: 'Đề 4 — Người dùng app', N0: 5, a: 0.25, t0: 6, b: 0.2, unit: 'nghìn người' },
    ]

    return (
        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5 space-y-4">
            <p className="font-bold text-slate-800 text-sm">⚙ Tham số bài toán</p>

            {/* Presets */}
            <div>
                <p className="text-xs text-slate-400 mb-2">Đề mẫu:</p>
                <div className="grid grid-cols-2 gap-1.5">
                    {presets.map((p, i) => (
                        <button key={i} type="button"
                            onClick={() => { onN0(p.N0); onA(p.a); onT0(p.t0); onB(p.b); onUnit(p.unit) }}
                            className="text-left px-2.5 py-1.5 rounded-lg bg-slate-50 hover:bg-blue-50 border border-slate-200 hover:border-blue-300 text-xs text-slate-600 hover:text-blue-700 transition-all font-medium"
                        >
                            {p.label}
                        </button>
                    ))}
                </div>
            </div>

            <div className="border-t border-slate-100 pt-3 space-y-3">
                <NumberInput label="N₀" value={N0} min={0.1} max={10000} step={1} onChange={onN0} unit="(giá trị ban đầu)" />
                <NumberInput label="a" value={a} min={0.01} max={5} step={0.05} onChange={onA} unit="(tốc độ g.đ.1)" />
                <NumberInput label="t₀" value={t0} min={0.5} max={50} step={0.5} onChange={onT0} unit="(điểm chuyển)" />
                <NumberInput label="b" value={b} min={0.01} max={5} step={0.05} onChange={onB} unit="(hệ số suy giảm)" />
                <div className="flex items-center gap-3">
                    <span className="text-sm font-semibold text-slate-700 w-16 shrink-0">Đơn vị</span>
                    <input
                        type="text" value={unit}
                        onChange={e => onUnit(e.target.value)}
                        placeholder="nghìn người, cm, ..."
                        className="flex-1 border border-slate-300 rounded-lg px-2.5 py-1 text-sm text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    />
                </div>
            </div>

            {/* Quick result */}
            <div className="bg-slate-50 rounded-xl border border-slate-200 p-3 space-y-1.5">
                <p className="text-xs font-bold text-slate-500 mb-1">Kết quả nhanh</p>
                {[
                    ['N(t₀)', 'text-blue-700'],
                    ['B', 'text-emerald-700'],
                    ['A (bão hoà)', 'text-orange-700'],
                ].map(([lbl], i) => {
                    const vals = (() => {
                        try {
                            const s = solveBaoHoa({ N0, a, t0, b })
                            return [s.Nt0, s.B, s.A]
                        } catch { return [0, 0, 0] }
                    })()
                    return (
                        <div key={lbl} className="flex justify-between items-center text-sm">
                            <span className="text-slate-500">{lbl}</span>
                            <span className={`font-black ${['text-blue-700', 'text-emerald-700', 'text-orange-700'][i]}`}>
                                {fmt(vals[i], 3)}
                            </span>
                        </div>
                    )
                })}
            </div>
        </div>
    )
}

// ─── Main Export ─────────────────────────────────────────────────────
export default function BaoHoaPage({ onNavigate }) {
    const [N0, setN0] = useState(5)
    const [a, setA] = useState(0.25)
    const [t0, setT0] = useState(6)
    const [b, setB] = useState(0.2)
    const [unit, setUnit] = useState('nghìn người')

    const sol = useMemo(() => {
        try { return solveBaoHoa({ N0, a, t0, b }) }
        catch { return { Nt0: 0, dNt0: 0, B: 0, A: 0, saturation: 0, exponent: 0 } }
    }, [N0, a, t0, b])

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-6">
            {/* ── Header ── */}
            <div>
                <h1 className="text-2xl font-bold text-slate-900">📈 Tăng Trưởng 2 Giai Đoạn — Bão Hoà</h1>
                <p className="text-sm text-slate-500 mt-1">
                    Mô hình thường gặp trong đề thi: hàm mũ <InlineMath math="N(t) = N_0 e^{at}" /> → bão hoà <InlineMath math="M(t) = A - Be^{-b(t-t_0)}" />
                </p>
            </div>

            {/* ── Theory banner ── */}
            <div className="bg-gradient-to-r from-slate-800 to-slate-700 rounded-2xl p-5 text-white shadow-md">
                <p className="font-bold text-base mb-3">📖 Công thức chìa khoá</p>
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                    {[
                        {
                            color: 'bg-blue-500/20 border-blue-400',
                            title: '① Liên tục',
                            math: 'A - B = N_0 e^{at_0}',
                        },
                        {
                            color: 'bg-violet-500/20 border-violet-400',
                            title: '② Đạo hàm liên tục',
                            math: 'bB = N_0 a e^{at_0}',
                        },
                        {
                            color: 'bg-orange-500/20 border-orange-400',
                            title: '③ Giới hạn',
                            math: '\\lim_{t\\to\\infty} M(t) = A',
                        },
                    ].map(item => (
                        <div key={item.title} className={`${item.color} border rounded-xl p-3`}>
                            <p className="text-xs font-bold text-slate-300 mb-2">{item.title}</p>
                            <BlockMath math={item.math} />
                        </div>
                    ))}
                </div>
                <div className="mt-3 pt-3 border-t border-slate-600 text-sm text-slate-300">
                    <p>• Từ ②: <InlineMath math="B = \frac{N_0 a}{b} e^{at_0}" /> &nbsp;•&nbsp; Từ ①: <InlineMath math="A = N_0\!\left(1+\frac{a}{b}\right) e^{at_0}" /></p>
                </div>
            </div>

            {/* ── Main layout ── */}
            <div className="grid grid-cols-1 lg:grid-cols-[320px_1fr] gap-6 items-start">
                {/* Left: params */}
                <ParamPanel
                    N0={N0} a={a} t0={t0} b={b} unit={unit}
                    onN0={setN0} onA={setA} onT0={setT0} onB={setB} onUnit={setUnit}
                />

                {/* Right: steps */}
                <div className="space-y-4">
                    {/* Chart */}
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">📊 Đồ thị đường cong</p>
                        <CurveChart N0={N0} a={a} t0={t0} b={b} A={sol.A} B={sol.B} />
                        <div className="flex gap-4 mt-2 text-xs text-slate-500">
                            <span className="flex items-center gap-1"><span className="inline-block w-6 h-1 bg-blue-500 rounded" /> Giai đoạn 1</span>
                            <span className="flex items-center gap-1"><span className="inline-block w-6 h-1 bg-emerald-500 rounded" /> Giai đoạn 2</span>
                            <span className="flex items-center gap-1"><span className="inline-block w-6 h-1 bg-orange-400 rounded" style={{ borderTop: '2px dashed' }} /> Bão hoà A</span>
                        </div>
                    </SectionCard>

                    <ModelCard N0={N0} a={a} t0={t0} b={b} />
                    <ConditionsCard N0={N0} a={a} t0={t0} b={b} sol={sol} />
                    <SolveCard N0={N0} a={a} t0={t0} b={b} sol={sol} />
                    <SaturationCard sol={sol} unit={unit} />
                    <StatementPanel sol={sol} N0={N0} a={a} t0={t0} b={b} />
                </div>
            </div>
        </div>
    )
}
