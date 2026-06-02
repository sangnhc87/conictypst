/**
 * partitions.js — Integer partition enumeration and counting.
 *
 * A partition of n into at most k parts is a sorted (descending)
 * list of positive integers that sum to n, with at most k terms.
 *
 * Example: n=4, k=3 → [4], [3,1], [2,2], [2,1,1]  ← 4 partitions
 */

/**
 * Enumerate all partitions of n into AT MOST maxParts parts.
 * Each partition is returned as an array sorted descending.
 * @param {number} n
 * @param {number} maxParts
 * @returns {number[][]}
 */
export function enumeratePartitions(n, maxParts) {
    const result = []
    function bt(rem, maxVal, curr) {
        if (rem === 0) { result.push([...curr]); return }
        if (curr.length >= maxParts) return
        for (let p = Math.min(rem, maxVal); p >= 1; p--) {
            curr.push(p)
            bt(rem - p, p, curr)
            curr.pop()
        }
    }
    bt(n, n, [])
    return result
}

/**
 * Count partitions of n into AT MOST maxParts parts.
 * Uses DP: dp[i][j] = # partitions of i into ≤ j parts.
 * Recurrence: dp[i][j] = dp[i][j-1] + dp[i-j][j]  (add a part of size j)
 */
export function countPartitions(n, maxParts) {
    // Equivalent to: partitions of n into parts each of size ≤ maxParts (duality)
    // We just enumerate for small n, otherwise DP
    if (n > 30 || maxParts >= n) {
        const dp = new Array(n + 1).fill(0)
        dp[0] = 1
        // Count partitions using "add part of size 1..maxParts" similar to coin change
        // But this counts ordered partitions, not unordered.
        // Use: number of partitions of n with largest part ≤ maxParts
        // which equals number of partitions into ≤ maxParts parts (duality)
        const table = Array.from({ length: maxParts + 1 }, () => new Array(n + 1).fill(0))
        for (let j = 0; j <= maxParts; j++) table[j][0] = 1
        for (let j = 1; j <= maxParts; j++) {
            for (let i = 1; i <= n; i++) {
                table[j][i] = table[j - 1][i] + (i >= j ? table[j][i - j] : 0)
            }
        }
        return table[maxParts][n]
    }
    return enumeratePartitions(n, maxParts).length
}
