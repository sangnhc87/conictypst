import shutil
import subprocess
import os

src = "/Users/admin/conictypst/scratch/reconstructed_virtual.typ"
dest = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ"
backup = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ.bak_temp"

# Safe swap
if os.path.exists(dest):
    shutil.copy(dest, backup)

shutil.copy(src, dest)

try:
    print("Compiling Typst file...")
    res = subprocess.run(
        ["typst", "compile", "typst/exams/CD-DaiSo-ToHop.typ", "--root", "."],
        cwd="/Users/admin/conictypst",
        capture_output=True,
        text=True
    )
    if res.returncode == 0:
        print("Success! Compilation succeeded with zero errors.")
    else:
        print("Compilation failed!")
        print("STDOUT:")
        print(res.stdout)
        print("STDERR:")
        print(res.stderr)
        # Restore backup if failed
        shutil.copy(backup, dest)
except Exception as e:
    print(f"Error during execution: {e}")
    if os.path.exists(backup):
        shutil.copy(backup, dest)
finally:
    if os.path.exists(backup):
        os.remove(backup)
