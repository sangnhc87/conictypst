import json

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if line_num == 4972:
            data = json.loads(line, strict=False)
            print(f"type: {data.get('type')}, source: {data.get('source')}, status: {data.get('status')}")
            content = data.get("content", "")
            print(f"Content lines: {len(content.splitlines())}")
            # print all lines
            for idx, l in enumerate(content.splitlines()):
                print(f"  {l[:100]}")
            break
