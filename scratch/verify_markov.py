# Script to verify the mathematical correctness of various problems in the guide

def verify_2_3():
    # Problem 2.3: Binary strings of length n without "101"
    # Recurrence: x_n = 2 x_{n-1} - x_{n-2} + x_{n-3} for n >= 4
    # Base cases: x_1 = 2, x_2 = 4, x_3 = 7
    
    # Let's count by brute force
    def count_brute(n):
        count = 0
        for i in range(1 << n):
            s = bin(i)[2:].zfill(n)
            if "101" not in s:
                count += 1
        return count

    print("Problem 2.3 Verification:")
    x = [0, 2, 4, 7] # 1-indexed, x_0 is dummy
    for n in range(4, 11):
        xn = 2 * x[n-1] - x[n-2] + x[n-3]
        x.append(xn)
        brute = count_brute(n)
        print(f"n={n}: Recurrence={xn}, Brute={brute}, Match={xn == brute}")

def verify_2_4():
    # Problem 2.4: Numbers of length n from {0,1,2,3}, first digit not 0, no "123"
    # Recurrence: x_n = 4 x_{n-1} - x_{n-3} for n >= 4
    # Base cases: x_1 = 3, x_2 = 12, x_3 = 47
    
    def count_brute(n):
        count = 0
        for i in range(4**n):
            # represent in base 4
            digits = []
            temp = i
            for _ in range(n):
                digits.append(str(temp % 4))
                temp //= 4
            digits.reverse()
            if digits[0] == '0':
                continue
            s = "".join(digits)
            if "123" not in s:
                count += 1
        return count

    print("\nProblem 2.4 Verification:")
    x = [0, 3, 12, 47]
    for n in range(4, 9):
        xn = 4 * x[n-1] - x[n-3]
        x.append(xn)
        brute = count_brute(n)
        print(f"n={n}: Recurrence={xn}, Brute={brute}, Match={xn == brute}")

def verify_3_3():
    # Problem 3.3: Drunkard's walk. Starts at 2. Forward 1/3 (to cliff, i.e., 1), backward 2/3.
    # Wait, "xác suất 1/3 là bước tiến về phía bờ vực và 2/3 là bước lùi ra xa"
    # Let's define coordinate: 0 is cliff. Starts at 2.
    # Forward to cliff is -1 in coordinate (towards 0).
    # Backward is +1 in coordinate (away from 0).
    # So P(k -> k-1) = 1/3, P(k -> k+1) = 2/3.
    # Cliff is at 0.
    # Paths of length 4 starting at 2, ending at 0 for the first time at step 4:
    # 2 -> 1 -> 2 -> 1 -> 0: prob = (1/3) * (2/3) * (1/3) * (1/3) = 2/81.
    # 2 -> 3 -> 2 -> 1 -> 0: prob = (2/3) * (1/3) * (1/3) * (1/3) = 2/81.
    # Total = 4/81.
    # Paths falling at or before step 4:
    # Fall at step 2: 2 -> 1 -> 0: prob = (1/3) * (1/3) = 1/9 = 9/81.
    # Fall at step 4: 4/81.
    # Total = 13/81.
    # Let's check with exact simulation
    paths_all = []
    def search(curr, path, prob):
        if len(path) == 5:
            paths_all.append((path, prob))
            return
        if curr == 0:
            # already fell, stays at 0 with prob 1
            search(0, path + [0], prob)
        else:
            # move left (toward 0) with prob 1/3
            search(curr - 1, path + [curr - 1], prob * (1/3))
            # move right with prob 2/3
            search(curr + 1, path + [curr + 1], prob * (2/3))

    search(2, [2], 1.0)
    
    fall_at_4 = 0
    fall_by_4 = 0
    for p, pr in paths_all:
        # p is list of 5 elements: p[0]=2, p[1], p[2], p[3], p[4]
        # check if it falls exactly at step 4 (meaning p[4] == 0 and p[0..3] > 0)
        if p[4] == 0 and all(x > 0 for x in p[:4]):
            fall_at_4 += pr
        # check if it is fell at step 4 (stays 0 at step 4)
        if p[4] == 0:
            fall_by_4 += pr

    print("\nProblem 3.3 Verification:")
    print(f"Fall exactly at 4: Calculated={4/81:.6f}, Simulated={fall_at_4:.6f}, Match={abs(fall_at_4 - 4/81) < 1e-9}")
    print(f"Fall by 4: Calculated={13/81:.6f}, Simulated={fall_by_4:.6f}, Match={abs(fall_by_4 - 13/81) < 1e-9}")

def verify_3_4():
    # Problem 3.4: Cube walk from A. Find number of paths of length 4 back to A.
    # Standard cube vertices. A is adjacent to B, D, A'.
    # Let's represent the cube as a graph.
    # Vertices: 0=A, 1=B, 2=D, 3=A', 4=C, 5=B', 6=D', 7=C'
    # Adjacency list:
    adj = {
        0: [1, 2, 3], # A -> B, D, A'
        1: [0, 4, 5], # B -> A, C, B'
        2: [0, 4, 6], # D -> A, C, D'
        3: [0, 5, 6], # A' -> A, B', D'
        4: [1, 2, 7], # C -> B, D, C'
        5: [1, 3, 7], # B' -> B, A', C'
        6: [2, 3, 7], # D' -> D, A', C'
        7: [4, 5, 6], # C' -> C, B', D'
    }
    
    # Let's count paths of length 4 from 0 back to 0
    count = 0
    paths = []
    def find_paths(curr, path):
        if len(path) == 5:
            if curr == 0:
                paths.append(path)
            return
        for neighbor in adj[curr]:
            find_paths(neighbor, path + [neighbor])
            
    find_paths(0, [0])
    print("\nProblem 3.4 Verification:")
    print(f"Paths of length 4 back to A: Count={len(paths)}, Calculated=21, Match={len(paths) == 21}")

def verify_4_1():
    # Problem 4.1: Knight walk on 8x8 grid starting at e4. 4 steps back to e4.
    # We want: 
    # - no backtracking (no two moves are opposite, meaning B != O and C != A)
    # - 4 locations form a square
    # Let's represent grid positions as (x, y). Start at (0, 0).
    # Knight moves: (dx, dy) in S = {(1,2), (1,-2), (-1,2), (-1,-2), (2,1), (2,-1), (-2,1), (-2,-1)}
    S = [(1,2), (1,-2), (-1,2), (-1,-2), (2,1), (2,-1), (-2,1), (-2,-1)]
    
    # Let's find all paths of length 4 back to (0,0)
    all_paths = []
    no_backtrack_paths = []
    square_paths = []
    
    def is_square(O, A, B, C):
        # The points are O=(0,0), A, B, C.
        # Check if they form a square.
        # Edges must be equal: OA = AB = BC = CO.
        # Since A-O is a knight move, OA^2 = 5.
        # So we check if AB^2 = 5, BC^2 = 5, CO^2 = 5.
        # Also, the diagonals must be equal: OB^2 = AC^2.
        # Also, adjacent edges must be perpendicular: (A - O) . (B - A) = 0.
        def dist2(p1, p2):
            return (p1[0] - p2[0])**2 + (p1[1] - p2[1])**2
        def dot(v1, v2):
            return v1[0]*v2[0] + v1[1]*v2[1]
            
        d_oa = dist2(O, A)
        d_ab = dist2(A, B)
        d_bc = dist2(B, C)
        d_co = dist2(C, O)
        
        if not (d_oa == 5 and d_ab == 5 and d_bc == 5 and d_co == 5):
            return False
            
        d_ob = dist2(O, B)
        d_ac = dist2(A, C)
        if d_ob != d_ac:
            return False
            
        v_oa = (A[0] - O[0], A[1] - O[1])
        v_ab = (B[0] - A[0], B[1] - A[1])
        if dot(v_oa, v_ab) != 0:
            return False
            
        return True

    for m1 in S:
        p1 = m1
        for m2 in S:
            p2 = (p1[0] + m2[0], p1[1] + m2[1])
            for m3 in S:
                p3 = (p2[0] + m3[0], p2[1] + m3[1])
                for m4 in S:
                    p4 = (p3[0] + m4[0], p3[1] + m4[1])
                    if p4 == (0, 0):
                        all_paths.append((p1, p2, p3))
                        # No backtracking means: p2 != (0,0) (i.e. m2 != -m1)
                        # and p3 != p1 (i.e. m3 != -m2)
                        # and p4 != p2 (i.e. m4 != -m3)
                        # wait, p4 is (0,0) and p2 is p2. Since p2 != (0,0) is checked, p4 != p2 is equivalent.
                        if p2 != (0,0) and p3 != p1:
                            no_backtrack_paths.append((p1, p2, p3))
                            if is_square((0,0), p1, p2, p3):
                                square_paths.append((p1, p2, p3))

    print("\nProblem 4.1 Verification:")
    print(f"Total paths back to e4: Count={len(all_paths)}, Guide=168, Match={len(all_paths) == 168}")
    print(f"No backtrack paths: Count={len(no_backtrack_paths)}, Guide=48, Match={len(no_backtrack_paths) == 48}")
    print(f"Square paths: Count={len(square_paths)}, Guide=16, Match={len(square_paths) == 16}")

verify_2_3()
verify_2_4()
verify_3_3()
verify_3_4()
verify_4_1()
