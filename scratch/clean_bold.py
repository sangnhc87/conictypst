import os

directory = "/Users/admin/conictypst/typst/sach/hinh-hoc-phang-chuong5"

for root, dirs, files in os.walk(directory):
    for file in files:
        if file.endswith(".typ"):
            filepath = os.path.join(root, file)
            with open(filepath, "r", encoding="utf-8") as f:
                content = f.read()
            if "**" in content:
                print(f"Cleaning {filepath}...")
                new_content = content.replace("**", "*")
                with open(filepath, "w", encoding="utf-8") as f:
                    f.write(new_content)

print("Replacement complete!")
