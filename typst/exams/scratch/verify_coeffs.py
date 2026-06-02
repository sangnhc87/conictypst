# Pure Python implementation to verify coefficients

def poly_mul(p1, p2):
    # p1, p2 are list of coefficients: index is power, value is coeff
    res = [0] * (len(p1) + len(p2) - 1)
    for i, c1 in enumerate(p1):
        for j, c2 in enumerate(p2):
            res[i+j] += c1 * c2
    return res

def poly_pow(p, n):
    res = [1]
    for _ in range(n):
        res = poly_mul(res, p)
    return res

# 1/(1-x) series up to degree N
def geom_series(N):
    return [1] * (N + 1)

# 1/(1-x^2) series up to degree N
def geom_series_x2(N):
    res = [0] * (N + 1)
    for i in range(0, N + 1, 2):
        res[i] = 1
    return res

# 1/(1-x^3) series up to degree N
def geom_series_x3(N):
    res = [0] * (N + 1)
    for i in range(0, N + 1, 3):
        res[i] = 1
    return res

# Bài 17:
# f(x) = (1/(1-x^2)) * (x/(1-x^2)) * (x^3/(1-x)) * (1 + x + x^2 + x^3 + x^4 + x^5)
# = x^4 * (1/(1-x^2)^2) * (1/(1-x)) * (1+x+x^2+x^3+x^4+x^5)
# We want coeff of x^20 in f(x), which is coeff of x^16 in:
# (1/(1-x^2)^2) * (1/(1-x)) * (1+x+x^2+x^3+x^4+x^5)
# Let's compute (1/(1-x^2))^2 series:
s_x2 = geom_series_x2(20)
s_x2_sq = poly_mul(s_x2, s_x2)[:20]
s_x = geom_series(20)
poly_1 = [1, 1, 1, 1, 1, 1]
temp = poly_mul(s_x2_sq, s_x)[:20]
temp2 = poly_mul(temp, poly_1)[:20]
# f(x) has a factor of x^4, so coefficient of x^20 in f(x) is temp2[16]
print(f"Bài 17 coeff of x^20: {temp2[16]}")

# Bài 18:
# EGF: Room 1 (chẵn >= 2): (e^x + e^-x - 2)/2 = x^2/2! + x^4/4! + x^6/6! + x^8/8! + ...
# Room 2 (>= 1): e^x - 1 = x/1! + x^2/2! + x^3/3! + ...
# Room 3 (>= 1): e^x - 1
# Total EGF: f18 = ( (e^x + e^-x - 2)/2 ) * (e^x - 1)^2
# We want 8! * [x^8] of f18.
# Let's represent EGF of each room up to x^8:
import math
r1 = [0]*9
for i in range(2, 9, 2):
    r1[i] = 1.0 / math.factorial(i)

r23 = [0]*9
for i in range(1, 9):
    r23[i] = 1.0 / math.factorial(i)

temp = poly_mul(r1, r23)[:9]
egf = poly_mul(temp, r23)[:9]
coeff_18 = round(egf[8] * math.factorial(8))
print(f"Bài 18 coeff of x^8: {coeff_18}")

# Bài 19:
count_19 = 0
for d1 in [2, 4, 6, 8]:
    for d2 in [0, 2, 4, 6, 8]:
        for d3 in [0, 2, 4, 6, 8]:
            for d4 in [0, 2, 4, 6, 8]:
                for d5 in [0, 2, 4, 6, 8]:
                    for d6 in [0, 2, 4, 6, 8]:
                        s = d1 + d2 + d3 + d4 + d5 + d6
                        if s % 9 == 0:
                            count_19 += 1
print(f"Bài 19 count: {count_19}")

# Bài 24:
# Box 1: x1 >= 1 and x1 is odd. OGF: x/(1-x^2)
# Box 2: x2 <= 4. OGF: 1 + x + x^2 + x^3 + x^4
# Box 3: x3 is multiple of 3. OGF: 1/(1-x^3)
# Box 4: x4 >= 2. OGF: x^2/(1-x)
# f24 = x^3 * (1/(1-x^2)) * (1+x+x^2+x^3+x^4) * (1/(1-x^3)) * (1/(1-x))
# We want coeff of x^15, which is coeff of x^12 in:
# (1/(1-x^2)) * (1+x+x^2+x^3+x^4) * (1/(1-x^3)) * (1/(1-x))
s1 = geom_series_x2(15)
s2 = [1, 1, 1, 1, 1]
s3 = geom_series_x3(15)
s4 = geom_series(15)
t1 = poly_mul(s1, s2)[:15]
t2 = poly_mul(t1, s3)[:15]
t3 = poly_mul(t2, s4)[:15]
print(f"Bài 24 coeff of x^15: {t3[12]}")

# Bài 25:
# coeff of x^10 in (1+x+x^2+x^3+x^4)^5
p25 = [1, 1, 1, 1, 1]
res25 = poly_pow(p25, 5)
print(f"Bài 25 coeff of x^10: {res25[10]}")

# Bài 27:
# coeff of x^12 in (x + x^2 + x^3 + x^4)^4
# which is coeff of x^8 in (1 + x + x^2 + x^3)^4
p27 = [1, 1, 1, 1]
res27 = poly_pow(p27, 4)
print(f"Bài 27 coeff of x^12: {res27[8]}")

# Bài 29:
# coeff of x^12 in 1/((1-x)(1-x^2)(1-x^3))
s_29_1 = geom_series(13)
s_29_2 = geom_series_x2(13)
s_29_3 = geom_series_x3(13)
t_29 = poly_mul(s_29_1, s_29_2)[:13]
res_29 = poly_mul(t_29, s_29_3)[:13]
print(f"Bài 29 coeff of x^12: {res_29[12]}")

# Bài 31:
# coeff of x^5 in (1 + 2*x - 3*x^2)^8
p31 = [1, 2, -3]
res31 = poly_pow(p31, 8)
print(f"Bài 31 coeff of x^5: {res31[5]}")

# Bài 35 for n=8:
subsets_div3 = 0
for i in range(1 << 8):
    s = sum(j + 1 for j in range(8) if (i & (1 << j)))
    if s % 3 == 0:
        subsets_div3 += 1
print(f"Bài 35 for n=8: {subsets_div3}")
