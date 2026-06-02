import os

dirs_to_search = [
    "/Users/admin/conictypst/scratch",
    "/Users/admin/conictypst/typst/exams/scratch",
    "/Users/admin/conictypst/typst/exams/cleaned"
]

for d in dirs_to_search:
    if os.path.exists(d):
        for f in os.listdir(d):
            if f.endswith(".typ") or f.endswith(".txt"):
                path = os.path.join(d, f)
                try:
                    with open(path, "r", encoding="utf-8", errors="ignore") as file:
                        content = file.read()
                        if "table(" in content:
                            print(f"Found table in {path} (size: {len(content)})")
                            # Search for table blocks
                            for m in os.sys.modules['re'].finditer(r'#?table\(', content):
                                start = m.start()
                                # find matching brace
                                braces = 0
                                end = -1
                                for i in range(start, len(content)):
                                    if content[i] == '(':
                                        braces += 1
                                    elif content[i] == ')':
                                        braces -= 1
                                        if braces == 0:
                                            end = i + 1
                                            break
                                if end != -1:
                                    print("--- TABLE CODE ---")
                                    print(content[start:end][:1000])
                                    print("------------------")
                except Exception as e:
                    pass
