import json

with open("bubbles_a4.json", "r") as f:
    bubbles = json.load(f)

bubbles = sorted(bubbles, key=lambda b: (b[1], b[0]))
for i, b in enumerate(bubbles[:20]):
    print(f"{i}: {b}")
