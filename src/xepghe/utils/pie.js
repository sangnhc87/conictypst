/**
 * Engine tính bảng PIE (Principle of Inclusion-Exclusion)
 * cho bài toán xếp ghế hàng ngang.
 *
 * Công thức:
 *   Mỗi dòng (i, j, k, ...) ứng với "ghép i cặp AA, j cặp BB, k cặp CC, ..."
 *   - Chọn cặp = C(nA-1, i) · C(nB-1, j) · ...
 *   - Thực thể còn lại = (nA−i, nB−j, ..., nE)
 *   - Tổng = T = sum các thực thể
 *   - Hoán vị đồng nhất = T! / (nA−i)! / (nB−j)! / ... / nE!
 *   - Dấu = (−1)^(i+j+k+...)
 *   - Đóng góp = Dấu × Chọn cặp × Hoán vị
 *
 *   Số cấu trúc = Σ Đóng góp
 *   N = Số cấu trúc × nA! × nB! × nC! × ...   (không nhân E!)
 */

import { C, factorial, multinomial, latexChosenPairs, latexMultinomial } from './math.js'

/**
 * @param {Array<{label: string, count: number, forbidden: boolean, blank: boolean}>} classes
 *   blank: true cho ghế trống E — không nhân factorial cuối, không có index PIE
 * @returns {{ rows, layers, structureCount, N, classes, forbidden }}
 */
export function computePIE(classes) {
    const forbidden = classes.filter(c => c.forbidden)
    const ranges = forbidden.map(c => c.count - 1)

    const rows = []

    function gen(depth, indices, s) {
        if (depth === forbidden.length) {
            const sign = s % 2 === 0 ? 1 : -1

            // Chọn cặp
            let chosenPairs = 1
            for (let j = 0; j < forbidden.length; j++) {
                chosenPairs *= C(forbidden[j].count - 1, indices[j])
            }

            // Thực thể còn lại mỗi lớp
            const entities = classes.map(c => {
                const fi = forbidden.findIndex(f => f === c)
                return fi >= 0 ? c.count - indices[fi] : c.count
            })

            const total = entities.reduce((a, b) => a + b, 0)
            const multi = multinomial(total, entities)
            const contribution = sign * chosenPairs * multi

            // Nhãn hiển thị
            const mergedPairs = forbidden
                .map((c, j) =>
                    indices[j] > 0
                        ? indices[j] === 1
                            ? `${c.label}${c.label}`
                            : `${indices[j]}×${c.label}${c.label}`
                        : null,
                )
                .filter(Boolean)

            const tupleLabel = `(${indices.join(', ')})`
            const pairedLabel = mergedPairs.length > 0 ? mergedPairs.join(' + ') : 'Không ghép'

            rows.push({
                indices: [...indices],
                tupleLabel,
                pairedLabel,
                s,
                sign,
                chosenPairs,
                chosenPairsLatex: latexChosenPairs(forbidden, indices),
                entities,
                total,
                multi,
                multiLatex: latexMultinomial(total, entities),
                contribution,
            })
            return
        }

        for (let v = 0; v <= ranges[depth]; v++) {
            indices.push(v)
            gen(depth + 1, indices, s + v)
            indices.pop()
        }
    }

    gen(0, [], 0)

    // Sắp theo tầng s tăng dần
    rows.sort((a, b) => a.s - b.s || a.indices.join(',').localeCompare(b.indices.join(',')))

    // Nhóm theo tầng s
    const layers = []
    let currentLayer = null
    for (const row of rows) {
        if (!currentLayer || currentLayer.s !== row.s) {
            currentLayer = { s: row.s, sign: row.sign, rows: [] }
            layers.push(currentLayer)
        }
        currentLayer.rows.push(row)
    }

    const structureCount = rows.reduce((acc, r) => acc + r.contribution, 0)

    // Nhân giai thừa từng lớp (trừ ghế trống)
    const nonBlank = classes.filter(c => !c.blank)
    const factorialProduct = nonBlank.reduce((acc, c) => acc * factorial(c.count), 1)
    const N = structureCount * factorialProduct

    // Xây dựng chuỗi LaTeX cho công thức N
    const factorialLatex = nonBlank.map(c => `${c.count}!`).join(' \\times ')

    return {
        rows,
        layers,
        structureCount,
        N,
        factorialProduct,
        factorialLatex,
        classes,
        forbidden,
    }
}

/**
 * Tạo "bảng tóm tắt tầng dấu" — hiển thị trước khi bảng PIE đầy đủ.
 * Trả về mảng: [{ s, sign, rowCount, total }]
 */
export function signLayerSummary(result) {
    return result.layers.map(layer => ({
        s: layer.s,
        sign: layer.sign,
        rowCount: layer.rows.length,
        layerTotal: layer.rows.reduce((acc, r) => acc + r.contribution, 0),
    }))
}
