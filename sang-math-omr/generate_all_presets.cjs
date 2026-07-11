const fs = require('fs');
const html = fs.readFileSync('index.html', 'utf8');

// Parse buildTypstCode function
const match = html.match(/function buildTypstCode\([^)]*\)\s*{([\s\S]*?)return\s+genWasmTypst\(([\s\S]*?)\);\s*}/);
const genMatch = html.match(/function genWasmTypst\([^)]*\)\s*{([\s\S]*?)return\s+`([\s\S]*?)`;\s*}/);

if (match && genMatch) {
  const genBody = genMatch[1] + 'return `' + genMatch[2] + '`;';
  const genFunc = new Function('mcq', 'tf', 'tln', 'paper', 'school', 'subtitle', 'handwritten', 'realQr', 
    `return (function({ mcq, tf, tln, paper, school, subtitle, handwritten, realQr }) { ${genBody} })({ mcq, tf, tln, paper, school, subtitle, handwritten, realQr })`);

  function buildTypstCode(mcq, tf, tln, paper) {
    return genFunc(mcq, tf, tln, paper, 'SANG MATH OMR', 'Custom Template', true, true);
  }

  // Define some presets
  fs.writeFileSync('templates/tn-40.typ', buildTypstCode(40, 0, 0, 'a4'));
  fs.writeFileSync('templates/tn-50.typ', buildTypstCode(50, 0, 0, 'a4'));
  fs.writeFileSync('templates/tn-60.typ', buildTypstCode(60, 0, 0, 'a4'));
  fs.writeFileSync('templates/ds-12.typ', buildTypstCode(0, 12, 0, 'a4'));
  fs.writeFileSync('templates/hybrid-28tn-12ds.typ', buildTypstCode(28, 12, 0, 'a4'));
  fs.writeFileSync('templates/thptqg-toan-2025.typ', buildTypstCode(12, 4, 6, 'a4'));
  
  console.log("Updated templates successfully!");
} else {
  console.log("Regex match failed");
}
