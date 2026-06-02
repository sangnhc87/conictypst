def count_trapezoids(n):
    # Vertices are 0, 1, ..., n-1
    # Represent vertices by angles 2*pi*i/n
    # Four vertices (a, b, c, d) in clockwise order form a trapezoid if chord ab is parallel to cd,
    # or ad is parallel to bc.
    # Since they are inscribed in a circle, chords are parallel iff they subtend equal arcs.
    # Clockwise order: a < b < c < d
    # Parallel chords:
    # Option 1: ab || cd. This means arc ad = arc bc (or chord ad = chord bc).
    # Since order is a, b, c, d, the distance along the circle:
    # (d - a) % n == (c - b) % n is not the right condition because it's the remaining arcs.
    # The condition for chords (a,b) and (d,c) (with order a < b < c < d) to be parallel is:
    # (a + b) % n == (c + d) % n.
    # Let's verify: the midpoint of arc ab is (a+b)/2, and the midpoint of arc cd is (c+d)/2.
    # They are parallel iff they share the same perpendicular bisector, i.e., their midpoints are either equal or opposite.
    # Since a, b, c, d are distinct, if (a+b)%n == (c+d)%n, they share the same axis of symmetry.
    # If they are parallel, it's a trapezoid. If they also have (b+c)%n == (d+a)%n, it's a rectangle (two pairs of parallel sides).
    # Let's count them!
    
    total_quads = 0
    trapezoids = 0
    rectangles = 0
    squares = 0
    
    import itertools
    for combo in itertools.combinations(range(n), 4):
        a, b, c, d = sorted(combo)
        # Check if ab || cd: (a + b) % n == (c + d) % n
        # Check if ad || bc: (a + d) % n == (b + c) % n
        # Note: since a < b < c < d, chords are (a, d) and (b, c) (which can be parallel, meaning (a+d)%n == (b+c)%n)
        # or chords are (a, b) and (c, d) (which can be parallel, meaning (a+b)%n == (c+d)%n)
        # Note that chords (a,c) and (b,d) intersect, so they cannot be parallel.
        
        p1 = (a + b) % n == (c + d) % n
        p2 = (a + d) % n == (b + c) % n
        
        if p1 or p2:
            trapezoids += 1
            if p1 and p2:
                rectangles += 1
                # Check if square:
                # In a square, the vertices are spaced by n/4.
                if (b - a) == n//4 and (c - b) == n//4 and (d - c) == n//4:
                    squares += 1
                    
    return {
        "trapezoids": trapezoids,
        "rectangles": rectangles,
        "squares": squares,
        "only_trapezoids_not_rect": trapezoids - rectangles
    }

# Test for some values of n
for n in range(4, 17):
    res = count_trapezoids(n)
    print(f"n = {n}: {res}")
    # Let's check formulas
    # Formula for rectangles: for even n: C(n/2, 2)
    if n % 2 == 0:
        rect_formula = (n//2) * (n//2 - 1) // 2
        print(f"  Rect Formula: {rect_formula} (Match: {rect_formula == res['rectangles']})")
        # Formula for squares: if n % 4 == 0: n/4
        if n % 4 == 0:
            sq_formula = n // 4
            print(f"  Square Formula: {sq_formula} (Match: {sq_formula == res['squares']})")
        # Formula in Typst for trapezoids:
        # n/2 * C((n-2)/2, 2) + (n/2 - 1) * C(n/2, 2)
        half_n = n // 2
        term1 = half_n * ((half_n - 1) * (half_n - 2) // 2) if half_n >= 2 else 0
        term2 = (half_n - 1) * (half_n * (half_n - 1) // 2)
        trap_formula = term1 + term2
        print(f"  Trap Formula (Typst): {trap_formula} (Match: {trap_formula == res['trapezoids']})")
    else:
        # For odd n: n * C((n-1)/2, 2)
        k = (n - 1) // 2
        trap_formula = n * (k * (k - 1) // 2)
        print(f"  Trap Formula (Typst): {trap_formula} (Match: {trap_formula == res['trapezoids']})")
