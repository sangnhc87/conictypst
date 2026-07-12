const fs = require('fs');

const coords = JSON.parse(fs.readFileSync('ds-20-ngang_coords.json', 'utf8'));
const coordsStr = JSON.stringify(coords, null, 4);

let html = fs.readFileSync('index.html', 'utf-8');

// The TEMPLATES object ends with tln-10 definition and a closing brace.
// We can just add 'ds-20-ngang': { ... } to it.
// Wait, I can just find `TEMPLATES = {` and `};` and replace it or parse it,
// but the easiest is to just append before the closing `};` of TEMPLATES!
// Let's find `tln-10` definition.
const searchStr = `'tln-10': {`;
const insertStr = `
    'ds-20-ngang': ${coordsStr},
    'tln-10': {`;

if (html.includes(searchStr)) {
    if (!html.includes('ds-20-ngang')) {
        html = html.replace(searchStr, insertStr);
        fs.writeFileSync('index.html', html);
        console.log("Injected ds-20-ngang into index.html!");
    } else {
        // Already injected, let's replace it.
        const start = html.indexOf("'ds-20-ngang': {");
        const end = html.indexOf("'tln-10': {");
        html = html.substring(0, start) + `'ds-20-ngang': ${coordsStr},\n    ` + html.substring(end);
        fs.writeFileSync('index.html', html);
        console.log("Replaced ds-20-ngang in index.html!");
    }
} else {
    console.log("Could not find tln-10 in index.html to inject.");
}
