import math

def multinomial(n, counts):
    res = math.factorial(n)
    for c in counts:
        res //= math.factorial(c)
    return res

def partitions_of_identical_items(k):
    def get_partitions(n):
        if n == 0:
            return [[]]
        res = []
        for i in range(1, n + 1):
            for p in get_partitions(n - i):
                res.append([i] + p)
        return res

    partitions_raw = get_partitions(k)
    unique_partitions = sorted(list(set(tuple(sorted(p, reverse=True)) for p in partitions_raw)))
    
    result = []
    for p in unique_partitions:
        b = len(p)
        sign = (-1)**(k - b)
        result.append((p, sign))
    return result

def solve_pie(n_A, n_B, n_C=0, n_E=0):
    parts_A = partitions_of_identical_items(n_A) if n_A > 0 else [((), 1)]
    parts_B = partitions_of_identical_items(n_B) if n_B > 0 else [((), 1)]
    parts_C = partitions_of_identical_items(n_C) if n_C > 0 else [((), 1)]
    
    total_valid = 0
    
    for pA, sA in parts_A:
        for pB, sB in parts_B:
            for pC, sC in parts_C:
                pE = (1,) * n_E
                
                all_blocks = list(pA) + list(pB) + list(pC) + list(pE)
                total_blocks = len(all_blocks)
                
                entities = []
                for size in pA:
                    entities.append(('A', size))
                for size in pB:
                    entities.append(('B', size))
                for size in pC:
                    entities.append(('C', size))
                for size in pE:
                    entities.append(('E', size))
                
                from collections import Counter
                counts = Counter(entities)
                
                ways = multinomial(total_blocks, counts.values())
                
                term = sA * sB * sC * ways
                total_valid += term
                
    return total_valid

print("Ex 1 (3A, 2B):", solve_pie(3, 2))
print("Ex 2 (3A, 2B, 2C):", solve_pie(3, 2, 2))
print("Ex 3 (4A, 2B, 0C, 2E):", solve_pie(4, 2, 0, 2))
print("Ex 4 (8A, 3B, 2C, 3E):", solve_pie(8, 3, 2, 3))
