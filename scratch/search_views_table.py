import os

views_dir = "/Users/admin/conictypst/scratch/views"
files = sorted(os.listdir(views_dir))

for f in files:
    if f.endswith(".txt"):
        path = os.path.join(views_dir, f)
        with open(path, "r", encoding="utf-8") as file:
            content = file.read()
            if "table" in content:
                print(f"--- File {f} contains table ---")
                lines = content.splitlines()
                # Print lines containing table and 10 lines around them
                for idx, line in enumerate(lines):
                    if "table" in line or "columns:" in line:
                        print(f"L{idx}: {line}")
                        # print surrounding lines
                        start = max(0, idx-5)
                        end = min(len(lines), idx+15)
                        print("Context:")
                        for j in range(start, end):
                            print(f"  {j}: {lines[j]}")
                        print("-" * 40)
