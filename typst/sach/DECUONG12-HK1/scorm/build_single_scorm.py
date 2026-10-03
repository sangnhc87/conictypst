import sys
import os
from pathlib import Path
import json

sys.path.append(os.path.dirname(__file__))
import parse_typ
from build_scorm import make_zip

def build_single(filepath, ten_de):
    filepath = Path(filepath).resolve()
    print(f"Parsing {filepath}...")
    questions = parse_typ.parse_file(str(filepath))
    print(f"Parsed {len(questions)} questions.")
    
    # Generate random chuong, bai, de_so to bypass the make_zip function
    # Wait, make_zip signature: make_zip(chuong, bai, de_so, ten_de, questions)
    # It writes to OUTPUT_DIR / f"scorm-{12}-hk1-c{chuong}-bai{bai}-de{de_so}-scorm.zip"
    
    # We can just run it, then move the zip to the correct location!
    # Or, modify make_zip to accept output_path?
    
    # Actually, we can just run make_zip(10, 2, 2, ten_de, questions)
    # and it will be scorm-12-hk1-c10-bai2-de2-scorm.zip
    # then we rename it!
    out_path = make_zip("10", "2", "2", ten_de, questions)
    target = filepath.parent / f"{filepath.stem}-scorm.zip"
    os.rename(out_path, target)
    print(f"Moved to {target}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 build_single_scorm.py <filepath> <ten_de>")
        sys.exit(1)
    build_single(sys.argv[1], sys.argv[2])
