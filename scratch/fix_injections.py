import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

# 1. Clean up ALL mistaken injections of the diagrams
code = re.sub(r'\n\s*#align\(center\)\[#?\{draw_method1_cetz\(\)\}\]\n', '', code)
code = re.sub(r'\n\s*#align\(center\)\[#?\{draw_method2_cetz\(\)\}\]\n', '', code)
code = re.sub(r'#\{draw_universal_proof_cetz\(\)\}', '{draw_universal_proof_cetz()}', code)

# 2. Re-inject carefully into get_typst_header only
# For method 1: 
search_m1 = "M N = sqrt(M' N^2 + h^2) $"
replace_m1 = "M N = sqrt(M' N^2 + h^2) $\n     #align(center)[#{draw_method1_cetz()}]\n"
# Since search_m1 might appear multiple times (though I think it's only in theory), let's replace only the first occurrence
code = code.replace(search_m1, replace_m1, 1)

# For method 2:
# The theory block has "$ M N = sqrt(M M_p^2 + M_p N^2) $"
search_m2 = "M N = sqrt(M M_p^2 + M_p N^2) $"
replace_m2 = "M N = sqrt(M M_p^2 + M_p N^2) $\n   #align(center)[#{draw_method2_cetz()}]\n"
code = code.replace(search_m2, replace_m2, 1)

# For the proof diagram:
code = code.replace('{draw_universal_proof_cetz()}', '#{draw_universal_proof_cetz()}')

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
