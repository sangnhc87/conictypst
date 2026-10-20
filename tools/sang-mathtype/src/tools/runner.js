// Bộ điều phối: đọc đoạn văn → lập thao tác → thực thi → giữ ngăn xếp hoàn tác. Cầu nối (host) là Office.js hoặc AppleScript.
// host: { read(scope) -> {paras:[text]}, apply(ops, scope) -> {inverse:[ops]}, readTables(scope), docPath?() }

/** Hai bảng liền nhau sẽ bị Word gộp thành một: chèn đoạn trống ngăn cách. */
export function spaceTables(blocks) {
  const out = []
  for (const b of blocks) {
    if (b.type === 'table' && out.length && out[out.length - 1].type === 'table') out.push({ type: 'para', text: '' })
    out.push(b)
  }
  return out
}

export const prepare = ops => ops.map(o => (o.t === 'insert' ? { ...o, blocks: spaceTables(o.blocks) } : o))

export function createRunner(host, { limit = 20 } = {}) {
  const stack = []
  const listeners = new Set()
  const notify = () => listeners.forEach(f => f(stack.length))
  return {
    onChange: f => { listeners.add(f) },
    depth: () => stack.length,
    /** build(paras) -> ops | {ops, ...extra}. Trả về { count, ...extra }. */
    async run(label, scope, build, { read = true } = {}) {
      const { paras } = read ? await host.read(scope) : { paras: [] }
      const built = await build(paras)
      const ops = prepare(Array.isArray(built) ? built : built.ops)
      if (!ops.length) return { count: 0, ...(Array.isArray(built) ? {} : built), ops: [] }
      const { inverse } = await host.apply(ops, scope)
      stack.push({ label, scope, inverse })
      if (stack.length > limit) stack.shift()
      notify()
      return { count: ops.length, ...(Array.isArray(built) ? {} : built), ops }
    },
    async undo() {
      const last = stack.pop()
      if (!last) throw new Error('Không còn thao tác nào để hoàn tác.')
      notify()
      try { await host.apply(last.inverse, last.scope) } catch (e) { stack.push(last); notify(); throw e }
      return last.label
    },
    peek: () => (stack.length ? stack[stack.length - 1].label : null),
  }
}
