import {
  CONTRACT_VERSION,
  SYSTEM_CONTRACT,
  buildRepairPrompt,
  buildUserPrompt,
  stripCodeFences,
  validateSangMath,
} from './ai-sang-math-contract.js'

const STUDIO_ORIGIN = 'https://typstconichub.pages.dev'
const PROVIDERS = {
  gemini: {
    defaultModel: 'gemini-3.5-flash',
    models: ['gemini-3.5-flash', 'gemini-3.1-pro-preview'],
    help: 'Gemini: tạo key tại Google AI Studio. Danh sách model có thể tải trực tiếp từ API sau khi nhập key.',
  },
  openrouter: {
    defaultModel: '~openai/gpt-latest',
    models: ['~openai/gpt-latest', 'google/gemini-3.5-flash', 'anthropic/claude-haiku-4.5'],
    help: 'OpenRouter: một key dùng được nhiều hãng. Nên đặt giới hạn tín dụng cho key dành riêng cho ConicTypst.',
  },
}

const $ = selector => document.querySelector(selector)
let mode = 'new'
let lastValidation = null
let toastTimer = null

document.addEventListener('DOMContentLoaded', () => {
  $('#contractLabel').textContent = CONTRACT_VERSION
  $('#auditContract').textContent = CONTRACT_VERSION
  bindEvents()
  applyProvider($('#provider').value)
  validateCurrent(false)
})

function bindEvents() {
  $('#provider').addEventListener('change', event => applyProvider(event.target.value))
  $('#apiKey').addEventListener('input', saveKey)
  $('#rememberKey').addEventListener('change', saveKey)
  $('#toggleKey').addEventListener('click', toggleKeyVisibility)
  $('#forgetKey').addEventListener('click', forgetKey)
  $('#loadModels').addEventListener('click', loadModels)
  $('#generateButton').addEventListener('click', runGeneration)
  $('#validateButton').addEventListener('click', () => validateCurrent(true))
  $('#repairButton').addEventListener('click', repairCurrent)
  $('#copyButton').addEventListener('click', copyResult)
  $('#downloadButton').addEventListener('click', downloadResult)
  $('#studioButton').addEventListener('click', openInStudio)
  $('#resultCode').addEventListener('input', debounce(() => validateCurrent(false), 350))

  document.querySelectorAll('.mode-tab').forEach(button => {
    button.addEventListener('click', () => switchMode(button.dataset.mode))
  })
}

function storageKey(provider) {
  return `conic_ai_sang_math_key_${provider}`
}

function applyProvider(provider) {
  const config = PROVIDERS[provider]
  const localKey = localStorage.getItem(storageKey(provider)) || ''
  const sessionKey = sessionStorage.getItem(storageKey(provider)) || ''
  $('#apiKey').value = localKey || sessionKey
  $('#rememberKey').checked = Boolean(localKey)
  $('#model').value = localStorage.getItem(`conic_ai_sang_math_model_${provider}`) || config.defaultModel
  $('#providerHelp').textContent = config.help
  fillModelSuggestions(config.models)
}

function saveKey() {
  const provider = $('#provider').value
  const key = $('#apiKey').value.trim()
  const name = storageKey(provider)
  if ($('#rememberKey').checked) {
    localStorage.setItem(name, key)
    sessionStorage.removeItem(name)
  } else {
    sessionStorage.setItem(name, key)
    localStorage.removeItem(name)
  }
}

function forgetKey() {
  const provider = $('#provider').value
  localStorage.removeItem(storageKey(provider))
  sessionStorage.removeItem(storageKey(provider))
  $('#apiKey').value = ''
  $('#rememberKey').checked = false
  toast('Đã xóa API key khỏi trình duyệt.', 'success')
}

function toggleKeyVisibility() {
  const input = $('#apiKey')
  input.type = input.type === 'password' ? 'text' : 'password'
  $('#toggleKey').textContent = input.type === 'password' ? 'Hiện' : 'Ẩn'
}

function fillModelSuggestions(models) {
  $('#modelSuggestions').innerHTML = [...new Set(models)].map(model => `<option value="${escapeHtml(model)}"></option>`).join('')
}

async function loadModels() {
  const provider = $('#provider').value
  const apiKey = $('#apiKey').value.trim()
  if (!apiKey) return toast('Hãy nhập API key trước khi tải danh sách model.', 'error')
  const button = $('#loadModels')
  const old = button.textContent
  button.disabled = true
  button.textContent = 'Đang tải…'
  try {
    let models = []
    if (provider === 'gemini') {
      const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models?key=${encodeURIComponent(apiKey)}`)
      const data = await readJsonResponse(response)
      models = (data.models || [])
        .filter(model => model.supportedGenerationMethods?.includes('generateContent'))
        .map(model => model.name.replace(/^models\//, ''))
    } else {
      const response = await fetch('https://openrouter.ai/api/v1/models', {
        headers: { Authorization: `Bearer ${apiKey}` },
      })
      const data = await readJsonResponse(response)
      models = (data.data || []).map(model => model.id)
    }
    if (!models.length) throw new Error('Nhà cung cấp không trả về model dùng được.')
    fillModelSuggestions(models)
    toast(`Đã nạp ${models.length} model. Gõ để tìm trong ô Model.`, 'success')
  } catch (error) {
    toast(`Không tải được model: ${error.message}`, 'error')
  } finally {
    button.disabled = false
    button.textContent = old
  }
}

function switchMode(nextMode) {
  mode = nextMode
  document.querySelectorAll('.mode-tab').forEach(button => button.classList.toggle('active', button.dataset.mode === mode))
  $('#sourceGroup').classList.toggle('hidden', mode !== 'convert')
  if (mode === 'vdc') {
    $('#difficulty').value = '100% VDC — phân hóa nhóm 9–10 điểm'
    if (totalExpected() === 22) {
      $('#countTn').value = 2
      $('#countDs').value = 0
      $('#countTln').value = 0
      $('#countTl').value = 0
    }
  }
}

function getOptions() {
  const numeric = id => Math.max(0, Math.min(50, Number.parseInt($(id).value, 10) || 0))
  return {
    mode,
    title: $('#examTitle').value.trim() || 'ĐỀ KIỂM TRA',
    school: $('#school').value.trim() || 'TRƯỜNG THPT ................................',
    grade: $('#grade').value,
    duration: $('#duration').value.trim() || '90 phút',
    code: $('#examCode').value.trim() || '101',
    theme: $('#theme').value.trim() || 'teal-pro',
    topic: $('#topic').value.trim(),
    difficulty: $('#difficulty').value.trim() || 'Theo ma trận giáo viên',
    notes: $('#notes').value.trim(),
    extraImports: $('#extraImports').value.trim(),
    source: $('#sourceText').value.trim(),
    tn: numeric('#countTn'),
    ds: numeric('#countDs'),
    tln: numeric('#countTln'),
    tl: numeric('#countTl'),
  }
}

function totalExpected() {
  const options = getOptions()
  return options.tn + options.ds + options.tln + options.tl
}

function validateInputs(options) {
  if (!$('#apiKey').value.trim()) return 'Bạn chưa nhập API key.'
  if (!$('#model').value.trim()) return 'Bạn chưa chọn hoặc nhập model.'
  if (!options.topic && options.mode !== 'convert') return 'Hãy nhập chủ đề hoặc phạm vi kiến thức.'
  if (options.mode === 'convert' && !options.source) return 'Hãy dán nội dung nguồn/OCR cần chuyển.'
  if (options.tn + options.ds + options.tln + options.tl === 0) return 'Ma trận phải có ít nhất một câu.'
  return ''
}

async function runGeneration() {
  const options = getOptions()
  const inputError = validateInputs(options)
  if (inputError) return toast(inputError, 'error')
  saveKey()
  localStorage.setItem(`conic_ai_sang_math_model_${$('#provider').value}`, $('#model').value.trim())
  setBusy(true, 'Đang gọi model…', `Đang gửi ${CONTRACT_VERSION}`)
  try {
    let code = stripCodeFences(await callProvider(SYSTEM_CONTRACT, buildUserPrompt(options)))
    $('#resultCode').value = code
    let validation = renderValidation(validateSangMath(code, options))

    if (!validation.valid && $('#autoRepair').checked) {
      for (let attempt = 1; attempt <= 2 && !validation.valid; attempt += 1) {
        setProgress(`Đang tự sửa vòng ${attempt}/2…`, `${validation.errors.length} lỗi cấu trúc cần model sửa`)
        code = stripCodeFences(await callProvider(SYSTEM_CONTRACT, buildRepairPrompt(code, validation, options)))
        $('#resultCode').value = code
        validation = renderValidation(validateSangMath(code, options))
      }
    }

    if (validation.valid) toast('Mã đã vượt qua hợp đồng cấu trúc sang-math 1.0.1.', 'success')
    else toast(`Còn ${validation.errors.length} lỗi. Xem bảng kiểm định hoặc bấm “Nhờ AI sửa lỗi”.`, 'error')
  } catch (error) {
    toast(error.message, 'error')
  } finally {
    setBusy(false)
  }
}

async function repairCurrent() {
  const options = getOptions()
  const code = $('#resultCode').value.trim()
  if (!code) return toast('Chưa có mã để sửa.', 'error')
  if (!$('#apiKey').value.trim() || !$('#model').value.trim()) return toast('Cần API key và model để tự sửa.', 'error')
  const validation = validateSangMath(code, options)
  if (validation.valid) return toast('Mã hiện tại đã đạt validator, không cần sửa cấu trúc.', 'success')
  setBusy(true, 'Đang nhờ AI sửa mã…', `${validation.errors.length} lỗi được gửi lại cho model`)
  try {
    const repaired = stripCodeFences(await callProvider(SYSTEM_CONTRACT, buildRepairPrompt(code, validation, options)))
    $('#resultCode').value = repaired
    const repairedValidation = renderValidation(validateSangMath(repaired, options))
    toast(repairedValidation.valid ? 'Đã sửa và vượt qua validator.' : `Đã sửa nhưng còn ${repairedValidation.errors.length} lỗi.`, repairedValidation.valid ? 'success' : 'error')
  } catch (error) {
    toast(error.message, 'error')
  } finally {
    setBusy(false)
  }
}

async function callProvider(systemPrompt, userPrompt) {
  const provider = $('#provider').value
  const apiKey = $('#apiKey').value.trim()
  const model = $('#model').value.trim()
  if (provider === 'gemini') return callGemini(apiKey, model, systemPrompt, userPrompt)
  return callOpenRouter(apiKey, model, systemPrompt, userPrompt)
}

async function callGemini(apiKey, model, systemPrompt, userPrompt) {
  const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/${encodeURIComponent(model)}:generateContent?key=${encodeURIComponent(apiKey)}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      system_instruction: { parts: [{ text: systemPrompt }] },
      contents: [{ role: 'user', parts: [{ text: userPrompt }] }],
      generationConfig: { temperature: 0.1, maxOutputTokens: 32768 },
    }),
  })
  const data = await readJsonResponse(response)
  const text = (data.candidates?.[0]?.content?.parts || []).map(part => part.text || '').join('\n').trim()
  if (!text) throw new Error(data.promptFeedback?.blockReason ? `Gemini chặn yêu cầu: ${data.promptFeedback.blockReason}` : 'Gemini không trả nội dung.')
  return text
}

async function callOpenRouter(apiKey, model, systemPrompt, userPrompt) {
  const response = await fetch('https://openrouter.ai/api/v1/chat/completions', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
      'HTTP-Referer': location.origin,
      'X-OpenRouter-Title': 'ConicTypst AI sang-math',
    },
    body: JSON.stringify({
      model,
      messages: [
        { role: 'system', content: systemPrompt },
        { role: 'user', content: userPrompt },
      ],
      temperature: 0.1,
      max_tokens: 32768,
    }),
  })
  const data = await readJsonResponse(response)
  const content = data.choices?.[0]?.message?.content
  if (typeof content === 'string' && content.trim()) return content
  if (Array.isArray(content)) return content.map(item => item.text || item.content || '').join('\n')
  throw new Error(data.error?.message || 'OpenRouter không trả nội dung.')
}

async function readJsonResponse(response) {
  let data
  try {
    data = await response.json()
  } catch {
    throw new Error(`API trả HTTP ${response.status} nhưng không có JSON hợp lệ.`)
  }
  if (!response.ok) throw new Error(data.error?.message || data.message || `API trả HTTP ${response.status}.`)
  return data
}

function validateCurrent(notify = false) {
  const validation = renderValidation(validateSangMath($('#resultCode').value, getOptions()))
  if (notify) toast(validation.valid ? 'Mã đạt hợp đồng cấu trúc.' : `Phát hiện ${validation.errors.length} lỗi.`, validation.valid ? 'success' : 'error')
  return validation
}

function renderValidation(validation) {
  lastValidation = validation
  const badge = $('#validationBadge')
  badge.className = `validation-badge ${validation.valid ? 'valid' : validation.code ? 'invalid' : 'idle'}`
  badge.innerHTML = `<span></span> ${validation.valid ? 'Đạt cấu trúc' : validation.code ? `${validation.errors.length} lỗi` : 'Chưa kiểm tra'}`

  const types = ['tn', 'ds', 'tln', 'tl']
  $('#statGrid').innerHTML = types.map(type => `<div><strong>${validation.stats[type]}</strong><span>${type === 'ds' ? 'Đ/S' : type.toUpperCase()}</span></div>`).join('')

  const issues = [
    ...validation.errors.map(item => ({ ...item, severity: 'error' })),
    ...validation.warnings.map(item => ({ ...item, severity: 'warning' })),
  ]
  if (!validation.code) {
    $('#issueList').innerHTML = '<div class="empty-audit"><span>◎</span><p>Sinh đề hoặc dán mã Typst để bắt đầu kiểm tra.</p></div>'
  } else if (!issues.length) {
    $('#issueList').innerHTML = '<div class="empty-audit"><span style="color:#10b981">✓</span><p style="color:#047857;font-weight:800">Không phát hiện lỗi cấu trúc/API.</p></div>'
  } else {
    $('#issueList').innerHTML = issues.map(item => `
      <div class="issue ${item.severity}">
        <span class="issue-icon">${item.severity === 'error' ? '!' : '⚠'}</span>
        <div><strong>${escapeHtml(item.message)}</strong><small>${escapeHtml(item.code)}</small></div>
        <span class="issue-line">Dòng ~${item.line}</span>
      </div>`).join('')
  }
  return validation
}

async function copyResult() {
  const code = $('#resultCode').value.trim()
  if (!code) return toast('Chưa có mã để sao chép.', 'error')
  await copyText(code)
  toast('Đã sao chép mã Typst.', 'success')
}

function downloadResult() {
  const code = $('#resultCode').value.trim()
  if (!code) return toast('Chưa có mã để tải.', 'error')
  const blob = new Blob([code], { type: 'text/plain;charset=utf-8' })
  const link = document.createElement('a')
  link.href = URL.createObjectURL(blob)
  link.download = `de-sang-math-${safeFileName($('#examCode').value || '101')}.typ`
  link.click()
  setTimeout(() => URL.revokeObjectURL(link.href), 1000)
  toast('Đã tạo file .typ.', 'success')
}

async function openInStudio() {
  const content = $('#resultCode').value.trim()
  if (!content) return toast('Chưa có mã để mở trong Studio.', 'error')
  const requestId = `ai-exam-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`
  const payload = { requestId, name: $('#examTitle').value.trim() || 'Đề AI sang-math', content }
  const bridge = toBase64Url(JSON.stringify(payload))
  if (bridge.length > 180000) {
    await copyText(content)
    window.open(`${STUDIO_ORIGIN}/#studio`, '_blank', 'noopener')
    return toast('Mã quá lớn để chuyển tự động; đã copy và mở Studio để bạn dán.', 'error')
  }
  const studio = window.open(`${STUDIO_ORIGIN}/#studio?bridge=${encodeURIComponent(bridge)}`, '_blank', 'noopener')
  if (!studio) {
    await copyText(content)
    return toast('Trình duyệt chặn pop-up; mã đã được sao chép.', 'error')
  }
  toast('Đang chuyển file sang TypstConicHub Studio…', 'success')
}

function setBusy(busy, title = '', detail = '') {
  $('#generateButton').disabled = busy
  $('#repairButton').disabled = busy
  $('#progressBox').classList.toggle('hidden', !busy)
  if (busy) setProgress(title, detail)
}

function setProgress(title, detail) {
  $('#progressTitle').textContent = title
  $('#progressDetail').textContent = detail
}

function toast(message, type = '') {
  const node = $('#toast')
  clearTimeout(toastTimer)
  node.textContent = message
  node.className = `ai-toast show ${type}`
  toastTimer = setTimeout(() => { node.className = 'ai-toast' }, 3200)
}

function safeFileName(value) {
  return String(value).normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/[^a-zA-Z0-9_-]+/g, '-').replace(/^-|-$/g, '') || '101'
}

function toBase64Url(value) {
  const bytes = new TextEncoder().encode(value)
  let binary = ''
  for (let offset = 0; offset < bytes.length; offset += 8192) binary += String.fromCharCode(...bytes.subarray(offset, offset + 8192))
  return btoa(binary).replaceAll('+', '-').replaceAll('/', '_').replace(/=+$/g, '')
}

async function copyText(value) {
  if (navigator.clipboard?.writeText) return navigator.clipboard.writeText(value)
  const area = document.createElement('textarea')
  area.value = value
  document.body.append(area)
  area.select()
  document.execCommand('copy')
  area.remove()
}

function escapeHtml(value) {
  return String(value).replace(/[&<>'"]/g, char => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', "'": '&#39;', '"': '&quot;' })[char])
}

function debounce(fn, delay) {
  let timer
  return (...args) => {
    clearTimeout(timer)
    timer = setTimeout(() => fn(...args), delay)
  }
}
