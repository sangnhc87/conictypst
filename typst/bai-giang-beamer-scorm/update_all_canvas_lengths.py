import re
import os
import glob

directory = "/Users/admin/conictypst/typst/beamer"
files = glob.glob(os.path.join(directory, "beamer-*.typ"))

for file_path in files:
    with open(file_path, "r", encoding="utf-8") as f:
        text = f.read()

    # Replace canvas(length: <number>cm where number is less than 1 or small
    # Just replacing anything with 0.xxcm to 1cm
    new_text = re.sub(r'canvas\(\s*length\s*:\s*0\.[0-9]+cm', r'canvas(length: 1cm', text)

    if new_text != text:
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(new_text)
        print(f"Updated {file_path}")
    else:
        print(f"No changes for {file_path}")

print("Done updating all beamer files.")
