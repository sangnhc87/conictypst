import math

def min_dist(F):
    steps = 1000000
    m = 1e9
    for i in range(steps):
        t = i * 2 * math.pi / steps
        val = F(t)
        if val < m:
            m = val
    return math.sqrt(m)

# 1. Cấu hình 3.2: 
# C1: x=0, J1(0,0,4), R1=2.5 -> M(0, 2.5cost, 4+2.5sint)
# C2: y=6, J2(0,6,4), R2=3 -> P2: y=6
def f_32(t):
    # d(M, P2) = |2.5cos t - 6| = 6 - 2.5cos t
    # M_p = (0, 6, 4+2.5sint)
    # Mp J2 = 2.5|sint|
    return (6 - 2.5*math.cos(t))**2 + (2.5*abs(math.sin(t)) - 3)**2

# 2. Cấu hình 3.3: Vuông góc, lệch trục (Ví dụ 11)
# C1: x=0, J1(0,0,4), R1=3 -> M(0, 3cost, 4+3sint)
# P2: y=6, J2(5,6,4), R2=2
def f_33(t):
    # d(M, P2) = |3cost - 6| = 6 - 3cost
    # Mp = (0, 6, 4+3sint)
    # Mp J2 = sqrt(25 + 9sin^2t)
    return (6 - 3*math.cos(t))**2 + (math.sqrt(25 + 9*math.sin(t)**2) - 2)**2

# 3. Cấu hình 3.4: Vuông góc, lệch trục tổng quát (Ví dụ 12)
# C1: z=0, J1(0,0,0), R1=5 -> M(5cost, 5sint, 0)
# P2: y=4, J2(8,4,6), R2=4
def f_34(t):
    # d(M, P2) = |5sint - 4|
    # Mp = (5cost, 4, 0)
    # Mp J2 = sqrt((5cost-8)^2 + 36)
    return (4 - 5*math.sin(t))**2 + (math.sqrt((5*math.cos(t) - 8)**2 + 36) - 4)**2

# 4. Cấu hình 4.1: Nghiêng đồng trục (Ví dụ 15)
# C1: z=0, J1(0,0,0), R1=4 -> M(4cost, 4sint, 0)
# P2: y - z - 6 = 0. J2(0,3,-3), R2=2
def f_41(t):
    d_sq = ((4*math.sin(t) - 6)/math.sqrt(2))**2
    mj2_sq = 16*math.cos(t)**2 + (4*math.sin(t)-3)**2 + 9
    return mj2_sq + 4 - 4*math.sqrt(mj2_sq - d_sq)

# 5. Cấu hình 4.2: Nghiêng lệch trục (Ví dụ 16)
# C1: z=0, J1(0,0,0), R1=5 -> M(5cost, 5sint, 0)
# P2: y - z = 0. J2(0,4,4), R2=2 (Wait, y-z=0 -> J2(0,4,4) is on it since 4-4=0)
def f_42(t):
    d_sq = ((5*math.sin(t))/math.sqrt(2))**2
    mj2_sq = 25*math.cos(t)**2 + (5*math.sin(t)-4)**2 + 16
    return mj2_sq + 4 - 4*math.sqrt(mj2_sq - d_sq)

# 6. Cấu hình 4.3: Nghiêng lệch trục (Ví dụ 13)
# C1: z=0, J1(0,0,0), R1=6 -> M(6cost, 6sint, 0)
# P2: y - sqrt(3)z = 0. J2(0, 3sqrt(3), 3), R2=2
def f_43(t):
    d_sq = ((6*math.sin(t))/2)**2
    mj2_sq = 36*math.cos(t)**2 + (6*math.sin(t) - 3*math.sqrt(3))**2 + 9
    return mj2_sq + 4 - 4*math.sqrt(mj2_sq - d_sq)

# 7. Bài 7
# C1: z=0, J1(0,0,0), R1=3 -> M(3cost, 3sint, 0)
# P2: y=3. J2(5,3,12), R2=4
def f_b7(t):
    return (3 - 3*math.sin(t))**2 + (math.sqrt((3*math.cos(t)-5)**2 + 144) - 4)**2

print(f"Mod 3.2: {min_dist(f_32)}")
print(f"Mod 3.3: {min_dist(f_33)}")
print(f"Mod 3.4: {min_dist(f_34)}")
print(f"Mod 4.1: {min_dist(f_41)}")
print(f"Mod 4.2: {min_dist(f_42)}")
print(f"Mod 4.3: {min_dist(f_43)}")
print(f"Bài 7:   {min_dist(f_b7)}")
