/**
 * ColSystemTable — Hiển thị hệ phương trình đặc trưng cột
 * và liệt kê nghiệm cùng đáp số cho bài toán 2 hàng đối diện.
 */

import React, { useState } from 'react'
import { InlineMath } from 'react-katex'
import 'katex/dist/katex.min.css'
import {
    COL_TYPE_INFO,
    relevantColTypes,
    buildEquationSystem,
    colOrderingsCount,
    solveColumnSystem,
    multisetLabel,
    countValidSequences,
    explainColumnSolution,
} from '../utils/columns.js'
import { fmtNumber, factorial } from '../utils/math.js'

function seatLabel(value) {
    return value === 'E' ? 'Trống' : value
}

function DetailedSolutionExplanation({ sol, seqs }) {
    const detail = explainColumnSolution(sol)
    const typeEntries = [
        ['x', 'X'],
        ['y', 'Y'],
        ['z', 'Z'],
        ['u', 'U'],
        ['v', 'V'],
        ['t', 'T'],
        ['w', 'W'],
    ].filter(([key]) => sol[key] > 0)

    const denominator = typeEntries
        .map(([key]) => sol[key])
        .filter(count => count > 1)
        .map(count => `${count}!`)
        .join(' \\cdot ')

    const orderingFormula = denominator
        ? `\\dfrac{${sol.m}!}{${denominator}} = ${detail.typeOrderingCount}`
        : `${sol.m}! = ${detail.typeOrderingCount}`

    return (
        <div className="space-y-3">
            <div className="rounded-lg bg-white border border-violet-200 p-3 space-y-2">
                <p className="font-semibold text-violet-800">Bước 1. Đọc đúng ý nghĩa của cấu hình cột</p>
                <p>
                    <strong>{multisetLabel(sol)}</strong> nghĩa là có <strong>{sol.m}</strong> cột, trong đó{' '}
                    {typeEntries.map(([key, type], index) => {
                        const info = COL_TYPE_INFO[type]
                        return (
                            <span key={type}>
                                <strong>{sol[key]}{type}</strong> với <strong>{type} = {info.contents}</strong>
                                {index < typeEntries.length - 1 ? '; ' : '.'}
                            </span>
                        )
                    })}
                </p>
                <p className="text-xs text-gray-600">
                    Mỗi mã như <strong>AB</strong> nghĩa là ghế trên là A, ghế dưới là B. Đổi thành <strong>BA</strong>
                    là cùng loại cột nhưng lật ngược trên-dưới.
                </p>
            </div>

            <div className="rounded-lg bg-white border border-violet-200 p-3 space-y-2">
                <p className="font-semibold text-violet-800">Bước 2. Xét thứ tự các loại cột trước</p>
                <p>
                    Trước hết chỉ xếp các <em>loại cột</em>, chưa xét lật trên-dưới. Số thứ tự loại cột là:
                </p>
                <div className="rounded-md bg-violet-50 border border-violet-200 px-3 py-2 inline-block">
                    <InlineMath math={`\\text{số thứ tự loại cột} = ${orderingFormula}`} />
                </div>
                {detail.canEnumerateFully && (
                    <p>
                        Cụ thể ở đây có <strong>{detail.families.length}</strong> thứ tự cần xét:{' '}
                        <strong>{detail.families.map(family => family.orderLabel).join(', ')}</strong>.
                    </p>
                )}
            </div>

            {detail.canEnumerateFully ? (
                <div className="space-y-3">
                    <div className="rounded-lg bg-white border border-violet-200 p-3">
                        <p className="font-semibold text-violet-800 mb-1">Bước 3. Với từng thứ tự, xét các hướng lật hợp lệ</p>
                        <p className="text-sm text-gray-700">
                            Hai cột kề nhau chỉ được chấp nhận nếu ở <strong>hàng trên</strong> không lặp lớp và ở
                            <strong> hàng dưới</strong> cũng không lặp lớp.
                        </p>
                    </div>

                    {detail.families.map((family, familyIndex) => (
                        <div key={`${family.orderLabel}-${familyIndex}`} className="rounded-lg border border-violet-200 bg-white p-3 space-y-2">
                            <div className="flex flex-wrap items-center justify-between gap-2">
                                <div>
                                    <div className="text-xs uppercase tracking-wide text-violet-600">Thứ tự {familyIndex + 1}</div>
                                    <div className="font-mono font-bold text-violet-800 text-base">{family.orderLabel}</div>
                                </div>
                                <div className="rounded-full bg-violet-100 text-violet-700 px-3 py-1 text-xs font-bold">
                                    {fmtNumber(family.count)} cách hợp lệ
                                </div>
                            </div>
                            <div className="text-xs text-gray-600">
                                Nghĩa là ta lần lượt đặt các loại cột theo thứ tự: {family.order.join(' → ')}.
                            </div>
                            <div className="space-y-2">
                                {family.layouts.map((layout, layoutIndex) => (
                                    <div key={`${family.orderLabel}-layout-${layoutIndex}`} className="rounded-md border border-slate-200 bg-slate-50 p-3">
                                        <div className="text-xs font-semibold text-slate-700 mb-1">Cách {layoutIndex + 1}</div>
                                        <div className="text-xs font-mono text-slate-600 mb-2">
                                            Mã cột: {layout.codes.join(' | ')}
                                        </div>
                                        <div className="grid grid-cols-1 md:grid-cols-[88px_1fr] gap-1 text-sm">
                                            <div className="font-semibold text-slate-600">Hàng trên</div>
                                            <div className="font-mono text-slate-800">{layout.topRow.map(seatLabel).join(' - ')}</div>
                                            <div className="font-semibold text-slate-600">Hàng dưới</div>
                                            <div className="font-mono text-slate-800">{layout.bottomRow.map(seatLabel).join(' - ')}</div>
                                        </div>
                                    </div>
                                ))}
                                {family.hiddenLayoutCount > 0 && (
                                    <div className="text-xs text-gray-500 italic">
                                        Còn {fmtNumber(family.hiddenLayoutCount)} cách hợp lệ nữa không hiển thị hết ở đây.
                                    </div>
                                )}
                            </div>
                        </div>
                    ))}

                    <div className="rounded-lg bg-violet-100 border border-violet-300 p-3 text-violet-900">
                        <div className="font-semibold mb-1">Bước 4. Cộng các thứ tự lại</div>
                        <div className="font-mono">
                            {detail.families.map(family => fmtNumber(family.count)).join(' + ')} = {fmtNumber(seqs)}
                        </div>
                    </div>
                </div>
            ) : (
                <div className="rounded-lg bg-white border border-violet-200 p-3 space-y-2">
                    <p className="font-semibold text-violet-800">Bước 3. Đếm số hướng hợp lệ</p>
                    <p>
                        Trường hợp này có quá nhiều thứ tự hoặc quá nhiều hướng lật nên không thể liệt kê hết trên màn hình.
                        Tuy nhiên tổng số dãy cột hợp lệ cho riêng cấu hình này vẫn là <strong>{fmtNumber(seqs)}</strong>.
                    </p>
                    <p className="text-xs text-gray-600">
                        Muốn chi tiết hơn nữa, có thể chia tiếp theo từng họ thứ tự cột rồi đếm số hướng hợp lệ trong từng họ.
                    </p>
                </div>
            )}
        </div>
    )
}

function ColTypeReference({ relevantTypes }) {
    return (
        <div className="rounded-xl border border-gray-200 overflow-hidden">
            <div className="bg-gray-100 px-4 py-2 border-b border-gray-200">
                <span className="font-bold text-gray-700 text-sm">📐 Bảng tra loại cột đặc trưng</span>
            </div>
            <div className="p-3 flex flex-wrap gap-2">
                {relevantTypes.map(type => {
                    const info = COL_TYPE_INFO[type]
                    return (
                        <div
                            key={type}
                            className={`flex items-center gap-2 px-3 py-1.5 rounded-lg text-sm font-medium ${info.color}`}
                        >
                            <span className="font-bold text-base">{type}</span>
                            <span>= {info.contents}</span>
                        </div>
                    )
                })}
            </div>
            <div className="px-4 pb-3 text-xs text-gray-500">
                Mỗi cột là một cặp ghế đối diện. Cột dị có 2 hướng trên-dưới; cột W = {'{E, E}'} chỉ có 1 hướng.
            </div>
        </div>
    )
}

function EquationSystem({ nA, nB, nC, nE, m }) {
    const lines = buildEquationSystem({ nA, nB, nC, nE, m })

    return (
        <div className="rounded-xl border border-blue-200 bg-blue-50 overflow-hidden">
            <div className="bg-blue-100 px-4 py-2 border-b border-blue-200">
                <span className="font-bold text-blue-800 text-sm">
                    📊 Hệ phương trình tìm số cột mỗi loại
                </span>
            </div>
            <div className="p-4 space-y-1">
                {lines.map((line, index) => (
                    <div key={index} className="text-center">
                        <InlineMath math={line} />
                    </div>
                ))}
            </div>
        </div>
    )
}

function StepsSummary({ classFactorial, factorLabel, totalValidSeqs, totalWays }) {
    return (
        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 space-y-3">
            <h3 className="font-bold text-slate-800 text-sm">Cách tính đáp số</h3>
            <div className="space-y-2 text-sm text-slate-700">
                <div className="flex gap-2">
                    <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-slate-700 text-white text-xs font-bold flex-shrink-0">1</span>
                    <p>Giải hệ để liệt kê mọi cấu hình cột hợp lệ.</p>
                </div>
                <div className="flex gap-2">
                    <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-slate-700 text-white text-xs font-bold flex-shrink-0">2</span>
                    <p>Với mỗi cấu hình, đếm số dãy cột hợp lệ, đã bao gồm cả thứ tự cột và hướng lật trên-dưới.</p>
                </div>
                <div className="flex gap-2">
                    <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-slate-700 text-white text-xs font-bold flex-shrink-0">3</span>
                    <p>Nhân thêm giai thừa từng lớp để phân biệt từng học sinh cụ thể.</p>
                </div>
            </div>
            <div className="rounded-lg bg-white border border-slate-200 p-3 text-sm text-slate-700 space-y-1">
                <div>
                    Tổng dãy cột hợp lệ: <strong className="font-mono text-violet-700">{fmtNumber(totalValidSeqs)}</strong>
                </div>
                <div>
                    Hệ số phân biệt học sinh: <strong className="font-mono">{factorLabel || '1'}</strong>
                    {' = '}
                    <strong className="font-mono">{fmtNumber(classFactorial)}</strong>
                </div>
                <div>
                    <InlineMath math={`N = ${fmtNumber(totalValidSeqs)} \\times ${fmtNumber(classFactorial)} = ${fmtNumber(totalWays)}`} />
                </div>
            </div>
        </div>
    )
}

function SolutionsTable({ solutionRows }) {
    const [expanded, setExpanded] = useState(null)

    if (solutionRows.length === 0) {
        return (
            <div className="rounded-xl border border-red-200 bg-red-50 p-4 text-red-700 text-sm">
                Không tìm được nghiệm nguyên không âm nào phù hợp với điều kiện bài toán.
            </div>
        )
    }

    const colKeys = ['x', 'y', 'z', 'u', 'v', 't', 'w']
    const colNames = ['X', 'Y', 'Z', 'U', 'V', 'T', 'W']
    const activeCols = colKeys
        .map((key, index) => ({
            key,
            name: colNames[index],
            hasAny: solutionRows.some(({ sol }) => sol[key] > 0),
        }))
        .filter(col => col.hasAny)

    const totalValidSeqs = solutionRows.reduce((sum, row) => sum + row.seqs, 0)

    return (
        <div className="space-y-3">
            <div className="overflow-x-auto rounded-xl border border-gray-200 shadow-sm">
                <table className="w-full min-w-[520px] text-sm border-collapse">
                    <thead>
                        <tr className="bg-slate-700 text-white text-xs">
                            <th className="px-3 py-2.5 text-left">Cấu hình cột</th>
                            {activeCols.map(col => (
                                <th key={col.key} className="px-3 py-2.5 text-center">
                                    {col.name}
                                </th>
                            ))}
                            <th className="px-3 py-2.5 text-center">Dãy hợp lệ</th>
                        </tr>
                    </thead>
                    <tbody>
                        {solutionRows.map(({ sol, seqs }, index) => {
                            const isExpanded = expanded === index
                            return (
                                <React.Fragment key={`${multisetLabel(sol)}-${index}`}>
                                    <tr
                                        className={`border-b border-gray-200 cursor-pointer transition-colors ${isExpanded ? 'bg-violet-50' : index % 2 === 0 ? 'bg-white' : 'bg-gray-50'} hover:bg-violet-50`}
                                        onClick={() => setExpanded(isExpanded ? null : index)}
                                    >
                                        <td className="px-3 py-2.5">
                                            <div className="flex items-center gap-2">
                                                <span className="text-gray-400 text-xs">{isExpanded ? '▼' : '▶'}</span>
                                                <span className="font-mono font-bold text-gray-800 text-xs">
                                                    {multisetLabel(sol)}
                                                </span>
                                            </div>
                                        </td>
                                        {activeCols.map(col => (
                                            <td key={col.key} className="px-3 py-2.5 text-center font-mono">
                                                {sol[col.key] > 0 ? (
                                                    <span className="font-bold text-gray-800">{sol[col.key]}</span>
                                                ) : (
                                                    <span className="text-gray-300">—</span>
                                                )}
                                            </td>
                                        ))}
                                        <td className="px-3 py-2.5 text-center font-mono font-semibold text-violet-700">
                                            {fmtNumber(seqs)}
                                        </td>
                                    </tr>
                                    {isExpanded && (
                                        <tr>
                                            <td
                                                colSpan={activeCols.length + 2}
                                                className="px-4 py-3 bg-violet-50 border-b border-violet-200"
                                            >
                                                <div className="text-sm text-gray-700 space-y-1.5">
                                                    <p className="font-semibold text-violet-800">
                                                        Cấu hình: {multisetLabel(sol)}
                                                    </p>
                                                    <DetailedSolutionExplanation sol={sol} seqs={seqs} />
                                                </div>
                                            </td>
                                        </tr>
                                    )}
                                </React.Fragment>
                            )
                        })}
                        <tr className="bg-violet-100 border-t-2 border-violet-300">
                            <td className="px-3 py-2.5 font-bold text-violet-800 text-xs" colSpan={activeCols.length + 1}>
                                Tổng dãy cột hợp lệ
                            </td>
                            <td className="px-3 py-2.5 text-center font-mono font-bold text-violet-800">
                                {fmtNumber(totalValidSeqs)}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <p className="text-xs text-gray-500 italic">
                ▶ Nhấn vào từng dòng để xem diễn giải. Cột “Dãy hợp lệ” đã gồm cả thứ tự cột và hướng lật trên-dưới.
            </p>
        </div>
    )
}

export default function ColSystemTable({ nA = 0, nB = 0, nC = 0, nE = 0 }) {
    const relevantTypes = relevantColTypes({
        hasA: nA > 0,
        hasB: nB > 0,
        hasC: nC > 0,
        hasE: nE > 0,
    })

    const { solutions, m, error } = solveColumnSystem({ nA, nB, nC, nE })

    if (error && solutions.length === 0) {
        return (
            <div className="rounded-xl border border-red-200 bg-red-50 p-4 text-red-700 text-sm">
                {error}
            </div>
        )
    }

    const solutionRows = solutions.map(sol => ({
        sol,
        seqs: countValidSequences(sol),
    }))
    const totalValidSeqs = solutionRows.reduce((sum, row) => sum + row.seqs, 0)
    const classFactorial = factorial(nA) * factorial(nB) * factorial(nC)
    const totalWays = totalValidSeqs * classFactorial
    const factorLabel = [nA > 0 && `${nA}!`, nB > 0 && `${nB}!`, nC > 0 && `${nC}!`]
        .filter(Boolean)
        .join(' × ')

    return (
        <div className="space-y-4">
            <ColTypeReference relevantTypes={relevantTypes} />
            <EquationSystem nA={nA} nB={nB} nC={nC} nE={nE} m={m} />
            <StepsSummary
                classFactorial={classFactorial}
                factorLabel={factorLabel}
                totalValidSeqs={totalValidSeqs}
                totalWays={totalWays}
            />
            <div className="font-semibold text-gray-700 text-sm">
                Các nghiệm của hệ ({solutions.length} cấu hình cột):
            </div>
            <SolutionsTable solutionRows={solutionRows} />
            <div className="rounded-2xl bg-gradient-to-br from-violet-700 to-violet-900 p-6 text-white shadow-lg">
                <div className="text-xs uppercase tracking-widest text-white/70 mb-2">Đáp số cuối</div>
                <div className="font-black" style={{ fontSize: '3rem', lineHeight: 1.05 }}>
                    {fmtNumber(totalWays)}
                </div>
                <div className="mt-2 text-sm text-white/80">
                    = {fmtNumber(totalValidSeqs)} × {fmtNumber(classFactorial)}
                </div>
            </div>
        </div>
    )
}
