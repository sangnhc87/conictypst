(() => {
  'use strict';

  if (window.__CONICTYPST_LICENSE__) return;

  const product = 'Kho hướng dẫn và công cụ ConicTypst';
  const allowedHosts = ['hdsd-conictypst.pages.dev', 'conictypst.com', 'localhost', '127.0.0.1', '::1'];
  const hostname = location.hostname.toLowerCase();
  const allowed = !hostname || allowedHosts.some(host => hostname === host || hostname.endsWith(`.${host}`));

  if (!allowed) {
    document.documentElement.innerHTML = `<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Cảnh báo bản quyền · ConicTypst</title></head><body style="margin:0;min-height:100vh;display:grid;place-items:center;background:#071711;color:#e4f2eb;font-family:Inter,system-ui,sans-serif"><main style="width:min(620px,calc(100% - 40px));padding:36px;border:1px solid #315344;border-radius:22px;background:#10261d;box-shadow:0 28px 80px rgba(0,0,0,.38)"><p style="margin:0 0 10px;color:#fb923c;font-weight:800;letter-spacing:.12em">CẢNH BÁO BẢN QUYỀN</p><h1 style="margin:0 0 14px;font-size:28px">Bản triển khai không được cấp phép</h1><p style="margin:0;color:#afc8bc;line-height:1.7">${product} thuộc hệ sinh thái ConicTypst. Không được sao chép, tái triển khai hoặc bán lại mã website khi chưa có sự đồng ý bằng văn bản.</p><a href="https://hdsd-conictypst.pages.dev/" style="display:inline-flex;margin-top:22px;padding:11px 16px;border-radius:10px;background:#047857;color:white;text-decoration:none;font-weight:750">Mở website chính thức</a></main></body>`;
    window.stop();
    throw new Error('CONICTYPST_UNLICENSED_HOST');
  }

  Object.defineProperty(window, '__CONICTYPST_LICENSE__', {
    configurable: false,
    enumerable: false,
    writable: false,
    value: Object.freeze({ product, official: true, year: 2026 }),
  });

  console.info('%cConicTypst · Cảnh báo bản quyền', 'color:#f97316;font-size:16px;font-weight:800');
  console.info('Xem source không cấp quyền sao chép, tái triển khai hoặc bán lại mã website này. Website chính thức: https://hdsd-conictypst.pages.dev/');
})();
