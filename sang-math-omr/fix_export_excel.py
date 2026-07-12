import re

with open('index.html', 'r') as f:
    html = f.read()

# The bad exportExcel is:
#         function exportExcel() {
#             exportCSV(); // CSV opens in Excel by default
#         }
html = re.sub(r"\s*function exportExcel\(\) \{\s*exportCSV\(\);\s*// CSV opens in Excel by default\s*\}", "", html)

with open('index.html', 'w') as f:
    f.write(html)
