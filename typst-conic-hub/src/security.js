const PRODUCT_NAME = 'TypstConicHub'
const ALLOWED_HOSTS = ['typstconichub.pages.dev', 'conictypst.com', 'localhost', '127.0.0.1', '::1']

function isAllowedHost(hostname) {
  if (!hostname) return true
  return ALLOWED_HOSTS.some(host => hostname === host || hostname.endsWith(`.${host}`))
}

function renderCopyrightBlock() {
  document.documentElement.innerHTML = `
    <head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Cảnh báo bản quyền · ConicTypst</title></head>
    <body style="margin:0;min-height:100vh;display:grid;place-items:center;background:#07111f;color:#e5edf7;font-family:Inter,system-ui,sans-serif">
      <main style="width:min(620px,calc(100% - 40px));padding:36px;border:1px solid #334155;border-radius:22px;background:#101c2d;box-shadow:0 28px 80px rgba(0,0,0,.38)">
        <p style="margin:0 0 10px;color:#fb923c;font-weight:800;letter-spacing:.12em">CẢNH BÁO BẢN QUYỀN</p>
        <h1 style="margin:0 0 14px;font-size:28px">Bản triển khai không được cấp phép</h1>
        <p style="margin:0;color:#aebdd0;line-height:1.7">Mã website ${PRODUCT_NAME} thuộc hệ sinh thái ConicTypst. Việc sao chép, tái triển khai hoặc bán lại mã website khi chưa có sự đồng ý bằng văn bản là không được phép.</p>
        <a href="https://typstconichub.pages.dev/" style="display:inline-flex;margin-top:22px;padding:11px 16px;border-radius:10px;background:#2563eb;color:white;text-decoration:none;font-weight:750">Mở website chính thức</a>
      </main>
    </body>`
  window.stop()
}

if (!isAllowedHost(window.location.hostname.toLowerCase())) {
  renderCopyrightBlock()
  throw new Error('CONICTYPST_UNLICENSED_HOST')
}

Object.defineProperty(window, '__CONICTYPST_LICENSE__', {
  configurable: false,
  enumerable: false,
  writable: false,
  value: Object.freeze({ product: PRODUCT_NAME, official: true, year: 2026 }),
})

console.info('%cConicTypst · Cảnh báo bản quyền', 'color:#fb923c;font-size:16px;font-weight:800')
console.info('Xem source không cấp quyền sao chép, tái triển khai hoặc bán lại mã website này. Website chính thức: https://typstconichub.pages.dev/')
