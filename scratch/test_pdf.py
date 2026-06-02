import sys

libs = ['pypdf', 'pdfplumber', 'fitz', 'pypdf2', 'pdfminer']
for lib in libs:
    try:
        __import__(lib)
        print(f"Success: {lib} is installed!")
    except ImportError:
        print(f"Fail: {lib} is NOT installed.")
