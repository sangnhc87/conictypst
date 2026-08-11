import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { COMMANDS, COMMAND_MAP, buildSource, createObject } from './catalog.js'

const STORAGE_KEY = 'sang-math-graphics-studio:visual-v1'
const VIEW = { xmin: -6, xmax: 6, ymin: -4, ymax: 4 }

const TOOLS = [
  {
    id: 'arc',
    command: 'arc-by-points',
    icon: '◔',
    tone: 'orange',
    name: 'Cung tròn',
    short: 'A · O · B',
    description: 'Đặt điểm đầu, tâm và điểm cuối.',
    guide: ['Chọn điểm đầu A.', 'Chọn tâm O.', 'Chọn điểm cuối B.', 'Kéo các điểm để chỉnh cung.'],
    algorithm: 'Studio đo góc của OA và OB rồi sinh arc theo đúng cú pháp start/stop của CeTZ.',
  },
  {
    id: 'triangle',
    command: 'tri-xyz',
    icon: '△',
    tone: 'blue',
    name: 'Tam giác',
    short: '3 đỉnh',
    description: 'Đặt trực tiếp ba đỉnh A, B, C.',
    guide: ['Đặt đỉnh A.', 'Đặt đỉnh B.', 'Đặt đỉnh C.', 'Kéo đỉnh để đổi hình.'],
    algorithm: 'Ba điểm được giữ nguyên thành tọa độ Typst và truyền vào tri-xyz.',
  },
  {
    id: 'circle',
    command: 'circle-desc',
    icon: '○',
    tone: 'blue',
    name: 'Đường tròn',
    short: 'Tâm · bán kính',
    description: 'Đặt tâm O rồi kéo tay nắm bán kính.',
    guide: ['Đặt tâm O.', 'Kéo tay nắm R.', 'Đổi kích thước bằng kéo trực tiếp.', 'Mã tự cập nhật.'],
    algorithm: 'Khoảng cách từ O đến R trở thành bán kính radius của circle-desc.',
  },
  {
    id: 'cone',
    command: 'draw-cone',
    icon: '△',
    tone: 'violet',
    name: 'Hình nón',
    short: '3D trực quan',
    description: 'Kéo đỉnh và mép đáy phối cảnh.',
    guide: ['Kéo đỉnh S để đổi chiều cao.', 'Kéo mép đáy để đổi bán kính.', 'Kéo tâm đáy để dịch hình.', 'Xuất mã draw-cone.'],
    algorithm: 'Từ kích thước kéo trên mặt phẳng, Studio sinh radius, height và center cho draw-cone.',
  },
]

const TOOL_MAP = Object.fromEntries(TOOLS.map(tool => [tool.id, tool]))
const PLACE_ORDER = {
  arc: ['A', 'O', 'B'],
  triangle: ['A', 'B', 'C'],
  circle: ['center', 'rim'],
  cone: [],
}

function point(x, y) {
  return { x, y }
}

function defaultDrafts() {
  return {
    arc: { A: point(2.4, 0), O: point(0, 0), B: point(0, 2.4) },
    triangle: { A: point(-3, -1.2), B: point(3, -1.2), C: point(0, 2.5) },
    circle: { center: point(-1, 0), rim: point(1.3, 0) },
    cone: { base: point(0, -1.6), rim: point(2.2, -1.6), apex: point(0, 2.2) },
  }
}

function emptyDraft(toolId) {
  if (toolId === 'arc') return { A: null, O: null, B: null }
  if (toolId === 'triangle') return { A: null, B: null, C: null }
  if (toolId === 'circle') return { center: null, rim: null }
  return defaultDrafts().cone
}

function readSavedProject() {
  try {
    const saved = JSON.parse(localStorage.getItem(STORAGE_KEY) || 'null')
    if (saved?.drafts && TOOL_MAP[saved.toolId]) {
      return {
        name: String(saved.name || 'Bản vẽ trực quan'),
        toolId: saved.toolId,
        drafts: { ...defaultDrafts(), ...saved.drafts },
      }
    }
  } catch {
    // Dữ liệu local hỏng không được phép chặn bàn vẽ.
  }
  return { name: 'Bản vẽ trực quan', toolId: 'arc', drafts: defaultDrafts() }
}

function clamp(value, min, max) {
  return Math.max(min, Math.min(max, value))
}

function distance(a, b) {
  if (!a || !b) return 0
  return Math.hypot(a.x - b.x, a.y - b.y)
}

function formatNumber(value) {
  return Number(Number(value || 0).toFixed(2))
}

function formatPoint(value) {
  return '(' + formatNumber(value.x) + ', ' + formatNumber(value.y) + ')'
}

function isComplete(toolId, draft) {
  return PLACE_ORDER[toolId].every(key => Boolean(draft?.[key])) || toolId === 'cone'
}

function objectFor(toolId, draft) {
  if (!draft || !isComplete(toolId, draft)) return null
  const object = createObject(TOOL_MAP[toolId].command)
  object.name = toolId === 'cone' ? 'N' : toolId
  if (toolId === 'arc') {
    object.values = {
      ...object.values,
      A: [draft.A.x, draft.A.y],
      O: [draft.O.x, draft.O.y],
      B: [draft.B.x, draft.B.y],
      radius: Math.max(.1, distance(draft.O, draft.A)),
      stroke: '#3576c6',
      fill: 'none',
    }
  }
  if (toolId === 'triangle') {
    object.values = {
      ...object.values,
      A: [draft.A.x, draft.A.y],
      B: [draft.B.x, draft.B.y],
      C: [draft.C.x, draft.C.y],
    }
  }
  if (toolId === 'circle') {
    object.values = {
      ...object.values,
      center: [draft.center.x, draft.center.y],
      radius: Math.max(.1, distance(draft.center, draft.rim)),
      label: 'O',
    }
  }
  if (toolId === 'cone') {
    object.values = {
      ...object.values,
      radius: Math.max(.1, distance(draft.base, draft.rim)),
      height: Math.max(.1, Math.abs(draft.apex.y - draft.base.y)),
      center: [draft.base.x, draft.base.y, 0],
      stroke: '#3576c6',
      fill: 'none',
      'show-hidden': true,
    }
  }
  return object
}

function worldToScreen(value, width, height) {
  return {
    x: (value.x - VIEW.xmin) / (VIEW.xmax - VIEW.xmin) * width,
    y: (VIEW.ymax - value.y) / (VIEW.ymax - VIEW.ymin) * height,
  }
}

function screenToWorld(x, y, width, height) {
  return {
    x: VIEW.xmin + x / width * (VIEW.xmax - VIEW.xmin),
    y: VIEW.ymax - y / height * (VIEW.ymax - VIEW.ymin),
  }
}

function handlesFor(toolId, draft) {
  if (!draft) return []
  if (toolId === 'arc') return [
    draft.A && { key: 'A', label: 'A', point: draft.A, color: '#d9772f' },
    draft.O && { key: 'O', label: 'O', point: draft.O, color: '#078e69' },
    draft.B && { key: 'B', label: 'B', point: draft.B, color: '#d9772f' },
  ].filter(Boolean)
  if (toolId === 'triangle') return [
    draft.A && { key: 'A', label: 'A', point: draft.A, color: '#3576c6' },
    draft.B && { key: 'B', label: 'B', point: draft.B, color: '#3576c6' },
    draft.C && { key: 'C', label: 'C', point: draft.C, color: '#078e69' },
  ].filter(Boolean)
  if (toolId === 'circle') return [
    draft.center && { key: 'center', label: 'O', point: draft.center, color: '#078e69' },
    draft.rim && { key: 'rim', label: 'R', point: draft.rim, color: '#d9772f' },
  ].filter(Boolean)
  return [
    draft.base && { key: 'base', label: 'O', point: draft.base, color: '#078e69' },
    draft.rim && { key: 'rim', label: 'R', point: draft.rim, color: '#d9772f' },
    draft.apex && { key: 'apex', label: 'S', point: draft.apex, color: '#7656bc' },
  ].filter(Boolean)
}

function drawGrid(ctx, width, height) {
  ctx.fillStyle = '#f8fcfa'
  ctx.fillRect(0, 0, width, height)
  ctx.strokeStyle = '#dcebe3'
  ctx.lineWidth = 1
  for (let x = Math.ceil(VIEW.xmin); x <= VIEW.xmax; x += 1) {
    const p = worldToScreen(point(x, 0), width, height)
    ctx.beginPath()
    ctx.moveTo(p.x, 0)
    ctx.lineTo(p.x, height)
    ctx.stroke()
  }
  for (let y = Math.ceil(VIEW.ymin); y <= VIEW.ymax; y += 1) {
    const p = worldToScreen(point(0, y), width, height)
    ctx.beginPath()
    ctx.moveTo(0, p.y)
    ctx.lineTo(width, p.y)
    ctx.stroke()
  }
  ctx.strokeStyle = '#aac8b9'
  ctx.lineWidth = 1.4
  const xAxis = worldToScreen(point(0, 0), width, height)
  ctx.beginPath()
  ctx.moveTo(0, xAxis.y)
  ctx.lineTo(width, xAxis.y)
  ctx.stroke()
  ctx.beginPath()
  ctx.moveTo(xAxis.x, 0)
  ctx.lineTo(xAxis.x, height)
  ctx.stroke()
  ctx.fillStyle = '#709587'
  ctx.font = '11px DM Mono, monospace'
  ctx.fillText('O', xAxis.x + 8, xAxis.y - 8)
}

function drawLine(ctx, a, b, width, height, color, dashed = false) {
  if (!a || !b) return
  const start = worldToScreen(a, width, height)
  const end = worldToScreen(b, width, height)
  ctx.save()
  ctx.strokeStyle = color
  ctx.lineWidth = 2
  ctx.setLineDash(dashed ? [7, 7] : [])
  ctx.beginPath()
  ctx.moveTo(start.x, start.y)
  ctx.lineTo(end.x, end.y)
  ctx.stroke()
  ctx.restore()
}

function drawHandle(ctx, handle, width, height, hovered) {
  const position = worldToScreen(handle.point, width, height)
  ctx.save()
  ctx.shadowColor = 'rgba(30, 70, 52, .2)'
  ctx.shadowBlur = 8
  ctx.fillStyle = '#fff'
  ctx.beginPath()
  ctx.arc(position.x, position.y, hovered ? 10 : 8, 0, Math.PI * 2)
  ctx.fill()
  ctx.shadowBlur = 0
  ctx.lineWidth = hovered ? 3 : 2
  ctx.strokeStyle = handle.color
  ctx.stroke()
  ctx.fillStyle = handle.color
  ctx.beginPath()
  ctx.arc(position.x, position.y, 3, 0, Math.PI * 2)
  ctx.fill()
  ctx.font = '800 12px Manrope, sans-serif'
  ctx.fillText(handle.label, position.x + 12, position.y - 10)
  ctx.restore()
}

function drawScene(canvas, toolId, draft, hoveredHandle) {
  if (!canvas) return
  const rect = canvas.getBoundingClientRect()
  if (!rect.width || !rect.height) return
  const ratio = window.devicePixelRatio || 1
  canvas.width = Math.round(rect.width * ratio)
  canvas.height = Math.round(rect.height * ratio)
  const ctx = canvas.getContext('2d')
  ctx.setTransform(ratio, 0, 0, ratio, 0, 0)
  const width = rect.width
  const height = rect.height
  drawGrid(ctx, width, height)

  if (toolId === 'arc') {
    const { A, O, B } = draft
    drawLine(ctx, O, A, width, height, '#c3d4cc', true)
    drawLine(ctx, O, B, width, height, '#c3d4cc', true)
    if (A && O) {
      const center = worldToScreen(O, width, height)
      const startPoint = worldToScreen(A, width, height)
      const endPoint = B ? worldToScreen(B, width, height) : null
      const radius = Math.hypot(startPoint.x - center.x, startPoint.y - center.y)
      const start = Math.atan2(startPoint.y - center.y, startPoint.x - center.x)
      const end = endPoint ? Math.atan2(endPoint.y - center.y, endPoint.x - center.x) : start + Math.PI * .65
      let delta = ((end - start + Math.PI * 3) % (Math.PI * 2)) - Math.PI
      if (Math.abs(delta) < .05) delta = Math.PI * .5
      ctx.save()
      ctx.strokeStyle = '#d9772f'
      ctx.lineWidth = 3
      ctx.beginPath()
      ctx.arc(center.x, center.y, radius, start, start + delta, delta < 0)
      ctx.stroke()
      ctx.restore()
    }
  }

  if (toolId === 'triangle') {
    const { A, B, C } = draft
    if (A && B) drawLine(ctx, A, B, width, height, '#3576c6')
    if (B && C) drawLine(ctx, B, C, width, height, '#3576c6')
    if (C && A) drawLine(ctx, C, A, width, height, '#3576c6')
    if (A && B && C) {
      const points = [A, B, C].map(value => worldToScreen(value, width, height))
      ctx.save()
      ctx.fillStyle = 'rgba(53, 118, 198, .07)'
      ctx.beginPath()
      ctx.moveTo(points[0].x, points[0].y)
      points.slice(1).forEach(value => ctx.lineTo(value.x, value.y))
      ctx.closePath()
      ctx.fill()
      ctx.restore()
    }
  }

  if (toolId === 'circle') {
    const { center, rim } = draft
    if (center && rim) {
      const O = worldToScreen(center, width, height)
      const R = worldToScreen(rim, width, height)
      const radius = Math.hypot(R.x - O.x, R.y - O.y)
      ctx.save()
      ctx.strokeStyle = '#3576c6'
      ctx.lineWidth = 3
      ctx.beginPath()
      ctx.arc(O.x, O.y, radius, 0, Math.PI * 2)
      ctx.stroke()
      ctx.restore()
      drawLine(ctx, center, rim, width, height, '#d8b58b', true)
    }
  }

  if (toolId === 'cone') {
    const { base, rim, apex } = draft
    if (base && rim && apex) {
      const center = worldToScreen(base, width, height)
      const edge = worldToScreen(rim, width, height)
      const top = worldToScreen(apex, width, height)
      const radius = Math.abs(edge.x - center.x)
      const ellipseY = Math.max(12, radius * .28)
      ctx.save()
      ctx.fillStyle = 'rgba(118, 86, 188, .08)'
      ctx.strokeStyle = '#7656bc'
      ctx.lineWidth = 2.4
      ctx.beginPath()
      ctx.moveTo(top.x, top.y)
      ctx.lineTo(center.x + radius, center.y)
      ctx.lineTo(center.x - radius, center.y)
      ctx.closePath()
      ctx.fill()
      ctx.stroke()
      ctx.setLineDash([7, 7])
      ctx.beginPath()
      ctx.ellipse(center.x, center.y, radius, ellipseY, 0, Math.PI, Math.PI * 2)
      ctx.stroke()
      ctx.setLineDash([])
      ctx.beginPath()
      ctx.ellipse(center.x, center.y, radius, ellipseY, 0, 0, Math.PI)
      ctx.stroke()
      ctx.restore()
      drawLine(ctx, base, rim, width, height, '#d8b58b', true)
    }
  }

  handlesFor(toolId, draft).forEach(handle => drawHandle(ctx, handle, width, height, handle.key === hoveredHandle))
}

function nearestHandle(toolId, draft, world, width, height) {
  const screen = worldToScreen(world, width, height)
  return handlesFor(toolId, draft)
    .map(handle => {
      const p = worldToScreen(handle.point, width, height)
      return { ...handle, distance: Math.hypot(p.x - screen.x, p.y - screen.y) }
    })
    .sort((a, b) => a.distance - b.distance)[0]
}

function App() {
  const saved = useMemo(readSavedProject, [])
  const [projectName, setProjectName] = useState(saved.name)
  const [toolId, setToolId] = useState(saved.toolId)
  const [drafts, setDrafts] = useState(saved.drafts)
  const [placing, setPlacing] = useState(false)
  const [hoveredHandle, setHoveredHandle] = useState(null)
  const [draggingHandle, setDraggingHandle] = useState(null)
  const [showCode, setShowCode] = useState(false)
  const [toast, setToast] = useState('')
  const canvasRef = useRef(null)
  const dragRef = useRef(null)

  const tool = TOOL_MAP[toolId]
  const draft = drafts[toolId]
  const currentObject = objectFor(toolId, draft)
  const source = currentObject ? buildSource([currentObject]) : '// Hãy đặt đủ các điểm trên canvas để sinh mã Typst.'
  const placeKeys = PLACE_ORDER[toolId]
  const nextPlaceKey = placeKeys.find(key => !draft?.[key])
  const ready = isComplete(toolId, draft)

  const notify = useCallback(message => {
    setToast(message)
    window.clearTimeout(notify.timer)
    notify.timer = window.setTimeout(() => setToast(''), 2200)
  }, [])

  useEffect(() => {
    localStorage.setItem(STORAGE_KEY, JSON.stringify({ name: projectName, toolId, drafts }))
  }, [projectName, toolId, drafts])

  useEffect(() => {
    const draw = () => drawScene(canvasRef.current, toolId, drafts[toolId], hoveredHandle)
    const canvas = canvasRef.current
    if (!canvas) return undefined
    const observer = new ResizeObserver(draw)
    observer.observe(canvas)
    window.addEventListener('resize', draw)
    draw()
    return () => {
      observer.disconnect()
      window.removeEventListener('resize', draw)
    }
  }, [toolId, drafts, hoveredHandle])

  const switchTool = useCallback(nextToolId => {
    setToolId(nextToolId)
    setPlacing(false)
    setDraggingHandle(null)
    setHoveredHandle(null)
    setShowCode(false)
  }, [])

  const updatePoint = useCallback((key, value) => {
    setDrafts(current => {
      const nextDraft = { ...current[toolId], [key]: value }
      if (toolId === 'cone') {
        if (key === 'apex') nextDraft.apex = point(nextDraft.base.x, Math.max(nextDraft.base.y + .5, value.y))
        if (key === 'rim') nextDraft.rim = point(value.x, nextDraft.base.y)
        if (key === 'base') {
          nextDraft.base = value
          nextDraft.rim = point(nextDraft.rim.x, value.y)
          nextDraft.apex = point(value.x, nextDraft.apex.y)
        }
      }
      return { ...current, [toolId]: nextDraft }
    })
  }, [toolId])

  const pointFromEvent = useCallback(event => {
    const rect = event.currentTarget.getBoundingClientRect()
    const x = clamp(event.clientX - rect.left, 0, rect.width)
    const y = clamp(event.clientY - rect.top, 0, rect.height)
    return screenToWorld(x, y, rect.width, rect.height)
  }, [])

  const handlePointerDown = useCallback(event => {
    const canvas = event.currentTarget
    const rect = canvas.getBoundingClientRect()
    const world = pointFromEvent(event)
    const hit = nearestHandle(toolId, drafts[toolId], world, rect.width, rect.height)
    if (hit && hit.distance < 24) {
      dragRef.current = { key: hit.key, pointerId: event.pointerId }
      setDraggingHandle(hit.key)
      setHoveredHandle(hit.key)
      canvas.setPointerCapture(event.pointerId)
      return
    }
    if (placing && nextPlaceKey) {
      updatePoint(nextPlaceKey, world)
      const left = placeKeys.filter(key => key !== nextPlaceKey && !drafts[toolId]?.[key])
      setPlacing(left.length > 0)
    }
  }, [drafts, nextPlaceKey, placing, placeKeys, pointFromEvent, toolId, updatePoint])

  const handlePointerMove = useCallback(event => {
    const world = pointFromEvent(event)
    const canvas = event.currentTarget
    const rect = canvas.getBoundingClientRect()
    if (dragRef.current?.pointerId === event.pointerId) {
      updatePoint(dragRef.current.key, world)
      return
    }
    const hit = nearestHandle(toolId, drafts[toolId], world, rect.width, rect.height)
    setHoveredHandle(hit && hit.distance < 24 ? hit.key : null)
  }, [drafts, pointFromEvent, toolId, updatePoint])

  const handlePointerUp = useCallback(event => {
    if (dragRef.current?.pointerId === event.pointerId) {
      dragRef.current = null
      setDraggingHandle(null)
      event.currentTarget.releasePointerCapture?.(event.pointerId)
    }
  }, [])

  const resetTool = useCallback(() => {
    setDrafts(current => ({ ...current, [toolId]: defaultDrafts()[toolId] }))
    setPlacing(false)
    setHoveredHandle(null)
    notify('Đã đặt lại hình mẫu')
  }, [notify, toolId])

  const startFromBlank = useCallback(() => {
    if (toolId === 'cone') {
      resetTool()
      return
    }
    setDrafts(current => ({ ...current, [toolId]: emptyDraft(toolId) }))
    setPlacing(true)
    setHoveredHandle(null)
    notify('Bắt đầu đặt điểm trên canvas')
  }, [notify, resetTool, toolId])

  const flipArc = useCallback(() => {
    if (toolId !== 'arc') return
    setDrafts(current => ({ ...current, arc: { ...current.arc, A: current.arc.B, B: current.arc.A } }))
    notify('Đã đổi chiều cung A ↔ B')
  }, [notify, toolId])

  const copySource = useCallback(async () => {
    await navigator.clipboard?.writeText(source)
    notify('Đã sao chép mã Typst')
  }, [notify, source])

  const exportTypst = useCallback(() => {
    const blob = new Blob([source], { type: 'text/plain;charset=utf-8' })
    const url = URL.createObjectURL(blob)
    const anchor = document.createElement('a')
    anchor.href = url
    anchor.download = (projectName || 'sang-math-visual').replace(/\s+/g, '-') + '.typ'
    anchor.click()
    URL.revokeObjectURL(url)
    notify('Đã tải mã .typ')
  }, [notify, projectName, source])

  const instruction = placing && nextPlaceKey
    ? 'Click vào canvas để đặt ' + (nextPlaceKey === 'center' ? 'tâm O' : 'điểm ' + nextPlaceKey) + '.'
    : toolId === 'arc'
      ? 'Kéo A, O, B để chỉnh cung. Thứ tự A → O → B quyết định hình học.'
      : toolId === 'triangle'
        ? 'Kéo A, B, C để thay đổi tam giác trực tiếp.'
        : toolId === 'circle'
          ? 'Kéo O để dịch tâm hoặc R để đổi bán kính.'
          : 'Kéo O, R hoặc S để thay đổi hình nón phối cảnh.'

  const summary = toolId === 'arc' && draft.A && draft.O && draft.B
    ? 'r = ' + formatNumber(distance(draft.O, draft.A))
    : toolId === 'circle' && draft.center && draft.rim
      ? 'r = ' + formatNumber(distance(draft.center, draft.rim))
      : toolId === 'cone' && draft.base && draft.rim && draft.apex
        ? 'r = ' + formatNumber(distance(draft.base, draft.rim)) + ' · h = ' + formatNumber(Math.abs(draft.apex.y - draft.base.y))
        : ready ? 'Đã đủ điểm' : 'Đang chờ điểm'

  return (
    <div className="graphics-studio visual-studio">
      <header className="topbar topbar--visual">
        <div className="brand">
          <div className="brand-mark"><span>∿</span><i>✦</i></div>
          <div><strong>Sang Math</strong><small>VISUAL GRAPHICS</small></div>
        </div>
        <div className="project-name"><span>BẢN VẼ</span><input value={projectName} onChange={event => setProjectName(event.target.value)} aria-label="Tên bản vẽ" /></div>
        <div className="top-actions">
          <span className="live-chip"><i />Vẽ trực tiếp · không chờ WASM</span>
          <button className="button button--soft" onClick={() => setShowCode(value => !value)}>〈/〉 Mã</button>
          <button className="button button--primary" onClick={exportTypst} disabled={!ready}>Tải .typ <b>↓</b></button>
        </div>
      </header>

      <main className="visual-workspace">
        <aside className="tool-rail panel">
          <div className="tool-rail-head"><span className="eyebrow">BƯỚC 1</span><h2>Chọn hình muốn vẽ</h2><p>Chọn một hình, sau đó đặt hoặc kéo điểm ngay trên canvas.</p></div>
          <div className="tool-list">
            {TOOLS.map(item => <button key={item.id} className={'tool-card ' + (item.id === toolId ? 'is-active' : '')} onClick={() => switchTool(item.id)}><span className={'tool-card__icon tool-card__icon--' + item.tone}>{item.icon}</span><span><strong>{item.name}</strong><small>{item.short} · {item.description}</small></span><b>→</b></button>)}
          </div>
          <div className="tool-rail-tip"><span>✦</span><p>Không cần nhớ tham số API. Hình học được tạo từ các điểm bạn đặt.</p></div>
          <div className="tool-rail-count"><span>{COMMANDS.length}</span> lệnh trong package · 4 luồng trực quan đầu tiên</div>
        </aside>

        <section className="visual-editor">
          <div className="editor-head">
            <div><span className="eyebrow">BƯỚC 2 · CANVAS TƯƠNG TÁC</span><h1>{tool.name} <em>{tool.short}</em></h1><p>{tool.description}</p></div>
            <div className="editor-actions"><button className="button button--soft" onClick={startFromBlank}>＋ Vẽ từ đầu</button>{toolId === 'arc' && <button className="button button--soft" onClick={flipArc}>Đổi chiều</button>}<button className="button button--soft" onClick={resetTool}>↺ Đặt lại</button></div>
          </div>
          <div className={'drawing-stage ' + (placing ? 'drawing-stage--placing' : '')}>
            <canvas ref={canvasRef} onPointerDown={handlePointerDown} onPointerMove={handlePointerMove} onPointerUp={handlePointerUp} onPointerCancel={handlePointerUp} onPointerLeave={() => { if (!draggingHandle) setHoveredHandle(null) }} aria-label="Canvas vẽ hình trực quan" />
            <div className="stage-status"><span className={ready ? 'is-ready' : 'is-waiting'} />{instruction}</div>
            <div className="stage-coordinates">{draggingHandle ? 'Đang kéo ' + draggingHandle : 'Di chuột lên điểm để kéo'}</div>
          </div>
          <div className="editor-footer"><div className="stepper">{tool.guide.map((step, index) => <div key={step} className={(index < placeKeys.findIndex(key => !draft?.[key]) || ready ? 'is-done ' : '') + (index === placeKeys.findIndex(key => !draft?.[key]) && !ready ? 'is-current' : '')}><b>{String(index + 1).padStart(2, '0')}</b><span>{step}</span></div>)}</div><div className="shape-summary"><span className="status-dot" />{summary}</div></div>
        </section>

        <aside className={'explain-panel panel ' + (showCode ? 'explain-panel--code' : '')}>
          <div className="explain-tabs"><button className={!showCode ? 'is-active' : ''} onClick={() => setShowCode(false)}>Cầm tay chỉ việc</button><button className={showCode ? 'is-active' : ''} onClick={() => setShowCode(true)}>Mã Typst</button></div>
          {!showCode ? <div className="explain-scroll"><div className="guide-hero"><span>{tool.icon}</span><div><strong>{tool.name} theo cách trực quan</strong><small>{ready ? 'Hình đã sẵn sàng để xuất mã.' : 'Làm từng bước trên canvas.'}</small></div></div><h3>Làm theo 4 bước</h3><ol className="visual-steps">{tool.guide.map((step, index) => <li key={step} className={index < (ready ? 99 : Math.max(0, placeKeys.findIndex(key => !draft?.[key]))) ? 'is-done' : ''}><b>{String(index + 1).padStart(2, '0')}</b><span>{step}</span></li>)}</ol><div className="algorithm-card"><span>⌁</span><div><strong>Studio tự làm phần khó</strong><p>{tool.algorithm}</p></div></div><div className="point-legend"><span className="eyebrow">TAY NẮM TRÊN CANVAS</span>{handlesFor(toolId, draft).map(handle => <div key={handle.key}><i style={{ background: handle.color }} /> <b>{handle.label}</b><code>{formatPoint(handle.point)}</code></div>)}</div></div> : <div className="code-scroll"><div className="code-heading"><span className="eyebrow">MÃ SINH TỰ ĐỘNG</span><strong>{ready ? 'Mã theo đúng hình đang vẽ' : 'Đặt đủ điểm để sinh mã'}</strong></div><pre>{source}</pre><div className="code-actions"><button className="button button--primary" onClick={copySource} disabled={!ready}>Sao chép mã</button><button className="button button--soft" onClick={exportTypst} disabled={!ready}>Tải .typ</button></div><div className="code-note"><span>ⓘ</span><p>Thay đổi trên canvas sẽ cập nhật mã. Bạn không cần tự tính cung, bán kính hay tọa độ.</p></div></div>}
        </aside>
      </main>
      <footer className="statusbar"><span><i className="status-dot" /> Tự lưu trên thiết bị này</span><span>Package <b>sang-math-graphics:0.1.0</b></span><span>Không máy chủ · miễn phí</span><button onClick={() => setShowCode(true)}>Xem mã Typst →</button></footer>
      {toast && <div className="toast">✓ <span>{toast}</span></div>}
    </div>
  )
}

export default App

