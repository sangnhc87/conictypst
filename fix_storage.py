import re

with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

# Add saveMasterAnswerKeys and loadMasterAnswerKeys
load_save_code = """
        function saveMasterAnswerKeys() {
            localStorage.setItem('omr_answerKeys_v2', JSON.stringify(window.masterAnswerKeys));
        }
        function loadMasterAnswerKeys() {
            try {
                const stored = localStorage.getItem('omr_answerKeys_v2');
                if (stored) {
                    window.masterAnswerKeys = JSON.parse(stored);
                    const sel = document.getElementById('activeMadeKey');
                    for (let made in window.masterAnswerKeys) {
                        if (made !== 'default') {
                            const opt = document.createElement('option');
                            opt.value = made;
                            opt.textContent = `Mã đề: ${made}`;
                            sel.appendChild(opt);
                        }
                    }
                }
            } catch(e) {}
        }
        // Load keys on startup
        loadMasterAnswerKeys();
"""

# IMPORTANT: my fix_state.py replaces `window.currentMadeKey = 'default';`
# only ONCE in the html (it's exactly in the chunk I inserted).
# But string.replace replaces ALL occurrences if there are multiple.
# Let's replace only the first occurrence or use a more specific target.

html = html.replace("window.currentMadeKey = 'default';", "window.currentMadeKey = 'default';\n" + load_save_code, 1)

# Add saveMasterAnswerKeys() to the setters in the Proxies
html = html.replace(
    "set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].mcq[p] = v; return true; }",
    "set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].mcq[p] = v; saveMasterAnswerKeys(); return true; }"
)
html = html.replace(
    "set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].tf[p] = v; return true; }",
    "set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].tf[p] = v; saveMasterAnswerKeys(); return true; }"
)
html = html.replace(
    "set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].tln[p] = v; return true; }",
    "set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].tln[p] = v; saveMasterAnswerKeys(); return true; }"
)

# Call saveMasterAnswerKeys in addAnswerKey and removeAnswerKey
html = html.replace("switchAnswerKey(made);", "saveMasterAnswerKeys(); switchAnswerKey(made);")
html = html.replace("delete window.masterAnswerKeys[window.currentMadeKey];", "delete window.masterAnswerKeys[window.currentMadeKey]; saveMasterAnswerKeys();")

with open('sang-math-omr/index.html', 'w') as f:
    f.write(html)
