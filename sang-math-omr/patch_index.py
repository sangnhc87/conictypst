import re

# Read a3-cat-phach-full.typ
with open('templates/a3-cat-phach-full.typ', 'r') as f:
    typst_code = f.read()

# Replace CLI inputs with JS template literals
typst_code = re.sub(
    r'#let school = sys.inputs.at\("school", default: ".*"\)',
    '#let school = "${school}"',
    typst_code
)
typst_code = re.sub(
    r'#let subtitle = sys.inputs.at\("subtitle", default: ".*"\)',
    '#let subtitle = "${subtitle}"',
    typst_code
)

# Escape backslashes if any (though Typst doesn't heavily use them for escapes in JS strings, we should escape backslashes and backticks)
# Typst code doesn't have backticks.
typst_code = typst_code.replace('\\', '\\\\')

# Read index.html
with open('index.html', 'r') as f:
    html = f.read()

# Find the block
start_marker = "if (type === 'a3-cat-phach') {\n            return `"
idx_start = html.find(start_marker)
if idx_start == -1:
    print("Could not find start marker")
    exit(1)

# Find the end of the return statement
idx_end = html.find('`;\n        }', idx_start)
if idx_end == -1:
    print("Could not find end marker")
    exit(1)

# Replace the block
new_html = html[:idx_start + len(start_marker)] + typst_code + html[idx_end:]

with open('index.html', 'w') as f:
    f.write(new_html)

print("index.html patched successfully.")
