import json
import os

print("=== Lần 5 ===")
log_path_5 = "/Users/admin/.gemini/antigravity/brain/d9a93480-e578-48e8-9e27-fb51ad036df9/.system_generated/logs/transcript.jsonl"
if os.path.exists(log_path_5):
    with open(log_path_5, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        for idx in range(max(0, len(lines)-10), len(lines)):
            data = json.loads(lines[idx])
            print(f"Step {data.get('step_index')}: {data.get('type')}")
            if data.get('type') == 'RUN_COMMAND' or data.get('type') == 'ERROR_MESSAGE' or 'error' in str(data).lower():
                print(f"  Content: {str(data)[:1000]}")

print("\n=== Lần 9 ===")
log_path_9 = "/Users/admin/.gemini/antigravity/brain/9504dec3-fec0-4021-92ac-bff2a8f13f45/.system_generated/logs/transcript.jsonl"
if os.path.exists(log_path_9):
    with open(log_path_9, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        for idx in range(max(0, len(lines)-10), len(lines)):
            data = json.loads(lines[idx])
            print(f"Step {data.get('step_index')}: {data.get('type')}")
            if data.get('type') == 'RUN_COMMAND' or data.get('type') == 'ERROR_MESSAGE' or 'error' in str(data).lower():
                print(f"  Content: {str(data)[:1000]}")
