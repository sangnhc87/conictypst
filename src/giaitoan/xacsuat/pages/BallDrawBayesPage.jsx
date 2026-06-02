import React, { useEffect, useMemo, useState } from 'react'
import { BlockMath, InlineMath } from 'react-katex'
import 'katex/dist/katex.min.css'

const EVENT_OPTIONS = [
    { id: 'same', label: '2 bi cùng màu', short: 'cùng màu' },
    { id: 'diff', label: '2 bi khác màu', short: 'khác màu' },
    { id: 'rr', label: '2 bi đỏ', short: '2 đỏ' },
    { id: 'bb', label: '2 bi xanh', short: '2 xanh' },
]

const PRESETS = [
    {
        id: 'equal-same',
        title: '3 hộp đồng xác suất — biết cùng màu',
        note: 'Mẫu chuẩn để học Bayes ngược từ một kết quả quan sát.',
        eventType: 'same',
        targetId: 'H2',
        boxes: [
            { id: 'H1', label: 'Hộp I', red: 3, blue: 2, weight: 1 },
            { id: 'H2', label: 'Hộp II', red: 4, blue: 2, weight: 1 },
            { id: 'H3', label: 'Hộp III', red: 2, blue: 4, weight: 1 },
        ],
    },
    {
        id: 'dice-diff',
        title: 'Gieo xúc xắc chọn hộp — biết khác màu',
        note: 'Prior không đều: hộp III được chọn nhiều hơn nên hậu nghiệm đổi rõ rệt.',
        eventType: 'diff',
        targetId: 'H3',
        boxes: [
            { id: 'H1', label: 'Hộp I', red: 4, blue: 2, weight: 1 },
            { id: 'H2', label: 'Hộp II', red: 5, blue: 1, weight: 2 },
            { id: 'H3', label: 'Hộp III', red: 3, blue: 3, weight: 3 },
        ],
    },
    {
        id: 'same-heavy-h1',
        title: 'Ưu tiên hộp I — biết cùng màu',
        note: 'Cùng công thức nhưng prior nghiêng mạnh về một hộp.',
        eventType: 'same',
        targetId: 'H1',
        boxes: [
            { id: 'H1', label: 'Hộp I', red: 4, blue: 3, weight: 3 },
            { id: 'H2', label: 'Hộp II', red: 5, blue: 2, weight: 2 },
            { id: 'H3', label: 'Hộp III', red: 2, blue: 5, weight: 1 },
        ],
    },
]

function gcd(a, b) {
    let x = Math.abs(a)
    let y = Math.abs(b)
    while (y !== 0) {
        const t = x % y
        x = y
        y = t
    }
    return x || 1
}

function frac(n, d = 1) {
    if (d === 0) return { n: 0, d: 1 }
    if (n === 0) return { n: 0, d: 1 }
    const sign = d < 0 ? -1 : 1
    const g = gcd(n, d)
    return { n: sign * n / g, d: Math.abs(d) / g }
}

function addFrac(a, b) {
    return frac(a.n * b.d + b.n * a.d, a.d * b.d)
}

function mulFrac(a, b) {
    return frac(a.n * b.n, a.d * b.d)
}

function divFrac(a, b) {
    if (b.n === 0) return { n: 0, d: 1 }
    return frac(a.n * b.d, a.d * b.n)
}

function fracToText(value) {
    return value.d === 1 ? `${value.n}` : `${value.n}/${value.d}`
}

function fracToLatex(value) {
    return value.d === 1 ? `${value.n}` : `\\dfrac{${value.n}}{${value.d}}`
}

function fracToDecimal(value, digits = 4) {
    return (value.n / value.d).toFixed(digits)
}

function fracToPercent(value, digits = 2) {
    return `${((100 * value.n) / value.d).toFixed(digits)}%`
}

function comb2(n) {
    return n >= 2 ? (n * (n - 1)) / 2 : 0
}

function clampInt(value, min = 0, max = 12) {
    const next = Number.isFinite(value) ? value : min
    return Math.max(min, Math.min(max, Math.round(next)))
}

function eventMeta(eventType) {
    return EVENT_OPTIONS.find(option => option.id === eventType) || EVENT_OPTIONS[0]
}

function eventWays(box, eventType) {
    if (eventType === 'same') return comb2(box.red) + comb2(box.blue)
    if (eventType === 'diff') return box.red * box.blue
    if (eventType === 'rr') return comb2(box.red)
    if (eventType === 'bb') return comb2(box.blue)
    return 0
}

function eventWaysLatex(box, eventType) {
    if (eventType === 'same') {
        const parts = []
        if (box.red >= 2) parts.push(`C_${box.red}^2`)
        if (box.blue >= 2) parts.push(`C_${box.blue}^2`)
        return parts.length ? parts.join(' + ') : '0'
    }
    if (eventType === 'diff') return `C_${box.red}^1 \\cdot C_${box.blue}^1`
    if (eventType === 'rr') return box.red >= 2 ? `C_${box.red}^2` : '0'
    if (eventType === 'bb') return box.blue >= 2 ? `C_${box.blue}^2` : '0'
    return '0'
}

function totalWaysLatex(box) {
    return `C_${box.red + box.blue}^2`
}

function SectionCard({ children, className = '' }) {
    return <div className={`bg-white rounded-2xl border border-slate-200 shadow-sm p-5 ${className}`}>{children}</div>
}

function StepBadge({ n }) {
    return (
        <span className="inline-flex items-center justify-center w-5 h-5 rounded-full bg-slate-700 text-white text-xs font-bold shrink-0">{n}</span>
    )
}

function CountInput({ label, value, onChange, accent }) {
    return (
        <label className="flex items-center justify-between gap-3 text-sm">
            <span className="text-slate-600 font-medium">{label}</span>
            <input
                type="number"
                min={0}
                max={12}
                value={value}
                onChange={event => onChange(clampInt(parseInt(event.target.value, 10), 0, 12))}
                className={`w-16 rounded-lg border border-slate-300 px-2.5 py-1.5 text-center font-bold text-slate-800 focus:outline-none focus:ring-2 ${accent}`}
            />
        </label>
    )
}

function BallPreview({ red, blue }) {
    return (
        <div className="flex items-center gap-3 text-xs text-slate-500">
            <span className="inline-flex items-center gap-1.5">
                <span className="w-3 h-3 rounded-full bg-red-500 inline-block" />
                {red} đỏ
            </span>
            <span className="inline-flex items-center gap-1.5">
                <span className="w-3 h-3 rounded-full bg-sky-500 inline-block" />
                {blue} xanh
            </span>
        </div>
    )
}

function BoxEditor({ box, isTarget, onChange, onSetTarget }) {
    return (
        <div className={`rounded-xl border p-4 space-y-3 ${isTarget ? 'border-emerald-400 bg-emerald-50' : 'border-slate-200 bg-slate-50'}`}>
            <div className="flex items-center justify-between gap-3">
                <div>
                    <p className="font-bold text-slate-800 text-sm">{box.label}</p>
                    <BallPreview red={box.red} blue={box.blue} />
                </div>
                <button
                    type="button"
                    onClick={onSetTarget}
                    className={`px-3 py-1.5 rounded-full text-xs font-bold border ${isTarget ? 'bg-emerald-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-300 hover:border-slate-500'}`}
                >
                    {isTarget ? 'Đang hỏi hộp này' : 'Chọn làm hộp cần tìm'}
                </button>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                <CountInput label="Bi đỏ" value={box.red} onChange={value => onChange({ ...box, red: value })} accent="focus:ring-red-400" />
                <CountInput label="Bi xanh" value={box.blue} onChange={value => onChange({ ...box, blue: value })} accent="focus:ring-sky-400" />
                <CountInput label="Trọng số chọn" value={box.weight} onChange={value => onChange({ ...box, weight: value })} accent="focus:ring-emerald-400" />
            </div>

            <p className="text-xs text-slate-500">
                Trọng số có thể là số mặt xúc xắc, số ô trên vòng quay, hoặc chỉ đơn giản là “độ ưu tiên” khi chọn hộp.
            </p>
        </div>
    )
}

function TheoryCard({ eventType }) {
    const meta = eventMeta(eventType)
    return (
        <SectionCard className="bg-slate-900 text-white border-slate-900">
            <div className="space-y-3">
                <div>
                    <p className="text-xs uppercase tracking-[0.22em] text-white/60 mb-2">Lớp bài toán</p>
                    <h1 className="text-2xl font-black tracking-tight">Chọn Hộp Rồi Bốc Bi</h1>
                    <p className="text-sm text-white/70 mt-2 max-w-3xl leading-relaxed">
                        Điểm mấu chốt không phải là nhớ từng đề riêng lẻ, mà là luôn đi theo cùng một khung:
                        chọn hộp trước, tính xác suất quan sát trong từng hộp sau, rồi mới suy ngược bằng Bayes.
                    </p>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-3 text-sm">
                    <div className="rounded-xl bg-white/10 p-3 border border-white/10">
                        <p className="font-bold mb-1">1. Xác suất chọn hộp</p>
                        <p className="text-white/75">Viết rõ <InlineMath math="P(H_i)" /> cho từng hộp từ xúc xắc, vòng quay, hay đề bài “chọn ngẫu nhiên”.</p>
                    </div>
                    <div className="rounded-xl bg-white/10 p-3 border border-white/10">
                        <p className="font-bold mb-1">2. Xác suất quan sát</p>
                        <p className="text-white/75">Với mỗi hộp, tính <InlineMath math={`P(E\mid H_i)`} /> cho biến cố đang biết: <strong>{meta.label}</strong>.</p>
                    </div>
                    <div className="rounded-xl bg-white/10 p-3 border border-white/10">
                        <p className="font-bold mb-1">3. Suy ngược bằng Bayes</p>
                        <p className="text-white/75">Hộp nào vừa dễ được chọn, vừa dễ sinh ra kết quả quan sát thì hậu nghiệm của hộp đó sẽ tăng.</p>
                    </div>
                </div>

                <div className="rounded-xl bg-white/10 p-4 border border-white/10">
                    <BlockMath math={`P(H_t\mid E)=\dfrac{P(H_t)\,P(E\mid H_t)}{\sum_i P(H_i)\,P(E\mid H_i)}`} />
                </div>
            </div>
        </SectionCard>
    )
}

function ScenarioCard({ boxes, eventType, targetBox, preset }) {
    const weightSum = boxes.reduce((sum, box) => sum + box.weight, 0)
    return (
        <SectionCard>
            <p className="font-bold text-slate-800 text-sm mb-3">Đề bài đang mô phỏng</p>
            <div className="space-y-2 text-sm text-slate-700 leading-relaxed">
                <p>
                    Có <strong>{boxes.length} hộp</strong>. Hộp được chọn với các trọng số
                    {' '}
                    <strong>{boxes.map(box => `${box.label}: ${box.weight}`).join(', ')}</strong>
                    {' '}
                    nên tổng trọng số là <strong>{weightSum}</strong>.
                </p>
                <p>
                    Sau khi chọn hộp, ta bốc ngẫu nhiên đồng thời <strong>2 bi</strong>. Biết kết quả quan sát là
                    {' '}
                    <strong>{eventMeta(eventType).label}</strong>.
                </p>
                <p>
                    Câu hỏi cần trả lời: xác suất để kết quả đó xuất phát từ <strong>{targetBox?.label}</strong> bằng bao nhiêu?
                </p>
                <div className="rounded-lg bg-slate-50 border border-slate-200 p-3 text-xs text-slate-500">
                    Preset hiện tại: <strong>{preset.title}</strong>. {preset.note}
                </div>
            </div>
        </SectionCard>
    )
}

function BranchTable({ rows, totalEvent }) {
    return (
        <SectionCard>
            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                <StepBadge n={1} /> Bảng nhánh xác suất
            </p>
            <div className="overflow-x-auto rounded-xl border border-slate-200">
                <table className="w-full text-sm min-w-[840px] border-collapse">
                    <thead>
                        <tr className="bg-slate-800 text-white text-xs">
                            <th className="px-3 py-2.5 text-left">Hộp</th>
                            <th className="px-3 py-2.5 text-left">Thành phần</th>
                            <th className="px-3 py-2.5 text-center"><InlineMath math="P(H_i)" /></th>
                            <th className="px-3 py-2.5 text-center">Số cách thuận lợi</th>
                            <th className="px-3 py-2.5 text-center"><InlineMath math="P(E\mid H_i)" /></th>
                            <th className="px-3 py-2.5 text-center"><InlineMath math="P(H_i\cap E)" /></th>
                            <th className="px-3 py-2.5 text-center"><InlineMath math="P(H_i\mid E)" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        {rows.map((row, index) => (
                            <tr key={row.id} className={`border-b border-slate-200 ${index % 2 === 0 ? 'bg-white' : 'bg-slate-50'}`}>
                                <td className="px-3 py-2.5 font-bold text-slate-800">{row.label}</td>
                                <td className="px-3 py-2.5 text-slate-600">
                                    {row.red} đỏ, {row.blue} xanh
                                </td>
                                <td className="px-3 py-2.5 text-center font-mono">{fracToText(row.prior)}</td>
                                <td className="px-3 py-2.5 text-center">
                                    <div className="text-xs text-slate-500"><InlineMath math={row.eventWaysExpr} /></div>
                                    <div className="font-semibold text-slate-700">{row.eventWays}/{row.totalWays}</div>
                                </td>
                                <td className="px-3 py-2.5 text-center font-mono text-blue-700">{fracToText(row.cond)}</td>
                                <td className="px-3 py-2.5 text-center font-mono text-violet-700">{fracToText(row.joint)}</td>
                                <td className="px-3 py-2.5 text-center font-mono text-emerald-700">{fracToText(row.posterior)}</td>
                            </tr>
                        ))}
                        <tr className="bg-amber-50 border-t-2 border-amber-300">
                            <td className="px-3 py-2.5 font-bold text-amber-800" colSpan={5}>Tổng xác suất quan sát biến cố <InlineMath math="P(E)" /></td>
                            <td className="px-3 py-2.5 text-center font-mono font-bold text-amber-800">{fracToText(totalEvent)}</td>
                            <td className="px-3 py-2.5 text-center text-slate-400">—</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </SectionCard>
    )
}

function BayesWalkthrough({ rows, totalEvent, targetRow, eventType }) {
    const termsLatex = rows.map(row => `${fracToLatex(row.prior)}\cdot${fracToLatex(row.cond)}`).join(' + ')
    return (
        <SectionCard>
            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                <StepBadge n={2} /> Gỡ từng lớp công thức Bayes
            </p>
            <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                <p>
                    Trước hết, không đi tìm ngay <InlineMath math={`P(${targetRow.id}\mid E)`} />. Ta phải cộng hết các nhánh có thể tạo ra biến cố
                    {' '}
                    <strong>{eventMeta(eventType).label}</strong> để ra <InlineMath math="P(E)" />.
                </p>
                <div className="rounded-xl bg-slate-50 border border-slate-200 p-4">
                    <BlockMath math={`P(E)=${termsLatex}=${fracToLatex(totalEvent)}`} />
                </div>
                <p>
                    Sau đó chỉ lấy riêng nhánh của <strong>{targetRow.label}</strong> làm tử số:
                </p>
                <div className="rounded-xl bg-emerald-50 border border-emerald-200 p-4">
                    <BlockMath
                        math={`P(${targetRow.id}\mid E)=\dfrac{${fracToLatex(targetRow.prior)}\cdot${fracToLatex(targetRow.cond)}}{${fracToLatex(totalEvent)}}=\dfrac{${fracToLatex(targetRow.joint)}}{${fracToLatex(totalEvent)}}=${fracToLatex(targetRow.posterior)}`}
                    />
                </div>
                <p className="text-xs text-slate-500">
                    Lỗi rất hay gặp: chỉ nhìn <InlineMath math="P(E\mid H_i)" /> mà quên mất hộp đó ban đầu có thể được chọn nhiều hay ít.
                </p>
            </div>
        </SectionCard>
    )
}

function IntuitionPanel({ rows, targetRow, eventType }) {
    const sorted = [...rows].sort((a, b) => (b.posterior.n / b.posterior.d) - (a.posterior.n / a.posterior.d))
    return (
        <SectionCard>
            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                <StepBadge n={3} /> Nhìn trực giác hậu nghiệm
            </p>
            <div className="space-y-3">
                {sorted.map(row => {
                    const percent = Math.max(0, Math.min(100, (100 * row.posterior.n) / row.posterior.d))
                    return (
                        <div key={row.id} className="space-y-1.5">
                            <div className="flex items-center justify-between gap-3 text-sm">
                                <div>
                                    <span className={`font-bold ${row.id === targetRow.id ? 'text-emerald-700' : 'text-slate-700'}`}>{row.label}</span>
                                    <span className="text-slate-400 ml-2">nếu biết {eventMeta(eventType).short}</span>
                                </div>
                                <span className={`font-mono font-bold ${row.id === targetRow.id ? 'text-emerald-700' : 'text-slate-600'}`}>{fracToText(row.posterior)} ≈ {fracToDecimal(row.posterior, 4)}</span>
                            </div>
                            <div className="w-full h-3 rounded-full bg-slate-100 overflow-hidden">
                                <div className={`h-full rounded-full ${row.id === targetRow.id ? 'bg-emerald-500' : 'bg-slate-400'}`} style={{ width: `${percent}%` }} />
                            </div>
                        </div>
                    )
                })}
            </div>
        </SectionCard>
    )
}

function AnswerBox({ targetRow }) {
    return (
        <div className="rounded-2xl bg-gradient-to-br from-emerald-600 to-emerald-800 p-6 text-white shadow-lg">
            <div className="text-xs uppercase tracking-[0.2em] text-white/65 mb-2">Đáp số cần tìm</div>
            <div className="text-4xl font-black leading-none mb-2">{fracToDecimal(targetRow.posterior, 4)}</div>
            <div className="text-sm text-white/85">= {fracToText(targetRow.posterior)} = {fracToPercent(targetRow.posterior, 2)}</div>
        </div>
    )
}

export default function BallDrawBayesPage() {
    const [presetId, setPresetId] = useState(PRESETS[0].id)
    const preset = useMemo(() => PRESETS.find(item => item.id === presetId) || PRESETS[0], [presetId])
    const [boxes, setBoxes] = useState(preset.boxes)
    const [eventType, setEventType] = useState(preset.eventType)
    const [targetId, setTargetId] = useState(preset.targetId)

    useEffect(() => {
        setBoxes(preset.boxes.map(box => ({ ...box })))
        setEventType(preset.eventType)
        setTargetId(preset.targetId)
    }, [preset])

    const derived = useMemo(() => {
        const safeBoxes = boxes.map(box => ({
            ...box,
            red: clampInt(box.red, 0, 12),
            blue: clampInt(box.blue, 0, 12),
            weight: clampInt(box.weight, 0, 12),
        }))
        const weightSum = safeBoxes.reduce((sum, box) => sum + box.weight, 0)
        const rows = safeBoxes.map(box => {
            const totalWays = comb2(box.red + box.blue)
            const prior = weightSum > 0 ? frac(box.weight, weightSum) : frac(0, 1)
            const favorable = eventWays(box, eventType)
            const cond = totalWays > 0 ? frac(favorable, totalWays) : frac(0, 1)
            const joint = mulFrac(prior, cond)
            return {
                ...box,
                totalWays,
                prior,
                eventWays: favorable,
                eventWaysExpr: `${eventWaysLatex(box, eventType)}\;/\;${totalWaysLatex(box)}`,
                cond,
                joint,
            }
        })
        const totalEvent = rows.reduce((sum, row) => addFrac(sum, row.joint), frac(0, 1))
        const withPosterior = rows.map(row => ({
            ...row,
            posterior: totalEvent.n === 0 ? frac(0, 1) : divFrac(row.joint, totalEvent),
        }))
        const targetRow = withPosterior.find(row => row.id === targetId) || withPosterior[0]
        return {
            boxes: safeBoxes,
            rows: withPosterior,
            totalEvent,
            targetRow,
            weightSum,
        }
    }, [boxes, eventType, targetId])

    const isDegenerate = derived.weightSum === 0 || derived.totalEvent.n === 0

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-5">
            <TheoryCard eventType={eventType} />

            <div className="grid grid-cols-1 xl:grid-cols-[1.15fr_0.85fr] gap-5">
                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Preset nhanh</p>
                        <div className="flex flex-wrap gap-2">
                            {PRESETS.map(item => (
                                <button
                                    key={item.id}
                                    type="button"
                                    onClick={() => setPresetId(item.id)}
                                    className={`px-4 py-2 rounded-xl text-sm font-semibold border transition-colors ${item.id === presetId ? 'bg-emerald-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'}`}
                                >
                                    {item.title}
                                </button>
                            ))}
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Biến cố đã biết</p>
                        <div className="flex flex-wrap gap-2">
                            {EVENT_OPTIONS.map(option => (
                                <button
                                    key={option.id}
                                    type="button"
                                    onClick={() => setEventType(option.id)}
                                    className={`px-4 py-2 rounded-xl text-sm font-semibold border transition-colors ${option.id === eventType ? 'bg-slate-900 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'}`}
                                >
                                    {option.label}
                                </button>
                            ))}
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Chỉnh từng hộp</p>
                        <div className="space-y-3">
                            {boxes.map(box => (
                                <BoxEditor
                                    key={box.id}
                                    box={box}
                                    isTarget={targetId === box.id}
                                    onChange={next => setBoxes(prev => prev.map(item => item.id === box.id ? next : item))}
                                    onSetTarget={() => setTargetId(box.id)}
                                />
                            ))}
                        </div>
                    </SectionCard>
                </div>

                <div className="space-y-5">
                    <ScenarioCard boxes={derived.boxes} eventType={eventType} targetBox={derived.targetRow} preset={preset} />
                    {isDegenerate ? (
                        <SectionCard className="border-red-200 bg-red-50">
                            <p className="font-bold text-red-700 text-sm mb-2">Chưa đủ dữ kiện để tính</p>
                            <p className="text-sm text-red-700">
                                Cần ít nhất một hộp có trọng số chọn dương và biến cố quan sát phải có xác suất lớn hơn 0.
                            </p>
                        </SectionCard>
                    ) : (
                        <>
                            <AnswerBox targetRow={derived.targetRow} />
                            <SectionCard>
                                <p className="font-bold text-slate-800 text-sm mb-3">Kết luận ngắn gọn</p>
                                <p className="text-sm text-slate-700 leading-relaxed">
                                    Sau khi biết kết quả là <strong>{eventMeta(eventType).label}</strong>, xác suất để cặp bi đó đến từ
                                    {' '}
                                    <strong>{derived.targetRow.label}</strong> là
                                    {' '}
                                    <strong className="text-emerald-700">{fracToText(derived.targetRow.posterior)}</strong>
                                    {' '}
                                    hay xấp xỉ <strong className="text-emerald-700">{fracToDecimal(derived.targetRow.posterior, 4)}</strong>.
                                </p>
                            </SectionCard>
                        </>
                    )}
                </div>
            </div>

            {!isDegenerate && (
                <>
                    <BranchTable rows={derived.rows} totalEvent={derived.totalEvent} />
                    <div className="grid grid-cols-1 xl:grid-cols-2 gap-5">
                        <BayesWalkthrough
                            rows={derived.rows}
                            totalEvent={derived.totalEvent}
                            targetRow={derived.targetRow}
                            eventType={eventType}
                        />
                        <IntuitionPanel rows={derived.rows} targetRow={derived.targetRow} eventType={eventType} />
                    </div>
                </>
            )}
        </div>
    )
}