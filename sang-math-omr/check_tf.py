import re
import json

with open("index.html", "r") as f:
    html = f.read()

match = re.search(r"'12-4-6ngang':\s*(\{.*?\})\s*,\s*'tn-50'", html, re.DOTALL)
if match:
    # We can't eval js to json easily, let's just regex find "tf": { ... }
    tf_match = re.search(r'"tf":\s*(\{.*?\})', match.group(1), re.DOTALL)
    if tf_match:
        print(tf_match.group(0)[:500])
    else:
        print("tf not found in 12-4-6ngang")
else:
    print("12-4-6ngang not found")
