const fs = require('fs');
const bubs = JSON.parse(fs.readFileSync('bubbles_ds-20-ngang-300.json', 'utf8'));

// We use 1500x1060 as the base for the bubbles, but the image is 1500x1060 as warped.
// We can just create an SVG.

let svg = `<svg viewBox="0 0 1500 1060" width="1500" height="1060" xmlns="http://www.w3.org/2000/svg">
  <!-- To test we just draw the dots -->
`;
for (let b of bubs) {
    svg += `<circle cx="${b.x}" cy="${b.y}" r="6" fill="red" />\n`;
}
svg += `</svg>`;
fs.writeFileSync('debug.html', `<html><body>${svg}</body></html>`);
