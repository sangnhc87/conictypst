import re

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

# We need to remove `#pause` inside `#lt-solution[...]`
# It's easier to just find them manually or use a simple string replace for the specific lines.
content = content.replace("Cho $f'(x) = 0 <=> x = 0$ hoặc $x = 2$.\n    #pause", "Cho $f'(x) = 0 <=> x = 0$ hoặc $x = 2$.")
content = content.replace("    #align(center)[\n      #bbbt(", "    *Bảng biến thiên:*\n    #align(center)[\n      #bbbt(")
content = content.replace("    ]\n    #pause\n    *Kết luận:* ", "    ]\n    *Kết luận:* ")

content = content.replace(" < 0 quad forall x != 1$.\n    #pause", " < 0 quad forall x != 1$.")
content = content.replace("v-vals: ($2$, $||$, $2$),\n      )\n    ]\n    #pause\n    *Kết luận:*", "v-vals: ($2$, $||$, $2$),\n      )\n    ]\n    *Kết luận:*")

content = content.replace("hoặc $x = 2$.\n    #pause\n    #align(center)[", "hoặc $x = 2$.\n    #align(center)[")
content = content.replace("    ]\n    #pause\n    - $x = -1$:", "    ]\n    - $x = -1$:")

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
    f.write(content)

