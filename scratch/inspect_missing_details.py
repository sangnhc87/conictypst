import json

with open("/Users/admin/conictypst/scratch/extracted_questions_solutions_v5.json", "r", encoding="utf-8") as f:
    data = json.load(f)

for f in ["CD-HamSinh-GeneratingFunction-content.typ", "CD-HamSinh-LoiBai-NangCao-content.typ"]:
    print(f"--- {f} ---")
    probs = data.get(f, [])
    print(f"Number of problems: {len(probs)}")
    for i, p in enumerate(probs):
        print(f"Problem {i+1}:")
        print("  Q snippet:", p["q"][:200].replace("\n", " "))
        print("  Ans:", p.get("ans"))
        print("  Solutions:", [s["raw_text"][:200].replace("\n", " ") for s in p.get("solutions", [])])
