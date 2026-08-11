from docx import Document
from docx.shared import Pt

# Load the template
doc = Document("typst-conic-hub/public/runtime/template.docx")

# Update Normal style to 12pt
styles = doc.styles
if 'Normal' in styles:
    style = styles['Normal']
    font = style.font
    font.size = Pt(12)
    font.name = "Times New Roman"

# Try updating the default font just in case
try:
    doc.styles.element.xpath('w:docDefaults/w:rPrDefault/w:rPr/w:sz')[0].set('{http://schemas.openxmlformats.org/wordprocessingml/2006/main}val', '24')
    doc.styles.element.xpath('w:docDefaults/w:rPrDefault/w:rPr/w:szCs')[0].set('{http://schemas.openxmlformats.org/wordprocessingml/2006/main}val', '24')
except Exception as e:
    pass

doc.save("typst-conic-hub/public/runtime/template.docx")
print("Updated template.docx font size to 12pt")
