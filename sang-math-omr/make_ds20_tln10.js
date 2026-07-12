const fs = require('fs');
let html = fs.readFileSync('index.html', 'utf-8');

// Extract genWasmTypst
let funcMatch = html.match(/function genWasmTypst\([\s\S]*?\n\s*\/\/\s*Return/);
let body = funcMatch ? funcMatch[0] : "";
if (body) {
    console.log("Found genWasmTypst");
} else {
    console.log("NOT FOUND");
}
