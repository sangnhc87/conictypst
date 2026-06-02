/**
 * Home — Trang chủ chọn dạng bài xếp ghế.
 */

import React from 'react'

const TOPICS = [
    {
        id: 'row-single-plain',
        icon: '🪑',
        title: '1 Hàng Ngang — Không Ghế Trống',
        desc: 'Xếp n học sinh từ nhiều lớp vào 1 hàng ngang. Không có ghế trống. Học sinh cùng lớp không được ngồi liền kề.',
        tags: ['PIE', '1 hàng', 'cơ bản'],
        color: 'from-blue-500 to-blue-700',
        light: 'bg-blue-50 border-blue-200',
        props: { hasBlank: false },
    },
    {
        id: 'row-single-blank',
        icon: '🪑',
        title: '1 Hàng Ngang — Có Ghế Trống',
        desc: 'Tương tự bài cơ bản nhưng xen kẽ thêm ghế trống. Ghế trống không bị cấm kề nhau, không tính giai thừa.',
        tags: ['PIE', '1 hàng', 'ghế trống'],
        color: 'from-emerald-500 to-emerald-700',
        light: 'bg-emerald-50 border-emerald-200',
        props: { hasBlank: true },
    },
    {
        id: 'row-double',
        icon: '🪑🪑',
        title: '2 Hàng Đối Diện',
        desc: 'Xếp học sinh vào 2 hàng ghế đối mặt nhau. Phân tích bằng phương pháp đặc trưng cột (X, Y, Z, U, V, T, W).',
        tags: ['Đặc trưng cột', '2 hàng', 'nâng cao'],
        color: 'from-violet-500 to-violet-700',
        light: 'bg-violet-50 border-violet-200',
        props: {},
    },
]

const COMING_SOON = [
    {
        icon: '🔄',
        title: 'Xếp Ghế Tròn',
        desc: 'Bàn tròn — áp dụng hoán vị vòng kết hợp PIE.',
        tags: ['vòng', 'sắp tới'],
    },
    {
        icon: '🎭',
        title: 'Xếp Ghế Tổng Quát',
        desc: 'Nhiều ràng buộc phức tạp: cố định vị trí, ghế đặc biệt...',
        tags: ['tổng hợp', 'sắp tới'],
    },
]

export default function Home({ onNavigate }) {
    return (
        <div className="max-w-4xl mx-auto px-4 py-8 space-y-10">
            {/* Header */}
            <div className="text-center space-y-3">
                <div className="text-5xl">🪑</div>
                <h1 className="text-3xl font-bold text-gray-900">
                    Bài Toán Xếp Ghế — Trình Chiếu Giảng Dạy
                </h1>
                <p className="text-gray-500 text-base max-w-xl mx-auto">
                    Nhập số liệu → hệ thống tự tính bảng PIE, mô phỏng sắp xếp, giải thích từng bước.
                    Thiết kế để trình chiếu trực tiếp trên lớp.
                </p>
            </div>

            {/* Chủ đề chính */}
            <div>
                <h2 className="text-lg font-bold text-gray-700 mb-4 flex items-center gap-2">
                    <span className="w-1.5 h-6 rounded-full bg-blue-500 inline-block" />
                    Dạng bài đang có
                </h2>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                    {TOPICS.map(topic => (
                        <button
                            key={topic.id}
                            type="button"
                            onClick={() => onNavigate(topic.id, topic.props)}
                            className={`
                text-left p-5 rounded-2xl border-2 ${topic.light}
                hover:shadow-lg active:scale-[0.98] transition-all duration-150
                group cursor-pointer
              `}
                        >
                            {/* Icon + gradient strip */}
                            <div
                                className={`w-12 h-12 rounded-xl bg-gradient-to-br ${topic.color} flex items-center justify-center text-2xl mb-3 shadow-sm`}
                            >
                                {topic.icon}
                            </div>
                            <h3 className="font-bold text-gray-800 text-base leading-snug mb-2">
                                {topic.title}
                            </h3>
                            <p className="text-sm text-gray-600 leading-relaxed mb-3">{topic.desc}</p>
                            <div className="flex flex-wrap gap-1.5">
                                {topic.tags.map(tag => (
                                    <span
                                        key={tag}
                                        className="px-2 py-0.5 rounded-full bg-white border border-gray-200 text-xs text-gray-500 font-medium"
                                    >
                                        {tag}
                                    </span>
                                ))}
                            </div>
                            <div className="mt-3 text-sm font-semibold text-blue-600 group-hover:text-blue-800 transition-colors">
                                Mở bài toán →
                            </div>
                        </button>
                    ))}
                </div>
            </div>

            {/* Sắp có */}
            <div>
                <h2 className="text-lg font-bold text-gray-400 mb-4 flex items-center gap-2">
                    <span className="w-1.5 h-6 rounded-full bg-gray-300 inline-block" />
                    Sắp cập nhật
                </h2>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {COMING_SOON.map(item => (
                        <div
                            key={item.title}
                            className="p-5 rounded-2xl border-2 border-dashed border-gray-200 bg-gray-50 opacity-60"
                        >
                            <div className="text-3xl mb-2">{item.icon}</div>
                            <h3 className="font-bold text-gray-600 text-base mb-1">{item.title}</h3>
                            <p className="text-sm text-gray-500">{item.desc}</p>
                        </div>
                    ))}
                </div>
            </div>

            {/* Hướng dẫn sử dụng */}
            <div className="rounded-2xl border border-blue-200 bg-blue-50 p-5">
                <h2 className="font-bold text-blue-800 text-base mb-3 flex items-center gap-2">
                    <span>💡</span> Cách sử dụng trong lớp học
                </h2>
                <ol className="space-y-2 text-sm text-blue-700">
                    <li className="flex gap-2">
                        <span className="font-bold text-blue-500 flex-shrink-0">1.</span>
                        <span>Chọn dạng bài tương ứng với bài đang giảng.</span>
                    </li>
                    <li className="flex gap-2">
                        <span className="font-bold text-blue-500 flex-shrink-0">2.</span>
                        <span>Nhập số lượng học sinh mỗi lớp, bật/tắt "cấm kề" theo đề bài.</span>
                    </li>
                    <li className="flex gap-2">
                        <span className="font-bold text-blue-500 flex-shrink-0">3.</span>
                        <span>
                            Nhấn <strong>"Tính PIE"</strong> — hệ thống hiện bảng tầng dấu trước, rồi{' '}
                            <strong>từng dòng một</strong> khi giáo viên bấm "Hiện dòng tiếp theo".
                        </span>
                    </li>
                    <li className="flex gap-2">
                        <span className="font-bold text-blue-500 flex-shrink-0">4.</span>
                        <span>Khu mô phỏng bên phải hiển thị ví dụ sắp xếp ngẫu nhiên hợp lệ — có thể bấm "Xáo lại" nhiều lần.</span>
                    </li>
                </ol>
            </div>
        </div>
    )
}
