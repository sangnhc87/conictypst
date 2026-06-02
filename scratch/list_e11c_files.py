import os

brain_path = "/Users/admin/.gemini/antigravity/brain/e11ca529-f9f3-4f16-b3ca-9d8a585a0de3"

if os.path.exists(brain_path):
    print("Files in e11c brain folder:")
    for root, dirs, files in os.walk(brain_path):
        for f in files:
            path = os.path.join(root, f)
            print(f"- {path} ({os.path.getsize(path)} bytes)")
else:
    print("Brain folder does not exist!")
