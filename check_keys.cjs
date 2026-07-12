const fs = require('fs');
const html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

// Use regex to find keys in TEMPLATES object
const match = html.match(/const TEMPLATES = \{([\s\S]*?)\n        \};\n/);
if (match) {
    const lines = match[1].split('\n');
    for (const line of lines) {
        if (line.match(/^\s*'([^']+)': \{/)) {
            console.log("Found key in TEMPLATES:", line.trim());
        }
    }
}
