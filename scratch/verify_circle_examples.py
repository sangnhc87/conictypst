import itertools

def solve_round_table(elements):
    # elements is a list of classes, e.g., ['A', 'A', 'B', 'B', 'C', 'C']
    n = len(elements)
    # We fix the first element of elements at position 0 to avoid rotational symmetry
    # Since elements are distinct people, let's represent them as (class, id)
    people = []
    counts = {}
    for c in elements:
        counts[c] = counts.get(c, 0) + 1
        people.append((c, f"{c}{counts[c]}"))
    
    # Fix people[0] at seat 0
    fixed_person = people[0]
    other_people = people[1:]
    
    valid_count = 0
    valid_arrangements = []
    
    for perm in itertools.permutations(other_people):
        arrangement = [fixed_person] + list(perm)
        # Check adjacent same class
        ok = True
        for i in range(n):
            p1 = arrangement[i]
            p2 = arrangement[(i + 1) % n]
            if p1[0] == p2[0]:
                ok = False
                break
        if ok:
            valid_count += 1
            valid_arrangements.append([p[1] for p in arrangement])
            
    return valid_count

print("2A, 2B, 2C:", solve_round_table(['A', 'A', 'B', 'B', 'C', 'C']))
print("3A, 2B, 2C:", solve_round_table(['A', 'A', 'A', 'B', 'B', 'C', 'C']))
