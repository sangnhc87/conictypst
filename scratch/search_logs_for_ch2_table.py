import json

log_path = "/Users/admin/.gemini/antigravity/brain/5471d837-a644-42ab-9263-2b18668e714e/.system_generated/logs/transcript.jsonl"

found = []
with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            content = data.get("content", "")
            if "2.2 — Ví dụ" in content or "Bù trừ trên Cặp kề trùng" in content or "hệ số chọn" in content:
                found.append((i, data.get("type"), content))
        except Exception as e:
            pass

print(f"Found {len(found)} steps matching.")
for idx, step_type, content in found:
    print(f"Step {idx} ({step_type}) matches. Length: {len(content)}")
    # Look for table inside content
    if "table(" in content:
        print("Found table( in content of Step", idx)
        # Find where table( starts
        pos = content.find("table(")
        print(content[pos:pos+1500])
        print("="*50)
