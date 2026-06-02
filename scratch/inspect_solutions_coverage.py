import json

with open("/Users/admin/conictypst/scratch/extracted_questions_solutions_v5.json", "r", encoding="utf-8") as f:
    data = json.load(f)

print("Total files with questions:", len(data))
empty_solutions = []
has_solutions = []
for filename, probs in data.items():
    if not probs:
        continue
    sols_count = sum(1 for p in probs if p.get("solutions"))
    if sols_count == 0:
        empty_solutions.append(filename)
    else:
        has_solutions.append((filename, len(probs), sols_count))

print("\nFiles with some solutions (filename, total_questions, questions_with_solutions):")
for item in has_solutions[:15]:
    print(f"  {item[0]}: {item[1]} qns, {item[2]} with solutions")

print("\nFiles with NO solutions:")
for f in empty_solutions[:15]:
    print(f"  {f}")
