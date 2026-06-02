/**
 * PIETable — Bảng PIE đầy đủ, hỗ trợ hiển thị từng dòng (step mode)
 * hoặc hiển thị tất cả cùng lúc.
 *
 * Bao gồm:
 *  1. Bảng tầng dấu (sign-layer guide)
 *  2. Bảng PIE chính (grouped by sign layer)
 *  3. Dòng tổng kết
 *  4. Công thức kết quả N
 */

import React, { useState } from 'react'
import { InlineMath, BlockMath } from 'react-katex'
import 'katex/dist/katex.min.css'
import { signLayerSummary } from '../utils/pie.js'
import { fmtNumber } from '../utils/math.js'
import { CLASS_COLORS } from '../utils/colors.js'

// ─── Bảng tầng dấu ────────────────────────────────────────────────────────────

function SignLayerGuide({ result }) {
    const summary = signLayerSummary(result)
    const forbiddenLabels = result.forbidden.map(c => c.label)

    return (
        <div className="rounded-xl border border-gray-200 overflow-hidden mb-4">
            <div className="bg-gray-100 px-4 py-2 border-b border-gray-200 flex items-center gap-2">
                <span className="text-base">🧭</span>
                <span className="font-bold text-gray-700 text-sm">
                    Bảng tầng dấu — Quy tắc:{' '}
                    <InlineMath math={`(-1)^{${forbiddenLabels.map((_, i) => ['i', 'j', 'k', 'l'][i]).join('+')}} \\Rightarrow \\text{dấu}`} />
                </span>
            </div>
            <table className="w-full text-sm border-collapse">
                <thead>
                    <tr className="bg-gray-50 text-gray-600 text-xs uppercase tracking-wide">
                        <th className="px-4 py-2 text-left border-b border-gray-200">
                            Tầng <InlineMath math="s = \sum \text{chỉ số}" />
                        </th>
                        <th className="px-4 py-2 text-center border-b border-gray-200">Tính chất</th>
                        <th className="px-4 py-2 text-center border-b border-gray-200">Dấu</th>
                        <th className="px-4 py-2 text-center border-b border-gray-200">Số dòng</th>
                        <th className="px-4 py-2 text-right border-b border-gray-200">Tổng đóng góp</th>
                    </tr>
                </thead>
                <tbody>
                    {summary.map(layer => (
                        <tr
                            key={layer.s}
                            className={layer.sign > 0 ? 'bg-blue-50' : 'bg-red-50'}
                        >
                            <td className="px-4 py-2 font-mono font-bold border-b border-gray-100">
                                <InlineMath math={`s = ${layer.s}`} />
                            </td>
                            <td className="px-4 py-2 text-center border-b border-gray-100 text-xs text-gray-600">
                                {layer.s === 0
                                    ? 'Không ghép cặp'
                                    : layer.sign > 0
                                        ? `${layer.s} là số chẵn`
                                        : `${layer.s} là số lẻ`}
                            </td>
                            <td className="px-4 py-2 text-center border-b border-gray-100">
                                <span
                                    className={`font-bold text-lg ${layer.sign > 0 ? 'text-blue-600' : 'text-red-600'
                                        }`}
                                >
                                    {layer.sign > 0 ? '+' : '−'}
                                </span>
                            </td>
                            <td className="px-4 py-2 text-center border-b border-gray-100 font-mono">
                                {layer.rowCount}
                            </td>
                            <td className="px-4 py-2 text-right border-b border-gray-100 font-mono font-semibold">
                                <span className={layer.layerTotal >= 0 ? 'text-blue-700' : 'text-red-700'}>
                                    {layer.layerTotal >= 0 ? '+' : ''}{fmtNumber(layer.layerTotal)}
                                </span>
                            </td>
                        </tr>
                    ))}
                </tbody>
                <tfoot>
                    <tr className="bg-gray-100 font-bold">
                        <td className="px-4 py-2 text-sm border-t border-gray-300" colSpan={4}>
                            Số cấu trúc lớp (tổng các đóng góp)
                        </td>
                        <td className="px-4 py-2 text-right font-mono text-blue-800 border-t border-gray-300">
                            {fmtNumber(result.structureCount)}
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    )
}

// ─── Header cột của bảng PIE ──────────────────────────────────────────────────

function PIETableHeader({ classes, forbidden }) {
    return (
        <thead>
            <tr className="bg-slate-700 text-white text-xs">
                <th className="px-3 py-2.5 text-left font-semibold min-w-[120px]">
                    Dòng (chỉ số cặp ghép)
                </th>
                <th className="px-3 py-2.5 text-center font-semibold">
                    Chọn cặp
                </th>
                <th className="px-3 py-2.5 text-center font-semibold">
                    Thực thể còn lại{' '}
                    <span className="text-slate-300 font-normal">
                        ({classes.map(c => c.label).join(', ')})
                    </span>
                </th>
                <th className="px-3 py-2.5 text-center font-semibold">Tổng T</th>
                <th className="px-3 py-2.5 text-center font-semibold">Hoán vị đồng nhất</th>
                <th className="px-3 py-2.5 text-center font-semibold">Dấu</th>
                <th className="px-3 py-2.5 text-right font-semibold">Đóng góp</th>
            </tr>
        </thead>
    )
}

// ─── Một dòng trong bảng PIE ──────────────────────────────────────────────────

function PIERow({ row, classes, isNew }) {
    const isPlus = row.sign > 0
    const rowBg = isPlus ? 'bg-blue-50' : 'bg-red-50'
    const highlightCls = isNew ? 'ring-2 ring-yellow-400 ring-inset' : ''

    // Xây "Thực thể còn lại" — chỉ hiển thị entity count per class
    const entityStr = '(' + row.entities.join(', ') + ')'

    return (
        <tr className={`${rowBg} ${highlightCls} border-b border-gray-200 text-sm transition-all`}>
            {/* Dòng chỉ số */}
            <td className="px-3 py-2">
                <div className="font-mono font-bold text-gray-800 text-xs">
                    {row.tupleLabel}
                </div>
                <div className="text-xs text-gray-500 mt-0.5">{row.pairedLabel}</div>
            </td>

            {/* Chọn cặp */}
            <td className="px-3 py-2 text-center">
                <div className="text-xs text-gray-500">
                    <InlineMath math={row.chosenPairsLatex} />
                </div>
                <div className="font-mono font-bold text-gray-800">{fmtNumber(row.chosenPairs)}</div>
            </td>

            {/* Thực thể */}
            <td className="px-3 py-2 text-center">
                <div className="font-mono text-gray-700 text-xs">
                    {entityStr}
                </div>
                <div className="flex gap-0.5 justify-center mt-1">
                    {row.entities.map((e, idx) => {
                        const label = classes[idx].label
                        const color = CLASS_COLORS[label] || CLASS_COLORS['E']
                        return (
                            <span
                                key={idx}
                                className={`inline-flex items-center justify-center w-5 h-5 rounded text-xs font-bold ${color.bg} ${color.text}`}
                                title={`Lớp ${label}: ${e} thực thể`}
                            >
                                {e}
                            </span>
                        )
                    })}
                </div>
            </td>

            {/* Tổng */}
            <td className="px-3 py-2 text-center font-mono font-bold text-gray-800">
                {row.total}
            </td>

            {/* Hoán vị đồng nhất */}
            <td className="px-3 py-2 text-center">
                <div className="text-xs text-gray-500">
                    <InlineMath math={row.multiLatex} />
                </div>
                <div className="font-mono font-bold text-gray-800">{fmtNumber(row.multi)}</div>
            </td>

            {/* Dấu */}
            <td className="px-3 py-2 text-center">
                <span
                    className={`font-bold text-xl ${isPlus ? 'text-blue-600' : 'text-red-600'
                        }`}
                >
                    {isPlus ? '+' : '−'}
                </span>
                <div className="text-[10px] text-gray-400 font-mono mt-0.5">
                    <InlineMath math={`(-1)^{${row.s}}`} />
                </div>
            </td>

            {/* Đóng góp */}
            <td className="px-3 py-2 text-right">
                <span
                    className={`font-mono font-bold text-base ${row.contribution >= 0 ? 'text-blue-700' : 'text-red-700'
                        }`}
                >
                    {row.contribution >= 0 ? '+' : ''}{fmtNumber(row.contribution)}
                </span>
            </td>
        </tr>
    )
}

// ─── Bảng PIE đầy đủ ─────────────────────────────────────────────────────────

function FullPIETable({ result, revealedCount, isStepMode }) {
    const { rows, layers, classes, forbidden, structureCount } = result
    const displayRows = isStepMode ? rows.slice(0, revealedCount) : rows

    let runningTotal = 0
    const rowsWithRunning = displayRows.map(r => {
        runningTotal += r.contribution
        return { ...r, runningTotal }
    })

    return (
        <div className="overflow-x-auto rounded-xl border border-gray-200 shadow-sm">
            <table className="w-full text-sm border-collapse min-w-[700px]">
                <PIETableHeader classes={classes} forbidden={forbidden} />
                <tbody>
                    {/* Tách theo tầng dấu */}
                    {layers.map(layer => {
                        const layerRows = rowsWithRunning.filter(r => r.s === layer.s)
                        if (layerRows.length === 0) return null
                        const isPlus = layer.sign > 0
                        return (
                            <React.Fragment key={`layer-${layer.s}`}>
                                {/* Divider tầng */}
                                <tr>
                                    <td
                                        colSpan={7}
                                        className={`px-4 py-1.5 text-xs font-bold ${isPlus
                                                ? 'bg-blue-100 text-blue-700 border-l-4 border-blue-400'
                                                : 'bg-red-100 text-red-700 border-l-4 border-red-400'
                                            } border-y border-gray-200`}
                                    >
                                        Tầng s = {layer.s} &nbsp;→&nbsp;{' '}
                                        <InlineMath math={`(-1)^{${layer.s}} = ${isPlus ? '+1' : '-1'}`} />
                                        &nbsp;{isPlus ? '(dấu dương)' : '(dấu âm)'}
                                    </td>
                                </tr>
                                {layerRows.map((row, idx) => (
                                    <React.Fragment key={row.tupleLabel}>
                                        <PIERow
                                            row={row}
                                            classes={classes}
                                            isNew={isStepMode && rowsWithRunning.indexOf(row) === revealedCount - 1}
                                        />
                                        {/* Running total mini-row */}
                                        {isStepMode && rowsWithRunning.indexOf(row) === revealedCount - 1 && (
                                            <tr className="bg-yellow-50 border-b-2 border-yellow-300">
                                                <td colSpan={6} className="px-4 py-1.5 text-xs text-gray-600 italic">
                                                    ↳ Tổng tích lũy sau {revealedCount} dòng:
                                                </td>
                                                <td className="px-3 py-1.5 text-right font-mono font-bold text-yellow-800">
                                                    {row.runningTotal >= 0 ? '+' : ''}{fmtNumber(row.runningTotal)}
                                                </td>
                                            </tr>
                                        )}
                                    </React.Fragment>
                                ))}
                            </React.Fragment>
                        )
                    })}
                </tbody>
                {/* Dòng tổng kết */}
                {(!isStepMode || revealedCount >= rows.length) && (
                    <tfoot>
                        <tr className="bg-slate-700 text-white font-bold">
                            <td colSpan={6} className="px-4 py-3 text-sm">
                                Tổng số cấu trúc lớp{' '}
                                <span className="font-normal text-slate-300">
                                    (số sắp xếp khi coi mọi học sinh cùng lớp là giống nhau)
                                </span>
                            </td>
                            <td className="px-3 py-3 text-right font-mono text-lg text-yellow-300">
                                {fmtNumber(structureCount)}
                            </td>
                        </tr>
                    </tfoot>
                )}
            </table>
        </div>
    )
}

// ─── Component chính ──────────────────────────────────────────────────────────

/**
 * @param {Object} props
 * @param {Object} props.result - kết quả từ computePIE()
 * @param {boolean} [props.showAll] - hiện tất cả cùng lúc hay từng dòng
 */
export default function PIETable({ result, showAll = false }) {
    const [revealedCount, setRevealedCount] = useState(0)
    const [isStepMode, setIsStepMode] = useState(!showAll)
    const totalRows = result.rows.length

    function revealNext() {
        setRevealedCount(c => Math.min(c + 1, totalRows))
    }

    function revealAll() {
        setRevealedCount(totalRows)
        setIsStepMode(false)
    }

    function reset() {
        setRevealedCount(0)
        setIsStepMode(true)
    }

    const allRevealed = revealedCount >= totalRows

    return (
        <div className="space-y-4">
            {/* Bảng tầng dấu — luôn hiển thị */}
            <SignLayerGuide result={result} />

            {/* Controls */}
            <div className="flex items-center gap-3 flex-wrap">
                <span className="text-sm font-semibold text-gray-700">Hiển thị bảng PIE:</span>
                {isStepMode && !allRevealed ? (
                    <>
                        <button
                            onClick={revealNext}
                            className="px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-semibold hover:bg-blue-700 active:bg-blue-800 transition-colors shadow-sm"
                        >
                            ▶ Hiện dòng tiếp theo ({revealedCount}/{totalRows})
                        </button>
                        <button
                            onClick={revealAll}
                            className="px-4 py-2 rounded-lg bg-gray-100 text-gray-700 text-sm font-semibold hover:bg-gray-200 transition-colors"
                        >
                            Hiện tất cả ngay
                        </button>
                    </>
                ) : isStepMode && allRevealed ? (
                    <div className="flex items-center gap-3">
                        <span className="text-sm text-green-700 font-semibold">✅ Đã hiển thị đủ {totalRows} dòng</span>
                        <button
                            onClick={reset}
                            className="px-3 py-1.5 rounded-lg bg-gray-100 text-gray-600 text-xs font-medium hover:bg-gray-200 transition-colors"
                        >
                            ↩ Bắt đầu lại
                        </button>
                    </div>
                ) : (
                    <div className="flex items-center gap-3">
                        <span className="text-sm text-green-700 font-semibold">✅ Hiển thị tất cả {totalRows} dòng</span>
                        <button
                            onClick={reset}
                            className="px-3 py-1.5 rounded-lg bg-gray-100 text-gray-600 text-xs font-medium hover:bg-gray-200 transition-colors"
                        >
                            ↩ Bắt đầu lại từng bước
                        </button>
                    </div>
                )}
            </div>

            {/* Bảng chính */}
            {(revealedCount > 0 || !isStepMode) && (
                <FullPIETable result={result} revealedCount={revealedCount} isStepMode={isStepMode} />
            )}

            {isStepMode && revealedCount === 0 && (
                <div className="rounded-xl border-2 border-dashed border-blue-300 p-8 text-center text-blue-500">
                    <div className="text-4xl mb-2">▶</div>
                    <p className="font-semibold">Nhấn "Hiện dòng tiếp theo" để bắt đầu</p>
                    <p className="text-sm text-blue-400 mt-1">
                        Bảng có <strong>{totalRows}</strong> dòng, chia thành{' '}
                        <strong>{result.layers.length}</strong> tầng dấu
                    </p>
                </div>
            )}

            {/* Công thức kết quả N */}
            {(!isStepMode || allRevealed) && (
                <div className="rounded-xl border-2 border-green-300 bg-green-50 p-5 space-y-3">
                    <h3 className="font-bold text-green-800 text-base flex items-center gap-2">
                        <span>🎯</span> Kết quả cuối cùng
                    </h3>
                    <div className="space-y-2 text-sm">
                        <p className="text-gray-700">
                            <strong>Số cấu trúc lớp:</strong>{' '}
                            <span className="font-mono font-bold text-blue-800 text-base">
                                {fmtNumber(result.structureCount)}
                            </span>
                        </p>
                        <p className="text-gray-700">
                            <strong>Nhân thêm giai thừa từng lớp</strong>{' '}
                            (phân biệt học sinh cùng lớp):
                        </p>
                        <div className="bg-white border border-green-200 rounded-lg p-3 text-center">
                            <BlockMath
                                math={`N = ${fmtNumber(result.structureCount)} \\times ${result.factorialLatex} = ${fmtNumber(result.N)}`}
                            />
                        </div>
                        <div className="mt-2 p-3 bg-green-100 rounded-lg text-center">
                            <span className="text-green-700 font-semibold text-sm">Đáp số:</span>{' '}
                            <span className="font-bold text-3xl text-green-900 font-mono">
                                {fmtNumber(result.N)}
                            </span>{' '}
                            <span className="text-green-700 text-sm">cách xếp</span>
                        </div>
                    </div>
                </div>
            )}
        </div>
    )
}
