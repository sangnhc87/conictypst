import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

with open('temp_session.js', 'r', encoding='utf-8') as f:
    session_js = f.read()

# Insert session_js right before closing </script> in index.html
if 'let gradeResults = [];' in content:
    # Append session_js
    content = content.replace('let gradeResults = [];', session_js + '\nlet gradeResults = [];')
else:
    content = content.replace('</script>\n</body>', session_js + '\n</script>\n</body>')

# Update renderStats to filter by session
old_render_start = "    function renderStats() {"
new_render_start = """    function renderStats() {
        const sessionFilter = document.getElementById('statsSessionSelect') ? document.getElementById('statsSessionSelect').value : 'All';
        const tbody = document.getElementById('resultsBody');
        tbody.innerHTML = '';
        
        let filtered = gradeResults;
        if (sessionFilter !== 'All') {
            filtered = gradeResults.filter(r => (r.sessionName || 'Mặc định') === sessionFilter);
        }
        
        if (filtered.length === 0) {
            tbody.innerHTML = '<tr><td colspan="8" style="text-align:center;color:var(--muted);padding:30px">Chưa có kết quả</td></tr>';
            return;
        }
"""

# Replace the beginning of renderStats
content = re.sub(
    r"    function renderStats\(\) \{[\s\S]*?if \(gradeResults\.length === 0\) \{[\s\S]*?return;\n        \}",
    new_render_start,
    content
)

# In renderStats loop, we iterate over filtered instead of gradeResults
content = content.replace('gradeResults.forEach((r, idx) => {', 'filtered.forEach((r, originalIdx) => {\n            const idx = gradeResults.indexOf(r);')

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
