/**
 * Sinh sắp xếp ngẫu nhiên hợp lệ để minh họa trực quan.
 * "Hợp lệ" nghĩa là không có 2 thực thể cùng lớp bị cấm đứng liền kề.
 */

function shuffle(arr) {
    const a = [...arr]
    for (let i = a.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1))
            ;[a[i], a[j]] = [a[j], a[i]]
    }
    return a
}

/**
 * Kiểm tra xếp ghế có hợp lệ không.
 * @param {string[]} perm - mảng nhãn lớp, VD: ['A','B','A','E']
 * @param {Set<string>} forbiddenSet - nhãn các lớp bị cấm kề
 */
export function isValidArrangement(perm, forbiddenSet) {
    for (let i = 0; i < perm.length - 1; i++) {
        if (perm[i] === perm[i + 1] && forbiddenSet.has(perm[i])) {
            return false
        }
    }
    return true
}

/**
 * Sinh một sắp xếp ngẫu nhiên hợp lệ.
 * @param {Array<{label: string, count: number, forbidden: boolean}>} classes
 * @param {number} maxAttempts
 * @returns {string[] | null}
 */
export function randomValidArrangement(classes, maxAttempts = 3000) {
    const items = classes.flatMap(c => Array(c.count).fill(c.label))
    const forbiddenSet = new Set(classes.filter(c => c.forbidden).map(c => c.label))

    for (let i = 0; i < maxAttempts; i++) {
        const perm = shuffle(items)
        if (isValidArrangement(perm, forbiddenSet)) return perm
    }
    return null
}

/**
 * Sinh mảng sắp xếp cho 2 hàng đối diện (mỗi cột gồm 1 ghế trên + 1 ghế dưới).
 * Trả về: { top: string[], bottom: string[] }
 * Mỗi cột là một "cặp", giá trị ngẫu nhiên.
 */
export function randomFacingArrangement(classes) {
    const items = classes.flatMap(c => Array(c.count).fill(c.label))
    const shuffled = shuffle(items)
    const m = shuffled.length / 2
    return {
        top: shuffled.slice(0, m),
        bottom: shuffled.slice(m),
    }
}
