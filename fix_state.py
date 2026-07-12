import re

with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

state_repl = """        // ---- STATE ----
        window.masterAnswerKeys = { 'default': { mcq: {}, tf: {}, tln: {} } };
        window.currentMadeKey = 'default';
        const OPTIONS = ["A", "B", "C", "D"];
        const LBLS = ["a", "b", "c", "d"];

        // Getter helpers for backwards compatibility in UI rendering
        const correctAnswers = new Proxy({}, {
            get: (t, p) => window.masterAnswerKeys[window.currentMadeKey].mcq[p],
            set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].mcq[p] = v; return true; }
        });
        const tfAnswerKey = new Proxy({}, {
            get: (t, p) => {
                if (!window.masterAnswerKeys[window.currentMadeKey].tf[p]) {
                    window.masterAnswerKeys[window.currentMadeKey].tf[p] = { a: '', b: '', c: '', d: '' };
                }
                return window.masterAnswerKeys[window.currentMadeKey].tf[p];
            },
            set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].tf[p] = v; return true; }
        });
        const tlnAnswerKey = new Proxy({}, {
            get: (t, p) => window.masterAnswerKeys[window.currentMadeKey].tln[p] || '',
            set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].tln[p] = v; return true; }
        });

        function switchAnswerKey(made) {
            window.currentMadeKey = made;
            document.getElementById('activeMadeKey').value = made;
            // Re-render UI
            const sheetType = document.getElementById('sheetTypeGrade').value;
            onSheetTypeChange();
        }

        function addAnswerKey() {
            const m = prompt("Nhập mã đề mới (VD: 101, 102...):");
            if (!m || !m.trim()) return;
            const made = m.trim();
            if (!window.masterAnswerKeys[made]) {
                window.masterAnswerKeys[made] = { mcq: {}, tf: {}, tln: {} };
                const opt = document.createElement('option');
                opt.value = made;
                opt.textContent = `Mã đề: ${made}`;
                document.getElementById('activeMadeKey').appendChild(opt);
            }
            switchAnswerKey(made);
        }

        function removeAnswerKey() {
            if (window.currentMadeKey === 'default') {
                alert("Không thể xoá mã đề mặc định!");
                return;
            }
            if (confirm(`Bạn có chắc muốn xoá đáp án của mã đề ${window.currentMadeKey}?`)) {
                delete window.masterAnswerKeys[window.currentMadeKey];
                const sel = document.getElementById('activeMadeKey');
                for (let i = 0; i < sel.options.length; i++) {
                    if (sel.options[i].value === window.currentMadeKey) {
                        sel.remove(i);
                        break;
                    }
                }
                switchAnswerKey('default');
            }
        }
"""

html = re.sub(
    r"// ---- STATE ----\s*const correctAnswers = \{\};\s*const OPTIONS = \[\"A\", \"B\", \"C\", \"D\"\];",
    state_repl,
    html,
    flags=re.DOTALL
)

# Remove the old tfAnswerKey and tlnAnswerKey constants
html = re.sub(
    r"const tfAnswerKey = \{\};\s*// \{ \"13\": \{a:'Đ',b:'S',c:'Đ',d:'Đ'\}, ... \}\s*const tlnAnswerKey = \{\};\s*// \{ \"17\": \"2.5\", ... \}",
    "// tfAnswerKey and tlnAnswerKey are proxies now",
    html
)

# Now fix the gradeImage callers in index.html to pass window.masterAnswerKeys
html = html.replace(
    """const result = await window.OmrEngine.gradeImage(fc, template, fullAnswers, apiKey, templateName, 'gemini');""",
    """const result = await window.OmrEngine.gradeImage(fc, template, window.masterAnswerKeys, apiKey, templateName, 'gemini');"""
)
html = html.replace(
    """const result = await window.OmrEngine.gradeImage(fullCanvas, template, fullAnswers, apiKey, templateName, engine);""",
    """const result = await window.OmrEngine.gradeImage(fullCanvas, template, window.masterAnswerKeys, apiKey, templateName, engine);"""
)
html = html.replace(
    """const result = await window.OmrEngine.gradeImage(entry.imgEl, template, fullAnswers, apiKey, sheetType, engine);""",
    """const result = await window.OmrEngine.gradeImage(entry.imgEl, template, window.masterAnswerKeys, apiKey, sheetType, engine);"""
)

with open('sang-math-omr/index.html', 'w') as f:
    f.write(html)
