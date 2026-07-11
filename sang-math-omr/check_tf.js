const fs = require('fs');
const html = fs.readFileSync('index.html', 'utf8');
const match = html.match(/'12-4-6ngang': (\{[\s\S]*?\})\s*,\s*'tn-50'/);
if (match) {
    const tmplStr = match[1];
    // console.log(tmplStr.substring(0, 500));
    const tmpl = eval('(' + tmplStr + ')');
    console.log(JSON.stringify(tmpl.tf, null, 2));
} else {
    console.log('not found');
}
