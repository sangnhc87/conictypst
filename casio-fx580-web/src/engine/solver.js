import { Complex } from './complex.js';

export class Solver {
  // Giải hệ phương trình bậc nhất n ẩn: A * X = B
  static solveLinearSystem(A, B) {
    const n = B.length;
    const M = A.map((row, i) => [...row, B[i]]);

    for (let i = 0; i < n; i++) {
      let maxRow = i;
      for (let k = i + 1; k < n; k++) {
        if (Math.abs(M[k][i]) > Math.abs(M[maxRow][i])) maxRow = k;
      }
      if (Math.abs(M[maxRow][i]) < 1e-12) {
        // Kiểm tra vô nghiệm hay vô số nghiệm
        let allZero = true;
        for (let j = i; j < n; j++) {
          if (Math.abs(M[maxRow][j]) > 1e-12) allZero = false;
        }
        if (allZero && Math.abs(M[maxRow][n]) > 1e-12) {
          throw new Error("No Solution");
        }
        throw new Error("Infinite Solutions");
      }

      [M[i], M[maxRow]] = [M[maxRow], M[i]];

      const pivot = M[i][i];
      for (let j = i; j <= n; j++) M[i][j] /= pivot;

      for (let k = 0; k < n; k++) {
        if (k !== i) {
          const factor = M[k][i];
          for (let j = i; j <= n; j++) {
            M[k][j] -= factor * M[i][j];
          }
        }
      }
    }

    return M.map(row => Math.round(row[n] * 1e10) / 1e10);
  }

  // Phương trình bậc 2: ax^2 + bx + c = 0
  static solveQuadratic(a, b, c) {
    if (Math.abs(a) < 1e-12) {
      if (Math.abs(b) < 1e-12) {
        if (Math.abs(c) < 1e-12) throw new Error("Infinite Solutions");
        throw new Error("No Solution");
      }
      return {
        roots: [new Complex(-c / b, 0)],
        vertex: null
      };
    }

    const delta = b * b - 4 * a * c;
    const xv = -b / (2 * a);
    const yv = c - (b * b) / (4 * a);
    const isMin = a > 0;

    let roots = [];
    if (Math.abs(delta) < 1e-12) {
      roots = [new Complex(xv, 0)];
    } else if (delta > 0) {
      const sqrtD = Math.sqrt(delta);
      roots = [
        new Complex((-b + sqrtD) / (2 * a), 0),
        new Complex((-b - sqrtD) / (2 * a), 0)
      ];
    } else {
      const sqrtD = Math.sqrt(-delta);
      roots = [
        new Complex(xv, sqrtD / (2 * a)),
        new Complex(xv, -sqrtD / (2 * a))
      ];
    }

    return {
      roots,
      vertex: {
        type: isMin ? "Minimum" : "Maximum",
        x: Math.round(xv * 1e10) / 1e10,
        y: Math.round(yv * 1e10) / 1e10
      }
    };
  }

  // Phương trình bậc 3: ax^3 + bx^2 + cx + d = 0 (Cardano Formula)
  static solveCubic(a, b, c, d) {
    if (Math.abs(a) < 1e-12) return this.solveQuadratic(b, c, d);

    // Chuẩn hoá: x^3 + px^2 + qx + r = 0
    const p = b / a;
    const q = c / a;
    const r = d / a;

    // Đổi biến x = t - p/3 -> t^3 + A*t + B = 0
    const A = q - (p * p) / 3;
    const B = (2 * p * p * p) / 27 - (p * q) / 3 + r;

    const delta = (B * B) / 4 + (A * A * A) / 27;
    const shift = -p / 3;

    if (Math.abs(delta) < 1e-12) {
      if (Math.abs(A) < 1e-12 && Math.abs(B) < 1e-12) {
        return { roots: [new Complex(shift, 0)] };
      }
      const u = Math.cbrt(-B / 2);
      return {
        roots: [
          new Complex(2 * u + shift, 0),
          new Complex(-u + shift, 0)
        ]
      };
    } else if (delta > 0) {
      const sqrtDelta = Math.sqrt(delta);
      const u = Math.cbrt(-B / 2 + sqrtDelta);
      const v = Math.cbrt(-B / 2 - sqrtDelta);
      const realRoot = u + v + shift;
      const realPart = -(u + v) / 2 + shift;
      const imagPart = ((u - v) * Math.sqrt(3)) / 2;
      return {
        roots: [
          new Complex(realRoot, 0),
          new Complex(realPart, imagPart),
          new Complex(realPart, -imagPart)
        ]
      };
    } else {
      // 3 nghiệm thực phân biệt
      const m = 2 * Math.sqrt(-A / 3);
      const theta = Math.acos(-B / (2 * Math.sqrt(-Math.pow(A / 3, 3)))) / 3;
      return {
        roots: [
          new Complex(m * Math.cos(theta) + shift, 0),
          new Complex(m * Math.cos(theta + (2 * Math.PI) / 3) + shift, 0),
          new Complex(m * Math.cos(theta + (4 * Math.PI) / 3) + shift, 0)
        ]
      };
    }
  }

  // Phương trình bậc 4: Durand-Kerner Iteration
  static solveQuartic(a, b, c, d, e) {
    if (Math.abs(a) < 1e-12) return this.solveCubic(b, c, d, e);
    // Chuẩn hoá: x^4 + a3*x^3 + a2*x^2 + a1*x + a0 = 0
    const a3 = b / a, a2 = c / a, a1 = d / a, a0 = e / a;

    // Khởi tạo 4 điểm khởi đầu trên mặt phẳng phức
    let roots = [
      new Complex(0.4, 0.9),
      new Complex(-0.4, 0.9),
      new Complex(-0.9, -0.4),
      new Complex(0.9, -0.4)
    ];

    const evalPoly = (z) => {
      // z^4 + a3*z^3 + a2*z^2 + a1*z + a0
      const z2 = z.mul(z);
      const z3 = z2.mul(z);
      const z4 = z3.mul(z);
      return z4.add(z3.mul(a3)).add(z2.mul(a2)).add(z.mul(a1)).add(new Complex(a0, 0));
    };

    for (let iter = 0; iter < 100; iter++) {
      let maxDiff = 0;
      for (let i = 0; i < 4; i++) {
        let denom = new Complex(1, 0);
        for (let j = 0; j < 4; j++) {
          if (i !== j) {
            denom = denom.mul(roots[i].sub(roots[j]));
          }
        }
        const f = evalPoly(roots[i]);
        const delta = f.div(denom);
        roots[i] = roots[i].sub(delta);
        maxDiff = Math.max(maxDiff, delta.abs());
      }
      if (maxDiff < 1e-12) break;
    }

    return { roots };
  }
}
