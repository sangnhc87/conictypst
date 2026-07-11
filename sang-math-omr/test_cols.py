import json

with open("template.json", "r") as f:
    template = json.load(f)

for q in range(13, 17):
    print(f"TF Q{q}:")
    for sub in range(4):
        print(f"  {sub}: {template['tf'][str(q)][sub]}")

