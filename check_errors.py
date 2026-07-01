import os
import glob
import subprocess

files = glob.glob("typst/giao-an/**/*.typ", recursive=True)
failed_files = []

for f in files:
    if "modules" in f or "test" in f.lower():
        continue
    res = subprocess.run(["typst", "compile", "--root", ".", f], capture_output=True, text=True)
    if res.returncode != 0:
        # Get the first few lines of the error message for context
        err_lines = [line for line in res.stderr.split('\n') if line.strip()]
        error_msg = err_lines[:3]
        failed_files.append((f, error_msg))

print(f"Total files checked: {len(files)}")
print(f"Failed files: {len(failed_files)}")
for f, e in failed_files:
    print(f"FAILED: {f}")
    for line in e:
        print("  " + line)
