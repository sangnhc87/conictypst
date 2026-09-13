export class PWAInstaller {
  constructor(installBtn, infoModal) {
    this.installBtn = installBtn;
    this.infoModal = infoModal;
    this.deferredPrompt = null;
    this.isStandalone = window.matchMedia('(display-mode: standalone)').matches || window.navigator.standalone === true;
    this.isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;

    this.init();
  }

  init() {
    // Nếu đã ở chế độ cài đặt Standalone
    if (this.isStandalone) {
      if (this.installBtn) {
        this.installBtn.innerHTML = '✨ Đang chạy chế độ App';
        this.installBtn.classList.add('installed');
      }
      return;
    }

    // Bắt sự kiện cài đặt trên Chromium / Android / Desktop
    window.addEventListener('beforeinstallprompt', (e) => {
      e.preventDefault();
      this.deferredPrompt = e;
      if (this.installBtn) {
        this.installBtn.style.display = 'inline-flex';
        this.installBtn.innerHTML = '📲 Cài đặt App (PWA)';
      }
    });

    window.addEventListener('appinstalled', () => {
      this.deferredPrompt = null;
      if (this.installBtn) {
        this.installBtn.innerHTML = '✅ Đã cài đặt thành công';
        setTimeout(() => {
          this.installBtn.style.display = 'none';
        }, 3000);
      }
    });

    // Xử lý khi người dùng nhấn nút Cài đặt
    if (this.installBtn) {
      this.installBtn.addEventListener('click', () => this.handleInstallClick());
    }

    // Đăng ký Service Worker
    if ('serviceWorker' in navigator) {
      window.addEventListener('load', () => {
        navigator.serviceWorker.register('./sw.js').catch(() => {
          // ignore
        });
      });
    }
  }

  handleInstallClick() {
    if (this.deferredPrompt) {
      // Hộp thoại cài đặt native của trình duyệt
      this.deferredPrompt.prompt();
      this.deferredPrompt.userChoice.then((choiceResult) => {
        if (choiceResult.outcome === 'accepted') {
          console.log('User accepted install');
        }
        this.deferredPrompt = null;
      });
    } else if (this.isIOS) {
      // Hiện hướng dẫn cho iPad / iPhone
      this.showIOSGuide();
    } else {
      // Hướng dẫn chung nếu trình duyệt không hỗ trợ beforeinstallprompt trực tiếp
      this.showGeneralGuide();
    }
  }

  showIOSGuide() {
    if (this.infoModal) {
      this.infoModal.classList.add('active');
    } else {
      alert('Để cài app lên iPad / iPhone:\n1. Nhấn nút Chia sẻ (Share) trên trình duyệt Safari\n2. Chọn "Thêm vào MH chính" (Add to Home Screen)');
    }
  }

  showGeneralGuide() {
    if (this.infoModal) {
      this.infoModal.classList.add('active');
    }
  }
}
