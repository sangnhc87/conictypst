export class FloatingManager {
  constructor(calculatorElement, dragHandle) {
    this.calcEl = calculatorElement;
    this.handle = dragHandle;
    this.isDragging = false;
    this.startX = 0;
    this.startY = 0;
    this.initialLeft = 0;
    this.initialTop = 0;
    this.isMini = false;
    this.scale = 1.0;

    this.initEvents();
  }

  initEvents() {
    if (!this.handle || !this.calcEl) return;

    // Kéo thả chuột
    this.handle.addEventListener('mousedown', (e) => this.onDragStart(e));
    window.addEventListener('mousemove', (e) => this.onDragMove(e));
    window.addEventListener('mouseup', () => this.onDragEnd());

    // Kéo thả cảm ứng trên iPad/iPhone
    this.handle.addEventListener('touchstart', (e) => {
      if (e.touches.length === 1) {
        this.onDragStart(e.touches[0]);
      }
    }, { passive: false });

    window.addEventListener('touchmove', (e) => {
      if (this.isDragging && e.touches.length === 1) {
        this.onDragMove(e.touches[0]);
        e.preventDefault();
      }
    }, { passive: false });

    window.addEventListener('touchend', () => this.onDragEnd());
  }

  onDragStart(e) {
    // Không kéo thả khi click vào các nút điều khiển
    if (e.target.closest('.header-btn')) return;

    this.isDragging = true;
    this.startX = e.clientX;
    this.startY = e.clientY;

    const rect = this.calcEl.getBoundingClientRect();
    this.initialLeft = rect.left;
    this.initialTop = rect.top;

    this.calcEl.classList.add('is-dragging');
    this.calcEl.style.position = 'fixed';
    this.calcEl.style.left = `${this.initialLeft}px`;
    this.calcEl.style.top = `${this.initialTop}px`;
    this.calcEl.style.margin = '0';
  }

  onDragMove(e) {
    if (!this.isDragging) return;
    const dx = e.clientX - this.startX;
    const dy = e.clientY - this.startY;

    let newX = this.initialLeft + dx;
    let newY = this.initialTop + dy;

    // Giới hạn trong màn hình
    const maxX = window.innerWidth - this.calcEl.offsetWidth * 0.3;
    const maxY = window.innerHeight - 50;

    newX = Math.max(-this.calcEl.offsetWidth * 0.7, Math.min(newX, maxX));
    newY = Math.max(0, Math.min(newY, maxY));

    this.calcEl.style.left = `${newX}px`;
    this.calcEl.style.top = `${newY}px`;
  }

  onDragEnd() {
    this.isDragging = false;
    this.calcEl.classList.remove('is-dragging');
  }

  // Thu nhỏ thành widget góc màn hình
  toggleMini() {
    this.isMini = !this.isMini;
    this.calcEl.classList.toggle('mini-mode', this.isMini);
    return this.isMini;
  }

  // Chỉnh tỉ lệ hiển thị (phù hợp với iPad, laptop nhỏ)
  setScale(scaleVal) {
    this.scale = Math.max(0.6, Math.min(scaleVal, 1.4));
    this.calcEl.style.transform = `scale(${this.scale})`;
    this.calcEl.style.transformOrigin = 'top center';
  }

  // Ghim về vị trí mặc định bên phải (kiểu Slide Over iPad)
  dockRight() {
    this.calcEl.style.position = 'fixed';
    this.calcEl.style.right = '20px';
    this.calcEl.style.left = 'auto';
    this.calcEl.style.top = '30px';
    this.calcEl.style.margin = '0';
  }
}
