/**
 * RowDoublePage — Trang bài toán 2 hàng đối diện.
 * Sử dụng phương pháp đặc trưng cột.
 */

import React, { useState } from 'react'
import SeatGrid from '../components/SeatGrid.jsx'
import ColSystemTable from '../components/ColSystemTable.jsx'
import { randomFacingArrangement } from '../utils/seating.js'
import { CLASS_LABELS } from '../utils/colors.js'

function buildDefaultClasses(n) {
    return CLASS_LABELS.slice(0, n).map((label, i) => ({
        label,
        count: [2, 2, 1, 1][i] ?? 2,
    }))
}

export default function RowDoublePage({ onNavigate }) {
    const [numClasses, setNumClasses] = useState(3)
    const [classCounts, setClassCounts] = useState(buildDefaultClasses(3))
    const [blankCount, setBlankCount] = useState(2)
    const [hasBlank, setHasBlank] = useState(true)
    const [computed, setComputed] = useState(false)
    const [arrangement, setArrangement] = useState(null)
    const [error, setError] = useState(null)

    function updateCount(i, val) {
        setClassCounts(prev => prev.map((c, idx) => idx === i ? { ...c, count: val } : c))
    }

    function changeNumClasses(n) {
        setNumClasses(n)
        setClassCounts(buildDefaultClasses(n))
        setComputed(false)
        setArrangement(null)
    }

    function handleCompute() {
        setError(null)
        const nA = classCounts[0]?.count ?? 0
        const nB = classCounts[1]?.count ?? 0
        const nC = numClasses >= 3 ? (classCounts[2]?.count ?? 0) : 0
        const nE = hasBlank ? blankCount : 0
        const total = nA + nB + nC + nE
        if (total % 2 !== 0) {
            setError('Tổng số (người + ghế trống) phải là số CHẴN vì mỗi cột có 2 ghế.')
            return
        }
        if (total === 0) {
            setError('Chưa nhập số người.')
            return
        }
        setComputed(true)
        // Sinh sắp xếp minh họa
        const all = [
            ...Array(nA).fill('A'),
            ...Array(nB).fill('B'),
            ...(nC > 0 ? Array(nC).fill('C') : []),
            ...(nE > 0 ? Array(nE).fill('E') : []),
        ]
        const half = all.length / 2
        const shuffled = [...all].sort(() => Math.random() - 0.5)
        setArrangement({ top: shuffled.slice(0, half), bottom: shuffled.slice(half) })
    }

    const nA = classCounts[0]?.count ?? 0
    const nB = classCounts[1]?.count ?? 0
    const nC = numClasses >= 3 ? (classCounts[2]?.count ?? 0) : 0
    const nE = hasBlank ? blankCount : 0

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-6">
            {/* Header */}
            <div>
                <h1 className="text-2xl font-bold text-slate-900">
                    Xếp Ghế 2 Hàng Đối Diện
                </h1>
                <p className="text-sm text-slate-500 mt-0.5">
                    Phương pháp: Đặc trưng cột (X, Y, Z, U, V, T, W) · Giải hệ phương trình tìm cấu hình cột
                </p>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-[360px_1fr] gap-6 items-start">
                {/* ── Cột trái: Input ── */}
                <div className="space-y-5">
                    <div className="bg-white rounded-2xl border border-gray-200 shadow-sm p-5 space-y-5">
                        <h2 className="font-bold text-gray-800 text-base flex items-center gap-2">
                            <span className="w-1.5 h-5 rounded-full bg-violet-500 inline-block" />
                            Nhập bài toán
                        </h2>

                        {/* Số lớp */}
                        <div>
                            <label className="block text-sm font-semibold text-gray-700 mb-2">Số lớp học</label>
                            <div className="flex gap-2">
                                {[2, 3].map(n => (
                                    <button
                                        key={n}
                                        type="button"
                                        onClick={() => changeNumClasses(n)}
                                        className={`
                      flex-1 py-2 rounded-lg text-sm font-semibold border transition-all
                      ${numClasses === n
                                                ? 'bg-violet-600 text-white border-violet-600 shadow-sm'
                                                : 'bg-white text-gray-600 border-gray-300 hover:border-violet-400 hover:text-violet-600'
                                            }
                    `}
                                    >
                                        {n} lớp
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* Số người từng lớp */}
                        <div className="space-y-2">
                            <label className="block text-sm font-semibold text-gray-700">Số người mỗi lớp</label>
                            {classCounts.slice(0, numClasses).map((cls, i) => (
                                <div key={cls.label} className="flex items-center gap-3">
                                    <span className="w-16 font-bold text-gray-700">Lớp {cls.label}:</span>
                                    <div className="flex items-center gap-1">
                                        <button
                                            type="button"
                                            onClick={() => updateCount(i, Math.max(1, cls.count - 1))}
                                            className="w-7 h-7 rounded-lg bg-gray-100 border border-gray-300 text-gray-600 font-bold hover:bg-gray-200 text-sm"
                                        >
                                            −
                                        </button>
                                        <input
                                            type="number"
                                            min={1}
                                            max={8}
                                            value={cls.count}
                                            onChange={e => {
                                                const v = parseInt(e.target.value, 10)
                                                if (!isNaN(v) && v >= 1 && v <= 8) updateCount(i, v)
                                            }}
                                            className="w-12 text-center border border-gray-300 rounded-lg py-1 font-bold text-gray-800 bg-white focus:outline-none focus:ring-2 focus:ring-violet-400"
                                        />
                                        <button
                                            type="button"
                                            onClick={() => updateCount(i, Math.min(8, cls.count + 1))}
                                            className="w-7 h-7 rounded-lg bg-gray-100 border border-gray-300 text-gray-600 font-bold hover:bg-gray-200 text-sm"
                                        >
                                            +
                                        </button>
                                        <span className="text-xs text-gray-500 ml-1">người</span>
                                    </div>
                                </div>
                            ))}
                        </div>

                        {/* Ghế trống */}
                        <div>
                            <label className="flex items-center gap-2 mb-2 cursor-pointer">
                                <input
                                    type="checkbox"
                                    checked={hasBlank}
                                    onChange={e => setHasBlank(e.target.checked)}
                                    className="w-4 h-4 accent-violet-600"
                                />
                                <span className="text-sm font-semibold text-gray-700">Có ghế trống (E)</span>
                            </label>
                            {hasBlank && (
                                <div className="flex items-center gap-2 ml-6">
                                    <button
                                        type="button"
                                        onClick={() => setBlankCount(Math.max(0, blankCount - 1))}
                                        className="w-7 h-7 rounded-lg bg-gray-100 border border-gray-300 text-gray-600 font-bold hover:bg-gray-200 text-sm"
                                    >
                                        −
                                    </button>
                                    <input
                                        type="number"
                                        min={0}
                                        max={8}
                                        value={blankCount}
                                        onChange={e => {
                                            const v = parseInt(e.target.value, 10)
                                            if (!isNaN(v) && v >= 0 && v <= 8) setBlankCount(v)
                                        }}
                                        className="w-12 text-center border border-gray-300 rounded-lg py-1 font-bold text-gray-800 bg-white focus:outline-none focus:ring-2 focus:ring-violet-400"
                                    />
                                    <button
                                        type="button"
                                        onClick={() => setBlankCount(Math.min(8, blankCount + 1))}
                                        className="w-7 h-7 rounded-lg bg-gray-100 border border-gray-300 text-gray-600 font-bold hover:bg-gray-200 text-sm"
                                    >
                                        +
                                    </button>
                                    <span className="text-xs text-gray-500 ml-1">ghế trống</span>
                                </div>
                            )}
                        </div>

                        {/* Tóm tắt */}
                        <div className="p-3 rounded-lg bg-violet-50 border border-violet-200 text-sm text-violet-700">
                            <strong>Bài toán:</strong>{' '}
                            Lưới {(nA + nB + nC + nE) / 2} × 2 ghế.{' '}
                            {classCounts.slice(0, numClasses).map((c, i) => (
                                <span key={c.label}>
                                    <strong>{c.count}</strong> HS lớp {c.label}
                                    {i < numClasses - 1 ? ', ' : ''}
                                </span>
                            ))}
                            {hasBlank && nE > 0 && (
                                <span>, <strong>{nE}</strong> ghế trống</span>
                            )}.{' '}
                            Tổng:{' '}
                            <strong
                                className={
                                    (nA + nB + nC + nE) % 2 !== 0 ? 'text-red-600' : 'text-violet-700'
                                }
                            >
                                {nA + nB + nC + nE} ghế
                            </strong>
                            {(nA + nB + nC + nE) % 2 !== 0 && (
                                <span className="text-red-600 ml-1 font-bold">⚠️ Phải là số chẵn!</span>
                            )}
                        </div>

                        {error && (
                            <div className="p-3 rounded-lg bg-red-50 border border-red-200 text-red-700 text-sm">
                                {error}
                            </div>
                        )}

                        <button
                            type="button"
                            onClick={handleCompute}
                            className="w-full py-3 rounded-xl bg-violet-600 text-white font-bold text-base hover:bg-violet-700 active:bg-violet-800 transition-colors shadow-sm"
                        >
                            📊 Phân tích đặc trưng cột
                        </button>
                    </div>

                    {/* Mô phỏng */}
                    <div className="bg-white rounded-2xl border border-gray-200 shadow-sm p-5">
                        <div className="flex items-center justify-between mb-3">
                            <h2 className="font-bold text-gray-800 text-sm flex items-center gap-2">
                                <span className="w-1.5 h-4 rounded-full bg-emerald-500 inline-block" />
                                Mô phỏng sắp xếp
                            </h2>
                            {arrangement && (
                                <button
                                    type="button"
                                    onClick={handleCompute}
                                    className="text-xs px-3 py-1.5 rounded-lg bg-gray-100 hover:bg-gray-200 text-gray-600 font-medium"
                                >
                                    🔀 Xáo lại
                                </button>
                            )}
                        </div>
                        {arrangement ? (
                            <SeatGrid
                                top={arrangement.top}
                                bottom={arrangement.bottom}
                                topLabel="Hàng 1 →"
                                bottomLabel="Hàng 2 ←"
                            />
                        ) : (
                            <div className="text-sm text-gray-400 italic text-center py-5">
                                Nhấn "Phân tích đặc trưng cột" để hiển thị
                            </div>
                        )}
                    </div>

                    {/* Lý thuyết */}
                    <div className="bg-white rounded-2xl border border-gray-200 shadow-sm p-5 space-y-3">
                        <h2 className="font-bold text-gray-700 text-sm flex items-center gap-2">
                            <span>📖</span> Phương pháp đặc trưng cột
                        </h2>
                        <div className="text-xs text-gray-600 space-y-2 leading-relaxed">
                            <p>
                                Coi mỗi cột (2 ghế đối diện) là 1 đơn vị. Phân loại cột theo cặp lớp học
                                chứa trong đó: X=&#123;A,B&#125;, Y=&#123;A,C&#125;, Z=&#123;B,C&#125;, ...
                            </p>
                            <p>
                                <strong>Bước 1:</strong> Giải hệ phương trình tuyến tính nguyên không âm
                                để tìm số lượng cột mỗi loại.
                            </p>
                            <p>
                                <strong>Bước 2:</strong> Với mỗi nghiệm (cấu hình cột),
                                đếm số thứ tự cột (hoán vị đa tập) × số hướng (2^k cho k cột dị).
                            </p>
                            <p>
                                <strong>Bước 3:</strong> Nhân với giai thừa từng lớp để ra N.
                            </p>
                        </div>
                    </div>
                </div>

                {/* ── Cột phải: Kết quả ── */}
                <div>
                    {computed ? (
                        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm p-5">
                            <h2 className="font-bold text-gray-800 text-base mb-4 flex items-center gap-2">
                                <span className="w-1.5 h-5 rounded-full bg-violet-500 inline-block" />
                                Phân tích đặc trưng cột
                            </h2>
                            <ColSystemTable nA={nA} nB={nB} nC={nC} nE={nE} key={`${nA}-${nB}-${nC}-${nE}`} />
                        </div>
                    ) : (
                        <div className="bg-white rounded-2xl border-2 border-dashed border-gray-200 p-12 text-center">
                            <div className="text-5xl mb-4">📊</div>
                            <h3 className="text-lg font-semibold text-gray-400 mb-2">Chưa có kết quả</h3>
                            <p className="text-sm text-gray-400">
                                Nhập số liệu bên trái rồi nhấn{' '}
                                <strong>"Phân tích đặc trưng cột"</strong>
                            </p>
                        </div>
                    )}
                </div>
            </div>
        </div>
    )
}
