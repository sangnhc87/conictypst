/**
 * moitruong.js — Logic giải bài toán di chuyển tối ưu qua nhiều môi trường có vận tốc khác nhau.
 */

/**
 * Định dạng số làm tròn đến d chữ số thập phân, giữ nguyên nếu là số nguyên
 */
export function fmt(val, d = 2) {
    if (val === undefined || val === null || isNaN(val)) return '0'
    const rounded = parseFloat(val.toFixed(d))
    return rounded.toString().replace('.', ',');
}

/**
 * CASE 1: Dọc biên rồi rẽ vào
 * A(0, 0) -> B(x, 0) trên biên tốc độ v1,
 * B(x, 0) -> D(W, h) trong môi trường tốc độ v2.
 */
export function solveCase1({ W, h, v1, v2 }) {
    const r = v2 / v1
    let x = 0
    let isStraight = false

    if (r >= 1) {
        // Vận tốc trong môi trường lớn hơn hoặc bằng trên biên -> đi thẳng từ A đến D là nhanh nhất
        x = 0
        isStraight = true
    } else {
        // Vận tốc trên biên lớn hơn -> đi dọc biên một đoạn rồi mới rẽ vào
        const optDist = (r * h) / Math.sqrt(1 - r * r)
        x = W - optDist
        if (x < 0) {
            x = 0
            isStraight = true
        }
    }

    const S1 = x
    const S2 = Math.sqrt((W - x) * (W - x) + h * h)
    const time1 = S1 / v1
    const time2 = S2 / v2
    const totalTime = time1 + time2

    // Góc khúc xạ theta2 so với phương thẳng đứng
    // sin(theta2) = (W - x) / S2
    const sin2 = S2 > 0 ? (W - x) / S2 : 0
    const theta2 = Math.asin(sin2) * (180 / Math.PI)

    return {
        x,
        S1,
        S2,
        time1,
        time2,
        totalTime,
        theta2,
        isStraight
    }
}

/**
 * CASE 2: Hai môi trường song song (1 ranh giới)
 * A(0, 0) -> M(x, h1) trong môi trường 1 (tốc độ v1)
 * M(x, h1) -> B(W, h1 + h2) trong môi trường 2 (tốc độ v2)
 */
export function solveCase2({ W, h1, h2, v1, v2 }) {
    // Giải T'(x) = 0 bằng tìm kiếm nhị phân trên [0, W]
    let low = 0
    let high = W
    for (let iter = 0; iter < 100; iter++) {
        const mid = (low + high) / 2
        const sin1 = mid / Math.sqrt(mid * mid + h1 * h1)
        const sin2 = (W - mid) / Math.sqrt((W - mid) * (W - mid) + h2 * h2)
        const val = sin1 / v1 - sin2 / v2
        if (val < 0) {
            low = mid
        } else {
            high = mid
        }
    }

    const x = (low + high) / 2
    const S1 = Math.sqrt(x * x + h1 * h1)
    const S2 = Math.sqrt((W - x) * (W - x) + h2 * h2)
    const time1 = S1 / v1
    const time2 = S2 / v2
    const totalTime = time1 + time2

    const sin1 = S1 > 0 ? x / S1 : 0
    const sin2 = S2 > 0 ? (W - x) / S2 : 0
    const theta1 = Math.asin(sin1) * (180 / Math.PI)
    const theta2 = Math.asin(sin2) * (180 / Math.PI)

    return {
        x,
        S1,
        S2,
        time1,
        time2,
        totalTime,
        theta1,
        theta2
    }
}

/**
 * CASE 3: Ba môi trường song song (2 ranh giới)
 * A(0, 0) -> B(W, h1 + h2 + h3)
 * Môi trường 1: h1, v1
 * Môi trường 2: h2, v2
 * Môi trường 3: h3, v3
 */
export function solveCase3({ W, h1, h2, h3, v1, v2, v3 }) {
    const maxV = Math.max(v1, v2, v3)
    const kLim = 1 / maxV
    let low = 0
    let high = kLim - 1e-12

    for (let iter = 0; iter < 100; iter++) {
        const mid = (low + high) / 2
        let sumX = 0
        sumX += h1 * (mid * v1) / Math.sqrt(1 - mid * mid * v1 * v1)
        sumX += h2 * (mid * v2) / Math.sqrt(1 - mid * mid * v2 * v2)
        sumX += h3 * (mid * v3) / Math.sqrt(1 - mid * mid * v3 * v3)

        if (sumX < W) {
            low = mid
        } else {
            high = mid
        }
    }

    const k = (low + high) / 2
    const x1 = h1 * (k * v1) / Math.sqrt(1 - k * k * v1 * v1)
    const x2 = h2 * (k * v2) / Math.sqrt(1 - k * k * v2 * v2)
    const x3 = h3 * (k * v3) / Math.sqrt(1 - k * k * v3 * v3)

    const S1 = Math.sqrt(x1 * x1 + h1 * h1)
    const S2 = Math.sqrt(x2 * x2 + h2 * h2)
    const S3 = Math.sqrt(x3 * x3 + h3 * h3)

    const time1 = S1 / v1
    const time2 = S2 / v2
    const time3 = S3 / v3
    const totalTime = time1 + time2 + time3

    const theta1 = Math.asin(k * v1) * (180 / Math.PI)
    const theta2 = Math.asin(k * v2) * (180 / Math.PI)
    const theta3 = Math.asin(k * v3) * (180 / Math.PI)

    // Nếu v1 === v3, có thể giải bằng phương pháp ghép hình
    // Ghép Dải 1 và Dải 3 thành một dải có chiều cao h_ghep = h1 + h3 và tốc độ v_ghep = v1
    const canGhep = Math.abs(v1 - v3) < 1e-6
    let ghepRes = null
    if (canGhep) {
        // Giải bài toán 2 dải: Dải gộp (h1+h3, v1) và Dải 2 (h2, v2)
        const g2 = solveCase2({ W, h1: h1 + h3, h2, v1, v2 })
        // g2.x là hoành độ rẽ của dải gộp, tương ứng với x_ghep
        // Độ dời ngang của phần gạch/băng phẳng là x_ghep = W - x2
        // Vậy x2 = g2.x (điều này phụ thuộc vào thứ tự truyền vào solveCase2)
        // Hãy gọi solveCase2 với h1 = h1+h3 (tốc độ v1) và h2 = h2 (tốc độ v2)
        // Hàm giải ra g2.x là độ dời ngang của dải gộp (v1), và W - g2.x là độ dời ngang của dải 2 (v2).
        const xOuter = g2.x
        const x2_ghep = W - g2.x
        const x1_ghep = xOuter * h1 / (h1 + h3)
        const x3_ghep = xOuter * h3 / (h1 + h3)
        
        ghepRes = {
            x1: x1_ghep,
            x2: x2_ghep,
            x3: x3_ghep,
            S_ghep_outer: Math.sqrt(xOuter * xOuter + (h1 + h3) * (h1 + h3)),
            S_ghep_mid: Math.sqrt(x2_ghep * x2_ghep + h2 * h2),
            time_outer: Math.sqrt(xOuter * xOuter + (h1 + h3) * (h1 + h3)) / v1,
            time_mid: Math.sqrt(x2_ghep * x2_ghep + h2 * h2) / v2,
            totalTime: g2.totalTime
        }
    }

    return {
        k,
        x1, x2, x3,
        S1, S2, S3,
        time1, time2, time3,
        totalTime,
        theta1, theta2, theta3,
        canGhep,
        ghepRes
    }
}
