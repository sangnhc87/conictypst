const fs = require('fs');

// 1. Read index.html
let html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

// 2. Read the old presets which contains the ds-20-ngang json block
const old = fs.readFileSync('old_presets.json', 'utf8');
const lines = old.split('\n');
let jsonStr = '';
let capture = false;
for (const line of lines) {
    if (line.includes("'ds-20-ngang': {")) {
        capture = true;
    }
    if (capture) {
        if (line === '--') break;
        // remove the leading '-' from git diff
        jsonStr += line.substring(1) + '\n';
    }
}

// Ensure the json string forms a valid object mapping
// it's "'ds-20-ngang': { ... },"
// So we just insert it before 'tln-10': { inside TEMPLATES

// Create ds20-tln10-ngang by replacing the key
const ds20tln10Str = jsonStr.replace("'ds-20-ngang':", "'ds20-tln10-ngang':");

// Find TEMPLATES definition
const templatesRegex = /const TEMPLATES = \{/;
const match = html.match(templatesRegex);

if (match && !html.includes("'ds-20-ngang': {\n    \"numQ\": 20")) {
    const injectStr = jsonStr + '\n' + ds20tln10Str + '\n';
    html = html.replace(templatesRegex, "const TEMPLATES = {\n" + injectStr);
    fs.writeFileSync('sang-math-omr/index.html', html, 'utf8');
    console.log("Injected coords into TEMPLATES successfully.");
} else {
    console.log("TEMPLATES already has it or not found.");
}
