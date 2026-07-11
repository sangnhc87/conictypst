const fs = require('fs');

let indexHtml = fs.readFileSync('index.html', 'utf8');

// Fix A4 alignment
indexHtml = indexHtml.replace(
    /#align\(center \+ horizon\)\[\n  #scale\(x: 95%, y: 95%, origin: center\)\[/,
    `#align(if isA5 { center + horizon } else { top + center })[
  #scale(x: 95%, y: 95%, origin: if isA5 { center } else { top })[`
);

fs.writeFileSync('index.html', indexHtml);
console.log("Fixed A4 alignment");
