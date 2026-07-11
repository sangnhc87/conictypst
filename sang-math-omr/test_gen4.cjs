const fs = require('fs');
const html = fs.readFileSync('index.html', 'utf8');
const match = html.match(/function genWasmTypst\([^)]*\)\s*{([\s\S]*?)return\s+`([\s\S]*?)`;\s*}/);
if (match) {
  const funcBody = match[1] + 'return `' + match[2] + '`;';
  const f = new Function('mcq', 'tf', 'tln', 'paper', 'school', 'handwritten', funcBody);
  fs.writeFileSync('generated.typ', f(40, 4, 4, 'a4', 'Test', true));
  console.log("Generated OK");
}
