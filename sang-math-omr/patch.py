import re

with open("omr_sheet.typ", "r") as f:
    text = f.read()

# Remove height: 100% from info-phan1-box and its inner blocks
text = text.replace("  height: 100%,", "")

with open("omr_sheet.typ", "w") as f:
    f.write(text)
