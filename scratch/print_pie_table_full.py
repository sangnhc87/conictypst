with open("/Users/admin/conictypst/scratch/all_e11c_tables.txt", "r", encoding="utf-8") as f:
    content = f.read()

target = "columns: (1.2fr, 1.2fr, 1.5fr, 1fr, 1.5fr, 1fr, 1.2fr)"

if target in content:
    print("Found target!")
    # Find all occurrences
    idx = 0
    pos = 0
    while True:
        pos = content.find(target, pos)
        if pos == -1:
            break
        print(f"\n=== OCCURRENCE {idx} ===")
        # Print from pos-100 to pos+3000
        print(content[pos-100:pos+3000])
        print("="*50)
        pos += len(target)
        idx += 1
else:
    print("Target columns not found in all_e11c_tables.txt")
