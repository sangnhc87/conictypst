import re

with open("public/hdsd/global-nav.js", "r", encoding="utf-8") as f:
    js = f.read()

new_html = """      <div class="unified-nav-right">
        <a href="exam-templates.html?tab=ecoPanel" class="unified-nav-link"><i data-lucide="globe"></i> Hệ sinh thái</a>
        <a href="dashboard.html" class="unified-nav-link ${isDashboard ? 'active' : ''}"><i data-lucide="zap"></i> Dashboard</a>
        <a href="index.html" class="unified-nav-link ${isHDSD ? 'active' : ''}"><i data-lucide="book-open"></i> Hướng dẫn</a>
      </div>"""

js = re.sub(r'<div class="unified-nav-right">.*?</div>', new_html, js, flags=re.DOTALL)

with open("public/hdsd/global-nav.js", "w", encoding="utf-8") as f:
    f.write(js)
print("Updated global-nav.js")
