// Cầu nối khi chạy trong app desktop (Electron): preload gắn window.wordBridge, điều khiển Word bằng AppleScript.
import { encodeMeta, decodeMeta } from './word.js'

const wb = () => window.wordBridge
export const supportsNumbering = false
export const supportsBulk = true
export const supportsGrab = true

export const serialize = ({ image, meta, format }) => ({
  payload: {
    png: image.png, svg: image.svg, descentPt: image.descentPt, alt: encodeMeta(meta), format,
  },
})

export const insertFormula = p => wb().insert(serialize(p).payload)
export const replaceSelectedFormula = p => wb().replace(serialize(p).payload)
export const readSelection = () => wb().readSelection(true) // chọn luôn công thức sát con trỏ nếu chưa chọn hình
export async function readSelectedFormula() { return decodeMeta(await wb().readSelection()) }
export const listFormulas = scope => wb().list(scope)
export const replaceMany = items => wb().many(items)
export const onSelected = cb => wb().onSelected(cb)

// Tiến trình nền trong app theo dõi vùng chọn của Word và đẩy sự kiện sang đây: bấm vào công thức nào cũng nạp ngay.
export function onSelectionChanged(handler) {
  wb().onSelection(alt => handler(decodeMeta(alt)))
}
