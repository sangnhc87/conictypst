import re
import math

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

# Fix generate_mod4_1 (line 983)
mod4_1_old = """    d_MJ2 = math.sqrt(43 - 24 * math.sqrt(2))
    N_x = 3 - 3 * (3 - M_x) / d_MJ2
    N_y = 4 - 3 * (4 - M_y) / d_MJ2
    N_z = 5"""
mod4_1_new = """    d_M_prime_J2 = math.sqrt((M_x - 3)**2 + (M_y - 4)**2)
    N_x = 3 + 3 * (M_x - 3) / d_M_prime_J2
    N_y = 4 + 3 * (M_y - 4) / d_M_prime_J2
    N_z = 5"""
code = code.replace(mod4_1_old, mod4_1_new)

# Fix generate_mod4_2
mod4_2_old = "fig = draw_2_circles_cetz((0,0,0), 5, (0,0,1,0), (0,4,4), 2, (0,1,-1,0), (0,5,0), (0,4, 4-2), scale=0.33)"
mod4_2_new = "fig = draw_2_circles_cetz((0,0,0), 5, (0,0,1,0), (0,4,4), 2, (0,1,-1,0), (0,5,0), (0, 4 - math.sqrt(2), 4 - math.sqrt(2)), scale=0.33)"
code = code.replace(mod4_2_old, mod4_2_new)

# Fix generate_mod4_3
mod4_3_old = "fig = draw_2_circles_cetz((0,0,0), 6, (0,0,1,0), (0, 3*math.sqrt(3), 3), 2, (0, 1, -math.sqrt(3), 0), (0,6,0), (0, 3*math.sqrt(3), 3-2), scale=0.33)"
mod4_3_new = "fig = draw_2_circles_cetz((0,0,0), 6, (0,0,1,0), (0, 3*math.sqrt(3), 3), 2, (0, 1, -math.sqrt(3), 0), (0,6,0), (0, 2*math.sqrt(3), 2), scale=0.33)"
code = code.replace(mod4_3_old, mod4_3_new)

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
