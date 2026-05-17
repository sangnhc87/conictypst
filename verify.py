import math

def quad_simpson(f, a, b, n=1000):
    if n % 2 != 0: n += 1
    h = (b - a) / n
    s = f(a) + f(b)
    for i in range(1, n, 2):
        s += 4 * f(a + i * h)
    for i in range(2, n - 1, 2):
        s += 2 * f(a + i * h)
    return s * h / 3

def solve_bai10():
    def y_func(z):
        return math.sqrt((z + 0.3)/3)
    def S_func(z):
        return 2 * y_func(z)
    
    L = 5
    Q = 0.1
    z_min, z_max = 0, 0.9
    
    s0 = S_func(0)
    s09 = S_func(0.9)
    # Area S at z: S(z) = 2 * sqrt((z + 0.3)/3)
    
    vol_integral = quad_simpson(S_func, 0, 0.9)
    V_total = L * vol_integral
    t_full = V_total / Q
    
    t_target = 24
    V_target = Q * t_target
    
    low, high = 0, 0.9
    for _ in range(100):
        mid = (low + high) / 2
        v_mid = L * quad_simpson(S_func, 0, mid)
        if v_mid < V_target:
            low = mid
        else:
            high = mid
    k_sol = low
    
    print(f"Bai 10:")
    print(f"  S(0): {s0:.6f}, S(0.9): {s09:.6f}")
    print(f"  V_total: {V_total:.6f}")
    print(f"  t_full: {t_full:.6f}")
    print(f"  k at 24 min: {k_sol:.6f}")

def solve_bai11():
    def y_func(z):
        return math.sqrt(1 - z)
    def S_func(z):
        return 2 * y_func(z)
    
    L = 4
    Q = 0.08
    t_target = 48
    V_target = Q * t_target
    
    low, high = 0, 1.0
    for _ in range(100):
        mid = (low + high) / 2
        v_mid = L * quad_simpson(S_func, 0, mid)
        if v_mid < V_target:
            low = mid
        else:
            high = mid
    k_sol = low
    
    print(f"Bai 11:")
    print(f"  V_target: {V_target:.6f}")
    print(f"  k at 48 min: {k_sol:.6f}")

if __name__ == "__main__":
    solve_bai10()
    solve_bai11()
