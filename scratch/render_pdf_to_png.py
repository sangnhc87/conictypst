import fitz  # PyMuPDF
import sys

def render_pdf(pdf_path, output_prefix):
    doc = fitz.open(pdf_path)
    for i, page in enumerate(doc):
        pix = page.get_pixmap(dpi=150)
        out_path = f"{output_prefix}-{i+1}.png"
        pix.save(out_path)
        print(f"Saved {out_path}")

if __name__ == "__main__":
    pdf = "out_temp.pdf"
    if len(sys.argv) > 1:
        pdf = sys.argv[1]
    render_pdf(pdf, "deep-2c-page")
