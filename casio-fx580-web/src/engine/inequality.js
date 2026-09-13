import { Solver } from './solver.js';

export class InequalitySolver {
  // Bất phương trình bậc 2: ax^2 + bx + c (op: '>', '>=', '<', '<=')
  static solveQuadratic(a, b, c, op) {
    if (a === 0) {
      // Suy biến thành bậc nhất: bx + c
      if (b === 0) {
        const cond = op === '>' ? c > 0 : op === '>=' ? c >= 0 : op === '<' ? c < 0 : c <= 0;
        return cond ? "All Real Numbers" : "No Solution";
      }
      const x0 = -c / b;
      const reverse = b < 0;
      let effectiveOp = op;
      if (reverse) {
        effectiveOp = op === '>' ? '<' : op === '>=' ? '<=' : op === '<' ? '>' : '>=';
      }
      return `x ${effectiveOp} ${x0}`;
    }

    const delta = b * b - 4 * a * c;
    const isPosA = a > 0;

    if (delta < 0) {
      // Tam thức luôn cùng dấu với a
      if (isPosA) {
        return (op === '>' || op === '>=') ? "All Real Numbers" : "No Solution";
      } else {
        return (op === '<' || op === '<=') ? "All Real Numbers" : "No Solution";
      }
    } else if (Math.abs(delta) < 1e-12) {
      const x0 = Math.round((-b / (2 * a)) * 1e8) / 1e8;
      if (op === '>') return isPosA ? `x ≠ ${x0}` : "No Solution";
      if (op === '>=') return isPosA ? "All Real Numbers" : `x = ${x0}`;
      if (op === '<') return isPosA ? "No Solution" : `x ≠ ${x0}`;
      if (op === '<=') return isPosA ? `x = ${x0}` : "All Real Numbers";
    } else {
      const sqrtD = Math.sqrt(delta);
      let r1 = (-b - sqrtD) / (2 * a);
      let r2 = (-b + sqrtD) / (2 * a);
      if (r1 > r2) [r1, r2] = [r2, r1];
      r1 = Math.round(r1 * 1e6) / 1e6;
      r2 = Math.round(r2 * 1e6) / 1e6;

      // Trong trái ngoài cùng
      if (isPosA) {
        if (op === '>') return `x < ${r1} , ${r2} < x`;
        if (op === '>=') return `x ≤ ${r1} , ${r2} ≤ x`;
        if (op === '<') return `${r1} < x < ${r2}`;
        if (op === '<=') return `${r1} ≤ x ≤ ${r2}`;
      } else {
        if (op === '>') return `${r1} < x < ${r2}`;
        if (op === '>=') return `${r1} ≤ x ≤ ${r2}`;
        if (op === '<') return `x < ${r1} , ${r2} < x`;
        if (op === '<=') return `x ≤ ${r1} , ${r2} ≤ x`;
      }
    }
  }
}
