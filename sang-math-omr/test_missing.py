import json

with open("bubbles_a4.json", "r") as f:
    bubbles = json.load(f)

# Y ranges for sections
sbd = [b for b in bubbles if b["y"] < 350 and b["x"] < 500]
made = [b for b in bubbles if b["y"] < 350 and b["x"] > 500]
mcq = [b for b in bubbles if 350 < b["y"] < 600 and b["x"] < 1000]
tf = [b for b in bubbles if 350 < b["y"] < 600 and b["x"] > 1000]
tln = [b for b in bubbles if b["y"] > 600]

print(f"SBD: {len(sbd)}")
print(f"Made: {len(made)}")
print(f"MCQ: {len(mcq)}")
print(f"TF: {len(tf)}")
print(f"TLN: {len(tln)}")
