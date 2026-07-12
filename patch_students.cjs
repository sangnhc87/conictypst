const fs = require('fs');
let html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

// 1. Add persist to importStudents
const impSearch = `        function importStudents() {
            const text = document.getElementById('manualStudents').value.trim();
            if (!text) return;
            studentList = text.split('\\n').map(line => {
                const parts = line.trim().split(/[,;\\t]/);
                return { sbd: (parts[0] || '').trim(), name: (parts[1] || '').trim(), cls: (parts[2] || '').trim() };
            }).filter(s => s.sbd);
            renderClassTable();
        }`;
const impReplace = `        async function importStudents() {
            const text = document.getElementById('manualStudents').value.trim();
            if (!text) return;
            studentList = text.split('\\n').map(line => {
                const parts = line.trim().split(/[,;\\t]/);
                return { sbd: (parts[0] || '').trim(), name: (parts[1] || '').trim(), cls: (parts[2] || '').trim() };
            }).filter(s => s.sbd);
            await window.OMRDB.set('omr_studentList', JSON.stringify(studentList));
            renderClassTable();
        }`;
if (html.includes(impSearch)) {
    html = html.replace(impSearch, impReplace);
}

// 2. Add persist to clearStudents
const clearSearch = `        function clearStudents() {
            studentList = [];
            document.getElementById('manualStudents').value = '';
            renderClassTable();
        }`;
const clearReplace = `        async function clearStudents() {
            studentList = [];
            document.getElementById('manualStudents').value = '';
            await window.OMRDB.set('omr_studentList', '[]');
            renderClassTable();
        }`;
if (html.includes(clearSearch)) {
    html = html.replace(clearSearch, clearReplace);
}

// 3. Load students on startup in loadFromStorage
const loadSearch = `if (gradeResults.length > 0) {`;
const loadReplace = `const stRaw = await window.OMRDB.get('omr_studentList');
                    if (stRaw) {
                        studentList = JSON.parse(stRaw);
                        renderClassTable();
                    }
                    if (gradeResults.length > 0) {`;
if (html.includes(loadSearch)) {
    html = html.replace(loadSearch, loadReplace);
}

fs.writeFileSync('sang-math-omr/index.html', html, 'utf8');
console.log('Patched student list persistence!');
