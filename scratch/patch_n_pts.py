import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

# Fix generate_mod4_1
mod4_1_old = """    N_x = 3 - 3 * (3 - M_x) / d_MJ2
    N_y = 4 - 3 * (4 - M_y) / d_MJ2
    N_z = 5"""
mod4_1_new = """    d_M_prime_J2 = math.sqrt((M_x - 3)**2 + (M_y - 4)**2)
    N_x = 3 + 3 * (M_x - 3) / d_M_prime_J2
    N_y = 4 + 3 * (M_y - 4) / d_M_prime_J2
    N_z = 5"""
code = code.replace(mod4_1_old, mod4_1_new)

# Fix generate_mod4_2
mod4_2_old = """    M_pt = (x_i, y_i, 0)
    N_pt = (x_i, y_i, 4)
    fig = draw_2_circles_cetz((0,0,0), 5, (0,0,1,0), (3,0,4), 3, (0,0,1,-4), M_pt, N_pt, scale=0.33, project_c2=True)"""
# Wait, this was generate_mod4_1 or something?
# Let's use regex to replace N_pt in generate_mod4_2
pass
