/**
 * modularGF.js — Generating Functions for parity / modular constraints.
 *
 * Each variable x_i can have one of:
 *   'any'   — x_i ≥ 0           G_i(x) = 1/(1-x)
 *   'pos'   — x_i ≥ 1           G_i(x) = x/(1-x)
 *   'even'  — x_i chẵn ≥ 0     G_i(x) = 1/(1-x²)
 *   'odd'   — x_i lẻ ≥ 1       G_i(x) = x/(1-x²)
 *   'mod_d' — x_i bội d ≥ 0    G_i(x) = 1/(1-x^d)  [user supplies d]
 */

import { polyMul, rangePoly, modRangePoly } from './gfEngine.js'

export const CONSTRAINT_OPTIONS = [
    { id: 'any', label: 'Tùy ý (≥ 0)', gfFn: (d, n) => rangePoly(0, null, n), latex: () => '\\dfrac{1}{1-x}' },
    { id: 'pos', label: 'Dương (≥ 1)', gfFn: (d, n) => rangePoly(1, null, n), latex: () => '\\dfrac{x}{1-x}' },
    { id: 'even', label: 'Chỉ chẵn (0,2,4…)', gfFn: (d, n) => modRangePoly(2, 0, null, n), latex: () => '\\dfrac{1}{1-x^2}' },
    { id: 'odd', label: 'Chỉ lẻ (1,3,5…)', gfFn: (d, n) => modRangePoly(2, 1, null, n), latex: () => '\\dfrac{x}{1-x^2}' },
    { id: 'mod_d', label: 'Bội của d', gfFn: (d, n) => modRangePoly(d, 0, null, n), latex: (d) => `\\dfrac{1}{1-x^{${d}}}` },
]

/** @param {{ id: string, d?: number }} constraint */
export function constraintLatex({ id, d = 3 }) {
    const opt = CONSTRAINT_OPTIONS.find(o => o.id === id)
    return opt ? opt.latex(d) : '?'
}

export function constraintPoly(constraint, n) {
    const { id, d = 3 } = constraint
    const opt = CONSTRAINT_OPTIONS.find(o => o.id === id)
    return opt ? opt.gfFn(d, n) : new Array(n + 1).fill(0)
}

/**
 * @param {number} n
 * @param {Array<{label:string, id:string, d?:number}>} vars
 */
export function computeModularGF(n, vars) {
    const k = vars.length

    const gfLabels = vars.map(v => constraintLatex(v))

    // Multiply all polynomials
    let combined = new Array(n + 1).fill(0)
    combined[0] = 1
    for (const v of vars) {
        combined = polyMul(combined, constraintPoly(v, n), n)
    }
    const answer = combined[n] ?? 0

    // Combined GF LaTeX
    const combinedGFLatex = gfLabels.join(' \\cdot ')

    // Constraint description strings
    const constraintDescs = vars.map(v => {
        const { id, d = 3 } = v
        if (id === 'any') return `${v.label} \\geq 0`
        if (id === 'pos') return `${v.label} \\geq 1`
        if (id === 'even') return `${v.label} \\in \\{0,2,4,\\ldots\\}`
        if (id === 'odd') return `${v.label} \\in \\{1,3,5,\\ldots\\}`
        if (id === 'mod_d') return `${v.label} \\in \\{0,${d},${2 * d},\\ldots\\}`
        return ''
    })

    return { n, k, vars, gfLabels, combinedGFLatex, constraintDescs, answer }
}
