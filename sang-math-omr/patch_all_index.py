import re

with open("index.html", "r") as f:
    html = f.read()

# 1. Add numQ: 12 to 12-4-6ngang
if '"warp": {' in html and 'numQ: 12' not in html.split('12-4-6ngang')[1][:200]:
    html = html.replace("'12-4-6ngang': {\n  \"warp\": {", "'12-4-6ngang': {\n  numQ: 12, numSbd: 6, numMade: 3,\n  \"warp\": {")

# 2. Add to sheetTypeGrade
dropdown_html = '<select class="form-input" id="sheetTypeGrade" onchange="onSheetTypeChange()">\n              <option value="12-4-6ngang">A5 Ngang (Toán 12-4-6)</option>'
if 'value="12-4-6ngang"' not in html.split('id="sheetTypeGrade"')[1][:200]:
    html = html.replace('<select class="form-input" id="sheetTypeGrade" onchange="onSheetTypeChange()">', dropdown_html)

# 3. Add to numMap
html = html.replace("'thptqg-toan': 12 };", "'thptqg-toan': 12, '12-4-6ngang': 12 };")

# 4. isMixed
html = html.replace("const isMixed = type === 'thptqg-toan';", "const isMixed = (type === 'thptqg-toan' || type === '12-4-6ngang');")

# 5. tf and tln keys
html = html.replace("tf: (sheetType === 'thptqg-toan') ? tfAnswerKey : {},", "tf: (sheetType === 'thptqg-toan' || sheetType === '12-4-6ngang') ? tfAnswerKey : {},")
html = html.replace("tln: (sheetType === 'thptqg-toan') ? tlnAnswerKey : {}", "tln: (sheetType === 'thptqg-toan' || sheetType === '12-4-6ngang') ? tlnAnswerKey : {}")

# 6. if (currentTemplate === TEMPLATES['thptqg-toan'])
html = html.replace("if (currentTemplate === TEMPLATES['thptqg-toan']) {", "if (currentTemplate === TEMPLATES['thptqg-toan'] || currentTemplate === TEMPLATES['12-4-6ngang']) {")

with open("index.html", "w") as f:
    f.write(html)
print("index.html patched!")
