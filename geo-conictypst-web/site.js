document.addEventListener('DOMContentLoaded', () => {
  if (window.lucide) window.lucide.createIcons();

  const copyButton = document.getElementById('copyAccount');
  copyButton?.addEventListener('click', async () => {
    try {
      await navigator.clipboard.writeText('10389821115');
      copyButton.setAttribute('aria-label', 'Đã sao chép số tài khoản');
      copyButton.innerHTML = '<span style="font-size:11px;font-weight:800">Đã chép</span>';
      setTimeout(() => {
        copyButton.setAttribute('aria-label', 'Sao chép số tài khoản');
        copyButton.innerHTML = '<i data-lucide="copy"></i>';
        if (window.lucide) window.lucide.createIcons();
      }, 1800);
    } catch {
      window.prompt('Sao chép số tài khoản VPBank:', '10389821115');
    }
  });
});
