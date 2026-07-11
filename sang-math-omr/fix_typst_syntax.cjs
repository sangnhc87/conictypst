const fs = require('fs');
let html = fs.readFileSync('index.html', 'utf8');

const bad1 = `#align(center)[#grid(columns:(1fr,)*3, row-gutter:2pt, align:center, ..range(3).map(i => [#rect(width:10pt,height:10pt,stroke:.6pt)[#text(8pt)[${'\\$'}{madeStr[i] || ''}]]]))]`;
const bad2 = `#align(center)[#grid(columns:(1fr,)*3, row-gutter:3pt, align:center, ..range(10).map(r => range(3).map(c => (madeStr[c] == r) ? [#circle(radius:4pt,stroke:.4pt,fill:black)[]] : [#circle(radius:4pt,stroke:.4pt)[]])).flatten())]`;

const good1 = `#let mStr = "${'\\$'}{madeStr}"
        #align(center)[#grid(columns:(1fr,)*3, row-gutter:2pt, align:center, ..range(3).map(i => [#rect(width:10pt,height:10pt,stroke:.6pt)[#text(8pt)[#if i < mStr.len() { mStr.at(i) }]]]))]`;

const good2 = `#align(center)[#grid(columns:(1fr,)*3, row-gutter:3pt, align:center, ..range(10).map(r => range(3).map(c => if c < mStr.len() and mStr.at(c) == str(r) { [#circle(radius:4pt,stroke:.4pt,fill:black)[]] } else { [#circle(radius:4pt,stroke:.4pt)[]] } )).flatten())]`;

if (!html.includes(bad1)) {
    console.error("Bad1 not found");
}
if (!html.includes(bad2)) {
    console.error("Bad2 not found");
}

html = html.replace(bad1, good1);
html = html.replace(bad2, good2);

fs.writeFileSync('index.html', html);
console.log("Typst syntax fixed");
