import json

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

print(f"Total lines in log: {len(lines)}")
# Print the last 10 lines
for idx in range(max(0, len(lines) - 20), len(lines)):
    try:
        data = json.loads(lines[idx])
        print(f"Index {idx+1}: type={data.get('type')}, source={data.get('source')}, status={data.get('status')}")
        # if tool call, print function name
        tcs = data.get("tool_calls", [])
        for tc in tcs:
            print(f"  Tool: {tc.get('name')}")
    except Exception as e:
        pass
