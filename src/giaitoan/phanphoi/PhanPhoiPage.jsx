/**
 * PhanPhoiPage — "4 Trường Hợp Phân Phối Vật vào Hộp"
 *
 * Khung lý thuyết + 4 công cụ tính tương tác:
 *   Case 1: Vật phân biệt — Hộp phân biệt  →  k^n
 *   Case 2: Vật giống nhau — Hộp phân biệt →  C(n+k−1, k−1)
 *   Case 3: Vật phân biệt — Hộp giống nhau →  Σ S(n, j), j=1..k
 *   Case 4: Vật giống nhau — Hộp giống nhau →  Phân hoạch số
 */

import React, { useState, useMemo } from 'react'
import { InlineMath, BlockMath } from 'react-katex'
import 'katex/dist/katex.min.css'
import { C, fmtN } from '../hamsinh/utils/gfEngine.js'
import { stirlingTriangle, surjective } from './utils/stirling.js'
import { enumeratePartitions } from './utils/partitions.js'

// ─── Case theme colours ───────────────────────────────────────────
const CASE_THEME = {
    1: { bg: 'bg-blue-600', bgL: 'bg-blue-50', border: 'border-blue-500', text: 'text-blue-700', badge: 'bg-blue-100 text-blue-700', ring: 'ring-blue-500', btn: 'bg-blue-600 hover:bg-blue-700' },
    2: { bg: 'bg-emerald-600', bgL: 'bg-emerald-50', border: 'border-emerald-500', text: 'text-emerald-700', badge: 'bg-emerald-100 text-emerald-700', ring: 'ring-emerald-500', btn: 'bg-emerald-600 hover:bg-emerald-700' },
    3: { bg: 'bg-violet-600', bgL: 'bg-violet-50', border: 'border-violet-500', text: 'text-violet-700', badge: 'bg-violet-100 text-violet-700', ring: 'ring-violet-500', btn: 'bg-violet-600 hover:bg-violet-700' },
    4: { bg: 'bg-orange-600', bgL: 'bg-orange-50', border: 'border-orange-500', text: 'text-orange-700', badge: 'bg-orange-100 text-orange-700', ring: 'ring-orange-500', btn: 'bg-orange-600 hover:bg-orange-700' },
}

const CASE_META = [
    { id: 1, vatLabel: 'Phân biệt', hopLabel: 'Phân biệt', icon: '🔵', formulaShort: 'kⁿ', example: 'Học sinh → Phòng có tên' },
    { id: 2, vatLabel: 'Giống nhau', hopLabel: 'Phân biệt', icon: '🟢', formulaShort: 'C(n+k−1, k−1)', example: 'Bi trắng → Hộp có tên' },
    { id: 3, vatLabel: 'Phân biệt', hopLabel: 'Giống nhau', icon: '🟣', formulaShort: 'Σ S(n, j)', example: 'Học sinh → Nhóm vô danh' },
    { id: 4, vatLabel: 'Giống nhau', hopLabel: 'Giống nhau', icon: '🟠', formulaShort: 'Phân hoạch p(n,k)', example: 'Bi trắng → Túi vô danh' },
]

// ─── Global computations ──────────────────────────────────────────
function computeAll(n, k) {
    const c1 = Math.round(Math.pow(k, n))
    const c2 = C(n + k - 1, k - 1)
    const maxN = Math.min(n, 12)
    const S = stirlingTriangle(maxN)
    let c3 = 0
    const c3_row = []
    for (let j = 1; j <= k && j <= maxN; j++) {
        const val = S[maxN][j]
        c3 += val
        c3_row.push({ j, val })
    }
    const partList = n <= 14 ? enumeratePartitions(n, k) : []
    const c4 = partList.length

    const surj = surjective(n, k, C)
    return { c1, c2, c3, c4, S, c3_row, partList, surjRows: surj.rows, surjTotal: surj.total }
}

// ─── Shared mini-components ───────────────────────────────────────
function StepBadge({ n }) {
    return (
        <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-slate-700 text-white text-xs font-bold shrink-0">{n}</span>
    )
}

function SectionCard({ children, className = '' }) {
    return <div className={`bg-white rounded-2xl border border-slate-200 shadow-sm p-5 ${className}`}>{children}</div>
}

function AnswerBox({ value, label, caseId }) {
    const t = CASE_THEME[caseId]
    return (
        <div className={`${t.bg} rounded-2xl p-6 text-center shadow-md`}>
            <p className="text-white/70 text-sm mb-2">{label}</p>
            <p className="text-white font-black" style={{ fontSize: '3.5rem', lineHeight: 1.1 }}>{fmtN(value)}</p>
        </div>
    )
}

// ─── n / k spinners ───────────────────────────────────────────────
function Spinner({ label, value, min, max, onChange, accent = 'blue' }) {
    const ring = `focus:ring-${accent}-400`
    return (
        <div className="flex items-center gap-2">
            <span className="text-sm font-semibold text-slate-700 w-6">{label}</span>
            <button onClick={() => onChange(Math.max(min, value - 1))}
                className="w-8 h-8 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold text-lg hover:bg-slate-50 shrink-0">−</button>
            <input type="number" min={min} max={max} value={value}
                onChange={e => onChange(Math.max(min, Math.min(max, parseInt(e.target.value) || min)))}
                className={`w-14 text-center border border-slate-300 rounded-lg py-1.5 font-bold text-slate-800 bg-white focus:outline-none focus:ring-2 ${ring}`} />
            <button onClick={() => onChange(Math.min(max, value + 1))}
                className="w-8 h-8 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold text-lg hover:bg-slate-50 shrink-0">+</button>
        </div>
    )
}

// ─── Theory 2×2 Matrix ────────────────────────────────────────────
function TheoryMatrix({ n, k, data, activeCase, onSelect }) {
    const cells = [
        { row: 1, col: 1, caseId: 1, val: data.c1, label: <InlineMath math={`k^n = ${k}^{${n}}`} /> },
        { row: 1, col: 2, caseId: 2, val: data.c2, label: <InlineMath math={`C_{n+k-1}^{k-1} = C_{${n + k - 1}}^{${k - 1}}`} /> },
        { row: 2, col: 1, caseId: 3, val: data.c3, label: <InlineMath math={`\\textstyle\\sum_{j=1}^{k} S_{${n}}^{j}`} /> },
        { row: 2, col: 2, caseId: 4, val: data.c4, label: <span>Phân hoạch số {n}</span> },
    ]

    return (
        <SectionCard>
            <p className="font-bold text-slate-800 text-sm mb-4 flex items-center gap-2">
                <span className="w-1.5 h-5 rounded-full bg-slate-500 inline-block" />
                Ma trận 4 trường hợp — chọn case để xem chi tiết
            </p>
            <div className="overflow-x-auto">
                <table className="w-full border-collapse text-sm min-w-[480px]">
                    <thead>
                        <tr>
                            <th className="border border-slate-200 bg-slate-50 p-3 w-32"></th>
                            <th className="border border-slate-200 bg-blue-50 p-3 text-blue-800 font-semibold">🏷️ Hộp phân biệt</th>
                            <th className="border border-slate-200 bg-orange-50 p-3 text-orange-800 font-semibold">🎭 Hộp giống nhau</th>
                        </tr>
                    </thead>
                    <tbody>
                        {[[1, '🏷️ Vật phân biệt', 'bg-blue-50', 'text-blue-800'], [2, '🎭 Vật giống nhau', 'bg-orange-50', 'text-orange-800']].map(([rowIdx, rowLabel, rowBg, rowText]) => (
                            <tr key={rowIdx}>
                                <td className={`border border-slate-200 ${rowBg} p-3 font-semibold ${rowText} text-center`}>{rowLabel}</td>
                                {[1, 2].map(colIdx => {
                                    const cell = cells.find(c => c.row === rowIdx && c.col === colIdx)
                                    if (!cell) return null
                                    const t = CASE_THEME[cell.caseId]
                                    const isActive = activeCase === cell.caseId
                                    return (
                                        <td key={colIdx}
                                            className={`border-2 p-3 cursor-pointer transition-all ${isActive ? `${t.border} ${t.bgL} ring-2 ${t.ring} ring-inset` : 'border-slate-200 hover:bg-slate-50'}`}
                                            onClick={() => onSelect(cell.caseId)}>
                                            <div className="text-center space-y-1.5">
                                                <p className={`text-xs ${t.text}`}>{cell.label}</p>
                                                <p className={`font-black text-2xl ${t.text}`}>{fmtN(cell.val)}</p>
                                                <p className="text-[10px] text-slate-400">Case {cell.caseId}</p>
                                            </div>
                                        </td>
                                    )
                                })}
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </SectionCard>
    )
}

// ─── Case 1 Detail ────────────────────────────────────────────────
function Case1Detail({ n, k, data }) {
    const [noEmpty, setNoEmpty] = useState(false)
    const answer = noEmpty ? data.surjTotal : data.c1

    return (
        <div className="space-y-4">
            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3">Trực giác cốt lõi</p>
                <div className="bg-blue-50 rounded-xl border border-blue-200 p-4 space-y-2">
                    <p className="text-sm text-blue-800">
                        Mỗi trong <InlineMath math={`n = ${n}`} /> vật phân biệt <strong>tự do chọn</strong> bất kỳ
                        hộp nào trong <InlineMath math={`k = ${k}`} /> hộp phân biệt.
                    </p>
                    <div className="flex flex-wrap gap-2 mt-2">
                        {Array.from({ length: n }, (_, i) => (
                            <div key={i} className="flex items-center gap-1">
                                <span className="bg-blue-200 text-blue-900 rounded px-2 py-0.5 text-xs font-bold">V{i + 1}</span>
                                <span className="text-blue-400 text-xs">→</span>
                                <span className="text-xs text-blue-600">{k} cách</span>
                                {i < n - 1 && <span className="text-slate-400 mx-1 text-sm">×</span>}
                            </div>
                        ))}
                        <span className="text-blue-600 font-bold text-sm ml-1">= {k}^{n} = {fmtN(data.c1)}</span>
                    </div>
                </div>
            </SectionCard>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                    <StepBadge n={1} /> Công thức & Hàm sinh mũ (EGF)
                </p>
                <BlockMath math={`N = k^n = ${k}^{${n}} = ${fmtN(data.c1)}`} />
                <div className="mt-3 bg-slate-50 rounded-xl border border-slate-200 p-3 text-sm text-slate-600 space-y-1">
                    <p><strong>EGF mỗi hộp:</strong> <InlineMath math="e^x = \sum_{m=0}^{\infty} \frac{x^m}{m!}" /></p>
                    <p><strong>EGF tổng ({k} hộp):</strong> <InlineMath math={`(e^x)^{${k}} = e^{${k}x} = \\sum_{n=0}^{\\infty} \\frac{${k}^n}{n!} x^n`} /></p>
                    <p><strong>Trích hệ số:</strong> <InlineMath math={`N = n! \\cdot [x^{${n}}]\\,e^{${k}x} = ${n}! \\cdot \\frac{${k}^{${n}}}{${n}!} = ${k}^{${n}}`} /></p>
                </div>
            </SectionCard>

            <SectionCard>
                <div className="flex items-center justify-between mb-3">
                    <p className="font-bold text-slate-800 text-sm flex items-center gap-2">
                        <StepBadge n={2} /> Tùy chọn: Không hộp nào trống (Toàn ánh)
                    </p>
                    <label className="flex items-center gap-2 cursor-pointer">
                        <input type="checkbox" checked={noEmpty} onChange={e => setNoEmpty(e.target.checked)}
                            className="w-4 h-4 accent-blue-600" />
                        <span className="text-sm text-slate-600">Bật</span>
                    </label>
                </div>
                {noEmpty ? (
                    <div className="space-y-3">
                        <p className="text-sm text-slate-600">
                            Dùng PIE để trừ các trường hợp có hộp trống:
                        </p>
                        <BlockMath math={`N_{\\text{toàn ánh}} = \\sum_{j=0}^{k} (-1)^j C_k^j (k-j)^n`} />
                        <div className="overflow-x-auto rounded-xl border border-slate-200">
                            <table className="w-full text-xs text-center border-collapse min-w-[520px]">
                                <thead>
                                    <tr className="bg-blue-700 text-white">
                                        <th className="px-3 py-2 font-semibold">j (# hộp bị bỏ)</th>
                                        <th className="px-3 py-2">Dấu (−1)^j</th>
                                        <th className="px-3 py-2"><InlineMath math="C_k^j" /></th>
                                        <th className="px-3 py-2"><InlineMath math="(k-j)^n" /></th>
                                        <th className="px-3 py-2 text-right">Đóng góp</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {data.surjRows.map((r, i) => (
                                        <tr key={i} className={`border-b border-slate-200 ${r.sign > 0 ? 'bg-blue-50' : 'bg-red-50'}`}>
                                            <td className="px-3 py-1.5 font-mono">{r.j}</td>
                                            <td className="px-3 py-1.5 font-bold text-lg">{r.sign > 0 ? '+' : '−'}</td>
                                            <td className="px-3 py-1.5">{r.ck}</td>
                                            <td className="px-3 py-1.5">{r.ways}</td>
                                            <td className={`px-3 py-1.5 text-right font-bold ${r.contrib >= 0 ? 'text-blue-700' : 'text-red-700'}`}>
                                                {r.contrib >= 0 ? '+' : ''}{fmtN(r.contrib)}
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                                <tfoot>
                                    <tr className="bg-blue-800 text-white font-bold">
                                        <td colSpan={4} className="px-3 py-2.5 text-left text-sm">Tổng (toàn ánh)</td>
                                        <td className="px-3 py-2.5 text-right font-mono text-yellow-300">{fmtN(data.surjTotal)}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                ) : (
                    <p className="text-sm text-slate-400 italic">Bật công tắc để xem bảng PIE cho hàm toàn ánh (surjective).</p>
                )}
            </SectionCard>

            <AnswerBox value={answer} label={noEmpty ? `Số toàn ánh [n,k] = [${n},${k}]` : `k^n = ${k}^${n}`} caseId={1} />
        </div>
    )
}

// ─── Case 2 Detail ────────────────────────────────────────────────
function Case2Detail({ n, k, data }) {
    const [noEmpty, setNoEmpty] = useState(false)
    const answer = noEmpty ? (n >= k ? C(n - 1, k - 1) : 0) : data.c2

    return (
        <div className="space-y-4">
            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3">Trực giác cốt lõi — Bài toán Vách Ngăn</p>
                <div className="bg-emerald-50 rounded-xl border border-emerald-200 p-4 space-y-3">
                    <p className="text-sm text-emerald-800">
                        Vì bi giống nhau, ta <strong>không cần biết viên nào ở đâu</strong> —
                        chỉ cần biết <em>mỗi hộp có bao nhiêu viên</em>.
                        Gọi <InlineMath math="x_i" /> = số viên trong hộp <InlineMath math="i" />:
                    </p>
                    <BlockMath math={`x_1 + x_2 + \\cdots + x_{${k}} = ${n},\\quad x_i \\geq 0`} />
                    <p className="text-sm text-emerald-700">
                        Xếp <InlineMath math={`${n}`} /> ngôi sao ★ và <InlineMath math={`${k - 1}`} /> thanh gạch | phân cách.
                        Tổng cộng <InlineMath math={`${n + k - 1}`} /> vị trí, chọn <InlineMath math={`${k - 1}`} /> vị trí cho thanh gạch.
                    </p>
                    <div className="flex flex-wrap items-center gap-0.5 mt-1">
                        {Array.from({ length: n + k - 1 }, (_, i) => (
                            <span key={i} className={`text-lg ${i < n ? 'text-emerald-600' : 'text-slate-500'}`}>
                                {i < n ? '★' : '|'}
                            </span>
                        ))}
                        <span className="text-xs text-slate-400 ml-2">← ví dụ một cách</span>
                    </div>
                </div>
            </SectionCard>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                    <StepBadge n={1} /> Công thức & Hàm sinh thường (OGF)
                </p>
                <BlockMath math={`N = C_{n+k-1}^{k-1} = C_{${n + k - 1}}^{${k - 1}} = ${fmtN(data.c2)}`} />
                <div className="mt-3 bg-slate-50 rounded-xl border border-slate-200 p-3 text-sm text-slate-600 space-y-1">
                    <p><strong>OGF mỗi hộp:</strong> <InlineMath math="1 + x + x^2 + \cdots = \frac{1}{1-x}" /></p>
                    <p><strong>OGF tổng ({k} hộp):</strong> <InlineMath math={`\\frac{1}{(1-x)^{${k}}} = \\sum_{n=0}^{\\infty} C_{n+${k - 1}}^{${k - 1}} x^n`} /></p>
                    <p><strong>Trích hệ số:</strong> <InlineMath math={`[x^{${n}}] = C_{${n + k - 1}}^{${k - 1}} = ${fmtN(data.c2)}`} /></p>
                </div>
            </SectionCard>

            <SectionCard>
                <div className="flex items-center justify-between mb-3">
                    <p className="font-bold text-slate-800 text-sm flex items-center gap-2">
                        <StepBadge n={2} /> Tùy chọn: Không hộp nào trống
                    </p>
                    <label className="flex items-center gap-2 cursor-pointer">
                        <input type="checkbox" checked={noEmpty} onChange={e => setNoEmpty(e.target.checked)}
                            className="w-4 h-4 accent-emerald-600" />
                        <span className="text-sm text-slate-600">Bật</span>
                    </label>
                </div>
                {noEmpty ? (
                    <div className="space-y-2">
                        <p className="text-sm text-slate-600">
                            Đặt <InlineMath math="y_i = x_i - 1 \geq 0" />, bài toán trở thành
                            {' '}<InlineMath math={`y_1 + \\cdots + y_{${k}} = ${n - k}`} />{' '}
                            {n >= k ? `(= ${n} − ${k})` : `→ không thể (${n} < ${k})`}
                        </p>
                        {n >= k && <BlockMath math={`N = C_{n-1}^{k-1} = C_{${n - 1}}^{${k - 1}} = ${C(n - 1, k - 1)}`} />}
                    </div>
                ) : (
                    <p className="text-sm text-slate-400 italic">Bật để thấy trường hợp mỗi hộp ≥ 1 viên bi.</p>
                )}
            </SectionCard>

            <AnswerBox value={answer} label={noEmpty ? `Không hộp trống: C(n-1, k-1) = C(${n - 1}, ${k - 1})` : `C(n+k-1, k-1) = C(${n + k - 1}, ${k - 1})`} caseId={2} />
        </div>
    )
}

// ─── Case 3 Detail ────────────────────────────────────────────────
function Case3Detail({ n, k, data }) {
    const [showTriangle, setShowTriangle] = useState(true)
    const [exact, setExact] = useState(false)

    const nCapped = Math.min(n, 12)
    const exactVal = data.S ? (data.S[nCapped]?.[k] ?? 0) : 0
    const answer = exact ? exactVal : data.c3

    return (
        <div className="space-y-4">
            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3">Trực giác cốt lõi — Số Stirling</p>
                <div className="bg-violet-50 rounded-xl border border-violet-200 p-4 space-y-2">
                    <p className="text-sm text-violet-800">
                        Vì nhóm không có tên, <strong>đổi tên nhóm không tạo cách mới</strong>.
                        Ký hiệu <InlineMath math="S_n^k" /> = số cách chia <InlineMath math="n" /> vật
                        phân biệt thành <strong>đúng k</strong> nhóm không tên, không rỗng.
                    </p>
                    <div className="bg-white rounded-lg border border-violet-200 p-3 text-sm text-violet-700 space-y-1">
                        <p className="font-semibold">Câu chuyện học sinh thứ n:</p>
                        <p>• Học sinh n <em>tự lập nhóm riêng</em> (1 người) → <InlineMath math="S_{n-1}^{k-1}" /> cách</p>
                        <p>• Học sinh n <em>gia nhập 1 trong k nhóm</em> sẵn có → <InlineMath math={`k \\cdot S_{n-1}^{k}`} /> cách</p>
                        <BlockMath math="S_n^k = S_{n-1}^{k-1} + k \cdot S_{n-1}^k" />
                    </div>
                </div>
            </SectionCard>

            <SectionCard>
                <div className="flex items-center justify-between mb-3">
                    <p className="font-bold text-slate-800 text-sm flex items-center gap-2">
                        <StepBadge n={1} /> Bảng Stirling (hàng n = {nCapped})
                    </p>
                    <button onClick={() => setShowTriangle(v => !v)}
                        className="text-xs text-violet-600 hover:text-violet-800 underline">
                        {showTriangle ? 'Ẩn bảng' : 'Hiện bảng'}
                    </button>
                </div>
                {showTriangle && data.S && (
                    <div className="overflow-x-auto rounded-xl border border-slate-200">
                        <table className="text-xs text-center border-collapse min-w-full">
                            <thead>
                                <tr className="bg-slate-700 text-white">
                                    <th className="px-2 py-2 w-10">n＼k</th>
                                    {Array.from({ length: nCapped + 1 }, (_, j) => (
                                        <th key={j} className={`px-2 py-2 w-12 ${j === k ? 'bg-violet-500' : ''}`}>{j}</th>
                                    ))}
                                </tr>
                            </thead>
                            <tbody>
                                {Array.from({ length: nCapped + 1 }, (_, ni) => (
                                    <tr key={ni} className={`border-b border-slate-200 ${ni === nCapped ? 'bg-violet-50 font-bold' : ni % 2 === 0 ? 'bg-white' : 'bg-slate-50'}`}>
                                        <td className="px-2 py-1.5 font-bold text-slate-600">{ni}</td>
                                        {Array.from({ length: nCapped + 1 }, (_, j) => {
                                            const val = data.S[ni]?.[j] ?? 0
                                            const isTarget = ni === nCapped && j >= 1 && j <= k
                                            return (
                                                <td key={j} className={`px-2 py-1.5 font-mono ${isTarget ? 'bg-violet-200 font-black text-violet-800' : val === 0 ? 'text-slate-200' : 'text-slate-700'}`}>
                                                    {val > 0 ? fmtN(val) : (val === 0 && ni === 0 && j === 0 ? '1' : '0')}
                                                </td>
                                            )
                                        })}
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                        <p className="text-xs text-slate-400 p-2">Ô tím = S(n, j) cần dùng</p>
                    </div>
                )}
            </SectionCard>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                    <StepBadge n={2} /> Tổng hợp kết quả
                </p>
                <div className="flex items-center gap-3 mb-3 flex-wrap">
                    <label className="flex items-center gap-1.5 text-sm text-slate-600 cursor-pointer">
                        <input type="radio" checked={!exact} onChange={() => setExact(false)} className="accent-violet-600" />
                        Tối đa {k} nhóm (≤ k nhóm)
                    </label>
                    <label className="flex items-center gap-1.5 text-sm text-slate-600 cursor-pointer">
                        <input type="radio" checked={exact} onChange={() => setExact(true)} className="accent-violet-600" />
                        Đúng {k} nhóm (= k nhóm)
                    </label>
                </div>
                {!exact ? (
                    <div className="space-y-2">
                        <BlockMath math={`N = \\sum_{j=1}^{k} S_{${nCapped}}^{j} = ${data.c3_row.map(r => fmtN(r.val)).join(' + ')} = ${fmtN(data.c3)}`} />
                    </div>
                ) : (
                    <div className="space-y-2">
                        <BlockMath math={`N = S_{${nCapped}}^{${k}} = ${fmtN(exactVal)}`} />
                    </div>
                )}
            </SectionCard>

            <AnswerBox value={answer} label={exact ? `Đúng k = ${k} nhóm: S(${nCapped}, ${k})` : `Tối đa k = ${k} nhóm: Σ S(${nCapped}, j)`} caseId={3} />
        </div>
    )
}

// ─── Case 4 Detail ────────────────────────────────────────────────
function Case4Detail({ n, k, data }) {
    const [exact, setExact] = useState(false)

    const partsToShow = exact
        ? data.partList.filter(p => p.length === k)
        : data.partList
    const count = partsToShow.length

    return (
        <div className="space-y-4">
            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3">Trực giác cốt lõi — Phân hoạch số</p>
                <div className="bg-orange-50 rounded-xl border border-orange-200 p-4 space-y-2">
                    <p className="text-sm text-orange-800">
                        Cả vật lẫn túi đều <strong>giống nhau</strong>. Ta chỉ thấy <em>hình dạng</em>{' '}
                        của sự phân chia — tức là danh sách số lượng từng túi <strong>sắp xếp giảm dần</strong>.
                    </p>
                    <p className="text-sm text-orange-700">
                        Bài toán ⟺ Phân tích số <InlineMath math={`${n}`} /> thành tổng
                        không quá <InlineMath math={`${k}`} /> số nguyên dương,
                        sắp theo thứ tự giảm dần.
                    </p>
                    <div className="bg-white rounded-lg border border-orange-200 p-2 text-xs text-orange-600 space-y-0.5 mt-1">
                        <p className="font-semibold mb-1">Tại sao 3+1 và 1+3 là một?</p>
                        <p>Vì túi không tên → đổi thứ tự túi không tạo cách mới.</p>
                        <p>Ta quy ước luôn viết phần lớn trước: 3+1+0.</p>
                    </div>
                </div>
            </SectionCard>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                    <StepBadge n={1} /> Hàm sinh phân hoạch Euler
                </p>
                <BlockMath math={`P_k(x) = \\prod_{j=1}^{${k}} \\frac{1}{1-x^j}`} />
                <div className="mt-2 text-sm text-slate-600 space-y-1 bg-slate-50 rounded-xl border border-slate-200 p-3">
                    <p>Nhân tử <InlineMath math="\\frac{1}{1-x^j}" /> = số lần dùng phần có kích thước j (0, 1, 2, … lần).</p>
                    <p>Hệ số <InlineMath math={`[x^{${n}}]`} /> = số phân hoạch của {n} với phần lớn nhất ≤ {k}.</p>
                    <p className="text-xs text-slate-400">(Tính đối ngẫu: ≤ k <strong>phần</strong> ⟺ phần lớn nhất ≤ k)</p>
                </div>
            </SectionCard>

            <SectionCard>
                <div className="flex items-center justify-between mb-3">
                    <p className="font-bold text-slate-800 text-sm flex items-center gap-2">
                        <StepBadge n={2} /> Liệt kê tất cả phân hoạch
                    </p>
                    <div className="flex gap-3">
                        <label className="flex items-center gap-1.5 text-xs text-slate-600 cursor-pointer">
                            <input type="radio" checked={!exact} onChange={() => setExact(false)} className="accent-orange-600" />
                            ≤ {k} phần
                        </label>
                        <label className="flex items-center gap-1.5 text-xs text-slate-600 cursor-pointer">
                            <input type="radio" checked={exact} onChange={() => setExact(true)} className="accent-orange-600" />
                            Đúng {k} phần
                        </label>
                    </div>
                </div>
                {n > 14
                    ? <p className="text-sm text-slate-400 italic">n &gt; 14 — quá nhiều phân hoạch để liệt kê, dùng DP để đếm.</p>
                    : (
                        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-2">
                            {partsToShow.map((p, idx) => (
                                <div key={idx} className="bg-orange-50 border border-orange-200 rounded-lg p-2 space-y-1.5">
                                    <p className="font-mono text-xs text-orange-800 font-bold text-center">
                                        {p.join(' + ')}
                                        {p.length < k && ' + ' + Array(k - p.length).fill('0').join(' + ')}
                                    </p>
                                    <div className="flex gap-0.5 justify-center">
                                        {p.map((v, i) => (
                                            <div key={i} className="flex flex-col-reverse gap-0.5">
                                                {Array.from({ length: v }, (_, j) => (
                                                    <div key={j} className="w-3 h-3 rounded-sm bg-orange-400" />
                                                ))}
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            ))}
                        </div>
                    )
                }
                <p className="text-xs text-slate-500 mt-2 text-right">
                    {exact ? `Đúng ${k} phần:` : `Tối đa ${k} phần:`} <strong>{fmtN(count)}</strong> phân hoạch
                </p>
            </SectionCard>

            <AnswerBox value={count} label={exact ? `Phân hoạch ${n} thành đúng ${k} phần` : `Phân hoạch ${n} thành ≤ ${k} phần`} caseId={4} />
        </div>
    )
}

// ─── Main Page ────────────────────────────────────────────────────
export default function PhanPhoiPage({ onNavigate }) {
    const [n, setN] = useState(4)
    const [k, setK] = useState(3)
    const [activeCase, setActiveCase] = useState(1)

    const kMax = Math.min(n, 6)
    const kSafe = Math.min(k, kMax)

    const data = useMemo(() => computeAll(n, kSafe), [n, kSafe])

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-6">
            {/* ── Header ── */}
            <div>
                <h1 className="text-2xl font-bold text-slate-900">4 Trường Hợp Phân Phối Vật vào Hộp</h1>
                <p className="text-sm text-slate-500 mt-0.5">
                    Hai câu hỏi quyết định tất cả: <strong>Vật phân biệt hay giống nhau?</strong> &nbsp;•&nbsp; <strong>Hộp phân biệt hay giống nhau?</strong>
                </p>
            </div>

            {/* ── Theory banner ── */}
            <div className="bg-gradient-to-r from-slate-800 to-slate-700 rounded-2xl p-5 text-white shadow-md">
                <p className="font-bold text-base mb-3">📖 Khung lý thuyết nền tảng</p>
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3">
                    {CASE_META.map(m => {
                        const t = CASE_THEME[m.id]
                        return (
                            <div key={m.id}
                                className={`${t.bgL} ${t.border} border-l-4 rounded-xl p-3 cursor-pointer transition-all hover:opacity-90 ${activeCase === m.id ? `ring-2 ${t.ring}` : ''}`}
                                onClick={() => setActiveCase(m.id)}>
                                <p className={`font-bold text-sm ${t.text}`}>{m.icon} Case {m.id}</p>
                                <p className="text-xs text-slate-600 mt-1">Vật: <strong>{m.vatLabel}</strong></p>
                                <p className="text-xs text-slate-600">Hộp: <strong>{m.hopLabel}</strong></p>
                                <p className={`text-xs font-mono mt-1.5 ${t.text}`}>{m.formulaShort}</p>
                                <p className="text-[10px] text-slate-400 mt-1 italic">{m.example}</p>
                            </div>
                        )
                    })}
                </div>
                <div className="mt-3 pt-3 border-t border-slate-600 text-sm text-slate-300 space-y-0.5">
                    <p>• Từ Case 1 → Case 2: xóa danh tính <em>vật</em> → cách giảm mạnh</p>
                    <p>• Từ Case 1 → Case 3: xóa danh tính <em>hộp</em> → cách giảm vừa</p>
                    <p>• Case 4 (ít nhất): xóa cả hai → chỉ còn "hình dạng" của sự phân chia</p>
                </div>
            </div>

            {/* ── n, k controls + matrix ── */}
            <div className="grid grid-cols-1 lg:grid-cols-[auto_1fr] gap-6 items-start">
                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5 space-y-4">
                    <p className="font-bold text-slate-800 text-sm">Chọn n và k</p>
                    <Spinner label="n" value={n} min={1} max={10} onChange={v => setN(v)} />
                    <Spinner label="k" value={kSafe} min={1} max={kMax} onChange={v => setK(v)} accent="violet" />
                    <p className="text-xs text-slate-400">n = số vật, k = số hộp</p>
                    <div className="pt-2 border-t border-slate-100">
                        <p className="text-xs text-slate-500 font-semibold mb-2">Kết quả nhanh:</p>
                        {CASE_META.map(m => {
                            const val = [null, data.c1, data.c2, data.c3, data.c4][m.id]
                            const t = CASE_THEME[m.id]
                            return (
                                <button key={m.id} onClick={() => setActiveCase(m.id)}
                                    className={`w-full flex justify-between items-center px-3 py-1.5 rounded-lg mb-1 text-sm transition-all border ${activeCase === m.id ? `${t.bgL} ${t.border} border-l-4` : 'border-transparent hover:bg-slate-50'}`}>
                                    <span className={`${t.text} font-medium`}>Case {m.id}</span>
                                    <span className={`font-black ${t.text}`}>{fmtN(val)}</span>
                                </button>
                            )
                        })}
                    </div>
                </div>

                <TheoryMatrix n={n} k={kSafe} data={data} activeCase={activeCase} onSelect={setActiveCase} />
            </div>

            {/* ── Case tabs ── */}
            <div className="space-y-4">
                <div className="flex gap-2 flex-wrap">
                    {CASE_META.map(m => {
                        const t = CASE_THEME[m.id]
                        const val = [null, data.c1, data.c2, data.c3, data.c4][m.id]
                        return (
                            <button key={m.id} onClick={() => setActiveCase(m.id)}
                                className={`flex items-center gap-2 px-4 py-2.5 rounded-xl font-semibold text-sm border-2 transition-all ${activeCase === m.id
                                    ? `${t.bg} text-white border-transparent shadow-sm`
                                    : `bg-white ${t.text} ${t.border} hover:${t.bgL}`}`}>
                                {m.icon} Case {m.id}: {m.vatLabel} × {m.hopLabel}
                                <span className={`ml-1 text-xs font-black ${activeCase === m.id ? 'text-white/80' : t.text}`}>
                                    = {fmtN(val)}
                                </span>
                            </button>
                        )
                    })}
                </div>

                {/* ── Detail view ── */}
                {activeCase === 1 && <Case1Detail n={n} k={kSafe} data={data} />}
                {activeCase === 2 && <Case2Detail n={n} k={kSafe} data={data} />}
                {activeCase === 3 && <Case3Detail n={n} k={kSafe} data={data} />}
                {activeCase === 4 && <Case4Detail n={n} k={kSafe} data={data} />}
            </div>
        </div>
    )
}
