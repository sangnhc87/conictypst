// Cầu nối Office.js (Word Online / Windows / Mac) cho thẻ Công cụ soạn. Thực thi các thao tác của plans.js và trả về thao tác ngược để hoàn tác.
import { getDocxBytes } from '../word.js'

const ALIGN = { justify: 'Justified', left: 'Left', center: 'Centered', right: 'Right' }
const ALIGN_BACK = { Justified: 'justify', Left: 'left', Centered: 'center', Right: 'right' }
const FONT_KEYS = ['font', 'size', 'bold', 'italic', 'underline', 'color', 'hidden']
const PARA_KEYS = ['align', 'lineSpacing', 'spaceBefore', 'spaceAfter']
const esc = s => String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')

const scopeParas = (ctx, scope) => (scope === 'sel' ? ctx.document.getSelection() : ctx.document.body).paragraphs

// Tải thuộc tính hiện có (để làm thao tác ngược) rồi đặt giá trị mới.
function loadNames(props, isPara) {
  const names = []
  for (const k of Object.keys(props)) {
    if (k === 'font') names.push('font/name'); else if (FONT_KEYS.includes(k)) names.push(`font/${k}`)
    else if (isPara && k === 'align') names.push('alignment'); else if (isPara && PARA_KEYS.includes(k)) names.push(k)
  }
  return names
}

function readBack(target, props, isPara) {
  const out = {}
  for (const k of Object.keys(props)) {
    if (k === 'font') out.font = target.font.name
    else if (k === 'underline') out.underline = target.font.underline !== 'None' && target.font.underline !== '' && target.font.underline != null
    else if (FONT_KEYS.includes(k)) out[k] = target.font[k]
    else if (isPara && k === 'align') out.align = ALIGN_BACK[target.alignment] || 'left'
    else if (isPara && PARA_KEYS.includes(k)) out[k] = target[k]
  }
  for (const k of Object.keys(out)) if (out[k] === null || out[k] === undefined || out[k] === '') delete out[k] // định dạng hỗn hợp: không khôi phục được
  return out
}

function setProps(target, props, isPara) {
  for (const [k, v] of Object.entries(props)) {
    if (k === 'font') target.font.name = v
    else if (k === 'size') target.font.size = v
    else if (k === 'underline') target.font.underline = v ? 'Single' : 'None'
    else if (k === 'color') target.font.color = v === 'auto' ? '#000000' : v
    else if (FONT_KEYS.includes(k)) target.font[k] = v
    else if (isPara && k === 'align') target.alignment = ALIGN[v] || 'Left'
    else if (isPara && PARA_KEYS.includes(k)) target[k] = v
  }
}

const ruleXml = () => `<pkg:package xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage"><pkg:part pkg:name="/_rels/.rels" pkg:contentType="application/vnd.openxmlformats-package.relationships+xml"><pkg:xmlData><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/></Relationships></pkg:xmlData></pkg:part><pkg:part pkg:name="/word/document.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"><pkg:xmlData><w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:body><w:p><w:pPr><w:pBdr><w:bottom w:val="single" w:sz="8" w:space="1" w:color="000000"/></w:pBdr><w:spacing w:before="0" w:after="60" w:line="120" w:lineRule="exact"/></w:pPr></w:p></w:body></w:document></pkg:xmlData></pkg:part></pkg:package>`

let seq = 0
const newId = () => `SmtU${Date.now().toString(36)}${(seq++).toString(36)}`

async function insertBlocks(ctx, anchor, blocks) {
  let cur = anchor
  let first = null
  for (const b of blocks) {
    if (b.type === 'table') {
      const rows = b.rows
      const cols = Math.max(...rows.map(r => r.length))
      const values = rows.map(r => Array.from({ length: cols }, (_, i) => String(r[i] ?? '')))
      const t = cur.insertTable(rows.length, cols, 'After', values)
      for (const loc of ['Top', 'Bottom', 'Left', 'Right', 'InsideHorizontal', 'InsideVertical']) {
        try { const bd = t.getBorder(loc); bd.type = 'Single'; bd.width = 0.5; bd.color = '#444444' } catch { /* bản Word cũ */ }
      }
      if (b.header !== false) { t.headerRowCount = 1; try { const r = t.rows.getFirst(); r.font.bold = true; r.shadingColor = '#EEF2FA' } catch { /* bỏ qua */ } }
      if (b.center) { try { t.alignment = 'Centered' } catch { /* bỏ qua */ } }
      cur = t
      first = first || t
      continue
    }
    const p = cur.insertParagraph(b.type === 'image' ? '' : b.type === 'rule' ? '' : b.text, 'After')
    if (b.type === 'rule') p.insertOoxml(ruleXml(), 'Replace')
    else if (b.type === 'image') {
      const pic = p.insertInlinePictureFromBase64(b.b64, 'Start')
      pic.lockAspectRatio = true; pic.width = b.widthPt; pic.height = b.heightPt
      if (b.alt) pic.altTextDescription = b.alt
      p.alignment = 'Left'
    } else {
      p.font.bold = !!b.bold; p.font.italic = !!b.italic; p.font.hidden = false
      p.font.color = b.color || '#000000'
      p.alignment = ALIGN[b.align] || 'Left'
      p.spaceAfter = 3
      if (b.boldPrefix) { const r = p.search(b.text.slice(0, b.boldPrefix), { matchCase: true }); r.load('items'); await ctx.sync(); if (r.items[0]) r.items[0].font.bold = true }
    }
    cur = p
    first = first || p
  }
  return { first, last: cur }
}

function anchorFor(ctx, where, P) {
  if (where === 'end') return ctx.document.body.paragraphs.getLast()
  if (where === 'sel' || where === 'selEnd') return ctx.document.getSelection().paragraphs.getLast()
  if (where && where.after != null) return P[where.after]
  throw new Error('Không biết chèn vào đâu.')
}

export function createOfficeHost() {
  return {
    name: 'office',

    async read(scope) {
      return Word.run(async ctx => {
        const paras = scopeParas(ctx, scope)
        paras.load('items/text')
        await ctx.sync()
        return { paras: paras.items.map(p => p.text) }
      })
    },

    async readTables(scope) {
      return Word.run(async ctx => {
        const tables = (scope === 'sel' ? ctx.document.getSelection() : ctx.document.body).tables
        tables.load('items/values')
        await ctx.sync()
        return tables.items.map(t => t.values)
      })
    },

    async apply(ops, scope) {
      return Word.run(async ctx => {
        const inverse = []
        const missing = []
        // 0) gỡ khối đã chèn (thao tác ngược): làm trước khi đánh chỉ số đoạn, nếu không chỉ số bị lệch
        for (const o of ops.filter(x => x.t === 'remove')) {
          const r = ctx.document.getBookmarkRangeOrNullObject(o.id)
          r.load('isNullObject')
          await ctx.sync()
          if (r.isNullObject) throw new Error('Không tìm thấy nội dung đã chèn để gỡ. Hãy dùng Ctrl+Z / Cmd+Z trong Word.')
          r.delete()
          ctx.document.deleteBookmark(o.id)
          await ctx.sync()
        }
        const paras = scopeParas(ctx, scope)
        paras.load('items')
        await ctx.sync()
        const P = paras.items

        // 1) định dạng: đọc giá trị cũ rồi mới ghi
        const fmts = []
        for (const o of ops.filter(x => x.t === 'fmt')) {
          const para = P[o.p]
          if (!para) { missing.push(o); continue }
          if (o.span) { const r = para.search(o.span.text, { matchCase: true }); r.load('items'); fmts.push({ o, r }) } else fmts.push({ o, target: para })
        }
        await ctx.sync()
        for (const f of fmts) {
          if (f.r) { f.target = f.r.items[f.o.span.occ]; if (!f.target) { missing.push(f.o); f.skip = true } }
        }
        for (const f of fmts) if (!f.skip) f.target.load(loadNames(f.o.props, !f.o.span))
        await ctx.sync()
        for (const f of fmts) {
          if (f.skip) continue
          inverse.push({ ...f.o, props: readBack(f.target, f.o.props, !f.o.span) })
          setProps(f.target, f.o.props, !f.o.span)
        }
        await ctx.sync().catch(e => { throw new Error(/hidden/i.test(String(e.message)) ? 'Phiên bản Word này chưa hỗ trợ ẩn / hiện chữ qua add-in.' : e.message) })

        // 2) đổi nhãn (Câu n, A. B. C. D.)
        const labels = []
        for (const o of ops.filter(x => x.t === 'label')) {
          const para = P[o.p]
          if (!para) { missing.push(o); continue }
          const r = para.search(o.from, { matchCase: true })
          r.load('items')
          labels.push({ o, r })
        }
        await ctx.sync()
        for (const { o, r } of labels) {
          const hit = r.items[o.occ]
          if (!hit) { missing.push(o); continue }
          hit.insertText(o.to, 'Replace')
          inverse.push({ t: 'label', p: o.p, off: o.off, from: o.to, to: o.from, occ: o.occTo ?? o.occ, occTo: o.occ })
        }
        await ctx.sync()

        // 3) chèn khối mới (bảng, đoạn, ảnh, dòng kẻ) và đánh dấu để gỡ lại
        const marks = []
        for (const o of ops.filter(x => x.t === 'insert')) {
          const { first, last } = await insertBlocks(ctx, anchorFor(ctx, o.where, P), o.blocks)
          const name = newId()
          first.getRange('Start').expandTo(last.getRange('End')).insertBookmark(name)
          marks.push(name)
          await ctx.sync()
        }
        for (const name of marks.reverse()) inverse.push({ t: 'remove', id: name })

        return { inverse: inverse.reverse(), missing: missing.length }
      })
    },

    docBytes: getDocxBytes,
  }
}
