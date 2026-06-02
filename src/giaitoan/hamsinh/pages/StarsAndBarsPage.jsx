/**
 * StarsAndBarsPage — Dạng I: Vách Ngăn (Stars and Bars)
 *
 * Nhập k biến, tổng n, chặn dưới/trên cho từng biến.
 * Hiện bảng PIE đầy đủ và đáp án.
 */

import React, { useState } from 'react'
import { InlineMath, BlockMath } from 'react-katex'
import 'katex/dist/katex.min.css'
import { computeSAB } from '../utils/starsAndBars.js'
import { fmtN, C } from '../utils/gfEngine.js'

// ─── Helpers ──────────────────────────────────────────────────────

function buildVars(k) {
    return Array.from({ length: k }, (_, i) => ({
        label: `x_{${i + 1}}`,
        lo: 0,
        hi: 5,
        hasHi: false,
    }))
}

function StepBadge({ n, color = 'blue' }) {
    const cls = color === 'amber'
        ? 'bg-amber-100 text-amber-700'
        : color === 'emerald'
            ? 'bg-emerald-100 text-emerald-700'
            : 'bg-blue-100 text-blue-700'
    return (
        <span className={`inline-flex items-center justify-center w-5 h-5 rounded-full text-xs font-bold ${cls}`}>
            {n}
        </span>
    )
}

// ─── PIE Table ────────────────────────────────────────────────────

function PIETable({ result }) {
    const { k, nPrime, pieRows } = result
    const total = pieRows.reduce((s, r) => s + (r.skip ? 0 : r.contrib), 0)

    return (
        <div className="overflow-x-auto rounded-xl border border-slate-200 shadow-sm">
            <table className="w-full text-sm border-collapse min-w-[560px]">
                <thead>
                    <tr className="bg-slate-700 text-white text-xs">
                        <th className="px-3 py-2.5 text-left font-semibold">Tập vi phạm S</th>
                        <th className="px-3 py-2.5 text-center font-semibold">Dấu (−1)^|S|</th>
                        <th className="px-3 py-2.5 text-center font-semibold">Phần trừ</th>
                        <th className="px-3 py-2.5 text-center font-semibold">m = n′ − trừ</th>
                        <th className="px-3 py-2.5 text-center font-semibold">
                            <InlineMath math="C_{m+k-1}^{k-1}" />
                        </th>
                        <th className="px-3 py-2.5 text-right font-semibold">Đóng góp</th>
                    </tr>
                </thead>
                <tbody>
                    {pieRows.map((row, idx) => (
                        <tr
                            key={idx}
                            className={`border-b border-slate-200 ${row.skip
                                ? 'opacity-45 bg-slate-50'
                                : row.sign > 0
                                    ? 'bg-blue-50'
                                    : 'bg-red-50'
                                }`}
                        >
                            <td className="px-3 py-2 font-mono text-xs">
                                {row.subset.length === 0
                                    ? '∅'
                                    : <InlineMath math={'\\{' + row.subset.join(',\\,') + '\\}'} />
                                }
                            </td>
                            <td className="px-3 py-2 text-center">
                                <span className={`font-bold text-xl ${row.sign > 0 ? 'text-blue-600' : 'text-red-600'}`}>
                                    {row.sign > 0 ? '+' : '−'}
                                </span>
                            </td>
                            <td className="px-3 py-2 text-center font-mono">{row.excess}</td>
                            <td className="px-3 py-2 text-center font-mono">
                                {row.skip
                                    ? <span className="text-slate-400 text-xs">{'< 0 → bỏ'}</span>
                                    : row.m
                                }
                            </td>
                            <td className="px-3 py-2 text-center">
                                {!row.skip && (
                                    <InlineMath math={`C_{${row.m + k - 1}}^{${k - 1}} = ${row.term}`} />
                                )}
                                {row.skip && '—'}
                            </td>
                            <td className="px-3 py-2 text-right font-mono font-bold">
                                {row.skip
                                    ? <span className="text-slate-400">0</span>
                                    : <span className={row.contrib >= 0 ? 'text-blue-700' : 'text-red-700'}>
                                        {row.contrib >= 0 ? '+' : ''}{fmtN(row.contrib)}
                                    </span>
                                }
                            </td>
                        </tr>
                    ))}
                </tbody>
                <tfoot>
                    <tr className="bg-slate-800 text-white font-bold">
                        <td colSpan={5} className="px-3 py-3 text-sm">
                            Tổng số nghiệm nguyên thỏa mãn
                        </td>
                        <td className="px-3 py-3 text-right font-mono text-yellow-300 text-base">
                            {fmtN(total)}
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    )
}

// ─── Result panel ─────────────────────────────────────────────────

function SABResult({ result }) {
    const {
        n, k, vars, gfLabels, sumLo, nPrime,
        answer, hasLower, allUnbounded,
        combinedGFLatex, directFormulaLatex,
    } = result

    const problemLatex = vars.map(v => v.label).join(' + ') + ` = ${n}`
    const constraintLatex = vars.map(v =>
        v.hi === null
            ? `${v.label} \\geq ${v.lo}`
            : `${v.lo} \\leq ${v.label} \\leq ${v.hi}`
    ).join(',\\quad ')

    let stepNum = 0
    const step = () => ++stepNum

    return (
        <div className="space-y-4">
            {/* Problem statement */}
            <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                    <span className="w-1.5 h-5 rounded-full bg-violet-500 inline-block" />
                    Bài toán
                </p>
                <BlockMath math={`\\text{Đếm nghiệm nguyên: }${problemLatex}`} />
                <BlockMath math={`\\text{với }${constraintLatex}`} />
            </div>

            {/* Step 1: GF per variable */}
            <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                    <StepBadge n={step()} />
                    Hàm sinh từng biến
                </p>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    {vars.map((v, i) => (
                        <div key={i} className="bg-slate-50 rounded-xl border border-slate-200 p-3 text-center">
                            <p className="text-xs text-slate-500 mb-1">
                                <InlineMath math={`G_{${i + 1}}(x) =`} />
                            </p>
                            <BlockMath math={gfLabels[i]} />
                            <p className="text-xs text-slate-400 mt-1">
                                <InlineMath math={
                                    v.hi === null
                                        ? (v.lo === 0 ? `${v.label} \\geq 0` : `${v.label} \\geq ${v.lo}`)
                                        : `${v.lo} \\leq ${v.label} \\leq ${v.hi}`
                                } />
                            </p>
                        </div>
                    ))}
                </div>
            </div>

            {/* Step 2 (conditional): lower-bound substitution */}
            {hasLower && (
                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                    <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                        <StepBadge n={step()} color="amber" />
                        Phép tịnh tiến — loại bỏ chặn dưới
                    </p>
                    <div className="bg-amber-50 border border-amber-200 rounded-xl p-4 space-y-2 text-sm">
                        <p className="text-amber-800">
                            Đặt <InlineMath math={
                                vars.map((v, i) => `y_{${i + 1}} = ${v.label} - ${v.lo}`).join(',\\;')
                            } />
                        </p>
                        <p className="text-amber-700">
                            Bài toán trở thành:&nbsp;
                            <InlineMath math={
                                `y_1 + \\cdots + y_k = n' = ${n} - ${sumLo} = ${nPrime}`
                            } />
                        </p>
                        <p className="text-amber-700">
                            với&nbsp;
                            <InlineMath math={vars.map((v, i) => {
                                const ci = v.hi !== null ? v.hi - v.lo : null
                                return ci !== null
                                    ? `0 \\leq y_{${i + 1}} \\leq ${ci}`
                                    : `y_{${i + 1}} \\geq 0`
                            }).join(',\\;')} />
                        </p>
                    </div>
                </div>
            )}

            {/* Step 3: Combined GF */}
            <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                    <StepBadge n={step()} />
                    Hàm sinh tổng (sau tịnh tiến)
                </p>
                <BlockMath math={`G(x) = ${combinedGFLatex}`} />
                <p className="text-sm text-slate-500 mt-1 text-center">
                    Cần trích hệ số:&nbsp;
                    <InlineMath math={`[x^{${nPrime}}]\\,G(x)`} />
                </p>
            </div>

            {/* Step 4: Extraction */}
            {allUnbounded ? (
                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                    <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                        <StepBadge n={step()} color="emerald" />
                        Trích hệ số — Công thức vách ngăn trực tiếp
                    </p>
                    <BlockMath math={`[x^{${nPrime}}]\\,\\dfrac{1}{(1-x)^{${k}}} = ${directFormulaLatex}`} />
                </div>
            ) : (
                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                    <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                        <StepBadge n={step()} color="emerald" />
                        Bảng PIE — Bao hàm – Loại trừ theo chặn trên
                    </p>
                    <p className="text-xs text-slate-500 mb-3">
                        Khai triển tử số rồi dùng{' '}
                        <InlineMath math={`[x^m]\\,\\frac{1}{(1-x)^{${k}}} = C_{m+${k - 1}}^{${k - 1}}`} />
                    </p>
                    <PIETable result={result} />
                </div>
            )}

            {/* Answer */}
            <div className="bg-gradient-to-r from-blue-600 to-violet-600 rounded-2xl p-6 text-center shadow-md">
                <p className="text-blue-100 text-sm mb-2">Số nghiệm nguyên thỏa mãn</p>
                <p className="text-white font-black" style={{ fontSize: '3.5rem', lineHeight: 1.1 }}>
                    {fmtN(answer)}
                </p>
            </div>
        </div>
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
            {/* lo */}
            <div className="flex items-center gap-2">
                <span className="text-xs text-slate-500 w-20">Chặn dưới:</span>
                <button onClick={() => upd('lo', Math.max(0, v.lo - 1))}
                    className="w-6 h-6 rounded bg-white border border-slate-300 text-xs text-slate-600 hover:bg-slate-100">−</button>
                <input type="number" min={0} max={20} value={v.lo}
                    onChange={e => upd('lo', Math.max(0, parseInt(e.target.value) || 0))}
                    className="w-12 text-center border border-slate-300 rounded py-0.5 text-sm font-bold bg-white focus:outline-none focus:ring-1 focus:ring-blue-400" />
                <button onClick={() => upd('lo', Math.min(20, v.lo + 1))}
                    className="w-6 h-6 rounded bg-white border border-slate-300 text-xs text-slate-600 hover:bg-slate-100">+</button>
            </div>
            {/* hi */}
            <div className="flex items-center gap-2 flex-wrap">
                <label className="flex items-center gap-1.5 cursor-pointer">
                    <input type="checkbox" checked={v.hasHi}
                        onChange={e => upd('hasHi', e.target.checked)}
                        className="w-3.5 h-3.5 accent-blue-600" />
                    <span className="text-xs text-slate-500">Có chặn trên:</span>
                </label>
                {v.hasHi && (
                    <>
                        <button onClick={() => upd('hi', Math.max(v.lo, v.hi - 1))}
                            className="w-6 h-6 rounded bg-white border border-slate-300 text-xs text-slate-600 hover:bg-slate-100">−</button>
                        <input type="number" min={v.lo} max={30} value={v.hi}
                            onChange={e => upd('hi', Math.max(v.lo, parseInt(e.target.value) || v.lo))}
                            className="w-12 text-center border border-slate-300 rounded py-0.5 text-sm font-bold bg-white focus:outline-none focus:ring-1 focus:ring-blue-400" />
                        <button onClick={() => upd('hi', Math.min(30, v.hi + 1))}
                            className="w-6 h-6 rounded bg-white border border-slate-300 text-xs text-slate-600 hover:bg-slate-100">+</button>
                    </>
                )}
            </div>
            {/* Summary */}
            <p className="text-xs text-blue-600 font-mono">
                {v.lo} ≤ <InlineMath math={v.label} />{v.hasHi ? ` ≤ ${v.hi}` : ''}
            </p>
        </div>
    )
}

// ─── Main page ────────────────────────────────────────────────────

export default function StarsAndBarsPage({ onNavigate }) {
    const [k, setK] = useState(3)
    const [n, setN] = useState(10)
    const [vars, setVars] = useState(buildVars(3))
    const [result, setResult] = useState(null)
    const [error, setError] = useState(null)

    function changeK(newK) {
        setK(newK)
        setVars(buildVars(newK))
        setResult(null)
        setError(null)
    }

    function updateVar(i, field, val) {
        setVars(prev => prev.map((v, idx) => {
            if (idx !== i) return v
            const next = { ...v, [field]: val }
            // Keep hi ≥ lo
            if (field === 'lo' && next.hi < next.lo) next.hi = next.lo
            return next
        }))
        setResult(null)
    }

    function handleSolve() {
        setError(null)
        if (n < 1 || n > 30) { setError('n phải từ 1 đến 30.'); return }
        const cleanVars = vars.map(v => ({
            label: v.label,
            lo: v.lo,
            hi: v.hasHi ? v.hi : null,
        }))
        // Validate hi ≥ lo
        for (const v of cleanVars) {
            if (v.hi !== null && v.hi < v.lo) {
                setError(`Chặn trên của ${v.label} phải ≥ chặn dưới (${v.lo}).`)
                return
            }
        }
        const res = computeSAB(n, cleanVars)
        if (res.error) { setError(res.error); return }
        setResult(res)
    }

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-6">
            {/* Header */}
            <div>
                <h1 className="text-2xl font-bold text-slate-900">Vách Ngăn — Stars and Bars</h1>
                <p className="text-sm text-slate-500 mt-0.5">
                    Đếm nghiệm nguyên của{' '}
                    <InlineMath math="x_1 + x_2 + \cdots + x_k = n" />{' '}
                    với ràng buộc chặn. Hiện bảng PIE từng bước.
                </p>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-[360px_1fr] gap-6 items-start">
                {/* ── Left: Input ── */}
                <div className="space-y-4">
                    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5 space-y-5">
                        <p className="font-bold text-slate-800 text-sm flex items-center gap-2">
                            <span className="w-1.5 h-5 rounded-full bg-violet-500 inline-block" />
                            Nhập bài toán
                        </p>

                        {/* k */}
                        <div>
                            <label className="block text-sm font-semibold text-slate-700 mb-2">
                                Số biến k
                            </label>
                            <div className="flex gap-2">
                                {[2, 3, 4].map(kv => (
                                    <button key={kv} type="button" onClick={() => changeK(kv)}
                                        className={`flex-1 py-2 rounded-lg text-sm font-semibold border transition-all ${k === kv
                                            ? 'bg-violet-600 text-white border-violet-600'
                                            : 'bg-white text-slate-600 border-slate-300 hover:border-violet-400'
                                            }`}>
                                        {kv} biến
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* n */}
                        <div>
                            <label className="block text-sm font-semibold text-slate-700 mb-2">
                                Tổng n
                            </label>
                            <div className="flex items-center gap-2">
                                <button onClick={() => setN(Math.max(1, n - 1))}
                                    className="w-8 h-8 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50">−</button>
                                <input type="number" min={1} max={30} value={n}
                                    onChange={e => setN(Math.max(1, Math.min(30, parseInt(e.target.value) || 1)))}
                                    className="w-16 text-center border border-slate-300 rounded-lg py-1.5 font-bold text-slate-800 bg-white focus:outline-none focus:ring-2 focus:ring-violet-400" />
                                <button onClick={() => setN(Math.min(30, n + 1))}
                                    className="w-8 h-8 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50">+</button>
                                <span className="text-xs text-slate-400 ml-1">(tối đa 30)</span>
                            </div>
                        </div>

                        {/* Variables */}
                        <div className="space-y-3">
                            <label className="block text-sm font-semibold text-slate-700">
                                Ràng buộc từng biến
                            </label>
                            {vars.map((v, i) => (
                                <VarRow key={i} v={v} i={i} onChange={updateVar} />
                            ))}
                        </div>

                        {error && (
                            <div className="p-3 rounded-lg bg-red-50 border border-red-200 text-red-700 text-sm">
                                {error}
                            </div>
                        )}

                        <button type="button" onClick={handleSolve}
                            className="w-full py-3 rounded-xl bg-violet-600 text-white font-bold text-base hover:bg-violet-700 transition-colors shadow-sm">
                            🔢 Giải bằng Hàm Sinh + PIE
                        </button>
                    </div>

                    {/* Quick theory */}
                    <div className="bg-slate-50 rounded-2xl border border-slate-200 p-4 text-sm text-slate-600 space-y-2">
                        <p className="font-semibold text-slate-700">Nguyên lý chìa khóa</p>
                        <BlockMath math="\left[x^n\right]\!\frac{1}{(1-x)^k} = C_{n+k-1}^{k-1}" />
                        <p className="text-xs text-slate-500">
                            Khi có chặn trên, dùng PIE để bỏ các trường hợp vi phạm.
                        </p>
                    </div>
                </div>

                {/* ── Right: Result ── */}
                <div>
                    {!result
                        ? (
                            <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-12 text-center text-slate-400">
                                <div className="text-4xl mb-3">📐</div>
                                <p className="text-base">Nhập bài toán rồi nhấn "Giải"</p>
                                <p className="text-sm mt-1 text-slate-300">Bảng PIE sẽ hiện đầy đủ ở đây</p>
                            </div>
                        )
                        : <SABResult result={result} />
                    }
                </div>
            </div>
        </div>
    )
}
