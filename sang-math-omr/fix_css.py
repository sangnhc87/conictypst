with open("premium_styles.css", "r") as f:
    lines = f.readlines()

new_lines = []
skip = False
for line in lines:
    if line.startswith(".ai-remark {") and "0.08" in line:
        skip = True
    
    if skip:
        if line.startswith("}"):
            skip = False
            continue
        continue
    
    if line.startswith(".ai-remark-title {") and "margin-bottom: 0.5rem;" in line:
        skip = True
    if line.startswith(".ai-remark-text {") and "margin: 0;" in line:
        skip = True

with open("premium_styles.css", "w") as f:
    f.writelines(new_lines)
