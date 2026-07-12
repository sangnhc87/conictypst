import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Fix let currentTemplate = TEMPLATES["12-4-6ngang"];
content = content.replace('let currentTemplate = TEMPLATES["12-4-6ngang"];', 'let currentTemplate = null;')

# Add it to window.onload
old_onload = """window.onload = function() {
    if(oldOnload) oldOnload();
    loadSessions();
};"""
new_onload = """window.onload = function() {
    if(oldOnload) oldOnload();
    currentTemplate = window.TEMPLATES ? window.TEMPLATES["12-4-6ngang"] : null;
    loadSessions();
};"""
content = content.replace(old_onload, new_onload)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
print("index.html patched TEMPLATES")
