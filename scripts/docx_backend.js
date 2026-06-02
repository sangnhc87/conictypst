function getMockMacros(exportMode) {
  // Match the real Typst API: True(body) wraps the option with correct: true.
  let trueMacro = '#let True(body, ..args) = (body: body, correct: true)';

  let loigiaiCode = '';
  if (exportMode === 'loigiai' || exportMode === 'dapan') {
    loigiaiCode = `
  #if loigiai != none [
    \\ *Lời giải:* #loigiai
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

  // Always 4x1: one option per line
  cells.at(0); [ #linebreak() ]; cells.at(1); [ #linebreak() ]; cells.at(2); [ #linebreak() ]; cells.at(3)
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

#let exam-part(title, count: auto, ..args) = [
  = #title
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

function splitTypstArguments(argsStr) {
  const args = [];
  let currentArg = '';
  let stack = [];
  let inString = false;
  
  for (let i = 0; i < argsStr.length; i++) {
    const char = argsStr[i];
    if (char === '"' && argsStr[i - 1] !== '\\\\') inString = !inString;
    if (!inString) {
      if (char === '(' || char === '{' || char === '[') stack.push(char);
      else if (char === ')' || char === '}' || char === ']') stack.pop();
    }
    if (char === ',' && stack.length === 0 && !inString) {
      args.push(currentArg.trim());
      currentArg = '';
    } else {
      currentArg += char;
    }
  }
  if (currentArg.trim()) args.push(currentArg.trim());
  return args;
}

function findMatchingDelimiter(text, openIndex) {
  const opener = text[openIndex];
  const closer = opener === '(' ? ')' : opener === '[' ? ']' : opener === '{' ? '}' : null;
  if (!closer) return -1;

  let stack = [opener];
  let inString = false;
  for (let i = openIndex + 1; i < text.length; i++) {
    const char = text[i];
    if (char === '"' && text[i - 1] !== '\\\\') inString = !inString;
    if (inString) continue;

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

function injectLayouts(content) {
  const questionKeywords = new Set(['#tn(', '#ds(', '#tln(', '#tl(']);
  const resetKeyword = '#resetcau(';
  const searchableKeywords = [...questionKeywords, resetKeyword];

  let processed = '';
  let cursor = 0;
  let questionNumber = 0;

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
    if (nextKeyword === resetKeyword) {
      processed += fullCall;
      questionNumber = 0;
      cursor = endIndex + 1;
      continue;
    }

    const argsStr = content.substring(openParenIndex + 1, endIndex);
    const args = splitTypstArguments(argsStr)
      .filter(arg => !arg.trim().startsWith('layout:') && !arg.trim().startsWith('qnum:'));

    questionNumber += 1;
    if (nextKeyword === '#tn(' || nextKeyword === '#ds(') {
      args.push('layout: "4x1"');
    }
    args.push(`qnum: ${questionNumber}`);

    processed += `${nextKeyword}${args.join(', ')})`;
    cursor = endIndex + 1;
  }

  return processed;
}

export { getMockMacros, injectLayouts };
