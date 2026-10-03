#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const vm = require('vm');

const [, , sourceArg] = process.argv;
if (!sourceArg) {
    console.error('Dùng: node scripts/generate-omr-key-qr.cjs <file-de.typ>');
    process.exit(1);
}

const sourcePath = path.resolve(sourceArg);
const source = fs.readFileSync(sourcePath, 'utf8');
const codeMatch = source.match(/#let\s+ma-de\s*=\s*"(\d{1,4})"/);
if (!codeMatch) throw new Error('Thiếu khai báo #let ma-de = "0001".');
const made = codeMatch[1].padStart(4, '0');

function blocks(name) {
    const found = [];
    const pattern = new RegExp(`#${name}\\s*\\(`, 'g');
    let start = 0;
    let match;
    while ((match = pattern.exec(source)) !== null) {
        start = match.index;
        let depth = 1;
        let math = false;
        let end = pattern.lastIndex;
        for (; end < source.length; end += 1) {
            if (source[end] === '$') math = !math;
            if (!math && source[end] === '(') depth += 1;
            if (!math && source[end] === ')') {
                depth -= 1;
                if (depth === 0) break;
            }
        }
        found.push(source.slice(start, end + 1));
        pattern.lastIndex = end + 1;
    }
    return found;
}

function topLevelItems(content) {
    const items = [];
    let start = 0, square = 0, round = 0, brace = 0, math = false;
    for (let index = 0; index < content.length; index += 1) {
        const char = content[index];
        if (char === '$') math = !math;
        else if (!math && char === '[') square += 1;
        else if (!math && char === ']') square -= 1;
        else if (!math && char === '(') round += 1;
        else if (!math && char === ')') round -= 1;
        else if (!math && char === '{') brace += 1;
        else if (!math && char === '}') brace -= 1;
        else if (!math && char === ',' && square === 0 && round === 0 && brace === 0) {
            items.push(content.slice(start, index).trim());
            start = index + 1;
        }
    }
    const last = content.slice(start).trim();
    if (last) items.push(last);
    return items;
}

function bracketText(value) {
    const match = value.match(/^\[([\s\S]*)\]$/);
    return match ? match[1].trim().replace(/\$/g, '') : value.trim();
}

function choiceGroup(block, label) {
    const marker = block.match(/\n\s*\(\s*\n/);
    if (!marker) throw new Error(`Không tìm được nhóm lựa chọn ở ${label}.`);
    const start = marker.index + marker[0].indexOf('(');
    let depth = 0, math = false;
    for (let index = start; index < block.length; index += 1) {
        if (block[index] === '$') math = !math;
        if (!math && block[index] === '(') depth += 1;
        if (!math && block[index] === ')') {
            depth -= 1;
            if (depth === 0) return block.slice(start + 1, index);
        }
    }
    throw new Error(`Nhóm lựa chọn chưa đóng ở ${label}.`);
}

const key = { mcq: {}, tf: {}, tln: {} };
blocks('tn').forEach((block, index) => {
    const choices = topLevelItems(choiceGroup(block, `TN ${index + 1}`));
    const correct = choices.findIndex(option => /^True\s*\(/.test(option));
    if (correct < 0) throw new Error(`Câu TN ${index + 1} chưa có True(...).`);
    key.mcq[index + 1] = 'ABCD'.at(correct);
});
blocks('ds').forEach((block, index) => {
    const statements = topLevelItems(choiceGroup(block, `Đ/S ${index + 1}`));
    if (statements.length !== 4) throw new Error(`Câu Đ/S ${index + 1} phải có 4 ý.`);
    const question = Object.keys(key.mcq).length + index + 1;
    key.tf[question] = Object.fromEntries('abcd'.split('').map((label, statementIndex) => [label, /^True\s*\(/.test(statements[statementIndex]) ? 'Đ' : 'S']));
});
blocks('tln').forEach((block, index) => {
    const args = topLevelItems(block.slice(block.indexOf('(') + 1, -1));
    if (args.length < 2) throw new Error(`Câu TLN ${index + 1} thiếu đáp án.`);
    const question = Object.keys(key.mcq).length + Object.keys(key.tf).length + index + 1;
    key.tln[question] = bracketText(args[1]);
});

const payload = {
    z: 1,
    m: { source: 'ConicTypst', made, omr: { id: '12-4-6ngang', mcq: Object.keys(key.mcq).length, tf: Object.keys(key.tf).length, tln: Object.keys(key.tln).length, paper: 'a5' } },
    k: { [made]: [Object.values(key.mcq).join(''), Object.keys(key.tf).map(Number).sort((a, b) => a - b)[0] || 0, Object.keys(key.tf).sort((a, b) => a - b).flatMap(question => ['a', 'b', 'c', 'd'].map(label => key.tf[question][label])).join(''), Object.keys(key.tln).map(Number).sort((a, b) => a - b)[0] || 0, Object.keys(key.tln).sort((a, b) => a - b).map(question => key.tln[question])] }
};
const encoded = `SMKEY:1:${Buffer.from(JSON.stringify(payload), 'utf8').toString('base64')}`;

const output = `// Tự sinh bởi scripts/generate-omr-key-qr.cjs. Không sửa tay.
#import "@preview/cades:0.3.1": qr-code
#let omr-key-qr = qr-code("${encoded}", width: 3cm)
`;
const outputPath = path.join(path.dirname(sourcePath), `${path.basename(sourcePath, '.typ')}-omr-key.typ`);
fs.writeFileSync(outputPath, output);
const jsonOutputPath = path.join(path.dirname(sourcePath), `${path.basename(sourcePath, '.typ')}-dap-an.json`);
fs.writeFileSync(jsonOutputPath, JSON.stringify(payload));
console.log(`QR key ${made}: ${Object.keys(key.mcq).length} TN, ${Object.keys(key.tf).length} DS, ${Object.keys(key.tln).length} TLN`);
console.log(outputPath);