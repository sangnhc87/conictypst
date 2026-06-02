def solve_example_10_new():
    import itertools
    count = 0
    students = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']
    # Grid 2x3:
    # 0 1 2
    # 3 4 5
    for p in itertools.permutations(students):
        bad = False
        # Rows:
        for (u, v) in [(0,1), (1,2), (3,4), (4,5)]:
            if p[u][0] == p[v][0]:
                bad = True
                break
        if bad: continue
        # Cols:
        for (u, v) in [(0,3), (1,4), (2,5)]:
            if p[u][0] == p[v][0]:
                bad = True
                break
        if bad: continue
        count += 1
    # Distinguish classes: A (2!), B (2!), C (2!)
    perm_factor = 2 * 2 * 2 # 8
    structures = count // perm_factor
    print(f"Example 10 New (2A, 2B, 2C in 2x3): {count} ways, structures: {structures}")

solve_example_10_new()
