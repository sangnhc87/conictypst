// Giải một câu bằng khóa API do giáo viên tự nhập. Khóa lưu cục bộ (localStorage của add-in / app) và chỉ gửi tới địa chỉ nhà cung cấp đã chọn.
const KEY = 'sangmath.tools.ai'

export const PROVIDERS = {
  anthropic: { name: 'Claude (Anthropic)', url: 'https://api.anthropic.com/v1/messages', model: 'claude-sonnet-5-5' },
  openai: { name: 'Tương thích OpenAI (tự nhập địa chỉ)', url: 'https://api.openai.com/v1/chat/completions', model: 'gpt-4o' },
}

const SYSTEM = 'Bạn là trợ lý của giáo viên Toán THPT Việt Nam. Giải đúng câu hỏi được đưa, trình bày lời giải ngắn gọn, từng bước, bằng tiếng Việt. ' +
  'KHÔNG dùng LaTeX hay Markdown: viết công thức bằng ký hiệu Unicode (x², √, ≤, ∫, π…). Dòng cuối ghi "Đáp án: …". Nếu đề thiếu dữ kiện hoặc có hình mà không thấy nội dung hình, hãy nói rõ.'

export function loadConfig(storage = globalThis.localStorage) {
  try { return { provider: 'anthropic', ...JSON.parse(storage.getItem(KEY) || '{}') } } catch { return { provider: 'anthropic' } }
}
export function saveConfig(cfg, storage = globalThis.localStorage) {
  try { storage.setItem(KEY, JSON.stringify(cfg)); return true } catch { return false }
}
export function clearConfig(storage = globalThis.localStorage) {
  try { storage.removeItem(KEY) } catch { /* không có */ }
}

/** Gọi API, trả về văn bản lời giải. fetchImpl chỉ để kiểm thử. */
export async function solveQuestion(question, cfg, fetchImpl = globalThis.fetch) {
  const text = String(question || '').trim()
  if (!text) throw new Error('Chưa có nội dung câu hỏi. Hãy bôi đen câu hỏi trong Word.')
  if (!cfg || !cfg.key) throw new Error('Chưa nhập khóa API. Mở "Cài đặt khóa API" bên dưới.')
  const prov = PROVIDERS[cfg.provider] || PROVIDERS.anthropic
  const url = (cfg.url || prov.url).trim()
  if (!/^https:\/\//.test(url)) throw new Error('Địa chỉ API phải bắt đầu bằng https://')
  const model = (cfg.model || prov.model).trim()
  let res
  if (cfg.provider === 'openai') {
    res = await fetchImpl(url, {
      method: 'POST',
      headers: { 'content-type': 'application/json', authorization: `Bearer ${cfg.key}` },
      body: JSON.stringify({ model, messages: [{ role: 'system', content: SYSTEM }, { role: 'user', content: text }] }),
    })
  } else {
    res = await fetchImpl(url, {
      method: 'POST',
      headers: { 'content-type': 'application/json', 'x-api-key': cfg.key, 'anthropic-version': '2023-06-01', 'anthropic-dangerous-direct-browser-access': 'true' },
      body: JSON.stringify({ model, max_tokens: 2000, system: SYSTEM, messages: [{ role: 'user', content: text }] }),
    })
  }
  const body = await res.json().catch(() => ({}))
  if (!res.ok) {
    const msg = body?.error?.message || `HTTP ${res.status}`
    throw new Error(res.status === 401 ? 'Khóa API không đúng hoặc đã hết hạn.' : `API báo lỗi: ${msg}`)
  }
  const out = cfg.provider === 'openai' ? body?.choices?.[0]?.message?.content : (body?.content || []).map(c => c.text || '').join('')
  if (!out || !out.trim()) throw new Error('API không trả lời nội dung nào.')
  return out.trim()
}
