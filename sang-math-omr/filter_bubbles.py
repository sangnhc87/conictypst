import json

with open("bubbles.json", "r") as f:
    bubbles = json.load(f)

bubbles = [b for b in bubbles if b["y"] > 80]
with open("bubbles.json", "w") as f:
    json.dump(bubbles, f)

print(f"Filtered to {len(bubbles)} bubbles.")
