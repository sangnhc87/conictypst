import json

with open("template.json", "r") as f:
    template = json.load(f)

print(template.get('tf', 'No TF'))
