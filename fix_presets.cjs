const fs = require('fs');
let html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

const regex = /const presets = \{[\s\S]*?'ds-12': \{ mcq: 0, tf: 12, tln: 0, paper: 'a4' \},[\s\S]*?\n\s*\};/g;

const newPresets = `const presets = {
                '12-4-6ngang': { mcq: 12, tf: 4, tln: 6, paper: 'a5' },
                'thptqg-toan': { mcq: 12, tf: 4, tln: 6, paper: 'a4' },
                'tn-40': { mcq: 40, tf: 0, tln: 0, paper: 'a4' },
                'tn-60': { mcq: 60, tf: 0, tln: 0, paper: 'a4' },
                'ds-12': { mcq: 0, tf: 12, tln: 0, paper: 'a4' },
                'ds-20-ngang': { mcq: 0, tf: 20, tln: 0, paper: 'a5' },
                'tln-10-ngang': { mcq: 0, tf: 0, tln: 10, paper: 'a5' },
                'ds20-tln10-ngang': { mcq: 0, tf: 20, tln: 10, paper: 'a5' },
                'tln-10': { mcq: 0, tf: 0, tln: 10, paper: 'a4' },
                'hybrid': { mcq: 28, tf: 12, tln: 0, paper: 'a4' }
            };`;

const count = (html.match(regex) || []).length;
console.log(`Found ${count} occurrences of presets object.`);

html = html.replace(regex, newPresets);

fs.writeFileSync('sang-math-omr/index.html', html, 'utf8');
console.log('Fixed index.html presets!');
