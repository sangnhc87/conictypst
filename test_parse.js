function splitTypstArguments(argsStr) {
  const args = [];
  let currentArg = '';
  let stack = [];
  let inString = false;
  
  for (let i = 0; i < argsStr.length; i++) {
    const char = argsStr[i];
    
    if (char === '"' && argsStr[i - 1] !== '\\\\') {
      inString = !inString;
    }
    
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
  
  if (currentArg.trim()) {
    args.push(currentArg.trim());
  }
  
  return args;
}

const input = '[Hỏi], ([A], [B, b], [C (2)], [D {4}]), correct: 1';
const parsed = splitTypstArguments(input);
console.log(parsed);

let optionsStr = parsed[1].trim();
if (optionsStr.startsWith('(') && optionsStr.endsWith(')')) {
  optionsStr = optionsStr.substring(1, optionsStr.length - 1);
}
const options = splitTypstArguments(optionsStr);
console.log(options);
