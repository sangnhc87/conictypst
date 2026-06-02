import itertools

# We want to find the number of arrangements of 8 A's, 5 B's, 3 C's such that no two adjacent characters are identical.
# Since the number of elements is small, we can generate all permutations or do a simple backtracking/memoized DP.

def count_smirnov_dp():
    # DP state: (countA, countB, countC, last_char)
    # last_char: 0 for A, 1 for B, 2 for C, -1 for start
    memo = {}
    
    def solve(a, b, c, last):
        if a == 0 and b == 0 and c == 0:
            return 1
        state = (a, b, c, last)
        if state in memo:
            return memo[state]
        
        ans = 0
        if a > 0 and last != 0:
            ans += solve(a - 1, b, c, 0)
        if b > 0 and last != 1:
            ans += solve(a, b - 1, c, 1)
        if c > 0 and last != 2:
            ans += solve(a, b, c - 1, 2)
            
        memo[state] = ans
        return ans

    return solve(8, 5, 3, -1)

W_dp = count_smirnov_dp()
print(f"Number of Smirnov words from DP = {W_dp}")
