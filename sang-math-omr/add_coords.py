import json

with open('index.html', 'r') as f:
    html = f.read()

# Since I just need to add the ds20-tln10-ngang to the TEMPLATES object
# We can just inject it right after 'ds-20-ngang': {
# Let's extract the SBD and MÃ ĐỀ from ds-20-ngang
