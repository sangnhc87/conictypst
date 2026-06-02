/**
 * MoiTruongPage.jsx — Trang giải toán tương tác: Di chuyển qua nhiều môi trường có vận tốc
 *
 * Hỗ trợ 3 mô hình tương đương các bài toán trong typst:
 *   • Case 1: Dọc biên rồi rẽ vào (1 Dải + Đường biên)
 *   • Case 2: Hai môi trường song song (1 ranh giới)
 *   • Case 3: Ba môi trường song song (2 ranh giới)
 *
 * CẢI TIẾN & SỬA LỖI THEO YÊU CẦU:
 *   1. Sửa lỗi nhãn B/D góc trên bên phải bị khuất hoặc đè (dùng textAnchor="end" và dịch trái).
 *   2. Thay thế tất cả \frac thành \dfrac trong các biểu thức LaTeX để hiển thị cao, to, rõ ràng hơn.
 *   3. Trình bày chi tiết cả 2 cách giải đồng thời (không cần tab ẩn/hiện cách giải) cho Case 2 và Case 3.
 */

import React, { useState, useMemo } from 'react'
import { InlineMath, BlockMath } from 'react-katex'
import 'katex/dist/katex.min.css'
import { fmt, solveCase1, solveCase2, solveCase3 } from './utils/moitruong.js'

// ─── SVG Gradients Defs ──────────────────────────────────────────────
const SVGDefs = () => (
    <defs>
        {/* Cát */}
        <linearGradient id="grad-sand" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor="#fff8e1" />
            <stop offset="100%" stopColor="#ffe082" />
        </linearGradient>
        {/* Nước biển */}
        <linearGradient id="grad-water" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor="#e3f2fd" />
            <stop offset="100%" stopColor="#64b5f6" />
        </linearGradient>
        {/* Cỏ */}
        <linearGradient id="grad-grass" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor="#e8f5e9" />
            <stop offset="100%" stopColor="#81c784" />
        </linearGradient>
        {/* Đầm lầy */}
        <linearGradient id="grad-swamp" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor="#efebe9" />
            <stop offset="100%" stopColor="#a1887f" />
        </linearGradient>
        {/* Sương mù */}
        <linearGradient id="grad-fog" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor="#f5f5f5" stopOpacity="0.9" />
            <stop offset="100%" stopColor="#cfd8dc" stopOpacity="0.4" />
        </linearGradient>
        {/* Tuyết */}
        <linearGradient id="grad-snow" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor="#ffffff" />
            <stop offset="100%" stopColor="#eceff1" />
        </linearGradient>
        {/* Đất cát cứng */}
        <linearGradient id="grad-soil" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor="#fbe9e7" />
            <stop offset="100%" stopColor="#ffab91" />
        </linearGradient>
        {/* Đường quốc lộ */}
        <linearGradient id="grad-road" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor="#424242" />
            <stop offset="100%" stopColor="#212121" />
        </linearGradient>
    </defs>
)

const ENV_THEMES = {
    sand: { grad: 'url(#grad-sand)', stroke: '#ffd54f', text: 'text-amber-800', label: 'Bãi cát' },
    water: { grad: 'url(#grad-water)', stroke: '#42a5f5', text: 'text-blue-800', label: 'Mặt biển' },
    grass: { grad: 'url(#grad-grass)', stroke: '#66bb6a', text: 'text-green-800', label: 'Thảm cỏ' },
    swamp: { grad: 'url(#grad-swamp)', stroke: '#8d6e63', text: 'text-amber-950', label: 'Đầm lầy' },
    fog: { grad: 'url(#grad-fog)', stroke: '#b0bec5', text: 'text-slate-700', label: 'Sương mù' },
    snow: { grad: 'url(#grad-snow)', stroke: '#b0ccdb', text: 'text-slate-800', label: 'Tuyết xốp' },
    soil: { grad: 'url(#grad-soil)', stroke: '#ff8a65', text: 'text-orange-950', label: 'Đất đá' },
}

// ─── Helpers ────────────────────────────────────────────────────────
function SectionCard({ children, className = '' }) {
    return <div className={`bg-white rounded-2xl border border-slate-200 shadow-sm p-5 ${className}`}>{children}</div>
}

function StepBadge({ n, color = 'bg-slate-700' }) {
    return <span className={`inline-flex items-center justify-center w-6 h-6 rounded-full ${color} text-white text-xs font-bold shrink-0`}>{n}</span>
}

function NumberInput({ label, value, min, max, step = 1, onChange, accent = 'blue', unit = '' }) {
    return (
        <div className="flex items-center justify-between gap-3 text-sm">
            <span className="font-semibold text-slate-700 w-16 shrink-0">{label}</span>
            <div className="flex items-center gap-1.5">
                <button
                    type="button"
                    onClick={() => onChange(Math.max(min, +(value - step).toFixed(4)))}
                    className="w-7 h-7 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50 text-sm"
                >−</button>
                <input
                    type="number" min={min} max={max} step={step} value={value}
                    onChange={e => {
                        const v = parseFloat(e.target.value)
                        if (!isNaN(v)) onChange(Math.max(min, Math.min(max ?? 1e9, v)))
                    }}
                    className={`w-20 text-center border border-slate-300 rounded-lg py-1 font-bold text-slate-800 bg-white text-sm focus:outline-none focus:ring-2 focus:ring-${accent}-400`}
                />
                <button
                    type="button"
                    onClick={() => onChange(Math.min(max ?? 1e9, +(value + step).toFixed(4)))}
                    className="w-7 h-7 rounded-lg bg-white border border-slate-300 text-slate-600 font-bold hover:bg-slate-50 text-sm"
                >+</button>
            </div>
            {unit && <span className="text-xs text-slate-400 w-16 text-right truncate shrink-0">{unit}</span>}
        </div>
    )
}

export default function MoiTruongPage({ onNavigate }) {
    const [tab, setTab] = useState(3) // Mặc định mở Case 3

    // State cho Case 1
    const [c1W, setC1W] = useState(30)
    const [c1h, setC1h] = useState(40)
    const [c1v1, setC1v1] = useState(80)
    const [c1v2, setC1v2] = useState(40)
    const [c1Unit, setC1Unit] = useState('km/h')
    const [c1DistUnit, setC1DistUnit] = useState('km')
    const [c1Vehicle, setC1Vehicle] = useState('🚗')

    // State cho Case 2
    const [c2W, setC2W] = useState(7)
    const [c2h1, setC2h1] = useState(3)
    const [c2h2, setC2h2] = useState(4)
    const [c2v1, setC2v1] = useState(5)
    const [c2v2, setC2v2] = useState(2)
    const [c2Env1, setC2Env1] = useState('soil')
    const [c2Env2, setC2Env2] = useState('sand')
    const [c2Unit, setC2Unit] = useState('m/s')
    const [c2DistUnit, setC2DistUnit] = useState('m')
    const [c2Vehicle, setC2Vehicle] = useState('🐱')

    // State cho Case 3
    const [c3W, setC3W] = useState(15)
    const [c3h1, setC3h1] = useState(4)
    const [c3h2, setC3h2] = useState(6)
    const [c3h3, setC3h3] = useState(2)
    const [c3v1, setC3v1] = useState(10)
    const [c3v2, setC3v2] = useState(5)
    const [c3v3, setC3v3] = useState(10)
    const [c3Env1, setC3Env1] = useState('sand')
    const [c3Env2, setC3Env2] = useState('swamp')
    const [c3Env3, setC3Env3] = useState('sand')
    const [c3Unit, setC3Unit] = useState('km/h')
    const [c3DistUnit, setC3DistUnit] = useState('km')
    const [c3TimeUnit, setC3TimeUnit] = useState('giờ')
    const [c3Vehicle, setC3Vehicle] = useState('🚗')

    const [showGhepGiaiThich, setShowGhepGiaiThich] = useState(false)

    // Giải kết quả
    const sol1 = useMemo(() => solveCase1({ W: c1W, h: c1h, v1: c1v1, v2: c1v2 }), [c1W, c1h, c1v1, c1v2])
    const sol2 = useMemo(() => solveCase2({ W: c2W, h1: c2h1, h2: c2h2, v1: c2v1, v2: c2v2 }), [c2W, c2h1, c2h2, c2v1, c2v2])
    const sol3 = useMemo(() => solveCase3({ W: c3W, h1: c3h1, h2: c3h2, h3: c3h3, v1: c3v1, v2: c3v2, v3: c3v3 }), [c3W, c3h1, c3h2, c3h3, c3v1, c3v2, c3v3])

    // Load presets
    const applyPreset1 = p => {
        setC1W(p.W); setC1h(p.h); setC1v1(p.v1); setC1v2(p.v2)
        setC1Vehicle(p.vehicle || '🚗')
        if (p.unit) setC1Unit(p.unit)
        if (p.distUnit) setC1DistUnit(p.distUnit)
    }

    const applyPreset2 = p => {
        setC2W(p.W); setC2h1(p.h1); setC2h2(p.h2); setC2v1(p.v1); setC2v2(p.v2)
        setC2Env1(p.env1); setC2Env2(p.env2); setC2Vehicle(p.vehicle || '🐱')
        if (p.unit) setC2Unit(p.unit)
        if (p.distUnit) setC2DistUnit(p.distUnit)
    }

    const applyPreset3 = p => {
        setC3W(p.W); setC3h1(p.h1); setC3h2(p.h2); setC3h3(p.h3)
        setC3v1(p.v1); setC3v2(p.v2); setC3v3(p.v3)
        setC3Env1(p.env1); setC3Env2(p.env2); setC3Env3(p.env3); setC3Vehicle(p.vehicle || '🚗')
        if (p.unit) setC3Unit(p.unit)
        if (p.distUnit) setC3DistUnit(p.distUnit)
        if (p.timeUnit) setC3TimeUnit(p.timeUnit)
    }

    const [revealedQuestions, setRevealedQuestions] = useState({})
    const toggleRevealQuestion = id => setRevealedQuestions(prev => ({ ...prev, [id]: !prev[id] }))

    // Mệnh đề luyện tập
    const questionsCase1 = useMemo(() => {
        const r = c1v2 / c1v1
        return [
            {
                id: '1a',
                tex: `v_2 < v_1`,
                truth: c1v2 < c1v1,
                explain: `Vận tốc trong môi trường v₂ = ${c1v2} nhỏ hơn trên đường biên v₁ = ${c1v1}. Do đó đi dọc biên giúp tiết kiệm thời gian tổng cộng.`,
            },
            {
                id: '1b',
                tex: `x \\approx ${fmt(sol1.x, 1)} \\text{ ${c1DistUnit}}`,
                truth: true,
                explain: `Đoạn đi dọc biên tối ưu: x = W - \\dfrac{v_2 h}{\\sqrt{v_1^2 - v_2^2}} = ${c1W} - \\dfrac{${c1v2} \\times ${c1h}}{\\sqrt{${c1v1}^2 - ${c1v2}^2}} \\approx ${fmt(sol1.x, 2)} ${c1DistUnit}.`,
            },
            {
                id: '1c',
                tex: `T_{\\min} \\approx ${fmt(sol1.totalTime, 2)} \\text{ giờ}`,
                truth: true,
                explain: `Tổng thời gian tối ưu là t_1 + t_2 = \\dfrac{${fmt(sol1.S1, 2)}}{${c1v1}} + \\dfrac{${fmt(sol1.S2, 2)}}{${c1v2}} \\approx ${fmt(sol1.totalTime, 3)} giờ.`,
            },
        ]
    }, [c1W, c1h, c1v1, c1v2, c1DistUnit, sol1])

    const questionsCase2 = useMemo(() => {
        return [
            {
                id: '2a',
                tex: `\\dfrac{\\sin \\theta_1}{v_1} = \\dfrac{\\sin \\theta_2}{v_2}`,
                truth: true,
                explain: `Hệ thức khúc xạ Snell đảm bảo thời gian di chuyển cực tiểu giữa hai môi trường: \\dfrac{${fmt(sol2.sin1, 3)}}{${c2v1}} \\approx \\dfrac{${fmt(sol2.sin2, 3)}}{${c2v2}} \\approx ${fmt(sol2.sin1 / c2v1, 4)}.`,
            },
            {
                id: '2b',
                tex: `x \\approx ${fmt(sol2.x, 1)} \\text{ ${c2DistUnit}}`,
                truth: true,
                explain: `Độ dịch ngang chặng 1 tối ưu HM = x ≈ ${fmt(sol2.x, 3)} ${c2DistUnit}, là nghiệm duy nhất của đạo hàm T'(x) = 0.`,
            },
            {
                id: '2c',
                tex: `T_{\\min} \\approx ${fmt(sol2.totalTime, 2)} \\text{ giây}`,
                truth: true,
                explain: `Thời gian tối thiểu: \\dfrac{S_1}{v_1} + \\dfrac{S_2}{v_2} \\approx ${fmt(sol2.time1, 2)} + ${fmt(sol2.time2, 2)} = ${fmt(sol2.totalTime, 3)} giây.`,
            },
        ]
    }, [c2W, c2h1, c2h2, c2v1, c2v2, c2DistUnit, sol2])

    const questionsCase3 = useMemo(() => {
        return [
            {
                id: '3a',
                tex: `x_1 + x_2 + x_3 = ${c3W}`,
                truth: true,
                explain: `Tổng độ dời ngang qua cả 3 môi trường bắt buộc bằng chiều rộng ngang tổng cộng W = ${c3W} ${c3DistUnit}.`,
            },
            {
                id: '3b',
                tex: `x_2 \\approx ${fmt(sol3.x2, 2)} \\text{ ${c3DistUnit}}`,
                truth: true,
                explain: `Độ dời ngang tại dải ở giữa (đầm lầy/tuyết) là x₂ ≈ ${fmt(sol3.x2, 3)} ${c3DistUnit}.`,
            },
            {
                id: '3c',
                tex: `T_{\\min} \\approx ${fmt(sol3.totalTime, 3)} \\text{ ${c3TimeUnit}}`,
                truth: true,
                explain: `Tổng thời gian tối thiểu qua cả 3 dải: t₁ + t₂ + t₃ ≈ ${fmt(sol3.time1, 2)} + ${fmt(sol3.time2, 2)} + ${fmt(sol3.time3, 2)} = ${fmt(sol3.totalTime, 3)} ${c3TimeUnit}.`,
            },
        ]
    }, [c3W, c3DistUnit, c3TimeUnit, sol3])

    // ─── Render SVG 1 ─────────────────────────────────────────────────
    const renderSVG1 = () => {
        const pad = 40
        const w = 480
        const h = 240
        const scaleX = (w - 2 * pad) / c1W
        const scaleY = (h - 2 * pad - 20) / c1h

        const ax = pad
        const ay = h - pad - 20
        const bx = pad + sol1.x * scaleX
        const by = h - pad - 20
        const dx = w - pad
        const dy = pad

        return (
            <svg viewBox={`0 0 ${w} ${h}`} className="w-full bg-slate-50 border border-slate-200 rounded-2xl shadow-inner">
                <SVGDefs />
                
                {/* Môi trường 2 (Màu vàng cát) */}
                <rect x={pad} y={pad} width={w - 2 * pad} height={h - 2 * pad - 20} fill="url(#grad-sand)" stroke="#ffe082" strokeWidth={1} />
                
                {/* Đường biên quốc lộ */}
                <rect x={pad} y={h - pad - 23} width={w - 2 * pad} height={6} fill="url(#grad-road)" />

                {/* Quỹ đạo */}
                <line x1={ax} y1={ay} x2={bx} y2={by} stroke="#1e88e5" strokeWidth={3.5} strokeLinecap="round" />
                <line x1={bx} y1={by} x2={dx} y2={dy} stroke="#e53935" strokeWidth={3.5} strokeLinecap="round" />

                {/* Phương tiện mô phỏng */}
                <text x={ax + (bx - ax) / 2} y={ay - 6} textAnchor="middle" fontSize={18}>{c1Vehicle}</text>
                <text x={bx + (dx - bx) / 2} y={by + (dy - by) / 2 - 4} textAnchor="middle" fontSize={18}>{c1Vehicle}</text>

                {/* Điểm nút */}
                <circle cx={ax} cy={ay} r={5} fill="#0d47a1" />
                <text x={ax} y={ay + 20} textAnchor="middle" fontSize={11} fontWeight="bold" fill="#0d47a1">A(0)</text>

                <circle cx={bx} cy={by} r={5} fill="#d32f2f" />
                <text x={bx} y={by + 20} textAnchor="middle" fontSize={11} fontWeight="bold" fill="#d32f2f">B({fmt(sol1.x, 1)})</text>

                <circle cx={dx} cy={dy} r={5} fill="#2e7d32" />
                {/* Nhãn điểm B/D ở góc trên bên phải dịch trái và dùng textAnchor="end" để tránh bị che khuất */}
                <text x={dx - 10} y={dy - 10} textAnchor="end" fontSize={12} fontWeight="bold" fill="#2e7d32">D({c1W}; {c1h})</text>

                {/* Đo độ dịch ngang */}
                <line x1={ax} y1={h - 10} x2={bx} y2={h - 10} stroke="#1565c0" strokeWidth={1.5} strokeDasharray="3,2" />
                <text x={ax + (bx - ax) / 2} y={h - 14} textAnchor="middle" fontSize={9} fill="#1565c0" fontWeight="bold">x = {fmt(sol1.x, 1)} {c1DistUnit}</text>
                
                <line x1={bx} y1={h - 10} x2={dx} y2={h - 10} stroke="#c62828" strokeWidth={1.5} strokeDasharray="3,2" />
                <text x={bx + (dx - bx) / 2} y={h - 14} textAnchor="middle" fontSize={9} fill="#c62828" fontWeight="bold">W - x = {fmt(c1W - sol1.x, 1)} {c1DistUnit}</text>
            </svg>
        )
    }

    // ─── Render SVG 2 ─────────────────────────────────────────────────
    const renderSVG2 = () => {
        const pad = 40
        const w = 480
        const h = 250
        const scaleX = (w - 2 * pad) / c2W
        const totalH = c2h1 + c2h2
        const scaleY = (h - 2 * pad - 20) / totalH

        const env1 = ENV_THEMES[c2Env1] || ENV_THEMES.soil
        const env2 = ENV_THEMES[c2Env2] || ENV_THEMES.sand

        const ax = pad
        const ay = h - pad - 20
        const boundaryY = h - pad - 20 - c2h1 * scaleY
        const mx = pad + sol2.x * scaleX
        const my = boundaryY
        const bx = w - pad
        const by = pad

        return (
            <svg viewBox={`0 0 ${w} ${h}`} className="w-full bg-slate-50 border border-slate-200 rounded-2xl shadow-inner">
                <SVGDefs />
                
                {/* Môi trường 1 */}
                <rect x={pad} y={boundaryY} width={w - 2 * pad} height={c2h1 * scaleY} fill={env1.grad} stroke={env1.stroke} strokeWidth={1} />
                
                {/* Môi trường 2 */}
                <rect x={pad} y={pad} width={w - 2 * pad} height={c2h2 * scaleY} fill={env2.grad} stroke={env2.stroke} strokeWidth={1} />

                {/* Ranh giới */}
                <line x1={pad} y1={boundaryY} x2={w - pad} y2={boundaryY} stroke="#78909c" strokeWidth={2} strokeDasharray="5,4" />

                {/* Quỹ đạo */}
                <line x1={ax} y1={ay} x2={mx} y2={my} stroke="#1e88e5" strokeWidth={3.5} strokeLinecap="round" />
                <line x1={mx} y1={my} x2={bx} y2={by} stroke="#e53935" strokeWidth={3.5} strokeLinecap="round" />

                {/* Icon */}
                <text x={ax + (mx - ax) / 2} y={ay + (my - ay) / 2 - 4} textAnchor="middle" fontSize={18}>{c2Vehicle}</text>
                <text x={mx + (bx - mx) / 2} y={my + (by - my) / 2 - 4} textAnchor="middle" fontSize={18}>{c2Vehicle}</text>

                {/* Điểm nút */}
                <circle cx={ax} cy={ay} r={5} fill="#0d47a1" />
                <text x={ax} y={ay + 20} textAnchor="middle" fontSize={11} fontWeight="bold" fill="#0d47a1">A(0; 0)</text>

                <circle cx={mx} cy={my} r={5} fill="#d32f2f" />
                <text x={mx} y={my - 8} textAnchor="middle" fontSize={11} fontWeight="bold" fill="#d32f2f">M({fmt(sol2.x, 1)})</text>

                <circle cx={bx} cy={by} r={5} fill="#2e7d32" />
                {/* Nhãn điểm B dịch trái, dùng textAnchor="end" tránh tràn viền */}
                <text x={bx - 10} y={by - 10} textAnchor="end" fontSize={11} fontWeight="bold" fill="#2e7d32">B({c2W}; {totalH})</text>

                {/* Trục đo độ dời ngang */}
                <line x1={ax} y1={h - 10} x2={mx} y2={h - 10} stroke="#1565c0" strokeWidth={1.5} strokeDasharray="3,2" />
                <text x={ax + (mx - ax) / 2} y={h - 14} textAnchor="middle" fontSize={9} fill="#1565c0" fontWeight="bold">x₁ = {fmt(sol2.x, 1)} {c2DistUnit}</text>
                
                <line x1={mx} y1={h - 10} x2={bx} y2={h - 10} stroke="#c62828" strokeWidth={1.5} strokeDasharray="3,2" />
                <text x={mx + (bx - mx) / 2} y={h - 14} textAnchor="middle" fontSize={9} fill="#c62828" fontWeight="bold">x₂ = {fmt(c2W - sol2.x, 1)} {c2DistUnit}</text>

                <line x1={mx} y1={my} x2={mx} y2={h - 20} stroke="#b0bec5" strokeWidth={1} strokeDasharray="2,2" />
            </svg>
        )
    }

    // ─── Render SVG 3 ─────────────────────────────────────────────────
    const renderSVG3 = (ghepMode = false) => {
        const pad = 40
        const w = 480
        const h = 260
        const scaleX = (w - 2 * pad) / c3W

        if (ghepMode && sol3.canGhep && sol3.ghepRes) {
            // Hiển thị Ghép khối
            const hGhepOuter = c3h1 + c3h3
            const scaleY = (h - 2 * pad - 20) / (hGhepOuter + c3h2)

            const ax = pad
            const ay = h - pad - 20
            const boundaryY = h - pad - 20 - hGhepOuter * scaleY
            const mx = pad + sol3.ghepRes.x1 * (c3h1 + c3h3) / c3h1 * scaleX
            const my = boundaryY
            const bx = w - pad
            const by = pad

            const envOuter = ENV_THEMES[c3Env1] || ENV_THEMES.sand
            const envMid = ENV_THEMES[c3Env2] || ENV_THEMES.swamp

            return (
                <svg viewBox={`0 0 ${w} ${h}`} className="w-full bg-slate-50 border border-slate-200 rounded-2xl shadow-inner">
                    <SVGDefs />
                    <rect x={pad} y={boundaryY} width={w - 2 * pad} height={hGhepOuter * scaleY} fill={envOuter.grad} stroke={envOuter.stroke} strokeWidth={1} />
                    <rect x={pad} y={pad} width={w - 2 * pad} height={c3h2 * scaleY} fill={envMid.grad} stroke={envMid.stroke} strokeWidth={1} />

                    {/* Quỹ đạo */}
                    <line x1={ax} y1={ay} x2={mx} y2={my} stroke="#1e88e5" strokeWidth={3.5} strokeLinecap="round" />
                    <line x1={mx} y1={my} x2={bx} y2={by} stroke="#e53935" strokeWidth={3.5} strokeLinecap="round" />

                    <circle cx={ax} cy={ay} r={5} fill="#0d47a1" />
                    <circle cx={mx} cy={my} r={5} fill="#d32f2f" />
                    <circle cx={bx} cy={by} r={5} fill="#2e7d32" />
                    <text x={mx} y={my - 8} textAnchor="middle" fontSize={11} fontWeight="bold" fill="#d32f2f">Rẽ tại x = {fmt(sol3.ghepRes.x1 + sol3.ghepRes.x3, 1)}</text>
                    {/* Nhãn điểm B trong sơ đồ ghép khối */}
                    <text x={bx - 10} y={by - 10} textAnchor="end" fontSize={11} fontWeight="bold" fill="#2e7d32">B({c3W}; {c3h1 + c3h2 + c3h3})</text>
                </svg>
            )
        }

        const totalH = c3h1 + c3h2 + c3h3
        const scaleY = (h - 2 * pad - 20) / totalH

        const env1 = ENV_THEMES[c3Env1] || ENV_THEMES.sand
        const env2 = ENV_THEMES[c3Env2] || ENV_THEMES.swamp
        const env3 = ENV_THEMES[c3Env3] || ENV_THEMES.sand

        const yBoundary1 = h - pad - 20 - c3h1 * scaleY
        const yBoundary2 = yBoundary1 - c3h2 * scaleY

        const ax = pad
        const ay = h - pad - 20
        const mx = pad + sol3.x1 * scaleX
        const my = yBoundary1
        const nx = mx + sol3.x2 * scaleX
        const ny = yBoundary2
        const bx = w - pad
        const by = pad

        return (
            <svg viewBox={`0 0 ${w} ${h}`} className="w-full bg-slate-50 border border-slate-200 rounded-2xl shadow-inner">
                <SVGDefs />
                <rect x={pad} y={yBoundary1} width={w - 2 * pad} height={c3h1 * scaleY} fill={env1.grad} stroke={env1.stroke} strokeWidth={1} />
                <rect x={pad} y={yBoundary2} width={w - 2 * pad} height={c3h2 * scaleY} fill={env2.grad} stroke={env2.stroke} strokeWidth={1} />
                <rect x={pad} y={pad} width={w - 2 * pad} height={c3h3 * scaleY} fill={env3.grad} stroke={env3.stroke} strokeWidth={1} />

                {/* Đường ranh giới */}
                <line x1={pad} y1={yBoundary1} x2={w - pad} y2={yBoundary1} stroke="#78909c" strokeWidth={1.5} strokeDasharray="3,3" />
                <line x1={pad} y1={yBoundary2} x2={w - pad} y2={yBoundary2} stroke="#78909c" strokeWidth={1.5} strokeDasharray="3,3" />

                {/* Quỹ đạo */}
                <path d={`M ${ax} ${ay} L ${mx} ${my} L ${nx} ${ny} L ${bx} ${by}`} fill="none" stroke="#e53935" strokeWidth={3.5} strokeLinecap="round" strokeLinejoin="round" />

                {/* Icon */}
                <text x={ax + (mx - ax) / 2} y={ay + (my - ay) / 2 - 4} textAnchor="middle" fontSize={16}>{c3Vehicle}</text>
                <text x={mx + (nx - mx) / 2} y={my + (ny - my) / 2 - 4} textAnchor="middle" fontSize={16}>{c3Vehicle}</text>
                <text x={nx + (bx - nx) / 2} y={ny + (by - ny) / 2 - 4} textAnchor="middle" fontSize={16}>{c3Vehicle}</text>

                {/* Các nút mốc */}
                <circle cx={ax} cy={ay} r={5} fill="#0d47a1" />
                <circle cx={mx} cy={my} r={5} fill="#d32f2f" />
                <circle cx={nx} cy={ny} r={5} fill="#d32f2f" />
                <circle cx={bx} cy={by} r={5} fill="#2e7d32" />

                <text x={ax} y={ay + 20} textAnchor="middle" fontSize={10} fontWeight="bold" fill="#0d47a1">A(0)</text>
                <text x={mx - 10} y={my + 14} fontSize={10} fontWeight="bold" fill="#d32f2f">M({fmt(sol3.x1, 1)})</text>
                <text x={nx + 10} y={ny - 2} fontSize={10} fontWeight="bold" fill="#d32f2f">N({fmt(sol3.x1 + sol3.x2, 1)})</text>
                {/* Sửa nhãn điểm B tránh bị tràn hoặc đè khuất */}
                <text x={bx - 10} y={by - 10} textAnchor="end" fontSize={10} fontWeight="bold" fill="#2e7d32">B({c3W}; {totalH})</text>

                {/* Nét đứt gióng */}
                <line x1={mx} y1={my} x2={mx} y2={h - 20} stroke="#cfd8dc" strokeWidth={1} strokeDasharray="2,2" />
                <line x1={nx} y1={ny} x2={nx} y2={h - 20} stroke="#cfd8dc" strokeWidth={1} strokeDasharray="2,2" />

                {/* Trục thước đo */}
                <line x1={ax} y1={h - 10} x2={mx} y2={h - 10} stroke="#1565c0" strokeWidth={1.5} strokeDasharray="3,2" />
                <text x={ax + (mx - ax) / 2} y={h - 14} textAnchor="middle" fontSize={9} fill="#1565c0" fontWeight="bold">x₁ = {fmt(sol3.x1, 1)}</text>
                
                <line x1={mx} y1={h - 10} x2={nx} y2={h - 10} stroke="#ef6c00" strokeWidth={1.5} strokeDasharray="3,2" />
                <text x={mx + (nx - mx) / 2} y={h - 14} textAnchor="middle" fontSize={9} fill="#ef6c00" fontWeight="bold">x₂ = {fmt(sol3.x2, 1)}</text>
                
                <line x1={nx} y1={h - 10} x2={bx} y2={h - 10} stroke="#c62828" strokeWidth={1.5} strokeDasharray="3,2" />
                <text x={nx + (bx - nx) / 2} y={h - 14} textAnchor="middle" fontSize={9} fill="#c62828" fontWeight="bold">x₃ = {fmt(sol3.x3, 1)}</text>
            </svg>
        )
    }

    return (
        <div className="max-w-7xl mx-auto px-4 py-6 space-y-6">
            {/* Header */}
            <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                <div>
                    <h1 className="text-2xl font-bold text-slate-900 flex items-center gap-2">
                        🧭 Di Chuyển Qua Nhiều Môi Trường Có Vận Tốc
                    </h1>
                    <p className="text-sm text-slate-500 mt-1">
                        Ứng dụng Đạo hàm & Định luật khúc xạ Snell tìm quỹ đạo di chuyển nhanh nhất.
                    </p>
                </div>
                <button
                    type="button"
                    onClick={() => onNavigate('home')}
                    className="self-start sm:self-center px-4 py-2 bg-slate-800 text-white rounded-xl text-sm font-bold hover:bg-slate-700 transition shadow-sm"
                >
                    ← Về danh sách chủ đề
                </button>
            </div>

            {/* Menu Chọn Case */}
            <div className="flex bg-slate-200/60 p-1 rounded-xl w-fit shadow-sm">
                {[
                    { id: 1, label: 'Biên + Môi trường (Case 1)' },
                    { id: 2, label: 'Hai môi trường (Case 2)' },
                    { id: 3, label: 'Ba môi trường (Case 3)' },
                ].map(t => (
                    <button
                        key={t.id}
                        type="button"
                        onClick={() => { setTab(t.id); setRevealedQuestions({}) }}
                        className={`px-4 py-2 rounded-lg text-sm font-bold transition-all ${tab === t.id ? 'bg-white text-slate-800 shadow' : 'text-slate-500 hover:text-slate-800'}`}
                    >
                        {t.label}
                    </button>
                ))}
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-[340px_1fr] gap-6 items-start">
                {/* THAM SỐ (LEFT PANEL) */}
                <div className="space-y-6">
                    {tab === 1 && (
                        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5 space-y-4">
                            <p className="font-bold text-slate-800 text-sm">⚙ Thiết lập tham số (Case 1)</p>
                            <div>
                                <p className="text-xs text-slate-400 mb-2">Đề bài mẫu:</p>
                                <button
                                    type="button"
                                    onClick={() => applyPreset1({ W: 30, h: 40, v1: 80, v2: 40, unit: 'km/h', distUnit: 'km', vehicle: '🚗' })}
                                    className="w-full text-left px-2.5 py-2 rounded-lg bg-slate-50 hover:bg-blue-50 border border-slate-200 text-xs text-slate-600 hover:text-blue-700 transition font-medium"
                                >
                                    🚗 Bài 1: Đi dọc biên rồi rẽ vào (W=30, h=40, v₁=80, v₂=40)
                                </button>
                            </div>
                            <div className="border-t border-slate-100 pt-3 space-y-3">
                                <NumberInput label="Chiều ngang W" value={c1W} min={5} max={100} step={5} onChange={setC1W} unit={c1DistUnit} />
                                <NumberInput label="Chiều dọc h" value={c1h} min={5} max={100} step={5} onChange={setC1h} unit={c1DistUnit} />
                                <NumberInput label="Vận tốc biên v₁" value={c1v1} min={10} max={200} step={10} onChange={setC1v1} unit={c1Unit} />
                                <NumberInput label="Vận tốc trong v₂" value={c1v2} min={5} max={150} step={5} onChange={setC1v2} unit={c1Unit} />
                            </div>
                        </div>
                    )}

                    {tab === 2 && (
                        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5 space-y-4">
                            <p className="font-bold text-slate-800 text-sm">⚙ Thiết lập tham số (Case 2)</p>
                            <div className="space-y-1.5">
                                <p className="text-xs text-slate-400">Đề bài mẫu:</p>
                                {[
                                    { name: '🐱 Mèo robot cát & đất', W: 7, h1: 3, h2: 4, v1: 5, v2: 2, env1: 'soil', env2: 'sand', unit: 'm/s', distUnit: 'm', vehicle: '🐱' },
                                    { name: '🌱 Robot thảm cỏ & gạch', W: 2, h1: 4, h2: 4, v1: 5, v2: 3, env1: 'soil', env2: 'grass', unit: 'm/s', distUnit: 'm', vehicle: '🤖' },
                                    { name: '🏊 Thiết bị cứu hộ biển', W: 25, h1: 12, h2: 12, v1: 20, v2: 15, env1: 'sand', env2: 'water', unit: 'm/s', distUnit: 'm', vehicle: '🏊' },
                                ].map((p, idx) => (
                                    <button
                                        key={idx}
                                        type="button"
                                        onClick={() => applyPreset2(p)}
                                        className="w-full text-left px-2.5 py-1.5 rounded-lg bg-slate-50 hover:bg-blue-50 border border-slate-200 text-xs text-slate-600 hover:text-blue-700 transition font-medium"
                                    >
                                        {p.name}
                                    </button>
                                ))}
                            </div>
                            <div className="border-t border-slate-100 pt-3 space-y-3">
                                <NumberInput label="Chiều ngang W" value={c2W} min={1} max={100} step={1} onChange={setC2W} unit={c2DistUnit} />
                                <NumberInput label="Chiều cao h₁" value={c2h1} min={1} max={50} step={1} onChange={setC2h1} unit={c2DistUnit} />
                                <NumberInput label="Chiều cao h₂" value={c2h2} min={1} max={50} step={1} onChange={setC2h2} unit={c2DistUnit} />
                                <NumberInput label="Vận tốc v₁" value={c2v1} min={1} max={100} step={1} onChange={setC2v1} unit={c2Unit} />
                                <NumberInput label="Vận tốc v₂" value={c2v2} min={1} max={100} step={1} onChange={setC2v2} unit={c2Unit} />
                            </div>
                        </div>
                    )}

                    {tab === 3 && (
                        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-5 space-y-4">
                            <p className="font-bold text-slate-800 text-sm">⚙ Thiết lập tham số (Case 3)</p>
                            <div className="space-y-1.5">
                                <p className="text-xs text-slate-400">Đề bài mẫu:</p>
                                {[
                                    { name: '🌱 Robot chập 2 dải gạch', W: 10, h1: 3, h2: 4, h3: 3, v1: 5, v2: 3, v3: 5, env1: 'soil', env2: 'grass', env3: 'soil', unit: 'm/s', distUnit: 'm', timeUnit: 'giây', vehicle: '🤖' },
                                    { name: '☁ Drone bay qua sương mù', W: 12, h1: 3, h2: 2, h3: 4, v1: 6, v2: 4, v3: 6, env1: 'soil', env2: 'fog', env3: 'soil', unit: 'km/h', distUnit: 'km', timeUnit: 'giờ', vehicle: '🚁' },
                                    { name: '🐊 Xe đua qua đầm lầy', W: 15, h1: 4, h2: 6, h3: 2, v1: 10, v2: 5, v3: 10, env1: 'sand', env2: 'swamp', env3: 'sand', unit: 'km/h', distUnit: 'km', timeUnit: 'giờ', vehicle: '🚗' },
                                    { name: '❄ Xe trượt cứu hộ (25 phút)', W: 11, h1: 4, h2: 4, h3: 2, v1: 40, v2: 30, v3: 40, env1: 'water', env2: 'snow', env3: 'water', unit: 'km/h', distUnit: 'km', timeUnit: 'giờ', vehicle: '🛷' },
                                    { name: '🤖 Xe thám hiểm Rover (3 tốc độ)', W: 84, h1: 40, h2: 30, h3: 48, v1: 15, v2: 20, v3: 7, env1: 'soil', env2: 'water', env3: 'sand', unit: 'km/h', distUnit: 'km', timeUnit: 'giờ', vehicle: '🤖' },
                                    { name: '🚢 Tàu Hovercraft (10.625h)', W: 164, h1: 21, h2: 48, h3: 42, v1: 24, v2: 15, v3: 20, env1: 'sand', env2: 'swamp', env3: 'water', unit: 'km/h', distUnit: 'km', timeUnit: 'giờ', vehicle: '🚢' },
                                    { name: '⚓ Tàu ngầm lặn sâu (75h)', W: 1278, h1: 336, h2: 480, h3: 720, v1: 14, v2: 40, v3: 30, env1: 'water', env2: 'water', env3: 'water', unit: 'km/h', distUnit: 'km', timeUnit: 'giờ', vehicle: '⚓' },
                                    { name: '🏎 Dakar Rally (31h)', W: 1053, h1: 300, h2: 156, h3: 300, v1: 60, v2: 52, v3: 25, env1: 'sand', env2: 'soil', env3: 'soil', unit: 'km/h', distUnit: 'km', timeUnit: 'giờ', vehicle: '🏎' },
                                ].map((p, idx) => (
                                    <button
                                        key={idx}
                                        type="button"
                                        onClick={() => applyPreset3(p)}
                                        className="w-full text-left px-2.5 py-1.5 rounded-lg bg-slate-50 hover:bg-blue-50 border border-slate-200 text-xs text-slate-600 hover:text-blue-700 transition font-medium"
                                    >
                                        {p.name}
                                    </button>
                                ))}
                            </div>
                            <div className="border-t border-slate-100 pt-3 space-y-3">
                                <NumberInput label="Chiều ngang W" value={c3W} min={10} max={2000} step={10} onChange={setC3W} unit={c3DistUnit} />
                                <div className="border-b border-slate-100 pb-2">
                                    <p className="text-xs text-slate-400 font-bold mb-1.5">📐 Độ cao các dải</p>
                                    <div className="space-y-2">
                                        <NumberInput label="Dải dưới h₁" value={c3h1} min={1} max={800} step={5} onChange={setC3h1} unit={c3DistUnit} />
                                        <NumberInput label="Dải giữa h₂" value={c3h2} min={1} max={800} step={5} onChange={setC3h2} unit={c3DistUnit} />
                                        <NumberInput label="Dải trên h₃" value={c3h3} min={1} max={800} step={5} onChange={setC3h3} unit={c3DistUnit} />
                                    </div>
                                </div>
                                <div>
                                    <p className="text-xs text-slate-400 font-bold mb-1.5">⚡ Vận tốc trên dải</p>
                                    <div className="space-y-2">
                                        <NumberInput label="Tốc độ v₁" value={c3v1} min={1} max={200} step={5} onChange={setC3v1} unit={c3Unit} />
                                        <NumberInput label="Tốc độ v₂" value={c3v2} min={1} max={200} step={5} onChange={setC3v2} unit={c3Unit} />
                                        <NumberInput label="Tốc độ v₃" value={c3v3} min={1} max={200} step={5} onChange={setC3v3} unit={c3Unit} />
                                    </div>
                                </div>
                            </div>
                        </div>
                    )}
                </div>

                {/* SƠ ĐỒ VÀ PHƯƠNG PHÁP GIẢI (RIGHT PANEL) */}
                <div className="space-y-6">
                    {/* SVG Map */}
                    <SectionCard>
                        <div className="flex items-center justify-between gap-3 mb-3">
                            <p className="font-bold text-slate-800 text-sm">📊 Sơ đồ quỹ đạo đi tối ưu & Độ dời ngang</p>
                            {tab === 3 && sol3.canGhep && (
                                <button
                                    type="button"
                                    onClick={() => setShowGhepGiaiThich(!showGhepGiaiThich)}
                                    className={`px-3 py-1 rounded-lg text-xs font-bold transition border ${showGhepGiaiThich ? 'bg-orange-500 text-white border-orange-600' : 'bg-slate-100 text-slate-600 border-slate-300'}`}
                                >
                                    {showGhepGiaiThich ? 'Xem sơ đồ thực tế' : 'Xem sơ đồ Ghép hình'}
                                </button>
                            )}
                        </div>
                        {tab === 1 && renderSVG1()}
                        {tab === 2 && renderSVG2()}
                        {tab === 3 && renderSVG3(showGhepGiaiThich)}

                        <div className="flex gap-4 mt-3 text-xs text-slate-500">
                            <span className="flex items-center gap-1"><span className="inline-block w-4 h-1 bg-blue-500 rounded" /> Chặng 1</span>
                            <span className="flex items-center gap-1"><span className="inline-block w-4 h-1 bg-red-500 rounded" /> Chặng 2</span>
                            {tab === 3 && <span className="flex items-center gap-1"><span className="inline-block w-4 h-1 bg-emerald-500 rounded" /> Chặng 3</span>}
                        </div>
                    </SectionCard>

                    {/* GIẢI ĐỒNG THỜI BẰNG CẢ 2 CÁCH (DÙNG DFRAC CHIỀU CAO ĐẸP) */}
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-base mb-4 flex items-center gap-2 border-b border-slate-100 pb-3">
                            <StepBadge n={2} color="bg-violet-600" />
                            Lời giải chi tiết bằng cả 2 cách giải
                        </p>

                        {/* CASE 1 SOLUTION */}
                        {tab === 1 && (
                            <div className="space-y-4 text-sm text-slate-700">
                                <div className="bg-slate-50 border border-slate-200 rounded-xl p-4">
                                    <p className="font-bold text-slate-800 mb-2">Cách giải: Lập hàm số 1 biến</p>
                                    <p>Ta đặt hoành độ điểm rẽ B là <InlineMath math="x" /> (với <InlineMath math={`0 \\leq x \\leq ${c1W}`} />).</p>
                                    <p>• Quãng đường trên biên: <InlineMath math="S_1 = x" />. Thời gian: <InlineMath math={`t_1 = \\dfrac{x}{${c1v1}}`} />.</p>
                                    <p>• Quãng đường chéo trong môi trường: <InlineMath math={`S_2 = \\sqrt{(${c1W} - x)^2 + ${c1h}^2}`} />. Thời gian: <InlineMath math={`t_2 = \\dfrac{\\sqrt{(${c1W} - x)^2 + ${c1h}^2}}{${c1v2}}`} />.</p>
                                    <p>Hàm tổng thời gian di chuyển:</p>
                                    <BlockMath math={`T(x) = \\dfrac{x}{${c1v1}} + \\dfrac{\\sqrt{(${c1W} - x)^2 + ${c1h}^2}}{${c1v2}}`} />
                                    <p className="mt-2 font-bold text-slate-800">Đạo hàm tìm điểm cực trị:</p>
                                    <BlockMath math={`T'(x) = \\dfrac{1}{${c1v1}} - \\dfrac{${c1W} - x}{${c1v2} \\sqrt{(${c1W} - x)^2 + ${c1h}^2}}`} />
                                    <p>Giải phương trình <InlineMath math="T'(x) = 0" /> bằng cách đặt tỷ lệ vận tốc <InlineMath math={`r = \\dfrac{v_2}{v_1} = \\dfrac{${c1v2}}{${c1v1}} = ${fmt(c1v2 / c1v1, 3)}`} />:</p>
                                    <BlockMath math={`W - x = \\dfrac{r \\cdot h}{\\sqrt{1 - r^2}} \\implies x = ${c1W} - \\dfrac{${fmt(c1v2 / c1v1, 2)} \\cdot ${c1h}}{\\sqrt{1 - ${fmt(c1v2 / c1v1, 2)}^2}} \\approx ${fmt(sol1.x, 2)}`} />
                                    <p className="text-emerald-700 font-bold mt-2">Kết quả tối ưu: x = {fmt(sol1.x, 2)} {c1DistUnit}. Tổng thời gian: {fmt(sol1.totalTime, 2)} giờ.</p>
                                </div>
                            </div>
                        )}

                        {/* CASE 2 SOLUTION (CẢ 2 CÁCH GIẢI ĐỒNG THỜI) */}
                        {tab === 2 && (
                            <div className="space-y-4 text-sm text-slate-700">
                                {/* Cách 1: Đạo hàm truyền thống */}
                                <div className="bg-slate-50 border border-slate-200 rounded-xl p-4">
                                    <p className="font-bold text-slate-800 mb-2">Cách 1: Lập hàm 1 biến & Khảo sát Đạo hàm (Cách truyền thống)</p>
                                    <p>Gọi hoành độ điểm giao ranh giới M là <InlineMath math="x" /> (với <InlineMath math={`0 \\leq x \\leq ${c2W}`} />).</p>
                                    <p>Hàm tổng thời gian di chuyển từ A(0;0) đến B({c2W}; {c2h1 + c2h2}) là:</p>
                                    <BlockMath math={`T(x) = \\dfrac{\\sqrt{x^2 + ${c2h1}^2}}{${c2v1}} + \\dfrac{\\sqrt{(${c2W} - x)^2 + ${c2h2}^2}}{${c2v2}}`} />
                                    <p>Đạo hàm của hàm số:</p>
                                    <BlockMath math={`T'(x) = \\dfrac{x}{${c2v1} \\sqrt{x^2 + ${c2h1}^2}} - \\dfrac{${c2W} - x}{${c2v2} \\sqrt{(${c2W} - x)^2 + ${c2h2}^2}}`} />
                                    <p>Giải phương trình đạo hàm <InlineMath math="T'(x) = 0" /> bằng cách bình phương hai vế hoặc sử dụng tính năng <strong>SOLVE</strong> trên máy tính cầm tay:</p>
                                    <p className="text-emerald-700 font-bold mt-2">HM = x ≈ {fmt(sol2.x, 3)} {c2DistUnit}. Thời gian cực tiểu: {fmt(sol2.totalTime, 2)} giây.</p>
                                </div>

                                {/* Cách 2: Lượng giác Snell */}
                                <div className="bg-emerald-50 border border-emerald-200 rounded-xl p-4">
                                    <p className="font-bold text-emerald-950 mb-2">Cách 2: Giải nhanh bằng độ dời ngang lượng giác (Định luật Snell)</p>
                                    <p className="text-emerald-900">Tại điểm rẽ M trên ranh giới, theo định luật khúc xạ Snell tối ưu thời gian:</p>
                                    <BlockMath math={`\\dfrac{\\sin \\theta_1}{v_1} = \\dfrac{\\sin \\theta_2}{v_2} = k \\quad (k > 0)`} />
                                    <p className="text-emerald-900">Với góc nghiêng thẳng đứng <InlineMath math="\\theta_i" />, ta biểu diễn độ dời ngang của từng chặng theo hằng số khúc xạ <InlineMath math="k" />:</p>
                                    <BlockMath math={`x_1 = h_1 \\tan \\theta_1 = \\dfrac{h_1 \\cdot v_1 \\cdot k}{\\sqrt{1 - v_1^2 k^2}} = \\dfrac{${c2h1} \\cdot ${c2v1} \\cdot k}{\\sqrt{1 - ${c2v1 * c2v1} k^2}}`} />
                                    <BlockMath math={`x_2 = h_2 \\tan \\theta_2 = \\dfrac{h_2 \\cdot v_2 \\cdot k}{\\sqrt{1 - v_2^2 k^2}} = \\dfrac{${c2h2} \\cdot ${c2v2} \\cdot k}{\\sqrt{1 - ${c2v2 * c2v2} k^2}}`} />
                                    <p className="text-emerald-900">Ta thiết lập phương trình tổng độ dời ngang:</p>
                                    <BlockMath math={`x_1 + x_2 = \\dfrac{${c2h1 * c2v1}k}{\\sqrt{1 - ${c2v1 * c2v1}k^2}} + \\dfrac{${c2h2 * c2v2}k}{\\sqrt{1 - ${c2v2 * c2v2}k^2}} = ${c2W}`} />
                                    <div className="text-emerald-950 font-bold mt-1 flex items-center gap-1.5 flex-wrap">
                                        <span>Kết quả:</span>
                                        <InlineMath math={`k \\approx ${fmt(sol2.sin1 / c2v1, 5)} \\implies x_1 \\approx ${fmt(sol2.x, 3)} \\text{ (${c2DistUnit})}`} />
                                    </div>

                                </div>
                            </div>
                        )}

                        {/* CASE 3 SOLUTION (CẢ 2 CÁCH GIẢI ĐỒNG THỜI) */}
                        {tab === 3 && (
                            <div className="space-y-4 text-sm text-slate-700">
                                {/* Cách 1: Tọa độ 2 biến tổng quát */}
                                <div className="bg-slate-50 border border-slate-200 rounded-xl p-4 space-y-2">
                                    <p className="font-bold text-slate-800">Cách 1: Lập hàm 2 biến số & Định luật Snell tổng quát</p>
                                    <p>Gọi độ dời ngang của tàu/drone lần lượt trong 3 chặng là <InlineMath math="x_1, x_2, x_3" />. Tổng chiều rộng: <InlineMath math={`x_1 + x_2 + x_3 = ${c3W}`} />.</p>
                                    <p>Hàm tổng thời gian di chuyển 2 biến độc lập (đã thế biến thứ ba):</p>
                                    <BlockMath math={`T(x_1, x_2) = \\dfrac{\\sqrt{x_1^2 + ${c3h1}^2}}{${c3v1}} + \\dfrac{\\sqrt{x_2^2 + ${c3h2}^2}}{${c3v2}} + \\dfrac{\\sqrt{(${c3W} - x_1 - x_2)^2 + ${c3h3}^2}}{${c3v3}}`} />
                                    <p>Theo Nguyên lý cực trị Fermat, hệ đạo hàm riêng bằng 0 dẫn tới đẳng thức góc khúc xạ Snell:</p>
                                    <BlockMath math={`\\dfrac{\\sin \\theta_1}{v_1} = \\dfrac{\\sin \\theta_2}{v_2} = \\dfrac{\\sin \\theta_3}{v_3} = k`} />
                                    <p>Ta biểu diễn các quãng đường ngang theo <InlineMath math="k" /> và giải phương trình tổng quát:</p>
                                    <BlockMath math={`f(k) = \\sum_{i=1}^3 \\dfrac{h_i \\cdot v_i \\cdot k}{\\sqrt{1 - v_i^2 k^2}} = \\dfrac{${c3h1 * c3v1}k}{\\sqrt{1 - ${c3v1 * c3v1}k^2}} + \\dfrac{${c3h2 * c3v2}k}{\\sqrt{1 - ${c3v2 * c3v2}k^2}} + \\dfrac{${c3h3 * c3v3}k}{\\sqrt{1 - ${c3v3 * c3v3}k^2}} = ${c3W}`} />
                                    <p className="text-slate-700 mt-1">Với điều kiện xác định chặt chẽ <InlineMath math={`k < \\dfrac{1}{v_{\\max}} = \\dfrac{1}{${Math.max(c3v1, c3v2, c3v3)}} = ${fmt(1 / Math.max(c3v1, c3v2, c3v3), 4)}`} />, ta tìm được:</p>
                                    <div className="text-emerald-700 font-bold mt-1 flex items-center gap-1.5 flex-wrap">
                                        <span>Kết quả:</span>
                                        <InlineMath math={`k \\approx ${fmt(sol3.k, 5)} \\implies x_1 \\approx ${fmt(sol3.x1, 2)}, \\ x_2 \\approx ${fmt(sol3.x2, 2)}, \\ x_3 \\approx ${fmt(sol3.x3, 2)} \\text{ (${c3DistUnit})}`} />
                                    </div>

                                </div>

                                {/* Cách 2: Phương pháp độ dời ghép khối (chỉ vẽ khi v1 = v3) */}
                                {sol3.canGhep && (
                                    <div className="bg-emerald-50 border border-emerald-200 rounded-xl p-4 space-y-3">
                                        <p className="font-bold text-emerald-950 flex items-center gap-1.5">
                                            <span>Cách 2: Phương pháp Độ dời ngang & Ghép khối Pytago</span>
                                            <span className="bg-emerald-200 text-emerald-800 text-[10px] px-2 py-0.5 rounded font-black">ƯU VIỆT & DỄ HIỂU</span>
                                        </p>
                                        <p className="text-emerald-900">Vì vận tốc dải 1 và dải 3 bằng nhau (<InlineMath math={`v_1 = v_3 = ${c3v1}`} />), ta tịnh tiến chập hai dải này lại thành một dải cát/băng phẳng gộp.</p>
                                        
                                        <div className="bg-white/80 p-3 rounded-lg border border-emerald-100 text-xs space-y-1 text-emerald-950">
                                            <p>• Dải giữa (đầm lầy/tuyết) chịu độ dời ngang là <InlineMath math="x" />. Chiều dọc là <InlineMath math={`h_2 = ${c3h2}`} />.</p>
                                            <p>• Hai dải ngoài gộp lại có chiều cao tổng cộng là <InlineMath math={`h_1 + h_3 = ${c3h1 + c3h3}`} /> và tổng độ dời ngang còn lại bắt buộc là <InlineMath math="W - x" />.</p>
                                        </div>

                                        <p className="text-emerald-900">Hàm tổng thời gian lúc này cực kỳ đơn giản chỉ còn 1 biến số <InlineMath math="x" />:</p>
                                        <BlockMath math={`T(x) = \\dfrac{\\sqrt{x^2 + ${c3h2}^2}}{${c3v2}} + \\dfrac{\\sqrt{(${c3W} - x)^2 + ${c3h1 + c3h3}^2}}{${c3v1}}`} />
                                        <p className="text-emerald-900">Khảo sát đạo hàm <InlineMath math="T'(x) = 0" />:</p>
                                        <BlockMath math={`\\dfrac{x}{${c3v2}\\sqrt{x^2+${c3h2}^2}} = \\dfrac{${c3W}-x}{${c3v1}\\sqrt{(${c3W}-x)^2+${c3h1+c3h3}^2}}`} />
                                        <p className="text-emerald-900">Bấm máy <strong>SOLVE</strong> tìm được ngay độ dời ngang chặng giữa: <strong className="text-emerald-950">x_2 = {fmt(sol3.ghepRes.x2, 2)} {c3DistUnit}</strong>.</p>
                                        <p className="text-emerald-900">Độ dời ngang chặng 1 và 3 được tách ra tỉ lệ thuận với độ cao của chúng:</p>
                                        <ul className="list-disc list-inside text-xs text-emerald-900 pl-2 space-y-1">
                                            <li>Dải dưới: <InlineMath math={`x_1 = (${c3W} - x_2) \\cdot \\dfrac{h_1}{h_1 + h_3} = (${c3W} - ${fmt(sol3.ghepRes.x2, 2)}) \\cdot \\dfrac{${c3h1}}{${c3h1 + c3h3}} \\approx ${fmt(sol3.x1, 2)}`} /> {c3DistUnit}.</li>
                                            <li>Dải trên: <InlineMath math={`x_3 = (${c3W} - x_2) \\cdot \\dfrac{h_3}{h_1 + h_3} = (${c3W} - ${fmt(sol3.ghepRes.x2, 2)}) \\cdot \\dfrac{${c3h3}}{${c3h1 + c3h3}} \\approx ${fmt(sol3.x3, 2)}`} /> {c3DistUnit}.</li>
                                        </ul>
                                    </div>
                                )}
                            </div>
                        )}
                    </SectionCard>

                    {/* Mệnh đề Đúng / Sai */}
                    <SectionCard>
                        <p className="font-bold text-slate-800 text-sm mb-3">❓ Luyện tập trắc nghiệm Đúng / Sai</p>
                        <p className="text-xs text-slate-400 mb-4">Nhấp chọn mệnh đề để kiểm tra câu trả lời và xem giải thích sư phạm.</p>

                        <div className="space-y-3">
                            {(tab === 1 ? questionsCase1 : tab === 2 ? questionsCase2 : questionsCase3).map(q => {
                                const active = revealedQuestions[q.id]
                                return (
                                    <div
                                        key={q.id}
                                        onClick={() => toggleRevealQuestion(q.id)}
                                        className={`rounded-xl border-2 p-3.5 cursor-pointer transition-all select-none
                                            ${active
                                                ? q.truth
                                                    ? 'border-emerald-400 bg-emerald-50'
                                                    : 'border-red-400 bg-red-50'
                                                : 'border-slate-200 bg-white hover:border-slate-300 hover:bg-slate-50'
                                            }`}
                                    >
                                        <div className="flex items-start justify-between gap-3">
                                            <div className="min-w-0">
                                                <div className="text-xs font-bold text-slate-400 mb-1">
                                                    MỆNH ĐỀ {q.id.toUpperCase()}:
                                                </div>
                                                <div className="text-sm font-semibold text-slate-800">
                                                    <InlineMath math={q.tex} />
                                                </div>
                                                {active && (
                                                    <p className={`text-xs mt-2 leading-relaxed ${q.truth ? 'text-emerald-700' : 'text-red-700'}`}>
                                                        {q.explain}
                                                    </p>
                                                )}
                                            </div>
                                            {active ? (
                                                <span className={`shrink-0 text-xs font-black px-2.5 py-0.5 rounded-full ${q.truth ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-700'}`}>
                                                    ĐÚNG
                                                </span>
                                            ) : (
                                                <span className="shrink-0 text-xs text-slate-300 font-medium">Xem đáp án</span>
                                            )}
                                        </div>
                                    </div>
                                )
                            })}
                        </div>
                    </SectionCard>
                </div>
            </div>
        </div>
    )
}
