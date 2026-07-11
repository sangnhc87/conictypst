const fs = require('fs');
const jsdom = require("jsdom");
const { JSDOM } = jsdom;
const html = fs.readFileSync('index.html', 'utf8');
const dom = new JSDOM(html);
const window = dom.window;
const document = window.document;

// evaluate scripts
const scripts = document.querySelectorAll('script');
for (let script of scripts) {
  if (script.textContent) {
    try {
      window.eval(script.textContent);
    } catch (e) {
      console.log("Error in script:", e);
    }
  }
}
