import json
import re

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

def parse_truncated_chunks(chunks_str):
    parts = chunks_str.split('{"AllowMultiple":')
    chunks = []
    for part in parts[1:]:
        part = '{"AllowMultiple":' + part
        m_end = re.search(r'"EndLine":\s*(\d+)', part)
        m_start = re.search(r'"StartLine":\s*(\d+)', part)
        m_rep = re.search(r'"ReplacementContent":\s*"([^"\\]*(?:\\.[^"\\]*)*)"', part)
        
        if m_end and m_start and m_rep:
            start = int(m_start.group(1))
            end = int(m_end.group(1))
            try:
                rep = json.loads(f'"{m_rep.group(1)}"')
                chunks.append({
                    "StartLine": start,
                    "EndLine": end,
                    "ReplacementContent": rep,
                    "TargetContent": None # Ignore
                })
            except Exception as e:
                print(f"Error decoding: {e}")
        else:
            print(f"Failed. StartLine={bool(m_start)}, EndLine={bool(m_end)}, RepContent={bool(m_rep)}")
    return chunks

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if line_num in [4633, 5053]:
            print(f"\n=== LINE {line_num} ===")
            data = json.loads(line, strict=False)
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                args = tc.get("args", {})
                chunks_str = args.get("ReplacementChunks", "")
                chunks = parse_truncated_chunks(chunks_str)
                print(f"Parsed {len(chunks)} chunks.")
                for idx, c in enumerate(chunks):
                    print(f"  Chunk {idx}: StartLine={c['StartLine']}, EndLine={c['EndLine']}")
                    print(f"    Replacement (len {len(c['ReplacementContent'])}): {c['ReplacementContent'][:150]}...")
