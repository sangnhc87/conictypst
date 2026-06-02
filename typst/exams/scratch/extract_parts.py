import os

def extract_part1():
    src_path = "/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ"
    dest_path = "/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction-content.typ"
    
    with open(src_path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    
    # Lines are 1-indexed: 
    # 1 to 171 is header/styling
    # 254 to end is content
    header_content = "".join(lines[0:171])
    body_content = "".join(lines[253:])
    
    with open(dest_path, "w", encoding="utf-8") as f:
        f.write(header_content)
        f.write("\n")
        f.write(body_content)
    print(f"Extracted Part 1 to {dest_path}")

def extract_part2():
    src_path = "/Users/admin/conictypst/typst/exams/CD-HamSinh-LoiBai-NangCao.typ"
    dest_path = "/Users/admin/conictypst/typst/exams/CD-HamSinh-LoiBai-NangCao-content.typ"
    
    with open(src_path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    
    # Lines are 1-indexed:
    # 1 to 137 is header/styling
    # 283 to end is content (retaining the Part 2 banner starting at line 284)
    header_content = "".join(lines[0:137])
    body_content = "".join(lines[282:])
    
    with open(dest_path, "w", encoding="utf-8") as f:
        f.write(header_content)
        f.write("\n")
        f.write(body_content)
    print(f"Extracted Part 2 to {dest_path}")

if __name__ == "__main__":
    extract_part1()
    extract_part2()
