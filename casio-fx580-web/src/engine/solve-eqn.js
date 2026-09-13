import { Calculus } from './calculus.js';

export class SolveEngine {
  // Giải phương trình f(x) = 0 hoặc f(x) = g(x) bằng Newton-Raphson
  static solve(evaluator, exprStr, initialX = 0, maxIter = 60, tol = 1e-10) {
    let expr = exprStr.trim();
    // Nếu có dấu '=', chuyển thành f(x) - g(x) = 0
    if (expr.includes('=')) {
      const parts = expr.split('=');
      expr = `(${parts[0]}) - (${parts[1]})`;
    }

    const f = (xVal) => {
      const res = evaluator.evaluate(expr, { x: xVal });
      if (res.error) throw new Error(res.error);
      return res.number;
    };

    let x = initialX;
    // Nếu f(x) tại initialX bị NaN, thử dịch điểm ban đầu
    for (let offset of [0, 0.5, 1, -1, 2, -2, 5, -5]) {
      try {
        const testY = f(initialX + offset);
        if (!isNaN(testY) && isFinite(testY)) {
          x = initialX + offset;
          break;
        }
      } catch (e) {}
    }

    for (let i = 0; i < maxIter; i++) {
      let y;
      try {
        y = f(x);
      } catch (e) {
        // Dịch nhẹ nếu rơi vào điểm gián đoạn
        x += 0.05;
        continue;
      }

      if (Math.abs(y) < tol) {
        return {
          x: Math.round(x * 1e10) / 1e10,
          lMinusR: 0
        };
      }

      let df;
      try {
        df = Calculus.derivative(f, x);
      } catch (e) {
        df = (f(x + 1e-5) - f(x - 1e-5)) / 2e-5;
      }

      if (Math.abs(df) < 1e-14) {
        x += 0.1; // Tránh điểm có đạo hàm bằng 0
        continue;
      }

      const nextX = x - y / df;
      if (Math.abs(nextX - x) < tol && Math.abs(f(nextX)) < tol * 10) {
        const finalY = f(nextX);
        return {
          x: Math.round(nextX * 1e10) / 1e10,
          lMinusR: Math.abs(finalY) < 1e-12 ? 0 : finalY
        };
      }
      x = nextX;
    }

    // Kiểm tra nghiệm cuối cùng
    try {
      const finalY = f(x);
      if (Math.abs(finalY) < 1e-4) {
        return {
          x: Math.round(x * 1e8) / 1e8,
          lMinusR: Math.abs(finalY) < 1e-12 ? 0 : finalY
        };
      }
    } catch (e) {}

    throw new Error("Can't Solve");
  }
}
