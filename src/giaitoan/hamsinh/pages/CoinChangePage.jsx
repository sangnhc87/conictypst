/**
 * CoinChangePage — Dạng III: Đổi Tiền (Coin Change / Partition)
 *
 * Đếm số cách dùng mệnh giá cho trước để tạo tổng n.
 * Hiện bảng DP trực quan và LaTeX hàm sinh.
 */

import React, { useState, useMemo } from 'react'
import { InlineMath, BlockMath } from 'react-katex'
import 'katex/dist/katex.min.css'
import { computeCoinChange, PRESETS } from '../utils/coinChange.js'
import { fmtN } from '../utils/gfEngine.js'

// ─── DP Table ────────────────────────────────────────────────────

function DPTable({ dpTable, target }) {
    if (!dpTable || dpTable.length === 0) return null
    const cols = target + 1

    // How wide to show — cap at 20 for readability
    const show = Math.min(cols, 21)

    return (
        <div className="overflow-x-auto rounded-xl border border-slate-200 shadow-sm">
            <table className="border-collapse text-xs text-center min-w-full">
                <thead>
                    <tr className="bg-slate-700 text-white">
                        <th className="px-2 py-2 font-semibold text-left w-24 min-w-[6rem]">Sau xu</th>
                        {Array.from({ length: show }, (_, j) => (
                            <th key={j}
                                className={`px-1.5 py-2 font-semibold w-10 min-w-[2.5rem] ${j === target && target < show ? 'bg-yellow-500 text-slate-900' : ''}`}>
                                {j}
                            </th>
                        ))}
                        {show < cols && (
                            <th className="px-2 py-2 text-slate-300">… {target}</th>
                        )}
                    </tr>
                </thead>
                <tbody>
                    {dpTable.map(({ coin, row }, ri) => (
                        <tr key={ri} className={ri % 2 === 0 ? 'bg-white' : 'bg-slate-50'}>
                            <td className="px-2 py-1.5 font-mono font-bold text-blue-700 text-left">
                                {coin}
                            </td>
                            {Array.from({ length: show }, (_, j) => (
                                <td key={j}
                                    className={`px-1 py-1.5 font-mono ${j === target && target < show
                                        ? 'font-black text-yellow-700 bg-yellow-100'
                                        : row[j] > 0 ? 'text-slate-800' : 'text-slate-300'
                                        } ${ri === dpTable.length - 1 && row[j] > 0
                                            ? 'bg-emerald-50'
                                            : ''
                                        }`}>
                                    {row[j]}
                                </td>
                            ))}
                            {show < cols && (
                                <td className="px-2 py-1.5 font-mono font-black text-emerald-700">
                                    {row[target]}
                                </td>
                            )}
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

// ─── Parse custom coin input ─────────────────────────────────────

function parseCoins(str) {
    return str
        .split(/[,\s]+/)
        .map(s => parseInt(s.trim()))
        .filter(n => Number.isInteger(n) && n >= 1)
        .slice(0, 12)
}

// ─── Main page ────────────────────────────────────────────────────

export default function CoinChangePage({ onNavigate }) {
    const [presetIdx, setPresetIdx] = useState(2)       // default: [1,2,5]
    const [customMode, setCustomMode] = useState(false)
    const [customStr, setCustomStr] = useState('')
    const [n, setN] = useState(10)
    const [result, setResult] = useState(null)
    const [error, setError] = useState(null)

    const currentCoins = useMemo(() => {
        if (customMode) return parseCoins(customStr)
        return PRESETS[presetIdx]?.coins ?? []
    }, [customMode, customStr, presetIdx])

    function handleSolve() {
        setError(null)
        if (currentCoins.length === 0) { setError('Nhập ít nhất 1 mệnh giá hợp lệ.'); return }
        if (n < 0 || n > 300) { setError('n phải từ 0 đến 300.'); return }
        const res = computeCoinChange(currentCoins, n)
        setResult(res)
    }

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-6">
            {/* Header */}
            <div>
                <h1 className="text-2xl font-bold text-slate-900">Đổi Tiền — Coin Change</h1>
                <p className="text-sm text-slate-500 mt-0.5">
                    Đếm số cách đổi{' '}
                    <InlineMath math="n" />{' '}
                    đồng bằng các mệnh giá cho trước. Bảng DP trực quan.
                </p>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-[380px_1fr] gap-6 items-start">
                {/* ── Left ── */}
                <div className="space-y-4">
                    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5 space-y-5">
                        <p className="font-bold text-slate-800 text-sm flex items-center gap-2">
                            <span className="w-1.5 h-5 rounded-full bg-emerald-500 inline-block" />
                            Nhập bài toán
                        </p>

                        {/* Denomination mode */}
                        <div className="flex gap-2">
                            <button onClick={() => setCustomMode(false)}
                                className={`flex-1 py-1.5 rounded-lg text-sm font-semibold border transition-all ${!customMode
                                    ? 'bg-emerald-600 text-white border-emerald-600'
                                    : 'bg-white text-slate-600 border-slate-300 hover:border-emerald-400'
                                    }`}>
                                Mẫu có sẵn
                            </button>
                            <button onClick={() => setCustomMode(true)}
                                className={`flex-1 py-1.5 rounded-lg text-sm font-semibold border transition-all ${customMode
                                    ? 'bg-emerald-600 text-white border-emerald-600'
                                    : 'bg-white text-slate-600 border-slate-300 hover:border-emerald-400'
                                    }`}>
                                Tùy chỉnh
                            </button>
                        </div>

                        {/* Preset selector */}
                        {!customMode && (
                            <div className="space-y-1.5">
                                <label className="block text-sm font-semibold text-slate-700">Bộ mệnh giá</label>
                                {PRESETS.map((p, i) => (
                                    <button key={i} onClick={() => { setPresetIdx(i); setResult(null) }}
                                        className={`w-full text-left px-3 py-2 rounded-lg border text-sm transition-all ${presetIdx === i
                                            ? 'bg-emerald-50 border-emerald-400 text-emerald-800 font-semibold'
                                            : 'bg-white border-slate-200 text-slate-600 hover:border-emerald-300'
                                            }`}>
                                        {p.label}
                                    </button>
                                ))}
                            </div>
                        )}

                        {/* Custom input */}
                        {customMode && (
                            <div>
                                <label className="block text-sm font-semibold text-slate-700 mb-1.5">
                                    Nhập mệnh giá (cách nhau bằng dấu phẩy)
                                </label>
                                <input
                                    type="text"
                                    placeholder="Ví dụ: 1, 3, 7"
                                    value={customStr}
                                    onChange={e => { setCustomStr(e.target.value); setResult(null) }}
                                    className="w-full border border-slate-300 rounded-lg px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-emerald-400"
                                />
                                {currentCoins.length > 0 && (
                                    <p className="text-xs text-emerald-600 mt-1">
                                        Nhận dạng: {currentCoins.join(', ')}
                                    </p>
                                )}
                            </div>
                        )}

                        {/* Target n */}
                        <div>
                            <label className="block text-sm font-semibold text-slate-700 mb-2">Tổng cần đổi n</label>
                            <div className="flex items-center gap-2">
                                <button onClick={() => setN(Math.max(0, n - 1))}
                                    className="w-8 h-8 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50">−</button>
                                <input type="number" min={0} max={300} value={n}
                                    onChange={e => setN(Math.max(0, Math.min(300, parseInt(e.target.value) || 0)))}
                                    className="w-20 text-center border border-slate-300 rounded-lg py-1.5 font-bold text-slate-800 bg-white focus:outline-none focus:ring-2 focus:ring-emerald-400" />
                                <button onClick={() => setN(Math.min(300, n + 1))}
                                    className="w-8 h-8 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50">+</button>
                                <span className="text-xs text-slate-400 ml-1">(tối đa 300)</span>
                            </div>
                        </div>

                        {error && (
                            <div className="p-3 rounded-lg bg-red-50 border border-red-200 text-red-700 text-sm">
                                {error}
                            </div>
                        )}

                        <button onClick={handleSolve}
                            className="w-full py-3 rounded-xl bg-emerald-600 text-white font-bold text-base hover:bg-emerald-700 transition-colors shadow-sm">
                            💰 Đếm số cách đổi tiền
                        </button>
                    </div>

                    {/* Theory */}
                    <div className="bg-slate-50 rounded-2xl border border-slate-200 p-4 text-sm text-slate-600 space-y-2">
                        <p className="font-semibold text-slate-700">Ý tưởng hàm sinh</p>
                        <p className="text-xs text-slate-500">
                            Mỗi mệnh giá <InlineMath math="c" /> đóng góp hàm sinh:
                        </p>
                        <BlockMath math="\frac{1}{1-x^c} = 1 + x^c + x^{2c} + \cdots" />
                        <p className="text-xs text-slate-500">
                            Tích toàn bộ → đếm tất cả các phân hoạch.
                        </p>
                    </div>
                </div>

                {/* ── Right: Result ── */}
                <div>
                    {!result
                        ? (
                            <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-12 text-center text-slate-400">
                                <div className="text-4xl mb-3">💰</div>
                                <p className="text-base">Chọn mệnh giá và nhấn "Đếm"</p>
                                <p className="text-sm mt-1 text-slate-300">Bảng DP sẽ hiện ở đây</p>
                            </div>
                        )
                        : (
                            <div className="space-y-4">
                                {/* GF */}
                                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                                    <p className="font-bold text-slate-700 text-sm mb-3 flex items-center gap-2">
                                        <span className="inline-flex items-center justify-center w-5 h-5 rounded-full text-xs font-bold bg-emerald-100 text-emerald-700">1</span>
                                        Hàm sinh — tích hàm từng mệnh giá
                                    </p>
                                    <BlockMath math={`G(x) = ${result.gfLatex}`} />
                                    <p className="text-sm text-slate-500 mt-1 text-center">
                                        Đáp án = <InlineMath math={`[x^{${n}}]\\,G(x)`} />
                                    </p>
                                </div>

                                {/* DP table */}
                                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5">
                                    <p className="font-bold text-slate-700 text-sm mb-1 flex items-center gap-2">
                                        <span className="inline-flex items-center justify-center w-5 h-5 rounded-full text-xs font-bold bg-emerald-100 text-emerald-700">2</span>
                                        Bảng DP — tích lũy theo từng xu
                                    </p>
                                    <p className="text-xs text-slate-400 mb-3">
                                        Hàng "xu c" cho biết số cách dùng các xu ≤ c để tạo mỗi tổng.
                                        {result.denominations.length > 0 && n > 20 && (
                                            <> Bảng cắt ở cột 20 — xem cột cuối để biết giá trị tại n = {n}.</>
                                        )}
                                    </p>
                                    <DPTable dpTable={result.dpTable} target={n} />
                                </div>

                                {/* Answer */}
                                <div className="bg-gradient-to-r from-emerald-600 to-teal-600 rounded-2xl p-6 text-center shadow-md">
                                    <p className="text-emerald-100 text-sm mb-2">
                                        Số cách đổi{' '}
                                        <InlineMath math={`n = ${n}`} />{' '}
                                        bằng mệnh giá [{result.denominations.join(', ')}]
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
