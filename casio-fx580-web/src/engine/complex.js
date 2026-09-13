export class Complex {
  constructor(re = 0, im = 0) {
    this.re = Number(re);
    this.im = Number(im);
  }

  add(other) {
    const o = Complex.from(other);
    return new Complex(this.re + o.re, this.im + o.im);
  }

  sub(other) {
    const o = Complex.from(other);
    return new Complex(this.re - o.re, this.im - o.im);
  }

  mul(other) {
    const o = Complex.from(other);
    return new Complex(
      this.re * o.re - this.im * o.im,
      this.re * o.im + this.im * o.re
    );
  }

  div(other) {
    const o = Complex.from(other);
    const denom = o.re * o.re + o.im * o.im;
    if (denom === 0) throw new Error("Math ERROR");
    return new Complex(
      (this.re * o.re + this.im * o.im) / denom,
      (this.im * o.re - this.re * o.im) / denom
    );
  }

  abs() {
    return Math.hypot(this.re, this.im);
  }

  arg(angleUnit = 'DEG') {
    let rad = Math.atan2(this.im, this.re);
    if (angleUnit === 'DEG') {
      return (rad * 180) / Math.PI;
    }
    return rad;
  }

  conj() {
    return new Complex(this.re, -this.im);
  }

  pow(n) {
    const r = this.abs();
    const theta = Math.atan2(this.im, this.re);
    const newR = Math.pow(r, n);
    return new Complex(newR * Math.cos(n * theta), newR * Math.sin(n * theta));
  }

  static from(val) {
    if (val instanceof Complex) return val;
    return new Complex(val, 0);
  }

  toString(precision = 10) {
    const clean = (n) => {
      if (Math.abs(n) < 1e-12) return 0;
      return parseFloat(n.toFixed(precision));
    };
    const r = clean(this.re);
    const i = clean(this.im);

    if (i === 0) return `${r}`;
    if (r === 0) return i === 1 ? 'i' : i === -1 ? '-i' : `${i}i`;
    const sign = i > 0 ? '+' : '-';
    const absI = Math.abs(i);
    const iPart = absI === 1 ? 'i' : `${absI}i`;
    return `${r}${sign}${iPart}`;
  }
}
