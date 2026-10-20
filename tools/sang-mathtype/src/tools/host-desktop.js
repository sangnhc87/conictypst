// Cầu nối app Mac cho thẻ Công cụ soạn: gọi AppleScript qua window.wordBridge (xem desktop/word-tools.mjs).
export function createDesktopHost() {
  const wb = () => window.wordBridge
  const layouts = new Map() // phạm vi → bố cục lần đọc gần nhất (vị trí ký tự tuyệt đối)
  return {
    name: 'desktop',
    async read(scope) {
      const r = await wb().toolsRead(scope)
      layouts.set(scope, r.layout)
      return { paras: r.paras }
    },
    async apply(ops, scope) {
      const layout = layouts.get(scope) || { starts: [], ends: [] } // chèn tại con trỏ / cuối tài liệu không cần vị trí đoạn
      return wb().toolsApply(ops, layout)
    },
    readTables: scope => wb().toolsTables(scope),
    async docPath() { const p = await wb().docPath(); return p && p.includes('/') ? p : '' },
  }
}
