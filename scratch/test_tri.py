def count_triangles(n):
    import itertools
    import math
    
    total_triangles = 0
    right = 0
    obtuse = 0
    acute = 0
    equilateral = 0
    isosceles = 0
    
    for combo in itertools.combinations(range(n), 3):
        total_triangles += 1
        a, b, c = sorted(combo)
        
        # Arc lengths between vertices:
        d1 = b - a
        d2 = c - b
        d3 = n - (c - a)
        
        # An angle is:
        # A = 180 * d2 / n (since it subtends arc d2?)
        # Actually, in a circle, the inscribed angle subtending an arc is proportional to the arc length of the remaining part.
        # Specifically, the angles of the triangle subtend the three arcs d1, d2, d3.
        # The angle opposite to arc d1 is proportional to d1: angle = 180 * d1 / n degrees.
        # The angles are 180 * d1 / n, 180 * d2 / n, 180 * d3 / n.
        # Therefore:
        # - The triangle is right-angled if one of the arcs is exactly n/2.
        # - The triangle is obtuse-angled if one of the arcs is strictly greater than n/2.
        # - The triangle is acute-angled if all arcs are strictly less than n/2.
        
        arcs = [d1, d2, d3]
        max_arc = max(arcs)
        
        if max_arc * 2 == n:
            right += 1
        elif max_arc * 2 > n:
            obtuse += 1
        else:
            acute += 1
            
        # Isosceles: at least two arcs are equal
        if d1 == d2 or d2 == d3 or d3 == d1:
            isosceles += 1
            if d1 == d2 == d3:
                equilateral += 1
                
    return {
        "total": total_triangles,
        "right": right,
        "obtuse": obtuse,
        "acute": acute,
        "isosceles": isosceles,
        "equilateral": equilateral
    }

for n in range(3, 17):
    res = count_triangles(n)
    print(f"n = {n}: {res}")
    
    # Formulas check
    # Equilateral: n/3 if n % 3 == 0 else 0
    eq_f = n // 3 if n % 3 == 0 else 0
    # Right: n/2 * (n - 2) if n % 2 == 0 else 0
    rt_f = (n // 2) * (n - 2) if n % 2 == 0 else 0
    # Obtuse:
    # If n is even: n * C((n-2)/2, 2)
    # If n is odd: n * C((n-1)/2, 2)
    if n % 2 == 0:
        k = (n - 2) // 2
        obt_f = n * (k * (k - 1) // 2)
    else:
        k = (n - 1) // 2
        obt_f = n * (k * (k - 1) // 2)
        
    # Isosceles:
    # If n is odd: n * (n-1)/2
    # If n is even: n * (n-2)/2
    # Let's verify:
    if n % 2 == 1:
        iso_f = n * (n - 1) // 2
    else:
        iso_f = n * (n - 2) // 2
        
    print(f"  Equilateral check: {eq_f == res['equilateral']}")
    print(f"  Right check: {rt_f == res['right']}")
    print(f"  Obtuse check: {obt_f == res['obtuse']}")
    print(f"  Isosceles check: {iso_f == res['isosceles']}")
    
    # Acute: total - right - obtuse
    ac_f = res['total'] - rt_f - obt_f
    print(f"  Acute check: {ac_f == res['acute']}")
