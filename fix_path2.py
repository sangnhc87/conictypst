with open("unfold-package/unfold.typ", "r") as f:
    content = f.read()

content = content.replace("path_style: path_style, path_style: path_style", "path_style: path_style")

with open("unfold-package/unfold.typ", "w") as f:
    f.write(content)
