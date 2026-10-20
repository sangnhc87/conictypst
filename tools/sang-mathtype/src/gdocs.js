// Cầu nối khi trang chạy trong khung bên phải của Google Docs (iframe trong Sidebar.html của add-on Apps Script):
// gửi ảnh qua postMessage, Apps Script chèn vào tài liệu; vùng chọn trong Docs được đẩy ngược lại.
import { encodeMeta, decodeMeta } from './word.js'

// Ô "đánh số" dùng lại làm tùy chọn đặt công thức riêng một dòng, căn giữa
export const supportsNumbering = true
export const numberingLabel = 'Riêng một dòng, căn giữa'

let nextId = 1
let current = null
let handler = null
const pending = new Map()

window.addEventListener('message', event => {
  if (event.source !== window.parent) return
  const m = event.data || {}
  if (m.type === 'sm:ack') {
    const p = pending.get(m.id)
    if (!p) return
    pending.delete(m.id)
    if (m.ok) p.resolve(); else p.reject(new Error(m.error || 'Google Docs báo lỗi.'))
  } else if (m.type === 'sm:selection') {
    current = decodeMeta(m.alt)
    handler?.(current)
  }
})

function call(type, payload) {
  return new Promise((resolve, reject) => {
    const id = nextId++
    pending.set(id, { resolve, reject })
    window.parent.postMessage({ type, id, ...payload }, '*')
    setTimeout(() => { if (pending.delete(id)) reject(new Error('Google Docs không trả lời. Hãy đóng và mở lại khung Sang Math.')) }, 30000)
  })
}

const serialize = ({ image, meta, numbered }) => ({ png: image.png, alt: encodeMeta(meta), widthPt: image.widthPt, heightPt: image.heightPt, block: !!numbered })

export const insertFormula = p => call('sm:insert', serialize(p))
export const replaceSelectedFormula = p => call('sm:replace', serialize(p))
export const readSelectedFormula = async () => current

export function onSelectionChanged(h) {
  handler = h
  window.parent.postMessage({ type: 'sm:ready' }, '*')
}
