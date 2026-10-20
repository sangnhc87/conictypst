// Service worker: lần đầu mở có mạng thì lưu toàn bộ ứng dụng vào máy; sau đó chạy được khi mất mạng.
// Mỗi lần build có CACHE riêng; bản mới cài đặt xong sẽ thay bản cũ (người dùng online thì luôn được bản mới).
const CACHE = 'sangmath-__BUILD_ID__'
const FILES = __FILES__
self.addEventListener('install', e => {
  e.waitUntil((async () => {
    const c = await caches.open(CACHE)
    // nạp theo đợt nhỏ, tệp nào lỗi thì bỏ qua (vẫn gọi mạng khi cần)
    for (let i = 0; i < FILES.length; i += 12) await Promise.all(FILES.slice(i, i + 12).map(f => c.add(new Request(f, { cache: 'reload' })).catch(() => {})))
    await self.skipWaiting()
  })())
})
self.addEventListener('activate', e => {
  e.waitUntil((async () => {
    for (const k of await caches.keys()) if (k.startsWith('sangmath-') && k !== CACHE) await caches.delete(k)
    await self.clients.claim()
  })())
})
self.addEventListener('fetch', e => {
  const req = e.request
  if (req.method !== 'GET') return
  const url = new URL(req.url)
  if (url.origin !== location.origin || url.pathname.endsWith('/version.json')) return
  e.respondWith((async () => {
    const c = await caches.open(CACHE)
    let hit = await c.match(req, { ignoreSearch: true })
    if (!hit && !/\.[a-z0-9]+$/i.test(url.pathname)) hit = await c.match(url.pathname.replace(/\/$/, '') + '.html', { ignoreSearch: true }) || await c.match('index.html')
    if (hit) return hit
    try { return await fetch(req) } catch { return new Response('Đang ngoại tuyến và tệp này chưa được lưu.', { status: 503 }) }
  })())
})
