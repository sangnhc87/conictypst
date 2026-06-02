with open("typst/exams/CD-Sự-Tiếp-Xúc-2-Đường-Cong.typ", "r") as f:
    t = f.read()

# in typst rgb("hex", opacity) -> rgb("hex").lighten(opacity) maybe, or rgb(r,g,b,opacity)
# Let's just fix `rgb("3498db", 60)` to `rgb("3498db", 60%)` or `rgb("3498db80")`
t = t.replace('rgb("3498db", 60)', 'rgb(52, 152, 219, 60)')
t = t.replace('rgb("bdc3c7", 100)', 'rgb(189, 195, 199, 100)')
t = t.replace('rgb("f1c40f", 50)', 'rgb(241, 196, 15, 50)')

with open("typst/exams/CD-Sự-Tiếp-Xúc-2-Đường-Cong.typ", "w") as f:
    f.write(t)
