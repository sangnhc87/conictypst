/**
 * Các hàm toán học cơ bản cho bài toán xếp ghế.
 */

/** n! với n >= 0 */
export function factorial(n) {
    if (n < 0) return 0
    let r = 1
    for (let i = 2; i <= n; i++) r *= i
    return r
}

/** C(n, k) = tổ hợp chập k của n */
export function C(n, k) {
    if (k < 0 || k > n) return 0
    if (k === 0 || k === n) return 1
    k = Math.min(k, n - k)
    let r = 1
    for (let i = 0; i < k; i++) {
        r = (r * (n - i)) / (i + 1)
    }
    return Math.round(r)
}

/** Hệ số đa thức: total! / (g1! * g2! * ...) */
export function multinomial(total, groups) {
    if (total === 0) return 1
    let r = factorial(total)
    for (const g of groups) r = r / factorial(g)
    return Math.round(r)
}

/** Định dạng LaTeX: n! */
export function latexFactorial(n) {
    return `${n}!`
}

/** Định dạng LaTeX: tổng tích hệ số tổ hợp */
export function latexChosenPairs(forbidden, indices) {
    const parts = []
    for (let j = 0; j < forbidden.length; j++) {
        if (indices[j] > 0) {
            parts.push(`C_{${forbidden[j].count - 1}}^{${indices[j]}}`)
        }
    }
    return parts.length > 0 ? parts.join(' \\cdot ') : '1'
}

/** Định dạng LaTeX: phân số hoán vị đồng nhất */
export function latexMultinomial(total, entities) {
    const nonZero = entities.filter(e => e > 0)
    const denom = nonZero.map(e => `${e}!`).join(' \\cdot ')
    return `\\dfrac{${total}!}{${denom}}`
}

/** Định dạng số đẹp với dấu phân cách ngàn */
export function fmtNumber(n) {
    return n.toLocaleString('vi-VN')
}
