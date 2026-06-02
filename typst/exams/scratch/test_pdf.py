import os
import sys

pdf_path = "/Users/admin/conictypst/typst/exams/scratch/test.pdf"

try:
    import pypdf
    reader = pypdf.PdfReader(pdf_path)
    print("PDF Pages:", len(reader.pages))
    
    # Try to print outline/bookmarks
    outline = reader.outline
    print("Outline / Bookmarks:")
    def print_outline(outline_list, indent=""):
        for item in outline_list:
            if isinstance(item, list):
                print_outline(item, indent + "  ")
            else:
                print(f"{indent}- {item.title}")
    
    if outline:
        print_outline(outline)
    else:
        print("No outline found in PDF.")
        
    # Extract text from page 1 to see if Table of Contents text is there
    print("\nPage 1 text:")
    text = reader.pages[0].extract_text()
    print(text)
    
except Exception as e:
    print("Error:", e)
