export function extractBlocksForDocx(content, keyword, options = {}) {
  const extracted = []
  let searchIndex = 0

  while ((searchIndex = content.indexOf(keyword, searchIndex)) !== -1) {
    // Với keyword trần như 'canvas', bỏ qua trường hợp 'cetz.canvas' (đã bắt ở
    // lượt riêng) để không trích trùng.
    if (options.skipDotPrefix && searchIndex > 0 && content[searchIndex - 1] === '.') {
      searchIndex += keyword.length
      continue
    }

    let blockStart = searchIndex
    let hasHash = false

    if (searchIndex > 0 && content[searchIndex - 1] === '#') {
      blockStart = searchIndex - 1
      hasHash = true
    }

    let openParenIndex = content.indexOf('(', searchIndex + keyword.length)
    let openBracketIndex = content.indexOf('[', searchIndex + keyword.length)
    if (openParenIndex === -1 && openBracketIndex === -1) {
      searchIndex += keyword.length
      continue
    }

    const closestParen = Math.min(
      openParenIndex === -1 ? Infinity : openParenIndex,
      openBracketIndex === -1 ? Infinity : openBracketIndex,
    )

    if (closestParen - (searchIndex + keyword.length) > 5) {
      searchIndex += keyword.length
      continue
    }

    openParenIndex = closestParen
    const stack = []
    let endIndex = -1
    let inString = false
    let inComment = false

    for (let index = openParenIndex; index < content.length; index += 1) {
      const char = content[index]
      const nextChar = content[index + 1]

      if (char === '"' && content[index - 1] !== '\\') inString = !inString
      if (inString) continue

      if (char === '/' && nextChar === '/') inComment = true
      if (inComment && char === '\n') inComment = false
      if (char === '/' && nextChar === '*') inComment = true
      if (inComment && char === '*' && nextChar === '/') inComment = false
      if (inComment) continue

      if (char === '(' || char === '{' || char === '[') {
        stack.push(char)
      } else if (char === ')' || char === '}' || char === ']') {
        const last = stack[stack.length - 1]
        if (
          (char === ')' && last === '(') ||
          (char === '}' && last === '{') ||
          (char === ']' && last === '[')
        ) {
          stack.pop()
        } else {
          break
        }
        if (stack.length === 0) {
          endIndex = index
          break
        }
      }
    }

    if (endIndex !== -1) {
      extracted.push({ text: content.substring(blockStart, endIndex + 1), hasHash })
      searchIndex = endIndex + 1
    } else {
      searchIndex += keyword.length
    }
  }

  return extracted
}

// Lớp an toàn cuối cùng trước khi đưa sang Pandoc: Pandoc KHÔNG BAO GIỜ được
// thấy cetz/canvas/bbt. Sau khi các hình đã được biên dịch→ảnh và thay thế, hàm
// này quét sạch mọi khối vẽ còn sót (do lệch chuỗi, cú pháp lạ…) và thay bằng
// ghi chú trung tính, để một hình sót không làm hỏng toàn bộ lần xuất.
export function stripResidualGraphics(content, placeholder = '#emph[(Hình vẽ — mở bằng bản Desktop để có hình đầy đủ)]') {
  let result = String(content || '')
  for (const [keyword, opts] of [
    ['cetz.canvas', {}],
    ['canvas', { skipDotPrefix: true }],
    ['bbt', {}],
  ]) {
    // Quét lặp: mỗi lần thay xong chuỗi đổi nên trích lại từ đầu cho chắc.
    let guard = 0
    while (guard++ < 200) {
      const blocks = extractBlocksForDocx(result, keyword, opts)
      if (!blocks.length) break
      result = result.replace(blocks[0].text, placeholder)
    }
  }
  return result
}

// Rút metadata tiêu đề đề thi từ `#show: thpt-school-exam.with(...)` hoặc
// `#show: exam-theme.with(...)` — vì các show rule này bị bỏ khi đưa sang Pandoc
// (Pandoc không hiểu theme), nên phải trích tiêu đề ra để dựng header thủ công.
export function extractExamMeta(sourceText) {
  const text = String(sourceText || '')
  const themeIndex = text.search(/#show:\s*(?:thpt-school-exam|exam-theme|sang-setup)\s*\.with\s*\(/)
  if (themeIndex < 0) return {}
  const open = text.indexOf('(', themeIndex)
  if (open < 0) return {}
  // Quét cân bằng để lấy đúng khối tham số (tôn trọng chuỗi và ngoặc lồng).
  let depth = 0, inString = false, end = -1
  for (let i = open; i < text.length; i += 1) {
    const c = text[i], prev = text[i - 1]
    if (inString) { if (c === '"' && prev !== '\\') inString = false; continue }
    if (c === '"') { inString = true; continue }
    if (c === '(' || c === '[' || c === '{') depth += 1
    else if (c === ')' || c === ']' || c === '}') { depth -= 1; if (depth === 0) { end = i; break } }
  }
  if (end < 0) return {}
  const args = text.slice(open + 1, end)
  const field = name => {
    // name: "value" (chuỗi) — bỏ qua giá trị content [...] hay biến.
    const m = args.match(new RegExp(`${name}\\s*:\\s*"((?:[^"\\\\]|\\\\.)*)"`))
    return m ? m[1].trim() : ''
  }
  return {
    schoolName: field('school') || field('department'),
    examTitle: field('exam-title') || field('title'),
    examSubject: field('subject'),
    examCode: field('code'),
  }
}

export function buildHeaderBlock({ examTitle, schoolName, examCode, examSubject }) {
  if (!examTitle && !schoolName) return ''

  const school = schoolName || 'TRƯỜNG THPT SANG MATH'
  const title = examTitle || 'ĐỀ KIỂM TRA MẪU'
  const subject = examSubject || 'TOÁN'
  const codeStr = examCode ? `Mã đề: ${examCode}` : ''

  return `XYZHEADERZYX|${school}|(Đề thi chính thức)|${title}|Môn: ${subject}${codeStr ? `    —    ${codeStr}` : ''}\n\n`
}

export function buildFigurePrelude(sourceText) {
  let imports = ''
  const importLines = sourceText.split('\n').filter(line => line.trim().startsWith('#import'))
  importLines.forEach(line => {
    let finalLine = line
    if (line.includes('sang-exam.typ')) finalLine = '#import "sang-exam.typ": *'
    else if (line.includes('bbt.typ')) finalLine = '#import "bbt.typ": *'
    else if (line.includes('math-sym.typ')) finalLine = '#import "math-sym.typ": *'
    imports += `${finalLine}\n`
  })

  const firstQuestionIndex = sourceText.search(/^#(?:tn|ds|tln|tl|exam-part)\s*\(/m)
  const preamble = firstQuestionIndex > 0 ? sourceText.substring(0, firstQuestionIndex) : ''
  const letLines = preamble.split('\n').filter(line => {
    const trimmed = line.trim()
    return trimmed.startsWith('#let ') &&
      !trimmed.startsWith('#let accent') &&
      !trimmed.startsWith('#let mode') &&
      !trimmed.startsWith('#let make-questions') &&
      !trimmed.match(/^#let\s+\(tn/) &&
      // Chỉ giữ #let MỘT DÒNG (math-color, màu…). Bỏ mọi #let mở ngoặc nhiều
      // dòng như `make-questions(...) = [` — nếu lấy đúng dòng mở sẽ thiếu dấu
      // đóng, làm tài liệu biên dịch hình lỗi "unclosed delimiter" và hỏng cả
      // lần xuất (chỉ còn header).
      statementDepthDelta(line) === 0
  })

  if (letLines.length > 0) {
    imports += `${letLines.join('\n')}\n`
  }

  return imports
}

function statementDepthDelta(line) {
  let depth = 0
  let inString = false
  let inLineComment = false
  for (let index = 0; index < line.length; index += 1) {
    const char = line[index]
    const next = line[index + 1]
    if (!inString && char === '/' && next === '/') {
      inLineComment = true
    }
    if (inLineComment) break
    if (char === '"' && line[index - 1] !== '\\') inString = !inString
    if (inString) continue
    if (char === '(' || char === '[' || char === '{') depth += 1
    if (char === ')' || char === ']' || char === '}') depth -= 1
  }
  return depth
}

/**
 * Remove only presentation/package bootstrapping that Pandoc's Typst reader
 * cannot resolve. The document body, headings, paragraphs, lists, tables and
 * math are deliberately preserved so Word remains editable.
 */
export function prepareEditableTypstForDocx(sourceText) {
  const removableStarts = [
    '#import ',
    '#let preset = exam-preset',
    '#let mode = exam-mode',
    '#let (tn, ds, tln, tl) = exam-mode',
    '#let tn = mode.tn',
    '#let ds = mode.ds',
    '#let tln = mode.tln',
    '#let tl = mode.tl',
    '#show: sang-setup.with',
    '#show: exam-theme.with',
    '#show: thpt-school-exam.with',
    '#show: book-theme.with',
    '#show: sang-book-theme.with',
    '#show: sang-beamer-theme.with',
  ]

  const lines = String(sourceText || '').split('\n')
  const kept = []
  for (let index = 0; index < lines.length; index += 1) {
    const trimmed = lines[index].trim()
    const shouldRemove = removableStarts.some(prefix => trimmed.startsWith(prefix))
    if (!shouldRemove) {
      kept.push(lines[index])
      continue
    }

    let depth = statementDepthDelta(lines[index])
    while (depth > 0 && index + 1 < lines.length) {
      index += 1
      depth += statementDepthDelta(lines[index])
    }
  }

  return kept.join('\n').replace(/\$([\s\S]*?)\$/g, (full, mathBody) => {
    // Sang Math accepts a bare period as multiplication. Pandoc's Typst
    // evaluator reads `. name` as field access, so normalize it only inside
    // math spans and leave normal Vietnamese punctuation untouched.
    return `$${mathBody.replace(/\s\.\s/g, ' dot ')}$`
  })
}

export function injectLayouts(content) {
  const questionKeywords = new Set(['#tn(', '#ds(', '#tln(', '#tl(']);
  const resetKeyword = '#resetcau(';
  const examPartKeyword = '#exam-part(';
  const searchableKeywords = [...questionKeywords, resetKeyword, examPartKeyword];

  let processed = '';
  let cursor = 0;
  let questionNumber = 0;

  // Bỏ qua chuỗi "…", comment //, comment /* */ và math span $…$ khi quét, để
  // các ngoặc/dấu phẩy nằm trong comment hay math (vd $(0;3)$, $[a;b)$) không
  // làm lệch bộ đếm. Comment nội dòng trong lời gọi câu hỏi từng khiến việc nối
  // args thành một dòng nuốt luôn dấu đóng ")".
  function findMatchingDelimiter(text, openIndex) {
    const opener = text[openIndex];
    const closer = opener === '(' ? ')' : opener === '[' ? ']' : opener === '{' ? '}' : null;
    if (!closer) return -1;

    let stack = [opener];
    let inString = false, inLineComment = false, inBlockComment = false, inMath = false;
    for (let i = openIndex + 1; i < text.length; i++) {
      const char = text[i], next = text[i + 1], prev = text[i - 1];
      if (inLineComment) { if (char === '\n') inLineComment = false; continue; }
      if (inBlockComment) { if (char === '*' && next === '/') { inBlockComment = false; i++; } continue; }
      if (inString) { if (char === '"' && prev !== '\\') inString = false; continue; }
      if (inMath) { if (char === '$' && prev !== '\\') inMath = false; continue; }

      if (char === '"') { inString = true; continue; }
      if (char === '$') { inMath = true; continue; }
      if (char === '/' && next === '/') { inLineComment = true; i++; continue; }
      if (char === '/' && next === '*') { inBlockComment = true; i++; continue; }

      if (char === '(' || char === '[' || char === '{') {
        stack.push(char);
      } else if (char === ')' || char === ']' || char === '}') {
        const last = stack[stack.length - 1];
        if ((char === ')' && last === '(') || (char === ']' && last === '[') || (char === '}' && last === '{')) {
          stack.pop();
          if (stack.length === 0) return i;
        }
      }
    }
    return -1;
  }

  function splitTypstArguments(argsStr) {
    const args = [];
    let currentArg = '';
    let stack = [];
    let inString = false, inLineComment = false, inBlockComment = false, inMath = false;

    for (let i = 0; i < argsStr.length; i++) {
      const char = argsStr[i], next = argsStr[i + 1], prev = argsStr[i - 1];

      // Comment bị loại bỏ hẳn (giữ lại xuống dòng để không dính các arg lại).
      if (inLineComment) { if (char === '\n') { inLineComment = false; currentArg += char; } continue; }
      if (inBlockComment) { if (char === '*' && next === '/') { inBlockComment = false; i++; } continue; }
      if (inString) { currentArg += char; if (char === '"' && prev !== '\\') inString = false; continue; }
      if (inMath) { currentArg += char; if (char === '$' && prev !== '\\') inMath = false; continue; }

      if (char === '/' && next === '/') { inLineComment = true; i++; continue; }
      if (char === '/' && next === '*') { inBlockComment = true; i++; continue; }
      if (char === '"') { inString = true; currentArg += char; continue; }
      if (char === '$') { inMath = true; currentArg += char; continue; }

      if (char === '(' || char === '{' || char === '[') stack.push(char);
      else if (char === ')' || char === '}' || char === ']') stack.pop();

      if (char === ',' && stack.length === 0) {
        args.push(currentArg.trim());
        currentArg = '';
      } else {
        currentArg += char;
      }
    }
    if (currentArg.trim()) args.push(currentArg.trim());
    return args;
  }

  while (cursor < content.length) {
    let nextIndex = -1;
    let nextKeyword = null;

    for (const keyword of searchableKeywords) {
      const idx = content.indexOf(keyword, cursor);
      if (idx !== -1 && (nextIndex === -1 || idx < nextIndex)) {
        nextIndex = idx;
        nextKeyword = keyword;
      }
    }

    if (nextIndex === -1 || nextKeyword == null) {
      processed += content.substring(cursor);
      break;
    }

    processed += content.substring(cursor, nextIndex);
    const openParenIndex = nextIndex + nextKeyword.length - 1;
    const endIndex = findMatchingDelimiter(content, openParenIndex);
    if (endIndex === -1) {
      processed += content.substring(nextIndex);
      break;
    }

    const fullCall = content.substring(nextIndex, endIndex + 1);
    if (nextKeyword === resetKeyword || nextKeyword === examPartKeyword) {
      processed += fullCall;
      questionNumber = 0;
      cursor = endIndex + 1;
      continue;
    }

    const argsStr = content.substring(openParenIndex + 1, endIndex);
    const args = splitTypstArguments(argsStr)
      .filter(arg => !arg.trim().startsWith('layout:') && !arg.trim().startsWith('qnum:'));

    questionNumber += 1;
    if (nextKeyword === '#ds(') {
      args.push('layout: "4x1"');
    }
    args.push(`qnum: ${questionNumber}`);

    processed += `${nextKeyword}${args.join(', ')})`;
    cursor = endIndex + 1;
  }

  return processed;
}

export function getMockMacros(exportMode) {
  let trueMacro = '#let True(body, ..args) = (body: body, correct: true)';

  let loigiaiCode = '';
  if (exportMode === 'loigiai' || exportMode === 'dapan') {
    loigiaiCode = `
  #if loigiai != none [
    *Lời giải:* \\
    #loigiai
  ]`;
  }

  let tlnDapAn = '';
  if (exportMode === 'dapan') {
    tlnDapAn = `
  \\ *Đáp án:* #answer`;
  }

  const showCorrect = exportMode === 'loigiai' || exportMode === 'dapan';

  return `
#let cau = counter("cau")
${trueMacro}

#let render-options(options, layout, kind, correct: none, showCorrect: false) = {
  let labels = if kind == "tn" { ("A.", "B.", "C.", "D.") } else { ("a)", "b)", "c)", "d)") }
  let cells = ()
  for i in range(4) {
    let opt = options.at(i, default: "")
    let lbl = labels.at(i)
    let body = if type(opt) == dictionary { opt.body } else { opt }
    let isCorrect = if type(opt) == dictionary {
      showCorrect and opt.at("correct", default: false)
    } else {
      kind == "tn" and showCorrect and correct != none and i + 1 == correct
    }

    if isCorrect {
      cells.push([XYZANSWZYX #lbl #body])
    } else {
      cells.push([XYZOPTSZYX #lbl #body])
    }
  }

  if layout == "1x4" [
    #cells.at(0) XYZTAB4XYZ #cells.at(1) XYZTAB4XYZ #cells.at(2) XYZTAB4XYZ #cells.at(3)
  ] else if layout == "2x2" [
    #cells.at(0) XYZTABZYX #cells.at(1) \\
    #cells.at(2) XYZTABZYX #cells.at(3)
  ] else [
    #cells.at(0)

    #cells.at(1)

    #cells.at(2)

    #cells.at(3)
  ]
}

#let tn(question, options, correct: none, loigiai: none, fig: none, fig-pos: "right", fig-width: 30%, layout: "1x4", qnum: 1, ..args) = [
  XYZCAUHOIZYX *Câu #qnum.* #question

  #if fig != none [
    #align(center)[#fig]

  ]

  #render-options(options, layout, "tn", correct: correct, showCorrect: ${showCorrect ? 'true' : 'false'})

  ${loigiaiCode}
]

#let ds(question, statements, correct: none, loigiai: none, fig: none, fig-pos: "right", fig-width: 30%, layout: "1x4", qnum: 1, ..args) = [
  XYZCAUHOIZYX *Câu #qnum.* #question

  #if fig != none [
    #align(center)[#fig]

  ]

  #render-options(statements, layout, "ds", showCorrect: ${showCorrect ? 'true' : 'false'})

  ${loigiaiCode}
]

#let tln(question, answer, loigiai: none, fig: none, fig-pos: "right", fig-width: 30%, qnum: 1, ..args) = [
  XYZCAUHOIZYX *Câu #qnum.* #question

  #if fig != none [
    #align(center)[#fig]
  ]
  ${tlnDapAn}
  ${loigiaiCode}
]

#let tl(question, loigiai: none, fig: none, fig-pos: "right", fig-width: 30%, qnum: 1, ..args) = [
  XYZCAUHOIZYX *Câu #qnum.* #question

  #if fig != none [
    #align(center)[#fig]
  ]
  ${loigiaiCode}
]

#let ppgiai(body, ..args) = [
  _Phương pháp giải:_ #body
]

#let luuy(body, ..args) = [
  _Lưu ý:_ #body
]

#let meo(body, ..args) = [
  _Mẹo:_ #body
]

#let nhanxet(body, ..args) = [
  _Nhận xét:_ #body
]

#let bode(body, ..args) = [
  _Bổ đề:_ #body
]

#let giainhanh(body, ..args) = [
  _Giải nhanh:_ #body
]

#let dn(body, ..args) = [
  _Định nghĩa:_ #body
]

#let dl(body, ..args) = [
  _Định lý:_ #body
]

#let tc(body, ..args) = [
  _Tính chất:_ #body
]

#let lythuyet(body, ..args) = [
  _Lý thuyết:_ #body
]

#let note(body, ..args) = [
  _Ghi chú:_ #body
]

#let book-chapter(body, number: none, ..args) = [
  = #if number != none { [#number. ] }#body
]

#let book-lesson(body, number: none, ..args) = [
  == #if number != none { [#number. ] }#body
]

#let goal-box(body, ..args) = [
  *Mục tiêu* \
  #body
]

#let theory-box(body, ..args) = [
  *Lý thuyết* \
  #body
]

#let example-box(body, title: [Ví dụ], ..args) = [
  *#title* \
  #body
]

#let practice-box(body, ..args) = [
  *Luyện tập* \
  #body
]

#let vect(..args) = {
  let items = args.pos()
  if items.len() == 1 {
    let body = str(items.at(0))
    if body.contains(" ") {
      "→" + body
    } else {
      body + "⃗"
    }
  } else {
    items.map(a => str(a) + "⃗").join()
  }
}
#let vec(body) = $arrow(body)$

#let exam-part(title, count: auto, ..args) = [
  *#title*
]

#let resetcau(start: 1, ..args) = [
  XYZSETCAUZYX#start
]
#let setcau(n, ..args) = [
  XYZSETCAUZYX#n
]
#let setphan(..args) = []
#let resetphan(..args) = []
#let luuybode(body, ..args) = [
  _Lưu ý bổ đề:_ #body
]
#let step(..args) = []
#let het = []
#let print-answer-key(..args) = []
#let classic = (blue: rgb("0000FF"), red: rgb("FF0000"), green: rgb("00FF00"))
#let exam-mode(..args) = (tn, ds, tln, tl)
#let cap = "∩"
#let cup = "∪"
#let inter = "∩"
#let dif = "d"
#let dot = "·"
#let times = "×"
#let approx = "≈"
#let ldots = "…"
#let cdots = "⋯"
#let ZZ = "ℤ"
#let NN = "ℕ"
#let QQ = "ℚ"
#let RR = "ℝ"
#let quad = " "
#let qquad = "  "
#let circ = "°"
#let notin = "∉"
#let parallel = "∥"
#let perp = "⊥"
#let hoac(..args) = math.cases(..args)
#let heva(..args) = math.cases(..args)
#let va(..args) = math.cases(..args)
`;
}
