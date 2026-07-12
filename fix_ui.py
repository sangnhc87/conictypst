import re

with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

# 1. Remove select options
html = re.sub(r'\s*<option value="ds-20-ngang">.*?</option>', '', html)
html = re.sub(r'\s*<option value="tln-10-ngang">.*?</option>', '', html)

# 2. Remove tmpl-cards for ds-20-ngang and tln-10-ngang
html = re.sub(r'\s*<div class="tmpl-card" data-type="ds-20-ngang".*?</div>', '', html, flags=re.DOTALL)
html = re.sub(r'\s*<div class="tmpl-card" data-type="tln-10-ngang".*?</div>', '', html, flags=re.DOTALL)

# 3. Remove expectedMade and expectedSbd inputs
# <div class="form-group" style="flex:1;margin:0">
#     <label>Mã đề kỳ vọng</label>
#     <input class="form-input" id="expectedMade" placeholder="VD: 001" maxlength="3">
# </div>
# </div>
# <div class="form-group">
#     <label>SBD kỳ vọng (tuỳ chọn)</label>
#     <input class="form-input" id="expectedSbd" placeholder="VD: 0025" maxlength="4">
# </div>
html = re.sub(r'\s*<div class="form-group"[^>]*>\s*<label>Mã đề kỳ vọng.*?</label>\s*<input[^>]*id="expectedMade".*?>\s*</div>', '', html, flags=re.DOTALL)
html = re.sub(r'\s*<div class="form-group"[^>]*>\s*<label>SBD kỳ vọng.*?</label>\s*<input[^>]*id="expectedSbd".*?>\s*</div>', '', html, flags=re.DOTALL)

# Also remove resMatch from the AR result box (if it exists)
# <div>SBD/Mã đề: <span id="resMatch" style="font-weight:bold;color:var(--green)">✅ Khớp hoàn toàn</span></div>
html = re.sub(r'\s*<div>SBD/Mã đề:\s*<span id="resMatch".*?</span></div>', '', html, flags=re.DOTALL)

# Also remove the logic in JS
# const expSbd = document.getElementById('expectedSbd').value;
# const expMade = document.getElementById('expectedMade').value;
# let matchTxt = '✅ Khớp hoàn toàn', matchClr = 'var(--green)';
# if (expSbd && result.sbd !== expSbd) { matchTxt = `⚠️ Lệch SBD (${result.sbd})`; matchClr = 'var(--orange)'; }
# else if (expMade && result.made !== expMade) { matchTxt = `⚠️ Lệch Mã đề (${result.made})`; matchClr = 'var(--orange)'; }
# document.getElementById('resMatch').textContent = matchTxt;
# document.getElementById('resMatch').style.color = matchClr;
js_logic_to_remove = r"\s*const expSbd = document\.getElementById\('expectedSbd'\)\.value;.*?(?:document\.getElementById\('resMatch'\)\.style\.color = matchClr;|document\.getElementById\('resMatch'\)\.style\.color=matchClr;)"
html = re.sub(js_logic_to_remove, '', html, flags=re.DOTALL)

with open('sang-math-omr/index.html', 'w') as f:
    f.write(html)
