import math

def solve_3_column(rows, E, G, F, A):
    total_seats = rows * 3
    total_students = E + G + F + A
    assert total_seats == total_students
    
    total_ways = math.factorial(total_seats)
    
    # Place E
    ways_E = math.comb(rows, E) * (3**E)
    
    total_valid_placements = 0
    # Overlap i between E and G
    min_i = max(0, E + G - rows)
    max_i = min(E, G)
    
    for i in range(min_i, max_i + 1):
        ways_G_rows = math.comb(E, i) * math.comb(rows - E, G - i)
        ways_G_seats = (2**i) * (3**(G - i))
        ways_EG = ways_E * ways_G_rows * ways_G_seats
        
        # Calculate sum of capacities sum C_u and sum C_u^2
        # C_u values:
        # i rows of capacity 1
        # E - i rows of capacity 2
        # G - i rows of capacity 2
        # rows - E - G + i rows of capacity 3
        
        # Sum of capacities (remaining seats)
        sum_C = total_seats - E - G
        # Sum of squares of capacities
        sum_C2 = i * 1 + (E - i) * 4 + (G - i) * 4 + (rows - E - G + i) * 9
        
        # S is the sum of C_u * C_v for u < v
        S = (sum_C**2 - sum_C2) // 2
        
        # Now we choose 2 rows for F.
        # The number of ways to choose the rows and seats for F is S.
        total_valid_placements += ways_EG * S
        
    total_valid_arrangements = total_valid_placements * math.factorial(E) * math.factorial(G) * math.factorial(F) * math.factorial(A)
    p = total_valid_arrangements / total_ways
    return total_valid_arrangements, p

# Problem 1: 8 rows, 5 E, 3 G, 2 F, 14 A
arr1, p1 = solve_3_column(8, 5, 3, 2, 14)
print(f"Problem 1 (8 rows): p = {p1:.6f}, 10000p = {p1*10000:.2f}, rounded = {round(p1*10000)}")

# Problem 2: 6 rows, 4 E, 3 G, 2 F, 9 A
arr2, p2 = solve_3_column(6, 4, 3, 2, 9)
print(f"Problem 2 (6 rows): p = {p2:.6f}, 10000p = {p2*10000:.2f}, rounded = {round(p2*10000)}")

# Problem 3: 7 rows, 5 E, 4 G, 2 F, 10 A
arr3, p3 = solve_3_column(7, 5, 4, 2, 10)
print(f"Problem 3 (7 rows): p = {p3:.6f}, 10000p = {p3*10000:.2f}, rounded = {round(p3*10000)}")
