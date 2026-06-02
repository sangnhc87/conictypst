/**
 * stirling.js — Stirling numbers of the second kind S(n, k).
 *
 * S(n, k) = number of ways to partition n DISTINCT objects into
 *           exactly k NON-EMPTY groups (groups are unlabeled).
 *
 * Recurrence: S(n, k) = S(n-1, k-1) + k · S(n-1, k)
 *   "Câu chuyện học sinh thứ n":
 *     - Học sinh n tự lập nhóm mới (S(n-1, k-1) cách) ← còn k-1 nhóm cho n-1 bạn trước
 *     - Học sinh n gia nhập 1 trong k nhóm sẵn có (k · S(n-1, k) cách)
 */

/**
 * Build the full Stirling triangle S[0..maxN][0..maxN].
 * @param {number} maxN
 * @returns {number[][]}
 */
export function stirlingTriangle(maxN) {
    const S = Array.from({ length: maxN + 1 }, () => new Array(maxN + 1).fill(0))
    S[0][0] = 1
    for (let n = 1; n <= maxN; n++) {
        for (let k = 1; k <= n; k++) {
            S[n][k] = S[n - 1][k - 1] + k * S[n - 1][k]
        }
    }
    return S
}

/** Single value S(n, k). */
export function stirling(n, k) {
    if (k <= 0 || k > n) return k === 0 && n === 0 ? 1 : 0
    return stirlingTriangle(n)[n][k]
}

/**
 * Compute surjective (onto) function count via inclusion-exclusion.
 * = #{f : [n] → [k] | each box non-empty}
 * = Σ_{j=0}^{k} (-1)^j · C(k,j) · (k-j)^n
 */
export function surjective(n, k, Cfn) {
    let total = 0
    const rows = []
    for (let j = 0; j <= k; j++) {
        const sign = j % 2 === 0 ? 1 : -1
        const ck = Cfn(k, j)
        const ways = Math.round(Math.pow(k - j, n))
        const contrib = sign * ck * ways
        total += contrib
        rows.push({ j, sign, ck, ways, contrib })
    }
    return { total, rows }
}
