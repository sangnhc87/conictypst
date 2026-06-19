/**
 * FileBrowser.jsx — Duyệt thư mục typst/ trực tiếp trên conictypst.pages.dev
 * Hiển thị cây thư mục sach/ và exams/, click để mở vào Editor WASM.
 */
import React, { useMemo, useState } from 'react'
import { initialWorkspaceFiles } from './typstWorkspace.js'
import './FileBrowser.css'

// ── Helpers ──────────────────────────────────────────────────────────────────

function getFileSize(content) {
  const bytes = new TextEncoder().encode(content).length
  if (bytes < 1024) return `${bytes} B`
  if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`
}

function buildTree(filePaths) {
  const root = { name: 'typst', path: '/typst', type: 'folder', children: [], fileCount: 0 }

  for (const filePath of filePaths) {
    const stripped = filePath.replace(/^\/typst\//, '')
    const parts = stripped.split('/')
    let current = root

    for (let i = 0; i < parts.length; i++) {
      const part = parts[i]
      const isFile = i === parts.length - 1
      const path = '/typst/' + parts.slice(0, i + 1).join('/')

      if (isFile) {
        current.children.push({ name: part, path, type: 'file', filePath })
        current.fileCount++
      } else {
        let existing = current.children.find(c => c.name === part && c.type === 'folder')
        if (!existing) {
          existing = { name: part, path, type: 'folder', children: [], fileCount: 0 }
          current.children.push(existing)
        }
        existing.fileCount++
        current = existing
      }
    }
  }

  // Sort: folders first, then files alphabetically
  function sortNode(node) {
    node.children.sort((a, b) => {
      if (a.type !== b.type) return a.type === 'folder' ? -1 : 1
      return a.name.localeCompare(b.name, 'vi')
    })
    node.children.forEach(child => { if (child.type === 'folder') sortNode(child) })
  }
  sortNode(root)

  return root
}

function getFolderIcon(name) {
  const icons = {
    'sach': '📚',
    'exams': '📝',
    'modules': '⚙️',
    'ham-so-chuong1': '📐',
    'tich-phan-ung-dung': '∫',
    'oxyz-chien-thuat': '🎯',
    'ung-dung-dao-ham': '📉',
    'thong-ke-chuong3': '📊',
    'vecto-3d-chuong2': '🧭',
    'hinh-hoc-phang-chuong5': '📏',
    'hinh-hoc-khong-gian-chuong6': '🔷',
    'nguyen-ham-tich-phan-chuong3': '∫',
    'to-hop-xac-suat-chuong2': '🎲',
    'to-hop-xac-suat': '🎲',
    'thong-ke': '📊',
    'De-Cac-So': '📋',
  }
  return icons[name] || '📁'
}

function getFileIcon(name) {
  if (name === '_config.typ') return '⚙️'
  if (name === '_shared-config.typ') return '🔧'
  if (name.startsWith('main')) return '🚀'
  if (name.startsWith('hdsd')) return '📖'
  if (name.startsWith('CD-')) return '📝'
  if (name.startsWith('de-') || name.startsWith('De-')) return '📋'
  if (name.startsWith('c1-') || name.startsWith('c2-') || name.startsWith('c3-')) return '📄'
  if (name.includes('beamer')) return '🎞️'
  if (name.includes('bbt')) return '📊'
  if (name.startsWith('sang-')) return '⚡'
  return '📄'
}

function getFileTag(name) {
  if (name === '_config.typ' || name === '_shared-config.typ') return { label: 'config', color: '#7c3aed' }
  if (name.startsWith('main')) return { label: 'entry', color: '#059669' }
  if (name.startsWith('hdsd')) return { label: 'docs', color: '#0284c7' }
  if (name.startsWith('CD-')) return { label: 'CD', color: '#d97706' }
  if (name.startsWith('de-') || name.startsWith('De-')) return { label: 'đề', color: '#dc2626' }
  if (name.startsWith('sang-')) return { label: 'engine', color: '#6d28d9' }
  return null
}

// Priority folders to pin at top
const PINNED_FOLDERS = ['sach', 'exams', 'modules']

// ── Components ───────────────────────────────────────────────────────────────

function FileRow({ node, depth, workspaceFiles, onOpenInEditor, searchQuery }) {
  const tag = getFileTag(node.name)
  const size = workspaceFiles[node.filePath] ? getFileSize(workspaceFiles[node.filePath]) : ''
  const isMatch = searchQuery && node.name.toLowerCase().includes(searchQuery.toLowerCase())

  return (
    <button
      type="button"
      className={`fb-file-row ${isMatch ? 'fb-file-row--match' : ''}`}
      style={{ paddingLeft: `${16 + depth * 16}px` }}
      onClick={() => onOpenInEditor(node.filePath, workspaceFiles[node.filePath] || '')}
      title={`Mở ${node.name} trong Editor WASM`}
    >
      <span className="fb-file-icon">{getFileIcon(node.name)}</span>
      <span className="fb-file-name">{node.name}</span>
      {tag && (
        <span className="fb-file-tag" style={{ background: tag.color + '22', color: tag.color, borderColor: tag.color + '44' }}>
          {tag.label}
        </span>
      )}
      <span className="fb-file-size">{size}</span>
      <span className="fb-open-btn">→ Editor</span>
    </button>
  )
}

function FolderNode({ node, depth, workspaceFiles, onOpenInEditor, searchQuery, defaultExpand }) {
  const [expanded, setExpanded] = useState(
    defaultExpand || depth === 0 || PINNED_FOLDERS.includes(node.name)
  )

  const hasMatch = searchQuery && (
    node.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    node.children.some(c => c.name.toLowerCase().includes(searchQuery.toLowerCase()))
  )

  // Auto-expand when searching
  const isExpanded = searchQuery ? true : expanded

  return (
    <div className={`fb-folder-group ${hasMatch ? 'fb-folder-group--match' : ''}`}>
      <button
        type="button"
        className="fb-folder-row"
        style={{ paddingLeft: `${16 + depth * 16}px` }}
        onClick={() => setExpanded(e => !e)}
      >
        <span className="fb-folder-caret">{isExpanded ? '▾' : '▸'}</span>
        <span className="fb-folder-icon">{getFolderIcon(node.name)}</span>
        <span className="fb-folder-name">{node.name}</span>
        <span className="fb-folder-count">{node.fileCount} file</span>
      </button>

      {isExpanded && (
        <div className="fb-folder-children">
          {node.children.map(child =>
            child.type === 'folder' ? (
              <FolderNode
                key={child.path}
                node={child}
                depth={depth + 1}
                workspaceFiles={workspaceFiles}
                onOpenInEditor={onOpenInEditor}
                searchQuery={searchQuery}
                defaultExpand={false}
              />
            ) : (
              <FileRow
                key={child.path}
                node={child}
                depth={depth + 1}
                workspaceFiles={workspaceFiles}
                onOpenInEditor={onOpenInEditor}
                searchQuery={searchQuery}
              />
            )
          )}
        </div>
      )}
    </div>
  )
}

// ── Stats Bar ────────────────────────────────────────────────────────────────

function StatsBar({ filePaths }) {
  const stats = useMemo(() => {
    const groups = {
      'Thư mục sach/': filePaths.filter(p => p.includes('/sach/')).length,
      'Thư mục exams/': filePaths.filter(p => p.includes('/exams/')).length,
      'Engine (modules/)': filePaths.filter(p => p.includes('/modules/')).length,
      'HDSD': filePaths.filter(p => /hdsd/.test(p)).length,
      'Config': filePaths.filter(p => /_config/.test(p)).length,
    }
    return groups
  }, [filePaths])

  return (
    <div className="fb-stats-bar">
      {Object.entries(stats).map(([label, count]) => (
        <div key={label} className="fb-stat-chip">
          <strong>{count}</strong>
          <span>{label}</span>
        </div>
      ))}
    </div>
  )
}

// ── Quick Access ─────────────────────────────────────────────────────────────

const QUICK_FILES = [
  { label: '⚙️ _shared-config', path: '/typst/modules/_shared-config.typ' },
  { label: '📖 HDSD Tổng', path: '/typst/hdsd.typ' },
  { label: '📝 HDSD Exam', path: '/typst/hdsd-exam.typ' },
  { label: '📊 HDSD BBT', path: '/typst/hdsd-bbt.typ' },
  { label: '⚡ sang-exam', path: '/typst/sang-exam.typ' },
  { label: '🚀 Playground', path: '/typst/public-playground.typ' },
]

function QuickAccess({ workspaceFiles, onOpenInEditor }) {
  return (
    <div className="fb-quick-access">
      <div className="fb-section-label">⚡ Truy cập nhanh</div>
      <div className="fb-quick-grid">
        {QUICK_FILES.map(item => {
          const content = workspaceFiles[item.path]
          const exists = content !== undefined
          return (
            <button
              key={item.path}
              type="button"
              className={`fb-quick-btn ${exists ? '' : 'fb-quick-btn--missing'}`}
              onClick={() => exists && onOpenInEditor(item.path, content)}
              title={item.path}
            >
              {item.label}
              {!exists && <span className="fb-missing-badge">chưa có</span>}
            </button>
          )
        })}
      </div>
    </div>
  )
}

// ── Main Component ────────────────────────────────────────────────────────────

export default function FileBrowser({ onOpenInEditor }) {
  const [searchQuery, setSearchQuery] = useState('')
  const [filterFolder, setFilterFolder] = useState('all')

  // initialWorkspaceFiles keys are already normalized: /typst/...
  const workspaceFiles = initialWorkspaceFiles

  const allFilePaths = useMemo(() => Object.keys(workspaceFiles).sort(), [workspaceFiles])

  const filteredPaths = useMemo(() => {
    let paths = allFilePaths
    if (filterFolder !== 'all') {
      paths = paths.filter(p => p.includes(`/${filterFolder}/`) || p.includes(`/${filterFolder}.`))
    }
    if (searchQuery.trim()) {
      const q = searchQuery.trim().toLowerCase()
      paths = paths.filter(p => p.toLowerCase().includes(q))
    }
    return paths
  }, [allFilePaths, filterFolder, searchQuery])

  const tree = useMemo(() => buildTree(filteredPaths), [filteredPaths])

  function handleOpenInEditor(filePath, content) {
    if (onOpenInEditor) {
      onOpenInEditor(filePath, content)
    }
  }

  return (
    <div className="fb-shell">
      {/* Header */}
      <div className="fb-header">
        <div className="fb-header-title">
          <span className="fb-header-icon">📁</span>
          <div>
            <h2 className="fb-header-h2">Thư viện Typst</h2>
            <p className="fb-header-sub">Duyệt và mở file trong Editor WASM ngay trên trình duyệt</p>
          </div>
        </div>

        <div className="fb-header-controls">
          <input
            id="fb-search"
            type="search"
            className="fb-search"
            placeholder="🔍 Tìm file... (vd: tfrac, hdsd, sach)"
            value={searchQuery}
            onChange={e => setSearchQuery(e.target.value)}
          />
          <div className="fb-filter-tabs">
            {['all', 'sach', 'exams', 'modules'].map(f => (
              <button
                key={f}
                type="button"
                className={`fb-filter-tab ${filterFolder === f ? 'active' : ''}`}
                onClick={() => setFilterFolder(f)}
              >
                {f === 'all' ? '🌐 Tất cả' : f === 'sach' ? '📚 Sách' : f === 'exams' ? '📝 Exams' : '⚙️ Engine'}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Stats */}
      <StatsBar filePaths={allFilePaths} />

      {/* Quick Access */}
      <QuickAccess workspaceFiles={workspaceFiles} onOpenInEditor={handleOpenInEditor} />

      {/* File Tree */}
      <div className="fb-tree-panel">
        <div className="fb-section-label">
          🗂️ Cây thư mục — {filteredPaths.length} file
          {searchQuery && <span className="fb-search-badge">Đang lọc: "{searchQuery}"</span>}
        </div>
        <div className="fb-tree">
          {tree.children.map(child =>
            child.type === 'folder' ? (
              <FolderNode
                key={child.path}
                node={child}
                depth={0}
                workspaceFiles={workspaceFiles}
                onOpenInEditor={handleOpenInEditor}
                searchQuery={searchQuery}
                defaultExpand={PINNED_FOLDERS.includes(child.name)}
              />
            ) : (
              <FileRow
                key={child.path}
                node={child}
                depth={0}
                workspaceFiles={workspaceFiles}
                onOpenInEditor={handleOpenInEditor}
                searchQuery={searchQuery}
              />
            )
          )}
        </div>
      </div>

      {/* Footer tip */}
      <div className="fb-footer">
        <span>💡 Click vào file để mở trong Editor WASM — có thể chỉnh sửa và xem preview trực tiếp trên trình duyệt.</span>
      </div>
    </div>
  )
}
