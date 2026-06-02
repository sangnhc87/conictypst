import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

target_lines = [4061, 4633, 5053]

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if line_num in target_lines:
            print(f"=== LINE {line_num} ===")
            try:
                data = json.loads(line)
                tcs = data.get("tool_calls", [])
                for tc in tcs:
                    print(f"Tool: {tc.get('name')}")
                    args = tc.get("args", {})
                    print(f"Args keys: {list(args.keys())}")
                    if "ReplacementChunks" in args:
                        chunks = args["ReplacementChunks"]
                        print(f"Chunks type: {type(chunks)}, count={len(chunks) if isinstance(chunks, list) else 'not a list'}")
                        # print the first chunk
                        if isinstance(chunks, list) and len(chunks) > 0:
                            print("First chunk:")
                            print(json.dumps(chunks[0], indent=2))
                            print("Last chunk:")
                            print(json.dumps(chunks[-1], indent=2))
            except Exception as e:
                print(f"Error parsing line {line_num}: {e}")
