import math

def solve_seating(R, E, G, F):
    print(f"\nSolving for R={R}, E={E}, G={G}, F={F}")
    print("----------------------------------------")
    solutions = []
    
    # We discuss based on x + z + t <= F. Since F is small (e.g., 2), we can iterate x, z, t first.
    for x in range(F + 1):
        for z in range(F + 1 - x):
            for t in range(F + 1 - x - z):
                w = F - x - z - t
                min_y = max(0, E + G + F - R - 2*x - z - t)
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
                    ways = ways_rows * ways_seats
                    
                    solutions.append({
                        'x': x, 'y': y, 'z': z, 't': t,
                        'u': u, 'v': v, 'w': w, 'o': o,
                        'ways_rows': ways_rows,
                        'ways_seats': ways_seats,
                        'ways': ways
                    })
                    print(f"x={x}, y={y}, z={z}, t={t} | u={u}, v={v}, w={w}, o={o} | rows={ways_rows}, seats={ways_seats} | product={ways}")
                    
    total_arrangements = sum(sol['ways'] for sol in solutions)
    ans = total_arrangements * math.factorial(E) * math.factorial(G) * math.factorial(F) * math.factorial(3*R - E - G - F)
    total_ways = math.factorial(3*R)
    prob = ans / total_ways
    print(f"Total seat configurations (sum): {total_arrangements}")
    print(f"Total student arrangements: {ans}")
    print(f"Total possible arrangements: {total_ways}")
    print(f"Probability p = {prob}")
    print(f"10000p = {prob * 10000:.6f} -> round to {round(prob * 10000)}")

# Run for a hard problem:
solve_seating(8, 6, 4, 3)
