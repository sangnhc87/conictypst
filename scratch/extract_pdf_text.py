import fitz # PyMuPDF
import sys

def extract_text(pdf_path, txt_path):
    print(f"Extracting {pdf_path}...")
    try:
        doc = fitz.open(pdf_path)
        text = ""
        for page in doc:
            text += page.get_text()
        with open(txt_path, "w", encoding="utf-8") as f:
            f.write(text)
        print(f"Done! Extracted {len(text)} chars to {txt_path}.")
    except Exception as e:
        print(f"Error: {e}")

extract_text("/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.pdf", "/Users/admin/conictypst/scratch/extracted_pdf_text.txt")
extract_text("/Users/admin/conictypst/out.pdf", "/Users/admin/conictypst/scratch/extracted_out_pdf.txt")
