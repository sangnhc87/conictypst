import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/d9a93480-e578-48e8-9e27-fb51ad036df9/.system_generated/logs/transcript.jsonl"
if os.path.exists(log_path):
    with open(log_path, 'r', encoding='utf-8') as f:
        for line in f:
            data = json.loads(line)
            print(f"[{data.get('type')}] source={data.get('source')} status={data.get('status')}")
            if data.get('type') == 'ERROR_MESSAGE' or 'error' in str(data).lower():
                print(f"  Content: {str(data)[:1000]}")
else:
    print("No log for Lần 5.")
