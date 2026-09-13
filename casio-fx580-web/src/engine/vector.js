export class Vector {
  constructor(x = 0, y = 0, z = 0, dim = 3) {
    this.x = Number(x);
    this.y = Number(y);
    this.z = Number(z);
    this.dim = dim;
  }

  add(other) {
    return new Vector(this.x + other.x, this.y + other.y, this.z + other.z, this.dim);
  }

  sub(other) {
    return new Vector(this.x - other.x, this.y - other.y, this.z - other.z, this.dim);
  }

  // Tích vô hướng (Dot Product)
  dot(other) {
    return this.x * other.x + this.y * other.y + (this.dim === 3 ? this.z * other.z : 0);
  }

  // Tích có hướng (Cross Product - 3D)
  cross(other) {
    if (this.dim !== 3 || other.dim !== 3) throw new Error("Dimension ERROR");
    return new Vector(
      this.y * other.z - this.z * other.y,
      this.z * other.x - this.x * other.z,
      this.x * other.y - this.y * other.x,
      3
    );
  }

  // Độ dài vector (Magnitude)
  mag() {
    return Math.sqrt(this.dot(this));
  }

  // Góc giữa hai vector (Angle in degrees/rad)
  angle(other, unit = 'DEG') {
    const d = this.dot(other);
    const m = this.mag() * other.mag();
    if (m === 0) throw new Error("Math ERROR");
    let cosTheta = Math.max(-1, Math.min(1, d / m));
    let rad = Math.acos(cosTheta);
    return unit === 'DEG' ? (rad * 180) / Math.PI : rad;
  }

  toString() {
    if (this.dim === 2) return `[${this.x}, ${this.y}]`;
    return `[${this.x}, ${this.y}, ${this.z}]`;
  }
}
