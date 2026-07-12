const fs = require('fs');
let html = fs.readFileSync('index.html', 'utf-8');
let match = html.match(/const\s+TEMPLATES\s*=\s*(\{[\s\S]*?\});/);
if (match) {
    fs.writeFileSync('templates.js', "module.exports = " + match[1] + ";");
    console.log("Extracted templates");
} else {
    console.log("No templates found");
}
