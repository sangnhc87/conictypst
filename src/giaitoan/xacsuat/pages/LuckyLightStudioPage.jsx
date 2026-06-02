/**
 * LuckyLightStudioPage.jsx
 * Studio tương tác cho chuyên đề Ước Số, Số Chính Phương & Xác Suất
 * 3 tab: Mô phỏng · Luyện tập ngẫu nhiên · Khám phá ước số
 */
import React, { useState, useCallback, useMemo, useRef, useEffect } from 'react'
import { BlockMath, InlineMath } from 'react-katex'
import 'katex/dist/katex.min.css'

// ─── helpers ──────────────────────────────────────────────────────────────────

function getDivisors(n) {
    const divs = []
    for (let i = 1; i <= n; i++) if (n % i === 0) divs.push(i)
    return divs
}

function isPerfectSquare(n) {
    const s = Math.floor(Math.sqrt(n))
    return s * s === n
}

function floorSqrt(n) {
    return Math.floor(Math.sqrt(n))
}

function gcd(a, b) {
    while (b) { const t = b; b = a % b; a = t }
    return a
}

function simplify(num, den) {
    const g = gcd(Math.abs(num), Math.abs(den))
    return [num / g, den / g]
}

function factorize(n) {
    const factors = {}
    let d = 2
    let temp = n
    while (d * d <= temp) {
        while (temp % d === 0) {
            factors[d] = (factors[d] || 0) + 1
            temp = Math.floor(temp / d)
        }
        d++
    }
    if (temp > 1) factors[temp] = (factors[temp] || 0) + 1
    return factors
}

function dFormula(n) {
    const f = factorize(n)
    return Object.values(f).reduce((acc, e) => acc * (e + 1), 1)
}

// ─── tab meta ─────────────────────────────────────────────────────────────────

const TABS = [
    { id: 'simulate', label: 'Mô phỏng Lucky Light', short: 'Mô phỏng', accent: 'emerald' },
    { id: 'practice', label: 'Luyện tập ngẫu nhiên', short: 'Luyện tập', accent: 'violet' },
    { id: 'explore', label: 'Khám phá ước số', short: 'Ước số', accent: 'amber' },
]

const ACCENT = {
    emerald: {
        tab: 'bg-emerald-600 text-white border-b-4 border-emerald-400',
        idle: 'text-emerald-700 hover:bg-emerald-50',
        badge: 'bg-emerald-100 text-emerald-800 border border-emerald-200',
        btn: 'bg-emerald-600 hover:bg-emerald-700 text-white',
        bar: 'bg-emerald-500',
        ring: 'ring-emerald-400',
    },
    violet: {
        tab: 'bg-violet-600 text-white border-b-4 border-violet-400',
        idle: 'text-violet-700 hover:bg-violet-50',
        badge: 'bg-violet-100 text-violet-800 border border-violet-200',
        btn: 'bg-violet-600 hover:bg-violet-700 text-white',
        bar: 'bg-violet-500',
        ring: 'ring-violet-400',
    },
    amber: {
        tab: 'bg-amber-500 text-white border-b-4 border-amber-300',
        idle: 'text-amber-700 hover:bg-amber-50',
        badge: 'bg-amber-100 text-amber-800 border border-amber-200',
        btn: 'bg-amber-500 hover:bg-amber-600 text-white',
        bar: 'bg-amber-400',
        ring: 'ring-amber-400',
    },
}

// ─── practice problem generator ───────────────────────────────────────────────

const PROBLEM_TYPES = [
    { id: 'light', label: '🔆 Bóng đèn Lucky Light', noun: 'bóng đèn', stateA: 'đỏ', stateB: 'xanh', startState: 'đỏ' },
    { id: 'locker', label: '🔒 Tủ khóa trường học', noun: 'tủ khóa', stateA: 'đóng', stateB: 'mở', startState: 'đóng' },
    { id: 'coin', label: '🪙 Đồng xu lật', noun: 'đồng xu', stateA: 'ngửa', stateB: 'sấp', startState: 'ngửa' },
    { id: 'switch', label: '💡 Công tắc đèn', noun: 'công tắc', stateA: 'tắt', stateB: 'bật', startState: 'tắt' },
]

const NICE_N = [50, 60, 72, 80, 100, 120, 144, 150, 180, 200, 225, 256, 300, 400, 500, 600, 625, 720, 900, 1000, 1024, 1200, 1444, 1600, 1800, 2000, 2024, 2025, 2026]

function makeRandomProblem() {
    const type = PROBLEM_TYPES[Math.floor(Math.random() * PROBLEM_TYPES.length)]
    const n = NICE_N[Math.floor(Math.random() * NICE_N.length)]
    const sq = floorSqrt(n)
    const askRed = Math.random() < 0.5   // ask for stateA (initial) or stateB (toggled)
    const [num, den] = simplify(askRed ? n - sq : sq, n)
    return { type, n, sq, askRed, num, den }
}

function problemText({ type, n, askRed }) {
    const { noun, stateA, stateB, startState } = type
    const askState = askRed ? stateA : stateB
    return (
        `Có $${n}$ ${noun} đánh số $1$ đến $${n}$, tất cả ban đầu ở trạng thái ` +
        `*${startState}*. Thực hiện $${n}$ bước: bước thứ $k$ đổi trạng thái ` +
        `(${stateA} ↔ ${stateB}) của mọi ${noun} có số thứ tự là bội của $k$. ` +
        `Sau khi hoàn thành tất cả $${n}$ bước, chọn ngẫu nhiên một ${noun}. ` +
        `Tính xác suất ${noun} được chọn ở trạng thái *${askState}*.`
    )
}

// ─── Bulb grid ────────────────────────────────────────────────────────────────

function BulbGrid({ bulbs, activeMultiples, n, compact }) {
    const size = compact ? 'w-5 h-5 text-[9px]' : 'w-7 h-7 text-[10px]'
    return (
        <div className="flex flex-wrap gap-0.5">
            {bulbs.map((state, i) => {
                const num = i + 1
                const isActive = activeMultiples?.includes(num)
                const isSquare = isPerfectSquare(num)
                return (
                    <div
                        key={i}
                        title={`Bóng ${num}: ${state ? 'Xanh' : 'Đỏ'} | d(${num})=${getDivisors(num).length}`}
                        className={[
                            size,
                            'rounded-full flex items-center justify-center font-bold transition-all duration-200',
                            state ? 'bg-sky-500 text-white' : 'bg-red-400 text-white',
                            isActive ? 'ring-2 ring-white ring-offset-1 scale-110' : '',
                            isSquare && !compact ? 'ring-2 ring-yellow-400' : '',
                        ].join(' ')}
                    >
                        {!compact && num <= 99 ? num : ''}
                    </div>
                )
            })}
        </div>
    )
}

// ─── SimulationTab ────────────────────────────────────────────────────────────

function SimulationTab() {
    const [n, setN] = useState(36)
    const [nInput, setNInput] = useState('36')
    const [bulbs, setBulbs] = useState(() => new Array(36).fill(false))
    const [step, setStep] = useState(0)
    const [active, setActive] = useState([])
    const [running, setRunning] = useState(false)
    const [done, setDone] = useState(false)
    const intervalRef = useRef(null)

    const reset = useCallback((newN) => {
        clearInterval(intervalRef.current)
        setRunning(false)
        setBulbs(new Array(newN).fill(false))
        setStep(0)
        setActive([])
        setDone(false)
    }, [])

    const applyStep = useCallback((currentBulbs, k) => {
        const next = [...currentBulbs]
        const affected = []
        for (let i = k - 1; i < next.length; i += k) {
            next[i] = !next[i]
            affected.push(i + 1)
        }
        return { next, affected }
    }, [])

    const stepForward = useCallback(() => {
        if (step >= n) return
        const k = step + 1
        setBulbs(prev => {
            const { next, affected } = applyStep(prev, k)
            setActive(affected)
            return next
        })
        setStep(k)
        if (k === n) setDone(true)
    }, [step, n, applyStep])

    const runAll = useCallback(() => {
        if (running || done) return
        setRunning(true)
        let k = step
        intervalRef.current = setInterval(() => {
            k++
            setBulbs(prev => {
                const { next, affected } = applyStep(prev, k)
                setActive(affected)
                return next
            })
            setStep(k)
            if (k >= n) {
                clearInterval(intervalRef.current)
                setRunning(false)
                setDone(true)
            }
        }, Math.max(30, 300 - n * 2))
    }, [running, done, step, n, applyStep])

    const stopRun = useCallback(() => {
        clearInterval(intervalRef.current)
        setRunning(false)
    }, [])

    const applyN = () => {
        const val = parseInt(nInput)
        if (!val || val < 4 || val > 400) return
        setN(val)
        reset(val)
    }

    const blueCount = bulbs.filter(Boolean).length
    const redCount = bulbs.length - blueCount
    const expectedSq = floorSqrt(n)
    const progress = step / n

    return (
        <div className="space-y-5">
            {/* controls */}
            <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-4">
                <div className="flex flex-wrap items-end gap-3">
                    <div>
                        <label className="block text-xs font-semibold text-slate-500 mb-1">Số bóng <InlineMath math="n" /></label>
                        <input
                            type="number" min="4" max="400"
                            value={nInput}
                            onChange={e => setNInput(e.target.value)}
                            className="w-24 border border-slate-300 rounded-lg px-2 py-1.5 text-sm"
                        />
                    </div>
                    <button onClick={applyN} className="px-3 py-1.5 rounded-lg bg-slate-700 hover:bg-slate-800 text-white text-sm font-medium">
                        Đặt lại
                    </button>
                    <div className="h-8 w-px bg-slate-200" />
                    <button
                        onClick={stepForward}
                        disabled={done || running}
                        className="px-4 py-1.5 rounded-lg bg-emerald-600 hover:bg-emerald-700 disabled:opacity-40 text-white text-sm font-medium"
                    >
                        Bước {step + 1} →
                    </button>
                    {!running ? (
                        <button
                            onClick={runAll}
                            disabled={done}
                            className="px-4 py-1.5 rounded-lg bg-sky-600 hover:bg-sky-700 disabled:opacity-40 text-white text-sm font-medium"
                        >
                            ▶ Chạy hết
                        </button>
                    ) : (
                        <button onClick={stopRun} className="px-4 py-1.5 rounded-lg bg-red-500 hover:bg-red-600 text-white text-sm font-medium">
                            ⏸ Dừng
                        </button>
                    )}
                    <button
                        onClick={() => reset(n)}
                        className="px-3 py-1.5 rounded-lg border border-slate-300 hover:bg-slate-50 text-slate-600 text-sm"
                    >
                        ↺ Reset
                    </button>
                </div>

                {/* progress bar */}
                <div className="mt-3">
                    <div className="flex justify-between text-xs text-slate-500 mb-1">
                        <span>Bước {step} / {n}</span>
                        <span>{Math.round(progress * 100)}%</span>
                    </div>
                    <div className="h-2 bg-slate-100 rounded-full overflow-hidden">
                        <div
                            className="h-full bg-emerald-500 rounded-full transition-all duration-100"
                            style={{ width: `${progress * 100}%` }}
                        />
                    </div>
                </div>
            </div>

            {/* step info */}
            {step > 0 && step <= n && (
                <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm">
                    <span className="font-bold text-emerald-700">Bước {step}:</span>{' '}
                    <span className="text-slate-700">Đổi màu các bóng số là bội của {step}:</span>{' '}
                    <span className="font-mono text-emerald-800">{active.slice(0, 20).join(', ')}{active.length > 20 ? ' ...' : ''}</span>
                    <span className="ml-2 text-slate-500">({active.length} bóng)</span>
                </div>
            )}

            {/* bulb grid */}
            <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-4">
                <div className="flex items-center gap-4 mb-3 text-xs text-slate-500">
                    <span className="flex items-center gap-1"><span className="w-3 h-3 rounded-full bg-red-400 inline-block" /> Đỏ ({redCount})</span>
                    <span className="flex items-center gap-1"><span className="w-3 h-3 rounded-full bg-sky-500 inline-block" /> Xanh ({blueCount})</span>
                    {!done && <span className="flex items-center gap-1"><span className="w-3 h-3 rounded-full bg-white ring-2 ring-yellow-400 inline-block" /> Số chính phương (viền vàng)</span>}
                </div>
                <BulbGrid bulbs={bulbs} activeMultiples={active} n={n} compact={n > 100} />
            </div>

            {/* result */}
            {done && (
                <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-5 space-y-4">
                    <h3 className="font-bold text-slate-800 text-base">Kết quả sau {n} bước</h3>
                    <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                        {[
                            { label: 'Số chính phương ≤ n', val: expectedSq, color: 'text-emerald-700 bg-emerald-50 border-emerald-200' },
                            { label: 'Bóng xanh thực tế', val: blueCount, color: 'text-sky-700 bg-sky-50 border-sky-200' },
                            { label: 'Bóng đỏ', val: redCount, color: 'text-red-700 bg-red-50 border-red-200' },
                            { label: 'Khớp lý thuyết?', val: blueCount === expectedSq ? '✅ Đúng' : '❌ Sai', color: 'text-slate-700 bg-slate-50 border-slate-200' },
                        ].map(({ label, val, color }) => (
                            <div key={label} className={`rounded-xl border p-3 text-center ${color}`}>
                                <div className="text-xs font-medium opacity-70">{label}</div>
                                <div className="text-2xl font-bold mt-1">{val}</div>
                            </div>
                        ))}
                    </div>
                    <div className="rounded-xl bg-slate-50 border border-slate-200 p-3 text-sm">
                        <BlockMath math={`P(\\text{đỏ}) = \\frac{${redCount}}{${n}}${gcd(redCount, n) > 1 ? ` = \\frac{${redCount / gcd(redCount, n)}}{${n / gcd(redCount, n)}}` : ''}, \\quad P(\\text{xanh}) = \\frac{${blueCount}}{${n}}${gcd(blueCount, n) > 1 ? ` = \\frac{${blueCount / gcd(blueCount, n)}}{${n / gcd(blueCount, n)}}` : ''}`} />
                    </div>
                    <p className="text-xs text-slate-500 italic">
                        Bóng xanh = các số chính phương: {Array.from({ length: expectedSq }, (_, i) => (i + 1) ** 2).join(', ')}
                    </p>
                </div>
            )}
        </div>
    )
}

// ─── PracticeTab ──────────────────────────────────────────────────────────────

const SUBQUESTION_TEMPLATES = [
    {
        id: 'basic-prob',
        label: 'Tính xác suất (cơ bản)',
        gen: ({ n, sq, type }) => {
            const askRed = Math.random() < 0.5
            const count = askRed ? n - sq : sq
            const [num, den] = simplify(count, n)
            const state = askRed ? type.stateA : type.stateB
            return {
                question: `Tính xác suất ${type.noun} được chọn ở trạng thái *${state}*.`,
                answer: `${num}/${den}`,
                solution: [
                    `**Nhận ra cấu trúc:** ${type.noun} số $j$ bị đổi trạng thái $d(j)$ lần (số ước dương của $j$).`,
                    `**Trạng thái cuối:** ${type.noun} $j$ ở trạng thái *${type.stateB}* $\\iff$ $d(j)$ lẻ $\\iff$ $j$ là số chính phương.`,
                    `**Đếm:** Số chính phương $\\leq ${n}$: $\\lfloor\\sqrt{${n}}\\rfloor = ${sq}$.`,
                    `**Số ${type.noun} ${type.stateB}:** $${sq}$. Số ${type.noun} ${type.stateA}: $${n} - ${sq} = ${n - sq}$.`,
                    `**Xác suất:** $P(${state}) = \\dfrac{${count}}{${n}}${count !== num ? ` = \\dfrac{${num}}{${den}}` : ''}$.`,
                ],
                katexAnswer: `P = \\dfrac{${num}}{${den}}`
            }
        }
    },
    {
        id: 'mn-sum',
        label: 'Tính m + n (tối giản)',
        gen: ({ n, sq, type }) => {
            const red = n - sq
            const [num, den] = simplify(red, n)
            return {
                question: `Ghi $P(${type.stateA}) = m/n$ phân số tối giản. Tính $m + n$.`,
                answer: `${num + den}`,
                solution: [
                    `**Bóng ${type.stateA} = bóng không phải số chính phương.**`,
                    `Số ${type.noun} ${type.stateA}: $${n} - ${sq} = ${red}$.`,
                    `$P(${type.stateA}) = \\dfrac{${red}}{${n}}`.concat(gcd(red, n) > 1 ? ` = \\dfrac{${num}}{${den}}` : '') + '`.',
                    `$m + n = ${num} + ${den} = \\boxed{${num + den}}$.`,
                ],
                katexAnswer: `m + n = ${num + den}`
            }
        }
    },
    {
        id: 'conditional',
        label: 'Xác suất có điều kiện',
        gen: ({ n, sq }) => {
            // P(odd | blue) = count of odd perfect squares / sq
            const oddSq = Math.ceil(sq / 2)
            const [num, den] = simplify(oddSq, sq)
            return {
                question: `Biết bóng được chọn đang *xanh*, tính xác suất nó mang số *lẻ*.`,
                answer: `${num}/${den}`,
                solution: [
                    `Bóng xanh = số chính phương $\\leq ${n}$: có $${sq}$ bóng.`,
                    `Số chính phương **lẻ**: $m^2$ lẻ $\\iff$ $m$ lẻ. Với $m \\leq ${sq}$, số $m$ lẻ = $\\lceil ${sq}/2 \\rceil = ${oddSq}$.`,
                    `$P(\\text{lẻ} \\mid \\text{xanh}) = \\dfrac{${oddSq}}{${sq}}${oddSq !== num ? ` = \\dfrac{${num}}{${den}}` : ''}$.`,
                ],
                katexAnswer: `P = \\dfrac{${num}}{${den}}`
            }
        }
    },
    {
        id: 'divisible3',
        label: 'Bội của 3 | điều kiện xanh',
        gen: ({ n, sq }) => {
            const div3sq = Math.floor(sq / 3)
            const [num, den] = simplify(div3sq, sq)
            return {
                question: `Biết bóng được chọn đang *xanh*, tính xác suất nó có số chia hết cho $3$.`,
                answer: `${num}/${den}`,
                solution: [
                    `Bóng xanh = số chính phương $\\leq ${n}$: có $${sq}$ bóng.`,
                    `$m^2 \\divisible 3 \\iff m \\divisible 3$. Số $m \\leq ${sq}$ chia hết cho $3$: $\\lfloor ${sq}/3 \\rfloor = ${div3sq}$.`,
                    `$P(\\text{bội 3} \\mid \\text{xanh}) = \\dfrac{${div3sq}}{${sq}}${div3sq !== num ? ` = \\dfrac{${num}}{${den}}` : ''}$.`,
                ],
                katexAnswer: `P = \\dfrac{${num}}{${den}}`
            }
        }
    },
]

function PracticeTab() {
    const [problem, setProblem] = useState(() => makeRandomProblem())
    const [subQ, setSubQ] = useState(null)
    const [userAns, setUserAns] = useState('')
    const [checked, setChecked] = useState(false)
    const [showSol, setShowSol] = useState(false)

    const generateNew = () => {
        const p = makeRandomProblem()
        setProblem(p)
        const tmpl = SUBQUESTION_TEMPLATES[Math.floor(Math.random() * SUBQUESTION_TEMPLATES.length)]
        setSubQ(tmpl.gen(p))
        setUserAns('')
        setChecked(false)
        setShowSol(false)
    }

    useEffect(() => {
        generateNew()
    }, []) // eslint-disable-line

    const checkAnswer = () => {
        setChecked(true)
    }

    const isCorrect = checked && subQ && userAns.trim().replace(/\s/g, '') === subQ.answer.replace(/\s/g, '')

    const { type, n, sq } = problem

    return (
        <div className="space-y-5">
            {/* header */}
            <div className="flex items-center justify-between">
                <div>
                    <h2 className="font-bold text-slate-800 text-base">Bài tập ngẫu nhiên</h2>
                    <p className="text-xs text-slate-500 mt-0.5">Mỗi lần nhấn "Đề mới" sẽ tạo bài khác — số liệu, dạng, câu hỏi đều thay đổi.</p>
                </div>
                <button
                    onClick={generateNew}
                    className="px-4 py-2 rounded-xl bg-violet-600 hover:bg-violet-700 text-white text-sm font-semibold shadow-sm"
                >
                    ⚡ Đề mới
                </button>
            </div>

            {/* problem statement */}
            <div className="rounded-2xl border border-violet-200 bg-violet-50 p-5 space-y-3">
                <div className="flex items-center gap-2">
                    <span className="text-xs font-bold bg-violet-600 text-white px-2 py-0.5 rounded-full">ĐỀ BÀI</span>
                    <span className="text-xs font-medium text-violet-700">{type.label} · n = {n}</span>
                </div>
                <p className="text-sm leading-relaxed text-slate-800">
                    Có <strong>{n}</strong> {type.noun} đánh số <InlineMath math="1" /> đến <InlineMath math={`${n}`} />,
                    tất cả ban đầu ở trạng thái <strong>{type.startState}</strong>.
                    Thực hiện <strong>{n}</strong> bước: bước thứ <InlineMath math="k" /> đổi trạng thái
                    ({type.stateA} ↔ {type.stateB}) của mọi {type.noun} có số là bội của <InlineMath math="k" />.
                    Sau <strong>{n}</strong> bước, chọn ngẫu nhiên một {type.noun}.
                </p>
                {subQ && (
                    <div className="bg-white border border-violet-200 rounded-xl p-3">
                        <span className="text-xs font-bold text-violet-600">CÂU HỎI:</span>
                        <p className="text-sm text-slate-700 mt-1">{subQ.question}</p>
                    </div>
                )}
            </div>

            {/* hint */}
            <details className="rounded-xl border border-slate-200 bg-white">
                <summary className="cursor-pointer px-4 py-2.5 text-sm font-medium text-slate-600 select-none">
                    💡 Gợi ý (nhấn để mở)
                </summary>
                <div className="px-4 pb-3 space-y-2 text-sm text-slate-600">
                    <p>Bước 1: {type.noun} số <InlineMath math="j" /> bị đổi trạng thái <InlineMath math="d(j)" /> lần (= số ước dương của <InlineMath math="j" />).</p>
                    <p>Bước 2: Trạng thái cuối = <strong>{type.stateB}</strong> ⟺ <InlineMath math="d(j)" /> lẻ ⟺ <InlineMath math="j" /> là số chính phương.</p>
                    <p>Bước 3: Số chính phương ≤ <InlineMath math={`${n}`} /> = <InlineMath math={`\\lfloor\\sqrt{${n}}\\rfloor = ${sq}`} />.</p>
                </div>
            </details>

            {/* answer input */}
            {subQ && (
                <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-4 space-y-3">
                    <label className="block text-sm font-semibold text-slate-700">Nhập đáp số của bạn:</label>
                    <div className="flex gap-3">
                        <input
                            type="text"
                            placeholder={`Ví dụ: ${subQ.answer}`}
                            value={userAns}
                            onChange={e => { setUserAns(e.target.value); setChecked(false) }}
                            className="flex-1 border border-slate-300 rounded-xl px-3 py-2 text-sm font-mono"
                        />
                        <button
                            onClick={checkAnswer}
                            disabled={!userAns.trim()}
                            className="px-4 py-2 rounded-xl bg-violet-600 hover:bg-violet-700 disabled:opacity-40 text-white text-sm font-semibold"
                        >
                            Kiểm tra
                        </button>
                    </div>
                    {checked && (
                        <div className={`rounded-xl px-4 py-3 text-sm font-medium ${isCorrect ? 'bg-green-50 border border-green-200 text-green-800' : 'bg-red-50 border border-red-200 text-red-800'}`}>
                            {isCorrect ? '✅ Đúng rồi! Xuất sắc!' : `❌ Chưa đúng. Đáp án: ${subQ.answer}`}
                        </div>
                    )}
                </div>
            )}

            {/* solution */}
            {subQ && (
                <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-4 space-y-3">
                    <button
                        onClick={() => setShowSol(s => !s)}
                        className="w-full text-left flex items-center justify-between text-sm font-semibold text-slate-700"
                    >
                        <span>📖 Lời giải chi tiết</span>
                        <span className="text-slate-400">{showSol ? '▲' : '▼'}</span>
                    </button>
                    {showSol && (
                        <div className="space-y-3 pt-2 border-t border-slate-100">
                            <div className="rounded-xl bg-slate-50 border border-slate-200 p-3 text-sm space-y-2">
                                {subQ.solution.map((line, i) => (
                                    <p key={i} className="text-slate-700 leading-relaxed" dangerouslySetInnerHTML={{ __html: line.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>') }} />
                                ))}
                            </div>
                            <div className="rounded-xl bg-emerald-50 border border-emerald-200 p-3 text-center">
                                <p className="text-xs font-bold text-emerald-600 mb-1">ĐÁP SỐ</p>
                                <BlockMath math={subQ.katexAnswer} />
                            </div>
                            {/* step-by-step divisor table */}
                            <StepTableForN n={n} sq={sq} type={type} />
                        </div>
                    )}
                </div>
            )}
        </div>
    )
}

function StepTableForN({ n, sq, type }) {
    const samples = useMemo(() => {
        const picks = []
        // pick first 3 perfect squares + 3 non-squares near them
        for (let m = 1; m <= Math.min(sq, 4); m++) {
            picks.push(m * m)
            if (m * m + 1 <= n) picks.push(m * m + 1)
        }
        return [...new Set(picks)].slice(0, 8).sort((a, b) => a - b)
    }, [n, sq])

    return (
        <div>
            <p className="text-xs font-semibold text-slate-500 mb-2">Bảng kiểm tra nhanh (mẫu {samples.length} số):</p>
            <div className="overflow-x-auto">
                <table className="w-full text-xs border-collapse">
                    <thead>
                        <tr className="bg-slate-700 text-white">
                            <th className="px-2 py-1.5 text-left">Số j</th>
                            <th className="px-2 py-1.5 text-left">Ước của j</th>
                            <th className="px-2 py-1.5">d(j)</th>
                            <th className="px-2 py-1.5">Chẵn/Lẻ</th>
                            <th className="px-2 py-1.5">Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        {samples.map((j, idx) => {
                            const divs = getDivisors(j)
                            const dk = divs.length
                            const isOdd = dk % 2 === 1
                            return (
                                <tr key={j} className={idx % 2 === 0 ? 'bg-white' : 'bg-slate-50'}>
                                    <td className="px-2 py-1 font-mono font-bold">{j}{isPerfectSquare(j) ? ' ★' : ''}</td>
                                    <td className="px-2 py-1 font-mono text-slate-500">{divs.join(', ')}</td>
                                    <td className="px-2 py-1 text-center font-bold">{dk}</td>
                                    <td className="px-2 py-1 text-center">{isOdd ? '🔴 Lẻ' : '⚪ Chẵn'}</td>
                                    <td className="px-2 py-1 text-center font-semibold">
                                        <span className={isOdd ? 'text-sky-600' : 'text-red-500'}>
                                            {isOdd ? type.stateB : type.stateA}
                                        </span>
                                    </td>
                                </tr>
                            )
                        })}
                    </tbody>
                </table>
            </div>
            <p className="text-xs text-slate-400 mt-1">★ = số chính phương · d(j) lẻ → trạng thái đổi</p>
        </div>
    )
}

// ─── ExploreTab ───────────────────────────────────────────────────────────────

function ExploreTab() {
    const [input, setInput] = useState('36')
    const [number, setNumber] = useState(36)

    const divs = useMemo(() => getDivisors(number), [number])
    const dk = divs.length
    const isOdd = dk % 2 === 1
    const factors = useMemo(() => factorize(number), [number])

    // pairing table
    const pairs = useMemo(() => {
        const seen = new Set()
        const rows = []
        for (const a of divs) {
            if (seen.has(a)) continue
            const b = number / a
            seen.add(a)
            seen.add(b)
            rows.push({ a, b, isSame: a === b })
        }
        return rows
    }, [divs, number])

    // formula
    const factorStr = Object.entries(factors)
        .map(([p, e]) => e === 1 ? p : `${p}^{${e}}`)
        .join(' \\cdot ')
    const formulaStr = Object.values(factors).map(e => `(${e}+1)`).join(' \\cdot ')
    const formulaVal = Object.values(factors).map(e => e + 1).join(' \\cdot ')

    const applyNumber = () => {
        const v = parseInt(input)
        if (!v || v < 1 || v > 10000) return
        setNumber(v)
    }

    return (
        <div className="space-y-5">
            <div className="rounded-2xl border border-amber-200 bg-amber-50 p-4">
                <p className="text-sm text-amber-800 font-medium">
                    Nhập một số bất kỳ để xem phân tích ước số, bảng ghép cặp, và màu bóng đèn trong Lucky Light.
                </p>
            </div>

            {/* input */}
            <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-4">
                <div className="flex gap-3 items-end">
                    <div>
                        <label className="block text-xs font-semibold text-slate-500 mb-1">Số cần phân tích</label>
                        <input
                            type="number" min="1" max="10000"
                            value={input}
                            onChange={e => setInput(e.target.value)}
                            onKeyDown={e => e.key === 'Enter' && applyNumber()}
                            className="w-36 border border-slate-300 rounded-xl px-3 py-2 text-base font-mono"
                        />
                    </div>
                    <button onClick={applyNumber} className="px-4 py-2 rounded-xl bg-amber-500 hover:bg-amber-600 text-white text-sm font-semibold">
                        Phân tích
                    </button>
                </div>
            </div>

            {/* result cards */}
            <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                {[
                    { label: 'Số cần phân tích', val: number, color: 'text-slate-800 bg-slate-50 border-slate-200' },
                    { label: 'Số ước dương d(n)', val: dk, color: 'text-amber-700 bg-amber-50 border-amber-200' },
                    { label: 'd(n) chẵn hay lẻ?', val: isOdd ? 'Lẻ' : 'Chẵn', color: isOdd ? 'text-sky-700 bg-sky-50 border-sky-200' : 'text-red-700 bg-red-50 border-red-200' },
                    { label: 'Màu bóng đèn', val: isOdd ? '🔵 Xanh' : '🔴 Đỏ', color: isOdd ? 'text-sky-700 bg-sky-50 border-sky-200' : 'text-red-700 bg-red-50 border-red-200' },
                ].map(({ label, val, color }) => (
                    <div key={label} className={`rounded-xl border p-3 text-center ${color}`}>
                        <div className="text-xs font-medium opacity-70">{label}</div>
                        <div className="text-2xl font-bold mt-1">{val}</div>
                    </div>
                ))}
            </div>

            {/* factorization */}
            <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-4 space-y-3">
                <h3 className="font-bold text-slate-700 text-sm">Phân tích thừa số nguyên tố & Công thức d(n)</h3>
                {Object.keys(factors).length > 0 ? (
                    <BlockMath math={`${number} = ${factorStr} \\Rightarrow d(${number}) = ${formulaStr} = ${formulaVal} = ${dk}`} />
                ) : (
                    <BlockMath math={`d(1) = 1`} />
                )}
                <div className={`rounded-xl px-4 py-2 text-sm font-medium text-center ${isOdd ? 'bg-sky-50 text-sky-800 border border-sky-200' : 'bg-red-50 text-red-800 border border-red-200'}`}>
                    {isOdd
                        ? `d(${number}) = ${dk} là số LẺ → ${number} là số chính phương → bóng XANH`
                        : `d(${number}) = ${dk} là số CHẴN → ${number} không phải số chính phương → bóng ĐỎ`
                    }
                </div>
            </div>

            {/* pairing table */}
            <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-4 space-y-3">
                <h3 className="font-bold text-slate-700 text-sm">Bảng ghép cặp ước số</h3>
                <p className="text-xs text-slate-500">
                    Với mỗi ước $a$, ta ghép $(a, n/a)$. Cặp "trùng" ($a = n/a$) xảy ra khi $a^2 = n$.
                </p>
                <div className="overflow-x-auto">
                    <table className="w-full text-sm border-collapse">
                        <thead>
                            <tr className="bg-slate-700 text-white text-xs">
                                <th className="px-3 py-2">Ước $a$</th>
                                <th className="px-3 py-2">Ước $n/a$</th>
                                <th className="px-3 py-2">$a \times n/a$</th>
                                <th className="px-3 py-2">Loại cặp</th>
                            </tr>
                        </thead>
                        <tbody>
                            {pairs.map(({ a, b, isSame }, idx) => (
                                <tr key={idx} className={[
                                    idx % 2 === 0 ? 'bg-white' : 'bg-slate-50',
                                    isSame ? 'font-bold' : '',
                                ].join(' ')}>
                                    <td className="px-3 py-1.5 text-center font-mono">{a}</td>
                                    <td className="px-3 py-1.5 text-center font-mono">{b}</td>
                                    <td className="px-3 py-1.5 text-center text-slate-500">{a} × {b} = {a * b}</td>
                                    <td className="px-3 py-1.5 text-center">
                                        {isSame
                                            ? <span className="px-2 py-0.5 rounded-full bg-yellow-100 text-yellow-800 text-xs font-bold">★ Tự ghép (a² = n)</span>
                                            : <span className="text-slate-400 text-xs">Cặp phân biệt</span>
                                        }
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
                <div className="rounded-xl bg-slate-50 border border-slate-200 p-3 text-xs text-slate-600">
                    <strong>Tổng kết:</strong> {pairs.filter(p => !p.isSame).length} cặp phân biệt
                    {pairs.some(p => p.isSame) ? ` + 1 ước tự ghép (★ = ${Math.sqrt(number)})` : ''}.
                    Tổng số ước = {pairs.filter(p => !p.isSame).length} × 2 {pairs.some(p => p.isSame) ? '+ 1' : ''} = <strong>{dk}</strong> ({isOdd ? 'lẻ' : 'chẵn'}).
                </div>
            </div>

            {/* all divisors */}
            <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-4 space-y-2">
                <h3 className="font-bold text-slate-700 text-sm">Danh sách ước số ({dk} ước)</h3>
                <div className="flex flex-wrap gap-1.5">
                    {divs.map(d => (
                        <span key={d} className={`px-2 py-0.5 rounded-full text-xs font-mono font-semibold border ${d * d === number ? 'bg-yellow-100 text-yellow-800 border-yellow-300' : 'bg-slate-100 text-slate-600 border-slate-200'}`}>
                            {d}{d * d === number ? ' ★' : ''}
                        </span>
                    ))}
                </div>
                <p className="text-xs text-slate-400">★ = ước trung tâm (bình phương = {number})</p>
            </div>

            {/* quick compare */}
            <div className="rounded-2xl border border-slate-200 bg-white shadow-sm p-4 space-y-3">
                <h3 className="font-bold text-slate-700 text-sm">So sánh với các số lân cận</h3>
                <div className="overflow-x-auto">
                    <table className="w-full text-xs border-collapse">
                        <thead>
                            <tr className="bg-slate-700 text-white">
                                <th className="px-2 py-1.5">Số j</th>
                                <th className="px-2 py-1.5">d(j)</th>
                                <th className="px-2 py-1.5">Chẵn/Lẻ</th>
                                <th className="px-2 py-1.5">SCP?</th>
                                <th className="px-2 py-1.5">Màu</th>
                            </tr>
                        </thead>
                        <tbody>
                            {Array.from({ length: 9 }, (_, i) => number - 4 + i)
                                .filter(j => j >= 1)
                                .map((j, idx) => {
                                    const dj = dFormula(j)
                                    const odd = dj % 2 === 1
                                    const sq = isPerfectSquare(j)
                                    return (
                                        <tr key={j} className={[
                                            j === number ? 'bg-amber-50 font-bold' : idx % 2 === 0 ? 'bg-white' : 'bg-slate-50',
                                        ].join(' ')}>
                                            <td className="px-2 py-1 text-center font-mono">{j}{j === number ? ' ◀' : ''}</td>
                                            <td className="px-2 py-1 text-center">{dj}</td>
                                            <td className="px-2 py-1 text-center">{odd ? '🔴 Lẻ' : '⚪ Chẵn'}</td>
                                            <td className="px-2 py-1 text-center">{sq ? '✅' : '—'}</td>
                                            <td className="px-2 py-1 text-center">{odd ? '🔵' : '🔴'}</td>
                                        </tr>
                                    )
                                })}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    )
}

// ─── HeaderHero ───────────────────────────────────────────────────────────────

function HeaderHero({ activeTab, setActiveTab }) {
    return (
        <div className="rounded-2xl overflow-hidden shadow-md mb-6">
            <div className="bg-slate-900 px-6 py-4">
                <div className="flex items-center gap-3">
                    <span className="text-3xl">💡</span>
                    <div>
                        <h1 className="text-white font-extrabold text-lg leading-tight">
                            Lucky Light Studio — Ước Số & Số Chính Phương
                        </h1>
                        <p className="text-slate-400 text-xs mt-0.5">
                            Mô phỏng · Luyện tập ngẫu nhiên · Khám phá ước số — Chuyên đề dự đoán đề thi ĐGNL & HSG
                        </p>
                    </div>
                </div>
            </div>
            <div className="bg-slate-800 flex gap-1 px-4 py-2">
                {TABS.map(t => {
                    const ac = ACCENT[t.accent]
                    const isActive = activeTab === t.id
                    return (
                        <button
                            key={t.id}
                            onClick={() => setActiveTab(t.id)}
                            className={[
                                'px-4 py-1.5 rounded-lg text-sm font-semibold transition-all',
                                isActive ? ac.tab : `text-slate-400 hover:text-slate-200 hover:bg-slate-700`,
                            ].join(' ')}
                        >
                            {t.short}
                        </button>
                    )
                })}
            </div>
        </div>
    )
}

// ─── Root ─────────────────────────────────────────────────────────────────────

export default function LuckyLightStudioPage() {
    const [activeTab, setActiveTab] = useState('simulate')

    return (
        <div className="max-w-4xl mx-auto px-4 py-6">
            <HeaderHero activeTab={activeTab} setActiveTab={setActiveTab} />
            {activeTab === 'simulate' && <SimulationTab />}
            {activeTab === 'practice' && <PracticeTab />}
            {activeTab === 'explore' && <ExploreTab />}
        </div>
    )
}
