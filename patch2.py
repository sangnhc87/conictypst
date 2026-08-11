with open("sang-math-omr/index.html", "r") as f:
    content = f.read()

card_html = """
                        <div class="tmpl-card" data-type="a3-cat-phach" onclick="selectTemplate('a3-cat-phach', this)">
                            <div class="tmpl-icon">📄</div>
                            <div class="tmpl-name">A3 Cắt Phách</div>
                            <div class="tmpl-desc">Phiếu thi tự luận và trắc nghiệm A3</div>
                            <span class="tmpl-badge" style="background: #f1f5f9; color: #475569; border-color: #e2e8f0;">A3 Ngang</span>
                        </div>
"""

# Insert into Sinh Phiếu tab (id="tmplCards")
if 'data-type="a3-cat-phach"' not in content.split('id="tmplCards"')[1].split('<div class="tmpl-card" data-type="12-4-6ngang"')[0]:
    content = content.replace(
        '<div class="tmpl-card" data-type="12-4-6ngang"',
        card_html + '                        <div class="tmpl-card" data-type="12-4-6ngang"',
        1
    )

# Insert into Tô Phiếu tab (id="fillTmplCards")
if 'data-type="a3-cat-phach"' not in content.split('id="fillTmplCards"')[1].split('<div class="tmpl-card" data-type="12-4-6ngang"')[0]:
    content = content.replace(
        'id="fillTmplCards" style="display:grid; grid-template-columns: repeat(auto-fill, minmax(130px, 1fr)); gap:10px; margin-bottom:15px;">',
        'id="fillTmplCards" style="display:grid; grid-template-columns: repeat(auto-fill, minmax(130px, 1fr)); gap:10px; margin-bottom:15px;">\n' + card_html.replace("selectTemplate", "selectFillTemplate"),
        1
    )

with open("sang-math-omr/index.html", "w") as f:
    f.write(content)
print("Added tmpl-card to Sinh Phiếu and Tô Phiếu")
