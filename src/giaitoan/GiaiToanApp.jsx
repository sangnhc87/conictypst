/**
 * GiaiToanApp — Hub trung tâm cho tất cả chủ đề giải toán tương tác.
 *
 * Thêm dạng bài mới: chỉ cần thêm vào TOPICS (và import Component nếu ready).
 * Thêm môn học mới: chỉ cần thêm vào SUBJECTS.
 *
 * Không cần chỉnh gì khác — UI tự cập nhật.
 */

import React, { useState, useMemo } from 'react'
import RowSinglePage from '../xepghe/pages/RowSinglePage.jsx'
import RowDoublePage from '../xepghe/pages/RowDoublePage.jsx'
import StarsAndBarsPage from './hamsinh/pages/StarsAndBarsPage.jsx'
import ModularGFPage from './hamsinh/pages/ModularGFPage.jsx'
import CoinChangePage from './hamsinh/pages/CoinChangePage.jsx'
import PhanPhoiPage from './phanphoi/PhanPhoiPage.jsx'
import BaoHoaPage from './baohoa/BaoHoaPage.jsx'
import MoiTruongPage from './moitruong/MoiTruongPage.jsx'
import UrnProbabilityStudioPage from './xacsuat/pages/UrnProbabilityStudioPage.jsx'
import TreeProbabilityStudioPage from './xacsuat/pages/TreeProbabilityStudioPage.jsx'
import LuckyLightStudioPage from './xacsuat/pages/LuckyLightStudioPage.jsx'
import OlympicSequenceStudioPage from './xacsuat/pages/OlympicSequenceStudioPage.jsx'


/* ─────────────────────────────────────────────────────────────────
   Registry: thêm môn học ở đây
   ───────────────────────────────────────────────────────────────── */
const SUBJECTS = [
    { id: 'to-hop', name: 'Tổ hợp', icon: '🪑', color: 'blue' },
    { id: 'xac-suat', name: 'Xác suất', icon: '🎲', color: 'emerald' },
    { id: 'hinh-hoc', name: 'Hình học', icon: '📐', color: 'violet' },
    { id: 'dai-so', name: 'Đại số', icon: '🔢', color: 'orange' },
    { id: 'ham-sinh', name: 'Hàm sinh (GF)', icon: '⚡', color: 'violet' },
    { id: 'phan-phoi', name: 'Phân phối Vật-Hộp', icon: '📦', color: 'teal' },
    { id: 'giai-tich', name: 'Hàm số - Giải tích', icon: '📈', color: 'rose' },
]

/* ─────────────────────────────────────────────────────────────────
   Registry: thêm dạng bài ở đây
   ───────────────────────────────────────────────────────────────── */
const TOPICS = [
    {
        id: 'xep-ghe-1-hang',
        subjectId: 'to-hop',
        title: '1 Hàng Ngang — Không Ghế Trống',
        desc: 'Xếp học sinh từ nhiều lớp vào 1 hàng ngang. Áp dụng bao hàm – loại trừ (PIE), tính bảng tự động từng bước.',
        tags: ['PIE', '1 hàng', 'cơ bản'],
        level: 'Cơ bản',
        Component: RowSinglePage,
        cProps: { hasBlank: false },
        ready: true,
    },
    {
        id: 'xep-ghe-1-hang-trong',
        subjectId: 'to-hop',
        title: '1 Hàng Ngang — Có Ghế Trống',
        desc: 'Thêm ghế trống xen vào hàng. Ghế trống không bị cấm kề và không đóng góp giai thừa.',
        tags: ['PIE', '1 hàng', 'ghế trống'],
        level: 'Cơ bản',
        Component: RowSinglePage,
        cProps: { hasBlank: true },
        ready: true,
    },
    {
        id: 'xep-ghe-2-hang',
        subjectId: 'to-hop',
        title: '2 Hàng Đối Diện',
        desc: 'Hai hàng ghế đối mặt nhau. Giải hệ đặc trưng cột X, Y, Z, U, V, T, W để đếm cấu hình.',
        tags: ['Cột', '2 hàng', 'nâng cao'],
        level: 'Nâng cao',
        Component: RowDoublePage,
        cProps: {},
        ready: true,
    },
    {
        id: 'xep-ghe-tron',
        subjectId: 'to-hop',
        title: 'Xếp Ghế Tròn',
        desc: 'Ngồi quanh bàn tròn: hoán vị vòng kết hợp bao hàm – loại trừ.',
        tags: ['vòng', 'PIE'],
        level: 'Nâng cao',
        ready: false,
    },
    {
        id: 'boc-bi-bayes',
        subjectId: 'xac-suat',
        title: 'Studio Bốc Bi, Chuyển Bi, Xúc Xắc',
        desc: 'Một page tổng hợp nhiều họ bài xác suất trong repo: Bayes chọn hộp, chuyển bi giữa các hộp, xúc xắc phân phối bóng và dạng tìm x/tham số. Có nhiều tab, preset và lời giải từng lớp.',
        tags: ['Bayes', 'Bốc bi', 'Chuyển bi', 'Xúc xắc'],
        level: 'Trung bình',
        Component: UrnProbabilityStudioPage,
        cProps: {},
        ready: true,
    },
    {
        id: 'so-do-cay-va-doi-khang',
        subjectId: 'xac-suat',
        title: 'Studio Sơ Đồ Cây & Đối Kháng',
        desc: 'Page riêng cho 3 họ bài rất hay ra đề: cây 1-3-6, cây 2-4-8 và xác suất đối kháng có cửa hòa. Dữ liệu mở, cây đẹp, công thức và lời giải cập nhật theo input.',
        tags: ['Sơ đồ cây', 'Bayes', 'Điều kiện', 'Đối kháng'],
        level: 'Trung bình',
        Component: TreeProbabilityStudioPage,
        cProps: {},
        ready: true,
    },
    {
        id: 'lucky-light-uoc-so',
        subjectId: 'xac-suat',
        title: 'Lucky Light — Ước Số & Số Chính Phương',
        desc: 'Mô phỏng bài toán đổi trạng thái theo bội số. Khám phá tại sao chỉ số chính phương có số ước lẻ. Luyện tập ngẫu nhiên với 4 biến thể (bóng đèn, tủ khóa, đồng xu, công tắc) và lời giải từng bước.',
        tags: ['Ước số', 'Số chính phương', 'Lucky Light', 'Mô phỏng', 'Xác suất'],
        level: 'Trung bình',
        Component: LuckyLightStudioPage,
        cProps: {},
        ready: true,
    },
    {
        id: 'olympic-sequence-m101',
        subjectId: 'to-hop',
        title: 'Dãy Âm–Không–Dương — Olympic',
        desc: 'Đếm dãy (a₁,...,aₙ) với aᵢ ∈ {−1,0,1} theo điều kiện tổng. Hai hàm cốt lõi S(n) và T(n,s). Bảng trinomial, máy tính từng bước, luyện tập ngẫu nhiên 5 dạng Olympic.',
        tags: ['S(n)', 'T(n,s)', 'Trinomial', 'Olympic', 'Tổng điều kiện'],
        level: 'Nâng cao',
        Component: OlympicSequenceStudioPage,
        cProps: {},
        ready: true,
    },
    {
        id: 'xac-suat-co-ban',
        subjectId: 'xac-suat',
        title: 'Xác Suất Cơ Bản',
        desc: 'Không gian mẫu, biến cố. Công thức xác suất cổ điển.',
        tags: ['cơ bản', 'định nghĩa'],
        level: 'Cơ bản',
        ready: false,
    },
    {
        id: 'hoán-vi-chỉnh-hợp',
        subjectId: 'to-hop',
        title: 'Hoán Vị & Chỉnh Hợp',
        desc: 'Đếm số cách sắp xếp và chọn có thứ tự từ tập hữu hạn.',
        tags: ['P', 'A', 'cơ bản'],
        level: 'Cơ bản',
        ready: false,
    },
    {
        id: 'sab-chan',
        subjectId: 'ham-sinh',
        title: 'Vách Ngăn — Stars and Bars',
        desc: 'Đếm nghiệm nguyên x₁+…+xₖ=n với ràng buộc chặn dưới/trên. Bảng PIE đầy đủ từng bước.',
        tags: ['Vách ngăn', 'PIE', 'cơ bản'],
        level: 'Cơ bản',
        Component: StarsAndBarsPage,
        cProps: {},
        ready: true,
    },
    {
        id: 'ham-sinh-chan-le',
        subjectId: 'ham-sinh',
        title: 'Ràng Buộc Chẵn, Lẻ, Bội Số',
        desc: 'Biến chỉ nhận giá trị chẵn, lẻ hoặc bội của d. Hàm sinh thành phần 1/(1−xᵈ).',
        tags: ['Chẵn lẻ', 'OGF'],
        level: 'Trung bình',
        Component: ModularGFPage,
        cProps: {},
        ready: true,
    },
    {
        id: 'doi-tien',
        subjectId: 'ham-sinh',
        title: 'Đổi Tiền — Coin Change',
        desc: 'Đếm số cách đổi n đồng bằng các mệnh giá cho trước. Bảng DP trực quan.',
        tags: ['Đổi tiền', 'DP', 'OGF'],
        level: 'Trung bình',
        Component: CoinChangePage,
        cProps: {},
        ready: true,
    },
    {
        id: 'phan-phoi-4-case',
        subjectId: 'phan-phoi',
        title: '4 Trường Hợp Vật vào Hộp',
        desc: 'Khung lý thuyết + 4 công cụ tính: k^n, C(n+k-1,k-1), Số Stirling, Phân hoạch số. Hiểu ngay từ 2 câu hỏi.',
        tags: ['Stirling', 'Phân hoạch', 'Stars & Bars', 'EGF', 'OGF'],
        level: 'Tổng hợp',
        Component: PhanPhoiPage,
        cProps: {},
        ready: true,
    },
    {
        id: 'tang-truong-bao-hoa',
        subjectId: 'giai-tich',
        title: 'Tăng Trưởng Bão Hoà — 2 Giai Đoạn',
        desc: 'Mô hình N(t)=N₀eᵃᵗ → M(t)=A−Be⁻ᵇ⁽ᵗ⁻ᵗ⁰⁾. Tự động tính A, B từ điều kiện nối trơn. Kiểm tra mệnh đề đúng/sai. Vẽ đồ thị.',
        tags: ['Hàm mũ', 'Bão hoà', 'Liên tục', 'Đề thi THPT'],
        level: 'Trung bình',
        Component: BaoHoaPage,
        cProps: {},
        ready: true,
    },
    {
        id: 'di-chuyen-nhieu-moi-truong',
        subjectId: 'giai-tich',
        title: 'Di Chuyển Qua Nhiều Môi Trường Có Vận Tốc',
        desc: 'Tối ưu hóa đường đi của phương tiện, robot hoặc ánh sáng đi qua nhiều môi trường (Snell/Fermat). Giải số trị & vẽ đồ thị động.',
        tags: ['Tối ưu', 'Đạo hàm', 'Snell', 'Nguyên lý Fermat'],
        level: 'Nâng cao',
        Component: MoiTruongPage,
        cProps: {},
        ready: true,
    },
]

/* ─────────────────────────────────────────────────────────────────
   Style map — nhất quán toàn bộ hub
   ───────────────────────────────────────────────────────────────── */
const STYLES = {
    blue: {
        badge: 'bg-blue-50 text-blue-700 border-blue-200',
        border: 'border-l-blue-500',
        pillOn: 'bg-blue-600 text-white border-transparent',
        btn: 'bg-blue-600 hover:bg-blue-700 active:bg-blue-800',
    },
    emerald: {
        badge: 'bg-emerald-50 text-emerald-700 border-emerald-200',
        border: 'border-l-emerald-500',
        pillOn: 'bg-emerald-600 text-white border-transparent',
        btn: 'bg-emerald-600 hover:bg-emerald-700 active:bg-emerald-800',
    },
    violet: {
        badge: 'bg-violet-50 text-violet-700 border-violet-200',
        border: 'border-l-violet-500',
        pillOn: 'bg-violet-600 text-white border-transparent',
        btn: 'bg-violet-600 hover:bg-violet-700 active:bg-violet-800',
    },
    orange: {
        badge: 'bg-orange-50 text-orange-700 border-orange-200',
        border: 'border-l-orange-500',
        pillOn: 'bg-orange-600 text-white border-transparent',
        btn: 'bg-orange-600 hover:bg-orange-700 active:bg-orange-800',
    },
    teal: {
        badge: 'bg-teal-50 text-teal-700 border-teal-200',
        border: 'border-l-teal-500',
        pillOn: 'bg-teal-600 text-white border-transparent',
        btn: 'bg-teal-600 hover:bg-teal-700 active:bg-teal-800',
    },
    rose: {
        badge: 'bg-rose-50 text-rose-700 border-rose-200',
        border: 'border-l-rose-500',
        pillOn: 'bg-rose-600 text-white border-transparent',
        btn: 'bg-rose-600 hover:bg-rose-700 active:bg-rose-800',
    },
}

/* ─────────────────────────────────────────────────────────────────
   Micro-components
   ───────────────────────────────────────────────────────────────── */
function SubjectBadge({ subject }) {
    const s = STYLES[subject?.color] || STYLES.blue
    return (
        <span className={`inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-semibold border ${s.badge}`}>
            {subject?.icon} {subject?.name}
        </span>
    )
}

function LevelTag({ level }) {
    const cls = level === 'Nâng cao'
        ? 'bg-amber-50 text-amber-700 border-amber-200'
        : 'bg-slate-100 text-slate-500 border-slate-200'
    return (
        <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold border ${cls}`}>
            {level}
        </span>
    )
}

function TopicCard({ topic, subject, onOpen }) {
    const s = STYLES[subject?.color] || STYLES.blue
    const ready = topic.ready

    return (
        <div
            className={`
                bg-white rounded-2xl border border-slate-200 border-l-4 ${s.border}
                flex flex-col gap-3 p-5 shadow-sm
                ${ready
                    ? 'hover:shadow-lg hover:-translate-y-0.5 transition-all duration-200 cursor-pointer'
                    : 'opacity-55 cursor-default'
                }
            `}
            onClick={ready ? () => onOpen(topic) : undefined}
            role={ready ? 'button' : undefined}
            tabIndex={ready ? 0 : undefined}
            onKeyDown={ready ? e => e.key === 'Enter' && onOpen(topic) : undefined}
        >
            {/* Top row: subject + level */}
            <div className="flex items-center justify-between gap-2 flex-wrap">
                <SubjectBadge subject={subject} />
                {topic.level && <LevelTag level={topic.level} />}
            </div>

            {/* Title */}
            <div>
                <p className="text-[17px] font-bold text-slate-900 leading-snug">{topic.title}</p>
                {!ready && (
                    <span className="inline-block mt-1.5 text-xs font-semibold text-slate-400 bg-slate-100 px-2 py-0.5 rounded-full">
                        Sắp có
                    </span>
                )}
            </div>

            {/* Description */}
            <p className="text-sm text-slate-600 leading-relaxed flex-1">{topic.desc}</p>

            {/* Tags */}
            <div className="flex flex-wrap gap-1.5">
                {topic.tags.map(tag => (
                    <span key={tag} className="text-xs px-2 py-0.5 bg-slate-100 text-slate-500 rounded-md font-medium">
                        {tag}
                    </span>
                ))}
            </div>

            {/* CTA */}
            {ready && (
                <button
                    type="button"
                    onClick={e => { e.stopPropagation(); onOpen(topic) }}
                    className={`mt-1 w-full py-2.5 rounded-xl ${s.btn} text-white text-sm font-bold text-center transition-colors shadow-sm`}
                >
                    Mở bài toán →
                </button>
            )}
        </div>
    )
}

/* ─────────────────────────────────────────────────────────────────
   Hub view — trang chọn bài
   ───────────────────────────────────────────────────────────────── */
function HubView({ onOpen }) {
    const [search, setSearch] = useState('')
    const [filterSubject, setFilterSubject] = useState(null)

    const subjectMap = useMemo(
        () => Object.fromEntries(SUBJECTS.map(s => [s.id, s])),
        [],
    )

    const visible = useMemo(() => {
        const q = search.trim().toLowerCase()
        return TOPICS.filter(t => {
            if (filterSubject && t.subjectId !== filterSubject) return false
            if (!q) return true
            return (
                t.title.toLowerCase().includes(q) ||
                t.desc.toLowerCase().includes(q) ||
                t.tags.some(g => g.toLowerCase().includes(q))
            )
        })
    }, [search, filterSubject])

    const readyCount = visible.filter(t => t.ready).length
    const soonCount = visible.filter(t => !t.ready).length

    return (
        <div className="min-h-screen bg-slate-50">
            {/* ── Hero ─────────────────────────────────────────────── */}
            <div className="bg-white border-b border-slate-200">
                <div className="max-w-5xl mx-auto px-6 py-12 text-center">
                    <div className="text-5xl mb-4 select-none">🧮</div>
                    <h1 className="text-3xl font-black text-slate-900 tracking-tight mb-3">
                        Toán Học Tương Tác
                    </h1>
                    <p className="text-base text-slate-500 max-w-lg mx-auto leading-relaxed">
                        Chọn dạng bài → nhập số liệu → hệ thống tự tính và giải thích từng bước.{' '}
                        <span className="text-slate-400">Thiết kế để trình chiếu trực tiếp trên lớp.</span>
                    </p>
                </div>
            </div>

            {/* ── Filter bar ───────────────────────────────────────── */}
            <div className="max-w-5xl mx-auto px-6 pt-7 pb-4 space-y-4">
                {/* Search */}
                <div className="relative max-w-sm">
                    <span className="absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none text-sm">
                        🔍
                    </span>
                    <input
                        type="text"
                        placeholder="Tìm kiếm dạng bài, tag..."
                        value={search}
                        onChange={e => setSearch(e.target.value)}
                        className="w-full bg-white border border-slate-200 rounded-xl pl-10 pr-4 py-2.5 text-sm text-slate-800 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent shadow-sm"
                    />
                </div>

                {/* Subject filter pills */}
                <div className="flex gap-2 flex-wrap">
                    <button
                        type="button"
                        onClick={() => setFilterSubject(null)}
                        className={`inline-flex items-center px-4 py-1.5 rounded-full text-sm font-semibold border transition-all ${!filterSubject
                            ? 'bg-slate-900 text-white border-transparent shadow-sm'
                            : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'
                            }`}
                    >
                        Tất cả
                    </button>
                    {SUBJECTS.map(sub => {
                        const s = STYLES[sub.color] || STYLES.blue
                        const on = filterSubject === sub.id
                        return (
                            <button
                                key={sub.id}
                                type="button"
                                onClick={() => setFilterSubject(prev => prev === sub.id ? null : sub.id)}
                                className={`inline-flex items-center gap-1.5 px-4 py-1.5 rounded-full text-sm font-semibold border transition-all ${on ? s.pillOn + ' shadow-sm' : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'
                                    }`}
                            >
                                {sub.icon} {sub.name}
                            </button>
                        )
                    })}
                </div>

                {/* Result count */}
                <p className="text-xs text-slate-400 font-medium">
                    {readyCount} dạng bài đang có
                    {soonCount > 0 && ` · ${soonCount} sắp có`}
                    {search && (
                        <> · kết quả cho &ldquo;<span className="text-slate-600">{search}</span>&rdquo;</>
                    )}
                </p>
            </div>

            {/* ── Topic grid ───────────────────────────────────────── */}
            <div className="max-w-5xl mx-auto px-6 pb-24">
                {visible.length === 0 ? (
                    <div className="text-center py-24">
                        <div className="text-4xl mb-4">🔍</div>
                        <p className="text-base text-slate-400">Không tìm thấy dạng bài phù hợp</p>
                        <button
                            type="button"
                            onClick={() => { setSearch(''); setFilterSubject(null) }}
                            className="mt-4 text-sm text-blue-600 hover:text-blue-800 font-semibold"
                        >
                            Xóa bộ lọc
                        </button>
                    </div>
                ) : (
                    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                        {visible.map(t => (
                            <TopicCard
                                key={t.id}
                                topic={t}
                                subject={subjectMap[t.subjectId]}
                                onOpen={onOpen}
                            />
                        ))}
                    </div>
                )}
            </div>
        </div>
    )
}

/* ─────────────────────────────────────────────────────────────────
   Breadcrumb — hiển thị khi đang xem bài
   ───────────────────────────────────────────────────────────────── */
function TopicBreadcrumb({ topic, subject, onBack }) {
    const s = STYLES[subject?.color] || STYLES.blue
    return (
        <div className="bg-white border-b border-slate-200 sticky top-0 z-20 shadow-sm">
            <div className="max-w-7xl mx-auto px-4 py-3 flex items-center gap-2 text-sm min-w-0">
                <button
                    type="button"
                    onClick={onBack}
                    className="flex items-center gap-1.5 text-slate-500 hover:text-slate-900 font-semibold transition-colors flex-shrink-0"
                >
                    ← Giải Toán
                </button>
                <span className="text-slate-300 flex-shrink-0">/</span>
                <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-semibold border ${s.badge} flex-shrink-0`}>
                    {subject?.icon} {subject?.name}
                </span>
                <span className="text-slate-300 flex-shrink-0">/</span>
                <span className="text-slate-700 font-medium truncate">{topic.title}</span>
            </div>
        </div>
    )
}

/* ─────────────────────────────────────────────────────────────────
   Root export
   ───────────────────────────────────────────────────────────────── */
export default function GiaiToanApp() {
    const [activeTopic, setActiveTopic] = useState(null)

    const subjectMap = useMemo(
        () => Object.fromEntries(SUBJECTS.map(s => [s.id, s])),
        [],
    )

    function openTopic(topic) {
        if (!topic.ready || !topic.Component) return
        setActiveTopic(topic)
        window.scrollTo({ top: 0, behavior: 'smooth' })
    }

    function goToHub() {
        setActiveTopic(null)
        window.scrollTo({ top: 0, behavior: 'smooth' })
    }

    if (activeTopic) {
        const { Component, cProps } = activeTopic
        const subject = subjectMap[activeTopic.subjectId]
        return (
            <div className="min-h-screen bg-slate-50">
                <TopicBreadcrumb topic={activeTopic} subject={subject} onBack={goToHub} />
                <Component
                    {...(cProps || {})}
                    onNavigate={id => { if (id === 'home') goToHub() }}
                />
            </div>
        )
    }

    return <HubView onOpen={openTopic} />
}
