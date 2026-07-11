import json
import re

with open("index.html", "r") as f:
    html = f.read()

start_idx = html.find("'12-4-6ngang': {")
tn50_idx = html.find("'tn-50':", start_idx)

sub = html[start_idx:tn50_idx]
if '"13": [' in sub:
    print("SUCCESS")
else:
    print("FAILED")
