import json

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if line_num == 4061:
            data = json.loads(line)
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                args = tc.get("args", {})
                chunks = args.get("ReplacementChunks", "")
                print(f"Chunks type: {type(chunks)}")
                if isinstance(chunks, str):
                    print(f"Chunks len: {len(chunks)}")
                    # print first 1000 chars
                    print(chunks[:1000])
                    # Parse as json
                    try:
                        parsed = json.loads(chunks)
                        print(f"Parsed chunks count: {len(parsed)}")
                        for idx, p in enumerate(parsed):
                            print(f"Chunk {idx}: StartLine={p.get('StartLine')}, EndLine={p.get('EndLine')}, Target={p.get('TargetContent')[:40]}..., Replacement={p.get('ReplacementContent')[:40]}...")
                    except Exception as e:
                        print(f"Error parsing: {e}")
            break
