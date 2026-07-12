import re

with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

# Only remove select options for ds-20-ngang and tln-10-ngang, leaving other templates untouched
html = re.sub(r'\s*<option value="ds-20-ngang">.*?</option>', '', html)
html = re.sub(r'\s*<option value="tln-10-ngang">.*?</option>', '', html)

# Carefully remove the specific tmpl-card divs. Since regex with re.DOTALL and nested divs is dangerous,
# we use exact string replacements based on the original HTML content of those cards.
card_ds20 = """                        <div class="tmpl-card" data-type="ds-20-ngang" onclick="selectTemplate('ds-20-ngang', this)">
                            <div class="tmpl-icon">✅</div>
                            <div class="tmpl-name">ĐS-20</div>
                            <div class="tmpl-desc">20 câu Đúng/Sai<br>Luyện tập chuyên sâu</div>
                            <span class="tmpl-badge" style="background: #e0f2fe; color: #0284c7; border-color: #bae6fd;">A5 Ngang</span>
                        </div>"""

card_tln10 = """                        <div class="tmpl-card" data-type="tln-10-ngang" onclick="selectTemplate('tln-10-ngang', this)">
                            <div class="tmpl-icon">✏️</div>
                            <div class="tmpl-name">TLN-10</div>
                            <div class="tmpl-desc">10 câu Tự Luận Ngắn<br>Form điền đáp án</div>
                            <span class="tmpl-badge" style="background: #e0f2fe; color: #0284c7; border-color: #bae6fd;">A5 Ngang</span>
                        </div>"""

html = html.replace(card_ds20, "")
html = html.replace(card_tln10, "")

# Same for inputs. Find their exact text to replace to avoid DOTALL issues
expected_inputs = """                            <div class="form-group" style="flex:1;margin:0">
                                <label>Mã đề kỳ vọng</label>
                                <input class="form-input" id="expectedMade" placeholder="VD: 001" maxlength="3">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>SBD kỳ vọng (tuỳ chọn)</label>
                            <input class="form-input" id="expectedSbd" placeholder="VD: 0025" maxlength="4">
                        </div>"""

html = html.replace(expected_inputs, "                        </div>")

resMatch = """                        <div>SBD/Mã đề: <span id="resMatch" style="font-weight:bold;color:var(--green)">✅ Khớp hoàn toàn</span></div>"""
html = html.replace(resMatch, "")

# Remove JS
js_remove = """            const expSbd = document.getElementById('expectedSbd').value;
            const expMade = document.getElementById('expectedMade').value;
            let matchTxt = '✅ Khớp hoàn toàn', matchClr = 'var(--green)';
            if (expSbd && result.sbd !== expSbd) { matchTxt = `⚠️ Lệch SBD (${result.sbd})`; matchClr = 'var(--orange)'; }
            else if (expMade && result.made !== expMade) { matchTxt = `⚠️ Lệch Mã đề (${result.made})`; matchClr = 'var(--orange)'; }
            document.getElementById('resMatch').textContent = matchTxt;
            document.getElementById('resMatch').style.color = matchClr;"""
html = html.replace(js_remove, "")

with open('sang-math-omr/index.html', 'w') as f:
    f.write(html)

