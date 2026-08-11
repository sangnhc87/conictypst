const fs = require('fs');

global.window = {};
global.document = {};
global.navigator = {};

const code = fs.readFileSync('./public/js/similarEngine.bundle.js', 'utf-8');

console.time("Evaluate Bundle");
try {
    eval(code);
    console.log("window.SimilarEngine exists:", !!global.window.SimilarEngine);
} catch (e) {
    console.error("Evaluation failed:", e);
}
console.timeEnd("Evaluate Bundle");

if (global.window.SimilarEngine) {
    console.log("Engine initialized successfully.");
    const menu = global.window.SimilarEngine.menuSource;
    console.log("Menu has", menu.length, "items");
}
