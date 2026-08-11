from docx import Document
from docx.shared import Pt

doc = Document("typst-conic-hub/public/runtime/template.docx")
styles = doc.styles

for style_name in ['Heading 1', 'Heading 2', 'Heading 3', 'Heading 4']:
    if style_name in styles:
        style = styles[style_name]
        font = style.font
        font.size = Pt(12)
        font.name = "Times New Roman"

doc.save("typst-conic-hub/public/runtime/template.docx")
print("Updated heading styles to 12pt")
