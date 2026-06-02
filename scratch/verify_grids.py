# Verification for Grid Walk Problems

def verify_4_2_and_4_3():
    # Grid steps: U=(0,1), D=(0,-1), L=(-1,0), R=(1,0)
    steps = [(0,1), (0,-1), (-1,0), (1,0)]
    
    # Let's count paths of length 4 and 6 back to (0,0) with no backtracking
    def search(curr, path, length, no_backtrack):
        if len(path) == length + 1:
            if curr == (0,0):
                return 1
            return 0
        
        count = 0
        for step in steps:
            nxt = (curr[0] + step[0], curr[1] + step[1])
            # check backtracking
            if no_backtrack and len(path) >= 2:
                # opposite of last step
                last_step = (path[-1][0] - path[-2][0], path[-1][1] - path[-2][1])
                if step[0] == -last_step[0] and step[1] == -last_step[1]:
                    continue
            count += search(nxt, path + [nxt], length, no_backtrack)
        return count

    # Brute force check with backtracking
    total_4 = search((0,0), [(0,0)], 4, False)
    noback_4 = search((0,0), [(0,0)], 4, True)
    total_6 = search((0,0), [(0,0)], 6, False)
    noback_6 = search((0,0), [(0,0)], 6, True)
    
    print("Grid Walk Verification:")
    print(f"Total paths of length 4 (with backtrack) back to O: Count={total_4}, Guide=36, Match={total_4 == 36}")
    print(f"No-backtrack paths of length 4 back to O: Count={noback_4}, Guide=8, Match={noback_4 == 8}")
    print(f"Total paths of length 6 (with backtrack) back to O: Count={total_6}, Guide=400, Match={total_6 == 400}")
    print(f"No-backtrack paths of length 6 back to O: Count={noback_6}, Guide=40, Match={noback_6 == 40}")

verify_4_2_and_4_3()
