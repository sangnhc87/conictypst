export class HardwareKeyboard {
  constructor(keyPressCallback) {
    this.callback = keyPressCallback;
    this.init();
  }

  init() {
    window.addEventListener('keydown', (e) => {
      // Bỏ qua nếu đang gõ trong ô input/textarea thông thường
      if (['INPUT', 'TEXTAREA'].includes(document.activeElement.tagName)) return;

      const key = e.key;

      if (key >= '0' && key <= '9') {
        e.preventDefault();
        this.callback(key);
      } else if (key === '+') {
        e.preventDefault();
        this.callback('+');
      } else if (key === '-') {
        e.preventDefault();
        this.callback('-');
      } else if (key === '*') {
        e.preventDefault();
        this.callback('×');
      } else if (key === '/') {
        e.preventDefault();
        this.callback('÷');
      } else if (key === 'Enter' || key === '=') {
        e.preventDefault();
        this.callback('=');
      } else if (key === 'Backspace') {
        e.preventDefault();
        this.callback('DEL');
      } else if (key === 'Escape' || key.toLowerCase() === 'c') {
        e.preventDefault();
        this.callback('AC');
      } else if (key === '(' || key === ')') {
        e.preventDefault();
        this.callback(key);
      } else if (key === '.' || key === ',') {
        e.preventDefault();
        this.callback('.');
      } else if (key === '^') {
        e.preventDefault();
        this.callback('^');
      } else if (key === 'ArrowLeft') {
        e.preventDefault();
        this.callback('LEFT');
      } else if (key === 'ArrowRight') {
        e.preventDefault();
        this.callback('RIGHT');
      } else if (key === 'ArrowUp') {
        e.preventDefault();
        this.callback('UP');
      } else if (key === 'ArrowDown') {
        e.preventDefault();
        this.callback('DOWN');
      } else if (key.toLowerCase() === 'x') {
        e.preventDefault();
        this.callback('x');
      } else if (key.toLowerCase() === 's' && !e.ctrlKey && !e.metaKey) {
        e.preventDefault();
        this.callback('sin');
      } else if (key.toLowerCase() === 'q') {
        e.preventDefault();
        this.callback('sqrt');
      }
    });
  }
}
