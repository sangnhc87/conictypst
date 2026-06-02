with open("scratch/generate_deep_2_circles_3D.py", "r", encoding="utf-8") as f:
    content = f.read()

content = content.replace("\\\\Rightarrow", "=>")
content = content.replace("\\Rightarrow", "=>")

with open("scratch/generate_deep_2_circles_3D.py", "w", encoding="utf-8") as f:
    f.write(content)

print("All arrows fixed!")
