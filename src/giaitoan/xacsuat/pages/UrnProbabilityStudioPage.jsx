import React, { useEffect, useMemo, useState } from 'react'
import { BlockMath, InlineMath } from 'react-katex'
import 'katex/dist/katex.min.css'

const TAB_META = [
    { id: 'bayes', label: 'Chọn hộp rồi bốc bi', short: 'Bayes', color: 'emerald' },
    { id: 'transfer', label: 'Chuyển bi giữa 2 hộp', short: 'Chuyển bi', color: 'amber' },
    { id: 'dice', label: 'Xúc xắc phân phối bóng', short: 'Xúc xắc', color: 'sky' },
    { id: 'findx', label: 'Tìm x / tham số', short: 'Tìm x', color: 'rose' },
]

const BALL_EVENT_OPTIONS = [
    { id: 'same', label: '2 bi cùng màu', short: 'cùng màu' },
    { id: 'diff', label: '2 bi khác màu', short: 'khác màu' },
    { id: 'rr', label: '2 bi đỏ', short: '2 đỏ' },
    { id: 'bb', label: '2 bi xanh', short: '2 xanh' },
]

const TRANSFER_COLOR_KEYS = ['R', 'X', 'Y']

const COLOR_META = {
    R: { label: 'Đỏ', short: 'Đ', chip: 'bg-red-100 text-red-700 border-red-200', dot: 'bg-red-500', text: 'text-red-700' },
    X: { label: 'Xanh', short: 'X', chip: 'bg-sky-100 text-sky-700 border-sky-200', dot: 'bg-sky-500', text: 'text-sky-700' },
    Y: { label: 'Vàng', short: 'V', chip: 'bg-amber-100 text-amber-700 border-amber-200', dot: 'bg-amber-400', text: 'text-amber-700' },
}

const BAYES_PRESETS = [
    {
        id: 'dice-two-boxes',
        title: '2 hộp, prior do xúc xắc quyết định',
        note: 'Đây là khung rất quen trong đề: gieo xúc xắc chọn hộp, rồi bốc 2 bi và suy ngược bằng Bayes.',
        eventType: 'diff',
        targetId: 'H2',
        boxes: [
            { id: 'H1', label: 'Hộp A', red: 3, blue: 4, weight: 2 },
            { id: 'H2', label: 'Hộp B', red: 5, blue: 2, weight: 4 },
        ],
    },
    {
        id: 'three-box-same',
        title: '3 hộp, biết 2 bi cùng màu',
        note: 'Mẫu Bayes cổ điển: prior và likelihood kéo hậu nghiệm theo hai hướng khác nhau.',
        eventType: 'same',
        targetId: 'H3',
        boxes: [
            { id: 'H1', label: 'Hộp I', red: 4, blue: 3, weight: 1 },
            { id: 'H2', label: 'Hộp II', red: 5, blue: 4, weight: 2 },
            { id: 'H3', label: 'Hộp III', red: 3, blue: 5, weight: 3 },
        ],
    },
    {
        id: 'wheel-urns',
        title: 'Vòng quay chọn rương',
        note: 'Cùng một công thức Bayes nhưng prior đến từ số ô màu trên vòng quay chứ không phải xúc xắc.',
        eventType: 'same',
        targetId: 'H2',
        boxes: [
            { id: 'H1', label: 'Rương Đồng', red: 7, blue: 3, weight: 5 },
            { id: 'H2', label: 'Rương Bạc', red: 5, blue: 5, weight: 3 },
            { id: 'H3', label: 'Rương Vàng', red: 9, blue: 1, weight: 2 },
        ],
    },
]

const TRANSFER_PRESETS = [
    {
        id: 'yellow-trap',
        title: 'Lượt 1 sang, lượt 2 về, bẫy viên vàng',
        note: 'Đúng mẫu repo: Hộp I có 1 viên vàng duy nhất, điều kiện lượt 2 là “2 bi cùng màu”.',
        move1: 2,
        move2: 2,
        conditionType: 'draw2Same',
        goalType: 'allInitialColors',
        a: { R: 4, X: 2, Y: 1 },
        b: { R: 5, X: 2, Y: 0 },
        target: { R: 4, X: 2, Y: 1 },
    },
    {
        id: 'back-to-start',
        title: 'Chuyển đi rồi chuyển về, hỏi có trở lại ban đầu không',
        note: 'Dùng để dạy học sinh phân biệt “điều kiện đã biết” với “mục tiêu cuối cùng”.',
        move1: 2,
        move2: 2,
        conditionType: 'sizeInitial',
        goalType: 'equalInitial',
        a: { R: 4, X: 2, Y: 1 },
        b: { R: 5, X: 2, Y: 1 },
        target: { R: 4, X: 2, Y: 1 },
    },
    {
        id: 'exact-target',
        title: 'Chuyển bi rồi hỏi đúng cấu hình đích',
        note: 'Biến thành bài “hiện trường cuối cùng” để học sinh quen với việc đọc trạng thái A, B sau từng nhánh.',
        move1: 2,
        move2: 2,
        conditionType: 'sizeInitial',
        goalType: 'exact',
        a: { R: 4, X: 3, Y: 0 },
        b: { R: 5, X: 2, Y: 0 },
        target: { R: 5, X: 2, Y: 0 },
    },
]

const DICE_PRESETS = [
    {
        id: 'a-even-b-gt-c',
        title: 'Biết A chẵn, hỏi B > C',
        note: 'Đúng đúng họ bài trong repo: mỗi lần gieo chọn một quy tắc bỏ bóng vào các hộp.',
        rounds: 2,
        outcomes: [
            { id: 'X1', label: 'KN1', weight: 2, delta: { A: 2, B: 0, C: 0 } },
            { id: 'X2', label: 'KN2', weight: 3, delta: { A: 1, B: 1, C: 0 } },
            { id: 'X3', label: 'KN3', weight: 1, delta: { A: 0, B: 1, C: 1 } },
        ],
        conditionRule: { kind: 'parity', field: 'A', parity: 'even' },
        goalRule: { kind: 'relation', field: 'B', comparator: '>', otherField: 'C' },
    },
    {
        id: 'b-two-a-zero',
        title: 'Biết B = 2, hỏi A = 0',
        note: 'Lớp bài “lọc nhánh bằng điều kiện trên trạng thái cuối”.',
        rounds: 2,
        outcomes: [
            { id: 'X1', label: 'KN1', weight: 3, delta: { A: 1, B: 1, C: 0 } },
            { id: 'X2', label: 'KN2', weight: 2, delta: { A: 0, B: 0, C: 2 } },
            { id: 'X3', label: 'KN3', weight: 1, delta: { A: 0, B: 2, C: 0 } },
        ],
        conditionRule: { kind: 'compare', field: 'B', comparator: '=', value: 2 },
        goalRule: { kind: 'compare', field: 'A', comparator: '=', value: 0 },
    },
    {
        id: 'b-two-a-three',
        title: 'Biết B = 2, hỏi A = 3',
        note: 'Biến thể nhiều bóng hơn mỗi lượt, vẫn cùng một khung đếm nhánh.',
        rounds: 2,
        outcomes: [
            { id: 'X1', label: 'KN1', weight: 1, delta: { A: 3, B: 2, C: 0 } },
            { id: 'X2', label: 'KN2', weight: 3, delta: { A: 0, B: 0, C: 5 } },
            { id: 'X3', label: 'KN3', weight: 2, delta: { A: 2, B: 1, C: 2 } },
        ],
        conditionRule: { kind: 'compare', field: 'B', comparator: '=', value: 2 },
        goalRule: { kind: 'compare', field: 'A', comparator: '=', value: 3 },
    },
    {
        id: 'a-even-a-two',
        title: 'Biết A chẵn, hỏi A = 2',
        note: 'Tab này giúp học sinh thấy rõ điều kiện và mục tiêu có thể cùng nhìn vào một ô nhưng khác nhau hoàn toàn.',
        rounds: 2,
        outcomes: [
            { id: 'X1', label: 'KN1', weight: 3, delta: { A: 2, B: 0, C: 0 } },
            { id: 'X2', label: 'KN2', weight: 2, delta: { A: 1, B: 1, C: 0 } },
            { id: 'X3', label: 'KN3', weight: 1, delta: { A: 0, B: 0, C: 2 } },
        ],
        conditionRule: { kind: 'parity', field: 'A', parity: 'even' },
        goalRule: { kind: 'compare', field: 'A', comparator: '=', value: 2 },
    },
]

const FINDX_PRESETS = [
    {
        id: 'solve-red-count',
        title: 'x là số bi đỏ trong Hộp II',
        note: 'Phù hợp kiểu đề “Tìm x để xác suất hậu nghiệm bằng một giá trị cho trước”.',
        mode: 'redCount',
        totalTargetBalls: 7,
        eventType: 'same',
        targetFraction: { n: 1, d: 2 },
        boxes: {
            H1: { red: 4, blue: 2, weight: 1 },
            H3: { red: 2, blue: 5, weight: 3 },
            H2: { weight: 2, red: 0, blue: 0 },
        },
    },
    {
        id: 'solve-weight',
        title: 'x là trọng số chọn Hộp II',
        note: 'Tốt để dạy vai trò của “tỷ lệ nền”: thay prior nhưng giữ nguyên cấu trúc bốc bi.',
        mode: 'weight',
        totalTargetBalls: 7,
        eventType: 'diff',
        targetFraction: { n: 3, d: 5 },
        boxes: {
            H1: { red: 3, blue: 4, weight: 2 },
            H3: { red: 3, blue: 3, weight: 3 },
            H2: { weight: 1, red: 5, blue: 2 },
        },
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

function fracEq(a, b) {
    return a.n * b.d === b.n * a.d
}

function fracValue(value) {
    return value.n / value.d
}

function fracAbsDiff(a, b) {
    return Math.abs(fracValue(a) - fracValue(b))
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

function clampInt(value, min = 0, max = 20) {
    const next = Number.isFinite(value) ? value : min
    return Math.max(min, Math.min(max, Math.round(next)))
}

function comb(n, k) {
    if (k < 0 || k > n) return 0
    if (k === 0 || k === n) return 1
    const m = Math.min(k, n - k)
    let result = 1
    for (let i = 1; i <= m; i += 1) {
        result = (result * (n - m + i)) / i
    }
    return Math.round(result)
}

function comb2(n) {
    return comb(n, 2)
}

function sumObjectValues(obj) {
    return Object.values(obj).reduce((sum, value) => sum + value, 0)
}

function normalizeTransferCounts(counts) {
    return {
        R: clampInt(counts.R ?? 0, 0, 12),
        X: clampInt(counts.X ?? 0, 0, 12),
        Y: clampInt(counts.Y ?? 0, 0, 12),
    }
}

function addCountMaps(a, b) {
    const next = {}
    TRANSFER_COLOR_KEYS.forEach(key => {
        next[key] = (a[key] ?? 0) + (b[key] ?? 0)
    })
    return next
}

function subCountMaps(a, b) {
    const next = {}
    TRANSFER_COLOR_KEYS.forEach(key => {
        next[key] = (a[key] ?? 0) - (b[key] ?? 0)
    })
    return next
}

function countsEqual(a, b) {
    return TRANSFER_COLOR_KEYS.every(key => (a[key] ?? 0) === (b[key] ?? 0))
}

function formatTransferCounts(counts) {
    return TRANSFER_COLOR_KEYS
        .filter(key => (counts[key] ?? 0) > 0)
        .map(key => `${counts[key]}${COLOR_META[key].short}`)
        .join(', ') || '0'
}

function formatDrawLabel(draw) {
    return TRANSFER_COLOR_KEYS
        .filter(key => (draw[key] ?? 0) > 0)
        .map(key => `${draw[key]}${COLOR_META[key].short}`)
        .join(' + ') || '0'
}

function eventMeta(eventType) {
    return BALL_EVENT_OPTIONS.find(option => option.id === eventType) || BALL_EVENT_OPTIONS[0]
}

function eventWaysForTwoColors(red, blue, eventType) {
    if (eventType === 'same') return comb2(red) + comb2(blue)
    if (eventType === 'diff') return red * blue
    if (eventType === 'rr') return comb2(red)
    if (eventType === 'bb') return comb2(blue)
    return 0
}

function likelihoodFormulaLatex(red, blue, eventType) {
    const total = red + blue
    const denom = `C_{${total}}^2`
    let numer = '0'
    if (eventType === 'same') {
        const parts = []
        if (red >= 2) parts.push(`C_{${red}}^2`)
        if (blue >= 2) parts.push(`C_{${blue}}^2`)
        numer = parts.length ? parts.join(' + ') : '0'
    } else if (eventType === 'diff') {
        numer = `C_{${red}}^1 \\cdot C_{${blue}}^1`
    } else if (eventType === 'rr') {
        numer = red >= 2 ? `C_{${red}}^2` : '0'
    } else if (eventType === 'bb') {
        numer = blue >= 2 ? `C_{${blue}}^2` : '0'
    }
    return `\\dfrac{${numer}}{${denom}}`
}

function transferDrawWaysOnlyLatex(draw, boxCounts) {
    const parts = []
    TRANSFER_COLOR_KEYS.forEach(key => {
        const count = draw[key] ?? 0
        const initial = boxCounts[key] ?? 0
        if (count > 0) {
            parts.push(`C_{${initial}}^{${count}}`)
        }
    })
    return parts.length > 0 ? parts.join(' \\cdot ') : '0'
}

function transferDrawProbLatex(draw, boxCounts, drawSize) {
    const total = sumObjectValues(boxCounts)
    const numer = transferDrawWaysOnlyLatex(draw, boxCounts)
    return `\\dfrac{${numer}}{C_{${total}}^{${drawSize}}}`
}

function evaluateBallEvent(red, blue, eventType) {
    const totalWays = comb(red + blue, 2)
    const favorable = eventWaysForTwoColors(red, blue, eventType)
    return {
        totalWays,
        favorable,
        cond: totalWays > 0 ? frac(favorable, totalWays) : frac(0, 1),
    }
}

function enumerateTransferDraws(counts, drawSize) {
    const safe = normalizeTransferCounts(counts)
    const total = sumObjectValues(safe)
    if (drawSize < 0 || drawSize > total) return []

    const results = []

    function dfs(index, remaining, current) {
        if (index === TRANSFER_COLOR_KEYS.length - 1) {
            const key = TRANSFER_COLOR_KEYS[index]
            if (remaining <= safe[key]) {
                const draw = { ...current, [key]: remaining }
                let ways = 1
                TRANSFER_COLOR_KEYS.forEach(color => {
                    ways *= comb(safe[color], draw[color] ?? 0)
                })
                results.push({ draw, ways, prob: frac(ways, comb(total, drawSize)) })
            }
            return
        }

        const key = TRANSFER_COLOR_KEYS[index]
        const limit = Math.min(remaining, safe[key])
        for (let take = 0; take <= limit; take += 1) {
            dfs(index + 1, remaining - take, { ...current, [key]: take })
        }
    }

    dfs(0, drawSize, { R: 0, X: 0, Y: 0 })
    return results
}

function transferConditionText(type, move2) {
    if (type === 'draw2Same') return `Lượt 2 lấy về ${move2} bi cùng màu`
    if (type === 'sizeInitial') return 'Tổng số bi ở hộp A cuối cùng bằng ban đầu'
    return 'Không điều kiện thêm'
}

function transferGoalText(type, target) {
    if (type === 'allInitialColors') return 'Hộp A vẫn còn đủ mọi màu ban đầu'
    if (type === 'equalInitial') return 'Hộp A trở lại đúng thành phần ban đầu'
    if (type === 'oneYellow') return 'Hộp A còn đúng 1 bi vàng'
    if (type === 'redMoreBlue') return 'Số bi đỏ trong A vẫn nhiều hơn số bi xanh'
    return `Hộp A đạt đúng cấu hình ${formatTransferCounts(target)}`
}

function transferConditionPass(type, branch, initialA, move2) {
    if (type === 'none') return true
    if (type === 'sizeInitial') return sumObjectValues(branch.finalA) === sumObjectValues(initialA)
    if (type === 'draw2Same') return TRANSFER_COLOR_KEYS.some(key => (branch.draw2[key] ?? 0) === move2)
    return true
}

function transferGoalPass(type, branch, initialA, target) {
    if (type === 'allInitialColors') {
        return TRANSFER_COLOR_KEYS
            .filter(key => (initialA[key] ?? 0) > 0)
            .every(key => (branch.finalA[key] ?? 0) > 0)
    }
    if (type === 'equalInitial') return countsEqual(branch.finalA, initialA)
    if (type === 'oneYellow') return (branch.finalA.Y ?? 0) === 1
    if (type === 'redMoreBlue') return (branch.finalA.R ?? 0) > (branch.finalA.X ?? 0)
    return countsEqual(branch.finalA, target)
}

function compareValues(left, comparator, right) {
    if (comparator === '=') return left === right
    if (comparator === '>') return left > right
    if (comparator === '>=') return left >= right
    if (comparator === '<') return left < right
    if (comparator === '<=') return left <= right
    return false
}

function ruleText(rule) {
    if (rule.kind === 'parity') return `${rule.field} là số ${rule.parity === 'even' ? 'chẵn' : 'lẻ'}`
    if (rule.kind === 'compare') return `${rule.field} ${rule.comparator} ${rule.value}`
    return `${rule.field} ${rule.comparator} ${rule.otherField}`
}

function evaluateStateRule(rule, state) {
    if (rule.kind === 'parity') return (state[rule.field] % 2 === 0) === (rule.parity === 'even')
    if (rule.kind === 'compare') return compareValues(state[rule.field], rule.comparator, rule.value)
    return compareValues(state[rule.field], rule.comparator, state[rule.otherField])
}

function SectionCard({ children, className = '' }) {
    return <div className={`bg-white rounded-2xl border border-slate-200 shadow-sm p-5 ${className}`}>{children}</div>
}

function UrnVisualizer({ label, red = 0, blue = 0, yellow = 0, weight = null, isActive = false }) {
    const balls = []
    for (let i = 0; i < red; i += 1) {
        balls.push({ id: `r-${i}`, color: 'bg-gradient-to-br from-red-400 to-red-600 shadow-[inset_1px_1px_2px_rgba(255,255,255,0.4)] border-red-700/20' })
    }
    for (let i = 0; i < blue; i += 1) {
        balls.push({ id: `b-${i}`, color: 'bg-gradient-to-br from-sky-400 to-sky-600 shadow-[inset_1px_1px_2px_rgba(255,255,255,0.4)] border-sky-700/20' })
    }
    for (let i = 0; i < yellow; i += 1) {
        balls.push({ id: `y-${i}`, color: 'bg-gradient-to-br from-amber-300 to-amber-500 shadow-[inset_1px_1px_2px_rgba(255,255,255,0.4)] border-amber-600/20' })
    }

    return (
        <div className={`flex flex-col items-center p-3 rounded-2xl border transition-all duration-300 ${isActive ? 'border-emerald-500 bg-emerald-50/40 shadow-sm scale-[1.02]' : 'border-slate-200 bg-white hover:border-slate-300'}`}>
            <div className="text-sm font-bold text-slate-800 mb-0.5">{label}</div>
            {weight !== null && (
                <div className="text-xs text-slate-500 mb-2">Trọng số chọn: <span className="font-bold text-slate-700">{weight}</span></div>
            )}
            
            {/* Glass-morphism Jar/Urn container */}
            <div className="relative w-full max-w-[130px] h-[110px] border-4 border-slate-300 border-t-0 rounded-b-[32px] bg-slate-50/30 p-2 shadow-inner flex flex-wrap gap-1 items-end justify-center overflow-y-auto">
                <div className="absolute inset-x-0 bottom-0 h-3 bg-slate-200/30 rounded-b-[28px] pointer-events-none" />
                
                {balls.length === 0 ? (
                    <span className="text-xs text-slate-400 italic mb-4">Hộp rỗng</span>
                ) : (
                    <div className="flex flex-wrap gap-1 justify-center items-end max-h-[85px] w-full pb-1 z-10">
                        {balls.map((ball) => (
                            <div 
                                key={ball.id} 
                                className={`w-3.5 h-3.5 rounded-full ${ball.color} border border-black/10 transition-transform duration-200 hover:scale-125`}
                            />
                        ))}
                    </div>
                )}
            </div>
            
            <div className="mt-2.5 flex flex-wrap gap-1 justify-center text-[10px] font-bold">
                {red > 0 && <span className="px-1.5 py-0.5 rounded bg-red-50 text-red-700 border border-red-100">{red} đỏ</span>}
                {blue > 0 && <span className="px-1.5 py-0.5 rounded bg-sky-50 text-sky-700 border border-sky-100">{blue} xanh</span>}
                {yellow > 0 && <span className="px-1.5 py-0.5 rounded bg-amber-50 text-amber-700 border border-amber-100">{yellow} vàng</span>}
            </div>
        </div>
    )
}

function OutcomeVisualCard({ label, weight, delta, prior }) {
    return (
        <div className="flex flex-col p-4 rounded-xl border border-slate-200 bg-white shadow-sm hover:shadow transition-all">
            <div className="flex items-center justify-between gap-3 mb-2.5">
                <span className="font-bold text-slate-800 text-sm bg-slate-100 px-2.5 py-1 rounded">{label}</span>
                <span className="font-mono text-xs font-bold text-sky-700 bg-sky-50 px-2.5 py-1 rounded-full border border-sky-100">
                    P = <InlineMath math={fracToLatex(prior)} />
                </span>
            </div>
            <div className="text-xs text-slate-500 mb-3">Trọng số khả năng: <span className="font-bold text-slate-700">{weight}</span></div>
            
            <div className="space-y-1.5 bg-slate-50 p-2.5 rounded-lg border border-slate-100">
                <div className="text-[10px] uppercase font-bold text-slate-400 mb-1">Số bóng thêm vào:</div>
                <div className="flex gap-2 justify-between text-xs font-semibold">
                    <div className="flex flex-col items-center bg-red-50 text-red-700 px-1.5 py-1 rounded border border-red-100/50 w-full">
                        <span className="text-[9px] text-red-500/70 font-normal">Hộp A</span>
                        <span>+{delta.A}</span>
                    </div>
                    <div className="flex flex-col items-center bg-sky-50 text-sky-700 px-1.5 py-1 rounded border border-sky-100/50 w-full">
                        <span className="text-[9px] text-sky-500/70 font-normal">Hộp B</span>
                        <span>+{delta.B}</span>
                    </div>
                    <div className="flex flex-col items-center bg-amber-50 text-amber-700 px-1.5 py-1 rounded border border-amber-100/50 w-full">
                        <span className="text-[9px] text-amber-500/70 font-normal">Hộp C</span>
                        <span>+{delta.C}</span>
                    </div>
                </div>
            </div>
        </div>
    )
}

function BayesTreeVisualizer({ rows, eventType, targetId }) {
    const width = 640
    const height = 280
    const rootX = 40
    const rootY = height / 2
    const numBoxes = rows.length
    const boxSpacing = 80
    const startY = rootY - ((numBoxes - 1) * boxSpacing) / 2
    
    return (
        <div className="overflow-x-auto rounded-xl border border-slate-200 bg-slate-50 p-4 flex justify-center shadow-inner">
            <svg width={width} height={height} className="overflow-visible select-none">
                <defs>
                    <marker id="arrow" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="5" markerHeight="5" orient="auto-start-reverse">
                        <path d="M 0 2 L 8 5 L 0 8 z" fill="#94a3b8" />
                    </marker>
                    <marker id="arrow-active" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="5" markerHeight="5" orient="auto-start-reverse">
                        <path d="M 0 2 L 8 5 L 0 8 z" fill="#10b981" />
                    </marker>
                </defs>

                {/* Root node */}
                <circle cx={rootX} cy={rootY} r={6} fill="#475569" />
                <text x={rootX - 10} y={rootY + 4} textAnchor="end" className="text-[11px] font-bold fill-slate-500">Bắt đầu</text>

                {rows.map((row, idx) => {
                    const boxX = 200
                    const boxY = startY + idx * boxSpacing
                    const isActiveBox = row.id === targetId
                    
                    const pathColor = isActiveBox ? 'stroke-emerald-500' : 'stroke-slate-300'
                    const pathWidth = isActiveBox ? '2.5' : '1.5'
                    
                    const midX1 = (rootX + boxX) / 2
                    const midY1 = (rootY + boxY) / 2
                    
                    const bX = 430
                    const bY_success = boxY - 20
                    const bY_fail = boxY + 20
                    
                    const isFavorable = row.favorable > 0
                    const successPathColor = isActiveBox ? 'stroke-emerald-500' : isFavorable ? 'stroke-sky-500' : 'stroke-slate-300'
                    const successPathWidth = isActiveBox ? '2.5' : isFavorable ? '1.8' : '1.5'
                    
                    const compCond = frac(row.cond.d - row.cond.n, row.cond.d)

                    return (
                        <g key={row.id}>
                            {/* Path: Root -> Box i */}
                            <path 
                                d={`M ${rootX} ${rootY} Q ${midX1} ${midY1 - 10} ${boxX - 55} ${boxY}`} 
                                fill="none" 
                                className={pathColor} 
                                strokeWidth={pathWidth}
                                markerEnd={isActiveBox ? "url(#arrow-active)" : "url(#arrow)"}
                            />
                            
                            {/* Prior Label */}
                            <g transform={`translate(${midX1 - 10}, ${midY1 - 8})`}>
                                <rect x={-15} y={-8} width={30} height={15} rx={3} fill="#ffffff" stroke="#cbd5e1" strokeWidth={0.5} />
                                <text textAnchor="middle" y={3} className="text-[9px] font-bold fill-slate-700">{fracToText(row.prior)}</text>
                            </g>

                            {/* Urn/Box Node */}
                            <g transform={`translate(${boxX}, ${boxY})`}>
                                <rect x={-55} y={-20} width={110} height={40} rx={8} fill={isActiveBox ? "#ecfdf5" : "#ffffff"} stroke={isActiveBox ? "#10b981" : "#cbd5e1"} strokeWidth={isActiveBox ? 2 : 1} className="shadow-sm" />
                                <text textAnchor="middle" y={-3} className={`text-[11px] font-bold ${isActiveBox ? "fill-emerald-800" : "fill-slate-800"}`}>{row.label}</text>
                                <text textAnchor="middle" y={11} className="text-[9px] fill-slate-500 font-semibold">{row.red} đỏ, {row.blue} xanh</text>
                            </g>

                            {/* Path: Box -> Success (B) */}
                            <path 
                                d={`M ${boxX + 55} ${boxY} L ${bX} ${bY_success}`} 
                                fill="none" 
                                className={successPathColor} 
                                strokeWidth={successPathWidth}
                            />
                            {/* Likelihood Label for Success */}
                            <g transform={`translate(${(boxX + 55 + bX) / 2}, ${(boxY + bY_success) / 2 - 8})`}>
                                <text textAnchor="middle" className="text-[9px] font-bold fill-sky-700">{fracToText(row.cond)}</text>
                            </g>
                            <text x={bX + 10} y={bY_success + 3} className={`text-[11px] font-semibold ${isActiveBox ? "fill-emerald-800" : "fill-slate-800"}`}>Biến cố B ({eventMeta(eventType).short})</text>
                            <circle cx={bX} cy={bY_success} r={4} fill={isActiveBox ? "#10b981" : isFavorable ? "#0284c7" : "#94a3b8"} />
                            <text x={bX + 115} y={bY_success + 3} className="text-[10px] font-mono fill-violet-700 font-bold">P = {fracToText(row.joint)}</text>

                            {/* Path: Box -> Fail (not B) */}
                            <path 
                                d={`M ${boxX + 55} ${boxY} L ${bX} ${bY_fail}`} 
                                fill="none" 
                                className="stroke-slate-300 stroke-dasharray-[3,3]" 
                                strokeWidth="1"
                            />
                            {/* Likelihood Label for Fail */}
                            <g transform={`translate(${(boxX + 55 + bX) / 2}, ${(boxY + bY_fail) / 2 + 10})`}>
                                <text textAnchor="middle" className="text-[8px] fill-slate-400">{fracToText(compCond)}</text>
                            </g>
                            <text x={bX + 10} y={bY_fail + 3} className="text-[11px] text-slate-400">Không xảy ra B</text>
                            <circle cx={bX} cy={bY_fail} r={3.5} fill="#cbd5e1" />
                        </g>
                    )
                })}
            </svg>
        </div>
    )
}

function TransferTreeVisualizer({ branches, boxA, move1, move2 }) {
    const width = 760
    const height = 460
    
    const l1Groups = {}
    branches.forEach(b => {
        if (!l1Groups[b.draw1Label]) {
            l1Groups[b.draw1Label] = {
                label: b.draw1Label,
                draw: b.draw1,
                prob: b.draw1Prob,
                branches: []
            }
        }
        l1Groups[b.draw1Label].branches.push(b)
    })
    
    const l1Keys = Object.keys(l1Groups)
    
    const leafSpacing = 30
    const startY = 35
    
    const rootX = 40
    const rootY = height / 2
    const l1X = 240
    const leafX = 510
    
    let leafIndex = 0
    const leafCoords = []
    const l1Coords = {}
    
    l1Keys.forEach((key) => {
        const group = l1Groups[key]
        const groupFirstLeafIdx = leafIndex
        group.branches.forEach((b) => {
            const y = startY + leafIndex * leafSpacing
            leafCoords.push({ branch: b, y, index: leafIndex })
            leafIndex += 1
        })
        const groupLastLeafIdx = leafIndex - 1
        const avgY = (startY + groupFirstLeafIdx * leafSpacing + startY + groupLastLeafIdx * leafSpacing) / 2
        l1Coords[key] = avgY
    })
    
    return (
        <div className="overflow-x-auto rounded-xl border border-slate-200 bg-slate-50 p-4 shadow-inner">
            <svg width={width} height={height} className="overflow-visible select-none">
                <defs>
                    <marker id="arrow" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="5" markerHeight="5" orient="auto-start-reverse">
                        <path d="M 0 2 L 8 5 L 0 8 z" fill="#94a3b8" />
                    </marker>
                </defs>

                {/* Root node */}
                <circle cx={rootX} cy={rootY} r={6} fill="#475569" />
                <text x={rootX - 10} y={rootY + 4} textAnchor="end" className="text-[11px] font-bold fill-slate-500">Hộp A đầu</text>

                {/* Root -> L1 */}
                {l1Keys.map((key) => {
                    const group = l1Groups[key]
                    const y = l1Coords[key]
                    const isFavorableL1 = group.branches.some(b => b.bothPass)
                    const isConditionL1 = group.branches.some(b => b.conditionPass)
                    
                    const pathColor = isFavorableL1 ? 'stroke-emerald-500' : isConditionL1 ? 'stroke-amber-400' : 'stroke-slate-300'
                    const strokeWidth = isFavorableL1 ? '2.2' : isConditionL1 ? '1.5' : '1'
                    
                    return (
                        <g key={key}>
                            <path 
                                d={`M ${rootX} ${rootY} Q ${(rootX + l1X - 92)/2} ${(rootY + y)/2 - 10} ${l1X - 92} ${y}`} 
                                fill="none" 
                                className={pathColor} 
                                strokeWidth={strokeWidth}
                                markerEnd="url(#arrow)"
                            />
                            <g transform={`translate(${(rootX + l1X - 92)/2}, ${(rootY + y)/2 - 6})`}>
                                <rect x={-14} y={-7} width={28} height={13} rx={2} fill="#ffffff" stroke="#cbd5e1" strokeWidth={0.5} />
                                <text textAnchor="middle" y={2.5} className="text-[8px] font-bold fill-slate-700">{fracToText(group.prob)}</text>
                            </g>
                        </g>
                    )
                })}

                {/* L1 Nodes */}
                {l1Keys.map((key) => {
                    const group = l1Groups[key]
                    const y = l1Coords[key]
                    const isFavorableL1 = group.branches.some(b => b.bothPass)
                    const isConditionL1 = group.branches.some(b => b.conditionPass)
                    
                    return (
                        <g key={key} transform={`translate(${l1X - 50}, ${y})`}>
                            <rect x={-42} y={-13} width={84} height={26} rx={5} fill={isFavorableL1 ? "#ecfdf5" : isConditionL1 ? "#fffbeb" : "#ffffff"} stroke={isFavorableL1 ? "#10b981" : isConditionL1 ? "#f59e0b" : "#cbd5e1"} strokeWidth={isFavorableL1 ? 2 : 1} />
                            <text textAnchor="middle" y={4} className="text-[10px] font-bold fill-slate-800">{key}</text>
                        </g>
                    )
                })}

                {/* L1 -> Leaves */}
                {leafCoords.map(({ branch, y }) => {
                    const parentY = l1Coords[branch.draw1Label]
                    const pathColor = branch.bothPass ? 'stroke-emerald-500' : branch.conditionPass ? 'stroke-amber-400' : 'stroke-slate-200'
                    const strokeWidth = branch.bothPass ? '2.2' : branch.conditionPass ? '1.5' : '1'
                    
                    return (
                        <g key={`${branch.draw1Label}-${branch.draw2Label}`}>
                            <path 
                                d={`M ${l1X - 8} ${parentY} Q ${(l1X - 8 + leafX - 60)/2} ${(parentY + y)/2} ${leafX - 60} ${y}`} 
                                fill="none" 
                                className={pathColor} 
                                strokeWidth={strokeWidth}
                            />
                            <g transform={`translate(${(l1X - 8 + leafX - 60)/2}, ${(parentY + y)/2 - 5})`}>
                                <text textAnchor="middle" className="text-[8px] font-bold fill-slate-500">{fracToText(branch.draw2Prob)}</text>
                            </g>
                        </g>
                    )
                })}

                {/* Leaf Nodes */}
                {leafCoords.map(({ branch, y }) => {
                    const nodeColor = branch.bothPass ? 'fill-emerald-500 stroke-emerald-600' : branch.conditionPass ? 'fill-amber-400 stroke-amber-500' : 'fill-slate-300 stroke-slate-400'
                    
                    return (
                        <g key={`${branch.draw1Label}-${branch.draw2Label}-node`} transform={`translate(${leafX - 60}, ${y})`}>
                            <circle cx={0} cy={0} r={3.5} className={nodeColor} strokeWidth={1} />
                            <text x={8} y={3} className="text-[10px] fill-slate-700 font-semibold">➔ {branch.draw2Label}</text>
                            <text x={95} y={3} className="text-[9px] fill-slate-400">A: {formatTransferCounts(branch.finalA)}</text>
                            <text x={195} y={3} className="text-[10px] font-mono fill-violet-700 font-bold">P = {fracToText(branch.prob)}</text>
                            
                            {branch.bothPass ? (
                                <rect x={260} y={-7} width={45} height={13} rx={2} fill="#ecfdf5" stroke="#10b981" strokeWidth={0.5} />
                            ) : branch.conditionPass ? (
                                <rect x={260} y={-7} width={45} height={13} rx={2} fill="#fffbeb" stroke="#f59e0b" strokeWidth={0.5} />
                            ) : null}
                            {branch.bothPass ? (
                                <text x={282.5} y={2.5} textAnchor="middle" className="text-[8px] font-bold fill-emerald-700">Đạt cả hai</text>
                            ) : branch.conditionPass ? (
                                <text x={282.5} y={2.5} textAnchor="middle" className="text-[8px] font-bold fill-amber-700">Điều kiện</text>
                            ) : null}
                        </g>
                    )
                })}
            </svg>
        </div>
    )
}

function DiceTreeVisualizer({ outcomes, branches }) {
    const width = 720
    const height = 360
    
    const rootX = 40
    const rootY = height / 2
    const l1X = 220
    const leafX = 460
    
    const l1Spacing = 110
    const leafSpacing = 35
    
    return (
        <div className="overflow-x-auto rounded-xl border border-slate-200 bg-slate-50 p-4 shadow-inner">
            <svg width={width} height={height} className="overflow-visible select-none">
                <defs>
                    <marker id="arrow" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="5" markerHeight="5" orient="auto-start-reverse">
                        <path d="M 0 2 L 8 5 L 0 8 z" fill="#94a3b8" />
                    </marker>
                </defs>

                {/* Root node */}
                <circle cx={rootX} cy={rootY} r={6} fill="#475569" />
                <text x={rootX - 10} y={rootY + 4} textAnchor="end" className="text-[11px] font-bold fill-slate-500">Bắt đầu</text>

                {/* Layer 1: First roll */}
                {outcomes.map((outcome, idx) => {
                    const y1 = rootY + (idx - 1) * l1Spacing
                    const isFavorableL1 = branches.some(b => b.rowId === outcome.id && b.bothPass)
                    const isConditionL1 = branches.some(b => b.rowId === outcome.id && b.conditionPass)
                    
                    const pathColor = isFavorableL1 ? 'stroke-emerald-500' : isConditionL1 ? 'stroke-sky-400' : 'stroke-slate-300'
                    const strokeWidth = isFavorableL1 ? '2.2' : isConditionL1 ? '1.5' : '1'

                    return (
                        <g key={outcome.id}>
                            <path 
                                d={`M ${rootX} ${rootY} L ${l1X - 85} ${y1}`} 
                                fill="none" 
                                className={pathColor} 
                                strokeWidth={strokeWidth}
                                markerEnd="url(#arrow)"
                            />
                            <g transform={`translate(${(rootX + l1X - 85)/2}, ${(rootY + y1)/2 - 5})`}>
                                <rect x={-14} y={-7} width={28} height={13} rx={2} fill="#ffffff" stroke="#cbd5e1" strokeWidth={0.5} />
                                <text textAnchor="middle" y={2.5} className="text-[8px] font-bold fill-slate-700">{fracToText(outcome.prior)}</text>
                            </g>

                            <g transform={`translate(${l1X - 45}, ${y1})`}>
                                <rect x={-40} y={-13} width={80} height={26} rx={5} fill={isFavorableL1 ? "#ecfdf5" : isConditionL1 ? "#f0f9ff" : "#ffffff"} stroke={isFavorableL1 ? "#10b981" : isConditionL1 ? "#0284c7" : "#cbd5e1"} strokeWidth={isFavorableL1 ? 2 : 1} />
                                <text textAnchor="middle" y={3} className="text-[10px] font-bold fill-slate-800">{outcome.label}</text>
                            </g>
                        </g>
                    )
                })}

                {/* Layer 2: Second roll */}
                {branches.map((branch, idx) => {
                    const firstIdx = outcomes.findIndex(o => o.id === branch.rowId)
                    const parentY = rootY + (firstIdx - 1) * l1Spacing
                    const leafY = 28 + idx * leafSpacing
                    
                    const pathColor = branch.bothPass ? 'stroke-emerald-500' : branch.conditionPass ? 'stroke-sky-400' : 'stroke-slate-200'
                    const strokeWidth = branch.bothPass ? '2.2' : branch.conditionPass ? '1.5' : '1'
                    const nodeColor = branch.bothPass ? 'fill-emerald-500 stroke-emerald-600' : branch.conditionPass ? 'fill-sky-400 stroke-sky-500' : 'fill-slate-300 stroke-slate-400'

                    return (
                        <g key={idx}>
                            <path 
                                d={`M ${l1X - 5} ${parentY} L ${leafX - 70} ${leafY}`} 
                                fill="none" 
                                className={pathColor} 
                                strokeWidth={strokeWidth}
                            />
                            <g transform={`translate(${(l1X - 5 + leafX - 70)/2}, ${(parentY + leafY)/2 - 5})`}>
                                <text textAnchor="middle" className="text-[8px] fill-slate-400">{fracToText(branch.second.prior)}</text>
                            </g>

                            <g transform={`translate(${leafX - 70}, ${leafY})`}>
                                <circle cx={0} cy={0} r={3.5} className={nodeColor} strokeWidth={1} />
                                <text x={8} y={3} className="text-[10px] fill-slate-700 font-semibold">➔ {branch.second.label}</text>
                                
                                <text x={72} y={3} className="text-[9px] fill-slate-400">(A:{branch.finalState.A}, B:{branch.finalState.B}, C:{branch.finalState.C})</text>
                                <text x={170} y={3} className="text-[10px] font-mono fill-violet-600 font-bold">P = {fracToText(branch.prob)}</text>

                                {branch.bothPass ? (
                                    <rect x={230} y={-7} width={45} height={13} rx={2} fill="#ecfdf5" stroke="#10b981" strokeWidth={0.5} />
                                ) : branch.conditionPass ? (
                                    <rect x={230} y={-7} width={45} height={13} rx={2} fill="#f0f9ff" stroke="#0284c7" strokeWidth={0.5} />
                                ) : null}
                                {branch.bothPass ? (
                                    <text x={252.5} y={2.5} textAnchor="middle" className="text-[8px] font-bold fill-emerald-700">Đạt cả hai</text>
                                ) : branch.conditionPass ? (
                                    <text x={252.5} y={2.5} textAnchor="middle" className="text-[8px] font-bold fill-sky-700">Điều kiện</text>
                                ) : null}
                            </g>
                        </g>
                    )
                })}
            </svg>
        </div>
    )
}

function StepBadge({ n, className = '' }) {
    return (
        <span className={`inline-flex items-center justify-center w-5 h-5 rounded-full bg-slate-700 text-white text-xs font-bold shrink-0 ${className}`}>{n}</span>
    )
}


function TinyStat({ label, value, accent = 'text-slate-800' }) {
    return (
        <div className="rounded-xl border border-slate-200 bg-slate-50 px-4 py-3">
            <div className="text-xs uppercase tracking-wide text-slate-400 mb-1">{label}</div>
            <div className={`font-black text-lg ${accent}`}>{value}</div>
        </div>
    )
}

function HeaderHero({ activeTab, onSelect }) {
    const activeMeta = TAB_META.find(tab => tab.id === activeTab) || TAB_META[0]
    return (
        <SectionCard className="bg-slate-900 border-slate-900 text-white overflow-hidden relative">
            <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_right,rgba(16,185,129,0.18),transparent_30%),radial-gradient(circle_at_bottom_left,rgba(56,189,248,0.18),transparent_28%)]" />
            <div className="relative space-y-4">
                <div>
                    <p className="text-xs uppercase tracking-[0.22em] text-white/55 mb-2">Xác suất điều kiện theo họ bài</p>
                    <h1 className="text-3xl font-black tracking-tight">Studio Bốc Bi, Chuyển Bi Và Xúc Xắc</h1>
                    <p className="text-sm text-white/70 max-w-4xl mt-2 leading-relaxed">
                        Thay vì làm từng đề rời rạc, page này gom các họ bài lặp nhiều nhất trên repo thành 4 tab.
                        Mỗi tab giữ đúng khung sư phạm: phân tích không gian mẫu, bóc nhánh, cộng xác suất toàn phần,
                        rồi mới suy ra điều kiện hoặc tìm tham số.
                    </p>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-4 gap-3">
                    {TAB_META.map(tab => {
                        const isActive = tab.id === activeTab
                        return (
                            <button
                                key={tab.id}
                                type="button"
                                onClick={() => onSelect(tab.id)}
                                className={`rounded-2xl border text-left p-4 transition-colors ${isActive ? 'bg-white text-slate-900 border-white shadow-lg' : 'bg-white/5 text-white border-white/10 hover:bg-white/10'}`}
                            >
                                <div className="text-xs uppercase tracking-wide opacity-70 mb-1">{tab.short}</div>
                                <div className="font-bold leading-snug">{tab.label}</div>
                            </button>
                        )
                    })}
                </div>

                <div className="rounded-xl border border-white/10 bg-white/5 p-4 text-sm text-white/75">
                    <strong className="text-white">Tab đang mở:</strong> {activeMeta.label}. Nếu cần dạy từ dễ đến khó,
                    nên đi theo thứ tự: Bayes trực tiếp → chuyển bi → xúc xắc phân phối → tìm tham số.
                </div>
            </div>
        </SectionCard>
    )
}

function EventPills({ value, onChange }) {
    return (
        <div className="flex flex-wrap gap-2">
            {BALL_EVENT_OPTIONS.map(option => (
                <button
                    key={option.id}
                    type="button"
                    onClick={() => onChange(option.id)}
                    className={`px-4 py-2 rounded-xl text-sm font-semibold border transition-colors ${option.id === value ? 'bg-slate-900 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'}`}
                >
                    {option.label}
                </button>
            ))}
        </div>
    )
}

function NumberInput({ label, value, onChange, min = 0, max = 20, accent = 'focus:ring-emerald-400' }) {
    return (
        <label className="flex items-center justify-between gap-3 text-sm">
            <span className="text-slate-600 font-medium">{label}</span>
            <input
                type="number"
                min={min}
                max={max}
                value={value}
                onChange={event => onChange(clampInt(parseInt(event.target.value, 10), min, max))}
                className={`w-16 rounded-lg border border-slate-300 px-2.5 py-1.5 text-center font-bold text-slate-800 focus:outline-none focus:ring-2 ${accent}`}
            />
        </label>
    )
}

function BayesBoxEditor({ box, isTarget, onChange, onSetTarget }) {
    return (
        <div className={`rounded-xl border p-4 space-y-3 ${isTarget ? 'border-emerald-400 bg-emerald-50' : 'border-slate-200 bg-slate-50'}`}>
            <div className="flex items-center justify-between gap-3">
                <div>
                    <p className="font-bold text-slate-800 text-sm">{box.label}</p>
                    <p className="text-xs text-slate-500">{box.red} đỏ, {box.blue} xanh</p>
                </div>
                <button
                    type="button"
                    onClick={onSetTarget}
                    className={`px-3 py-1.5 rounded-full text-xs font-bold border ${isTarget ? 'bg-emerald-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-300 hover:border-slate-500'}`}
                >
                    {isTarget ? 'Đang truy ngược' : 'Chọn làm hộp cần tìm'}
                </button>
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                <NumberInput label="Bi đỏ" value={box.red} onChange={value => onChange({ ...box, red: value })} accent="focus:ring-red-400" />
                <NumberInput label="Bi xanh" value={box.blue} onChange={value => onChange({ ...box, blue: value })} accent="focus:ring-sky-400" />
                <NumberInput label="Trọng số chọn" value={box.weight} onChange={value => onChange({ ...box, weight: value })} accent="focus:ring-emerald-400" />
            </div>
        </div>
    )
}

function BayesTab() {
    const [presetId, setPresetId] = useState(BAYES_PRESETS[0].id)
    const preset = useMemo(() => BAYES_PRESETS.find(item => item.id === presetId) || BAYES_PRESETS[0], [presetId])
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
            red: clampInt(box.red, 0, 20),
            blue: clampInt(box.blue, 0, 20),
            weight: clampInt(box.weight, 0, 20),
        }))
        const weightSum = safeBoxes.reduce((sum, box) => sum + box.weight, 0)
        const rows = safeBoxes.map(box => {
            const prior = weightSum > 0 ? frac(box.weight, weightSum) : frac(0, 1)
            const eventData = evaluateBallEvent(box.red, box.blue, eventType)
            const joint = mulFrac(prior, eventData.cond)
            return {
                ...box,
                prior,
                cond: eventData.cond,
                totalWays: eventData.totalWays,
                favorable: eventData.favorable,
                joint,
            }
        })
        const totalEvent = rows.reduce((sum, row) => addFrac(sum, row.joint), frac(0, 1))
        const withPosterior = rows.map(row => ({
            ...row,
            posterior: totalEvent.n === 0 ? frac(0, 1) : divFrac(row.joint, totalEvent),
        }))
        const target = withPosterior.find(row => row.id === targetId) || withPosterior[0]
        return { rows: withPosterior, totalEvent, target, weightSum }
    }, [boxes, eventType, targetId])

    const isDegenerate = derived.weightSum === 0 || derived.totalEvent.n === 0

    return (
        <div className="space-y-5">
            <div className="grid grid-cols-1 xl:grid-cols-[1.15fr_0.85fr] gap-5">
                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Preset Bayes mẫu đề thi</p>
                        <div className="flex flex-wrap gap-2">
                            {BAYES_PRESETS.map(item => (
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
                        <p className="font-bold text-slate-800 text-sm mb-3">Biến cố quan sát đã biết</p>
                        <EventPills value={eventType} onChange={setEventType} />
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Cấu hình từng hộp</p>
                        <div className="space-y-3">
                            {boxes.map(box => (
                                <BayesBoxEditor
                                    key={box.id}
                                    box={box}
                                    isTarget={targetId === box.id}
                                    onChange={next => setBoxes(prev => prev.map(item => item.id === box.id ? next : item))}
                                    onSetTarget={() => setTargetId(box.id)}
                                />
                            ))}
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-4">Trực quan hóa cấu trúc các hộp bi</p>
                        <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                            {derived.rows.map(row => (
                                <UrnVisualizer
                                    key={row.id}
                                    label={`${row.label} ${row.id === targetId ? '(Cần tìm)' : ''}`}
                                    red={row.red}
                                    blue={row.blue}
                                    weight={row.weight}
                                    isActive={row.id === targetId}
                                />
                            ))}
                        </div>
                    </SectionCard>
                </div>

                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Lời giải chuẩn sư phạm (Lý thuyết hệ đầy đủ & Bayes)</p>
                        <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                            <p>
                                Gọi <InlineMath math="A_i" /> là biến cố chọn được hộp thứ <InlineMath math="i" /> (với <InlineMath math="i \in \{1, 2, 3\}" /> tương ứng là các hộp). 
                                Nhóm các biến cố <InlineMath math="\{A_1, A_2, A_3\}" /> lập thành một <strong>hệ đầy đủ</strong> các biến cố.
                            </p>
                            <p>
                                Gọi <InlineMath math="B" /> là biến cố quan sát: <strong>"Lấy được 2 bi {eventMeta(eventType).label}"</strong>.
                            </p>
                            <div className="border-t border-slate-100 pt-3 space-y-2">
                                <p><strong>Bước 1. Xác suất trước (Prior):</strong> Chọn hộp ngẫu nhiên:</p>
                                <div className="pl-4 font-semibold text-emerald-800 flex flex-wrap gap-x-4">
                                    {derived.rows.map((row, idx) => (
                                        <div key={row.id}>
                                            <InlineMath math={`P(A_{${idx+1}}) = ${fracToLatex(row.prior)}`} />
                                        </div>
                                    ))}
                                </div>
                                
                                <p><strong>Bước 2. Xác suất hợp lệ (Likelihood):</strong> Xác suất bốc đúng yêu cầu từ từng hộp:</p>
                                <div className="pl-4 font-semibold text-sky-800 space-y-1">
                                    {derived.rows.map((row, idx) => (
                                        <div key={row.id}>
                                            <InlineMath math={`P(B \\mid A_{${idx+1}}) = ${likelihoodFormulaLatex(row.red, row.blue, eventType)} = ${fracToLatex(row.cond)}`} />
                                        </div>
                                    ))}
                                </div>
                                
                                <p><strong>Bước 3. Xác suất toàn phần:</strong> Tính tổng xác suất xảy ra biến cố <InlineMath math="B" />:</p>
                                <div className="bg-slate-50 border border-slate-200 rounded-xl p-3 my-2 text-center">
                                    <BlockMath math={`P(B) = \\sum_{i=1}^{3} P(A_i)P(B \\mid A_i) = ${fracToLatex(derived.totalEvent)}`} />
                                </div>

                                <p><strong>Bước 4. Xác suất hậu nghiệm Bayes:</strong> Truy ngược xác suất hộp đã chọn khi đã biết <InlineMath math="B" /> xảy ra:</p>
                                <div className="bg-emerald-50 border border-emerald-200 rounded-xl p-3 text-center">
                                    <BlockMath math={`P(A_t \\mid B) = \\dfrac{P(A_t)P(B \\mid A_t)}{P(B)} = \\dfrac{${fracToLatex(derived.target.prior)} \\cdot ${fracToLatex(derived.target.cond)}}{${fracToLatex(derived.totalEvent)}} = ${fracToLatex(derived.target.posterior)}`} />
                                </div>
                            </div>
                        </div>
                        <p className="text-xs text-slate-500 mt-4 border-t border-slate-100 pt-3">Preset hiện tại: <strong>{preset.title}</strong>. {preset.note}</p>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-2">Sơ đồ cây xác suất Bayes</p>
                        <p className="text-xs text-slate-500 mb-3">Nhánh của hộp đang chọn truy ngược được tô viền xanh lá làm nổi bật (Tử số của công thức Bayes).</p>
                        <BayesTreeVisualizer rows={derived.rows} eventType={eventType} targetId={targetId} />
                    </SectionCard>

                    {isDegenerate ? (
                        <SectionCard className="border-red-200 bg-red-50">
                            <p className="font-bold text-red-700 text-sm mb-2">Chưa đủ dữ kiện</p>
                            <p className="text-sm text-red-700">Phải có ít nhất một hộp có trọng số dương và xác suất biến cố quan sát phải lớn hơn 0.</p>
                        </SectionCard>
                    ) : (
                        <>
                            <div className="rounded-2xl border-2 border-emerald-200 bg-emerald-50 p-6 text-emerald-950 shadow-sm">
                                <div className="text-xs uppercase tracking-[0.2em] text-emerald-700/80 font-bold mb-2">Đáp số Bayes</div>
                                <div className="text-4xl font-black leading-none mb-2 text-emerald-900">{fracToDecimal(derived.target.posterior, 4)}</div>
                                <div className="text-sm text-emerald-800 font-semibold flex items-center gap-1">
                                    <span>=</span>
                                    <InlineMath math={fracToLatex(derived.target.posterior)} />
                                    <span>= {fracToPercent(derived.target.posterior, 2)}</span>
                                </div>
                            </div>
                            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                                <TinyStat label="Biến cố" value={eventMeta(eventType).label} accent="text-slate-800" />
                                <TinyStat label="Xác suất P(B)" value={fracToText(derived.totalEvent)} accent="text-amber-700" />
                                <TinyStat label="Hộp cần tìm" value={derived.target.label} accent="text-emerald-700" />
                            </div>
                        </>
                    )}
                </div>
            </div>

            {!isDegenerate && (
                <>
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={1} /> Bảng nhánh Bayes chi tiết</p>
                        <div className="overflow-x-auto rounded-xl border border-slate-200">
                            <table className="w-full min-w-[840px] text-sm border-collapse">
                                <thead>
                                    <tr className="bg-slate-800 text-white text-xs">
                                        <th className="px-3 py-2.5 text-left font-bold">Hộp</th>
                                        <th className="px-3 py-2.5 text-left font-bold">Thành phần bi</th>
                                        <th className="px-3 py-2.5 text-center font-bold"><InlineMath math="P(A_i)" /></th>
                                        <th className="px-3 py-2.5 text-center font-bold">Xác suất bốc bi chi tiết</th>
                                        <th className="px-3 py-2.5 text-center font-bold"><InlineMath math="P(B\mid A_i)" /></th>
                                        <th className="px-3 py-2.5 text-center font-bold"><InlineMath math="P(A_i\cap B)" /></th>
                                        <th className="px-3 py-2.5 text-center font-bold"><InlineMath math="P(A_i\mid B)" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {derived.rows.map((row, index) => (
                                        <tr key={row.id} className={`border-b border-slate-200 ${index % 2 === 0 ? 'bg-white' : 'bg-slate-50'}`}>
                                            <td className="px-3 py-2.5 font-bold text-slate-800">{row.label}</td>
                                            <td className="px-3 py-2.5 text-slate-600">{row.red} đỏ, {row.blue} xanh</td>
                                            <td className="px-3 py-2.5 text-center font-mono"><InlineMath math={fracToLatex(row.prior)} /></td>
                                            <td className="px-3 py-2.5 text-center">
                                                <div className="text-xs"><InlineMath math={likelihoodFormulaLatex(row.red, row.blue, eventType)} /></div>
                                                <div className="text-xs text-slate-500 font-semibold">{row.favorable}/{row.totalWays}</div>
                                            </td>
                                            <td className="px-3 py-2.5 text-center font-mono text-blue-700"><InlineMath math={fracToLatex(row.cond)} /></td>
                                            <td className="px-3 py-2.5 text-center font-mono text-violet-700"><InlineMath math={fracToLatex(row.joint)} /></td>
                                            <td className={`px-3 py-2.5 text-center font-mono font-bold ${row.id === derived.target.id ? 'text-emerald-700' : 'text-slate-600'}`}><InlineMath math={fracToLatex(row.posterior)} /></td>
                                        </tr>
                                    ))}
                                    <tr className="bg-amber-50 border-t-2 border-amber-300">
                                        <td className="px-3 py-2.5 font-bold text-amber-800" colSpan={5}>Tổng xác suất biến cố quan sát <InlineMath math="P(B)" /></td>
                                        <td className="px-3 py-2.5 text-center font-mono font-bold text-amber-800"><InlineMath math={fracToLatex(derived.totalEvent)} /></td>
                                        <td className="px-3 py-2.5 text-center text-slate-400">—</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </SectionCard>

                    <div className="grid grid-cols-1 xl:grid-cols-2 gap-5">
                        <SectionCard>
                            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={2} /> Biểu diễn bằng công thức Toán</p>
                            <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                                <p>Cộng xác suất của tất cả các nhánh để tính xác suất toàn phần <InlineMath math="P(B)" />:</p>
                                <div className="rounded-xl bg-slate-50 border border-slate-200 p-4">
                                    <BlockMath math={`P(B) = \\sum_{i=1}^{3} P(A_i)P(B \\mid A_i) = ${derived.rows.map(row => `${fracToLatex(row.prior)} \\cdot ${fracToLatex(row.cond)}`).join(' + ')} = ${fracToLatex(derived.totalEvent)}`} />
                                </div>
                                <p>Áp dụng công thức Bayes để tính xác suất hậu nghiệm đối với hộp <strong>{derived.target.label}</strong>:</p>
                                <div className="rounded-xl bg-emerald-50 border border-emerald-200 p-4">
                                    <BlockMath math={`P(A_t \\mid B) = \\dfrac{P(A_t)P(B \\mid A_t)}{P(B)} = \\dfrac{${fracToLatex(derived.target.prior)} \\cdot ${fracToLatex(derived.target.cond)}}{${fracToLatex(derived.totalEvent)}} = ${fracToLatex(derived.target.posterior)}`} />
                                </div>
                            </div>
                        </SectionCard>

                        <SectionCard>
                            <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={3} /> Trực giác hậu nghiệm (Tỷ trọng phân phối)</p>
                            <div className="space-y-3.5">
                                {[...derived.rows]
                                    .sort((a, b) => fracValue(b.posterior) - fracValue(a.posterior))
                                    .map(row => (
                                        <div key={row.id} className="space-y-1.5">
                                            <div className="flex items-center justify-between gap-3 text-sm">
                                                <div>
                                                    <span className={`font-bold ${row.id === derived.target.id ? 'text-emerald-700' : 'text-slate-700'}`}>{row.label}</span>
                                                    <span className="text-slate-400 ml-2">khi biết bi bốc ra {eventMeta(eventType).short}</span>
                                                </div>
                                                <span className={`font-mono font-bold ${row.id === derived.target.id ? 'text-emerald-700' : 'text-slate-600'}`}>
                                                    <InlineMath math={fracToLatex(row.posterior)} />
                                                </span>
                                            </div>
                                            <div className="w-full h-3 rounded-full bg-slate-100 overflow-hidden">
                                                <div
                                                    className={`h-full rounded-full ${row.id === derived.target.id ? 'bg-emerald-500' : 'bg-slate-400'}`}
                                                    style={{ width: `${Math.max(0, Math.min(100, fracValue(row.posterior) * 100))}%` }}
                                                />
                                            </div>
                                        </div>
                                    ))}
                            </div>
                        </SectionCard>
                    </div>
                </>
            )}
        </div>
    )
}

function TransferCountEditor({ title, counts, onChange }) {
    return (
        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 space-y-3">
            <div>
                <p className="font-bold text-slate-800 text-sm">{title}</p>
                <p className="text-xs text-slate-500">{formatTransferCounts(counts)}</p>
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                {TRANSFER_COLOR_KEYS.map(key => (
                    <NumberInput
                        key={key}
                        label={COLOR_META[key].label}
                        value={counts[key]}
                        onChange={value => onChange({ ...counts, [key]: value })}
                        accent={key === 'R' ? 'focus:ring-red-400' : key === 'X' ? 'focus:ring-sky-400' : 'focus:ring-amber-400'}
                    />
                ))}
            </div>
        </div>
    )
}

function TransferTab() {
    const [presetId, setPresetId] = useState(TRANSFER_PRESETS[0].id)
    const preset = useMemo(() => TRANSFER_PRESETS.find(item => item.id === presetId) || TRANSFER_PRESETS[0], [presetId])
    const [boxA, setBoxA] = useState(preset.a)
    const [boxB, setBoxB] = useState(preset.b)
    const [move1, setMove1] = useState(preset.move1)
    const [move2, setMove2] = useState(preset.move2)
    const [conditionType, setConditionType] = useState(preset.conditionType)
    const [goalType, setGoalType] = useState(preset.goalType)
    const [target, setTarget] = useState(preset.target)

    useEffect(() => {
        setBoxA(normalizeTransferCounts(preset.a))
        setBoxB(normalizeTransferCounts(preset.b))
        setMove1(preset.move1)
        setMove2(preset.move2)
        setConditionType(preset.conditionType)
        setGoalType(preset.goalType)
        setTarget(normalizeTransferCounts(preset.target))
    }, [preset])

    const derived = useMemo(() => {
        const safeA = normalizeTransferCounts(boxA)
        const safeB = normalizeTransferCounts(boxB)
        const draws1 = enumerateTransferDraws(safeA, move1)
        const firstSummary = draws1.map(item => ({
            ...item,
            label: formatDrawLabel(item.draw),
        }))
        const branches = []

        draws1.forEach(first => {
            const aAfterFirst = subCountMaps(safeA, first.draw)
            const bAfterFirst = addCountMaps(safeB, first.draw)
            const draws2 = enumerateTransferDraws(bAfterFirst, move2)
            draws2.forEach(second => {
                const finalA = addCountMaps(aAfterFirst, second.draw)
                const finalB = subCountMaps(bAfterFirst, second.draw)
                const branchProb = mulFrac(first.prob, second.prob)
                const branch = {
                    draw1: first.draw,
                    draw2: second.draw,
                    draw1Label: formatDrawLabel(first.draw),
                    draw2Label: formatDrawLabel(second.draw),
                    draw1Prob: first.prob,
                    draw2Prob: second.prob,
                    prob: branchProb,
                    aAfterFirst,
                    bAfterFirst,
                    finalA,
                    finalB,
                }
                branch.conditionPass = transferConditionPass(conditionType, branch, safeA, move2)
                branch.goalPass = transferGoalPass(goalType, branch, safeA, target)
                branch.bothPass = branch.conditionPass && branch.goalPass
                branches.push(branch)
            })
        })

        const conditionTotal = branches.reduce((sum, branch) => branch.conditionPass ? addFrac(sum, branch.prob) : sum, frac(0, 1))
        const successTotal = branches.reduce((sum, branch) => branch.bothPass ? addFrac(sum, branch.prob) : sum, frac(0, 1))
        const conditional = conditionTotal.n === 0 ? frac(0, 1) : divFrac(successTotal, conditionTotal)

        return {
            firstSummary,
            branches,
            conditionTotal,
            successTotal,
            conditional,
            safeA,
            safeB,
        }
    }, [boxA, boxB, move1, move2, conditionType, goalType, target])

    const trapColors = TRANSFER_COLOR_KEYS.filter(key => (derived.safeA[key] ?? 0) === 1)

    return (
        <div className="space-y-5">
            <div className="grid grid-cols-1 xl:grid-cols-[1.15fr_0.85fr] gap-5">
                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Preset chuyển bi mẫu</p>
                        <div className="flex flex-wrap gap-2">
                            {TRANSFER_PRESETS.map(item => (
                                <button
                                    key={item.id}
                                    type="button"
                                    onClick={() => setPresetId(item.id)}
                                    className={`px-4 py-2 rounded-xl text-sm font-semibold border transition-colors ${item.id === presetId ? 'bg-amber-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'}`}
                                >
                                    {item.title}
                                </button>
                            ))}
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-4">Trực quan hóa hai hộp bi ban đầu</p>
                        <div className="flex flex-col sm:flex-row justify-center items-center gap-8 bg-slate-50/50 p-4 rounded-2xl border border-slate-100">
                            <UrnVisualizer label="Hộp A ban đầu" red={boxA.R} blue={boxA.X} yellow={boxA.Y} />
                            
                            {/* Directional Flow arrows */}
                            <div className="flex flex-col items-center gap-2">
                                <div className="flex items-center gap-1.5 text-amber-700 font-bold text-xs bg-amber-50 px-3 py-1.5 rounded-full border border-amber-200 shadow-sm">
                                    <span>Lượt 1: Chuyển {move1} bi</span>
                                    <span>➔</span>
                                </div>
                                <div className="h-4 w-0.5 bg-slate-200 sm:hidden" />
                                <div className="flex items-center gap-1.5 text-sky-700 font-bold text-xs bg-sky-50 px-3 py-1.5 rounded-full border border-sky-200 shadow-sm">
                                    <span>➔</span>
                                    <span>Lượt 2: Rút {move2} bi</span>
                                </div>
                            </div>

                            <UrnVisualizer label="Hộp B ban đầu" red={boxB.R} blue={boxB.X} yellow={boxB.Y} />
                        </div>
                    </SectionCard>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                        <TransferCountEditor title="Thành phần Hộp A ban đầu" counts={boxA} onChange={setBoxA} />
                        <TransferCountEditor title="Thành phần Hộp B ban đầu" counts={boxB} onChange={setBoxB} />
                    </div>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Luật chuyển đổi giữa hai hộp</p>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                            <NumberInput label="Lượt 1: chuyển A → B" value={move1} onChange={value => setMove1(value)} min={0} max={4} accent="focus:ring-amber-400" />
                            <NumberInput label="Lượt 2: rút B → A" value={move2} onChange={value => setMove2(value)} min={0} max={4} accent="focus:ring-amber-400" />
                        </div>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <label className="text-sm space-y-1.5">
                                <span className="font-semibold text-slate-700 block">Điều kiện quan sát đã biết</span>
                                <select
                                    value={conditionType}
                                    onChange={event => setConditionType(event.target.value)}
                                    className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-amber-400"
                                >
                                    <option value="draw2Same">Lượt 2 lấy về cùng màu</option>
                                    <option value="sizeInitial">Tổng bi A cuối cùng bằng ban đầu</option>
                                    <option value="none">Không điều kiện thêm</option>
                                </select>
                            </label>
                            <label className="text-sm space-y-1.5">
                                <span className="font-semibold text-slate-700 block">Mục tiêu cần hỏi xác suất</span>
                                <select
                                    value={goalType}
                                    onChange={event => setGoalType(event.target.value)}
                                    className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-amber-400"
                                >
                                    <option value="allInitialColors">A còn đủ mọi màu ban đầu</option>
                                    <option value="equalInitial">A trở lại đúng ban đầu</option>
                                    <option value="oneYellow">A còn đúng 1 vàng</option>
                                    <option value="redMoreBlue">Đỏ trong A vẫn nhiều hơn xanh</option>
                                    <option value="exact">A đúng một cấu hình đích</option>
                                </select>
                            </label>
                        </div>
                        {goalType === 'exact' && (
                            <div className="grid grid-cols-1 md:grid-cols-3 gap-3 mt-4">
                                {TRANSFER_COLOR_KEYS.map(key => (
                                    <NumberInput
                                        key={key}
                                        label={`Đích ${COLOR_META[key].label}`}
                                        value={target[key]}
                                        onChange={value => setTarget(prev => ({ ...prev, [key]: value }))}
                                        accent={key === 'R' ? 'focus:ring-red-400' : key === 'X' ? 'focus:ring-sky-400' : 'focus:ring-amber-400'}
                                    />
                                ))}
                            </div>
                        )}
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-2">Sơ đồ cây chuyển bi hai giai đoạn</p>
                        <p className="text-xs text-slate-500 mb-3">Mô tả đầy đủ quá trình chuyển bi. Các lá được lọc theo điều kiện và kết quả:</p>
                        <div className="flex flex-wrap gap-3 mb-3 text-[11px] font-bold">
                            <span className="flex items-center gap-1"><span className="w-2.5 h-2.5 rounded bg-emerald-500 border border-emerald-600" /> Thỏa cả E và F (Đạt cả hai)</span>
                            <span className="flex items-center gap-1"><span className="w-2.5 h-2.5 rounded bg-amber-400 border border-amber-500" /> Thỏa E nhưng loại F (Điều kiện)</span>
                            <span className="flex items-center gap-1"><span className="w-2.5 h-2.5 rounded bg-slate-300 border border-slate-400" /> Không thỏa E (Loại)</span>
                        </div>
                        <TransferTreeVisualizer branches={derived.branches} boxA={derived.safeA} move1={move1} move2={move2} />
                    </SectionCard>
                </div>

                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Phân tích sư phạm từng bước</p>
                        <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                            <p>
                                Gọi <InlineMath math="E" /> là biến cố điều kiện đã biết: <strong>"{transferConditionText(conditionType, move2)}"</strong>.
                            </p>
                            <p>
                                Gọi <InlineMath math="F" /> là biến cố mục tiêu cần hỏi: <strong>"{transferGoalText(goalType, target)}"</strong>.
                            </p>
                            <p>
                                Ta cần tìm xác suất có điều kiện <InlineMath math="P(F \mid E)" />. Theo định nghĩa xác suất có điều kiện:
                            </p>
                            <div className="bg-slate-50 border border-slate-200 rounded-xl p-3 text-center my-2">
                                <BlockMath math={`P(F \\mid E) = \\dfrac{P(F \\cap E)}{P(E)}`} />
                            </div>
                            <div className="border-t border-slate-100 pt-3 space-y-2 text-xs">
                                <p><strong>Bước 1:</strong> Tính xác suất của từng cách bốc bi ở Lượt 1 từ hộp A chuyển sang hộp B.</p>
                                <p><strong>Bước 2:</strong> Cập nhật trạng thái mới của Hộp B, rồi tính tiếp xác suất bốc bi ở Lượt 2 từ B về lại A.</p>
                                <p><strong>Bước 3:</strong> Xác suất của mỗi nhánh toàn vẹn bằng tích xác suất Lượt 1 và Lượt 2.</p>
                                <p><strong>Bước 4:</strong> Xác định các nhánh thỏa mãn điều kiện <InlineMath math="E" />, và nhánh thỏa mãn cả <InlineMath math="E" /> và <InlineMath math="F" /> để lập tỷ số.</p>
                            </div>
                        </div>
                        <p className="text-xs text-slate-500 mt-4 border-t border-slate-100 pt-3">Preset hiện tại: <strong>{preset.title}</strong>. {preset.note}</p>
                    </SectionCard>

                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                        <TinyStat label="Điều kiện" value={transferConditionText(conditionType, move2)} accent="text-amber-700" />
                        <TinyStat label="Mục tiêu" value={transferGoalText(goalType, target)} accent="text-slate-800" />
                        <TinyStat label="Đáp số" value={fracToDecimal(derived.conditional, 4)} accent="text-amber-700" />
                    </div>

                    <div className="rounded-2xl border-2 border-amber-200 bg-amber-50 p-6 text-amber-950 shadow-sm">
                        <div className="text-xs uppercase tracking-[0.2em] text-amber-700/80 font-bold mb-2">Xác suất cần tìm</div>
                        <div className="text-4xl font-black leading-none mb-2 text-amber-900">{fracToDecimal(derived.conditional, 4)}</div>
                        <div className="text-sm text-amber-800 font-semibold flex items-center gap-1.5">
                            <span>=</span>
                            <InlineMath math={fracToLatex(derived.conditional)} />
                            <span>= {fracToPercent(derived.conditional, 2)}</span>
                        </div>
                    </div>

                    {trapColors.length > 0 && conditionType === 'draw2Same' && goalType === 'allInitialColors' && (
                        <SectionCard className="border-amber-300 bg-amber-50">
                            <p className="font-bold text-amber-800 text-sm mb-2">Gợi ý sư phạm rất mạnh</p>
                            <p className="text-sm text-amber-800 leading-relaxed">
                                Trong hộp A đang có màu xuất hiện đúng 1 lần: <strong>{trapColors.map(key => COLOR_META[key].label).join(', ')}</strong>.
                                Đây là “màu tử huyệt”: nếu lượt 1 lấy mất nó, học sinh phải tự hỏi lượt 2 có cách nào cứu lại dưới điều kiện “cùng màu” hay không.
                            </p>
                        </SectionCard>
                    )}
                </div>
            </div>

            <div className="grid grid-cols-1 xl:grid-cols-[0.9fr_1.1fr] gap-5">
                <SectionCard>
                    <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={1} /> Các khả năng ở Lượt 1 (A → B)</p>
                    <div className="space-y-2.5">
                        {derived.firstSummary.map((item, index) => (
                            <div key={`${item.label}-${index}`} className="rounded-xl border border-slate-200 bg-slate-50 px-4 py-3 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2 text-sm">
                                <div>
                                    <div className="font-bold text-slate-800">Chuyển {item.label}</div>
                                    <div className="text-xs text-slate-500">
                                        Số cách chọn: <InlineMath math={`${transferDrawWaysOnlyLatex(item.draw, boxA)} = ${item.ways}`} /> cách
                                    </div>
                                </div>
                                <div className="font-semibold text-amber-700 bg-amber-50/50 px-3 py-1.5 rounded-lg border border-amber-100 text-right">
                                    <InlineMath math={`P = ${transferDrawProbLatex(item.draw, boxA, move1)} = ${fracToLatex(item.prob)}`} />
                                </div>
                            </div>
                        ))}
                    </div>
                </SectionCard>

                <SectionCard>
                    <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={2} /> Công thức xác suất có điều kiện</p>
                    <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                        <p>Tổng hợp xác suất từ tất cả các nhánh chuyển bi hợp lệ:</p>
                        <div className="rounded-xl bg-slate-50 border border-slate-200 p-4 space-y-2.5">
                            <div>
                                <span className="text-slate-500 font-semibold block text-xs mb-1">Xác suất biến cố điều kiện P(E):</span>
                                <BlockMath math={`P(E) = \\sum_{\\text{nhánh } \\in E} P(\\text{nhánh}) = ${fracToLatex(derived.conditionTotal)}`} />
                            </div>
                            <div className="border-t border-slate-200 pt-2.5">
                                <span className="text-slate-500 font-semibold block text-xs mb-1">Xác suất biến cố đồng thời P(F ∩ E):</span>
                                <BlockMath math={`P(F \\cap E) = \\sum_{\\text{nhánh } \\in F \\cap E} P(\\text{nhánh}) = ${fracToLatex(derived.successTotal)}`} />
                            </div>
                            <div className="border-t border-slate-200 pt-2.5">
                                <span className="text-slate-500 font-semibold block text-xs mb-1">Xác suất có điều kiện cần tìm P(F | E):</span>
                                <BlockMath math={`P(F \\mid E) = \\dfrac{P(F \\cap E)}{P(E)} = \\dfrac{${fracToLatex(derived.successTotal)}}{${fracToLatex(derived.conditionTotal)}} = ${fracToLatex(derived.conditional)}`} />
                            </div>
                        </div>
                        <p className="text-xs text-slate-500 leading-relaxed">
                            Số nhánh thỏa điều kiện <InlineMath math="E" />: <strong>{derived.branches.filter(branch => branch.conditionPass).length}</strong>.<br />
                            Số nhánh thỏa cả điều kiện <InlineMath math="E" /> và mục tiêu <InlineMath math="F" />: <strong>{derived.branches.filter(branch => branch.bothPass).length}</strong>.
                        </p>
                    </div>
                </SectionCard>
            </div>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={3} /> Bảng nhánh chuyển bi chi tiết đầy đủ</p>
                <div className="overflow-x-auto rounded-xl border border-slate-200 max-h-[560px]">
                    <table className="w-full min-w-[1150px] text-sm border-collapse">
                        <thead className="sticky top-0 z-10">
                            <tr className="bg-slate-800 text-white text-xs">
                                <th className="px-3 py-2.5 text-left font-bold">Lượt 1: A → B</th>
                                <th className="px-3 py-2.5 text-left font-bold">Sau lượt 1 (A · B)</th>
                                <th className="px-3 py-2.5 text-left font-bold">Lượt 2: B → A</th>
                                <th className="px-3 py-2.5 text-left font-bold">A cuối cùng</th>
                                <th className="px-3 py-2.5 text-center font-bold">Xác suất nhánh</th>
                                <th className="px-3 py-2.5 text-center font-bold">Điều kiện E</th>
                                <th className="px-3 py-2.5 text-center font-bold">Mục tiêu F</th>
                            </tr>
                        </thead>
                        <tbody>
                            {derived.branches.map((branch, index) => (
                                <tr key={`${branch.draw1Label}-${branch.draw2Label}-${index}`} className={`border-b border-slate-200 ${branch.bothPass ? 'bg-emerald-50' : branch.conditionPass ? 'bg-amber-50' : index % 2 === 0 ? 'bg-white' : 'bg-slate-50'}`}>
                                    <td className="px-3 py-2.5 font-mono text-slate-700">{branch.draw1Label}</td>
                                    <td className="px-3 py-2.5 text-slate-600">A: {formatTransferCounts(branch.aAfterFirst)} · B: {formatTransferCounts(branch.bAfterFirst)}</td>
                                    <td className="px-3 py-2.5 font-mono text-slate-700">
                                        <div className="font-bold">{branch.draw2Label}</div>
                                        <div className="text-[10px] text-slate-400">
                                            <InlineMath math={transferDrawProbLatex(branch.draw2, branch.bAfterFirst, move2)} />
                                        </div>
                                    </td>
                                    <td className="px-3 py-2.5 text-slate-700 font-semibold">{formatTransferCounts(branch.finalA)}</td>
                                    <td className="px-3 py-2.5 text-center font-mono text-violet-700">
                                        <div className="text-[10px] text-slate-400">
                                            <InlineMath math={`${fracToLatex(branch.draw1Prob)} \\cdot ${fracToLatex(branch.draw2Prob)}`} />
                                        </div>
                                        <div className="font-bold text-xs"><InlineMath math={fracToLatex(branch.prob)} /></div>
                                    </td>
                                    <td className="px-3 py-2.5 text-center">{branch.conditionPass ? <span className="text-amber-700 font-bold">✓ Nhận</span> : <span className="text-slate-300">Loại</span>}</td>
                                    <td className="px-3 py-2.5 text-center">{branch.bothPass ? <span className="text-emerald-700 font-bold">★ Thành công</span> : branch.goalPass ? <span className="text-slate-500">Chưa qua E</span> : <span className="text-slate-300">Không</span>}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </SectionCard>
        </div>
    )
}

function OutcomeEditor({ outcome, onChange }) {
    return (
        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 space-y-3">
            <div className="flex items-center justify-between gap-3">
                <div>
                    <p className="font-bold text-slate-800 text-sm">{outcome.label}</p>
                    <p className="text-xs text-slate-500">mỗi lần gieo rơi vào nhánh này sẽ cộng thêm trạng thái bên dưới</p>
                </div>
                <NumberInput label="Trọng số" value={outcome.weight} onChange={value => onChange({ ...outcome, weight: value })} accent="focus:ring-sky-400" />
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                {['A', 'B', 'C'].map(field => (
                    <NumberInput
                        key={field}
                        label={`+${field}`}
                        value={outcome.delta[field]}
                        onChange={value => onChange({ ...outcome, delta: { ...outcome.delta, [field]: value } })}
                        accent="focus:ring-sky-400"
                    />
                ))}
            </div>
        </div>
    )
}

function RuleEditor({ title, rule, onChange }) {
    return (
        <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 space-y-3">
            <p className="font-bold text-slate-800 text-sm">{title}</p>
            <label className="text-sm space-y-1.5 block">
                <span className="font-medium text-slate-600">Kiểu điều kiện</span>
                <select
                    value={rule.kind}
                    onChange={event => {
                        const kind = event.target.value
                        if (kind === 'parity') onChange({ kind, field: 'A', parity: 'even' })
                        else if (kind === 'compare') onChange({ kind, field: 'A', comparator: '=', value: 0 })
                        else onChange({ kind, field: 'A', comparator: '>', otherField: 'B' })
                    }}
                    className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-400"
                >
                    <option value="parity">Chẵn / lẻ</option>
                    <option value="compare">So với một số cụ thể</option>
                    <option value="relation">So sánh 2 hộp</option>
                </select>
            </label>

            {rule.kind === 'parity' && (
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    <label className="text-sm space-y-1.5 block">
                        <span className="font-medium text-slate-600">Hộp</span>
                        <select value={rule.field} onChange={event => onChange({ ...rule, field: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-400">
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                        </select>
                    </label>
                    <label className="text-sm space-y-1.5 block">
                        <span className="font-medium text-slate-600">Tính chẵn lẻ</span>
                        <select value={rule.parity} onChange={event => onChange({ ...rule, parity: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-400">
                            <option value="even">Chẵn</option>
                            <option value="odd">Lẻ</option>
                        </select>
                    </label>
                </div>
            )}

            {rule.kind === 'compare' && (
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                    <label className="text-sm space-y-1.5 block">
                        <span className="font-medium text-slate-600">Hộp</span>
                        <select value={rule.field} onChange={event => onChange({ ...rule, field: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-400">
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                        </select>
                    </label>
                    <label className="text-sm space-y-1.5 block">
                        <span className="font-medium text-slate-600">Dấu so sánh</span>
                        <select value={rule.comparator} onChange={event => onChange({ ...rule, comparator: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-400">
                            <option value="=">=</option>
                            <option value=">">&gt;</option>
                            <option value=">=">≥</option>
                            <option value="<">&lt;</option>
                            <option value="<=">≤</option>
                        </select>
                    </label>
                    <NumberInput label="Giá trị" value={rule.value} onChange={value => onChange({ ...rule, value })} accent="focus:ring-sky-400" />
                </div>
            )}

            {rule.kind === 'relation' && (
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                    <label className="text-sm space-y-1.5 block">
                        <span className="font-medium text-slate-600">Vế trái</span>
                        <select value={rule.field} onChange={event => onChange({ ...rule, field: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-400">
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                        </select>
                    </label>
                    <label className="text-sm space-y-1.5 block">
                        <span className="font-medium text-slate-600">Dấu so sánh</span>
                        <select value={rule.comparator} onChange={event => onChange({ ...rule, comparator: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-400">
                            <option value=">">&gt;</option>
                            <option value="=">=</option>
                            <option value="<">&lt;</option>
                        </select>
                    </label>
                    <label className="text-sm space-y-1.5 block">
                        <span className="font-medium text-slate-600">Vế phải</span>
                        <select value={rule.otherField} onChange={event => onChange({ ...rule, otherField: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-400">
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                        </select>
                    </label>
                </div>
            )}
        </div>
    )
}

function DiceTab() {
    const [presetId, setPresetId] = useState(DICE_PRESETS[0].id)
    const preset = useMemo(() => DICE_PRESETS.find(item => item.id === presetId) || DICE_PRESETS[0], [presetId])
    const [outcomes, setOutcomes] = useState(preset.outcomes)
    const [conditionRule, setConditionRule] = useState(preset.conditionRule)
    const [goalRule, setGoalRule] = useState(preset.goalRule)

    useEffect(() => {
        setOutcomes(preset.outcomes.map(item => ({ ...item, delta: { ...item.delta } })))
        setConditionRule({ ...preset.conditionRule })
        setGoalRule({ ...preset.goalRule })
    }, [preset])

    const derived = useMemo(() => {
        const safeOutcomes = outcomes.map(outcome => ({
            ...outcome,
            weight: clampInt(outcome.weight, 0, 20),
            delta: {
                A: clampInt(outcome.delta.A, 0, 10),
                B: clampInt(outcome.delta.B, 0, 10),
                C: clampInt(outcome.delta.C, 0, 10),
            },
        }))
        const weightSum = safeOutcomes.reduce((sum, outcome) => sum + outcome.weight, 0)
        const withProb = safeOutcomes.map(outcome => ({
            ...outcome,
            prior: weightSum > 0 ? frac(outcome.weight, weightSum) : frac(0, 1),
        }))
        const branches = []
        withProb.forEach(first => {
            withProb.forEach(second => {
                const finalState = {
                    A: first.delta.A + second.delta.A,
                    B: first.delta.B + second.delta.B,
                    C: first.delta.C + second.delta.C,
                }
                const prob = mulFrac(first.prior, second.prior)
                const branch = {
                    rowId: first.id,
                    colId: second.id,
                    first,
                    second,
                    finalState,
                    prob,
                }
                branch.conditionPass = evaluateStateRule(conditionRule, finalState)
                branch.goalPass = evaluateStateRule(goalRule, finalState)
                branch.bothPass = branch.conditionPass && branch.goalPass
                branches.push(branch)
            })
        })
        const conditionTotal = branches.reduce((sum, branch) => branch.conditionPass ? addFrac(sum, branch.prob) : sum, frac(0, 1))
        const successTotal = branches.reduce((sum, branch) => branch.bothPass ? addFrac(sum, branch.prob) : sum, frac(0, 1))
        const conditional = conditionTotal.n === 0 ? frac(0, 1) : divFrac(successTotal, conditionTotal)
        return { outcomes: withProb, branches, conditionTotal, successTotal, conditional, weightSum }
    }, [outcomes, conditionRule, goalRule])

    return (
        <div className="space-y-5">
            <div className="grid grid-cols-1 xl:grid-cols-[1.15fr_0.85fr] gap-5">
                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Preset xúc xắc → bóng vào hộp</p>
                        <div className="flex flex-wrap gap-2">
                            {DICE_PRESETS.map(item => (
                                <button
                                    key={item.id}
                                    type="button"
                                    onClick={() => setPresetId(item.id)}
                                    className={`px-4 py-2 rounded-xl text-sm font-semibold border transition-colors ${item.id === presetId ? 'bg-sky-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'}`}
                                >
                                    {item.title}
                                </button>
                            ))}
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Ba kết quả có thể xảy ra ở mỗi lần gieo</p>
                        <div className="space-y-3">
                            {outcomes.map(outcome => (
                                <OutcomeEditor
                                    key={outcome.id}
                                    outcome={outcome}
                                    onChange={next => setOutcomes(prev => prev.map(item => item.id === outcome.id ? next : item))}
                                />
                            ))}
                        </div>
                    </SectionCard>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                        <RuleEditor title="Điều kiện đã biết" rule={conditionRule} onChange={setConditionRule} />
                        <RuleEditor title="Mục tiêu cần hỏi" rule={goalRule} onChange={setGoalRule} />
                    </div>
                </div>

                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Phân tích lời giải (Gieo xúc xắc 2 lần độc lập)</p>
                        <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                            <p>
                                Gọi <InlineMath math="E" /> là biến cố điều kiện đã biết: <strong>"{ruleText(conditionRule)}"</strong>.<br />
                                Gọi <InlineMath math="F" /> là biến cố mục tiêu cần hỏi: <strong>"{ruleText(goalRule)}"</strong>.
                            </p>
                            <p>
                                Vì 2 lần gieo xúc xắc độc lập, ta lập ma trận kết quả kích thước <InlineMath math="3 \times 3" /> gồm 9 nhánh biến cố. 
                                Xác suất của mỗi nhánh là tích xác suất hai lần gieo.
                            </p>
                            <div className="border-t border-slate-100 pt-3 space-y-2.5">
                                <div>
                                    <span className="text-slate-500 font-semibold block text-xs mb-0.5">Xác suất biến cố điều kiện P(E):</span>
                                    <BlockMath math={`P(E) = \\sum_{\\text{ô } \\in E} P(\\text{ô}) = ${fracToLatex(derived.conditionTotal)}`} />
                                </div>
                                <div className="border-t border-slate-200 pt-2.5">
                                    <span className="text-slate-500 font-semibold block text-xs mb-0.5">Xác suất biến cố đồng thời P(F ∩ E):</span>
                                    <BlockMath math={`P(F \\cap E) = \\sum_{\\text{ô } \\in F \\cap E} P(\\text{ô}) = ${fracToLatex(derived.successTotal)}`} />
                                </div>
                                <div className="border-t border-slate-200 pt-2.5">
                                    <span className="text-slate-500 font-semibold block text-xs mb-0.5">Xác suất có điều kiện cần tìm P(F | E):</span>
                                    <BlockMath math={`P(F \\mid E) = \\dfrac{P(F \\cap E)}{P(E)} = \\dfrac{${fracToLatex(derived.successTotal)}}{${fracToLatex(derived.conditionTotal)}} = ${fracToLatex(derived.conditional)}`} />
                                </div>
                            </div>
                        </div>
                        <p className="text-xs text-slate-500 mt-4 border-t border-slate-100 pt-3">Preset hiện tại: <strong>{preset.title}</strong>. {preset.note}</p>
                    </SectionCard>

                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                        <TinyStat label="Điều kiện" value={ruleText(conditionRule)} accent="text-sky-700" />
                        <TinyStat label="Mục tiêu" value={ruleText(goalRule)} accent="text-slate-800" />
                        <TinyStat label="Đáp số" value={fracToDecimal(derived.conditional, 4)} accent="text-sky-700" />
                    </div>

                    <div className="rounded-2xl border-2 border-sky-200 bg-sky-50 p-6 text-sky-950 shadow-sm">
                        <div className="text-xs uppercase tracking-[0.2em] text-sky-700/80 font-bold mb-2">Xác suất có điều kiện</div>
                        <div className="text-4xl font-black leading-none mb-2 text-sky-900">{fracToDecimal(derived.conditional, 4)}</div>
                        <div className="text-sm text-sky-800 font-semibold flex items-center gap-1.5">
                            <span>=</span>
                            <InlineMath math={fracToLatex(derived.conditional)} />
                            <span>= {fracToPercent(derived.conditional, 2)}</span>
                        </div>
                    </div>
                </div>
            </div>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={1} /> Xác suất của từng khả năng trong 1 lần gieo</p>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
                    {derived.outcomes.map(outcome => (
                        <OutcomeVisualCard
                            key={outcome.id}
                            label={outcome.label}
                            weight={outcome.weight}
                            delta={outcome.delta}
                            prior={outcome.prior}
                        />
                    ))}
                </div>
            </SectionCard>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-2">Sơ đồ cây xác suất gieo xúc xắc 2 lần</p>
                <p className="text-xs text-slate-500 mb-3">Mô phỏng 9 nhánh biến cố tương ứng với các ô trong ma trận kết quả phía dưới.</p>
                <DiceTreeVisualizer outcomes={derived.outcomes} branches={derived.branches} />
            </SectionCard>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={2} /> Ma trận 9 hiện trường sau 2 lần gieo</p>
                <div className="overflow-x-auto rounded-xl border border-slate-200">
                    <table className="w-full min-w-[900px] text-sm border-collapse">
                        <thead>
                            <tr className="bg-slate-100 text-slate-700 text-xs">
                                <th className="px-3 py-2.5 text-left font-bold">Lần 1 \ Lần 2</th>
                                {derived.outcomes.map(outcome => (
                                    <th key={outcome.id} className="px-3 py-2.5 text-center font-bold">{outcome.label}</th>
                                ))}
                            </tr>
                        </thead>
                        <tbody>
                            {derived.outcomes.map(rowOutcome => (
                                <tr key={rowOutcome.id} className="border-t border-slate-200">
                                    <td className="px-3 py-3 font-bold text-slate-700 bg-slate-50">{rowOutcome.label}</td>
                                    {derived.outcomes.map(colOutcome => {
                                        const branch = derived.branches.find(item => item.rowId === rowOutcome.id && item.colId === colOutcome.id)
                                        const cellClass = branch?.bothPass ? 'bg-emerald-50 border-emerald-200' : branch?.conditionPass ? 'bg-sky-50 border-sky-200' : 'bg-white border-slate-200'
                                        return (
                                            <td key={colOutcome.id} className={`align-top border px-3 py-3 ${cellClass}`}>
                                                {branch && (
                                                    <div className="space-y-2 text-xs">
                                                        <div className="font-mono text-violet-700 text-[11px]">
                                                            <InlineMath math={`${fracToLatex(branch.first.prior)} \\cdot ${fracToLatex(branch.second.prior)} = ${fracToLatex(branch.prob)}`} />
                                                        </div>
                                                        
                                                        <div className="flex gap-1.5 font-bold my-1 text-[11px]">
                                                            <span className="px-1.5 py-0.5 rounded bg-red-50 text-red-700 border border-red-100">A: {branch.finalState.A}</span>
                                                            <span className="px-1.5 py-0.5 rounded bg-sky-50 text-sky-700 border border-sky-100">B: {branch.finalState.B}</span>
                                                            <span className="px-1.5 py-0.5 rounded bg-amber-50 text-amber-700 border border-amber-100">C: {branch.finalState.C}</span>
                                                        </div>
                                                        
                                                        <div className="flex flex-col gap-1 text-[10px] pt-1">
                                                            <span className={`px-2 py-0.5 rounded-full w-max ${branch.conditionPass ? 'bg-sky-100 text-sky-700 border border-sky-200/50' : 'bg-slate-100 text-slate-400'}`}>
                                                                Điều kiện: {branch.conditionPass ? '✓ Thỏa mãn' : '✗ Loại'}
                                                            </span>
                                                            <span className={`px-2 py-0.5 rounded-full w-max ${branch.bothPass ? 'bg-emerald-100 text-emerald-700 border border-emerald-200/50' : branch.goalPass ? 'bg-amber-100 text-amber-700 border border-amber-200/50' : 'bg-slate-100 text-slate-400'}`}>
                                                                {branch.bothPass ? '★ Mục tiêu đạt' : branch.goalPass ? '⚠ Đạt mục tiêu (chưa qua ĐK)' : '✗ Mục tiêu loại'}
                                                            </span>
                                                        </div>
                                                    </div>
                                                )}
                                            </td>
                                        )
                                    })}
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </SectionCard>
        </div>
    )
}

function buildBayesRowsFromParameter({ boxes, targetFraction, eventType, mode, totalTargetBalls }) {
    const rows = []
    const start = mode === 'redCount' ? 0 : 1
    const end = mode === 'redCount' ? totalTargetBalls : 12

    for (let x = start; x <= end; x += 1) {
        const H2 = mode === 'redCount'
            ? { label: 'Hộp II', red: x, blue: totalTargetBalls - x, weight: boxes.H2.weight }
            : { label: 'Hộp II', red: boxes.H2.red, blue: boxes.H2.blue, weight: x }
        const bayesBoxes = [
            { id: 'H1', label: 'Hộp I', red: boxes.H1.red, blue: boxes.H1.blue, weight: boxes.H1.weight },
            { id: 'H2', label: H2.label, red: H2.red, blue: H2.blue, weight: H2.weight },
            { id: 'H3', label: 'Hộp III', red: boxes.H3.red, blue: boxes.H3.blue, weight: boxes.H3.weight },
        ]
        const weightSum = bayesBoxes.reduce((sum, box) => sum + box.weight, 0)
        const rowsForX = bayesBoxes.map(box => {
            const prior = weightSum > 0 ? frac(box.weight, weightSum) : frac(0, 1)
            const eventData = evaluateBallEvent(box.red, box.blue, eventType)
            const joint = mulFrac(prior, eventData.cond)
            return { ...box, prior, cond: eventData.cond, joint }
        })
        const totalEvent = rowsForX.reduce((sum, row) => addFrac(sum, row.joint), frac(0, 1))
        const targetPosterior = totalEvent.n === 0 ? frac(0, 1) : divFrac(rowsForX[1].joint, totalEvent)
        rows.push({
            x,
            H2,
            rows: rowsForX,
            totalEvent,
            posterior: targetPosterior,
            isExact: fracEq(targetPosterior, targetFraction),
            diff: fracAbsDiff(targetPosterior, targetFraction),
        })
    }

    return rows
}

function FractionInputs({ fraction, onChange }) {
    return (
        <div className="grid grid-cols-2 gap-3">
            <NumberInput label="Tử số" value={fraction.n} onChange={value => onChange({ ...fraction, n: Math.max(0, value) })} min={0} max={20} accent="focus:ring-rose-400" />
            <NumberInput label="Mẫu số" value={fraction.d} onChange={value => onChange({ ...fraction, d: Math.max(1, value) })} min={1} max={20} accent="focus:ring-rose-400" />
        </div>
    )
}

function FindXTab() {
    const [presetId, setPresetId] = useState(FINDX_PRESETS[0].id)
    const preset = useMemo(() => FINDX_PRESETS.find(item => item.id === presetId) || FINDX_PRESETS[0], [presetId])
    const [mode, setMode] = useState(preset.mode)
    const [eventType, setEventType] = useState(preset.eventType)
    const [totalTargetBalls, setTotalTargetBalls] = useState(preset.totalTargetBalls)
    const [targetFraction, setTargetFraction] = useState(preset.targetFraction)
    const [boxes, setBoxes] = useState(preset.boxes)
    const [selectedX, setSelectedX] = useState(null)

    useEffect(() => {
        setMode(preset.mode)
        setEventType(preset.eventType)
        setTotalTargetBalls(preset.totalTargetBalls)
        setTargetFraction(preset.targetFraction)
        setBoxes({
            H1: { ...preset.boxes.H1 },
            H2: { ...preset.boxes.H2 },
            H3: { ...preset.boxes.H3 },
        })
        setSelectedX(null)
    }, [preset])

    const normalizedTarget = useMemo(() => frac(targetFraction.n, targetFraction.d), [targetFraction])

    const candidates = useMemo(() => {
        const safeBoxes = {
            H1: { red: clampInt(boxes.H1.red, 0, 20), blue: clampInt(boxes.H1.blue, 0, 20), weight: clampInt(boxes.H1.weight, 0, 20) },
            H2: { red: clampInt(boxes.H2.red, 0, 20), blue: clampInt(boxes.H2.blue, 0, 20), weight: clampInt(boxes.H2.weight, 0, 20) },
            H3: { red: clampInt(boxes.H3.red, 0, 20), blue: clampInt(boxes.H3.blue, 0, 20), weight: clampInt(boxes.H3.weight, 0, 20) },
        }
        return buildBayesRowsFromParameter({
            boxes: safeBoxes,
            targetFraction: normalizedTarget,
            eventType,
            mode,
            totalTargetBalls: clampInt(totalTargetBalls, 0, 20),
        })
    }, [boxes, normalizedTarget, eventType, mode, totalTargetBalls])

    const exactMatches = candidates.filter(item => item.isExact)
    const fallback = candidates.reduce((best, item) => {
        if (!best) return item
        return item.diff < best.diff ? item : best
    }, null)
    const active = candidates.find(item => item.x === selectedX) || exactMatches[0] || fallback

    useEffect(() => {
        if (active && selectedX == null) setSelectedX(active.x)
    }, [active, selectedX])

    return (
        <div className="space-y-5">
            <div className="grid grid-cols-1 xl:grid-cols-[1.1fr_0.9fr] gap-5">
                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Preset tìm tham số</p>
                        <div className="flex flex-wrap gap-2">
                            {FINDX_PRESETS.map(item => (
                                <button
                                    key={item.id}
                                    type="button"
                                    onClick={() => setPresetId(item.id)}
                                    className={`px-4 py-2 rounded-xl text-sm font-semibold border transition-colors ${item.id === presetId ? 'bg-rose-600 text-white border-transparent' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'}`}
                                >
                                    {item.title}
                                </button>
                            ))}
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Bài toán yêu cầu tìm x nào?</p>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <label className="text-sm space-y-1.5 block">
                                <span className="font-medium text-slate-600">x là gì?</span>
                                <select value={mode} onChange={event => setMode(event.target.value)} className="w-full rounded-xl border border-slate-300 px-3 py-2 font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-rose-400">
                                    <option value="redCount">x = số bi đỏ trong Hộp II</option>
                                    <option value="weight">x = trọng số chọn Hộp II</option>
                                </select>
                            </label>
                            <div>
                                <span className="font-medium text-slate-600 block text-sm mb-1.5">Biến cố đã biết</span>
                                <EventPills value={eventType} onChange={setEventType} />
                            </div>
                        </div>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-5 mt-4">
                            <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 space-y-3">
                                <p className="font-bold text-slate-800 text-sm">Hộp I và Hộp III cố định</p>
                                <div className="grid grid-cols-1 gap-3">
                                    <NumberInput label="Hộp I đỏ" value={boxes.H1.red} onChange={value => setBoxes(prev => ({ ...prev, H1: { ...prev.H1, red: value } }))} accent="focus:ring-red-400" />
                                    <NumberInput label="Hộp I xanh" value={boxes.H1.blue} onChange={value => setBoxes(prev => ({ ...prev, H1: { ...prev.H1, blue: value } }))} accent="focus:ring-sky-400" />
                                    <NumberInput label="Hộp I trọng số" value={boxes.H1.weight} onChange={value => setBoxes(prev => ({ ...prev, H1: { ...prev.H1, weight: value } }))} accent="focus:ring-rose-400" />
                                    <NumberInput label="Hộp III đỏ" value={boxes.H3.red} onChange={value => setBoxes(prev => ({ ...prev, H3: { ...prev.H3, red: value } }))} accent="focus:ring-red-400" />
                                    <NumberInput label="Hộp III xanh" value={boxes.H3.blue} onChange={value => setBoxes(prev => ({ ...prev, H3: { ...prev.H3, blue: value } }))} accent="focus:ring-sky-400" />
                                    <NumberInput label="Hộp III trọng số" value={boxes.H3.weight} onChange={value => setBoxes(prev => ({ ...prev, H3: { ...prev.H3, weight: value } }))} accent="focus:ring-rose-400" />
                                </div>
                            </div>
                            <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 space-y-3">
                                <p className="font-bold text-slate-800 text-sm">Thông tin của Hộp II</p>
                                {mode === 'redCount' ? (
                                    <>
                                        <NumberInput label="Tổng số bi Hộp II" value={totalTargetBalls} onChange={setTotalTargetBalls} min={0} max={20} accent="focus:ring-rose-400" />
                                        <NumberInput label="Trọng số chọn Hộp II" value={boxes.H2.weight} onChange={value => setBoxes(prev => ({ ...prev, H2: { ...prev.H2, weight: value } }))} accent="focus:ring-rose-400" />
                                        <p className="text-xs text-slate-500">Khi đó Hộp II sẽ có <strong>x</strong> bi đỏ và <strong>{totalTargetBalls} - x</strong> bi xanh.</p>
                                    </>
                                ) : (
                                    <>
                                        <NumberInput label="Hộp II đỏ" value={boxes.H2.red} onChange={value => setBoxes(prev => ({ ...prev, H2: { ...prev.H2, red: value } }))} accent="focus:ring-red-400" />
                                        <NumberInput label="Hộp II xanh" value={boxes.H2.blue} onChange={value => setBoxes(prev => ({ ...prev, H2: { ...prev.H2, blue: value } }))} accent="focus:ring-sky-400" />
                                        <p className="text-xs text-slate-500">Lúc này x chạy qua vai trò trọng số chọn Hộp II.</p>
                                    </>
                                )}
                                <div>
                                    <span className="font-medium text-slate-600 block text-sm mb-2">Giá trị hậu nghiệm mong muốn</span>
                                    <FractionInputs fraction={targetFraction} onChange={setTargetFraction} />
                                </div>
                            </div>
                        </div>
                    </SectionCard>
                </div>

                <div className="space-y-5">
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">Cách đọc tab này</p>
                        <div className="space-y-2 text-sm text-slate-700 leading-relaxed">
                            <p><strong>Bước 1.</strong> Cố định toàn bộ phần đề còn lại, chỉ để <strong>x</strong> là tham số chưa biết.</p>
                            <p><strong>Bước 2.</strong> Với mỗi giá trị nguyên của x, web tự tính lại toàn bộ Bayes.</p>
                            <p><strong>Bước 3.</strong> Tô sáng những x làm hậu nghiệm đúng bằng giá trị đề bài yêu cầu.</p>
                            <p><strong>Bước 4.</strong> Nếu không có nghiệm đúng tuyệt đối, web chỉ ra x gần nhất để giáo viên giải thích vì sao đề gốc có thể đã chỉnh số.</p>
                        </div>
                        <p className="text-xs text-slate-500 mt-4">Preset hiện tại: <strong>{preset.title}</strong>. {preset.note}</p>
                    </SectionCard>

                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                        <TinyStat label="Mục tiêu" value={`${fracToText(normalizedTarget)} = ${fracToDecimal(normalizedTarget, 4)}`} accent="text-rose-700" />
                        <TinyStat label="Số nghiệm đúng" value={`${exactMatches.length}`} accent="text-slate-800" />
                        <TinyStat label="x đang xem" value={active ? `${active.x}` : '—'} accent="text-rose-700" />
                    </div>

                    <div className="rounded-2xl border-2 border-rose-200 bg-rose-50 p-6 text-rose-950 shadow-sm">
                        <div className="text-xs uppercase tracking-[0.2em] text-rose-700/80 font-bold mb-2">Kết luận nhanh</div>
                        {exactMatches.length > 0 ? (
                            <>
                                <div className="text-3xl font-black leading-tight text-rose-900">x = {exactMatches.map(item => item.x).join(', ')}</div>
                                <div className="text-sm text-rose-800 font-semibold mt-2">Các giá trị này cho đúng hậu nghiệm cần tìm.</div>
                            </>
                        ) : active ? (
                            <>
                                <div className="text-3xl font-black leading-tight text-rose-900">x gần nhất = {active.x}</div>
                                <div className="text-sm text-rose-800 font-semibold mt-2">Hậu nghiệm nhận được: {fracToText(active.posterior)} ≈ {fracToDecimal(active.posterior, 4)}</div>
                            </>
                        ) : null}
                    </div>
                </div>
            </div>

            <SectionCard>
                <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2"><StepBadge n={1} /> Bảng quét toàn bộ giá trị x</p>
                <div className="space-y-3">
                    {candidates.map(item => {
                        const isActive = active && active.x === item.x
                        const isExact = item.isExact
                        const width = Math.max(0, Math.min(100, fracValue(item.posterior) * 100))
                        return (
                            <button
                                key={item.x}
                                type="button"
                                onClick={() => setSelectedX(item.x)}
                                className={`w-full text-left rounded-xl border p-4 transition-colors ${isExact ? 'border-emerald-400 bg-emerald-50' : isActive ? 'border-rose-300 bg-rose-50' : 'border-slate-200 bg-white hover:bg-slate-50'}`}
                            >
                                <div className="flex items-center justify-between gap-3 text-sm mb-2">
                                    <div>
                                        <span className="font-bold text-slate-800">x = {item.x}</span>
                                        <span className="text-slate-400 ml-2">Hộp II: {item.H2.red} đỏ, {item.H2.blue} xanh; trọng số {item.H2.weight}</span>
                                    </div>
                                    <div className={`font-mono font-bold ${isExact ? 'text-emerald-700' : 'text-rose-700'}`}>{fracToText(item.posterior)}</div>
                                </div>
                                <div className="w-full h-3 rounded-full bg-slate-100 overflow-hidden mb-2">
                                    <div className={`h-full rounded-full ${isExact ? 'bg-emerald-500' : 'bg-rose-400'}`} style={{ width: `${width}%` }} />
                                </div>
                                <div className="text-xs text-slate-500">
                                    {isExact ? 'Khớp đúng mục tiêu.' : `Độ lệch so với mục tiêu: ${item.diff.toFixed(4)}`}
                                </div>
                            </button>
                        )
                    })}
                </div>
            </SectionCard>

            {active && (
                <div className="grid grid-cols-1 xl:grid-cols-[1fr_1.5fr] gap-5">
                    <SectionCard className="space-y-4">
                        <div>
                            <p className="font-bold text-slate-800 text-sm mb-4 flex items-center gap-2">
                                <StepBadge n={2} /> Trực quan hóa cấu hình tại x = {active.x}
                            </p>
                            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                                <UrnVisualizer label="Hộp I" red={boxes.H1.red} blue={boxes.H1.blue} weight={boxes.H1.weight} />
                                <UrnVisualizer label={`Hộp II (x = ${active.x})`} red={active.H2.red} blue={active.H2.blue} weight={active.H2.weight} isActive={true} />
                                <UrnVisualizer label="Hộp III" red={boxes.H3.red} blue={boxes.H3.blue} weight={boxes.H3.weight} />
                            </div>
                        </div>
                        <div className="border-t border-slate-100 pt-4">
                            <p className="font-bold text-slate-800 text-sm mb-3">Sơ đồ cây xác suất tại x = {active.x}</p>
                            <p className="text-xs text-slate-500 mb-3">Sơ đồ cây xác suất tự động cập nhật khi bạn quét chọn các giá trị x khác nhau ở bảng trên.</p>
                            <BayesTreeVisualizer rows={active.rows} eventType={eventType} targetId="H2" />
                        </div>
                    </SectionCard>

                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3 flex items-center gap-2">
                            <StepBadge n={3} /> Diễn giải chi tiết bằng Toán học
                        </p>
                        <div className="space-y-3 text-sm text-slate-700 leading-relaxed">
                            <p>
                                Với <strong>x = {active.x}</strong>, Hộp II có cấu hình <strong>{active.H2.red} đỏ, {active.H2.blue} xanh</strong> và trọng số chọn là <strong>{active.H2.weight}</strong>.
                            </p>
                            <p>
                                Biến cố điều kiện là <InlineMath math="B" />: <strong>"Lấy được {eventMeta(eventType).label}"</strong>.
                            </p>
                            <div className="border-t border-slate-100 pt-2 space-y-2">
                                <div>
                                    <span className="text-slate-500 font-semibold block text-xs">Xác suất trước (Prior):</span>
                                    <div className="pl-3 font-mono text-slate-800 space-x-3">
                                        <InlineMath math={`P(H_1) = ${fracToLatex(active.rows[0].prior)}`} />
                                        <InlineMath math={`P(H_2) = ${fracToLatex(active.rows[1].prior)}`} />
                                        <InlineMath math={`P(H_3) = ${fracToLatex(active.rows[2].prior)}`} />
                                    </div>
                                </div>
                                <div className="border-t border-slate-100 pt-2">
                                    <span className="text-slate-500 font-semibold block text-xs">Xác suất có điều kiện (Likelihood):</span>
                                    <div className="pl-3 space-y-1 font-mono text-slate-800">
                                        <div><InlineMath math={`P(B \\mid H_1) = ${likelihoodFormulaLatex(boxes.H1.red, boxes.H1.blue, eventType)} = ${fracToLatex(active.rows[0].cond)}`} /></div>
                                        <div><InlineMath math={`P(B \\mid H_2) = ${likelihoodFormulaLatex(active.H2.red, active.H2.blue, eventType)} = ${fracToLatex(active.rows[1].cond)}`} /></div>
                                        <div><InlineMath math={`P(B \\mid H_3) = ${likelihoodFormulaLatex(boxes.H3.red, boxes.H3.blue, eventType)} = ${fracToLatex(active.rows[2].cond)}`} /></div>
                                    </div>
                                </div>
                                <div className="border-t border-slate-100 pt-2">
                                    <span className="text-slate-500 font-semibold block text-xs">Xác suất toàn phần:</span>
                                    <BlockMath math={`P(B) = \\sum_{i=1}^3 P(H_i)P(B \\mid H_i) = ${fracToLatex(active.totalEvent)}`} />
                                </div>
                                <div className="border-t border-slate-100 pt-2">
                                    <span className="text-slate-500 font-semibold block text-xs mb-1">Xác suất hậu nghiệm Bayes cần tìm P(H₂ | B):</span>
                                    <div className="bg-rose-50 border border-rose-200 rounded-xl p-3 text-center my-1.5 shadow-inner">
                                        <BlockMath math={`P(H_2 \\mid B) = \\dfrac{P(H_2)P(B \\mid H_2)}{P(B)} = \\dfrac{${fracToLatex(active.rows[1].prior)} \\cdot ${fracToLatex(active.rows[1].cond)}}{${fracToLatex(active.totalEvent)}} = ${fracToLatex(active.posterior)}`} />
                                    </div>
                                    <p className="mt-1">
                                        So với giá trị đích mong muốn <strong>{fracToText(normalizedTarget)}</strong>, 
                                        {active.isExact ? (
                                            <span className="text-emerald-700 font-bold ml-1">khớp hoàn toàn chính xác!</span>
                                        ) : (
                                            <span className="text-rose-700 font-bold ml-1">chưa khớp tuyệt đối (lệch {active.diff.toFixed(4)}).</span>
                                        )}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </SectionCard>
                </div>
            )}
        </div>
    )
}

export default function UrnProbabilityStudioPage() {
    const [activeTab, setActiveTab] = useState(TAB_META[0].id)

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-5">
            <HeaderHero activeTab={activeTab} onSelect={setActiveTab} />

            {activeTab === 'bayes' && <BayesTab />}
            {activeTab === 'transfer' && <TransferTab />}
            {activeTab === 'dice' && <DiceTab />}
            {activeTab === 'findx' && <FindXTab />}
        </div>
    )
}