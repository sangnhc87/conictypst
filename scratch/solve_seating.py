import math

# Total ways to arrange 24 distinct students in 24 seats
total_ways = math.factorial(24)

# We want to find the number of ways to seat the students such that:
# - Each of the 8 rows of 3 seats has at most one E (Excellent, 5 students)
# - Each of the 8 rows of 3 seats has at most one G (Good, 3 students)
# - Each of the 8 rows of 3 seats has at most one F (Fair, 2 students)
# - The remaining seats are filled by the 14 Average (A) students.

# Let's count this by placing the E, G, F students first.
# Excellent: 5 students. They must be in 5 distinct rows.
# Good: 3 students. They must be in 3 distinct rows.
# Fair: 2 students. They must be in 2 distinct rows.

# Let's write a recursive generator/counter to be 100% correct, then find the formula.
# Represent the grid as 8 rows, each row has a list of occupied categories.
# We will place E, then G, then F.

def count_arrangements():
    # We can place E students:
    # 1. Choose 5 rows out of 8: C(8, 5) = 56 ways.
    # 2. In each of these 5 rows, choose 1 seat out of 3: 3^5 = 243 ways.
    # 3. Permute the 5 E students: 5! = 120 ways.
    # So for E: 56 * 243 * 120 = 1,632,960 ways.
    
    # Let's write a script to place E, G, F step by step and track the number of ways.
    # Let's use dynamic programming or simple recursion.
    # State: we have 8 rows. Each row can be represented by a state:
    # (has_E, has_G, has_F) - a tuple of booleans.
    # Initially all rows are (False, False, False).
    
    # Since rows are indistinguishable until we place students, but we can just use backtracking.
    # Actually, we can count the number of valid patterns of rows.
    # A row can have one of the following subsets of {E, G, F}:
    # - {} (empty of E, G, F)
    # - {E}
    # - {G}
    # - {F}
    # - {E, G}
    # - {E, F}
    # - {G, F}
    # - {E, G, F}
    # For a row with subset S, the number of ways to place these categories in the 3 seats (which are distinct) is:
    # If |S| = 0: 1 way (all 3 seats are empty of E,G,F - will be filled by A)
    # If |S| = 1: 3 ways (choose 1 of 3 seats)
    # If |S| = 2: 3 * 2 = 6 ways (choose 2 of 3 seats, order matters if we assign specific students, but let's assign student identities later or now.
    # Let's assign student identities as we go:
    # E: 5 students, G: 3 students, F: 2 students.
    # Let's place the E students first:
    # Choose 5 rows: C(8, 5) ways.
    # For each row, place 1 E student: 3 ways.
    # So we have 5 rows with E, and 3 rows with no E.
    # Now we place G students in 3 distinct rows.
    # Let's say we choose i rows from the 5 rows with E, and 3-i rows from the 3 rows with no E.
    # Here, i can be 0, 1, 2, 3.
    # Number of ways to choose these rows: C(5, i) * C(3, 3-i).
    # For each of the i rows (which already have E), the G student has 2 choices of seats.
    # For each of the 3-i rows (which don't have E), the G student has 3 choices of seats.
    # So the factor for seat choices is 2^i * 3^(3-i).
    # Now we have 8 rows, and for each row we know if it has E, G, or both.
    # Specifically:
    # - i rows have both E and G. (E_G)
    # - 5-i rows have E only. (E_only)
    # - 3-i rows have G only. (G_only)
    # - 3 - (3-i) = i rows have neither. (none)
    # Total rows = i + (5-i) + (3-i) + i = 8. (Correct!)
    
    # Now we place F students (2 students) in 2 distinct rows.
    # We choose 2 rows out of the 8 rows.
    # These 2 rows can be chosen from the 4 categories of rows:
    # - E_G: i rows. If we choose a row here, F student has 1 choice of seat (since E and G take 2 seats).
    # - E_only: 5-i rows. If we choose a row here, F student has 2 choices.
    # - G_only: 3-i rows. If we choose a row here, F student has 2 choices.
    # - none: i rows. If we choose a row here, F student has 3 choices.
    
    # Let's iterate over all possible choices of the 2 rows for F.
    # Let's write a python function to compute this sum.
    
    total_valid_placements = 0
    
    # Choose 5 rows for E:
    ways_E = math.comb(8, 5) * (3**5)
    
    for i in range(4): # i is the number of rows containing both E and G
        # Check if this configuration is possible:
        # We need to choose 3-i rows from the 3 rows with no E.
        # This requires 3-i <= 3 and 3-i >= 0, so i in [0, 3].
        ways_G_rows = math.comb(5, i) * math.comb(3, 3 - i)
        ways_G_seats = (2**i) * (3**(3 - i))
        ways_EG = ways_E * ways_G_rows * ways_G_seats
        
        # Now we choose 2 rows for F.
        # The available rows are:
        # Category 0 (E_G): i rows (capacity of each: 1 seat left for F)
        # Category 1 (E_only): 5-i rows (capacity: 2 seats left)
        # Category 2 (G_only): 3-i rows (capacity: 2 seats left)
        # Category 3 (none): i rows (capacity: 3 seats left)
        
        # We need to choose 2 distinct rows from the 8 rows.
        # Let's count all pairs of rows.
        # A pair can consist of:
        # - 2 rows from Category 0: C(i, 2) ways. F seats: 1 * 1 = 1
        # - 2 rows from Category 1: C(5-i, 2) ways. F seats: 2 * 2 = 4
        # - 2 rows from Category 2: C(3-i, 2) ways. F seats: 2 * 2 = 4
        # - 2 rows from Category 3: C(i, 2) ways. F seats: 3 * 3 = 9
        # - 1 row from 0, 1 from 1: i * (5-i) ways. F seats: 1 * 2 = 2
        # - 1 row from 0, 1 from 2: i * (3-i) ways. F seats: 1 * 2 = 2
        # - 1 row from 0, 1 from 3: i * i ways. F seats: 1 * 3 = 3
        # - 1 row from 1, 1 from 2: (5-i) * (3-i) ways. F seats: 2 * 2 = 4
        # - 1 row from 1, 1 from 3: (5-i) * i ways. F seats: 2 * 3 = 6
        # - 1 row from 2, 1 from 3: (3-i) * i ways. F seats: 2 * 3 = 6
        
        ways_F_choices = 0
        
        # Helper to compute combination
        def C(n, k):
            if n < k or k < 0:
                return 0
            return math.comb(n, k)
        
        # 2 from Cat 0
        ways_F_choices += C(i, 2) * 1
        # 2 from Cat 1
        ways_F_choices += C(5-i, 2) * 4
        # 2 from Cat 2
        ways_F_choices += C(3-i, 2) * 4
        # 2 from Cat 3
        ways_F_choices += C(i, 2) * 9
        
        # 1 from 0, 1 from 1
        ways_F_choices += i * (5-i) * 2
        # 1 from 0, 1 from 2
        ways_F_choices += i * (3-i) * 2
        # 1 from 0, 1 from 3
        ways_F_choices += i * i * 3
        
        # 1 from 1, 1 from 2
        ways_F_choices += (5-i) * (3-i) * 4
        # 1 from 1, 1 from 3
        ways_F_choices += (5-i) * i * 6
        # 1 from 2, 1 from 3
        ways_F_choices += (3-i) * i * 6
        
        total_valid_placements += ways_EG * ways_F_choices

    # Now multiply by student identities:
    # 5! for E, 3! for G, 2! for F, and 14! for the remaining Average students.
    total_valid_arrangements = total_valid_placements * math.factorial(5) * math.factorial(3) * math.factorial(2) * math.factorial(14)
    
    p = total_valid_arrangements / total_ways
    return total_valid_arrangements, p

valid_arr, p = count_arrangements()
print(f"Total valid arrangements: {valid_arr}")
print(f"Probability p: {p}")
print(f"10000p: {p * 10000:.6f}")
print(f"Rounded 10000p: {round(p * 10000)}")
