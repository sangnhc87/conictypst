/**
 * SeatRow — Mô phỏng 1 hàng ghế ngang.
 * Mỗi ghế là một ô vuông màu tương ứng lớp học.
 */

import React from 'react'
import { CLASS_COLORS } from '../utils/colors.js'

/**
 * @param {Object} props
 * @param {string[]} props.arrangement - mảng nhãn lớp, VD: ['A','E','B','A','C']
 * @param {Set<string>} [props.highlightPairs] - cặp vị trí cần highlight (số hiệu ghế)
 * @param {string} [props.title]
 */
export default function SeatRow({ arrangement, title }) {
    if (!arrangement || arrangement.length === 0) {
        return (
            <div className="rounded-xl border border-dashed border-gray-300 p-4 text-center text-gray-400 text-sm">
                Chưa có sắp xếp để hiển thị
            </div>
        )
    }

    return (
        <div className="space-y-2">
            {title && <p className="text-sm font-medium text-gray-600">{title}</p>}

            {/* Hàng ghế */}
            <div className="flex flex-wrap gap-1.5 justify-center p-4 bg-gray-50 rounded-xl border border-gray-200">
                {arrangement.map((label, i) => {
                    const colors = CLASS_COLORS[label] || CLASS_COLORS['E']
                    const isBlank = label === 'E'
                    return (
                        <div
                            key={i}
                            className={`
                relative flex flex-col items-center justify-center
                w-10 h-12 rounded-lg font-bold text-sm
                shadow-sm select-none transition-all
                ${isBlank
                                    ? 'bg-gray-100 border-2 border-dashed border-gray-300 text-gray-400'
                                    : `${colors.bg} ${colors.text} shadow-md`
                                }
              `}
                            title={isBlank ? 'Ghế trống' : `Lớp ${label}`}
                        >
                            {/* Icon ghế nhỏ */}
                            <div className="text-xs opacity-60 leading-none">🪑</div>
                            {/* Nhãn lớp */}
                            <div className="text-sm font-bold leading-none mt-0.5">
                                {isBlank ? '—' : label}
                            </div>
                            {/* Số thứ tự */}
                            <div
                                className={`
                  absolute -bottom-4 text-[10px] font-mono
                  ${isBlank ? 'text-gray-400' : 'text-gray-500'}
                `}
                            >
                                {i + 1}
                            </div>
                        </div>
                    )
                })}
            </div>

            {/* Chú thích lớp */}
            <div className="flex flex-wrap gap-2 justify-center pt-2">
                {[...new Set(arrangement)].sort().map(label => {
                    const count = arrangement.filter(l => l === label).length
                    const colors = CLASS_COLORS[label] || CLASS_COLORS['E']
                    return (
                        <span
                            key={label}
                            className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium ${colors.badge}`}
                        >
                            <span
                                className="w-2 h-2 rounded-full inline-block"
                                style={{ backgroundColor: colors.dot }}
                            />
                            {label === 'E' ? 'Ghế trống' : `Lớp ${label}`}: {count} ghế
                        </span>
                    )
                })}
            </div>
        </div>
    )
}
