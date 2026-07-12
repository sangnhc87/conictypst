const state = {
  data: null,
  kind: 'all',
  grade: 'all',
  status: 'all',
  query: '',
  clusters: new Set(),
}

const els = {
  search: document.getElementById('searchInput'),
  stats: document.getElementById('stats'),
  kindTabs: document.getElementById('kindTabs'),
  grade: document.getElementById('gradeFilter'),
  status: document.getElementById('statusFilter'),
  clusters: document.getElementById('clusterFilters'),
  list: document.getElementById('assetList'),
  result: document.getElementById('resultInfo'),
}

function textOf(asset) {
  return [
    asset.id,
    asset.title,
    asset.kind,
    asset.cluster,
    asset.chapter,
    asset.status,
    ...(asset.tags || []),
  ].filter(Boolean).join(' ').toLowerCase()
}

function normalize(value) {
  return String(value || '').toLowerCase()
}

function renderStats() {
  const counts = state.data?.counts || { total: 0, cd: 0, beamer: 0 }
  const ready = state.data.assets.filter(a => a.status === 'ready').length
  els.stats.innerHTML = [
    ['Tổng học liệu', counts.total],
    ['Chuyên đề CD', counts.cd],
    ['Beamer', counts.beamer],
    ['Ready', ready],
  ].map(([label, value]) => `
    <article class="stat">
      <strong>${value}</strong>
      <span>${label}</span>
    </article>
  `).join('')
}

function renderClusterFilters() {
  const clusters = [...new Set(state.data.assets.map(a => a.cluster || a.chapter || 'Khác'))].sort()
  els.clusters.innerHTML = clusters.map(cluster => `
    <label>
      <input type="checkbox" value="${cluster}">
      <span>${cluster}</span>
    </label>
  `).join('')
  els.clusters.querySelectorAll('input').forEach(input => {
    input.addEventListener('change', () => {
      if (input.checked) state.clusters.add(input.value)
      else state.clusters.delete(input.value)
      renderList()
    })
  })
}

function filteredAssets() {
  const query = normalize(state.query)
  return state.data.assets.filter(asset => {
    if (state.kind !== 'all' && asset.kind !== state.kind) return false
    if (state.grade !== 'all' && String(asset.grade) !== state.grade) return false
    if (state.status !== 'all' && asset.status !== state.status) return false
    const cluster = asset.cluster || asset.chapter || 'Khác'
    if (state.clusters.size && !state.clusters.has(cluster)) return false
    if (query && !textOf(asset).includes(query)) return false
    return true
  })
}

function renderList() {
  const assets = filteredAssets()
  els.result.textContent = `${assets.length} mục`
  if (!assets.length) {
    els.list.innerHTML = '<div class="empty">Không có học liệu khớp bộ lọc.</div>'
    return
  }
  els.list.innerHTML = assets.map(asset => {
    const kindLabel = asset.kind === 'cd' ? 'CD' : 'Beamer'
    const kindClass = asset.kind === 'cd' ? 'cd' : 'beamer'
    const cluster = asset.cluster || asset.chapter || 'Khác'
    const tags = [
      `<span class="badge ${kindClass}">${kindLabel}</span>`,
      asset.grade ? `<span class="badge">Khối ${asset.grade}</span>` : '',
      cluster ? `<span class="badge">${cluster}</span>` : '',
      asset.status ? `<span class="badge ${asset.status === 'draft' ? 'warn' : ''}">${asset.status}</span>` : '',
      ...(asset.tags || []).slice(0, 3).map(tag => `<span class="badge">${tag}</span>`),
    ].filter(Boolean).join('')
    const pdfHref = asset.pdf_url || null
    const typHref = asset.source_url || null
    return `
      <article class="asset">
        <div>
          <h3>${asset.title || asset.id}</h3>
          <p><strong>${asset.id}</strong>${asset.chapter ? ` · ${asset.chapter}` : ''}${asset.lesson ? ` · Bài ${asset.lesson}` : ''}</p>
          <div class="badges">${tags}</div>
        </div>
        <div class="actions">
          ${pdfHref ? `<a class="primary" href="${pdfHref}" target="_blank" rel="noopener">Mở PDF</a>` : `<a href="#" aria-disabled="true">Chưa có PDF</a>`}
          ${typHref ? `<a href="${typHref}" target="_blank" rel="noopener">Typst</a>` : ''}
        </div>
      </article>
    `
  }).join('')
}

async function init() {
  const res = await fetch('atlas-data.json')
  state.data = await res.json()
  renderStats()
  renderClusterFilters()
  renderList()
  if (window.lucide) window.lucide.createIcons()
}

els.search.addEventListener('input', event => {
  state.query = event.target.value
  renderList()
})

els.kindTabs.addEventListener('click', event => {
  const button = event.target.closest('button[data-kind]')
  if (!button) return
  state.kind = button.dataset.kind
  els.kindTabs.querySelectorAll('button').forEach(btn => btn.classList.toggle('active', btn === button))
  renderList()
})

els.grade.addEventListener('change', event => {
  state.grade = event.target.value
  renderList()
})

els.status.addEventListener('change', event => {
  state.status = event.target.value
  renderList()
})

init().catch(error => {
  console.error(error)
  els.result.textContent = 'Lỗi nạp Atlas'
  els.list.innerHTML = '<div class="empty">Không nạp được atlas-data.json.</div>'
})
