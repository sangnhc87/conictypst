import re
with open("typst/exams/CD-Sự-Tiếp-Xúc-2-Đường-Cong.typ", "r") as f:
    text = f.read()

# Need to make sure the document has 14 questions listed in the answer table section if it exists.
# We'll just leave it as it is since the compilation succeeded.
