# Let's compare row configuration counts between brute force and system of equations.
import math
from collections import defaultdict

# In brute force, we can collect the count of each partition.
# A partition is a tuple of counts: (x, y, z, t, u, v, w, o)
# state 7 -> x
# state 3 -> y
# state 5 -> z
# state 6 -> t
# state 1 -> u
# state 2 -> v
# state 4 -> w
# state 0 -> o

partition_counts_bf = defaultdict(int)

def count_ways_collect(row_idx, e_left, g_left, f_left, current_counts):
    if row_idx == 8:
        if e_left == 0 and g_left == 0 and f_left == 0:
            # current_counts is a list of 8 states
            x = current_counts.count(7)
            y = current_counts.count(3)
            z = current_counts.count(5)
            t = current_counts.count(6)
            u = current_counts.count(1)
            v = current_counts.count(2)
            w = current_counts.count(4)
            o = current_counts.count(0)
            
            partition = (x, y, z, t, u, v, w, o)
            
            # ways for this state sequence is the product of states_ways
            states_ways = [1, 3, 3, 6, 3, 6, 6, 6]
            ways = 1
            for s in current_counts:
                ways *= states_ways[s]
            partition_counts_bf[partition] += ways
            return
        return

    # State 0: empty
    count_ways_collect(row_idx + 1, e_left, g_left, f_left, current_counts + [0])
    
    # State 1: {E}
    if e_left > 0:
        count_ways_collect(row_idx + 1, e_left - 1, g_left, f_left, current_counts + [1])
        
    # State 2: {G}
    if g_left > 0:
        count_ways_collect(row_idx + 1, e_left, g_left - 1, f_left, current_counts + [2])
        
    # State 3: {E, G}
    if e_left > 0 and g_left > 0:
        count_ways_collect(row_idx + 1, e_left - 1, g_left - 1, f_left, current_counts + [3])
        
    # State 4: {F}
    if f_left > 0:
        count_ways_collect(row_idx + 1, e_left, g_left, f_left - 1, current_counts + [4])
        
    # State 5: {E, F}
    if e_left > 0 and f_left > 0:
        count_ways_collect(row_idx + 1, e_left - 1, g_left, f_left - 1, current_counts + [5])
        
    # State 6: {G, F}
    if g_left > 0 and f_left > 0:
        count_ways_collect(row_idx + 1, e_left, g_left - 1, f_left - 1, current_counts + [6])
        
    # State 7: {E, G, F}
    if e_left > 0 and g_left > 0 and f_left > 0:
        count_ways_collect(row_idx + 1, e_left - 1, g_left - 1, f_left - 1, current_counts + [7])

count_ways_collect(0, 5, 3, 2, [])

# Now let's calculate the same using our formula:
# ways = R! / (x!y!z!t!u!v!w!o!) * 6^(x+y+z+t) * 3^(u+v+w)
partition_counts_formula = {}
R, E, G, F = 8, 5, 3, 2
for x in range(F + 1):
    for z in range(F + 1 - x):
        for t in range(F + 1 - x - z):
            w = F - x - z - t
            min_y = max(0, E + G + F - R - x - z - t)
            max_y = min(E - x - z, G - x - t)
            for y in range(min_y, max_y + 1):
                u = E - x - y - z
                v = G - x - y - t
                o = R - (x + y + z + t + u + v + w)
                
                ways_rows = math.factorial(R) // (
                    math.factorial(x) * math.factorial(y) * math.factorial(z) *
                    math.factorial(t) * math.factorial(u) * math.factorial(v) *
                    math.factorial(w) * math.factorial(o)
                )
                ways_seats = (6**(x + y + z + t)) * (3**(u + v + w))
                partition_counts_formula[(x, y, z, t, u, v, w, o)] = ways_rows * ways_seats

# Now compare
print("Comparing partitions:")
all_keys = set(partition_counts_bf.keys()) | set(partition_counts_formula.keys())
for k in sorted(all_keys):
    bf_val = partition_counts_bf[k]
    f_val = partition_counts_formula.get(k, 0)
    if bf_val != f_val:
        print(f"Partition {k}: BF={bf_val}, Formula={f_val}, Diff={bf_val - f_val}")
