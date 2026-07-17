const TEXT_EXTENSIONS = new Set(['typ', 'txt', 'csv', 'json', 'toml', 'md', 'svg'])
const IGNORED_SEGMENTS = new Set(['.git', 'node_modules', 'dist', 'dist-hub', 'conic-exam-build'])

function cleanRelativePath(value) {
  return String(value || '')
    .replaceAll('\\', '/')
    .split('/')
    .filter(segment => segment && segment !== '.' && !IGNORED_SEGMENTS.has(segment))
    .join('/')
}

function extension(name) {
  const match = String(name).toLowerCase().match(/\.([a-z0-9]+)$/)
  return match?.[1] || ''
}

export async function filesToTypstProject(fileList) {
  const selected = [...(fileList || [])]
  if (!selected.length) throw new Error('Chưa chọn tệp Typst.')
  const files = {}
  for (const file of selected) {
    const relative = cleanRelativePath(file.webkitRelativePath || file.name)
    if (!relative || relative.split('/').some(segment => IGNORED_SEGMENTS.has(segment))) continue
    if (file.size > 20 * 1024 * 1024) throw new Error(`Tệp ${relative} vượt quá 20 MiB.`)
    const path = `/project/${relative}`
    if (files[path]) throw new Error(`Trùng đường dẫn ${relative}.`)
    files[path] = TEXT_EXTENSIONS.has(extension(relative))
      ? { kind: 'text', content: await file.text() }
      : { kind: 'binary', content: new Uint8Array(await file.arrayBuffer()), mime: file.type || 'application/octet-stream' }
  }
  if (!Object.keys(files).length) throw new Error('Thư mục không có tệp hợp lệ.')
  const entryPath = detectTypstEntry(files)
  return { files, entryPath, name: entryPath.split('/').pop().replace(/\.typ$/i, '') }
}

export function detectTypstEntry(files) {
  const typFiles = Object.entries(files || {})
    .filter(([path, file]) => file?.kind === 'text' && path.toLowerCase().endsWith('.typ'))
  if (!typFiles.length) throw new Error('Không tìm thấy file .typ trong dữ liệu đã chọn.')
  if (typFiles.length === 1) return typFiles[0][0]

  const score = ([path, file]) => {
    const name = path.split('/').pop().toLowerCase()
    const source = String(file.content || '')
    let value = 0
    if (name === 'main.typ') value += 100
    if (/^de[-_]|^exam|^đề/u.test(name)) value += 35
    if (/CONICTYPST:QUESTIONS:START/u.test(source)) value += 80
    if (/#let\s+make-questions\s*\(/u.test(source)) value += 70
    if (/#(?:tn|ds|tln|tl)\s*\(/u.test(source)) value += 25
    if (/(?:sang-exam|math-sym|lib)\.typ$/u.test(name)) value -= 90
    value -= path.split('/').length
    return value
  }
  return [...typFiles].sort((left, right) => score(right) - score(left) || left[0].localeCompare(right[0]))[0][0]
}

export function typstFileTree(files) {
  const root = { name: 'Dự án', path: '/project', kind: 'folder', children: [] }
  for (const path of Object.keys(files || {}).sort()) {
    const segments = path.replace(/^\/project\/?/, '').split('/').filter(Boolean)
    let parent = root
    segments.forEach((name, index) => {
      const isFile = index === segments.length - 1
      let child = parent.children.find(item => item.name === name)
      if (!child) {
        child = {
          name,
          path: `/project/${segments.slice(0, index + 1).join('/')}`,
          kind: isFile ? 'file' : 'folder',
          children: isFile ? undefined : [],
        }
        parent.children.push(child)
      }
      if (!isFile) parent = child
    })
  }
  const sort = node => {
    node.children?.sort((a, b) => a.kind === b.kind ? a.name.localeCompare(b.name) : a.kind === 'folder' ? -1 : 1)
    node.children?.forEach(sort)
    return node
  }
  return sort(root)
}

export function listTypstEntries(files) {
  return Object.keys(files || {}).filter(path => path.toLowerCase().endsWith('.typ')).sort()
}
