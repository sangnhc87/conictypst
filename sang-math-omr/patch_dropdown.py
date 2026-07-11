with open("index.html", "r") as f:
    html = f.read()

# Add to template selector
options = '<select id="sheetType" class="form-select">\n          <option value="12-4-6ngang">A5 Ngang (Toán 12-4-6)</option>'
if 'value="12-4-6ngang"' not in html:
    html = html.replace('<select id="sheetType" class="form-select">', options)

with open("index.html", "w") as f:
    f.write(html)
print("Dropdown patched!")
