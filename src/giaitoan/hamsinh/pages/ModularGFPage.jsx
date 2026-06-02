/**
 * ModularGFPage — Dạng II: Ràng buộc chẵn / lẻ / bội d
 *
 * Mỗi biến x_i có thể bị ràng buộc:
 *   • Tùy ý (≥ 0)   → G(x) = 1/(1−x)
 *   • Dương (≥ 1)   → G(x) = x/(1−x)
 *   • Chỉ chẵn       → G(x) = 1/(1−x²)
 *   • Chỉ lẻ         → G(x) = x/(1−x²)
 *   • Bội của d      → G(x) = 1/(1−x^d)
 */

import React, { useState } from 'react'
import { InlineMath, BlockMath } from 'react-katex'
import 'katex/dist/katex.min.css'
import { computeModularGF, CONSTRAINT_OPTIONS } from '../utils/modularGF.js'
import { fmtN } from '../utils/gfEngine.js'

function buildVars(k) {
    return Array.from({ length: k }, (_, i) => ({
        label: `x_{${i + 1}}`,
        id: 'any',
        d: 3,
    }))
}

function StepBadge({ n, color = 'blue' }) {
    const cls = color === 'emerald'
        ? 'bg-emerald-100 text-emerald-700'
        : 'bg-blue-100 text-blue-700'
    return (
        <span className={`inline-flex items-center justify-center w-5 h-5 rounded-full text-xs font-bold ${cls}`}>
            {n}
        </span>
    )
}

// ─── Variable input row ───────────────────────────────────────────

function VarRow({ v, i, onChange }) {
    function upd(field, val) { onChange(i, field, val) }
    return (
        <div className="bg-slate-50 rounded-xl border border-slate-200 p-3 space-y-2">
            <p className="font-bold text-slate-700 text-sm">
                Biến <InlineMath math={v.label} />
            </p>
            <div className="flex items-center gap-2 flex-wrap">
                <label className="text-xs text-slate-500">Kiểu:</label>
                <select value={v.id} onChange={e => upd('id', e.target.value)}
                    className="border border-slate-300 rounded-lg px-2 py-1 text-sm bg-white focus:outline-none focus:ring-1 focus:ring-blue-400 text-slate-700">
                    {CONSTRAINT_OPTIONS.map(opt => (
                        <option key={opt.id} value={opt.id}>{opt.label}</option>
                    ))}
                </select>
                {v.id === 'mod_d' && (
                    <div className="flex items-center gap-1.5">
                        <label className="text-xs text-slate-500">d =</label>
                        <input type="number" min={2} max={12} value={v.d}
                            onChange={e => upd('d', Math.max(2, parseInt(e.target.value) || 2))}
                            className="w-12 text-center border border-slate-300 rounded-lg py-0.5 text-sm font-bold bg-white focus:outline-none focus:ring-1 focus:ring-blue-400" />
                    </div>
                )}
            </div>
            {/* Show GF label */}
            <div className="text-xs text-blue-600 font-mono mt-1">
                <InlineMath math={
                    CONSTRAINT_OPTIONS.find(o => o.id === v.id)?.latex(v.d) ?? '?'
                } />
            </div>
        </div>
    )
}

// ─── Main page ────────────────────────────────────────────────────

export default function ModularGFPage({ onNavigate }) {
    const [k, setK] = useState(3)
    const [n, setN] = useState(10)
    const [vars, setVars] = useState(buildVars(3))
    const [result, setResult] = useState(null)
    const [error, setError] = useState(null)

    function changeK(newK) {
        setK(newK)
        setVars(buildVars(newK))
        setResult(null)
    }

    function updateVar(i, field, val) {
        setVars(prev => prev.map((v, idx) => idx !== i ? v : { ...v, [field]: val }))
        setResult(null)
    }

    function handleSolve() {
        setError(null)
        if (n < 0 || n > 30) { setError('n phải từ 0 đến 30.'); return }
        const cleanVars = vars.map(v => ({ label: v.label, id: v.id, d: v.id === 'mod_d' ? v.d : undefined }))
        const res = computeModularGF(n, cleanVars)
        setResult(res)
    }

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-6">
            {/* Header */}
            <div>
                <h1 className="text-2xl font-bold text-slate-900">Ràng Buộc Chẵn, Lẻ, Bội Số</h1>
                <p className="text-sm text-slate-500 mt-0.5">
                    Đếm nghiệm{' '}
                    <InlineMath math="x_1 + \cdots + x_k = n" />{' '}
                    khi mỗi biến chỉ nhận giá trị chẵn, lẻ, hoặc bội của d.
                </p>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-[360px_1fr] gap-6 items-start">
                {/* ── Left ── */}
                <div className="space-y-4">
                    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5 space-y-5">
                        <p className="font-bold text-slate-800 text-sm flex items-center gap-2">
                            <span className="w-1.5 h-5 rounded-full bg-blue-500 inline-block" />
                            Nhập bài toán
                        </p>

                        {/* k */}
                        <div>
                            <label className="block text-sm font-semibold text-slate-700 mb-2">Số biến k</label>
                            <div className="flex gap-2">
                                {[2, 3, 4].map(kv => (
                                    <button key={kv} onClick={() => changeK(kv)}
                                        className={`flex-1 py-2 rounded-lg text-sm font-semibold border transition-all ${k === kv
                                            ? 'bg-blue-600 text-white border-blue-600'
                                            : 'bg-white text-slate-600 border-slate-300 hover:border-blue-400'
                                            }`}>
                                        {kv} biến
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* n */}
                        <div>
                            <label className="block text-sm font-semibold text-slate-700 mb-2">Tổng n</label>
                            <div className="flex items-center gap-2">
                                <button onClick={() => setN(Math.max(0, n - 1))}
                                    className="w-8 h-8 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50">−</button>
                                <input type="number" min={0} max={30} value={n}
                                    onChange={e => setN(Math.max(0, Math.min(30, parseInt(e.target.value) || 0)))}
                                    className="w-16 text-center border border-slate-300 rounded-lg py-1.5 font-bold text-slate-800 bg-white focus:outline-none focus:ring-2 focus:ring-blue-400" />
                                <button onClick={() => setN(Math.min(30, n + 1))}
                                    className="w-8 h-8 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50">+</button>
                                <span className="text-xs text-slate-400 ml-1">(tối đa 30)</span>
                            </div>
                        </div>

                        {/* Variables */}
                        <div className="space-y-3">
                            <label className="block text-sm font-semibold text-slate-700">Ràng buộc từng biến</label>
                            {vars.map((v, i) => (
                                <VarRow key={i} v={v} i={i} onChange={updateVar} />
                            ))}
                        </div>

                        {error && (
                            <div className="p-3 rounded-lg bg-red-50 border border-red-200 text-red-700 text-sm">
                                {error}
                            </div>
                        )}

                        <button onClick={handleSolve}
                            className="w-full py-3 rounded-xl bg-blue-600 text-white font-bold text-base hover:bg-blue-700 transition-colors shadow-sm">
                            ⚡ Tính bằng Hàm Sinh
                        </button>
                    </div>

                    {/* Theory box */}
                    <div className="bg-slate-50 rounded-2xl border border-slate-200 p-4 text-sm text-slate-600 space-y-2">
                        <p className="font-semibold text-slate-700">Bảng tra hàm sinh</p>
                        <div className="space-y-1 text-xs">
                            {CONSTRAINT_OPTIONS.map(opt => (
                                <div key={opt.id} className="flex items-center justify-between gap-2 py-0.5">
                                    <span className="text-slate-500">{opt.label}</span>
                                    <InlineMath math={opt.latex(3)} />
                                </div>
                            ))}
                        </div>
                    </div>
                </div>

                {/* ── Right: Result ── */}
                <div>
                    {!result
                        ? (
                            <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-12 text-center text-slate-400">
                                <div className="text-4xl mb-3">⚡</div>
                                <p className="text-base">Nhập ràng buộc rồi nhấn "Tính"</p>
                                <p className="text-sm mt-1 text-slate-300">Hàm sinh sẽ hiện đầy đủ ở đây</p>
                            </div>
                        )
                        : (
                            <div className="space-y-4">
                                {/* Step 1: GF per variable */}
                                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                                    <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                                        <StepBadge n={1} />
                                        Hàm sinh từng biến
                                    </p>
                                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                                        {result.vars.map((v, i) => (
                                            <div key={i} className="bg-slate-50 rounded-xl border border-slate-200 p-3 text-center">
                                                <p className="text-xs text-slate-500 mb-1">
                                                    <InlineMath math={`G_{${i + 1}}(x) =`} />
                                                </p>
                                                <BlockMath math={result.gfLabels[i]} />
                                                <p className="text-xs text-slate-400 mt-1">
                                                    <InlineMath math={result.constraintDescs[i]} />
                                                </p>
                                            </div>
                                        ))}
                                    </div>
                                </div>

                                {/* Step 2: Combined GF */}
                                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                                    <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                                        <StepBadge n={2} />
                                        Hàm sinh tổng hợp
                                    </p>
                                    <BlockMath math={`G(x) = ${result.combinedGFLatex}`} />
                                    <p className="text-sm text-slate-500 mt-1 text-center">
                                        Cần trích hệ số:&nbsp;
                                        <InlineMath math={`[x^{${n}}]\\,G(x)`} />
                                    </p>
                                </div>

                                {/* Step 3: Computation note */}
                                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                                    <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                                        <StepBadge n={3} color="emerald" />
                                        Nhân đa thức cắt tại bậc {n}
                                    </p>
                                    <p className="text-sm text-slate-600">
                                        Mỗi hàm sinh được khai triển thành chuỗi lũy thừa rồi nhân từng bước.
                                        Hệ số bậc{' '}
                                        <InlineMath math={`x^{${n}}`} />{' '}
                                        của tích chính là đáp án.
                                    </p>
                                </div>

                                {/* Answer */}
                                <div className="bg-gradient-to-r from-blue-600 to-emerald-600 rounded-2xl p-6 text-center shadow-md">
                                    <p className="text-blue-100 text-sm mb-2">
                                        Số cách viết{' '}
                                        <InlineMath math={`n = ${n}`} />{' '}
                                        thỏa mọi ràng buộc
                                    </p>
                                    <p className="text-white font-black" style={{ fontSize: '3.5rem', lineHeight: 1.1 }}>
                                        {fmtN(result.answer)}
                                    </p>
                                </div>
                            </div>
                        )
                    }
                </div>
            </div>
        </div>
    )
}
