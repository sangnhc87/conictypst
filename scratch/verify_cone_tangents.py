import numpy as np

alpha = -30 * np.pi / 180
beta = 20 * np.pi / 180
R = 6
H = 6

def prj(x, y, z):
    xp = x * np.cos(alpha) - y * np.sin(alpha)
    yp = x * np.sin(alpha) + y * np.cos(alpha)
    ypp = yp * np.sin(beta) + z * np.cos(beta)
    return xp, ypp

# Analytical tangent angles
# sin(theta + alpha) = - (R/H) * tan(beta)
# Since R = H, sin(theta + alpha) = -tan(beta)
val = - np.tan(beta)
print("sin(theta + alpha) =", val)
angle_rad_1 = np.arcsin(val)
angle_deg_1 = angle_rad_1 * 180 / np.pi
print("theta_plus_alpha_1 =", angle_deg_1)
print("theta_plus_alpha_2 =", 180 - angle_deg_1)

theta_1 = angle_deg_1 - (-30)
theta_2 = (180 - angle_deg_1) - (-30)
print(f"theta_1 = {theta_1:.2f} degrees")
print(f"theta_2 = {theta_2:.2f} degrees")

# Let's print the projected coordinates of the tangent points
pt1 = prj(R * np.cos(theta_1 * np.pi/180), R * np.sin(theta_1 * np.pi/180), H)
pt2 = prj(R * np.cos(theta_2 * np.pi/180), R * np.sin(theta_2 * np.pi/180), H)
print("Projected point 1:", pt1)
print("Projected point 2:", pt2)
