import math

r1 = 4.5
r2 = 2.25
h = 6
loops = 3
r1_l_ratio = 1/3
L_big = 1.0
L_small = r2 / r1

steps = int(loops * 300) + 100
print(f"steps: {steps}")

offset_angle = math.pi
pts = []
for i in range(steps + 1):
    t = i / steps
    d = (1 - t) * L_big + t * L_small
    theta_unwrapped = t * loops * 360 * r1_l_ratio
    angle = offset_angle + math.radians(theta_unwrapped / r1_l_ratio)
    
    curr_r = r1 * d
    apex_h = h * r1 / (r1 - r2)
    px = curr_r * math.cos(angle)
    py = apex_h * (1 - d) + curr_r * 0.35 * math.sin(angle)
    pts.append((px, py))

# Just check min/max to see if it spirals nicely
for i in range(0, steps+1, steps//6):
    print(f"t={i/steps:.2f}, pt=({pts[i][0]:.2f}, {pts[i][1]:.2f})")

