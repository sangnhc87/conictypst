from docx import Document

def change_font_to_times_new_roman(doc_path, output_path):
    doc = Document(doc_path)
    
    # Modify default font
    style = doc.styles['Normal']
    font = style.font
    font.name = 'Times New Roman'
    
    # Modify all other styles to inherit or explicitly use Times New Roman
    for s in doc.styles:
        if hasattr(s, 'font') and s.font is not None:
            s.font.name = 'Times New Roman'
            
    doc.save(output_path)
    print(f"Updated fonts in {output_path}")

change_font_to_times_new_roman('reference.docx', 'reference.docx')
