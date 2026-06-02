/**
 * baohoa.js — Logic cho bài toán tăng trưởng 2 giai đoạn + bão hoà.
 *
 * Mô hình:
 *   Giai đoạn 1: N(t) = N0 · e^(a·t),  0 ≤ t ≤ t0
 *   Giai đoạn 2: M(u) = A − B · e^(−b·u),  u = t − t0 ≥ 0
 *      (hoặc M(t) = A − B · e^(−b·(t−t0)) nếu viết theo t thẳng)
 *
 * Điều kiện nối trơn tại t = t0:
 *   Liên tục:  M(0) = N(t0)       →  A − B = N0·e^(a·t0)
 *   Đạo hàm: M'(0) = N'(t0)      →  b·B   = N0·a·e^(a·t0)
 *
 * Suy ra:
 *   B = (N0·a·e^(a·t0)) / b
 *   A = N0·e^(a·t0) + B
 *     = N0·e^(a·t0) · (1 + a/b)
 *
 * Giới hạn bão hoà: lim_{t→∞} M = A
 */

/**
 * Tính A, B từ các tham số đầu vào.
 * Trả về { Nt0, dNt0, B, A, saturation, Bexact, Aexact }
 * dạng số thập phân đủ chính xác để hiển thị + kiểm tra.
 *
 * @param {number} N0   Giá trị ban đầu (t=0) của hàm giai đoạn 1
 * @param {number} a    Tốc độ tăng trưởng giai đoạn 1 (dương)
 * @param {number} t0   Thời điểm chuyển giai đoạn
 * @param {number} b    Hệ số suy giảm giai đoạn 2 (dương)
 */
export function solveBaoHoa({ N0, a, t0, b }) {
    const eat0 = Math.exp(a * t0)         // e^(a·t0)
    const Nt0 = N0 * eat0                 // N(t0) = N0·e^(a·t0)
    const dNt0 = N0 * a * eat0            // N'(t0) = N0·a·e^(a·t0)

    const B = dNt0 / b                    // B = N0·a·e^(a·t0) / b
    const A = Nt0 + B                     // A = N0·e^(a·t0)·(1 + a/b)

    return {
        Nt0,        // giá trị tại điểm chuyển (số)
        dNt0,       // đạo hàm tại điểm chuyển
        B,          // hệ số B
        A,          // hệ số A = giới hạn bão hoà
        saturation: A,
        // Biểu thức "đẹp" (dưới dạng text toán học cho KaTeX)
        exponent: a * t0,   // số mũ a·t0 để hiển thị e^(a·t0)
    }
}

/**
 * Sinh dữ liệu đường cong để vẽ đồ thị.
 * Trả về mảng { t, y } với t từ 0 đến tMax.
 */
export function curveData({ N0, a, t0, b, A, B, tMax = null, nPoints = 120 }) {
    const end = tMax ?? t0 * 3.5
    const pts = []
    for (let i = 0; i <= nPoints; i++) {
        const t = (end * i) / nPoints
        let y
        if (t <= t0) {
            y = N0 * Math.exp(a * t)
        } else {
            const u = t - t0
            y = A - B * Math.exp(-b * u)
        }
        pts.push({ t: +t.toFixed(3), y: +y.toFixed(4) })
    }
    return pts
}

/**
 * Làm tròn đẹp số thực để hiển thị.
 */
export function fmt(x, decimals = 3) {
    if (!isFinite(x)) return '?'
    return x.toLocaleString('vi-VN', {
        minimumFractionDigits: 0,
        maximumFractionDigits: decimals,
    })
}

/**
 * Kiểm tra mệnh đề đúng/sai phổ biến trong đề thi.
 * Trả về mảng { label, expected, actual, correct, hint }
 */
export function checkStatements({ N0, a, t0, b, A, B, Nt0, dNt0 }) {
    return [
        {
            id: 'a',
            label: `N(${t0}) = N₀·e^(a·t₀)`,
            value: Nt0,
            hint: 'Thay t = t₀ vào công thức giai đoạn 1.',
        },
        {
            id: 'b',
            label: `B = N₀·a·e^(a·t₀) / b`,
            value: B,
            hint: 'Từ điều kiện đạo hàm liên tục: b·B = N\'(t₀)',
        },
        {
            id: 'c',
            label: `A = N₀·e^(a·t₀)·(1 + a/b)`,
            value: A,
            hint: 'A = N(t₀) + B',
        },
        {
            id: 'd',
            label: `Giới hạn bão hoà = A`,
            value: A,
            hint: 'Khi t→∞, M(t) = A − B·e^(−b·u) → A.',
        },
    ]
}
