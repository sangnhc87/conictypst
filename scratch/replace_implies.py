filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# We need to replace any occurrence of the escaped backslash-implies
# In the Typst file, it might be written as '\implies' or contain control characters because of the Python escape.
# Let's inspect what's actually there.

print("Before replacement:")
print("Occurrences of 'mplies':", content.count("mplies"))

# Let's replace any '\implies' or backslash + control character + 'mplies' with 'arrow.r.double'
content = re_replace = content.replace("\\implies", " arrow.r.double ")

# Let's also handle the case where it was compiled as control character + mplies due to python string parsing:
# \i is not a valid python escape sequence, but in some versions/cases it might be interpreted.
# Let's find any sequence like \x0b or other escapes before 'mplies'.
import re
content = re.sub(r'\\[a-zA-Z]*mplies', ' arrow.r.double ', content)
content = re.sub(r'[\x00-\x1f]?mplies', ' arrow.r.double ', content)

print("After replacement:")
print("Occurrences of 'mplies':", content.count("mplies"))

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)
print("Done!")
