/**
 * ClassInput — Panel nhập cấu hình bài toán xếp ghế.
 * Cho phép cài số lớp (2-4), số người mỗi lớp, lớp nào bị cấm kề, số ghế trống.
 */

import React from 'react'
import { CLASS_LABELS, CLASS_COLORS } from '../utils/colors.js'

const MIN_COUNT = 1
const MAX_COUNT = 10

/**
 * @param {Object} props
 * @param {Array<{label, count, forbidden}>} props.classes
 * @param {Function} props.onChange - (newClasses) => void
 * @param {number} props.blankCount - số ghế trống
 * @param {Function} props.onBlankChange - (n) => void
 * @param {boolean} props.hasBlank - có ghế trống hay không
 * @param {boolean} props.showForbiddenToggle - hiện checkbox "bị cấm kề" không
 */
export default function ClassInput({
    classes,
    onChange,
    blankCount,
    onBlankChange,
    hasBlank = false,
    showForbiddenToggle = true,
}) {
    const numClasses = classes.length

    function setNumClasses(n) {
        const next = CLASS_LABELS.slice(0, n).map((label, i) => ({
            label,
            count: classes[i]?.count ?? 3,
            forbidden: classes[i]?.forbidden ?? true,
        }))
        onChange(next)
    }

    function updateClass(index, field, value) {
        const next = classes.map((c, i) =>
            i === index ? { ...c, [field]: value } : c,
        )
        onChange(next)
    }

    return (
        <div className="space-y-5">
            {/* Chọn số lớp */}
            <div>
                <label className="block text-sm font-semibold text-gray-700 mb-2">
                    Số lớp học
                </label>
                <div className="flex gap-2">
                    {[2, 3, 4].map(n => (
                        <button
                            key={n}
                            type="button"
                            onClick={() => setNumClasses(n)}
                            className={`
                flex-1 py-2 rounded-lg text-sm font-semibold border transition-all
                ${numClasses === n
                                    ? 'bg-blue-600 text-white border-blue-600 shadow-sm'
                                    : 'bg-white text-gray-600 border-gray-300 hover:border-blue-400 hover:text-blue-600'
                                }
              `}
                        >
                            {n} lớp
                        </button>
                    ))}
                </div>
            </div>

            {/* Nhập từng lớp */}
            <div className="space-y-3">
                <label className="block text-sm font-semibold text-gray-700">
                    Số người mỗi lớp
                </label>
                {classes.map((cls, i) => {
                    const colors = CLASS_COLORS[cls.label] || CLASS_COLORS['A']
                    return (
                        <div
                            key={cls.label}
                            className={`flex items-center gap-3 p-3 rounded-xl border-2 ${colors.light} transition-all`}
                        >
                            {/* Màu chấm + tên lớp */}
                            <div className="flex items-center gap-2 w-16">
                                <span
                                    className="w-4 h-4 rounded-full flex-shrink-0"
                                    style={{ backgroundColor: colors.dot }}
                                />
                                <span className="font-bold text-gray-800 text-base">Lớp {cls.label}</span>
                            </div>

                            {/* Spinner số người */}
                            <div className="flex items-center gap-1">
                                <button
                                    type="button"
                                    onClick={() => updateClass(i, 'count', Math.max(MIN_COUNT, cls.count - 1))}
                                    className="w-7 h-7 rounded-lg bg-white border border-gray-300 text-gray-600 font-bold hover:bg-gray-50 active:bg-gray-100 text-sm"
                                >
                                    −
                                </button>
                                <input
                                    type="number"
                                    min={MIN_COUNT}
                                    max={MAX_COUNT}
                                    value={cls.count}
                                    onChange={e => {
                                        const v = parseInt(e.target.value, 10)
                                        if (!isNaN(v) && v >= MIN_COUNT && v <= MAX_COUNT) {
                                            updateClass(i, 'count', v)
                                        }
                                    }}
                                    className="w-12 text-center border border-gray-300 rounded-lg py-1 font-bold text-gray-800 bg-white focus:outline-none focus:ring-2 focus:ring-blue-400"
                                />
                                <button
                                    type="button"
                                    onClick={() => updateClass(i, 'count', Math.min(MAX_COUNT, cls.count + 1))}
                                    className="w-7 h-7 rounded-lg bg-white border border-gray-300 text-gray-600 font-bold hover:bg-gray-50 active:bg-gray-100 text-sm"
                                >
                                    +
                                </button>
                                <span className="text-xs text-gray-500 ml-1">người</span>
                            </div>

                            {/* Checkbox cấm kề */}
                            {showForbiddenToggle && (
                                <label className="flex items-center gap-1.5 ml-auto cursor-pointer">
                                    <input
                                        type="checkbox"
                                        checked={cls.forbidden}
                                        onChange={e => updateClass(i, 'forbidden', e.target.checked)}
                                        className="w-4 h-4 rounded accent-blue-600"
                                    />
                                    <span className="text-xs text-gray-600 whitespace-nowrap">
                                        Cấm kề cùng lớp
                                    </span>
                                </label>
                            )}
                        </div>
                    )
                })}
            </div>

            {/* Ghế trống */}
            {hasBlank && (
                <div className="p-3 rounded-xl border-2 bg-gray-50 border-gray-200">
                    <div className="flex items-center gap-3">
                        <span className="text-2xl">🪑</span>
                        <span className="font-bold text-gray-700 w-28">Ghế trống (E)</span>
                        <div className="flex items-center gap-1">
                            <button
                                type="button"
                                onClick={() => onBlankChange(Math.max(0, blankCount - 1))}
                                className="w-7 h-7 rounded-lg bg-white border border-gray-300 text-gray-600 font-bold hover:bg-gray-50 text-sm"
                            >
                                −
                            </button>
                            <input
                                type="number"
                                min={0}
                                max={10}
                                value={blankCount}
                                onChange={e => {
                                    const v = parseInt(e.target.value, 10)
                                    if (!isNaN(v) && v >= 0 && v <= 10) onBlankChange(v)
                                }}
                                className="w-12 text-center border border-gray-300 rounded-lg py-1 font-bold text-gray-800 bg-white focus:outline-none focus:ring-2 focus:ring-blue-400"
                            />
                            <button
                                type="button"
                                onClick={() => onBlankChange(Math.min(10, blankCount + 1))}
                                className="w-7 h-7 rounded-lg bg-white border border-gray-300 text-gray-600 font-bold hover:bg-gray-50 text-sm"
                            >
                                +
                            </button>
                            <span className="text-xs text-gray-500 ml-1">ghế</span>
                        </div>
                        <span className="text-xs text-gray-400 ml-auto italic">
                            (không bị cấm, không tính giai thừa)
                        </span>
                    </div>
                </div>
            )}

            {/* Tóm tắt bài toán */}
            <div className="p-3 rounded-lg bg-blue-50 border border-blue-200 text-sm">
                <span className="font-semibold text-blue-800">Bài toán: </span>
                <span className="text-blue-700">
                    Xếp{' '}
                    {classes.map((c, i) => (
                        <span key={c.label}>
                            <strong>{c.count}</strong> học sinh lớp {c.label}
                            {i < classes.length - 1 ? ', ' : ''}
                        </span>
                    ))}
                    {hasBlank && blankCount > 0 && (
                        <span>
                            {' '}và <strong>{blankCount}</strong> ghế trống
                        </span>
                    )}{' '}
                    vào 1 hàng ngang. Không có 2 học sinh{' '}
                    {classes.filter(c => c.forbidden).map(c => `lớp ${c.label}`).join(', ')}
                    {' '}cùng lớp ngồi liền kề nhau.
                </span>
            </div>
        </div>
    )
}
