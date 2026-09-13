export class Calculus {
  // Đạo hàm tại 1 điểm d/dx f(x) | x=x0
  static derivative(fn, x0, h = 1e-5) {
    // 5-point stencil central difference
    const f1 = fn(x0 + 2 * h);
    const f2 = fn(x0 + h);
    const f3 = fn(x0 - h);
    const f4 = fn(x0 - 2 * h);
    if ([f1, f2, f3, f4].some(v => isNaN(v) || !isFinite(v))) {
      throw new Error("Math ERROR");
    }
    const d = (-f1 + 8 * f2 - 8 * f3 + f4) / (12 * h);
    return Math.round(d * 1e9) / 1e9;
  }

  // Tích phân số trị Gauss-Legendre 5 điểm trên mỗi đoạn con
  static integrate(fn, a, b, nSub = 32) {
    if (a === b) return 0;
    // Điểm nút và trọng số Gauss-Legendre 5 điểm chuẩn [-1, 1]
    const xi = [
      0.0,
      -0.538469310105683,
      0.538469310105683,
      -0.906179845938664,
      0.906179845938664
    ];
    const wi = [
      0.568888888888889,
      0.478628670499366,
      0.478628670499366,
      0.236926885056189,
      0.236926885056189
    ];

    const h = (b - a) / nSub;
    let total = 0;

    for (let i = 0; i < nSub; i++) {
      const subA = a + i * h;
      const subB = subA + h;
      const mid = (subA + subB) / 2;
      const halfL = (subB - subA) / 2;

      for (let j = 0; j < 5; j++) {
        const x = mid + halfL * xi[j];
        const y = fn(x);
        if (isNaN(y) || !isFinite(y)) throw new Error("Math ERROR");
        total += wi[j] * y * halfL;
      }
    }

    return Math.round(total * 1e9) / 1e9;
  }

  // Tính tổng Sigma f(x) từ x=start đến end
  static sum(fn, start, end) {
    let s = 0;
    for (let x = start; x <= end; x++) {
      const v = fn(x);
      if (isNaN(v) || !isFinite(v)) throw new Error("Math ERROR");
      s += v;
    }
    return s;
  }

  // Phân tích thừa số nguyên tố (FACT)
  static factorize(n) {
    let num = BigInt(Math.round(Math.abs(n)));
    if (num <= 1n) return num.toString();
    const factors = [];
    let d = 2n;
    while (d * d <= num) {
      if (num % d === 0n) {
        let count = 0;
        while (num % d === 0n) {
          count++;
          num /= d;
        }
        factors.push({ base: d.toString(), exp: count });
      }
      d = d === 2n ? 3n : d + 2n;
    }
    if (num > 1n) {
      factors.push({ base: num.toString(), exp: 1 });
    }

    return factors
      .map(f => f.exp === 1 ? f.base : `${f.base}^${f.exp}`)
      .join(" × ");
  }
}
