import re

with open("sang-math-omr/index.html", "r") as f:
    content = f.read()

# 1. Add tmpl-card for a3-cat-phach
card_html = """
                        <div class="tmpl-card" data-type="a3-cat-phach" onclick="selectTemplate('a3-cat-phach', this)">
                            <div class="tmpl-icon">📄</div>
                            <div class="tmpl-name">A3 Cắt Phách</div>
                            <div class="tmpl-desc">Phiếu thi tự luận và trắc nghiệm A3</div>
                            <span class="tmpl-badge" style="background: #f1f5f9; color: #475569; border-color: #e2e8f0;">A3 Ngang</span>
                        </div>
"""
if 'data-type="a3-cat-phach"' not in content.split('id="tmplCards"')[1].split('</div>\n\n                </div>')[0]:
    content = content.replace(
        '<div class="tmpl-card" data-type="12-4-6ngang"',
        card_html + '                        <div class="tmpl-card" data-type="12-4-6ngang"',
        1
    )
    
# 2. Update generateSheetCmd
if "'a3-cat-phach': 'templates/a3-cat-phach-full.typ'" not in content:
    content = content.replace(
        "'thptqg-toan': 'templates/thptqg-toan-2025.typ',",
        "'a3-cat-phach': 'templates/a3-cat-phach-full.typ',\n                'thptqg-toan': 'templates/thptqg-toan-2025.typ',",
        1
    )

with open("sang-math-omr/index.html", "w") as f:
    f.write(content)
print("Patched index.html")
