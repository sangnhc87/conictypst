import JSZip from 'jszip'
import { createProjectFromTemplate } from './templates.js'

const DB_NAME = 'typst-conic-hub'
const DB_VERSION = 1
const PROJECT_STORE = 'projects'
const META_STORE = 'meta'
const ACTIVE_PROJECT_KEY = 'active-project-id'
const FALLBACK_KEY = 'typst-conic-hub.project.fallback.v1'
const MAIN_TEMPLATE_MIGRATION_KEY = 'typst-conic-hub.main-template.full-exam.v2'
const MAX_SNAPSHOTS = 12

function openDatabase() {
  return new Promise((resolve, reject) => {
    if (!('indexedDB' in window)) {
      reject(new Error('IndexedDB không khả dụng'))
      return
    }

    const request = window.indexedDB.open(DB_NAME, DB_VERSION)
    request.onupgradeneeded = () => {
      const db = request.result
      if (!db.objectStoreNames.contains(PROJECT_STORE)) {
        const store = db.createObjectStore(PROJECT_STORE, { keyPath: 'id' })
        store.createIndex('updatedAt', 'updatedAt')
      }
      if (!db.objectStoreNames.contains(META_STORE)) {
        db.createObjectStore(META_STORE)
      }
    }
    request.onsuccess = () => resolve(request.result)
    request.onerror = () => reject(request.error)
  })
}

async function withStore(storeName, mode, callback) {
  const db = await openDatabase()
  return new Promise((resolve, reject) => {
    const transaction = db.transaction(storeName, mode)
    const store = transaction.objectStore(storeName)
    let result

    try {
      result = callback(store)
    } catch (error) {
      db.close()
      reject(error)
      return
    }

    transaction.oncomplete = () => {
      db.close()
      resolve(result?.result ?? result)
    }
    transaction.onerror = () => {
      db.close()
      reject(transaction.error)
    }
  })
}

function normalizeFileRecord(value) {
  if (typeof value === 'string') return { kind: 'text', content: value }
  if (value?.kind === 'binary') {
    return {
      kind: 'binary',
      content: value.content instanceof Uint8Array ? value.content : new Uint8Array(value.content || []),
      mime: value.mime || 'application/octet-stream',
    }
  }
  return { kind: 'text', content: String(value?.content ?? '') }
}

export function normalizeProject(project) {
  const fallback = createProjectFromTemplate('full-exam')
  const source = project && typeof project === 'object' ? project : fallback
  const files = Object.fromEntries(
    Object.entries(source.files || fallback.files).map(([path, value]) => [path, normalizeFileRecord(value)]),
  )
  const textPaths = Object.keys(files).filter(path => files[path].kind === 'text')
  const entryPath = files[source.entryPath]?.kind === 'text'
    ? source.entryPath
    : textPaths[0] || '/project/main.typ'

  return {
    ...fallback,
    ...source,
    name: String(source.name || fallback.name),
    entryPath,
    files,
    snapshots: Array.isArray(source.snapshots) ? source.snapshots.slice(0, MAX_SNAPSHOTS) : [],
  }
}

export async function listProjects() {
  try {
    const projects = await withStore(PROJECT_STORE, 'readonly', store => store.getAll())
    return (projects || []).map(normalizeProject).sort((a, b) => b.updatedAt - a.updatedAt)
  } catch {
    try {
      const fallback = JSON.parse(window.localStorage.getItem(FALLBACK_KEY) || 'null')
      return fallback ? [normalizeProject(fallback)] : []
    } catch {
      return []
    }
  }
}

export async function getProject(projectId) {
  try {
    const project = await withStore(PROJECT_STORE, 'readonly', store => store.get(projectId))
    return project ? normalizeProject(project) : null
  } catch {
    const projects = await listProjects()
    return projects.find(project => project.id === projectId) || null
  }
}

export async function saveProject(project, options = {}) {
  const activate = options.activate !== false
  const normalized = normalizeProject({ ...project, updatedAt: Date.now() })
  try {
    await withStore(PROJECT_STORE, 'readwrite', store => store.put(normalized))
    if (activate) await withStore(META_STORE, 'readwrite', store => store.put(normalized.id, ACTIVE_PROJECT_KEY))
  } catch {
    if (activate) {
      window.localStorage.setItem(FALLBACK_KEY, JSON.stringify(normalized))
      window.localStorage.setItem(ACTIVE_PROJECT_KEY, normalized.id)
    }
  }
  return normalized
}

export async function deleteProject(projectId) {
  try {
    await withStore(PROJECT_STORE, 'readwrite', store => store.delete(projectId))
  } catch {
    const fallback = window.localStorage.getItem(FALLBACK_KEY)
    if (fallback) {
      const project = JSON.parse(fallback)
      if (project.id === projectId) window.localStorage.removeItem(FALLBACK_KEY)
    }
  }
}

export async function getActiveProjectId() {
  try {
    return await withStore(META_STORE, 'readonly', store => store.get(ACTIVE_PROJECT_KEY))
  } catch {
    return window.localStorage.getItem(ACTIVE_PROJECT_KEY)
  }
}

export async function bootstrapProject() {
  const activeId = await getActiveProjectId()
  const activeProject = activeId ? await getProject(activeId) : null
  let projects = await listProjects()

  // Người dùng cũ có thể vẫn đang thấy “Khởi động nhanh” do IndexedDB giữ
  // project trước lần đổi mẫu mặc định. Chỉ chuyển một lần, giữ nguyên project
  // cũ và tuyệt đối không ghi đè nội dung họ đã soạn.
  if (!window.localStorage.getItem(MAIN_TEMPLATE_MIGRATION_KEY)) {
    let fullExam = projects.find(project => project.templateId === 'full-exam')
    if (!fullExam) {
      fullExam = await saveProject(createProjectFromTemplate('full-exam'), { activate: false })
      projects = [fullExam, ...projects]
    }
    window.localStorage.setItem(MAIN_TEMPLATE_MIGRATION_KEY, 'done')

    const isLegacyQuickstart = activeProject?.templateId === 'quickstart'
      || activeProject?.name === 'Khởi động nhanh'
    if (!activeProject || isLegacyQuickstart) return saveProject(fullExam)
  }

  if (activeProject) return activeProject
  if (projects[0]) return projects[0]

  return saveProject(createProjectFromTemplate('full-exam'))
}

export function createSnapshot(project, label = 'Bản lưu thủ công') {
  const timestamp = Date.now()
  const snapshot = {
    id: `snapshot-${timestamp}`,
    label,
    createdAt: timestamp,
    entryPath: project.entryPath,
    files: structuredClone(project.files),
  }
  return {
    ...project,
    snapshots: [snapshot, ...(project.snapshots || [])].slice(0, MAX_SNAPSHOTS),
  }
}

export function restoreSnapshot(project, snapshotId) {
  const snapshot = project.snapshots?.find(item => item.id === snapshotId)
  if (!snapshot) return project
  return normalizeProject({
    ...project,
    entryPath: snapshot.entryPath,
    files: structuredClone(snapshot.files),
    updatedAt: Date.now(),
  })
}

export async function exportProjectZip(project) {
  const zip = new JSZip()
  for (const [path, file] of Object.entries(project.files)) {
    const relativePath = path.replace(/^\/project\//, '')
    zip.file(relativePath, file.kind === 'binary' ? file.content : file.content)
  }
  zip.file('.conic-project.json', JSON.stringify({
    version: 1,
    name: project.name,
    entryPath: project.entryPath.replace(/^\/project\//, ''),
    exportedAt: new Date().toISOString(),
  }, null, 2))
  return zip.generateAsync({ type: 'blob', compression: 'DEFLATE', compressionOptions: { level: 6 } })
}

export async function importProjectZip(file) {
  const zip = await JSZip.loadAsync(file)
  let manifest = null
  const manifestEntry = zip.file('.conic-project.json')
  if (manifestEntry) {
    try { manifest = JSON.parse(await manifestEntry.async('text')) } catch { manifest = null }
  }

  const files = {}
  const entries = Object.values(zip.files).filter(entry => !entry.dir && entry.name !== '.conic-project.json')
  for (const entry of entries) {
    const cleanName = entry.name.replace(/^\/+/, '')
    const path = `/project/${cleanName}`
    const isText = /\.(typ|txt|csv|json|toml|md|svg)$/i.test(cleanName)
    files[path] = isText
      ? { kind: 'text', content: await entry.async('text') }
      : { kind: 'binary', content: await entry.async('uint8array'), mime: 'application/octet-stream' }
  }

  if (Object.keys(files).length === 0) throw new Error('ZIP không có tệp dự án')
  const firstTyp = Object.keys(files).find(path => path.endsWith('.typ'))
  const requestedEntry = manifest?.entryPath ? `/project/${manifest.entryPath.replace(/^\/+/, '')}` : ''
  const project = createProjectFromTemplate('quickstart', manifest?.name || file.name.replace(/\.zip$/i, ''))
  project.files = files
  project.entryPath = files[requestedEntry]?.kind === 'text' ? requestedEntry : firstTyp || Object.keys(files)[0]
  return normalizeProject(project)
}

export function downloadBlob(blob, fileName) {
  const anchor = document.createElement('a')
  anchor.href = URL.createObjectURL(blob)
  anchor.download = fileName
  anchor.click()
  window.setTimeout(() => URL.revokeObjectURL(anchor.href), 1000)
}
