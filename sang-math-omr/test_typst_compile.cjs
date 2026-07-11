const fs = require('fs');
const jsdom = require("jsdom");
const { JSDOM } = jsdom;
const html = fs.readFileSync('index.html', 'utf8');

const dom = new JSDOM(html, { runScripts: "dangerously" });
const window = dom.window;

setTimeout(() => {
  try {
    const code = window.genWasmTypst({
      mcq: 12, tf: 4, tln: 6, paper: 'a4',
      school: 'Test', subtitle: 'Test', handwritten: false, realQr: true
    });
    fs.writeFileSync('test_output.typ', code);
    console.log("File saved to test_output.typ");
  } catch(e) {
    console.error("ERROR:", e);
  }
}, 500);
