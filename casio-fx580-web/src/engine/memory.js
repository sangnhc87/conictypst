export class Memory {
  constructor() {
    this.registers = {
      A: 0,
      B: 0,
      C: 0,
      D: 0,
      E: 0,
      F: 0,
      x: 0,
      y: 0,
      M: 0,
      Ans: 0,
      PreAns: 0
    };
    this.history = [];
    this.historyIndex = -1;
  }

  get(reg) {
    const key = reg.toUpperCase() === 'X' ? 'x' : reg.toUpperCase() === 'Y' ? 'y' : reg.toUpperCase();
    return this.registers[key] !== undefined ? this.registers[key] : 0;
  }

  set(reg, value) {
    const key = reg.toUpperCase() === 'X' ? 'x' : reg.toUpperCase() === 'Y' ? 'y' : reg.toUpperCase();
    if (this.registers[key] !== undefined) {
      this.registers[key] = value;
    }
  }

  addToM(value) {
    this.registers.M += value;
  }

  subFromM(value) {
    this.registers.M -= value;
  }

  setAns(value) {
    this.registers.PreAns = this.registers.Ans;
    this.registers.Ans = value;
  }

  addHistory(expr, result) {
    this.history.push({ expr, result });
    this.historyIndex = this.history.length;
  }

  historyPrev() {
    if (this.history.length === 0) return null;
    if (this.historyIndex > 0) {
      this.historyIndex--;
      return this.history[this.historyIndex];
    }
    return this.history[0];
  }

  historyNext() {
    if (this.history.length === 0) return null;
    if (this.historyIndex < this.history.length - 1) {
      this.historyIndex++;
      return this.history[this.historyIndex];
    }
    this.historyIndex = this.history.length;
    return null; // returned to blank input
  }
}
