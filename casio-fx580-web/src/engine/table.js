export class TableGenerator {
  static generate(fExprFn, gExprFn, start, end, step, maxRows = 45) {
    if (step <= 0) throw new Error("Range ERROR");
    if (start > end) throw new Error("Range ERROR");

    const rows = [];
    let count = 0;

    // Tránh lỗi trôi dấu phẩy động bằng cách tính x = start + i * step
    for (let i = 0; count < maxRows; i++) {
      const x = Math.round((start + i * step) * 1e9) / 1e9;
      if (x > end + 1e-9) break;

      count++;
      let fVal = "ERROR";
      let gVal = null;

      try {
        const y = fExprFn(x);
        if (isNaN(y) || !isFinite(y)) {
          fVal = "ERROR";
        } else {
          fVal = Math.round(y * 1e6) / 1e6;
        }
      } catch (e) {
        fVal = "ERROR";
      }

      if (gExprFn) {
        try {
          const gy = gExprFn(x);
          if (isNaN(gy) || !isFinite(gy)) {
            gVal = "ERROR";
          } else {
            gVal = Math.round(gy * 1e6) / 1e6;
          }
        } catch (e) {
          gVal = "ERROR";
        }
      }

      rows.push({
        index: count,
        x,
        fx: fVal,
        gx: gVal
      });
    }

    return rows;
  }
}
