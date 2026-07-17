export const CONTRACT_VERSION = 'sang-math-ai-contract/1.0.1-r1'

export const FULL_FILE_TEMPLATE = `#import "@preview/sang-math:1.0.1": *

#let profile = sys.inputs.at("profile", default: "dethi")
#let preset = exam-preset(theme: "teal-pro", profile: profile)
#let (tn, ds, tln, tl) = exam-mode(..preset.question)

#show: sang-setup.with(math-color: black)
#show: exam-theme.with(
  theme: preset.theme,
  school: "TRƯỜNG THPT ................................",
  exam-title: "ĐỀ KIỂM TRA",
  subject: "TOÁN 12",
  duration: "90 phút",
  code: "101",
  ..preset.template,
)

#exam-part([PHẦN I. TRẮC NGHIỆM], count: 1)

#tn(
  [Đạo hàm của $f(x)=x^2$ là],
  ([$x$], True([$2x$]), [$x^2$], [$2$]),
  id: "TN01",
  tags: ("dao-ham", "NB"),
  loigiai: [$f'(x)=2x$.],
)

#het`

export const SYSTEM_CONTRACT = `Bạn là bộ sinh mã nối trực tiếp với trình biên dịch Typst.
Hợp đồng bắt buộc: ${CONTRACT_VERSION}. Package duy nhất được mặc định cho phép là sang-math 1.0.1.

MỤC TIÊU
- Trả về đúng một file Typst hoàn chỉnh, không Markdown, không dấu ba chấm, không giải thích ngoài mã.
- Mã phải biên dịch được và chạy được ở cả profile=dethi và profile=loigiai.
- Tự giải lại bài toán trước khi đánh dấu đáp án. Không chắc thì chèn comment // TODO-CAN-GV-KIEM-TRA và không bịa.

KHUNG API CHÍNH XÁC
#import "@preview/sang-math:1.0.1": *
#let profile = sys.inputs.at("profile", default: "dethi")
#let preset = exam-preset(theme: "teal-pro", profile: profile)
#let (tn, ds, tln, tl) = exam-mode(..preset.question)
#show: sang-setup.with(math-color: black)
#show: exam-theme.with(theme: preset.theme, school: "...", exam-title: "...", subject: "TOÁN 12", duration: "90 phút", code: "101", ..preset.template)

CHỮ KÝ DUY NHẤT ĐƯỢC PHÉP
1) TN nhiều lựa chọn, đúng 4 phương án và đúng 1 True(...):
#tn([Nội dung], ([$A$], True([$B$]), [$C$], [$D$]), id: "TN01", tags: ("chu-de", "NB"), loigiai: [Lời giải.])

2) Đúng/Sai, đúng 4 mệnh đề; chỉ mệnh đề đúng bọc True(...), mệnh đề sai để content thường:
#ds([Nội dung chung], (True([Mệnh đề đúng]), [Mệnh đề sai], True([Mệnh đề đúng]), [Mệnh đề sai]), id: "DS01", tags: ("chu-de", "TH"), loigiai: [Giải thích đủ bốn ý.])

3) Trả lời ngắn, đối số thứ hai là đáp án:
#tln([Nội dung], [$42$], id: "TLN01", tags: ("chu-de", "VD"), loigiai: [Lời giải.])

4) Tự luận không có đối số đáp án thứ hai:
#tl([Nội dung], id: "TL01", tags: ("chu-de", "VDC"), lines: 6, loigiai: [Lời giải.])

QUY TẮC CẤM
- Cấm cú pháp cũ #tn[...][...], #ds[...], #False[...], #ppgiai[...].
- Cấm tự tạo macro question, choices, answer, solution hoặc import file local.
- Cấm LaTeX thô: \\frac, \\sqrt, \\begin, \\mathrm, \\mathbb.
- Không dùng URL ảnh ngoài. Chỉ thêm package khác khi yêu cầu người dùng ghi rõ.

TOÁN TYPST
- Công thức nằm trong $...$.
- Dùng frac(a,b), dfrac(a,b), tfrac(a,b), sqrt(x), root(3,x), integral, dif, RR, ZZ, NN, oo.
- Hệ dùng heva(...); các trường hợp lựa chọn dùng hoac(...).
- Dùng đúng cú pháp Typst, không mô phỏng cú pháp LaTeX.

METADATA VÀ TÍNH ĐÚNG
- ID duy nhất, tuần tự: TN01..., DS01..., TLN01..., TL01....
- Mọi câu có tags, trong đó mức độ là NB, TH, VD hoặc VDC.
- Mọi câu có loigiai. Mỗi TN có duy nhất một đáp án đúng. Mỗi DS có đúng bốn mệnh đề.
- Số câu thực tế phải khớp chính xác với count của exam-part và ma trận người dùng.
- Kết thúc file bằng #het.

TRƯỚC KHI TRẢ KẾT QUẢ, TỰ KIỂM TRA THẦM LẶNG: import, khung setup, số câu, 4 phương án, True, ID, tags, loigiai, ngoặc và cú pháp toán.`

const PREFIX = { tn: 'TN', ds: 'DS', tln: 'TLN', tl: 'TL' }

export function stripCodeFences(value) {
  let code = String(value || '').trim()
  const fenced = code.match(/```(?:typst|typ)?\s*([\s\S]*?)```/i)
  if (fenced) code = fenced[1].trim()
  return code.replace(/^```(?:typst|typ)?\s*/i, '').replace(/```\s*$/i, '').trim()
}

function scanBalanced(source) {
  const pairs = { '(': ')', '[': ']', '{': '}' }
  const closes = new Set(Object.values(pairs))
  const stack = []
  let string = false
  let math = false
  let escaped = false
  let comment = false

  for (let i = 0; i < source.length; i += 1) {
    const char = source[i]
    const next = source[i + 1]
    if (comment) {
      if (char === '\n') comment = false
      continue
    }
    if (!string && char === '/' && next === '/') {
      comment = true
      i += 1
      continue
    }
    if (string) {
      if (escaped) escaped = false
      else if (char === '\\') escaped = true
      else if (char === '"') string = false
      continue
    }
    if (char === '$') {
      math = !math
      continue
    }
    if (math) continue
    if (char === '"') {
      string = true
      continue
    }
    if (pairs[char]) stack.push({ char, index: i })
    else if (closes.has(char)) {
      const open = stack.pop()
      if (!open || pairs[open.char] !== char) return { ok: false, index: i, message: `Ngoặc ${char} không khớp.` }
    }
  }
  if (string) return { ok: false, index: source.length, message: 'Chuỗi ký tự chưa đóng.' }
  if (stack.length) {
    const open = stack.at(-1)
    return { ok: false, index: open.index, message: `Ngoặc ${open.char} chưa đóng.` }
  }
  return { ok: true }
}

function findMatchingParen(source, openIndex) {
  let depth = 0
  let string = false
  let math = false
  let escaped = false
  let comment = false
  for (let i = openIndex; i < source.length; i += 1) {
    const char = source[i]
    const next = source[i + 1]
    if (comment) {
      if (char === '\n') comment = false
      continue
    }
    if (!string && char === '/' && next === '/') {
      comment = true
      i += 1
      continue
    }
    if (string) {
      if (escaped) escaped = false
      else if (char === '\\') escaped = true
      else if (char === '"') string = false
      continue
    }
    if (char === '$') {
      math = !math
      continue
    }
    if (math) continue
    if (char === '"') string = true
    else if (char === '(') depth += 1
    else if (char === ')') {
      depth -= 1
      if (depth === 0) return i
    }
  }
  return -1
}

export function splitTopLevel(source) {
  const result = []
  let start = 0
  const stack = []
  const pair = { '(': ')', '[': ']', '{': '}' }
  let string = false
  let math = false
  let escaped = false
  let comment = false
  for (let i = 0; i < source.length; i += 1) {
    const char = source[i]
    const next = source[i + 1]
    if (comment) {
      if (char === '\n') comment = false
      continue
    }
    if (!string && char === '/' && next === '/') {
      comment = true
      i += 1
      continue
    }
    if (string) {
      if (escaped) escaped = false
      else if (char === '\\') escaped = true
      else if (char === '"') string = false
      continue
    }
    if (char === '$') {
      math = !math
      continue
    }
    if (math) continue
    if (char === '"') string = true
    else if (pair[char]) stack.push(pair[char])
    else if (stack.at(-1) === char) stack.pop()
    else if (char === ',' && stack.length === 0) {
      const item = source.slice(start, i).trim()
      if (item) result.push(item)
      start = i + 1
    }
  }
  const tail = source.slice(start).trim()
  if (tail) result.push(tail)
  return result
}

export function parseQuestionCalls(source) {
  const calls = []
  const re = /#(tn|ds|tln|tl)\s*\(/g
  let match
  while ((match = re.exec(source)) !== null) {
    const open = source.indexOf('(', match.index)
    const close = findMatchingParen(source, open)
    if (close < 0) break
    const raw = source.slice(match.index, close + 1)
    const args = splitTopLevel(source.slice(open + 1, close))
    const named = args.filter(arg => /^[a-zA-Z][\w-]*\s*:/.test(arg))
    const positional = args.filter(arg => !/^[a-zA-Z][\w-]*\s*:/.test(arg))
    const id = raw.match(/\bid\s*:\s*"([^"]+)"/)?.[1] || ''
    calls.push({ type: match[1], raw, args, named, positional, id, index: match.index })
    re.lastIndex = close + 1
  }
  return calls
}

function tupleItems(value) {
  const trimmed = String(value || '').trim()
  if (!trimmed.startsWith('(') || !trimmed.endsWith(')')) return []
  return splitTopLevel(trimmed.slice(1, -1))
}

function lineAt(source, index) {
  return source.slice(0, Math.max(0, index)).split('\n').length
}

function issue(code, message, line = 1) {
  return { code, message, line }
}

export function validateSangMath(source, expected = {}) {
  const code = stripCodeFences(source)
  const errors = []
  const warnings = []
  const expectedCounts = {
    tn: Number(expected.tn || 0),
    ds: Number(expected.ds || 0),
    tln: Number(expected.tln || 0),
    tl: Number(expected.tl || 0),
  }

  if (!/#import\s+"@preview\/sang-math:1\.0\.1"\s*:\s*\*/.test(code)) {
    errors.push(issue('IMPORT', 'Thiếu import chính xác @preview/sang-math:1.0.1.', 1))
  }
  if (!/exam-preset\s*\(/.test(code) || !/exam-mode\s*\(/.test(code) || !/exam-theme\.with\s*\(/.test(code)) {
    errors.push(issue('SETUP', 'Thiếu khung exam-preset, exam-mode hoặc exam-theme.with.', 1))
  }
  if (!/#het\b/.test(code)) errors.push(issue('END', 'File phải kết thúc bằng #het.', code.split('\n').length))

  const balanced = scanBalanced(code)
  if (!balanced.ok) errors.push(issue('BALANCE', balanced.message, lineAt(code, balanced.index)))

  const forbidden = [
    [/#(?:tn|ds|tln|tl)\s*\[/, 'OLD_CALL', 'Đang dùng chữ ký cũ #tn[...] thay vì #tn(...).'],
    [/#False\s*[\[(]/, 'FALSE', 'sang-math 1.0.1 không dùng #False; mệnh đề sai để content thường.'],
    [/#ppgiai\s*\[/, 'PPGIAI', 'Dùng tham số loigiai: [...] thay cho #ppgiai.'],
    [/\\(?:frac|sqrt|begin|end|mathrm|mathbb)\b/, 'LATEX', 'Còn cú pháp LaTeX thô; phải chuyển sang cú pháp toán Typst.'],
    [/#(?:question|choices|answer|solution)\s*[\[(]/, 'FAKE_API', 'Có macro ngoài hợp đồng sang-math.'],
  ]
  for (const [pattern, key, message] of forbidden) {
    const match = code.match(pattern)
    if (match) errors.push(issue(key, message, lineAt(code, match.index)))
  }

  const localImport = [...code.matchAll(/#import\s+"([^"]+)"/g)].find(match => !match[1].startsWith('@preview/'))
  if (localImport) errors.push(issue('LOCAL_IMPORT', `Không cho phép import local: ${localImport[1]}.`, lineAt(code, localImport.index)))

  const calls = parseQuestionCalls(code)
  const stats = { tn: 0, ds: 0, tln: 0, tl: 0 }
  const ids = new Set()
  const typeIndexes = { tn: 0, ds: 0, tln: 0, tl: 0 }

  for (const call of calls) {
    stats[call.type] += 1
    typeIndexes[call.type] += 1
    const line = lineAt(code, call.index)
    const label = `#${call.type} dòng ${line}`
    const expectedId = `${PREFIX[call.type]}${String(typeIndexes[call.type]).padStart(2, '0')}`

    if (!call.id) errors.push(issue('ID_MISSING', `${label} thiếu id.`, line))
    else if (ids.has(call.id)) errors.push(issue('ID_DUPLICATE', `ID ${call.id} bị trùng.`, line))
    else {
      ids.add(call.id)
      if (call.id !== expectedId) errors.push(issue('ID_ORDER', `${label} phải có ID ${expectedId}, hiện là ${call.id}.`, line))
    }

    if (!call.named.some(arg => /^tags\s*:/.test(arg))) errors.push(issue('TAGS', `${label} thiếu tags.`, line))
    if (!call.named.some(arg => /^loigiai\s*:/.test(arg))) errors.push(issue('SOLUTION', `${label} thiếu loigiai.`, line))

    if (call.type === 'tn' || call.type === 'ds') {
      if (call.positional.length < 2) {
        errors.push(issue('ARGUMENTS', `${label} thiếu tuple phương án/mệnh đề.`, line))
      } else {
        const items = tupleItems(call.positional[1])
        if (items.length !== 4) errors.push(issue('FOUR_ITEMS', `${label} phải có đúng 4 mục, hiện có ${items.length}.`, line))
        const trueCount = items.filter(item => /^True\s*\(/.test(item.trim())).length
        if (call.type === 'tn' && trueCount !== 1) errors.push(issue('ONE_TRUE', `${label} phải có đúng 1 True(...), hiện có ${trueCount}.`, line))
      }
    }
    if (call.type === 'tln' && call.positional.length !== 2) {
      errors.push(issue('TLN_ANSWER', `${label} phải có đúng nội dung và một đáp án ở hai đối số positional.`, line))
    }
    if (call.type === 'tl' && call.positional.length !== 1) {
      errors.push(issue('TL_SIGNATURE', `${label} chỉ nhận nội dung ở positional; lời giải phải đặt tại loigiai:.`, line))
    }
  }

  for (const type of Object.keys(stats)) {
    if (Number.isFinite(expectedCounts[type]) && stats[type] !== expectedCounts[type]) {
      errors.push(issue('COUNT', `Số câu ${PREFIX[type]} phải là ${expectedCounts[type]}, hiện có ${stats[type]}.`, 1))
    }
  }
  if (/TODO-CAN-GV-KIEM-TRA/.test(code)) warnings.push(issue('TODO', 'Có câu AI chưa chắc chắn, giáo viên phải kiểm tra trước khi dùng.', 1))
  if (!calls.length) errors.push(issue('NO_QUESTION', 'Không tìm thấy lời gọi #tn/#ds/#tln/#tl hợp lệ.', 1))

  return { valid: errors.length === 0, errors, warnings, stats, calls, contract: CONTRACT_VERSION, code }
}

export function buildUserPrompt(options) {
  const counts = `TN=${options.tn}, DS=${options.ds}, TLN=${options.tln}, TL=${options.tl}`
  const extras = String(options.extraImports || '').trim()
  const source = String(options.source || '').trim()
  const modeInstruction = options.mode === 'convert'
    ? `Chuyển nội dung nguồn bên dưới sang đề sang-math. Giữ nghĩa và số liệu; chỗ OCR không chắc phải ghi TODO-CAN-GV-KIEM-TRA.\n\nNGUỒN:\n${source}`
    : options.mode === 'vdc'
      ? 'Tạo các câu phân hóa 9–10 điểm, không đánh đố ngôn ngữ, phương án nhiễu xuất phát từ sai lầm điển hình.'
      : 'Tạo đề mới đúng ma trận, nội dung sư phạm rõ ràng và dữ kiện tự đủ.'

  return `TẠO FILE TYPST HOÀN CHỈNH THEO HỢP ĐỒNG ${CONTRACT_VERSION}.
Chế độ: ${options.mode}.
Tên đề: ${options.title}.
Trường: ${options.school}.
Lớp/môn: Toán ${options.grade}.
Chủ đề/phạm vi: ${options.topic}.
Thời gian: ${options.duration}.
Mã đề: ${options.code}.
Theme: ${options.theme}.
Ma trận số lượng chính xác: ${counts}.
Phân bố mức độ: ${options.difficulty}.
Yêu cầu riêng: ${options.notes || 'Không có'}.
Package bổ sung được phép: ${extras || 'Không có; chỉ dùng sang-math:1.0.1'}.

${modeInstruction}

Chia exam-part theo từng loại câu có số lượng > 0, count phải đúng. ID từng loại bắt đầu từ 01. Chỉ trả mã Typst.`
}

export function buildRepairPrompt(code, validation, options) {
  const details = validation.errors.map((item, index) => `${index + 1}. [${item.code}] dòng ~${item.line}: ${item.message}`).join('\n')
  return `SỬA FILE THEO HỢP ĐỒNG ${CONTRACT_VERSION}. Không đổi nội dung toán học đúng nếu không cần.
Ma trận bắt buộc: TN=${options.tn}, DS=${options.ds}, TLN=${options.tln}, TL=${options.tl}.
Các lỗi validator phát hiện:
${details}

FILE CẦN SỬA:
${code}

Trả lại toàn bộ file Typst đã sửa, không Markdown, không giải thích.`
}
