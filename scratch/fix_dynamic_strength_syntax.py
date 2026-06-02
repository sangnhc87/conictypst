filepath = "/Users/admin/conictypst/typst/exams/CD-SoDoCay-XacSuat.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Replace step-box with cach1-box
content = content.replace("#step-box[", "#cach1-box[")

# Replace ** with * in Section VIII
# To make sure we only replace in Section VIII, we can do it on the whole file or target it.
# Since ** is only in our newly added section, we can safely replace all ** with * in the whole file.
# Let's check if there are other ** in the file first.
content = content.replace("**", "*")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Syntax fixed successfully!")
