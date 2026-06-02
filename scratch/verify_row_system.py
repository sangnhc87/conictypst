import math

# We want to solve:
# x + y + z + t + u + v + w + o = 8
# x + y + z + u = 5
# x + y + t + v = 3
# x + z + t + w = 2
# with all variables >= 0 integers.

R = 8
E = 5
G = 3
F = 2

# We will iterate over all non-negative integers for x, y, z, t
# and solve for u, v, w, o:
# u = E - (x + y + z)
# v = G - (x + y + t)
# w = F - (x + z + t)
# o = R - x - y - z - t - u - v - w

total_arrangements = 0

for x in range(3): # x <= F = 2
    for y in range(6): # y <= E = 5
        for z in range(3): # z <= F = 2
            for t in range(3): # t <= F = 2
                u = E - (x + y + z)
                v = G - (x + y + t)
                w = F - (x + z + t)
                
                if u >= 0 and v >= 0 and w >= 0:
                    o = R - (x + y + z + t + u + v + w)
                    if o >= 0:
                        # Number of ways to assign row types:
                        # R! / (x! y! z! t! u! v! w! o!)
                        ways_rows = math.factorial(R) // (
                            math.factorial(x) * math.factorial(y) * math.factorial(z) *
                            math.factorial(t) * math.factorial(u) * math.factorial(v) *
                            math.factorial(w) * math.factorial(o)
                        )
                        # Number of ways to place E, G, F in each row type:
                        # type X (EGF): 3! = 6 ways
                        # type Y (EG): P_3^2 = 6 ways
                        # type Z (EF): P_3^2 = 6 ways
                        # type T (GF): P_3^2 = 6 ways
                        # type U (E): P_3^1 = 3 ways
                        # type V (G): P_3^1 = 3 ways
                        # type W (F): P_3^1 = 3 ways
                        # type O (empty): 1 way
                        # Product of ways: 6^(x + y + z + t) * 3^(u + v + w)
                        ways_seats = (6**(x + y + z + t)) * (3**(u + v + w))
                        
                        total_arrangements += ways_rows * ways_seats

# Multiply by student permutations
ans = total_arrangements * math.factorial(E) * math.factorial(G) * math.factorial(F) * math.factorial(14)
print("Total valid arrangements:", ans)
print("Ratio to total ways:", ans / math.factorial(24))
