import { Memory } from './engine/memory.js';
import { Evaluator } from './engine/evaluator.js';
import { NaturalEngine } from './engine/natural-engine.js';
import { TableGenerator } from './engine/table.js';
import { Solver } from './engine/solver.js';
import { SolveEngine } from './engine/solve-eqn.js';
import { InequalitySolver } from './engine/inequality.js';
import { StatisticsEngine } from './engine/statistics.js';
import { BaseNEngine } from './engine/base-n.js';
import { Vector } from './engine/vector.js';
import { Matrix } from './engine/matrix.js';
import { Complex } from './engine/complex.js';
import { Calculus } from './engine/calculus.js';
import { AudioFeedback } from './ui/audio.js';
import { DisplayRenderer } from './ui/display-renderer.js';
import { HardwareKeyboard } from './ui/keyboard.js';
import { FloatingManager } from './ui/floating-manager.js';
import { PWAInstaller } from './ui/pwa-installer.js';

class CasioApp {
  constructor() {
    this.memory = new Memory();
    this.evaluator = new Evaluator(this.memory);
    this.natural = new NaturalEngine(this.memory);
    this.baseN = new BaseNEngine();
    this.audio = new AudioFeedback();

    // Mode: 1=COMP, 2=CMPLX, 3=BASE-N, 4=MATRIX, 5=VECTOR, 6=STAT, 7=TABLE, 8=EQN, 9=INEQ
    this.currentMode = 1;

    // Trạng thái phím bổ trợ
    this.shiftActive = false;
    this.alphaActive = false;
    this.stoActive = false;
    this.isFracView = true;

    // Bộ đệm tính toán chuẩn (COMP)
    this.inputStr = '';
    this.cursorPos = 0;
    this.lastResult = null;

    // Trạng thái CALC & SOLVE
    this.calcState = {
      active: false,
      expr: '',
      curVar: 'x',
      valStr: ''
    };

    // Trạng thái TABLE (Mode 7)
    this.tableState = {
      step: 'fx', // 'fx', 'start', 'end', 'step', 'view'
      fExpr: '',
      gExpr: '',
      start: -5,
      end: 5,
      stepVal: 1,
      rows: [],
      selectedRow: 0,
      selectedCol: 'fx'
    };

    // Trạng thái EQUATION (Mode 8)
    this.eqnState = {
      type: null,
      dim: 2,
      coeffs: [],
      curIndex: 0,
      result: null
    };

    // Trạng thái STATISTIC (Mode 6)
    this.statState = {
      type: '1-var',
      data: [],
      curInput: ''
    };

    this.initDOM();
  }

  initDOM() {
    const container = document.getElementById('calc-app');
    this.display = new DisplayRenderer(container);

    const calcBody = document.getElementById('calculator-body');
    const dragHandle = document.getElementById('calc-drag-handle');
    this.floating = new FloatingManager(calcBody, dragHandle);

    const installBtn = document.getElementById('btn-pwa-install');
    const iosModal = document.getElementById('ios-modal');
    this.pwa = new PWAInstaller(installBtn, iosModal);

    this.keyboard = new HardwareKeyboard((key) => this.handleKeyPress(key));

    this.bindButtons();
    this.bindDocViewer();
    this.updateDisplay();
  }

  bindDocViewer() {
    const fileInput = document.getElementById('doc-file-input');
    const docContent = document.querySelector('.doc-content');

    if (fileInput && docContent) {
      fileInput.addEventListener('change', (e) => {
        const file = e.target.files[0];
        if (!file) return;

        if (file.type.startsWith('image/')) {
          const reader = new FileReader();
          reader.onload = (evt) => {
            docContent.innerHTML = `
              <div style="text-align:center;">
                <img src="${evt.target.result}" style="max-width:100%; border-radius:12px; box-shadow:0 4px 20px rgba(0,0,0,0.15);" alt="Tài liệu bài học">
              </div>
            `;
          };
          reader.readAsDataURL(file);
        } else if (file.type === 'application/pdf') {
          const url = URL.createObjectURL(file);
          docContent.innerHTML = `
            <iframe src="${url}" style="width:100%; height:100%; min-height:680px; border:none; border-radius:12px;"></iframe>
          `;
        }
      });
    }
  }

  bindButtons() {
    document.querySelectorAll('.c-btn, .d-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        const key = btn.dataset.key;
        if (key) this.handleKeyPress(key);
      });
    });

    document.getElementById('btn-sound-toggle')?.addEventListener('click', (e) => {
      const on = this.audio.toggle();
      e.currentTarget.innerHTML = on ? '🔊 Âm phím: Bật' : '🔈 Âm phím: Tắt';
    });

    document.getElementById('btn-dock-toggle')?.addEventListener('click', () => {
      this.floating.dockRight();
    });

    document.getElementById('btn-split-toggle')?.addEventListener('click', () => {
      const splitPane = document.getElementById('split-document-pane');
      if (splitPane) {
        const isHidden = splitPane.style.display === 'none';
        splitPane.style.display = isHidden ? 'flex' : 'none';
        document.body.classList.toggle('has-split-view', isHidden);
      }
    });

    document.getElementById('btn-close-ios-modal')?.addEventListener('click', () => {
      document.getElementById('ios-modal')?.classList.remove('active');
    });
  }

  handleKeyPress(key) {
    this.audio.click(key === 'AC' ? 'ac' : key === '=' ? 'equal' : 'normal');

    if (key === 'SHIFT') {
      this.shiftActive = !this.shiftActive;
      this.alphaActive = false;
      this.updateDisplay();
      return;
    }

    if (key === 'ALPHA') {
      this.alphaActive = !this.alphaActive;
      this.shiftActive = false;
      this.updateDisplay();
      return;
    }

    if (key === 'STO') {
      this.stoActive = true;
      this.updateDisplay();
      return;
    }

    if (key === 'ON' || key === 'AC') {
      this.shiftActive = false;
      this.alphaActive = false;
      this.stoActive = false;
      this.calcState.active = false;
      if (this.currentMode === 7) {
        this.tableState.step = 'fx';
        this.inputStr = this.tableState.fExpr;
        this.cursorPos = this.inputStr.length;
      } else {
        this.inputStr = '';
        this.cursorPos = 0;
        this.lastResult = null;
      }
      this.updateDisplay();
      return;
    }

    if (key === 'MENU') {
      this.showMenu();
      return;
    }

    if (key === 'OPTN') {
      this.showOptn();
      return;
    }

    if (key === 'S_D') {
      this.isFracView = !this.isFracView;
      this.updateDisplay();
      return;
    }

    if (this.currentMode === 7) {
      this.handleTableInput(key);
    } else if (this.currentMode === 8) {
      this.handleEqnInput(key);
    } else {
      this.handleCompInput(key);
    }

    if (key !== 'SHIFT' && key !== 'ALPHA' && key !== 'STO') {
      this.shiftActive = false;
      this.alphaActive = false;
      this.stoActive = false;
    }

    this.updateDisplay();
  }

  handleCompInput(key) {
    // 1. Phím CALC & SOLVE
    if (key === 'CALC') {
      if (this.shiftActive) {
        // SOLVE (Dò nghiệm bằng Newton-Raphson)
        try {
          const res = SolveEngine.solve(this.evaluator, this.inputStr || 'x', 0);
          this.lastResult = { solve: res };
        } catch (e) {
          this.lastResult = { error: e.message };
        }
        return;
      } else {
        // CALC (Hỏi x? để thử giá trị)
        this.calcState.active = true;
        this.calcState.expr = this.inputStr;
        this.calcState.valStr = '';
        this.lastResult = { calcPrompt: "x? 0" };
        return;
      }
    }

    if (this.calcState.active) {
      if (key === '=') {
        const xVal = Number(this.evaluator.evaluate(this.calcState.valStr || '0').number);
        try {
          const res = this.evaluator.evaluate(this.calcState.expr, { x: xVal });
          this.lastResult = res;
          this.calcState.active = false;
        } catch (e) {
          this.lastResult = { error: e.message };
        }
        return;
      }
      if (key === 'DEL') {
        this.calcState.valStr = this.calcState.valStr.slice(0, -1);
      } else if (/[0-9.\-]/.test(key)) {
        this.calcState.valStr += key;
      }
      this.lastResult = { calcPrompt: `x? ${this.calcState.valStr}` };
      return;
    }

    // 2. Phân tích thừa số nguyên tố FACT (SHIFT + ° ' ")
    if (this.shiftActive && key === 'deg') {
      try {
        const val = this.lastResult ? this.lastResult.number : Number(this.evaluator.evaluate(this.inputStr).number);
        const fStr = Calculus.factorize(val);
        this.lastResult = { fact: fStr };
      } catch (e) {
        this.lastResult = { error: "Math ERROR" };
      }
      return;
    }

    // 3. Phím Định dạng Kỹ thuật ENG
    if (key === 'ENG') {
      if (this.lastResult && typeof this.lastResult.number === 'number') {
        this.lastResult.formatted = this.evaluator.formatEng(this.lastResult.number);
      }
      return;
    }

    // 4. Phím dấu Bằng =
    if (key === '=') {
      if (!this.inputStr.trim()) return;
      try {
        const res = this.evaluator.evaluate(this.inputStr);
        this.lastResult = res;
        this.memory.setAns(res.number);
        this.memory.addHistory(this.inputStr, res);
      } catch (err) {
        this.lastResult = { error: err.message };
      }
      return;
    }

    // 5. Lưu biến STO
    if (this.stoActive) {
      let varName = null;
      if (['A', 'B', 'C', 'D', 'E', 'F', 'x', 'y', 'M'].includes(key)) {
        varName = key;
      } else if (key === '(-)') varName = 'A';
      else if (key === 'deg') varName = 'B';
      else if (key === 'x^-1') varName = 'C';
      else if (key === 'sin') varName = 'D';
      else if (key === 'cos') varName = 'E';
      else if (key === 'tan') varName = 'F';
      else if (key === ')') varName = 'x';
      else if (key === 'S_D') varName = 'y';
      else if (key === 'M+') varName = 'M';

      if (varName) {
        const valToStore = this.lastResult ? this.lastResult.number : Number(this.evaluator.evaluate(this.inputStr || '0').number);
        this.memory.set(varName, valToStore);
        this.lastResult = { formatted: `${valToStore} → ${varName}` };
        this.stoActive = false;
        return;
      }
    }

    // Phím DEL
    if (key === 'DEL') {
      if (this.cursorPos > 0) {
        this.inputStr = this.inputStr.slice(0, this.cursorPos - 1) + this.inputStr.slice(this.cursorPos);
        this.cursorPos--;
      }
      return;
    }

    // Điều hướng Replay
    if (key === 'LEFT') {
      this.cursorPos = Math.max(0, this.cursorPos - 1);
      return;
    }
    if (key === 'RIGHT') {
      this.cursorPos = Math.min(this.inputStr.length, this.cursorPos + 1);
      return;
    }
    if (key === 'UP') {
      const prev = this.memory.historyPrev();
      if (prev) {
        this.inputStr = prev.expr;
        this.cursorPos = this.inputStr.length;
        this.lastResult = prev.result;
      }
      return;
    }
    if (key === 'DOWN') {
      const next = this.memory.historyNext();
      if (next) {
        this.inputStr = next.expr;
        this.cursorPos = this.inputStr.length;
        this.lastResult = next.result;
      } else {
        this.inputStr = '';
        this.cursorPos = 0;
        this.lastResult = null;
      }
      return;
    }

    // Ký tự SHIFT / ALPHA
    let insertText = key;
    if (this.shiftActive) {
      if (key === 'sqrt') insertText = 'cbrt(';
      else if (key === 'sin') insertText = 'asin(';
      else if (key === 'cos') insertText = 'acos(';
      else if (key === 'tan') insertText = 'atan(';
      else if (key === 'x^2') insertText = '^3';
      else if (key === 'log') insertText = '10^(';
      else if (key === 'ln') insertText = 'e^(';
      else if (key === '(') insertText = '%';
      else if (key === '×') insertText = 'nPr(';
      else if (key === '÷') insertText = 'nCr(';
      else if (key === 'x10^x') insertText = 'π';
      else if (key === 'Ans') insertText = 'PreAns';
      else if (key === 'int') insertText = 'd/dx(';
    } else if (this.alphaActive) {
      if (key === '(-)') insertText = 'A';
      else if (key === 'deg') insertText = 'B';
      else if (key === 'x^-1') insertText = 'C';
      else if (key === 'sin') insertText = 'D';
      else if (key === 'cos') insertText = 'E';
      else if (key === 'tan') insertText = 'F';
      else if (key === ')') insertText = 'x';
      else if (key === 'S_D') insertText = 'y';
      else if (key === 'M+') insertText = 'M';
      else if (key === 'CALC') insertText = '=';
    } else {
      if (key === 'sqrt') insertText = 'sqrt(';
      else if (key === 'frac') insertText = '/';
      else if (key === 'x^2') insertText = '^2';
      else if (key === 'x^y') insertText = '^(';
      else if (key === 'x^-1') insertText = '^-1';
      else if (key === 'sin') insertText = 'sin(';
      else if (key === 'cos') insertText = 'cos(';
      else if (key === 'tan') insertText = 'tan(';
      else if (key === 'ln') insertText = 'ln(';
      else if (key === 'log') insertText = 'log(';
      else if (key === 'deg') insertText = '°';
      else if (key === '(-)') insertText = '−';
      else if (key === 'x10^x') insertText = '×10^';
      else if (key === 'int') insertText = '∫(';
    }

    this.inputStr = this.inputStr.slice(0, this.cursorPos) + insertText + this.inputStr.slice(this.cursorPos);
    this.cursorPos += insertText.length;
  }

  handleTableInput(key) {
    const st = this.tableState;

    if (st.step === 'view') {
      if (key === 'UP') {
        st.selectedRow = Math.max(0, st.selectedRow - 1);
        this.display.renderTableScreen(st.rows, st.selectedRow, st.selectedCol);
        return;
      }
      if (key === 'DOWN') {
        st.selectedRow = Math.min(st.rows.length - 1, st.selectedRow + 1);
        this.display.renderTableScreen(st.rows, st.selectedRow, st.selectedCol);
        return;
      }
      if (key === 'LEFT') {
        st.selectedCol = st.selectedCol === 'fx' ? 'x' : 'fx';
        this.display.renderTableScreen(st.rows, st.selectedRow, st.selectedCol);
        return;
      }
      if (key === 'RIGHT') {
        st.selectedCol = st.selectedCol === 'x' ? 'fx' : 'x';
        this.display.renderTableScreen(st.rows, st.selectedRow, st.selectedCol);
        return;
      }
      if (key === 'AC') {
        st.step = 'fx';
        this.inputStr = st.fExpr;
        this.cursorPos = this.inputStr.length;
        this.updateDisplay();
        return;
      }
      return;
    }

    if (key === '=') {
      if (st.step === 'fx') {
        st.fExpr = this.inputStr.trim() || 'x';
        st.step = 'start';
        this.inputStr = '-5';
        this.cursorPos = this.inputStr.length;
      } else if (st.step === 'start') {
        st.start = Number(this.evaluator.evaluate(this.inputStr).number);
        st.step = 'end';
        this.inputStr = '5';
        this.cursorPos = this.inputStr.length;
      } else if (st.step === 'end') {
        st.end = Number(this.evaluator.evaluate(this.inputStr).number);
        st.step = 'step';
        this.inputStr = '1';
        this.cursorPos = this.inputStr.length;
      } else if (st.step === 'step') {
        st.stepVal = Number(this.evaluator.evaluate(this.inputStr).number);
        if (st.stepVal <= 0) st.stepVal = 1;

        const fFn = (xVal) => this.evaluator.evaluate(st.fExpr, { x: xVal }).number;
        st.rows = TableGenerator.generate(fFn, null, st.start, st.end, st.stepVal);
        st.step = 'view';
        st.selectedRow = 0;
        st.selectedCol = 'fx';
        this.display.renderTableScreen(st.rows, st.selectedRow, st.selectedCol);
        return;
      }
      this.updateDisplay();
      return;
    }

    this.handleCompInput(key);
  }

  handleEqnInput(key) {
    const eq = this.eqnState;
    if (!eq.type) {
      if (key === '1') {
        eq.type = 'simul';
        eq.dim = 2;
        eq.coeffs = [0, 0, 0, 0, 0, 0];
        eq.curIndex = 0;
      } else if (key === '2') {
        eq.type = 'poly';
        eq.dim = 2;
        eq.coeffs = [1, -5, 6];
        eq.curIndex = 0;
      }
      this.inputStr = '0';
      this.cursorPos = 1;
      this.updateDisplay();
      return;
    }

    if (key === '=') {
      const val = Number(this.evaluator.evaluate(this.inputStr).number);
      eq.coeffs[eq.curIndex] = val;
      eq.curIndex++;

      const totalNeeded = eq.type === 'poly' ? eq.dim + 1 : eq.dim * (eq.dim + 1);
      if (eq.curIndex >= totalNeeded) {
        if (eq.type === 'poly' && eq.dim === 2) {
          const res = Solver.solveQuadratic(eq.coeffs[0], eq.coeffs[1], eq.coeffs[2]);
          this.display.renderEquationResult(res);
        } else if (eq.type === 'simul' && eq.dim === 2) {
          try {
            const A = [[eq.coeffs[0], eq.coeffs[1]], [eq.coeffs[3], eq.coeffs[4]]];
            const B = [eq.coeffs[2], eq.coeffs[5]];
            const roots = Solver.solveLinearSystem(A, B);
            this.display.renderEquationResult({ linearRoots: roots });
          } catch (e) {
            this.display.renderEquationResult({ error: e.message });
          }
        }
        return;
      }

      this.inputStr = '0';
      this.cursorPos = 1;
      this.updateDisplay();
      return;
    }

    this.handleCompInput(key);
  }

  showMenu() {
    const menu = [
      { num: '1', title: 'COMP', code: 1 },
      { num: '2', title: 'CMPLX', code: 2 },
      { num: '3', title: 'BASE-N', code: 3 },
      { num: '4', title: 'MATRIX', code: 4 },
      { num: '5', title: 'VECTOR', code: 5 },
      { num: '6', title: 'STATISTIC', code: 6 },
      { num: '7', title: 'TABLE', code: 7 },
      { num: '8', title: 'EQUATION', code: 8 }
    ];

    this.display.renderMenu(menu, (code) => {
      this.currentMode = code;
      this.updateDisplay();
    });

    const selectModeHandler = (e) => {
      const k = e.key;
      if (['1', '2', '3', '4', '5', '6', '7', '8'].includes(k)) {
        window.removeEventListener('keydown', selectModeHandler);
        this.currentMode = parseInt(k, 10);
        if (this.currentMode === 7) {
          this.tableState.step = 'fx';
          this.inputStr = '';
          this.cursorPos = 0;
        } else if (this.currentMode === 8) {
          this.eqnState.type = null;
        }
        this.updateDisplay();
      }
    };
    window.addEventListener('keydown', selectModeHandler, { once: true });
  }

  showOptn() {
    const optns = [
      { num: '1', title: 'Hyperbolic' },
      { num: '2', title: 'Angle Unit' },
      { num: '3', title: 'Factoring' }
    ];
    this.display.renderOptn(optns);
  }

  updateDisplay() {
    this.display.updateStatusBar({
      shift: this.shiftActive,
      alpha: this.alphaActive,
      hasMem: this.memory.get('M') !== 0,
      sto: this.stoActive,
      angleUnit: this.evaluator.angleUnit
    });

    if (this.currentMode === 7) {
      const st = this.tableState;
      if (st.step === 'view') {
        this.display.renderTableScreen(st.rows, st.selectedRow, st.selectedCol);
      } else {
        const prefix = st.step === 'fx' ? 'f(x)=' : `${st.step.toUpperCase()}: `;
        this.display.renderCalcScreen(prefix + this.inputStr, prefix.length + this.cursorPos, null);
      }
      return;
    }

    if (this.currentMode === 8 && !this.eqnState.type) {
      this.display.renderCalcScreen("1:Simul  2:Poly", 0, null);
      return;
    }

    this.display.renderCalcScreen(this.inputStr, this.cursorPos, this.lastResult, this.isFracView);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  window.casioApp = new CasioApp();
});
