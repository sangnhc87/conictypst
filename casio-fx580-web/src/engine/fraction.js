// Exact Fraction Engine for Casio Natural Display
export class Fraction {
  constructor(num, den = 1n) {
    num = BigInt(num);
    den = BigInt(den);
    if (den === 0n) throw new Error("Math ERROR");
    if (den < 0n) {
      num = -num;
      den = -den;
    }
    const g = Fraction.gcd(num < 0n ? -num : num, den);
    this.n = num / g;
    this.d = den / g;
  }

  static gcd(a, b) {
    while (b !== 0n) {
      const t = b;
      b = a % b;
      a = t;
    }
    return a;
  }

  add(other) {
    return new Fraction(this.n * other.d + other.n * this.d, this.d * other.d);
  }

  sub(other) {
    return new Fraction(this.n * other.d - other.n * this.d, this.d * other.d);
  }

  mul(other) {
    return new Fraction(this.n * other.n, this.d * other.d);
  }

  div(other) {
    if (other.n === 0n) throw new Error("Math ERROR");
    return new Fraction(this.n * other.d, this.d * other.n);
  }

  neg() {
    return new Fraction(-this.n, this.d);
  }

  toNumber() {
    return Number(this.n) / Number(this.d);
  }

  isInteger() {
    return this.d === 1n;
  }

  toString() {
    if (this.d === 1n) return this.n.toString();
    return `${this.n}/${this.d}`;
  }

  toHtml() {
    if (this.d === 1n) return `<span class="num">${this.n}</span>`;
    return `<span class="frac"><span class="frac-num">${this.n}</span><span class="frac-bar"></span><span class="frac-den">${this.d}</span></span>`;
  }

  static fromNumber(val, maxDenom = 10000000n) {
    if (isNaN(val) || !isFinite(val)) throw new Error("Math ERROR");
    if (Number.isInteger(val)) return new Fraction(BigInt(val), 1n);

    const sign = val < 0 ? -1n : 1n;
    val = Math.abs(val);

    // Continuous fraction approximation
    let h1 = 1n, h2 = 0n, k1 = 0n, k2 = 1n;
    let b = val;
    do {
      const a = BigInt(Math.floor(b));
      let aux = h1;
      h1 = a * h1 + h2;
      h2 = aux;
      aux = k1;
      k1 = a * k1 + k2;
      k2 = aux;
      b = 1 / (b - Number(a));
    } while (Math.abs(val - Number(h1) / Number(k1)) > val * 1e-12 && k1 < maxDenom);

    return new Fraction(sign * h1, k1);
  }
}
