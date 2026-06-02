/**
 * coinChange.js — Coin Change / Partition counter.
 *
 * Counts the number of ways to reach a target amount using coins
 * of given denominations (each denomination unlimited supply).
 *
 * GF:  G(x) = Π_{c ∈ coins}  1/(1 − x^c)
 * Answer = [x^target] G(x), computed via standard DP.
 */

/**
 * @param {number[]} denominations  — e.g. [1, 5, 10, 25]
 * @param {number}   target         — target amount
 * @returns {{ denominations, target, answer, dp, gfLatex }}
 */
export function computeCoinChange(denominations, target) {
    const coins = [...new Set(denominations.filter(d => d >= 1 && d <= target))].sort((a, b) => a - b)

    if (coins.length === 0) {
        return { denominations: coins, target, answer: target === 0 ? 1 : 0, dp: [target === 0 ? 1 : 0], gfLatex: '1' }
    }

    // Standard DP: dp[j] = number of ways to make amount j
    const dp = new Array(target + 1).fill(0)
    dp[0] = 1
    for (const c of coins) {
        for (let j = c; j <= target; j++) {
            dp[j] += dp[j - c]
        }
    }

    // GF LaTeX
    const gfLatex = coins
        .map(c => `\\dfrac{1}{1-x^{${c}}}`)
        .join(' \\cdot ')

    // Row-by-row DP table: dpTable[coinIdx][amount] = cumulative after adding that coin
    const dpTable = []
    const running = new Array(target + 1).fill(0)
    running[0] = 1
    for (const c of coins) {
        for (let j = c; j <= target; j++) {
            running[j] += running[j - c]
        }
        dpTable.push({ coin: c, row: [...running] })
    }

    return { denominations: coins, target, answer: dp[target], dp, dpTable, gfLatex }
}

/** Preset denomination sets for classroom use */
export const PRESETS = [
    { label: 'Tiền Việt (200, 500, 1000, 2000)', coins: [200, 500, 1000, 2000] },
    { label: 'Đồng xu Mỹ (1, 5, 10, 25 cent)', coins: [1, 5, 10, 25] },
    { label: 'Mệnh giá đơn giản (1, 2, 5)', coins: [1, 2, 5] },
    { label: 'Số Fibonacci (1, 2, 3, 5)', coins: [1, 2, 3, 5] },
    { label: 'Chỉ bội của 3 (3, 6, 9)', coins: [3, 6, 9] },
]
