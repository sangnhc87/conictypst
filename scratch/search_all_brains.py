import os

brain_dir = "/Users/admin/.gemini/antigravity/brain"

matches = []

for root, dirs, files in os.walk(brain_dir):
    for f in files:
        if f.endswith(".jsonl") or f.endswith(".txt") or f.endswith(".typ"):
            path = os.path.join(root, f)
            try:
                with open(path, "r", encoding="utf-8", errors="ignore") as file:
                    content = file.read()
                    if "Adjacent-Pair PIE" in content and "table(" in content:
                        print(f"Found in {path} (size: {len(content)})")
                        matches.append(path)
            except Exception as e:
                pass

print(f"Total matches: {len(matches)}")
