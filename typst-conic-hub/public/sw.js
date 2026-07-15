const CACHE_NAME = 'typst-conic-hub-v3-security-bridge'
const SHELL = ['/', '/conic-mark.svg']

async function cacheResponse(request, response) {
  if (response?.ok || response?.type === 'opaque') {
    const cache = await caches.open(CACHE_NAME)
    await cache.put(request, response.clone())
  }
  return response
}

async function networkFirst(request, fallbackPath = '') {
  try {
    return await cacheResponse(request, await fetch(request))
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

async function cacheFirst(request) {
  const cached = await caches.match(request)
  if (cached) return cached
  return cacheResponse(request, await fetch(request))
}

self.addEventListener('install', event => {
  event.waitUntil(caches.open(CACHE_NAME).then(cache => cache.addAll(SHELL)))
})

self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.filter(key => key !== CACHE_NAME).map(key => caches.delete(key))))
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
    event.respondWith(networkFirst(event.request, '/'))
    return
  }

  const sameOrigin = url.origin === self.location.origin
  const immutableAsset = sameOrigin && url.pathname.startsWith('/assets/')
  const runtimeWasm = url.hostname === 'cdn.jsdelivr.net'

  if (immutableAsset || runtimeWasm) {
    event.respondWith(cacheFirst(event.request))
    return
  }

  if (sameOrigin) event.respondWith(networkFirst(event.request))
})
