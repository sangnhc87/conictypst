export class BaseNEngine {
  constructor() {
    this.currentBase = 'DEC'; // 'DEC', 'HEX', 'BIN', 'OCT'
  }

  setBase(base) {
    if (['DEC', 'HEX', 'BIN', 'OCT'].includes(base)) {
      this.currentBase = base;
    }
  }

  // Chuyển chuỗi ở base hiện tại sang số nguyên 32-bit có dấu
  parse(str) {
    let s = str.trim().toUpperCase();
    if (!s) return 0;
    let val = 0;
    if (this.currentBase === 'DEC') val = parseInt(s, 10);
    else if (this.currentBase === 'HEX') val = parseInt(s, 16);
    else if (this.currentBase === 'BIN') val = parseInt(s, 2);
    else if (this.currentBase === 'OCT') val = parseInt(s, 8);

    if (isNaN(val)) throw new Error("Syntax ERROR");
    return val | 0; // 32-bit signed integer
  }

  // Định dạng số nguyên ra chuỗi ở base hiện tại
  format(val) {
    val = val | 0;
    if (this.currentBase === 'DEC') return val.toString(10);
    if (this.currentBase === 'HEX') return (val >>> 0).toString(16).toUpperCase();
    if (this.currentBase === 'BIN') return (val >>> 0).toString(2);
    if (this.currentBase === 'OCT') return (val >>> 0).toString(8);
    return val.toString();
  }

  and(a, b) { return (a & b) | 0; }
  or(a, b) { return (a | b) | 0; }
  xor(a, b) { return (a ^ b) | 0; }
  not(a) { return (~a) | 0; }
  neg(a) { return (-a) | 0; }
}
