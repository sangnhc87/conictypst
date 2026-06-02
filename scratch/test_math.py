import math

def min_dist(F):
    steps = 100000
    m = 1e9
    best_t = 0
    for i in range(steps):
        t = i * 2 * math.pi / steps
        val = F(t)
        if val < m:
            m = val
            best_t = t
    return math.sqrt(m), best_t

def F32(t):
    return (6 - 2.5*math.cos(t))**2 + (2.5*abs(math.sin(t)) - 3)**2

def F33(t):
    return (6 - 3*math.cos(t))**2 + (math.sqrt(25 + 9*math.sin(t)**2) - 2)**2

def F34(t):
    return (4 - 5*math.sin(t))**2 + (math.sqrt((5*math.cos(t) - 8)**2 + 36) - 4)**2

def F41(t):
    d_sq = ((4*math.sin(t) - 6)/math.sqrt(2))**2
    mj2_sq = 34 - 24*math.sin(t)
    return mj2_sq + 4 - 4*math.sqrt(mj2_sq - d_sq)

def F42(t):
    d_sq = ((4*math.sin(t) - 6)/math.sqrt(2))**2
    mj2_sq = (4*math.cos(t) - 5)**2 + (4*math.sin(t) - 3)**2 + 9
    return mj2_sq + 4 - 4*math.sqrt(mj2_sq - d_sq)

def F43(t):
    g = 72 - 36*math.sqrt(3)*math.sin(t)
    h_sq = 9*math.sin(t)**2
    return g + 4 - 4*math.sqrt(g - h_sq)

def FBai7(t):
    return (3 - 3*math.sin(t))**2 + (math.sqrt((3*math.cos(t) - 5)**2 + 144) - 4)**2

print(f"Mod 3.2: {min_dist(F32)}")
print(f"Mod 3.3: {min_dist(F33)}")
print(f"Mod 3.4: {min_dist(F34)}")
print(f"Mod 4.1: {min_dist(F41)}")
print(f"Mod 4.2: {min_dist(F42)}")
print(f"Mod 4.3 (Bài 13): {min_dist(F43)}")
print(f"Bài 7: {min_dist(FBai7)}")
