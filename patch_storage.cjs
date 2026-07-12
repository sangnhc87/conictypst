const fs = require('fs');
let html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

// Inject <script src="js/omr_db.js"></script>
if (!html.includes('src="js/omr_db.js"')) {
    html = html.replace('<script src="js/omr_engine.js"></script>', '<script src="js/omr_db.js"></script>\n    <script src="js/omr_engine.js"></script>');
}

// Replace saveToStorage
const saveSearch = `function saveToStorage() {
            try {
                // Store without imageDataURL to keep localStorage small
                const slim = gradeResults.map(r => ({
                    ...r, imageDataURL: r.imageDataURL ? '__img__' : null
                }));
                localStorage.setItem(STORAGE_KEY, JSON.stringify(slim));
            } catch(e) { /* ignore QuotaExceeded */ }
        }`;
const saveReplace = `async function saveToStorage() {
            try {
                await window.OMRDB.set(STORAGE_KEY, JSON.stringify(gradeResults));
            } catch(e) { console.error('Save error', e); }
        }`;

if (html.includes(saveSearch)) {
    html = html.replace(saveSearch, saveReplace);
}

// Replace loadFromStorage
const loadSearch = `function loadFromStorage() {
            try {
                const raw = localStorage.getItem(STORAGE_KEY);
                if (raw) {
                    const data = JSON.parse(raw);
                    gradeResults = data.map(r => ({ ...r, imageDataURL: null }));`;

const loadReplace = `async function loadFromStorage() {
            try {
                let raw = await window.OMRDB.get(STORAGE_KEY);
                if (!raw) raw = localStorage.getItem(STORAGE_KEY); // fallback migration
                if (raw) {
                    const data = JSON.parse(raw);
                    gradeResults = data;`;

if (html.includes(loadSearch)) {
    html = html.replace(loadSearch, loadReplace);
}

fs.writeFileSync('sang-math-omr/index.html', html, 'utf8');
console.log('Patched index.html for omr_db integration!');
