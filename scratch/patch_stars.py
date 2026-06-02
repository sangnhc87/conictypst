import re
with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

code = code.replace('**SAI LẦM CHẾT NGƯỜI**', '*SAI LẦM CHẾT NGƯỜI*')
code = code.replace('**hoàn toàn sai**', '*hoàn toàn sai*')
code = code.replace('**SAI**', '*SAI*')

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
