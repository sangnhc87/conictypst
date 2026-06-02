import json

log_path = "/Users/admin/.gemini/antigravity/brain/5471d837-a644-42ab-9263-2b18668e714e/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/line_738_output.txt"

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        if i == 738:
            data = json.loads(line)
            output = data.get("output", "")
            with open(out_path, "w", encoding="utf-8") as out:
                out.write(output)
            print("Successfully wrote Line 738 output to", out_path)
            break
