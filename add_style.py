from docx import Document
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.shared import Pt

doc = Document("typst-conic-hub/public/runtime/template.docx")
styles = doc.styles

try:
    if 'CenteredImage' in styles:
        style = styles['CenteredImage']
    else:
        from docx.enum.style import WD_STYLE_TYPE
        style = styles.add_style('CenteredImage', WD_STYLE_TYPE.PARAGRAPH)
    
    style.base_style = styles['Normal']
    style.paragraph_format.alignment = WD_ALIGN_PARAGRAPH.CENTER
    doc.save("typst-conic-hub/public/runtime/template.docx")
    print("Added CenteredImage style")
except Exception as e:
    print("Error:", e)

