def count_runs(seq, char):
    runs = []
    current_run = 0
    for c in seq:
        if c == char:
            current_run += 1
        else:
            if current_run > 0:
                runs.append(current_run)
                current_run = 0
    if current_run > 0:
        runs.append(current_run)
    return runs

import itertools

def solve_ch2(nA, nB, kA, kB=None):
    # elements: nA A's and nB B's
    seq = ['A']*nA + ['B']*nB
    valid = 0
    for p in set(itertools.permutations(seq)):
        # check runs of A
        runsA = count_runs(p, 'A')
        ok = True
        if any(r > kA for r in runsA):
            ok = False
        if kB is not None:
            runsB = count_runs(p, 'B')
            if any(r > kB for r in runsB):
                ok = False
        if ok:
            valid += 1
    # Multiply by hoán vị học sinh phân biệt
    import math
    return valid * math.factorial(nA) * math.factorial(nB)

print("Ex 2.1 (3A, 3B, kA=2):", solve_ch2(3, 3, 2))
print("Ex 2.2 (4A, 3B, kA=2):", solve_ch2(4, 3, 2))
print("Ex 2.3 (4A, 5B, kA=2):", solve_ch2(4, 5, 2))
print("Ex 2.4 (3A, 4B, kA=2):", solve_ch2(3, 4, 2))
print("Ex 2.5 (3A, 4B, kA=2, kB=2):", solve_ch2(3, 4, 2, 2))
print("Ex 2.6 (3A, 3B, kA=2, kB=2):", solve_ch2(3, 3, 2, 2))
