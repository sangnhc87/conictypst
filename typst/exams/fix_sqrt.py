import re

with open('CD-DaySo-ChuyenSau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Fix sqrt{...} to sqrt(...)
text = re.sub(r'sqrt\{([^}]+)\}', r'sqrt(\1)', text)
# Fix u_{n+1} just in case
text = re.sub(r'u_\{([^}]+)\}', r'u_(\1)', text)
text = re.sub(r'v_\{([^}]+)\}', r'v_(\1)', text)
text = re.sub(r'w_\{([^}]+)\}', r'w_(\1)', text)
text = re.sub(r'x_\{([^}]+)\}', r'x_(\1)', text)
text = re.sub(r'y_\{([^}]+)\}', r'y_(\1)', text)
text = re.sub(r'cos\^2x', r'cos^2 x', text)

with open('CD-DaySo-ChuyenSau.typ', 'w', encoding='utf-8') as f:
    f.write(text)
