import json

log_path = "/Users/admin/.gemini/antigravity/brain/e11ca529-f9f3-4f16-b3ca-9d8a585a0de3/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/pie_calculation_table.txt"

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            # Find the step with index 110 or line 110
            # Wait, let's check both
            if i == 110 or data.get("step_index") == 110:
                content = data.get("content", "")
                if "table(" in content or "Bảng tính toán" in content:
                    print(f"Found step at line {i}, step_index {data.get('step_index')}")
                    with open(out_path, "w", encoding="utf-8") as out:
                        out.write(content)
                    print("Wrote to", out_path)
        except Exception as e:
            pass
