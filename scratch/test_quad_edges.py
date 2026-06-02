def count_quad_edges(n):
    import itertools
    import math
    
    total = math.comb(n, 4)
    c0 = 0 # 0 common edges
    c1 = 0 # exactly 1 common edge
    c2_adj = 0 # 2 common edges, adjacent
    c2_opp = 0 # 2 common edges, opposite (disjoint)
    c3 = 0 # exactly 3 common edges
    c4 = 0 # exactly 4 common edges
    
    for combo in itertools.combinations(range(n), 4):
        a, b, c, d = sorted(combo)
        # Check edges
        # The edges of the quadrilateral are (a,b), (b,c), (c,d), (d,a).
        # An edge is a common edge with the n-gon if the distance between the two vertices is 1 or n-1.
        e1 = 1 if (b - a) == 1 else 0
        e2 = 1 if (c - b) == 1 else 0
        e3 = 1 if (d - c) == 1 else 0
        e4 = 1 if (a - d) % n == 1 or (d - a) % n == 1 else 0
        
        common = e1 + e2 + e3 + e4
        
        if common == 0:
            c0 += 1
        elif common == 1:
            c1 += 1
        elif common == 2:
            # Check if the two common edges are adjacent
            # Adjacent means they share a vertex.
            # Common edges are indices: e1(a,b), e2(b,c), e3(c,d), e4(d,a)
            # Sharing a vertex:
            # e1 and e2 share b.
            # e2 and e3 share c.
            # e3 and e4 share d.
            # e4 and e1 share a.
            # So if common == 2, they are adjacent if they are (e1,e2), (e2,e3), (e3,e4), or (e4,e1).
            # They are opposite/disjoint if they are (e1,e3) or (e2,e4).
            if (e1 and e2) or (e2 and e3) or (e3 and e4) or (e4 and e1):
                c2_adj += 1
            else:
                c2_opp += 1
        elif common == 3:
            c3 += 1
        elif common == 4:
            c4 += 1
            
    return {
        "n": n,
        "total": total,
        "c0": c0,
        "c1": c1,
        "c2_adj": c2_adj,
        "c2_opp": c2_opp,
        "c2_total": c2_adj + c2_opp,
        "c3": c3,
        "c4": c4
    }

for n in range(5, 13):
    res = count_quad_edges(n)
    print(f"n={n}: {res}")
    
    # Formulas check:
    # 1. c4: Only 1 if n = 4, else 0 (since a quad cannot have 4 common edges with n-gon for n > 4 because it would be the n-gon itself, which is a quad only if n=4)
    # Wait, for n=4, combo is 4 vertices, common edges=4. For n > 4, c4 must be 0. Correct!
    # 2. c3: For a quadrilateral to have 3 common edges, it must be 4 consecutive vertices.
    # So for n >= 4, there are exactly n such quadrilaterals. Let's check:
    # For n=5: c3=5. For n=6: c3=6. Yes! So c3 = n.
    # 3. c2_adj (2 adjacent common edges):
    # This means 3 consecutive vertices, and the 4th vertex is non-adjacent.
    # There are n ways to choose the 3 consecutive vertices.
    # The 4th vertex must not be adjacent to either of the ends of the 3 consecutive vertices (to avoid 3 common edges),
    # and must not be one of the 3 vertices.
    # Let the 3 consecutive vertices be v1, v2, v3. The vertices kề them are v0 and v4.
    # So the 4th vertex cannot be v0, v1, v2, v3, v4.
    # Thus there are n - 5 choices for the 4th vertex.
    # So c2_adj = n * (n - 5).
    # Let's check:
    # n=5: 5 * 0 = 0. Indeed, c2_adj = 0.
    # n=6: 6 * 1 = 6. Indeed, c2_adj = 6.
    # n=7: 7 * 2 = 14. Indeed, c2_adj = 14.
    # n=8: 8 * 3 = 24. Indeed, c2_adj = 24.
    # Formula holds!
    # 4. c2_opp (2 disjoint common edges):
    # Select 2 disjoint edges of the n-gon.
    # Total ways to select 2 edges: C(n, 2).
    # Disjoint edges: subtract adjacent pairs. There are n adjacent pairs of edges.
    # So C(n, 2) - n = n(n-3)/2 ways to select 2 disjoint edges.
    # When we select 2 disjoint edges, we get 4 vertices. These 4 vertices form a quadrilateral.
    # Since the edges are disjoint, the other two edges of the quadrilateral are chords, not edges of the n-gon.
    # So they have exactly 2 common edges (disjoint).
    # Thus, c2_opp = n(n-3)/2 - n (wait, is it C(n,2) - n?)
    # Let's check:
    # n=5: 5*2/2 = 5. (Wait, C(5,2)-5 = 10-5 = 5. Program says c2_opp=0? Why?)
    # Ah! For n=5, two disjoint edges, say (0,1) and (2,3). If we select them, we get vertices 0, 1, 2, 3.
    # The fourth vertex of the n-gon is 4.
    # In the quadrilateral 0-1-2-3, the edges are (0,1), (1,2), (2,3), and (3,0).
    # Here, (0,1), (1,2), (2,3) are edges of the 5-gon! So it has 3 common edges, not 2 disjoint edges!
    # Why? Because (1,2) connects the two disjoint edges!
    # So we must subtract the cases where the two edges are "separated by only 1 vertex" or "adjacent".
    # Wait, the number of ways to choose 2 disjoint edges such that they are not adjacent and also not separated by exactly 1 vertex (which would mean they share a vertex or are connected by a single edge).
    # Actually, the vertices chosen are a < b < c < d.
    # The edges of the quad are (a,b), (b,c), (c,d), (d,a).
    # If they have exactly 2 disjoint common edges, it means either:
    # (a,b) and (c,d) are edges of the n-gon, but (b,c) and (d,a) are not.
    # This means b-a = 1, d-c = 1, c-b > 1, (a-d)%n > 1.
    # Let's count this!
    # Let x = c-b - 1 >= 1, y = (a-d)%n - 1 >= 1.
    # This is a vách ngăn problem!
    # We choose 2 blocks of 2 vertices: [a, a+1] and [c, c+1].
    # This is equivalent to choosing 2 items from n vertices where we group each chosen vertex with its successor.
    # Let's do stars and bars: we have 2 blocks of size 2, and n - 4 remaining vertices.
    # The number of ways to arrange 2 blocks of size 2 and n-4 blocks of size 1 in a circle is:
    # n / (n - 2) * C(n - 2, 2) = n(n-3)/2?
    # No, that's just choosing 2 non-adjacent vertices.
    # Wait! If we choose 2 non-adjacent vertices in a circle of size n-2 (which represents contracting the blocks), we get the formula:
    # Number of ways to choose 2 disjoint blocks of size 2 in a circle of size n:
    # It is n / (n-2) * C(n-2, 2) = n(n-3)/2.
    # But wait, this includes the case where the two blocks are adjacent? No, the blocks are [a, a+1] and [c, c+1].
    # If they were adjacent, they would overlap or touch. For example, if c = a+1, the blocks [a, a+1] and [a+1, a+2] overlap.
    # If c = a+2, they touch: [a, a+1] and [a+2, a+3]. Then the vertices are consecutive, which gives c3 = n.
    # So we must subtract the cases where they touch (which is c3 = n).
    # Therefore, c2_opp = n(n-3)/2 - n = n(n-5)/2.
    # Let's check:
    # n=5: 5*(0)/2 = 0. Program says c2_opp = 0. Match!
    # n=6: 6*(1)/2 = 3. Program says c2_opp = 3. Match!
    # n=7: 7*(2)/2 = 7. Program says c2_opp = 7. Match!
    # n=8: 8*(3)/2 = 12. Program says c2_opp = 12. Match!
    # n=9: 9*(4)/2 = 18. Program says c2_opp = 18. Match!
    # Yes! c2_opp = n(n-5)/2 for n >= 6.
    # So the total c2 (exactly 2 common edges) is:
    # c2 = c2_adj + c2_opp = n(n-5) + n(n-5)/2 = 3/2 * n(n-5).
    # Let's check:
    # n=6: 1.5 * 6 * 1 = 9. Program: c2_adj + c2_opp = 6 + 3 = 9. Match!
    # n=7: 1.5 * 7 * 2 = 21. Program: c2_adj + c2_opp = 14 + 7 = 21. Match!
    # n=8: 1.5 * 8 * 3 = 36. Program: c2_adj + c2_opp = 24 + 12 = 36. Match!
    # Formula holds perfectly! c2 = 3/2 * n(n-5) for n >= 5.
    # 5. c1 (exactly 1 common edge):
    # This means choosing 1 edge of the n-gon (n ways).
    # The other 2 vertices must be chosen such that they do not form any other common edges.
    # Let the chosen edge be [1, 2].
    # We must choose 2 other vertices from {3, 4, ..., n}.
    # To avoid other common edges:
    # - We cannot choose 3 or n (since that would make another common edge with 2 or 1).
    # - The 2 chosen vertices cannot be adjacent.
    # So we are choosing 2 non-adjacent vertices from {4, 5, ..., n-1}.
    # The size of this set is (n-1) - 4 + 1 = n-4.
    # Choosing 2 non-adjacent vertices from a linear path of size n-4:
    # The formula for choosing k non-adjacent items from a line of length L is C(L - k + 1, k).
    # Here L = n-4, k = 2. So the number of ways is C(n - 4 - 2 + 1, 2) = C(n - 5, 2) = (n-5)(n-6)/2.
    # Since there are n choices for the first edge, c1 = n * C(n-5, 2) = n(n-5)(n-6)/2.
    # Let's check:
    # n=5: c1 = 5 * C(0, 2) = 0. Program says c1 = 0. Match!
    # n=6: c1 = 6 * C(1, 2) = 0. Program says c1 = 0. Match!
    # n=7: c1 = 7 * C(2, 2) = 7. Program says c1 = 7. Match!
    # n=8: c1 = 8 * C(3, 2) = 24. Program says c1 = 24. Match!
    # n=9: c1 = 9 * C(4, 2) = 54. Program says c1 = 54. Match!
    # n=10: c1 = 10 * C(5, 2) = 100. Program: c1 = 100. Match!
    # Amazing! c1 = n(n-5)(n-6)/2 for n >= 6.
    # 6. c0 (0 common edges):
    # Euler's vách ngăn for circle:
    # c0 = n / (n - 4) * C(n - 4, 4) = n(n-5)(n-6)(n-7)/24.
    # Let's check:
    # n=8: c0 = 8/4 * C(4, 4) = 2. Program says c0 = 2. Match!
    # n=9: c0 = 9/5 * C(5, 4) = 9/5 * 5 = 9. Program says c0 = 9. Match!
    # n=10: c0 = 10/6 * C(6, 4) = 10/6 * 15 = 25. Program says c0 = 25. Match!
    # n=11: c0 = 11/7 * C(7, 4) = 11/7 * 35 = 55. Program says c0 = 55. Match!
    # n=12: c0 = 12/8 * C(8, 4) = 12/8 * 70 = 105. Program says c0 = 105. Match!
    # Perfect match!
    # Let's verify if c0 + c1 + c2 + c3 + c4 == total (for n >= 4):
    # Let's check for n=8:
    # total = 70.
    # c0 = 2
    # c1 = 24
    # c2_adj = 24
    # c2_opp = 12
    # c2 = 36
    # c3 = 8
    # c4 = 0
    # Sum: 2 + 24 + 36 + 8 = 70. Match!
