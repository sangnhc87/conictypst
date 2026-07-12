const fs = require('fs');
const html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

const match = html.match(/const TEMPLATES = \{([\s\S]*?)\n        \};/);
if (match) {
    const templatesBody = match[1];
    console.log('ds-20-ngang in TEMPLATES:', templatesBody.includes("'ds-20-ngang': {"));
    console.log('tln-10-ngang in TEMPLATES:', templatesBody.includes("'tln-10-ngang': {"));
    console.log('ds20-tln10-ngang in TEMPLATES:', templatesBody.includes("'ds20-tln10-ngang': {"));
} else {
    console.log('TEMPLATES object not found');
}
