const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

function getMockMacros(exportMode) {
  let trueMacro = '#let True(body, ..args) = body';
  if (exportMode === 'dapan') {
    trueMacro = '#let True(body, ..args) = underline(body)';
  }

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

  return `
#let cau = counter("cau")
${trueMacro}

#let render-options(options, layout, type) = {
  let labels = if type == "tn" { ("A.", "B.", "C.", "D.") } else { ("a)", "b)", "c)", "d)") }
  let cells = ()
  for i in range(4) {
    cells.push([#labels.at(i) #options.at(i, default: "")])
  }
  
  if layout == "4x1" {
    cells.at(0); [ #linebreak() ]; cells.at(1); [ #linebreak() ]; cells.at(2); [ #linebreak() ]; cells.at(3)
  } else {
    if layout == "2x2" {
      cells.at(0); [ XYZTABZYX ]; cells.at(1); [ #linebreak() ]; cells.at(2); [ XYZTABZYX ]; cells.at(3)
    } else {
      cells.at(0); [ XYZTABZYX ]; cells.at(1); [ XYZTABZYX ]; cells.at(2); [ XYZTABZYX ]; cells.at(3)
    }
  }
}

#let tn(question, options, correct: 1, loigiai: none, fig: none, fig-pos: "right", fig-width: 30%, layout: "1x4", ..args) = [
  #cau.step()
  XYZCAUHOIZYX *Câu #cau.display():* #question

  #if fig != none [
    #align(center)[#fig]
  ]
  #render-options(options, layout, "tn")
  ${loigiaiCode}
]

#let ds(question, statements, correct: none, loigiai: none, fig: none, fig-pos: "right", fig-width: 30%, layout: "1x4", ..args) = [
  #cau.step()
  XYZCAUHOIZYX *Câu #cau.display():* #question

  #if fig != none [
    #align(center)[#fig]
  ]
  #render-options(statements, layout, "ds")
  ${loigiaiCode}
]

#let tln(question, answer, loigiai: none, fig: none, fig-pos: "right", fig-width: 30%, ..args) = [
  #cau.step()
  XYZCAUHOIZYX *Câu #cau.display():* #question

  #if fig != none [
    #align(center)[#fig]
  ]
  ${tlnDapAn}
  ${loigiaiCode}
]

#let tl(question, loigiai: none, fig: none, fig-pos: "right", fig-width: 30%, ..args) = [
  #cau.step()
  XYZCAUHOIZYX *Câu #cau.display():* #question

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

#let exam-part(title, count: auto, ..args) = [
  #cau.update(0)
  = #title
]

#let resetcau(..args) = [
  #cau.update(0)
]
#let step(..args) = []
#let het = []
#let print-answer-key(..args) = []
#let classic = (blue: rgb("0000FF"), red: rgb("FF0000"), green: rgb("00FF00"))
#let exam-mode(..args) = (tn, ds, tln, tl)
#let cap = "∩"
#let cup = "∪"
#let dif = "d"
#let notin = "∉"
#let parallel = "∥"
#let perp = "⊥"
#let hoac(..args) = math.cases(..args)
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

function injectLayouts(content) {
  let processed = content;
  const keywords = ['#tn(', '#ds('];
  for (const keyword of keywords) {
    let sIdx = 0;
    while ((sIdx = processed.indexOf(keyword, sIdx)) !== -1) {
      let stack = [];
      let inString = false;
      let endIndex = -1;
      for (let i = sIdx + keyword.length - 1; i < processed.length; i++) {
        const char = processed[i];
        if (char === '"' && processed[i - 1] !== '\\\\') inString = !inString;
        if (!inString) {
          if (char === '(' || char === '{' || char === '[') stack.push(char);
          else if (char === ')' || char === '}' || char === ']') {
            const last = stack[stack.length - 1];
            if ((char === ')' && last === '(') || 
                (char === '}' && last === '{') || 
                (char === ']' && last === '[')) {
              stack.pop();
            }
            if (stack.length === 0) {
              endIndex = i;
              break;
            }
          }
        }
      }
      
      if (endIndex !== -1) {
        const fullCall = processed.substring(sIdx, endIndex + 1);
        const argsStr = processed.substring(sIdx + keyword.length, endIndex);
        const args = splitTypstArguments(argsStr);
        
        let optionsStr = args.find(a => a.startsWith('(') && a.endsWith(')'));
        let layout = '1x4';
        if (optionsStr) {
          let inner = optionsStr.substring(1, optionsStr.length - 1).trim();
          let options = splitTypstArguments(inner);
          let maxLen = 0;
          options.forEach(opt => {
            let cleanOpt = opt.replace(/#.*?\\s/g, '').replace(/[\\$\\[\\]]/g, '').trim();
            if (cleanOpt.length > maxLen) maxLen = cleanOpt.length;
          });
          if (maxLen > 30) layout = '4x1';
          else if (maxLen > 15) layout = '2x2';
        }
        
        let innerStr = fullCall.substring(0, fullCall.length - 1).trimEnd();
        let replaceWith = '';
        if (innerStr.endsWith(',')) {
          replaceWith = innerStr + ` layout: "${layout}")`;
        } else {
          replaceWith = innerStr + `, layout: "${layout}")`;
        }
        processed = processed.substring(0, sIdx) + replaceWith + processed.substring(endIndex + 1);
        sIdx += replaceWith.length;
      } else {
        sIdx += keyword.length;
      }
    }
  }
  return processed;
}

module.exports = { getMockMacros, injectLayouts };
