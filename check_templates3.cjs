const fs = require('fs');
const html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

const ds20Pos = html.indexOf("'ds-20-ngang': {");
console.log("ds-20-ngang occurs at indices: ");
let pos = html.indexOf("'ds-20-ngang': {");
while (pos !== -1) {
    console.log(pos);
    pos = html.indexOf("'ds-20-ngang': {", pos + 1);
}

console.log("\nds20-tln10-ngang occurs at indices: ");
pos = html.indexOf("'ds20-tln10-ngang': {");
while (pos !== -1) {
    console.log(pos);
    pos = html.indexOf("'ds20-tln10-ngang': {", pos + 1);
}
