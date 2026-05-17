import math

def cross_product(u, v):
    return (u[1]*v[2] - u[2]*v[1], u[2]*v[0] - u[0]*v[2], u[0]*v[1] - u[1]*v[0])

def dot_product(u, v):
    return sum(x*y for x, y in zip(u, v))

A = (2, 1, 10)
B = (6, 3, 8)
C = (8, 5, 6)

AB = (B[0]-A[0], B[1]-A[1], B[2]-A[2])
AC = (C[0]-A[0], C[1]-A[1], C[2]-A[2])

normal = cross_product(AB, AC)
common = math.gcd(normal[0], math.gcd(normal[1], normal[2]))
simplified_normal = [x // common for x in normal]

# Plane: 0*x + 1*y + 1*z = 1*1 + 1*10 = 11 => y + z = 11

# Circumcenter H(x, y, z):
# y + z = 11
# (x-2)^2 + (y-1)^2 + (z-10)^2 = (x-6)^2 + (y-3)^2 + (z-8)^2
# (x-2)^2 + (y-1)^2 + (z-10)^2 = (x-8)^2 + (y-5)^2 + (z-6)^2

# Let z = 11 - y.
# Eq 1: (x-2)^2 + (y-1)^2 + (11-y-10)^2 = (x-6)^2 + (y-3)^2 + (11-y-8)^2
# (x-2)^2 + (y-1)^2 + (1-y)^2 = (x-6)^2 + (y-3)^2 + (3-y)^2
# x^2-4x+4 + 2(y^2-2y+1) = x^2-12x+36 + 2(y^2-6y+9)
# -4x+4 + 2y^2-4y+2 = -12x+36 + 2y^2-12y+18
# 8x + 8y = 48 => x + y = 6 => x = 6 - y

# Eq 2: (x-2)^2 + (y-1)^2 + (1-y)^2 = (x-8)^2 + (y-5)^2 + (5-y)^2
# Substitute x = 6 - y:
# (4-y)^2 + 2(y-1)^2 = (y-2)^2 + 2(y-5)^2
# 16-8y+y^2 + 2(y^2-2y+1) = y^2-4y+4 + 2(y^2-10y+25)
# 3y^2 - 12y + 18 = 3y^2 - 24y + 54
# 12y = 36 => y = 3
# x = 6 - 3 = 3
# z = 11 - 3 = 8
# H = (3, 3, 8)

H = (3, 3, 8)
r2 = (H[0]-A[0])**2 + (H[1]-A[1])**2 + (H[2]-A[2])**2
r = math.sqrt(r2)

# Normal vector of circle plane is (0, 1, 1). Unit normal is (0, 1/sqrt(2), 1/sqrt(2)).
# Points on circle: M = H + r*cos(t)*u + r*sin(t)*v
# where u, v are orthonormal in the plane y+z=11.
# Let u = (1, 0, 0).
# Let v = n_unit x u = (0, 1/sqrt(2), 1/sqrt(2)) x (1, 0, 0) = (0, 1/sqrt(2), -1/sqrt(2)).
# M_z = H_z + r*cos(t)*u_z + r*sin(t)*v_z
# M_z = 8 + r*cos(t)*0 + r*sin(t)*(-1/sqrt(2))
# M_z = 8 - (r/sqrt(2)) * sin(t)
# Min M_z = 8 - r/sqrt(2)
# r^2 = (3-2)^2 + (3-1)^2 + (8-10)^2 = 1 + 4 + 4 = 9.
# r = 3.
# Min M_z = 8 - 3/sqrt(2).
# Distance to z = -12 is M_z - (-12) = M_z + 12.
# Min distance = 8 - 3/sqrt(2) + 12 = 20 - 3/sqrt(2).

min_z = 8 - 3/math.sqrt(2)
min_dist = min_z + 12
print(f"H: {H}")
print(f"r: {r}")
print(f"Min z: {min_z}")
print(f"Min distance: {min_dist}")
print(f"Result: {round(min_dist, 2)}")
