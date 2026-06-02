# Brute force search for R=8, E=5, G=3, F=2
# We represent the placements as a list of rows.
# There are 8 rows. Each row is a tuple of 3 elements.
# The elements can be:
# E (1), G (2), F (4) or none.
# Since each row has at most one E, at most one G, at most one F:
# E can be at position 0, 1, 2 or not present.
# Similarly for G and F.

# Let's count the number of valid ways to place 5 E's, 3 G's, 2 F's.
# We can represent the row states as a subset of {E, G, F}.
# Each row has 8 possible subsets of {E, G, F}:
# 0: empty
# 1: {E}
# 2: {G}
# 3: {E, G}
# 4: {F}
# 5: {E, F}
# 6: {G, F}
# 7: {E, G, F}

# For each row state, the number of ways to arrange the students in the 3 seats of that row is:
# empty: 1
# {E}, {G}, {F}: 3
# {E, G}, {E, F}, {G, F}: 6
# {E, G, F}: 6

import itertools

# Let's count the row configurations.
# A row configuration is a list of 8 states (0 to 7) such that:
# State counts:
# x: count of 7
# y: count of 3
# z: count of 5
# t: count of 6
# u: count of 1
# v: count of 2
# w: count of 4
# o: count of 0

# And the total count of each student must be:
# E: x + y + z + u = 5
# G: x + y + t + v = 3
# F: x + z + t + w = 2
# R: x + y + z + t + u + v + w + o = 8

total_ways = 0

# Let's generate all possible lists of 8 states
# and check if they satisfy the counts.
states_ways = [1, 3, 3, 6, 3, 6, 6, 6] # ways for state 0, 1, 2, 3, 4, 5, 6, 7

# To be fast, let's just count using recursion or simple loops.
def count_ways(row_idx, e_left, g_left, f_left):
    if row_idx == 8:
        if e_left == 0 and g_left == 0 and f_left == 0:
            return 1
        return 0
        
    ans = 0
    # Try all 8 states for the current row
    # State 0: empty
    ans += count_ways(row_idx + 1, e_left, g_left, f_left) * 1
    
    # State 1: {E}
    if e_left > 0:
        ans += count_ways(row_idx + 1, e_left - 1, g_left, f_left) * 3
        
    # State 2: {G}
    if g_left > 0:
        ans += count_ways(row_idx + 1, e_left, g_left - 1, f_left) * 3
        
    # State 3: {E, G}
    if e_left > 0 and g_left > 0:
        ans += count_ways(row_idx + 1, e_left - 1, g_left - 1, f_left) * 6
        
    # State 4: {F}
    if f_left > 0:
        ans += count_ways(row_idx + 1, e_left, g_left, f_left - 1) * 3
        
    # State 5: {E, F}
    if e_left > 0 and f_left > 0:
        ans += count_ways(row_idx + 1, e_left - 1, g_left, f_left - 1) * 6
        
    # State 6: {G, F}
    if g_left > 0 and f_left > 0:
        ans += count_ways(row_idx + 1, e_left, g_left - 1, f_left - 1) * 6
        
    # State 7: {E, G, F}
    if e_left > 0 and g_left > 0 and f_left > 0:
        ans += count_ways(row_idx + 1, e_left - 1, g_left - 1, f_left - 1) * 6
        
    return ans

result = count_ways(0, 5, 3, 2)
print("Brute force result:", result)
