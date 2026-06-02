import math

# We want [x^8 y^5 z^3] of 1 / (1 - (x/(1+x) + y/(1+y) + z/(1+z)))
# Let u = x/(1+x) + y/(1+y) + z/(1+z)
# We want [x^8 y^5 z^3] sum_{n=1}^{16} u^n.
# Let's write a simple polynomial multiplication in Python.

def poly_mul_3d(p1, p2, max_x, max_y, max_z):
    # p is dict of (i, j, k) -> coeff
    res = {}
    for (i1, j1, k1), c1 in p1.items():
        for (i2, j2, k2), c2 in p2.items():
            i, j, k = i1 + i2, j1 + j2, k1 + k2
            if i <= max_x and j <= max_y and k <= max_z:
                res[(i, j, k)] = res.get((i, j, k), 0) + c1 * c2
    return res

def poly_add_3d(p1, p2):
    res = p1.copy()
    for key, val in p2.items():
        res[key] = res.get(key, 0) + val
    return res

# f(x) = x/(1+x) = x - x^2 + x^3 - x^4 + x^5 - x^6 + x^7 - x^8
# We want up to x^8, y^5, z^3.
tx = {}
sign = 1
for i in range(1, 9):
    tx[(i, 0, 0)] = sign
    sign = -sign

ty = {}
sign = 1
for j in range(1, 6):
    ty[(0, j, 0)] = sign
    sign = -sign

tz = {}
sign = 1
for k in range(1, 4):
    tz[(0, 0, k)] = sign
    sign = -sign

# u = tx + ty + tz
u = {}
for k, v in tx.items(): u[k] = u.get(k, 0) + v
for k, v in ty.items(): u[k] = u.get(k, 0) + v
for k, v in tz.items(): u[k] = u.get(k, 0) + v

# We compute sum_{n=0}^{16} u^n
ans_sum = {(0, 0, 0): 1}
curr = {(0, 0, 0): 1}

for n in range(1, 17):
    curr = poly_mul_3d(curr, u, 8, 5, 3)
    ans_sum = poly_add_3d(ans_sum, curr)

W = ans_sum.get((8, 5, 3), 0)
print(f"Number of Smirnov words W = {W}")

# Probability p = W * 8! * 5! * 3! / 16!
num = W * math.factorial(8) * math.factorial(5) * math.factorial(3)
den = math.factorial(16)
p = num / den
print(f"p = {p}")
print(f"num = {num}")
print(f"den = {den}")

# Let's print out scaling values
for exp in [5, 6, 7, 8, 9, 10]:
    val = p * (10**exp)
    print(f"10^{exp} * p = {val}")
    print(f"5 * 10^{exp} * p = {5 * (10**exp) * p}")
