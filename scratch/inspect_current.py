filepath = "CD-min-2-DuongTron-ChuyenSau.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

idx = content.find('Ý tưởng hình học của Công thức vạn năng:')
if idx != -1:
    print("Found title at index:", idx)
    # Print 500 characters before and 1500 characters after
    print("--- BEFORE ---")
    print(content[max(0, idx-200):idx])
    print("--- AFTER ---")
    print(content[idx:idx+1500])
else:
    print("Title not found!")
