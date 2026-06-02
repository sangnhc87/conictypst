import os

brain_dir = "/Users/admin/.gemini/antigravity/brain"
target = "Bảng tính toán đóng góp chi tiết"

matches = []

for root, dirs, files in os.walk(brain_dir):
    for f in files:
        path = os.path.join(root, f)
        try:
            with open(path, "r", encoding="utf-8", errors="ignore") as file:
                content = file.read()
                if target in content:
                    print(f"Found in {path} (size: {len(content)})")
                    matches.append(path)
        except Exception as e:
            pass

print(f"Total matches: {len(matches)}")
