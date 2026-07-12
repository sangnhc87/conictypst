const fs = require('fs');

let html = fs.readFileSync('index.html', 'utf-8');

// Find the tlnSection assignment
const search = `                tlnSection = parts.join('\\n');`;
const replace = `                tlnSection = parts.join('\\n');
                if (isA5) {
                    tlnSection = \`#scale(x: 85%, y: 85%, origin: top-left)[\\n\` + tlnSection + \`\\n]\`;
                }`;

if (html.includes(search) && !html.includes('scale(x: 85%')) {
    html = html.replace(search, replace);
    fs.writeFileSync('index.html', html);
    console.log("Patched tlnSection with scale for A5!");
} else {
    console.log("Already patched or not found.");
}
