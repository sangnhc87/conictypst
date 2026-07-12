const fs = require('fs');
const html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

const ds20 = html.includes("'ds-20-ngang': {");
const tln10 = html.includes("'tln-10-ngang': {");
const ds20tln10 = html.includes("'ds20-tln10-ngang': {");

console.log('ds-20-ngang in HTML:', ds20);
console.log('tln-10-ngang in HTML:', tln10);
console.log('ds20-tln10-ngang in HTML:', ds20tln10);
