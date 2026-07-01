import subprocess
import glob

failed = []
with open("errors5.log", "w") as out:
    for f in glob.glob("typst/giao-an/**/*.typ", recursive=True):
        if "modules" in f: continue
        res = subprocess.run(["typst", "compile", "--root", ".", f], capture_output=True, text=True)
        if res.returncode != 0:
            failed.append(f)
            out.write(f"--- {f} ---\n")
            out.write(res.stderr + "\n")
            
print(f"Failed {len(failed)} files")
