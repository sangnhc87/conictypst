import json

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

for idx in range(len(lines) - 15, len(lines)):
    print(f"\n--- STEP {idx+1} ---")
    try:
        data = json.loads(lines[idx])
        print(f"type: {data.get('type')}, source: {data.get('source')}, status: {data.get('status')}")
        
        # If tool call
        tcs = data.get("tool_calls", [])
        for tc in tcs:
            print(f"  Tool: {tc.get('name')}")
            args = tc.get("args", {})
            # Print non-huge args, truncate strings
            for k, v in args.items():
                if isinstance(v, str):
                    if len(v) > 200:
                        v = v[:200] + f"... (len={len(v)})"
                print(f"    {k}: {v}")
                
        # If tool output
        content = data.get("content", "")
        if content:
            if len(content) > 300:
                content = content[:300] + f"... (len={len(content)})"
            print(f"  Content: {content}")
    except Exception as e:
        print(f"  Error: {e}")
