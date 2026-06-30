import fitz
import os
import sys

pdf_path = "./typst/sach/ly-thuyet-va-phan-dang-bai-tap-toan-11-hoc-ki-1-ngo-duc-tai.pdf"
out_dir = "./pdf_images"

if not os.path.exists(out_dir):
    os.makedirs(out_dir)

doc = fitz.open(pdf_path)
for i in range(len(doc)):
    page = doc.load_page(i)
    pix = page.get_pixmap(dpi=150)
    out_file = os.path.join(out_dir, f"page_{i:03d}.png")
    pix.save(out_file)
    print(f"Saved {out_file}")

print(f"Total pages: {len(doc)}")
