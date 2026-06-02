const { injectLayouts } = require('./scripts/docx_backend.js');
const fs = require('fs');
const content = fs.readFileSync('typst/De-Cac-So/2026-Tự-Chế-Lần-1 copy.typ', 'utf8');
const transformed = injectLayouts(content);

const queries = [
    { name: 'First 5 questions', regex: /#tn\([\s\S]*?qnum:\s*\d+/g, limit: 5 },
    { name: 'After resetcau', regex: /#resetcau\(\)[\s\S]*?#tn\(qnum:\s*\d+/g, limit: 5 }
];

queries.forEach(q => {
    console.log(`--- ${q.name} ---`);
    let match;
    let count = 0;
    while ((match = q.regex.exec(transformed)) !== null && count < q.limit) {
        console.log(match[0]);
        console.log('---');
        count++;
    }
});
