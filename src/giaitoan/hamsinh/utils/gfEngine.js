/**
 * gfEngine.js — Polynomial arithmetic for Generating Function computations.
 *
 * Polynomials are plain Arrays where index i = coefficient of x^i.
 */

/** Count set bits (popcount) */
export function popcount(n) {
    let c = 0
    while (n) { c += n & 1; n >>>= 1 }
    return c
}

/** Binomial coefficient C(n, k) */
export function C(n, k) {
    if (k < 0 || n < 0 || k > n) return 0
    if (k === 0 || k === n) return 1
    k = Math.min(k, n - k)
    let r = 1
    for (let i = 0; i < k; i++) r = r * (n - i) / (i + 1)
    return Math.round(r)
}

/** Multiply two polynomials, truncating at maxDeg. */
export function polyMul(p, q, maxDeg) {
    const res = new Array(maxDeg + 1).fill(0)
    for (let i = 0; i < p.length && i <= maxDeg; i++) {
        if (!p[i]) continue
        for (let j = 0; j < q.length && i + j <= maxDeg; j++) {
            res[i + j] += p[i] * q[j]
        }
    }
    return res
}

/**
 * Polynomial for a variable restricted to [lo, hi].
 * hi = null → unbounded (generates 1 + x^lo + x^{lo+1} + … up to maxDeg).
 */
export function rangePoly(lo, hi, maxDeg) {
    const res = new Array(maxDeg + 1).fill(0)
    const up = hi === null ? maxDeg : Math.min(hi, maxDeg)
    for (let k = Math.max(0, lo); k <= up; k++) res[k] = 1
    return res
}

/**
 * Polynomial for a variable restricted to multiples of d in [lo, hi].
 * E.g., d=2, lo=0 → even values 0,2,4,...
 *        d=2, lo=1 → odd values 1,3,5,...
 */
export function modRangePoly(d, lo, hi, maxDeg) {
    const res = new Array(maxDeg + 1).fill(0)
    // smallest value ≥ lo that is congruent to lo mod d (or just lo if lo%d fits)
    const start = lo === 0 ? 0 : lo
    const up = hi === null ? maxDeg : Math.min(hi, maxDeg)
    for (let k = start; k <= up; k += d) res[k] = 1
    return res
}

/** Vietnamese number format */
export function fmtN(n) {
    if (typeof n !== 'number' || !Number.isFinite(n)) return '?'
    return n.toLocaleString('vi-VN')
}
