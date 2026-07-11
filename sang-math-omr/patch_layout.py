import re

with open("omr_sheet.typ", "r") as f:
    content = f.read()

# Change top block grid
old_grid = """  grid(
    columns: (2fr, 1.3fr, 4fr, 2fr),
    block(stroke: (right: 0.8pt), inset: (x: 4pt, y: 4pt), width: 100%, sbd-content),
    block(stroke: (right: 0.8pt), inset: (x: 4pt, y: 4pt), width: 100%, made-content),
    block(stroke: (right: 0.8pt), width: 100%, info-phan1-content),
    block(inset: 0pt, width: 100%, phan2-content)
  )"""

new_grid = """  grid(
    columns: (1.2fr, 0.9fr, 3fr),
    block(stroke: (right: 0.8pt), inset: (x: 4pt, y: 4pt), width: 100%, sbd-content),
    block(stroke: (right: 0.8pt), inset: (x: 4pt, y: 4pt), width: 100%, made-content),
    block(width: 100%, [
      #info-phan1-content
      #line(length: 100%, stroke: 0.8pt)
      #phan2-content
    ])
  )"""

content = content.replace(old_grid, new_grid)

# increase padding in info-phan1-content to stretch it
old_phan1_block = """    block(
      stroke: (right: 0.5pt), inset: 2pt, width: 100%,"""

new_phan1_block = """    block(
      stroke: (right: 0.5pt), inset: (top: 6pt, bottom: 6pt), width: 100%,"""

content = content.replace(old_phan1_block, new_phan1_block)

# change column widths in info-phan1-content to distribute better
# also fix row-gutter in phan1 to distribute height
old_mcq = """grid(columns: 1, row-gutter: 5pt, align: center, ..range(1, 5).map(i => mcq-row(i)))"""
new_mcq = """grid(columns: 1, row-gutter: 8pt, align: center, ..range(1, 5).map(i => mcq-row(i)))"""
content = content.replace(old_mcq, new_mcq)

old_mcq2 = """grid(columns: 1, row-gutter: 5pt, align: center, ..range(5, 9).map(i => mcq-row(i)))"""
new_mcq2 = """grid(columns: 1, row-gutter: 8pt, align: center, ..range(5, 9).map(i => mcq-row(i)))"""
content = content.replace(old_mcq2, new_mcq2)

old_mcq3 = """grid(columns: 1, row-gutter: 5pt, align: center, ..range(9, 13).map(i => mcq-row(i)))"""
new_mcq3 = """grid(columns: 1, row-gutter: 8pt, align: center, ..range(9, 13).map(i => mcq-row(i)))"""
content = content.replace(old_mcq3, new_mcq3)

# make phan2 row-gutter 8pt too
old_phan2_row1 = """#v(4pt)
            // Câu 2"""
new_phan2_row1 = """#v(10pt)
            // Câu 2"""
content = content.replace(old_phan2_row1, new_phan2_row1)

old_phan2_row2 = """#v(4pt)
            // Câu 4"""
new_phan2_row2 = """#v(10pt)
            // Câu 4"""
content = content.replace(old_phan2_row2, new_phan2_row2)

with open("omr_sheet.typ", "w") as f:
    f.write(content)
