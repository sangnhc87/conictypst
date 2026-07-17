import { spawn } from 'node:child_process'

export async function runProcess(command, args, {
  cwd,
  input = '',
  timeoutMs = 120000,
  maxOutputBytes = 64 * 1024 * 1024,
} = {}) {
  return await new Promise((resolve, reject) => {
    const child = spawn(command, args, {
      cwd,
      stdio: ['pipe', 'pipe', 'pipe'],
      env: { ...process.env },
    })
    const stdout = []
    const stderr = []
    let stdoutBytes = 0
    let stderrBytes = 0
    let settled = false
    const timer = setTimeout(() => {
      if (settled) return
      child.kill('SIGKILL')
      settled = true
      reject(new Error(`Lệnh ${command} quá thời gian ${timeoutMs} ms.`))
    }, timeoutMs)

    const collect = (chunks, limitName) => chunk => {
      const next = limitName === 'stdout' ? stdoutBytes + chunk.length : stderrBytes + chunk.length
      if (next > maxOutputBytes) {
        child.kill('SIGKILL')
        if (!settled) {
          settled = true
          clearTimeout(timer)
          reject(new Error(`Kết quả ${limitName} vượt quá ${maxOutputBytes} byte.`))
        }
        return
      }
      if (limitName === 'stdout') stdoutBytes = next
      else stderrBytes = next
      chunks.push(chunk)
    }
    child.stdout.on('data', collect(stdout, 'stdout'))
    child.stderr.on('data', collect(stderr, 'stderr'))
    child.on('error', error => {
      if (settled) return
      settled = true
      clearTimeout(timer)
      reject(error)
    })
    child.on('close', code => {
      if (settled) return
      settled = true
      clearTimeout(timer)
      const out = Buffer.concat(stdout).toString('utf8')
      const err = Buffer.concat(stderr).toString('utf8')
      if (code !== 0) {
        reject(new Error(`${command} ${args[0] || ''} thất bại (${code}).\n${err || out}`.trim()))
      } else {
        resolve({ stdout: out, stderr: err })
      }
    })
    child.stdin.end(input)
  })
}
