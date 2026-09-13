export class Matrix {
  constructor(rows, cols, data = null) {
    this.rows = rows;
    this.cols = cols;
    if (data) {
      this.data = data.map(r => [...r]);
    } else {
      this.data = Array.from({ length: rows }, () => Array(cols).fill(0));
    }
  }

  get(r, c) {
    return this.data[r][c];
  }

  set(r, c, val) {
    this.data[r][c] = Number(val);
  }

  add(other) {
    if (this.rows !== other.rows || this.cols !== other.cols) {
      throw new Error("Dimension ERROR");
    }
    const res = new Matrix(this.rows, this.cols);
    for (let r = 0; r < this.rows; r++) {
      for (let c = 0; c < this.cols; c++) {
        res.data[r][c] = this.data[r][c] + other.data[r][c];
      }
    }
    return res;
  }

  sub(other) {
    if (this.rows !== other.rows || this.cols !== other.cols) {
      throw new Error("Dimension ERROR");
    }
    const res = new Matrix(this.rows, this.cols);
    for (let r = 0; r < this.rows; r++) {
      for (let c = 0; c < this.cols; c++) {
        res.data[r][c] = this.data[r][c] - other.data[r][c];
      }
    }
    return res;
  }

  mul(other) {
    if (typeof other === 'number') {
      const res = new Matrix(this.rows, this.cols);
      for (let r = 0; r < this.rows; r++) {
        for (let c = 0; c < this.cols; c++) {
          res.data[r][c] = this.data[r][c] * other;
        }
      }
      return res;
    }
    if (this.cols !== other.rows) {
      throw new Error("Dimension ERROR");
    }
    const res = new Matrix(this.rows, other.cols);
    for (let i = 0; i < this.rows; i++) {
      for (let j = 0; j < other.cols; j++) {
        let sum = 0;
        for (let k = 0; k < this.cols; k++) {
          sum += this.data[i][k] * other.data[k][j];
        }
        res.data[i][j] = sum;
      }
    }
    return res;
  }

  transpose() {
    const res = new Matrix(this.cols, this.rows);
    for (let r = 0; r < this.rows; r++) {
      for (let c = 0; c < this.cols; c++) {
        res.data[c][r] = this.data[r][c];
      }
    }
    return res;
  }

  det() {
    if (this.rows !== this.cols) throw new Error("Dimension ERROR");
    const n = this.rows;
    const m = this.data.map(r => [...r]);
    let det = 1;
    for (let i = 0; i < n; i++) {
      let pivot = i;
      for (let j = i + 1; j < n; j++) {
        if (Math.abs(m[j][i]) > Math.abs(m[pivot][i])) pivot = j;
      }
      if (Math.abs(m[pivot][i]) < 1e-12) return 0;
      if (pivot !== i) {
        [m[i], m[pivot]] = [m[pivot], m[i]];
        det = -det;
      }
      det *= m[i][i];
      for (let j = i + 1; j < n; j++) {
        const factor = m[j][i] / m[i][i];
        for (let k = i + 1; k < n; k++) {
          m[j][k] -= factor * m[i][k];
        }
      }
    }
    return Math.round(det * 1e10) / 1e10;
  }

  inv() {
    if (this.rows !== this.cols) throw new Error("Dimension ERROR");
    const n = this.rows;
    const a = this.data.map(r => [...r]);
    const inv = Array.from({ length: n }, (_, i) => 
      Array.from({ length: n }, (_, j) => (i === j ? 1 : 0))
    );

    for (let i = 0; i < n; i++) {
      let pivot = i;
      for (let j = i + 1; j < n; j++) {
        if (Math.abs(a[j][i]) > Math.abs(a[pivot][i])) pivot = j;
      }
      if (Math.abs(a[pivot][i]) < 1e-12) throw new Error("Math ERROR");
      if (pivot !== i) {
        [a[i], a[pivot]] = [a[pivot], a[i]];
        [inv[i], inv[pivot]] = [inv[pivot], inv[i]];
      }
      const div = a[i][i];
      for (let j = 0; j < n; j++) {
        a[i][j] /= div;
        inv[i][j] /= div;
      }
      for (let j = 0; j < n; j++) {
        if (j !== i) {
          const factor = a[j][i];
          for (let k = 0; k < n; k++) {
            a[j][k] -= factor * a[i][k];
            inv[j][k] -= factor * inv[i][k];
          }
        }
      }
    }
    return new Matrix(n, n, inv);
  }
}
