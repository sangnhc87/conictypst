import re
import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")

for path in files:
    with open(path, "r") as f:
        content = f.read()

    # LaTeX to Typst math
    content = content.replace(r"\times", "times")
    content = content.replace(r"\pi", "pi")
    content = content.replace(r"\Rightarrow", "=>")
    content = content.replace(r"\Leftrightarrow", "<=>")
    content = content.replace(r"\le", "<=")
    content = content.replace(r"\ge", ">=")
    
    # \sqrt[3]{...}
    # It's tricky to do with regex if there are nested braces, but let's try simple regex for the ones I wrote
    content = re.sub(r'\\sqrt\[3\]\{([^}]+)\}', r'root(3, \1)', content)
    
    # \sqrt{...}
    content = re.sub(r'\\sqrt\{([^}]+)\}', r'sqrt(\1)', content)

    # \frac{A}{B}
    content = re.sub(r'\\frac\{([^}]+)\}\{([^}]+)\}', r'(\1)/(\2)', content)

    # fix "=>" in text being parsed as string? No, they are inside $ $
    
    # Save
    with open(path, "w") as fw:
        fw.write(content)

