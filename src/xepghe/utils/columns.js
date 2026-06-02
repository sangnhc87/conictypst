/**
 * Hệ phương trình đặc trưng cột cho bài toán xếp ghế 2 HÀNG ĐỐI DIỆN.
 *
 * Mỗi cột (2 ghế đối diện) được phân loại theo cặp lớp:
 *   X = {A, B},  Y = {A, C},  Z = {B, C}     (2 lớp học khác nhau)
 *   U = {A, E},  V = {B, E},  T = {C, E}     (1 lớp + 1 ghế trống)
 *   W = {E, E}                                 (2 ghế trống)
 *
 * Hệ phương trình:
 *   x + y + z + u + v + t + w = m   (tổng cột = số cột = (nA+nB+nC+nE)/2)
 *   x + y + u          = nA          (số ghế A)
 *   x +     z +     v  = nB          (số ghế B)
 *       y + z +         t = nC       (số ghế C)
 *           u + v + t + 2w = nE      (số ghế trống)
 */

import { multinomial } from './math.js'

/** Mô tả từng loại cột */
export const COL_TYPE_INFO = {
    X: { label: 'X', contents: '{A, B}', color: 'bg-blue-100 text-blue-800 border border-blue-200' },
    Y: { label: 'Y', contents: '{A, C}', color: 'bg-violet-100 text-violet-800 border border-violet-200' },
    Z: { label: 'Z', contents: '{B, C}', color: 'bg-green-100 text-green-800 border border-green-200' },
    U: { label: 'U', contents: '{A, E}', color: 'bg-sky-100 text-sky-800 border border-sky-200' },
    V: { label: 'V', contents: '{B, E}', color: 'bg-teal-100 text-teal-800 border border-teal-200' },
    T: { label: 'T', contents: '{C, E}', color: 'bg-amber-100 text-amber-800 border border-amber-200' },
    W: { label: 'W', contents: '{E, E}', color: 'bg-gray-100 text-gray-600 border border-gray-200' },
}

export const COL_ORIENTATION_OPTIONS = {
    X: [
        { top: 'A', bottom: 'B', code: 'AB' },
        { top: 'B', bottom: 'A', code: 'BA' },
    ],
    Y: [
        { top: 'A', bottom: 'C', code: 'AC' },
        { top: 'C', bottom: 'A', code: 'CA' },
    ],
    Z: [
        { top: 'B', bottom: 'C', code: 'BC' },
        { top: 'C', bottom: 'B', code: 'CB' },
    ],
    U: [
        { top: 'A', bottom: 'E', code: 'AE' },
        { top: 'E', bottom: 'A', code: 'EA' },
    ],
    V: [
        { top: 'B', bottom: 'E', code: 'BE' },
        { top: 'E', bottom: 'B', code: 'EB' },
    ],
    T: [
        { top: 'C', bottom: 'E', code: 'CE' },
        { top: 'E', bottom: 'C', code: 'EC' },
    ],
    W: [{ top: 'E', bottom: 'E', code: 'EE' }],
}

/**
 * Liệt kê loại cột có thể xuất hiện dựa trên các lớp hiện diện.
 */
export function relevantColTypes({ hasA, hasB, hasC, hasE }) {
    const types = []
    if (hasA && hasB) types.push('X')
    if (hasA && hasC) types.push('Y')
    if (hasB && hasC) types.push('Z')
    if (hasA && hasE) types.push('U')
    if (hasB && hasE) types.push('V')
    if (hasC && hasE) types.push('T')
    if (hasE) types.push('W')
    return types
}

/**
 * Xây dựng hệ phương trình dạng chuỗi LaTeX để hiển thị.
 */
export function buildEquationSystem({ nA, nB, nC, nE, m }) {
    const allTypes = relevantColTypes({ hasA: nA > 0, hasB: nB > 0, hasC: nC > 0, hasE: nE > 0 })

    const lines = []
    const termOf = {
        X: ['x', ['A', 'B']],
        Y: ['y', ['A', 'C']],
        Z: ['z', ['B', 'C']],
        U: ['u', ['A', 'E']],
        V: ['v', ['B', 'E']],
        T: ['t', ['C', 'E']],
        W: ['w', ['E', 'E']],
    }

    // Tổng cột
    const colTerms = allTypes.map(tp => termOf[tp][0]).join(' + ')
    lines.push(`${colTerms} = ${m} \\quad (\\text{tổng số cột})`)

    // Ghế A
    if (nA > 0) {
        const aTerms = allTypes.filter(tp => termOf[tp][1].includes('A')).map(tp => termOf[tp][0])
        lines.push(`${aTerms.join(' + ')} = ${nA} \\quad (\\text{ghế lớp A})`)
    }
    // Ghế B
    if (nB > 0) {
        const bTerms = allTypes.filter(tp => termOf[tp][1].includes('B')).map(tp => termOf[tp][0])
        lines.push(`${bTerms.join(' + ')} = ${nB} \\quad (\\text{ghế lớp B})`)
    }
    // Ghế C
    if (nC > 0) {
        const cTerms = allTypes.filter(tp => termOf[tp][1].includes('C')).map(tp => termOf[tp][0])
        lines.push(`${cTerms.join(' + ')} = ${nC} \\quad (\\text{ghế lớp C})`)
    }
    // Ghế trống
    if (nE > 0) {
        const eTerms = allTypes.filter(tp => {
            const cls = termOf[tp][1]
            return cls.filter(c => c === 'E').length === 1
        }).map(tp => termOf[tp][0])
        const wCoeff = allTypes.includes('W') ? ' + 2w' : ''
        lines.push(`${eTerms.join(' + ')}${wCoeff} = ${nE} \\quad (\\text{ghế trống})`)
    }

    return lines
}

/**
 * Giải hệ để tìm tất cả nghiệm nguyên không âm.
 */
export function solveColumnSystem({ nA = 0, nB = 0, nC = 0, nE = 0 }) {
    const total = nA + nB + nC + nE
    if (total % 2 !== 0) {
        return { error: 'Tổng số người + ghế trống phải là số CHẴN (mỗi cột gồm 2 ghế).', solutions: [], m: 0 }
    }
    const m = total / 2
    const solutions = []

    for (let w = 0; w <= Math.floor(nE / 2); w++) {
        const uvtSum = nE - 2 * w
        for (let u = 0; u <= Math.min(uvtSum, nA); u++) {
            for (let v = 0; v <= Math.min(uvtSum - u, nB); v++) {
                const t = uvtSum - u - v
                if (t < 0 || (nC === 0 && t > 0) || t > nC) continue

                // Từ: x+y = nA-u,  x+z = nB-v,  y+z = nC-t
                // => x = ((nA-u) + (nB-v) - (nC-t)) / 2
                const xNum = nA - u + nB - v - (nC - t)
                if (xNum < 0 || xNum % 2 !== 0) continue
                const x = xNum / 2
                const y = nA - u - x
                const z = nB - v - x
                if (y < 0 || z < 0) continue
                if (x + y + z + u + v + t + w !== m) continue
                // Loại bỏ: X cần cả A và B, Y cần A và C, Z cần B và C
                if (x > 0 && (nA === 0 || nB === 0)) continue
                if (y > 0 && (nA === 0 || nC === 0)) continue
                if (z > 0 && (nB === 0 || nC === 0)) continue

                solutions.push({ x, y, z, u, v, t, w, m })
            }
        }
    }

    return { solutions, m, error: solutions.length === 0 ? 'Không tìm được nghiệm nguyên không âm nào.' : null }
}

/**
 * Nhãn tập hợp cột cho một nghiệm, VD: "X + 2Y + Z"
 */
export function multisetLabel(sol) {
    const names = ['X', 'Y', 'Z', 'U', 'V', 'T', 'W']
    const keys = ['x', 'y', 'z', 'u', 'v', 't', 'w']
    const parts = []
    for (let i = 0; i < names.length; i++) {
        const n = sol[keys[i]]
        if (n === 0) continue
        parts.push(n === 1 ? names[i] : `${n}${names[i]}`)
    }
    return parts.join(' + ')
}

/**
 * Số thứ tự cột (hoán vị tập hợp cột):
 *   m! / (x! y! z! u! v! t! w!)
 */
export function colOrderingsCount(sol) {
    const keys = ['x', 'y', 'z', 'u', 'v', 't', 'w']
    const groups = keys.map(k => sol[k])
    return multinomial(sol.m, groups)
}

export function isAdjacentValid(prev, next) {
    if (!prev) return true
    const row1Ok = prev.top === 'E' || prev.top !== next.top
    const row2Ok = prev.bottom === 'E' || prev.bottom !== next.bottom
    return row1Ok && row2Ok
}

/**
 * Ước tính sơ bộ số hướng (CHỈ tính lật cột, CHƯA trừ vi phạm kề hàng).
 * Kết quả thường CAO HƠN đáp án thực vì không kiểm tra ràng buộc kề hàng.
 * Dùng để minh họa khái niệm, KHÔNG phải đáp số cuối.
 *
 * Phân tích chính xác đòi hỏi chia "họ thứ tự cột" theo vị trí
 * (xem tài liệu CD-XepGhe-KhongKe.typ, phần Ví dụ 14-15).
 */
export function colOrientationsEstimate(sol) {
    const het = sol.x + sol.y + sol.z + sol.u + sol.v + sol.t
    return Math.pow(2, het)
}

/**
 * Đếm CHÍNH XÁC số dãy cột hợp lệ (thứ tự × hướng) cho một nghiệm.
 * Dùng DP với trạng thái: (đa tập cột còn lại, [row1_class, row2_class] cột trước).
 *
 * Điều kiện kề hợp lệ giữa cột i và cột i+1:
 *   - Hàng 1: class_mới ≠ class_cũ  (trừ khi class_cũ = 'E')
 *   - Hàng 2: class_mới ≠ class_cũ  (trừ khi class_cũ = 'E')
 *
 * Kết quả = số cách xếp cột hợp lệ (chọn thứ tự + chọn hướng từng cột sao cho
 * không kề cùng lớp trong mỗi hàng).
 */
export function countValidSequences(sol) {
    const types = ['X', 'Y', 'Z', 'U', 'V', 'T', 'W']
    const keys = ['x', 'y', 'z', 'u', 'v', 't', 'w']

    const rem = keys.map(k => sol[k] ?? 0)

    const memo = new Map()

    function dp(last) {
        const key = rem.join(',') + '|' + (last ? `${last.top}${last.bottom}` : '-')
        if (memo.has(key)) return memo.get(key)
        if (rem.every(c => c === 0)) return 1

        let count = 0
        for (let ti = 0; ti < types.length; ti++) {
            if (rem[ti] === 0) continue
            for (const state of COL_ORIENTATION_OPTIONS[types[ti]]) {
                if (isAdjacentValid(last, state)) {
                    rem[ti]--
                    count += dp(state)
                    rem[ti]++
                }
            }
        }

        memo.set(key, count)
        return count
    }

    return dp(null)
}

export function explainColumnSolution(sol, options = {}) {
    const maxTypeOrders = options.maxTypeOrders ?? 18
    const maxLayoutsPerOrder = options.maxLayoutsPerOrder ?? 8
    const maxTotalLayouts = options.maxTotalLayouts ?? 72
    const types = ['X', 'Y', 'Z', 'U', 'V', 'T', 'W']
    const keys = ['x', 'y', 'z', 'u', 'v', 't', 'w']
    const counts = keys.map(key => sol[key] ?? 0)
    const typeOrderingCount = colOrderingsCount(sol)
    const totalValidSeqs = countValidSequences(sol)
    const canEnumerateFully = sol.m <= 7 && typeOrderingCount <= maxTypeOrders && totalValidSeqs <= maxTotalLayouts

    if (!canEnumerateFully) {
        return {
            canEnumerateFully: false,
            typeOrderingCount,
            totalValidSeqs,
            families: [],
        }
    }

    const typeOrders = []
    const remTypes = counts.slice()

    function buildTypeOrders(path) {
        if (path.length === sol.m) {
            typeOrders.push(path.slice())
            return
        }

        for (let index = 0; index < types.length; index++) {
            if (remTypes[index] === 0) continue
            remTypes[index]--
            path.push(types[index])
            buildTypeOrders(path)
            path.pop()
            remTypes[index]++
        }
    }

    buildTypeOrders([])

    const families = typeOrders.map(order => {
        const layouts = []
        const current = []

        function buildLayouts(position, last) {
            if (position === order.length) {
                layouts.push({
                    codes: current.map(item => item.code),
                    topRow: current.map(item => item.top),
                    bottomRow: current.map(item => item.bottom),
                })
                return
            }

            const type = order[position]
            for (const orientation of COL_ORIENTATION_OPTIONS[type]) {
                if (!isAdjacentValid(last, orientation)) continue
                current.push({ ...orientation, type })
                buildLayouts(position + 1, orientation)
                current.pop()
            }
        }

        buildLayouts(0, null)

        return {
            order,
            orderLabel: order.join(''),
            count: layouts.length,
            layouts: layouts.slice(0, maxLayoutsPerOrder),
            hiddenLayoutCount: Math.max(0, layouts.length - maxLayoutsPerOrder),
        }
    })

    return {
        canEnumerateFully: true,
        typeOrderingCount,
        totalValidSeqs,
        families,
    }
}
