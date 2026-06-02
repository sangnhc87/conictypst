import numpy as np

# Projection parameters
alpha = -30 * np.pi / 180
beta = 20 * np.pi / 180

def prj(x, y, z):
    # Orthographic projection
    xp = x * np.cos(alpha) - y * np.sin(alpha)
    yp = x * np.sin(alpha) + y * np.cos(alpha)
    ypp = yp * np.sin(beta) + z * np.cos(beta)
    zp = - (x * np.sin(alpha) + y * np.cos(alpha)) * np.cos(beta) + z * np.sin(beta) # View direction coordinate (depth)
    return xp, ypp, zp

# Let's find the depth of a point on the equator x^2 + y^2 = R^2, z = 0
# x = R * cos(theta)
# y = R * sin(theta)
# z = 0
# zp = -R * sin(theta + alpha) * cos(beta)
# A point is in the front (visible) if zp > 0 (or zp < 0, depending on the convention of view direction)
# Let's check:
# If we look from positive y or some direction:
# Let's compute the view vector.
# In our projection:
# xp = x * cos(alpha) - y * sin(alpha)
# ypp = (x * sin(alpha) + y * cos(alpha)) * sin(beta) + z * cos(beta)
# This is a standard transformation:
# Let's find the coordinate that is perpendicular to the screen.
# The screen coordinates are (xp, ypp).
# The third coordinate in the right-handed system (depth zp) is indeed:
# zp = - (x * sin(alpha) + y * cos(alpha)) * cos(beta) + z * np.sin(beta)
# For z = 0, zp = - R * sin(theta + alpha) * cos(beta)
# The boundary of visibility (silhouette) is when zp = 0.
# Since R > 0 and cos(beta) > 0 (as beta = 20 degrees):
# zp = 0 <=> sin(theta + alpha) = 0 <=> theta + alpha = 0 or np.pi
# So theta = -alpha or theta = np.pi - alpha
# Since alpha = -30 degrees, we have:
# theta = 30 degrees (i.e. theta = 30 deg)
# theta = 210 degrees (i.e. theta = 210 deg)
# Let's check the projection at theta = 30 deg and theta = 210 deg:
# For theta = 30 deg (0.5236 rad):
# x = R * cos(30 deg), y = R * sin(30 deg)
# xp = R * (cos(30) * cos(-30) - sin(30) * sin(-30)) = R * cos(0) = R
# ypp = R * sin(0) * sin(20) = 0
# Indeed! At theta = 30 deg, the projected point is (R, 0).
# For theta = 210 deg:
# x = R * cos(210 deg), y = R * sin(210 deg)
# xp = R * cos(180 deg) = -R
# ypp = R * sin(180 deg) * sin(20) = 0
# Indeed! At theta = 210 deg, the projected point is (-R, 0).
# And since these points are (R, 0) and (-R, 0), they lie exactly on the circle of radius R centered at (0,0)!
# That is beautiful!
# So the tangent points (silhouette intersection points) are EXACTLY theta = 30 degrees and theta = 210 degrees!
# And the visible (front) half of the equator corresponds to zp > 0 (or < 0).
# Let's check:
# For theta = 120 degrees (which is in the "back" of the sphere if looking from the front? Let's check):
# If theta = 120, theta + alpha = 90 degrees.
# zp = -R * sin(90 deg) * cos(20 deg) = -R * cos(20 deg) < 0.
# If this is negative, it's behind (hidden).
# For theta = -60 degrees (or 300 degrees), theta + alpha = 270 degrees.
# zp = -R * sin(270 deg) * cos(20 deg) = R * cos(20 deg) > 0.
# So the front (visible) side of the equator is when zp > 0, which corresponds to sin(theta + alpha) < 0,
# which means theta + alpha is in (180 deg, 360 deg), i.e., theta in (180 - alpha, 360 - alpha) = (210 deg, 390 deg).
# Wait, theta in [210 deg, 390 deg] (which is [-150 deg, 30 deg]) is the visible front part!
# And the hidden back part is theta in [30 deg, 210 deg]!
# This matches the "Front/Back Division Solution" described in the summary:
# "By splitting the equator at theta in [210, 390] (front half, solid line) and theta in [30, 210] (back half, dashed line):
# 1. The meeting points of the solid and dashed lines lie exactly at (R, 0) and (-R, 0) on the sphere's outline, which is visually correct.
# 2. Both paths will span the exact same horizontal range [-R, R], resulting in identical horizontal bounding boxes, which resolves the horizontal shifting bug."

print("Transition angles: 30 degrees and 210 degrees.")
