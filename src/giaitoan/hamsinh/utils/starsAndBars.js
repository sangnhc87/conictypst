/**
 * starsAndBars.js — Stars and Bars solver with Generating Functions + PIE.
 *
 * Problem: count non-negative integer solutions to
 *   x_1 + x_2 + … + x_k = n
 * where each x_i satisfies  lo_i ≤ x_i  (and optionally x_i ≤ hi_i).
 */

import { C, polyMul, rangePoly, popcount } from './gfEngine.js'

// ─── LaTeX helpers ────────────────────────────────────────────────

function varGFLatex({ lo, hi }) {
    if (hi === null) {
        if (lo === 0) return '\\dfrac{1}{1-x}'
        return `\\dfrac{x^{${lo}}}{1-x}`
    }
    if (lo === hi) return lo === 0 ? '1' : `x^{${lo}}`
    if (lo === 0) return `\\dfrac{1-x^{${hi + 1}}}{1-x}`
    return `\\dfrac{x^{${lo}}\\!\\left(1-x^{${hi - lo + 1}}\\right)}{1-x}`
}

function varGFShiftedLatex({ lo, hi }) {
    // After substituting y = x - lo, constraint becomes 0 ≤ y ≤ (hi - lo)
    const ci = hi !== null ? hi - lo : null
    if (ci === null) return '\\dfrac{1}{1-x}'
    if (ci === 0) return '1'
    return `\\dfrac{1-x^{${ci + 1}}}{1-x}`
}

// ─── Main computation ─────────────────────────────────────────────

/**
 * @param {number} n  — target sum
 * @param {Array<{label:string, lo:number, hi:number|null}>} vars
 */
export function computeSAB(n, vars) {
    const k = vars.length
    const sumLo = vars.reduce((s, v) => s + v.lo, 0)
    const nPrime = n - sumLo

    if (nPrime < 0) {
        return { error: `Tổng chặn dưới (${sumLo}) vượt quá n = ${n}.`, answer: 0 }
    }

    // GF labels
    const gfLabels = vars.map(varGFLatex)
    const gfShiftedLabels = vars.map(varGFShiftedLatex)

    // Bounded variables (after shifting: 0 ≤ y_i ≤ c_i = hi_i − lo_i)
    const bvars = vars
        .map((v, i) => ({ ...v, ci: v.hi !== null ? v.hi - v.lo : null, origIdx: i }))
        .filter(v => v.ci !== null)
    const nb = bvars.length

    // Exact answer via polynomial multiplication
    let combined = new Array(n + 1).fill(0)
    combined[0] = 1
    for (const v of vars) {
        combined = polyMul(combined, rangePoly(v.lo, v.hi, n), n)
    }
    const answer = combined[n] ?? 0

    // PIE rows over bounded variables
    const pieRows = []
    for (let mask = 0; mask < (1 << nb); mask++) {
        const subBits = []
        for (let b = 0; b < nb; b++) if (mask & (1 << b)) subBits.push(b)
        const selected = subBits.map(b => bvars[b])
        const sign = popcount(mask) % 2 === 0 ? 1 : -1
        const excess = selected.reduce((s, v) => s + v.ci + 1, 0)
        const m = nPrime - excess
        const term = m >= 0 ? C(m + k - 1, k - 1) : 0
        pieRows.push({
            mask,
            sign,
            subset: selected.map(v => v.label),
            excess,
            m,
            term,
            contrib: sign * term,
            skip: m < 0,
        })
    }

    // Combined GF LaTeX (after shifting)
    const numFactors = bvars.map(v => `(1-x^{${v.ci + 1}})`)
    const numLatex = numFactors.length === 0 ? '' : numFactors.join('')
    const combinedGFLatex = nb === 0
        ? `\\dfrac{1}{(1-x)^{${k}}}`
        : `\\dfrac{${numLatex}}{(1-x)^{${k}}}`

    const directFormulaLatex =
        `C_{${nPrime}+${k}-1}^{${k}-1} = C_{${nPrime + k - 1}}^{${k - 1}} = ${C(nPrime + k - 1, k - 1)}`

    return {
        n, k, vars,
        gfLabels,
        gfShiftedLabels,
        sumLo,
        nPrime,
        answer,
        error: null,
        hasLower: sumLo > 0,
        allUnbounded: nb === 0,
        bvars,
        nb,
        pieRows,
        combinedGFLatex,
        directFormulaLatex,
    }
}
