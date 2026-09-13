import { Fraction } from './fraction.js';
import { Complex } from './complex.js';
import { Calculus } from './calculus.js';

// Node types: 'char', 'frac', 'sqrt', 'cbrt', 'pow', 'logbase', 'int', 'diff', 'sum', 'paren'

export class NaturalEngine {
  constructor(memory) {
    this.memory = memory;
    this.angleUnit = 'DEG'; // 'DEG', 'RAD', 'GRAD'
    this.nodes = [];
    this.cursorPath = [0]; // path in the AST to the current cursor position
  }

  setAngleUnit(unit) {
    this.angleUnit = unit;
  }

  clear() {
    this.nodes = [];
    this.cursorPath = [0];
  }

  isEmpty() {
    return this.nodes.length === 0;
  }

  // Chuyển AST thành chuỗi biểu thức để tính toán
  toEvalString(nodes = this.nodes, varValues = {}) {
    let out = '';
    for (let i = 0; i < nodes.length; i++) {
      const node = nodes[i];
      if (typeof node === 'string') {
        if (node === '×') out += '*';
        else if (node === '÷') out += '/';
        else if (node === '−') out += '-';
        else if (node === 'π') out += `(${Math.PI})`;
        else if (node === 'e') out += `(${Math.E})`;
        else if (node === 'Ans') out += `(${this.memory.get('Ans')})`;
        else if (node === 'PreAns') out += `(${this.memory.get('PreAns')})`;
        else if (['A', 'B', 'C', 'D', 'E', 'F', 'M', 'x', 'y'].includes(node)) {
          const val = varValues[node] !== undefined ? varValues[node] : this.memory.get(node);
          out += `(${val})`;
        } else {
          out += node;
        }
      } else if (node.type === 'frac') {
        const num = this.toEvalString(node.num, varValues) || '0';
        const den = this.toEvalString(node.den, varValues) || '1';
        out += `((${num})/(${den}))`;
      } else if (node.type === 'sqrt') {
        const inner = this.toEvalString(node.content, varValues) || '0';
        out += `sqrt(${inner})`;
      } else if (node.type === 'cbrt') {
        const inner = this.toEvalString(node.content, varValues) || '0';
        out += `cbrt(${inner})`;
      } else if (node.type === 'pow') {
        const exp = this.toEvalString(node.exp, varValues) || '1';
        out += `^(${exp})`;
      } else if (node.type === 'logbase') {
        const b = this.toEvalString(node.base, varValues) || '10';
        const a = this.toEvalString(node.arg, varValues) || '1';
        out += `log(${b}, ${a})`;
      } else if (node.type === 'diff') {
        const fStr = this.toEvalString(node.expr, { x: 'x' }) || '0';
        const atVal = this.toEvalString(node.at, varValues) || '0';
        out += `d/dx(${fStr}, ${atVal})`;
      } else if (node.type === 'int') {
        const fStr = this.toEvalString(node.expr, { x: 'x' }) || '0';
        const a = this.toEvalString(node.from, varValues) || '0';
        const b = this.toEvalString(node.to, varValues) || '0';
        out += `∫(${fStr}, ${a}, ${b})`;
      }
    }
    return out;
  }

  // Thêm một ký tự hoặc khối toán học vào vị trí con trỏ
  insert(item) {
    this.nodes.push(item);
  }

  // Xoá ký tự trước con trỏ
  deleteBack() {
    if (this.nodes.length > 0) {
      this.nodes.pop();
    }
  }

  // Render HTML cho Natural-V.P.A.M LCD
  toHtml() {
    if (this.nodes.length === 0) {
      return '<span class="lcd-cursor"></span>';
    }

    const renderNodes = (nodes) => {
      let html = '';
      for (const node of nodes) {
        if (typeof node === 'string') {
          html += `<span class="math-char">${node}</span>`;
        } else if (node.type === 'frac') {
          html += `
            <span class="math-frac">
              <span class="math-num">${renderNodes(node.num)}</span>
              <span class="math-bar"></span>
              <span class="math-den">${renderNodes(node.den)}</span>
            </span>
          `;
        } else if (node.type === 'sqrt') {
          html += `
            <span class="math-sqrt">
              <span class="sqrt-sym">√</span>
              <span class="sqrt-body">${renderNodes(node.content)}</span>
            </span>
          `;
        } else if (node.type === 'pow') {
          html += `<sup class="math-exp">${renderNodes(node.exp)}</sup>`;
        } else if (node.type === 'logbase') {
          html += `
            <span class="math-log">
              log<sub class="math-base">${renderNodes(node.base)}</sub>(${renderNodes(node.arg)})
            </span>
          `;
        }
      }
      return html;
    };

    return renderNodes(this.nodes) + '<span class="lcd-cursor"></span>';
  }
}
