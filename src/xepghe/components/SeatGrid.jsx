/**
 * SeatGrid — Mô phỏng 2 hàng ghế ĐỐI DIỆN.
 * Cột i: ghế trên (top[i]) đối diện ghế dưới (bottom[i]).
 */

import React from 'react'
import { CLASS_COLORS } from '../utils/colors.js'

function SeatCell({ label, position }) {
    const colors = CLASS_COLORS[label] || CLASS_COLORS['E']
    const isBlank = label === 'E'
    return (
        <div
            className={`
        flex flex-col items-center justify-center
        w-10 h-11 rounded-lg font-bold text-sm
        shadow-sm select-none
        ${isBlank
                    ? 'bg-gray-100 border-2 border-dashed border-gray-300 text-gray-400'
                    : `${colors.bg} ${colors.text} shadow-md`
                }
      `}
            title={isBlank ? 'Ghế trống' : `Lớp ${label}`}
        >
            <div className="text-xs opacity-50 leading-none">{position === 'top' ? '▲' : '▼'}</div>
            <div className="text-sm font-bold leading-none mt-0.5">
                {isBlank ? '—' : label}
            </div>
        </div>
    )
}

/**
 * @param {Object} props
 * @param {string[]} props.top - hàng trên
 * @param {string[]} props.bottom - hàng dưới
 * @param {string} [props.topLabel]
 * @param {string} [props.bottomLabel]
 */
export default function SeatGrid({ top, bottom, topLabel = 'Hàng 1', bottomLabel = 'Hàng 2' }) {
    if (!top || !bottom || top.length === 0) {
        return (
            <div className="rounded-xl border border-dashed border-gray-300 p-4 text-center text-gray-400 text-sm">
                Chưa có sắp xếp để hiển thị
            </div>
        )
    }

    const m = top.length

    return (
        <div className="space-y-1">
            <div className="flex items-center gap-3 p-4 bg-gray-50 rounded-xl border border-gray-200">
                {/* Nhãn hàng */}
                <div className="flex flex-col gap-7 text-xs font-medium text-gray-500 text-right pr-1">
                    <span>{topLabel}</span>
                    <span>{bottomLabel}</span>
                </div>

                {/* Lưới ghế */}
                <div className="flex gap-1.5">
                    {Array.from({ length: m }, (_, i) => (
                        <div key={i} className="flex flex-col items-center gap-1">
                            {/* Số cột */}
                            <div className="text-[10px] font-mono text-gray-400 mb-0.5">{i + 1}</div>
                            <SeatCell label={top[i]} position="top" />
                            {/* Đường nối dọc */}
                            <div className="w-px h-3 bg-gray-400" />
                            <SeatCell label={bottom[i]} position="bottom" />
                        </div>
                    ))}
                </div>
            </div>

            {/* Chú thích */}
            <div className="flex flex-wrap gap-2 justify-center pt-1">
                {[...new Set([...top, ...bottom])].sort().map(label => {
                    const count = [...top, ...bottom].filter(l => l === label).length
                    const colors = CLASS_COLORS[label] || CLASS_COLORS['E']
                    return (
                        <span
                            key={label}
                            className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium ${colors.badge}`}
                        >
                            <span className="w-2 h-2 rounded-full" style={{ backgroundColor: colors.dot }} />
                            {label === 'E' ? 'Ghế trống' : `Lớp ${label}`}: {count} ghế
                        </span>
                    )
                })}
            </div>
        </div>
    )
}
