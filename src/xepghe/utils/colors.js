/**
 * Màu sắc và style cho từng lớp học trong bài toán xếp ghế.
 */

export const CLASS_LABELS = ['A', 'B', 'C', 'D']

export const CLASS_COLORS = {
    A: {
        bg: 'bg-blue-500',
        text: 'text-white',
        light: 'bg-blue-50 border-blue-200',
        badge: 'bg-blue-100 text-blue-800 border border-blue-200',
        dot: '#3b82f6',
        hex: '#3b82f6',
        name: 'xanh dương',
    },
    B: {
        bg: 'bg-emerald-500',
        text: 'text-white',
        light: 'bg-emerald-50 border-emerald-200',
        badge: 'bg-emerald-100 text-emerald-800 border border-emerald-200',
        dot: '#10b981',
        hex: '#10b981',
        name: 'xanh lá',
    },
    C: {
        bg: 'bg-amber-500',
        text: 'text-white',
        light: 'bg-amber-50 border-amber-200',
        badge: 'bg-amber-100 text-amber-800 border border-amber-200',
        dot: '#f59e0b',
        hex: '#f59e0b',
        name: 'cam vàng',
    },
    D: {
        bg: 'bg-purple-500',
        text: 'text-white',
        light: 'bg-purple-50 border-purple-200',
        badge: 'bg-purple-100 text-purple-800 border border-purple-200',
        dot: '#a855f7',
        hex: '#a855f7',
        name: 'tím',
    },
    E: {
        bg: 'bg-gray-200',
        text: 'text-gray-500',
        light: 'bg-gray-50 border-gray-200',
        badge: 'bg-gray-100 text-gray-500 border border-gray-200',
        dot: '#9ca3af',
        hex: '#9ca3af',
        name: 'trống',
    },
}

/** Sign layer colors: chẵn = xanh nhạt, lẻ = đỏ nhạt */
export const SIGN_LAYER_COLORS = {
    plus: 'bg-blue-50 border-l-4 border-blue-400',
    minus: 'bg-red-50 border-l-4 border-red-400',
}

export const SIGN_TEXT = {
    plus: { label: '+', cls: 'text-blue-600 font-bold text-lg' },
    minus: { label: '−', cls: 'text-red-600 font-bold text-lg' },
}
