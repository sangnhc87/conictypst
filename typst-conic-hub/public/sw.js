const SHELL_CACHE_NAME = 'typst-conic-hub-shell-v6'
const STATIC_CACHE_NAME = 'typst-conic-hub-static-v3'
const SHELL = ['/', '/conic-mark.svg']

const ALLOWED_CACHES = [SHELL_CACHE_NAME, STATIC_CACHE_NAME]

async function cacheResponse(request, response, cacheName) {
  if (response?.ok || response?.type === 'opaque') {
    const cache = await caches.open(cacheName)
    await cache.put(request, response.clone())
  }
  return response
}

async function networkFirst(request, cacheName, fallbackPath = '') {
  try {
    return await cacheResponse(request, await fetch(request), cacheName)
  } catch {
    const cached = await caches.match(request)
    if (cached) return cached
    if (fallbackPath) {
      const fallback = await caches.match(fallbackPath)
      if (fallback) return fallback
    }
    return new Response('TypstConicHub đang ngoại tuyến. Hãy kết nối mạng và thử lại.', {
      status: 503,
      headers: { 'Content-Type': 'text/plain; charset=utf-8' },
    })
  }
}

async function cacheFirst(request, cacheName) {
  const cached = await caches.match(request)
  if (cached) return cached
  return cacheResponse(request, await fetch(request), cacheName)
}

self.addEventListener('install', event => {
  event.waitUntil(caches.open(SHELL_CACHE_NAME).then(cache => cache.addAll(SHELL)))
})

self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys()
      .then(keys => Promise.all(
        keys
          .filter(key => !ALLOWED_CACHES.includes(key))
          .map(key => caches.delete(key))
      ))
      .then(() => self.clients.claim()),
  )
})

self.addEventListener('message', event => {
  if (event.data?.type === 'SKIP_WAITING') self.skipWaiting()
})

self.addEventListener('fetch', event => {
  if (event.request.method !== 'GET') return
  const url = new URL(event.request.url)

  // HTML/navigation luôn thử mạng trước. Đây là điểm quan trọng để deployment
  // mới không bị index.html cũ trong cache giữ lại.
  if (event.request.mode === 'navigate') {
    event.respondWith(networkFirst(event.request, SHELL_CACHE_NAME, '/'))
    return
  }

  const sameOrigin = url.origin === self.location.origin
  const immutableAsset = sameOrigin && url.pathname.startsWith('/assets/')
  const runtimeWasm = url.hostname === 'cdn.jsdelivr.net'
  const typstPackage = url.hostname === 'packages.typst.org' && url.pathname.endsWith('.tar.gz')
  const localWasmCompiler = sameOrigin && url.pathname.startsWith('/runtime/')

  // Gói chính thức, WASM compiler và font chữ được đưa vào cache tĩnh STATIC_CACHE_NAME
  if (runtimeWasm || typstPackage || localWasmCompiler) {
    event.respondWith(cacheFirst(event.request, STATIC_CACHE_NAME))
    return
  }

  // Các asset của giao diện (có hash đổi theo phiên bản) được đưa vào SHELL_CACHE_NAME
  if (immutableAsset) {
    event.respondWith(cacheFirst(event.request, SHELL_CACHE_NAME))
    return
  }

  // Mặc định đối với cùng origin (HTML, config...) chạy networkFirst vào SHELL_CACHE_NAME
  if (sameOrigin) {
    event.respondWith(networkFirst(event.request, SHELL_CACHE_NAME))
  }
})
self.addEventListener('install', event => {
  self.skipWaiting();
});
self.addEventListener('activate', event => {
  event.waitUntil(clients.claim());
});
