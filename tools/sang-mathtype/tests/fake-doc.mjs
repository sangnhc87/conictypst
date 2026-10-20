// Tài liệu giả trong bộ nhớ, thực thi các thao tác (label / fmt / insert / remove) đúng ngữ nghĩa mà hai cầu nối thật phải có.
// Dùng cho kiểm thử logic (không cần Word) và cho trang thử trong trình duyệt.
const occIndex = (text, needle, occ) => { let i = -1; for (let n = 0; n <= occ; n++) { i = text.indexOf(needle, i + 1); if (i < 0) return -1 } return i }

const DEFAULTS = { bold: false, italic: false, underline: false, hidden: false, color: 'auto', font: 'Calibri', size: 11, lineSpacing: 12, spaceBefore: 0, spaceAfter: 0, align: 'left' }

export function createFakeDoc(lines) {
  // mỗi đoạn: { text, props, spans: [{off,len,props}], block? }
  const doc = { paras: lines.map(text => ({ text, props: {}, spans: [] })), tables: [], sel: null, bookmarks: new Map(), nextId: 1 }
  const texts = () => doc.paras.map(p => p.text)
  const flatten = blocks => blocks.flatMap(b => b.type === 'table'
    ? b.rows.map(r => ({ text: r.join(' | '), props: {}, spans: [], table: true }))
    : [{ text: b.type === 'rule' ? '───' : b.type === 'image' ? '[ảnh]' : b.text, props: { bold: !!b.bold, italic: !!b.italic, ...(b.color ? { color: b.color } : {}), ...(b.align ? { align: b.align } : {}) }, spans: [], rule: b.type === 'rule' }])

  const host = {
    name: 'fake',
    async read(scope) {
      if (scope === 'sel') return { paras: doc.sel ? texts().slice(doc.sel[0], doc.sel[1] + 1) : [] }
      return { paras: texts() }
    },
    async readTables() {
      const rows = doc.paras.filter(p => p.table).map(p => p.text.split(' | '))
      return rows.length ? [rows] : []
    },
    async apply(ops, scope) {
      for (const o of ops.filter(x => x.t === 'remove')) {
        if (!doc.paras.some(p => p.block === o.id)) throw new Error('Không tìm thấy nội dung đã chèn để gỡ.')
        doc.paras = doc.paras.filter(p => p.block !== o.id)
      }
      const base = scope === 'sel' && doc.sel ? doc.sel[0] : 0
      const P = doc.paras.slice(base) // như Office.js: đối tượng đoạn lấy một lần, chèn / xóa sau đó không làm lệch
      const inverse = []
      let missing = 0
      for (const o of ops.filter(x => x.t === 'fmt')) {
        const p = P[o.p]
        if (!p) { missing++; continue }
        const target = o.span ? p.spans.find(s => s.off === o.span.off && s.len === o.span.len) || (p.spans.push({ off: o.span.off, len: o.span.len, props: {} }), p.spans[p.spans.length - 1]) : p
        const prior = {}
        for (const k of Object.keys(o.props)) if (target.props[k] !== undefined) prior[k] = target.props[k]
        for (const k of Object.keys(o.props)) if (!(k in prior)) prior[k] = DEFAULTS[k]
        inverse.push({ ...o, props: Object.fromEntries(Object.entries(prior).filter(([, v]) => v !== undefined)) })
        Object.assign(target.props, o.props)
      }
      for (const o of ops.filter(x => x.t === 'label')) {
        const p = P[o.p]
        const at = p ? occIndex(p.text, o.from, o.occ) : -1
        if (at < 0) { missing++; continue }
        p.text = p.text.slice(0, at) + o.to + p.text.slice(at + o.from.length)
        inverse.push({ t: 'label', p: o.p, off: o.off, from: o.to, to: o.from, occ: o.occTo ?? o.occ, occTo: o.occ })
      }
      const marks = []
      for (const o of ops.filter(x => x.t === 'insert')) {
        const at = o.where === 'end' ? doc.paras.length : o.where === 'sel' || o.where === 'selEnd' ? (doc.sel ? doc.sel[1] + 1 : doc.paras.length) : doc.paras.indexOf(P[o.where.after]) + 1
        const items = flatten(o.blocks)
        const id = `u${doc.nextId++}`
        items.forEach(it => { it.block = id })
        doc.paras.splice(at, 0, ...items)
        marks.push(id)
      }
      for (const id of marks.reverse()) inverse.push({ t: 'remove', id })
      return { inverse: inverse.reverse(), missing }
    },
  }
  return { doc, host, texts }
}
