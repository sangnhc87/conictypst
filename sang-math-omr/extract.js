const fs = require('fs');
const content = fs.readFileSync('old_index.html', 'utf8');
const match = content.match(/window\.TEMPLATES\s*=\s*(\{[\s\S]*?\});/);
if (match) {
    const fn = new Function('return ' + match[1]);
    const obj = fn();
    fs.writeFileSync('old_templates.json', JSON.stringify(obj, null, 2));
    console.log("Success");
}
