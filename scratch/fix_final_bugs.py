with open("scratch/generate_deep_2_circles_3D.py", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Fix double asterisks to single asterisks in the theory section
content = content.replace("**Tính đối xứng:**", "*Tính đối xứng:*")
content = content.replace("**Tiêu chí lựa chọn hướng chiếu tối ưu (để tính toán đơn giản nhất):**", "*Tiêu chí lựa chọn hướng chiếu tối ưu (để tính toán đơn giản nhất):*")

# 2. Fix LaTeX-style vec with native Typst arrow
content = content.replace("\\\\vec{n}_1", "arrow(n)_1")
content = content.replace("\\\\vec{n}_2", "arrow(n)_2")
content = content.replace("\\vec{n}_1", "arrow(n)_1")
content = content.replace("\\vec{n}_2", "arrow(n)_2")

with open("scratch/generate_deep_2_circles_3D.py", "w", encoding="utf-8") as f:
    f.write(content)

print("Final bugs fixed!")
