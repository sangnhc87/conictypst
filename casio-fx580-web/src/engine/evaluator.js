import { Fraction } from './fraction.js';
import { Complex } from './complex.js';
import { Calculus } from './calculus.js';

export class Evaluator {
  constructor(memory) {
    this.memory = memory;
    this.angleUnit = 'DEG'; // 'DEG', 'RAD', 'GRAD'
    this.displayMode = 'NORM1'; // 'NORM1', 'NORM2', 'FIX', 'SCI'
  }

  setAngleUnit(unit) {
    if (['DEG', 'RAD', 'GRAD'].includes(unit)) {
      this.angleUnit = unit;
    }
  }

  toRadians(angle) {
    if (this.angleUnit === 'DEG') return (angle * Math.PI) / 180;
    if (this.angleUnit === 'GRAD') return (angle * Math.PI) / 200;
    return angle;
  }

  fromRadians(rad) {
    if (this.angleUnit === 'DEG') return (rad * 180) / Math.PI;
    if (this.angleUnit === 'GRAD') return (rad * 200) / Math.PI;
    return rad;
  }

  // Tiền xử lý biểu thức Casio sang biểu thức tính toán chuẩn
  preprocess(expr, varValues = {}) {
    let s = expr.trim();
    if (!s) return '0';

    // Thay thế các ký hiệu Casio đặc thù
    s = s.replace(/×/g, '*').replace(/÷/g, '/').replace(/−/g, '-');
    s = s.replace(/π/g, `(${Math.PI})`);
    s = s.replace(/\be\b/g, `(${Math.E})`);

    // Biến Ans và PreAns
    s = s.replace(/\bPreAns\b/g, `(${this.memory.get('PreAns')})`);
    s = s.replace(/\bAns\b/g, `(${this.memory.get('Ans')})`);

    // Biến nhớ máy tính (A, B, C, D, E, F, M, x, y)
    const vars = ['A', 'B', 'C', 'D', 'E', 'F', 'M', 'x', 'y'];
    for (const v of vars) {
      const val = varValues[v] !== undefined ? varValues[v] : this.memory.get(v);
      const re = new RegExp(`\\b${v}\\b`, 'g');
      s = s.replace(re, `(${val})`);
    }

    // Nhân ngầm định: 2(3), (2)(3), 2sqrt(3), 2sin(30), 2x, 3A, v.v.
    s = s.replace(/(\d+(\.\d+)?)\s*\(/g, '$1*(');
    s = s.replace(/\)\s*\(/g, ')*(');
    s = s.replace(/\)\s*(\d+(\.\d+)?)/g, ')*$1');
    s = s.replace(/(\d+(\.\d+)?)\s*([a-zA-Z_]\w*)\s*\(/g, '$1*$3(');

    return s;
  }

  // Tính giai thừa n!
  factorial(n) {
    if (n < 0 || !Number.isInteger(n)) throw new Error("Math ERROR");
    if (n > 69) throw new Error("Math ERROR");
    let res = 1;
    for (let i = 2; i <= n; i++) res *= i;
    return res;
  }

  // Chỉnh hợp nPr
  nPr(n, r) {
    if (n < 0 || r < 0 || r > n || !Number.isInteger(n) || !Number.isInteger(r)) {
      throw new Error("Math ERROR");
    }
    return this.factorial(n) / this.factorial(n - r);
  }

  // Tổ hợp nCr
  nCr(n, r) {
    if (n < 0 || r < 0 || r > n || !Number.isInteger(n) || !Number.isInteger(r)) {
      throw new Error("Math ERROR");
    }
    return this.factorial(n) / (this.factorial(r) * this.factorial(n - r));
  }

  // Đánh giá biểu thức toán học trả về số hoặc cấu trúc
  evaluate(expr, varValues = {}) {
    const raw = expr.trim();
    if (!raw) return { number: 0, formatted: "0", fraction: null };

    // Kiểm tra các hàm giải tích: d/dx, int, sum
    const ddxMatch = raw.match(/^d\/dx\((.+),\s*([^)]+)\)$/i);
    if (ddxMatch) {
      const fStr = ddxMatch[1];
      const x0 = Number(this.evaluate(ddxMatch[2]).number);
      const fn = (val) => this.evaluate(fStr, { x: val }).number;
      const res = Calculus.derivative(fn, x0);
      return { number: res, formatted: res.toString(), fraction: null };
    }

    const intMatch = raw.match(/^∫\((.+),\s*([^,]+),\s*([^)]+)\)$/);
    if (intMatch) {
      const fStr = intMatch[1];
      const a = Number(this.evaluate(intMatch[2]).number);
      const b = Number(this.evaluate(intMatch[3]).number);
      const fn = (val) => this.evaluate(fStr, { x: val }).number;
      const res = Calculus.integrate(fn, a, b);
      return { number: res, formatted: res.toString(), fraction: null };
    }

    const sumMatch = raw.match(/^Σ\((.+),\s*([^,]+),\s*([^)]+)\)$/);
    if (sumMatch) {
      const fStr = sumMatch[1];
      const a = Math.round(Number(this.evaluate(sumMatch[2]).number));
      const b = Math.round(Number(this.evaluate(sumMatch[3]).number));
      const fn = (val) => this.evaluate(fStr, { x: val }).number;
      const res = Calculus.sum(fn, a, b);
      return { number: res, formatted: res.toString(), fraction: null };
    }

    // Tiền xử lý
    let code = this.preprocess(raw, varValues);

    // Chuyển A^B thành Math.pow(A, B)
    code = this.convertPowers(code);
    code = this.convertPercent(code);

    // Môi trường an toàn với các hàm toán học
    const scope = {
      sin: (x) => {
        const rad = this.toRadians(x);
        const deg = this.angleUnit === 'DEG' ? Math.round(x) % 360 : null;
        if (deg === 0 || deg === 180 || deg === -180) return 0;
        if (deg === 30 || deg === 150) return 0.5;
        if (deg === -30 || deg === -150 || deg === 210 || deg === 330) return -0.5;
        return Math.sin(rad);
      },
      cos: (x) => {
        const rad = this.toRadians(x);
        const deg = this.angleUnit === 'DEG' ? Math.round(x) % 360 : null;
        if (deg === 90 || deg === 270 || deg === -90 || deg === -270) return 0;
        if (deg === 60 || deg === 300 || deg === -60) return 0.5;
        if (deg === 120 || deg === 240 || deg === -120) return -0.5;
        return Math.cos(rad);
      },
      tan: (x) => {
        const deg = this.angleUnit === 'DEG' ? Math.round(x) % 180 : null;
        if (deg === 90 || deg === -90) throw new Error("Math ERROR");
        return Math.tan(this.toRadians(x));
      },
      asin: (x) => {
        if (x < -1 || x > 1) throw new Error("Math ERROR");
        return this.fromRadians(Math.asin(x));
      },
      acos: (x) => {
        if (x < -1 || x > 1) throw new Error("Math ERROR");
        return this.fromRadians(Math.acos(x));
      },
      atan: (x) => this.fromRadians(Math.atan(x)),
      sinh: (x) => Math.sinh(x),
      cosh: (x) => Math.cosh(x),
      tanh: (x) => Math.tanh(x),
      sqrt: (x) => {
        if (x < 0) throw new Error("Math ERROR");
        return Math.sqrt(x);
      },
      cbrt: (x) => Math.cbrt(x),
      abs: (x) => Math.abs(x),
      ln: (x) => {
        if (x <= 0) throw new Error("Math ERROR");
        return Math.log(x);
      },
      log: (baseOrVal, val) => {
        if (val !== undefined) {
          if (baseOrVal <= 0 || baseOrVal === 1 || val <= 0) throw new Error("Math ERROR");
          return Math.log(val) / Math.log(baseOrVal);
        }
        if (baseOrVal <= 0) throw new Error("Math ERROR");
        return Math.log10(baseOrVal);
      },
      fact: (n) => this.factorial(n),
      nPr: (n, r) => this.nPr(n, r),
      nCr: (n, r) => this.nCr(n, r),
      Pol: (x, y) => Math.hypot(x, y),
      Rec: (r, theta) => r * Math.cos(this.toRadians(theta))
    };

    let result;
    try {
      const fn = new Function(...Object.keys(scope), `"use strict"; return (${code});`);
      result = fn(...Object.values(scope));
    } catch (err) {
      if (err.message.includes("Math ERROR")) throw err;
      throw new Error("Syntax ERROR");
    }

    if (typeof result !== 'number' || isNaN(result)) {
      throw new Error("Math ERROR");
    }

    if (!isFinite(result)) {
      throw new Error("Math ERROR");
    }

    result = parseFloat(result.toFixed(12));

    // Thử chuyển đổi sang phân số tối giản
    let frac = null;
    try {
      if (!Number.isInteger(result) && Math.abs(result) < 100000) {
        frac = Fraction.fromNumber(result, 10000n);
        if (frac.d > 2000n) frac = null;
      } else if (Number.isInteger(result)) {
        frac = new Fraction(BigInt(result), 1n);
      }
    } catch (e) {
      frac = null;
    }

    return {
      number: result,
      formatted: this.formatResult(result),
      fraction: frac
    };
  }

  // Định dạng số hiển thị trên màn hình LCD
  formatResult(val) {
    if (Math.abs(val) < 1e-12) return "0";
    if (Math.abs(val) >= 1e10 || (Math.abs(val) < 1e-3 && Math.abs(val) > 0)) {
      return val.toExponential(6).replace('e+', '×10^').replace('e-', '×10^-');
    }
    return parseFloat(val.toFixed(10)).toString();
  }

  // Chuyển đổi định dạng Kỹ thuật (ENG: exponent multiples of 3)
  formatEng(val) {
    if (val === 0) return "0";
    let exp = Math.floor(Math.log10(Math.abs(val)));
    let engExp = Math.floor(exp / 3) * 3;
    let mantissa = val / Math.pow(10, engExp);
    return `${parseFloat(mantissa.toFixed(6))}×10^${engExp}`;
  }

  convertPowers(str) {
    let s = str;
    const powRegex = /([a-zA-Z0-9_.]+|\([^\(\)]+\))\^([a-zA-Z0-9_.]+|\([^\(\)]+\))/;
    while (powRegex.test(s)) {
      s = s.replace(powRegex, 'Math.pow($1, $2)');
    }
    return s;
  }

  convertPercent(str) {
    return str.replace(/(\d+(\.\d+)?)%/g, '($1/100)');
  }
}
