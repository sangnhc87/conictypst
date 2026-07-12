import math

faces = 3
a = 2.0
h = 4.0
cx, cy = 0, 0
persp = 0.35
r = a / (2 * math.sin(math.radians(180 / faces)))

base_pts = []
for i in range(faces):
    angle = -90 + i * 360 / faces
    x = cx + r * math.cos(math.radians(angle))
    y = cy + r * persp * math.sin(math.radians(angle))
    base_pts.append((x, y))

print("Base points:")
for p in base_pts:
    print(f"  {p[0]:.2f}, {p[1]:.2f}")

