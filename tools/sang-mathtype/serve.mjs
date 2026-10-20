// Máy chủ tĩnh cho add-in. Office bắt buộc HTTPS: có certs/localhost.pem + localhost-key.pem thì chạy HTTPS (cổng 3155),
// không có thì chạy HTTP để thử trong trình duyệt.
import http from 'node:http'
import https from 'node:https'
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const here = path.dirname(fileURLToPath(import.meta.url))
const dist = path.join(here, 'dist')
const port = Number(process.env.PORT || 3155)
const types = { '.svg': 'image/svg+xml', '.html': 'text/html; charset=utf-8', '.js': 'text/javascript', '.css': 'text/css', '.wasm': 'application/wasm', '.otf': 'font/otf', '.typ': 'text/plain; charset=utf-8', '.toml': 'text/plain', '.xml': 'application/xml', '.png': 'image/png', '.json': 'application/json' }

const arg = name => process.argv.find(a => a.startsWith(`--${name}`))?.split('=')[1] ?? (process.argv.includes(`--${name}`) ? true : undefined)
const saveDir = arg('save') || process.env.SM_SAVE_DIR // chỉ dùng khi kiểm thử: cho phép trang ghi kết quả ra thư mục này
const handler = (req, res) => {
  if (saveDir && req.method === 'POST' && req.url.startsWith('/__save/')) {
    const name = path.basename(decodeURIComponent(req.url.slice(8)))
    const chunks = []
    req.on('data', c => chunks.push(c))
    req.on('end', () => { fs.writeFileSync(path.join(saveDir, name), Buffer.concat(chunks)); res.writeHead(204).end() })
    return
  }
  const url = new URL(req.url, 'http://x')
  let rel = decodeURIComponent(url.pathname)
  if (rel.endsWith('/')) rel += 'taskpane.html'
  const file = path.join(dist, path.normalize(rel))
  if (!file.startsWith(dist) || !fs.existsSync(file) || fs.statSync(file).isDirectory()) { res.writeHead(404).end('Không thấy'); return }
  res.writeHead(200, { 'content-type': types[path.extname(file)] || 'application/octet-stream', 'cache-control': 'no-cache' })
  fs.createReadStream(file).pipe(res)
}

const cert = path.join(here, 'certs/localhost.pem')
const key = path.join(here, 'certs/localhost-key.pem')
const secure = !arg('http') && fs.existsSync(cert) && fs.existsSync(key)
const server = secure ? https.createServer({ cert: fs.readFileSync(cert), key: fs.readFileSync(key) }, handler) : http.createServer(handler)
server.listen(port, () => console.log(`${secure ? 'https' : 'http'}://localhost:${port}/ (thư mục ${dist})`))
