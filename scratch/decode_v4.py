import re
import json

path = "/Users/admin/conictypst/scratch/reconstructed_virtual_v4.typ"
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

def decode_escaped_strings(text):
    pattern = r'"([^"\\]*(?:\\.[^"\\]*)*)"'
    def repl(match):
        full_match = match.group(0)
        try:
            decoded = json.loads(full_match)
            return decoded
        except Exception as e:
            return full_match
    return re.sub(pattern, repl, text)

decoded_content = decode_escaped_strings(content)

with open(path, "w", encoding="utf-8") as f:
    f.write(decoded_content)

print("Decoding of v4 file complete.")
