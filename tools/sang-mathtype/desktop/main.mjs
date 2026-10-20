// App desktop Sang Math: cửa sổ nổi bên cạnh Word + icon ở thanh menu macOS + phím tắt, chèn / sửa công thức thẳng trong Word Mac.
import { app, BrowserWindow, ipcMain, Menu, Tray, nativeImage, globalShortcut, dialog, shell } from 'electron'
import http from 'node:http'
import https from 'node:https'
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { insertFormula, readSelectionAlt, listFormulas, replaceMany, watchSelection, toolsRead, toolsApply, toolsTables, activeDocPath } from './word-applescript.mjs'
import * as exam from './exam.mjs'

const here = path.dirname(fileURLToPath(import.meta.url))
const dist = path.resolve(here, '../dist')
const types = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript', '.css': 'text/css', '.wasm': 'application/wasm', '.otf': 'font/otf', '.typ': 'text/plain; charset=utf-8', '.toml': 'text/plain', '.png': 'image/png' }

// Trả file tĩnh từ dist; /show (chỉ trên cổng HTTPS của add-in) đưa cửa sổ app lên.
function handler(req, res) {
  let rel = decodeURIComponent(new URL(req.url, 'http://x').pathname)
  if (rel === '/show') { showWindow(); res.writeHead(200, { 'content-type': 'text/plain' }).end('ok'); return }
  if (rel.endsWith('/')) rel += 'taskpane.html'
  const file = path.join(dist, path.normalize(rel))
  if (!file.startsWith(dist) || !fs.existsSync(file) || fs.statSync(file).isDirectory()) { res.writeHead(404).end(); return }
  res.writeHead(200, { 'content-type': types[path.extname(file)] || 'application/octet-stream', 'cache-control': 'no-cache' })
  fs.createReadStream(file).pipe(res)
}

// Máy chủ nội bộ trên 127.0.0.1: trang cần fetch() WASM và font, việc mà file:// không cho.
function serve() {
  return new Promise(resolve => {
    const server = http.createServer(handler)
    server.listen(0, '127.0.0.1', () => resolve(server.address().port))
  })
}

// Cổng HTTPS 3155 cho nút trên thanh menu Word (add-in bắt buộc HTTPS): nút gọi /show để mở app.
// Cần chứng chỉ localhost đã được tin cậy (xem README); thiếu hoặc cổng bận thì bỏ qua, app vẫn chạy bình thường.
function serveAddin() {
  const dir = [path.join(here, 'certs'), path.resolve(here, '../certs')].find(d => fs.existsSync(path.join(d, 'localhost.pem')))
  if (!dir) return
  try {
    const server = https.createServer({ cert: fs.readFileSync(path.join(dir, 'localhost.pem')), key: fs.readFileSync(path.join(dir, 'localhost-key.pem')) }, handler)
    server.on('error', err => console.error('Cổng 3155 không dùng được:', err.code))
    server.listen(3155, '127.0.0.1')
  } catch (err) { console.error('Không bật được HTTPS cho add-in:', err.message) }
}

ipcMain.handle('word:insert', (_e, payload) => insertFormula(payload, false))
ipcMain.handle('word:replace', (_e, payload) => insertFormula(payload, true))
ipcMain.handle('word:read', (_e, near) => readSelectionAlt(!!near))
ipcMain.handle('word:list', (_e, scope) => listFormulas(scope))
ipcMain.handle('word:many', (_e, items) => replaceMany(items))

// Công cụ soạn: đọc / sửa đề trong tài liệu Word đang mở
ipcMain.handle('tools:read', (_e, scope) => toolsRead(scope))
ipcMain.handle('tools:apply', (_e, ops, layout) => toolsApply(ops, layout))
ipcMain.handle('tools:tables', (_e, scope) => toolsTables(scope))
ipcMain.handle('tools:docpath', () => activeDocPath())

// Đề thi: trộn đề, làm đẹp bằng bộ máy Python, thư viện đề và cài đặt nhớ sẵn
ipcMain.handle('exam:env', () => exam.env())
ipcMain.handle('exam:pick', async () => {
  const r = await dialog.showOpenDialog(win, { title: 'Chọn đề thi (.docx)', filters: [{ name: 'Word', extensions: ['docx'] }], properties: ['openFile'] })
  return r.canceled ? null : r.filePaths[0]
})
ipcMain.handle('exam:pickDir', async () => {
  const r = await dialog.showOpenDialog(win, { title: 'Chọn thư mục lưu kết quả', properties: ['openDirectory', 'createDirectory'] })
  return r.canceled ? null : r.filePaths[0]
})
ipcMain.handle('exam:analyze', (_e, file) => exam.analyze(file))
ipcMain.handle('exam:run', (_e, req) => exam.runAction(req))
ipcMain.handle('exam:history', () => exam.history())
ipcMain.handle('exam:settings:get', () => exam.getSettings())
ipcMain.handle('exam:settings:set', (_e, next) => exam.setSettings(next))
ipcMain.handle('exam:reveal', (_e, p) => { shell.showItemInFolder(p) })
ipcMain.handle('exam:open', (_e, p) => shell.openPath(p)) // mở bằng Word

let win = null
let tray = null
let quitting = false
let stopWatching = () => {}

const showWindow = () => { if (win) { win.show(); win.focus() } }

// Phím tắt toàn hệ thống: lấy công thức đang chọn trong Word, đưa vào bảng soạn.
async function editSelected() {
  const alt = await readSelectionAlt(true)
  showWindow()
  win.webContents.send('word:selected', alt)
}

app.setName('Sang Math')
app.whenReady().then(async () => {
  if (!fs.existsSync(path.join(dist, 'taskpane.html'))) {
    console.error('Chưa dựng add-in: chạy `node tools/sang-mathtype/build.mjs` trước.')
    app.quit()
    return
  }
  const port = await serve()
  serveAddin()
  Menu.setApplicationMenu(Menu.buildFromTemplate([
    { label: 'Sang Math', submenu: [{ role: 'about' }, { type: 'separator' }, { role: 'hide' }, { role: 'quit' }] },
    { label: 'Sửa', submenu: [{ role: 'undo' }, { role: 'redo' }, { type: 'separator' }, { role: 'cut' }, { role: 'copy' }, { role: 'paste' }, { role: 'selectAll' }] },
  ]))
  win = new BrowserWindow({
    width: 1060, height: 700, minWidth: 820, minHeight: 540, title: 'Sang Math',
    alwaysOnTop: true, // nổi trên Word để vừa gõ vừa nhìn tài liệu
    webPreferences: { preload: path.join(here, 'preload.cjs'), contextIsolation: true, nodeIntegration: false },
  })
  // Đóng cửa sổ chỉ ẩn đi, app vẫn nằm ở thanh menu (như MathType chạy nền); thoát thật bằng menu hoặc Cmd+Q.
  win.on('close', e => { if (!quitting) { e.preventDefault(); win.hide() } })
  stopWatching = watchSelection(alt => win.webContents.send('word:selection', alt)) // bấm vào công thức nào trong Word cũng tự nạp
  exam.warm() // nạp sẵn Python và openpyxl từ lúc mở app để lần trộn đầu không phải chờ
  console.log(`Sang Math: http://127.0.0.1:${port}/taskpane.html`)
  win.loadURL(`http://127.0.0.1:${port}/taskpane.html`)

  const icon = nativeImage.createFromPath(path.join(here, 'assets/trayTemplate.png'))
  icon.setTemplateImage(true)
  tray = new Tray(icon)
  tray.setToolTip('Sang Math: công thức cho Word')
  tray.setContextMenu(Menu.buildFromTemplate([
    { label: 'Mở Sang Math', click: showWindow },
    { label: 'Sửa công thức đang chọn trong Word', accelerator: 'CommandOrControl+Shift+E', click: editSelected },
    { label: 'Tự mở khi bật máy', type: 'checkbox', checked: app.getLoginItemSettings().openAtLogin, click: item => app.setLoginItemSettings({ openAtLogin: item.checked }) },
    { label: 'Luôn nổi trên Word', type: 'checkbox', checked: true, click: item => win.setAlwaysOnTop(item.checked) },
    { type: 'separator' },
    { label: 'Thoát Sang Math', accelerator: 'CommandOrControl+Q', click: () => app.quit() },
  ]))
  tray.on('click', () => (win.isVisible() && win.isFocused() ? win.hide() : showWindow()))

  globalShortcut.register('CommandOrControl+Shift+E', editSelected)
  globalShortcut.register('CommandOrControl+Shift+M', () => (win.isVisible() && win.isFocused() ? win.hide() : showWindow()))
})

app.on('before-quit', () => { quitting = true })
app.on('will-quit', () => { stopWatching(); exam.stop(); globalShortcut.unregisterAll() })
app.on('activate', showWindow)
