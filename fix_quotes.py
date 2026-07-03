with open('typst/hdsd-exam.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Fix common default strings
text = text.replace('default: ""right""', 'default: "\\"right\\""')
text = text.replace('default: ""left""', 'default: "\\"left\\""')
text = text.replace('default: ""center""', 'default: "\\"center\\""')
text = text.replace('default: """"', 'default: "\\"\\""')
text = text.replace('default: "rgb("#0f172a")"', 'default: "rgb(\\"#0f172a\\")"')
text = text.replace('default: "rgb("#f59e0b")"', 'default: "rgb(\\"#f59e0b\\")"')
text = text.replace('default: "rgb("#ffffff")"', 'default: "rgb(\\"#ffffff\\")"')
text = text.replace('default: "rgb("#e2e8f0")"', 'default: "rgb(\\"#e2e8f0\\")"')
text = text.replace('default: ""dethi""', 'default: "\\"dethi\\""')
text = text.replace('default: ""solcolor""', 'default: "\\"solcolor\\""')
text = text.replace('default: ""loigiai""', 'default: "\\"loigiai\\""')
text = text.replace('default: ""auto""', 'default: "\\"auto\\""')

# Also fix the $40 " cm"$ that caused the problem in the first place!
# Wait, it was already replaced to " by sed. So it is $40 " cm"$. That's what we want!

with open('typst/hdsd-exam.typ', 'w', encoding='utf-8') as f:
    f.write(text)

