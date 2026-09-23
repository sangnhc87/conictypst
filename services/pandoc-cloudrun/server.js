/**
 * server.js - Native Pandoc Service (Zero-dependency)
 * Chạy được cả cục bộ trên máy tính (localhost:8080) lẫn trên Google Cloud Run
 */

import http from 'node:http'
import { execFile } from 'node:child_process'
import fs from 'node:fs/promises'
import path from 'node:path'
import os from 'node:os'
import { promisify } from 'node:util'

const execFileAsync = promisify(execFile)
const port = process.env.PORT || 8080

const server = http.createServer(async (req, res) => {
  // CORS Headers cho phép tất cả nguồn gọi API
  res.setHeader('Access-Control-Allow-Origin', '*')
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With')

  if (req.method === 'OPTIONS') {
    res.writeHead(204)
    return res.end()
  }

  const url = new URL(req.url, `http://${req.headers.host || 'localhost'}`)

  // Health check endpoint
  if (req.method === 'GET' && url.pathname === '/health') {
    try {
      const { stdout } = await execFileAsync('pandoc', ['--version'])
      const versionLine = stdout.split('\n')[0] || 'Unknown'
      res.writeHead(200, { 'Content-Type': 'application/json' })
      return res.end(JSON.stringify({
        status: 'ok',
        service: 'pandoc-native-service',
        pandocVersion: versionLine,
        timestamp: new Date().toISOString()
      }))
    } catch (err) {
      res.writeHead(500, { 'Content-Type': 'application/json' })
      return res.end(JSON.stringify({
        status: 'error',
        message: 'Pandoc binary không tìm thấy hoặc bị lỗi',
        error: err.message
      }))
    }
  }

  // Convert endpoint
  if (req.method === 'POST' && url.pathname === '/convert') {
    const bodyChunks = []
    req.on('data', chunk => bodyChunks.push(chunk))
    req.on('end', async () => {
      let tempDir = null
      try {
        const bodyStr = Buffer.concat(bodyChunks).toString('utf8')
        const { typstCode, images = {}, format = 'docx' } = JSON.parse(bodyStr)

        if (!typstCode || typeof typstCode !== 'string') {
          res.writeHead(400, { 'Content-Type': 'application/json' })
          return res.end(JSON.stringify({ error: 'typstCode là bắt buộc.' }))
        }

        tempDir = await fs.mkdtemp(path.join(os.tmpdir(), 'conic-pandoc-'))
        const inputPath = path.join(tempDir, 'input.typ')
        const outputPath = path.join(tempDir, `output.${format}`)

        await fs.writeFile(inputPath, typstCode, 'utf8')

        // Ghi các file ảnh đính kèm
        for (const [fileName, base64Data] of Object.entries(images)) {
          if (typeof base64Data === 'string') {
            const cleanBase64 = base64Data.replace(/^data:image\/\w+;base64,/, '')
            const buffer = Buffer.from(cleanBase64, 'base64')
            await fs.writeFile(path.join(tempDir, path.basename(fileName)), buffer)
          }
        }

        // Chạy native Pandoc 3.x
        const args = [inputPath, '-f', 'typst', '-t', 'docx', '-o', outputPath]
        await execFileAsync('pandoc', args, {
          cwd: tempDir,
          timeout: 30000
        })

        const docxBuffer = await fs.readFile(outputPath)

        res.writeHead(200, {
          'Content-Type': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
          'Content-Disposition': `attachment; filename="conic-math.${format}"`,
          'Content-Length': docxBuffer.length
        })
        return res.end(docxBuffer)
      } catch (error) {
        console.error('Lỗi chuyển đổi Pandoc:', error)
        res.writeHead(500, { 'Content-Type': 'application/json' })
        return res.end(JSON.stringify({
          error: 'Không thể chuyển đổi tài liệu sang Word',
          details: error.stderr || error.message
        }))
      } finally {
        if (tempDir) {
          try { await fs.rm(tempDir, { recursive: true, force: true }) } catch {}
        }
      }
    })
    return
  }

  res.writeHead(404, { 'Content-Type': 'application/json' })
  res.end(JSON.stringify({ error: 'Not found' }))
})

server.listen(port, () => {
  console.log(`Native Pandoc Service đang chạy trên cổng ${port}`)
})
