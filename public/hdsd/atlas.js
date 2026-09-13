/**
 * Sang Math Atlas — atlas.js
 * Enhanced client logic: VDC-focused filtering, interactive stat pills,
 * quick search tags, active filter breadcrumbs, and chunked high-performance rendering.
 */

const state = {
  data: null,
  vdcOnly: false,
  kind: 'all',
  grade: 'all',
  status: 'all',
  query: '',
  clusters: new Set(),
  viewMode: localStorage.getItem('atlas_view_mode') || 'grid',
  limit: 48,
  pageSize: 48,
}

const els = {
  search: document.getElementById('searchInput'),
  searchClear: document.getElementById('searchClear'),
  quickSearchTags: document.getElementById('quickSearchTags'),
  stats: document.getElementById('stats'),
  btnToggleVdc: document.getElementById('btnToggleVdc'),
  vdcBadgeCount: document.getElementById('vdcBadgeCount'),
  kindTabs: document.getElementById('kindTabs'),
  gradeChips: document.getElementById('gradeChips'),
  statusSelect: document.getElementById('statusFilter'),
  clusters: document.getElementById('clusterFilters'),
  btnSelectAllClusters: document.getElementById('btnSelectAllClusters'),
  btnClearClusters: document.getElementById('btnClearClusters'),
  activeFilterBar: document.getElementById('activeFilterBar'),
  activeFilterPills: document.getElementById('activeFilterPills'),
  btnClearAllFilters: document.getElementById('btnClearAllFilters'),
  list: document.getElementById('assetList'),
  resultCount: document.getElementById('resultCount'),
  paginationWrap: document.getElementById('paginationWrap'),
  viewModeGrid: document.getElementById('viewModeGrid'),
  viewModeList: document.getElementById('viewModeList'),
}

function normalize(value) {
  return String(value || '')
    .toLocaleLowerCase('vi')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/đ/g, 'd')
    .replace(/Đ/g, 'd')
    .trim()
}

function buildSearchText(asset) {
  return normalize([
    asset.id,
    asset.title,
    asset.kind,
    asset.cluster,
    asset.chapter,
    asset.status,
    asset.difficulty,
    `khoi ${asset.grade}`,
    ...(asset.tags || []),
  ].filter(Boolean).join(' '))
}

function isAssetVdc(asset) {
  if (asset.kind === 'cd') return true
  if (asset.difficulty === 'VDC') return true
  if (asset.tags && asset.tags.includes('VDC')) return true
  const lower = (asset.id + ' ' + asset.title).toLowerCase()
  return lower.includes('vdc') || lower.includes('nang-cao') || lower.includes('chuyensau')
}

function renderStats() {
  if (!state.data) return
  const counts = state.data.counts || { total: 0, cd: 0, vdc: 0, lesson_plan: 0, beamer: 0 }
  const vdcTotal = state.data.assets.filter(isAssetVdc).length
  const k10 = state.data.assets.filter(a => a.grade === 10).length
  const ready = state.data.assets.filter(a => a.status === 'ready').length

  const statsConfig = [
    { key: 'total', label: 'Tất cả học liệu', value: counts.total, icon: 'layers', color: '#2563eb', bg: '#eff6ff', type: 'reset' },
    { key: 'vdc', label: '🔥 Chuyên Đề VDC', value: vdcTotal, icon: 'flame', color: '#dc2626', bg: '#fef2f2', isVdc: true, type: 'vdc' },
    { key: 'k10', label: 'Khối 10 (VDC & Bài)', value: k10, icon: 'sparkles', color: '#059669', bg: '#ecfdf5', type: 'grade', val: '10' },
    { key: 'cd', label: 'Tất cả CD', value: counts.cd, icon: 'book-open', color: '#ea580c', bg: '#fff7ed', type: 'kind', val: 'cd' },
    { key: 'lesson-plan', label: 'Giáo án KNTT', value: counts.lesson_plan, icon: 'file-text', color: '#d97706', bg: '#fffbeb', type: 'kind', val: 'lesson-plan' },
    { key: 'ready', label: 'PDF sẵn sàng', value: ready, icon: 'check-circle-2', color: '#0284c7', bg: '#f0f9ff', type: 'status', val: 'ready' },
  ]

  if (els.vdcBadgeCount) {
    els.vdcBadgeCount.textContent = vdcTotal
  }

  els.stats.innerHTML = statsConfig.map(s => {
    let isActive = false
    if (s.type === 'vdc') isActive = state.vdcOnly
    else if (s.type === 'grade') isActive = state.grade === s.val
    else if (s.type === 'kind') isActive = state.kind === s.val
    else if (s.type === 'status') isActive = state.status === s.val

    const cardClass = s.isVdc ? 'highlight-vdc' : ''

    return `
      <article class="atlas-stat-card ${cardClass} ${isActive ? 'active' : ''}" data-stat="${s.key}">
        <div class="atlas-stat-top">
          <span class="label">${s.label}</span>
          <span class="atlas-stat-icon" style="color: ${s.color}; background: ${s.bg};">
            <i data-lucide="${s.icon}"></i>
          </span>
        </div>
        <strong>${s.value.toLocaleString('vi-VN')}</strong>
      </article>
    `
  }).join('')

  els.stats.querySelectorAll('.atlas-stat-card').forEach((card, idx) => {
    card.addEventListener('click', () => {
      const cfg = statsConfig[idx]
      if (cfg.type === 'reset') {
        resetAllFilters()
      } else if (cfg.type === 'vdc') {
        state.vdcOnly = !state.vdcOnly
      } else if (cfg.type === 'kind') {
        state.kind = state.kind === cfg.val ? 'all' : cfg.val
      } else if (cfg.type === 'grade') {
        state.grade = state.grade === cfg.val ? 'all' : cfg.val
      } else if (cfg.type === 'status') {
        state.status = state.status === cfg.val ? 'all' : cfg.val
      }
      state.limit = state.pageSize
      syncControlUI()
      renderList()
    })
  })
}

function renderClusterFilters() {
  if (!state.data) return
  const clusterCounts = new Map()
  
  // Count by cluster respecting vdcOnly filter
  for (const asset of state.data.assets) {
    if (state.vdcOnly && !isAssetVdc(asset)) continue
    const cluster = asset.cluster || asset.chapter || 'Khác'
    clusterCounts.set(cluster, (clusterCounts.get(cluster) || 0) + 1)
  }

  const sortedClusters = [...clusterCounts.keys()].sort((a, b) => {
    return (clusterCounts.get(b) || 0) - (clusterCounts.get(a) || 0)
  })

  els.clusters.innerHTML = sortedClusters.map(cluster => {
    const count = clusterCounts.get(cluster) || 0
    const isChecked = state.clusters.has(cluster)
    return `
      <label class="atlas-cluster-item">
        <span class="atlas-cluster-label">
          <input type="checkbox" value="${cluster}" ${isChecked ? 'checked' : ''}>
          <span>${cluster}</span>
        </span>
        <span class="atlas-cluster-count">${count}</span>
      </label>
    `
  }).join('')

  els.clusters.querySelectorAll('input[type="checkbox"]').forEach(input => {
    input.addEventListener('change', () => {
      if (input.checked) state.clusters.add(input.value)
      else state.clusters.delete(input.value)
      state.limit = state.pageSize
      syncControlUI()
      renderList()
    })
  })
}

function filteredAssets() {
  const query = normalize(state.query)
  return state.data.assets.filter(asset => {
    // VDC Filter
    if (state.vdcOnly && !isAssetVdc(asset)) return false

    // Kind filter
    if (state.kind !== 'all' && asset.kind !== state.kind) return false

    // Grade filter
    if (state.grade !== 'all' && String(asset.grade) !== state.grade) return false

    // Status filter
    if (state.status !== 'all' && asset.status !== state.status) return false
    
    // Cluster filter
    const cluster = asset.cluster || asset.chapter || 'Khác'
    if (state.clusters.size && !state.clusters.has(cluster)) return false
    
    // Text search query
    if (query) {
      if (!asset._searchText) asset._searchText = buildSearchText(asset)
      if (!asset._searchText.includes(query)) return false
    }
    return true
  })
}

function renderActiveFilterBar() {
  if (!els.activeFilterBar || !els.activeFilterPills) return

  const pills = []

  if (state.vdcOnly) {
    pills.push(`
      <span class="atlas-filter-pill vdc">
        🔥 Chỉ hiện VDC
        <button type="button" data-clear="vdc" title="Bỏ lọc VDC" aria-label="Bỏ lọc VDC">✕</button>
      </span>
    `)
  }

  if (state.kind !== 'all') {
    const label = state.kind === 'cd' ? 'Chuyên đề CD' : state.kind === 'lesson-plan' ? 'Giáo án' : 'Beamer'
    pills.push(`
      <span class="atlas-filter-pill">
        Loại: ${label}
        <button type="button" data-clear="kind" title="Bỏ lọc loại" aria-label="Bỏ lọc loại">✕</button>
      </span>
    `)
  }

  if (state.grade !== 'all') {
    pills.push(`
      <span class="atlas-filter-pill">
        Khối: Lớp ${state.grade}
        <button type="button" data-clear="grade" title="Bỏ lọc khối" aria-label="Bỏ lọc khối">✕</button>
      </span>
    `)
  }

  if (state.status !== 'all') {
    const label = state.status === 'ready' ? 'PDF sẵn sàng' : 'Bản thảo'
    pills.push(`
      <span class="atlas-filter-pill">
        Trạng thái: ${label}
        <button type="button" data-clear="status" title="Bỏ lọc trạng thái" aria-label="Bỏ lọc trạng thái">✕</button>
      </span>
    `)
  }

  if (state.query) {
    pills.push(`
      <span class="atlas-filter-pill">
        Từ khóa: "${state.query}"
        <button type="button" data-clear="query" title="Xóa từ khóa" aria-label="Xóa từ khóa">✕</button>
      </span>
    `)
  }

  if (state.clusters.size > 0) {
    pills.push(`
      <span class="atlas-filter-pill">
        ${state.clusters.size} chủ đề đã chọn
        <button type="button" data-clear="clusters" title="Xóa chọn chủ đề" aria-label="Xóa chọn chủ đề">✕</button>
      </span>
    `)
  }

  if (pills.length > 0) {
    els.activeFilterBar.classList.add('visible')
    els.activeFilterPills.innerHTML = pills.join('')
    
    els.activeFilterPills.querySelectorAll('button[data-clear]').forEach(btn => {
      btn.addEventListener('click', () => {
        const type = btn.dataset.clear
        if (type === 'vdc') state.vdcOnly = false
        else if (type === 'kind') state.kind = 'all'
        else if (type === 'grade') state.grade = 'all'
        else if (type === 'status') state.status = 'all'
        else if (type === 'query') {
          state.query = ''
          if (els.search) els.search.value = ''
        } else if (type === 'clusters') {
          state.clusters.clear()
          renderClusterFilters()
        }
        state.limit = state.pageSize
        syncControlUI()
        renderList()
      })
    })
  } else {
    els.activeFilterBar.classList.remove('visible')
    els.activeFilterPills.innerHTML = ''
  }
}

function resetAllFilters() {
  state.vdcOnly = false
  state.kind = 'all'
  state.grade = 'all'
  state.status = 'all'
  state.clusters.clear()
  state.query = ''
  if (els.search) els.search.value = ''
  state.limit = state.pageSize
  syncControlUI()
  renderClusterFilters()
  renderList()
}

function syncControlUI() {
  // Sync VDC button
  if (els.btnToggleVdc) {
    els.btnToggleVdc.classList.toggle('active', state.vdcOnly)
  }

  // Sync kind tabs
  if (els.kindTabs) {
    els.kindTabs.querySelectorAll('button[data-kind]').forEach(btn => {
      btn.classList.toggle('active', btn.dataset.kind === state.kind)
    })
  }

  // Sync grade chips
  if (els.gradeChips) {
    els.gradeChips.querySelectorAll('.atlas-grade-chip').forEach(chip => {
      chip.classList.toggle('active', chip.dataset.grade === state.grade)
    })
  }

  // Sync status select
  if (els.statusSelect) {
    els.statusSelect.value = state.status
  }

  // Sync view mode buttons
  if (els.viewModeGrid && els.viewModeList) {
    els.viewModeGrid.classList.toggle('active', state.viewMode === 'grid')
    els.viewModeList.classList.toggle('active', state.viewMode === 'list')
  }

  // Sync clear search button
  if (els.searchClear) {
    els.searchClear.style.display = state.query ? 'inline-flex' : 'none'
  }

  renderActiveFilterBar()
  renderStats()
}

function renderList() {
  const allFiltered = filteredAssets()
  const totalCount = allFiltered.length
  
  if (els.resultCount) {
    const vdcNotice = state.vdcOnly ? ' [🔥 VDC]' : ''
    els.resultCount.textContent = `${totalCount.toLocaleString('vi-VN')} mục${vdcNotice}`
  }

  // Set container layout class
  els.list.className = `atlas-asset-container ${state.viewMode === 'grid' ? 'grid-view' : 'list-view'}`

  if (totalCount === 0) {
    els.list.innerHTML = `
      <div class="atlas-empty-state">
        <div class="atlas-empty-icon"><i data-lucide="search-x"></i></div>
        <div class="atlas-empty-title">Không tìm thấy học liệu khớp với bộ lọc</div>
        <div class="atlas-empty-desc">
          ${state.vdcOnly ? 'Bạn đang bật chế độ <strong>🔥 Chỉ hiện VDC</strong>. ' : ''}
          Hãy thử tắt bộ lọc hoặc bấm nút bên dưới để xem toàn bộ 531 học liệu.
        </div>
        <button type="button" class="atlas-btn primary" id="btnResetFilters">
          <i data-lucide="rotate-ccw"></i> Xem lại toàn bộ học liệu
        </button>
      </div>
    `
    const btnReset = document.getElementById('btnResetFilters')
    if (btnReset) {
      btnReset.addEventListener('click', resetAllFilters)
    }
    if (els.paginationWrap) els.paginationWrap.innerHTML = ''
    if (window.lucide) window.lucide.createIcons()
    return
  }

  // Slice items for high performance chunking
  const displayedAssets = allFiltered.slice(0, state.limit)

  els.list.innerHTML = displayedAssets.map(asset => {
    const isCd = asset.kind === 'cd'
    const isLp = asset.kind === 'lesson-plan'
    const isBm = asset.kind === 'beamer'
    const isVdc = isAssetVdc(asset)

    const kindLabel = isCd ? 'Chuyên đề CD' : isLp ? 'Giáo án KNTT' : 'Slide Beamer'
    const kindClass = isCd ? 'kind-cd' : isLp ? 'kind-lesson-plan' : 'kind-beamer'
    const kindIcon = isCd ? 'book-open' : isLp ? 'file-text' : 'presentation'

    const gradeClass = asset.grade === 10 ? 'grade-10' : asset.grade === 11 ? 'grade-11' : 'grade-12'
    const cluster = asset.cluster || asset.chapter || 'Khác'

    const badges = [
      `<span class="atlas-badge ${kindClass}"><i data-lucide="${kindIcon}"></i> ${kindLabel}</span>`,
      asset.grade ? `<span class="atlas-badge ${gradeClass}">Khối ${asset.grade}</span>` : '',
      isVdc ? `<span class="atlas-badge vdc-badge">🔥 VDC Nâng Cao</span>` : '',
      asset.semester ? `<span class="atlas-badge cluster-badge">${asset.semester}</span>` : '',
      cluster ? `<span class="atlas-badge cluster-badge">${cluster}</span>` : '',
      asset.status === 'ready' 
        ? `<span class="atlas-badge status-ready"><i data-lucide="check"></i> PDF sẵn sàng</span>`
        : `<span class="atlas-badge status-draft"><i data-lucide="clock"></i> Bản thảo</span>`,
    ].filter(Boolean).join('')

    const pdfHref = asset.pdf_url || null
    const typHref = asset.source_url || null

    return `
      <article class="atlas-card ${isVdc ? 'is-vdc' : ''}" data-grade="${asset.grade || 12}">
        <div class="atlas-card-content">
          <div class="atlas-card-top">
            <h3 class="atlas-card-title">${asset.title || asset.id}</h3>
          </div>
          <div class="atlas-card-meta">
            <strong>${asset.id}</strong>
            ${asset.chapter ? `<span>· ${asset.chapter}</span>` : ''}
            ${asset.lesson ? `<span>· Bài ${asset.lesson}</span>` : ''}
          </div>
          <div class="atlas-badges">${badges}</div>
        </div>
        <div class="atlas-actions">
          ${pdfHref 
            ? `<a class="atlas-btn primary ${isVdc ? 'vdc-btn' : ''}" href="${pdfHref}" target="_blank" rel="noopener">
                 <i data-lucide="file-down"></i> Mở PDF
               </a>` 
            : `<a class="atlas-btn disabled" href="#" aria-disabled="true">
                 <i data-lucide="file-x"></i> Chưa có PDF
               </a>`
          }
          ${typHref 
            ? `<a class="atlas-btn secondary" href="${typHref}" target="_blank" rel="noopener" title="Xem mã nguồn Typst trên GitHub">
                 <i data-lucide="code-2"></i> Typst
               </a>` 
            : ''
          }
        </div>
      </article>
    `
  }).join('')

  // Pagination / Load More
  if (state.limit < totalCount) {
    const remaining = totalCount - state.limit
    const nextBatch = Math.min(remaining, state.pageSize)
    els.paginationWrap.innerHTML = `
      <button type="button" class="atlas-load-more-btn" id="btnLoadMore">
        <i data-lucide="chevron-down"></i> Tải thêm ${nextBatch} mục khác (còn ${remaining} mục)
      </button>
      <span style="font-size: 12px; color: var(--atlas-muted); font-weight: 600;">
        Đang hiển thị ${displayedAssets.length} / ${totalCount} học liệu
      </span>
    `
    const btnLoadMore = document.getElementById('btnLoadMore')
    if (btnLoadMore) {
      btnLoadMore.addEventListener('click', () => {
        state.limit += state.pageSize
        renderList()
      })
    }
  } else {
    els.paginationWrap.innerHTML = `
      <span style="font-size: 13px; color: var(--atlas-muted); font-weight: 700;">
        ✓ Đã hiển thị toàn bộ ${totalCount} học liệu
      </span>
    `
  }

  if (window.lucide) window.lucide.createIcons()
}

async function init() {
  try {
    const res = await fetch('atlas-data.json')
    if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`)
    state.data = await res.json()

    // Precompute lowercase search text for speed
    for (const asset of state.data.assets) {
      asset._searchText = buildSearchText(asset)
    }

    renderStats()
    renderClusterFilters()
    syncControlUI()
    renderList()

    if (window.lucide) window.lucide.createIcons()
  } catch (error) {
    console.error('Atlas Init Error:', error)
    if (els.resultCount) els.resultCount.textContent = 'Lỗi nạp'
    if (els.list) {
      els.list.innerHTML = `
        <div class="atlas-empty-state">
          <div class="atlas-empty-icon"><i data-lucide="alert-circle"></i></div>
          <div class="atlas-empty-title">Không nạp được kho dữ liệu Atlas</div>
          <div class="atlas-empty-desc">${error.message || 'Lỗi kết nối atlas-data.json.'}</div>
        </div>
      `
      if (window.lucide) window.lucide.createIcons()
    }
  }
}

// Event Listeners

// VDC Toggle Button
if (els.btnToggleVdc) {
  els.btnToggleVdc.addEventListener('click', () => {
    state.vdcOnly = !state.vdcOnly
    state.limit = state.pageSize
    syncControlUI()
    renderClusterFilters()
    renderList()
  })
}

// Quick Search Tags
if (els.quickSearchTags) {
  els.quickSearchTags.addEventListener('click', event => {
    const btn = event.target.closest('[data-quick]')
    if (!btn) return
    const tag = btn.dataset.quick

    if (tag === 'vdc') {
      state.vdcOnly = true
      state.kind = 'all'
      state.query = ''
      if (els.search) els.search.value = ''
    } else if (tag === 'k10-vdc') {
      state.vdcOnly = true
      state.grade = '10'
      state.kind = 'all'
      state.query = ''
      if (els.search) els.search.value = ''
    } else if (tag === 'euler') {
      state.query = 'Euler'
      if (els.search) els.search.value = 'Euler'
    } else if (tag === 'oxyz') {
      state.query = 'Oxyz'
      if (els.search) els.search.value = 'Oxyz'
    } else if (tag === 'gauss') {
      state.query = 'Gauss'
      if (els.search) els.search.value = 'Gauss'
    } else if (tag === 'tamticu') {
      state.query = 'Tam tỉ cự'
      if (els.search) els.search.value = 'Tam tỉ cự'
    } else if (tag === 'conic') {
      state.query = 'Conic'
      if (els.search) els.search.value = 'Conic'
    } else if (tag === 'logic') {
      state.query = 'Logic'
      if (els.search) els.search.value = 'Logic'
    }

    state.limit = state.pageSize
    syncControlUI()
    renderList()
  })
}

// Search Input
if (els.search) {
  els.search.addEventListener('input', event => {
    state.query = event.target.value
    state.limit = state.pageSize
    syncControlUI()
    renderList()
  })
}

if (els.searchClear) {
  els.searchClear.addEventListener('click', () => {
    state.query = ''
    if (els.search) {
      els.search.value = ''
      els.search.focus()
    }
    state.limit = state.pageSize
    syncControlUI()
    renderList()
  })
}

// Global Keyboard Shortcut: ⌘K or / to search
window.addEventListener('keydown', event => {
  if ((event.metaKey || event.ctrlKey) && event.key === 'k') {
    event.preventDefault()
    if (els.search) els.search.focus()
  } else if (event.key === '/' && document.activeElement !== els.search && !['input', 'textarea'].includes(document.activeElement.tagName.toLowerCase())) {
    event.preventDefault()
    if (els.search) els.search.focus()
  }
})

// Kind Tabs
if (els.kindTabs) {
  els.kindTabs.addEventListener('click', event => {
    const button = event.target.closest('button[data-kind]')
    if (!button) return
    state.kind = button.dataset.kind
    state.limit = state.pageSize
    syncControlUI()
    renderList()
  })
}

// Grade Chips
if (els.gradeChips) {
  els.gradeChips.addEventListener('click', event => {
    const chip = event.target.closest('.atlas-grade-chip')
    if (!chip) return
    state.grade = chip.dataset.grade
    state.limit = state.pageSize
    syncControlUI()
    renderList()
  })
}

// Status Select dropdown
if (els.statusSelect) {
  els.statusSelect.addEventListener('change', event => {
    state.status = event.target.value
    state.limit = state.pageSize
    syncControlUI()
    renderList()
  })
}

// View Mode Toggle
if (els.viewModeGrid) {
  els.viewModeGrid.addEventListener('click', () => {
    state.viewMode = 'grid'
    localStorage.setItem('atlas_view_mode', 'grid')
    syncControlUI()
    renderList()
  })
}

if (els.viewModeList) {
  els.viewModeList.addEventListener('click', () => {
    state.viewMode = 'list'
    localStorage.setItem('atlas_view_mode', 'list')
    syncControlUI()
    renderList()
  })
}

// Select All / Clear Clusters
if (els.btnSelectAllClusters) {
  els.btnSelectAllClusters.addEventListener('click', () => {
    if (!state.data) return
    state.clusters.clear()
    for (const a of state.data.assets) {
      if (state.vdcOnly && !isAssetVdc(a)) continue
      state.clusters.add(a.cluster || a.chapter || 'Khác')
    }
    renderClusterFilters()
    state.limit = state.pageSize
    renderList()
  })
}

if (els.btnClearClusters) {
  els.btnClearClusters.addEventListener('click', () => {
    state.clusters.clear()
    renderClusterFilters()
    state.limit = state.pageSize
    renderList()
  })
}

// Clear all active filters
if (els.btnClearAllFilters) {
  els.btnClearAllFilters.addEventListener('click', resetAllFilters)
}

init()
