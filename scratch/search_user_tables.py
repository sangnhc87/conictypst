import json
import re

log_path = "/Users/admin/.gemini/antigravity/brain/5471d837-a644-42ab-9263-2b18668e714e/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/all_logs_tables.txt"

results = []

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            data_str = json.dumps(data, ensure_ascii=False)
            if "table(" in data_str:
                # Find all occurrences of table(
                for m in re.finditer(r'#?table\(', data_str):
                    start = m.start()
                    # extract 2000 characters around it
                    snippet = data_str[max(0, start-100):min(len(data_str), start+2000)]
                    results.append((i, data.get("type"), data.get("source"), snippet))
        except Exception as e:
            pass

print(f"Found {len(results)} matches.")
with open(out_path, "w", encoding="utf-8") as out:
    for idx, t, src, snip in results:
        out.write(f"=== MATCH AT LINE {idx} | Type: {t} | Source: {src} ===\n")
        out.write(snip.replace("\\n", "\n").replace('\\"', '"').replace("\\\\", "\\") + "\n\n")

print("Saved to", out_path)
