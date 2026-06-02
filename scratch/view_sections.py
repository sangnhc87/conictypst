with open("/Users/admin/conictypst/scratch/extracted_pdf_text.txt", "r", encoding="utf-8") as f:
    text = f.read()

# Pages are separated by form feed \f or we can split by "Trang X"
pages = text.split("\f")
print(f"Total pages in text: {len(pages)}")

# Print first 200 chars of each page to see headers/footers and content
for i, page in enumerate(pages, 1):
    lines = [l.strip() for l in page.split("\n") if l.strip()]
    header = ""
    for l in lines[:5]:
        if "Chuyên Đề" in l or "Nguyễn Văn Sang" in l or "Trang" in l or "TÀI LIỆU" in l:
            continue
        header = l
        break
    print(f"Page {i}: lines={len(lines)}, header={repr(header)}")
