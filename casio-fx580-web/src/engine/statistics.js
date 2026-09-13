export class StatisticsEngine {
  // Thống kê 1 biến (1-Variable)
  static calc1Var(data) {
    if (!data || data.length === 0) throw new Error("Stat ERROR");
    const n = data.length;
    const sorted = [...data].sort((a, b) => a - b);

    const sumX = data.reduce((acc, v) => acc + v, 0);
    const mean = sumX / n;

    const sumX2 = data.reduce((acc, v) => acc + v * v, 0);

    const variancePop = data.reduce((acc, v) => acc + Math.pow(v - mean, 2), 0) / n;
    const sigmaX = Math.sqrt(variancePop);

    const varianceSample = n > 1 ? (variancePop * n) / (n - 1) : 0;
    const sx = Math.sqrt(varianceSample);

    const minX = sorted[0];
    const maxX = sorted[n - 1];

    const median = (arr) => {
      const len = arr.length;
      const mid = Math.floor(len / 2);
      return len % 2 !== 0 ? arr[mid] : (arr[mid - 1] + arr[mid]) / 2;
    };

    const medX = median(sorted);
    const half = Math.floor(n / 2);
    const q1 = median(sorted.slice(0, half));
    const q3 = median(sorted.slice(n % 2 === 0 ? half : half + 1));

    return {
      n,
      mean: Math.round(mean * 1e8) / 1e8,
      sumX: Math.round(sumX * 1e8) / 1e8,
      sumX2: Math.round(sumX2 * 1e8) / 1e8,
      sigmaX: Math.round(sigmaX * 1e8) / 1e8,
      sx: Math.round(sx * 1e8) / 1e8,
      minX,
      q1,
      medX,
      q3,
      maxX
    };
  }

  // Thống kê 2 biến Hồi quy tuyến tính (y = a + bx)
  static calcLinearReg(xList, yList) {
    if (xList.length !== yList.length || xList.length < 2) throw new Error("Stat ERROR");
    const n = xList.length;

    const sumX = xList.reduce((a, b) => a + b, 0);
    const sumY = yList.reduce((a, b) => a + b, 0);
    const sumX2 = xList.reduce((a, b) => a + b * b, 0);
    const sumY2 = yList.reduce((a, b) => a + b * b, 0);
    const sumXY = xList.reduce((acc, x, i) => acc + x * yList[i], 0);

    const denom = n * sumX2 - sumX * sumX;
    if (Math.abs(denom) < 1e-12) throw new Error("Stat ERROR");

    const b = (n * sumXY - sumX * sumY) / denom;
    const a = (sumY - b * sumX) / n;

    const rDenom = Math.sqrt((n * sumX2 - sumX * sumX) * (n * sumY2 - sumY * sumY));
    const r = rDenom !== 0 ? (n * sumXY - sumX * sumY) / rDenom : 0;

    return {
      a: Math.round(a * 1e8) / 1e8,
      b: Math.round(b * 1e8) / 1e8,
      r: Math.round(r * 1e8) / 1e8
    };
  }
}
