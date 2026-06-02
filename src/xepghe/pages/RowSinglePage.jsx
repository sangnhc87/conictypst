/**
 * RowSinglePage — Trang bài toán 1 hàng ngang.
 * Hỗ trợ cả có/không ghế trống.
 */

import React, { useState, useCallback } from 'react'
import ClassInput from '../components/ClassInput.jsx'
import PIETable from '../components/PIETable.jsx'
import SeatRow from '../components/SeatRow.jsx'
import { computePIE } from '../utils/pie.js'
import { randomValidArrangement } from '../utils/seating.js'
import { CLASS_LABELS } from '../utils/colors.js'
import { fmtNumber } from '../utils/math.js'

const DEFAULT_CLASSES_2 = [
    { label: 'A', count: 3, forbidden: true },
    { label: 'B', count: 2, forbidden: true },
]

const DEFAULT_CLASSES_3 = [
    { label: 'A', count: 3, forbidden: true },
    { label: 'B', count: 2, forbidden: true },
    { label: 'C', count: 2, forbidden: true },
]

function buildDefaultClasses(n) {
    return CLASS_LABELS.slice(0, n).map((label, i) => ({
        label,
        count: [3, 2, 2, 2][i] ?? 2,
        forbidden: true,
    }))
}

/**
 * @param {Object} props
 * @param {boolean} props.hasBlank - có ghế trống không
 * @param {Function} props.onNavigate
 */
export default function RowSinglePage({ hasBlank = false, onNavigate }) {
    const [classes, setClasses] = useState(buildDefaultClasses(3))
    const [blankCount, setBlankCount] = useState(hasBlank ? 2 : 0)
    const [pieResult, setPieResult] = useState(null)
    const [arrangement, setArrangement] = useState(null)
    const [showAll, setShowAll] = useState(false)
    const [error, setError] = useState(null)

    // Xây classes đầy đủ (kể cả E nếu có ghế trống)
    function buildFullClasses() {
        const full = classes.map(c => ({ ...c, blank: false }))
        if (hasBlank && blankCount > 0) {
            full.push({ label: 'E', count: blankCount, forbidden: false, blank: true })
        }
        return full
    }

    function handleCompute() {
        setError(null)
        const full = buildFullClasses()
        const total = full.reduce((s, c) => s + c.count, 0)
        if (total < 2) {
            setError('Cần ít nhất 2 người/ghế để tạo bài toán.')
            return
        }
        if (total > 14) {
            setError('Tổng số ghế quá lớn (>14) — bảng PIE sẽ rất nhiều dòng. Hãy giảm lại.')
            return
        }
        const result = computePIE(full)
        setPieResult(result)
        setShowAll(false)

        // Sinh sắp xếp minh họa
        const arr = randomValidArrangement(full, 3000)
        setArrangement(arr)
    }

    function handleNewArrangement() {
        if (!pieResult) return
        const full = buildFullClasses()
        const arr = randomValidArrangement(full, 3000)
        setArrangement(arr)
    }

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-6">
            {/* Header */}
            <div>
                <h1 className="text-2xl font-bold text-slate-900">
                    {hasBlank ? 'Xếp Ghế 1 Hàng — Có Ghế Trống' : 'Xếp Ghế 1 Hàng Ngang'}
                </h1>
                <p className="text-sm text-slate-500 mt-0.5">
                    Phương pháp: Bao hàm – Loại trừ (PIE) · Nhập số liệu → tự động tính bảng
                </p>
            </div>

            {/* Layout: 2 cột (input | kết quả) */}
            <div className="grid grid-cols-1 lg:grid-cols-[360px_1fr] gap-6 items-start">
                {/* ── Cột trái: Input ── */}
                <div className="space-y-5">
                    <div className="bg-white rounded-2xl border border-gray-200 shadow-sm p-5">
                        <h2 className="font-bold text-gray-800 text-base mb-4 flex items-center gap-2">
                            <span className="w-1.5 h-5 rounded-full bg-blue-500 inline-block" />
                            Nhập bài toán
                        </h2>
                        <ClassInput
                            classes={classes}
                            onChange={setClasses}
                            blankCount={blankCount}
                            onBlankChange={setBlankCount}
                            hasBlank={hasBlank}
                            showForbiddenToggle={true}
                        />
                        {error && (
                            <div className="mt-3 p-3 rounded-lg bg-red-50 border border-red-200 text-red-700 text-sm">
                                {error}
                            </div>
                        )}
                        <button
                            type="button"
                            onClick={handleCompute}
                            className="w-full mt-5 py-3 rounded-xl bg-blue-600 text-white font-bold text-base hover:bg-blue-700 active:bg-blue-800 transition-colors shadow-sm"
                        >
                            🔢 Tính bảng PIE
                        </button>
                    </div>

                    {/* Mô phỏng sắp xếp */}
                    <div className="bg-white rounded-2xl border border-gray-200 shadow-sm p-5">
                        <div className="flex items-center justify-between mb-3">
                            <h2 className="font-bold text-gray-800 text-base flex items-center gap-2">
                                <span className="w-1.5 h-5 rounded-full bg-emerald-500 inline-block" />
                                Mô phỏng sắp xếp hợp lệ
                            </h2>
                            {arrangement && (
                                <button
                                    type="button"
                                    onClick={handleNewArrangement}
                                    className="text-xs px-3 py-1.5 rounded-lg bg-gray-100 hover:bg-gray-200 text-gray-600 font-medium transition-colors"
                                >
                                    🔀 Xáo lại
                                </button>
                            )}
                        </div>
                        {arrangement ? (
                            <SeatRow arrangement={arrangement} />
                        ) : (
                            <div className="text-sm text-gray-400 italic text-center py-6">
                                Nhấn "Tính bảng PIE" để sinh sắp xếp mẫu
                            </div>
                        )}
                        {arrangement === null && pieResult && (
                            <p className="text-xs text-red-500 mt-2 text-center">
                                Không tìm được sắp xếp hợp lệ sau 3000 lần thử — bài toán có thể vô nghiệm.
                            </p>
                        )}
                    </div>

                    {/* Lý thuyết tóm tắt */}
                    <div className="bg-white rounded-2xl border border-gray-200 shadow-sm p-5 space-y-3">
                        <h2 className="font-bold text-gray-700 text-sm flex items-center gap-2">
                            <span>📖</span> Ý tưởng phương pháp PIE
                        </h2>
                        <div className="text-xs text-gray-600 space-y-2 leading-relaxed">
                            <p>
                                <strong>Bước 1:</strong> Với mỗi dòng{' '}
                                <code className="bg-gray-100 px-1 rounded">(i, j, k, …)</code>, ghép{' '}
                                <em>i</em> cặp AA, <em>j</em> cặp BB, <em>k</em> cặp CC thành 1 thực thể duy nhất.
                            </p>
                            <p>
                                <strong>Bước 2:</strong> Đếm hoán vị các thực thể còn lại → nhân với số cách chọn cặp.
                            </p>
                            <p>
                                <strong>Dấu:</strong>{' '}
                                <code className="bg-gray-100 px-1 rounded">(-1)^(i+j+k+…)</code> — tầng chẵn dương,
                                tầng lẻ âm.
                            </p>
                            <p>
                                <strong>Kết quả:</strong> Tổng tất cả đóng góp = số cấu trúc lớp →
                                nhân giai thừa từng lớp ra đáp số N.
                            </p>
                            {hasBlank && (
                                <p className="text-amber-700 bg-amber-50 p-2 rounded-lg">
                                    <strong>⚠️ Ghế trống E:</strong> Không bị cấm kề nhau, luôn coi là ghế giống nhau
                                    (không nhân E! vào N). Dấu chỉ phụ thuộc vào{' '}
                                    <code className="bg-amber-100 px-1 rounded">i + j + k</code> (chỉ lớp có lệnh cấm), không phụ thuộc nE.
                                </p>
                            )}
                        </div>
                    </div>
                </div>

                {/* ── Cột phải: Bảng PIE + Kết quả ── */}
                <div>
                    {pieResult ? (
                        <div className="bg-white rounded-2xl border border-gray-200 shadow-sm p-5">
                            <div className="flex items-center justify-between mb-4">
                                <h2 className="font-bold text-gray-800 text-base flex items-center gap-2">
                                    <span className="w-1.5 h-5 rounded-full bg-violet-500 inline-block" />
                                    Bảng PIE — {pieResult.rows.length} dòng
                                </h2>
                                <div className="flex gap-2">
                                    <button
                                        type="button"
                                        onClick={() => setShowAll(v => !v)}
                                        className="text-xs px-3 py-1.5 rounded-lg bg-gray-100 hover:bg-gray-200 text-gray-600 font-medium transition-colors"
                                    >
                                        {showAll ? 'Chuyển sang từng bước' : 'Hiện tất cả'}
                                    </button>
                                </div>
                            </div>

                            {/* Tóm tắt đề bài */}
                            <div className="mb-4 p-3 rounded-xl bg-slate-50 border border-slate-200 text-sm text-slate-700">
                                <strong>Đề bài:</strong>{' '}
                                {pieResult.classes.filter(c => !c.blank).map((c, i, arr) => (
                                    <span key={c.label}>
                                        <strong>{c.count}</strong> HS lớp {c.label}
                                        {i < arr.length - 1 ? ', ' : ''}
                                    </span>
                                ))}
                                {pieResult.classes.find(c => c.blank) && (
                                    <span>
                                        , <strong>{pieResult.classes.find(c => c.blank).count}</strong> ghế trống
                                    </span>
                                )}
                                {' '}— Cấm kề:{' '}
                                {pieResult.forbidden.length > 0
                                    ? pieResult.forbidden.map(c => `lớp ${c.label}`).join(', ')
                                    : 'không có ràng buộc'}
                            </div>

                            <PIETable result={pieResult} showAll={showAll} key={JSON.stringify(pieResult.rows.length)} />
                        </div>
                    ) : (
                        <div className="bg-white rounded-2xl border-2 border-dashed border-gray-200 p-12 text-center">
                            <div className="text-5xl mb-4">🔢</div>
                            <h3 className="text-lg font-semibold text-gray-400 mb-2">
                                Chưa có kết quả
                            </h3>
                            <p className="text-sm text-gray-400">
                                Nhập số liệu bên trái rồi nhấn <strong>"Tính bảng PIE"</strong>
                            </p>
                        </div>
                    )}
                </div>
            </div>
        </div>
    )
}
