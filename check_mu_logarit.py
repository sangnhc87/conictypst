import os, glob, re

target_dir = "typst/sach/mu-logarit/"
files = glob.glob(target_dir + "*.typ")

for file in files:
    with open(file, "r") as f:
        content = f.read()
    
    double_star = len(re.findall(r'\*\*.*?\*\*', content))
    missing_space_slash = len(re.findall(r'[^\s]\s*\\\n', content))
    loigiai_blocks = len(re.findall(r'loigiai:\s*\[', content))
    step_blocks = len(re.findall(r'#step', content))
    
    if double_star > 0 or missing_space_slash > 0 or (loigiai_blocks > 0 and step_blocks == 0):
        print(f"File: {os.path.basename(file)}")
        print(f"  Double stars (**): {double_star}")
        print(f"  Missing space before slash: {missing_space_slash}")
        print(f"  Loigiai blocks: {loigiai_blocks}, Step blocks: {step_blocks}")
        
print("Health check done.")
