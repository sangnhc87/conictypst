import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const { getMockMacros } = require('./scripts/docx_backend.js');
console.log(getMockMacros('hocsinh'));
