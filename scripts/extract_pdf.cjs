const fs = require('fs');
const pdf = require('pdf-parse');

const dataBuffer = fs.readFileSync('question-bank/pdfs/de-cuoi-hoc-ky-1-toan-12-nam-2025-2026-so-gddt-hung-yen.pdf');

pdf(dataBuffer).then(function(data) {
    fs.writeFileSync('question-bank/pdfs/hung-yen-text.txt', data.text);
    console.log('Text extracted to hung-yen-text.txt');
}).catch(function(error){
    console.error(error);
});
