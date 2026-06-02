import json

log_path = "/Users/admin/.gemini/antigravity/brain/e11ca529-f9f3-4f16-b3ca-9d8a585a0de3/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/full_pie_table_restored.txt"

found_blocks = []

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            content = data.get("content", "")
            if "Bảng tính toán đóng góp chi tiết" in content:
                # Find all table content in this step
                pos = content.find("Bảng tính toán đóng góp chi tiết")
                snippet = content[pos:pos+5000] # get 5000 characters to make sure we capture the whole table
                found_blocks.append((i, snippet))
        except Exception as e:
            pass

print(f"Found {len(found_blocks)} occurrences.")
with open(out_path, "w", encoding="utf-8") as out:
    for idx, snippet in found_blocks:
        out.write(f"=== OCCURRENCE AT LOG STEP {idx} ===\n")
        out.write(snippet.replace("\\n", "\n").replace('\\"', '"').replace("\\\\", "\\") + "\n\n")

print("Saved to", out_path)
