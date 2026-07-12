import re

with open("public/hdsd/global-nav.js", "r", encoding="utf-8") as f:
    js = f.read()

new_html = """      <div class="unified-nav-right">
        <a href="ecosystem.html" class="unified-nav-link ${isEcosystem ? 'active' : ''}"><i data-lucide="globe"></i> Hệ sinh thái</a>
        <a href="dashboard.html" class="unified-nav-link ${isDashboard ? 'active' : ''}"><i data-lucide="zap"></i> Dashboard</a>
        <a href="index.html" class="unified-nav-link ${isHDSD ? 'active' : ''}"><i data-lucide="book-open"></i> Hướng dẫn</a>
      </div>"""

js = re.sub(r'<div class="unified-nav-right">.*?</div>', new_html, js, flags=re.DOTALL)

# Add isEcosystem boolean
js = js.replace("const isHDSD = currentPath.startsWith('index');", "const isHDSD = currentPath.startsWith('index');\n  const isEcosystem = currentPath.startsWith('ecosystem');")

with open("public/hdsd/global-nav.js", "w", encoding="utf-8") as f:
    f.write(js)
print("Updated global-nav.js again")
