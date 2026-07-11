import * as fs from 'fs';
import * as vm from 'vm';

const code = fs.readFileSync('temp_typst.js', 'utf8');
const context = { window: {}, console: console, fetch: () => {}, WebAssembly: {} };
vm.createContext(context);
try {
  vm.runInContext(code, context);
  console.log("window.$typst methods:", Object.keys(context.window.$typst).filter(k => typeof context.window.$typst[k] === 'function'));
  console.log("window.$typst prototype methods:", Object.getOwnPropertyNames(Object.getPrototypeOf(context.window.$typst)));
} catch (e) {
  console.error("error", e);
}
