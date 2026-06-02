import subprocess
import re

# Get git diff of the file
res = subprocess.run(["git", "diff", "typst/exams/CD-XepGhe-KhongKe.typ"], capture_output=True, text=True)
diff = res.stdout

print("Diff length:", len(diff))

# Search for deleted lines containing table, grid, columns, or bảng
deleted_lines = []
for line in diff.splitlines():
    if line.startswith("-") and not line.startswith("---"):
        if any(w in line.lower() for w in ["table", "grid", "columns", "bảng", "hộp", "col-"]):
            deleted_lines.append(line)

print(f"Found {len(deleted_lines)} deleted lines matching keywords:")
for l in deleted_lines[:50]:
    print(l)
