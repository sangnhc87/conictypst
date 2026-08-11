const CACHE_NAME = 'omr-cache-v37-scanner';
const urlsToCache = [
  './index.html',
  './manifest.json',
  './icon-192.png',
  './icon-512.png',
  './js/copyright_guard.js',
  './premium_styles.css',
  './opencv.js',
  './opencv.wasm',
  './js/tln_codec.js?v=1-vn-left-to-right',
  './js/omr_engine.js?v=8.3-mobile-scan-quality',
  './js/omr_profiles.js',
  './js/omr_db.js?v=5-account-safe-outbox',
  './js/omr_cloud_sync.js?v=5-local-images-free-tier',
  './js/vendor/qrcode.js',
  './js/vendor/jsQR.js',
  './js/vendor/jspdf.umd.min.js?v=2.5.1-local',
  './js/vendor/xlsx.full.min.js',
  './js/vendor/pdf.min.mjs',
  './js/vendor/pdf.worker.min.mjs',
  './js/gemini_grader.js',
  './js/tf_grader.js',
  './tfjs_model/model.json',
  './tfjs_model/group1-shard1of1.bin'
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        return cache.addAll(urlsToCache);
      })
      .then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheName !== CACHE_NAME) {
            console.log('Deleting old cache:', cacheName);
            return caches.delete(cacheName);
          }
        })
      );
    }).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', event => {
  if (event.request.method !== 'GET') return;
  const requestUrl = new URL(event.request.url);
  if (requestUrl.origin !== self.location.origin) return;

  event.respondWith((async () => {
    try {
      const response = await fetch(event.request);
      if (response && response.status === 200 && response.type === 'basic') {
        const cache = await caches.open(CACHE_NAME);
        await cache.put(event.request, response.clone());
      }
      return response;
    } catch (_) {
      const cached = await caches.match(event.request);
      if (cached) return cached;

      if (event.request.mode === 'navigate') {
        const appShell = await caches.match('./index.html');
        if (appShell) return appShell;
      }

      return new Response('Tạm thời không thể tải tài nguyên khi ngoại tuyến.', {
        status: 503,
        statusText: 'Service Unavailable',
        headers: { 'Content-Type': 'text/plain; charset=utf-8' }
      });
    }
  })());
});
