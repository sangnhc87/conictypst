// Tự cập nhật: sau mỗi lần deploy, add-in đang mở nhận ra bản mới (so version.json) và tải lại trang.
// Add-in là trang web nên Word luôn nạp bản mới nhất từ máy chủ; module này lo phần phiên làm việc đang mở sẵn.
/* global __BUILD_ID__ */
const mine = typeof __BUILD_ID__ === 'string' ? __BUILD_ID__ : ''
let busy = false

async function latest() {
  try {
    const r = await fetch(`version.json?t=${Date.now()}`, { cache: 'no-store' })
    return r.ok ? (await r.json()).v : null
  } catch { return null }
}

function banner() {
  if (document.getElementById('updBar')) return
  const b = document.createElement('div')
  b.id = 'updBar'
  b.className = 'upd'
  b.innerHTML = '<span>Có bản Sang Math mới.</span> <button type="button">Cập nhật ngay</button>'
  b.querySelector('button').addEventListener('click', () => location.reload())
  document.body.prepend(b)
}

async function check() {
  if (busy || !mine) return
  busy = true
  const v = await latest()
  busy = false
  if (v && v !== mine) banner()
}

export function initUpdater() {
  const tag = document.createElement('span')
  tag.className = 'ver'
  tag.textContent = mine ? `bản ${mine.slice(2, 8)}.${mine.slice(8, 12)}` : ''
  document.querySelector('.about')?.append(' · ', tag)
  setTimeout(check, 4000)
  setInterval(check, 10 * 60 * 1000)
  document.addEventListener('visibilitychange', () => { if (!document.hidden) check() })
}
