const fs = require('fs');
let html = fs.readFileSync('index.html', 'utf8');

// Fix Trắc nghiệm padding
html = html.replace(
  /grid\.cell\[#align\(right\)\[#text\(7pt\)\[\$\{i\+1\}\.\]\]\]/g,
  'grid.cell[#pad(y:3pt)[#align(right)[#text(7pt)[${i+1}.]]]]'
);
html = html.replace(
  /grid\.cell\[#align\(center\)\[#circle\(radius:4pt,stroke:\.5pt\)\[#align\(center\+horizon\)\[#text\(5pt\)\[([ABCD])\]\]\]\]\]/g,
  'grid.cell[#pad(y:3pt)[#align(center)[#circle(radius:4pt,stroke:.5pt)[#align(center+horizon)[#text(5pt)[$1]]]]]]'
);

// Fix Đúng/Sai vertical spacing
html = html.replace(
  /\.join\('\\n      '\)\}/g,
  ".join('\\n      #v(4pt)\\n      ')}"
);

// Fix SBD and Mã Đề layout (add row-gutter and 1fr columns, center the grids)
html = html.replace(
  /#grid\(columns:6, gutter:2pt, align:center/g,
  '#align(center)[#grid(columns:(1fr,)*6, row-gutter:2pt, align:center'
);
html = html.replace(
  /#grid\(columns:6, gutter:1pt, align:center/g,
  '#align(center)[#grid(columns:(1fr,)*6, row-gutter:2.5pt, align:center'
);
// Fix the closing bracket for SBD #align
html = html.replace(
  /\.flatten\(\)\)/g,
  '.flatten())]'
);

html = html.replace(
  /#grid\(columns:3, gutter:2pt, align:center/g,
  '#align(center)[#grid(columns:(1fr,)*3, row-gutter:2pt, align:center'
);
html = html.replace(
  /#grid\(columns:3, gutter:1pt, align:center/g,
  '#align(center)[#grid(columns:(1fr,)*3, row-gutter:2.5pt, align:center'
);

// Fix TLN alignment
html = html.replace(
  /#grid\(columns:5, gutter:2pt, align:center,/g,
  '#align(center)[#grid(columns:(1fr,)*5, row-gutter:4pt, align:center,'
);

fs.writeFileSync('index.html', html);
console.log("Layout fixed!");
