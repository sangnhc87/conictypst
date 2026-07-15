import React from 'react'
import ReactDOM from 'react-dom/client'
import './security.js'
import './monacoSetup.js'
import App from './App.jsx'
import './styles.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)

if ('serviceWorker' in navigator && import.meta.env.PROD) {
  let reloadingForUpdate = false

  navigator.serviceWorker.addEventListener('controllerchange', () => {
    if (reloadingForUpdate) return
    reloadingForUpdate = true
    window.location.reload()
  })

  window.addEventListener('load', async () => {
    try {
      const registration = await navigator.serviceWorker.register('/sw.js', { updateViaCache: 'none' })
      const announceUpdate = worker => {
        if (!worker || !navigator.serviceWorker.controller) return
        window.dispatchEvent(new CustomEvent('conic-update-ready', { detail: { registration } }))
      }

      announceUpdate(registration.waiting)
      registration.addEventListener('updatefound', () => {
        const installing = registration.installing
        installing?.addEventListener('statechange', () => {
          if (installing.state === 'installed') announceUpdate(registration.waiting || installing)
        })
      })

      const checkForUpdate = () => registration.update().catch(() => {})
      window.setInterval(checkForUpdate, 30 * 60 * 1000)
      document.addEventListener('visibilitychange', () => {
        if (document.visibilityState === 'visible') checkForUpdate()
      })
    } catch {
      // Studio vẫn hoạt động online nếu trình duyệt chặn Service Worker.
    }
  })
}
