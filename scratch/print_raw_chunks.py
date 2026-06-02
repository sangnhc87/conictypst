import json

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if line_num in [4633, 5053]:
            print(f"=== LINE {line_num} ===")
            data = json.loads(line, strict=False)
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                args = tc.get("args", {})
                chunks = args.get("ReplacementChunks", "")
                print(f"Type: {type(chunks)}, length: {len(chunks)}")
                # Print the raw string
                print(chunks)
