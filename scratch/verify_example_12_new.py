def solve_example_12_new():
    import itertools
    # 3A, 3B, 2E in 2x4 grid
    # Positions:
    # 0 1 2 3
    # 4 5 6 7
    # Adjacent: (0,1), (1,2), (2,3), (4,5), (5,6), (6,7) (rows)
    # (0,4), (1,5), (2,6), (3,7) (cols)
    
    # Configuration 1: 2 columns of {A, B}, 1 of {A, E}, 1 of {B, E}
    # Permutations of columns: 4! / 2! = 12
    # Let's count how many ways to arrange distinct students for Config 1
    # Students: A1, A2, A3, B1, B2, B3, E1, E2 (treat E as empty/unlabeled)
    count_total = 0
    students = ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'E1', 'E2']
    for p in itertools.permutations(students):
        bad = False
        # Rows:
        for (u, v) in [(0,1), (1,2), (2,3), (4,5), (5,6), (6,7)]:
            if p[u][0] != 'E' and p[v][0] != 'E':
                if p[u][0] == p[v][0]:
                    bad = True
                    break
        if bad: continue
        # Cols:
        for (u, v) in [(0,4), (1,5), (2,6), (3,7)]:
            if p[u][0] != 'E' and p[v][0] != 'E':
                if p[u][0] == p[v][0]:
                    bad = True
                    break
        if bad: continue
        count_total += 1
    
    # Factor for distinguishing classes: A (3! = 6), B (3! = 6)
    # E is empty, so we divide by 2! = 2 (since E1 and E2 are identical empty seats)
    # Total distinct seating = count_total / 2
    # Let's classify each permutation by column types to see how each configuration contributes
    perm_factor = 6 * 6 * 2 # 72 (if we treat E as distinct for structures, wait)
    # Let's find count for each column configuration:
    config1_ways = 0
    config2_ways = 0
    
    for p in itertools.permutations(students):
        bad = False
        for (u, v) in [(0,1), (1,2), (2,3), (4,5), (5,6), (6,7)]:
            if p[u][0] != 'E' and p[v][0] != 'E' and p[u][0] == p[v][0]:
                bad = True
                break
        if bad: continue
        for (u, v) in [(0,4), (1,5), (2,6), (3,7)]:
            if p[u][0] != 'E' and p[v][0] != 'E' and p[u][0] == p[v][0]:
                bad = True
                break
        if bad: continue
        
        # Determine column types
        cols = []
        for i in range(4):
            col = sorted([p[i][0], p[i+4][0]])
            cols.append(tuple(col))
        
        # Sort cols to identify configuration
        cols_sorted = sorted(cols)
        # Config 1: 2 of ('A', 'B'), 1 of ('A', 'E'), 1 of ('B', 'E')
        # Config 2: 3 of ('A', 'B'), 1 of ('E', 'E')
        if cols_sorted.count(('A', 'B')) == 2:
            config1_ways += 1
        elif cols_sorted.count(('A', 'B')) == 3:
            config2_ways += 1
            
    print(f"Total ways: {count_total // 2}")
    print(f"Config 1 ways: {config1_ways // 2}, structures (unlabeled E, distinct A/B): {config1_ways // 72} * 36 = {config1_ways // 2}")
    # Wait, let's find the number of structures (where A, B, E are identical):
    struct_factor = 3! * 3! * 2! # 72
    print(f"Config 1 structures: {config1_ways // struct_factor}")
    print(f"Config 2 structures: {config2_ways // struct_factor}")

solve_example_12_new()
