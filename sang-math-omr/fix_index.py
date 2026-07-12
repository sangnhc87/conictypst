import re

with open('index.html', 'r') as f:
    html = f.read()

with open('ds-20-ngang.json', 'r') as f:
    ds20 = f.read().strip()
    ds20 = ds20[1:-1].strip() # remove wrapping { }

with open('ds20-tln10-ngang.json', 'r') as f:
    ds20tln10 = f.read().strip()
    ds20tln10 = ds20tln10[1:-1].strip()

with open('tln-10-ngang_coords.json', 'r') as f:
    tln10_coords = f.read().strip()
    tln10_coords = tln10_coords[1:-1].strip()

# 1. Inject into TEMPLATES
html = re.sub(
    r"const TEMPLATES = \{",
    "const TEMPLATES = {\n" + ds20 + ",\n" + ds20tln10 + ",\n" + tln10_coords + ",\n",
    html
)

# 2. Inject into ALL presets
# The presets should look like:
# 'ds-20-ngang': { mcq: 0, tf: 20, tln: 0, paper: 'a5' },
# 'ds20-tln10-ngang': { mcq: 0, tf: 20, tln: 10, paper: 'a5' },
# 'tln-10-ngang': { mcq: 0, tf: 0, tln: 10, paper: 'a5' },

html = re.sub(
    r"(const presets = \{)",
    r"\1\n                'ds-20-ngang': { mcq: 0, tf: 20, tln: 0, paper: 'a5' },\n                'ds20-tln10-ngang': { mcq: 0, tf: 20, tln: 10, paper: 'a5' },\n                'tln-10-ngang': { mcq: 0, tf: 0, tln: 10, paper: 'a5' },",
    html
)

# 3. Add to typst presets maps
# 'ds-20-ngang': 'templates/ds-20-ngang.typ',
# 'ds20-tln10-ngang': 'templates/ds20-tln10-ngang.typ',
# 'tln-10-ngang': 'templates/tln-10-ngang.typ',

html = re.sub(
    r"'tln-10': 'templates/tln-10.typ',",
    r"'tln-10': 'templates/tln-10.typ',\n                'ds-20-ngang': 'templates/ds-20-ngang.typ',\n                'ds20-tln10-ngang': 'templates/ds20-tln10-ngang.typ',\n                'tln-10-ngang': 'templates/tln-10-ngang.typ',",
    html
)

with open('index.html', 'w') as f:
    f.write(html)
