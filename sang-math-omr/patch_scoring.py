import re

with open("index.html", "r") as f:
    html = f.read()

# For tn-50
html = html.replace("'tn-50': {\n  \"warp\": {", "'tn-50': {\n  scoring: { mcq: { points: 10.0 / 50 } },\n  \"warp\": {")

# For tn-40
html = html.replace("'tn-40': {\n  \"warp\": {", "'tn-40': {\n  scoring: { mcq: { points: 10.0 / 40 } },\n  \"warp\": {")

# For tn-60
html = html.replace("'tn-60': {\n  \"warp\": {", "'tn-60': {\n  scoring: { mcq: { points: 10.0 / 60 } },\n  \"warp\": {")

# For 12-4-6ngang
scoring_mix = """scoring: {
    mcq: { points: 0.25 },
    tf: { points: [0.1, 0.25, 0.5, 1.0] },
    tln: { points: 0.5 }
  },
  "warp": {"""
html = html.replace("numMade: 3,\n  \"warp\": {", f"numMade: 3,\n  {scoring_mix}")

# For thptqg-toan (which is numMade: 3, "warp": { wait, let's replace manually)
html = html.replace("'thptqg-toan': {\n    numQ: 12, numSbd: 4, numMade: 3,\n    \"warp\": {", f"'thptqg-toan': {{\n    numQ: 12, numSbd: 4, numMade: 3,\n    {scoring_mix}")

with open("index.html", "w") as f:
    f.write(html)
print("done")
