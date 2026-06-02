def count_no_common_edges(n, k):
    import itertools
    count = 0
    for combo in itertools.combinations(range(n), k):
        # Check if any two vertices are adjacent.
        # Vertices in sorted order: v_0 < v_1 < ... < v_{k-1}
        # Adjacent means (v_{i+1} - v_i) % n == 1 or (v_0 - v_{k-1}) % n == 1
        combo_sorted = sorted(combo)
        has_adj = False
        for i in range(k):
            v1 = combo_sorted[i]
            v2 = combo_sorted[(i+1) % k]
            if (v2 - v1) % n == 1:
                has_adj = True
                break
        if not has_adj:
            count += 1
    return count

for n in range(5, 17):
    for k in [3, 4]:
        if n >= 2*k:
            res = count_no_common_edges(n, k)
            # Formula: n / (n - k) * C(n - k, k)
            import math
            n_minus_k = n - k
            # C(n-k, k)
            c = math.comb(n_minus_k, k)
            f = (n * c) // n_minus_k
            print(f"n={n}, k={k}: Program={res}, Formula={f}, Match={res == f}")
